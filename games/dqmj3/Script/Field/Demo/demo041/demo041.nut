//=============================================
//
//		demo041[�퓬�`���[�g���A������_1]
//
//=============================================

function Update()
{

// ���ϐ���`
	local task_cam, task_nochoman;

// �����\�[�X�Ǎ�
	// �L�����N�^�[
	local player = GetPlayerId_();
	local model_nochoman = ReadNpc_("n043");		// �m�`������
	local model_slime = ReadNpc_("m000_00");		// �X���C��
	
// ���z�u
	SetPointPos_(player, "player000");
	SetDir_(player, -90);
	
	local nochoman = ArrangePointNpc_(model_nochoman, "npc_nochoman000");
	SetDir_(nochoman,180);
	
	local slime000 = ArrangePointNpc_(model_slime, "npc_slime000");
	SetDir_(slime000,90);
	SetScaleSilhouette(slime000, SCALE.S, SILHOUETTE_WIDTH.S);
	SetStepSe_(slime000, SILENT_STEP_SE);
	local slime100 = ArrangePointNpc_(model_slime, "npc_slime100");
	SetDir_(slime100,-50);	
	SetScaleSilhouette(slime100, SCALE.S, SILHOUETTE_WIDTH.S);
	SetStepSe_(slime100, SILENT_STEP_SE);
// ����풓���[�V�����Ǎ�
	local Player_look_left_L = ReadMotion_(player, "Player_look_left_L");	// ��l�����������������
	local n000_talk_joy_L = ReadMotion_(nochoman, "n000_talk_joy_L");		// �m�`���[�����
	
// �������̃��[�V����
	SetMotion_(player, MOT_WAIT, BLEND_N);
	SetMotion_(slime000, MOT_WAIT, BLEND_N);
	SetMotion_(slime100, MOT_WALK, BLEND_N);
	
// ���J�����ݒ�
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");

//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------
	
	StartDemo(FADE_COLOR_BLACK);
	
//	Wait_(55);
	Wait_(20);

	SetMotion_(player, MOT_WAIT, BLEND_L);
	
	Wait_(20);

	task_nochoman = Task_RotateToPos_(nochoman, GetPos_(player), 11.7);

	SetMotion_(player, Player_look_left_L, BLEND_L);
	
	SetMotion_(nochoman, MOT_TALKLOOP, BLEND_L);
	
	//�u�������Ɂ@�Ȃ�C���@���������邿��H
	//�@����𑊎�Ɂ@�`�J�����@�����Ăق�������B
	OpenMsgWnd_();
	ShowMsg_("DEMO_041_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	
	//��������������������������������������
	//���J�b�g2
	//��������������������������������������
	DeleteTask_(task_cam);
	
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");
	
	SetMotion_(nochoman, n000_talk_joy_L, BLEND_L);

	//�u�^�́@�����X�^�[�}�X�^�[�Ȃ�@
	//�@�p�p���Ɓ@���������͂�������B
	OpenMsgWnd_();
	ShowMsg_("DEMO_041_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	
	//��������������������������������������
	//���J�b�g3
	//��������������������������������������
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");
	
	OpenMsgWnd_();
	//�u�܂��@�E���E�����Ă閂���Ɂ@�Ԃ��������I
	//�@��������@�킢�ɂȂ邩��@������邿��I
	ShowMsg_("DEMO_041_MSG_030");
	KeyInputWait_();
	
	//�u���O�Ȃ�@���Ԃɂ��������Ɓ@�ꏏ��
	//�@������Ɓ@�킦��͂���������I
	ShowMsg_("DEMO_041_MSG_040");
	KeyInputWait_();
	CloseMsgWnd_();
	
	//��������������������������������������
	//���f���I��
	//��������������������������������������
	
	EndDemo(FADE_COLOR_BLACK);
}