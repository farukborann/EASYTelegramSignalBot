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
 Ω
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
 
DatabaseContext

 %
Context

& -
{

. /
get

0 3
;

3 4
set

5 8
;

8 9
}

: ;
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
new 
DatabaseContext )
() *
)* +
;+ ,
} 	
static 

Connection 
( 
) 
{ 	
Context 
= 
new 
( 
) 
; 
refreshContextTimer 
=  !
new" %
DispatcherTimer& 5
(5 6
)6 7
;7 8
refreshContextTimer 
.  
Interval  (
=) *
new+ .
TimeSpan/ 7
(7 8
$num8 9
,9 :
$num; <
,< =
$num> ?
)? @
;@ A
refreshContextTimer 
.  
Tick  $
+=% '
new( +
EventHandler, 8
(8 9
Refresh9 @
)@ A
;A B
refreshContextTimer 
.  
Start  %
(% &
)& '
;' (
} 	
} 
} ä
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
.0 1$
DatabaseConnectionString1 I
)I J
;J K
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
. #
ResetDatabaseFirstStart 0
)0 1
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
. #
IsDatabaseEnsureCreated 6
)6 7
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
}-- ˇ
sC:\Users\√ñmer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\Database\DatabaseHelper.cs
	namespace 	!
EASYTelegramSignalBot
 
.  
Database  (
{ 
public 

static 
class 
DatabaseHelper &
{		 
public 
static 
void 
DelUser "
(" #
this# '
DatabaseContext( 7
	DbContext8 A
,A B
UserC G
userH L
)L M
{ 	
	DbContext 
. 
Remove 
( 
user !
)! "
;" #
} 	
public 
static 
List 
< 
User 
>  
GetTDIExpiredUsers! 3
(3 4
this4 8
DatabaseContext9 H
ContextI P
)P Q
{ 	
return 
Context 
. 
Users  
.  !
Where! &
(& '
x' (
=>) +
x, -
.- .
TDIExpiryDate. ;
<=< >
DateTime? G
.G H
NowH K
)K L
.L M
ToListM S
(S T
)T U
;U V
} 	
public 
static 
List 
< 
User 
>  
GetPACExpiredUsers! 3
(3 4
this4 8
DatabaseContext9 H
ContextI P
)P Q
{ 	
return 
Context 
. 
Users  
.  !
Where! &
(& '
x' (
=>) +
x, -
.- .
PACExpiryDate. ;
<=< >
DateTime? G
.G H
NowH K
)K L
.L M
ToListM S
(S T
)T U
;U V
} 	
public 
static 
List 
< 
User 
>  
GetUsers! )
() *
this* .
DatabaseContext/ >
Context? F
)F G
{ 	
return 
Context 
. 
Users  
.  !
ToList! '
(' (
)( )
;) *
} 	
} 
} ö
pC:\Users\√ñmer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\Database\Models\User.cs
	namespace 	!
EASYTelegramSignalBot
 
.  
Database  (
.( )
Models) /
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
string		 
UserName		 
{		  
get		! $
;		$ %
set		& )
;		) *
}		+ ,
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
public 
DateTime 
TDIExpiryDate %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public 
bool 
PAC 
{ 
get 
; 
set "
;" #
}$ %
public 
DateTime 
PACExpiryDate %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
} 
} ©
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
(D E
HelpersE L
.L M
SubscriptionTypeM ]
subType^ e
,e f
stringg m
symboln t
,t u
KlineInterval	v É
interval
Ñ å
,
å ç

TickAction
é ò

tickAction
ô £
)
£ §
{ 	
try 
{ 
var 
subscription  
=! ""
SubscribedKlineUpdates# 9
.9 :
First: ?
(? @
x@ A
=>B D
xE F
.F G
SymbolG M
.M N
ToLowerN U
(U V
)V W
.W X
EqualsX ^
(^ _
symbol_ e
.e f
ToLowerf m
(m n
)n o
)o p
&&q s
xt u
.u v
Intervalv ~
.~ 
Equals	 Ö
(
Ö Ü
interval
Ü é
)
é è
)
è ê
;
ê ë
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
{ 
var 
subscription  
=! "
new# &
KlineSubscription' 8
(8 9
subType9 @
,@ A
symbolB H
,H I
intervalJ R
,R S

tickActionT ^
.^ _

KlineCount_ i
)i j
;j k
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
}"" ù+
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
{! "
get# &
{' (
return) /

__OpenDate0 :
;: ;
}< =
set> A
{B C

__OpenDateD N
=O P
valueQ V
;V W
}X Y
}Z [
public 
DateTime 

_CloseDate "
{" #
get$ '
{( )
return* 0
__CloseDate1 <
;< =
}> ?
set@ C
{D E
__CloseDateF Q
=R S
valueT Y
;Y Z
}[ \
}] ^
public 
decimal 
_Open 
{ 
get "
{# $
return% +
__Open, 2
;2 3
}4 5
set6 9
{: ;
__Open< B
=C D
valueE J
;J K
}L M
}N O
public 
decimal 
_High 
{ 
get !
{" #
return$ *
__High+ 1
;1 2
}3 4
set5 8
{9 :
__High; A
=B C
valueD I
;I J
}K L
}M N
public 
decimal 
_Low 
{ 
get  
{! "
return# )
__Low* /
;/ 0
}1 2
set3 6
{7 8
__Low9 >
=? @
valueA F
;F G
}H I
}J K
public 
decimal 
_Close 
{ 
get "
{# $
return% +
__Close, 3
;3 4
}5 6
set7 :
{; <
__Close= D
=E F
valueG L
;L M
}N O
}P Q
public 
decimal 
_Volume 
{ 
get  #
{$ %
return& ,
__Volume- 5
;5 6
}7 8
set9 <
{= >
__Volume? G
=H I
valueJ O
;O P
}Q R
}S T
public 
DateTime 
Date 
{ 
get "
{# $
return% +
	_OpenDate, 5
;5 6
}7 8
set9 <
{= >
	_OpenDate? H
=I J
valueK P
;P Q
}R S
}T U
public 
decimal 
Open 
{ 
get !
{" #
return$ *
_Open+ 0
;0 1
}2 3
set4 7
{8 9
_Open: ?
=@ A
valueB G
;G H
}I J
}K L
public 
decimal 
High 
{ 
get !
{" #
return$ *
_High+ 0
;0 1
}2 3
set4 7
{8 9
_High: ?
=@ A
valueB G
;G H
}I J
}K L
public 
decimal 
Low 
{ 
get  
{! "
return# )
_Low* .
;. /
}0 1
set2 5
{6 7
_Low8 <
== >
value? D
;D E
}F G
}H I
public 
decimal 
Close 
{ 
get "
{# $
return% +
_Close, 2
;2 3
}4 5
set6 9
{: ;
_Close< B
=C D
valueE J
;J K
}L M
}N O
public 
decimal 
Volume 
{ 
get  #
{$ %
return& ,
_Volume- 4
;4 5
}6 7
set8 ;
{< =
_Volume> E
=F G
valueH M
;M N
}O P
}Q R
} 
}   Àq
xC:\Users\√ñmer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\Finance\Binance\Subscription.cs
	namespace 	!
EASYTelegramSignalBot
 
.  
Finance  '
.' (
Binance( /
{ 
public 

class 
KlineSubscription "
{ 
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
public 
SubscriptionType 
Type  $
{$ %
get& )
;) *
set+ .
;. /
}0 1
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
(  !
SubscriptionType! 1
type2 6
,6 7
string8 >
symbol? E
,E F
KlineIntervalG T
intervalU ]
,] ^
int_ b
limitc h
)h i
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
;'' 
switch)) 
()) 
type)) 
))) 
{** 
case++ 
SubscriptionType++ %
.++% &
CoinFutures++& 1
:++1 2

CallResult,, 
=,,  
StaticBinance,,! .
.,,. /
SocketClient,,/ ;
.,,; <
CoinFuturesStreams,,< N
.,,N O(
SubscribeToKlineUpdatesAsync,,O k
(,,k l
Symbol-- 
,-- 
Interval..  
,..  !
data// 
=>// 
{//  !
RunFuncs//" *
(//* +
data//+ /
)/// 0
;//0 1
}//2 3
,//3 4#
CancellationTokenSource00 /
.00/ 0
Token000 5
)11 
;11 
break22 
;22 
case33 
SubscriptionType33 %
.33% &
Spot33& *
:33* +

CallResult44 
=44  
StaticBinance44! .
.44. /
SocketClient44/ ;
.44; <
SpotStreams44< G
.44G H(
SubscribeToKlineUpdatesAsync44H d
(44d e
Symbol55 
,55 
Interval66  
,66  !
data77 
=>77 
{77  !
RunFuncs77" *
(77* +
data77+ /
)77/ 0
;770 1
}772 3
,773 4#
CancellationTokenSource88 /
.88/ 0
Token880 5
)99 
;99 
break:: 
;:: 
case;; 
SubscriptionType;; %
.;;% &

UsdFutures;;& 0
:;;0 1
default<< 
:<< 

CallResult== 
===  
StaticBinance==! .
.==. /
SocketClient==/ ;
.==; <
UsdFuturesStreams==< M
.==M N(
SubscribeToKlineUpdatesAsync==N j
(==j k
Symbol>> 
,>> 
Interval??  
,??  !
data@@ 
=>@@ 
{@@  !
RunFuncs@@" *
(@@* +
data@@+ /
)@@/ 0
;@@0 1
}@@2 3
,@@3 4#
CancellationTokenSourceAA /
.AA/ 0
TokenAA0 5
)BB 
;BB 
breakCC 
;CC 
}DD 
}EE 	
privateGG 
voidGG 
RunFuncsGG 
(GG 
	DataEventGG '
<GG' (#
IBinanceStreamKlineDataGG( ?
>GG? @
dataGGA E
)GGE F
{HH 	
ifII 
(II 
!II 
KlinesII 
.II 
LastII 
(II 
)II 
.II 
DateII #
.II# $
EqualsII$ *
(II* +
dataII+ /
.II/ 0
DataII0 4
.II4 5
DataII5 9
.II9 :
OpenTimeII: B
)IIB C
)IIC D
{JJ 
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
(LL7 8
TriggerTypeLL8 C
.LLC D

KlineCloseLLD N
)LLN O
)LLO P
.LLP Q
ToListLLQ W
(LLW X
)LLX Y
.LLY Z
ForEachLLZ a
(LLa b
xLLb c
=>LLd f
TaskLLg k
.LLk l
RunLLl o
(LLo p
(LLp q
)LLq r
=>LLs u
xLLv w
.LLw x
ActionLLx ~
(LL~ 
Klines	LL Ö
.
LLÖ Ü
GetRange
LLÜ é
(
LLé è
Klines
LLè ï
.
LLï ñ
Count
LLñ õ
-
LLõ ú
x
LLú ù
.
LLù û

KlineCount
LLû ®
,
LL® ©
x
LL™ ´
.
LL´ ¨

KlineCount
LL¨ ∂
)
LL∂ ∑
)
LL∑ ∏
)
LL∏ π
.
LLπ ∫
Wait
LL∫ æ
(
LLæ ø
)
LLø ¿
)
LL¿ ¡
;
LL¡ ¬
KlinesOO 
.OO 
RemoveAtOO 
(OO  
$numOO  !
)OO! "
;OO" #
KlinesPP 
.PP 
AddPP 
(PP 
dataPP 
.PP  
DataPP  $
.PP$ %
DataPP% )
.PP) *
ToKlinePP* 1
(PP1 2
)PP2 3
)PP3 4
;PP4 5
ActionsSS 
.SS 
WhereSS 
(SS 
xSS 
=>SS  "
xSS# $
.SS$ %
TriggerTypeSS% 0
.SS0 1
EqualsSS1 7
(SS7 8
TriggerTypeSS8 C
.SSC D
	KlineOpenSSD M
)SSM N
)SSN O
.SSO P
ToListSSP V
(SSV W
)SSW X
.SSX Y
ForEachSSY `
(SS` a
xSSa b
=>SSc e
TaskSSf j
.SSj k
RunSSk n
(SSn o
(SSo p
)SSp q
=>SSr t
xSSu v
.SSv w
ActionSSw }
(SS} ~
Klines	SS~ Ñ
.
SSÑ Ö
GetRange
SSÖ ç
(
SSç é
Klines
SSé î
.
SSî ï
Count
SSï ö
-
SSõ ú
x
SSù û
.
SSû ü

KlineCount
SSü ©
,
SS© ™
x
SS´ ¨
.
SS¨ ≠

KlineCount
SS≠ ∑
)
SS∑ ∏
)
SS∏ π
)
SSπ ∫
)
SS∫ ª
;
SSª º
}TT 
elseUU 
{VV 
KlinesWW 
[WW 
^WW 
$numWW 
]WW 
=WW 
dataWW !
.WW! "
DataWW" &
.WW& '
DataWW' +
.WW+ ,
ToKlineWW, 3
(WW3 4
)WW4 5
;WW5 6
}XX 
ActionsZZ 
.ZZ 
WhereZZ 
(ZZ 
xZZ 
=>ZZ 
xZZ  
.ZZ  !
TriggerTypeZZ! ,
.ZZ, -
EqualsZZ- 3
(ZZ3 4
TriggerTypeZZ4 ?
.ZZ? @
KlineUpdateZZ@ K
)ZZK L
)ZZL M
.ZZM N
ToListZZN T
(ZZT U
)ZZU V
.ZZV W
ForEachZZW ^
(ZZ^ _
xZZ_ `
=>ZZa c
TaskZZd h
.ZZh i
RunZZi l
(ZZl m
(ZZm n
)ZZn o
=>ZZp r
xZZs t
.ZZt u
ActionZZu {
(ZZ{ |
Klines	ZZ| Ç
.
ZZÇ É
GetRange
ZZÉ ã
(
ZZã å
Klines
ZZå í
.
ZZí ì
Count
ZZì ò
-
ZZô ö
x
ZZõ ú
.
ZZú ù

KlineCount
ZZù ß
,
ZZß ®
x
ZZ© ™
.
ZZ™ ´

KlineCount
ZZ´ µ
)
ZZµ ∂
)
ZZ∂ ∑
)
ZZ∑ ∏
)
ZZ∏ π
;
ZZπ ∫
}[[ 	
public]] 
void]] 
	AddAction]] 
(]] 

TickAction]] (

tickAction]]) 3
)]]3 4
{^^ 	
UpdateLimit__ 
(__ 

tickAction__ "
.__" #

KlineCount__# -
)__- .
;__. /
Actions`` 
.`` 
Add`` 
(`` 

tickAction`` "
)``" #
;``# $
}aa 	
publiccc 
voidcc 
UpdateLimitcc 
(cc  
intcc  #
limitcc$ )
)cc) *
{dd 	
ifee 
(ee 
Limitee 
<ee 
limitee 
)ee 
{ff 
	GetKlinesgg 
(gg 
)gg 
;gg 
}hh 
}ii 	
publickk 
voidkk 
	GetKlineskk 
(kk 
)kk 
{ll 	
ifmm 
(mm 
Limitmm 
<mm 
$nummm 
)mm 
{nn 
StaticBinanceoo 
.oo 
Clientoo $
.oo$ %
UsdFuturesApioo% 2
.oo2 3
ExchangeDataoo3 ?
.oo? @
GetKlinesAsyncoo@ N
(ooN O
SymbolooO U
,ooU V
IntervalooW _
,oo_ `
limitooa f
:oof g
Limitooh m
)oom n
.oon o
Resultooo u
.oou v
Dataoov z
.ooz {
ToKlines	oo{ É
(
ooÉ Ñ
)
ooÑ Ö
.
ooÖ Ü
ForEach
ooÜ ç
(
ooç é
x
ooé è
=>
ooê í
Klines
ooì ô
.
ooô ö
Add
ooö ù
(
ooù û
x
ooû ü
)
ooü †
)
oo† °
;
oo° ¢
returnpp 
;pp 
}qq 
StaticBinancerr 
.rr 
Clientrr  
.rr  !
UsdFuturesApirr! .
.rr. /
ExchangeDatarr/ ;
.rr; <
GetKlinesAsyncrr< J
(rrJ K
SymbolrrK Q
,rrQ R
IntervalrrS [
,rr[ \
limitrr] b
:rrb c
$numrrd h
)rrh i
.rri j
Resultrrj p
.rrp q
Datarrq u
.rru v
ToKlinesrrv ~
(rr~ 
)	rr Ä
.
rrÄ Å
ForEach
rrÅ à
(
rrà â
x
rrâ ä
=>
rrã ç
Klines
rré î
.
rrî ï
Add
rrï ò
(
rrò ô
x
rrô ö
)
rrö õ
)
rrõ ú
;
rrú ù
intss 
GetKlinesCountss 
=ss  
Limitss! &
-ss' (
$numss) -
;ss- .
fortt 
(tt 
;tt 
GetKlinesCounttt !
>tt" #
$numtt$ (
;tt( )
GetKlinesCounttt* 8
-=tt8 :
$numtt: >
)tt> ?
{uu 
StaticBinancevv 
.vv 
Clientvv $
.vv$ %
UsdFuturesApivv% 2
.vv2 3
ExchangeDatavv3 ?
.vv? @
GetKlinesAsyncvv@ N
(vvN O
SymbolvvO U
,vvU V
IntervalvvW _
,vv_ `
limitvva f
:vvf g
$numvvh l
,vvl m
endTimevvn u
:vvu v
Klinesvvw }
[vv} ~
$numvv~ 
]	vv Ä
.
vvÄ Å
Date
vvÅ Ö
.
vvÖ Ü

AddSeconds
vvÜ ê
(
vvê ë
-
vvë í
$num
vví ì
*
vvî ï
(
vvñ ó
int
vvó ö
)
vvö õ
Interval
vvõ £
)
vv£ §
)
vv§ •
.
vv• ¶
Result
vv¶ ¨
.
vv¨ ≠
Data
vv≠ ±
.
vv± ≤
ToKlines
vv≤ ∫
(
vv∫ ª
)
vvª º
.
vvº Ω
ForEach
vvΩ ƒ
(
vvƒ ≈
x
vv≈ ∆
=>
vv« …
Klines
vv  –
.
vv– —
Add
vv— ‘
(
vv‘ ’
x
vv’ ÷
)
vv÷ ◊
)
vv◊ ÿ
;
vvÿ Ÿ
}ww 
ifyy 
(yy 
GetKlinesCountyy 
>yy 
$numyy  !
)yy! "
{zz 
StaticBinance{{ 
.{{ 
Client{{ $
.{{$ %
UsdFuturesApi{{% 2
.{{2 3
ExchangeData{{3 ?
.{{? @
GetKlinesAsync{{@ N
({{N O
Symbol{{O U
,{{U V
Interval{{W _
,{{_ `
limit{{a f
:{{f g
GetKlinesCount{{h v
){{v w
.{{w x
Result{{x ~
.{{~ 
Data	{{ É
.
{{É Ñ
ToKlines
{{Ñ å
(
{{å ç
)
{{ç é
.
{{é è
ForEach
{{è ñ
(
{{ñ ó
x
{{ó ò
=>
{{ô õ
Klines
{{ú ¢
.
{{¢ £
Add
{{£ ¶
(
{{¶ ß
x
{{ß ®
)
{{® ©
)
{{© ™
;
{{™ ´
}|| 
}}} 	
public 
void 
Cancel 
( 
) 
{
ÄÄ 	%
CancellationTokenSource
ÅÅ #
?
ÅÅ# $
.
ÅÅ$ %
Cancel
ÅÅ% +
(
ÅÅ+ ,
)
ÅÅ, -
;
ÅÅ- .
}
ÇÇ 	
}
ÉÉ 
}ÑÑ á
kC:\Users\√ñmer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\Finance\Helpers.cs
	namespace 	!
EASYTelegramSignalBot
 
.  
Finance  '
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
  !
ToKlines

" *
(

* +
this

+ /
IEnumerable

0 ;
<

; <
IBinanceKline

< I
>

I J
binanceKlines

K X
)

X Y
{ 	
return 
binanceKlines  
.  !
ToList! '
(' (
)( )
.) *
Select* 0
(0 1
x1 2
=>3 5
x6 7
.7 8
ToKline8 ?
(? @
)@ A
)A B
.B C
ToListC I
(I J
)J K
;K L
} 	
public 
static 
Kline 
ToKline #
(# $
this$ (
IBinanceKline) 6
binanceKline7 C
)C D
{ 	
Kline 
kline 
= 
new 
( 
) 
{ 
	_OpenDate 
= 
binanceKline (
.( )
OpenTime) 1
,1 2

_CloseDate 
= 
binanceKline )
.) *
	CloseTime* 3
,3 4
_Open 
= 
binanceKline $
.$ %
	OpenPrice% .
,. /
_High 
= 
binanceKline $
.$ %
	HighPrice% .
,. /
_Low 
= 
binanceKline #
.# $
LowPrice$ ,
,, -
_Close 
= 
binanceKline %
.% &

ClosePrice& 0
,0 1
_Volume 
= 
binanceKline &
.& '
QuoteVolume' 2
,2 3
} 
; 
return 
kline 
; 
} 	
public 
enum 
TriggerType 
{ 	

KlineClose   
=   
$num   
,   
KlineUpdate!! 
=!! 
$num!! 
,!! 
	KlineOpen"" 
="" 
$num"" 
}## 	
public%% 
enum%% 
SubscriptionType%% $
{&& 	

UsdFutures'' 
='' 
$num'' 
,'' 
CoinFutures(( 
=(( 
$num(( 
,(( 
Spot)) 
=)) 
$num)) 
}** 	
}++ 
},, t
rC:\Users\√ñmer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\Finance\Indicators\PAC.cst
rC:\Users\√ñmer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\Finance\Indicators\RSI.csóë
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
}8 9
public 
TDI 
( 
string 
symbol  
,  !
KlineInterval" /
interval0 8
,8 9
Action: @
<@ A
stringA G
,G H

DictionaryI S
<S T
stringT Z
,Z [
List\ `
<` a
objecta g
>g h
>h i
>i j
updateActionk w
,w x
Actiony 
<	 Ä
string
Ä Ü
,
Ü á

SignalType
à í
>
í ì
signalAction
î †
)
† °
: 
base 
( 
symbol 
, 
interval #
,# $
Helpers% ,
., -
SubscriptionType- =
.= >
Spot> B
,B C
signalActionD P
,P Q
updateActionR ^
)^ _
{ 	

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
= 
Helpers %
.% &
TriggerType& 1
.1 2
KlineUpdate2 =
,= >
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
{%% 	
var'' 
Rsi'' 
='' 
data'' 
.'' 
GetRsi'' !
(''! "
$num''" $
)''$ %
.''% &
ToList''& ,
('', -
)''- .
;''. /
var** 
FastMA** 
=** 
Rsi** 
.** 
GetSma** #
(**# $
$num**$ %
)**% &
.**& '
ToList**' -
(**- .
)**. /
;**/ 0
var-- 
slowMA-- 
=-- 
Rsi-- 
.-- 
GetSma-- #
(--# $
$num--$ %
)--% &
.--& '
ToList--' -
(--- .
)--. /
;--/ 0
var00 
ma00 
=00 
Rsi00 
.00 
GetSma00 
(00  
$num00  "
)00" #
.00# $
ToDictionary00$ 0
(000 1
x001 2
=>003 5
x006 7
.007 8
Date008 <
,00< =
x00> ?
=>00@ B
x00C D
.00D E
Sma00E H
)00H I
;00I J
var11 
stdev11 
=11 
Rsi11 
.11 
	GetStdDev11 %
(11% &
$num11& (
)11( )
.11) *
ToDictionary11* 6
(116 7
x117 8
=>119 ;
x11< =
.11= >
Date11> B
,11B C
x11D E
=>11F H
x11I J
.11J K
StdDev11K Q
*11R S
$num11T Z
)11Z [
;11[ \
var22 
up22 
=22 
ma22 
.22 
ToDictionary22 $
(22$ %
x22% &
=>22' )
x22* +
.22+ ,
Key22, /
,22/ 0
x221 2
=>223 5
x226 7
.227 8
Value228 =
+22> ?
stdev22@ E
[22E F
x22F G
.22G H
Key22H K
]22K L
)22L M
;22M N
var33 
dn33 
=33 
ma33 
.33 
ToDictionary33 $
(33$ %
x33% &
=>33' )
x33* +
.33+ ,
Key33, /
,33/ 0
x331 2
=>333 5
x336 7
.337 8
Value338 =
-33> ?
stdev33@ E
[33E F
x33F G
.33G H
Key33H K
]33K L
)33L M
;33M N
var55 
mdl55 
=55 
up55 
.55 
ToDictionary55 %
(55% &
x55& '
=>55( *
x55+ ,
.55, -
Key55- 0
,550 1
x552 3
=>554 6
(557 8
x558 9
.559 :
Value55: ?
+55@ A
dn55B D
[55D E
x55E F
.55F G
Key55G J
]55J K
)55K L
/55M N
$num55O P
)55P Q
;55Q R
FastMAResults88 
=88 
FastMA88 "
;88" #
SlowMAResults99 
=99 
slowMA99 "
;99" #
UpVBResults:: 
=:: 
up:: 
.:: 
Values:: #
.::# $
ToList::$ *
(::* +
)::+ ,
;::, -
MiddleVBResults;; 
=;; 
mdl;; !
.;;! "
Values;;" (
.;;( )
ToList;;) /
(;;/ 0
);;0 1
;;;1 2
DownVBResults<< 
=<< 
dn<< 
.<< 
Values<< %
.<<% &
ToList<<& ,
(<<, -
)<<- .
;<<. /
Values>> 
=>> 
new>> 
(>> 
)>> 
{?? 
{@@ 
$str@@ 
,@@ 
data@@  $
.@@$ %
Select@@% +
(@@+ ,
x@@, -
=>@@. 0
(@@1 2
object@@2 8
?@@8 9
)@@9 :
x@@: ;
??@@< >
$num@@? @
)@@@ A
.@@A B
ToList@@B H
(@@H I
)@@I J
.@@J K
GetRange@@K S
(@@S T
data@@T X
.@@X Y
Count@@Y ^
-@@^ _
$num@@_ a
,@@a b
$num@@b d
)@@d e
}@@f g
,@@g h
{AA 
$strAA 
,AA 
FastMAResultsAA  -
.AA- .
SelectAA. 4
(AA4 5
xAA5 6
=>AA7 9
(AA: ;
objectAA; A
?AAA B
)AAB C
xAAC D
.AAD E
SmaAAE H
??AAI K
$numAAL M
)AAM N
.AAN O
ToListAAO U
(AAU V
)AAV W
.AAW X
GetRangeAAX `
(AA` a
dataAAa e
.AAe f
CountAAf k
-AAk l
$numAAl n
,AAn o
$numAAo q
)AAq r
}AAs t
,AAt u
{BB 
$strBB 
,BB 
SlowMAResultsBB  -
.BB- .
SelectBB. 4
(BB4 5
xBB5 6
=>BB7 9
(BB: ;
objectBB; A
?BBA B
)BBB C
xBBC D
.BBD E
SmaBBE H
??BBI K
$numBBL M
)BBM N
.BBN O
ToListBBO U
(BBU V
)BBV W
.BBW X
GetRangeBBX `
(BB` a
dataBBa e
.BBe f
CountBBf k
-BBk l
$numBBl n
,BBn o
$numBBo q
)BBq r
}BBs t
,BBt u
{CC 
$strCC 
,CC 
UpVBResultsCC )
.CC) *
SelectCC* 0
(CC0 1
xCC1 2
=>CC3 5
xCC6 7
==CC8 :
nullCC; ?
?CC@ A
$numCCB C
:CCD E
(CCF G
objectCCG M
)CCM N
xCCN O
.CCO P
ValueCCP U
??CCV X
$numCCY Z
)CCZ [
.CC[ \
ToListCC\ b
(CCb c
)CCc d
.CCd e
GetRangeCCe m
(CCm n
dataCCn r
.CCr s
CountCCs x
-CCx y
$numCCy {
,CC{ |
$numCC| ~
)CC~ 
}
CCÄ Å
,
CCÅ Ç
{DD 
$strDD  
,DD  !
MiddleVBResultsDD" 1
.DD1 2
SelectDD2 8
(DD8 9
xDD9 :
=>DD; =
xDD> ?
==DD@ B
nullDDC G
?DDH I
$numDDJ K
:DDL M
(DDN O
objectDDO U
)DDU V
xDDV W
.DDW X
ValueDDX ]
??DD^ `
$numDDa b
)DDb c
.DDc d
ToListDDd j
(DDj k
)DDk l
.DDl m
GetRangeDDm u
(DDu v
dataDDv z
.DDz {
Count	DD{ Ä
-
DDÄ Å
$num
DDÅ É
,
DDÉ Ñ
$num
DDÑ Ü
)
DDÜ á
}
DDà â
,
DDâ ä
{EE 
$strEE 
,EE 
DownVBResultsEE  -
.EE- .
SelectEE. 4
(EE4 5
xEE5 6
=>EE7 9
xEE: ;
==EE< >
nullEE? C
?EED E
$numEEF G
:EEH I
(EEJ K
objectEEK Q
)EEQ R
xEER S
.EES T
ValueEET Y
??EEZ \
$numEE] ^
)EE^ _
.EE_ `
ToListEE` f
(EEf g
)EEg h
.EEh i
GetRangeEEi q
(EEq r
dataEEr v
.EEv w
CountEEw |
-EE| }
$numEE} 
,	EE Ä
$num
EEÄ Ç
)
EEÇ É
}
EEÑ Ö
}FF 
;FF 
UpdateActionHH 
(HH 
SymbolHH 
,HH  
ValuesHH! '
)HH' (
;HH( )

SignalTypeJJ 
RSI_PLJJ 
;JJ 
ifKK 
(KK 
FastMAKK 
.KK 
LastKK 
(KK 
)KK 
.KK 
SmaKK !
>KK" #
$numKK$ &
||KK' )
FastMAKK* 0
.KK0 1
LastKK1 5
(KK5 6
)KK6 7
.KK7 8
SmaKK8 ;
<KK< =
$numKK> @
)KK@ A
RSI_PLKKB H
=KKI J

SignalTypeKKK U
.KKU V
ExitKKV Z
;KKZ [
elseLL 
ifLL 
(LL 
FastMALL 
.LL 
LastLL  
(LL  !
)LL! "
.LL" #
SmaLL# &
>LL' (
$numLL) +
)LL+ ,
RSI_PLLL- 3
=LL4 5

SignalTypeLL6 @
.LL@ A
LongLLA E
;LLE F
elseMM 
RSI_PLMM 
=MM 

SignalTypeMM $
.MM$ %
ShortMM% *
;MM* +

SignalTypeOO 
TSLOO 
;OO 
ifPP 
(PP 
(PP 
intPP 
)PP 
(PP 
FastMAPP 
.PP 
LastPP !
(PP! "
)PP" #
.PP# $
SmaPP$ '
??PP( *
$numPP+ ,
)PP, -
==PP. 0
(PP1 2
intPP2 5
)PP5 6
(PP6 7
slowMAPP7 =
.PP= >
LastPP> B
(PPB C
)PPC D
.PPD E
SmaPPE H
??PPI K
$numPPL M
)PPM N
)PPN O
TSLPPP S
=PPT U

SignalTypePPV `
.PP` a
ExitPPa e
;PPe f
elseQQ 
ifQQ 
(QQ 
(QQ 
intQQ 
)QQ 
(QQ 
FastMAQQ !
.QQ! "
LastQQ" &
(QQ& '
)QQ' (
.QQ( )
SmaQQ) ,
??QQ- /
$numQQ0 1
)QQ1 2
>QQ3 4
(QQ5 6
intQQ6 9
)QQ9 :
(QQ: ;
slowMAQQ; A
.QQA B
LastQQB F
(QQF G
)QQG H
.QQH I
SmaQQI L
??QQM O
$numQQP Q
)QQQ R
)QQR S
TSLQQT W
=QQX Y

SignalTypeQQZ d
.QQd e
LongQQe i
;QQi j
elseRR 
TSLRR 
=RR 

SignalTypeRR !
.RR! "
ShortRR" '
;RR' (

SignalTypeTT 
MBLTT 
;TT 
ifUU 
(UU 
(UU 
intUU 
)UU 
(UU 
FastMAUU 
.UU 
LastUU !
(UU! "
)UU" #
.UU# $
SmaUU$ '
??UU( *
$numUU+ ,
)UU, -
==UU. 0
(UU1 2
intUU2 5
)UU5 6
(UU6 7
mdlUU7 :
.UU: ;
LastUU; ?
(UU? @
)UU@ A
.UUA B
ValueUUB G
??UUH J
$numUUK L
)UUL M
)UUM N
MBLUUO R
=UUS T

SignalTypeUUU _
.UU_ `
ExitUU` d
;UUd e
elseVV 
ifVV 
(VV 
(VV 
intVV 
)VV 
(VV 
FastMAVV !
.VV! "
LastVV" &
(VV& '
)VV' (
.VV( )
SmaVV) ,
??VV- /
$numVV0 1
)VV1 2
>VV3 4
(VV5 6
intVV6 9
)VV9 :
(VV: ;
mdlVV; >
.VV> ?
LastVV? C
(VVC D
)VVD E
.VVE F
ValueVVF K
??VVL N
$numVVO P
)VVP Q
)VVQ R
MBLVVS V
=VVW X

SignalTypeVVY c
.VVc d
LongVVd h
;VVh i
elseWW 
MBLWW 
=WW 

SignalTypeWW !
.WW! "
ShortWW" '
;WW' (

SignalTypeYY 
VBYY 
;YY 
ifZZ 
(ZZ 
(ZZ 
intZZ 
)ZZ 
(ZZ 
FastMAZZ 
.ZZ 
LastZZ !
(ZZ! "
)ZZ" #
.ZZ# $
SmaZZ$ '
??ZZ( *
$numZZ+ ,
)ZZ, -
>ZZ. /
(ZZ0 1
intZZ1 4
)ZZ4 5
(ZZ5 6
upZZ6 8
.ZZ8 9
LastZZ9 =
(ZZ= >
)ZZ> ?
.ZZ? @
ValueZZ@ E
??ZZF H
$numZZI J
)ZZJ K
)ZZK L
VBZZM O
=ZZP Q

SignalTypeZZR \
.ZZ\ ]
ExitZZ] a
;ZZa b
else[[ 
if[[ 
([[ 
([[ 
int[[ 
)[[ 
([[ 
FastMA[[ !
.[[! "
Last[[" &
([[& '
)[[' (
.[[( )
Sma[[) ,
??[[- /
$num[[0 1
)[[1 2
<[[3 4
([[5 6
int[[6 9
)[[9 :
([[: ;
dn[[; =
.[[= >
Last[[> B
([[B C
)[[C D
.[[D E
Value[[E J
??[[K M
$num[[N O
)[[O P
)[[P Q
VB[[R T
=[[U V

SignalType[[W a
.[[a b
Long[[b f
;[[f g
else\\ 
VB\\ 
=\\ 

SignalType\\  
.\\  !
Short\\! &
;\\& '
if^^ 
(^^ 
RSI_PL^^ 
==^^ 
TSL^^ 
&&^^  
RSI_PL^^! '
==^^( *
MBL^^+ .
&&^^/ 1
RSI_PL^^2 8
==^^9 ;
VB^^< >
)^^> ?
{__ 
Taskaa 
.aa 
Runaa 
(aa 
(aa 
)aa 
=>aa 
SignalActionaa +
(aa+ ,
Symbolaa, 2
,aa2 3
RSI_PLaa4 :
)aa: ;
)aa; <
;aa< =
Consolebb 
.bb 
	WriteLinebb !
(bb! "
$"bb" $
$strbb$ 3
{bb3 4
Symbolbb4 :
}bb: ;
$strbb; ?
{bb? @
nameofbb@ F
(bbF G
RSI_PLbbG M
)bbM N
}bbN O
$strbbO Q
{bbQ R
EnumbbR V
.bbV W
GetNamebbW ^
(bb^ _
typeofbb_ e
(bbe f

SignalTypebbf p
)bbp q
,bbq r
RSI_PLbbs y
)bby z
}bbz {
"bb{ |
)bb| }
;bb} ~
}cc 
elsedd 
{ee 
Consoleff 
.ff 
	WriteLineff !
(ff! "
$"ff" $
$strff$ +
{ff+ ,
Symbolff, 2
}ff2 3
$strff3 7
{ff7 8
Enumff8 <
.ff< =
GetNameff= D
(ffD E
typeofffE K
(ffK L

SignalTypeffL V
)ffV W
,ffW X
RSI_PLffY _
)ff_ `
}ff` a
$strffa l
{ffl m
Enumffm q
.ffq r
GetNameffr y
(ffy z
typeof	ffz Ä
(
ffÄ Å

SignalType
ffÅ ã
)
ffã å
,
ffå ç
TSL
ffé ë
)
ffë í
}
ffí ì
$str
ffì û
{
ffû ü
Enum
ffü £
.
ff£ §
GetName
ff§ ´
(
ff´ ¨
typeof
ff¨ ≤
(
ff≤ ≥

SignalType
ff≥ Ω
)
ffΩ æ
,
ffæ ø
MBL
ff¿ √
)
ff√ ƒ
}
ffƒ ≈
$str
ff≈ œ
{
ffœ –
Enum
ff– ‘
.
ff‘ ’
GetName
ff’ ‹
(
ff‹ ›
typeof
ff› „
(
ff„ ‰

SignalType
ff‰ Ó
)
ffÓ Ô
,
ffÔ 
VB
ffÒ Û
)
ffÛ Ù
}
ffÙ ı
"
ffı ˆ
)
ffˆ ˜
;
ff˜ ¯
}gg 
}hh 	
}ii 
}jj —-
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
public 
enum 

SignalType 
{ 	
Exit 
= 
$num 
, 
Long 
= 
$num 
, 
Short 
= 
$num 
, 
Buy 
= 
$num 
, 
Sell 
= 
$num 
, 
None 
= 
$num 
} 	
public 
string 
Symbol 
{ 
get "
;" #
set$ '
;' (
}) *
public 
KlineInterval 
Interval %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
Helpers 
. 
SubscriptionType  
SubscriptionType! 1
{2 3
get4 7
;7 8
set9 <
;< =
}> ?
public 
Action 
< 
string 
, 

SignalType (
>( )
SignalAction* 6
{7 8
get9 <
;< =
set> A
;A B
}C D
public 
Action 
< 
string 
, 

Dictionary (
<( )
string) /
,/ 0
List1 5
<5 6
object6 <
>< =
>= >
>> ?
UpdateAction@ L
{M N
getO R
;R S
setT W
;W X
}Y Z
public 
KlineSubscription  
?  !
Subscription" .
{/ 0
get1 4
;4 5
set6 9
;9 :
}; <
public 

TickAction 
? 

TickAction %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public 

Dictionary 
< 
string  
,  !
List" &
<& '
object' -
>- .
>. /
?/ 0
Values1 7
{8 9
get: =
;= >
set? B
;B C
}D E
public!! 
void!! 
Dispose!! 
(!! 
)!! 
{"" 	
Dispose## 
(## 
true## 
)## 
;## 
GC$$ 
.$$ 
SuppressFinalize$$ 
($$  
this$$  $
)$$$ %
;$$% &
}%% 	
	protected'' 
virtual'' 
void'' 
Dispose'' &
(''& '
bool''' +
	disposing'', 5
)''5 6
{(( 	
if)) 
()) 

isDisposed)) 
))) 
return)) "
;))" #
if++ 
(++ 
Subscription++ 
==++ 
null++  $
)++$ %
return++& ,
;++, -
var,, 
func,, 
=,, 
Subscription,, #
.,,# $
Actions,,$ +
.,,+ ,
First,,, 1
(,,1 2
x,,2 3
=>,,4 6
x,,7 8
.,,8 9
Creator,,9 @
==,,A C
this,,D H
),,H I
;,,I J
Subscription-- 
.-- 
Actions--  
.--  !
Remove--! '
(--' (
func--( ,
)--, -
;--- .

isDisposed// 
=// 
true// 
;// 
}00 	
	protected22 
	Indicator22 
(22 
string22 "
symbol22# )
,22) *
KlineInterval22+ 8
interval229 A
,22A B
Helpers22C J
.22J K
SubscriptionType22K [
subscriptionType22\ l
,22l m
Action22n t
<22t u
string22u {
,22{ |

SignalType	22} á
>
22á à
signalAction
22â ï
,
22ï ñ
Action
22ó ù
<
22ù û
string
22û §
,
22§ •

Dictionary
22¶ ∞
<
22∞ ±
string
22± ∑
,
22∑ ∏
List
22π Ω
<
22Ω æ
object
22æ ƒ
>
22ƒ ≈
>
22≈ ∆
>
22∆ «
updateAction
22» ‘
)
22‘ ’
{33 	
Symbol44 
=44 
symbol44 
;44 
SubscriptionType55 
=55 
subscriptionType55 /
;55/ 0
Interval66 
=66 
interval66 
;66  
SignalAction77 
=77 
signalAction77 '
;77' (
UpdateAction88 
=88 
updateAction88 '
;88' (
}99 	
public;; 
void;; 
	Subscribe;; 
(;; 
);; 
{<< 	
if== 
(== 

TickAction== 
==== 
null== "
)==" #
return==$ *
;==* +
Subscription>> 
=>> 
StaticBinance>> (
.>>( )(
SubscribeToKlineUpdatesAsync>>) E
(>>E F
SubscriptionType??  
,??  !
Symbol@@ 
,@@ 
IntervalAA 
,AA 

TickActionBB 
)BB 
;BB 
}CC 	
}DD 
}EE ≈
uC:\Users\√ñmer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\Finance\Models\TickAction.cs
	namespace 	!
EASYTelegramSignalBot
 
.  
Finance  '
.' (
Models( .
{ 
public 

class 

TickAction 
{		 
public

 
	Indicator

 
Creator

  
{

! "
get

# &
;

& '
set

( +
;

+ ,
}

- .
public 
Action 
< 
List 
< 
Kline  
>  !
>! "
Action# )
{* +
get, /
;/ 0
set1 4
;4 5
}6 7
public 
TriggerType 
TriggerType &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
public 
int 

KlineCount 
{ 
get  #
;# $
set% (
;( )
}* +
} 
} 

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
)0 1
=>2 4
true5 9
;9 :
public 
event 
EventHandler !
?! "
CanExecuteChanged# 4
;4 5
} 
} ¡
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
;A B
	protected		 
void		 %
RaisePropertyChangedEvent		 0
(		0 1
string		1 7
propertyName		8 D
)		D E
{

 	
PropertyChanged 
? 
. 
Invoke #
(# $
this$ (
,( )
new* -$
PropertyChangedEventArgs. F
(F G
propertyNameG S
)S T
)T U
;U V
} 	
} 
} ì
|C:\Users\√ñmer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\SettingsManager\Models\JsonModel.cs
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
class 
	JsonModel 
{ 
[ 	
JsonProperty	 
( 
$str 0
)0 1
]1 2
public 
string $
DatabaseConnectionString .
{/ 0
get1 4
;4 5
set6 9
;9 :
}; <
[

 	
JsonProperty

	 
(

 
$str

 /
)

/ 0
]

0 1
public 
bool #
IsDatabaseEnsureCreated +
{, -
get. 1
;1 2
set3 6
;6 7
}8 9
[ 	
JsonProperty	 
( 
$str /
)/ 0
]0 1
public 
bool #
ResetDatabaseFirstStart +
{, -
get. 1
;1 2
set3 6
;6 7
}8 9
[ 	
JsonProperty	 
( 
$str +
)+ ,
], -
public 
string 
TDITelegramBotToken )
{* +
get, /
;/ 0
set1 4
;4 5
}6 7
[ 	
JsonProperty	 
( 
$str +
)+ ,
], -
public 
string 
PACTelegramBotToken )
{* +
get, /
;/ 0
set1 4
;4 5
}6 7
[ 	
JsonProperty	 
( 
$str 4
)4 5
]5 6
public 
string (
GeneralGroupTelegramBotToken 2
{3 4
get5 8
;8 9
set: =
;= >
}? @
[ 	
JsonProperty	 
( 
$str 0
)0 1
]1 2
public 
string $
GeneralTelegramChannelId .
{/ 0
get1 4
;4 5
set6 9
;9 :
}; <
[ 	
JsonProperty	 
( 
$str 4
)4 5
]5 6
public 
double (
UpdateExpiredUsersTickMunite 2
{3 4
get5 8
;8 9
set: =
;= >
}? @
} 
}   ≠(
tC:\Users\√ñmer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\SettingsManager\Settings.cs
	namespace 	!
EASYTelegramSignalBot
 
{ 
public		 

static		 
class		 
Settings		  
{

 
private 
static 
	JsonModel  
	_Settings! *
{+ ,
get- 0
;0 1
set2 5
;5 6
}7 8
public 
static 
void 
LoadSettings '
(' (
)( )
{ 	
try 
{ 
using 
StreamReader "
r# $
=% &
new' *
(* +
$str+ :
): ;
;; <
string 
json 
= 
r 
.  
	ReadToEnd  )
() *
)* +
;+ ,
	_Settings 
= 
JsonConvert '
.' (
DeserializeObject( 9
<9 :
	JsonModel: C
>C D
(D E
jsonE I
)I J
;J K
} 
catch 
{ 
Console 
. 
	WriteLine !
(! "
$str" 9
)9 :
;: ;
	_Settings 
= 
new 
	JsonModel  )
() *
)* +
;+ ,
} 
} 	
public 
static 
void 
SaveSettings '
(' (
)( )
{ 	
try 
{ 
using   
StreamWriter   "
w  # $
=  % &
File  ' +
.  + ,

CreateText  , 6
(  6 7
$str  7 F
)  F G
;  G H
string!! 
json!! 
=!! 
JsonConvert!! )
.!!) *
SerializeObject!!* 9
(!!9 :
	_Settings!!: C
,!!C D

Formatting!!E O
.!!O P
Indented!!P X
)!!X Y
;!!Y Z
w"" 
."" 
Write"" 
("" 
json"" 
)"" 
;"" 
}## 
catch$$ 
{%% 
Console&& 
.&& 
	WriteLine&& !
(&&! "
$str&&" ;
)&&; <
;&&< =
}'' 
}(( 	
public** 
static** 
void** $
SetDatabaseEnsureCreated** 3
(**3 4
bool**4 8
	isCreated**9 B
=**C D
true**E I
)**I J
{++ 	
	_Settings,, 
.,, #
IsDatabaseEnsureCreated,, -
=,,. /
	isCreated,,0 9
;,,9 :
SaveSettings-- 
(-- 
)-- 
;-- 
}.. 	
public00 
static00 
void00 
DatabaseResetted00 +
(00+ ,
)00, -
{11 	
	_Settings22 
.22 #
ResetDatabaseFirstStart22 -
=22. /
false220 5
;225 6$
SetDatabaseEnsureCreated33 $
(33$ %
false33% *
)33* +
;33+ ,
}44 	
public66 
static66 
string66 $
DatabaseConnectionString66 5
=>666 8
	_Settings669 B
.66B C$
DatabaseConnectionString66C [
;66[ \
public77 
static77 
bool77 #
IsDatabaseEnsureCreated77 2
=>773 5
	_Settings776 ?
.77? @#
IsDatabaseEnsureCreated77@ W
;77W X
public88 
static88 
bool88 #
ResetDatabaseFirstStart88 2
=>883 5
	_Settings886 ?
.88? @#
ResetDatabaseFirstStart88@ W
;88W X
public:: 
static:: 
string:: 
TDITelegramBotToken:: 0
=>::1 3
	_Settings::4 =
.::= >
TDITelegramBotToken::> Q
;::Q R
public;; 
static;; 
string;; 
PACTelegramBotToken;; 0
=>;;1 3
	_Settings;;4 =
.;;= >
PACTelegramBotToken;;> Q
;;;Q R
public<< 
static<< 
string<< (
GeneralGroupTelegramBotToken<< 9
=><<: <
	_Settings<<= F
.<<F G(
GeneralGroupTelegramBotToken<<G c
;<<c d
public== 
static== 
string== $
GeneralTelegramChannelId== 5
=>==6 8
	_Settings==9 B
.==B C$
GeneralTelegramChannelId==C [
;==[ \
public>> 
static>> 
double>> (
UpdateExpiredUsersTickMunite>> 9
=>>>: <
	_Settings>>= F
.>>F G(
UpdateExpiredUsersTickMunite>>G c
;>>c d
public@@ 
static@@ 
List@@ 
<@@ 
string@@ !
>@@! "

TDISymbols@@# -
=>@@. 0
new@@1 4
(@@4 5
)@@5 6
{@@7 8
$str@@9 B
,@@B C
$str@@D M
}@@N O
;@@O P
}AA 
}BB ˝
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
 
static #
CancellationTokenSource &
CancelToken' 2
{3 4
get5 8
;8 9
set: =
;= >
}? @
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
TDITelegramBotToken% 8
)8 9
;9 :
CancelToken 
= 
new #
CancellationTokenSource 5
(5 6
)6 7
;7 8
var 
receiverOptions 
=  !
new" %
ReceiverOptions& 5
(5 6
)6 7
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
.( )(
GeneralGroupTelegramBotToken) E
)E F
;F G
} 	
}   
}!! Á<
sC:\Users\√ñmer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\Telegram\UpdateHandlers.cs
	namespace 	!
EASYTelegramSignalBot
 
.  
Telegram  (
{ 
public 

static 
class 
UpdateHandlers &
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
{ 	
var 
ErrorMessage 
= 
	exception (
switch) /
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
{ 	
var 
handler 
= 
update  
.  !
Type! %
switch& ,
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
$num33e f
,33f g
$num33g h
)33h i
)33i j
;33j k
return55 
Task55 
.55 
Delay55 
(55 
$num55 
)55  
;55  !
}66 	
static99 
async99 
Task99 
DefaultMessage99 (
(99( )
ITelegramBotClient99) ;
	botClient99< E
,99E F
Message99G N
message99O V
)99V W
{:: 	
string;; 
text;; 
=;; 
$str;; 
;;; 
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
(@@ 
Database@@ 
.@@ 

Connection@@ (
.@@( )
Context@@) 0
.@@0 1
Users@@1 6
.@@6 7
Any@@7 :
(@@: ;
x@@; <
=>@@= ?
x@@@ A
.@@A B
UserName@@B J
==@@K M
message@@N U
.@@U V
Chat@@V Z
.@@Z [
Username@@[ c
)@@c d
)@@d e
{AA 
varBB 
userBB 
=BB 
DatabaseBB #
.BB# $

ConnectionBB$ .
.BB. /
ContextBB/ 6
.BB6 7
UsersBB7 <
.BB< =
WhereBB= B
(BBB C
xBBC D
=>BBE G
xBBH I
.BBI J
UserNameBBJ R
==BBS U
messageBBV ]
.BB] ^
ChatBB^ b
.BBb c
UsernameBBc k
)BBk l
.BBl m
FirstBBm r
(BBr s
)BBs t
;BBt u
ifDD 
(DD 
userDD 
.DD 
ChatIdDD 
==DD !
$numDD" #
)DD# $
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
;FF1 2
DatabaseGG 
.GG 

ConnectionGG '
.GG' (
ContextGG( /
.GG/ 0
SaveChangesGG0 ;
(GG; <
)GG< =
;GG= >
}HH 
ifJJ 
(JJ 
userJJ 
.JJ 
TDIExpiryDateJJ %
<JJ& '
DateTimeJJ( 0
.JJ0 1
NowJJ1 4
)JJ4 5
{KK 
textLL 
=LL 
$strLL J
;LLJ K
}MM 
elseNN 
{OO 
textPP 
=PP 
$"PP 
$strPP )
"PP) *
;PP* +
ifQQ 
(QQ 
userQQ 
.QQ 
TDIQQ  
)QQ  !
textQQ" &
+=QQ' )
$"QQ* ,
$strQQ, A
{QQA B
userQQB F
.QQF G
TDIExpiryDateQQG T
}QQT U
$strQQU o
"QQo p
;QQp q
ifRR 
(RR 
userRR 
.RR 
PACRR  
)RR  !
textRR" &
+=RR' )
$"RR* ,
$strRR, A
{RRA B
userRRB F
.RRF G
PACExpiryDateRRG T
}RRT U
$strRRU o
"RRo p
;RRp q
textSS 
+=SS 
$strSS E
;SSE F
}TT 
}UU 
elseVV 
{WW 
textXX 
=XX 
$strXX S
;XXS T
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
}__ ˘s
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
{ 
Title $
=% &
$str' 7
,7 8
LineSmoothness9 G
=G H
$numH I
,I J
StrokeK Q
=Q R
BrushesR Y
.Y Z
GreenZ _
,_ `
PointGeometrySizea r
=r s
$nums t
,t u
Valuesv |
=} ~
new	 Ç
ChartValues
É é
<
é è
double
è ï
>
ï ñ
(
ñ ó
)
ó ò
,
ò ô
Fill
ö û
=
ü †
Brushes
° ®
.
® ©
Transparent
© ¥
}
µ ∂
;
∂ ∑
SlowMA 
= 
new 
( 
) 
{ 
Title $
=% &
$str' :
,: ;
LineSmoothness< J
=K L
$numM N
,N O
StrokeP V
=W X
BrushesY `
.` a
Reda d
,d e
PointGeometrySizef w
=x y
$numz {
,{ |
Values	| Ç
=
É Ñ
new
Ö à
ChartValues
â î
<
î ï
double
ï õ
>
õ ú
(
ú ù
)
ù û
,
û ü
Fill
† §
=
• ¶
Brushes
ß Æ
.
Æ Ø
Transparent
Ø ∫
}
ª º
;
º Ω
UpVB 
= 
new 
( 
) 
{ 
Title $
=% &
$str' 9
,9 :
LineSmoothness; I
=J K
$numL M
,M N
StrokeO U
=V W
BrushesX _
._ `
Blue` d
,d e
PointGeometrySizef w
=x y
$numz {
,{ |
Values	} É
=
Ñ Ö
new
Ü â
ChartValues
ä ï
<
ï ñ
double
ñ ú
>
ú ù
(
ù û
)
û ü
,
ü †
Fill
° •
=
¶ ß
Brushes
® Ø
.
Ø ∞
Transparent
∞ ª
}
º Ω
;
Ω æ
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
{ 
Title $
=% &
$str' ;
,; <
LineSmoothness= K
=L M
$numN O
,O P
StrokeQ W
=X Y
BrushesZ a
.a b
Blueb f
,f g
PointGeometrySizeh y
=z {
$num| }
,} ~
Values	 Ö
=
Ü á
new
à ã
ChartValues
å ó
<
ó ò
double
ò û
>
û ü
(
ü †
)
† °
,
° ¢
Fill
£ ß
=
® ©
Brushes
™ ±
.
± ≤
Transparent
≤ Ω
}
æ ø
;
ø ¿&
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
string** 
UISymbol** 
{**  
get**! $
;**$ %
set**& )
;**) *
}**+ ,
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
get.." %
;..% &
set..' *
;..* +
}.., -
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
>44 
labels44 #
;44# $
public55 
List55 
<55 
string55 
>55 
Labels55 "
{66 	
get77 
{77 
return77 
labels77 
??=77  #
new77$ '
(77' (
)77( )
;77) *
}77+ ,
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
privateFF  
ObservableCollectionFF $
<FF$ %
UserFF% )
>FF) *
usersFF+ 0
{FF1 2
getFF3 6
;FF6 7
setFF8 ;
;FF; <
}FF= >
publicGG  
ObservableCollectionGG #
<GG# $
UserGG$ (
>GG( )
UsersGG* /
{HH 	
getII 
{JJ 

ConnectionKK 
.KK 
ContextKK "
.KK" #
UsersKK# (
.KK( )
LoadKK) -
(KK- .
)KK. /
;KK/ 0
returnLL 
usersLL 
??=LL  

ConnectionLL! +
.LL+ ,
ContextLL, 3
.LL3 4
UsersLL4 9
.LL9 :
LocalLL: ?
.LL? @"
ToObservableCollectionLL@ V
(LLV W
)LLW X
;LLX Y
}MM 
setNN 
{OO 
usersPP 
=PP 
valuePP 
;PP %
RaisePropertyChangedEventQQ )
(QQ) *
nameofQQ* 0
(QQ0 1
UsersQQ1 6
)QQ6 7
)QQ7 8
;QQ8 9
}RR 
}SS 	
privateUU 
UserUU 
?UU 
selectedUserUU "
{UU# $
getUU% (
;UU( )
setUU* -
;UU- .
}UU/ 0
publicVV 
UserVV 
?VV 
SelectedUserVV !
{WW 	
getXX 
{YY 
returnZZ 
selectedUserZZ #
;ZZ# $
}[[ 
set\\ 
{]] 
selectedUser^^ 
=^^ 
value^^ $
;^^$ %%
RaisePropertyChangedEvent__ )
(__) *
nameof__* 0
(__0 1
SelectedUser__1 =
)__= >
)__> ?
;__? @
}`` 
}aa 	
privatecc  
ObservableCollectioncc $
<cc$ %
	Indicatorcc% .
>cc. /
symbolscc0 7
{cc8 9
getcc: =
;cc= >
setcc? B
;ccB C
}ccD E
publicdd  
ObservableCollectiondd #
<dd# $
	Indicatordd$ -
>dd- .
Symbolsdd/ 6
{ee 	
getff 
{gg 
returnhh 
symbolshh 
??=hh "
newhh# &
(hh& '
)hh' (
;hh( )
}ii 
setjj 
{kk 
symbolsll 
=ll 
valuell 
;ll  %
RaisePropertyChangedEventmm )
(mm) *
nameofmm* 0
(mm0 1
Symbolsmm1 8
)mm8 9
)mm9 :
;mm: ;
}nn 
}oo 	
privaterr 
	Indicatorrr 
?rr 
selectedSymbolrr )
{rr* +
getrr, /
;rr/ 0
setrr1 4
;rr4 5
}rr6 7
publicss 
	Indicatorss 
?ss 
SelectedSymbolss (
{tt 	
getuu 
{vv 
returnww 
selectedSymbolww %
;ww% &
}xx 
setyy 
{zz 
selectedSymbol{{ 
={{  
value{{! &
;{{& '%
RaisePropertyChangedEvent|| )
(||) *
nameof||* 0
(||0 1
SelectedSymbol||1 ?
)||? @
)||@ A
;||A B
}}} 
}~~ 	
private
ÄÄ 
string
ÄÄ 
addUserString
ÄÄ $
{
ÄÄ% &
get
ÄÄ' *
;
ÄÄ* +
set
ÄÄ, /
;
ÄÄ/ 0
}
ÄÄ1 2
public
ÅÅ 
string
ÅÅ 
AddUserString
ÅÅ #
{
ÇÇ 	
get
ÉÉ 
{
ÑÑ 
if
ÖÖ 
(
ÖÖ 
string
ÖÖ 
.
ÖÖ 
IsNullOrEmpty
ÖÖ (
(
ÖÖ( )
addUserString
ÖÖ) 6
)
ÖÖ6 7
)
ÖÖ7 8
return
ÖÖ9 ?
$str
ÖÖ@ B
;
ÖÖB C
return
ÜÜ 
addUserString
ÜÜ $
;
ÜÜ$ %
}
áá 
set
àà 
{
ââ 
addUserString
ää 
=
ää 
value
ää  %
;
ää% &'
RaisePropertyChangedEvent
ãã )
(
ãã) *
nameof
ãã* 0
(
ãã0 1
AddUserString
ãã1 >
)
ãã> ?
)
ãã? @
;
ãã@ A'
RaisePropertyChangedEvent
åå )
(
åå) *
nameof
åå* 0
(
åå0 1$
IsAddUserButtonEnabled
åå1 G
)
ååG H
)
ååH I
;
ååI J
}
çç 
}
éé 	
private
êê 
int
êê 
?
êê 
addUserDays
êê  
{
êê! "
get
êê# &
;
êê& '
set
êê( +
;
êê+ ,
}
êê- .
public
ëë 
int
ëë 
AddUserDays
ëë 
{
íí 	
get
ìì 
{
îî 
return
ïï 
addUserDays
ïï "
??
ïï# %
$num
ïï& (
;
ïï( )
}
ññ 
set
óó 
{
òò 
addUserDays
ôô 
=
ôô 
value
ôô #
<
ôô$ %
$num
ôô& '
?
ôô( )
$num
ôô* +
:
ôô, -
value
ôô. 3
;
ôô3 4'
RaisePropertyChangedEvent
öö )
(
öö) *
nameof
öö* 0
(
öö0 1
AddUserDays
öö1 <
)
öö< =
)
öö= >
;
öö> ?'
RaisePropertyChangedEvent
õõ )
(
õõ) *
nameof
õõ* 0
(
õõ0 1$
IsAddUserButtonEnabled
õõ1 G
)
õõG H
)
õõH I
;
õõI J
}
úú 
}
ùù 	
public
üü 
bool
üü 
?
üü $
IsAddUserButtonEnabled
üü +
{
†† 	
get
°° 
{
¢¢ 
if
££ 
(
££ 
string
££ 
.
££ 
IsNullOrEmpty
££ (
(
££( )
addUserString
££) 6
)
££6 7
)
££7 8
return
££9 ?
false
££@ E
;
££E F
return
§§ 
true
§§ 
;
§§ 
}
•• 
}
¶¶ 	
private
®® 
string
®® 
addSymbolString
®® &
{
®®' (
get
®®) ,
;
®®, -
set
®®. 1
;
®®1 2
}
®®3 4
public
©© 
string
©© 
AddSymbolString
©© %
{
™™ 	
get
´´ 
{
¨¨ 
if
≠≠ 
(
≠≠ 
string
≠≠ 
.
≠≠ 
IsNullOrEmpty
≠≠ (
(
≠≠( )
addSymbolString
≠≠) 8
)
≠≠8 9
)
≠≠9 :
return
≠≠; A
$str
≠≠B D
;
≠≠D E
return
ÆÆ 
addSymbolString
ÆÆ &
;
ÆÆ& '
}
ØØ 
set
∞∞ 
{
±± 
addSymbolString
≤≤ 
=
≤≤  !
value
≤≤" '
;
≤≤' ('
RaisePropertyChangedEvent
≥≥ )
(
≥≥) *
nameof
≥≥* 0
(
≥≥0 1
AddSymbolString
≥≥1 @
)
≥≥@ A
)
≥≥A B
;
≥≥B C'
RaisePropertyChangedEvent
¥¥ )
(
¥¥) *
nameof
¥¥* 0
(
¥¥0 1&
IsAddSymbolButtonEnabled
¥¥1 I
)
¥¥I J
)
¥¥J K
;
¥¥K L
}
µµ 
}
∂∂ 	
public
∏∏ 
bool
∏∏ 
?
∏∏ &
IsAddSymbolButtonEnabled
∏∏ -
{
ππ 	
get
∫∫ 
{
ªª 
if
ºº 
(
ºº 
string
ºº 
.
ºº 
IsNullOrEmpty
ºº (
(
ºº( )
addSymbolString
ºº) 8
)
ºº8 9
)
ºº9 :
return
ºº; A
false
ººB G
;
ººG H
return
ΩΩ 
true
ΩΩ 
;
ΩΩ 
}
ææ 
}
øø 	
}
¿¿ 
}¡¡ ø
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
 ≥‘
vC:\Users\√ñmer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\UI\ViewModels\TDIViewModel.cs
	namespace 	!
EASYTelegramSignalBot
 
.  

ViewModels  *
{ 
internal 
class 
TDIViewModel 
:  !
UserControl" -
{ 
public 
ICommand 
AddUserCommand &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
public 
ICommand 
DelUserCommand &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
public 
ICommand 
SetUISymbolCommand *
{+ ,
get- 0
;0 1
set2 5
;5 6
}7 8
public 
ICommand 
DelSymbolCommand (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
public 
TDIModel 
Model 
{ 
get  #
;# $
set% (
;( )
}* +
public 
TDIViewModel 
( 
) 
{ 	
Model   
=   
new   
(   
)   
;   
AddUserCommand"" 
="" 
new""  
DelegateCommand""! 0
(""0 1
(""1 2
o""2 3
)""3 4
=>""5 7
AddUser""8 ?
(""? @
)""@ A
)""A B
;""B C
DelUserCommand## 
=## 
new##  
DelegateCommand##! 0
(##0 1
(##1 2
o##2 3
)##3 4
=>##5 7
DelUser##8 ?
(##? @
)##@ A
)##A B
;##B C
SetUISymbolCommand$$ 
=$$  
new$$! $
DelegateCommand$$% 4
($$4 5
($$5 6
o$$6 7
)$$7 8
=>$$9 ;
SetUISymbol$$< G
($$G H
)$$H I
)$$I J
;$$J K
DelSymbolCommand%% 
=%% 
new%% "
DelegateCommand%%# 2
(%%2 3
(%%3 4
o%%4 5
)%%5 6
=>%%7 9
	DelSymbol%%: C
(%%C D
)%%D E
)%%E F
;%%F G
Model'' 
.'' 
UISymbol'' 
='' 
Settings'' %
.''% &

TDISymbols''& 0
.''0 1
FirstOrDefault''1 ?
(''? @
)''@ A
??''B D
$str''E G
;''G H
foreach)) 
()) 
var)) 
symbol)) 
in))  "
Settings))# +
.))+ ,

TDISymbols)), 6
)))6 7
{** 
if++ 
(++ 
symbol++ 
==++ 
Model++ "
.++" #
UISymbol++# +
)+++ ,
{,, 
Model-- 
.-- 
Symbols-- !
.--! "
Add--" %
(--% &
new--& )
TDI--* -
(--- .
symbol--. 4
,--4 5
Binance--6 =
.--= >
Net--> A
.--A B
Enums--B G
.--G H
KlineInterval--H U
.--U V
	OneMinute--V _
,--_ `
UpdateUI--a i
,--i j
SendSignalMessage--k |
)--| }
{--~ 
}
--Ä Å
)
--Ç É
;
--É Ñ
continue.. 
;.. 
}// 
Model11 
.11 
Symbols11 
.11 
Add11 !
(11! "
new11" %
TDI11& )
(11) *
symbol11* 0
,110 1
Binance112 9
.119 :
Net11: =
.11= >
Enums11> C
.11C D
KlineInterval11D Q
.11Q R
	OneMinute11R [
,11[ \
(11] ^
string11^ d
symbol11e k
,11k l

Dictionary11m w
<11w x
string11x ~
,11~ 
List
11Ä Ñ
<
11Ñ Ö
object
11Ö ã
>
11ã å
>
11å ç
values
11é î
)
11î ï
=>
11ñ ò
{
11ô ö
}
11õ ú
,
11ú ù
SendSignalMessage
11û Ø
)
11Ø ∞
{
11± ≤
}
11≥ ¥
)
11¥ µ
;
11µ ∂
}22 
}33 	
public55 
void55 
UpdateUI55 
(55 
string55 #
symbol55$ *
,55* +

Dictionary55, 6
<556 7
string557 =
,55= >
List55? C
<55C D
object55D J
>55J K
>55K L
Values55M S
)55S T
{66 	
if77 
(77 
symbol77 
!=77 
Model77 
.77  
UISymbol77  (
)77( )
return77* 0
;770 1
var99 
Klines99 
=99 
Values99 
[99  
$str99  (
]99( )
.99) *
Select99* 0
(990 1
x991 2
=>993 5
(996 7
Kline997 <
)99< =
x99= >
)99> ?
.99? @
ToList99@ F
(99F G
)99G H
;99H I
UpdateKlines:: 
(:: 
Klines:: 
)::  
;::  !
var<< 
FastMA<< 
=<< 
Values<< 
[<<  
$str<<  (
]<<( )
.<<) *
ToList<<* 0
(<<0 1
)<<1 2
;<<2 3
var== 
SlowMA== 
=== 
Values== 
[==  
$str==  (
]==( )
.==) *
ToList==* 0
(==0 1
)==1 2
;==2 3
var>> 
UpVB>> 
=>> 
Values>> 
[>> 
$str>> $
]>>$ %
.>>% &
ToList>>& ,
(>>, -
)>>- .
;>>. /
var?? 
MiddleVB?? 
=?? 
Values?? !
[??! "
$str??" ,
]??, -
.??- .
ToList??. 4
(??4 5
)??5 6
;??6 7
var@@ 
DownVB@@ 
=@@ 
Values@@ 
[@@  
$str@@  (
]@@( )
.@@) *
ToList@@* 0
(@@0 1
)@@1 2
;@@2 3
UpdateIndicatorsAA 
(AA 
KlinesAA #
,AA# $
FastMAAA% +
,AA+ ,
SlowMAAA- 3
,AA3 4
UpVBAA5 9
,AA9 :
MiddleVBAA; C
,AAC D
DownVBAAE K
)AAK L
;AAL M
}BB 	
publicDD 
voidDD 
SendSignalMessageDD %
(DD% &
stringDD& ,
symbolDD- 3
,DD3 4

SignalTypeDD5 ?
typeDD@ D
)DDD E
{EE 	
foreachFF 
(FF 
UserFF 
userFF 
inFF !
ModelFF" '
.FF' (
UsersFF( -
)FF- .
{GG 
ifHH 
(HH 
userHH 
.HH 
ChatIdHH 
!=HH  "
$numHH# $
)HH$ %

BotClientsHH& 0
.HH0 1
GeneralClientHH1 >
.HH> ? 
SendTextMessageAsyncHH? S
(HHS T
SettingsHHT \
.HH\ ]$
GeneralTelegramChannelIdHH] u
,HHu v
$"HHw y
$str	HHy å
{
HHå ç
symbol
HHç ì
}
HHì î
"
HHî ï
)
HHï ñ
;
HHñ ó
}II 
}JJ 	
publicLL 
voidLL 
SetUISymbolLL 
(LL  
)LL  !
{MM 	
ifNN 
(NN 
ModelNN 
.NN 
SelectedSymbolNN $
==NN% '
nullNN( ,
)NN, -
returnNN. 4
;NN4 5
ifOO 
(OO 
ModelOO 
.OO 
SelectedSymbolOO $
.OO$ %
SymbolOO% +
==OO, .
ModelOO/ 4
.OO4 5
UISymbolOO5 =
)OO= >
returnOO? E
;OOE F
ModelQQ 
.QQ 
SymbolsQQ 
.QQ 
FirstQQ 
(QQ  
xQQ  !
=>QQ" $
xQQ% &
.QQ& '
SymbolQQ' -
==QQ. 0
ModelQQ1 6
.QQ6 7
UISymbolQQ7 ?
)QQ? @
.QQ@ A
UpdateActionQQA M
=QQN O
(QQP Q
stringQQQ W
symbolQQX ^
,QQ^ _

DictionaryQQ` j
<QQj k
stringQQk q
,QQq r
ListQQs w
<QQw x
objectQQx ~
>QQ~ 
>	QQ Ä
values
QQÅ á
)
QQá à
=>
QQâ ã
{
QQå ç
}
QQé è
;
QQè ê
ModelRR 
.RR !
KlineSeriesCollectionRR '
.RR' (
ToListRR( .
(RR. /
)RR/ 0
.RR0 1
ForEachRR1 8
(RR8 9
xRR9 :
=>RR; =
xRR> ?
.RR? @
ValuesRR@ F
.RRF G
ClearRRG L
(RRL M
)RRM N
)RRN O
;RRO P
ModelSS 
.SS &
IndicatorsSeriesCollectionSS ,
.SS, -
ToListSS- 3
(SS3 4
)SS4 5
.SS5 6
ForEachSS6 =
(SS= >
xSS> ?
=>SS@ B
xSSC D
.SSD E
ValuesSSE K
.SSK L
ClearSSL Q
(SSQ R
)SSR S
)SSS T
;SST U
ModelTT 
.TT 
UISymbolTT 
=TT 
ModelTT "
.TT" #
SelectedSymbolTT# 1
.TT1 2
SymbolTT2 8
;TT8 9
ModelUU 
.UU 
SymbolsUU 
.UU 
FirstUU 
(UU  
xUU  !
=>UU" $
xUU% &
.UU& '
SymbolUU' -
==UU. 0
ModelUU1 6
.UU6 7
UISymbolUU7 ?
)UU? @
.UU@ A
UpdateActionUUA M
=UUN O
UpdateUIUUP X
;UUX Y
}VV 	
publicXX 
voidXX 
	DelSymbolXX 
(XX 
)XX 
{YY 	
ifZZ 
(ZZ 
ModelZZ 
.ZZ 
SelectedSymbolZZ $
==ZZ% '
nullZZ( ,
)ZZ, -
returnZZ. 4
;ZZ4 5
if\\ 
(\\ 
Model\\ 
.\\ 
UISymbol\\ 
==\\  
Model\\! &
.\\& '
SelectedSymbol\\' 5
.\\5 6
Symbol\\6 <
&&\\= ?
Model\\@ E
.\\E F
Symbols\\F M
.\\M N
Count\\N S
>\\T U
$num\\V W
)\\W X
{]] 
Model^^ 
.^^ 
SelectedSymbol^^ $
=^^% &
Model^^' ,
.^^, -
Symbols^^- 4
.^^4 5
First^^5 :
(^^: ;
)^^; <
;^^< =
SetUISymbol__ 
(__ 
)__ 
;__ 
}`` 
Settingsbb 
.bb 

TDISymbolsbb 
.bb  
Removebb  &
(bb& '
Modelbb' ,
.bb, -
SelectedSymbolbb- ;
.bb; <
Symbolbb< B
)bbB C
;bbC D
Modelcc 
.cc 
SelectedSymbolcc  
.cc  !
Disposecc! (
(cc( )
)cc) *
;cc* +
Modeldd 
.dd 
Symbolsdd 
.dd 
Removedd  
(dd  !
Modeldd! &
.dd& '
SelectedSymboldd' 5
)dd5 6
;dd6 7
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
{rr 
varss 
	LastKliness 
=ss 
Klinesss  &
.ss& '
Lastss' +
(ss+ ,
)ss, -
;ss- .
vartt 
LastChartKlinett "
=tt# $
(tt% &
	OhlcPointtt& /
?tt/ 0
)tt0 1
Modeltt1 6
.tt6 7!
KlineSeriesCollectiontt7 L
[ttL M
$numttM N
]ttN O
.ttO P
ValuesttP V
[ttV W
^ttW X
$numttX Y
]ttY Z
;ttZ [
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
ÑÑR S
FastMA
ÑÑT Z
,
ÑÑZ [
IEnumerable
ÑÑ\ g
<
ÑÑg h
object
ÑÑh n
>
ÑÑn o
SlowMA
ÑÑp v
,
ÑÑv w
IEnumerableÑÑx É
<ÑÑÉ Ñ
objectÑÑÑ ä
>ÑÑä ã
UpVBÑÑå ê
,ÑÑê ë
IEnumerableÑÑí ù
<ÑÑù û
objectÑÑû §
>ÑÑ§ •
MiddleVBÑÑ¶ Æ
,ÑÑÆ Ø
IEnumerableÑÑ∞ ª
<ÑÑª º
objectÑÑº ¬
>ÑÑ¬ √
DownVBÑÑƒ  
)ÑÑ  À
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
ÜÜ) *
FastMA
ÜÜ* 0
.
ÜÜ0 1
Values
ÜÜ1 7
,
ÜÜ7 8
FastMA
ÜÜ9 ?
)
ÜÜ? @
;
ÜÜ@ A
UpdateIndicator
áá 
(
áá 
Klines
áá "
,
áá" #
Model
áá$ )
.
áá) *
SlowMA
áá* 0
.
áá0 1
Values
áá1 7
,
áá7 8
SlowMA
áá9 ?
)
áá? @
;
áá@ A
UpdateIndicator
àà 
(
àà 
Klines
àà "
,
àà" #
Model
àà$ )
.
àà) *
UpVB
àà* .
.
àà. /
Values
àà/ 5
,
àà5 6
UpVB
àà7 ;
)
àà; <
;
àà< =
UpdateIndicator
ââ 
(
ââ 
Klines
ââ "
,
ââ" #
Model
ââ$ )
.
ââ) *
MiddleVB
ââ* 2
.
ââ2 3
Values
ââ3 9
,
ââ9 :
MiddleVB
ââ; C
)
ââC D
;
ââD E
UpdateIndicator
ää 
(
ää 
Klines
ää "
,
ää" #
Model
ää$ )
.
ää) *
DownVB
ää* 0
.
ää0 1
Values
ää1 7
,
ää7 8
DownVB
ää9 ?
)
ää? @
;
ää@ A
}
ãã 	
private
çç 
void
çç 
UpdateIndicator
çç $
(
çç$ %
IEnumerable
çç% 0
<
çç0 1
Kline
çç1 6
>
çç6 7
Klines
çç8 >
,
çç> ?
IChartValues
çç@ L
values
ççM S
,
ççS T
IEnumerable
ççU `
<
çç` a
object
çça g
>
ççg h
	newValues
ççi r
)
ççr s
{
éé 	
if
èè 
(
èè 
values
èè 
.
èè 
Count
èè 
==
èè 
$num
èè  
)
èè  !
{
êê 
values
ëë 
.
ëë 
AddRange
ëë 
(
ëë  
	newValues
ëë  )
.
ëë) *
Select
ëë* 0
(
ëë0 1
x
ëë1 2
=>
ëë3 5
(
ëë6 7
object
ëë7 =
)
ëë= >
Convert
ëë> E
.
ëëE F
ToDouble
ëëF N
(
ëëN O
x
ëëO P
)
ëëP Q
)
ëëQ R
)
ëëR S
;
ëëS T
return
íí 
;
íí 
}
ìì 
if
ïï 
(
ïï 
Model
ïï 
.
ïï 
Labels
ïï 
.
ïï 
Last
ïï !
(
ïï! "
)
ïï" #
==
ïï$ &
Klines
ïï' -
.
ïï- .
Last
ïï. 2
(
ïï2 3
)
ïï3 4
.
ïï4 5
	_OpenDate
ïï5 >
.
ïï> ?
ToString
ïï? G
(
ïïG H
$str
ïïH N
)
ïïN O
)
ïïO P
{
ññ 
values
óó 
[
óó 
^
óó 
$num
óó 
]
óó 
=
óó 
	newValues
óó &
.
óó& '
Last
óó' +
(
óó+ ,
)
óó, -
;
óó- .
return
òò 
;
òò 
}
ôô 
values
õõ 
.
õõ 
Add
õõ 
(
õõ 
	newValues
õõ  
.
õõ  !
Last
õõ! %
(
õõ% &
)
õõ& '
)
õõ' (
;
õõ( )
}
úú 	
public
ûû 
void
ûû 
AddUser
ûû 
(
ûû 
)
ûû 
{
üü 	
try
†† 
{
°° 
if
¢¢ 
(
¢¢ 
!
¢¢ 

Connection
¢¢ 
.
¢¢  
Context
¢¢  '
.
¢¢' (
Users
¢¢( -
.
¢¢- .
Any
¢¢. 1
(
¢¢1 2
x
¢¢2 3
=>
¢¢4 6
x
¢¢7 8
.
¢¢8 9
UserName
¢¢9 A
==
¢¢B D
Model
¢¢E J
.
¢¢J K
AddUserString
¢¢K X
)
¢¢X Y
)
¢¢Y Z
{
££ 

Connection
§§ 
.
§§ 
Context
§§ &
.
§§& '
Add
§§' *
(
§§* +
new
§§+ .
User
§§/ 3
(
§§3 4
)
§§4 5
{
§§6 7
UserName
§§8 @
=
§§A B
Model
§§C H
.
§§H I
AddUserString
§§I V
,
§§V W
TDI
§§X [
=
§§\ ]
true
§§^ b
,
§§b c
TDIExpiryDate
§§d q
=
§§r s
DateTime
§§t |
.
§§| }
Now§§} Ä
.§§Ä Å
AddDays§§Å à
(§§à â
Model§§â é
.§§é è
AddUserDays§§è ö
)§§ö õ
}§§õ ú
)§§ú ù
;§§ù û
}
•• 
else
¶¶ 
{
ßß 
User
®® 
user
®® 
=
®® 

Connection
®®  *
.
®®* +
Context
®®+ 2
.
®®2 3
Users
®®3 8
.
®®8 9
First
®®9 >
(
®®> ?
x
®®? @
=>
®®A C
x
®®D E
.
®®E F
UserName
®®F N
==
®®O Q
Model
®®R W
.
®®W X
AddUserString
®®X e
)
®®e f
;
®®f g
var
©© 
addDays
©© 
=
©©  !
Model
©©" '
.
©©' (
AddUserDays
©©( 3
==
©©4 6
$num
©©7 8
?
©©9 :
$num
©©; A
:
©©B C
Model
©©D I
.
©©I J
AddUserDays
©©J U
;
©©U V
user
™™ 
.
™™ 
TDIExpiryDate
™™ &
=
™™' (
user
™™) -
.
™™- .
TDIExpiryDate
™™. ;
>=
™™< >
DateTime
™™? G
.
™™G H
Now
™™H K
?
™™L M
user
™™N R
.
™™R S
TDIExpiryDate
™™S `
.
™™` a
AddDays
™™a h
(
™™h i
addDays
™™i p
)
™™p q
:
™™r s
DateTime
™™t |
.
™™| }
Now™™} Ä
.™™Ä Å
AddDays™™Å à
(™™à â
addDays™™â ê
)™™ê ë
;™™ë í
user
´´ 
.
´´ 
TDI
´´ 
=
´´ 
true
´´ #
;
´´# $
}
¨¨ 

Connection
≠≠ 
.
≠≠ 
Context
≠≠ "
.
≠≠" #
SaveChanges
≠≠# .
(
≠≠. /
)
≠≠/ 0
;
≠≠0 1

MessageBox
ØØ 
.
ØØ 
Show
ØØ 
(
ØØ  
$str
ØØ  >
,
ØØ> ?
$str
ØØ@ S
,
ØØS T
MessageBoxButton
ØØU e
.
ØØe f
OK
ØØf h
)
ØØh i
;
ØØi j
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
≈≈ 	
}
∆∆ 
}«« Ñ
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
} •
mC:\Users\√ñmer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\UI\Views\TDI.xaml.cs
	namespace 	!
EASYTelegramSignalBot
 
.  
Views  %
{ 
public 

partial 
class 
TDI 
: 
UserControl *
{		 
public

 
TDI

 
(

 
)

 
{ 	
InitializeComponent 
(  
)  !
;! "
} 	
} 
} 