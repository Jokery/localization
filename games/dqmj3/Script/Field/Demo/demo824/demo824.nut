//=============================================
//
//		demo824[スターシード完成]
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
	local task_cam, task_player, task_aroma;
	local efc_player, efc_seed, efc_green, efc_blue, efc_red, efc_pollen;

// ▼リソース読込
	// キャラクター
	local player = GetPlayerId_();						// 主人公
	local model_aroma = ReadNpc_("n018");				// アロマ

	// エフェクト
	LoadEffect_("ef732_22_star_seed_m_g");				// スターシード緑　軌道
	LoadEffect_("ef732_23_star_seed_m_b");				// スターシード青　軌道
	LoadEffect_("ef732_24_star_seed_m_r");				// スターシード赤　軌道
	LoadEffect_("ef732_25_star_seed_base01");			// スターシードベース　完成前
	LoadEffect_("ef732_26_star_seed_base02");			// スターシードベース　完成後
	LoadEffect_("ef732_28_star_seed_comp");				// スターシードベース　完成演出
	LoadEffect_("ef882_04_smoke_dark");					// 黒煙
	LoadEffect_("ef340_06_star_seed_case");				// スターシードの入れ物
	LoadEffect_("ef340_07_star_seed_shaton_u");			// 電気エフェクト　上
	LoadEffect_("ef340_08_star_seed_shaton_d");			// 電気エフェクト　下

	// ギミック
	local model_base = ReadGimmick_("o_effect_base");	// エフェクトベース
	local model_pod = ReadGimmick_("o_U00_02");			// 脱出ポッド
	local model_alias = ReadGimmick_("o_U00_11");		// エイリアス装置
	
	local model_warp_center = ReadGimmick_("o_com_35");		// 加速リング(赤)
	local model_warp_right = ReadGimmick_("o_com_36");		// 加速リング(青)
	local model_warp_left = ReadGimmick_("o_com_37");		// 加速リング(緑)

	// レイアウト
	LoadLayout_("memories");

// ▼配置
	// 主人公
	SetPointPos_(player, "player000");

	//アロマ
	local aroma = ArrangePointNpc_(model_aroma, "npc_aroma000");
	SetStepSe_(aroma, "SE_FLD_021");

	//ギミック
	local seed = ArrangePointGimmick_("o_effect_base", model_base, "obj_seed000");				//スターシード（エフェクトベース）
	SetPointPosNoFit_(seed, "obj_seed000");

	local warp_center = ArrangePointGimmick_("o_com_35", model_warp_center, "obj_warp_center000");		// 加速リング(赤)
	local warp_right = ArrangePointGimmick_("o_com_36", model_warp_right, "obj_warp_right000");			// 加速リング(青)
	local warp_left = ArrangePointGimmick_("o_com_37", model_warp_left, "obj_warp_left000");			// 加速リング(緑)

// ▼非常駐モーション読込
	//主人公
	local player_nod = ReadMotion_(player, "Player_nod");										// うなづく
	local player_right = ReadMotion_(player, "Player_look_right_L");							// 右を向く
	local player_look_up = ReadMotion_(player, "Player_look_up_L");								// 上向き待機L

	//アロマ
	local aro_look_up_L = ReadMotion_(aroma, "n018_look_up_L");									// 上向き待機L
	local star_seed_look_L = ReadMotion_(aroma, "n018_star_seed_look_L");						// スターシードを見る
	local star_seed_look_left_L = ReadMotion_(aroma, "n018_star_seed_left_L");					// スターシードを持つ(左向き)
	local aro_send_up_L = ReadMotion_(aroma, "n018_star_seed_send_up_L");						// スターシードを迎える
	local star_seed_look_up_L = ReadMotion_(aroma, "n018_star_seed_look_up_L");					// スターシードを持つ(上向き)

// ▼初期モーション
	SetMotion_(player, player_look_up, BLEND_N); 
	SetMotion_(aroma, aro_look_up_L, BLEND_N); 

// ▼カメラ設定
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");

// ▼初期エフェクト
	efc_seed = SetSelectBoneEffect_("ef732_28_star_seed_comp", seed, ATTACH_GLOBAL);			//スターシード完成演出
	local efc_case = SetSelectBoneEffect_("ef340_06_star_seed_case", seed, ATTACH_GLOBAL);		//スターシードの入れ物
	local efc_shaton_u = SetPointWorldEffect_("ef340_07_star_seed_shaton_u", "efc_shaton_d000");//電気　上
	local efc_shaton_d = SetPointWorldEffect_("ef340_08_star_seed_shaton_d", "efc_shaton_u000");//電気　下


//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------

	PlaySE_("SE_DEM_201");
	StartDemo(FADE_COLOR_BLACK);

	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット1 スターシード完成
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	Wait_(155);
	Wait_(50);
	DeleteEffectEmitter_(efc_case);								//入れ物・電気消滅
	DeleteEffectEmitter_(efc_shaton_u);
	DeleteEffectEmitter_(efc_shaton_d);
	Wait_(150);
	SetMotion_(aroma, aro_send_up_L, BLEND_N);					// アロマ スターシードを迎える
	SetVisible(player, false);


	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット2 アロマ　主
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");

	Task_AnimeMoveNoDirNoFit_(seed, "anm_seed000");
	uChangeEffectScale(efc_seed, 1.0, 0.3, 120)					// だんだんエフェクト小さくなる
	Wait_(50);
	SetMotionSpeed_(aroma, 0.1);
	SetMotion_(aroma, star_seed_look_L, BLEND_XL);				// アロマ スターシードを見る

	WaitTask(task_cam);
	SetMotionSpeed_(aroma, 0.5);

	//===============================================
	// *アロマ
	// 「よし……うまくいってる。
	//　新しい　スターシードの　完成よ！
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_AROMA");
	ShowMsg_("DEMO_824_MSG_010");
	SetMotionSpeed_(aroma, 0.5);
	KeyInputWait_();
	//===============================================
	// *アロマ
	// 「これで　レナーテを助け出せる……。
	//　あの子を　助けるのは　これで２回目だわ。
	//-----------------------------------------------
	ShowMsg_("DEMO_824_MSG_020");
	SetMotion_(aroma, star_seed_look_up_L, 25);					// アロマ スターシードを持つ（上待機）
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	Wait_(50);


	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット3 過去回想その１
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 30);
	WaitFade_();

	SetLayoutAnime_("ev824_00_loop", true);//過去回想１開始
	Wait_(5);
	SetFade_(FADE_IN, FADE_COLOR_BLACK, 30);
	WaitFade_();

	//===============================================
	// *アロマ
	// 「たぶん　覚えてないでしょうけど
	//　レナーテを見つけたのって　アンタだったのよ？
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_AROMA");
	ShowMsg_("DEMO_824_MSG_030");
	KeyInputWait_();
	//===============================================
	// *アロマ
	// 「あの子……見つけたときは　記憶喪失だった。
	//　マザー本体から　切り離されたショックでね。
	//-----------------------------------------------
	ShowMsg_("DEMO_824_MSG_040");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 30);
	WaitFade_();
	SetLayoutAnime_("ev824_00_out", false);//過去回想１終了

	WaitLayoutAnime();

	SetLayoutAnime_("ev824_01_loop", true);//過去回想２開始
	Wait_(5);
	SetFade_(FADE_IN, FADE_COLOR_BLACK, 30);
	WaitFade_();


	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット4 過去回想その２
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	//===============================================
	// *アロマ
	// 「自分が　誰なのかさえ　忘れていた。
	//　でも　やがて彼女は　思いだした……。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_AROMA");
	ShowMsg_("DEMO_824_MSG_050");
	KeyInputWait_();
	//===============================================
	// *アロマ
	// 「マザーを　正常化するという
	//　自分の使命を……ね。
	//-----------------------------------------------
	ShowMsg_("DEMO_824_MSG_060");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	Wait_(30);
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 30);
	WaitFade_();
	SetLayoutAnime_("ev824_01_out", false);//過去回想２終了

	WaitLayoutAnime();
	SetVisible(player, true);
	SetMotion_(player, MOT_WAIT, BLEND_N);						// 主　待機
	SetPointPos_(player, "player001");


	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット5 アロマアップ
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	task_cam = Task_AnimeMoveCamera_("anmeye003", "anmtgt003");

	SetFade_(FADE_IN, FADE_COLOR_BLACK, 30);
	Wait_(10);
	SetMotion_(aroma, star_seed_look_L, BLEND_XL);				//アロマ　下待機（スターシードあり）

	//===============================================
	// *アロマ
	// 「そして　それを知ったときから　アタシたち
	//　レジスタンスの戦いは　始まったのよ……。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_AROMA");
	ShowMsg_("DEMO_824_MSG_070");
	KeyInputWait_();
	//===============================================

	SetMotion_(aroma, star_seed_look_left_L, BLEND_XL);			//アロマ　左待機（スターシードあり）
	Wait_(10);

	//===============================================
	// *アロマ
	// 「……思い出話は　また今度にしましょ。
	//　まずは　レナーテを　助けないとね。
	//-----------------------------------------------
	ShowMsg_("DEMO_824_MSG_080");
	Wait_(5);
	SetMotion_(player, player_right, BLEND_XL);					// 主　右向く
	KeyInputWait_();
	//===============================================
	// *アロマ
	// 「コアで　あの子が待っているわ。
	//　現地で合流するわよ　○主人公の名前○！
	//-----------------------------------------------
	ShowMsg_("DEMO_824_MSG_090");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	Wait_(40);
	DeleteTask_(task_cam);
	SetVisible(player, false);


	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット7 意味ありげにスターシードを映す
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");

	WaitTask(task_cam);
	PlaySE_("SE_DEM_202");			// 冥界のキリSE
	efc_pollen = SetSelectBoneEffectSetOffset_("ef882_04_smoke_dark", seed, ATTACH_GLOBAL, Vec3(0.0, 0.0, 0.0));
	SetEffectScale_(efc_pollen, 0.4);
	Wait_(70);
	DeleteEffectEmitter_(efc_pollen); 
	Wait_(70);

	EndDemo(FADE_COLOR_BLACK);
}

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//		エフェクトサイズを徐々に変更
//
//----------------------------------------------------------------------------
//	引数	: efc			エフェクトＩＤ
//			: start_size	初期エフェクトサイズ
//			: end_size		最終エフェクトサイズ
//			: frm			フレーム数
//
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

	SetEffectScale_(efc, end_size);
}
