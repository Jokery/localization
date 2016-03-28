//=============================================
//
//		demo835[鬼械神ダグジャガルマ]
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
	local task_cam, task_player, task_dagja;
	local efc_cam, efc_player, efc_darsgrm, efc_dagja0, efc_dagja1, efc_dagja2;
	local efc_explosion0, efc_explosion1;
	local bone_efc0, bone_efc1, bone_efc2, bone_efc3, bone_efc4;
	local offset_aroma = Vec3(0, 3.0, 0);

// ▼リソース読込
	// ギミック
	local model_mother = ReadGimmick_("o_C03_02");		// マザー
	local model_decoration = ReadGimmick_("o_C03_03");	// マザー飾り
	local model_tail_s = ReadGimmick_("o_dem_21");		// 尻尾(細)
	local model_tail_t = ReadGimmick_("o_dem_22");		// 尻尾(太)
	// キャラクター
	local player = GetPlayerId_();						// 主人公
	local model_aroma = ReadNpc_("n018");				// アロマ
	local model_rena = ReadNpc_("n007");				// レナーテ
	local model_dagja = ReadNpc_("n042");				// ダグジャガルマ
	local model_darsgrm = ReadNpc_("m180_00");			// ダースガルマ
	// エフェクト
	LoadEffect_("ef733_01_sym_shuchusen01");			// 集中線
	LoadEffect_("ef712_10_emo_surprise01");				// 「！」
	LoadEffect_("ef721_02_nat_smoke_n02");				// 煙02
	LoadEffect_("ef721_03_nat_smoke_n03");				// 煙03
	LoadEffect_("ef852_03_explosion_db");				// 大爆発
	LoadEffect_("ef883_07_dg01");						// ダースガルマ瀕死
	LoadEffect_("ef883_01_dg_transform01");				// ダグジャガルマの変身１
	LoadEffect_("ef883_02_dg_transform02");				// ダグジャガルマの変身２
	LoadEffect_("ef883_03_dg_transform03");				// ダグジャガルマの変身３
	LoadEffect_("ef730_01_oth_dark_aura01");			// 禍々しいオーラ
	//レイアウト
	LoadLayout_("black");								// ブラック

// ▼配置
	// マザー
	local mother = ArrangePointGimmick_("o_C03_02", model_mother, "obj_mother000");
	SetMotion_(mother, MOT_GIMMICK_1, BLEND_N);
	// マザー飾り
	local decoration = ArrangePointGimmick_("o_C03_03", model_decoration, "obj_mother000");
	// 尻尾(細)
	local tail_s = ArrangePointGimmick_("o_dem_21", model_tail_s, "npc_darsgrm000");
	SetMotion_(tail_s, MOT_GIMMICK_1, BLEND_N);
	SetScaleSilhouette(tail_s, SCALE.G, SILHOUETTE_WIDTH.G);
	SetVisible(tail_s, false);
	// 尻尾(太)
	local tail_t = ArrangePointGimmick_("o_dem_22", model_tail_t, "npc_darsgrm000");
	SetMotion_(tail_t, MOT_GIMMICK_1, BLEND_N);
	SetScaleSilhouette(tail_t, SCALE.G, SILHOUETTE_WIDTH.G);
	SetVisible(tail_t, false);
	
	// 主人公
	SetPointPos_(player, "player000");
	SetVisible(player, false);
	// アロマ
	local aroma = ArrangePointNpc_(model_aroma, "npc_aroma000");
	SetVisible(aroma, false);
	// レナーテ
	local rena = ArrangePointNpc_(model_rena, "obj_mother000");
	SetPointPosNoFit_(rena, "obj_mother000");
	SetFace_(rena, "Face_loop_close");
	// ダースガルマ
	local darsgrm = ArrangePointNpc_(model_darsgrm, "npc_darsgrm000");
	SetScaleSilhouette(darsgrm, SCALE.G, SILHOUETTE_WIDTH.G);
	// ダグジャガルマ
	local dagja = ArrangePointNpc_(model_dagja, "npc_darsgrm000");
	SetScaleSilhouette(dagja, SCALE.G, SILHOUETTE_WIDTH.G);
	SetVisible(dagja, false);

// ▼非常駐モーション読込
	// 主人公
	local player_caution01_L = ReadMotion_(player, "Player_caution01_L");	// 警戒L
	// アロマ
	local aroma_guard_L = ReadMotion_(aroma, "n018_guard_L");				// 構えるL
	// レナーテ
	local rena_mother_L = ReadMotion_(rena, "n007_mother_L");				// マザーの中のレナーテ
	// ダースガルマ
	local darsgrm_wait_L = ReadMotion_(darsgrm, "m180_00_wait_L");			// やられ前ループL
	local darsgrm_die = ReadMotion_(darsgrm, "m180_00_die");				// 変身２
	local darsgrm_die_L = ReadMotion_(darsgrm, "m180_00_die_L");			// 変身２L
	// ダグジャガルマ
	local dagja_transform01 = ReadMotion_(dagja, "n042_transform01");		// 顔を出す
	local dagja_transform01_L = ReadMotion_(dagja, "n042_transform01_L");	// 顔を出すL
	local dagja_transform02 = ReadMotion_(dagja, "n042_transform02");		// 翼を出す
	local dagja_transform02_L = ReadMotion_(dagja, "n042_transform02_L");	// 翼を出すL
	local dagja_transform03 = ReadMotion_(dagja, "n042_transform03");		// 最終変身
	local dagja_spell_actuate = ReadMotion_(dagja, "n042_spell_actuate");	// 魔法詠唱

// ▼モーション設定
	SetMotion_(rena, rena_mother_L, BLEND_N);
	SetMotion_(darsgrm, darsgrm_die, BLEND_N);

// ▼カメラ設定
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");

//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------

	StartDemoNoFade(FADE_COLOR_BLACK);
	
	// ▼カット１＠ダースガルマ、やられ～～～～～～～～～～～
	Wait_(36);
	PlaySE_("SE_DEM_218");
	efc_explosion0 = SetPointWorldEffect_("ef852_03_explosion_db", "efc_explosion000");
	Wait_(45);
	
	efc_explosion1 = SetPointWorldEffect_("ef852_03_explosion_db", "efc_explosion001");
	Wait_(20);
	
	SetVisible(tail_s, true);
	
	// ▼カット２＠ダースガルマＵＰ～～～～～～～～～～～～～
	SetPointCameraEye_("cameye003");
	SetPointCameraTarget_("camtgt003");
	Wait_(5);
	
	efc_darsgrm = SetSelectBoneEffect_("ef721_03_nat_smoke_n03", darsgrm, ATTACH_GLOBAL);
	
	StartEarthQuake_(15, 3, 3);
	Wait_(15);
	StartDecayEarthQuake_(15, 3, 1.5);
	Wait_(30);
	
	WaitMotion(darsgrm);
	SetMotion_(darsgrm, darsgrm_die_L, BLEND_N);
	
	StartEarthQuake_(15, 3, 1);
	SetPointWorldEffect_("ef721_02_nat_smoke_n02", "efc_smoke000");
	Wait_(60);
	
	SetLayoutAnime_("fade_in", false);											//黒半透明イン
	Wait_(30);
	SetLayoutAnime_("loop", false);												//黒半透明L
	Wait_(5);

	//===============================================
	// ■ダースガルマ
	// 「……まだ　終わったと思うな？
	//-----------------------------------------------
	ShowScreenMessage_("DEMO_835_MSG_010", false);
	Wait_(30);
	SetLayoutAnime_("fade_out", false);											//黒半透明アウト
	Wait_(30);
	//===============================================
	
	// ▼カット３＠ダースガルマの頭→尻尾～～～～～～～～～～
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");		// 260F
	Wait_(210);
	PlaySE_("SE_DEM_218");
	bone_efc0 = SetSelectBoneEffectSetBoneName_("ef883_07_dg01", tail_s, "tailA_02", Vec3(0.0, 0.0, 0.0));
	bone_efc1 = SetSelectBoneEffectSetBoneName_("ef883_07_dg01", tail_s, "tailA_03", Vec3(0.0, 0.0, 0.0));
	bone_efc2 = SetSelectBoneEffectSetBoneName_("ef883_07_dg01", tail_s, "tailA_05", Vec3(0.0, -5.0, 5.0));
	bone_efc3 = SetSelectBoneEffectSetBoneName_("ef883_07_dg01", tail_s, "tailA_05", Vec3(0.0, 0.0, 0.0));
	bone_efc4 = SetSelectBoneEffectSetBoneName_("ef883_07_dg01", tail_s, "tailA_08", Vec3(0.0, 0.0, 0.0));
	SetEffectScale_(bone_efc0, 1.5);
	SetEffectScale_(bone_efc1, 1.5);
	SetEffectScale_(bone_efc2, 1.5);
	SetEffectScale_(bone_efc3, 1.5);
	SetEffectScale_(bone_efc4, 1.5);
	
	SetMotion_(tail_s, MOT_GIMMICK_0, BLEND_N);		// 尻尾が動き出す
	Wait_(60);
	
	uChangeEffectScale(bone_efc2, 1.5, 2.0, 70)		// 徐々に大きくする
	
	uChangeEffectScale(bone_efc2, 2.0, 6.5, 20)		// 徐々に大きくする
	WaitMotion(tail_s);
	Wait_(10);
	
	SetVisible(player, true);
	SetVisible(aroma, true);
	
	SetEffectScale_(bone_efc0, 3.0);
	SetEffectScale_(bone_efc1, 3.0);
	
	DeleteTask_(task_cam);
	
	// ▼カット４＠主人公とアロマ、驚く～～～～～～～～～～～～
	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");
	
	StartEarthQuake_(-1, 3, 0.3);
	
	SurpriseDisp(player, 0.7);
//	SurpriseDispSetOffset(aroma, offset_aroma, 0.6);
	
	local effectId = SetSelectBoneEffectSetOffset_("ef712_10_emo_surprise01", aroma, ATTACH_EFFECT1, offset_aroma);
	SetEffectScale_(effectId, 0.6);
	
	SetMotion_(player, player_caution01_L, BLEND_L);
	SetMotion_(aroma, aroma_guard_L, BLEND_L);
	Wait_(45);
	
	SetVisible(tail_s, false);
	SetVisible(tail_t, true);
	SetMeshVisible_(tail_t, "Model_3", false);
	
	StopEarthQuake_();
	
	// ▼カット５＠尻尾と主人公とアロマ～～～～～～～～～～～～
	SetPointCameraEye_("cameye002");
	SetPointCameraTarget_("camtgt002");
	
	StartEarthQuake_(-1, 3, 0.5);
	SetMotion_(tail_t, MOT_GIMMICK_0, BLEND_N);
	WaitMotion(tail_t);
	
	SetVisible(player, false);
	SetVisible(aroma, false);
	StopEarthQuake_();
	
	efc_dagja0 = SetSelectBoneEffectSetOffset_("ef730_01_oth_dark_aura01", dagja, ATTACH_EFFECT2, Vec3(0.0, -5.0, 0.0));
	
	// ▼カット６＠顔を出す～～～～～～～～～～～～～～～～～～
	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");		// 60F
	Wait_(15);
	
	efc_dagja1 = SetSelectBoneEffect_("ef883_01_dg_transform01", dagja, ATTACH_GLOBAL);
	
	SetVisible(dagja, true);
	PlaySE_("SE_DEM_220");
	SetMotion_(dagja, dagja_transform01, BLEND_N);
	Wait_(1);
	
	StartBlurEffect_();
	SetMeshVisible_(tail_t, "Model_2", false);
	SetMeshVisible_(tail_t, "Model_3", true);
	SetMotion_(tail_t, MOT_GIMMICK_1, BLEND_N);
	WaitMotion(dagja);
	EndBlurEffect_();
	
	SetMotion_(dagja, dagja_transform01_L, BLEND_N);
	SetMotion_(tail_t, MOT_GIMMICK_2, BLEND_N);
	
	WaitTask(task_cam);
	Wait_(30);
	
	SetVisible(darsgrm, false);
	
	// ▼カット７＠翼を出す～～～～～～～～～～～～～～～～～～
	task_cam = Task_AnimeMoveCamera_("anmeye003", "anmtgt003");		// 100F
	
	efc_dagja1 = SetSelectBoneEffect_("ef883_02_dg_transform02", dagja, ATTACH_GLOBAL);
	SetMotion_(dagja, dagja_transform02, BLEND_N);
	SetMotion_(tail_t, MOT_GIMMICK_3, BLEND_N);
	Wait_(15);
	StartBlurEffect_();
	WaitMotion(dagja);
	PlaySE_("SE_DEM_221");
	SetMotion_(dagja, dagja_transform02_L, BLEND_N);
	SetMotion_(tail_t, MOT_GIMMICK_4, BLEND_N);
	Wait_(10);
	EndBlurEffect_();
	
	WaitTask(task_cam);
	
	// ▼カット８＠最終変身～～～～～～～～～～～～～～～～～～
	task_cam = Task_AnimeMoveCamera_("anmeye004", "anmtgt004");		// 136F
	PlaySE_("SE_DEM_222");
	efc_dagja1 = SetSelectBoneEffect_("ef883_03_dg_transform03", dagja, ATTACH_GLOBAL);
	SetMotion_(dagja, dagja_transform03, BLEND_M);
	SetMotion_(tail_t, MOT_GIMMICK_5, BLEND_N);
	Wait_(110);
	
	DeleteEffect_(bone_efc0);
	DeleteEffect_(bone_efc1);
	DeleteEffect_(bone_efc2);
	DeleteEffect_(bone_efc3);
	DeleteEffect_(bone_efc4);
	SetVisible(tail_t, false);
	
	SetEffectScale_(efc_dagja0, 1.5);
	PlaySE_("SE_DEM_026");	// ■SE:集中線
	efc_cam = SetCameraEffect_("ef733_01_sym_shuchusen01", CAMERA_DEF);	// 集中線
	Wait_(10);
	DeleteEffectEmitter_(efc_cam);
	
	WaitMotion(dagja);
	SetMotion_(dagja, MOT_WAIT, BLEND_XL);
	
	//===============================================
	// *ダグジャガルマ
	// 「地を裂き！　海を割り！　空をも焼きつくす！
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_835_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
//	Wait_(30);
	
	efc_dagja2 = SetSelectBoneEffectSetBoneName_("ef730_01_oth_dark_aura01", dagja, "j_tail_010", Vec3(0.0, 0.0, 0.0));
	SetEffectScale_(efc_dagja2, 0.5);
	
	// ▼カット９＠尻尾ＵＰ～～～～～～～～～～～～～～～～～～
	task_cam = Task_AnimeMoveCamera_("anmeye005", "anmtgt005");		// 136F
	WaitTask(task_cam);
	
	// ▼カット10＠翼ＵＰ～～～～～～～～～～～～～～～～～～～
	task_cam = Task_AnimeMoveCamera_("anmeye006", "anmtgt006");		// 136F
	WaitTask(task_cam);
	Wait_(15);
	
	// ▼カット11＠ガルマザード戦闘開始～～～～～～～～～～～～
	SetPointCameraEye_("cameye004");
	SetPointCameraTarget_("camtgt004");
	
	//===============================================
	// ■ダースガルマ
	// 「このダグジャガルマで　<name_player/>！
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_DAGUJAGARUMA");
	ShowMsg_("DEMO_835_MSG_030");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	
	task_dagja = Task_RotateToDir_(dagja, 176, 0.5);
	SetMotion_(dagja, dagja_spell_actuate, BLEND_XL);
	PlaySE_("SE_DEM_223");
	SetMotionSpeed_(dagja, 0.5);
	Wait_(20);
	SetMotionSpeed_(dagja, 0.3);
	Wait_(45);
	SetMotionSpeed_(dagja, 1.0);
	Wait_(10);
	
	StartDecayEarthQuake_(15, 3, 15);
	Wait_(15);
	
	SetMotionSpeed_(dagja, 0.1);
	StopBgm_(BGM_STOP_DEF);
	EndDemoBgmFade_(FADE_DEF);
	local task = Task_EncountEffect_(ENCOUNT_BOSS);
	WaitTask(task);
	DeleteAllTask_();
	End_();
	
}


//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//		エフェクトサイズを徐々に変更
//----------------------------------------------------------------------------
//	引数	: efc			エフェクトＩＤ
//			: start_size	初期エフェクトサイズ
//			: end_size		最終エフェクトサイズ
//			: frm			フレーム数
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function uChangeEffectScale(efc, start_size, end_size, frm)
{
	local change_size;		// １フレームで変更するサイズ
	
	change_size = (end_size - start_size) / frm;		// (最終サイズ － 初期サイズ) ÷ フレーム数
	
	for (local i=1; i<=frm; i++) {
		SetEffectScale_(efc, start_size + (change_size * i));
		Wait_(1);
	}
}
