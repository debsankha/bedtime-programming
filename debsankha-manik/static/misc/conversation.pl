9:34 AM 
dibya: toke to pathiechhilam
 
me: ki ki fix korte hobe?
  
mane oi 12-ta file pore bojha amar pokhhe ektu impossible
 
dibya: fix kichhui korte hobe na....ota link gulo toiri kore chhere dichhe....toke oi link gulo base kore rule assert korar program ta likhte hobe
9:35 AM 
me: ohh
  
link banabar exact procedure ta ki?
9:36 AM 
dibya: dara...ektu mone kori....
  
achha most probably erokom.....
  
prothome start program ta je list gulo pachhe tar sublists toiri korchhe
  
seta bujhechhish to?
  
ar argument gulo bujhechhish?
9:37 AM 
me: sublist na partition
9:38 AM 
dibya: na na partition noy, generate_supersets.pl er start er kotha bolchhi
 
me: ok
9:39 AM 
tarpar.
9:40 AM 
dibya: argument gulo bujhechhish.... i mean superset er argument gulo
9:42 AM 
me: na thik bujhini
 
dibya: Ex hochhe example number in the file example.pl starting from top
9:43 AM 
me: ok
9:44 AM 
dibya: tar porer argument gulo holo...in order....koto nombor list in that example.....size of the list....first_index(size) of sublist....generating order of sublist....and the sublist itself
  
ok?
 
me: ok.
 
dibya: achha once you get the sublists, ebar categorize file ta dekh
9:45 AM 
erom kichhu ekta assert hochhe
  
fact(ex(X),place(G,G1),size(A1,A2),first_index(B1,B2),second_index(C1,C2),lists(D1,D2),relations(Out)
  
etar mane bujhechhish?
9:46 AM 
me: no
 
dibya: achha dekh
9:47 AM 
tui ekta specific example er moddhe jota list chhilo tader sublist generate korli
 
me: ok
 
dibya: ebar tui all possible pairs of sublist dekhchhish
  
ar dekhchish memory file tate ki ki predicates er nam achhe
9:48 AM 
me: thik achhe
 
dibya: ei predicate gulo o ager je program ta...ota theke sikhechhe
  
ebar tui shei predicate gulor respect e ei sublist er pair gukor status check korchhish
  
answers can be either yes or no
  
thik achhe ei obdhi?
9:49 AM 
me: yes.
 
dibya: ok ei information ta tui fact predicate tate assert korchhish
  
fact(ex(X),place(G,G1),size(A1,A2),first_index(B1,B2),second_index(C1,C2),lists(D1,D2),relations(Out)
  
etar mane
9:51 AM 
X nombor example er G list er (jar size A1) tar je sublist tar first index B1 ar second-index C1, seta holo D1.....similarly D2 G1 nombor list er jonno
  
Out holo ekta list
  
say amader memory te ei jinish ta achhe
9:52 AM 
memory([first,third,delete,member])
  
tahole out er structure [yes, no, no, yes] hoya mane
  
achha dhor [yes,yes, no,yes], thik achhe?
9:53 AM 
tahole this means
  
member(D1,D2) returns yes
  
delete(D1,D2) returns yes
  
third(D1,D2) returns no
 
me: yes to what?
  
which predicate?
9:54 AM 
oh ok
 
dibya: right
  
and first(D1,D2) returns yes
  
lokkho kor order ta ulte gechhe
  
ota just coding er sunidher jonno
9:55 AM 
eto obdhi bojha gelo?
 
me: yes
 
dibya: achha ebar link file ta dekh
9:56 AM 
me: dekhchhi
 
dibya: first amra bolchhi je amra example er first place ta variable rakhbo
9:57 AM 
onno kothao ei predicate take variable diye call kora jabe na
9:58 AM 
me: seta kothai bolchhe exactly?
 
dibya: dekh amra partition take first list tar opor use korechhi
9:59 AM 
infact ei gota jinish tai baki gulo theke first list take create korar chesta
 
me: ok
10:00 AM 
dibya: achha tarpor amra ekta example niye first list tar all possible partitions create korchhi
  
dhor partition ta eirokom A gets decomposed into A1,A2,A3
10:01 AM 
the only instantiated lists we have when quering for a variable A is the other lists in the example.
  
right?
10:02 AM 
or better to say other lists in the query.
 
me: kon query -tar kotha bolchho
10:03 AM 
dibya: mane dhor tui oke delete sekhachhish
  
example achhe erom kichhu
  
delete([a,b,c],[a,b,c,d],[d]).
  
to tui jokhon bhobisshote kokhono erom kichhu ekta query korbi
10:04 AM 
lyk
  
delete(X,[a,b,c,f,g],[f]).
  
tokhon X toiri korar shob info i oke ultimately [a,b,c,f,g] and [f] theke nite hobe
  
cause these are the only lists which are instantiated in the query
10:05 AM 
bojha jachhe?
10:06 AM 
kothat geli??
10:07 AM 
???????????????????????????
 
me: what?
 
dibya: bujhli ki bollam??/
 
me: ha ha
10:08 AM 
dibya: ok seta bolbi to
  
ha tarpor
10:09 AM 
to amra ebar dekhbo ei partition er element gulo ke kikore momory r predicate ar given list gulo diye instantiate kora jay
  
to amra duto chain toiri korbo
  
number 1
  
starts from the instantiated list A in the example and goes to the element of the partition
10:10 AM 
number 2
  
goes from the element of the partition and ends at either of the other instantiated lists
  
list_wid_self holo number 1
10:11 AM 
list_wid_others holo number 2
10:12 AM 
me: ok
 
dibya: ei chain gulo peye gele ebar in principle chain er predicates gulo ke kaje lagiye tui partition er individula gulo ke instantiate korte parbi (number 2) and using number 1 you can specify the relation of the element of the partition to the unknown list A
  
ok?
10:13 AM 
me: suppose so
 
dibya: now tor kaaj hochhe ei chain er predicates er modhhe patterns khoja and whenever possible recursive patterns pele proper rule ta assert kora
10:14 AM 
mane bhodro bhabe rule assert korar kajta..
 
me: wow!;)
  
Just a sec!!!
10:15 AM 
so what are the queries to get the links?
 
dibya: form_links.
10:16 AM 
kintu this particular file might need some modification....karon eta ami last moment e code korechhi and I have not really checked whether it works properly
  
file ta jothesto chhoto achhe....to tor bujhte osubidhe hoyar kotha noy
10:17 AM 
me: upto which point thikthat achhe?
10:18 AM 
dibya: the other files are allright
 
me: tahole exact steps gulo holo ei:
 
dibya: ei file tai toke ektu check kore dekhte hobe
 
me: [generate_supersets].
 
dibya: start.
  
[categorize].
10:19 AM 
categorize.
  
[link].
  
form_links.
 
me: achha .
  
bacha gelo.
 
dibya: kintu shon....examples.pl ekhono change korish na
 
me: keno?
 
dibya: karon ei particular process ta khub mamory intensive
  
to besh slow chole programs
10:20 AM 
try working with a single example
  
and see whether it works for that
  
tarpor onek examples dibi
  
ok?
  
ebar bol....tor khobor ki??
10:21 AM 
me: recursive rule banate atleast 2 examples to lagbei?
 
dibya: not necessarily....ekta common pattern tui partition er element gulor chain e pabi
10:22 AM 
seta thekei decide korte para uchit
  
but depends on you totally
  
tui duto niye korte chaile korte parish
 
me: ok
 
dibya: ami ar ei program gulo niye bok bok korte parchhi na
  
baap re
10:23 AM 
ekhane to poriye poriye pagol kore dichhe
  
onno kotha bol
 
me: Ami khub bored hochhi
 
dibya: keno?
  
keu nei?
 
me: yes
 
dibya: ekdom i keu nei??
 
me: sonali chole gelo
 
dibya: jani
10:24 AM 
ar keu nei?
 
me: achhe keu keu
 
dibya: jemon?
 
me: debanjan-da majhe majhe ase
 
dibya: good...and....those gals frm jaipur?
 
me: ami khoj nie dekhini
 
dibya: seki?????????????????/
10:25 AM 
me: osab kore kichhu hobe na
 
dibya: tai?
  
:-D
 
me: amar website launch korlam.
 
dibya: good....link de
 
me: http://debsankha-manik.appspot.com/
  
pore bhalo domain kinbo
  
apatoto google-e achhe
  
free
10:26 AM 
dibya: hay hay tor project publish kore diechhish!!!
 
me: kon project?
10:27 AM 
check the http://debsankha-manik.appspot.com/stat
  
http://debsankha-manik.appspot.com/stat
 
dibya: antaheen!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
10:28 AM 
me: well... u khow..antaheen proteekhha..my weakness
 
dibya: eto mosto boro bal tao bolto
 
me: kon bal
 
dibya: mosto boro bal
  
sridip pal
  
bdw sei mal ta eschhe porikhha dite
  
?
10:29 AM 
me: ami jani na
  
sunechhi precy te admission niechhe
 
dibya: really! That's great!
 
me: yeah it is
  
anyway.. tomar khobor ki?
10:30 AM 
dibya: arre...ekhane hurricane alert....hurricane at the coast of Brazil...nam Alex....going to hit us on Thursday morning.....byapok hobe
 
me: wow!
10:31 AM 
notun ar ki ki korle?
 
dibya: ei niye amit ar shibu ke dubar pulish e dorechhe!
  
:-D
 
me: keno?
  
??
 
dibya: she onek golpo....shibu ke to arektu hole zoo te chhere die ashto
  
eshe bolbo
10:32 AM 
me: seems to be a nice story!
 
dibya: ekhankar shobcheye interesting jinish holo amader supervisor ta
  
erom odbhut species jonmalo kikore setai ekta proshno
 
me: ki korechhe?
10:33 AM 
dibya: seo onek boro golpo...ar ami bolte chaichhi na...tar karon eshob golpo amit na bolle mojai hoy na
  
or kach theke sunish
 
me: achha
10:34 AM 
kothao ghurte jaoni?
 
dibya: institute e ekhon notun admission cholchhe
  
na?
 
me: hobe hoito..
  
insti ar jai na
  
sonali dakle jetam
 
dibya: ar shon ami jokhon shomoy pachhi ektu ektu kore project report likhchhi
10:35 AM 
to shesh hole toke pathiye debo...you know what to do
  
tui ki tahole ekhon ghorei settled?
 
me: ekhane onner grade card debe na
  
SKD bole diechje
  
tomake esei korte hobe
10:36 AM 
dibya: pagol naki....grade card keno nibi....ami toke ekta pathiye debo....tui sudhu iiser letterhead e ekta print niye soi kore dite bolbi
10:37 AM 
me: setao debe na
  
ami bolechhilam vineet-er jonno
  
bolchhe ota pore pathaleo cholbe
  
KVPY won't mind
10:38 AM 
dibya: debe...skd amake nije bolechhe..ami tor nam o bole eschhilam...ami prochondo emo die ekta mail pathiye dichhi...die debe
  
hopefully i mean
  
tobe kichhui bola jay na....iiser to
 
me: dekho chesta kore
10:39 AM 
dibya: ekhane prof ra eshe kitchen porishkar korate hat lagae
  
khub dangerous
 
me: prof apartment-e ase keno?
 
dibya: dekhte ashe amra thikthak achhi kina....kichhu oprishkar thakle shonge shonge kaj e neme pore
10:40 AM 
bollam to...oti dangerous
 
me: really
 
dibya: ya i knw
  
any way tui besh kichhu bhalo movie dwnload kore rakhish
 
me: ami aj alice in wonderland dekhte jachhi
 
dibya: aaj?
 
me: yes
 
dibya: oh sorry
 
me: why sorry?
 
dibya: ekhane rat....guliye phelechhilam
10:41 AM 
ha ja bolchhilam tui bhalo movie download kore rakhish.....
 
me: tinte awesome film namiechhi
 
dibya: esp something by rituporno
  
ki ki??
 
me: krystof kieslowski-r
  
three colors-white ar blue
 
dibya: good.....
 
me: ar Double life of Veronique
10:42 AM 
dibya: ha tor list e dekhlam
  
aro namate thak
  
ami ekhon katlum
  
ok?
  
dinner khabo
 
me: okay
 
dibya: tata
 
me: godd night
 
dibya: good morning!
