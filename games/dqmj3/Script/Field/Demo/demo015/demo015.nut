//=============================================
//
//		demo015[隠れているノチョーラ]
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
	local efc_player;
	local task_cam, task_nochoman;
	
// ▼モデル読込
	// キャラクター
	local player = GetPlayerId_();					// 主人公
	local model_nochoman = ReadNpc_("n043");		// ノチョリン
	// エフェクト
	LoadEffect_("ef712_10_emo_surprise01");			// 「！」
	LoadEffect_("ef732_09_light_reactor_c");		// リアクター発光
	
	// 隠れているノチョーラ
	local model_box = ReadGimmick_("o_H01_04");		// ジャック、エース（木箱）
	local model_barrel = ReadGimmick_("o_H01_03");	// 宿屋ノチョーラ、クイーン（樽）

// ▼配置
	// 主人公
	SetPointPos_(player, "player000");
	SetDir_(player, -90);
	
	// ノチョーラ
	local nochoman = ArrangePointNpc_(model_nochoman, "npc_nochoman000");
	SetDir_(nochoman, -90);
	SetMotion_(nochoman, MOT_WAIT, BLEND_N);
	
	// 隠れているノチョーラ
	local jack = ArrangePointGimmick_("o_H01_04", model_box, "obj_jack000");		// 木箱に隠れているジャック
	local queen = ArrangePointGimmick_("o_H01_03", model_barrel, "obj_queen000");	// 袋に隠れているクイーン
	local ace = ArrangePointGimmick_("o_H01_04", model_box, "obj_ace000");			// 木箱に隠れているエース
	local inn = ArrangePointGimmick_("o_H01_03", model_barrel, "obj_inn000");		// 樽に隠れている宿屋ノチョーラ

// ▼非常駐モーション読込
	// 主人公
	local player_look_around_L = ReadMotion_(player, "Player_look_around_L");		// 主人公キョロキョロ
	local player_look_left_L = ReadMotion_(player, "Player_look_left_L");			// 主人公顔を少し左向ける
	local player_touch_reactor = ReadMotion_(player, "Player_touch_reactor");		// 主人公顔を少し左向ける→リアクターを触る
	local player_touch_reactor_L = ReadMotion_(player, "Player_touch_reactor_L");	// 主人公リアクターを触るL
	
	// ノチョーラ
	local nochoman_think02_L = ReadMotion_(nochoman, "n000_think02_L");				// ノチョーラ考える（腕組み）
	local nochoman_stand_right_L = ReadMotion_(nochoman, "n000_stand_right_L");		// ノチョーラ腕組みL
	local nochoman_look_up = ReadMotion_(nochoman, "n002_look_up");					// 上向き待機
	local nochoman_look_up_L = ReadMotion_(nochoman, "n002_look_up_L");				// 上向き待機L
	local nochoman_think = ReadMotion_(nochoman, "n000_think");						// 通常会話→考える（右向き）
	local nochoman_think_L = ReadMotion_(nochoman, "n000_think_L");					// 考える（右向き）LOOOP
	local nochoman_talk_joy_L = ReadMotion_(nochoman, "n002_talk_joy_L");						// 会話　嬉しそう

// ▼カメラ設定
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");

//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);
	
	// ノチョーラ右を向く
	SetMotion_(nochoman, nochoman_stand_right_L, BLEND_L);
	Wait_(10);
		
	// 主人公
	SetMotion_(player, player_look_left_L, BLEND_XL);
	
	//===============================================
	// *ノチョーラ
	// 「ただいまっちょー！
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_015_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	
	// ノチョーラ
	SetMotion_(nochoman, MOT_WAIT, BLEND_L);
	Wait_(10);
	
	// 主人公
	SetMotion_(player, MOT_WAIT, BLEND_L);
	Wait_(20);
	
	// ▼カット１～～～～～～～～～～～～～～～～～～～～～～～～
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");

	//-----------------------------------------------
	// ▽
	// 「ほら　み～んな　ボーショックに捕まって
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_015_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	WaitTask(task_cam);
	DeleteTask_(task_cam);
	
	// ▼カット２～～～～～～～～～～～～～～～～～～～～～～～～
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");
	
	// 主人公　キョロキョロ
	SetMotion_(player, player_look_around_L, BLEND_XL);
	// ノチョーラ　考える
	SetMotion_(nochoman, nochoman_think02_L, BLEND_L);
	
	//===============================================
	// *ノチョーラ
	// 「でも　運よく捕まらなかった　仲間が
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_015_MSG_030");
	KeyInputWait_();
	
	SetMotion_(nochoman, nochoman_think, BLEND_L);
	task_nochoman = Task_ChangeMotion_(nochoman, nochoman_think_L, BLEND_M);
	
	SetMotion_(player, player_look_left_L, BLEND_XL);		// 左向ける
	
	//-----------------------------------------------
	// ▽
	// 「その中にはオイラの親友　ジャックもいたんで
	//-----------------------------------------------
	ShowMsg_("DEMO_015_MSG_040");
	KeyInputWait_();
	
	//-----------------------------------------------
	// ▽
	// 「ジャックの奴　ボーショックを恐れて
	//-----------------------------------------------
	ShowMsg_("DEMO_015_MSG_050");
	KeyInputWait_();
	CloseMsgWnd_();

	Wait_(20);
	// ノチョーラ　「！」
	SurpriseDisp(nochoman);
	DeleteTask_(task_nochoman);

	task_nochoman = Task_WalkAroundToPos(nochoman, GetPos_(player), ROTATE_DEMO_DEF);
	WaitTask(task_nochoman);
	DeleteTask_(task_nochoman);
	
	SetMotion_(nochoman, nochoman_talk_joy_L, BLEND_M);		// 会話嬉しそう
	task_nochoman = Task_ChangeMotion_(nochoman, nochoman_look_up_L, BLEND_M);	
	
	//-----------------------------------------------
	// ▽
	// 「あっ！　お前の頭のそれ　リアクターだっちょ！
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_015_MSG_060");
	KeyInputWait_();
	CloseMsgWnd_();
//	SetMotion_(nochoman, nochoman_look_up, BLEND_L);		// 上向き待機

	Wait_(20);
	
	SetDir_(player, -60);
	SetAlpha_(nochoman, ALPHA_CLEAR);
	
	// ▼カット３～～～～～～～～～～～～～～～～～～～～～～～～
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");
	
	//-----------------------------------------------
	// ▽
	// 「リアクターには　サーチ機能があるっちょ。
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_015_MSG_070");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	Wait_(5);
	
	SetMotion_(player, player_touch_reactor, BLEND_L);		// リアクターに触る
	SetFace_(player, "Face_left");
	WaitMotion(player);
	SetMotion_(player, player_touch_reactor_L, BLEND_L);	// リアクターに触る
	
	// リアクター起動
	PlaySE_("SE_FLD_135");		// リアクター反応音
	efc_player = SetSelectBoneEffect_("ef732_09_light_reactor_c", player, ATTACH_EFFECT1);	// リアクター発光
	SetEffectScale_(efc_player, 0.5);
	
	Wait_(10);
	
	//===============================================
	// ■リアクター
	// 「本機の　サーチ機能を　起動します。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_REACTOR");
	ShowMsg_("DEMO_015_MSG_080");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	//SetMotion_(player, player_look_left_L, BLEND_XL);
	Wait_(20);
	
	EndDemo(FADE_COLOR_BLACK);
}
