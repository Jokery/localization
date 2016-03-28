//=============================================
//
//		demo012[ノチョリンとの出会い_2(仲間後)]
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
	local task_cam, task_player, task_mons, task_nocho, task_window;
	local flg_mons = GetNumFlg_("NUM_CHANGE_FIRST_MONSTER");		// Num12
	local player_rot = Vec3(851.55402, 198.02789, -587.7608);
	local nocho_rot = Vec3(824.51355, 191.20386, -551.92377);
	local mons_scale = 0;			// スケール値
	local mons_outline = 0;			// アウトライン
	local mons_param = 0;			// パラメータＩＤ
	local mons_kind = 0;			// 種族ＩＤ
	local mons_res = 0;				// リソース名
	local frame_sum = 0;

	// 初期仲間モンスター設定
	switch(flg_mons)
	{
	// 「プリズニャン」
	case PURIZUNYAN:		// Num12 = 0
		mons_scale = SCALE.PURIZUNYAN;
		mons_outline = SILHOUETTE_WIDTH.PURIZUNYAN;
		mons_param = 1203;
		mons_kind = 128;
		mons_res = "m040_00";
		break;
	// 「フォンデュ」
	case FONDHU:			// Num12 = 1
		mons_scale = SCALE.FONDHU;
		mons_outline = SILHOUETTE_WIDTH.FONDHU;
		mons_param = 1202;
		mons_kind = 392;
		mons_res = "m125_00";
		break;
	// 「ドラキー」
	case DORAKI:			// Num12 = 2
		mons_scale = SCALE.DORAKI;
		mons_outline = SILHOUETTE_WIDTH.DORAKI;
		mons_param = 1201;
		mons_kind = 160;
		mons_res = "m052_00";
		break;
	// 「ナスビーラ」
	case NASUBINARA:		// Num12 = 3
		mons_scale = SCALE.NASUBINARA;
		mons_outline = SILHOUETTE_WIDTH.NASUBINARA;
		mons_param = 1204;
		mons_kind = 214;
		mons_res = "m069_00";
		break;
	default :
		DebugPrint("WARNING : フラグID (" + flg_mons + ") が不正です[Update]");
	}
	
// ▼モデル読込
	// ギミック
	local model_bush = ReadGimmick_("o_dem_02");	// 茂み
	// キャラクター
	local player = GetPlayerId_();					// 主人公
	local model_n_man = ReadNpc_("n043");			// ノチョリン
	local model_mons = ReadNpc_(mons_res);			// 初期モンスター

// ▼配置
	// 茂み
	local bush00 = ArrangePointGimmick_("o_dem_02", model_bush, "obj_bush000");
	
	// 主人公
	SetPointPos_(player, "player003");
	SetFace_(player, "Face_eyes_close");
	SetAlpha_(player, ALPHA_CLEAR);
	// ノチョーラ
	local nocho00 = ArrangePointNpc_(model_n_man, "npc_nocho003");
	SetStepSePan_(nocho00, false);
	// 初期モンスター
	local mons = ArrangePointNpc_(model_mons, "npc_priz002");
	SetScaleSilhouette(mons, mons_scale, mons_outline);
	SetAlpha_(mons, ALPHA_CLEAR);

// ▼非常駐モーション読込
	// ノチョーラ
	local nch_think02_L = ReadMotion_(nocho00, "n000_think02_L");		// 考える（腕組み）L
	local nch_arm_folde = ReadMotion_(nocho00, "n000_arm_folde");		// 考える（腕組み）→腕組み
	local nch_arm_folde_L = ReadMotion_(nocho00, "n000_arm_folde_L");	// 腕組みL

// ▼カメラ設定
	task_cam = Task_AnimeMoveCamera_("anmeye011", "anmtgt011");			// 300F

//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);
	
	// ▼カット16＠ノチョーラズーム～～～～～～～～～～～～
	MotionTalk(nocho00);
	
	//===============================================
	// *ノチョーラ
	// 「○モンスター名○！　イイ名前っちょねー！
	//-----------------------------------------------
	SetExchangePartyMonsterName_(MONSTER_PLACE.PLACE_PARTY, 0);
	
	OpenMsgWnd_();
	ShowMsg_("DEMO_012_MSG_010");
	KeyInputWait_();
	
	//-----------------------------------------------
	// ▽
	// 「ところで　お前……名前は？
	//-----------------------------------------------
	ShowMsg_("DEMO_012_MSG_020");
	KeyInputWait_();
	
	SetMotion_(nocho00, nch_think02_L, BLEND_XL);					// 考える（腕組み）L
	
	//-----------------------------------------------
	// ▽
	// 「まさか　こんなところで　お前という
	//-----------------------------------------------
	ShowMsg_("DEMO_012_MSG_030");
	KeyInputWait_();
	
	SetMotion_(nocho00, nch_arm_folde, BLEND_L);					// 考える（腕組み）→腕組み
	WaitMotion(nocho00);
	SetMotion_(nocho00, nch_arm_folde_L, BLEND_L);					// 腕組みL
	
	//-----------------------------------------------
	// ▽
	// 「これは　みんなを助けられる　チャンスかも。
	//-----------------------------------------------
	ShowMsg_("DEMO_012_MSG_040");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	// ノチョーラ　歩いていく
	SetMotion_(nocho00, MOT_WALK, BLEND_L);
	task_nocho = Task_RotateToPos_(nocho00, nocho_rot, ROTATE_DEMO_DEF);
	WaitTask(task_nocho);
	DeleteTask_(task_nocho);
	task_nocho = Task_MoveForward_(nocho00, 1.0, false);
	Wait_(60);
	
	// ・・・・・・・・・・
	DeleteTask_(task_cam);
	SetAlpha_(player, ALPHA_EXIST);
	SetAlpha_(mons, ALPHA_EXIST);
	task_player = Task_RotateToPos_(player, player_rot, ROTATE_DEMO_DEF);
	SetMotion_(player, MOT_WALK, BLEND_N);
	SetMotion_(mons, MOT_WALK, BLEND_N);
	// ・・・・・・・・・・
	
	// ▼カット16＠ノチョーラ歩いていく～～～～～～～～～～～～
	task_cam = Task_AnimeMoveCamera_("anmeye014", "anmtgt014");		// 90F
	task_mons = Task_RotateToPosSetMotion_(mons, nocho_rot, ROTATE_DEMO_DEF, MOT_WALK, MOT_WAIT);
	
	frame_sum = 0;
	frame_sum = WaitTask(task_player);
	SetMotion_(player, MOT_WAIT, BLEND_M);
	Wait_(60 - frame_sum);
	
	EndDemo(FADE_COLOR_BLACK);
}
