//状態ステータス変化時の各種設定
gStateData <- [
	//フォーマット
	//{ Name			= "STATUS_NONE"		:ステータスの名前を記載します。
	//	Effect			= "EF010_01_HIT" ,	:表示するエフェクトの種類
	//	Motion			= "MOT_DAMAGE",		表示するモーションの種類
	//	Wait			= 0 ,				:Waitの時間（0の場合は、Waitなし）
	//	PopVisible		= false ,			:Popを表示するか？
	//	PopKind			= null ,			:表示するポップの種類
	//	MissPop			= true , 			:ミスした場合に、ミスポップを表示するか？
	//	NonDamageWait	= false , 			:物理攻撃がない場合に、Waitを発生させるか？
	//	CameraChange	= false ,			:パラメータ変更時にカメラを切り替えるか？
	//	MessageVisible	= false ,			:パラメータ変更時にメッセージを表示させるか？
	//	MessageID		= false ,			:パラメータ変更時にメッセージを表示させるか？
	//
	//	Up_			: 上昇時の設定
	//	Down_		: 減少時の設定
	//
	
	// STATUS_NONE
	{	Name						= "STATUS_NONE"				,
		Up_Effect					= null						,
		Up_Motion					= null						,
		Up_Wait						= 0							,
		Up_MissPop					= false						,
		Down_Effect					= null						,
		Down_Motion					= null						,
		Down_Wait					= 0							,
		Down_MissPop				= false						,
		Reset_Wait					= 0							,
	},
	// STATUS_TENSION			テンション
	{	Name						= "STATUS_TENSION"			,
		Up_Effect					= null						,
		Up_Motion					= null						,
		Up_Wait						= 30						,
		Up_MissPop					= false						,
		Down_Effect					= null						,
		Down_Motion					= null						,
		Down_Wait					= 30						,
		Down_MissPop				= true						,
		Reset_Wait					= 30						,
	},
	// STATUS_ATTACK			攻撃力
	{	Name						= "STATUS_ATTACK"			,
		Up_Effect					= "EF130_01_BAIKIRUTO"		,
		Up_Motion					= null						,
		Up_Wait						= 30						,
		Up_MissPop					= false						,
		Down_Effect					= "EF130_03_HENATOSU"		,
		Down_Motion					= null						,
		Down_Wait					= 30						,
		Down_MissPop				= true						,
		Reset_Wait					= 30						,
	},
	// STATUS_DEFENCE			守備力
	{	Name						= "STATUS_DEFENCE"			,
		Up_Effect					= "EF130_05_SUKARA"			,
		Up_Motion					= null						,
		Up_Wait						= 30						,
		Up_MissPop					= true						,
		Down_Effect					= "EF130_07_RUKANI"			,
		Down_Motion					= null						,
		Down_Wait					= 30						,
		Down_MissPop				= true						,
		Reset_Wait					= 30						,
	},
	// STATUS_QUICK				素早さ
	{	Name						= "STATUS_QUICK"			,
		Up_Effect					= "EF130_09_PIORA"			,
		Up_Motion					= null						,
		Up_Wait						= 30						,
		Up_MissPop					= false						,
		Down_Effect					= "EF130_11_BIMIE"			,
		Down_Motion					= null						,
		Down_Wait					= 30						,
		Down_MissPop				= true						,
		Reset_Wait					= 30						,
	},
	// STATUS_WISE				賢さ
	{	Name						= "STATUS_WISE"				,
		Up_Effect					= "EF130_13_INTE"			,
		Up_Motion					= null						,
		Up_Wait						= 30						,
		Up_MissPop					= false						,
		Down_Effect					= "EF130_15_FOOL"			,
		Down_Motion					= null						,
		Down_Wait					= 30						,
		Down_MissPop				= true						,
		Reset_Wait					= 30						,
	},
	// STATUS_CONFUSION			混乱
	{	Name						= "STATUS_CONFUSION"		,
		Up_Effect					= null						,
		Up_Motion					= MOT_DAMAGE				,
		Up_Wait						= 30						,
		Up_MissPop					= true						,
		Down_Effect					= null						,
		Down_Motion					= null						,
		Down_Wait					= 30						,
		Down_MissPop				= false						,
		Reset_Wait					= 30						,
	},
	// STATUS_SLEEP				眠り
	{	Name						= "STATUS_SLEEP"			,
		Up_Effect					= null						,
		Up_Motion					= MOT_DAMAGE				,
		Up_Wait						= 30						,
		Up_MissPop					= true						,
		Down_Effect					= null						,
		Down_Motion					= null						,
		Down_Wait					= 30						,
		Down_MissPop				= false						,
		Reset_Wait					= 30						,
	},
	// STATUS_PARALYSIS			マヒ
	{	Name						= "STATUS_PARALYSIS"		,
		Up_Effect					= null						,
		Up_Motion					= MOT_DAMAGE				,
		Up_Wait						= 30						,
		Up_MissPop					= true						,
		Down_Effect					= null						,
		Down_Motion					= null						,
		Down_Wait					= 30						,
		Down_MissPop				= false						,
		Reset_Wait					= 30						,
	},
	// STATUS_MIND				休み
	{	Name						= "STATUS_MIND"				,
		Up_Effect					= null						,
		Up_Motion					= MOT_DAMAGE				,
		Up_Wait						= 30						,
		Up_MissPop					= true						,
		Down_Effect					= null						,
		Down_Motion					= null						,
		Down_Wait					= 30						,
		Down_MissPop				= true						,
		Reset_Wait					= 30						,
	},
	// STATUS_POISON			毒
	{	Name						= "STATUS_POISON"			,
		Up_Effect					= null						,
		Up_Motion					= MOT_DAMAGE				,
		Up_Wait						= 30						,
		Up_MissPop					= true						,
		Down_Effect					= null						,
		Down_Motion					= null						,
		Down_Wait					= 30						,
		Down_MissPop				= false						,
		Reset_Wait					= 30						,
	},
	// STATUS_CURSE				呪い
	{	Name						= "STATUS_CURSE"			,
		Up_Effect					= null						,
		Up_Motion					= MOT_DAMAGE				,
		Up_Wait						= 30						,
		Up_MissPop					= true						,
		Down_Effect					= null						,
		Down_Motion					= null						,
		Down_Wait					= 30						,
		Down_MissPop				= false						,
		Reset_Wait					= 30						,
	},
	// STATUS_DEATH				死亡
	{	Name						= "STATUS_DEATH"			,
		Up_Effect					= null						,
		Up_Motion					= MOT_DAMAGE				,
		Up_Wait						= 30						,
		Up_MissPop					= true						,
		Down_Effect					= null						,
		Down_Motion					= null						,
		Down_Wait					= 0							,
		Down_MissPop				= false						,
		Reset_Wait					= 0							,
	},
	// STATUS_ERASE				蘇生不可
	{	Name						= "STATUS_ERASE"			,
		Up_Effect					= null						,
		Up_Motion					= MOT_DAMAGE				,
		Up_Wait						= 30						,
		Up_MissPop					= true						,
		Down_Effect					= null						,
		Down_Motion					= null						,
		Down_Wait					= 0							,
		Down_MissPop				= false						,
		Reset_Wait					= 0							,
	},
	// STATUS_HPMAX_DOWN		最大HP減少
	{	Name						= "STATUS_HPMAX_DOWN"		,
		Up_Effect					= null						,
		Up_Motion					= null						,
		Up_Wait						= 0							,
		Up_MissPop					= false						,
		Down_Effect					= null						,
		Down_Motion					= null						,
		Down_Wait					= 0							,
		Down_MissPop				= false						,
		Reset_Wait					= 0							,
	},
	// STATUS_MPMAX_DOWN		最大MP減少
	{	Name						= "STATUS_MPMAX_DOWN"		,
		Up_Effect					= null						,
		Up_Motion					= null						,
		Up_Wait						= 0							,
		Up_MissPop					= false						,
		Down_Effect					= null						,
		Down_Motion					= null						,
		Down_Wait					= 0							,
		Down_MissPop				= false						,
		Reset_Wait					= 0							,
	},
	// STATUS_HIT				命中
	{	Name						= "STATUS_HIT"				,
		Up_Effect					= null						,
		Up_Motion					= null						,
		Up_Wait						= 0							,
		Up_MissPop					= true						,
		Down_Effect					= null						,
		Down_Motion					= MOT_DAMAGE				,
		Down_Wait					= 45						,
		Down_MissPop				= true						,
		Reset_Wait					= 0							,
	},
	// STATUS_DODGE				回避
	{	Name						= "STATUS_DODGE"			,
		Up_Effect					= null						,
		Up_Motion					= null						,
		Up_Wait						= 0							,
		Up_MissPop					= true						,
		Down_Effect					= null						,
		Down_Motion					= null						,
		Down_Wait					= 45						,
		Down_MissPop				= true						,
		Reset_Wait					= 0							,
	},
	// STATUS_MAHOHACK			耐性
	{	Name						= "STATUS_MAHOHACK"			,
		Up_Effect					= null						,
		Up_Motion					= null						,
		Up_Wait						= 45						,
		Up_MissPop					= false						,
		Down_Effect					= null						,
		Down_Motion					= MOT_DAMAGE				,
		Down_Wait					= 45						,
		Down_MissPop				= true						,
		Reset_Wait					= 0							,
	},
	// STATUS_DUMMY_01			効果(ダミー)
	{	Name						= "STATUS_DUMMY_01"			,
		Up_Effect					= null						,
		Up_Motion					= null						,
		Up_Wait						= 45						,
		Up_MissPop					= false						,
		Down_Effect					= null						,
		Down_Motion					= MOT_DAMAGE				,
		Down_Wait					= 45						,
		Down_MissPop				= false						,
		Reset_Wait					= 0							,
	},
	// STATUS_FEAT_UP			特性発動率
	{	Name						= "STATUS_FEAT_UP"			,
		Up_Effect					= null						,
		Up_Motion					= null						,
		Up_Wait						= 45						,
		Up_MissPop					= false						,
		Down_Effect					= null						,
		Down_Motion					= MOT_DAMAGE				,
		Down_Wait					= 45						,
		Down_MissPop				= false						,
		Reset_Wait					= 0							,
	},
	// STATUS_CHANGE			ステータス交換
	{	Name						= "STATUS_CHANGE"			,
		Up_Effect					= null						,
		Up_Motion					= null						,
		Up_Wait						= 45						,
		Up_MissPop					= false						,
		Down_Effect					= null						,
		Down_Motion					= MOT_DAMAGE				,
		Down_Wait					= 45						,
		Down_MissPop				= false						,
		Reset_Wait					= 0							,
	},
	// STATUS_INCITE			対象固定(ちょうはつ)
	{	Name						= "STATUS_INCITE"			,
		Up_Effect					= null						,
		Up_Motion					= null						,
		Up_Wait						= 45						,
		Up_MissPop					= false						,
		Down_Effect					= null						,
		Down_Motion					= MOT_DAMAGE				,
		Down_Wait					= 45						,
		Down_MissPop				= false						,
		Reset_Wait					= 0							,
	},
	// STATUS_HIDE				対象除外(かくれる)
	{	Name						= "STATUS_HIDE"				,
		Up_Effect					= null						,
		Up_Motion					= null						,
		Up_Wait						= 45						,
		Up_MissPop					= false						,
		Down_Effect					= null						,
		Down_Motion					= MOT_DAMAGE				,
		Down_Wait					= 45						,
		Down_MissPop				= false						,
		Reset_Wait					= 0							,
	},
	// STATUS_TACTICS_SEAL		作戦封じ
	{	Name						= "STATUS_TACTICS_SEAL"		,
		Up_Effect					= null						,
		Up_Motion					= null						,
		Up_Wait						= 45						,
		Up_MissPop					= false						,
		Down_Effect					= null						,
		Down_Motion					= MOT_DAMAGE				,
		Down_Wait					= 45						,
		Down_MissPop				= false						,
		Reset_Wait					= 0							,
	},
	// STATUS_NOTICE_DEATH		死亡予告
	{	Name						= "STATUS_NOTICE_DEATH"		,
		Up_Effect					= null						,
		Up_Motion					= null						,
		Up_Wait						= 45						,
		Up_MissPop					= false						,
		Down_Effect					= null						,
		Down_Motion					= MOT_DAMAGE				,
		Down_Wait					= 45						,
		Down_MissPop				= false						,
		Reset_Wait					= 0							,
	},
	// STATUS_GUARD				防御
	{	Name						= "STATUS_GUARD"			,
		Up_Effect					= null						,
		Up_Motion					= null						,
		Up_Wait						= 45						,
		Up_MissPop					= false						,
		Down_Effect					= null						,
		Down_Motion					= MOT_DAMAGE				,
		Down_Wait					= 45						,
		Down_MissPop				= false						,
		Reset_Wait					= 0							,
	},	
	// STATUS_DUMMY_02			大防御
	{	Name						= "STATUS_DUMMY_02"			,
		Up_Effect					= null						,
		Up_Motion					= null						,
		Up_Wait						= 45						,
		Up_MissPop					= false						,
		Down_Effect					= null						,
		Down_Motion					= MOT_DAMAGE				,
		Down_Wait					= 45						,
		Down_MissPop				= false						,
		Reset_Wait					= 0							,
	},
	// STATUS_DESPERATE			ダメージ２倍(捨て身)
	{	Name						= "STATUS_DESPERATE"		,
		Up_Effect					= null						,
		Up_Motion					= null						,
		Up_Wait						= 45						,
		Up_MissPop					= false						,
		Down_Effect					= null						,
		Down_Motion					= MOT_DAMAGE				,
		Down_Wait					= 45						,
		Down_MissPop				= false						,
		Reset_Wait					= 0							,
	},
	// STATUS_INHALEBREATH		息ダメージ補正
	{	Name						= "STATUS_INHALEBREATH"		,
		Up_Effect					= null						,
		Up_Motion					= null						,
		Up_Wait						= 45						,
		Up_MissPop					= false						,
		Down_Effect					= null						,
		Down_Motion					= MOT_DAMAGE				,
		Down_Wait					= 45						,
		Down_MissPop				= false						,
		Reset_Wait					= 30						,
		Reset_Wait					= 0							,
	},
	// STATUS_ATACANTA			物理反射
	{	Name						= "STATUS_ATACANTA"			,
		Up_Effect					= null						,
		Up_Motion					= null						,
		Up_Wait						= 0							,
		Up_MissPop					= false						,
		Down_Effect					= null						,
		Down_Motion					= MOT_DAMAGE				,
		Down_Wait					= 0							,
		Down_MissPop				= false						,
		Reset_Wait					= 0							,
	},
	// STATUS_MAHOCANTA			呪文反射	
	{	Name						= "STATUS_MAHOCANTA"		,
		Up_Effect					= null						,
		Up_Motion					= null						,
		Up_Wait						= 45						,
		Up_MissPop					= false						,
		Down_Effect					= null						,
		Down_Motion					= MOT_DAMAGE				,
		Down_Wait					= 0							,
		Down_MissPop				= false						,
		Reset_Wait					= 0							,
	},
	// STATUS_TENCHI			物理反射(１回)
	{	Name						= "STATUS_TENCHI"			,
		Up_Effect					= null						,
		Up_Motion					= null						,
		Up_Wait						= 45						,
		Up_MissPop					= false						,
		Down_Effect					= null						,
		Down_Motion					= MOT_DAMAGE				,
		Down_Wait					= 0							,
		Down_MissPop				= false						,
		Reset_Wait					= 0							,
	},
	// STATUS_MAHOTURN			呪文反射(１回)
	{	Name						= "STATUS_MAHOTURN"			,
		Up_Effect					= null						,
		Up_Motion					= null						,
		Up_Wait						= 45						,
		Up_MissPop					= false						,
		Down_Effect					= null						,
		Down_Motion					= MOT_DAMAGE				,
		Down_Wait					= 0							,
		Down_MissPop				= false						,
		Reset_Wait					= 0							,
	},
	// STATUS_KYOTENDOCHI		体技反射(１回)
	{	Name						= "STATUS_KYOTENDOCHI"		,
		Up_Effect					= null						,
		Up_Motion					= null						,
		Up_Wait						= 45						,
		Up_MissPop					= false						,
		Down_Effect					= null						,
		Down_Motion					= MOT_DAMAGE				,
		Down_Wait					= 0							,
		Down_MissPop				= false						,
		Reset_Wait					= 0							,
	},
	// STATUS_REVERSEWIND		息反射(一回)
	{	Name						= "STATUS_REVERSEWIND"		,
		Up_Effect					= null						,
		Up_Motion					= null						,
		Up_Wait						= 45						,
		Up_MissPop					= false						,
		Down_Effect					= null						,
		Down_Motion					= MOT_DAMAGE				,
		Down_Wait					= 0							,
		Down_MissPop				= false						,
		Reset_Wait					= 0							,
	},
	// STATUS_REVERSETURN		踊り反射(一回)
	{	Name						= "STATUS_REVERSETURN"		,
		Up_Effect					= null						,
		Up_Motion					= null						,
		Up_Wait						= 45						,
		Up_MissPop					= false						,
		Down_Effect					= null						,
		Down_Motion					= MOT_DAMAGE				,
		Down_Wait					= 0							,
		Down_MissPop				= false						,
		Reset_Wait					= 0							,
	},
	// STATUS_PREDICT_PHYSICAL	物理予測
	{	Name						= "STATUS_PREDICT_PHYSICAL"	,
		Up_Effect					= null						,
		Up_Motion					= null						,
		Up_Wait						= 45						,
		Up_MissPop					= false						,
		Down_Effect					= null						,
		Down_Motion					= MOT_DAMAGE				,
		Down_Wait					= 0							,
		Down_MissPop				= false						,
		Reset_Wait					= 0							,
	},
	// STATUS_PREDICT_SPELL		呪文予測
	{	Name						= "STATUS_PREDICT_SPELL"	,
		Up_Effect					= null						,
		Up_Motion					= null						,
		Up_Wait						= 45						,
		Up_MissPop					= false						,
		Down_Effect					= null						,
		Down_Motion					= MOT_DAMAGE				,
		Down_Wait					= 0							,
		Down_MissPop				= false						,
		Reset_Wait					= 0							,
	},
	// STATUS_PREDICT_ARTS		体技予測
	{	Name						= "STATUS_PREDICT_ARTS"		,
		Up_Effect					= null						,
		Up_Motion					= null						,
		Up_Wait						= 45						,
		Up_MissPop					= false						,
		Down_Effect					= null						,
		Down_Motion					= MOT_DAMAGE				,
		Down_Wait					= 0							,
		Down_MissPop				= false						,
		Reset_Wait					= 0							,
	},
	// STATUS_PREDICT_BREATH	息予測
	{	Name						= "STATUS_PREDICT_ARTS"		,
		Up_Effect					= null						,
		Up_Motion					= null						,
		Up_Wait						= 45						,
		Up_MissPop					= false						,
		Down_Effect					= null						,
		Down_Motion					= MOT_DAMAGE				,
		Down_Wait					= 0							,
		Down_MissPop				= false						,
		Reset_Wait					= 0							,
	},
	// STATUS_PREDICT_DANCE		踊り予測	
	{	Name						= "STATUS_PREDICT_DANCE"	,
		Up_Effect					= null						,
		Up_Motion					= null						,
		Up_Wait						= 45						,
		Up_MissPop					= false						,
		Down_Effect					= null						,
		Down_Motion					= MOT_DAMAGE				,
		Down_Wait					= 0							,
		Down_MissPop				= false						,
		Reset_Wait					= 0							,
	},
	// STATUS_PREDICT_RECORD	記録反射	
	{	Name						= "STATUS_PREDICT_RECORD"	,
		Up_Effect					= null						,
		Up_Motion					= null						,
		Up_Wait						= 45						,
		Up_MissPop					= false						,
		Down_Effect					= null						,
		Down_Motion					= MOT_DAMAGE				,
		Down_Wait					= 0							,
		Down_MissPop				= false						,
		Reset_Wait					= 0							,
	},
	// STATUS_PREDICT_FIELD		場状態予測
	{	Name						= "STATUS_PREDICT_FIELD"	,
		Up_Effect					= null						,
		Up_Motion					= null						,
		Up_Wait						= 45						,
		Up_MissPop					= false						,
		Down_Effect					= null						,
		Down_Motion					= MOT_DAMAGE				,
		Down_Wait					= 0							,
		Down_MissPop				= false						,
		Reset_Wait					= 0							,
	},
	// STATUS_ASTRON			効果無効
	{	Name						= "STATUS_ASTRON"			,
		Up_Effect					= null						,
		Up_Motion					= null						,
		Up_Wait						= 45						,
		Up_MissPop					= false						,
		Down_Effect					= null						,
		Down_Motion					= MOT_DAMAGE				,
		Down_Wait					= 0							,
		Down_MissPop				= false						,
		Reset_Wait					= 0							,
	},
	// STATUS_CURTAIN			効果無効（1回限り）
	{	Name						= "STATUS_CURTAIN"			,
		Up_Effect					= null						,
		Up_Motion					= null						,
		Up_Wait						= 45						,
		Up_MissPop					= false						,
		Down_Effect					= null						,
		Down_Motion					= MOT_DAMAGE				,
		Down_Wait					= 0							,
		Down_MissPop				= false						,
		Reset_Wait					= 0							,
	},
	// STATUS_SWAPTARGET		対象交換
	{	Name						= "STATUS_SWAPTARGET"		,
		Up_Effect					= null						,
		Up_Motion					= null						,
		Up_Wait						= 45						,
		Up_MissPop					= false						,
		Down_Effect					= null						,
		Down_Motion					= MOT_DAMAGE				,
		Down_Wait					= 0							,
		Down_MissPop				= false						,
		Reset_Wait					= 0							,
	},
	// STATUS_REHOIMI			継続回復
	{	Name						= "STATUS_REHOIMI"			,
		Up_Effect					= null						,
		Up_Motion					= null						,
		Up_Wait						= 45						,
		Up_MissPop					= false						,
		Down_Effect					= null						,
		Down_Motion					= MOT_DAMAGE				,
		Down_Wait					= 0							,
		Down_MissPop				= false						,
		Reset_Wait					= 0							,
	},
	// STATUS_REZAORAL			自動蘇生
	{	Name						= "STATUS_REZAORAL"			,
		Up_Effect					= null						,
		Up_Motion					= null						,
		Up_Wait						= 45						,
		Up_MissPop					= false						,
		Down_Effect					= null						,
		Down_Motion					= MOT_DAMAGE				,
		Down_Wait					= 0							,
		Down_MissPop				= false						,
		Reset_Wait					= 0							,
	},	
	// STATUS_DUMMY_03			物理無効
	{	Name						= "STATUS_DUMMY_03"			,
		Up_Effect					= null						,
		Up_Motion					= null						,
		Up_Wait						= 45						,
		Up_MissPop					= false						,
		Down_Effect					= null						,
		Down_Motion					= MOT_DAMAGE				,
		Down_Wait					= 0							,
		Down_MissPop				= false						,
		Reset_Wait					= 0							,
	},
	// STATUS_DUMMY_04			呪文無効
	{	Name						= "STATUS_DUMMY_04"			,
		Up_Effect					= null						,
		Up_Motion					= null						,
		Up_Wait						= 45						,
		Up_MissPop					= false						,
		Down_Effect					= null						,
		Down_Motion					= MOT_DAMAGE				,
		Down_Wait					= 0							,
		Down_MissPop				= false						,
		Reset_Wait					= 0							,
	},
	// STATUS_DUMMY_05			体技無効
	{	Name						= "STATUS_DUMMY_05"			,
		Up_Effect					= null						,
		Up_Motion					= null						,
		Up_Wait						= 45						,
		Up_MissPop					= false						,
		Down_Effect					= null						,
		Down_Motion					= MOT_DAMAGE				,
		Down_Wait					= 0							,
		Down_MissPop				= false						,
		Reset_Wait					= 0							,
	},
	// STATUS_DUMMY_06			回復無効
	{	Name						= "STATUS_DUMMY_06"			,
		Up_Effect					= null						,
		Up_Motion					= null						,
		Up_Wait						= 45						,
		Up_MissPop					= false						,
		Down_Effect					= null						,
		Down_Motion					= MOT_DAMAGE				,
		Down_Wait					= 0							,
		Down_MissPop				= false						,
		Reset_Wait					= 0							,
	},
	// STATUS_DUMMY_07			上限無効
	{	Name						= "STATUS_DUMMY_07"			,
		Up_Effect					= null						,
		Up_Motion					= null						,
		Up_Wait						= 45						,
		Up_MissPop					= false						,
		Down_Effect					= null						,
		Down_Motion					= MOT_DAMAGE				,
		Down_Wait					= 0							,
		Down_MissPop				= false						,
		Reset_Wait					= 0							,
	},
	// STATUS_DUMMY_08			行動順逆転
	{	Name						= "STATUS_DUMMY_08"			,
		Up_Effect					= null						,
		Up_Motion					= null						,
		Up_Wait						= 45						,
		Up_MissPop					= false						,
		Down_Effect					= null						,
		Down_Motion					= MOT_DAMAGE				,
		Down_Wait					= 0							,
		Down_MissPop				= false						,
		Reset_Wait					= 0							,
	},
	// STATUS_DUMMY_09			行動順ランダム
	{	Name						= "STATUS_DUMMY_09"			,
		Up_Effect					= null						,
		Up_Motion					= null						,
		Up_Wait						= 45						,
		Up_MissPop					= false						,
		Down_Effect					= null						,
		Down_Motion					= MOT_DAMAGE				,
		Down_Wait					= 0							,
		Down_MissPop				= false						,
		Reset_Wait					= 0							,
	},
	// STATUS_DUMMY_10			行動回数制限
	{	Name						= "STATUS_DUMMY_10"			,
		Up_Effect					= null						,
		Up_Motion					= null						,
		Up_Wait						= 45						,
		Up_MissPop					= false						,
		Down_Effect					= null						,
		Down_Motion					= MOT_DAMAGE				,
		Down_Wait					= 0							,
		Down_MissPop				= false						,
		Reset_Wait					= 0							,
	},
	// STATUS_CHAIN				行動順連結
	{	Name						= "STATUS_CHAIN"			,
		Up_Effect					= null						,
		Up_Motion					= null						,
		Up_Wait						= 45						,
		Up_MissPop					= false						,
		Down_Effect					= null						,
		Down_Motion					= MOT_DAMAGE				,
		Down_Wait					= 0							,
		Down_MissPop				= false						,
		Reset_Wait					= 0							,
	},
	// STATUS_DECREACE_ATTACK	攻撃力減少
	{	Name						= "STATUS_DECREACE_ATTACK"	,
		Up_Effect					= null						,
		Up_Motion					= null						,
		Up_Wait						= 45						,
		Up_MissPop					= false						,
		Down_Effect					= null						,
		Down_Motion					= MOT_DAMAGE				,
		Down_Wait					= 45						,
		Down_MissPop				= false						,
		Reset_Wait					= 0							,
	},
	// STATUS_DECREACE_DEFENCE	守備力減少
	{	Name						= "STATUS_DECREACE_DEFENCE"	,
		Up_Effect					= null						,
		Up_Motion					= null						,
		Up_Wait						= 45						,
		Up_MissPop					= false						,
		Down_Effect					= null						,
		Down_Motion					= MOT_DAMAGE				,
		Down_Wait					= 45						,
		Down_MissPop				= false						,
		Reset_Wait					= 0							,
	},
	// STATUS_DECREACE_SPEED	素早さ減少
	{	Name						= "STATUS_DECREACE_SPEED"	,
		Up_Effect					= null						,
		Up_Motion					= null						,
		Up_Wait						= 45						,
		Up_MissPop					= false						,
		Down_Effect					= null						,
		Down_Motion					= MOT_DAMAGE				,
		Down_Wait					= 45						,
		Down_MissPop				= false						,
		Reset_Wait					= 0							,
	},
	// STATUS_DECREACE_WISE		賢さ減少
	{	Name						= "STATUS_DECREACE_WISE"	,
		Up_Effect					= null						,
		Up_Motion					= null						,
		Up_Wait						= 45						,
		Up_MissPop					= false						,
		Down_Effect					= null						,
		Down_Motion					= MOT_DAMAGE				,
		Down_Wait					= 45						,
		Down_MissPop				= false						,
		Reset_Wait					= 0							,
	},
	// STATUS_ANGRY				怒り
	{	Name						= "STATUS_ANGRY"			,
		Up_Effect					= null						,
		Up_Motion					= null						,
		Up_Wait						= 45						,
		Up_MissPop					= false						,
		Down_Effect					= null						,
		Down_Motion					= MOT_DAMAGE				,
		Down_Wait					= 0							,
		Down_MissPop				= false						,
		Reset_Wait					= 0							,
	},
	// STATUS_LUCKY				ラッキー
	{	Name						= "STATUS_LUCKY"			,
		Up_Effect					= null						,
		Up_Motion					= null						,
		Up_Wait						= 45						,
		Up_MissPop					= false						,
		Down_Effect					= null						,
		Down_Motion					= MOT_DAMAGE				,
		Down_Wait					= 0							,
		Down_MissPop				= false						,
		Reset_Wait					= 0							,
	},
	// STATUS_SUPERLUCKY		スーパーラッキー
	{	Name						= "STATUS_SUPERLUCKY"		,
		Up_Effect					= null						,
		Up_Motion					= null						,
		Up_Wait						= 45						,
		Up_MissPop					= false						,
		Down_Effect					= null						,
		Down_Motion					= MOT_DAMAGE				,
		Down_Wait					= 0							,
		Down_MissPop				= false						,
		Reset_Wait					= 0							,
	},
	// STATUS_UNLUCKY			アンラッキー
	{	Name						= "STATUS_UNLUCKY"			,
		Up_Effect					= null						,
		Up_Motion					= null						,
		Up_Wait						= 45						,
		Up_MissPop					= false						,
		Down_Effect					= null						,
		Down_Motion					= MOT_DAMAGE				,
		Down_Wait					= 0							,
		Down_MissPop				= false						,
		Reset_Wait					= 0							,
	},
	// STATUS_DEADACTION		 死亡時行動
	{	Name						= "STATUS_DEADACTION"		,
		Up_Effect					= null						,
		Up_Motion					= null						,
		Up_Wait						= 45						,
		Up_MissPop					= false						,
		Down_Effect					= null						,
		Down_Motion					= MOT_DAMAGE				,
		Down_Wait					= 0							,
		Down_MissPop				= false						,
		Reset_Wait					= 0							,
	},
	// STATUS_DUMMY_11			いやしの雨（発動中）
	{	Name						= "STATUS_DUMMY_11"			,
		Up_Effect					= null						,
		Up_Motion					= null						,
		Up_Wait						= 45						,
		Up_MissPop					= false						,
		Down_Effect					= null						,
		Down_Motion					= MOT_DAMAGE				,
		Down_Wait					= 0							,
		Down_MissPop				= false						,
		Reset_Wait					= 0							,
	},
	// STATUS_DUMMY_12			せいれいのうた（発動中）
	{	Name						= "STATUS_DUMMY_12"			,
		Up_Effect					= null						,
		Up_Motion					= null						,
		Up_Wait						= 45						,
		Up_MissPop					= false						,
		Down_Effect					= null						,
		Down_Motion					= MOT_DAMAGE				,
		Down_Wait					= 0							,
		Down_MissPop				= false						,
		Reset_Wait					= 0							,
	},
	// STATUS_STEALTHATTACK		ステルスアタック（発動中）
	{	Name						= "STATUS_STEALTHATTACK"	,
		Up_Effect					= null						,
		Up_Motion					= null						,
		Up_Wait						= 45						,
		Up_MissPop					= false						,
		Down_Effect					= null						,
		Down_Motion					= MOT_DAMAGE				,
		Down_Wait					= 0							,
		Down_MissPop				= false						,
		Reset_Wait					= 0							,
	},
	// STATUS_DUMMY_14			星うらない（発動中）
	{	Name						= "STATUS_DUMMY_14"			,
		Up_Effect					= null						,
		Up_Motion					= null						,
		Up_Wait						= 45						,
		Up_MissPop					= false						,
		Down_Effect					= null						,
		Down_Motion					= MOT_DAMAGE				,
		Down_Wait					= 0							,
		Down_MissPop				= false						,
		Reset_Wait					= 0							,
	},
	// STATUS_DUMMY_15			せいけんづき（発動中）
	{	Name						= "STATUS_DUMMY_15"			,
		Up_Effect					= null						,
		Up_Motion					= null						,
		Up_Wait						= 45						,
		Up_MissPop					= false						,
		Down_Effect					= null						,
		Down_Motion					= MOT_DAMAGE				,
		Down_Wait					= 0							,
		Down_MissPop				= false						,
		Reset_Wait					= 0							,
	},
	// STATUS_HEALINGE_FLUTE	いやしのふえ（発動中）
	{	Name						= "STATUS_HEALINGE_FLUTE"	,
		Up_Effect					= null						,
		Up_Motion					= null						,
		Up_Wait						= 45						,
		Up_MissPop					= false						,
		Down_Effect					= null						,
		Down_Motion					= MOT_DAMAGE				,
		Down_Wait					= 0							,
		Down_MissPop				= false						,
		Reset_Wait					= 0							,
	},
	// STATUS_REPOS_EFLUTE		やすらぎのふえ（発動中）
	{	Name						= "STATUS_REPOS_EFLUTE"		,
		Up_Effect					= null						,
		Up_Motion					= null						,
		Up_Wait						= 45						,
		Up_MissPop					= false						,
		Down_Effect					= null						,
		Down_Motion					= MOT_DAMAGE				,
		Down_Wait					= 0							,
		Down_MissPop				= false						,
		Reset_Wait					= 0							,
	},
	// STATUS_FIGHT_FLUTE		たたかいのふえ（発動中）
	{	Name						= "STATUS_FIGHT_FLUTE"		,
		Up_Effect					= null						,
		Up_Motion					= null						,
		Up_Wait						= 45						,
		Up_MissPop					= false						,
		Down_Effect					= null						,
		Down_Motion					= MOT_DAMAGE				,
		Down_Wait					= 0							,
		Down_MissPop				= false						,
		Reset_Wait					= 0							,
	},
	// STATUS_GUARD_FLUTE		まもりのふえ（発動中）
	{	Name						= "STATUS_GUARD_FLUTE"		,
		Up_Effect					= null						,
		Up_Motion					= null						,
		Up_Wait						= 45						,
		Up_MissPop					= false						,
		Down_Effect					= null						,
		Down_Motion					= MOT_DAMAGE				,
		Down_Wait					= 0							,
		Down_MissPop				= false						,
		Reset_Wait					= 0							,
	},
	// STATUS_FALCON_FLUTE		ハヤブサのふえ（発動中）
	{	Name						= "STATUS_FALCON_FLUTE"		,
		Up_Effect					= null						,
		Up_Motion					= null						,
		Up_Wait						= 45						,
		Up_MissPop					= false						,
		Down_Effect					= null						,
		Down_Motion					= MOT_DAMAGE				,
		Down_Wait					= 0							,
		Down_MissPop				= false						,
		Reset_Wait					= 0							,
	},
	// STATUS_WISE_FLUTE		ちしきのふえ（発動中）
	{	Name						= "STATUS_WISE_FLUTE"		,
		Up_Effect					= null						,
		Up_Motion					= null						,
		Up_Wait						= 45						,
		Up_MissPop					= false						,
		Down_Effect					= null						,
		Down_Motion					= MOT_DAMAGE				,
		Down_Wait					= 0							,
		Down_MissPop				= false						,
		Reset_Wait					= 0							,
	}
];

//モンスター基本情報クラス
class cMonsterInfo
{
	Index = INVALID_CHARACTER;	//モンスターインデックス
	AllyFlag = false;			//敵味方判定
	Type = LIVETYPE.NONE;		//生存状態判定
	Size = SIZE_S;				//モンスターサイズ
	IsRide = false;				//ライド判定
	EffectSize = 1.0			//エフェクトアタッチ時の倍率
	HighRankEffectSize = 1.0	//回転する岩のエフェクトサイズ
	BigSizeFlag = false			//GSize以上か？
	PopDate_X = 0				//Pop表示位置(X)
	PopDate_Y = 0				//Pop表示位置(Y)
	constructor(Monster)
	{
		//DebugPrint("Class_ConstructorIN" + "_" + "cMonsterInfo");
		Index = Monster;
		if(Monster != INVALID_CHARACTER){
			AllyFlag = IsAlly_(Monster);
			Type = GetInitExistType_(Monster);
			if(Type != LIVETYPE.NONE){
				Size = GetMonsterSize_(Monster);
			}
			switch(Size)
			{
			case SIZE_S:
				EffectSize = 0.4;
				break;
			case SIZE_N:
				EffectSize = 0.6;
				break;
			case SIZE_M:
				EffectSize = 1.0;
				break;
			case SIZE_G:
				EffectSize = 2.0;
				break;
			case SIZE_T:
				EffectSize = 2.4;
				break;
			default:
				break
			}
		}
		
		IsRide = IsRide_(Monster)
		
		//BigSizeFlag
		if(Size == SIZE_G || Size == SIZE_T){
			BigSizeFlag = true;
		}
		//HighRankEffectSize
		switch(Size)
		{
		case SIZE_S:
			HighRankEffectSize = 0.4;
			break;
		case SIZE_N:
			HighRankEffectSize = 0.6;
			break;
		case SIZE_M:
			HighRankEffectSize = 1.0;
			break;
		case SIZE_G:
			HighRankEffectSize = 3.7;
			break;
		case SIZE_T:
			HighRankEffectSize = 11.0;
			break;
		default:
			break
		}
		
		//PopDate
		switch(Size)
		{
		case SIZE_S:
			local BaseY = 40;
			local UpY = 18;
			PopDate_X = [0	,-20 , 20 ,-20 , 20	,-20];
			PopDate_Y = [BaseY ,BaseY + UpY , BaseY + (UpY*2) , BaseY + (UpY*3) ,BaseY + (UpY*4) ,BaseY + (UpY*5)];
			break;
		case SIZE_N:
			local BaseY = 55;
			local UpY = 18;
			PopDate_X = [0	,-20 , 20 ,-20 , 20	,-20];
			PopDate_Y = [BaseY ,BaseY + UpY , BaseY + (UpY*2) , BaseY + (UpY*3) ,BaseY + (UpY*4) ,BaseY + (UpY*5)];
			break;
		case SIZE_M:
			local BaseY = 65;
			local UpY = 18;
			PopDate_X = [0	,-20 , 20 ,-20 , 20	,-20];
			PopDate_Y = [BaseY ,BaseY + UpY , BaseY + (UpY*2) , BaseY + (UpY*3) ,BaseY + (UpY*4) ,BaseY + (UpY*5)];
			break;
		case SIZE_G:
			local BaseY = 50;
			local UpY = 18;
			PopDate_X = [0	,-20 , 20 ,-20 , 20	,-20];
			PopDate_Y = [BaseY ,BaseY + UpY , BaseY + (UpY*2) , BaseY + (UpY*3) ,BaseY + (UpY*4) ,BaseY + (UpY*5)];
			break;
		case SIZE_T:
			local BaseY = 50;
			local UpY = 18;
			PopDate_X = [0	,-20 , 20 ,-20 , 20	,-20];
			PopDate_Y = [BaseY ,BaseY + UpY , BaseY + (UpY*2) , BaseY + (UpY*3) ,BaseY + (UpY*4) ,BaseY + (UpY*5)];
			break;
		default:
			break
		}
		
		//DebugPrint("Class_ConstructorOUT" + "_" + "cMonsterInfo");
	}
}

//モンスターアクション情報クラス
class cTargetMonsterInfo extends cMonsterInfo
{
	//アクション情報専用
	IndexIs = -1;			//Is判定用インデックス
	IsCritical = null;		//クリティカル判定
	IsMiss = null;			//ミス判定
	IsDead = null;			//死亡判定
	IsGuard = null;			//防御判定
	IsAbsorption = null;	//吸収判定
	IsReflect = null;		//反射判定
	IsRevival = null;		//蘇生判定
	GetActHitNum = 0;		//ダメージ回数
	SingleFlag = false 		//単一対象の技か？
	IsPoisonDamage = null;	//毒ダメージ判定
	DamageValue	= null;		//ダメージ値
	StatusFlag = null;		//ステータス変化判定
	StatusValue = null;		//ステータス変化量
	StatusEndFlag = null;	//ステータス解除判定
	MultiStageCount	= 1;	//多段攻撃判定数
	
	constructor(Monster,MultiCount)
	{
		//DebugPrint("Class_ConstructorIN" + "_" + "cTargetMonsterInfo");
		
		if(Monster != INVALID_CHARACTER){
			//クラスの継承
			cMonsterInfo.constructor(Monster);
			//使用するクラスの読込
			local Count = 0;
			local ActNum;
			
			//IndexIsの作成
			//単体対象の場合は強制的に0を返す
			local SingleFlag = IsTargetSingle_(MultiCount);
			if(SingleFlag == true){
				local TargetCheck= GetTargetIndex_(MultiCount, 0);
				if(Monster == TargetCheck){
					IndexIs = 0;
				} else {
					IndexIs = -1;
					////DebugPrint("***************************************" + "\n");
					////DebugPrint("IndexIs設定エラー" + "\n");
					////DebugPrint("	Monster		:	" + Monster + "\n");
					////DebugPrint("	IndexIs		:	" + IndexIs + "\n");
					////DebugPrintt("	TargetCheck	:	" + TargetCheck + "\n");
					////DebugPrint("***************************************");
				}
			} else {
				local TargetNum = GetTargetNum_(MultiCount);
				local localTarget		= array(TargetNum);
				local localType			= array(TargetNum);
				local localStealthValue	= array(TargetNum);
				for(local i = 0 ; i < TargetNum ; i++ ){
					localTarget[i]			= GetTargetIndex_(MultiCount,i);
					localType[i]			= GetInitExistType_(localTarget[i]);
					localStealthValue[i]	= GetMonsterStatusValue_(STATUS.STEALTHATTACK,localTarget[i]);
					if(Monster > localTarget[i] && localType[i] == LIVETYPE.ACTIVE){
						//IndexIsでカウントしないのは
						//自分のMonsterIndexより後ろ
						//または、死んでいるモンスターの場合
						Count++;
					} else if(Monster > localTarget[i] && localStealthValue[i] == 1){
						//例外的にステルス状態のモンスターはカウントする
						Count++;
					}
				}
				IndexIs = Count;
			}
			
			MultiStageCount = GetActHitNum_(MultiCount, IndexIs);
			
			if(MultiStageCount > 0){
				IsCritical		= array(MultiStageCount);	//クリティカル判定
				IsMiss			= array(MultiStageCount);	//ミス判定
				IsDead			= array(MultiStageCount);	//死亡判定
				IsGuard			= array(MultiStageCount);	//防御判定
				IsAbsorption	= array(MultiStageCount);	//吸収判定
				IsReflect		= array(MultiStageCount);	//反射判定
				IsRevival		= array(MultiStageCount);	//蘇生判定
				IsPoisonDamage	= array(MultiStageCount);	//毒ダメージ判定
				DamageValue		= array(MultiStageCount);	//ダメージ値
				for(local i = 0 ; i < MultiStageCount ; i++){
					IsMiss[i]			= IsMiss_(MultiCount,IndexIs,i);
					IsCritical[i]		= IsCritical_(MultiCount,IndexIs,i);
					IsDead[i]			= IsDead_(MultiCount,IndexIs);
					IsAbsorption[i]		= IsAbsorb_(MultiCount , IndexIs);
					IsGuard[i]			= IsGuard_(MultiCount, IndexIs);
					IsReflect[i]		= IsReflect_(MultiCount, IndexIs);
					IsRevival[i]		= IsRevival_(MultiCount, IndexIs);
					IsPoisonDamage[i]	= IsPoisonDamage_(MultiCount, IndexIs);
					DamageValue[i]		= GetDamageValue_(MultiCount,IndexIs,i);
				}
			}
			
			if(MultiStageCount == 0){
				IsCritical		= array(1);					//クリティカル判定
				IsMiss			= array(1);					//ミス判定
				IsDead			= array(1);					//死亡判定
				IsGuard			= array(1);					//防御判定
				IsAbsorption	= array(1);					//吸収判定
				IsReflect		= array(1);					//反射判定
				IsRevival		= array(1);					//蘇生判定
				IsPoisonDamage	= array(1);					//毒ダメージ判定
				DamageValue		= array(1);					//ダメージ値
				//GetActHitNumが「０」の場合は、例外的にダミーの値を入れる
				//特性系で発生する？
				IsMiss[0]		= IsMiss_(MultiCount,IndexIs,0);
				IsCritical[0]	= IsCritical_(MultiCount,IndexIs,0);
				IsDead[0]		= IsDead_(MultiCount,IndexIs);
				IsAbsorption[0]	= IsAbsorb_(MultiCount,IndexIs);	//判定がないので一旦保留
				IsGuard[0]		= IsGuard_(MultiCount, IndexIs);
				IsReflect[0]	= IsReflect_(MultiCount, IndexIs);
				IsRevival[0]	= IsRevival_(MultiCount, IndexIs);
				DamageValue[0]	= GetDamageValue_(MultiCount,IndexIs,0);
			}
			
			StatusFlag		= array(STATUS_NUM);
			StatusValue		= array(STATUS_NUM);
			StatusEndFlag	= array(STATUS_NUM);
			for(local i = STATUS_TOP ; i < STATUS_NUM ; i++){
				StatusFlag[i] = GetStatusFlag_(i,MultiCount,IndexIs);
				StatusValue[i] = GetStatusValue_(i,MultiCount,IndexIs);
				StatusEndFlag[i] = GetStatusEndFlag_(i,MultiCount,IndexIs);
			}
		} else {
			//Monsterが不正な値の場合は何も行わない。
			print("++++++++++++++++++++++++" + "\n")
			print("     ERROR     " + "\n")
			print("cTargetMonsterInfo" + "\n")
			print("    ArgumentList" + "\n")
			print("       => " + "Monster    : " + Monster + "\n")
			print("       => " + "MultiCount : " + MultiCount +"\n")
			print("++++++++++++++++++++++++" + "\n")
		}
		//DebugPrint("Class_ConstructorOUT" + "_" + "cTargetMonsterInfo");
	}
	
}

//パーティ情報クラス
class cPartyInfo
{
	AllyFlag = false;			//敵味方判定
	PartyNum = 0;				//パーティ人数
	PartyType = 0;				//パーティ構成 関数：Get_ParyTypeで設定
								// 0	:	S4
								// 1	:	S3
								// 2	:	S2
								// 3	:	S1
								// 4	:	SG
								// 5	:	G1
								// 6	:	T1
	Index = null;				//モンスターインデックス
	Type = null;				//生存状態判定
	Size = null;				//サイズ
	IsRide = null				//ライド状態か判定
	IsPartyRide = false			//パーティ内にライド状態のモンスターがいるか？
	SFlag = false;				//パーティ内にＳがいるか判定
	NFlag = false;				//パーティ内にＮがいるか判定
	MFlag = false;				//パーティ内にＭがいるか判定
	GFlag = false;				//パーティ内にＧがいるか判定
	TFlag = false;				//パーティ内にＴがいるか判定
	Empty = null;				//全体配置時のEmpty
	Empty_Substitute = null;	//全体配置時のみがわり対象外Empty
	Rotate = null;				//全体配置時の向き
	UpCam = null;				//全体配置時の単体表示CameraEmpty
	UpCamTgt = null;			//全体配置時の単体表示CameraTargetEmpty
	CamEmpty_Area = 0;			//全体表示時の全体表示CameraEmpty
	CamTgtEmpty_Area = 0;		//全体表示時の全体表示CameraTargetEmpty
	CamEmpty_God = 0;			//全体配置時の全体表示CameraEmpty（GODHAND用）
	CamTgtEmpty_God = 0;		//全体配置時の全体表示CameraTargetEmpty（GODHAND用）
	Empty_Master = null;		//全体配置時のマスターのEmpty
	Rotate_Master = null;		//全体配置時のマスターの向き
	CamEmpty_Master = 0;		//全体表示時のマスター表示CameraEmpty
	CamTgtEmpty_Master = 0;		//全体表示時のマスター表示CameraTargetEmpty
	StandbyCutRunner = null;	//StandbyCutのランナー
	StandbyCutCam = null;		//StandbyCutのCameraEmpty
	StandbyCutCamTgt = null;	//StandbyCutのCameraTargetEmpty
	EffectEmpty_Area = 0;		//全体表示時のEffect配置のEmpty番号
	EffectScale_Area = 1.0;		//全体表示時のEffect表示の倍率
	
	Extra = null;				//パーティ表示時のエキストラのモンスターインデックス
	MasterIndex = null;			//マスターのインデックス
	MasterType = null;			//マスターの種類
	MasterEmpty = null;			//マスターの配置座標
	MasterRotate = null;		//マスターの向き
	
	constructor()
	{
		//DebugPrint("Class_ConstructorIN" + "_" + "cPartyInfo");
		//引数のモンスターはモンスターインデックスを指定。（１体のみ）
		//それ以外はここで生成する。
		
		//配列定義のものはconstructorで再定義（初期化）
		Index				= array(4);		//モンスターインデックス
		Type				= array(4);		//生存状態判定
		Size				= array(4);		//サイズ
		IsRide				= array(4);		//ライド状態か判定
		Empty				= array(4);		//全体配置時のEmpty
		Empty_Substitute	= array(4);		//全体配置時のみがわり対象外Empty
		Rotate				= array(4);		//全体配置時の向き
		UpCam				= array(4);		//全体配置時のアップ時のCameraEmpty
		UpCamTgt			= array(4);		//全体配置時のアップ時のCameraTargetEmpty
		StandbyCutRunner	= array(4);		//StandbyCutのランナーのEmpty;
		StandbyCutCam		= array(4);		//StandbyCutのCameraEmpty;
		StandbyCutCamTgt	= array(4);		//StandbyCutのCameraTargetEmpty;
		Extra				= array(3);		//パーティ表示時のエキストラのモンスターインデックス
		//DebugPrint("Class_ConstructorOUT" + "_" + "cPartyInfo");
	}
}

//パーティ全員の情報クラス
class cFullPartyInfo extends cPartyInfo
{
	
	constructor(Monster)
	{
		//DebugPrint("Class_ConstructorIN" + "_" + "cFullPartyInfo");		
		//クラスの継承
		cPartyInfo.constructor();
		
		if(Monster != INVALID_CHARACTER){
			AllyFlag = IsAlly_(Monster);
			//パーティ情報の取得
			for(local i = 0 ; i < 4 ; i++){
				if(AllyFlag == true){
					Index[i] = GetAllyIndex_(i);
				} else {
					Index[i] = GetEnemyIndex_(i);
				}
				Type[i] = GetInitExistType_(Index[i]);
				if(Type[i] != LIVETYPE.NONE){
					PartyNum += 1;
					local cMonster = cMonsterInfo(Index[i]);
					Size[i] = cMonster.Size;
					if(Size[i] == SIZE_S){SFlag = true;}
					if(Size[i] == SIZE_N){NFlag = true;}
					if(Size[i] == SIZE_M){MFlag = true;}
					if(Size[i] == SIZE_G){GFlag = true;}
					if(Size[i] == SIZE_T){TFlag = true;}
					IsRide[i]	= cMonster.IsRide;
					if(IsRide[i] == true){
						IsPartyRide = true;
					}
				}
			}
			//全体配置を行う際に設定されているパーティの基本となる
			//・各モンスターのEmpty座標	: IndexXXEmpty
			//・カメラのEmpty座標		: CamEmpty
			//・エフェクトのEmpty座標	: EffectEmpty
			//local cPartyEmpty = cPartyEmptyInfo(Monster);
			
			//パーティタイプの生成
			PartyType = Get_PartyType(AllyFlag);
			
			//パーティのEmpty情報を取得
			for(local i = 0 ; i < PartyNum ; i += 1){
				if(Index[i] != INVALID_CHARACTER){
					local cEmpty = cEmptyInfo(PartyType,Index[i],i);
					Empty[i]			= cEmpty.Empty;
					Empty_Substitute[i]	= cEmpty.Empty_Substitute;
					Rotate[i]			= cEmpty.Rotate;
					//UpCamは[N] / [M] / [それ以外]で分ける
					if(Size[i] == SIZE_N){
						UpCam[i]	= cEmpty.UpCamN;
						UpCamTgt[i]	= cEmpty.UpCamTgtN;
					} else if(Size[i] == SIZE_M){
						UpCam[i]	= cEmpty.UpCamM;
						UpCamTgt[i]	= cEmpty.UpCamTgtM;
					} else {
						UpCam[i]	= cEmpty.UpCam;
						UpCamTgt[i]	= cEmpty.UpCamTgt;
					}
					StandbyCutRunner[i]	= cEmpty.StandbyCutRunner;
					StandbyCutCam[i]		= cEmpty.StandbyCutCam;
					StandbyCutCamTgt[i]	= cEmpty.StandbyCutCamTgt;
					if(i == 0){
						CamEmpty_Area		= cEmpty.Cam_Area;
						CamTgtEmpty_Area	= cEmpty.CamTgt_Area;
						CamEmpty_God		= cEmpty.Cam_God
						CamTgtEmpty_God		= cEmpty.CamTgt_God
						Empty_Master		= cEmpty.Empty_Master
						Rotate_Master		= cEmpty.Rotate_Master
						CamEmpty_Master		= cEmpty.Cam_Master;
						CamTgtEmpty_Master	= cEmpty.CamTgt_Master;
						EffectEmpty_Area	= cEmpty.EffectEmpty_Area;
						EffectScale_Area	= cEmpty.EffectScale_Area;
					}
				}
				//エキストラの設定
				if(i < PartyNum - 1){	//本人は除くので-1
					Extra[i]	= GetExtra(Monster, i);
				}
			}
		} else {
			//Indexが存在しない場合は何もしない
		}
		
		//マスター情報
		if(AllyFlag == true){
			MasterIndex		= GetAllyMaster_();
		} else {
			MasterIndex		= GetEnemyMaster_();
		}
		MasterType		= GetMasterKind_(AllyFlag);	//マスターの種類
		
		//DebugPrint("Class_ConstructorOUT" + "_" + "cFullPartyInfo");
	}
}

//選択した引数のモンスターインデックスのみのパーティ構成
class cSelectionPartyInfo extends cPartyInfo
{
	constructor(Index00,Index01,Index02,Index03)
	{
		//DebugPrint("Class_" + "ConstructorIN" + "_" + "SelectionPartyInfo");
		//クラスの継承
		cPartyInfo.constructor();
		
		Index = [Index00 , Index01 , Index02 , Index03];
		
		local IndexCheck = false;	//IndexがINVALID_CHARACTERではないか？
		for(local i = 0 ; i < 4 ; i++){
			if(Index[i] != INVALID_CHARACTER){
				IndexCheck = true;
			}
		}
		
		if(IndexCheck == true){
			//Indexに何らか入っている場合
			for(local i = 0 ; i < 4 ; i += 1){
				if(Index[i] != INVALID_CHARACTER){
					PartyNum += 1;
					Size[i]		= GetMonsterSize_(Index[i]);
					Type[i]		= GetInitExistType_(Index[i]);
					if(Size[i] == SIZE_S){ SFlag = true;}
					if(Size[i] == SIZE_N){ NFlag = true;}
					if(Size[i] == SIZE_M){ MFlag = true;}
					if(Size[i] == SIZE_G){ GFlag = true;}
					if(Size[i] == SIZE_T){ TFlag = true;}
				}
			}
			
			PartyType = Get_SelectionPartyType(Index[0] , Index[1] , Index[2] , Index[3])
			
			//パーティのEmpty情報を取得
			for(local i = 0 ; i < PartyNum ; i += 1){
				if(Index[i] != INVALID_CHARACTER){
					local cEmpty = cEmptyInfo(PartyType,Index[i],i);
					Empty[i]	= cEmpty.Empty;
					Empty_Substitute[i]	= cEmpty.Empty_Substitute;
					Rotate[i]	= cEmpty.Rotate;
					//UpCamは[N] / [M] / [それ以外]で分ける
					if(Size[i] == SIZE_N){
						UpCam[i]	= cEmpty.UpCamN;
						UpCamTgt[i]	= cEmpty.UpCamTgtN;
					} else if(Size[i] == SIZE_M){
						UpCam[i]	= cEmpty.UpCamM;
						UpCamTgt[i]	= cEmpty.UpCamTgtM;
					} else {
						UpCam[i]	= cEmpty.UpCam;
						UpCamTgt[i]	= cEmpty.UpCamTgt;
					}
					StandbyCutRunner[i]	= cEmpty.StandbyCutRunner;
					StandbyCutCam[i]	= cEmpty.StandbyCutCam;
					StandbyCutCamTgt[i]	= cEmpty.StandbyCutCamTgt;
					if(i == 0){
						CamEmpty_Area = cEmpty.Cam_Area;
						CamTgtEmpty_Area = cEmpty.CamTgt_Area;
						CamEmpty_God		= cEmpty.Cam_God
						CamTgtEmpty_God		= cEmpty.CamTgt_God
						Empty_Master		= cEmpty.Empty_Master
						Rotate_Master		= cEmpty.Rotate_Master
						CamEmpty_Master		= cEmpty.Cam_Master;
						CamTgtEmpty_Master	= cEmpty.CamTgt_Master;
						EffectEmpty_Area = cEmpty.EffectEmpty_Area;
						EffectScale_Area = cEmpty.EffectScale_Area;
					}
				}
			}
		} else {
			//Indexが全てINVALID_CHARACTERの場合は何もしない
		}
		//DebugPrint("Class_" + "ConstructorOUT" + "_" + "SelectionPartyInfo");
	}
}



//Targetに指定されたモンスターのみで構成されるパーティ構成
class cTargetPartyInfo extends cPartyInfo
{
	constructor(Count)
	{
		//DebugPrint("Class_" + "ConstructorIN" + "_" + "cTargetPartyInfo");
		//クラスの継承
		cPartyInfo.constructor();
		
		local TargetNum = GetTargetNum_(Count);
		for (local i = 0 ; i < 4 ; i += 1 ){
			Index[i]	= GetTargetIndex_(Count,i);
			if(Index[i] != INVALID_CHARACTER){
				Size[i]	= GetMonsterSize_(Index[i]);
				if(Size[i] == SIZE_S){ SFlag = true;}
				if(Size[i] == SIZE_N){ NFlag = true;}
				if(Size[i] == SIZE_M){ MFlag = true;}
				if(Size[i] == SIZE_G){ GFlag = true;}
				if(Size[i] == SIZE_T){ TFlag = true;}
			}
		}
		
		if(TargetNum != 0){
			//local cEmpty =cPartyEmptyInfo(Index[0]);
			local AllyFlag = IsAlly_(Index[0])
			
			PartyType = Get_SelectionPartyType(Index[0],Index[1],Index[2],Index[3])
			
			//パーティのEmpty情報を取得
			for(local i = 0 ; i < TargetNum ; i += 1){
				if(Index[i] != INVALID_CHARACTER){
					local cEmpty = cEmptyInfo(PartyType,Index[i],i);
					Empty[i]	= cEmpty.Empty;
					Empty_Substitute[i]	= cEmpty.Empty_Substitute;
					Rotate[i]	= cEmpty.Rotate;
					//UpCamは[N] / [M] / [それ以外]で分ける
					if(Size[i] == SIZE_N){
						UpCam[i]	= cEmpty.UpCamN;
						UpCamTgt[i]	= cEmpty.UpCamTgtN;
					} else if(Size[i] == SIZE_M){
						UpCam[i]	= cEmpty.UpCamM;
						UpCamTgt[i]	= cEmpty.UpCamTgtM;
					} else {
						UpCam[i]	= cEmpty.UpCam;
						UpCamTgt[i]	= cEmpty.UpCamTgt;
					}
					StandbyCutRunner[i]	= cEmpty.StandbyCutRunner;
					StandbyCutCam[i]	= cEmpty.StandbyCutCam;
					StandbyCutCamTgt[i]	= cEmpty.StandbyCutCamTgt;
					if(i == 0){
						CamEmpty_Area		= cEmpty.Cam_Area;
						CamTgtEmpty_Area	= cEmpty.CamTgt_Area;
						CamEmpty_God		= cEmpty.Cam_God;
						CamTgtEmpty_God		= cEmpty.CamTgt_God;
						Empty_Master		= cEmpty.Empty_Master
						Rotate_Master		= cEmpty.Rotate_Master
						CamEmpty_Master		= cEmpty.Cam_Master;
						CamTgtEmpty_Master	= cEmpty.CamTgt_Master;
						EffectEmpty_Area = cEmpty.EffectEmpty_Area;
						EffectScale_Area = cEmpty.EffectScale_Area;
					}
				}
			}
		} else {
			//対象が0体の場合は何もしない
		}
		//DebugPrint("Class_" + "ConstructorOUT" + "_" + "cTargetPartyInfo");
	}
}

//パーティ全員の情報クラス
class cAllyFlagPartyInfo extends cPartyInfo
{
	
	constructor(flag)
	{
		//DebugPrint("Class_ConstructorIN" + "_" + "cFullPartyInfo");		
		//クラスの継承
		cPartyInfo.constructor();
		AllyFlag = flag;
		Update(AllyFlag)
	}
	//パーティ情報の取得
	function Update(AllyFlag)
	{
		for(local i = 0 ; i < 4 ; i++){
			if(AllyFlag == true){
				Index[i] = GetAllyIndex_(i);
			} else {
				Index[i] = GetEnemyIndex_(i);
			}
			Type[i] = GetInitExistType_(Index[i]);
			if(Type[i] != LIVETYPE.NONE){
				PartyNum += 1;
				local cMonster = cMonsterInfo(Index[i]);
				Size[i] = cMonster.Size;
				if(Size[i] == SIZE_S){SFlag = true;}
				if(Size[i] == SIZE_N){NFlag = true;}
				if(Size[i] == SIZE_M){MFlag = true;}
				if(Size[i] == SIZE_G){GFlag = true;}
				if(Size[i] == SIZE_T){TFlag = true;}
				IsRide[i]	= cMonster.IsRide;
				if(IsRide[i] == true){
					IsPartyRide = true;
				}
			}
		}
		//全体配置を行う際に設定されているパーティの基本となる
		//・各モンスターのEmpty座標	: IndexXXEmpty
		//・カメラのEmpty座標		: CamEmpty
		//・エフェクトのEmpty座標	: EffectEmpty
		
		//パーティタイプの生成
		PartyType = Get_PartyType(AllyFlag);
		
		//パーティのEmpty情報を取得
		for(local i = 0 ; i < PartyNum ; i += 1){
			if(Index[i] != INVALID_CHARACTER){
				local cEmpty = cEmptyInfo(PartyType,Index[i],i);
				Empty[i]			= cEmpty.Empty;
				Empty_Substitute[i]	= cEmpty.Empty_Substitute;
				Rotate[i]			= cEmpty.Rotate;
				//UpCamは[N] / [M] / [それ以外]で分ける
				if(Size[i] == SIZE_N){
					UpCam[i]	= cEmpty.UpCamN;
					UpCamTgt[i]	= cEmpty.UpCamTgtN;
				} else if(Size[i] == SIZE_M){
					UpCam[i]	= cEmpty.UpCamM;
					UpCamTgt[i]	= cEmpty.UpCamTgtM;
				} else {
					UpCam[i]	= cEmpty.UpCam;
					UpCamTgt[i]	= cEmpty.UpCamTgt;
				}
				StandbyCutRunner[i]	= cEmpty.StandbyCutRunner;
				StandbyCutCam[i]		= cEmpty.StandbyCutCam;
				StandbyCutCamTgt[i]	= cEmpty.StandbyCutCamTgt;
				if(i == 0){
					CamEmpty_Area		= cEmpty.Cam_Area;
					CamTgtEmpty_Area	= cEmpty.CamTgt_Area;
					CamEmpty_God		= cEmpty.Cam_God
					CamTgtEmpty_God		= cEmpty.CamTgt_God
					Empty_Master		= cEmpty.Empty_Master
					Rotate_Master		= cEmpty.Rotate_Master
					CamEmpty_Master		= cEmpty.Cam_Master;
					CamTgtEmpty_Master	= cEmpty.CamTgt_Master;
					EffectEmpty_Area	= cEmpty.EffectEmpty_Area;
					EffectScale_Area	= cEmpty.EffectScale_Area;
				}
			}
			//エキストラの設定
			/*if(i < PartyNum - 1){	//本人は除くので-1
				Extra[i]	= GetExtra(Monster, i);
			}*/
		}
	
		//マスター情報
		if(AllyFlag == true){
			MasterIndex		= GetAllyMaster_();
		} else {
			MasterIndex		= GetEnemyMaster_();
		}
		MasterType		= GetMasterKind_(AllyFlag);	//マスターの種類
	}
}


//指定した回数目の行動の詳細情報をまとめる
class cActionInfo
{
	Attack = 0;								//行動のモンスターインデックス
	AttackMulti = null;						//行動モンスターインデックス（連続攻撃用）
	ActionNum = 0;							//行動数
	TargetNum = 0;							//対象対象となったモンスター数
	Target = null;							//対象モンスターインデックス（配列）
	MultiCount = 0;							//何回目の行動か？
	AttackAllyFlag = false;					//行動者の敵味方判定
	TargetAllyFlag = false;					//行動者の敵味方判定
	IndexIs = null;							//対象モンスターインデックスのIs判定変換（配列）
	
	//SE関連
	HitTypeSEFlag		= false;				//反応SEを再生するか？
	HitTypeSE			= "SE_BTL_019";			//反応SE（Miss・Criticalなど）のどれを再生するか？
	HealTypeSEFlag		= false;				//回復SEを再生するか？
	HealTypeSE			= "SE_BTL_020"			//回復SE
	RevivalTypeSEFlag	= false;				//蘇生SEを再生するか？
	RevivalTypeSE		= "SE_BTL_019";			//蘇生SE
	StatusTypeSEFlag	= false;				//ステータス変化SEを再生するか？
	StatusTypeSE		= "SE_BTL_019";			//ステータス変化SE
	OtherTypeSEFlag		= false;				//その他SEを再生するか？
	OtherTypeSE			= "SE_BTL_019";			//その他SE
	DamageSE			= "SE_BTL_019";			//通常ダメージSE
	MissSE				= "SE_BTL_022";			//ミスSE
	CriticalSE			= "SE_BTL_003";			//会心の一撃SE
	DeadSE				= "SE_BTL_009";			//死亡SE
	GuardSE				= "SE_BTL_024";			//ガードSE
	AbsorptionSE		= "SE_SHA_003";			//吸収SE
	ReflectSE			= "SE_BTL_023";			//反射SE
	RevivalSE			= "SE_BTL_023";			//蘇生SE（仮データ）
	
	//汎用エフェクト関連
	HitEffect			= "EF010_01_HIT";			//被弾エフェクト
	CriticalEffect		= "EF010_02_HIT_KAISHIN";	//会心エフェクト
	DeadEffect			= "EF000_12_MONSTER_DEATH";	//死亡エフェクト
	GuardEffect			= "EF000_13_COUNTER";		//防御エフェクト
	AbsorptionEffect	= null;						//吸収エフェクト
	ReflectEffect		= "EF000_13_COUNTER";		//反射エフェクト
	RevivalEffect		= null;						//蘇生エフェクト
	
	//ダメージ判定
	Kind				= null;			//行動の種類
	Category			= null;			//行動のカテゴリ
	MissFlag			= false;		//今回の行動でミスが発生したか？
	CriticalFlag		= false;		//今回の行動でクリティカルが発生したか？
	DeadFlag			= false;		//今回の行動で死亡が発生したか？
	GuardFlag			= false;		//今回の行動で防御が発生したか？
	AbsorptionFlag		= false;		//今回の行動で吸収が発生したか？
	RevivalFlag			= false;		//今回の行動で蘇生が発生したか？
	ReflectFlag			= false;		//今回の行動で反射が発生したか？
	PoisonDamageFlag	= false;		//今回の行動で毒ダメージが発生したか？
	//ポップ表示
	PopVisibleFlag		= null;			//今回の行動でダメージポップが必要か？
	
	//ヒット判定（IndexIs , MultiStageCount の２次元配列）
	IsMiss			= null;			//ミスが発生したか？
	IsCritical		= null;			//クリティカルが発生したか？
	IsDead			= null;			//死亡が発生したか？
	IsGuard			= null;			//防御が発生したか？
	IsAbsorption	= null;			//吸収が発生したか？
	IsReflect		= null;			//反射が発生したか？
	IsRevival		= null;			//蘇生が発生したか？
	IsPoisonDamage	= null;			//毒ダメージが発生したか？
	
	StateDamage				= null;		//ダメージの値（Target[]に対応した配列）
										//ダメージだけ、２次元配列になる予定
	StatusFlag				= null;		//ステータス変化の判定
	StatusValue				= null;		//ステータス変化の値
	StatusEndFlag			= null;		//ステータス変化終了の判定
										
	//多段攻撃判定用
	MultiStageCount			= null;		//多段攻撃用判定（Target[]に対応した配列）
										//通常は、１。多段の場合はその回数
	MaxMultiStageCount		= 1;		//多段攻撃判定（最大数）
	
	//ポップ表示判定用
	PopKind				= null;			//表示するポップの種類（Target[]に対応した配列）
	PopValue			= null;			//表示するポップの値（Target[]に対応した配列）
	PopValueKind		= null;			//表示するポップの値の種類Target[]に対応した配列）
	PopMiss				= null;			//ミスポップを表示するか判定（Target[]に対応した配列）
	
	//特技エフェクト設定
	SingleActEffect0_Name		= null;					//単体配置エフェクト０の名前
	SingleActEffect0_Frame		= 0;					//単体配置エフェクト０のフレーム数
	SingleActEffect0_SEFlag		= true;					//単体配置エフェクト０のSE再生設定
	SingleActEffect1_Name		= null;					//単体配置エフェクト１の名前
	SingleActEffect1_Frame		= 0;					//単体配置エフェクト１のフレーム数
	SingleActEffect1_SEFlag		= true;					//単体配置エフェクト０のSE再生設定
	AllActEffect0_Name			= null;					//全体配置エフェクト０の名前
	AllActEffect0_Frame			= 0;					//全体配置エフェクト０のフレーム数
	AllActEffect0_SEFlag		= true;					//全体配置エフェクト０のSE再生設定
	AllActEffect1_Name			= null;					//全体配置エフェクト１の名前
	AllActEffect1_Frame			= 0;					//全体配置エフェクト１のフレーム数
	AllActEffect1_SEFlag		= true;					//全体配置エフェクト１のSE再生設定
	ActEffectFlag				= false;				//何のエフェクトも設定されていないか？
	SingleActEffectAttach		= null					//単体特技・特性の場合のエフェクトのアタッチ位置
	EffectFrame					= 0;					//行動に対応した特技エフェクトの再生フレーム
														//	0F から開始
														//	→	DirectionWait でモーション・ポップ表示
														//		→	MotionWait	で待機状態に戻す
														//			→	EndWait	で終了
	EffectFrame_DamageDirectionWait		= 0;			//エフェクト開始～ダメージ処理までのWait
	EffectFrame_EndWait					= 0;			//演出を終了するまでの間
	BAKURETSU_AllOnlyWait		= 0;					//多段攻撃で、個別エフェクトがない場合のWait
														//個別エフェクトがある場合は、0のまま
	ShakeFlag					= false;				//画面揺れを行うか判定
	SingleTargetFlag			= false;				//単体行動の技か？
	EffectAreaFlag 				= true;					//エフェクトの表示が単体か全体か
	EffectEmpty_Area			= 0;					//EffectEmptyが将来技によって
														//座標が変わるかも知れないので念のため用意_
	EffectAttach				= ATTACH_GLOBAL;		//モンスターにつけるエフェクト座標
	SelfTargetFlag				= false					//行動者と対象者が同じか？
	
	//行動Wait関連
	LineEffect_WaitFlag		= true						//LineEffect_InitでのWait処理
	
	//例外判定
	IsAutoHeal				= false;					//自動回復処理か？
	
	constructor(Count)
	{
		//DebugPrint("Class_" + "ConstructorIN" + "_" + "cActionInfo");
		//DebugPrint("	=>	Count	:	" + Count);
		Attack = GetActorIndex_(Count);			//行動のモンスターインデックス
		ActionNum = GetActionNum_();			//行動数
		TargetNum = GetTargetNum_(Count);			//対象対象となったモンスター数
		SingleTargetFlag = IsTargetSingle_(Count);	//単体行動の技か？
		if(IsScout_() != true){
			Category = GetActionCategory_(Count)	//行動の種類は何か？
		}
		
		//最大ヒット数は
		
		MaxMultiStageCount = GetMaxActHitNum(Count)
		
		//配列定義のものはconstructorで再定義
		AttackMulti = [];						//連続攻撃モンスターインデックス（配列）
		Target				= array(TargetNum);	//対象モンスターインデックス（配列）
		IndexIs				= array(TargetNum);	//対象モンスターインデックスのIs判定変換（配列）
		IsMiss				= array(TargetNum);	//ミスが発生したか？
		IsCritical			= array(TargetNum);	//クリティカルが発生したか？
		IsDead				= array(TargetNum);	//死亡が発生したか？
		IsGuard				= array(TargetNum);	//防御が発生したか？
		IsAbsorption		= array(TargetNum);	//吸収が発生したか？
		IsReflect			= array(TargetNum);	//反射が発生したか？
		IsRevival			= array(TargetNum);	//蘇生が発生したか？
		IsPoisonDamage 		= array(TargetNum);	//毒ダメージが発生したか？
		StateDamage			= array(TargetNum);	//ダメージの値([TargetNum][MultiStageCount])
		StatusFlag			= array(TargetNum);	//ステータス変化の判定([TargetNum][STATUS_NUM])
		StatusValue			= array(TargetNum);	//ステータス変化の値([TargetNum][STATUS_NUM])
		StatusEndFlag		= array(TargetNum);	//ステータス変化終了の判定([TargetNum][STATUS_NUM])
		PopKind				= array(TargetNum);	//表示するポップの種類（Target[]に対応した配列）
		PopValue			= array(TargetNum);	//表示するポップの値（Target[]に対応した配列）
		PopValueKind		= array(TargetNum);	//表示するポップの値（Target[]に対応した配列）
		PopMiss				= array(TargetNum);	//ミスポップを表示するか判定（Target[]に対応した配列）
		PopVisibleFlag		= array(TargetNum);	//ポップを表示するかの判定（Target[]に対応した配列）
		MultiStageCount		= array(TargetNum); //多段攻撃判定数（Target[]に対応した配列）
		
		//Countに合わせて数値を取り直し
		TargetNum = GetTargetNum_(Count);
		Attack = GetActorIndex_(Count);
		/*for(local i = 0 ; i < 4 ; i++){
			AttackMulti.append(GetActorIndex_(i));
		}*/
		MultiCount = Count;
		
		//クラスの読込
		local PartyInfo = cFullPartyInfo(GetTargetIndex_(Count,0));
		
		//特技・特性のエフェクト名・フレーム数を取得
		SingleActEffect0_Name	= GetSingleEffectName_(Count,0);
		SingleActEffect0_Frame	= GetSingleEffectFrame_(Count,0);
		SingleActEffect1_Name	= GetSingleEffectName_(Count,1);
		SingleActEffect1_Frame	= GetSingleEffectFrame_(Count,1)
		AllActEffect0_Name		= GetAllEffectName_(Count,0);
		AllActEffect0_Frame		= GetAllEffectFrame_(Count,0);
		AllActEffect1_Name		= GetAllEffectName_(Count,1);
		AllActEffect1_Frame		= GetAllEffectFrame_(Count,1);
		SingleActEffectAttach	= ATTACH_EFFECT2;		//SingleEffectのアタッチ位置の取得方法は要相談
		
		//エフェクト処理の更新
		UpdateEffect(Count)
		
		//行動回数で判定を取る場合はここ
		Kind = GetActionEfficacy_(Count);
		
		//各対象ごとで判定を取る場合はここ
		for(local x = 0 ; x < TargetNum ; x++){
			Target[x] = GetTargetIndex_(Count,x);
			
			local cMonster = cTargetMonsterInfo(Target[x],Count)
			if(cMonster.Index != INVALID_CHARACTER){
				IndexIs[x]			= cMonster.IndexIs;
				//多段系の判定
				/*for(local y = 0 ; y < MultiStageCount ; y++){
					IsMiss[x][y]			= IsMiss_(Count,Target[x],y);
					IsCritical[x][y]		= IsCritical_(Count,Target[x],y);
					IsDead[x][y]			= IsDead_(Count,Target[x]);
					IsGuard[x][y]			= IsGuard_(Count,Target[x]);
					IsAbsorption[x][y]		= IsAbsorb_(Count,Target[x]);//吸収の判定が未実装
					IsReflect[x][y]			= IsReflect_(Count,Target[x]);
					IsRevival[x][y]			= IsRevival_(Count,Target[x]);
					IsPoisonDamage[x][y]	= IsPoisonDamage_(Count,Target[x])
				}
				//ステータス判定
				for(local Status = STATUS_TOP ; Status < STATUS_NUM ; Status++){
					StateFlag[x][Status]		= GetStatusFlag_(Status,Count,Target[x])
					StatusValue[x][Status]		= GetStatusValue_(Status,Count,Target[x])
					StateEndFlag[x][Status]		= GetStatusEndFlag_(Status,Count,Target[x])
				}*/
				
				IsMiss[x]			= cMonster.IsMiss;
				IsCritical[x]		= cMonster.IsCritical;
				IsDead[x]			= cMonster.IsDead;
				IsGuard[x]			= cMonster.IsGuard;
				IsAbsorption[x]		= cMonster.IsAbsorption;
				IsReflect[x]		= cMonster.IsReflect;
				IsRevival[x]		= cMonster.IsRevival;
				IsPoisonDamage[x]	= cMonster.IsPoisonDamage;
				StateDamage[x]		= cMonster.DamageValue;
				StatusFlag[x]		= cMonster.StatusFlag;
				StatusValue[x]		= cMonster.StatusValue;
				StatusEndFlag[x]	= cMonster.StatusEndFlag;
				//多段ヒット時の全体チェック
				MultiStageCount[x]	= cMonster.MultiStageCount
				for(local y = 0; y < MultiStageCount[x] ; y++){
					if(IsMiss[x][y] == true)		{MissFlag = true;}
					if(IsCritical[x][y] == true)	{CriticalFlag = true;}
					if(IsDead[x][y] == true)		{DeadFlag = true;}
					if(IsGuard[x][y] == true)		{GuardFlag = true;}
					if(IsAbsorption[x][y] == true)	{AbsorptionFlag = true;}
					if(IsReflect[x][y] == true)		{ReflectFlag = true;}
					if(IsRevival[x][y] == true)		{RevivalFlag = true;}
					if(IsPoisonDamage[x][y] == true){PoisonDamageFlag = true;}
					//ポップ表示用のミス判定
					if(IsMiss[x][y] == true){
						PopMiss[x]	= true;
					} else {
						PopMiss[x]	= false;
					}
					
				}
				
				
				//ステータス変化の値が全て0だった場合（ダメージ）
				if(Kind == EFFICACY.ATTACK){
					local DamageType = GetDamageType_(Count,x)
					local AllyFlag = IsAlly_(Target[x]);
					//ダメージ値のみ条件が複雑
					if(MultiStageCount[x] == 0){
						PopKind.append(POPSTYLE.NONE)
						PopValue.append(null)
					} else {
						if(AllyFlag == true){
							//味方へのダメージの場合
							PopKind[x]			= POPSTYLE.DAMAGE_ENEMY
							PopValue[x]			= StateDamage
							PopVisibleFlag[x]	= true;
						} else {
							//敵へのダメージ
							PopKind[x]			= POPSTYLE.DAMAGE_ALLY
							PopValue[x]			= StateDamage
							PopVisibleFlag[x]	= true;
						}
						if(IsReflect[x][0] == true){
							PopVisibleFlag[x]	= false;
						}
					}
				//ステータス変化の値が全て0だった場合（回復）
				} else if(Kind == EFFICACY.HEAL){
					//HP回復の場合
					PopKind[x]			= POPSTYLE.HEAL_HP
					PopValue[x]			= StateDamage
					PopVisibleFlag[x]	= true;
				}
				//毒ダメージの際はポップ表示を行う
				local PoisonDamageFlag = IsPoisonDamage_(Count, x);
				local AllyFlag = IsAlly_(Target[x]);
				if(Kind == EFFICACY.OTHER && PoisonDamageFlag == true){
						PopValue[x]		= StateDamage
						PopVisibleFlag[x] = true;
					if(AllyFlag == true){
						PopKind[x]		= POPSTYLE.DAMAGE_ENEMY
					} else {
						PopKind[x]		= POPSTYLE.DAMAGE_ALLY
					}
				}
			}
		}
		
		//多重条件を想定し別枠でSE設定
		//	（Miss以外は、Effect表示でSEが再生されるので一旦HitTypeSEFlagをfalseにします。）
		if(Kind == EFFICACY.ATTACK){
			HitTypeSEFlag = true;
			if(CriticalFlag == true){					//クリティカルの場合
				HitTypeSEFlag = false;
				if(IsAlly_(Attack) == true){
					HitTypeSE = CriticalSE;
				} else {
					HitTypeSE = "SE_BTL_006"//敵側の場合は痛恨
				}
				ShakeFlag = true;
			}
			if(MissFlag == true) {						//ミスの場合
				HitTypeSEFlag = true;
				HitTypeSE = MissSE;
			}
			if(GuardFlag == true) {				//ガードの場合
				HitTypeSEFlag = false;
				HitTypeSE = GuardSE;
			}
			if(AbsorptionFlag == true) {		//吸収の場合
				HitTypeSEFlag = false;
				HitTypeSE = AbsorptionSE;
			}
			if(ReflectFlag == true) {		//反射の場合
				HitTypeSEFlag = true;
				HitTypeSE = ReflectSE;
			}
		}
		
		
		SingleTargetFlag = IsTargetSingle_(Count);
		
		//技に対応したEffectEmpty_Areaの用意
		EffectEmpty_Area = PartyInfo.EffectEmpty_Area
		
		//行動者と対象者が同じか判定
		if(Attack == GetTargetIndex_(Count,0) && SingleTargetFlag == true){
			SelfTargetFlag = true;
		}
		
		//行動者と対象者の陣営判定
		if(Attack != INVALID_CHARACTER){
			AttackAllyFlag = IsAlly_(Attack);
		}
		if(GetTargetIndex_(Count,0) != INVALID_CHARACTER){
			TargetAllyFlag = IsAlly_(GetTargetIndex_(Count,0));
		}
		//会心の一撃SEを痛恨のSEに変更するか？
		if(Attack != INVALID_CHARACTER){
			if(IsAlly_(Attack) != true){
				CriticalSE = "SE_BTL_006"//敵側の場合は痛恨
			}
		}
		
		//DebugPrint("Class_" + "ConstructorOUT" + "_" + "cActionInfo");
	}
	
	//エフェクトデータの更新
	//cActionInfoのエフェクトデータを手動で更新する場合は
	//下記の情報を更新してください。
	//cAction.SingleActEffect0_Name		：単体エフェクト（１）
	//cAction.SingleActEffect0_Frame	：単体エフェクト（１）の再生フレーム数
	//cAction.SingleActEffect1_Name		：単体エフェクト（２）
	//cAction.SingleActEffect1_Frame	：単体エフェクト（２）の再生フレーム数
	//cAction.AllActEffect0_Name		：全体エフェクト（１）
	//cAction.AllActEffect0_Frame		：全体エフェクト（１）の再生フレーム数
	//cAction.AllActEffect1_Name		：全体エフェクト（２）
	//cAction.AllActEffect1_Frame		：全体エフェクト（２）の再生フレーム数
	//	＊もし、エフェクトが１つだけの場合は、そこの更新だけで大丈夫です。
	//		エフェクトとフレーム数はセットで更新してください。
	function UpdateEffect(Count)
	{
		if(SingleActEffect0_Name != null)	{ActEffectFlag = true;}
		if(SingleActEffect1_Name != null)	{ActEffectFlag = true;}
		if(AllActEffect0_Name != null)		{ActEffectFlag = true;}
		if(AllActEffect1_Name != null)		{ActEffectFlag = true;}
		
		if(SingleActEffect0_Frame > EffectFrame){EffectFrame = SingleActEffect0_Frame;}
		if(SingleActEffect0_Frame > EffectFrame){EffectFrame = SingleActEffect1_Frame;}
		if(AllActEffect0_Frame > EffectFrame)	{EffectFrame = AllActEffect0_Frame;}
		if(AllActEffect1_Frame > EffectFrame)	{EffectFrame = AllActEffect1_Frame;}
		
		if(ActEffectFlag == true){
			switch(AllActEffect0_Name)
			{
			//全体エフェクトフレーム例外
			case "EF213_19_GOD_HAND":
				//EffectFrame = 45;
				EffectFrame_DamageDirectionWait	= 15;
				EffectFrame_EndWait				= 30;
				break;
			case "EF213_21_ABYSS_HAND":
				EffectFrame = 70;
				EffectFrame_DamageDirectionWait	= EffectFrame*0.7;
				EffectFrame_EndWait				= EffectFrame*0.6;
				break;
			case "EF213_23_JUDGMENT":
				EffectFrame = 45;
				EffectFrame_DamageDirectionWait	= 15;
				EffectFrame_EndWait				= 30;
				break;
			case "EF130_40_MEGANTE":
				//メガンテの場合は尺をずらす。
				EffectFrame = 150;
				EffectFrame_DamageDirectionWait	= 60;
				EffectFrame_EndWait				= 50;
				break;
			case "EF040_14_PROP_HAMETSUNOHI":
				//破滅の日は尺調整
				EffectFrame = 420;
				EffectFrame_DamageDirectionWait	= 370;
				EffectFrame_EndWait				= 50;
				break;
			case "EF200_15_PARTY_CHANGE":
				//パーティチェンジは例外的にここで調整は尺調整
				EffectFrame = 75;
				EffectFrame_DamageDirectionWait	= 50;
				EffectFrame_EndWait				= 45;
				break;
			default:
				if(SingleActEffect0_Name != null){
					switch(SingleActEffect0_Name)
					{
					//単体エフェクトフレーム例外
					case "EF110_40_BETARUMBLE":
						//ベタランブルの場合は尺をずらす。
						EffectFrame_DamageDirectionWait	= 100;
						EffectFrame_EndWait				= 50;
						break;
					case "EF110_49_MEDOLORE":
						//メドローア
						EffectFrame_DamageDirectionWait	= 100;
						EffectFrame_EndWait				= 50;
						break;
					case "EF030_10_TENSION01":
						EffectFrame_DamageDirectionWait	= 0;
						EffectFrame_EndWait				= 25;
					//多段系エフェクト例外設定
					case "EF110_52_MERAMATER":
					case "EF110_53_ZABAMATER":
					case "EF110_54_BAGIMATER":
					case "EF110_55_JIBAMATER":
					case "EF110_56_IOMATER":
					case "EF110_57_HYADOMATER":
					case "EF110_58_DEINAMATER":
					case "EF110_59_BETANAMATER":
					case "EF110_60_GIRAMATER":
					case "EF110_61_DORUMATER":
						EffectFrame = 15;
						EffectFrame_DamageDirectionWait	= EffectFrame*0.5;
						EffectFrame_EndWait				= EffectFrame*0.3;
						break;
					case "EF130_28_GIGATAMETORA_ABS":
						EffectFrame = 30;
						EffectFrame_DamageDirectionWait	= 15;
						EffectFrame_EndWait				= 0;
					case "EF130_32_GIGAMAHOTORA_ABS":
						EffectFrame = 20;
						EffectFrame_DamageDirectionWait	= 15;
						EffectFrame_EndWait				= 5;
						break;
					default:
						EffectFrame_DamageDirectionWait	= EffectFrame*0.5;
						EffectFrame_EndWait				= EffectFrame*0.5;
						if(GetTargetType_(Count) != TARGET.BAKURETSU && GetTargetType_(Count) != TARGET.ALLY_MULTI_RANDOM){
							//BAKURETSU系ではない場合はWait補正を用意
							if(EffectFrame_EndWait <= 25){
								EffectFrame_EndWait = 25;
							}
						}
						break;
					}
				} else {
					if(GetTargetType_(Count) != TARGET.BAKURETSU && GetTargetType_(Count) != TARGET.ALLY_MULTI_RANDOM){
						EffectFrame_DamageDirectionWait	= EffectFrame*0.7;
						EffectFrame_EndWait				= EffectFrame*0.4;
						local MaxHit = 0;
						for(local i = 0 ; i < TargetNum ; i++){
							local l = GetActHitNum_(Count,i);
							if(MaxHit < l){MaxHit = l;}
						}
						if(MaxHit > 1){
							EffectFrame_EndWait = EffectFrame_EndWait - (MaxHit * 15)
							if(EffectFrame_EndWait <= 0){
								//エフェクト終了待ちには１以上の数値を返すようにする。
								EffectFrame_EndWait = 1;
							}
						}
					} else {
						//多段攻撃の場合はWait尺の取り方を変更する
						if(SingleActEffect0_Name != null){
							EffectFrame_DamageDirectionWait	= EffectFrame*0.7;
							EffectFrame_EndWait				= EffectFrame*0.6;
							local MaxHit = 0;
							for(local i = 0 ; i < TargetNum ; i++){
								local l = GetActHitNum_(Count,i);
								if(MaxHit < l){MaxHit = l;}
							}
							if(MaxHit > 1){
								EffectFrame_EndWait = EffectFrame_EndWait - (MaxHit * 15)
								if(EffectFrame_EndWait <= 0){
									//エフェクト終了待ちには１以上の数値を返すようにする。
									EffectFrame_EndWait = 1;
								}
							}
						} else {
							//多段かつ、SingleEffectがない場合は
							//全体エフェクトを表示後、10F間隔で表示させる
							BAKURETSU_AllOnlyWait			= EffectFrame*0.7;
							EffectFrame_DamageDirectionWait	= 5;
							EffectFrame_EndWait				= 5;
							local MaxHit = 0;
							for(local i = 0 ; i < TargetNum ; i++){
								local l = GetActHitNum_(Count,i);
								if(MaxHit < l){MaxHit = l;}
							}
							if(MaxHit > 1){
								EffectFrame_EndWait = EffectFrame_EndWait - (MaxHit * 15)
								if(EffectFrame_EndWait <= 0){
									//エフェクト終了待ちには１以上の数値を返すようにする。
									EffectFrame_EndWait = 1;
								}
							}
						}
					}
				}
				break;
			}
		} else if(GetActorIndex_(Count) != INVALID_CHARACTER){
			//（Ｇ・Ｔサイズ物理攻撃）
			//条件として
			//・行動者がＧまたはＴサイズ
			//・全体対象である
			//・おすそわけではない（IsPasser_にて判定）
			//・特技ではない、物理攻撃
			local ActorSize = GetMonsterSize_(GetActorIndex_(Count))
			if(ActorSize == SIZE_G || ActorSize == SIZE_T){
				if(GetTargetType_(Count) == TARGET.ENEMY_ALL){
					if(IsPasser_(Count) != true){
						if(IsTokugi_(Count) == false && Category == CATEGORY.PHYSICAL){
							//Ｇ・Ｔサイズ用物理攻撃演出
							ActEffectFlag = true;
							SingleActEffect0_Name			= null;
							SingleActEffect1_Name			= null;
							AllActEffect0_Name				= "EF010_09_ATTACK_G_SIZE01";
							AllActEffect1_Name				= null;
							SingleActEffect0_Frame			= 0;
							SingleActEffect0_Frame			= 0;
							AllActEffect0_Frame				= 30;
							AllActEffect1_Frame				= 0;
							EffectFrame_DamageDirectionWait	= 15;
							EffectFrame_EndWait				= 45;
						}
					}
				}
			} else {
				//Ｓ・Ｎ・Ｍでエフェクトがない場合
				EffectFrame = 0;					//仮パラメータ
				EffectFrame_DamageDirectionWait	= 10;
				EffectFrame_EndWait				= 25;
			}
		} else {
			//エフェクトのないシーンでのWait設定
			EffectFrame = 0;					//仮パラメータ
			EffectFrame_DamageDirectionWait	= 10;
			EffectFrame_EndWait				= 25;
		}
		//例外用
		if(EffectFrame_DamageDirectionWait	== 0){EffectFrame_DamageDirectionWait	= 15;}
		if(EffectFrame_EndWait				== 0){EffectFrame_EndWait				= 25;}
	}
	//cActionのパラメータをテキスト出力
	function ParamPrint()
	{
	//print("Attack			: " + Attack + "\n")
	//print("ActionNum		: " + ActionNum + "\n")
	//print("TargetNum		: " + TargetNum + "\n")
	//print("MultiCount		: " + MultiCount + "\n")
	//print("AttackAllyFlag	: " + AttackAllyFlag + "\n")
	//print("TargetAllyFlag	: " + TargetAllyFlag + "\n")
	//
	//for(local x = 0 ; x < TargetNum ; x++){
	//	//print("Index[" + x + "]			: " + Index[x] + "\n")
	//	print("Target[" + x + "]		: " + Target[x] + "\n")
	//	print("IndexIs[" + x + "]		: " + IndexIs[x] + "\n")
	//}
	//
	//
	////SE関連
	//print("HitTypeSEFlag	: " + HitTypeSEFlag + "\n")
	//print("HitTypeSE		: " + HitTypeSE + "\n")
	//print("HealTypeSEFlag	: " + HealTypeSEFlag + "\n")
	//print("HealTypeSE		: " + HealTypeSE + "\n")
	//print("RevivalTypeSEFlag: " + RevivalTypeSEFlag + "\n")
	//print("RevivalTypeSE	: " + RevivalTypeSE + "\n")
	//print("StatusTypeSEFlag	: " + StatusTypeSEFlag + "\n")
	//print("StatusTypeSE		: " + StatusTypeSE + "\n")
	//print("OtherTypeSEFlag	: " + OtherTypeSEFlag + "\n")
	//print("OtherTypeSE		: " + OtherTypeSE + "\n")
	//print("DamageSE			: " + DamageSE + "\n")
	//print("MissSE			: " + MissSE + "\n")
	//print("CriticalSE		: " + CriticalSE + "\n")
	//print("DeadSE			: " + DeadSE + "\n")
	//print("GuardSE			: " + GuardSE + "\n")
	//print("AbsorptionSE		: " + AbsorptionSE + "\n")
	//print("ReflectSE		: " + ReflectSE + "\n")
	//print("RevivalSE		: " + RevivalSE + "\n")
	//print("HitEffect		: " + HitEffect + "\n")
	//print("CriticalEffect	: " + CriticalEffect + "\n")
	//print("DeadEffect		: " + DeadEffect + "\n")
	//print("GuardEffect		: " + GuardEffect + "\n")
	//print("AbsorptionEffect	: " + AbsorptionEffect + "\n")
	//print("ReflectEffect	: " + ReflectEffect + "\n")
	//print("RevivalEffect	: " + RevivalEffect + "\n")
	//
	////ダメージ判定
	//print("Kind				: " + Kind + "\n")
	//print("Category			: " + Category + "\n")
	//print("MissFlag			: " + MissFlag + "\n")
	//print("CriticalFlag		: " + CriticalFlag + "\n")
	//print("DeadFlag			: " + DeadFlag + "\n")
	//print("GuardFlag		: " + GuardFlag + "\n")
	//print("AbsorptionFlag	: " + AbsorptionFlag + "\n")
	//print("RevivalFlag		: " + RevivalFlag + "\n")
	//print("ReflectFlag		: " + ReflectFlag + "\n")
	//print("PoisonDamageFlag	: " + PoisonDamageFlag + "\n")
	//print("PopVisibleFlag	: " + PopVisibleFlag + "\n")
	
	//ヒット判定（IndexIs , MultiStageCount の２次元配列）
	/*for(local x = 0 ; x < MultiStageCount ; x++){
		print("--- 判定 : " +  x + "段目の判定 ----" + "\n");
		for(local y = 0 ; y < TargetNum ; y++){
			print("IsMiss[" + x +"]["+ y + "]			: " + IsMiss[x][y] + "\n")
			print("IsCritical[" + x +"]["+ y + "]		: " + IsCritical[x][y] + "\n")
			print("IsDead[" + x +"]["+ y + "]			: " + IsDead[x][y] + "\n")
			print("IsGuard[" + x +"]["+ y + "]			: " + IsGuard[x][y] + "\n")
			print("IsAbsorption[" + x +"]["+ y + "]	: " + IsAbsorption[x][y] + "\n")
			print("IsReflect[" + x +"]["+ y + "]		: " + IsReflect[x][y] + "\n")
			print("IsRevival[" + x +"]["+ y + "]		: " + IsRevival[x][y] + "\n")
			print("StateDamage[" + x +"]["+ y + "]	: " + StateDamage[x][y] + "\n")
			print("MultiStageCount[" + x + "][" + y + "[	: " + MultiStageCount[x][y] + "\n")
		}
	}
	
	//ステータス異常
	for(local x = 0 ; x < TargetNum ; x++){
		for(local y = STATUS_TOP ; y < STATUS_NUM ; y++){
			if(StatusValue[x][y] != 0){
				print("StatusValue[" + x +"]["+ y + "]		: " + StatusValue[x][y] + "\n")
				print("StatusFlag[" + x +"]["+ y + "]		: " + StatusFlag[x][y] + "\n")
				print("StatusEndFlag[" + x +"]["+ y + "]	: " + StatusEndFlag[x][y] + "\n")
			}
		}
	}
	
	
	for(local x = 0 ; x < TargetNum ; x++){
		print("PopKind[x]		: " + PopKind[x] + "\n")
		print("PopValue[x]		: " + PopValue[x] + "\n")
		print("PopValueKind[x]	: " + PopValueKind[x] + "\n")
		print("PopMiss[x]		: " + PopMiss[x] + "\n")
	}*/
	
	//print("SingleActEffect0_Name			: " + SingleActEffect0_Name + "\n")
	//print("SingleActEffect0_Frame			: " + SingleActEffect0_Frame + "\n")
	//print("SingleActEffect1_Name			: " + SingleActEffect1_Name + "\n")
	//print("SingleActEffect1_Frame			: " + SingleActEffect1_Frame + "\n")
	//print("AllActEffect0_Name				: " + AllActEffect0_Name + "\n")
	//print("AllActEffect0_Frame				: " + AllActEffect0_Frame + "\n")
	//print("AllActEffect1_Name				: " + AllActEffect1_Name + "\n")
	//print("AllActEffect1_Frame				: " + AllActEffect1_Frame + "\n")
	//print("ActEffectFlag					: " + ActEffectFlag + "\n")
	//print("SingleActEffectAttach			: " + SingleActEffectAttach + "\n")
	//print("EffectFrame						: " + EffectFrame + "\n")
	//
	//print("EffectFrame_DamageDirectionWait	: " + EffectFrame_DamageDirectionWait + "\n")
	//print("EffectFrame_EndWait				: " + EffectFrame_EndWait + "\n")
	//
	//
	//
	//print("BAKURETSU_AllOnlyWait	: " + BAKURETSU_AllOnlyWait + "\n")
	//print("ShakeFlag			: " + ShakeFlag + "\n")
	//print("SingleTargetFlag			: " + SingleTargetFlag + "\n")
	//
	//print("EffectAreaFlag			: " + EffectAreaFlag + "\n")
	//print("EffectEmpty_Area			: " + EffectEmpty_Area + "\n")
	//print("EffectAttach				: " + EffectAttach + "\n")
	//print("SelfTargetFlag			: " + SelfTargetFlag + "\n")
	//print("LineEffect_WaitFlag			: " + LineEffect_WaitFlag + "\n")
	
	}
}

//Empty情報クラス（パーティのみ）
class cEmptyInfo
{
	PartyNum = null;			//パーティの数
	Empty = null;				//モンスター配置用Empty
	Empty_Substitute = null;	//モンスター配置用（みがわり対象外）Empty
	Rotate = null;				//モンスター配置用向き情報
	UpCam = null;				//アップ表示用カメラ
	UpCamTgt = null;			//アップ表示用カメラターゲット
	UpCamN = null;				//アップ表示用カメラ（Ｎサイズ用）
	UpCamTgtN = null;			//アップ表示用カメラターゲット（Ｎサイズ用）
	UpCamM = null;				//アップ表示用カメラ（Ｍサイズ用）
	UpCamTgtM = null;			//アップ表示用カメラターゲット（Ｍサイズ用）
	Cam_Area = null;			//全体表示用カメラ
	CamTgt_Area = null;			//全体表示用カメラターゲット
	Cam_God = null;				//全体表示用カメラ（GODHAND用）
	CamTgt_God = null;			//全体表示用カメラターゲット（GODHAND用）
	Empty_Master = null;		//全体配置時マスター座標
	Rotate_Master = null;		//全体配置時マスター向き
	Cam_Master = null;			//マスター表示用カメラ
	CamTgt_Master = null;		//マスターカメラターゲット
	StandbyCutRunner = null;	//StandbyCut用Empty
	StandbyCutCam = null;		//StandbyCut用カメラ
	StandbyCutCamTgt = null;	//StandbyCut用カメラターゲット
	EffectEmpty_Area = null;	//全体表示エフェクト座標
	EffectScale_Area = null;	//全体表示時のエフェクト倍率
	
	constructor(PartyType,Index,IndexCount)
	{
		//DebugPrint("Class_" + "ConstructorIN" + "_" + "cPartyEmptyInfo");
		
		
		local AllyFlag = IsAlly_(Index);
		if(PartyType == PARTYTYPE.S4){
			//共通設定
			if(AllyFlag == true){
				Cam_Area			= "camera_000_ALLYS4";
				CamTgt_Area			= "camtgt_000_ALLYS4";
				Cam_Master			= "camera_100_ALLYS4_Master";
				CamTgt_Master		= "camtgt_100_ALLYS4_Master";
				EffectEmpty_Area	= "pos_301_ALLYEffectS";
				EffectScale_Area	= 1.0;
				Cam_God				= "camera_000_ALLYS4_GOD";
				CamTgt_God			= "camtgt_000_ALLYS4_GOD";
				Empty_Master		= "move_000_S01S4master";
				Rotate_Master		= 180;
			} else {
				Cam_Area			= "camera_001_ENEMYS4";
				CamTgt_Area			= "camtgt_001_ENEMYS4";
				Cam_Master			= "camera_100_ENEMYS4_Master";
				CamTgt_Master		= "camtgt_100_ENEMYS4_Master";
				EffectEmpty_Area	= "pos_351_ENEMYEffectS";
				EffectScale_Area	= 1.0;
				Cam_God				= "camera_001_ENEMYS4_GOD";
				CamTgt_God			= "camtgt_001_ENEMYS4_GOD";
				Empty_Master		= "move_014_S05S4master";
				Rotate_Master		= 0;
			}
			//以下個別設定
			if(IndexCount == 0){
				if(AllyFlag == true){	Empty				= "move_001_S01S4target";
										Empty_Substitute	= "move_001_S01S4target_Substitute";
										Rotate				= 180;
										UpCam				= "camera_101_ALLYS4_00"
										UpCamTgt			= "camtgt_101_ALLYS4_00"
										UpCamN				= "camera_101_ALLYN4_00"
										UpCamTgtN			= "camtgt_101_ALLYN4_00"
										UpCamM				= "camera_101_ALLYM4_00"
										UpCamTgtM			= "camtgt_101_ALLYM4_00"
										StandbyCutRunner	= "move_051_S01S4targetRun"
										StandbyCutCam		= "camera_021_ALLYS401ZOOM"
										StandbyCutCamTgt	= "camtgt_021_ALLYS401ZOOM"
				} else 				{	Empty				= "move_015_S05S4target";
										Empty_Substitute	= "move_015_S05S4target_Substitute";
										Rotate				= 0;
										UpCam				= "camera_115_ENEMYS4_00"
										UpCamTgt			= "camtgt_115_ENEMYS4_00"
										UpCamN				= "camera_115_ENEMYN4_00"
										UpCamTgtN			= "camtgt_115_ENEMYN4_00"
										UpCamM				= "camera_115_ENEMYM4_00"
										UpCamTgtM			= "camtgt_115_ENEMYM4_00"
										StandbyCutRunner	= "move_065_S05S4targetRun"
										StandbyCutCam		= "camera_031_ENEMYS401ZOOM"
										StandbyCutCamTgt	= "camtgt_031_ENEMYS401ZOOM"
				}
			} else if(IndexCount == 1){
				if(AllyFlag == true){	Empty				= "move_002_S01S4target";
										Empty_Substitute	= "move_002_S01S4target_Substitute";
										Rotate				= 180;
										UpCam				= "camera_102_ALLYS4_01"
										UpCamTgt			= "camtgt_102_ALLYS4_01"
										UpCamN				= "camera_102_ALLYN4_01"
										UpCamTgtN			= "camtgt_102_ALLYN4_01"
										UpCamM				= "camera_102_ALLYM4_01"
										UpCamTgtM			= "camtgt_102_ALLYM4_01"
										StandbyCutRunner	= "move_052_S01S4targetRun"
										StandbyCutCam		= "camera_022_ALLYS402ZOOM"
										StandbyCutCamTgt	= "camtgt_022_ALLYS402ZOOM"
				} else 				{	Empty				= "move_016_S05S4target";
										Empty_Substitute	= "move_016_S05S4target_Substitute";
										Rotate				= 0;
										UpCam				= "camera_116_ENEMYS4_01"
										UpCamTgt			= "camtgt_116_ENEMYS4_01"
										UpCamN				= "camera_116_ENEMYN4_01"
										UpCamTgtN			= "camtgt_116_ENEMYN4_01"
										UpCamM				= "camera_116_ENEMYM4_01"
										UpCamTgtM			= "camtgt_116_ENEMYM4_01"
										StandbyCutRunner	= "move_066_S05S4targetRun"
										StandbyCutCam		= "camera_032_ENEMYS402ZOOM"
										StandbyCutCamTgt	= "camtgt_032_ENEMYS402ZOOM"
				}
			} else if(IndexCount == 2){
				if(AllyFlag == true){	Empty				= "move_003_S01S4target";
										Empty_Substitute	= "move_003_S01S4target_Substitute";
										Rotate				= 180;
										UpCam				= "camera_103_ALLYS4_02"
										UpCamTgt			= "camtgt_103_ALLYS4_02"
										UpCamN				= "camera_103_ALLYN4_02"
										UpCamTgtN			= "camtgt_103_ALLYN4_02"
										UpCamM				= "camera_103_ALLYM4_02"
										UpCamTgtM			= "camtgt_103_ALLYM4_02"
										StandbyCutRunner	= "move_053_S01S4targetRun"
										StandbyCutCam		= "camera_023_ALLYS403ZOOM"
										StandbyCutCamTgt	= "camtgt_023_ALLYS403ZOOM"
				} else 				{	Empty				= "move_017_S05S4target";
										Empty_Substitute	= "move_017_S05S4target_Substitute";
										Rotate				= 0;
										UpCam				= "camera_117_ENEMYS4_02"
										UpCamTgt			= "camtgt_117_ENEMYS4_02"
										UpCamN				= "camera_117_ENEMYN4_02"
										UpCamTgtN			= "camtgt_117_ENEMYN4_02"
										UpCamM				= "camera_117_ENEMYM4_02"
										UpCamTgtM			= "camtgt_117_ENEMYM4_02"
										StandbyCutRunner	= "move_067_S05S4targetRun"
										StandbyCutCam		= "camera_033_ENEMYS403ZOOM"
										StandbyCutCamTgt	= "camtgt_033_ENEMYS403ZOOM"
				}
			} else if(IndexCount == 3){
				if(AllyFlag == true){	Empty				= "move_004_S01S4target";
										Empty_Substitute	= "move_004_S01S4target_Substitute";
										Rotate				= 180;
										UpCam				= "camera_104_ALLYS4_03"
										UpCamTgt			= "camtgt_104_ALLYS4_03"
										UpCamN				= "camera_104_ALLYN4_03"
										UpCamTgtN			= "camtgt_104_ALLYN4_03"
										UpCamM				= "camera_104_ALLYM4_03"
										UpCamTgtM			= "camtgt_104_ALLYM4_03"
										StandbyCutRunner	= "move_054_S01S4targetRun"
										StandbyCutCam		= "camera_024_ALLYS404ZOOM"
										StandbyCutCamTgt	= "camtgt_024_ALLYS404ZOOM"
				} else 				{	Empty				= "move_018_S05S4target";
										Empty_Substitute	= "move_018_S05S4target_Substitute";
										Rotate				= 0;
										UpCam				= "camera_118_ENEMYS4_03"
										UpCamTgt			= "camtgt_118_ENEMYS4_03"
										UpCamN				= "camera_118_ENEMYN4_03"
										UpCamTgtN			= "camtgt_118_ENEMYN4_03"
										UpCamM				= "camera_118_ENEMYM4_03"
										UpCamTgtM			= "camtgt_118_ENEMYM4_03"
										StandbyCutRunner	= "move_068_S05S4targetRun"
										StandbyCutCam		= "camera_034_ENEMYS404ZOOM"
										StandbyCutCamTgt	= "camtgt_034_ENEMYS404ZOOM"
				}
			}
		} else if(PartyType == PARTYTYPE.S3){
			//共通設定
			if(AllyFlag == true){
				Cam_Area			= "camera_000_ALLYS4";
				CamTgt_Area			= "camtgt_000_ALLYS4";
				Cam_Master			= "camera_100_ALLYS4_Master";
				CamTgt_Master		= "camtgt_100_ALLYS4_Master";
				EffectEmpty_Area	= "pos_301_ALLYEffectS";
				EffectScale_Area	= 1.0;
				Cam_God				= "camera_000_ALLYS4_GOD";
				CamTgt_God			= "camtgt_000_ALLYS4_GOD";
				Empty_Master		= "move_000_S01S4master";
				Rotate_Master		= 180;
			} else {
				Cam_Area			= "camera_001_ENEMYS4";
				CamTgt_Area			= "camtgt_001_ENEMYS4";
				Cam_Master			= "camera_100_ENEMYS4_Master";
				CamTgt_Master		= "camtgt_100_ENEMYS4_Master";
				EffectEmpty_Area	= "pos_351_ENEMYEffectS";
				EffectScale_Area	= 1.0;
				Cam_God				= "camera_001_ENEMYS4_GOD";
				CamTgt_God			= "camtgt_001_ENEMYS4_GOD";
				Empty_Master		= "move_014_S05S4master";
				Rotate_Master		= 0;
			}
			//以下個別設定
			if(IndexCount == 0){
				if(AllyFlag == true){	Empty				= "move_006_S02S3target";
										Empty_Substitute	= "move_006_S02S3target_Substitute";
										Rotate				= 180;
										UpCam				= "camera_105_ALLYS3_00"
										UpCamTgt			= "camtgt_105_ALLYS3_00"
										UpCamN				= "camera_105_ALLYN3_00"
										UpCamTgtN			= "camtgt_105_ALLYN3_00"
										UpCamM				= "camera_105_ALLYM3_00"
										UpCamTgtM			= "camtgt_105_ALLYM3_00"
										StandbyCutRunner	= "move_056_S02S3targetRun"
										StandbyCutCam		= "camera_025_ALLYS301ZOOM"
										StandbyCutCamTgt	= "camtgt_025_ALLYS301ZOOM"
				} else 				{	Empty				= "move_020_S06S3target";
										Empty_Substitute	= "move_020_S06S3target_Substitute";
										Rotate				= 0;
										UpCam				= "camera_120_ENEMYS3_00"
										UpCamTgt			= "camtgt_120_ENEMYS3_00"
										UpCamN				= "camera_120_ENEMYN3_00"
										UpCamTgtN			= "camtgt_120_ENEMYN3_00"
										UpCamM				= "camera_120_ENEMYM3_00"
										UpCamTgtM			= "camtgt_120_ENEMYM3_00"
										StandbyCutRunner	= "move_070_S06S3targetRun"
										StandbyCutCam		= "camera_035_ENEMYS301ZOOM"
										StandbyCutCamTgt	= "camtgt_035_ENEMYS301ZOOM"
				}
			} else if(IndexCount == 1){
				if(AllyFlag == true){	Empty				= "move_007_S02S3target";
										Empty_Substitute	= "move_007_S02S3target_Substitute";
										Rotate				= 180;
										UpCam				= "camera_106_ALLYS3_01"
										UpCamTgt			= "camtgt_106_ALLYS3_01"
										UpCamN				= "camera_106_ALLYN3_01"
										UpCamTgtN			= "camtgt_106_ALLYN3_01"
										UpCamM				= "camera_106_ALLYM3_01"
										UpCamTgtM			= "camtgt_106_ALLYM3_01"
										StandbyCutRunner	= "move_057_S02S3targetRun"
										StandbyCutCam		= "camera_026_ALLYS302ZOOM"
										StandbyCutCamTgt	= "camtgt_026_ALLYS302ZOOM"
				} else 				{	Empty				= "move_021_S06S3target";
										Empty_Substitute	= "move_021_S06S3target_Substitute";
										Rotate				= 0;
										UpCam				= "camera_121_ENEMYS3_01"
										UpCamTgt			= "camtgt_121_ENEMYS3_01"
										UpCamN				= "camera_121_ENEMYN3_01"
										UpCamTgtN			= "camtgt_121_ENEMYN3_01"
										UpCamM				= "camera_121_ENEMYM3_01"
										UpCamTgtM			= "camtgt_121_ENEMYM3_01"
										StandbyCutRunner	= "move_071_S06S3targetRun"
										StandbyCutCam		= "camera_036_ENEMYS302ZOOM"
										StandbyCutCamTgt	= "camtgt_036_ENEMYS302ZOOM"
				}
			} else if(IndexCount == 2){
				if(AllyFlag == true){	Empty				= "move_008_S02S3target";
										Empty_Substitute	= "move_008_S02S3target_Substitute";
										Rotate				= 180;
										UpCam				= "camera_107_ALLYS3_02"
										UpCamTgt			= "camtgt_107_ALLYS3_02"
										UpCamN				= "camera_107_ALLYN3_02"
										UpCamTgtN			= "camtgt_107_ALLYN3_02"
										UpCamM				= "camera_107_ALLYM3_02"
										UpCamTgtM			= "camtgt_107_ALLYM3_02"
										StandbyCutRunner	= "move_058_S02S3targetRun"
										StandbyCutCam		= "camera_027_ALLYS302ZOOM"
										StandbyCutCamTgt	= "camtgt_027_ALLYS303ZOOM"
				} else 				{	Empty				= "move_022_S06S3target";
										Empty_Substitute	= "move_022_S06S3target_Substitute";
										Rotate				= 0;
										UpCam				= "camera_122_ENEMYS3_02"
										UpCamTgt			= "camtgt_122_ENEMYS3_02"
										UpCamN				= "camera_122_ENEMYN3_02"
										UpCamTgtN			= "camtgt_122_ENEMYN3_02"
										UpCamM				= "camera_122_ENEMYM3_02"
										UpCamTgtM			= "camtgt_122_ENEMYM3_02"
										StandbyCutRunner	= "move_072_S06S3targetRun"
										StandbyCutCam		= "camera_037_ENEMYS303ZOOM"
										StandbyCutCamTgt	= "camtgt_037_ENEMYS302ZOOM"
				}
			}
		} else if(PartyType == PARTYTYPE.S2){
			//共通設定
			if(AllyFlag == true){
				Cam_Area			= "camera_000_ALLYS4";
				CamTgt_Area			= "camtgt_000_ALLYS4";
				Cam_Master			= "camera_100_ALLYS4_Master";
				CamTgt_Master		= "camtgt_100_ALLYS4_Master";
				EffectEmpty_Area	= "pos_301_ALLYEffectS";
				EffectScale_Area	= 1.0;
				Cam_God				= "camera_000_ALLYS4_GOD";
				CamTgt_God			= "camtgt_000_ALLYS4_GOD";
				Empty_Master		= "move_000_S01S4master";
				Rotate_Master		= 180;
			} else {
				Cam_Area			= "camera_001_ENEMYS4";
				CamTgt_Area			= "camtgt_001_ENEMYS4";
				Cam_Master			= "camera_100_ENEMYS4_Master";
				CamTgt_Master		= "camtgt_100_ENEMYS4_Master";
				EffectEmpty_Area	= "pos_351_ENEMYEffectS";
				EffectScale_Area	= 1.0;
				Cam_God				= "camera_001_ENEMYS4_GOD";
				CamTgt_God			= "camtgt_001_ENEMYS4_GOD";
				Empty_Master		= "move_014_S05S4master";
				Rotate_Master		= 0;
			}
			//以下個別設定
			if(IndexCount == 0){
				if(AllyFlag == true){	Empty				= "move_006_S02S3target";
										Empty_Substitute	= "move_006_S02S3target_Substitute";
										Rotate				= 180;
										UpCam				= "camera_105_ALLYS3_00"
										UpCamTgt			= "camtgt_105_ALLYS3_00"
										UpCamN				= "camera_105_ALLYN3_00"
										UpCamTgtN			= "camtgt_105_ALLYN3_00"
										UpCamM				= "camera_105_ALLYM3_00"
										UpCamTgtM			= "camtgt_105_ALLYM3_00"
										StandbyCutRunner	= "move_056_S02S3targetRun"
										StandbyCutCam		= "camera_025_ALLYS301ZOOM"
										StandbyCutCamTgt	= "camtgt_025_ALLYS301ZOOM"
				} else 				{	Empty				= "move_020_S06S3target";
										Empty_Substitute	= "move_020_S06S3target_Substitute";
										Rotate				= 0;
										UpCam				= "camera_120_ENEMYS3_00"
										UpCamTgt			= "camtgt_120_ENEMYS3_00"
										UpCamN				= "camera_120_ENEMYN3_00"
										UpCamTgtN			= "camtgt_120_ENEMYN3_00"
										UpCamM				= "camera_120_ENEMYM3_00"
										UpCamTgtM			= "camtgt_120_ENEMYM3_00"
										StandbyCutRunner	= "move_070_S06S3targetRun"
										StandbyCutCam		= "camera_035_ENEMYS301ZOOM"
										StandbyCutCamTgt	= "camtgt_035_ENEMYS301ZOOM"
				}
			} else if(IndexCount == 1){
				if(AllyFlag == true){	Empty				= "move_008_S02S3target";
										Empty_Substitute	= "move_008_S02S3target_Substitute";
										Rotate				= 180;
										UpCam				= "camera_107_ALLYS3_02"
										UpCamTgt			= "camtgt_107_ALLYS3_02"
										UpCamN				= "camera_107_ALLYN3_02"
										UpCamTgtN			= "camtgt_107_ALLYN3_02"
										UpCamM				= "camera_107_ALLYM3_02"
										UpCamTgtM			= "camtgt_107_ALLYM3_02"
										StandbyCutRunner	= "move_058_S02S3targetRun"
										StandbyCutCam		= "camera_027_ALLYS302ZOOM"
										StandbyCutCamTgt	= "camtgt_027_ALLYS303ZOOM"
				} else 				{	Empty				= "move_022_S06S3target";
										Empty_Substitute	= "move_022_S06S3target_Substitute";
										Rotate				= 0;
										UpCam				= "camera_122_ENEMYS3_02"
										UpCamTgt			= "camtgt_122_ENEMYS3_02"
										UpCamN				= "camera_122_ENEMYN3_02"
										UpCamTgtN			= "camtgt_122_ENEMYN3_02"
										UpCamM				= "camera_122_ENEMYM3_02"
										UpCamTgtM			= "camtgt_122_ENEMYM3_02"
										StandbyCutRunner	= "move_072_S06S3targetRun"
										StandbyCutCam		= "camera_037_ENEMYS303ZOOM"
										StandbyCutCamTgt	= "camtgt_037_ENEMYS302ZOOM"
				}
			}
		} else if(PartyType == PARTYTYPE.S1){
			//共通設定
			if(AllyFlag == true){
				Cam_Area			= "camera_000_ALLYS4";
				CamTgt_Area			= "camtgt_000_ALLYS4";
				Cam_Master			= "camera_100_ALLYS4_Master";
				CamTgt_Master		= "camtgt_100_ALLYS4_Master";
				EffectEmpty_Area	= "pos_301_ALLYEffectS";
				EffectScale_Area	= 1.0;
				Cam_God				= "camera_000_ALLYS4_GOD";
				CamTgt_God			= "camtgt_000_ALLYS4_GOD";
				Empty_Master		= "move_000_S01S4master";
				Rotate_Master		= 180;
			} else {
				Cam_Area			= "camera_001_ENEMYS4";
				CamTgt_Area			= "camtgt_001_ENEMYS4";
				Cam_Master			= "camera_100_ENEMYS4_Master";
				CamTgt_Master		= "camtgt_100_ENEMYS4_Master";
				EffectEmpty_Area	= "pos_351_ENEMYEffectS";
				EffectScale_Area	= 1.0;
				Cam_God				= "camera_001_ENEMYS4_GOD";
				CamTgt_God			= "camtgt_001_ENEMYS4_GOD";
				Empty_Master		= "move_014_S05S4master";
				Rotate_Master		= 0;
			}
			//以下個別設定
			if(IndexCount == 0){
				if(AllyFlag == true){	Empty				= "move_007_S02S3target";
										Empty_Substitute	= "move_007_S02S3target_Substitute";
										Rotate				= 180;
										UpCam				= "camera_106_ALLYS3_01"
										UpCamTgt			= "camtgt_106_ALLYS3_01"
										UpCamN				= "camera_106_ALLYN3_01"
										UpCamTgtN			= "camtgt_106_ALLYN3_01"
										UpCamM				= "camera_106_ALLYM3_01"
										UpCamTgtM			= "camtgt_106_ALLYM3_01"
										StandbyCutRunner	= "move_057_S02S3targetRun"
										StandbyCutCam		= "camera_026_ALLYS302ZOOM"
										StandbyCutCamTgt	= "camtgt_026_ALLYS302ZOOM"
				} else 				{	Empty				= "move_021_S06S3target";
										Empty_Substitute	= "move_021_S06S3target_Substitute";
										Rotate				= 0;
										UpCam				= "camera_121_ENEMYS3_01"
										UpCamTgt			= "camtgt_121_ENEMYS3_01"
										UpCamN				= "camera_121_ENEMYN3_01"
										UpCamTgtN			= "camtgt_121_ENEMYN3_01"
										UpCamM				= "camera_121_ENEMYM3_01"
										UpCamTgtM			= "camtgt_121_ENEMYM3_01"
										StandbyCutRunner	= "move_071_S06S3targetRun"
										StandbyCutCam		= "camera_036_ENEMYS302ZOOM"
										StandbyCutCamTgt	= "camtgt_036_ENEMYS302ZOOM"
				}
			}
		} else if(PartyType == PARTYTYPE.SG){
			//共通設定
			if(AllyFlag == true){
				Cam_Area			= "camera_002_ALLYSG";
				CamTgt_Area			= "camtgt_002_ALLYSG";
				Cam_Master			= "camera_100_ALLYSG_Master";
				CamTgt_Master		= "camtgt_100_ALLYSG_Master";
				EffectEmpty_Area	= "pos_303_ALLYEffectG";
				EffectScale_Area	= 2.0;
				Cam_God				= "camera_002_ALLYSG";
				CamTgt_God			= "camtgt_002_ALLYSG";
				Empty_Master		= "move_009_S03SGmaster";
				Rotate_Master		= 180;
			} else {
				Cam_Area			= "camera_008_ENEMYSG";
				CamTgt_Area			= "camtgt_008_ENEMYSG";
				Cam_Master			= "camera_100_ENEMYSG_Master";
				CamTgt_Master		= "camtgt_100_ENEMYSG_Master";
				EffectEmpty_Area	= "pos_353_ENEMYEffectG";
				EffectScale_Area	= 2.0;
				Cam_God				= "camera_008_ENEMYSG";
				CamTgt_God			= "camtgt_008_ENEMYSG";
				Empty_Master		= "move_023_S07SGmaster";
				Rotate_Master		= 0;
			}
			//以下個別設定
			if(IndexCount == 0){
				if(AllyFlag == true){	Empty				= "move_010_S03SGtarget";
										Empty_Substitute	= "move_010_S03SGtarget_Substitute";
										Rotate				= 180;
										UpCam				= "camera_110_ALLYSG_00"
										UpCamTgt			= "camtgt_110_ALLYSG_00"
										UpCamN				= "camera_110_ALLYSG_00"	//SN共通
										UpCamTgtN			= "camtgt_110_ALLYSG_00"
										UpCamM				= null
										UpCamTgtM			= null
										StandbyCutRunner	= "move_060_S03SGtargetRun"
										StandbyCutCam		= "camera_021_ALLYS401ZOOM"
										StandbyCutCamTgt	= "camtgt_021_ALLYS401ZOOM"
				} else 				{	Empty				= "move_024_S07SGtarget";
										Empty_Substitute	= "move_024_S07SGtarget_Substitute"
										Rotate				= 0;
										UpCam				= "camera_124_ENEMYSG_00"
										UpCamTgt			= "camtgt_124_ENEMYSG_00"
										UpCamN				= "camera_124_ENEMYSG_00"
										UpCamTgtN			= "camtgt_124_ENEMYSG_00"
										UpCamM				= null
										UpCamTgtM			= null
										StandbyCutRunner	= "move_074_S07SGtargetRun"
										StandbyCutCam		= "camera_031_ENEMYS401ZOOM"
										StandbyCutCamTgt	= "camtgt_031_ENEMYS401ZOOM"
				}
			} else if(IndexCount == 1){
				if(AllyFlag == true){	Empty				= "move_011_S03SGtarget";
										Empty_Substitute	= "move_011_S03SGtarget_Substitute";
										Rotate				= 180;
										UpCam				= "camera_111_ALLYSG_01"
										UpCamTgt			= "camtgt_111_ALLYSG_01"
										UpCamN				= "camera_111_ALLYSG_01"
										UpCamTgtN			= "camtgt_111_ALLYSG_01"
										UpCamM				= null
										UpCamTgtM			= null
										StandbyCutRunner	= "move_061_S03SGtargetRun"
										StandbyCutCam		= "camera_029_ALLYSG02ZOOM"
										StandbyCutCamTgt	= "camtgt_029_ALLYSG02ZOOM"
				} else 				{	Empty				= "move_025_S07SGtarget";
										Empty_Substitute	= "move_025_S07SGtarget_Substitute";
										Rotate				= 0;
										UpCam				= "camera_125_ENEMYSG_01"
										UpCamTgt			= "camtgt_125_ENEMYSG_01"
										UpCamN				= "camera_125_ENEMYSG_01"
										UpCamTgtN			= "camtgt_125_ENEMYSG_01"
										UpCamM				= null
										UpCamTgtM			= null
										StandbyCutRunner	= "move_075_S07SGtargetRun"
										StandbyCutCam		= "camera_039_ENEMYSG02ZOOM"
										StandbyCutCamTgt	= "camtgt_039_ENEMYSG02ZOOM"
				}
			}
		} else if(PartyType == PARTYTYPE.GS){
			//共通設定
			if(AllyFlag == true){
				Cam_Area			= "camera_002_ALLYSG";
				CamTgt_Area			= "camtgt_002_ALLYSG";
				Cam_Master			= "camera_100_ALLYSG_Master";
				CamTgt_Master		= "camtgt_100_ALLYSG_Master";
				EffectEmpty_Area	= "pos_303_ALLYEffectG";
				EffectScale_Area	= 2.0;
				Cam_God				= "camera_002_ALLYSG";
				CamTgt_God			= "camtgt_002_ALLYSG";
				Empty_Master		= "move_009_S03SGmaster";
				Rotate_Master		= 180;
			} else {
				Cam_Area			= "camera_008_ENEMYSG";
				CamTgt_Area			= "camtgt_008_ENEMYSG";
				Cam_Master			= "camera_100_ENEMYSG_Master";
				CamTgt_Master		= "camtgt_100_ENEMYSG_Master";
				EffectEmpty_Area	= "pos_353_ENEMYEffectG";
				EffectScale_Area	= 2.0;
				Cam_God				= "camera_008_ENEMYSG";
				CamTgt_God			= "camtgt_008_ENEMYSG";
				Empty_Master		= "move_023_S07SGmaster";
				Rotate_Master		= 0;
			}
			//以下個別設定
			if(IndexCount == 0){
				if(AllyFlag == true){	Empty				= "move_011_S03SGtarget";
										Empty_Substitute	= "move_011_S03SGtarget_Substitute";
										Rotate				= 180;
										UpCam				= "camera_111_ALLYSG_01"
										UpCamTgt			= "camtgt_111_ALLYSG_01"
										UpCamN				= "camera_111_ALLYSG_01"
										UpCamTgtN			= "camtgt_111_ALLYSG_01"
										UpCamM				= null
										UpCamTgtM			= null
										StandbyCutRunner	= "move_061_S03SGtargetRun"
										StandbyCutCam		= "camera_029_ALLYSG02ZOOM"
										StandbyCutCamTgt	= "camtgt_029_ALLYSG02ZOOM"
				} else 				{	Empty				= "move_025_S07SGtarget";
										Empty_Substitute	= "move_025_S07SGtarget_Substitute";
										Rotate				= 0;
										UpCam				= "camera_125_ENEMYSG_01"
										UpCamTgt			= "camtgt_125_ENEMYSG_01"
										UpCamN				= "camera_125_ENEMYSG_01"
										UpCamTgtN			= "camtgt_125_ENEMYSG_01"
										UpCamM				= null
										UpCamTgtM			= null
										StandbyCutRunner	= "move_075_S07SGtargetRun"
										StandbyCutCam		= "camera_039_ENEMYSG02ZOOM"
										StandbyCutCamTgt	= "camtgt_039_ENEMYSG02ZOOM"
				}
			} else if(IndexCount == 1){
				if(AllyFlag == true){	Empty				= "move_012_S03SGtarget";
										Empty_Substitute	= "move_012_S03SGtarget_Substitute";
										Rotate				= 180;
										UpCam				= "camera_112_ALLYSG_02"
										UpCamTgt			= "camtgt_112_ALLYSG_02"
										UpCamN				= "camera_112_ALLYSG_02"
										UpCamTgtN			= "camtgt_112_ALLYSG_02"
										UpCamM				= null
										UpCamTgtM			= null
										StandbyCutRunner	= "move_062_S03SGtargetRun"
										StandbyCutCam		= "camera_024_ALLYS404ZOOM"
										StandbyCutCamTgt	= "camtgt_024_ALLYS404ZOOM"
				} else 				{	Empty				= "move_026_S07SGtarget";
										Empty_Substitute	= "move_026_S07SGtarget_Substitute";
										Rotate				= 0;
										UpCam				= "camera_126_ENEMYSG_02"
										UpCamTgt			= "camtgt_126_ENEMYSG_02"
										UpCamN				= "camera_126_ENEMYSG_02"
										UpCamTgtN			= "camtgt_126_ENEMYSG_02"
										UpCamM				= null
										UpCamTgtM			= null
										StandbyCutRunner	= "move_076_S07SGtargetRun"
										StandbyCutCam		= "camera_034_ENEMYS404ZOOM"
										StandbyCutCamTgt	= "camtgt_034_ENEMYS404ZOOM"
				}
			}
		} else if(PartyType == PARTYTYPE.G1){
			//共通設定
			if(AllyFlag == true){
				Cam_Area			= "camera_002_ALLYSG";
				CamTgt_Area			= "camtgt_002_ALLYSG";
				Cam_Master			= "camera_100_ALLYSG_Master";
				CamTgt_Master		= "camtgt_100_ALLYSG_Master";
				EffectEmpty_Area	= "pos_303_ALLYEffectG";
				EffectScale_Area	= 2.0;
				Cam_God				= "camera_002_ALLYSG";
				CamTgt_God			= "camtgt_002_ALLYSG";
				Empty_Master		= "move_009_S03SGmaster";
				Rotate_Master		= 180;
			} else {
				Cam_Area			= "camera_008_ENEMYSG";
				CamTgt_Area			= "camtgt_008_ENEMYSG";
				Cam_Master			= "camera_100_ENEMYSG_Master";
				CamTgt_Master		= "camtgt_100_ENEMYSG_Master";
				EffectEmpty_Area	= "pos_353_ENEMYEffectG";
				EffectScale_Area	= 2.0;
				Cam_God				= "camera_008_ENEMYSG";
				CamTgt_God			= "camtgt_008_ENEMYSG";
				Empty_Master		= "move_023_S07SGmaster";
				Rotate_Master		= 0;
			}
			//以下個別設定
			if(IndexCount == 0){
				if(AllyFlag == true){	Empty				= "move_011_S03SGtarget";
										Empty_Substitute	= "move_011_S03SGtarget_Substitute";
										Rotate				= 180;
										UpCam				= "camera_111_ALLYSG_01"
										UpCamTgt			= "camtgt_111_ALLYSG_01"
										UpCamN				= "camera_111_ALLYSG_01"
										UpCamTgtN			= "camtgt_111_ALLYSG_01"
										UpCamM				= null
										UpCamTgtM			= null
										StandbyCutRunner	= "move_061_S03SGtargetRun"
										StandbyCutCam		= "camera_029_ALLYSG02ZOOM"
										StandbyCutCamTgt	= "camtgt_029_ALLYSG02ZOOM"
				} else 				{	Empty				= "move_025_S07SGtarget";
										Empty_Substitute	= "move_025_S07SGtarget_Substitute";
										Rotate				= 0;
										UpCam				= "camera_125_ENEMYSG_01"
										UpCamTgt			= "camtgt_125_ENEMYSG_01"
										UpCamN				= "camera_125_ENEMYSG_01"
										UpCamTgtN			= "camtgt_125_ENEMYSG_01"
										UpCamM				= null
										UpCamTgtM			= null
										StandbyCutRunner	= "move_075_S07SGtargetRun"
										StandbyCutCam		= "camera_039_ENEMYSG02ZOOM"
										StandbyCutCamTgt	= "camtgt_039_ENEMYSG02ZOOM"
				}
			}
		} else if(PartyType == PARTYTYPE.T1){
			//共通設定
			if(AllyFlag == true){
				Cam_Area			= "camera_003_ALLYT1";
				CamTgt_Area			= "camtgt_003_ALLYT1";
				Cam_Master			= "camera_100_ALLYSG_Master";
				CamTgt_Master		= "camtgt_100_ALLYT1_Master";
				EffectEmpty_Area	= "pos_304_ALLYEffectT";
				EffectScale_Area	= 3.0;
				Cam_God				= "camera_003_ALLYT1";
				CamTgt_God			= "camtgt_003_ALLYT1";
				Empty_Master		= "move_012_S04T1master";
				Rotate_Master		= 180;
			} else {
				Cam_Area			= "camera_009_ENEMYT1";
				CamTgt_Area			= "camtgt_009_ENEMYT1";
				Cam_Master			= "camera_100_ENEMYT1_Master";
				CamTgt_Master		= "camtgt_100_ENEMYT1_Master";
				EffectEmpty_Area	= "pos_354_ENEMYEffectT";
				EffectScale_Area	= 3.0;
				Cam_God				= "camera_009_ENEMYT1";
				CamTgt_God			= "camtgt_009_ENEMYT1";
				Empty_Master		= "move_026_S08T1master";
				Rotate_Master		= 0;
			}
			//以下個別設定
			if(IndexCount == 0){
				if(AllyFlag == true){	Empty				= "move_013_S04T1target";
										Empty_Substitute	= "move_013_S04T1target";//Tではみがわりが発生しない
										Rotate				= 180;
										UpCam				= "camera_113_ALLYT1_00"
										UpCamTgt			= "camtgt_113_ALLYT1_00"
										UpCamN				= "camera_113_ALLYT1_00"
										UpCamTgtN			= "camtgt_113_ALLYT1_00"
										UpCamM				= null
										UpCamTgtM			= null
										StandbyCutRunner	= "move_063_S04T1targetRun"
										StandbyCutCam		= "camera_030_ALLYT101ZOOM"
										StandbyCutCamTgt	= "camtgt_030_ALLYT101ZOOM"
				} else 				{	Empty				= "move_027_S08T1target";
										Empty_Substitute	= "move_027_S08T1target";//Tではみがわりが発生しない
										Rotate				= 0;
										UpCam				= "camera_127_ENEMYT1_00"
										UpCamTgt			= "camtgt_127_ENEMYT1_00"
										UpCamN				= "camera_127_ENEMYT1_00"
										UpCamTgtN			= "camtgt_127_ENEMYT1_00"
										UpCamM				= null
										UpCamTgtM			= null
										StandbyCutRunner	= "move_077_S08T1targetRun"
										StandbyCutCam		= "camera_040_ENEMYT101ZOOM"
										StandbyCutCamTgt	= "camtgt_040_ENEMYT101ZOOM"
				}
			}
		}
		//DebugPrint("Class_" + "ConstructorOUT" + "_" + "cPartyEmptyInfo");
	}
}

// BattleCommon初期化関数
function BattleCommon_Init()
{
	g_ShowCriticalGuard <- false;
	g_ShowGambleBody <- false;
	g_funcDepth <- 0;
}
		
// 会心かんぜんガードが有効か
function IsActiveCriticalGuard(MultiCount, IndexCount, MultiStageCount)
{
	return (IsCritical_(MultiCount, IndexCount, MultiStageCount) && IsCriticalGuard_(MultiCount, IndexCount));
}

// ステータス関連関数定義開始===========================
function GetStatusResetWait( status )
{
	switch(status)
	{
	case STATUS.TENSION:
	case STATUS.ATTACK:
	case STATUS.DEFENCE:
	case STATUS.QUICK:
	case STATUS.WISE:
		return 45;
	default:
		return 0;
	}
	return 0;
}
		
function IsStatusUpCameraChange( status )
{
	switch(status)
	{
	case STATUS.NONE:
	case STATUS.TENSION:
	case STATUS.CONFUSION:
	case STATUS.SLEEP:
	case STATUS.PARALYSIS:
	case STATUS.MIND:
	case STATUS.POISON:
	case STATUS.CURSE:
	case STATUS.POISON:
	case STATUS.DEATH:
	case STATUS.ERASE:
		return false;
	default:
		return true;
	}
	return false;
}

function IsStatusDownCameraChange( status )
{
	switch(status)
	{
	case STATUS.NONE:
	case STATUS.TENSION:
	case STATUS.ATTACK:
	case STATUS.DEFENCE:
	case STATUS.QUICK:
	case STATUS.WISE:
	case STATUS.CONFUSION:
	case STATUS.SLEEP:
	case STATUS.PARALYSIS:
	case STATUS.MIND:
	case STATUS.POISON:
	case STATUS.CURSE:
	case STATUS.DEATH:
		return false;
	default:
		return true;
	}
	return false;
}

function IsStatusUpMessageVisible( status )
{
	switch(status)
	{
	case STATUS.ATTACK:
	case STATUS.DEFENCE:
	case STATUS.QUICK:
	case STATUS.WISE:
	case STATUS.CONFUSION:
	case STATUS.SLEEP:
	case STATUS.PARALYSIS:
	case STATUS.MIND:
	case STATUS.POISON:
	case STATUS.CURSE:
		return true;
	default:
		return false;
	}
	return false;
}

function IsStatusDownMessageVisible( status )
{
	switch(status)
	{
	case STATUS.ATTACK:
	case STATUS.DEFENCE:
	case STATUS.QUICK:
	case STATUS.WISE:
		return true;
	default:
		return false;
	}
	return false;
}

function IsStatusResetMessageVisible( status )
{
	switch(status)
	{
	case STATUS.ATTACK:
	case STATUS.DEFENCE:
	case STATUS.QUICK:
	case STATUS.WISE:
	case STATUS.DEADACTION:
		return true;
	default:
		return false;
	}
	return false;
}

function GetStatusUpMessageId( status )
{
	return (status + 100);
}

function GetStatusDownMessageId( status )
{
	return (status + 300);
}

function GetStatusResetMessageId( status )
{
	return (status + 500);
}
// ステータス関連関数定義終了===========================

// スカウト・ライド連携カットイン===========================
function Gosign( cutinKind )
{
	//DebugPrint_FuncName_IN("Gosign");
	FUNCTION_STACK = FUNCTION_STACK + 1;
	ChangeIndexPointData_(BATTLE_COMMON_POINT_DATA);

	local attack = GetActorIndex_(0);
	local target = GetTargetIndex_(0,0);
	
	local AllyFlag = IsAlly_(attack);
	local master;		// マスター
	
	if(AllyFlag == true){
		master = GetAllyMaster_();
	} else {
		master = GetEnemyMaster_();
	}
	
	if(cutinKind == CUTIN_RIDE_LINK){
		local MultiCount = 0;
		local NameVisibleFlag = false;
		ShowActionMessage(MultiCount,NameVisibleFlag)
	}
	
	SetVisible_(attack, false);
	SetVisible_(target, false);
	
	for(local i = 0 ; i < 4 ; i++){
		SetVisible_(GetAllyIndex_(i), false);
		SetVisible_(GetEnemyIndex_(i), false);
	}
	
	SetVisible_(master, true);
	
	//カメラ位置
	Task_AnimeMoveCamera_("camera_210","camtgt_210");
	
	//マスター切り離し命令
	RideOffMaster_(master);
	
	//マスター回転
	SetDir_(master, -90);
	
	//マスター　モーション　配置
	local MasterTask = Task_AnimeMoveCharNoDir_(master, "move_400_Gosign");
	
	SetMotion_(master, MOT_SCOUT, 0);
	SetMotionStepFrame_(master, 0.6);
	
	
	ShowActionName_(0);
	
	// スカウトの時
	if (cutinKind == CUTIN_SCOUT)
	{
		ReplaySE_("SE_BTL_017");
	}
	
	//不要なモンスターを全て非表示にする
	local AllyIndex = [];
	local EnemyIndex = [];
	local AllIndex = [];
	for(local i = 0 ; i < 4 ; i++){
		AllyIndex.append(GetAllyIndex_(i));
		AllIndex.append(GetAllyIndex_(i));
	}
	for(local i = 0 ; i < 4 ; i++){
		EnemyIndex.append(GetAllyIndex_(i));
		AllIndex.append(GetEnemyIndex_(i));
	}
	for(local i = 0 ; i < 8 ; i++ )
	{
		local Type = GetInitExistType_(AllIndex[i]);
		if(Type == LIVETYPE.ACTIVE || Type == LIVETYPE.INACTIVE){SetVisible_(AllIndex[i], false);}
	}
	
	Wait_(14)
	
	//エフェクトを消す命令
	
	Wait_(1)
	
	SetMotionStepFrame_(master, 1.0);
	
	
	Wait_(18)

	DeleteTask_(MasterTask);	
	//DeleteAllTask_();
	RideMaster_(master);
	/*
	
	local RideFlag =false;
	for(local i = 0 ; i < AllyIndex.len() ; i++){
		if(IsRide_(AllyIndex[i]) == true){RideFlag == true;}
	}
	if(RideFlag == false){
		local cParty = cFullPartyInfo(AllyIndex[0]);
		Task_AnimeMoveCharNoDir_(master, cParty.Empty_Master);
		SetDir_(master , cParty.Rotate_Master)
		//SetMotion_(master, 15, 0);
	}	
	*/
	Wait_(7)
	
	FUNCTION_STACK = FUNCTION_STACK + 1;
	//DebugPrint_FuncName_OUT("Gosign");
}

// アイテム用カットイン===========================
function Gosign_Item()
{
	//DebugPrint_FuncName_IN("Gosign_Item");
	FUNCTION_STACK = FUNCTION_STACK + 1;
	ChangeIndexPointData_(BATTLE_COMMON_POINT_DATA);
	
	local AllyFlag = IsAlly_(GetActorIndex_(0));
	local Master;		// マスター
	
	if(AllyFlag == true){
		Master = GetAllyMaster_();
	} else {
		Master = GetEnemyMaster_();
	}
	
	for(local i = 0 ; i < 4 ; i++){
		SetVisible_(GetAllyIndex_(i), false);
		SetVisible_(GetEnemyIndex_(i), false);
	}
	
	SetVisible_(Master, true);
	
	//カメラ位置
	Task_AnimeMoveCamera_("camera_CutIn_Item","camtgt_CutIn_Item");
	
	//マスター切り離し命令
	RideOffMaster_(Master);
	
	//マスター回転
	SetDir_(Master, -90);
	
	//マスター　モーション　配置
	Task_AnimeMoveCharNoDir_(Master, "move_400_Gosign");
	SetMotion_(Master, MOT_USE_ITEM, 0);
	Task_ChangeMotion_(Master,MOT_USE_ITEM_LOOP,0)
	SetMotionStepFrame_(Master, 1.0);
	
	//UI反映
	StartCombo_(0);
	ItemIconInvisible_();
	
	Wait_(37)
	
	//初期化
	DeleteAllTask_();
	RideMaster_(Master);
	
	Wait_(5)
	
	//DebugPrint_FuncName_OUT("Gosign_Item");
}



// 上級呪文の場合に岩の浮き上がり演出===================================
//	MultiCount		: 何回目の行動か？
//	EffectEmpty		: どこに岩を表示するか（Empty）
//	cAction			: cActionクラス
function HighRankSpellEffect(MultiCount,EffectEmpty,cAction)
{
	//DebugPrint_FuncName_IN("HighRankSpell");
	
	local HighRankFlag = IsHighRankSpell_(0);
	local Index = GetActorIndex_(0)
	local cIndex = cMonsterInfo(Index)
	
	//上級魔法の場合、岩エフェクトを表示
	if(HighRankFlag == true && cAction.SelfTargetFlag != true){
		local RockEffect = SetPointWorldEffect_("EF000_06_ROCK", EffectEmpty);
		SetEffectScale_(RockEffect , cIndex.HighRankEffectSize)
	}
	
	//魔力の暴走判定
	MagicRunawayQuake(MultiCount)
	
	//DebugPrint_FuncName_OUT("HighRankSpell");
}

// 共通エフェクト読み込み===============================================
function LoadEffect()
{
	//DebugPrint_FuncName_IN("LoadEffect");

	// だいたい必要になるエフェクトをまとめて読みこむ
	LoadEffect_("EF010_01_HIT");
	LoadEffect_("EF010_02_HIT_KAISHIN");
	LoadEffect_("EF000_12_MONSTER_DEATH");
	LoadEffect_("EF000_01_MAGIC_ARIA");
	LoadEffect_("EF000_02_SKILL_ARIA");
	LoadEffect_("EF000_14_SMOKE_FOOT");
	LoadEffect_("EF000_03_SHUCHUSEN");
	LoadEffect_("EF000_13_COUNTER");
	LoadEffect_("EF010_09_ATTACK_G_SIZE01")
	
	local ActionNum = GetActionNum_();
	for(local MultiCount = 0 ; MultiCount < ActionNum ; MultiCount++){
		local HighRankFlag = IsHighRankSpell_(MultiCount);
		if(HighRankFlag == true){
			LoadEffect_("EF000_06_ROCK");
		}
		
		local SingleActEffect0 = GetSingleEffectName_(MultiCount,0);
		local SingleActEffect1 = GetSingleEffectName_(MultiCount,1);
		local AllActEffect0 = GetAllEffectName_(MultiCount,0);
		local AllActEffect1 = GetAllEffectName_(MultiCount,1);
		if(SingleActEffect0	!= null){LoadEffect_(SingleActEffect0);}
		if(SingleActEffect1	!= null){LoadEffect_(SingleActEffect1);}
		if(AllActEffect0	!= null){LoadEffect_(AllActEffect0);}
		if(AllActEffect1	!= null){LoadEffect_(AllActEffect1);}
		local TargetNum = GetTargetNum_(MultiCount)
		for(local x = STATUS_TOP ; x < STATUS_NUM ; x++){
			for(local y = 0 ; y < TargetNum ; y++){
				local StateFlag = GetStatusFlag_(x,MultiCount,0)
				if(StateFlag == true){
					if(gStateData[x].Up_Effect			!= null){LoadEffect_(gStateData[x].Up_Effect);}
					if(gStateData[x].Down_Effect		!= null){LoadEffect_(gStateData[x].Down_Effect);}
				}
			}
		}
		//MPダメージ用エフェクト
		local DamageType	= GetDamageType_(MultiCount,0)
		switch(DamageType)
		{
			case AFFECT_PARAM.MP:
			case AFFECT_PARAM.MAX_MP:
				//LoadEffect_("EF130_31_MAHOTORA_REC")
				break;
			case AFFECT_PARAM.TS:
				//LoadEffect_("EF130_27_TAMETORA_REC")
				break;
			default:
				break;
		}
		local TargetNum = GetTargetNum_(MultiCount)
		for(local IndexCount = 0 ; IndexCount < TargetNum ; IndexCount++){
			//天使の気まぐれ判定
			if(IsRezaoral_(MultiCount,IndexCount) || IsAngel_(MultiCount,IndexCount)){
				LoadEffect_(REVIVAL_EFFECT_NAME);
			}
			if(IsLivingDead_(MultiCount,IndexCount)){
				LoadEffect_(LIVING_DEAD_EFFECT_NAME);
			}
		}
		
		if(IsPalpnte_(MultiCount)){
			LoadEffect_("EF130_45_PARUPUNTE")
		}
	}
	
	if(IsScout_()){
		//スカウト用エフェクト
		LoadEffect_("EF000_07_SA_AURA");
		LoadEffect_("EF000_08_SA_ATTACK");
	}
	
	//デバッグ用（後に削除予定）
	LoadEffect_("EF120_01_HOIMI");
	
	//DebugPrint_FuncName_OUT("LoadEffect");
}


// 被弾処理（単発用）
//	IndexCount					：IndexCount番目の対象のモンスター（Indexではない）
//	SEFlag（true,false）		：SEを再生するか？
//	MotionFlag（true,false）	：モーションを再生するか？
//	MultiCount					：行動回数
//	MultiStageCount				：多段ヒット回数
//	PierceFlag					：貫通演出判定
//	cAction						：cActionクラス
function SetDamageEffectSE(IndexCount,SEFlag,MotionFlag,MultiCount,MultiStageCount,PierceFlag,cAction)
{
	//DebugPrint_FuncName_IN("SetDamageEffectSE");
	//DebugPrint("	=>	:	IndexCount		:" + IndexCount);
	//DebugPrint("	=>	:	SEFlag			:" + SEFlag);
	//DebugPrint("	=>	:	MotionFlag		:" + MotionFlag);
	//DebugPrint("	=>	:	MultiCount		:" + MultiCount);
	//DebugPrint("	=>	:	MultiStageCount	:" + MultiStageCount);
	//DebugPrint("	=>	:	PierceFlag		:" + PierceFlag);
	
	local Target			= GetTargetIndex_(MultiCount,IndexCount)
	local IsPoisonDamage	= IsPoisonDamage_(MultiCount, IndexCount);
	local Efficacy			= GetActionEfficacy_(MultiCount)
	local TargetType		= GetTargetType_(MultiCount)
	local DamageType		= GetDamageType_(MultiCount,IndexCount)
	local DamageValue		= GetDamageValue_(MultiCount,IndexCount,MultiStageCount)
	local MotionTask		= null;		//モーションタスク管理
	local IsScout			= false;
	
	switch(Efficacy)
	{
	case EFFICACY.NONE:
		//何も設定がない場合は何もしない。
		switch(DamageType)
		{
			case AFFECT_PARAM.HP:
				//リホイミ例外対応
				MotionTask = SetHealEffect(IndexCount,SEFlag,MotionFlag,MultiCount,MultiStageCount,cAction);
				SetPopEffect(IndexCount,MultiCount,MultiStageCount,cAction)
				break;
			default:
				//通常は何もしない
				break;
		}
		break;
	case EFFICACY.ATTACK:
		//ダメージの場合
		switch(DamageType)
		{
		case AFFECT_PARAM.NONE:
			break;
		default:
			MotionTask = SetDamageEffectSE_DamageInit(IndexCount,SEFlag,MotionFlag,MultiCount,MultiStageCount,PierceFlag,cAction);
			SetPopEffect(IndexCount,MultiCount,MultiStageCount,cAction)
			break;
		}
		break;
	case EFFICACY.HEAL:
		switch(DamageType)
		{
		case AFFECT_PARAM.NONE:
			//リホイミ系
			break;
		default:
			//回復・蘇生の場合
			if(DamageValue <= 0){
				//回復値の場合
				MotionTask = SetHealEffect(IndexCount,SEFlag,MotionFlag,MultiCount,MultiStageCount,cAction);
				SetPopEffect(IndexCount,MultiCount,MultiStageCount,cAction)
			} else {
				//ダメージ値の場合
				MotionTask = SetDamageEffectSE_DamageInit(IndexCount,SEFlag,MotionFlag,MultiCount,MultiStageCount,PierceFlag,cAction);
				SetPopEffect(IndexCount,MultiCount,MultiStageCount,cAction)	
			}
			break;
		}
		break;
	case EFFICACY.SUPPORT:
		//ステータス変化（バフ）の場合
		switch(DamageType)
		{
		case AFFECT_PARAM.HP:
			MotionTask = SetDamageEffectSE_DamageInit(IndexCount,SEFlag,MotionFlag,MultiCount,MultiStageCount,PierceFlag,cAction);
			SetPopEffect(IndexCount,MultiCount,MultiStageCount,cAction)
			break;
		case AFFECT_PARAM.MP:
			MotionTask = SetDamageEffectSE_DamageInit(IndexCount,SEFlag,MotionFlag,MultiCount,MultiStageCount,PierceFlag,cAction);
			SetPopEffect(IndexCount,MultiCount,MultiStageCount,cAction)
			break;
		}
		break;
	case EFFICACY.WEAK:
		//ステータス変化（デバフ）の場合
		switch(DamageType)
		{
		case AFFECT_PARAM.MP:
			MotionTask = SetDamageEffectSE_DamageInit(IndexCount,SEFlag,MotionFlag,MultiCount,MultiStageCount,PierceFlag,cAction);
			SetPopEffect(IndexCount,MultiCount,MultiStageCount,cAction)
			break;
		case AFFECT_PARAM.NONE:
			//NONEの場合、ダメージ演出を行わない
			break;
		case AFFECT_PARAM.TS:
			//NONEの場合、ダメージ演出を行わない
			break;
		case AFFECT_PARAM.HP:
			//HPの場合、ダメージ演出を行わない
			break;
		default:
			MotionTask = SetDamageEffectSE_DamageInit(IndexCount,SEFlag,MotionFlag,MultiCount,MultiStageCount,PierceFlag,cAction);
			break;
		}
		break;
	case EFFICACY.DEFENSE:
		//防御の場合も何もしない。
		
		break;
	case EFFICACY.OTHER:
		//Otherの場合、死亡したかどうか判定
		//SetStateEffect_Initの流れの中で死亡処理は流れるので
		//ここでは不要なはず
		//MotionTask = SetDeadEffect_ExceptionDead(IndexCount,SEFlag,MotionFlag,MultiCount,MultiStageCount,PierceFlag,cAction);
		break;
	default:
		//何もない場合はスルー
		//DebugPrint("Error : " + "BattleCommon_function_" + "SetDamageEffectSE" + "\n");
		//DebugPrint("		<= Efficacy		: " + Efficacy + "\n")
		ScriptStop()
		break;
	}
	
	//被弾時ガード特性発動メッセージ
	SetDamageGuardFeatMessage(MultiCount,IndexCount,MultiStageCount)
	
	//DebugPrint_FuncName_OUT("SetDamageEffectSE");
	//DebugPrint("	<=	:	MotionTask		:" + MotionTask);
	return MotionTask;
	
}

// 被弾処理（多段用）
//	IndexCount					：IndexCount番目の対象のモンスター（Indexではない）
//	SEFlag（true,false）		：SEを再生するか？
//	MotionFlag（true,false）	：モーションを再生するか？
//	MultiCount					：行動回数
//	MultiStageCount				：多段ヒット回数
//	cAction						：cActionクラス
//	PopCount					：出すポップは何個目か？
function SetBAKURETSUDamageEffectSE(IndexCount,SEFlag,MotionFlag,MultiCount,MultiStageCount,cAction,PopCount)
{
	//DebugPrint_FuncName_IN("SetBAKURETSUDamageEffectSE");
	//DebugPrint("	=>	:	IndexCount		:" + IndexCount);
	//DebugPrint("	=>	:	SEFlag			:" + SEFlag);
	//DebugPrint("	=>	:	MotionFlag		:" + MotionFlag);
	//DebugPrint("	=>	:	MultiCount		:" + MultiCount);
	//DebugPrint("	=>	:	MultiStageCount	:" + MultiStageCount);
	
	local Target			= GetTargetIndex_(MultiCount,IndexCount)
	local IsPoisonDamage	= IsPoisonDamage_(MultiCount, IndexCount);
	local Efficacy			= GetActionEfficacy_(MultiCount)
	local TargetType		= GetTargetType_(MultiCount)
	local MotionTask		= null;		//モーションタスク管理
	local DamageValue		= GetDamageValue_(MultiCount,IndexCount,MultiStageCount)
	
	switch(Efficacy)
	{
		case EFFICACY.NONE:
			//何も設定がない場合は何もしない。
			break;
		case EFFICACY.ATTACK:
			//ダメージの場合
			MotionTask = SetBAKURETSUDamageEffectSE_DamageInit(IndexCount,SEFlag,MotionFlag,MultiCount,MultiStageCount,cAction);
			SetBAKURETSUPopEffect(IndexCount,MultiCount,MultiStageCount,cAction,PopCount)
			break;
		case EFFICACY.HEAL:
			//回復・蘇生の場合
			if(DamageValue <= 0){
				//回復値の場合
				SetHealEffect(IndexCount,SEFlag,MotionFlag,MultiCount,MultiStageCount,cAction);
				SetBAKURETSUPopEffect(IndexCount,MultiCount,MultiStageCount,cAction,PopCount)
			} else {
				MotionTask = SetBAKURETSUDamageEffectSE_DamageInit(IndexCount,SEFlag,MotionFlag,MultiCount,MultiStageCount,cAction);
				SetBAKURETSUPopEffect(IndexCount,MultiCount,MultiStageCount,cAction,PopCount)
			}
			break;
		case EFFICACY.SUPPORT:
			//ステータス変化（バフ）の場合
			break;
		case EFFICACY.WEAK:
			//ステータス変化（デバフ）の場合
			local DamageType = GetDamageType_(MultiCount,IndexCount)
			switch(DamageType)
			{
			case AFFECT_PARAM.MP:
				MotionTask = SetBAKURETSUDamageEffectSE_DamageInit(IndexCount,SEFlag,MotionFlag,MultiCount,MultiStageCount,cAction);
				SetPopEffect(IndexCount,MultiCount,MultiStageCount,cAction)
				break;
			case AFFECT_PARAM.NONE:
				//NONEの場合、ダメージ演出を行わない
				break;
			case AFFECT_PARAM.TS:
				//NONEの場合、ダメージ演出を行わない
				break;
			case AFFECT_PARAM.HP:
				//HPの場合、ダメージ演出を行わない
				break;
			default:
				MotionTask = SetBAKURETSUDamageEffectSE_DamageInit(IndexCount,SEFlag,MotionFlag,MultiCount,MultiStageCount,cAction);
				break;
			}
			break;
		case EFFICACY.DEFENSE:
			//防御の場合も何もしない。
			break;
		case EFFICACY.OTHER:
			//Otherの場合、死亡したかどうか判定
			MotionTask = SetDeadEffect_ExceptionDead(IndexCount,SEFlag,MotionFlag,MultiCount,MultiStageCount,PierceFlag,cAction);
			break;
		default:
			//何もない場合はスルー
			//DebugPrint("Error!	: " + "SetBAKURETSUDamageEffectSE" + "\n")
			//DebugPrint("Efficacy	: " + Efficacy + "\n")
			ScriptStop()
			break;
	}
	
	//被弾時ガード特性発動メッセージ
	SetDamageGuardFeatMessage(MultiCount,IndexCount,MultiStageCount)
	
	//DebugPrint_FuncName_OUT("SetBAKURETSUDamageEffectSE");
	//DebugPrint("	<=	:	MotionTask		:" + MotionTask);
	//戻り値の設定
	return MotionTask;
	
}

//ダメージを受ける場合はこの処理
//		IndexCount		: 対象者番号（Index番号とは異なる）
//		SEFlag			: SEを再生するか？
//		Motion			: Motionを再生するか？
//		MultiCount		: 何回目の行動か？
//		MultiStageCount	: 何段目の攻撃か？
//		PierceFlag		: 貫通演出判定
//		cAction			: cActionクラス
function SetDamageEffectSE_DamageInit(IndexCount,SEFlag,MotionFlag,MultiCount,MultiStageCount,PierceFlag,cAction)
{
	//DebugPrint_FuncName_IN("SetDamageEffectSE_DamageInit");
	//local ArgList =	["IndexCount"	,	IndexCount
	//				,"SEFlag"	,	SEFlag
	//				,"MotionFlag"	,	MotionFlag
	//				,"MultiCount"	,	MultiCount
	//				,"MultiStageCount"	,	MultiStageCount
	//				,"PierceFlag"	,	PierceFlag
	//				]
	//DebugPrint_functionParam("SetDamageEffectSE_DamageInit" , ArgList)
	
	local IsCritical		= IsCritical_(MultiCount , IndexCount, MultiStageCount);
	local IsMiss			= IsMiss_(MultiCount, IndexCount, MultiStageCount);
	local IsDead			= IsDead_(MultiCount, IndexCount);
	local IsGuard			= IsGuard_(MultiCount, IndexCount);
	local IsAbsorption		= IsAbsorb_(MultiCount, IndexCount);
	local IsReflect			= IsReflect_(MultiCount, IndexCount);
	local IsRevival			= IsRevival_(MultiCount, IndexCount);
	local IsGambleBody		= IsGambleBody_(MultiCount, IndexCount, MultiStageCount);
	local IsCriticalGuard	= IsActiveCriticalGuard(MultiCount, IndexCount, MultiStageCount);
	local MotionTask		= null;
	local Efficacy			= GetActionEfficacy_(MultiCount)
	local DamageType		= GetDamageType_(MultiCount,IndexCount,MultiStageCount)
	local IsTeraAttack		= IsTeraAttack_(MultiCount)
	local DeathValue		= GetStatusValue_(STATUS.DEATH, MultiCount,IndexCount)	//即死の状態異常はSetStateEffect_Initで死亡させるため
	
	//local ListStart =	"<<SetDamageEffectSE_DamageInit : Information>>"
	//local List =		["IsCritical"		,	IsCritical
	//					,"IsMiss"	,	IsMiss
	//					,"IsDead"	,	IsDead
	//					,"IsGuard"	,	IsGuard
	//					,"IsAbsorption"	,	IsAbsorption
	//					,"IsReflect"	,	IsReflect
	//					,"IsRevival"	,	IsRevival
	//					,"IsGambleBody"	,	IsGambleBody
	//					,"IsCriticalGuard"	,	IsCriticalGuard
	//					,"Efficacy"	,	DebugPrint_Efficacy(Efficacy)
	//					,"DamageType"	,	DebugPrint_DamageType(DamageType)
	//					,"IsTeraAttack"	,	IsTeraAttack
	//					,"StatusDeadCheck"	,StatusDeadCheck
	//					]
	//local ListEnd =		"LINE"
	//local ListFront =	null
	//DebugPrint_OneList(List , ListStart , ListEnd , ListFront)
	
	if(IsDead == true && IsTeraAttack == false && DeathValue == 0){	//死亡の場合
		MotionTask = SetDeadEffect(IndexCount,SEFlag,MotionFlag,MultiCount,MultiStageCount,PierceFlag,cAction);
	} else if(IsMiss == true && IsReflect == false){		//ミスの場合
		MotionTask = SetMissEffect(IndexCount,SEFlag,MotionFlag,MultiCount,MultiStageCount,cAction);
	} else if(IsGuard == true){						//防御の場合
		MotionTask = SetGuardEffect(IndexCount,SEFlag,MotionFlag,MultiCount,MultiStageCount,cAction);
	} else if(IsAbsorption == true){
		MotionTask = SetAbsorptionEffect(IndexCount,SEFlag,MotionFlag,MultiCount,MultiStageCount,cAction);
	} else if(IsReflect == true) {					//反射の場合
		MotionTask = SetReflectEffect(IndexCount,SEFlag,MotionFlag,MultiCount,MultiStageCount,cAction);
	} else if(IsGambleBody == true) {				//ギャンブルボディの場合
		MotionTask = SetReflectEffect(IndexCount,SEFlag,MotionFlag,MultiCount,MultiStageCount,cAction);
	} else if(IsCriticalGuard == true) {			//会心完全ガードの場合
		MotionTask = SetReflectEffect(IndexCount,SEFlag,MotionFlag,MultiCount,MultiStageCount,cAction);
	} else if(IsCritical == true && IsReflect == false && IsGambleBody == false){		//会心の場合
		MotionTask = SetCriticalEffect(IndexCount,SEFlag,MotionFlag,MultiCount,MultiStageCount,cAction);
	} else {										//通常ダメージ
		if(Efficacy != EFFICACY.WEAK){
			//EFFICACY.WEAK以外は、ダメージ処理
			MotionTask = SetNormalDamageEffect(IndexCount,SEFlag,MotionFlag,MultiCount,MultiStageCount,cAction);
		} else {
			//EFFICACY.WEAKの場合は、通常のダメージ処理を行わない
			if(DamageType == AFFECT_PARAM.MP){
				//MPダメージの場合
				MotionTask = SetMPDamageEffect(IndexCount,SEFlag,MotionFlag,MultiCount,MultiStageCount,cAction)
			}
		}
	}
	//DebugPrint_FuncName_OUT("SetDamageEffectSE_DamageInit");
	//DebugPrint("	<=	:	MotionTask		:" + MotionTask);
	return MotionTask;
}


//ダメージを受ける場合はこの処理（多段攻撃用）
//		IndexCount		: 対象者番号（Index番号とは異なる）
//		SEFlag			: SEを再生するか？
//		Motion			: Motionを再生するか？
//		MultiCount		: 何回目の行動か？
//		MultiStageCount	: 何段目の攻撃か？
//		cAction			: cActionクラス
function SetBAKURETSUDamageEffectSE_DamageInit(IndexCount,SEFlag,MotionFlag,MultiCount,MultiStageCount,cAction)
{
	//DebugPrint_FuncName_IN("SetBAKURETSUDamageEffectSE_DamageInit");
	local IsCritical		= IsCritical_(MultiCount , IndexCount, MultiStageCount);
	local IsMiss			= IsMiss_(MultiCount , IndexCount, MultiStageCount);
	local IsDead			= IsDead_(MultiCount , IndexCount);
	local IsGuard			= IsGuard_(MultiCount , IndexCount);
	local IsAbsorption		= IsAbsorb_(MultiCount , IndexCount)
	local IsReflect			= IsReflect_(MultiCount , IndexCount);
	local IsRevival			= IsRevival_(MultiCount , IndexCount);
	local MotionTask		= null;
	local Efficacy			= GetActionEfficacy_(MultiCount)
	local DamageType		= GetDamageType_(MultiCount,IndexCount,MultiStageCount)
	local TargetNum			= GetTargetNum_(MultiCount)
	local IsTeraAttack		= IsTeraAttack_(MultiCount)
	local DeathValue		= GetStatusValue_(STATUS.DEATH, MultiCount,IndexCount)	//即死の状態異常はSetStateEffect_Initで死亡させるため
	
	//ターゲットタイプを設定する
	local TargetType = GetTargetType_(MultiCount)
	
	if(IsDead == true && IsTeraAttack == false && DeathValue == 0){ //死亡の場合（連続の場合は最終段のみ）
		MotionTask = SetDeadEffect(IndexCount,SEFlag,MotionFlag,MultiCount,MultiStageCount,false,cAction);
	} else if(IsMiss == true && IsReflect == false){	//ミスの場合
		MotionTask = SetMissEffect(IndexCount,SEFlag,MotionFlag,MultiCount,MultiStageCount,cAction);
	} else if(IsCritical == true && IsReflect == false && IsGuard == false){	//会心の場合
		MotionTask = SetCriticalEffect(IndexCount,SEFlag,MotionFlag,MultiCount,MultiStageCount,cAction);
	} else if(IsGuard == true){			//防御の場合
		MotionTask = SetGuardEffect(IndexCount,SEFlag,MotionFlag,MultiCount,MultiStageCount,cAction);
	} else if(IsAbsorption == true){	//吸収の場合（将来できたとき用）
		MotionTask = SetAbsorptionEffect(IndexCount,SEFlag,MotionFlag,MultiCount,MultiStageCount,cAction);
	} else if(IsReflect == true) {		//反射の場合
		MotionTask = SetReflectEffect(IndexCount,SEFlag,MotionFlag,MultiCount,MultiStageCount,cAction);
	} else {							//通常ダメージ
		if(Efficacy != EFFICACY.WEAK){
			//EFFICACY.WEAK以外は、ダメージ処理
			MotionTask = SetNormalDamageEffect(IndexCount,SEFlag,MotionFlag,MultiCount,MultiStageCount,cAction);
		} else {
			//EFFICACY.WEAKの場合は、通常のダメージ処理を行わない
			if(DamageType == AFFECT_PARAM.MP){
				//MPダメージの場合
				MotionTask = SetMPDamageEffect(IndexCount,SEFlag,MotionFlag,MultiCount,MultiStageCount,cAction)
			}
		}
	}
	// ヒットした後にミスが来るとダメージモーションのまま固まってしまうので待機に戻す
	// DeleteTaskで待機に戻すタスクが消されるため
	if(MotionTask == null){
		local Target = GetTargetIndex_(MultiCount,IndexCount)
		Task_ChangeMotion_(Target, MOT_WAIT, 1);
	}

	//DebugPrint_FuncName_OUT("SetBAKURETSUDamageEffectSE_DamageInit");
	//DebugPrint("	<=	:	MotionTask		:" + MotionTask);
	return MotionTask;
}

// 会心だった場合
function SetCriticalEffect(IndexCount,SEFlag,MotionFlag,MultiCount,MultiStageCount,cAction)
{
	//DebugPrint_FuncName_IN("SetCriticalEffect");
	//DebugPrint("	=>	IndexCount			:	" + IndexCount);
	//DebugPrint("	=>	SEFlag				:	" + SEFlag);
	//DebugPrint("	=>	MotionFlag			:	" + MotionFlag);
	//DebugPrint("	=>	MultiCount			:	" + MultiCount);
	//DebugPrint("	=>	MultiStageCount		:	" + MultiStageCount);
	
	local Target		= GetTargetIndex_(MultiCount,IndexCount)
	local Actor			= GetActorIndex_(MultiCount)
	local TargetType	= GetTargetType_(MultiCount)
	local MotionTask	= null;
	
	EffParamSizeEffect_NoSE(Target,"EF010_02_HIT_KAISHIN");
	if(SEFlag == true){ReplaySE_(cAction.CriticalSE);}
	StopEarthQuake_();
	StartEarthQuake_(20, 5 , 10);
	if(MotionFlag == true){
		SetMotion_(Target, MOT_DAMAGE, 4);
		MotionTask = Task_ChangeMotion_(Target, MOT_WAIT, 4);
	}
	
	//戻り値の設定
	//DebugPrint_FuncName_OUT("SetCriticalEffect");
	//DebugPrint("	<=	:	MotionTask		:" + MotionTask);
	return MotionTask;
}

// 多段会心だった場合
function SetBAKURETSUCriticalEffect(IndexCount,SEFlag,MotionFlag,MultiCount,MultiStageCount,cAction)
{
	//DebugPrint_FuncName_IN("SetBAKURETSUCriticalEffect");
	//DebugPrint("	=>	IndexCount			:	" + IndexCount);
	//DebugPrint("	=>	SEFlag				:	" + SEFlag);
	//DebugPrint("	=>	MotionFlag			:	" + MotionFlag);
	//DebugPrint("	=>	MultiCount			:	" + MultiCount);
	//DebugPrint("	=>	MultiStageCount		:	" + MultiStageCount);
	
	local Target		= GetTargetIndex_(MultiCount,IndexCount)
	local Actor			= GetActorIndex_(MultiCount)
	local TargetType	= GetTargetType_(MultiCount)
	local MotionTask	= null;
	
	EffParamSizeEffect_NoSE(Target,"EF010_02_HIT_KAISHIN");
	if(SEFlag == true){
		ReplaySE_(cAction.CriticalSE);
	} else {};
	StartEarthQuake_(20, 5, 10);
	if(MotionFlag == true){
		SetMotion_(Target, MOT_DAMAGE, 4);
		MotionTask = Task_ChangeMotion_(Target, MOT_WAIT, 4);
	}
	
	//戻り値の設定
	//DebugPrint_FuncName_OUT("SetBAKURETSUCriticalEffect");
	//DebugPrint("	<=	:	MotionTask		:" + MotionTask);
	return MotionTask;
}
// ミス時
function SetMissEffect(IndexCount,SEFlag,MotionFlag,MultiCount,MultiStageCount,cAction)
{
	//DebugPrint_FuncName_IN("SetMissEffect");
	//local ArgList =		["IndexCount"	,	IndexCount
	//					,"SEFlag"	,	SEFlag
	//					,"MotionFlag"	,	MotionFlag
	//					,"MultiCount"	,	MultiCount
	//					,"MultiStageCount"	,	MultiStageCount
	//					]
	//DebugPrint_functionParam("SetMissEffect" , ArgList)
	
	//ターゲットインデックスの生成
	local Target		= GetTargetIndex_(MultiCount,IndexCount)
	local TargetType	= GetTargetType_(MultiCount)
	local MotionTask	= null;
	
	
	if(SEFlag == true){
		ReplaySE_(cAction.MissSE);
	}
	
	//戻り値の設定
	//DebugPrint_FuncName_OUT("SetMiss");
	//DebugPrint("	<=	:	MotionTask		:" + MotionTask);
	return MotionTask;
}

// 相手死亡時（通常ダメージ）
//IndexCount		:何体目の対象か？
//SEFlag			:ＳＥを再生するか？
//MotionFlag		:モーションを再生するか？
//MultiCount		:何回目の行動か？
//MultiStageCount	:何段目の行動か？
//PierceFlag		:貫通演出か？
//cAction			:行動番号を参照したcActionInfo
function SetDeadEffect(IndexCount,SEFlag,MotionFlag,MultiCount,MultiStageCount,PierceFlag,cAction)
{
	//DebugPrint_FuncName_IN("SetDeadEffect");
	//デバッグ出力用
	//local ArgList =		["IndexCount"	,	IndexCount
	//					,"SEFlag"	,	SEFlag
	//					,"MotionFlag"	,	MotionFlag
	//					,"MultiCount"	,	MultiCount
	//					,"MultiStageCount"	,	MultiStageCount
	//					,"PierceFlag"	,	PierceFlag
	//					]
	//DebugPrint_functionParam("SetDeadEffect" , ArgList)
	
	local Target		= GetTargetIndex_(MultiCount,IndexCount)
	local Actor			= GetActorIndex_(MultiCount)
	local IsMiss 		= IsMiss_(MultiCount,IndexCount,MultiStageCount);//Miss判定
	local TargetType	= GetTargetType_(MultiCount)
	local MotionTask	= null;
	local ActHitNum		= GetActHitNum_(MultiCount,IndexCount)
	local AllyFlag		= IsAlly_(Target);
	local RideFlag		= IsRide_(Target);
	local MasterKind	= GetMasterKind_(AllyFlag);
	local isCritical	= IsCritical_(MultiCount,IndexCount,MultiStageCount);
	
	//if(IsTeraAttack_(MultiCount) == true){return;}
	
	if(isCritical){
		SetCriticalEffect(IndexCount,SEFlag,MotionFlag,MultiCount,MultiStageCount,cAction)
	} else {
		if(IsMiss == true){
			SetMissEffect(IndexCount,SEFlag,MotionFlag,MultiCount,MultiStageCount,cAction)
		} else {
			SetNormalDamageEffect(IndexCount,SEFlag,MotionFlag,MultiCount,MultiStageCount,cAction)
		}
	}
	
	//多段判定時には、最終段以外では通常処理に戻る用にする。
	if(MultiStageCount != ActHitNum-1){
		return;
	}
	
	SetVisible_(Target,true);
	SetAlpha_(Target,1.0);
	
	if(cAction.StateDamage[IndexCount] == 0){
		//ダメージなしの死亡の場合
		MotionFlag = false;
	} else {
		//ダメージありの死亡の場合
		if(PierceFlag != true){
			//貫通時には、ヒットエフェクトを表示しない
			EffParamSizeEffect(Target,cAction.HitEffect);
		}
	}
	
	//死亡演出
	SetDeadEffect_MonsterEffectSE(Target , MotionFlag , SEFlag)
	
	//マスター落下処理
	SetDeadEffect_RideOff(Target)
	
	//死亡したキャラクターの行動矢印をUIから削除
	SetDeadEffect_DeleteAllow(Target)
	
	//戻り値の設定
	//DebugPrint_FuncName_OUT("SetDeadEffect");
	//DebugPrint("	<=	:	MotionTask		:" + MotionTask);
	return MotionTask;
}

// 相手死亡時（テラ追加ダメージ時の死亡判定）
//IndexCount		:何体目の対象か？
//SEFlag			:ＳＥを再生するか？
//MotionFlag		:モーションを再生するか？
//MultiCount		:何回目の行動か？
//MultiStageCount	:何段目の行動か？
//PierceFlag		:貫通演出か？
//cAction			:行動番号を参照したcActionInfo
function SetDeadEffect_TeraDamage(MultiCount,IndexCount,SEFlag,MotionFlag,cAction)
{
	//DebugPrint_FuncName_IN("SetDeadEffect_TeraDamage");
	//local ArgList =	["MultiCount"	,	MultiCount
	//				,"IndexCount"	,	IndexCount
	//				,"SEFlag"	,	SEFlag
	//				,"MotionFlag"	,	MotionFlag
	//				]
	//DebugPrint_functionParam("SetDeadEffect_TeraDamage" , ArgList)
	
	local Target		= GetTargetIndex_(MultiCount,IndexCount)
	local MotionTask	= null;
	
	SetVisible_(Target,true);
	SetAlpha_(Target,1.0);
	
	//死亡時演出
	SetDeadEffect_MonsterEffectSE(Target,MotionFlag,SEFlag)
	
	//落下処理
	SetDeadEffect_RideOff(Target)
	
	//死亡したキャラクターの行動矢印をUIから削除
	SetDeadEffect_DeleteAllow(Target)
	
	//戻り値の設定
	//DebugPrint_FuncName_OUT("SetDeadEffect_TeraDamage");
	//DebugPrint("	<=	:	MotionTask		:" + MotionTask);
	return MotionTask;
}

//相手死亡時（ステータス効果）
function SetDeadEffect_StateDead(MultiCount,IndexCount,SEFlag,MotionFlag,cAction)
{
	//DebugPrint_FuncName_IN("SetDeadEffect_StateDead");
	//local ArgList =	["MultiCount"	,	MultiCount
	//				,"IndexCount"	,	IndexCount
	//				,"SEFlag"	,	SEFlag
	//				,"MotionFlag"	,	MotionFlag
	//				]
	//DebugPrint_functionParam("SetDeadEffect_StateDead" , ArgList)
	
	local Target		= GetTargetIndex_(MultiCount,IndexCount)
	local MotionTask	= null;
	
	SetVisible_(Target,true);
	SetAlpha_(Target,1.0);
	
	//死亡時演出
	SetDeadEffect_MonsterEffectSE(Target , MotionFlag , SEFlag)
	
	//落下処理
	SetDeadEffect_RideOff(Target)
	
	//死亡したキャラクターの行動矢印をUIから削除
	SetDeadEffect_DeleteAllow(Target)
	
	//戻り値の設定
	//DebugPrint_FuncName_OUT("SetDeadEffect_StateDead");
	//DebugPrint("	<=	:	MotionTask		:" + MotionTask);
	return MotionTask;
	
}

//相手死亡時（例外死亡時）
function SetDeadEffect_ExceptionDead(IndexCount,SEFlag,MotionFlag,MultiCount,MultiStageCount,PierceFlag,cAction)
{
	//DebugPrint_FuncName_IN("SetDeadEffect_ExceptionDead");
	//local ArgList =	["IndexCount"		,IndexCount
	//				,"SEFlag"			,SEFlag
	//				,"MotionFlag"		,MotionFlag
	//				,"MultiCount"		,MultiCount
	//				,"MultiStageCount"	,MultiStageCount
	//				,"PierceFlag"		,PierceFlag
	//				]
	//DebugPrint_functionParam("SetDeadEffect_ExceptionDead" , ArgList)
	
	//死亡していない場合は、return
	if(IsDead_(MultiCount,IndexCount) == false){return}
	
	local Target		= GetTargetIndex_(MultiCount,IndexCount)
	local MotionTask	= null;
	
	SetVisible_(Target,true);
	SetAlpha_(Target,1.0);
	
	//死亡時演出
	SetDeadEffect_MonsterEffectSE(Target , MotionFlag , SEFlag)
	
	//落下処理
	SetDeadEffect_RideOff(Target)
	
	//死亡したキャラクターの行動矢印をUIから削除
	SetDeadEffect_DeleteAllow(Target)
	
	//戻り値の設定
	//DebugPrint_FuncName_OUT("SetDeadEffect_ExceptionDead");
	//DebugPrint("	<=	:	MotionTask		:" + MotionTask);
	return MotionTask;
	
}

//死亡時処理：キャラクター死亡演出
function SetDeadEffect_MonsterEffectSE(Index , MotionFlag , SEFlag)
{
	//DebugPrint_FuncName_IN("SetDeadEffect_MonsterEffectSE");

	EffParamSizeEffect(Index,"EF000_12_MONSTER_DEATH");
	if(SEFlag == true){
		ReplaySE_("SE_BTL_009");
	}
	if(MotionFlag == true){
		SetMotion_(Index, MOT_DAMAGE, 0);
		SetMonsterPlayMoveSE_(Index,false);
		SetMotionStepFrame_(Index, 0.7);
	}
	Task_ObjectFadeOut_(Index, 30)

	//DebugPrint_FuncName_OUT("SetDeadEffect_MonsterEffectSE");
}

//死亡時処理：死亡したキャラクターの行動矢印をUIから削除
function SetDeadEffect_DeleteAllow(Index)
{
	if(ExceptionDeadEscapeCheck){
		UnSettingAllowTarget_(Index);
		SetMonsterDead_(Index);
	}
}

//死亡時処理：ライド時落下処理
//Index		: 行動対象者
function SetDeadEffect_RideOff(Index)
{
	local AllyFlag		= IsAlly_(Index);
	local RideFlag		= IsRide_(Index);
	local MasterKind	= GetMasterKind_(AllyFlag);
	
	if(RideFlag == true && MasterKind != MASTER_KIND.PROMETHEUS){
		local MasterIndex = GetAllyMaster_();
		if(IsAlly_(Index) != true){
			MasterIndex = GetEnemyMaster_();
		}
		if(AllyFlag == false){MasterIndex = GetEnemyMaster_();}
		local IndexPos = GetPos_(Index);
		local RidePos = GetRidePos_(Index);
		local IndexRidePos = Vec3(IndexPos.x + RidePos.x ,IndexPos.y + RidePos.y , IndexPos.z + RidePos.z)
		local DownPos = Vec3(IndexPos.x + RidePos.x , 0 , IndexPos.z + RidePos.z);
		RideOffMaster_(MasterIndex);
		local MovePath = [IndexRidePos,DownPos]
		local MasterDir = GetDir_(MasterIndex)
		local IndexDir = GetDir_(Index)
		SetPos_(MasterIndex , IndexRidePos)
		Task_PathMoveCharNoDir_(MovePath, 1.0 , MasterIndex)
		SetDir_(MasterIndex , MasterDir)
		SetMotion_(MasterIndex, MOT_SLIP, 0);
		Task_ChangeMotion_(MasterIndex, MOT_SLIP_LOOP, 4);
		SetFall_(MasterIndex,Index)
		Task_ObjectFadeOut_(MasterIndex, 30);
	}
	
}

//ステータス異常死亡チェック
//ステータス内部で死亡が発生している場合はtrueを返す
function SetStateEffect_DeadCheck(MultiCount,IndexCount)
{
	local StatusDeadFlag = false;
	for(local Status = STATUS_TOP ; Status < STATUS_NUM ; Status += 1){
		switch(Status)
		{
		case STATUS.DEATH:
		case STATUS.ERASE:
			//死亡・蘇生不可
			local StatusValue		= GetStatusValue_(Status,MultiCount,IndexCount);
			local StatusFlag		= GetStatusFlag_(Status,MultiCount,IndexCount);
			if(StatusValue != 0 && StatusFlag == true && StatusDeadFlag == false){
				StatusDeadFlag = true;
			}
		case STATUS.NOTICE_DEATH:
			//死亡予告は解除時に死亡
			local StatusEndFlag		= GetStatusEndFlag_(Status,MultiCount,IndexCount);
			if(StatusEndFlag == true && StatusDeadFlag == false){
				StatusDeadFlag = true;
			}
			break;
		default:
			break;
		}
	}
	return StatusDeadFlag;
}


// ガード判定（守りの霧など）時
function SetGuardEffect(IndexCount,SEFlag,MotionFlag,MultiCount,MultiStageCount,cAction)
{
	//DebugPrint_FuncName_IN("SetGuardEffect");
	//DebugPrint("	=>	IndexCount			:	" + IndexCount);
	//DebugPrint("	=>	SEFlag				:	" + SEFlag);
	//DebugPrint("	=>	MotionFlag			:	" + MotionFlag);
	//DebugPrint("	=>	MultiCount			:	" + MultiCount);
	//DebugPrint("	=>	MultiStageCount		:	" + MultiStageCount);
	
	local Target		= GetTargetIndex_(MultiCount,IndexCount)
	local TargetType	= GetTargetType_(MultiCount)
	local MotionTask	= null;
	
	EffParamSizeEffect(Target,cAction.GuardEffect);
	if(MotionFlag == true){
		//SetMotion_(Target, MOT_WAIT, 4);
		//MotionTask = Task_ChangeMotion_(Target, MOT_WAIT, 4);
	}
	if(SEFlag == true){
		ReplaySE_(cAction.GuardSE);
	}
	
	//戻り値の設定
	//DebugPrint_FuncName_OUT("SetGuardEffect");
	//DebugPrint("	<=	:	MotionTask		:" + MotionTask);
	return MotionTask;
}

// 吸収時
function SetAbsorptionEffect(IndexCount,SEFlag,MotionFlag,MultiCount,MultiStageCount,cAction)
{
	//DebugPrint_FuncName_IN("SetAbsorptionEffect");
	//DebugPrint("	=>	IndexCount			:	" + IndexCount);
	//DebugPrint("	=>	SEFlag				:	" + SEFlag);
	//DebugPrint("	=>	MotionFlag			:	" + MotionFlag);
	//DebugPrint("	=>	MultiCount			:	" + MultiCount);
	//DebugPrint("	=>	MultiStageCount		:	" + MultiStageCount);
	
	local Target		= GetTargetIndex_(MultiCount,IndexCount)
	local TargetType	= GetTargetType_(MultiCount)
	local MotionTask	= null;
	//EffParamSizeEffect(Target,cAction.AbsorptionEffect);
	if(SEFlag == true){
		ReplaySE_(cAction.AbsorptionSE);
	} else {}
	
	//戻り値の設定
	//DebugPrint_FuncName_OUT("SetAbsorptionEffect");
	//DebugPrint("	<=	:	MotionTask		:" + MotionTask);
	return MotionTask;
}

// 反射時
function SetReflectEffect(IndexCount,SEFlag,MotionFlag,MultiCount,MultiStageCount,cAction)
{
	//DebugPrint_FuncName_IN("SetReflectEffect");
	//DebugPrint("	=>	IndexCount			:	" + IndexCount);
	//DebugPrint("	=>	SEFlag				:	" + SEFlag);
	//DebugPrint("	=>	MotionFlag			:	" + MotionFlag);
	//DebugPrint("	=>	MultiCount			:	" + MultiCount);
	//DebugPrint("	=>	MultiStageCount		:	" + MultiStageCount);

	local Target		= GetTargetIndex_(MultiCount,IndexCount)
	local TargetType	= GetTargetType_(MultiCount)
	local MotionTask	= null;
	
	EffParamSizeEffect(Target,"EF000_13_COUNTER");
	
	if(IsCritical_(MultiCount,IndexCount,MultiStageCount) == true){
		//クリティカル限定処理があれば
	}
	
	if(SEFlag == true){
		ReplaySE_(cAction.ReflectSE);
	}
	
	//戻り値の設定
	//DebugPrint_FuncName_OUT("SetReflectEffect");
	//DebugPrint("	<=	:	MotionTask		:" + MotionTask);
	return MotionTask;
}

// 通常ダメージ時
function SetNormalDamageEffect(IndexCount,SEFlag,MotionFlag,MultiCount,MultiStageCount,cAction)
{
	//DebugPrint_FuncName_IN("SetNormalDamageEffect");
	//local ArgList =	["IndexCount"		,IndexCount
	//				,"SEFlag"			,SEFlag
	//				,"MotionFlag"		,MotionFlag
	//				,"MultiCount"		,MultiCount
	//				,"MultiStageCount"	,MultiStageCount
	//				]
	//DebugPrint_functionParam("SetNormalDamageEffect" , ArgList)
	
	
	local Target		= GetTargetIndex_(MultiCount,IndexCount)
	local Actor			= GetActorIndex_(MultiCount)
	local TargetType		= GetTargetType_(MultiCount)
	local MotionTask	= null;
	
	EffParamSizeEffect(Target,"EF010_01_HIT");
	if(SEFlag == true){
		//ReplaySE_(cAction.DamageSE);
	}
	if(MotionFlag == true){
		local Damage = GetDamageValue_(MultiCount, IndexCount, MultiStageCount);
		if(Damage > 0){
			//ダメージが0でない場合は、被弾モーションを行う
			SetMotion_(Target, MOT_DAMAGE, 4);
			MotionTask = Task_ChangeMotion_(Target, MOT_WAIT, 4);
		}
	}
	
	//戻り値の設定
	//DebugPrint_FuncName_OUT("SetNormalDamageEffect");
	//DebugPrint("	<=	:	MotionTask		:" + MotionTask);
	return MotionTask;
}

// ＭＰダメージ時
function SetMPDamageEffect(IndexCount,SEFlag,MotionFlag,MultiCount,MultiStageCount,cAction)
{
	//DebugPrint_FuncName_IN("SetMPDamageEffect");	
	//DebugPrint("	=>	IndexCount			:	" + IndexCount);
	//DebugPrint("	=>	SEFlag				:	" + SEFlag);
	//DebugPrint("	=>	MotionFlag			:	" + MotionFlag);
	//DebugPrint("	=>	MultiCount			:	" + MultiCount);
	//DebugPrint("	=>	MultiStageCount		:	" + MultiStageCount);
	
	local Target		= GetTargetIndex_(MultiCount,IndexCount)
	local Actor			= GetActorIndex_(MultiCount)
	local TargetType		= GetTargetType_(MultiCount)
	local MotionTask	= null;
	
	ReplaySE_("SE_BTL_019")
	
	if(MotionFlag == true){
		local Damage = GetDamageValue_(MultiCount, IndexCount, MultiStageCount);
		if(Damage > 0){
			//ダメージが0でない場合は、被弾モーションを行う
			SetMotion_(Target, MOT_DAMAGE, 4);
			MotionTask = Task_ChangeMotion_(Target, MOT_WAIT, 4);
		}
	}
	
	//戻り値の設定
	//DebugPrint_FuncName_OUT("SetMPDamageEffect");
	//DebugPrint("	<=	:	MotionTask		:" + MotionTask);
	return MotionTask;
}

// 回復の場合
function SetHealEffect(IndexCount,SEFlag,MotionFlag,MultiCount,MultiStageCount,cAction)
{
	//DebugPrint_FuncName_IN("SetHealEffect");
	//DebugPrint("	=>	IndexCount			:	" + IndexCount);
	//DebugPrint("	=>	SEFlag				:	" + SEFlag);
	//DebugPrint("	=>	MotionFlag			:	" + MotionFlag);
	//DebugPrint("	=>	MultiCount			:	" + MultiCount);
	//DebugPrint("	=>	MultiStageCount		:	" + MultiStageCount);
	
	local Target		= GetTargetIndex_(MultiCount,IndexCount)
	local TargetType	= GetTargetType_(MultiCount)
	local MotionTask	= null;
	local Value			= GetDamageValue_(MultiCount,IndexCount,MultiStageCount)
	
	
	//蘇生の場合は下記
	if(IsRevival_(MultiCount,IndexCount) == true){
		Task_ObjectFadeIn_(Target, 30);
	}
	
	//冥界の霧などでダメージの場合
	
	
	//戻り値の設定
	//DebugPrint_FuncName_OUT("SetHealEffect");
	//DebugPrint("	<=	:	MotionTask		:" + MotionTask);
	return MotionTask;
}

// ミスポップ表示
function SetMissPop(targetIndex, multiStageCount)
{
	local cTarget = cMonsterInfo(targetIndex);
	SetPop_(targetIndex, POPSTYLE.NONE, 0, true, cTarget.PopDate_X[multiStageCount % gPopMaxNum], cTarget.PopDate_Y[multiStageCount % gPopMaxNum], 1.0);
}

//ポップ表示専用
function SetPopEffect(IndexCount,MultiCount,MultiStageCount,cAction)
{
	//DebugPrint_FuncName_IN("SetPopEffect");
	//DebugPrint("	=>	IndexCount			:	" + IndexCount);
	//DebugPrint("	=>	MultiCount			:	" + MultiCount);
	//DebugPrint("	=>	MultiStageCount		:	" + MultiStageCount);
	
	local Target		= GetTargetIndex_(MultiCount,IndexCount)
	local cTarget		= cMonsterInfo(Target)
	local AllyFlag		= IsAlly_(Target);
	local DamageValue	= GetDamageValue_(MultiCount,IndexCount,MultiStageCount)
	local DamageType	= GetDamageType_(MultiCount,IndexCount)
	local IsMiss		= IsMiss_(MultiCount,IndexCount,MultiStageCount);
	local IsReflect		= IsReflect_(MultiCount,IndexCount);
	local PopKind		= POPSTYLE.NONE;
	local Efficacy		= GetActionEfficacy_(MultiCount)
	local ActHitNum 	= GetActHitNum_(MultiCount,IndexCount);
	local TargetType	= GetTargetType_(MultiCount)
	
	//ポップ種類の取得
	PopKind = SetPopKindCheck(MultiCount,IndexCount,MultiStageCount);
	
	//ポップ用SEの再生
	SetPopEffect_PlaySE(MultiCount,IndexCount,MultiStageCount,PopKind,cAction)
	
	//ポップ表示処理
	if(PopKind != POPSTYLE.NONE){
		if(ActHitNum != 0){
			if(IsReflect_(MultiCount,IndexCount) == false
			 && IsGuard_(MultiCount,IndexCount) == false
			 && IsGambleBody_(MultiCount, IndexCount, MultiStageCount) ==false
			 && IsActiveCriticalGuard(MultiCount, IndexCount, MultiStageCount) == false){
				if(DamageValue < 0 && DamageValue != null){
					DamageValue = SetAbsoluteValue(DamageValue)//－値の場合は絶対値変換
				}
				SetPop_(Target, PopKind, DamageValue, IsMiss,cTarget.PopDate_X[MultiStageCount % gPopMaxNum],cTarget.PopDate_Y[MultiStageCount % gPopMaxNum],1.0);
			}
		}
	}
	
	
	//UI反映
	SetDamageUI_Init(MultiCount,IndexCount,MultiStageCount,cAction)
	
	//DebugPrint_FuncName_OUT("SetPopEffect");
}

//ポップ表示専用
function SetBAKURETSUPopEffect(IndexCount,MultiCount,MultiStageCount,cAction,PopCount)
{
	//DebugPrint_FuncName_IN("SetBAKURETSUPopEffect");
	//DebugPrint("	=>	IndexCount			:	" + IndexCount);
	//DebugPrint("	=>	MultiCount			:	" + MultiCount);
	//DebugPrint("	=>	MultiStageCount		:	" + MultiStageCount);
	
	local Target		= GetTargetIndex_(MultiCount,IndexCount)
	local cTarget		= cMonsterInfo(Target);
	local AllyFlag		= IsAlly_(Target);
	local DamageValue	= GetDamageValue_(MultiCount,IndexCount,MultiStageCount)
	local DamageType	= GetDamageType_(MultiCount,MultiStageCount)
	local IsMiss		= IsMiss_(MultiCount,IndexCount,MultiStageCount);
	local IsRefrect		= IsReflect_(MultiCount,IndexCount)
	local PopKind		= POPSTYLE.NONE;
	local Efficacy		= GetActionEfficacy_(MultiCount)
	local MultiStage 	= GetActHitNum_(MultiCount,IndexCount);
	local TargetType	= GetTargetType_(MultiCount)
	local PopSpeed		= 1.0;
	
	//ポップ種類の取得
	PopKind = SetPopKindCheck(MultiCount,IndexCount,MultiStageCount);
	//ポップ用SEの再生
	SetPopEffect_PlaySE(MultiCount,IndexCount,MultiStageCount,PopKind,cAction)

	
	//ポップ表示処理
	if(PopKind != POPSTYLE.NONE){
		if(MultiStage != 0){
			if(IsReflect_(MultiCount,IndexCount) == false
			 && IsGuard_(MultiCount,IndexCount) == false
			 && IsGambleBody_(MultiCount, IndexCount, MultiStageCount) ==false
			 && IsActiveCriticalGuard(MultiCount, IndexCount, MultiStageCount) == false){
				if(DamageValue < 0 && DamageValue != null){
					DamageValue = SetAbsoluteValue(DamageValue)//－値の場合は絶対値変換
				}
				switch(TargetType)
				{
				case TARGET.BAKURETSU:
				case TARGET.ALLY_MULTI_RANDOM:
					PopSpeed = 2.0;
					break;
				default:
					break;
				}
				SetPop_(Target, PopKind, DamageValue, IsMiss,cTarget.PopDate_X[PopCount % gPopMaxNum],cTarget.PopDate_Y[PopCount % gPopMaxNum],1.0);
			}
		}
	}
	
	//UI反映
	SetDamageUI_Init(MultiCount,IndexCount,MultiStageCount,cAction)
	
	//DebugPrint_FuncName_OUT("SetBAKURETSUPopEffect");
}

//ポップ表示専用（みがわり）
function SetSubstitutePopEffect(IndexCount, MultiCount, MultiStageCount, cAction)
{
	//DebugPrint_FuncName_IN("SetSubstitutePopEffect");
	//DebugPrint("	=>	IndexCount			:	" + IndexCount);
	//DebugPrint("	=>	MultiCount			:	" + MultiCount);
	//DebugPrint("	=>	MultiStageCount		:	" + MultiStageCount);
	
	local Target		= GetTargetIndex_(MultiCount,IndexCount)
	local cTarget		= cMonsterInfo(Target)
	local AllyFlag		= IsAlly_(Target);
	local DamageValue	= GetDamageValue_(MultiCount,IndexCount,MultiStageCount)
	local DamageType	= GetDamageType_(MultiCount,IndexCount)
	local IsMiss		= IsMiss_(MultiCount,IndexCount,MultiStageCount);
	local IsReflect		= IsReflect_(MultiCount,IndexCount);
	local PopKind		= POPSTYLE.NONE;
	local Efficacy		= GetActionEfficacy_(MultiCount)
	local ActHitNum 	= GetActHitNum_(MultiCount,IndexCount);
	local TargetType	= GetTargetType_(MultiCount)
	
	//ポップ種類の取得
	PopKind = SetPopKindCheck(MultiCount,IndexCount,MultiStageCount);
	
	//ポップ用SEの再生
	SetPopEffect_PlaySE(MultiCount,IndexCount,MultiStageCount,PopKind,cAction)
	
	//ポップ表示処理
	if(PopKind != POPSTYLE.NONE){
		if(ActHitNum != 0){
			if(IsReflect_(MultiCount, IndexCount)== false
			 && IsGuard_(MultiCount, IndexCount) == false
			 && IsGambleBody_(MultiCount, IndexCount, MultiStageCount) ==false
			 && IsActiveCriticalGuard(MultiCount, IndexCount, MultiStageCount) == false){
				if(DamageValue < 0 && DamageValue != null){
					DamageValue = SetAbsoluteValue(DamageValue)//－値の場合は絶対値変換
				}
				SetPop_(Target, PopKind, DamageValue, IsMiss,cTarget.PopDate_X[MultiStageCount % gPopMaxNum],cTarget.PopDate_Y[MultiStageCount % gPopMaxNum],1.0);
			}
		}
	}
	
	SetDamageUI_Init(MultiCount,IndexCount,MultiStageCount,cAction)
	
	//DebugPrint_FuncName_OUT("SetSubstitutePopEffect");
}

//ポップ種類の設定
function SetPopKindCheck(MultiCount,IndexCount,MultiStageCount)
{
	local Target		= GetTargetIndex_(MultiCount,IndexCount)
	local cTarget		= cMonsterInfo(Target)
	local AllyFlag		= IsAlly_(Target);
	local DamageValue	= GetDamageValue_(MultiCount,IndexCount,MultiStageCount)
	local DamageType	= GetDamageType_(MultiCount,IndexCount)
	local IsMiss		= IsMiss_(MultiCount,IndexCount,MultiStageCount);
	local IsReflect		= IsReflect_(MultiCount,IndexCount);
	local IsAbsorption	= IsAbsorb_(MultiCount,IndexCount)
	local Efficacy		= GetActionEfficacy_(MultiCount)
	local ActHitNum 	= GetActHitNum_(MultiCount,IndexCount);
	local TargetType	= GetTargetType_(MultiCount)
	
	//戻り値
	local PopKind = POPSTYLE.NONE;
	
	//ポップの条件設定
	switch (Efficacy)
	{
	case EFFICACY.ATTACK:
		if(ActHitNum == 0){PopKind = POPSTYLE.NONE;}
		switch (DamageType)
		{
		//HPダメージ
		case AFFECT_PARAM.HP:
			if(DamageValue >= 0 && IsAbsorption == false){
				if(AllyFlag == true){
					PopKind = POPSTYLE.DAMAGE_ENEMY;
				} else {
					PopKind = POPSTYLE.DAMAGE_ALLY;
				}
			} else if(DamageValue <= 0){
				PopKind = POPSTYLE.HEAL_HP;
			}
			break;
		//MPダメージ
		case AFFECT_PARAM.MP:
			if(DamageValue >= 0){
				PopKind = POPSTYLE.DAMAGE_MP;
			} else if(DamageValue < 0){
				PopKind = POPSTYLE.HEAL_MP;
			}
			break;
		//ダメージなし
		case AFFECT_PARAM.NONE:
			PopKind = POPSTYLE.NONE;
			break;
		//テンションダメージ
		case AFFECT_PARAM.TS:
			if(cAction.ActEffectFlag == false){
				//SetBoneEffect_("EF130_27_TAMETORA_REC" , Target)
			}
			if(DamageValue< 0){
				PopKind = POPSTYLE.TENSION_DOWN;
			} else {
				PopKind = POPSTYLE.TENSION_UP;
			}
			break;
		//最大ＨＰダメージ
		case AFFECT_PARAM.MAX_HP:
			if(AllyFlag == true){
				PopKind = POPSTYLE.DAMAGE_ENEMY;
			} else {
				PopKind = POPSTYLE.DAMAGE_ALLY;
			}
			break;
		//最大ＭＰダメージ
		case AFFECT_PARAM.MAX_MP:
			if(cAction.ActEffectFlag == false){
				//SetBoneEffect_("EF130_31_MAHOTORA_REC" , Target)
			}
			PopKind = POPSTYLE.DAMAGE_MP;
			break;
		//それ以外
		default:
			//DebugPrint("Error : " + "BattleCommon_function_" + "SetPopEffect" + "\n");
			//DebugPrint("Efficacy	: " + Efficacy + "\n")
			ScriptStop()
			break;
		}
		break;
	case EFFICACY.HEAL:
		switch (DamageType)
		{
		case AFFECT_PARAM.HP:
		case AFFECT_PARAM.HMP:
			if(DamageValue <= 0){
				//if(cAction.ActEffectFlag == false){
				//	ReplaySE_("SE_SKL_022")
				//}
				PopKind = POPSTYLE.HEAL_HP;					//回復用のポップ
			} else {
				//ダメージ時にはこちらを利用
				if(AllyFlag == true){
					PopKind = POPSTYLE.DAMAGE_ENEMY;
				} else {
					PopKind = POPSTYLE.DAMAGE_ALLY;
				}
			}
			break;
		case AFFECT_PARAM.MP:
			if(DamageValue < 0){
				/*if(cAction.ActEffectFlag == false){
					ReplaySE_("SE_SKL_022")
				}*/
				PopKind = POPSTYLE.HEAL_MP;					//回復用のポップ
			} else {
				//ダメージ時はこちらを利用
				PopKind = POPSTYLE.DAMAGE_MP;
			}
			break;
		default:
			PopKind = POPSTYLE.NONE;//(仮)
			break;
		}
		break;
	case EFFICACY.SUPPORT:
		switch (DamageType)
		{
		//HPダメージ
		case AFFECT_PARAM.HP:
			if(DamageValue >= 0  && IsAbsorption == false){
				if(AllyFlag == true){
					PopKind = POPSTYLE.DAMAGE_ENEMY;
				} else {
					PopKind = POPSTYLE.DAMAGE_ALLY;
				}
				break;
			} else if(DamageValue <= 0){
				PopKind = POPSTYLE.HEAL_HP;
			}
			break;
		//MPダメージ
		case AFFECT_PARAM.MP:
			if(cAction.ActEffectFlag == false){
				if(DamageValue < 0){
					//MP回復時はMP回復エフェクトを出す
					//SetBoneEffect_("EF130_31_MAHOTORA_REC" , Target)
				}
			}
			if(DamageValue >= 0){
				PopKind = POPSTYLE.DAMAGE_MP;
			} else if(DamageValue < 0){
				PopKind = POPSTYLE.HEAL_MP;
			}
			break;
		}
		break;
	case EFFICACY.WEAK:
		switch (DamageType)
		{
		case AFFECT_PARAM.MP:
			if(DamageValue >= 0){
				PopKind = POPSTYLE.DAMAGE_MP;
			} else {
				PopKind = POPSTYLE.HEAL_MP;
			}
		default:
			break;
		}
		break;
	case EFFICACY.OTHER:
		local IsPoisonDamage = IsPoisonDamage_(MultiCount,IndexCount)
		if(IsPoisonDamage == true){						//毒ダメージ
			if(AllyFlag == true){
				PopKind = POPSTYLE.DAMAGE_ENEMY;
			} else {
				PopKind = POPSTYLE.DAMAGE_ALLY;
			}
		} else {
			PopKind = POPSTYLE.NONE;//(仮)
		}
		break;
	default:
		//何もしない
		break;
	}
	
	
	return PopKind;
	
}

//今回のポップ表示で、SEを再生するか？
//MultiCount		：何回目の行動か？
//IndexCount		：何体目の対象か？
//MultiStageCount	：何段目の攻撃か？
//SEFlag			：SEを再生するか？
//PopKind			：ポップ種類
function SetPopEffect_PlaySE(MultiCount,IndexCount,MultiStageCount,PopKind,cAction)
{
	switch(PopKind)
	{
	case POPSTYLE.DAMAGE_ALLY:
	case POPSTYLE.DAMAGE_ENEMY:
	case POPSTYLE.DAMAGE_MP:
	case POPSTYLE.TENSION_UP:
	case POPSTYLE.TENSION_DOWN:
	case POPSTYLE.NONE:
		break;
	case POPSTYLE.HEAL_HP:
		if(cAction.ActEffectFlag == false){
			ReplaySE_("SE_SHA_003")
		}
		break;
	case POPSTYLE.HEAL_MP:
		if(cAction.ActEffectFlag == false){
			ReplaySE_("SE_SHA_004")
		}
		break;
	default:
		//local ListStart =	"*********** function SetPopEffect_PlaySE is Error! ***********"
		//local ListFront =	"・"
		//local List =			["MultiCount"	,	MultiCount
		//						,"IndexCount"	,	IndexCount
		//						,"MultiStageCount"	,	MultiStageCount
		//						,"PopKind"	,	DebugPrint_PopStyle(PopStyle)
		//						]
		//local ListEnd =		"**************************************************************"
		//DebugPrint_OneList(List , ListStart , ListEnd , ListFront)
		break;
	}
}


//今回の行動でテラの追加ダメージが発生したかの確認
//MultiCount		: 何回目の行動か？
//SEFlag			: SEを再生するか？
//
function SetTeraPlusDamage_Init(MultiCount,EffectFlag,MotionFlag,cAction)
{
	//DebugPrint_FuncName_IN("SetTeraPlusDamage_Init");
	//DebugPrint("	=>	MultiCount		:" + MultiCount)
	//DebugPrint("	=>	IndexCount		:" + IndexCount)
	//DebugPrint("	=>	MultiStageCount	:" + MultiStageCount)}
	
	//行動者がいない場合はreturn
	//行動者がマスターの場合はreturn
	if(GetActorIndex_(MultiCount) == INVALID_CHARACTER || IsMaster_(GetActorIndex_(MultiCount)) == true){
		//DebugPrint_FuncName_OUT("SetTeraPlusDamage_Init");
		return;
	}
	
	//テラアタックではない場合はreturn
	if(IsTeraAttack_(MultiCount) == false){
		//DebugPrint_FuncName_OUT("SetTeraPlusDamage_Init");
		return;
	}
	
	Wait_(40)
	
	//テラ攻撃用エフェクトの表示
	local cParty = cFullPartyInfo(cAction.Target[0]);
	local TargetNum = GetTargetNum_(MultiCount)
	local EffectParam = SetPointWorldEffect_("EF010_09_ATTACK_G_SIZE01", cParty.EffectEmpty_Area);
	SetEffectScale_(EffectParam, cParty.EffectScale_Area);
	Wait_(15);
	
	for(local IndexCount = 0 ; IndexCount < TargetNum ; IndexCount++){
		SetDamageEffectSE_TeraPlusDamage(MultiCount,IndexCount);
		SetPopEffect_TeraDamage(MultiCount,IndexCount,0)
		SetDamageUI_TeraPlusDamage(MultiCount,IndexCount)

		local DeathValue = GetStatusValue_(STATUS.DEATH, MultiCount,IndexCount)	//即死の状態異常はSetStateEffect_Initで死亡させるため
		if(IsDead_(MultiCount,IndexCount) && DeathValue == 0){
			SetDeadEffect_TeraDamage(MultiCount,IndexCount,true,MotionFlag,cAction)
		}
	}
	
	Wait_(25)
	//DebugPrint_FuncName_OUT("SetTeraPlusDamage_Init");
}

function SetTeraPlusDamage_Substitute_Init(MultiCount,MotionFlag,cAction)
{
	//DebugPrint_FuncName_IN("SetTeraPlusDamage_Substitute_Init");
	//行動者がいない場合はreturn
	//行動者がマスターの場合はreturn
	if(GetActorIndex_(MultiCount) == INVALID_CHARACTER || IsMaster_(GetActorIndex_(MultiCount)) == true){
		//DebugPrint_FuncName_OUT("SetTeraPlusDamage_Substitute_Init");
		return;
	}
	
	//テラアタックではない場合はreturn
	if(IsTeraAttack_(MultiCount) == false){
		//DebugPrint_FuncName_OUT("SetTeraPlusDamage_Substitute_Init");
		return;
	}
	
	Wait_(40)
	
	//テラ攻撃用エフェクトの表示
	local cParty = cFullPartyInfo(cAction.Target[0]);
	local TargetNum = GetTargetNum_(MultiCount)
	local EffectParam = SetPointWorldEffect_("EF010_09_ATTACK_G_SIZE01", cParty.EffectEmpty_Area);
	local PopCount = 0;
	local MotionTask = null;
	SetEffectScale_(EffectParam, cParty.EffectScale_Area);
	Wait_(15);

	//即死の状態異常はSetStateEffect_Initで死亡させるため
	//一つでも死亡の状態異常があれば死亡演出を行わない
	local StatusDeadCheck = false;
	for(local IndexCount = 0 ; IndexCount < TargetNum ; IndexCount++){
		local DeathValue = GetStatusValue_(STATUS.DEATH, MultiCount,IndexCount)
		if(DeathValue > 0){
			StatusDeadCheck = true;
		}
	}

	for(local IndexCount = 0 ; IndexCount < TargetNum ; IndexCount++){
		if(MotionTask != null){
			DeleteTask_(MotionTask)
			Wait_(10)
		}
		MotionTask = SetDamageEffectSE_TeraPlusDamage(MultiCount,IndexCount);
		SetPopEffect_TeraDamage(MultiCount,IndexCount,PopCount)
		SetDamageUI_TeraPlusDamage(MultiCount,IndexCount)
		
		if(IsDead_(MultiCount,IndexCount) && TargetNum == IndexCount + 1 && StatusDeadCheck == false){
			SetDeadEffect_TeraDamage(MultiCount,IndexCount,true,MotionFlag,cAction)
		}
		PopCount++;
	}
	Wait_(25)
	//DebugPrint_FuncName_OUT("SetTeraPlusDamage_Substitute_Init");
}

//テラの追加ダメージ表示
function SetDamageEffectSE_TeraPlusDamage(MultiCount,IndexCount)
{
	//DebugPrint_FuncName_IN("SetDamageEffectSE_TeraPlusDamage");
	local MissCheck		= SetTeraDamage_MissCheck(MultiCount,IndexCount)
	local MotionTask	= null;
	local Value			= GetTeraDamageValue_(MultiCount,IndexCount);
	local Target		= GetTargetIndex_(MultiCount,IndexCount)
	
	switch(GetDamageType_(MultiCount,IndexCount))
	{
	case AFFECT_PARAM.HP:
	case AFFECT_PARAM.HMP:
	case AFFECT_PARAM.MP:
	case AFFECT_PARAM.MAX_HP:
	case AFFECT_PARAM.MAX_MP:
		if(MissCheck == true){
			//ミスの場合は何もしない
		} else if(IsReflect_(MultiCount,IndexCount)){
			//反射は通常ダメージ判定と同じ判定
			EffParamSizeEffect(Target,"EF000_13_COUNTER");
		/*} else if(IsReflect_(MultiCount,IndexCount)){
			//防御は通常ダメージ判定と同じ判定
			EffParamSizeEffect(Target,"EF000_13_COUNTER");*/
		} else {
			//（テラダメージでは吸収が発生しない）
			//通常ダメージ判定
			EffParamSizeEffect(Target,"EF010_01_HIT");
			if(Value > 0){
				//ダメージが０より大きい場合
				SetMotion_(Target, MOT_DAMAGE, 4);
				MotionTask = Task_ChangeMotion_(Target, MOT_WAIT, 4);
				
			} else {
				//ダメージが０の場合
				
			}
		}
		break;
	default:
		break;
	}
	//DebugPrint_FuncName_OUT("SetDamageEffectSE_TeraPlusDamage");
	return MotionTask;
}

//ポップ表示＿テラ追加ダメージ用
function SetPopEffect_TeraDamage(MultiCount,IndexCount,PopCount)
{
	//DebugPrint_FuncName_IN("SetPopEffect_TeraDamage");
	//DebugPrint("	=>	MultiCount		:" + MultiCount)
	//DebugPrint("	=>	IndexCount		:" + IndexCount)
	
	//反射・防御の場合はreturn
	if(IsReflect_(MultiCount,IndexCount)){return;}
	if(IsGuard_(MultiCount,IndexCount)){return;}
	
	local ActHitNum	= GetActHitNum_(MultiCount,IndexCount)
	local MissCheck	= SetTeraDamage_MissCheck(MultiCount,IndexCount);
	
	//テラの追加ダメージでMissかどうかはScript側で判定
	local Value			= GetTeraDamageValue_(MultiCount,IndexCount);
	local AllyFlag		= IsAlly_(GetTargetIndex_(MultiCount,IndexCount));
	local Target		= GetTargetIndex_(MultiCount,IndexCount);
	local cTarget		= cMonsterInfo(Target)
	local PopKind;
	
	//ダメージポップ種類の指定
	switch(GetDamageType_(MultiCount,IndexCount))
	{
	case AFFECT_PARAM.HP:
	case AFFECT_PARAM.HMP:
		//HPダメージ
		if(AllyFlag){
			PopKind = POPSTYLE.DAMAGE_ENEMY;
		} else {
			PopKind = POPSTYLE.DAMAGE_ALLY;
		}
		break;
	case AFFECT_PARAM.MP:
		//MPダメージ
		PopKind = POPSTYLE.DAMAGE_MP
		break;
	case AFFECT_PARAM.MAX_HP:
		//最大HPダメージ
		if(AllyFlag){
			PopKind = POPSTYLE.DAMAGE_ENEMY;
		} else {
			PopKind = POPSTYLE.DAMAGE_ALLY;
		}
		break;
	case AFFECT_PARAM.MAX_MP:
		//最大MPダメージ
		PopKind = POPSTYLE.DAMAGE_MP
		break;
	default:
		break;
	}
/*	print("MultiCount	: " + MultiCount + "\n")
	print("IndexCount	: " + IndexCount + "\n")
	print("Target	: " + Target + "\n")
	print("PopKind	: " + PopKind + "\n")
	print("Value	: " + Value + "\n")
	print("MissCheck	: " + MissCheck + "\n")
	print("cTarget.PopDate_X[0]	: " + cTarget.PopDate_X[0] + "\n")
	print("cTarget.PopDate_Y[0]	: " + cTarget.PopDate_Y[0] + "\n")*/
	
	SetPop_(Target,PopKind,Value,MissCheck, cTarget.PopDate_X[PopCount] , cTarget.PopDate_Y[PopCount] , 1.0);
	//DebugPrint_FuncName_OUT("SetPopEffect_TeraDamage");
}

//テラ追加攻撃がミスかどうかを判定し返す
//	MultiCOunt	: 何回目の行動か？
//	IndexCount	: 何体目の対象か？
function SetTeraDamage_MissCheck(MultiCount,IndexCount)
{
	local MissCheck = false;
	//DebugPrint_FuncName_IN("SetTeraDamage_MissCheck");
	//DebugPrint("	=>	MultiCount		:" + MultiCount)
	//DebugPrint("	=>	IndexCount		:" + IndexCount)
	//テラの追加ダメージでMissかどうかはScript側で判定
	local ActHitNum = GetActHitNum_(MultiCount,IndexCount)
	for(local MultiStageCount = 0 ; MultiStageCount < ActHitNum ; MultiStageCount++){
		if(IsMiss_(MultiCount,IndexCount,MultiStageCount) != false && MissCheck == false){
			MissCheck = true;
		}
	}
	//DebugPrint_FuncName_OUT("SetTeraDamage_MissCheck");
	//DebugPrint("	<=	MissCheck		:" + MissCheck)
	return MissCheck;
}

//テラ追加攻撃が反射かどうかを判定し返す
//	MultiCOunt	: 何回目の行動か？
//	IndexCount	: 何体目の対象か？
function SetTeraDamage_RefrectCheck(MultiCount,IndexCount)
{
	local MissCheck = false;
	//DebugPrint_FuncName_IN("SetTeraDamage_RefrectCheck");
	//DebugPrint("	=>	MultiCount		:" + MultiCount)
	//DebugPrint("	=>	IndexCount		:" + IndexCount)
	//テラの追加ダメージでMissかどうかはScript側で判定
	local ActHitNum = GetActHitNum_(MultiCount,IndexCount)
	for(local MultiStageCount = 0 ; MultiStageCount < ActHitNum ; MultiStageCount++){
		if(IsMiss_(MultiCount,IndexCount,MultiStageCount) != false && MissCheck == false){
			MissCheck = true;
		}
	}
	//DebugPrint_FuncName_OUT("SetTeraDamage_RefrectCheck");
	//DebugPrint("	<=	MissCheck		:" + MissCheck)
	return MissCheck;
}

//ダメージ処理のUI反映
function SetDamageUI_Init(MultiCount,IndexCount,MultiStageCount,cAction)
{
	//DebugPrint_FuncName_IN("SetDamageUI_Init");
	//DebugPrint("	=>	MultiCount		:" + MultiCount)
	//DebugPrint("	=>	IndexCount		:" + IndexCount)
	//DebugPrint("	=>	MultiStageCount	:" + MultiStageCount)
	
	//DebugPrint("cAction.MultiStageCount	:" + cAction.MultiStageCount)
	
	//下画面UIへの反映(HPダメージ)
	if(cAction.MultiStageCount[IndexCount] != 0){
		local Target		= GetTargetIndex_(MultiCount,IndexCount)
		local DamageValue	= GetDamageValue_(MultiCount,IndexCount,MultiStageCount)
		local DamageType	= GetDamageType_(MultiCount,IndexCount)
		//DebugPrint("++++++  DAMAGECHECK!  +++++++" + "\n")
		if(DamageValue != 0){
			switch(DamageType)
			{
			//HPダメージの場合
			case AFFECT_PARAM.HP:
			case AFFECT_PARAM.HMP:
				//DebugPrint("      HP_DAMAGE" + "\n")
				if(IsRevival_(MultiCount,IndexCount) == true){
					MonsterRevival_(Target , DamageValue);
				} else {
					SetHpDamage_(Target , DamageValue);
					if(IsLastStand_(MultiCount,IndexCount) == true || IsBraveHart_(MultiCount,IndexCount) == true){
						//ラストスタンド・くじけぬ心用例外処理
						SetHpDamage_(Target , -1);
					}
				}
				break;
			//MPダメージの場合
			case AFFECT_PARAM.MP:
				//DebugPrint("      MP_DAMAGE" + "\n")
				SetMpDamage_(Target , DamageValue);
				break
			//最大HPダメージの場合
			case AFFECT_PARAM.MAX_HP:
				//DebugPrint("      MAXHP_DAMAGE" + "\n")
				SetHpMaxDamage_(Target , DamageValue)
				break;
			//最大MPダメージの場合
			case AFFECT_PARAM.MAX_MP:
				//DebugPrint("      MAXMP_DAMAGE" + "\n")
				SetMpMaxDamage_(Target , DamageValue)
				break;
			//それ以外
			default:
				break;
			}
		}
		
		//DebugPrint("        Target		: " + Target + "\n")
		//DebugPrint("        DamageValue	: " + DamageValue + "\n")
		if(IsDead_(MultiCount , IndexCount)){
			//DebugPrint("        Target is Dead. " + "\n")
		}
	}
	
	//DebugPrint_FuncName_OUT("SetDamageUI_Init");
}

//テラ追加ダメージ処理のUI反映
function SetDamageUI_TeraPlusDamage(MultiCount,IndexCount)
{
	//DebugPrint_FuncName_IN("SetDamageUI_TeraPlusDamage");
	//DebugPrint("	=>	MultiCount		:" + MultiCount)
	//DebugPrint("	=>	IndexCount		:" + IndexCount)
	
	//下画面UIへの反映(HPダメージ)
	local Target		= GetTargetIndex_(MultiCount,IndexCount);
	local DamageValue	= GetTeraDamageValue_(MultiCount,IndexCount);
	local DamageType	= GetDamageType_(MultiCount,IndexCount);
	//DebugPrint("++++++  TERADAMAGECHECK!  +++++++" + "\n")
	if(DamageValue != 0){
		switch(DamageType)
		{
		//HPダメージの場合
		case AFFECT_PARAM.HP:
		case AFFECT_PARAM.HMP:
			//DebugPrint("      HP_DAMAGE" + "\n")
			SetHpDamage_(Target , DamageValue);
			if(IsLastStand_(MultiCount,IndexCount) == true || IsBraveHart_(MultiCount,IndexCount) == true){
				//ラストスタンド・くじけぬ心用例外処理
				SetHpDamage_(Target , -1);
			}
			break;
		//MPダメージの場合
		case AFFECT_PARAM.MP:
			//DebugPrint("      MP_DAMAGE" + "\n")
			SetMpDamage_(Target , DamageValue);
			break
		//最大HPダメージの場合
		case AFFECT_PARAM.MAX_HP:
			//DebugPrint("      MAXHP_DAMAGE" + "\n")
			SetHpMaxDamage_(Target , DamageValue)
			break;
		//最大MPダメージの場合
		case AFFECT_PARAM.MAX_MP:
			//DebugPrint("      MAXMP_DAMAGE" + "\n")
			SetMpMaxDamage_(Target , DamageValue)
			break;
		//それ以外
		default:
			break;
		}
	}
	
	//DebugPrint_FuncName_OUT("SetDamageUI_TeraPlusDamage");
}


//ステータス変化エフェクト関数
//	IndexCount		:何体目の対象モンスターか？
//	MultiCount		:何回目の行動か？
//	cAction			:cActionクラス
function SetStateEffect_Init(IndexCount,MultiCount,cAction)
{
	//DebugPrint_FuncName_IN("SetStateEffect_Init");
	//local ArgList =		["MultiCount"	,	MultiCount
	//					,"IndexCount"	,	IndexCount
	//					]
	//DebugPrint_functionParam("SetStateEffect_Init" , ArgList)
	
	
	//リターン用の値（WaitFrame数）
	local WaitFrame = 0;
	
	local Target			= GetTargetIndex_(MultiCount,IndexCount);
	local cTarget			= cMonsterInfo(Target)
	
	local IsReflect			= IsReflect_(MultiCount,IndexCount)
	local IsDead			= IsDead_(MultiCount,IndexCount);
	local Efficacy			= GetActionEfficacy_(MultiCount)
	local DamageType		= GetDamageType_(MultiCount,IndexCount)

	//どのステータス変化があったか判定
	if(IsDead == true){
		local SEFlag		= true;
		local MotionFlag	= true;
		WaitFrame = SetStateEffect_DeadMonsterEffect(MultiCount,IndexCount,SEFlag,MotionFlag)
	}
	else{
		for(local y = STATUS_TOP ; y < STATUS_NUM ; y += 1){	//StateListの１つ目の値はダメージなので無視する
			local StateFlag			= GetStatusFlag_(y,MultiCount,IndexCount);
			local StateEndFlag		= GetStatusEndFlag_(y,MultiCount,IndexCount);
			local StateValue		= GetStatusValue_(y,MultiCount,IndexCount);
			local NowStateValue		= GetMonsterStatusValue_(y,Target);
			local AllyFlag			= IsAlly_(Target);
			local Actor				= GetActorIndex_(MultiCount)
			//デバッグ用
			//if(StateValue != 0){
			//	local ListStart =		"LINE";
			//	local ListEnd =			"LINE";
			//	local ListFront =		null;
			//	local List =			["StateName"			, gStateData[y].Up_Motion
			//							,"StateFlag"			, StateFlag
			//							,"StateEndFlag"			, StateEndFlag
			//							,"StateValue"			, StateValue
			//							,"NowStateValue"		, NowStateValue
			//							,"gStateData[y].Name"	, gStateData[y].Name
			//							,"gStateData[y].Up_Effect"	, gStateData[y].Up_Effect
			//							,"gStateData[y].Up_Motion"	, gStateData[y].Up_Motion
			//							,"gStateData[y].Up_Wait"	, gStateData[y].Up_Wait
			//							,"gStateData[y].Up_MissPop"	, gStateData[y].Up_MissPop
			//							,"gStateData[y].Down_Effect"	, gStateData[y].Down_Effect
			//							,"gStateData[y].Down_Motion"	, gStateData[y].Down_Motion
			//							,"gStateData[y].Down_Wait"	, gStateData[y].Down_Wait
			//							,"gStateData[y].Down_MissPop"	, gStateData[y].Down_MissPop
			//							,"gStateData[y].Reset_Wait"	, gStateData[y].Reset_Wait
			//							]
			//	//DebugPrint_OneList(List , ListStart , ListEnd , ListFront)
			//}
			//メッセージ表示は状態成否に関係なく表示
			if(StateValue != 0){
				if(IndexCount == 0){
					//上昇時
					if(StateValue > 0){
						if(IsStatusUpMessageVisible(y) == true){
							if(GetActionNum_() == 1){
								//単発攻撃時
								//if(SetStateEffect_StateChangeCheck(MultiCount)){
									//誰かにステータス変化があった際のみ判定
										AddBattleOtherMessage_(GetStatusUpMessageId(y))
								//}
							} else {
								//連続攻撃時のステータス変化メッセージは、積み重ねる
								if(SetStateEffect_StateChangeCheck(MultiCount)){
									AddBattleOtherMessage_(GetStatusUpMessageId(y))
								}
							}
						} else {
							//例外的にメッセージを出す場合
							switch(y)
							{
							case STATUS.DEATH:
								//即死攻撃時のみ
								local IsAttack = (Efficacy == EFFICACY.ATTACK && DamageType == AFFECT_PARAM.HP)
								if(IsAttack == true){
									AddBattleOtherMessage_(GetStatusUpMessageId(STATUS.DEATH))
								}
								break;
							default:
								break;
							}
						}
					//減少時
					} else {
						if(IsStatusDownMessageVisible(y) == true){
							if(GetActionNum_() == 1){
								//単発攻撃時
								//if(SetStateEffect_StateChangeCheck(MultiCount)){
									//誰かにステータス変化があった際のみ判定
									AddBattleOtherMessage_(GetStatusDownMessageId(y))
								//}
							} else {
								//連続攻撃時のステータス変化メッセージは、積み重ねる
								if(SetStateEffect_StateChangeCheck(MultiCount)){
									AddBattleOtherMessage_(GetStatusDownMessageId(y))
								}
							}
						}
					}
				}
			} else if(StateEndFlag == true){
				if(IsStatusResetMessageVisible(y) == true){
					if(IsLightWave_(MultiCount)){
						//光のはどうの場合はメッセージを表示しない
						WaitFrame = GetStatusResetWait(y);
					}else if(IsFreezeWave_(MultiCount)){
						//凍てつくはどうの場合はメッセージを表示しない
						WaitFrame = GetStatusResetWait(y);
					} else {
						//通常処理
						AddBattleOtherMessage_(GetStatusResetMessageId(y))
						WaitFrame = GetStatusResetWait(y);
					}
				}
			}
			//ステータス変化があった場合
			if(StateFlag == true && StateValue != 0){
				//上昇ステータス時
				if(StateValue > 0){
					if(gStateData[y].Up_Effect != null){
						//エフェクトは表示は行わない
						//MonsterSizeEffect(Target,gStateData[y].Up_Effect);
					}
					if(gStateData[y].Up_Motion != null){
						SetMotion_(Target, gStateData[y].Up_Motion, 0);
						Task_ChangeMotion_(Target , MOT_WAIT , 0);
					}
					switch(y)
					{
					case STATUS.TENSION:
						SetStateEffect_TensionPop(MultiCount , IndexCount , true)
						break;
					case STATUS.POISON:
						ReplaySE_("SE_BTL_010")
						break;
					case STATUS.SLEEP:
						ReplaySE_("SE_BTL_011")
						break;
					case STATUS.PARALYSIS:
						ReplaySE_("SE_BTL_012")
						break;
					case STATUS.HIDE:
						Task_ObjectFadeOut_(Target, 15);
						break;
					case STATUS.DEATH:
						SetHpDamage_(Target , GetMonsterHp_(Target));
						break;
					default:
						break;
					}
					WaitFrame = gStateData[y].Up_Wait;
				//減少ステータス時
				} else if(StateValue < 0){
					if(gStateData[y].Down_Effect != null){
						//エフェクトは表示は行わない
						//MonsterSizeEffect(Target,gStateData[y].Down_Effect);
					}
					if(gStateData[y].Down_Motion != null){
						SetMotion_(Target, gStateData[y].Down_Motion, 4);
						Task_ChangeMotion_(Target , MOT_WAIT , 4);
					}
					switch(y)
					{
					case STATUS.TENSION:
						SetStateEffect_TensionPop(MultiCount , IndexCount , false)
						break;
					case STATUS.HIDE:
						Task_ObjectFadeIn_(Target, 15);
						break
					default:
						break
					}
					WaitFrame = gStateData[y].Down_Wait;
				}
			//ステータス変化でミスだった場合
			} else if(StateFlag == false && StateValue != 0 && IsReflect == false){
				//上昇ステータス時
				if(StateValue > 0){
					if(gStateData[y].Up_MissPop == true){
						SetPop_(Target , POPSTYLE.NONE , 0 , true,cTarget.PopDate_X[0],cTarget.PopDate_Y[0],1.0)
						ReplaySE_("SE_BTL_022");
					}
					WaitFrame = gStateData[y].Up_Wait;
				//減少ステータス時
				} else if(StateValue < 0){
					if(gStateData[y].Down_MissPop == true){
						SetPop_(Target , POPSTYLE.NONE , 0 , true,cTarget.PopDate_X[0],cTarget.PopDate_Y[0],1.0)
						ReplaySE_("SE_BTL_022");
					}
					WaitFrame = gStateData[y].Down_Wait;
				}
			//ステータス変化で反射だった場合
			} else if(StateFlag == false && StateValue != 0 && IsReflect == true){
				//上昇ステータス時
				if(StateValue > 0){
					switch(y)
					{
					case STATUS.HPMAX_DOWN:
					case STATUS.MPMAX_DOWN:
						break;
					default:
						MonsterSizeEffect(Target,"EF000_13_COUNTER")
						WaitFrame = gStateData[y].Up_Wait;
						break;
					}
				//減少ステータス時
				} else if(StateValue < 0){
					switch(y)
					{
					case STATUS.HPMAX_DOWN:
					case STATUS.MPMAX_DOWN:
						break;
					default:
						MonsterSizeEffect(Target,"EF000_13_COUNTER")
						WaitFrame = gStateData[y].Down_Wait;
						break;
					}
				}
			}
			//ステルスアタックが解除されたら、強制的に表示
			local IsDead = IsDead_(MultiCount,IndexCount);
			if(y == STATUS.STEALTHATTACK && StateEndFlag == true && IsDead == false){
				Task_ObjectFadeIn_(Target, 30);
			}
		}
	}
	
	//「チェンジ」の例外処理
	SetStateEffect_Spell_Change(MultiCount,IndexCount)
	
	//UI反映
	//即死系→特性復活用例外処理
	if(IsResurrectionFromDead(MultiCount,IndexCount) == true){
		local hp = GetMonsterHp_(Target);
		SetHpDamage_(Target , (hp - 1));	// HPを1にする
	} else {
		SetStatusChange_(MultiCount, IndexCount);
	}
	
	//DebugPrint_FuncName_OUT("SetStateEffect_Init");
	return WaitFrame;
}


//ステータス変化エフェクト関数
//	IndexCount		:何体目の対象モンスターか？
//	MultiCount		:何回目の行動か？
//	cAction			:cActionクラス
function SetBAKURETSUStateEffect_Init(IndexCount,MultiCount,MultiStageCount,MotionTask,cAction)
{
	//DebugPrint_FuncName_IN("SetBAKURETSUStateEffect_Init");
	//DebugPrint("	=>	IndexCount		:" + IndexCount)
	//DebugPrint("	=>	MultiCount		:" + MultiCount)
	
	//リターン用の値（WaitFrame数）
	local WaitFrame = 0;
	
	local Target			= GetTargetIndex_(MultiCount,IndexCount);
	local cTarget			= cMonsterInfo(Target)
	local Actor				= GetActorIndex_(MultiCount)
	local AllyFlag			= IsAlly_(Target);
	local IsReflect			= IsReflect_(MultiCount,IndexCount)
	
	//どのステータス変化があったか判定
	if(IsDead_(MultiCount,IndexCount) == false){
		for(local y = STATUS_TOP ; y < STATUS_NUM ; y += 1){	//StateListの１つ目の値はダメージなので無視する
			local StateValue		= GetStatusValue_(y,MultiCount,IndexCount);
			local StateEndFlag		= GetStatusEndFlag_(y,MultiCount,IndexCount);
			if(StateValue != 0 || StateEndFlag == true){
				local StateFlag			= GetStatusFlag_(y,MultiCount,IndexCount);
				local StateEndFlag		= GetStatusEndFlag_(y,MultiCount,IndexCount);
				local NowStateValue		= GetMonsterStatusValue_(y,Target);
				//メッセージ表示は状態成否に関係なく表示
				if(StateValue != 0){
					if(IndexCount == 0){
						if(StateValue > 0){
							if(IsStatusUpMessageVisible(y) == true){
								if(GetActionNum_() == 1){
									//単発攻撃時
									//if(SetStateEffect_StateChangeCheck(MultiCount)){
										//ステータス変化が発生した場合のみメッセージを表示
										AddBattleOtherMessage_(GetStatusUpMessageId(y))
									//}
								} else {
									//連続攻撃時のステータス変化メッセージは、積み重ねる
									if(SetStateEffect_StateChangeCheck(MultiCount)){
										//ステータス変化が発生した場合のみメッセージを表示
										AddBattleOtherMessage_(GetStatusUpMessageId(y))
									}
								}
							}
						} else {
							if(IsStatusDownMessageVisible(y) == true){
								if(GetActionNum_() == 1){
									//単発攻撃時
									//if(SetStateEffect_StateChangeCheck(MultiCount)){
										//ステータス変化が発生した場合のみメッセージを表示
										AddBattleEventMessage_(GetStatusDownMessageId(y))
									//}
								} else {
									//連続攻撃時のステータス変化メッセージは、積み重ねる
									if(SetStateEffect_StateChangeCheck(MultiCount)){
										//ステータス変化が発生した場合のみメッセージを表示
										AddBattleEventMessage_(GetStatusUpMessageId(y))
									}
								}
							}
						}
					}
				} else if(StateEndFlag == true){
					if(IsStatusResetMessageVisible(y) == true){
						//ステータス解除時
						AddBattleEventMessage_(IsAlly_(Actor) , GetStatusResetMessageId(y))
						WaitFrame = GetStatusResetWait(y);
					}
				}
				//ステータス変化があった場合
				if(StateFlag == true && StateValue != 0){
					//上昇ステータス時
					if(StateValue > 0){
						if(gStateData[y].Up_Effect != null){
							//エフェクト表示は行わない
							//MonsterSizeEffect(Target,gStateData[y].Up_Effect);
						}
						if(gStateData[y].Up_Motion != null){
							SetMotion_(Target, gStateData[y].Up_Motion, 4);
							if(MotionTask != null){
								DeleteTask_(MotionTask)
							}
							MotionTask = Task_ChangeMotion_(Target , MOT_WAIT , 4);
						}
						//各種ステータス例外処理
						switch(y)
						{
						case STATUS.TENSION:
							SetBAKURETSUStateEffect_TensionPop(MultiCount , IndexCount , true)
							break;
						default:
							break;
						}
						WaitFrame = gStateData[y].Up_Wait;
					//減少ステータス時
					} else if(StateValue < 0){
						if(gStateData[y].Down_Effect != null){
							//エフェクト表示は行わない
							//MonsterSizeEffect(Target,gStateData[y].Down_Effect);
						}
						if(gStateData[y].Down_Motion != null){
							SetMotion_(Target, gStateData[y].Down_Motion, 4);
							if(MotionTask != null){
								DeleteTask_(MotionTask)
							}
							Task_ChangeMotion_(Target , MOT_WAIT , 4);
						}
						//各種ステータス例外処理
						switch(y)
						{
						case STATUS.TENSION:
							SetBAKURETSUStateEffect_TensionPop(MultiCount , IndexCount , false)
							break;
						default:
							break;
						}
						WaitFrame = gStateData[y].Down_Wait;
					}
				//ステータス変化でミスだった場合
				} else if(StateFlag == false && StateValue != 0 && IsReflect == false){
					//上昇ステータス時
					if(StateValue > 0){
						//ステータスごとで分岐
						switch(y)
						{
						case STATUS.TENSION:
							SetBAKURETSUStateEffect_TensionPop(MultiCount , IndexCount , false)
							break;
						default:
							if(gStateData[y].Up_MissPop == true){
								SetPop_(Target , POPSTYLE.NONE , 0 , true,cTarget.PopDate_X[0],cTarget.PopDate_Y[0],1.0)
								ReplaySE_("SE_BTL_022");
							}
							break;
						}
						WaitFrame = gStateData[y].Up_Wait;
					//減少ステータス時
					} else if(StateValue < 0){
						//ステータスごとで分岐
						switch(y)
						{
						case STATUS.TENSION:
							SetBAKURETSUStateEffect_TensionPop(MultiCount , IndexCount , false)
							ReplaySE_("SE_BTL_022");
							break;
						default:
							if(gStateData[y].Down_MissPop == true){
								SetPop_(Target , POPSTYLE.NONE , 0 , true,cTarget.PopDate_X[0],cTarget.PopDate_Y[0],1.0)
								ReplaySE_("SE_BTL_022");
							}
							break;
						}
						WaitFrame = gStateData[y].Down_Wait;
					}
				//ステータス変化で反射だった場合
				} else if(StateFlag == false && StateValue != 0 && IsReflect == true){
					//上昇ステータス時
					if(StateValue > 0){
						//ステータスごとで分岐
						switch(y)
						{
						case STATUS.TENSION:
							MonsterSizeEffect(Target,"EF000_13_COUNTER")
							WaitFrame = gStateData[y].Up_Wait;
							break;
						case STATUS.HPMAX_DOWN:
						case STATUS.MPMAX_DOWN:
							break;
						default:
							MonsterSizeEffect(Target,"EF000_13_COUNTER")
							WaitFrame = gStateData[y].Up_Wait;
							break;
						}
						
					//減少ステータス時
					} else if(StateValue < 0){
						//ステータスごとで分岐
						switch(y)
						{
						case STATUS.TENSION:
							MonsterSizeEffect(Target,"EF000_13_COUNTER")
							WaitFrame = gStateData[y].Down_Wait;
							break;
						case STATUS.HPMAX_DOWN:
						case STATUS.MPMAX_DOWN:
							break;
						default:
							MonsterSizeEffect(Target,"EF000_13_COUNTER")
							WaitFrame = gStateData[y].Down_Wait;
							break;
						}
					}
				//ステータス変化が解除の場合
				} else if(StateEndFlag == true){
					//解除時用の処理（今のところ演出なし）
					WaitFrame = gStateData[y].Reset_Wait;
				}
				//ステルスアタックが解除されたら、強制的に表示
				local IsDead = IsDead_(MultiCount,IndexCount);
				if(y == STATUS.STEALTHATTACK && StateEndFlag == true && IsDead == false){
					Task_ObjectFadeIn_(Target, 30);
				}
			} else {
				//変化がない場合はSkip
			}
		}
	}
	
	//「チェンジ」の例外処理
	SetStateEffect_Spell_Change(MultiCount,IndexCount)
	
	//UI反映
	SetStatusChange_(MultiCount, IndexCount);
	
	local ReturnParam = [];//戻り値
	ReturnParam.append(WaitFrame);	//ステータス変化のWaitFrame数
	ReturnParam.append(MotionTask);	//TaskChangeMotionで設定されたTask
	
	//DebugPrint_FuncName_OUT("SetBAKURETSUStateEffect_Init");
	return ReturnParam;
}

//ステータス変化エフェクト（物理攻撃用）関数
function SetAttackStateEffect_Init(IndexCount,MultiCount,cAction)
{
	//DebugPrint_FuncName_IN("SetAttackStateEffect_Init");
	//DebugPrint("	=>	IndexCount		:" + IndexCount)
	//DebugPrint("	=>	MultiCount		:" + MultiCount)
	
	//戻り値用の値
	local WaitFrame		= 0;	//WaitFrame数
	
	local Target			= GetTargetIndex_(MultiCount,IndexCount)
	local cTarget			= cMonsterInfo(Target)
	
	//どのステータス変化があったか判定
	
	if(IsDead_(MultiCount,IndexCount) == false){
		for(local y = STATUS_TOP ; y < STATUS_NUM ; y += 1){	//StateListの１つ目の値はダメージなので無視する
			local StateFlag			= GetStatusFlag_(y,MultiCount,IndexCount)
			local StateValue		= GetStatusValue_(y,MultiCount,IndexCount)
			local NowStateValue		= GetMonsterStatusValue_(y,Target)
			local StateEndFlag		= GetStatusEndFlag_(y,MultiCount,IndexCount);
			local AllyFlag			= IsAlly_(Target);
			local Actor				= GetActorIndex_(MultiCount)
			//if(StateValue != 0){
			//	local ListStart =	"LINE"
			//	local ListFront =	"・"
			//	local List =			["Name"				,	gStateData[y].Name
			//							,"StateFlag"		,	StateFlag
			//							,"StateValue"		,	StateValue
			//							,"StateEndFlag"		,	StateEndFlag
			//							,"IndexCount"		,	IndexCount
			//							,"MultiCount"		,	MultiCount
			//							,"NowStateValue"	,	NowStateValue
			//							]
			//	local ListEnd =		"LINE"
			//	//DebugPrint_OneList(List , ListStart , ListEnd , ListFront)
			//}
			//ステータス変化があった場合
			if(StateFlag == true && StateValue != 0){
				//上昇ステータス時
				if(StateValue > 0){
					if(IsStatusUpMessageVisible(y) == true){
						if(GetActionNum_() == 1){
							AddBattleOtherMessage_(GetStatusUpMessageId(y))
						} else {
							//連続攻撃時のステータス変化メッセージは、積み重ねる
							AddBattleOtherMessage_(GetStatusUpMessageId(y))
						}
					}
					if(gStateData[y].Up_Effect != null){
						EffParamSizeEffect(Target,gStateData[y].Up_Effect);
					}
					if(gStateData[y].Up_Motion != null){
						SetMotion_(Target, gStateData[y].Up_Motion, 4);
						Task_ChangeMotion_(Target , MOT_WAIT , 4);
					}
					if(y == STATUS.TENSION){
						SetStateEffect_TensionPop(MultiCount , IndexCount , true)
					}
					WaitFrame = gStateData[y].Up_Wait;
				//減少ステータス時
				} else if(StateValue < 0){
					if(IsStatusDownMessageVisible(y) == true){
						if(GetActionNum_() == 1){
							AddBattleOtherMessage_(IsAlly_(Actor) , GetStatusDownMessageId(y))
						} else {
							AddBattleOtherMessage_(GetStatusDownMessageId(y))
						}
					}
					if(gStateData[y].Down_Effect != null){
						EffParamSizeEffect(Target,gStateData[y].Down_Effect)
					}
					if(gStateData[y].Down_Motion != null){
						SetMotion_(Target, gStateData[y].Down_Motion, 4);
						Task_ChangeMotion_(Target , MOT_WAIT , 4);
					}
					if(y == STATUS.TENSION){
						SetStateEffect_TensionPop(MultiCount , IndexCount , false)
					}
					WaitFrame = gStateData[y].Down_Wait;
				}
			//ステータス変化でミスだった場合
			} else if(StateFlag == false && StateValue != 0){
				//ミスの場合は何もしない
				WaitFrame = 0;
			//ステータス変化が解除の場合
			} else if(StateEndFlag == true){
				if(IsStatusResetMessageVisible(y) == true){
					AddBattleOtherMessage_(AllyFlag, GetStatusResetMessageId(y));
					WaitFrame = 0;
				}
			}
		}
	} else {
		//死亡時のみのステータス判定
		local SEFlag		= true;
		local MotionFlag	= true;
		WaitFrame = SetAttackStateEffect_DeadMonsterEffect(MultiCount,IndexCount,SEFlag,MotionFlag)
	}
	
	//「チェンジ」の例外処理
	SetStateEffect_Spell_Change(MultiCount,IndexCount)
	
	
	//if(IsDead_(MultiCount,IndexCount) == false){
		SetStatusChange_(MultiCount, IndexCount);
	//}
	
	//戻り値の設定
	local MotionTask = null;
	local ReturnParam = [];
	ReturnParam.append(WaitFrame)
	ReturnParam.append(MotionTask)
	
	return ReturnParam;
	
	//DebugPrint_FuncName_OUT("SetAttackStateEffect_Init");
}

//モンスター死亡時用ステータス変化
function SetStateEffect_DeadMonsterEffect(MultiCount,IndexCount,SEFlag,MotionFlag)
{
	//DebugPrint_FuncName_IN("SetStateEffect_DeadMonsterEffect");
	//local ArgList =	["MultiCount"	,	MultiCount
	//				,"IndexCount"	,	IndexCount
	//				,"SEFlag"		,	SEFlag
	//				,"MotionFlag"	,	MotionFlag
	//				]
	//DebugPrint_functionParam("SetStateEffect_DeadMonsterEffect" , ArgList)
	
	local Target = GetTargetIndex_(MultiCount,IndexCount)
	local WaitFrame = 0;
	
	for(local y = STATUS_TOP ; y < STATUS_NUM ; y += 1){
		local StateValue		= GetStatusValue_(y,MultiCount,IndexCount);
		//デバッグ用
		if(StateValue != 0){
			local StateFlag			= GetStatusFlag_(y,MultiCount,IndexCount);
			local StateEndFlag		= GetStatusEndFlag_(y,MultiCount,IndexCount);
			local NowStateValue		= GetMonsterStatusValue_(y,Target)
			//local ListStart =		"-------- [DeadStateChange] --------";
			//local ListFront =		null;
			//local List =			["StateName"			, gStateData[y].Up_Motion
			//						,"StateFlag"			, StateFlag
			//						,"StateEndFlag"			, StateEndFlag
			//						,"StateValue"			, StateValue
			//						,"NowStateValue"		, NowStateValue
			//						,"gStateData[y].Name"	, gStateData[y].Name
			//						,"gStateData[y].Up_Effect"	, gStateData[y].Up_Effect
			//						,"gStateData[y].Up_Motion"	, gStateData[y].Up_Motion
			//						,"gStateData[y].Up_Wait"	, gStateData[y].Up_Wait
			//						,"gStateData[y].Up_MissPop"	, gStateData[y].Up_MissPop
			//						,"gStateData[y].Down_Effect"	, gStateData[y].Down_Effect
			//						,"gStateData[y].Down_Motion"	, gStateData[y].Down_Motion
			//						,"gStateData[y].Down_Wait"	, gStateData[y].Down_Wait
			//						,"gStateData[y].Down_MissPop"	, gStateData[y].Down_MissPop
			//						,"gStateData[y].Reset_Wait"	, gStateData[y].Reset_Wait
			//						]
			//local ListEnd =			"LINE";
			//DebugPrint_OneList(List , ListStart , ListEnd , ListFront)
		}
		switch(y)
		{
		case STATUS.DEATH:
		case STATUS.ERASE:
			//死亡・蘇生不可
			local StateFlag			= GetStatusFlag_(y,MultiCount,IndexCount);
			if(StateValue != 0){
				//共通（１体目のみ）
				if(IndexCount == 0){
					//上昇時メッセージ
					if(StateValue > 0 && IsStatusUpMessageVisible(y) == true){
						AddBattleOtherMessage_(GetStatusUpMessageId(y))
					}
					//以下例外用
					switch(y)
					{
					case STATUS.DEATH:
						//即死攻撃時のみ
						local Efficacy		= GetActionEfficacy_(MultiCount)
						local DamageType	= GetDamageType_(MultiCount,IndexCount)
						if(Efficacy	== EFFICACY.ATTACK && DamageType == AFFECT_PARAM.HP){
							AddBattleOtherMessage_(GetStatusUpMessageId(STATUS.DEATH))
						}
						break;
					default:
						break;
					}
					//減少時メッセージ
					if(StateValue < 0 && IsStatusDownMessageVisible(y) == true){
						AddBattleOtherMessage_(GetStatusDownMessageId(y))
					}
				}
				//共通（毎回）
				if(StateValue > 0){
					//上昇時
					if(gStateData[y].Up_Wait){
						WaitFrame = gStateData[y].Up_Wait
					}
				} else if(StateValue < 0){
					//減少時
					if(gStateData[y].Down_Wait){
						WaitFrame = gStateData[y].Down_Wait
					}
				}
			}
			//個別処理
			local IsDead = IsDead_(MultiCount,IndexCount)
			if(StateValue != 0 && IsDead){
				//成功時
				SetDeadEffect_StateDead(MultiCount,IndexCount,SEFlag,MotionFlag,cAction)
			} else if((StateValue != 0 && StateFlag == false && IsReflect_(MultiCount,IndexCount) == false)){
				//ミス時
				local MultiStageCount = 0;
				if(StateValue > 0 && gStateData[y].Up_MissPop == true){
					SetMissPop(Target, MultiStageCount);
				} else if(StateValue < 0 && gStateData[y].Down_MissPop == true){
					SetMissPop(Target, MultiStageCount);
				}
			} else if((StateValue != 0 && StateFlag == false && IsReflect_(MultiCount,IndexCount) == true)){
				//反射時
				local MultiStageCount = 0;
				SetStateEffect_RefrectEffect(IndexCount,SEFlag,MotionFlag,MultiCount,MultiStageCount,cAction)
			}
			break;
		case STATUS.NOTICE_DEATH:
			local StateEndFlag		= GetStatusEndFlag_(y,MultiCount,IndexCount);
			//死亡予告は解除時に死亡
			if(StateEndFlag == true){
				//成功時
				SetDeadEffect_StateDead(MultiCount,IndexCount,SEFlag,MotionFlag,cAction)
			} else if((StateValue != 0 && StateFlag == false && IsReflect_(MultiCount,IndexCount) == false)){
				//ミス時
				local MultiCount = 0;
				if(StateValue > 0 && gStateData[y].Up_MissPop == true){
					SetMissPop(Target, MultiStageCount);
				} else if(StateValue < 0 && gStateData[y].Down_MissPop == true){
					SetMissPop(Target, MultiStageCount);
				}
			} else if((StateValue != 0 && StateFlag == false && IsReflect_(MultiCount,IndexCount) == true)){
				//反射時
				local MultiStageCount = 0;
				SetStateEffect_RefrectEffect(IndexCount,SEFlag,MotionFlag,MultiCount,MultiStageCount,cAction)
			}
			break;
		default:
			break;
		}
	}
	
	return WaitFrame;
}

//モンスター死亡時用ステータス変化（単体物理）
function SetAttackStateEffect_DeadMonsterEffect(MultiCount,IndexCount,SEFlag,MotionFlag)
{
	//DebugPrint_FuncName_IN("SetAttackStateEffect_DeadMonsterEffect");
	//local ArgList =	["MultiCount"	,	MultiCount
	//				,"IndexCount"	,	IndexCount
	//				,"SEFlag"		,	SEFlag
	//				,"MotionFlag"	,	MotionFlag
	//				]
	//DebugPrint_functionParam("SetAttackStateEffect_DeadMonsterEffect" , ArgList)
	
	local Target = GetTargetIndex_(MultiCount,IndexCount)
	local WaitFrame = 0;
	
	for(local y = STATUS_TOP ; y < STATUS_NUM ; y += 1){
		local StateValue		= GetStatusValue_(y,MultiCount,IndexCount);
		//デバッグ用
		if(StateValue != 0){
			local StateFlag			= GetStatusFlag_(y,MultiCount,IndexCount);
			local StateEndFlag		= GetStatusEndFlag_(y,MultiCount,IndexCount);
			local NowStateValue		= GetMonsterStatusValue_(y,Target)
			//local ListStart =		"-------- [DeadStateChange] --------";
			//local ListFront =		null;
			//local List =			["StateName"			, gStateData[y].Up_Motion
			//						,"StateFlag"			, StateFlag
			//						,"StateEndFlag"			, StateEndFlag
			//						,"StateValue"			, StateValue
			//						,"NowStateValue"		, NowStateValue
			//						,"gStateData[y].Name"	, gStateData[y].Name
			//						,"gStateData[y].Up_Effect"	, gStateData[y].Up_Effect
			//						,"gStateData[y].Up_Motion"	, gStateData[y].Up_Motion
			//						,"gStateData[y].Up_Wait"	, gStateData[y].Up_Wait
			//						,"gStateData[y].Up_MissPop"	, gStateData[y].Up_MissPop
			//						,"gStateData[y].Down_Effect"	, gStateData[y].Down_Effect
			//						,"gStateData[y].Down_Motion"	, gStateData[y].Down_Motion
			//						,"gStateData[y].Down_Wait"	, gStateData[y].Down_Wait
			//						,"gStateData[y].Down_MissPop"	, gStateData[y].Down_MissPop
			//						,"gStateData[y].Reset_Wait"	, gStateData[y].Reset_Wait
			//						]
			//local ListEnd =			"LINE";
			//DebugPrint_OneList(List , ListStart , ListEnd , ListFront)
		}
		
		
		switch(y)
		{
		case STATUS.DEATH:
		case STATUS.ERASE:
			local StateFlag			= GetStatusFlag_(y,MultiCount,IndexCount);
						
			//死亡・蘇生不可
			if(StateValue != 0){
				//ステータス判定前のWait設定
				if(StateFlag == true){
					Wait_(30);

					//共通（１体目のみ）
					if(IndexCount == 0){
						//上昇時メッセージ
						if(StateValue > 0 && IsStatusUpMessageVisible(y) == true){
							AddBattleOtherMessage_(GetStatusUpMessageId(y))
						}
						//減少時メッセージ
						if(StateValue < 0 && IsStatusDownMessageVisible(y) == true){
							AddBattleOtherMessage_(GetStatusDownMessageId(y))
						}
					}
					
					//共通（毎回）
					if(StateValue > 0){
						//上昇時
						if(gStateData[y].Up_Wait){
							WaitFrame = gStateData[y].Up_Wait
						}
					} else if(StateValue < 0){
						//減少時
						if(gStateData[y].Down_Wait){
							WaitFrame = gStateData[y].Down_Wait
						}
					}
					
					if(y == STATUS.DEATH) {
						AddBattleOtherMessage_(GetStatusUpMessageId(STATUS.DEATH))
					}
				}

				//個別処理
				if(IsReflect_(MultiCount,IndexCount)){
					//反射時
					local MultiStageCount = 0;
					SetStateEffect_RefrectEffect(IndexCount,SEFlag,MotionFlag,MultiCount,MultiStageCount,cAction)
				} else {
					//成功時
					SetDeadEffect_StateDead(MultiCount,IndexCount,SEFlag,MotionFlag,cAction)
				}
			}
			break;
		case STATUS.NOTICE_DEATH:
			local StateEndFlag		= GetStatusEndFlag_(y,MultiCount,IndexCount);
			//死亡予告は解除時に死亡
			if(StateEndFlag == true){
				//成功時
				SetDeadEffect_StateDead(MultiCount,IndexCount,SEFlag,MotionFlag,cAction)
			} else if((StateValue != 0 && StateFlag == false && IsReflect_(MultiCount,IndexCount) == false)){
				//ミス時
				local MultiCount = 0;
				if(StateValue > 0 && gStateData[y].Up_MissPop == true){
					SetMissPop(Target, MultiStageCount)
				} else if(StateValue < 0 && gStateData[y].Down_MissPop == true){
					SetMissPop(Target, MultiStageCount)
				}
			} else if((StateValue != 0 && StateFlag == false && IsReflect_(MultiCount,IndexCount) == true)){
				//反射時
				local MultiStageCount = 0;
				SetStateEffect_RefrectEffect(IndexCount,SEFlag,MotionFlag,MultiCount,MultiStageCount,cAction)
			}
			break;
		default:
			break;
		}
	}
	
	return WaitFrame;
}


//ステータス変化（連続特性）関数
//	IndexCount		:何体目の対象モンスターか？
//	MultiCount		:何回目の行動か？
//	cAction			:cActionクラス
function SetStateEffect_ContinuationEffect(IndexCount,MultiCount,cAction)
{
	//DebugPrint_FuncName_IN("SetStateEffect_ContinuationEffect");
	//DebugPrint("	=>	IndexCount		:" + IndexCount)
	//DebugPrint("	=>	MultiCount		:" + MultiCount)
	
	//リターン用の値（WaitFrame数）
	local WaitFrame = 0;
	
	local Target			= GetTargetIndex_(MultiCount,IndexCount);
	local cTarget			= cMonsterInfo(Target)
	local AllyFlag			= IsAlly_(Target);
	local Actor				= GetActorIndex_(MultiCount)
	
	//どのステータス変化があったか判定
	if(IsDead_(MultiCount,IndexCount) == false){
		for(local y = STATUS_TOP ; y < STATUS_NUM ; y += 1){	//StateListの１つ目の値はダメージなので無視する
			local StateFlag			= GetStatusFlag_(y,MultiCount,IndexCount);
			local StateEndFlag		= GetStatusEndFlag_(y,MultiCount,IndexCount);
			local StateValue		= GetStatusValue_(y,MultiCount,IndexCount);
			local NowStateValue		= GetMonsterStatusValue_(y,Target);
			local StateEndFlag		= GetStatusEndFlag_(y,MultiCount,IndexCount);
			//メッセージ表示は状態成否に関係なく表示
			if(StateValue != 0 && StateEndFlag == false){
				if(StateValue > 0 && IsStatusUpMessageVisible(y) == true){
					//ステータス上昇時メッセージ
					if(MultiCount == GetActionNum_() - 1){
						AddBattleOtherMessage_(GetStatusUpMessageId(y))
					}
				} else if(StateValue < 0 && IsStatusDownMessageVisible(y) == true){
					//ステータス下降時メッセージ
					if(MultiCount == GetActionNum_() - 1){
						AddBattleOtherMessage_(GetStatusDownMessageId(y))
					}
				}
			} else if(StateEndFlag == true){
				if(IsStatusResetMessageVisible(y) == true){
					//ステータス解除メッセージ
					if(MultiCount == GetActionNum_() - 1){
						AddBattleOtherMessage_(GetStatusResetMessageId(y))
					}
				}
			}
			//ステータス変化があった場合
			if(StateFlag == true && StateValue != 0 && StateEndFlag == false){
				//上昇ステータス時
				if(StateValue > 0){
					if(gStateData[y].Up_Effect != null){
						MonsterSizeEffect(Target,gStateData[y].Up_Effect);
					}
					if(gStateData[y].Up_Motion != null){
						SetMotion_(Target, gStateData[y].Up_Motion, 4);
						Task_ChangeMotion_(Target , MOT_WAIT , 4);
					}
					if(y == STATUS.TENSION){
						SetStateEffect_TensionPop(MultiCount , IndexCount , true)
					}
					WaitFrame = gStateData[y].Up_Wait;
				//減少ステータス時
				} else if(StateValue < 0){
					if(gStateData[y].Down_Effect != null){
						MonsterSizeEffect(Target,gStateData[y].Down_Effect);
					}
					if(gStateData[y].Down_Motion != null){
						SetMotion_(Target, gStateData[y].Down_Motion, 4);
						Task_ChangeMotion_(Target , MOT_WAIT , 4);
					}
					if(y == STATUS.TENSION){
						SetStateEffect_TensionPop(MultiCount , IndexCount , false)
					}
					WaitFrame = gStateData[y].Down_Wait;
				}
			//ステータス変化でミスだった場合
			} else if(StateFlag == false && StateValue != 0){
				//上昇ステータス時
				if(StateValue > 0){
					if(gStateData[y].Up_MissPop == true){
						SetPop_(Target , POPSTYLE.NONE , 0 , true,cTarget.PopDate_X[0],cTarget.PopDate_Y[0],1.0)
						ReplaySE_("SE_BTL_022");
					}
					WaitFrame = gStateData[y].Up_Wait;
				//減少ステータス時
				} else if(StateValue < 0){
					if(gStateData[y].Down_MissPop == true){
						SetPop_(Target , POPSTYLE.NONE , 0 , true,cTarget.PopDate_X[0],cTarget.PopDate_Y[0],1.0)
						ReplaySE_("SE_BTL_022");
					}
					WaitFrame = gStateData[y].Down_Wait;
				}
			}
			//ステルスアタックが解除されたら、強制的に表示
			local IsDead = IsDead_(MultiCount,IndexCount);
			if(y == STATUS.STEALTHATTACK && StateEndFlag == true && IsDead == false){
				Task_ObjectFadeIn_(Target, 30);
			}
		}
	}
	
	//「チェンジ」の例外処理
	SetStateEffect_Spell_Change(MultiCount,IndexCount)
	
	//UI反映{
	SetStatusChange_(MultiCount, IndexCount);
	
	//DebugPrint_FuncName_OUT("SetStateEffect_ContinuationEffect");
	//DebugPrint("	<=	WaitFrame	:" + WaitFrame);
	return WaitFrame;
}

//今回の行動で、ステータス異常があったかの判定（あったらtrueで返す）
//	MultiCount	: 何回目の行動か？
function SetStateEffect_StateChangeCheck(MultiCount)
{
	//DebugPrint_FuncName_IN("SetStateEffect_StateChangeCheck");
	//DebugPrint("	=>	MultiCount		:" + MultiCount)	
	
	local StateChangeFlag = false;
	
	for(local IndexCount = 0 ; IndexCount < GetTargetNum_(MultiCount) ; IndexCount++){
		for(local State = STATUS_TOP ; State < STATUS_NUM ; State++){
			local StateFlag			= GetStatusFlag_(State,MultiCount,IndexCount);
			local StateValue		= GetStatusValue_(State,MultiCount,IndexCount);
			if(StateFlag == true && StateValue != 0){
				StateChangeFlag = true;
			}
		}
	}
	
	//DebugPrint_FuncName_OUT("SetStateEffect_StateChangeCheck");
	//DebugPrint("	<=	StateChangeFlag		:" + StateChangeFlag)
	return StateChangeFlag;
}

//テンション用ポップ表示
//	Target		: ポップを表示するモンスターインデックス
//	PopCount	: 何個目のポップに表示するか
//	UpFlag		: 上昇値か？（trueで上昇、falseで下降）
function SetStateEffect_TensionPop(MultiCount , IndexCount , UpFlag)
{
	//DebugPrint_FuncName_IN("SetStateEffect_TensionPop");
	//DebugPrint("	=>	MultiCount		:" + MultiCount)
	//DebugPrint("	=>	IndexCount		:" + IndexCount)
	//DebugPrint("	=>	UpFlag			:" + UpFlag)
	
	local Target		= GetTargetIndex_(MultiCount,IndexCount)
	local cTarget		= cMonsterInfo(Target)
	local TensionValue	= 0;
	local PopCount		= 0;
	local PopValue		= 0;
	local PopKind		= true;
	local cTargetParty	= cFullPartyInfo(Target)
	
	//今回の行動のポップの表示位置を計算
	local PartyPopCount		= array(cTargetParty.PartyNum);
	local TargetNum			= GetTargetNum_(MultiCount)
	for(local i = 0; i < IndexCount + 1 ; i++){
		local Tgt	= GetTargetIndex_(MultiCount,i);
		for(local l = 0 ; l < cTargetParty.PartyNum ; l++){
			if(cTargetParty.Index[l] == Tgt){
				if(PartyPopCount[l] == null){
					PartyPopCount[l] = -1;
				}
				PartyPopCount[l] = PartyPopCount[l] + 1;
			}
		}
	}
	
	//今回のポップの対象を検索
	Target = GetTargetIndex_(MultiCount,IndexCount);
	for(local i = 0 ; i < cTargetParty.PartyNum ; i++){
		if(cTargetParty.Index[i] == Target){
			PopCount = PartyPopCount[i]
		}
	}
	
	//今回のポップの値を計算
	local PartyPopValue		= array(cTargetParty.PartyNum);
	for(local i = 0 ; i < IndexCount + 1 ; i++){
		for(local l = 0 ; l < cTargetParty.PartyNum ; l++){
			local Tgt = GetTargetIndex_(MultiCount,i)
			if(cTargetParty.Index[l] == Tgt){
				local StateValue		= GetStatusValue_(STATUS.TENSION , MultiCount , i);
				if(StateValue > 0){
					PopKind = POPSTYLE.TENSION_UP;
				} else if(StateValue < 0){
					PopKind = POPSTYLE.TENSION_DOWN;
				}
				if(PartyPopValue[l] == null){
					PartyPopValue[l] = 0;
				}
				PartyPopValue[l] = PartyPopValue[l] + StateValue;
			}
		}
	}
	for(local i = 0 ; i < cTargetParty.PartyNum ; i++){
		if(cTargetParty.Index[i] == Target){
			local NowStateValue		= GetMonsterStatusValue_(STATUS.TENSION , Target);
			PopValue	= NowStateValue + PartyPopValue[i]
		}
	}
	
	if(PopValue > 4	){PopValue = 4;}
	if(PopValue < -4){PopValue = -4;}
	
	//ポップ表示
	if(PopCount != 0){PopCount =  PopCount % gPopMaxNum;}
	
	SetPop_(Target , PopKind , PopValue , false,cTarget.PopDate_X[PopCount],cTarget.PopDate_Y[PopCount],1.0)
	
	//DebugPrint_FuncName_OUT("SetStateEffect_TensionPop");
}


//多段系テンションポップ表示位置算出
function SetBAKURETSUStateEffect_TensionPop(MultiCount , IndexCount , UpFlag)
{
	//DebugPrint_FuncName_IN("SetBAKURETSUStateEffect_TensionPop");
	//DebugPrint("	=>	MultiCount		:" + MultiCount)
	//DebugPrint("	=>	IndexCount		:" + IndexCount)
	//DebugPrint("	=>	UpFlag			:" + UpFlag)
	
	local Target		= GetTargetIndex_(MultiCount,IndexCount)
	local cTarget		= cMonsterInfo(Target)
	local TensionValue	= 0;
	local PopCount		= 0;
	local PopValue		= 0
	local PopKind		= true;
	local cTargetParty	= cFullPartyInfo(Target)
	local MissCheck		= false
	
	
	//今回の行動のポップの表示位置を計算
	local PartyPopCount		= array(cTargetParty.PartyNum);
	local TargetNum			= GetTargetNum_(MultiCount)
	for(local i = 0; i < IndexCount + 1 ; i++){
		local Tgt	= GetTargetIndex_(MultiCount,i);
		for(local l = 0 ; l < cTargetParty.PartyNum ; l++){
			if(cTargetParty.Index[l] == Tgt){
				if(PartyPopCount[l] == null){
					PartyPopCount[l] = -1;
				}
				PartyPopCount[l] = PartyPopCount[l] + 1;
			}
		}
	}
	
	//今回のポップの対象を検索
	Target = GetTargetIndex_(MultiCount,IndexCount);
	for(local i = 0 ; i < cTargetParty.PartyNum ; i++){
		if(cTargetParty.Index[i] == Target){
			PopCount = PartyPopCount[i]
		}
	}
	
	//ミスかどうかを判定
	if(GetStatusFlag_(STATUS.TENSION , MultiCount , IndexCount) == true){
		MissCheck = false;
	} else {
		MissCheck = true;
	}
	
	//今回のポップの値を計算
	local StateValue		= GetStatusValue_(STATUS.TENSION , MultiCount , IndexCount);
	local NowStateValue		= GetMonsterStatusValue_(STATUS.TENSION , Target);
	if(MissCheck == false){
		PopValue	= NowStateValue + StateValue;
		if(PopValue > 4	){PopValue = 4;}
		if(PopValue < -4){PopValue = -4;}
	}
	
	//ポップの種類を設定
	if(StateValue > 0){
		PopKind = POPSTYLE.TENSION_UP;
	} else {
		PopKind	= POPSTYLE.TENSION_DOWN;
	}
	
	//ポップ表示
	if(PopCount != 0){PopCount =  PopCount % gPopMaxNum;}
	
	SetPop_(Target , PopKind , PopValue , MissCheck , cTarget.PopDate_X[PopCount],cTarget.PopDate_Y[PopCount],1.0)
	
	//DebugPrint_FuncName_OUT("SetBAKURETSUStateEffect_TensionPop");
}

// ステータス変化用反射演出
function SetStateEffect_RefrectEffect(IndexCount,SEFlag,MotionFlag,MultiCount,MultiStageCount,cAction)
{
	//DebugPrint_FuncName_IN("SetStateEffect_RefrectEffect");
	//DebugPrint("	=>	IndexCount			:	" + IndexCount);
	//DebugPrint("	=>	SEFlag				:	" + SEFlag);
	//DebugPrint("	=>	MotionFlag			:	" + MotionFlag);
	//DebugPrint("	=>	MultiCount			:	" + MultiCount);
	//DebugPrint("	=>	MultiStageCount		:	" + MultiStageCount);
	
	//ターゲットインデックスの生成
	local Target		= GetTargetIndex_(MultiCount,IndexCount)
	
	EffParamSizeEffect(Target,"EF000_13_COUNTER");
	if(SEFlag == true){RePlaySE_("SE_BTL_023");}
	
	//戻り値の設定
	//DebugPrint_FuncName_OUT("SetStateEffect_RefrectEffect");
	//DebugPrint("	<=	:	MotionTask		:" + MotionTask);
	return MotionTask;
}


//チェンジの場合の例外処理
//MultiCount			: 何回目の行動か？
//IndexCount			: 何体目の対象か？
function SetStateEffect_Spell_Change(MultiCount,IndexCount)
{
	//DebugPrint_FuncName_IN("SetStateEffect_Spell_Change");
	//DebugPrint("	=>	MultiCount		:" + MultiCount)
	//DebugPrint("	=>	IndexCount		:" + IndexCount)
	
	SetParamChange_(MultiCount,IndexCount);
	//DebugPrint_FuncName_OUT("SetStateEffect_Spell_Change");
}

//行動演出・例外演出（汎用）
function SetDamageEffect_ExceptionEffect(MultiCount,cAction)
{
	//DebugPrint_FuncName_IN("SetDamageEffect_ExceptionEffect");
	//DebugPrint("	=>	MultiCount		:" + MultiCount)

	local CameraFlag = false
	SetExceptionEffect_HoldOn(MultiCount,null,CameraFlag,cAction);
	//天使の気まぐれ判定
	SetExceptionEffect_Rezaoral(MultiCount,null,CameraFlag,cAction);
	
	//DebugPrint_FuncName_OUT("SetDamageEffect_ExceptionEffect");
}

//行動演出・例外演出（多段用・みがわり用）
function SetDamageEffect_ExceptionEffect_IndexCount(MultiCount,IndexCount,cAction)
{
	//DebugPrint_FuncName_IN("SetDamageEffect_ExceptionEffect_IndexCount");
	//DebugPrint("	=>	MultiCount		:" + MultiCount)
	//DebugPrint("	=>	IndexCount		:" + IndexCount)
	local CameraFlag = false;
	SetExceptionEffect_HoldOn(MultiCount,IndexCount,CameraFlag,cAction);
	//天使の気まぐれ判定
	SetExceptionEffect_Rezaoral(MultiCount,IndexCount,CameraFlag,cAction);
	
	//DebugPrint_FuncName_OUT("SetDamageEffect_ExceptionEffect_IndexCount");
}

//行動演出・例外演出（単体物理用）
function SetDamageMotionEffect_ExceptionEffect(MultiCount,cAction)
{
	//DebugPrint_FuncName_IN("SetDamageMotionEffect_ExceptionEffect");
	//DebugPrint("	=>	MultiCount		:" + MultiCount)
	local CameraFlag = false
	SetExceptionEffect_HoldOn(MultiCount,0,CameraFlag,cAction);
	local CameraFlag = false
	//天使の気まぐれ判定
	SetExceptionEffect_Rezaoral(MultiCount,0,CameraFlag,cAction);
	
	
	//DebugPrint_FuncName_OUT("SetDamageMotionEffect_ExceptionEffect");
}

//行動演出・例外演出（連続物理用）
function SetDamageMotionRushEffect_ExceptionEffect(MultiCount,cAction)
{
	//DebugPrint_FuncName_IN("SetDamageMotionRushEffect_ExceptionEffect");
	//DebugPrint("	=>	MultiCount		:" + MultiCount)
	local CameraFlag = false;
	SetExceptionEffect_HoldOn(MultiCount,0,CameraFlag,cAction);
	//天使の気まぐれ判定
	local CameraFlag = true;
	SetExceptionEffect_Rezaoral(MultiCount,0,CameraFlag,cAction);
	
	
	//DebugPrint_FuncName_OUT("SetDamageMotionRushEffect_ExceptionEffect");
}

//行動演出・例外演出（単体物理用）
function SetDamageMotionEffect_ExceptionEffect(MultiCount,cAction)
{
	//DebugPrint_FuncName_IN("SetDamageMotionEffect_ExceptionEffect");
	//DebugPrint("	=>	MultiCount		:" + MultiCount)
	local CameraFlag = false
	SetExceptionEffect_HoldOn(MultiCount,0,CameraFlag,cAction);
	local CameraFlag = false
	//天使の気まぐれ判定
	SetExceptionEffect_Rezaoral(MultiCount,0,CameraFlag,cAction);
	
	
	//DebugPrint_FuncName_OUT("SetDamageMotionEffect_ExceptionEffect");
}


//例外判定：ふんばり系
//MultiCount				:何回目の行動か？
//IndexCount				:何体目の判定か？
//							 もし、全体から検索して処理する場合は
//							 nullを渡してください。
//cAction					:cActionInfoClass（MultiCountに対応したもの）
function SetExceptionEffect_HoldOn(MultiCount,IndexCount,CameraFlag,cAction)
{
	//DebugPrint_FuncName_IN("SetExceptionEffect_HoldOn");
	//DebugPrint("	=>	MultiCount		:" + MultiCount)
	//DebugPrint("	=>	IndexCount		:" + IndexCount)
	//DebugPrint("	=>	CameraFlag		:" + CameraFlag)
	
	//local ArgList =	["MultiCount"	,	MultiCount
	//				,"IndexCount"	,	IndexCount
	//				,"CameraFlag"	,	CameraFlag
	//				]
	//DebugPrint_functionParam("SetExceptionEffect_HoldOn" , ArgList)
	
	const BTL_EVT_MSG_LIVING_DEAD	= 31;
	const BTL_EVT_MSG_BRAVE_HART	= 51;
	const BTL_EVT_MSG_LAST_STAND	= 50;
	
	local isLivingDead = false;
	local isBraveHart = false;
	local isLastStand = false;
	local TargetNum = GetTargetNum_(MultiCount)
	
	if(IndexCount == null){
		//IndexCountが設定されていない場合は、0から検索する
		for(local i = 0 ; i < TargetNum ; i++){
			if(IsLivingDead_(MultiCount,i) == true){
				isLivingDead = true;
				continue;
			}
			if(IsBraveHart_(MultiCount,i) == true){
				isBraveHart = true;
				continue;
			}
			if(IsLastStand_(MultiCount,i) == true){
				isLastStand = true;
				continue;
			}
		}
	} else {
		//IndexCountが設定されている場合、その値で判定
		isLivingDead = IsLivingDead_(MultiCount,IndexCount)
		isBraveHart = IsBraveHart_(MultiCount,IndexCount)
		isLastStand = IsLastStand_(MultiCount,IndexCount)
	}

	if(isLivingDead){
		SetHoldOnFeatMessage_IsLivingDead()
	}
	if(isBraveHart){
		SetHoldOnFeatMessage_BraveHart()
	}
	if(isLastStand){
		SetHoldOnFeatMessage_LastStand()
	}

	if(isLivingDead || isBraveHart || isLastStand){
		if(CameraFlag == true){
			Wait_(30)
			DeleteAllTask_();
			local Target = GetTargetIndex_(MultiCount,IndexCount)
			if(IsAlly_(Target)){
				SetVisible_(GetAllyMaster_() , false)
			} else {
				SetVisible_(GetEnemyMaster_() , false)
			}
			CharaStand_PartyFull(false , IsAlly_(GetActorIndex_(MultiCount)))
			CharaStand_Target(CameraFlag,MultiCount)
			//SetAlpha_(GetTargetIndex_(MultiCount,IndexCount), 0.0);
		}
		
		//亡者の執念エフェクトの表示
		if(IndexCount != null){
			if(IsLivingDead_(MultiCount,IndexCount) == true){
				MonsterSizeEffect(GetTargetIndex_(MultiCount,IndexCount),LIVING_DEAD_EFFECT_NAME);
			}
		} else {
			for(local i = 0 ; i < TargetNum ; i++){
				if(IsLivingDead_(MultiCount,i) == true){
					MonsterSizeEffect(GetTargetIndex_(MultiCount,i),LIVING_DEAD_EFFECT_NAME)
				}
			}
		}
		
		local WaitFrame = 30;
		
		//個別演出
		if(IndexCount == null){
			//単発用（TargetNum分だけ判定）
			for(local i = 0 ; i < TargetNum ; i++){
				if(IsLivingDead_(MultiCount,i) || IsBraveHart_(MultiCount,i) || IsLastStand_(MultiCount,i)){
					//WaitFrame = SetExceptionEffect_Rezaoral_Effect(MultiCount,i)
				}
			}
		} else {
			if(IsLivingDead_(MultiCount,IndexCount) || IsBraveHart_(MultiCount,IndexCount) || IsLastStand_(MultiCount,IndexCount)){
				//WaitFrame = SetExceptionEffect_Rezaoral_Effect(MultiCount,IndexCount)
			}
		}
		
		//連続演出時はWaitをスキップする
		if(GetActionNum_() > 1){return;}
		
		//演出終了待ち
		if(WaitFrame != 0){Wait_(WaitFrame);}
	}
	//DebugPrint_FuncName_OUT("SetExceptionEffect_HoldOn");
}
	
//例外判定：リザオラル
//MultiCount				:何回目の行動か？
//IndexCount				:何体目の判定か？
//							 もし、全体から検索して処理する場合は
//							 nullを渡してください。
//cAction					:cActionInfoClass（MultiCountに対応したもの）
function SetExceptionEffect_Rezaoral(MultiCount,IndexCount,CameraFlag,cAction)
{
	//DebugPrint_FuncName_IN("SetExceptionEffect_Rezaoral");
	//DebugPrint("	=>	MultiCount		:" + MultiCount)
	//DebugPrint("	=>	IndexCount		:" + IndexCount)
	//DebugPrint("	=>	CameraFlag		:" + CameraFlag)
	
	const BTL_EVT_MSG_REZAORAL	= 29;
	const BTL_EVT_MSG_ANGEL		= 30;
	
	local isRezaoral = false;	
	local isAngel = false;		
	local TargetNum = GetTargetNum_(MultiCount)
	
	if(IndexCount == null){
		//IndexCountが設定されていない場合は、0から検索する
		for(local i = 0 ; i < TargetNum ; i++){
			if(IsRezaoral_(MultiCount,i) == true){
				isRezaoral = true;
				continue;
			}
			if(IsAngel_(MultiCount,i) == true){
				isAngel = true;
				continue;
			}
		}
	} else {
		//IndexCountが設定されている場合、その値で判定
		isRezaoral = IsRezaoral_(MultiCount,IndexCount)
		isAngel = IsAngel_(MultiCount,IndexCount)
	}
	
	if(isRezaoral || isAngel){
		//リザオラル・天使の気まぐれ演出
		if(CameraFlag == true){
			Wait_(60)
			DeleteAllTask_();
			//CharaStand_AllNonCam()
			local Target = GetTargetIndex_(MultiCount,IndexCount)
			if(IsAlly_(Target)){
				SetVisible_(GetAllyMaster_() , false)
			} else {
				SetVisible_(GetEnemyMaster_() , false)
			}
			CharaStand_PartyFull(false , IsAlly_(GetActorIndex_(MultiCount)))
			CharaStand_Target(CameraFlag,MultiCount)
			SetAlpha_(GetTargetIndex_(MultiCount,IndexCount), 0.0);
		}
		
		Wait_(60);//死亡時消滅待ち
		
		//共通メッセージ（仮
		//local Index = IndexCount;
		//if(Index == null){Index = 0;}
		//AddBattleFeatMessage_(IsAlly_(GetTargetIndex_(MultiCount,Index)) , 29);
		if(isRezaoral){
			AddBattleFeatMessage_(BTL_EVT_MSG_REZAORAL)
		}
		if(isAngel){
			AddBattleFeatMessage_(BTL_EVT_MSG_ANGEL)
		}
		
		
		local WaitFrame = 0;
		
		//個別演出
		if(IndexCount == null){
			//単発用（TargetNum分だけ判定）
			for(local i = 0 ; i < TargetNum ; i++){
				if(IsRezaoral_(MultiCount,i) || IsAngel_(MultiCount,i)){
					WaitFrame = SetExceptionEffect_Rezaoral_Effect(MultiCount,i)
				}
			}
		} else {
			if(IsRezaoral_(MultiCount,IndexCount) || IsAngel_(MultiCount,IndexCount)){
				WaitFrame = SetExceptionEffect_Rezaoral_Effect(MultiCount,IndexCount)
			}
		}
		//演出終了待ち
		if(WaitFrame != 0){Wait_(WaitFrame);}
	}
	//DebugPrint_FuncName_OUT("SetExceptionEffect_Rezaoral");
}

//リザオラル演出
//	MultiCount			: 何回目の行動か？
//	IndexCount			: 何体目の対象か？
function SetExceptionEffect_Rezaoral_Effect(MultiCount,IndexCount)
{
	//DebugPrint_FuncName_IN("SetExceptionEffect_Rezaoral_Effect");
	//DebugPrint("	=>	MultiCount		:" + MultiCount)
	//DebugPrint("	=>	IndexCount		:" + IndexCount)
	local Target		= GetTargetIndex_(MultiCount,IndexCount);
	local cTarget		= cMonsterInfo(Target)
	local Value			= GetRevivalValue_(MultiCount,IndexCount);
	local PopValue		= SetAbsoluteValue(Value)
	MonsterSizeEffect(Target, REVIVAL_EFFECT_NAME);
	if(IsRide_(Target)){
		local Master;
		if(IsAlly_(Target)){
			Master = GetAllyMaster_();
		} else {
			Master = GetEnemyMaster_();
		}
		//RideOffMaster_(Master);
		//Task_ObjectFadeOut_(Master)
	}
	Task_ObjectFadeIn_(Target, 30);
	SetPop_(Target, POPSTYLE.HEAL_HP, PopValue , false , cTarget.PopDate_X[0] , cTarget.PopDate_Y[0] , 1.0);
	MonsterRevival_(Target , Value);
	SetMotion_(Target,MOT_WAIT,1);
	//DebugPrint("++++++  AngelFickle_CHECK!  +++++++" + "\n")
	//DebugPrint("      HP_HEAL" + "\n")
	//DebugPrint("        Target		: " + Target + "\n")
	//DebugPrint("        HealValue	: " + Value + "\n")
	//DebugPrint("        PopValue	: " + PopValue + "\n")
	local WaitFrame = 45;	//天使の気まぐれでの待ち時間
	//DebugPrint_FuncName_OUT("SetExceptionEffect_Rezaoral_Effect");
	
	return WaitFrame;
}

//この行動で本当に死んだか判定
//	MultiCount			: 何回目の行動か？
//	MultiStageCount		: 何段目の行動か？
//	IndexCount			: 何体目の対象か？
function ExceptionDeadEscapeCheck(MultiCount,MultiStageCount,IndexCount)
{
	//DebugPrint_FuncName_IN("ExceptionDeadEscapeCheck");
	//DebugPrint("	=>	IndexCount			:	" + IndexCount);
	//DebugPrint("	=>	MultiCount			:	" + MultiCount);
	//DebugPrint("	=>	MultiStageCount		:	" + MultiStageCount);
	local DeadCheck = true;
	
	//DebugPrint_FuncName_OUT("ExceptionDeadEscapeCheck");
	//本当に死んでいる場合はtrueを返す。
	return DeadCheck;
}

//被弾時ガード特性発動メッセージ
//	MultiCount			: 何回目の行動か？
//	IndexCount			: 何体目の対象か？
//	MultiStageCount		: 何段目の行動か？
function SetDamageGuardFeatMessage(MultiCount,IndexCount,MultiStageCount)
{
	//DebugPrint_FuncName_IN("SetDamageGuardFeatMessage");
	//ギャンブルボディ
	if(IsGambleBody_(MultiCount, IndexCount, MultiStageCount) && g_ShowGambleBody == false){
		g_ShowGambleBody = true;
		SetDamageGuardFeatMessage_GambleBody()
	}
	//会心完全ガード
	if(IsActiveCriticalGuard(MultiCount, IndexCount, MultiStageCount) && g_ShowCriticalGuard == false){
		g_ShowCriticalGuard = true;
		SetDamageGuardFeatMessage_IsCriticalGuard()
	}
	//DebugPrint_FuncName_OUT("SetDamageGuardFeatMessage");
}

//ギャンブルボディメッセージ
function SetDamageGuardFeatMessage_GambleBody()
{
	//DebugPrint_FuncName_IN("SetDamageGuardFeatMessage_GambleBody");
	AddBattleFeatMessage_(57)
	//DebugPrint_FuncName_OUT("SetDamageGuardFeatMessage_GambleBody");
}

//会心完全ガードメッセージ
function SetDamageGuardFeatMessage_IsCriticalGuard()
{
	//DebugPrint_FuncName_IN("SetDamageGuardFeatMessage_IsCriticalGuard");
	//会心完全ガード
	AddBattleFeatMessage_(58)
	//DebugPrint_FuncName_OUT("SetDamageGuardFeatMessage_IsCriticalGuard");
}

//亡者の執念メッセージ
function SetHoldOnFeatMessage_IsLivingDead()
{
	//DebugPrint_FuncName_IN("SetHoldOnFeatMessage_IsLivingDead");
	AddBattleFeatMessage_(31)
	//DebugPrint_FuncName_OUT("SetHoldOnFeatMessage_IsLivingDead");
}

//ラストスタンドメッセージ表示
function SetHoldOnFeatMessage_LastStand()
{
	//DebugPrint_FuncName_IN("SetHoldOnFeatMessage_LastStand");
	//ラストスタンド
	AddBattleFeatMessage_(50)
	//DebugPrint_FuncName_OUT("SetHoldOnFeatMessage_LastStand");
}

//くじけぬ心メッセージ表示
function SetHoldOnFeatMessage_BraveHart()
{
	//DebugPrint_FuncName_IN("SetHoldOnFeatMessage_BraveHart");
	//くじけぬ心
	AddBattleFeatMessage_(51)
	//DebugPrint_FuncName_OUT("SetHoldOnFeatMessage_BraveHart");
}

// 一列並び==========================================================================
//キャラ整列配置（キャラデータの取得）
function CharaStand(CharaStand_Select,CameraFlag,MultiCount,cAction)
{
	//CharaStand_Select			Full		: パーティ全員（引数で味方か敵かを指定）
	//											カメラは必ず全体
	//							Action		: 行動者
	//											（アップカメラ）
	//											行動者が単体の場合はアップカメラ
	//											行動者が複数の場合は全体配置
	//											ただし行動者以外は詰める
	//							Target		: 対象者（引数のMultiCount)
	//											対象が単体の場合はアップカメラ
	//											対象が複数の場合は全体配置
	//共通した引数
	//		CameraFlag	:	カメラを設置するか？

	//DebugPrint_FuncName_IN("CharaStand");
	//DebugPrint("	=>	CharaStand_Select		:	" + CharaStand_Select);
	//DebugPrint("	=>	CameraFlag				:	" + CameraFlag);
	//DebugPrint("	=>	MultiCount				:	" + MultiCount);

	//事前処理
	DeleteAllEffect_();
	ChangeIndexPointData_(BATTLE_COMMON_POINT_DATA);
	SetVisibleNeedModel_();
	StopEarthQuake_();
	DeleteAllTask_();			//CharaStandに来た場合、一旦全てのTaskを削除する。
	
	switch(CharaStand_Select)
	{
		case "ActorFull":					//行動者パーティ全体配置の場合
			CharaStand_ActorFull(CameraFlag);
			CharaStand_NonCamera(IsAlly_(GetActorIndex_(MultiCount)))
			break;
		case "TargetFull":					//対象者パーティ全体配置の場合
			CharaStand_TargetFull(CameraFlag);
			CharaStand_NonCamera(IsAlly_(GetTargetIndex_(MultiCount,0)))
			break;
		case "Action":					//行動者配置の場合
			CharaStand_Action(MultiCount,CameraFlag);
			CharaStand_NonCamera(IsAlly_(GetActorIndex_(MultiCount)))
			break;
		case "Target":					//対象者配置の場合
			if(SubstituteCheck(MultiCount)){
				//みがわり専用配置
				CharaStand_Substitute(CameraFlag,MultiCount);
				CharaStand_NonCamera(IsAlly_(GetTargetIndex_(MultiCount,0)))
			} else {
				//通常全体配置
				CharaStand_Target(CameraFlag,MultiCount);
				CharaStand_NonCamera(IsAlly_(GetTargetIndex_(MultiCount,0)))
			}
			break;
		case "Master":					//マスター配置の場合
			CharaStand_Master(CameraFlag,MultiCount);
			break;
		case "AllNonCam":				//全員（カメラなしの配置だけ）
			CharaStand_AllNonCam();
			break;
		default:
			//指定がない場合は何もしない
			break;
	}
	
	//DebugPrint_FuncName_OUT("CharaStand");
}

//キャラ配置＿行動者パーティ全員
function CharaStand_ActorFull(CameraFlag){
	//DebugPrint_FuncName_IN("CharaStand_ActorFull");
	//DebugPrint("	=>	CameraFlag	:	" + CameraFlag);
	
	local Actor = GetActorIndex_(0);
	local AllyFlag = IsAlly_(Actor);
	local Index;
	if(AllyFlag == true){
		Index = GetAllyIndex_(0);
	} else {
		Index = GetEnemyIndex_(0);
	}
	
	local cParty = cFullPartyInfo(Index);
	
	//BattleCommonから座標を読み込む
	ChangeIndexPointData_(BATTLE_COMMON_POINT_DATA);
	
	//全モンスターを表示
	for(local i =0 ; i < cParty.PartyNum ; i += 1){
		SetMonster_Empty(cParty.Index[i], cParty.Empty[i], cParty.Rotate[i]);
	}
	if(CameraFlag == true){
		Task_AnimeMoveCamera_(cParty.CamEmpty_Area , cParty.CamTgtEmpty_Area);
	}
	
	//DebugPrint_FuncName_OUT("CharaStand_ActorFull");
}

//キャラ配置＿対象者パーティ全員
function CharaStand_TargetFull(CameraFlag){
	//DebugPrint_FuncName_IN("CharaStand_TargetFull");
	//DebugPrint("	=>	CameraFlag	:	" + CameraFlag);
	
	local Target = GetTargetIndex_(0);
	local AllyFlag = IsAlly_(Target);
	if(AllyFlag == true){
		Index = GetAllyIndex_(0);
	} else {
		Index = GetEnemyIndex_(0);
	}
	
	local cParty = cFullPartyInfo(Index);
	
	//BattleCommonから座標を読み込む
	ChangeIndexPointData_(BATTLE_COMMON_POINT_DATA);
	
	//全モンスターを表示
	for(local i =0 ; i < cParty.PartyNum ; i += 1){
		SetMonster_Empty(cParty.Index[i], cParty.Empty[i], cParty.Rotate[i]);
	}
	if(CameraFlag == true){
		Task_AnimeMoveCamera_(cParty.CamEmpty_Area , cParty.CamTgtEmpty_Area);
	}
	
	
	
	//DebugPrint_FuncName_OUT("CharaStand_TargetFull");
}

//キャラ配置＿パーティ全員
//AllyFlag	:	敵味方のどちらを表示するか？
function CharaStand_PartyFull(CameraFlag,AllyFlag){
	//DebugPrint_FuncName_IN("CharaStand_PartyFull");
	//DebugPrint("	=>	CameraFlag	:	" + CameraFlag);
	
	local Index;
	
	if(AllyFlag == true){
		Index = GetAllyIndex_(0);
	} else {
		Index = GetEnemyIndex_(0);
	}
	
	local cParty = cFullPartyInfo(Index);
	
	//BattleCommonから座標を読み込む
	ChangeIndexPointData_(BATTLE_COMMON_POINT_DATA);
	
	//全モンスターを表示
	for(local i =0 ; i < cParty.PartyNum ; i += 1){
		SetMonster_Empty(cParty.Index[i], cParty.Empty[i], cParty.Rotate[i]);
	}
	if(CameraFlag == true){
		Task_AnimeMoveCamera_(cParty.CamEmpty_Area , cParty.CamTgtEmpty_Area);
	}
	
	//DebugPrint_FuncName_OUT("CharaStand_PartyFull");
}

//キャラ配置＿行動者（回数指定）
//MultiCount	:何回目の行動か？
//CameraFlag	:カメラを配置するか？
function CharaStand_Action(MultiCount,CameraFlag){
	//DebugPrint_FuncName_IN("CharaStand_Action");
	//DebugPrint("	=>	CameraFlag	:	" + CameraFlag);
	
	//BattleCommonから座標を読み込む
	ChangeIndexPointData_(BATTLE_COMMON_POINT_DATA);
	
	//行動者が単体の場合
	local CamCenterMonster = GetActorIndex_(MultiCount);
	local cParty = cFullPartyInfo(CamCenterMonster)
	for(local i = 0 ; i < cParty.PartyNum ; i += 1 ){
		CharaStand_SingleCameraSetting(	cParty.Index[i],
										cParty.Empty[i],
										cParty.UpCam[i],
										cParty.UpCamTgt[i],
										cParty.Rotate[i],
										CameraFlag,
										CamCenterMonster);
	}
	
	//DebugPrint_FuncName_OUT("CharaStand_Action");
}

//キャラ配置＿マスター表示
function CharaStand_Master(CameraFlag,MultiCount){
	//DebugPrint_FuncName_IN("CharaStand_Master");
	//DebugPrint("	=>	CameraFlag	:	" + CameraFlag);
	//DebugPrint("	=>	AllyFlag	:	" + AllyFlag);
	
	local Actor = GetActorIndex_(MultiCount);
	local AllyFlag = IsAlly_(Actor)
	local Index;
	if(AllyFlag == true){
		Index = GetAllyIndex_(0);
	} else {
		Index = GetEnemyIndex_(0);
	}
	local cParty = cFullPartyInfo(Index);
	
	//BattleCommonから座標を読み込む
	ChangeIndexPointData_(BATTLE_COMMON_POINT_DATA);
	
	//全モンスターを表示
	for(local i =0 ; i < cParty.PartyNum ; i += 1){
		SetMonster_Empty(cParty.Index[i], cParty.Empty[i], cParty.Rotate[i]);
	}
	//マスター用のカメラを配置
	if(CameraFlag == true){
		
		Task_AnimeMoveCamera_(cParty.CamEmpty_Master , cParty.CamTgtEmpty_Master);
	}
	
	//DebugPrint_FuncName_OUT("CharaStand_Master");
}


//キャラ配置＿対象者パーティ配置
function CharaStand_Target(CameraFlag,MultiCount){
	//DebugPrint_FuncName_IN("CharaStand_Target");
	//DebugPrint("	=>	CameraFlag	:	" + CameraFlag);
	//DebugPrint("	=>	MultiCount	:	" + MultiCount);
	
	//BattleCommonから座標を読み込む
	ChangeIndexPointData_(BATTLE_COMMON_POINT_DATA);
	
	//必要となる変数の定義
	local Target = GetTargetIndex_(0,0);
	local TargetNum = GetTargetNum_(MultiCount)
	local cParty = cFullPartyInfo(Target)
	local SingleTargetFlag = IsTargetSingle_(MultiCount);
	
	//対象者が単体の場合
	if(SingleTargetFlag == true){
		local CamCenterMonster = GetTargetIndex_(MultiCount,0);
		for(local i = 0 ; i < cParty.PartyNum ; i += 1 ){
			CharaStand_SingleCameraSetting(	cParty.Index[i],
											cParty.Empty[i],
											cParty.UpCam[i],
											cParty.UpCamTgt[i],
											cParty.Rotate[i],
											CameraFlag,
											CamCenterMonster);
		}
	} else {
	//対象者が複数の場合
		for(local i = 0 ; i < cParty.PartyNum ; i++){
			SetMonster_Empty(cParty.Index[i] , cParty.Empty[i] , cParty.Rotate[i]);

		}
		Task_AnimeMoveCamera_(cParty.CamEmpty_Area,cParty.CamTgtEmpty_Area);
	}
	
	
	//DebugPrint_FuncName_OUT("CharaStand_Target");
}

//キャラ配置＿みがわり配置
function CharaStand_Substitute(CameraFlag,MultiCount){
	//DebugPrint_FuncName_IN("CharaStand_Substitute");
	//DebugPrint("	=>	CameraFlag	:	" + CameraFlag);
	//DebugPrint("	=>	MultiCount	:	" + MultiCount);
	
	//BattleCommonから座標を読み込む
	ChangeIndexPointData_(BATTLE_COMMON_POINT_DATA);
	
	//必要となる変数の定義
	local Target = GetTargetIndex_(0,0);
	local TargetNum = GetTargetNum_(MultiCount);
	local cParty = cFullPartyInfo(Target);
	local SingleTargetFlag = IsTargetSingle_(MultiCount);
	
	//対象者が単体の場合
	if(SingleTargetFlag == true){
		local CamCenterMonster = GetTargetIndex_(MultiCount,0);
		for(local i = 0 ; i < cParty.PartyNum ; i += 1 ){
			if(cParty.Index[i] == Target){
				CharaStand_SingleCameraSetting(	cParty.Index[i],
												cParty.Empty[i],
												cParty.UpCam[i],
												cParty.UpCamTgt[i],
												cParty.Rotate[i],
												CameraFlag,
												CamCenterMonster);
			} else {
				//みがわり対象外配置
				CharaStand_SingleCameraSetting(	cParty.Index[i],
												cParty.Empty_Substitute[i],
												cParty.UpCam[i],
												cParty.UpCamTgt[i],
												cParty.Rotate[i],
												CameraFlag,
												CamCenterMonster);
			}
		}
	} else {
	//対象者が複数の場合
		for(local i = 0 ; i < cParty.PartyNum ; i++){
			if(cParty.Index[i] == Target){
				SetMonster_Empty(cParty.Index[i] , cParty.Empty[i] , cParty.Rotate[i]);
			} else {
				//みがわり対象外配置
				SetMonster_Empty(cParty.Index[i] , cParty.Empty_Substitute[i] , cParty.Rotate[i]);
			}
		}	
		Task_AnimeMoveCamera_(cParty.CamEmpty_Area,cParty.CamTgtEmpty_Area);
	}
	
	//DebugPrint_FuncName_OUT("CharaStand_Substitute");
}

//キャラ配置＿スカウト対象配置
function CharaStand_ScoutTarget()
{
	//DebugPrint_FuncName_IN("CharaStand_ScoutTarget");
	
	//BattleCommonから座標を読み込む
	ChangeIndexPointData_(BATTLE_COMMON_POINT_DATA);
	
	//必要となる変数の定義
	local Target = GetTargetIndex_(0,0);
	local cParty = cFullPartyInfo(Target)
	local CamCenterMonster = GetTargetIndex_(0,0);
	
	//スカウト対象をアップで表示
	for(local i = 0 ; i < cParty.PartyNum ; i += 1 ){
		CharaStand_SingleCameraSetting(	cParty.Index[i],
										cParty.Empty[i],
										cParty.UpCam[i],
										cParty.UpCamTgt[i],
										cParty.Rotate[i],
										true,
										CamCenterMonster);
		if(cParty.Index[i] != Target){
			SetVisible_(cParty.Index[i] , false);
		}
	}
	
	//DebugPrint_FuncName_OUT("CharaStand_Target");
}

//キャラ配置＿全員配置
function CharaStand_AllNonCam()
{
	//DebugPrint_FuncName_IN("CharaStand_AllNonCam");
	//BattleCommonから座標を読み込む
	ChangeIndexPointData_(BATTLE_COMMON_POINT_DATA);
	
	local CameraFlag	= false
	
	//両パーティを配置する
	CharaStand_PartyFull(false , true)
	CharaStand_PartyFull(false , false)
	//DebugPrint_FuncName_OUT("CharaStand_AllNonCam");
}

//キャラ配置＿パーティ全員配置＋カメラ単体対象
//AllyFlag				:	敵味方のどちらを表示するか？
//CamCenterMonster		:	カメラの中心とするモンスター
function CharaStand_PartyFull_CamCenter(AllyFlag,CamCenterMonster){
	//DebugPrint_FuncName_IN("CharaStand_PartyFull_CamCenter");
	//DebugPrint("	=>	AllyFlag			:	" + AllyFlag);
	//DebugPrint("	=>	CamCenterMonster	:	" + CamCenterMonster);
	
	local cParty = cFullPartyInfo(CamCenterMonster);
	
	//スカウト対象をアップで表示
	for(local i = 0 ; i < cParty.PartyNum ; i += 1 ){
		CharaStand_SingleCameraSetting(	cParty.Index[i],
										cParty.Empty[i],
										cParty.UpCam[i],
										cParty.UpCamTgt[i],
										cParty.Rotate[i],
										true,
										CamCenterMonster);
	}
	
	//DebugPrint_FuncName_OUT("CharaStand_PartyFull_CamCenter");
}

//キャラ配置＿PartyInfo
//cParty			: cPartyInfo形式
//SingleFlag		: 単体表示を行うか？
//CamCenterMonster	: 単体表示時の中心モンスター（全体の場合はnull)
function CharaStand_PartyInfo(cParty , SingleFlag , CamCenterMonster)
{
	//DebugPrint_FuncName_IN("CharaStand_PartyInfo");
	//DebugPrint("	=>	SingleFlag				:	" + SingleFlag);
	//DebugPrint("	=>	CamCenterMonster		:	" + CamCenterMonster);
	
	//BattleCommonから座標を読み込む
	ChangeIndexPointData_(BATTLE_COMMON_POINT_DATA);
	
	if(SingleFlag == true){
		//単体表示の際はこちら
		for(local i = 0 ; i < cParty.PartyNum ; i += 1 ){
			CharaStand_SingleCameraSetting(	cParty.Index[i],
											cParty.Empty[i],
											cParty.UpCam[i],
											cParty.UpCamTgt[i],
											cParty.Rotate[i],
											true,
											CamCenterMonster);
		}
	} else {
		//全体表示の際はこちら
		for(local i = 0 ; i < cParty.PartyNum ; i++){
			SetMonster_Empty(cParty.Index[i] , cParty.Empty[i] , cParty.Rotate[i]);
		}
		Task_AnimeMoveCamera_(cParty.CamEmpty_Area , cParty.CamTgtEmpty_Area);
	}
	
	//DebugPrint_FuncName_OUT("CharaStand_PartyInfo");
}

//単体配置用キャラ・カメラ配置
//Monster			：モンスターインデックス
//MonsterEmpty		：モンスターの配置Empty
//CameraEmpty		：CameraEmpty
//CameraTargetEmpty	：CameraTargetEmpty
//Rotate			：モンスターの向き情報
//CameraFlag		：カメラを配置するか？
//CamTargetMonster	：カメラの中心とするモンスターインデックス
function CharaStand_SingleCameraSetting(Monster,MonsterEmpty,CameraEmpty,CameraTargetEmpty,Rotate,CameraFlag,CamCenterMonster)
{
	
	//DebugPrint_FuncName_IN("CharaStand_Single_CharaSet");
	//DebugPrint("	=>	Monster				:	" + Monster);
	//DebugPrint("	=>	CamCenterMonster	:	" + CamCenterMonster);
	//DebugPrint("	=>	MonsterEmpty		:	" + MonsterEmpty);
	//DebugPrint("	=>	CameraEmpty			:	" + CameraEmpty);
	//DebugPrint("	=>	CameraTargetEmpty	:	" + CameraTargetEmpty);
	//DebugPrint("	=>	Rotate				:	" + Rotate);
	//DebugPrint("	=>	CameraFlag			:	" + CameraFlag);
	
	if(Monster == INVALID_CHARACTER){return;}
	
	//必要となるクラスの読込
	local cMonster = cMonsterInfo(Monster)
	
	//BattleCommonから座標を読み込む
	ChangeIndexPointData_(BATTLE_COMMON_POINT_DATA);
	
	if(cMonster.Type != LIVETYPE.NONE){
		SetMonster_Empty(Monster,MonsterEmpty,Rotate);
		local Action = GetActorIndex_(0)
		if(Monster == CamCenterMonster){
			if(CameraFlag == true){
				Task_AnimeMoveCamera_(CameraEmpty,CameraTargetEmpty);
			}
		}
	}
	
	//Gsizeが対象の場合は、SSizeを非表示に切り替える
	if(GetMonsterSize_(CamCenterMonster) == SIZE_G){
		if(CamCenterMonster == GetAllyIndex_(0)){
			SetVisible_(GetAllyIndex_(1),false);
		} else if(CamCenterMonster == GetAllyIndex_(1)){
			SetVisible_(GetAllyIndex_(0),false);
		} else if(CamCenterMonster == GetEnemyIndex_(0)){
			SetVisible_(GetEnemyIndex_(1),false);
		} else if(CamCenterMonster == GetEnemyIndex_(1)){
			SetVisible_(GetEnemyIndex_(0),false);
		}
	}
	
	//DebugPrint_FuncName_OUT("CharaStand_Single_CharaSet");
}

//映っていない側のモンスターを整列し、非表示化。
//AllyFlag		: ”映すほうの”AllyFlag
function CharaStand_NonCamera(AllyFlag)
{
	local Index
	if(AllyFlag){
		Index = GetEnemyIndex_(0)
	} else {
		Index = GetAllyIndex_(0)
	}
	local cParty = cFullPartyInfo(Index)
	//BattleCommonから座標を読み込む
	ChangeIndexPointData_(BATTLE_COMMON_POINT_DATA);
	//全体表示の際はこちら
	for(local i = 0 ; i < cParty.PartyNum ; i++){
		SetMonster_Empty(cParty.Index[i] , cParty.Empty[i] , cParty.Rotate[i]);
		SetVisible_(cParty.Index[i], false);
	}
	
	//マスターを配置
	CharaStand_Master(AllyFlag)
}

//マスターをデフォルト位置に配置
//AllyFlag	: 敵側か、味方側か
function CharaStand_Master(AllyFlag)
{
	local cParty = cAllyFlagPartyInfo(AllyFlag)
	
	//マスターがライド状態の場合は元の処理に戻る
	if(cParty.IsPartyRide == true){return;}
	
	//cPartyの情報よりマスターを配置
	SetMaster_Empty(cParty.MasterIndex,cParty.Empty_Master,cParty.Rotate_Master)
	
}

//キャラ配置座標取得・カメラ視点座標
//AllyFlag					:敵味方判定（味方がtrue）
function GetVec3_Camera(AllyFlag){
	//DebugPrint_FuncName_IN("GetVec3_Camera");
	//DebugPrint("	=>	AllyFlag	:	" + AllyFlag);
	
	local Vec3;
	local Index;
	
	if(AllyFlag == true){
		Index = GetAllyIndex_(0);
	} else {
		Index = GetEnemyIndex_(0);
	}
	
	local cParty = cFullPartyInfo(Index);
	
	//BattleCommonから座標を読み込む
	ChangeIndexPointData_(BATTLE_COMMON_POINT_DATA);
	
	Vec3 = GetFbxPos_(cParty.CamEmpty_Area);
	
	//DebugPrint_FuncName_OUT("GetVec3_Camera");
	
	return Vec3;
}

//キャラ配置座標取得・カメラ注視点座標
//AllyFlag					:敵味方判定（味方がtrue）
function GetVec3_CameraTarget(AllyFlag){
	//DebugPrint_FuncName_IN("GetVec3_CameraTarget");
	//DebugPrint("	=>	AllyFlag	:	" + AllyFlag);
	
	local Vec3;
	local Index;
	
	if(AllyFlag == true){
		Index = GetAllyIndex_(0);
	} else {
		Index = GetEnemyIndex_(0);
	}
	
	local cParty = cFullPartyInfo(Index);
	
	//BattleCommonから座標を読み込む
	ChangeIndexPointData_(BATTLE_COMMON_POINT_DATA);
	
	Vec3 = GetFbxPos_(cParty.CamTgtEmpty_Area);
	
	//DebugPrint_FuncName_OUT("GetVec3_CameraTarget");
	
	return Vec3;
}

//キャラ配置座標取得・キャラ配置座標
//MonsNum						:モンスター番号（0～7、味方側が0～3、敵側が4～7）
function GetVec3_Monster(MonsNum){
	//DebugPrint_FuncName_IN("GetVec3_Monster");
	//DebugPrint("	=>	MonsNum	:	" + MonsNum);
	
	local Vec3;
	local Index;
	
	if(Index < 4){
		Index = GetAllyIndex_(MonsNum);
	} else {
		MonsNum = MonsNum - 4	//敵側数値補正
		Index = GetEnemyIndex_(MonsNum);
	}

	local cParty = cFullPartyInfo(Index);
	
	//BattleCommonから座標を読み込む
	ChangeIndexPointData_(BATTLE_COMMON_POINT_DATA);
	
	local InitCheck = GetInitExistType_(Index);
	if(InitCheck == LIVETYPE.NONE){
		Vec3 = Vec3(0,0,0)
	} else {
		Vec3 = GetFbxPointPos_(cParty.Empty[MonsNum]);
	}
	
	//DebugPrint_FuncName_OUT("GetVec3_Monster");
	
	return Vec3;
}

//Empty座標取得・全体エフェクト配置座標
//AllyFlag						:敵味方判定
function GetVec3_EffectEmpty(AllyFlag)
{
	//DebugPrint_FuncName_IN("GetVec3_EffectEmpty");
	//DebugPrint("	=>	AllyFlag	:	" + AllyFlag);
	
	local Vec3;
	local Index;
	
	if(AllyFlag == true){
		Index = GetAllyIndex_(0);
	} else {
		Index = GetEnemyIndex_(0);
	}
	
	local cParty = cFullPartyInfo(Index);
	
	//BattleCommonから座標を読み込む
	ChangeIndexPointData_(BATTLE_COMMON_POINT_DATA);
	
	Vec3 = GetFbxPointPos_(cParty.EffectEmpty_Area);
	
	//DebugPrint_FuncName_OUT("GetVec3_EffectEmpty");
	
	return Vec3;
}



//効果演出=====================================================================
//CharaStandFlag（ToF）		:	キャラ配列を行うか？
//								単体配置
//MultiCount（整数）		:	何回目の動作か？
//MultiStageCount（整数）	:	何段目の動作か？
//WaitFlag	(ToF)			:	エフェクト表示後にWaitを入れるか？
function LineEffect_Init(CharaStandFlag,MultiCount,MultiStageCount,WaitFlag,cAction)
{
	//DebugPrint_FuncName_IN("LineEffect_Init");
	//local ArgList =		["MultiCount"	,	MultiCount
	//					,"MultiStageCount"	,	MultiStageCount
	//					,"CharaStandFlag"	,	CharaStandFlag
	//					,"WaitFlag"	,	WaitFlag
	//					]
	//DebugPrint_functionParam("LineEffect_Init" , ArgList)
	
	if(IsScout_()){
		//スカウト対象の場合は別関数を呼び出す。
		LineEffect_ScoutAttack(MultiCount)
	} else {
		local TargetType = GetTargetType_(MultiCount);
		if(TargetType == TARGET.ALL){
			LineEffect_AllDamage(CharaStandFlag,MultiCount,MultiStageCount,WaitFlag,cAction)
		} else {
			LineEffect_NormalDamage(CharaStandFlag,MultiCount,MultiStageCount,WaitFlag,cAction)
		}
	}
	
	SetApealPoint_Init(true);
	
	//DebugPrint_FuncName_OUT("LineEffect_Init");
}


//効果演出：通常処理
function LineEffect_NormalDamage(CharaStandFlag,MultiCount,MultiStageCount,WaitFlag,cAction)
{
	//DebugPrint_FuncName_IN("LineEffect_NormalDamage");
	//CharaStandFlag（ToF）	:	キャラ配列を行うか？
	//							単体配置
	//MultiCount（整数）	:	何回目の動作か？
	//WaitFlag	(ToF)		:	エフェクト表示後にWaitを入れるか？
	//DebugPrint("	=>	CharaStandFlag		:	" + CharaStandFlag);
	//DebugPrint("	=>	MultiCount 			:	" + MultiCount);
	//DebugPrint("	=>	MultiStageCount		:	" + MultiStageCount);
	//DebugPrint("BattleCommon_LoadParamIn_function_" + "LineEffect_NormalDamage");
	
	//ターゲットタイプを取得
	local TargetType		= GetTargetType_(MultiCount)
	
	//キャラクターを整列させるか？
	if(CharaStandFlag == true && IsScout_() != true){
		local CharaStand_Select = "Target";
		local CameraFlag = true;
		if(TargetType == TARGET.FIELD){
			//フィールド効果の場合は、CharaStandを変更する。
			local AllyCheck;
			if(IsAlly_(GetActorIndex_(MultiCount))){
				AllyCheck = false;
			} else {
				AllyCheck = true;
			}
			DeleteAllEffect_()
			DeleteAllTask_();
			CharaStand_PartyFull(CameraFlag,AllyCheck)
			CharaStand_NonCamera(AllyCheck)
		} else {
			DeleteAllEffect_()
			CharaStand(CharaStand_Select,CameraFlag,MultiCount,cAction);
		}
	}
	
	if(cAction.AllActEffect0_Name != "EF213_23_JUDGMENT" && cAction.AllActEffect0_Name != "EF213_21_ABYSS_HAND"){
		Wait_(1);
	}
	
	
	//例外メッセージ表示判定
	LineEffect_ExpentionMessage(MultiCount)
	
	//例外判定 2nd
	local SingleAttackFlag	= false;
	Exception_2ndCheck(MultiCount,SingleAttackFlag,cAction)
	
	//みがわりチェック
	
	
	//ターゲットタイプによって、ダメージ処理を切り替える。
	switch(TargetType)
	{
	case TARGET.BAKURETSU:			//敵2回目以降ランダム
	case TARGET.ALLY_MULTI_RANDOM:	//味方複数回ランダム
		LineEffect_BAKURETSU(MultiCount,MultiStageCount,cAction,WaitFlag)
		break;
	case TARGET.FIELD:				//フィールド効果
		local EffectFlag = true;
		LineEffect_FIELD(MultiCount,MultiStageCount,cAction,WaitFlag,EffectFlag)
		break;
	default:
		local EffectFlag = true;
		if(SubstituteCheck(MultiCount)){
			//みがわり専用処理
			LineEffect_Substitute(MultiCount,MultiStageCount,cAction,WaitFlag)
		} else {
			//通常ダメージ処理
			LineEffect_SingleStage(MultiCount,MultiStageCount,cAction,WaitFlag,EffectFlag);
		}
		break;
	}
	
	//DebugPrint_FuncName_OUT("LineEffect_NormalDamage");
}

//みがわり判定
//MultiCount		: 何回目の行動か？
function SubstituteCheck(MultiCount)
{
	local SubstituteCheck = false
	local TargetNum = GetTargetNum_(MultiCount)
	for(local IndexCount = 0 ; IndexCount < TargetNum ; IndexCount++){
		if(IsSwapTarget_(MultiCount,IndexCount)){
			SubstituteCheck = true;
		}
	}
	return SubstituteCheck;
}

//LineEffect（単発攻撃用）
function LineEffect_SingleStage(MultiCount,MultiStageCount,cAction,WaitFlag,EffectFlag)
{
	//DebugPrint_FuncName_IN("LineEffect_SingleStage");
	//local ArgList =	["MultiCount"		,	MultiCount
	//					,"MultiStageCount"	,	MultiStageCount
	//					,"WaitFlag"			,	WaitFlag
	//					,"EffectFlag"		,	EffectFlag
	//					]
	//DebugPrint_functionParam("LineEffect_SingleStage" , ArgList)
	
	local TargetNum		= GetTargetNum_(MultiCount)
	local DamageType	= GetDamageType_(MultiCount,0)
	local EffectFrame	= cAction.EffectFrame;
	local DamageWait	= cAction.EffectFrame_DamageDirectionWait;
	local StateWait		= 0;
	local EndWait		= cAction.EffectFrame_EndWait;
	local Efficacy		= GetActionEfficacy_(MultiCount);
	
	//local ListStart =	"----< LineEffect_SingleStage_Info >----"
	//local ListFront =	"・"
	//local List =			["TargetNum"		,	TargetNum
	//						,"Efficacy"			,	DebugPrint_Efficacy(Efficacy)
	//						,"DamageType"		,	DebugPrint_DamageType(DamageType)
	//						,"EffectFrame"		,	EffectFrame
	//						,"DamageWait"		,	DamageWait
	//						,"StateWait"		,	StateWait
	//						,"EndWait"			,	EndWait
	//						]
	//local ListEnd =		"LINE"
	//DebugPrint_OneList(List , ListStart , ListEnd , ListFront)
	
	if(EffectFlag == true){
		//特技エフェクトの表示・特技ＳＥの再生
		LineEffect_EffectBornDirection(MultiCount,MultiStageCount,cAction);
		
		//ダメージ反応までの待ち設定
		if(WaitFlag == true){
			switch(DamageType)
			{
			case AFFECT_PARAM.HP:
			case AFFECT_PARAM.HMP:
				if(cAction.AllActEffect0_Name == "EF213_19_GOD_HAND"){
					StartEarthQuake_(30, 5, 5);
					Wait_(DamageWait);
				} else {
					Wait_(DamageWait);
				}
				break;
			case AFFECT_PARAM.MP:
				Wait_(DamageWait);
				break;
			case AFFECT_PARAM.MAX_HP:
				Wait_(DamageWait);
				break;
			case AFFECT_PARAM.MAX_MP:
				Wait_(DamageWait);
				break;
			case AFFECT_PARAM.AT:
				Wait_(DamageWait);
				break;
			case AFFECT_PARAM.DF:
				Wait_(DamageWait);
				break;
			case AFFECT_PARAM.QC:
				Wait_(DamageWait);
				break;
			case AFFECT_PARAM.WS:
				Wait_(DamageWait);
				break;
			case AFFECT_PARAM.TS:
				Wait_(DamageWait);
				break;
			default:
				//ダメージタイプがない場合はWaitを行わない
				//破滅の日用例外処理
				if(cAction.AllActEffect0_Name == "EF040_14_PROP_HAMETSUNOHI"){
					Wait_(DamageWait)
				}
				//ジバ系発詠唱時例外処理
				if(cAction.AllActEffect0_Name == "EF110_28_JIBA_MAGIC_CIRCLE"){
					Wait_(DamageWait)
				}
				break;
			}
		}
	}
	
	//特技のダメージ反応
	local MaxActHitNum = GetMaxActHitNum(MultiCount)
	
	for(MultiStageCount ; MultiStageCount < MaxActHitNum ; MultiStageCount++){
		for(local IndexCount = 0; IndexCount < TargetNum ; IndexCount++){
			local ActHitNum = GetActHitNum_(MultiCount, IndexCount);
			if(MultiStageCount < ActHitNum){
				local Target = GetTargetIndex_(MultiCount,IndexCount)
				if(Target != INVALID_CHARACTER){
					local SEFlag = true;
					local MotionFlag = true;
					SetDamageEffectSE(IndexCount,SEFlag,MotionFlag,MultiCount,MultiStageCount,false,cAction);
				}
			}
		}
		if(MaxActHitNum > 1){
			Wait_(15)
		}
	}
	
	//テラダメージチェック
	SetTeraPlusDamage_Init(MultiCount,WaitFlag,EffectFlag,cAction);

	//ステータス反応までの待ち設定
	if(WaitFlag == true){
		local StateFlag		= false;
		local StateValue = 0
		for(local i = STATUS_TOP ; i < STATUS_NUM ; i++){
			for(local IndexCount = 0 ; IndexCount < TargetNum ; IndexCount++){
				local WorkStateValue = GetStatusValue_(i,MultiCount,IndexCount)
				if(WorkStateValue > 0){
					StateValue = GetStatusValue_(i,MultiCount,IndexCount)
					StateWait = gStateData[i].Up_Wait;
				} else if(WorkStateValue < 0 ){
					StateValue = GetStatusValue_(i,MultiCount,IndexCount)
					StateWait = gStateData[i].Down_Wait;
				}
			}
		}
		
		if(StateValue != 0 && Efficacy == EFFICACY.ATTACK && DamageType == AFFECT_PARAM.HP){
			//ステータス変化＋ダメージが同時
			Wait_(40);
		}
		else{
			if(StateWait == 0){
				Wait_(EndWait);
			} else {
				switch(cAction.AllActEffect0_Name)
				{
				case "EF040_14_PROP_HAMETSUNOHI":	//破滅の日限定
					break;
				default:
					Wait_(DamageWait);
					break;
				}
			}
		}
	}
	
	//ステータス変化処理
	local WaitFrame = 0;
	for(local IndexCount = 0 ; IndexCount < TargetNum ; IndexCount++){
		local WaitValue = SetStateEffect_Init(IndexCount ,MultiCount,cAction)
		if(WaitValue != 0){WaitFrame = WaitValue;}
	}
	
	if(WaitFrame != 0 && WaitFlag == true){Wait_(WaitFrame);}
	
	//例外演出表示
	SetDamageEffect_ExceptionEffect(MultiCount,cAction)

	if(cAction.AllActEffect0_Name == "EF040_14_PROP_HAMETSUNOHI"){
		Wait_(EndWait)
	}

	//DebugPrint_FuncName_OUT("LineEffect_SingleStage");
}

//LineEffect（全体攻撃用）
function LineEffect_AllDamage(CharaStandFlag,MultiCount,MultiStageCount,WaitFlag,cAction)
{
	//DebugPrint_FuncName_IN("LineEffect_AllDamage");
	local TargetNum		= GetTargetNum_(MultiCount)
	local DamageType	= GetDamageType_(MultiCount,0)
	local EffectFrame	= cAction.EffectFrame;
	local DamageWait	= cAction.EffectFrame_DamageDirectionWait;
	local StateWait		= 0;
	local EndWait		= cAction.EffectFrame_EndWait;
	local EffectFlag	= true;
	
	// M・Gの詠唱カットの長さに合わせる
	Wait_(30);
	
	local FirstTarget = GetTargetIndex_(MultiCount, 0);
	
	// 最初の対象者のいる陣営から
	LineEffect_AllDamage_OneSide(MultiCount, MultiStageCount, cAction, WaitFlag, EffectFlag, IsAlly_(FirstTarget))
	LineEffect_AllDamage_OneSide(MultiCount, MultiStageCount, cAction, WaitFlag, EffectFlag, IsAlly_(FirstTarget) == false)
	
	//DebugPrint_FuncName_OUT("LineEffect_AllDamage");
}

//LineEffect（全体攻撃の片側演出）
//MultiCount		:何回目の行動か？
//MultiStageCount	:何段目の行動か？
//cAction			:cActionInfoクラス（ただし、全体攻撃では正常に取れない可能性あり）
//WaitFlag			:処理内部でWaitを行うか？
//EffectFlag		:処理内部でエフェクトを表示するか？
//AllyFlag			:敵味方判定（どちら側を表示するか？）
function LineEffect_AllDamage_OneSide(MultiCount,MultiStageCount,cAction,WaitFlag,EffectFlag,AllyFlag)
{
	//DebugPrint_FuncName_IN("LineEffect_AllDamage_OneSide");
	local cParty;
	local TargetNum		= GetTargetNum_(MultiCount)
	local DamageType	= GetDamageType_(MultiCount,0)
	local EffectFrame	= cAction.EffectFrame;
	local DamageWait	= cAction.EffectFrame_DamageDirectionWait;
	local StateWait		= 0;
	local EndWait		= cAction.EffectFrame_EndWait;
	
	ChangeIndexPointData_(BATTLE_COMMON_POINT_DATA);
	
	local cAllyParty	= cFullPartyInfo(GetAllyIndex_(0))
	local cEnemyParty	= cFullPartyInfo(GetEnemyIndex_(0))
	
	local cParty;
	if(AllyFlag == true){
		cParty		= cAllyParty
	} else {
		cParty		= cEnemyParty
	}
	
	local AllyTargetNum = cAllyParty.PartyNum;
	
	//キャラの配置
	local CameraFlag = true;
	CharaStand_PartyFull(CameraFlag,AllyFlag)
	CharaStand_NonCamera(AllyFlag)
	DeleteAllEffect_()
	Wait_(1)
	
	//例外メッセージ表示判定
	LineEffect_ExpentionMessage(MultiCount)
	
	
	if(EffectFlag == true){
		//特技エフェクトの表示・特技ＳＥの再生
		for(local IndexCount = 0 ; IndexCount < TargetNum ; IndexCount++){
			if(IsAlly_(GetTargetIndex_(MultiCount,IndexCount)) == AllyFlag){
				MonsterSizeEffect(GetTargetIndex_(MultiCount,IndexCount) , GetSingleEffectName_(MultiCount,0));
				MonsterSizeEffect(GetTargetIndex_(MultiCount,IndexCount) , GetSingleEffectName_(MultiCount,1));
			}
		}
		
		if(GetAllEffectName_(MultiCount,0) != null){
			local effectHandle = SetPointWorldEffect_(GetAllEffectName_(MultiCount,0), cParty.EffectEmpty_Area);
			SetEffectScale_(effectHandle, cParty.EffectScale_Area);
		}
		if(GetAllEffectName_(MultiCount,1) != null){
			local effectHandle = SetPointWorldEffect_(GetAllEffectName_(MultiCount,1), cParty.EffectEmpty_Area);
			SetEffectScale_(effectHandle, cParty.EffectScale_Area);
		}
	}
	Wait_(DamageWait);
	
	
	//今回の最大連続数を取得
	local MaxActHitNum = GetMaxActHitNum(MultiCount)
	
	for(MultiStageCount ; MultiStageCount < MaxActHitNum ; MultiStageCount++){
		for(local IndexCount = 0 ; IndexCount < TargetNum ; IndexCount++){
			if(IsAlly_(GetTargetIndex_(MultiCount,IndexCount)) == AllyFlag){
				local ActHitNum = GetActHitNum_(MultiCount, IndexCount);
				if(MultiStageCount < ActHitNum){
					local Target = GetTargetIndex_(MultiCount,IndexCount)
					if(Target != INVALID_CHARACTER){
						local SEFlag = true;
						local MotionFlag = true;
						SetDamageEffectSE(IndexCount,SEFlag,MotionFlag,MultiCount,MultiStageCount,false,cAction);
					}
				}
			}
		}
		if(MaxActHitNum > 1){
			Wait_(15)
		}
	}
	
	//例外演出表示（多段判定と同じ）
	for(local IndexCount = 0 ; IndexCount < TargetNum ; IndexCount++){
		if(IsAlly_(GetTargetIndex_(MultiCount,IndexCount)) == AllyFlag){
			SetDamageEffect_ExceptionEffect_IndexCount(MultiCount,IndexCount,cAction)
		}
	}
	
	//ステータス反応までの待ち設定
	if(WaitFlag == true){
		local StateFlag = false 
		for(local i = STATUS_TOP ; i < STATUS_NUM ; i++){
			for(local IndexCount = 0 ; IndexCount < TargetNum ; IndexCount++){
				if(IsAlly_(GetTargetIndex_(MultiCount,IndexCount)) == AllyFlag){
					local StateValue = GetStatusValue_(i,MultiCount,IndexCount)
					if(StateValue >0 ){
						StateWait = gStateData[i].Up_Wait;
					} else if(StateValue < 0 ) {
						StateWait = gStateData[i].Down_Wait;
					}
				}
			}
		}
		if(StateWait == 0){
			Wait_(EndWait);
		} else {
			Wait_(DamageWait);
		}
	}
	
	//ステータス変化処理
	local WaitFrame = 0;
	local WaitValue = 0;
	for(local IndexCount = 0 ; IndexCount < TargetNum ; IndexCount++){
		if(IsAlly_(GetTargetIndex_(MultiCount,IndexCount)) == AllyFlag){
			WaitValue = SetStateEffect_Init(IndexCount ,MultiCount,cAction)
		}
		if(WaitValue != 0){WaitFrame = WaitValue;}
	}
	if(WaitFrame != 0 && WaitFlag == true){Wait_(WaitFrame);}
	
	//DebugPrint_FuncName_OUT("LineEffect_AllDamage_OneSide");
}


//LineEffect（多段攻撃用）
function LineEffect_BAKURETSU(MultiCount,MultiStageCount,cAction,WaitFlag)
{
	//DebugPrint_FuncName_OUT("LineEffect_BAKURETSU");
	local TargetNum		= GetTargetNum_(MultiCount);
	local EffectFrame	= 0;
	local DamageWait	= cAction.EffectFrame_DamageDirectionWait;
	local StateWait		= 0;
	local EndWait		= cAction.EffectFrame_EndWait;
	local Target		= GetTargetIndex_(MultiCount,0)
	local cParty		= cFullPartyInfo(Target)
	
	//全体Effectはあらかじめ出しておく
	if(cAction.AllActEffect0_Name != null){
		ChangeIndexPointData_(BATTLE_COMMON_POINT_DATA);
		local EffectParam = SetPointWorldEffect_(cAction.AllActEffect0_Name, cParty.EffectEmpty_Area);
		SetEffectScale_(EffectParam, cParty.EffectScale_Area);
	}
	if(cAction.AllActEffect1_Name != null){
		ChangeIndexPointData_(BATTLE_COMMON_POINT_DATA);
		local EffectParam = SetPointWorldEffect_(cAction.AllActEffect1_Name, cParty.EffectEmpty_Area);
		SetEffectScale_(EffectParam, cParty.EffectScale_Area);
	}
	
	local Target		= GetTargetIndex_(MultiCount , 0);
	local cParty		= cFullPartyInfo(Target);
	local MotionTask	= array(cParty.PartyNum,null);
	local PopCount		= array(cParty.PartyNum,0);
	
	//今回の最大連続数を取得
	local MaxActHitNum = GetMaxActHitNum(MultiCount)
	
	//個別エフェクトがない場合はここでWaitを行う
	if(cAction.BAKURETSU_AllOnlyWait != 0){
		Wait_(cAction.BAKURETSU_AllOnlyWait);
	}
	
	//ステータス変化を事前に確認
	local StateChangeFlag	= false;
	local StateWait			= 0;
	for(local i = STATUS_TOP ; i < STATUS_NUM ; i++){
		for(local IndexCount = 0 ; IndexCount < TargetNum ; IndexCount++){
			local StateValue	= GetStatusValue_(i,MultiCount,IndexCount)
			local StateEndFlag	= GetStatusEndFlag_(i,MultiCount,IndexCount)
			if(StateValue != 0 || StateEndFlag == true){
				StateChangeFlag = true;
				local StatusEndFlag = GetStatusEndFlag_(i,MultiCount,0)
				if(GetStatusValue_(i,MultiCount,IndexCount) >0 ){
					StateWait = gStateData[i].Up_Wait;
				} else if(StateValue < 0 ){
					StateWait = gStateData[i].Down_Wait;
				} else if(StateValue == 0 && StateEndFlag == true){
					StateWait = gStateData[i].Reset_Wait;
				}
			}
		}
	}
	
	for(MultiStageCount ; MultiStageCount < MaxActHitNum ; MultiStageCount++){
		for(local IndexCount = 0 ; IndexCount < TargetNum ; IndexCount++){
			Target = GetTargetIndex_(MultiCount , IndexCount);
			local DamageType = GetDamageType_(MultiCount,IndexCount)
			if(cAction.SingleActEffect0_Name != null){
				MonsterNonSizeEffect(Target,cAction.SingleActEffect0_Name);
			}
			if(cAction.SingleActEffect1_Name != null){
				MonsterNonSizeEffect(Target,cAction.SingleActEffect1_Name);
			}
			//ダメージ反応までの待ち設定
			if(WaitFlag == true){
				switch(DamageType)
				{
				case AFFECT_PARAM.HP:
				case AFFECT_PARAM.MP:
					Wait_(DamageWait);
					break;
				default:
					break;
				}
			}
			
			local PartyCount	= 0;
			
			//特技のダメージ反応
			if(Target != INVALID_CHARACTER){
				local SEFlag		= true;
				local MotionFlag	= true;
				for(PartyCount = 0 ; PartyCount < cParty.PartyNum ; PartyCount++){
					if(cParty.Index[PartyCount] == Target){break;}
				}
				if(MotionTask[PartyCount] != null){
					//多段判定の場合、TaskMotionの管理をここで行う
					DeleteTask_(MotionTask[PartyCount]);
					MotionTask[PartyCount] = null;
				}
				if(GetDamageType_(MultiCount,IndexCount) == AFFECT_PARAM.HP || GetDamageType_(MultiCount,IndexCount) == AFFECT_PARAM.MP){
					MotionTask[PartyCount] = SetBAKURETSUDamageEffectSE(IndexCount,SEFlag,MotionFlag,MultiCount,MultiStageCount,cAction,PopCount[PartyCount]);
					PopCount[PartyCount] += 1
				
				}
			}
			//例外演出表示
			SetDamageEffect_ExceptionEffect_IndexCount(MultiCount,IndexCount,cAction)
			
			//ステータス反応までの待ち設定
			if(WaitFlag == true && EndWait > 0){Wait_(EndWait);}
			if(StateChangeFlag == true){
				//ステータス変化処理
				local WaitFrame = 0;
				if(IsTargetSingle_(MultiCount)){
					local ReturnParam = SetBAKURETSUStateEffect_Init(IndexCount ,MultiCount,MultiStageCount,MotionTask[PartyCount],cAction);
					local WaitValue				= ReturnParam[0];
					MotionTask[PartyCount]		= ReturnParam[1];
					if(WaitValue != 0){WaitFrame = WaitValue;}
				} else {
					local ReturnParam 	= SetBAKURETSUStateEffect_Init(IndexCount ,MultiCount,MultiStageCount,MotionTask[PartyCount],cAction);
					local WaitValue				= ReturnParam[0];
					MotionTask[PartyCount]		= ReturnParam[1];
					if(WaitValue != 0){WaitFrame = WaitValue;}
				}
				//多段系ステータス待ちは通常の半分
				if(WaitFrame != 0 && WaitFlag == true){Wait_(WaitFrame/2);}
			}
		}
		StopEarthQuake_()
	}
	
	//強制的に終了まで待たせる。
	if(TargetNum == 1){
		Wait_(45);
	} else {
		Wait_(30);
	}
	
	//DebugPrint_FuncName_OUT("LineEffect_BAKURETSU");
}

//LineEffect（フィールド効果用）
function LineEffect_FIELD(MultiCount,MultiStageCount,cAction,WaitFlag,EffectFlag)
{
	//DebugPrint_FuncName_IN("LineEffect_FIELD");
	//local ArgList =	["MultiCount"		,	MultiCount
	//					,"MultiStageCount"	,	MultiStageCount
	//					,"WaitFlag"			,	WaitFlag
	//					,"EffectFlag"		,	EffectFlag
	//					]
	//DebugPrint_functionParam("LineEffect_FIELD" , ArgList)

	local DamageType	= GetDamageType_(MultiCount,0)
	local EffectFrame	= cAction.EffectFrame;
	local DamageWait	= cAction.EffectFrame_DamageDirectionWait;
	local StateWait		= 0;
	local Actor			= GetActorIndex_(MultiCount);
	local CharaStand_Index;
	if(IsAlly_(Actor)){
		CharaStand_Index = GetEnemyIndex_(0);
	} else {
		CharaStand_Index = GetAllyIndex_(0);
	}
	local cParty		= cFullPartyInfo(CharaStand_Index)
	local EndWait		= cAction.EffectFrame_EndWait;
	
	if(EffectFlag == true){
		//全体エフェクト（０）
		if(cAction.AllActEffect0_Name != null){
			ChangeIndexPointData_(BATTLE_COMMON_POINT_DATA);
			switch(cAction.AllActEffect0_Name){
			case "EF213_19_GOD_HAND":
				local EffectParam = SetPointWorldEffect_(cAction.AllActEffect0_Name, cParty.EffectEmpty_Area);
				SetEffectFrame_(EffectParam, 76)
				SetEffectScale_(EffectParam, cParty.EffectScale_Area);
				break;
			case "EF213_21_ABYSS_HAND":
				local EffectParam = SetPointWorldEffect_(cAction.AllActEffect0_Name, cParty.EffectEmpty_Area);
				SetEffectFrame_(EffectParam, 51)
				SetEffectScale_(EffectParam, cParty.EffectScale_Area);
				break;
			case "EF213_23_JUDGMENT":
				local EffectParam = SetPointWorldEffect_(cAction.AllActEffect0_Name, cParty.EffectEmpty_Area);
				SetEffectFrame_(EffectParam, 96)
				SetEffectScale_(EffectParam, cParty.EffectScale_Area);
				break;
			default:
				local EffectParam = SetPointWorldEffect_(cAction.AllActEffect0_Name, cParty.EffectEmpty_Area);
				SetEffectScale_(EffectParam, cParty.EffectScale_Area);
				break;
			}
		}
		//全体エフェクト（１）
		if(cAction.AllActEffect1_Name != null){
			ChangeIndexPointData_(BATTLE_COMMON_POINT_DATA);
			switch(cAction.AllActEffect1_Name){
			case "EF213_20_GOD_HAND_M":
				local EffectParam = SetPointWorldEffect_(cAction.AllActEffect1_Name, cParty.EffectEmpty_Area);
				SetEffectFrame_(EffectParam, 76)
				SetEffectScale_(EffectParam, cParty.EffectScale_Area);
				break;
			case "EF213_22_ABYSS_HAND_M":
				local EffectParam = SetPointWorldEffect_(cAction.AllActEffect1_Name, cParty.EffectEmpty_Area);
				SetEffectFrame_(EffectParam, 51)
				SetEffectScale_(EffectParam, cParty.EffectScale_Area);
				break;
			case "EF213_24_JUDGMENT_M":
				local EffectParam = SetPointWorldEffect_(cAction.AllActEffect1_Name, cParty.EffectEmpty_Area);
				SetEffectFrame_(EffectParam, 96)
				SetEffectScale_(EffectParam, cParty.EffectScale_Area);
				break;
			default:
				local EffectParam = SetPointWorldEffect_(cAction.AllActEffect1_Name, cParty.EffectEmpty_Area);
				SetEffectScale_(EffectParam, cParty.EffectScale_Area);
				break;
			}
		}
	}
	
	Wait_(DamageWait);
	
	for(MultiStageCount ; MultiStageCount < GetMaxActHitNum(MultiCount) ; MultiStageCount++){
		for(local IndexCount = 0 ; IndexCount < GetTargetNum_(MultiCount) ; IndexCount++){
			if(GetTargetIndex_(MultiCount , IndexCount) != INVALID_CHARACTER){
				local SEFlag = true;
				local MotionFlag = true;
				local PierceFlag = false;
				SetDamageEffectSE(IndexCount,SEFlag,MotionFlag,MultiCount,MultiStageCount,PierceFlag,cAction)
				SetStateEffect_Init(IndexCount,MultiCount,cAction)
			}
		}
	}
	
	//例外演出表示
	SetDamageEffect_ExceptionEffect(MultiCount,cAction)
	
	Wait_(EndWait);

	//DebugPrint_FuncName_OUT("LineEffect_FIELD");
}

//LineEffect（みがわりダメージ）
function LineEffect_Substitute(MultiCount,MultiStageCount,cAction,WaitFlag)
{
	//DebugPrint_FuncName_IN("LineEffect_Substitute");
	
	local TargetNum = GetTargetNum_(MultiCount);
	local EffectFrame	= 0;
	local DamageWait	= cAction.EffectFrame_DamageDirectionWait;
	local EndWait		= cAction.EffectFrame_EndWait;
	local Target = GetTargetIndex_(MultiCount,0)
	local cParty = cFullPartyInfo(Target)
	local TargetType = GetTargetType_(MultiCount)
	local MaxActHitNum = GetMaxActHitNum(MultiCount);
	
	//全体Effectはあらかじめ出しておく
	if(cAction.AllActEffect0_Name != null){
		ChangeIndexPointData_(BATTLE_COMMON_POINT_DATA);
		local EffectParam = SetPointWorldEffect_(cAction.AllActEffect0_Name, cParty.EffectEmpty_Area);
		SetEffectScale_(EffectParam, cParty.EffectScale_Area);
	}
	if(cAction.AllActEffect1_Name != null){
		ChangeIndexPointData_(BATTLE_COMMON_POINT_DATA);
		local EffectParam = SetPointWorldEffect_(cAction.AllActEffect1_Name, cParty.EffectEmpty_Area);
		SetEffectScale_(EffectParam, cParty.EffectScale_Area);
	}
	
	local Target		= GetTargetIndex_(MultiCount , 0);
	local cParty		= cFullPartyInfo(Target);
	local MotionTask	= null;
	local PopCount		= 0;
	
	//ダメージ判定
	for(local IndexCount = 0 ; IndexCount < TargetNum ; IndexCount++){
		Target = GetTargetIndex_(MultiCount, IndexCount);
		local DamageType = GetDamageType_(MultiCount, IndexCount)
		//エフェクトの表示
		MonsterNonSizeEffect(Target,cAction.SingleActEffect0_Name);
		MonsterNonSizeEffect(Target,cAction.SingleActEffect1_Name);
		
		//ダメージ反応までの待ち設定
		if(WaitFlag == true){
			switch(DamageType)
			{
			case AFFECT_PARAM.HP:
			case AFFECT_PARAM.MP:
				if(IndexCount == 0){
					Wait_(DamageWait);
				} else {
					Wait_(10);
				}
				break;
			default:
				break;
			}
		}
		
		if(IndexCount == 0 || cAction.SingleActEffect0_Name != null){
			Wait_(EndWait);
		}
		
		local ActHitNum = GetActHitNum_(MultiCount,IndexCount)
		for(MultiStageCount = 0 ; MultiStageCount < ActHitNum ; MultiStageCount++){
			//特技のダメージ反応
			if(Target != INVALID_CHARACTER){
				local SEFlag		= true;
				local MotionFlag	= true;
				local PartyCount	= 0;
				
				for(PartyCount = 0 ; PartyCount < cParty.PartyNum ; PartyCount++){
					if(cParty.Index[PartyCount] == Target){break;}
				}
				if(MotionTask != null){
					//多段判定の場合、TaskMotionの管理をここで行う
					DeleteTask_(MotionTask);
					MotionTask = null;
				}
				MotionTask = SetBAKURETSUDamageEffectSE(IndexCount,SEFlag,MotionFlag,MultiCount,MultiStageCount,cAction,PopCount);
				PopCount += 1

				Wait_(10)
			}
		}
		
		if(GetActionEfficacy_(MultiCount) != EFFICACY.ATTACK){
			local WaitValue = SetStateEffect_Init(IndexCount ,MultiCount,cAction)
			if(WaitFlag == true){
				if(WaitValue != 0){
					Wait_(WaitValue);
				}
			}
		}
	}
	
	if(GetActionEfficacy_(MultiCount) == EFFICACY.ATTACK){
		SetTeraPlusDamage_Substitute_Init(MultiCount, true, cAction);
		local checkStatus = false;
		local isDead = false;
		for(local IndexCount = 0 ; IndexCount < TargetNum ; IndexCount++){
			checkStatus = checkStatus || (GetStatusValue_(STATUS.DEATH, MultiCount, IndexCount) != 0);
			isDead = isDead || (IsDead_(MultiCount, IndexCount));
		}
		
		if(checkStatus || isDead == false){
			for(local IndexCount = 0 ; IndexCount < TargetNum ; IndexCount++){
				local WaitValue = SetStateEffect_Init(IndexCount, MultiCount, cAction);
				if(WaitFlag == true){
					if(WaitValue != 0){
						Wait_(WaitValue);
					}
				}
			}
		}
	}
	
	for(local IndexCount = 0 ; IndexCount < TargetNum ; IndexCount++){
		//例外処理
		SetDamageEffect_ExceptionEffect_IndexCount(MultiCount,IndexCount,cAction);
	}
	Wait_(30)

	//DebugPrint_FuncName_OUT("LineEffect_Substitute");
}

//LineEffect（連続特性）
function LineEffect_ContinuationEffect(MultiCount,MultiStageCount,cAction)
{
	//DebugPrint_FuncName_IN("LineEffect_ContinuationEffect");
	local TargetNum		= GetTargetNum_(MultiCount)
	local DamageType	= GetDamageType_(MultiCount,0)
	local EffectFrame	= cAction.EffectFrame;
	local DamageWait	= cAction.EffectFrame_DamageDirectionWait;
	local StateWait		= 0;
	local EndWait		= cAction.EffectFrame_EndWait;
	local MaxCount		= GetActionNum_()
	
	//特技エフェクトの表示・特技ＳＥの再生
	LineEffect_EffectBornDirection(MultiCount,MultiStageCount,cAction);
	
	//今回の最大連続数を取得
	local MaxActHitNum = GetMaxActHitNum(MultiCount)
	
	for(MultiStageCount ; MultiStageCount < MaxActHitNum ; MultiStageCount++){
		for(local IndexCount = 0; IndexCount < TargetNum ; IndexCount++){
			local ActHitNum = GetActHitNum_(MultiCount, IndexCount);
			if(MultiStageCount < ActHitNum){
				local Target = GetTargetIndex_(MultiCount,IndexCount)
				if(Target != INVALID_CHARACTER){
					local SEFlag = true;
					local MotionFlag = true;
					SetDamageEffectSE(IndexCount,SEFlag,MotionFlag,MultiCount,MultiStageCount,false,cAction);
				}
			}
		}
		if(MaxActHitNum > 1){
			Wait_(15)
		}
	}
	
	//例外演出表示
	SetDamageEffect_ExceptionEffect(MultiCount,cAction)
	
	//ステータス反応までの待ち設定
	local StateFlag = false 
	for(local i = STATUS_TOP ; i < STATUS_NUM ; i++){
		for(local IndexCount = 0 ; IndexCount < TargetNum ; IndexCount++){
			local StateValue = GetStatusValue_(i,MultiCount,IndexCount)
			if(StateValue >0 ){
				StateWait = gStateData[i].Up_Wait;
			} else if(StateValue < 0 ){
				StateWait = gStateData[i].Down_Wait;
			}
		}
	}
	
	//ステータス変化処理
	local WaitFrame = 0;
	for(local IndexCount = 0 ; IndexCount < TargetNum ; IndexCount++){
		local WaitValue = SetStateEffect_ContinuationEffect(IndexCount ,MultiCount,cAction)
		if(WaitValue != 0){WaitFrame = WaitValue;}
	}
	
	if(WaitFrame != 0 && MultiCount == MaxCount -1){Wait_(WaitFrame);}
	
	//DebugPrint_FuncName_OUT("LineEffect_ContinuationEffect");
}

//特技エフェクトの表示・特技ＳＥの再生
function LineEffect_EffectBornDirection(MultiCount,MultiStageCount,cAction)	
{
	//DebugPrint_FuncName_IN("LineEffect_EffectBornDirection");
	//Attack：呪文を使ったモンスター
	//DebugPrint("	=>	MultiCount			:	" + MultiCount);
	//DebugPrint("	=>	MultiStageCount		:	" + MultiStageCount);
	//必要となるクラスの読込
	local cParty = cFullPartyInfo(cAction.Target[0]);
	
	//例外的に回転が必要な処理用
	local AllyFlag = IsAlly_(GetTargetIndex_(MultiCount,0,0))
	local RotateY = 0;
	if(AllyFlag == true){
		RotateY = 3.14;
	} else {
		RotateY = 0;
	}
	
	//単体エフェクトの貼り付け
	for(local i = 0 ; i <  cAction.TargetNum ; i++){
		local SingleActEffect0 = MonsterSizeEffect(cAction.Target[i],cAction.SingleActEffect0_Name);
		local SingleActEffect1 = MonsterSizeEffect(cAction.Target[i],cAction.SingleActEffect1_Name);
		if(cAction.SingleActEffect0_SEFlag != true){
			SetEffectSoundEnable_(SingleActEffect0, false);
		}
		if(cAction.SingleActEffect1_SEFlag != true){
			SetEffectSoundEnable_(SingleActEffect1, false);
		}
	}
	
	//全体エフェクト０の貼り付け
	if(cAction.AllActEffect0_Name != null){
		ChangeIndexPointData_(BATTLE_COMMON_POINT_DATA);
		switch(cAction.AllActEffect0_Name){
		case "EF213_19_GOD_HAND":
			local EffectParam = SetPointWorldEffect_(cAction.AllActEffect0_Name, cParty.EffectEmpty_Area);
			SetEffectFrame_(EffectParam, 76)
			SetEffectScale_(EffectParam, cParty.EffectScale_Area);
			SetEffectRotateY_(EffectParam,RotateY)
			break;
		case "EF213_21_ABYSS_HAND":
			local EffectParam = SetPointWorldEffect_(cAction.AllActEffect0_Name, cParty.EffectEmpty_Area);
			SetEffectFrame_(EffectParam, 51)
			SetEffectScale_(EffectParam, cParty.EffectScale_Area);
			SetEffectRotateY_(EffectParam,RotateY)
			break;
		case "EF213_23_JUDGMENT":
			local EffectParam = SetPointWorldEffect_(cAction.AllActEffect0_Name, cParty.EffectEmpty_Area);
			SetEffectFrame_(EffectParam, 96)
			SetEffectScale_(EffectParam, cParty.EffectScale_Area);
			SetEffectRotateY_(EffectParam,RotateY)
			break;
		case "EF040_14_PROP_HAMETSUNOHI":
			//破滅の日はカメラエフェクトで表示する
			SetCameraEffect_("EF040_14_PROP_HAMETSUNOHI" , 300)
			break;
		default:
			local EffectParam = SetPointWorldEffect_(cAction.AllActEffect0_Name, cParty.EffectEmpty_Area);
			SetEffectScale_(EffectParam, cParty.EffectScale_Area);
			if(cAction.AllActEffect0_SEFlag != true){
				SetEffectSoundEnable_(EffectParam, false);
			}
			break;
		}
	}
	//全体エフェクト１の貼り付け
	if(cAction.AllActEffect1_Name != null){
		ChangeIndexPointData_(BATTLE_COMMON_POINT_DATA);
		switch(cAction.AllActEffect1_Name){
		case "EF213_20_GOD_HAND_M":
			local EffectParam = SetPointWorldEffect_(cAction.AllActEffect1_Name, cParty.EffectEmpty_Area);
			SetEffectFrame_(EffectParam, 76)
			SetEffectScale_(EffectParam, cParty.EffectScale_Area);
			SetEffectRotateY_(EffectParam,RotateY)
			break;
		case "EF213_22_ABYSS_HAND_M":
			local EffectParam = SetPointWorldEffect_(cAction.AllActEffect1_Name, cParty.EffectEmpty_Area);
			SetEffectFrame_(EffectParam, 51)
			SetEffectScale_(EffectParam, cParty.EffectScale_Area);
			SetEffectRotateY_(EffectParam,RotateY)
			break;
		case "EF213_24_JUDGMENT_M":
			local EffectParam = SetPointWorldEffect_(cAction.AllActEffect1_Name, cParty.EffectEmpty_Area);
			SetEffectFrame_(EffectParam, 96)
			SetEffectScale_(EffectParam, cParty.EffectScale_Area);
			SetEffectRotateY_(EffectParam,RotateY)
			break;
		default:
			local EffectParam = SetPointWorldEffect_(cAction.AllActEffect1_Name, cParty.EffectEmpty_Area);
			SetEffectScale_(EffectParam, cParty.EffectScale_Area);
			if(cAction.AllActEffect1_SEFlag != true){
				SetEffectSoundEnable_(EffectParam, false);
			}
			break;
		}
	}
	
	//DebugPrint_FuncName_OUT("LineEffect_EffectBornDirection");
}

//効果による反応SE
/*function LineEffect_Kind_DirectionSE(Target,MultiCount,MultiStageCount,cAction)
{
	//DebugPrint_FuncName_IN("LineEffect_Kind_DirectionSE");
	//DebugPrint("	=>	Target				:	" + Target);
	//DebugPrint("	=>	MultiCount			:	" + MultiCount);
	//DebugPrint("	=>	MultiStageCount		:	" + MultiStageCount);
	
	//クラスの読込
	local cParty = cFullPartyInfo(Target);
	
	if(cAction.Kind == EFFICACY.ATTACK ){
		//攻撃時のSE再生判定
		if(cAction.HitTypeSEFlag == true){ReplaySE_(cAction.HitTypeSE);}
	} else if (cAction.Kind == EFFICACY.HEAL ){
		//回復時のSE再生判定
		if(cAction.HealTypeSEFlag == true){ReplaySE_(cAction.HealTypeSE);}
	} else if (cAction.Kind == EFFICACY.HEAL ){
		//蘇生時のSE再生判定
		if(cAction.RevivalTypeSEFlag == true){ReplaySE_(cAction.RevivalTypeSE);}
	} else if (cAction.Kind == EFFICACY.SUPPORT || cAction.Kind == EFFICACY.WEAK){
		//ステータス変化時のSE再生判定
		if(cAction.StatusTypeSEFlag == true){ReplaySE_(cAction.StatusTypeSE);}
	} else {
		//それ以外のSE
		if(cAction.OtherTypeSEFlag == true){ReplaySE_(cAction.OtherTypeSE);}
	}
	
	if(cAction.DeadFlag == true){
		ReplaySE_(cAction.DeadSE)
	}
	
	//DebugPrint_FuncName_OUT("LineEffect_Kind_DirectionSE");
}*/

//効果演出・例外メッセージ表示
function LineEffect_ExpentionMessage(MultiCount)
{
	//おすそわけ
	if(IsPasser_(MultiCount)){
		AddBattleFeatMessage_(52);
	}
	
	//ギャンブルボディ
	
	//
	
}

//エフェクトのスケール変更=====================================================================
//モンスターサイズごとにアタッチするエフェクトの大きさを対応させる（汎用）
//		Monster		:	モンスターのインデックス番号
//		EffectName	:	エフェクト名
function MonsterSizeEffect(Monster,EffectName)
{
	//DebugPrint_FuncName_IN("MonsterSizeEffect");
	//DebugPrint("	=>	Monster				:	" + Monster);
	//DebugPrint("	=>	EffectName			:	" + EffectName);
	
	local EffectParam = null;
	
	if(EffectName != null){
		//クラスの読込
		local cMonster		= cMonsterInfo(Monster)
		local EffectSize	= cMonster.EffectSize;
		EffectParam = SetBoneEffect_(EffectName, Monster);
		
		//例外処理用
		/*switch(cMonster.Size)
		{
		case SIZE_S:
		case SIZE_N:
		case SIZE_M:
		case SIZE_G:
		case SIZE_T:
			break;
		default:
			switch(EffectName)
			{
			case "":
				//EffectSize = 0
				break;
			default:
				break;
			}
			break;
		}*/
		
		SetEffectScale_(EffectParam, cMonster.EffectSize);
		
	}
	
	//DebugPrint_FuncName_OUT("MonsterSizeEffect");
	
	//戻り値でエフェクトのタスク番号を返す
	return EffectParam;
}

//エフェクトパラメータのスケール設定を利用する場合
function EffParamSizeEffect(Monster,EffectName)
{
	//DebugPrint_FuncName_IN("EffParamSizeEffect");
	//local ArgList =	["Monster"		,	Monster
	//					,"EffectName"	,	EffectName
	//					]
	//DebugPrint_functionParam("EffParamSizeEffect" , ArgList )
	
	local EffectParam = null;
	
	//クラスの読込
	if(EffectName != null){
		EffectParam = SetBoneEffect_(EffectName, Monster);
	}
	
	//DebugPrint_FuncName_OUT("EffParamSizeEffect");
	return EffectParam;
}

//エフェクトパラメータのスケール設定を利用する場合（SE無効版）
function EffParamSizeEffect_NoSE(Monster,EffectName)
{
	//DebugPrint_FuncName_IN("EffParamSizeEffect_NoSE");
	//DebugPrint("	=>	Monster				:	" + Monster);
	//DebugPrint("	=>	EffectName			:	" + EffectName);
	
	
	local EffectParam = null;
	
	//クラスの読込
	if(EffectName != null){
		EffectParam = SetBoneEffect_(EffectName, Monster);
	}
	
	SetEffectSoundEnable_(EffectParam,false);
	//DebugPrint_FuncName_OUT("EffParamSizeEffect_NoSE");
	
	return EffectParam;
}

//サイズを管理する場合（マータ系用）
function MonsterNonSizeEffect(Monster,EffectName)
{
	//DebugPrint_FuncName_IN("MonsterNonSizeEffect");
	//DebugPrint("	=>	Monster				:	" + Monster);
	//DebugPrint("	=>	EffectName			:	" + EffectName);
	
	//クラスの読込
	
	local EffectParam = null;
	
	if(EffectName != null){
		local cMonster = cMonsterInfo(Monster)
		EffectParam = SetBoneEffect_(EffectName, Monster);
		if(cMonster.Size == SIZE_T){
			//SetEffectScale_(EffectParam, 2.4);
		} else {
			//SetEffectScale_(EffectParam, 1.0);
		}
	}
	
	//DebugPrint_FuncName_OUT("MonsterNonSizeEffect");
}

//連続効果による反応==========================================================================
//連続行動時の効果による効果による待機
//	Target			: 発生させるモンスター
//	MultiCount		: 何個目の技か
//	MultiStageCount	: 何段目の攻撃か？
function LineEffect_Kind_DirectionWaitMulti(Target,MultiCount,MultiStageCount,cAction)
{
	//DebugPrint_FuncName_IN("LineEffect_Kind_DirectionWaitMulti");
	//DebugPrint("	=>	Target				:	" + Target);
	//DebugPrint("	=>	MultiCount			:	" + MultiCount);
	//DebugPrint("	=>	MultiStageCount		:	" + MultiStageCount);

	local Kind = GetActionEfficacy_(MultiCount);
	local Attack = GetActorIndex_(MultiCount);
	local Target = GetTargetIndex_(MultiCount,0);
	
	if (Kind == EFFICACY.ATTACK){
		//ダメージ演出の場合
		Wait_(cAction.EffectFrame/3);
		local TargetNum = GetTargetNum_(0);
		if(TargetNum >= 1){
			Target = GetTargetIndex_(MultiCount,0);
			SetMotion_(Target, MOT_WAIT, 4);
		} else {}
		if(TargetNum >= 2){
			Target = GetTargetIndex_(MultiCount,0);
			SetMotion_(Target, MOT_WAIT, 4);
		} else {}
		if(TargetNum >= 3){
			Target = GetTargetIndex_(MultiCount,0);
			SetMotion_(Target, MOT_WAIT, 4);
		} else {}
		if(TargetNum >= 4){
			Target = GetTargetIndex_(MultiCount,0);
			SetMotion_(Target, MOT_WAIT, 4);
		} else {}
		//Wait_(cAction.EffectFrame/3);
	} else if (Kind == EFFICACY.HEAL) {
		//回復の場合
		Wait_(10);
	} else if (Kind == EFFICACY.HEAL) {
		//蘇生の場合
		Wait_(10);
	} else if (Kind == EFFICACY.OTHER) {
		//それ以外の場合はWaitは行わない。
	}
	//DebugPrint_FuncName_OUT("LineEffect_Kind_DirectionWaitMulti");
}


//連続した演出（いきなり系対応・単体で複数持ちには現状非対応）
function ContinuationEffect(cActionList)
{
	//DebugPrint_FuncName_IN("ContinuationEffect");
	SetVisibleNeedModel_();
	ChangeIndexPointData_(BATTLE_COMMON_POINT_DATA);
	
	//ローカル関数の定義
	local MultiCount = 0;
	local MultiStageCount = 0;
	local Actor = GetActorIndex_(MultiCount);
	local Target = GetTargetIndex_(MultiCount , 0);
	local ActionNum = GetActionNum_();
	
	
	//行動者と対象者が違う場合は対象者カットを表示する。
	if(Actor =! Target && ActionNum == 1){
		local CharaStand_Select = "ActorFull";	//まず行動者側を表示
		local CameraFlag = true;				//カメラを生成する
		local NameVisibleFlag = true
		StartCombo_(MultiCount);
		ShowActionMessage(MultiCount,NameVisibleFlag)
		CharaStand(CharaStand_Select , CameraFlag , MultiCount,cActionList[MultiCount]);

		local Attack = GetActorIndex_(MultiCount)
		SetMotion_(Attack, MOT_WAIT, 4);
		Wait_(45);

		local CharaStand_Select = "ActorFull";
		local CameraFlag = true;
		CharaStand(CharaStand_Select , CameraFlag , MultiCount,cActionList[MultiCount]);
	} else {
		//行動名の表示
		StartCombo_(MultiCount);
		for(local i = 0 ; i < ActionNum ; i++){
			Actor = GetActorIndex_(i)
			ShowActionMessage_IconAnimation(i,Actor)
		}
		local CharaStand_Select = "ActorFull";
		local CameraFlag = true;
		CharaStand(CharaStand_Select , CameraFlag , MultiCount,cActionList[MultiCount]);
		Wait_(15);
	}
	
	//行動回数分だけエフェクトのループ
	for(MultiCount ; MultiCount < ActionNum ; MultiCount += 1){	
		local TargetNum = GetTargetNum_(MultiCount);
		local SingleFlag = IsTargetSingle_(MultiCount);
		for( local y = 0 ; y < TargetNum ; y += 1){	
			LineEffect_ContinuationEffect(MultiCount,MultiStageCount,cActionList[MultiCount])
		}
	}
	
	SetApealPoint_Init(true);
	
	//DebugPrint_FuncName_OUT("ContinuationEffect");
}


//連続魔法用の演出
function ContinuationMagic(MultiCount,MultiStageCount)
{
	//DebugPrint_FuncName_IN("ContinuationMagic");
	//DebugPrint("	=>	MultiCount			:	" + MultiCount);
	//DebugPrint("	=>	MultiStageCount		:	" + MultiStageCount);
	SetVisibleNeedModel_();
	ChangeIndexPointData_(BATTLE_COMMON_POINT_DATA);
	
	//エフェクトのロード（複数体用）
	LoadEffect();
		
	//キャラを正面配置
	
	//攻撃側のモンスター情報
	local ActionIndex = [];
	local TargetIndex = [];
	local MultiTargetIndex = [];
	local TargetNum = GetTargetNum_(0);
	local ActionNum = GetActionNum_();
	for(local x = 0 ; x < ActionNum ; x++){
		ActionIndex.append(GetActorIndex_(x))
		TargetNum = GetTargetNum_(x);
		TargetIndex = null;
		TargetIndex = [];	//配列の初期化
		for(local y = 0 ; y < TargetNum ; y++){
			TargetIndex.append(GetTargetIndex_(x, y))
		}
		MultiTargetIndex.append(TargetIndex);
	}
	
	//TargetNumで対象キャラ数を取得
	//そこからその呪文が単体対象か、全体対象かを判定する
	local TargetSingle = IsTargetSingle_(0);

	//キャラの正面配置
	local CharaStand_Select = "Target"	//対象の表示
	local CameraFlag		= true		//カメラを配置
	local cAction = cActionInfo(MultiCount);
	local NameVisibleFlag = false;
	CharaStand(CharaStand_Select,CameraFlag,MultiCount,cAction);
	
	for(MultiCount ; MultiCount < ActionNum ; MultiCount++){
		//クラスのロード
		if(MultiCount != 0){
			cAction = cActionInfo(MultiCount);
		}
		//Debug_cActionPrint(cAction)
		ShowActionMessage(MultiCount,NameVisibleFlag)
		
		local CharaStandFlag = false;	//キャラを立たせない
		local WaitFlag = true			//Waitは入れる
		local MultiStageCount = 0
		LineEffect_Init(CharaStandFlag , MultiCount , MultiStageCount , WaitFlag , cAction)
	}

	//DebugPrint_FuncName_OUT("ContinuationMagic");
}

//連続魔法のダメージ用
function ContinuationMagicTarget(MultiCount,MultiStageCount,cAction)
{
	//DebugPrint_FuncName_IN("ContinuationMagicTarget");
	//DebugPrint("	=>	MultiCount			:	" + MultiCount);
	//DebugPrint("	=>	MultiStageCount		:	" + MultiStageCount);
	// MultiCount	: 何個目の技か？
	local Attack = GetActorIndex_(MultiCount);
	local TargetNum = GetTargetNum_(MultiCount);
	local Target;
	local SEFlag = false;
	local MotionFlag = true;
	
	for(local IndexCount = 0 ; IndexCount < TargetNum ; IndexCount += 1){
		if(IndexCount == 0){
			SEFlag = true;
			SetDamageEffectSE(IndexCount,SEFlag,MotionFlag,MultiCount,MultiStageCount,false,cAction);
		} else { 
			SEFlag = false;
			SetDamageEffectSE(IndexCount,SEFlag,MotionFlag,MultiCount,MultiStageCount,false,cAction);
		}
	}
	//DebugPrint_FuncName_OUT("ContinuationMagicTarget");

}

//通常攻撃・単体特技・行動キャラが走り出してズーム
function StandbyCut_Assault(MultiCount,cAction)
{
	//DebugPrint_FuncName_IN("StandbyCut_Assault");
	
	//戦闘演出例外判定
	local SingleAttackFlag = true
	Exception_1stCheck(MultiCount,SingleAttackFlag,cAction)
	
	ChangeIndexPointData_(BATTLE_COMMON_POINT_DATA);
	local NameVisibleFlag = true;
	ShowActionMessage(MultiCount , NameVisibleFlag)

	local Actor = GetActorIndex_(MultiCount);
	local cActor = cMonsterInfo(Actor);
	local AllyFlag = IsAlly_(Actor);
	
	
	//キャラの整列
	StandbyCut_LineSort(true);
	
	//例外判定
	local SingleAttackFlag = true;
	Exception_1stCheck(MultiCount,SingleAttackFlag,cAction)
	
	if(IsScout_()){
		if(IsScoutFirstAttack_()){
			PlaySE_("SE_BTL_014");
		}
	}
	
	//ランナーの選出
	local cParty;
	local CameraTask;
	if(AllyFlag == true){
		cParty = cFullPartyInfo(Actor);
		ReplaySE_("SE_BTL_001")
	} else {
		cParty = cFullPartyInfo(Actor);
		ReplaySE_("SE_BTL_004")
	}
	for(local i = 0 ; i < cParty.PartyNum ; i++){
		if(Actor == cParty.Index[i]){
			Task_AnimeMoveCharNoDir_(cParty.Index[i] , cParty.StandbyCutRunner[i]);
			CameraTask = Task_AnimeMoveCamera_(cParty.StandbyCutCam[i] , cParty.StandbyCutCamTgt[i]);
			//DebugPrint("i	: " + i + "\n")
			//DebugPrint("cParty.Index[i]	: " + cParty.Index[i] + "\n")
			//DebugPrint("cParty.StandbyCutRunner[i]	: " + cParty.StandbyCutRunner[i] + "\n")
			//DebugPrint("cParty.StandbyCutCam[i]		: " + cParty.StandbyCutCam[i] + "\n")
			//DebugPrint("cParty.StandbyCutCamTgt[i]	: " + cParty.StandbyCutCamTgt[i] + "\n")
			SetMotion_(Actor, MOT_MOVE_LOOP, 4);
		}
	}
	Wait_(10);
	
	//DebugPrint_FuncName_OUT("StandbyCut_Assault");
	
}

//モンスター存在判定用
function GetMonsterState(Index)
{
	//DebugPrint_FuncName_IN("GetMonsterState");
	//DebugPrint("	=>	Index		:	" + Index);
	local Monster;
	local MonsterType = GetInitExistType_(Index);
	if(MonsterType == LIVETYPE.ACTIVE || MonsterType == LIVETYPE.INACTIVE){
		Monster = Index;
	} else {
		Monster = INVALID_CHARACTER;
	}
	//DebugPrint("Return");
	//DebugPrint("	=>	Monster	:	" + Monster);
	//DebugPrint_FuncName_OUT("GetMonsterState");
	return Monster;
}

//全体特技・呪文用・全体から詠唱キャラにズーム
function StandbyCut_Magic(MultiCount,cAction)
{
	//DebugPrint_FuncName_IN("StandbyCut_Magic");
	ChangeIndexPointData_(BATTLE_COMMON_POINT_DATA);
	
	//戦闘演出例外判定
	local SingleAttackFlag = false;
	Exception_1stCheck(MultiCount,SingleAttackFlag,cAction)
	
	local NameVisibleFlag = true
	ShowActionMessage(MultiCount,NameVisibleFlag);
		
	local ActionMonster = GetActorIndex_(0);
	local AllyFlag = IsAlly_(ActionMonster);
		
	local AllyIndex		= GetAllyIndex_(0);
	local EnemyIndex	= GetEnemyIndex_(0);
	
	local cParty;
	//モンスターの配置
	//StandbyCut_LineSort(false);
	CharaStand_ActorFull(false);
	
	//スカウト用SEの再生
	if(IsScout_()){
		if(IsScoutFirstAttack_()){
			PlaySE_("SE_BTL_014");
		}
	}
	
	//ズームするカメラの指定
	if(AllyFlag == true){
		cParty = cFullPartyInfo(AllyIndex)
	} else {
		cParty = cFullPartyInfo(EnemyIndex)
	}
	
	for(local i = 0 ; i<cParty.PartyNum ; i++){
		if(ActionMonster == cParty.Index[i]){
			ChangeIndexPointData_(BATTLE_COMMON_POINT_DATA);
			Task_AnimeMoveCamera_(cParty.UpCam[i],cParty.UpCamTgt[i]);
		}
	}
	
	Wait_(10);
	
	//DebugPrint_FuncName_OUT("StandbyCut_Magic");
}

//スタンバイカット用・整列処理
// RunnningFlag			: モンスターを走らせるか？
function StandbyCut_LineSort(RunningFlag)
{
	//DebugPrint_FuncName_IN("StanbyCut_LineSort");
	
	ChangeIndexPointData_(BATTLE_COMMON_POINT_DATA);
	
	return;
	
	local cAllyParty	= cFullPartyInfo(GetAllyIndex_(0))
	local cEnemyParty	= cFullPartyInfo(GetEnemyIndex_(0))
	
	StandbyCut_LineSort_PartySet(cAllyParty)
	StandbyCut_LineSort_PartySet(cEnemyParty)
	
	//DebugPrint_FuncName_OUT("StanbyCut_LineSort");
}

//スタンバイカット用パーティ配置
//cParty		: 配置するパーティ設定
function StandbyCut_LineSort_PartySet(cParty)
{
	
	for(local i = 0 ; i < cParty.PartyNum ; i++){
		if(cParty.Type[i] != LIVETYPE.NONE){
			//モンスターの配置
			Task_AnimeMoveCharNoDir_(cParty.Index[i] , cParty.Empty[i]);
			SetDir_(cParty.Index[i],cParty.Rotate[i]);
			if(cParty.Type[i] == LIVETYPE.ACTIVE)
				SetVisible_(cParty.Index[i] , true);
			} else {
				SetVisible_(cParty.Index[i] , false);
		}
	}
	
	Task_AnimeMoveCharNoDir_(cParty.MasterIndex , cParty.Empty_Master);
	SetDir_(cParty.MasterIndex , cParty.Rotate_Master)
	
}


//パーティ情報を取得
function Get_PartyType(AllyFlag)
{
	//DebugPrint_FuncName_IN("Get_PartyType");
	
	local Monster = [];			//Indexを配列で管理
	local PartyNum = 0;			//モンスター数
	local Size = [];			//モンスターのサイズ
	local Type = [];			//モンスターの生存状態判定
	local SFlag = false;		//Ｓサイズがいるか判定
	local MFlag = false;		//Ｍサイズがいるか判定
	local GFlag = false;		//Ｇサイズがいるか判定
	local TFlag = false;		//Ｔサイズがいるか判定
	local PartyType;			//パーティ構成
	
	for(local i = 0 ; i < 4 ; i++){
		if(AllyFlag == true){
			Monster.append(GetAllyIndex_(i));
		} else {
			Monster.append(GetEnemyIndex_(i));
		}
		if(Monster[i] != INVALID_CHARACTER){
			Type.append(GetInitExistType_(Monster[i]));
			if(Type[i] != LIVETYPE.NONE){
				PartyNum += 1;
				Size.append(GetMonsterSize_(Monster[i]));
				if(Size[i] == SIZE_S){SFlag = true;}
				if(Size[i] == SIZE_M){MFlag = true;}
				if(Size[i] == SIZE_G){GFlag = true;}
				if(Size[i] == SIZE_T){TFlag = true;}
			}
		}
	}
	
	if(PartyNum == 4){
		PartyType = PARTYTYPE.S4;		//S4
	} else if(PartyNum == 3){
		PartyType = PARTYTYPE.S3;		//S3
	} else if(PartyNum == 2 && GFlag == false){
		PartyType = PARTYTYPE.S2;		//S2
	} else if(PartyNum == 1 && GFlag == false && TFlag == false){
		PartyType = PARTYTYPE.S1;		//S1
	} else if(PartyNum == 2 && GFlag == true){
		if(Size[0] != SIZE_G){
			PartyType = PARTYTYPE.SG;	//SG
		} else {
			PartyType = PARTYTYPE.GS;	//GS
		}
	} else if(PartyNum == 1 && GFlag == true && TFlag == false){
		PartyType = PARTYTYPE.G1;		//G1
	} else if(PartyNum == 1 && GFlag == false && TFlag == true){
		PartyType = PARTYTYPE.T1;		//T1
	} else {
		//DebugPrint("Error : " + "BattleCommon_function_" + "Get_PartyType" + "\n");
		//DebugPrint("PartyNum	: " + PartyNum + "\n");
		//DebugPrint("SFlag		: " + SFlag + "\n");
		//DebugPrint("MFlag		: " + MFlag + "\n");
		//DebugPrint("GFlag		: " + GFlag + "\n");
		//DebugPrint("TFlag		: " + TFlag + "\n");
		ScriptStop()
	}
	
	//DebugPrint_FuncName_OUT("Get_PartyType");
	//DebugPrint("	<=	PartyType	:	" + PartyType);
	return PartyType;

}

//引数で渡したモンスターインデックスで構成するパーティ情報を取得
function Get_SelectionPartyType(Monster0,Monster1,Monster2,Monster3)
{
	//DebugPrint_FuncName_IN("Get_SelectionPartyType");	
	//DebugPrint("	=>	Monster0		:	" + Monster0);
	//DebugPrint("	=>	Monster1		:	" + Monster1);
	//DebugPrint("	=>	Monster2		:	" + Monster2);
	//DebugPrint("	=>	Monster3		:	" + Monster3);
	
	local Monster= []			//モンスターインデックス
	Monster = [Monster0 , Monster1 , Monster2 , Monster3]
	local PartyNum = 0;			//モンスター数
	local Size = [];			//モンスターのサイズ
	local Type = [];			//モンスターの生存状態判定
	local SFlag = false;		//Ｓサイズがいるか判定
	local NFlag = false;		//Ｓサイズがいるか判定
	local MFlag = false;		//Ｍサイズがいるか判定
	local GFlag = false;		//Ｇサイズがいるか判定
	local TFlag = false;		//Ｔサイズがいるか判定
	local PartyType;			//パーティ構成
	
	for (local i = 0 ; i < 4 ; i++){
		if(Monster[i] != INVALID_CHARACTER){
			Type.append(GetInitExistType_(Monster[i]));
			if(Type[i] != LIVETYPE.NONE){
				PartyNum += 1;
				Size.append(GetMonsterSize_(Monster[i]));
				if(Size[i] == SIZE_S){SFlag = true;}
				if(Size[i] == SIZE_N){NFlag = true;}
				if(Size[i] == SIZE_M){MFlag = true;}
				if(Size[i] == SIZE_G){GFlag = true;}
				if(Size[i] == SIZE_T){TFlag = true;}
			}
		}
	}
		
	if(PartyNum == 4){
		PartyType = PARTYTYPE.S4;		//S4
	} else if(PartyNum == 3){
		PartyType = PARTYTYPE.S3;		//S3
	} else if(PartyNum == 2 && GFlag == false){
		PartyType = PARTYTYPE.S2;		//S2
	} else if(PartyNum == 1 && GFlag == false && TFlag == false){
		PartyType = PARTYTYPE.S1;		//S1
	} else if(PartyNum == 2 && GFlag == true){
		if(Size[0] != SIZE_G){
			PartyType = PARTYTYPE.SG;	//SG
		} else {
			PartyType = PARTYTYPE.GS;	//GS
		}
	} else if(PartyNum == 1 && GFlag == true && TFlag == false){
		PartyType = PARTYTYPE.G1;		//G1
	} else if(PartyNum == 1 && GFlag == false && TFlag == true){
		PartyType = PARTYTYPE.T1;		//T1
	} else {
		//DebugPrint("Error : " + "BattleCommon_function_" + "Get_SelectionPartyType" + "\n");
		//DebugPrint("PartyNum	: " + PartyNum + "\n");
		//DebugPrint("SFlag		: " + SFlag + "\n");
		//DebugPrint("MFlag		: " + MFlag + "\n");
		//DebugPrint("GFlag		: " + GFlag + "\n");
		//DebugPrint("TFlag		: " + TFlag + "\n");
		ScriptStop()
	}
	
	
	//DebugPrint_FuncName_OUT("Get_SelectionPartyType");
	//DebugPrint("	<=	PartyType	:	" + PartyType);
	return PartyType;
}

//パーティの人数を取得
function Get_PartyNum(AllyFlag)
{
	//DebugPrint_FuncName_IN("Get_PartyNum");
	local Index = []
	local PartyNum = 0;
	for(local i = 0 ; i < 4 ; i++){
		if(AllyFlag == true){
			Index.append(GetAllyIndex_(i));
		} else {
			Index.append(GetEnemyIndex_(i));
		}
		if(GetInitExistType_(Index[i]) != LIVETYPE.NONE){
			PartyNum += 1
		}
	}
	
	//DebugPrint_FuncName_OUT("Get_PartyNum");
	//DebugPrint("	<=	PartyNum	:	" + PartyNum)
	return PartyNum;
}

//エキストラ用のモンスターインデックスの取得
function GetExtra(index, num)
{
	//DebugPrint_FuncName_IN("GetExtra");
	//DebugPrint("	=>	index		:	" + index);
	//DebugPrint("	=>	num			:	" + num);
	local isAlly = IsAlly_(index);
	
	local count = 0;
	
	for(local i = 0; i < 4; i++){
		local search;
		if(isAlly){
			search = GetAllyIndex_(i);
		} else {
			search = GetEnemyIndex_(i);
		}
		if(index != search){
			if(count == num){
				local TypeCheck = GetInitExistType_(search)
				if(TypeCheck != LIVETYPE.ACTIVE){
					search = INVALID_CHARACTER;
				} else {}
				//DebugPrint_FuncName_OUT("GetExtra");
				//DebugPrint("	<= Search	: " + search);
				return search;
			}
			count++;
		}
	}
	//DebugPrint_FuncName_OUT("GetExtra");
}

//エキストラ用のモンスターのVisibleの設定取得
function SetExtraVisible(index)
{
	//DebugPrint_FuncName_IN("SetExtraVisible");
	for(local i = 0;i < 3;i++){
		local extra = GetExtra(index, i);
		if(extra != INVALID_CHARACTER){
			SetVisible_(extra, false);
		}
	}
	//DebugPrint_FuncName_OUT("SetExtraVisible");
}

//物理攻撃用被弾処理
//Target				整数		: 演出対象
//DeleteTaskFlag		TorF		: MissやReflect時ににTaskを消すか？
//TargetKnockBackTask	Task		: 被弾モンスターのMotionTask
//MultiCount			整数		: 複数回行動用
//Vec3					座標		: エフェクトをフィールド設置する際のEmpty座標
//PierceFlag						: 貫通演出判定
//cAction				クラス		: cActionInfo
function SetDamageMotion(Target,DeleteTaskFlag,TargetKnockBackTask,MultiCount,Vec3,PierceFlag,cAction)
{
	local MotionTask;
	//スカウトアタック時は判定を切り替える。
	if(IsScout_()){
		MotionTask = SetDamageMotion_ScoutAttack(MultiCount);
	} else {
		MotionTask = SetDamageMotion_NormalDamage(Target,DeleteTaskFlag,TargetKnockBackTask,MultiCount,Vec3,PierceFlag,cAction)
	}
	
	return MotionTask;
}

// 物理攻撃用被弾処理
function SetDamageMotion_NormalDamage(Target,DeleteTaskFlag,TargetKnockBackTask,MultiCount,Vec3,PierceFlag,cAction)
{
	
	//DebugPrint_FuncName_IN("SetDamageMotion_NormalDamage");
	//DebugPrint("	=>	Target					:	" + Target);
	//DebugPrint("	=>	DeleteTaskFlag			:	" + DeleteTaskFlag);
	//DebugPrint("	=>	TargetKnockBackTask		:	" + TargetKnockBackTask);
	//DebugPrint("	=>	MultiCount				:	" + MultiCount);
	//DebugPrint("	=>	Vec3	_x				:	" + Vec3.x);
	//DebugPrint("	=>		_y					:	" + Vec3.y);
	//DebugPrint("	=>		_z					:	" + Vec3.z);
	//DebugPrint("	=>	PierceFlag				:	" + PierceFlag);
	
	local IndexCount	= 0
	local Attack		= GetActorIndex_(MultiCount);
	local Effect		= GetSingleEffectName_(MultiCount,0);
	local ActHitNum		= GetActHitNum_(MultiCount,IndexCount)
	local SEFlag		= true;
	local MotionFlag	= true;
	local MotionTask	= null
	
	if(PierceFlag == true){
		//貫通演出限定処理
		MotionFlag	= false;
	}
	
	//貫通演出時は特技エフェクトをダメージ時に表示しない
	if(cAction.SingleActEffect0_Name != null && PierceFlag == false){
		MonsterSizeEffect(Target, cAction.SingleActEffect0_Name);
	}
	if(cAction.SingleActEffect1_Name != null && PierceFlag == false){
		MonsterSizeEffect(Target, cAction.SingleActEffect1_Name);
	}
	
	//ダメージ表示
	for(local MultiStageCount = 0 ; MultiStageCount < ActHitNum ; MultiStageCount++){
		local IsMiss	= IsMiss_(MultiCount,IndexCount,MultiStageCount)
		local IsReflect	= IsReflect_(MultiCount,IndexCount)
		if(IsMiss == true){
			//ミスの場合
			if(DeleteTaskFlag == true){
				if(MultiStageCount == 0){
					DeleteTask_(TargetKnockBackTask);
				}
			}
			MotionTask = SetDamageEffectSE(IndexCount,SEFlag,MotionFlag,MultiCount,MultiStageCount,PierceFlag,cAction);
		} else if(IsReflect == true){
			//反射の場合
			if(DeleteTaskFlag == true){
				if(MultiStageCount == 0){
					DeleteTask_(TargetKnockBackTask);
				}
			}
			MotionTask = SetDamageEffectSE(IndexCount,SEFlag,MotionFlag,MultiCount,MultiStageCount,PierceFlag,cAction);
		} else {
			MotionTask = SetDamageEffectSE(IndexCount,SEFlag,MotionFlag,MultiCount,MultiStageCount,PierceFlag,cAction);
		}
		if(ActHitNum > 1 && MultiStageCount != ActHitNum){
			//次のポップ表示までの待機
			Wait_(15);
		}
	}
	
	if(cAction.ActEffectFlag == true){
		Wait_(cAction.EffectFrame_DamageDirectionWait)
	}
	
	local CameraFlag = false;
	//カメラ切り替えが必要な場合はカメラを切り替える
	for(local y = STATUS_TOP ; y < STATUS_NUM ; y += 1){
		local StateFlag = GetStatusFlag_(y,MultiCount,IndexCount)
		local StateValue = GetStatusValue_(y,MultiCount,IndexCount)
		local Target = GetTargetIndex_(MultiCount,IndexCount)
		local NowStateValue = GetMonsterStatusValue_(y,Target)
		//ステータス変化があった場合
		if(StateFlag == true && StateValue != 0){
			if(StateValue > 0){
				if(IsStatusUpCameraChange(y) == true){
					CameraFlag = true;
					DeleteSceneOffset_();
					DeleteAllEffect_();
					CharaStand_Target(CameraFlag,MultiCount);
					Wait_(1);
				}
			} else if(StateValue < 0){
				if(IsStatusDownCameraChange(y) == true){
					CameraFlag = true;
					DeleteSceneOffset_();
					DeleteAllEffect_();
					CharaStand_Target(CameraFlag,MultiCount);
					Wait_(1);
				}
			}
		}
	}
	
	local ReturnParam	= SetAttackStateEffect_Init(IndexCount,MultiCount,cAction)
	local WaitFrame		= ReturnParam[0]
	local MotionTask	= ReturnParam[1]
	
	if(WaitFrame != 0){
		if(CameraFlag = true){
			Wait_(WaitFrame);
		} else {
			Wait_(WaitFrame/2);
		}
	}
	
	//例外判定
	SetDamageMotionEffect_ExceptionEffect(MultiCount,cAction)
	
	return MotionTask;
	
	//DebugPrint_FuncName_OUT("SetDamageMotion_NormalDamage");
}

// 物理攻撃用被弾処理
/*
function SetDamagePierceMotion_NormalDamage(Target,DeleteTaskFlag,TargetKnockBackTask,MultiCount,Vec3,cAction)
{
	
	//DebugPrint_FuncName_IN("SetDamageMotion");
	//DebugPrint("	=>	Target					:	" + Target);
	//DebugPrint("	=>	DeleteTaskFlag			:	" + DeleteTaskFlag);
	//DebugPrint("	=>	TargetKnockBackTask		:	" + TargetKnockBackTask);
	//DebugPrint("	=>	MultiCount				:	" + MultiCount);
	//DebugPrint("	=>	Vec3	_x				:	" + Vec3.x);
	//DebugPrint("	=>		_y					:	" + Vec3.y);
	//DebugPrint("	=>		_z					:	" + Vec3.z);
	//DebugPrint("BattleCommon_LoadParamIN_function_" + "SetDamageMotion");
	local IndexCount	= 0
	local Attack		= GetActorIndex_(MultiCount);
	local Effect		= GetSingleEffectName_(MultiCount,0);
	local ActHitNum		= GetActHitNum_(MultiCount,IndexCount)
	local SEFlag		= false;
	local MotionFlag	= false;
	
	//耐性連携表示
	SetTolerChainRate_(MultiCount)
	
	//ダメージ表示
	for(local MultiStageCount = 0 ; MultiStageCount < ActHitNum ; MultiStageCount++){
		local IsMiss	= IsMiss_(MultiCount,IndexCount,MultiStageCount)
		local IsReflect	= IsReflect_(MultiCount,IndexCount)
		if(IsMiss == true){
			//ミスの場合
			if(DeleteTaskFlag == true){
				if(MultiStageCount == 0){
					DeleteTask_(TargetKnockBackTask);
				}
			}
			SetDamageEffectSE(IndexCount,SEFlag,MotionFlag,MultiCount,MultiStageCount,PierceFlag,cAction);
		} else if(IsReflect == true){
			//反射の場合
			if(DeleteTaskFlag == true){
				if(MultiStageCount == 0){
					DeleteTask_(TargetKnockBackTask);
				}
			}
			SetDamageEffectSE(IndexCount,SEFlag,MotionFlag,MultiCount,MultiStageCount,PierceFlag,cAction);
		} else {
			SetDamageEffectSE(IndexCount,SEFlag,MotionFlag,MultiCount,MultiStageCount,PierceFlag,cAction);
		}
		if(ActHitNum > 1 && MultiStageCount != ActHitNum){
			//次のポップ表示までの待機
			Wait_(15);
		}
	}
	
	if(cAction.ActEffectFlag == true){
		Wait_(cAction.EffectFrame)
	}
	
	//カメラ切り替えが必要な場合はカメラを切り替える
	for(local y = STATUS_TOP ; y < STATUS_NUM ; y += 1){
		local StateFlag = GetStatusFlag_(y,MultiCount,IndexCount)
		local StateValue = GetStatusValue_(y,MultiCount,IndexCount)
		local Target = GetTargetIndex_(MultiCount,IndexCount)
		local NowStateValue = GetMonsterStatusValue_(y,Target)
		//ステータス変化があった場合
		if(StateFlag == true && StateValue != 0){
			if(StateValue > 0){
				if(IsStatusUpCameraChange(y) == true){
					local CameraFlag = true;
					DeleteSceneOffset_();
					DeleteAllEffect_();
					CharaStand_Target(CameraFlag,MultiCount);
					Wait_(1);
				}
			} else if(StateValue < 0){
				if(IsStatusDownCameraChange(y) == true){
					local CameraFlag = true;
					DeleteSceneOffset_();
					DeleteAllEffect_();
					CharaStand_Target(CameraFlag,MultiCount);
					Wait_(1);
				}
			}
		}
	}
	
	local ReturnParam = SetAttackStateEffect_Init(IndexCount,MultiCount,cAction)
	local WaitFrame		= ReturnParam[0]
	local MotionTask	= ReturnParam[1]
	
	if(WaitFrame != 0){
		Wait_(WaitFrame);
	}
	
	//例外判定
	SetDamageMotionEffect_ExceptionEffect(MultiCount,cAction)
	
	//DebugPrint_FuncName_OUT("SetDamageMotion");
}*/


// 物理ダメージ後、Wait演出
function SetDamageMotion_EndWait(Wait00,Effect,Wait01)
{
	//DebugPrint_FuncName_IN("SetDamageMotion_EndWait");
	//DebugPrint("	=>	Wait00		:" + Wait00)
	//DebugPrint("	=>	Effect		:" + Effect)
	//DebugPrint("	=>	Wait01		:" + Wait01)
	
	SetApealPoint_Init(false)
	Wait00 = Wait00 / 2;
	Wait01 = Wait01 / 2;
	
	//スカウトアタックの場合、Waitを設定しない。
	if(IsScout_() == false){
		Wait_(Wait00);
		if(Effect != null){DeleteEffectEmitter_(Effect);}
		Wait_(Wait01);
	} else {
		Wait_(10)
	}
	
	//アピールポイントの表示待機
	for(local i = 0 ; i < 10 ; i++){
		if(IsEndAppealPointAnim_() == true){
			Wait_(10);
			break;
		} else {
			Wait_(1)
			i = 0;
		}
	}
	
	//DebugPrint_FuncName_OUT("SetDamageMotion_EndWait");
}

// 連続攻撃用物理被弾演出
function SetDamageMotion_Rush(Attack,Target,TargetAngle,MultiCount,MultiStageCount,SandEffect)
{
	//DebugPrint_FuncName_IN("SetDamageMotion_Rush");
	//DebugPrint("	=>	Attack				:	" + Attack);
	//DebugPrint("	=>	Target				:	" + Target);
	//DebugPrint("	=>	TargetAngle			:	" + TargetAngle);
	//DebugPrint("	=>	MultiCount			:	" + MultiCount);
	//DebugPrint("	=>	MultiStageCount		:	" + MultiStageCount);
	//DebugPrint("BattleCommon_LoadParamIN_function_SetDamageMotion_Rush");
	local cAction = cActionInfo(MultiCount);
	//Debug_cActionPrint(cAction)
	
	local cMonster = cTargetMonsterInfo(Target,MultiCount);
	local SEFlag = true;
	local MotionFlag = true;
	local SingleEffectName = GetSingleEffectName_(MultiCount,0);
	local ActionNum = GetActionNum_();
	local IndexCount = 0;	//対象は単体なので、現状０固定
	local MotionTask = null;
	local ActHitNum = GetActHitNum_(MultiCount,IndexCount);
	local WaitValue = 0;
	
	//耐性連携表示
	//SetTolerChainRate_(MultiCount)
	
	Wait_(5);
	if(cAction.SingleActEffect0_Name != null){
			MonsterSizeEffect(Target , cAction.SingleActEffect0_Name)
	}
	if(cAction.SingleActEffect1_Name != null){
		MonsterSizeEffect(Target , cAction.SingleActEffect1_Name)
	}
	
	SetDir_(Target, TargetAngle);
	for(MultiStageCount ; MultiStageCount < ActHitNum ; MultiStageCount++){
		if(MotionTask != null){DeleteTask_(MotionTask)}
		MotionTask = SetDamageEffectSE(IndexCount,SEFlag,MotionFlag,MultiCount,MultiStageCount,false,cAction);
		Wait_(1);
	}
	
	//例外判定：ふんばり系
	SetExceptionEffect_HoldOn(MultiCount,IndexCount,false,cAction)	
	
	if(GetActionNum_() != MultiCount + 1){
		//最終段以外
		DeleteEffectEmitter_(SandEffect);
		WaitValue = SetAttackStateEffect_Init(IndexCount,MultiCount,cAction);
		if(WaitValue != 0){
			Wait_(1);
		}
		//最終段以外ではモーションタスクを削除しておく
		//if(MotionTask != null){DeleteTask_(MotionTask);}
	} else {
		//最終段
		SetApealPoint_Init(false)
		DeleteEffectEmitter_(SandEffect);
		Wait_(35);
		//local cAction = cActionInfo(MultiCount);
		local ReParam = SetAttackStateEffect_Init(IndexCount,MultiCount,cAction);
		WaitValue = ReParam[0]
		local MotionTask = ReParam[1]
		if(WaitValue != 0){
			Wait_(WaitValue);
		}
		
		//例外判定・蘇生系
		SetExceptionEffect_Rezaoral(MultiCount,IndexCount,true,cAction)
		
		//アピールポイント処理
		for(local i = 0 ; i < 10 ; i++){
			if(IsEndAppealPointAnim_() == true){
				Wait_(15)
				return;
		} else {
				Wait_(1)
				i = 0;
			}
		}
	}
	
	return MotionTask;
	
	//DebugPrint_FuncName_OUT("SetDamageMotion_Rush");
}



//カットイン演出チェック
function SpecialCutCheck(MultiCount){
	local AllEffect0 = GetAllEffectName_(MultiCount,0)
	switch(AllEffect0)
	{
	case "EF213_19_GOD_HAND":
		SpecialCut_GODHAND()
		break;
	case "EF213_21_ABYSS_HAND":
		SpecialCut_ABYSSHAND()
		break;
	case "EF213_23_JUDGMENT":
		SpecialCut_JUDGMENT()
		break;
	default:
		//パルプンテの場合
		if(IsPalpnte_(MultiCount)){
			SpecialCut_PARUPUNTE()
		}
		
		//通常時は何もしない
		break;
	}
}

//GODHAND専用カット
function SpecialCut_GODHAND()
{
	//開始時にタスク系を一通り削除
	CutReset();
	ChangeIndexPointData_(BATTLE_COMMON_POINT_DATA);
	SetPointWorldEffect_("EF213_19_GOD_HAND","pos_SpecialCut_GODHAND")
	SetPointWorldEffect_("EF213_20_GOD_HAND_M","pos_SpecialCut_GODHAND")
	Task_AnimeMoveCamera_("camera_999_GODHAND","camtgt_999_GODHAND")
	Wait_(65)
	//終了時にもタスク系を一通り削除
	CutReset();
}

//ABYSSHAND専用カット
function SpecialCut_ABYSSHAND()
{
	CutReset();
	ChangeIndexPointData_(BATTLE_COMMON_POINT_DATA);
	SetPointWorldEffect_("EF213_21_ABYSS_HAND","pos_SpecialCut_ABYSSHAND")
	SetPointWorldEffect_("EF213_22_ABYSS_HAND_M","pos_SpecialCut_ABYSSHAND")
	Task_AnimeMoveCamera_("camera_999_ABYSSHAND","camtgt_999_ABYSSHAND")
	StartEarthQuake_(50, 3, 3);
	Wait_(50);
	StopEarthQuake_();
	CutReset();
}

//JUDGMENT専用カット
function SpecialCut_JUDGMENT()
{
	CutReset();
	ChangeIndexPointData_(BATTLE_COMMON_POINT_DATA);
	SetPointWorldEffect_("EF213_23_JUDGMENT","pos_SpecialCut_JUDGMENT")
	SetPointWorldEffect_("EF213_24_JUDGMENT_M","pos_SpecialCut_JUDGMENT")
	Task_AnimeMoveCamera_("camera_999_JUDGMENT","camtgt_999_JUDGMENT")
	StartEarthQuake_(20, 3, 3);
	Wait_(20)
	StopEarthQuake_();
	StartEarthQuake_(20, 4, 4);
	Wait_(20)
	StopEarthQuake_();
	StartEarthQuake_(60, 5, 5);
	Wait_(60)
	CutReset()
}

function SpecialCut_PARUPUNTE()
{
	CutReset();
	//ChangeIndexPointData_(BATTLE_COMMON_POINT_DATA);
	CharaStand_Action(0,true);
	EffParamSizeEffect(GetActorIndex_(0),"EF130_45_PARUPUNTE");
	Wait_(45)
}

//シーン設定をリセット
function CutReset()
{
	DeleteAllTask_()
	DeleteAllEffect_();
	StopEarthQuake_();
	for(local i = 0; i < 4 ; i++){
		local Ally	= GetAllyIndex_(i);
		local Enemy	= GetAllyIndex_(i);
		SetVisible_(Ally, false); 
		SetVisible_(Enemy, false); 
	}
}

//絶対値を取得
function SetAbsoluteValue(Value)
{
	//DebugPrint_FuncName_IN("SetAbsoluteValue");
	//DebugPrint("	=>	Value : " + Value);
	local AbsValue = 0;
	if(Value <0 ){
		for(local i = 0 ; i > Value ; i--){
			AbsValue++
		}
		Value = AbsValue;
	} else {
		Value = AbsValue;
	}
	
	//DebugPrint_FuncName_OUT("SetAbsoluteValue");
	//DebugPrint("	<=	AbsValue	:	" + AbsValue);
	return AbsValue;
}

//今回の最大連続数を取得
function GetMaxActHitNum(MultiCount)
{
	//DebugPrint_FuncName_IN("GetMaxActHitNum");
	//DebugPrint("	=>	MultiCount : " + MultiCount);
	local ActHitNum		= 0;
	local MaxActHitNum	= 0;
	local TargetNum		= GetTargetNum_(MultiCount)
	
	for(local i = 0 ; i < TargetNum ; i++){
		local ActHitNum	= GetActHitNum_(MultiCount,i)
		if(ActHitNum > MaxActHitNum){
			MaxActHitNum = ActHitNum ;//連続回数を合わせる
		}
	}
	
	//DebugPrint_FuncName_OUT("GetMaxActHitNum");
	//DebugPrint("	<=	MaxActHitNum : " + MaxActHitNum);
	return MaxActHitNum;
}


//行動名表示メッセージウィンドウ処理
function ShowActionMessage(MultiCount,NameVisibleFlag)
{
	//DebugPrint_FuncName_IN("ShowActionMessage");
	//DebugPrint("	=>	MultiCount		: " + MultiCount);
	//DebugPrint("	=>	NameVisibleFlag	: " + NameVisibleFlag);
	//MultiCoun			: 何回目の行動か？
	//NameVisibleFlag	: １回目の行動限定で行動名を表示するか？
	local ActionNum = GetActionNum_();
	
	if(IsScout_()){
		//スカウト時には行動名を表示しない
	} else {
		//行動名を表示する
		if(ActionNum == 1){
			if(NameVisibleFlag == true){
				StartCombo_(MultiCount);
			} else {
				ShowActionName_(MultiCount)
			}
		} else {
			if(MultiCount == 0){
				StartCombo_(MultiCount);
			} else {
				AddActionName_(MultiCount);
			}
			//SetTolerChainRate_(MultiCount);
		}
	}
	
	local UsedMP = GetUseMp_(MultiCount);
	local ActorIndex = GetActorIndex_(MultiCount);
	SetMpDamage_(ActorIndex, UsedMP);
	
	//local ListStart =	"----- UserMP ------"
	//local ListFront =	null
	//local List =			["ActorIndex"		,	ActorIndex
	//						,"UsedMP"		,	UsedMP
	//						]
	//local ListEnd =		null
	//DebugPrint_OneList(List , ListStart , ListEnd , ListFront)
	
	
	SetTolerChainRate_(MultiCount)
	
	//行動名表示に合わせて下画面のモンスターアイコンを揺らす
	ShowActionMessage_IconAnimation(MultiCount,ActorIndex)
	
	//行動名表示に合わせて下画面の矢印アイコンを消す
	if(IsScout_()){
		//スカウトアタックの場合は矢印を消さない
	} else {
		UnSettingAllowTarget_(ActorIndex);
	}
	//DebugPrint_FuncName_OUT("ShowActionMessage");
}

//行動名表示メッセージウィンドウ処理（矢印なし）
function ShowActionMessage_NoAllow(MultiCount,NameVisibleFlag)
{
	//DebugPrint_FuncName_IN("ShowActionMessage_NoAllow");
	//DebugPrint("	=>	MultiCount		: " + MultiCount);
	//DebugPrint("	=>	NameVisibleFlag	: " + NameVisibleFlag);
	//MultiCoun			: 何回目の行動か？
	//NameVisibleFlag	: １回目の行動限定で行動名を表示するか？
	local ActionNum = GetActionNum_();
	if(ActionNum == 1){
		if(NameVisibleFlag == true){
			StartCombo_(MultiCount);
		} else {
			StartCombo_(MultiCount);
		}
	} else {
		if(MultiCount == 0){
			StartCombo_(MultiCount);
		} else {
			AddActionName_(MultiCount);
		}
	}
	
	SetTolerChainRate_(MultiCount);
	
	//行動者がマスター以外の場合、行動名の表示に合わせてMP消費を行う
	local UsedMP = GetUseMp_(MultiCount);
	local ActorIndex = GetActorIndex_(MultiCount);
	local IsMaster = IsMaster_(ActorIndex)
	if(IsMaster == false){
		SetMpDamage_(ActorIndex, UsedMP);
	}
	
	//行動名表示に合わせて下画面のモンスターアイコンを揺らす
	if(IsMaster == false){
		ShowActionMessage_IconAnimation(MultiCount,ActorIndex)
	}
	
	//DebugPrint_FuncName_OUT("ShowActionMessage_NoAllow");
}

//行動に合わせたモンスターアイコンのアニメーション
function ShowActionMessage_IconAnimation(MultiCount,Actor)
{
	//DebugPrint_FuncName_IN("ShowActionMonster_IconAnimetion");
	//DebugPrint("	=>	MultiCount		: " + MultiCount);
	//DebugPrint("	=>	Actor	: " + Actor);
	
	if(IsScout_()){
		//スカウトアタック時は行動者アイコンを物理タイプで揺らす
		PlayIconAttackAnim_(Actor);
	} else {
		local Efficacy = GetActionEfficacy_(MultiCount);
		switch(Efficacy)
		{
		case EFFICACY.ATTACK:
		case EFFICACY.WEAK:
				PlayIconAttackAnim_(Actor);
				break;
		case EFFICACY.SUPPORT:
		case EFFICACY.HEAL:
				PlayIconHealAndSupportAnim_(Actor);
				break;
		case EFFICACY.NONE:
		case EFFICACY.DEFENSE:
		case EFFICACY.OTHER:
				break;
		default:
			//何もない場合は何もしない
			break;
		
		}
	}
	
	//DebugPrint_FuncName_OUT("ShowActionMonster_IconAnimetion");
}

//魔力の暴走演出
function MagicRunawayQuake(MultiCount)
{
	local Category			= GetActionCategory_(MultiCount)
	local TargetNum			= GetTargetNum_(MultiCount)
	local CriticalFlag		= false
	
	//魔法以外では発生させない
	if(Category != CATEGORY.SPELL){return;}
	
	for(local IndexCount = 0 ; IndexCount < TargetNum ; IndexCount++){
		for(local MultiStageCount = 0 ; MultiStageCount < GetActHitNum_(MultiCount,IndexCount) ; MultiStageCount++){
			if(CriticalFlag == false){
				CriticalFlag = IsCritical_(MultiCount , IndexCount , MultiStageCount)
			}
		}
	}
	
	if(CriticalFlag != true){return;}
	
	//魔力の暴走演出
	AddBattleOtherMessage_(59)
	StartEarthQuake_(30, 10, 5);
}

//指定した位置にモンスターの配置（Indexがない場合は非表示、死亡時はα値を0で配置）
function SetMonster_Empty(Monster,Empty,Rotate)
{
	//DebugPrint_FuncName_IN("SetMonster_Empty");
	//DebugPrint("	=>	Monster		: " + Monster);
	//DebugPrint("	=>	Empty		: " + Empty);
	//DebugPrint("	=>	Rotate		: " + Rotate);
	local MonsterType = GetInitExistType_(Monster);
	
	if(Monster != INVALID_CHARACTER){
		//モンスター存在時の共通箇所
		if(MonsterType != LIVETYPE.NONE){
			Task_AnimeMoveCharNoDir_(Monster, Empty);
			SetVisible_(Monster, true);
			SetMotion_(Monster, MOT_WAIT, 0);
			if(Rotate != null){
				SetDir_(Monster, Rotate);
			}
		}
		if(MonsterType == LIVETYPE.ACTIVE){
			//モンスター生存時の処理
			SetAlpha_(Monster, 1.0);
		} else if (MonsterType == LIVETYPE.INACTIVE){
			//DebugPrint("Monster is Dead : " + Monster + "\n")
			//モンスター死亡時の処理;
			SetAlpha_(Monster, 0.0);
		}
		//Debug_EmptyPrint(Monster,Empty,Rotate)
		
	}
	
	//DebugPrint_FuncName_OUT("SetMonster_Empty");
}

//指定した位置にマスターの配置
function SetMaster_Empty(Master,Empty,Rotate)
{
	//DebugPrint_FuncName_IN("SetMaster_Empty");
	//DebugPrint("	=>	Master		: " + Master);
	//DebugPrint("	=>	Empty		: " + Empty);
	//DebugPrint("	=>	Rotate		: " + Rotate);
	
	//local ArgList =	["Master"	,	Master
	//				,"Empty"	,	Empty
	//				,"Rotate"	,	Rotate
	//				]
	//DebugPrint_functionParam("SetMaster_Empty" , ArgList)
	
	//マスターの設置（ライド中は現状判定がないので無効）
	local RideFlag = false;
	local AllyFlag = true;
	
	if(IsAlly_(Master)){
		AllyFlag = true;
	} else {
		AllyFlag = false;
	}
	
	for(local i = 0 ; i < 4 ; i++){
		if(RideFlag == false){
			if(AllyFlag == true){
				RideFlag = IsRide_(GetAllyIndex_(i))
			} else {
				RideFlag = IsRide_(GetEnemyIndex_(i))
			}
		}
	}
	
	
	if(RideFlag == false){
		Task_AnimeMoveCharNoDir_(Master, Empty);
		SetVisible_(Master, true);
		SetMotion_(Master, MOT_BATTLE_WAIT, 0);
		if(Rotate != null){
			SetDir_(Master, Rotate);
		}
	}
	//DebugPrint_FuncName_OUT("SetMaster_Empty");
}

//戦闘演出例外チェック（開始時）
function Exception_1stCheck(MultiCount,SingleAttackFlag,cAction)
{
	//DebugPrint_FuncName_IN("Exception_1stCheck");
	//print("ExecMissType" + GetExecMissType_() + "\n");
	switch(GetExecMissType_())
	{
	case EXEC_MISS_TYPE.NONE:
		//異常がない場合、みがわりチェックを行う
		if(SingleAttackFlag == true){
			SubstituteCheck_Init(MultiCount,SingleAttackFlag,cAction)	//みがわりか？
		}
		break;
	case EXEC_MISS_TYPE.LACK_MP:		//MP切れの場合
		Exception_MPLack_Init(MultiCount,cAction)
		break;
	case EXEC_MISS_TYPE.MIST:			//霧状態の場合
		Exception_Mist_Init(MultiCount,cAction)
		break;
	case EXEC_MISS_TYPE.MISS:			//失敗の場合
		Exception_Miss_Init(MultiCount,cAction)
		break;
	case EXEC_MISS_TYPE.DIFFERENT_SIZE:	//サイズ違いの場合
	case EXEC_MISS_TYPE.AES_MISS:		//対象がAESの行動がミスだった場合
		break;
	case EXEC_MISS_TYPE.LACK_TS:		//テンション不足の場合
		Exception_TSLack_Init(MultiCount,cAction)
		break;
	default:
		break;
	}
	if(SingleAttackFlag == true){
		Exception_2ndCheck(MultiCount,SingleAttackFlag,cAction)
	}
	//DebugPrint_FuncName_OUT("Exception_1stCheck");
}

//戦闘演出例外チェック（正面カット前）
function Exception_2ndCheck(MultiCount,SingleAttackFlag,cAction)
{
	if(SingleAttackFlag == false){
		//それ以外はここでみがわりチェックを行う。
		SubstituteCheck_Init(MultiCount,SingleAttackFlag,cAction)
	}
}

//行動失敗・ＭＰ切れ演出
function Exception_MPLack_Init(MultiCount,cAction)
{
	//DebugPrint_FuncName_IN("Exception_MPLack_Init");
	//DebugPrint("	=>	MultiCount		: " + MultiCount);
	
	//必要なクラスを呼び出す
	local Actor = GetActorIndex_(MultiCount);
	
	local CharaStand_Select = "Action"
	local CameraFlag = true;
	CharaStand(CharaStand_Select , CameraFlag , gMultiCount,cAction);
	//技名の表示
	ShowActionMessage(MultiCount, true);
	SetMotion_(Actor , MOT_SWORD_START , 4);
	Wait_(15);
	SetMotion_(Actor , MOT_SWORD_CHARGE , 4);
	Wait_(30);
	SetMotion_(Actor , MOT_SWORD_EXERCISE , 4);
	Wait_(5);
	DeleteAllActionName_();
	ShowBattleEventMessage_(IsAlly_(Actor), 9);
	Wait_(50);
	
	BatteleScript_End();
	
	//DebugPrint_FuncName_OUT("Exception_MPLack_Init");
}

//行動失敗・霧演出
function Exception_Mist_Init(MultiCount,cAction)
{
	//DebugPrint_FuncName_IN("Exception_Mist_Init");
	//DebugPrint("	=>	MultiCount		: " + MultiCount);
	
	//必要なクラスを呼び出す
	local Actor = GetActorIndex_(MultiCount);
	
	local CharaStand_Select = "Action"
	local CameraFlag = true;
	CharaStand(CharaStand_Select , CameraFlag , gMultiCount,cAction);
	//技名の表示
	ShowActionMessage(MultiCount,true);
	SetMotion_(Actor , MOT_SWORD_START , 4);
	Wait_(15);
	SetMotion_(Actor , MOT_SWORD_CHARGE , 4);
	Wait_(30);
	SetMotion_(Actor , MOT_SWORD_EXERCISE , 4);
	Wait_(5);
	DeleteAllActionName_();
	ShowBattleEventMessage_(IsAlly_(Actor), 10);
	Wait_(50);
	
	BatteleScript_End();
	
	//DebugPrint_FuncName_OUT("Exception_Mist_Init");
}

//行動失敗・ミス演出
function Exception_Miss_Init(MultiCount,cAction)
{
	//DebugPrint_FuncName_IN("Exception_Miss_Init");
	//DebugPrint("	=>	MultiCount		: " + MultiCount);
	
	//必要なクラスを呼び出す
	local Actor = GetActorIndex_(MultiCount);
	
	local CharaStand_Select = "Action"
	local CameraFlag = true;
	CharaStand(CharaStand_Select , CameraFlag , gMultiCount,cAction);
	//技名の表示
	local NameVisibleFlag = true;
	ShowActionMessage(MultiCount,true);
	SetMotion_(Actor , MOT_SWORD_START , 4);
	Wait_(15);
	SetMotion_(Actor , MOT_SWORD_CHARGE , 4);
	Wait_(30);
	SetMotion_(Actor , MOT_SWORD_EXERCISE , 4);
	Wait_(5);
	DeleteAllActionName_();
	ShowBattleEventMessage_(IsAlly_(Actor), 13);
	Wait_(50);
	
	BatteleScript_End();
	
	//DebugPrint_FuncName_OUT("Exception_Miss_Init");
}

//行動失敗・テンション不足演出
function Exception_TSLack_Init(MultiCount,cAction)
{
	//DebugPrint_FuncName_IN("Exception_Miss_Init");
	//DebugPrint("	=>	MultiCount		: " + MultiCount);
	
	//必要なクラスを呼び出す
	local Actor = GetActorIndex_(MultiCount);
	
	local CharaStand_Select = "Action"
	local CameraFlag = true;
	CharaStand(CharaStand_Select , CameraFlag , gMultiCount,cAction);
	//技名の表示
	local NameVisibleFlag = true;
	ShowActionMessage(MultiCount,true);
	SetMotion_(Actor , MOT_SWORD_START , 4);
	Wait_(15);
	SetMotion_(Actor , MOT_SWORD_CHARGE , 4);
	Wait_(30);
	SetMotion_(Actor , MOT_SWORD_EXERCISE , 4);
	Wait_(5);
	DeleteAllActionName_();
	ShowBattleEventMessage_(IsAlly_(Actor), 584);
	Wait_(50);
	
	BatteleScript_End();
	
	//DebugPrint_FuncName_OUT("Exception_Miss_Init");
}

//みがわり演出・単体攻撃判定
//SingleAttackFlag		: 物理単体攻撃判定
function SubstituteCheck_Init(MultiCount , SingleAttackFlag , cAction)
{
	//DebugPrint_FuncName_IN("SubstituteCheck_Init");
	//DebugPrint("	=>	MultiCount				: " + MultiCount);
	//DebugPrint("	=>	SingleAttackFlag		: " + SingleAttackFlag);
	local NameVisibleFlag	= true;
	local Actor				= GetActorIndex_(MultiCount)
	
	//みがわりの演出が発生しない場合は戻る
	local SubstituteFlag	= false;
	if(SubstituteFlag == false){
		//DebugPrint_FuncName_OUT("SubstituteCheck_Init");
		return;
	}
	
	if(SingleAttackFlag == true){
		//単体物理攻撃時演出
		CharaStand_Action(0,true)
		ShowActionMessage(MultiCount,NameVisibleFlag)
		SpellCastEffect(Actor,MultiCount)
		SetMotion_(cAction.Attack , MOT_SWORD_START , 4)
		Wait_(15);
		SetMotion_(cAction.Attack , MOT_SWORD_CHARGE , 4)
		Wait_(30);
		SetMotion_(cAction.Attack , MOT_SWORD_EXERCISE , 4)
		SetCameraEffect_("EF000_03_SHUCHUSEN", 100);
		Wait_(30);
	} else {
		//それ以外
	}
	
	//被弾処理は共通
	local CameraFlag		= true;
	CharaStand_Substitute(CameraFlag,MultiCount);
	local MultiStageCount	= 0;
	local WaitFlag			= true;
	Wait_(1);	//キャラ・カメラ配置待ち
	LineEffect_Substitute(MultiCount,MultiStageCount,cAction,WaitFlag)
	//みがわり時はこの処理をもってScriptを終了する。
	BatteleScript_End();
	
	//DebugPrint_FuncName_OUT("SubstituteCheck_Init");
}


//特技詠唱用Effect
function SpellCastEffect(Actor,MultiCount)
{
	//DebugPrint_FuncName_IN("SpellCastEffect");
	//DebugPrint("	=>	Actor		: " + Actor);
	//DebugPrint("	=>	MultiCount		: " + MultiCount);
	local Category = GetActionCategory_(MultiCount)
	local IsTokugi = IsTokugi_(MultiCount)
	
	if(IsTokugi == true){
		switch (Category)
		{
		case CATEGORY.NONE:
			//通常攻撃の場合、何もしない
			break;
		case CATEGORY.PHYSICAL	:
			EffParamSizeEffect(Actor,"EF000_02_SKILL_ARIA")
			break;
		case CATEGORY.SPELL		:
			EffParamSizeEffect(Actor,"EF000_01_MAGIC_ARIA")
			//ReplaySE_("SE_SHA_002");
			break;
		case CATEGORY.ARTS	:
			EffParamSizeEffect(Actor,"EF000_02_SKILL_ARIA")
			break;
		case CATEGORY.BREATH		:
			EffParamSizeEffect(Actor,"EF000_02_SKILL_ARIA")
			break;
		case CATEGORY.DANCE		:
			EffParamSizeEffect(Actor,"EF000_02_SKILL_ARIA")
			break;
		case CATEGORY.FEAT		:
			break;
		case CATEGORY.ITEM		:
			break;
		case CATEGORY.OTHER		:
			break;
		default:
			//何もない場合は何もしない
		}
	} else {}
	
	//DebugPrint_FuncName_OUT("SpellCastEffect");
}

//スクリプト開始時・チェック
function ScriptStartCheck()
{
	//スカウトチェック
	ScoutStartCheck();
	
	
	
}
//行動開始・スカウトチェック
function ScoutStartCheck()
{
	//DebugPrint_FuncName_IN("ScoutStartCheck");
	if(IsScout_() != true){
		//DebugPrint_FuncName_OUT("ScoutStartCheck");
		return;
	}
	
	//画面の表示切り替え
	if(IsScout_()){
		//初期値の値の代入（未作成）
		SetVisibleScoutGauge_(true);
		ScoutAttackPrint(0)
		FilterOn_(0, 0, 0, 100);
	}
	
	//画面エフェクトの表示（未作成）
	//DebugPrint_FuncName_OUT("ScoutStartCheck");
}

//スカウトアタック用値参照
function ScoutAttackPrint(MultiCount)
{	
	local MultiStageCount = 0;
	//DebugPrint("<<<<<<< ScoutAttackPrint >>>>>>>>"  + "\n")
	//DebugPrint("IsScout_()					: " + IsScout_() + "\n")
	//DebugPrint("GetScoutDamageValue_()		: " + GetScoutDamageValue_(MultiCount) + "\n")
	//DebugPrint("IsScoutSuccess_()			: " + IsScoutSuccess_() + "\n")
	//DebugPrint("GetActHitNum_(MultiCount,0)	: "	 + GetActHitNum_(MultiCount,0) + "\n")
}

//スカウトアタックダメージ判定
function SetDamageMotion_ScoutAttack(MultiCount)
{
	//DebugPrint_FuncName_IN("SetDamageMotion_ScoutAttack");
	//DebugPrint("	=>	MultiCount		:" + MultiCount)
	
	if(IsScout_() != true){
		//DebugPrint_FuncName_OUT("SetDamageMotion_ScoutAttack");
		return;
	}
	
	local MotionTask			= null;
	local MaxActHitNum			= GetActHitNum_(MultiCount,0)
	local FirstScoutDamageFlag	= true;	//スカウトダメージが１回目の場合
	local MotionTask			= null;
	
	//スカウトダメージ演出
	for(local MultiStageCount = 0 ; MultiStageCount < 1; MultiStageCount++){
		//連続特性で既にモーションタスクが設定された場合は破棄する
		if(MotionTask != null){
			DeleteTask_(MotionTask);
		}
		//ダメージ判定
		if(IsCritical_(MultiCount, 0 ,MultiStageCount)){
			//クリティカル演出
			MotionTask = SetScoutDamageMotion_Critical(MultiCount,MultiStageCount)
			SetScoutDamageMotion_UIEffect(MultiCount,FirstScoutDamageFlag)
		} else if(IsMiss_(MultiCount, 0 ,MultiStageCount)){
			//ミス演出
			MotionTask = SetScoutDamageMotion_Miss(MultiCount,MultiStageCount)
		} else {
			//通常ダメージ演出
			MotionTask = SetScoutDamageMotion_NormalDamage(MultiCount,MultiStageCount)
			SetScoutDamageMotion_UIEffect(MultiCount,FirstScoutDamageFlag)
		}
	}
	
	return MotionTask;
	//DebugPrint_FuncName_OUT("SetDamageMotion_ScoutAttack");
}

//スカウトアタック：ＧＴサイズ版
//MultiCount		: 何回目の行動か？
function LineEffect_ScoutAttack(MultiCount)
{
	//DebugPrint_FuncName_IN("LineEffect_ScoutDamage");
	//DebugPrint("	=>	MultiCount		:" + MultiCount)
	
	if(IsScout_() != true){
		//DebugPrint_FuncName_OUT("LineEffect_ScoutDamage");
		return;
	}
	
	//スカウト対象配置
	DeleteAllTask_();
	CharaStand_ScoutTarget()
	local Target = GetTargetIndex_(0,0)
	Wait_(15)
	
	local MotionTask = null
	local MaxActHitNum = GetActHitNum_(MultiCount,0)
	local FirstScoutDamageFlag = true
	//スカウトダメージ演出
	for(local MultiStageCount = 0 ; MultiStageCount < MaxActHitNum; MultiStageCount++){
		//連続特性で既にモーションタスクが設定された場合は破棄する
		if(MotionTask != null){
			DeleteTask_(MotionTask);
		}
		//ダメージ判定
		if(IsCritical_(MultiCount,0,MultiStageCount)){
			//クリティカル演出
			MotionTask = SetScoutDamageMotion_Critical(MultiCount,MultiStageCount)
			SetScoutDamageMotion_UIEffect(MultiCount,FirstScoutDamageFlag)
		} else if(IsMiss_(MultiCount,0,MultiStageCount)){
			//ミス演出
			SetScoutDamageMotion_Miss(MultiCount,MultiStageCount)
		} else {
			//通常ダメージ演出
			MotionTask = SetScoutDamageMotion_NormalDamage(MultiCount,MultiStageCount)
			SetScoutDamageMotion_UIEffect(MultiCount,FirstScoutDamageFlag)
		}
		FirstScoutDamageFlag = false
	}
	
	Wait_(30)
	
	//DebugPrint_FuncName_OUT("LineEffect_ScoutDamage");
}

//スカウトアタック・クリティカル演出
//MultiCount		: 何回目の行動か？
//MultiStageCount	: 何段目の攻撃か？
//-----戻り値----
//MotionTask		: 被弾モーションのタスク番号
function SetScoutDamageMotion_Critical(MultiCount,MultiStageCount)
{
	//DebugPrint_FuncName_IN("SetScoutDamageMotion_Critical");
	//DebugPrint("	=>	MultiCount			:" + MultiCount)
	//DebugPrint("	=>	MultiStageCount		:" + MultiStageCount)
	
	local Target		= GetTargetIndex_(MultiCount,0)
	local Actor			= GetActorIndex_(MultiCount)
	local MotionTask	= null;
	
	EffParamSizeEffect(Target,"EF010_02_HIT_KAISHIN");
	EffParamSizeEffect(Target,"EF000_08_SA_ATTACK");
	
	StartEarthQuake_(20, 5, 10);
	SetMotion_(Target, MOT_DAMAGE, 4);
	MotionTask = Task_ChangeMotion_(Target, MOT_WAIT, 4);
	
	return MotionTask;
	//DebugPrint_FuncName_OUT("SetScoutDamageMotion_Critical");
	//DebugPrint("	<=	MotionTask			:" + MotionTask)
}

//スカウトアタック・ミス演出
//MultiCount		: 何回目の行動か？
//MultiStageCount	: 何段目の攻撃か？
//-----戻り値----
//なし				： MissではMotionTaskを返さない。
function SetScoutDamageMotion_Miss(MultiCount,MultiStageCount)
{
	//DebugPrint_FuncName_IN("SetScoutDamageMotion_Miss");
	//DebugPrint("	=>	MultiCount			:" + MultiCount)
	//DebugPrint("	=>	MultiStageCount		:" + MultiStageCount)
	local MotionTask = null;
	
	local Target		= GetTargetIndex_(MultiCount,0)
	local cMonster = cMonsterInfo(Target)
	
	ReplaySE_("SE_BTL_022");
	SetPop_(Target, POPSTYLE.DAMAGE_ENEMY, 0 , true , cMonster.PopDate_X[MultiStageCount] , cMonster.PopDate_Y[MultiStageCount] , 1.0);
	
	return MotionTask;
	//DebugPrint_FuncName_OUT("SetScoutDamageMotion_Miss");
}

//スカウトアタック・通常ダメージ演出
//MultiCount		: 何回目の行動か？
//MultiStageCount	: 何段目の攻撃か？
//-----戻り値----
//MotionTask		: 被弾モーションのタスク番号
function SetScoutDamageMotion_NormalDamage(MultiCount,MultiStageCount)
{
	//DebugPrint_FuncName_IN("SetScoutDamageMotion_NormalDamage");
	//DebugPrint("	=>	MultiCount			:" + MultiCount)
	//DebugPrint("	=>	MultiStageCount		:" + MultiStageCount)
	
	local Target		= GetTargetIndex_(MultiCount,0)
	local Actor			= GetActorIndex_(MultiCount)
	local MotionTask	= null;
	
	EffParamSizeEffect(Target,"EF010_01_HIT");
	EffParamSizeEffect(Target,"EF000_08_SA_ATTACK");
	SetMotion_(Target, MOT_DAMAGE, 4);
	MotionTask = Task_ChangeMotion_(Target, MOT_WAIT, 4);
	
	//DebugPrint_FuncName_OUT("SetScoutDamageMotion_NormalDamage");
	//DebugPrint("	<=	MotionTask			:" + MotionTask)
	return MotionTask;
}

//スカウトアタック・ＵＩ反映
//MultiCount			: 何回目の行動か？
//FirstScoutDamageFlag	: 最初のスカウトダメージか？
function SetScoutDamageMotion_UIEffect(MultiCount,FirstScoutDamageFlag)
{
	//DebugPrint_FuncName_IN("SetScoutDamageMotion_UIEffect");
	//DebugPrint("	=>	MultiCount		:" + MultiCount)
	//DebugPrint("	=>	FirstScoutDamageFlag		:" + FirstScoutDamageFlag)

	//ゲージのカウントアップ音と被るので初回で再生したSEを停止
	if(IsScoutFirstAttack_()){
		StopSE_("SE_BTL_014");
	}
	
	if(FirstScoutDamageFlag == true){
		//最初の１回目のダメージでのみＵＩ更新
		local ScoutDamageValue = GetScoutDamageValue_(MultiCount);
		AddScoutGaugeValue_(ScoutDamageValue);
		while(IsFinishScoutGaugeAnime_() != true)
		{
			UpdateScoutGauge_();
			Wait_(1);
		}
	}
	FirstScoutDamageFlag = false;
	//DebugPrint_FuncName_OUT("SetScoutDamageMotion_UIEffect");
	//DebugPrint("	<=	FirstScoutDamageFlag		:" + FirstScoutDamageFlag)
	return FirstScoutDamageFlag;
}


//物理攻撃（貫通）被弾演出
//Target		: 対象者のIndex
//Actor			: 行動者のIndex
//cAction		: cActionInfo
function TargetPierceMotion(Target,Actor,OldPattern,cAction)
{
	//DebugPrint_FuncName_IN("TargetPierceMotion");
	//DebugPrint("	=>	Target			:" + Target)
	//DebugPrint("	=>	Actor			:" + Actor)
	//DebugPrint("	=>	OldPattern		:" + OldPattern)
	
	//特技エフェクトと被弾
	if(cAction.SingleActEffect0_Name != null){
		MonsterSizeEffect(Target, cAction.SingleActEffect0_Name);
	}
	if(cAction.SingleActEffect1_Name != null){
		MonsterSizeEffect(Target, cAction.SingleActEffect1_Name);
	}
	SetMotion_(Target, MOT_DAMAGE, 4);
	Task_ChangeMotion_(Target , MOT_WAIT , 1)
	
	if(OldPattern == true){
		SetMotionStepFrame_(Target, 0.3);
		SetMonsterPlayMoveSE_(Target,false);
		
	} else {
		SetMotionStepFrame_(Target, 0.23);
		SetMonsterPlayMoveSE_(Target,false);
		
	}
	//ReplaySE_(cAction.DamageSE);
	//EffParamSizeEffect(Target,"EF010_01_HIT");
	//DebugPrint_FuncName_OUT("TargetPierceMotion");
}

//アピールポイント表示
//WaitFlag		: 処理内で、アニメーション終了を待つか？
function SetApealPoint_Init(WaitFlag)
{
	local ActionNum		= GetActionNum_()
	local TargetNum		= 0
	local AllyPoint		= 0;
	local EnemyPoint	= 0;
	for(local MultiCount = 0 ; MultiCount < ActionNum ; MultiCount++){
		TargetNum		= GetTargetNum_(MultiCount);
		for(local IndexCount = 0 ; IndexCount < TargetNum ; IndexCount++){
			AllyPoint	= AllyPoint + GetAllyAppealPoint_(MultiCount, IndexCount);
			EnemyPoint	= EnemyPoint + GetEnemyAppealPoint_(MultiCount, IndexCount);
		}
	}
	
	print("<<<<<<< ApealPointCheck >>>>>>>>"  + "\n")
	print(" AllyApealPoint  : " + AllyPoint + "\n")
	print(" EnemyApealPoint : " + EnemyPoint + "\n")
	AddAppealPoint_(AllyPoint,EnemyPoint);
	StartAppealPointAnim_();
	local count = 0;
	
	//処理内で待機を行う場合は、
	if(WaitFlag == true){
		for(local i = 0 ; i < 10 ; i++){
			if(IsEndAppealPointAnim_() == true){
				Wait_(15);
				return;
			} else {
				Wait_(1)
				i = 0;
				count++
			}
		}
	}
	
}

// 即死→特性（くじけぬ心など）でHP1で復帰するかどうか
function IsResurrectionFromDead(MultiCount,IndexCount)
{
	// HP1で復帰できる特性が発動しているか
	if(IsLastStand_(MultiCount,IndexCount) == false &&
		 IsBraveHart_(MultiCount,IndexCount) == false){
		 return false;
	}
	return true;
}

//戦闘Script専用中断処理
function BatteleScript_End()
{
	End_();
	Wait_(1);
}

//Script中断用処理
function ScriptStop()
{
	//エラー時に強制進行停止
	for(local i = 0 ; i < 3 ; i++){
		Wait_(1)
		i=0;
	}
}

//==============デバッグ機能================//

// 関数名と、IN/OUTだけ表示する用
// inout:入るときは"in", 出るときは"out"を
function DebugPrint_FuncName_IN (funcName)
{
	local padding = ""
	for(local i = 0;i < g_funcDepth;i++){
		padding += "  ";
	}
	g_funcDepth++;
	print(padding + "func_in:" + funcName + "\n");
}

function DebugPrint_FuncName_OUT (funcName)
{
	g_funcDepth--;
	if(g_funcDepth < 0) {
		g_funcDepth = 0;
		print("inよりoutのほうが多いですよ\n");
	}
	local padding = ""
	for(local i = 0;i < g_funcDepth;i++){
		padding += "  ";
	}
	print(padding + "func_out:" + funcName + "\n");
}

//デバッグ用Emptyプリント
//function Debug_EmptyPrint(Monster,Empty,Rotate)
//{
//	return;
//	
//	if(DEBUG_CACTIONPRINTFLAG == "false"){
//		return;
//	}
//	local EmptyPos = GetPos_(Monster)
//	
//	print("----[Debug_EmptyPrint]---------------------------" + "\n")
//	print("Monster		: " + Monster + "\n")
//	print("Empty		: " + Empty + "\n")
//	print("EmptyPos.x	: " + EmptyPos.x + "\n")
//	print("EmptyPos.y	: " + EmptyPos.y + "\n")
//	print("EmptyPos.z	: " + EmptyPos.z + "\n")
//	print("Rotate		: " + Rotate + "\n")
//}

//デバッグプリント用テキスト表示
//function DebugPrint_DamageType(DamageType)
//{
//	local PrintText;
//	switch(DamageType)
//	{
//		case AFFECT_PARAM.NONE:
//			PrintText = "AFFECT_PARAM.NONE"
//			break;
//		case AFFECT_PARAM.MAX_HP:
//			PrintText = "AFFECT_PARAM.MAX_HP"
//			break;
//		case AFFECT_PARAM.MAX_MP:
//			PrintText = "AFFECT_PARAM.MAX_MP"
//			break;
//		case AFFECT_PARAM.HP:
//			PrintText = "AFFECT_PARAM.HP"
//			break;
//		case AFFECT_PARAM.MP:
//			PrintText = "AFFECT_PARAM.MP"
//			break;
//		case AFFECT_PARAM.AT:
//			PrintText = "AFFECT_PARAM.AT"
//			break;
//		case AFFECT_PARAM.DF:
//			PrintText = "AFFECT_PARAM.DF"
//			break;
//		case AFFECT_PARAM.QC:
//			PrintText = "AFFECT_PARAM.QC"
//			break;
//		case AFFECT_PARAM.WS:
//			PrintText = "AFFECT_PARAM.WS"
//			break;
//		case AFFECT_PARAM.TS:
//			PrintText = "AFFECT_PARAM.TS"
//			break;
//		case AFFECT_PARAM.HMP:
//			PrintText = "AFFECT_PARAM.HMP"
//			break;
//		default:
//			print("++++++ DamageType ERRPR ++++++" + "\n")
//			print("DamageType : " + Efficacy + "\n")
//			ScriptStop();
//			break;
//	}
//	return PrintText;
//}

//function DebugPrint_TargetType(TargetType)
//{
//	local PrintText;
//	switch(TargetType)
//	{
//		case TARGET.NONE:
//			PrintText = "TARGET.NONE";
//			break;	
//		case TARGET.ALLY:
//			PrintText = "TARGET.ALLY";
//			break;	
//		case TARGET.ALLY_ALL:
//			PrintText = "TARGET.ALLY_ALL";
//			break;	
//		case TARGET.ALLY_RANDOM:
//			PrintText = "TARGET.ALLY_RANDOM";
//			break;	
//		case TARGET.ALLY_MULTI_RANDOM:
//			PrintText = "TARGET.ALLY_MULTI_RANDOM";
//			break;	
//		case TARGET.ALLY_ENEMY:
//			PrintText = "TARGET.ALLY_ENEMY";
//			break;	
//		case TARGET.ALL:
//			PrintText = "TARGET.ALL";
//			break;	
//		case TARGET.ENEMY:
//			PrintText = "TARGET.ENEMY";
//			break;	
//		case TARGET.ENEMY_ALL:
//			PrintText = "TARGET.ENEMY_ALL";
//			break;	
//		case TARGET.ENEMY_RANDOM:
//			PrintText = "TARGET.ENEMY_RANDOM";
//			break;	
//		case TARGET.BAKURETSU:
//			PrintText = "TARGET.BAKURETSU";
//			break;	
//		case TARGET.SELF:
//			PrintText = "TARGET.SELF";
//			break;	
//		case TARGET.RANDOM:
//			PrintText = "TARGET.RANDOM";
//			break;	
//		case TARGET.FIELD:
//			PrintText = "TARGET.FIELD";
//			break;	
//		case TARGET.OTHER:
//			PrintText = "TARGET.OTHER";
//			break;	
//		default:
//			print("++++++ TARGETTYPE ERRPR ++++++" + "\n")
//			print("TargetType : " + TargetType + "\n")
//			ScriptStop();
//			break;
//	}
//	return PrintText;
//}

//function DebugPrint_MonsterSize(Size)
//{
//	local PrintText;
//	switch(Size)
//	{
//		case SIZE_S:
//			PrintText = "SIZE_S";
//			break;	
//		case SIZE_N:
//			PrintText = "SIZE_N";
//			break;	
//		case SIZE_M:
//			PrintText = "SIZE_M";
//			break;	
//		case SIZE_G:
//			PrintText = "SIZE_G";
//			break;	
//		case SIZE_T:
//			PrintText = "SIZE_T";
//			break;	
//		default:
//			print("++++++ SIZE ERRPR ++++++" + "\n")
//			print("Size : " + Size + "\n")
//			ScriptStop();
//			break;
//	}
//	return PrintText;
//}

//function DebugPrint_Efficacy(Efficacy)
//{
//	local PrintText;
//	switch(Efficacy)
//	{
//		case EFFICACY.NONE:
//			PrintText = "EFFICACY.NONE";
//			break;	
//		case EFFICACY.ATTACK:
//			PrintText = "EFFICACY.ATTACK";
//			break;	
//		case EFFICACY.WEAK:
//			PrintText = "EFFICACY.WEAK";
//			break;	
//		case EFFICACY.SUPPORT:
//			PrintText = "EFFICACY.SUPPORT";
//			break;	
//		case EFFICACY.HEAL:
//			PrintText = "EFFICACY.HEAL";
//			break;	
//		case EFFICACY.DEFENSE:
//			PrintText = "EFFICACY.DEFENSE";
//			break;	
//		case EFFICACY.OTHER:
//			PrintText = "EFFICACY.OTHER";
//			break;	
//		default:
//			print("++++++ Efficacy ERRPR ++++++" + "\n")
//			print("Efficacy : " + Efficacy + "\n")
//			ScriptStop();
//			break;
//	}
//	return PrintText;
//}


//function DebugPrint_PartyType(PartyType)
//{
//	local PrintText;
//	switch(PartyType)
//	{
//		case PARTYTYPE.S4:
//			PrintText = "PARTYTYPE.S4";
//			break;	
//		case PARTYTYPE.S3:
//			PrintText = "PARTYTYPE.S3";
//			break;	
//		case PARTYTYPE.S2:
//			PrintText = "PARTYTYPE.S2";
//			break;	
//		case PARTYTYPE.S1:
//			PrintText = "PARTYTYPE.S1";
//			break;	
//		case PARTYTYPE.SG:
//			PrintText = "PARTYTYPE.SG";
//			break;	
//		case PARTYTYPE.GS:
//			PrintText = "PARTYTYPE.GS";
//			break;	
//		case PARTYTYPE.G1:
//			PrintText = "PARTYTYPE.G1";
//			break;	
//		case PARTYTYPE.T1:
//			PrintText = "PARTYTYPE.T1";
//			break;	
//		default:
//			print("++++++ PartyType ERRPR ++++++" + "\n")
//			print("PartyType : " + PartyType + "\n")
//			ScriptStop();
//			break;
//	}
//	return PrintText;
//}

//function DebugPrint_Category(Category)
//{
//	local PrintText;
//	switch (Category)
//	{
//		case CATEGORY.NONE:
//			PrintText = "CATEGORY.NONE";
//			break;
//		case CATEGORY.PHYSICAL	:
//			PrintText = "CATEGORY.PHYSICAL";
//			break;
//		case CATEGORY.SPELL		:
//			PrintText = "CATEGORY.SPELL";
//			break;
//		case CATEGORY.ARTS	:
//			PrintText = "CATEGORY.ARTS";
//			break;
//		case CATEGORY.BREATH		:
//			PrintText = "CATEGORY.BREATH";
//			break;
//		case CATEGORY.DANCE		:
//			PrintText = "CATEGORY.DANCE";
//			break;
//		case CATEGORY.FEAT		:
//			PrintText = "CATEGORY.FEAT";
//			break;
//		case CATEGORY.ITEM		:
//			PrintText = "CATEGORY.ITEM";
//			break;
//		case CATEGORY.OTHER		:
//			PrintText = "CATEGORY.OTHER";
//			break;
//		default:
//			print("++++++ Category ERRPR ++++++" + "\n")
//			print("Category : " + Category + "\n")
//			ScriptStop();
//			break;
//	}
//	return PrintText;
//}

//function DebugPrint_MasterKind(MasterKind)
//{
//	local PrintText;
//	switch (MasterKind)
//	{
//		case MASTER_KIND.NONE:
//			PrintText = "MASTER_KIND.NONE";
//			break
//		case MASTER_KIND.PLAYER:
//			PrintText = "MASTER_KIND.PLAYER";
//			break
//		case MASTER_KIND.NOTYORIN:
//			PrintText = "MASTER_KIND.NOTYORIN";
//			break
//		case MASTER_KIND.NOTYORA_WOMEN:
//			PrintText = "MASTER_KIND.NOTYORA_WOMEN";
//			break
//		case MASTER_KIND.KING:
//			PrintText = "MASTER_KIND.KING";
//			break
//		case MASTER_KIND.JACK:
//			PrintText = "MASTER_KIND.JACK";
//			break
//		case MASTER_KIND.ACE:
//			PrintText = "MASTER_KIND.ACE";
//			break
//		case MASTER_KIND.ADVENTURER:
//			PrintText = "MASTER_KIND.ADVENTURER";
//			break
//		case MASTER_KIND.ADVENTURER_BLUE:
//			PrintText = "MASTER_KIND.ADVENTURER_BLUE";
//			break
//		case MASTER_KIND.ADVENTURER_GREEN:
//			PrintText = "MASTER_KIND.ADVENTURER_GREEN";
//			break
//		case MASTER_KIND.ADVENTURER_YELLOW:
//			PrintText = "MASTER_KIND.ADVENTURER_YELLOW";
//			break
//		case MASTER_KIND.ADVENTURER_ORANGE:
//			PrintText = "MASTER_KIND.ADVENTURER_ORANGE";
//			break
//		case MASTER_KIND.ADVENTURER_PURPLE:
//			PrintText = "MASTER_KIND.ADVENTURER_PURPLE";
//			break
//		case MASTER_KIND.ADVENTURER_BLACK:
//			PrintText = "MASTER_KIND.ADVENTURER_BLACK";
//			break
//		case MASTER_KIND.QUEEN:
//			PrintText = "MASTER_KIND.QUEEN";
//			break
//		case MASTER_KIND.RENATE:
//			PrintText = "MASTER_KIND.RENATE";
//			break
//		case MASTER_KIND.RUKIYA:
//			PrintText = "MASTER_KIND.RUKIYA";
//			break
//		case MASTER_KIND.DARK_MASTER:
//			PrintText = "MASTER_KIND.DARK_MASTER";
//			break
//		case MASTER_KIND.RESISTANCE_MAN:
//			PrintText = "MASTER_KIND.RESISTANCE_MAN";
//			break
//		case MASTER_KIND.RESISTANCE_WOMAN:
//			PrintText = "MASTER_KIND.RESISTANCE_WOMAN";
//			break
//		case MASTER_KIND.RESISTANCE_GENTLEMAN:
//			PrintText = "MASTER_KIND.RESISTANCE_GENTLEMAN";
//			break
//		case MASTER_KIND.IMMIGRANT_MAN:
//			PrintText = "MASTER_KIND.IMMIGRANT_MAN";
//			break
//		case MASTER_KIND.IMMIGRANT_WOMAN:
//			PrintText = "MASTER_KIND.IMMIGRANT_WOMAN";
//			break
//		case MASTER_KIND.IMMIGRANT_BOY:
//			PrintText = "MASTER_KIND.IMMIGRANT_BOY";
//			break
//		case MASTER_KIND.COOL:
//			PrintText = "MASTER_KIND.COOL";
//			break
//		case MASTER_KIND.SYNTHE:
//			PrintText = "MASTER_KIND.SYNTHE";
//			break
//		case MASTER_KIND.PROMETHEUS:
//			PrintText = "MASTER_KIND.PROMETHEUS";
//			break
//		case MASTER_KIND.MII:
//			PrintText = "MASTER_KIND.MII";
//			break
//		default:
//			print("++++++ MasterKind ERRPR ++++++" + "\n")
//			print("MasterKind : " + MasterKind + "\n")
//			ScriptStop();
//			break;
//	}
//	return PrintText;
//}

//function DebugPrint_ExistType(ExistType)
//{
//	local PrintText;
//	switch (ExistType)
//	{
//		case LIVETYPE.ACTIVE:
//			PrintText = "LIVETYPE.ACTIVE";
//			break;
//		case LIVETYPE.INACTIVE:
//			PrintText = "LIVETYPE.INACTIVE";
//			break;
//		case LIVETYPE.NONE:
//			PrintText = "LIVETYPE.NONE";
//			break;
//		default:
//			print("++++++ ExistType ERRPR ++++++" + "\n")
//			print("  DebugPrint_ExistType  " + "\n")
//			print("ExistType : " + ExistType + "\n")
//			ScriptStop();
//			break;
//	}
//	return PrintText;
//}

//function DebugPrint_PopStyle(PopStyle)
//{
//	local PrintText;
//	switch (PopStyle)
//	{
//		case POPSTYLE.DAMAGE_ALLY:
//			PrintText = "POPSTYLE.DAMAGE_ALLY";
//			break;
//		case POPSTYLE.DAMAGE_ENEMY:
//			PrintText = "POPSTYLE.DAMAGE_ENEMY";
//			break;
//		case POPSTYLE.DAMAGE_MP:
//			PrintText = "POPSTYLE.DAMAGE_MP";
//			break;
//		case POPSTYLE.TENSION_UP:
//			PrintText = "POPSTYLE.TENSION_UP";
//			break;
//		case POPSTYLE.TENSION_DOWN:
//			PrintText = "POPSTYLE.TENSION_DOWN";
//			break;
//		case POPSTYLE.HEAL_HP:
//			PrintText = "POPSTYLE.HEAL_HP";
//			break;
//		case POPSTYLE.HEAL_MP:
//			PrintText = "POPSTYLE.HEAL_MP";
//			break;
//		case POPSTYLE.NONE:
//			PrintText = "POPSTYLE.DAMAGE_ALLY";
//			break;
//		default:
//			print("++++++ PopStyle ERRPR ++++++" + "\n")
//			print("  DebugPrint_PopStyle  " + "\n")
//			print("PopStyle : " + PopStyle + "\n")
//			ScriptStop();
//			break;
//	}
//	return PrintText;
//}

//function DebugPrint_ExecMissType()
//{
//	local PrintText;
//	switch (GetExecMissType_())
//	{
//		case EXEC_MISS_TYPE.NONE:
//			PrintText = "EXEC_MISS_TYPE.NONE";
//			break;
//		case EXEC_MISS_TYPE.LACK_MP:
//			PrintText = "EXEC_MISS_TYPE.LACK_MP";
//			break;
//		case EXEC_MISS_TYPE.MIST:
//			PrintText = "EXEC_MISS_TYPE.MIST";
//			break;
//		case EXEC_MISS_TYPE.DIFFERENT_SIZE:
//			PrintText = "EXEC_MISS_TYPE.DIFFERENT_SIZE";
//			break;
//		case EXEC_MISS_TYPE.OVERLAP:
//			PrintText = "EXEC_MISS_TYPE.OVERLAP";
//			break;
//		case EXEC_MISS_TYPE.MISS:
//			PrintText = "EXEC_MISS_TYPE.MISS";
//			break;
//		case EXEC_MISS_TYPE.LACK_TS:
//			PrintText = "EXEC_MISS_TYPE.MISS";
//			break;
//		default:
//			print("++++++ ExecMissType ERRPR ++++++" + "\n")
//			print("  DebugPrint_ExecMissType  " + "\n")
//			print("ExecMissType : " + GetExecMissType_() + "\n")
//			ScriptStop();
//			break;
//	}
//	return PrintText;
//}

//function用DebugPrint（1List版）
//FuncName				: 関数名
//ArgList				: 関数用引数
//１つのListで全てを行う場合用です。
//その際は
//奇数番目	：関数用引数名
//偶数番目	：関数用引数名
//としてください
//引数出力が不要な場合はArgListにnullを渡してください。
//関数情報出力用（サンプル）
//local ArgList =	["MultiCount"	,	MultiCount
//					,"MultiCount"	,	MultiCount
//					,"MultiCount"	,	MultiCount
//					]
//function DebugPrint_functionParam(FuncName , ArgList)
//{
//	print("----- << function : " + FuncName + " >> -----" + "\n")
//	
//	//変数出力がある場合は以下
//	if(ArgList != null){
//		local MaxTextLenge_NameList = 0;
//		for(local i = 0 ; i < ArgList.len() ; i = i+2){
//			if(MaxTextLenge_NameList < ArgList[i].len()){
//				MaxTextLenge_NameList = ArgList[i].len();
//			}
//		}
//		for(local i = 0 ; i < ArgList.len() ; i = i+2){
//			local TextSpace = ""
//			if(MaxTextLenge_NameList > ArgList[i].len()){
//				for(local l = 0 ; MaxTextLenge_NameList > ArgList[i].len() + l ; l++){
//					TextSpace = TextSpace + " ";
//				}
//			}
//			print(ArgList[i] + TextSpace +" : " + ArgList[i + 1] + "\n")
//		}
//	}
//	
//	print("---------------------------------" + "\n")
//}

//デバッグテキスト用置き換えテキスト
function DebugPrint_OneList_Template(Text)
{
	//サンプル
	switch(Text)
	{
	case "LINE":
		Text = "---------------------------------------";
		break;
	case "DOUBLELINE":
		Text = "=======================================";
		break;
	default:
		break;
	}
	return Text;
}

//リスト出力DebugPrint用
//リスト形式のテキストファイルを２要素ずつ出力する。
//List			: 出力する配列
//				  ["PrintText"		,	Number]とすると
//				  PrintText       : Number
//				  と出力される（２要素目毎で改行）
//ListStart		: 最初に書きたいテキスト（文字列）、不要な場合はnull
//ListEnd		: 最後に書きたいテキスト（文字列）、不要な場合はnull
//ListFront		: リスト出力時の前に書きたいテキスト（文字列）、不要な場合はnull
//				  例えば"・"と設定した場合、List出力時に
//以下サンプル
//local ListStart =	"ここからはじまり"
//local ListFront =	"・"
//local List =			["PrintText"		,	PrintText
//						,"MultiCount"	,	MultiCount
//						]
//local ListEnd =		"ここで終わる"
//DebugPrint_OneList(List , ListStart , ListEnd , ListFront)
function DebugPrint_OneList(List , ListStart , ListEnd , ListFront)
{
	if(ListStart != null){
		ListStart = DebugPrint_OneList_Template(ListStart);
		print(ListStart + "\n")
	}
	
	//Listの出力
	if(List != null){
		local MaxTextLenge_NameList = 0;
		for(local i = 0 ; i < List.len() ; i = i+2){
			if(MaxTextLenge_NameList < List[i].len()){
				MaxTextLenge_NameList = List[i].len();
			}
		}
		//Listの出力
		for(local i = 0 ; i < List.len() ; i = i+2){
			//ListFrontの出力
			if(ListFront != null){print(ListFront);}
			//１要素目の出力
			local TextSpace = ""
			if(MaxTextLenge_NameList > List[i].len()){
				for(local l = 0 ; MaxTextLenge_NameList > List[i].len() + l ; l++){
					TextSpace = TextSpace + " ";
				}
			}
			print(List[i] + TextSpace +" : ")
			//２要素目の出力
			print(List[i + 1] + "\n")
		}
	}
	
	//最終段に出力
	if(ListEnd != null){
		ListEnd = DebugPrint_OneList_Template(ListEnd);
		print(ListEnd + "\n")
	}	
}

//Debug用cActionPrint

function Debug_cActionPrint(cAction)
{
}


/*
function Debug_cActionPrint(cAction)
{
	if(DEBUG_CACTIONPRINTFLAG == "false"){
		return;
	}
	//スカウトアタック時はスキップする。
	if(IsScout_()){return;}
	
	//配置データの読み替え
	//ChangeIndexPointData_(PERSONAL_POINT_DATA);
	
	local MultiCount				= cAction.MultiCount
	local Actor						= GetActorIndex_(MultiCount)
	local TargetNum					= GetTargetNum_(MultiCount)
	local TargetType				= GetTargetType_(MultiCount)
	local SingleEffect1				= cAction.SingleActEffect0_Name;
	local SingleEffectFrame1		= cAction.SingleActEffect0_Frame;
	local SingleEffect2				= cAction.SingleActEffect1_Name;
	local SingleEffectFrame2		= cAction.SingleActEffect1_Frame;
	local AllEffect1				= cAction.AllActEffect0_Name;
	local AllEffectFrame1			= cAction.AllActEffect0_Frame;
	local AllEffect2				= cAction.AllActEffect1_Name;
	local AllEffectFrame2			= cAction.AllActEffect1_Frame;
	local IsTargetSingle			= IsTargetSingle_(MultiCount)
	local UseMp						= GetUseMp_(MultiCount)
	local Efficacy					= GetActionEfficacy_(MultiCount);
	local IsScout					= IsScout_();
	local Category					= GetActionCategory_(MultiCount);
	local AllyTortalAppealPoint	= 0;
	local EnemyTortalAppealPoint= 0;
	local AllyRideMaster			= GetMasterKind_(true)
	local EnemyRideMaster			= GetMasterKind_(false)
	local IsTokugi					= IsTokugi_(MultiCount)
	local IsTeraAttack				= false
	local ExecMissType				= DebugPrint_ExecMissType()
	print("Actor					: " + Actor + "\n")
	print("TargetNum				: " + TargetNum + "\n")
	print("TargetType				: " + DebugPrint_TargetType(TargetType) + "\n")
	print("SingleEffect1				: " + SingleEffect1 + "\n")
	print("SingleEffectFrame1			: " + SingleEffectFrame1 + "\n")
	print("SingleEffect2				: " + SingleEffect2 + "\n")
	print("SingleEffectFrame2			: " + SingleEffectFrame2 + "\n")
	print("AllEffect1				: " + AllEffect1 + "\n")
	print("AllEffectFrame1				: " + AllEffectFrame1 + "\n")
	print("AllEffect2				: " + AllEffect2 + "\n")
	print("AllEffectFrame2				: " + AllEffectFrame2 + "\n")
	print("EffectFrame_DamageDirectionWait		: " + cAction.EffectFrame_DamageDirectionWait + "\n")
	print("EffectFrame_EndWait			: " + cAction.EffectFrame_EndWait + "\n")
	print("IsTargetSingle				: " + IsTargetSingle + "\n")
	print("UseMp					: " + UseMp + "\n")
	print("Efficacy				: " + DebugPrint_Efficacy(Efficacy) + "\n")
	print("IsScout					: " + IsScout + "\n")
	print("IsTokugi				: " + IsTokugi + "\n")
	print("ExecMissType				: " + ExecMissType + "\n")
	if(GetActorIndex_(MultiCount) == INVALID_CHARACTER || IsMaster_(GetActorIndex_(MultiCount)) == true){
		IsTeraAttack				= IsTeraAttack_(MultiCount)
	}
	print("IsTeraAttack				: " + IsTeraAttack + "\n");
	print("AllyMasterKind				: " + DebugPrint_MasterKind(AllyRideMaster) + "\n")
	print("EnemyMasterKind				: " + DebugPrint_MasterKind(EnemyRideMaster) + "\n")
	if(IsScout != true){
		//スカウト時には参照しない
		print("Category				: " + DebugPrint_Category(Category) + "\n")
	}
	for(local IndexCount = 0 ; IndexCount < TargetNum ; IndexCount++){
		local Target		= GetTargetIndex_(MultiCount,IndexCount);
		if(Target == INVALID_CHARACTER){return;}
		local cMonster			= cMonsterInfo(Target);
		local ActHitNum			= GetActHitNum_(MultiCount,IndexCount);
		local DamageType		=  GetDamageType_(MultiCount,IndexCount);
		local IsRezaoral		= IsRezaoral_(MultiCount,IndexCount);
		local IsAngel			= IsAngel_(MultiCount,IndexCount);
		local GetRevivalValue	= GetRevivalValue_(MultiCount,IndexCount);
		local AllyApealPoint	= GetAllyAppealPoint_(MultiCount, IndexCount);
		local EnemyAppealPoint	= GetEnemyAppealPoint_(MultiCount, IndexCount);
		local IsRide			= IsRide_(Target)
		local IsLivingDead		= IsLivingDead_(MultiCount,IndexCount)
		local IsBraveHart		= IsBraveHart_(MultiCount,IndexCount)
		local IsLastStand		= IsLastStand_(MultiCount,IndexCount)
		AllyTortalAppealPoint	= AllyTortalAppealPoint + AllyApealPoint;
		EnemyTortalAppealPoint	= EnemyTortalAppealPoint + EnemyAppealPoint
		print("- - - - - - - - - - - - - - - - - - - - - - - - " + "\n")
		print("IndexCount				: " + IndexCount + "\n")
		print("Target					: " + Target + "\n")
		print("cMonster.Size				: " + DebugPrint_MonsterSize(cMonster.Size) + "\n")
		print("cMonster.EffectSize			: " + cMonster.EffectSize + "\n")
		print("cMonster.HighRankEffectSize		: " + cMonster.HighRankEffectSize + "\n")
		print("ActHitNum				: " + ActHitNum + "\n")
		print("DamageType				: " + DebugPrint_DamageType(DamageType) + "\n")
		print("IsRezaoral				: " + IsRezaoral + "\n")
		print("IsAngel					: " + IsAngel + "\n")
		print("GetRevivalValue				: " + GetRevivalValue + "\n")
		print("AllyApealPoint				: " + AllyApealPoint + "\n")
		print("EnemyAppealPoint			: " + EnemyAppealPoint + "\n")
		print("IsRide					: " + IsRide + "\n")
		print("IsLivingDead				: " + IsLivingDead + "\n")
		print("IsBraveHart				: " + IsBraveHart + "\n")
		print("IsLastStand				: " + IsLastStand + "\n")
		if(IsTeraAttack == true){
			local TeraDamageValue = GetTeraDamageValue_(MultiCount,IndexCount)
			print("TeraDamageValue				: " + TeraDamageValue + "\n")
		}
		for(local MultiStageCount = 0 ; MultiStageCount < ActHitNum ; MultiStageCount++){
			local DamageValue		= GetDamageValue_(MultiCount,IndexCount,MultiStageCount);
			local IsCritical		= IsCritical_(MultiCount , IndexCount, MultiStageCount);
			local IsMiss			= IsMiss_(MultiCount , IndexCount, MultiStageCount);
			local IsDead			= IsDead_(MultiCount , IndexCount);
			local IsGuard			= IsGuard_(MultiCount , IndexCount);
			local IsAbsorption		= IsAbsorb_(MultiCount , IndexCount)
			local IsReflect			= IsReflect_(MultiCount , IndexCount);
			local IsRevival			= IsRevival_(MultiCount , IndexCount);
			local IsPoisonDamage	= IsPoisonDamage_(MultiCount , IndexCount);
			local IsGambleBody		= IsGambleBody_(MultiCount , IndexCount , MultiStageCount);
			local IsCriticalGuard	= IsActiveCriticalGuard(MultiCount , IndexCount, MultiStageCount);
			print("*" + "MultiStageCount			: " + MultiStageCount + "\n")
			print(" " + "DamageValue				: " + DamageValue + "\n")
			print(" " + "IsCritical				: " + IsCritical + "\n")
			print(" " + "IsMiss					: " + IsMiss + "\n")
			print(" " + "IsDead					: " + IsDead + "\n")
			print(" " + "IsGuard				: " + IsGuard + "\n")
			print(" " + "IsAbsorption				: " + IsAbsorption + "\n")
			print(" " + "IsReflect				: " + IsReflect + "\n")
			print(" " + "IsRevival				: " + IsRevival + "\n")
			print(" " + "IsPoisonDamage				: " + IsPoisonDamage + "\n")
			print(" " + "IsGambleBody				: " + IsGambleBody + "\n")
			print(" " + "IsCriticalGuard			: " + IsCriticalGuard + "\n")
			
		}
		if(ActHitNum == 0){
			local MultiStageCount = 0;
			local DamageValue		= GetDamageValue_(MultiCount,IndexCount,MultiStageCount);
			local IsCritical		= IsCritical_(MultiCount , IndexCount, MultiStageCount);
			local IsMiss			= IsMiss_(MultiCount , IndexCount, MultiStageCount);
			local IsDead			= IsDead_(MultiCount , IndexCount);
			local IsGuard			= IsGuard_(MultiCount , IndexCount);
			local IsAbsorption		= IsAbsorb_(MultiCount , IndexCount)
			local IsReflect			= IsReflect_(MultiCount , IndexCount);
			local IsRevival			= IsRevival_(MultiCount , IndexCount);
			local IsPoisonDamage	= IsPoisonDamage_(MultiCount , IndexCount);
			local IsGambleBody		= IsGambleBody_(MultiCount , IndexCount , MultiStageCount);
			local IsCriticalGuard	= IsActiveCriticalGuard(MultiCount , IndexCount, MultiStageCount);
			print("*" + "MultiStageCount			: " + MultiStageCount + "\n")
			print(" " + "DamageValue				: " + DamageValue + "\n")
			print(" " + "IsCritical				: " + IsCritical + "\n")
			print(" " + "IsMiss					: " + IsMiss + "\n")
			print(" " + "IsDead					: " + IsDead + "\n")
			print(" " + "IsGuard				: " + IsGuard + "\n")
			print(" " + "IsAbsorption				: " + IsAbsorption + "\n")
			print(" " + "IsReflect				: " + IsReflect + "\n")
			print(" " + "IsRevival				: " + IsRevival + "\n")
			print(" " + "IsPoisonDamage				: " + IsPoisonDamage + "\n")
			print(" " + "IsGambleBody				: " + IsGambleBody + "\n")
			print(" " + "IsCriticalGuard			: " + IsCriticalGuard + "\n")
		}
		for(local State = STATUS_TOP ; State < STATUS_NUM ; State++){
			local NowStateValue		= GetMonsterStatusValue_(State, Target);
			local StateValue		= GetStatusValue_(State, MultiCount , IndexCount);
			local StateFlag			= GetStatusFlag_(State, MultiCount , IndexCount);
			local StateEndFlag		= GetStatusEndFlag_(State, MultiCount , IndexCount);
			if(NowStateValue != 0){
				print("**" + "gStateData[" + State + "].Name			: " + gStateData[State].Name + "\n")
				print("  " + "NowStateValue				: " + NowStateValue + "\n");
			}
			if(StateValue != 0){
				print("**" + "gStateData["+ State + "].Name			: " + gStateData[State].Name + "\n")
				print("  " + "StateValue				: " + StateValue + "\n")
				print("  " + "StateFlag				: " + StateFlag + "\n")
			}
			if(StateEndFlag == true){
				print("  " + "StateEndFlag				: " + StateEndFlag + "\n")
				
			}
			if(StateValue != 0 ||  StateEndFlag == true){
				print("  " + "gStateData[" + State + "].Up_Effect		: " + gStateData[State].Up_Effect + "\n")
				print("  " + "gStateData[" + State + "].Up_Motion		: " + gStateData[State].Up_Motion + "\n")
				print("  " + "gStateData[" + State + "].Up_Wait		: " + gStateData[State].Up_Wait + "\n")
				print("  " + "gStateData[" + State + "].Up_MissPop		: " + gStateData[State].Up_MissPop + "\n")
				print("  " + "gStateData[" + State + "].Down_Effect		: " + gStateData[State].Down_Effect + "\n")
				print("  " + "gStateData[" + State + "].Down_Motion		: " + gStateData[State].Down_Motion + "\n")
				print("  " + "gStateData[" + State + "].Down_Wait		: " + gStateData[State].Down_Wait + "\n")
				print("  " + "gStateData[" + State + "].Down_MissPop		: " + gStateData[State].Down_MissPop + "\n")
				print("  " + "gStateData[" + State + "].Reset_Wait		: " + gStateData[State].Reset_Wait + "\n")
			}
		}

	}
	print("- - - - - - - - - - - - - - - - - - - - - - - - " + "\n")
	local Target = GetTargetIndex_(MultiCount,0);
	if(Target != INVALID_CHARACTER){
		local cParty = cFullPartyInfo(Target)
		print("cParty.PartyType		: " + DebugPrint_PartyType(cParty.PartyType) + "\n")
		for(local i = 0 ; i < cParty.PartyNum ; i++){
			print("cParty.Index[" + i +"]			: " + cParty.Index[i] + "\n")
			print("cParty.Type[" + i +"]			: " + DebugPrint_ExistType(cParty.Type[i]) + "\n")
			print("cParty.Size[" + i +"]			: " + DebugPrint_MonsterSize(cParty.Size[i]) + "\n")
			print("cParty.Empty[" + i +"]			: " + cParty.Empty[i] + "\n")
		}
		
		print("cParty.CamEmpty_Area		: " + cParty.CamEmpty_Area + "\n")
		print("cParty.CamTgtEmpty_Area		: " + cParty.CamTgtEmpty_Area + "\n")
		print("cParty.Empty_Master		: " + cParty.Empty_Master + "\n")
		print("cParty.Rotate_Master		: " + cParty.Rotate_Master + "\n")
		print("cParty.CamEmpty_Master		: " + cParty.CamEmpty_Master + "\n")
		print("cParty.CamTgtEmpty_Master	: " + cParty.CamTgtEmpty_Master + "\n")
		if(cParty.EffectEmpty_Area != null){
			print("cParty.EffectEmpty_Area		: " + cParty.EffectEmpty_Area + "\n")
			print("cParty.EffectScale_Area		: " + cParty.EffectScale_Area + "\n")
		}
	}
	
	print("- - - - - - - - - - - - - - - - - - - - - - - - " + "\n")
	print("ApealPoint" + "\n")
	print("AllyTortalAppealPoint	: " + AllyTortalAppealPoint + "\n")
	print("EnemyTortalAppealPoint	: " + EnemyTortalAppealPoint + "\n")	
	
	
	print("------------------------------------------------" + "\n")
}
*/