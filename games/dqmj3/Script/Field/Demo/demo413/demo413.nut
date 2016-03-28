//=============================================
//
//		demo413[爆破作戦の説明_1]
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
	local task_cam, task_player, task_rukiya;
	local efc_player, efc_anger, efc_rukiya;

// ▼リソース読込
	// キャラクター
	local player = GetPlayerId_();			// 主人公
	local n_rukiya = ReadNpc_("n009");		// ルキヤ

// ▼配置
	// 主人公
	SetPointPos_(player, "player000");
	
	// ルキヤ
	local rukiya = ArrangePointNpc_(n_rukiya, "npc_rukiya000");

// ▼非常駐モーション読込
	local rukiya_n009_incense = ReadMotion_(rukiya, "n009_incense");
	local rukiya_n009_incense_L = ReadMotion_(rukiya, "n009_incense_L");

// ▼エフェクト読み込み
	local efc_rukiya;
	local pos = Vec3(0, 1, 1);
	LoadEffect_("ef712_10_emo_surprise01");	// ！
	LoadEffect_("ef712_07_emo_anger01");	// 怒り

// ▼カメラ設定
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");
	
	task_rukiya = Task_AnimeMove_(rukiya, "anm_rukiya000");

//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------
	
	StartDemo(FADE_COLOR_BLACK);
	Wait_(30);
	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");
	
	WaitTask(task_rukiya);
	//===============================================
	// ■ルキヤ
	// 「無事に　ここまで　来れたみたいだね。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RUKIYA");
	ShowMsg_("DEMO_413_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	SetMotion_(rukiya, rukiya_n009_incense_L, BLEND_L);
	efc_anger = SetSelectBoneEffect_("ef712_07_emo_anger01", rukiya, ATTACH_EFFECT1);		// 怒り
	SetEffectScale_(efc_anger, 1.0);
	Wait_(15);
	
	//===============================================
	// ■ルキヤ
	// 「イッタブルの奴め……何がマザーのためだい。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RUKIYA");
	ShowMsg_("DEMO_413_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	DeleteEffectEmitter_(efc_anger);
	
	SetPointCameraEye_("cameye002");
	SetPointCameraTarget_("camtgt002");

	Wait_(5);
	SetMotion_(rukiya, MOT_WAIT, BLEND_L);
	Wait_(5);
	efc_rukiya = SurpriseDispSetOffset(rukiya, pos, 0.45);

	Wait_(30);
	SetMotion_(rukiya, MOT_TALK, BLEND_XL);
	Wait_(15);
	SetMotion_(rukiya, MOT_TALKLOOP, BLEND_M);
	//===============================================
	// ■ルキヤ
	// 「マザーのことも　忘れてるのかい？
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RUKIYA");
	ShowMsg_("DEMO_413_MSG_030");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	EndDemo(FADE_COLOR_BLACK);
}
