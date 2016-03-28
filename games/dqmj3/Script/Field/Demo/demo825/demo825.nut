//=============================================
//
//		demo825 [�R�A�̌���]
//
//=============================================

//-------------------------------------------------------------------------
//
//		�ǂݍ��݁E�z�u
//
//-------------------------------------------------------------------------
function Update()
{

// ���ϐ���`
	local task_cam, task_player, task_aroma;
	local task_aroma_step;
	local efc_player;

// �����\�[�X�Ǎ�
	// �L�����N�^�[
	local player = GetPlayerId_();					// ��l��
	local n_aroma = ReadNpc_("n018");				// �A���}

// ���z�u
	// ��l��
	SetPointPosNoFit_(player, "player000");

	//�A���}
	local aroma = ArrangePointNpc_(n_aroma, "aroma000");
	SetPointPosNoFit_(aroma, "aroma000");
	SetStepSe_(aroma, SILENT_STEP_SE);

// ����풓���[�V�����Ǎ�
	local a_n018_look_up_L = ReadMotion_(aroma, "n018_look_up_L");
	local p_Player_look_up_L = ReadMotion_(player, "Player_look_up_L");
	local a_n018_touch_reactor_L = ReadMotion_(aroma, "n018_touch_reactor_L");
	local p_Player_look_left_L = ReadMotion_(player, "Player_look_left_L");
	local Player_nod = ReadMotion_(player, "Player_nod");// �ҋ@�����ȂÂ����ҋ@

// ���G�t�F�N�g�ǂݍ���
	LoadEffect_("ef732_09_light_reactor_c");		// ���A�N�^�[����
	LoadEffect_("ef882_03_barrier_ren");
	local effectId = SetPointWorldEffect_("ef882_03_barrier_ren", "barrier");


// ���J�����ݒ�
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");

	SetMotion_(player, p_Player_look_up_L, BLEND_M);
	SetMotion_(aroma, a_n018_look_up_L, BLEND_M);

//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------
//cut01
	StartDemo(FADE_COLOR_BLACK);
	WaitTask(task_cam);
	Wait_(20);

	//===============================================
	//���A���}
	// 	�u�Ȃ�قǁc�c�o���A�t�B�[���h���B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_AROMA");
	ShowMsg_("DEMO_825_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	Wait_(5);


//cut02

	SetPointPos_(aroma, "aroma001");
	SetPointPos_(player, "player001");
	
	
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");

	SetMotion_(aroma, MOT_WALK, BLEND_XL);
	task_aroma = Task_AnimeMoveNoDir_(aroma, "anm_aroma000");
	task_aroma_step = Task_PlaySe_("SE_FLD_016", 15);
	SetMotion_(player, p_Player_look_left_L, BLEND_XL);
	WaitTask(task_aroma);
	SetMotion_(aroma, a_n018_look_up_L, 12);
	DeleteTask_(task_aroma);
	Wait_(12);
	DeleteTask_(task_aroma_step);

	//===============================================
	//���A���}
	// 	�u�ӂӂ�c�c���i�[�e���@�Â���ˁB
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_AROMA");
	ShowMsg_("DEMO_825_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	Wait_(10);
	SetMotion_(aroma, a_n018_touch_reactor_L, 20);
	Wait_(22);	
	PlaySE_("SE_FLD_135");		// ���A�N�^�[������
	efc_player = SetSelectBoneEffect_("ef732_09_light_reactor_c", aroma, ATTACH_EFFECT1);	// ���A�N�^�[����
	Wait_(45);


//cut03

	SetPointPos_(aroma, "aroma002");
	SetPointPos_(player, "player000");
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");

	Wait_(15);
	SetMotion_(player, MOT_WAIT, 20);
	Wait_(30);
	PlaySE_("SE_DEM_203");
	SetFade_(FADE_OUT, FADE_COLOR_WHITE, 10);
	DeleteEffectEmitter_(effectId);
	Wait_(40);
	SetFade_(FADE_IN, FADE_COLOR_WHITE, 30);
	Wait_(70);
	SetMotion_(aroma, MOT_WAIT, 20);
	Wait_(40);


//cut04
	SetPointCameraEye_("cameye003");
	SetPointCameraTarget_("camtgt003");

	task_player = Task_WalkAroundToPos(player, GetPos_(aroma), 5.7);
	task_aroma = Task_WalkAroundToPos(aroma, GetPos_(player), 5.7);
	task_aroma_step = Task_PlaySe_("SE_FLD_016", 15);
	WaitTask(task_player);
	WaitTask(task_aroma);
	SetMotion_(player, MOT_WAIT, 10);
	SetMotion_(aroma, MOT_WAIT, 18);
	Wait_(20);
	DeleteTask_(task_aroma_step);
	SetMotion_(aroma, MOT_TALK, BLEND_XL);
	WaitMotion(aroma);
	SetMotion_(aroma, MOT_TALKLOOP, BLEND_XL);

	//===============================================
	//���A���}
	// 	�u����ł悵�c�c�����@���i�[�e�̂���
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_AROMA");
	ShowMsg_("DEMO_825_MSG_030");
	KeyInputWait_();
	//===============================================

	//===============================================
	//���A���}
	// 	�u���́@�܂��u���C�N�����X�^�[���@����������
	//-----------------------------------------------
	ShowMsg_("DEMO_825_MSG_040");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	SetMotion_(aroma, MOT_WAIT, BLEND_XL);
	Wait_(5);
	SetMotion_(player, Player_nod, BLEND_L);// ��l���@�ҋ@�����ȂÂ����ҋ@
	WaitMotion(player);
	SetMotion_(player, MOT_WAIT, BLEND_L);// ��l���@�ҋ@
	Wait_(5);

	EndDemo(FADE_COLOR_BLACK);

}
