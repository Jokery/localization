//=============================================
//
//		demo215[石像回転　右下]
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
	
	local efc_003to001, efc_003to002, efc_003for001, efc_003for002;												//エフェクト変数
	local efc_003, efc_002, efc_001;
	
	local task_stone003, task_stone002, task_stone001;															//タスク変数
	local task_efc003to001, task_efc003to002, task_efc003for002, task_efc003for001;
	local base003to001, base003to002, base003for001, base003for002;
	
	local task_cam;
	
	local alpha_def;
	
	//-----------------------------------------------------------
	// 石像ギミックの回転フラグ(時計回り:true / 反時計回り:false)
	//-----------------------------------------------------------
	local flg = GetEventFlg_("BFG_MOVE_DIR_STATUE");

// ▼リソース読込
	// キャラクター
	player = GetPlayerId_();									// 主人公
	// エフェクト
	LoadEffect_("ef821_01_smoke_stone");						// 石像を動かしたときの煙

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
	base003to001 = ArrangePointGimmick_("o_effect_base", model_base, "obj_efc_base000");
	base003to002 = ArrangePointGimmick_("o_effect_base", model_base, "obj_efc_base000");
	base003for001 = ArrangePointGimmick_("o_effect_base", model_base, "obj_efc_base000");
	base003for002 = ArrangePointGimmick_("o_effect_base", model_base, "obj_efc_base000");
	
	//光エフェクト
	LoadEffect_("ef731_01_mag_light01");
	efc_003to001 = SetSelectBoneEffect_("ef731_01_mag_light01", base003to001, ATTACH_GLOBAL);
	SetEffectScale_(efc_003to001, 0.5);
	efc_003to002 = SetSelectBoneEffect_("ef731_01_mag_light01", base003to002, ATTACH_GLOBAL);
	SetEffectScale_(efc_003to002, 0.5);
	efc_003for001 = SetSelectBoneEffect_("ef731_01_mag_light01", base003for001, ATTACH_GLOBAL);
	SetEffectScale_(efc_003for001, 0.5);
	efc_003for002 = SetSelectBoneEffect_("ef731_01_mag_light01", base003for002, ATTACH_GLOBAL);
	SetEffectScale_(efc_003for002, 0.5);
	
// ▼時間設定
	SetTime_(START_TIME_ZONE_NIGHT);
	
// ▼カメラ設定
	SetPointCameraEye_("cameye000");													//右下カメラ
	SetPointCameraTarget_("camtgt000");													//右下

//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット1 右下 突撃魚から光が発射
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	StartDemo(FADE_COLOR_BLACK);
	
	Wait_(36);
	
	if(flg == true){
		task_stone003 = Task_RotateToPos_(stone003, GetPos_(stone003copy), 1.2);	// 時計回り
	}else{
		task_stone003 = Task_RotateToPos_(stone003, GetPos_(stone001), 1.2);		// 反時計回り
	}
	
	PlaySE_("SE_FLD_100");
	
	efc_003 = SetPointWorldEffect_("ef821_01_smoke_stone", "efc_smoke_migisita000");	// 石像を動かしたときの煙
	SetEffectScale_(efc_003, 1.0);
	Wait_(30)
	DeleteEffectEmitter_(efc_003);
	Wait_(7);

	efc_003 = SetPointWorldEffect_("ef821_01_smoke_stone", "efc_smoke_migisita000");	// 石像を動かしたときの煙
	SetEffectScale_(efc_003, 1.0);
	Wait_(30);
	DeleteEffectEmitter_(efc_003);
	Wait_(7);

	for (local i=1; i <= 8; i++) {
		efc_003 = SetPointWorldEffect_("ef821_01_smoke_stone", "efc_smoke_migisita000");			// 石像を動かしたときの煙
		SetEffectScale_(efc_003, 1.0);
		DeleteEffectEmitter_(efc_003);
	}
	
	DeleteEffectEmitter_(efc_003);
	Wait_(40);
	
	//右下　突撃魚から光が発射
	task_efc003to001 = Task_AnimeMoveNoFit_(base003to001, "anm_efc003_beam_to_001");	//光アニメ 右下⇒右上
	task_efc003to002 = Task_AnimeMoveNoFit_(base003to002, "anm_efc003_beam_to_002");	//光アニメ 右下⇒左下
	PlaySE_("SE_DEM_103");
	Wait_(60);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット2 左下 突撃魚が光を受け取る
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");	// 60F
	PlaySE_("SE_DEM_104");
	
	DeleteEffect_(efc_003to001);
	DeleteEffect_(efc_003to002);
	DeleteTask_(task_efc003to001);
	DeleteTask_(task_efc003to002);
	DeleteTask_(task_stone003);
	
	//左下　突撃魚が光を受け取る
	task_efc003for002 = Task_AnimeMoveNoFit_(base003for002, "anm_efc003_beam_for_002");	//光アニメ 右下⇒左下
	Wait_(58);
	
	for(alpha_def = 0.5; alpha_def >= 0; alpha_def = alpha_def - 0.05){
		SetEffectScale_(efc_003for002, alpha_def);
		Wait_(1);
	}
	SetEffectScale_(efc_003for002, 0);
	
	PlaySE_("SE_FLD_100");
	
	if(flg == true){
		task_stone002 = Task_RotateToPos_(stone002, GetPos_(stone003), 1.2);		//時計回り
	}else{
		task_stone002 = Task_RotateToPos_(stone002, GetPos_(stone002copy), 1.2);	//反時計回り
	}
	
	efc_002 = SetPointWorldEffect_("ef821_01_smoke_stone", "efc_smoke_hidarisita000");				// 石像を動かしたときの煙
	SetEffectScale_(efc_002, 1.0);
	Wait_(15);
	DeleteEffectEmitter_(efc_002);
	Wait_(10);

	for (local i=1; i <= 4; i++) {
		efc_002 = SetPointWorldEffect_("ef821_01_smoke_stone", "efc_smoke_hidarisita000");			// 石像を動かしたときの煙
		SetEffectScale_(efc_002, 1.0);
		Wait_(5);
		DeleteEffectEmitter_(efc_002);
		Wait_(7);
	}
	
	Wait_(60);
	
	DeleteTask_(task_efc003for002);
	DeleteTask_(task_cam);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット３ 右上 キラパンが光を受け取る
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");	// 60F
	PlaySE_("SE_DEM_104");
	
	DeleteTask_(task_stone002);
	
	task_efc003for001 = Task_AnimeMoveNoFit_(base003for001, "anm_efc003_beam_for_001");	//光アニメ 右下⇒右上
	Wait_(58);
	
	for(alpha_def = 0.5; alpha_def >= 0; alpha_def = alpha_def - 0.05){
		SetEffectScale_(efc_003for001, alpha_def);
		Wait_(1);
	}
	SetEffectScale_(efc_003for001, 0);
	
	PlaySE_("SE_FLD_100");
	
	if(flg == true){
		task_stone001 = Task_RotateToPos_(stone001, GetPos_(stone000), 1.2);	//時計回り
	}else{
		task_stone001 = Task_RotateToDir_(stone001, 90, 1.2);					//反時計回り
	}

	efc_001 = SetPointWorldEffect_("ef821_01_smoke_stone", "efc_smoke_migiue000");		// 石像を動かしたときの煙
	SetEffectScale_(efc_001, 1.0);
	Wait_(15);
	DeleteEffectEmitter_(efc_001);
	Wait_(10);
	
	for (local i=1; i <= 4; i++) {
		efc_001 = SetPointWorldEffect_("ef821_01_smoke_stone", "efc_smoke_migiue000");			// 石像を動かしたときの煙
		SetEffectScale_(efc_001, 1.0);
		Wait_(5);
		DeleteEffectEmitter_(efc_001);
		Wait_(7);
	}
	
	Wait_(60);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■デモ終了
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	
	EndDemo(FADE_COLOR_BLACK);
	
}
