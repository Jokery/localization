//=============================================
//
//		demo026[C�����N����_4(1��폟��)]
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
	local task_cam;

// �����\�[�X�Ǎ�
	// �L�����N�^�[
	local player = GetPlayerId_();					// ��l��
	local model_bighat = ReadNpc_("m048_00");		// �r�b�O�n�b�g
	local model_acorn = ReadNpc_("m067_00");		// �ǂ񂮂�x�r�[
	local model_smile = ReadNpc_("m019_00");		// �X�}�C�����U�[�h

// ���z�u
	// ��l��
	SetPointPos_(player, "player000");
	// �G�p�[�e�B
	local enemy00 = ArrangePointNpc_(model_bighat, "npc_three000");
	local enemy01 = ArrangePointNpc_(model_acorn, "npc_three100");
	local enemy02 = ArrangePointNpc_(model_smile, "npc_three200");
	SetScaleSilhouette(enemy00, SCALE.S, SILHOUETTE_WIDTH.S);
	SetScaleSilhouette(enemy01, SCALE.S, SILHOUETTE_WIDTH.S);
	SetScaleSilhouette(enemy02, SCALE.S, SILHOUETTE_WIDTH.S);

// ����풓���[�V�����Ǎ�
	local player_battle_L = ReadMotion_(player, "Player_battle_L");

// �����[�V�����ݒ�
	SetMotion_(player, player_battle_L, BLEND_N);

// ���J�����ݒ�
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");

//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------

	// ���J�b�g�P���`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`
	StartDemo(FADE_COLOR_BLACK);
	
	//===============================================
	//���e���W�A
	// �u���݂��Ƃł��@<name_player/>���܁B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_TEREZIA");
	ShowMsg_("DEMO_026_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	// ���J�b�g�Q���`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");
	
	WaitTask(task_cam);
	DeleteTask_(task_cam);
	
	EncountEndDemo(ENCOUNT_NORMAL);
}