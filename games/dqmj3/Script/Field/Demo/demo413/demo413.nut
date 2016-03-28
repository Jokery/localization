//=============================================
//
//		demo413[���j���̐���_1]
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
	local task_cam, task_player, task_rukiya;
	local efc_player, efc_anger, efc_rukiya;

// �����\�[�X�Ǎ�
	// �L�����N�^�[
	local player = GetPlayerId_();			// ��l��
	local n_rukiya = ReadNpc_("n009");		// ���L��

// ���z�u
	// ��l��
	SetPointPos_(player, "player000");
	
	// ���L��
	local rukiya = ArrangePointNpc_(n_rukiya, "npc_rukiya000");

// ����풓���[�V�����Ǎ�
	local rukiya_n009_incense = ReadMotion_(rukiya, "n009_incense");
	local rukiya_n009_incense_L = ReadMotion_(rukiya, "n009_incense_L");

// ���G�t�F�N�g�ǂݍ���
	local efc_rukiya;
	local pos = Vec3(0, 1, 1);
	LoadEffect_("ef712_10_emo_surprise01");	// �I
	LoadEffect_("ef712_07_emo_anger01");	// �{��

// ���J�����ݒ�
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");
	
	task_rukiya = Task_AnimeMove_(rukiya, "anm_rukiya000");

//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------
	
	StartDemo(FADE_COLOR_BLACK);
	Wait_(30);
	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");
	
	WaitTask(task_rukiya);
	//===============================================
	// �����L��
	// �u�����Ɂ@�����܂Ł@���ꂽ�݂������ˁB
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RUKIYA");
	ShowMsg_("DEMO_413_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	SetMotion_(rukiya, rukiya_n009_incense_L, BLEND_L);
	efc_anger = SetSelectBoneEffect_("ef712_07_emo_anger01", rukiya, ATTACH_EFFECT1);		// �{��
	SetEffectScale_(efc_anger, 1.0);
	Wait_(15);
	
	//===============================================
	// �����L��
	// �u�C�b�^�u���̓z�߁c�c�����}�U�[�̂��߂����B
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
	// �����L��
	// �u�}�U�[�̂��Ƃ��@�Y��Ă�̂����H
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RUKIYA");
	ShowMsg_("DEMO_413_MSG_030");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	EndDemo(FADE_COLOR_BLACK);
}
