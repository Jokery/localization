//=============================================
//
//		demo017[エースからの通信・ロック解除前_1]
//
//=============================================

function Update()
{

// ▼変数定義
	local task_cam, task_player;
	local efc_player;

// ▼リソース読込
	local player = GetPlayerId_();
	local model_king = ReadNpc_("n003");			// キング
	local model_nochoman = ReadNpc_("n000");		// ノチョーラ♂
	local model_nochogirl = ReadNpc_("n004");		// ノチョーラ♀
	
	local model_cage = ReadGimmick_("o_H00_02");

	LoadEffect_("ef732_09_light_reactor_c");

// ▼配置
	local cage = ArrangePointGimmick_("o_H00_02", model_cage, "obj_cage000");

	SetPointPos_(player, "player000");
	SetDir_(player, 335);
	local king = ArrangePointNpc_(model_king, "npc_king000");
	SetDir_(king, -80);
	local nochoman000 = ArrangePointNpc_(model_nochoman, "npc_nocho000");
	SetDir_(nochoman000, 170);
	local nochoman100 = ArrangePointNpc_(model_nochoman, "npc_nocho100");
	SetDir_(nochoman100, 32);
	local nochogirl200 = ArrangePointNpc_(model_nochogirl, "npc_nocho200");
	local nochogirl300 = ArrangePointNpc_(model_nochogirl, "npc_nocho300");
	
// ▼非常駐モーション読込
	local Player_touch_reactor = ReadMotion_(player, "Player_touch_reactor");			// 主人公顔を少し左向ける→リアクターを触る
	local Player_touch_reactor_L = ReadMotion_(player, "Player_touch_reactor_L");		// 主人公リアクターを触るL
	local Player_cage_look_L = ReadMotion_(player, "Player_cage_look_L");				// 主人公上を向く
	local n003_shock_L = ReadMotion_(king, "n003_shock_L");								// キング怯え
	local n000_shock_L_nochoman000 = ReadMotion_(nochoman000, "n000_shock_L");			// ノチョーラ怯え
	local n000_shock_L_nochoman100 = ReadMotion_(nochoman100, "n000_shock_L");			// ノチョーラ怯え
	local n000_shock_L_nochogirl200 = ReadMotion_(nochogirl200, "n000_shock_L");		// ノチョーラ怯え
	local n000_shock_L_nochogirl300 = ReadMotion_(nochogirl300, "n000_shock_L");		// ノチョーラ怯え

	SetMotion_(player, Player_cage_look_L, BLEND_N);
	SetMotion_(king, n003_shock_L, BLEND_N);
	SetMotion_(nochoman000, n000_shock_L_nochoman000, BLEND_N);
	SetMotion_(nochoman100, n000_shock_L_nochoman100, BLEND_N);
	SetMotion_(nochogirl200, n000_shock_L_nochogirl200, BLEND_N);
	SetMotion_(nochogirl300, n000_shock_L_nochogirl300, BLEND_N);

// ▼カメラ設定
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");
	
//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------
	
	StartDemo(FADE_COLOR_BLACK);
	
	Wait_(90);
	
	DeleteTask_(task_cam);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット2
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓	
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");
	
	Wait_(50);
	
	efc_player = SetSelectBoneEffectSetOffset_("ef732_09_light_reactor_c", player, ATTACH_EFFECT2, Vec3(0.0, 5.5, -1.0));
	
	PlaySE_("SE_DEM_019");		// SE:リアクター反応音
	
	Wait_(10);
	
	task_player = Task_RotateToPos_(player, GetPos_(nochogirl300), ROTATE_DEMO_DEF);

	SetMotion_(player,Player_touch_reactor, BLEND_XL);
	WaitMotion(player);
	SetMotion_(player,Player_touch_reactor_L, BLEND_XL);
	
	Wait_(20);
	
	OpenMsgWnd_();
	OpenConnective("connective_ace");
	SetTalkName_("NAME_TAG_ACE");
	//エース「聞こえるかモンスターマスター
	ShowMsg_("DEMO_017_MSG_010");
	KeyInputWait_();
	//エース「それがキングたちのつかまっているカゴだ
	ShowMsg_("DEMO_017_MSG_020");
	KeyInputWait_();
	//エース「ウィンチの制御装置を探せ！
	ShowMsg_("DEMO_017_MSG_030");
	KeyInputWait_();
	CloseMsgWnd_();
	CloseConnective();
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■デモ終了
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	
	EndDemo(FADE_COLOR_BLACK);
}