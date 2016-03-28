//=============================================
//
//		demo038[足場完成]
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
	local task_cam, task_player, task_ace, task_queen, task_jack, task_king;
	local efc_maruta;
	local abare_kind = 157;			// 種族ＩＤ:あばれうしどり

// ▼モデル読込
	// キャラクター
	local player = GetPlayerId_();					// 主人公
	local model_abare = ReadNpc_("m051_00");		// あばれうしどり
	local model_nocho = ReadNpc_("n000");			// 一般ノチョーラ
	local model_jack = ReadNpc_("n001");			// ジャック
	local model_ace = ReadNpc_("n002");				// エース
	local model_king = ReadNpc_("n003");			// キング
	local model_queen = ReadNpc_("n005");			// クイーン
	local model_rin = ReadNpc_("n043");				// ノチョリン

	// ギミック
	local model_maruta000 = ReadGimmick_("o_H00_04");// 丸太（倒れる前）
	local model_maruta100 = ReadGimmick_("o_H00_05");// 丸太（倒れた後）
	local model_throne = ReadGimmick_("o_com_05");	// 玉座
	// エフェクト
	LoadEffect_("ef721_03_nat_smoke_n03");			// 煙03

// ▼配置
	// 丸太
	local maruta000 = ArrangePointGimmick_("o_H00_04", model_maruta000, "obj_maruta000");
	local maruta100 = ArrangePointGimmick_("o_H00_05", model_maruta100, "obj_maruta100");
	SetVisible(maruta100, false);
	// 玉座
	local throne = ArrangePointGimmick_("o_com_05", model_throne, "obj_throne");
	
	// 主人公
	SetPointPos_(player, "npc_abare001");
	// ジャック
	local jack = ArrangePointNpc_(model_jack, "npc_jack000");
	// エース
	local ace = ArrangePointNpc_(model_ace, "npc_ace000");
	// キング
	local king = ArrangePointNpc_(model_king, "npc_king000");
	// クイーン
	local queen = ArrangePointNpc_(model_queen, "npc_queen000");
	// 持ち手１
	local mob1 = ArrangePointNpc_(model_nocho, "npc_mob1");
	// 持ち手１
	local mob2 = ArrangePointNpc_(model_nocho, "npc_mob2");
	// 持ち手１
	local mob3 = ArrangePointNpc_(model_nocho, "npc_mob3");
	// ノチョリン
	local mob4 = ArrangePointNpc_(model_rin, "npc_mob4");
	
	SetDirToPlayer_(jack);
	SetDirToPlayer_(ace);
	SetDirToPlayer_(king);
	SetDirToPlayer_(queen);
	SetDirToPlayer_(mob1);
	SetDirToPlayer_(mob2);
	SetDirToPlayer_(mob3);
	SetDirToPlayer_(mob4);

// ▼非常駐モーション読込
	// ジャック
	local jack_rejoice_L = ReadMotion_(jack, "n001_rejoice_L");					// ジャンプ（喜び）L
	// キング
	local king_look_left = ReadMotion_(king, "n003_look_bldg");					// 待機→センタービルを見る
	local king_look_left_L = ReadMotion_(king, "n003_look_bldg_L");				// センタービルを見るL

// ▼カメラ設定
	ReadWaitingLod("cameye000", "camtgt000");

	SetVisible(maruta000, false);
	SetVisible(maruta100, true);
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");
	
	Wait_(5);
	
	StartEarthQuake_(45, 3, 0.8);
	efc_maruta = SetPointWorldEffect_("ef721_03_nat_smoke_n03", "efc_maruta000");	// 煙03
	PlaySE_("SE_DEM_031");															//■SE：丸太落下音

//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);
	
	// ▼カメラ１～～～～～～～～～～～～～～～～～～～～～～～～
	Wait_(15);
	
	SetMotion_(jack, jack_rejoice_L, BLEND_M);			// ジャンプ（喜び）L
	
	//===============================================
	// ■ジャック
	// 「やりましたぞ！　キングよ　
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_JACK");
	ShowMsg_("DEMO_038_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetMotion_(king, king_look_left, BLEND_L);								// 待機→センタービルを見る
	task_king = Task_ChangeMotion_(king, king_look_left_L, BLEND_M);		// センタービルを見るLOOP
	Wait_(30);
	
	//===============================================
	// ■キング
	// 「うむ！　では　余たちも
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_KING");
	ShowMsg_("DEMO_038_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	DeleteTask_(task_king);
	SetMotion_(king, MOT_WAIT, BLEND_XL);
	
	SetMotion_(ace, MOT_WALK, BLEND_M);
	task_ace = Task_MoveForward_(ace, 1.0, false);
	Wait_(5);
	
	SetMotion_(queen, MOT_WALK, BLEND_M);
	task_queen = Task_MoveForward_(queen, 1.0, false);
	Wait_(5);
	
	SetMotion_(jack, MOT_WALK, BLEND_M);
	task_jack = Task_MoveForward_(jack, 1.0, false);
	Wait_(10);
	
	EndDemo(FADE_COLOR_BLACK);
}
