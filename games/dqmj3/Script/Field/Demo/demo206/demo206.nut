//=============================================
//
//		demo206[秘密部屋への扉]
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
	local efc_stone1 ,efc_stone2, efc_bun;
	local efc_smoke0;

// ▼フラグ設定
	local bit_ruler = GetEventFlg_("BFG_RULER_ADD_010");			// Bit_210 ルーラ追加フラグ 共同墓地　アンデッドガーデン地下

// ▼リソース読込
	// キャラクター
	local player = GetPlayerId_();					// 主人公
	local model_bundoru = ReadNpc_("m203_00")		//ブンドル

// ▼配置
	local bundoru = ArrangePointNpc_(model_bundoru, "npc_bundoru_000");		//ブンドル
	SetScaleSilhouette(bundoru, SCALE.M, SILHOUETTE_WIDTH.M);

// ▼エフェクト読込
	LoadEffect_("ef726_01_nat_parapara");		//大地パラパラ
	LoadEffect_("ef721_03_nat_smoke_n03");		//煙3
	LoadEffect_("ef730_01_oth_dark_aura01");	// まがまがしいオーラ

//	▼ギミック読み込み
	local obj_doa = ReadGimmick_("o_G02_02");		//レジスタンスの扉
	local doa = ArrangePointGimmick_("o_G02_02",obj_doa, "obj_doa000");
	
	local model_ruler = ReadGimmick_("o_com_08");		//ルーラポイント
	local ruler = ArrangePointGimmick_("o_com_08", model_ruler, "obj_ruler000");
	// ▽ルーラポイントが既に起動していた場合
	if (bit_ruler) { SetMotion_(ruler, MOT_GIMMICK_2, BLEND_N); }
	
// ▼時間設定
	SetTime_(START_TIME_ZONE_NIGHT);
	
// ▼カメラ設定
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");

//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------
	efc_bun = SetSelectBoneEffectSetOffset_("ef730_01_oth_dark_aura01", bundoru, ATTACH_EFFECT2, Vec3(0.0, -5.0, 0.0));		//黒オーラ

	StartDemo(FADE_COLOR_BLACK);

	Wait_(60);	
	PlaySE_("SE_FLD_098");	//扉が開くSE
	StartEarthQuake_(-1, 3, 0.5); //地震
	//-----------------------------------------------
	
	//扉の開くギミック
	//-----------------------------------------------
	Wait_(30)
	SetMotion_(doa, MOT_GIMMICK_1, BLEND_M);							// 扉が開く
	SetMotionSpeed_(doa, 0.25);				
	
	efc_smoke0 = SetPointWorldEffect_("ef721_03_nat_smoke_n03", "efc_smoke000");	//煙3
	SetEffectScale_(efc_smoke0, 0.8);	

	//-----------------------------------------------	
	//エフェクト
	//-----------------------------------------------
	efc_stone1 = SetPointWorldEffect_("ef726_01_nat_parapara", "efc_stone000");	//石の破片
	SetEffectScale_(efc_stone1, 1.6);
	
	Wait_(20);
	DeleteEffectEmitter_(efc_stone1);
	
	efc_stone2 = SetPointWorldEffect_("ef726_01_nat_parapara", "efc_stone001");	//石の破片
	SetEffectScale_(efc_stone2, 1.6);

	Wait_(20);
	DeleteEffectEmitter_(efc_stone2);

	Wait_(20);
	efc_stone1 = SetPointWorldEffect_("ef726_01_nat_parapara", "efc_stone000");	//石の破片
	SetEffectScale_(efc_stone1, 1.6);
	Wait_(15);
	efc_stone2 = SetPointWorldEffect_("ef726_01_nat_parapara", "efc_stone001");	//石の破片
	SetEffectScale_(efc_stone2, 1.6);
	
	Wait_(5);
	DeleteEffectEmitter_(efc_stone1);
	
	Wait_(15);
	DeleteEffectEmitter_(efc_stone2);
	
	Wait_(15);
	efc_stone1 = SetPointWorldEffect_("ef726_01_nat_parapara", "efc_stone000");	//石の破片
	SetEffectScale_(efc_stone1, 1.6);
	Wait_(10);
	DeleteEffectEmitter_(efc_stone1);
	
	StopEarthQuake_();				//地震ストップ
	
	Wait_(20);
	
	//===============================================
	//*システムメッセージ
	//隠された　扉が出現した。
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_206_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	EndDemo(FADE_COLOR_BLACK);
}
