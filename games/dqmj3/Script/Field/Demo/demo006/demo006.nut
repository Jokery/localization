//=============================================
//
//		demo006[�I�[�v�j���O�f��_9(��l���o��)]
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
	local task_cam, task_sancho;

// �����\�[�X�Ǎ�
	// �L�����N�^�[
	local player = GetPlayerId_();					// ��l��
	local model_sancho = ReadNpc_("n011");			// �T���`��

// ���z�u
	// ��l��
	SetPointPos_(player, "player000");
	// �T���`��
	local sancho = ArrangePointNpc_(model_sancho, "npc_sancho000");
	SetScaleSilhouette(sancho, SCALE.SANCHO, SILHOUETTE_WIDTH.SANCHO);
	SetStepSe_(sancho, SILENT_STEP_SE);									// ������ �����ɂ���
	
// ����풓���[�V�����Ǎ�
	// ��l��
	local pl_sleep_L = ReadMotion_(player, "Player_sleep_L");			// �Q�����L
	local pl_up02 = ReadMotion_(player, "Player_up02");					// �Q����ԁ��N���オ��
	local pl_up02_L = ReadMotion_(player, "Player_up02_L");				// �N���オ��L
	
	// �T���`��
	local sancho_bow = ReadMotion_(sancho, "n011_bow");					// ������

// �����[�V�����ݒ�
	SetMotion_(player, pl_sleep_L, BLEND_N);
	SetFace_(player, "Face_loop_close");

// ���J�����ݒ�
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");		// 120F

//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);
	
	// ���J�b�g�P���y���i�����j�O�χ@�`�`�`�`�`�`�`�`�`�`�`�`�`
	WaitTask(task_cam);
	DeleteTask_(task_cam);
	
	// ���J�b�g�Q���y���i�����j�O�χA�`�`�`�`�`�`�`�`�`�`�`�`�`
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");		// 120F
	WaitTask(task_cam);
	DeleteTask_(task_cam);
	
	// ���J�b�g�R����l���Q����с`�`�`�`�`�`�`�`�`�`�`�`�`�`�`
	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");		// 150F
	WaitTask(task_cam);
	DeleteTask_(task_cam);
	
	task_sancho = Task_AnimeMove_(sancho, "anm_sancho000");			// 45F
	SetMotion_(sancho, MOT_WALK, BLEND_N);
	
	// ���J�b�g�S���T���`���A��l���ɋߕt���`�`�`�`�`�`�`�`�`�`
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");
	PlaySE_("SE_FLD_040");											//��SE:�T���`�������i���V�����X�^�[�̑����j
	Wait_(20);
	PlaySE_("SE_FLD_040");											//��SE:�T���`�������i���V�����X�^�[�̑����j

	WaitTask(task_sancho);
	SetPointPos_(sancho, "npc_sancho001");
	
	SetDir_(sancho, 180);
	
	// ���J�b�g�T���T���`���A�b�v�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`
	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");
	
	SetMotion_(sancho, sancho_bow, BLEND_N);		// ������
	WaitMotion(sancho);
	SetMotion_(sancho, MOT_TALK, BLEND_M);
	Wait_(28);
	SetMotion_(sancho, MOT_TALKLOOP, BLEND_M);
	
	//===============================================
	// *�T���`��
	// �u�s�s�b�I�@���͂悤�������}�X�I
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_006_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetPointPos_(sancho, "npc_sancho002");
	SetMotion_(sancho, MOT_WAIT, BLEND_N);
	
	SetFace_(player, "Face_default");
	
	// ���J�b�g�U����l���N���オ��`�`�`�`�`�`�`�`�`�`�`�`�`�`
	SetPointCameraEye_("cameye002");
	SetPointCameraTarget_("camtgt002");
	
	SetMotion_(player, pl_up02, BLEND_M);		// �Q����ԁ��N���オ��
	Wait_(11);
	SetMotion_(sancho, MOT_TALK, BLEND_XL);
	Wait_(10);
	SetMotion_(player, pl_up02_L, BLEND_M);		// �N���オ��L
	Wait_(18);
	SetMotion_(sancho, MOT_TALKLOOP, BLEND_M);
	
	//===============================================
	// ���T���`��
	// �u���H�̎x�x���@�ł��Ă���}�X�B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_SANCHO");
	ShowMsg_("DEMO_006_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetMotion_(sancho, sancho_bow, BLEND_XL);		// ������
	WaitMotion(sancho);
	SetMotion_(sancho, MOT_WAIT, BLEND_M);
	
	task_sancho = Task_RotateToDir_(sancho, -5, 5.7);
	WaitTask(task_sancho);
	task_sancho = Task_MoveForward_(sancho, 1.0, false);
	PlaySE_("SE_FLD_040");											//��SE:�T���`�������i���V�����X�^�[�̑����j
	Wait_(20);
	PlaySE_("SE_FLD_040");											//��SE:�T���`�������i���V�����X�^�[�̑����j
	Wait_(15);
	
	EndDemo(FADE_COLOR_BLACK);
}
