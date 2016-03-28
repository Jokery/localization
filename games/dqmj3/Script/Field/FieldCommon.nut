//----------------------------------------
// イベント・デモ共通定義ファイル
//----------------------------------------
// ▼常駐モーション名
// プレイヤー、NPC共通
const MOT_WAIT                = "WAIT";					// プレイヤー、NPC
const MOT_RUN                 = "RUN";					// プレイヤー、NPC
const MOT_JUMP_UP             = "JUMP_UP";				// プレイヤー、NPC
const MOT_JUMP_DOWN           = "JUMP_DOWN";			// プレイヤー、NPC
const MOT_SPECIAL_WAIT        = "SPECIAL_WAIT";			// プレイヤー、NPC
const MOT_SPECIAL_RUN         = "SPECIAL_RUN";			// プレイヤー、NPC
const MOT_WALK                = "WALK";					// プレイヤー、NPC
const MOT_ADD_00              = "ADD_00";				// プレイヤー、NPC
const MOT_ADD_01              = "ADD_01";				// プレイヤー、NPC
const MOT_ADD_02              = "ADD_02";				// プレイヤー、NPC
const MOT_ADD_03              = "ADD_03";				// プレイヤー、NPC
const MOT_ADD_04              = "ADD_04";				// プレイヤー、NPC
const MOT_ADD_05              = "ADD_05";				// プレイヤー、NPC
const MOT_ADD_06              = "ADD_06";				// プレイヤー、NPC
const MOT_ADD_07              = "ADD_07";				// プレイヤー、NPC
const MOT_ADD_08              = "ADD_08";				// プレイヤー、NPC
const MOT_ADD_09              = "ADD_09";				// プレイヤー、NPC
const MOT_ADD_10              = "ADD_10";				// プレイヤー、NPC
const MOT_ADD_11              = "ADD_11";				// プレイヤー、NPC
const MOT_ADD_12              = "ADD_12";				// プレイヤー、NPC
const MOT_ADD_13              = "ADD_13";				// プレイヤー、NPC
const MOT_ADD_14              = "ADD_14";				// プレイヤー、NPC
const MOT_ADD_15              = "ADD_15";				// プレイヤー、NPC
const MOT_ADD_16              = "ADD_16";				// プレイヤー、NPC
const MOT_ADD_17              = "ADD_17";				// プレイヤー、NPC
const MOT_ADD_18              = "ADD_18";				// プレイヤー、NPC
const MOT_ADD_19              = "ADD_19";				// プレイヤー、NPC
const MOT_ADD_20              = "ADD_20";				// プレイヤー、NPC
const MOT_ADD_21              = "ADD_21";				// プレイヤー、NPC
const MOT_ADD_22              = "ADD_22";				// プレイヤー、NPC
const MOT_ADD_23              = "ADD_23";				// プレイヤー、NPC
const MOT_ADD_24              = "ADD_24";				// プレイヤー、NPC
const MOT_ADD_25              = "ADD_25";				// プレイヤー、NPC
const MOT_ADD_26              = "ADD_26";				// プレイヤー、NPC
const MOT_ADD_27              = "ADD_27";				// プレイヤー、NPC
const MOT_ADD_28              = "ADD_28";				// プレイヤー、NPC
const MOT_ADD_29              = "ADD_29";				// プレイヤー、NPC
const MOT_RIDE_WAIT           = "RIDE_WAIT";			// プレイヤー、NPC
const MOT_RIDE_RUN            = "RIDE_RUN";				// プレイヤー、NPC
const MOT_RIDE_JUMP_UP        = "RIDE_JUMP_UP";			// プレイヤー、NPC
const MOT_RIDE_JUMP_DOWN      = "RIDE_JUMP_DOWN";		// プレイヤー、NPC
const MOT_RIDE_SPECIAL_WAIT   = "RIDE_SPECIAL_WAIT";	// プレイヤー、NPC
const MOT_RIDE_SPECIAL_RUN    = "RIDE_SPECIAL_RUN";		// プレイヤー、NPC

// プレイヤーのみ
const MOT_CHANGE_RIDE         = "CHANGE_RIDE";			// プレイヤー
const MOT_ITEMGET_START       = "ITEMGET_START";		// プレイヤー
const MOT_ITEMGET_LOOP        = "ITEMGET_LOOP";			// プレイヤー
const MOT_ITEMGET_END         = "ITEMGET_END";			// プレイヤー
const MOT_DOOR_RIGHT          = "DOOR_RIGHT";			// プレイヤー
const MOT_RULER               = "RULER";				// プレイヤー
const MOT_LADDER_UP_START     = "LADDER_UP_START";		// プレイヤー
const MOT_LADDER_UP_LOOP      = "LADDER_UP_LOOP";		// プレイヤー
const MOT_LADDER_UP_END       = "LADDER_UP_END";		// プレイヤー
const MOT_LADDER_DOWN_START   = "LADDER_DOWN_START";	// プレイヤー
const MOT_LADDER_DOWN_LOOP    = "LADDER_DOWN_LOOP";		// プレイヤー
const MOT_LADDER_DOWN_END     = "LADDER_DOWN_END";		// プレイヤー

// NPCのみ
const MOT_TALK                = "TALK";					// NPC
const MOT_TALKLOOP            = "TALKLOOP";				// NPC
const MOT_DAMAGE              = "DAMAGE";				// NPC
const MOT_ATTACK              = "ATTACK";				// NPC
const MOT_SPELL_START         = "SPELL_START";			// NPC
const MOT_SPELL_CHARGE        = "SPELL_CHARGE";			// NPC
const MOT_SPELL_ACTUATE       = "SPELL_ACTUATE";		// NPC
const MOT_SWORD_START         = "SWORD_START";			// NPC
const MOT_SWORD_CHARGE        = "SWORD_CHARGE";			// NPC
const MOT_SWORD_ACTUATE       = "SWORD_ACTUATE";		// NPC
const MOT_LIFE_SPECIAL_1      = "LIFE_SPECIAL_1";		// NPC
const MOT_LIFE_SPECIAL_2      = "LIFE_SPECIAL_2";		// NPC

// ギミック
const MOT_GIMMICK_0           = "GIMMICK_0";
const MOT_GIMMICK_1           = "GIMMICK_1";
const MOT_GIMMICK_2           = "GIMMICK_2";
const MOT_GIMMICK_3           = "GIMMICK_3";
const MOT_GIMMICK_4           = "GIMMICK_4";
const MOT_GIMMICK_5           = "GIMMICK_5";
const MOT_GIMMICK_6           = "GIMMICK_6";
const MOT_GIMMICK_7           = "GIMMICK_7";
const MOT_GIMMICK_8           = "GIMMICK_8";
const MOT_GIMMICK_9           = "GIMMICK_9";

// ▼モーションブレンドフレーム数
const BLEND_N				= 0;
const BLEND_S				= 1;
const BLEND_M				= 4;
const BLEND_L				= 8;
const BLEND_XL				= 16;

// ▼フェードスピード
const FADE_SHORT			= 1;
const FADE_MENU				= 5;
const FADE_DEF				= 30;
const FADE_MAPCHANGE		= 20;		// プログラム上のマップチェンジ時フェードスピード

// ▼α値
const ALPHA_CLEAR			= 0.0;
const ALPHA_HALF			= 0.5;
const ALPHA_EXIST			= 1.0;

// ▼カメラからの距離
const CAMERA_DEF			= 100;

// ▼BGM停止までのフレーム数
const BGM_STOP_DEF			= 30;

// ▼足音無のSE名
const SILENT_STEP_SE		= "SILENT_STEP_SE";

// ▼エンカウントエフェクトタイプ
const ENCOUNT_NORMAL		= 1;
const ENCOUNT_BOSS			= 2;

// ▼最初に仲間にするモンスターの定数
const PURIZUNYAN			= 0;
const FONDHU				= 1;
const DORAKI				= 2;
const NASUBINARA			= 3;

// ▼アナライズ情報の種類
const ANALYZE_INFO_MSG		= 0;
const ANALYZE_INFO_EVENT	= 1;

// ▼1フレームの回転角度
const ROTATE_EVENT_DEF		= 11.4;
const ROTATE_DEMO_DEF		= 5.7;

// ▼スケールの値
enum SCALE{
	S				= 0.4,
	N				= 0.6,
	M				= 1.0,
	G				= 2.5,
	T				= 6.0,
	REACTOR			= 3.0,
	SANCHO			= 0.55,
	PURIZUNYAN		= 0.3,
	FONDHU			= 0.3,
	DORAKI			= 0.3,
	NASUBINARA		= 0.27,
	TODO			= 0.8,
	NEO_BOSS		= 40.0,
	SANCHO_CRASH	= 0.7,
	SNOW_DRAGON		= 1.8,
	REACTOR_CASE	= 1.3,
	SANCHO_EVENT	= 0.7,
	WI_FI_BATTLE	= 1.2,
	POISONTRILL		= 0.3,
	WIFIRANKING		= 0.7,
	WIFIBATTLE		= 0.75,
	WIFIPRESENT		= 0.4,
	WIFISHOP		= 0.6,
	WIFIPROFILE		= 0.8,
	SABOTENBOUL		= 0.8,
	DEZATOTANKU		= 0.5,
	AZAMUKU			= 1.08,
	NEO_AZAMUKU		= 7.2,
	BOSS_SKY		= 20.0,	// いつの間に高空徘徊
	OP_MONS_NPC		= 0.8,	// OPのモンスターNPCのサイズ(テスト用)
};

// ▼シルエット幅(スケールの値が1.0以上の場合,シルエット幅は1.0に設定)
enum SILHOUETTE_WIDTH{
	S				= 0.6,
	N				= 0.8,
	M				= 1.0,
	G				= 1.0,
	T				= 1.0,
	REACTOR			= 1.0,
	SANCHO			= 0.55,
	PURIZUNYAN		= 0.2,
	FONDHU			= 0.3,
	DORAKI			= 0.3,
	NASUBINARA		= 0.27,
	TODO			= 1.0,
	NEO_BOSS		= 1.0,
	SANCHO_CRASH	= 0.9,
	SNOW_DRAGON		= 1.0,
	REACTOR_CASE	= 1.0,
	SANCHO_EVENT	= 0.9,
	POISONTRILL		= 0.5,
	SABOTENBOUL		= 0.8,
	DEZATOTANKU		= 0.5,
	YETAS			= 0.3,
	AZAMUKU			= 1.0,
	OP_MONS_NPC		= 0.8,	// OPのモンスターNPCのサイズ(テスト用)
};

// ▼天候
enum WEATHER{
	NORMAL,
	BAD,
};

// ▼NPC会話可能角度
const SEARCHABLE_ANGLE_BOOKSHOP = 20.0;
const SEARCHABLE_ANGLE_MINIMUM  = 30.0;
const SEARCHABLE_ANGLE_NARROW   = 45.0;
const SEARCHABLE_ANGLE_NORMAL   = 60.0;
const SEARCHABLE_ANGLE_WIDE     = 90.0;

// ▼プレイヤーのどのモデルに対しての設定か
enum PLAYER_MODEL{
	NORMAL,         // 人型のプレイヤーモデル
	RIDEMONSTER,    // プレイヤーがライドしているモンスター
}

// ▼崩落都市(夜)の暗いマップの色調補正値
const CITY_COLOR_TONE_DARK_R = -0.5;
const CITY_COLOR_TONE_DARK_G = -0.5;
const CITY_COLOR_TONE_DARK_B = -0.5;
// ▼崩落都市(夜)の明るいマップの色調補正値
const CITY_COLOR_TONE_BRIGHT_R = 0.3;
const CITY_COLOR_TONE_BRIGHT_G = 0.3;
const CITY_COLOR_TONE_BRIGHT_B = 0.7;

// ▼時間帯の開始フレーム
const START_TIME_ZONE_NOON		= 0;		// 昼の開始フレーム
const START_TIME_ZONE_EVENING	= 5400;		// 夕方の開始フレーム
const START_TIME_ZONE_NIGHT		= 8700;		// 夜の開始フレーム

// ▼移動時のスピード
const FORWARD_MOVE_SPEED		= 1.0;      // 直線移動

// ▼SEのフェード
const SE_OUT	 = 7;
const SE_IN		 = 8;


//	リアクターアナライズ時の情報
class AnalyzeInfo
{
	typeId = -1;
	flagId = -1;
	searchDist = ENDLESS_DIST;
	nameKey = "";
	messageKey = "";

	constructor(type, flag, dist, name, mes)
	{
		typeId = type;
		flagId = flag;
		searchDist = dist;
		nameKey = name;
		messageKey = mes;
	}
};

//========================================================================================

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//		モーション待ち
//
//----------------------------------------------------------------------------
//	引数	: chr	キャラクターID
//
//	戻り値	: cnt	待ちフレーム数
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function WaitMotion(chr)
{
	local cnt = 0;
	
	while(!IsMotionEnd_(chr))
	{
		Wait_(1);
		cnt++;
	}
	
	DebugPrint("■" + cnt + "フレーム待ちました■");
	return cnt;
}


//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//		タスク待ち
//
//----------------------------------------------------------------------------
//	引数	: idx	タスクインデックス
//
//	戻り値	: cnt	待ちフレーム数
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function WaitTask(idx)
{
	local cnt = 0;
	
	while(!IsTaskEnd_(idx))
	{
		Wait_(1);
		cnt++;
	}
	
	DebugPrint("■" + cnt + "フレーム待ちました■");
	return cnt;
}


//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//		コネクティブモードON
//
//----------------------------------------------------------------------------
//	引数	: layout	レイアウト名
//
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function OpenConnective(layout)
{
	PlaySE_("SE_DEM_020");		//SE:リアクターON
	LoadLayout_(layout);
	SetLayoutAnime_("on", false);
	Task_ChangeLayoutAnime_("loop", true);
}


//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//		コネクティブモードOFF
//
//----------------------------------------------------------------------------
//	引数	: なし
//
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function CloseConnective()
{
	PlaySE_("SE_FLD_232");		//SE:リアクターOFF
	SetLayoutAnime_("off", false);
	WaitLayoutAnime();
}


//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//		「！」エフェクト表示
//
//----------------------------------------------------------------------------
//	引数	: chr	キャラクターID
//			: size	エフェクトの大きさ ※デフォルト値 = 1.0
//
//	戻り値	: id	エフェクトID
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function SurpriseDisp(chr, size = 1.0)
{
	local id;
	
	id = SetSelectBoneEffect_("ef712_10_emo_surprise01", chr, ATTACH_EFFECT1);		// 「！」
	PlaySE_("SE_DEM_053");		// 「ピンッ！」
	SetEffectScale_(id, size);
	
	return id;
}


//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//		「！」エフェクト表示（オフセット指定Ver）
//
//----------------------------------------------------------------------------
//	引数	: chr	キャラクターID
//			: pos	座標
//			: size	エフェクトの大きさ ※デフォルト値 = 1.0
//
//	戻り値	: id	エフェクトID
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function SurpriseDispSetOffset(chr, pos, size = 1.0)
{
	local id;
	
	id = SetSelectBoneEffectSetOffset_("ef712_10_emo_surprise01", chr, ATTACH_EFFECT1, pos);	// 「！」
	PlaySE_("SE_DEM_053");		// 「ピンッ！」
	SetEffectScale_(id, size);
	
	return id;
}


//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//		ＮＰＣゆっくり回転＋歩き（座標指定）
//
//----------------------------------------------------------------------------
//	引数	: chr	キャラクターID
//			: pos	座標
//			: rot	1フレームに回転する角度
//
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function Task_WalkAroundToPos(chr, pos, rot)
{
	local task;
	
	SetMotion_(chr, MOT_WALK, BLEND_M);
	task = Task_RotateToPos_(chr, pos, rot);
	
	return task;
}


//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//		ＮＰＣゆっくり回転＋歩き（角度指定）
//
//----------------------------------------------------------------------------
//	引数	: chr	キャラクターID
//			: dir	角度
//			: rot	1フレームに回転する角度
//
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function Task_WalkAroundToDir(chr, dir, rot)
{
	local task;
	
	SetMotion_(chr, MOT_WALK, BLEND_M);
	task = Task_RotateToDir_(chr, dir, rot);
	
	return task;
}


//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//		レイアウト終了待ち
//
//----------------------------------------------------------------------------
//	引数	: なし
//
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function WaitLayoutAnime()
{
	while(!IsLayoutAnimeEnd_()){
		Wait_(1);
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//		メッセージ表示のリアクターポイント配置
//
//----------------------------------------------------------------------------
//	引数	: nodeName		配置位置ノード名
//			: flagId		対応するイベントフラグ番号
//			: searchDist	リアクターに反応する距離
//			: nameKey		名称キー
//			: msgKey		アナライズ時のメッセージキー
//
//	戻り値	: id			配置されたオブジェクトID
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function ArrangeMsgReactorPoint(nodeName, flagId, searchDist, nameKey, msgKey)
{
	local id = ArrangePointReactorPoint_(nodeName, searchDist);
	SetAnalyzeInfo_(id, AnalyzeInfo(ANALYZE_INFO_MSG, flagId, searchDist, nameKey, msgKey));
	return id;
}


//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//		スクリプトイベントを呼ぶリアクターポイント配置
//
//----------------------------------------------------------------------------
//	引数	: nodeName		配置位置ノード名
//			: flagId		対応するイベントフラグ番号
//			: searchDist	リアクターに反応する距離
//			: nameKey		名称キー
//
//	戻り値	: id			配置されたオブジェクトID
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function ArrangeEventReactorPoint(nodeName, flagId, searchDist, nameKey)
{
	local id = ArrangePointReactorPoint_(nodeName, searchDist);
	SetAnalyzeInfo_(id, AnalyzeInfo(ANALYZE_INFO_EVENT, flagId, searchDist, nameKey, ""));
	return id;
}

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//		スケールと輪郭線の幅設定
//
//----------------------------------------------------------------------------
//	引数	: chr	キャラクターID
//			: scale	キャラクターのスケール
//			: silhouetteWidth	輪郭線の幅
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function SetScaleSilhouette(chr, scale, silhouetteWidth)
{
	SetScale_(chr, scale);
	InitSilhouetteWidth_(chr, silhouetteWidth);
}


//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//		ＮＰＣ表示状態切り替え
//
//----------------------------------------------------------------------------
//	引数	: chr	キャラクターID
//			: flg	true  = 表示
//					false = 非表示
//
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function SetVisible(chr, flg)
{
	SetActive_(chr, flg);
	SetHideIfFar_(chr, false);
}


