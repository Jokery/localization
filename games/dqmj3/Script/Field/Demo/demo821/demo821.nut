//=============================================
//
//		demo821[空のスターピース組み込み]
//
//=============================================

//-------------------------------------------------------------------------
//
//		読み込み・配置
//
//-------------------------------------------------------------------------
function Update()
{
// ▼フラグ設定
	local bit_green = GetEventFlg_("BFG_STAR_PIECE_EFFECT_ON_GREEN");		// Bit_1361 緑：ヤチホコ撃破フラグ
	local bit_blue = GetEventFlg_("BFG_STAR_PIECE_EFFECT_ON_BLUE");			// Bit_1362 青：ワダツミ撃破フラグ
	local bit_open_green = GetEventFlg_("BFG_PLAYED_YATIHOKO_SEALED_DEMO");	// Bit_1373 緑の扉が開いたか
	local bit_open_blue = GetEventFlg_("BFG_PLAYED_WADATUMI_SEALED_DEMO");	// Bit_1374 青の扉が開いたか

// ▼変数定義
	local task_cam, task_player, task_aroma, task_starseed;
	local task_aroma_step;
	local efc_player, efc_seed00, efc_seed01, efc_seed02, efc_kirakira00, efc_kirakira01;
	local efc_green, efc_brue;

// ▼リソース読込
	// ギミック
	local model_base = ReadGimmick_("o_effect_base");		// エフェクトベース
	local model_pod = ReadGimmick_("o_U00_02");				// 脱出ポッド
	local model_green_door = ReadGimmick_("o_U00_09");		// 扉:緑扉
	local model_blue_door = ReadGimmick_("o_U00_10");		// 扉:青扉
	
	local model_warp_center = ReadGimmick_("o_com_35");		// 加速リング(赤)
	local model_warp_right = ReadGimmick_("o_com_36");		// 加速リング(青)
	local model_warp_left = ReadGimmick_("o_com_37");		// 加速リング(緑)
	
	// キャラクター
	local player = GetPlayerId_();							// 主人公
	local model_aroma000 = ReadNpc_("n018");				// アロマ
	// エフェクト
	LoadEffect_("ef732_21_star_seed_r");					// スターシード 赤
	LoadEffect_("ef732_25_star_seed_base01");				// スターシード 完成する前
	LoadEffect_("ef732_24_star_seed_m_r");					// スターシード 軌道 赤
	LoadEffect_("ef340_06_star_seed_case");					// スターシードの入れ物
	LoadEffect_("ef340_07_star_seed_shaton_u");				// 電気エフェクト　上
	LoadEffect_("ef340_08_star_seed_shaton_d");				// 電気エフェクト　下

// ▼配置
	// 主人公
	SetPointPos_(player, "player001");
	
	// アロマ
	local aroma = ArrangePointNpc_(model_aroma000, "npc_aroma000");
	SetStepSe_(aroma, SILENT_STEP_SE);
	
	//スターシード 完成する前
	local seed_before = ArrangePointGimmick_("o_effect_base", model_base, "obj_seed000");
	SetPointPosNoFit_(seed_before, "obj_seed000");
	efc_seed01 = SetSelectBoneEffect_("ef732_25_star_seed_base01", seed_before, ATTACH_GLOBAL);
	
	// ■ヤチホコを撃破している場合■
	if (bit_green)
	{
		// スターシード 軌道 緑
		LoadEffect_("ef732_22_star_seed_m_g");
		efc_green = SetSelectBoneEffect_("ef732_22_star_seed_m_g" seed_before, ATTACH_GLOBAL);
	}
	
	// ■ワダツミを撃破している場合■
	if (bit_blue)
	{
		// スターシード 軌道 青
		LoadEffect_("ef732_23_star_seed_m_b");
		efc_brue = SetSelectBoneEffect_("ef732_23_star_seed_m_b", seed_before, ATTACH_GLOBAL);
	}
	
	// ■ヤチホコの指輪を見せていない場合■
	if (!bit_open_green)
	{
		// 緑扉
		local green_door = ArrangePointGimmick_("o_U00_09", model_green_door, "obj_U00_09");
	}
	
	// ■ワダツミの指輪を見せていない場合■
	if (!bit_open_blue)
	{
		// 青扉
		local blue_door = ArrangePointGimmick_("o_U00_10", model_blue_door, "obj_U00_10");
	}
	
	//スターシード 赤
	local starseed = ArrangePointGimmick_("ef732_21_star_seed_r", model_base, "obj_starseed000");
	SetPointPosNoFit_(starseed, "obj_starseed000");
	efc_seed00 = SetSelectBoneEffect_("ef732_21_star_seed_r", starseed, ATTACH_GLOBAL);
	
	//スターシードの入れ物
	local efc_case = SetSelectBoneEffect_("ef340_06_star_seed_case", seed_before, ATTACH_GLOBAL);
	local efc_shaton_u = SetPointWorldEffect_("ef340_07_star_seed_shaton_u", "efc_shaton_d000");		//電気　上
	local efc_shaton_d = SetPointWorldEffect_("ef340_08_star_seed_shaton_d", "efc_shaton_u000");		//電気　下
	
	// ポッド
	local pod00 = ArrangePointGimmick_("o_U00_02", model_pod, "obj_pod000");
	local pod01 = ArrangePointGimmick_("o_U00_02", model_pod, "obj_pod001");
	local pod02 = ArrangePointGimmick_("o_U00_02", model_pod, "obj_pod002");
	
	local warp_center = ArrangePointGimmick_("o_com_35", model_warp_center, "obj_warp_center000");		// 加速リング(赤)
	local warp_right = ArrangePointGimmick_("o_com_36", model_warp_right, "obj_warp_right000");			// 加速リング(青)
	local warp_left = ArrangePointGimmick_("o_com_37", model_warp_left, "obj_warp_left000");			// 加速リング(緑)

// ▼非常駐モーション読込
	local aroma_star_seed_L = ReadMotion_(aroma, "n018_star_seed_L");					//スターシードを持つL
	local aroma_star_seed_send = ReadMotion_(aroma, "n018_star_seed_send");				//スターシードを前へ
	local aroma_star_seed_send_L = ReadMotion_(aroma, "n018_star_seed_send_L");			//スターシードを前へL
	local aroma_star_seed_look_L = ReadMotion_(aroma, "n018_star_seed_look_L");			//スターシードを見るL
	local aroma_star_seed_look_up_L = ReadMotion_(aroma, "n018_star_seed_look_up_L");	//スターシードを持つ(上向き)L
	local aroma_look_right_L = ReadMotion_(aroma, "n018_look_right_L");					//アロマ 左向き
	local aroma_look_up_L = ReadMotion_(aroma, "n018_look_up_L");						//アロマ 上向き
	local player_look_up_L = ReadMotion_(player, "Player_look_up_L");					//主人公 上向き

// ▼モーション設定
	SetMotion_(aroma, aroma_star_seed_L, BLEND_N);				//スターシードを持つL

// ▼カメラ設定
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");

//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);
	
	SetMotion_(aroma, aroma_star_seed_look_L, BLEND_XL);		//スターシードを見るL
	
	//===============================================
	// ■アロマ
	// 「そういえば……アンセスとバーディの　出会いは
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_AROMA");
	ShowMsg_("DEMO_821_MSG_010");
	KeyInputWait_();
	
	SetMotion_(aroma, aroma_star_seed_look_L, BLEND_XL);		//スターシードを見るL
	
	//-----------------------------------------------
	// ▽
	// 「ホアカリと戦うため　空中ライドできる　相棒を
	//-----------------------------------------------
	ShowMsg_("DEMO_821_MSG_020");
	KeyInputWait_();
	
	SetMotion_(aroma, aroma_star_seed_look_up_L, BLEND_XL);		//スターシードを持つ(上向き)L
	
	//-----------------------------------------------
	// ▽
	// 「まぁ　そこで　ひと騒動あったんだけどね。
	//-----------------------------------------------
	ShowMsg_("DEMO_821_MSG_030");
	KeyInputWait_();
	
	//-----------------------------------------------
	// ▽
	// 「アンセスの相棒に　なってからは
	//-----------------------------------------------
	ShowMsg_("DEMO_821_MSG_040");
	KeyInputWait_();
	
	SetMotion_(aroma, aroma_star_seed_L, BLEND_XL);				//スターシードを持つL
	
	//-----------------------------------------------
	// ▽
	// 「男が男に　ほれこむっていうの？
	//-----------------------------------------------
	ShowMsg_("DEMO_821_MSG_050");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	DeleteTask_(task_cam);
	Wait_(20);
	
	SetPointPosNoFit_(starseed, "obj_starseed001");
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット2
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");
	
	SetAlpha_(player, 0);
	Wait_(40);

	SetMotion_(aroma, aroma_star_seed_look_L, BLEND_XL);		//スターシードを見るL

	Wait_(20);
	
	//===============================================
	// ■アロマ
	// 「ともかく　あのふたりの　大活躍によって
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_AROMA");
	ShowMsg_("DEMO_821_MSG_060");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetMotion_(aroma, aroma_star_seed_send, BLEND_XL);				//スターシードを前へ
	Wait_(10);
	
	PlaySE_("SE_DEM_199");
	local task_starseed = Task_AnimeMoveNoFit_(starseed, "anm_starseed000");		//スターシード00
	WaitMotion(aroma);
	SetMotion_(aroma, aroma_star_seed_send_L, BLEND_M);				//スターシードを前へ
	
	Wait_(90);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット3
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");
	PlaySE_("SE_DEM_200");

	DeleteTask_(task_starseed);
	
	task_starseed = Task_AnimeMoveNoDirNoFit_(starseed, "anm_starseed001");		//スターシード01
	
	SetAlpha_(player, 1);
	
	SetDir_(player, -120);
	SetDir_(aroma, -90);	
	
	Wait_(90);
	
	//-----
	SetFade_(FADE_OUT, FADE_COLOR_WHITE , 30);
	WaitFade_();
	
	DeleteEffectEmitter_(efc_seed00);
	SetMotion_(player, player_look_up_L, BLEND_XL);				//主人公 上向き
	SetMotion_(aroma, aroma_look_up_L, BLEND_XL);				//アロマ 上向き
	Wait_(60);
	
	efc_seed02 = SetSelectBoneEffect_("ef732_24_star_seed_m_r" seed_before, ATTACH_GLOBAL);
	if (bit_green)
	{
		DeleteEffect_(efc_green);
		efc_green = SetSelectBoneEffect_("ef732_22_star_seed_m_g" seed_before, ATTACH_GLOBAL);
	}
	if (bit_blue)
	{
		DeleteEffect_(efc_brue);
		efc_brue = SetSelectBoneEffect_("ef732_23_star_seed_m_b" seed_before, ATTACH_GLOBAL);
	}
	
	SetFade_(FADE_IN, FADE_COLOR_WHITE , 30);
	WaitFade_();
	//-----
	
	Wait_(90);
	DeleteTask_(task_cam);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット4
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");
	
	SetMotion_(aroma, MOT_WALK, BLEND_XL);							//アロマ 歩き
	task_aroma = Task_RotateToPos_(aroma, GetPos_(player), 2.0);
	task_aroma_step = Task_PlaySe_("SE_FLD_016", 15);
	Wait_(20);
	
	SetMotion_(aroma, MOT_TALKLOOP, BLEND_XL);
	DeleteTask_(task_aroma_step);
	Wait_(20);
	
	//===============================================
	// ■アロマ
	// 「オッケー！　問題なし！
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_AROMA");
	ShowMsg_("DEMO_821_MSG_070");
	SetFace_(aroma, "Face_smile");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetMotion_(aroma, MOT_WAIT, BLEND_XL);
	Wait_(20);
	
	EndDemo(FADE_COLOR_BLACK);
}
