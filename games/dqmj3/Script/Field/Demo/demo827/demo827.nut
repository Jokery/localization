//=============================================
//
//		demo827 [ダースガルマ再戦]
//
//=============================================

//-------------------------------------------------------------------------
//
//		読み込み・配置
//
//-------------------------------------------------------------------------
function Update()
{
	local flg = GetNumFlg_("NUM_FLG_COUNT_UP_DEMO_834");	// Num124	第一形態：0　第二形態：1　第三形態：2　最終形態：3
	//m180_00:ダースガルマ(１～３形態)　m186_00:ダグジャガルマ(最終形態)
	//メッシュ名	【arm】手、			第二形態で表示
	//				【breakCover】牙と首と尻尾、	第三形態で表示
	//				【cover】首の後部分、	第三形態で非表示
	//SetMeshVisible_(npc, "cover", false);

// ▼変数定義
	local task_cam, task_player, task_aroma;
	local efc_player;

// ▼リソース読込
	// キャラクター
	local player = GetPlayerId_();					// 主人公
	local model_rena = ReadNpc_("n007");			// レナーテ
	local m_boss = ReadNpc_("m180_00");				// ダースガルマ
	local m_boss2 = ReadNpc_("m186_00");			// ダグジャガルマ
	local g_mother = ReadGimmick_("o_C03_02");
	local g_motherK = ReadGimmick_("o_C03_03");

	LoadEffect_("ef730_01_oth_dark_aura01");

// ▼配置
	SetPos_(player,false);

	// レナーテ
	local rena = ArrangePointNpc_(model_rena, "mother");
	SetPointPosNoFit_(rena, "mother");
	SetFace_(rena, "Face_loop_close");

	local mother = ArrangePointGimmick_("o_C03_02", g_mother, "mother");
	local motherK = ArrangePointGimmick_("o_C03_03", g_motherK, "mother");
	SetMotion_(mother, MOT_GIMMICK_1 ,1);

	local galma, efc_gal;
	local galma_spell_actuate;
	if(flg <= 2){
		// ダースガルマ
		galma = ArrangePointNpc_(m_boss, "galmid");
		if(flg == 0){
			SetMeshVisible_(galma, "Model", true);		// 本体
			SetMeshVisible_(galma, "cover", true);		// 割れてないカバー
			SetMeshVisible_(galma, "arm", false);		// 腕
			SetMeshVisible_(galma, "breakCover", false);// 割れてるカバー
			SetMeshVisible_(galma, "head", false);		// 竜
			SetPointCameraEye_("a_eye");
			SetPointCameraTarget_("a_tgt1");
			efc_gal = SetSelectBoneEffectSetOffset_("ef730_01_oth_dark_aura01", galma, ATTACH_GLOBAL, Vec3(0.0, 40.0, 0.0))		//ダークルーラ発動前
			SetEffectScale_(efc_gal,1.5);
		}
		if(flg == 1){
			SetMeshVisible_(galma, "Model", true);		// 本体
			SetMeshVisible_(galma, "cover", true);		// 割れてないカバー
			SetMeshVisible_(galma, "arm", true);		// 腕
			SetMeshVisible_(galma, "breakCover", false);// 割れてるカバー
			SetMeshVisible_(galma, "head", false);		// 竜
			SetPointCameraEye_("a_eye");
			SetPointCameraTarget_("a_tgt1");
			efc_gal = SetSelectBoneEffectSetOffset_("ef730_01_oth_dark_aura01", galma, ATTACH_GLOBAL, Vec3(0.0, 40.0, 0.0))		//ダークルーラ発動前
			SetEffectScale_(efc_gal,1.5);
		}
		if(flg == 2){
			// 本当はデフォルトでメッシュはこの状態だが、明示の意味で
			SetMeshVisible_(galma, "Model", true);		// 本体
			SetMeshVisible_(galma, "cover", false);		// 割れてないカバー
			SetMeshVisible_(galma, "arm", true);		// 腕
			SetMeshVisible_(galma, "breakCover", true);	// 割れてるカバー
			SetMeshVisible_(galma, "head", true);		// 竜
			SetPointCameraEye_("a_eye");
			SetPointCameraTarget_("a_tgt2");
			efc_gal = SetSelectBoneEffectSetOffset_("ef730_01_oth_dark_aura01", galma, ATTACH_GLOBAL, Vec3(0.0, 30.0, 0.0))		//ダークルーラ発動前
			SetEffectScale_(efc_gal,1.5);
		}
	}else{
		// ダグジャガルマ
		galma = ArrangePointNpc_(m_boss2, "galma");
		SetPointCameraEye_("d_eye");
		SetPointCameraTarget_("d_tgt");
		efc_gal = SetSelectBoneEffectSetOffset_("ef730_01_oth_dark_aura01", galma, ATTACH_GLOBAL, Vec3(0.0, 20.0, 0.0))		//ダークルーラ発動前
		SetEffectScale_(efc_gal,1.5);
		
		galma_spell_actuate = ReadMotion_(galma, "n042_spell_actuate");	// 魔法詠唱
	}
	SetScaleSilhouette(galma, SCALE.G, SILHOUETTE_WIDTH.G);

// ▼非常駐モーション読込
	local p_wait = ReadMotion_(player, "Player_battle01_L");
	local p_run = ReadMotion_(player, "Player_run_battle");
	local rena_mother_L = ReadMotion_(rena, "n007_mother_L");				// マザーの中のレナーテ

// ▼初期モーション
	SetMotion_(rena, rena_mother_L, BLEND_N);

	SetDir_(player, 0);
	SetMotion_(player, MOT_RUN, BLEND_M);
	SetMotionSpeed_(player, 0.875);
	local task_player = Task_AnimeMoveNoDir_(player, "player");


//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------
//cut01
	StartDemoNoFade(FADE_COLOR_BLACK);// フェード中にモーションを叩く必要がある為
	
	Wait_(26);
	SetMotion_(player, p_run, 8);
	Wait_(8);
	PlaySE_("SE_FLD_016");//足音
	SetMotion_(player, p_wait, 20);
	Wait_(8);
	PlaySE_("SE_FLD_016");//足音
	Wait_(38);
	
	if(flg <= 1){
		SetPointCameraEye_("b_eye");
		SetPointCameraTarget_("b_tgt");
	}
	
	if(flg == 2){
		SetPointCameraEye_("b_eye");
		SetPointCameraTarget_("b2_tgt");
	}
	
	if(flg == 3){
		SetPointCameraEye_("d2_eye");
		SetPointCameraTarget_("d2_tgt");
	}
	
	// 【ダースガルマに負けた場合】
	if(flg <= 2){
		//===============================================
		// ■ダースガルマ
		// 「来たか。今度こそ……
		// 　今度こそ　貴様に　トドメを刺す！
		//-----------------------------------------------
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_DARSGARUMA");
		ShowMsg_("DEMO_827_MSG_010");
		KeyInputWait_();
		
		if(flg <= 1){
			SetMotion_(galma, MOT_SPELL_START, 8);
			local task_gal = Task_ChangeMotion_(galma, MOT_SPELL_CHARGE, 8);
		}
		else if(flg == 2){
			SetMotion_(galma, MOT_SWORD_START, 8);
			local task_gal = Task_ChangeMotion_(galma, MOT_SWORD_CHARGE, 8);
		}
		
		//-----------------------------------------------
		// 「このダースガルマの　チカラと恐怖を
		// 　地獄の門番に　伝えるがいい！
		//-----------------------------------------------
		ShowMsg_("DEMO_827_MSG_020");
		KeyInputWait_();
		CloseMsgWnd_();
		//===============================================
	}
	
	// 【ダグジャガルマに負けた場合】
	else{
		//===============================================
		// ■ダグジャガルマ
		// 「くっくっく……自ら　戻ってくるとは
		// 　逃げ場は　どこにもないと　あきらめたか？
		//-----------------------------------------------
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_DAGUJAGARUMA");
		ShowMsg_("DEMO_827_MSG_030");
		KeyInputWait_();
		
		//-----------------------------------------------
		// 「それとも　まさか……もう一度　戦えば
		// 　勝てるなどと　思っているのでは　あるまいな？
		//-----------------------------------------------
		ShowMsg_("DEMO_827_MSG_040");
		KeyInputWait_();
		
		SetMotion_(galma, MOT_SPELL_START, 16);
		local task_gal = Task_ChangeMotion_(galma, MOT_SPELL_CHARGE, 16);
		
		//-----------------------------------------------
		// 「このダースガルマの　チカラと恐怖を
		// 　地獄の門番に　伝えるがいい！
		//-----------------------------------------------
		ShowMsg_("DEMO_827_MSG_050");
		KeyInputWait_();
		CloseMsgWnd_();
		//===============================================
	}
	
	Wait_(15);
	if(flg <= 1){
		SetMotion_(galma, MOT_SWORD_ACTUATE, 32);
		PlaySE_("SE_DEM_210");
		Wait_(28);
	}
	
	if(flg == 2){
		SetMotion_(galma, MOT_SPELL_ACTUATE, 32);
		Wait_(32);
		PlaySE_("SE_SKL_020");
	}
	
	if(flg == 3){
		SetMotion_(galma, galma_spell_actuate, BLEND_XL);
		PlaySE_("SE_DEM_223");
		SetMotionSpeed_(galma, 0.5);
		Wait_(20);
		SetMotionSpeed_(galma, 0.3);
		Wait_(45);
		SetMotionSpeed_(galma, 1.0);
		Wait_(10);
	
		StartDecayEarthQuake_(15, 3, 15);
		Wait_(15);
	
		SetMotionSpeed_(galma, 0.1);
		StopBgm_(BGM_STOP_DEF);
		local task = Task_EncountEffect_(ENCOUNT_BOSS);
		WaitTask(task);
		DeleteAllTask_();
		End_();
	}else{
		EncountEndDemo(ENCOUNT_BOSS);
	}
}
