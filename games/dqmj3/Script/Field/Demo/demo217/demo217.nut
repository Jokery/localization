//=============================================
//
//		demo217[石像回転　右上]
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
	
	local efc_001to000, efc_001to003, efc_001for000, efc_001for003;												//エフェクト変数
	local efc_003, efc_001, efc_000;
	
	local task_stone003, task_stone001, task_stone000;															//タスク変数
	local task_efc001to000, task_efc001to003, task_efc001for000, task_efc001for003;
	local base001to000, base001to003, base001for000, base001for003;

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
	base001to000 = ArrangePointGimmick_("o_effect_base", model_base, "obj_efc_base000");
	base001to003 = ArrangePointGimmick_("o_effect_base", model_base, "obj_efc_base000");
	base001for000 = ArrangePointGimmick_("o_effect_base", model_base, "obj_efc_base000");
	base001for003 = ArrangePointGimmick_("o_effect_base", model_base, "obj_efc_base000");
	
	//光エフェクト
	LoadEffect_("ef731_01_mag_light01");
	efc_001to000 = SetSelectBoneEffect_("ef731_01_mag_light01", base001to000, ATTACH_GLOBAL);
	SetEffectScale_(efc_001to000, 0.5);
	efc_001to003 = SetSelectBoneEffect_("ef731_01_mag_light01", base001to003, ATTACH_GLOBAL);
	SetEffectScale_(efc_001to003, 0.5);
	efc_001for000 = SetSelectBoneEffect_("ef731_01_mag_light01", base001for000, ATTACH_GLOBAL);
	SetEffectScale_(efc_001for000, 0.5);
	efc_001for003 = SetSelectBoneEffect_("ef731_01_mag_light01", base001for003, ATTACH_GLOBAL);
	SetEffectScale_(efc_001for003, 0.5);
	
// ▼時間設定
	SetTime_(START_TIME_ZONE_NIGHT);
	
// ▼カメラ設定
	SetPointCameraEye_("cameye000");			//右上
	SetPointCameraTarget_("camtgt000");			//右上

//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット1
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	StartDemo(FADE_COLOR_BLACK);
	
	Wait_(36);
	
	if(flg == true){
		task_stone001 = Task_RotateToPos_(stone001, GetPos_(stone000), 1.2);	//時計回り
	}else{
		task_stone001 = Task_RotateToDir_(stone001, 90, 1.2);					//反時計回り
	}
	
	PlaySE_("SE_FLD_100");
	
	efc_001 = SetPointWorldEffect_("ef821_01_smoke_stone", "efc_smoke_migiue000");		// 汎用煙03 車大のものが落ちたくらい
	SetEffectScale_(efc_001, 1.0);
	Wait_(30)
	DeleteEffectEmitter_(efc_001);
	Wait_(7);
	
	efc_001 = SetPointWorldEffect_("ef821_01_smoke_stone", "efc_smoke_migiue000");		// 汎用煙03 車大のものが落ちたくらい
	SetEffectScale_(efc_001, 1.0);	
	Wait_(30)
	DeleteEffectEmitter_(efc_001);
	Wait_(7);
		
	for (local i=1; i <= 8; i++) {
		efc_001 = SetPointWorldEffect_("ef821_01_smoke_stone", "efc_smoke_migiue000");	// 汎用煙03 車大のものが落ちたくらい
		SetEffectScale_(efc_001, 1.0);
		DeleteEffectEmitter_(efc_001);
	}
		
		
	Wait_(40);
	
	
	task_efc001to000 = Task_AnimeMoveNoFit_(base001to000, "anm_efc001_beam_to_000");		//光アニメ
	task_efc001to003 = Task_AnimeMoveNoFit_(base001to003, "anm_efc001_beam_to_003");		//光アニメ
	PlaySE_("SE_DEM_103");
	Wait_(60);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット２
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");	// 60F
	PlaySE_("SE_DEM_104");
	
	DeleteEffect_(efc_001to000);
	DeleteEffect_(efc_001to003);
	DeleteTask_(task_efc001to000);
	DeleteTask_(task_efc001to003);
	DeleteTask_(task_stone001);
	
	
	task_efc001for000 = Task_AnimeMoveNoFit_(base001for000, "anm_efc001_beam_for_000");		//光エフェクト
	Wait_(58);
	
	for(alpha_def = 0.5; alpha_def >= 0; alpha_def = alpha_def - 0.05){
		SetEffectScale_(efc_001for000, alpha_def);
		Wait_(1);
	}
	SetEffectScale_(efc_001for000, 0);
	
	PlaySE_("SE_FLD_100");
	
	if(flg == true){
		task_stone000 = Task_RotateToPos_(stone000, GetPos_(stone000copy), 1.2);			//時計回り
	}else{
		task_stone000 = Task_RotateToPos_(stone000, GetPos_(stone002), 1.2);				//反時計回り
	}
	
	efc_000 = SetPointWorldEffect_("ef821_01_smoke_stone", "efc_smoke_hidariue000");						// 汎用煙03 車大のものが落ちたくらい
	SetEffectScale_(efc_000, 1.0);
	Wait_(15);
	DeleteEffectEmitter_(efc_000);
	Wait_(10);
	
	for (local i=1; i <= 4; i++) {
		efc_000 = SetPointWorldEffect_("ef821_01_smoke_stone", "efc_smoke_hidariue000");					// 汎用煙03 車大のものが落ちたくらい
		SetEffectScale_(efc_000, 1.0);
		Wait_(5);
		DeleteEffectEmitter_(efc_000);
		Wait_(7);
	}
	
	Wait_(60);
	
	DeleteTask_(task_efc001for000);
	DeleteTask_(task_cam);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット３
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");	// 60F
	PlaySE_("SE_DEM_104");
	
	DeleteTask_(task_stone000);
	
	task_efc001for003 = Task_AnimeMoveNoFit_(base001for003, "anm_efc001_beam_for_003");
	Wait_(58);
	
	for(alpha_def = 0.5; alpha_def >= 0; alpha_def = alpha_def - 0.05){
		SetEffectScale_(efc_001for003, alpha_def);
		Wait_(1);
	}
	SetEffectScale_(efc_001for003, 0);
	
	PlaySE_("SE_FLD_100");
	
	if(flg == true){
		task_stone003 = Task_RotateToPos_(stone003, GetPos_(stone003copy), 1.2);			//時計回り
	}else{
		task_stone003 = Task_RotateToPos_(stone003, GetPos_(stone001), 1.2);				//反時計回り
	}
	
	efc_003 = SetPointWorldEffect_("ef821_01_smoke_stone", "efc_smoke_migisita000");						// 汎用煙03 車大のものが落ちたくらい
	SetEffectScale_(efc_003, 1.0);
	Wait_(15);
	DeleteEffectEmitter_(efc_003);
	Wait_(10);

	for (local i=1; i <= 4; i++) {
		efc_003 = SetPointWorldEffect_("ef821_01_smoke_stone", "efc_smoke_migisita000");					// 汎用煙03 車大のものが落ちたくらい
		SetEffectScale_(efc_003, 1.0);
		Wait_(5);
		DeleteEffectEmitter_(efc_003);
		Wait_(7);
	}
	
	Wait_(60);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■デモ終了
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	
	EndDemo(FADE_COLOR_BLACK);
	
}
