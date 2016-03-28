//=============================================
//
//		demo616[レナーテの告白_2(高空)]
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
	// キャラクター
	local player = GetPlayerId_();					// 主人公
	
	//ギミック
	local model_coa000 = ReadGimmick_("o_dem_19");	// コア外観
	
	//エフェクト
	LoadEffect_("ef864_01_pollen_core");			// コア周りの黒い花粉


// ▼配置
	// 主人公
	SetPointPos_(player, "player000");
	
	local efc_pollen_core = SetPointWorldEffect_("ef864_01_pollen_core", "efc_pollen_core");		// コア周りの黒い花粉
		
	//ギミック
	local coa000 = ArrangePointGimmick_("o_dem_19", model_coa000, "obj_coa000");
	
//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------

	local task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");

	StartDemo(FADE_COLOR_BLACK);
	
	//===============================================
	// ■レナーテ
	// 「見て……ガルビルスは　黒い花粉をまき散らし
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_616_MSG_010");
	KeyInputWait_();
	//===============================================
	
	//===============================================
	// ■レナーテ
	// 「あの黒い花粉は　あらゆるものの秩序を乱す。
	//-----------------------------------------------
	ShowMsg_("DEMO_616_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	Wait_(30);
	
	EndDemo(FADE_COLOR_BLACK);
}
