//=============================================
//
//		demo523[プロメテウス再戦]
//
//=============================================

//-------------------------------------------------------------------------
//
//		読み込み・配置
//
//-------------------------------------------------------------------------
function Update()
{

	
// ▼変数定義
	local task_cam, task_player;
	local efc_player, efc_plometeusu;

// ▼リソース読込
	// キャラクター
	local player = GetPlayerId_();								// 主人公
	local npc_burdy = ReadNpc_("n019");							// バーディ
	local npc_darkmaster = ReadNpc_("n008");					// ダークマスター
	local npc_plometeusu = ReadNpc_("m190_00");					// プロメテウス
	local npc_rena = ReadNpc_("n007");							// レナーテ
	local model_boy = ReadNpc_("n040"); 						// こども主人公
	
	// ギミック
	local obj_couldsleep = ReadGimmick_("o_V02_12");			// コールドスリープ(主人公用)
	local model_cold = ReadGimmick_("o_V02_10");				// コールドスリープ装置
	local model_door = ReadGimmick_("o_V02_09");			// 扉
	// エフェクト
	LoadEffect_("ef730_01_oth_dark_aura01");

	
// ▼配置
	// 主人公
	SetPointPos_(player, "player000");
	// レナーテ
	local rena = ArrangePointNpc_(npc_rena, "npc_rena000");
	
	local boy = ArrangePointNpc_(model_boy, "npc_boy000");		// こども主人公（コールドスリープの中に配置）

	local burdy = ArrangePointNpc_(npc_burdy, "npc_burdy000");
	local darkmaster000 = ArrangePointNpc_(npc_darkmaster, "npc_darkmaster000");
	SetStepSe_(darkmaster000,"SE_FLD_016");
	local darkmaster001 = ArrangePointNpc_(npc_darkmaster, "npc_darkmaster001");
	SetStepSe_(darkmaster001,"SE_FLD_016");
	local plometeusu = ArrangePointNpc_(npc_plometeusu, "npc_plometeusu000");
	efc_plometeusu = SetSelectBoneEffectSetOffset_("ef730_01_oth_dark_aura01", plometeusu, ATTACH_EFFECT2, Vec3(0.0, 0.0, 0.0));
	
	//ギミック
	local couldsleep = ArrangePointGimmick_("o_V02_11", obj_couldsleep, "obj_couldsleep000");
	// 扉
	local door = ArrangePointGimmick_("o_V02_09", model_door, "obj_door000");

// ▼非常駐モーション読込
	local player_run_battle = ReadMotion_(player, "Player_run_battle");			// 主人公 通常の戦闘待機に移行
	local player_battle_L = ReadMotion_(player, "Player_battle_L");				// 主人公 戦闘待機
	local darkmaster_laugh_L = ReadMotion_(darkmaster000, "n008_laugh_L");		// ダークマスター 笑う
	local burdy_idolL = ReadMotion_(burdy, "n019_idol");						// バーディ 待機
	local burdy_wing_Appeal = ReadMotion_(burdy, "n019_wing_Appeal");			// バーディ 待機→翼を広げポーズを決める
	local burdy_wing_Appeal_L = ReadMotion_(burdy, "n019_wing_Appeal_L");		// 決めポーズL
	local rena_caution_L = ReadMotion_(rena, "n007_caution_L");					// レナーテ 警戒L
	
	//こども主人公
	local boy_sleep = ReadMotion_(boy, "n010_cold_sleep_L");					// コールドスリープ用モーション
	SetMotion_(boy, boy_sleep, BLEND_N);
	SetFace_(boy, "Face_loop_close02");

// ▼カメラ設定
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");

//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------

	SetMotion_(rena, rena_caution_L, BLEND_L);										//レナーテ 警戒L

	SetScaleSilhouette(burdy, SCALE.N, SILHOUETTE_WIDTH.N);
	
	SetAlpha_(darkmaster000, 0);
	SetAlpha_(darkmaster001, 1);
	
	SetMotion_(burdy, burdy_idolL, BLEND_L);										//バーディ 待機

	StartDemo(FADE_COLOR_BLACK);
	
	SetMotion_(player, MOT_RUN, BLEND_L);
	local task_player = Task_AnimeMove_(player, "anmplayer000");
	Wait_(8);
	SetMotion_(player, player_run_battle, BLEND_L);
	Wait_(10);
	SetMotion_(player, player_battle_L, BLEND_L);
	
	Wait_(20);

	SetMotion_(darkmaster001, MOT_WALK, BLEND_L);
	SetMotion_(plometeusu, MOT_WALK, BLEND_L);
	local task_plometeusu_step = Task_ChangeStepSe(plometeusu, "SE_FLD_033", 30);							//プロメテウス足音
	
	local task_darkmaster = Task_RotateToPos_(darkmaster001, GetPos_(player), 2.0);
	local task_plometeusu = Task_RotateToPos_(plometeusu, GetPos_(player), 2.0);
	Wait_(80);
	SetMotion_(darkmaster001, MOT_WAIT, BLEND_L);
	SetMotion_(plometeusu, MOT_WAIT, BLEND_L);

	Wait_(30);
	DeleteTaskStepSe(plometeusu, task_plometeusu_step);

//バーディ カメラ
	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");
	
	DeleteTask_(task_darkmaster);
	DeleteTask_(task_plometeusu);
		
	SetMotion_(burdy, burdy_wing_Appeal, BLEND_XL);									//バーディ 待機→翼を広げポーズを決める
	Wait_(33);//このwaitで違和感なくモーションが繋がる
	SetMotion_(burdy, burdy_wing_Appeal_L, BLEND_L);								//バーディ 待機→翼を広げポーズを決めるL
	
	//===============================================
	//*バーディ
	// 	「……ユーが　たとえアンセスでなくても
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_BIRDY");
	ShowMsg_("DEMO_523_MSG_010");
	KeyInputWait_();
	//===============================================
	
	//===============================================
	//*バーディ
	// 	「ハードだったけど　時間は稼いだヨー！
	//-----------------------------------------------
	ShowMsg_("DEMO_523_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	Wait_(20);
		
	SetAlpha_(burdy, 0);
	SetAlpha_(darkmaster000, 1);
	SetAlpha_(darkmaster001, 0);

//ダークマスターとプロメテウス カメラ

	SetPointCameraEye_("cameye002");
	SetPointCameraTarget_("camtgt002");
	SetVisible(player, false);
	SetDir_(darkmaster000, 277.5);//カメラ中央(だいたい主人公のいる位置)を見る感じに
	SetAlpha_(burdy, 0);
	
	SetMotion_(darkmaster000, darkmaster_laugh_L, BLEND_L);				//ダークマスター 笑う
	Wait_(5);

	//===============================================
	//*ダークマスター
	// 「フハハハ！　必死だな？
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_DARKMASTER");
	ShowMsg_("DEMO_523_MSG_030");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	Wait_(5);

//ダプロメテウス戦闘前 カメラ
	SetPointCameraEye_("cameye003");
	SetPointCameraTarget_("camtgt003");
	SetAlpha_(darkmaster000, 0);
	SetAlpha_(player, 0);
	SetPointPos_(plometeusu, "npc_plometeusu002");

	PlaySE_("SE_DEM_135");															//■SE:プロメテウス戦闘直前
	SetMotion_(plometeusu, MOT_SPELL_ACTUATE, BLEND_L);
	Wait_(25);

	EncountEndDemo(ENCOUNT_BOSS);
}
