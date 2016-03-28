// エフェクトアタッチ箇所定義=====
const ATTACH_GLOBAL				= 0;
const ATTACH_EFFECT1			= 1;
const ATTACH_EFFECT2			= 2;
const ATTACH_UPPERBODY			= 3;
const ATTACH_EFFECT3			= 4;

// モンスターサイズ定義===========
const SIZE_S					= 0;
const SIZE_N					= 1;
const SIZE_M					= 2;
const SIZE_G					= 3;
const SIZE_T					= 4;

// メッセージウィンドウ関連===
// FieldMessageWindowUより
//@TODO QUERY2 に置き換え
const MES_QUERY_NONE = 0;	// 未選択
const MES_QUERY_YES  = 1;	// Yes
const MES_QUERY_NO   = 2;	// No

// 2行選択肢定義=====
const QUERY2_NONE					= 0;
const QUERY2_0						= 1;
const QUERY2_1						= 2;

// 3行選択肢======
const QUERY3_NONE					= 0;
const QUERY3_0						= 1;
const QUERY3_1						= 2;
const QUERY3_2						= 3;

// 汎用選択肢======
const QUERY_NONE					= 0;
const QUERY_0						= 1;
const QUERY_1						= 2;
const QUERY_2						= 3;
const QUERY_3						= 4;
const QUERY_4						= 5;


// バトル終了タイプ関連===
// dqmbResultより
const BATTLE_END_TYPE_NONE = 0;	// 戦わず
const BATTLE_END_TYPE_WIN  = 1;	// 勝利
const BATTLE_END_TYPE_LOSE = 2;	// 負け
const BATTLE_END_TYPE_DRAW = 3;	// 引き分け
const BATTLE_END_TYPE_FLEE = 4;	// 逃亡

// フェード設定===================
const FADE_IN  = 0;				// フェードイン
const FADE_OUT = 1;				// フェードアウト

// フェードカラー設定=============
const FADE_COLOR_BLACK  = 0;	// 黒
const FADE_COLOR_WHITE  = 1;	// 白
const FADE_COLOR_SHADOW = 2;	// シャドー

// リアクターポイントサーチ距離無限
const ENDLESS_DIST = -1.0;

// リアクターポイントのサーチ距離
const LONG_DIST  = 10000;
const SHORT_DIST =   500;
const RING_DIST  =   395;

// フェード面
enum FADE_PLANE
{
 	PLANE_NORMAL,		// 通常
 	PLANE_3D,			// 3D面のみ（メッセージウィンドウより下のみ）
}

// モンスターの居る場所
enum MONSTER_PLACE
{
	PLACE_PARTY,		// パーティ
	PLACE_STANDBY,		// スタンバイ
}



// 3次元ベクトル
class Vec3
{
	x = 0;
	y = 0;
	z = 0;

	constructor(...)
	{
		if (vargc == 1) {
			x = vargv[0].x;
			y = vargv[0].y;
			z = vargv[0].z;
		}
		else if (vargc >= 3) {
			x = vargv[0];
			y = vargv[1];
			z = vargv[2];
		}
	}

	function _add(other) {
		return Vec3(x + other.x, y + other.y, z + other.z);
	}

	function _sub(other) {
		return Vec3(x - other.x, y - other.y, z - other.z);
	}

	function _mul(mul)
	{
		return Vec3(x * mul, y * mul, z * mul);
	}

	function _div(div)
	{
		return Vec3(x / div, y / div, z / div);
	}

	function Length()
	{
		return sqrt(x * x + y * y + z * z);
	}

	function Normalize()
	{
		local len = Length();
		x /= len;
		y /= len;
		z /= len;
		return this;
	}
}

// タスク
class Task
{
	function Update(){}
	function IsEnd(){ return true; }
};

gTasks <- [];

function AddTask(proc)
{
	gTasks.append(proc);
	return gTasks.len() - 1;
}

function UpdateTask()
{
	for(local i = 0; i < gTasks.len(); i++){
		if(gTasks[i] != null){
			gTasks[i].Update();
			if(gTasks[i].IsEnd()){
				gTasks[i] = null;
			}
		}
	}
}

function DeleteAllTask()
{
	for(local i = 0; i < gTasks.len(); i++){
		gTasks[i] = null;
	}
}

function DeleteTask(task)
{
	if(task < 0 || gTasks.len() <= task){
		return;
	}

	gTasks[task] = null;
}


//デバッグ用テキスト表示
function DebugPrint(Text)
{
	if (IsScriptLog_()){
		print(Text + "\n")
	} else {}
}