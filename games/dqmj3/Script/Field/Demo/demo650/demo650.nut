//=============================================
//
//		demo650[ガルマザード戦勝利_9(脱出)]
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
	local task_cam, task_player, task_player2;
	local efc_player, efc_light, efc_kira;

// ▼リソース読込
	// キャラクター
	local player = GetPlayerId_();							// 主人公
	local model_o_V00_10 = ReadGimmick_("o_V00_10");		// 浮島

// ▼配置
	// 主人公
	SetPointPosNoFit_(player, "player000");
	//浮島
	local gmc_o_V00_10 = ArrangePointGimmick_("o_V00_10", model_o_V00_10, "ukisima000");

// ▼非常駐モーション読込
	local player_light_L = ReadMotion_(player, "Player_wrap_light_L");				// 光につつまれるL
	local player_float = ReadMotion_(player, "Player_float");						// 光につつまれる（上向き）L

// ▼カメラ設定
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");
	Wait_(15);		// 大陸のチラつき防止

// ▼エフェクト
	LoadEffect_("ef710_05_cha_light_ren");					// レナーテの光
	LoadEffect_("ef732_13_light_reactor01");				// リアクターの光（まぶしい）
	LoadEffect_("ef731_01_mag_light01");					// キラキラ
	efc_player = SetSelectBoneEffect_("ef710_05_cha_light_ren", player, ATTACH_GLOBAL);

// ▼モーション設定
	SetMotion_(player, player_light_L, BLEND_N);


//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------
//cut01===============================================

	WaitLod_();
	StartDemo(FADE_COLOR_BLACK);
	WaitTask(task_cam);
	Wait_(60);


//cut02===============================================

	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");

	WaitTask(task_cam);
	SetPointPosNoFit_(player, "player001");


//cut03===============================================

	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");

	task_player = Task_AnimeMoveNoDirNoFit_(player, "anm_player000");								//主人公飛び立つ
	efc_kira = SetSelectBoneEffect_("ef731_01_mag_light01", player, ATTACH_EFFECT2);				//きらきら
	SetEffectScale_(efc_kira, 0.3);
	Wait_(30);
	SetMotion_(player, player_float, BLEND_XL);														//上がる体制
	Wait_(20);
	efc_light = SetSelectBoneEffectSetOffset_("ef732_13_light_reactor01", player, ATTACH_EFFECT2,Vec3(0.0, 0.0, -10.0));		//光の玉
	SetEffectScale_(efc_light, 0.5);
	DeleteEffectEmitter_(efc_player);
	uChangeEffectScale(efc_light, 0.5, 2.7, 30)						//光の玉を大きく
	SetAlphaFade(player, 0.0, 1);
	uChangeEffectScale(efc_light, 2.7, 0.5, 50)						//光の玉を小さく
	SetEffectScale_(efc_kira, 0.5);
	Wait_(100);
//	PlaySE_("SE_DEM_175");
	Wait_(50);
	EndDemoBgmFade_(120);
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 120);
	WaitFade_();
	Wait_(120);
	DeleteAllTask_();

	End_();
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
