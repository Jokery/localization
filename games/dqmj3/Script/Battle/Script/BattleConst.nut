//定数定義

//関数管理用
FUNCTION_STACK <- 0;

//DebugPrintFlag
const	DEBUG_CACTIONPRINTFLAG = "true";

// モンスターモーションID定義=====
const MOT_WAIT					= 0;				// 待機（ループ）
const MOT_MOVE_LOOP				= 1;				// 走り（ループ）
const MOT_WALK_LOOP				= 2;				// 歩き（ループ）
const MOT_JUMP_UP				= 3;				// ジャンプ（上昇中）
const MOT_JUMP_DOWN				= 4;				// ジャンプ（下降中）
const MOT_DAMAGE				= 7;				// ダメージ
const MOT_ATTACK				= 8;				// 攻撃
const MOT_PARTICULAR_START		= 9;				// 特殊（開始）
const MOT_PARTICULAR_CHANT 		= 10;				// 特殊（詠唱）
const MOT_PARTICULAR_EXERCISE	= 11;				// 特殊（発動）
const MOT_SWORD_START			= 12;				// 剣技（開始）
const MOT_SWORD_CHARGE			= 13;				// 剣技（溜め中）
const MOT_SWORD_EXERCISE		= 14;				// 剣技（発動）

// マスターモーションID定義
const MOT_SLIP					= 7;				// しりもち開始
const MOT_SLIP_LOOP				= 8;				// しりもちループ
const MOT_SCOUT					= 9;				// スカウト開始
const MOT_SCOUT_LOOP			= 10;				// スカウトループ
const MOT_BATTLE_WAIT			= 11;				// 戦闘待機
const MOT_WIN					= 12;				// 戦闘勝利
const MOT_WIN_LOOP				= 13;				// 戦闘勝利ループ
const MOT_LOSE					= 14;				// 戦闘敗北
const MOT_USE_ITEM				= 15;				// アイテム使用
const MOT_USE_ITEM_LOOP			= 16;				// アイテム使用ループ
const MOT_CHANGE_RIDE			= 17;				// ライド乗り換え

// 仕様配置データ==================
const PERSONAL_POINT_DATA		= 0;
const BATTLE_COMMON_POINT_DATA	= 1;

// ポップの配置座標==============
gPopMaxNum	<- 4

// カットインの種類==============
const CUTIN_RIDE_LINK			= 1;				// ライド連携
const CUTIN_SCOUT				= 2;				// スカウトアタック

// 生存タイプ====================
enum LIVETYPE{
	ACTIVE			// 生きている
	INACTIVE		// 死んでいる
	NONE			// その他（パーティとして存在しない、等）
}

// 動作種類======================
enum EFFICACY{
	NONE			// なし
	ATTACK			// 攻撃
	WEAK			// 弱体
	SUPPORT			// 強化
	HEAL 			// 回復
	DEFENSE			// 防御
	OTHER			// その他
}

// 行動分類======================
enum CATEGORY{
	NONE		// なし
	PHYSICAL	// 物理
	SPELL		// 呪文
	ARTS		// 体技
	BREATH		// ブレス
	DANCE		// 踊り
	FEAT		// 特性
	ITEM		// アイテム
	OTHER		// その他
}

// 失敗分類======================
enum EXEC_MISS_TYPE{
	NONE			// なし
	LACK_MP			// ＭＰ不足
	MIST			// 霧
	DIFFERENT_SIZE	// サイズ違い
	OVERLAP			// 相殺
	MISS			// 発動条件を満たしていない
	LACK_TS			// テンション不足
	AES_MISS		// AESの行動をミスした
}

// ポップの種類===================
enum POPSTYLE{
	DAMAGE_ALLY		// 敵に与えるダメージ
	DAMAGE_ENEMY	// 敵から受けるダメージ
	DAMAGE_MP		// MPダメージ
	TENSION_UP		// テンション上昇
	TENSION_DOWN	// テンション下降
	HEAL_HP			// HP回復
	HEAL_MP			// MP回復
	NONE			// 背景無し(状態異常失敗など)
}

// モンスターが受ける影響の種類===
enum AFFECT_PARAM{
	NONE		// なし
	MAX_HP		// 最大HP
	MAX_MP		// 最大MP
	HP			// HP
	MP			// MP
	AT			// 攻撃
	DF			// 守備
	QC			// 素早さ
	WS			// 賢さ
	TS			// テンション
	HMP			// HPとMP
}

// 対象
enum TARGET
{
	NONE				// なし
	ALLY				// 味方
	ALLY_ALL			// 味方全員
	ALLY_RANDOM 		// 味方ランダム
	ALLY_MULTI_RANDOM 	// 味方複数ランダム
	ALLY_ENEMY			// 敵味方単体
	ALL					// 全員
	ENEMY				// 敵
	ENEMY_ALL			// 敵全員
	ENEMY_RANDOM		// 敵ランダム
	BAKURETSU			// 2回目以降ランダム
	SELF				// 自分自身
	RANDOM				// 全員ランダム
	FIELD				// フィールド
	OTHER				// その他
}

//PartyType_enum
enum PARTYTYPE{
	S4
	S3
	S2
	S1
	SG
	GS
	G1
	T1
}

//どの陣営が先制したか
enum PREEMPTSIDE{
	NONE
	ALLY
	ENEMY
}

//マスターの種類
enum MASTER_KIND{
	NONE
	PLAYER
	NOTYORIN
	NOTYORA_WOMEN
	KING
	JACK
	ACE
	ADVENTURER
	ADVENTURER_BLUE
	ADVENTURER_GREEN
	ADVENTURER_YELLOW
	ADVENTURER_ORANGE
	ADVENTURER_PURPLE
	ADVENTURER_BLACK
	QUEEN
	RENATE
	RUKIYA
	DARK_MASTER
	RESISTANCE_MAN
	RESISTANCE_WOMAN
	RESISTANCE_GENTLEMAN
	IMMIGRANT_MAN
	IMMIGRANT_WOMAN
	IMMIGRANT_BOY
	COOL
	SYNTHE
	PROMETHEUS
	MII
}	

//Motion再生時間待ち
const	ATTACKMOTIONWAIT = 21;

// ステータスの種類===
enum	STATUS{
	 NONE				// 00:なし
	 TENSION			// 01:テンション
	 ATTACK				// 02:攻撃力
	 DEFENCE			// 03:守備力
	 QUICK				// 04:素早さ
	 WISE				// 05:賢さ
	 CONFUSION			// 06:混乱
	 SLEEP				// 07:眠り
	 PARALYSIS			// 08:マヒ
	 MIND				// 09:休み
	 POISON				// 10:毒
	 CURSE				// 11:呪い
	 DEATH				// 12:死亡
	 ERASE				// 13:蘇生不可
	 HPMAX_DOWN			// 14:最大HP減少
	 MPMAX_DOWN			// 15:最大MP減少
	 HIT				// 16:命中
	 DODGE				// 17:回避
	 MAHOHACK			// 18:耐性
	 DUMMY_01			// 19:効果(ダミー)
	 FEAT_UP			// 20:特性発動率
	 CHANGE				// 21:ステータス交換
	 INCITE				// 22:対象固定(ちょうはつ)
	 HIDE				// 23:対象除外(かくれる)
	 TACTICS_SEAL		// 24:作戦封じ
	 NOTICE_DEATH		// 25:死亡予告	
	 GUARD				// 26:防御
	 DUMMY_02			// 27:大防御
	 DESPERATE			// 28:ダメージ２倍(捨て身)
	 INHALEBREATH		// 29:息ダメージ補正
	 ATACANTA			// 30:物理反射
	 MAHOCANTA			// 31:呪文反射
	 TENCHI				// 32:物理反射(１回)
	 MAHOTURN			// 33:呪文反射(１回)
	 KYOTENDOCHI		// 34:体技反射(１回)
	 REVERSEWIND		// 35:息反射(一回)
	 REVERSETURN		// 36:踊り反射(一回)
	 PREDICT_PHYSICAL	// 37:物理予測
	 PREDICT_SPELL		// 38:呪文予測
	 PREDICT_ARTS		// 39:体技予測
	 PREDICT_BREATH		// 40:息予測
	 PREDICT_DANCE		// 41:踊り予測
	 PREDICT_RECORD		// 42:記録反射
	 PREDICT_FIELD		// 43:場状態予測
	 ASTRON				// 44:効果無効
	 CURTAIN			// 45:効果無効（1回限り）
	 SWAPTARGET			// 46:対象交換
	 REHOIMI			// 47:継続回復
	 REZAORAL			// 48:自動蘇生
	 eSTATUS_FANATICISM // 49:狂信
	 CHAIN				// 50:チェイン
	 DUMMY_05			// 51:体技無効
	 DUMMY_06			// 52:回復無効
	 DUMMY_07			// 53:上限無効
	 DUMMY_08			// 54:行動順逆転
	 DUMMY_09			// 55:行動順ランダム
	 DUMMY_10			// 56:行動回数制限
	 DUMMY_04			// 57:行動順連結
	 DECREACE_ATTACK	// 58:攻撃力減少
	 DECREACE_DEFENCE	// 59:守備力減少
	 DECREACE_SPEED		// 60:素早さ減少
	 DECREACE_WISE		// 61:賢さ減少
	 ANGRY				// 62:怒り
	 LUCKY				// 63:ラッキー
	 SUPERLUCKY			// 64:スーパーラッキー
	 UNLUCKY			// 65:アンラッキー
	 DEADACTION			// 66:死亡時行動
	 DUMMY_11			// 67:いやしの雨（発動中）
	 DUMMY_12			// 68:せいれいのうた（発動中）
	 STEALTHATTACK		// 69:ステルスアタック（発動中）
	 DUMMY_14			// 70:星うらない（発動中）
	 DUMMY_15			// 71:せいけんづき（発動中）
	 HEALINGE_FLUTE		// 72:いやしのふえ（発動中）
	 REPOSE_FLUTE		// 73:やすらぎのふえ（発動中）
	 FIGHT_FLUTE		// 74:たたかいのふえ（発動中）
	 GUARD_FLUTE		// 75:まもりのふえ（発動中）
	 FALCON_FLUTE		// 76:ハヤブサのふえ（発動中）
	 WISE_FLUTE			// 77:ちしきのふえ（発動中）
	 RIDE				// 78:ライド
}
const	STATUS_NUM				= 78// ステータスの個数
const	STATUS_TOP				= 1 // ステータスの先頭

enum FIELD
{
	NORMAL,		// 通常

	REVERS,		// リバース
	SHUFFLE,	// シャッフル
	SLOW,		// スローペース
	
	REDMIST,	// 赤い霧
	BLACKMIST,	// 黒い霧
	WHITEMIST,	// 白い霧
	DARKMIST,	// 冥界の霧
	BLUEMIST,	// 青天井の霧

	FAINTNESS,	// だつりょくの場
	CRUSH,		// ふんさいの場
	SLOW,		// どんそくの場
	INNOCENT,	// じゅんしんの場
};

enum RIDE_MOTION_ID
{
	WAIT,
	WALK,
};

const INVALID_CHARACTER			= 0;				// 無効なキャラクターインデックス

const	REVIVAL_EFFECT_NAME 	= "EF120_01_HOIMI";
const	HOLD_ON_EFFECT_NAME 	= "EF040_01_PROP_MOUJYA";
const	LIVING_DEAD_EFFECT_NAME = "EF040_01_PROP_MOUJYA";

// イベント関連======================
const	BFG_TUTORIAL_RIDE = 50;
const	NUM_FLG_COUNT_UP_DEMO_834 = 124;

enum DARS_GALMA_FORM
{
	FIRST	// 第一形態
	SECOND	// 第二形態
	THIRD	// 第三形態
}

