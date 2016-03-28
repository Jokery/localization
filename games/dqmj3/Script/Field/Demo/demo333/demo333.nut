//=============================================
//
//		demo333[マスターズロード_4(氷原)]
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
	local task_cam, task_player, efc_stealth;

// ▼リソース読込
	// ギミック
	local model_acceleration = ReadGimmick_("o_com_00");	// 加速リング
	local model_switch = ReadGimmick_("o_com_19");			// スイッチ
	local model_wind = ReadGimmick_("o_com_22");			// つむじ風
	local model_spark = ReadGimmick_("o_com_25");			// スパーク
	local model_stealth = ReadGimmick_("o_com_27");			// ステルス足場
	local model_circle = ReadGimmick_("o_com_30");			// 足場（丸）
	local model_ice	 = ReadGimmick_("o_com_32");			// 足場（氷）

	local model_float_s = ReadGimmick_("o_I00_01");			// 氷原の浮島1
	local model_float_l = ReadGimmick_("o_I00_02");			// 氷原の浮島2

	// キャラクター
	local player = GetPlayerId_();							// 主人公
	local model_boss = ReadNpc_("m016_00");					// バトルレックス
	// エフェクト
	LoadEffect_("ef730_02_oth_gimmick_in01");				// ギミック表示時の光

// ▼配置
	// ■============================= オブジェクト =============================■
	// ※配置数の上限が 49 の為、見えないオブジェクトはC.Oしておく
	// スイッチ
	local switch00 = ArrangePointGimmick_("o_com_19", model_switch, "obj_switch000");
	SetPointPos_(switch00, "obj_switch000");
	SetMotion_(switch00, MOT_GIMMICK_2, BLEND_N);

	// 加速リング
//	local acceleration00 = ArrangePointGimmick_("o_com_00", model_acceleration, "obj_acceleration000");
	local acceleration01 = ArrangePointGimmick_("o_com_00", model_acceleration, "obj_acceleration001");
	local acceleration02 = ArrangePointGimmick_("o_com_00", model_acceleration, "obj_acceleration002");
//	local acceleration03 = ArrangePointGimmick_("o_com_00", model_acceleration, "obj_acceleration003");
//	local acceleration04 = ArrangePointGimmick_("o_com_00", model_acceleration, "obj_acceleration004");
	local acceleration05 = ArrangePointGimmick_("o_com_00", model_acceleration, "obj_acceleration005");
//	local acceleration06 = ArrangePointGimmick_("o_com_00", model_acceleration, "obj_acceleration006");
	local acceleration07 = ArrangePointGimmick_("o_com_00", model_acceleration, "obj_acceleration007");
//	local acceleration08 = ArrangePointGimmick_("o_com_00", model_acceleration, "obj_acceleration008");
//	local acceleration09 = ArrangePointGimmick_("o_com_00", model_acceleration, "obj_acceleration009");
//	local acceleration10 = ArrangePointGimmick_("o_com_00", model_acceleration, "obj_acceleration010");
	local acceleration11 = ArrangePointGimmick_("o_com_00", model_acceleration, "obj_acceleration011");
//	local acceleration12 = ArrangePointGimmick_("o_com_00", model_acceleration, "obj_acceleration012");
	local acceleration13 = ArrangePointGimmick_("o_com_00", model_acceleration, "obj_acceleration013");
//	local acceleration14 = ArrangePointGimmick_("o_com_00", model_acceleration, "obj_acceleration014");
	local acceleration15 = ArrangePointGimmick_("o_com_00", model_acceleration, "obj_acceleration015");
	local acceleration16 = ArrangePointGimmick_("o_com_00", model_acceleration, "obj_acceleration016");
	local acceleration17 = ArrangePointGimmick_("o_com_00", model_acceleration, "obj_acceleration017");
//	local acceleration18 = ArrangePointGimmick_("o_com_00", model_acceleration, "obj_acceleration018");
	local acceleration19 = ArrangePointGimmick_("o_com_00", model_acceleration, "obj_acceleration019");
//	local acceleration20 = ArrangePointGimmick_("o_com_00", model_acceleration, "obj_acceleration020");
//	local acceleration21 = ArrangePointGimmick_("o_com_00", model_acceleration, "obj_acceleration021");
//	local acceleration22 = ArrangePointGimmick_("o_com_00", model_acceleration, "obj_acceleration022");
//	local acceleration23 = ArrangePointGimmick_("o_com_00", model_acceleration, "obj_acceleration023");
//	local acceleration24 = ArrangePointGimmick_("o_com_00", model_acceleration, "obj_acceleration024");
//	local acceleration25 = ArrangePointGimmick_("o_com_00", model_acceleration, "obj_acceleration025");
//	local acceleration26 = ArrangePointGimmick_("o_com_00", model_acceleration, "obj_acceleration026");
//	local acceleration27 = ArrangePointGimmick_("o_com_00", model_acceleration, "obj_acceleration027");
//	local acceleration28 = ArrangePointGimmick_("o_com_00", model_acceleration, "obj_acceleration028");
//	local acceleration29 = ArrangePointGimmick_("o_com_00", model_acceleration, "obj_acceleration029");
//	local acceleration30 = ArrangePointGimmick_("o_com_00", model_acceleration, "obj_acceleration030");
	
	// 風
//	local wind00 = ArrangePointGimmick_("o_com_22", model_wind, "obj_wind000");

	//スパーク
	local spark00 = ArrangePointGimmick_("o_com_25", model_spark, "obj_spark000");
	local spark01 = ArrangePointGimmick_("o_com_25", model_spark, "obj_spark001");
	local spark02 = ArrangePointGimmick_("o_com_25", model_spark, "obj_spark002");
	
	//ステルス足場
//	local stealth00 = ArrangePointGimmick_("o_com_27", model_stealth, "obj_stealth000");
//	local stealth01 = ArrangePointGimmick_("o_com_27", model_stealth, "obj_stealth001");
	local stealth02 = ArrangePointGimmick_("o_com_27", model_stealth, "obj_stealth002");
	local stealth03 = ArrangePointGimmick_("o_com_27", model_stealth, "obj_stealth003");
	local stealth04 = ArrangePointGimmick_("o_com_27", model_stealth, "obj_stealth004");
	local stealth05 = ArrangePointGimmick_("o_com_27", model_stealth, "obj_stealth005");
	local stealth06 = ArrangePointGimmick_("o_com_27", model_stealth, "obj_stealth006");
	local stealth07 = ArrangePointGimmick_("o_com_27", model_stealth, "obj_stealth007");
	local stealth08 = ArrangePointGimmick_("o_com_27", model_stealth, "obj_stealth008");
//	local stealth09 = ArrangePointGimmick_("o_com_27", model_stealth, "obj_stealth009");
//	local stealth10 = ArrangePointGimmick_("o_com_27", model_stealth, "obj_stealth010");
//	local stealth11 = ArrangePointGimmick_("o_com_27", model_stealth, "obj_stealth011");
//	local stealth12 = ArrangePointGimmick_("o_com_27", model_stealth, "obj_stealth012");
//	local stealth13 = ArrangePointGimmick_("o_com_27", model_stealth, "obj_stealth013");
//	local stealth14 = ArrangePointGimmick_("o_com_27", model_stealth, "obj_stealth014");
//	local stealth15 = ArrangePointGimmick_("o_com_27", model_stealth, "obj_stealth015");
//	local stealth16 = ArrangePointGimmick_("o_com_27", model_stealth, "obj_stealth016");
//	local stealth17 = ArrangePointGimmick_("o_com_27", model_stealth, "obj_stealth017");
//	local stealth18 = ArrangePointGimmick_("o_com_27", model_stealth, "obj_stealth018");
//	local stealth19 = ArrangePointGimmick_("o_com_27", model_stealth, "obj_stealth019");
//	local stealth20 = ArrangePointGimmick_("o_com_27", model_stealth, "obj_stealth020");
//	local stealth21 = ArrangePointGimmick_("o_com_27", model_stealth, "obj_stealth021");
//	local stealth22 = ArrangePointGimmick_("o_com_27", model_stealth, "obj_stealth022");
//	local stealth23 = ArrangePointGimmick_("o_com_27", model_stealth, "obj_stealth023");
//	local stealth24 = ArrangePointGimmick_("o_com_27", model_stealth, "obj_stealth024");
//	local stealth25 = ArrangePointGimmick_("o_com_27", model_stealth, "obj_stealth025");
//	local stealth26 = ArrangePointGimmick_("o_com_27", model_stealth, "obj_stealth026");
//	local stealth27 = ArrangePointGimmick_("o_com_27", model_stealth, "obj_stealth027");
//	local stealth28 = ArrangePointGimmick_("o_com_27", model_stealth, "obj_stealth028");
//	local stealth29 = ArrangePointGimmick_("o_com_27", model_stealth, "obj_stealth029");
//	local stealth30 = ArrangePointGimmick_("o_com_27", model_stealth, "obj_stealth030");
//	local stealth31 = ArrangePointGimmick_("o_com_27", model_stealth, "obj_stealth031");
//	local stealth32 = ArrangePointGimmick_("o_com_27", model_stealth, "obj_stealth032");
//	local stealth33 = ArrangePointGimmick_("o_com_27", model_stealth, "obj_stealth033");
//	local stealth34 = ArrangePointGimmick_("o_com_27", model_stealth, "obj_stealth034");
	local stealth35 = ArrangePointGimmick_("o_com_27", model_stealth, "obj_stealth035");

//	SetAlpha_(stealth02, 0.0);				//初期表示　透明
//	SetAlpha_(stealth03, 0.0);
//	SetAlpha_(stealth04, 0.0);
//	SetAlpha_(stealth05, 0.0);
//	SetAlpha_(stealth06, 0.0);
//	SetAlpha_(stealth07, 0.0);
//	SetAlpha_(stealth08, 0.0);
//	SetAlpha_(stealth35, 0.0);
	
	//足場
//	local circle00 = ArrangePointGimmick_("o_com_30", model_circle, "obj_circle000");
	
	local circle01 = ArrangePointGimmick_("o_com_32", model_ice, "obj_circle001");
	local circle02 = ArrangePointGimmick_("o_com_32", model_ice, "obj_circle002");
	local circle03 = ArrangePointGimmick_("o_com_32", model_ice, "obj_circle003");
	local circle04 = ArrangePointGimmick_("o_com_32", model_ice, "obj_circle004");
	local circle05 = ArrangePointGimmick_("o_com_32", model_ice, "obj_circle005");
	local circle06 = ArrangePointGimmick_("o_com_32", model_ice, "obj_circle006");
	local circle07 = ArrangePointGimmick_("o_com_32", model_ice, "obj_circle007");
	local circle08 = ArrangePointGimmick_("o_com_32", model_ice, "obj_circle008");
//	local circle09 = ArrangePointGimmick_("o_com_32", model_ice, "obj_circle009");
//	local circle10 = ArrangePointGimmick_("o_com_32", model_ice, "obj_circle010");
//	local circle11 = ArrangePointGimmick_("o_com_32", model_ice, "obj_circle011");
//	local circle12 = ArrangePointGimmick_("o_com_32", model_ice, "obj_circle012");
//	local circle13 = ArrangePointGimmick_("o_com_32", model_ice, "obj_circle013");
//	local circle14 = ArrangePointGimmick_("o_com_32", model_ice, "obj_circle014");
//	local circle15 = ArrangePointGimmick_("o_com_32", model_ice, "obj_circle015");
//	local circle16 = ArrangePointGimmick_("o_com_32", model_ice, "obj_circle016");
//	local circle17 = ArrangePointGimmick_("o_com_32", model_ice, "obj_circle017");
	local circle18 = ArrangePointGimmick_("o_com_32", model_ice, "obj_circle018");
	local circle19 = ArrangePointGimmick_("o_com_32", model_ice, "obj_circle019");
	local circle20 = ArrangePointGimmick_("o_com_32", model_ice, "obj_circle020");
	
	local float_s00 = ArrangePointGimmick_("o_I00_01", model_float_s, "obj_float_s000");
//	local float_s01 = ArrangePointGimmick_("o_I00_01", model_float_s, "obj_float_s001");
//	local float_s02 = ArrangePointGimmick_("o_I00_01", model_float_s, "obj_float_s002");
//	local float_s03 = ArrangePointGimmick_("o_I00_01", model_float_s, "obj_float_s003");
	
	local float_s04 = ArrangePointGimmick_("o_I00_02", model_float_l, "obj_float_s004");
//	local float_s05 = ArrangePointGimmick_("o_I00_02", model_float_l, "obj_float_s005");
	local float_s06 = ArrangePointGimmick_("o_I00_02", model_float_l, "obj_float_s006");
	local float_s07 = ArrangePointGimmick_("o_I00_02", model_float_l, "obj_float_s007");
//	local float_s08 = ArrangePointGimmick_("o_I00_02", model_float_l, "obj_float_s008");
	local float_s09 = ArrangePointGimmick_("o_I00_02", model_float_l, "obj_float_s009");

	
	// ■============================= オブジェクト =============================■
	
	// 主人公
	SetPointPos_(player, "player000");
	
	// ゴール用モンスター
	local boss = ArrangePointNpc_(model_boss, "npc_boss000");
	SetScaleSilhouette(boss, SCALE.M, SILHOUETTE_WIDTH.M);

// ▼カメラ設定
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");		// 0F目を映す
	DeleteTask_(task_cam);

//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);
	
	// ▼カット１＠主人公ＵＰ→アスレチック紹介～～～～～～～～
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");		// 250F
	WaitTask(task_cam);
	Wait_(30);
	
	// ▼カット２＠アスレチック紹介～～～～～～～～
	SetAlpha_(player, ALPHA_CLEAR);									//主人公透明
	task_player = Task_AnimeMoveNoFit_(player, "anm_player000");	//ステルス床起動のためのアニメ
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");		// 240F
	
	Wait_(80);
	SetVisible(stealth35, false);
	
	Wait_(25);
	SetVisible(stealth02, false);
	
	Wait_(20);
	SetVisible(stealth03, false);
	
	Wait_(17);
	SetVisible(stealth04, false);
	
	Wait_(15);
	SetVisible(stealth05, false);
	
	Wait_(20);
	SetVisible(stealth06, false);
	
	Wait_(22);
	SetVisible(stealth07, false);
	
	Wait_(25);
	SetVisible(stealth08, false);
	
	WaitTask(task_cam);
	Wait_(60);
	
	// ▼カット3＠ボスを映す～～～～～～～～
	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");		// 100F
	WaitTask(task_cam);

	PlaySE_("SE_BTL_103");
	SetMotion_(boss, MOT_SWORD_START, BLEND_M);
	WaitMotion(boss);
	PlaySE_("SE_BTL_104");
	SetMotion_(boss, MOT_SWORD_ACTUATE, BLEND_M);
	WaitMotion(boss);
	SetMotion_(boss, MOT_WAIT, BLEND_M);
	Wait_(30);
	
	EndDemo(FADE_COLOR_BLACK);
}

