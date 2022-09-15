À
dC:\Users\√ñmer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\App.xaml.cs
	namespace 	!
EASYTelegramSignalBot
 
{ 
public 

partial 
class 
App 
: 
Application *
{		 
}

 
} â
hC:\Users\√ñmer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\AssemblyInfo.cs
[ 
assembly 	
:	 

	ThemeInfo 
( &
ResourceDictionaryLocation 
. 
None #
,# $&
ResourceDictionaryLocation 
. 
SourceAssembly -
)

 
]

 ó
lC:\Users\√ñmer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\Database\Context.cs
	namespace 	!
EASYTelegramSignalBot
 
.  
Database  (
{ 
public 

class 
Context 
: 
Models !
.! "
Context" )
{ 
private		  
ObservableCollection		 $
<		$ %
User		% )
>		) *
?		* +
_Users		, 2
{		3 4
get		5 8
;		8 9
set		: =
;		= >
}		? @
public

  
ObservableCollection

 #
<

# $
User

$ (
>

( )
Users

* /
{ 	
get 
{ 
if 
( 
_Users 
== 
null "
)" #
{ 
_Users 
= 
new   
ObservableCollection! 5
<5 6
User6 :
>: ;
(; <
)< =
;= >
base 
. 
Users 
. 
ForEachAsync +
(+ ,
x, -
=>. 0
_Users1 7
.7 8
Add8 ;
(; <
new< ?
User@ D
(D E
xE F
)F G
)G H
)H I
;I J
} 
return 
_Users 
; 
} 
} 	
public 
void 

DeleteUser 
( 
User #
user$ (
)( )
{ 	
base 
. 
Remove 
( 
user 
. 
GetOriginalEntity .
(. /
)/ 0
)0 1
;1 2
Users 
. 
Remove 
( 
user 
) 
; 
SaveChanges 
( 
) 
; 
} 	
public 
void 

CreateUser 
( 
User #
user$ (
)( )
{ 	
base   
.   
Add   
(   
user   
.   
GetOriginalEntity   +
(  + ,
)  , -
)  - .
;  . /
Users!! 
.!! 
Add!! 
(!! 
user!! 
)!! 
;!! 
SaveChanges"" 
("" 
)"" 
;"" 
}## 	
}$$ 
}%% Ó
mC:\Users\√ñmer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\Database\Database.cs
	namespace 	!
EASYTelegramSignalBot
 
.  
Database  (
{ 
public 

static 
class 

Connection "
{ 
private 
static 
DispatcherTimer &
refreshContextTimer' :
{; <
get= @
;@ A
setB E
;E F
}G H
public

 
static

 
Context

 
Context

 %
{

& '
get

( +
;

+ ,
set

- 0
;

0 1
}

2 3
private 
static 
void 
Refresh #
(# $
object$ *
sender+ 1
,1 2
	EventArgs3 <
e= >
)> ?
{ 	
Context 
= 
new 
Context !
(! "
)" #
;# $
} 	
static 

Connection 
( 
) 
{ 	
Context 
= 
new 
( 
) 
; 
refreshContextTimer 
=  !
new" %
DispatcherTimer& 5
{ 
Interval 
= 
new 
TimeSpan '
(' (
$num( )
,) *
$num+ ,
,, -
$num. /
)/ 0
} 
; 
refreshContextTimer 
.  
Tick  $
+=% '
new( +
EventHandler, 8
(8 9
Refresh9 @
)@ A
;A B
refreshContextTimer 
.  
Start  %
(% &
)& '
;' (
} 	
} 
} Ö
sC:\Users\√ñmer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\Database\Models\Context.cs
	namespace 	!
EASYTelegramSignalBot
 
.  
Database  (
.( )
Models) /
{ 
public 

class 
Context 
: 
	DbContext $
{ 
	protected 
override 
void 
OnConfiguring  -
(- .#
DbContextOptionsBuilder. E
optionsBuilderF T
)T U
{		 	
optionsBuilder

 
.

 
UseSqlServer

 '
(

' (
Settings

( 0
.

0 1
DatabaseSettings

1 A
.

A B$
DatabaseConnectionString

B Z
)

Z [
;

[ \
} 	
public 
Context 
( 
) 
{ 	!
CheckDatabaseSettings !
(! "
)" #
;# $
} 	
public 
void !
CheckDatabaseSettings )
() *
)* +
{ 	
if 
( 
Settings 
. 
DatabaseSettings )
.) *#
ResetDatabaseFirstStart* A
)A B
{ 
ResetDatabase 
( 
) 
;  
} 
else 
if 
( 
! 
Settings 
. 
DatabaseSettings /
./ 0#
IsDatabaseEnsureCreated0 G
)G H
{ 
CreateDatabase 
( 
)  
;  !
} 
SaveChanges 
( 
) 
; 
} 	
public 
void 
CreateDatabase "
(" #
)# $
{ 	
Database   
.   
EnsureCreated   "
(  " #
)  # $
;  $ %
Settings!! 
.!! $
SetDatabaseEnsureCreated!! -
(!!- .
)!!. /
;!!/ 0
Console"" 
."" 
	WriteLine"" 
("" 
$str"" 4
)""4 5
;""5 6
}## 	
public%% 
void%% 
ResetDatabase%% !
(%%! "
)%%" #
{&& 	
Database'' 
.'' 
EnsureDeleted'' "
(''" #
)''# $
;''$ %
Settings(( 
.(( 
DatabaseResetted(( %
(((% &
)((& '
;((' (
Console)) 
.)) 
	WriteLine)) 
()) 
$str)) i
)))i j
;))j k
Console** 
.** 
ReadKey** 
(** 
)** 
;** 
Environment++ 
.++ 
Exit++ 
(++ 
$num++ 
)++ 
;++  
},, 	
public.. 
DbSet.. 
<.. 
Entities.. 
... 
User.. "
>.." #
Users..$ )
{..* +
get.., /
;../ 0
set..1 4
;..4 5
}..6 7
}00 
}11 ¶
yC:\Users\√ñmer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\Database\Models\Entities\User.cs
	namespace 	!
EASYTelegramSignalBot
 
.  
Database  (
.( )
Models) /
./ 0
Entities0 8
{ 
public 

class 
User 
{ 
public 
int 
Id 
{ 
get 
; 
set  
;  !
}" #
public		 
string		 
?		 
Username		 
{		  !
get		" %
;		% &
set		' *
;		* +
}		, -
public

 
long

 
ChatId

 
{

 
get

  
;

  !
set

" %
;

% &
}

' (
public 
bool 
TDI 
{ 
get 
; 
set "
;" #
}$ %
public 
bool 
PAC 
{ 
get 
; 
set "
;" #
}$ %
public 
bool 
News 
{ 
get 
; 
set  #
;# $
}% &
public 
DateTime 
? 
NewsExpiryDate '
{( )
get* -
;- .
set/ 2
;2 3
}4 5
public 
string 
? 
TDISymbolValues &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
public 
string 
? 
PACSymbolValues &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
public 
User 
( 
string 
Username #
)# $
{ 	
this 
. 
Username 
= 
Username $
;$ %
ChatId 
= 
$num 
; 
TDI 
= 
false 
; 
PAC 
= 
false 
; 
News 
= 
false 
; 
NewsExpiryDate 
= 
null !
;! "
TDISymbolValues 
= 
$str "
;" #
PACSymbolValues 
= 
$str "
;" #
} 	
}   
}!! ç<
pC:\Users\√ñmer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\Database\Models\User.cs
	namespace 	!
EASYTelegramSignalBot
 
.  
Database  (
.( )
Models) /
{ 
public 

class 
User 
: "
INotifyPropertyChanged .
{		 
public

 
event

 '
PropertyChangedEventHandler

 0
?

0 1
PropertyChanged

2 A
;

A B
private 
Entities 
. 
User 
user "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
string 
? 
Username 
{ 	
get 
=> 
user 
. 
Username  
;  !
set 
{ 
user 
. 
Username 
=  !
value" '
;' (
PropertyChanged) 8
?8 9
.9 :
Invoke: @
(@ A
thisA E
,E F
newG J
(J K
nameofK Q
(Q R
UsernameR Z
)Z [
)[ \
)\ ]
;] ^
}_ `
} 	
public 
long 
ChatId 
{ 	
get 
=> 
user 
. 
ChatId 
; 
set 
{ 
user 
. 
ChatId 
= 
value  %
;% &
PropertyChanged' 6
?6 7
.7 8
Invoke8 >
(> ?
this? C
,C D
newE H
(H I
nameofI O
(O P
ChatIdP V
)V W
)W X
)X Y
;Y Z
}[ \
} 	
public 
bool 
TDI 
{ 	
get 
=> 
user 
. 
TDI 
; 
set 
{ 
user 
. 
TDI 
= 
value "
;" #
PropertyChanged$ 3
?3 4
.4 5
Invoke5 ;
(; <
this< @
,@ A
newB E
(E F
nameofF L
(L M
TDIM P
)P Q
)Q R
)R S
;S T
}U V
} 	
public 
bool 
PAC 
{   	
get!! 
=>!! 
user!! 
.!! 
PAC!! 
;!! 
set"" 
{"" 
user"" 
."" 
PAC"" 
="" 
value"" "
;""" #
PropertyChanged""$ 3
?""3 4
.""4 5
Invoke""5 ;
(""; <
this""< @
,""@ A
new""B E
(""E F
nameof""F L
(""L M
PAC""M P
)""P Q
)""Q R
)""R S
;""S T
}""U V
}## 	
public%% 
bool%% 
News%% 
{&& 	
get'' 
=>'' 
user'' 
.'' 
News'' 
;'' 
set(( 
{(( 
user(( 
.(( 
News(( 
=(( 
value(( #
;((# $
PropertyChanged((% 4
?((4 5
.((5 6
Invoke((6 <
(((< =
this((= A
,((A B
new((C F
(((F G
nameof((G M
(((M N
News((N R
)((R S
)((S T
)((T U
;((U V
}((W X
})) 	
public++ 
DateTime++ 
?++ 
NewsExpiryDate++ '
{,, 	
get-- 
=>-- 
user-- 
.-- 
NewsExpiryDate-- &
;--& '
set.. 
{.. 
user.. 
... 
NewsExpiryDate.. %
=..& '
value..( -
;..- .
PropertyChanged../ >
?..> ?
...? @
Invoke..@ F
(..F G
this..G K
,..K L
new..M P
(..P Q
nameof..Q W
(..W X
NewsExpiryDate..X f
)..f g
)..g h
)..h i
;..i j
}..k l
}// 	
public11 

Dictionary11 
<11 
string11  
,11  !
DateTime11" *
>11* +

TDISymbols11, 6
{117 8
get119 <
;11< =
set11> A
;11A B
}11C D
public33 

Dictionary33 
<33 
string33  
,33  !
DateTime33" *
>33* +

PACSymbols33, 6
{337 8
get339 <
;33< =
set33> A
;33A B
}33C D
public55 
User55 
(55 
Entities55 
.55 
User55 !
user55" &
)55& '
{66 	
this77 
.77 
user77 
=77 
user77 
;77 

TDISymbols88 
=88 
new88 
(88 
)88 
;88 

PACSymbols99 
=99 
new99 
(99 
)99 
;99 
}:: 	
public<< 
User<< 
(<< 
string<< 
Username<< #
)<<# $
{== 	
user>> 
=>> 
new>> 
(>> 
Username>> 
)>>  
;>>  !

TDISymbols@@ 
=@@ 
new@@ 
(@@ 
)@@ 
;@@ 

PACSymbolsAA 
=AA 
newAA 
(AA 
)AA 
;AA 
}BB 	
publicDD 
voidDD 
UpdateUserSymbolsDD %
(DD% &
)DD& '
{EE 	

TDISymbolsFF 
=FF 
JsonConvertFF $
.FF$ %
DeserializeObjectFF% 6
<FF6 7

DictionaryFF7 A
<FFA B
stringFFB H
,FFH I
DateTimeFFJ R
>FFR S
>FFS T
(FFT U
userFFU Y
.FFY Z
TDISymbolValuesFFZ i
??FFj l
$strFFm q
)FFq r
??FFs u
newFFv y
(FFy z
)FFz {
;FF{ |

PACSymbolsGG 
=GG 
JsonConvertGG $
.GG$ %
DeserializeObjectGG% 6
<GG6 7

DictionaryGG7 A
<GGA B
stringGGB H
,GGH I
DateTimeGGJ R
>GGR S
>GGS T
(GGT U
userGGU Y
.GGY Z
PACSymbolValuesGGZ i
??GGj l
$strGGm q
)GGq r
??GGs u
newGGv y
(GGy z
)GGz {
;GG{ |
}HH 	
publicJJ 
voidJJ 
SaveUserSymbolsJJ #
(JJ# $
)JJ$ %
{KK 	
userLL 
.LL 
TDISymbolValuesLL  
=LL! "
JsonConvertLL# .
.LL. /
SerializeObjectLL/ >
(LL> ?

TDISymbolsLL? I
)LLI J
;LLJ K
userMM 
.MM 
PACSymbolValuesMM  
=MM! "
JsonConvertMM# .
.MM. /
SerializeObjectMM/ >
(MM> ?

PACSymbolsMM? I
)MMI J
;MMJ K
}NN 	
publicRR 
EntitiesRR 
.RR 
UserRR 
GetOriginalEntityRR .
(RR. /
)RR/ 0
{SS 	
returnTT 
userTT 
;TT 
}UU 	
}VV 
}WW Ü
yC:\Users\√ñmer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\Finance\Binance\ExchangeInfos.cs
	namespace 	!
EASYTelegramSignalBot
 
.  
Finance  '
.' (
Binance( /
{ 
public		 

class		 
ExchangeInfos		 
{

 
public 
IEnumerable 
< 
BinanceSymbol (
>( )
Spot* .
{/ 0
get1 4
;4 5
set6 9
;9 :
}; <
public 
IEnumerable 
< $
BinanceFuturesUsdtSymbol 3
>3 4
Usdt5 9
{: ;
get< ?
;? @
setA D
;D E
}F G
public 
IEnumerable 
< $
BinanceFuturesCoinSymbol 3
>3 4
Coin5 9
{: ;
get< ?
;? @
setA D
;D E
}F G
public 
ExchangeInfos 
( 
BinanceClient *
Client+ 1
)1 2
{ 	
Spot 
= 
Task 
. 
Run 
( 
( 
) 
=> !
Client" (
.( )
SpotApi) 0
.0 1
ExchangeData1 =
.= > 
GetExchangeInfoAsync> R
(R S
)S T
)T U
.U V
ResultV \
.\ ]
Data] a
.a b
Symbolsb i
;i j
Usdt 
= 
Task 
. 
Run 
( 
( 
) 
=> !
Client" (
.( )
UsdFuturesApi) 6
.6 7
ExchangeData7 C
.C D 
GetExchangeInfoAsyncD X
(X Y
)Y Z
)Z [
.[ \
Result\ b
.b c
Datac g
.g h
Symbolsh o
;o p
Coin 
= 
Task 
. 
Run 
( 
( 
) 
=> !
Client" (
.( )
CoinFuturesApi) 7
.7 8
ExchangeData8 D
.D E 
GetExchangeInfoAsyncE Y
(Y Z
)Z [
)[ \
.\ ]
Result] c
.c d
Datad h
.h i
Symbolsi p
;p q
} 	
} 
} ê*
yC:\Users\√ñmer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\Finance\Binance\StaticBinance.cs
	namespace 	!
EASYTelegramSignalBot
 
.  
Finance  '
{ 
public 

static 
class 
StaticBinance %
{ 
public 
static 
BinanceClient #
Client$ *
{+ ,
get- 0
;0 1
set2 5
;5 6
}7 8
=9 :
new; >
BinanceClient? L
(L M
)M N
;N O
public 
static 
BinanceSocketClient )
SocketClient* 6
{7 8
get9 <
;< =
set> A
;A B
}C D
=E F
newG J
BinanceSocketClientK ^
(^ _
)_ `
;` a
public 
static 
List 
< 
KlineSubscription ,
>, -"
SubscribedKlineUpdates. D
{E F
getG J
;J K
setL O
;O P
}Q R
=S T
newU X
(X Y
)Y Z
;Z [
public 
static 
ExchangeInfos #
ExchangeInfos$ 1
{2 3
get4 7
;7 8
set9 <
;< =
}> ?
=@ A
newB E
(E F
ClientF L
)L M
;M N
public 
static 
KlineSubscription '(
SubscribeToKlineUpdatesAsync( D
(D E
EnumsE J
.J K
SubscriptionTypeK [
subType\ c
,c d
stringe k
symboll r
,r s
KlineInterval	t Å
interval
Ç ä
,
ä ã

TickAction
å ñ

tickAction
ó °
)
° ¢
{ 	
KlineSubscription 
? 
subscription +
;+ ,
if 
( "
SubscribedKlineUpdates &
.& '
Any' *
(* +
x+ ,
=>- /
x0 1
.1 2
Symbol2 8
.8 9
ToLower9 @
(@ A
)A B
.B C
EqualsC I
(I J
symbolJ P
.P Q
ToLowerQ X
(X Y
)Y Z
)Z [
&&\ ^
x_ `
.` a
Intervala i
.i j
Equalsj p
(p q
intervalq y
)y z
)z {
){ |
{ 
subscription 
= "
SubscribedKlineUpdates 5
.5 6
First6 ;
(; <
x< =
=>> @
xA B
.B C
SymbolC I
.I J
ToLowerJ Q
(Q R
)R S
.S T
EqualsT Z
(Z [
symbol[ a
.a b
ToLowerb i
(i j
)j k
)k l
&&m o
xp q
.q r
Intervalr z
.z {
Equals	{ Å
(
Å Ç
interval
Ç ä
)
ä ã
)
ã å
;
å ç
subscription 
. 
	AddAction &
(& '

tickAction' 1
)1 2
;2 3
return 
subscription #
;# $
} 
subscription 
= 
new 
KlineSubscription 0
(0 1
subType1 8
,8 9
symbol: @
,@ A
intervalB J
,J K

tickActionL V
.V W

KlineCountW a
)a b
;b c
subscription 
. 
	AddAction "
(" #

tickAction# -
)- .
;. /"
SubscribedKlineUpdates   "
.  " #
Add  # &
(  & '
subscription  ' 3
)  3 4
;  4 5
Console!! 
.!! 
	WriteLine!! 
(!! 
$"!!  
$str!!  4
{!!4 5
subType!!5 <
}!!< =
$str!!= ?
{!!? @
symbol!!@ F
}!!F G
$str!!G I
{!!I J
interval!!J R
}!!R S
"!!S T
)!!T U
;!!U V
return"" 
subscription"" 
;""  
}## 	
public%% 
static%% 
void%% 
DeleteAction%% '
(%%' (
KlineSubscription%%( 9
subscription%%: F
,%%F G

TickAction%%H R
action%%S Y
)%%Y Z
{&& 	
subscription'' 
.'' 
Actions''  
.''  !
Remove''! '
(''' (
action''( .
)''. /
;''/ 0
if(( 
((( 
subscription(( 
.(( 
Actions(( $
.(($ %
Count((% *
==((+ -
$num((. /
)((/ 0
{)) "
SubscribedKlineUpdates** &
.**& '
Remove**' -
(**- .
subscription**. :
)**: ;
;**; <
subscription++ 
.++ 
Dispose++ $
(++$ %
)++% &
;++& '
},, 
}-- 	
}.. 
}// ˛Ä
xC:\Users\√ñmer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\Finance\Binance\Subscription.cs
	namespace 	!
EASYTelegramSignalBot
 
.  
Finance  '
.' (
Binance( /
{ 
public 

class 
KlineSubscription "
:# $
IDisposable% 0
{ 
private 
bool 

isDisposed 
;  
private #
CancellationTokenSource '#
CancellationTokenSource( ?
{@ A
getB E
;E F
setG J
;J K
}L M
private 
Task 
< 

CallResult 
<  
UpdateSubscription  2
>2 3
>3 4

CallResult5 ?
{@ A
getB E
;E F
setG J
;J K
}L M
public 
Enums 
. 
SubscriptionType %
Type& *
{+ ,
get- 0
;0 1
set2 5
;5 6
}7 8
public 
string 
Symbol 
{ 
get "
;" #
set$ '
;' (
}) *
public 
KlineInterval 
Interval %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public 
List 
< 

TickAction 
> 
Actions  '
{( )
get* -
;- .
set/ 2
;2 3
}4 5
private 
int 
Limit 
{ 
get 
;  
set! $
;$ %
}& '
public 
List 
< 
Kline 
> 
Klines !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
KlineSubscription  
(  !
Enums! &
.& '
SubscriptionType' 7
type8 <
,< =
string> D
symbolE K
,K L
KlineIntervalM Z
interval[ c
,c d
inte h
limiti n
)n o
{ 	#
CancellationTokenSource #
=$ %
new& )
() *
)* +
;+ ,
Type   
=   
type   
;   
Symbol!! 
=!! 
symbol!! 
;!! 
Interval"" 
="" 
interval"" 
;""  
Actions## 
=## 
new## 
(## 
)## 
;## 
Limit%% 
=%% 
limit%% 
;%% 
Klines&& 
=&& 
new&& 
(&& 
)&& 
;&& 
	GetKlines'' 
('' 
)'' 
;'' 

CallResult)) 
=)) 
Type)) 
switch)) $
{** 
Enums++ 
.++ 
SubscriptionType++ &
.++& '
CoinFutures++' 2
=>++3 5
StaticBinance++6 C
.++C D
SocketClient++D P
.++P Q
CoinFuturesStreams++Q c
.++c d)
SubscribeToKlineUpdatesAsync	++d Ä
(
++Ä Å
Symbol,,( .
,,,. /
Interval--( 0
,--0 1
data..( ,
=>..- /
{..0 1
RunFuncs..2 :
(..: ;
data..; ?
)..? @
;..@ A
}..B C
,..C D#
CancellationTokenSource//( ?
.//? @
Token//@ E
)00$ %
,00% &
Enums11 
.11 
SubscriptionType11 &
.11& '
Spot11' +
=>11, .
StaticBinance11/ <
.11< =
SocketClient11= I
.11I J
SpotStreams11J U
.11U V(
SubscribeToKlineUpdatesAsync11V r
(11r s
Symbol22( .
,22. /
Interval33( 0
,330 1
data44( ,
=>44- /
{440 1
RunFuncs442 :
(44: ;
data44; ?
)44? @
;44@ A
}44B C
,44C D#
CancellationTokenSource55( ?
.55? @
Token55@ E
)66$ %
,66% &
_77 
=>77 
StaticBinance77 "
.77" #
SocketClient77# /
.77/ 0
UsdFuturesStreams770 A
.77A B(
SubscribeToKlineUpdatesAsync77B ^
(77^ _
Symbol88( .
,88. /
Interval99( 0
,990 1
data::( ,
=>::- /
{::0 1
RunFuncs::2 :
(::: ;
data::; ?
)::? @
;::@ A
}::B C
,::C D#
CancellationTokenSource;;( ?
.;;? @
Token;;@ E
)<<$ %
,<<% &
}== 
;== 
}>> 	
private@@ 
void@@ 
RunFuncs@@ 
(@@ 
	DataEvent@@ '
<@@' (#
IBinanceStreamKlineData@@( ?
>@@? @
data@@A E
)@@E F
{AA 	
ifBB 
(BB 
!BB 
KlinesBB 
.BB 
LastBB 
(BB 
)BB 
.BB 
DateBB #
.BB# $
EqualsBB$ *
(BB* +
dataBB+ /
.BB/ 0
DataBB0 4
.BB4 5
DataBB5 9
.BB9 :
OpenTimeBB: B
)BBB C
)BBC D
{CC 
ActionsEE 
.EE 
WhereEE 
(EE 
xEE 
=>EE  "
xEE# $
.EE$ %
TriggerTypeEE% 0
.EE0 1
EqualsEE1 7
(EE7 8
EnumsEE8 =
.EE= >
TriggerTypeEE> I
.EEI J

KlineCloseEEJ T
)EET U
)EEU V
.EEV W
ToListEEW ]
(EE] ^
)EE^ _
.EE_ `
ForEachEE` g
(EEg h
xEEh i
=>EEj l
TaskEEm q
.EEq r
RunEEr u
(EEu v
(EEv w
)EEw x
=>EEy {
xEE| }
.EE} ~
Action	EE~ Ñ
(
EEÑ Ö
Klines
EEÖ ã
.
EEã å
GetRange
EEå î
(
EEî ï
Klines
EEï õ
.
EEõ ú
Count
EEú °
-
EE¢ £
x
EE§ •
.
EE• ¶

KlineCount
EE¶ ∞
,
EE∞ ±
x
EE≤ ≥
.
EE≥ ¥

KlineCount
EE¥ æ
)
EEæ ø
)
EEø ¿
)
EE¿ ¡
.
EE¡ ¬
Wait
EE¬ ∆
(
EE∆ «
)
EE« »
)
EE» …
;
EE…  
KlinesHH 
.HH 
RemoveAtHH 
(HH  
$numHH  !
)HH! "
;HH" #
KlinesII 
.II 
AddII 
(II 
dataII 
.II  
DataII  $
.II$ %
DataII% )
.II) *
ToKlineII* 1
(II1 2
)II2 3
)II3 4
;II4 5
ActionsLL 
.LL 
WhereLL 
(LL 
xLL 
=>LL  "
xLL# $
.LL$ %
TriggerTypeLL% 0
.LL0 1
EqualsLL1 7
(LL7 8
EnumsLL8 =
.LL= >
TriggerTypeLL> I
.LLI J
	KlineOpenLLJ S
)LLS T
)LLT U
.LLU V
ToListLLV \
(LL\ ]
)LL] ^
.LL^ _
ForEachLL_ f
(LLf g
xLLg h
=>LLi k
TaskLLl p
.LLp q
RunLLq t
(LLt u
(LLu v
)LLv w
=>LLx z
xLL{ |
.LL| }
Action	LL} É
(
LLÉ Ñ
Klines
LLÑ ä
.
LLä ã
GetRange
LLã ì
(
LLì î
Klines
LLî ö
.
LLö õ
Count
LLõ †
-
LL° ¢
x
LL£ §
.
LL§ •

KlineCount
LL• Ø
,
LLØ ∞
x
LL± ≤
.
LL≤ ≥

KlineCount
LL≥ Ω
)
LLΩ æ
)
LLæ ø
)
LLø ¿
)
LL¿ ¡
;
LL¡ ¬
}MM 
elseNN 
{OO 
KlinesPP 
[PP 
^PP 
$numPP 
]PP 
=PP 
dataPP !
.PP! "
DataPP" &
.PP& '
DataPP' +
.PP+ ,
ToKlinePP, 3
(PP3 4
)PP4 5
;PP5 6
}QQ 
ActionsSS 
.SS 
WhereSS 
(SS 
xSS 
=>SS 
xSS  
.SS  !
TriggerTypeSS! ,
.SS, -
EqualsSS- 3
(SS3 4
EnumsSS4 9
.SS9 :
TriggerTypeSS: E
.SSE F
KlineUpdateSSF Q
)SSQ R
)SSR S
.SSS T
ToListSST Z
(SSZ [
)SS[ \
.SS\ ]
ForEachSS] d
(SSd e
xSSe f
=>SSg i
TaskSSj n
.SSn o
RunSSo r
(SSr s
(SSs t
)SSt u
=>SSv x
xSSy z
.SSz {
Action	SS{ Å
(
SSÅ Ç
Klines
SSÇ à
.
SSà â
GetRange
SSâ ë
(
SSë í
Klines
SSí ò
.
SSò ô
Count
SSô û
-
SSü †
x
SS° ¢
.
SS¢ £

KlineCount
SS£ ≠
,
SS≠ Æ
x
SSØ ∞
.
SS∞ ±

KlineCount
SS± ª
)
SSª º
)
SSº Ω
)
SSΩ æ
)
SSæ ø
;
SSø ¿
}TT 	
publicVV 
voidVV 
	AddActionVV 
(VV 

TickActionVV (

tickActionVV) 3
)VV3 4
{WW 	
UpdateLimitXX 
(XX 

tickActionXX "
.XX" #

KlineCountXX# -
)XX- .
;XX. /
ActionsYY 
.YY 
AddYY 
(YY 

tickActionYY "
)YY" #
;YY# $
}ZZ 	
public\\ 
void\\ 
UpdateLimit\\ 
(\\  
int\\  #
limit\\$ )
)\\) *
{]] 	
if^^ 
(^^ 
Limit^^ 
<^^ 
limit^^ 
)^^ 
{__ 
Limit`` 
=`` 
limit`` 
;`` 
	GetKlinesaa 
(aa 
)aa 
;aa 
}bb 
}cc 	
privateee 
Listee 
<ee 
Klineee 
>ee 
GetKlinesAsyncee *
(ee* +
stringee+ 1
Symbolee2 8
,ee8 9
KlineIntervalee: G
IntervaleeH P
,eeP Q
inteeR U
LimiteeV [
,ee[ \
DateTimeee] e
?eee f
endTimeeeg n
=eeo p
nulleeq u
)eeu v
{ff 	
returngg 
Typegg 
switchgg 
{hh 
Enumsii 
.ii 
SubscriptionTypeii &
.ii& '
CoinFuturesii' 2
=>ii3 5
StaticBinanceii6 C
.iiC D
ClientiiD J
.iiJ K
CoinFuturesApiiiK Y
.iiY Z
ExchangeDataiiZ f
.iif g
GetKlinesAsynciig u
(iiu v
Symboliiv |
,ii| }
Interval	ii~ Ü
,
iiÜ á
limit
iià ç
:
iiç é
Limit
iiè î
,
iiî ï
endTime
iiñ ù
:
iiù û
endTime
iiü ¶
)
ii¶ ß
.
iiß ®
Result
ii® Æ
.
iiÆ Ø
Data
iiØ ≥
.
ii≥ ¥
ToKlines
ii¥ º
(
iiº Ω
)
iiΩ æ
,
iiæ ø
Enumsjj 
.jj 
SubscriptionTypejj &
.jj& '
Spotjj' +
=>jj, .
StaticBinancejj/ <
.jj< =
Clientjj= C
.jjC D
SpotApijjD K
.jjK L
ExchangeDatajjL X
.jjX Y
GetKlinesAsyncjjY g
(jjg h
Symboljjh n
,jjn o
Intervaljjp x
,jjx y
limitjjz 
:	jj Ä
Limit
jjÅ Ü
,
jjÜ á
endTime
jjà è
:
jjè ê
endTime
jjë ò
)
jjò ô
.
jjô ö
Result
jjö †
.
jj† °
Data
jj° •
.
jj• ¶
ToKlines
jj¶ Æ
(
jjÆ Ø
)
jjØ ∞
,
jj∞ ±
_kk 
=>kk 
StaticBinancekk "
.kk" #
Clientkk# )
.kk) *
UsdFuturesApikk* 7
.kk7 8
ExchangeDatakk8 D
.kkD E
GetKlinesAsynckkE S
(kkS T
SymbolkkT Z
,kkZ [
Intervalkk\ d
,kkd e
limitkkf k
:kkk l
Limitkkm r
,kkr s
endTimekkt {
:kk{ |
endTime	kk} Ñ
)
kkÑ Ö
.
kkÖ Ü
Result
kkÜ å
.
kkå ç
Data
kkç ë
.
kkë í
ToKlines
kkí ö
(
kkö õ
)
kkõ ú
,
kkú ù
}ll 
;ll 
}mm 	
publicoo 
voidoo 
	GetKlinesoo 
(oo 
)oo 
{pp 	
ifqq 
(qq 
Limitqq 
<qq 
$numqq 
)qq 
{rr 
Klinesss 
=ss 
GetKlinesAsyncss '
(ss' (
Symbolss( .
,ss. /
Intervalss0 8
,ss8 9
Limitss: ?
)ss? @
;ss@ A
returntt 
;tt 
}uu 
Klinesww 
=ww 
GetKlinesAsyncww #
(ww# $
Symbolww$ *
,ww* +
Intervalww, 4
,ww4 5
$numww6 :
)ww: ;
;ww; <
intxx 
GetKlinesCountxx 
=xx  
Limitxx! &
-xx' (
$numxx) -
;xx- .
foryy 
(yy 
;yy 
GetKlinesCountyy !
>yy" #
$numyy$ (
;yy( )
GetKlinesCountyy* 8
-=yy9 ;
$numyy< @
)yy@ A
{zz 
GetKlinesAsync{{ 
({{ 
Symbol{{ %
,{{% &
Interval{{' /
,{{/ 0
$num{{1 5
,{{5 6
endTime{{7 >
:{{> ?
Klines{{@ F
[{{F G
$num{{G H
]{{H I
.{{I J
Date{{J N
.{{N O

AddSeconds{{O Y
({{Y Z
-{{Z [
$num{{[ \
*{{] ^
({{_ `
int{{` c
){{c d
Interval{{d l
){{l m
){{m n
.{{n o
ForEach{{o v
({{v w
x{{w x
=>{{y {
Klines	{{| Ç
.
{{Ç É
Add
{{É Ü
(
{{Ü á
x
{{á à
)
{{à â
)
{{â ä
;
{{ä ã
}|| 
if~~ 
(~~ 
GetKlinesCount~~ 
>~~  
$num~~! "
)~~" #
{ 
GetKlinesAsync
ÄÄ 
(
ÄÄ 
Symbol
ÄÄ %
,
ÄÄ% &
Interval
ÄÄ' /
,
ÄÄ/ 0
GetKlinesCount
ÄÄ1 ?
)
ÄÄ? @
.
ÄÄ@ A
ForEach
ÄÄA H
(
ÄÄH I
x
ÄÄI J
=>
ÄÄK M
Klines
ÄÄN T
.
ÄÄT U
Add
ÄÄU X
(
ÄÄX Y
x
ÄÄY Z
)
ÄÄZ [
)
ÄÄ[ \
;
ÄÄ\ ]
}
ÅÅ 
}
ÇÇ 	
public
ÑÑ 
void
ÑÑ 
Cancel
ÑÑ 
(
ÑÑ 
)
ÑÑ 
{
ÖÖ 	%
CancellationTokenSource
ÜÜ #
?
ÜÜ# $
.
ÜÜ$ %
Cancel
ÜÜ% +
(
ÜÜ+ ,
)
ÜÜ, -
;
ÜÜ- .
}
áá 	
public
ââ 
void
ââ 
Dispose
ââ 
(
ââ 
)
ââ 
{
ää 	
Dispose
ãã 
(
ãã 
true
ãã 
)
ãã 
;
ãã 
GC
åå 
.
åå 
SuppressFinalize
åå 
(
åå  
this
åå  $
)
åå$ %
;
åå% &
}
çç 	
	protected
èè 
virtual
èè 
void
èè 
Dispose
èè &
(
èè& '
bool
èè' +
	disposing
èè, 5
)
èè5 6
{
êê 	
if
ëë 
(
ëë 

isDisposed
ëë 
)
ëë 
return
ëë "
;
ëë" #%
CancellationTokenSource
ìì #
.
ìì# $
Cancel
ìì$ *
(
ìì* +
)
ìì+ ,
;
ìì, -

CallResult
îî 
.
îî 
Dispose
îî 
(
îî 
)
îî  
;
îî  !

isDisposed
ññ 
=
ññ 
true
ññ 
;
ññ 
}
óó 	
}
òò 
}ôô ≤R
rC:\Users\√ñmer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\Finance\Indicators\PAC.cs
	namespace 	!
EASYTelegramSignalBot
 
.  
Finance  '
.' (

Indicators( 2
{ 
public 

class 
PAC 
: 
Models 
. 
	Indicator '
{ 
public 
List 
< 

SmmaResult 
> 
?  
TopOfChannel! -
{. /
get0 3
;3 4
set5 8
;8 9
}: ;
public 
List 
< 

SmmaResult 
> 
?  
BottomOfChannel! 0
{1 2
get3 6
;6 7
set8 ;
;; <
}= >
private 
Enums 
. 

SignalType  
LastSignalType! /
{0 1
get2 5
;5 6
set7 :
;: ;
}< =
private 
DateTime 
LastSignalTime '
{( )
get* -
;- .
set/ 2
;2 3
}4 5
public 
PAC 
( 
string 
symbol  
,  !
KlineInterval" /
interval0 8
,8 9
Action: @
<@ A
stringA G
,G H

DictionaryI S
<S T
stringT Z
,Z [
List\ `
<` a
objecta g
>g h
>h i
>i j
updateActionk w
,w x
Actiony 
<	 Ä
string
Ä Ü
,
Ü á

Dictionary
à í
<
í ì
string
ì ô
,
ô ö
List
õ ü
<
ü †
object
† ¶
>
¶ ß
>
ß ®
,
® ©
Enums
™ Ø
.
Ø ∞

SignalType
∞ ∫
>
∫ ª
signalAction
º »
,
» …
bool
  Œ
isPaused
œ ◊
=
ÿ Ÿ
false
⁄ ﬂ
)
ﬂ ‡
: 
base 
( 
symbol 
, 
interval #
,# $
Enums% *
.* +
SubscriptionType+ ;
.; <
Spot< @
,@ A
signalActionB N
,N O
updateActionP \
,\ ]
isPaused^ f
)f g
{ 	
LastSignalType 
= 
Enums "
." #

SignalType# -
.- .
None. 2
;2 3

TickAction 
= 
new 
( 
) 
{ 

KlineCount 
= 
$num !
,! "
Creator 
= 
this 
, 
TriggerType 
= 
Enums #
.# $
TriggerType$ /
./ 0

KlineClose0 :
,: ;
Action   
=   
Indicate   !
}!! 
;!! 
	Subscribe"" 
("" 
)"" 
;"" 
this## 
.## 
isPaused## 
=## 
isPaused## $
;##$ %
}$$ 	
private&& 
void&& 
Indicate&& 
(&& 
List&& "
<&&" #
Kline&&# (
>&&( )
data&&* .
)&&. /
{'' 	
if(( 
((( 
isPaused(( 
)(( 
return((  
;((  !
if)) 
()) 
LastSignalTime)) 
.)) 

AddSeconds)) )
())) *
Settings))* 2
.))2 3
BotsSettings))3 ?
.))? @
PACSettings))@ K
.))K L
MinSignalPeriot))L [
)))[ \
>))] ^
DateTime))_ g
.))g h
Now))h k
)))k l
return))m s
;))s t
List-- 
<-- 

SmmaResult-- 
>-- 
?-- 
topOfChannel-- *
=--+ ,
data--- 1
.--1 2
Use--2 5
(--5 6

CandlePart--6 @
.--@ A
High--A E
)--E F
.--F G
GetSmma--G N
(--N O
$num--O P
)--P Q
.--Q R
ToList--R X
(--X Y
)--Y Z
;--Z [
List// 
<// 

SmmaResult// 
>// 
?// 
bottomOfChannel// -
=//. /
data//0 4
.//4 5
Use//5 8
(//8 9

CandlePart//9 C
.//C D
Low//D G
)//G H
.//H I
GetSmma//I P
(//P Q
$num//Q R
)//R S
.//S T
ToList//T Z
(//Z [
)//[ \
;//\ ]
TopOfChannel22 
=22 
topOfChannel22 '
;22' (
BottomOfChannel33 
=33 
bottomOfChannel33 -
;33- .
Values55 
=55 
new55 
(55 
)55 
{66 
{77 
$str77 
,77 
data77  $
.77$ %
Select77% +
(77+ ,
x77, -
=>77. 0
(771 2
object772 8
?778 9
)779 :
x77: ;
??77< >
$num77? @
)77@ A
.77A B
ToList77B H
(77H I
)77I J
.77J K
GetRange77K S
(77S T
data77T X
.77X Y
Count77Y ^
-77^ _
$num77_ a
,77a b
$num77b d
)77d e
}77f g
,77g h
{88 
$str88 
,88 
TopOfChannel88 )
.88) *
Select88* 0
(880 1
x881 2
=>883 5
(886 7
object887 =
?88= >
)88> ?
x88? @
.88@ A
Smma88A E
??88F H
$num88I J
)88J K
.88K L
ToList88L R
(88R S
)88S T
.88T U
GetRange88U ]
(88] ^
data88^ b
.88b c
Count88c h
-88h i
$num88i k
,88k l
$num88l n
)88n o
}88p q
,88q r
{99 
$str99 
,99 
BottomOfChannel99 ,
.99, -
Select99- 3
(993 4
x994 5
=>996 8
(999 :
object99: @
?99@ A
)99A B
x99B C
.99C D
Smma99D H
??99I K
$num99L M
)99M N
.99N O
ToList99O U
(99U V
)99V W
.99W X
GetRange99X `
(99` a
data99a e
.99e f
Count99f k
-99k l
$num99l n
,99n o
$num99o q
)99q r
}99s t
}:: 
;:: 
UpdateAction<< 
(<< 
Symbol<< 
,<<  
Values<<! '
)<<' (
;<<( )
decimal>> 

Last_Close>> 
=>>  
data>>! %
.>>% &
Last>>& *
(>>* +
)>>+ ,
.>>, -
Close>>- 2
;>>2 3
decimal?? 
Last_TOC?? 
=?? 
(??  
int??  #
???# $
)??$ %
TopOfChannel??% 1
.??1 2
Last??2 6
(??6 7
)??7 8
.??8 9
Smma??9 =
????> @
$num??A B
;??B C
decimal@@ 
Last_BOC@@ 
=@@ 
(@@  
int@@  #
?@@# $
)@@$ %
BottomOfChannel@@% 4
.@@4 5
Last@@5 9
(@@9 :
)@@: ;
.@@; <
Smma@@< @
??@@A C
$num@@D E
;@@E F
EnumsBB 
.BB 

SignalTypeBB 
ChannelSignalBB *
=BB+ ,
(BB- .

Last_CloseBB. 8
>BB9 :
Last_TOCBB; C
)BBC D
?BBE F
EnumsBBG L
.BBL M

SignalTypeBBM W
.BBW X
LongBBX \
:BB] ^
(BB_ `
(BB` a

Last_CloseBBa k
<BBl m
Last_BOCBBn v
)BBv w
?BBx y
EnumsBBz 
.	BB Ä

SignalType
BBÄ ä
.
BBä ã
Short
BBã ê
:
BBë í
Enums
BBì ò
.
BBò ô

SignalType
BBô £
.
BB£ §
Exit
BB§ ®
)
BB® ©
;
BB© ™
ConsoleDD 
.DD 
	WriteLineDD 
(DD 
$"DD  
{DD  !
SymbolDD! '
}DD' (
$strDD( 0
{DD0 1
EnumDD1 5
.DD5 6
GetNameDD6 =
(DD= >
typeofDD> D
(DDD E
EnumsDDE J
.DDJ K

SignalTypeDDK U
)DDU V
,DDV W
ChannelSignalDDX e
)DDe f
}DDf g
"DDg h
)DDh i
;DDi j
ifFF 
(FF 
ChannelSignalFF 
.FF 
EqualsFF $
(FF$ %
LastSignalTypeFF% 3
)FF3 4
)FF4 5
returnFF6 <
;FF< =
ifGG 
(GG 
LastSignalTypeGG 
==GG !
EnumsGG" '
.GG' (

SignalTypeGG( 2
.GG2 3
NoneGG3 7
)GG7 8
{HH 
LastSignalTypeII 
=II  
ChannelSignalII! .
;II. /
returnJJ 
;JJ 
}KK 
TaskNN 
.NN 
RunNN 
(NN 
(NN 
)NN 
=>NN 
SignalActionNN '
(NN' (
SymbolNN( .
,NN. /
ValuesNN0 6
,NN6 7
ChannelSignalNN8 E
)NNE F
)NNF G
;NNG H
ConsoleOO 
.OO 
	WriteLineOO 
(OO 
$"OO  
$strOO  /
{OO/ 0
SymbolOO0 6
}OO6 7
$strOO7 ;
{OO; <
EnumOO< @
.OO@ A
GetNameOOA H
(OOH I
typeofOOI O
(OOO P
EnumsOOP U
.OOU V

SignalTypeOOV `
)OO` a
,OOa b
ChannelSignalOOc p
)OOp q
}OOq r
"OOr s
)OOs t
;OOt u
LastSignalTypePP 
=PP 
ChannelSignalPP *
;PP* +
LastSignalTimeQQ 
=QQ 
DateTimeQQ %
.QQ% &
NowQQ& )
;QQ) *
}RR 	
}SS 
}TT ûE
rC:\Users\√ñmer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\Finance\Indicators\RSI.cs
	namespace 	!
EASYTelegramSignalBot
 
.  
Finance  '
.' (

Indicators( 2
{ 
public 

class 
RSI 
: 
Models 
. 
	Indicator '
{ 
public 
List 
< 
	RsiResult 
> 
? 

RSIResults  *
{+ ,
get- 0
;0 1
set2 5
;5 6
}7 8
private 
Enums 
. 

SignalType  
LastSignalType! /
{0 1
get2 5
;5 6
set7 :
;: ;
}< =
private 
DateTime 
LastSignalTime '
{( )
get* -
;- .
set/ 2
;2 3
}4 5
public 
RSI 
( 
string 
symbol  
,  !
KlineInterval" /
interval0 8
,8 9
Action: @
<@ A
stringA G
,G H

DictionaryI S
<S T
stringT Z
,Z [
List\ `
<` a
objecta g
>g h
>h i
>i j
updateActionk w
,w x
Actiony 
<	 Ä
string
Ä Ü
,
Ü á

Dictionary
à í
<
í ì
string
ì ô
,
ô ö
List
õ ü
<
ü †
object
† ¶
>
¶ ß
>
ß ®
,
® ©
Enums
™ Ø
.
Ø ∞

SignalType
∞ ∫
>
∫ ª
signalAction
º »
,
» …
bool
  Œ
isPaused
œ ◊
=
ÿ Ÿ
false
⁄ ﬂ
)
ﬂ ‡
: 
base 
( 
symbol 
, 
interval #
,# $
Enums% *
.* +
SubscriptionType+ ;
.; <
Spot< @
,@ A
signalActionB N
,N O
updateActionP \
,\ ]
isPaused^ f
)f g
{ 	
LastSignalType 
= 
Enums "
." #

SignalType# -
.- .
None. 2
;2 3

TickAction 
= 
new 
( 
) 
{ 

KlineCount 
= 
$num  
,  !
Creator 
= 
this 
, 
TriggerType 
= 
Enums #
.# $
TriggerType$ /
./ 0
KlineUpdate0 ;
,; <
Action 
= 
Indicate !
}   
;   
	Subscribe!! 
(!! 
)!! 
;!! 
}"" 	
private$$ 
void$$ 
Indicate$$ 
($$ 
List$$ "
<$$" #
Kline$$# (
>$$( )
data$$* .
)$$. /
{%% 	
if&& 
(&& 
isPaused&& 
)&& 
return&&  
;&&  !
if'' 
('' 
LastSignalTime'' 
.'' 

AddSeconds'' )
('') *
Settings''* 2
.''2 3
BotsSettings''3 ?
.''? @
RSISettings''@ K
.''K L
MinSignalPeriot''L [
)''[ \
>''] ^
DateTime''_ g
.''g h
Now''h k
)''k l
return''m s
;''s t
List** 
<** 
	RsiResult** 
>** 
?** 
Rsi**  
=**! "
data**# '
.**' (
GetRsi**( .
(**. /
Settings**/ 7
.**7 8
BotsSettings**8 D
.**D E
TDISettings**E P
.**P Q
	RSIPeriot**Q Z
)**Z [
.**[ \
ToList**\ b
(**b c
)**c d
;**d e

RSIResults-- 
=-- 
Rsi-- 
;-- 
Values// 
=// 
new// 
(// 
)// 
{00 
{11 
$str11 
,11 
data11  $
.11$ %
Select11% +
(11+ ,
x11, -
=>11. 0
(111 2
object112 8
?118 9
)119 :
x11: ;
??11< >
$num11? @
)11@ A
.11A B
ToList11B H
(11H I
)11I J
.11J K
GetRange11K S
(11S T
data11T X
.11X Y
Count11Y ^
-11^ _
$num11_ a
,11a b
$num11b d
)11d e
}11f g
,11g h
{22 
$str22 
,22 

RSIResults22 '
.22' (
Select22( .
(22. /
x22/ 0
=>221 3
(224 5
object225 ;
?22; <
)22< =
x22= >
.22> ?
Rsi22? B
??22C E
$num22F G
)22G H
.22H I
ToList22I O
(22O P
)22P Q
.22Q R
GetRange22R Z
(22Z [
data22[ _
.22_ `
Count22` e
-22e f
$num22f h
,22h i
$num22i k
)22k l
}22m n
,22n o
}33 
;33 
UpdateAction55 
(55 
Symbol55 
,55  
Values55! '
)55' (
;55( )
Enums77 
.77 

SignalType77 
RSI77  
;77  !
int99 
Last_RSI99 
=99 
(99 
int99 
?99  
)99  !
Rsi99! $
.99$ %
Last99% )
(99) *
)99* +
.99+ ,
Rsi99, /
??990 2
$num993 4
;994 5
if;; 
(;; 
Last_RSI;; 
>;; 
Settings;; #
.;;# $
BotsSettings;;$ 0
.;;0 1
RSISettings;;1 <
.;;< =
RSIOverboughtLevet;;= O
);;O P
RSI;;Q T
=;;U V
Enums;;W \
.;;\ ]

SignalType;;] g
.;;g h
	UpperLine;;h q
;;;q r
else<< 
if<< 
(<< 
Last_RSI<< 
<<< 
Settings<<  (
.<<( )
BotsSettings<<) 5
.<<5 6
RSISettings<<6 A
.<<A B
RSIOversoldLevel<<B R
)<<R S
RSI<<T W
=<<X Y
Enums<<Z _
.<<_ `

SignalType<<` j
.<<j k
	UnderLine<<k t
;<<t u
else== 
RSI== 
=== 
Enums== 
.== 

SignalType== '
.==' (
BetweenLines==( 4
;==4 5
Console?? 
.?? 
	WriteLine?? 
(?? 
$"??  
{??  !
Symbol??! '
}??' (
$str??( 0
{??0 1
Enum??1 5
.??5 6
GetName??6 =
(??= >
typeof??> D
(??D E
Enums??E J
.??J K

SignalType??K U
)??U V
,??V W
RSI??X [
)??[ \
}??\ ]
"??] ^
)??^ _
;??_ `
ifBB 
(BB 
RSIBB 
.BB 
EqualsBB 
(BB 
LastSignalTypeBB )
)BB) *
)BB* +
returnBB, 2
;BB2 3
ifCC 
(CC 
LastSignalTypeCC 
==CC !
EnumsCC" '
.CC' (

SignalTypeCC( 2
.CC2 3
NoneCC3 7
)CC7 8
{DD 
LastSignalTypeEE 
=EE  
RSIEE! $
;EE$ %
returnFF 
;FF 
}GG 
TaskII 
.II 
RunII 
(II 
(II 
)II 
=>II 
SignalActionII '
(II' (
SymbolII( .
,II. /
ValuesII0 6
,II6 7
RSIII8 ;
)II; <
)II< =
;II= >
ConsoleJJ 
.JJ 
	WriteLineJJ 
(JJ 
$"JJ  
$strJJ  /
{JJ/ 0
SymbolJJ0 6
}JJ6 7
$strJJ7 ;
{JJ; <
EnumJJ< @
.JJ@ A
GetNameJJA H
(JJH I
typeofJJI O
(JJO P
EnumsJJP U
.JJU V

SignalTypeJJV `
)JJ` a
,JJa b
RSIJJc f
)JJf g
}JJg h
"JJh i
)JJi j
;JJj k
LastSignalTypeKK 
=KK 
RSIKK  
;KK  !
LastSignalTimeLL 
=LL 
DateTimeLL %
.LL% &
NowLL& )
;LL) *
}NN 	
}OO 
}PP Ô°
rC:\Users\√ñmer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\Finance\Indicators\TDI.cs
	namespace 	!
EASYTelegramSignalBot
 
.  
Finance  '
.' (

Indicators( 2
{ 
public 

class 
TDI 
: 
Models 
. 
	Indicator '
{ 
public 
List 
< 
	SmaResult 
> 
? 
FastMAResults  -
{. /
get0 3
;3 4
set5 8
;8 9
}: ;
public 
List 
< 
	SmaResult 
> 
? 
SlowMAResults  -
{. /
get0 3
;3 4
set5 8
;8 9
}: ;
public 
List 
< 
double 
? 
> 
? 
UpVBResults )
{* +
get, /
;/ 0
set1 4
;4 5
}6 7
public 
List 
< 
double 
? 
> 
? 
MiddleVBResults -
{. /
get0 3
;3 4
set5 8
;8 9
}: ;
public 
List 
< 
double 
? 
> 
? 
DownVBResults +
{, -
get. 1
;1 2
set3 6
;6 7
}8 9
private 
Enums 
. 

SignalType  
LastSignalType! /
{0 1
get2 5
;5 6
set7 :
;: ;
}< =
private 
DateTime 
LastSignalTime '
{( )
get* -
;- .
set/ 2
;2 3
}4 5
public 
TDI 
( 
string 
symbol  
,  !
KlineInterval" /
interval0 8
,8 9
Action: @
<@ A
stringA G
,G H

DictionaryI S
<S T
stringT Z
,Z [
List\ `
<` a
objecta g
>g h
>h i
>i j
updateActionk w
,w x
Actiony 
<	 Ä
string
Ä Ü
,
Ü á

Dictionary
à í
<
í ì
string
ì ô
,
ô ö
List
õ ü
<
ü †
object
† ¶
>
¶ ß
>
ß ®
,
® ©
Enums
™ Ø
.
Ø ∞

SignalType
∞ ∫
>
∫ ª
signalAction
º »
,
» …
bool
  Œ
isPaused
œ ◊
=
ÿ Ÿ
false
⁄ ﬂ
)
ﬂ ‡
: 
base 
( 
symbol 
, 
interval #
,# $
Enums% *
.* +
SubscriptionType+ ;
.; <
Spot< @
,@ A
signalActionB N
,N O
updateActionP \
,\ ]
isPaused^ f
)f g
{ 	
LastSignalType 
= 
Enums "
." #

SignalType# -
.- .
None. 2
;2 3

TickAction 
= 
new 
( 
) 
{ 

KlineCount   
=   
$num    
,    !
Creator!! 
=!! 
this!! 
,!! 
TriggerType"" 
="" 
Enums"" #
.""# $
TriggerType""$ /
.""/ 0
KlineUpdate""0 ;
,""; <
Action## 
=## 
Indicate## !
}$$ 
;$$ 
	Subscribe%% 
(%% 
)%% 
;%% 
this&& 
.&& 
isPaused&& 
=&& 
isPaused&& $
;&&$ %
}'' 	
private)) 
void)) 
Indicate)) 
()) 
List)) "
<))" #
Kline))# (
>))( )
data))* .
))). /
{** 	
if++ 
(++ 
isPaused++ 
)++ 
return++  
;++  !
if,, 
(,, 
LastSignalTime,, 
.,, 

AddSeconds,, )
(,,) *
Settings,,* 2
.,,2 3
BotsSettings,,3 ?
.,,? @
TDISettings,,@ K
.,,K L
MinSignalPeriot,,L [
),,[ \
>,,] ^
DateTime,,_ g
.,,g h
Now,,h k
),,k l
return,,m s
;,,s t
List.. 
<.. 
	RsiResult.. 
>.. 
?.. 
Rsi..  
=..! "
data..# '
...' (
GetRsi..( .
(... /
Settings../ 7
...7 8
BotsSettings..8 D
...D E
TDISettings..E P
...P Q
	RSIPeriot..Q Z
)..Z [
...[ \
ToList..\ b
(..b c
)..c d
;..d e
List11 
<11 
	SmaResult11 
>11 
?11 
FastMA11 #
=11$ %
Rsi11& )
.11) *
GetSma11* 0
(110 1
Settings111 9
.119 :
BotsSettings11: F
.11F G
TDISettings11G R
.11R S
RSIPLPeriot11S ^
)11^ _
.11_ `
ToList11` f
(11f g
)11g h
;11h i
List44 
<44 
	SmaResult44 
>44 
?44 
SlowMA44 #
=44$ %
Rsi44& )
.44) *
GetSma44* 0
(440 1
Settings441 9
.449 :
BotsSettings44: F
.44F G
TDISettings44G R
.44R S
	TSLPeriot44S \
)44\ ]
.44] ^
ToList44^ d
(44d e
)44e f
;44f g

Dictionary77 
<77 
DateTime77 
,77  
double77! '
?77' (
>77( )
?77) *
MA77+ -
=77. /
Rsi770 3
.773 4
GetSma774 :
(77: ;
Settings77; C
.77C D
BotsSettings77D P
.77P Q
TDISettings77Q \
.77\ ]
VotalityBandPeriot77] o
)77o p
.77p q
ToDictionary77q }
(77} ~
x77~ 
=>
77Ä Ç
x
77É Ñ
.
77Ñ Ö
Date
77Ö â
,
77â ä
x
77ã å
=>
77ç è
x
77ê ë
.
77ë í
Sma
77í ï
)
77ï ñ
;
77ñ ó

Dictionary88 
<88 
DateTime88 
,88  
double88! '
?88' (
>88( )
?88) *
StDev88+ 0
=881 2
Rsi883 6
.886 7
	GetStdDev887 @
(88@ A
Settings88A I
.88I J
BotsSettings88J V
.88V W
TDISettings88W b
.88b c
VotalityBandPeriot88c u
)88u v
.88v w
ToDictionary	88w É
(
88É Ñ
x
88Ñ Ö
=>
88Ü à
x
88â ä
.
88ä ã
Date
88ã è
,
88è ê
x
88ë í
=>
88ì ï
x
88ñ ó
.
88ó ò
StdDev
88ò û
*
88ü †
$num
88° ß
)
88ß ®
;
88® ©

Dictionary99 
<99 
DateTime99 
,99  
double99! '
?99' (
>99( )
?99) *
UpVB99+ /
=990 1
MA992 4
.994 5
ToDictionary995 A
(99A B
x99B C
=>99D F
x99G H
.99H I
Key99I L
,99L M
x99N O
=>99P R
x99S T
.99T U
Value99U Z
+99[ \
StDev99] b
[99b c
x99c d
.99d e
Key99e h
]99h i
)99i j
;99j k

Dictionary:: 
<:: 
DateTime:: 
,::  
double::! '
?::' (
>::( )
?::) *
DownVB::+ 1
=::2 3
MA::4 6
.::6 7
ToDictionary::7 C
(::C D
x::D E
=>::F H
x::I J
.::J K
Key::K N
,::N O
x::P Q
=>::R T
x::U V
.::V W
Value::W \
-::] ^
StDev::_ d
[::d e
x::e f
.::f g
Key::g j
]::j k
)::k l
;::l m

Dictionary;; 
<;; 
DateTime;; 
,;;  
double;;! '
?;;' (
>;;( )
?;;) *
MiddleVB;;+ 3
=;;4 5
UpVB;;6 :
.;;: ;
ToDictionary;;; G
(;;G H
x;;H I
=>;;J L
x;;M N
.;;N O
Key;;O R
,;;R S
x;;T U
=>;;V X
(;;Y Z
x;;Z [
.;;[ \
Value;;\ a
+;;b c
DownVB;;d j
[;;j k
x;;k l
.;;l m
Key;;m p
];;p q
);;q r
/;;s t
$num;;u v
);;v w
;;;w x
FastMAResults>> 
=>> 
FastMA>> "
;>>" #
SlowMAResults?? 
=?? 
SlowMA?? "
;??" #
UpVBResults@@ 
=@@ 
UpVB@@ 
.@@ 
Values@@ %
.@@% &
ToList@@& ,
(@@, -
)@@- .
;@@. /
MiddleVBResultsAA 
=AA 
MiddleVBAA &
.AA& '
ValuesAA' -
.AA- .
ToListAA. 4
(AA4 5
)AA5 6
;AA6 7
DownVBResultsBB 
=BB 
DownVBBB "
.BB" #
ValuesBB# )
.BB) *
ToListBB* 0
(BB0 1
)BB1 2
;BB2 3
ValuesDD 
=DD 
newDD 
(DD 
)DD 
{EE 
{FF 
$strFF 
,FF 
dataFF  $
.FF$ %
SelectFF% +
(FF+ ,
xFF, -
=>FF. 0
(FF1 2
objectFF2 8
?FF8 9
)FF9 :
xFF: ;
??FF< >
$numFF? @
)FF@ A
.FFA B
ToListFFB H
(FFH I
)FFI J
.FFJ K
GetRangeFFK S
(FFS T
dataFFT X
.FFX Y
CountFFY ^
-FF^ _
$numFF_ a
,FFa b
$numFFb d
)FFd e
}FFf g
,FFg h
{GG 
$strGG 
,GG 
FastMAResultsGG  -
.GG- .
SelectGG. 4
(GG4 5
xGG5 6
=>GG7 9
(GG: ;
objectGG; A
?GGA B
)GGB C
xGGC D
.GGD E
SmaGGE H
??GGI K
$numGGL M
)GGM N
.GGN O
ToListGGO U
(GGU V
)GGV W
.GGW X
GetRangeGGX `
(GG` a
dataGGa e
.GGe f
CountGGf k
-GGk l
$numGGl n
,GGn o
$numGGo q
)GGq r
}GGs t
,GGt u
{HH 
$strHH 
,HH 
SlowMAResultsHH  -
.HH- .
SelectHH. 4
(HH4 5
xHH5 6
=>HH7 9
(HH: ;
objectHH; A
?HHA B
)HHB C
xHHC D
.HHD E
SmaHHE H
??HHI K
$numHHL M
)HHM N
.HHN O
ToListHHO U
(HHU V
)HHV W
.HHW X
GetRangeHHX `
(HH` a
dataHHa e
.HHe f
CountHHf k
-HHk l
$numHHl n
,HHn o
$numHHo q
)HHq r
}HHs t
,HHt u
{II 
$strII 
,II 
UpVBResultsII )
.II) *
SelectII* 0
(II0 1
xII1 2
=>II3 5
xII6 7
==II8 :
nullII; ?
?II@ A
$numIIB C
:IID E
(IIF G
objectIIG M
)IIM N
xIIN O
)IIO P
.IIP Q
ToListIIQ W
(IIW X
)IIX Y
.IIY Z
GetRangeIIZ b
(IIb c
dataIIc g
.IIg h
CountIIh m
-IIm n
$numIIn p
,IIp q
$numIIq s
)IIs t
}IIu v
,IIv w
{JJ 
$strJJ  
,JJ  !
MiddleVBResultsJJ" 1
.JJ1 2
SelectJJ2 8
(JJ8 9
xJJ9 :
=>JJ; =
xJJ> ?
==JJ@ B
nullJJC G
?JJH I
$numJJJ K
:JJL M
(JJN O
objectJJO U
)JJU V
xJJV W
)JJW X
.JJX Y
ToListJJY _
(JJ_ `
)JJ` a
.JJa b
GetRangeJJb j
(JJj k
dataJJk o
.JJo p
CountJJp u
-JJu v
$numJJv x
,JJx y
$numJJy {
)JJ{ |
}JJ} ~
,JJ~ 
{KK 
$strKK 
,KK 
DownVBResultsKK  -
.KK- .
SelectKK. 4
(KK4 5
xKK5 6
=>KK7 9
xKK: ;
==KK< >
nullKK? C
?KKD E
$numKKF G
:KKH I
(KKJ K
objectKKK Q
)KKQ R
xKKR S
)KKS T
.KKT U
ToListKKU [
(KK[ \
)KK\ ]
.KK] ^
GetRangeKK^ f
(KKf g
dataKKg k
.KKk l
CountKKl q
-KKq r
$numKKr t
,KKt u
$numKKu w
)KKw x
}KKy z
}LL 
;LL 
UpdateActionNN 
(NN 
SymbolNN 
,NN  
ValuesNN! '
)NN' (
;NN( )
EnumsPP 
.PP 

SignalTypePP 
RSI_PLPP #
;PP# $
EnumsQQ 
.QQ 

SignalTypeQQ 
TSLQQ  
;QQ  !
EnumsRR 
.RR 

SignalTypeRR 
MBLRR  
;RR  !
EnumsSS 
.SS 

SignalTypeSS 
VBSS 
;SS  
intUU 
Last_FastMAUU 
=UU 
(UU 
intUU "
?UU" #
)UU# $
FastMAUU$ *
.UU* +
LastUU+ /
(UU/ 0
)UU0 1
.UU1 2
SmaUU2 5
??UU6 8
$numUU9 :
;UU: ;
intVV 
Last_SlowMAVV 
=VV 
(VV 
intVV "
?VV" #
)VV# $
SlowMAVV$ *
.VV* +
LastVV+ /
(VV/ 0
)VV0 1
.VV1 2
SmaVV2 5
??VV6 8
$numVV9 :
;VV: ;
intWW 
Last_MiddleWW 
=WW 
(WW 
intWW "
?WW" #
)WW# $
MiddleVBWW$ ,
.WW, -
LastWW- 1
(WW1 2
)WW2 3
.WW3 4
ValueWW4 9
??WW: <
$numWW= >
;WW> ?
intXX 
Last_UpXX 
=XX 
(XX 
intXX 
?XX 
)XX  
UpVBXX  $
.XX$ %
LastXX% )
(XX) *
)XX* +
.XX+ ,
ValueXX, 1
??XX2 4
$numXX5 6
;XX6 7
ifZZ 
(ZZ 
Last_FastMAZZ 
>ZZ 
SettingsZZ &
.ZZ& '
BotsSettingsZZ' 3
.ZZ3 4
TDISettingsZZ4 ?
.ZZ? @
RSIOverboughtLevetZZ@ R
||ZZS U
Last_FastMAZZV a
<ZZb c
SettingsZZd l
.ZZl m
BotsSettingsZZm y
.ZZy z
TDISettings	ZZz Ö
.
ZZÖ Ü
RSIOversoldLevel
ZZÜ ñ
)
ZZñ ó
RSI_PL
ZZò û
=
ZZü †
Enums
ZZ° ¶
.
ZZ¶ ß

SignalType
ZZß ±
.
ZZ± ≤
Exit
ZZ≤ ∂
;
ZZ∂ ∑
else[[ 
RSI_PL[[ 
=[[ 
Last_FastMA[[ %
>[[& '
$num[[( *
?[[+ ,
Enums[[- 2
.[[2 3

SignalType[[3 =
.[[= >
Buy[[> A
:[[B C
Enums[[D I
.[[I J

SignalType[[J T
.[[T U
Sell[[U Y
;[[Y Z
if]] 
(]] 
Last_FastMA]] 
==]] 
Last_SlowMA]] *
)]]* +
TSL]], /
=]]0 1
Enums]]2 7
.]]7 8

SignalType]]8 B
.]]B C
Exit]]C G
;]]G H
else^^ 
TSL^^ 
=^^ 
Last_FastMA^^ "
>^^# $
Last_SlowMA^^% 0
?^^1 2
Enums^^3 8
.^^8 9

SignalType^^9 C
.^^C D
Buy^^D G
:^^H I
Enums^^J O
.^^O P

SignalType^^P Z
.^^Z [
Sell^^[ _
;^^_ `
if`` 
(`` 
Last_FastMA`` 
==`` 
Last_Middle`` *
)``* +
MBL``, /
=``0 1
Enums``2 7
.``7 8

SignalType``8 B
.``B C
Exit``C G
;``G H
elseaa 
MBLaa 
=aa 
Last_FastMAaa "
>aa# $
Last_Middleaa% 0
?aa1 2
Enumsaa3 8
.aa8 9

SignalTypeaa9 C
.aaC D
BuyaaD G
:aaH I
EnumsaaJ O
.aaO P

SignalTypeaaP Z
.aaZ [
Sellaa[ _
;aa_ `
ifcc 
(cc 
Last_FastMAcc 
>cc 
Last_Upcc %
)cc% &
VBcc' )
=cc* +
Enumscc, 1
.cc1 2

SignalTypecc2 <
.cc< =
Exitcc= A
;ccA B
elsedd 
VBdd 
=dd 
Last_FastMAdd !
<dd" #
Last_Updd$ +
?dd, -
Enumsdd. 3
.dd3 4

SignalTypedd4 >
.dd> ?
Buydd? B
:ddC D
EnumsddE J
.ddJ K

SignalTypeddK U
.ddU V
SellddV Z
;ddZ [
ifff 
(ff 
RSI_PLff 
.ff 
Equalsff 
(ff 
LastSignalTypeff ,
)ff, -
)ff- .
returnff/ 5
;ff5 6
ifgg 
(gg 
RSI_PLgg 
.gg 
	EqualsAllgg  
(gg  !
TSLgg! $
,gg$ %
MBLgg& )
,gg) *
VBgg+ -
)gg- .
)gg. /
{hh 
Taskjj 
.jj 
Runjj 
(jj 
(jj 
)jj 
=>jj 
SignalActionjj +
(jj+ ,
Symboljj, 2
,jj2 3
Valuesjj4 :
,jj: ;
RSI_PLjj< B
)jjB C
)jjC D
;jjD E
Consolekk 
.kk 
	WriteLinekk !
(kk! "
$"kk" $
$strkk$ 3
{kk3 4
Symbolkk4 :
}kk: ;
$strkk; ?
{kk? @
Enumkk@ D
.kkD E
GetNamekkE L
(kkL M
typeofkkM S
(kkS T
EnumskkT Y
.kkY Z

SignalTypekkZ d
)kkd e
,kke f
RSI_PLkkg m
)kkm n
}kkn o
"kko p
)kkp q
;kkq r
LastSignalTypell 
=ll  
RSI_PLll! '
;ll' (
LastSignalTimemm 
=mm  
DateTimemm! )
.mm) *
Nowmm* -
;mm- .
}nn 
Consolepp 
.pp 
	WriteLinepp 
(pp 
$"pp  
{pp  !
Symbolpp! '
}pp' (
$strpp( 3
{pp3 4
Enumpp4 8
.pp8 9
GetNamepp9 @
(pp@ A
typeofppA G
(ppG H
EnumsppH M
.ppM N

SignalTypeppN X
)ppX Y
,ppY Z
RSI_PLpp[ a
)ppa b
}ppb c
$strppc n
{ppn o
Enumppo s
.pps t
GetNameppt {
(pp{ |
typeof	pp| Ç
(
ppÇ É
Enums
ppÉ à
.
ppà â

SignalType
ppâ ì
)
ppì î
,
ppî ï
TSL
ppñ ô
)
ppô ö
}
ppö õ
$str
ppõ ¶
{
pp¶ ß
Enum
ppß ´
.
pp´ ¨
GetName
pp¨ ≥
(
pp≥ ¥
typeof
pp¥ ∫
(
pp∫ ª
Enums
ppª ¿
.
pp¿ ¡

SignalType
pp¡ À
)
ppÀ Ã
,
ppÃ Õ
MBL
ppŒ —
)
pp— “
}
pp“ ”
$str
pp” ›
{
pp› ﬁ
Enum
ppﬁ ‚
.
pp‚ „
GetName
pp„ Í
(
ppÍ Î
typeof
ppÎ Ò
(
ppÒ Ú
Enums
ppÚ ˜
.
pp˜ ¯

SignalType
pp¯ Ç
)
ppÇ É
,
ppÉ Ñ
VB
ppÖ á
)
ppá à
}
ppà â
"
ppâ ä
)
ppä ã
;
ppã å
}qq 	
}rr 
}ss Ù
pC:\Users\√ñmer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\Finance\Models\Enums.cs
	namespace 	!
EASYTelegramSignalBot
 
.  
Finance  '
.' (
Models( .
{ 
public 

static 
class 
Enums 
{ 
public 
enum 

SignalType 
{ 	
Exit 
= 
$num 
, 
Long 
= 
$num 
, 
Short		 
=		 
$num		 
,		 
Buy

 
=

 
$num

 
,

 
Sell 
= 
$num 
, 
	UpperLine 
= 
$num 
, 
BetweenLines 
= 
$num 
, 
	UnderLine 
= 
$num 
, 
None 
= 
$num 
} 	
public 
enum 
TriggerType 
{ 	

KlineClose 
= 
$num 
, 
KlineUpdate 
= 
$num 
, 
	KlineOpen 
= 
$num 
} 	
public 
enum 
SubscriptionType $
{ 	

UsdFutures 
= 
$num 
, 
CoinFutures 
= 
$num 
, 
Spot 
= 
$num 
} 	
} 
} á	
uC:\Users\√ñmer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\Finance\Models\Exceptions.cs
	namespace 	!
EASYTelegramSignalBot
 
.  
Finance  '
.' (
Models( .
{ 
public 

class 

Exceptions 
{ 
[ 	
Serializable	 
] 
public		 
class		 #
SymbolNotFoundException		 ,
:		- .
	Exception		/ 8
{

 	
public #
SymbolNotFoundException *
(* +
string+ 1
message2 9
)9 :
:; <
base= A
(A B
messageB I
)I J
{ 
} 
	protected #
SymbolNotFoundException -
(- .
SerializationInfo. ?
info@ D
,D E
StreamingContextF V
contextW ^
)^ _
:` a
baseb f
(f g
infog k
,k l
contextm t
)t u
{ 
} 
} 	
} 
} “
rC:\Users\√ñmer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\Finance\Models\Helpers.cs
	namespace 	!
EASYTelegramSignalBot
 
.  
Finance  '
.' (
Models( .
{ 
public 

static 
class 
Helpers 
{		 
public

 
static

 
bool

 
	EqualsAll

 $
<

$ %
T

% &
>

& '
(

' (
this

( ,
T

- .
subject

/ 6
,

6 7
params

8 >
T

? @
[

@ A
]

A B
values

C I
)

I J
{ 	
return 
values 
== 
null !
||" $
values% +
.+ ,
Length, 2
==3 5
$num6 7
||8 :
values; A
.A B
AllB E
(E F
vF G
=>H J
vK L
?L M
.M N
EqualsN T
(T U
subjectU \
)\ ]
??^ `
falsea f
)f g
;g h
} 	
public 
static 
List 
< 
Kline  
>  !
ToKlines" *
(* +
this+ /
IEnumerable0 ;
<; <
IBinanceKline< I
>I J
binanceKlinesK X
)X Y
{ 	
return 
binanceKlines  
.  !
Select! '
(' (
x( )
=>* ,
x- .
.. /
ToKline/ 6
(6 7
)7 8
)8 9
.9 :
ToList: @
(@ A
)A B
;B C
} 	
public 
static 
Kline 
ToKline #
(# $
this$ (
IBinanceKline) 6
binanceKline7 C
)C D
{ 	
Kline 
kline 
= 
new 
( 
) 
{ 
	_OpenDate 
= 
binanceKline (
.( )
OpenTime) 1
,1 2

_CloseDate 
= 
binanceKline )
.) *
	CloseTime* 3
,3 4
_Open 
= 
binanceKline $
.$ %
	OpenPrice% .
,. /
_High 
= 
binanceKline $
.$ %
	HighPrice% .
,. /
_Low 
= 
binanceKline #
.# $
LowPrice$ ,
,, -
_Close 
= 
binanceKline %
.% &

ClosePrice& 0
,0 1
_Volume 
= 
binanceKline &
.& '
QuoteVolume' 2
,2 3
} 
; 
return   
kline   
;   
}!! 	
}"" 
}## ¿M
tC:\Users\√ñmer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\Finance\Models\Indicator.cs
	namespace 	!
EASYTelegramSignalBot
 
.  
Finance  '
.' (
Models( .
{ 
public		 

abstract		 
class		 
	Indicator		 #
:		$ %
IDisposable		& 1
{

 
private 
bool 

isDisposed 
;  
internal 
bool 
isPaused 
; 
public 
string 
Symbol 
{ 
get "
;" #
set$ '
;' (
}) *
public 
KlineInterval 
Interval %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
private 
Enums 
. 
SubscriptionType &
SubscriptionType' 7
{8 9
get: =
;= >
set? B
;B C
}D E
public 
Action 
< 
string 
, 

Dictionary (
<( )
string) /
,/ 0
List1 5
<5 6
object6 <
>< =
>= >
,> ?
Enums@ E
.E F

SignalTypeF P
>P Q
SignalActionR ^
{_ `
geta d
;d e
setf i
;i j
}k l
public 
Action 
< 
string 
, 

Dictionary (
<( )
string) /
,/ 0
List1 5
<5 6
object6 <
>< =
>= >
>> ?
UpdateAction@ L
{M N
getO R
;R S
setT W
;W X
}Y Z
public 
KlineSubscription  
?  !
Subscription" .
{/ 0
get1 4
;4 5
set6 9
;9 :
}; <
public 

TickAction 
? 

TickAction %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public 

Dictionary 
< 
string  
,  !
List" &
<& '
object' -
>- .
>. /
?/ 0
Values1 7
{8 9
get: =
;= >
set? B
;B C
}D E
public 
void 
Dispose 
( 
) 
{ 	
Dispose 
( 
true 
) 
; 
GC 
. 
SuppressFinalize 
(  
this  $
)$ %
;% &
} 	
	protected 
virtual 
void 
Dispose &
(& '
bool' +
	disposing, 5
)5 6
{ 	
if   
(   

isDisposed   
)   
return   "
;  " #
if"" 
("" 
Subscription"" 
=="" 
null""  $
)""$ %
return""& ,
;"", -

TickAction## 
?## 
func## 
=## 
Subscription## +
.##+ ,
Actions##, 3
.##3 4
First##4 9
(##9 :
x##: ;
=>##< >
x##? @
.##@ A
Creator##A H
==##I K
this##L P
)##P Q
;##Q R
StaticBinance$$ 
.$$ 
DeleteAction$$ &
($$& '
Subscription$$' 3
,$$3 4
func$$5 9
)$$9 :
;$$: ;

isDisposed&& 
=&& 
true&& 
;&& 
}'' 	
	protected)) 
	Indicator)) 
()) 
string)) "
symbol))# )
,))) *
KlineInterval))+ 8
interval))9 A
,))A B
Enums))C H
.))H I
SubscriptionType))I Y
subscriptionType))Z j
,))j k
Action))l r
<))r s
string))s y
,))y z

Dictionary	)){ Ö
<
))Ö Ü
string
))Ü å
,
))å ç
List
))é í
<
))í ì
object
))ì ô
>
))ô ö
>
))ö õ
,
))õ ú
Enums
))ù ¢
.
))¢ £

SignalType
))£ ≠
>
))≠ Æ
signalAction
))Ø ª
,
))ª º
Action
))Ω √
<
))√ ƒ
string
))ƒ  
,
))  À

Dictionary
))Ã ÷
<
))÷ ◊
string
))◊ ›
,
))› ﬁ
List
))ﬂ „
<
))„ ‰
object
))‰ Í
>
))Í Î
>
))Î Ï
>
))Ï Ì
updateAction
))Ó ˙
,
))˙ ˚
bool
))¸ Ä
isPaused
))Å â
=
))ä ã
false
))å ë
)
))ë í
{** 	
if++ 
(++ 
(++ 
SubscriptionType++ !
==++" $
Enums++% *
.++* +
SubscriptionType+++ ;
.++; <
Spot++< @
&&++A C
!++D E
StaticBinance++E R
.++R S
ExchangeInfos++S `
.++` a
Spot++a e
.++e f
Any++f i
(++i j
x++j k
=>++l n
x++o p
.++p q
Name++q u
.++u v
ToLower++v }
(++} ~
)++~ 
.	++ Ä
Equals
++Ä Ü
(
++Ü á
symbol
++á ç
.
++ç é
ToLower
++é ï
(
++ï ñ
)
++ñ ó
)
++ó ò
)
++ò ô
)
++ô ö
||
++õ ù
(,, 
SubscriptionType,, !
==,," $
Enums,,% *
.,,* +
SubscriptionType,,+ ;
.,,; <

UsdFutures,,< F
&&,,G I
!,,J K
StaticBinance,,K X
.,,X Y
ExchangeInfos,,Y f
.,,f g
Usdt,,g k
.,,k l
Any,,l o
(,,o p
x,,p q
=>,,r t
x,,u v
.,,v w
Name,,w {
.,,{ |
ToLower	,,| É
(
,,É Ñ
)
,,Ñ Ö
.
,,Ö Ü
Equals
,,Ü å
(
,,å ç
symbol
,,ç ì
.
,,ì î
ToLower
,,î õ
(
,,õ ú
)
,,ú ù
)
,,ù û
)
,,û ü
)
,,ü †
||
,,° £
(-- 
SubscriptionType-- !
==--" $
Enums--% *
.--* +
SubscriptionType--+ ;
.--; <
CoinFutures--< G
&&--H J
!--K L
StaticBinance--L Y
.--Y Z
ExchangeInfos--Z g
.--g h
Coin--h l
.--l m
Any--m p
(--p q
x--q r
=>--s u
x--v w
.--w x
Name--x |
.--| }
ToLower	--} Ñ
(
--Ñ Ö
)
--Ö Ü
.
--Ü á
Equals
--á ç
(
--ç é
symbol
--é î
.
--î ï
ToLower
--ï ú
(
--ú ù
)
--ù û
)
--û ü
)
--ü †
)
--† °
)
--° ¢
{.. 
throw// 
new// 

Exceptions// $
.//$ %#
SymbolNotFoundException//% <
(//< =
$str//= [
)//[ \
;//\ ]
}00 
Symbol22 
=22 
symbol22 
.22 
ToLower22 #
(22# $
)22$ %
;22% &
SubscriptionType33 
=33 
subscriptionType33 /
;33/ 0
Interval44 
=44 
interval44 
;44  
SignalAction55 
=55 
signalAction55 '
;55' (
UpdateAction66 
=66 
updateAction66 '
;66' (
this77 
.77 
isPaused77 
=77 
isPaused77 $
;77$ %
}88 	
public:: 
void:: 
	Subscribe:: 
(:: 
):: 
{;; 	
if<< 
(<< 

TickAction<< 
==<< 
null<< "
)<<" #
return<<$ *
;<<* +
Subscription== 
=== 
StaticBinance== (
.==( )(
SubscribeToKlineUpdatesAsync==) E
(==E F
SubscriptionType>>  
,>>  !
Symbol?? 
,?? 
Interval@@ 
,@@ 

TickActionAA 
)AA 
;AA 
}BB 	
publicDD 
voidDD 
ChangeIntervalDD "
(DD" #
KlineIntervalDD# 0
klineIntervalDD1 >
)DD> ?
{EE 	
ifFF 
(FF 
SubscriptionFF 
==FF 
nullFF  $
)FF$ %
returnFF& ,
;FF, -
IntervalGG 
=GG 
klineIntervalGG $
;GG$ %

TickActionHH 
?HH 
funcHH 
=HH 
SubscriptionHH +
.HH+ ,
ActionsHH, 3
.HH3 4
FirstHH4 9
(HH9 :
xHH: ;
=>HH< >
xHH? @
.HH@ A
CreatorHHA H
==HHI K
thisHHL P
)HHP Q
;HHQ R
StaticBinanceII 
.II 
DeleteActionII &
(II& '
SubscriptionII' 3
,II3 4
funcII5 9
)II9 :
;II: ;
	SubscribeKK 
(KK 
)KK 
;KK 
}LL 	
publicNN 
voidNN 
ContinueNN 
(NN 
)NN 
{OO 	
isPausedPP 
=PP 
falsePP 
;PP 
}QQ 	
publicSS 
voidSS 
PauseSS 
(SS 
)SS 
{TT 	
isPausedUU 
=UU 
trueUU 
;UU 
}VV 	
}XX 
}YY ¨&
pC:\Users\√ñmer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\Finance\Models\Kline.cs
	namespace 	!
EASYTelegramSignalBot
 
.  
Finance  '
.' (
Binance( /
{ 
public 

class 
Kline 
: 
IQuote 
{ 
private 
DateTime 

__OpenDate #
{$ %
get& )
;) *
set+ .
;. /
}0 1
private		 
DateTime		 
__CloseDate		 $
{		% &
get		' *
;		* +
set		, /
;		/ 0
}		1 2
private

 
decimal

 
__Open

 
{

  
get

! $
;

$ %
set

& )
;

) *
}

+ ,
private 
decimal 
__High 
{  
get! $
;$ %
set& )
;) *
}+ ,
private 
decimal 
__Low 
{ 
get  #
;# $
set% (
;( )
}* +
private 
decimal 
__Close 
{  !
get" %
;% &
set' *
;* +
}, -
private 
decimal 
__Volume  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
DateTime 
	_OpenDate !
{" #
get$ '
=>( *

__OpenDate+ 5
;5 6
set7 :
=>; =

__OpenDate> H
=I J
valueK P
;P Q
}R S
public 
DateTime 

_CloseDate "
{# $
get% (
=>) +
__CloseDate, 7
;7 8
set9 <
=>= ?
__CloseDate@ K
=L M
valueN S
;S T
}U V
public 
decimal 
_Open 
{ 
get "
=># %
__Open& ,
;, -
set. 1
=>2 4
__Open5 ;
=< =
value> C
;C D
}E F
public 
decimal 
_High 
{ 
get "
=># %
__High& ,
;, -
set. 1
=>2 4
__High5 ;
=< =
value> C
;C D
}E F
public 
decimal 
_Low 
{ 
get !
=>" $
__Low% *
;* +
set, /
=>0 2
__Low3 8
=9 :
value; @
;@ A
}B C
public 
decimal 
_Close 
{ 
get  #
=>$ &
__Close' .
;. /
set0 3
=>4 6
__Close7 >
=? @
valueA F
;F G
}H I
public 
decimal 
_Volume 
{  
get! $
=>% '
__Volume( 0
;0 1
set2 5
=>6 8
__Volume9 A
=B C
valueD I
;I J
}K L
public 
DateTime 
Date 
{ 
get "
=># %
	_OpenDate& /
;/ 0
set1 4
=>5 7
	_OpenDate8 A
=B C
valueD I
;I J
}K L
public 
decimal 
Open 
{ 
get !
=>" $
_Open% *
;* +
set, /
=>0 2
_Open3 8
=9 :
value; @
;@ A
}B C
public 
decimal 
High 
{ 
get !
=>" $
_High% *
;* +
set, /
=>0 2
_High3 8
=9 :
value; @
;@ A
}B C
public 
decimal 
Low 
{ 
get  
=>! #
_Low$ (
;( )
set* -
=>. 0
_Low1 5
=6 7
value8 =
;= >
}? @
public 
decimal 
Close 
{ 
get "
=># %
_Close& ,
;, -
set. 1
=>2 4
_Close5 ;
=< =
value> C
;C D
}E F
public 
decimal 
Volume 
{ 
get  #
=>$ &
_Volume' .
;. /
set0 3
=>4 6
_Volume7 >
=? @
valueA F
;F G
}H I
} 
}   Á
uC:\Users\√ñmer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\Finance\Models\TickAction.cs
	namespace 	!
EASYTelegramSignalBot
 
.  
Finance  '
.' (
Models( .
{ 
public 

class 

TickAction 
{ 
public		 
	Indicator		 
Creator		  
{		! "
get		# &
;		& '
set		( +
;		+ ,
}		- .
public

 
Action

 
<

 
List

 
<

 
Kline

  
>

  !
>

! "
Action

# )
{

* +
get

, /
;

/ 0
set

1 4
;

4 5
}

6 7
public 
Enums 
. 
TriggerType  
TriggerType! ,
{- .
get/ 2
;2 3
set4 7
;7 8
}9 :
public 
int 

KlineCount 
{ 
get  #
;# $
set% (
;( )
}* +
} 
} úZ
vC:\Users\√ñmer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\NewsBot\CryptopanicNewsBot.cs
	namespace 	!
EASYTelegramSignalBot
 
.  
NewsBot  '
{ 
public 

class 
CryptopanicNewsBot #
{ 
private 
string 
ApiUrl 
{ 
get  #
;# $
set% (
;( )
}* +
private 
DispatcherTimer 
Timer  %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
private 
int 
? 
LastReportId !
{" #
get$ '
;' (
set) ,
;, -
}. /
private 
bool 

IsUpdating 
{  !
get" %
;% &
set' *
;* +
}, -
public 
CryptopanicNewsBot !
(! "
)" #
{ 	

IsUpdating 
= 
false 
; 
ApiUrl 
= 
$" 
$str H
{H I
SettingsI Q
.Q R
BotsSettingsR ^
.^ _
NewsSettings_ k
.k l
Keyl o
}o p
"p q
;q r
Timer 
= 
new 
( 
) 
; 
Timer 
. 
Tick 
+= 
( 
object !
?! "
sender# )
,) *
	EventArgs+ 4
e5 6
)6 7
=>8 :
{ 
if 
( 

IsUpdating 
) 
return  &
;& '

IsUpdating 
= 
true !
;! "

UpdateNews   
(   
)   
.   
Wait   !
(  ! "
)  " #
;  # $

IsUpdating!! 
=!! 
false!! "
;!!" #
}"" 
;"" 
Timer## 
.## 
Interval## 
=## 
TimeSpan## %
.##% &
FromSeconds##& 1
(##1 2
Settings##2 :
.##: ;
BotsSettings##; G
.##G H
NewsSettings##H T
.##T U
Interval##U ]
)##] ^
;##^ _
Timer$$ 
.$$ 
Start$$ 
($$ 
)$$ 
;$$ 
Console%% 
.%% 
	WriteLine%% 
(%% 
$str%% <
)%%< =
;%%= >
}&& 	
private(( 
async(( 
Task(( 

UpdateNews(( %
(((% &
)((& '
{)) 	
Console** 
.** 
	WriteLine** 
(** 
$str** K
)**K L
;**L M
Response++ 
?++ 
apiResponse++ !
=++" #
Task++$ (
.++( )
Run++) ,
(++, -
(++- .
)++. /
=>++0 2
GetNews++3 :
(++: ;
)++; <
)++< =
.++= >
Result++> D
;++D E
if,, 
(,, 
apiResponse,, 
==,, 
null,, #
),,# $
{-- 
Console.. 
... 
	WriteLine.. !
(..! "
$str	.." Ω
)
..Ω æ
;
..æ ø
return// 
;// 
}00 
List22 
<22 
Result22 
>22 
?22 
News22 
=22  
apiResponse22! ,
.22, -
results22- 4
;224 5
if44 
(44 
LastReportId44 
==44 
null44  $
)44$ %
LastReportId44& 2
=443 4
News445 9
[449 :
$num44: ;
]44; <
.44< =
id44= ?
;44? @
if55 
(55 
News55 
==55 
null55 
)55 
{66 
Console77 
.77 
	WriteLine77 !
(77! "
$str77" G
)77G H
;77H I
}88 
else99 
{:: 
foreach;; 
(;; 
Result;; 
?;;  
report;;! '
in;;( *
News;;+ /
);;/ 0
{<< 
if== 
(== 
report== 
.== 
id== !
====" $
LastReportId==% 1
)==1 2
break==3 8
;==8 9
string>> 
?>> 
translatedTitle>> +
=>>, -
Task>>. 2
.>>2 3
Run>>3 6
(>>6 7
(>>7 8
)>>8 9
=>>>: <
	Translate>>= F
.>>F G
TranslateText>>G T
(>>T U
$str>>U Y
,>>Y Z
$str>>[ _
,>>_ `
report>>a g
.>>g h
title>>h m
)>>m n
)>>n o
.>>o p
Result>>p v
;>>v w
if?? 
(?? 
string?? 
.?? 
IsNullOrEmpty?? ,
(??, -
translatedTitle??- <
)??< =
)??= >
continue??? G
;??G H
stringAA 

currenciesAA %
=AA& '
stringAA( .
.AA. /
EmptyAA/ 4
;AA4 5
ifBB 
(BB 
reportBB 
.BB 

currenciesBB )
!=BB* ,
nullBB- 1
)BB1 2
reportBB3 9
.BB9 :

currenciesBB: D
.BBD E
ForEachBBE L
(BBL M
xBBM N
=>BBO Q

currenciesBBR \
+=BB] _
xBB` a
.BBa b
titleBBb g
+BBh i
$"BBj l
$strBBl m
{BBm n
xBBn o
.BBo p
codeBBp t
}BBt u
$strBBu x
"BBx y
)BBy z
;BBz {
stringDD 
messageDD "
=DD# $
SettingsDD% -
.DD- .
BotsSettingsDD. :
.DD: ;
NewsSettingsDD; G
.DDG H
MessageDDH O
.DDO P
ReplaceEE 
(EE  
$strEE  )
,EE) *
translatedTitleEE+ :
)EE: ;
.EE; <
ReplaceFF 
(FF  
$strFF  (
,FF( )
$"FF* ,
$strFF, -
{FF- .
reportFF. 4
.FF4 5
sourceFF5 ;
.FF; <
titleFF< A
}FFA B
$strFFB L
{FFL M
reportFFM S
.FFS T
sourceFFT Z
.FFZ [
domainFF[ a
}FFa b
$strFFb d
"FFd e
)FFe f
.FFf g
ReplaceGG 
(GG  
$strGG  )
,GG) *

currenciesGG+ 5
)GG5 6
;GG6 7
TaskII 
.II 
RunII 
(II 
(II 
)II 
=>II  "
SendMessagesII# /
(II/ 0
messageII0 7
)II7 8
)II8 9
;II9 :
}JJ 
LastReportIdKK 
=KK 
NewsKK #
[KK# $
$numKK$ %
]KK% &
.KK& '
idKK' )
;KK) *
}LL 
ConsoleNN 
.NN 
	WriteLineNN 
(NN 
$strNN I
)NNI J
;NNJ K
}OO 	
privateQQ 
staticQQ 
TaskQQ 
SendMessagesQQ (
(QQ( )
stringQQ) /
messageQQ0 7
)QQ7 8
{RR 	
foreachSS 
(SS 
UserSS 
userSS 
inSS !
DatabaseSS" *
.SS* +

ConnectionSS+ 5
.SS5 6
ContextSS6 =
.SS= >
UsersSS> C
)SSC D
{TT 
tryUU 
{VV 
ifWW 
(WW 
userWW 
.WW 
ChatIdWW #
==WW$ &
$numWW' (
||WW) +
!WW, -
userWW- 1
.WW1 2
NewsWW2 6
)WW6 7
continueWW8 @
;WW@ A

BotClientsXX 
.XX 

NewsClientXX )
.XX) * 
SendTextMessageAsyncXX* >
(XX> ?
userXX? C
.XXC D
ChatIdXXD J
,XXJ K
messageXXL S
,XXS T
	parseModeXXU ^
:XX^ _
TeleApiXX` g
.XXg h
TypesXXh m
.XXm n
EnumsXXn s
.XXs t
	ParseModeXXt }
.XX} ~
Markdown	XX~ Ü
)
XXÜ á
;
XXá à
}YY 
catchZZ 
(ZZ 
	ExceptionZZ  
exZZ! #
)ZZ# $
{[[ 
Console\\ 
.\\ 
	WriteLine\\ %
(\\% &
$"\\& (
$str\\( 9
{\\9 :
user\\: >
.\\> ?
Username\\? G
}\\G H
$str\\H c
{\\c d
ex\\d f
.\\f g
Message\\g n
}\\n o
"\\o p
)\\p q
;\\q r
}]] 
}__ 
foreachaa 
(aa 
stringaa 
?aa 
groupaa "
inaa# %
Settingsaa& .
.aa. /
TelegramSettingsaa/ ?
.aa? @
	TDIGroupsaa@ I
)aaI J
{bb 
trycc 
{dd 

BotClientsee 
.ee 

NewsClientee )
.ee) * 
SendTextMessageAsyncee* >
(ee> ?
groupee? D
,eeD E
messageeeF M
,eeM N
	parseModeeeO X
:eeX Y
TeleApieeZ a
.eea b
Typeseeb g
.eeg h
Enumseeh m
.eem n
	ParseModeeen w
.eew x
Markdown	eex Ä
)
eeÄ Å
;
eeÅ Ç
}ff 
catchgg 
(gg 
	Exceptiongg  
exgg! #
)gg# $
{hh 
Consoleii 
.ii 
	WriteLineii %
(ii% &
$"ii& (
$strii( 8
{ii8 9
groupii9 >
}ii> ?
$strii? Z
{iiZ [
exii[ ]
.ii] ^
Messageii^ e
}iie f
"iif g
)iig h
;iih i
}jj 
}kk 
returnmm 
Taskmm 
.mm 
Delaymm 
(mm 
$nummm 
)mm  
;mm  !
}nn 	
privatepp 
asyncpp 
Taskpp 
<pp 
Responsepp #
?pp# $
>pp$ %
GetNewspp& -
(pp- .
)pp. /
{qq 	
tryrr 
{ss 
stringtt 
newsDatatt 
=tt  !
awaittt" '
Requesttt( /
.tt/ 0
Gettt0 3
(tt3 4
ApiUrltt4 :
)tt: ;
;tt; <
Responseuu 
?uu 
newsuu 
=uu  
JsonConvertuu! ,
.uu, -
DeserializeObjectuu- >
<uu> ?
Responseuu? G
>uuG H
(uuH I
newsDatauuI Q
)uuQ R
;uuR S
returnvv 
newsvv 
;vv 
}ww 
catchxx 
(xx 
	Exceptionxx 
exxx 
)xx  
{yy 
Consolezz 
.zz 
	WriteLinezz !
(zz! "
$"zz" $
$strzz$ ?
{zz? @
exzz@ B
.zzB C
MessagezzC J
}zzJ K
"zzK L
)zzL M
;zzM N
return{{ 
null{{ 
;{{ 
}|| 
}}} 	
}~~ 
} „
sC:\Users\√ñmer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\NewsBot\Helpers\Request.cs
	namespace 	!
EASYTelegramSignalBot
 
.  
NewsBot  '
.' (
Helpers( /
{ 
public 

static 
class 
Request 
{ 
public		 
static		 
async		 
Task		  
<		  !
string		! '
>		' (
Post		) -
(		- .
string		. 4
url		5 8
,		8 9
string		: @
data		A E
)		E F
{

 	
using 

HttpClient 
? 
client $
=% &
new' *

HttpClient+ 5
(5 6
)6 7
;7 8
StringContent 
? 
postData #
=$ %
new& )
StringContent* 7
(7 8
data8 <
,< =
Encoding> F
.F G
UTF8G K
,K L
$strM _
)_ `
;` a
HttpResponseMessage 
?  
response! )
=* +
await, 1
client2 8
.8 9
	PostAsync9 B
(B C
urlC F
,F G
postDataH P
)P Q
;Q R
string 
? 
result 
= 
await "
response# +
.+ ,
Content, 3
.3 4
ReadAsStringAsync4 E
(E F
)F G
;G H
return 
result 
; 
} 	
public 
static 
async 
Task  
<  !
string! '
>' (
Get) ,
(, -
string- 3
url4 7
)7 8
{ 	
using 

HttpClient 
? 
client $
=% &
new' *

HttpClient+ 5
(5 6
)6 7
;7 8
string 
? 
content 
= 
Task "
." #
Run# &
(& '
(' (
)( )
=>* ,
client- 3
.3 4
GetStringAsync4 B
(B C
urlC F
)F G
)G H
.H I
ResultI O
;O P
return 
content 
; 
} 	
} 
} º
uC:\Users\√ñmer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\NewsBot\Helpers\Translate.cs
	namespace 	!
EASYTelegramSignalBot
 
.  
NewsBot  '
.' (
Helpers( /
{ 
public 

static 
class 
	Translate !
{ 
public		 
static		 
async		 
Task		  
<		  !
string		! '
?		' (
>		( )
TranslateText		* 7
(		7 8
string		8 >
from		? C
,		C D
string		E K
to		L N
,		N O
string		P V
data		W [
)		[ \
{

 	

HttpClient 
? 
client 
=  
new! $

HttpClient% /
(/ 0
)0 1
;1 2
try 
{ 
HttpResponseMessage #
?# $
result% +
=, -
Task. 2
.2 3
Run3 6
(6 7
(7 8
)8 9
=>: <
client= C
.C D
GetAsyncD L
(L M
newM P
UriQ T
(T U
$str	U ô
+
ö õ
from
ú †
+
° ¢
$str
£ ©
+
™ ´
to
¨ Æ
+
Ø ∞
$str
± ª
+
º Ω
data
æ ¬
)
¬ √
)
√ ƒ
)
ƒ ≈
.
≈ ∆
Result
∆ Ã
;
Ã Õ
string 
[ 
] 
json 
= 
result  &
.& '
Content' .
.. /
ReadAsStringAsync/ @
(@ A
)A B
.B C
ResultC I
.I J
SplitJ O
(O P
$charP S
)S T
;T U
string 
? 
translatedText &
=' (
json) -
[- .
$num. /
]/ 0
;0 1
if 
( 
translatedText "
==# %
$str& \
)\ ]
{ 
Console 
. 
	WriteLine %
(% &
$str& \
)\ ]
;] ^
return 
null 
;  
} 
return 
translatedText %
;% &
} 
catch 
( 
	Exception 
ex 
)  
{ 
Console 
. 
	WriteLine !
(! "
$"" $
$str$ =
{= >
ex> @
.@ A
MessageA H
}H I
"I J
)J K
;K L
return 
null 
; 
} 
} 	
} 
} Õ,
sC:\Users\√ñmer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\NewsBot\Models\Response.cs
	namespace 	!
EASYTelegramSignalBot
 
.  
NewsBot  '
.' (
Models( .
{ 
public 

class 
Response 
{ 
public 
int 
count 
{ 
get 
; 
set  #
;# $
}% &
public		 
string		 
next		 
{		 
get		  
;		  !
set		" %
;		% &
}		' (
public

 
object

 
previous

 
{

  
get

! $
;

$ %
set

& )
;

) *
}

+ ,
public 
List 
< 
Result 
> 
results #
{$ %
get& )
;) *
set+ .
;. /
}0 1
} 
public 

class 
Result 
{ 
public 
string 
kind 
{ 
get  
;  !
set" %
;% &
}' (
public 
string 
domain 
{ 
get "
;" #
set$ '
;' (
}) *
public 
Votes 
votes 
{ 
get  
;  !
set" %
;% &
}' (
public 
Source 
source 
{ 
get "
;" #
set$ '
;' (
}) *
public 
string 
title 
{ 
get !
;! "
set# &
;& '
}( )
public 
DateTime 
published_at $
{% &
get' *
;* +
set, /
;/ 0
}1 2
public 
string 
slug 
{ 
get  
;  !
set" %
;% &
}' (
public 
int 
id 
{ 
get 
; 
set  
;  !
}" #
public 
string 
url 
{ 
get 
;  
set! $
;$ %
}& '
public 
DateTime 

created_at "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
List 
< 
Currency 
> 

currencies (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
} 
public 

class 
Votes 
{ 
public 
int 
negative 
{ 
get !
;! "
set# &
;& '
}( )
public   
int   
positive   
{   
get   !
;  ! "
set  # &
;  & '
}  ( )
public!! 
int!! 
	important!! 
{!! 
get!! "
;!!" #
set!!$ '
;!!' (
}!!) *
public"" 
int"" 
liked"" 
{"" 
get"" 
;"" 
set""  #
;""# $
}""% &
public## 
int## 
disliked## 
{## 
get## !
;##! "
set### &
;##& '
}##( )
public$$ 
int$$ 
lol$$ 
{$$ 
get$$ 
;$$ 
set$$ !
;$$! "
}$$# $
public%% 
int%% 
toxic%% 
{%% 
get%% 
;%% 
set%%  #
;%%# $
}%%% &
public&& 
int&& 
saved&& 
{&& 
get&& 
;&& 
set&&  #
;&&# $
}&&% &
public'' 
int'' 
comments'' 
{'' 
get'' !
;''! "
set''# &
;''& '
}''( )
}(( 
public** 

class** 
Source** 
{++ 
public,, 
string,, 
title,, 
{,, 
get,, !
;,,! "
set,,# &
;,,& '
},,( )
public-- 
string-- 
region-- 
{-- 
get-- "
;--" #
set--$ '
;--' (
}--) *
public.. 
string.. 
domain.. 
{.. 
get.. "
;.." #
set..$ '
;..' (
}..) *
public// 
object// 
path// 
{// 
get//  
;//  !
set//" %
;//% &
}//' (
}00 
public22 

class22 
Currency22 
{33 
public44 
string44 
code44 
{44 
get44  
;44  !
set44" %
;44% &
}44' (
public55 
string55 
title55 
{55 
get55 !
;55! "
set55# &
;55& '
}55( )
public66 
string66 
slug66 
{66 
get66  
;66  !
set66" %
;66% &
}66' (
public77 
string77 
url77 
{77 
get77 
;77  
set77! $
;77$ %
}77& '
}88 
}99 ≥O
{C:\Users\√ñmer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\SettingsManager\Models\Settings.cs
	namespace 	!
EASYTelegramSignalBot
 
.  
SettingsManager  /
./ 0
Models0 6
{ 
public 

class 
Settings 
{ 
public 
Databasesettings 
DatabaseSettings  0
{1 2
get3 6
;6 7
set8 ;
;; <
}= >
public 
Telegramsettings 
TelegramSettings  0
{1 2
get3 6
;6 7
set8 ;
;; <
}= >
public		 
Botssettings		 
BotsSettings		 (
{		) *
get		+ .
;		. /
set		0 3
;		3 4
}		5 6
}

 
public 

class 
Databasesettings !
{ 
public 
string $
DatabaseConnectionString .
{/ 0
get1 4
;4 5
set6 9
;9 :
}; <
public 
bool #
IsDatabaseEnsureCreated +
{, -
get. 1
;1 2
set3 6
;6 7
}8 9
public 
bool #
ResetDatabaseFirstStart +
{, -
get. 1
;1 2
set3 6
;6 7
}8 9
} 
public 

class 
Telegramsettings !
{ 
public 
List 
< 
string 
> 
	TDIGroups %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public 
string 
TDIBot 
{ 
get "
;" #
set$ '
;' (
}) *
public 
List 
< 
string 
> 
	PACGroups %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public 
string 
PACBot 
{ 
get "
;" #
set$ '
;' (
}) *
public 
List 
< 
string 
> 
	RSIGroups %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public 
string 
RSIBot 
{ 
get "
;" #
set$ '
;' (
}) *
public 
List 
< 
string 
> 

NewsGroups &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
public 
string 
NewsBot 
{ 
get  #
;# $
set% (
;( )
}* +
} 
public   

class   
Botssettings   
{!! 
public"" 
float"" (
UpdateExpiredUsersTickMunite"" 1
{""2 3
get""4 7
;""7 8
set""9 <
;""< =
}""> ?
public## 
Tdisettings## 
TDISettings## &
{##' (
get##) ,
;##, -
set##. 1
;##1 2
}##3 4
public$$ 
Pacsettings$$ 
PACSettings$$ &
{$$' (
get$$) ,
;$$, -
set$$. 1
;$$1 2
}$$3 4
public%% 
Rsisettings%% 
RSISettings%% &
{%%' (
get%%) ,
;%%, -
set%%. 1
;%%1 2
}%%3 4
public&& 
Newssettings&& 
NewsSettings&& (
{&&) *
get&&+ .
;&&. /
set&&0 3
;&&3 4
}&&5 6
}'' 
public)) 

class)) 
Newssettings)) 
{** 
public++ 
string++ 
Key++ 
{++ 
get++ 
;++  
set++! $
;++$ %
}++& '
public,, 
int,, 
Interval,, 
{,, 
get,, !
;,,! "
set,,# &
;,,& '
},,( )
public-- 
string-- 
Message-- 
{-- 
get--  #
;--# $
set--% (
;--( )
}--* +
}.. 
public00 

class00 
Tdisettings00 
{11 
public22 
List22 
<22 
string22 
>22 
Symbols22 #
{22$ %
get22& )
;22) *
set22+ .
;22. /
}220 1
public33 
Tdisignalmessages33  
SignalMessages33! /
{330 1
get332 5
;335 6
set337 :
;33: ;
}33< =
public44 
int44 
	RSIPeriot44 
{44 
get44 "
;44" #
set44$ '
;44' (
}44) *
public55 
int55 
VotalityBandPeriot55 %
{55& '
get55( +
;55+ ,
set55- 0
;550 1
}552 3
public66 
int66 
RSIPLPeriot66 
{66  
get66! $
;66$ %
set66& )
;66) *
}66+ ,
public77 
int77 
	TSLPeriot77 
{77 
get77 "
;77" #
set77$ '
;77' (
}77) *
public88 
int88 
RSIOversoldLevel88 #
{88$ %
get88& )
;88) *
set88+ .
;88. /
}880 1
public99 
int99 
RSIOverboughtLevet99 %
{99& '
get99( +
;99+ ,
set99- 0
;990 1
}992 3
public:: 
int:: 
MinSignalPeriot:: "
{::# $
get::% (
;::( )
set::* -
;::- .
}::/ 0
public;; 
string;; 
KlineInterval;; #
{;;$ %
get;;& )
;;;) *
set;;+ .
;;;. /
};;0 1
}<< 
public>> 

class>> 
Pacsettings>> 
{?? 
public@@ 
List@@ 
<@@ 
string@@ 
>@@ 
Symbols@@ #
{@@$ %
get@@& )
;@@) *
set@@+ .
;@@. /
}@@0 1
publicAA 
PacsignalmessagesAA  
SignalMessagesAA! /
{AA0 1
getAA2 5
;AA5 6
setAA7 :
;AA: ;
}AA< =
publicBB 
intBB 

SMMAPeriotBB 
{BB 
getBB  #
;BB# $
setBB% (
;BB( )
}BB* +
publicCC 
intCC 
MinSignalPeriotCC "
{CC# $
getCC% (
;CC( )
setCC* -
;CC- .
}CC/ 0
publicDD 
stringDD 
KlineIntervalDD #
{DD$ %
getDD& )
;DD) *
setDD+ .
;DD. /
}DD0 1
}EE 
publicGG 

classGG 
RsisettingsGG 
{HH 
publicII 
ListII 
<II 
stringII 
>II 
SymbolsII #
{II$ %
getII& )
;II) *
setII+ .
;II. /
}II0 1
publicJJ 
RsisignalmessagesJJ  
SignalMessagesJJ! /
{JJ0 1
getJJ2 5
;JJ5 6
setJJ7 :
;JJ: ;
}JJ< =
publicKK 
intKK 
	RSIPeriotKK 
{KK 
getKK "
;KK" #
setKK$ '
;KK' (
}KK) *
publicLL 
intLL 
RSIOversoldLevelLL #
{LL$ %
getLL& )
;LL) *
setLL+ .
;LL. /
}LL0 1
publicMM 
intMM 
RSIOverboughtLevetMM %
{MM& '
getMM( +
;MM+ ,
setMM- 0
;MM0 1
}MM2 3
publicNN 
intNN 
MinSignalPeriotNN "
{NN# $
getNN% (
;NN( )
setNN* -
;NN- .
}NN/ 0
publicOO 
stringOO 
KlineIntervalOO #
{OO$ %
getOO& )
;OO) *
setOO+ .
;OO. /
}OO0 1
}PP 
publicRR 

classRR 
TdisignalmessagesRR "
{SS 
publicTT 
stringTT 
BuyTT 
{TT 
getTT 
;TT  
setTT! $
;TT$ %
}TT& '
publicUU 
stringUU 
SellUU 
{UU 
getUU  
;UU  !
setUU" %
;UU% &
}UU' (
publicVV 
stringVV 
ExitVV 
{VV 
getVV  
;VV  !
setVV" %
;VV% &
}VV' (
}WW 
publicYY 

classYY 
PacsignalmessagesYY "
{ZZ 
public[[ 
string[[ 
Long[[ 
{[[ 
get[[  
;[[  !
set[[" %
;[[% &
}[[' (
public\\ 
string\\ 
Short\\ 
{\\ 
get\\ !
;\\! "
set\\# &
;\\& '
}\\( )
public]] 
string]] 
Exit]] 
{]] 
get]]  
;]]  !
set]]" %
;]]% &
}]]' (
}^^ 
public`` 

class`` 
Rsisignalmessages`` "
{aa 
publicbb 
stringbb 

Overboughtbb  
{bb! "
getbb# &
;bb& '
setbb( +
;bb+ ,
}bb- .
publiccc 
stringcc 
Oversoldcc 
{cc  
getcc! $
;cc$ %
setcc& )
;cc) *
}cc+ ,
publicdd 
stringdd 
BetweenLevelsdd #
{dd$ %
getdd& )
;dd) *
setdd+ .
;dd. /
}dd0 1
}ee 
}gg ª 
tC:\Users\√ñmer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\SettingsManager\Settings.cs
	namespace 	!
EASYTelegramSignalBot
 
{ 
public 

static 
class 
Settings  
{		 
private

 
static

 
SettingsManager

 &
.

& '
Models

' -
.

- .
Settings

. 6
	_Settings

7 @
{

A B
get

C F
;

F G
set

H K
;

K L
}

M N
public 
static 
void 
LoadSettings '
(' (
)( )
{ 	
try 
{ 
using 
StreamReader "
r# $
=% &
new' *
(* +
$str+ :
): ;
;; <
string 
json 
= 
r 
.  
	ReadToEnd  )
() *
)* +
;+ ,
	_Settings 
= 
JsonConvert '
.' (
DeserializeObject( 9
<9 :
SettingsManager: I
.I J
ModelsJ P
.P Q
SettingsQ Y
>Y Z
(Z [
json[ _
)_ `
;` a
} 
catch 
{ 
Console 
. 
	WriteLine !
(! "
$str" 9
)9 :
;: ;
	_Settings 
= 
new 
SettingsManager  /
./ 0
Models0 6
.6 7
Settings7 ?
(? @
)@ A
;A B
} 
} 	
public 
static 
void 
SaveSettings '
(' (
)( )
{ 	
try 
{ 
using 
StreamWriter "
w# $
=% &
File' +
.+ ,

CreateText, 6
(6 7
$str7 F
)F G
;G H
string   
json   
=   
JsonConvert   )
.  ) *
SerializeObject  * 9
(  9 :
	_Settings  : C
,  C D

Formatting  E O
.  O P
Indented  P X
)  X Y
;  Y Z
w!! 
.!! 
Write!! 
(!! 
json!! 
)!! 
;!! 
}"" 
catch## 
{$$ 
Console%% 
.%% 
	WriteLine%% !
(%%! "
$str%%" ;
)%%; <
;%%< =
}&& 
}'' 	
public)) 
static)) 
void)) $
SetDatabaseEnsureCreated)) 3
())3 4
bool))4 8
	isCreated))9 B
=))C D
true))E I
)))I J
{** 	
	_Settings++ 
.++ 
DatabaseSettings++ &
.++& '#
IsDatabaseEnsureCreated++' >
=++? @
	isCreated++A J
;++J K
SaveSettings,, 
(,, 
),, 
;,, 
}-- 	
public// 
static// 
void// 
DatabaseResetted// +
(//+ ,
)//, -
{00 	
	_Settings11 
.11 
DatabaseSettings11 &
.11& '#
ResetDatabaseFirstStart11' >
=11? @
false11A F
;11F G$
SetDatabaseEnsureCreated22 $
(22$ %
false22% *
)22* +
;22+ ,
}33 	
public55 
static55 
Databasesettings55 &
DatabaseSettings55' 7
=>558 :
	_Settings55; D
.55D E
DatabaseSettings55E U
;55U V
public66 
static66 
Telegramsettings66 &
TelegramSettings66' 7
=>668 :
	_Settings66; D
.66D E
TelegramSettings66E U
;66U V
public77 
static77 
Botssettings77 "
BotsSettings77# /
=>770 2
	_Settings773 <
.77< =
BotsSettings77= I
;77I J
}88 
}99 Û1
oC:\Users\√ñmer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\Telegram\BotClients.cs
	namespace 	!
EASYTelegramSignalBot
 
.  
Telegram  (
{		 
public

 

class

 

BotClients

 
{ 
private 
static #
CancellationTokenSource .
CancelToken/ :
{; <
get= @
;@ A
setB E
;E F
}G H
public 
static 
TelegramBotClient '
	TDIClient( 1
{2 3
get4 7
;7 8
set9 <
;< =
}> ?
public 
static 
TelegramBotClient '
	PACClient( 1
{2 3
get4 7
;7 8
set9 <
;< =
}> ?
public 
static 
TelegramBotClient '
	RSIClient( 1
{2 3
get4 7
;7 8
set9 <
;< =
}> ?
public 
static 
TelegramBotClient '

NewsClient( 2
{3 4
get5 8
;8 9
set: =
;= >
}? @
public 
static 
void 
StartBotClients *
(* +
)+ ,
{ 	
try 
{ 
	TDIClient 
= 
new 
(  
Settings  (
.( )
TelegramSettings) 9
.9 :
TDIBot: @
)@ A
;A B
	PACClient 
= 
new 
(  
Settings  (
.( )
TelegramSettings) 9
.9 :
PACBot: @
)@ A
;A B
	RSIClient 
= 
new 
(  
Settings  (
.( )
TelegramSettings) 9
.9 :
RSIBot: @
)@ A
;A B

NewsClient 
= 
new  
(  !
Settings! )
.) *
TelegramSettings* :
.: ;
NewsBot; B
)B C
;C D
CancelToken 
= 
new !#
CancellationTokenSource" 9
(9 :
): ;
;; <
StartReceiving 
( 
)  
;  !
Console 
. 
	WriteLine !
(! "
$str" <
)< =
;= >
} 
catch 
( 
	Exception 
ex 
)  
{   
Console!! 
.!! 
	WriteLine!! !
(!!! "
$"!!" $
$str!!$ J
{!!J K
ex!!K M
.!!M N
Message!!N U
}!!U V
"!!V W
)!!W X
;!!X Y
}"" 
}## 	
public%% 
static%% 
void%% 
StartReceiving%% )
(%%) *
)%%* +
{&& 	
ReceiverOptions'' 
?'' 
receiverOptions'' ,
=''- .
new''/ 2
(''2 3
)''3 4
{(( 
AllowedUpdates)) 
=))  
Array))! &
.))& '
Empty))' ,
<)), -

UpdateType))- 7
>))7 8
())8 9
)))9 :
,)): ;
ThrowPendingUpdates** #
=**$ %
true**& *
}++ 
;++ 
TDI-- 

TDIHandler-- 
=-- 
new--  
(--  !
	TDIClient--! *
)--* +
;--+ ,
	TDIClient.. 
... 
StartReceiving.. $
(..$ %
updateHandler..% 2
:..2 3

TDIHandler..4 >
...> ?
HandleUpdateAsync..? P
,..P Q
pollingErrorHandler// 2
://2 3

TDIHandler//4 >
.//> ?
PollingErrorHandler//? R
,//R S
receiverOptions00 .
:00. /
receiverOptions000 ?
,00? @
cancellationToken11 0
:110 1
CancelToken112 =
.11= >
Token11> C
)11C D
;11D E
PAC33 

PACHandler33 
=33 
new33  
(33  !
	PACClient33! *
)33* +
;33+ ,
	PACClient44 
.44 
StartReceiving44 $
(44$ %
updateHandler44% 2
:442 3

PACHandler444 >
.44> ?
HandleUpdateAsync44? P
,44P Q
pollingErrorHandler55 &
:55& '

PACHandler55( 2
.552 3
PollingErrorHandler553 F
,55F G
receiverOptions66 "
:66" #
receiverOptions66$ 3
,663 4
cancellationToken77 $
:77$ %
CancelToken77& 1
.771 2
Token772 7
)777 8
;778 9
RSI99 

RSIHandler99 
=99 
new99  
(99  !
	RSIClient99! *
)99* +
;99+ ,
	RSIClient:: 
.:: 
StartReceiving:: $
(::$ %
updateHandler::% 2
:::2 3

RSIHandler::4 >
.::> ?
HandleUpdateAsync::? P
,::P Q
pollingErrorHandler;; &
:;;& '

RSIHandler;;( 2
.;;2 3
PollingErrorHandler;;3 F
,;;F G
receiverOptions<< "
:<<" #
receiverOptions<<$ 3
,<<3 4
cancellationToken== $
:==$ %
CancelToken==& 1
.==1 2
Token==2 7
)==7 8
;==8 9
News?? 
NewsHandler?? 
=?? 
new?? "
(??" #

NewsClient??# -
)??- .
;??. /

NewsClient@@ 
.@@ 
StartReceiving@@ %
(@@% &
updateHandler@@& 3
:@@3 4
NewsHandler@@5 @
.@@@ A
HandleUpdateAsync@@A R
,@@R S
pollingErrorHandlerAA &
:AA& '
NewsHandlerAA( 3
.AA3 4
PollingErrorHandlerAA4 G
,AAG H
receiverOptionsBB "
:BB" #
receiverOptionsBB$ 3
,BB3 4
cancellationTokenCC $
:CC$ %
CancelTokenCC& 1
.CC1 2
TokenCC2 7
)CC7 8
;CC8 9
}DD 	
}EE 
}FF ‘)
}C:\Users\√ñmer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\Telegram\Models\BaseUpdateHandler.cs
	namespace

 	!
EASYTelegramSignalBot


 
.

  
Telegram

  (
.

( )
Models

) /
{ 
public 

abstract 
class 
BaseUpdateHandler +
{ 
public 
ITelegramBotClient !
	BotClient" +
{, -
get. 1
;1 2
set3 6
;6 7
}8 9
public 

Dictionary 
< 

UpdateType $
,$ %
Action& ,
<, -
Message- 4
>4 5
?5 6
>6 7
?7 8
Handlers9 A
{B C
getD G
;G H
setI L
;L M
}N O
public 
BaseUpdateHandler  
(  !
ITelegramBotClient! 3
	botClient4 =
,= >

Dictionary? I
<I J

UpdateTypeJ T
,T U
ActionV \
<\ ]
Message] d
>d e
?e f
>f g
?g h
handlersi q
)q r
{ 	
	BotClient 
= 
	botClient !
;! "
Handlers 
= 
handlers 
;  
} 	
public 
Task 
PollingErrorHandler '
(' (
ITelegramBotClient( :
	botClient; D
,D E
	ExceptionF O
	exceptionP Y
,Y Z
CancellationToken[ l
cancellationTokenm ~
)~ 
{ 	
string 
? 
ErrorMessage  
=! "
	exception# ,
switch- 3
{ 
ApiRequestException #
apiRequestException$ 7
=>8 :
$"; =
$str= S
{S T
apiRequestExceptionT g
.g h
	ErrorCodeh q
}q r
$strr u
{u v 
apiRequestException	v â
.
â ä
Message
ä ë
}
ë í
"
í ì
,
ì î
_ 
=> 
	exception 
. 
ToString '
(' (
)( )
} 
; 
Console 
. 
	WriteLine 
( 
ErrorMessage *
)* +
;+ ,
return   
Task   
.   
CompletedTask   %
;  % &
}!! 	
public## 
async## 
Task## 
HandleUpdateAsync## +
(##+ ,
ITelegramBotClient##, >
	botClient##? H
,##H I
Update##J P
update##Q W
,##W X
CancellationToken##Y j
cancellationToken##k |
)##| }
{$$ 	
Action%% 
<%% 
Message%% 
>%% 
?%% 
handler%% $
;%%$ %
if&& 
(&& 
Handlers&& 
!=&& 
null&&  
&&&&! #
Handlers&&$ ,
.&&, -
ContainsKey&&- 8
(&&8 9
update&&9 ?
.&&? @
Type&&@ D
)&&D E
)&&E F
handler&&G N
=&&O P
Handlers&&Q Y
[&&Y Z
update&&Z `
.&&` a
Type&&a e
]&&e f
;&&f g
else'' 
handler'' 
='' 
('' 
o'' 
)'' 
=>'' !
DefaultMessage''" 0
(''0 1
o''1 2
)''2 3
;''3 4
try)) 
{** 
if++ 
(++ 
handler++ 
==++ 
null++ #
||++$ &
update++' -
.++- .
Message++. 5
==++6 8
null++9 =
)++= >
return++? E
;++E F
handler,, 
?,, 
.,, 
Invoke,, 
(,,  
update,,  &
.,,& '
Message,,' .
),,. /
;,,/ 0
}-- 
catch.. 
(.. 
	Exception.. 
	exception.. &
)..& '
{// 
await00 
PollingErrorHandler00 )
(00) *
	botClient00* 3
,003 4
	exception005 >
,00> ?
cancellationToken00@ Q
)00Q R
;00R S
}11 
}22 	
private44 
Action44 
<44 
Message44 
>44 
?44  
DefaultMessage44! /
(44/ 0
Message440 7
message448 ?
)44? @
{55 	
string66 
text66 
=66 
$str66 v
;66v w
Task88 
.88 
Run88 
(88 
(88 
)88 
=>88 
	BotClient99 
.99  
SendTextMessageAsync99 *
(99* +
chatId99+ 1
:991 2
message993 :
.99: ;
Chat99; ?
.99? @
Id99@ B
,99B C
text99D H
:99H I
text99J N
)99N O
)99O P
;99P Q
return:: 
null:: 
;:: 
};; 	
}<< 
}== «(
xC:\Users\√ñmer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\Telegram\UpdateHandlers\News.cs
	namespace 	!
EASYTelegramSignalBot
 
.  
Telegram  (
.( )
UpdateHandlers) 7
{ 
public 

class 
News 
: 
BaseUpdateHandler )
{ 
public 
static 

Dictionary  
<  !

UpdateType! +
,+ ,
Action- 3
<3 4
Message4 ;
>; <
?< =
>= >
?> ?
Handlers@ H
{I J
getK N
;N O
setP S
;S T
}U V
=W X
newY \
(\ ]
)] ^
;^ _
public 
News 
( 
ITelegramBotClient &
client' -
)- .
:/ 0
base1 5
(5 6
client6 <
,< =
Handlers> F
)F G
{ 	
Handlers 
. 
Add 
( 

UpdateType #
.# $
Message$ +
,+ ,
(- .
o. /
)/ 0
=>1 3
Message4 ;
(; <
o< =
)= >
)> ?
;? @
} 	
public 
Action 
< 
Message 
> 
? 
Message  '
(' (
Message( /
message0 7
)7 8
{ 	
if 
( 
message 
. 
Text 
!= 
$str  (
)( )
return* 0
null1 5
;5 6
string 
text 
= 
$str )
;) *
if 
( 
string 
. 
IsNullOrEmpty $
($ %
message% ,
., -
Chat- 1
.1 2
Username2 :
): ;
); <
{ 
text 
= 
$str	 Ç
;
Ç É
} 
else 
if 
( 

Connection 
.  
Context  '
.' (
Users( -
.- .
Any. 1
(1 2
x2 3
=>4 6
x7 8
.8 9
Username9 A
==B D
messageE L
.L M
ChatM Q
.Q R
UsernameR Z
)Z [
)[ \
{ 
Database   
.   
Models   
.    
User    $
?  $ %
user  & *
=  + ,

Connection  - 7
.  7 8
Context  8 ?
.  ? @
Users  @ E
.  E F
Where  F K
(  K L
x  L M
=>  N P
x  Q R
.  R S
Username  S [
==  \ ^
message  _ f
.  f g
Chat  g k
.  k l
Username  l t
)  t u
.  u v
First  v {
(  { |
)  | }
;  } ~
if"" 
("" 
user"" 
."" 
ChatId"" 
==""  "
$num""# $
)""$ %
{## 
user$$ 
.$$ 
ChatId$$ 
=$$  !
message$$" )
.$$) *
Chat$$* .
.$$. /
Id$$/ 1
;$$1 2

Connection%% 
.%% 
Context%% &
.%%& '
SaveChanges%%' 2
(%%2 3
)%%3 4
;%%4 5
}&& 
if(( 
((( 
user(( 
.(( 
NewsExpiryDate(( '
<((( )
DateTime((* 2
.((2 3
Now((3 6
)((6 7
{)) 
text** 
+=** 
$"** 
$str** =
"**= >
;**> ?
user++ 
.++ 
News++ 
=++ 
false++  %
;++% &

Connection,, 
.,, 
Context,, &
.,,& '
SaveChanges,,' 2
(,,2 3
),,3 4
;,,4 5
}-- 
text// 
+=// 
$"// 
$str// =
{//= >
user//> B
.//B C
NewsExpiryDate//C Q
}//Q R
$str//R T
"//T U
;//U V
}11 
else22 
{33 
text44 
=44 
$str44 T
;44T U
}55 
Task77 
.77 
Run77 
(77 
(77 
)77 
=>77 
	BotClient77 $
.77$ % 
SendTextMessageAsync77% 9
(779 :
chatId77: @
:77@ A
message77B I
.77I J
Chat77J N
.77N O
Id77O Q
,77Q R
	parseMode77S \
:77\ ]
	ParseMode77^ g
.77g h
Markdown77h p
,77p q
text77r v
:77v w
text77x |
)77| }
)77} ~
;77~ 
return99 
null99 
;99 
}:: 	
};; 
}<< ÷-
wC:\Users\√ñmer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\Telegram\UpdateHandlers\PAC.cs
	namespace 	!
EASYTelegramSignalBot
 
.  
Telegram  (
.( )
UpdateHandlers) 7
{ 
public 

class 
PAC 
: 
BaseUpdateHandler (
{ 
public 
static 

Dictionary  
<  !

UpdateType! +
,+ ,
Action- 3
<3 4
Message4 ;
>; <
?< =
>= >
?> ?
Handlers@ H
{I J
getK N
;N O
setP S
;S T
}U V
=W X
newY \
(\ ]
)] ^
;^ _
public 
PAC 
( 
ITelegramBotClient %
client& ,
), -
:. /
base0 4
(4 5
client5 ;
,; <
Handlers= E
)E F
{ 	
Handlers 
. 
Add 
( 

UpdateType #
.# $
Message$ +
,+ ,
(- .
o. /
)/ 0
=>1 3
Message4 ;
(; <
o< =
)= >
)> ?
;? @
} 	
public 
Action 
< 
Message 
> 
? 
Message  '
(' (
Message( /
message0 7
)7 8
{ 	
if 
( 
message 
. 
Text 
!= 
$str  (
)( )
return* 0
null1 5
;5 6
string 
text 
= 
$str )
;) *
if 
( 
string 
. 
IsNullOrEmpty $
($ %
message% ,
., -
Chat- 1
.1 2
Username2 :
): ;
); <
{ 
text 
= 
$str	 Ç
;
Ç É
} 
else 
if 
( 

Connection 
.  
Context  '
.' (
Users( -
.- .
Any. 1
(1 2
x2 3
=>4 6
x7 8
.8 9
Username9 A
==B D
messageE L
.L M
ChatM Q
.Q R
UsernameR Z
)Z [
)[ \
{ 
Database   
.   
Models   
.    
User    $
?  $ %
user  & *
=  + ,

Connection  - 7
.  7 8
Context  8 ?
.  ? @
Users  @ E
.  E F
Where  F K
(  K L
x  L M
=>  N P
x  Q R
.  R S
Username  S [
==  \ ^
message  _ f
.  f g
Chat  g k
.  k l
Username  l t
)  t u
.  u v
First  v {
(  { |
)  | }
;  } ~
if"" 
("" 
user"" 
."" 
ChatId"" 
==""  "
$num""# $
)""$ %
{## 
user$$ 
.$$ 
ChatId$$ 
=$$  !
message$$" )
.$$) *
Chat$$* .
.$$. /
Id$$/ 1
;$$1 2

Connection%% 
.%% 
Context%% &
.%%& '
SaveChanges%%' 2
(%%2 3
)%%3 4
;%%4 5
}&& 
user'' 
.'' 
UpdateUserSymbols'' &
(''& '
)''' (
;''( )
user(( 
.(( 

PACSymbols(( 
.((  
ToList((  &
(((& '
)((' (
.((( )
ForEach(() 0
(((0 1
x((1 2
=>((3 5
{)) 
if** 
(** 
x** 
.** 
Value** 
<**  !
DateTime**" *
.*** +
Now**+ .
)**. /
{++ 
text,, 
+=,, 
$",,  "
$str,," *
{,,* +
x,,+ ,
.,,, -
Key,,- 0
},,0 1
$str,,1 H
",,H I
;,,I J
user-- 
.-- 

PACSymbols-- '
.--' (
Remove--( .
(--. /
x--/ 0
.--0 1
Key--1 4
)--4 5
;--5 6

Connection.. "
..." #
Context..# *
...* +
SaveChanges..+ 6
(..6 7
)..7 8
;..8 9
return// 
;// 
}00 
text22 
+=22 
$"22 
$str22 &
{22& '
x22' (
.22( )
Key22) ,
}22, -
$str22- H
{22H I
x22I J
.22J K
Value22K P
}22P Q
$str22Q S
"22S T
;22T U
}44 
)44 
;44 
}55 
else66 
{77 
text88 
=88 
$str88 T
;88T U
}99 
Task;; 
.;; 
Run;; 
(;; 
(;; 
);; 
=>;; 
	BotClient;; $
.;;$ % 
SendTextMessageAsync;;% 9
(;;9 :
chatId;;: @
:;;@ A
message;;B I
.;;I J
Chat;;J N
.;;N O
Id;;O Q
,;;Q R
	parseMode;;S \
:;;\ ]
	ParseMode;;^ g
.;;g h
Markdown;;h p
,;;p q
text;;r v
:;;v w
text;;x |
);;| }
);;} ~
;;;~ 
return== 
null== 
;== 
}>> 	
}?? 
}@@ å$
wC:\Users\√ñmer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\Telegram\UpdateHandlers\RSI.cs
	namespace

 	!
EASYTelegramSignalBot


 
.

  
Telegram

  (
.

( )
UpdateHandlers

) 7
{ 
public 

class 
RSI 
: 
BaseUpdateHandler (
{ 
public 
static 

Dictionary  
<  !

UpdateType! +
,+ ,
Action- 3
<3 4
Message4 ;
>; <
?< =
>= >
?> ?
Handlers@ H
{I J
getK N
;N O
setP S
;S T
}U V
=W X
newY \
(\ ]
)] ^
;^ _
public 
RSI 
( 
ITelegramBotClient %
client& ,
), -
:. /
base0 4
(4 5
client5 ;
,; <
Handlers= E
)E F
{ 	
Handlers 
. 
Add 
( 

UpdateType #
.# $
Message$ +
,+ ,
(- .
o. /
)/ 0
=>1 3
Message4 ;
(; <
o< =
)= >
)> ?
;? @
} 	
public 
Action 
< 
Message 
> 
? 
Message  '
(' (
Message( /
message0 7
)7 8
{ 	
if 
( 
message 
. 
Text 
!= 
$str  (
)( )
return* 0
null1 5
;5 6
string 
text 
= 
$str )
;) *
if 
( 
string 
. 
IsNullOrEmpty $
($ %
message% ,
., -
Chat- 1
.1 2
Username2 :
): ;
); <
{ 
text 
= 
$str	 Ç
;
Ç É
} 
else 
if 
( 
Database 
. 

Connection (
.( )
Context) 0
.0 1
Users1 6
.6 7
Any7 :
(: ;
x; <
=>= ?
x@ A
.A B
UsernameB J
==K M
messageN U
.U V
ChatV Z
.Z [
Username[ c
)c d
)d e
{ 
Database 
. 
Models 
.  
User  $
?$ %
user& *
=+ ,
Database- 5
.5 6

Connection6 @
.@ A
ContextA H
.H I
UsersI N
.N O
WhereO T
(T U
xU V
=>W Y
xZ [
.[ \
Username\ d
==e g
messageh o
.o p
Chatp t
.t u
Usernameu }
)} ~
.~ 
First	 Ñ
(
Ñ Ö
)
Ö Ü
;
Ü á
if!! 
(!! 
user!! 
.!! 
ChatId!! 
==!!  "
$num!!# $
)!!$ %
{"" 
user## 
.## 
ChatId## 
=##  !
message##" )
.##) *
Chat##* .
.##. /
Id##/ 1
;##1 2
Database$$ 
.$$ 

Connection$$ '
.$$' (
Context$$( /
.$$/ 0
SaveChanges$$0 ;
($$; <
)$$< =
;$$= >
}%% 
text'' 
+='' 
$str	'' Ç
;
''Ç É
}(( 
else)) 
{** 
text++ 
=++ 
$str++ T
;++T U
},, 
Task.. 
... 
Run.. 
(.. 
(.. 
).. 
=>.. 
	BotClient.. $
...$ % 
SendTextMessageAsync..% 9
(..9 :
chatId..: @
:..@ A
message..B I
...I J
Chat..J N
...N O
Id..O Q
,..Q R
	parseMode..S \
:..\ ]
	ParseMode..^ g
...g h
Markdown..h p
,..p q
text..r v
:..v w
text..x |
)..| }
)..} ~
;..~ 
return00 
null00 
;00 
}11 	
}22 
}33 ÷-
wC:\Users\√ñmer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\Telegram\UpdateHandlers\TDI.cs
	namespace 	!
EASYTelegramSignalBot
 
.  
Telegram  (
.( )
UpdateHandlers) 7
{ 
public 

class 
TDI 
: 
BaseUpdateHandler (
{ 
public 
static 

Dictionary  
<  !

UpdateType! +
,+ ,
Action- 3
<3 4
Message4 ;
>; <
?< =
>= >
?> ?
Handlers@ H
{I J
getK N
;N O
setP S
;S T
}U V
=W X
newY \
(\ ]
)] ^
;^ _
public 
TDI 
( 
ITelegramBotClient %
client& ,
), -
:. /
base0 4
(4 5
client5 ;
,; <
Handlers= E
)E F
{ 	
Handlers 
. 
Add 
( 

UpdateType #
.# $
Message$ +
,+ ,
(- .
o. /
)/ 0
=>1 3
Message4 ;
(; <
o< =
)= >
)> ?
;? @
} 	
public 
Action 
< 
Message 
> 
? 
Message  '
(' (
Message( /
message0 7
)7 8
{ 	
if 
( 
message 
. 
Text 
!= 
$str  (
)( )
return* 0
null1 5
;5 6
string 
text 
= 
$str )
;) *
if 
( 
string 
. 
IsNullOrEmpty $
($ %
message% ,
., -
Chat- 1
.1 2
Username2 :
): ;
); <
{ 
text 
= 
$str	 Ç
;
Ç É
} 
else 
if 
( 

Connection 
.  
Context  '
.' (
Users( -
.- .
Any. 1
(1 2
x2 3
=>4 6
x7 8
.8 9
Username9 A
==B D
messageE L
.L M
ChatM Q
.Q R
UsernameR Z
)Z [
)[ \
{   
Database!! 
.!! 
Models!! 
.!!  
User!!  $
?!!$ %
user!!& *
=!!+ ,

Connection!!- 7
.!!7 8
Context!!8 ?
.!!? @
Users!!@ E
.!!E F
Where!!F K
(!!K L
x!!L M
=>!!N P
x!!Q R
.!!R S
Username!!S [
==!!\ ^
message!!_ f
.!!f g
Chat!!g k
.!!k l
Username!!l t
)!!t u
.!!u v
First!!v {
(!!{ |
)!!| }
;!!} ~
if$$ 
($$ 
user$$ 
.$$ 
ChatId$$ 
==$$  "
$num$$# $
)$$$ %
{%% 
user&& 
.&& 
ChatId&& 
=&&  !
message&&" )
.&&) *
Chat&&* .
.&&. /
Id&&/ 1
;&&1 2

Connection'' 
.'' 
Context'' &
.''& '
SaveChanges''' 2
(''2 3
)''3 4
;''4 5
}(( 
user)) 
.)) 
UpdateUserSymbols)) &
())& '
)))' (
;))( )
user** 
.** 

TDISymbols** 
.**  
ToList**  &
(**& '
)**' (
.**( )
ForEach**) 0
(**0 1
x**1 2
=>**3 5
{++ 
if,, 
(,, 
x,, 
.,, 
Value,, 
<,,  !
DateTime,," *
.,,* +
Now,,+ .
),,. /
{-- 
text.. 
+=.. 
$"..  "
$str.." *
{..* +
x..+ ,
..., -
Key..- 0
}..0 1
$str..1 H
"..H I
;..I J
user// 
.// 

TDISymbols// '
.//' (
Remove//( .
(//. /
x/// 0
.//0 1
Key//1 4
)//4 5
;//5 6

Connection00 "
.00" #
Context00# *
.00* +
SaveChanges00+ 6
(006 7
)007 8
;008 9
return11 
;11 
}22 
text44 
+=44 
$"44 
$str44 &
{44& '
x44' (
.44( )
Key44) ,
}44, -
$str44- H
{44H I
x44I J
.44J K
Value44K P
}44P Q
$str44Q S
"44S T
;44T U
}66 
)66 
;66 
}77 
else88 
{99 
text:: 
=:: 
$str:: T
;::T U
};; 
Task== 
.== 
Run== 
(== 
(== 
)== 
=>== 
	BotClient== $
.==$ % 
SendTextMessageAsync==% 9
(==9 :
chatId==: @
:==@ A
message==B I
.==I J
Chat==J N
.==N O
Id==O Q
,==Q R
	parseMode==S \
:==\ ]
	ParseMode==^ g
.==g h
Markdown==h p
,==p q
text==r v
:==v w
text==x |
)==| }
)==} ~
;==~ 
return?? 
null?? 
;?? 
}@@ 	
}AA 
}BB ∆
vC:\Users\√ñmer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\UI\Helpers\DelegateCommand.cs
	namespace 	!
EASYTelegramSignalBot
 
.  
UI  "
." #
Helpers# *
{ 
public 

class 
DelegateCommand  
:! "
ICommand# +
{ 
private 
readonly 
Action 
<  
object  &
?& '
>' (
_action) 0
;0 1
public

 
DelegateCommand

 
(

 
Action

 %
<

% &
object

& ,
?

, -
>

- .
action

/ 5
)

5 6
{ 	
_action 
= 
action 
; 
} 	
public 
void 
Execute 
( 
object "
?" #
	parameter$ -
)- .
{ 	
_action 
( 
	parameter 
) 
; 
} 	
public 
bool 

CanExecute 
( 
object %
?% &
	parameter' 0
)0 1
{ 	
return 
true 
; 
} 	
public 
event 
EventHandler !
?! "
CanExecuteChanged# 4
;4 5
} 
} à

wC:\Users\√ñmer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\UI\Helpers\ObservableObject.cs
	namespace 	!
EASYTelegramSignalBot
 
.  
UI  "
." #
Helpers# *
{ 
public 

static 
class 
ObservableObject (
{ 
public 
static 
void 
	InvokeAll $
($ %
this% )'
PropertyChangedEventHandler* E
?E F'
propertyChangedEventHandlerG b
,b c
objectd j
senderk q
,q r
paramss y
string	z Ä
[
Ä Å
]
Å Ç
propertyNames
É ê
)
ê ë
{ 	
foreach		 
(		 
string		 
?		 
propertyName		 )
in		* ,
propertyNames		- :
)		: ;
{

 '
propertyChangedEventHandler +
?+ ,
., -
Invoke- 3
(3 4
sender4 :
,: ;
new< ?$
PropertyChangedEventArgs@ X
(X Y
propertyNameY e
)e f
)f g
;g h
} 
} 	
} 
} Õ"
oC:\Users\√ñmer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\UI\Helpers\UILoader.cs
	namespace 	!
EASYTelegramSignalBot
 
.  
UI  "
." #
Helpers# *
{ 
public 

class 
UILoader 
: 
IDisposable '
{		 
private

 
bool

 

isDisposed

 
;

  

Dictionary 
< 
string 
, 
Tuple  
<  !
bool! %
,% &
Action' -
?- .
>. /
>/ 0
PageIsReady1 <
{= >
get? B
;B C
setD G
;G H
}I J
public 
UILoader 
( 
) 
{ 	
PageIsReady 
= 
new 
( 
) 
{ 
{ 
$str 
, 
new 
( 
false !
,! "
null# '
)' (
}) *
,* +
{ 
$str 
, 
new 
( 
false !
,! "
null# '
)' (
}) *
,* +
{ 
$str 
, 
new 
( 
false !
,! "
null# '
)' (
}) *
,* +
{ 
$str 
, 
new 
( 
false "
," #
null$ (
)( )
}* +
} 
; 
} 	
public 
void 
SetPageReady  
(  !
string! '
PageName( 0
,0 1
Action2 8
?8 9
action: @
)@ A
{ 	
PageIsReady 
[ 
PageName  
]  !
=" #
new$ '
(' (
true( ,
,, -
action. 4
)4 5
;5 6
if 
( 
PageIsReady 
. 
Values "
." #
All# &
(& '
x' (
=>) +
x, -
.- .
Item1. 3
==4 6
true7 ;
); <
)< =
{ 
foreach 
( 
var 
item !
in" $
PageIsReady% 0
.0 1
Values1 7
)7 8
{   
if!! 
(!! 
item!! 
.!! 
Item2!! "
==!!# %
null!!& *
)!!* +
continue!!, 4
;!!4 5
item## 
.## 
Item2## 
(## 
)##  
;##  !
}$$ 
Dispose%% 
(%% 
true%% 
)%% 
;%% 
}&& 
}'' 	
private)) 
static)) 
UILoader)) 
?))  
	_instance))! *
{))+ ,
get))- 0
;))0 1
set))2 5
;))5 6
}))7 8
public** 
static** 
UILoader** 
Instance** '
{++ 	
get,, 
{-- 
if.. 
(.. 
	_instance.. 
==..  
null..! %
)..% &
	_instance..' 0
=..1 2
new..3 6
(..6 7
)..7 8
;..8 9
return// 
	_instance//  
;//  !
}00 
}11 	
public33 
void33 
Dispose33 
(33 
)33 
{44 	
Dispose55 
(55 
true55 
)55 
;55 
GC66 
.66 
SuppressFinalize66 
(66  
this66  $
)66$ %
;66% &
}77 	
	protected99 
virtual99 
void99 
Dispose99 &
(99& '
bool99' +
	disposing99, 5
)995 6
{:: 	
if;; 
(;; 

isDisposed;; 
);; 
return;; "
;;;" #
PageIsReady== 
.== 
Clear== 
(== 
)== 
;==  

isDisposed?? 
=?? 
true?? 
;?? 
}@@ 	
}BB 
}CC õc
oC:\Users\√ñmer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\UI\Models\NewsModel.cs
	namespace

 	!
EASYTelegramSignalBot


 
.

  
Models

  &
{ 
public 

class 
	NewsModel 
: "
INotifyPropertyChanged 3
{ 
public 
event '
PropertyChangedEventHandler 0
?0 1
PropertyChanged2 A
;A B
private  
ObservableCollection $
<$ %
User% )
>) *
?* +
users, 1
;1 2
public  
ObservableCollection #
<# $
User$ (
>( )
Users* /
{ 	
get 
{ 
users 
= 

Connection $
.$ %
Context% ,
., -
Users- 2
;2 3
return4 :
users; @
;@ A
}B C
set 
{ 
users 
= 
value 
;  
PropertyChanged! 0
?0 1
.1 2
	InvokeAll2 ;
(; <
this< @
,@ A
nameofB H
(H I
UsersI N
)N O
)O P
;P Q
}R S
} 	
private 
User 
? 
selectedUser "
;" #
public 
User 
? 
SelectedUser !
{ 	
get 
=> 
selectedUser 
;  
set 
{ 
selectedUser 
= 
value $
;$ %
if   
(   
selectedUser    
!=  ! #
null  $ (
)  ( )
SelectedUser  * 6
?  6 7
.  7 8
UpdateUserSymbols  8 I
(  I J
)  J K
;  K L
SelectedUserSymbols!! #
=!!$ %
selectedUser!!& 2
?!!2 3
.!!3 4

TDISymbols!!4 >
;!!> ?
PropertyChanged"" 
?""  
.""  !
	InvokeAll""! *
(""* +
this""+ /
,""/ 0
nameof""1 7
(""7 8
SelectedUser""8 D
)""D E
)""E F
;""F G
}## 
}$$ 	
private&& 

Dictionary&& 
<&& 
string&& !
,&&! "
DateTime&&# +
>&&+ ,
?&&, -
selectedUserSymbols&&. A
;&&A B
public'' 

Dictionary'' 
<'' 
string''  
,''  !
DateTime''" *
>''* +
?''+ ,
SelectedUserSymbols''- @
{(( 	
get)) 
=>)) 
selectedUserSymbols)) &
;))& '
set** 
{** 
selectedUserSymbols** %
=**& '
value**( -
;**- .
PropertyChanged**/ >
?**> ?
.**? @
	InvokeAll**@ I
(**I J
this**J N
,**N O
nameof**P V
(**V W
SelectedUserSymbols**W j
)**j k
)**k l
;**l m
}**n o
}++ 	
private-- 
KeyValuePair-- 
<-- 
string-- #
,--# $
DateTime--% -
>--- .
?--. /
selectedUserSymbol--0 B
;--B C
public.. 
KeyValuePair.. 
<.. 
string.. "
,.." #
DateTime..$ ,
>.., -
?..- .
SelectedUserSymbol../ A
{// 	
get00 
=>00 
selectedUserSymbol00 %
;00% &
set11 
{11 
selectedUserSymbol11 $
=11% &
value11' ,
??11- /
(110 1
SelectedUserSymbols111 D
?11D E
.11E F
Count11F K
>11L M
$num11N O
?11P Q
SelectedUserSymbols11R e
.11e f
First11f k
(11k l
)11l m
:11n o
new11p s
(11s t
)11t u
)11u v
;11v w
PropertyChanged	11x á
?
11á à
.
11à â
	InvokeAll
11â í
(
11í ì
this
11ì ó
,
11ó ò
nameof
11ô ü
(
11ü † 
SelectedUserSymbol
11† ≤
)
11≤ ≥
)
11≥ ¥
;
11¥ µ
}
11∂ ∑
}22 	
private44 
string44 
?44 
addUserString44 %
;44% &
public55 
string55 
?55 
AddUserString55 $
{66 	
get77 
=>77 
addUserString77  
;77  !
set88 
{88 
addUserString88 
=88  !
value88" '
;88' (
PropertyChanged88) 8
?888 9
.889 :
	InvokeAll88: C
(88C D
this88D H
,88H I
nameof88J P
(88P Q
AddUserString88Q ^
)88^ _
,88_ `
nameof88a g
(88g h"
IsAddUserButtonEnabled88h ~
)88~ 
)	88 Ä
;
88Ä Å
}
88Ç É
}99 	
private;; 
string;; 
?;; 
addUserSymbolString;; +
;;;+ ,
public<< 
string<< 
?<< 
AddUserSymbolString<< *
{== 	
get>> 
=>>> 
addUserSymbolString>> &
;>>& '
set?? 
{?? 
addUserSymbolString?? %
=??& '
value??( -
;??- .
PropertyChanged??/ >
???> ?
.??? @
	InvokeAll??@ I
(??I J
this??J N
,??N O
nameof??P V
(??V W
AddUserSymbolString??W j
)??j k
,??k l
nameof??m s
(??s t)
IsAddUserSymbolButtonEnabled	??t ê
)
??ê ë
)
??ë í
;
??í ì
}
??î ï
}@@ 	
privateBB 
intBB 
?BB 
addUserDaysBB  
;BB  !
publicCC 
intCC 
AddUserDaysCC 
{DD 	
getEE 
=>EE 
addUserDaysEE 
??EE !
$numEE" $
;EE$ %
setFF 
{FF 
addUserDaysFF 
=FF 
valueFF  %
;FF% &
PropertyChangedFF' 6
?FF6 7
.FF7 8
	InvokeAllFF8 A
(FFA B
thisFFB F
,FFF G
nameofFFH N
(FFN O
AddUserDaysFFO Z
)FFZ [
,FF[ \
nameofFF] c
(FFc d"
IsAddUserButtonEnabledFFd z
)FFz {
)FF{ |
;FF| }
}FF~ 
}GG 	
privateII 
stringII 
?II 
addSymbolStringII '
;II' (
publicJJ 
stringJJ 
?JJ 
AddSymbolStringJJ &
{KK 	
getLL 
=>LL 
addSymbolStringLL "
;LL" #
setMM 
{MM 
addSymbolStringMM !
=MM" #
valueMM$ )
;MM) *
PropertyChangedMM+ :
?MM: ;
.MM; <
	InvokeAllMM< E
(MME F
thisMMF J
,MMJ K
nameofMML R
(MMR S
AddSymbolStringMMS b
)MMb c
,MMc d
nameofMMe k
(MMk l%
IsAddSymbolButtonEnabled	MMl Ñ
)
MMÑ Ö
)
MMÖ Ü
;
MMÜ á
}
MMà â
}NN 	
publicPP 
boolPP (
IsAddUserSymbolButtonEnabledPP 0
=>PP1 3
!PP4 5
stringPP5 ;
.PP; <
IsNullOrEmptyPP< I
(PPI J
addUserSymbolStringPPJ ]
)PP] ^
;PP^ _
publicQQ 
boolQQ "
IsAddUserButtonEnabledQQ *
=>QQ+ -
!QQ. /
stringQQ/ 5
.QQ5 6
IsNullOrEmptyQQ6 C
(QQC D
addUserStringQQD Q
)QQQ R
;QQR S
publicRR 
boolRR $
IsAddSymbolButtonEnabledRR ,
=>RR- /
!RR0 1
stringRR1 7
.RR7 8
IsNullOrEmptyRR8 E
(RRE F
addSymbolStringRRF U
)RRU V
;RRV W
publicUU 
staticUU 
ListUU 
<UU 
stringUU !
>UU! "
?UU" #
GroupIdsUU$ ,
{VV 	
getWW 
=>WW 
SettingsWW 
.WW 
TelegramSettingsWW ,
.WW, -
	RSIGroupsWW- 6
;WW6 7
setXX 
=>XX 
SettingsXX 
.XX 
TelegramSettingsXX ,
.XX, -
	RSIGroupsXX- 6
=XX7 8
valueXX9 >
??XX? A
newXXB E
(XXE F
)XXF G
;XXG H
}YY 	
private[[ 
string[[ 
?[[ 
selectedGroup[[ %
;[[% &
public\\ 
string\\ 
?\\ 
SelectedGroup\\ $
{]] 	
get^^ 
=>^^ 
selectedGroup^^  
;^^  !
set__ 
{__ 
selectedGroup__ 
=__  !
value__" '
;__' (
PropertyChanged__) 8
?__8 9
.__9 :
	InvokeAll__: C
(__C D
this__D H
,__H I
nameof__J P
(__P Q
SelectedGroup__Q ^
)__^ _
,___ `
nameof__a g
(__g h#
IsDelGroupButtonEnabled__h 
)	__ Ä
)
__Ä Å
;
__Å Ç
}
__É Ñ
}`` 	
privatebb 
stringbb 
?bb 
addGroupStringbb &
;bb& '
publiccc 
stringcc 
?cc 
AddGroupStringcc %
{dd 	
getee 
=>ee 
addGroupStringee !
;ee! "
setff 
{ff 
addGroupStringff  
=ff! "
valueff# (
;ff( )
PropertyChangedff* 9
?ff9 :
.ff: ;
	InvokeAllff; D
(ffD E
thisffE I
,ffI J
nameofffK Q
(ffQ R
AddGroupStringffR `
)ff` a
,ffa b
nameofffc i
(ffi j$
IsAddGroupButtonEnabled	ffj Å
)
ffÅ Ç
)
ffÇ É
;
ffÉ Ñ
}
ffÖ Ü
}gg 	
publicii 
boolii #
IsAddGroupButtonEnabledii +
=>ii, .
!ii/ 0
stringii0 6
.ii6 7
IsNullOrEmptyii7 D
(iiD E
addGroupStringiiE S
)iiS T
;iiT U
publicjj 
booljj #
IsDelGroupButtonEnabledjj +
=>jj, .
!jj/ 0
stringjj0 6
.jj6 7
IsNullOrEmptyjj7 D
(jjD E
SelectedGroupjjE R
)jjR S
;jjS T
privatenn 
stringnn 
?nn 
messagenn 
;nn  
publicoo 
stringoo 
Messageoo 
{pp 	
getqq 
=>qq 
messageqq 
??qq 
$strqq  
;qq  !
setrr 
{rr 
messagerr 
=rr 
valuerr !
;rr! "
PropertyChangedrr# 2
?rr2 3
.rr3 4
	InvokeAllrr4 =
(rr= >
thisrr> B
,rrB C
nameofrrD J
(rrJ K
MessagerrK R
)rrR S
)rrS T
;rrT U
}rrV W
}ss 	
privateww 
intww 
intervalww 
;ww 
publicxx 
intxx 
Intervalxx 
{yy 	
getzz 
=>zz 
intervalzz 
;zz 
set{{ 
{{{ 
interval{{ 
={{ 
value{{ "
;{{" #
PropertyChanged{{$ 3
?{{3 4
.{{4 5
	InvokeAll{{5 >
({{> ?
this{{? C
,{{C D
nameof{{E K
({{K L
Interval{{L T
){{T U
){{U V
;{{V W
}{{X Y
}|| 	
private~~ 
string~~ 
key~~ 
;~~ 
public 
string 
Key 
{
ÄÄ 	
get
ÅÅ 
=>
ÅÅ 
key
ÅÅ 
;
ÅÅ 
set
ÇÇ 
{
ÇÇ 
key
ÇÇ 
=
ÇÇ 
value
ÇÇ 
;
ÇÇ 
PropertyChanged
ÇÇ .
?
ÇÇ. /
.
ÇÇ/ 0
	InvokeAll
ÇÇ0 9
(
ÇÇ9 :
this
ÇÇ: >
,
ÇÇ> ?
nameof
ÇÇ@ F
(
ÇÇF G
Key
ÇÇG J
)
ÇÇJ K
)
ÇÇK L
;
ÇÇL M
}
ÇÇN O
}
ÉÉ 	
}
ÖÖ 
}ÜÜ ±¨
nC:\Users\√ñmer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\UI\Models\PACModel.cs
	namespace 	!
EASYTelegramSignalBot
 
.  
Models  &
{ 
public 

class 
PACModel 
: "
INotifyPropertyChanged 2
{ 
public 
event '
PropertyChangedEventHandler 0
?0 1
PropertyChanged2 A
;A B
public 
PACModel 
( 
) 
{ 	
KlineSeries 
= 
new 
( 
) 
{  !
Name" &
=& '
$str' /
,/ 0
Values1 7
=8 9
new: =
ChartValues> I
<I J
	OhlcPointJ S
>S T
(T U
)U V
}W X
;X Y
TOC 
= 
new 
( 
) 
{ 
Title 
=  !
$str" 2
,2 3
LineSmoothness4 B
=C D
$numE F
,F G
StrokeH N
=O P
BrushesQ X
.X Y
GreenY ^
,^ _
PointGeometrySize` q
=r s
$numt u
,u v
Valuesw }
=~ 
new
Ä É
ChartValues
Ñ è
<
è ê
double
ê ñ
>
ñ ó
(
ó ò
)
ò ô
,
ô ö
Fill
õ ü
=
† °
Brushes
¢ ©
.
© ™
Transparent
™ µ
}
∂ ∑
;
∑ ∏
BOC 
= 
new 
( 
) 
{ 
Title 
=  !
$str" 5
,5 6
LineSmoothness7 E
=F G
$numH I
,I J
StrokeK Q
=R S
BrushesT [
.[ \
Red\ _
,_ `
PointGeometrySizea r
=s t
$numu v
,v w
Valuesx ~
=	 Ä
new
Å Ñ
ChartValues
Ö ê
<
ê ë
double
ë ó
>
ó ò
(
ò ô
)
ô ö
,
ö õ
Fill
ú †
=
° ¢
Brushes
£ ™
.
™ ´
Transparent
´ ∂
}
∑ ∏
;
∏ π!
KlineSeriesCollection !
=" #
new$ '
(' (
)( )
{ 
KlineSeries 
, 
TOC 
, 
BOC 
}   
;   &
IndicatorsSeriesCollection"" &
=""' (
new"") ,
("", -
)""- .
{## 
}$$ 
;$$ 
}%% 	
public(( 
string(( 
?(( 
UISymbol(( 
{((  !
get((" %
;((% &
set((' *
;((* +
}((, -
public)) 
SeriesCollection)) !
KlineSeriesCollection))  5
{))6 7
get))8 ;
;)); <
set))= @
;))@ A
}))B C
public** 
SeriesCollection** &
IndicatorsSeriesCollection**  :
{**; <
get**= @
;**@ A
set**B E
;**E F
}**G H
public++ 
CandleSeries++ 
KlineSeries++ '
{++( )
get++* -
;++- .
set++/ 2
;++2 3
}++4 5
public,, 

LineSeries,, 
TOC,, 
{,, 
get,,  #
;,,# $
set,,% (
;,,( )
},,* +
public-- 

LineSeries-- 
BOC-- 
{-- 
get--  #
;--# $
set--% (
;--( )
}--* +
private// 
List// 
<// 
string// 
>// 
?// 
labels// $
;//$ %
public00 
List00 
<00 
string00 
>00 
Labels00 "
{11 	
get22 
=>22 
labels22 
??=22 
new22 !
(22! "
)22" #
;22# $
set33 
{44 
labels55 
=55 
value55 
;55 
PropertyChanged66 
?66  
.66  !
	InvokeAll66! *
(66* +
this66+ /
,66/ 0
nameof661 7
(667 8
Labels668 >
)66> ?
)66? @
;66@ A
}77 
}88 	
private==  
ObservableCollection== $
<==$ %
User==% )
>==) *
?==* +
users==, 1
;==1 2
public>>  
ObservableCollection>> #
<>># $
User>>$ (
>>>( )
Users>>* /
{?? 	
get@@ 
=>@@ 
users@@ 
??=@@ 

Connection@@ '
.@@' (
Context@@( /
.@@/ 0
Users@@0 5
;@@5 6
setAA 
{AA 
usersAA 
=AA 
valueAA 
;AA  
PropertyChangedAA! 0
?AA0 1
.AA1 2
	InvokeAllAA2 ;
(AA; <
thisAA< @
,AA@ A
nameofAAB H
(AAH I
UsersAAI N
)AAN O
)AAO P
;AAP Q
}AAR S
}BB 	
privateDD 
UserDD 
?DD 
selectedUserDD "
;DD" #
publicEE 
UserEE 
?EE 
SelectedUserEE !
{FF 	
getGG 
=>GG 
selectedUserGG 
;GG  
setHH 
{II 
selectedUserJJ 
=JJ 
valueJJ $
;JJ$ %
ifKK 
(KK 
selectedUserKK  
!=KK! #
nullKK$ (
)KK( )
SelectedUserKK* 6
?KK6 7
.KK7 8
UpdateUserSymbolsKK8 I
(KKI J
)KKJ K
;KKK L
SelectedUserSymbolsLL #
=LL$ %
selectedUserLL& 2
?LL2 3
.LL3 4

PACSymbolsLL4 >
;LL> ?
PropertyChangedMM 
?MM  
.MM  !
	InvokeAllMM! *
(MM* +
thisMM+ /
,MM/ 0
nameofMM1 7
(MM7 8
SelectedUserMM8 D
)MMD E
)MME F
;MMF G
}NN 
}OO 	
privateQQ 

DictionaryQQ 
<QQ 
stringQQ !
,QQ! "
DateTimeQQ# +
>QQ+ ,
?QQ, -
selectedUserSymbolsQQ. A
;QQA B
publicRR 

DictionaryRR 
<RR 
stringRR  
,RR  !
DateTimeRR" *
>RR* +
?RR+ ,
SelectedUserSymbolsRR- @
{SS 	
getTT 
=>TT 
selectedUserSymbolsTT &
;TT& '
setUU 
{UU 
selectedUserSymbolsUU %
=UU& '
valueUU( -
;UU- .
PropertyChangedUU/ >
?UU> ?
.UU? @
	InvokeAllUU@ I
(UUI J
thisUUJ N
,UUN O
nameofUUP V
(UUV W
SelectedUserSymbolsUUW j
)UUj k
)UUk l
;UUl m
}UUn o
}VV 	
privateXX 
KeyValuePairXX 
<XX 
stringXX #
,XX# $
DateTimeXX% -
>XX- .
?XX. /
selectedUserSymbolXX0 B
;XXB C
publicYY 
KeyValuePairYY 
<YY 
stringYY "
,YY" #
DateTimeYY$ ,
>YY, -
?YY- .
SelectedUserSymbolYY/ A
{ZZ 	
get[[ 
=>[[ 
selectedUserSymbol[[ %
;[[% &
set\\ 
{\\ 
selectedUserSymbol\\ $
=\\% &
value\\' ,
??\\- /
(\\0 1
SelectedUserSymbols\\1 D
?\\D E
.\\E F
Count\\F K
>\\L M
$num\\N O
?\\P Q
SelectedUserSymbols\\R e
.\\e f
First\\f k
(\\k l
)\\l m
:\\n o
new\\p s
(\\s t
)\\t u
)\\u v
;\\v w
PropertyChanged	\\x á
?
\\á à
.
\\à â
	InvokeAll
\\â í
(
\\í ì
this
\\ì ó
,
\\ó ò
nameof
\\ô ü
(
\\ü † 
SelectedUserSymbol
\\† ≤
)
\\≤ ≥
)
\\≥ ¥
;
\\¥ µ
}
\\∂ ∑
}]] 	
private__ 
string__ 
?__ 
addUserString__ %
;__% &
public`` 
string`` 
?`` 
AddUserString`` $
{aa 	
getbb 
=>bb 
addUserStringbb  
;bb  !
setcc 
{cc 
addUserStringcc 
=cc  !
valuecc" '
;cc' (
PropertyChangedcc) 8
?cc8 9
.cc9 :
	InvokeAllcc: C
(ccC D
thisccD H
,ccH I
nameofccJ P
(ccP Q
AddUserStringccQ ^
)cc^ _
,cc_ `
nameofcca g
(ccg h"
IsAddUserButtonEnabledcch ~
)cc~ 
)	cc Ä
;
ccÄ Å
}
ccÇ É
}dd 	
privateff 
stringff 
?ff 
addUserSymbolStringff +
;ff+ ,
publicgg 
stringgg 
?gg 
AddUserSymbolStringgg *
{hh 	
getii 
=>ii 
addUserSymbolStringii &
;ii& '
setjj 
{jj 
addUserSymbolStringjj %
=jj& '
valuejj( -
;jj- .
PropertyChangedjj/ >
?jj> ?
.jj? @
	InvokeAlljj@ I
(jjI J
thisjjJ N
,jjN O
nameofjjP V
(jjV W
AddUserSymbolStringjjW j
)jjj k
,jjk l
nameofjjm s
(jjs t)
IsAddUserSymbolButtonEnabled	jjt ê
)
jjê ë
)
jjë í
;
jjí ì
}
jjî ï
}kk 	
privatemm 
intmm 
?mm 
addUserDaysmm  
;mm  !
publicnn 
intnn 
AddUserDaysnn 
{oo 	
getpp 
=>pp 
addUserDayspp 
??pp !
$numpp" $
;pp$ %
setqq 
{qq 
addUserDaysqq 
=qq 
valueqq  %
;qq% &
PropertyChangedqq' 6
?qq6 7
.qq7 8
	InvokeAllqq8 A
(qqA B
thisqqB F
,qqF G
nameofqqH N
(qqN O
AddUserDaysqqO Z
)qqZ [
,qq[ \
nameofqq] c
(qqc d"
IsAddUserButtonEnabledqqd z
)qqz {
)qq{ |
;qq| }
}qq~ 
}rr 	
privatett 
stringtt 
?tt 
addSymbolStringtt '
;tt' (
publicuu 
stringuu 
?uu 
AddSymbolStringuu &
{vv 	
getww 
=>ww 
addSymbolStringww "
;ww" #
setxx 
{xx 
addSymbolStringxx !
=xx" #
valuexx$ )
;xx) *
PropertyChangedxx+ :
?xx: ;
.xx; <
	InvokeAllxx< E
(xxE F
thisxxF J
,xxJ K
nameofxxL R
(xxR S
AddSymbolStringxxS b
)xxb c
,xxc d
nameofxxe k
(xxk l%
IsAddSymbolButtonEnabled	xxl Ñ
)
xxÑ Ö
)
xxÖ Ü
;
xxÜ á
}
xxà â
}yy 	
public{{ 
bool{{ (
IsAddUserSymbolButtonEnabled{{ 0
=>{{1 3
!{{4 5
string{{5 ;
.{{; <
IsNullOrEmpty{{< I
({{I J
addUserSymbolString{{J ]
){{] ^
;{{^ _
public|| 
bool|| "
IsAddUserButtonEnabled|| *
=>||+ -
!||. /
string||/ 5
.||5 6
IsNullOrEmpty||6 C
(||C D
addUserString||D Q
)||Q R
;||R S
public}} 
bool}} $
IsAddSymbolButtonEnabled}} ,
=>}}- /
!}}0 1
string}}1 7
.}}7 8
IsNullOrEmpty}}8 E
(}}E F
addSymbolString}}F U
)}}U V
;}}V W
public
ÄÄ 
static
ÄÄ 
List
ÄÄ 
<
ÄÄ 
string
ÄÄ !
>
ÄÄ! "
?
ÄÄ" #
GroupIds
ÄÄ$ ,
{
ÅÅ 	
get
ÇÇ 
=>
ÇÇ 
Settings
ÇÇ 
.
ÇÇ 
TelegramSettings
ÇÇ ,
.
ÇÇ, -
	PACGroups
ÇÇ- 6
;
ÇÇ6 7
set
ÉÉ 
=>
ÉÉ 
Settings
ÉÉ 
.
ÉÉ 
TelegramSettings
ÉÉ ,
.
ÉÉ, -
	PACGroups
ÉÉ- 6
=
ÉÉ7 8
value
ÉÉ9 >
??
ÉÉ? A
new
ÉÉB E
(
ÉÉE F
)
ÉÉF G
;
ÉÉG H
}
ÑÑ 	
private
ÜÜ 
string
ÜÜ 
?
ÜÜ 
selectedGroup
ÜÜ %
;
ÜÜ% &
public
áá 
string
áá 
?
áá 
SelectedGroup
áá $
{
àà 	
get
ââ 
=>
ââ 
selectedGroup
ââ  
;
ââ  !
set
ää 
{
ää 
selectedGroup
ää 
=
ää  !
value
ää" '
;
ää' (
PropertyChanged
ää) 8
?
ää8 9
.
ää9 :
	InvokeAll
ää: C
(
ääC D
this
ääD H
,
ääH I
nameof
ääJ P
(
ääP Q
SelectedGroup
ääQ ^
)
ää^ _
,
ää_ `
nameof
ääa g
(
ääg h%
IsDelGroupButtonEnabled
ääh 
)ää Ä
)ääÄ Å
;ääÅ Ç
}ääÉ Ñ
}
ãã 	
private
çç 
string
çç 
?
çç 
addGroupString
çç &
;
çç& '
public
éé 
string
éé 
?
éé 
AddGroupString
éé %
{
èè 	
get
êê 
=>
êê 
addGroupString
êê !
;
êê! "
set
ëë 
{
ëë 
addGroupString
ëë  
=
ëë! "
value
ëë# (
;
ëë( )
PropertyChanged
ëë* 9
?
ëë9 :
.
ëë: ;
	InvokeAll
ëë; D
(
ëëD E
this
ëëE I
,
ëëI J
nameof
ëëK Q
(
ëëQ R
AddGroupString
ëëR `
)
ëë` a
,
ëëa b
nameof
ëëc i
(
ëëi j&
IsAddGroupButtonEnabledëëj Å
)ëëÅ Ç
)ëëÇ É
;ëëÉ Ñ
}ëëÖ Ü
}
íí 	
public
îî 
bool
îî %
IsAddGroupButtonEnabled
îî +
=>
îî, .
!
îî/ 0
string
îî0 6
.
îî6 7
IsNullOrEmpty
îî7 D
(
îîD E
addGroupString
îîE S
)
îîS T
;
îîT U
public
ïï 
bool
ïï %
IsDelGroupButtonEnabled
ïï +
=>
ïï, .
!
ïï/ 0
string
ïï0 6
.
ïï6 7
IsNullOrEmpty
ïï7 D
(
ïïD E
SelectedGroup
ïïE R
)
ïïR S
;
ïïS T
private
ôô "
ObservableCollection
ôô $
<
ôô$ %
	Indicator
ôô% .
>
ôô. /
?
ôô/ 0
symbols
ôô1 8
;
ôô8 9
public
öö "
ObservableCollection
öö #
<
öö# $
	Indicator
öö$ -
>
öö- .
Symbols
öö/ 6
{
õõ 	
get
úú 
=>
úú 
symbols
úú 
??=
úú 
new
úú "
(
úú" #
)
úú# $
;
úú$ %
set
ùù 
{
ùù 
symbols
ùù 
=
ùù 
value
ùù !
;
ùù! "
PropertyChanged
ùù# 2
?
ùù2 3
.
ùù3 4
	InvokeAll
ùù4 =
(
ùù= >
this
ùù> B
,
ùùB C
nameof
ùùD J
(
ùùJ K
Symbols
ùùK R
)
ùùR S
)
ùùS T
;
ùùT U
}
ùùV W
}
ûû 	
private
†† 
	Indicator
†† 
?
†† 
selectedSymbol
†† )
;
††) *
public
°° 
	Indicator
°° 
?
°° 
SelectedSymbol
°° (
{
¢¢ 	
get
££ 
=>
££ 
selectedSymbol
££ !
;
££! "
set
§§ 
{
§§ 
selectedSymbol
§§  
=
§§! "
value
§§# (
;
§§( )
PropertyChanged
§§* 9
?
§§9 :
.
§§: ;
	InvokeAll
§§; D
(
§§D E
this
§§E I
,
§§I J
nameof
§§K Q
(
§§Q R
SelectedSymbol
§§R `
)
§§` a
)
§§a b
;
§§b c
}
§§d e
}
•• 	
private
©© 
string
©© 
?
©© 
sellSignalString
©© (
;
©©( )
public
™™ 
string
™™ 
SellSignalString
™™ &
{
´´ 	
get
¨¨ 
=>
¨¨ 
sellSignalString
¨¨ #
??
¨¨$ &
$str
¨¨' )
;
¨¨) *
set
≠≠ 
{
≠≠ 
sellSignalString
≠≠ "
=
≠≠# $
value
≠≠% *
;
≠≠* +
PropertyChanged
≠≠, ;
?
≠≠; <
.
≠≠< =
	InvokeAll
≠≠= F
(
≠≠F G
this
≠≠G K
,
≠≠K L
nameof
≠≠M S
(
≠≠S T
SellSignalString
≠≠T d
)
≠≠d e
)
≠≠e f
;
≠≠f g
}
≠≠h i
}
ÆÆ 	
private
∞∞ 
string
∞∞ 
?
∞∞ 
buySignalString
∞∞ '
;
∞∞' (
public
±± 
string
±± 
BuySignalString
±± %
{
≤≤ 	
get
≥≥ 
=>
≥≥ 
buySignalString
≥≥ "
??
≥≥# %
$str
≥≥& (
;
≥≥( )
set
¥¥ 
{
¥¥ 
buySignalString
¥¥ !
=
¥¥" #
value
¥¥$ )
;
¥¥) *
PropertyChanged
¥¥+ :
?
¥¥: ;
.
¥¥; <
	InvokeAll
¥¥< E
(
¥¥E F
this
¥¥F J
,
¥¥J K
nameof
¥¥L R
(
¥¥R S
BuySignalString
¥¥S b
)
¥¥b c
)
¥¥c d
;
¥¥d e
}
¥¥f g
}
µµ 	
private
∑∑ 
string
∑∑ 
?
∑∑ 
exitSignalString
∑∑ (
;
∑∑( )
public
∏∏ 
string
∏∏ 
ExitSignalString
∏∏ &
{
ππ 	
get
∫∫ 
=>
∫∫ 
exitSignalString
∫∫ #
??
∫∫$ &
$str
∫∫' )
;
∫∫) *
set
ªª 
{
ªª 
exitSignalString
ªª "
=
ªª# $
value
ªª% *
;
ªª* +
PropertyChanged
ªª, ;
?
ªª; <
.
ªª< =
	InvokeAll
ªª= F
(
ªªF G
this
ªªG K
,
ªªK L
nameof
ªªM S
(
ªªS T
ExitSignalString
ªªT d
)
ªªd e
)
ªªe f
;
ªªf g
}
ªªh i
}
ºº 	
private
¿¿ 
int
¿¿ 
_SMMAPeriot
¿¿ 
;
¿¿  
public
¡¡ 
int
¡¡ 

SMMAPeriot
¡¡ 
{
¬¬ 	
get
√√ 
=>
√√ 
_SMMAPeriot
√√ 
;
√√ 
set
ƒƒ 
{
ƒƒ 
_SMMAPeriot
ƒƒ 
=
ƒƒ 
value
ƒƒ  %
;
ƒƒ% &
PropertyChanged
ƒƒ' 6
?
ƒƒ6 7
.
ƒƒ7 8
	InvokeAll
ƒƒ8 A
(
ƒƒA B
this
ƒƒB F
,
ƒƒF G
nameof
ƒƒH N
(
ƒƒN O

SMMAPeriot
ƒƒO Y
)
ƒƒY Z
)
ƒƒZ [
;
ƒƒ[ \
}
ƒƒ] ^
}
≈≈ 	
private
«« 
int
«« 
minSignalPeriot
«« #
;
««# $
public
»» 
int
»» 
MinSignalPeriot
»» "
{
…… 	
get
   
=>
   
minSignalPeriot
   "
;
  " #
set
ÀÀ 
{
ÀÀ 
minSignalPeriot
ÀÀ !
=
ÀÀ" #
value
ÀÀ$ )
;
ÀÀ) *
PropertyChanged
ÀÀ+ :
?
ÀÀ: ;
.
ÀÀ; <
	InvokeAll
ÀÀ< E
(
ÀÀE F
this
ÀÀF J
,
ÀÀJ K
nameof
ÀÀL R
(
ÀÀR S
MinSignalPeriot
ÀÀS b
)
ÀÀb c
)
ÀÀc d
;
ÀÀd e
}
ÀÀf g
}
ÃÃ 	
private
ŒŒ 
KlineInterval
ŒŒ 
?
ŒŒ 
klineInterval
ŒŒ ,
;
ŒŒ, -
public
œœ 
KlineInterval
œœ 
KlineInterval
œœ *
{
–– 	
get
—— 
=>
—— 
klineInterval
——  
??=
——! $
(
——% &
KlineInterval
——& 3
)
——3 4
Enum
——4 8
.
——8 9
Parse
——9 >
(
——> ?
typeof
——? E
(
——E F
KlineInterval
——F S
)
——S T
,
——T U
Settings
——V ^
.
——^ _
BotsSettings
——_ k
.
——k l
PACSettings
——l w
.
——w x
KlineInterval——x Ö
)——Ö Ü
;——Ü á
set
““ 
{
““ 
klineInterval
““ 
=
““  !
value
““" '
;
““' (
PropertyChanged
““) 8
?
““8 9
.
““9 :
	InvokeAll
““: C
(
““C D
this
““D H
,
““H I
nameof
““J P
(
““P Q
KlineInterval
““Q ^
)
““^ _
)
““_ `
;
““` a
}
““b c
}
”” 	
public
’’ 
KlineInterval
’’ 
[
’’ 
]
’’ 
KlineIntervals
’’ -
=>
’’. 0
(
’’1 2
KlineInterval
’’2 ?
[
’’? @
]
’’@ A
)
’’A B
Enum
’’B F
.
’’F G
	GetValues
’’G P
(
’’P Q
typeof
’’Q W
(
’’W X
Binance
’’X _
.
’’_ `
Net
’’` c
.
’’c d
Enums
’’d i
.
’’i j
KlineInterval
’’j w
)
’’w x
)
’’x y
;
’’y z
}
◊◊ 
}ÿÿ ÈØ
nC:\Users\√ñmer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\UI\Models\RSIModel.cs
	namespace 	!
EASYTelegramSignalBot
 
.  
Models  &
{ 
public 

class 
RSIModel 
: "
INotifyPropertyChanged 2
{ 
public 
event '
PropertyChangedEventHandler 0
?0 1
PropertyChanged2 A
;A B
public 
RSIModel 
( 
) 
{ 	
KlineSeries 
= 
new 
( 
) 
{  !
Values" (
=) *
new+ .
ChartValues/ :
<: ;
	OhlcPoint; D
>D E
(E F
)F G
}H I
;I J!
KlineSeriesCollection !
=" #
new$ '
(' (
)( )
{ 
KlineSeries 
} 
; 
RSI 
= 
new 
( 
) 
{ 
Title 
=  !
$str" '
,' (
LineSmoothness) 7
=8 9
$num: ;
,; <
Stroke= C
=D E
BrushesF M
.M N
GreenN S
,S T
PointGeometrySizeU f
=g h
$numi j
,j k
Valuesl r
=s t
newu x
ChartValues	y Ñ
<
Ñ Ö
double
Ö ã
>
ã å
(
å ç
)
ç é
,
é è
Fill
ê î
=
ï ñ
Brushes
ó û
.
û ü
Transparent
ü ™
}
´ ¨
;
¨ ≠&
IndicatorsSeriesCollection &
=' (
new) ,
(, -
)- .
{   
RSI!! 
}"" 
;"" 
}## 	
public&& 
string&& 
?&& 
UISymbol&& 
{&&  !
get&&" %
;&&% &
set&&' *
;&&* +
}&&, -
public'' 
SeriesCollection'' !
KlineSeriesCollection''  5
{''6 7
get''8 ;
;''; <
set''= @
;''@ A
}''B C
public(( 
SeriesCollection(( &
IndicatorsSeriesCollection((  :
{((; <
get((= @
;((@ A
set((B E
;((E F
}((G H
public)) 
CandleSeries)) 
KlineSeries)) '
{))( )
get))* -
;))- .
set))/ 2
;))2 3
}))4 5
public** 

LineSeries** 
RSI** 
{** 
get**  #
;**# $
set**% (
;**( )
}*** +
private,, 
List,, 
<,, 
string,, 
>,, 
?,, 
labels,, $
;,,$ %
public-- 
List-- 
<-- 
string-- 
>-- 
Labels-- "
{.. 	
get// 
=>// 
labels// 
??=// 
new// !
(//! "
)//" #
;//# $
set00 
{11 
labels22 
=22 
value22 
;22 
PropertyChanged33 
?33  
.33  !
	InvokeAll33! *
(33* +
this33+ /
,33/ 0
nameof331 7
(337 8
Labels338 >
)33> ?
)33? @
;33@ A
}44 
}55 	
private::  
ObservableCollection:: $
<::$ %
User::% )
>::) *
?::* +
users::, 1
;::1 2
public;;  
ObservableCollection;; #
<;;# $
User;;$ (
>;;( )
Users;;* /
{<< 	
get== 
=>== 
users== 
??=== 

Connection== '
.==' (
Context==( /
.==/ 0
Users==0 5
;==5 6
set>> 
{>> 
users>> 
=>> 
value>> 
;>>  
PropertyChanged>>! 0
?>>0 1
.>>1 2
	InvokeAll>>2 ;
(>>; <
this>>< @
,>>@ A
nameof>>B H
(>>H I
Users>>I N
)>>N O
)>>O P
;>>P Q
}>>R S
}?? 	
privateAA 
UserAA 
?AA 
selectedUserAA "
;AA" #
publicBB 
UserBB 
?BB 
SelectedUserBB !
{CC 	
getDD 
=>DD 
selectedUserDD 
;DD  
setEE 
{FF 
selectedUserGG 
=GG 
valueGG $
;GG$ %
ifHH 
(HH 
selectedUserHH  
!=HH! #
nullHH$ (
)HH( )
SelectedUserHH* 6
?HH6 7
.HH7 8
UpdateUserSymbolsHH8 I
(HHI J
)HHJ K
;HHK L
SelectedUserSymbolsII #
=II$ %
selectedUserII& 2
?II2 3
.II3 4

TDISymbolsII4 >
;II> ?
PropertyChangedJJ 
?JJ  
.JJ  !
	InvokeAllJJ! *
(JJ* +
thisJJ+ /
,JJ/ 0
nameofJJ1 7
(JJ7 8
SelectedUserJJ8 D
)JJD E
)JJE F
;JJF G
}KK 
}LL 	
privateNN 

DictionaryNN 
<NN 
stringNN !
,NN! "
DateTimeNN# +
>NN+ ,
?NN, -
selectedUserSymbolsNN. A
;NNA B
publicOO 

DictionaryOO 
<OO 
stringOO  
,OO  !
DateTimeOO" *
>OO* +
?OO+ ,
SelectedUserSymbolsOO- @
{PP 	
getQQ 
=>QQ 
selectedUserSymbolsQQ &
;QQ& '
setRR 
{RR 
selectedUserSymbolsRR %
=RR& '
valueRR( -
;RR- .
PropertyChangedRR/ >
?RR> ?
.RR? @
	InvokeAllRR@ I
(RRI J
thisRRJ N
,RRN O
nameofRRP V
(RRV W
SelectedUserSymbolsRRW j
)RRj k
)RRk l
;RRl m
}RRn o
}SS 	
privateUU 
KeyValuePairUU 
<UU 
stringUU #
,UU# $
DateTimeUU% -
>UU- .
?UU. /
selectedUserSymbolUU0 B
;UUB C
publicVV 
KeyValuePairVV 
<VV 
stringVV "
,VV" #
DateTimeVV$ ,
>VV, -
?VV- .
SelectedUserSymbolVV/ A
{WW 	
getXX 
=>XX 
selectedUserSymbolXX %
;XX% &
setYY 
{YY 
selectedUserSymbolYY $
=YY% &
valueYY' ,
??YY- /
(YY0 1
SelectedUserSymbolsYY1 D
?YYD E
.YYE F
CountYYF K
>YYL M
$numYYN O
?YYP Q
SelectedUserSymbolsYYR e
.YYe f
FirstYYf k
(YYk l
)YYl m
:YYn o
newYYp s
(YYs t
)YYt u
)YYu v
;YYv w
PropertyChanged	YYx á
?
YYá à
.
YYà â
	InvokeAll
YYâ í
(
YYí ì
this
YYì ó
,
YYó ò
nameof
YYô ü
(
YYü † 
SelectedUserSymbol
YY† ≤
)
YY≤ ≥
)
YY≥ ¥
;
YY¥ µ
}
YY∂ ∑
}ZZ 	
private\\ 
string\\ 
?\\ 
addUserString\\ %
;\\% &
public]] 
string]] 
?]] 
AddUserString]] $
{^^ 	
get__ 
=>__ 
addUserString__  
;__  !
set`` 
{`` 
addUserString`` 
=``  !
value``" '
;``' (
PropertyChanged``) 8
?``8 9
.``9 :
	InvokeAll``: C
(``C D
this``D H
,``H I
nameof``J P
(``P Q
AddUserString``Q ^
)``^ _
,``_ `
nameof``a g
(``g h"
IsAddUserButtonEnabled``h ~
)``~ 
)	`` Ä
;
``Ä Å
}
``Ç É
}aa 	
privatecc 
stringcc 
?cc 
addUserSymbolStringcc +
;cc+ ,
publicdd 
stringdd 
?dd 
AddUserSymbolStringdd *
{ee 	
getff 
=>ff 
addUserSymbolStringff &
;ff& '
setgg 
{gg 
addUserSymbolStringgg %
=gg& '
valuegg( -
;gg- .
PropertyChangedgg/ >
?gg> ?
.gg? @
	InvokeAllgg@ I
(ggI J
thisggJ N
,ggN O
nameofggP V
(ggV W
AddUserSymbolStringggW j
)ggj k
,ggk l
nameofggm s
(ggs t)
IsAddUserSymbolButtonEnabled	ggt ê
)
ggê ë
)
ggë í
;
ggí ì
}
ggî ï
}hh 	
privatejj 
intjj 
?jj 
addUserDaysjj  
;jj  !
publickk 
intkk 
AddUserDayskk 
{ll 	
getmm 
=>mm 
addUserDaysmm 
??mm !
$nummm" $
;mm$ %
setnn 
{nn 
addUserDaysnn 
=nn 
valuenn  %
;nn% &
PropertyChangednn' 6
?nn6 7
.nn7 8
	InvokeAllnn8 A
(nnA B
thisnnB F
,nnF G
nameofnnH N
(nnN O
AddUserDaysnnO Z
)nnZ [
,nn[ \
nameofnn] c
(nnc d"
IsAddUserButtonEnablednnd z
)nnz {
)nn{ |
;nn| }
}nn~ 
}oo 	
privateqq 
stringqq 
?qq 
addSymbolStringqq '
;qq' (
publicrr 
stringrr 
?rr 
AddSymbolStringrr &
{ss 	
gettt 
=>tt 
addSymbolStringtt "
;tt" #
setuu 
{uu 
addSymbolStringuu !
=uu" #
valueuu$ )
;uu) *
PropertyChangeduu+ :
?uu: ;
.uu; <
	InvokeAlluu< E
(uuE F
thisuuF J
,uuJ K
nameofuuL R
(uuR S
AddSymbolStringuuS b
)uub c
,uuc d
nameofuue k
(uuk l%
IsAddSymbolButtonEnabled	uul Ñ
)
uuÑ Ö
)
uuÖ Ü
;
uuÜ á
}
uuà â
}vv 	
publicxx 
boolxx (
IsAddUserSymbolButtonEnabledxx 0
=>xx1 3
!xx4 5
stringxx5 ;
.xx; <
IsNullOrEmptyxx< I
(xxI J
addUserSymbolStringxxJ ]
)xx] ^
;xx^ _
publicyy 
boolyy "
IsAddUserButtonEnabledyy *
=>yy+ -
!yy. /
stringyy/ 5
.yy5 6
IsNullOrEmptyyy6 C
(yyC D
addUserStringyyD Q
)yyQ R
;yyR S
publiczz 
boolzz $
IsAddSymbolButtonEnabledzz ,
=>zz- /
!zz0 1
stringzz1 7
.zz7 8
IsNullOrEmptyzz8 E
(zzE F
addSymbolStringzzF U
)zzU V
;zzV W
public}} 
static}} 
List}} 
<}} 
string}} !
>}}! "
?}}" #
GroupIds}}$ ,
{~~ 	
get 
=> 
Settings 
. 
TelegramSettings ,
., -
	RSIGroups- 6
;6 7
set
ÄÄ 
=>
ÄÄ 
Settings
ÄÄ 
.
ÄÄ 
TelegramSettings
ÄÄ ,
.
ÄÄ, -
	RSIGroups
ÄÄ- 6
=
ÄÄ7 8
value
ÄÄ9 >
??
ÄÄ? A
new
ÄÄB E
(
ÄÄE F
)
ÄÄF G
;
ÄÄG H
}
ÅÅ 	
private
ÉÉ 
string
ÉÉ 
?
ÉÉ 
selectedGroup
ÉÉ %
;
ÉÉ% &
public
ÑÑ 
string
ÑÑ 
?
ÑÑ 
SelectedGroup
ÑÑ $
{
ÖÖ 	
get
ÜÜ 
=>
ÜÜ 
selectedGroup
ÜÜ  
;
ÜÜ  !
set
áá 
{
áá 
selectedGroup
áá 
=
áá  !
value
áá" '
;
áá' (
PropertyChanged
áá) 8
?
áá8 9
.
áá9 :
	InvokeAll
áá: C
(
ááC D
this
ááD H
,
ááH I
nameof
ááJ P
(
ááP Q
SelectedGroup
ááQ ^
)
áá^ _
,
áá_ `
nameof
ááa g
(
áág h%
IsDelGroupButtonEnabled
ááh 
)áá Ä
)ááÄ Å
;ááÅ Ç
}ááÉ Ñ
}
àà 	
private
ää 
string
ää 
?
ää 
addGroupString
ää &
;
ää& '
public
ãã 
string
ãã 
?
ãã 
AddGroupString
ãã %
{
åå 	
get
çç 
=>
çç 
addGroupString
çç !
;
çç! "
set
éé 
{
éé 
addGroupString
éé  
=
éé! "
value
éé# (
;
éé( )
PropertyChanged
éé* 9
?
éé9 :
.
éé: ;
	InvokeAll
éé; D
(
ééD E
this
ééE I
,
ééI J
nameof
ééK Q
(
ééQ R
AddGroupString
ééR `
)
éé` a
,
ééa b
nameof
ééc i
(
ééi j&
IsAddGroupButtonEnabledééj Å
)ééÅ Ç
)ééÇ É
;ééÉ Ñ
}ééÖ Ü
}
èè 	
public
ëë 
bool
ëë %
IsAddGroupButtonEnabled
ëë +
=>
ëë, .
!
ëë/ 0
string
ëë0 6
.
ëë6 7
IsNullOrEmpty
ëë7 D
(
ëëD E
addGroupString
ëëE S
)
ëëS T
;
ëëT U
public
íí 
bool
íí %
IsDelGroupButtonEnabled
íí +
=>
íí, .
!
íí/ 0
string
íí0 6
.
íí6 7
IsNullOrEmpty
íí7 D
(
ííD E
SelectedGroup
ííE R
)
ííR S
;
ííS T
private
ññ "
ObservableCollection
ññ $
<
ññ$ %
	Indicator
ññ% .
>
ññ. /
?
ññ/ 0
symbols
ññ1 8
;
ññ8 9
public
óó "
ObservableCollection
óó #
<
óó# $
	Indicator
óó$ -
>
óó- .
Symbols
óó/ 6
{
òò 	
get
ôô 
=>
ôô 
symbols
ôô 
??=
ôô 
new
ôô "
(
ôô" #
)
ôô# $
;
ôô$ %
set
öö 
{
öö 
symbols
öö 
=
öö 
value
öö !
;
öö! "
PropertyChanged
öö# 2
?
öö2 3
.
öö3 4
	InvokeAll
öö4 =
(
öö= >
this
öö> B
,
ööB C
nameof
ööD J
(
ööJ K
Symbols
ööK R
)
ööR S
)
ööS T
;
ööT U
}
ööV W
}
õõ 	
private
ùù 
	Indicator
ùù 
?
ùù 
selectedSymbol
ùù )
;
ùù) *
public
ûû 
	Indicator
ûû 
?
ûû 
SelectedSymbol
ûû (
{
üü 	
get
†† 
=>
†† 
selectedSymbol
†† !
;
††! "
set
°° 
{
°° 
selectedSymbol
°°  
=
°°! "
value
°°# (
;
°°( )
PropertyChanged
°°* 9
?
°°9 :
.
°°: ;
	InvokeAll
°°; D
(
°°D E
this
°°E I
,
°°I J
nameof
°°K Q
(
°°Q R
SelectedSymbol
°°R `
)
°°` a
)
°°a b
;
°°b c
}
°°d e
}
¢¢ 	
private
¶¶ 
string
¶¶ 
?
¶¶ "
oversoldSignalString
¶¶ ,
;
¶¶, -
public
ßß 
string
ßß "
OversoldSignalString
ßß *
{
®® 	
get
©© 
=>
©© "
oversoldSignalString
©© '
??
©©( *
$str
©©+ -
;
©©- .
set
™™ 
{
™™ "
oversoldSignalString
™™ &
=
™™' (
value
™™) .
;
™™. /
PropertyChanged
™™0 ?
?
™™? @
.
™™@ A
	InvokeAll
™™A J
(
™™J K
this
™™K O
,
™™O P
nameof
™™Q W
(
™™W X"
OversoldSignalString
™™X l
)
™™l m
)
™™m n
;
™™n o
}
™™p q
}
´´ 	
private
≠≠ 
string
≠≠ 
?
≠≠ $
overboughtSignalString
≠≠ .
;
≠≠. /
public
ÆÆ 
string
ÆÆ $
OverboughtSignalString
ÆÆ ,
{
ØØ 	
get
∞∞ 
=>
∞∞ $
overboughtSignalString
∞∞ )
??
∞∞* ,
$str
∞∞- /
;
∞∞/ 0
set
±± 
{
±± $
overboughtSignalString
±± (
=
±±) *
value
±±+ 0
;
±±0 1
PropertyChanged
±±2 A
?
±±A B
.
±±B C
	InvokeAll
±±C L
(
±±L M
this
±±M Q
,
±±Q R
nameof
±±S Y
(
±±Y Z$
OverboughtSignalString
±±Z p
)
±±p q
)
±±q r
;
±±r s
}
±±t u
}
≤≤ 	
private
¥¥ 
string
¥¥ 
?
¥¥ '
betweenLevelsSignalString
¥¥ 1
;
¥¥1 2
public
µµ 
string
µµ '
BetweenLevelsSignalString
µµ /
{
∂∂ 	
get
∑∑ 
=>
∑∑ '
betweenLevelsSignalString
∑∑ ,
??
∑∑- /
$str
∑∑0 2
;
∑∑2 3
set
∏∏ 
{
∏∏ '
betweenLevelsSignalString
∏∏ +
=
∏∏, -
value
∏∏. 3
;
∏∏3 4
PropertyChanged
∏∏5 D
?
∏∏D E
.
∏∏E F
	InvokeAll
∏∏F O
(
∏∏O P
this
∏∏P T
,
∏∏T U
nameof
∏∏V \
(
∏∏\ ]'
BetweenLevelsSignalString
∏∏] v
)
∏∏v w
)
∏∏w x
;
∏∏x y
}
∏∏z {
}
ππ 	
private
ΩΩ 
int
ΩΩ 

_RSIPeriot
ΩΩ 
;
ΩΩ 
public
ææ 
int
ææ 
	RSIPeriot
ææ 
{
øø 	
get
¿¿ 
=>
¿¿ 

_RSIPeriot
¿¿ 
;
¿¿ 
set
¡¡ 
{
¡¡ 

_RSIPeriot
¡¡ 
=
¡¡ 
value
¡¡ $
;
¡¡$ %
PropertyChanged
¡¡& 5
?
¡¡5 6
.
¡¡6 7
	InvokeAll
¡¡7 @
(
¡¡@ A
this
¡¡A E
,
¡¡E F
nameof
¡¡G M
(
¡¡M N
	RSIPeriot
¡¡N W
)
¡¡W X
)
¡¡X Y
;
¡¡Y Z
}
¡¡[ \
}
¬¬ 	
private
ƒƒ 
int
ƒƒ 
_RSIOversoldLevel
ƒƒ %
;
ƒƒ% &
public
≈≈ 
int
≈≈ 
RSIOversoldLevel
≈≈ #
{
∆∆ 	
get
«« 
=>
«« 
_RSIOversoldLevel
«« $
;
««$ %
set
»» 
{
»» 
_RSIOversoldLevel
»» #
=
»»$ %
value
»»& +
;
»»+ ,
PropertyChanged
»»- <
?
»»< =
.
»»= >
	InvokeAll
»»> G
(
»»G H
this
»»H L
,
»»L M
nameof
»»N T
(
»»T U
RSIOversoldLevel
»»U e
)
»»e f
)
»»f g
;
»»g h
}
»»i j
}
…… 	
private
ÀÀ 
int
ÀÀ !
_RSIOverboughtLevel
ÀÀ '
;
ÀÀ' (
public
ÃÃ 
int
ÃÃ  
RSIOverboughtLevel
ÃÃ %
{
ÕÕ 	
get
ŒŒ 
=>
ŒŒ !
_RSIOverboughtLevel
ŒŒ &
;
ŒŒ& '
set
œœ 
{
œœ !
_RSIOverboughtLevel
œœ %
=
œœ& '
value
œœ( -
;
œœ- .
PropertyChanged
œœ/ >
?
œœ> ?
.
œœ? @
	InvokeAll
œœ@ I
(
œœI J
this
œœJ N
,
œœN O
nameof
œœP V
(
œœV W 
RSIOverboughtLevel
œœW i
)
œœi j
)
œœj k
;
œœk l
}
œœm n
}
–– 	
private
““ 
int
““ 
minSignalPeriot
““ #
;
““# $
public
”” 
int
”” 
MinSignalPeriot
”” "
{
‘‘ 	
get
’’ 
=>
’’ 
minSignalPeriot
’’ "
;
’’" #
set
÷÷ 
{
÷÷ 
minSignalPeriot
÷÷ !
=
÷÷" #
value
÷÷$ )
;
÷÷) *
PropertyChanged
÷÷+ :
?
÷÷: ;
.
÷÷; <
	InvokeAll
÷÷< E
(
÷÷E F
this
÷÷F J
,
÷÷J K
nameof
÷÷L R
(
÷÷R S
MinSignalPeriot
÷÷S b
)
÷÷b c
)
÷÷c d
;
÷÷d e
}
÷÷f g
}
◊◊ 	
private
ŸŸ 
KlineInterval
ŸŸ 
?
ŸŸ 
klineInterval
ŸŸ ,
;
ŸŸ, -
public
⁄⁄ 
KlineInterval
⁄⁄ 
KlineInterval
⁄⁄ *
{
€€ 	
get
‹‹ 
=>
‹‹ 
klineInterval
‹‹  
??=
‹‹! $
(
‹‹% &
KlineInterval
‹‹& 3
)
‹‹3 4
Enum
‹‹4 8
.
‹‹8 9
Parse
‹‹9 >
(
‹‹> ?
typeof
‹‹? E
(
‹‹E F
KlineInterval
‹‹F S
)
‹‹S T
,
‹‹T U
Settings
‹‹V ^
.
‹‹^ _
BotsSettings
‹‹_ k
.
‹‹k l
RSISettings
‹‹l w
.
‹‹w x
KlineInterval‹‹x Ö
)‹‹Ö Ü
;‹‹Ü á
set
›› 
{
›› 
klineInterval
›› 
=
››  !
value
››" '
;
››' (
PropertyChanged
››) 8
?
››8 9
.
››9 :
	InvokeAll
››: C
(
››C D
this
››D H
,
››H I
nameof
››J P
(
››P Q
KlineInterval
››Q ^
)
››^ _
)
››_ `
;
››` a
}
››b c
}
ﬁﬁ 	
public
‡‡ 
KlineInterval
‡‡ 
[
‡‡ 
]
‡‡ 
KlineIntervals
‡‡ -
=>
‡‡. 0
(
‡‡1 2
KlineInterval
‡‡2 ?
[
‡‡? @
]
‡‡@ A
)
‡‡A B
Enum
‡‡B F
.
‡‡F G
	GetValues
‡‡G P
(
‡‡P Q
typeof
‡‡Q W
(
‡‡W X
Binance
‡‡X _
.
‡‡_ `
Net
‡‡` c
.
‡‡c d
Enums
‡‡d i
.
‡‡i j
KlineInterval
‡‡j w
)
‡‡w x
)
‡‡x y
;
‡‡y z
}
‚‚ 
}„„ æ›
nC:\Users\√ñmer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\UI\Models\TDIModel.cs
	namespace 	!
EASYTelegramSignalBot
 
.  
Models  &
{ 
public 

class 
TDIModel 
: "
INotifyPropertyChanged 2
{ 
public 
event '
PropertyChangedEventHandler 0
?0 1
PropertyChanged2 A
;A B
public 
TDIModel 
( 
) 
{ 	
KlineSeries 
= 
new 
( 
) 
{  !
Values" (
=) *
new+ .
ChartValues/ :
<: ;
	OhlcPoint; D
>D E
(E F
)F G
}H I
;I J!
KlineSeriesCollection !
=" #
new$ '
(' (
)( )
{ 
KlineSeries 
} 
; 
FastMA 
= 
new 
( 
) 
{ 
Title "
=# $
$str% 5
,5 6
LineSmoothness7 E
=F G
$numH I
,I J
StrokeK Q
=R S
BrushesT [
.[ \
Green\ a
,a b
PointGeometrySizec t
=u v
$numw x
,x y
Values	z Ä
=
Å Ç
new
É Ü
ChartValues
á í
<
í ì
double
ì ô
>
ô ö
(
ö õ
)
õ ú
,
ú ù
Fill
û ¢
=
£ §
Brushes
• ¨
.
¨ ≠
Transparent
≠ ∏
}
π ∫
;
∫ ª
SlowMA 
= 
new 
( 
) 
{ 
Title "
=# $
$str% 8
,8 9
LineSmoothness: H
=I J
$numK L
,L M
StrokeN T
=U V
BrushesW ^
.^ _
Red_ b
,b c
PointGeometrySized u
=v w
$numx y
,y z
Values	{ Å
=
Ç É
new
Ñ á
ChartValues
à ì
<
ì î
double
î ö
>
ö õ
(
õ ú
)
ú ù
,
ù û
Fill
ü £
=
§ •
Brushes
¶ ≠
.
≠ Æ
Transparent
Æ π
}
∫ ª
;
ª º
UpVB   
=   
new   
(   
)   
{   
Title    
=  ! "
$str  # 5
,  5 6
LineSmoothness  7 E
=  F G
$num  H I
,  I J
Stroke  K Q
=  R S
Brushes  T [
.  [ \
Blue  \ `
,  ` a
PointGeometrySize  b s
=  t u
$num  v w
,  w x
Values  y 
=
  Ä Å
new
  Ç Ö
ChartValues
  Ü ë
<
  ë í
double
  í ò
>
  ò ô
(
  ô ö
)
  ö õ
,
  õ ú
Fill
  ù °
=
  ¢ £
Brushes
  § ´
.
  ´ ¨
Transparent
  ¨ ∑
}
  ∏ π
;
  π ∫
MiddleVB!! 
=!! 
new!! 
(!! 
)!! 
{!! 
Title!! $
=!!% &
$str!!' =
,!!= >
LineSmoothness!!? M
=!!N O
$num!!P Q
,!!Q R
Stroke!!S Y
=!!Z [
Brushes!!\ c
.!!c d
Yellow!!d j
,!!j k
PointGeometrySize!!l }
=!!~ 
$num
!!Ä Å
,
!!Å Ç
Values
!!É â
=
!!ä ã
new
!!å è
ChartValues
!!ê õ
<
!!õ ú
double
!!ú ¢
>
!!¢ £
(
!!£ §
)
!!§ •
,
!!• ¶
Fill
!!ß ´
=
!!¨ ≠
Brushes
!!Æ µ
.
!!µ ∂
Transparent
!!∂ ¡
}
!!¬ √
;
!!√ ƒ
DownVB"" 
="" 
new"" 
("" 
)"" 
{"" 
Title"" "
=""# $
$str""% 9
,""9 :
LineSmoothness""; I
=""J K
$num""L M
,""M N
Stroke""O U
=""V W
Brushes""X _
.""_ `
Blue""` d
,""d e
PointGeometrySize""f w
=""x y
$num""z {
,""{ |
Values	""} É
=
""Ñ Ö
new
""Ü â
ChartValues
""ä ï
<
""ï ñ
double
""ñ ú
>
""ú ù
(
""ù û
)
""û ü
,
""ü †
Fill
""° •
=
""¶ ß
Brushes
""® Ø
.
""Ø ∞
Transparent
""∞ ª
}
""º Ω
;
""Ω æ&
IndicatorsSeriesCollection## &
=##' (
new##) ,
(##, -
)##- .
{$$ 
FastMA%% 
,%% 
SlowMA&& 
,&& 
UpVB'' 
,'' 
MiddleVB(( 
,(( 
DownVB)) 
}** 
;** 
}++ 	
public.. 
string.. 
?.. 
UISymbol.. 
{..  !
get.." %
;..% &
set..' *
;..* +
}.., -
public// 
SeriesCollection// !
KlineSeriesCollection//  5
{//6 7
get//8 ;
;//; <
set//= @
;//@ A
}//B C
public00 
SeriesCollection00 &
IndicatorsSeriesCollection00  :
{00; <
get00= @
;00@ A
set00B E
;00E F
}00G H
public11 
CandleSeries11 
KlineSeries11 '
{11( )
get11* -
;11- .
set11/ 2
;112 3
}114 5
public22 

LineSeries22 
FastMA22  
{22! "
get22# &
;22& '
set22( +
;22+ ,
}22- .
public33 

LineSeries33 
SlowMA33  
{33! "
get33# &
;33& '
set33( +
;33+ ,
}33- .
public44 

LineSeries44 
UpVB44 
{44  
get44! $
;44$ %
set44& )
;44) *
}44+ ,
public55 

LineSeries55 
MiddleVB55 "
{55# $
get55% (
;55( )
set55* -
;55- .
}55/ 0
public66 

LineSeries66 
DownVB66  
{66! "
get66# &
;66& '
set66( +
;66+ ,
}66- .
private88 
List88 
<88 
string88 
>88 
?88 
labels88 $
;88$ %
public99 
List99 
<99 
string99 
>99 
Labels99 "
{:: 	
get;; 
=>;; 
labels;; 
??=;; 
new;; !
(;;! "
);;" #
;;;# $
set<< 
{== 
labels>> 
=>> 
value>> 
;>> 
PropertyChanged?? 
???  
.??  !
	InvokeAll??! *
(??* +
this??+ /
,??/ 0
nameof??1 7
(??7 8
Labels??8 >
)??> ?
)??? @
;??@ A
}@@ 
}AA 	
privateFF  
ObservableCollectionFF $
<FF$ %
UserFF% )
>FF) *
?FF* +
usersFF, 1
;FF1 2
publicGG  
ObservableCollectionGG #
<GG# $
UserGG$ (
>GG( )
UsersGG* /
{HH 	
getII 
=>II 
usersII 
??=II 

ConnectionII '
.II' (
ContextII( /
.II/ 0
UsersII0 5
;II5 6
setJJ 
{JJ 
usersJJ 
=JJ 
valueJJ 
;JJ  
PropertyChangedJJ! 0
?JJ0 1
.JJ1 2
	InvokeAllJJ2 ;
(JJ; <
thisJJ< @
,JJ@ A
nameofJJB H
(JJH I
UsersJJI N
)JJN O
)JJO P
;JJP Q
}JJR S
}KK 	
privateMM 
UserMM 
?MM 
selectedUserMM "
;MM" #
publicNN 
UserNN 
?NN 
SelectedUserNN !
{OO 	
getPP 
=>PP 
selectedUserPP 
;PP  
setQQ 
{RR 
selectedUserSS 
=SS 
valueSS $
;SS$ %
ifTT 
(TT 
selectedUserTT  
!=TT! #
nullTT$ (
)TT( )
SelectedUserTT* 6
?TT6 7
.TT7 8
UpdateUserSymbolsTT8 I
(TTI J
)TTJ K
;TTK L
SelectedUserSymbolsUU #
=UU$ %
selectedUserUU& 2
?UU2 3
.UU3 4

TDISymbolsUU4 >
;UU> ?
PropertyChangedVV 
?VV  
.VV  !
	InvokeAllVV! *
(VV* +
thisVV+ /
,VV/ 0
nameofVV1 7
(VV7 8
SelectedUserVV8 D
)VVD E
)VVE F
;VVF G
}WW 
}XX 	
privateZZ 

DictionaryZZ 
<ZZ 
stringZZ !
,ZZ! "
DateTimeZZ# +
>ZZ+ ,
?ZZ, -
selectedUserSymbolsZZ. A
;ZZA B
public[[ 

Dictionary[[ 
<[[ 
string[[  
,[[  !
DateTime[[" *
>[[* +
?[[+ ,
SelectedUserSymbols[[- @
{\\ 	
get]] 
=>]] 
selectedUserSymbols]] &
;]]& '
set^^ 
{^^ 
selectedUserSymbols^^ %
=^^& '
value^^( -
;^^- .
PropertyChanged^^/ >
?^^> ?
.^^? @
	InvokeAll^^@ I
(^^I J
this^^J N
,^^N O
nameof^^P V
(^^V W
SelectedUserSymbols^^W j
)^^j k
)^^k l
;^^l m
}^^n o
}__ 	
privateaa 
KeyValuePairaa 
<aa 
stringaa #
,aa# $
DateTimeaa% -
>aa- .
?aa. /
selectedUserSymbolaa0 B
;aaB C
publicbb 
KeyValuePairbb 
<bb 
stringbb "
,bb" #
DateTimebb$ ,
>bb, -
?bb- .
SelectedUserSymbolbb/ A
{cc 	
getdd 
=>dd 
selectedUserSymboldd %
;dd% &
setee 
{ee 
selectedUserSymbolee $
=ee% &
valueee' ,
??ee- /
(ee0 1
SelectedUserSymbolsee1 D
?eeD E
.eeE F
CounteeF K
>eeL M
$numeeN O
?eeP Q
SelectedUserSymbolseeR e
.eee f
Firsteef k
(eek l
)eel m
:een o
neweep s
(ees t
)eet u
)eeu v
;eev w
PropertyChanged	eex á
?
eeá à
.
eeà â
	InvokeAll
eeâ í
(
eeí ì
this
eeì ó
,
eeó ò
nameof
eeô ü
(
eeü † 
SelectedUserSymbol
ee† ≤
)
ee≤ ≥
)
ee≥ ¥
;
ee¥ µ
}
ee∂ ∑
}ff 	
privatehh 
stringhh 
?hh 
addUserStringhh %
;hh% &
publicii 
stringii 
?ii 
AddUserStringii $
{jj 	
getkk 
=>kk 
addUserStringkk  
;kk  !
setll 
{ll 
addUserStringll 
=ll  !
valuell" '
;ll' (
PropertyChangedll) 8
?ll8 9
.ll9 :
	InvokeAllll: C
(llC D
thisllD H
,llH I
nameofllJ P
(llP Q
AddUserStringllQ ^
)ll^ _
,ll_ `
nameoflla g
(llg h"
IsAddUserButtonEnabledllh ~
)ll~ 
)	ll Ä
;
llÄ Å
}
llÇ É
}mm 	
privateoo 
stringoo 
?oo 
addUserSymbolStringoo +
;oo+ ,
publicpp 
stringpp 
?pp 
AddUserSymbolStringpp *
{qq 	
getrr 
=>rr 
addUserSymbolStringrr &
;rr& '
setss 
{ss 
addUserSymbolStringss %
=ss& '
valuess( -
;ss- .
PropertyChangedss/ >
?ss> ?
.ss? @
	InvokeAllss@ I
(ssI J
thisssJ N
,ssN O
nameofssP V
(ssV W
AddUserSymbolStringssW j
)ssj k
,ssk l
nameofssm s
(sss t)
IsAddUserSymbolButtonEnabled	sst ê
)
ssê ë
)
ssë í
;
ssí ì
}
ssî ï
}tt 	
privatevv 
intvv 
?vv 
addUserDaysvv  
;vv  !
publicww 
intww 
AddUserDaysww 
{xx 	
getyy 
=>yy 
addUserDaysyy 
??yy !
$numyy" $
;yy$ %
setzz 
{zz 
addUserDayszz 
=zz 
valuezz  %
;zz% &
PropertyChangedzz' 6
?zz6 7
.zz7 8
	InvokeAllzz8 A
(zzA B
thiszzB F
,zzF G
nameofzzH N
(zzN O
AddUserDayszzO Z
)zzZ [
,zz[ \
nameofzz] c
(zzc d"
IsAddUserButtonEnabledzzd z
)zzz {
)zz{ |
;zz| }
}zz~ 
}{{ 	
private}} 
string}} 
?}} 
addSymbolString}} '
;}}' (
public~~ 
string~~ 
?~~ 
AddSymbolString~~ &
{ 	
get
ÄÄ 
=>
ÄÄ 
addSymbolString
ÄÄ "
;
ÄÄ" #
set
ÅÅ 
{
ÅÅ 
addSymbolString
ÅÅ !
=
ÅÅ" #
value
ÅÅ$ )
;
ÅÅ) *
PropertyChanged
ÅÅ+ :
?
ÅÅ: ;
.
ÅÅ; <
	InvokeAll
ÅÅ< E
(
ÅÅE F
this
ÅÅF J
,
ÅÅJ K
nameof
ÅÅL R
(
ÅÅR S
AddSymbolString
ÅÅS b
)
ÅÅb c
,
ÅÅc d
nameof
ÅÅe k
(
ÅÅk l'
IsAddSymbolButtonEnabledÅÅl Ñ
)ÅÅÑ Ö
)ÅÅÖ Ü
;ÅÅÜ á
}ÅÅà â
}
ÇÇ 	
public
ÑÑ 
bool
ÑÑ *
IsAddUserSymbolButtonEnabled
ÑÑ 0
=>
ÑÑ1 3
!
ÑÑ4 5
string
ÑÑ5 ;
.
ÑÑ; <
IsNullOrEmpty
ÑÑ< I
(
ÑÑI J!
addUserSymbolString
ÑÑJ ]
)
ÑÑ] ^
;
ÑÑ^ _
public
ÖÖ 
bool
ÖÖ $
IsAddUserButtonEnabled
ÖÖ *
=>
ÖÖ+ -
!
ÖÖ. /
string
ÖÖ/ 5
.
ÖÖ5 6
IsNullOrEmpty
ÖÖ6 C
(
ÖÖC D
addUserString
ÖÖD Q
)
ÖÖQ R
;
ÖÖR S
public
ÜÜ 
bool
ÜÜ &
IsAddSymbolButtonEnabled
ÜÜ ,
=>
ÜÜ- /
!
ÜÜ0 1
string
ÜÜ1 7
.
ÜÜ7 8
IsNullOrEmpty
ÜÜ8 E
(
ÜÜE F
addSymbolString
ÜÜF U
)
ÜÜU V
;
ÜÜV W
public
ââ 
static
ââ 
List
ââ 
<
ââ 
string
ââ !
>
ââ! "
?
ââ" #
GroupIds
ââ$ ,
{
ää 	
get
ãã 
=>
ãã 
Settings
ãã 
.
ãã 
TelegramSettings
ãã ,
.
ãã, -
	TDIGroups
ãã- 6
;
ãã6 7
set
åå 
=>
åå 
Settings
åå 
.
åå 
TelegramSettings
åå ,
.
åå, -
	TDIGroups
åå- 6
=
åå7 8
value
åå9 >
??
åå? A
new
ååB E
(
ååE F
)
ååF G
;
ååG H
}
çç 	
private
èè 
string
èè 
?
èè 
selectedGroup
èè %
;
èè% &
public
êê 
string
êê 
?
êê 
SelectedGroup
êê $
{
ëë 	
get
íí 
=>
íí 
selectedGroup
íí  
;
íí  !
set
ìì 
{
ìì 
selectedGroup
ìì 
=
ìì  !
value
ìì" '
;
ìì' (
PropertyChanged
ìì) 8
?
ìì8 9
.
ìì9 :
	InvokeAll
ìì: C
(
ììC D
this
ììD H
,
ììH I
nameof
ììJ P
(
ììP Q
SelectedGroup
ììQ ^
)
ìì^ _
,
ìì_ `
nameof
ììa g
(
ììg h%
IsDelGroupButtonEnabled
ììh 
)ìì Ä
)ììÄ Å
;ììÅ Ç
}ììÉ Ñ
}
îî 	
private
ññ 
string
ññ 
?
ññ 
addGroupString
ññ &
;
ññ& '
public
óó 
string
óó 
?
óó 
AddGroupString
óó %
{
òò 	
get
ôô 
=>
ôô 
addGroupString
ôô !
;
ôô! "
set
öö 
{
öö 
addGroupString
öö  
=
öö! "
value
öö# (
;
öö( )
PropertyChanged
öö* 9
?
öö9 :
.
öö: ;
	InvokeAll
öö; D
(
ööD E
this
ööE I
,
ööI J
nameof
ööK Q
(
ööQ R
AddGroupString
ööR `
)
öö` a
,
ööa b
nameof
ööc i
(
ööi j&
IsAddGroupButtonEnabledööj Å
)ööÅ Ç
)ööÇ É
;ööÉ Ñ
}ööÖ Ü
}
õõ 	
public
ùù 
bool
ùù %
IsAddGroupButtonEnabled
ùù +
=>
ùù, .
!
ùù/ 0
string
ùù0 6
.
ùù6 7
IsNullOrEmpty
ùù7 D
(
ùùD E
addGroupString
ùùE S
)
ùùS T
;
ùùT U
public
ûû 
bool
ûû %
IsDelGroupButtonEnabled
ûû +
=>
ûû, .
!
ûû/ 0
string
ûû0 6
.
ûû6 7
IsNullOrEmpty
ûû7 D
(
ûûD E
SelectedGroup
ûûE R
)
ûûR S
;
ûûS T
private
¢¢ "
ObservableCollection
¢¢ $
<
¢¢$ %
	Indicator
¢¢% .
>
¢¢. /
?
¢¢/ 0
symbols
¢¢1 8
;
¢¢8 9
public
££ "
ObservableCollection
££ #
<
££# $
	Indicator
££$ -
>
££- .
Symbols
££/ 6
{
§§ 	
get
•• 
=>
•• 
symbols
•• 
??=
•• 
new
•• "
(
••" #
)
••# $
;
••$ %
set
¶¶ 
{
¶¶ 
symbols
¶¶ 
=
¶¶ 
value
¶¶ !
;
¶¶! "
PropertyChanged
¶¶# 2
?
¶¶2 3
.
¶¶3 4
	InvokeAll
¶¶4 =
(
¶¶= >
this
¶¶> B
,
¶¶B C
nameof
¶¶D J
(
¶¶J K
Symbols
¶¶K R
)
¶¶R S
)
¶¶S T
;
¶¶T U
}
¶¶V W
}
ßß 	
private
©© 
	Indicator
©© 
?
©© 
selectedSymbol
©© )
;
©©) *
public
™™ 
	Indicator
™™ 
?
™™ 
SelectedSymbol
™™ (
{
´´ 	
get
¨¨ 
=>
¨¨ 
selectedSymbol
¨¨ !
;
¨¨! "
set
≠≠ 
{
≠≠ 
selectedSymbol
≠≠  
=
≠≠! "
value
≠≠# (
;
≠≠( )
PropertyChanged
≠≠* 9
?
≠≠9 :
.
≠≠: ;
	InvokeAll
≠≠; D
(
≠≠D E
this
≠≠E I
,
≠≠I J
nameof
≠≠K Q
(
≠≠Q R
SelectedSymbol
≠≠R `
)
≠≠` a
)
≠≠a b
;
≠≠b c
}
≠≠d e
}
ÆÆ 	
private
≤≤ 
string
≤≤ 
?
≤≤ 
sellSignalString
≤≤ (
;
≤≤( )
public
≥≥ 
string
≥≥ 
SellSignalString
≥≥ &
{
¥¥ 	
get
µµ 
=>
µµ 
sellSignalString
µµ #
??
µµ$ &
$str
µµ' )
;
µµ) *
set
∂∂ 
{
∂∂ 
sellSignalString
∂∂ "
=
∂∂# $
value
∂∂% *
;
∂∂* +
PropertyChanged
∂∂, ;
?
∂∂; <
.
∂∂< =
	InvokeAll
∂∂= F
(
∂∂F G
this
∂∂G K
,
∂∂K L
nameof
∂∂M S
(
∂∂S T
SellSignalString
∂∂T d
)
∂∂d e
)
∂∂e f
;
∂∂f g
}
∂∂h i
}
∑∑ 	
private
ππ 
string
ππ 
?
ππ 
buySignalString
ππ '
;
ππ' (
public
∫∫ 
string
∫∫ 
BuySignalString
∫∫ %
{
ªª 	
get
ºº 
=>
ºº 
buySignalString
ºº "
??
ºº# %
$str
ºº& (
;
ºº( )
set
ΩΩ 
{
ΩΩ 
buySignalString
ΩΩ !
=
ΩΩ" #
value
ΩΩ$ )
;
ΩΩ) *
PropertyChanged
ΩΩ+ :
?
ΩΩ: ;
.
ΩΩ; <
	InvokeAll
ΩΩ< E
(
ΩΩE F
this
ΩΩF J
,
ΩΩJ K
nameof
ΩΩL R
(
ΩΩR S
BuySignalString
ΩΩS b
)
ΩΩb c
)
ΩΩc d
;
ΩΩd e
}
ΩΩf g
}
ææ 	
private
¿¿ 
string
¿¿ 
?
¿¿ 
exitSignalString
¿¿ (
;
¿¿( )
public
¡¡ 
string
¡¡ 
ExitSignalString
¡¡ &
{
¬¬ 	
get
√√ 
=>
√√ 
exitSignalString
√√ #
??
√√$ &
$str
√√' )
;
√√) *
set
ƒƒ 
{
ƒƒ 
exitSignalString
ƒƒ "
=
ƒƒ# $
value
ƒƒ% *
;
ƒƒ* +
PropertyChanged
ƒƒ, ;
?
ƒƒ; <
.
ƒƒ< =
	InvokeAll
ƒƒ= F
(
ƒƒF G
this
ƒƒG K
,
ƒƒK L
nameof
ƒƒM S
(
ƒƒS T
ExitSignalString
ƒƒT d
)
ƒƒd e
)
ƒƒe f
;
ƒƒf g
}
ƒƒh i
}
≈≈ 	
private
…… 
int
…… 

_RSIPeriot
…… 
;
…… 
public
   
int
   
	RSIPeriot
   
{
ÀÀ 	
get
ÃÃ 
=>
ÃÃ 

_RSIPeriot
ÃÃ 
;
ÃÃ 
set
ÕÕ 
{
ÕÕ 

_RSIPeriot
ÕÕ 
=
ÕÕ 
value
ÕÕ $
;
ÕÕ$ %
PropertyChanged
ÕÕ& 5
?
ÕÕ5 6
.
ÕÕ6 7
	InvokeAll
ÕÕ7 @
(
ÕÕ@ A
this
ÕÕA E
,
ÕÕE F
nameof
ÕÕG M
(
ÕÕM N
	RSIPeriot
ÕÕN W
)
ÕÕW X
)
ÕÕX Y
;
ÕÕY Z
}
ÕÕ[ \
}
ŒŒ 	
private
–– 
int
–– 
_RSIPLPeriot
––  
;
––  !
public
—— 
int
—— 
RSIPLPeriot
—— 
{
““ 	
get
”” 
=>
”” 
_RSIPLPeriot
”” 
;
””  
set
‘‘ 
{
‘‘ 
_RSIPLPeriot
‘‘ 
=
‘‘  
value
‘‘! &
;
‘‘& '
PropertyChanged
‘‘( 7
?
‘‘7 8
.
‘‘8 9
	InvokeAll
‘‘9 B
(
‘‘B C
this
‘‘C G
,
‘‘G H
nameof
‘‘I O
(
‘‘O P
RSIPLPeriot
‘‘P [
)
‘‘[ \
)
‘‘\ ]
;
‘‘] ^
}
‘‘_ `
}
’’ 	
private
◊◊ 
int
◊◊ 

_TSLPeriot
◊◊ 
;
◊◊ 
public
ÿÿ 
int
ÿÿ 
	TSLPeriot
ÿÿ 
{
ŸŸ 	
get
⁄⁄ 
=>
⁄⁄ 

_TSLPeriot
⁄⁄ 
;
⁄⁄ 
set
€€ 
{
€€ 

_TSLPeriot
€€ 
=
€€ 
value
€€ $
;
€€$ %
PropertyChanged
€€& 5
?
€€5 6
.
€€6 7
	InvokeAll
€€7 @
(
€€@ A
this
€€A E
,
€€E F
nameof
€€G M
(
€€M N
	TSLPeriot
€€N W
)
€€W X
)
€€X Y
;
€€Y Z
}
€€[ \
}
‹‹ 	
private
ﬁﬁ 
int
ﬁﬁ 
	_VBPeriot
ﬁﬁ 
;
ﬁﬁ 
public
ﬂﬂ 
int
ﬂﬂ 
VBPeriot
ﬂﬂ 
{
‡‡ 	
get
·· 
=>
·· 
	_VBPeriot
·· 
;
·· 
set
‚‚ 
{
‚‚ 
	_VBPeriot
‚‚ 
=
‚‚ 
value
‚‚ #
;
‚‚# $
PropertyChanged
‚‚% 4
?
‚‚4 5
.
‚‚5 6
	InvokeAll
‚‚6 ?
(
‚‚? @
this
‚‚@ D
,
‚‚D E
nameof
‚‚F L
(
‚‚L M
VBPeriot
‚‚M U
)
‚‚U V
)
‚‚V W
;
‚‚W X
}
‚‚Y Z
}
„„ 	
private
ÂÂ 
int
ÂÂ 
_RSIOversoldLevel
ÂÂ %
;
ÂÂ% &
public
ÊÊ 
int
ÊÊ 
RSIOversoldLevel
ÊÊ #
{
ÁÁ 	
get
ËË 
=>
ËË 
_RSIOversoldLevel
ËË $
;
ËË$ %
set
ÈÈ 
{
ÈÈ 
_RSIOversoldLevel
ÈÈ #
=
ÈÈ$ %
value
ÈÈ& +
;
ÈÈ+ ,
PropertyChanged
ÈÈ- <
?
ÈÈ< =
.
ÈÈ= >
	InvokeAll
ÈÈ> G
(
ÈÈG H
this
ÈÈH L
,
ÈÈL M
nameof
ÈÈN T
(
ÈÈT U
RSIOversoldLevel
ÈÈU e
)
ÈÈe f
)
ÈÈf g
;
ÈÈg h
}
ÈÈi j
}
ÍÍ 	
private
ÏÏ 
int
ÏÏ !
_RSIOverboughtLevel
ÏÏ '
;
ÏÏ' (
public
ÌÌ 
int
ÌÌ  
RSIOverboughtLevel
ÌÌ %
{
ÓÓ 	
get
ÔÔ 
=>
ÔÔ !
_RSIOverboughtLevel
ÔÔ &
;
ÔÔ& '
set
 
{
 !
_RSIOverboughtLevel
 %
=
& '
value
( -
;
- .
PropertyChanged
/ >
?
> ?
.
? @
	InvokeAll
@ I
(
I J
this
J N
,
N O
nameof
P V
(
V W 
RSIOverboughtLevel
W i
)
i j
)
j k
;
k l
}
m n
}
ÒÒ 	
private
ÛÛ 
int
ÛÛ 
minSignalPeriot
ÛÛ #
;
ÛÛ# $
public
ÙÙ 
int
ÙÙ 
MinSignalPeriot
ÙÙ "
{
ıı 	
get
ˆˆ 
=>
ˆˆ 
minSignalPeriot
ˆˆ "
;
ˆˆ" #
set
˜˜ 
{
˜˜ 
minSignalPeriot
˜˜ !
=
˜˜" #
value
˜˜$ )
;
˜˜) *
PropertyChanged
˜˜+ :
?
˜˜: ;
.
˜˜; <
	InvokeAll
˜˜< E
(
˜˜E F
this
˜˜F J
,
˜˜J K
nameof
˜˜L R
(
˜˜R S
MinSignalPeriot
˜˜S b
)
˜˜b c
)
˜˜c d
;
˜˜d e
}
˜˜f g
}
¯¯ 	
private
˙˙ 
KlineInterval
˙˙ 
?
˙˙ 
klineInterval
˙˙ ,
;
˙˙, -
public
˚˚ 
KlineInterval
˚˚ 
KlineInterval
˚˚ *
{
¸¸ 	
get
˝˝ 
=>
˝˝ 
klineInterval
˝˝  
??=
˝˝! $
(
˝˝% &
KlineInterval
˝˝& 3
)
˝˝3 4
Enum
˝˝4 8
.
˝˝8 9
Parse
˝˝9 >
(
˝˝> ?
typeof
˝˝? E
(
˝˝E F
KlineInterval
˝˝F S
)
˝˝S T
,
˝˝T U
Settings
˝˝V ^
.
˝˝^ _
BotsSettings
˝˝_ k
.
˝˝k l
TDISettings
˝˝l w
.
˝˝w x
KlineInterval˝˝x Ö
)˝˝Ö Ü
;˝˝Ü á
set
˛˛ 
{
˛˛ 
klineInterval
˛˛ 
=
˛˛  !
value
˛˛" '
;
˛˛' (
PropertyChanged
˛˛) 8
?
˛˛8 9
.
˛˛9 :
	InvokeAll
˛˛: C
(
˛˛C D
this
˛˛D H
,
˛˛H I
nameof
˛˛J P
(
˛˛P Q
KlineInterval
˛˛Q ^
)
˛˛^ _
)
˛˛_ `
;
˛˛` a
}
˛˛b c
}
ˇˇ 	
public
ÅÅ 
KlineInterval
ÅÅ 
[
ÅÅ 
]
ÅÅ 
KlineIntervals
ÅÅ -
=>
ÅÅ. 0
(
ÅÅ1 2
KlineInterval
ÅÅ2 ?
[
ÅÅ? @
]
ÅÅ@ A
)
ÅÅA B
Enum
ÅÅB F
.
ÅÅF G
	GetValues
ÅÅG P
(
ÅÅP Q
typeof
ÅÅQ W
(
ÅÅW X
Binance
ÅÅX _
.
ÅÅ_ `
Net
ÅÅ` c
.
ÅÅc d
Enums
ÅÅd i
.
ÅÅi j
KlineInterval
ÅÅj w
)
ÅÅw x
)
ÅÅx y
;
ÅÅy z
}
ÉÉ 
}ÑÑ ’
wC:\Users\√ñmer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\UI\ViewModels\MainViewModel.cs
	namespace 	!
EASYTelegramSignalBot
 
.  
UI  "
." #

ViewModels# -
{ 
public 

class 
MainViewModel 
{ 
public 
MainViewModel 
( 
) 
{ 	
var		 
_		 
=		 
UILoader		 
.		 
Instance		 %
;		% &
}

 	
} 
} Àk
wC:\Users\√ñmer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\UI\ViewModels\NewsViewModel.cs
	namespace 	!
EASYTelegramSignalBot
 
.  

ViewModels  *
{ 
internal 
class 
NewsViewModel  
:! "
UserControl# .
{ 
public 
ICommand 
AddUserCommand &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
public 
ICommand 
DelUserCommand &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
public 
ICommand 
AddGroupCommand '
{( )
get* -
;- .
set/ 2
;2 3
}4 5
public 
ICommand 
DelGroupCommand '
{( )
get* -
;- .
set/ 2
;2 3
}4 5
public 
ICommand 
SaveSettingsCommand +
{, -
get. 1
;1 2
set3 6
;6 7
}8 9
public 
	NewsModel 
Model 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
NewsViewModel 
( 
) 
{ 	
Model 
= 
new 
( 
) 
; 
AddUserCommand 
= 
new  
DelegateCommand! 0
(0 1
(1 2
o2 3
)3 4
=>5 7
AddUser8 ?
(? @
)@ A
)A B
;B C
DelUserCommand 
= 
new  
DelegateCommand! 0
(0 1
(1 2
o2 3
)3 4
=>5 7
DelUser8 ?
(? @
)@ A
)A B
;B C
AddGroupCommand 
= 
new !
DelegateCommand" 1
(1 2
(2 3
o3 4
)4 5
=>6 8
AddGroup9 A
(A B
)B C
)C D
;D E
DelGroupCommand 
= 
new !
DelegateCommand" 1
(1 2
(2 3
o3 4
)4 5
=>6 8
DelGroup9 A
(A B
)B C
)C D
;D E
SaveSettingsCommand 
=  !
new" %
DelegateCommand& 5
(5 6
(6 7
o7 8
)8 9
=>: <
SaveSettings= I
(I J
)J K
)K L
;L M
LoadSettings!! 
(!! 
)!! 
;!! 
UILoader"" 
."" 
Instance"" 
."" 
SetPageReady"" *
(""* +
$str""+ 1
,""1 2
null""3 7
)""7 8
;""8 9
}## 	
public'' 
void'' 
AddUser'' 
('' 
)'' 
{(( 	
try)) 
{** 
if++ 
(++ 
!++ 

Connection++ 
.++  
Context++  '
.++' (
Users++( -
.++- .
Any++. 1
(++1 2
x++2 3
=>++4 6
x++7 8
.++8 9
Username++9 A
==++B D
Model++E J
.++J K
AddUserString++K X
)++X Y
)++Y Z
{,, 

Connection-- 
.-- 
Context-- &
.--& '
Add--' *
(--* +
new--+ .
User--/ 3
(--3 4
Model--4 9
.--9 :
AddUserString--: G
??--H J
$str--K M
)--M N
{--O P
NewsExpiryDate--Q _
=--` a
DateTime--b j
.--j k
Now--k n
.--n o
AddDays--o v
(--v w
Model--w |
.--| }
AddUserDays	--} à
)
--à â
}
--ä ã
)
--ã å
;
--å ç

Connection.. 
... 
Context.. &
...& '
SaveChanges..' 2
(..2 3
)..3 4
;..4 5

MessageBox// 
.// 
Show// #
(//# $
$str//$ B
,//B C
$str//D W
,//W X
MessageBoxButton//Y i
.//i j
OK//j l
)//l m
;//m n
}00 
else11 
if11 
(11 

Connection11 #
.11# $
Context11$ +
.11+ ,
Users11, 1
.111 2
Any112 5
(115 6
x116 7
=>118 :
x11; <
.11< =
Username11= E
==11F H
Model11I N
.11N O
AddUserString11O \
&&11] _
x11` a
.11a b
News11b f
==11g i
false11j o
)11o p
)11p q
{22 
User33 
?33 
user33 
=33  

Connection33! +
.33+ ,
Context33, 3
.333 4
Users334 9
.339 :
First33: ?
(33? @
x33@ A
=>33B D
x33E F
.33F G
Username33G O
==33P R
Model33S X
.33X Y
AddUserString33Y f
)33f g
;33g h
user44 
.44 
News44 
=44 
true44  $
;44$ %
DateTime55 
newExpiryDate55 *
=55+ ,
DateTime55- 5
.555 6
Now556 9
.559 :
AddDays55: A
(55A B
Model55B G
.55G H
AddUserDays55H S
)55S T
;55T U
if66 
(66 
user66 
.66 
NewsExpiryDate66 +
>66, -
DateTime66. 6
.666 7
Now667 :
)66: ;
newExpiryDate66< I
=66J K
user66L P
.66P Q
NewsExpiryDate66Q _
.66_ `
Value66` e
.66e f
AddDays66f m
(66m n
Model66n s
.66s t
AddUserDays66t 
)	66 Ä
;
66Ä Å
user77 
.77 
NewsExpiryDate77 '
=77( )
newExpiryDate77* 7
;777 8

Connection88 
.88 
Context88 &
.88& '
SaveChanges88' 2
(882 3
)883 4
;884 5

MessageBox99 
.99 
Show99 #
(99# $
$str99$ B
,99B C
$str99D W
,99W X
MessageBoxButton99Y i
.99i j
OK99j l
)99l m
;99m n
}:: 
else;; 
{<< 
User== 
user== 
=== 

Connection==  *
.==* +
Context==+ 2
.==2 3
Users==3 8
.==8 9
First==9 >
(==> ?
x==? @
=>==A C
x==D E
.==E F
Username==F N
====O Q
Model==R W
.==W X
AddUserString==X e
)==e f
;==f g
Model>> 
.>> 
SelectedUser>> &
=>>' (
user>>) -
;>>- .
}?? 
ModelAA 
.AA 
UsersAA 
=AA 
nullAA "
;AA" #
}BB 
catchCC 
(CC 
	ExceptionCC 
exCC 
)CC  
{DD 

MessageBoxEE 
.EE 
ShowEE 
(EE  
$"EE  "
$strEE" ;
{EE; <
exEE< >
.EE> ?
MessageEE? F
}EEF G
"EEG H
,EEH I
$strEEJ P
,EEP Q
MessageBoxButtonEER b
.EEb c
OKEEc e
,EEe f
MessageBoxImageEEg v
.EEv w
ErrorEEw |
)EE| }
;EE} ~
}FF 
}GG 	
publicII 
voidII 
DelUserII 
(II 
)II 
{JJ 	
tryKK 
{LL 
ifMM 
(MM 
ModelMM 
.MM 
SelectedUserMM &
==MM' )
nullMM* .
)MM. /
returnMM0 6
;MM6 7
UserNN 
?NN 
userNN 
=NN 

ConnectionNN '
.NN' (
ContextNN( /
.NN/ 0
UsersNN0 5
.NN5 6
FirstNN6 ;
(NN; <
xNN< =
=>NN> @
xNNA B
.NNB C
UsernameNNC K
==NNL N
ModelNNO T
.NNT U
AddUserStringNNU b
&&NNc e
xNNf g
.NNg h
NewsNNh l
==NNm o
trueNNp t
)NNt u
;NNu v
userOO 
.OO 
NewsOO 
=OO 
falseOO !
;OO! "
userPP 
.PP 
NewsExpiryDatePP #
=PP$ %
DateTimePP& .
.PP. /
NowPP/ 2
.PP2 3
AddDaysPP3 :
(PP: ;
-PP; <
$numPP< =
)PP= >
;PP> ?

ConnectionQQ 
.QQ 
ContextQQ "
.QQ" #
SaveChangesQQ# .
(QQ. /
)QQ/ 0
;QQ0 1

MessageBoxSS 
.SS 
ShowSS 
(SS  
$strSS  >
,SS> ?
$strSS@ S
,SSS T
MessageBoxButtonSSU e
.SSe f
OKSSf h
)SSh i
;SSi j
ModelUU 
.UU 
UsersUU 
=UU 
nullUU "
;UU" #
}VV 
catchWW 
(WW 
	ExceptionWW 
exWW 
)WW  
{XX 

MessageBoxYY 
.YY 
ShowYY 
(YY  
$"YY  "
$strYY" ;
{YY; <
exYY< >
.YY> ?
MessageYY? F
}YYF G
"YYG H
,YYH I
$strYYJ P
,YYP Q
MessageBoxButtonYYR b
.YYb c
OKYYc e
,YYe f
MessageBoxImageYYg v
.YYv w
ErrorYYw |
)YY| }
;YY} ~
}ZZ 
}[[ 	
public]] 
void]] 
AddGroup]] 
(]] 
)]] 
{^^ 	
if__ 
(__ 
string__ 
.__ 
IsNullOrEmpty__ $
(__$ %
Model__% *
.__* +
AddGroupString__+ 9
)__9 :
)__: ;
return__< B
;__B C
Settings`` 
.`` 
TelegramSettings`` %
.``% &

NewsGroups``& 0
.``0 1
Add``1 4
(``4 5
Model``5 :
.``: ;
AddGroupString``; I
)``I J
;``J K
Settingsaa 
.aa 
SaveSettingsaa !
(aa! "
)aa" #
;aa# $

MessageBoxbb 
.bb 
Showbb 
(bb 
$strbb 4
,bb4 5
$strbb6 D
,bbD E
MessageBoxButtonbbF V
.bbV W
OKbbW Y
)bbY Z
;bbZ [
}cc 	
publicee 
voidee 
DelGroupee 
(ee 
)ee 
{ff 	
Settingsgg 
.gg 
TelegramSettingsgg %
.gg% &

NewsGroupsgg& 0
.gg0 1
Removegg1 7
(gg7 8
Modelgg8 =
.gg= >
SelectedGroupgg> K
??ggL N
$strggO Q
)ggQ R
;ggR S
Settingshh 
.hh 
SaveSettingshh !
(hh! "
)hh" #
;hh# $

MessageBoxii 
.ii 
Showii 
(ii 
$strii 4
,ii4 5
$strii6 D
,iiD E
MessageBoxButtoniiF V
.iiV W
OKiiW Y
)iiY Z
;iiZ [
}jj 	
publicnn 
voidnn 
SaveSettingsnn  
(nn  !
)nn! "
{oo 	
Settingspp 
.pp 
BotsSettingspp !
.pp! "
NewsSettingspp" .
.pp. /
Messagepp/ 6
=pp7 8
Modelpp9 >
.pp> ?
Messagepp? F
;ppF G
Settingsqq 
.qq 
BotsSettingsqq !
.qq! "
NewsSettingsqq" .
.qq. /
Intervalqq/ 7
=qq8 9
Modelqq: ?
.qq? @
Intervalqq@ H
;qqH I
Settingsrr 
.rr 
BotsSettingsrr !
.rr! "
NewsSettingsrr" .
.rr. /
Keyrr/ 2
=rr3 4
Modelrr5 :
.rr: ;
Keyrr; >
;rr> ?
Settingstt 
.tt 
SaveSettingstt !
(tt! "
)tt" #
;tt# $

MessageBoxvv 
.vv 
Showvv 
(vv 
$strvv ;
,vv; <
$strvv= Q
,vvQ R
MessageBoxButtonvvS c
.vvc d
OKvvd f
)vvf g
;vvg h
}ww 	
publicyy 
voidyy 
LoadSettingsyy  
(yy  !
)yy! "
{zz 	
Model{{ 
.{{ 
Interval{{ 
={{ 
Settings{{ %
.{{% &
BotsSettings{{& 2
.{{2 3
NewsSettings{{3 ?
.{{? @
Interval{{@ H
;{{H I
Model|| 
.|| 
Key|| 
=|| 
Settings||  
.||  !
BotsSettings||! -
.||- .
NewsSettings||. :
.||: ;
Key||; >
;||> ?
Model}} 
.}} 
Message}} 
=}} 
Settings}} $
.}}$ %
BotsSettings}}% 1
.}}1 2
NewsSettings}}2 >
.}}> ?
Message}}? F
;}}F G
}~~ 	
}
ÄÄ 
}ÅÅ û‡
vC:\Users\√ñmer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\UI\ViewModels\PACViewModel.cs
	namespace 	!
EASYTelegramSignalBot
 
.  

ViewModels  *
{ 
internal 
class 
PACViewModel 
:  !
UserControl" -
{ 
public 
ICommand 
AddUserCommand &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
public 
ICommand 
DelUserCommand &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
public 
ICommand 
SetUISymbolCommand *
{+ ,
get- 0
;0 1
set2 5
;5 6
}7 8
public 
ICommand 
AddSymbolCommand (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
public 
ICommand  
AddAllSymbolsCommand ,
{- .
get/ 2
;2 3
set4 7
;7 8
}9 :
public 
ICommand 
DelSymbolCommand (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
public   
ICommand    
AddUserSymbolCommand   ,
{  - .
get  / 2
;  2 3
set  4 7
;  7 8
}  9 :
public!! 
ICommand!!  
DelUserSymbolCommand!! ,
{!!- .
get!!/ 2
;!!2 3
set!!4 7
;!!7 8
}!!9 :
public"" 
ICommand"" 
AddGroupCommand"" '
{""( )
get""* -
;""- .
set""/ 2
;""2 3
}""4 5
public## 
ICommand## 
DelGroupCommand## '
{##( )
get##* -
;##- .
set##/ 2
;##2 3
}##4 5
public$$ 
ICommand$$ 
SaveSettingsCommand$$ +
{$$, -
get$$. 1
;$$1 2
set$$3 6
;$$6 7
}$$8 9
public&& 
PACModel&& 
Model&& 
{&& 
get&&  #
;&&# $
set&&% (
;&&( )
}&&* +
public(( 
PACViewModel(( 
((( 
)(( 
{)) 	
Model** 
=** 
new** 
(** 
)** 
;** 
AddUserCommand,, 
=,, 
new,,  
DelegateCommand,,! 0
(,,0 1
(,,1 2
o,,2 3
),,3 4
=>,,5 7
AddUser,,8 ?
(,,? @
),,@ A
),,A B
;,,B C
DelUserCommand-- 
=-- 
new--  
DelegateCommand--! 0
(--0 1
(--1 2
o--2 3
)--3 4
=>--5 7
DelUser--8 ?
(--? @
)--@ A
)--A B
;--B C
SetUISymbolCommand.. 
=..  
new..! $
DelegateCommand..% 4
(..4 5
(..5 6
o..6 7
)..7 8
=>..9 ;
SetUISymbol..< G
(..G H
)..H I
)..I J
;..J K
AddSymbolCommand// 
=// 
new// "
DelegateCommand//# 2
(//2 3
(//3 4
o//4 5
)//5 6
=>//7 9
	AddSymbol//: C
(//C D
)//D E
)//E F
;//F G 
AddAllSymbolsCommand00  
=00! "
new00# &
DelegateCommand00' 6
(006 7
(007 8
o008 9
)009 :
=>00; =
AddAllSymbols00> K
(00K L
)00L M
)00M N
;00N O
DelSymbolCommand11 
=11 
new11 "
DelegateCommand11# 2
(112 3
(113 4
o114 5
)115 6
=>117 9
	DelSymbol11: C
(11C D
)11D E
)11E F
;11F G 
AddUserSymbolCommand22  
=22! "
new22# &
DelegateCommand22' 6
(226 7
(227 8
o228 9
)229 :
=>22; =
AddUserSymbol22> K
(22K L
)22L M
)22M N
;22N O 
DelUserSymbolCommand33  
=33! "
new33# &
DelegateCommand33' 6
(336 7
(337 8
o338 9
)339 :
=>33; =
DelUserSymbol33> K
(33K L
)33L M
)33M N
;33N O
AddGroupCommand44 
=44 
new44 !
DelegateCommand44" 1
(441 2
(442 3
o443 4
)444 5
=>446 8
AddGroup449 A
(44A B
)44B C
)44C D
;44D E
DelGroupCommand55 
=55 
new55 !
DelegateCommand55" 1
(551 2
(552 3
o553 4
)554 5
=>556 8
DelGroup559 A
(55A B
)55B C
)55C D
;55D E
SaveSettingsCommand66 
=66  !
new66" %
DelegateCommand66& 5
(665 6
(666 7
o667 8
)668 9
=>66: <
SaveSettings66= I
(66I J
)66J K
)66K L
;66L M
LoadSettings88 
(88 
)88 
;88 
SetSubscriptions:: 
(:: 
):: 
;:: 
};; 	
private== 
void== 
SetSubscriptions== %
(==% &
)==& '
{>> 	
foreach?? 
(?? 
string?? 
??? 
symbol?? #
in??$ &
Settings??' /
.??/ 0
BotsSettings??0 <
.??< =
PACSettings??= H
.??H I
Symbols??I P
.??P Q
ToList??Q W
(??W X
)??X Y
)??Y Z
{@@ 
tryAA 
{BB 
ModelCC 
.CC 
SymbolsCC !
.CC! "
AddCC" %
(CC% &
newCC& )
PACCC* -
(CC- .
symbolCC. 4
,CC4 5
ModelCC6 ;
.CC; <
KlineIntervalCC< I
,CCI J
(CCK L
stringCCL R
symbolCCS Y
,CCY Z

DictionaryCC[ e
<CCe f
stringCCf l
,CCl m
ListCCn r
<CCr s
objectCCs y
>CCy z
>CCz {
values	CC| Ç
)
CCÇ É
=>
CCÑ Ü
{
CCá à
}
CCâ ä
,
CCä ã
SendSignalMessage
CCå ù
,
CCù û
true
CCü £
)
CC£ §
{
CC• ¶
}
CCß ®
)
CC® ©
;
CC© ™
}DD 
catchEE 
(EE 
	ExceptionEE  
exEE! #
)EE# $
{FF 
MessageBoxResultGG $
deleteSymbolGG% 1
=GG2 3

MessageBoxGG4 >
.GG> ?
ShowGG? C
(GGC D
$"GGD F
{GGF G
symbolGGG M
}GGM N
$strGGN s
{GGs t
exGGt v
.GGv w
MessageGGw ~
}GG~ 
$str	GG ï
"
GGï ñ
,
GGñ ó
$str
GGò û
,
GGû ü
MessageBoxButton
GG† ∞
.
GG∞ ±
YesNo
GG± ∂
,
GG∂ ∑
MessageBoxImage
GG∏ «
.
GG« »
Error
GG» Õ
)
GGÕ Œ
;
GGŒ œ
ifHH 
(HH 
deleteSymbolHH $
==HH% '
MessageBoxResultHH( 8
.HH8 9
YesHH9 <
)HH< =
{II 
SettingsJJ  
.JJ  !
BotsSettingsJJ! -
.JJ- .
PACSettingsJJ. 9
.JJ9 :
SymbolsJJ: A
.JJA B
RemoveJJB H
(JJH I
symbolJJI O
)JJO P
;JJP Q
SettingsKK  
.KK  !
SaveSettingsKK! -
(KK- .
)KK. /
;KK/ 0
}LL 
}MM 
}NN 
UILoaderOO 
.OO 
InstanceOO 
.OO 
SetPageReadyOO *
(OO* +
$strOO+ 0
,OO0 1
(OO2 3
)OO3 4
=>OO5 7
ContinueOO8 @
(OO@ A
)OOA B
)OOB C
;OOC D
}PP 	
privateRR 
TaskRR 
ContinueRR 
(RR 
)RR 
{SS 	
foreachTT 
(TT 
	IndicatorTT 
?TT 
symbolTT  &
inTT' )
ModelTT* /
.TT/ 0
SymbolsTT0 7
)TT7 8
symbolTT9 ?
.TT? @
ContinueTT@ H
(TTH I
)TTI J
;TTJ K
returnUU 
TaskUU 
.UU 
CompletedTaskUU %
;UU% &
}VV 	
publicYY 
voidYY 
UpdateUIYY 
(YY 
stringYY #
symbolYY$ *
,YY* +

DictionaryYY, 6
<YY6 7
stringYY7 =
,YY= >
ListYY? C
<YYC D
objectYYD J
>YYJ K
>YYK L
ValuesYYM S
)YYS T
{ZZ 	
if[[ 
([[ 
symbol[[ 
!=[[ 
Model[[ 
.[[  
UISymbol[[  (
)[[( )
return[[* 0
;[[0 1
List]] 
<]] 
Kline]] 
>]] 
?]] 
Klines]] 
=]]  !
Values]]" (
[]]( )
$str]]) 1
]]]1 2
.]]2 3
Select]]3 9
(]]9 :
x]]: ;
=>]]< >
(]]? @
Kline]]@ E
)]]E F
x]]F G
)]]G H
.]]H I
ToList]]I O
(]]O P
)]]P Q
;]]Q R
UpdateKlines^^ 
(^^ 
Klines^^ 
)^^  
;^^  !
List`` 
<`` 
object`` 
>`` 
?`` 
TOC`` 
=`` 
Values``  &
[``& '
$str``' ,
]``, -
.``- .
ToList``. 4
(``4 5
)``5 6
;``6 7
Listaa 
<aa 
objectaa 
>aa 
?aa 
BOCaa 
=aa 
Valuesaa  &
[aa& '
$straa' ,
]aa, -
.aa- .
ToListaa. 4
(aa4 5
)aa5 6
;aa6 7
UpdateIndicatorsbb 
(bb 
Klinesbb #
,bb# $
TOCbb% (
,bb( )
BOCbb* -
)bb- .
;bb. /
}cc 	
publicee 
voidee 
SetUISymbolee 
(ee  
)ee  !
{ff 	
ifgg 
(gg 
Modelgg 
.gg 
SelectedSymbolgg $
==gg% '
nullgg( ,
)gg, -
returngg. 4
;gg4 5
ifhh 
(hh 
Modelhh 
.hh 
SelectedSymbolhh $
.hh$ %
Symbolhh% +
==hh, .
Modelhh/ 4
.hh4 5
UISymbolhh5 =
)hh= >
returnhh? E
;hhE F
ifii 
(ii 
Modelii 
.ii 
Symbolsii 
.ii 
Countii #
<ii$ %
$numii& '
)ii' (
returnii) /
;ii/ 0
ifkk 
(kk 
Modelkk 
.kk 
Symbolskk 
.kk 
Anykk !
(kk! "
xkk" #
=>kk$ &
xkk' (
.kk( )
Symbolkk) /
==kk0 2
Modelkk3 8
.kk8 9
UISymbolkk9 A
)kkA B
)kkB C
{ll 
Modelmm 
.mm 
Symbolsmm 
.mm 
Firstmm #
(mm# $
xmm$ %
=>mm& (
xmm) *
.mm* +
Symbolmm+ 1
==mm2 4
Modelmm5 :
.mm: ;
UISymbolmm; C
)mmC D
.mmD E
UpdateActionmmE Q
=mmR S
(mmT U
stringmmU [
symbolmm\ b
,mmb c

Dictionarymmd n
<mmn o
stringmmo u
,mmu v
Listmmw {
<mm{ |
object	mm| Ç
>
mmÇ É
>
mmÉ Ñ
values
mmÖ ã
)
mmã å
=>
mmç è
{
mmê ë
}
mmí ì
;
mmì î
}nn 
Modeloo 
.oo !
KlineSeriesCollectionoo '
.oo' (
ToListoo( .
(oo. /
)oo/ 0
.oo0 1
ForEachoo1 8
(oo8 9
xoo9 :
=>oo; =
xoo> ?
.oo? @
Valuesoo@ F
.ooF G
ClearooG L
(ooL M
)ooM N
)ooN O
;ooO P
Modelpp 
.pp &
IndicatorsSeriesCollectionpp ,
.pp, -
ToListpp- 3
(pp3 4
)pp4 5
.pp5 6
ForEachpp6 =
(pp= >
xpp> ?
=>pp@ B
xppC D
.ppD E
ValuesppE K
.ppK L
ClearppL Q
(ppQ R
)ppR S
)ppS T
;ppT U
Modelqq 
.qq 
UISymbolqq 
=qq 
Modelqq "
.qq" #
SelectedSymbolqq# 1
.qq1 2
Symbolqq2 8
;qq8 9
Modelrr 
.rr 
Symbolsrr 
.rr 
Firstrr 
(rr  
xrr  !
=>rr" $
xrr% &
.rr& '
Symbolrr' -
==rr. 0
Modelrr1 6
.rr6 7
UISymbolrr7 ?
)rr? @
.rr@ A
UpdateActionrrA M
=rrN O
UpdateUIrrP X
;rrX Y
Modelss 
.ss 
KlineSeriesss 
.ss 
Titless #
=ss$ %
Modelss& +
.ss+ ,
UISymbolss, 4
;ss4 5
}tt 	
publicvv 
voidvv 
UpdateKlinesvv  
(vv  !
IEnumerablevv! ,
<vv, -
Klinevv- 2
>vv2 3
Klinesvv4 :
)vv: ;
{ww 	
ifxx 
(xx 
Modelxx 
.xx 
KlineSeriesxx !
.xx! "
Valuesxx" (
.xx( )
Countxx) .
==xx/ 1
$numxx2 3
)xx3 4
{yy 
Modelzz 
.zz 
KlineSerieszz !
.zz! "
Valueszz" (
.zz( )
AddRangezz) 1
(zz1 2
Klineszz2 8
.zz8 9
Selectzz9 ?
(zz? @
xzz@ A
=>zzB D
newzzE H
	OhlcPointzzI R
(zzR S
(zzS T
doublezzT Z
)zzZ [
xzz[ \
.zz\ ]
_Openzz] b
,zzb c
(zzd e
doublezze k
)zzk l
xzzl m
.zzm n
_Highzzn s
,zzs t
(zzu v
doublezzv |
)zz| }
xzz} ~
.zz~ 
_Low	zz É
,
zzÉ Ñ
(
zzÖ Ü
double
zzÜ å
)
zzå ç
x
zzç é
.
zzé è
_Close
zzè ï
)
zzï ñ
)
zzñ ó
.
zzó ò
ToList
zzò û
(
zzû ü
)
zzü †
)
zz† °
;
zz° ¢
Model{{ 
.{{ 
Labels{{ 
={{ 
Klines{{ %
.{{% &
Select{{& ,
({{, -
x{{- .
=>{{/ 1
x{{2 3
.{{3 4
	_OpenDate{{4 =
.{{= >
ToString{{> F
({{F G
$str{{G M
){{M N
){{N O
.{{O P
ToList{{P V
({{V W
){{W X
;{{X Y
return|| 
;|| 
}}} 
if 
( 
Model 
. 
Labels 
. 
Last !
(! "
)" #
==$ &
Klines' -
.- .
Last. 2
(2 3
)3 4
.4 5
	_OpenDate5 >
.> ?
ToString? G
(G H
$strH N
)N O
)O P
{
ÄÄ 
Kline
ÅÅ 
?
ÅÅ 
	LastKline
ÅÅ  
=
ÅÅ! "
Klines
ÅÅ# )
.
ÅÅ) *
Last
ÅÅ* .
(
ÅÅ. /
)
ÅÅ/ 0
;
ÅÅ0 1
	OhlcPoint
ÇÇ 
?
ÇÇ 
LastChartKline
ÇÇ )
=
ÇÇ* +
(
ÇÇ, -
	OhlcPoint
ÇÇ- 6
?
ÇÇ6 7
)
ÇÇ7 8
Model
ÇÇ8 =
.
ÇÇ= >#
KlineSeriesCollection
ÇÇ> S
[
ÇÇS T
$num
ÇÇT U
]
ÇÇU V
.
ÇÇV W
Values
ÇÇW ]
[
ÇÇ] ^
^
ÇÇ^ _
$num
ÇÇ_ `
]
ÇÇ` a
;
ÇÇa b
if
ÑÑ 
(
ÑÑ 
LastChartKline
ÑÑ "
==
ÑÑ# %
null
ÑÑ& *
)
ÑÑ* +
return
ÑÑ, 2
;
ÑÑ2 3
LastChartKline
ÖÖ 
.
ÖÖ 
Close
ÖÖ $
=
ÖÖ% &
(
ÖÖ' (
double
ÖÖ( .
)
ÖÖ. /
	LastKline
ÖÖ/ 8
.
ÖÖ8 9
_Close
ÖÖ9 ?
;
ÖÖ? @
if
ÜÜ 
(
ÜÜ 
LastChartKline
ÜÜ "
.
ÜÜ" #
High
ÜÜ# '
<
ÜÜ( )
(
ÜÜ* +
double
ÜÜ+ 1
)
ÜÜ1 2
	LastKline
ÜÜ2 ;
.
ÜÜ; <
_High
ÜÜ< A
)
ÜÜA B
LastChartKline
ÜÜC Q
.
ÜÜQ R
High
ÜÜR V
=
ÜÜW X
(
ÜÜY Z
double
ÜÜZ `
)
ÜÜ` a
	LastKline
ÜÜa j
.
ÜÜj k
_High
ÜÜk p
;
ÜÜp q
if
áá 
(
áá 
LastChartKline
áá "
.
áá" #
Low
áá# &
<
áá' (
(
áá) *
double
áá* 0
)
áá0 1
	LastKline
áá1 :
.
áá: ;
_Low
áá; ?
)
áá? @
LastChartKline
ááA O
.
ááO P
Low
ááP S
=
ááT U
(
ááV W
double
ááW ]
)
áá] ^
	LastKline
áá^ g
.
áág h
_Low
ááh l
;
áál m
return
àà 
;
àà 
}
ââ 
Model
ãã 
.
ãã 
Labels
ãã 
.
ãã 
RemoveAt
ãã !
(
ãã! "
$num
ãã" #
)
ãã# $
;
ãã$ %
Model
åå 
.
åå #
KlineSeriesCollection
åå '
[
åå' (
$num
åå( )
]
åå) *
.
åå* +
Values
åå+ 1
.
åå1 2
RemoveAt
åå2 :
(
åå: ;
$num
åå; <
)
åå< =
;
åå= >
Model
éé 
.
éé 
Labels
éé 
.
éé 
Add
éé 
(
éé 
Klines
éé #
.
éé# $
Last
éé$ (
(
éé( )
)
éé) *
.
éé* +
	_OpenDate
éé+ 4
.
éé4 5
ToString
éé5 =
(
éé= >
$str
éé> D
)
ééD E
)
ééE F
;
ééF G
Model
èè 
.
èè #
KlineSeriesCollection
èè '
[
èè' (
$num
èè( )
]
èè) *
.
èè* +
Values
èè+ 1
.
èè1 2
Add
èè2 5
(
èè5 6
new
èè6 9
	OhlcPoint
èè: C
(
èèC D
(
èèD E
double
èèE K
)
èèK L
Klines
èèL R
.
èèR S
Last
èèS W
(
èèW X
)
èèX Y
.
èèY Z
_Open
èèZ _
,
èè_ `
(
èèa b
double
èèb h
)
èèh i
Klines
èèi o
.
èèo p
Last
èèp t
(
èèt u
)
èèu v
.
èèv w
_High
èèw |
,
èè| }
(
èè~ 
doubleèè Ö
)èèÖ Ü
KlinesèèÜ å
.èèå ç
Lastèèç ë
(èèë í
)èèí ì
.èèì î
_Lowèèî ò
,èèò ô
(èèö õ
doubleèèõ °
)èè° ¢
Klinesèè¢ ®
.èè® ©
Lastèè© ≠
(èè≠ Æ
)èèÆ Ø
.èèØ ∞
_Closeèè∞ ∂
)èè∂ ∑
)èè∑ ∏
;èè∏ π
}
êê 	
public
íí 
void
íí 
UpdateIndicators
íí $
(
íí$ %
IEnumerable
íí% 0
<
íí0 1
Kline
íí1 6
>
íí6 7
Klines
íí8 >
,
íí> ?
IEnumerable
íí@ K
<
ííK L
object
ííL R
>
ííR S
TOC
ííT W
,
ííW X
IEnumerable
ííY d
<
ííd e
object
ííe k
>
íík l
BOC
íím p
)
ííp q
{
ìì 	
UpdateIndicator
îî 
(
îî 
Klines
îî "
,
îî" #
Model
îî$ )
.
îî) *
TOC
îî* -
.
îî- .
Values
îî. 4
,
îî4 5
TOC
îî6 9
)
îî9 :
;
îî: ;
UpdateIndicator
ïï 
(
ïï 
Klines
ïï "
,
ïï" #
Model
ïï$ )
.
ïï) *
BOC
ïï* -
.
ïï- .
Values
ïï. 4
,
ïï4 5
BOC
ïï6 9
)
ïï9 :
;
ïï: ;
}
ññ 	
private
òò 
void
òò 
UpdateIndicator
òò $
(
òò$ %
IEnumerable
òò% 0
<
òò0 1
Kline
òò1 6
>
òò6 7
Klines
òò8 >
,
òò> ?
IChartValues
òò@ L
values
òòM S
,
òòS T
IEnumerable
òòU `
<
òò` a
object
òòa g
>
òòg h
	newValues
òòi r
)
òòr s
{
ôô 	
if
öö 
(
öö 
values
öö 
.
öö 
Count
öö 
==
öö 
$num
öö  !
)
öö! "
{
õõ 
values
úú 
.
úú 
AddRange
úú 
(
úú  
	newValues
úú  )
.
úú) *
Select
úú* 0
(
úú0 1
x
úú1 2
=>
úú3 5
(
úú6 7
object
úú7 =
)
úú= >
Convert
úú> E
.
úúE F
ToDouble
úúF N
(
úúN O
x
úúO P
)
úúP Q
)
úúQ R
)
úúR S
;
úúS T
return
ùù 
;
ùù 
}
ûû 
if
†† 
(
†† 
Model
†† 
.
†† 
Labels
†† 
.
†† 
Last
†† !
(
††! "
)
††" #
==
††$ &
Klines
††' -
.
††- .
Last
††. 2
(
††2 3
)
††3 4
.
††4 5
	_OpenDate
††5 >
.
††> ?
ToString
††? G
(
††G H
$str
††H N
)
††N O
)
††O P
{
°° 
values
¢¢ 
[
¢¢ 
^
¢¢ 
$num
¢¢ 
]
¢¢ 
=
¢¢ 
	newValues
¢¢ &
.
¢¢& '
Last
¢¢' +
(
¢¢+ ,
)
¢¢, -
;
¢¢- .
return
££ 
;
££ 
}
§§ 
values
¶¶ 
.
¶¶ 
Add
¶¶ 
(
¶¶ 
	newValues
¶¶  
.
¶¶  !
Last
¶¶! %
(
¶¶% &
)
¶¶& '
)
¶¶' (
;
¶¶( )
}
ßß 	
public
´´ 
void
´´ -
UserSymbolsListSelectionChanged
´´ 3
(
´´3 4
)
´´4 5
{
¨¨ 	
Model
≠≠ 
.
≠≠ !
AddUserSymbolString
≠≠ %
=
≠≠& '
Model
≠≠( -
.
≠≠- . 
SelectedUserSymbol
≠≠. @
?
≠≠@ A
.
≠≠A B
Key
≠≠B E
;
≠≠E F
}
ÆÆ 	
public
∞∞ 
void
∞∞ 
AddUser
∞∞ 
(
∞∞ 
)
∞∞ 
{
±± 	
try
≤≤ 
{
≥≥ 
if
¥¥ 
(
¥¥ 
!
¥¥ 

Connection
¥¥ 
.
¥¥  
Context
¥¥  '
.
¥¥' (
Users
¥¥( -
.
¥¥- .
Any
¥¥. 1
(
¥¥1 2
x
¥¥2 3
=>
¥¥4 6
x
¥¥7 8
.
¥¥8 9
Username
¥¥9 A
==
¥¥B D
Model
¥¥E J
.
¥¥J K
AddUserString
¥¥K X
)
¥¥X Y
)
¥¥Y Z
{
µµ 
User
∂∂ 
?
∂∂ 
user
∂∂ 
=
∂∂  
new
∂∂! $
User
∂∂% )
(
∂∂) *
Model
∂∂* /
.
∂∂/ 0
AddUserString
∂∂0 =
??
∂∂> @
$str
∂∂A C
)
∂∂C D
{
∂∂E F
PAC
∂∂G J
=
∂∂K L
true
∂∂M Q
}
∂∂R S
;
∂∂S T

Connection
∑∑ 
.
∑∑ 
Context
∑∑ &
.
∑∑& '

CreateUser
∑∑' 1
(
∑∑1 2
user
∑∑2 6
)
∑∑6 7
;
∑∑7 8
Model
∏∏ 
.
∏∏ 
SelectedUser
∏∏ &
=
∏∏' (
user
∏∏) -
;
∏∏- .

MessageBox
ππ 
.
ππ 
Show
ππ #
(
ππ# $
$str
ππ$ B
,
ππB C
$str
ππD W
,
ππW X
MessageBoxButton
ππY i
.
ππi j
OK
ππj l
)
ππl m
;
ππm n
}
∫∫ 
else
ªª 
if
ªª 
(
ªª 

Connection
ªª #
.
ªª# $
Context
ªª$ +
.
ªª+ ,
Users
ªª, 1
.
ªª1 2
Any
ªª2 5
(
ªª5 6
x
ªª6 7
=>
ªª8 :
x
ªª; <
.
ªª< =
Username
ªª= E
==
ªªF H
Model
ªªI N
.
ªªN O
AddUserString
ªªO \
&&
ªª] _
x
ªª` a
.
ªªa b
PAC
ªªb e
==
ªªf h
false
ªªi n
)
ªªn o
)
ªªo p
{
ºº 
User
ΩΩ 
?
ΩΩ 
user
ΩΩ 
=
ΩΩ  

Connection
ΩΩ! +
.
ΩΩ+ ,
Context
ΩΩ, 3
.
ΩΩ3 4
Users
ΩΩ4 9
.
ΩΩ9 :
First
ΩΩ: ?
(
ΩΩ? @
x
ΩΩ@ A
=>
ΩΩB D
x
ΩΩE F
.
ΩΩF G
Username
ΩΩG O
==
ΩΩP R
Model
ΩΩS X
.
ΩΩX Y
AddUserString
ΩΩY f
&&
ΩΩg i
x
ΩΩj k
.
ΩΩk l
PAC
ΩΩl o
==
ΩΩp r
false
ΩΩs x
)
ΩΩx y
;
ΩΩy z
user
ææ 
.
ææ 
PAC
ææ 
=
ææ 
true
ææ #
;
ææ# $

Connection
øø 
.
øø 
Context
øø &
.
øø& '
SaveChanges
øø' 2
(
øø2 3
)
øø3 4
;
øø4 5
Model
¿¿ 
.
¿¿ 
SelectedUser
¿¿ &
=
¿¿' (
user
¿¿) -
;
¿¿- .

MessageBox
¡¡ 
.
¡¡ 
Show
¡¡ #
(
¡¡# $
$str
¡¡$ B
,
¡¡B C
$str
¡¡D W
,
¡¡W X
MessageBoxButton
¡¡Y i
.
¡¡i j
OK
¡¡j l
)
¡¡l m
;
¡¡m n
}
¬¬ 
else
√√ 
{
ƒƒ 
User
≈≈ 
user
≈≈ 
=
≈≈ 

Connection
≈≈  *
.
≈≈* +
Context
≈≈+ 2
.
≈≈2 3
Users
≈≈3 8
.
≈≈8 9
First
≈≈9 >
(
≈≈> ?
x
≈≈? @
=>
≈≈A C
x
≈≈D E
.
≈≈E F
Username
≈≈F N
==
≈≈O Q
Model
≈≈R W
.
≈≈W X
AddUserString
≈≈X e
)
≈≈e f
;
≈≈f g
Model
∆∆ 
.
∆∆ 
SelectedUser
∆∆ &
=
∆∆' (
user
∆∆) -
;
∆∆- .
}
«« 
}
»» 
catch
…… 
(
…… 
	Exception
…… 
ex
…… 
)
……  
{
   

MessageBox
ÀÀ 
.
ÀÀ 
Show
ÀÀ 
(
ÀÀ  
$"
ÀÀ  "
$str
ÀÀ" ;
{
ÀÀ; <
ex
ÀÀ< >
.
ÀÀ> ?
Message
ÀÀ? F
}
ÀÀF G
"
ÀÀG H
,
ÀÀH I
$str
ÀÀJ P
,
ÀÀP Q
MessageBoxButton
ÀÀR b
.
ÀÀb c
OK
ÀÀc e
,
ÀÀe f
MessageBoxImage
ÀÀg v
.
ÀÀv w
Error
ÀÀw |
)
ÀÀ| }
;
ÀÀ} ~
}
ÃÃ 
}
ÕÕ 	
public
œœ 
void
œœ 
DelUser
œœ 
(
œœ 
)
œœ 
{
–– 	
try
—— 
{
““ 
if
”” 
(
”” 
Model
”” 
.
”” 
SelectedUser
”” &
==
””' )
null
””* .
)
””. /
return
””0 6
;
””6 7
Model
’’ 
.
’’ 
SelectedUser
’’ "
.
’’" #
PAC
’’# &
=
’’' (
false
’’) .
;
’’. /

Connection
÷÷ 
.
÷÷ 
Context
÷÷ "
.
÷÷" #
SaveChanges
÷÷# .
(
÷÷. /
)
÷÷/ 0
;
÷÷0 1

MessageBox
ŸŸ 
.
ŸŸ 
Show
ŸŸ 
(
ŸŸ  
$str
ŸŸ  >
,
ŸŸ> ?
$str
ŸŸ@ S
,
ŸŸS T
MessageBoxButton
ŸŸU e
.
ŸŸe f
OK
ŸŸf h
)
ŸŸh i
;
ŸŸi j
}
⁄⁄ 
catch
€€ 
(
€€ 
	Exception
€€ 
ex
€€ 
)
€€  
{
‹‹ 

MessageBox
›› 
.
›› 
Show
›› 
(
››  
$"
››  "
$str
››" ;
{
››; <
ex
››< >
.
››> ?
Message
››? F
}
››F G
"
››G H
,
››H I
$str
››J P
,
››P Q
MessageBoxButton
››R b
.
››b c
OK
››c e
,
››e f
MessageBoxImage
››g v
.
››v w
Error
››w |
)
››| }
;
››} ~
}
ﬁﬁ 
}
ﬂﬂ 	
public
·· 
void
·· 
AddUserSymbol
·· !
(
··! "
)
··" #
{
‚‚ 	
try
„„ 
{
‰‰ 
if
ÂÂ 
(
ÂÂ 
Model
ÂÂ 
.
ÂÂ 
SelectedUser
ÂÂ &
==
ÂÂ' )
null
ÂÂ* .
)
ÂÂ. /
return
ÂÂ0 6
;
ÂÂ6 7
bool
ÊÊ 
showMessage
ÊÊ  
=
ÊÊ! "
false
ÊÊ# (
;
ÊÊ( )
if
ËË 
(
ËË 
Model
ËË 
.
ËË 
SelectedUser
ËË &
.
ËË& '

PACSymbols
ËË' 1
.
ËË1 2
Any
ËË2 5
(
ËË5 6
x
ËË6 7
=>
ËË8 :
x
ËË; <
.
ËË< =
Key
ËË= @
.
ËË@ A
Equals
ËËA G
(
ËËG H
Model
ËËH M
.
ËËM N!
AddUserSymbolString
ËËN a
)
ËËa b
)
ËËb c
)
ËËc d
{
ÈÈ 
int
ÍÍ 
addDays
ÍÍ 
=
ÍÍ  !
Model
ÍÍ" '
.
ÍÍ' (
AddUserDays
ÍÍ( 3
==
ÍÍ4 6
$num
ÍÍ7 8
?
ÍÍ9 :
$num
ÍÍ; A
:
ÍÍB C
Model
ÍÍD I
.
ÍÍI J
AddUserDays
ÍÍJ U
;
ÍÍU V
DateTime
ÏÏ 
newDate
ÏÏ $
=
ÏÏ% &
Model
ÏÏ' ,
.
ÏÏ, -
SelectedUser
ÏÏ- 9
.
ÏÏ9 :

PACSymbols
ÏÏ: D
.
ÏÏD E
First
ÏÏE J
(
ÏÏJ K
x
ÏÏK L
=>
ÏÏM O
x
ÏÏP Q
.
ÏÏQ R
Key
ÏÏR U
.
ÏÏU V
Equals
ÏÏV \
(
ÏÏ\ ]
Model
ÏÏ] b
.
ÏÏb c!
AddUserSymbolString
ÏÏc v
)
ÏÏv w
)
ÏÏw x
.
ÏÏx y
Value
ÏÏy ~
>=ÏÏ Å
DateTimeÏÏÇ ä
.ÏÏä ã
NowÏÏã é
?ÏÏè ê
Model
ÌÌ 
.
ÌÌ 
SelectedUser
ÌÌ *
.
ÌÌ* +

PACSymbols
ÌÌ+ 5
.
ÌÌ5 6
First
ÌÌ6 ;
(
ÌÌ; <
x
ÌÌ< =
=>
ÌÌ> @
x
ÌÌA B
.
ÌÌB C
Key
ÌÌC F
.
ÌÌF G
Equals
ÌÌG M
(
ÌÌM N
Model
ÌÌN S
.
ÌÌS T!
AddUserSymbolString
ÌÌT g
)
ÌÌg h
)
ÌÌh i
.
ÌÌi j
Value
ÌÌj o
.
ÌÌo p
AddDays
ÌÌp w
(
ÌÌw x
addDays
ÌÌx 
)ÌÌ Ä
:ÌÌÅ Ç
DateTime
ÓÓ  
.
ÓÓ  !
Now
ÓÓ! $
.
ÓÓ$ %
AddDays
ÓÓ% ,
(
ÓÓ, -
addDays
ÓÓ- 4
)
ÓÓ4 5
;
ÓÓ5 6
Model
 
.
 
SelectedUser
 &
.
& '

PACSymbols
' 1
[
1 2
Model
2 7
.
7 8!
AddUserSymbolString
8 K
??
L N
$str
O Q
]
Q R
=
S T
newDate
U \
;
\ ]
}
ÒÒ 
else
ÚÚ 
{
ÛÛ 
Model
ÙÙ 
.
ÙÙ 
SelectedUser
ÙÙ &
.
ÙÙ& '

PACSymbols
ÙÙ' 1
.
ÙÙ1 2
Add
ÙÙ2 5
(
ÙÙ5 6
Model
ÙÙ6 ;
.
ÙÙ; <!
AddUserSymbolString
ÙÙ< O
??
ÙÙP R
$str
ÙÙS U
,
ÙÙU V
DateTime
ÙÙW _
.
ÙÙ_ `
Now
ÙÙ` c
.
ÙÙc d
AddDays
ÙÙd k
(
ÙÙk l
Model
ÙÙl q
.
ÙÙq r
AddUserDays
ÙÙr }
)
ÙÙ} ~
)
ÙÙ~ 
;ÙÙ Ä
showMessage
ıı 
=
ıı  !
true
ıı" &
;
ıı& '
}
ˆˆ 
Model
¯¯ 
.
¯¯ 
SelectedUser
¯¯ "
.
¯¯" #
SaveUserSymbols
¯¯# 2
(
¯¯2 3
)
¯¯3 4
;
¯¯4 5

Connection
˘˘ 
.
˘˘ 
Context
˘˘ "
.
˘˘" #
SaveChanges
˘˘# .
(
˘˘. /
)
˘˘/ 0
;
˘˘0 1
Model
˙˙ 
.
˙˙ !
SelectedUserSymbols
˙˙ )
=
˙˙* +
new
˙˙, /
(
˙˙/ 0
Model
˙˙0 5
.
˙˙5 6
SelectedUser
˙˙6 B
.
˙˙B C

PACSymbols
˙˙C M
)
˙˙M N
;
˙˙N O
if
¸¸ 
(
¸¸ 
showMessage
¸¸ 
)
¸¸  

MessageBox
¸¸! +
.
¸¸+ ,
Show
¸¸, 0
(
¸¸0 1
$str
¸¸1 X
,
¸¸X Y
$str
¸¸Z j
,
¸¸j k
MessageBoxButton
¸¸l |
.
¸¸| }
OK
¸¸} 
)¸¸ Ä
;¸¸Ä Å
}
˛˛ 
catch
ˇˇ 
(
ˇˇ 
	Exception
ˇˇ 
ex
ˇˇ 
)
ˇˇ  
{
ÄÄ 

MessageBox
ÅÅ 
.
ÅÅ 
Show
ÅÅ 
(
ÅÅ  
$"
ÅÅ  "
$str
ÅÅ" ;
{
ÅÅ; <
ex
ÅÅ< >
.
ÅÅ> ?
Message
ÅÅ? F
}
ÅÅF G
"
ÅÅG H
,
ÅÅH I
$str
ÅÅJ P
,
ÅÅP Q
MessageBoxButton
ÅÅR b
.
ÅÅb c
OK
ÅÅc e
,
ÅÅe f
MessageBoxImage
ÅÅg v
.
ÅÅv w
Error
ÅÅw |
)
ÅÅ| }
;
ÅÅ} ~
}
ÇÇ 
}
ÉÉ 	
public
ÖÖ 
void
ÖÖ 
DelUserSymbol
ÖÖ !
(
ÖÖ! "
)
ÖÖ" #
{
ÜÜ 	
try
áá 
{
àà 
if
ââ 
(
ââ 
Model
ââ 
.
ââ 
SelectedUser
ââ &
==
ââ' )
null
ââ* .
||
ââ/ 1
Model
ââ2 7
.
ââ7 8!
SelectedUserSymbols
ââ8 K
?
ââK L
.
ââL M
Count
ââM R
==
ââS U
$num
ââV W
)
ââW X
return
ââY _
;
ââ_ `
Model
ãã 
.
ãã 
SelectedUser
ãã "
.
ãã" #

PACSymbols
ãã# -
.
ãã- .
Remove
ãã. 4
(
ãã4 5
Model
ãã5 :
.
ãã: ; 
SelectedUserSymbol
ãã; M
?
ããM N
.
ããN O
Key
ããO R
??
ããS U
$str
ããV X
)
ããX Y
;
ããY Z
Model
åå 
.
åå 
SelectedUser
åå "
.
åå" #
SaveUserSymbols
åå# 2
(
åå2 3
)
åå3 4
;
åå4 5

Connection
çç 
.
çç 
Context
çç "
.
çç" #
SaveChanges
çç# .
(
çç. /
)
çç/ 0
;
çç0 1
Model
èè 
.
èè !
SelectedUserSymbols
èè )
=
èè* +
new
èè, /
(
èè/ 0
Model
èè0 5
.
èè5 6
SelectedUser
èè6 B
.
èèB C

PACSymbols
èèC M
)
èèM N
;
èèN O

MessageBox
êê 
.
êê 
Show
êê 
(
êê  
$str
êê  ;
,
êê; <
$str
êê= P
,
êêP Q
MessageBoxButton
êêR b
.
êêb c
OK
êêc e
)
êêe f
;
êêf g
}
ëë 
catch
íí 
(
íí 
	Exception
íí 
ex
íí 
)
íí  
{
ìì 

MessageBox
îî 
.
îî 
Show
îî 
(
îî  
$"
îî  "
$str
îî" ;
{
îî; <
ex
îî< >
.
îî> ?
Message
îî? F
}
îîF G
"
îîG H
,
îîH I
$str
îîJ P
,
îîP Q
MessageBoxButton
îîR b
.
îîb c
OK
îîc e
,
îîe f
MessageBoxImage
îîg v
.
îîv w
Error
îîw |
)
îî| }
;
îî} ~
}
ïï 
}
ññ 	
public
òò 
void
òò 
AddGroup
òò 
(
òò 
)
òò 
{
ôô 	
if
öö 
(
öö 
string
öö 
.
öö 
IsNullOrEmpty
öö $
(
öö$ %
Model
öö% *
.
öö* +
AddGroupString
öö+ 9
)
öö9 :
)
öö: ;
return
öö< B
;
ööB C
Settings
õõ 
.
õõ 
TelegramSettings
õõ %
.
õõ% &
	PACGroups
õõ& /
.
õõ/ 0
Add
õõ0 3
(
õõ3 4
Model
õõ4 9
.
õõ9 :
AddGroupString
õõ: H
)
õõH I
;
õõI J
Settings
úú 
.
úú 
SaveSettings
úú !
(
úú! "
)
úú" #
;
úú# $

MessageBox
ùù 
.
ùù 
Show
ùù 
(
ùù 
$str
ùù 4
,
ùù4 5
$str
ùù6 D
,
ùùD E
MessageBoxButton
ùùF V
.
ùùV W
OK
ùùW Y
)
ùùY Z
;
ùùZ [
}
ûû 	
public
†† 
void
†† 
DelGroup
†† 
(
†† 
)
†† 
{
°° 	
Settings
¢¢ 
.
¢¢ 
TelegramSettings
¢¢ %
.
¢¢% &
	PACGroups
¢¢& /
.
¢¢/ 0
Remove
¢¢0 6
(
¢¢6 7
Model
¢¢7 <
.
¢¢< =
SelectedGroup
¢¢= J
??
¢¢K M
$str
¢¢N P
)
¢¢P Q
;
¢¢Q R
Settings
££ 
.
££ 
SaveSettings
££ !
(
££! "
)
££" #
;
££# $

MessageBox
§§ 
.
§§ 
Show
§§ 
(
§§ 
$str
§§ 4
,
§§4 5
$str
§§6 D
,
§§D E
MessageBoxButton
§§F V
.
§§V W
OK
§§W Y
)
§§Y Z
;
§§Z [
}
•• 	
public
©© 
void
©© 
	DelSymbol
©© 
(
©© 
)
©© 
{
™™ 	
if
´´ 
(
´´ 
Model
´´ 
.
´´ 
SelectedSymbol
´´ $
==
´´% '
null
´´( ,
)
´´, -
return
´´. 4
;
´´4 5
string
¨¨ 
?
¨¨ 
symbol
¨¨ 
=
¨¨ 
Model
¨¨ "
.
¨¨" #
SelectedSymbol
¨¨# 1
.
¨¨1 2
Symbol
¨¨2 8
;
¨¨8 9
Settings
ÆÆ 
.
ÆÆ 
BotsSettings
ÆÆ !
.
ÆÆ! "
PACSettings
ÆÆ" -
.
ÆÆ- .
Symbols
ÆÆ. 5
.
ÆÆ5 6
Remove
ÆÆ6 <
(
ÆÆ< =
Model
ÆÆ= B
.
ÆÆB C
SelectedSymbol
ÆÆC Q
.
ÆÆQ R
Symbol
ÆÆR X
)
ÆÆX Y
;
ÆÆY Z
Model
ØØ 
.
ØØ 
SelectedSymbol
ØØ  
.
ØØ  !
Dispose
ØØ! (
(
ØØ( )
)
ØØ) *
;
ØØ* +
Settings
±± 
.
±± 
BotsSettings
±± !
.
±±! "
PACSettings
±±" -
.
±±- .
Symbols
±±. 5
.
±±5 6
Remove
±±6 <
(
±±< =
Model
±±= B
.
±±B C
SelectedSymbol
±±C Q
.
±±Q R
Symbol
±±R X
)
±±X Y
;
±±Y Z
Settings
≤≤ 
.
≤≤ 
SaveSettings
≤≤ !
(
≤≤! "
)
≤≤" #
;
≤≤# $
Model
¥¥ 
.
¥¥ 
Symbols
¥¥ 
.
¥¥ 
Remove
¥¥  
(
¥¥  !
Model
¥¥! &
.
¥¥& '
SelectedSymbol
¥¥' 5
)
¥¥5 6
;
¥¥6 7
if
∑∑ 
(
∑∑ 
Model
∑∑ 
.
∑∑ 
UISymbol
∑∑ 
==
∑∑ !
symbol
∑∑" (
&&
∑∑) +
Model
∑∑, 1
.
∑∑1 2
Symbols
∑∑2 9
.
∑∑9 :
Count
∑∑: ?
>
∑∑@ A
$num
∑∑B C
)
∑∑C D
{
∏∏ 
Model
ππ 
.
ππ 
SelectedSymbol
ππ $
=
ππ% &
Model
ππ' ,
.
ππ, -
Symbols
ππ- 4
[
ππ4 5
$num
ππ5 6
]
ππ6 7
;
ππ7 8
SetUISymbol
∫∫ 
(
∫∫ 
)
∫∫ 
;
∫∫ 
}
ªª 
}
ºº 	
public
ææ 
void
ææ 
	AddSymbol
ææ 
(
ææ 
)
ææ 
{
øø 	
try
¿¿ 
{
¡¡ 
if
¬¬ 
(
¬¬ 
Model
¬¬ 
.
¬¬ 
Symbols
¬¬ !
.
¬¬! "
Any
¬¬" %
(
¬¬% &
x
¬¬& '
=>
¬¬( *
x
¬¬+ ,
.
¬¬, -
Symbol
¬¬- 3
==
¬¬4 6
Model
¬¬7 <
.
¬¬< =
AddSymbolString
¬¬= L
)
¬¬L M
)
¬¬M N
{
√√ 

MessageBox
ƒƒ 
.
ƒƒ 
Show
ƒƒ #
(
ƒƒ# $
$str
ƒƒ$ =
,
ƒƒ= >
$str
ƒƒ? N
,
ƒƒN O
MessageBoxButton
ƒƒP `
.
ƒƒ` a
OK
ƒƒa c
,
ƒƒc d
MessageBoxImage
ƒƒe t
.
ƒƒt u
Informationƒƒu Ä
)ƒƒÄ Å
;ƒƒÅ Ç
return
≈≈ 
;
≈≈ 
}
∆∆ 

_AddSymbol
»» 
(
»» 
Model
»»  
.
»»  !
AddSymbolString
»»! 0
??
»»1 3
$str
»»4 6
)
»»6 7
;
»»7 8

MessageBox
…… 
.
…… 
Show
…… 
(
……  
$str
……  ;
,
……; <
$str
……= M
,
……M N
MessageBoxButton
……O _
.
……_ `
OK
……` b
)
……b c
;
……c d
}
   
catch
ÀÀ 
(
ÀÀ 
	Exception
ÀÀ 
ex
ÀÀ 
)
ÀÀ  
{
ÃÃ 

MessageBox
ÕÕ 
.
ÕÕ 
Show
ÕÕ 
(
ÕÕ  
$"
ÕÕ  "
$str
ÕÕ" ;
{
ÕÕ; <
ex
ÕÕ< >
.
ÕÕ> ?
Message
ÕÕ? F
}
ÕÕF G
"
ÕÕG H
,
ÕÕH I
$str
ÕÕJ P
,
ÕÕP Q
MessageBoxButton
ÕÕR b
.
ÕÕb c
OK
ÕÕc e
,
ÕÕe f
MessageBoxImage
ÕÕg v
.
ÕÕv w
Error
ÕÕw |
)
ÕÕ| }
;
ÕÕ} ~
}
ŒŒ 
}
œœ 	
private
—— 
void
—— 

_AddSymbol
—— 
(
——  
string
——  &
symbol
——' -
)
——- .
{
““ 	
Model
”” 
.
”” 
Symbols
”” 
.
”” 
Add
”” 
(
”” 
new
”” !
PAC
””" %
(
””% &
symbol
””& ,
,
””, -
Binance
””. 5
.
””5 6
Net
””6 9
.
””9 :
Enums
””: ?
.
””? @
KlineInterval
””@ M
.
””M N
	OneMinute
””N W
,
””W X
(
””Y Z
string
””Z `
symbol
””a g
,
””g h

Dictionary
””i s
<
””s t
string
””t z
,
””z {
List””| Ä
<””Ä Å
object””Å á
>””á à
>””à â
values””ä ê
)””ê ë
=>””í î
{””ï ñ
}””ó ò
,””ò ô!
SendSignalMessage””ö ´
)””´ ¨
{””≠ Æ
}””Ø ∞
)””∞ ±
;””± ≤
Settings
‘‘ 
.
‘‘ 
BotsSettings
‘‘ !
.
‘‘! "
PACSettings
‘‘" -
.
‘‘- .
Symbols
‘‘. 5
.
‘‘5 6
Add
‘‘6 9
(
‘‘9 :
symbol
‘‘: @
)
‘‘@ A
;
‘‘A B
Settings
’’ 
.
’’ 
SaveSettings
’’ !
(
’’! "
)
’’" #
;
’’# $
}
÷÷ 	
public
ÿÿ 
Task
ÿÿ 
AddAllSymbols
ÿÿ !
(
ÿÿ! "
)
ÿÿ" #
{
ŸŸ 	
CryptoExchange
⁄⁄ 
.
⁄⁄ 
Net
⁄⁄ 
.
⁄⁄ 
Objects
⁄⁄ &
.
⁄⁄& '
WebCallResult
⁄⁄' 4
<
⁄⁄4 5
Binance
⁄⁄5 <
.
⁄⁄< =
Net
⁄⁄= @
.
⁄⁄@ A
Objects
⁄⁄A H
.
⁄⁄H I
Models
⁄⁄I O
.
⁄⁄O P
Spot
⁄⁄P T
.
⁄⁄T U!
BinanceExchangeInfo
⁄⁄U h
>
⁄⁄h i
?
⁄⁄i j
exchangeInfos
⁄⁄k x
=
⁄⁄y z
StaticBinance⁄⁄{ à
.⁄⁄à â
Client⁄⁄â è
.⁄⁄è ê
SpotApi⁄⁄ê ó
.⁄⁄ó ò
ExchangeData⁄⁄ò §
.⁄⁄§ •$
GetExchangeInfoAsync⁄⁄• π
(⁄⁄π ∫
)⁄⁄∫ ª
.⁄⁄ª º
Result⁄⁄º ¬
;⁄⁄¬ √
Model
€€ 
.
€€ 
Symbols
€€ 
.
€€ 
Clear
€€ 
(
€€  
)
€€  !
;
€€! "
Settings
‹‹ 
.
‹‹ 
BotsSettings
‹‹ !
.
‹‹! "
PACSettings
‹‹" -
.
‹‹- .
Symbols
‹‹. 5
.
‹‹5 6
Clear
‹‹6 ;
(
‹‹; <
)
‹‹< =
;
‹‹= >
exchangeInfos
›› 
.
›› 
Data
›› 
.
›› 
Symbols
›› &
.
››& '
ToList
››' -
(
››- .
)
››. /
.
››/ 0
ForEach
››0 7
(
››7 8
x
››8 9
=>
››: <
{
ﬁﬁ 
try
ﬂﬂ 
{
‡‡ 

_AddSymbol
·· 
(
·· 
x
··  
.
··  !
Name
··! %
)
··% &
;
··& '
}
‚‚ 
catch
„„ 
(
„„ 
	Exception
„„  
ex
„„! #
)
„„# $
{
‰‰ 

MessageBox
ÂÂ 
.
ÂÂ 
Show
ÂÂ #
(
ÂÂ# $
$"
ÂÂ$ &
{
ÂÂ& '
x
ÂÂ' (
.
ÂÂ( )
Name
ÂÂ) -
}
ÂÂ- .
$str
ÂÂ. S
{
ÂÂS T
ex
ÂÂT V
.
ÂÂV W
Message
ÂÂW ^
}
ÂÂ^ _
"
ÂÂ_ `
,
ÂÂ` a
$str
ÂÂb h
,
ÂÂh i
MessageBoxButton
ÂÂj z
.
ÂÂz {
OK
ÂÂ{ }
,
ÂÂ} ~
MessageBoxImageÂÂ é
.ÂÂé è
ErrorÂÂè î
)ÂÂî ï
;ÂÂï ñ
}
ÊÊ 
}
ÁÁ 
)
ÁÁ 
;
ÁÁ 
return
ÈÈ 
Task
ÈÈ 
.
ÈÈ 
Delay
ÈÈ 
(
ÈÈ 
$num
ÈÈ 
)
ÈÈ  
;
ÈÈ  !
}
ÍÍ 	
public
ÓÓ 
void
ÓÓ 
SendSignalMessage
ÓÓ %
(
ÓÓ% &
string
ÓÓ& ,
symbol
ÓÓ- 3
,
ÓÓ3 4

Dictionary
ÓÓ5 ?
<
ÓÓ? @
string
ÓÓ@ F
,
ÓÓF G
List
ÓÓH L
<
ÓÓL M
object
ÓÓM S
>
ÓÓS T
>
ÓÓT U
values
ÓÓV \
,
ÓÓ\ ]
Enums
ÓÓ^ c
.
ÓÓc d

SignalType
ÓÓd n
type
ÓÓo s
)
ÓÓs t
{
ÔÔ 	
string
 
message
 
=
 
type
 !
switch
" (
{
ÒÒ 
Enums
ÚÚ 
.
ÚÚ 

SignalType
ÚÚ  
.
ÚÚ  !
Short
ÚÚ! &
=>
ÚÚ' )
Settings
ÚÚ* 2
.
ÚÚ2 3
BotsSettings
ÚÚ3 ?
.
ÚÚ? @
PACSettings
ÚÚ@ K
.
ÚÚK L
SignalMessages
ÚÚL Z
.
ÚÚZ [
Short
ÚÚ[ `
,
ÚÚ` a
Enums
ÛÛ 
.
ÛÛ 

SignalType
ÛÛ  
.
ÛÛ  !
Long
ÛÛ! %
=>
ÛÛ& (
Settings
ÛÛ) 1
.
ÛÛ1 2
BotsSettings
ÛÛ2 >
.
ÛÛ> ?
PACSettings
ÛÛ? J
.
ÛÛJ K
SignalMessages
ÛÛK Y
.
ÛÛY Z
Long
ÛÛZ ^
,
ÛÛ^ _
Enums
ÙÙ 
.
ÙÙ 

SignalType
ÙÙ  
.
ÙÙ  !
Exit
ÙÙ! %
=>
ÙÙ& (
Settings
ÙÙ) 1
.
ÙÙ1 2
BotsSettings
ÙÙ2 >
.
ÙÙ> ?
PACSettings
ÙÙ? J
.
ÙÙJ K
SignalMessages
ÙÙK Y
.
ÙÙY Z
Exit
ÙÙZ ^
,
ÙÙ^ _
_
ıı 
=>
ıı 
$str
ıı 
,
ıı 
}
ˆˆ 
;
ˆˆ 
if
¯¯ 
(
¯¯ 
string
¯¯ 
.
¯¯ 
IsNullOrEmpty
¯¯ $
(
¯¯$ %
message
¯¯% ,
)
¯¯, -
)
¯¯- .
return
¯¯/ 5
;
¯¯5 6
message
˘˘ 
=
˘˘ 
message
˘˘ 
.
˘˘ 
Replace
˘˘ %
(
˘˘% &
$str
˘˘& 0
,
˘˘0 1
symbol
˘˘2 8
)
˘˘8 9
.
˘˘9 :
Replace
˘˘: A
(
˘˘A B
$str
˘˘B K
,
˘˘K L
Math
˘˘M Q
.
˘˘Q R
Round
˘˘R W
(
˘˘W X
(
˘˘X Y
(
˘˘Y Z
Kline
˘˘Z _
)
˘˘_ `
values
˘˘` f
[
˘˘f g
$str
˘˘g o
]
˘˘o p
.
˘˘p q
Last
˘˘q u
(
˘˘u v
)
˘˘v w
)
˘˘w x
.
˘˘x y
Close
˘˘y ~
,
˘˘~ 
$num˘˘Ä Å
)˘˘Å Ç
.˘˘Ç É
ToString˘˘É ã
(˘˘ã å
)˘˘å ç
)˘˘ç é
;˘˘é è
if
˙˙ 
(
˙˙ 
type
˙˙ 
==
˙˙ 
Enums
˙˙ 
.
˙˙ 

SignalType
˙˙ (
.
˙˙( )
Short
˙˙) .
)
˙˙. /
message
˙˙0 7
=
˙˙8 9
message
˙˙: A
.
˙˙A B
Replace
˙˙B I
(
˙˙I J
$str
˙˙J U
,
˙˙U V
Math
˙˙W [
.
˙˙[ \
Round
˙˙\ a
(
˙˙a b
(
˙˙b c
double
˙˙c i
)
˙˙i j
values
˙˙j p
[
˙˙p q
$str
˙˙q v
]
˙˙v w
.
˙˙w x
Last
˙˙x |
(
˙˙| }
)
˙˙} ~
,
˙˙~ 
$num˙˙Ä Å
)˙˙Å Ç
.˙˙Ç É
ToString˙˙É ã
(˙˙ã å
)˙˙å ç
)˙˙ç é
;˙˙é è
else
˚˚ 
if
˚˚ 
(
˚˚ 
type
˚˚ 
==
˚˚ 
Enums
˚˚ "
.
˚˚" #

SignalType
˚˚# -
.
˚˚- .
Long
˚˚. 2
)
˚˚2 3
message
˚˚4 ;
=
˚˚< =
message
˚˚> E
.
˚˚E F
Replace
˚˚F M
(
˚˚M N
$str
˚˚N Y
,
˚˚Y Z
Math
˚˚[ _
.
˚˚_ `
Round
˚˚` e
(
˚˚e f
(
˚˚f g
double
˚˚g m
)
˚˚m n
values
˚˚n t
[
˚˚t u
$str
˚˚u z
]
˚˚z {
.
˚˚{ |
Last˚˚| Ä
(˚˚Ä Å
)˚˚Å Ç
,˚˚Ç É
$num˚˚Ñ Ö
)˚˚Ö Ü
.˚˚Ü á
ToString˚˚á è
(˚˚è ê
)˚˚ê ë
)˚˚ë í
;˚˚í ì
else
¸¸ 
message
¸¸ 
=
¸¸ 
message
¸¸ "
.
¸¸" #
Replace
¸¸# *
(
¸¸* +
$str
¸¸+ 6
,
¸¸6 7
Math
¸¸8 <
.
¸¸< =
Round
¸¸= B
(
¸¸B C
(
¸¸C D
double
¸¸D J
)
¸¸J K
values
¸¸K Q
[
¸¸Q R
$str
¸¸R W
]
¸¸W X
.
¸¸X Y
Last
¸¸Y ]
(
¸¸] ^
)
¸¸^ _
,
¸¸_ `
$num
¸¸a b
)
¸¸b c
.
¸¸c d
ToString
¸¸d l
(
¸¸l m
)
¸¸m n
+
¸¸o p
$str
¸¸q w
+
¸¸x y
Math
¸¸z ~
.
¸¸~ 
Round¸¸ Ñ
(¸¸Ñ Ö
(¸¸Ö Ü
double¸¸Ü å
)¸¸å ç
values¸¸ç ì
[¸¸ì î
$str¸¸î ô
]¸¸ô ö
.¸¸ö õ
Last¸¸õ ü
(¸¸ü †
)¸¸† °
,¸¸° ¢
$num¸¸£ §
)¸¸§ •
.¸¸• ¶
ToString¸¸¶ Æ
(¸¸Æ Ø
)¸¸Ø ∞
)¸¸∞ ±
;¸¸± ≤
foreach
˛˛ 
(
˛˛ 
User
˛˛ 
user
˛˛ 
in
˛˛ !
Model
˛˛" '
.
˛˛' (
Users
˛˛( -
)
˛˛- .
{
ˇˇ 
try
ÄÄ 
{
ÅÅ 
if
ÇÇ 
(
ÇÇ 
user
ÇÇ 
.
ÇÇ 
ChatId
ÇÇ #
==
ÇÇ$ &
$num
ÇÇ' (
||
ÇÇ) +
!
ÇÇ, -
user
ÇÇ- 1
.
ÇÇ1 2

PACSymbols
ÇÇ2 <
.
ÇÇ< =
Any
ÇÇ= @
(
ÇÇ@ A
x
ÇÇA B
=>
ÇÇC E
x
ÇÇF G
.
ÇÇG H
Key
ÇÇH K
.
ÇÇK L
Equals
ÇÇL R
(
ÇÇR S
symbol
ÇÇS Y
)
ÇÇY Z
&&
ÇÇ[ ]
x
ÇÇ^ _
.
ÇÇ_ `
Value
ÇÇ` e
>
ÇÇf g
DateTime
ÇÇh p
.
ÇÇp q
Now
ÇÇq t
)
ÇÇt u
)
ÇÇu v
continue
ÇÇw 
;ÇÇ Ä

BotClients
ÉÉ 
.
ÉÉ 
	PACClient
ÉÉ (
.
ÉÉ( )"
SendTextMessageAsync
ÉÉ) =
(
ÉÉ= >
user
ÉÉ> B
.
ÉÉB C
ChatId
ÉÉC I
,
ÉÉI J
message
ÉÉK R
)
ÉÉR S
;
ÉÉS T
}
ÑÑ 
catch
ÖÖ 
(
ÖÖ 
	Exception
ÖÖ  
ex
ÖÖ! #
)
ÖÖ# $
{
ÜÜ 
Console
áá 
.
áá 
	WriteLine
áá %
(
áá% &
$"
áá& (
$str
áá( 9
{
áá9 :
user
áá: >
.
áá> ?
Username
áá? G
}
ááG H
$str
ááH c
{
áác d
ex
áád f
.
ááf g
Message
áág n
}
áán o
"
ááo p
)
ááp q
;
ááq r
}
àà 
}
ää 
foreach
åå 
(
åå 
string
åå 
?
åå 
group
åå "
in
åå# %
Settings
åå& .
.
åå. /
TelegramSettings
åå/ ?
.
åå? @
	PACGroups
åå@ I
)
ååI J
{
çç 
try
éé 
{
èè 

BotClients
êê 
.
êê 
	PACClient
êê (
.
êê( )"
SendTextMessageAsync
êê) =
(
êê= >
group
êê> C
,
êêC D
message
êêE L
)
êêL M
;
êêM N
}
ëë 
catch
íí 
(
íí 
	Exception
íí  
ex
íí! #
)
íí# $
{
ìì 
Console
îî 
.
îî 
	WriteLine
îî %
(
îî% &
$"
îî& (
$str
îî( 8
{
îî8 9
group
îî9 >
}
îî> ?
$str
îî? Z
{
îîZ [
ex
îî[ ]
.
îî] ^
Message
îî^ e
}
îîe f
"
îîf g
)
îîg h
;
îîh i
}
ïï 
}
ññ 
}
óó 	
public
õõ 
void
õõ 
SaveSettings
õõ  
(
õõ  !
)
õõ! "
{
úú 	
Settings
ùù 
.
ùù 
BotsSettings
ùù !
.
ùù! "
PACSettings
ùù" -
.
ùù- .
SignalMessages
ùù. <
.
ùù< =
Short
ùù= B
=
ùùC D
Model
ùùE J
.
ùùJ K
SellSignalString
ùùK [
;
ùù[ \
Settings
ûû 
.
ûû 
BotsSettings
ûû !
.
ûû! "
PACSettings
ûû" -
.
ûû- .
SignalMessages
ûû. <
.
ûû< =
Long
ûû= A
=
ûûB C
Model
ûûD I
.
ûûI J
BuySignalString
ûûJ Y
;
ûûY Z
Settings
üü 
.
üü 
BotsSettings
üü !
.
üü! "
PACSettings
üü" -
.
üü- .
SignalMessages
üü. <
.
üü< =
Exit
üü= A
=
üüB C
Model
üüD I
.
üüI J
ExitSignalString
üüJ Z
;
üüZ [
Settings
°° 
.
°° 
BotsSettings
°° !
.
°°! "
PACSettings
°°" -
.
°°- .

SMMAPeriot
°°. 8
=
°°9 :
Model
°°; @
.
°°@ A

SMMAPeriot
°°A K
;
°°K L
Settings
££ 
.
££ 
BotsSettings
££ !
.
££! "
PACSettings
££" -
.
££- .
MinSignalPeriot
££. =
=
££> ?
Model
££@ E
.
££E F
MinSignalPeriot
££F U
;
££U V
Settings
§§ 
.
§§ 
BotsSettings
§§ !
.
§§! "
PACSettings
§§" -
.
§§- .
KlineInterval
§§. ;
=
§§< =
Enum
§§> B
.
§§B C
GetName
§§C J
(
§§J K
typeof
§§K Q
(
§§Q R
KlineInterval
§§R _
)
§§_ `
,
§§` a
Model
§§b g
.
§§g h
KlineInterval
§§h u
)
§§u v
;
§§v w
Settings
•• 
.
•• 
SaveSettings
•• !
(
••! "
)
••" #
;
••# $

MessageBox
ßß 
.
ßß 
Show
ßß 
(
ßß 
$str
ßß ;
,
ßß; <
$str
ßß= Q
,
ßßQ R
MessageBoxButton
ßßS c
.
ßßc d
OK
ßßd f
)
ßßf g
;
ßßg h
}
®® 	
public
™™ 
void
™™ 
LoadSettings
™™  
(
™™  !
)
™™! "
{
´´ 	
Model
¨¨ 
.
¨¨ 
SellSignalString
¨¨ "
=
¨¨# $
Settings
¨¨% -
.
¨¨- .
BotsSettings
¨¨. :
.
¨¨: ;
PACSettings
¨¨; F
.
¨¨F G
SignalMessages
¨¨G U
.
¨¨U V
Short
¨¨V [
;
¨¨[ \
Model
≠≠ 
.
≠≠ 
BuySignalString
≠≠ !
=
≠≠" #
Settings
≠≠$ ,
.
≠≠, -
BotsSettings
≠≠- 9
.
≠≠9 :
PACSettings
≠≠: E
.
≠≠E F
SignalMessages
≠≠F T
.
≠≠T U
Long
≠≠U Y
;
≠≠Y Z
Model
ÆÆ 
.
ÆÆ 
ExitSignalString
ÆÆ "
=
ÆÆ# $
Settings
ÆÆ% -
.
ÆÆ- .
BotsSettings
ÆÆ. :
.
ÆÆ: ;
PACSettings
ÆÆ; F
.
ÆÆF G
SignalMessages
ÆÆG U
.
ÆÆU V
Exit
ÆÆV Z
;
ÆÆZ [
Model
∞∞ 
.
∞∞ 

SMMAPeriot
∞∞ 
=
∞∞ 
Settings
∞∞ '
.
∞∞' (
BotsSettings
∞∞( 4
.
∞∞4 5
PACSettings
∞∞5 @
.
∞∞@ A

SMMAPeriot
∞∞A K
;
∞∞K L
Model
≤≤ 
.
≤≤ 
MinSignalPeriot
≤≤ !
=
≤≤" #
Settings
≤≤$ ,
.
≤≤, -
BotsSettings
≤≤- 9
.
≤≤9 :
PACSettings
≤≤: E
.
≤≤E F
MinSignalPeriot
≤≤F U
;
≤≤U V
}
≥≥ 	
public
µµ 
void
µµ !
ChangeKlineInterval
µµ '
(
µµ' (
)
µµ( )
{
∂∂ 	
MessageBoxResult
∑∑ 
change
∑∑ #
=
∑∑$ %

MessageBox
∑∑& 0
.
∑∑0 1
Show
∑∑1 5
(
∑∑5 6
$str∑∑6 €
,∑∑€ ‹
$str∑∑› Ú
,∑∑Ú Û 
MessageBoxButton∑∑Ù Ñ
.∑∑Ñ Ö
YesNo∑∑Ö ä
,∑∑ä ã
MessageBoxImage∑∑å õ
.∑∑õ ú
Warning∑∑ú £
)∑∑£ §
;∑∑§ •
if
∏∏ 
(
∏∏ 
change
∏∏ 
==
∏∏ 
MessageBoxResult
∏∏ *
.
∏∏* +
No
∏∏+ -
)
∏∏- .
{
ππ 
Model
∫∫ 
.
∫∫ 
KlineInterval
∫∫ #
=
∫∫$ %
Model
∫∫& +
.
∫∫+ ,
KlineIntervals
∫∫, :
.
∫∫: ;
First
∫∫; @
(
∫∫@ A
x
∫∫A B
=>
∫∫C E
x
∫∫F G
.
∫∫G H
Equals
∫∫H N
(
∫∫N O
Model
∫∫O T
.
∫∫T U
Symbols
∫∫U \
.
∫∫\ ]
First
∫∫] b
(
∫∫b c
)
∫∫c d
.
∫∫d e
Interval
∫∫e m
)
∫∫m n
)
∫∫n o
;
∫∫o p
return
ªª 
;
ªª 
}
ºº 
Model
ææ 
.
ææ 
Symbols
ææ 
.
ææ 
ToList
ææ  
(
ææ  !
)
ææ! "
.
ææ" #
ForEach
ææ# *
(
ææ* +
x
ææ+ ,
=>
ææ- /
x
ææ0 1
.
ææ1 2
ChangeInterval
ææ2 @
(
ææ@ A
Model
ææA F
.
ææF G
KlineInterval
ææG T
)
ææT U
)
ææU V
;
ææV W
SaveSettings
¿¿ 
(
¿¿ 
)
¿¿ 
;
¿¿ 
}
¡¡ 	
}
√√ 
}ƒƒ ˆÉ
vC:\Users\√ñmer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\UI\ViewModels\RSIViewModel.cs
	namespace 	!
EASYTelegramSignalBot
 
.  

ViewModels  *
{ 
internal 
class 
RSIViewModel 
:  !
UserControl" -
{ 
public 
ICommand 
AddUserCommand &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
public 
ICommand 
DelUserCommand &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
public 
ICommand 
SetUISymbolCommand *
{+ ,
get- 0
;0 1
set2 5
;5 6
}7 8
public 
ICommand 
AddSymbolCommand (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
public 
ICommand  
AddAllSymbolsCommand ,
{- .
get/ 2
;2 3
set4 7
;7 8
}9 :
public 
ICommand 
DelSymbolCommand (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
public   
ICommand    
AddUserSymbolCommand   ,
{  - .
get  / 2
;  2 3
set  4 7
;  7 8
}  9 :
public!! 
ICommand!!  
DelUserSymbolCommand!! ,
{!!- .
get!!/ 2
;!!2 3
set!!4 7
;!!7 8
}!!9 :
public"" 
ICommand"" 
AddGroupCommand"" '
{""( )
get""* -
;""- .
set""/ 2
;""2 3
}""4 5
public## 
ICommand## 
DelGroupCommand## '
{##( )
get##* -
;##- .
set##/ 2
;##2 3
}##4 5
public$$ 
ICommand$$ 
SaveSettingsCommand$$ +
{$$, -
get$$. 1
;$$1 2
set$$3 6
;$$6 7
}$$8 9
public&& 
RSIModel&& 
Model&& 
{&& 
get&&  #
;&&# $
set&&% (
;&&( )
}&&* +
public(( 
RSIViewModel(( 
((( 
)(( 
{)) 	
Model** 
=** 
new** 
(** 
)** 
;** 
AddUserCommand,, 
=,, 
new,,  
DelegateCommand,,! 0
(,,0 1
(,,1 2
o,,2 3
),,3 4
=>,,5 7
AddUser,,8 ?
(,,? @
),,@ A
),,A B
;,,B C
DelUserCommand-- 
=-- 
new--  
DelegateCommand--! 0
(--0 1
(--1 2
o--2 3
)--3 4
=>--5 7
DelUser--8 ?
(--? @
)--@ A
)--A B
;--B C
SetUISymbolCommand.. 
=..  
new..! $
DelegateCommand..% 4
(..4 5
(..5 6
o..6 7
)..7 8
=>..9 ;
SetUISymbol..< G
(..G H
)..H I
)..I J
;..J K
AddSymbolCommand// 
=// 
new// "
DelegateCommand//# 2
(//2 3
(//3 4
o//4 5
)//5 6
=>//7 9
	AddSymbol//: C
(//C D
)//D E
)//E F
;//F G 
AddAllSymbolsCommand00  
=00! "
new00# &
DelegateCommand00' 6
(006 7
(007 8
o008 9
)009 :
=>00; =
AddAllSymbols00> K
(00K L
)00L M
)00M N
;00N O
DelSymbolCommand11 
=11 
new11 "
DelegateCommand11# 2
(112 3
(113 4
o114 5
)115 6
=>117 9
	DelSymbol11: C
(11C D
)11D E
)11E F
;11F G
AddGroupCommand22 
=22 
new22 !
DelegateCommand22" 1
(221 2
(222 3
o223 4
)224 5
=>226 8
AddGroup229 A
(22A B
)22B C
)22C D
;22D E
DelGroupCommand33 
=33 
new33 !
DelegateCommand33" 1
(331 2
(332 3
o333 4
)334 5
=>336 8
DelGroup339 A
(33A B
)33B C
)33C D
;33D E
SaveSettingsCommand44 
=44  !
new44" %
DelegateCommand44& 5
(445 6
(446 7
o447 8
)448 9
=>44: <
SaveSettings44= I
(44I J
)44J K
)44K L
;44L M
LoadSettings66 
(66 
)66 
;66 
SetSubscriptions88 
(88 
)88 
;88 
}99 	
private;; 
void;; 
SetSubscriptions;; %
(;;% &
);;& '
{<< 	
foreach== 
(== 
string== 
?== 
symbol== #
in==$ &
Settings==' /
.==/ 0
BotsSettings==0 <
.==< =
RSISettings=== H
.==H I
Symbols==I P
.==P Q
ToList==Q W
(==W X
)==X Y
)==Y Z
{>> 
try?? 
{@@ 
ModelAA 
.AA 
SymbolsAA !
.AA! "
AddAA" %
(AA% &
newAA& )
RSIAA* -
(AA- .
symbolAA. 4
,AA4 5
ModelAA6 ;
.AA; <
KlineIntervalAA< I
,AAI J
(AAK L
stringAAL R
symbolAAS Y
,AAY Z

DictionaryAA[ e
<AAe f
stringAAf l
,AAl m
ListAAn r
<AAr s
objectAAs y
>AAy z
>AAz {
values	AA| Ç
)
AAÇ É
=>
AAÑ Ü
{
AAá à
}
AAâ ä
,
AAä ã
SendSignalMessage
AAå ù
,
AAù û
true
AAü £
)
AA£ §
{
AA• ¶
}
AAß ®
)
AA® ©
;
AA© ™
}BB 
catchCC 
(CC 
	ExceptionCC  
exCC! #
)CC# $
{DD 
MessageBoxResultEE $
deleteSymbolEE% 1
=EE2 3

MessageBoxEE4 >
.EE> ?
ShowEE? C
(EEC D
$"EED F
{EEF G
symbolEEG M
}EEM N
$strEEN s
{EEs t
exEEt v
.EEv w
MessageEEw ~
}EE~ 
$str	EE ï
"
EEï ñ
,
EEñ ó
$str
EEò û
,
EEû ü
MessageBoxButton
EE† ∞
.
EE∞ ±
YesNo
EE± ∂
,
EE∂ ∑
MessageBoxImage
EE∏ «
.
EE« »
Error
EE» Õ
)
EEÕ Œ
;
EEŒ œ
ifFF 
(FF 
deleteSymbolFF $
==FF% '
MessageBoxResultFF( 8
.FF8 9
YesFF9 <
)FF< =
{GG 
SettingsHH  
.HH  !
BotsSettingsHH! -
.HH- .
RSISettingsHH. 9
.HH9 :
SymbolsHH: A
.HHA B
RemoveHHB H
(HHH I
symbolHHI O
)HHO P
;HHP Q
SettingsII  
.II  !
SaveSettingsII! -
(II- .
)II. /
;II/ 0
}JJ 
}KK 
}LL 
UILoaderMM 
.MM 
InstanceMM 
.MM 
SetPageReadyMM *
(MM* +
$strMM+ 0
,MM0 1
(MM2 3
)MM3 4
=>MM5 7
ContinueMM8 @
(MM@ A
)MMA B
)MMB C
;MMC D
}NN 	
privatePP 
TaskPP 
ContinuePP 
(PP 
)PP 
{QQ 	
foreachRR 
(RR 
	IndicatorRR 
?RR 
symbolRR  &
inRR' )
ModelRR* /
.RR/ 0
SymbolsRR0 7
)RR7 8
symbolRR9 ?
.RR? @
ContinueRR@ H
(RRH I
)RRI J
;RRJ K
returnSS 
TaskSS 
.SS 
CompletedTaskSS %
;SS% &
}TT 	
publicWW 
voidWW 
UpdateUIWW 
(WW 
stringWW #
symbolWW$ *
,WW* +

DictionaryWW, 6
<WW6 7
stringWW7 =
,WW= >
ListWW? C
<WWC D
objectWWD J
>WWJ K
>WWK L
ValuesWWM S
)WWS T
{XX 	
ifYY 
(YY 
symbolYY 
!=YY 
ModelYY 
.YY  
UISymbolYY  (
)YY( )
returnYY* 0
;YY0 1
List[[ 
<[[ 
Kline[[ 
>[[ 
?[[ 
Klines[[ 
=[[  !
Values[[" (
[[[( )
$str[[) 1
][[1 2
.[[2 3
Select[[3 9
([[9 :
x[[: ;
=>[[< >
([[? @
Kline[[@ E
)[[E F
x[[F G
)[[G H
.[[H I
ToList[[I O
([[O P
)[[P Q
;[[Q R
UpdateKlines\\ 
(\\ 
Klines\\ 
)\\  
;\\  !
List^^ 
<^^ 
object^^ 
>^^ 
?^^ 
RSI^^ 
=^^ 
Values^^  &
[^^& '
$str^^' ,
]^^, -
.^^- .
ToList^^. 4
(^^4 5
)^^5 6
;^^6 7
UpdateIndicators__ 
(__ 
Klines__ #
,__# $
RSI__% (
)__( )
;__) *
}`` 	
publicbb 
voidbb 
SetUISymbolbb 
(bb  
)bb  !
{cc 	
ifdd 
(dd 
Modeldd 
.dd 
SelectedSymboldd $
==dd% '
nulldd( ,
)dd, -
returndd. 4
;dd4 5
ifee 
(ee 
Modelee 
.ee 
SelectedSymbolee $
.ee$ %
Symbolee% +
==ee, .
Modelee/ 4
.ee4 5
UISymbolee5 =
)ee= >
returnee? E
;eeE F
ifff 
(ff 
Modelff 
.ff 
Symbolsff 
.ff 
Countff #
<ff$ %
$numff& '
)ff' (
returnff) /
;ff/ 0
ifhh 
(hh 
Modelhh 
.hh 
Symbolshh 
.hh 
Anyhh !
(hh! "
xhh" #
=>hh$ &
xhh' (
.hh( )
Symbolhh) /
==hh0 2
Modelhh3 8
.hh8 9
UISymbolhh9 A
)hhA B
)hhB C
{ii 
Modeljj 
.jj 
Symbolsjj 
.jj 
Firstjj #
(jj# $
xjj$ %
=>jj& (
xjj) *
.jj* +
Symboljj+ 1
==jj2 4
Modeljj5 :
.jj: ;
UISymboljj; C
)jjC D
.jjD E
UpdateActionjjE Q
=jjR S
(jjT U
stringjjU [
symboljj\ b
,jjb c

Dictionaryjjd n
<jjn o
stringjjo u
,jju v
Listjjw {
<jj{ |
object	jj| Ç
>
jjÇ É
>
jjÉ Ñ
values
jjÖ ã
)
jjã å
=>
jjç è
{
jjê ë
}
jjí ì
;
jjì î
}kk 
Modelll 
.ll !
KlineSeriesCollectionll '
.ll' (
ToListll( .
(ll. /
)ll/ 0
.ll0 1
ForEachll1 8
(ll8 9
xll9 :
=>ll; =
xll> ?
.ll? @
Valuesll@ F
.llF G
ClearllG L
(llL M
)llM N
)llN O
;llO P
Modelmm 
.mm &
IndicatorsSeriesCollectionmm ,
.mm, -
ToListmm- 3
(mm3 4
)mm4 5
.mm5 6
ForEachmm6 =
(mm= >
xmm> ?
=>mm@ B
xmmC D
.mmD E
ValuesmmE K
.mmK L
ClearmmL Q
(mmQ R
)mmR S
)mmS T
;mmT U
Modelnn 
.nn 
UISymbolnn 
=nn 
Modelnn "
.nn" #
SelectedSymbolnn# 1
.nn1 2
Symbolnn2 8
;nn8 9
Modeloo 
.oo 
Symbolsoo 
.oo 
Firstoo 
(oo  
xoo  !
=>oo" $
xoo% &
.oo& '
Symboloo' -
==oo. 0
Modeloo1 6
.oo6 7
UISymboloo7 ?
)oo? @
.oo@ A
UpdateActionooA M
=ooN O
UpdateUIooP X
;ooX Y
Modelpp 
.pp 
KlineSeriespp 
.pp 
Titlepp #
=pp$ %
Modelpp& +
.pp+ ,
UISymbolpp, 4
;pp4 5
}qq 	
publicss 
voidss 
UpdateKlinesss  
(ss  !
IEnumerabless! ,
<ss, -
Kliness- 2
>ss2 3
Klinesss4 :
)ss: ;
{tt 	
ifuu 
(uu 
Modeluu 
.uu 
KlineSeriesuu !
.uu! "
Valuesuu" (
.uu( )
Countuu) .
==uu/ 1
$numuu2 3
)uu3 4
{vv 
Modelww 
.ww 
Labelsww 
=ww 
Klinesww %
.ww% &
Selectww& ,
(ww, -
xww- .
=>ww/ 1
xww2 3
.ww3 4
	_OpenDateww4 =
.ww= >
ToStringww> F
(wwF G
$strwwG M
)wwM N
)wwN O
.wwO P
ToListwwP V
(wwV W
)wwW X
;wwX Y
Modelxx 
.xx 
KlineSeriesxx !
.xx! "
Valuesxx" (
.xx( )
AddRangexx) 1
(xx1 2
Klinesxx2 8
.xx8 9
Selectxx9 ?
(xx? @
xxx@ A
=>xxB D
newxxE H
	OhlcPointxxI R
(xxR S
(xxS T
doublexxT Z
)xxZ [
xxx[ \
.xx\ ]
_Openxx] b
,xxb c
(xxd e
doublexxe k
)xxk l
xxxl m
.xxm n
_Highxxn s
,xxs t
(xxu v
doublexxv |
)xx| }
xxx} ~
.xx~ 
_Low	xx É
,
xxÉ Ñ
(
xxÖ Ü
double
xxÜ å
)
xxå ç
x
xxç é
.
xxé è
_Close
xxè ï
)
xxï ñ
)
xxñ ó
.
xxó ò
ToList
xxò û
(
xxû ü
)
xxü †
)
xx† °
;
xx° ¢
returnyy 
;yy 
}zz 
if|| 
(|| 
Model|| 
.|| 
Labels|| 
.|| 
Last|| !
(||! "
)||" #
==||$ &
Klines||' -
.||- .
Last||. 2
(||2 3
)||3 4
.||4 5
	_OpenDate||5 >
.||> ?
ToString||? G
(||G H
$str||H N
)||N O
)||O P
{}} 
Kline~~ 
?~~ 
	LastKline~~  
=~~! "
Klines~~# )
.~~) *
Last~~* .
(~~. /
)~~/ 0
;~~0 1
	OhlcPoint 
? 
LastChartKline )
=* +
(, -
	OhlcPoint- 6
?6 7
)7 8
Model8 =
.= >!
KlineSeriesCollection> S
[S T
$numT U
]U V
.V W
ValuesW ]
[] ^
^^ _
$num_ `
]` a
;a b
if
ÅÅ 
(
ÅÅ 
LastChartKline
ÅÅ "
==
ÅÅ# %
null
ÅÅ& *
)
ÅÅ* +
return
ÅÅ, 2
;
ÅÅ2 3
LastChartKline
ÇÇ 
.
ÇÇ 
Close
ÇÇ $
=
ÇÇ% &
(
ÇÇ' (
double
ÇÇ( .
)
ÇÇ. /
	LastKline
ÇÇ/ 8
.
ÇÇ8 9
_Close
ÇÇ9 ?
;
ÇÇ? @
if
ÉÉ 
(
ÉÉ 
LastChartKline
ÉÉ "
.
ÉÉ" #
High
ÉÉ# '
<
ÉÉ( )
(
ÉÉ* +
double
ÉÉ+ 1
)
ÉÉ1 2
	LastKline
ÉÉ2 ;
.
ÉÉ; <
_High
ÉÉ< A
)
ÉÉA B
LastChartKline
ÉÉC Q
.
ÉÉQ R
High
ÉÉR V
=
ÉÉW X
(
ÉÉY Z
double
ÉÉZ `
)
ÉÉ` a
	LastKline
ÉÉa j
.
ÉÉj k
_High
ÉÉk p
;
ÉÉp q
if
ÑÑ 
(
ÑÑ 
LastChartKline
ÑÑ "
.
ÑÑ" #
Low
ÑÑ# &
<
ÑÑ' (
(
ÑÑ) *
double
ÑÑ* 0
)
ÑÑ0 1
	LastKline
ÑÑ1 :
.
ÑÑ: ;
_Low
ÑÑ; ?
)
ÑÑ? @
LastChartKline
ÑÑA O
.
ÑÑO P
Low
ÑÑP S
=
ÑÑT U
(
ÑÑV W
double
ÑÑW ]
)
ÑÑ] ^
	LastKline
ÑÑ^ g
.
ÑÑg h
_Low
ÑÑh l
;
ÑÑl m
return
ÖÖ 
;
ÖÖ 
}
ÜÜ 
Model
àà 
.
àà 
Labels
àà 
.
àà 
RemoveAt
àà !
(
àà! "
$num
àà" #
)
àà# $
;
àà$ %
Model
ââ 
.
ââ #
KlineSeriesCollection
ââ '
[
ââ' (
$num
ââ( )
]
ââ) *
.
ââ* +
Values
ââ+ 1
.
ââ1 2
RemoveAt
ââ2 :
(
ââ: ;
$num
ââ; <
)
ââ< =
;
ââ= >
Model
ãã 
.
ãã 
Labels
ãã 
.
ãã 
Add
ãã 
(
ãã 
Klines
ãã #
.
ãã# $
Last
ãã$ (
(
ãã( )
)
ãã) *
.
ãã* +
	_OpenDate
ãã+ 4
.
ãã4 5
ToString
ãã5 =
(
ãã= >
$str
ãã> D
)
ããD E
)
ããE F
;
ããF G
Model
åå 
.
åå #
KlineSeriesCollection
åå '
[
åå' (
$num
åå( )
]
åå) *
.
åå* +
Values
åå+ 1
.
åå1 2
Add
åå2 5
(
åå5 6
new
åå6 9
	OhlcPoint
åå: C
(
ååC D
(
ååD E
double
ååE K
)
ååK L
Klines
ååL R
.
ååR S
Last
ååS W
(
ååW X
)
ååX Y
.
ååY Z
_Open
ååZ _
,
åå_ `
(
ååa b
double
ååb h
)
ååh i
Klines
ååi o
.
ååo p
Last
ååp t
(
ååt u
)
ååu v
.
ååv w
_High
ååw |
,
åå| }
(
åå~ 
doubleåå Ö
)ååÖ Ü
KlinesååÜ å
.ååå ç
Lastååç ë
(ååë í
)ååí ì
.ååì î
_Lowååî ò
,ååò ô
(ååö õ
doubleååõ °
)åå° ¢
Klinesåå¢ ®
.åå® ©
Laståå© ≠
(åå≠ Æ
)ååÆ Ø
.ååØ ∞
_Closeåå∞ ∂
)åå∂ ∑
)åå∑ ∏
;åå∏ π
}
çç 	
public
èè 
void
èè 
UpdateIndicators
èè $
(
èè$ %
IEnumerable
èè% 0
<
èè0 1
Kline
èè1 6
>
èè6 7
Klines
èè8 >
,
èè> ?
IEnumerable
èè@ K
<
èèK L
object
èèL R
>
èèR S
RSI
èèT W
)
èèW X
{
êê 	
UpdateIndicator
ëë 
(
ëë 
Klines
ëë "
,
ëë" #
Model
ëë$ )
.
ëë) *
RSI
ëë* -
.
ëë- .
Values
ëë. 4
,
ëë4 5
RSI
ëë6 9
)
ëë9 :
;
ëë: ;
}
íí 	
private
îî 
void
îî 
UpdateIndicator
îî $
(
îî$ %
IEnumerable
îî% 0
<
îî0 1
Kline
îî1 6
>
îî6 7
Klines
îî8 >
,
îî> ?
IChartValues
îî@ L
values
îîM S
,
îîS T
IEnumerable
îîU `
<
îî` a
object
îîa g
>
îîg h
	newValues
îîi r
)
îîr s
{
ïï 	
if
ññ 
(
ññ 
values
ññ 
.
ññ 
Count
ññ 
==
ññ 
$num
ññ  !
)
ññ! "
{
óó 
values
òò 
.
òò 
AddRange
òò 
(
òò  
	newValues
òò  )
.
òò) *
Select
òò* 0
(
òò0 1
x
òò1 2
=>
òò3 5
(
òò6 7
object
òò7 =
)
òò= >
Convert
òò> E
.
òòE F
ToDouble
òòF N
(
òòN O
x
òòO P
)
òòP Q
)
òòQ R
)
òòR S
;
òòS T
return
ôô 
;
ôô 
}
öö 
if
úú 
(
úú 
Model
úú 
.
úú 
Labels
úú 
.
úú 
Last
úú !
(
úú! "
)
úú" #
==
úú$ &
Klines
úú' -
.
úú- .
Last
úú. 2
(
úú2 3
)
úú3 4
.
úú4 5
	_OpenDate
úú5 >
.
úú> ?
ToString
úú? G
(
úúG H
$str
úúH N
)
úúN O
)
úúO P
{
ùù 
values
ûû 
[
ûû 
^
ûû 
$num
ûû 
]
ûû 
=
ûû 
	newValues
ûû &
.
ûû& '
Last
ûû' +
(
ûû+ ,
)
ûû, -
;
ûû- .
return
üü 
;
üü 
}
†† 
values
¢¢ 
.
¢¢ 
Add
¢¢ 
(
¢¢ 
	newValues
¢¢  
.
¢¢  !
Last
¢¢! %
(
¢¢% &
)
¢¢& '
)
¢¢' (
;
¢¢( )
}
££ 	
public
ßß 
void
ßß -
UserSymbolsListSelectionChanged
ßß 3
(
ßß3 4
)
ßß4 5
{
®® 	
Model
©© 
.
©© !
AddUserSymbolString
©© %
=
©©& '
Model
©©( -
.
©©- . 
SelectedUserSymbol
©©. @
?
©©@ A
.
©©A B
Key
©©B E
;
©©E F
}
™™ 	
public
¨¨ 
void
¨¨ 
AddUser
¨¨ 
(
¨¨ 
)
¨¨ 
{
≠≠ 	
try
ÆÆ 
{
ØØ 
if
∞∞ 
(
∞∞ 
!
∞∞ 

Connection
∞∞ 
.
∞∞  
Context
∞∞  '
.
∞∞' (
Users
∞∞( -
.
∞∞- .
Any
∞∞. 1
(
∞∞1 2
x
∞∞2 3
=>
∞∞4 6
x
∞∞7 8
.
∞∞8 9
Username
∞∞9 A
==
∞∞B D
Model
∞∞E J
.
∞∞J K
AddUserString
∞∞K X
)
∞∞X Y
)
∞∞Y Z
{
±± 
User
≤≤ 
?
≤≤ 
user
≤≤ 
=
≤≤  
new
≤≤! $
User
≤≤% )
(
≤≤) *
Model
≤≤* /
.
≤≤/ 0
AddUserString
≤≤0 =
??
≤≤> @
$str
≤≤A C
)
≤≤C D
{
≤≤E F
}
≤≤G H
;
≤≤H I

Connection
≥≥ 
.
≥≥ 
Context
≥≥ &
.
≥≥& '

CreateUser
≥≥' 1
(
≥≥1 2
user
≥≥2 6
)
≥≥6 7
;
≥≥7 8
Model
¥¥ 
.
¥¥ 
SelectedUser
¥¥ &
=
¥¥' (
user
¥¥) -
;
¥¥- .

MessageBox
µµ 
.
µµ 
Show
µµ #
(
µµ# $
$str
µµ$ B
,
µµB C
$str
µµD W
,
µµW X
MessageBoxButton
µµY i
.
µµi j
OK
µµj l
)
µµl m
;
µµm n
}
∂∂ 
else
∑∑ 
{
∏∏ 
User
ππ 
user
ππ 
=
ππ 

Connection
ππ  *
.
ππ* +
Context
ππ+ 2
.
ππ2 3
Users
ππ3 8
.
ππ8 9
First
ππ9 >
(
ππ> ?
x
ππ? @
=>
ππA C
x
ππD E
.
ππE F
Username
ππF N
==
ππO Q
Model
ππR W
.
ππW X
AddUserString
ππX e
)
ππe f
;
ππf g
Model
∫∫ 
.
∫∫ 
SelectedUser
∫∫ &
=
∫∫' (
user
∫∫) -
;
∫∫- .
}
ªª 
}
ºº 
catch
ΩΩ 
(
ΩΩ 
	Exception
ΩΩ 
ex
ΩΩ 
)
ΩΩ  
{
ææ 

MessageBox
øø 
.
øø 
Show
øø 
(
øø  
$"
øø  "
$str
øø" ;
{
øø; <
ex
øø< >
.
øø> ?
Message
øø? F
}
øøF G
"
øøG H
,
øøH I
$str
øøJ P
,
øøP Q
MessageBoxButton
øøR b
.
øøb c
OK
øøc e
,
øøe f
MessageBoxImage
øøg v
.
øøv w
Error
øøw |
)
øø| }
;
øø} ~
}
¿¿ 
}
¡¡ 	
public
√√ 
void
√√ 
DelUser
√√ 
(
√√ 
)
√√ 
{
ƒƒ 	
try
≈≈ 
{
∆∆ 
if
«« 
(
«« 
Model
«« 
.
«« 
SelectedUser
«« &
==
««' )
null
««* .
)
««. /
return
««0 6
;
««6 7

Connection
»» 
.
»» 
Context
»» "
.
»»" #

DeleteUser
»»# -
(
»»- .
Model
»». 3
.
»»3 4
SelectedUser
»»4 @
)
»»@ A
;
»»A B

Connection
…… 
.
…… 
Context
…… "
.
……" #
SaveChanges
……# .
(
……. /
)
……/ 0
;
……0 1

MessageBox
ÀÀ 
.
ÀÀ 
Show
ÀÀ 
(
ÀÀ  
$str
ÀÀ  >
,
ÀÀ> ?
$str
ÀÀ@ S
,
ÀÀS T
MessageBoxButton
ÀÀU e
.
ÀÀe f
OK
ÀÀf h
)
ÀÀh i
;
ÀÀi j
}
ÃÃ 
catch
ÕÕ 
(
ÕÕ 
	Exception
ÕÕ 
ex
ÕÕ 
)
ÕÕ  
{
ŒŒ 

MessageBox
œœ 
.
œœ 
Show
œœ 
(
œœ  
$"
œœ  "
$str
œœ" ;
{
œœ; <
ex
œœ< >
.
œœ> ?
Message
œœ? F
}
œœF G
"
œœG H
,
œœH I
$str
œœJ P
,
œœP Q
MessageBoxButton
œœR b
.
œœb c
OK
œœc e
,
œœe f
MessageBoxImage
œœg v
.
œœv w
Error
œœw |
)
œœ| }
;
œœ} ~
}
–– 
}
—— 	
public
”” 
void
”” 
AddGroup
”” 
(
”” 
)
”” 
{
‘‘ 	
if
’’ 
(
’’ 
string
’’ 
.
’’ 
IsNullOrEmpty
’’ $
(
’’$ %
Model
’’% *
.
’’* +
AddGroupString
’’+ 9
)
’’9 :
)
’’: ;
return
’’< B
;
’’B C
Settings
÷÷ 
.
÷÷ 
TelegramSettings
÷÷ %
.
÷÷% &
	RSIGroups
÷÷& /
.
÷÷/ 0
Add
÷÷0 3
(
÷÷3 4
Model
÷÷4 9
.
÷÷9 :
AddGroupString
÷÷: H
)
÷÷H I
;
÷÷I J
Settings
◊◊ 
.
◊◊ 
SaveSettings
◊◊ !
(
◊◊! "
)
◊◊" #
;
◊◊# $

MessageBox
ÿÿ 
.
ÿÿ 
Show
ÿÿ 
(
ÿÿ 
$str
ÿÿ 4
,
ÿÿ4 5
$str
ÿÿ6 D
,
ÿÿD E
MessageBoxButton
ÿÿF V
.
ÿÿV W
OK
ÿÿW Y
)
ÿÿY Z
;
ÿÿZ [
}
ŸŸ 	
public
€€ 
void
€€ 
DelGroup
€€ 
(
€€ 
)
€€ 
{
‹‹ 	
Settings
›› 
.
›› 
TelegramSettings
›› %
.
››% &
	RSIGroups
››& /
.
››/ 0
Remove
››0 6
(
››6 7
Model
››7 <
.
››< =
SelectedGroup
››= J
??
››K M
$str
››N P
)
››P Q
;
››Q R
Settings
ﬁﬁ 
.
ﬁﬁ 
SaveSettings
ﬁﬁ !
(
ﬁﬁ! "
)
ﬁﬁ" #
;
ﬁﬁ# $

MessageBox
ﬂﬂ 
.
ﬂﬂ 
Show
ﬂﬂ 
(
ﬂﬂ 
$str
ﬂﬂ 4
,
ﬂﬂ4 5
$str
ﬂﬂ6 D
,
ﬂﬂD E
MessageBoxButton
ﬂﬂF V
.
ﬂﬂV W
OK
ﬂﬂW Y
)
ﬂﬂY Z
;
ﬂﬂZ [
}
‡‡ 	
public
‰‰ 
void
‰‰ 
	DelSymbol
‰‰ 
(
‰‰ 
)
‰‰ 
{
ÂÂ 	
if
ÊÊ 
(
ÊÊ 
Model
ÊÊ 
.
ÊÊ 
SelectedSymbol
ÊÊ $
==
ÊÊ% '
null
ÊÊ( ,
)
ÊÊ, -
return
ÊÊ. 4
;
ÊÊ4 5
string
ÁÁ 
?
ÁÁ 
symbol
ÁÁ 
=
ÁÁ 
Model
ÁÁ "
.
ÁÁ" #
SelectedSymbol
ÁÁ# 1
.
ÁÁ1 2
Symbol
ÁÁ2 8
;
ÁÁ8 9
Settings
ÈÈ 
.
ÈÈ 
BotsSettings
ÈÈ !
.
ÈÈ! "
RSISettings
ÈÈ" -
.
ÈÈ- .
Symbols
ÈÈ. 5
.
ÈÈ5 6
Remove
ÈÈ6 <
(
ÈÈ< =
Model
ÈÈ= B
.
ÈÈB C
SelectedSymbol
ÈÈC Q
.
ÈÈQ R
Symbol
ÈÈR X
)
ÈÈX Y
;
ÈÈY Z
Model
ÍÍ 
.
ÍÍ 
SelectedSymbol
ÍÍ  
.
ÍÍ  !
Dispose
ÍÍ! (
(
ÍÍ( )
)
ÍÍ) *
;
ÍÍ* +
Settings
ÏÏ 
.
ÏÏ 
BotsSettings
ÏÏ !
.
ÏÏ! "
RSISettings
ÏÏ" -
.
ÏÏ- .
Symbols
ÏÏ. 5
.
ÏÏ5 6
Remove
ÏÏ6 <
(
ÏÏ< =
Model
ÏÏ= B
.
ÏÏB C
SelectedSymbol
ÏÏC Q
.
ÏÏQ R
Symbol
ÏÏR X
)
ÏÏX Y
;
ÏÏY Z
Settings
ÌÌ 
.
ÌÌ 
SaveSettings
ÌÌ !
(
ÌÌ! "
)
ÌÌ" #
;
ÌÌ# $
Model
ÔÔ 
.
ÔÔ 
Symbols
ÔÔ 
.
ÔÔ 
Remove
ÔÔ  
(
ÔÔ  !
Model
ÔÔ! &
.
ÔÔ& '
SelectedSymbol
ÔÔ' 5
)
ÔÔ5 6
;
ÔÔ6 7
if
ÚÚ 
(
ÚÚ 
Model
ÚÚ 
.
ÚÚ 
UISymbol
ÚÚ 
==
ÚÚ !
symbol
ÚÚ" (
&&
ÚÚ) +
Model
ÚÚ, 1
.
ÚÚ1 2
Symbols
ÚÚ2 9
.
ÚÚ9 :
Count
ÚÚ: ?
>
ÚÚ@ A
$num
ÚÚB C
)
ÚÚC D
{
ÛÛ 
Model
ÙÙ 
.
ÙÙ 
SelectedSymbol
ÙÙ $
=
ÙÙ% &
Model
ÙÙ' ,
.
ÙÙ, -
Symbols
ÙÙ- 4
[
ÙÙ4 5
$num
ÙÙ5 6
]
ÙÙ6 7
;
ÙÙ7 8
SetUISymbol
ıı 
(
ıı 
)
ıı 
;
ıı 
}
ˆˆ 
}
˜˜ 	
public
˘˘ 
void
˘˘ 
	AddSymbol
˘˘ 
(
˘˘ 
)
˘˘ 
{
˙˙ 	
try
˚˚ 
{
¸¸ 
if
˝˝ 
(
˝˝ 
Model
˝˝ 
.
˝˝ 
Symbols
˝˝ !
.
˝˝! "
Any
˝˝" %
(
˝˝% &
x
˝˝& '
=>
˝˝( *
x
˝˝+ ,
.
˝˝, -
Symbol
˝˝- 3
==
˝˝4 6
Model
˝˝7 <
.
˝˝< =
AddSymbolString
˝˝= L
)
˝˝L M
)
˝˝M N
{
˛˛ 

MessageBox
ˇˇ 
.
ˇˇ 
Show
ˇˇ #
(
ˇˇ# $
$str
ˇˇ$ =
,
ˇˇ= >
$str
ˇˇ? N
,
ˇˇN O
MessageBoxButton
ˇˇP `
.
ˇˇ` a
OK
ˇˇa c
,
ˇˇc d
MessageBoxImage
ˇˇe t
.
ˇˇt u
Informationˇˇu Ä
)ˇˇÄ Å
;ˇˇÅ Ç
return
ÄÄ 
;
ÄÄ 
}
ÅÅ 

_AddSymbol
ÉÉ 
(
ÉÉ 
Model
ÉÉ  
.
ÉÉ  !
AddSymbolString
ÉÉ! 0
??
ÉÉ1 3
$str
ÉÉ4 6
)
ÉÉ6 7
;
ÉÉ7 8

MessageBox
ÑÑ 
.
ÑÑ 
Show
ÑÑ 
(
ÑÑ  
$str
ÑÑ  ;
,
ÑÑ; <
$str
ÑÑ= M
,
ÑÑM N
MessageBoxButton
ÑÑO _
.
ÑÑ_ `
OK
ÑÑ` b
)
ÑÑb c
;
ÑÑc d
}
ÖÖ 
catch
ÜÜ 
(
ÜÜ 
	Exception
ÜÜ 
ex
ÜÜ 
)
ÜÜ  
{
áá 

MessageBox
àà 
.
àà 
Show
àà 
(
àà  
$"
àà  "
$str
àà" ;
{
àà; <
ex
àà< >
.
àà> ?
Message
àà? F
}
ààF G
"
ààG H
,
ààH I
$str
ààJ P
,
ààP Q
MessageBoxButton
ààR b
.
ààb c
OK
ààc e
,
ààe f
MessageBoxImage
ààg v
.
ààv w
Error
ààw |
)
àà| }
;
àà} ~
}
ââ 
}
ää 	
private
åå 
void
åå 

_AddSymbol
åå 
(
åå  
string
åå  &
symbol
åå' -
,
åå- .
bool
åå/ 3
isPaused
åå4 <
=
åå= >
false
åå? D
)
ååD E
{
çç 	
Model
éé 
.
éé 
Symbols
éé 
.
éé 
Add
éé 
(
éé 
new
éé !
RSI
éé" %
(
éé% &
symbol
éé& ,
,
éé, -
Model
éé. 3
.
éé3 4
KlineInterval
éé4 A
,
ééA B
(
ééC D
string
ééD J
symbol
ééK Q
,
ééQ R

Dictionary
ééS ]
<
éé] ^
string
éé^ d
,
ééd e
List
ééf j
<
ééj k
object
éék q
>
ééq r
>
éér s
values
éét z
)
ééz {
=>
éé| ~
{éé Ä
}ééÅ Ç
,ééÇ É!
SendSignalMessageééÑ ï
,ééï ñ
isPausedééó ü
:ééü †
isPausedéé° ©
)éé© ™
{éé´ ¨
}éé≠ Æ
)ééÆ Ø
;ééØ ∞
Settings
èè 
.
èè 
BotsSettings
èè !
.
èè! "
RSISettings
èè" -
.
èè- .
Symbols
èè. 5
.
èè5 6
Add
èè6 9
(
èè9 :
symbol
èè: @
)
èè@ A
;
èèA B
Settings
êê 
.
êê 
SaveSettings
êê !
(
êê! "
)
êê" #
;
êê# $
}
ëë 	
public
ìì 
Task
ìì 
AddAllSymbols
ìì !
(
ìì! "
)
ìì" #
{
îî 	
Model
ïï 
.
ïï 
Symbols
ïï 
.
ïï 
ToList
ïï  
(
ïï  !
)
ïï! "
.
ïï" #
ForEach
ïï# *
(
ïï* +
x
ïï+ ,
=>
ïï- /
x
ïï0 1
.
ïï1 2
Dispose
ïï2 9
(
ïï9 :
)
ïï: ;
)
ïï; <
;
ïï< =
Model
ññ 
.
ññ 
Symbols
ññ 
.
ññ 
Clear
ññ 
(
ññ  
)
ññ  !
;
ññ! "
Settings
óó 
.
óó 
BotsSettings
óó !
.
óó! "
RSISettings
óó" -
.
óó- .
Symbols
óó. 5
.
óó5 6
Clear
óó6 ;
(
óó; <
)
óó< =
;
óó= >
StaticBinance
òò 
.
òò 
ExchangeInfos
òò '
.
òò' (
Spot
òò( ,
.
òò, -
ToList
òò- 3
(
òò3 4
)
òò4 5
.
òò5 6
ForEach
òò6 =
(
òò= >
x
òò> ?
=>
òò@ B
{
ôô 
try
öö 
{
õõ 
if
úú 
(
úú 
!
úú 
x
úú 
.
úú 
Name
úú 
.
úú  
EndsWith
úú  (
(
úú( )
$str
úú) /
)
úú/ 0
)
úú0 1
return
úú2 8
;
úú8 9

_AddSymbol
ùù 
(
ùù 
x
ùù  
.
ùù  !
Name
ùù! %
,
ùù% &
true
ùù' +
)
ùù+ ,
;
ùù, -
}
ûû 
catch
üü 
(
üü 
	Exception
üü  
ex
üü! #
)
üü# $
{
†† 

MessageBox
°° 
.
°° 
Show
°° #
(
°°# $
$"
°°$ &
{
°°& '
x
°°' (
.
°°( )
Name
°°) -
}
°°- .
$str
°°. S
{
°°S T
ex
°°T V
.
°°V W
Message
°°W ^
}
°°^ _
"
°°_ `
,
°°` a
$str
°°b h
,
°°h i
MessageBoxButton
°°j z
.
°°z {
OK
°°{ }
,
°°} ~
MessageBoxImage°° é
.°°é è
Error°°è î
)°°î ï
;°°ï ñ
}
¢¢ 
foreach
§§ 
(
§§ 
var
§§ 
symbol
§§ "
in
§§# %
Model
§§& +
.
§§+ ,
Symbols
§§, 3
)
§§3 4
{
•• 
symbol
¶¶ 
.
¶¶ 
Continue
¶¶ #
(
¶¶# $
)
¶¶$ %
;
¶¶% &
}
ßß 
}
®® 
)
®® 
;
®® 
return
™™ 
Task
™™ 
.
™™ 
Delay
™™ 
(
™™ 
$num
™™ 
)
™™  
;
™™  !
}
´´ 	
public
ØØ 
void
ØØ 
SendSignalMessage
ØØ %
(
ØØ% &
string
ØØ& ,
symbol
ØØ- 3
,
ØØ3 4

Dictionary
ØØ5 ?
<
ØØ? @
string
ØØ@ F
,
ØØF G
List
ØØH L
<
ØØL M
object
ØØM S
>
ØØS T
>
ØØT U
values
ØØV \
,
ØØ\ ]
Enums
ØØ^ c
.
ØØc d

SignalType
ØØd n
type
ØØo s
)
ØØs t
{
∞∞ 	
string
±± 
message
±± 
=
±± 
type
±± !
switch
±±" (
{
≤≤ 
Enums
≥≥ 
.
≥≥ 

SignalType
≥≥  
.
≥≥  !
	UpperLine
≥≥! *
=>
≥≥+ -
Settings
≥≥. 6
.
≥≥6 7
BotsSettings
≥≥7 C
.
≥≥C D
RSISettings
≥≥D O
.
≥≥O P
SignalMessages
≥≥P ^
.
≥≥^ _

Overbought
≥≥_ i
,
≥≥i j
Enums
¥¥ 
.
¥¥ 

SignalType
¥¥  
.
¥¥  !
	UnderLine
¥¥! *
=>
¥¥+ -
Settings
¥¥. 6
.
¥¥6 7
BotsSettings
¥¥7 C
.
¥¥C D
RSISettings
¥¥D O
.
¥¥O P
SignalMessages
¥¥P ^
.
¥¥^ _
Oversold
¥¥_ g
,
¥¥g h
Enums
µµ 
.
µµ 

SignalType
µµ  
.
µµ  !
BetweenLines
µµ! -
=>
µµ. 0
Settings
µµ1 9
.
µµ9 :
BotsSettings
µµ: F
.
µµF G
RSISettings
µµG R
.
µµR S
SignalMessages
µµS a
.
µµa b
BetweenLevels
µµb o
,
µµo p
_
∂∂ 
=>
∂∂ 
$str
∂∂ 
,
∂∂ 
}
∑∑ 
;
∑∑ 
if
ππ 
(
ππ 
string
ππ 
.
ππ 
IsNullOrEmpty
ππ $
(
ππ$ %
message
ππ% ,
)
ππ, -
)
ππ- .
return
ππ/ 5
;
ππ5 6
message
∫∫ 
=
∫∫ 
message
∫∫ 
.
∫∫ 
Replace
∫∫ %
(
∫∫% &
$str
∫∫& 0
,
∫∫0 1
symbol
∫∫2 8
)
∫∫8 9
.
∫∫9 :
Replace
∫∫: A
(
∫∫A B
$str
∫∫B K
,
∫∫K L
Math
∫∫M Q
.
∫∫Q R
Round
∫∫R W
(
∫∫W X
(
∫∫X Y
(
∫∫Y Z
Kline
∫∫Z _
)
∫∫_ `
values
∫∫` f
[
∫∫f g
$str
∫∫g o
]
∫∫o p
.
∫∫p q
Last
∫∫q u
(
∫∫u v
)
∫∫v w
)
∫∫w x
.
∫∫x y
Close
∫∫y ~
,
∫∫~ 
$num∫∫Ä Å
)∫∫Å Ç
.∫∫Ç É
ToString∫∫É ã
(∫∫ã å
)∫∫å ç
)∫∫ç é
.∫∫é è
Replace∫∫è ñ
(∫∫ñ ó
$str∫∫ó û
,∫∫û ü
Math∫∫† §
.∫∫§ •
Round∫∫• ™
(∫∫™ ´
(∫∫´ ¨
double∫∫¨ ≤
)∫∫≤ ≥
values∫∫≥ π
[∫∫π ∫
$str∫∫∫ ø
]∫∫ø ¿
.∫∫¿ ¡
Last∫∫¡ ≈
(∫∫≈ ∆
)∫∫∆ «
,∫∫« »
$num∫∫…  
)∫∫  À
.∫∫À Ã
ToString∫∫Ã ‘
(∫∫‘ ’
)∫∫’ ÷
)∫∫÷ ◊
;∫∫◊ ÿ
foreach
ºº 
(
ºº 
User
ºº 
user
ºº 
in
ºº !
Model
ºº" '
.
ºº' (
Users
ºº( -
)
ºº- .
{
ΩΩ 
try
ææ 
{
øø 
if
¿¿ 
(
¿¿ 
user
¿¿ 
.
¿¿ 
ChatId
¿¿ #
==
¿¿$ &
$num
¿¿' (
)
¿¿( )
continue
¿¿* 2
;
¿¿2 3

BotClients
¡¡ 
.
¡¡ 
	RSIClient
¡¡ (
.
¡¡( )"
SendTextMessageAsync
¡¡) =
(
¡¡= >
user
¡¡> B
.
¡¡B C
ChatId
¡¡C I
,
¡¡I J
message
¡¡K R
)
¡¡R S
;
¡¡S T
}
¬¬ 
catch
√√ 
(
√√ 
	Exception
√√  
ex
√√! #
)
√√# $
{
ƒƒ 
Console
≈≈ 
.
≈≈ 
	WriteLine
≈≈ %
(
≈≈% &
$"
≈≈& (
$str
≈≈( 9
{
≈≈9 :
user
≈≈: >
.
≈≈> ?
Username
≈≈? G
}
≈≈G H
$str
≈≈H c
{
≈≈c d
ex
≈≈d f
.
≈≈f g
Message
≈≈g n
}
≈≈n o
"
≈≈o p
)
≈≈p q
;
≈≈q r
}
∆∆ 
}
»» 
foreach
   
(
   
string
   
?
   
group
   "
in
  # %
Settings
  & .
.
  . /
TelegramSettings
  / ?
.
  ? @
	RSIGroups
  @ I
)
  I J
{
ÀÀ 
try
ÃÃ 
{
ÕÕ 

BotClients
ŒŒ 
.
ŒŒ 
	RSIClient
ŒŒ (
.
ŒŒ( )"
SendTextMessageAsync
ŒŒ) =
(
ŒŒ= >
group
ŒŒ> C
,
ŒŒC D
message
ŒŒE L
)
ŒŒL M
;
ŒŒM N
}
œœ 
catch
–– 
(
–– 
	Exception
––  
ex
––! #
)
––# $
{
—— 
Console
““ 
.
““ 
	WriteLine
““ %
(
““% &
$"
““& (
$str
““( 8
{
““8 9
group
““9 >
}
““> ?
$str
““? Z
{
““Z [
ex
““[ ]
.
““] ^
Message
““^ e
}
““e f
"
““f g
)
““g h
;
““h i
}
”” 
}
‘‘ 
}
’’ 	
public
ŸŸ 
void
ŸŸ 
SaveSettings
ŸŸ  
(
ŸŸ  !
)
ŸŸ! "
{
⁄⁄ 	
Settings
€€ 
.
€€ 
BotsSettings
€€ !
.
€€! "
RSISettings
€€" -
.
€€- .
SignalMessages
€€. <
.
€€< =
Oversold
€€= E
=
€€F G
Model
€€H M
.
€€M N"
OversoldSignalString
€€N b
;
€€b c
Settings
‹‹ 
.
‹‹ 
BotsSettings
‹‹ !
.
‹‹! "
RSISettings
‹‹" -
.
‹‹- .
SignalMessages
‹‹. <
.
‹‹< =

Overbought
‹‹= G
=
‹‹H I
Model
‹‹J O
.
‹‹O P$
OverboughtSignalString
‹‹P f
;
‹‹f g
Settings
›› 
.
›› 
BotsSettings
›› !
.
››! "
RSISettings
››" -
.
››- .
SignalMessages
››. <
.
››< =
BetweenLevels
››= J
=
››K L
Model
››M R
.
››R S'
BetweenLevelsSignalString
››S l
;
››l m
Settings
ﬂﬂ 
.
ﬂﬂ 
BotsSettings
ﬂﬂ !
.
ﬂﬂ! "
RSISettings
ﬂﬂ" -
.
ﬂﬂ- .
	RSIPeriot
ﬂﬂ. 7
=
ﬂﬂ8 9
Model
ﬂﬂ: ?
.
ﬂﬂ? @
	RSIPeriot
ﬂﬂ@ I
;
ﬂﬂI J
Settings
‡‡ 
.
‡‡ 
BotsSettings
‡‡ !
.
‡‡! "
RSISettings
‡‡" -
.
‡‡- .
RSIOversoldLevel
‡‡. >
=
‡‡? @
Model
‡‡A F
.
‡‡F G
RSIOversoldLevel
‡‡G W
;
‡‡W X
Settings
·· 
.
·· 
BotsSettings
·· !
.
··! "
RSISettings
··" -
.
··- . 
RSIOverboughtLevet
··. @
=
··A B
Model
··C H
.
··H I 
RSIOverboughtLevel
··I [
;
··[ \
Settings
„„ 
.
„„ 
BotsSettings
„„ !
.
„„! "
RSISettings
„„" -
.
„„- .
MinSignalPeriot
„„. =
=
„„> ?
Model
„„@ E
.
„„E F
MinSignalPeriot
„„F U
;
„„U V
Settings
‰‰ 
.
‰‰ 
BotsSettings
‰‰ !
.
‰‰! "
TDISettings
‰‰" -
.
‰‰- .
KlineInterval
‰‰. ;
=
‰‰< =
Enum
‰‰> B
.
‰‰B C
GetName
‰‰C J
(
‰‰J K
typeof
‰‰K Q
(
‰‰Q R
KlineInterval
‰‰R _
)
‰‰_ `
,
‰‰` a
Model
‰‰b g
.
‰‰g h
KlineInterval
‰‰h u
)
‰‰u v
;
‰‰v w
Settings
ÊÊ 
.
ÊÊ 
SaveSettings
ÊÊ !
(
ÊÊ! "
)
ÊÊ" #
;
ÊÊ# $

MessageBox
ËË 
.
ËË 
Show
ËË 
(
ËË 
$str
ËË ;
,
ËË; <
$str
ËË= Q
,
ËËQ R
MessageBoxButton
ËËS c
.
ËËc d
OK
ËËd f
)
ËËf g
;
ËËg h
}
ÈÈ 	
public
ÎÎ 
void
ÎÎ 
LoadSettings
ÎÎ  
(
ÎÎ  !
)
ÎÎ! "
{
ÏÏ 	
Model
ÌÌ 
.
ÌÌ $
OverboughtSignalString
ÌÌ (
=
ÌÌ) *
Settings
ÌÌ+ 3
.
ÌÌ3 4
BotsSettings
ÌÌ4 @
.
ÌÌ@ A
RSISettings
ÌÌA L
.
ÌÌL M
SignalMessages
ÌÌM [
.
ÌÌ[ \

Overbought
ÌÌ\ f
;
ÌÌf g
Model
ÓÓ 
.
ÓÓ "
OversoldSignalString
ÓÓ &
=
ÓÓ' (
Settings
ÓÓ) 1
.
ÓÓ1 2
BotsSettings
ÓÓ2 >
.
ÓÓ> ?
RSISettings
ÓÓ? J
.
ÓÓJ K
SignalMessages
ÓÓK Y
.
ÓÓY Z
Oversold
ÓÓZ b
;
ÓÓb c
Model
ÔÔ 
.
ÔÔ '
BetweenLevelsSignalString
ÔÔ +
=
ÔÔ, -
Settings
ÔÔ. 6
.
ÔÔ6 7
BotsSettings
ÔÔ7 C
.
ÔÔC D
RSISettings
ÔÔD O
.
ÔÔO P
SignalMessages
ÔÔP ^
.
ÔÔ^ _
BetweenLevels
ÔÔ_ l
;
ÔÔl m
Model
ÒÒ 
.
ÒÒ 
	RSIPeriot
ÒÒ 
=
ÒÒ 
Settings
ÒÒ &
.
ÒÒ& '
BotsSettings
ÒÒ' 3
.
ÒÒ3 4
RSISettings
ÒÒ4 ?
.
ÒÒ? @
	RSIPeriot
ÒÒ@ I
;
ÒÒI J
Model
ÚÚ 
.
ÚÚ 
RSIOversoldLevel
ÚÚ "
=
ÚÚ# $
Settings
ÚÚ% -
.
ÚÚ- .
BotsSettings
ÚÚ. :
.
ÚÚ: ;
RSISettings
ÚÚ; F
.
ÚÚF G
RSIOversoldLevel
ÚÚG W
;
ÚÚW X
Model
ÛÛ 
.
ÛÛ  
RSIOverboughtLevel
ÛÛ $
=
ÛÛ% &
Settings
ÛÛ' /
.
ÛÛ/ 0
BotsSettings
ÛÛ0 <
.
ÛÛ< =
RSISettings
ÛÛ= H
.
ÛÛH I 
RSIOverboughtLevet
ÛÛI [
;
ÛÛ[ \
Model
ıı 
.
ıı 
MinSignalPeriot
ıı !
=
ıı" #
Settings
ıı$ ,
.
ıı, -
BotsSettings
ıı- 9
.
ıı9 :
RSISettings
ıı: E
.
ııE F
MinSignalPeriot
ııF U
;
ııU V
}
ˆˆ 	
public
¯¯ 
void
¯¯ !
ChangeKlineInterval
¯¯ '
(
¯¯' (
)
¯¯( )
{
˘˘ 	
MessageBoxResult
˙˙ 
change
˙˙ #
=
˙˙$ %

MessageBox
˙˙& 0
.
˙˙0 1
Show
˙˙1 5
(
˙˙5 6
$str˙˙6 €
,˙˙€ ‹
$str˙˙› Ú
,˙˙Ú Û 
MessageBoxButton˙˙Ù Ñ
.˙˙Ñ Ö
YesNo˙˙Ö ä
,˙˙ä ã
MessageBoxImage˙˙å õ
.˙˙õ ú
Warning˙˙ú £
)˙˙£ §
;˙˙§ •
if
˚˚ 
(
˚˚ 
change
˚˚ 
==
˚˚ 
MessageBoxResult
˚˚ *
.
˚˚* +
No
˚˚+ -
)
˚˚- .
{
¸¸ 
Model
˝˝ 
.
˝˝ 
KlineInterval
˝˝ #
=
˝˝$ %
Model
˝˝& +
.
˝˝+ ,
KlineIntervals
˝˝, :
.
˝˝: ;
First
˝˝; @
(
˝˝@ A
x
˝˝A B
=>
˝˝C E
x
˝˝F G
.
˝˝G H
Equals
˝˝H N
(
˝˝N O
Model
˝˝O T
.
˝˝T U
Symbols
˝˝U \
.
˝˝\ ]
First
˝˝] b
(
˝˝b c
)
˝˝c d
.
˝˝d e
Interval
˝˝e m
)
˝˝m n
)
˝˝n o
;
˝˝o p
return
˛˛ 
;
˛˛ 
}
ˇˇ 
Model
ÅÅ 
.
ÅÅ 
Symbols
ÅÅ 
.
ÅÅ 
ToList
ÅÅ  
(
ÅÅ  !
)
ÅÅ! "
.
ÅÅ" #
ForEach
ÅÅ# *
(
ÅÅ* +
x
ÅÅ+ ,
=>
ÅÅ- /
x
ÅÅ0 1
.
ÅÅ1 2
ChangeInterval
ÅÅ2 @
(
ÅÅ@ A
Model
ÅÅA F
.
ÅÅF G
KlineInterval
ÅÅG T
)
ÅÅT U
)
ÅÅU V
;
ÅÅV W
SaveSettings
ÉÉ 
(
ÉÉ 
)
ÉÉ 
;
ÉÉ 
}
ÑÑ 	
}
ÜÜ 
}áá ®Û
vC:\Users\√ñmer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\UI\ViewModels\TDIViewModel.cs
	namespace 	!
EASYTelegramSignalBot
 
.  

ViewModels  *
{ 
internal 
class 
TDIViewModel 
:  !
UserControl" -
{ 
public 
ICommand 
AddUserCommand &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
public 
ICommand 
DelUserCommand &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
public 
ICommand 
SetUISymbolCommand *
{+ ,
get- 0
;0 1
set2 5
;5 6
}7 8
public 
ICommand 
AddSymbolCommand (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
public 
ICommand  
AddAllSymbolsCommand ,
{- .
get/ 2
;2 3
set4 7
;7 8
}9 :
public 
ICommand 
DelSymbolCommand (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
public   
ICommand    
AddUserSymbolCommand   ,
{  - .
get  / 2
;  2 3
set  4 7
;  7 8
}  9 :
public!! 
ICommand!!  
DelUserSymbolCommand!! ,
{!!- .
get!!/ 2
;!!2 3
set!!4 7
;!!7 8
}!!9 :
public"" 
ICommand"" 
AddGroupCommand"" '
{""( )
get""* -
;""- .
set""/ 2
;""2 3
}""4 5
public## 
ICommand## 
DelGroupCommand## '
{##( )
get##* -
;##- .
set##/ 2
;##2 3
}##4 5
public$$ 
ICommand$$ 
SaveSettingsCommand$$ +
{$$, -
get$$. 1
;$$1 2
set$$3 6
;$$6 7
}$$8 9
public&& 
TDIModel&& 
Model&& 
{&& 
get&&  #
;&&# $
set&&% (
;&&( )
}&&* +
public(( 
TDIViewModel(( 
((( 
)(( 
{)) 	
Model** 
=** 
new** 
(** 
)** 
;** 
AddUserCommand,, 
=,, 
new,,  
DelegateCommand,,! 0
(,,0 1
(,,1 2
o,,2 3
),,3 4
=>,,5 7
AddUser,,8 ?
(,,? @
),,@ A
),,A B
;,,B C
DelUserCommand-- 
=-- 
new--  
DelegateCommand--! 0
(--0 1
(--1 2
o--2 3
)--3 4
=>--5 7
DelUser--8 ?
(--? @
)--@ A
)--A B
;--B C
SetUISymbolCommand.. 
=..  
new..! $
DelegateCommand..% 4
(..4 5
(..5 6
o..6 7
)..7 8
=>..9 ;
SetUISymbol..< G
(..G H
)..H I
)..I J
;..J K
AddSymbolCommand// 
=// 
new// "
DelegateCommand//# 2
(//2 3
(//3 4
o//4 5
)//5 6
=>//7 9
	AddSymbol//: C
(//C D
)//D E
)//E F
;//F G 
AddAllSymbolsCommand00  
=00! "
new00# &
DelegateCommand00' 6
(006 7
(007 8
o008 9
)009 :
=>00; =
AddAllSymbols00> K
(00K L
)00L M
)00M N
;00N O
DelSymbolCommand11 
=11 
new11 "
DelegateCommand11# 2
(112 3
(113 4
o114 5
)115 6
=>117 9
	DelSymbol11: C
(11C D
)11D E
)11E F
;11F G 
AddUserSymbolCommand22  
=22! "
new22# &
DelegateCommand22' 6
(226 7
(227 8
o228 9
)229 :
=>22; =
AddUserSymbol22> K
(22K L
)22L M
)22M N
;22N O 
DelUserSymbolCommand33  
=33! "
new33# &
DelegateCommand33' 6
(336 7
(337 8
o338 9
)339 :
=>33; =
DelUserSymbol33> K
(33K L
)33L M
)33M N
;33N O
AddGroupCommand44 
=44 
new44 !
DelegateCommand44" 1
(441 2
(442 3
o443 4
)444 5
=>446 8
AddGroup449 A
(44A B
)44B C
)44C D
;44D E
DelGroupCommand55 
=55 
new55 !
DelegateCommand55" 1
(551 2
(552 3
o553 4
)554 5
=>556 8
DelGroup559 A
(55A B
)55B C
)55C D
;55D E
SaveSettingsCommand66 
=66  !
new66" %
DelegateCommand66& 5
(665 6
(666 7
o667 8
)668 9
=>66: <
SaveSettings66= I
(66I J
)66J K
)66K L
;66L M
LoadSettings88 
(88 
)88 
;88 
SetSubscriptions:: 
(:: 
):: 
;:: 
};; 	
private== 
void== 
SetSubscriptions== %
(==% &
)==& '
{>> 	
foreach?? 
(?? 
string?? 
??? 
symbol?? #
in??$ &
Settings??' /
.??/ 0
BotsSettings??0 <
.??< =
TDISettings??= H
.??H I
Symbols??I P
.??P Q
ToList??Q W
(??W X
)??X Y
)??Y Z
{@@ 
tryAA 
{BB 
ModelCC 
.CC 
SymbolsCC !
.CC! "
AddCC" %
(CC% &
newCC& )
TDICC* -
(CC- .
symbolCC. 4
,CC4 5
ModelCC6 ;
.CC; <
KlineIntervalCC< I
,CCI J
(CCK L
stringCCL R
symbolCCS Y
,CCY Z

DictionaryCC[ e
<CCe f
stringCCf l
,CCl m
ListCCn r
<CCr s
objectCCs y
>CCy z
>CCz {
values	CC| Ç
)
CCÇ É
=>
CCÑ Ü
{
CCá à
}
CCâ ä
,
CCä ã
SendSignalMessage
CCå ù
,
CCù û
true
CCü £
)
CC£ §
{
CC• ¶
}
CCß ®
)
CC® ©
;
CC© ™
}DD 
catchEE 
(EE 
	ExceptionEE  
exEE! #
)EE# $
{FF 
MessageBoxResultGG $
deleteSymbolGG% 1
=GG2 3

MessageBoxGG4 >
.GG> ?
ShowGG? C
(GGC D
$"GGD F
$strGGF J
{GGJ K
symbolGGK Q
}GGQ R
$strGGR w
{GGw x
exGGx z
.GGz {
Message	GG{ Ç
}
GGÇ É
$str
GGÉ ô
"
GGô ö
,
GGö õ
$str
GGú ¢
,
GG¢ £
MessageBoxButton
GG§ ¥
.
GG¥ µ
YesNo
GGµ ∫
,
GG∫ ª
MessageBoxImage
GGº À
.
GGÀ Ã
Error
GGÃ —
)
GG— “
;
GG“ ”
ifHH 
(HH 
deleteSymbolHH $
==HH% '
MessageBoxResultHH( 8
.HH8 9
YesHH9 <
)HH< =
{II 
SettingsJJ  
.JJ  !
BotsSettingsJJ! -
.JJ- .
TDISettingsJJ. 9
.JJ9 :
SymbolsJJ: A
.JJA B
RemoveJJB H
(JJH I
symbolJJI O
)JJO P
;JJP Q
SettingsKK  
.KK  !
SaveSettingsKK! -
(KK- .
)KK. /
;KK/ 0
}LL 
}MM 
}NN 
UILoaderOO 
.OO 
InstanceOO 
.OO 
SetPageReadyOO *
(OO* +
$strOO+ 0
,OO0 1
(OO2 3
)OO3 4
=>OO5 7
ContinueOO8 @
(OO@ A
)OOA B
)OOB C
;OOC D
}PP 	
privateRR 
TaskRR 
ContinueRR 
(RR 
)RR 
{SS 	
foreachTT 
(TT 
	IndicatorTT 
?TT 
symbolTT  &
inTT' )
ModelTT* /
.TT/ 0
SymbolsTT0 7
)TT7 8
symbolTT9 ?
.TT? @
ContinueTT@ H
(TTH I
)TTI J
;TTJ K
returnUU 
TaskUU 
.UU 
CompletedTaskUU %
;UU% &
}VV 	
publicYY 
voidYY 
UpdateUIYY 
(YY 
stringYY #
symbolYY$ *
,YY* +

DictionaryYY, 6
<YY6 7
stringYY7 =
,YY= >
ListYY? C
<YYC D
objectYYD J
>YYJ K
>YYK L
ValuesYYM S
)YYS T
{ZZ 	
if[[ 
([[ 
symbol[[ 
!=[[ 
Model[[ 
.[[  
UISymbol[[  (
)[[( )
return[[* 0
;[[0 1
List]] 
<]] 
Kline]] 
>]] 
?]] 
Klines]] 
=]]  !
Values]]" (
[]]( )
$str]]) 1
]]]1 2
.]]2 3
Select]]3 9
(]]9 :
x]]: ;
=>]]< >
(]]? @
Kline]]@ E
)]]E F
x]]F G
)]]G H
.]]H I
ToList]]I O
(]]O P
)]]P Q
;]]Q R
UpdateKlines^^ 
(^^ 
Klines^^ 
)^^  
;^^  !
List`` 
<`` 
object`` 
>`` 
?`` 
FastMA``  
=``! "
Values``# )
[``) *
$str``* 2
]``2 3
.``3 4
ToList``4 :
(``: ;
)``; <
;``< =
Listaa 
<aa 
objectaa 
>aa 
?aa 
SlowMAaa  
=aa! "
Valuesaa# )
[aa) *
$straa* 2
]aa2 3
.aa3 4
ToListaa4 :
(aa: ;
)aa; <
;aa< =
Listbb 
<bb 
objectbb 
>bb 
?bb 
UpVBbb 
=bb  
Valuesbb! '
[bb' (
$strbb( .
]bb. /
.bb/ 0
ToListbb0 6
(bb6 7
)bb7 8
;bb8 9
Listcc 
<cc 
objectcc 
>cc 
?cc 
MiddleVBcc "
=cc# $
Valuescc% +
[cc+ ,
$strcc, 6
]cc6 7
.cc7 8
ToListcc8 >
(cc> ?
)cc? @
;cc@ A
Listdd 
<dd 
objectdd 
>dd 
?dd 
DownVBdd  
=dd! "
Valuesdd# )
[dd) *
$strdd* 2
]dd2 3
.dd3 4
ToListdd4 :
(dd: ;
)dd; <
;dd< =
UpdateIndicatorsee 
(ee 
Klinesee #
,ee# $
FastMAee% +
,ee+ ,
SlowMAee- 3
,ee3 4
UpVBee5 9
,ee9 :
MiddleVBee; C
,eeC D
DownVBeeE K
)eeK L
;eeL M
}ff 	
publichh 
voidhh 
SetUISymbolhh 
(hh  
)hh  !
{ii 	
ifjj 
(jj 
Modeljj 
.jj 
SelectedSymboljj $
==jj% '
nulljj( ,
)jj, -
returnjj. 4
;jj4 5
ifkk 
(kk 
Modelkk 
.kk 
SelectedSymbolkk $
.kk$ %
Symbolkk% +
==kk, .
Modelkk/ 4
.kk4 5
UISymbolkk5 =
)kk= >
returnkk? E
;kkE F
ifll 
(ll 
Modelll 
.ll 
Symbolsll 
.ll 
Countll #
<ll$ %
$numll& '
)ll' (
returnll) /
;ll/ 0
ifnn 
(nn 
Modelnn 
.nn 
Symbolsnn 
.nn 
Anynn !
(nn! "
xnn" #
=>nn$ &
xnn' (
.nn( )
Symbolnn) /
==nn0 2
Modelnn3 8
.nn8 9
UISymbolnn9 A
)nnA B
)nnB C
{oo 
Modelpp 
.pp 
Symbolspp 
.pp 
Firstpp #
(pp# $
xpp$ %
=>pp& (
xpp) *
.pp* +
Symbolpp+ 1
==pp2 4
Modelpp5 :
.pp: ;
UISymbolpp; C
)ppC D
.ppD E
UpdateActionppE Q
=ppR S
(ppT U
stringppU [
symbolpp\ b
,ppb c

Dictionaryppd n
<ppn o
stringppo u
,ppu v
Listppw {
<pp{ |
object	pp| Ç
>
ppÇ É
>
ppÉ Ñ
values
ppÖ ã
)
ppã å
=>
ppç è
{
ppê ë
}
ppí ì
;
ppì î
}qq 
Modelrr 
.rr !
KlineSeriesCollectionrr '
.rr' (
ToListrr( .
(rr. /
)rr/ 0
.rr0 1
ForEachrr1 8
(rr8 9
xrr9 :
=>rr; =
xrr> ?
.rr? @
Valuesrr@ F
.rrF G
ClearrrG L
(rrL M
)rrM N
)rrN O
;rrO P
Modelss 
.ss &
IndicatorsSeriesCollectionss ,
.ss, -
ToListss- 3
(ss3 4
)ss4 5
.ss5 6
ForEachss6 =
(ss= >
xss> ?
=>ss@ B
xssC D
.ssD E
ValuesssE K
.ssK L
ClearssL Q
(ssQ R
)ssR S
)ssS T
;ssT U
Modeltt 
.tt 
UISymboltt 
=tt 
Modeltt "
.tt" #
SelectedSymboltt# 1
.tt1 2
Symboltt2 8
;tt8 9
Modeluu 
.uu 
Symbolsuu 
.uu 
Firstuu 
(uu  
xuu  !
=>uu" $
xuu% &
.uu& '
Symboluu' -
==uu. 0
Modeluu1 6
.uu6 7
UISymboluu7 ?
)uu? @
.uu@ A
UpdateActionuuA M
=uuN O
UpdateUIuuP X
;uuX Y
Modelvv 
.vv 
KlineSeriesvv 
.vv 
Titlevv #
=vv$ %
Modelvv& +
.vv+ ,
UISymbolvv, 4
;vv4 5
}ww 	
publicyy 
voidyy 
UpdateKlinesyy  
(yy  !
IEnumerableyy! ,
<yy, -
Klineyy- 2
>yy2 3
Klinesyy4 :
)yy: ;
{zz 	
if{{ 
({{ 
Model{{ 
.{{ 
KlineSeries{{ !
.{{! "
Values{{" (
.{{( )
Count{{) .
=={{/ 1
$num{{2 3
){{3 4
{|| 
Model}} 
.}} 
KlineSeries}} !
.}}! "
Values}}" (
.}}( )
AddRange}}) 1
(}}1 2
Klines}}2 8
.}}8 9
Select}}9 ?
(}}? @
x}}@ A
=>}}B D
new}}E H
	OhlcPoint}}I R
(}}R S
(}}S T
double}}T Z
)}}Z [
x}}[ \
.}}\ ]
_Open}}] b
,}}b c
(}}d e
double}}e k
)}}k l
x}}l m
.}}m n
_High}}n s
,}}s t
(}}u v
double}}v |
)}}| }
x}}} ~
.}}~ 
_Low	}} É
,
}}É Ñ
(
}}Ö Ü
double
}}Ü å
)
}}å ç
x
}}ç é
.
}}é è
_Close
}}è ï
)
}}ï ñ
)
}}ñ ó
.
}}ó ò
ToList
}}ò û
(
}}û ü
)
}}ü †
)
}}† °
;
}}° ¢
Model~~ 
.~~ 
Labels~~ 
=~~ 
Klines~~ %
.~~% &
Select~~& ,
(~~, -
x~~- .
=>~~/ 1
x~~2 3
.~~3 4
	_OpenDate~~4 =
.~~= >
ToString~~> F
(~~F G
$str~~G M
)~~M N
)~~N O
.~~O P
ToList~~P V
(~~V W
)~~W X
;~~X Y
return 
; 
}
ÄÄ 
if
ÇÇ 
(
ÇÇ 
Model
ÇÇ 
.
ÇÇ 
Labels
ÇÇ 
.
ÇÇ 
Last
ÇÇ !
(
ÇÇ! "
)
ÇÇ" #
==
ÇÇ$ &
Klines
ÇÇ' -
.
ÇÇ- .
Last
ÇÇ. 2
(
ÇÇ2 3
)
ÇÇ3 4
.
ÇÇ4 5
	_OpenDate
ÇÇ5 >
.
ÇÇ> ?
ToString
ÇÇ? G
(
ÇÇG H
$str
ÇÇH N
)
ÇÇN O
)
ÇÇO P
{
ÉÉ 
Kline
ÑÑ 
?
ÑÑ 
	LastKline
ÑÑ  
=
ÑÑ! "
Klines
ÑÑ# )
.
ÑÑ) *
Last
ÑÑ* .
(
ÑÑ. /
)
ÑÑ/ 0
;
ÑÑ0 1
	OhlcPoint
ÖÖ 
?
ÖÖ 
LastChartKline
ÖÖ )
=
ÖÖ* +
(
ÖÖ, -
	OhlcPoint
ÖÖ- 6
?
ÖÖ6 7
)
ÖÖ7 8
Model
ÖÖ8 =
.
ÖÖ= >#
KlineSeriesCollection
ÖÖ> S
[
ÖÖS T
$num
ÖÖT U
]
ÖÖU V
.
ÖÖV W
Values
ÖÖW ]
[
ÖÖ] ^
^
ÖÖ^ _
$num
ÖÖ_ `
]
ÖÖ` a
;
ÖÖa b
if
áá 
(
áá 
LastChartKline
áá "
==
áá# %
null
áá& *
)
áá* +
return
áá, 2
;
áá2 3
LastChartKline
àà 
.
àà 
Close
àà $
=
àà% &
(
àà' (
double
àà( .
)
àà. /
	LastKline
àà/ 8
.
àà8 9
_Close
àà9 ?
;
àà? @
if
ââ 
(
ââ 
LastChartKline
ââ "
.
ââ" #
High
ââ# '
<
ââ( )
(
ââ* +
double
ââ+ 1
)
ââ1 2
	LastKline
ââ2 ;
.
ââ; <
_High
ââ< A
)
ââA B
LastChartKline
ââC Q
.
ââQ R
High
ââR V
=
ââW X
(
ââY Z
double
ââZ `
)
ââ` a
	LastKline
ââa j
.
ââj k
_High
ââk p
;
ââp q
if
ää 
(
ää 
LastChartKline
ää "
.
ää" #
Low
ää# &
<
ää' (
(
ää) *
double
ää* 0
)
ää0 1
	LastKline
ää1 :
.
ää: ;
_Low
ää; ?
)
ää? @
LastChartKline
ääA O
.
ääO P
Low
ääP S
=
ääT U
(
ääV W
double
ääW ]
)
ää] ^
	LastKline
ää^ g
.
ääg h
_Low
ääh l
;
ääl m
return
ãã 
;
ãã 
}
åå 
Model
éé 
.
éé 
Labels
éé 
.
éé 
RemoveAt
éé !
(
éé! "
$num
éé" #
)
éé# $
;
éé$ %
Model
èè 
.
èè #
KlineSeriesCollection
èè '
[
èè' (
$num
èè( )
]
èè) *
.
èè* +
Values
èè+ 1
.
èè1 2
RemoveAt
èè2 :
(
èè: ;
$num
èè; <
)
èè< =
;
èè= >
Model
ëë 
.
ëë 
Labels
ëë 
.
ëë 
Add
ëë 
(
ëë 
Klines
ëë #
.
ëë# $
Last
ëë$ (
(
ëë( )
)
ëë) *
.
ëë* +
	_OpenDate
ëë+ 4
.
ëë4 5
ToString
ëë5 =
(
ëë= >
$str
ëë> D
)
ëëD E
)
ëëE F
;
ëëF G
Model
íí 
.
íí #
KlineSeriesCollection
íí '
[
íí' (
$num
íí( )
]
íí) *
.
íí* +
Values
íí+ 1
.
íí1 2
Add
íí2 5
(
íí5 6
new
íí6 9
	OhlcPoint
íí: C
(
ííC D
(
ííD E
double
ííE K
)
ííK L
Klines
ííL R
.
ííR S
Last
ííS W
(
ííW X
)
ííX Y
.
ííY Z
_Open
ííZ _
,
íí_ `
(
íía b
double
ííb h
)
ííh i
Klines
ííi o
.
íío p
Last
ííp t
(
íít u
)
ííu v
.
íív w
_High
ííw |
,
íí| }
(
íí~ 
doubleíí Ö
)ííÖ Ü
KlinesííÜ å
.ííå ç
Lastííç ë
(ííë í
)ííí ì
.ííì î
_Lowííî ò
,ííò ô
(ííö õ
doubleííõ °
)íí° ¢
Klinesíí¢ ®
.íí® ©
Lastíí© ≠
(íí≠ Æ
)ííÆ Ø
.ííØ ∞
_Closeíí∞ ∂
)íí∂ ∑
)íí∑ ∏
;íí∏ π
}
ìì 	
public
ïï 
void
ïï 
UpdateIndicators
ïï $
(
ïï$ %
IEnumerable
ïï% 0
<
ïï0 1
Kline
ïï1 6
>
ïï6 7
Klines
ïï8 >
,
ïï> ?
IEnumerable
ïï@ K
<
ïïK L
object
ïïL R
>
ïïR S
FastMA
ïïT Z
,
ïïZ [
IEnumerable
ïï\ g
<
ïïg h
object
ïïh n
>
ïïn o
SlowMA
ïïp v
,
ïïv w
IEnumerableïïx É
<ïïÉ Ñ
objectïïÑ ä
>ïïä ã
UpVBïïå ê
,ïïê ë
IEnumerableïïí ù
<ïïù û
objectïïû §
>ïï§ •
MiddleVBïï¶ Æ
,ïïÆ Ø
IEnumerableïï∞ ª
<ïïª º
objectïïº ¬
>ïï¬ √
DownVBïïƒ  
)ïï  À
{
ññ 	
UpdateIndicator
óó 
(
óó 
Klines
óó "
,
óó" #
Model
óó$ )
.
óó) *
FastMA
óó* 0
.
óó0 1
Values
óó1 7
,
óó7 8
FastMA
óó9 ?
)
óó? @
;
óó@ A
UpdateIndicator
òò 
(
òò 
Klines
òò "
,
òò" #
Model
òò$ )
.
òò) *
SlowMA
òò* 0
.
òò0 1
Values
òò1 7
,
òò7 8
SlowMA
òò9 ?
)
òò? @
;
òò@ A
UpdateIndicator
ôô 
(
ôô 
Klines
ôô "
,
ôô" #
Model
ôô$ )
.
ôô) *
UpVB
ôô* .
.
ôô. /
Values
ôô/ 5
,
ôô5 6
UpVB
ôô7 ;
)
ôô; <
;
ôô< =
UpdateIndicator
öö 
(
öö 
Klines
öö "
,
öö" #
Model
öö$ )
.
öö) *
MiddleVB
öö* 2
.
öö2 3
Values
öö3 9
,
öö9 :
MiddleVB
öö; C
)
ööC D
;
ööD E
UpdateIndicator
õõ 
(
õõ 
Klines
õõ "
,
õõ" #
Model
õõ$ )
.
õõ) *
DownVB
õõ* 0
.
õõ0 1
Values
õõ1 7
,
õõ7 8
DownVB
õõ9 ?
)
õõ? @
;
õõ@ A
}
úú 	
private
ûû 
void
ûû 
UpdateIndicator
ûû $
(
ûû$ %
IEnumerable
ûû% 0
<
ûû0 1
Kline
ûû1 6
>
ûû6 7
Klines
ûû8 >
,
ûû> ?
IChartValues
ûû@ L
values
ûûM S
,
ûûS T
IEnumerable
ûûU `
<
ûû` a
object
ûûa g
>
ûûg h
	newValues
ûûi r
)
ûûr s
{
üü 	
if
†† 
(
†† 
values
†† 
.
†† 
Count
†† 
==
†† 
$num
††  !
)
††! "
{
°° 
values
¢¢ 
.
¢¢ 
AddRange
¢¢ 
(
¢¢  
	newValues
¢¢  )
.
¢¢) *
Select
¢¢* 0
(
¢¢0 1
x
¢¢1 2
=>
¢¢3 5
(
¢¢6 7
object
¢¢7 =
)
¢¢= >
Convert
¢¢> E
.
¢¢E F
ToDouble
¢¢F N
(
¢¢N O
x
¢¢O P
)
¢¢P Q
)
¢¢Q R
)
¢¢R S
;
¢¢S T
return
££ 
;
££ 
}
§§ 
if
¶¶ 
(
¶¶ 
Model
¶¶ 
.
¶¶ 
Labels
¶¶ 
.
¶¶ 
Last
¶¶ !
(
¶¶! "
)
¶¶" #
==
¶¶$ &
Klines
¶¶' -
.
¶¶- .
Last
¶¶. 2
(
¶¶2 3
)
¶¶3 4
.
¶¶4 5
	_OpenDate
¶¶5 >
.
¶¶> ?
ToString
¶¶? G
(
¶¶G H
$str
¶¶H N
)
¶¶N O
)
¶¶O P
{
ßß 
values
®® 
[
®® 
^
®® 
$num
®® 
]
®® 
=
®® 
	newValues
®® &
.
®®& '
Last
®®' +
(
®®+ ,
)
®®, -
;
®®- .
return
©© 
;
©© 
}
™™ 
values
¨¨ 
.
¨¨ 
Add
¨¨ 
(
¨¨ 
	newValues
¨¨  
.
¨¨  !
Last
¨¨! %
(
¨¨% &
)
¨¨& '
)
¨¨' (
;
¨¨( )
}
≠≠ 	
public
±± 
void
±± -
UserSymbolsListSelectionChanged
±± 3
(
±±3 4
)
±±4 5
{
≤≤ 	
Model
≥≥ 
.
≥≥ !
AddUserSymbolString
≥≥ %
=
≥≥& '
Model
≥≥( -
.
≥≥- . 
SelectedUserSymbol
≥≥. @
?
≥≥@ A
.
≥≥A B
Key
≥≥B E
;
≥≥E F
}
¥¥ 	
public
∂∂ 
void
∂∂ 
AddUser
∂∂ 
(
∂∂ 
)
∂∂ 
{
∑∑ 	
try
∏∏ 
{
ππ 
if
∫∫ 
(
∫∫ 
!
∫∫ 

Connection
∫∫ 
.
∫∫  
Context
∫∫  '
.
∫∫' (
Users
∫∫( -
.
∫∫- .
Any
∫∫. 1
(
∫∫1 2
x
∫∫2 3
=>
∫∫4 6
x
∫∫7 8
.
∫∫8 9
Username
∫∫9 A
==
∫∫B D
Model
∫∫E J
.
∫∫J K
AddUserString
∫∫K X
)
∫∫X Y
)
∫∫Y Z
{
ªª 
User
ºº 
?
ºº 
user
ºº 
=
ºº  
new
ºº! $
User
ºº% )
(
ºº) *
Model
ºº* /
.
ºº/ 0
AddUserString
ºº0 =
??
ºº> @
$str
ººA C
)
ººC D
{
ººE F
TDI
ººG J
=
ººK L
true
ººM Q
}
ººR S
;
ººS T

Connection
ΩΩ 
.
ΩΩ 
Context
ΩΩ &
.
ΩΩ& '

CreateUser
ΩΩ' 1
(
ΩΩ1 2
user
ΩΩ2 6
)
ΩΩ6 7
;
ΩΩ7 8
Model
ææ 
.
ææ 
SelectedUser
ææ &
=
ææ' (
user
ææ) -
;
ææ- .

MessageBox
øø 
.
øø 
Show
øø #
(
øø# $
$str
øø$ B
,
øøB C
$str
øøD W
,
øøW X
MessageBoxButton
øøY i
.
øøi j
OK
øøj l
)
øøl m
;
øøm n
}
¿¿ 
else
¡¡ 
if
¡¡ 
(
¡¡ 

Connection
¡¡ #
.
¡¡# $
Context
¡¡$ +
.
¡¡+ ,
Users
¡¡, 1
.
¡¡1 2
Any
¡¡2 5
(
¡¡5 6
x
¡¡6 7
=>
¡¡8 :
x
¡¡; <
.
¡¡< =
Username
¡¡= E
==
¡¡F H
Model
¡¡I N
.
¡¡N O
AddUserString
¡¡O \
&&
¡¡] _
x
¡¡` a
.
¡¡a b
TDI
¡¡b e
==
¡¡f h
false
¡¡i n
)
¡¡n o
)
¡¡o p
{
¬¬ 
User
√√ 
?
√√ 
user
√√ 
=
√√  

Connection
√√! +
.
√√+ ,
Context
√√, 3
.
√√3 4
Users
√√4 9
.
√√9 :
First
√√: ?
(
√√? @
x
√√@ A
=>
√√B D
x
√√E F
.
√√F G
Username
√√G O
==
√√P R
Model
√√S X
.
√√X Y
AddUserString
√√Y f
&&
√√g i
x
√√j k
.
√√k l
TDI
√√l o
==
√√p r
false
√√s x
)
√√x y
;
√√y z
user
ƒƒ 
.
ƒƒ 
TDI
ƒƒ 
=
ƒƒ 
true
ƒƒ #
;
ƒƒ# $

Connection
≈≈ 
.
≈≈ 
Context
≈≈ &
.
≈≈& '
SaveChanges
≈≈' 2
(
≈≈2 3
)
≈≈3 4
;
≈≈4 5
Model
∆∆ 
.
∆∆ 
SelectedUser
∆∆ &
=
∆∆' (
user
∆∆) -
;
∆∆- .

MessageBox
«« 
.
«« 
Show
«« #
(
««# $
$str
««$ B
,
««B C
$str
««D W
,
««W X
MessageBoxButton
««Y i
.
««i j
OK
««j l
)
««l m
;
««m n
}
»» 
else
…… 
{
   
User
ÀÀ 
user
ÀÀ 
=
ÀÀ 

Connection
ÀÀ  *
.
ÀÀ* +
Context
ÀÀ+ 2
.
ÀÀ2 3
Users
ÀÀ3 8
.
ÀÀ8 9
First
ÀÀ9 >
(
ÀÀ> ?
x
ÀÀ? @
=>
ÀÀA C
x
ÀÀD E
.
ÀÀE F
Username
ÀÀF N
==
ÀÀO Q
Model
ÀÀR W
.
ÀÀW X
AddUserString
ÀÀX e
)
ÀÀe f
;
ÀÀf g
Model
ÃÃ 
.
ÃÃ 
SelectedUser
ÃÃ &
=
ÃÃ' (
user
ÃÃ) -
;
ÃÃ- .
}
ÕÕ 
}
ŒŒ 
catch
œœ 
(
œœ 
	Exception
œœ 
ex
œœ 
)
œœ  
{
–– 

MessageBox
—— 
.
—— 
Show
—— 
(
——  
$"
——  "
$str
——" ;
{
——; <
ex
——< >
.
——> ?
Message
——? F
}
——F G
"
——G H
,
——H I
$str
——J P
,
——P Q
MessageBoxButton
——R b
.
——b c
OK
——c e
,
——e f
MessageBoxImage
——g v
.
——v w
Error
——w |
)
——| }
;
——} ~
}
““ 
}
”” 	
public
’’ 
void
’’ 
DelUser
’’ 
(
’’ 
)
’’ 
{
÷÷ 	
try
◊◊ 
{
ÿÿ 
if
ŸŸ 
(
ŸŸ 
Model
ŸŸ 
.
ŸŸ 
SelectedUser
ŸŸ &
==
ŸŸ' )
null
ŸŸ* .
)
ŸŸ. /
return
ŸŸ0 6
;
ŸŸ6 7
User
⁄⁄ 
?
⁄⁄ 
user
⁄⁄ 
=
⁄⁄ 

Connection
⁄⁄ '
.
⁄⁄' (
Context
⁄⁄( /
.
⁄⁄/ 0
Users
⁄⁄0 5
.
⁄⁄5 6
First
⁄⁄6 ;
(
⁄⁄; <
x
⁄⁄< =
=>
⁄⁄> @
x
⁄⁄A B
.
⁄⁄B C
Username
⁄⁄C K
==
⁄⁄L N
Model
⁄⁄O T
.
⁄⁄T U
SelectedUser
⁄⁄U a
.
⁄⁄a b
Username
⁄⁄b j
)
⁄⁄j k
;
⁄⁄k l
user
€€ 
.
€€ 
TDI
€€ 
=
€€ 
false
€€  
;
€€  !

Connection
‹‹ 
.
‹‹ 
Context
‹‹ "
.
‹‹" #
SaveChanges
‹‹# .
(
‹‹. /
)
‹‹/ 0
;
‹‹0 1
Model
›› 
.
›› 
SelectedUser
›› "
=
››# $
user
››% )
;
››) *

MessageBox
ﬂﬂ 
.
ﬂﬂ 
Show
ﬂﬂ 
(
ﬂﬂ  
$str
ﬂﬂ  >
,
ﬂﬂ> ?
$str
ﬂﬂ@ S
,
ﬂﬂS T
MessageBoxButton
ﬂﬂU e
.
ﬂﬂe f
OK
ﬂﬂf h
)
ﬂﬂh i
;
ﬂﬂi j
}
‡‡ 
catch
·· 
(
·· 
	Exception
·· 
ex
·· 
)
··  
{
‚‚ 

MessageBox
„„ 
.
„„ 
Show
„„ 
(
„„  
$"
„„  "
$str
„„" ;
{
„„; <
ex
„„< >
.
„„> ?
Message
„„? F
}
„„F G
"
„„G H
,
„„H I
$str
„„J P
,
„„P Q
MessageBoxButton
„„R b
.
„„b c
OK
„„c e
,
„„e f
MessageBoxImage
„„g v
.
„„v w
Error
„„w |
)
„„| }
;
„„} ~
}
‰‰ 
}
ÂÂ 	
public
ÁÁ 
void
ÁÁ 
AddUserSymbol
ÁÁ !
(
ÁÁ! "
)
ÁÁ" #
{
ËË 	
try
ÈÈ 
{
ÍÍ 
if
ÎÎ 
(
ÎÎ 
Model
ÎÎ 
.
ÎÎ 
SelectedUser
ÎÎ &
==
ÎÎ' )
null
ÎÎ* .
)
ÎÎ. /
return
ÎÎ0 6
;
ÎÎ6 7
bool
ÏÏ 
showMessage
ÏÏ  
=
ÏÏ! "
false
ÏÏ# (
;
ÏÏ( )
if
ÓÓ 
(
ÓÓ 
Model
ÓÓ 
.
ÓÓ 
SelectedUser
ÓÓ &
.
ÓÓ& '

TDISymbols
ÓÓ' 1
.
ÓÓ1 2
Any
ÓÓ2 5
(
ÓÓ5 6
x
ÓÓ6 7
=>
ÓÓ8 :
x
ÓÓ; <
.
ÓÓ< =
Key
ÓÓ= @
.
ÓÓ@ A
Equals
ÓÓA G
(
ÓÓG H
Model
ÓÓH M
.
ÓÓM N!
AddUserSymbolString
ÓÓN a
)
ÓÓa b
)
ÓÓb c
)
ÓÓc d
{
ÔÔ 
int
 
addDays
 
=
  !
Model
" '
.
' (
AddUserDays
( 3
==
4 6
$num
7 8
?
9 :
$num
; A
:
B C
Model
D I
.
I J
AddUserDays
J U
;
U V
DateTime
ÚÚ 
newDate
ÚÚ $
=
ÚÚ% &
Model
ÚÚ' ,
.
ÚÚ, -
SelectedUser
ÚÚ- 9
.
ÚÚ9 :

TDISymbols
ÚÚ: D
.
ÚÚD E
First
ÚÚE J
(
ÚÚJ K
x
ÚÚK L
=>
ÚÚM O
x
ÚÚP Q
.
ÚÚQ R
Key
ÚÚR U
.
ÚÚU V
Equals
ÚÚV \
(
ÚÚ\ ]
Model
ÚÚ] b
.
ÚÚb c!
AddUserSymbolString
ÚÚc v
)
ÚÚv w
)
ÚÚw x
.
ÚÚx y
Value
ÚÚy ~
>=ÚÚ Å
DateTimeÚÚÇ ä
.ÚÚä ã
NowÚÚã é
?ÚÚè ê
Model
ÛÛ 
.
ÛÛ 
SelectedUser
ÛÛ *
.
ÛÛ* +

TDISymbols
ÛÛ+ 5
.
ÛÛ5 6
First
ÛÛ6 ;
(
ÛÛ; <
x
ÛÛ< =
=>
ÛÛ> @
x
ÛÛA B
.
ÛÛB C
Key
ÛÛC F
.
ÛÛF G
Equals
ÛÛG M
(
ÛÛM N
Model
ÛÛN S
.
ÛÛS T!
AddUserSymbolString
ÛÛT g
)
ÛÛg h
)
ÛÛh i
.
ÛÛi j
Value
ÛÛj o
.
ÛÛo p
AddDays
ÛÛp w
(
ÛÛw x
addDays
ÛÛx 
)ÛÛ Ä
:ÛÛÅ Ç
DateTime
ÙÙ  
.
ÙÙ  !
Now
ÙÙ! $
.
ÙÙ$ %
AddDays
ÙÙ% ,
(
ÙÙ, -
addDays
ÙÙ- 4
)
ÙÙ4 5
;
ÙÙ5 6
Model
ˆˆ 
.
ˆˆ 
SelectedUser
ˆˆ &
.
ˆˆ& '

TDISymbols
ˆˆ' 1
[
ˆˆ1 2
Model
ˆˆ2 7
.
ˆˆ7 8!
AddUserSymbolString
ˆˆ8 K
??
ˆˆL N
$str
ˆˆO Q
]
ˆˆQ R
=
ˆˆS T
newDate
ˆˆU \
;
ˆˆ\ ]
}
˜˜ 
else
¯¯ 
{
˘˘ 
Model
˙˙ 
.
˙˙ 
SelectedUser
˙˙ &
.
˙˙& '

TDISymbols
˙˙' 1
.
˙˙1 2
Add
˙˙2 5
(
˙˙5 6
Model
˙˙6 ;
.
˙˙; <!
AddUserSymbolString
˙˙< O
??
˙˙P R
$str
˙˙S U
,
˙˙U V
DateTime
˙˙W _
.
˙˙_ `
Now
˙˙` c
.
˙˙c d
AddDays
˙˙d k
(
˙˙k l
Model
˙˙l q
.
˙˙q r
AddUserDays
˙˙r }
)
˙˙} ~
)
˙˙~ 
;˙˙ Ä
showMessage
˚˚ 
=
˚˚  !
true
˚˚" &
;
˚˚& '
}
¸¸ 
Model
˛˛ 
.
˛˛ 
SelectedUser
˛˛ "
.
˛˛" #
SaveUserSymbols
˛˛# 2
(
˛˛2 3
)
˛˛3 4
;
˛˛4 5

Connection
ˇˇ 
.
ˇˇ 
Context
ˇˇ "
.
ˇˇ" #
SaveChanges
ˇˇ# .
(
ˇˇ. /
)
ˇˇ/ 0
;
ˇˇ0 1
Model
ÄÄ 
.
ÄÄ !
SelectedUserSymbols
ÄÄ )
=
ÄÄ* +
new
ÄÄ, /
(
ÄÄ/ 0
Model
ÄÄ0 5
.
ÄÄ5 6
SelectedUser
ÄÄ6 B
.
ÄÄB C

TDISymbols
ÄÄC M
)
ÄÄM N
;
ÄÄN O
if
ÇÇ 
(
ÇÇ 
showMessage
ÇÇ 
)
ÇÇ  

MessageBox
ÇÇ! +
.
ÇÇ+ ,
Show
ÇÇ, 0
(
ÇÇ0 1
$str
ÇÇ1 X
,
ÇÇX Y
$str
ÇÇZ j
,
ÇÇj k
MessageBoxButton
ÇÇl |
.
ÇÇ| }
OK
ÇÇ} 
)ÇÇ Ä
;ÇÇÄ Å
}
ÑÑ 
catch
ÖÖ 
(
ÖÖ 
	Exception
ÖÖ 
ex
ÖÖ 
)
ÖÖ  
{
ÜÜ 

MessageBox
áá 
.
áá 
Show
áá 
(
áá  
$"
áá  "
$str
áá" ;
{
áá; <
ex
áá< >
.
áá> ?
Message
áá? F
}
ááF G
"
ááG H
,
ááH I
$str
ááJ P
,
ááP Q
MessageBoxButton
ááR b
.
ááb c
OK
áác e
,
ááe f
MessageBoxImage
áág v
.
ááv w
Error
ááw |
)
áá| }
;
áá} ~
}
àà 
}
ââ 	
public
ãã 
void
ãã 
DelUserSymbol
ãã !
(
ãã! "
)
ãã" #
{
åå 	
try
çç 
{
éé 
if
èè 
(
èè 
Model
èè 
.
èè 
SelectedUser
èè &
==
èè' )
null
èè* .
||
èè/ 1
Model
èè2 7
.
èè7 8!
SelectedUserSymbols
èè8 K
?
èèK L
.
èèL M
Count
èèM R
==
èèS U
$num
èèV W
)
èèW X
return
èèY _
;
èè_ `
Model
ëë 
.
ëë 
SelectedUser
ëë "
.
ëë" #

TDISymbols
ëë# -
.
ëë- .
Remove
ëë. 4
(
ëë4 5
Model
ëë5 :
.
ëë: ; 
SelectedUserSymbol
ëë; M
?
ëëM N
.
ëëN O
Key
ëëO R
??
ëëS U
$str
ëëV X
)
ëëX Y
;
ëëY Z
Model
íí 
.
íí 
SelectedUser
íí "
.
íí" #
SaveUserSymbols
íí# 2
(
íí2 3
)
íí3 4
;
íí4 5

Connection
ìì 
.
ìì 
Context
ìì "
.
ìì" #
SaveChanges
ìì# .
(
ìì. /
)
ìì/ 0
;
ìì0 1
Model
ïï 
.
ïï !
SelectedUserSymbols
ïï )
=
ïï* +
new
ïï, /
(
ïï/ 0
Model
ïï0 5
.
ïï5 6
SelectedUser
ïï6 B
.
ïïB C

TDISymbols
ïïC M
)
ïïM N
;
ïïN O

MessageBox
ññ 
.
ññ 
Show
ññ 
(
ññ  
$str
ññ  ;
,
ññ; <
$str
ññ= P
,
ññP Q
MessageBoxButton
ññR b
.
ññb c
OK
ññc e
)
ññe f
;
ññf g
}
óó 
catch
òò 
(
òò 
	Exception
òò 
ex
òò 
)
òò  
{
ôô 

MessageBox
öö 
.
öö 
Show
öö 
(
öö  
$"
öö  "
$str
öö" ;
{
öö; <
ex
öö< >
.
öö> ?
Message
öö? F
}
ööF G
"
ööG H
,
ööH I
$str
ööJ P
,
ööP Q
MessageBoxButton
ööR b
.
ööb c
OK
ööc e
,
ööe f
MessageBoxImage
öög v
.
ööv w
Error
ööw |
)
öö| }
;
öö} ~
}
õõ 
}
úú 	
public
ûû 
void
ûû 
AddGroup
ûû 
(
ûû 
)
ûû 
{
üü 	
if
†† 
(
†† 
string
†† 
.
†† 
IsNullOrEmpty
†† $
(
††$ %
Model
††% *
.
††* +
AddGroupString
††+ 9
)
††9 :
)
††: ;
return
††< B
;
††B C
Settings
°° 
.
°° 
TelegramSettings
°° %
.
°°% &
	TDIGroups
°°& /
.
°°/ 0
Add
°°0 3
(
°°3 4
Model
°°4 9
.
°°9 :
AddGroupString
°°: H
)
°°H I
;
°°I J
Settings
¢¢ 
.
¢¢ 
SaveSettings
¢¢ !
(
¢¢! "
)
¢¢" #
;
¢¢# $

MessageBox
££ 
.
££ 
Show
££ 
(
££ 
$str
££ 4
,
££4 5
$str
££6 D
,
££D E
MessageBoxButton
££F V
.
££V W
OK
££W Y
)
££Y Z
;
££Z [
}
§§ 	
public
¶¶ 
void
¶¶ 
DelGroup
¶¶ 
(
¶¶ 
)
¶¶ 
{
ßß 	
Settings
®® 
.
®® 
TelegramSettings
®® %
.
®®% &
	TDIGroups
®®& /
.
®®/ 0
Remove
®®0 6
(
®®6 7
Model
®®7 <
.
®®< =
SelectedGroup
®®= J
??
®®K M
$str
®®N P
)
®®P Q
;
®®Q R
Settings
©© 
.
©© 
SaveSettings
©© !
(
©©! "
)
©©" #
;
©©# $

MessageBox
™™ 
.
™™ 
Show
™™ 
(
™™ 
$str
™™ 4
,
™™4 5
$str
™™6 D
,
™™D E
MessageBoxButton
™™F V
.
™™V W
OK
™™W Y
)
™™Y Z
;
™™Z [
}
´´ 	
public
ØØ 
void
ØØ 
	DelSymbol
ØØ 
(
ØØ 
)
ØØ 
{
∞∞ 	
if
±± 
(
±± 
Model
±± 
.
±± 
SelectedSymbol
±± $
==
±±% '
null
±±( ,
)
±±, -
return
±±. 4
;
±±4 5
string
≤≤ 
?
≤≤ 
symbol
≤≤ 
=
≤≤ 
Model
≤≤ "
.
≤≤" #
SelectedSymbol
≤≤# 1
.
≤≤1 2
Symbol
≤≤2 8
;
≤≤8 9
Settings
¥¥ 
.
¥¥ 
BotsSettings
¥¥ !
.
¥¥! "
TDISettings
¥¥" -
.
¥¥- .
Symbols
¥¥. 5
.
¥¥5 6
Remove
¥¥6 <
(
¥¥< =
Model
¥¥= B
.
¥¥B C
SelectedSymbol
¥¥C Q
.
¥¥Q R
Symbol
¥¥R X
)
¥¥X Y
;
¥¥Y Z
Model
µµ 
.
µµ 
SelectedSymbol
µµ  
.
µµ  !
Dispose
µµ! (
(
µµ( )
)
µµ) *
;
µµ* +
Settings
∑∑ 
.
∑∑ 
BotsSettings
∑∑ !
.
∑∑! "
TDISettings
∑∑" -
.
∑∑- .
Symbols
∑∑. 5
.
∑∑5 6
Remove
∑∑6 <
(
∑∑< =
Model
∑∑= B
.
∑∑B C
SelectedSymbol
∑∑C Q
.
∑∑Q R
Symbol
∑∑R X
)
∑∑X Y
;
∑∑Y Z
Settings
∏∏ 
.
∏∏ 
SaveSettings
∏∏ !
(
∏∏! "
)
∏∏" #
;
∏∏# $
Model
∫∫ 
.
∫∫ 
Symbols
∫∫ 
.
∫∫ 
Remove
∫∫  
(
∫∫  !
Model
∫∫! &
.
∫∫& '
SelectedSymbol
∫∫' 5
)
∫∫5 6
;
∫∫6 7
if
ΩΩ 
(
ΩΩ 
Model
ΩΩ 
.
ΩΩ 
UISymbol
ΩΩ 
==
ΩΩ !
symbol
ΩΩ" (
&&
ΩΩ) +
Model
ΩΩ, 1
.
ΩΩ1 2
Symbols
ΩΩ2 9
.
ΩΩ9 :
Count
ΩΩ: ?
>
ΩΩ@ A
$num
ΩΩB C
)
ΩΩC D
{
ææ 
Model
øø 
.
øø 
SelectedSymbol
øø $
=
øø% &
Model
øø' ,
.
øø, -
Symbols
øø- 4
[
øø4 5
$num
øø5 6
]
øø6 7
;
øø7 8
SetUISymbol
¿¿ 
(
¿¿ 
)
¿¿ 
;
¿¿ 
}
¡¡ 
}
¬¬ 	
public
ƒƒ 
void
ƒƒ 
	AddSymbol
ƒƒ 
(
ƒƒ 
)
ƒƒ 
{
≈≈ 	
try
∆∆ 
{
«« 
if
»» 
(
»» 
Model
»» 
.
»» 
Symbols
»» !
.
»»! "
Any
»»" %
(
»»% &
x
»»& '
=>
»»( *
x
»»+ ,
.
»», -
Symbol
»»- 3
==
»»4 6
Model
»»7 <
.
»»< =
AddSymbolString
»»= L
)
»»L M
)
»»M N
{
…… 

MessageBox
   
.
   
Show
   #
(
  # $
$str
  $ =
,
  = >
$str
  ? N
,
  N O
MessageBoxButton
  P `
.
  ` a
OK
  a c
,
  c d
MessageBoxImage
  e t
.
  t u
Information  u Ä
)  Ä Å
;  Å Ç
return
ÀÀ 
;
ÀÀ 
}
ÃÃ 

_AddSymbol
ŒŒ 
(
ŒŒ 
Model
ŒŒ  
.
ŒŒ  !
AddSymbolString
ŒŒ! 0
??
ŒŒ1 3
$str
ŒŒ4 6
)
ŒŒ6 7
;
ŒŒ7 8

MessageBox
œœ 
.
œœ 
Show
œœ 
(
œœ  
$str
œœ  ;
,
œœ; <
$str
œœ= M
,
œœM N
MessageBoxButton
œœO _
.
œœ_ `
OK
œœ` b
)
œœb c
;
œœc d
}
–– 
catch
—— 
(
—— 
	Exception
—— 
ex
—— 
)
——  
{
““ 

MessageBox
”” 
.
”” 
Show
”” 
(
””  
$"
””  "
$str
””" ;
{
””; <
ex
””< >
.
””> ?
Message
””? F
}
””F G
"
””G H
,
””H I
$str
””J P
,
””P Q
MessageBoxButton
””R b
.
””b c
OK
””c e
,
””e f
MessageBoxImage
””g v
.
””v w
Error
””w |
)
””| }
;
””} ~
}
‘‘ 
}
’’ 	
private
◊◊ 
void
◊◊ 

_AddSymbol
◊◊ 
(
◊◊  
string
◊◊  &
symbol
◊◊' -
)
◊◊- .
{
ÿÿ 	
Model
ŸŸ 
.
ŸŸ 
Symbols
ŸŸ 
.
ŸŸ 
Add
ŸŸ 
(
ŸŸ 
new
ŸŸ !
TDI
ŸŸ" %
(
ŸŸ% &
symbol
ŸŸ& ,
,
ŸŸ, -
Model
ŸŸ. 3
.
ŸŸ3 4
KlineInterval
ŸŸ4 A
,
ŸŸA B
(
ŸŸC D
string
ŸŸD J
symbol
ŸŸK Q
,
ŸŸQ R

Dictionary
ŸŸS ]
<
ŸŸ] ^
string
ŸŸ^ d
,
ŸŸd e
List
ŸŸf j
<
ŸŸj k
object
ŸŸk q
>
ŸŸq r
>
ŸŸr s
values
ŸŸt z
)
ŸŸz {
=>
ŸŸ| ~
{ŸŸ Ä
}ŸŸÅ Ç
,ŸŸÇ É!
SendSignalMessageŸŸÑ ï
)ŸŸï ñ
{ŸŸó ò
}ŸŸô ö
)ŸŸö õ
;ŸŸõ ú
Settings
⁄⁄ 
.
⁄⁄ 
BotsSettings
⁄⁄ !
.
⁄⁄! "
TDISettings
⁄⁄" -
.
⁄⁄- .
Symbols
⁄⁄. 5
.
⁄⁄5 6
Add
⁄⁄6 9
(
⁄⁄9 :
symbol
⁄⁄: @
)
⁄⁄@ A
;
⁄⁄A B
Settings
€€ 
.
€€ 
SaveSettings
€€ !
(
€€! "
)
€€" #
;
€€# $
}
‹‹ 	
public
ﬁﬁ 
Task
ﬁﬁ 
AddAllSymbols
ﬁﬁ !
(
ﬁﬁ! "
)
ﬁﬁ" #
{
ﬂﬂ 	
CryptoExchange
‡‡ 
.
‡‡ 
Net
‡‡ 
.
‡‡ 
Objects
‡‡ &
.
‡‡& '
WebCallResult
‡‡' 4
<
‡‡4 5
Binance
‡‡5 <
.
‡‡< =
Net
‡‡= @
.
‡‡@ A
Objects
‡‡A H
.
‡‡H I
Models
‡‡I O
.
‡‡O P
Spot
‡‡P T
.
‡‡T U!
BinanceExchangeInfo
‡‡U h
>
‡‡h i
?
‡‡i j
exchangeInfos
‡‡k x
=
‡‡y z
StaticBinance‡‡{ à
.‡‡à â
Client‡‡â è
.‡‡è ê
SpotApi‡‡ê ó
.‡‡ó ò
ExchangeData‡‡ò §
.‡‡§ •$
GetExchangeInfoAsync‡‡• π
(‡‡π ∫
)‡‡∫ ª
.‡‡ª º
Result‡‡º ¬
;‡‡¬ √
Model
·· 
.
·· 
Symbols
·· 
.
·· 
Clear
·· 
(
··  
)
··  !
;
··! "
Settings
‚‚ 
.
‚‚ 
BotsSettings
‚‚ !
.
‚‚! "
TDISettings
‚‚" -
.
‚‚- .
Symbols
‚‚. 5
.
‚‚5 6
Clear
‚‚6 ;
(
‚‚; <
)
‚‚< =
;
‚‚= >
exchangeInfos
„„ 
.
„„ 
Data
„„ 
.
„„ 
Symbols
„„ &
.
„„& '
ToList
„„' -
(
„„- .
)
„„. /
.
„„/ 0
ForEach
„„0 7
(
„„7 8
x
„„8 9
=>
„„: <
{
‰‰ 
try
ÂÂ 
{
ÊÊ 

_AddSymbol
ÁÁ 
(
ÁÁ 
x
ÁÁ  
.
ÁÁ  !
Name
ÁÁ! %
)
ÁÁ% &
;
ÁÁ& '
}
ËË 
catch
ÈÈ 
(
ÈÈ 
	Exception
ÈÈ  
ex
ÈÈ! #
)
ÈÈ# $
{
ÍÍ 

MessageBox
ÎÎ 
.
ÎÎ 
Show
ÎÎ #
(
ÎÎ# $
$"
ÎÎ$ &
{
ÎÎ& '
x
ÎÎ' (
.
ÎÎ( )
Name
ÎÎ) -
}
ÎÎ- .
$str
ÎÎ. S
{
ÎÎS T
ex
ÎÎT V
.
ÎÎV W
Message
ÎÎW ^
}
ÎÎ^ _
"
ÎÎ_ `
,
ÎÎ` a
$str
ÎÎb h
,
ÎÎh i
MessageBoxButton
ÎÎj z
.
ÎÎz {
OK
ÎÎ{ }
,
ÎÎ} ~
MessageBoxImageÎÎ é
.ÎÎé è
ErrorÎÎè î
)ÎÎî ï
;ÎÎï ñ
}
ÏÏ 
}
ÌÌ 
)
ÌÌ 
;
ÌÌ 
return
ÔÔ 
Task
ÔÔ 
.
ÔÔ 
Delay
ÔÔ 
(
ÔÔ 
$num
ÔÔ 
)
ÔÔ  
;
ÔÔ  !
}
 	
public
ÙÙ 
void
ÙÙ 
SendSignalMessage
ÙÙ %
(
ÙÙ% &
string
ÙÙ& ,
symbol
ÙÙ- 3
,
ÙÙ3 4

Dictionary
ÙÙ5 ?
<
ÙÙ? @
string
ÙÙ@ F
,
ÙÙF G
List
ÙÙH L
<
ÙÙL M
object
ÙÙM S
>
ÙÙS T
>
ÙÙT U
values
ÙÙV \
,
ÙÙ\ ]
Enums
ÙÙ^ c
.
ÙÙc d

SignalType
ÙÙd n
type
ÙÙo s
)
ÙÙs t
{
ıı 	
string
ˆˆ 
message
ˆˆ 
=
ˆˆ 
type
ˆˆ !
switch
ˆˆ" (
{
˜˜ 
Enums
¯¯ 
.
¯¯ 

SignalType
¯¯  
.
¯¯  !
Sell
¯¯! %
=>
¯¯& (
Settings
¯¯) 1
.
¯¯1 2
BotsSettings
¯¯2 >
.
¯¯> ?
TDISettings
¯¯? J
.
¯¯J K
SignalMessages
¯¯K Y
.
¯¯Y Z
Sell
¯¯Z ^
,
¯¯^ _
Enums
˘˘ 
.
˘˘ 

SignalType
˘˘  
.
˘˘  !
Buy
˘˘! $
=>
˘˘% '
Settings
˘˘( 0
.
˘˘0 1
BotsSettings
˘˘1 =
.
˘˘= >
TDISettings
˘˘> I
.
˘˘I J
SignalMessages
˘˘J X
.
˘˘X Y
Buy
˘˘Y \
,
˘˘\ ]
Enums
˙˙ 
.
˙˙ 

SignalType
˙˙  
.
˙˙  !
Exit
˙˙! %
=>
˙˙& (
Settings
˙˙) 1
.
˙˙1 2
BotsSettings
˙˙2 >
.
˙˙> ?
TDISettings
˙˙? J
.
˙˙J K
SignalMessages
˙˙K Y
.
˙˙Y Z
Exit
˙˙Z ^
,
˙˙^ _
_
˚˚ 
=>
˚˚ 
$str
˚˚ 
,
˚˚ 
}
¸¸ 
;
¸¸ 
if
˛˛ 
(
˛˛ 
string
˛˛ 
.
˛˛ 
IsNullOrEmpty
˛˛ $
(
˛˛$ %
message
˛˛% ,
)
˛˛, -
)
˛˛- .
return
˛˛/ 5
;
˛˛5 6
message
ÄÄ 
=
ÄÄ 
message
ÄÄ 
.
ÄÄ 
Replace
ÄÄ %
(
ÄÄ% &
$str
ÄÄ& 0
,
ÄÄ0 1
symbol
ÄÄ2 8
)
ÄÄ8 9
.
ÄÄ9 :
Replace
ÄÄ: A
(
ÄÄA B
$str
ÄÄB K
,
ÄÄK L
Math
ÄÄM Q
.
ÄÄQ R
Round
ÄÄR W
(
ÄÄW X
(
ÄÄX Y
(
ÄÄY Z
Kline
ÄÄZ _
)
ÄÄ_ `
values
ÄÄ` f
[
ÄÄf g
$str
ÄÄg o
]
ÄÄo p
.
ÄÄp q
Last
ÄÄq u
(
ÄÄu v
)
ÄÄv w
)
ÄÄw x
.
ÄÄx y
Close
ÄÄy ~
,
ÄÄ~ 
$numÄÄÄ Å
)ÄÄÅ Ç
.ÄÄÇ É
ToStringÄÄÉ ã
(ÄÄã å
)ÄÄå ç
)ÄÄç é
;ÄÄé è
foreach
ÇÇ 
(
ÇÇ 
User
ÇÇ 
user
ÇÇ 
in
ÇÇ !
Model
ÇÇ" '
.
ÇÇ' (
Users
ÇÇ( -
)
ÇÇ- .
{
ÉÉ 
try
ÑÑ 
{
ÖÖ 
if
ÜÜ 
(
ÜÜ 
user
ÜÜ 
.
ÜÜ 
ChatId
ÜÜ #
==
ÜÜ$ &
$num
ÜÜ' (
||
ÜÜ) +
!
ÜÜ, -
user
ÜÜ- 1
.
ÜÜ1 2

TDISymbols
ÜÜ2 <
.
ÜÜ< =
Any
ÜÜ= @
(
ÜÜ@ A
x
ÜÜA B
=>
ÜÜC E
x
ÜÜF G
.
ÜÜG H
Key
ÜÜH K
.
ÜÜK L
Equals
ÜÜL R
(
ÜÜR S
symbol
ÜÜS Y
)
ÜÜY Z
&&
ÜÜ[ ]
x
ÜÜ^ _
.
ÜÜ_ `
Value
ÜÜ` e
>
ÜÜf g
DateTime
ÜÜh p
.
ÜÜp q
Now
ÜÜq t
)
ÜÜt u
)
ÜÜu v
continue
ÜÜw 
;ÜÜ Ä

BotClients
áá 
.
áá 
	TDIClient
áá (
.
áá( )"
SendTextMessageAsync
áá) =
(
áá= >
user
áá> B
.
ááB C
ChatId
ááC I
,
ááI J
message
ááK R
)
ááR S
;
ááS T
}
àà 
catch
ââ 
(
ââ 
	Exception
ââ  
ex
ââ! #
)
ââ# $
{
ää 
Console
ãã 
.
ãã 
	WriteLine
ãã %
(
ãã% &
$"
ãã& (
$str
ãã( 9
{
ãã9 :
user
ãã: >
.
ãã> ?
Username
ãã? G
}
ããG H
$str
ããH c
{
ããc d
ex
ããd f
.
ããf g
Message
ããg n
}
ããn o
"
ãão p
)
ããp q
;
ããq r
}
åå 
}
éé 
foreach
êê 
(
êê 
string
êê 
?
êê 
group
êê "
in
êê# %
Settings
êê& .
.
êê. /
TelegramSettings
êê/ ?
.
êê? @
	TDIGroups
êê@ I
)
êêI J
{
ëë 
try
íí 
{
ìì 

BotClients
îî 
.
îî 
	TDIClient
îî (
.
îî( )"
SendTextMessageAsync
îî) =
(
îî= >
group
îî> C
,
îîC D
message
îîE L
)
îîL M
;
îîM N
}
ïï 
catch
ññ 
(
ññ 
	Exception
ññ  
ex
ññ! #
)
ññ# $
{
óó 
Console
òò 
.
òò 
	WriteLine
òò %
(
òò% &
$"
òò& (
$str
òò( 8
{
òò8 9
group
òò9 >
}
òò> ?
$str
òò? Z
{
òòZ [
ex
òò[ ]
.
òò] ^
Message
òò^ e
}
òòe f
"
òòf g
)
òòg h
;
òòh i
}
ôô 
}
öö 
}
õõ 	
public
üü 
void
üü 
SaveSettings
üü  
(
üü  !
)
üü! "
{
†† 	
Settings
°° 
.
°° 
BotsSettings
°° !
.
°°! "
TDISettings
°°" -
.
°°- .
SignalMessages
°°. <
.
°°< =
Sell
°°= A
=
°°B C
Model
°°D I
.
°°I J
SellSignalString
°°J Z
;
°°Z [
Settings
¢¢ 
.
¢¢ 
BotsSettings
¢¢ !
.
¢¢! "
TDISettings
¢¢" -
.
¢¢- .
SignalMessages
¢¢. <
.
¢¢< =
Buy
¢¢= @
=
¢¢A B
Model
¢¢C H
.
¢¢H I
BuySignalString
¢¢I X
;
¢¢X Y
Settings
££ 
.
££ 
BotsSettings
££ !
.
££! "
TDISettings
££" -
.
££- .
SignalMessages
££. <
.
££< =
Exit
££= A
=
££B C
Model
££D I
.
££I J
ExitSignalString
££J Z
;
££Z [
Settings
•• 
.
•• 
BotsSettings
•• !
.
••! "
TDISettings
••" -
.
••- .
	RSIPeriot
••. 7
=
••8 9
Model
••: ?
.
••? @
	RSIPeriot
••@ I
;
••I J
Settings
¶¶ 
.
¶¶ 
BotsSettings
¶¶ !
.
¶¶! "
TDISettings
¶¶" -
.
¶¶- .
RSIPLPeriot
¶¶. 9
=
¶¶: ;
Model
¶¶< A
.
¶¶A B
RSIPLPeriot
¶¶B M
;
¶¶M N
Settings
ßß 
.
ßß 
BotsSettings
ßß !
.
ßß! "
TDISettings
ßß" -
.
ßß- . 
VotalityBandPeriot
ßß. @
=
ßßA B
Model
ßßC H
.
ßßH I
VBPeriot
ßßI Q
;
ßßQ R
Settings
®® 
.
®® 
BotsSettings
®® !
.
®®! "
TDISettings
®®" -
.
®®- .
	TSLPeriot
®®. 7
=
®®8 9
Model
®®: ?
.
®®? @
	TSLPeriot
®®@ I
;
®®I J
Settings
©© 
.
©© 
BotsSettings
©© !
.
©©! "
TDISettings
©©" -
.
©©- .
RSIOversoldLevel
©©. >
=
©©? @
Model
©©A F
.
©©F G
RSIOversoldLevel
©©G W
;
©©W X
Settings
™™ 
.
™™ 
BotsSettings
™™ !
.
™™! "
TDISettings
™™" -
.
™™- . 
RSIOverboughtLevet
™™. @
=
™™A B
Model
™™C H
.
™™H I 
RSIOverboughtLevel
™™I [
;
™™[ \
Settings
¨¨ 
.
¨¨ 
BotsSettings
¨¨ !
.
¨¨! "
TDISettings
¨¨" -
.
¨¨- .
MinSignalPeriot
¨¨. =
=
¨¨> ?
Model
¨¨@ E
.
¨¨E F
MinSignalPeriot
¨¨F U
;
¨¨U V
Settings
≠≠ 
.
≠≠ 
BotsSettings
≠≠ !
.
≠≠! "
TDISettings
≠≠" -
.
≠≠- .
KlineInterval
≠≠. ;
=
≠≠< =
Enum
≠≠> B
.
≠≠B C
GetName
≠≠C J
(
≠≠J K
typeof
≠≠K Q
(
≠≠Q R
KlineInterval
≠≠R _
)
≠≠_ `
,
≠≠` a
Model
≠≠b g
.
≠≠g h
KlineInterval
≠≠h u
)
≠≠u v
;
≠≠v w
Settings
ÆÆ 
.
ÆÆ 
SaveSettings
ÆÆ !
(
ÆÆ! "
)
ÆÆ" #
;
ÆÆ# $

MessageBox
∞∞ 
.
∞∞ 
Show
∞∞ 
(
∞∞ 
$str
∞∞ ;
,
∞∞; <
$str
∞∞= Q
,
∞∞Q R
MessageBoxButton
∞∞S c
.
∞∞c d
OK
∞∞d f
)
∞∞f g
;
∞∞g h
}
±± 	
public
≥≥ 
void
≥≥ 
LoadSettings
≥≥  
(
≥≥  !
)
≥≥! "
{
¥¥ 	
Model
µµ 
.
µµ 
SellSignalString
µµ "
=
µµ# $
Settings
µµ% -
.
µµ- .
BotsSettings
µµ. :
.
µµ: ;
TDISettings
µµ; F
.
µµF G
SignalMessages
µµG U
.
µµU V
Sell
µµV Z
;
µµZ [
Model
∂∂ 
.
∂∂ 
BuySignalString
∂∂ !
=
∂∂" #
Settings
∂∂$ ,
.
∂∂, -
BotsSettings
∂∂- 9
.
∂∂9 :
TDISettings
∂∂: E
.
∂∂E F
SignalMessages
∂∂F T
.
∂∂T U
Buy
∂∂U X
;
∂∂X Y
Model
∑∑ 
.
∑∑ 
ExitSignalString
∑∑ "
=
∑∑# $
Settings
∑∑% -
.
∑∑- .
BotsSettings
∑∑. :
.
∑∑: ;
TDISettings
∑∑; F
.
∑∑F G
SignalMessages
∑∑G U
.
∑∑U V
Exit
∑∑V Z
;
∑∑Z [
Model
ππ 
.
ππ 
	RSIPeriot
ππ 
=
ππ 
Settings
ππ &
.
ππ& '
BotsSettings
ππ' 3
.
ππ3 4
TDISettings
ππ4 ?
.
ππ? @
	RSIPeriot
ππ@ I
;
ππI J
Model
∫∫ 
.
∫∫ 
RSIPLPeriot
∫∫ 
=
∫∫ 
Settings
∫∫  (
.
∫∫( )
BotsSettings
∫∫) 5
.
∫∫5 6
TDISettings
∫∫6 A
.
∫∫A B
RSIPLPeriot
∫∫B M
;
∫∫M N
Model
ªª 
.
ªª 
	TSLPeriot
ªª 
=
ªª 
Settings
ªª &
.
ªª& '
BotsSettings
ªª' 3
.
ªª3 4
TDISettings
ªª4 ?
.
ªª? @
	TSLPeriot
ªª@ I
;
ªªI J
Model
ºº 
.
ºº 
VBPeriot
ºº 
=
ºº 
Settings
ºº %
.
ºº% &
BotsSettings
ºº& 2
.
ºº2 3
TDISettings
ºº3 >
.
ºº> ? 
VotalityBandPeriot
ºº? Q
;
ººQ R
Model
ΩΩ 
.
ΩΩ 
RSIOversoldLevel
ΩΩ "
=
ΩΩ# $
Settings
ΩΩ% -
.
ΩΩ- .
BotsSettings
ΩΩ. :
.
ΩΩ: ;
TDISettings
ΩΩ; F
.
ΩΩF G
RSIOversoldLevel
ΩΩG W
;
ΩΩW X
Model
ææ 
.
ææ  
RSIOverboughtLevel
ææ $
=
ææ% &
Settings
ææ' /
.
ææ/ 0
BotsSettings
ææ0 <
.
ææ< =
TDISettings
ææ= H
.
ææH I 
RSIOverboughtLevet
ææI [
;
ææ[ \
Model
¿¿ 
.
¿¿ 
MinSignalPeriot
¿¿ !
=
¿¿" #
Settings
¿¿$ ,
.
¿¿, -
BotsSettings
¿¿- 9
.
¿¿9 :
TDISettings
¿¿: E
.
¿¿E F
MinSignalPeriot
¿¿F U
;
¿¿U V
}
¡¡ 	
public
√√ 
void
√√ !
ChangeKlineInterval
√√ '
(
√√' (
)
√√( )
{
ƒƒ 	
MessageBoxResult
≈≈ 
change
≈≈ #
=
≈≈$ %

MessageBox
≈≈& 0
.
≈≈0 1
Show
≈≈1 5
(
≈≈5 6
$str≈≈6 €
,≈≈€ ‹
$str≈≈› Ú
,≈≈Ú Û 
MessageBoxButton≈≈Ù Ñ
.≈≈Ñ Ö
YesNo≈≈Ö ä
,≈≈ä ã
MessageBoxImage≈≈å õ
.≈≈õ ú
Warning≈≈ú £
)≈≈£ §
;≈≈§ •
if
∆∆ 
(
∆∆ 
change
∆∆ 
==
∆∆ 
MessageBoxResult
∆∆ *
.
∆∆* +
No
∆∆+ -
)
∆∆- .
{
«« 
Model
»» 
.
»» 
KlineInterval
»» #
=
»»$ %
Model
»»& +
.
»»+ ,
KlineIntervals
»», :
.
»»: ;
First
»»; @
(
»»@ A
x
»»A B
=>
»»C E
x
»»F G
.
»»G H
Equals
»»H N
(
»»N O
Model
»»O T
.
»»T U
Symbols
»»U \
.
»»\ ]
First
»»] b
(
»»b c
)
»»c d
.
»»d e
Interval
»»e m
)
»»m n
)
»»n o
;
»»o p
return
…… 
;
…… 
}
   
Model
ÃÃ 
.
ÃÃ 
Symbols
ÃÃ 
.
ÃÃ 
ToList
ÃÃ  
(
ÃÃ  !
)
ÃÃ! "
.
ÃÃ" #
ForEach
ÃÃ# *
(
ÃÃ* +
x
ÃÃ+ ,
=>
ÃÃ- /
x
ÃÃ0 1
.
ÃÃ1 2
ChangeInterval
ÃÃ2 @
(
ÃÃ@ A
Model
ÃÃA F
.
ÃÃF G
KlineInterval
ÃÃG T
)
ÃÃT U
)
ÃÃU V
;
ÃÃV W
SaveSettings
ŒŒ 
(
ŒŒ 
)
ŒŒ 
;
ŒŒ 
}
œœ 	
}
—— 
}““ ﬂ

tC:\Users\√ñmer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\UI\Views\MainWindow.xaml.cs
	namespace 	!
EASYTelegramSignalBot
 
.  
UI  "
." #
Views# (
{ 
public

 

partial

 
class

 

MainWindow

 #
:

$ %
MahApps

& -
.

- .
Metro

. 3
.

3 4
Controls

4 <
.

< =
MetroWindow

= H
{ 
[ 	
	DllImport	 
( 
$str 
) 
] 
private 
static 
extern 
void "
AllocConsole# /
(/ 0
)0 1
;1 2
public 

MainWindow 
( 
) 
{ 	
AllocConsole 
( 
) 
; 
Settings 
. 
LoadSettings !
(! "
)" #
;# $

BotClients 
. 
StartBotClients &
(& '
)' (
;( )
CryptopanicNewsBot 
_  
=! "
new# &
(& '
)' (
;( )
InitializeComponent 
(  
)  !
;! "
} 	
} 
} «
nC:\Users\√ñmer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\UI\Views\News.xaml.cs
	namespace 	!
EASYTelegramSignalBot
 
.  
UI  "
." #
Views# (
{ 
public 

partial 
class 
News 
: 
UserControl  +
{		 
public 
News 
( 
) 
{ 	
InitializeComponent 
(  
)  !
;! "
} 	
} 
} Å
mC:\Users\√ñmer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\UI\Views\PAC.xaml.cs
	namespace 	!
EASYTelegramSignalBot
 
.  
UI  "
." #
Views# (
{ 
public		 

partial		 
class		 
PAC		 
:		 
UserControl		 *
{

 
private 
bool 
isFirstLoad  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
PAC 
( 
) 
{ 	
isFirstLoad 
= 
true 
; 
InitializeComponent 
(  
)  !
;! "
isFirstLoad 
= 
false 
;  
} 	
private 
void 0
$UserSymbolsListView_SelectionChanged 9
(9 :
object: @
senderA G
,G H%
SelectionChangedEventArgsI b
ec d
)d e
{ 	
( 
( 
PACViewModel 
) 
DataContext &
)& '
.' (+
UserSymbolsListSelectionChanged( G
(G H
)H I
;I J
} 	
private 
void *
KlineInterval_SelectionChanged 3
(3 4
object4 :
sender; A
,A B%
SelectionChangedEventArgsC \
e] ^
)^ _
{ 	
if 
( 
isFirstLoad 
) 
return #
;# $
( 
( 
PACViewModel 
) 
DataContext &
)& '
.' (
ChangeKlineInterval( ;
(; <
)< =
;= >
} 	
} 
} Å
mC:\Users\√ñmer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\UI\Views\RSI.xaml.cs
	namespace 	!
EASYTelegramSignalBot
 
.  
UI  "
." #
Views# (
{ 
public		 

partial		 
class		 
RSI		 
:		 
UserControl		 *
{

 
private 
bool 
isFirstLoad  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
RSI 
( 
) 
{ 	
isFirstLoad 
= 
true 
; 
InitializeComponent 
(  
)  !
;! "
isFirstLoad 
= 
false 
;  
} 	
private 
void 0
$UserSymbolsListView_SelectionChanged 9
(9 :
object: @
senderA G
,G H%
SelectionChangedEventArgsI b
ec d
)d e
{ 	
( 
( 
RSIViewModel 
) 
DataContext &
)& '
.' (+
UserSymbolsListSelectionChanged( G
(G H
)H I
;I J
} 	
private 
void *
KlineInterval_SelectionChanged 3
(3 4
object4 :
sender; A
,A B%
SelectionChangedEventArgsC \
e] ^
)^ _
{ 	
if 
( 
isFirstLoad 
) 
return #
;# $
( 
( 
RSIViewModel 
) 
DataContext &
)& '
.' (
ChangeKlineInterval( ;
(; <
)< =
;= >
} 	
} 
} Å
mC:\Users\√ñmer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\UI\Views\TDI.xaml.cs
	namespace 	!
EASYTelegramSignalBot
 
.  
UI  "
." #
Views# (
{ 
public		 

partial		 
class		 
TDI		 
:		 
UserControl		 *
{

 
private 
bool 
isFirstLoad  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
TDI 
( 
) 
{ 	
isFirstLoad 
= 
true 
; 
InitializeComponent 
(  
)  !
;! "
isFirstLoad 
= 
false 
;  
} 	
private 
void 0
$UserSymbolsListView_SelectionChanged 9
(9 :
object: @
senderA G
,G H%
SelectionChangedEventArgsI b
ec d
)d e
{ 	
( 
( 
TDIViewModel 
) 
DataContext &
)& '
.' (+
UserSymbolsListSelectionChanged( G
(G H
)H I
;I J
} 	
private 
void *
KlineInterval_SelectionChanged 3
(3 4
object4 :
sender; A
,A B%
SelectionChangedEventArgsC \
e] ^
)^ _
{ 	
if 
( 
isFirstLoad 
) 
return #
;# $
( 
( 
TDIViewModel 
) 
DataContext &
)& '
.' (
ChangeKlineInterval( ;
(; <
)< =
;= >
} 	
} 
} 