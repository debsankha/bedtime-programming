#include <stdio.h>
#include <curses.h>
#include <stdlib.h>
#include <time.h>
#include <math.h>

#define VERSION 0.11

#ifndef SIZE
	#define SIZE 40
#endif
#ifndef WAIT
	#define WAIT 100
#endif

void init(int[SIZE][SIZE]);
void draw(int[SIZE][SIZE], int, float);
int flip(int[SIZE][SIZE], float);

int main(int argc, char* argv[]) {
	srand(time(NULL));

	float T = 90; // default value of temperature
	if(argc == 1) {
	printf("Ising Model simulator\n");
	printf("enter temperature:");
	scanf("%f",&T);
	}
	else T = atof(argv[1]);
	if(T <= 0){ printf("ising: can't operate at absolute Zero or negative temperatures. sorry!\n"); exit(1);}

	int m[SIZE][SIZE]; // The matrix for the ising model
	init(m);
	initscr();int flips = 0;
	start_color();noecho();
	init_pair(1,COLOR_RED,COLOR_BLACK); // 1:up spin
	init_pair(2,COLOR_GREEN,COLOR_BLACK); // -1: down spin
	draw(m, flips, T);
	int ch;
	keypad(stdscr, TRUE); // trap arrow keys and other special keys
     	nodelay(stdscr, TRUE); // non-blocking I/O
     	for (;;) {
          if ((ch = getch()) == ERR) {
		usleep(WAIT);
		if(flip(m, T) == 1) {
			// only redraw if a change is made.
			flips++;
			draw(m, flips, T);
		}
          }
          else {
              switch(ch) {
		case 'Q':
		case 'q':
			endwin();
			exit(0);
			break;
		case KEY_DOWN:
			if(T>10) T-=5.0;
			draw(m, flips, T);
			break;
		case KEY_UP:
			T+=5.0;
			draw(m, flips, T);
			break;
		defaults:
			break;
		}
	}
     }	

	endwin();
}

void init(int m[SIZE][SIZE]) {
	int i,j;
	for(i=0; i < SIZE;i++) {
		for(j=0;j<SIZE;j++)
		m[i][j] = (rand() / ((double)RAND_MAX + 1)) > 0.5 ? 1: -1;
	}
}

int flip(int m[SIZE][SIZE], float T) {
	// Flips one electron's spin and calculates the energy change
	// pick an electron to flip first!
	int x,y;
	x = SIZE*(rand()/((double)RAND_MAX));
	y = SIZE*(rand()/((double)RAND_MAX));
	
	const int initial_spin = m[x][y];
	int final_spin = (initial_spin == -1)? 1:-1;
	
	// calculate sum of neigbours
	int l,r,b,u; 
	// left, right, bottom and up neighbours' coordinate
	// (only the coord which changes from the electron whose spin is being flipped)
	l = (x == 0)? SIZE-1:x-1; r = (x == SIZE-1)? 0: x+1;
	b = (y == SIZE-1)? 0:y+1; u = (y == 0)? SIZE-1: y-1;
	
	int neighbours = m[l][y] + m[r][y] + m[x][u] + m[x][b];
	
	int energy_delta = -(final_spin - initial_spin)*neighbours;
	if(energy_delta <= 0) {
		m[x][y] = final_spin;
		return 1;
	}
	float a = 1000/2.269;
//	float a = 1.38e-24;
	float k = 1.38e-23;
	if(energy_delta = 0) {
		float tp = exp(a*energy_delta/T)/(k*T);
		if(tp < (rand()/(double)RAND_MAX)) { m[x][y] = final_spin; return 1;}
	}
	return 0;

}
void draw(int m[SIZE][SIZE], int flips, float T) {
	int i,j,color;
	for(i=0;i<SIZE;i++) {
		for(j=0;j<SIZE;j++) {
			color = (m[i][j] == 1)? 1:2;
			addch('*'| COLOR_PAIR(color));
			// 215 is the character ×
			addch(' ');
		}
		addch('\n');
	}

	char str[50];
	sprintf(str, "%d flips so far at temperature %.2f K\n",flips, T);
	addstr(str);
	addstr("Use UP/DOWN keys to change temperature\nPress q to quit simulation");
	refresh();
	move(0,0);
}

