//=============================================
//
//		demo222[マスターズロード_3(霊道)]
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
	local model_reverse = ReadGimmick_("o_com_16");			// 裏返る足場
//	local model_collapse = ReadGimmick_("o_com_17");		// 崩れる足場
	local model_switch = ReadGimmick_("o_com_19");			// スイッチ
//	local model_wind = ReadGimmick_("o_com_22");			// つむじ風
//	local model_collapse_l = ReadGimmick_("o_com_24");		// 崩れる足場（軽量）
	local model_burner = ReadGimmick_("o_com_26");			// バーナー
	local model_square = ReadGimmick_("o_com_29");			// 足場（四角）
	local model_circle = ReadGimmick_("o_com_30");			// 足場（丸）
	local model_poison = ReadGimmick_("o_com_33");			// 足場（毒）
//	local model_float_l = ReadGimmick_("o_com_97");			// 浮島(大)
//	local model_float_m = ReadGimmick_("o_com_98");			// 浮島(中)
	local model_float_s = ReadGimmick_("o_G00_07");			// 墓地の浮島１
	local model_float_l = ReadGimmick_("o_G00_08");			// 墓地の浮島２

	// キャラクター
	local player = GetPlayerId_();							// 主人公
	local model_boss = ReadNpc_("m181_00");					// レジサブマリン
	// エフェクト
	LoadEffect_("ef730_02_oth_gimmick_in01");				// ギミック表示時の光

// ▼配置
	
	// 主人公
	SetPointPos_(player, "player000");
	
	// ゴール用モンスター
	local boss = ArrangePointNpc_(model_boss, "npc_boss000");
	SetScaleSilhouette(boss, SCALE.N, SILHOUETTE_WIDTH.N);

	// ■============================= 未使用オブジェクト =============================■
	// ※配置数の上限が 49 の為、見えないオブジェクトはC.Oしておく
	
	//加速リング
//	local acceleration00 = ArrangePointGimmick_("o_com_00", model_acceleration, "obj_acceleration000");				//未使用
//	local acceleration03 = ArrangePointGimmick_("o_com_00", model_acceleration, "obj_acceleration003");
//	local acceleration05 = ArrangePointGimmick_("o_com_00", model_acceleration, "obj_acceleration005");
//	local acceleration06 = ArrangePointGimmick_("o_com_00", model_acceleration, "obj_acceleration006");
//	local acceleration07 = ArrangePointGimmick_("o_com_00", model_acceleration, "obj_acceleration007");
//	local acceleration10 = ArrangePointGimmick_("o_com_00", model_acceleration, "obj_acceleration010");
//	local acceleration11 = ArrangePointGimmick_("o_com_00", model_acceleration, "obj_acceleration011");
//	local acceleration12 = ArrangePointGimmick_("o_com_00", model_acceleration, "obj_acceleration012");
//	local acceleration13 = ArrangePointGimmick_("o_com_00", model_acceleration, "obj_acceleration013");
//	local acceleration14 = ArrangePointGimmick_("o_com_00", model_acceleration, "obj_acceleration014");
//	local acceleration15 = ArrangePointGimmick_("o_com_00", model_acceleration, "obj_acceleration015");
	
	// バーナー
//	local burner00 = ArrangePointGimmick_("o_com_26", model_burner, "obj_burner000");			//未使用
//	local burner01 = ArrangePointGimmick_("o_com_26", model_burner, "obj_burner001");
//	local burner02 = ArrangePointGimmick_("o_com_26", model_burner, "obj_burner002");
//	local burner03 = ArrangePointGimmick_("o_com_26", model_burner, "obj_burner003");
//	local burner12 = ArrangePointGimmick_("o_com_26", model_burner, "obj_burner012");
//	local burner13 = ArrangePointGimmick_("o_com_26", model_burner, "obj_burner013");
//	local burner11 = ArrangePointGimmick_("o_com_26", model_burner, "obj_burner011");
//	local burner14 = ArrangePointGimmick_("o_com_26", model_burner, "obj_burner014");
//	local burner15 = ArrangePointGimmick_("o_com_26", model_burner, "obj_burner015");


	// 足場（四角）
//	local square2 = ArrangePointGimmick_("o_com_29", model_square, "obj_square002");
//	local square3 = ArrangePointGimmick_("o_com_29", model_square, "obj_square003");
//	local square4 = ArrangePointGimmick_("o_com_29", model_square, "obj_square004");
//	local square5 = ArrangePointGimmick_("o_com_29", model_square, "obj_square005");
//	local square6 = ArrangePointGimmick_("o_com_29", model_square, "obj_square006");
//	local square7 = ArrangePointGimmick_("o_com_29", model_square, "obj_square007");
//	local square8 = ArrangePointGimmick_("o_com_29", model_square, "obj_square008");
//	local square9 = ArrangePointGimmick_("o_com_29", model_square, "obj_square009");
//	local square10 = ArrangePointGimmick_("o_com_29", model_square, "obj_square010");
//	local square11 = ArrangePointGimmick_("o_com_29", model_square, "obj_square011");
//	local square12 = ArrangePointGimmick_("o_com_29", model_square, "obj_square012");
//	local square13 = ArrangePointGimmick_("o_com_29", model_square, "obj_square013");
//	local square17 = ArrangePointGimmick_("o_com_29", model_square, "obj_square017");
//	local square18 = ArrangePointGimmick_("o_com_29", model_square, "obj_square018");
//	local square19 = ArrangePointGimmick_("o_com_29", model_square, "obj_square019");
//	local square20 = ArrangePointGimmick_("o_com_29", model_square, "obj_square020");
//	local square21 = ArrangePointGimmick_("o_com_29", model_square, "obj_square021");
//	local square24 = ArrangePointGimmick_("o_com_29", model_square, "obj_square024");
//	local square25 = ArrangePointGimmick_("o_com_29", model_square, "obj_square025");
//	local square26 = ArrangePointGimmick_("o_com_29", model_square, "obj_square026");
//	local square27 = ArrangePointGimmick_("o_com_29", model_square, "obj_square027");

	// 足場（毒）
//	local circle00 = ArrangePointGimmick_("o_com_30", model_circle, "obj_circle000");
//	local circle01 = ArrangePointGimmick_("o_com_30", model_circle, "obj_circle001");
//	local circle02 = ArrangePointGimmick_("o_com_33", model_poison, "obj_circle002");
//	local circle07 = ArrangePointGimmick_("o_com_33", model_poison, "obj_circle007");
//	local circle08 = ArrangePointGimmick_("o_com_33", model_poison, "obj_circle008");
//	local circle09 = ArrangePointGimmick_("o_com_33", model_poison, "obj_circle009");
//	local circle10 = ArrangePointGimmick_("o_com_33", model_poison, "obj_circle010");

	// 浮島
//	local float_s04 = ArrangePointGimmick_("o_G00_07", model_float_s, "obj_float_s004");			//未使用
//	local float_s05 = ArrangePointGimmick_("o_G00_07", model_float_s, "obj_float_s005");
//	local float_s06 = ArrangePointGimmick_("o_G00_07", model_float_s, "obj_float_s006");
//	local float_s07 = ArrangePointGimmick_("o_G00_07", model_float_s, "obj_float_s007");

	
	// ■----------------- 1カット目で使用 ------------------■
	// スイッチ
	local switch00 = ArrangePointGimmick_("o_com_19", model_switch, "obj_switch000");
	SetPointPos_(switch00, "obj_switch000");
	SetMotion_(switch00, MOT_GIMMICK_2, BLEND_N);

	// 加速リング
	local acceleration01 = ArrangePointGimmick_("o_com_00", model_acceleration, "obj_acceleration001");			//カット1
	local acceleration02 = ArrangePointGimmick_("o_com_00", model_acceleration, "obj_acceleration002");			//カット1
	local acceleration08 = ArrangePointGimmick_("o_com_00", model_acceleration, "obj_acceleration008");			//カット1
	local acceleration09 = ArrangePointGimmick_("o_com_00", model_acceleration, "obj_acceleration009");			//カット1
	local acceleration04 = ArrangePointGimmick_("o_com_00", model_acceleration, "obj_acceleration004");			//カット1

	// 裏返る足場
	local reverse00 = ArrangePointGimmick_("o_com_16", model_reverse, "obj_reverse000");			//カット1
	local reverse01 = ArrangePointGimmick_("o_com_16", model_reverse, "obj_reverse001");			//カット1
	local reverse02 = ArrangePointGimmick_("o_com_16", model_reverse, "obj_reverse002");			//カット1
	local reverse03 = ArrangePointGimmick_("o_com_16", model_reverse, "obj_reverse003");			//カット1
	local reverse04 = ArrangePointGimmick_("o_com_16", model_reverse, "obj_reverse004"); 			//カット1
	local reverse05 = ArrangePointGimmick_("o_com_16", model_reverse, "obj_reverse005");			//カット1
	local reverse06 = ArrangePointGimmick_("o_com_16", model_reverse, "obj_reverse006");			//カット1

	// バーナー
	local burner04 = ArrangePointGimmick_("o_com_26", model_burner, "obj_burner004");			//カット1
	local burner05 = ArrangePointGimmick_("o_com_26", model_burner, "obj_burner005");			//カット1
	local burner06 = ArrangePointGimmick_("o_com_26", model_burner, "obj_burner006");			//カット1
	local burner19 = ArrangePointGimmick_("o_com_26", model_burner, "obj_burner019");
	local burner20 = ArrangePointGimmick_("o_com_26", model_burner, "obj_burner020");
	local burner21 = ArrangePointGimmick_("o_com_26", model_burner, "obj_burner021");
	local burner22 = ArrangePointGimmick_("o_com_26", model_burner, "obj_burner022");

	// 足場（四角）
	local square00 = ArrangePointGimmick_("o_com_29", model_square, "obj_square000");			//カット1
	local square01 = ArrangePointGimmick_("o_com_29", model_square, "obj_square001");			//カット1
	local square14 = ArrangePointGimmick_("o_com_29", model_square, "obj_square014");			//カット1
	
	// 足場（毒）
	local circle03 = ArrangePointGimmick_("o_com_33", model_poison, "obj_circle003");			//カット1
	local circle04 = ArrangePointGimmick_("o_com_33", model_poison, "obj_circle004");			//カット1
	local circle05 = ArrangePointGimmick_("o_com_33", model_poison, "obj_circle005");			//カット1
	local circle06 = ArrangePointGimmick_("o_com_33", model_poison, "obj_circle006");			//カット1

	// 浮島
	local float_s00 = ArrangePointGimmick_("o_G00_07", model_float_s, "obj_float_s000");		//カット1
	local float_s01 = ArrangePointGimmick_("o_G00_07", model_float_s, "obj_float_s001");		//カット1
	local float_s03 = ArrangePointGimmick_("o_G00_07", model_float_s, "obj_float_s003");		//カット1
	local float_s08 = ArrangePointGimmick_("o_G00_07", model_float_s, "obj_float_s008");		//カット1
	local float_s09 = ArrangePointGimmick_("o_G00_08", model_float_l, "obj_float_s009");		//カット1

// ▼フォグ設定
	local density = GetFogDensity_();
	SetFogDensity_(5.0);											//フォグを薄くする
	SetFogDistMax_(10000.0);
	
// ▼カメラ設定
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");		// 0F目を映す
	DeleteTask_(task_cam);

//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	// ▼カット１＠主人公ＵＰ→アスレチック紹介～～～～～～～～
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");		// 250F	
	WaitTask(task_cam);
	Wait_(50);
	
	// ■----------------- 必要ないオブジェクトを非表示 ------------------■
	SetVisible(reverse03, false);
	SetVisible(reverse04, false);
	SetVisible(burner06, false);
	SetVisible(burner19, false);
	SetVisible(burner20, false);
	SetVisible(burner21, false);
	SetVisible(burner22, false);
	SetVisible(circle03, false);
	SetVisible(circle04, false);
	SetVisible(circle05, false);
	SetVisible(circle06, false);
	SetVisible(reverse03, false);
	SetVisible(reverse04, false);
	SetVisible(reverse06, false);
	SetVisible(square00, false);
	SetVisible(square01, false);
	SetVisible(square14, false);
	SetVisible(float_s00, false);
	SetVisible(float_s01, false);
	SetVisible(float_s03, false);
	SetVisible(float_s08, false);
	SetVisible(float_s09, false);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	// ▼カット２＠アスレチック紹介１～～～～～～～～
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	// ■----------------- 2カット目から使用 ------------------■
	//加速リング
	local acceleration16 = ArrangePointGimmick_("o_com_00", model_acceleration, "obj_acceleration016");			//カット2

	//バーナー
	local burner07 = ArrangePointGimmick_("o_com_26", model_burner, "obj_burner007");			//カット2
	local burner08 = ArrangePointGimmick_("o_com_26", model_burner, "obj_burner008");			//カット2
	local burner09 = ArrangePointGimmick_("o_com_26", model_burner, "obj_burner009");			//カット2
	local burner10 = ArrangePointGimmick_("o_com_26", model_burner, "obj_burner010");			//カット2
	local burner16 = ArrangePointGimmick_("o_com_26", model_burner, "obj_burner016");			//カット2
	local burner17 = ArrangePointGimmick_("o_com_26", model_burner, "obj_burner017");			//カット2
	local burner18 = ArrangePointGimmick_("o_com_26", model_burner, "obj_burner018");			//カット2
	// 足場
	local square15 = ArrangePointGimmick_("o_com_29", model_square, "obj_square015");			//カット2
	local square16 = ArrangePointGimmick_("o_com_29", model_square, "obj_square016");			//カット2
	local square22 = ArrangePointGimmick_("o_com_29", model_square, "obj_square022");			//カット2
	local square23 = ArrangePointGimmick_("o_com_29", model_square, "obj_square023");			//カット2
	local float_s02 = ArrangePointGimmick_("o_G00_07", model_float_s, "obj_float_s002");		//カット2
	// ■----------------- 2カット目から使用 ------------------■
	
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");		// 100F
	WaitTask(task_cam);
	Wait_(50);

	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓	
	// ▼カット3＠ボスを映す～～～～～～～～
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	task_cam = Task_AnimeMoveCamera_("anmeye003", "anmtgt003");		// 100F
	WaitTask(task_cam);
	
	Wait_(10);
	PlaySE_("SE_BTL_728");
	SetMotion_(boss, MOT_SPELL_START, BLEND_M);
	WaitMotion(boss);
	PlaySE_("SE_BTL_729");
	SetMotion_(boss, MOT_SPELL_ACTUATE, BLEND_M);
	WaitMotion(boss);
	SetMotion_(boss, MOT_WAIT, BLEND_M);
	Wait_(10);
	
	EndDemo(FADE_COLOR_BLACK);
}

