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
} ù
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
public 
string 
? 
TDISymbolValues &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
[ 	
	NotMapped	 
] 
public 

Dictionary 
< 
string  
,  !
DateTime" *
>* +

TDISymbols, 6
{7 8
get9 <
;< =
set> A
;A B
}C D
public 
User 
( 
) 
{ 	

TDISymbols 
= 
new 
( 
) 
; 
} 	
public 
void 
UpdateUserSymbols %
(% &
)& '
{ 	

TDISymbols 
= 
JsonConvert $
.$ %
DeserializeObject% 6
<6 7

Dictionary7 A
<A B
stringB H
,H I
DateTimeJ R
>R S
>S T
(T U
TDISymbolValuesU d
??e g
$strh l
)l m
??n p
newq t
(t u
)u v
;v w
} 	
public   
void   
SaveUserSymbols   #
(  # $
)  $ %
{!! 	
TDISymbolValues"" 
="" 
JsonConvert"" )
."") *
SerializeObject""* 9
(""9 :

TDISymbols"": D
)""D E
;""E F
UpdateUserSymbols## 
(## 
)## 
;##  
}$$ 	
}%% 
}&& Ï
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
}ÖÖ t
rC:\Users\√ñmer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\Finance\Indicators\PAC.cst
rC:\Users\√ñmer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\Finance\Indicators\RSI.cs§ô
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
{ii? @
nameofii@ F
(iiF G
RSI_PLiiG M
)iiM N
}iiN O
$striiO Q
{iiQ R
EnumiiR V
.iiV W
GetNameiiW ^
(ii^ _
typeofii_ e
(iie f
Enumsiif k
.iik l

SignalTypeiil v
)iiv w
,iiw x
RSI_PLiiy 
)	ii Ä
}
iiÄ Å
"
iiÅ Ç
)
iiÇ É
;
iiÉ Ñ
LastSignalTypejj 
=jj  
RSI_PLjj! '
;jj' (
}kk 
Consolemm 
.mm 
	WriteLinemm 
(mm 
$"mm  
$strmm  '
{mm' (
Symbolmm( .
}mm. /
$strmm/ 3
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
} ä
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
public		 '
PropertyChangedEventHandler		 *
?		* +

GetHandler		, 6
(		6 7
)		7 8
{

 	
return 
PropertyChanged "
;" #
} 	
public 
void %
RaisePropertyChangedEvent -
(- .
params. 4
string5 ;
[; <
]< =
propertyNames> K
)K L
{ 	
foreach 
( 
string 
? 
propertyName )
in* ,
propertyNames- :
): ;
{ 
PropertyChanged 
?  
.  !
Invoke! '
(' (
this( ,
,, -
new. 1$
PropertyChangedEventArgs2 J
(J K
propertyNameK W
)W X
)X Y
;Y Z
} 
} 	
} 
} È'
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
public 
List 
< 
string 
> 
GeneralBots '
{( )
get* -
;- .
set/ 2
;2 3
}4 5
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
public 
List 
< 
string 
> 
TDIBots #
{$ %
get& )
;) *
set+ .
;. /
}0 1
} 
public 

class 
Botssettings 
{ 
public 
float (
UpdateExpiredUsersTickMunite 1
{2 3
get4 7
;7 8
set9 <
;< =
}> ?
public 
Generalsettings 
GeneralSettings .
{/ 0
get1 4
;4 5
set6 9
;9 :
}; <
public 
Tdisettings 
TDISettings &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
}   
public"" 

class"" 
Generalsettings""  
{## 
}$$ 
public&& 

class&& 
Tdisettings&& 
{'' 
public(( 
List(( 
<(( 
string(( 
>(( 
Symbols(( #
{(($ %
get((& )
;(() *
set((+ .
;((. /
}((0 1
public)) 
Signalmessages)) 
SignalMessages)) ,
{))- .
get))/ 2
;))2 3
set))4 7
;))7 8
}))9 :
public** 
int** 
	RSIPeriot** 
{** 
get** "
;**" #
set**$ '
;**' (
}**) *
public++ 
int++ 
VotalityBandPeriot++ %
{++& '
get++( +
;+++ ,
set++- 0
;++0 1
}++2 3
public,, 
int,, 
RSIPLPeriot,, 
{,,  
get,,! $
;,,$ %
set,,& )
;,,) *
},,+ ,
public-- 
int-- 
	TSLPeriot-- 
{-- 
get-- "
;--" #
set--$ '
;--' (
}--) *
public.. 
int.. 
RSIOversoldLevel.. #
{..$ %
get..& )
;..) *
set..+ .
;... /
}..0 1
public// 
int// 
RSIOverboughtLevet// %
{//& '
get//( +
;//+ ,
set//- 0
;//0 1
}//2 3
}00 
public22 

class22 
Signalmessages22 
{33 
public44 
string44 
Buy44 
{44 
get44 
;44  
set44! $
;44$ %
}44& '
public55 
string55 
Sell55 
{55 
get55  
;55  !
set55" %
;55% &
}55' (
public66 
string66 
Exit66 
{66 
get66  
;66  !
set66" %
;66% &
}66' (
}77 
}99 ª 
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
}99  
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
TelegramBotClient '
GeneralClient( 5
{6 7
get8 ;
;; <
set= @
;@ A
}B C
public 
static 
void 
StartBotClients *
(* +
)+ ,
{ 	
	TDIClient 
= 
new 
( 
Settings $
.$ %
TelegramSettings% 5
.5 6
TDIBots6 =
[= >
$num> ?
]? @
)@ A
;A B
CancelToken 
= 
new #
CancellationTokenSource 5
(5 6
)6 7
;7 8
ReceiverOptions 
? 
receiverOptions ,
=- .
new/ 2
ReceiverOptions3 B
(B C
)C D
{ 
AllowedUpdates 
=  
Array! &
.& '
Empty' ,
<, -

UpdateType- 7
>7 8
(8 9
)9 :
,: ;
ThrowPendingUpdates #
=$ %
true& *
} 
; 
	TDIClient 
. 
StartReceiving $
($ %
updateHandler% 2
:2 3
UpdateHandlers4 B
.B C
HandleUpdateAsyncC T
,T U
pollingErrorHandler 2
:2 3
UpdateHandlers4 B
.B C
PollingErrorHandlerC V
,V W
receiverOptions .
:. /
receiverOptions0 ?
,? @
cancellationToken 0
:0 1
CancelToken2 =
.= >
Token> C
)C D
;D E
GeneralClient 
= 
new 
(  
Settings  (
.( )
TelegramSettings) 9
.9 :
GeneralBots: E
[E F
$numF G
]G H
)H I
;I J
} 	
}   
}!! ∆>
sC:\Users\√ñmer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\Telegram\UpdateHandlers.cs
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
class 
UpdateHandlers &
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
userII 
.II 

TDISymbolsII 
.II  
ToListII  &
(II& '
)II' (
.II( )
ForEachII) 0
(II0 1
xII1 2
=>II3 5
{JJ 
ifKK 
(KK 
xKK 
.KK 
ValueKK 
<KK  !
DateTimeKK" *
.KK* +
NowKK+ .
)KK. /
{LL 
textMM 
+=MM 
$"MM  "
$strMM" *
{MM* +
xMM+ ,
.MM, -
KeyMM- 0
}MM0 1
$strMM1 H
"MMH I
;MMI J
userNN 
.NN 

TDISymbolsNN '
.NN' (
RemoveNN( .
(NN. /
xNN/ 0
.NN0 1
KeyNN1 4
)NN4 5
;NN5 6
returnOO 
;OO 
}PP 
textRR 
+=RR 
$"RR 
$strRR &
{RR& '
xRR' (
.RR( )
KeyRR) ,
}RR, -
$strRR- H
{RRH I
xRRI J
.RRJ K
ValueRRK P
}RRP Q
$strRRQ S
"RRS T
;RRT U
}TT 
)TT 
;TT 
}UU 
elseVV 
{WW 
textXX 
=XX 
$strXX T
;XXT U
}YY 
await[[ 
	botClient[[ 
.[[  
SendTextMessageAsync[[ 0
([[0 1
chatId[[1 7
:[[7 8
message[[9 @
.[[@ A
Chat[[A E
.[[E F
Id[[F H
,[[H I
	parseMode[[J S
:[[S T
	ParseMode[[U ^
.[[^ _
Markdown[[_ g
,[[g h
text\\8 <
:\\< =
text\\> B
)\\B C
;\\C D
}]] 	
}^^ 
}__ Íª
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
 ª√
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
µµ 
{
∂∂ 
User
∑∑ 
user
∑∑ 
=
∑∑ 

Connection
∑∑  *
.
∑∑* +
Context
∑∑+ 2
.
∑∑2 3
Users
∑∑3 8
.
∑∑8 9
First
∑∑9 >
(
∑∑> ?
x
∑∑? @
=>
∑∑A C
x
∑∑D E
.
∑∑E F
Username
∑∑F N
==
∑∑O Q
Model
∑∑R W
.
∑∑W X
AddUserString
∑∑X e
)
∑∑e f
;
∑∑f g
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
∏∏- .
}
ππ 
}
∫∫ 
catch
ªª 
(
ªª 
	Exception
ªª 
ex
ªª 
)
ªª  
{
ºº 

MessageBox
ΩΩ 
.
ΩΩ 
Show
ΩΩ 
(
ΩΩ  
$"
ΩΩ  "
$str
ΩΩ" ;
{
ΩΩ; <
ex
ΩΩ< >
.
ΩΩ> ?
Message
ΩΩ? F
}
ΩΩF G
"
ΩΩG H
,
ΩΩH I
$str
ΩΩJ P
,
ΩΩP Q
MessageBoxButton
ΩΩR b
.
ΩΩb c
OK
ΩΩc e
,
ΩΩe f
MessageBoxImage
ΩΩg v
.
ΩΩv w
Error
ΩΩw |
)
ΩΩ| }
;
ΩΩ} ~
}
ææ 
}
øø 	
public
¡¡ 
void
¡¡ 
DelUser
¡¡ 
(
¡¡ 
)
¡¡ 
{
¬¬ 	
try
√√ 
{
ƒƒ 
if
≈≈ 
(
≈≈ 
Model
≈≈ 
.
≈≈ 
SelectedUser
≈≈ &
==
≈≈' )
null
≈≈* .
)
≈≈. /
return
≈≈0 6
;
≈≈6 7

Connection
∆∆ 
.
∆∆ 
Context
∆∆ "
.
∆∆" #
DelUser
∆∆# *
(
∆∆* +
Model
∆∆+ 0
.
∆∆0 1
SelectedUser
∆∆1 =
)
∆∆= >
;
∆∆> ?

Connection
«« 
.
«« 
Context
«« "
.
««" #
SaveChanges
««# .
(
««. /
)
««/ 0
;
««0 1

MessageBox
…… 
.
…… 
Show
…… 
(
……  
$str
……  >
,
……> ?
$str
……@ S
,
……S T
MessageBoxButton
……U e
.
……e f
OK
……f h
)
……h i
;
……i j
}
   
catch
ÀÀ 
(
ÀÀ 
	Exception
ÀÀ 
ex
ÀÀ 
)
ÀÀ  
{
ÃÃ 

MessageBox
ÕÕ 
.
ÕÕ 
Show
ÕÕ 
(
ÕÕ  
$"
ÕÕ  "
$str
ÕÕ" ;
{
ÕÕ; <
ex
ÕÕ< >
.
ÕÕ> ?
Message
ÕÕ? F
}
ÕÕF G
"
ÕÕG H
,
ÕÕH I
$str
ÕÕJ P
,
ÕÕP Q
MessageBoxButton
ÕÕR b
.
ÕÕb c
OK
ÕÕc e
,
ÕÕe f
MessageBoxImage
ÕÕg v
.
ÕÕv w
Error
ÕÕw |
)
ÕÕ| }
;
ÕÕ} ~
}
ŒŒ 
}
œœ 	
public
—— 
void
—— 
AddUserSymbol
—— !
(
——! "
)
——" #
{
““ 	
try
”” 
{
‘‘ 
if
’’ 
(
’’ 
Model
’’ 
.
’’ 
SelectedUser
’’ &
==
’’' )
null
’’* .
)
’’. /
return
’’0 6
;
’’6 7
bool
÷÷ 
showMessage
÷÷  
=
÷÷! "
false
÷÷# (
;
÷÷( )
if
ÿÿ 
(
ÿÿ 
Model
ÿÿ 
.
ÿÿ 
SelectedUser
ÿÿ &
.
ÿÿ& '

TDISymbols
ÿÿ' 1
.
ÿÿ1 2
Any
ÿÿ2 5
(
ÿÿ5 6
x
ÿÿ6 7
=>
ÿÿ8 :
x
ÿÿ; <
.
ÿÿ< =
Key
ÿÿ= @
.
ÿÿ@ A
Equals
ÿÿA G
(
ÿÿG H
Model
ÿÿH M
.
ÿÿM N!
AddUserSymbolString
ÿÿN a
)
ÿÿa b
)
ÿÿb c
)
ÿÿc d
{
ŸŸ 
int
⁄⁄ 
addDays
⁄⁄ 
=
⁄⁄  !
Model
⁄⁄" '
.
⁄⁄' (
AddUserDays
⁄⁄( 3
==
⁄⁄4 6
$num
⁄⁄7 8
?
⁄⁄9 :
$num
⁄⁄; A
:
⁄⁄B C
Model
⁄⁄D I
.
⁄⁄I J
AddUserDays
⁄⁄J U
;
⁄⁄U V
DateTime
‹‹ 
newDate
‹‹ $
=
‹‹% &
Model
‹‹' ,
.
‹‹, -
SelectedUser
‹‹- 9
.
‹‹9 :

TDISymbols
‹‹: D
.
‹‹D E
First
‹‹E J
(
‹‹J K
x
‹‹K L
=>
‹‹M O
x
‹‹P Q
.
‹‹Q R
Key
‹‹R U
.
‹‹U V
Equals
‹‹V \
(
‹‹\ ]
Model
‹‹] b
.
‹‹b c!
AddUserSymbolString
‹‹c v
)
‹‹v w
)
‹‹w x
.
‹‹x y
Value
‹‹y ~
>=‹‹ Å
DateTime‹‹Ç ä
.‹‹ä ã
Now‹‹ã é
?‹‹è ê
Model
›› 
.
›› 
SelectedUser
›› *
.
››* +

TDISymbols
››+ 5
.
››5 6
First
››6 ;
(
››; <
x
››< =
=>
››> @
x
››A B
.
››B C
Key
››C F
.
››F G
Equals
››G M
(
››M N
Model
››N S
.
››S T!
AddUserSymbolString
››T g
)
››g h
)
››h i
.
››i j
Value
››j o
.
››o p
AddDays
››p w
(
››w x
addDays
››x 
)›› Ä
:››Å Ç
DateTime
ﬁﬁ  
.
ﬁﬁ  !
Now
ﬁﬁ! $
.
ﬁﬁ$ %
AddDays
ﬁﬁ% ,
(
ﬁﬁ, -
addDays
ﬁﬁ- 4
)
ﬁﬁ4 5
;
ﬁﬁ5 6
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
[
‡‡1 2
Model
‡‡2 7
.
‡‡7 8!
AddUserSymbolString
‡‡8 K
??
‡‡L N
$str
‡‡O Q
]
‡‡Q R
=
‡‡S T
newDate
‡‡U \
;
‡‡\ ]
}
·· 
else
‚‚ 
{
„„ 
Model
‰‰ 
.
‰‰ 
SelectedUser
‰‰ &
.
‰‰& '

TDISymbols
‰‰' 1
.
‰‰1 2
Add
‰‰2 5
(
‰‰5 6
Model
‰‰6 ;
.
‰‰; <!
AddUserSymbolString
‰‰< O
??
‰‰P R
$str
‰‰S U
,
‰‰U V
DateTime
‰‰W _
.
‰‰_ `
Now
‰‰` c
.
‰‰c d
AddDays
‰‰d k
(
‰‰k l
Model
‰‰l q
.
‰‰q r
AddUserDays
‰‰r }
)
‰‰} ~
)
‰‰~ 
;‰‰ Ä
showMessage
ÂÂ 
=
ÂÂ  !
true
ÂÂ" &
;
ÂÂ& '
}
ÊÊ 
Model
ËË 
.
ËË 
SelectedUser
ËË "
.
ËË" #
SaveUserSymbols
ËË# 2
(
ËË2 3
)
ËË3 4
;
ËË4 5

Connection
ÈÈ 
.
ÈÈ 
Context
ÈÈ "
.
ÈÈ" #
SaveChanges
ÈÈ# .
(
ÈÈ. /
)
ÈÈ/ 0
;
ÈÈ0 1
Model
ÍÍ 
.
ÍÍ !
SelectedUserSymbols
ÍÍ )
=
ÍÍ* +
new
ÍÍ, /
(
ÍÍ/ 0
Model
ÍÍ0 5
.
ÍÍ5 6
SelectedUser
ÍÍ6 B
.
ÍÍB C

TDISymbols
ÍÍC M
)
ÍÍM N
;
ÍÍN O
if
ÏÏ 
(
ÏÏ 
showMessage
ÏÏ 
)
ÏÏ  

MessageBox
ÏÏ! +
.
ÏÏ+ ,
Show
ÏÏ, 0
(
ÏÏ0 1
$str
ÏÏ1 X
,
ÏÏX Y
$str
ÏÏZ j
,
ÏÏj k
MessageBoxButton
ÏÏl |
.
ÏÏ| }
OK
ÏÏ} 
)ÏÏ Ä
;ÏÏÄ Å
}
ÓÓ 
catch
ÔÔ 
(
ÔÔ 
	Exception
ÔÔ 
ex
ÔÔ 
)
ÔÔ  
{
 

MessageBox
ÒÒ 
.
ÒÒ 
Show
ÒÒ 
(
ÒÒ  
$"
ÒÒ  "
$str
ÒÒ" ;
{
ÒÒ; <
ex
ÒÒ< >
.
ÒÒ> ?
Message
ÒÒ? F
}
ÒÒF G
"
ÒÒG H
,
ÒÒH I
$str
ÒÒJ P
,
ÒÒP Q
MessageBoxButton
ÒÒR b
.
ÒÒb c
OK
ÒÒc e
,
ÒÒe f
MessageBoxImage
ÒÒg v
.
ÒÒv w
Error
ÒÒw |
)
ÒÒ| }
;
ÒÒ} ~
}
ÚÚ 
}
ÛÛ 	
public
ıı 
void
ıı 
DelUserSymbol
ıı !
(
ıı! "
)
ıı" #
{
ˆˆ 	
try
˜˜ 
{
¯¯ 
if
˘˘ 
(
˘˘ 
Model
˘˘ 
.
˘˘ 
SelectedUser
˘˘ &
==
˘˘' )
null
˘˘* .
||
˘˘/ 1
Model
˘˘2 7
.
˘˘7 8!
SelectedUserSymbols
˘˘8 K
?
˘˘K L
.
˘˘L M
Count
˘˘M R
==
˘˘S U
$num
˘˘V W
)
˘˘W X
return
˘˘Y _
;
˘˘_ `
Model
˚˚ 
.
˚˚ 
SelectedUser
˚˚ "
.
˚˚" #

TDISymbols
˚˚# -
.
˚˚- .
Remove
˚˚. 4
(
˚˚4 5
Model
˚˚5 :
.
˚˚: ; 
SelectedUserSymbol
˚˚; M
?
˚˚M N
.
˚˚N O
Key
˚˚O R
??
˚˚S U
$str
˚˚V X
)
˚˚X Y
;
˚˚Y Z
Model
¸¸ 
.
¸¸ 
SelectedUser
¸¸ "
.
¸¸" #
SaveUserSymbols
¸¸# 2
(
¸¸2 3
)
¸¸3 4
;
¸¸4 5

Connection
˝˝ 
.
˝˝ 
Context
˝˝ "
.
˝˝" #
SaveChanges
˝˝# .
(
˝˝. /
)
˝˝/ 0
;
˝˝0 1
Model
ˇˇ 
.
ˇˇ !
SelectedUserSymbols
ˇˇ )
=
ˇˇ* +
new
ˇˇ, /
(
ˇˇ/ 0
Model
ˇˇ0 5
.
ˇˇ5 6
SelectedUser
ˇˇ6 B
.
ˇˇB C

TDISymbols
ˇˇC M
)
ˇˇM N
;
ˇˇN O

MessageBox
ÄÄ 
.
ÄÄ 
Show
ÄÄ 
(
ÄÄ  
$str
ÄÄ  ;
,
ÄÄ; <
$str
ÄÄ= P
,
ÄÄP Q
MessageBoxButton
ÄÄR b
.
ÄÄb c
OK
ÄÄc e
)
ÄÄe f
;
ÄÄf g
}
ÅÅ 
catch
ÇÇ 
(
ÇÇ 
	Exception
ÇÇ 
ex
ÇÇ 
)
ÇÇ  
{
ÉÉ 

MessageBox
ÑÑ 
.
ÑÑ 
Show
ÑÑ 
(
ÑÑ  
$"
ÑÑ  "
$str
ÑÑ" ;
{
ÑÑ; <
ex
ÑÑ< >
.
ÑÑ> ?
Message
ÑÑ? F
}
ÑÑF G
"
ÑÑG H
,
ÑÑH I
$str
ÑÑJ P
,
ÑÑP Q
MessageBoxButton
ÑÑR b
.
ÑÑb c
OK
ÑÑc e
,
ÑÑe f
MessageBoxImage
ÑÑg v
.
ÑÑv w
Error
ÑÑw |
)
ÑÑ| }
;
ÑÑ} ~
}
ÖÖ 
}
ÜÜ 	
public
àà 
void
àà 
AddGroup
àà 
(
àà 
)
àà 
{
ââ 	
if
ää 
(
ää 
string
ää 
.
ää 
IsNullOrEmpty
ää $
(
ää$ %
Model
ää% *
.
ää* +
AddGroupString
ää+ 9
)
ää9 :
)
ää: ;
return
ää< B
;
ääB C
Settings
ãã 
.
ãã 
TelegramSettings
ãã %
.
ãã% &
	TDIGroups
ãã& /
.
ãã/ 0
Add
ãã0 3
(
ãã3 4
Model
ãã4 9
.
ãã9 :
AddGroupString
ãã: H
)
ããH I
;
ããI J
Settings
åå 
.
åå 
SaveSettings
åå !
(
åå! "
)
åå" #
;
åå# $

MessageBox
çç 
.
çç 
Show
çç 
(
çç 
$str
çç 4
,
çç4 5
$str
çç6 D
,
ççD E
MessageBoxButton
ççF V
.
ççV W
OK
ççW Y
)
ççY Z
;
ççZ [
}
éé 	
public
êê 
void
êê 
DelGroup
êê 
(
êê 
)
êê 
{
ëë 	
Settings
íí 
.
íí 
TelegramSettings
íí %
.
íí% &
	TDIGroups
íí& /
.
íí/ 0
Remove
íí0 6
(
íí6 7
Model
íí7 <
.
íí< =
SelectedGroup
íí= J
??
ííK M
$str
ííN P
)
ííP Q
;
ííQ R
Settings
ìì 
.
ìì 
SaveSettings
ìì !
(
ìì! "
)
ìì" #
;
ìì# $

MessageBox
îî 
.
îî 
Show
îî 
(
îî 
$str
îî 4
,
îî4 5
$str
îî6 D
,
îîD E
MessageBoxButton
îîF V
.
îîV W
OK
îîW Y
)
îîY Z
;
îîZ [
}
ïï 	
public
ôô 
void
ôô 
	DelSymbol
ôô 
(
ôô 
)
ôô 
{
öö 	
if
õõ 
(
õõ 
Model
õõ 
.
õõ 
SelectedSymbol
õõ $
==
õõ% '
null
õõ( ,
)
õõ, -
return
õõ. 4
;
õõ4 5
string
úú 
?
úú 
symbol
úú 
=
úú 
Model
úú "
.
úú" #
SelectedSymbol
úú# 1
.
úú1 2
Symbol
úú2 8
;
úú8 9
Settings
ûû 
.
ûû 
BotsSettings
ûû !
.
ûû! "
TDISettings
ûû" -
.
ûû- .
Symbols
ûû. 5
.
ûû5 6
Remove
ûû6 <
(
ûû< =
Model
ûû= B
.
ûûB C
SelectedSymbol
ûûC Q
.
ûûQ R
Symbol
ûûR X
)
ûûX Y
;
ûûY Z
Model
üü 
.
üü 
SelectedSymbol
üü  
.
üü  !
Dispose
üü! (
(
üü( )
)
üü) *
;
üü* +
Settings
°° 
.
°° 
BotsSettings
°° !
.
°°! "
TDISettings
°°" -
.
°°- .
Symbols
°°. 5
.
°°5 6
Remove
°°6 <
(
°°< =
Model
°°= B
.
°°B C
SelectedSymbol
°°C Q
.
°°Q R
Symbol
°°R X
)
°°X Y
;
°°Y Z
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
¢¢# $
Model
§§ 
.
§§ 
Symbols
§§ 
.
§§ 
Remove
§§  
(
§§  !
Model
§§! &
.
§§& '
SelectedSymbol
§§' 5
)
§§5 6
;
§§6 7
if
ßß 
(
ßß 
Model
ßß 
.
ßß 
UISymbol
ßß 
==
ßß !
symbol
ßß" (
&&
ßß) +
Model
ßß, 1
.
ßß1 2
Symbols
ßß2 9
.
ßß9 :
Count
ßß: ?
>
ßß@ A
$num
ßßB C
)
ßßC D
{
®® 
Model
©© 
.
©© 
SelectedSymbol
©© $
=
©©% &
Model
©©' ,
.
©©, -
Symbols
©©- 4
[
©©4 5
$num
©©5 6
]
©©6 7
;
©©7 8
SetUISymbol
™™ 
(
™™ 
)
™™ 
;
™™ 
}
´´ 
}
¨¨ 	
public
ÆÆ 
void
ÆÆ 
	AddSymbol
ÆÆ 
(
ÆÆ 
)
ÆÆ 
{
ØØ 	
try
∞∞ 
{
±± 
if
≤≤ 
(
≤≤ 
Model
≤≤ 
.
≤≤ 
Symbols
≤≤ !
.
≤≤! "
Any
≤≤" %
(
≤≤% &
x
≤≤& '
=>
≤≤( *
x
≤≤+ ,
.
≤≤, -
Symbol
≤≤- 3
==
≤≤4 6
Model
≤≤7 <
.
≤≤< =
AddSymbolString
≤≤= L
)
≤≤L M
)
≤≤M N
{
≥≥ 

MessageBox
¥¥ 
.
¥¥ 
Show
¥¥ #
(
¥¥# $
$str
¥¥$ =
,
¥¥= >
$str
¥¥? N
,
¥¥N O
MessageBoxButton
¥¥P `
.
¥¥` a
OK
¥¥a c
,
¥¥c d
MessageBoxImage
¥¥e t
.
¥¥t u
Information¥¥u Ä
)¥¥Ä Å
;¥¥Å Ç
return
µµ 
;
µµ 
}
∂∂ 

_AddSymbol
∏∏ 
(
∏∏ 
Model
∏∏  
.
∏∏  !
AddSymbolString
∏∏! 0
??
∏∏1 3
$str
∏∏4 6
)
∏∏6 7
;
∏∏7 8

MessageBox
ππ 
.
ππ 
Show
ππ 
(
ππ  
$str
ππ  ;
,
ππ; <
$str
ππ= M
,
ππM N
MessageBoxButton
ππO _
.
ππ_ `
OK
ππ` b
)
ππb c
;
ππc d
}
∫∫ 
catch
ªª 
(
ªª 
	Exception
ªª 
ex
ªª 
)
ªª  
{
ºº 

MessageBox
ΩΩ 
.
ΩΩ 
Show
ΩΩ 
(
ΩΩ  
$"
ΩΩ  "
$str
ΩΩ" ;
{
ΩΩ; <
ex
ΩΩ< >
.
ΩΩ> ?
Message
ΩΩ? F
}
ΩΩF G
"
ΩΩG H
,
ΩΩH I
$str
ΩΩJ P
,
ΩΩP Q
MessageBoxButton
ΩΩR b
.
ΩΩb c
OK
ΩΩc e
,
ΩΩe f
MessageBoxImage
ΩΩg v
.
ΩΩv w
Error
ΩΩw |
)
ΩΩ| }
;
ΩΩ} ~
}
ææ 
}
øø 	
private
¡¡ 
void
¡¡ 

_AddSymbol
¡¡ 
(
¡¡  
string
¡¡  &
symbol
¡¡' -
)
¡¡- .
{
¬¬ 	
Model
√√ 
.
√√ 
Symbols
√√ 
.
√√ 
Add
√√ 
(
√√ 
new
√√ !
TDI
√√" %
(
√√% &
symbol
√√& ,
,
√√, -
Binance
√√. 5
.
√√5 6
Net
√√6 9
.
√√9 :
Enums
√√: ?
.
√√? @
KlineInterval
√√@ M
.
√√M N
	OneMinute
√√N W
,
√√W X
(
√√Y Z
string
√√Z `
symbol
√√a g
,
√√g h

Dictionary
√√i s
<
√√s t
string
√√t z
,
√√z {
List√√| Ä
<√√Ä Å
object√√Å á
>√√á à
>√√à â
values√√ä ê
)√√ê ë
=>√√í î
{√√ï ñ
}√√ó ò
,√√ò ô!
SendSignalMessage√√ö ´
)√√´ ¨
{√√≠ Æ
}√√Ø ∞
)√√∞ ±
;√√± ≤
Settings
ƒƒ 
.
ƒƒ 
BotsSettings
ƒƒ !
.
ƒƒ! "
TDISettings
ƒƒ" -
.
ƒƒ- .
Symbols
ƒƒ. 5
.
ƒƒ5 6
Add
ƒƒ6 9
(
ƒƒ9 :
symbol
ƒƒ: @
)
ƒƒ@ A
;
ƒƒA B
Settings
≈≈ 
.
≈≈ 
SaveSettings
≈≈ !
(
≈≈! "
)
≈≈" #
;
≈≈# $
}
∆∆ 	
public
»» 
Task
»» 
AddAllSymbols
»» !
(
»»! "
)
»»" #
{
…… 	
CryptoExchange
   
.
   
Net
   
.
   
Objects
   &
.
  & '
WebCallResult
  ' 4
<
  4 5
Binance
  5 <
.
  < =
Net
  = @
.
  @ A
Objects
  A H
.
  H I
Models
  I O
.
  O P
Spot
  P T
.
  T U!
BinanceExchangeInfo
  U h
>
  h i
?
  i j
exchangeInfos
  k x
=
  y z
StaticBinance  { à
.  à â
Client  â è
.  è ê
SpotApi  ê ó
.  ó ò
ExchangeData  ò §
.  § •$
GetExchangeInfoAsync  • π
(  π ∫
)  ∫ ª
.  ª º
Result  º ¬
;  ¬ √
Model
ÀÀ 
.
ÀÀ 
Symbols
ÀÀ 
.
ÀÀ 
Clear
ÀÀ 
(
ÀÀ  
)
ÀÀ  !
;
ÀÀ! "
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
ÃÃ5 6
Clear
ÃÃ6 ;
(
ÃÃ; <
)
ÃÃ< =
;
ÃÃ= >
exchangeInfos
ÕÕ 
.
ÕÕ 
Data
ÕÕ 
.
ÕÕ 
Symbols
ÕÕ &
.
ÕÕ& '
ToList
ÕÕ' -
(
ÕÕ- .
)
ÕÕ. /
.
ÕÕ/ 0
ForEach
ÕÕ0 7
(
ÕÕ7 8
x
ÕÕ8 9
=>
ÕÕ: <
{
ŒŒ 
try
œœ 
{
–– 

_AddSymbol
—— 
(
—— 
x
——  
.
——  !
Name
——! %
)
——% &
;
——& '
}
““ 
catch
”” 
(
”” 
	Exception
””  
ex
””! #
)
””# $
{
‘‘ 

MessageBox
’’ 
.
’’ 
Show
’’ #
(
’’# $
$"
’’$ &
{
’’& '
x
’’' (
.
’’( )
Name
’’) -
}
’’- .
$str
’’. S
{
’’S T
ex
’’T V
.
’’V W
Message
’’W ^
}
’’^ _
"
’’_ `
,
’’` a
$str
’’b h
,
’’h i
MessageBoxButton
’’j z
.
’’z {
OK
’’{ }
,
’’} ~
MessageBoxImage’’ é
.’’é è
Error’’è î
)’’î ï
;’’ï ñ
}
÷÷ 
}
◊◊ 
)
◊◊ 
;
◊◊ 
return
ŸŸ 
Task
ŸŸ 
.
ŸŸ 
Delay
ŸŸ 
(
ŸŸ 
$num
ŸŸ 
)
ŸŸ  
;
ŸŸ  !
}
⁄⁄ 	
public
ﬁﬁ 
void
ﬁﬁ 
SendSignalMessage
ﬁﬁ %
(
ﬁﬁ% &
string
ﬁﬁ& ,
symbol
ﬁﬁ- 3
,
ﬁﬁ3 4
Enums
ﬁﬁ5 :
.
ﬁﬁ: ;

SignalType
ﬁﬁ; E
type
ﬁﬁF J
)
ﬁﬁJ K
{
ﬂﬂ 	
string
‡‡ 
message
‡‡ 
=
‡‡ 
type
‡‡ !
switch
‡‡" (
{
·· 
Enums
‚‚ 
.
‚‚ 

SignalType
‚‚  
.
‚‚  !
Sell
‚‚! %
=>
‚‚& (
Settings
‚‚) 1
.
‚‚1 2
BotsSettings
‚‚2 >
.
‚‚> ?
TDISettings
‚‚? J
.
‚‚J K
SignalMessages
‚‚K Y
.
‚‚Y Z
Sell
‚‚Z ^
,
‚‚^ _
Enums
„„ 
.
„„ 

SignalType
„„  
.
„„  !
Buy
„„! $
=>
„„% '
Settings
„„( 0
.
„„0 1
BotsSettings
„„1 =
.
„„= >
TDISettings
„„> I
.
„„I J
SignalMessages
„„J X
.
„„X Y
Buy
„„Y \
,
„„\ ]
Enums
‰‰ 
.
‰‰ 

SignalType
‰‰  
.
‰‰  !
Exit
‰‰! %
=>
‰‰& (
Settings
‰‰) 1
.
‰‰1 2
BotsSettings
‰‰2 >
.
‰‰> ?
TDISettings
‰‰? J
.
‰‰J K
SignalMessages
‰‰K Y
.
‰‰Y Z
Exit
‰‰Z ^
,
‰‰^ _
_
ÂÂ 
=>
ÂÂ 
$str
ÂÂ 
,
ÂÂ 
}
ÊÊ 
;
ÊÊ 
if
ËË 
(
ËË 
string
ËË 
.
ËË 
IsNullOrEmpty
ËË $
(
ËË$ %
message
ËË% ,
)
ËË, -
)
ËË- .
return
ËË/ 5
;
ËË5 6
message
ÈÈ 
=
ÈÈ 
message
ÈÈ 
.
ÈÈ 
Replace
ÈÈ %
(
ÈÈ% &
$str
ÈÈ& 0
,
ÈÈ0 1
symbol
ÈÈ2 8
)
ÈÈ8 9
;
ÈÈ9 :
foreach
ÎÎ 
(
ÎÎ 
User
ÎÎ 
user
ÎÎ 
in
ÎÎ !
Model
ÎÎ" '
.
ÎÎ' (
Users
ÎÎ( -
)
ÎÎ- .
{
ÏÏ 
try
ÌÌ 
{
ÓÓ 
if
ÔÔ 
(
ÔÔ 
user
ÔÔ 
.
ÔÔ 
ChatId
ÔÔ #
==
ÔÔ$ &
$num
ÔÔ' (
||
ÔÔ) +
!
ÔÔ, -
user
ÔÔ- 1
.
ÔÔ1 2

TDISymbols
ÔÔ2 <
.
ÔÔ< =
Any
ÔÔ= @
(
ÔÔ@ A
x
ÔÔA B
=>
ÔÔC E
x
ÔÔF G
.
ÔÔG H
Key
ÔÔH K
.
ÔÔK L
Equals
ÔÔL R
(
ÔÔR S
symbol
ÔÔS Y
)
ÔÔY Z
&&
ÔÔ[ ]
x
ÔÔ^ _
.
ÔÔ_ `
Value
ÔÔ` e
>
ÔÔf g
DateTime
ÔÔh p
.
ÔÔp q
Now
ÔÔq t
)
ÔÔt u
)
ÔÔu v
continue
ÔÔw 
;ÔÔ Ä

BotClients
 
.
 
	TDIClient
 (
.
( )"
SendTextMessageAsync
) =
(
= >
user
> B
.
B C
ChatId
C I
,
I J
message
K R
)
R S
;
S T
}
ÒÒ 
catch
ÚÚ 
(
ÚÚ 
	Exception
ÚÚ  
ex
ÚÚ! #
)
ÚÚ# $
{
ÛÛ 
Console
ÙÙ 
.
ÙÙ 
	WriteLine
ÙÙ %
(
ÙÙ% &
$"
ÙÙ& (
$str
ÙÙ( 9
{
ÙÙ9 :
user
ÙÙ: >
.
ÙÙ> ?
Username
ÙÙ? G
}
ÙÙG H
$str
ÙÙH c
{
ÙÙc d
ex
ÙÙd f
.
ÙÙf g
Message
ÙÙg n
}
ÙÙn o
"
ÙÙo p
)
ÙÙp q
;
ÙÙq r
}
ıı 
}
˜˜ 
foreach
˘˘ 
(
˘˘ 
string
˘˘ 
?
˘˘ 
group
˘˘ "
in
˘˘# %
Settings
˘˘& .
.
˘˘. /
TelegramSettings
˘˘/ ?
.
˘˘? @
	TDIGroups
˘˘@ I
)
˘˘I J
{
˙˙ 
try
˚˚ 
{
¸¸ 

BotClients
˝˝ 
.
˝˝ 
	TDIClient
˝˝ (
.
˝˝( )"
SendTextMessageAsync
˝˝) =
(
˝˝= >
group
˝˝> C
,
˝˝C D
message
˝˝E L
)
˝˝L M
;
˝˝M N
}
˛˛ 
catch
ˇˇ 
(
ˇˇ 
	Exception
ˇˇ  
ex
ˇˇ! #
)
ˇˇ# $
{
ÄÄ 
Console
ÅÅ 
.
ÅÅ 
	WriteLine
ÅÅ %
(
ÅÅ% &
$"
ÅÅ& (
$str
ÅÅ( 8
{
ÅÅ8 9
group
ÅÅ9 >
}
ÅÅ> ?
$str
ÅÅ? Z
{
ÅÅZ [
ex
ÅÅ[ ]
.
ÅÅ] ^
Message
ÅÅ^ e
}
ÅÅe f
"
ÅÅf g
)
ÅÅg h
;
ÅÅh i
}
ÇÇ 
}
ÉÉ 
}
ÑÑ 	
public
àà 
void
àà 
SaveSettings
àà  
(
àà  !
)
àà! "
{
ââ 	
Settings
ää 
.
ää 
BotsSettings
ää !
.
ää! "
TDISettings
ää" -
.
ää- .
SignalMessages
ää. <
.
ää< =
Sell
ää= A
=
ääB C
Model
ääD I
.
ääI J
SellSignalString
ääJ Z
;
ääZ [
Settings
ãã 
.
ãã 
BotsSettings
ãã !
.
ãã! "
TDISettings
ãã" -
.
ãã- .
SignalMessages
ãã. <
.
ãã< =
Buy
ãã= @
=
ããA B
Model
ããC H
.
ããH I
BuySignalString
ããI X
;
ããX Y
Settings
åå 
.
åå 
BotsSettings
åå !
.
åå! "
TDISettings
åå" -
.
åå- .
SignalMessages
åå. <
.
åå< =
Exit
åå= A
=
ååB C
Model
ååD I
.
ååI J
ExitSignalString
ååJ Z
;
ååZ [
Settings
éé 
.
éé 
BotsSettings
éé !
.
éé! "
TDISettings
éé" -
.
éé- .
	RSIPeriot
éé. 7
=
éé8 9
Model
éé: ?
.
éé? @
	RSIPeriot
éé@ I
;
ééI J
Settings
èè 
.
èè 
BotsSettings
èè !
.
èè! "
TDISettings
èè" -
.
èè- .
RSIPLPeriot
èè. 9
=
èè: ;
Model
èè< A
.
èèA B
RSIPLPeriot
èèB M
;
èèM N
Settings
êê 
.
êê 
BotsSettings
êê !
.
êê! "
TDISettings
êê" -
.
êê- . 
VotalityBandPeriot
êê. @
=
êêA B
Model
êêC H
.
êêH I
VBPeriot
êêI Q
;
êêQ R
Settings
ëë 
.
ëë 
BotsSettings
ëë !
.
ëë! "
TDISettings
ëë" -
.
ëë- .
	TSLPeriot
ëë. 7
=
ëë8 9
Model
ëë: ?
.
ëë? @
	TSLPeriot
ëë@ I
;
ëëI J
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
RSIOversoldLevel
íí. >
=
íí? @
Model
ííA F
.
ííF G
RSIOversoldLevel
ííG W
;
ííW X
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
RSIOverboughtLevet
ìì. @
=
ììA B
Model
ììC H
.
ììH I 
RSIOverboughtLevel
ììI [
;
ìì[ \
Settings
ïï 
.
ïï 
SaveSettings
ïï !
(
ïï! "
)
ïï" #
;
ïï# $

MessageBox
óó 
.
óó 
Show
óó 
(
óó 
$str
óó ;
,
óó; <
$str
óó= Q
,
óóQ R
MessageBoxButton
óóS c
.
óóc d
OK
óód f
)
óóf g
;
óóg h
}
òò 	
public
öö 
void
öö 
LoadSettings
öö  
(
öö  !
)
öö! "
{
õõ 	
Model
úú 
.
úú 
SellSignalString
úú "
=
úú# $
Settings
úú% -
.
úú- .
BotsSettings
úú. :
.
úú: ;
TDISettings
úú; F
.
úúF G
SignalMessages
úúG U
.
úúU V
Sell
úúV Z
;
úúZ [
Model
ùù 
.
ùù 
BuySignalString
ùù !
=
ùù" #
Settings
ùù$ ,
.
ùù, -
BotsSettings
ùù- 9
.
ùù9 :
TDISettings
ùù: E
.
ùùE F
SignalMessages
ùùF T
.
ùùT U
Buy
ùùU X
;
ùùX Y
Model
ûû 
.
ûû 
ExitSignalString
ûû "
=
ûû# $
Settings
ûû% -
.
ûû- .
BotsSettings
ûû. :
.
ûû: ;
TDISettings
ûû; F
.
ûûF G
SignalMessages
ûûG U
.
ûûU V
Exit
ûûV Z
;
ûûZ [
Model
†† 
.
†† 
	RSIPeriot
†† 
=
†† 
Settings
†† &
.
††& '
BotsSettings
††' 3
.
††3 4
TDISettings
††4 ?
.
††? @
	RSIPeriot
††@ I
;
††I J
Model
°° 
.
°° 
RSIPLPeriot
°° 
=
°° 
Settings
°°  (
.
°°( )
BotsSettings
°°) 5
.
°°5 6
TDISettings
°°6 A
.
°°A B
RSIPLPeriot
°°B M
;
°°M N
Model
¢¢ 
.
¢¢ 
	TSLPeriot
¢¢ 
=
¢¢ 
Settings
¢¢ &
.
¢¢& '
BotsSettings
¢¢' 3
.
¢¢3 4
TDISettings
¢¢4 ?
.
¢¢? @
	TSLPeriot
¢¢@ I
;
¢¢I J
Model
££ 
.
££ 
VBPeriot
££ 
=
££ 
Settings
££ %
.
££% &
BotsSettings
££& 2
.
££2 3
TDISettings
££3 >
.
££> ? 
VotalityBandPeriot
££? Q
;
££Q R
Model
§§ 
.
§§ 
RSIOversoldLevel
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
RSIOversoldLevel
§§G W
;
§§W X
Model
•• 
.
••  
RSIOverboughtLevel
•• $
=
••% &
Settings
••' /
.
••/ 0
BotsSettings
••0 <
.
••< =
TDISettings
••= H
.
••H I 
RSIOverboughtLevet
••I [
;
••[ \
}
¶¶ 	
}
®® 
}©© Ñ
tC:\Users\√ñmer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\UI\Views\MainWindow.xaml.cs
	namespace 	!
EASYTelegramSignalBot
 
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
;# $
DatabaseContext 

_DBContext &
=' (
new) ,
(, -
)- .
;. /

_DBContext 
. !
CheckDatabaseSettings ,
(, -
)- .
;. /

_DBContext 
. 
Dispose 
( 
)  
;  !

BotClients 
. 
StartBotClients &
(& '
)' (
;( )
InitializeComponent 
(  
)  !
;! "
} 	
} 
} ˇ
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