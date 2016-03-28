//=============================================
//
//		demo106[電源の復旧_2(都市全景)]
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
	local task_cam;
	
// ▼モデル読み込み
	local npc_ace = ReadNpc_("n002");		// エース
	local npc_king = ReadNpc_("n003");		// キング
	local npc_jack = ReadNpc_("n001");		// ジャック
	local npc_queen = ReadNpc_("n005");		// クイーン
	local npc_nocho = ReadNpc_("n000");		// ノチョーラ
	
// ▼ギミック設置	
	local window = ReadGimmick_("o_dem_05");									// センタービルの窓ギミック
	local model_shelter = ReadGimmick_("o_A00_03");	//シェルター
	local model_door = ReadGimmick_("o_A00_01");	//扉
	local model_throne = ReadGimmick_("o_com_05");								// 玉座
	local model_centar = ReadGimmick_("o_A00_04");								// センタービル(点灯)
	
	local res_tele = ArrangePointGimmick_("o_dem_05", window, "obj_light000");		// センタービルの窓ギミック
	local shelter000 = ArrangePointGimmick_("o_A00_03", model_shelter, "obj_shelter000");
	local shelter001 = ArrangePointGimmick_("o_A00_03", model_shelter, "obj_shelter001");
	local shelter002 = ArrangePointGimmick_("o_A00_03", model_shelter, "obj_shelter002");
	local door000 = ArrangePointGimmick_("o_A00_01", model_door, "obj_door000");
	local door001 = ArrangePointGimmick_("o_A00_01", model_door, "obj_door001");
	local throne = ArrangePointGimmick_("o_com_05", model_throne, "obj_throne000");	// 王座
	local centar = ArrangePointGimmick_("o_A00_04", model_centar, "obj_light000");	// センタービル(点灯)
	SetActive_(centar, false);
	
// ▼設置
	local res_ace = ArrangePointNpc_(npc_ace, "npc_ace000");
	local res_king = ArrangePointNpc_(npc_king, "npc_king000");
	local res_jack = ArrangePointNpc_(npc_jack, "npc_jack000");
	local res_queen = ArrangePointNpc_(npc_queen, "npc_queen000");
	local res_nocho = ArrangePointNpc_(npc_nocho, "npc_nocho000");
	local res_nocho2 = ArrangePointNpc_(npc_nocho, "npc_nocho001");
	local res_nocho3 = ArrangePointNpc_(npc_nocho, "npc_nocho002");
	local res_nocho4 = ArrangePointNpc_(npc_nocho, "npc_nocho003");
	
	//初期の向き
	SetDir_(res_ace, 200);
	SetDir_(res_king, 160);
	SetDir_(res_jack, 190);
	SetDir_(res_queen, 180);
	SetDir_(res_nocho, 180);
	SetDir_(res_nocho2, 180);
	SetDir_(res_nocho3, 180);
	SetDir_(res_nocho4, 180);
	
// ▼モーションの読み込み
	local joyL_mob1 = ReadMotion_(res_nocho, "n000_rejoice_L");		//ノチョーラ１喜び
	local joyL_mob2 = ReadMotion_(res_nocho2, "n000_rejoice_L");	//ノチョーラ２喜び
	local joyL_mob3 = ReadMotion_(res_nocho3, "n000_rejoice_L");	//ノチョーラ３喜び
	local joyL_mob4 = ReadMotion_(res_nocho4, "n000_rejoice_L");	//ノチョーラ４喜び
	local joyL_king = ReadMotion_(res_king, "n003_rejoice_L");		//キング喜び
	local joyL_jack = ReadMotion_(res_jack, "n001_rejoice_L");		//ジャック喜び
	local joyL_ace = ReadMotion_(res_ace, "n002_talk_joy_L");		//エース１喜び
	local stick_king = ReadMotion_(res_king, "n003_stick_up");		//キング待機→杖掲げ
	local stickL_king = ReadMotion_(res_king, "n003_stick_up_L");	//キング杖掲げ
	
// ▼カメラ設定
	// ▼カメラ１～～～～～～～～～～～～～～～～～～～～～～～～
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");
	SetTime_(15120);		// 夕方前
// ▼エフェクトの読み込み
	LoadEffect_("ef712_04_emo_joy01");
	LoadEffect_("ef712_10_emo_surprise01");
	LoadEffect_("ef810_03_power_on");
	
	local pwr_on = SetPointWorldEffect_("ef810_03_power_on", "obj_light000");
	
	SetMotion_(res_tele, MOT_GIMMICK_1, 1);	

//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------
//	StartDemo(FADE_COLOR_BLACK);
	SetFade_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
	Wait_(28);
	PlaySE_("SE_DEM_040");
	Wait_(2);
	Wait_(250);
	
	WaitTask(task_cam);
	Wait_(30);
	DeleteTask_(task_cam);

	// フェードイン
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 30);
	WaitFade_();
	DeleteEffect_(pwr_on);
	SetActive_(centar, true);
	SetActive_(res_tele, false);
	SetMotion_(centar, MOT_GIMMICK_1, BLEND_N);
	Wait_(25);
	//カット２
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");
	Wait_(35);
	// フェードイン
	SetFade_(FADE_IN, FADE_COLOR_BLACK, 30);
	WaitFade_();
	
	Wait_(10);
	SetMotion_(shelter000, MOT_GIMMICK_1, 0);
	PlaySE_("SE_DEM_038");
	
	local sup_king = SetSelectBoneEffect_("ef712_10_emo_surprise01", res_king, ATTACH_EFFECT2);
	local sup_ace = SetSelectBoneEffect_("ef712_10_emo_surprise01", res_ace, ATTACH_EFFECT2);
	Wait_(10);
	local sup_jack = SetSelectBoneEffect_("ef712_10_emo_surprise01", res_jack, ATTACH_EFFECT2);
	local sup_queen = SetSelectBoneEffect_("ef712_10_emo_surprise01", res_queen, ATTACH_EFFECT2);
	local sup_moti1 = SetSelectBoneEffect_("ef712_10_emo_surprise01", res_nocho, ATTACH_EFFECT2);
	Wait_(3);
	local sup_moti2 = SetSelectBoneEffect_("ef712_10_emo_surprise01", res_nocho2, ATTACH_EFFECT2);
	local sup_moti3 = SetSelectBoneEffect_("ef712_10_emo_surprise01", res_nocho3, ATTACH_EFFECT2);
	local sup_moti4 = SetSelectBoneEffect_("ef712_10_emo_surprise01", res_nocho4, ATTACH_EFFECT2);
	
	Wait_(10);
	SetMotion_(res_ace, joyL_ace, BLEND_L);
	Wait_(10);
	SetMotion_(res_king, stick_king, BLEND_M);
	Wait_(20);
	SetMotion_(res_king, stickL_king, BLEND_M);
	StartEarthQuake_(4, 4, 2);
	Wait_(4);
	StartEarthQuake_(3, 3, 2);
	Wait_(3);
	StartEarthQuake_(15, 3, 1);
	Wait_(3);
	SetMotion_(res_jack, joyL_jack, BLEND_L);
	Wait_(3);
	SetMotion_(res_nocho, joyL_mob1, BLEND_L);
	Wait_(4);
	SetMotion_(res_nocho2, joyL_mob2, BLEND_L);
	SetMotion_(res_nocho3, joyL_mob3, BLEND_L);
	Wait_(5);
	SetMotion_(res_nocho4, joyL_mob4, BLEND_L);
	
	Wait_(120);
	
	EndDemo(FADE_COLOR_BLACK);
}
