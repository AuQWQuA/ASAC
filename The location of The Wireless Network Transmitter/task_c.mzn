%NOIP2014-S D2T1
%input

int: d;
int: n;
array[1..n,1..2] of int: public_loc;
array[1..n] of int: public_num;

%description

int: max_plans=100;

predicate cover_spot(array[1..2] of var int: loc,array[1..2] of var int: center) =
max(i in 1..2)(abs(loc[i]-center[i])) <=d;
%该无线网络发射器的传播范围是一个以该点为中心，边长为 2*d 的正方形。传播范围包括正方形边界。

array[1..max_plans,1..2] of var 0..128: ans;
%假设该城市的布局为由严格平行的129条东西向街道和129条南北向街道所形成的网格状，并且相邻的平行街道之间的距离都是恒定值 1。东西向街道从北到南依次编号为0,1,2…128,南北向街道从西到东依次编号为 0,1,2…128。
var 1..max_plans: plans;
constraint forall(i,j in 1..plans where i!=j)(not(ans[i,1]==ans[j,1] /\ ans[i,2]==ans[j,2]));
var int: num;
constraint num>0;
constraint forall(t in 1..plans)(num=sum(i in 1..n where cover_spot(public_loc[i,1..2],ans[t,1..2]))(public_num[i]));

var int: score;
constraint score=max_plans*num+plans;

%solve

solve maximize score;
%希望你帮助他们在城市内找出合适的安装地点，使得覆盖的公共场所最多。

%output

output["\(plans) \(num)"];
