// グローバル変数(NPCやイベント地雷)などを初期化する際に使う定数
const C_NONE_ID					=-1;

// 選択肢定義=====
const QUERY_YES					= 1;		// 「はい」
const QUERY_NO					= 2;		// 「いいえ」

// 戦闘結果=======
const END_TYPE_NONE				= 0;
const END_TYPE_WIN				= 1;
const END_TYPE_LOSE				= 2;
const END_TYPE_DRAW				= 3;
const END_TYPE_FLEE				= 4;
const END_TYPE_SCOUT			= 5;

// 会話時のカメラの設定を行う際の定数
const TALK_CAMERA_DEF			= 0;		// 何もしない
const TALK_CAMERA_UP			= 1;		// 会話時にNPCをアップにする設定

// 特技定数
const ABILITY_RULER				= 0;
const ABILITY_FULLTANK			= 1;
const ABILITY_RANARUTA			= 2;
const ABILITY_RANARION			= 3;
const ABILITY_MAKE_UP			= 4;

// イベントで取得できる固定ディスクのコードの定数(14_00_ディスクパラメータ.xlsmの「コード」を参照)
const FIX_DISC_CODE_1			= 199;		// 最初の（仲間入手） 
const FIX_DISC_CODE_2			= 161;		// 怠惰な（崩落都市クリア） 
const FIX_DISC_CODE_3			= 174;		// 記憶  （初期状態）

// イベントで取得できる固定ディスクのレベルの定数(03_00_ディスク.xlsxの「概要」を参照)
const DISC_LEVEL_20				= 20;		// 歓楽の霊道クリア後

// 陸海空の神のアクセサリＩＤ
const YATIHOKO_ACCE_ID			= 216;		// ヤチホコ(陸の神のアクセサリ)
const WADATUMI_ACCE_ID			= 218;		// ワダツミ(海の神のアクセサリ)
const HOAKARI_ACCE_ID			= 217;		// ホアカリ(空の神のアクセサリ)

// 陸海空のスターピースのアイテムＩＤ
const LAND_STAR_PIECE_ID		= 75;		// 陸のスターピース
const SEA_STAR_PIECE_ID			= 78;		// 海のスターピース
const SKY_STAR_PIECE_ID			= 81;		// 空のスターピース

// センタービルの東エレベータ復帰座標(３０階)
const A03_01_RTN_POS_E_X		= 325.00;	// X
const A03_01_RTN_POS_E_Y		=   0.37;	// Y
const A03_01_RTN_POS_E_Z		=  -5.74;	// Z
// センタービルの東エレベータ復帰座標(２９階)
const A03_00_RTN_POS_E_X		= 325.00;	// X
const A03_00_RTN_POS_E_Y		=   1.00;	// Y
const A03_00_RTN_POS_E_Z		=  -0.40;	// Z
// センタービルの東エレベータ復帰座標(１階)
const A01_00_RTN_POS_E_X		= 150.00;	// X
const A01_00_RTN_POS_E_Y		=   0.00;	// Y
const A01_00_RTN_POS_E_Z		=   1.60;	// Z
// センタービルの東エレベータ復帰座標(地下１階)
const A01_01_RTN_POS_E_X		= 123.00;	// X
const A01_01_RTN_POS_E_Y		=   0.00;	// Y
const A01_01_RTN_POS_E_Z		=   0.00;	// Z

// センタービルの東エレベータ復帰方向
const RTN_DIR_E					= -90;

// センタービルの西エレベータ復帰座標(２９階)
const A03_00_RTN_POS_W_X		= -325.00;	// X
const A03_00_RTN_POS_W_Y		=    0.40;	// Y
const A03_00_RTN_POS_W_Z		=   -0.93;	// Z
// センタービルの西エレベータ復帰座標(１階)
const A01_00_RTN_POS_W_X		= -150.00;	// X
const A01_00_RTN_POS_W_Y		=    0.00;	// Y
const A01_00_RTN_POS_W_Z		=    1.60;	// Z

// センタービルの西エレベータ復帰方向
const RTN_DIR_W					= 90;

// センタービルの北エレベータ復帰座標(地下１階)
const A01_01_RTN_POS_N_X		=  -12.60;	// X
const A01_01_RTN_POS_N_Y		=    0.00;	// Y
const A01_01_RTN_POS_N_Z		= -140.00;	// Z

// センタービルの北エレベータ復帰座標(地下２階)
const A01_02_RTN_POS_N_X		=    0.82;	// X
const A01_02_RTN_POS_N_Y		=  -15.00;	// Y
const A01_02_RTN_POS_N_Z		=-1110.00;	// Z

// センタービルの北エレベータ復帰方向
const RTN_DIR_N					= 0;

// センタービルの道具屋の３段階目を解放するためのアイテムID
const ITEM_SHOP_EXTEND_ITEM_ID	= 912;		// どうぐの達人

// センタービルの肉屋の３段階目を解放するためのアイテムID
const MEAT_SHOP_EXTEND_ITEM_ID	= 911;		// せい肉の極意

// 本屋ラインナップ解禁アイテムのID
const BOOK_ITEM_ID_01			= 74;		// 戦士の記録・前編
const BOOK_ITEM_ID_02			= 76;		// 戦士の記録・後編
const BOOK_ITEM_ID_03			= 77;		// 僧侶の記録・前編
const BOOK_ITEM_ID_04			= 79;		// 僧侶の記録・後編
const BOOK_ITEM_ID_05			= 80;		// 魔法使いの記録・前編
const BOOK_ITEM_ID_06			= 82;		// 魔法使いの記録・後編
const BOOK_ITEM_ID_07			= 83;		// 武闘家の記録・前編
const BOOK_ITEM_ID_08			= 85;		// 武闘家の記録・後編
const BOOK_ITEM_ID_09			= 86;		// 盗賊の記録・前編
const BOOK_ITEM_ID_10			= 88;		// 盗賊の記録・後編
const BOOK_ITEM_ID_11			= 89;		// 旅芸人の記録・前編
const BOOK_ITEM_ID_12			= 91;		// 旅芸人の記録・後編

// 本屋で渡したアイテムＩＤでラインナップに並ぶ証(その１)
const BOOK_LIST_01_ITEM_ID_01	= 592;		// 戦士の証
const BOOK_LIST_01_ITEM_ID_02	= 846;		// 戦士の力の証
const BOOK_LIST_01_ITEM_ID_03	= 594;		// 僧侶の証
const BOOK_LIST_01_ITEM_ID_04	= 852;		// 僧侶の力の証
const BOOK_LIST_01_ITEM_ID_05	= 593;		// 魔法使いの証
const BOOK_LIST_01_ITEM_ID_06	= 849;		// 魔法使いの力の証
const BOOK_LIST_01_ITEM_ID_07	= 595;		// 武闘家の証
const BOOK_LIST_01_ITEM_ID_08	= 855;		// 武闘家の力の証
const BOOK_LIST_01_ITEM_ID_09	= 596;		// 盗賊の証
const BOOK_LIST_01_ITEM_ID_10	= 858;		// 盗賊の力の証
const BOOK_LIST_01_ITEM_ID_11	= 597;		// 旅芸人の証
const BOOK_LIST_01_ITEM_ID_12	= 861;		// 旅芸人の力の証

// 本屋で渡したアイテムＩＤでラインナップに並ぶ証(その２)
const BOOK_LIST_02_ITEM_ID_01	= 845;		// 戦士見習いの証
const BOOK_LIST_02_ITEM_ID_02	= 847;		// 戦士の技の証
const BOOK_LIST_02_ITEM_ID_03	= 851;		// 僧侶見習いの証
const BOOK_LIST_02_ITEM_ID_04	= 853;		// 僧侶の技の証
const BOOK_LIST_02_ITEM_ID_05	= 848;		// 魔法使い見習いの証
const BOOK_LIST_02_ITEM_ID_06	= 850;		// 魔法使いの技の証
const BOOK_LIST_02_ITEM_ID_07	= 854;		// 武闘家見習いの証
const BOOK_LIST_02_ITEM_ID_08	= 856;		// 武闘家の技の証
const BOOK_LIST_02_ITEM_ID_09	= 857;		// 盗賊見習いの証
const BOOK_LIST_02_ITEM_ID_10	= 859;		// 盗賊の技の証
const BOOK_LIST_02_ITEM_ID_11	= 860;		// 旅芸人見習いの証
const BOOK_LIST_02_ITEM_ID_12	= 862;		// 旅芸人の技の証

// 凶モンスター作成に必要なアイテムID
const BREAK_BODY_ITEM_ID_01		= 921;		// 凶スライムのからだ
const BREAK_MIND_ITEM_ID_01		=  65;		// ダークマデュライト
const BREAK_BODY_ITEM_ID_02		= 922;		// 凶キメラのからだ
const BREAK_MIND_ITEM_ID_02		=  65;		// ダークマデュライト
const BREAK_BODY_ITEM_ID_03		= 923;		// 凶大王イカのからだ
const BREAK_MIND_ITEM_ID_03		=  65;		// ダークマデュライト
const BREAK_BODY_ITEM_ID_04		= 924;		// 凶キングリザードのからだ
const BREAK_MIND_ITEM_ID_04		=  65;		// ダークマデュライト
const BREAK_BODY_ITEM_ID_05		= 925;		// 凶にじくじゃくのからだ
const BREAK_MIND_ITEM_ID_05		=  65;		// ダークマデュライト

// 凶モンスターの種族ID
const BREAK_MONSTER_01_ID		= 492;		// 凶スライム
const BREAK_MONSTER_02_ID		= 495;		// 凶キメラ
const BREAK_MONSTER_03_ID		= 509;		// 凶大王イカ
const BREAK_MONSTER_04_ID		= 503;		// 凶キングリザード
const BREAK_MONSTER_05_ID		= 505;		// 凶にじくじゃく

// アイテム交換で仲間にする時の凶モンスターの敵ID
const BREAK_MONSTER_01_E_ID		= 1813;		// 凶スライム
const BREAK_MONSTER_02_E_ID		= 1814;		// 凶キメラ
const BREAK_MONSTER_03_E_ID		= 1815;		// 凶大王イカ
const BREAK_MONSTER_04_E_ID		= 1816;		// 凶キングリザード
const BREAK_MONSTER_05_E_ID		= 1817;		// 凶にじくじゃく
const BREAK_MONSTER_06_E_ID		= 1818;		// 凶エスターク

// 凶エスタークのアイテムID
const BREAK_ESTARK_01_ID		= 92;		// 帝王のからだ
const BREAK_ESTARK_02_ID		= 93;		// 帝王の喜び
const BREAK_ESTARK_03_ID		= 94;		// 帝王の怒り
const BREAK_ESTARK_04_ID		= 95;		// 帝王の哀しみ
const BREAK_ESTARK_05_ID		= 96;		// 帝王の楽しみ

// ライド時の会話カメラ設定用のNPC_ID
const OFFSET_RENATE				= 1;
const OFFSET_RUKIYA				= 2;

// メニュー=======
enum MENU_SCENE
{
 	COUPLING,			// 配合
 	VIRTUALCOLOSSEUM,	// バーチャルコロシアム
 	RACE_FACILITY,		// レース受付
 	WIFI_BATTLE,		// Wi-Fiバトル
 	FREE_BATTLE,		// トレーニングバトル
 	PROFILE_SETTING,	// プロフィール設定
}

enum MENU_OPEN
{
 	DISC_FACILITY,		// ディスク施設
 	ACCESSORY,			// アクセサリ屋
 	GOLD_BANK,			// 銀行
 	WIFI_RANKING,		// Wi-Fiランキング
 	WIFI_SHOP,			// Wi-Fiショップ
 	WIFI_DATA_DL,		// Wi-Fiデータ受け取り
 	A01_00_ITEM,		// ノチョーラキングダム 道具屋
 	A01_00_MEET,		// ノチョーラキングダム 肉屋
 	A01_00_BOOK,		// ノチョーラキングダム 本屋
 	A01_00_TEMP_0,		// ノチョーラキングダム 空き枠
 	A01_00_TEMP_1,		// ノチョーラキングダム 空き枠
 	H01_00_ITEM,		// ウッドパーク 道具屋
 	H01_00_TEMP_0,		// ウッドパーク 空き枠
 	G01_00_ITEM,		// ネオンパーク 道具屋
 	G01_00_TEMP_0,		// ネオンパーク 空き枠
 	I01_00_ITEM,		// ポーラパーク 道具屋
 	I01_00_TEMP_0,		// ポーラパーク 空き枠
 	S01_00_ITEM,		// アロイパーク 道具屋
 	S01_00_TEMP_0,		// アロイパーク 空き枠
 	V01_00_ITEM,		// マグマパーク 道具屋
 	V01_00_TEMP_0,		// マグマパーク 空き枠
 	DUNGEON_ITEM,		// ダンジョン 道具屋
 	WIFI_ITEM,			// Wi-Fi 道具屋
 	MASTER_MEET,		// マスター 肉屋
 	LUGGAGE_OFFICE,		// 預り所
}

// フィールドメニュー=======
// squierrelの仕様で、最初に1を設定しても次の項目が自動で0になるので
// 値を全て入れる
// FieldMenuDef の eCOMMANDUID に対応
enum FIELD_COMMAND
{
	TOOL = 1,				// 道具
	SAVE = 2,				// セーブ
	TACTICS = 3,			// 作戦
	LUGGAGEOFFICE = 4,		// 預り所
	MONSTERABILITY = 5,		// モンスター特技
	LIBRARY = 6,			// ライブラリ
	PLAYERABILITY = 7,		// プレイヤー特技
	EQUIPACCESSORY = 8,		// アクセサリー装備
	SKILLPOINT = 9,			// スキルポイント
	FIELDRIDE = 10,			// ライドモンスター
	COMMUNICATION = 11,		// 通信
	INFORMATION = 12,		// たびのこころえ
}

// プレイヤー特技メニュー=======
// FieldMenuDef の ePLAYERABILITYID に対応
enum PLAYERABILITYID
{
	RULER,			// ルーラ
	RANARUTA,		// ラナルータ
	RANARION,		// ラナリオン
	MANTAN,			// まんたん
	COLOR_CHANGE	// 色替え
}

// ナビマップアイコン
enum NAVIMAP_ICON
{
	S_BOX,				// ステルスボックス
	CREVICE,			// 時空の裂け目
	DESTINATION,		// 目的地
	DESTINATION_EFFECT,	// 目的地エフェクト
	AREA_BORDER,		// エリア区切り線
	EXCLAMATION,		// 調べられる場所
	RULER_POINT,		// ルーラポイント
	STONE,				// 石碑
	DIRECTION,			// 方向矢印
	MONSTER,			// モンスター
	GOAL,				// ゴール
}

// ナビマップ ライドフィルタ
enum RIDE_FILTER
{
	HIGHJUMP,	// 陸上ライド解禁で行ける場所
	DIVE,		// 潜り解禁で行ける場所
	MULTIJUMP,	// 多段ジャンプ解禁で行ける場所
}

// ライフサイクル
enum SCHEDULE
{
	NOON,				// 昼
	NIGHT,				// 夜
}

// モンスタータイプ
enum MONSTER_TYPE
{
	TERRA,				// 陸
	AQUA,				// 水
	AERO,				// 空
}

// モンスターの系統
enum MONSTER_LINEAGE
{
	NONE,		// 初期値
	SLIME,		// スライム
	DRAGON,		// ドラゴン
	BEAST,		// 魔獣
	NATURE,		// 自然
	DEVIL,		// 悪魔
	ZOMBIE,		// ゾンビ
	MATERIAL,	// 物質
	BREAK,		// ブレイク
	UNKNOWN,	// ???
};

// ▼パーティモンスターランク
enum MONSTER_RANK{
	NONE,		// 不正な値
	F,
	E,
	D,
	C,
	B,
	A,
	S,
	SS,
};

// ▼装備品のグレード（☆の数）
enum EQUIP_GRADE{
	NONE,		// なし
	GRADE_1,	// ☆
	GRADE_2,	// ☆☆
	GRADE_3,	// ☆☆☆
};

// ▼特殊ディスクの種類
enum SPECIAL_DISC{
	METAL,		// メタル
	SHINE,		// 光あふれる
};

// ▼通信コインの種類
enum COIN_TYPE{
	BRONZE,
	SILVER,
	GOLD,
	PLATINA,
};

//=====================================================================================
// 共通関数：ＮＰＣ配置処理
//-------------------------------------------------------------------------------------
// 第一引数：NPCのリソース名
// 第二引数：FBXのノード名
// 戻り値  ：NPC_ID
//=====================================================================================
function ReadAndArrangePointNpc(model_name, node)
{
	local model_id;
	local return_id;

	model_id  = ReadNpc_(model_name);
	return_id = ArrangePointNpc_(model_id, node);

	return return_id;
}

//============================================================================
// 共通関数：１フレームでフェードアウトする
//----------------------------------------------------------------------------
// 第一引数：FADE_COLOR_BLACK or FADE_COLOR_WHITE
// 戻り値  ：なし
//============================================================================
function CommChangeMomentFadeOut(color)
{
	SetFade_(FADE_OUT, color, FADE_SHORT);
	SetFadeSub_(FADE_OUT, color, FADE_SHORT);
	WaitFade_();
}

//============================================================================
// 共通関数：TouchNpc()内でデモを呼び出す
//----------------------------------------------------------------------------
// 第一引数：再生するデモ番号
// 戻り値  ：なし
//============================================================================
function TouchNpcChangeDemo(num)
{
	// フェードアウト 
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
	SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
	WaitFade_();
	
	ChangeDemo_(num); 
}

//============================================================================
// 共通関数：BGMを停止させながらデモを呼び出す
//----------------------------------------------------------------------------
// 第一引数：再生するデモ番号
// 戻り値  ：なし
//============================================================================
function StopBgmChangeDemo(num)
{
	// BGMを 20F で停止させる
	FieldBgmStop_(FADE_MAPCHANGE);
	
	// フェードアウト 
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_MAPCHANGE);
	SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_MAPCHANGE);
	WaitFade_();
	
	ChangeDemo_(num); 
}

//============================================================================
// 共通関数：ショップメニューに入る前の共通フェード
//----------------------------------------------------------------------------
// 第一引数：メニューコマンド
// 戻り値  ：なし
//============================================================================
function GotoMenuFadeOpen(menu)
{
	// 下画面のみフェードをかける
	SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_MENU);
	Wait_(FADE_MENU + 1);	// 確実に暗転させるために1フレ余分にプラス
	SetFadeSub_(FADE_IN, FADE_COLOR_BLACK, FADE_MENU);

	//メニューフローに移行
	GotoMenuOpen_(menu);
}

//=====================================================================================
// 共通関数：EventStartOperate()内でデモを呼び出す
//-------------------------------------------------------------------------------------
// 第一引数：再生するデモ番号
// 第二引数：フェードの色( FADE_COLOR_BLACK or FADE_COLOR_WHITE )
// 戻り値  ：なし
//=====================================================================================
function EventStartChangeDemo(num, color)
{
	// デモとデモの間のチラつきをなくすために１フレームでフェード
	CommChangeMomentFadeOut(color);

	ChangeDemo_(num); 
}

//=====================================================================================
// 共通関数：天候と時間をデモに引き継ぐ時の共通処理
// ※基本的にマスターズロードでしか使用しないでください。
//   マスターズロード以外で使用する場合は仕様変更を伴うためプログラマに要相談
//-------------------------------------------------------------------------------------
// 第一引数：再生するデモ番号
// 戻り値  ：なし
//=====================================================================================
function WeatherTimeChangeDemo(num)
{
	// 天候と時間をデモに引き継ぐ
	SetEventFlg_("BFG_WEATHER_TIME_TAKEOVER_DEMO", true);
	
	ChangeDemo_(num); 
}

//=====================================================================================
// 共通関数：特技石碑起動処理
//-------------------------------------------------------------------------------------
// 第一引数：ギミックＩＤ
// 第二引数：特技定数
// 戻り値  ：なし
//=====================================================================================
function SkillStelePerformance(obj, ability)
{
	local player = GetPlayerId_();
	local task;
	local name, desc;
	local efc_player;
	
	// 非常駐モーション読込
	local reactor = ReadMotion_(player, "Player_touch_reactor");     // 顔を少し左向ける→リアクターを触る
	local reactor_L = ReadMotion_(player, "Player_touch_reactor_L"); // リアクターを触るL
	// エフェクトの読込
	LoadEffect_("ef712_10_emo_surprise01");  // 「！」
	LoadEffect_("ef732_09_light_reactor_c"); // リアクターの光
	
	switch (ability) {
	// 「ルーラ」
	case ABILITY_RULER :
		name = "COMM_ABILITY_NAME_RULER";
		desc = "COMM_ABILITY_DESC_RULER";
		break;
	// 「まんたん」
	case ABILITY_FULLTANK :
		name = "COMM_ABILITY_NAME_FULLTANK";
		desc = "COMM_ABILITY_DESC_FULLTANK";
		break;
	// 「ラナルータ」
	case ABILITY_RANARUTA :
		name = "COMM_ABILITY_NAME_RANARUTA";
		desc = "COMM_ABILITY_DESC_RANARUTA";
		break;
	// 「ラナリオン」
	case ABILITY_RANARION :
		name = "COMM_ABILITY_NAME_RANARION";
		desc = "COMM_ABILITY_DESC_RANARION";
		break;
	// 「イメージチェンジ」
	case ABILITY_MAKE_UP :
		name = "COMM_ABILITY_NAME_MAKE_UP";
		desc = "COMM_ABILITY_DESC_MAKE_UP";
		break;
	default :
		DebugPrint("WARNING : 指定した特技が不正です [AbilityStelePerform]");
		break;
	}
	
	SetFade_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
	WaitFade_();
	Wait_(10);
	
	// メッセージ表示
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_REACTOR");
	SetExchangeMsg_(name);
	ShowMsg_("COMM_ABILITY_ACCESS");		// 「……石碑への アクセスを確認。
	KeyInputWait_();
	CloseMsgWnd_();
	
	// 非ライド状態の時だけモーション再生
	if(!IsPlayerRide_()){
		SetMotion_(player, reactor, BLEND_L);
		WaitMotion(player);
		SetMotion_(player, reactor_L, BLEND_L);
		efc_player = SetBoneEffect_("ef732_09_light_reactor_c", player);
	}
	else{
		efc_player = SetSelectBoneEffectPlayer_("ef732_09_light_reactor_c", PLAYER_MODEL.NORMAL, ATTACH_EFFECT1);
	}
	
	PlaySE_("SE_FLD_135");
	Wait_(30);
	
	SetMotion_(obj, MOT_GIMMICK_1, BLEND_M);
	PlaySE_("SE_FLD_117");
	Wait_(80);
	
	SetMotion_(obj, MOT_GIMMICK_2, BLEND_M);
	Wait_(15);
	
	SetExchangeMsg_(name);
	// システムメッセージ
	OpenMsgWnd_();
	ShowMsg_("COMM_ABILITY_GET");		// ○○を おぼえた！
	PlayMe_("ME_010");
	WaitMe_();
	KeyInputWait_();
	CloseMsgWnd_();
	
	SetMotion_(player, MOT_WAIT, BLEND_XL);
	Wait_(5);
	
	// 特技説明メッセージ
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_REACTOR");
	ShowMsg_(desc);
	KeyInputWait_();
	CloseMsgWnd_();
	
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
	SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
	WaitFade_();
	Wait_(10);
	
	SetPlayableCamera_();
	Wait_(10);
}

//======================================================
// 共通関数：特技石碑に近づいた時のメッセージの共通処理
//------------------------------------------------------
// 第一引数：特技定数
// 戻り値  ：なし
//======================================================
function CommApproachStatueMsg(constant)
{
	local dest_msg; // 置き換える特技名

	switch (constant)
	{
	case ABILITY_RULER:
		dest_msg = "COMM_ABILITY_NAME_RULER";
		break;
	case ABILITY_FULLTANK:
		dest_msg = "COMM_ABILITY_NAME_FULLTANK";
		break;
	case ABILITY_RANARUTA:
		dest_msg = "COMM_ABILITY_NAME_RANARUTA";
		break;
	case ABILITY_RANARION:
		dest_msg = "COMM_ABILITY_NAME_RANARION";
		break;
	case ABILITY_MAKE_UP:
		dest_msg = "COMM_ABILITY_NAME_MAKE_UP";
		break;
	default : DebugPrint("指定した定数が不正です(" + constant + ") [CommApproachStatueMsg]");
		break;
	}

	// メッセージ表示
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_REACTOR");
	SetExchangeMsg_(dest_msg);			// 置き換える特技名
	ShowMsg_("COMM_APPROACH_STATUE");	// 「この付近に　配置されている石碑を調べ
	KeyInputWait_();
	CloseMsgWnd_();
}

//======================================================
// 共通関数：ルーラポイントに触った時の共通処理
//------------------------------------------------------
// 第一引数：ArrangePointGimmick_で格納したルーラポイントの変数
// 第二引数：ルーラポイントの起動をチェックするフラグ
// 第三引数：マップナビアイコン座標(FBX)
// 戻り値  ：なし
//======================================================
function CommRulerPointEvent(arg_pnt_gim, r_pnt_flg, fbx = "")
{
	local player = GetPlayerId_();					// IDの取得
	local r_pnt_pos = GetPos_(arg_pnt_gim);			// ルーラポイントの座標を取得
	local bit_starting = GetEventFlg_(r_pnt_flg);	// ルーラポイント起動フラグ
	local icon;		// ナビマップアイコンID
	local dest;		// 行き先名
	local dest2;	// 行き先名２
	local task;
	
	// ルーラポイントを起動していない
	if (!bit_starting) {
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_REACTOR");
		ShowMsg_("COMM_RULER_ACCESS");		// 「……ルーラポイントを 起動します。
		KeyInputWait_();
		CloseMsgWnd_();
		
		// ルーラ取得SE
		PlaySE_("SE_FLD_155");
		SetMotion_(arg_pnt_gim, MOT_GIMMICK_1, BLEND_N);
		Wait_(40);
		SetMotion_(arg_pnt_gim, MOT_GIMMICK_2, BLEND_N);
		Wait_(15); // ルーラ取得SE待ち
		
		// ルーラポイント起動フラグを立てる
		SetEventFlg_(r_pnt_flg, true);
		
		// 仮 ナビマップが出来ていないマップがあるため、引数 fbx はデフォルト空文字にしておく。
		//    全マップのナビマップが完成したら、デフォルト空文字、空文字判定を消す。
		if (fbx != "") {
			icon = ArrangePointNaviMapIcon_(NAVIMAP_ICON.RULER_POINT, fbx);
			SetNaviMapIconVisible_(icon, true);
		}
		
		// 行き先名を判定
		switch (r_pnt_flg) {
		case "BFG_RULER_ADD_000" : dest  = "COMM_RULER_DEST_LAND_01";
								   dest2 = "COMM_RULER_DEST_00";
								   break;
		case "BFG_RULER_ADD_001" : dest  = "COMM_RULER_DEST_LAND_01";
								   dest2 = "COMM_RULER_DEST_01";
								   break;
		case "BFG_RULER_ADD_002" : dest  = "COMM_RULER_DEST_LAND_02";
								   dest2 = "COMM_RULER_DEST_02";
								   break;
		case "BFG_RULER_ADD_003" : dest  = "COMM_RULER_DEST_LAND_02";
								   dest2 = "COMM_RULER_DEST_03";
								   break;
		case "BFG_RULER_ADD_004" : dest  = "COMM_RULER_DEST_LAND_02";
								   dest2 = "COMM_RULER_DEST_04";
								   break;
		case "BFG_RULER_ADD_005" : dest  = "COMM_RULER_DEST_LAND_02";
								   dest2 = "COMM_RULER_DEST_05";
								   break;
		case "BFG_RULER_ADD_006" : dest  = "COMM_RULER_DEST_LAND_02";
								   dest2 = "COMM_RULER_DEST_06";
								   break;
		case "BFG_RULER_ADD_007" : dest  = "COMM_RULER_DEST_LAND_03";
								   dest2 = "COMM_RULER_DEST_07";
								   break;
		case "BFG_RULER_ADD_008" : dest  = "COMM_RULER_DEST_LAND_03";
								   dest2 = "COMM_RULER_DEST_08";
								   break;
		case "BFG_RULER_ADD_009" : dest  = "COMM_RULER_DEST_LAND_03";
								   dest2 = "COMM_RULER_DEST_09";
								   break;
		case "BFG_RULER_ADD_010" : dest  = "COMM_RULER_DEST_LAND_03";
								   dest2 = "COMM_RULER_DEST_10";
								   break;
		case "BFG_RULER_ADD_011" : dest  = "COMM_RULER_DEST_LAND_04";
								   dest2 = "COMM_RULER_DEST_11";
								   break;
		case "BFG_RULER_ADD_012" : dest  = "COMM_RULER_DEST_LAND_04";
								   dest2 = "COMM_RULER_DEST_12";
								   break;
		case "BFG_RULER_ADD_013" : dest  = "COMM_RULER_DEST_LAND_04";
								   dest2 = "COMM_RULER_DEST_13";
								   break;
		case "BFG_RULER_ADD_014" : dest  = "COMM_RULER_DEST_LAND_04";
								   dest2 = "COMM_RULER_DEST_14";
								   break;
		case "BFG_RULER_ADD_015" : dest  = "COMM_RULER_DEST_LAND_04";
								   dest2 = "COMM_RULER_DEST_15";
								   break;
		case "BFG_RULER_ADD_016" : dest  = "COMM_RULER_DEST_LAND_04";
								   dest2 = "COMM_RULER_DEST_16";
								   break;
		case "BFG_RULER_ADD_017" : dest  = "COMM_RULER_DEST_LAND_05";
								   dest2 = "COMM_RULER_DEST_17";
								   break;
		case "BFG_RULER_ADD_018" : dest  = "COMM_RULER_DEST_LAND_05";
								   dest2 = "COMM_RULER_DEST_18";
								   break;
		case "BFG_RULER_ADD_019" : dest  = "COMM_RULER_DEST_LAND_05";
								   dest2 = "COMM_RULER_DEST_19";
								   break;
		case "BFG_RULER_ADD_020" : dest  = "COMM_RULER_DEST_LAND_06";
								   dest2 = "COMM_RULER_DEST_20";
								   break;
		case "BFG_RULER_ADD_021" : dest  = "COMM_RULER_DEST_LAND_06";
								   dest2 = "COMM_RULER_DEST_21";
								   break;
		case "BFG_RULER_ADD_022" : dest  = "COMM_RULER_DEST_LAND_06";
								   dest2 = "COMM_RULER_DEST_22";
								   break;
		case "BFG_RULER_ADD_023" : dest  = "COMM_RULER_DEST_LAND_06";
								   dest2 = "COMM_RULER_DEST_23";
								   break;
		case "BFG_RULER_ADD_024" : dest  = "COMM_RULER_DEST_LAND_07";
								   dest2 = "COMM_RULER_DEST_24";
								   break;
		case "BFG_RULER_ADD_025" : dest  = "COMM_RULER_DEST_LAND_07";
								   dest2 = "COMM_RULER_DEST_25";
								   break;
		case "BFG_RULER_ADD_026" : dest  = "COMM_RULER_DEST_26";
								   break;
		case "BFG_RULER_ADD_027" : dest  = "COMM_RULER_DEST_27";
								   break;
		case "BFG_RULER_ADD_028" : dest  = "COMM_RULER_DEST_LAND_02";
								   dest2 = "COMM_RULER_DEST_28";
								   break;
		case "BFG_RULER_ADD_029" : dest  = "COMM_RULER_DEST_LAND_02";
								   dest2 = "COMM_RULER_DEST_29";
								   break;
		case "BFG_RULER_ADD_030" : dest  = "COMM_RULER_DEST_LAND_02";
								   dest2 = "COMM_RULER_DEST_30";
								   break;
		case "BFG_RULER_ADD_031" : dest  = "COMM_RULER_DEST_LAND_03";
								   dest2 = "COMM_RULER_DEST_31";
								   break;
		case "BFG_RULER_ADD_032" : dest  = "COMM_RULER_DEST_LAND_06";
								   dest2 = "COMM_RULER_DEST_32";
								   break;
		default : DebugPrint("WARNING : 指定したフラグが不正です(" + r_pnt_flg + ") [CommRulerPointEvent]"); break;
		}
		// ポイントゼロ・バーチャルコロシアムの場合
		if(r_pnt_flg == "BFG_RULER_ADD_026" || r_pnt_flg == "BFG_RULER_ADD_027"){
			// 文字列置換
			SetExchangeMsg_(dest);
			
			OpenMsgWnd_();
			ShowMsg_("COMM_RULER_ADD");			// ルーラの 行き先に
			PlayMe_("ME_010");					// 重要アイテム入手ME
			WaitMe_();
			KeyInputWait_();
			CloseMsgWnd_();
		}
		// アンデッドガーデン入口・アンデッドガーデン地下
		else if(r_pnt_flg == "BFG_RULER_ADD_009" || r_pnt_flg == "BFG_RULER_ADD_010"){
			// 文字列置換２つ
			SetExchangeMsg_(dest);
			SetExchangeMsg_(dest2);
			
			OpenMsgWnd_();
			ShowMsg_("COMM_RULER_ADD3");		// ルーラの 行き先に
			PlayMe_("ME_010");					// 重要アイテム入手ME
			WaitMe_();
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else{
			// 文字列置換２つ
			SetExchangeMsg_(dest);
			SetExchangeMsg_(dest2);
			
			OpenMsgWnd_();
			ShowMsg_("COMM_RULER_ADD2");		// ルーラの 行き先に
			PlayMe_("ME_010");					// 重要アイテム入手ME
			WaitMe_();
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
	// ルーラポイント起動済
	else {
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_REACTOR");
		ShowMsg_("COMM_RULER_DONE");		// 「このルーラポイントは
		KeyInputWait_();
		CloseMsgWnd_();
	}
}

//======================================================
// 共通関数：モノリスの起動のアニメ処理 [ 第四引数がデフォルト引数なので引数追加の時は要注意 ]
//------------------------------------------------------
// 第一引数：ArrangePointGimmick_で格納したモノリスの変数
// 第二引数：モノリスが起動しているかをチェックするフラグ
// 第三引数：モノリスを配置しているノード名
// 第四引数：Ｃランク戦後のライドイベント完了のメッセージを表示するかどうか(デフォルト引数:false)
// 戻り値  ：なし
//======================================================
function MonolithAnime(monolith, flgName, node, eventEndMsgFlg = false)
{
	//IDの取得
	local player = GetPlayerId_();
	// モノリスが起動しているかをチェックするフラグを取得
	local checkStartFlg = GetEventFlg_(flgName);
	// α値の設定
	local alpha_def = 1.0;
	// α値を変更する前は必ずこの命令を記載
	SetManualCalcAlpha_(player, true);

	if(checkStartFlg == false){
		// モノリスが起動しているかをチェックするフラグをtrueに
		SetEventFlg_(flgName, true);
		// モノリスの起動アニメを再生
		PlaySE_("SE_FLD_101");	// 起動用の仮ＳＥを再生
		SetMotion_(monolith, MOT_GIMMICK_1, BLEND_N);// 仮:FieldCommon.nutの定数を入れる
		// モノリスの起動エフェクト
		LoadEffect_("ef732_12_monolith_on");
		SetPointWorldEffect_("ef732_12_monolith_on", node);
		Wait_(30);
		// モノリスの起動後待機アニメを再生
		SetMotion_(monolith, MOT_GIMMICK_2, BLEND_N);
		// 間を持たせる
		Wait_(40);
	}

	if(eventEndMsgFlg == true){
		local main_num = GetNumFlg_("NUM_SCENARIO_MAIN");
		// メッセージを表示
		if(main_num == GetFlagID_("CONST_SM_GRASSLAND")){
			// 陸上ライド
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_TEREZIA");
			ShowMsg_("RIDE_TUT_EVENT_004");
			KeyInputWait_();
			CloseMsgWnd_();
			Wait_(30);
		}
		else if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){
			// 水中ライド
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_TEREZIA");
			ShowMsg_("RIDE_TUT_EVENT_005");
			KeyInputWait_();
			CloseMsgWnd_();
			Wait_(30);
		}
		else if(main_num == GetFlagID_("CONST_SM_VOLCANO")){
			// 空中ライド
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_TEREZIA");
			ShowMsg_("RIDE_TUT_EVENT_006");
			KeyInputWait_();
			CloseMsgWnd_();
			Wait_(30);
		}
	}

// 主人公にテレポートエフェクトをつける
	// エフェクトの読み込み
	LoadEffect_("ef732_07_teleport_monolith");	//モノリス転送エフェクト
	PlaySE_("SE_DEM_017");						// ＳＥ再生
	local effectId = SetSelectBoneEffect_("ef732_07_teleport_monolith", player, ATTACH_GLOBAL);
	Wait_(1);
	// 主人公の姿を段々と消していく
	for(alpha_def = 1.0; alpha_def >= 0.0; alpha_def = alpha_def - 0.1){
		SetAlpha_(player, alpha_def);
		Wait_(1);
	}
	SetAlpha_(player, 0.0);
	
	// 間を持たせる
	Wait_(30);
	
	// フェードアウト
	FieldBgmStop_(FADE_MAPCHANGE);
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_MAPCHANGE);
	SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_MAPCHANGE);
	WaitFade_();
	
	// 主人公のα値を元に戻す
	SetAlpha_(player, 1.0);
}

//======================================================
// 共通関数：ディスク装置の起動アニメ処理(モノリスの起動アニメを流用)
//------------------------------------------------------
// 第一引数：ArrangePointGimmick_で格納したディスク装置の変数
// 第二引数：ディスク装置が起動しているかをチェックするフラグ
// 第三引数：ディスク装置を配置しているノード名
// 戻り値  ：なし
//======================================================
function DiscDeviceAnime(discdevice, flgName, node)
{
	//IDの取得
	local player = GetPlayerId_();
	// モノリスが起動しているかをチェックするフラグを取得
	local checkStartFlg = GetEventFlg_(flgName);
	// α値の設定
	local alpha_def = 1.0;
	// α値を変更する前は必ずこの命令を記載
	SetManualCalcAlpha_(player, true);

	if(checkStartFlg == false){
		// ディスク装置が起動しているかをチェックするフラグをtrueに
		SetEventFlg_(flgName, true);
		// ディスク装置の起動アニメを再生
		PlaySE_("SE_FLD_101");	// 起動用の仮ＳＥを再生
		SetMotion_(discdevice, MOT_GIMMICK_1, BLEND_N);
		// ディスク装置の起動エフェクト
		LoadEffect_("ef732_12_monolith_on");
		SetPointWorldEffect_("ef732_12_monolith_on", node);
		Wait_(30);
		// ディスク装置の起動後待機アニメを再生
		SetMotion_(discdevice, MOT_GIMMICK_2, BLEND_N);
		// 間を持たせる
		Wait_(40);
	}

// 主人公にテレポートエフェクトをつける
	// エフェクトの読み込み
	LoadEffect_("ef732_07_teleport_monolith");	//モノリス転送エフェクト
	PlaySE_("SE_DEM_017");						// ＳＥ再生
	local effectId = SetSelectBoneEffect_("ef732_07_teleport_monolith", player, ATTACH_GLOBAL);
	Wait_(1);
	// 主人公の姿を段々と消していく
	for(alpha_def = 1.0; alpha_def >= 0.0; alpha_def = alpha_def - 0.1){
		SetAlpha_(player, alpha_def);
		Wait_(1);
	}
	SetAlpha_(player, 0.0);
	// 間を持たせる
	Wait_(30);
	// 暗転させる(主人公が消えたままにならないようにここで暗転させてα値を元に戻す)
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 15);
	SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, 15);
	WaitFade_();
	// 主人公のα値を元に戻す
	SetAlpha_(player, 1.0);
}

//======================================================
// 共通関数：昼の開始フレームに戻す
//------------------------------------------------------
// 第一引数：各大陸のクリアフラグ(「ウッドパーク」なら「BFG_SCENARIO_CLEAR_GRASS」
//                                「キングダム」なら「BFG_SCENARIO_CLEAR_CITY」 )
// 戻り値  ：なし
//======================================================
function ResetTimeZone(flg_name)
{
	// 大陸をクリアしないと昼の開始フレームに戻す処理は発生しないのでフラグをチェック
	local check_flg = GetEventFlg_(flg_name);
	if(check_flg){
		// 昼の時間帯に設定
		SetTime_(START_TIME_ZONE_NOON);
	}
}

//======================================================
// 共通関数：昼夜をいれかえる
//------------------------------------------------------
// 第一引数：各大陸のクリアフラグ(「ウッドパーク」なら「BFG_SCENARIO_CLEAR_GRASS」
//                                「キングダム」なら「BFG_SCENARIO_CLEAR_CITY」 )
// 戻り値  ：なし
//======================================================
function ChangeTimeZone(flg_name)
{
	// 大陸をクリアしないと昼夜いれかえは発生しないのでフラグをチェック
	local check_flg = GetEventFlg_(flg_name);
	if(check_flg){
		// 今の時間帯を取得
		local check_daytime = GetDaytimeState_();
		if(check_daytime == SCHEDULE.NOON){
			// 夜の時間帯に設定
			SetTime_(START_TIME_ZONE_NIGHT);
		}
		else if(check_daytime == SCHEDULE.NIGHT){
			// 昼の時間帯に設定
			SetTime_(START_TIME_ZONE_NOON);
		}
	}
}

//======================================================
// 共通関数：宿屋の共通の回復処理
//------------------------------------------------------
// 第一引数：暗転明け後の主人公の再配置する場所
// 第二引数：暗転明け後の主人公の向き
// 第三引数：クリアフラグ
// 第四引数：宿屋のID情報(暗転中に主人公の方向に宿屋を向ける為)
//			（デフォルト値：空白文字）
// 戻り値  ：なし
//======================================================
function CommTaskInn(pos, dir, clear_flg, inn = "")
{
	local player = GetPlayerId_();
	// 暗転
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
	SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
// 音楽室対応 ------------------------------
	// 宿屋のMEを再生するスクリプト
	Wait_(12);
	PlayMe_("ME_003");
	WaitFade_();
	
	// 昼夜変更
	if (clear_flg) {
		switch (GetQueryResult_()) {
		// 「泊まる」
		case QUERY3_0 :
			SetTime_(START_TIME_ZONE_NOON);
			break;
			
		// 「やすむ」
		case QUERY3_1 :
			// 今の時間帯を取得
			local check_daytime = GetDaytimeState_();
			if(check_daytime == SCHEDULE.NOON){
				// 夜の時間帯に設定
				SetTime_(START_TIME_ZONE_NIGHT);
			}
			else if(check_daytime == SCHEDULE.NIGHT){
				// 昼の時間帯に設定
				SetTime_(START_TIME_ZONE_NOON);
			}
			break;
		}
	}
	
	// ステータス回復
	RecoverAll_();
	// 宿屋のMEを再生待ち
	WaitMe_();
	PlayBgmStartHead_();
	
// 音楽室対応 ---------------------------------
	// 暗転明け
	SetFade_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
	SetFadeSub_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
	WaitFade_();
	//Wait_(30);
}

//======================================================
// 共通関数：指定ＮＰＣとの向かい合い処理
//------------------------------------------------------
// 第一引数：キャラクターID
// 戻り値  :指定ＮＰＣの元の向き
//======================================================
function FaceToFaceNpc(chr)
{
	local task;
	
	// 「！」ピン！
	SetBoneEffect_("ef300_20_target_icon", chr);
	PlaySE_("SE_DEM_053");
	Wait_(15);
	
	// 指定キャラを主人公の方へ向ける
	task = Task_RotateToPlayerSetMotion_(chr, 5.7, MOT_WALK, MOT_WAIT);
	WaitTask(task);
}

//======================================================
// 共通関数：侵入禁止のイベント地雷に触れた際の移動処理
//------------------------------------------------------
// 第一引数：戻る時の向き
// 第二引数：移動フレーム数(デフォルト引数:30F)
// 戻り値  ：なし
//======================================================
function CommPlayerTurnMoveDirWalk(dir, move_frame = 30)
{
	local player    = GetPlayerId_();
	
	local task_walk = Task_MoveForward_(player, 1.0, false);
	SetMotion_(player, MOT_WALK, BLEND_N);
	SetDir_(player, dir);
	Wait_(move_frame);
	
	DeleteTask_(task_walk);
}

//======================================================
// 共通関数：指定方向に主人公を振り向かせる共通処理
//------------------------------------------------------
// 第一引数：戻る時の向き
// 戻り値  ：なし
//======================================================
function CommPlayerTurnAroundDir(dir)
{
	local player    = GetPlayerId_();
	
	// 対象物の方向に回転(1Fで11.4°ずつ回転)
	local rotateTask = Task_RotateToDirSetMotion_(player, dir, ROTATE_EVENT_DEF, MOT_WALK, MOT_WAIT);
	WaitTask(rotateTask);
	
	// 間を持たせる
	Wait_(15);
}

//======================================================
// 共通関数：対象物の方向に主人公を振り向かせる共通処理
//------------------------------------------------------
// 第一引数：対象物のID
// 戻り値  ：なし
//======================================================
function CommPlayerTurnAroundObj(obj_id)
{
	local player    = GetPlayerId_();
	
	// 対象物の方向に回転(1Fで11.4°ずつ回転)
	local obj_pos = GetPos_(obj_id);
	local rotateTask = Task_RotateToPosSetMotion_(player, obj_pos, ROTATE_EVENT_DEF, MOT_WALK, MOT_WAIT);
	WaitTask(rotateTask);
	
	// 間を持たせる
	Wait_(15);
}

//===================================================================================
// 共通関数：指定方向に主人公を振り向かせた後、カメラをデフォルトの位置に戻す共通処理
//-----------------------------------------------------------------------------------
// 第一引数：振り向かせる向き
// 戻り値  ：なし
//===================================================================================
function CommTurnAroundAndSetPlayableCamera(dir)
{
	// 指定方向に主人公を振り向かせる
	CommPlayerTurnAroundDir(dir);
	// カメラをデフォルト位置に戻す<修正中なのでRedmine#3817>
	SetPlayableCamera_();
}

//======================================================
// 共通関数：回復処理＋共通メッセージ表示
//------------------------------------------------------
// 第一引数：なし
// 戻り値  ：なし
//======================================================
function RecoveryAndMsg()
{
	local player = GetPlayerId_();
	
	// 回復処理
	LoadEffect_("ef742_01_div_mag_hoimi");
	SetSelectBoneEffect_("ef742_01_div_mag_hoimi", player, ATTACH_GLOBAL);
	PlaySE_("SE_SHA_003");		// 回復SE
	RecoverAll_();
	
	// メッセージ
	OpenMsgWnd_();
	ShowMsg_("COMM_RECOVERY");		// 仲間モンスターが 全回復した！
	KeyInputWait_();
	CloseMsgWnd_();
}


//======================================================
// 共通関数：アイテム入手処理
//------------------------------------------------------
// 第一引数：アイテムID
// 第二引数：入手個数
// 第三引数：重要アイテムフラグ (デフォルト値:false)
// 戻り値  ：なし
//======================================================
function AddItemAndMsg(item_id, number, flg = false)
{
	local msg;
	
	AddItem_(item_id, number);
	SetExchangeItemName_(item_id);
	
	// アイテム一つ入手
	if (number <= 1) {
		msg = "COMM_ITEM_SINGLE_GET";		// ○○を 手に入れた！
	}
	// アイテム複数入手
	else {
		SetExchangeNumber_(number);
		msg = "COMM_ITEM_MULTIPLE_GET";		// ○○を ○○個 手に入れた！
	}
	
	OpenMsgWnd_();
	ShowMsg_(msg);
	
	// 重要アイテム入手時
	if (flg) {
		PlayMe_("ME_010");			// 重要アイテム入手ME
		WaitMe_();
	}
	// 汎用アイテム入手時
	else {
		PlaySE_("SE_SYS_011");		// アイテム入手SE
	}
	
	KeyInputWait_();
	CloseMsgWnd_();
}

//=============================================================
// 共通関数：アクセサリＱの入手処理その１<その２とセットで使う>
//-------------------------------------------------------------
// 第一引数：アイテムID
// 第二引数：入手個数
// 第三引数：重要アイテムフラグ (デフォルト値:false)
// 戻り値  ：なし
//=============================================================
function AddItemAndMsgAQ1(item_id, number, flg = false)
{
	// メッセージ
	OpenMsgWnd_();
	SetExchangeItemName_(item_id);
	SetExchangeNumber_(number);
	ShowMsg_("COMM_ITEM_GET_AQ_01"); // 「主人公は　クイーンから
	
	// 重要アイテム入手時
	if (flg) {
		PlayMe_("ME_010");			// 重要アイテム入手ME
		WaitMe_();
	}
	// 汎用アイテム入手時
	else {
		PlaySE_("SE_SYS_011");		// アイテム入手SE
	}
	
	// アイテム入手処理
	AddItem_(item_id, number);
	
	KeyInputWait_(); // すぐに AddItemAndMsgAQ2() へ行くので CloseMsgWnd_() は行わない
}

//=============================================================
// 共通関数：アクセサリＱの入手処理その２<その１とセットで使う>
//-------------------------------------------------------------
// 第一引数：アイテムID
// 第二引数：入手個数
// 第三引数：重要アイテムフラグ (デフォルト値:false)
// 戻り値  ：なし
//=============================================================
function AddItemAndMsgAQ2(item_id, number, flg = false)
{
	// メッセージ( AddItemAndMsgAQ1() で OpenMsgWnd_() を行っているので注意 )
	SetExchangeItemName_(item_id);
	SetExchangeNumber_(number);
	ShowMsg_("COMM_ITEM_GET_AQ_02"); // 「○○を　○○個　もらった！
	
	// 重要アイテム入手時
	if (flg) {
		PlayMe_("ME_010");			// 重要アイテム入手ME
		WaitMe_();
	}
	// 汎用アイテム入手時
	else {
		PlaySE_("SE_SYS_011");		// アイテム入手SE
	}
	
	// アイテム入手処理
	AddItem_(item_id, number);
	
	KeyInputWait_();
	CloseMsgWnd_();
}

//======================================================
// 共通関数：スカウトＱの入手処理その１
//------------------------------------------------------
// 第一引数：アイテムID
// 第二引数：入手個数
// 第三引数：重要アイテムフラグ (デフォルト値:false)
// 戻り値  ：なし
//======================================================
function AddItemAndMsgSQ1(item_id, number, flg = false)
{
	// メッセージ
	OpenMsgWnd_();
	SetExchangeItemName_(item_id);
	SetExchangeNumber_(number);
	ShowMsg_("COMM_ITEM_GET_SQ_00"); // ノチョリンから　ごほうびとして
	
	// 重要アイテム入手時
	if (flg) {
		PlayMe_("ME_010");			// 重要アイテム入手ME
		WaitMe_();
	}
	// 汎用アイテム入手時
	else {
		PlaySE_("SE_SYS_011");		// アイテム入手SE
	}
	
	// アイテム入手処理
	AddItem_(item_id, number);
	
	KeyInputWait_();
	CloseMsgWnd_();
}

//===========================================================
// 共通関数：スカウトＱの入手処理その２<その３とセットで使う>
//-----------------------------------------------------------
// 第一引数：アイテムID
// 第二引数：入手個数
// 第三引数：重要アイテムフラグ (デフォルト値:false)
// 戻り値  ：なし
//===========================================================
function AddItemAndMsgSQ2(item_id, number, flg = false)
{
	// メッセージ
	OpenMsgWnd_();
	SetExchangeItemName_(item_id);
	SetExchangeNumber_(number);
	ShowMsg_("COMM_ITEM_GET_SQ_01"); // ノチョリンから　ごほうびとして
	
	// 重要アイテム入手時
	if (flg) {
		PlayMe_("ME_010");			// 重要アイテム入手ME
		WaitMe_();
	}
	// 汎用アイテム入手時
	else {
		PlaySE_("SE_SYS_011");		// アイテム入手SE
	}
	
	// アイテム入手処理
	AddItem_(item_id, number);
	
	KeyInputWait_(); // すぐに AddItemAndMsgSQ3() へ行くので CloseMsgWnd_() は行わない
}

//===========================================================
// 共通関数：スカウトＱの入手処理その３<その２とセットで使う>
//-----------------------------------------------------------
// 第一引数：アイテムID
// 第二引数：入手個数
// 第三引数：重要アイテムフラグ (デフォルト値:false)
// 戻り値  ：なし
//===========================================================
function AddItemAndMsgSQ3(item_id, number, flg = false)
{
	// メッセージ( AddItemAndMsgSQ2() で OpenMsgWnd_() を行っているので注意 )
	SetExchangeItemName_(item_id);
	SetExchangeNumber_(number);
	ShowMsg_("COMM_ITEM_GET_SQ_02"); // 「○○を　○○個　もらった！
	
	// 重要アイテム入手時
	if (flg) {
		PlayMe_("ME_010");			// 重要アイテム入手ME
		WaitMe_();
	}
	// 汎用アイテム入手時
	else {
		PlaySE_("SE_SYS_011");		// アイテム入手SE
	}
	
	// アイテム入手処理
	AddItem_(item_id, number);
	
	KeyInputWait_();
	CloseMsgWnd_();
}

//======================================================
// 共通関数：アクセサリを追加する
//------------------------------------------------------
// 第一引数：アイテムID
// 第二引数：グレード
// 戻り値  ：なし
//======================================================
function CommAddAccessory(id, grade)
{
	if(CheckAccessoryMax_()){
		local task = Task_AddAccessoryFlow_(id, grade);
		WaitTask(task);
	} else {
		AddAccessory_(id, grade);
	}
}

//======================================================
// 共通関数：アクセサリー入手の一括処理
//------------------------------------------------------
// 第一引数：アクセサリーID(アイテムID)
// 第二引数：入手個数
// 第三引数：アクセサリーのグレード
// 第四引数：重要アイテムフラグ (デフォルト値:false)
// 戻り値  ：なし
//======================================================
function AddAccessoryAndMsg(acce_id, number, grade, flg = false)
{
	// アクセサリーを最大所持数まで所持しているかチェック
	if(CheckAccessoryMax_()){
		local task = Task_AddAccessoryFlow_(acce_id, grade);
		WaitTask(task);
	} else {
		local msg;
		local add_num = 0;
		
		// アクセサリーの追加処理
		for(add_num = 0; add_num <= (number - 1); add_num++){
			AddAccessory_(acce_id, grade);
		}
		SetExchangeItemName_(acce_id);
		
		// アクセサリ一つ入手
		if (number <= 1) {
			msg = "COMM_ITEM_SINGLE_GET";		// ○○を 手に入れた！
		}
		// アクセサリ複数入手
		else {
			SetExchangeNumber_(number);
			msg = "COMM_ITEM_MULTIPLE_GET";		// ○○を ○○個 手に入れた！
		}
		
		OpenMsgWnd_();
		ShowMsg_(msg);
		
		// 重要アイテム入手時
		if (flg) {
			PlayMe_("ME_010");			// 重要アイテム入手ME
			WaitMe_();
		}
		// 汎用アイテム入手時
		else {
			PlaySE_("SE_SYS_011");		// アイテム入手SE
		}
		
		KeyInputWait_();
		CloseMsgWnd_();
	}
}

//======================================================
// 共通関数：装飾品を追加する
//------------------------------------------------------
// 第一引数：アイテムID
// 第二引数：グレード
// 戻り値  ：なし
//======================================================
function CommAddOrnament(id)
{
	if(CheckOrnamentMax_()){
		//local task = Task_AddOrnamentFlow_(id);
		//WaitTask(task);
	} else {
		AddOrnament_(id);
	}
}

//======================================================
// 共通関数：装飾品入手の一括処理
//------------------------------------------------------
// 第一引数：装飾品ID(アイテムID)
// 第二引数：入手個数
// 第三引数：重要アイテムフラグ (デフォルト値:false)
// 戻り値  ：なし
//======================================================
function AddOrnamentAndMsg(orna_id, number, flg = false)
{
	// 装飾品を最大所持数まで所持しているかチェック
	if(CheckOrnamentMax_()){
		//local task = Task_AddOrnamentFlow_(orna_id);
		//WaitTask(task);
	} else {
		local msg;
		local add_num = 0;
		
		// 装飾品の追加処理
		for(add_num = 0; add_num <= (number - 1); add_num++){
			AddOrnament_(orna_id);
		}
		SetExchangeItemName_(orna_id);
		
		// 装飾品一つ入手
		if (number <= 1) {
			msg = "COMM_ITEM_SINGLE_GET";		// ○○を 手に入れた！
		}
		// 装飾品複数入手
		else {
			SetExchangeNumber_(number);
			msg = "COMM_ITEM_MULTIPLE_GET";		// ○○を ○○個 手に入れた！
		}
		
		OpenMsgWnd_();
		ShowMsg_(msg);
		
		// 重要アイテム入手時
		if (flg) {
			PlayMe_("ME_010");			// 重要アイテム入手ME
			WaitMe_();
		}
		// 汎用アイテム入手時
		else {
			PlaySE_("SE_SYS_011");		// アイテム入手SE
		}
		
		KeyInputWait_();
		CloseMsgWnd_();
	}
}

//======================================================
// 共通関数：大陸間移動の初回デモ後にセーブする処理
//------------------------------------------------------
// 第一引数：大陸クリアフラグ
// 第二引数：セーブ直後にデモがあるかどうか
// 戻り値  ：なし
//======================================================
function CommSavedAfterTransferDemo(flg_name, isNextDemo = false)
{
	// 大陸移動のデモ中にセーブポイントを挟む際に使用するフラグ
	local save_pnt_flg = GetEventFlg_("BFG_SAVE_POINT_FLAG");
	if(save_pnt_flg == true){
		// 大陸移動のデモ中にセーブポイントを挟む際に使用するフラグをfalseに
		SetEventFlg_("BFG_SAVE_POINT_FLAG", false);
		// メッセージボックスより後ろの階層に暗転するように設定
		SetFadePlane_(FADE_PLANE.PLANE_3D);	// 上画面
		SetNavimapVisible_(false);			// 下画面(マップを映らなくする)
		// 暗転( 下画面でメッセージを表示するので、ここではSetFadeSub_()は呼び出さないこと )
		SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
		WaitFade_();
		// セーブ用の仮メッセージ
		OpenMsgWnd_();
		ShowMsg_("CHECK_SAVE_MSG");
		KeyInputWait_();
		if(GetQueryResult_() == QUERY2_0){
			CloseMsgWnd_();
			// セーブ画面へ移行
			local tsk_saved_wnd = Task_Save_();
			WaitTask(tsk_saved_wnd);
			DebugPrint("セーブ完了");
			KeyInputWait_();
		}
		else{
			CloseMsgWnd_();
		}
		Wait_(1);
		// 暗転明け前に下画面を暗転させる
		SetNavimapVisible_(true);
		SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
		WaitFadeSub_();
		
		// セーブ終了後すぐにデモがある場合は、BGMの音量を
		// 0フレームで元に戻す
		// フェードをかけてしまうと、フェード処理の途中でデモに入ってしまい
		// デモのBGMの音量が変わってしまうため
		local volume = FADE_DEF;
		if(isNextDemo){
			volume = 0;
		}

		// 暗転明けをしながら、大陸移動装置からプレイヤーが落ちてくるので
		// フェード終了を待たない
		// 暗転明け
		SetFade_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
		SetFadeSub_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
		// 暗転する階層を元の状態に戻す
		SetFadePlane_(FADE_PLANE.PLANE_NORMAL);
	}
	// 大陸クリアフラグ
	SetEventFlg_(flg_name, true);
}

//=====================================================================================
// 共通関数：全滅復帰の共通処理
//-------------------------------------------------------------------------------------
// 第一引数：主人公の復帰座標
// 第二引数：主人公の向き
// 戻り値  ：なし
//=====================================================================================
function CommDeadReturn(pos, dir)
{
	local player = GetPlayerId_();
	// 暗転
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
	SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
	WaitFade_();
	// 復帰位置を指定
	SetPos_(player, Vec3(pos.x, pos.y, pos.z));
	SetDir_(player, dir);
	// カメラが主人公の方に来るまで暗転
	Wait_(60);
	SetFade_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
	SetFadeSub_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
	WaitFade_();
	// 回復処理＋共通メッセージ表示
	RecoveryAndMsg();
	// 全滅通知Bitフラグをfalseに戻す( プログラムで立ててスクリプトで降ろす )
	SetEventFlg_("BFG_DEAD_RETURN", false);
}

//=====================================================================================
// 共通関数：隠れているノチョーラの共通処理
//-------------------------------------------------------------------------------------
// 第一引数：話しかける相手
// 第二引数：隠れている相手のリアクターポイント
// 第三引数：プレイヤーID
// 戻り値  ：なし
//=====================================================================================
function CommHideAndSeek(target, rpoint, player)
{
	local flg_name;
	local rtn_player_pos;
	local rtn_player_dir;
	local rtn_camera_dir;
	local nocho_node;
	local rmsg;
	local nocho_tag = "NAME_NONE"; // ネームタグは表示されない<2次DB #3587>
	local nocho_msg;

	switch(target)
	{
	case npc_ACE:
		flg_name = "BFG_FIRST_TIME_TALK_ACE";
		rtn_player_pos = Vec3(33.029, -0.039, -105.935);
		rtn_player_dir = -165;
		rtn_camera_dir = 155;
		nocho_node = "A002_2";
		rmsg = "NPC_NOCHO_MEN_REC";
		nocho_msg = "DEMO_012_AFT_ACE";
		SetTargetNameKey_(npc_ACE, "NAME_TAG_NOCHORA"); // アナライズのターゲット名を切り替える(エース→ノチョーラ)
		break;
	case npc_INN:
		flg_name = "BFG_FIRST_TIME_TALK_INN";
		rtn_player_pos = Vec3(205.971, -1.260, -1.622);
		rtn_player_dir = -132;
		rtn_camera_dir = -160;
		nocho_node = "A003_2";
		rmsg = "NPC_NOCHO_MEN_REC";
		nocho_msg = "DEMO_012_AFT_INN";
		break;
	case npc_QEN:
		flg_name = "BFG_FIRST_TIME_TALK_QUEEN";
		rtn_player_pos = Vec3(13.531, -0.039, 116.898);
		rtn_player_dir = -52;
		rtn_camera_dir = 10;
		nocho_node = "A001_2";
		rmsg = "NPC_NOCHO_WOMEN_REC";
		nocho_msg = "DEMO_012_AFT_QEN";
		SetTargetNameKey_(npc_QEN, "NAME_TAG_NOCHORA"); // アナライズのターゲット名を切り替える(クイーン→ノチョーラ)
		break;
	}

	// 初めて話しかけたかフラグ
	SetEventFlg_(flg_name, true);
	// オブジェクトの方向に向ける
	//CommPlayerTurnAroundObj(target);
	// 暗転
	SetFade_(FADE_OUT , FADE_COLOR_BLACK, FADE_DEF);
	SetFadeSub_(FADE_OUT , FADE_COLOR_BLACK, FADE_DEF);
	WaitFade_();
	WaitFadeSub_();
	// α値を元に戻す
	SetManualCalcAlpha_(target, true);
	SetAlpha_(target, 1.0);
	//がさごそSE
	PlaySE_("SE_DEM_034");
	// ここでリアクターポイントを削除
	SetActive_(rpoint, false);
	// 主人公の位置と向きを設定
	SetPos_(player, rtn_player_pos);
	SetDir_(player, rtn_player_dir);
	//カメラの向きを設定
	SetCameraDir_(rtn_camera_dir);
	//隠れているノチョーラを移動させる
	SetPointPosNoFit_(target , nocho_node); 
	// ノチョーラを主人公の位置に向ける
	SetDirToPlayer_(target);
	SetReactorMsg_(target, rmsg);
	Wait_(30); 
	// 喋らせない
	SetMotion_(target, "WAIT", BLEND_N);
	//暗転を開ける
	SetFade_(FADE_IN, FADE_COLOR_BLACK, 30);
	SetFadeSub_(FADE_IN, FADE_COLOR_BLACK, 30);
	WaitFade_();
	Wait_(30); 
	// 会話開始
	SetMotion_(target, "TALKLOOP", BLEND_N);
	CommonMessageT(nocho_msg, nocho_tag);
	SetMotion_(target, "WAIT", BLEND_N);
}

//======================================================
// 共通関数：センタービルのショップの段階解放フラグの一括変更
//------------------------------------------------------
// 第一引数：解放段階（０～２）
// 戻り値  ：なし
//======================================================
function CommShopLevelChange(change_level)
{
	CommItemLevelChange(change_level);
	CommMeatLevelChange(change_level);
}

//======================================================
// 共通関数：センタービルの道具屋の段階解放フラグの変更
//------------------------------------------------------
// 第一引数：解放段階（０～２）
// 戻り値  ：なし
//======================================================
function CommItemLevelChange(change_level)
{
	SetNumFlg_("NUM_FLG_SHOP_A01_00_ITEM_LEVEL", change_level);
}

//======================================================
// 共通関数：センタービルの肉屋の段階解放フラグの変更
//------------------------------------------------------
// 第一引数：解放段階（０～２）
// 戻り値  ：なし
//======================================================
function CommMeatLevelChange(change_level)
{
	SetNumFlg_("NUM_FLG_SHOP_A01_00_MEET_LEVEL", change_level);
}

//======================================================
// 共通関数：センタービルの道具屋の３段階解放関数
//------------------------------------------------------
// 第一引数：なし
// 戻り値  ：なし
//======================================================
function CommCheckItemShopChangeLv3()
{
	local change_item_id = ITEM_SHOP_EXTEND_ITEM_ID; // 「どうぐの達人」のアイテムID
	local get_num = GetItemNum_(change_item_id);
	
	if(get_num >= 1){
		AddItem_(change_item_id, -1);
		local change_lv = 3;
		SetNumFlg_("NUM_FLG_SHOP_A01_00_ITEM_LEVEL", change_lv);
		SetEventFlg_("BFG_LOOK_ITEMSHOP_LV_MSG_3", true);
		
		// メッセージの表示
		SetExchangeItemName_(change_item_id);
		OpenMsgWnd_();
		ShowMsg_("GIVE_FOR_ITEM_SHOP");
		KeyInputWait_();
		CloseMsgWnd_();
	}
}

//======================================================
// 共通関数：センタービルの肉屋の３段階解放関数
//------------------------------------------------------
// 第一引数：なし
// 戻り値  ：なし
//======================================================
function CommCheckMeatShopChangeLv3()
{
	local change_item_id = MEAT_SHOP_EXTEND_ITEM_ID; // 「せい肉の極意」のアイテムID
	local get_num = GetItemNum_(change_item_id);
	
	if(get_num >= 1){
		AddItem_(change_item_id, -1);
		local change_lv = 3;
		SetNumFlg_("NUM_FLG_SHOP_A01_00_MEET_LEVEL", change_lv);
		SetEventFlg_("BFG_LOOK_MEATSHOP_LV_MSG_3", true);
		
		// メッセージの表示
		SetExchangeItemName_(change_item_id);
		OpenMsgWnd_();
		ShowMsg_("GIVE_FOR_MEAT_SHOP");
		KeyInputWait_();
		CloseMsgWnd_();
	}
}

//===========================================================================
// 共通関数：ヤチホコ/ワダツミ/ホアカリのいずれかのゆびわをもっているか判定
//---------------------------------------------------------------------------
// 引数    ：なし
// 戻り値  ：true / false
//===========================================================================
function CommAccessoryCheck()
{
	local get_num_y = GetAccessoryNum_(YATIHOKO_ACCE_ID); // ヤチホコのゆびわの総数
	local get_num_w = GetAccessoryNum_(WADATUMI_ACCE_ID); // ワダツミのゆびわの総数
	local get_num_h = GetAccessoryNum_(HOAKARI_ACCE_ID);  // ホアカリのゆびわの総数

	DebugPrint(" ");
	DebugPrint("ヤチホコ用アイテムの総数は " + get_num_y + " 個です。");
	DebugPrint("ワダツミ用アイテムの総数は " + get_num_w + " 個です。");
	DebugPrint("ホアカリ用アイテムの総数は " + get_num_h + " 個です。");

	if(get_num_y >= 1){
		return true;
	}
	if(get_num_w >= 1){
		return true;
	}
	if(get_num_h >= 1){
		return true;
	}

	return false;
}

//================================================================================
// 共通関数:ヤチホコ/ワダツミ/ホアカリのいずれかのゆびわを捨てたり分解したりした時
//          Demo809[封印の解放]の後に流すデモを判定するためのフラグの値を保存処理
//--------------------------------------------------------------------------------
// 引数    ：なし
// 戻り値  ：なし
//================================================================================
function CommLostAccessoryCheck()
{
	local get_num_y = GetAccessoryNum_(YATIHOKO_ACCE_ID); // ヤチホコ用アクセサリの総数
	local get_num_w = GetAccessoryNum_(WADATUMI_ACCE_ID); // ワダツミ用アクセサリの総数
	local get_num_h = GetAccessoryNum_(HOAKARI_ACCE_ID ); // ホアカリ用アクセサリの総数
	
	// 優先順位は 1.陸 → 2.海 → 3.空 の順
	if(get_num_y >= 1){
		// NUMフラグに代入
		SetNumFlg_("NUM_RELEASE_AND_DECOMPOSE_ACCESSORY", 1);
	}
	else{
		if(get_num_w >= 1){
			// NUMフラグに代入
			SetNumFlg_("NUM_RELEASE_AND_DECOMPOSE_ACCESSORY", 2);
		}
		else{
			if(get_num_h >= 1){
				SetNumFlg_("NUM_RELEASE_AND_DECOMPOSE_ACCESSORY", 3);
			}
			else{
				// 例外
			}
		}
	}
}

//===========================================================================
// 共通関数：道具一覧に陸/海/空のいずれかのスターピースがあるか判定
//---------------------------------------------------------------------------
// 引数    ：なし
// 戻り値  ：true / false
//===========================================================================
function CommStarPieceCheck()
{
	local get_num_land = GetItemNum_(LAND_STAR_PIECE_ID); // 陸のスターピース
	local get_num_sea  = GetItemNum_(SEA_STAR_PIECE_ID);  // 海のスターピース
	local get_num_sky  = GetItemNum_(SKY_STAR_PIECE_ID);  // 空のスターピース

	DebugPrint(" ");
	DebugPrint("陸のスターピースの総数は " + get_num_land + " 個です。");
	DebugPrint("海のスターピースの総数は " + get_num_sea + " 個です。");
	DebugPrint("空のスターピースの総数は " + get_num_sky + " 個です。");

	if(get_num_land >= 1){
		return true;
	}
	if(get_num_sea >= 1){
		return true;
	}
	if(get_num_sky >= 1){
		return true;
	}

	return false;
}

//============================================================================
// 共通関数：凶エスターク作成条件のチェック
//----------------------------------------------------------------------------
// 引数    ：なし
// 戻り値  ：true → 作成可能 / false → 作成不可
//============================================================================
function CommCheckBreakEstarkMaking()
{
	// 帝王のからだ
	local est_body_num = GetItemNum_(BREAK_ESTARK_01_ID);
	// 帝王の喜び
	local est_joy_num  = GetItemNum_(BREAK_ESTARK_02_ID);
	// 帝王の怒り
	local est_ang_num  = GetItemNum_(BREAK_ESTARK_03_ID);
	// 帝王の哀しみ
	local est_sad_num  = GetItemNum_(BREAK_ESTARK_04_ID);
	// 帝王の楽しみ
	local est_fun_num  = GetItemNum_(BREAK_ESTARK_05_ID);

	// 黒鉄の監獄塔をクリアしているか？
	if(GetEventFlg_("BFG_SCENARIO_CLEAR_SAND") == true){
		// 所持アイテムのチェック
		if(est_body_num >= 1){
			if(est_joy_num >= 1){
				if(est_ang_num >= 1){
					if(est_sad_num >= 1){
						if(est_fun_num >= 1){
							return true;
						}
						else{
							return false;
						}
					}
					else{
						return false;
					}
				}
				else{
					return false;
				}
			}
			else{
				return false;
			}
		}
		else{
			return false;
		}
	}
	else{
		return false;
	}
}

//======================================================
// 共通関数：裏シナリオの時空の裂け目の演出で使う共通処理
//------------------------------------------------------
// 引数    ：なし
// 戻り値  ：なし
//======================================================
function CommDisplayedWormholeEffect()
{
	local fade_spd  =  40;
	local cam_range = 100;
	local eff_frame =  30;
	// SE再生(裂け目用のSE)
	PlaySE_("SE_FLD_024");
	// 裂け目に入るエフェクトを表示
	LoadEffect_("ef300_35_wormhole_rarity02");
	local efc_01 = SetCameraEffect_("ef300_35_wormhole_rarity02", cam_range);
	Wait_(eff_frame);
	// 暗転
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, fade_spd);
	SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, fade_spd);
	// 暗転処理に合わせて、BGM・環境音もフェードアウト
	SetBgmVolume_(0.0, fade_spd);
	WaitFade_();
}

//======================================================
// 共通関数：少年状態に設定する
//------------------------------------------------------
// 第一引数：少年状態に設定するか
// 戻り値  ：なし
//======================================================
function SetPlayerBoy(boy)
{
	SetEventFlg_("BFG_PLAYER_BOY", boy);	// プレイヤーモデルを少年状態にする
	SetEventFlg_("BFG_NAVIMAP_REACTOR_CONTROL_UNLOCK", !boy);	// リアクターを使用できないようにする
}

//=============================================================================
// 共通関数：リアクター反応があった時(リアクターからのお知らせの挙動)
//-----------------------------------------------------------------------------
// 引数  ：なし
// 戻り値：なし
//=============================================================================
function CommReactorActionNotice()
{
	local player = GetPlayerId_();

	// リアクター反応音
	PlaySE_("SE_FLD_135");

	// ライドしている
	if(IsPlayerRide_()){
		// 特に何もしない
	}
	// ライドしていない
	else{
		// 非常駐モーション読込
		local reactor = ReadMotion_(player, "Player_touch_reactor");		// 顔を少し左向ける→リアクターを触る
		local reactor_L = ReadMotion_(player, "Player_touch_reactor_L");	// リアクターを触るL
		SetMotion_(player, reactor, BLEND_M);
		Wait_(BLEND_M);
		SetMotion_(player, reactor_L, BLEND_XL);
	}
	Wait_(45);
}

//=============================================================================
// 共通関数：リアクター反応があった時(リアクターが何かを発見した挙動)
//-----------------------------------------------------------------------------
// 引数  ：なし
// 戻り値：なし
//=============================================================================
function CommReactorActionDiscover()
{
	local player = GetPlayerId_();
	local efc_player;

	// リアクター反応音
	PlaySE_("SE_FLD_135");

	// ライドしている
	if(IsPlayerRide_()){
		efc_player = SetSelectBoneEffectPlayer_("ef732_09_light_reactor_c", PLAYER_MODEL.NORMAL, ATTACH_EFFECT1);
	}
	// ライドしていない
	else{
		// エフェクト
		LoadEffect_("ef732_09_light_reactor_c");		// リアクターの光
		// 非常駐モーション読込
		local reactor = ReadMotion_(player, "Player_touch_reactor");		// 顔を少し左向ける→リアクターを触る
		local reactor_L = ReadMotion_(player, "Player_touch_reactor_L");	// リアクターを触るL
		SetMotion_(player, reactor, BLEND_M);
		Wait_(BLEND_M);
		SetMotion_(player, reactor_L, BLEND_XL);
		efc_player = SetBoneEffect_("ef732_09_light_reactor_c", player);
	}
	Wait_(45);
}

//======================================================
// 共通関数：主人公のモーションを待機状態にする(ライド中は無視する)
//------------------------------------------------------
// 引数  ：なし
// 戻り値：なし
//======================================================
function CommResetPlayerMotion()
{
	// ライドしている
	if(IsPlayerRide_()){
		// 特に何もしない
	}
	// ライドしていない
	else{
		local player = GetPlayerId_();
		SetMotion_(player, MOT_WAIT, BLEND_XL);
		Wait_(BLEND_XL);
	}
}

//======================================================
// 共通関数：プレイヤーを実体化させる
// ( 注意点：擬似デモ終了時の暗転で必ず「SetManualCalcAlpha_(player, false);」を行うこと )
//------------------------------------------------------
// 引数  ：なし
// 戻り値：なし
//======================================================
function CommBeforePlayableDemoAlpha()
{
	local player = GetPlayerId_();
	SetManualCalcAlpha_(player, true);   // α値をスクリプトで設定できるようにする
	SetAlpha_(player, 1);                // α値を1にする
}

//======================================================
// 共通関数：ライド時の会話カメラ設定
//------------------------------------------------------
// 引数  ：npc_id	NPC_ID
// 戻り値：なし
//======================================================
function SetRideTalkCamOffset(npc_id)
{
	local target = GetTargetId_();
	local offset_y = 0;
	local offset_z = 0;
	
	switch(npc_id)
	{
	case OFFSET_RENATE:
		offset_y = -14.0;
		offset_z = 0;
		break;
	case OFFSET_RUKIYA:
		offset_y = -5.0;
		offset_z = 0;
		break;
	default:
		DebugPrint("このNPC (ID:" + npc_id + ") は処理が登録されていません。 [SetRideTalkCamOffset]");
		break;
	}
	
	// ライド中の場合
	if(IsPlayerRide_() == true){
		SetTalkCameraEyeOffset_(target, offset_y, offset_z);
	}
	else{
		SetTalkCameraEyeOffset_(target, 0.0, 0.0);
	}
}

//======================================================
// 共通関数：EventStartOperateでのSetTalkAction
//------------------------------------------------------
// 引数  ：npc_id	NPC_ID
// 戻り値：なし
//======================================================
function EventStartOperateTalkAction(npc_id)
{
	// モーションを反映させるため1フレーム待つ
	CommChangeMomentFadeOut(FADE_COLOR_BLACK);
	// NPC会話カメラを設定
	SetTalkAction_(npc_id);
	// 本来の残りフェードを設定
	SetFade_(FADE_IN, FADE_COLOR_BLACK, FADE_MAPCHANGE - FADE_SHORT);
	SetFadeSub_(FADE_IN, FADE_COLOR_BLACK, FADE_MAPCHANGE - FADE_SHORT);
}

//======================================================
// 共通関数：移動装置を使用した時
//------------------------------------------------------
// 引数  ：なし
// 戻り値：なし
//======================================================
function UsingTransfer()
{
	// セーブ処理が走らない場合
	if (!GetEventFlg_("BFG_SAVE_POINT_FLAG")) {						// Bit1033
		// 暗転明け時、主人公の待機モーションが見えないようにする
		SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
		SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
		WaitFade_();
		Wait_(30);
		SetFade_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
		SetFadeSub_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
	}
}

//======================================================
// マスターズロード：戦闘後
//------------------------------------------------------
// 引数  ：info		マスターズロード情報
// 戻り値：なし
//======================================================
function MastersLoad_AfterBattle(info)
{
	// 最終モンスターと戦って負けたかフラグで判断
	if(GetEventFlg_("BFG_CHECK_BATTLE_GOAL_MONSTER") == true){
		// プレイヤーIDの取得
		local player = GetPlayerId_();
		
		// 勝ち
		if(GetBattleEndType_() == END_TYPE_WIN){
			SetVisible(player, false);	// プレイヤーを見えなくする
			SetEventFlg_("BFG_RETURN_BATTLE_FIRLD_BGM_HEAD", true);// フィールドBGMを頭打ち
		}
		// にげる
		else if(GetBattleEndType_() == END_TYPE_FLEE){
			SetVisible(player, true);	// プレイヤーを見えるようにする
		}
		// 負け
		else{
			SetVisible(player, true);
			SetEventFlg_("BFG_CHECK_BATTLE_GOAL_MONSTER", false);	// ゴールモンスターと戦ったか
			SetEventFlg_(info.GIMMICK_FLG, false);					// 空間の遊びギミック起動
			SetEventFlg_("BFG_ARRANGE_FIELD_ITEM", true);			// フィールドのランダム配置アイテムの配置許可
		}
	}
}


//======================================================
// マスターズロード：フラグ設定
//------------------------------------------------------
// 引数  ：info		マスターズロード情報
// 戻り値：なし
//======================================================
function MastersLoad_SetFlag(info)
{
	// ■フラグ取得
	local gim_start_flg = GetEventFlg_(info.GIMMICK_FLG);			// 空間の遊びギミック起動
	local gim_clear_flg = GetEventFlg_(info.GIMMICK_CLEAR_FLG);		// 空間の遊び初回クリア
	local metal_select = true;										// メタル配置  true:討伐済み（非配置）  false:未討伐（配置）
	
	// ■宝箱配置フラグ
	if(gim_start_flg == true){	//起動中
		if(gim_clear_flg == true){
			SetEventFlg_("BFG_SPACE_TREASURE_UNLOCK", true);	//153
			metal_select = false;
		}else{
			SetEventFlg_("BFG_SPACE_TREASURE_UNLOCK", false);
		}
	}else{	//未起動中
		SetEventFlg_("BFG_SPACE_TREASURE_UNLOCK", false);
	}
	DebugPrint("<----------  マスターズロード  メタル配置抽選  "+metal_select+"  ----------->")
	SetEventFlg_("BFG_ENCOUNTBIT_017", metal_select);	// 717
	SetEventFlg_("BFG_ENCOUNTBIT_018", metal_select);	// 718
	SetEventFlg_("BFG_ENCOUNTBIT_019", metal_select);	// 719
	SetEventFlg_("BFG_ENCOUNTBIT_020", metal_select);	// 720
}


//======================================================
// マスターズロード：配置処理
//------------------------------------------------------
// 引数  ：info		マスターズロード情報
// 戻り値：なし
//======================================================
function MastersLoad_Setting(info)
{
	// ■フラグ
	local gim_start_flg = GetEventFlg_(info.GIMMICK_FLG);		// 空間の遊びギミック起動
	local gim_clear_flg = GetEventFlg_(info.GIMMICK_CLEAR_FLG);	// 空間の遊び初回クリア
	
	// カウントダウン表示用のフラグ初期化
	SetEventFlg_("BFG_SPACE_GIMMICK_COUNTDOWN", false);
	
	// ■ギミック
	// 起動スイッチ
	local id_keyhole = ReadGimmick_("o_com_19");		// 碑石スイッチ
	g_keyhole = ArrangePointGimmick_("o_com_19", id_keyhole, "g_keyhole");
	if(gim_start_flg == false){
		SetMotion_(g_keyhole, MOT_GIMMICK_0, BLEND_N);	// 起動前
	}
	else{
		SetMotion_(g_keyhole, MOT_GIMMICK_2, BLEND_N);	// 起動後
	}
	
	// ゴールポイント
	if(gim_start_flg == true){
		local id_goal = ReadGimmick_("o_com_38");		// ゴールポイント
		g_keyhole_goal_point = ArrangePointGimmick_("o_com_38", id_goal, "g_keyhole_goal_mine");
		SetMotion_(g_keyhole_goal_point, MOT_GIMMICK_0, BLEND_N);
	}
	
	// ■NPC
	local id_sp_monster;
	// ギミック起動フラグが立っていたらSPモンスターを配置
	if(gim_start_flg == true){
		if(gim_clear_flg == false){
			// 初回			※暫定仕様の為、同じモンスター
			id_sp_monster = ReadNpc_(info.BOSS_ID_1);
		}
		else{
			// ２回目以降	※暫定仕様の為、同じモンスター
			id_sp_monster = ReadNpc_(info.BOSS_ID_2);
		}
		g_keyhole_npc = ArrangePointNpc_(id_sp_monster, "g_keyhole_npc");
		if(gim_clear_flg == false){
			SetScaleSilhouette(g_keyhole_npc, info.BOSS_SCALE_1, info.BOSS_SILHOUETTE_1);
		}
		else{
			SetScaleSilhouette(g_keyhole_npc, info.BOSS_SCALE_2, info.BOSS_SILHOUETTE_2);
		}
		//SetReactorMsg_(g_keyhole_npc, ""); // リアクターメッセージは未設定
		SetTalkEnable_(g_keyhole_npc, false);
		SetMotion_(g_keyhole_npc, MOT_WAIT, BLEND_N);
	}
	
	// ■地雷
	// 空間の遊びイベントの起動用ギミックに設置する地雷
	g_keyhole_mine = SetPointCircleEventMine_("g_keyhole_mine", true);
	
	// ゴールの着地点の地雷
	if(gim_start_flg == true){
		g_keyhole_goal_mine = SetPointCircleEventMine_("g_keyhole_goal_mine", false);
	}
	
	// ■マップナビ(ゴール地点)
	local navi_goal	 = ArrangePointNaviMapIcon_(NAVIMAP_ICON.GOAL, "g_keyhole_navi_goal");
	SetNaviMapIconVisible_(navi_goal, false);
	if(gim_start_flg == true){
		SetNaviMapIconVisible_(navi_goal, true);
	}
}


//======================================================
// マスターズロード：カウントダウン
//------------------------------------------------------
// 引数  ：info		マスターズロード情報
// 戻り値：なし
//======================================================
function MastersLoad_CountDown(info)
{
	if(GetEventFlg_(info.GIMMICK_FLG) == true){						// 空間の遊びギミック起動フラグ
		if(GetEventFlg_("BFG_SPACE_GIMMICK_COUNTDOWN") == false){	// 空間の遊びギミックでカウントダウン表示を制御するフラグ
			SetEventFlg_("BFG_SPACE_GIMMICK_COUNTDOWN", true);
			// カウントダウンレイアウトの表示
			LoadLayout_("masters_road");
			SetLayoutAnime_("start_count3", false);		// ３
			WaitLayoutAnime();
			SetLayoutAnime_("start_count2", false);		// ２
			WaitLayoutAnime();
			SetLayoutAnime_("start_count1", false);		// １
			WaitLayoutAnime();
			PlaySE_("SE_FLD_002");						// レース・スタート表示
			SetLayoutAnime_("race_start", false);		// ＳＴＡＲＴ
		}
	}
}


//======================================================
// マスターズロード：戦闘判定
//------------------------------------------------------
// 引数  ：info		マスターズロード情報
// 戻り値：なし
//======================================================
function MastersLoad_BattleJudgment(info)
{
	// フラグ取得
	local gim_clear_flg = GetEventFlg_(info.GIMMICK_CLEAR_FLG);		// 空間の遊び初回クリア
	
	if(GetEventFlg_("BFG_CHECK_BATTLE_GOAL_MONSTER") == true){		// ゴールモンスターと戦ったか
		// モーションの設定
		SetMotion_(g_keyhole_npc, MOT_WAIT, BLEND_N);
		// プレイヤーID取得
		local player = GetPlayerId_();
		
		DebugPrint("空間の遊びイベント用の戦闘判定です。");
		// 勝利判定
		if(GetBattleEndType_() == END_TYPE_WIN){
			// チラつきをなくすために１フレームで暗転
			CommChangeMomentFadeOut(FADE_COLOR_BLACK)
			// カメラを設置
			SetPointCameraEye_(info.CAMERA_EYE);
			SetPointCameraTarget_(info.CAMERA_TGT);
			Wait_(15);
			// フェードイン
			SetFade_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
			WaitFade_();
			
			// 2回目以降で規定ターン数以上かかった場合
			local lmt_round = GetBattleRound_();
			if(gim_clear_flg == true && lmt_round >= 6){
				// 力量不足メッセージ
				OpenMsgWnd_();
				SetExchangeMonsterKindName_(info.BOSS_EXCHANGE_ID);
				SetTalkName_("NAME_TAG_REACTOR");
				ShowMsg_("MASTERS_LOAD_REACTOR_MSG_150");				//「残念ながら　○モンスターの名前○は
				KeyInputWait_();
				CloseMsgWnd_();
				// モンスターをフェードアウト
				SetManualCalcAlpha_(g_keyhole_npc, true);
				local task = Task_ObjectFadeOut_(g_keyhole_npc, FADE_DEF);
				WaitTask(task);
				// メッセージ
				OpenMsgWnd_();
				SetExchangeMonsterKindName_(info.BOSS_EXCHANGE_ID);
				ShowMsg_("MASTERS_LOAD_SYSTEM_MSG_130");				// <exchange/>はその場から　去ってしまった！
				KeyInputWait_();
				CloseMsgWnd_();
				// リアクター
				OpenMsgWnd_();
				SetTalkName_("NAME_TAG_REACTOR");
				ShowMsg_("MASTERS_LOAD_REACTOR_MSG_160");				// 「以上で　今回のマスターズロードは
				KeyInputWait_();
				CloseMsgWnd_();
				// フェードアウト
				SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
				WaitFade_();
				// フラグを設定
				SetEventFlg_(info.GIMMICK_FLG, false);
				SetEventFlg_("BFG_CHECK_BATTLE_GOAL_MONSTER", false);
				SetEventFlg_("BFG_SPACE_GIMMICK_COUNTDOWN", false);
				// 配置アイテムの制御切り替え（空間の遊び用→通常用）
				SetEventFlg_("BFG_ARRANGE_FIELD_ITEM", true);
				// 空間の遊び勝利でマップチェンジしたかどうかのフラグを設定
				SetEventFlg_("BFG_RETURN_SPACE_GIMMICK_WIN", true);
				// 配置したモンスターＮＰＣを削除するためにマップチェンジ
				ChangeMapPosDir_(info.MAP_ID, Vec3(info.XPOS_1, info.YPOS_1, info.ZPOS_1), info.DIR_1);
			}
			// 1回目と2回目以降の規定ターン数以内で勝った場合 (基本的にこちらを通ることになる)
			else{
				// 仲間にするメッセージ
				// 対象モンスター
				OpenMsgWnd_();
				SetTalkName_("NAME_TAG_REACTOR");
				SetExchangeMonsterKindName_(info.BOSS_EXCHANGE_ID);
				// 1回目
				if(gim_clear_flg == false){
					ShowMsg_("MASTERS_LOAD_REACTOR_MSG_130");	// 「マスターズロード　完全クリアです。
				}
				// 2回目以降
				else{
					ShowMsg_("MASTERS_LOAD_REACTOR_MSG_140");	// 「５ターン以内に　戦闘に勝利したので……
				}
				KeyInputWait_();
				CloseMsgWnd_();
				
				// システム
				OpenMsgWnd_();
				SetExchangeMonsterKindName_(info.BOSS_EXCHANGE_ID);
				ShowMsg_("MASTERS_LOAD_SYSTEM_MSG_120");		// <exchange/>が仲間になった！
				// 仲間ME(重要アイテム取得と同じRedmine#2831)
				PlayMe_("ME_010");
				WaitMe_();
				KeyInputWait_();
				CloseMsgWnd_();
				
				// 仲間にするモンスターパラメータを指定
				local enemy_param;
				if(gim_clear_flg == false){ enemy_param = info.BOSS_PARAMETER_1; }
				if(gim_clear_flg == true){  enemy_param = info.BOSS_PARAMETER_2; }
				// 名前付け画面へ移行
				local tsk_named_wnd = Task_AddFellow_(enemy_param, false);
				WaitTask(tsk_named_wnd);
				// フラグを設定
				SetEventFlg_(info.GIMMICK_FLG, false);
				SetEventFlg_("BFG_CHECK_BATTLE_GOAL_MONSTER", false);
				SetEventFlg_("BFG_SPACE_GIMMICK_COUNTDOWN", false);
				SetEventFlg_(info.GIMMICK_CLEAR_FLG, true);
				// 配置アイテムの制御切り替え（空間の遊び用→通常用）
				SetEventFlg_("BFG_ARRANGE_FIELD_ITEM", true);
				
				// 勝利後共通処理
				// モンスターをフェードアウト
				SetManualCalcAlpha_(g_keyhole_npc, true);
				local task = Task_ObjectFadeOut_(g_keyhole_npc, FADE_DEF);
				WaitTask(task);
				
				// カメラ切り替えをするため、フェードアウト
				SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
				WaitFade_();
				// プレイヤーを映す
				SetVisible(player, true);
				// カメラを元に戻す
				SetPlayableCamera_();
				// フェードイン
				SetFade_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
				WaitFade_();
				
				// リアクター
				OpenMsgWnd_();
				SetTalkName_("NAME_TAG_REACTOR");
				ShowMsg_("MASTERS_LOAD_REACTOR_MSG_160");			// 「以上で　今回のマスターズロードは
				KeyInputWait_();
				CloseMsgWnd_();
				
				// フェードアウト
				SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
				WaitFade_();
				// 空間の遊び勝利でマップチェンジしたかどうかのフラグを設定
				SetEventFlg_("BFG_RETURN_SPACE_GIMMICK_WIN", true);
				// 配置したモンスターＮＰＣを削除するためにマップチェンジ
				ChangeMapPosDir_(info.MAP_ID, Vec3(info.XPOS_1, info.YPOS_1, info.ZPOS_1), info.DIR_1);
			}
		}
		// にげる
		else if(GetBattleEndType_() == END_TYPE_FLEE){
			// SPモンスターとの戦闘フラグを降ろす
			SetEventFlg_("BFG_CHECK_BATTLE_GOAL_MONSTER", false);
			SetEventFlg_("BFG_SPACE_GIMMICK_COUNTDOWN", false);
			// カメラを通常状態に戻します
			SetPlayableCamera_();
		}
		else{
			// 「敗北時」ここを通らないのでアフターバトルで処理
			SetEventFlg_("BFG_CHECK_BATTLE_GOAL_MONSTER", false);
			SetEventFlg_("BFG_SPACE_GIMMICK_COUNTDOWN", false);
		}
	} else {
		// 空間の遊び勝利でマップチェンジしてきた時にメッセージを出す
		if(GetEventFlg_("BFG_RETURN_SPACE_GIMMICK_WIN")){
			// メッセージだけ出すため、3D面にフェード
			SetFadePlane_(FADE_PLANE.PLANE_3D);
			SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
			SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
			WaitFade_();
			
			// システムメッセージ
			OpenMsgWnd_();
			ShowMsg_("MASTERS_LOAD_SYSTEM_MSG_140");			// マスターズロードの　入口へと　飛ばされた！
			KeyInputWait_();
			CloseMsgWnd_();
			// 空間の遊び勝利でマップチェンジしたかどうかのフラグをおろす
			SetEventFlg_("BFG_RETURN_SPACE_GIMMICK_WIN", false);
			
			// フェードイン
			SetFade_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
			SetFadeSub_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
			WaitFade_();
		}
	}
}


//======================================================
// マスターズロード：開始地雷 接触処理
//------------------------------------------------------
// 引数  ：info		マスターズロード情報
// 戻り値：なし
//======================================================
function MastersLoad_MineStart(info)
{
	// ギミックに主人公を向ける
	CommPlayerTurnAroundObj(g_keyhole);
	// ギミック起動フラグをチェック
	local gim_start_flg = GetEventFlg_(info.GIMMICK_FLG);
	// ギミック初回クリアフラグをチェック
	local gim_clear_flg = GetEventFlg_(info.GIMMICK_CLEAR_FLG);
	// 遺跡のカギ（仮）を持っているかをチェック
	local check_item_num = GetItemNum_(info.GIMMICK_KEY_ID);
	DebugPrint("遺跡のカギ（仮）は " + check_item_num + " 個です。");
	
	if(check_item_num >= 1){
		if(gim_start_flg == false){
			// メッセージ
			OpenMsgWnd_();
			ShowMsg_("MASTERS_LOAD_SYSTEM_MSG_010");		// 古びた　遺跡がある。
			KeyInputWait_();
			SetExchangeItemName_(info.GIMMICK_KEY_ID);
			ShowMsg_("MASTERS_LOAD_SYSTEM_MSG_030");		// 持っている　○アイテム名○が
			KeyInputWait_();
			CloseMsgWnd_();
			// メッセージ
			CommReactorActionNotice();		// リアクター反応があった時の共通処理
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_REACTOR");
			SetExchangeItemName_(info.GIMMICK_KEY_ID);
			ShowMsg_("MASTERS_LOAD_REACTOR_MSG_010");		//「マスターズロードについて
			KeyInputWait_();
			SetExchangeItemName_(info.GIMMICK_KEY_ID);
			ShowMsg_(info.GIMMICK_MSG_ID);		//「○○ランクの　マスターズロードを
			KeyInputWait_();
			CloseMsgWnd_();
			CommResetPlayerMotion();		// モーションを待機状態に戻す共通処理
			// 「はい」
			if(GetQueryResult_() == QUERY2_0){
				// 宝箱配置フラグ
				if(gim_clear_flg == true){
					SetEventFlg_("BFG_SPACE_TREASURE_UNLOCK", true);
				}else{
					SetEventFlg_("BFG_SPACE_TREASURE_UNLOCK", false);
				}
				// 地雷削除
				DeleteEventMine_(g_keyhole_mine);
				// メッセージ
				OpenMsgWnd_();
				SetExchangeItemName_(info.GIMMICK_KEY_ID);
				ShowMsg_("MASTERS_LOAD_SYSTEM_MSG_040");		// 遺跡に○アイテム名○（仮）を使った！
				KeyInputWait_();
				CloseMsgWnd_();
				// SE再生
				PlaySE_("SE_FLD_065");		// 浮島の遺跡スイッチ起動
				// 起動アニメ
				SetMotion_(g_keyhole, MOT_GIMMICK_1, BLEND_M);
				Wait_(30);
				// 石碑は光らない
				SetMotion_(g_keyhole, MOT_GIMMICK_2, BLEND_M);
				Wait_(30);
				// フェードアウト
				SetFadePlane_(FADE_PLANE.PLANE_3D);
				SetFade_(FADE_OUT, FADE_COLOR_BLACK, 15);
				SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, 15);
				WaitFade_();
				Wait_(10);
				
				// 空間遊びギミックの開始準備
				SetEventFlg_(info.GIMMICK_FLG, true);			// 空間の遊びギミック起動フラグ
				SetEventFlg_("BFG_ARRANGE_FIELD_ITEM", false);	// 配置アイテムの制御切り替え（通常用 → 空間の遊び用）
				
				// 対戦モンスターをＮＰＣとして配置
				local id_sp_monster;
				if(gim_start_flg == true){
					if(gim_clear_flg == false){
						// 初回
						id_sp_monster = ReadNpc_(info.BOSS_ID_1);
					}
					else{
						// ２回目以降
						id_sp_monster = ReadNpc_(info.BOSS_ID_2);
					}
					g_keyhole_npc = ArrangePointNpc_(id_sp_monster, "g_keyhole_npc");
					if(gim_clear_flg == false){
						// 初回
						SetScaleSilhouette(g_keyhole_npc, info.BOSS_SCALE_1, info.BOSS_SILHOUETTE_1);
					}
					else{
						// ２回目以降
						SetScaleSilhouette(g_keyhole_npc, info.BOSS_SCALE_2, info.BOSS_SILHOUETTE_2);
					}
					//SetReactorMsg_(g_keyhole_npc, ""); // リアクターメッセージは未設定
					SetTalkEnable_(g_keyhole_npc, false);
				}
				// デモ再生後の主人公の復帰位置
				SetReturnDemoPosDir_(Vec3(info.XPOS_1, info.YPOS_1, info.ZPOS_1), info.DIR_1);
				WeatherTimeChangeDemo(info.DEMO_NUM);	// 天候と時間をデモに引き継ぐ
			}
			// 「いいえ」
			else{
				// 特になにもしない
			}
		}
		// 遺跡スイッチ起動中
		else{
			// システムメッセージ表示
			OpenMsgWnd_();
			ShowMsg_("MASTERS_LOAD_SYSTEM_MSG_050");	// リアクターが　反応した！
			KeyInputWait_();
			CloseMsgWnd_();
			// リアクターメッセージ表示
			CommReactorActionNotice();					// リアクター反応があった時の共通処理
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_REACTOR");
			ShowMsg_("MASTERS_LOAD_REACTOR_MSG_020");	// 機能を終了するかの　確認がありました。
			KeyInputWait_();
			CloseMsgWnd_();
			CommResetPlayerMotion();					// モーションを待機状態に戻す共通処理
			// 「はい」
			if(GetQueryResult_() == QUERY2_0){
				// 地雷削除
				DeleteEventMine_(g_keyhole_mine);
				// SE再生
				PlaySE_("SE_FLD_071");
				// 終了アニメ
				SetMotion_(g_keyhole, MOT_GIMMICK_3, BLEND_M);
				Wait_(30);
				// 空間遊びギミックの終了準備
				SetEventFlg_(info.GIMMICK_FLG, false);			// 空間の遊びギミック起動フラグ
				SetEventFlg_("BFG_ARRANGE_FIELD_ITEM", true);	// 配置アイテムの制御切り替え（通常用 → 空間の遊び用）
				// フェードアウト
				SetFadePlane_(FADE_PLANE.PLANE_3D);
				SetFade_(FADE_OUT, FADE_COLOR_BLACK, 15);
				SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, 15);
				WaitFade_();
				Wait_(10);
				// メッセージ表示
				OpenMsgWnd_();
				ShowMsg_("MASTERS_LOAD_SYSTEM_MSG_060");		// マスターズロードが　機能を停止した！
				KeyInputWait_();
				CloseMsgWnd_();
				// カウントダウン表示のフラグを降ろす
				SetEventFlg_("BFG_SPACE_GIMMICK_COUNTDOWN", false);
				// 配置したモンスターＮＰＣを削除するためにマップチェンジ
				ChangeMapPosDir_(info.MAP_ID, Vec3(info.XPOS_1, info.YPOS_1, info.ZPOS_1), info.DIR_1);
			}
		}
	}
	// 遺跡の鍵を持っていない場合
	else{
		// メッセージ表示
		OpenMsgWnd_();
		ShowMsg_("MASTERS_LOAD_SYSTEM_MSG_010");			// 古びた　遺跡がある。
		KeyInputWait_();
		ShowMsg_("MASTERS_LOAD_SYSTEM_MSG_020");			// 調べてみても　反応はないようだ……。
		KeyInputWait_();
		CloseMsgWnd_();
	}
}


//======================================================
// マスターズロード：ゴール地雷 接触処理
//------------------------------------------------------
// 引数  ：info		マスターズロード情報
// 戻り値：なし
//======================================================
function MastersLoad_MineGoal(info)
{
	// ギミック初回クリアフラグをチェック
	local gim_clear_flg = GetEventFlg_(info.GIMMICK_CLEAR_FLG);
	// プレイヤーID取得
	local player = GetPlayerId_();
	
	// モンスターの方向に向ける
	CommPlayerTurnAroundObj(g_keyhole_npc);
	
	// 「FINISH」を出す
	LoadLayout_("masters_road");
	PlaySE_("SE_FLD_003");						// レース・タイムアップ
	SetLayoutAnime_("race_finish", false);
	WaitLayoutAnime();
	
	//フェードアウト
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
	SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
	WaitFade_();
	// 主人公とゴールポイントを見えなくする
	SetVisible(player, false);
	SetVisible(g_keyhole_goal_point, false);
	// カメラを設置
	SetPointCameraEye_(info.CAMERA_EYE);
	SetPointCameraTarget_(info.CAMERA_TGT);
	//フェードイン
	SetFade_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
	WaitFade_();
	
	// リアクター反応音
	PlaySE_("SE_FLD_135");
	Wait_(45);
	// リアクターメッセージ
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_REACTOR");
	// 1回目
	if(gim_clear_flg == false){
		ShowMsg_("MASTERS_LOAD_REACTOR_MSG_110");	// 「ゴールキーパーと戦い　勝利すれば
	}
	// 2回目以降
	else{
		ShowMsg_("MASTERS_LOAD_REACTOR_MSG_120");	// 「５ターン以内で　ゴールキーパーに　勝利すれば
	}
	KeyInputWait_();
	CloseMsgWnd_();
	// システム
	OpenMsgWnd_();
	SetExchangeMonsterKindName_(info.BOSS_EXCHANGE_ID);
	ShowMsg_("MASTERS_LOAD_SYSTEM_MSG_110");		// 戦いますか？
	KeyInputWait_();
	CloseMsgWnd_();
	// 「はい」
	if(GetQueryResult_() == QUERY2_0){
		// 戦闘モーション
		PlaySE_("SE_FLD_088");
		SetMotion_(g_keyhole_npc, MOT_ATTACK, BLEND_N);
		Wait_(30);
		// 空間の遊び用に設置したゴールモンスターと戦ったかフラグを追加
		SetEventFlg_("BFG_CHECK_BATTLE_GOAL_MONSTER", true);
		// ライドしたまま戦闘に入るとハングするので地雷を消してIDの初期化を行う
		DeleteEventMine_(g_keyhole_goal_mine);
		g_keyhole_goal_mine = C_NONE_ID;
		InhibitMonsterGenerate_( 10000.0 );	// 周囲の徘徊モンスターを削除
		// 戦う
		if(gim_clear_flg == false){ ChangeBattleParty_(info.BOSS_PARTY_TABLE_1); }// 1回目
		if(gim_clear_flg == true){  ChangeBattleParty_(info.BOSS_PARTY_TABLE_2); }// 2回目以降
	}
	// 「いいえ」
	else{
		// フェードアウト
		SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
		WaitFade_();
		// プレイヤーを映す
		SetVisible(player, true);
		// カメラを通常状態に戻す
		SetPlayableCamera_();
		SetCameraDir_(info.DIR_2);
		// 主人公をモンスターから離れたところに配置
		SetPos_(player, Vec3(info.XPOS_2, info.YPOS_2, info.ZPOS_2));
		SetDir_(player, info.DIR_2);
		
		// ゴールエフェクトを再表示
		SetVisible(g_keyhole_goal_point, true);
		
		// フェードイン
		SetFade_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
		SetFadeSub_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
		WaitFade_();
	}
}

