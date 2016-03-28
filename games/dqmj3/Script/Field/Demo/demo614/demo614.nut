//=============================================
//
//		demo614[ガルビルスの暴走_2(花粉発生)]
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
	local efc_dark_energy;

// ▼リソース読込
	// キャラクター
	local player = GetPlayerId_();					// 主人公
	
	//ギミック
	local model_coa000 = ReadGimmick_("o_dem_19");	// コア外観
	
	//エフェクト
	LoadEffect_("ef861_15_dark_energy");			// どす黒いエネルギー
	
	
// ▼配置
	// 主人公
	SetPointPos_(player, "player000");

	// ギミック
	local coa000 = ArrangePointGimmick_("o_dem_19", model_coa000, "obj_coa000");

// ▼カメラ設定
	local task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");
	
//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------
		
	
	StartDemo(FADE_COLOR_BLACK);
	Wait_(40);
	efc_dark_energy = SetPointWorldEffect_("ef861_15_dark_energy", "efc_dark_energy");			// どす黒いエネルギー
	SetEffectScale_(efc_dark_energy, 5.8);
	PlaySE_("SE_DEM_159");
	WaitTask(task_cam);

	Wait_(120);
	EndDemo(FADE_COLOR_BLACK);
}
