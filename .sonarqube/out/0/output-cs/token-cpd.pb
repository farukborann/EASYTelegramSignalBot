�
dC:\Users\Ömer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\App.xaml.cs
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
} �
hC:\Users\Ömer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\AssemblyInfo.cs
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
 �
lC:\Users\Ömer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\Database\Context.cs
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
}%% �
mC:\Users\Ömer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\Database\Database.cs
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
} �
sC:\Users\Ömer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\Database\Models\Context.cs
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
}11 �
yC:\Users\Ömer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\Database\Models\Entities\User.cs
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
}!! �<
pC:\Users\Ömer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\Database\Models\User.cs
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
}WW �
yC:\Users\Ömer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\Finance\Binance\ExchangeInfos.cs
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
} �*
yC:\Users\Ömer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\Finance\Binance\StaticBinance.cs
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
KlineInterval	t �
interval
� �
,
� �

TickAction
� �

tickAction
� �
)
� �
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
Equals	{ �
(
� �
interval
� �
)
� �
)
� �
;
� �
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
}// ��
xC:\Users\Ömer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\Finance\Binance\Subscription.cs
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
SubscribeToKlineUpdatesAsync	++d �
(
++� �
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
Action	EE~ �
(
EE� �
Klines
EE� �
.
EE� �
GetRange
EE� �
(
EE� �
Klines
EE� �
.
EE� �
Count
EE� �
-
EE� �
x
EE� �
.
EE� �

KlineCount
EE� �
,
EE� �
x
EE� �
.
EE� �

KlineCount
EE� �
)
EE� �
)
EE� �
)
EE� �
.
EE� �
Wait
EE� �
(
EE� �
)
EE� �
)
EE� �
;
EE� �
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
Action	LL} �
(
LL� �
Klines
LL� �
.
LL� �
GetRange
LL� �
(
LL� �
Klines
LL� �
.
LL� �
Count
LL� �
-
LL� �
x
LL� �
.
LL� �

KlineCount
LL� �
,
LL� �
x
LL� �
.
LL� �

KlineCount
LL� �
)
LL� �
)
LL� �
)
LL� �
)
LL� �
;
LL� �
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
Action	SS{ �
(
SS� �
Klines
SS� �
.
SS� �
GetRange
SS� �
(
SS� �
Klines
SS� �
.
SS� �
Count
SS� �
-
SS� �
x
SS� �
.
SS� �

KlineCount
SS� �
,
SS� �
x
SS� �
.
SS� �

KlineCount
SS� �
)
SS� �
)
SS� �
)
SS� �
)
SS� �
;
SS� �
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
Interval	ii~ �
,
ii� �
limit
ii� �
:
ii� �
Limit
ii� �
,
ii� �
endTime
ii� �
:
ii� �
endTime
ii� �
)
ii� �
.
ii� �
Result
ii� �
.
ii� �
Data
ii� �
.
ii� �
ToKlines
ii� �
(
ii� �
)
ii� �
,
ii� �
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
:	jj �
Limit
jj� �
,
jj� �
endTime
jj� �
:
jj� �
endTime
jj� �
)
jj� �
.
jj� �
Result
jj� �
.
jj� �
Data
jj� �
.
jj� �
ToKlines
jj� �
(
jj� �
)
jj� �
,
jj� �
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
endTime	kk} �
)
kk� �
.
kk� �
Result
kk� �
.
kk� �
Data
kk� �
.
kk� �
ToKlines
kk� �
(
kk� �
)
kk� �
,
kk� �
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
Klines	{{| �
.
{{� �
Add
{{� �
(
{{� �
x
{{� �
)
{{� �
)
{{� �
;
{{� �
}|| 
if~~ 
(~~ 
GetKlinesCount~~ 
>~~  
$num~~! "
)~~" #
{ 
GetKlinesAsync
�� 
(
�� 
Symbol
�� %
,
��% &
Interval
��' /
,
��/ 0
GetKlinesCount
��1 ?
)
��? @
.
��@ A
ForEach
��A H
(
��H I
x
��I J
=>
��K M
Klines
��N T
.
��T U
Add
��U X
(
��X Y
x
��Y Z
)
��Z [
)
��[ \
;
��\ ]
}
�� 
}
�� 	
public
�� 
void
�� 
Cancel
�� 
(
�� 
)
�� 
{
�� 	%
CancellationTokenSource
�� #
?
��# $
.
��$ %
Cancel
��% +
(
��+ ,
)
��, -
;
��- .
}
�� 	
public
�� 
void
�� 
Dispose
�� 
(
�� 
)
�� 
{
�� 	
Dispose
�� 
(
�� 
true
�� 
)
�� 
;
�� 
GC
�� 
.
�� 
SuppressFinalize
�� 
(
��  
this
��  $
)
��$ %
;
��% &
}
�� 	
	protected
�� 
virtual
�� 
void
�� 
Dispose
�� &
(
��& '
bool
��' +
	disposing
��, 5
)
��5 6
{
�� 	
if
�� 
(
�� 

isDisposed
�� 
)
�� 
return
�� "
;
��" #%
CancellationTokenSource
�� #
.
��# $
Cancel
��$ *
(
��* +
)
��+ ,
;
��, -

CallResult
�� 
.
�� 
Dispose
�� 
(
�� 
)
��  
;
��  !

isDisposed
�� 
=
�� 
true
�� 
;
�� 
}
�� 	
}
�� 
}�� �R
rC:\Users\Ömer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\Finance\Indicators\PAC.cs
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
<	 �
string
� �
,
� �

Dictionary
� �
<
� �
string
� �
,
� �
List
� �
<
� �
object
� �
>
� �
>
� �
,
� �
Enums
� �
.
� �

SignalType
� �
>
� �
signalAction
� �
,
� �
bool
� �
isPaused
� �
=
� �
false
� �
)
� �
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
.	BB �

SignalType
BB� �
.
BB� �
Short
BB� �
:
BB� �
Enums
BB� �
.
BB� �

SignalType
BB� �
.
BB� �
Exit
BB� �
)
BB� �
;
BB� �
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
}TT �E
rC:\Users\Ömer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\Finance\Indicators\RSI.cs
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
<	 �
string
� �
,
� �

Dictionary
� �
<
� �
string
� �
,
� �
List
� �
<
� �
object
� �
>
� �
>
� �
,
� �
Enums
� �
.
� �

SignalType
� �
>
� �
signalAction
� �
,
� �
bool
� �
isPaused
� �
=
� �
false
� �
)
� �
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
}PP �
rC:\Users\Ömer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\Finance\Indicators\TDI.cs
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
<	 �
string
� �
,
� �

Dictionary
� �
<
� �
string
� �
,
� �
List
� �
<
� �
object
� �
>
� �
>
� �
,
� �
Enums
� �
.
� �

SignalType
� �
>
� �
signalAction
� �
,
� �
bool
� �
isPaused
� �
=
� �
false
� �
)
� �
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
77� �
x
77� �
.
77� �
Date
77� �
,
77� �
x
77� �
=>
77� �
x
77� �
.
77� �
Sma
77� �
)
77� �
;
77� �

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
ToDictionary	88w �
(
88� �
x
88� �
=>
88� �
x
88� �
.
88� �
Date
88� �
,
88� �
x
88� �
=>
88� �
x
88� �
.
88� �
StdDev
88� �
*
88� �
$num
88� �
)
88� �
;
88� �

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
TDISettings	ZZz �
.
ZZ� �
RSIOversoldLevel
ZZ� �
)
ZZ� �
RSI_PL
ZZ� �
=
ZZ� �
Enums
ZZ� �
.
ZZ� �

SignalType
ZZ� �
.
ZZ� �
Exit
ZZ� �
;
ZZ� �
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
typeof	pp| �
(
pp� �
Enums
pp� �
.
pp� �

SignalType
pp� �
)
pp� �
,
pp� �
TSL
pp� �
)
pp� �
}
pp� �
$str
pp� �
{
pp� �
Enum
pp� �
.
pp� �
GetName
pp� �
(
pp� �
typeof
pp� �
(
pp� �
Enums
pp� �
.
pp� �

SignalType
pp� �
)
pp� �
,
pp� �
MBL
pp� �
)
pp� �
}
pp� �
$str
pp� �
{
pp� �
Enum
pp� �
.
pp� �
GetName
pp� �
(
pp� �
typeof
pp� �
(
pp� �
Enums
pp� �
.
pp� �

SignalType
pp� �
)
pp� �
,
pp� �
VB
pp� �
)
pp� �
}
pp� �
"
pp� �
)
pp� �
;
pp� �
}qq 	
}rr 
}ss �
pC:\Users\Ömer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\Finance\Models\Enums.cs
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
} �	
uC:\Users\Ömer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\Finance\Models\Exceptions.cs
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
} �
rC:\Users\Ömer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\Finance\Models\Helpers.cs
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
}## �M
tC:\Users\Ömer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\Finance\Models\Indicator.cs
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

Dictionary	)){ �
<
))� �
string
))� �
,
))� �
List
))� �
<
))� �
object
))� �
>
))� �
>
))� �
,
))� �
Enums
))� �
.
))� �

SignalType
))� �
>
))� �
signalAction
))� �
,
))� �
Action
))� �
<
))� �
string
))� �
,
))� �

Dictionary
))� �
<
))� �
string
))� �
,
))� �
List
))� �
<
))� �
object
))� �
>
))� �
>
))� �
>
))� �
updateAction
))� �
,
))� �
bool
))� �
isPaused
))� �
=
))� �
false
))� �
)
))� �
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
.	++ �
Equals
++� �
(
++� �
symbol
++� �
.
++� �
ToLower
++� �
(
++� �
)
++� �
)
++� �
)
++� �
)
++� �
||
++� �
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
ToLower	,,| �
(
,,� �
)
,,� �
.
,,� �
Equals
,,� �
(
,,� �
symbol
,,� �
.
,,� �
ToLower
,,� �
(
,,� �
)
,,� �
)
,,� �
)
,,� �
)
,,� �
||
,,� �
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
ToLower	--} �
(
--� �
)
--� �
.
--� �
Equals
--� �
(
--� �
symbol
--� �
.
--� �
ToLower
--� �
(
--� �
)
--� �
)
--� �
)
--� �
)
--� �
)
--� �
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
}YY �&
pC:\Users\Ömer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\Finance\Models\Kline.cs
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
}   �
uC:\Users\Ömer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\Finance\Models\TickAction.cs
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
} �Z
vC:\Users\Ömer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\NewsBot\CryptopanicNewsBot.cs
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
$str	.." �
)
..� �
;
..� �
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
Markdown	XX~ �
)
XX� �
;
XX� �
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
Markdown	eex �
)
ee� �
;
ee� �
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
} �
sC:\Users\Ömer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\NewsBot\Helpers\Request.cs
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
} �
uC:\Users\Ömer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\NewsBot\Helpers\Translate.cs
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
$str	U �
+
� �
from
� �
+
� �
$str
� �
+
� �
to
� �
+
� �
$str
� �
+
� �
data
� �
)
� �
)
� �
)
� �
.
� �
Result
� �
;
� �
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
} �,
sC:\Users\Ömer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\NewsBot\Models\Response.cs
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
}99 �O
{C:\Users\Ömer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\SettingsManager\Models\Settings.cs
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
}gg � 
tC:\Users\Ömer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\SettingsManager\Settings.cs
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
}99 �1
oC:\Users\Ömer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\Telegram\BotClients.cs
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
}FF �)
}C:\Users\Ömer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\Telegram\Models\BaseUpdateHandler.cs
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
apiRequestException	v �
.
� �
Message
� �
}
� �
"
� �
,
� �
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
}== �(
xC:\Users\Ömer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\Telegram\UpdateHandlers\News.cs
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
$str	 �
;
� �
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
}<< �-
wC:\Users\Ömer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\Telegram\UpdateHandlers\PAC.cs
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
$str	 �
;
� �
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
}@@ �$
wC:\Users\Ömer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\Telegram\UpdateHandlers\RSI.cs
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
$str	 �
;
� �
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
First	 �
(
� �
)
� �
;
� �
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
$str	'' �
;
''� �
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
}33 �-
wC:\Users\Ömer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\Telegram\UpdateHandlers\TDI.cs
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
$str	 �
;
� �
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
}BB �
vC:\Users\Ömer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\UI\Helpers\DelegateCommand.cs
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
} �

wC:\Users\Ömer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\UI\Helpers\ObservableObject.cs
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
string	z �
[
� �
]
� �
propertyNames
� �
)
� �
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
} �"
oC:\Users\Ömer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\UI\Helpers\UILoader.cs
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
}CC �c
oC:\Users\Ömer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\UI\Models\NewsModel.cs
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
PropertyChanged	11x �
?
11� �
.
11� �
	InvokeAll
11� �
(
11� �
this
11� �
,
11� �
nameof
11� �
(
11� � 
SelectedUserSymbol
11� �
)
11� �
)
11� �
;
11� �
}
11� �
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
)	88 �
;
88� �
}
88� �
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
IsAddUserSymbolButtonEnabled	??t �
)
??� �
)
??� �
;
??� �
}
??� �
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
IsAddSymbolButtonEnabled	MMl �
)
MM� �
)
MM� �
;
MM� �
}
MM� �
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
)	__ �
)
__� �
;
__� �
}
__� �
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
IsAddGroupButtonEnabled	ffj �
)
ff� �
)
ff� �
;
ff� �
}
ff� �
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
�� 	
get
�� 
=>
�� 
key
�� 
;
�� 
set
�� 
{
�� 
key
�� 
=
�� 
value
�� 
;
�� 
PropertyChanged
�� .
?
��. /
.
��/ 0
	InvokeAll
��0 9
(
��9 :
this
��: >
,
��> ?
nameof
��@ F
(
��F G
Key
��G J
)
��J K
)
��K L
;
��L M
}
��N O
}
�� 	
}
�� 
}�� ��
nC:\Users\Ömer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\UI\Models\PACModel.cs
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
� �
ChartValues
� �
<
� �
double
� �
>
� �
(
� �
)
� �
,
� �
Fill
� �
=
� �
Brushes
� �
.
� �
Transparent
� �
}
� �
;
� �
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
=	 �
new
� �
ChartValues
� �
<
� �
double
� �
>
� �
(
� �
)
� �
,
� �
Fill
� �
=
� �
Brushes
� �
.
� �
Transparent
� �
}
� �
;
� �!
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
PropertyChanged	\\x �
?
\\� �
.
\\� �
	InvokeAll
\\� �
(
\\� �
this
\\� �
,
\\� �
nameof
\\� �
(
\\� � 
SelectedUserSymbol
\\� �
)
\\� �
)
\\� �
;
\\� �
}
\\� �
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
)	cc �
;
cc� �
}
cc� �
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
IsAddUserSymbolButtonEnabled	jjt �
)
jj� �
)
jj� �
;
jj� �
}
jj� �
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
IsAddSymbolButtonEnabled	xxl �
)
xx� �
)
xx� �
;
xx� �
}
xx� �
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
�� 
static
�� 
List
�� 
<
�� 
string
�� !
>
��! "
?
��" #
GroupIds
��$ ,
{
�� 	
get
�� 
=>
�� 
Settings
�� 
.
�� 
TelegramSettings
�� ,
.
��, -
	PACGroups
��- 6
;
��6 7
set
�� 
=>
�� 
Settings
�� 
.
�� 
TelegramSettings
�� ,
.
��, -
	PACGroups
��- 6
=
��7 8
value
��9 >
??
��? A
new
��B E
(
��E F
)
��F G
;
��G H
}
�� 	
private
�� 
string
�� 
?
�� 
selectedGroup
�� %
;
��% &
public
�� 
string
�� 
?
�� 
SelectedGroup
�� $
{
�� 	
get
�� 
=>
�� 
selectedGroup
��  
;
��  !
set
�� 
{
�� 
selectedGroup
�� 
=
��  !
value
��" '
;
��' (
PropertyChanged
��) 8
?
��8 9
.
��9 :
	InvokeAll
��: C
(
��C D
this
��D H
,
��H I
nameof
��J P
(
��P Q
SelectedGroup
��Q ^
)
��^ _
,
��_ `
nameof
��a g
(
��g h%
IsDelGroupButtonEnabled
��h 
)�� �
)��� �
;��� �
}��� �
}
�� 	
private
�� 
string
�� 
?
�� 
addGroupString
�� &
;
��& '
public
�� 
string
�� 
?
�� 
AddGroupString
�� %
{
�� 	
get
�� 
=>
�� 
addGroupString
�� !
;
��! "
set
�� 
{
�� 
addGroupString
��  
=
��! "
value
��# (
;
��( )
PropertyChanged
��* 9
?
��9 :
.
��: ;
	InvokeAll
��; D
(
��D E
this
��E I
,
��I J
nameof
��K Q
(
��Q R
AddGroupString
��R `
)
��` a
,
��a b
nameof
��c i
(
��i j&
IsAddGroupButtonEnabled��j �
)��� �
)��� �
;��� �
}��� �
}
�� 	
public
�� 
bool
�� %
IsAddGroupButtonEnabled
�� +
=>
��, .
!
��/ 0
string
��0 6
.
��6 7
IsNullOrEmpty
��7 D
(
��D E
addGroupString
��E S
)
��S T
;
��T U
public
�� 
bool
�� %
IsDelGroupButtonEnabled
�� +
=>
��, .
!
��/ 0
string
��0 6
.
��6 7
IsNullOrEmpty
��7 D
(
��D E
SelectedGroup
��E R
)
��R S
;
��S T
private
�� "
ObservableCollection
�� $
<
��$ %
	Indicator
��% .
>
��. /
?
��/ 0
symbols
��1 8
;
��8 9
public
�� "
ObservableCollection
�� #
<
��# $
	Indicator
��$ -
>
��- .
Symbols
��/ 6
{
�� 	
get
�� 
=>
�� 
symbols
�� 
??=
�� 
new
�� "
(
��" #
)
��# $
;
��$ %
set
�� 
{
�� 
symbols
�� 
=
�� 
value
�� !
;
��! "
PropertyChanged
��# 2
?
��2 3
.
��3 4
	InvokeAll
��4 =
(
��= >
this
��> B
,
��B C
nameof
��D J
(
��J K
Symbols
��K R
)
��R S
)
��S T
;
��T U
}
��V W
}
�� 	
private
�� 
	Indicator
�� 
?
�� 
selectedSymbol
�� )
;
��) *
public
�� 
	Indicator
�� 
?
�� 
SelectedSymbol
�� (
{
�� 	
get
�� 
=>
�� 
selectedSymbol
�� !
;
��! "
set
�� 
{
�� 
selectedSymbol
��  
=
��! "
value
��# (
;
��( )
PropertyChanged
��* 9
?
��9 :
.
��: ;
	InvokeAll
��; D
(
��D E
this
��E I
,
��I J
nameof
��K Q
(
��Q R
SelectedSymbol
��R `
)
��` a
)
��a b
;
��b c
}
��d e
}
�� 	
private
�� 
string
�� 
?
�� 
sellSignalString
�� (
;
��( )
public
�� 
string
�� 
SellSignalString
�� &
{
�� 	
get
�� 
=>
�� 
sellSignalString
�� #
??
��$ &
$str
��' )
;
��) *
set
�� 
{
�� 
sellSignalString
�� "
=
��# $
value
��% *
;
��* +
PropertyChanged
��, ;
?
��; <
.
��< =
	InvokeAll
��= F
(
��F G
this
��G K
,
��K L
nameof
��M S
(
��S T
SellSignalString
��T d
)
��d e
)
��e f
;
��f g
}
��h i
}
�� 	
private
�� 
string
�� 
?
�� 
buySignalString
�� '
;
��' (
public
�� 
string
�� 
BuySignalString
�� %
{
�� 	
get
�� 
=>
�� 
buySignalString
�� "
??
��# %
$str
��& (
;
��( )
set
�� 
{
�� 
buySignalString
�� !
=
��" #
value
��$ )
;
��) *
PropertyChanged
��+ :
?
��: ;
.
��; <
	InvokeAll
��< E
(
��E F
this
��F J
,
��J K
nameof
��L R
(
��R S
BuySignalString
��S b
)
��b c
)
��c d
;
��d e
}
��f g
}
�� 	
private
�� 
string
�� 
?
�� 
exitSignalString
�� (
;
��( )
public
�� 
string
�� 
ExitSignalString
�� &
{
�� 	
get
�� 
=>
�� 
exitSignalString
�� #
??
��$ &
$str
��' )
;
��) *
set
�� 
{
�� 
exitSignalString
�� "
=
��# $
value
��% *
;
��* +
PropertyChanged
��, ;
?
��; <
.
��< =
	InvokeAll
��= F
(
��F G
this
��G K
,
��K L
nameof
��M S
(
��S T
ExitSignalString
��T d
)
��d e
)
��e f
;
��f g
}
��h i
}
�� 	
private
�� 
int
�� 
_SMMAPeriot
�� 
;
��  
public
�� 
int
�� 

SMMAPeriot
�� 
{
�� 	
get
�� 
=>
�� 
_SMMAPeriot
�� 
;
�� 
set
�� 
{
�� 
_SMMAPeriot
�� 
=
�� 
value
��  %
;
��% &
PropertyChanged
��' 6
?
��6 7
.
��7 8
	InvokeAll
��8 A
(
��A B
this
��B F
,
��F G
nameof
��H N
(
��N O

SMMAPeriot
��O Y
)
��Y Z
)
��Z [
;
��[ \
}
��] ^
}
�� 	
private
�� 
int
�� 
minSignalPeriot
�� #
;
��# $
public
�� 
int
�� 
MinSignalPeriot
�� "
{
�� 	
get
�� 
=>
�� 
minSignalPeriot
�� "
;
��" #
set
�� 
{
�� 
minSignalPeriot
�� !
=
��" #
value
��$ )
;
��) *
PropertyChanged
��+ :
?
��: ;
.
��; <
	InvokeAll
��< E
(
��E F
this
��F J
,
��J K
nameof
��L R
(
��R S
MinSignalPeriot
��S b
)
��b c
)
��c d
;
��d e
}
��f g
}
�� 	
private
�� 
KlineInterval
�� 
?
�� 
klineInterval
�� ,
;
��, -
public
�� 
KlineInterval
�� 
KlineInterval
�� *
{
�� 	
get
�� 
=>
�� 
klineInterval
��  
??=
��! $
(
��% &
KlineInterval
��& 3
)
��3 4
Enum
��4 8
.
��8 9
Parse
��9 >
(
��> ?
typeof
��? E
(
��E F
KlineInterval
��F S
)
��S T
,
��T U
Settings
��V ^
.
��^ _
BotsSettings
��_ k
.
��k l
PACSettings
��l w
.
��w x
KlineInterval��x �
)��� �
;��� �
set
�� 
{
�� 
klineInterval
�� 
=
��  !
value
��" '
;
��' (
PropertyChanged
��) 8
?
��8 9
.
��9 :
	InvokeAll
��: C
(
��C D
this
��D H
,
��H I
nameof
��J P
(
��P Q
KlineInterval
��Q ^
)
��^ _
)
��_ `
;
��` a
}
��b c
}
�� 	
public
�� 
KlineInterval
�� 
[
�� 
]
�� 
KlineIntervals
�� -
=>
��. 0
(
��1 2
KlineInterval
��2 ?
[
��? @
]
��@ A
)
��A B
Enum
��B F
.
��F G
	GetValues
��G P
(
��P Q
typeof
��Q W
(
��W X
Binance
��X _
.
��_ `
Net
��` c
.
��c d
Enums
��d i
.
��i j
KlineInterval
��j w
)
��w x
)
��x y
;
��y z
}
�� 
}�� �
nC:\Users\Ömer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\UI\Models\RSIModel.cs
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
ChartValues	y �
<
� �
double
� �
>
� �
(
� �
)
� �
,
� �
Fill
� �
=
� �
Brushes
� �
.
� �
Transparent
� �
}
� �
;
� �&
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
PropertyChanged	YYx �
?
YY� �
.
YY� �
	InvokeAll
YY� �
(
YY� �
this
YY� �
,
YY� �
nameof
YY� �
(
YY� � 
SelectedUserSymbol
YY� �
)
YY� �
)
YY� �
;
YY� �
}
YY� �
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
)	`` �
;
``� �
}
``� �
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
IsAddUserSymbolButtonEnabled	ggt �
)
gg� �
)
gg� �
;
gg� �
}
gg� �
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
IsAddSymbolButtonEnabled	uul �
)
uu� �
)
uu� �
;
uu� �
}
uu� �
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
�� 
=>
�� 
Settings
�� 
.
�� 
TelegramSettings
�� ,
.
��, -
	RSIGroups
��- 6
=
��7 8
value
��9 >
??
��? A
new
��B E
(
��E F
)
��F G
;
��G H
}
�� 	
private
�� 
string
�� 
?
�� 
selectedGroup
�� %
;
��% &
public
�� 
string
�� 
?
�� 
SelectedGroup
�� $
{
�� 	
get
�� 
=>
�� 
selectedGroup
��  
;
��  !
set
�� 
{
�� 
selectedGroup
�� 
=
��  !
value
��" '
;
��' (
PropertyChanged
��) 8
?
��8 9
.
��9 :
	InvokeAll
��: C
(
��C D
this
��D H
,
��H I
nameof
��J P
(
��P Q
SelectedGroup
��Q ^
)
��^ _
,
��_ `
nameof
��a g
(
��g h%
IsDelGroupButtonEnabled
��h 
)�� �
)��� �
;��� �
}��� �
}
�� 	
private
�� 
string
�� 
?
�� 
addGroupString
�� &
;
��& '
public
�� 
string
�� 
?
�� 
AddGroupString
�� %
{
�� 	
get
�� 
=>
�� 
addGroupString
�� !
;
��! "
set
�� 
{
�� 
addGroupString
��  
=
��! "
value
��# (
;
��( )
PropertyChanged
��* 9
?
��9 :
.
��: ;
	InvokeAll
��; D
(
��D E
this
��E I
,
��I J
nameof
��K Q
(
��Q R
AddGroupString
��R `
)
��` a
,
��a b
nameof
��c i
(
��i j&
IsAddGroupButtonEnabled��j �
)��� �
)��� �
;��� �
}��� �
}
�� 	
public
�� 
bool
�� %
IsAddGroupButtonEnabled
�� +
=>
��, .
!
��/ 0
string
��0 6
.
��6 7
IsNullOrEmpty
��7 D
(
��D E
addGroupString
��E S
)
��S T
;
��T U
public
�� 
bool
�� %
IsDelGroupButtonEnabled
�� +
=>
��, .
!
��/ 0
string
��0 6
.
��6 7
IsNullOrEmpty
��7 D
(
��D E
SelectedGroup
��E R
)
��R S
;
��S T
private
�� "
ObservableCollection
�� $
<
��$ %
	Indicator
��% .
>
��. /
?
��/ 0
symbols
��1 8
;
��8 9
public
�� "
ObservableCollection
�� #
<
��# $
	Indicator
��$ -
>
��- .
Symbols
��/ 6
{
�� 	
get
�� 
=>
�� 
symbols
�� 
??=
�� 
new
�� "
(
��" #
)
��# $
;
��$ %
set
�� 
{
�� 
symbols
�� 
=
�� 
value
�� !
;
��! "
PropertyChanged
��# 2
?
��2 3
.
��3 4
	InvokeAll
��4 =
(
��= >
this
��> B
,
��B C
nameof
��D J
(
��J K
Symbols
��K R
)
��R S
)
��S T
;
��T U
}
��V W
}
�� 	
private
�� 
	Indicator
�� 
?
�� 
selectedSymbol
�� )
;
��) *
public
�� 
	Indicator
�� 
?
�� 
SelectedSymbol
�� (
{
�� 	
get
�� 
=>
�� 
selectedSymbol
�� !
;
��! "
set
�� 
{
�� 
selectedSymbol
��  
=
��! "
value
��# (
;
��( )
PropertyChanged
��* 9
?
��9 :
.
��: ;
	InvokeAll
��; D
(
��D E
this
��E I
,
��I J
nameof
��K Q
(
��Q R
SelectedSymbol
��R `
)
��` a
)
��a b
;
��b c
}
��d e
}
�� 	
private
�� 
string
�� 
?
�� "
oversoldSignalString
�� ,
;
��, -
public
�� 
string
�� "
OversoldSignalString
�� *
{
�� 	
get
�� 
=>
�� "
oversoldSignalString
�� '
??
��( *
$str
��+ -
;
��- .
set
�� 
{
�� "
oversoldSignalString
�� &
=
��' (
value
��) .
;
��. /
PropertyChanged
��0 ?
?
��? @
.
��@ A
	InvokeAll
��A J
(
��J K
this
��K O
,
��O P
nameof
��Q W
(
��W X"
OversoldSignalString
��X l
)
��l m
)
��m n
;
��n o
}
��p q
}
�� 	
private
�� 
string
�� 
?
�� $
overboughtSignalString
�� .
;
��. /
public
�� 
string
�� $
OverboughtSignalString
�� ,
{
�� 	
get
�� 
=>
�� $
overboughtSignalString
�� )
??
��* ,
$str
��- /
;
��/ 0
set
�� 
{
�� $
overboughtSignalString
�� (
=
��) *
value
��+ 0
;
��0 1
PropertyChanged
��2 A
?
��A B
.
��B C
	InvokeAll
��C L
(
��L M
this
��M Q
,
��Q R
nameof
��S Y
(
��Y Z$
OverboughtSignalString
��Z p
)
��p q
)
��q r
;
��r s
}
��t u
}
�� 	
private
�� 
string
�� 
?
�� '
betweenLevelsSignalString
�� 1
;
��1 2
public
�� 
string
�� '
BetweenLevelsSignalString
�� /
{
�� 	
get
�� 
=>
�� '
betweenLevelsSignalString
�� ,
??
��- /
$str
��0 2
;
��2 3
set
�� 
{
�� '
betweenLevelsSignalString
�� +
=
��, -
value
��. 3
;
��3 4
PropertyChanged
��5 D
?
��D E
.
��E F
	InvokeAll
��F O
(
��O P
this
��P T
,
��T U
nameof
��V \
(
��\ ]'
BetweenLevelsSignalString
��] v
)
��v w
)
��w x
;
��x y
}
��z {
}
�� 	
private
�� 
int
�� 

_RSIPeriot
�� 
;
�� 
public
�� 
int
�� 
	RSIPeriot
�� 
{
�� 	
get
�� 
=>
�� 

_RSIPeriot
�� 
;
�� 
set
�� 
{
�� 

_RSIPeriot
�� 
=
�� 
value
�� $
;
��$ %
PropertyChanged
��& 5
?
��5 6
.
��6 7
	InvokeAll
��7 @
(
��@ A
this
��A E
,
��E F
nameof
��G M
(
��M N
	RSIPeriot
��N W
)
��W X
)
��X Y
;
��Y Z
}
��[ \
}
�� 	
private
�� 
int
�� 
_RSIOversoldLevel
�� %
;
��% &
public
�� 
int
�� 
RSIOversoldLevel
�� #
{
�� 	
get
�� 
=>
�� 
_RSIOversoldLevel
�� $
;
��$ %
set
�� 
{
�� 
_RSIOversoldLevel
�� #
=
��$ %
value
��& +
;
��+ ,
PropertyChanged
��- <
?
��< =
.
��= >
	InvokeAll
��> G
(
��G H
this
��H L
,
��L M
nameof
��N T
(
��T U
RSIOversoldLevel
��U e
)
��e f
)
��f g
;
��g h
}
��i j
}
�� 	
private
�� 
int
�� !
_RSIOverboughtLevel
�� '
;
��' (
public
�� 
int
��  
RSIOverboughtLevel
�� %
{
�� 	
get
�� 
=>
�� !
_RSIOverboughtLevel
�� &
;
��& '
set
�� 
{
�� !
_RSIOverboughtLevel
�� %
=
��& '
value
��( -
;
��- .
PropertyChanged
��/ >
?
��> ?
.
��? @
	InvokeAll
��@ I
(
��I J
this
��J N
,
��N O
nameof
��P V
(
��V W 
RSIOverboughtLevel
��W i
)
��i j
)
��j k
;
��k l
}
��m n
}
�� 	
private
�� 
int
�� 
minSignalPeriot
�� #
;
��# $
public
�� 
int
�� 
MinSignalPeriot
�� "
{
�� 	
get
�� 
=>
�� 
minSignalPeriot
�� "
;
��" #
set
�� 
{
�� 
minSignalPeriot
�� !
=
��" #
value
��$ )
;
��) *
PropertyChanged
��+ :
?
��: ;
.
��; <
	InvokeAll
��< E
(
��E F
this
��F J
,
��J K
nameof
��L R
(
��R S
MinSignalPeriot
��S b
)
��b c
)
��c d
;
��d e
}
��f g
}
�� 	
private
�� 
KlineInterval
�� 
?
�� 
klineInterval
�� ,
;
��, -
public
�� 
KlineInterval
�� 
KlineInterval
�� *
{
�� 	
get
�� 
=>
�� 
klineInterval
��  
??=
��! $
(
��% &
KlineInterval
��& 3
)
��3 4
Enum
��4 8
.
��8 9
Parse
��9 >
(
��> ?
typeof
��? E
(
��E F
KlineInterval
��F S
)
��S T
,
��T U
Settings
��V ^
.
��^ _
BotsSettings
��_ k
.
��k l
RSISettings
��l w
.
��w x
KlineInterval��x �
)��� �
;��� �
set
�� 
{
�� 
klineInterval
�� 
=
��  !
value
��" '
;
��' (
PropertyChanged
��) 8
?
��8 9
.
��9 :
	InvokeAll
��: C
(
��C D
this
��D H
,
��H I
nameof
��J P
(
��P Q
KlineInterval
��Q ^
)
��^ _
)
��_ `
;
��` a
}
��b c
}
�� 	
public
�� 
KlineInterval
�� 
[
�� 
]
�� 
KlineIntervals
�� -
=>
��. 0
(
��1 2
KlineInterval
��2 ?
[
��? @
]
��@ A
)
��A B
Enum
��B F
.
��F G
	GetValues
��G P
(
��P Q
typeof
��Q W
(
��W X
Binance
��X _
.
��_ `
Net
��` c
.
��c d
Enums
��d i
.
��i j
KlineInterval
��j w
)
��w x
)
��x y
;
��y z
}
�� 
}�� ��
nC:\Users\Ömer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\UI\Models\TDIModel.cs
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
Values	z �
=
� �
new
� �
ChartValues
� �
<
� �
double
� �
>
� �
(
� �
)
� �
,
� �
Fill
� �
=
� �
Brushes
� �
.
� �
Transparent
� �
}
� �
;
� �
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
Values	{ �
=
� �
new
� �
ChartValues
� �
<
� �
double
� �
>
� �
(
� �
)
� �
,
� �
Fill
� �
=
� �
Brushes
� �
.
� �
Transparent
� �
}
� �
;
� �
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
  � �
new
  � �
ChartValues
  � �
<
  � �
double
  � �
>
  � �
(
  � �
)
  � �
,
  � �
Fill
  � �
=
  � �
Brushes
  � �
.
  � �
Transparent
  � �
}
  � �
;
  � �
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
!!� �
,
!!� �
Values
!!� �
=
!!� �
new
!!� �
ChartValues
!!� �
<
!!� �
double
!!� �
>
!!� �
(
!!� �
)
!!� �
,
!!� �
Fill
!!� �
=
!!� �
Brushes
!!� �
.
!!� �
Transparent
!!� �
}
!!� �
;
!!� �
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
Values	""} �
=
""� �
new
""� �
ChartValues
""� �
<
""� �
double
""� �
>
""� �
(
""� �
)
""� �
,
""� �
Fill
""� �
=
""� �
Brushes
""� �
.
""� �
Transparent
""� �
}
""� �
;
""� �&
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
PropertyChanged	eex �
?
ee� �
.
ee� �
	InvokeAll
ee� �
(
ee� �
this
ee� �
,
ee� �
nameof
ee� �
(
ee� � 
SelectedUserSymbol
ee� �
)
ee� �
)
ee� �
;
ee� �
}
ee� �
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
)	ll �
;
ll� �
}
ll� �
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
IsAddUserSymbolButtonEnabled	sst �
)
ss� �
)
ss� �
;
ss� �
}
ss� �
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
�� 
=>
�� 
addSymbolString
�� "
;
��" #
set
�� 
{
�� 
addSymbolString
�� !
=
��" #
value
��$ )
;
��) *
PropertyChanged
��+ :
?
��: ;
.
��; <
	InvokeAll
��< E
(
��E F
this
��F J
,
��J K
nameof
��L R
(
��R S
AddSymbolString
��S b
)
��b c
,
��c d
nameof
��e k
(
��k l'
IsAddSymbolButtonEnabled��l �
)��� �
)��� �
;��� �
}��� �
}
�� 	
public
�� 
bool
�� *
IsAddUserSymbolButtonEnabled
�� 0
=>
��1 3
!
��4 5
string
��5 ;
.
��; <
IsNullOrEmpty
��< I
(
��I J!
addUserSymbolString
��J ]
)
��] ^
;
��^ _
public
�� 
bool
�� $
IsAddUserButtonEnabled
�� *
=>
��+ -
!
��. /
string
��/ 5
.
��5 6
IsNullOrEmpty
��6 C
(
��C D
addUserString
��D Q
)
��Q R
;
��R S
public
�� 
bool
�� &
IsAddSymbolButtonEnabled
�� ,
=>
��- /
!
��0 1
string
��1 7
.
��7 8
IsNullOrEmpty
��8 E
(
��E F
addSymbolString
��F U
)
��U V
;
��V W
public
�� 
static
�� 
List
�� 
<
�� 
string
�� !
>
��! "
?
��" #
GroupIds
��$ ,
{
�� 	
get
�� 
=>
�� 
Settings
�� 
.
�� 
TelegramSettings
�� ,
.
��, -
	TDIGroups
��- 6
;
��6 7
set
�� 
=>
�� 
Settings
�� 
.
�� 
TelegramSettings
�� ,
.
��, -
	TDIGroups
��- 6
=
��7 8
value
��9 >
??
��? A
new
��B E
(
��E F
)
��F G
;
��G H
}
�� 	
private
�� 
string
�� 
?
�� 
selectedGroup
�� %
;
��% &
public
�� 
string
�� 
?
�� 
SelectedGroup
�� $
{
�� 	
get
�� 
=>
�� 
selectedGroup
��  
;
��  !
set
�� 
{
�� 
selectedGroup
�� 
=
��  !
value
��" '
;
��' (
PropertyChanged
��) 8
?
��8 9
.
��9 :
	InvokeAll
��: C
(
��C D
this
��D H
,
��H I
nameof
��J P
(
��P Q
SelectedGroup
��Q ^
)
��^ _
,
��_ `
nameof
��a g
(
��g h%
IsDelGroupButtonEnabled
��h 
)�� �
)��� �
;��� �
}��� �
}
�� 	
private
�� 
string
�� 
?
�� 
addGroupString
�� &
;
��& '
public
�� 
string
�� 
?
�� 
AddGroupString
�� %
{
�� 	
get
�� 
=>
�� 
addGroupString
�� !
;
��! "
set
�� 
{
�� 
addGroupString
��  
=
��! "
value
��# (
;
��( )
PropertyChanged
��* 9
?
��9 :
.
��: ;
	InvokeAll
��; D
(
��D E
this
��E I
,
��I J
nameof
��K Q
(
��Q R
AddGroupString
��R `
)
��` a
,
��a b
nameof
��c i
(
��i j&
IsAddGroupButtonEnabled��j �
)��� �
)��� �
;��� �
}��� �
}
�� 	
public
�� 
bool
�� %
IsAddGroupButtonEnabled
�� +
=>
��, .
!
��/ 0
string
��0 6
.
��6 7
IsNullOrEmpty
��7 D
(
��D E
addGroupString
��E S
)
��S T
;
��T U
public
�� 
bool
�� %
IsDelGroupButtonEnabled
�� +
=>
��, .
!
��/ 0
string
��0 6
.
��6 7
IsNullOrEmpty
��7 D
(
��D E
SelectedGroup
��E R
)
��R S
;
��S T
private
�� "
ObservableCollection
�� $
<
��$ %
	Indicator
��% .
>
��. /
?
��/ 0
symbols
��1 8
;
��8 9
public
�� "
ObservableCollection
�� #
<
��# $
	Indicator
��$ -
>
��- .
Symbols
��/ 6
{
�� 	
get
�� 
=>
�� 
symbols
�� 
??=
�� 
new
�� "
(
��" #
)
��# $
;
��$ %
set
�� 
{
�� 
symbols
�� 
=
�� 
value
�� !
;
��! "
PropertyChanged
��# 2
?
��2 3
.
��3 4
	InvokeAll
��4 =
(
��= >
this
��> B
,
��B C
nameof
��D J
(
��J K
Symbols
��K R
)
��R S
)
��S T
;
��T U
}
��V W
}
�� 	
private
�� 
	Indicator
�� 
?
�� 
selectedSymbol
�� )
;
��) *
public
�� 
	Indicator
�� 
?
�� 
SelectedSymbol
�� (
{
�� 	
get
�� 
=>
�� 
selectedSymbol
�� !
;
��! "
set
�� 
{
�� 
selectedSymbol
��  
=
��! "
value
��# (
;
��( )
PropertyChanged
��* 9
?
��9 :
.
��: ;
	InvokeAll
��; D
(
��D E
this
��E I
,
��I J
nameof
��K Q
(
��Q R
SelectedSymbol
��R `
)
��` a
)
��a b
;
��b c
}
��d e
}
�� 	
private
�� 
string
�� 
?
�� 
sellSignalString
�� (
;
��( )
public
�� 
string
�� 
SellSignalString
�� &
{
�� 	
get
�� 
=>
�� 
sellSignalString
�� #
??
��$ &
$str
��' )
;
��) *
set
�� 
{
�� 
sellSignalString
�� "
=
��# $
value
��% *
;
��* +
PropertyChanged
��, ;
?
��; <
.
��< =
	InvokeAll
��= F
(
��F G
this
��G K
,
��K L
nameof
��M S
(
��S T
SellSignalString
��T d
)
��d e
)
��e f
;
��f g
}
��h i
}
�� 	
private
�� 
string
�� 
?
�� 
buySignalString
�� '
;
��' (
public
�� 
string
�� 
BuySignalString
�� %
{
�� 	
get
�� 
=>
�� 
buySignalString
�� "
??
��# %
$str
��& (
;
��( )
set
�� 
{
�� 
buySignalString
�� !
=
��" #
value
��$ )
;
��) *
PropertyChanged
��+ :
?
��: ;
.
��; <
	InvokeAll
��< E
(
��E F
this
��F J
,
��J K
nameof
��L R
(
��R S
BuySignalString
��S b
)
��b c
)
��c d
;
��d e
}
��f g
}
�� 	
private
�� 
string
�� 
?
�� 
exitSignalString
�� (
;
��( )
public
�� 
string
�� 
ExitSignalString
�� &
{
�� 	
get
�� 
=>
�� 
exitSignalString
�� #
??
��$ &
$str
��' )
;
��) *
set
�� 
{
�� 
exitSignalString
�� "
=
��# $
value
��% *
;
��* +
PropertyChanged
��, ;
?
��; <
.
��< =
	InvokeAll
��= F
(
��F G
this
��G K
,
��K L
nameof
��M S
(
��S T
ExitSignalString
��T d
)
��d e
)
��e f
;
��f g
}
��h i
}
�� 	
private
�� 
int
�� 

_RSIPeriot
�� 
;
�� 
public
�� 
int
�� 
	RSIPeriot
�� 
{
�� 	
get
�� 
=>
�� 

_RSIPeriot
�� 
;
�� 
set
�� 
{
�� 

_RSIPeriot
�� 
=
�� 
value
�� $
;
��$ %
PropertyChanged
��& 5
?
��5 6
.
��6 7
	InvokeAll
��7 @
(
��@ A
this
��A E
,
��E F
nameof
��G M
(
��M N
	RSIPeriot
��N W
)
��W X
)
��X Y
;
��Y Z
}
��[ \
}
�� 	
private
�� 
int
�� 
_RSIPLPeriot
��  
;
��  !
public
�� 
int
�� 
RSIPLPeriot
�� 
{
�� 	
get
�� 
=>
�� 
_RSIPLPeriot
�� 
;
��  
set
�� 
{
�� 
_RSIPLPeriot
�� 
=
��  
value
��! &
;
��& '
PropertyChanged
��( 7
?
��7 8
.
��8 9
	InvokeAll
��9 B
(
��B C
this
��C G
,
��G H
nameof
��I O
(
��O P
RSIPLPeriot
��P [
)
��[ \
)
��\ ]
;
��] ^
}
��_ `
}
�� 	
private
�� 
int
�� 

_TSLPeriot
�� 
;
�� 
public
�� 
int
�� 
	TSLPeriot
�� 
{
�� 	
get
�� 
=>
�� 

_TSLPeriot
�� 
;
�� 
set
�� 
{
�� 

_TSLPeriot
�� 
=
�� 
value
�� $
;
��$ %
PropertyChanged
��& 5
?
��5 6
.
��6 7
	InvokeAll
��7 @
(
��@ A
this
��A E
,
��E F
nameof
��G M
(
��M N
	TSLPeriot
��N W
)
��W X
)
��X Y
;
��Y Z
}
��[ \
}
�� 	
private
�� 
int
�� 
	_VBPeriot
�� 
;
�� 
public
�� 
int
�� 
VBPeriot
�� 
{
�� 	
get
�� 
=>
�� 
	_VBPeriot
�� 
;
�� 
set
�� 
{
�� 
	_VBPeriot
�� 
=
�� 
value
�� #
;
��# $
PropertyChanged
��% 4
?
��4 5
.
��5 6
	InvokeAll
��6 ?
(
��? @
this
��@ D
,
��D E
nameof
��F L
(
��L M
VBPeriot
��M U
)
��U V
)
��V W
;
��W X
}
��Y Z
}
�� 	
private
�� 
int
�� 
_RSIOversoldLevel
�� %
;
��% &
public
�� 
int
�� 
RSIOversoldLevel
�� #
{
�� 	
get
�� 
=>
�� 
_RSIOversoldLevel
�� $
;
��$ %
set
�� 
{
�� 
_RSIOversoldLevel
�� #
=
��$ %
value
��& +
;
��+ ,
PropertyChanged
��- <
?
��< =
.
��= >
	InvokeAll
��> G
(
��G H
this
��H L
,
��L M
nameof
��N T
(
��T U
RSIOversoldLevel
��U e
)
��e f
)
��f g
;
��g h
}
��i j
}
�� 	
private
�� 
int
�� !
_RSIOverboughtLevel
�� '
;
��' (
public
�� 
int
��  
RSIOverboughtLevel
�� %
{
�� 	
get
�� 
=>
�� !
_RSIOverboughtLevel
�� &
;
��& '
set
�� 
{
�� !
_RSIOverboughtLevel
�� %
=
��& '
value
��( -
;
��- .
PropertyChanged
��/ >
?
��> ?
.
��? @
	InvokeAll
��@ I
(
��I J
this
��J N
,
��N O
nameof
��P V
(
��V W 
RSIOverboughtLevel
��W i
)
��i j
)
��j k
;
��k l
}
��m n
}
�� 	
private
�� 
int
�� 
minSignalPeriot
�� #
;
��# $
public
�� 
int
�� 
MinSignalPeriot
�� "
{
�� 	
get
�� 
=>
�� 
minSignalPeriot
�� "
;
��" #
set
�� 
{
�� 
minSignalPeriot
�� !
=
��" #
value
��$ )
;
��) *
PropertyChanged
��+ :
?
��: ;
.
��; <
	InvokeAll
��< E
(
��E F
this
��F J
,
��J K
nameof
��L R
(
��R S
MinSignalPeriot
��S b
)
��b c
)
��c d
;
��d e
}
��f g
}
�� 	
private
�� 
KlineInterval
�� 
?
�� 
klineInterval
�� ,
;
��, -
public
�� 
KlineInterval
�� 
KlineInterval
�� *
{
�� 	
get
�� 
=>
�� 
klineInterval
��  
??=
��! $
(
��% &
KlineInterval
��& 3
)
��3 4
Enum
��4 8
.
��8 9
Parse
��9 >
(
��> ?
typeof
��? E
(
��E F
KlineInterval
��F S
)
��S T
,
��T U
Settings
��V ^
.
��^ _
BotsSettings
��_ k
.
��k l
TDISettings
��l w
.
��w x
KlineInterval��x �
)��� �
;��� �
set
�� 
{
�� 
klineInterval
�� 
=
��  !
value
��" '
;
��' (
PropertyChanged
��) 8
?
��8 9
.
��9 :
	InvokeAll
��: C
(
��C D
this
��D H
,
��H I
nameof
��J P
(
��P Q
KlineInterval
��Q ^
)
��^ _
)
��_ `
;
��` a
}
��b c
}
�� 	
public
�� 
KlineInterval
�� 
[
�� 
]
�� 
KlineIntervals
�� -
=>
��. 0
(
��1 2
KlineInterval
��2 ?
[
��? @
]
��@ A
)
��A B
Enum
��B F
.
��F G
	GetValues
��G P
(
��P Q
typeof
��Q W
(
��W X
Binance
��X _
.
��_ `
Net
��` c
.
��c d
Enums
��d i
.
��i j
KlineInterval
��j w
)
��w x
)
��x y
;
��y z
}
�� 
}�� �
wC:\Users\Ömer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\UI\ViewModels\MainViewModel.cs
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
} �k
wC:\Users\Ömer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\UI\ViewModels\NewsViewModel.cs
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
AddUserDays	--} �
)
--� �
}
--� �
)
--� �
;
--� �

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
)	66 �
;
66� �
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
�� 
}�� ��
vC:\Users\Ömer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\UI\ViewModels\PACViewModel.cs
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
values	CC| �
)
CC� �
=>
CC� �
{
CC� �
}
CC� �
,
CC� �
SendSignalMessage
CC� �
,
CC� �
true
CC� �
)
CC� �
{
CC� �
}
CC� �
)
CC� �
;
CC� �
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
$str	GG �
"
GG� �
,
GG� �
$str
GG� �
,
GG� �
MessageBoxButton
GG� �
.
GG� �
YesNo
GG� �
,
GG� �
MessageBoxImage
GG� �
.
GG� �
Error
GG� �
)
GG� �
;
GG� �
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
object	mm| �
>
mm� �
>
mm� �
values
mm� �
)
mm� �
=>
mm� �
{
mm� �
}
mm� �
;
mm� �
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
_Low	zz �
,
zz� �
(
zz� �
double
zz� �
)
zz� �
x
zz� �
.
zz� �
_Close
zz� �
)
zz� �
)
zz� �
.
zz� �
ToList
zz� �
(
zz� �
)
zz� �
)
zz� �
;
zz� �
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
�� 
Kline
�� 
?
�� 
	LastKline
��  
=
��! "
Klines
��# )
.
��) *
Last
��* .
(
��. /
)
��/ 0
;
��0 1
	OhlcPoint
�� 
?
�� 
LastChartKline
�� )
=
��* +
(
��, -
	OhlcPoint
��- 6
?
��6 7
)
��7 8
Model
��8 =
.
��= >#
KlineSeriesCollection
��> S
[
��S T
$num
��T U
]
��U V
.
��V W
Values
��W ]
[
��] ^
^
��^ _
$num
��_ `
]
��` a
;
��a b
if
�� 
(
�� 
LastChartKline
�� "
==
��# %
null
��& *
)
��* +
return
��, 2
;
��2 3
LastChartKline
�� 
.
�� 
Close
�� $
=
��% &
(
��' (
double
��( .
)
��. /
	LastKline
��/ 8
.
��8 9
_Close
��9 ?
;
��? @
if
�� 
(
�� 
LastChartKline
�� "
.
��" #
High
��# '
<
��( )
(
��* +
double
��+ 1
)
��1 2
	LastKline
��2 ;
.
��; <
_High
��< A
)
��A B
LastChartKline
��C Q
.
��Q R
High
��R V
=
��W X
(
��Y Z
double
��Z `
)
��` a
	LastKline
��a j
.
��j k
_High
��k p
;
��p q
if
�� 
(
�� 
LastChartKline
�� "
.
��" #
Low
��# &
<
��' (
(
��) *
double
��* 0
)
��0 1
	LastKline
��1 :
.
��: ;
_Low
��; ?
)
��? @
LastChartKline
��A O
.
��O P
Low
��P S
=
��T U
(
��V W
double
��W ]
)
��] ^
	LastKline
��^ g
.
��g h
_Low
��h l
;
��l m
return
�� 
;
�� 
}
�� 
Model
�� 
.
�� 
Labels
�� 
.
�� 
RemoveAt
�� !
(
��! "
$num
��" #
)
��# $
;
��$ %
Model
�� 
.
�� #
KlineSeriesCollection
�� '
[
��' (
$num
��( )
]
��) *
.
��* +
Values
��+ 1
.
��1 2
RemoveAt
��2 :
(
��: ;
$num
��; <
)
��< =
;
��= >
Model
�� 
.
�� 
Labels
�� 
.
�� 
Add
�� 
(
�� 
Klines
�� #
.
��# $
Last
��$ (
(
��( )
)
��) *
.
��* +
	_OpenDate
��+ 4
.
��4 5
ToString
��5 =
(
��= >
$str
��> D
)
��D E
)
��E F
;
��F G
Model
�� 
.
�� #
KlineSeriesCollection
�� '
[
��' (
$num
��( )
]
��) *
.
��* +
Values
��+ 1
.
��1 2
Add
��2 5
(
��5 6
new
��6 9
	OhlcPoint
��: C
(
��C D
(
��D E
double
��E K
)
��K L
Klines
��L R
.
��R S
Last
��S W
(
��W X
)
��X Y
.
��Y Z
_Open
��Z _
,
��_ `
(
��a b
double
��b h
)
��h i
Klines
��i o
.
��o p
Last
��p t
(
��t u
)
��u v
.
��v w
_High
��w |
,
��| }
(
��~ 
double�� �
)��� �
Klines��� �
.��� �
Last��� �
(��� �
)��� �
.��� �
_Low��� �
,��� �
(��� �
double��� �
)��� �
Klines��� �
.��� �
Last��� �
(��� �
)��� �
.��� �
_Close��� �
)��� �
)��� �
;��� �
}
�� 	
public
�� 
void
�� 
UpdateIndicators
�� $
(
��$ %
IEnumerable
��% 0
<
��0 1
Kline
��1 6
>
��6 7
Klines
��8 >
,
��> ?
IEnumerable
��@ K
<
��K L
object
��L R
>
��R S
TOC
��T W
,
��W X
IEnumerable
��Y d
<
��d e
object
��e k
>
��k l
BOC
��m p
)
��p q
{
�� 	
UpdateIndicator
�� 
(
�� 
Klines
�� "
,
��" #
Model
��$ )
.
��) *
TOC
��* -
.
��- .
Values
��. 4
,
��4 5
TOC
��6 9
)
��9 :
;
��: ;
UpdateIndicator
�� 
(
�� 
Klines
�� "
,
��" #
Model
��$ )
.
��) *
BOC
��* -
.
��- .
Values
��. 4
,
��4 5
BOC
��6 9
)
��9 :
;
��: ;
}
�� 	
private
�� 
void
�� 
UpdateIndicator
�� $
(
��$ %
IEnumerable
��% 0
<
��0 1
Kline
��1 6
>
��6 7
Klines
��8 >
,
��> ?
IChartValues
��@ L
values
��M S
,
��S T
IEnumerable
��U `
<
��` a
object
��a g
>
��g h
	newValues
��i r
)
��r s
{
�� 	
if
�� 
(
�� 
values
�� 
.
�� 
Count
�� 
==
�� 
$num
��  !
)
��! "
{
�� 
values
�� 
.
�� 
AddRange
�� 
(
��  
	newValues
��  )
.
��) *
Select
��* 0
(
��0 1
x
��1 2
=>
��3 5
(
��6 7
object
��7 =
)
��= >
Convert
��> E
.
��E F
ToDouble
��F N
(
��N O
x
��O P
)
��P Q
)
��Q R
)
��R S
;
��S T
return
�� 
;
�� 
}
�� 
if
�� 
(
�� 
Model
�� 
.
�� 
Labels
�� 
.
�� 
Last
�� !
(
��! "
)
��" #
==
��$ &
Klines
��' -
.
��- .
Last
��. 2
(
��2 3
)
��3 4
.
��4 5
	_OpenDate
��5 >
.
��> ?
ToString
��? G
(
��G H
$str
��H N
)
��N O
)
��O P
{
�� 
values
�� 
[
�� 
^
�� 
$num
�� 
]
�� 
=
�� 
	newValues
�� &
.
��& '
Last
��' +
(
��+ ,
)
��, -
;
��- .
return
�� 
;
�� 
}
�� 
values
�� 
.
�� 
Add
�� 
(
�� 
	newValues
��  
.
��  !
Last
��! %
(
��% &
)
��& '
)
��' (
;
��( )
}
�� 	
public
�� 
void
�� -
UserSymbolsListSelectionChanged
�� 3
(
��3 4
)
��4 5
{
�� 	
Model
�� 
.
�� !
AddUserSymbolString
�� %
=
��& '
Model
��( -
.
��- . 
SelectedUserSymbol
��. @
?
��@ A
.
��A B
Key
��B E
;
��E F
}
�� 	
public
�� 
void
�� 
AddUser
�� 
(
�� 
)
�� 
{
�� 	
try
�� 
{
�� 
if
�� 
(
�� 
!
�� 

Connection
�� 
.
��  
Context
��  '
.
��' (
Users
��( -
.
��- .
Any
��. 1
(
��1 2
x
��2 3
=>
��4 6
x
��7 8
.
��8 9
Username
��9 A
==
��B D
Model
��E J
.
��J K
AddUserString
��K X
)
��X Y
)
��Y Z
{
�� 
User
�� 
?
�� 
user
�� 
=
��  
new
��! $
User
��% )
(
��) *
Model
��* /
.
��/ 0
AddUserString
��0 =
??
��> @
$str
��A C
)
��C D
{
��E F
PAC
��G J
=
��K L
true
��M Q
}
��R S
;
��S T

Connection
�� 
.
�� 
Context
�� &
.
��& '

CreateUser
��' 1
(
��1 2
user
��2 6
)
��6 7
;
��7 8
Model
�� 
.
�� 
SelectedUser
�� &
=
��' (
user
��) -
;
��- .

MessageBox
�� 
.
�� 
Show
�� #
(
��# $
$str
��$ B
,
��B C
$str
��D W
,
��W X
MessageBoxButton
��Y i
.
��i j
OK
��j l
)
��l m
;
��m n
}
�� 
else
�� 
if
�� 
(
�� 

Connection
�� #
.
��# $
Context
��$ +
.
��+ ,
Users
��, 1
.
��1 2
Any
��2 5
(
��5 6
x
��6 7
=>
��8 :
x
��; <
.
��< =
Username
��= E
==
��F H
Model
��I N
.
��N O
AddUserString
��O \
&&
��] _
x
��` a
.
��a b
PAC
��b e
==
��f h
false
��i n
)
��n o
)
��o p
{
�� 
User
�� 
?
�� 
user
�� 
=
��  

Connection
��! +
.
��+ ,
Context
��, 3
.
��3 4
Users
��4 9
.
��9 :
First
��: ?
(
��? @
x
��@ A
=>
��B D
x
��E F
.
��F G
Username
��G O
==
��P R
Model
��S X
.
��X Y
AddUserString
��Y f
&&
��g i
x
��j k
.
��k l
PAC
��l o
==
��p r
false
��s x
)
��x y
;
��y z
user
�� 
.
�� 
PAC
�� 
=
�� 
true
�� #
;
��# $

Connection
�� 
.
�� 
Context
�� &
.
��& '
SaveChanges
��' 2
(
��2 3
)
��3 4
;
��4 5
Model
�� 
.
�� 
SelectedUser
�� &
=
��' (
user
��) -
;
��- .

MessageBox
�� 
.
�� 
Show
�� #
(
��# $
$str
��$ B
,
��B C
$str
��D W
,
��W X
MessageBoxButton
��Y i
.
��i j
OK
��j l
)
��l m
;
��m n
}
�� 
else
�� 
{
�� 
User
�� 
user
�� 
=
�� 

Connection
��  *
.
��* +
Context
��+ 2
.
��2 3
Users
��3 8
.
��8 9
First
��9 >
(
��> ?
x
��? @
=>
��A C
x
��D E
.
��E F
Username
��F N
==
��O Q
Model
��R W
.
��W X
AddUserString
��X e
)
��e f
;
��f g
Model
�� 
.
�� 
SelectedUser
�� &
=
��' (
user
��) -
;
��- .
}
�� 
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 

MessageBox
�� 
.
�� 
Show
�� 
(
��  
$"
��  "
$str
��" ;
{
��; <
ex
��< >
.
��> ?
Message
��? F
}
��F G
"
��G H
,
��H I
$str
��J P
,
��P Q
MessageBoxButton
��R b
.
��b c
OK
��c e
,
��e f
MessageBoxImage
��g v
.
��v w
Error
��w |
)
��| }
;
��} ~
}
�� 
}
�� 	
public
�� 
void
�� 
DelUser
�� 
(
�� 
)
�� 
{
�� 	
try
�� 
{
�� 
if
�� 
(
�� 
Model
�� 
.
�� 
SelectedUser
�� &
==
��' )
null
��* .
)
��. /
return
��0 6
;
��6 7
Model
�� 
.
�� 
SelectedUser
�� "
.
��" #
PAC
��# &
=
��' (
false
��) .
;
��. /

Connection
�� 
.
�� 
Context
�� "
.
��" #
SaveChanges
��# .
(
��. /
)
��/ 0
;
��0 1

MessageBox
�� 
.
�� 
Show
�� 
(
��  
$str
��  >
,
��> ?
$str
��@ S
,
��S T
MessageBoxButton
��U e
.
��e f
OK
��f h
)
��h i
;
��i j
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 

MessageBox
�� 
.
�� 
Show
�� 
(
��  
$"
��  "
$str
��" ;
{
��; <
ex
��< >
.
��> ?
Message
��? F
}
��F G
"
��G H
,
��H I
$str
��J P
,
��P Q
MessageBoxButton
��R b
.
��b c
OK
��c e
,
��e f
MessageBoxImage
��g v
.
��v w
Error
��w |
)
��| }
;
��} ~
}
�� 
}
�� 	
public
�� 
void
�� 
AddUserSymbol
�� !
(
��! "
)
��" #
{
�� 	
try
�� 
{
�� 
if
�� 
(
�� 
Model
�� 
.
�� 
SelectedUser
�� &
==
��' )
null
��* .
)
��. /
return
��0 6
;
��6 7
bool
�� 
showMessage
��  
=
��! "
false
��# (
;
��( )
if
�� 
(
�� 
Model
�� 
.
�� 
SelectedUser
�� &
.
��& '

PACSymbols
��' 1
.
��1 2
Any
��2 5
(
��5 6
x
��6 7
=>
��8 :
x
��; <
.
��< =
Key
��= @
.
��@ A
Equals
��A G
(
��G H
Model
��H M
.
��M N!
AddUserSymbolString
��N a
)
��a b
)
��b c
)
��c d
{
�� 
int
�� 
addDays
�� 
=
��  !
Model
��" '
.
��' (
AddUserDays
��( 3
==
��4 6
$num
��7 8
?
��9 :
$num
��; A
:
��B C
Model
��D I
.
��I J
AddUserDays
��J U
;
��U V
DateTime
�� 
newDate
�� $
=
��% &
Model
��' ,
.
��, -
SelectedUser
��- 9
.
��9 :

PACSymbols
��: D
.
��D E
First
��E J
(
��J K
x
��K L
=>
��M O
x
��P Q
.
��Q R
Key
��R U
.
��U V
Equals
��V \
(
��\ ]
Model
��] b
.
��b c!
AddUserSymbolString
��c v
)
��v w
)
��w x
.
��x y
Value
��y ~
>=�� �
DateTime��� �
.��� �
Now��� �
?��� �
Model
�� 
.
�� 
SelectedUser
�� *
.
��* +

PACSymbols
��+ 5
.
��5 6
First
��6 ;
(
��; <
x
��< =
=>
��> @
x
��A B
.
��B C
Key
��C F
.
��F G
Equals
��G M
(
��M N
Model
��N S
.
��S T!
AddUserSymbolString
��T g
)
��g h
)
��h i
.
��i j
Value
��j o
.
��o p
AddDays
��p w
(
��w x
addDays
��x 
)�� �
:��� �
DateTime
��  
.
��  !
Now
��! $
.
��$ %
AddDays
��% ,
(
��, -
addDays
��- 4
)
��4 5
;
��5 6
Model
�� 
.
�� 
SelectedUser
�� &
.
��& '

PACSymbols
��' 1
[
��1 2
Model
��2 7
.
��7 8!
AddUserSymbolString
��8 K
??
��L N
$str
��O Q
]
��Q R
=
��S T
newDate
��U \
;
��\ ]
}
�� 
else
�� 
{
�� 
Model
�� 
.
�� 
SelectedUser
�� &
.
��& '

PACSymbols
��' 1
.
��1 2
Add
��2 5
(
��5 6
Model
��6 ;
.
��; <!
AddUserSymbolString
��< O
??
��P R
$str
��S U
,
��U V
DateTime
��W _
.
��_ `
Now
��` c
.
��c d
AddDays
��d k
(
��k l
Model
��l q
.
��q r
AddUserDays
��r }
)
��} ~
)
��~ 
;�� �
showMessage
�� 
=
��  !
true
��" &
;
��& '
}
�� 
Model
�� 
.
�� 
SelectedUser
�� "
.
��" #
SaveUserSymbols
��# 2
(
��2 3
)
��3 4
;
��4 5

Connection
�� 
.
�� 
Context
�� "
.
��" #
SaveChanges
��# .
(
��. /
)
��/ 0
;
��0 1
Model
�� 
.
�� !
SelectedUserSymbols
�� )
=
��* +
new
��, /
(
��/ 0
Model
��0 5
.
��5 6
SelectedUser
��6 B
.
��B C

PACSymbols
��C M
)
��M N
;
��N O
if
�� 
(
�� 
showMessage
�� 
)
��  

MessageBox
��! +
.
��+ ,
Show
��, 0
(
��0 1
$str
��1 X
,
��X Y
$str
��Z j
,
��j k
MessageBoxButton
��l |
.
��| }
OK
��} 
)�� �
;��� �
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 

MessageBox
�� 
.
�� 
Show
�� 
(
��  
$"
��  "
$str
��" ;
{
��; <
ex
��< >
.
��> ?
Message
��? F
}
��F G
"
��G H
,
��H I
$str
��J P
,
��P Q
MessageBoxButton
��R b
.
��b c
OK
��c e
,
��e f
MessageBoxImage
��g v
.
��v w
Error
��w |
)
��| }
;
��} ~
}
�� 
}
�� 	
public
�� 
void
�� 
DelUserSymbol
�� !
(
��! "
)
��" #
{
�� 	
try
�� 
{
�� 
if
�� 
(
�� 
Model
�� 
.
�� 
SelectedUser
�� &
==
��' )
null
��* .
||
��/ 1
Model
��2 7
.
��7 8!
SelectedUserSymbols
��8 K
?
��K L
.
��L M
Count
��M R
==
��S U
$num
��V W
)
��W X
return
��Y _
;
��_ `
Model
�� 
.
�� 
SelectedUser
�� "
.
��" #

PACSymbols
��# -
.
��- .
Remove
��. 4
(
��4 5
Model
��5 :
.
��: ; 
SelectedUserSymbol
��; M
?
��M N
.
��N O
Key
��O R
??
��S U
$str
��V X
)
��X Y
;
��Y Z
Model
�� 
.
�� 
SelectedUser
�� "
.
��" #
SaveUserSymbols
��# 2
(
��2 3
)
��3 4
;
��4 5

Connection
�� 
.
�� 
Context
�� "
.
��" #
SaveChanges
��# .
(
��. /
)
��/ 0
;
��0 1
Model
�� 
.
�� !
SelectedUserSymbols
�� )
=
��* +
new
��, /
(
��/ 0
Model
��0 5
.
��5 6
SelectedUser
��6 B
.
��B C

PACSymbols
��C M
)
��M N
;
��N O

MessageBox
�� 
.
�� 
Show
�� 
(
��  
$str
��  ;
,
��; <
$str
��= P
,
��P Q
MessageBoxButton
��R b
.
��b c
OK
��c e
)
��e f
;
��f g
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 

MessageBox
�� 
.
�� 
Show
�� 
(
��  
$"
��  "
$str
��" ;
{
��; <
ex
��< >
.
��> ?
Message
��? F
}
��F G
"
��G H
,
��H I
$str
��J P
,
��P Q
MessageBoxButton
��R b
.
��b c
OK
��c e
,
��e f
MessageBoxImage
��g v
.
��v w
Error
��w |
)
��| }
;
��} ~
}
�� 
}
�� 	
public
�� 
void
�� 
AddGroup
�� 
(
�� 
)
�� 
{
�� 	
if
�� 
(
�� 
string
�� 
.
�� 
IsNullOrEmpty
�� $
(
��$ %
Model
��% *
.
��* +
AddGroupString
��+ 9
)
��9 :
)
��: ;
return
��< B
;
��B C
Settings
�� 
.
�� 
TelegramSettings
�� %
.
��% &
	PACGroups
��& /
.
��/ 0
Add
��0 3
(
��3 4
Model
��4 9
.
��9 :
AddGroupString
��: H
)
��H I
;
��I J
Settings
�� 
.
�� 
SaveSettings
�� !
(
��! "
)
��" #
;
��# $

MessageBox
�� 
.
�� 
Show
�� 
(
�� 
$str
�� 4
,
��4 5
$str
��6 D
,
��D E
MessageBoxButton
��F V
.
��V W
OK
��W Y
)
��Y Z
;
��Z [
}
�� 	
public
�� 
void
�� 
DelGroup
�� 
(
�� 
)
�� 
{
�� 	
Settings
�� 
.
�� 
TelegramSettings
�� %
.
��% &
	PACGroups
��& /
.
��/ 0
Remove
��0 6
(
��6 7
Model
��7 <
.
��< =
SelectedGroup
��= J
??
��K M
$str
��N P
)
��P Q
;
��Q R
Settings
�� 
.
�� 
SaveSettings
�� !
(
��! "
)
��" #
;
��# $

MessageBox
�� 
.
�� 
Show
�� 
(
�� 
$str
�� 4
,
��4 5
$str
��6 D
,
��D E
MessageBoxButton
��F V
.
��V W
OK
��W Y
)
��Y Z
;
��Z [
}
�� 	
public
�� 
void
�� 
	DelSymbol
�� 
(
�� 
)
�� 
{
�� 	
if
�� 
(
�� 
Model
�� 
.
�� 
SelectedSymbol
�� $
==
��% '
null
��( ,
)
��, -
return
��. 4
;
��4 5
string
�� 
?
�� 
symbol
�� 
=
�� 
Model
�� "
.
��" #
SelectedSymbol
��# 1
.
��1 2
Symbol
��2 8
;
��8 9
Settings
�� 
.
�� 
BotsSettings
�� !
.
��! "
PACSettings
��" -
.
��- .
Symbols
��. 5
.
��5 6
Remove
��6 <
(
��< =
Model
��= B
.
��B C
SelectedSymbol
��C Q
.
��Q R
Symbol
��R X
)
��X Y
;
��Y Z
Model
�� 
.
�� 
SelectedSymbol
��  
.
��  !
Dispose
��! (
(
��( )
)
��) *
;
��* +
Settings
�� 
.
�� 
BotsSettings
�� !
.
��! "
PACSettings
��" -
.
��- .
Symbols
��. 5
.
��5 6
Remove
��6 <
(
��< =
Model
��= B
.
��B C
SelectedSymbol
��C Q
.
��Q R
Symbol
��R X
)
��X Y
;
��Y Z
Settings
�� 
.
�� 
SaveSettings
�� !
(
��! "
)
��" #
;
��# $
Model
�� 
.
�� 
Symbols
�� 
.
�� 
Remove
��  
(
��  !
Model
��! &
.
��& '
SelectedSymbol
��' 5
)
��5 6
;
��6 7
if
�� 
(
�� 
Model
�� 
.
�� 
UISymbol
�� 
==
�� !
symbol
��" (
&&
��) +
Model
��, 1
.
��1 2
Symbols
��2 9
.
��9 :
Count
��: ?
>
��@ A
$num
��B C
)
��C D
{
�� 
Model
�� 
.
�� 
SelectedSymbol
�� $
=
��% &
Model
��' ,
.
��, -
Symbols
��- 4
[
��4 5
$num
��5 6
]
��6 7
;
��7 8
SetUISymbol
�� 
(
�� 
)
�� 
;
�� 
}
�� 
}
�� 	
public
�� 
void
�� 
	AddSymbol
�� 
(
�� 
)
�� 
{
�� 	
try
�� 
{
�� 
if
�� 
(
�� 
Model
�� 
.
�� 
Symbols
�� !
.
��! "
Any
��" %
(
��% &
x
��& '
=>
��( *
x
��+ ,
.
��, -
Symbol
��- 3
==
��4 6
Model
��7 <
.
��< =
AddSymbolString
��= L
)
��L M
)
��M N
{
�� 

MessageBox
�� 
.
�� 
Show
�� #
(
��# $
$str
��$ =
,
��= >
$str
��? N
,
��N O
MessageBoxButton
��P `
.
��` a
OK
��a c
,
��c d
MessageBoxImage
��e t
.
��t u
Information��u �
)��� �
;��� �
return
�� 
;
�� 
}
�� 

_AddSymbol
�� 
(
�� 
Model
��  
.
��  !
AddSymbolString
��! 0
??
��1 3
$str
��4 6
)
��6 7
;
��7 8

MessageBox
�� 
.
�� 
Show
�� 
(
��  
$str
��  ;
,
��; <
$str
��= M
,
��M N
MessageBoxButton
��O _
.
��_ `
OK
��` b
)
��b c
;
��c d
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 

MessageBox
�� 
.
�� 
Show
�� 
(
��  
$"
��  "
$str
��" ;
{
��; <
ex
��< >
.
��> ?
Message
��? F
}
��F G
"
��G H
,
��H I
$str
��J P
,
��P Q
MessageBoxButton
��R b
.
��b c
OK
��c e
,
��e f
MessageBoxImage
��g v
.
��v w
Error
��w |
)
��| }
;
��} ~
}
�� 
}
�� 	
private
�� 
void
�� 

_AddSymbol
�� 
(
��  
string
��  &
symbol
��' -
)
��- .
{
�� 	
Model
�� 
.
�� 
Symbols
�� 
.
�� 
Add
�� 
(
�� 
new
�� !
PAC
��" %
(
��% &
symbol
��& ,
,
��, -
Binance
��. 5
.
��5 6
Net
��6 9
.
��9 :
Enums
��: ?
.
��? @
KlineInterval
��@ M
.
��M N
	OneMinute
��N W
,
��W X
(
��Y Z
string
��Z `
symbol
��a g
,
��g h

Dictionary
��i s
<
��s t
string
��t z
,
��z {
List��| �
<��� �
object��� �
>��� �
>��� �
values��� �
)��� �
=>��� �
{��� �
}��� �
,��� �!
SendSignalMessage��� �
)��� �
{��� �
}��� �
)��� �
;��� �
Settings
�� 
.
�� 
BotsSettings
�� !
.
��! "
PACSettings
��" -
.
��- .
Symbols
��. 5
.
��5 6
Add
��6 9
(
��9 :
symbol
��: @
)
��@ A
;
��A B
Settings
�� 
.
�� 
SaveSettings
�� !
(
��! "
)
��" #
;
��# $
}
�� 	
public
�� 
Task
�� 
AddAllSymbols
�� !
(
��! "
)
��" #
{
�� 	
CryptoExchange
�� 
.
�� 
Net
�� 
.
�� 
Objects
�� &
.
��& '
WebCallResult
��' 4
<
��4 5
Binance
��5 <
.
��< =
Net
��= @
.
��@ A
Objects
��A H
.
��H I
Models
��I O
.
��O P
Spot
��P T
.
��T U!
BinanceExchangeInfo
��U h
>
��h i
?
��i j
exchangeInfos
��k x
=
��y z
StaticBinance��{ �
.��� �
Client��� �
.��� �
SpotApi��� �
.��� �
ExchangeData��� �
.��� �$
GetExchangeInfoAsync��� �
(��� �
)��� �
.��� �
Result��� �
;��� �
Model
�� 
.
�� 
Symbols
�� 
.
�� 
Clear
�� 
(
��  
)
��  !
;
��! "
Settings
�� 
.
�� 
BotsSettings
�� !
.
��! "
PACSettings
��" -
.
��- .
Symbols
��. 5
.
��5 6
Clear
��6 ;
(
��; <
)
��< =
;
��= >
exchangeInfos
�� 
.
�� 
Data
�� 
.
�� 
Symbols
�� &
.
��& '
ToList
��' -
(
��- .
)
��. /
.
��/ 0
ForEach
��0 7
(
��7 8
x
��8 9
=>
��: <
{
�� 
try
�� 
{
�� 

_AddSymbol
�� 
(
�� 
x
��  
.
��  !
Name
��! %
)
��% &
;
��& '
}
�� 
catch
�� 
(
�� 
	Exception
��  
ex
��! #
)
��# $
{
�� 

MessageBox
�� 
.
�� 
Show
�� #
(
��# $
$"
��$ &
{
��& '
x
��' (
.
��( )
Name
��) -
}
��- .
$str
��. S
{
��S T
ex
��T V
.
��V W
Message
��W ^
}
��^ _
"
��_ `
,
��` a
$str
��b h
,
��h i
MessageBoxButton
��j z
.
��z {
OK
��{ }
,
��} ~
MessageBoxImage�� �
.��� �
Error��� �
)��� �
;��� �
}
�� 
}
�� 
)
�� 
;
�� 
return
�� 
Task
�� 
.
�� 
Delay
�� 
(
�� 
$num
�� 
)
��  
;
��  !
}
�� 	
public
�� 
void
�� 
SendSignalMessage
�� %
(
��% &
string
��& ,
symbol
��- 3
,
��3 4

Dictionary
��5 ?
<
��? @
string
��@ F
,
��F G
List
��H L
<
��L M
object
��M S
>
��S T
>
��T U
values
��V \
,
��\ ]
Enums
��^ c
.
��c d

SignalType
��d n
type
��o s
)
��s t
{
�� 	
string
�� 
message
�� 
=
�� 
type
�� !
switch
��" (
{
�� 
Enums
�� 
.
�� 

SignalType
��  
.
��  !
Short
��! &
=>
��' )
Settings
��* 2
.
��2 3
BotsSettings
��3 ?
.
��? @
PACSettings
��@ K
.
��K L
SignalMessages
��L Z
.
��Z [
Short
��[ `
,
��` a
Enums
�� 
.
�� 

SignalType
��  
.
��  !
Long
��! %
=>
��& (
Settings
��) 1
.
��1 2
BotsSettings
��2 >
.
��> ?
PACSettings
��? J
.
��J K
SignalMessages
��K Y
.
��Y Z
Long
��Z ^
,
��^ _
Enums
�� 
.
�� 

SignalType
��  
.
��  !
Exit
��! %
=>
��& (
Settings
��) 1
.
��1 2
BotsSettings
��2 >
.
��> ?
PACSettings
��? J
.
��J K
SignalMessages
��K Y
.
��Y Z
Exit
��Z ^
,
��^ _
_
�� 
=>
�� 
$str
�� 
,
�� 
}
�� 
;
�� 
if
�� 
(
�� 
string
�� 
.
�� 
IsNullOrEmpty
�� $
(
��$ %
message
��% ,
)
��, -
)
��- .
return
��/ 5
;
��5 6
message
�� 
=
�� 
message
�� 
.
�� 
Replace
�� %
(
��% &
$str
��& 0
,
��0 1
symbol
��2 8
)
��8 9
.
��9 :
Replace
��: A
(
��A B
$str
��B K
,
��K L
Math
��M Q
.
��Q R
Round
��R W
(
��W X
(
��X Y
(
��Y Z
Kline
��Z _
)
��_ `
values
��` f
[
��f g
$str
��g o
]
��o p
.
��p q
Last
��q u
(
��u v
)
��v w
)
��w x
.
��x y
Close
��y ~
,
��~ 
$num��� �
)��� �
.��� �
ToString��� �
(��� �
)��� �
)��� �
;��� �
if
�� 
(
�� 
type
�� 
==
�� 
Enums
�� 
.
�� 

SignalType
�� (
.
��( )
Short
��) .
)
��. /
message
��0 7
=
��8 9
message
��: A
.
��A B
Replace
��B I
(
��I J
$str
��J U
,
��U V
Math
��W [
.
��[ \
Round
��\ a
(
��a b
(
��b c
double
��c i
)
��i j
values
��j p
[
��p q
$str
��q v
]
��v w
.
��w x
Last
��x |
(
��| }
)
��} ~
,
��~ 
$num��� �
)��� �
.��� �
ToString��� �
(��� �
)��� �
)��� �
;��� �
else
�� 
if
�� 
(
�� 
type
�� 
==
�� 
Enums
�� "
.
��" #

SignalType
��# -
.
��- .
Long
��. 2
)
��2 3
message
��4 ;
=
��< =
message
��> E
.
��E F
Replace
��F M
(
��M N
$str
��N Y
,
��Y Z
Math
��[ _
.
��_ `
Round
��` e
(
��e f
(
��f g
double
��g m
)
��m n
values
��n t
[
��t u
$str
��u z
]
��z {
.
��{ |
Last��| �
(��� �
)��� �
,��� �
$num��� �
)��� �
.��� �
ToString��� �
(��� �
)��� �
)��� �
;��� �
else
�� 
message
�� 
=
�� 
message
�� "
.
��" #
Replace
��# *
(
��* +
$str
��+ 6
,
��6 7
Math
��8 <
.
��< =
Round
��= B
(
��B C
(
��C D
double
��D J
)
��J K
values
��K Q
[
��Q R
$str
��R W
]
��W X
.
��X Y
Last
��Y ]
(
��] ^
)
��^ _
,
��_ `
$num
��a b
)
��b c
.
��c d
ToString
��d l
(
��l m
)
��m n
+
��o p
$str
��q w
+
��x y
Math
��z ~
.
��~ 
Round�� �
(��� �
(��� �
double��� �
)��� �
values��� �
[��� �
$str��� �
]��� �
.��� �
Last��� �
(��� �
)��� �
,��� �
$num��� �
)��� �
.��� �
ToString��� �
(��� �
)��� �
)��� �
;��� �
foreach
�� 
(
�� 
User
�� 
user
�� 
in
�� !
Model
��" '
.
��' (
Users
��( -
)
��- .
{
�� 
try
�� 
{
�� 
if
�� 
(
�� 
user
�� 
.
�� 
ChatId
�� #
==
��$ &
$num
��' (
||
��) +
!
��, -
user
��- 1
.
��1 2

PACSymbols
��2 <
.
��< =
Any
��= @
(
��@ A
x
��A B
=>
��C E
x
��F G
.
��G H
Key
��H K
.
��K L
Equals
��L R
(
��R S
symbol
��S Y
)
��Y Z
&&
��[ ]
x
��^ _
.
��_ `
Value
��` e
>
��f g
DateTime
��h p
.
��p q
Now
��q t
)
��t u
)
��u v
continue
��w 
;�� �

BotClients
�� 
.
�� 
	PACClient
�� (
.
��( )"
SendTextMessageAsync
��) =
(
��= >
user
��> B
.
��B C
ChatId
��C I
,
��I J
message
��K R
)
��R S
;
��S T
}
�� 
catch
�� 
(
�� 
	Exception
��  
ex
��! #
)
��# $
{
�� 
Console
�� 
.
�� 
	WriteLine
�� %
(
��% &
$"
��& (
$str
��( 9
{
��9 :
user
��: >
.
��> ?
Username
��? G
}
��G H
$str
��H c
{
��c d
ex
��d f
.
��f g
Message
��g n
}
��n o
"
��o p
)
��p q
;
��q r
}
�� 
}
�� 
foreach
�� 
(
�� 
string
�� 
?
�� 
group
�� "
in
��# %
Settings
��& .
.
��. /
TelegramSettings
��/ ?
.
��? @
	PACGroups
��@ I
)
��I J
{
�� 
try
�� 
{
�� 

BotClients
�� 
.
�� 
	PACClient
�� (
.
��( )"
SendTextMessageAsync
��) =
(
��= >
group
��> C
,
��C D
message
��E L
)
��L M
;
��M N
}
�� 
catch
�� 
(
�� 
	Exception
��  
ex
��! #
)
��# $
{
�� 
Console
�� 
.
�� 
	WriteLine
�� %
(
��% &
$"
��& (
$str
��( 8
{
��8 9
group
��9 >
}
��> ?
$str
��? Z
{
��Z [
ex
��[ ]
.
��] ^
Message
��^ e
}
��e f
"
��f g
)
��g h
;
��h i
}
�� 
}
�� 
}
�� 	
public
�� 
void
�� 
SaveSettings
��  
(
��  !
)
��! "
{
�� 	
Settings
�� 
.
�� 
BotsSettings
�� !
.
��! "
PACSettings
��" -
.
��- .
SignalMessages
��. <
.
��< =
Short
��= B
=
��C D
Model
��E J
.
��J K
SellSignalString
��K [
;
��[ \
Settings
�� 
.
�� 
BotsSettings
�� !
.
��! "
PACSettings
��" -
.
��- .
SignalMessages
��. <
.
��< =
Long
��= A
=
��B C
Model
��D I
.
��I J
BuySignalString
��J Y
;
��Y Z
Settings
�� 
.
�� 
BotsSettings
�� !
.
��! "
PACSettings
��" -
.
��- .
SignalMessages
��. <
.
��< =
Exit
��= A
=
��B C
Model
��D I
.
��I J
ExitSignalString
��J Z
;
��Z [
Settings
�� 
.
�� 
BotsSettings
�� !
.
��! "
PACSettings
��" -
.
��- .

SMMAPeriot
��. 8
=
��9 :
Model
��; @
.
��@ A

SMMAPeriot
��A K
;
��K L
Settings
�� 
.
�� 
BotsSettings
�� !
.
��! "
PACSettings
��" -
.
��- .
MinSignalPeriot
��. =
=
��> ?
Model
��@ E
.
��E F
MinSignalPeriot
��F U
;
��U V
Settings
�� 
.
�� 
BotsSettings
�� !
.
��! "
PACSettings
��" -
.
��- .
KlineInterval
��. ;
=
��< =
Enum
��> B
.
��B C
GetName
��C J
(
��J K
typeof
��K Q
(
��Q R
KlineInterval
��R _
)
��_ `
,
��` a
Model
��b g
.
��g h
KlineInterval
��h u
)
��u v
;
��v w
Settings
�� 
.
�� 
SaveSettings
�� !
(
��! "
)
��" #
;
��# $

MessageBox
�� 
.
�� 
Show
�� 
(
�� 
$str
�� ;
,
��; <
$str
��= Q
,
��Q R
MessageBoxButton
��S c
.
��c d
OK
��d f
)
��f g
;
��g h
}
�� 	
public
�� 
void
�� 
LoadSettings
��  
(
��  !
)
��! "
{
�� 	
Model
�� 
.
�� 
SellSignalString
�� "
=
��# $
Settings
��% -
.
��- .
BotsSettings
��. :
.
��: ;
PACSettings
��; F
.
��F G
SignalMessages
��G U
.
��U V
Short
��V [
;
��[ \
Model
�� 
.
�� 
BuySignalString
�� !
=
��" #
Settings
��$ ,
.
��, -
BotsSettings
��- 9
.
��9 :
PACSettings
��: E
.
��E F
SignalMessages
��F T
.
��T U
Long
��U Y
;
��Y Z
Model
�� 
.
�� 
ExitSignalString
�� "
=
��# $
Settings
��% -
.
��- .
BotsSettings
��. :
.
��: ;
PACSettings
��; F
.
��F G
SignalMessages
��G U
.
��U V
Exit
��V Z
;
��Z [
Model
�� 
.
�� 

SMMAPeriot
�� 
=
�� 
Settings
�� '
.
��' (
BotsSettings
��( 4
.
��4 5
PACSettings
��5 @
.
��@ A

SMMAPeriot
��A K
;
��K L
Model
�� 
.
�� 
MinSignalPeriot
�� !
=
��" #
Settings
��$ ,
.
��, -
BotsSettings
��- 9
.
��9 :
PACSettings
��: E
.
��E F
MinSignalPeriot
��F U
;
��U V
}
�� 	
public
�� 
void
�� !
ChangeKlineInterval
�� '
(
��' (
)
��( )
{
�� 	
MessageBoxResult
�� 
change
�� #
=
��$ %

MessageBox
��& 0
.
��0 1
Show
��1 5
(
��5 6
$str��6 �
,��� �
$str��� �
,��� � 
MessageBoxButton��� �
.��� �
YesNo��� �
,��� �
MessageBoxImage��� �
.��� �
Warning��� �
)��� �
;��� �
if
�� 
(
�� 
change
�� 
==
�� 
MessageBoxResult
�� *
.
��* +
No
��+ -
)
��- .
{
�� 
Model
�� 
.
�� 
KlineInterval
�� #
=
��$ %
Model
��& +
.
��+ ,
KlineIntervals
��, :
.
��: ;
First
��; @
(
��@ A
x
��A B
=>
��C E
x
��F G
.
��G H
Equals
��H N
(
��N O
Model
��O T
.
��T U
Symbols
��U \
.
��\ ]
First
��] b
(
��b c
)
��c d
.
��d e
Interval
��e m
)
��m n
)
��n o
;
��o p
return
�� 
;
�� 
}
�� 
Model
�� 
.
�� 
Symbols
�� 
.
�� 
ToList
��  
(
��  !
)
��! "
.
��" #
ForEach
��# *
(
��* +
x
��+ ,
=>
��- /
x
��0 1
.
��1 2
ChangeInterval
��2 @
(
��@ A
Model
��A F
.
��F G
KlineInterval
��G T
)
��T U
)
��U V
;
��V W
SaveSettings
�� 
(
�� 
)
�� 
;
�� 
}
�� 	
}
�� 
}�� ��
vC:\Users\Ömer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\UI\ViewModels\RSIViewModel.cs
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
values	AA| �
)
AA� �
=>
AA� �
{
AA� �
}
AA� �
,
AA� �
SendSignalMessage
AA� �
,
AA� �
true
AA� �
)
AA� �
{
AA� �
}
AA� �
)
AA� �
;
AA� �
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
$str	EE �
"
EE� �
,
EE� �
$str
EE� �
,
EE� �
MessageBoxButton
EE� �
.
EE� �
YesNo
EE� �
,
EE� �
MessageBoxImage
EE� �
.
EE� �
Error
EE� �
)
EE� �
;
EE� �
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
object	jj| �
>
jj� �
>
jj� �
values
jj� �
)
jj� �
=>
jj� �
{
jj� �
}
jj� �
;
jj� �
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
_Low	xx �
,
xx� �
(
xx� �
double
xx� �
)
xx� �
x
xx� �
.
xx� �
_Close
xx� �
)
xx� �
)
xx� �
.
xx� �
ToList
xx� �
(
xx� �
)
xx� �
)
xx� �
;
xx� �
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
�� 
(
�� 
LastChartKline
�� "
==
��# %
null
��& *
)
��* +
return
��, 2
;
��2 3
LastChartKline
�� 
.
�� 
Close
�� $
=
��% &
(
��' (
double
��( .
)
��. /
	LastKline
��/ 8
.
��8 9
_Close
��9 ?
;
��? @
if
�� 
(
�� 
LastChartKline
�� "
.
��" #
High
��# '
<
��( )
(
��* +
double
��+ 1
)
��1 2
	LastKline
��2 ;
.
��; <
_High
��< A
)
��A B
LastChartKline
��C Q
.
��Q R
High
��R V
=
��W X
(
��Y Z
double
��Z `
)
��` a
	LastKline
��a j
.
��j k
_High
��k p
;
��p q
if
�� 
(
�� 
LastChartKline
�� "
.
��" #
Low
��# &
<
��' (
(
��) *
double
��* 0
)
��0 1
	LastKline
��1 :
.
��: ;
_Low
��; ?
)
��? @
LastChartKline
��A O
.
��O P
Low
��P S
=
��T U
(
��V W
double
��W ]
)
��] ^
	LastKline
��^ g
.
��g h
_Low
��h l
;
��l m
return
�� 
;
�� 
}
�� 
Model
�� 
.
�� 
Labels
�� 
.
�� 
RemoveAt
�� !
(
��! "
$num
��" #
)
��# $
;
��$ %
Model
�� 
.
�� #
KlineSeriesCollection
�� '
[
��' (
$num
��( )
]
��) *
.
��* +
Values
��+ 1
.
��1 2
RemoveAt
��2 :
(
��: ;
$num
��; <
)
��< =
;
��= >
Model
�� 
.
�� 
Labels
�� 
.
�� 
Add
�� 
(
�� 
Klines
�� #
.
��# $
Last
��$ (
(
��( )
)
��) *
.
��* +
	_OpenDate
��+ 4
.
��4 5
ToString
��5 =
(
��= >
$str
��> D
)
��D E
)
��E F
;
��F G
Model
�� 
.
�� #
KlineSeriesCollection
�� '
[
��' (
$num
��( )
]
��) *
.
��* +
Values
��+ 1
.
��1 2
Add
��2 5
(
��5 6
new
��6 9
	OhlcPoint
��: C
(
��C D
(
��D E
double
��E K
)
��K L
Klines
��L R
.
��R S
Last
��S W
(
��W X
)
��X Y
.
��Y Z
_Open
��Z _
,
��_ `
(
��a b
double
��b h
)
��h i
Klines
��i o
.
��o p
Last
��p t
(
��t u
)
��u v
.
��v w
_High
��w |
,
��| }
(
��~ 
double�� �
)��� �
Klines��� �
.��� �
Last��� �
(��� �
)��� �
.��� �
_Low��� �
,��� �
(��� �
double��� �
)��� �
Klines��� �
.��� �
Last��� �
(��� �
)��� �
.��� �
_Close��� �
)��� �
)��� �
;��� �
}
�� 	
public
�� 
void
�� 
UpdateIndicators
�� $
(
��$ %
IEnumerable
��% 0
<
��0 1
Kline
��1 6
>
��6 7
Klines
��8 >
,
��> ?
IEnumerable
��@ K
<
��K L
object
��L R
>
��R S
RSI
��T W
)
��W X
{
�� 	
UpdateIndicator
�� 
(
�� 
Klines
�� "
,
��" #
Model
��$ )
.
��) *
RSI
��* -
.
��- .
Values
��. 4
,
��4 5
RSI
��6 9
)
��9 :
;
��: ;
}
�� 	
private
�� 
void
�� 
UpdateIndicator
�� $
(
��$ %
IEnumerable
��% 0
<
��0 1
Kline
��1 6
>
��6 7
Klines
��8 >
,
��> ?
IChartValues
��@ L
values
��M S
,
��S T
IEnumerable
��U `
<
��` a
object
��a g
>
��g h
	newValues
��i r
)
��r s
{
�� 	
if
�� 
(
�� 
values
�� 
.
�� 
Count
�� 
==
�� 
$num
��  !
)
��! "
{
�� 
values
�� 
.
�� 
AddRange
�� 
(
��  
	newValues
��  )
.
��) *
Select
��* 0
(
��0 1
x
��1 2
=>
��3 5
(
��6 7
object
��7 =
)
��= >
Convert
��> E
.
��E F
ToDouble
��F N
(
��N O
x
��O P
)
��P Q
)
��Q R
)
��R S
;
��S T
return
�� 
;
�� 
}
�� 
if
�� 
(
�� 
Model
�� 
.
�� 
Labels
�� 
.
�� 
Last
�� !
(
��! "
)
��" #
==
��$ &
Klines
��' -
.
��- .
Last
��. 2
(
��2 3
)
��3 4
.
��4 5
	_OpenDate
��5 >
.
��> ?
ToString
��? G
(
��G H
$str
��H N
)
��N O
)
��O P
{
�� 
values
�� 
[
�� 
^
�� 
$num
�� 
]
�� 
=
�� 
	newValues
�� &
.
��& '
Last
��' +
(
��+ ,
)
��, -
;
��- .
return
�� 
;
�� 
}
�� 
values
�� 
.
�� 
Add
�� 
(
�� 
	newValues
��  
.
��  !
Last
��! %
(
��% &
)
��& '
)
��' (
;
��( )
}
�� 	
public
�� 
void
�� -
UserSymbolsListSelectionChanged
�� 3
(
��3 4
)
��4 5
{
�� 	
Model
�� 
.
�� !
AddUserSymbolString
�� %
=
��& '
Model
��( -
.
��- . 
SelectedUserSymbol
��. @
?
��@ A
.
��A B
Key
��B E
;
��E F
}
�� 	
public
�� 
void
�� 
AddUser
�� 
(
�� 
)
�� 
{
�� 	
try
�� 
{
�� 
if
�� 
(
�� 
!
�� 

Connection
�� 
.
��  
Context
��  '
.
��' (
Users
��( -
.
��- .
Any
��. 1
(
��1 2
x
��2 3
=>
��4 6
x
��7 8
.
��8 9
Username
��9 A
==
��B D
Model
��E J
.
��J K
AddUserString
��K X
)
��X Y
)
��Y Z
{
�� 
User
�� 
?
�� 
user
�� 
=
��  
new
��! $
User
��% )
(
��) *
Model
��* /
.
��/ 0
AddUserString
��0 =
??
��> @
$str
��A C
)
��C D
{
��E F
}
��G H
;
��H I

Connection
�� 
.
�� 
Context
�� &
.
��& '

CreateUser
��' 1
(
��1 2
user
��2 6
)
��6 7
;
��7 8
Model
�� 
.
�� 
SelectedUser
�� &
=
��' (
user
��) -
;
��- .

MessageBox
�� 
.
�� 
Show
�� #
(
��# $
$str
��$ B
,
��B C
$str
��D W
,
��W X
MessageBoxButton
��Y i
.
��i j
OK
��j l
)
��l m
;
��m n
}
�� 
else
�� 
{
�� 
User
�� 
user
�� 
=
�� 

Connection
��  *
.
��* +
Context
��+ 2
.
��2 3
Users
��3 8
.
��8 9
First
��9 >
(
��> ?
x
��? @
=>
��A C
x
��D E
.
��E F
Username
��F N
==
��O Q
Model
��R W
.
��W X
AddUserString
��X e
)
��e f
;
��f g
Model
�� 
.
�� 
SelectedUser
�� &
=
��' (
user
��) -
;
��- .
}
�� 
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 

MessageBox
�� 
.
�� 
Show
�� 
(
��  
$"
��  "
$str
��" ;
{
��; <
ex
��< >
.
��> ?
Message
��? F
}
��F G
"
��G H
,
��H I
$str
��J P
,
��P Q
MessageBoxButton
��R b
.
��b c
OK
��c e
,
��e f
MessageBoxImage
��g v
.
��v w
Error
��w |
)
��| }
;
��} ~
}
�� 
}
�� 	
public
�� 
void
�� 
DelUser
�� 
(
�� 
)
�� 
{
�� 	
try
�� 
{
�� 
if
�� 
(
�� 
Model
�� 
.
�� 
SelectedUser
�� &
==
��' )
null
��* .
)
��. /
return
��0 6
;
��6 7

Connection
�� 
.
�� 
Context
�� "
.
��" #

DeleteUser
��# -
(
��- .
Model
��. 3
.
��3 4
SelectedUser
��4 @
)
��@ A
;
��A B

Connection
�� 
.
�� 
Context
�� "
.
��" #
SaveChanges
��# .
(
��. /
)
��/ 0
;
��0 1

MessageBox
�� 
.
�� 
Show
�� 
(
��  
$str
��  >
,
��> ?
$str
��@ S
,
��S T
MessageBoxButton
��U e
.
��e f
OK
��f h
)
��h i
;
��i j
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 

MessageBox
�� 
.
�� 
Show
�� 
(
��  
$"
��  "
$str
��" ;
{
��; <
ex
��< >
.
��> ?
Message
��? F
}
��F G
"
��G H
,
��H I
$str
��J P
,
��P Q
MessageBoxButton
��R b
.
��b c
OK
��c e
,
��e f
MessageBoxImage
��g v
.
��v w
Error
��w |
)
��| }
;
��} ~
}
�� 
}
�� 	
public
�� 
void
�� 
AddGroup
�� 
(
�� 
)
�� 
{
�� 	
if
�� 
(
�� 
string
�� 
.
�� 
IsNullOrEmpty
�� $
(
��$ %
Model
��% *
.
��* +
AddGroupString
��+ 9
)
��9 :
)
��: ;
return
��< B
;
��B C
Settings
�� 
.
�� 
TelegramSettings
�� %
.
��% &
	RSIGroups
��& /
.
��/ 0
Add
��0 3
(
��3 4
Model
��4 9
.
��9 :
AddGroupString
��: H
)
��H I
;
��I J
Settings
�� 
.
�� 
SaveSettings
�� !
(
��! "
)
��" #
;
��# $

MessageBox
�� 
.
�� 
Show
�� 
(
�� 
$str
�� 4
,
��4 5
$str
��6 D
,
��D E
MessageBoxButton
��F V
.
��V W
OK
��W Y
)
��Y Z
;
��Z [
}
�� 	
public
�� 
void
�� 
DelGroup
�� 
(
�� 
)
�� 
{
�� 	
Settings
�� 
.
�� 
TelegramSettings
�� %
.
��% &
	RSIGroups
��& /
.
��/ 0
Remove
��0 6
(
��6 7
Model
��7 <
.
��< =
SelectedGroup
��= J
??
��K M
$str
��N P
)
��P Q
;
��Q R
Settings
�� 
.
�� 
SaveSettings
�� !
(
��! "
)
��" #
;
��# $

MessageBox
�� 
.
�� 
Show
�� 
(
�� 
$str
�� 4
,
��4 5
$str
��6 D
,
��D E
MessageBoxButton
��F V
.
��V W
OK
��W Y
)
��Y Z
;
��Z [
}
�� 	
public
�� 
void
�� 
	DelSymbol
�� 
(
�� 
)
�� 
{
�� 	
if
�� 
(
�� 
Model
�� 
.
�� 
SelectedSymbol
�� $
==
��% '
null
��( ,
)
��, -
return
��. 4
;
��4 5
string
�� 
?
�� 
symbol
�� 
=
�� 
Model
�� "
.
��" #
SelectedSymbol
��# 1
.
��1 2
Symbol
��2 8
;
��8 9
Settings
�� 
.
�� 
BotsSettings
�� !
.
��! "
RSISettings
��" -
.
��- .
Symbols
��. 5
.
��5 6
Remove
��6 <
(
��< =
Model
��= B
.
��B C
SelectedSymbol
��C Q
.
��Q R
Symbol
��R X
)
��X Y
;
��Y Z
Model
�� 
.
�� 
SelectedSymbol
��  
.
��  !
Dispose
��! (
(
��( )
)
��) *
;
��* +
Settings
�� 
.
�� 
BotsSettings
�� !
.
��! "
RSISettings
��" -
.
��- .
Symbols
��. 5
.
��5 6
Remove
��6 <
(
��< =
Model
��= B
.
��B C
SelectedSymbol
��C Q
.
��Q R
Symbol
��R X
)
��X Y
;
��Y Z
Settings
�� 
.
�� 
SaveSettings
�� !
(
��! "
)
��" #
;
��# $
Model
�� 
.
�� 
Symbols
�� 
.
�� 
Remove
��  
(
��  !
Model
��! &
.
��& '
SelectedSymbol
��' 5
)
��5 6
;
��6 7
if
�� 
(
�� 
Model
�� 
.
�� 
UISymbol
�� 
==
�� !
symbol
��" (
&&
��) +
Model
��, 1
.
��1 2
Symbols
��2 9
.
��9 :
Count
��: ?
>
��@ A
$num
��B C
)
��C D
{
�� 
Model
�� 
.
�� 
SelectedSymbol
�� $
=
��% &
Model
��' ,
.
��, -
Symbols
��- 4
[
��4 5
$num
��5 6
]
��6 7
;
��7 8
SetUISymbol
�� 
(
�� 
)
�� 
;
�� 
}
�� 
}
�� 	
public
�� 
void
�� 
	AddSymbol
�� 
(
�� 
)
�� 
{
�� 	
try
�� 
{
�� 
if
�� 
(
�� 
Model
�� 
.
�� 
Symbols
�� !
.
��! "
Any
��" %
(
��% &
x
��& '
=>
��( *
x
��+ ,
.
��, -
Symbol
��- 3
==
��4 6
Model
��7 <
.
��< =
AddSymbolString
��= L
)
��L M
)
��M N
{
�� 

MessageBox
�� 
.
�� 
Show
�� #
(
��# $
$str
��$ =
,
��= >
$str
��? N
,
��N O
MessageBoxButton
��P `
.
��` a
OK
��a c
,
��c d
MessageBoxImage
��e t
.
��t u
Information��u �
)��� �
;��� �
return
�� 
;
�� 
}
�� 

_AddSymbol
�� 
(
�� 
Model
��  
.
��  !
AddSymbolString
��! 0
??
��1 3
$str
��4 6
)
��6 7
;
��7 8

MessageBox
�� 
.
�� 
Show
�� 
(
��  
$str
��  ;
,
��; <
$str
��= M
,
��M N
MessageBoxButton
��O _
.
��_ `
OK
��` b
)
��b c
;
��c d
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 

MessageBox
�� 
.
�� 
Show
�� 
(
��  
$"
��  "
$str
��" ;
{
��; <
ex
��< >
.
��> ?
Message
��? F
}
��F G
"
��G H
,
��H I
$str
��J P
,
��P Q
MessageBoxButton
��R b
.
��b c
OK
��c e
,
��e f
MessageBoxImage
��g v
.
��v w
Error
��w |
)
��| }
;
��} ~
}
�� 
}
�� 	
private
�� 
void
�� 

_AddSymbol
�� 
(
��  
string
��  &
symbol
��' -
,
��- .
bool
��/ 3
isPaused
��4 <
=
��= >
false
��? D
)
��D E
{
�� 	
Model
�� 
.
�� 
Symbols
�� 
.
�� 
Add
�� 
(
�� 
new
�� !
RSI
��" %
(
��% &
symbol
��& ,
,
��, -
Model
��. 3
.
��3 4
KlineInterval
��4 A
,
��A B
(
��C D
string
��D J
symbol
��K Q
,
��Q R

Dictionary
��S ]
<
��] ^
string
��^ d
,
��d e
List
��f j
<
��j k
object
��k q
>
��q r
>
��r s
values
��t z
)
��z {
=>
��| ~
{�� �
}��� �
,��� �!
SendSignalMessage��� �
,��� �
isPaused��� �
:��� �
isPaused��� �
)��� �
{��� �
}��� �
)��� �
;��� �
Settings
�� 
.
�� 
BotsSettings
�� !
.
��! "
RSISettings
��" -
.
��- .
Symbols
��. 5
.
��5 6
Add
��6 9
(
��9 :
symbol
��: @
)
��@ A
;
��A B
Settings
�� 
.
�� 
SaveSettings
�� !
(
��! "
)
��" #
;
��# $
}
�� 	
public
�� 
Task
�� 
AddAllSymbols
�� !
(
��! "
)
��" #
{
�� 	
Model
�� 
.
�� 
Symbols
�� 
.
�� 
ToList
��  
(
��  !
)
��! "
.
��" #
ForEach
��# *
(
��* +
x
��+ ,
=>
��- /
x
��0 1
.
��1 2
Dispose
��2 9
(
��9 :
)
��: ;
)
��; <
;
��< =
Model
�� 
.
�� 
Symbols
�� 
.
�� 
Clear
�� 
(
��  
)
��  !
;
��! "
Settings
�� 
.
�� 
BotsSettings
�� !
.
��! "
RSISettings
��" -
.
��- .
Symbols
��. 5
.
��5 6
Clear
��6 ;
(
��; <
)
��< =
;
��= >
StaticBinance
�� 
.
�� 
ExchangeInfos
�� '
.
��' (
Spot
��( ,
.
��, -
ToList
��- 3
(
��3 4
)
��4 5
.
��5 6
ForEach
��6 =
(
��= >
x
��> ?
=>
��@ B
{
�� 
try
�� 
{
�� 
if
�� 
(
�� 
!
�� 
x
�� 
.
�� 
Name
�� 
.
��  
EndsWith
��  (
(
��( )
$str
��) /
)
��/ 0
)
��0 1
return
��2 8
;
��8 9

_AddSymbol
�� 
(
�� 
x
��  
.
��  !
Name
��! %
,
��% &
true
��' +
)
��+ ,
;
��, -
}
�� 
catch
�� 
(
�� 
	Exception
��  
ex
��! #
)
��# $
{
�� 

MessageBox
�� 
.
�� 
Show
�� #
(
��# $
$"
��$ &
{
��& '
x
��' (
.
��( )
Name
��) -
}
��- .
$str
��. S
{
��S T
ex
��T V
.
��V W
Message
��W ^
}
��^ _
"
��_ `
,
��` a
$str
��b h
,
��h i
MessageBoxButton
��j z
.
��z {
OK
��{ }
,
��} ~
MessageBoxImage�� �
.��� �
Error��� �
)��� �
;��� �
}
�� 
foreach
�� 
(
�� 
var
�� 
symbol
�� "
in
��# %
Model
��& +
.
��+ ,
Symbols
��, 3
)
��3 4
{
�� 
symbol
�� 
.
�� 
Continue
�� #
(
��# $
)
��$ %
;
��% &
}
�� 
}
�� 
)
�� 
;
�� 
return
�� 
Task
�� 
.
�� 
Delay
�� 
(
�� 
$num
�� 
)
��  
;
��  !
}
�� 	
public
�� 
void
�� 
SendSignalMessage
�� %
(
��% &
string
��& ,
symbol
��- 3
,
��3 4

Dictionary
��5 ?
<
��? @
string
��@ F
,
��F G
List
��H L
<
��L M
object
��M S
>
��S T
>
��T U
values
��V \
,
��\ ]
Enums
��^ c
.
��c d

SignalType
��d n
type
��o s
)
��s t
{
�� 	
string
�� 
message
�� 
=
�� 
type
�� !
switch
��" (
{
�� 
Enums
�� 
.
�� 

SignalType
��  
.
��  !
	UpperLine
��! *
=>
��+ -
Settings
��. 6
.
��6 7
BotsSettings
��7 C
.
��C D
RSISettings
��D O
.
��O P
SignalMessages
��P ^
.
��^ _

Overbought
��_ i
,
��i j
Enums
�� 
.
�� 

SignalType
��  
.
��  !
	UnderLine
��! *
=>
��+ -
Settings
��. 6
.
��6 7
BotsSettings
��7 C
.
��C D
RSISettings
��D O
.
��O P
SignalMessages
��P ^
.
��^ _
Oversold
��_ g
,
��g h
Enums
�� 
.
�� 

SignalType
��  
.
��  !
BetweenLines
��! -
=>
��. 0
Settings
��1 9
.
��9 :
BotsSettings
��: F
.
��F G
RSISettings
��G R
.
��R S
SignalMessages
��S a
.
��a b
BetweenLevels
��b o
,
��o p
_
�� 
=>
�� 
$str
�� 
,
�� 
}
�� 
;
�� 
if
�� 
(
�� 
string
�� 
.
�� 
IsNullOrEmpty
�� $
(
��$ %
message
��% ,
)
��, -
)
��- .
return
��/ 5
;
��5 6
message
�� 
=
�� 
message
�� 
.
�� 
Replace
�� %
(
��% &
$str
��& 0
,
��0 1
symbol
��2 8
)
��8 9
.
��9 :
Replace
��: A
(
��A B
$str
��B K
,
��K L
Math
��M Q
.
��Q R
Round
��R W
(
��W X
(
��X Y
(
��Y Z
Kline
��Z _
)
��_ `
values
��` f
[
��f g
$str
��g o
]
��o p
.
��p q
Last
��q u
(
��u v
)
��v w
)
��w x
.
��x y
Close
��y ~
,
��~ 
$num��� �
)��� �
.��� �
ToString��� �
(��� �
)��� �
)��� �
.��� �
Replace��� �
(��� �
$str��� �
,��� �
Math��� �
.��� �
Round��� �
(��� �
(��� �
double��� �
)��� �
values��� �
[��� �
$str��� �
]��� �
.��� �
Last��� �
(��� �
)��� �
,��� �
$num��� �
)��� �
.��� �
ToString��� �
(��� �
)��� �
)��� �
;��� �
foreach
�� 
(
�� 
User
�� 
user
�� 
in
�� !
Model
��" '
.
��' (
Users
��( -
)
��- .
{
�� 
try
�� 
{
�� 
if
�� 
(
�� 
user
�� 
.
�� 
ChatId
�� #
==
��$ &
$num
��' (
)
��( )
continue
��* 2
;
��2 3

BotClients
�� 
.
�� 
	RSIClient
�� (
.
��( )"
SendTextMessageAsync
��) =
(
��= >
user
��> B
.
��B C
ChatId
��C I
,
��I J
message
��K R
)
��R S
;
��S T
}
�� 
catch
�� 
(
�� 
	Exception
��  
ex
��! #
)
��# $
{
�� 
Console
�� 
.
�� 
	WriteLine
�� %
(
��% &
$"
��& (
$str
��( 9
{
��9 :
user
��: >
.
��> ?
Username
��? G
}
��G H
$str
��H c
{
��c d
ex
��d f
.
��f g
Message
��g n
}
��n o
"
��o p
)
��p q
;
��q r
}
�� 
}
�� 
foreach
�� 
(
�� 
string
�� 
?
�� 
group
�� "
in
��# %
Settings
��& .
.
��. /
TelegramSettings
��/ ?
.
��? @
	RSIGroups
��@ I
)
��I J
{
�� 
try
�� 
{
�� 

BotClients
�� 
.
�� 
	RSIClient
�� (
.
��( )"
SendTextMessageAsync
��) =
(
��= >
group
��> C
,
��C D
message
��E L
)
��L M
;
��M N
}
�� 
catch
�� 
(
�� 
	Exception
��  
ex
��! #
)
��# $
{
�� 
Console
�� 
.
�� 
	WriteLine
�� %
(
��% &
$"
��& (
$str
��( 8
{
��8 9
group
��9 >
}
��> ?
$str
��? Z
{
��Z [
ex
��[ ]
.
��] ^
Message
��^ e
}
��e f
"
��f g
)
��g h
;
��h i
}
�� 
}
�� 
}
�� 	
public
�� 
void
�� 
SaveSettings
��  
(
��  !
)
��! "
{
�� 	
Settings
�� 
.
�� 
BotsSettings
�� !
.
��! "
RSISettings
��" -
.
��- .
SignalMessages
��. <
.
��< =
Oversold
��= E
=
��F G
Model
��H M
.
��M N"
OversoldSignalString
��N b
;
��b c
Settings
�� 
.
�� 
BotsSettings
�� !
.
��! "
RSISettings
��" -
.
��- .
SignalMessages
��. <
.
��< =

Overbought
��= G
=
��H I
Model
��J O
.
��O P$
OverboughtSignalString
��P f
;
��f g
Settings
�� 
.
�� 
BotsSettings
�� !
.
��! "
RSISettings
��" -
.
��- .
SignalMessages
��. <
.
��< =
BetweenLevels
��= J
=
��K L
Model
��M R
.
��R S'
BetweenLevelsSignalString
��S l
;
��l m
Settings
�� 
.
�� 
BotsSettings
�� !
.
��! "
RSISettings
��" -
.
��- .
	RSIPeriot
��. 7
=
��8 9
Model
��: ?
.
��? @
	RSIPeriot
��@ I
;
��I J
Settings
�� 
.
�� 
BotsSettings
�� !
.
��! "
RSISettings
��" -
.
��- .
RSIOversoldLevel
��. >
=
��? @
Model
��A F
.
��F G
RSIOversoldLevel
��G W
;
��W X
Settings
�� 
.
�� 
BotsSettings
�� !
.
��! "
RSISettings
��" -
.
��- . 
RSIOverboughtLevet
��. @
=
��A B
Model
��C H
.
��H I 
RSIOverboughtLevel
��I [
;
��[ \
Settings
�� 
.
�� 
BotsSettings
�� !
.
��! "
RSISettings
��" -
.
��- .
MinSignalPeriot
��. =
=
��> ?
Model
��@ E
.
��E F
MinSignalPeriot
��F U
;
��U V
Settings
�� 
.
�� 
BotsSettings
�� !
.
��! "
TDISettings
��" -
.
��- .
KlineInterval
��. ;
=
��< =
Enum
��> B
.
��B C
GetName
��C J
(
��J K
typeof
��K Q
(
��Q R
KlineInterval
��R _
)
��_ `
,
��` a
Model
��b g
.
��g h
KlineInterval
��h u
)
��u v
;
��v w
Settings
�� 
.
�� 
SaveSettings
�� !
(
��! "
)
��" #
;
��# $

MessageBox
�� 
.
�� 
Show
�� 
(
�� 
$str
�� ;
,
��; <
$str
��= Q
,
��Q R
MessageBoxButton
��S c
.
��c d
OK
��d f
)
��f g
;
��g h
}
�� 	
public
�� 
void
�� 
LoadSettings
��  
(
��  !
)
��! "
{
�� 	
Model
�� 
.
�� $
OverboughtSignalString
�� (
=
��) *
Settings
��+ 3
.
��3 4
BotsSettings
��4 @
.
��@ A
RSISettings
��A L
.
��L M
SignalMessages
��M [
.
��[ \

Overbought
��\ f
;
��f g
Model
�� 
.
�� "
OversoldSignalString
�� &
=
��' (
Settings
��) 1
.
��1 2
BotsSettings
��2 >
.
��> ?
RSISettings
��? J
.
��J K
SignalMessages
��K Y
.
��Y Z
Oversold
��Z b
;
��b c
Model
�� 
.
�� '
BetweenLevelsSignalString
�� +
=
��, -
Settings
��. 6
.
��6 7
BotsSettings
��7 C
.
��C D
RSISettings
��D O
.
��O P
SignalMessages
��P ^
.
��^ _
BetweenLevels
��_ l
;
��l m
Model
�� 
.
�� 
	RSIPeriot
�� 
=
�� 
Settings
�� &
.
��& '
BotsSettings
��' 3
.
��3 4
RSISettings
��4 ?
.
��? @
	RSIPeriot
��@ I
;
��I J
Model
�� 
.
�� 
RSIOversoldLevel
�� "
=
��# $
Settings
��% -
.
��- .
BotsSettings
��. :
.
��: ;
RSISettings
��; F
.
��F G
RSIOversoldLevel
��G W
;
��W X
Model
�� 
.
��  
RSIOverboughtLevel
�� $
=
��% &
Settings
��' /
.
��/ 0
BotsSettings
��0 <
.
��< =
RSISettings
��= H
.
��H I 
RSIOverboughtLevet
��I [
;
��[ \
Model
�� 
.
�� 
MinSignalPeriot
�� !
=
��" #
Settings
��$ ,
.
��, -
BotsSettings
��- 9
.
��9 :
RSISettings
��: E
.
��E F
MinSignalPeriot
��F U
;
��U V
}
�� 	
public
�� 
void
�� !
ChangeKlineInterval
�� '
(
��' (
)
��( )
{
�� 	
MessageBoxResult
�� 
change
�� #
=
��$ %

MessageBox
��& 0
.
��0 1
Show
��1 5
(
��5 6
$str��6 �
,��� �
$str��� �
,��� � 
MessageBoxButton��� �
.��� �
YesNo��� �
,��� �
MessageBoxImage��� �
.��� �
Warning��� �
)��� �
;��� �
if
�� 
(
�� 
change
�� 
==
�� 
MessageBoxResult
�� *
.
��* +
No
��+ -
)
��- .
{
�� 
Model
�� 
.
�� 
KlineInterval
�� #
=
��$ %
Model
��& +
.
��+ ,
KlineIntervals
��, :
.
��: ;
First
��; @
(
��@ A
x
��A B
=>
��C E
x
��F G
.
��G H
Equals
��H N
(
��N O
Model
��O T
.
��T U
Symbols
��U \
.
��\ ]
First
��] b
(
��b c
)
��c d
.
��d e
Interval
��e m
)
��m n
)
��n o
;
��o p
return
�� 
;
�� 
}
�� 
Model
�� 
.
�� 
Symbols
�� 
.
�� 
ToList
��  
(
��  !
)
��! "
.
��" #
ForEach
��# *
(
��* +
x
��+ ,
=>
��- /
x
��0 1
.
��1 2
ChangeInterval
��2 @
(
��@ A
Model
��A F
.
��F G
KlineInterval
��G T
)
��T U
)
��U V
;
��V W
SaveSettings
�� 
(
�� 
)
�� 
;
�� 
}
�� 	
}
�� 
}�� ��
vC:\Users\Ömer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\UI\ViewModels\TDIViewModel.cs
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
values	CC| �
)
CC� �
=>
CC� �
{
CC� �
}
CC� �
,
CC� �
SendSignalMessage
CC� �
,
CC� �
true
CC� �
)
CC� �
{
CC� �
}
CC� �
)
CC� �
;
CC� �
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
Message	GG{ �
}
GG� �
$str
GG� �
"
GG� �
,
GG� �
$str
GG� �
,
GG� �
MessageBoxButton
GG� �
.
GG� �
YesNo
GG� �
,
GG� �
MessageBoxImage
GG� �
.
GG� �
Error
GG� �
)
GG� �
;
GG� �
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
object	pp| �
>
pp� �
>
pp� �
values
pp� �
)
pp� �
=>
pp� �
{
pp� �
}
pp� �
;
pp� �
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
_Low	}} �
,
}}� �
(
}}� �
double
}}� �
)
}}� �
x
}}� �
.
}}� �
_Close
}}� �
)
}}� �
)
}}� �
.
}}� �
ToList
}}� �
(
}}� �
)
}}� �
)
}}� �
;
}}� �
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
�� 
if
�� 
(
�� 
Model
�� 
.
�� 
Labels
�� 
.
�� 
Last
�� !
(
��! "
)
��" #
==
��$ &
Klines
��' -
.
��- .
Last
��. 2
(
��2 3
)
��3 4
.
��4 5
	_OpenDate
��5 >
.
��> ?
ToString
��? G
(
��G H
$str
��H N
)
��N O
)
��O P
{
�� 
Kline
�� 
?
�� 
	LastKline
��  
=
��! "
Klines
��# )
.
��) *
Last
��* .
(
��. /
)
��/ 0
;
��0 1
	OhlcPoint
�� 
?
�� 
LastChartKline
�� )
=
��* +
(
��, -
	OhlcPoint
��- 6
?
��6 7
)
��7 8
Model
��8 =
.
��= >#
KlineSeriesCollection
��> S
[
��S T
$num
��T U
]
��U V
.
��V W
Values
��W ]
[
��] ^
^
��^ _
$num
��_ `
]
��` a
;
��a b
if
�� 
(
�� 
LastChartKline
�� "
==
��# %
null
��& *
)
��* +
return
��, 2
;
��2 3
LastChartKline
�� 
.
�� 
Close
�� $
=
��% &
(
��' (
double
��( .
)
��. /
	LastKline
��/ 8
.
��8 9
_Close
��9 ?
;
��? @
if
�� 
(
�� 
LastChartKline
�� "
.
��" #
High
��# '
<
��( )
(
��* +
double
��+ 1
)
��1 2
	LastKline
��2 ;
.
��; <
_High
��< A
)
��A B
LastChartKline
��C Q
.
��Q R
High
��R V
=
��W X
(
��Y Z
double
��Z `
)
��` a
	LastKline
��a j
.
��j k
_High
��k p
;
��p q
if
�� 
(
�� 
LastChartKline
�� "
.
��" #
Low
��# &
<
��' (
(
��) *
double
��* 0
)
��0 1
	LastKline
��1 :
.
��: ;
_Low
��; ?
)
��? @
LastChartKline
��A O
.
��O P
Low
��P S
=
��T U
(
��V W
double
��W ]
)
��] ^
	LastKline
��^ g
.
��g h
_Low
��h l
;
��l m
return
�� 
;
�� 
}
�� 
Model
�� 
.
�� 
Labels
�� 
.
�� 
RemoveAt
�� !
(
��! "
$num
��" #
)
��# $
;
��$ %
Model
�� 
.
�� #
KlineSeriesCollection
�� '
[
��' (
$num
��( )
]
��) *
.
��* +
Values
��+ 1
.
��1 2
RemoveAt
��2 :
(
��: ;
$num
��; <
)
��< =
;
��= >
Model
�� 
.
�� 
Labels
�� 
.
�� 
Add
�� 
(
�� 
Klines
�� #
.
��# $
Last
��$ (
(
��( )
)
��) *
.
��* +
	_OpenDate
��+ 4
.
��4 5
ToString
��5 =
(
��= >
$str
��> D
)
��D E
)
��E F
;
��F G
Model
�� 
.
�� #
KlineSeriesCollection
�� '
[
��' (
$num
��( )
]
��) *
.
��* +
Values
��+ 1
.
��1 2
Add
��2 5
(
��5 6
new
��6 9
	OhlcPoint
��: C
(
��C D
(
��D E
double
��E K
)
��K L
Klines
��L R
.
��R S
Last
��S W
(
��W X
)
��X Y
.
��Y Z
_Open
��Z _
,
��_ `
(
��a b
double
��b h
)
��h i
Klines
��i o
.
��o p
Last
��p t
(
��t u
)
��u v
.
��v w
_High
��w |
,
��| }
(
��~ 
double�� �
)��� �
Klines��� �
.��� �
Last��� �
(��� �
)��� �
.��� �
_Low��� �
,��� �
(��� �
double��� �
)��� �
Klines��� �
.��� �
Last��� �
(��� �
)��� �
.��� �
_Close��� �
)��� �
)��� �
;��� �
}
�� 	
public
�� 
void
�� 
UpdateIndicators
�� $
(
��$ %
IEnumerable
��% 0
<
��0 1
Kline
��1 6
>
��6 7
Klines
��8 >
,
��> ?
IEnumerable
��@ K
<
��K L
object
��L R
>
��R S
FastMA
��T Z
,
��Z [
IEnumerable
��\ g
<
��g h
object
��h n
>
��n o
SlowMA
��p v
,
��v w
IEnumerable��x �
<��� �
object��� �
>��� �
UpVB��� �
,��� �
IEnumerable��� �
<��� �
object��� �
>��� �
MiddleVB��� �
,��� �
IEnumerable��� �
<��� �
object��� �
>��� �
DownVB��� �
)��� �
{
�� 	
UpdateIndicator
�� 
(
�� 
Klines
�� "
,
��" #
Model
��$ )
.
��) *
FastMA
��* 0
.
��0 1
Values
��1 7
,
��7 8
FastMA
��9 ?
)
��? @
;
��@ A
UpdateIndicator
�� 
(
�� 
Klines
�� "
,
��" #
Model
��$ )
.
��) *
SlowMA
��* 0
.
��0 1
Values
��1 7
,
��7 8
SlowMA
��9 ?
)
��? @
;
��@ A
UpdateIndicator
�� 
(
�� 
Klines
�� "
,
��" #
Model
��$ )
.
��) *
UpVB
��* .
.
��. /
Values
��/ 5
,
��5 6
UpVB
��7 ;
)
��; <
;
��< =
UpdateIndicator
�� 
(
�� 
Klines
�� "
,
��" #
Model
��$ )
.
��) *
MiddleVB
��* 2
.
��2 3
Values
��3 9
,
��9 :
MiddleVB
��; C
)
��C D
;
��D E
UpdateIndicator
�� 
(
�� 
Klines
�� "
,
��" #
Model
��$ )
.
��) *
DownVB
��* 0
.
��0 1
Values
��1 7
,
��7 8
DownVB
��9 ?
)
��? @
;
��@ A
}
�� 	
private
�� 
void
�� 
UpdateIndicator
�� $
(
��$ %
IEnumerable
��% 0
<
��0 1
Kline
��1 6
>
��6 7
Klines
��8 >
,
��> ?
IChartValues
��@ L
values
��M S
,
��S T
IEnumerable
��U `
<
��` a
object
��a g
>
��g h
	newValues
��i r
)
��r s
{
�� 	
if
�� 
(
�� 
values
�� 
.
�� 
Count
�� 
==
�� 
$num
��  !
)
��! "
{
�� 
values
�� 
.
�� 
AddRange
�� 
(
��  
	newValues
��  )
.
��) *
Select
��* 0
(
��0 1
x
��1 2
=>
��3 5
(
��6 7
object
��7 =
)
��= >
Convert
��> E
.
��E F
ToDouble
��F N
(
��N O
x
��O P
)
��P Q
)
��Q R
)
��R S
;
��S T
return
�� 
;
�� 
}
�� 
if
�� 
(
�� 
Model
�� 
.
�� 
Labels
�� 
.
�� 
Last
�� !
(
��! "
)
��" #
==
��$ &
Klines
��' -
.
��- .
Last
��. 2
(
��2 3
)
��3 4
.
��4 5
	_OpenDate
��5 >
.
��> ?
ToString
��? G
(
��G H
$str
��H N
)
��N O
)
��O P
{
�� 
values
�� 
[
�� 
^
�� 
$num
�� 
]
�� 
=
�� 
	newValues
�� &
.
��& '
Last
��' +
(
��+ ,
)
��, -
;
��- .
return
�� 
;
�� 
}
�� 
values
�� 
.
�� 
Add
�� 
(
�� 
	newValues
��  
.
��  !
Last
��! %
(
��% &
)
��& '
)
��' (
;
��( )
}
�� 	
public
�� 
void
�� -
UserSymbolsListSelectionChanged
�� 3
(
��3 4
)
��4 5
{
�� 	
Model
�� 
.
�� !
AddUserSymbolString
�� %
=
��& '
Model
��( -
.
��- . 
SelectedUserSymbol
��. @
?
��@ A
.
��A B
Key
��B E
;
��E F
}
�� 	
public
�� 
void
�� 
AddUser
�� 
(
�� 
)
�� 
{
�� 	
try
�� 
{
�� 
if
�� 
(
�� 
!
�� 

Connection
�� 
.
��  
Context
��  '
.
��' (
Users
��( -
.
��- .
Any
��. 1
(
��1 2
x
��2 3
=>
��4 6
x
��7 8
.
��8 9
Username
��9 A
==
��B D
Model
��E J
.
��J K
AddUserString
��K X
)
��X Y
)
��Y Z
{
�� 
User
�� 
?
�� 
user
�� 
=
��  
new
��! $
User
��% )
(
��) *
Model
��* /
.
��/ 0
AddUserString
��0 =
??
��> @
$str
��A C
)
��C D
{
��E F
TDI
��G J
=
��K L
true
��M Q
}
��R S
;
��S T

Connection
�� 
.
�� 
Context
�� &
.
��& '

CreateUser
��' 1
(
��1 2
user
��2 6
)
��6 7
;
��7 8
Model
�� 
.
�� 
SelectedUser
�� &
=
��' (
user
��) -
;
��- .

MessageBox
�� 
.
�� 
Show
�� #
(
��# $
$str
��$ B
,
��B C
$str
��D W
,
��W X
MessageBoxButton
��Y i
.
��i j
OK
��j l
)
��l m
;
��m n
}
�� 
else
�� 
if
�� 
(
�� 

Connection
�� #
.
��# $
Context
��$ +
.
��+ ,
Users
��, 1
.
��1 2
Any
��2 5
(
��5 6
x
��6 7
=>
��8 :
x
��; <
.
��< =
Username
��= E
==
��F H
Model
��I N
.
��N O
AddUserString
��O \
&&
��] _
x
��` a
.
��a b
TDI
��b e
==
��f h
false
��i n
)
��n o
)
��o p
{
�� 
User
�� 
?
�� 
user
�� 
=
��  

Connection
��! +
.
��+ ,
Context
��, 3
.
��3 4
Users
��4 9
.
��9 :
First
��: ?
(
��? @
x
��@ A
=>
��B D
x
��E F
.
��F G
Username
��G O
==
��P R
Model
��S X
.
��X Y
AddUserString
��Y f
&&
��g i
x
��j k
.
��k l
TDI
��l o
==
��p r
false
��s x
)
��x y
;
��y z
user
�� 
.
�� 
TDI
�� 
=
�� 
true
�� #
;
��# $

Connection
�� 
.
�� 
Context
�� &
.
��& '
SaveChanges
��' 2
(
��2 3
)
��3 4
;
��4 5
Model
�� 
.
�� 
SelectedUser
�� &
=
��' (
user
��) -
;
��- .

MessageBox
�� 
.
�� 
Show
�� #
(
��# $
$str
��$ B
,
��B C
$str
��D W
,
��W X
MessageBoxButton
��Y i
.
��i j
OK
��j l
)
��l m
;
��m n
}
�� 
else
�� 
{
�� 
User
�� 
user
�� 
=
�� 

Connection
��  *
.
��* +
Context
��+ 2
.
��2 3
Users
��3 8
.
��8 9
First
��9 >
(
��> ?
x
��? @
=>
��A C
x
��D E
.
��E F
Username
��F N
==
��O Q
Model
��R W
.
��W X
AddUserString
��X e
)
��e f
;
��f g
Model
�� 
.
�� 
SelectedUser
�� &
=
��' (
user
��) -
;
��- .
}
�� 
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 

MessageBox
�� 
.
�� 
Show
�� 
(
��  
$"
��  "
$str
��" ;
{
��; <
ex
��< >
.
��> ?
Message
��? F
}
��F G
"
��G H
,
��H I
$str
��J P
,
��P Q
MessageBoxButton
��R b
.
��b c
OK
��c e
,
��e f
MessageBoxImage
��g v
.
��v w
Error
��w |
)
��| }
;
��} ~
}
�� 
}
�� 	
public
�� 
void
�� 
DelUser
�� 
(
�� 
)
�� 
{
�� 	
try
�� 
{
�� 
if
�� 
(
�� 
Model
�� 
.
�� 
SelectedUser
�� &
==
��' )
null
��* .
)
��. /
return
��0 6
;
��6 7
User
�� 
?
�� 
user
�� 
=
�� 

Connection
�� '
.
��' (
Context
��( /
.
��/ 0
Users
��0 5
.
��5 6
First
��6 ;
(
��; <
x
��< =
=>
��> @
x
��A B
.
��B C
Username
��C K
==
��L N
Model
��O T
.
��T U
SelectedUser
��U a
.
��a b
Username
��b j
)
��j k
;
��k l
user
�� 
.
�� 
TDI
�� 
=
�� 
false
��  
;
��  !

Connection
�� 
.
�� 
Context
�� "
.
��" #
SaveChanges
��# .
(
��. /
)
��/ 0
;
��0 1
Model
�� 
.
�� 
SelectedUser
�� "
=
��# $
user
��% )
;
��) *

MessageBox
�� 
.
�� 
Show
�� 
(
��  
$str
��  >
,
��> ?
$str
��@ S
,
��S T
MessageBoxButton
��U e
.
��e f
OK
��f h
)
��h i
;
��i j
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 

MessageBox
�� 
.
�� 
Show
�� 
(
��  
$"
��  "
$str
��" ;
{
��; <
ex
��< >
.
��> ?
Message
��? F
}
��F G
"
��G H
,
��H I
$str
��J P
,
��P Q
MessageBoxButton
��R b
.
��b c
OK
��c e
,
��e f
MessageBoxImage
��g v
.
��v w
Error
��w |
)
��| }
;
��} ~
}
�� 
}
�� 	
public
�� 
void
�� 
AddUserSymbol
�� !
(
��! "
)
��" #
{
�� 	
try
�� 
{
�� 
if
�� 
(
�� 
Model
�� 
.
�� 
SelectedUser
�� &
==
��' )
null
��* .
)
��. /
return
��0 6
;
��6 7
bool
�� 
showMessage
��  
=
��! "
false
��# (
;
��( )
if
�� 
(
�� 
Model
�� 
.
�� 
SelectedUser
�� &
.
��& '

TDISymbols
��' 1
.
��1 2
Any
��2 5
(
��5 6
x
��6 7
=>
��8 :
x
��; <
.
��< =
Key
��= @
.
��@ A
Equals
��A G
(
��G H
Model
��H M
.
��M N!
AddUserSymbolString
��N a
)
��a b
)
��b c
)
��c d
{
�� 
int
�� 
addDays
�� 
=
��  !
Model
��" '
.
��' (
AddUserDays
��( 3
==
��4 6
$num
��7 8
?
��9 :
$num
��; A
:
��B C
Model
��D I
.
��I J
AddUserDays
��J U
;
��U V
DateTime
�� 
newDate
�� $
=
��% &
Model
��' ,
.
��, -
SelectedUser
��- 9
.
��9 :

TDISymbols
��: D
.
��D E
First
��E J
(
��J K
x
��K L
=>
��M O
x
��P Q
.
��Q R
Key
��R U
.
��U V
Equals
��V \
(
��\ ]
Model
��] b
.
��b c!
AddUserSymbolString
��c v
)
��v w
)
��w x
.
��x y
Value
��y ~
>=�� �
DateTime��� �
.��� �
Now��� �
?��� �
Model
�� 
.
�� 
SelectedUser
�� *
.
��* +

TDISymbols
��+ 5
.
��5 6
First
��6 ;
(
��; <
x
��< =
=>
��> @
x
��A B
.
��B C
Key
��C F
.
��F G
Equals
��G M
(
��M N
Model
��N S
.
��S T!
AddUserSymbolString
��T g
)
��g h
)
��h i
.
��i j
Value
��j o
.
��o p
AddDays
��p w
(
��w x
addDays
��x 
)�� �
:��� �
DateTime
��  
.
��  !
Now
��! $
.
��$ %
AddDays
��% ,
(
��, -
addDays
��- 4
)
��4 5
;
��5 6
Model
�� 
.
�� 
SelectedUser
�� &
.
��& '

TDISymbols
��' 1
[
��1 2
Model
��2 7
.
��7 8!
AddUserSymbolString
��8 K
??
��L N
$str
��O Q
]
��Q R
=
��S T
newDate
��U \
;
��\ ]
}
�� 
else
�� 
{
�� 
Model
�� 
.
�� 
SelectedUser
�� &
.
��& '

TDISymbols
��' 1
.
��1 2
Add
��2 5
(
��5 6
Model
��6 ;
.
��; <!
AddUserSymbolString
��< O
??
��P R
$str
��S U
,
��U V
DateTime
��W _
.
��_ `
Now
��` c
.
��c d
AddDays
��d k
(
��k l
Model
��l q
.
��q r
AddUserDays
��r }
)
��} ~
)
��~ 
;�� �
showMessage
�� 
=
��  !
true
��" &
;
��& '
}
�� 
Model
�� 
.
�� 
SelectedUser
�� "
.
��" #
SaveUserSymbols
��# 2
(
��2 3
)
��3 4
;
��4 5

Connection
�� 
.
�� 
Context
�� "
.
��" #
SaveChanges
��# .
(
��. /
)
��/ 0
;
��0 1
Model
�� 
.
�� !
SelectedUserSymbols
�� )
=
��* +
new
��, /
(
��/ 0
Model
��0 5
.
��5 6
SelectedUser
��6 B
.
��B C

TDISymbols
��C M
)
��M N
;
��N O
if
�� 
(
�� 
showMessage
�� 
)
��  

MessageBox
��! +
.
��+ ,
Show
��, 0
(
��0 1
$str
��1 X
,
��X Y
$str
��Z j
,
��j k
MessageBoxButton
��l |
.
��| }
OK
��} 
)�� �
;��� �
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 

MessageBox
�� 
.
�� 
Show
�� 
(
��  
$"
��  "
$str
��" ;
{
��; <
ex
��< >
.
��> ?
Message
��? F
}
��F G
"
��G H
,
��H I
$str
��J P
,
��P Q
MessageBoxButton
��R b
.
��b c
OK
��c e
,
��e f
MessageBoxImage
��g v
.
��v w
Error
��w |
)
��| }
;
��} ~
}
�� 
}
�� 	
public
�� 
void
�� 
DelUserSymbol
�� !
(
��! "
)
��" #
{
�� 	
try
�� 
{
�� 
if
�� 
(
�� 
Model
�� 
.
�� 
SelectedUser
�� &
==
��' )
null
��* .
||
��/ 1
Model
��2 7
.
��7 8!
SelectedUserSymbols
��8 K
?
��K L
.
��L M
Count
��M R
==
��S U
$num
��V W
)
��W X
return
��Y _
;
��_ `
Model
�� 
.
�� 
SelectedUser
�� "
.
��" #

TDISymbols
��# -
.
��- .
Remove
��. 4
(
��4 5
Model
��5 :
.
��: ; 
SelectedUserSymbol
��; M
?
��M N
.
��N O
Key
��O R
??
��S U
$str
��V X
)
��X Y
;
��Y Z
Model
�� 
.
�� 
SelectedUser
�� "
.
��" #
SaveUserSymbols
��# 2
(
��2 3
)
��3 4
;
��4 5

Connection
�� 
.
�� 
Context
�� "
.
��" #
SaveChanges
��# .
(
��. /
)
��/ 0
;
��0 1
Model
�� 
.
�� !
SelectedUserSymbols
�� )
=
��* +
new
��, /
(
��/ 0
Model
��0 5
.
��5 6
SelectedUser
��6 B
.
��B C

TDISymbols
��C M
)
��M N
;
��N O

MessageBox
�� 
.
�� 
Show
�� 
(
��  
$str
��  ;
,
��; <
$str
��= P
,
��P Q
MessageBoxButton
��R b
.
��b c
OK
��c e
)
��e f
;
��f g
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 

MessageBox
�� 
.
�� 
Show
�� 
(
��  
$"
��  "
$str
��" ;
{
��; <
ex
��< >
.
��> ?
Message
��? F
}
��F G
"
��G H
,
��H I
$str
��J P
,
��P Q
MessageBoxButton
��R b
.
��b c
OK
��c e
,
��e f
MessageBoxImage
��g v
.
��v w
Error
��w |
)
��| }
;
��} ~
}
�� 
}
�� 	
public
�� 
void
�� 
AddGroup
�� 
(
�� 
)
�� 
{
�� 	
if
�� 
(
�� 
string
�� 
.
�� 
IsNullOrEmpty
�� $
(
��$ %
Model
��% *
.
��* +
AddGroupString
��+ 9
)
��9 :
)
��: ;
return
��< B
;
��B C
Settings
�� 
.
�� 
TelegramSettings
�� %
.
��% &
	TDIGroups
��& /
.
��/ 0
Add
��0 3
(
��3 4
Model
��4 9
.
��9 :
AddGroupString
��: H
)
��H I
;
��I J
Settings
�� 
.
�� 
SaveSettings
�� !
(
��! "
)
��" #
;
��# $

MessageBox
�� 
.
�� 
Show
�� 
(
�� 
$str
�� 4
,
��4 5
$str
��6 D
,
��D E
MessageBoxButton
��F V
.
��V W
OK
��W Y
)
��Y Z
;
��Z [
}
�� 	
public
�� 
void
�� 
DelGroup
�� 
(
�� 
)
�� 
{
�� 	
Settings
�� 
.
�� 
TelegramSettings
�� %
.
��% &
	TDIGroups
��& /
.
��/ 0
Remove
��0 6
(
��6 7
Model
��7 <
.
��< =
SelectedGroup
��= J
??
��K M
$str
��N P
)
��P Q
;
��Q R
Settings
�� 
.
�� 
SaveSettings
�� !
(
��! "
)
��" #
;
��# $

MessageBox
�� 
.
�� 
Show
�� 
(
�� 
$str
�� 4
,
��4 5
$str
��6 D
,
��D E
MessageBoxButton
��F V
.
��V W
OK
��W Y
)
��Y Z
;
��Z [
}
�� 	
public
�� 
void
�� 
	DelSymbol
�� 
(
�� 
)
�� 
{
�� 	
if
�� 
(
�� 
Model
�� 
.
�� 
SelectedSymbol
�� $
==
��% '
null
��( ,
)
��, -
return
��. 4
;
��4 5
string
�� 
?
�� 
symbol
�� 
=
�� 
Model
�� "
.
��" #
SelectedSymbol
��# 1
.
��1 2
Symbol
��2 8
;
��8 9
Settings
�� 
.
�� 
BotsSettings
�� !
.
��! "
TDISettings
��" -
.
��- .
Symbols
��. 5
.
��5 6
Remove
��6 <
(
��< =
Model
��= B
.
��B C
SelectedSymbol
��C Q
.
��Q R
Symbol
��R X
)
��X Y
;
��Y Z
Model
�� 
.
�� 
SelectedSymbol
��  
.
��  !
Dispose
��! (
(
��( )
)
��) *
;
��* +
Settings
�� 
.
�� 
BotsSettings
�� !
.
��! "
TDISettings
��" -
.
��- .
Symbols
��. 5
.
��5 6
Remove
��6 <
(
��< =
Model
��= B
.
��B C
SelectedSymbol
��C Q
.
��Q R
Symbol
��R X
)
��X Y
;
��Y Z
Settings
�� 
.
�� 
SaveSettings
�� !
(
��! "
)
��" #
;
��# $
Model
�� 
.
�� 
Symbols
�� 
.
�� 
Remove
��  
(
��  !
Model
��! &
.
��& '
SelectedSymbol
��' 5
)
��5 6
;
��6 7
if
�� 
(
�� 
Model
�� 
.
�� 
UISymbol
�� 
==
�� !
symbol
��" (
&&
��) +
Model
��, 1
.
��1 2
Symbols
��2 9
.
��9 :
Count
��: ?
>
��@ A
$num
��B C
)
��C D
{
�� 
Model
�� 
.
�� 
SelectedSymbol
�� $
=
��% &
Model
��' ,
.
��, -
Symbols
��- 4
[
��4 5
$num
��5 6
]
��6 7
;
��7 8
SetUISymbol
�� 
(
�� 
)
�� 
;
�� 
}
�� 
}
�� 	
public
�� 
void
�� 
	AddSymbol
�� 
(
�� 
)
�� 
{
�� 	
try
�� 
{
�� 
if
�� 
(
�� 
Model
�� 
.
�� 
Symbols
�� !
.
��! "
Any
��" %
(
��% &
x
��& '
=>
��( *
x
��+ ,
.
��, -
Symbol
��- 3
==
��4 6
Model
��7 <
.
��< =
AddSymbolString
��= L
)
��L M
)
��M N
{
�� 

MessageBox
�� 
.
�� 
Show
�� #
(
��# $
$str
��$ =
,
��= >
$str
��? N
,
��N O
MessageBoxButton
��P `
.
��` a
OK
��a c
,
��c d
MessageBoxImage
��e t
.
��t u
Information��u �
)��� �
;��� �
return
�� 
;
�� 
}
�� 

_AddSymbol
�� 
(
�� 
Model
��  
.
��  !
AddSymbolString
��! 0
??
��1 3
$str
��4 6
)
��6 7
;
��7 8

MessageBox
�� 
.
�� 
Show
�� 
(
��  
$str
��  ;
,
��; <
$str
��= M
,
��M N
MessageBoxButton
��O _
.
��_ `
OK
��` b
)
��b c
;
��c d
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 

MessageBox
�� 
.
�� 
Show
�� 
(
��  
$"
��  "
$str
��" ;
{
��; <
ex
��< >
.
��> ?
Message
��? F
}
��F G
"
��G H
,
��H I
$str
��J P
,
��P Q
MessageBoxButton
��R b
.
��b c
OK
��c e
,
��e f
MessageBoxImage
��g v
.
��v w
Error
��w |
)
��| }
;
��} ~
}
�� 
}
�� 	
private
�� 
void
�� 

_AddSymbol
�� 
(
��  
string
��  &
symbol
��' -
)
��- .
{
�� 	
Model
�� 
.
�� 
Symbols
�� 
.
�� 
Add
�� 
(
�� 
new
�� !
TDI
��" %
(
��% &
symbol
��& ,
,
��, -
Model
��. 3
.
��3 4
KlineInterval
��4 A
,
��A B
(
��C D
string
��D J
symbol
��K Q
,
��Q R

Dictionary
��S ]
<
��] ^
string
��^ d
,
��d e
List
��f j
<
��j k
object
��k q
>
��q r
>
��r s
values
��t z
)
��z {
=>
��| ~
{�� �
}��� �
,��� �!
SendSignalMessage��� �
)��� �
{��� �
}��� �
)��� �
;��� �
Settings
�� 
.
�� 
BotsSettings
�� !
.
��! "
TDISettings
��" -
.
��- .
Symbols
��. 5
.
��5 6
Add
��6 9
(
��9 :
symbol
��: @
)
��@ A
;
��A B
Settings
�� 
.
�� 
SaveSettings
�� !
(
��! "
)
��" #
;
��# $
}
�� 	
public
�� 
Task
�� 
AddAllSymbols
�� !
(
��! "
)
��" #
{
�� 	
CryptoExchange
�� 
.
�� 
Net
�� 
.
�� 
Objects
�� &
.
��& '
WebCallResult
��' 4
<
��4 5
Binance
��5 <
.
��< =
Net
��= @
.
��@ A
Objects
��A H
.
��H I
Models
��I O
.
��O P
Spot
��P T
.
��T U!
BinanceExchangeInfo
��U h
>
��h i
?
��i j
exchangeInfos
��k x
=
��y z
StaticBinance��{ �
.��� �
Client��� �
.��� �
SpotApi��� �
.��� �
ExchangeData��� �
.��� �$
GetExchangeInfoAsync��� �
(��� �
)��� �
.��� �
Result��� �
;��� �
Model
�� 
.
�� 
Symbols
�� 
.
�� 
Clear
�� 
(
��  
)
��  !
;
��! "
Settings
�� 
.
�� 
BotsSettings
�� !
.
��! "
TDISettings
��" -
.
��- .
Symbols
��. 5
.
��5 6
Clear
��6 ;
(
��; <
)
��< =
;
��= >
exchangeInfos
�� 
.
�� 
Data
�� 
.
�� 
Symbols
�� &
.
��& '
ToList
��' -
(
��- .
)
��. /
.
��/ 0
ForEach
��0 7
(
��7 8
x
��8 9
=>
��: <
{
�� 
try
�� 
{
�� 

_AddSymbol
�� 
(
�� 
x
��  
.
��  !
Name
��! %
)
��% &
;
��& '
}
�� 
catch
�� 
(
�� 
	Exception
��  
ex
��! #
)
��# $
{
�� 

MessageBox
�� 
.
�� 
Show
�� #
(
��# $
$"
��$ &
{
��& '
x
��' (
.
��( )
Name
��) -
}
��- .
$str
��. S
{
��S T
ex
��T V
.
��V W
Message
��W ^
}
��^ _
"
��_ `
,
��` a
$str
��b h
,
��h i
MessageBoxButton
��j z
.
��z {
OK
��{ }
,
��} ~
MessageBoxImage�� �
.��� �
Error��� �
)��� �
;��� �
}
�� 
}
�� 
)
�� 
;
�� 
return
�� 
Task
�� 
.
�� 
Delay
�� 
(
�� 
$num
�� 
)
��  
;
��  !
}
�� 	
public
�� 
void
�� 
SendSignalMessage
�� %
(
��% &
string
��& ,
symbol
��- 3
,
��3 4

Dictionary
��5 ?
<
��? @
string
��@ F
,
��F G
List
��H L
<
��L M
object
��M S
>
��S T
>
��T U
values
��V \
,
��\ ]
Enums
��^ c
.
��c d

SignalType
��d n
type
��o s
)
��s t
{
�� 	
string
�� 
message
�� 
=
�� 
type
�� !
switch
��" (
{
�� 
Enums
�� 
.
�� 

SignalType
��  
.
��  !
Sell
��! %
=>
��& (
Settings
��) 1
.
��1 2
BotsSettings
��2 >
.
��> ?
TDISettings
��? J
.
��J K
SignalMessages
��K Y
.
��Y Z
Sell
��Z ^
,
��^ _
Enums
�� 
.
�� 

SignalType
��  
.
��  !
Buy
��! $
=>
��% '
Settings
��( 0
.
��0 1
BotsSettings
��1 =
.
��= >
TDISettings
��> I
.
��I J
SignalMessages
��J X
.
��X Y
Buy
��Y \
,
��\ ]
Enums
�� 
.
�� 

SignalType
��  
.
��  !
Exit
��! %
=>
��& (
Settings
��) 1
.
��1 2
BotsSettings
��2 >
.
��> ?
TDISettings
��? J
.
��J K
SignalMessages
��K Y
.
��Y Z
Exit
��Z ^
,
��^ _
_
�� 
=>
�� 
$str
�� 
,
�� 
}
�� 
;
�� 
if
�� 
(
�� 
string
�� 
.
�� 
IsNullOrEmpty
�� $
(
��$ %
message
��% ,
)
��, -
)
��- .
return
��/ 5
;
��5 6
message
�� 
=
�� 
message
�� 
.
�� 
Replace
�� %
(
��% &
$str
��& 0
,
��0 1
symbol
��2 8
)
��8 9
.
��9 :
Replace
��: A
(
��A B
$str
��B K
,
��K L
Math
��M Q
.
��Q R
Round
��R W
(
��W X
(
��X Y
(
��Y Z
Kline
��Z _
)
��_ `
values
��` f
[
��f g
$str
��g o
]
��o p
.
��p q
Last
��q u
(
��u v
)
��v w
)
��w x
.
��x y
Close
��y ~
,
��~ 
$num��� �
)��� �
.��� �
ToString��� �
(��� �
)��� �
)��� �
;��� �
foreach
�� 
(
�� 
User
�� 
user
�� 
in
�� !
Model
��" '
.
��' (
Users
��( -
)
��- .
{
�� 
try
�� 
{
�� 
if
�� 
(
�� 
user
�� 
.
�� 
ChatId
�� #
==
��$ &
$num
��' (
||
��) +
!
��, -
user
��- 1
.
��1 2

TDISymbols
��2 <
.
��< =
Any
��= @
(
��@ A
x
��A B
=>
��C E
x
��F G
.
��G H
Key
��H K
.
��K L
Equals
��L R
(
��R S
symbol
��S Y
)
��Y Z
&&
��[ ]
x
��^ _
.
��_ `
Value
��` e
>
��f g
DateTime
��h p
.
��p q
Now
��q t
)
��t u
)
��u v
continue
��w 
;�� �

BotClients
�� 
.
�� 
	TDIClient
�� (
.
��( )"
SendTextMessageAsync
��) =
(
��= >
user
��> B
.
��B C
ChatId
��C I
,
��I J
message
��K R
)
��R S
;
��S T
}
�� 
catch
�� 
(
�� 
	Exception
��  
ex
��! #
)
��# $
{
�� 
Console
�� 
.
�� 
	WriteLine
�� %
(
��% &
$"
��& (
$str
��( 9
{
��9 :
user
��: >
.
��> ?
Username
��? G
}
��G H
$str
��H c
{
��c d
ex
��d f
.
��f g
Message
��g n
}
��n o
"
��o p
)
��p q
;
��q r
}
�� 
}
�� 
foreach
�� 
(
�� 
string
�� 
?
�� 
group
�� "
in
��# %
Settings
��& .
.
��. /
TelegramSettings
��/ ?
.
��? @
	TDIGroups
��@ I
)
��I J
{
�� 
try
�� 
{
�� 

BotClients
�� 
.
�� 
	TDIClient
�� (
.
��( )"
SendTextMessageAsync
��) =
(
��= >
group
��> C
,
��C D
message
��E L
)
��L M
;
��M N
}
�� 
catch
�� 
(
�� 
	Exception
��  
ex
��! #
)
��# $
{
�� 
Console
�� 
.
�� 
	WriteLine
�� %
(
��% &
$"
��& (
$str
��( 8
{
��8 9
group
��9 >
}
��> ?
$str
��? Z
{
��Z [
ex
��[ ]
.
��] ^
Message
��^ e
}
��e f
"
��f g
)
��g h
;
��h i
}
�� 
}
�� 
}
�� 	
public
�� 
void
�� 
SaveSettings
��  
(
��  !
)
��! "
{
�� 	
Settings
�� 
.
�� 
BotsSettings
�� !
.
��! "
TDISettings
��" -
.
��- .
SignalMessages
��. <
.
��< =
Sell
��= A
=
��B C
Model
��D I
.
��I J
SellSignalString
��J Z
;
��Z [
Settings
�� 
.
�� 
BotsSettings
�� !
.
��! "
TDISettings
��" -
.
��- .
SignalMessages
��. <
.
��< =
Buy
��= @
=
��A B
Model
��C H
.
��H I
BuySignalString
��I X
;
��X Y
Settings
�� 
.
�� 
BotsSettings
�� !
.
��! "
TDISettings
��" -
.
��- .
SignalMessages
��. <
.
��< =
Exit
��= A
=
��B C
Model
��D I
.
��I J
ExitSignalString
��J Z
;
��Z [
Settings
�� 
.
�� 
BotsSettings
�� !
.
��! "
TDISettings
��" -
.
��- .
	RSIPeriot
��. 7
=
��8 9
Model
��: ?
.
��? @
	RSIPeriot
��@ I
;
��I J
Settings
�� 
.
�� 
BotsSettings
�� !
.
��! "
TDISettings
��" -
.
��- .
RSIPLPeriot
��. 9
=
��: ;
Model
��< A
.
��A B
RSIPLPeriot
��B M
;
��M N
Settings
�� 
.
�� 
BotsSettings
�� !
.
��! "
TDISettings
��" -
.
��- . 
VotalityBandPeriot
��. @
=
��A B
Model
��C H
.
��H I
VBPeriot
��I Q
;
��Q R
Settings
�� 
.
�� 
BotsSettings
�� !
.
��! "
TDISettings
��" -
.
��- .
	TSLPeriot
��. 7
=
��8 9
Model
��: ?
.
��? @
	TSLPeriot
��@ I
;
��I J
Settings
�� 
.
�� 
BotsSettings
�� !
.
��! "
TDISettings
��" -
.
��- .
RSIOversoldLevel
��. >
=
��? @
Model
��A F
.
��F G
RSIOversoldLevel
��G W
;
��W X
Settings
�� 
.
�� 
BotsSettings
�� !
.
��! "
TDISettings
��" -
.
��- . 
RSIOverboughtLevet
��. @
=
��A B
Model
��C H
.
��H I 
RSIOverboughtLevel
��I [
;
��[ \
Settings
�� 
.
�� 
BotsSettings
�� !
.
��! "
TDISettings
��" -
.
��- .
MinSignalPeriot
��. =
=
��> ?
Model
��@ E
.
��E F
MinSignalPeriot
��F U
;
��U V
Settings
�� 
.
�� 
BotsSettings
�� !
.
��! "
TDISettings
��" -
.
��- .
KlineInterval
��. ;
=
��< =
Enum
��> B
.
��B C
GetName
��C J
(
��J K
typeof
��K Q
(
��Q R
KlineInterval
��R _
)
��_ `
,
��` a
Model
��b g
.
��g h
KlineInterval
��h u
)
��u v
;
��v w
Settings
�� 
.
�� 
SaveSettings
�� !
(
��! "
)
��" #
;
��# $

MessageBox
�� 
.
�� 
Show
�� 
(
�� 
$str
�� ;
,
��; <
$str
��= Q
,
��Q R
MessageBoxButton
��S c
.
��c d
OK
��d f
)
��f g
;
��g h
}
�� 	
public
�� 
void
�� 
LoadSettings
��  
(
��  !
)
��! "
{
�� 	
Model
�� 
.
�� 
SellSignalString
�� "
=
��# $
Settings
��% -
.
��- .
BotsSettings
��. :
.
��: ;
TDISettings
��; F
.
��F G
SignalMessages
��G U
.
��U V
Sell
��V Z
;
��Z [
Model
�� 
.
�� 
BuySignalString
�� !
=
��" #
Settings
��$ ,
.
��, -
BotsSettings
��- 9
.
��9 :
TDISettings
��: E
.
��E F
SignalMessages
��F T
.
��T U
Buy
��U X
;
��X Y
Model
�� 
.
�� 
ExitSignalString
�� "
=
��# $
Settings
��% -
.
��- .
BotsSettings
��. :
.
��: ;
TDISettings
��; F
.
��F G
SignalMessages
��G U
.
��U V
Exit
��V Z
;
��Z [
Model
�� 
.
�� 
	RSIPeriot
�� 
=
�� 
Settings
�� &
.
��& '
BotsSettings
��' 3
.
��3 4
TDISettings
��4 ?
.
��? @
	RSIPeriot
��@ I
;
��I J
Model
�� 
.
�� 
RSIPLPeriot
�� 
=
�� 
Settings
��  (
.
��( )
BotsSettings
��) 5
.
��5 6
TDISettings
��6 A
.
��A B
RSIPLPeriot
��B M
;
��M N
Model
�� 
.
�� 
	TSLPeriot
�� 
=
�� 
Settings
�� &
.
��& '
BotsSettings
��' 3
.
��3 4
TDISettings
��4 ?
.
��? @
	TSLPeriot
��@ I
;
��I J
Model
�� 
.
�� 
VBPeriot
�� 
=
�� 
Settings
�� %
.
��% &
BotsSettings
��& 2
.
��2 3
TDISettings
��3 >
.
��> ? 
VotalityBandPeriot
��? Q
;
��Q R
Model
�� 
.
�� 
RSIOversoldLevel
�� "
=
��# $
Settings
��% -
.
��- .
BotsSettings
��. :
.
��: ;
TDISettings
��; F
.
��F G
RSIOversoldLevel
��G W
;
��W X
Model
�� 
.
��  
RSIOverboughtLevel
�� $
=
��% &
Settings
��' /
.
��/ 0
BotsSettings
��0 <
.
��< =
TDISettings
��= H
.
��H I 
RSIOverboughtLevet
��I [
;
��[ \
Model
�� 
.
�� 
MinSignalPeriot
�� !
=
��" #
Settings
��$ ,
.
��, -
BotsSettings
��- 9
.
��9 :
TDISettings
��: E
.
��E F
MinSignalPeriot
��F U
;
��U V
}
�� 	
public
�� 
void
�� !
ChangeKlineInterval
�� '
(
��' (
)
��( )
{
�� 	
MessageBoxResult
�� 
change
�� #
=
��$ %

MessageBox
��& 0
.
��0 1
Show
��1 5
(
��5 6
$str��6 �
,��� �
$str��� �
,��� � 
MessageBoxButton��� �
.��� �
YesNo��� �
,��� �
MessageBoxImage��� �
.��� �
Warning��� �
)��� �
;��� �
if
�� 
(
�� 
change
�� 
==
�� 
MessageBoxResult
�� *
.
��* +
No
��+ -
)
��- .
{
�� 
Model
�� 
.
�� 
KlineInterval
�� #
=
��$ %
Model
��& +
.
��+ ,
KlineIntervals
��, :
.
��: ;
First
��; @
(
��@ A
x
��A B
=>
��C E
x
��F G
.
��G H
Equals
��H N
(
��N O
Model
��O T
.
��T U
Symbols
��U \
.
��\ ]
First
��] b
(
��b c
)
��c d
.
��d e
Interval
��e m
)
��m n
)
��n o
;
��o p
return
�� 
;
�� 
}
�� 
Model
�� 
.
�� 
Symbols
�� 
.
�� 
ToList
��  
(
��  !
)
��! "
.
��" #
ForEach
��# *
(
��* +
x
��+ ,
=>
��- /
x
��0 1
.
��1 2
ChangeInterval
��2 @
(
��@ A
Model
��A F
.
��F G
KlineInterval
��G T
)
��T U
)
��U V
;
��V W
SaveSettings
�� 
(
�� 
)
�� 
;
�� 
}
�� 	
}
�� 
}�� �

tC:\Users\Ömer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\UI\Views\MainWindow.xaml.cs
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
} �
nC:\Users\Ömer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\UI\Views\News.xaml.cs
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
} �
mC:\Users\Ömer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\UI\Views\PAC.xaml.cs
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
} �
mC:\Users\Ömer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\UI\Views\RSI.xaml.cs
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
} �
mC:\Users\Ömer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\UI\Views\TDI.xaml.cs
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