/* This simulates the evolution of a 2-D ising spin system under the Metropolis algorithm. For random number generation
 * it uses 'Lehmer random number generator' <http://www.cs.wm.edu/~va/software/park/park.html>which has got period 
 * 2,147,483,646. To compile you need the files rngs.c and rngs.h in your include path. For compiling with gcc, you must
 * link to math.h and curses.h also. The command is:  gcc ribbon.c -g -lcurses -lm
 */

#include<stdio.h>
#include<stdlib.h>
#include<math.h>
#include<time.h>
#include<curses.h>
#include<rngs.c>
#include<rngs.h>

#define Interaction 5.0
#define m 30
#define T 0.2
#define F -0.1
#define maxsteps 2000

int avg,num_avg;
bool take_avg;
bool show_avg;

int prev(int p);
int next(int q);
float myrand(float start,float end); 
int randint(int i,int j);
void draw(int arr[m][m],int,int,float);


void main(int argc, char *argv[])
{
	int n=m;
	float J=Interaction;
	PlantSeeds(-6);
	float t=T;
	int beta=1.0/t;
	int s=0;
	int H=0;
	float r1,dh=0;
	int step,num,i,j;
	double po,lo,k;
	int spinarray[m][n];

	/*Initial values of the spins*/
	for (i=0;i<m;i++)
	{
		for (j=0;j<n;j++)
		{
			r1=myrand(0,1);
			if (r1<=0.5)
			{
				spinarray[i][j]=-1;
				s--;
			}
			else 
			{
				spinarray[i][j]=1;
				s++;
			}
		}
	}

	/*For the ncurses display*/
	initscr();
	int flips = 0;
        start_color();noecho();
        init_pair(1,COLOR_RED,COLOR_BLACK); // 1:up spin
        init_pair(2,COLOR_GREEN,COLOR_BLACK); // -1: down spin
        draw(spinarray,0,s,t);
        int ch;
        keypad(stdscr, TRUE); // trap arrow keys and other special keys
        nodelay(stdscr, TRUE); // non-blocking I/O
	/*For the ncurses display*/

	for (step=0;;step++)
	{
		draw(spinarray,step,s,t);
		for (num=0;num<m*n;num++)
		{
			ch=getch();
			switch(ch)
			{
				case 'Q':
				case 'q':
					endwin();
					exit(0);
					break;
				case KEY_DOWN:
					if (t>0.4) t-=0.2;
					else t/=2;
					break;
				case KEY_UP:
					if (t>0.2) t+=0.2;
					else t*=2;
					break;
				case 'w':
					t+=0.02;
					break;
				case 's':
					t-=0.02;
					break;
				case 't':
					avg=0;
					num_avg=0;
					take_avg=1;
					show_avg=0;
					break;
				case 'y':
					take_avg=0;
					show_avg=1;
					break;
				case 'j':
					J*=-1;

				defaults:
					break;
			}
			if (take_avg==1)
			{
				avg+=s;
				num_avg++;
		//		printf("%d\t%d",avg,num_avg);
			}
			beta=1.0/t;

			i=randint(0,m-1);
			j=randint(0,n-1);
		//	if (i==m-1) addstr("Gotcha\n");
			dh=2*J*spinarray[i][j]*(spinarray[next(i)][j]+spinarray[i][next(j)]+spinarray[prev(i)][j]+spinarray[i][prev(j)]);

			if (dh<=0)
			{
				spinarray[i][j]*=-1;
				s+=2*spinarray[i][j];
		//		draw(spinarray,step,s,t);
			}
			else
			{
				if (exp(-1*beta*dh)>=myrand(0,1))
				{
					spinarray[i][j]*=-1;
					s+=2*spinarray[i][j];
		//		draw(spinarray,step,s,t);
				}
			}

		}

	}
}


int prev(int p)
{
	if (p!=0) return p-1;
	else return m-1;
}

int next(int p)
{
	if (p!=m-1) return p+1;
	else return 0;
}

float myrand(float start,float end) 
{
	return start+(Random())*(end-start);
}

int randint(int i,int j)
{
	return i+(int) ((j-i+1)*(Random()));
}

void draw(int myarray[m][m],int step,int spin,float temp) {
	int i,j,color;
	for(i=0;i<m;i++) {
		for(j=0;j<m;j++) {
			color = (myarray[i][j] == 1)? 1:2;
			addch('*'| COLOR_PAIR(color));
			// 215 is the character ×
			addch(' ');
		}
		addch('\n');
	}

	char str[50];
        sprintf(str,"Temperature = %f\tStep = %d\tSpin = %d\n",temp,step,spin); 
	addstr(str);
	addstr("Use UP/DOWN keys to change temperature\nPress q to quit simulation");
	
	if (take_avg==1)
	{
		char statement0[20]="\nAveraging on\n";
		addstr(statement0);
	}
	else
	{
		char statement0[20]="\nAveraging off\n";
		addstr(statement0);

	}

	if (show_avg==1)
	{
		char statement[80];
		sprintf(statement,"Time average of S = %d",(avg/num_avg));
		addstr(statement);
	}

	refresh();
	move(0,0);
}
