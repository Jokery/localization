//=============================================
//
//		demo431[イッタブルの集会_2(2F)]
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

// ▼リソース読込
	// ギミック
	local model_door = ReadGimmick_("o_S02_03");		// 機械の扉
	// キャラクター
	local model_toge = ReadNpc_("m195_00");				// とげジョボーブレイク化
	// エフェクト
	LoadEffect_("ef721_02_nat_smoke_n02");				// 煙
	LoadEffect_("ef841_01_smoke_brkmcn01");				// 開く前　煙
	LoadEffect_("ef841_02_smoke_brkmcn02");				// 開いたとき　煙
	LoadEffect_("ef841_03_smoke_brkmcn03");				// 開いたあと　煙

// ▼配置
	// 扉
	local obj_door004 = ArrangePointGimmick_("o_S02_03", model_door, "obj_door004");
	local obj_door005 = ArrangePointGimmick_("o_S02_03", model_door, "obj_door005");
	local obj_door006 = ArrangePointGimmick_("o_S02_03", model_door, "obj_door006");
	local obj_door007 = ArrangePointGimmick_("o_S02_03", model_door, "obj_door007");

	// とげジョボー
	local toge0 = ArrangePointNpc_(model_toge, "npc_toge000");
	local toge1 = ArrangePointNpc_(model_toge, "npc_toge001");
	local toge2 = ArrangePointNpc_(model_toge, "npc_toge002");
	local toge3 = ArrangePointNpc_(model_toge, "npc_toge003");
	local toge4 = ArrangePointNpc_(model_toge, "npc_toge004");
	local toge5 = ArrangePointNpc_(model_toge, "npc_toge005");
	local toge6 = ArrangePointNpc_(model_toge, "npc_toge006");

// ▼非常駐モーション読込
	// とげジョボー 改造された直後
	local toge0_after_break = ReadMotion_(toge0, "m195_00_after_break");
	local toge1_after_break = ReadMotion_(toge1, "m195_00_after_break");
	local toge2_after_break = ReadMotion_(toge2, "m195_00_after_break");
	local toge3_after_break = ReadMotion_(toge3, "m195_00_after_break");
	local toge4_after_break = ReadMotion_(toge4, "m195_00_after_break");
	local toge5_after_break = ReadMotion_(toge5, "m195_00_after_break");
	local toge6_after_break = ReadMotion_(toge6, "m195_00_after_break");
	// ブレイク化で歩行
	local break_walk = ReadMotion_(toge0, "m195_00_break_walk");
	local break_walk = ReadMotion_(toge1, "m195_00_break_walk");
	local break_walk = ReadMotion_(toge2, "m195_00_break_walk");
	local break_walk = ReadMotion_(toge3, "m195_00_break_walk");
	local break_walk = ReadMotion_(toge4, "m195_00_break_walk");
	local break_walk = ReadMotion_(toge5, "m195_00_break_walk");
	local break_walk = ReadMotion_(toge6, "m195_00_break_walk");

// ▼モーション設定
	SetMotion_(obj_door004, MOT_GIMMICK_1, BLEND_N);
	SetMotion_(obj_door005, MOT_GIMMICK_1, BLEND_N);
	SetMotion_(obj_door006, MOT_GIMMICK_1, BLEND_N);
	SetMotion_(obj_door007, MOT_GIMMICK_1, BLEND_N);
	
	SetMotion_(toge0, toge0_after_break, BLEND_L);
	SetMotion_(toge1, toge1_after_break, BLEND_L);
	SetMotion_(toge2, toge2_after_break, BLEND_L);
	SetMotion_(toge3, toge3_after_break, BLEND_L);
	SetMotion_(toge4, toge4_after_break, BLEND_L);
	SetMotion_(toge5, toge5_after_break, BLEND_L);
	SetMotion_(toge6, toge6_after_break, BLEND_L);

// ▼エフェクト設定
	local efc_door = SetPointWorldEffect_("ef841_01_smoke_brkmcn01", "efc_kemuri001");		// 開く前の煙
	local efc_smoke0 = SetSelectBoneEffect_("ef841_03_smoke_brkmcn03", toge0, ATTACH_EFFECT1);
	local efc_smoke1 = SetSelectBoneEffect_("ef841_03_smoke_brkmcn03", toge1, ATTACH_EFFECT1);
	local efc_smoke2 = SetSelectBoneEffect_("ef841_03_smoke_brkmcn03", toge2, ATTACH_EFFECT1);
	local efc_smoke3 = SetSelectBoneEffect_("ef841_03_smoke_brkmcn03", toge3, ATTACH_EFFECT1);
	local efc_smoke4 = SetSelectBoneEffect_("ef841_03_smoke_brkmcn03", toge4, ATTACH_EFFECT1);
	local efc_smoke5 = SetSelectBoneEffect_("ef841_03_smoke_brkmcn03", toge5, ATTACH_EFFECT1);

// ▼カメラ設定
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");						// 改造装置のドアが開く撮影用

//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------

	PlaySE_("SE_DEM_096");
	StartDemo(FADE_COLOR_BLACK);

	// ▼カット１＠～～～～～～～～～～～～～～～～～～～～～～
	Wait_(10);
	DeleteEffectEmitter_(efc_door);
	
	//扉が開く007
	uOpenDoor(obj_door007, "efc_kemuri001");		// uOpenDoor(ID, エフェクト設置ノード名)
	
	efc_door = SetPointWorldEffect_("ef841_01_smoke_brkmcn01", "efc_kemuri000");		// 開く前の煙
	Wait_(25);
	DeleteEffectEmitter_(efc_door);
	
	SetVisible(toge1, false);
	SetVisible(obj_door007, false);
	
	// 扉が開く006
	uOpenDoor(obj_door006, "efc_kemuri000");
	
	efc_door = SetPointWorldEffect_("ef841_01_smoke_brkmcn01", "efc_kemuri002");		// 開く前の煙
	Wait_(30);
	DeleteEffectEmitter_(efc_door);
	
	// 扉が開く005
	uOpenDoor(obj_door005, "efc_kemuri002");
	
	efc_door = SetPointWorldEffect_("ef841_01_smoke_brkmcn01", "efc_kemuri004");		// 開く前の煙
	Wait_(35);
	DeleteEffectEmitter_(efc_door);

	// 扉が開く004
	uOpenDoor(obj_door004, "efc_kemuri004");
	Wait_(120);
	
	DeleteEffect_(efc_smoke0);
	DeleteEffect_(efc_smoke1);
	DeleteEffect_(efc_smoke2);
	DeleteEffect_(efc_smoke3);
	DeleteEffect_(efc_smoke4);
	DeleteEffect_(efc_smoke5);
	
	DeleteTask_(task_cam);
	SetVisible(toge1, true);
	
	// ▼カット２＠～～～～～～～～～～～～～～～～～～～～～～
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");			// とげジョボー接近撮影用
	
	// とげジョボー歩き002
	local step1, step2, step3;
	step1 = Task_ChangeStepSe(toge2, "SE_FLD_031", 10);
	uWalkToge(toge2, 1.5, 40, break_walk);		// uWalkToge(ID, 歩く速度, wait);

	// とげジョボー歩き003
	step2 = Task_ChangeStepSe(toge2, "SE_FLD_031", 10);
	uWalkToge(toge3, 1.5, 40, break_walk);
	
	// とげジョボー歩き000
	step3 = Task_ChangeStepSe(toge2, "SE_FLD_031", 10);
	uWalkToge(toge0, 1.5, 40, break_walk);
	
	// とげジョボー歩き004
	SetStepSe_(toge4, SILENT_STEP_SE);
	uWalkToge(toge4, 1.5, 30, break_walk);

	// とげジョボー歩き001
	SetStepSe_(toge1, SILENT_STEP_SE);
	uWalkToge(toge1, 1.4, 40, break_walk);

	// とげジョボー歩き005
	SetStepSe_(toge5, SILENT_STEP_SE);
	uWalkToge(toge5, 1.6, 30, break_walk);
	Wait_(110);

	DeleteTask_(step1);
	DeleteTask_(step2);
	DeleteTask_(step3);
	EndDemo(FADE_COLOR_BLACK);
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		扉を開く
//------------------------------------------------
//	引数	: id	ギミックID
//			: pos	ノード名
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uOpenDoor(id, pos)
{
	local efc;
	
	SetMotion_(id, MOT_GIMMICK_2, BLEND_N);
	efc = SetPointWorldEffect_("ef841_02_smoke_brkmcn02", pos);
	
	SetMotionSpeed_(id, 5);
	WaitMotion(id);
	
	SetMotionSpeed_(id, 1);
	SetMotion_(id, MOT_GIMMICK_2, BLEND_N);
	StartEarthQuake_(15, 3, 0.5);
	Wait_(20);
	
	SetMotion_(id, MOT_GIMMICK_2, BLEND_N);
	WaitMotion(id);
	SetMotion_(id, MOT_GIMMICK_2, BLEND_N);
	
	DeleteEffectEmitter_(efc);
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		トゲジョボーが歩く
//------------------------------------------------
//	引数	: id	キャラクターID
//			: spd	歩く速度
//			: wait	待ち時間
//			: mot	モーション
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uWalkToge(id, spd, wait, mot)
{
	local task;
	
	SetMotion_(id, mot, BLEND_L);
	
	task = Task_MoveForward_(id, spd, false);
	Wait_(wait);
	
	task = Task_RotateToDir_(id, 180, 1);
	
	return task;
}
