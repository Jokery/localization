//=============================================
//
//		demo134[マスターズロード_2(崩落)]
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

// ▼リソース読込
	// ギミック
	local model_acceleration = ReadGimmick_("o_com_00");	// 加速リング
	local model_float_l = ReadGimmick_("o_com_10");			// 浮島(大)
	local model_reverse = ReadGimmick_("o_com_16");			// 裏返る足場
	local model_switch = ReadGimmick_("o_com_19");			// スイッチ
	local model_wind = ReadGimmick_("o_com_22");			// つむじ風
	local model_collapse_l = ReadGimmick_("o_com_24");		// 崩れる足場（軽量）
	local model_square = ReadGimmick_("o_com_29");			// 足場（四角）
	local model_float_m = ReadGimmick_("o_A00_05");			// 崩落都市の浮島(中)
	local model_ukisima = ReadGimmick_("o_A00_06");			// 崩落都市の浮島(大)
	// キャラクター
	local player = GetPlayerId_();							// 主人公
	local model_boss = ReadNpc_("m110_01");					// ゴールドマン

// ▼配置
	// ■============================= オブジェクト =============================■
	// ※配置数の上限が 49 の為、見えないオブジェクトはC.Oしておく
	
	// スイッチ
	local switch00 = ArrangePointGimmick_("o_com_19", model_switch, "obj_switch000");
	SetPointPos_(switch00, "obj_switch000");
	SetMotion_(switch00, MOT_GIMMICK_2, BLEND_N);
	
	// 加速リング
	local acceleration00 = ArrangePointGimmick_("o_com_00", model_acceleration, "obj_acceleration000");
	local acceleration01 = ArrangePointGimmick_("o_com_00", model_acceleration, "obj_acceleration001");
	local acceleration02 = ArrangePointGimmick_("o_com_00", model_acceleration, "obj_acceleration002");
	local acceleration03 = ArrangePointGimmick_("o_com_00", model_acceleration, "obj_acceleration003");
	local acceleration04 = ArrangePointGimmick_("o_com_00", model_acceleration, "obj_acceleration004");
	local acceleration05 = ArrangePointGimmick_("o_com_00", model_acceleration, "obj_acceleration005");
	local acceleration06 = ArrangePointGimmick_("o_com_00", model_acceleration, "obj_acceleration006");
	local acceleration07 = ArrangePointGimmick_("o_com_00", model_acceleration, "obj_acceleration007");
	
	// 浮島(大)
	local float_l00 = ArrangePointGimmick_("o_com_10", model_float_l, "obj_float_l000");
	local float_l01 = ArrangePointGimmick_("o_com_10", model_float_l, "obj_float_l001");
	local float_l02 = ArrangePointGimmick_("o_com_10", model_float_l, "obj_float_l002");
	local float_l03 = ArrangePointGimmick_("o_com_10", model_float_l, "obj_float_l003");
	
	// 裏返る足場
	local reverse00 = ArrangePointGimmick_("o_com_16", model_reverse, "obj_reverse000");
	local reverse01 = ArrangePointGimmick_("o_com_16", model_reverse, "obj_reverse001");
	local reverse02 = ArrangePointGimmick_("o_com_16", model_reverse, "obj_reverse002");
	local reverse03 = ArrangePointGimmick_("o_com_16", model_reverse, "obj_reverse003");
	local reverse04 = ArrangePointGimmick_("o_com_16", model_reverse, "obj_reverse004");
	local reverse05 = ArrangePointGimmick_("o_com_16", model_reverse, "obj_reverse005");
	
	// つむじ風
	local wind00 = ArrangePointGimmick_("o_com_22", model_wind, "obj_wind000");
	
	// 崩れる足場（軽量）
	local collapse_l00 = ArrangePointGimmick_("o_com_24", model_collapse_l, "obj_collapse_l000");
	local collapse_l01 = ArrangePointGimmick_("o_com_24", model_collapse_l, "obj_collapse_l001");
	local collapse_l02 = ArrangePointGimmick_("o_com_24", model_collapse_l, "obj_collapse_l002");
	
	// 足場（四角）
	local square00 = ArrangePointGimmick_("o_com_29", model_square, "obj_square000");
//	local square01 = ArrangePointGimmick_("o_com_29", model_square, "obj_square001");
//	local square02 = ArrangePointGimmick_("o_com_29", model_square, "obj_square002");
//	local square03 = ArrangePointGimmick_("o_com_29", model_square, "obj_square003");
//	local square04 = ArrangePointGimmick_("o_com_29", model_square, "obj_square004");
	local square05 = ArrangePointGimmick_("o_com_29", model_square, "obj_square005");
	local square06 = ArrangePointGimmick_("o_com_29", model_square, "obj_square006");
	local square07 = ArrangePointGimmick_("o_com_29", model_square, "obj_square007");
//	local square08 = ArrangePointGimmick_("o_com_29", model_square, "obj_square008");
//	local square09 = ArrangePointGimmick_("o_com_29", model_square, "obj_square009");
	local square10 = ArrangePointGimmick_("o_com_29", model_square, "obj_square010");
	local square11 = ArrangePointGimmick_("o_com_29", model_square, "obj_square011");
	local square12 = ArrangePointGimmick_("o_com_29", model_square, "obj_square012");
	local square13 = ArrangePointGimmick_("o_com_29", model_square, "obj_square013");
	local square14 = ArrangePointGimmick_("o_com_29", model_square, "obj_square014");
	local square15 = ArrangePointGimmick_("o_com_29", model_square, "obj_square015");
	local square16 = ArrangePointGimmick_("o_com_29", model_square, "obj_square016");
	local square17 = ArrangePointGimmick_("o_com_29", model_square, "obj_square017");
	
	// 崩落都市の浮島(中)
	local float_m00 = ArrangePointGimmick_("o_A00_05", model_float_m, "obj_float_m000");
	local float_m01 = ArrangePointGimmick_("o_A00_05", model_float_m, "obj_float_m001");
	
	// 崩落都市の浮島(大)
	local float_l04 = ArrangePointGimmick_("o_A00_06", model_ukisima, "obj_float_l004");
	local float_l05 = ArrangePointGimmick_("o_A00_06", model_ukisima, "obj_float_l005");
	local float_l06 = ArrangePointGimmick_("o_A00_06", model_ukisima, "obj_float_l006");
	local float_l07 = ArrangePointGimmick_("o_A00_06", model_ukisima, "obj_float_l007");
	local float_l08 = ArrangePointGimmick_("o_A00_06", model_ukisima, "obj_float_l008");
	local float_l09 = ArrangePointGimmick_("o_A00_06", model_ukisima, "obj_float_l009");
	local float_l10 = ArrangePointGimmick_("o_A00_06", model_ukisima, "obj_float_l010");
	
	// ■============================= オブジェクト =============================■
	
	// 主人公
	SetPointPos_(player, "player000");
	
	// ゴール用モンスター
	local boss = ArrangePointNpc_(model_boss, "npc_boss000");
	SetScaleSilhouette(boss, SCALE.N, SILHOUETTE_WIDTH.N);

// ▼カメラ設定
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");		// 0F目を映す
	DeleteTask_(task_cam);

//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);
	
	// ▼カット１＠主人公ＵＰ→アスレチック紹介～～～～～～～～
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");		// 120F
	WaitTask(task_cam);
	Wait_(30);
	
	// ▼カット２＠アスレチック紹介～～～～～～～～
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");		// 300F
	WaitTask(task_cam);
	Wait_(10);
	
	// ▼カット3＠ボスを映す～～～～～～～～
	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");		// 300F
	WaitTask(task_cam);
	
	Wait_(10);
	PlaySE_("SE_BTL_429");
	SetMotion_(boss, MOT_SPELL_START, BLEND_M);
	WaitMotion(boss);
	PlaySE_("SE_BTL_430");
	SetMotion_(boss, MOT_SPELL_ACTUATE, BLEND_M);
	WaitMotion(boss);
	SetMotion_(boss, MOT_WAIT, BLEND_M);
	Wait_(10);
	
	EndDemo(FADE_COLOR_BLACK);
}
