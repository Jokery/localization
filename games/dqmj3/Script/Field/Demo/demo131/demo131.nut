//========================================================
//
//		demo131[移動装置使用_2(崩落)]
//
//========================================================

//-------------------------------------------------------------------------
//
//		読み込み・配置
//
//-------------------------------------------------------------------------

function Update()
{
	SetTime_(15120);								// 夜	
	//=====================================
	//ローカル変数の設定
	//=====================================
	local task_cam, task_player;
	local efc_player, ef_tec01, ef_tec02, ef_tec03;
	
	//=====================================
	//ギミック設置
	//=====================================
	local gimmick000 = ReadGimmick_("o_dem_00");
	local res_tele = ArrangePointGimmick_("o_dem_00", gimmick000, "obj_transfer000");
	
	//=====================================
	//プレイヤー設置
	//=====================================
	//IDの取得
	local player = GetPlayerId_();
	
	//設置
	SetPointPos_(player, "player000");
	
	//初期の向き
	SetDir_(player, 190);
	
	//=====================================
	//エフェクトの読み込み
	//=====================================
	LoadEffect_("ef732_01_tec_device_travel01");
	LoadEffect_("ef732_01_tec_device_travel02");
	LoadEffect_("ef732_01_tec_device_travel03");
	LoadEffect_("ef732_02_tec_device_travel02");
	LoadEffect_("ef732_03_tec_device_travel03");

//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット１	移動装置起動
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");									//F260

	StartDemo(FADE_COLOR_BLACK);
	
	Wait_(40);
	PlaySE_("SE_DEM_022");
	SetMotion_(res_tele, MOT_GIMMICK_1, 0);														//移送装置起動
	
	Wait_(190);
	SetMotion_(res_tele, MOT_GIMMICK_2, 0);														//移送装置起動
	Wait_(35);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット2		主人公飛び立つ
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	DeleteTask_(task_cam);
	
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");
	
	Wait_(10);

	PlaySE_("SE_DEM_102");																		//主人公が浮かび上がってから射出されるまでの一連のSE
	local ef_tec02 = SetPointWorldEffect_("ef732_02_tec_device_travel02", "obj_transfer000");	//床が光る
	SetMotion_(player, MOT_JUMP_UP, BLEND_M);
	task_player = Task_AnimeMoveNoFit_(player, "anm_player001");								//主人公 宙に浮く
	ef_tec03 = SetSelectBoneEffect_("ef732_03_tec_device_travel03", player, ATTACH_GLOBAL);		//主人公の周りの光
	Wait_(30);
	
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");									//主人公 飛び立つ
	
	DeleteTask_(task_player);
	
	task_player = Task_AnimeMoveNoFit_(player, "anm_player000");
	
	Wait_(20);
	SetMotion_(player, MOT_SPECIAL_WAIT, BLEND_XL);	
	
			
	Wait_(40);
	SetMotion_(player, MOT_SPECIAL_RUN, BLEND_M);
	local ef_tec01 = SetPointWorldEffect_("ef732_01_tec_device_travel01", "obj_transfer000");	//移動装置、丸いEF
	Wait_(15);
	
	Wait_(40);

	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■デモ終了
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	
	EndDemo(FADE_COLOR_BLACK);
}
