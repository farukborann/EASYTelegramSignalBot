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
 à
mC:\Users\√ñmer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\Database\Database.cs
	namespace 	!
EASYTelegramSignalBot
 
.  
Database  (
{ 
public 

static 
class 

Connection "
{ 
private		 
static		 
DispatcherTimer		 &
refreshContextTimer		' :
{		; <
get		= @
;		@ A
set		B E
;		E F
}		G H
public 
static 
DatabaseContext %
Context& -
{. /
get0 3
;3 4
set5 8
;8 9
}: ;
private 
static 
void 
Refresh #
(# $
object$ *
sender+ 1
,1 2
	EventArgs3 <
e= >
)> ?
{ 	
Context 
= 
new 
DatabaseContext )
() *
)* +
;+ ,
Context 
. 
Users 
. 
Load 
( 
)  
;  !
} 	
static 

Connection 
( 
) 
{ 	
Context 
= 
new 
( 
) 
; 
Context 
. 
Users 
. 
Load 
( 
)  
;  !
refreshContextTimer 
=  !
new" %
DispatcherTimer& 5
{ 
Interval 
= 
new 
TimeSpan '
(' (
$num( )
,) *
$num+ ,
,, -
$num. /
)/ 0
} 
; 
refreshContextTimer 
.  
Tick  $
+=% '
new( +
EventHandler, 8
(8 9
Refresh9 @
)@ A
;A B
refreshContextTimer 
.  
Start  %
(% &
)& '
;' (
} 	
} 
} ë
tC:\Users\√ñmer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\Database\DatabaseContext.cs
	namespace 	!
EASYTelegramSignalBot
 
.  
Database  (
{ 
public 

class 
DatabaseContext  
:! "
	DbContext# ,
{ 
	protected		 
override		 
void		 
OnConfiguring		  -
(		- .#
DbContextOptionsBuilder		. E
optionsBuilder		F T
)		T U
{

 	
optionsBuilder 
. 
UseSqlServer '
(' (
Settings( 0
.0 1
DatabaseSettings1 A
.A B$
DatabaseConnectionStringB Z
)Z [
;[ \
} 	
public 
void !
CheckDatabaseSettings )
() *
)* +
{ 	
if 
( 
Settings 
. 
DatabaseSettings )
.) *#
ResetDatabaseFirstStart* A
)A B
{ 
ResetDatabase 
( 
) 
;  
} 
else 
if 
( 
! 
Settings 
. 
DatabaseSettings /
./ 0#
IsDatabaseEnsureCreated0 G
)G H
{ 
CreateDatabase 
( 
)  
;  !
} 
SaveChanges 
( 
) 
; 
} 	
public 
void 
CreateDatabase "
(" #
)# $
{ 	
Database 
. 
EnsureCreated "
(" #
)# $
;$ %
Settings 
. $
SetDatabaseEnsureCreated -
(- .
). /
;/ 0
Console 
. 
	WriteLine 
( 
$str 4
)4 5
;5 6
}   	
public"" 
void"" 
ResetDatabase"" !
(""! "
)""" #
{## 	
Database$$ 
.$$ 
EnsureDeleted$$ "
($$" #
)$$# $
;$$$ %
Settings%% 
.%% 
DatabaseResetted%% %
(%%% &
)%%& '
;%%' (
Console&& 
.&& 
	WriteLine&& 
(&& 
$str&& i
)&&i j
;&&j k
Console'' 
.'' 
ReadKey'' 
('' 
)'' 
;'' 
Environment(( 
.(( 
Exit(( 
((( 
$num(( 
)(( 
;((  
})) 	
public++ 
DbSet++ 
<++ 
User++ 
>++ 
Users++  
{++! "
get++# &
;++& '
set++( +
;+++ ,
}++- .
},, 
}-- ﬁ
sC:\Users\√ñmer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\Database\DatabaseHelper.cs
	namespace 	!
EASYTelegramSignalBot
 
.  
Database  (
{ 
public 

static 
class 
DatabaseHelper &
{ 
public 
static 
void 
DelUser "
(" #
this# '
DatabaseContext( 7
	DbContext8 A
,A B
UserC G
userH L
)L M
{		 	
	DbContext

 
.

 
Remove

 
(

 
user

 !
)

! "
;

" #
} 	
} 
} Ê
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
{		 
public

 
int

 
Id

 
{

 
get

 
;

 
set

  
;

  !
}

" #
public 
string 
? 
Username 
{  !
get" %
;% &
set' *
;* +
}, -
public 
long 
ChatId 
{ 
get  
;  !
set" %
;% &
}' (
public 
bool 
TDI 
{ 
get 
; 
set "
;" #
}$ %
public 
bool 
News 
{ 
get 
; 
set  #
;# $
}% &
public 
DateTime 
? 
NewsExpiryDate '
{( )
get* -
;- .
set/ 2
;2 3
}4 5
public 
string 
? 
TDISymbolValues &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
[ 	
	NotMapped	 
] 
public 

Dictionary 
< 
string  
,  !
DateTime" *
>* +

TDISymbols, 6
{7 8
get9 <
;< =
set> A
;A B
}C D
public 
User 
( 
) 
{ 	

TDISymbols 
= 
new 
( 
) 
; 
} 	
public 
void 
UpdateUserSymbols %
(% &
)& '
{ 	

TDISymbols 
= 
JsonConvert $
.$ %
DeserializeObject% 6
<6 7

Dictionary7 A
<A B
stringB H
,H I
DateTimeJ R
>R S
>S T
(T U
TDISymbolValuesU d
??e g
$strh l
)l m
??n p
newq t
(t u
)u v
;v w
}   	
public"" 
void"" 
SaveUserSymbols"" #
(""# $
)""$ %
{## 	
TDISymbolValues$$ 
=$$ 
JsonConvert$$ )
.$$) *
SerializeObject$$* 9
($$9 :

TDISymbols$$: D
)$$D E
;$$E F
UpdateUserSymbols%% 
(%% 
)%% 
;%%  
}&& 	
}'' 
}(( Ï
sC:\Users\√ñmer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\Finance\Binance\Binance.cs
	namespace		 	!
EASYTelegramSignalBot		
 
.		  
Finance		  '
{

 
public 

static 
class 
StaticBinance %
{ 
public 
static 
BinanceClient #
Client$ *
{+ ,
get- 0
;0 1
set2 5
;5 6
}7 8
=9 :
new; >
BinanceClient? L
(L M
)M N
;N O
public 
static 
BinanceSocketClient )
SocketClient* 6
{7 8
get9 <
;< =
set> A
;A B
}C D
=E F
newG J
BinanceSocketClientK ^
(^ _
)_ `
;` a
public 
static 
List 
< 
KlineSubscription ,
>, -"
SubscribedKlineUpdates. D
{E F
getG J
;J K
setL O
;O P
}Q R
=S T
newU X
(X Y
)Y Z
;Z [
public 
static 
KlineSubscription '(
SubscribeToKlineUpdatesAsync( D
(D E
EnumsE J
.J K
SubscriptionTypeK [
subType\ c
,c d
stringe k
symboll r
,r s
KlineInterval	t Å
interval
Ç ä
,
ä ã

TickAction
å ñ

tickAction
ó °
)
° ¢
{ 	
try 
{ 
KlineSubscription !
?! "
subscription# /
=0 1"
SubscribedKlineUpdates2 H
.H I
FirstI N
(N O
xO P
=>Q S
xT U
.U V
SymbolV \
.\ ]
ToLower] d
(d e
)e f
.f g
Equalsg m
(m n
symboln t
.t u
ToLoweru |
(| }
)} ~
)~ 
&&
Ä Ç
x
É Ñ
.
Ñ Ö
Interval
Ö ç
.
ç é
Equals
é î
(
î ï
interval
ï ù
)
ù û
)
û ü
;
ü †
subscription 
. 
	AddAction &
(& '

tickAction' 1
)1 2
;2 3
return 
subscription #
;# $
} 
catch 
( %
InvalidOperationException ,
), -
{ 
KlineSubscription !
?! "
subscription# /
=0 1
new2 5
KlineSubscription6 G
(G H
subTypeH O
,O P
symbolQ W
,W X
intervalY a
,a b

tickActionc m
.m n

KlineCountn x
)x y
;y z
subscription 
. 
	AddAction &
(& '

tickAction' 1
)1 2
;2 3"
SubscribedKlineUpdates &
.& '
Add' *
(* +
subscription+ 7
)7 8
;8 9
return 
subscription #
;# $
} 
}   	
}!! 
}"" ≠&
qC:\Users\√ñmer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\Finance\Binance\Kline.cs
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
}   ‡y
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
{ 
private #
CancellationTokenSource '#
CancellationTokenSource( ?
{@ A
getB E
;E F
setG J
;J K
}L M
private 
Task 
< 

CallResult 
<  
UpdateSubscription  2
>2 3
>3 4

CallResult5 ?
{@ A
getB E
;E F
setG J
;J K
}L M
public 
Enums 
. 
SubscriptionType %
Type& *
{+ ,
get- 0
;0 1
set2 5
;5 6
}7 8
public 
string 
Symbol 
{ 
get "
;" #
set$ '
;' (
}) *
public 
KlineInterval 
Interval %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public 
List 
< 

TickAction 
> 
Actions  '
{( )
get* -
;- .
set/ 2
;2 3
}4 5
private 
int 
Limit 
{ 
get 
;  
set! $
;$ %
}& '
public 
List 
< 
Kline 
> 
Klines !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
KlineSubscription  
(  !
Enums! &
.& '
SubscriptionType' 7
type8 <
,< =
string> D
symbolE K
,K L
KlineIntervalM Z
interval[ c
,c d
inte h
limiti n
)n o
{ 	#
CancellationTokenSource #
=$ %
new& )
() *
)* +
;+ ,
Type 
= 
type 
; 
Symbol 
= 
symbol 
; 
Interval   
=   
interval   
;    
Actions!! 
=!! 
new!! 
(!! 
)!! 
;!! 
Limit## 
=## 
limit## 
;## 
Klines$$ 
=$$ 
new$$ 
($$ 
)$$ 
;$$ 
	GetKlines%% 
(%% 
)%% 
;%% 

CallResult'' 
='' 
Type'' 
switch'' $
{(( 
Enums)) 
.)) 
SubscriptionType)) &
.))& '
CoinFutures))' 2
=>))3 5
StaticBinance))6 C
.))C D
SocketClient))D P
.))P Q
CoinFuturesStreams))Q c
.))c d)
SubscribeToKlineUpdatesAsync	))d Ä
(
))Ä Å
Symbol**( .
,**. /
Interval++( 0
,++0 1
data,,( ,
=>,,- /
{,,0 1
RunFuncs,,2 :
(,,: ;
data,,; ?
),,? @
;,,@ A
},,B C
,,,C D#
CancellationTokenSource--( ?
.--? @
Token--@ E
)..$ %
,..% &
Enums// 
.// 
SubscriptionType// &
.//& '
Spot//' +
=>//, .
StaticBinance/// <
.//< =
SocketClient//= I
.//I J
SpotStreams//J U
.//U V(
SubscribeToKlineUpdatesAsync//V r
(//r s
Symbol00( .
,00. /
Interval11( 0
,110 1
data22( ,
=>22- /
{220 1
RunFuncs222 :
(22: ;
data22; ?
)22? @
;22@ A
}22B C
,22C D#
CancellationTokenSource33( ?
.33? @
Token33@ E
)44$ %
,44% &
_55 
=>55 
StaticBinance55 "
.55" #
SocketClient55# /
.55/ 0
UsdFuturesStreams550 A
.55A B(
SubscribeToKlineUpdatesAsync55B ^
(55^ _
Symbol66( .
,66. /
Interval77( 0
,770 1
data88( ,
=>88- /
{880 1
RunFuncs882 :
(88: ;
data88; ?
)88? @
;88@ A
}88B C
,88C D#
CancellationTokenSource99( ?
.99? @
Token99@ E
)::$ %
,::% &
};; 
;;; 
}<< 	
private>> 
void>> 
RunFuncs>> 
(>> 
	DataEvent>> '
<>>' (#
IBinanceStreamKlineData>>( ?
>>>? @
data>>A E
)>>E F
{?? 	
if@@ 
(@@ 
!@@ 
Klines@@ 
.@@ 
Last@@ 
(@@ 
)@@ 
.@@ 
Date@@ #
.@@# $
Equals@@$ *
(@@* +
data@@+ /
.@@/ 0
Data@@0 4
.@@4 5
Data@@5 9
.@@9 :
OpenTime@@: B
)@@B C
)@@C D
{AA 
ActionsCC 
.CC 
WhereCC 
(CC 
xCC 
=>CC  "
xCC# $
.CC$ %
TriggerTypeCC% 0
.CC0 1
EqualsCC1 7
(CC7 8
EnumsCC8 =
.CC= >
TriggerTypeCC> I
.CCI J

KlineCloseCCJ T
)CCT U
)CCU V
.CCV W
ToListCCW ]
(CC] ^
)CC^ _
.CC_ `
ForEachCC` g
(CCg h
xCCh i
=>CCj l
TaskCCm q
.CCq r
RunCCr u
(CCu v
(CCv w
)CCw x
=>CCy {
xCC| }
.CC} ~
Action	CC~ Ñ
(
CCÑ Ö
Klines
CCÖ ã
.
CCã å
GetRange
CCå î
(
CCî ï
Klines
CCï õ
.
CCõ ú
Count
CCú °
-
CC¢ £
x
CC§ •
.
CC• ¶

KlineCount
CC¶ ∞
,
CC∞ ±
x
CC≤ ≥
.
CC≥ ¥

KlineCount
CC¥ æ
)
CCæ ø
)
CCø ¿
)
CC¿ ¡
.
CC¡ ¬
Wait
CC¬ ∆
(
CC∆ «
)
CC« »
)
CC» …
;
CC…  
KlinesFF 
.FF 
RemoveAtFF 
(FF  
$numFF  !
)FF! "
;FF" #
KlinesGG 
.GG 
AddGG 
(GG 
dataGG 
.GG  
DataGG  $
.GG$ %
DataGG% )
.GG) *
ToKlineGG* 1
(GG1 2
)GG2 3
)GG3 4
;GG4 5
ActionsJJ 
.JJ 
WhereJJ 
(JJ 
xJJ 
=>JJ  "
xJJ# $
.JJ$ %
TriggerTypeJJ% 0
.JJ0 1
EqualsJJ1 7
(JJ7 8
EnumsJJ8 =
.JJ= >
TriggerTypeJJ> I
.JJI J
	KlineOpenJJJ S
)JJS T
)JJT U
.JJU V
ToListJJV \
(JJ\ ]
)JJ] ^
.JJ^ _
ForEachJJ_ f
(JJf g
xJJg h
=>JJi k
TaskJJl p
.JJp q
RunJJq t
(JJt u
(JJu v
)JJv w
=>JJx z
xJJ{ |
.JJ| }
Action	JJ} É
(
JJÉ Ñ
Klines
JJÑ ä
.
JJä ã
GetRange
JJã ì
(
JJì î
Klines
JJî ö
.
JJö õ
Count
JJõ †
-
JJ° ¢
x
JJ£ §
.
JJ§ •

KlineCount
JJ• Ø
,
JJØ ∞
x
JJ± ≤
.
JJ≤ ≥

KlineCount
JJ≥ Ω
)
JJΩ æ
)
JJæ ø
)
JJø ¿
)
JJ¿ ¡
;
JJ¡ ¬
}KK 
elseLL 
{MM 
KlinesNN 
[NN 
^NN 
$numNN 
]NN 
=NN 
dataNN !
.NN! "
DataNN" &
.NN& '
DataNN' +
.NN+ ,
ToKlineNN, 3
(NN3 4
)NN4 5
;NN5 6
}OO 
ActionsQQ 
.QQ 
WhereQQ 
(QQ 
xQQ 
=>QQ 
xQQ  
.QQ  !
TriggerTypeQQ! ,
.QQ, -
EqualsQQ- 3
(QQ3 4
EnumsQQ4 9
.QQ9 :
TriggerTypeQQ: E
.QQE F
KlineUpdateQQF Q
)QQQ R
)QQR S
.QQS T
ToListQQT Z
(QQZ [
)QQ[ \
.QQ\ ]
ForEachQQ] d
(QQd e
xQQe f
=>QQg i
TaskQQj n
.QQn o
RunQQo r
(QQr s
(QQs t
)QQt u
=>QQv x
xQQy z
.QQz {
Action	QQ{ Å
(
QQÅ Ç
Klines
QQÇ à
.
QQà â
GetRange
QQâ ë
(
QQë í
Klines
QQí ò
.
QQò ô
Count
QQô û
-
QQü †
x
QQ° ¢
.
QQ¢ £

KlineCount
QQ£ ≠
,
QQ≠ Æ
x
QQØ ∞
.
QQ∞ ±

KlineCount
QQ± ª
)
QQª º
)
QQº Ω
)
QQΩ æ
)
QQæ ø
;
QQø ¿
}RR 	
publicTT 
voidTT 
	AddActionTT 
(TT 

TickActionTT (

tickActionTT) 3
)TT3 4
{UU 	
UpdateLimitVV 
(VV 

tickActionVV "
.VV" #

KlineCountVV# -
)VV- .
;VV. /
ActionsWW 
.WW 
AddWW 
(WW 

tickActionWW "
)WW" #
;WW# $
}XX 	
publicZZ 
voidZZ 
UpdateLimitZZ 
(ZZ  
intZZ  #
limitZZ$ )
)ZZ) *
{[[ 	
if\\ 
(\\ 
Limit\\ 
<\\ 
limit\\ 
)\\ 
{]] 
	GetKlines^^ 
(^^ 
)^^ 
;^^ 
}__ 
}`` 	
privatebb 
Listbb 
<bb 
Klinebb 
>bb 
GetKlinesAsyncbb *
(bb* +
stringbb+ 1
Symbolbb2 8
,bb8 9
KlineIntervalbb: G
IntervalbbH P
,bbP Q
intbbR U
LimitbbV [
,bb[ \
DateTimebb] e
?bbe f
endTimebbg n
=bbo p
nullbbq u
)bbu v
{cc 	
returndd 
Typedd 
switchdd 
{ee 
Enumsff 
.ff 
SubscriptionTypeff &
.ff& '
CoinFuturesff' 2
=>ff3 5
StaticBinanceff6 C
.ffC D
ClientffD J
.ffJ K
CoinFuturesApiffK Y
.ffY Z
ExchangeDataffZ f
.fff g
GetKlinesAsyncffg u
(ffu v
Symbolffv |
,ff| }
Interval	ff~ Ü
,
ffÜ á
limit
ffà ç
:
ffç é
Limit
ffè î
,
ffî ï
endTime
ffñ ù
:
ffù û
endTime
ffü ¶
)
ff¶ ß
.
ffß ®
Result
ff® Æ
.
ffÆ Ø
Data
ffØ ≥
.
ff≥ ¥
ToKlines
ff¥ º
(
ffº Ω
)
ffΩ æ
,
ffæ ø
Enumsgg 
.gg 
SubscriptionTypegg &
.gg& '
Spotgg' +
=>gg, .
StaticBinancegg/ <
.gg< =
Clientgg= C
.ggC D
SpotApiggD K
.ggK L
ExchangeDataggL X
.ggX Y
GetKlinesAsyncggY g
(ggg h
Symbolggh n
,ggn o
Intervalggp x
,ggx y
limitggz 
:	gg Ä
Limit
ggÅ Ü
,
ggÜ á
endTime
ggà è
:
ggè ê
endTime
ggë ò
)
ggò ô
.
ggô ö
Result
ggö †
.
gg† °
Data
gg° •
.
gg• ¶
ToKlines
gg¶ Æ
(
ggÆ Ø
)
ggØ ∞
,
gg∞ ±
_hh 
=>hh 
StaticBinancehh "
.hh" #
Clienthh# )
.hh) *
UsdFuturesApihh* 7
.hh7 8
ExchangeDatahh8 D
.hhD E
GetKlinesAsynchhE S
(hhS T
SymbolhhT Z
,hhZ [
Intervalhh\ d
,hhd e
limithhf k
:hhk l
Limithhm r
,hhr s
endTimehht {
:hh{ |
endTime	hh} Ñ
)
hhÑ Ö
.
hhÖ Ü
Result
hhÜ å
.
hhå ç
Data
hhç ë
.
hhë í
ToKlines
hhí ö
(
hhö õ
)
hhõ ú
,
hhú ù
}ii 
;ii 
}jj 	
publicll 
voidll 
	GetKlinesll 
(ll 
)ll 
{mm 	
ifnn 
(nn 
Limitnn 
<nn 
$numnn 
)nn 
{oo 
GetKlinesAsyncpp 
(pp 
Symbolpp %
,pp% &
Intervalpp' /
,pp/ 0
Limitpp1 6
)pp6 7
.pp7 8
ForEachpp8 ?
(pp? @
xpp@ A
=>ppB D
KlinesppE K
.ppK L
AddppL O
(ppO P
xppP Q
)ppQ R
)ppR S
;ppS T
returnqq 
;qq 
}rr 
GetKlinesAsyncss 
(ss 
Symbolss !
,ss! "
Intervalss# +
,ss+ ,
$numss- 1
)ss1 2
.ss2 3
ForEachss3 :
(ss: ;
xss; <
=>ss= ?
Klinesss@ F
.ssF G
AddssG J
(ssJ K
xssK L
)ssL M
)ssM N
;ssN O
inttt 
GetKlinesCounttt 
=tt  
Limittt! &
-tt' (
$numtt) -
;tt- .
foruu 
(uu 
;uu 
GetKlinesCountuu !
>uu" #
$numuu$ (
;uu( )
GetKlinesCountuu* 8
-=uu9 ;
$numuu< @
)uu@ A
{vv 
GetKlinesAsyncww 
(ww 
Symbolww %
,ww% &
Intervalww' /
,ww/ 0
$numww1 5
,ww5 6
endTimeww7 >
:ww> ?
Klinesww@ F
[wwF G
$numwwG H
]wwH I
.wwI J
DatewwJ N
.wwN O

AddSecondswwO Y
(wwY Z
-wwZ [
$numww[ \
*ww] ^
(ww_ `
intww` c
)wwc d
Intervalwwd l
)wwl m
)wwm n
.wwn o
ForEachwwo v
(wwv w
xwww x
=>wwy {
Klines	ww| Ç
.
wwÇ É
Add
wwÉ Ü
(
wwÜ á
x
wwá à
)
wwà â
)
wwâ ä
;
wwä ã
}xx 
ifzz 
(zz 
GetKlinesCountzz 
>zz  
$numzz! "
)zz" #
{{{ 
GetKlinesAsync|| 
(|| 
Symbol|| %
,||% &
Interval||' /
,||/ 0
GetKlinesCount||1 ?
)||? @
.||@ A
ForEach||A H
(||H I
x||I J
=>||K M
Klines||N T
.||T U
Add||U X
(||X Y
x||Y Z
)||Z [
)||[ \
;||\ ]
}}} 
}~~ 	
public
ÄÄ 
void
ÄÄ 
Cancel
ÄÄ 
(
ÄÄ 
)
ÄÄ 
{
ÅÅ 	%
CancellationTokenSource
ÇÇ #
?
ÇÇ# $
.
ÇÇ$ %
Cancel
ÇÇ% +
(
ÇÇ+ ,
)
ÇÇ, -
;
ÇÇ- .
}
ÉÉ 	
}
ÑÑ 
}ÖÖ ≠<
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
}< =
public 
RSI 
( 
string 
symbol  
,  !
KlineInterval" /
interval0 8
,8 9
Action: @
<@ A
stringA G
,G H

DictionaryI S
<S T
stringT Z
,Z [
List\ `
<` a
objecta g
>g h
>h i
>i j
updateActionk w
,w x
Actiony 
<	 Ä
string
Ä Ü
,
Ü á
Enums
à ç
.
ç é

SignalType
é ò
>
ò ô
signalAction
ö ¶
)
¶ ß
: 
base 
( 
symbol 
, 
interval #
,# $
Enums% *
.* +
SubscriptionType+ ;
.; <
Spot< @
,@ A
signalActionB N
,N O
updateActionP \
)\ ]
{ 	
LastSignalType 
= 
Enums "
." #

SignalType# -
.- .
None. 2
;2 3

TickAction 
= 
new 
( 
) 
{ 

KlineCount 
= 
$num  
,  !
Creator 
= 
this 
, 
TriggerType 
= 
Enums #
.# $
TriggerType$ /
./ 0
KlineUpdate0 ;
,; <
Action 
= 
Indicate !
} 
; 
	Subscribe   
(   
)   
;   
}!! 	
private## 
void## 
Indicate## 
(## 
List## "
<##" #
Kline### (
>##( )
data##* .
)##. /
{$$ 	
List&& 
<&& 
	RsiResult&& 
>&& 
?&& 
Rsi&&  
=&&! "
data&&# '
.&&' (
GetRsi&&( .
(&&. /
Settings&&/ 7
.&&7 8
BotsSettings&&8 D
.&&D E
TDISettings&&E P
.&&P Q
	RSIPeriot&&Q Z
)&&Z [
.&&[ \
ToList&&\ b
(&&b c
)&&c d
;&&d e

RSIResults)) 
=)) 
Rsi)) 
;)) 
Values++ 
=++ 
new++ 
(++ 
)++ 
{,, 
{-- 
$str-- 
,-- 
data--  $
.--$ %
Select--% +
(--+ ,
x--, -
=>--. 0
(--1 2
object--2 8
?--8 9
)--9 :
x--: ;
??--< >
$num--? @
)--@ A
.--A B
ToList--B H
(--H I
)--I J
.--J K
GetRange--K S
(--S T
data--T X
.--X Y
Count--Y ^
---^ _
$num--_ a
,--a b
$num--b d
)--d e
}--f g
,--g h
{.. 
$str.. 
,.. 

RSIResults.. '
...' (
Select..( .
(... /
x../ 0
=>..1 3
(..4 5
object..5 ;
?..; <
)..< =
x..= >
...> ?
Rsi..? B
??..C E
$num..F G
)..G H
...H I
ToList..I O
(..O P
)..P Q
...Q R
GetRange..R Z
(..Z [
data..[ _
..._ `
Count..` e
-..e f
$num..f h
,..h i
$num..i k
)..k l
}..m n
,..n o
}// 
;// 
UpdateAction11 
(11 
Symbol11 
,11  
Values11! '
)11' (
;11( )
Enums33 
.33 

SignalType33 
RSI33  
;33  !
int55 
Last_RSI55 
=55 
(55 
int55 
?55  
)55  !
Rsi55! $
.55$ %
Last55% )
(55) *
)55* +
.55+ ,
Rsi55, /
??550 2
$num553 4
;554 5
if77 
(77 
Last_RSI77 
>77 
Settings77 #
.77# $
BotsSettings77$ 0
.770 1
RSISettings771 <
.77< =
RSIOverboughtLevet77= O
)77O P
RSI77Q T
=77U V
Enums77W \
.77\ ]

SignalType77] g
.77g h
	UpperLine77h q
;77q r
else88 
if88 
(88 
Last_RSI88 
<88 
Settings88  (
.88( )
BotsSettings88) 5
.885 6
RSISettings886 A
.88A B
RSIOversoldLevel88B R
)88R S
RSI88T W
=88X Y
Enums88Z _
.88_ `

SignalType88` j
.88j k
	UnderLine88k t
;88t u
else99 
RSI99 
=99 
Enums99 
.99 

SignalType99 '
.99' (
BetweenLines99( 4
;994 5
if<< 
(<< 
RSI<< 
.<< 
Equals<< 
(<< 
LastSignalType<< )
)<<) *
)<<* +
return<<, 2
;<<2 3
if== 
(== 
LastSignalType== 
====  
Enums==! &
.==& '

SignalType==' 1
.==1 2
None==2 6
)==6 7
{>> 
LastSignalType?? 
=??  
RSI??! $
;??$ %
return@@ 
;@@ 
}AA 
TaskCC 
.CC 
RunCC 
(CC 
(CC 
)CC 
=>CC 
SignalActionCC '
(CC' (
SymbolCC( .
,CC. /
RSICC0 3
)CC3 4
)CC4 5
;CC5 6
ConsoleDD 
.DD 
	WriteLineDD 
(DD 
$"DD  
$strDD  /
{DD/ 0
SymbolDD0 6
}DD6 7
$strDD7 ;
{DD; <
EnumDD< @
.DD@ A
GetNameDDA H
(DDH I
typeofDDI O
(DDO P
EnumsDDP U
.DDU V

SignalTypeDDV `
)DD` a
,DDa b
RSIDDc f
)DDf g
}DDg h
"DDh i
)DDi j
;DDj k
LastSignalTypeEE 
=EE 
RSIEE  
;EE  !
ConsoleGG 
.GG 
	WriteLineGG 
(GG 
$"GG  
{GG  !
SymbolGG! '
}GG' (
$strGG( 0
{GG0 1
EnumGG1 5
.GG5 6
GetNameGG6 =
(GG= >
typeofGG> D
(GGD E
EnumsGGE J
.GGJ K

SignalTypeGGK U
)GGU V
,GGV W
RSIGGX [
)GG[ \
}GG\ ]
"GG] ^
)GG^ _
;GG_ `
}HH 	
}II 
}JJ ìò
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
public 
List 
< 
	SmaResult 
> 
? 
FastMAResults  -
{. /
get0 3
;3 4
set5 8
;8 9
}: ;
public 
List 
< 
	SmaResult 
> 
? 
SlowMAResults  -
{. /
get0 3
;3 4
set5 8
;8 9
}: ;
public 
List 
< 
double 
? 
> 
? 
UpVBResults )
{* +
get, /
;/ 0
set1 4
;4 5
}6 7
public 
List 
< 
double 
? 
> 
? 
MiddleVBResults -
{. /
get0 3
;3 4
set5 8
;8 9
}: ;
public 
List 
< 
double 
? 
> 
? 
DownVBResults +
{, -
get. 1
;1 2
set3 6
;6 7
}8 9
private 
Enums 
. 

SignalType  
LastSignalType! /
{0 1
get2 5
;5 6
set7 :
;: ;
}< =
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
Ü á
Enums
à ç
.
ç é

SignalType
é ò
>
ò ô
signalAction
ö ¶
)
¶ ß
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
)\ ]
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
;%% 
}&& 	
private(( 
void(( 
Indicate(( 
((( 
List(( "
<((" #
Kline((# (
>((( )
data((* .
)((. /
{)) 	
List++ 
<++ 
	RsiResult++ 
>++ 
?++ 
Rsi++  
=++! "
data++# '
.++' (
GetRsi++( .
(++. /
Settings++/ 7
.++7 8
BotsSettings++8 D
.++D E
TDISettings++E P
.++P Q
	RSIPeriot++Q Z
)++Z [
.++[ \
ToList++\ b
(++b c
)++c d
;++d e
List.. 
<.. 
	SmaResult.. 
>.. 
?.. 
FastMA.. #
=..$ %
Rsi..& )
...) *
GetSma..* 0
(..0 1
Settings..1 9
...9 :
BotsSettings..: F
...F G
TDISettings..G R
...R S
RSIPLPeriot..S ^
)..^ _
..._ `
ToList..` f
(..f g
)..g h
;..h i
List11 
<11 
	SmaResult11 
>11 
?11 
SlowMA11 #
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
.11R S
	TSLPeriot11S \
)11\ ]
.11] ^
ToList11^ d
(11d e
)11e f
;11f g

Dictionary44 
<44 
DateTime44 
,44  
double44! '
?44' (
>44( )
?44) *
MA44+ -
=44. /
Rsi440 3
.443 4
GetSma444 :
(44: ;
Settings44; C
.44C D
BotsSettings44D P
.44P Q
TDISettings44Q \
.44\ ]
VotalityBandPeriot44] o
)44o p
.44p q
ToDictionary44q }
(44} ~
x44~ 
=>
44Ä Ç
x
44É Ñ
.
44Ñ Ö
Date
44Ö â
,
44â ä
x
44ã å
=>
44ç è
x
44ê ë
.
44ë í
Sma
44í ï
)
44ï ñ
;
44ñ ó

Dictionary55 
<55 
DateTime55 
,55  
double55! '
?55' (
>55( )
?55) *
StDev55+ 0
=551 2
Rsi553 6
.556 7
	GetStdDev557 @
(55@ A
Settings55A I
.55I J
BotsSettings55J V
.55V W
TDISettings55W b
.55b c
VotalityBandPeriot55c u
)55u v
.55v w
ToDictionary	55w É
(
55É Ñ
x
55Ñ Ö
=>
55Ü à
x
55â ä
.
55ä ã
Date
55ã è
,
55è ê
x
55ë í
=>
55ì ï
x
55ñ ó
.
55ó ò
StdDev
55ò û
*
55ü †
$num
55° ß
)
55ß ®
;
55® ©

Dictionary66 
<66 
DateTime66 
,66  
double66! '
?66' (
>66( )
?66) *
UpVB66+ /
=660 1
MA662 4
.664 5
ToDictionary665 A
(66A B
x66B C
=>66D F
x66G H
.66H I
Key66I L
,66L M
x66N O
=>66P R
x66S T
.66T U
Value66U Z
+66[ \
StDev66] b
[66b c
x66c d
.66d e
Key66e h
]66h i
)66i j
;66j k

Dictionary77 
<77 
DateTime77 
,77  
double77! '
?77' (
>77( )
?77) *
DownVB77+ 1
=772 3
MA774 6
.776 7
ToDictionary777 C
(77C D
x77D E
=>77F H
x77I J
.77J K
Key77K N
,77N O
x77P Q
=>77R T
x77U V
.77V W
Value77W \
-77] ^
StDev77_ d
[77d e
x77e f
.77f g
Key77g j
]77j k
)77k l
;77l m

Dictionary88 
<88 
DateTime88 
,88  
double88! '
?88' (
>88( )
?88) *
MiddleVB88+ 3
=884 5
UpVB886 :
.88: ;
ToDictionary88; G
(88G H
x88H I
=>88J L
x88M N
.88N O
Key88O R
,88R S
x88T U
=>88V X
(88Y Z
x88Z [
.88[ \
Value88\ a
+88b c
DownVB88d j
[88j k
x88k l
.88l m
Key88m p
]88p q
)88q r
/88s t
$num88u v
)88v w
;88w x
FastMAResults;; 
=;; 
FastMA;; "
;;;" #
SlowMAResults<< 
=<< 
SlowMA<< "
;<<" #
UpVBResults== 
=== 
UpVB== 
.== 
Values== %
.==% &
ToList==& ,
(==, -
)==- .
;==. /
MiddleVBResults>> 
=>> 
MiddleVB>> &
.>>& '
Values>>' -
.>>- .
ToList>>. 4
(>>4 5
)>>5 6
;>>6 7
DownVBResults?? 
=?? 
DownVB?? "
.??" #
Values??# )
.??) *
ToList??* 0
(??0 1
)??1 2
;??2 3
ValuesAA 
=AA 
newAA 
(AA 
)AA 
{BB 
{CC 
$strCC 
,CC 
dataCC  $
.CC$ %
SelectCC% +
(CC+ ,
xCC, -
=>CC. 0
(CC1 2
objectCC2 8
?CC8 9
)CC9 :
xCC: ;
??CC< >
$numCC? @
)CC@ A
.CCA B
ToListCCB H
(CCH I
)CCI J
.CCJ K
GetRangeCCK S
(CCS T
dataCCT X
.CCX Y
CountCCY ^
-CC^ _
$numCC_ a
,CCa b
$numCCb d
)CCd e
}CCf g
,CCg h
{DD 
$strDD 
,DD 
FastMAResultsDD  -
.DD- .
SelectDD. 4
(DD4 5
xDD5 6
=>DD7 9
(DD: ;
objectDD; A
?DDA B
)DDB C
xDDC D
.DDD E
SmaDDE H
??DDI K
$numDDL M
)DDM N
.DDN O
ToListDDO U
(DDU V
)DDV W
.DDW X
GetRangeDDX `
(DD` a
dataDDa e
.DDe f
CountDDf k
-DDk l
$numDDl n
,DDn o
$numDDo q
)DDq r
}DDs t
,DDt u
{EE 
$strEE 
,EE 
SlowMAResultsEE  -
.EE- .
SelectEE. 4
(EE4 5
xEE5 6
=>EE7 9
(EE: ;
objectEE; A
?EEA B
)EEB C
xEEC D
.EED E
SmaEEE H
??EEI K
$numEEL M
)EEM N
.EEN O
ToListEEO U
(EEU V
)EEV W
.EEW X
GetRangeEEX `
(EE` a
dataEEa e
.EEe f
CountEEf k
-EEk l
$numEEl n
,EEn o
$numEEo q
)EEq r
}EEs t
,EEt u
{FF 
$strFF 
,FF 
UpVBResultsFF )
.FF) *
SelectFF* 0
(FF0 1
xFF1 2
=>FF3 5
xFF6 7
==FF8 :
nullFF; ?
?FF@ A
$numFFB C
:FFD E
(FFF G
objectFFG M
)FFM N
xFFN O
)FFO P
.FFP Q
ToListFFQ W
(FFW X
)FFX Y
.FFY Z
GetRangeFFZ b
(FFb c
dataFFc g
.FFg h
CountFFh m
-FFm n
$numFFn p
,FFp q
$numFFq s
)FFs t
}FFu v
,FFv w
{GG 
$strGG  
,GG  !
MiddleVBResultsGG" 1
.GG1 2
SelectGG2 8
(GG8 9
xGG9 :
=>GG; =
xGG> ?
==GG@ B
nullGGC G
?GGH I
$numGGJ K
:GGL M
(GGN O
objectGGO U
)GGU V
xGGV W
)GGW X
.GGX Y
ToListGGY _
(GG_ `
)GG` a
.GGa b
GetRangeGGb j
(GGj k
dataGGk o
.GGo p
CountGGp u
-GGu v
$numGGv x
,GGx y
$numGGy {
)GG{ |
}GG} ~
,GG~ 
{HH 
$strHH 
,HH 
DownVBResultsHH  -
.HH- .
SelectHH. 4
(HH4 5
xHH5 6
=>HH7 9
xHH: ;
==HH< >
nullHH? C
?HHD E
$numHHF G
:HHH I
(HHJ K
objectHHK Q
)HHQ R
xHHR S
)HHS T
.HHT U
ToListHHU [
(HH[ \
)HH\ ]
.HH] ^
GetRangeHH^ f
(HHf g
dataHHg k
.HHk l
CountHHl q
-HHq r
$numHHr t
,HHt u
$numHHu w
)HHw x
}HHy z
}II 
;II 
UpdateActionKK 
(KK 
SymbolKK 
,KK  
ValuesKK! '
)KK' (
;KK( )
EnumsMM 
.MM 

SignalTypeMM 
RSI_PLMM #
;MM# $
EnumsNN 
.NN 

SignalTypeNN 
TSLNN  
;NN  !
EnumsOO 
.OO 

SignalTypeOO 
MBLOO  
;OO  !
EnumsPP 
.PP 

SignalTypePP 
VBPP 
;PP  
intRR 
Last_FastMARR 
=RR 
(RR 
intRR "
?RR" #
)RR# $
FastMARR$ *
.RR* +
LastRR+ /
(RR/ 0
)RR0 1
.RR1 2
SmaRR2 5
??RR6 8
$numRR9 :
;RR: ;
intSS 
Last_SlowMASS 
=SS 
(SS 
intSS "
?SS" #
)SS# $
SlowMASS$ *
.SS* +
LastSS+ /
(SS/ 0
)SS0 1
.SS1 2
SmaSS2 5
??SS6 8
$numSS9 :
;SS: ;
intTT 
Last_MiddleTT 
=TT 
(TT 
intTT "
?TT" #
)TT# $
MiddleVBTT$ ,
.TT, -
LastTT- 1
(TT1 2
)TT2 3
.TT3 4
ValueTT4 9
??TT: <
$numTT= >
;TT> ?
intUU 
Last_UpUU 
=UU 
(UU 
intUU 
?UU 
)UU  
UpVBUU  $
.UU$ %
LastUU% )
(UU) *
)UU* +
.UU+ ,
ValueUU, 1
??UU2 4
$numUU5 6
;UU6 7
ifWW 
(WW 
Last_FastMAWW 
>WW 
SettingsWW &
.WW& '
BotsSettingsWW' 3
.WW3 4
TDISettingsWW4 ?
.WW? @
RSIOverboughtLevetWW@ R
||WWS U
Last_FastMAWWV a
<WWb c
SettingsWWd l
.WWl m
BotsSettingsWWm y
.WWy z
TDISettings	WWz Ö
.
WWÖ Ü
RSIOversoldLevel
WWÜ ñ
)
WWñ ó
RSI_PL
WWò û
=
WWü †
Enums
WW° ¶
.
WW¶ ß

SignalType
WWß ±
.
WW± ≤
Exit
WW≤ ∂
;
WW∂ ∑
elseXX 
RSI_PLXX 
=XX 
Last_FastMAXX %
>XX& '
$numXX( *
?XX+ ,
EnumsXX- 2
.XX2 3

SignalTypeXX3 =
.XX= >
BuyXX> A
:XXB C
EnumsXXD I
.XXI J

SignalTypeXXJ T
.XXT U
SellXXU Y
;XXY Z
ifZZ 
(ZZ 
Last_FastMAZZ 
==ZZ 
Last_SlowMAZZ *
)ZZ* +
TSLZZ, /
=ZZ0 1
EnumsZZ2 7
.ZZ7 8

SignalTypeZZ8 B
.ZZB C
ExitZZC G
;ZZG H
else[[ 
TSL[[ 
=[[ 
Last_FastMA[[ "
>[[# $
Last_SlowMA[[% 0
?[[1 2
Enums[[3 8
.[[8 9

SignalType[[9 C
.[[C D
Buy[[D G
:[[H I
Enums[[J O
.[[O P

SignalType[[P Z
.[[Z [
Sell[[[ _
;[[_ `
if]] 
(]] 
Last_FastMA]] 
==]] 
Last_Middle]] *
)]]* +
MBL]], /
=]]0 1
Enums]]2 7
.]]7 8

SignalType]]8 B
.]]B C
Exit]]C G
;]]G H
else^^ 
MBL^^ 
=^^ 
Last_FastMA^^ "
>^^# $
Last_Middle^^% 0
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
Last_FastMA`` 
>`` 
Last_Up`` %
)``% &
VB``' )
=``* +
Enums``, 1
.``1 2

SignalType``2 <
.``< =
Exit``= A
;``A B
elseaa 
VBaa 
=aa 
Last_FastMAaa !
<aa" #
Last_Upaa$ +
?aa, -
Enumsaa. 3
.aa3 4

SignalTypeaa4 >
.aa> ?
Buyaa? B
:aaC D
EnumsaaE J
.aaJ K

SignalTypeaaK U
.aaU V
SellaaV Z
;aaZ [
ifcc 
(cc 
RSI_PLcc 
.cc 
	EqualsAllcc  
(cc  !
TSLcc! $
,cc$ %
MBLcc& )
,cc) *
VBcc+ -
)cc- .
)cc. /
{dd 
ifff 
(ff 
RSI_PLff 
.ff 
Equalsff !
(ff! "
LastSignalTypeff" 0
)ff0 1
)ff1 2
returnff3 9
;ff9 :
Taskhh 
.hh 
Runhh 
(hh 
(hh 
)hh 
=>hh 
SignalActionhh +
(hh+ ,
Symbolhh, 2
,hh2 3
RSI_PLhh4 :
)hh: ;
)hh; <
;hh< =
Consoleii 
.ii 
	WriteLineii !
(ii! "
$"ii" $
$strii$ 3
{ii3 4
Symbolii4 :
}ii: ;
$strii; ?
{ii? @
Enumii@ D
.iiD E
GetNameiiE L
(iiL M
typeofiiM S
(iiS T
EnumsiiT Y
.iiY Z

SignalTypeiiZ d
)iid e
,iie f
RSI_PLiig m
)iim n
}iin o
"iio p
)iip q
;iiq r
LastSignalTypejj 
=jj  
RSI_PLjj! '
;jj' (
}kk 
Consolemm 
.mm 
	WriteLinemm 
(mm 
$"mm  
{mm  !
Symbolmm! '
}mm' (
$strmm( 3
{mm3 4
Enummm4 8
.mm8 9
GetNamemm9 @
(mm@ A
typeofmmA G
(mmG H
EnumsmmH M
.mmM N

SignalTypemmN X
)mmX Y
,mmY Z
RSI_PLmm[ a
)mma b
}mmb c
$strmmc n
{mmn o
Enummmo s
.mms t
GetNamemmt {
(mm{ |
typeof	mm| Ç
(
mmÇ É
Enums
mmÉ à
.
mmà â

SignalType
mmâ ì
)
mmì î
,
mmî ï
TSL
mmñ ô
)
mmô ö
}
mmö õ
$str
mmõ ¶
{
mm¶ ß
Enum
mmß ´
.
mm´ ¨
GetName
mm¨ ≥
(
mm≥ ¥
typeof
mm¥ ∫
(
mm∫ ª
Enums
mmª ¿
.
mm¿ ¡

SignalType
mm¡ À
)
mmÀ Ã
,
mmÃ Õ
MBL
mmŒ —
)
mm— “
}
mm“ ”
$str
mm” ›
{
mm› ﬁ
Enum
mmﬁ ‚
.
mm‚ „
GetName
mm„ Í
(
mmÍ Î
typeof
mmÎ Ò
(
mmÒ Ú
Enums
mmÚ ˜
.
mm˜ ¯

SignalType
mm¯ Ç
)
mmÇ É
,
mmÉ Ñ
VB
mmÖ á
)
mmá à
}
mmà â
"
mmâ ä
)
mmä ã
;
mmã å
}nn 	
}oo 
}pp Ù
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
}## Á0
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
;  
public 
string 
Symbol 
{ 
get "
;" #
set$ '
;' (
}) *
public 
KlineInterval 
Interval %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
private 
Enums 
. 
SubscriptionType &
SubscriptionType' 7
{8 9
get: =
;= >
set? B
;B C
}D E
public 
Action 
< 
string 
, 
Enums #
.# $

SignalType$ .
>. /
SignalAction0 <
{= >
get? B
;B C
setD G
;G H
}I J
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
>> ?
UpdateAction@ L
{M N
getO R
;R S
setT W
;W X
}Y Z
public 
KlineSubscription  
?  !
Subscription" .
{/ 0
get1 4
;4 5
set6 9
;9 :
}; <
public 

TickAction 
? 

TickAction %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public 

Dictionary 
< 
string  
,  !
List" &
<& '
object' -
>- .
>. /
?/ 0
Values1 7
{8 9
get: =
;= >
set? B
;B C
}D E
public 
void 
Dispose 
( 
) 
{ 	
Dispose 
( 
true 
) 
; 
GC 
. 
SuppressFinalize 
(  
this  $
)$ %
;% &
} 	
	protected 
virtual 
void 
Dispose &
(& '
bool' +
	disposing, 5
)5 6
{ 	
if 
( 

isDisposed 
) 
return "
;" #
if!! 
(!! 
Subscription!! 
==!! 
null!!  $
)!!$ %
return!!& ,
;!!, -

TickAction"" 
?"" 
func"" 
="" 
Subscription"" +
.""+ ,
Actions"", 3
.""3 4
First""4 9
(""9 :
x"": ;
=>""< >
x""? @
.""@ A
Creator""A H
==""I K
this""L P
)""P Q
;""Q R
Subscription## 
.## 
Actions##  
.##  !
Remove##! '
(##' (
func##( ,
)##, -
;##- .

isDisposed%% 
=%% 
true%% 
;%% 
}&& 	
	protected(( 
	Indicator(( 
((( 
string(( "
symbol((# )
,(() *
KlineInterval((+ 8
interval((9 A
,((A B
Enums((C H
.((H I
SubscriptionType((I Y
subscriptionType((Z j
,((j k
Action((l r
<((r s
string((s y
,((y z
Enums	(({ Ä
.
((Ä Å

SignalType
((Å ã
>
((ã å
signalAction
((ç ô
,
((ô ö
Action
((õ °
<
((° ¢
string
((¢ ®
,
((® ©

Dictionary
((™ ¥
<
((¥ µ
string
((µ ª
,
((ª º
List
((Ω ¡
<
((¡ ¬
object
((¬ »
>
((» …
>
((…  
>
((  À
updateAction
((Ã ÿ
)
((ÿ Ÿ
{)) 	
if** 
(** 
!** 
StaticBinance** 
.** 
Client** %
.**% &
SpotApi**& -
.**- .
ExchangeData**. :
.**: ; 
GetExchangeInfoAsync**; O
(**O P
)**P Q
.**Q R
Result**R X
.**X Y
Data**Y ]
.**] ^
Symbols**^ e
.**e f
Any**f i
(**i j
x**j k
=>**l n
x**o p
.**p q
Name**q u
==**v x
symbol**y 
)	** Ä
)
**Ä Å
{++ 
throw,, 
new,, 

Exceptions,, $
.,,$ %#
SymbolNotFoundException,,% <
(,,< =
$str,,= [
),,[ \
;,,\ ]
}-- 
Symbol// 
=// 
symbol// 
;// 
SubscriptionType00 
=00 
subscriptionType00 /
;00/ 0
Interval11 
=11 
interval11 
;11  
SignalAction22 
=22 
signalAction22 '
;22' (
UpdateAction33 
=33 
updateAction33 '
;33' (
}44 	
public66 
void66 
	Subscribe66 
(66 
)66 
{77 	
if88 
(88 

TickAction88 
==88 
null88 "
)88" #
return88$ *
;88* +
Subscription99 
=99 
StaticBinance99 (
.99( )(
SubscribeToKlineUpdatesAsync99) E
(99E F
SubscriptionType::  
,::  !
Symbol;; 
,;; 
Interval<< 
,<< 

TickAction== 
)== 
;== 
}>> 	
}?? 
}@@ Á
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
} í
pC:\Users\√ñmer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\MVVM\DelegateCommand.cs
	namespace 	
	WpfClient
 
. 
MVVM 
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
} ™	
qC:\Users\√ñmer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\MVVM\ObservableObject.cs
	namespace 	
	WpfClient
 
. 
MVVM 
{ 
public 

class 
ObservableObject !
:" #"
INotifyPropertyChanged$ :
{ 
public 
event '
PropertyChangedEventHandler 0
?0 1
PropertyChanged2 A
;A B
public		 
void		 %
RaisePropertyChangedEvent		 -
(		- .
params		. 4
string		5 ;
[		; <
]		< =
propertyNames		> K
)		K L
{

 	
foreach 
( 
string 
? 
propertyName )
in* ,
propertyNames- :
): ;
{ 
PropertyChanged 
?  
.  !
Invoke! '
(' (
this( ,
,, -
new. 1$
PropertyChangedEventArgs2 J
(J K
propertyNameK W
)W X
)X Y
;Y Z
} 
} 	
} 
} ±C
vC:\Users\√ñmer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\NewsBot\CryptopanicNewsBot.cs
	namespace 	!
EASYTelegramSignalBot
 
.  
NewsBot  '
{ 
public 

class 
CryptopanicNewsBot #
{ 
private 
string 
ApiUrl 
{ 
get  #
;# $
set% (
;( )
}* +
private 
DispatcherTimer 
Timer  %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
private 
int 
? 

LastNewsId 
{  !
get" %
;% &
set' *
;* +
}, -
public 
CryptopanicNewsBot !
(! "
)" #
{ 	
ApiUrl 
= 
$" 
$str H
{H I
SettingsI Q
.Q R
BotsSettingsR ^
.^ _
NewsSettings_ k
.k l
Keyl o
}o p
"p q
;q r
Timer 
= 
new 
( 
) 
; 
Timer 
. 
Tick 
+= 
( 
object !
?! "
sender# )
,) *
	EventArgs+ 4
e5 6
)6 7
=>8 :
{ 

UpdateNews 
( 
) 
; 
} 
; 
Timer 
. 
Interval 
= 
TimeSpan %
.% &
FromSeconds& 1
(1 2
Settings2 :
.: ;
BotsSettings; G
.G H
NewsSettingsH T
.T U
IntervalU ]
)] ^
;^ _
Timer 
. 
Start 
( 
) 
; 
Console 
. 
	WriteLine 
( 
$str <
)< =
;= >
} 	
private!! 
async!! 
Task!! 

UpdateNews!! %
(!!% &
)!!& '
{"" 	
Console## 
.## 
	WriteLine## 
(## 
$str## K
)##K L
;##L M
Response$$ 
?$$ 
newNews$$ 
=$$ 
GetNews$$  '
($$' (
)$$( )
.$$) *
Result$$* 0
;$$0 1
if&& 
(&& 

LastNewsId&& 
==&& 
null&& "
)&&" #

LastNewsId&&$ .
=&&/ 0
newNews&&1 8
?&&8 9
.&&9 :
results&&: A
[&&A B
$num&&B C
]&&C D
.&&D E
id&&E G
;&&G H
if'' 
('' 
newNews'' 
=='' 
null'' 
||''  "
newNews''# *
.''* +
results''+ 2
[''2 3
$num''3 4
]''4 5
.''5 6
id''6 8
==''9 ;

LastNewsId''< F
)''F G
return''H N
;''N O
var)) 
translatedTitle)) 
=))  !
	Translate))" +
.))+ ,
TranslateText)), 9
())9 :
$str)): >
,))> ?
$str))@ D
,))D E
newNews))F M
.))M N
results))N U
[))U V
$num))V W
]))W X
.))X Y
title))Y ^
)))^ _
.))_ `
Result))` f
;))f g
if++ 
(++ 
string++ 
.++ 
IsNullOrEmpty++ $
(++$ %
translatedTitle++% 4
)++4 5
)++5 6
return++7 =
;++= >
string,, 
message,, 
=,, 
Settings,, %
.,,% &
BotsSettings,,& 2
.,,2 3
NewsSettings,,3 ?
.,,? @
Message,,@ G
.,,G H
Replace,,H O
(,,O P
$str,,P Y
,,,Y Z
translatedTitle,,[ j
),,j k
.,,k l
Replace,,l s
(,,s t
$str,,t |
,,,| }
newNews	,,~ Ö
.
,,Ö Ü
results
,,Ü ç
[
,,ç é
$num
,,é è
]
,,è ê
.
,,ê ë
url
,,ë î
)
,,î ï
.
,,ï ñ
Replace
,,ñ ù
(
,,ù û
$str
,,û ß
,
,,ß ®
string
,,© Ø
.
,,Ø ∞
Join
,,∞ ¥
(
,,¥ µ
$str
,,µ π
,
,,π ∫
newNews
,,ª ¬
.
,,¬ √
results
,,√  
[
,,  À
$num
,,À Ã
]
,,Ã Õ
.
,,Õ Œ

currencies
,,Œ ÿ
)
,,ÿ Ÿ
)
,,Ÿ ⁄
;
,,⁄ €
SendMessages.. 
(.. 
message..  
)..  !
;..! "
Console// 
.// 
	WriteLine// 
(// 
$str// I
)//I J
;//J K
}00 	
private22 
static22 
void22 
SendMessages22 (
(22( )
string22) /
message220 7
)227 8
{33 	
foreach44 
(44 
User44 
user44 
in44 !
Database44" *
.44* +

Connection44+ 5
.445 6
Context446 =
.44= >
Users44> C
)44C D
{55 
try66 
{77 
if88 
(88 
user88 
.88 
ChatId88 #
==88$ &
$num88' (
||88) +
!88, -
user88- 1
.881 2
News882 6
)886 7
continue888 @
;88@ A

BotClients99 
.99 

NewsClient99 )
.99) * 
SendTextMessageAsync99* >
(99> ?
user99? C
.99C D
ChatId99D J
,99J K
message99L S
)99S T
;99T U
}:: 
catch;; 
(;; 
	Exception;;  
ex;;! #
);;# $
{<< 
Console== 
.== 
	WriteLine== %
(==% &
$"==& (
$str==( 9
{==9 :
user==: >
.==> ?
Username==? G
}==G H
$str==H c
{==c d
ex==d f
.==f g
Message==g n
}==n o
"==o p
)==p q
;==q r
}>> 
}@@ 
foreachBB 
(BB 
stringBB 
?BB 
groupBB "
inBB# %
SettingsBB& .
.BB. /
TelegramSettingsBB/ ?
.BB? @
	TDIGroupsBB@ I
)BBI J
{CC 
tryDD 
{EE 

BotClientsFF 
.FF 

NewsClientFF )
.FF) * 
SendTextMessageAsyncFF* >
(FF> ?
groupFF? D
,FFD E
messageFFF M
)FFM N
;FFN O
}GG 
catchHH 
(HH 
	ExceptionHH  
exHH! #
)HH# $
{II 
ConsoleJJ 
.JJ 
	WriteLineJJ %
(JJ% &
$"JJ& (
$strJJ( 8
{JJ8 9
groupJJ9 >
}JJ> ?
$strJJ? Z
{JJZ [
exJJ[ ]
.JJ] ^
MessageJJ^ e
}JJe f
"JJf g
)JJg h
;JJh i
}KK 
}LL 
}MM 	
privateOO 
asyncOO 
TaskOO 
<OO 
ResponseOO #
?OO# $
>OO$ %
GetNewsOO& -
(OO- .
)OO. /
{PP 	
tryQQ 
{RR 
stringSS 
newsDataSS 
=SS  !
awaitSS" '
RequestSS( /
.SS/ 0
GetSS0 3
(SS3 4
ApiUrlSS4 :
)SS: ;
;SS; <
ResponseTT 
?TT 
newsTT 
=TT  
JsonConvertTT! ,
.TT, -
DeserializeObjectTT- >
<TT> ?
ResponseTT? G
>TTG H
(TTH I
newsDataTTI Q
)TTQ R
;TTR S
returnUU 
newsUU 
;UU 
}VV 
catchWW 
(WW 
	ExceptionWW 
exWW 
)WW  
{XX 
ConsoleYY 
.YY 
	WriteLineYY !
(YY! "
$"YY" $
$strYY$ ?
{YY? @
exYY@ B
.YYB C
MessageYYC J
}YYJ K
"YYK L
)YYL M
;YYM N
returnZZ 
nullZZ 
;ZZ 
}[[ 
}\\ 	
}]] 
}^^ Õ
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
using 
var 
client 
= 
new "

HttpClient# -
(- .
). /
;/ 0
var 
postData 
= 
new 
StringContent ,
(, -
data- 1
,1 2
Encoding3 ;
.; <
UTF8< @
,@ A
$strB T
)T U
;U V
var 
response 
= 
await  
client! '
.' (
	PostAsync( 1
(1 2
url2 5
,5 6
postData7 ?
)? @
;@ A
var 
result 
= 
await 
response '
.' (
Content( /
./ 0
ReadAsStringAsync0 A
(A B
)B C
;C D
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
using 
var 
client 
= 
new "

HttpClient# -
(- .
). /
;/ 0
var 
content 
= 
await 
client  &
.& '
GetStringAsync' 5
(5 6
url6 9
)9 :
;: ;
return 
content 
; 
} 	
} 
} ¥
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
 	
var 
client 
= 
new 

HttpClient '
(' (
)( )
;) *
try 
{ 
var 
result 
= 
await "
client# )
.) *
GetAsync* 2
(2 3
new3 6
Uri7 :
(: ;
$str; 
+
Ä Å
from
Ç Ü
+
á à
$str
â è
+
ê ë
to
í î
+
ï ñ
$str
ó °
+
¢ £
data
§ ®
)
® ©
)
© ™
;
™ ´
string 
[ 
] 
json 
= 
result  &
.& '
Content' .
.. /
ToString/ 7
(7 8
)8 9
.9 :
Split: ?
(? @
$char@ C
)C D
;D E
var 
translatedText "
=# $
json% )
[) *
$num* +
]+ ,
;, -
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
}99 ƒ?
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
> 
GeneralGroups )
{* +
get, /
;/ 0
set1 4
;4 5
}6 7
public 
string 

GeneralBot  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
List 
< 
string 
> 
	TDIGroups %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public 
string 
TDIBot 
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
public## 
Generalsettings## 
GeneralSettings## .
{##/ 0
get##1 4
;##4 5
set##6 9
;##9 :
}##; <
public$$ 
Tdisettings$$ 
TDISettings$$ &
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
class)) 
Generalsettings))  
{** 
}++ 
public-- 

class-- 
Newssettings-- 
{.. 
public// 
string// 
Key// 
{// 
get// 
;//  
set//! $
;//$ %
}//& '
public00 
int00 
Interval00 
{00 
get00 !
;00! "
set00# &
;00& '
}00( )
public11 
string11 
Message11 
{11 
get11  #
;11# $
set11% (
;11( )
}11* +
}22 
public44 

class44 
Tdisettings44 
{55 
public66 
List66 
<66 
string66 
>66 
Symbols66 #
{66$ %
get66& )
;66) *
set66+ .
;66. /
}660 1
public77 
Tdisignalmessages77  
SignalMessages77! /
{770 1
get772 5
;775 6
set777 :
;77: ;
}77< =
public88 
int88 
	RSIPeriot88 
{88 
get88 "
;88" #
set88$ '
;88' (
}88) *
public99 
int99 
VotalityBandPeriot99 %
{99& '
get99( +
;99+ ,
set99- 0
;990 1
}992 3
public:: 
int:: 
RSIPLPeriot:: 
{::  
get::! $
;::$ %
set::& )
;::) *
}::+ ,
public;; 
int;; 
	TSLPeriot;; 
{;; 
get;; "
;;;" #
set;;$ '
;;;' (
};;) *
public<< 
int<< 
RSIOversoldLevel<< #
{<<$ %
get<<& )
;<<) *
set<<+ .
;<<. /
}<<0 1
public== 
int== 
RSIOverboughtLevet== %
{==& '
get==( +
;==+ ,
set==- 0
;==0 1
}==2 3
}>> 
public@@ 

class@@ 
Rsisettings@@ 
{AA 
publicBB 
ListBB 
<BB 
stringBB 
>BB 
SymbolsBB #
{BB$ %
getBB& )
;BB) *
setBB+ .
;BB. /
}BB0 1
publicCC 
RsisignalmessagesCC  
SignalMessagesCC! /
{CC0 1
getCC2 5
;CC5 6
setCC7 :
;CC: ;
}CC< =
publicDD 
intDD 
	RSIPeriotDD 
{DD 
getDD "
;DD" #
setDD$ '
;DD' (
}DD) *
publicEE 
intEE 
RSIOversoldLevelEE #
{EE$ %
getEE& )
;EE) *
setEE+ .
;EE. /
}EE0 1
publicFF 
intFF 
RSIOverboughtLevetFF %
{FF& '
getFF( +
;FF+ ,
setFF- 0
;FF0 1
}FF2 3
}GG 
publicII 

classII 
TdisignalmessagesII "
{JJ 
publicKK 
stringKK 
BuyKK 
{KK 
getKK 
;KK  
setKK! $
;KK$ %
}KK& '
publicLL 
stringLL 
SellLL 
{LL 
getLL  
;LL  !
setLL" %
;LL% &
}LL' (
publicMM 
stringMM 
ExitMM 
{MM 
getMM  
;MM  !
setMM" %
;MM% &
}MM' (
}NN 
publicPP 

classPP 
RsisignalmessagesPP "
{QQ 
publicRR 
stringRR 

OverboughtRR  
{RR! "
getRR# &
;RR& '
setRR( +
;RR+ ,
}RR- .
publicSS 
stringSS 
OversoldSS 
{SS  
getSS! $
;SS$ %
setSS& )
;SS) *
}SS+ ,
publicTT 
stringTT 
BetweenLevelsTT #
{TT$ %
getTT& )
;TT) *
setTT+ .
;TT. /
}TT0 1
}UU 
}WW ª 
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
}99 à$
oC:\Users\√ñmer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\Telegram\BotClients.cs
	namespace 	!
EASYTelegramSignalBot
 
.  
Telegram  (
{ 
public		 

static		 
class		 

BotClients		 "
{

 
private 
static #
CancellationTokenSource .
CancelToken/ :
{; <
get= @
;@ A
setB E
;E F
}G H
public 
static 
TelegramBotClient '
	TDIClient( 1
{2 3
get4 7
;7 8
set9 <
;< =
}> ?
public 
static 
TelegramBotClient '
	RSIClient( 1
{2 3
get4 7
;7 8
set9 <
;< =
}> ?
public 
static 
TelegramBotClient '

NewsClient( 2
{3 4
get5 8
;8 9
set: =
;= >
}? @
public 
static 
TelegramBotClient '
GeneralClient( 5
{6 7
get8 ;
;; <
set= @
;@ A
}B C
public 
static 
void 
StartBotClients *
(* +
)+ ,
{ 	
	TDIClient 
= 
new 
( 
Settings $
.$ %
TelegramSettings% 5
.5 6
TDIBot6 <
)< =
;= >
	RSIClient 
= 
new 
( 
Settings $
.$ %
TelegramSettings% 5
.5 6
RSIBot6 <
)< =
;= >

NewsClient 
= 
new 
( 
Settings %
.% &
TelegramSettings& 6
.6 7
NewsBot7 >
)> ?
;? @
CancelToken 
= 
new #
CancellationTokenSource 5
(5 6
)6 7
;7 8
ReceiverOptions 
? 
receiverOptions ,
=- .
new/ 2
ReceiverOptions3 B
(B C
)C D
{ 
AllowedUpdates 
=  
Array! &
.& '
Empty' ,
<, -

UpdateType- 7
>7 8
(8 9
)9 :
,: ;
ThrowPendingUpdates #
=$ %
true& *
} 
; 
	TDIClient 
. 
StartReceiving $
($ %
updateHandler% 2
:2 3
TDIUpdateHandlers4 E
.E F
HandleUpdateAsyncF W
,W X
pollingErrorHandler 2
:2 3
TDIUpdateHandlers4 E
.E F
PollingErrorHandlerF Y
,Y Z
receiverOptions   .
:  . /
receiverOptions  0 ?
,  ? @
cancellationToken!! 0
:!!0 1
CancelToken!!2 =
.!!= >
Token!!> C
)!!C D
;!!D E
	RSIClient## 
.## 
StartReceiving## $
(##$ %
updateHandler##% 2
:##2 3
RSIUpdateHandlers##4 E
.##E F
HandleUpdateAsync##F W
,##W X
pollingErrorHandler$$ &
:$$& '
RSIUpdateHandlers$$( 9
.$$9 :
PollingErrorHandler$$: M
,$$M N
receiverOptions%% "
:%%" #
receiverOptions%%$ 3
,%%3 4
cancellationToken&& $
:&&$ %
CancelToken&&& 1
.&&1 2
Token&&2 7
)&&7 8
;&&8 9

NewsClient(( 
.(( 
StartReceiving(( %
(((% &
updateHandler((& 3
:((3 4
NewsUpdateHandlers((5 G
.((G H
HandleUpdateAsync((H Y
,((Y Z
pollingErrorHandler)) &
:))& '
NewsUpdateHandlers))( :
.)): ;
PollingErrorHandler)); N
,))N O
receiverOptions** "
:**" #
receiverOptions**$ 3
,**3 4
cancellationToken++ $
:++$ %
CancelToken++& 1
.++1 2
Token++2 7
)++7 8
;++8 9
GeneralClient-- 
=-- 
new-- 
(--  
Settings--  (
.--( )
TelegramSettings--) 9
.--9 :

GeneralBot--: D
)--D E
;--E F
}.. 	
}// 
}00 Á:
wC:\Users\√ñmer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\Telegram\NewsUpdateHandlers.cs
	namespace 	!
EASYTelegramSignalBot
 
.  
Telegram  (
{ 
public 

static 
class 
NewsUpdateHandlers *
{ 
public 
static 
Task 
PollingErrorHandler .
(. /
ITelegramBotClient/ A
	botClientB K
,K L
	ExceptionM V
	exceptionW `
,` a
CancellationTokenb s
cancellationToken	t Ö
)
Ö Ü
{ 	
string 
? 
ErrorMessage  
=! "
	exception# ,
switch- 3
{ 
ApiRequestException #
apiRequestException$ 7
=>8 :
$"; =
$str= S
{S T
apiRequestExceptionT g
.g h
	ErrorCodeh q
}q r
$strr u
{u v 
apiRequestException	v â
.
â ä
Message
ä ë
}
ë í
"
í ì
,
ì î
_ 
=> 
	exception 
. 
ToString '
(' (
)( )
} 
; 
Console 
. 
	WriteLine 
( 
ErrorMessage *
)* +
;+ ,
return 
Task 
. 
CompletedTask %
;% &
} 	
public 
static 
async 
Task  
HandleUpdateAsync! 2
(2 3
ITelegramBotClient3 E
	botClientF O
,O P
UpdateQ W
updateX ^
,^ _
CancellationToken` q
cancellationToken	r É
)
É Ñ
{ 	
Task 
? 
handler 
= 
update "
." #
Type# '
switch( .
{ 

UpdateType   
.   
Message   "
=>  # % 
BotOnMessageReceived  & :
(  : ;
	botClient  ; D
,  D E
update  F L
.  L M
Message  M T
!  T U
)  U V
,  V W
}!! 
;!! 
try## 
{$$ 
await%% 
handler%% 
;%% 
}&& 
catch'' 
('' 
	Exception'' 
	exception'' &
)''& '
{(( 
await)) 
PollingErrorHandler)) )
())) *
	botClient))* 3
,))3 4
	exception))5 >
,))> ?
cancellationToken))@ Q
)))Q R
;))R S
}** 
}++ 	
private.. 
static.. 
Task..  
BotOnMessageReceived.. 0
(..0 1
ITelegramBotClient..1 C
	botClient..D M
,..M N
Message..O V
message..W ^
)..^ _
{// 	
if00 
(00 
message00 
.00 
Text00 
is00 
not00  #
{00$ %
}00& '
messageText00( 3
)003 4
return11 
Task11 
.11 
Delay11 !
(11! "
$num11" #
)11# $
;11$ %
if33 
(33 
messageText33 
==33 
$str33 '
)33' (
DefaultMessage33) 7
(337 8
	botClient338 A
,33A B
message33C J
)33J K
.33K L
	WaitAsync33L U
(33U V
new33V Y
TimeSpan33Z b
(33b c
$num33c d
,33d e
$num33f g
,33g h
$num33i j
)33j k
)33k l
;33l m
return55 
Task55 
.55 
Delay55 
(55 
$num55 
)55  
;55  !
}66 	
private99 
static99 
async99 
Task99 !
DefaultMessage99" 0
(990 1
ITelegramBotClient991 C
	botClient99D M
,99M N
Message99O V
message99W ^
)99^ _
{:: 	
string;; 
text;; 
=;; 
$str;; )
;;;) *
if<< 
(<< 
string<< 
.<< 
IsNullOrEmpty<< $
(<<$ %
message<<% ,
.<<, -
Chat<<- 1
.<<1 2
Username<<2 :
)<<: ;
)<<; <
{== 
text>> 
=>> 
$str	>> Ç
;
>>Ç É
}?? 
else@@ 
if@@ 
(@@ 

Connection@@ 
.@@  
Context@@  '
.@@' (
Users@@( -
.@@- .
Any@@. 1
(@@1 2
x@@2 3
=>@@4 6
x@@7 8
.@@8 9
Username@@9 A
==@@B D
message@@E L
.@@L M
Chat@@M Q
.@@Q R
Username@@R Z
)@@Z [
)@@[ \
{AA 
DatabaseBB 
.BB 
ModelsBB 
.BB  
UserBB  $
?BB$ %
userBB& *
=BB+ ,

ConnectionBB- 7
.BB7 8
ContextBB8 ?
.BB? @
UsersBB@ E
.BBE F
WhereBBF K
(BBK L
xBBL M
=>BBN P
xBBQ R
.BBR S
UsernameBBS [
==BB\ ^
messageBB_ f
.BBf g
ChatBBg k
.BBk l
UsernameBBl t
)BBt u
.BBu v
FirstBBv {
(BB{ |
)BB| }
;BB} ~
ifDD 
(DD 
userDD 
.DD 
ChatIdDD 
==DD  "
$numDD# $
)DD$ %
{EE 
userFF 
.FF 
ChatIdFF 
=FF  !
messageFF" )
.FF) *
ChatFF* .
.FF. /
IdFF/ 1
;FF1 2

ConnectionGG 
.GG 
ContextGG &
.GG& '
SaveChangesGG' 2
(GG2 3
)GG3 4
;GG4 5
}HH 
ifJJ 
(JJ 
userJJ 
.JJ 
NewsExpiryDateJJ '
<JJ( )
DateTimeJJ* 2
.JJ2 3
NowJJ3 6
)JJ6 7
{KK 
textLL 
+=LL 
$"LL 
$strLL =
"LL= >
;LL> ?
userMM 
.MM 
NewsMM 
=MM 
falseMM  %
;MM% &

ConnectionNN 
.NN 
ContextNN &
.NN& '
SaveChangesNN' 2
(NN2 3
)NN3 4
;NN4 5
returnOO 
;OO 
}PP 
textRR 
+=RR 
$"RR 
$strRR =
{RR= >
userRR> B
.RRB C
NewsExpiryDateRRC Q
}RRQ R
$strRRR T
"RRT U
;RRU V
}TT 
elseUU 
{VV 
textWW 
=WW 
$strWW T
;WWT U
}XX 
awaitZZ 
	botClientZZ 
.ZZ  
SendTextMessageAsyncZZ 0
(ZZ0 1
chatIdZZ1 7
:ZZ7 8
messageZZ9 @
.ZZ@ A
ChatZZA E
.ZZE F
IdZZF H
,ZZH I
	parseModeZZJ S
:ZZS T
	ParseModeZZU ^
.ZZ^ _
MarkdownZZ_ g
,ZZg h
text[[8 <
:[[< =
text[[> B
)[[B C
;[[C D
}\\ 	
}]] 
}^^ ä6
vC:\Users\√ñmer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\Telegram\RSIUpdateHandlers.cs
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
{ 
public 

static 
class 
RSIUpdateHandlers )
{ 
public 
static 
Task 
PollingErrorHandler .
(. /
ITelegramBotClient/ A
	botClientB K
,K L
	ExceptionM V
	exceptionW `
,` a
CancellationTokenb s
cancellationToken	t Ö
)
Ö Ü
{ 	
string 
? 
ErrorMessage  
=! "
	exception# ,
switch- 3
{ 
ApiRequestException #
apiRequestException$ 7
=>8 :
$"; =
$str= S
{S T
apiRequestExceptionT g
.g h
	ErrorCodeh q
}q r
$strr u
{u v 
apiRequestException	v â
.
â ä
Message
ä ë
}
ë í
"
í ì
,
ì î
_ 
=> 
	exception 
. 
ToString '
(' (
)( )
} 
; 
Console 
. 
	WriteLine 
( 
ErrorMessage *
)* +
;+ ,
return 
Task 
. 
CompletedTask %
;% &
} 	
public 
static 
async 
Task  
HandleUpdateAsync! 2
(2 3
ITelegramBotClient3 E
	botClientF O
,O P
UpdateQ W
updateX ^
,^ _
CancellationToken` q
cancellationToken	r É
)
É Ñ
{ 	
Task 
? 
handler 
= 
update "
." #
Type# '
switch( .
{ 

UpdateType 
. 
Message "
=># % 
BotOnMessageReceived& :
(: ;
	botClient; D
,D E
updateF L
.L M
MessageM T
!T U
)U V
,V W
}   
;   
try"" 
{## 
await$$ 
handler$$ 
;$$ 
}%% 
catch&& 
(&& 
	Exception&& 
	exception&& &
)&&& '
{'' 
await(( 
PollingErrorHandler(( )
((() *
	botClient((* 3
,((3 4
	exception((5 >
,((> ?
cancellationToken((@ Q
)((Q R
;((R S
})) 
}** 	
private-- 
static-- 
Task--  
BotOnMessageReceived-- 0
(--0 1
ITelegramBotClient--1 C
	botClient--D M
,--M N
Message--O V
message--W ^
)--^ _
{.. 	
if// 
(// 
message// 
.// 
Text// 
is// 
not//  #
{//$ %
}//& '
messageText//( 3
)//3 4
return00 
Task00 
.00 
Delay00 !
(00! "
$num00" #
)00# $
;00$ %
if22 
(22 
messageText22 
==22 
$str22 '
)22' (
DefaultMessage22) 7
(227 8
	botClient228 A
,22A B
message22C J
)22J K
.22K L
	WaitAsync22L U
(22U V
new22V Y
TimeSpan22Z b
(22b c
$num22c d
,22d e
$num22f g
,22g h
$num22i j
)22j k
)22k l
;22l m
return44 
Task44 
.44 
Delay44 
(44 
$num44 
)44  
;44  !
}55 	
private88 
static88 
async88 
Task88 !
DefaultMessage88" 0
(880 1
ITelegramBotClient881 C
	botClient88D M
,88M N
Message88O V
message88W ^
)88^ _
{99 	
string:: 
text:: 
=:: 
$str:: )
;::) *
if;; 
(;; 
string;; 
.;; 
IsNullOrEmpty;; $
(;;$ %
message;;% ,
.;;, -
Chat;;- 1
.;;1 2
Username;;2 :
);;: ;
);;; <
{<< 
text== 
=== 
$str	== Ç
;
==Ç É
}>> 
else?? 
if?? 
(?? 
Database?? 
.?? 

Connection?? (
.??( )
Context??) 0
.??0 1
Users??1 6
.??6 7
Any??7 :
(??: ;
x??; <
=>??= ?
x??@ A
.??A B
Username??B J
==??K M
message??N U
.??U V
Chat??V Z
.??Z [
Username??[ c
)??c d
)??d e
{@@ 
DatabaseAA 
.AA 
ModelsAA 
.AA  
UserAA  $
?AA$ %
userAA& *
=AA+ ,
DatabaseAA- 5
.AA5 6

ConnectionAA6 @
.AA@ A
ContextAAA H
.AAH I
UsersAAI N
.AAN O
WhereAAO T
(AAT U
xAAU V
=>AAW Y
xAAZ [
.AA[ \
UsernameAA\ d
==AAe g
messageAAh o
.AAo p
ChatAAp t
.AAt u
UsernameAAu }
)AA} ~
.AA~ 
First	AA Ñ
(
AAÑ Ö
)
AAÖ Ü
;
AAÜ á
ifCC 
(CC 
userCC 
.CC 
ChatIdCC 
==CC  "
$numCC# $
)CC$ %
{DD 
userEE 
.EE 
ChatIdEE 
=EE  !
messageEE" )
.EE) *
ChatEE* .
.EE. /
IdEE/ 1
;EE1 2
DatabaseFF 
.FF 

ConnectionFF '
.FF' (
ContextFF( /
.FF/ 0
SaveChangesFF0 ;
(FF; <
)FF< =
;FF= >
}GG 
textII 
+=II 
$str	II Ç
;
IIÇ É
}JJ 
elseKK 
{LL 
textMM 
=MM 
$strMM T
;MMT U
}NN 
awaitPP 
	botClientPP 
.PP  
SendTextMessageAsyncPP 0
(PP0 1
chatIdPP1 7
:PP7 8
messagePP9 @
.PP@ A
ChatPPA E
.PPE F
IdPPF H
,PPH I
	parseModePPJ S
:PPS T
	ParseModePPU ^
.PP^ _
MarkdownPP_ g
,PPg h
textQQ8 <
:QQ< =
textQQ> B
)QQB C
;QQC D
}RR 	
}SS 
}TT Á>
vC:\Users\√ñmer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\Telegram\TDIUpdateHandlers.cs
	namespace 	!
EASYTelegramSignalBot
 
.  
Telegram  (
{ 
public 

static 
class 
TDIUpdateHandlers )
{ 
public 
static 
Task 
PollingErrorHandler .
(. /
ITelegramBotClient/ A
	botClientB K
,K L
	ExceptionM V
	exceptionW `
,` a
CancellationTokenb s
cancellationToken	t Ö
)
Ö Ü
{ 	
string 
? 
ErrorMessage  
=! "
	exception# ,
switch- 3
{ 
ApiRequestException #
apiRequestException$ 7
=>8 :
$"; =
$str= S
{S T
apiRequestExceptionT g
.g h
	ErrorCodeh q
}q r
$strr u
{u v 
apiRequestException	v â
.
â ä
Message
ä ë
}
ë í
"
í ì
,
ì î
_ 
=> 
	exception 
. 
ToString '
(' (
)( )
} 
; 
Console 
. 
	WriteLine 
( 
ErrorMessage *
)* +
;+ ,
return 
Task 
. 
CompletedTask %
;% &
} 	
public 
static 
async 
Task  
HandleUpdateAsync! 2
(2 3
ITelegramBotClient3 E
	botClientF O
,O P
UpdateQ W
updateX ^
,^ _
CancellationToken` q
cancellationToken	r É
)
É Ñ
{ 	
Task 
? 
handler 
= 
update "
." #
Type# '
switch( .
{ 

UpdateType   
.   
Message   "
=>  # % 
BotOnMessageReceived  & :
(  : ;
	botClient  ; D
,  D E
update  F L
.  L M
Message  M T
!  T U
)  U V
,  V W
}!! 
;!! 
try## 
{$$ 
await%% 
handler%% 
;%% 
}&& 
catch'' 
('' 
	Exception'' 
	exception'' &
)''& '
{(( 
await)) 
PollingErrorHandler)) )
())) *
	botClient))* 3
,))3 4
	exception))5 >
,))> ?
cancellationToken))@ Q
)))Q R
;))R S
}** 
}++ 	
private.. 
static.. 
Task..  
BotOnMessageReceived.. 0
(..0 1
ITelegramBotClient..1 C
	botClient..D M
,..M N
Message..O V
message..W ^
)..^ _
{// 	
if00 
(00 
message00 
.00 
Text00 
is00 
not00  #
{00$ %
}00& '
messageText00( 3
)003 4
return11 
Task11 
.11 
Delay11 !
(11! "
$num11" #
)11# $
;11$ %
if33 
(33 
messageText33 
==33 
$str33 '
)33' (
DefaultMessage33) 7
(337 8
	botClient338 A
,33A B
message33C J
)33J K
.33K L
	WaitAsync33L U
(33U V
new33V Y
TimeSpan33Z b
(33b c
$num33c d
,33d e
$num33f g
,33g h
$num33i j
)33j k
)33k l
;33l m
return55 
Task55 
.55 
Delay55 
(55 
$num55 
)55  
;55  !
}66 	
private99 
static99 
async99 
Task99 !
DefaultMessage99" 0
(990 1
ITelegramBotClient991 C
	botClient99D M
,99M N
Message99O V
message99W ^
)99^ _
{:: 	
string;; 
text;; 
=;; 
$str;; )
;;;) *
if<< 
(<< 
string<< 
.<< 
IsNullOrEmpty<< $
(<<$ %
message<<% ,
.<<, -
Chat<<- 1
.<<1 2
Username<<2 :
)<<: ;
)<<; <
{== 
text>> 
=>> 
$str	>> Ç
;
>>Ç É
}?? 
else@@ 
if@@ 
(@@ 

Connection@@ 
.@@  
Context@@  '
.@@' (
Users@@( -
.@@- .
Any@@. 1
(@@1 2
x@@2 3
=>@@4 6
x@@7 8
.@@8 9
Username@@9 A
==@@B D
message@@E L
.@@L M
Chat@@M Q
.@@Q R
Username@@R Z
)@@Z [
)@@[ \
{AA 
DatabaseBB 
.BB 
ModelsBB 
.BB  
UserBB  $
?BB$ %
userBB& *
=BB+ ,

ConnectionBB- 7
.BB7 8
ContextBB8 ?
.BB? @
UsersBB@ E
.BBE F
WhereBBF K
(BBK L
xBBL M
=>BBN P
xBBQ R
.BBR S
UsernameBBS [
==BB\ ^
messageBB_ f
.BBf g
ChatBBg k
.BBk l
UsernameBBl t
)BBt u
.BBu v
FirstBBv {
(BB{ |
)BB| }
;BB} ~
ifDD 
(DD 
userDD 
.DD 
ChatIdDD 
==DD  "
$numDD# $
)DD$ %
{EE 
userFF 
.FF 
ChatIdFF 
=FF  !
messageFF" )
.FF) *
ChatFF* .
.FF. /
IdFF/ 1
;FF1 2

ConnectionGG 
.GG 
ContextGG &
.GG& '
SaveChangesGG' 2
(GG2 3
)GG3 4
;GG4 5
}HH 
userJJ 
.JJ 

TDISymbolsJJ 
.JJ  
ToListJJ  &
(JJ& '
)JJ' (
.JJ( )
ForEachJJ) 0
(JJ0 1
xJJ1 2
=>JJ3 5
{KK 
ifLL 
(LL 
xLL 
.LL 
ValueLL 
<LL  !
DateTimeLL" *
.LL* +
NowLL+ .
)LL. /
{MM 
textNN 
+=NN 
$"NN  "
$strNN" *
{NN* +
xNN+ ,
.NN, -
KeyNN- 0
}NN0 1
$strNN1 H
"NNH I
;NNI J
userOO 
.OO 

TDISymbolsOO '
.OO' (
RemoveOO( .
(OO. /
xOO/ 0
.OO0 1
KeyOO1 4
)OO4 5
;OO5 6

ConnectionPP "
.PP" #
ContextPP# *
.PP* +
SaveChangesPP+ 6
(PP6 7
)PP7 8
;PP8 9
returnQQ 
;QQ 
}RR 
textTT 
+=TT 
$"TT 
$strTT &
{TT& '
xTT' (
.TT( )
KeyTT) ,
}TT, -
$strTT- H
{TTH I
xTTI J
.TTJ K
ValueTTK P
}TTP Q
$strTTQ S
"TTS T
;TTT U
}VV 
)VV 
;VV 
}WW 
elseXX 
{YY 
textZZ 
=ZZ 
$strZZ T
;ZZT U
}[[ 
await]] 
	botClient]] 
.]]  
SendTextMessageAsync]] 0
(]]0 1
chatId]]1 7
:]]7 8
message]]9 @
.]]@ A
Chat]]A E
.]]E F
Id]]F H
,]]H I
	parseMode]]J S
:]]S T
	ParseMode]]U ^
.]]^ _
Markdown]]_ g
,]]g h
text^^8 <
:^^< =
text^^> B
)^^B C
;^^C D
}__ 	
}`` 
}aa à

wC:\Users\√ñmer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\UI\Helpers\ObservableObject.cs
	namespace 	!
EASYTelegramSignalBot
 
.  
UI  "
." #
Helpers# *
{		 
public

 

static

 
class

 
ObservableObject

 (
{ 
public 
static 
void 
	InvokeAll $
($ %
this% )'
PropertyChangedEventHandler* E
?E F'
propertyChangedEventHandlerG b
,b c
objectd j
senderk q
,q r
paramss y
string	z Ä
[
Ä Å
]
Å Ç
propertyNames
É ê
)
ê ë
{ 	
foreach 
( 
string 
? 
propertyName )
in* ,
propertyNames- :
): ;
{ '
propertyChangedEventHandler +
?+ ,
., -
Invoke- 3
(3 4
sender4 :
,: ;
new< ?$
PropertyChangedEventArgs@ X
(X Y
propertyNameY e
)e f
)f g
;g h
} 
} 	
} 
} ›Z
oC:\Users\√ñmer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\UI\Models\NewsModel.cs
	namespace		 	!
EASYTelegramSignalBot		
 
.		  
Models		  &
{

 
public 

class 
	NewsModel 
: 
ObservableObject -
{ 
public 
	NewsModel 
( 
) 
{ 	
} 	
public 
List 
< 
User 
> 
Users 
{ 	
get 
=> 

Connection 
. 
Context %
.% &
Users& +
.+ ,
Local, 1
.1 2"
ToObservableCollection2 H
(H I
)I J
.J K
WhereK P
(P Q
xQ R
=>S U
xV W
.W X
NewsX \
)\ ]
.] ^
ToList^ d
(d e
)e f
;f g
set 
{ %
RaisePropertyChangedEvent +
(+ ,
nameof, 2
(2 3
Users3 8
)8 9
)9 :
;: ;
}< =
} 	
private 
User 
? 
selectedUser "
;" #
public 
User 
? 
SelectedUser !
{ 	
get 
=> 
selectedUser 
;  
set 
{ 
selectedUser   
=   
value   $
;  $ %
if!! 
(!! 
selectedUser!!  
!=!!! #
null!!$ (
)!!( )
SelectedUser!!* 6
?!!6 7
.!!7 8
UpdateUserSymbols!!8 I
(!!I J
)!!J K
;!!K L
SelectedUserSymbols"" #
=""$ %
selectedUser""& 2
?""2 3
.""3 4

TDISymbols""4 >
;""> ?%
RaisePropertyChangedEvent## )
(##) *
nameof##* 0
(##0 1
SelectedUser##1 =
)##= >
)##> ?
;##? @
}$$ 
}%% 	
private'' 

Dictionary'' 
<'' 
string'' !
,''! "
DateTime''# +
>''+ ,
?'', -
selectedUserSymbols''. A
;''A B
public(( 

Dictionary(( 
<(( 
string((  
,((  !
DateTime((" *
>((* +
?((+ ,
SelectedUserSymbols((- @
{)) 	
get** 
=>** 
selectedUserSymbols** &
;**& '
set++ 
{++ 
selectedUserSymbols++ %
=++& '
value++( -
;++- .%
RaisePropertyChangedEvent++/ H
(++H I
nameof++I O
(++O P
SelectedUserSymbols++P c
)++c d
)++d e
;++e f
}++g h
},, 	
private.. 
KeyValuePair.. 
<.. 
string.. #
,..# $
DateTime..% -
>..- .
?... /
selectedUserSymbol..0 B
;..B C
public// 
KeyValuePair// 
<// 
string// "
,//" #
DateTime//$ ,
>//, -
?//- .
SelectedUserSymbol/// A
{00 	
get11 
=>11 
selectedUserSymbol11 %
;11% &
set22 
{22 
selectedUserSymbol22 $
=22% &
value22' ,
??22- /
(220 1
SelectedUserSymbols221 D
?22D E
.22E F
Count22F K
>22L M
$num22N O
?22P Q
SelectedUserSymbols22R e
.22e f
First22f k
(22k l
)22l m
:22n o
new22p s
(22s t
)22t u
)22u v
;22v w&
RaisePropertyChangedEvent	22x ë
(
22ë í
nameof
22í ò
(
22ò ô 
SelectedUserSymbol
22ô ´
)
22´ ¨
)
22¨ ≠
;
22≠ Æ
}
22Ø ∞
}33 	
private55 
string55 
?55 
addUserString55 %
;55% &
public66 
string66 
?66 
AddUserString66 $
{77 	
get88 
=>88 
addUserString88  
;88  !
set99 
{99 
addUserString99 
=99  !
value99" '
;99' (%
RaisePropertyChangedEvent99) B
(99B C
nameof99C I
(99I J
AddUserString99J W
)99W X
,99X Y
nameof99Z `
(99` a"
IsAddUserButtonEnabled99a w
)99w x
)99x y
;99y z
}99{ |
}:: 	
private<< 
string<< 
?<< 
addUserSymbolString<< +
;<<+ ,
public== 
string== 
?== 
AddUserSymbolString== *
{>> 	
get?? 
=>?? 
addUserSymbolString?? &
;??& '
set@@ 
{@@ 
addUserSymbolString@@ %
=@@& '
value@@( -
;@@- .%
RaisePropertyChangedEvent@@/ H
(@@H I
nameof@@I O
(@@O P
AddUserSymbolString@@P c
)@@c d
,@@d e
nameof@@f l
(@@l m)
IsAddUserSymbolButtonEnabled	@@m â
)
@@â ä
)
@@ä ã
;
@@ã å
}
@@ç é
}AA 	
privateCC 
intCC 
?CC 
addUserDaysCC  
;CC  !
publicDD 
intDD 
AddUserDaysDD 
{EE 	
getFF 
=>FF 
addUserDaysFF 
??FF !
$numFF" $
;FF$ %
setGG 
{GG 
addUserDaysGG 
=GG 
valueGG  %
;GG% &%
RaisePropertyChangedEventGG' @
(GG@ A
nameofGGA G
(GGG H
AddUserDaysGGH S
)GGS T
,GGT U
nameofGGV \
(GG\ ]"
IsAddUserButtonEnabledGG] s
)GGs t
)GGt u
;GGu v
}GGw x
}HH 	
privateJJ 
stringJJ 
?JJ 
addSymbolStringJJ '
;JJ' (
publicKK 
stringKK 
?KK 
AddSymbolStringKK &
{LL 	
getMM 
=>MM 
addSymbolStringMM "
;MM" #
setNN 
{NN 
addSymbolStringNN !
=NN" #
valueNN$ )
;NN) *%
RaisePropertyChangedEventNN+ D
(NND E
nameofNNE K
(NNK L
AddSymbolStringNNL [
)NN[ \
,NN\ ]
nameofNN^ d
(NNd e$
IsAddSymbolButtonEnabledNNe }
)NN} ~
)NN~ 
;	NN Ä
}
NNÅ Ç
}OO 	
publicQQ 
boolQQ (
IsAddUserSymbolButtonEnabledQQ 0
=>QQ1 3
!QQ4 5
stringQQ5 ;
.QQ; <
IsNullOrEmptyQQ< I
(QQI J
addUserSymbolStringQQJ ]
)QQ] ^
;QQ^ _
publicRR 
boolRR "
IsAddUserButtonEnabledRR *
=>RR+ -
!RR. /
stringRR/ 5
.RR5 6
IsNullOrEmptyRR6 C
(RRC D
addUserStringRRD Q
)RRQ R
;RRR S
publicSS 
boolSS $
IsAddSymbolButtonEnabledSS ,
=>SS- /
!SS0 1
stringSS1 7
.SS7 8
IsNullOrEmptySS8 E
(SSE F
addSymbolStringSSF U
)SSU V
;SSV W
publicVV 
staticVV 
ListVV 
<VV 
stringVV !
>VV! "
?VV" #
GroupIdsVV$ ,
{WW 	
getXX 
=>XX 
SettingsXX 
.XX 
TelegramSettingsXX ,
.XX, -
	RSIGroupsXX- 6
;XX6 7
setYY 
=>YY 
SettingsYY 
.YY 
TelegramSettingsYY ,
.YY, -
	RSIGroupsYY- 6
=YY7 8
valueYY9 >
??YY? A
newYYB E
(YYE F
)YYF G
;YYG H
}ZZ 	
private\\ 
string\\ 
?\\ 
selectedGroup\\ %
;\\% &
public]] 
string]] 
?]] 
SelectedGroup]] $
{^^ 	
get__ 
=>__ 
selectedGroup__  
;__  !
set`` 
{`` 
selectedGroup`` 
=``  !
value``" '
;``' (%
RaisePropertyChangedEvent``) B
(``B C
nameof``C I
(``I J
SelectedGroup``J W
)``W X
,``X Y
nameof``Z `
(``` a#
IsDelGroupButtonEnabled``a x
)``x y
)``y z
;``z {
}``| }
}aa 	
privatecc 
stringcc 
?cc 
addGroupStringcc &
;cc& '
publicdd 
stringdd 
?dd 
AddGroupStringdd %
{ee 	
getff 
=>ff 
addGroupStringff !
;ff! "
setgg 
{gg 
addGroupStringgg  
=gg! "
valuegg# (
;gg( )%
RaisePropertyChangedEventgg* C
(ggC D
nameofggD J
(ggJ K
AddGroupStringggK Y
)ggY Z
,ggZ [
nameofgg\ b
(ggb c#
IsAddGroupButtonEnabledggc z
)ggz {
)gg{ |
;gg| }
}gg~ 
}hh 	
publicjj 
booljj #
IsAddGroupButtonEnabledjj +
=>jj, .
!jj/ 0
stringjj0 6
.jj6 7
IsNullOrEmptyjj7 D
(jjD E
addGroupStringjjE S
)jjS T
;jjT U
publickk 
boolkk #
IsDelGroupButtonEnabledkk +
=>kk, .
!kk/ 0
stringkk0 6
.kk6 7
IsNullOrEmptykk7 D
(kkD E
SelectedGroupkkE R
)kkR S
;kkS T
privateoo 
stringoo 
?oo 
messageoo 
;oo  
publicpp 
stringpp 
Messagepp 
{qq 	
getrr 
=>rr 
messagerr 
??rr 
$strrr  
;rr  !
setss 
{ss 
messagess 
=ss 
valuess !
;ss! "%
RaisePropertyChangedEventss# <
(ss< =
nameofss= C
(ssC D
MessagessD K
)ssK L
)ssL M
;ssM N
}ssO P
}tt 	
privatexx 
intxx 
intervalxx 
;xx 
publicyy 
intyy 
Intervalyy 
{zz 	
get{{ 
=>{{ 
interval{{ 
;{{ 
set|| 
{|| 
interval|| 
=|| 
value|| "
;||" #%
RaisePropertyChangedEvent||$ =
(||= >
nameof||> D
(||D E
Interval||E M
)||M N
)||N O
;||O P
}||Q R
}}} 	
private 
string 
key 
; 
public
ÄÄ 
string
ÄÄ 
Key
ÄÄ 
{
ÅÅ 	
get
ÇÇ 
=>
ÇÇ 
key
ÇÇ 
;
ÇÇ 
set
ÉÉ 
{
ÉÉ 
key
ÉÉ 
=
ÉÉ 
value
ÉÉ 
;
ÉÉ '
RaisePropertyChangedEvent
ÉÉ 8
(
ÉÉ8 9
nameof
ÉÉ9 ?
(
ÉÉ? @
Key
ÉÉ@ C
)
ÉÉC D
)
ÉÉD E
;
ÉÉE F
}
ÉÉG H
}
ÑÑ 	
}
ÜÜ 
}áá ´ê
nC:\Users\√ñmer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\UI\Models\RSIModel.cs
	namespace 	!
EASYTelegramSignalBot
 
.  
Models  &
{ 
public 

class 
RSIModel 
: 
ObservableObject ,
{ 
public 
RSIModel 
( 
) 
{ 	
KlineSeries 
= 
new 
( 
) 
{  !
Values" (
=) *
new+ .
ChartValues/ :
<: ;
	OhlcPoint; D
>D E
(E F
)F G
}H I
;I J!
KlineSeriesCollection !
=" #
new$ '
(' (
)( )
{ 
KlineSeries 
} 
; 
RSI 
= 
new 
( 
) 
{ 
Title 
=  !
$str" '
,' (
LineSmoothness) 7
=8 9
$num: ;
,; <
Stroke= C
=D E
BrushesF M
.M N
GreenN S
,S T
PointGeometrySizeU f
=g h
$numi j
,j k
Valuesl r
=s t
newu x
ChartValues	y Ñ
<
Ñ Ö
double
Ö ã
>
ã å
(
å ç
)
ç é
,
é è
Fill
ê î
=
ï ñ
Brushes
ó û
.
û ü
Transparent
ü ™
}
´ ¨
;
¨ ≠&
IndicatorsSeriesCollection &
=' (
new) ,
(, -
)- .
{ 
RSI 
} 
; 
} 	
public"" 
string"" 
?"" 
UISymbol"" 
{""  !
get""" %
;""% &
set""' *
;""* +
}"", -
public## 
SeriesCollection## !
KlineSeriesCollection##  5
{##6 7
get##8 ;
;##; <
set##= @
;##@ A
}##B C
public$$ 
SeriesCollection$$ &
IndicatorsSeriesCollection$$  :
{$$; <
get$$= @
;$$@ A
set$$B E
;$$E F
}$$G H
public%% 
CandleSeries%% 
KlineSeries%% '
{%%( )
get%%* -
;%%- .
set%%/ 2
;%%2 3
}%%4 5
public&& 

LineSeries&& 
RSI&& 
{&& 
get&&  #
;&&# $
set&&% (
;&&( )
}&&* +
private(( 
List(( 
<(( 
string(( 
>(( 
?(( 
labels(( $
;(($ %
public)) 
List)) 
<)) 
string)) 
>)) 
Labels)) "
{** 	
get++ 
=>++ 
labels++ 
??=++ 
new++ !
(++! "
)++" #
;++# $
set,, 
{-- 
labels.. 
=.. 
value.. 
;.. %
RaisePropertyChangedEvent// )
(//) *
nameof//* 0
(//0 1
Labels//1 7
)//7 8
)//8 9
;//9 :
}00 
}11 	
private66  
ObservableCollection66 $
<66$ %
User66% )
>66) *
?66* +
users66, 1
;661 2
public77  
ObservableCollection77 #
<77# $
User77$ (
>77( )
Users77* /
{88 	
get99 
=>99 
users99 
??=99 

Connection99 '
.99' (
Context99( /
.99/ 0
Users990 5
.995 6
Local996 ;
.99; <"
ToObservableCollection99< R
(99R S
)99S T
;99T U
set:: 
{:: 
users:: 
=:: 
value:: 
;::  %
RaisePropertyChangedEvent::! :
(::: ;
nameof::; A
(::A B
Users::B G
)::G H
)::H I
;::I J
}::K L
};; 	
private== 
User== 
?== 
selectedUser== "
;==" #
public>> 
User>> 
?>> 
SelectedUser>> !
{?? 	
get@@ 
=>@@ 
selectedUser@@ 
;@@  
setAA 
{BB 
selectedUserCC 
=CC 
valueCC $
;CC$ %
ifDD 
(DD 
selectedUserDD  
!=DD! #
nullDD$ (
)DD( )
SelectedUserDD* 6
?DD6 7
.DD7 8
UpdateUserSymbolsDD8 I
(DDI J
)DDJ K
;DDK L
SelectedUserSymbolsEE #
=EE$ %
selectedUserEE& 2
?EE2 3
.EE3 4

TDISymbolsEE4 >
;EE> ?%
RaisePropertyChangedEventFF )
(FF) *
nameofFF* 0
(FF0 1
SelectedUserFF1 =
)FF= >
)FF> ?
;FF? @
}GG 
}HH 	
privateJJ 

DictionaryJJ 
<JJ 
stringJJ !
,JJ! "
DateTimeJJ# +
>JJ+ ,
?JJ, -
selectedUserSymbolsJJ. A
;JJA B
publicKK 

DictionaryKK 
<KK 
stringKK  
,KK  !
DateTimeKK" *
>KK* +
?KK+ ,
SelectedUserSymbolsKK- @
{LL 	
getMM 
=>MM 
selectedUserSymbolsMM &
;MM& '
setNN 
{NN 
selectedUserSymbolsNN %
=NN& '
valueNN( -
;NN- .%
RaisePropertyChangedEventNN/ H
(NNH I
nameofNNI O
(NNO P
SelectedUserSymbolsNNP c
)NNc d
)NNd e
;NNe f
}NNg h
}OO 	
privateQQ 
KeyValuePairQQ 
<QQ 
stringQQ #
,QQ# $
DateTimeQQ% -
>QQ- .
?QQ. /
selectedUserSymbolQQ0 B
;QQB C
publicRR 
KeyValuePairRR 
<RR 
stringRR "
,RR" #
DateTimeRR$ ,
>RR, -
?RR- .
SelectedUserSymbolRR/ A
{SS 	
getTT 
=>TT 
selectedUserSymbolTT %
;TT% &
setUU 
{UU 
selectedUserSymbolUU $
=UU% &
valueUU' ,
??UU- /
(UU0 1
SelectedUserSymbolsUU1 D
?UUD E
.UUE F
CountUUF K
>UUL M
$numUUN O
?UUP Q
SelectedUserSymbolsUUR e
.UUe f
FirstUUf k
(UUk l
)UUl m
:UUn o
newUUp s
(UUs t
)UUt u
)UUu v
;UUv w&
RaisePropertyChangedEvent	UUx ë
(
UUë í
nameof
UUí ò
(
UUò ô 
SelectedUserSymbol
UUô ´
)
UU´ ¨
)
UU¨ ≠
;
UU≠ Æ
}
UUØ ∞
}VV 	
privateXX 
stringXX 
?XX 
addUserStringXX %
;XX% &
publicYY 
stringYY 
?YY 
AddUserStringYY $
{ZZ 	
get[[ 
=>[[ 
addUserString[[  
;[[  !
set\\ 
{\\ 
addUserString\\ 
=\\  !
value\\" '
;\\' (%
RaisePropertyChangedEvent\\) B
(\\B C
nameof\\C I
(\\I J
AddUserString\\J W
)\\W X
,\\X Y
nameof\\Z `
(\\` a"
IsAddUserButtonEnabled\\a w
)\\w x
)\\x y
;\\y z
}\\{ |
}]] 	
private__ 
string__ 
?__ 
addUserSymbolString__ +
;__+ ,
public`` 
string`` 
?`` 
AddUserSymbolString`` *
{aa 	
getbb 
=>bb 
addUserSymbolStringbb &
;bb& '
setcc 
{cc 
addUserSymbolStringcc %
=cc& '
valuecc( -
;cc- .%
RaisePropertyChangedEventcc/ H
(ccH I
nameofccI O
(ccO P
AddUserSymbolStringccP c
)ccc d
,ccd e
nameofccf l
(ccl m)
IsAddUserSymbolButtonEnabled	ccm â
)
ccâ ä
)
ccä ã
;
ccã å
}
ccç é
}dd 	
privateff 
intff 
?ff 
addUserDaysff  
;ff  !
publicgg 
intgg 
AddUserDaysgg 
{hh 	
getii 
=>ii 
addUserDaysii 
??ii !
$numii" $
;ii$ %
setjj 
{jj 
addUserDaysjj 
=jj 
valuejj  %
;jj% &%
RaisePropertyChangedEventjj' @
(jj@ A
nameofjjA G
(jjG H
AddUserDaysjjH S
)jjS T
,jjT U
nameofjjV \
(jj\ ]"
IsAddUserButtonEnabledjj] s
)jjs t
)jjt u
;jju v
}jjw x
}kk 	
privatemm 
stringmm 
?mm 
addSymbolStringmm '
;mm' (
publicnn 
stringnn 
?nn 
AddSymbolStringnn &
{oo 	
getpp 
=>pp 
addSymbolStringpp "
;pp" #
setqq 
{qq 
addSymbolStringqq !
=qq" #
valueqq$ )
;qq) *%
RaisePropertyChangedEventqq+ D
(qqD E
nameofqqE K
(qqK L
AddSymbolStringqqL [
)qq[ \
,qq\ ]
nameofqq^ d
(qqd e$
IsAddSymbolButtonEnabledqqe }
)qq} ~
)qq~ 
;	qq Ä
}
qqÅ Ç
}rr 	
publictt 
booltt (
IsAddUserSymbolButtonEnabledtt 0
=>tt1 3
!tt4 5
stringtt5 ;
.tt; <
IsNullOrEmptytt< I
(ttI J
addUserSymbolStringttJ ]
)tt] ^
;tt^ _
publicuu 
booluu "
IsAddUserButtonEnableduu *
=>uu+ -
!uu. /
stringuu/ 5
.uu5 6
IsNullOrEmptyuu6 C
(uuC D
addUserStringuuD Q
)uuQ R
;uuR S
publicvv 
boolvv $
IsAddSymbolButtonEnabledvv ,
=>vv- /
!vv0 1
stringvv1 7
.vv7 8
IsNullOrEmptyvv8 E
(vvE F
addSymbolStringvvF U
)vvU V
;vvV W
publicyy 
staticyy 
Listyy 
<yy 
stringyy !
>yy! "
?yy" #
GroupIdsyy$ ,
{zz 	
get{{ 
=>{{ 
Settings{{ 
.{{ 
TelegramSettings{{ ,
.{{, -
	RSIGroups{{- 6
;{{6 7
set|| 
=>|| 
Settings|| 
.|| 
TelegramSettings|| ,
.||, -
	RSIGroups||- 6
=||7 8
value||9 >
??||? A
new||B E
(||E F
)||F G
;||G H
}}} 	
private 
string 
? 
selectedGroup %
;% &
public
ÄÄ 
string
ÄÄ 
?
ÄÄ 
SelectedGroup
ÄÄ $
{
ÅÅ 	
get
ÇÇ 
=>
ÇÇ 
selectedGroup
ÇÇ  
;
ÇÇ  !
set
ÉÉ 
{
ÉÉ 
selectedGroup
ÉÉ 
=
ÉÉ  !
value
ÉÉ" '
;
ÉÉ' ('
RaisePropertyChangedEvent
ÉÉ) B
(
ÉÉB C
nameof
ÉÉC I
(
ÉÉI J
SelectedGroup
ÉÉJ W
)
ÉÉW X
,
ÉÉX Y
nameof
ÉÉZ `
(
ÉÉ` a%
IsDelGroupButtonEnabled
ÉÉa x
)
ÉÉx y
)
ÉÉy z
;
ÉÉz {
}
ÉÉ| }
}
ÑÑ 	
private
ÜÜ 
string
ÜÜ 
?
ÜÜ 
addGroupString
ÜÜ &
;
ÜÜ& '
public
áá 
string
áá 
?
áá 
AddGroupString
áá %
{
àà 	
get
ââ 
=>
ââ 
addGroupString
ââ !
;
ââ! "
set
ää 
{
ää 
addGroupString
ää  
=
ää! "
value
ää# (
;
ää( )'
RaisePropertyChangedEvent
ää* C
(
ääC D
nameof
ääD J
(
ääJ K
AddGroupString
ääK Y
)
ääY Z
,
ääZ [
nameof
ää\ b
(
ääb c%
IsAddGroupButtonEnabled
ääc z
)
ääz {
)
ää{ |
;
ää| }
}
ää~ 
}
ãã 	
public
çç 
bool
çç %
IsAddGroupButtonEnabled
çç +
=>
çç, .
!
çç/ 0
string
çç0 6
.
çç6 7
IsNullOrEmpty
çç7 D
(
ççD E
addGroupString
ççE S
)
ççS T
;
ççT U
public
éé 
bool
éé %
IsDelGroupButtonEnabled
éé +
=>
éé, .
!
éé/ 0
string
éé0 6
.
éé6 7
IsNullOrEmpty
éé7 D
(
ééD E
SelectedGroup
ééE R
)
ééR S
;
ééS T
private
íí "
ObservableCollection
íí $
<
íí$ %
	Indicator
íí% .
>
íí. /
?
íí/ 0
symbols
íí1 8
;
íí8 9
public
ìì "
ObservableCollection
ìì #
<
ìì# $
	Indicator
ìì$ -
>
ìì- .
Symbols
ìì/ 6
{
îî 	
get
ïï 
=>
ïï 
symbols
ïï 
??=
ïï 
new
ïï "
(
ïï" #
)
ïï# $
;
ïï$ %
set
ññ 
{
ññ 
symbols
ññ 
=
ññ 
value
ññ !
;
ññ! "'
RaisePropertyChangedEvent
ññ# <
(
ññ< =
nameof
ññ= C
(
ññC D
Symbols
ññD K
)
ññK L
)
ññL M
;
ññM N
}
ññO P
}
óó 	
private
ôô 
	Indicator
ôô 
?
ôô 
selectedSymbol
ôô )
;
ôô) *
public
öö 
	Indicator
öö 
?
öö 
SelectedSymbol
öö (
{
õõ 	
get
úú 
=>
úú 
selectedSymbol
úú !
;
úú! "
set
ùù 
{
ùù 
selectedSymbol
ùù  
=
ùù! "
value
ùù# (
;
ùù( )'
RaisePropertyChangedEvent
ùù* C
(
ùùC D
nameof
ùùD J
(
ùùJ K
SelectedSymbol
ùùK Y
)
ùùY Z
)
ùùZ [
;
ùù[ \
}
ùù] ^
}
ûû 	
private
¢¢ 
string
¢¢ 
?
¢¢ "
oversoldSignalString
¢¢ ,
;
¢¢, -
public
££ 
string
££ "
OversoldSignalString
££ *
{
§§ 	
get
•• 
=>
•• "
oversoldSignalString
•• '
??
••( *
$str
••+ -
;
••- .
set
¶¶ 
{
¶¶ "
oversoldSignalString
¶¶ &
=
¶¶' (
value
¶¶) .
;
¶¶. /'
RaisePropertyChangedEvent
¶¶0 I
(
¶¶I J
nameof
¶¶J P
(
¶¶P Q"
OversoldSignalString
¶¶Q e
)
¶¶e f
)
¶¶f g
;
¶¶g h
}
¶¶i j
}
ßß 	
private
©© 
string
©© 
?
©© $
overboughtSignalString
©© .
;
©©. /
public
™™ 
string
™™ $
OverboughtSignalString
™™ ,
{
´´ 	
get
¨¨ 
=>
¨¨ $
overboughtSignalString
¨¨ )
??
¨¨* ,
$str
¨¨- /
;
¨¨/ 0
set
≠≠ 
{
≠≠ $
overboughtSignalString
≠≠ (
=
≠≠) *
value
≠≠+ 0
;
≠≠0 1'
RaisePropertyChangedEvent
≠≠2 K
(
≠≠K L
nameof
≠≠L R
(
≠≠R S$
OverboughtSignalString
≠≠S i
)
≠≠i j
)
≠≠j k
;
≠≠k l
}
≠≠m n
}
ÆÆ 	
private
∞∞ 
string
∞∞ 
?
∞∞ '
betweenLevelsSignalString
∞∞ 1
;
∞∞1 2
public
±± 
string
±± '
BetweenLevelsSignalString
±± /
{
≤≤ 	
get
≥≥ 
=>
≥≥ '
betweenLevelsSignalString
≥≥ ,
??
≥≥- /
$str
≥≥0 2
;
≥≥2 3
set
¥¥ 
{
¥¥ '
betweenLevelsSignalString
¥¥ +
=
¥¥, -
value
¥¥. 3
;
¥¥3 4'
RaisePropertyChangedEvent
¥¥5 N
(
¥¥N O
nameof
¥¥O U
(
¥¥U V'
BetweenLevelsSignalString
¥¥V o
)
¥¥o p
)
¥¥p q
;
¥¥q r
}
¥¥s t
}
µµ 	
private
ππ 
int
ππ 

_RSIPeriot
ππ 
;
ππ 
public
∫∫ 
int
∫∫ 
	RSIPeriot
∫∫ 
{
ªª 	
get
ºº 
=>
ºº 

_RSIPeriot
ºº 
;
ºº 
set
ΩΩ 
{
ΩΩ 

_RSIPeriot
ΩΩ 
=
ΩΩ 
value
ΩΩ $
;
ΩΩ$ %'
RaisePropertyChangedEvent
ΩΩ& ?
(
ΩΩ? @
nameof
ΩΩ@ F
(
ΩΩF G
	RSIPeriot
ΩΩG P
)
ΩΩP Q
)
ΩΩQ R
;
ΩΩR S
}
ΩΩT U
}
ææ 	
private
¿¿ 
int
¿¿ 
_RSIOversoldLevel
¿¿ %
;
¿¿% &
public
¡¡ 
int
¡¡ 
RSIOversoldLevel
¡¡ #
{
¬¬ 	
get
√√ 
=>
√√ 
_RSIOversoldLevel
√√ $
;
√√$ %
set
ƒƒ 
{
ƒƒ 
_RSIOversoldLevel
ƒƒ #
=
ƒƒ$ %
value
ƒƒ& +
;
ƒƒ+ ,'
RaisePropertyChangedEvent
ƒƒ- F
(
ƒƒF G
nameof
ƒƒG M
(
ƒƒM N
RSIOversoldLevel
ƒƒN ^
)
ƒƒ^ _
)
ƒƒ_ `
;
ƒƒ` a
}
ƒƒb c
}
≈≈ 	
private
«« 
int
«« !
_RSIOverboughtLevel
«« '
;
««' (
public
»» 
int
»»  
RSIOverboughtLevel
»» %
{
…… 	
get
   
=>
   !
_RSIOverboughtLevel
   &
;
  & '
set
ÀÀ 
{
ÀÀ !
_RSIOverboughtLevel
ÀÀ %
=
ÀÀ& '
value
ÀÀ( -
;
ÀÀ- .'
RaisePropertyChangedEvent
ÀÀ/ H
(
ÀÀH I
nameof
ÀÀI O
(
ÀÀO P 
RSIOverboughtLevel
ÀÀP b
)
ÀÀb c
)
ÀÀc d
;
ÀÀd e
}
ÀÀf g
}
ÃÃ 	
}
ŒŒ 
}œœ Íª
nC:\Users\√ñmer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\UI\Models\TDIModel.cs
	namespace 	!
EASYTelegramSignalBot
 
.  
Models  &
{ 
public 

class 
TDIModel 
: 
ObservableObject ,
{ 
public 
TDIModel 
( 
) 
{ 	
KlineSeries 
= 
new 
( 
) 
{  !
Values" (
=) *
new+ .
ChartValues/ :
<: ;
	OhlcPoint; D
>D E
(E F
)F G
}H I
;I J!
KlineSeriesCollection !
=" #
new$ '
(' (
)( )
{ 
KlineSeries 
} 
; 
FastMA 
= 
new 
( 
) 
{ 
Title "
=# $
$str% 5
,5 6
LineSmoothness7 E
=F G
$numH I
,I J
StrokeK Q
=R S
BrushesT [
.[ \
Green\ a
,a b
PointGeometrySizec t
=u v
$numw x
,x y
Values	z Ä
=
Å Ç
new
É Ü
ChartValues
á í
<
í ì
double
ì ô
>
ô ö
(
ö õ
)
õ ú
,
ú ù
Fill
û ¢
=
£ §
Brushes
• ¨
.
¨ ≠
Transparent
≠ ∏
}
π ∫
;
∫ ª
SlowMA 
= 
new 
( 
) 
{ 
Title "
=# $
$str% 8
,8 9
LineSmoothness: H
=I J
$numK L
,L M
StrokeN T
=U V
BrushesW ^
.^ _
Red_ b
,b c
PointGeometrySized u
=v w
$numx y
,y z
Values	{ Å
=
Ç É
new
Ñ á
ChartValues
à ì
<
ì î
double
î ö
>
ö õ
(
õ ú
)
ú ù
,
ù û
Fill
ü £
=
§ •
Brushes
¶ ≠
.
≠ Æ
Transparent
Æ π
}
∫ ª
;
ª º
UpVB 
= 
new 
( 
) 
{ 
Title  
=! "
$str# 5
,5 6
LineSmoothness7 E
=F G
$numH I
,I J
StrokeK Q
=R S
BrushesT [
.[ \
Blue\ `
,` a
PointGeometrySizeb s
=t u
$numv w
,w x
Valuesy 
=
Ä Å
new
Ç Ö
ChartValues
Ü ë
<
ë í
double
í ò
>
ò ô
(
ô ö
)
ö õ
,
õ ú
Fill
ù °
=
¢ £
Brushes
§ ´
.
´ ¨
Transparent
¨ ∑
}
∏ π
;
π ∫
MiddleVB 
= 
new 
( 
) 
{ 
Title $
=% &
$str' =
,= >
LineSmoothness? M
=N O
$numP Q
,Q R
StrokeS Y
=Z [
Brushes\ c
.c d
Yellowd j
,j k
PointGeometrySizel }
=~ 
$num
Ä Å
,
Å Ç
Values
É â
=
ä ã
new
å è
ChartValues
ê õ
<
õ ú
double
ú ¢
>
¢ £
(
£ §
)
§ •
,
• ¶
Fill
ß ´
=
¨ ≠
Brushes
Æ µ
.
µ ∂
Transparent
∂ ¡
}
¬ √
;
√ ƒ
DownVB 
= 
new 
( 
) 
{ 
Title "
=# $
$str% 9
,9 :
LineSmoothness; I
=J K
$numL M
,M N
StrokeO U
=V W
BrushesX _
._ `
Blue` d
,d e
PointGeometrySizef w
=x y
$numz {
,{ |
Values	} É
=
Ñ Ö
new
Ü â
ChartValues
ä ï
<
ï ñ
double
ñ ú
>
ú ù
(
ù û
)
û ü
,
ü †
Fill
° •
=
¶ ß
Brushes
® Ø
.
Ø ∞
Transparent
∞ ª
}
º Ω
;
Ω æ&
IndicatorsSeriesCollection &
=' (
new) ,
(, -
)- .
{   
FastMA!! 
,!! 
SlowMA"" 
,"" 
UpVB## 
,## 
MiddleVB$$ 
,$$ 
DownVB%% 
}&& 
;&& 
}'' 	
public** 
string** 
?** 
UISymbol** 
{**  !
get**" %
;**% &
set**' *
;*** +
}**, -
public++ 
SeriesCollection++ !
KlineSeriesCollection++  5
{++6 7
get++8 ;
;++; <
set++= @
;++@ A
}++B C
public,, 
SeriesCollection,, &
IndicatorsSeriesCollection,,  :
{,,; <
get,,= @
;,,@ A
set,,B E
;,,E F
},,G H
public-- 
CandleSeries-- 
KlineSeries-- '
{--( )
get--* -
;--- .
set--/ 2
;--2 3
}--4 5
public.. 

LineSeries.. 
FastMA..  
{..! "
get..# &
;..& '
set..( +
;..+ ,
}..- .
public// 

LineSeries// 
SlowMA//  
{//! "
get//# &
;//& '
set//( +
;//+ ,
}//- .
public00 

LineSeries00 
UpVB00 
{00  
get00! $
;00$ %
set00& )
;00) *
}00+ ,
public11 

LineSeries11 
MiddleVB11 "
{11# $
get11% (
;11( )
set11* -
;11- .
}11/ 0
public22 

LineSeries22 
DownVB22  
{22! "
get22# &
;22& '
set22( +
;22+ ,
}22- .
private44 
List44 
<44 
string44 
>44 
?44 
labels44 $
;44$ %
public55 
List55 
<55 
string55 
>55 
Labels55 "
{66 	
get77 
=>77 
labels77 
??=77 
new77 !
(77! "
)77" #
;77# $
set88 
{99 
labels:: 
=:: 
value:: 
;:: %
RaisePropertyChangedEvent;; )
(;;) *
nameof;;* 0
(;;0 1
Labels;;1 7
);;7 8
);;8 9
;;;9 :
}<< 
}== 	
privateBB  
ObservableCollectionBB $
<BB$ %
UserBB% )
>BB) *
?BB* +
usersBB, 1
;BB1 2
publicCC  
ObservableCollectionCC #
<CC# $
UserCC$ (
>CC( )
UsersCC* /
{DD 	
getEE 
=>EE 
usersEE 
??=EE 

ConnectionEE '
.EE' (
ContextEE( /
.EE/ 0
UsersEE0 5
.EE5 6
LocalEE6 ;
.EE; <"
ToObservableCollectionEE< R
(EER S
)EES T
;EET U
setFF 
{FF 
usersFF 
=FF 
valueFF 
;FF  %
RaisePropertyChangedEventFF! :
(FF: ;
nameofFF; A
(FFA B
UsersFFB G
)FFG H
)FFH I
;FFI J
}FFK L
}GG 	
privateII 
UserII 
?II 
selectedUserII "
;II" #
publicJJ 
UserJJ 
?JJ 
SelectedUserJJ !
{KK 	
getLL 
=>LL 
selectedUserLL 
;LL  
setMM 
{NN 
selectedUserOO 
=OO 
valueOO $
;OO$ %
ifPP 
(PP 
selectedUserPP  
!=PP! #
nullPP$ (
)PP( )
SelectedUserPP* 6
?PP6 7
.PP7 8
UpdateUserSymbolsPP8 I
(PPI J
)PPJ K
;PPK L
SelectedUserSymbolsQQ #
=QQ$ %
selectedUserQQ& 2
?QQ2 3
.QQ3 4

TDISymbolsQQ4 >
;QQ> ?%
RaisePropertyChangedEventRR )
(RR) *
nameofRR* 0
(RR0 1
SelectedUserRR1 =
)RR= >
)RR> ?
;RR? @
}SS 
}TT 	
privateVV 

DictionaryVV 
<VV 
stringVV !
,VV! "
DateTimeVV# +
>VV+ ,
?VV, -
selectedUserSymbolsVV. A
;VVA B
publicWW 

DictionaryWW 
<WW 
stringWW  
,WW  !
DateTimeWW" *
>WW* +
?WW+ ,
SelectedUserSymbolsWW- @
{XX 	
getYY 
=>YY 
selectedUserSymbolsYY &
;YY& '
setZZ 
{ZZ 
selectedUserSymbolsZZ %
=ZZ& '
valueZZ( -
;ZZ- .%
RaisePropertyChangedEventZZ/ H
(ZZH I
nameofZZI O
(ZZO P
SelectedUserSymbolsZZP c
)ZZc d
)ZZd e
;ZZe f
}ZZg h
}[[ 	
private]] 
KeyValuePair]] 
<]] 
string]] #
,]]# $
DateTime]]% -
>]]- .
?]]. /
selectedUserSymbol]]0 B
;]]B C
public^^ 
KeyValuePair^^ 
<^^ 
string^^ "
,^^" #
DateTime^^$ ,
>^^, -
?^^- .
SelectedUserSymbol^^/ A
{__ 	
get`` 
=>`` 
selectedUserSymbol`` %
;``% &
setaa 
{aa 
selectedUserSymbolaa $
=aa% &
valueaa' ,
??aa- /
(aa0 1
SelectedUserSymbolsaa1 D
?aaD E
.aaE F
CountaaF K
>aaL M
$numaaN O
?aaP Q
SelectedUserSymbolsaaR e
.aae f
Firstaaf k
(aak l
)aal m
:aan o
newaap s
(aas t
)aat u
)aau v
;aav w&
RaisePropertyChangedEvent	aax ë
(
aaë í
nameof
aaí ò
(
aaò ô 
SelectedUserSymbol
aaô ´
)
aa´ ¨
)
aa¨ ≠
;
aa≠ Æ
}
aaØ ∞
}bb 	
privatedd 
stringdd 
?dd 
addUserStringdd %
;dd% &
publicee 
stringee 
?ee 
AddUserStringee $
{ff 	
getgg 
=>gg 
addUserStringgg  
;gg  !
sethh 
{hh 
addUserStringhh 
=hh  !
valuehh" '
;hh' (%
RaisePropertyChangedEventhh) B
(hhB C
nameofhhC I
(hhI J
AddUserStringhhJ W
)hhW X
,hhX Y
nameofhhZ `
(hh` a"
IsAddUserButtonEnabledhha w
)hhw x
)hhx y
;hhy z
}hh{ |
}ii 	
privatekk 
stringkk 
?kk 
addUserSymbolStringkk +
;kk+ ,
publicll 
stringll 
?ll 
AddUserSymbolStringll *
{mm 	
getnn 
=>nn 
addUserSymbolStringnn &
;nn& '
setoo 
{oo 
addUserSymbolStringoo %
=oo& '
valueoo( -
;oo- .%
RaisePropertyChangedEventoo/ H
(ooH I
nameofooI O
(ooO P
AddUserSymbolStringooP c
)ooc d
,ood e
nameofoof l
(ool m)
IsAddUserSymbolButtonEnabled	oom â
)
ooâ ä
)
ooä ã
;
ooã å
}
ooç é
}pp 	
privaterr 
intrr 
?rr 
addUserDaysrr  
;rr  !
publicss 
intss 
AddUserDaysss 
{tt 	
getuu 
=>uu 
addUserDaysuu 
??uu !
$numuu" $
;uu$ %
setvv 
{vv 
addUserDaysvv 
=vv 
valuevv  %
;vv% &%
RaisePropertyChangedEventvv' @
(vv@ A
nameofvvA G
(vvG H
AddUserDaysvvH S
)vvS T
,vvT U
nameofvvV \
(vv\ ]"
IsAddUserButtonEnabledvv] s
)vvs t
)vvt u
;vvu v
}vvw x
}ww 	
privateyy 
stringyy 
?yy 
addSymbolStringyy '
;yy' (
publiczz 
stringzz 
?zz 
AddSymbolStringzz &
{{{ 	
get|| 
=>|| 
addSymbolString|| "
;||" #
set}} 
{}} 
addSymbolString}} !
=}}" #
value}}$ )
;}}) *%
RaisePropertyChangedEvent}}+ D
(}}D E
nameof}}E K
(}}K L
AddSymbolString}}L [
)}}[ \
,}}\ ]
nameof}}^ d
(}}d e$
IsAddSymbolButtonEnabled}}e }
)}}} ~
)}}~ 
;	}} Ä
}
}}Å Ç
}~~ 	
public
ÄÄ 
bool
ÄÄ *
IsAddUserSymbolButtonEnabled
ÄÄ 0
=>
ÄÄ1 3
!
ÄÄ4 5
string
ÄÄ5 ;
.
ÄÄ; <
IsNullOrEmpty
ÄÄ< I
(
ÄÄI J!
addUserSymbolString
ÄÄJ ]
)
ÄÄ] ^
;
ÄÄ^ _
public
ÅÅ 
bool
ÅÅ $
IsAddUserButtonEnabled
ÅÅ *
=>
ÅÅ+ -
!
ÅÅ. /
string
ÅÅ/ 5
.
ÅÅ5 6
IsNullOrEmpty
ÅÅ6 C
(
ÅÅC D
addUserString
ÅÅD Q
)
ÅÅQ R
;
ÅÅR S
public
ÇÇ 
bool
ÇÇ &
IsAddSymbolButtonEnabled
ÇÇ ,
=>
ÇÇ- /
!
ÇÇ0 1
string
ÇÇ1 7
.
ÇÇ7 8
IsNullOrEmpty
ÇÇ8 E
(
ÇÇE F
addSymbolString
ÇÇF U
)
ÇÇU V
;
ÇÇV W
public
ÖÖ 
static
ÖÖ 
List
ÖÖ 
<
ÖÖ 
string
ÖÖ !
>
ÖÖ! "
?
ÖÖ" #
GroupIds
ÖÖ$ ,
{
ÜÜ 	
get
áá 
=>
áá 
Settings
áá 
.
áá 
TelegramSettings
áá ,
.
áá, -
	TDIGroups
áá- 6
;
áá6 7
set
àà 
=>
àà 
Settings
àà 
.
àà 
TelegramSettings
àà ,
.
àà, -
	TDIGroups
àà- 6
=
àà7 8
value
àà9 >
??
àà? A
new
ààB E
(
ààE F
)
ààF G
;
ààG H
}
ââ 	
private
ãã 
string
ãã 
?
ãã 
selectedGroup
ãã %
;
ãã% &
public
åå 
string
åå 
?
åå 
SelectedGroup
åå $
{
çç 	
get
éé 
=>
éé 
selectedGroup
éé  
;
éé  !
set
èè 
{
èè 
selectedGroup
èè 
=
èè  !
value
èè" '
;
èè' ('
RaisePropertyChangedEvent
èè) B
(
èèB C
nameof
èèC I
(
èèI J
SelectedGroup
èèJ W
)
èèW X
,
èèX Y
nameof
èèZ `
(
èè` a%
IsDelGroupButtonEnabled
èèa x
)
èèx y
)
èèy z
;
èèz {
}
èè| }
}
êê 	
private
íí 
string
íí 
?
íí 
addGroupString
íí &
;
íí& '
public
ìì 
string
ìì 
?
ìì 
AddGroupString
ìì %
{
îî 	
get
ïï 
=>
ïï 
addGroupString
ïï !
;
ïï! "
set
ññ 
{
ññ 
addGroupString
ññ  
=
ññ! "
value
ññ# (
;
ññ( )'
RaisePropertyChangedEvent
ññ* C
(
ññC D
nameof
ññD J
(
ññJ K
AddGroupString
ññK Y
)
ññY Z
,
ññZ [
nameof
ññ\ b
(
ññb c%
IsAddGroupButtonEnabled
ññc z
)
ññz {
)
ññ{ |
;
ññ| }
}
ññ~ 
}
óó 	
public
ôô 
bool
ôô %
IsAddGroupButtonEnabled
ôô +
=>
ôô, .
!
ôô/ 0
string
ôô0 6
.
ôô6 7
IsNullOrEmpty
ôô7 D
(
ôôD E
addGroupString
ôôE S
)
ôôS T
;
ôôT U
public
öö 
bool
öö %
IsDelGroupButtonEnabled
öö +
=>
öö, .
!
öö/ 0
string
öö0 6
.
öö6 7
IsNullOrEmpty
öö7 D
(
ööD E
SelectedGroup
ööE R
)
ööR S
;
ööS T
private
ûû "
ObservableCollection
ûû $
<
ûû$ %
	Indicator
ûû% .
>
ûû. /
?
ûû/ 0
symbols
ûû1 8
;
ûû8 9
public
üü "
ObservableCollection
üü #
<
üü# $
	Indicator
üü$ -
>
üü- .
Symbols
üü/ 6
{
†† 	
get
°° 
=>
°° 
symbols
°° 
??=
°° 
new
°° "
(
°°" #
)
°°# $
;
°°$ %
set
¢¢ 
{
¢¢ 
symbols
¢¢ 
=
¢¢ 
value
¢¢ !
;
¢¢! "'
RaisePropertyChangedEvent
¢¢# <
(
¢¢< =
nameof
¢¢= C
(
¢¢C D
Symbols
¢¢D K
)
¢¢K L
)
¢¢L M
;
¢¢M N
}
¢¢O P
}
££ 	
private
•• 
	Indicator
•• 
?
•• 
selectedSymbol
•• )
;
••) *
public
¶¶ 
	Indicator
¶¶ 
?
¶¶ 
SelectedSymbol
¶¶ (
{
ßß 	
get
®® 
=>
®® 
selectedSymbol
®® !
;
®®! "
set
©© 
{
©© 
selectedSymbol
©©  
=
©©! "
value
©©# (
;
©©( )'
RaisePropertyChangedEvent
©©* C
(
©©C D
nameof
©©D J
(
©©J K
SelectedSymbol
©©K Y
)
©©Y Z
)
©©Z [
;
©©[ \
}
©©] ^
}
™™ 	
private
ÆÆ 
string
ÆÆ 
?
ÆÆ 
sellSignalString
ÆÆ (
;
ÆÆ( )
public
ØØ 
string
ØØ 
SellSignalString
ØØ &
{
∞∞ 	
get
±± 
=>
±± 
sellSignalString
±± #
??
±±$ &
$str
±±' )
;
±±) *
set
≤≤ 
{
≤≤ 
sellSignalString
≤≤ "
=
≤≤# $
value
≤≤% *
;
≤≤* +'
RaisePropertyChangedEvent
≤≤, E
(
≤≤E F
nameof
≤≤F L
(
≤≤L M
SellSignalString
≤≤M ]
)
≤≤] ^
)
≤≤^ _
;
≤≤_ `
}
≤≤a b
}
≥≥ 	
private
µµ 
string
µµ 
?
µµ 
buySignalString
µµ '
;
µµ' (
public
∂∂ 
string
∂∂ 
BuySignalString
∂∂ %
{
∑∑ 	
get
∏∏ 
=>
∏∏ 
buySignalString
∏∏ "
??
∏∏# %
$str
∏∏& (
;
∏∏( )
set
ππ 
{
ππ 
buySignalString
ππ !
=
ππ" #
value
ππ$ )
;
ππ) *'
RaisePropertyChangedEvent
ππ+ D
(
ππD E
nameof
ππE K
(
ππK L
BuySignalString
ππL [
)
ππ[ \
)
ππ\ ]
;
ππ] ^
}
ππ_ `
}
∫∫ 	
private
ºº 
string
ºº 
?
ºº 
exitSignalString
ºº (
;
ºº( )
public
ΩΩ 
string
ΩΩ 
ExitSignalString
ΩΩ &
{
ææ 	
get
øø 
=>
øø 
exitSignalString
øø #
??
øø$ &
$str
øø' )
;
øø) *
set
¿¿ 
{
¿¿ 
exitSignalString
¿¿ "
=
¿¿# $
value
¿¿% *
;
¿¿* +'
RaisePropertyChangedEvent
¿¿, E
(
¿¿E F
nameof
¿¿F L
(
¿¿L M
ExitSignalString
¿¿M ]
)
¿¿] ^
)
¿¿^ _
;
¿¿_ `
}
¿¿a b
}
¡¡ 	
private
≈≈ 
int
≈≈ 

_RSIPeriot
≈≈ 
;
≈≈ 
public
∆∆ 
int
∆∆ 
	RSIPeriot
∆∆ 
{
«« 	
get
»» 
=>
»» 

_RSIPeriot
»» 
;
»» 
set
…… 
{
…… 

_RSIPeriot
…… 
=
…… 
value
…… $
;
……$ %'
RaisePropertyChangedEvent
……& ?
(
……? @
nameof
……@ F
(
……F G
	RSIPeriot
……G P
)
……P Q
)
……Q R
;
……R S
}
……T U
}
   	
private
ÃÃ 
int
ÃÃ 
_RSIPLPeriot
ÃÃ  
;
ÃÃ  !
public
ÕÕ 
int
ÕÕ 
RSIPLPeriot
ÕÕ 
{
ŒŒ 	
get
œœ 
=>
œœ 
_RSIPLPeriot
œœ 
;
œœ  
set
–– 
{
–– 
_RSIPLPeriot
–– 
=
––  
value
––! &
;
––& ''
RaisePropertyChangedEvent
––( A
(
––A B
nameof
––B H
(
––H I
RSIPLPeriot
––I T
)
––T U
)
––U V
;
––V W
}
––X Y
}
—— 	
private
”” 
int
”” 

_TSLPeriot
”” 
;
”” 
public
‘‘ 
int
‘‘ 
	TSLPeriot
‘‘ 
{
’’ 	
get
÷÷ 
=>
÷÷ 

_TSLPeriot
÷÷ 
;
÷÷ 
set
◊◊ 
{
◊◊ 

_TSLPeriot
◊◊ 
=
◊◊ 
value
◊◊ $
;
◊◊$ %'
RaisePropertyChangedEvent
◊◊& ?
(
◊◊? @
nameof
◊◊@ F
(
◊◊F G
	TSLPeriot
◊◊G P
)
◊◊P Q
)
◊◊Q R
;
◊◊R S
}
◊◊T U
}
ÿÿ 	
private
⁄⁄ 
int
⁄⁄ 
	_VBPeriot
⁄⁄ 
;
⁄⁄ 
public
€€ 
int
€€ 
VBPeriot
€€ 
{
‹‹ 	
get
›› 
=>
›› 
	_VBPeriot
›› 
;
›› 
set
ﬁﬁ 
{
ﬁﬁ 
	_VBPeriot
ﬁﬁ 
=
ﬁﬁ 
value
ﬁﬁ #
;
ﬁﬁ# $'
RaisePropertyChangedEvent
ﬁﬁ% >
(
ﬁﬁ> ?
nameof
ﬁﬁ? E
(
ﬁﬁE F
VBPeriot
ﬁﬁF N
)
ﬁﬁN O
)
ﬁﬁO P
;
ﬁﬁP Q
}
ﬁﬁR S
}
ﬂﬂ 	
private
·· 
int
·· 
_RSIOversoldLevel
·· %
;
··% &
public
‚‚ 
int
‚‚ 
RSIOversoldLevel
‚‚ #
{
„„ 	
get
‰‰ 
=>
‰‰ 
_RSIOversoldLevel
‰‰ $
;
‰‰$ %
set
ÂÂ 
{
ÂÂ 
_RSIOversoldLevel
ÂÂ #
=
ÂÂ$ %
value
ÂÂ& +
;
ÂÂ+ ,'
RaisePropertyChangedEvent
ÂÂ- F
(
ÂÂF G
nameof
ÂÂG M
(
ÂÂM N
RSIOversoldLevel
ÂÂN ^
)
ÂÂ^ _
)
ÂÂ_ `
;
ÂÂ` a
}
ÂÂb c
}
ÊÊ 	
private
ËË 
int
ËË !
_RSIOverboughtLevel
ËË '
;
ËË' (
public
ÈÈ 
int
ÈÈ  
RSIOverboughtLevel
ÈÈ %
{
ÍÍ 	
get
ÎÎ 
=>
ÎÎ !
_RSIOverboughtLevel
ÎÎ &
;
ÎÎ& '
set
ÏÏ 
{
ÏÏ !
_RSIOverboughtLevel
ÏÏ %
=
ÏÏ& '
value
ÏÏ( -
;
ÏÏ- .'
RaisePropertyChangedEvent
ÏÏ/ H
(
ÏÏH I
nameof
ÏÏI O
(
ÏÏO P 
RSIOverboughtLevel
ÏÏP b
)
ÏÏb c
)
ÏÏc d
;
ÏÏd e
}
ÏÏf g
}
ÌÌ 	
}
ÔÔ 
} ø
wC:\Users\√ñmer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\UI\ViewModels\MainViewModel.cs
	namespace 	!
EASYTelegramSignalBot
 
.  

ViewModels  *
{ 
internal 
class 
MainViewModel  
{ 
public 
MainViewModel 
( 
) 
{ 	
} 	
}		 
}

 àl
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
;!! 
}"" 	
public&& 
void&& 
AddUser&& 
(&& 
)&& 
{'' 	
try(( 
{)) 
if** 
(** 
!** 

Connection** 
.**  
Context**  '
.**' (
Users**( -
.**- .
Any**. 1
(**1 2
x**2 3
=>**4 6
x**7 8
.**8 9
Username**9 A
==**B D
Model**E J
.**J K
AddUserString**K X
)**X Y
)**Y Z
{++ 

Connection,, 
.,, 
Context,, &
.,,& '
Add,,' *
(,,* +
new,,+ .
User,,/ 3
(,,3 4
),,4 5
{,,6 7
Username,,8 @
=,,A B
Model,,C H
.,,H I
AddUserString,,I V
??,,W Y
$str,,Z \
,,,\ ]
TDI,,^ a
=,,b c
false,,d i
,,,i j
TDISymbolValues,,k z
=,,{ |
$str	,,} Å
,
,,Å Ç
News
,,É á
=
,,à â
true
,,ä é
,
,,é è
NewsExpiryDate
,,ê û
=
,,ü †
DateTime
,,° ©
.
,,© ™
Now
,,™ ≠
.
,,≠ Æ
AddDays
,,Æ µ
(
,,µ ∂
Model
,,∂ ª
.
,,ª º
AddUserDays
,,º «
)
,,« »
}
,,…  
)
,,  À
;
,,À Ã

Connection-- 
.-- 
Context-- &
.--& '
SaveChanges--' 2
(--2 3
)--3 4
;--4 5

MessageBox.. 
... 
Show.. #
(..# $
$str..$ B
,..B C
$str..D W
,..W X
MessageBoxButton..Y i
...i j
OK..j l
)..l m
;..m n
}// 
else00 
if00 
(00 

Connection00 #
.00# $
Context00$ +
.00+ ,
Users00, 1
.001 2
Any002 5
(005 6
x006 7
=>008 :
x00; <
.00< =
Username00= E
==00F H
Model00I N
.00N O
AddUserString00O \
&&00] _
x00` a
.00a b
News00b f
==00g i
false00j o
)00o p
)00p q
{11 
var22 
user22 
=22 

Connection22 )
.22) *
Context22* 1
.221 2
Users222 7
.227 8
First228 =
(22= >
x22> ?
=>22@ B
x22C D
.22D E
Username22E M
==22N P
Model22Q V
.22V W
AddUserString22W d
)22d e
;22e f
user33 
.33 
News33 
=33 
true33  $
;33$ %
DateTime44 
newExpiryDate44 *
=44+ ,
DateTime44- 5
.445 6
Now446 9
.449 :
AddDays44: A
(44A B
Model44B G
.44G H
AddUserDays44H S
)44S T
;44T U
if55 
(55 
user55 
.55 
NewsExpiryDate55 *
>55+ ,
DateTime55- 5
.555 6
Now556 9
)559 :
newExpiryDate55; H
=55I J
user55K O
.55O P
NewsExpiryDate55P ^
.55^ _
Value55_ d
.55d e
AddDays55e l
(55l m
Model55m r
.55r s
AddUserDays55s ~
)55~ 
;	55 Ä
user66 
.66 
NewsExpiryDate66 '
=66( )
newExpiryDate66* 7
;667 8

Connection77 
.77 
Context77 &
.77& '
SaveChanges77' 2
(772 3
)773 4
;774 5

MessageBox88 
.88 
Show88 #
(88# $
$str88$ B
,88B C
$str88D W
,88W X
MessageBoxButton88Y i
.88i j
OK88j l
)88l m
;88m n
}99 
else:: 
{;; 
User<< 
user<< 
=<< 

Connection<<  *
.<<* +
Context<<+ 2
.<<2 3
Users<<3 8
.<<8 9
First<<9 >
(<<> ?
x<<? @
=><<A C
x<<D E
.<<E F
Username<<F N
==<<O Q
Model<<R W
.<<W X
AddUserString<<X e
)<<e f
;<<f g
Model== 
.== 
SelectedUser== &
===' (
user==) -
;==- .
}>> 
Model@@ 
.@@ 
Users@@ 
=@@ 
null@@ "
;@@" #
}AA 
catchBB 
(BB 
	ExceptionBB 
exBB 
)BB  
{CC 

MessageBoxDD 
.DD 
ShowDD 
(DD  
$"DD  "
$strDD" ;
{DD; <
exDD< >
.DD> ?
MessageDD? F
}DDF G
"DDG H
,DDH I
$strDDJ P
,DDP Q
MessageBoxButtonDDR b
.DDb c
OKDDc e
,DDe f
MessageBoxImageDDg v
.DDv w
ErrorDDw |
)DD| }
;DD} ~
}EE 
}FF 	
publicHH 
voidHH 
DelUserHH 
(HH 
)HH 
{II 	
tryJJ 
{KK 
ifLL 
(LL 
ModelLL 
.LL 
SelectedUserLL &
==LL' )
nullLL* .
)LL. /
returnLL0 6
;LL6 7
varMM 
userMM 
=MM 

ConnectionMM %
.MM% &
ContextMM& -
.MM- .
UsersMM. 3
.MM3 4
FirstMM4 9
(MM9 :
xMM: ;
=>MM< >
xMM? @
.MM@ A
UsernameMMA I
==MMJ L
ModelMMM R
.MMR S
AddUserStringMMS `
&&MMa c
xMMd e
.MMe f
NewsMMf j
==MMk m
trueMMn r
)MMr s
;MMs t
userNN 
.NN 
NewsNN 
=NN 
falseNN !
;NN! "
userOO 
.OO 
NewsExpiryDateOO #
=OO$ %
DateTimeOO& .
.OO. /
NowOO/ 2
.OO2 3
AddDaysOO3 :
(OO: ;
-OO; <
$numOO< =
)OO= >
;OO> ?

ConnectionPP 
.PP 
ContextPP "
.PP" #
SaveChangesPP# .
(PP. /
)PP/ 0
;PP0 1

MessageBoxRR 
.RR 
ShowRR 
(RR  
$strRR  >
,RR> ?
$strRR@ S
,RRS T
MessageBoxButtonRRU e
.RRe f
OKRRf h
)RRh i
;RRi j
ModelTT 
.TT 
UsersTT 
=TT 
nullTT "
;TT" #
}UU 
catchVV 
(VV 
	ExceptionVV 
exVV 
)VV  
{WW 

MessageBoxXX 
.XX 
ShowXX 
(XX  
$"XX  "
$strXX" ;
{XX; <
exXX< >
.XX> ?
MessageXX? F
}XXF G
"XXG H
,XXH I
$strXXJ P
,XXP Q
MessageBoxButtonXXR b
.XXb c
OKXXc e
,XXe f
MessageBoxImageXXg v
.XXv w
ErrorXXw |
)XX| }
;XX} ~
}YY 
}ZZ 	
public\\ 
void\\ 
AddGroup\\ 
(\\ 
)\\ 
{]] 	
if^^ 
(^^ 
string^^ 
.^^ 
IsNullOrEmpty^^ $
(^^$ %
Model^^% *
.^^* +
AddGroupString^^+ 9
)^^9 :
)^^: ;
return^^< B
;^^B C
Settings__ 
.__ 
TelegramSettings__ %
.__% &

NewsGroups__& 0
.__0 1
Add__1 4
(__4 5
Model__5 :
.__: ;
AddGroupString__; I
)__I J
;__J K
Settings`` 
.`` 
SaveSettings`` !
(``! "
)``" #
;``# $

MessageBoxaa 
.aa 
Showaa 
(aa 
$straa 4
,aa4 5
$straa6 D
,aaD E
MessageBoxButtonaaF V
.aaV W
OKaaW Y
)aaY Z
;aaZ [
}bb 	
publicdd 
voiddd 
DelGroupdd 
(dd 
)dd 
{ee 	
Settingsff 
.ff 
TelegramSettingsff %
.ff% &

NewsGroupsff& 0
.ff0 1
Removeff1 7
(ff7 8
Modelff8 =
.ff= >
SelectedGroupff> K
??ffL N
$strffO Q
)ffQ R
;ffR S
Settingsgg 
.gg 
SaveSettingsgg !
(gg! "
)gg" #
;gg# $

MessageBoxhh 
.hh 
Showhh 
(hh 
$strhh 4
,hh4 5
$strhh6 D
,hhD E
MessageBoxButtonhhF V
.hhV W
OKhhW Y
)hhY Z
;hhZ [
}ii 	
publicmm 
voidmm 
SaveSettingsmm  
(mm  !
)mm! "
{nn 	
Settingsoo 
.oo 
BotsSettingsoo !
.oo! "
NewsSettingsoo" .
.oo. /
Messageoo/ 6
=oo7 8
Modeloo9 >
.oo> ?
Messageoo? F
;ooF G
Settingspp 
.pp 
BotsSettingspp !
.pp! "
NewsSettingspp" .
.pp. /
Intervalpp/ 7
=pp8 9
Modelpp: ?
.pp? @
Intervalpp@ H
;ppH I
Settingsqq 
.qq 
BotsSettingsqq !
.qq! "
NewsSettingsqq" .
.qq. /
Keyqq/ 2
=qq3 4
Modelqq5 :
.qq: ;
Keyqq; >
;qq> ?
Settingsss 
.ss 
SaveSettingsss !
(ss! "
)ss" #
;ss# $

MessageBoxuu 
.uu 
Showuu 
(uu 
$struu ;
,uu; <
$struu= Q
,uuQ R
MessageBoxButtonuuS c
.uuc d
OKuud f
)uuf g
;uug h
}vv 	
publicxx 
voidxx 
LoadSettingsxx  
(xx  !
)xx! "
{yy 	
Modelzz 
.zz 
Intervalzz 
=zz 
Settingszz %
.zz% &
BotsSettingszz& 2
.zz2 3
NewsSettingszz3 ?
.zz? @
Intervalzz@ H
;zzH I
Model{{ 
.{{ 
Key{{ 
={{ 
Settings{{  
.{{  !
BotsSettings{{! -
.{{- .
NewsSettings{{. :
.{{: ;
Key{{; >
;{{> ?
Model|| 
.|| 
Message|| 
=|| 
Settings|| $
.||$ %
BotsSettings||% 1
.||1 2
NewsSettings||2 >
.||> ?
Message||? F
;||F G
}}} 	
} 
}ÄÄ é‡
vC:\Users\√ñmer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\UI\ViewModels\RSIViewModel.cs
	namespace 	!
EASYTelegramSignalBot
 
.  

ViewModels  *
{ 
internal 
class 
RSIViewModel 
:  !
UserControl" -
{ 
public 
ICommand 
AddUserCommand &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
public 
ICommand 
DelUserCommand &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
public 
ICommand 
SetUISymbolCommand *
{+ ,
get- 0
;0 1
set2 5
;5 6
}7 8
public 
ICommand 
AddSymbolCommand (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
public 
ICommand  
AddAllSymbolsCommand ,
{- .
get/ 2
;2 3
set4 7
;7 8
}9 :
public 
ICommand 
DelSymbolCommand (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
public 
ICommand  
AddUserSymbolCommand ,
{- .
get/ 2
;2 3
set4 7
;7 8
}9 :
public   
ICommand    
DelUserSymbolCommand   ,
{  - .
get  / 2
;  2 3
set  4 7
;  7 8
}  9 :
public!! 
ICommand!! 
AddGroupCommand!! '
{!!( )
get!!* -
;!!- .
set!!/ 2
;!!2 3
}!!4 5
public"" 
ICommand"" 
DelGroupCommand"" '
{""( )
get""* -
;""- .
set""/ 2
;""2 3
}""4 5
public## 
ICommand## 
SaveSettingsCommand## +
{##, -
get##. 1
;##1 2
set##3 6
;##6 7
}##8 9
public%% 
RSIModel%% 
Model%% 
{%% 
get%%  #
;%%# $
set%%% (
;%%( )
}%%* +
public'' 
RSIViewModel'' 
('' 
)'' 
{(( 	
Model)) 
=)) 
new)) 
()) 
))) 
;)) 
AddUserCommand++ 
=++ 
new++  
DelegateCommand++! 0
(++0 1
(++1 2
o++2 3
)++3 4
=>++5 7
AddUser++8 ?
(++? @
)++@ A
)++A B
;++B C
DelUserCommand,, 
=,, 
new,,  
DelegateCommand,,! 0
(,,0 1
(,,1 2
o,,2 3
),,3 4
=>,,5 7
DelUser,,8 ?
(,,? @
),,@ A
),,A B
;,,B C
SetUISymbolCommand-- 
=--  
new--! $
DelegateCommand--% 4
(--4 5
(--5 6
o--6 7
)--7 8
=>--9 ;
SetUISymbol--< G
(--G H
)--H I
)--I J
;--J K
AddSymbolCommand.. 
=.. 
new.. "
DelegateCommand..# 2
(..2 3
(..3 4
o..4 5
)..5 6
=>..7 9
	AddSymbol..: C
(..C D
)..D E
)..E F
;..F G 
AddAllSymbolsCommand//  
=//! "
new//# &
DelegateCommand//' 6
(//6 7
(//7 8
o//8 9
)//9 :
=>//; =
AddAllSymbols//> K
(//K L
)//L M
)//M N
;//N O
DelSymbolCommand00 
=00 
new00 "
DelegateCommand00# 2
(002 3
(003 4
o004 5
)005 6
=>007 9
	DelSymbol00: C
(00C D
)00D E
)00E F
;00F G
AddGroupCommand11 
=11 
new11 !
DelegateCommand11" 1
(111 2
(112 3
o113 4
)114 5
=>116 8
AddGroup119 A
(11A B
)11B C
)11C D
;11D E
DelGroupCommand22 
=22 
new22 !
DelegateCommand22" 1
(221 2
(222 3
o223 4
)224 5
=>226 8
DelGroup229 A
(22A B
)22B C
)22C D
;22D E
SaveSettingsCommand33 
=33  !
new33" %
DelegateCommand33& 5
(335 6
(336 7
o337 8
)338 9
=>33: <
SaveSettings33= I
(33I J
)33J K
)33K L
;33L M
foreach55 
(55 
string55 
?55 
symbol55 #
in55$ &
Settings55' /
.55/ 0
BotsSettings550 <
.55< =
RSISettings55= H
.55H I
Symbols55I P
.55P Q
ToList55Q W
(55W X
)55X Y
)55Y Z
{66 
try77 
{88 
Model99 
.99 
Symbols99 !
.99! "
Add99" %
(99% &
new99& )
RSI99* -
(99- .
symbol99. 4
,994 5
Binance996 =
.99= >
Net99> A
.99A B
Enums99B G
.99G H
KlineInterval99H U
.99U V
	OneMinute99V _
,99_ `
(99a b
string99b h
symbol99i o
,99o p

Dictionary99q {
<99{ |
string	99| Ç
,
99Ç É
List
99Ñ à
<
99à â
object
99â è
>
99è ê
>
99ê ë
values
99í ò
)
99ò ô
=>
99ö ú
{
99ù û
}
99ü †
,
99† °
SendSignalMessage
99¢ ≥
)
99≥ ¥
{
99µ ∂
}
99∑ ∏
)
99∏ π
;
99π ∫
}:: 
catch;; 
(;; 
	Exception;;  
ex;;! #
);;# $
{<< 
MessageBoxResult== $
deleteSymbol==% 1
===2 3

MessageBox==4 >
.==> ?
Show==? C
(==C D
$"==D F
{==F G
symbol==G M
}==M N
$str==N s
{==s t
ex==t v
.==v w
Message==w ~
}==~ 
$str	== ï
"
==ï ñ
,
==ñ ó
$str
==ò û
,
==û ü
MessageBoxButton
==† ∞
.
==∞ ±
YesNo
==± ∂
,
==∂ ∑
MessageBoxImage
==∏ «
.
==« »
Error
==» Õ
)
==Õ Œ
;
==Œ œ
if>> 
(>> 
deleteSymbol>> $
==>>% '
MessageBoxResult>>( 8
.>>8 9
Yes>>9 <
)>>< =
{?? 
Settings@@  
.@@  !
BotsSettings@@! -
.@@- .
RSISettings@@. 9
.@@9 :
Symbols@@: A
.@@A B
Remove@@B H
(@@H I
symbol@@I O
)@@O P
;@@P Q
SettingsAA  
.AA  !
SaveSettingsAA! -
(AA- .
)AA. /
;AA/ 0
}BB 
}CC 
}DD 
ModelFF 
.FF 
UISymbolFF 
=FF 
ModelFF "
.FF" #
SymbolsFF# *
.FF* +
CountFF+ 0
>FF1 2
$numFF3 4
?FF5 6
ModelFF7 <
.FF< =
SymbolsFF= D
[FFD E
$numFFE F
]FFF G
.FFG H
SymbolFFH N
:FFO P
$strFFQ S
;FFS T
ModelGG 
.GG 
SymbolsGG 
.GG 
FirstGG 
(GG  
xGG  !
=>GG" $
xGG% &
.GG& '
SymbolGG' -
==GG. 0
ModelGG1 6
.GG6 7
UISymbolGG7 ?
)GG? @
.GG@ A
UpdateActionGGA M
=GGN O
UpdateUIGGP X
;GGX Y
LoadSettingsHH 
(HH 
)HH 
;HH 
}II 	
publicLL 
voidLL 
UpdateUILL 
(LL 
stringLL #
symbolLL$ *
,LL* +

DictionaryLL, 6
<LL6 7
stringLL7 =
,LL= >
ListLL? C
<LLC D
objectLLD J
>LLJ K
>LLK L
ValuesLLM S
)LLS T
{MM 	
ifNN 
(NN 
symbolNN 
!=NN 
ModelNN 
.NN  
UISymbolNN  (
)NN( )
returnNN* 0
;NN0 1
ListPP 
<PP 
KlinePP 
>PP 
?PP 
KlinesPP 
=PP  !
ValuesPP" (
[PP( )
$strPP) 1
]PP1 2
.PP2 3
SelectPP3 9
(PP9 :
xPP: ;
=>PP< >
(PP? @
KlinePP@ E
)PPE F
xPPF G
)PPG H
.PPH I
ToListPPI O
(PPO P
)PPP Q
;PPQ R
UpdateKlinesQQ 
(QQ 
KlinesQQ 
)QQ  
;QQ  !
ListSS 
<SS 
objectSS 
>SS 
?SS 
RSISS 
=SS 
ValuesSS  &
[SS& '
$strSS' ,
]SS, -
.SS- .
ToListSS. 4
(SS4 5
)SS5 6
;SS6 7
UpdateIndicatorsTT 
(TT 
KlinesTT #
,TT# $
RSITT% (
)TT( )
;TT) *
}UU 	
publicWW 
voidWW 
SetUISymbolWW 
(WW  
)WW  !
{XX 	
ifYY 
(YY 
ModelYY 
.YY 
SelectedSymbolYY $
==YY% '
nullYY( ,
)YY, -
returnYY. 4
;YY4 5
ifZZ 
(ZZ 
ModelZZ 
.ZZ 
SelectedSymbolZZ $
.ZZ$ %
SymbolZZ% +
==ZZ, .
ModelZZ/ 4
.ZZ4 5
UISymbolZZ5 =
)ZZ= >
returnZZ? E
;ZZE F
if[[ 
([[ 
Model[[ 
.[[ 
Symbols[[ 
.[[ 
Count[[ #
<[[$ %
$num[[& '
)[[' (
return[[) /
;[[/ 0
if]] 
(]] 
Model]] 
.]] 
Symbols]] 
.]] 
Any]] !
(]]! "
x]]" #
=>]]$ &
x]]' (
.]]( )
Symbol]]) /
==]]0 2
Model]]3 8
.]]8 9
UISymbol]]9 A
)]]A B
)]]B C
{^^ 
Model__ 
.__ 
Symbols__ 
.__ 
First__ #
(__# $
x__$ %
=>__& (
x__) *
.__* +
Symbol__+ 1
==__2 4
Model__5 :
.__: ;
UISymbol__; C
)__C D
.__D E
UpdateAction__E Q
=__R S
(__T U
string__U [
symbol__\ b
,__b c

Dictionary__d n
<__n o
string__o u
,__u v
List__w {
<__{ |
object	__| Ç
>
__Ç É
>
__É Ñ
values
__Ö ã
)
__ã å
=>
__ç è
{
__ê ë
}
__í ì
;
__ì î
}`` 
Modelaa 
.aa !
KlineSeriesCollectionaa '
.aa' (
ToListaa( .
(aa. /
)aa/ 0
.aa0 1
ForEachaa1 8
(aa8 9
xaa9 :
=>aa; =
xaa> ?
.aa? @
Valuesaa@ F
.aaF G
ClearaaG L
(aaL M
)aaM N
)aaN O
;aaO P
Modelbb 
.bb &
IndicatorsSeriesCollectionbb ,
.bb, -
ToListbb- 3
(bb3 4
)bb4 5
.bb5 6
ForEachbb6 =
(bb= >
xbb> ?
=>bb@ B
xbbC D
.bbD E
ValuesbbE K
.bbK L
ClearbbL Q
(bbQ R
)bbR S
)bbS T
;bbT U
Modelcc 
.cc 
UISymbolcc 
=cc 
Modelcc "
.cc" #
SelectedSymbolcc# 1
.cc1 2
Symbolcc2 8
;cc8 9
Modeldd 
.dd 
Symbolsdd 
.dd 
Firstdd 
(dd  
xdd  !
=>dd" $
xdd% &
.dd& '
Symboldd' -
==dd. 0
Modeldd1 6
.dd6 7
UISymboldd7 ?
)dd? @
.dd@ A
UpdateActionddA M
=ddN O
UpdateUIddP X
;ddX Y
Modelee 
.ee 
KlineSeriesee 
.ee 
Titleee #
=ee$ %
Modelee& +
.ee+ ,
UISymbolee, 4
;ee4 5
}ff 	
publichh 
voidhh 
UpdateKlineshh  
(hh  !
IEnumerablehh! ,
<hh, -
Klinehh- 2
>hh2 3
Klineshh4 :
)hh: ;
{ii 	
ifjj 
(jj 
Modeljj 
.jj 
KlineSeriesjj !
.jj! "
Valuesjj" (
.jj( )
Countjj) .
==jj/ 1
$numjj2 3
)jj3 4
{kk 
Modelll 
.ll 
Labelsll 
=ll 
Klinesll %
.ll% &
Selectll& ,
(ll, -
xll- .
=>ll/ 1
xll2 3
.ll3 4
	_OpenDatell4 =
.ll= >
ToStringll> F
(llF G
$strllG M
)llM N
)llN O
.llO P
ToListllP V
(llV W
)llW X
;llX Y
Modelmm 
.mm 
KlineSeriesmm !
.mm! "
Valuesmm" (
.mm( )
AddRangemm) 1
(mm1 2
Klinesmm2 8
.mm8 9
Selectmm9 ?
(mm? @
xmm@ A
=>mmB D
newmmE H
	OhlcPointmmI R
(mmR S
(mmS T
doublemmT Z
)mmZ [
xmm[ \
.mm\ ]
_Openmm] b
,mmb c
(mmd e
doublemme k
)mmk l
xmml m
.mmm n
_Highmmn s
,mms t
(mmu v
doublemmv |
)mm| }
xmm} ~
.mm~ 
_Low	mm É
,
mmÉ Ñ
(
mmÖ Ü
double
mmÜ å
)
mmå ç
x
mmç é
.
mmé è
_Close
mmè ï
)
mmï ñ
)
mmñ ó
.
mmó ò
ToList
mmò û
(
mmû ü
)
mmü †
)
mm† °
;
mm° ¢
returnnn 
;nn 
}oo 
ifqq 
(qq 
Modelqq 
.qq 
Labelsqq 
.qq 
Lastqq !
(qq! "
)qq" #
==qq$ &
Klinesqq' -
.qq- .
Lastqq. 2
(qq2 3
)qq3 4
.qq4 5
	_OpenDateqq5 >
.qq> ?
ToStringqq? G
(qqG H
$strqqH N
)qqN O
)qqO P
{rr 
Kliness 
?ss 
	LastKliness  
=ss! "
Klinesss# )
.ss) *
Lastss* .
(ss. /
)ss/ 0
;ss0 1
	OhlcPointtt 
?tt 
LastChartKlinett )
=tt* +
(tt, -
	OhlcPointtt- 6
?tt6 7
)tt7 8
Modeltt8 =
.tt= >!
KlineSeriesCollectiontt> S
[ttS T
$numttT U
]ttU V
.ttV W
ValuesttW ]
[tt] ^
^tt^ _
$numtt_ `
]tt` a
;tta b
ifvv 
(vv 
LastChartKlinevv "
==vv# %
nullvv& *
)vv* +
returnvv, 2
;vv2 3
LastChartKlineww 
.ww 
Closeww $
=ww% &
(ww' (
doubleww( .
)ww. /
	LastKlineww/ 8
.ww8 9
_Closeww9 ?
;ww? @
ifxx 
(xx 
LastChartKlinexx "
.xx" #
Highxx# '
<xx( )
(xx* +
doublexx+ 1
)xx1 2
	LastKlinexx2 ;
.xx; <
_Highxx< A
)xxA B
LastChartKlinexxC Q
.xxQ R
HighxxR V
=xxW X
(xxY Z
doublexxZ `
)xx` a
	LastKlinexxa j
.xxj k
_Highxxk p
;xxp q
ifyy 
(yy 
LastChartKlineyy "
.yy" #
Lowyy# &
<yy' (
(yy) *
doubleyy* 0
)yy0 1
	LastKlineyy1 :
.yy: ;
_Lowyy; ?
)yy? @
LastChartKlineyyA O
.yyO P
LowyyP S
=yyT U
(yyV W
doubleyyW ]
)yy] ^
	LastKlineyy^ g
.yyg h
_Lowyyh l
;yyl m
returnzz 
;zz 
}{{ 
Model}} 
.}} 
Labels}} 
.}} 
RemoveAt}} !
(}}! "
$num}}" #
)}}# $
;}}$ %
Model~~ 
.~~ !
KlineSeriesCollection~~ '
[~~' (
$num~~( )
]~~) *
.~~* +
Values~~+ 1
.~~1 2
RemoveAt~~2 :
(~~: ;
$num~~; <
)~~< =
;~~= >
Model
ÄÄ 
.
ÄÄ 
Labels
ÄÄ 
.
ÄÄ 
Add
ÄÄ 
(
ÄÄ 
Klines
ÄÄ #
.
ÄÄ# $
Last
ÄÄ$ (
(
ÄÄ( )
)
ÄÄ) *
.
ÄÄ* +
	_OpenDate
ÄÄ+ 4
.
ÄÄ4 5
ToString
ÄÄ5 =
(
ÄÄ= >
$str
ÄÄ> D
)
ÄÄD E
)
ÄÄE F
;
ÄÄF G
Model
ÅÅ 
.
ÅÅ #
KlineSeriesCollection
ÅÅ '
[
ÅÅ' (
$num
ÅÅ( )
]
ÅÅ) *
.
ÅÅ* +
Values
ÅÅ+ 1
.
ÅÅ1 2
Add
ÅÅ2 5
(
ÅÅ5 6
new
ÅÅ6 9
	OhlcPoint
ÅÅ: C
(
ÅÅC D
(
ÅÅD E
double
ÅÅE K
)
ÅÅK L
Klines
ÅÅL R
.
ÅÅR S
Last
ÅÅS W
(
ÅÅW X
)
ÅÅX Y
.
ÅÅY Z
_Open
ÅÅZ _
,
ÅÅ_ `
(
ÅÅa b
double
ÅÅb h
)
ÅÅh i
Klines
ÅÅi o
.
ÅÅo p
Last
ÅÅp t
(
ÅÅt u
)
ÅÅu v
.
ÅÅv w
_High
ÅÅw |
,
ÅÅ| }
(
ÅÅ~ 
doubleÅÅ Ö
)ÅÅÖ Ü
KlinesÅÅÜ å
.ÅÅå ç
LastÅÅç ë
(ÅÅë í
)ÅÅí ì
.ÅÅì î
_LowÅÅî ò
,ÅÅò ô
(ÅÅö õ
doubleÅÅõ °
)ÅÅ° ¢
KlinesÅÅ¢ ®
.ÅÅ® ©
LastÅÅ© ≠
(ÅÅ≠ Æ
)ÅÅÆ Ø
.ÅÅØ ∞
_CloseÅÅ∞ ∂
)ÅÅ∂ ∑
)ÅÅ∑ ∏
;ÅÅ∏ π
}
ÇÇ 	
public
ÑÑ 
void
ÑÑ 
UpdateIndicators
ÑÑ $
(
ÑÑ$ %
IEnumerable
ÑÑ% 0
<
ÑÑ0 1
Kline
ÑÑ1 6
>
ÑÑ6 7
Klines
ÑÑ8 >
,
ÑÑ> ?
IEnumerable
ÑÑ@ K
<
ÑÑK L
object
ÑÑL R
>
ÑÑR S
RSI
ÑÑT W
)
ÑÑW X
{
ÖÖ 	
UpdateIndicator
ÜÜ 
(
ÜÜ 
Klines
ÜÜ "
,
ÜÜ" #
Model
ÜÜ$ )
.
ÜÜ) *
RSI
ÜÜ* -
.
ÜÜ- .
Values
ÜÜ. 4
,
ÜÜ4 5
RSI
ÜÜ6 9
)
ÜÜ9 :
;
ÜÜ: ;
}
áá 	
private
ââ 
void
ââ 
UpdateIndicator
ââ $
(
ââ$ %
IEnumerable
ââ% 0
<
ââ0 1
Kline
ââ1 6
>
ââ6 7
Klines
ââ8 >
,
ââ> ?
IChartValues
ââ@ L
values
ââM S
,
ââS T
IEnumerable
ââU `
<
ââ` a
object
ââa g
>
ââg h
	newValues
ââi r
)
ââr s
{
ää 	
if
ãã 
(
ãã 
values
ãã 
.
ãã 
Count
ãã 
==
ãã 
$num
ãã  !
)
ãã! "
{
åå 
values
çç 
.
çç 
AddRange
çç 
(
çç  
	newValues
çç  )
.
çç) *
Select
çç* 0
(
çç0 1
x
çç1 2
=>
çç3 5
(
çç6 7
object
çç7 =
)
çç= >
Convert
çç> E
.
ççE F
ToDouble
ççF N
(
ççN O
x
ççO P
)
ççP Q
)
ççQ R
)
ççR S
;
ççS T
return
éé 
;
éé 
}
èè 
if
ëë 
(
ëë 
Model
ëë 
.
ëë 
Labels
ëë 
.
ëë 
Last
ëë !
(
ëë! "
)
ëë" #
==
ëë$ &
Klines
ëë' -
.
ëë- .
Last
ëë. 2
(
ëë2 3
)
ëë3 4
.
ëë4 5
	_OpenDate
ëë5 >
.
ëë> ?
ToString
ëë? G
(
ëëG H
$str
ëëH N
)
ëëN O
)
ëëO P
{
íí 
values
ìì 
[
ìì 
^
ìì 
$num
ìì 
]
ìì 
=
ìì 
	newValues
ìì &
.
ìì& '
Last
ìì' +
(
ìì+ ,
)
ìì, -
;
ìì- .
return
îî 
;
îî 
}
ïï 
values
óó 
.
óó 
Add
óó 
(
óó 
	newValues
óó  
.
óó  !
Last
óó! %
(
óó% &
)
óó& '
)
óó' (
;
óó( )
}
òò 	
public
úú 
void
úú -
UserSymbolsListSelectionChanged
úú 3
(
úú3 4
)
úú4 5
{
ùù 	
Model
ûû 
.
ûû !
AddUserSymbolString
ûû %
=
ûû& '
Model
ûû( -
.
ûû- . 
SelectedUserSymbol
ûû. @
?
ûû@ A
.
ûûA B
Key
ûûB E
;
ûûE F
}
üü 	
public
°° 
void
°° 
AddUser
°° 
(
°° 
)
°° 
{
¢¢ 	
try
££ 
{
§§ 
if
•• 
(
•• 
!
•• 

Connection
•• 
.
••  
Context
••  '
.
••' (
Users
••( -
.
••- .
Any
••. 1
(
••1 2
x
••2 3
=>
••4 6
x
••7 8
.
••8 9
Username
••9 A
==
••B D
Model
••E J
.
••J K
AddUserString
••K X
)
••X Y
)
••Y Z
{
¶¶ 

Connection
ßß 
.
ßß 
Context
ßß &
.
ßß& '
Add
ßß' *
(
ßß* +
new
ßß+ .
User
ßß/ 3
(
ßß3 4
)
ßß4 5
{
ßß6 7
Username
ßß8 @
=
ßßA B
Model
ßßC H
.
ßßH I
AddUserString
ßßI V
??
ßßW Y
$str
ßßZ \
,
ßß\ ]
TDI
ßß^ a
=
ßßb c
false
ßßd i
,
ßßi j
TDISymbolValues
ßßk z
=
ßß{ |
$strßß} Å
,ßßÅ Ç
NewsßßÉ á
=ßßà â
falseßßä è
}ßßê ë
)ßßë í
;ßßí ì

Connection
®® 
.
®® 
Context
®® &
.
®®& '
SaveChanges
®®' 2
(
®®2 3
)
®®3 4
;
®®4 5

MessageBox
©© 
.
©© 
Show
©© #
(
©©# $
$str
©©$ B
,
©©B C
$str
©©D W
,
©©W X
MessageBoxButton
©©Y i
.
©©i j
OK
©©j l
)
©©l m
;
©©m n
}
™™ 
else
´´ 
{
¨¨ 
User
≠≠ 
user
≠≠ 
=
≠≠ 

Connection
≠≠  *
.
≠≠* +
Context
≠≠+ 2
.
≠≠2 3
Users
≠≠3 8
.
≠≠8 9
First
≠≠9 >
(
≠≠> ?
x
≠≠? @
=>
≠≠A C
x
≠≠D E
.
≠≠E F
Username
≠≠F N
==
≠≠O Q
Model
≠≠R W
.
≠≠W X
AddUserString
≠≠X e
)
≠≠e f
;
≠≠f g
Model
ÆÆ 
.
ÆÆ 
SelectedUser
ÆÆ &
=
ÆÆ' (
user
ÆÆ) -
;
ÆÆ- .
}
ØØ 
}
∞∞ 
catch
±± 
(
±± 
	Exception
±± 
ex
±± 
)
±±  
{
≤≤ 

MessageBox
≥≥ 
.
≥≥ 
Show
≥≥ 
(
≥≥  
$"
≥≥  "
$str
≥≥" ;
{
≥≥; <
ex
≥≥< >
.
≥≥> ?
Message
≥≥? F
}
≥≥F G
"
≥≥G H
,
≥≥H I
$str
≥≥J P
,
≥≥P Q
MessageBoxButton
≥≥R b
.
≥≥b c
OK
≥≥c e
,
≥≥e f
MessageBoxImage
≥≥g v
.
≥≥v w
Error
≥≥w |
)
≥≥| }
;
≥≥} ~
}
¥¥ 
}
µµ 	
public
∑∑ 
void
∑∑ 
DelUser
∑∑ 
(
∑∑ 
)
∑∑ 
{
∏∏ 	
try
ππ 
{
∫∫ 
if
ªª 
(
ªª 
Model
ªª 
.
ªª 
SelectedUser
ªª &
==
ªª' )
null
ªª* .
)
ªª. /
return
ªª0 6
;
ªª6 7

Connection
ºº 
.
ºº 
Context
ºº "
.
ºº" #
DelUser
ºº# *
(
ºº* +
Model
ºº+ 0
.
ºº0 1
SelectedUser
ºº1 =
)
ºº= >
;
ºº> ?

Connection
ΩΩ 
.
ΩΩ 
Context
ΩΩ "
.
ΩΩ" #
SaveChanges
ΩΩ# .
(
ΩΩ. /
)
ΩΩ/ 0
;
ΩΩ0 1

MessageBox
øø 
.
øø 
Show
øø 
(
øø  
$str
øø  >
,
øø> ?
$str
øø@ S
,
øøS T
MessageBoxButton
øøU e
.
øøe f
OK
øøf h
)
øøh i
;
øøi j
}
¿¿ 
catch
¡¡ 
(
¡¡ 
	Exception
¡¡ 
ex
¡¡ 
)
¡¡  
{
¬¬ 

MessageBox
√√ 
.
√√ 
Show
√√ 
(
√√  
$"
√√  "
$str
√√" ;
{
√√; <
ex
√√< >
.
√√> ?
Message
√√? F
}
√√F G
"
√√G H
,
√√H I
$str
√√J P
,
√√P Q
MessageBoxButton
√√R b
.
√√b c
OK
√√c e
,
√√e f
MessageBoxImage
√√g v
.
√√v w
Error
√√w |
)
√√| }
;
√√} ~
}
ƒƒ 
}
≈≈ 	
public
«« 
void
«« 
AddGroup
«« 
(
«« 
)
«« 
{
»» 	
if
…… 
(
…… 
string
…… 
.
…… 
IsNullOrEmpty
…… $
(
……$ %
Model
……% *
.
……* +
AddGroupString
……+ 9
)
……9 :
)
……: ;
return
……< B
;
……B C
Settings
   
.
   
TelegramSettings
   %
.
  % &
	RSIGroups
  & /
.
  / 0
Add
  0 3
(
  3 4
Model
  4 9
.
  9 :
AddGroupString
  : H
)
  H I
;
  I J
Settings
ÀÀ 
.
ÀÀ 
SaveSettings
ÀÀ !
(
ÀÀ! "
)
ÀÀ" #
;
ÀÀ# $

MessageBox
ÃÃ 
.
ÃÃ 
Show
ÃÃ 
(
ÃÃ 
$str
ÃÃ 4
,
ÃÃ4 5
$str
ÃÃ6 D
,
ÃÃD E
MessageBoxButton
ÃÃF V
.
ÃÃV W
OK
ÃÃW Y
)
ÃÃY Z
;
ÃÃZ [
}
ÕÕ 	
public
œœ 
void
œœ 
DelGroup
œœ 
(
œœ 
)
œœ 
{
–– 	
Settings
—— 
.
—— 
TelegramSettings
—— %
.
——% &
	RSIGroups
——& /
.
——/ 0
Remove
——0 6
(
——6 7
Model
——7 <
.
——< =
SelectedGroup
——= J
??
——K M
$str
——N P
)
——P Q
;
——Q R
Settings
““ 
.
““ 
SaveSettings
““ !
(
““! "
)
““" #
;
““# $

MessageBox
”” 
.
”” 
Show
”” 
(
”” 
$str
”” 4
,
””4 5
$str
””6 D
,
””D E
MessageBoxButton
””F V
.
””V W
OK
””W Y
)
””Y Z
;
””Z [
}
‘‘ 	
public
ÿÿ 
void
ÿÿ 
	DelSymbol
ÿÿ 
(
ÿÿ 
)
ÿÿ 
{
ŸŸ 	
if
⁄⁄ 
(
⁄⁄ 
Model
⁄⁄ 
.
⁄⁄ 
SelectedSymbol
⁄⁄ $
==
⁄⁄% '
null
⁄⁄( ,
)
⁄⁄, -
return
⁄⁄. 4
;
⁄⁄4 5
string
€€ 
?
€€ 
symbol
€€ 
=
€€ 
Model
€€ "
.
€€" #
SelectedSymbol
€€# 1
.
€€1 2
Symbol
€€2 8
;
€€8 9
Settings
›› 
.
›› 
BotsSettings
›› !
.
››! "
RSISettings
››" -
.
››- .
Symbols
››. 5
.
››5 6
Remove
››6 <
(
››< =
Model
››= B
.
››B C
SelectedSymbol
››C Q
.
››Q R
Symbol
››R X
)
››X Y
;
››Y Z
Model
ﬁﬁ 
.
ﬁﬁ 
SelectedSymbol
ﬁﬁ  
.
ﬁﬁ  !
Dispose
ﬁﬁ! (
(
ﬁﬁ( )
)
ﬁﬁ) *
;
ﬁﬁ* +
Settings
‡‡ 
.
‡‡ 
BotsSettings
‡‡ !
.
‡‡! "
RSISettings
‡‡" -
.
‡‡- .
Symbols
‡‡. 5
.
‡‡5 6
Remove
‡‡6 <
(
‡‡< =
Model
‡‡= B
.
‡‡B C
SelectedSymbol
‡‡C Q
.
‡‡Q R
Symbol
‡‡R X
)
‡‡X Y
;
‡‡Y Z
Settings
·· 
.
·· 
SaveSettings
·· !
(
··! "
)
··" #
;
··# $
Model
„„ 
.
„„ 
Symbols
„„ 
.
„„ 
Remove
„„  
(
„„  !
Model
„„! &
.
„„& '
SelectedSymbol
„„' 5
)
„„5 6
;
„„6 7
if
ÊÊ 
(
ÊÊ 
Model
ÊÊ 
.
ÊÊ 
UISymbol
ÊÊ 
==
ÊÊ !
symbol
ÊÊ" (
&&
ÊÊ) +
Model
ÊÊ, 1
.
ÊÊ1 2
Symbols
ÊÊ2 9
.
ÊÊ9 :
Count
ÊÊ: ?
>
ÊÊ@ A
$num
ÊÊB C
)
ÊÊC D
{
ÁÁ 
Model
ËË 
.
ËË 
SelectedSymbol
ËË $
=
ËË% &
Model
ËË' ,
.
ËË, -
Symbols
ËË- 4
[
ËË4 5
$num
ËË5 6
]
ËË6 7
;
ËË7 8
SetUISymbol
ÈÈ 
(
ÈÈ 
)
ÈÈ 
;
ÈÈ 
}
ÍÍ 
}
ÎÎ 	
public
ÌÌ 
void
ÌÌ 
	AddSymbol
ÌÌ 
(
ÌÌ 
)
ÌÌ 
{
ÓÓ 	
try
ÔÔ 
{
 
if
ÒÒ 
(
ÒÒ 
Model
ÒÒ 
.
ÒÒ 
Symbols
ÒÒ !
.
ÒÒ! "
Any
ÒÒ" %
(
ÒÒ% &
x
ÒÒ& '
=>
ÒÒ( *
x
ÒÒ+ ,
.
ÒÒ, -
Symbol
ÒÒ- 3
==
ÒÒ4 6
Model
ÒÒ7 <
.
ÒÒ< =
AddSymbolString
ÒÒ= L
)
ÒÒL M
)
ÒÒM N
{
ÚÚ 

MessageBox
ÛÛ 
.
ÛÛ 
Show
ÛÛ #
(
ÛÛ# $
$str
ÛÛ$ =
,
ÛÛ= >
$str
ÛÛ? N
,
ÛÛN O
MessageBoxButton
ÛÛP `
.
ÛÛ` a
OK
ÛÛa c
,
ÛÛc d
MessageBoxImage
ÛÛe t
.
ÛÛt u
InformationÛÛu Ä
)ÛÛÄ Å
;ÛÛÅ Ç
return
ÙÙ 
;
ÙÙ 
}
ıı 

_AddSymbol
˜˜ 
(
˜˜ 
Model
˜˜  
.
˜˜  !
AddSymbolString
˜˜! 0
??
˜˜1 3
$str
˜˜4 6
)
˜˜6 7
;
˜˜7 8

MessageBox
¯¯ 
.
¯¯ 
Show
¯¯ 
(
¯¯  
$str
¯¯  ;
,
¯¯; <
$str
¯¯= M
,
¯¯M N
MessageBoxButton
¯¯O _
.
¯¯_ `
OK
¯¯` b
)
¯¯b c
;
¯¯c d
}
˘˘ 
catch
˙˙ 
(
˙˙ 
	Exception
˙˙ 
ex
˙˙ 
)
˙˙  
{
˚˚ 

MessageBox
¸¸ 
.
¸¸ 
Show
¸¸ 
(
¸¸  
$"
¸¸  "
$str
¸¸" ;
{
¸¸; <
ex
¸¸< >
.
¸¸> ?
Message
¸¸? F
}
¸¸F G
"
¸¸G H
,
¸¸H I
$str
¸¸J P
,
¸¸P Q
MessageBoxButton
¸¸R b
.
¸¸b c
OK
¸¸c e
,
¸¸e f
MessageBoxImage
¸¸g v
.
¸¸v w
Error
¸¸w |
)
¸¸| }
;
¸¸} ~
}
˝˝ 
}
˛˛ 	
private
ÄÄ 
void
ÄÄ 

_AddSymbol
ÄÄ 
(
ÄÄ  
string
ÄÄ  &
symbol
ÄÄ' -
)
ÄÄ- .
{
ÅÅ 	
Model
ÇÇ 
.
ÇÇ 
Symbols
ÇÇ 
.
ÇÇ 
Add
ÇÇ 
(
ÇÇ 
new
ÇÇ !
RSI
ÇÇ" %
(
ÇÇ% &
symbol
ÇÇ& ,
,
ÇÇ, -
Binance
ÇÇ. 5
.
ÇÇ5 6
Net
ÇÇ6 9
.
ÇÇ9 :
Enums
ÇÇ: ?
.
ÇÇ? @
KlineInterval
ÇÇ@ M
.
ÇÇM N
	OneMinute
ÇÇN W
,
ÇÇW X
(
ÇÇY Z
string
ÇÇZ `
symbol
ÇÇa g
,
ÇÇg h

Dictionary
ÇÇi s
<
ÇÇs t
string
ÇÇt z
,
ÇÇz {
ListÇÇ| Ä
<ÇÇÄ Å
objectÇÇÅ á
>ÇÇá à
>ÇÇà â
valuesÇÇä ê
)ÇÇê ë
=>ÇÇí î
{ÇÇï ñ
}ÇÇó ò
,ÇÇò ô!
SendSignalMessageÇÇö ´
)ÇÇ´ ¨
{ÇÇ≠ Æ
}ÇÇØ ∞
)ÇÇ∞ ±
;ÇÇ± ≤
Settings
ÉÉ 
.
ÉÉ 
BotsSettings
ÉÉ !
.
ÉÉ! "
RSISettings
ÉÉ" -
.
ÉÉ- .
Symbols
ÉÉ. 5
.
ÉÉ5 6
Add
ÉÉ6 9
(
ÉÉ9 :
symbol
ÉÉ: @
)
ÉÉ@ A
;
ÉÉA B
Settings
ÑÑ 
.
ÑÑ 
SaveSettings
ÑÑ !
(
ÑÑ! "
)
ÑÑ" #
;
ÑÑ# $
}
ÖÖ 	
public
áá 
Task
áá 
AddAllSymbols
áá !
(
áá! "
)
áá" #
{
àà 	
CryptoExchange
ââ 
.
ââ 
Net
ââ 
.
ââ 
Objects
ââ &
.
ââ& '
WebCallResult
ââ' 4
<
ââ4 5
Binance
ââ5 <
.
ââ< =
Net
ââ= @
.
ââ@ A
Objects
ââA H
.
ââH I
Models
ââI O
.
ââO P
Spot
ââP T
.
ââT U!
BinanceExchangeInfo
ââU h
>
ââh i
?
ââi j
exchangeInfos
ââk x
=
âây z
StaticBinanceââ{ à
.ââà â
Clientâââ è
.ââè ê
SpotApiââê ó
.ââó ò
ExchangeDataââò §
.ââ§ •$
GetExchangeInfoAsyncââ• π
(ââπ ∫
)ââ∫ ª
.ââª º
Resultââº ¬
;ââ¬ √
Model
ää 
.
ää 
Symbols
ää 
.
ää 
Clear
ää 
(
ää  
)
ää  !
;
ää! "
Settings
ãã 
.
ãã 
BotsSettings
ãã !
.
ãã! "
RSISettings
ãã" -
.
ãã- .
Symbols
ãã. 5
.
ãã5 6
Clear
ãã6 ;
(
ãã; <
)
ãã< =
;
ãã= >
exchangeInfos
åå 
.
åå 
Data
åå 
.
åå 
Symbols
åå &
.
åå& '
ToList
åå' -
(
åå- .
)
åå. /
.
åå/ 0
ForEach
åå0 7
(
åå7 8
x
åå8 9
=>
åå: <
{
çç 
try
éé 
{
èè 

_AddSymbol
êê 
(
êê 
x
êê  
.
êê  !
Name
êê! %
)
êê% &
;
êê& '
}
ëë 
catch
íí 
(
íí 
	Exception
íí  
ex
íí! #
)
íí# $
{
ìì 

MessageBox
îî 
.
îî 
Show
îî #
(
îî# $
$"
îî$ &
{
îî& '
x
îî' (
.
îî( )
Name
îî) -
}
îî- .
$str
îî. S
{
îîS T
ex
îîT V
.
îîV W
Message
îîW ^
}
îî^ _
"
îî_ `
,
îî` a
$str
îîb h
,
îîh i
MessageBoxButton
îîj z
.
îîz {
OK
îî{ }
,
îî} ~
MessageBoxImageîî é
.îîé è
Errorîîè î
)îîî ï
;îîï ñ
}
ïï 
}
ññ 
)
ññ 
;
ññ 
return
òò 
Task
òò 
.
òò 
Delay
òò 
(
òò 
$num
òò 
)
òò  
;
òò  !
}
ôô 	
public
ùù 
void
ùù 
SendSignalMessage
ùù %
(
ùù% &
string
ùù& ,
symbol
ùù- 3
,
ùù3 4
Enums
ùù5 :
.
ùù: ;

SignalType
ùù; E
type
ùùF J
)
ùùJ K
{
ûû 	
string
üü 
message
üü 
=
üü 
type
üü !
switch
üü" (
{
†† 
Enums
°° 
.
°° 

SignalType
°°  
.
°°  !
	UpperLine
°°! *
=>
°°+ -
Settings
°°. 6
.
°°6 7
BotsSettings
°°7 C
.
°°C D
RSISettings
°°D O
.
°°O P
SignalMessages
°°P ^
.
°°^ _

Overbought
°°_ i
,
°°i j
Enums
¢¢ 
.
¢¢ 

SignalType
¢¢  
.
¢¢  !
	UnderLine
¢¢! *
=>
¢¢+ -
Settings
¢¢. 6
.
¢¢6 7
BotsSettings
¢¢7 C
.
¢¢C D
RSISettings
¢¢D O
.
¢¢O P
SignalMessages
¢¢P ^
.
¢¢^ _
Oversold
¢¢_ g
,
¢¢g h
Enums
££ 
.
££ 

SignalType
££  
.
££  !
BetweenLines
££! -
=>
££. 0
Settings
££1 9
.
££9 :
BotsSettings
££: F
.
££F G
RSISettings
££G R
.
££R S
SignalMessages
££S a
.
££a b
BetweenLevels
££b o
,
££o p
_
§§ 
=>
§§ 
$str
§§ 
,
§§ 
}
•• 
;
•• 
if
ßß 
(
ßß 
string
ßß 
.
ßß 
IsNullOrEmpty
ßß $
(
ßß$ %
message
ßß% ,
)
ßß, -
)
ßß- .
return
ßß/ 5
;
ßß5 6
message
®® 
=
®® 
message
®® 
.
®® 
Replace
®® %
(
®®% &
$str
®®& 0
,
®®0 1
symbol
®®2 8
)
®®8 9
;
®®9 :
foreach
™™ 
(
™™ 
User
™™ 
user
™™ 
in
™™ !
Model
™™" '
.
™™' (
Users
™™( -
)
™™- .
{
´´ 
try
¨¨ 
{
≠≠ 
if
ÆÆ 
(
ÆÆ 
user
ÆÆ 
.
ÆÆ 
ChatId
ÆÆ #
==
ÆÆ$ &
$num
ÆÆ' (
)
ÆÆ( )
continue
ÆÆ* 2
;
ÆÆ2 3

BotClients
ØØ 
.
ØØ 
	RSIClient
ØØ (
.
ØØ( )"
SendTextMessageAsync
ØØ) =
(
ØØ= >
user
ØØ> B
.
ØØB C
ChatId
ØØC I
,
ØØI J
message
ØØK R
)
ØØR S
;
ØØS T
}
∞∞ 
catch
±± 
(
±± 
	Exception
±±  
ex
±±! #
)
±±# $
{
≤≤ 
Console
≥≥ 
.
≥≥ 
	WriteLine
≥≥ %
(
≥≥% &
$"
≥≥& (
$str
≥≥( 9
{
≥≥9 :
user
≥≥: >
.
≥≥> ?
Username
≥≥? G
}
≥≥G H
$str
≥≥H c
{
≥≥c d
ex
≥≥d f
.
≥≥f g
Message
≥≥g n
}
≥≥n o
"
≥≥o p
)
≥≥p q
;
≥≥q r
}
¥¥ 
}
∂∂ 
foreach
∏∏ 
(
∏∏ 
string
∏∏ 
?
∏∏ 
group
∏∏ "
in
∏∏# %
Settings
∏∏& .
.
∏∏. /
TelegramSettings
∏∏/ ?
.
∏∏? @
	RSIGroups
∏∏@ I
)
∏∏I J
{
ππ 
try
∫∫ 
{
ªª 

BotClients
ºº 
.
ºº 
	RSIClient
ºº (
.
ºº( )"
SendTextMessageAsync
ºº) =
(
ºº= >
group
ºº> C
,
ººC D
message
ººE L
)
ººL M
;
ººM N
}
ΩΩ 
catch
ææ 
(
ææ 
	Exception
ææ  
ex
ææ! #
)
ææ# $
{
øø 
Console
¿¿ 
.
¿¿ 
	WriteLine
¿¿ %
(
¿¿% &
$"
¿¿& (
$str
¿¿( 8
{
¿¿8 9
group
¿¿9 >
}
¿¿> ?
$str
¿¿? Z
{
¿¿Z [
ex
¿¿[ ]
.
¿¿] ^
Message
¿¿^ e
}
¿¿e f
"
¿¿f g
)
¿¿g h
;
¿¿h i
}
¡¡ 
}
¬¬ 
}
√√ 	
public
«« 
void
«« 
SaveSettings
««  
(
««  !
)
««! "
{
»» 	
Settings
…… 
.
…… 
BotsSettings
…… !
.
……! "
RSISettings
……" -
.
……- .
SignalMessages
……. <
.
……< =
Oversold
……= E
=
……F G
Model
……H M
.
……M N"
OversoldSignalString
……N b
;
……b c
Settings
   
.
   
BotsSettings
   !
.
  ! "
RSISettings
  " -
.
  - .
SignalMessages
  . <
.
  < =

Overbought
  = G
=
  H I
Model
  J O
.
  O P$
OverboughtSignalString
  P f
;
  f g
Settings
ÀÀ 
.
ÀÀ 
BotsSettings
ÀÀ !
.
ÀÀ! "
RSISettings
ÀÀ" -
.
ÀÀ- .
SignalMessages
ÀÀ. <
.
ÀÀ< =
BetweenLevels
ÀÀ= J
=
ÀÀK L
Model
ÀÀM R
.
ÀÀR S'
BetweenLevelsSignalString
ÀÀS l
;
ÀÀl m
Settings
ÕÕ 
.
ÕÕ 
BotsSettings
ÕÕ !
.
ÕÕ! "
RSISettings
ÕÕ" -
.
ÕÕ- .
	RSIPeriot
ÕÕ. 7
=
ÕÕ8 9
Model
ÕÕ: ?
.
ÕÕ? @
	RSIPeriot
ÕÕ@ I
;
ÕÕI J
Settings
ŒŒ 
.
ŒŒ 
BotsSettings
ŒŒ !
.
ŒŒ! "
RSISettings
ŒŒ" -
.
ŒŒ- .
RSIOversoldLevel
ŒŒ. >
=
ŒŒ? @
Model
ŒŒA F
.
ŒŒF G
RSIOversoldLevel
ŒŒG W
;
ŒŒW X
Settings
œœ 
.
œœ 
BotsSettings
œœ !
.
œœ! "
RSISettings
œœ" -
.
œœ- . 
RSIOverboughtLevet
œœ. @
=
œœA B
Model
œœC H
.
œœH I 
RSIOverboughtLevel
œœI [
;
œœ[ \
Settings
—— 
.
—— 
SaveSettings
—— !
(
——! "
)
——" #
;
——# $

MessageBox
”” 
.
”” 
Show
”” 
(
”” 
$str
”” ;
,
””; <
$str
””= Q
,
””Q R
MessageBoxButton
””S c
.
””c d
OK
””d f
)
””f g
;
””g h
}
‘‘ 	
public
÷÷ 
void
÷÷ 
LoadSettings
÷÷  
(
÷÷  !
)
÷÷! "
{
◊◊ 	
Model
ÿÿ 
.
ÿÿ $
OverboughtSignalString
ÿÿ (
=
ÿÿ) *
Settings
ÿÿ+ 3
.
ÿÿ3 4
BotsSettings
ÿÿ4 @
.
ÿÿ@ A
RSISettings
ÿÿA L
.
ÿÿL M
SignalMessages
ÿÿM [
.
ÿÿ[ \

Overbought
ÿÿ\ f
;
ÿÿf g
Model
ŸŸ 
.
ŸŸ "
OversoldSignalString
ŸŸ &
=
ŸŸ' (
Settings
ŸŸ) 1
.
ŸŸ1 2
BotsSettings
ŸŸ2 >
.
ŸŸ> ?
RSISettings
ŸŸ? J
.
ŸŸJ K
SignalMessages
ŸŸK Y
.
ŸŸY Z
Oversold
ŸŸZ b
;
ŸŸb c
Model
⁄⁄ 
.
⁄⁄ '
BetweenLevelsSignalString
⁄⁄ +
=
⁄⁄, -
Settings
⁄⁄. 6
.
⁄⁄6 7
BotsSettings
⁄⁄7 C
.
⁄⁄C D
RSISettings
⁄⁄D O
.
⁄⁄O P
SignalMessages
⁄⁄P ^
.
⁄⁄^ _
BetweenLevels
⁄⁄_ l
;
⁄⁄l m
Model
‹‹ 
.
‹‹ 
	RSIPeriot
‹‹ 
=
‹‹ 
Settings
‹‹ &
.
‹‹& '
BotsSettings
‹‹' 3
.
‹‹3 4
RSISettings
‹‹4 ?
.
‹‹? @
	RSIPeriot
‹‹@ I
;
‹‹I J
Model
›› 
.
›› 
RSIOversoldLevel
›› "
=
››# $
Settings
››% -
.
››- .
BotsSettings
››. :
.
››: ;
RSISettings
››; F
.
››F G
RSIOversoldLevel
››G W
;
››W X
Model
ﬁﬁ 
.
ﬁﬁ  
RSIOverboughtLevel
ﬁﬁ $
=
ﬁﬁ% &
Settings
ﬁﬁ' /
.
ﬁﬁ/ 0
BotsSettings
ﬁﬁ0 <
.
ﬁﬁ< =
RSISettings
ﬁﬁ= H
.
ﬁﬁH I 
RSIOverboughtLevet
ﬁﬁI [
;
ﬁﬁ[ \
}
ﬂﬂ 	
}
·· 
}‚‚ ¬”
vC:\Users\√ñmer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\UI\ViewModels\TDIViewModel.cs
	namespace 	!
EASYTelegramSignalBot
 
.  

ViewModels  *
{ 
internal 
class 
TDIViewModel 
:  !
UserControl" -
{ 
public 
ICommand 
AddUserCommand &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
public 
ICommand 
DelUserCommand &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
public 
ICommand 
SetUISymbolCommand *
{+ ,
get- 0
;0 1
set2 5
;5 6
}7 8
public 
ICommand 
AddSymbolCommand (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
public 
ICommand  
AddAllSymbolsCommand ,
{- .
get/ 2
;2 3
set4 7
;7 8
}9 :
public 
ICommand 
DelSymbolCommand (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
public 
ICommand  
AddUserSymbolCommand ,
{- .
get/ 2
;2 3
set4 7
;7 8
}9 :
public   
ICommand    
DelUserSymbolCommand   ,
{  - .
get  / 2
;  2 3
set  4 7
;  7 8
}  9 :
public!! 
ICommand!! 
AddGroupCommand!! '
{!!( )
get!!* -
;!!- .
set!!/ 2
;!!2 3
}!!4 5
public"" 
ICommand"" 
DelGroupCommand"" '
{""( )
get""* -
;""- .
set""/ 2
;""2 3
}""4 5
public## 
ICommand## 
SaveSettingsCommand## +
{##, -
get##. 1
;##1 2
set##3 6
;##6 7
}##8 9
public%% 
TDIModel%% 
Model%% 
{%% 
get%%  #
;%%# $
set%%% (
;%%( )
}%%* +
public'' 
TDIViewModel'' 
('' 
)'' 
{(( 	
Model)) 
=)) 
new)) 
()) 
))) 
;)) 
AddUserCommand++ 
=++ 
new++  
DelegateCommand++! 0
(++0 1
(++1 2
o++2 3
)++3 4
=>++5 7
AddUser++8 ?
(++? @
)++@ A
)++A B
;++B C
DelUserCommand,, 
=,, 
new,,  
DelegateCommand,,! 0
(,,0 1
(,,1 2
o,,2 3
),,3 4
=>,,5 7
DelUser,,8 ?
(,,? @
),,@ A
),,A B
;,,B C
SetUISymbolCommand-- 
=--  
new--! $
DelegateCommand--% 4
(--4 5
(--5 6
o--6 7
)--7 8
=>--9 ;
SetUISymbol--< G
(--G H
)--H I
)--I J
;--J K
AddSymbolCommand.. 
=.. 
new.. "
DelegateCommand..# 2
(..2 3
(..3 4
o..4 5
)..5 6
=>..7 9
	AddSymbol..: C
(..C D
)..D E
)..E F
;..F G 
AddAllSymbolsCommand//  
=//! "
new//# &
DelegateCommand//' 6
(//6 7
(//7 8
o//8 9
)//9 :
=>//; =
AddAllSymbols//> K
(//K L
)//L M
)//M N
;//N O
DelSymbolCommand00 
=00 
new00 "
DelegateCommand00# 2
(002 3
(003 4
o004 5
)005 6
=>007 9
	DelSymbol00: C
(00C D
)00D E
)00E F
;00F G 
AddUserSymbolCommand11  
=11! "
new11# &
DelegateCommand11' 6
(116 7
(117 8
o118 9
)119 :
=>11; =
AddUserSymbol11> K
(11K L
)11L M
)11M N
;11N O 
DelUserSymbolCommand22  
=22! "
new22# &
DelegateCommand22' 6
(226 7
(227 8
o228 9
)229 :
=>22; =
DelUserSymbol22> K
(22K L
)22L M
)22M N
;22N O
AddGroupCommand33 
=33 
new33 !
DelegateCommand33" 1
(331 2
(332 3
o333 4
)334 5
=>336 8
AddGroup339 A
(33A B
)33B C
)33C D
;33D E
DelGroupCommand44 
=44 
new44 !
DelegateCommand44" 1
(441 2
(442 3
o443 4
)444 5
=>446 8
DelGroup449 A
(44A B
)44B C
)44C D
;44D E
SaveSettingsCommand55 
=55  !
new55" %
DelegateCommand55& 5
(555 6
(556 7
o557 8
)558 9
=>55: <
SaveSettings55= I
(55I J
)55J K
)55K L
;55L M
foreach77 
(77 
string77 
?77 
symbol77 #
in77$ &
Settings77' /
.77/ 0
BotsSettings770 <
.77< =
TDISettings77= H
.77H I
Symbols77I P
.77P Q
ToList77Q W
(77W X
)77X Y
)77Y Z
{88 
try99 
{:: 
Model;; 
.;; 
Symbols;; !
.;;! "
Add;;" %
(;;% &
new;;& )
TDI;;* -
(;;- .
symbol;;. 4
,;;4 5
Binance;;6 =
.;;= >
Net;;> A
.;;A B
Enums;;B G
.;;G H
KlineInterval;;H U
.;;U V
	OneMinute;;V _
,;;_ `
(;;a b
string;;b h
symbol;;i o
,;;o p

Dictionary;;q {
<;;{ |
string	;;| Ç
,
;;Ç É
List
;;Ñ à
<
;;à â
object
;;â è
>
;;è ê
>
;;ê ë
values
;;í ò
)
;;ò ô
=>
;;ö ú
{
;;ù û
}
;;ü †
,
;;† °
SendSignalMessage
;;¢ ≥
)
;;≥ ¥
{
;;µ ∂
}
;;∑ ∏
)
;;∏ π
;
;;π ∫
}<< 
catch== 
(== 
	Exception==  
ex==! #
)==# $
{>> 
MessageBoxResult?? $
deleteSymbol??% 1
=??2 3

MessageBox??4 >
.??> ?
Show??? C
(??C D
$"??D F
{??F G
symbol??G M
}??M N
$str??N s
{??s t
ex??t v
.??v w
Message??w ~
}??~ 
$str	?? ï
"
??ï ñ
,
??ñ ó
$str
??ò û
,
??û ü
MessageBoxButton
??† ∞
.
??∞ ±
YesNo
??± ∂
,
??∂ ∑
MessageBoxImage
??∏ «
.
??« »
Error
??» Õ
)
??Õ Œ
;
??Œ œ
if@@ 
(@@ 
deleteSymbol@@ $
==@@% '
MessageBoxResult@@( 8
.@@8 9
Yes@@9 <
)@@< =
{AA 
SettingsBB  
.BB  !
BotsSettingsBB! -
.BB- .
TDISettingsBB. 9
.BB9 :
SymbolsBB: A
.BBA B
RemoveBBB H
(BBH I
symbolBBI O
)BBO P
;BBP Q
SettingsCC  
.CC  !
SaveSettingsCC! -
(CC- .
)CC. /
;CC/ 0
}DD 
}EE 
}FF 
ModelHH 
.HH 
UISymbolHH 
=HH 
ModelHH "
.HH" #
SymbolsHH# *
.HH* +
CountHH+ 0
>HH1 2
$numHH3 4
?HH5 6
ModelHH7 <
.HH< =
SymbolsHH= D
[HHD E
$numHHE F
]HHF G
.HHG H
SymbolHHH N
:HHO P
$strHHQ S
;HHS T
ModelII 
.II 
SymbolsII 
.II 
FirstII 
(II  
xII  !
=>II" $
xII% &
.II& '
SymbolII' -
==II. 0
ModelII1 6
.II6 7
UISymbolII7 ?
)II? @
.II@ A
UpdateActionIIA M
=IIN O
UpdateUIIIP X
;IIX Y
LoadSettingsJJ 
(JJ 
)JJ 
;JJ 
}KK 	
publicNN 
voidNN 
UpdateUINN 
(NN 
stringNN #
symbolNN$ *
,NN* +

DictionaryNN, 6
<NN6 7
stringNN7 =
,NN= >
ListNN? C
<NNC D
objectNND J
>NNJ K
>NNK L
ValuesNNM S
)NNS T
{OO 	
ifPP 
(PP 
symbolPP 
!=PP 
ModelPP 
.PP  
UISymbolPP  (
)PP( )
returnPP* 0
;PP0 1
ListRR 
<RR 
KlineRR 
>RR 
?RR 
KlinesRR 
=RR  !
ValuesRR" (
[RR( )
$strRR) 1
]RR1 2
.RR2 3
SelectRR3 9
(RR9 :
xRR: ;
=>RR< >
(RR? @
KlineRR@ E
)RRE F
xRRF G
)RRG H
.RRH I
ToListRRI O
(RRO P
)RRP Q
;RRQ R
UpdateKlinesSS 
(SS 
KlinesSS 
)SS  
;SS  !
ListUU 
<UU 
objectUU 
>UU 
?UU 
FastMAUU  
=UU! "
ValuesUU# )
[UU) *
$strUU* 2
]UU2 3
.UU3 4
ToListUU4 :
(UU: ;
)UU; <
;UU< =
ListVV 
<VV 
objectVV 
>VV 
?VV 
SlowMAVV  
=VV! "
ValuesVV# )
[VV) *
$strVV* 2
]VV2 3
.VV3 4
ToListVV4 :
(VV: ;
)VV; <
;VV< =
ListWW 
<WW 
objectWW 
>WW 
?WW 
UpVBWW 
=WW  
ValuesWW! '
[WW' (
$strWW( .
]WW. /
.WW/ 0
ToListWW0 6
(WW6 7
)WW7 8
;WW8 9
ListXX 
<XX 
objectXX 
>XX 
?XX 
MiddleVBXX "
=XX# $
ValuesXX% +
[XX+ ,
$strXX, 6
]XX6 7
.XX7 8
ToListXX8 >
(XX> ?
)XX? @
;XX@ A
ListYY 
<YY 
objectYY 
>YY 
?YY 
DownVBYY  
=YY! "
ValuesYY# )
[YY) *
$strYY* 2
]YY2 3
.YY3 4
ToListYY4 :
(YY: ;
)YY; <
;YY< =
UpdateIndicatorsZZ 
(ZZ 
KlinesZZ #
,ZZ# $
FastMAZZ% +
,ZZ+ ,
SlowMAZZ- 3
,ZZ3 4
UpVBZZ5 9
,ZZ9 :
MiddleVBZZ; C
,ZZC D
DownVBZZE K
)ZZK L
;ZZL M
}[[ 	
public]] 
void]] 
SetUISymbol]] 
(]]  
)]]  !
{^^ 	
if__ 
(__ 
Model__ 
.__ 
SelectedSymbol__ $
==__% '
null__( ,
)__, -
return__. 4
;__4 5
if`` 
(`` 
Model`` 
.`` 
SelectedSymbol`` $
.``$ %
Symbol``% +
==``, .
Model``/ 4
.``4 5
UISymbol``5 =
)``= >
return``? E
;``E F
ifaa 
(aa 
Modelaa 
.aa 
Symbolsaa 
.aa 
Countaa #
<aa$ %
$numaa& '
)aa' (
returnaa) /
;aa/ 0
ifcc 
(cc 
Modelcc 
.cc 
Symbolscc 
.cc 
Anycc !
(cc! "
xcc" #
=>cc$ &
xcc' (
.cc( )
Symbolcc) /
==cc0 2
Modelcc3 8
.cc8 9
UISymbolcc9 A
)ccA B
)ccB C
{dd 
Modelee 
.ee 
Symbolsee 
.ee 
Firstee #
(ee# $
xee$ %
=>ee& (
xee) *
.ee* +
Symbolee+ 1
==ee2 4
Modelee5 :
.ee: ;
UISymbolee; C
)eeC D
.eeD E
UpdateActioneeE Q
=eeR S
(eeT U
stringeeU [
symbolee\ b
,eeb c

Dictionaryeed n
<een o
stringeeo u
,eeu v
Listeew {
<ee{ |
object	ee| Ç
>
eeÇ É
>
eeÉ Ñ
values
eeÖ ã
)
eeã å
=>
eeç è
{
eeê ë
}
eeí ì
;
eeì î
}ff 
Modelgg 
.gg !
KlineSeriesCollectiongg '
.gg' (
ToListgg( .
(gg. /
)gg/ 0
.gg0 1
ForEachgg1 8
(gg8 9
xgg9 :
=>gg; =
xgg> ?
.gg? @
Valuesgg@ F
.ggF G
ClearggG L
(ggL M
)ggM N
)ggN O
;ggO P
Modelhh 
.hh &
IndicatorsSeriesCollectionhh ,
.hh, -
ToListhh- 3
(hh3 4
)hh4 5
.hh5 6
ForEachhh6 =
(hh= >
xhh> ?
=>hh@ B
xhhC D
.hhD E
ValueshhE K
.hhK L
ClearhhL Q
(hhQ R
)hhR S
)hhS T
;hhT U
Modelii 
.ii 
UISymbolii 
=ii 
Modelii "
.ii" #
SelectedSymbolii# 1
.ii1 2
Symbolii2 8
;ii8 9
Modeljj 
.jj 
Symbolsjj 
.jj 
Firstjj 
(jj  
xjj  !
=>jj" $
xjj% &
.jj& '
Symboljj' -
==jj. 0
Modeljj1 6
.jj6 7
UISymboljj7 ?
)jj? @
.jj@ A
UpdateActionjjA M
=jjN O
UpdateUIjjP X
;jjX Y
Modelkk 
.kk 
KlineSerieskk 
.kk 
Titlekk #
=kk$ %
Modelkk& +
.kk+ ,
UISymbolkk, 4
;kk4 5
}ll 	
publicnn 
voidnn 
UpdateKlinesnn  
(nn  !
IEnumerablenn! ,
<nn, -
Klinenn- 2
>nn2 3
Klinesnn4 :
)nn: ;
{oo 	
ifpp 
(pp 
Modelpp 
.pp 
KlineSeriespp !
.pp! "
Valuespp" (
.pp( )
Countpp) .
==pp/ 1
$numpp2 3
)pp3 4
{qq 
Modelrr 
.rr 
Labelsrr 
=rr 
Klinesrr %
.rr% &
Selectrr& ,
(rr, -
xrr- .
=>rr/ 1
xrr2 3
.rr3 4
	_OpenDaterr4 =
.rr= >
ToStringrr> F
(rrF G
$strrrG M
)rrM N
)rrN O
.rrO P
ToListrrP V
(rrV W
)rrW X
;rrX Y
Modelss 
.ss 
KlineSeriesss !
.ss! "
Valuesss" (
.ss( )
AddRangess) 1
(ss1 2
Klinesss2 8
.ss8 9
Selectss9 ?
(ss? @
xss@ A
=>ssB D
newssE H
	OhlcPointssI R
(ssR S
(ssS T
doublessT Z
)ssZ [
xss[ \
.ss\ ]
_Openss] b
,ssb c
(ssd e
doublesse k
)ssk l
xssl m
.ssm n
_Highssn s
,sss t
(ssu v
doublessv |
)ss| }
xss} ~
.ss~ 
_Low	ss É
,
ssÉ Ñ
(
ssÖ Ü
double
ssÜ å
)
sså ç
x
ssç é
.
ssé è
_Close
ssè ï
)
ssï ñ
)
ssñ ó
.
ssó ò
ToList
ssò û
(
ssû ü
)
ssü †
)
ss† °
;
ss° ¢
returntt 
;tt 
}uu 
ifww 
(ww 
Modelww 
.ww 
Labelsww 
.ww 
Lastww !
(ww! "
)ww" #
==ww$ &
Klinesww' -
.ww- .
Lastww. 2
(ww2 3
)ww3 4
.ww4 5
	_OpenDateww5 >
.ww> ?
ToStringww? G
(wwG H
$strwwH N
)wwN O
)wwO P
{xx 
Klineyy 
?yy 
	LastKlineyy  
=yy! "
Klinesyy# )
.yy) *
Lastyy* .
(yy. /
)yy/ 0
;yy0 1
	OhlcPointzz 
?zz 
LastChartKlinezz )
=zz* +
(zz, -
	OhlcPointzz- 6
?zz6 7
)zz7 8
Modelzz8 =
.zz= >!
KlineSeriesCollectionzz> S
[zzS T
$numzzT U
]zzU V
.zzV W
ValueszzW ]
[zz] ^
^zz^ _
$numzz_ `
]zz` a
;zza b
if|| 
(|| 
LastChartKline|| "
==||# %
null||& *
)||* +
return||, 2
;||2 3
LastChartKline}} 
.}} 
Close}} $
=}}% &
(}}' (
double}}( .
)}}. /
	LastKline}}/ 8
.}}8 9
_Close}}9 ?
;}}? @
if~~ 
(~~ 
LastChartKline~~ "
.~~" #
High~~# '
<~~( )
(~~* +
double~~+ 1
)~~1 2
	LastKline~~2 ;
.~~; <
_High~~< A
)~~A B
LastChartKline~~C Q
.~~Q R
High~~R V
=~~W X
(~~Y Z
double~~Z `
)~~` a
	LastKline~~a j
.~~j k
_High~~k p
;~~p q
if 
( 
LastChartKline "
." #
Low# &
<' (
() *
double* 0
)0 1
	LastKline1 :
.: ;
_Low; ?
)? @
LastChartKlineA O
.O P
LowP S
=T U
(V W
doubleW ]
)] ^
	LastKline^ g
.g h
_Lowh l
;l m
return
ÄÄ 
;
ÄÄ 
}
ÅÅ 
Model
ÉÉ 
.
ÉÉ 
Labels
ÉÉ 
.
ÉÉ 
RemoveAt
ÉÉ !
(
ÉÉ! "
$num
ÉÉ" #
)
ÉÉ# $
;
ÉÉ$ %
Model
ÑÑ 
.
ÑÑ #
KlineSeriesCollection
ÑÑ '
[
ÑÑ' (
$num
ÑÑ( )
]
ÑÑ) *
.
ÑÑ* +
Values
ÑÑ+ 1
.
ÑÑ1 2
RemoveAt
ÑÑ2 :
(
ÑÑ: ;
$num
ÑÑ; <
)
ÑÑ< =
;
ÑÑ= >
Model
ÜÜ 
.
ÜÜ 
Labels
ÜÜ 
.
ÜÜ 
Add
ÜÜ 
(
ÜÜ 
Klines
ÜÜ #
.
ÜÜ# $
Last
ÜÜ$ (
(
ÜÜ( )
)
ÜÜ) *
.
ÜÜ* +
	_OpenDate
ÜÜ+ 4
.
ÜÜ4 5
ToString
ÜÜ5 =
(
ÜÜ= >
$str
ÜÜ> D
)
ÜÜD E
)
ÜÜE F
;
ÜÜF G
Model
áá 
.
áá #
KlineSeriesCollection
áá '
[
áá' (
$num
áá( )
]
áá) *
.
áá* +
Values
áá+ 1
.
áá1 2
Add
áá2 5
(
áá5 6
new
áá6 9
	OhlcPoint
áá: C
(
ááC D
(
ááD E
double
ááE K
)
ááK L
Klines
ááL R
.
ááR S
Last
ááS W
(
ááW X
)
ááX Y
.
ááY Z
_Open
ááZ _
,
áá_ `
(
ááa b
double
ááb h
)
ááh i
Klines
áái o
.
ááo p
Last
ááp t
(
áát u
)
ááu v
.
ááv w
_High
ááw |
,
áá| }
(
áá~ 
doubleáá Ö
)ááÖ Ü
KlinesááÜ å
.ááå ç
Lastááç ë
(ááë í
)ááí ì
.ááì î
_Lowááî ò
,ááò ô
(ááö õ
doubleááõ °
)áá° ¢
Klinesáá¢ ®
.áá® ©
Lastáá© ≠
(áá≠ Æ
)ááÆ Ø
.ááØ ∞
_Closeáá∞ ∂
)áá∂ ∑
)áá∑ ∏
;áá∏ π
}
àà 	
public
ää 
void
ää 
UpdateIndicators
ää $
(
ää$ %
IEnumerable
ää% 0
<
ää0 1
Kline
ää1 6
>
ää6 7
Klines
ää8 >
,
ää> ?
IEnumerable
ää@ K
<
ääK L
object
ääL R
>
ääR S
FastMA
ääT Z
,
ääZ [
IEnumerable
ää\ g
<
ääg h
object
ääh n
>
ään o
SlowMA
ääp v
,
ääv w
IEnumerableääx É
<ääÉ Ñ
objectääÑ ä
>äää ã
UpVBääå ê
,ääê ë
IEnumerableääí ù
<ääù û
objectääû §
>ää§ •
MiddleVBää¶ Æ
,ääÆ Ø
IEnumerableää∞ ª
<ääª º
objectääº ¬
>ää¬ √
DownVBääƒ  
)ää  À
{
ãã 	
UpdateIndicator
åå 
(
åå 
Klines
åå "
,
åå" #
Model
åå$ )
.
åå) *
FastMA
åå* 0
.
åå0 1
Values
åå1 7
,
åå7 8
FastMA
åå9 ?
)
åå? @
;
åå@ A
UpdateIndicator
çç 
(
çç 
Klines
çç "
,
çç" #
Model
çç$ )
.
çç) *
SlowMA
çç* 0
.
çç0 1
Values
çç1 7
,
çç7 8
SlowMA
çç9 ?
)
çç? @
;
çç@ A
UpdateIndicator
éé 
(
éé 
Klines
éé "
,
éé" #
Model
éé$ )
.
éé) *
UpVB
éé* .
.
éé. /
Values
éé/ 5
,
éé5 6
UpVB
éé7 ;
)
éé; <
;
éé< =
UpdateIndicator
èè 
(
èè 
Klines
èè "
,
èè" #
Model
èè$ )
.
èè) *
MiddleVB
èè* 2
.
èè2 3
Values
èè3 9
,
èè9 :
MiddleVB
èè; C
)
èèC D
;
èèD E
UpdateIndicator
êê 
(
êê 
Klines
êê "
,
êê" #
Model
êê$ )
.
êê) *
DownVB
êê* 0
.
êê0 1
Values
êê1 7
,
êê7 8
DownVB
êê9 ?
)
êê? @
;
êê@ A
}
ëë 	
private
ìì 
void
ìì 
UpdateIndicator
ìì $
(
ìì$ %
IEnumerable
ìì% 0
<
ìì0 1
Kline
ìì1 6
>
ìì6 7
Klines
ìì8 >
,
ìì> ?
IChartValues
ìì@ L
values
ììM S
,
ììS T
IEnumerable
ììU `
<
ìì` a
object
ììa g
>
ììg h
	newValues
ììi r
)
ììr s
{
îî 	
if
ïï 
(
ïï 
values
ïï 
.
ïï 
Count
ïï 
==
ïï 
$num
ïï  !
)
ïï! "
{
ññ 
values
óó 
.
óó 
AddRange
óó 
(
óó  
	newValues
óó  )
.
óó) *
Select
óó* 0
(
óó0 1
x
óó1 2
=>
óó3 5
(
óó6 7
object
óó7 =
)
óó= >
Convert
óó> E
.
óóE F
ToDouble
óóF N
(
óóN O
x
óóO P
)
óóP Q
)
óóQ R
)
óóR S
;
óóS T
return
òò 
;
òò 
}
ôô 
if
õõ 
(
õõ 
Model
õõ 
.
õõ 
Labels
õõ 
.
õõ 
Last
õõ !
(
õõ! "
)
õõ" #
==
õõ$ &
Klines
õõ' -
.
õõ- .
Last
õõ. 2
(
õõ2 3
)
õõ3 4
.
õõ4 5
	_OpenDate
õõ5 >
.
õõ> ?
ToString
õõ? G
(
õõG H
$str
õõH N
)
õõN O
)
õõO P
{
úú 
values
ùù 
[
ùù 
^
ùù 
$num
ùù 
]
ùù 
=
ùù 
	newValues
ùù &
.
ùù& '
Last
ùù' +
(
ùù+ ,
)
ùù, -
;
ùù- .
return
ûû 
;
ûû 
}
üü 
values
°° 
.
°° 
Add
°° 
(
°° 
	newValues
°°  
.
°°  !
Last
°°! %
(
°°% &
)
°°& '
)
°°' (
;
°°( )
}
¢¢ 	
public
¶¶ 
void
¶¶ -
UserSymbolsListSelectionChanged
¶¶ 3
(
¶¶3 4
)
¶¶4 5
{
ßß 	
Model
®® 
.
®® !
AddUserSymbolString
®® %
=
®®& '
Model
®®( -
.
®®- . 
SelectedUserSymbol
®®. @
?
®®@ A
.
®®A B
Key
®®B E
;
®®E F
}
©© 	
public
´´ 
void
´´ 
AddUser
´´ 
(
´´ 
)
´´ 
{
¨¨ 	
try
≠≠ 
{
ÆÆ 
if
ØØ 
(
ØØ 
!
ØØ 

Connection
ØØ 
.
ØØ  
Context
ØØ  '
.
ØØ' (
Users
ØØ( -
.
ØØ- .
Any
ØØ. 1
(
ØØ1 2
x
ØØ2 3
=>
ØØ4 6
x
ØØ7 8
.
ØØ8 9
Username
ØØ9 A
==
ØØB D
Model
ØØE J
.
ØØJ K
AddUserString
ØØK X
)
ØØX Y
)
ØØY Z
{
∞∞ 

Connection
±± 
.
±± 
Context
±± &
.
±±& '
Add
±±' *
(
±±* +
new
±±+ .
User
±±/ 3
(
±±3 4
)
±±4 5
{
±±6 7
Username
±±8 @
=
±±A B
Model
±±C H
.
±±H I
AddUserString
±±I V
??
±±W Y
$str
±±Z \
,
±±\ ]
TDI
±±^ a
=
±±b c
true
±±d h
,
±±h i
TDISymbolValues
±±j y
=
±±z {
$str±±| Ä
}±±Å Ç
)±±Ç É
;±±É Ñ

Connection
≤≤ 
.
≤≤ 
Context
≤≤ &
.
≤≤& '
SaveChanges
≤≤' 2
(
≤≤2 3
)
≤≤3 4
;
≤≤4 5

MessageBox
≥≥ 
.
≥≥ 
Show
≥≥ #
(
≥≥# $
$str
≥≥$ B
,
≥≥B C
$str
≥≥D W
,
≥≥W X
MessageBoxButton
≥≥Y i
.
≥≥i j
OK
≥≥j l
)
≥≥l m
;
≥≥m n
}
¥¥ 
else
µµ 
if
µµ 
(
µµ 

Connection
µµ #
.
µµ# $
Context
µµ$ +
.
µµ+ ,
Users
µµ, 1
.
µµ1 2
Any
µµ2 5
(
µµ5 6
x
µµ6 7
=>
µµ8 :
x
µµ; <
.
µµ< =
Username
µµ= E
==
µµF H
Model
µµI N
.
µµN O
AddUserString
µµO \
&&
µµ] _
x
µµ` a
.
µµa b
TDI
µµb e
==
µµf h
false
µµi n
)
µµn o
)
µµo p
{
∂∂ 
var
∑∑ 
user
∑∑ 
=
∑∑ 

Connection
∑∑ )
.
∑∑) *
Context
∑∑* 1
.
∑∑1 2
Users
∑∑2 7
.
∑∑7 8
First
∑∑8 =
(
∑∑= >
x
∑∑> ?
=>
∑∑@ B
x
∑∑C D
.
∑∑D E
Username
∑∑E M
==
∑∑N P
Model
∑∑Q V
.
∑∑V W
AddUserString
∑∑W d
&&
∑∑e g
x
∑∑h i
.
∑∑i j
TDI
∑∑j m
==
∑∑n p
false
∑∑q v
)
∑∑v w
;
∑∑w x
user
∏∏ 
.
∏∏ 
TDI
∏∏ 
=
∏∏ 
true
∏∏ #
;
∏∏# $

Connection
ππ 
.
ππ 
Context
ππ &
.
ππ& '
SaveChanges
ππ' 2
(
ππ2 3
)
ππ3 4
;
ππ4 5

MessageBox
∫∫ 
.
∫∫ 
Show
∫∫ #
(
∫∫# $
$str
∫∫$ B
,
∫∫B C
$str
∫∫D W
,
∫∫W X
MessageBoxButton
∫∫Y i
.
∫∫i j
OK
∫∫j l
)
∫∫l m
;
∫∫m n
}
ªª 
else
ºº 
{
ΩΩ 
User
ææ 
user
ææ 
=
ææ 

Connection
ææ  *
.
ææ* +
Context
ææ+ 2
.
ææ2 3
Users
ææ3 8
.
ææ8 9
First
ææ9 >
(
ææ> ?
x
ææ? @
=>
ææA C
x
ææD E
.
ææE F
Username
ææF N
==
ææO Q
Model
ææR W
.
ææW X
AddUserString
ææX e
)
ææe f
;
ææf g
Model
øø 
.
øø 
SelectedUser
øø &
=
øø' (
user
øø) -
;
øø- .
}
¿¿ 
}
¡¡ 
catch
¬¬ 
(
¬¬ 
	Exception
¬¬ 
ex
¬¬ 
)
¬¬  
{
√√ 

MessageBox
ƒƒ 
.
ƒƒ 
Show
ƒƒ 
(
ƒƒ  
$"
ƒƒ  "
$str
ƒƒ" ;
{
ƒƒ; <
ex
ƒƒ< >
.
ƒƒ> ?
Message
ƒƒ? F
}
ƒƒF G
"
ƒƒG H
,
ƒƒH I
$str
ƒƒJ P
,
ƒƒP Q
MessageBoxButton
ƒƒR b
.
ƒƒb c
OK
ƒƒc e
,
ƒƒe f
MessageBoxImage
ƒƒg v
.
ƒƒv w
Error
ƒƒw |
)
ƒƒ| }
;
ƒƒ} ~
}
≈≈ 
}
∆∆ 	
public
»» 
void
»» 
DelUser
»» 
(
»» 
)
»» 
{
…… 	
try
   
{
ÀÀ 
if
ÃÃ 
(
ÃÃ 
Model
ÃÃ 
.
ÃÃ 
SelectedUser
ÃÃ &
==
ÃÃ' )
null
ÃÃ* .
)
ÃÃ. /
return
ÃÃ0 6
;
ÃÃ6 7
var
ÕÕ 
user
ÕÕ 
=
ÕÕ 

Connection
ÕÕ %
.
ÕÕ% &
Context
ÕÕ& -
.
ÕÕ- .
Users
ÕÕ. 3
.
ÕÕ3 4
First
ÕÕ4 9
(
ÕÕ9 :
x
ÕÕ: ;
=>
ÕÕ< >
x
ÕÕ? @
.
ÕÕ@ A
Username
ÕÕA I
==
ÕÕJ L
Model
ÕÕM R
.
ÕÕR S
AddUserString
ÕÕS `
&&
ÕÕa c
x
ÕÕd e
.
ÕÕe f
TDI
ÕÕf i
==
ÕÕj l
true
ÕÕm q
)
ÕÕq r
;
ÕÕr s
user
ŒŒ 
.
ŒŒ 
TDI
ŒŒ 
=
ŒŒ 
false
ŒŒ  
;
ŒŒ  !

Connection
œœ 
.
œœ 
Context
œœ "
.
œœ" #
SaveChanges
œœ# .
(
œœ. /
)
œœ/ 0
;
œœ0 1

MessageBox
—— 
.
—— 
Show
—— 
(
——  
$str
——  >
,
——> ?
$str
——@ S
,
——S T
MessageBoxButton
——U e
.
——e f
OK
——f h
)
——h i
;
——i j
}
““ 
catch
”” 
(
”” 
	Exception
”” 
ex
”” 
)
””  
{
‘‘ 

MessageBox
’’ 
.
’’ 
Show
’’ 
(
’’  
$"
’’  "
$str
’’" ;
{
’’; <
ex
’’< >
.
’’> ?
Message
’’? F
}
’’F G
"
’’G H
,
’’H I
$str
’’J P
,
’’P Q
MessageBoxButton
’’R b
.
’’b c
OK
’’c e
,
’’e f
MessageBoxImage
’’g v
.
’’v w
Error
’’w |
)
’’| }
;
’’} ~
}
÷÷ 
}
◊◊ 	
public
ŸŸ 
void
ŸŸ 
AddUserSymbol
ŸŸ !
(
ŸŸ! "
)
ŸŸ" #
{
⁄⁄ 	
try
€€ 
{
‹‹ 
if
›› 
(
›› 
Model
›› 
.
›› 
SelectedUser
›› &
==
››' )
null
››* .
)
››. /
return
››0 6
;
››6 7
bool
ﬁﬁ 
showMessage
ﬁﬁ  
=
ﬁﬁ! "
false
ﬁﬁ# (
;
ﬁﬁ( )
if
‡‡ 
(
‡‡ 
Model
‡‡ 
.
‡‡ 
SelectedUser
‡‡ &
.
‡‡& '

TDISymbols
‡‡' 1
.
‡‡1 2
Any
‡‡2 5
(
‡‡5 6
x
‡‡6 7
=>
‡‡8 :
x
‡‡; <
.
‡‡< =
Key
‡‡= @
.
‡‡@ A
Equals
‡‡A G
(
‡‡G H
Model
‡‡H M
.
‡‡M N!
AddUserSymbolString
‡‡N a
)
‡‡a b
)
‡‡b c
)
‡‡c d
{
·· 
int
‚‚ 
addDays
‚‚ 
=
‚‚  !
Model
‚‚" '
.
‚‚' (
AddUserDays
‚‚( 3
==
‚‚4 6
$num
‚‚7 8
?
‚‚9 :
$num
‚‚; A
:
‚‚B C
Model
‚‚D I
.
‚‚I J
AddUserDays
‚‚J U
;
‚‚U V
DateTime
‰‰ 
newDate
‰‰ $
=
‰‰% &
Model
‰‰' ,
.
‰‰, -
SelectedUser
‰‰- 9
.
‰‰9 :

TDISymbols
‰‰: D
.
‰‰D E
First
‰‰E J
(
‰‰J K
x
‰‰K L
=>
‰‰M O
x
‰‰P Q
.
‰‰Q R
Key
‰‰R U
.
‰‰U V
Equals
‰‰V \
(
‰‰\ ]
Model
‰‰] b
.
‰‰b c!
AddUserSymbolString
‰‰c v
)
‰‰v w
)
‰‰w x
.
‰‰x y
Value
‰‰y ~
>=‰‰ Å
DateTime‰‰Ç ä
.‰‰ä ã
Now‰‰ã é
?‰‰è ê
Model
ÂÂ 
.
ÂÂ 
SelectedUser
ÂÂ *
.
ÂÂ* +

TDISymbols
ÂÂ+ 5
.
ÂÂ5 6
First
ÂÂ6 ;
(
ÂÂ; <
x
ÂÂ< =
=>
ÂÂ> @
x
ÂÂA B
.
ÂÂB C
Key
ÂÂC F
.
ÂÂF G
Equals
ÂÂG M
(
ÂÂM N
Model
ÂÂN S
.
ÂÂS T!
AddUserSymbolString
ÂÂT g
)
ÂÂg h
)
ÂÂh i
.
ÂÂi j
Value
ÂÂj o
.
ÂÂo p
AddDays
ÂÂp w
(
ÂÂw x
addDays
ÂÂx 
)ÂÂ Ä
:ÂÂÅ Ç
DateTime
ÊÊ  
.
ÊÊ  !
Now
ÊÊ! $
.
ÊÊ$ %
AddDays
ÊÊ% ,
(
ÊÊ, -
addDays
ÊÊ- 4
)
ÊÊ4 5
;
ÊÊ5 6
Model
ËË 
.
ËË 
SelectedUser
ËË &
.
ËË& '

TDISymbols
ËË' 1
[
ËË1 2
Model
ËË2 7
.
ËË7 8!
AddUserSymbolString
ËË8 K
??
ËËL N
$str
ËËO Q
]
ËËQ R
=
ËËS T
newDate
ËËU \
;
ËË\ ]
}
ÈÈ 
else
ÍÍ 
{
ÎÎ 
Model
ÏÏ 
.
ÏÏ 
SelectedUser
ÏÏ &
.
ÏÏ& '

TDISymbols
ÏÏ' 1
.
ÏÏ1 2
Add
ÏÏ2 5
(
ÏÏ5 6
Model
ÏÏ6 ;
.
ÏÏ; <!
AddUserSymbolString
ÏÏ< O
??
ÏÏP R
$str
ÏÏS U
,
ÏÏU V
DateTime
ÏÏW _
.
ÏÏ_ `
Now
ÏÏ` c
.
ÏÏc d
AddDays
ÏÏd k
(
ÏÏk l
Model
ÏÏl q
.
ÏÏq r
AddUserDays
ÏÏr }
)
ÏÏ} ~
)
ÏÏ~ 
;ÏÏ Ä
showMessage
ÌÌ 
=
ÌÌ  !
true
ÌÌ" &
;
ÌÌ& '
}
ÓÓ 
Model
 
.
 
SelectedUser
 "
.
" #
SaveUserSymbols
# 2
(
2 3
)
3 4
;
4 5

Connection
ÒÒ 
.
ÒÒ 
Context
ÒÒ "
.
ÒÒ" #
SaveChanges
ÒÒ# .
(
ÒÒ. /
)
ÒÒ/ 0
;
ÒÒ0 1
Model
ÚÚ 
.
ÚÚ !
SelectedUserSymbols
ÚÚ )
=
ÚÚ* +
new
ÚÚ, /
(
ÚÚ/ 0
Model
ÚÚ0 5
.
ÚÚ5 6
SelectedUser
ÚÚ6 B
.
ÚÚB C

TDISymbols
ÚÚC M
)
ÚÚM N
;
ÚÚN O
if
ÙÙ 
(
ÙÙ 
showMessage
ÙÙ 
)
ÙÙ  

MessageBox
ÙÙ! +
.
ÙÙ+ ,
Show
ÙÙ, 0
(
ÙÙ0 1
$str
ÙÙ1 X
,
ÙÙX Y
$str
ÙÙZ j
,
ÙÙj k
MessageBoxButton
ÙÙl |
.
ÙÙ| }
OK
ÙÙ} 
)ÙÙ Ä
;ÙÙÄ Å
}
ˆˆ 
catch
˜˜ 
(
˜˜ 
	Exception
˜˜ 
ex
˜˜ 
)
˜˜  
{
¯¯ 

MessageBox
˘˘ 
.
˘˘ 
Show
˘˘ 
(
˘˘  
$"
˘˘  "
$str
˘˘" ;
{
˘˘; <
ex
˘˘< >
.
˘˘> ?
Message
˘˘? F
}
˘˘F G
"
˘˘G H
,
˘˘H I
$str
˘˘J P
,
˘˘P Q
MessageBoxButton
˘˘R b
.
˘˘b c
OK
˘˘c e
,
˘˘e f
MessageBoxImage
˘˘g v
.
˘˘v w
Error
˘˘w |
)
˘˘| }
;
˘˘} ~
}
˙˙ 
}
˚˚ 	
public
˝˝ 
void
˝˝ 
DelUserSymbol
˝˝ !
(
˝˝! "
)
˝˝" #
{
˛˛ 	
try
ˇˇ 
{
ÄÄ 
if
ÅÅ 
(
ÅÅ 
Model
ÅÅ 
.
ÅÅ 
SelectedUser
ÅÅ &
==
ÅÅ' )
null
ÅÅ* .
||
ÅÅ/ 1
Model
ÅÅ2 7
.
ÅÅ7 8!
SelectedUserSymbols
ÅÅ8 K
?
ÅÅK L
.
ÅÅL M
Count
ÅÅM R
==
ÅÅS U
$num
ÅÅV W
)
ÅÅW X
return
ÅÅY _
;
ÅÅ_ `
Model
ÉÉ 
.
ÉÉ 
SelectedUser
ÉÉ "
.
ÉÉ" #

TDISymbols
ÉÉ# -
.
ÉÉ- .
Remove
ÉÉ. 4
(
ÉÉ4 5
Model
ÉÉ5 :
.
ÉÉ: ; 
SelectedUserSymbol
ÉÉ; M
?
ÉÉM N
.
ÉÉN O
Key
ÉÉO R
??
ÉÉS U
$str
ÉÉV X
)
ÉÉX Y
;
ÉÉY Z
Model
ÑÑ 
.
ÑÑ 
SelectedUser
ÑÑ "
.
ÑÑ" #
SaveUserSymbols
ÑÑ# 2
(
ÑÑ2 3
)
ÑÑ3 4
;
ÑÑ4 5

Connection
ÖÖ 
.
ÖÖ 
Context
ÖÖ "
.
ÖÖ" #
SaveChanges
ÖÖ# .
(
ÖÖ. /
)
ÖÖ/ 0
;
ÖÖ0 1
Model
áá 
.
áá !
SelectedUserSymbols
áá )
=
áá* +
new
áá, /
(
áá/ 0
Model
áá0 5
.
áá5 6
SelectedUser
áá6 B
.
ááB C

TDISymbols
ááC M
)
ááM N
;
ááN O

MessageBox
àà 
.
àà 
Show
àà 
(
àà  
$str
àà  ;
,
àà; <
$str
àà= P
,
ààP Q
MessageBoxButton
ààR b
.
ààb c
OK
ààc e
)
ààe f
;
ààf g
}
ââ 
catch
ää 
(
ää 
	Exception
ää 
ex
ää 
)
ää  
{
ãã 

MessageBox
åå 
.
åå 
Show
åå 
(
åå  
$"
åå  "
$str
åå" ;
{
åå; <
ex
åå< >
.
åå> ?
Message
åå? F
}
ååF G
"
ååG H
,
ååH I
$str
ååJ P
,
ååP Q
MessageBoxButton
ååR b
.
ååb c
OK
ååc e
,
ååe f
MessageBoxImage
ååg v
.
ååv w
Error
ååw |
)
åå| }
;
åå} ~
}
çç 
}
éé 	
public
êê 
void
êê 
AddGroup
êê 
(
êê 
)
êê 
{
ëë 	
if
íí 
(
íí 
string
íí 
.
íí 
IsNullOrEmpty
íí $
(
íí$ %
Model
íí% *
.
íí* +
AddGroupString
íí+ 9
)
íí9 :
)
íí: ;
return
íí< B
;
ííB C
Settings
ìì 
.
ìì 
TelegramSettings
ìì %
.
ìì% &
	TDIGroups
ìì& /
.
ìì/ 0
Add
ìì0 3
(
ìì3 4
Model
ìì4 9
.
ìì9 :
AddGroupString
ìì: H
)
ììH I
;
ììI J
Settings
îî 
.
îî 
SaveSettings
îî !
(
îî! "
)
îî" #
;
îî# $

MessageBox
ïï 
.
ïï 
Show
ïï 
(
ïï 
$str
ïï 4
,
ïï4 5
$str
ïï6 D
,
ïïD E
MessageBoxButton
ïïF V
.
ïïV W
OK
ïïW Y
)
ïïY Z
;
ïïZ [
}
ññ 	
public
òò 
void
òò 
DelGroup
òò 
(
òò 
)
òò 
{
ôô 	
Settings
öö 
.
öö 
TelegramSettings
öö %
.
öö% &
	TDIGroups
öö& /
.
öö/ 0
Remove
öö0 6
(
öö6 7
Model
öö7 <
.
öö< =
SelectedGroup
öö= J
??
ööK M
$str
ööN P
)
ööP Q
;
ööQ R
Settings
õõ 
.
õõ 
SaveSettings
õõ !
(
õõ! "
)
õõ" #
;
õõ# $

MessageBox
úú 
.
úú 
Show
úú 
(
úú 
$str
úú 4
,
úú4 5
$str
úú6 D
,
úúD E
MessageBoxButton
úúF V
.
úúV W
OK
úúW Y
)
úúY Z
;
úúZ [
}
ùù 	
public
°° 
void
°° 
	DelSymbol
°° 
(
°° 
)
°° 
{
¢¢ 	
if
££ 
(
££ 
Model
££ 
.
££ 
SelectedSymbol
££ $
==
££% '
null
££( ,
)
££, -
return
££. 4
;
££4 5
string
§§ 
?
§§ 
symbol
§§ 
=
§§ 
Model
§§ "
.
§§" #
SelectedSymbol
§§# 1
.
§§1 2
Symbol
§§2 8
;
§§8 9
Settings
¶¶ 
.
¶¶ 
BotsSettings
¶¶ !
.
¶¶! "
TDISettings
¶¶" -
.
¶¶- .
Symbols
¶¶. 5
.
¶¶5 6
Remove
¶¶6 <
(
¶¶< =
Model
¶¶= B
.
¶¶B C
SelectedSymbol
¶¶C Q
.
¶¶Q R
Symbol
¶¶R X
)
¶¶X Y
;
¶¶Y Z
Model
ßß 
.
ßß 
SelectedSymbol
ßß  
.
ßß  !
Dispose
ßß! (
(
ßß( )
)
ßß) *
;
ßß* +
Settings
©© 
.
©© 
BotsSettings
©© !
.
©©! "
TDISettings
©©" -
.
©©- .
Symbols
©©. 5
.
©©5 6
Remove
©©6 <
(
©©< =
Model
©©= B
.
©©B C
SelectedSymbol
©©C Q
.
©©Q R
Symbol
©©R X
)
©©X Y
;
©©Y Z
Settings
™™ 
.
™™ 
SaveSettings
™™ !
(
™™! "
)
™™" #
;
™™# $
Model
¨¨ 
.
¨¨ 
Symbols
¨¨ 
.
¨¨ 
Remove
¨¨  
(
¨¨  !
Model
¨¨! &
.
¨¨& '
SelectedSymbol
¨¨' 5
)
¨¨5 6
;
¨¨6 7
if
ØØ 
(
ØØ 
Model
ØØ 
.
ØØ 
UISymbol
ØØ 
==
ØØ !
symbol
ØØ" (
&&
ØØ) +
Model
ØØ, 1
.
ØØ1 2
Symbols
ØØ2 9
.
ØØ9 :
Count
ØØ: ?
>
ØØ@ A
$num
ØØB C
)
ØØC D
{
∞∞ 
Model
±± 
.
±± 
SelectedSymbol
±± $
=
±±% &
Model
±±' ,
.
±±, -
Symbols
±±- 4
[
±±4 5
$num
±±5 6
]
±±6 7
;
±±7 8
SetUISymbol
≤≤ 
(
≤≤ 
)
≤≤ 
;
≤≤ 
}
≥≥ 
}
¥¥ 	
public
∂∂ 
void
∂∂ 
	AddSymbol
∂∂ 
(
∂∂ 
)
∂∂ 
{
∑∑ 	
try
∏∏ 
{
ππ 
if
∫∫ 
(
∫∫ 
Model
∫∫ 
.
∫∫ 
Symbols
∫∫ !
.
∫∫! "
Any
∫∫" %
(
∫∫% &
x
∫∫& '
=>
∫∫( *
x
∫∫+ ,
.
∫∫, -
Symbol
∫∫- 3
==
∫∫4 6
Model
∫∫7 <
.
∫∫< =
AddSymbolString
∫∫= L
)
∫∫L M
)
∫∫M N
{
ªª 

MessageBox
ºº 
.
ºº 
Show
ºº #
(
ºº# $
$str
ºº$ =
,
ºº= >
$str
ºº? N
,
ººN O
MessageBoxButton
ººP `
.
ºº` a
OK
ººa c
,
ººc d
MessageBoxImage
ººe t
.
ººt u
Informationººu Ä
)ººÄ Å
;ººÅ Ç
return
ΩΩ 
;
ΩΩ 
}
ææ 

_AddSymbol
¿¿ 
(
¿¿ 
Model
¿¿  
.
¿¿  !
AddSymbolString
¿¿! 0
??
¿¿1 3
$str
¿¿4 6
)
¿¿6 7
;
¿¿7 8

MessageBox
¡¡ 
.
¡¡ 
Show
¡¡ 
(
¡¡  
$str
¡¡  ;
,
¡¡; <
$str
¡¡= M
,
¡¡M N
MessageBoxButton
¡¡O _
.
¡¡_ `
OK
¡¡` b
)
¡¡b c
;
¡¡c d
}
¬¬ 
catch
√√ 
(
√√ 
	Exception
√√ 
ex
√√ 
)
√√  
{
ƒƒ 

MessageBox
≈≈ 
.
≈≈ 
Show
≈≈ 
(
≈≈  
$"
≈≈  "
$str
≈≈" ;
{
≈≈; <
ex
≈≈< >
.
≈≈> ?
Message
≈≈? F
}
≈≈F G
"
≈≈G H
,
≈≈H I
$str
≈≈J P
,
≈≈P Q
MessageBoxButton
≈≈R b
.
≈≈b c
OK
≈≈c e
,
≈≈e f
MessageBoxImage
≈≈g v
.
≈≈v w
Error
≈≈w |
)
≈≈| }
;
≈≈} ~
}
∆∆ 
}
«« 	
private
…… 
void
…… 

_AddSymbol
…… 
(
……  
string
……  &
symbol
……' -
)
……- .
{
   	
Model
ÀÀ 
.
ÀÀ 
Symbols
ÀÀ 
.
ÀÀ 
Add
ÀÀ 
(
ÀÀ 
new
ÀÀ !
TDI
ÀÀ" %
(
ÀÀ% &
symbol
ÀÀ& ,
,
ÀÀ, -
Binance
ÀÀ. 5
.
ÀÀ5 6
Net
ÀÀ6 9
.
ÀÀ9 :
Enums
ÀÀ: ?
.
ÀÀ? @
KlineInterval
ÀÀ@ M
.
ÀÀM N
	OneMinute
ÀÀN W
,
ÀÀW X
(
ÀÀY Z
string
ÀÀZ `
symbol
ÀÀa g
,
ÀÀg h

Dictionary
ÀÀi s
<
ÀÀs t
string
ÀÀt z
,
ÀÀz {
ListÀÀ| Ä
<ÀÀÄ Å
objectÀÀÅ á
>ÀÀá à
>ÀÀà â
valuesÀÀä ê
)ÀÀê ë
=>ÀÀí î
{ÀÀï ñ
}ÀÀó ò
,ÀÀò ô!
SendSignalMessageÀÀö ´
)ÀÀ´ ¨
{ÀÀ≠ Æ
}ÀÀØ ∞
)ÀÀ∞ ±
;ÀÀ± ≤
Settings
ÃÃ 
.
ÃÃ 
BotsSettings
ÃÃ !
.
ÃÃ! "
TDISettings
ÃÃ" -
.
ÃÃ- .
Symbols
ÃÃ. 5
.
ÃÃ5 6
Add
ÃÃ6 9
(
ÃÃ9 :
symbol
ÃÃ: @
)
ÃÃ@ A
;
ÃÃA B
Settings
ÕÕ 
.
ÕÕ 
SaveSettings
ÕÕ !
(
ÕÕ! "
)
ÕÕ" #
;
ÕÕ# $
}
ŒŒ 	
public
–– 
Task
–– 
AddAllSymbols
–– !
(
––! "
)
––" #
{
—— 	
CryptoExchange
““ 
.
““ 
Net
““ 
.
““ 
Objects
““ &
.
““& '
WebCallResult
““' 4
<
““4 5
Binance
““5 <
.
““< =
Net
““= @
.
““@ A
Objects
““A H
.
““H I
Models
““I O
.
““O P
Spot
““P T
.
““T U!
BinanceExchangeInfo
““U h
>
““h i
?
““i j
exchangeInfos
““k x
=
““y z
StaticBinance““{ à
.““à â
Client““â è
.““è ê
SpotApi““ê ó
.““ó ò
ExchangeData““ò §
.““§ •$
GetExchangeInfoAsync““• π
(““π ∫
)““∫ ª
.““ª º
Result““º ¬
;““¬ √
Model
”” 
.
”” 
Symbols
”” 
.
”” 
Clear
”” 
(
””  
)
””  !
;
””! "
Settings
‘‘ 
.
‘‘ 
BotsSettings
‘‘ !
.
‘‘! "
TDISettings
‘‘" -
.
‘‘- .
Symbols
‘‘. 5
.
‘‘5 6
Clear
‘‘6 ;
(
‘‘; <
)
‘‘< =
;
‘‘= >
exchangeInfos
’’ 
.
’’ 
Data
’’ 
.
’’ 
Symbols
’’ &
.
’’& '
ToList
’’' -
(
’’- .
)
’’. /
.
’’/ 0
ForEach
’’0 7
(
’’7 8
x
’’8 9
=>
’’: <
{
÷÷ 
try
◊◊ 
{
ÿÿ 

_AddSymbol
ŸŸ 
(
ŸŸ 
x
ŸŸ  
.
ŸŸ  !
Name
ŸŸ! %
)
ŸŸ% &
;
ŸŸ& '
}
⁄⁄ 
catch
€€ 
(
€€ 
	Exception
€€  
ex
€€! #
)
€€# $
{
‹‹ 

MessageBox
›› 
.
›› 
Show
›› #
(
››# $
$"
››$ &
{
››& '
x
››' (
.
››( )
Name
››) -
}
››- .
$str
››. S
{
››S T
ex
››T V
.
››V W
Message
››W ^
}
››^ _
"
››_ `
,
››` a
$str
››b h
,
››h i
MessageBoxButton
››j z
.
››z {
OK
››{ }
,
››} ~
MessageBoxImage›› é
.››é è
Error››è î
)››î ï
;››ï ñ
}
ﬁﬁ 
}
ﬂﬂ 
)
ﬂﬂ 
;
ﬂﬂ 
return
·· 
Task
·· 
.
·· 
Delay
·· 
(
·· 
$num
·· 
)
··  
;
··  !
}
‚‚ 	
public
ÊÊ 
void
ÊÊ 
SendSignalMessage
ÊÊ %
(
ÊÊ% &
string
ÊÊ& ,
symbol
ÊÊ- 3
,
ÊÊ3 4
Enums
ÊÊ5 :
.
ÊÊ: ;

SignalType
ÊÊ; E
type
ÊÊF J
)
ÊÊJ K
{
ÁÁ 	
string
ËË 
message
ËË 
=
ËË 
type
ËË !
switch
ËË" (
{
ÈÈ 
Enums
ÍÍ 
.
ÍÍ 

SignalType
ÍÍ  
.
ÍÍ  !
Sell
ÍÍ! %
=>
ÍÍ& (
Settings
ÍÍ) 1
.
ÍÍ1 2
BotsSettings
ÍÍ2 >
.
ÍÍ> ?
TDISettings
ÍÍ? J
.
ÍÍJ K
SignalMessages
ÍÍK Y
.
ÍÍY Z
Sell
ÍÍZ ^
,
ÍÍ^ _
Enums
ÎÎ 
.
ÎÎ 

SignalType
ÎÎ  
.
ÎÎ  !
Buy
ÎÎ! $
=>
ÎÎ% '
Settings
ÎÎ( 0
.
ÎÎ0 1
BotsSettings
ÎÎ1 =
.
ÎÎ= >
TDISettings
ÎÎ> I
.
ÎÎI J
SignalMessages
ÎÎJ X
.
ÎÎX Y
Buy
ÎÎY \
,
ÎÎ\ ]
Enums
ÏÏ 
.
ÏÏ 

SignalType
ÏÏ  
.
ÏÏ  !
Exit
ÏÏ! %
=>
ÏÏ& (
Settings
ÏÏ) 1
.
ÏÏ1 2
BotsSettings
ÏÏ2 >
.
ÏÏ> ?
TDISettings
ÏÏ? J
.
ÏÏJ K
SignalMessages
ÏÏK Y
.
ÏÏY Z
Exit
ÏÏZ ^
,
ÏÏ^ _
_
ÌÌ 
=>
ÌÌ 
$str
ÌÌ 
,
ÌÌ 
}
ÓÓ 
;
ÓÓ 
if
 
(
 
string
 
.
 
IsNullOrEmpty
 $
(
$ %
message
% ,
)
, -
)
- .
return
/ 5
;
5 6
message
ÒÒ 
=
ÒÒ 
message
ÒÒ 
.
ÒÒ 
Replace
ÒÒ %
(
ÒÒ% &
$str
ÒÒ& 0
,
ÒÒ0 1
symbol
ÒÒ2 8
)
ÒÒ8 9
;
ÒÒ9 :
foreach
ÛÛ 
(
ÛÛ 
User
ÛÛ 
user
ÛÛ 
in
ÛÛ !
Model
ÛÛ" '
.
ÛÛ' (
Users
ÛÛ( -
)
ÛÛ- .
{
ÙÙ 
try
ıı 
{
ˆˆ 
if
˜˜ 
(
˜˜ 
user
˜˜ 
.
˜˜ 
ChatId
˜˜ #
==
˜˜$ &
$num
˜˜' (
||
˜˜) +
!
˜˜, -
user
˜˜- 1
.
˜˜1 2

TDISymbols
˜˜2 <
.
˜˜< =
Any
˜˜= @
(
˜˜@ A
x
˜˜A B
=>
˜˜C E
x
˜˜F G
.
˜˜G H
Key
˜˜H K
.
˜˜K L
Equals
˜˜L R
(
˜˜R S
symbol
˜˜S Y
)
˜˜Y Z
&&
˜˜[ ]
x
˜˜^ _
.
˜˜_ `
Value
˜˜` e
>
˜˜f g
DateTime
˜˜h p
.
˜˜p q
Now
˜˜q t
)
˜˜t u
)
˜˜u v
continue
˜˜w 
;˜˜ Ä

BotClients
¯¯ 
.
¯¯ 
	TDIClient
¯¯ (
.
¯¯( )"
SendTextMessageAsync
¯¯) =
(
¯¯= >
user
¯¯> B
.
¯¯B C
ChatId
¯¯C I
,
¯¯I J
message
¯¯K R
)
¯¯R S
;
¯¯S T
}
˘˘ 
catch
˙˙ 
(
˙˙ 
	Exception
˙˙  
ex
˙˙! #
)
˙˙# $
{
˚˚ 
Console
¸¸ 
.
¸¸ 
	WriteLine
¸¸ %
(
¸¸% &
$"
¸¸& (
$str
¸¸( 9
{
¸¸9 :
user
¸¸: >
.
¸¸> ?
Username
¸¸? G
}
¸¸G H
$str
¸¸H c
{
¸¸c d
ex
¸¸d f
.
¸¸f g
Message
¸¸g n
}
¸¸n o
"
¸¸o p
)
¸¸p q
;
¸¸q r
}
˝˝ 
}
ˇˇ 
foreach
ÅÅ 
(
ÅÅ 
string
ÅÅ 
?
ÅÅ 
group
ÅÅ "
in
ÅÅ# %
Settings
ÅÅ& .
.
ÅÅ. /
TelegramSettings
ÅÅ/ ?
.
ÅÅ? @
	TDIGroups
ÅÅ@ I
)
ÅÅI J
{
ÇÇ 
try
ÉÉ 
{
ÑÑ 

BotClients
ÖÖ 
.
ÖÖ 
	TDIClient
ÖÖ (
.
ÖÖ( )"
SendTextMessageAsync
ÖÖ) =
(
ÖÖ= >
group
ÖÖ> C
,
ÖÖC D
message
ÖÖE L
)
ÖÖL M
;
ÖÖM N
}
ÜÜ 
catch
áá 
(
áá 
	Exception
áá  
ex
áá! #
)
áá# $
{
àà 
Console
ââ 
.
ââ 
	WriteLine
ââ %
(
ââ% &
$"
ââ& (
$str
ââ( 8
{
ââ8 9
group
ââ9 >
}
ââ> ?
$str
ââ? Z
{
ââZ [
ex
ââ[ ]
.
ââ] ^
Message
ââ^ e
}
ââe f
"
ââf g
)
ââg h
;
ââh i
}
ää 
}
ãã 
}
åå 	
public
êê 
void
êê 
SaveSettings
êê  
(
êê  !
)
êê! "
{
ëë 	
Settings
íí 
.
íí 
BotsSettings
íí !
.
íí! "
TDISettings
íí" -
.
íí- .
SignalMessages
íí. <
.
íí< =
Sell
íí= A
=
ííB C
Model
ííD I
.
ííI J
SellSignalString
ííJ Z
;
ííZ [
Settings
ìì 
.
ìì 
BotsSettings
ìì !
.
ìì! "
TDISettings
ìì" -
.
ìì- .
SignalMessages
ìì. <
.
ìì< =
Buy
ìì= @
=
ììA B
Model
ììC H
.
ììH I
BuySignalString
ììI X
;
ììX Y
Settings
îî 
.
îî 
BotsSettings
îî !
.
îî! "
TDISettings
îî" -
.
îî- .
SignalMessages
îî. <
.
îî< =
Exit
îî= A
=
îîB C
Model
îîD I
.
îîI J
ExitSignalString
îîJ Z
;
îîZ [
Settings
ññ 
.
ññ 
BotsSettings
ññ !
.
ññ! "
TDISettings
ññ" -
.
ññ- .
	RSIPeriot
ññ. 7
=
ññ8 9
Model
ññ: ?
.
ññ? @
	RSIPeriot
ññ@ I
;
ññI J
Settings
óó 
.
óó 
BotsSettings
óó !
.
óó! "
TDISettings
óó" -
.
óó- .
RSIPLPeriot
óó. 9
=
óó: ;
Model
óó< A
.
óóA B
RSIPLPeriot
óóB M
;
óóM N
Settings
òò 
.
òò 
BotsSettings
òò !
.
òò! "
TDISettings
òò" -
.
òò- . 
VotalityBandPeriot
òò. @
=
òòA B
Model
òòC H
.
òòH I
VBPeriot
òòI Q
;
òòQ R
Settings
ôô 
.
ôô 
BotsSettings
ôô !
.
ôô! "
TDISettings
ôô" -
.
ôô- .
	TSLPeriot
ôô. 7
=
ôô8 9
Model
ôô: ?
.
ôô? @
	TSLPeriot
ôô@ I
;
ôôI J
Settings
öö 
.
öö 
BotsSettings
öö !
.
öö! "
TDISettings
öö" -
.
öö- .
RSIOversoldLevel
öö. >
=
öö? @
Model
ööA F
.
ööF G
RSIOversoldLevel
ööG W
;
ööW X
Settings
õõ 
.
õõ 
BotsSettings
õõ !
.
õõ! "
TDISettings
õõ" -
.
õõ- . 
RSIOverboughtLevet
õõ. @
=
õõA B
Model
õõC H
.
õõH I 
RSIOverboughtLevel
õõI [
;
õõ[ \
Settings
ùù 
.
ùù 
SaveSettings
ùù !
(
ùù! "
)
ùù" #
;
ùù# $

MessageBox
üü 
.
üü 
Show
üü 
(
üü 
$str
üü ;
,
üü; <
$str
üü= Q
,
üüQ R
MessageBoxButton
üüS c
.
üüc d
OK
üüd f
)
üüf g
;
üüg h
}
†† 	
public
¢¢ 
void
¢¢ 
LoadSettings
¢¢  
(
¢¢  !
)
¢¢! "
{
££ 	
Model
§§ 
.
§§ 
SellSignalString
§§ "
=
§§# $
Settings
§§% -
.
§§- .
BotsSettings
§§. :
.
§§: ;
TDISettings
§§; F
.
§§F G
SignalMessages
§§G U
.
§§U V
Sell
§§V Z
;
§§Z [
Model
•• 
.
•• 
BuySignalString
•• !
=
••" #
Settings
••$ ,
.
••, -
BotsSettings
••- 9
.
••9 :
TDISettings
••: E
.
••E F
SignalMessages
••F T
.
••T U
Buy
••U X
;
••X Y
Model
¶¶ 
.
¶¶ 
ExitSignalString
¶¶ "
=
¶¶# $
Settings
¶¶% -
.
¶¶- .
BotsSettings
¶¶. :
.
¶¶: ;
TDISettings
¶¶; F
.
¶¶F G
SignalMessages
¶¶G U
.
¶¶U V
Exit
¶¶V Z
;
¶¶Z [
Model
®® 
.
®® 
	RSIPeriot
®® 
=
®® 
Settings
®® &
.
®®& '
BotsSettings
®®' 3
.
®®3 4
TDISettings
®®4 ?
.
®®? @
	RSIPeriot
®®@ I
;
®®I J
Model
©© 
.
©© 
RSIPLPeriot
©© 
=
©© 
Settings
©©  (
.
©©( )
BotsSettings
©©) 5
.
©©5 6
TDISettings
©©6 A
.
©©A B
RSIPLPeriot
©©B M
;
©©M N
Model
™™ 
.
™™ 
	TSLPeriot
™™ 
=
™™ 
Settings
™™ &
.
™™& '
BotsSettings
™™' 3
.
™™3 4
TDISettings
™™4 ?
.
™™? @
	TSLPeriot
™™@ I
;
™™I J
Model
´´ 
.
´´ 
VBPeriot
´´ 
=
´´ 
Settings
´´ %
.
´´% &
BotsSettings
´´& 2
.
´´2 3
TDISettings
´´3 >
.
´´> ? 
VotalityBandPeriot
´´? Q
;
´´Q R
Model
¨¨ 
.
¨¨ 
RSIOversoldLevel
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
TDISettings
¨¨; F
.
¨¨F G
RSIOversoldLevel
¨¨G W
;
¨¨W X
Model
≠≠ 
.
≠≠  
RSIOverboughtLevel
≠≠ $
=
≠≠% &
Settings
≠≠' /
.
≠≠/ 0
BotsSettings
≠≠0 <
.
≠≠< =
TDISettings
≠≠= H
.
≠≠H I 
RSIOverboughtLevet
≠≠I [
;
≠≠[ \
}
ÆÆ 	
}
∞∞ 
}±± Ü
tC:\Users\√ñmer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\UI\Views\MainWindow.xaml.cs
	namespace 	!
EASYTelegramSignalBot
 
{ 
public 

partial 
class 

MainWindow #
:$ %
MahApps& -
.- .
Metro. 3
.3 4
Controls4 <
.< =
MetroWindow= H
{ 
[ 	
	DllImport	 
( 
$str 
) 
] 
private 
static 
extern 
void "
AllocConsole# /
(/ 0
)0 1
;1 2
public 

MainWindow 
( 
) 
{ 	
AllocConsole 
( 
) 
; 
Settings 
. 
LoadSettings !
(! "
)" #
;# $
DatabaseContext 

_DBContext &
=' (
new) ,
(, -
)- .
;. /

_DBContext 
. !
CheckDatabaseSettings ,
(, -
)- .
;. /

_DBContext 
. 
Dispose 
( 
)  
;  !

BotClients 
. 
StartBotClients &
(& '
)' (
;( )
CryptopanicNewsBot 
newsBot &
=' (
new) ,
(, -
)- .
;. /
InitializeComponent 
(  
)  !
;! "
} 	
} 
} Ä
nC:\Users\√ñmer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\UI\Views\News.xaml.cs
	namespace 	!
EASYTelegramSignalBot
 
.  
Views  %
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
 
public 
RSI 
( 
) 
{ 	
InitializeComponent 
(  
)  !
;! "
} 	
private 
void 0
$UserSymbolsListView_SelectionChanged 9
(9 :
object: @
senderA G
,G H%
SelectionChangedEventArgsI b
ec d
)d e
{ 	
( 
( 
RSIViewModel 
) 
DataContext &
)& '
.' (+
UserSymbolsListSelectionChanged( G
(G H
)H I
;I J
} 	
} 
} ß
mC:\Users\√ñmer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\UI\Views\RSI.xaml.cs
	namespace 	!
EASYTelegramSignalBot
 
.  
Views  %
{ 
public		 

partial		 
class		 
News		 
:		 
UserControl		  +
{

 
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
} ˇ
mC:\Users\√ñmer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\UI\Views\TDI.xaml.cs
	namespace 	!
EASYTelegramSignalBot
 
.  
Views  %
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
 
public 
TDI 
( 
) 
{ 	
InitializeComponent 
(  
)  !
;! "
} 	
private 
void 0
$UserSymbolsListView_SelectionChanged 9
(9 :
object: @
senderA G
,G H%
SelectionChangedEventArgsI b
ec d
)d e
{ 	
( 
( 
TDIViewModel 
) 
DataContext &
)& '
.' (+
UserSymbolsListSelectionChanged( G
(G H
)H I
;I J
} 	
} 
} 