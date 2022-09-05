╦
dC:\Users\├Цmer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\App.xaml.cs
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
} Й
hC:\Users\├Цmer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\AssemblyInfo.cs
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
 ╜
mC:\Users\├Цmer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\Database\Database.cs
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
} К
tC:\Users\├Цmer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\Database\DatabaseContext.cs
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
}--  
sC:\Users\├Цmer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\Database\DatabaseHelper.cs
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
} Ъ
pC:\Users\├Цmer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\Database\Models\User.cs
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
} й
sC:\Users\├Цmer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\Finance\Binance\Binance.cs
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
KlineInterval	v Г
interval
Д М
,
М Н

TickAction
О Ш

tickAction
Щ г
)
г д
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
Equals	 Е
(
Е Ж
interval
Ж О
)
О П
)
П Р
;
Р С
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
}"" Э+
qC:\Users\├Цmer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\Finance\Binance\Kline.cs
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
}   ╦q
xC:\Users\├Цmer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\Finance\Binance\Subscription.cs
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
Klines	LL Е
.
LLЕ Ж
GetRange
LLЖ О
(
LLО П
Klines
LLП Х
.
LLХ Ц
Count
LLЦ Ы
-
LLЫ Ь
x
LLЬ Э
.
LLЭ Ю

KlineCount
LLЮ и
,
LLи й
x
LLк л
.
LLл м

KlineCount
LLм ╢
)
LL╢ ╖
)
LL╖ ╕
)
LL╕ ╣
.
LL╣ ║
Wait
LL║ ╛
(
LL╛ ┐
)
LL┐ └
)
LL└ ┴
;
LL┴ ┬
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
Klines	SS~ Д
.
SSД Е
GetRange
SSЕ Н
(
SSН О
Klines
SSО Ф
.
SSФ Х
Count
SSХ Ъ
-
SSЫ Ь
x
SSЭ Ю
.
SSЮ Я

KlineCount
SSЯ й
,
SSй к
x
SSл м
.
SSм н

KlineCount
SSн ╖
)
SS╖ ╕
)
SS╕ ╣
)
SS╣ ║
)
SS║ ╗
;
SS╗ ╝
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
Klines	ZZ| В
.
ZZВ Г
GetRange
ZZГ Л
(
ZZЛ М
Klines
ZZМ Т
.
ZZТ У
Count
ZZУ Ш
-
ZZЩ Ъ
x
ZZЫ Ь
.
ZZЬ Э

KlineCount
ZZЭ з
,
ZZз и
x
ZZй к
.
ZZк л

KlineCount
ZZл ╡
)
ZZ╡ ╢
)
ZZ╢ ╖
)
ZZ╖ ╕
)
ZZ╕ ╣
;
ZZ╣ ║
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
ToKlines	oo{ Г
(
ooГ Д
)
ooД Е
.
ooЕ Ж
ForEach
ooЖ Н
(
ooН О
x
ooО П
=>
ooР Т
Klines
ooУ Щ
.
ooЩ Ъ
Add
ooЪ Э
(
ooЭ Ю
x
ooЮ Я
)
ooЯ а
)
ooа б
;
ooб в
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
)	rr А
.
rrА Б
ForEach
rrБ И
(
rrИ Й
x
rrЙ К
=>
rrЛ Н
Klines
rrО Ф
.
rrФ Х
Add
rrХ Ш
(
rrШ Щ
x
rrЩ Ъ
)
rrЪ Ы
)
rrЫ Ь
;
rrЬ Э
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
]	vv А
.
vvА Б
Date
vvБ Е
.
vvЕ Ж

AddSeconds
vvЖ Р
(
vvР С
-
vvС Т
$num
vvТ У
*
vvФ Х
(
vvЦ Ч
int
vvЧ Ъ
)
vvЪ Ы
Interval
vvЫ г
)
vvг д
)
vvд е
.
vvе ж
Result
vvж м
.
vvм н
Data
vvн ▒
.
vv▒ ▓
ToKlines
vv▓ ║
(
vv║ ╗
)
vv╗ ╝
.
vv╝ ╜
ForEach
vv╜ ─
(
vv─ ┼
x
vv┼ ╞
=>
vv╟ ╔
Klines
vv╩ ╨
.
vv╨ ╤
Add
vv╤ ╘
(
vv╘ ╒
x
vv╒ ╓
)
vv╓ ╫
)
vv╫ ╪
;
vv╪ ┘
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
Data	{{ Г
.
{{Г Д
ToKlines
{{Д М
(
{{М Н
)
{{Н О
.
{{О П
ForEach
{{П Ц
(
{{Ц Ч
x
{{Ч Ш
=>
{{Щ Ы
Klines
{{Ь в
.
{{в г
Add
{{г ж
(
{{ж з
x
{{з и
)
{{и й
)
{{й к
;
{{к л
}|| 
}}} 	
public 
void 
Cancel 
( 
) 
{
АА 	%
CancellationTokenSource
ББ #
?
ББ# $
.
ББ$ %
Cancel
ББ% +
(
ББ+ ,
)
ББ, -
;
ББ- .
}
ВВ 	
}
ГГ 
}ДД З
kC:\Users\├Цmer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\Finance\Helpers.cs
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
rC:\Users\├Цmer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\Finance\Indicators\PAC.cst
rC:\Users\├Цmer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\Finance\Indicators\RSI.csзд
rC:\Users\├Цmer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\Finance\Indicators\TDI.cs
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
> 
FastMAResults ,
{- .
get/ 2
;2 3
set4 7
;7 8
}9 :
public 
List 
< 
	SmaResult 
> 
SlowMAResults ,
{- .
get/ 2
;2 3
set4 7
;7 8
}9 :
public 
List 
< 
double 
? 
> 
UpVBResults (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
public 
List 
< 
double 
? 
> 
MiddleVBResults ,
{- .
get/ 2
;2 3
set4 7
;7 8
}9 :
public 
List 
< 
double 
? 
> 
DownVBResults *
{+ ,
get- 0
;0 1
set2 5
;5 6
}7 8
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
<	 А
string
А Ж
,
Ж З

SignalType
И Т
>
Т У
signalAction
Ф а
)
а б
{ 	
Interval 
= 
interval 
;  
UpdateAction 
= 
updateAction '
;' (
SignalAction 
= 
signalAction '
;' (
Symbol 
= 
symbol 
; 

TickAction 
action 
= 
new  #
(# $
)$ %
{   

KlineCount!! 
=!! 
$num!!  
,!!  !
Creator"" 
="" 
this"" 
,"" 
TriggerType## 
=## 
Helpers## %
.##% &
TriggerType##& 1
.##1 2
KlineUpdate##2 =
,##= >
Action$$ 
=$$ 
Indicate$$ !
}%% 
;%% 
Subscription'' 
='' 
StaticBinance'' (
.''( )(
SubscribeToKlineUpdatesAsync'') E
(''E F
Helpers(( 
.(( 
SubscriptionType(( $
.(($ %

UsdFutures((% /
,((/ 0
Symbol)) 
,)) 
Interval** 
,** 
action++ 
)++ 
;++ 
},, 	
public.. 
void.. 
Indicate.. 
(.. 
List.. !
<..! "
Kline.." '
>..' (
data..) -
)..- .
{// 	
var11 
Rsi11 
=11 
data11 
.11 
GetRsi11 !
(11! "
$num11" $
)11$ %
.11% &
ToList11& ,
(11, -
)11- .
;11. /
var44 
FastMA44 
=44 
Rsi44 
.44 
GetSma44 #
(44# $
$num44$ %
)44% &
.44& '
ToList44' -
(44- .
)44. /
;44/ 0
var77 
slowMA77 
=77 
Rsi77 
.77 
GetSma77 #
(77# $
$num77$ %
)77% &
.77& '
ToList77' -
(77- .
)77. /
;77/ 0
var:: 
ma:: 
=:: 
Rsi:: 
.:: 
GetSma:: 
(::  
$num::  "
)::" #
.::# $
ToDictionary::$ 0
(::0 1
x::1 2
=>::3 5
x::6 7
.::7 8
Date::8 <
,::< =
x::> ?
=>::@ B
x::C D
.::D E
Sma::E H
)::H I
;::I J
var;; 
stdev;; 
=;; 
Rsi;; 
.;; 
	GetStdDev;; %
(;;% &
$num;;& (
);;( )
.;;) *
ToDictionary;;* 6
(;;6 7
x;;7 8
=>;;9 ;
x;;< =
.;;= >
Date;;> B
,;;B C
x;;D E
=>;;F H
x;;I J
.;;J K
StdDev;;K Q
*;;R S
$num;;T Z
);;Z [
;;;[ \
var<< 
up<< 
=<< 
ma<< 
.<< 
ToDictionary<< $
(<<$ %
x<<% &
=><<' )
x<<* +
.<<+ ,
Key<<, /
,<</ 0
x<<1 2
=><<3 5
x<<6 7
.<<7 8
Value<<8 =
+<<> ?
stdev<<@ E
[<<E F
x<<F G
.<<G H
Key<<H K
]<<K L
)<<L M
;<<M N
var== 
dn== 
=== 
ma== 
.== 
ToDictionary== $
(==$ %
x==% &
=>==' )
x==* +
.==+ ,
Key==, /
,==/ 0
x==1 2
=>==3 5
x==6 7
.==7 8
Value==8 =
-==> ?
stdev==@ E
[==E F
x==F G
.==G H
Key==H K
]==K L
)==L M
;==M N
var@@ 
UpRange@@ 
=@@ 
up@@ 
.@@ 
Values@@ #
.@@# $
Max@@$ '
(@@' (
)@@( )
-@@* +
up@@, .
.@@. /
Values@@/ 5
.@@5 6
Min@@6 9
(@@9 :
)@@: ;
;@@; <
varAA 
UpMinAA 
=AA 
upAA 
.AA 
ValuesAA !
.AA! "
MinAA" %
(AA% &
)AA& '
;AA' (
upBB 
=BB 
upBB 
.BB 
ToDictionaryBB  
(BB  !
xBB! "
=>BB# %
xBB& '
.BB' (
KeyBB( +
,BB+ ,
xBB- .
=>BB/ 1
$numBB2 5
*BB6 7
(BB8 9
xBB9 :
.BB: ;
ValueBB; @
-BBA B
UpMinBBC H
)BBH I
/BBJ K
UpRangeBBL S
)BBS T
;BBT U
varDD 
	DownRangeDD 
=DD 
dnDD 
.DD 
ValuesDD %
.DD% &
MaxDD& )
(DD) *
)DD* +
-DD, -
dnDD. 0
.DD0 1
ValuesDD1 7
.DD7 8
MinDD8 ;
(DD; <
)DD< =
;DD= >
varEE 
DownMinEE 
=EE 
dnEE 
.EE 
ValuesEE #
.EE# $
MinEE$ '
(EE' (
)EE( )
;EE) *
dnFF 
=FF 
dnFF 
.FF 
ToDictionaryFF  
(FF  !
xFF! "
=>FF# %
xFF& '
.FF' (
KeyFF( +
,FF+ ,
xFF- .
=>FF/ 1
$numFF2 5
*FF6 7
(FF8 9
xFF9 :
.FF: ;
ValueFF; @
-FFA B
DownMinFFC J
)FFJ K
/FFL M
	DownRangeFFN W
)FFW X
;FFX Y
varHH 
mdlHH 
=HH 
upHH 
.HH 
ToDictionaryHH %
(HH% &
xHH& '
=>HH( *
xHH+ ,
.HH, -
KeyHH- 0
,HH0 1
xHH2 3
=>HH4 6
(HH7 8
xHH8 9
.HH9 :
ValueHH: ?
+HH@ A
dnHHB D
[HHD E
xHHE F
.HHF G
KeyHHG J
]HHJ K
)HHK L
/HHM N
$numHHO P
)HHP Q
;HHQ R
FastMAResultsKK 
=KK 
FastMAKK "
;KK" #
SlowMAResultsLL 
=LL 
slowMALL "
;LL" #
UpVBResultsMM 
=MM 
upMM 
.MM 
ValuesMM #
.MM# $
ToListMM$ *
(MM* +
)MM+ ,
;MM, -
MiddleVBResultsNN 
=NN 
mdlNN !
.NN! "
ValuesNN" (
.NN( )
ToListNN) /
(NN/ 0
)NN0 1
;NN1 2
DownVBResultsOO 
=OO 
dnOO 
.OO 
ValuesOO %
.OO% &
ToListOO& ,
(OO, -
)OO- .
;OO. /
ValuesQQ 
=QQ 
newQQ 
(QQ 
)QQ 
{RR 
{SS 
$strSS 
,SS 
dataSS  $
.SS$ %
SelectSS% +
(SS+ ,
xSS, -
=>SS. 0
(SS1 2
objectSS2 8
?SS8 9
)SS9 :
xSS: ;
??SS< >
$numSS? @
)SS@ A
.SSA B
ToListSSB H
(SSH I
)SSI J
.SSJ K
GetRangeSSK S
(SSS T
dataSST X
.SSX Y
CountSSY ^
-SS^ _
$numSS_ a
,SSa b
$numSSb d
)SSd e
}SSf g
,SSg h
{TT 
$strTT 
,TT 
FastMAResultsTT  -
.TT- .
SelectTT. 4
(TT4 5
xTT5 6
=>TT7 9
(TT: ;
objectTT; A
?TTA B
)TTB C
xTTC D
.TTD E
SmaTTE H
??TTI K
$numTTL M
)TTM N
.TTN O
ToListTTO U
(TTU V
)TTV W
.TTW X
GetRangeTTX `
(TT` a
dataTTa e
.TTe f
CountTTf k
-TTk l
$numTTl n
,TTn o
$numTTo q
)TTq r
}TTs t
,TTt u
{UU 
$strUU 
,UU 
SlowMAResultsUU  -
.UU- .
SelectUU. 4
(UU4 5
xUU5 6
=>UU7 9
(UU: ;
objectUU; A
?UUA B
)UUB C
xUUC D
.UUD E
SmaUUE H
??UUI K
$numUUL M
)UUM N
.UUN O
ToListUUO U
(UUU V
)UUV W
.UUW X
GetRangeUUX `
(UU` a
dataUUa e
.UUe f
CountUUf k
-UUk l
$numUUl n
,UUn o
$numUUo q
)UUq r
}UUs t
,UUt u
{VV 
$strVV 
,VV 
UpVBResultsVV )
.VV) *
SelectVV* 0
(VV0 1
xVV1 2
=>VV3 5
xVV6 7
==VV8 :
nullVV; ?
?VV@ A
$numVVB C
:VVD E
(VVF G
objectVVG M
?VVM N
)VVN O
xVVO P
.VVP Q
ValueVVQ V
??VVW Y
$numVVZ [
)VV[ \
.VV\ ]
ToListVV] c
(VVc d
)VVd e
.VVe f
GetRangeVVf n
(VVn o
dataVVo s
.VVs t
CountVVt y
-VVy z
$numVVz |
,VV| }
$numVV} 
)	VV А
}
VVБ В
,
VVВ Г
{WW 
$strWW  
,WW  !
MiddleVBResultsWW" 1
.WW1 2
SelectWW2 8
(WW8 9
xWW9 :
=>WW; =
xWW? @
==WWA C
nullWWD H
?WWI J
$numWWK L
:WWM N
(WWO P
objectWWP V
?WWV W
)WWW X
xWWX Y
.WWY Z
ValueWWZ _
??WW` b
$numWWc d
)WWd e
.WWe f
ToListWWf l
(WWl m
)WWm n
.WWn o
GetRangeWWo w
(WWw x
dataWWx |
.WW| }
Count	WW} В
-
WWВ Г
$num
WWГ Е
,
WWЕ Ж
$num
WWЖ И
)
WWИ Й
}
WWК Л
,
WWЛ М
{XX 
$strXX 
,XX 
DownVBResultsXX  -
.XX- .
SelectXX. 4
(XX4 5
xXX5 6
=>XX7 9
xXX; <
==XX= ?
nullXX@ D
?XXE F
$numXXG H
:XXI J
(XXK L
objectXXL R
?XXR S
)XXS T
xXXT U
.XXU V
ValueXXV [
??XX\ ^
$numXX_ `
)XX` a
.XXa b
ToListXXb h
(XXh i
)XXi j
.XXj k
GetRangeXXk s
(XXs t
dataXXt x
.XXx y
CountXXy ~
-XX~ 
$num	XX Б
,
XXБ В
$num
XXВ Д
)
XXД Е
}
XXЖ З
}YY 
;YY 
UpdateAction[[ 
([[ 
Symbol[[ 
,[[  
Values[[! '
)[[' (
;[[( )

SignalType]] 
RSI_PL]] 
=]] 

SignalType]]  *
.]]* +
None]]+ /
;]]/ 0
if^^ 
(^^ 
FastMA^^ 
.^^ 
Last^^ 
(^^ 
)^^ 
.^^ 
Sma^^ !
>^^" #
$num^^$ &
||^^' )
FastMA^^* 0
.^^0 1
Last^^1 5
(^^5 6
)^^6 7
.^^7 8
Sma^^8 ;
<^^< =
$num^^> @
)^^@ A
RSI_PL^^B H
=^^I J

SignalType^^K U
.^^U V
Exit^^V Z
;^^Z [
else__ 
if__ 
(__ 
FastMA__ 
.__ 
Last__  
(__  !
)__! "
.__" #
Sma__# &
>__' (
$num__) +
)__+ ,
RSI_PL__- 3
=__4 5

SignalType__6 @
.__@ A
Long__A E
;__E F
else`` 
RSI_PL`` 
=`` 

SignalType`` $
.``$ %
Short``% *
;``* +

SignalTypebb 
TSLbb 
=bb 

SignalTypebb '
.bb' (
Nonebb( ,
;bb, -
ifcc 
(cc 
(cc 
intcc 
)cc 
(cc 
FastMAcc 
.cc 
Lastcc !
(cc! "
)cc" #
.cc# $
Smacc$ '
??cc( *
$numcc+ ,
)cc, -
==cc. 0
(cc1 2
intcc2 5
)cc5 6
(cc6 7
slowMAcc7 =
.cc= >
Lastcc> B
(ccB C
)ccC D
.ccD E
SmaccE H
??ccI K
$numccL M
)ccM N
)ccN O
TSLccP S
=ccT U

SignalTypeccV `
.cc` a
Exitcca e
;cce f
elsedd 
ifdd 
(dd 
(dd 
intdd 
)dd 
(dd 
FastMAdd !
.dd! "
Lastdd" &
(dd& '
)dd' (
.dd( )
Smadd) ,
??dd- /
$numdd0 1
)dd1 2
>dd3 4
(dd5 6
intdd6 9
)dd9 :
(dd: ;
slowMAdd; A
.ddA B
LastddB F
(ddF G
)ddG H
.ddH I
SmaddI L
??ddM O
$numddP Q
)ddQ R
)ddR S
TSLddT W
=ddX Y

SignalTypeddZ d
.ddd e
Longdde i
;ddi j
elseee 
TSLee 
=ee 

SignalTypeee !
.ee! "
Shortee" '
;ee' (

SignalTypegg 
MBLgg 
=gg 

SignalTypegg '
.gg' (
Nonegg( ,
;gg, -
ifhh 
(hh 
(hh 
inthh 
)hh 
(hh 
FastMAhh 
.hh 
Lasthh !
(hh! "
)hh" #
.hh# $
Smahh$ '
??hh( *
$numhh+ ,
)hh, -
==hh. 0
(hh1 2
inthh2 5
)hh5 6
(hh6 7
mdlhh7 :
.hh: ;
Lasthh; ?
(hh? @
)hh@ A
.hhA B
ValuehhB G
??hhH J
$numhhK L
)hhL M
)hhM N
MBLhhO R
=hhS T

SignalTypehhU _
.hh_ `
Exithh` d
;hhd e
elseii 
ifii 
(ii 
(ii 
intii 
)ii 
(ii 
FastMAii !
.ii! "
Lastii" &
(ii& '
)ii' (
.ii( )
Smaii) ,
??ii- /
$numii0 1
)ii1 2
>ii3 4
(ii5 6
intii6 9
)ii9 :
(ii: ;
mdlii; >
.ii> ?
Lastii? C
(iiC D
)iiD E
.iiE F
ValueiiF K
??iiL N
$numiiO P
)iiP Q
)iiQ R
MBLiiS V
=iiW X

SignalTypeiiY c
.iic d
Longiid h
;iih i
elsejj 
MBLjj 
=jj 

SignalTypejj !
.jj! "
Shortjj" '
;jj' (

SignalTypell 
VBll 
=ll 

SignalTypell &
.ll& '
Nonell' +
;ll+ ,
ifmm 
(mm 
(mm 
intmm 
)mm 
(mm 
FastMAmm 
.mm 
Lastmm !
(mm! "
)mm" #
.mm# $
Smamm$ '
??mm( *
$nummm+ ,
)mm, -
>mm. /
(mm0 1
intmm1 4
)mm4 5
(mm5 6
upmm6 8
.mm8 9
Lastmm9 =
(mm= >
)mm> ?
.mm? @
Valuemm@ E
??mmF H
$nummmI J
)mmJ K
)mmK L
VBmmM O
=mmP Q

SignalTypemmR \
.mm\ ]
Exitmm] a
;mma b
elsenn 
ifnn 
(nn 
(nn 
intnn 
)nn 
(nn 
FastMAnn !
.nn! "
Lastnn" &
(nn& '
)nn' (
.nn( )
Smann) ,
??nn- /
$numnn0 1
)nn1 2
<nn3 4
(nn5 6
intnn6 9
)nn9 :
(nn: ;
dnnn; =
.nn= >
Lastnn> B
(nnB C
)nnC D
.nnD E
ValuennE J
??nnK M
$numnnN O
)nnO P
)nnP Q
VBnnR T
=nnU V

SignalTypennW a
.nna b
Longnnb f
;nnf g
elseoo 
VBoo 
=oo 

SignalTypeoo  
.oo  !
Shortoo! &
;oo& '
ifqq 
(qq 
RSI_PLqq 
==qq 
TSLqq 
&&qq  
RSI_PLqq! '
==qq( *
MBLqq+ .
&&qq/ 1
RSI_PLqq2 8
==qq9 ;
VBqq< >
)qq> ?
{rr 
Tasktt 
.tt 
Runtt 
(tt 
(tt 
)tt 
=>tt 
SignalActiontt +
(tt+ ,
Symboltt, 2
,tt2 3
RSI_PLtt4 :
)tt: ;
)tt; <
;tt< =
Consoleuu 
.uu 
	WriteLineuu !
(uu! "
$"uu" $
$struu$ 3
{uu3 4
Symboluu4 :
}uu: ;
$struu; ?
{uu? @
nameofuu@ F
(uuF G
RSI_PLuuG M
)uuM N
}uuN O
$struuO Q
{uuQ R
EnumuuR V
.uuV W
GetNameuuW ^
(uu^ _
typeofuu_ e
(uue f

SignalTypeuuf p
)uup q
,uuq r
RSI_PLuus y
)uuy z
}uuz {
"uu{ |
)uu| }
;uu} ~
}vv 
elseww 
{xx 
Consoleyy 
.yy 
	WriteLineyy !
(yy! "
$"yy" $
$stryy$ +
{yy+ ,
Symbolyy, 2
}yy2 3
$stryy3 7
{yy7 8
Enumyy8 <
.yy< =
GetNameyy= D
(yyD E
typeofyyE K
(yyK L

SignalTypeyyL V
)yyV W
,yyW X
RSI_PLyyY _
)yy_ `
}yy` a
$stryya l
{yyl m
Enumyym q
.yyq r
GetNameyyr y
(yyy z
typeof	yyz А
(
yyА Б

SignalType
yyБ Л
)
yyЛ М
,
yyМ Н
TSL
yyО С
)
yyС Т
}
yyТ У
$str
yyУ Ю
{
yyЮ Я
Enum
yyЯ г
.
yyг д
GetName
yyд л
(
yyл м
typeof
yyм ▓
(
yy▓ │

SignalType
yy│ ╜
)
yy╜ ╛
,
yy╛ ┐
MBL
yy└ ├
)
yy├ ─
}
yy─ ┼
$str
yy┼ ╧
{
yy╧ ╨
Enum
yy╨ ╘
.
yy╘ ╒
GetName
yy╒ ▄
(
yy▄ ▌
typeof
yy▌ у
(
yyу ф

SignalType
yyф ю
)
yyю я
,
yyя Ё
VB
yyё є
)
yyє Ї
}
yyЇ ї
"
yyї Ў
)
yyЎ ў
;
yyў °
}zz 
}{{ 	
}|| 
}}} ю
tC:\Users\├Цmer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\Finance\Models\Indicator.cs
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
 
public 
enum 

SignalType 
{ 	
Exit 
= 
$num 
, 
Long 
= 
$num 
, 
Short 
= 
$num 
, 
Buy 
= 
$num 
, 
Sell 
= 
$num 
, 
None 
= 
$num 
} 	
public 
string 
IndicatorKey "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
string 
Symbol 
{ 
get "
;" #
set$ '
;' (
}) *
public 
KlineInterval 
Interval %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public 
Action 
< 
string 
, 

SignalType (
>( )
SignalAction* 6
{7 8
get9 <
;< =
set> A
;A B
}C D
public 
Action 
< 
string 
, 

Dictionary (
<( )
string) /
,/ 0
List1 5
<5 6
object6 <
>< =
>= >
>> ?
UpdateAction@ L
{M N
getO R
;R S
setT W
;W X
}Y Z
public 
KlineSubscription  
Subscription! -
{. /
get0 3
;3 4
set5 8
;8 9
}: ;
public 

Dictionary 
< 
string 
,  
List! %
<% &
object& ,
>, -
>- .
Values/ 5
{6 7
get8 ;
;; <
set= @
;@ A
}B C
public 
void 
Dispose 
( 
) 
{ 	
var 
func 
= 
Subscription #
.# $
Actions$ +
.+ ,
First, 1
(1 2
x2 3
=>4 6
x7 8
.8 9
Creator9 @
==A C
thisD H
)H I
;I J
Subscription   
.   
Actions    
.    !
Remove  ! '
(  ' (
func  ( ,
)  , -
;  - .
}!! 	
}"" 
}## ┼
uC:\Users\├Цmer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\Finance\Models\TickAction.cs
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
} Ё

pC:\Users\├Цmer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\MVVM\DelegateCommand.cs
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
} ┴
qC:\Users\├Цmer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\MVVM\ObservableObject.cs
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
} У
|C:\Users\├Цmer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\SettingsManager\Models\JsonModel.cs
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
}   н(
tC:\Users\├Цmer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\SettingsManager\Settings.cs
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
}BB ¤
oC:\Users\├Цmer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\Telegram\BotClients.cs
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
}!! К;
sC:\Users\├Цmer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\Telegram\UpdateHandlers.cs
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
cancellationToken	t Е
)
Е Ж
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
apiRequestException	v Й
.
Й К
Message
К С
}
С Т
"
Т У
,
У Ф
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
cancellationToken	r Г
)
Г Д
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
;33K L
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
$str	>> В
;
>>В Г
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
}__ ┬u
nC:\Users\├Цmer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\UI\Models\TDIModel.cs
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
,7 8
Stroke9 ?
=? @
Brushes@ G
.G H
GreenH M
,M N
PointGeometrySizeO `
=` a
$numa b
,b c
Valuesd j
=k l
newm p
ChartValuesq |
<| }
double	} Г
>
Г Д
(
Д Е
)
Е Ж
,
Ж З
Fill
И М
=
Н О
Brushes
П Ц
.
Ц Ч
Transparent
Ч в
}
г д
;
д е
SlowMA 
= 
new 
( 
) 
{ 
Title $
=% &
$str' :
,: ;
Stroke< B
=C D
BrushesE L
.L M
RedM P
,P Q
PointGeometrySizeR c
=d e
$numf g
,g h
Valuesh n
=o p
newq t
ChartValues	u А
<
А Б
double
Б З
>
З И
(
И Й
)
Й К
,
К Л
Fill
М Р
=
С Т
Brushes
У Ъ
.
Ъ Ы
Transparent
Ы ж
}
з и
;
и й
UpVB 
= 
new 
( 
) 
{ 
Title $
=% &
$str' 9
,9 :
Stroke; A
=B C
BrushesD K
.K L
BlueL P
,P Q
PointGeometrySizeR c
=d e
$numf g
,g h
Valuesi o
=p q
newr u
ChartValues	v Б
<
Б В
double
В И
>
И Й
(
Й К
)
К Л
,
Л М
Fill
Н С
=
Т У
Brushes
Ф Ы
.
Ы Ь
Transparent
Ь з
}
и й
;
й к
MiddleVB 
= 
new 
( 
) 
{ 
Title $
=% &
$str' =
,= >
Stroke? E
=F G
BrushesH O
.O P
YellowP V
,V W
PointGeometrySizeX i
=j k
$numl m
,m n
Valueso u
=v w
newx {
ChartValues	| З
<
З И
double
И О
>
О П
(
П Р
)
Р С
,
С Т
Fill
У Ч
=
Ш Щ
Brushes
Ъ б
.
б в
Transparent
в н
}
о п
;
п ░
DownVB 
= 
new 
( 
) 
{ 
Title $
=% &
$str' ;
,; <
Stroke= C
=D E
BrushesF M
.M N
BlueN R
,R S
PointGeometrySizeT e
=f g
$numh i
,i j
Valuesk q
=r s
newt w
ChartValues	x Г
<
Г Д
double
Д К
>
К Л
(
Л М
)
М Н
,
Н О
Fill
П У
=
Ф Х
Brushes
Ц Э
.
Э Ю
Transparent
Ю й
}
к л
;
л м&
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
;:: 
OnPropertyChanged;; !
(;;! "
nameof;;" (
(;;( )
Labels;;) /
);;/ 0
);;0 1
;;;1 2
}<< 
}== 	
public?? 
event?? '
PropertyChangedEventHandler?? 0
PropertyChanged??1 @
;??@ A
	protected@@ 
virtual@@ 
void@@ 
OnPropertyChanged@@ 0
(@@0 1
string@@1 7
propertyName@@8 D
=@@E F
null@@G K
)@@K L
{AA 	
PropertyChangedBB 
?BB 
.BB 
InvokeBB #
(BB# $
thisBB$ (
,BB( )
newBB* -$
PropertyChangedEventArgsBB. F
(BBF G
propertyNameBBG S
)BBS T
)BBT U
;BBU V
}CC 	
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
АА 
string
АА 
addUserString
АА $
{
АА% &
get
АА' *
;
АА* +
set
АА, /
;
АА/ 0
}
АА1 2
public
ББ 
string
ББ 
AddUserString
ББ #
{
ВВ 	
get
ГГ 
{
ДД 
if
ЕЕ 
(
ЕЕ 
string
ЕЕ 
.
ЕЕ 
IsNullOrEmpty
ЕЕ (
(
ЕЕ( )
addUserString
ЕЕ) 6
)
ЕЕ6 7
)
ЕЕ7 8
return
ЕЕ9 ?
$str
ЕЕ@ B
;
ЕЕB C
return
ЖЖ 
addUserString
ЖЖ $
;
ЖЖ$ %
}
ЗЗ 
set
ИИ 
{
ЙЙ 
addUserString
КК 
=
КК 
value
КК  %
;
КК% &'
RaisePropertyChangedEvent
ЛЛ )
(
ЛЛ) *
nameof
ЛЛ* 0
(
ЛЛ0 1
AddUserString
ЛЛ1 >
)
ЛЛ> ?
)
ЛЛ? @
;
ЛЛ@ A'
RaisePropertyChangedEvent
ММ )
(
ММ) *
nameof
ММ* 0
(
ММ0 1$
IsAddUserButtonEnabled
ММ1 G
)
ММG H
)
ММH I
;
ММI J
}
НН 
}
ОО 	
private
РР 
int
РР 
?
РР 
addUserDays
РР  
{
РР! "
get
РР# &
;
РР& '
set
РР( +
;
РР+ ,
}
РР- .
public
СС 
int
СС 
AddUserDays
СС 
{
ТТ 	
get
УУ 
{
ФФ 
return
ХХ 
addUserDays
ХХ "
??
ХХ# %
$num
ХХ& (
;
ХХ( )
}
ЦЦ 
set
ЧЧ 
{
ШШ 
addUserDays
ЩЩ 
=
ЩЩ 
value
ЩЩ #
<
ЩЩ$ %
$num
ЩЩ& '
?
ЩЩ( )
$num
ЩЩ* +
:
ЩЩ, -
value
ЩЩ. 3
;
ЩЩ3 4'
RaisePropertyChangedEvent
ЪЪ )
(
ЪЪ) *
nameof
ЪЪ* 0
(
ЪЪ0 1
AddUserDays
ЪЪ1 <
)
ЪЪ< =
)
ЪЪ= >
;
ЪЪ> ?'
RaisePropertyChangedEvent
ЫЫ )
(
ЫЫ) *
nameof
ЫЫ* 0
(
ЫЫ0 1$
IsAddUserButtonEnabled
ЫЫ1 G
)
ЫЫG H
)
ЫЫH I
;
ЫЫI J
}
ЬЬ 
}
ЭЭ 	
public
ЯЯ 
bool
ЯЯ 
?
ЯЯ $
IsAddUserButtonEnabled
ЯЯ +
{
аа 	
get
бб 
{
вв 
if
гг 
(
гг 
string
гг 
.
гг 
IsNullOrEmpty
гг (
(
гг( )
addUserString
гг) 6
)
гг6 7
)
гг7 8
return
гг9 ?
false
гг@ E
;
ггE F
return
дд 
true
дд 
;
дд 
}
ее 
}
жж 	
private
ии 
string
ии 
addSymbolString
ии &
{
ии' (
get
ии) ,
;
ии, -
set
ии. 1
;
ии1 2
}
ии3 4
public
йй 
string
йй 
AddSymbolString
йй %
{
кк 	
get
лл 
{
мм 
if
нн 
(
нн 
string
нн 
.
нн 
IsNullOrEmpty
нн (
(
нн( )
addSymbolString
нн) 8
)
нн8 9
)
нн9 :
return
нн; A
$str
ннB D
;
ннD E
return
оо 
addSymbolString
оо &
;
оо& '
}
пп 
set
░░ 
{
▒▒ 
addSymbolString
▓▓ 
=
▓▓  !
value
▓▓" '
;
▓▓' ('
RaisePropertyChangedEvent
││ )
(
││) *
nameof
││* 0
(
││0 1
AddSymbolString
││1 @
)
││@ A
)
││A B
;
││B C'
RaisePropertyChangedEvent
┤┤ )
(
┤┤) *
nameof
┤┤* 0
(
┤┤0 1&
IsAddSymbolButtonEnabled
┤┤1 I
)
┤┤I J
)
┤┤J K
;
┤┤K L
}
╡╡ 
}
╢╢ 	
public
╕╕ 
bool
╕╕ 
?
╕╕ &
IsAddSymbolButtonEnabled
╕╕ -
{
╣╣ 	
get
║║ 
{
╗╗ 
if
╝╝ 
(
╝╝ 
string
╝╝ 
.
╝╝ 
IsNullOrEmpty
╝╝ (
(
╝╝( )
addSymbolString
╝╝) 8
)
╝╝8 9
)
╝╝9 :
return
╝╝; A
false
╝╝B G
;
╝╝G H
return
╜╜ 
true
╜╜ 
;
╜╜ 
}
╛╛ 
}
┐┐ 	
}
└└ 
}┴┴ ┐
wC:\Users\├Цmer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\UI\ViewModels\MainViewModel.cs
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
 я╤
vC:\Users\├Цmer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\UI\ViewModels\TDIViewModel.cs
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
.''0 1
Count''1 6
(''6 7
)''7 8
>''9 :
$num''; <
?''= >
Settings''? G
.''G H

TDISymbols''H R
.''R S
First''S X
(''X Y
)''Y Z
:''[ \
$str''] _
;''_ `
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
--А Б
)
--В Г
;
--Г Д
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
11А Д
<
11Д Е
object
11Е Л
>
11Л М
>
11М Н
values
11О Ф
)
11Ф Х
=>
11Ц Ш
{
11Щ Ъ
}
11Ы Ь
,
11Ь Э
SendSignalMessage
11Ю п
)
11п ░
{
11▒ ▓
}
11│ ┤
)
11┤ ╡
;
11╡ ╢
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
$str	HHy М
{
HHМ Н
symbol
HHН У
}
HHУ Ф
"
HHФ Х
)
HHХ Ц
;
HHЦ Ч
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
>	QQ А
values
QQБ З
)
QQЗ И
=>
QQЙ Л
{
QQМ Н
}
QQО П
;
QQП Р
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
Symbol\\6 <
)\\< =
{]] 
if^^ 
(^^ 
Model^^ 
.^^ 
Symbols^^  
.^^  !
Count^^! &
>^^' (
$num^^) *
)^^* +
{__ 
}aa 
}bb 
Settingsdd 
.dd 

TDISymbolsdd 
.dd  
Removedd  &
(dd& '
Modeldd' ,
.dd, -
SelectedSymboldd- ;
.dd; <
Symboldd< B
)ddB C
;ddC D
Modelee 
.ee 
SelectedSymbolee  
.ee  !
Disposeee! (
(ee( )
)ee) *
;ee* +
Modelff 
.ff 
Symbolsff 
.ff 
Removeff  
(ff  !
Modelff! &
.ff& '
SelectedSymbolff' 5
)ff5 6
;ff6 7
}hh 	
publicjj 
voidjj 
UpdateKlinesjj  
(jj  !
IEnumerablejj! ,
<jj, -
Klinejj- 2
>jj2 3
Klinesjj4 :
)jj: ;
{kk 	
ifll 
(ll 
Modelll 
.ll 
KlineSeriesll !
.ll! "
Valuesll" (
.ll( )
Countll) .
==ll/ 1
$numll2 3
)ll3 4
{mm 
Modelnn 
.nn 
Labelsnn 
=nn 
Klinesnn %
.nn% &
Selectnn& ,
(nn, -
xnn- .
=>nn/ 1
xnn2 3
.nn3 4
	_OpenDatenn4 =
.nn= >
ToStringnn> F
(nnF G
$strnnG M
)nnM N
)nnN O
.nnO P
ToListnnP V
(nnV W
)nnW X
;nnX Y
Modeloo 
.oo 
KlineSeriesoo !
.oo! "
Valuesoo" (
.oo( )
AddRangeoo) 1
(oo1 2
Klinesoo2 8
.oo8 9
Selectoo9 ?
(oo? @
xoo@ A
=>ooB D
newooE H
	OhlcPointooI R
(ooR S
(ooS T
doubleooT Z
)ooZ [
xoo[ \
.oo\ ]
_Openoo] b
,oob c
(ood e
doubleooe k
)ook l
xool m
.oom n
_Highoon s
,oos t
(oou v
doubleoov |
)oo| }
xoo} ~
.oo~ 
_Low	oo Г
,
ooГ Д
(
ooЕ Ж
double
ooЖ М
)
ooМ Н
x
ooН О
.
ooО П
_Close
ooП Х
)
ooХ Ц
)
ooЦ Ч
.
ooЧ Ш
ToList
ooШ Ю
(
ooЮ Я
)
ooЯ а
)
ooа б
;
ooб в
returnpp 
;pp 
}qq 
ifss 
(ss 
Modelss 
.ss 
Labelsss 
.ss 
Lastss !
(ss! "
)ss" #
==ss$ &
Klinesss' -
.ss- .
Lastss. 2
(ss2 3
)ss3 4
.ss4 5
	_OpenDatess5 >
.ss> ?
ToStringss? G
(ssG H
$strssH N
)ssN O
)ssO P
{tt 
varuu 
LastChartKlineuu "
=uu# $
(uu% &
	OhlcPointuu& /
)uu/ 0
Modeluu0 5
.uu5 6!
KlineSeriesCollectionuu6 K
[uuK L
$numuuL M
]uuM N
.uuN O
ValuesuuO U
[uuU V
^uuV W
$numuuW X
]uuX Y
;uuY Z
varvv 
	LastKlinevv 
=vv 
Klinesvv  &
.vv& '
Lastvv' +
(vv+ ,
)vv, -
;vv- .
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
АА 
.
АА 
Labels
АА 
.
АА 
Add
АА 
(
АА 
Klines
АА #
.
АА# $
Last
АА$ (
(
АА( )
)
АА) *
.
АА* +
	_OpenDate
АА+ 4
.
АА4 5
ToString
АА5 =
(
АА= >
$str
АА> D
)
ААD E
)
ААE F
;
ААF G
Model
ББ 
.
ББ #
KlineSeriesCollection
ББ '
[
ББ' (
$num
ББ( )
]
ББ) *
.
ББ* +
Values
ББ+ 1
.
ББ1 2
Add
ББ2 5
(
ББ5 6
new
ББ6 9
	OhlcPoint
ББ: C
(
ББC D
(
ББD E
double
ББE K
)
ББK L
Klines
ББL R
.
ББR S
Last
ББS W
(
ББW X
)
ББX Y
.
ББY Z
_Open
ББZ _
,
ББ_ `
(
ББa b
double
ББb h
)
ББh i
Klines
ББi o
.
ББo p
Last
ББp t
(
ББt u
)
ББu v
.
ББv w
_High
ББw |
,
ББ| }
(
ББ~ 
doubleББ Е
)ББЕ Ж
KlinesББЖ М
.ББМ Н
LastББН С
(ББС Т
)ББТ У
.ББУ Ф
_LowББФ Ш
,ББШ Щ
(ББЪ Ы
doubleББЫ б
)ББб в
KlinesББв и
.ББи й
LastББй н
(ББн о
)ББо п
.ББп ░
_CloseББ░ ╢
)ББ╢ ╖
)ББ╖ ╕
;ББ╕ ╣
}
ВВ 	
public
ДД 
void
ДД 
UpdateIndicators
ДД $
(
ДД$ %
IEnumerable
ДД% 0
<
ДД0 1
Kline
ДД1 6
>
ДД6 7
Klines
ДД8 >
,
ДД> ?
IEnumerable
ДД@ K
<
ДДK L
object
ДДL R
>
ДДR S
FastMA
ДДT Z
,
ДДZ [
IEnumerable
ДД\ g
<
ДДg h
object
ДДh n
>
ДДn o
SlowMA
ДДp v
,
ДДv w
IEnumerableДДx Г
<ДДГ Д
objectДДД К
>ДДК Л
UpVBДДМ Р
,ДДР С
IEnumerableДДТ Э
<ДДЭ Ю
objectДДЮ д
>ДДд е
MiddleVBДДж о
,ДДо п
IEnumerableДД░ ╗
<ДД╗ ╝
objectДД╝ ┬
>ДД┬ ├
DownVBДД─ ╩
)ДД╩ ╦
{
ЕЕ 	
UpdateIndicator
ЖЖ 
(
ЖЖ 
Klines
ЖЖ "
,
ЖЖ" #
Model
ЖЖ$ )
.
ЖЖ) *
FastMA
ЖЖ* 0
.
ЖЖ0 1
Values
ЖЖ1 7
,
ЖЖ7 8
FastMA
ЖЖ9 ?
)
ЖЖ? @
;
ЖЖ@ A
UpdateIndicator
ЗЗ 
(
ЗЗ 
Klines
ЗЗ "
,
ЗЗ" #
Model
ЗЗ$ )
.
ЗЗ) *
SlowMA
ЗЗ* 0
.
ЗЗ0 1
Values
ЗЗ1 7
,
ЗЗ7 8
SlowMA
ЗЗ9 ?
)
ЗЗ? @
;
ЗЗ@ A
UpdateIndicator
ИИ 
(
ИИ 
Klines
ИИ "
,
ИИ" #
Model
ИИ$ )
.
ИИ) *
UpVB
ИИ* .
.
ИИ. /
Values
ИИ/ 5
,
ИИ5 6
UpVB
ИИ7 ;
)
ИИ; <
;
ИИ< =
UpdateIndicator
ЙЙ 
(
ЙЙ 
Klines
ЙЙ "
,
ЙЙ" #
Model
ЙЙ$ )
.
ЙЙ) *
MiddleVB
ЙЙ* 2
.
ЙЙ2 3
Values
ЙЙ3 9
,
ЙЙ9 :
MiddleVB
ЙЙ; C
)
ЙЙC D
;
ЙЙD E
UpdateIndicator
КК 
(
КК 
Klines
КК "
,
КК" #
Model
КК$ )
.
КК) *
DownVB
КК* 0
.
КК0 1
Values
КК1 7
,
КК7 8
DownVB
КК9 ?
)
КК? @
;
КК@ A
}
ЛЛ 	
private
НН 
void
НН 
UpdateIndicator
НН $
(
НН$ %
IEnumerable
НН% 0
<
НН0 1
Kline
НН1 6
>
НН6 7
Klines
НН8 >
,
НН> ?
IChartValues
НН@ L
values
ННM S
,
ННS T
IEnumerable
ННU `
<
НН` a
object
ННa g
>
ННg h
	newValues
ННi r
)
ННr s
{
ОО 	
if
ПП 
(
ПП 
values
ПП 
.
ПП 
Count
ПП 
==
ПП 
$num
ПП  
)
ПП  !
{
РР 
values
СС 
.
СС 
AddRange
СС 
(
СС  
	newValues
СС  )
.
СС) *
Select
СС* 0
(
СС0 1
x
СС1 2
=>
СС3 5
(
СС6 7
object
СС7 =
)
СС= >
Convert
СС> E
.
ССE F
ToDouble
ССF N
(
ССN O
x
ССO P
)
ССP Q
)
ССQ R
)
ССR S
;
ССS T
return
ТТ 
;
ТТ 
}
УУ 
if
ХХ 
(
ХХ 
Model
ХХ 
.
ХХ 
Labels
ХХ 
.
ХХ 
Last
ХХ !
(
ХХ! "
)
ХХ" #
==
ХХ$ &
Klines
ХХ' -
.
ХХ- .
Last
ХХ. 2
(
ХХ2 3
)
ХХ3 4
.
ХХ4 5
	_OpenDate
ХХ5 >
.
ХХ> ?
ToString
ХХ? G
(
ХХG H
$str
ХХH N
)
ХХN O
)
ХХO P
{
ЦЦ 
values
ЧЧ 
[
ЧЧ 
^
ЧЧ 
$num
ЧЧ 
]
ЧЧ 
=
ЧЧ 
	newValues
ЧЧ &
.
ЧЧ& '
Last
ЧЧ' +
(
ЧЧ+ ,
)
ЧЧ, -
;
ЧЧ- .
return
ШШ 
;
ШШ 
}
ЩЩ 
values
ЫЫ 
.
ЫЫ 
Add
ЫЫ 
(
ЫЫ 
	newValues
ЫЫ  
.
ЫЫ  !
Last
ЫЫ! %
(
ЫЫ% &
)
ЫЫ& '
)
ЫЫ' (
;
ЫЫ( )
}
ЬЬ 	
public
ЮЮ 
void
ЮЮ 
AddUser
ЮЮ 
(
ЮЮ 
)
ЮЮ 
{
ЯЯ 	
try
аа 
{
бб 
if
вв 
(
вв 
!
вв 

Connection
вв 
.
вв  
Context
вв  '
.
вв' (
Users
вв( -
.
вв- .
Any
вв. 1
(
вв1 2
x
вв2 3
=>
вв4 6
x
вв7 8
.
вв8 9
UserName
вв9 A
==
ввB D
Model
ввE J
.
ввJ K
AddUserString
ввK X
)
ввX Y
)
ввY Z
{
гг 

Connection
дд 
.
дд 
Context
дд &
.
дд& '
Add
дд' *
(
дд* +
new
дд+ .
User
дд/ 3
(
дд3 4
)
дд4 5
{
дд6 7
UserName
дд8 @
=
ддA B
Model
ддC H
.
ддH I
AddUserString
ддI V
,
ддV W
TDI
ддX [
=
дд\ ]
true
дд^ b
,
ддb c
TDIExpiryDate
ддd q
=
ддr s
DateTime
ддt |
.
дд| }
Nowдд} А
.ддА Б
AddDaysддБ И
(ддИ Й
ModelддЙ О
.ддО П
AddUserDaysддП Ъ
)ддЪ Ы
}ддЫ Ь
)ддЬ Э
;ддЭ Ю
}
ее 
else
жж 
{
зз 
User
ии 
user
ии 
=
ии 

Connection
ии  *
.
ии* +
Context
ии+ 2
.
ии2 3
Users
ии3 8
.
ии8 9
First
ии9 >
(
ии> ?
x
ии? @
=>
ииA C
x
ииD E
.
ииE F
UserName
ииF N
==
ииO Q
Model
ииR W
.
ииW X
AddUserString
ииX e
)
ииe f
;
ииf g
user
йй 
.
йй 
TDIExpiryDate
йй &
=
йй' (
user
йй) -
.
йй- .
TDIExpiryDate
йй. ;
>=
йй< >
DateTime
йй? G
.
ййG H
Now
ййH K
?
ййL M
user
кк 
.
кк 
TDIExpiryDate
кк *
.
кк* +
AddDays
кк+ 2
(
кк2 3
Model
кк3 8
.
кк8 9
AddUserDays
кк9 D
==
ккE G
$num
ккH I
?
ккJ K
$num
ккL R
:
ккS T
Model
ккU Z
.
ккZ [
AddUserDays
кк[ f
)
ккf g
:
ккh i
DateTime
лл  
.
лл  !
Now
лл! $
.
лл$ %
AddDays
лл% ,
(
лл, -
Model
лл- 2
.
лл2 3
AddUserDays
лл3 >
==
лл? A
$num
ллB C
?
ллD E
$num
ллF L
:
ллM N
Model
ллO T
.
ллT U
AddUserDays
ллU `
)
лл` a
;
ллa b
user
мм 
.
мм 
TDI
мм 
=
мм 
true
мм #
;
мм# $
}
нн 

Connection
оо 
.
оо 
Context
оо "
.
оо" #
SaveChanges
оо# .
(
оо. /
)
оо/ 0
;
оо0 1

MessageBox
░░ 
.
░░ 
Show
░░ 
(
░░  
$str
░░  >
,
░░> ?
$str
░░@ S
,
░░S T
MessageBoxButton
░░U e
.
░░e f
OK
░░f h
)
░░h i
;
░░i j
}
▒▒ 
catch
▓▓ 
(
▓▓ 
	Exception
▓▓ 
ex
▓▓ 
)
▓▓  
{
││ 

MessageBox
┤┤ 
.
┤┤ 
Show
┤┤ 
(
┤┤  
$"
┤┤  "
$str
┤┤" ;
{
┤┤; <
ex
┤┤< >
.
┤┤> ?
Message
┤┤? F
}
┤┤F G
"
┤┤G H
,
┤┤H I
$str
┤┤J P
,
┤┤P Q
MessageBoxButton
┤┤R b
.
┤┤b c
OK
┤┤c e
,
┤┤e f
MessageBoxImage
┤┤g v
.
┤┤v w
Error
┤┤w |
)
┤┤| }
;
┤┤} ~
}
╡╡ 
}
╢╢ 	
public
╕╕ 
void
╕╕ 
DelUser
╕╕ 
(
╕╕ 
)
╕╕ 
{
╣╣ 	
try
║║ 
{
╗╗ 

Connection
╝╝ 
.
╝╝ 
Context
╝╝ "
.
╝╝" #
DelUser
╝╝# *
(
╝╝* +
Model
╝╝+ 0
.
╝╝0 1
SelectedUser
╝╝1 =
)
╝╝= >
;
╝╝> ?

Connection
╜╜ 
.
╜╜ 
Context
╜╜ "
.
╜╜" #
SaveChanges
╜╜# .
(
╜╜. /
)
╜╜/ 0
;
╜╜0 1

MessageBox
┐┐ 
.
┐┐ 
Show
┐┐ 
(
┐┐  
$str
┐┐  >
,
┐┐> ?
$str
┐┐@ S
,
┐┐S T
MessageBoxButton
┐┐U e
.
┐┐e f
OK
┐┐f h
)
┐┐h i
;
┐┐i j
}
└└ 
catch
┴┴ 
(
┴┴ 
	Exception
┴┴ 
ex
┴┴ 
)
┴┴  
{
┬┬ 

MessageBox
├├ 
.
├├ 
Show
├├ 
(
├├  
$"
├├  "
$str
├├" ;
{
├├; <
ex
├├< >
.
├├> ?
Message
├├? F
}
├├F G
"
├├G H
,
├├H I
$str
├├J P
,
├├P Q
MessageBoxButton
├├R b
.
├├b c
OK
├├c e
,
├├e f
MessageBoxImage
├├g v
.
├├v w
Error
├├w |
)
├├| }
;
├├} ~
}
── 
}
┼┼ 	
}
╞╞ 
}╟╟ Г
tC:\Users\├Цmer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\UI\Views\MainWindow.xaml.cs
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
] 
public 
static 
extern 
void !
AllocConsole" .
(. /
)/ 0
;0 1
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
} е
mC:\Users\├Цmer Faruk BORAN\Desktop\Workspace\EASYTelegramSignalBot\EASYTelegramSignalBot\UI\Views\TDI.xaml.cs
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