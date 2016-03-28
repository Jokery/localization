//=============================================
//
//		demo216[石像回転　左下]
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
	local player;
	local model_stone1, model_stone2, model_base;																//ギミック変数
	local stone000, stone000copy, stone001, stone001copy, stone002, stone002copy, stone003, stone003copy;
	
	local efc_002to000, efc_002to003, efc_002for000, efc_002for003;												//エフェクト変数
	local efc_003, efc_002, efc_000;
	
	local task_stone003, task_stone002, task_stone000;															//タスク変数
	local task_efc002to000, task_efc002to003, task_efc002for000, task_efc002for003;
	local base002to000, base002to003, base002for000, base002for003;

	local task_cam;
	
	local alpha_def;
	
	//-----------------------------------------------------------
	// 石像ギミックの回転フラグ(時計回り:true / 反時計回り:false)
	//-----------------------------------------------------------
	local flg = GetEventFlg_("BFG_MOVE_DIR_STATUE");

// ▼リソース読込
	// キャラクター
	player = GetPlayerId_();					// 主人公
	// エフェクト
	LoadEffect_("ef821_01_smoke_stone");		// 汎用煙03 車大のものが落ちたくらい

// ▼配置
	// 主人公
	SetPointPos_(player, "player000");
	
	//=====================================
	//ギミック設置
	//=====================================
	
	//キラーパンサーの像
	model_stone1 = ReadGimmick_("o_G02_20");
	stone000 = ArrangePointGimmick_("o_G02_20", model_stone1, "obj_hidariue000");						//左上
	stone000copy = ArrangePointGimmick_("o_G02_20", model_stone1, "obj_hidariue001");
	
	stone001 = ArrangePointGimmick_("o_G02_20", model_stone1, "obj_migiue000");							//右上
	stone001copy = ArrangePointGimmick_("o_G02_20", model_stone1, "obj_migiue001");
	
	//突撃魚の像
	model_stone2 = ReadGimmick_("o_G02_21");
	stone002 = ArrangePointGimmick_("o_G02_21", model_stone2, "obj_hidarisita000");						//左下
	stone002copy = ArrangePointGimmick_("o_G02_21", model_stone2, "obj_hidarisita001");
	
	stone003 = ArrangePointGimmick_("o_G02_21", model_stone2, "obj_migisita000");						//右下
	stone003copy = ArrangePointGimmick_("o_G02_21", model_stone2, "obj_migisita001");
	
	//エフェクトベース
	model_base = ReadGimmick_("o_effect_base");
	base002to000 = ArrangePointGimmick_("o_effect_base", model_base, "obj_efc_base000");
	base002to003 = ArrangePointGimmick_("o_effect_base", model_base, "obj_efc_base000");
	base002for000 = ArrangePointGimmick_("o_effect_base", model_base, "obj_efc_base000");
	base002for003 = ArrangePointGimmick_("o_effect_base", model_base, "obj_efc_base000");
	
	//光エフェクト
	LoadEffect_("ef731_01_mag_light01");
	efc_002to000 = SetSelectBoneEffect_("ef731_01_mag_light01", base002to000, ATTACH_GLOBAL);
	SetEffectScale_(efc_002to000, 0.5);
	efc_002to003 = SetSelectBoneEffect_("ef731_01_mag_light01", base002to003, ATTACH_GLOBAL);
	SetEffectScale_(efc_002to003, 0.5);
	efc_002for000 = SetSelectBoneEffect_("ef731_01_mag_light01", base002for000, ATTACH_GLOBAL);
	SetEffectScale_(efc_002for000, 0.5);
	efc_002for003 = SetSelectBoneEffect_("ef731_01_mag_light01", base002for003, ATTACH_GLOBAL);
	SetEffectScale_(efc_002for003, 0.5);
	
// ▼時間設定
	SetTime_(START_TIME_ZONE_NIGHT);
	
// ▼カメラ設定
	SetPointCameraEye_("cameye000");									//左下
	SetPointCameraTarget_("camtgt000");									//左下
	
//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット1　左下 突撃魚から光が発射
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	StartDemo(FADE_COLOR_BLACK);
	
	Wait_(36);
	
	if(flg == true){
		task_stone002 = Task_RotateToPos_(stone002, GetPos_(stone003), 1.2);						// 時計回り
	}else{
		task_stone002 = Task_RotateToPos_(stone002, GetPos_(stone002copy), 1.2);					// 反時計回り
	}
	
	PlaySE_("SE_FLD_100");
	
	efc_002 = SetPointWorldEffect_("ef821_01_smoke_stone", "efc_smoke_hidarisita000");				// 汎用煙03 車大のものが落ちたくらい
	SetEffectScale_(efc_002, 1.0);
	Wait_(30)
	DeleteEffectEmitter_(efc_002);
	Wait_(7);
	
	efc_002 = SetPointWorldEffect_("ef821_01_smoke_stone", "efc_smoke_hidarisita000");				// 汎用煙03 車大のものが落ちたくらい
	SetEffectScale_(efc_002, 1.0);
	Wait_(30)
	DeleteEffectEmitter_(efc_002);
	Wait_(7);
		
	for (local i=1; i <= 8; i++) {
		efc_002 = SetPointWorldEffect_("ef821_01_smoke_stone", "efc_smoke_hidarisita000");			// 汎用煙03 車大のものが落ちたくらい
		SetEffectScale_(efc_002, 1.0);
		
		DeleteEffectEmitter_(efc_002);
	}
		
		
	Wait_(40);
	
	
	task_efc002to000 = Task_AnimeMoveNoFit_(base002to000, "anm_efc002_beam_to_000");				//光アニメ
	task_efc002to003 = Task_AnimeMoveNoFit_(base002to003, "anm_efc002_beam_to_003");				//光アニメ
	PlaySE_("SE_DEM_103");
	Wait_(60);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット２
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");	// 60F
	PlaySE_("SE_DEM_104");
	
	DeleteEffect_(efc_002to000);
	DeleteEffect_(efc_002to003);
	DeleteTask_(task_efc002to000);
	DeleteTask_(task_efc002to003);
	DeleteTask_(task_stone002);
	
	
	task_efc002for003 = Task_AnimeMoveNoFit_(base002for003, "anm_efc002_beam_for_003");
	Wait_(58);

	for(alpha_def = 0.5; alpha_def >= 0; alpha_def = alpha_def - 0.05){
		SetEffectScale_(efc_002for003, alpha_def);
		Wait_(1);
	}
	SetEffectScale_(efc_002for003, 0);
	
	PlaySE_("SE_FLD_100");
	
	if(flg == true){
		task_stone003 = Task_RotateToPos_(stone003, GetPos_(stone003copy), 1.2);					//時計回り
	}else{
		task_stone003 = Task_RotateToPos_(stone003, GetPos_(stone001), 1.2);						//反時計回り
	}
	
	efc_003 = SetPointWorldEffect_("ef821_01_smoke_stone", "efc_smoke_migisita000");				// 汎用煙03 車大のものが落ちたくらい
	SetEffectScale_(efc_003, 1.0);
	Wait_(15);
	DeleteEffectEmitter_(efc_003);
	Wait_(10);

	for (local i=1; i <= 4; i++) {
		efc_003 = SetPointWorldEffect_("ef821_01_smoke_stone", "efc_smoke_migisita000");							// 汎用煙03 車大のものが落ちたくらい
		SetEffectScale_(efc_003, 1.0);
		Wait_(5);
		DeleteEffectEmitter_(efc_003);
		Wait_(7);
	}
	
	Wait_(60);
	
	DeleteTask_(task_efc002for003);
	DeleteTask_(task_cam);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット３
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");	// 60F
	PlaySE_("SE_DEM_104");
	
	DeleteTask_(task_stone003);
	
	task_efc002for000 = Task_AnimeMoveNoFit_(base002for000, "anm_efc002_beam_for_000");
	Wait_(58);
	
	for(alpha_def = 0.5; alpha_def >= 0; alpha_def = alpha_def - 0.05){
		SetEffectScale_(efc_002for000, alpha_def);
		Wait_(1);
	}
	SetEffectScale_(efc_002for000, 0);
	
	PlaySE_("SE_FLD_100");
	
	if(flg == true){
		task_stone000 = Task_RotateToPos_(stone000, GetPos_(stone000copy), 1.2);	//時計回り
	}else{
		task_stone000 = Task_RotateToPos_(stone000, GetPos_(stone002), 1.2);		//反時計回り
	}
	
	efc_000 = SetPointWorldEffect_("ef821_01_smoke_stone", "efc_smoke_hidariue000");				// 汎用煙03 車大のものが落ちたくらい
	SetEffectScale_(efc_000, 1.0);
	Wait_(15);
	DeleteEffectEmitter_(efc_000);
	Wait_(10);
	
	for (local i=1; i <= 4; i++) {
		efc_000 = SetPointWorldEffect_("ef821_01_smoke_stone", "efc_smoke_hidariue000");			// 汎用煙03 車大のものが落ちたくらい
		SetEffectScale_(efc_000, 1.0);
		Wait_(5);
		DeleteEffectEmitter_(efc_000);
		Wait_(7);
	}
	
	Wait_(60);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■デモ終了
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	
	EndDemo(FADE_COLOR_BLACK);
	
}
