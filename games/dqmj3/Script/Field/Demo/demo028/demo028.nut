//=============================================
//
//		demo028[C�����N����_5(2��폟��)]
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
	local model_hoippu = ReadNpc_("m100_00");		// �z�C�b�v�S�[�X�g
	local model_abare = ReadNpc_("m051_00");		// ���΂ꂤ���ǂ�

// ���z�u
	// ��l��
	SetPointPos_(player, "player000");
	// �G�p�[�e�B
	local enemy00 = ArrangePointNpc_(model_hoippu, "npc_four000");
	local enemy01 = ArrangePointNpc_(model_abare, "npc_four100");
	local enemy02 = ArrangePointNpc_(model_abare, "npc_four200");
	local enemy03 = ArrangePointNpc_(model_hoippu, "npc_four300");
	SetScaleSilhouette(enemy00, SCALE.S, SILHOUETTE_WIDTH.S);
	SetScaleSilhouette(enemy01, SCALE.N, SILHOUETTE_WIDTH.N);
	SetScaleSilhouette(enemy02, SCALE.N, SILHOUETTE_WIDTH.N);
	SetScaleSilhouette(enemy03, SCALE.S, SILHOUETTE_WIDTH.S);

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
	// �u�Q��ڂ̏����@���߂łƂ��������܂��B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_TEREZIA");
	ShowMsg_("DEMO_028_MSG_010");
	KeyInputWait_();
	
	//-----------------------------------------------
	// ��
	// �u���f����邱�ƂȂ�
	//-----------------------------------------------
	ShowMsg_("DEMO_028_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	// ���J�b�g�Q���`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");
	
	WaitTask(task_cam);
	DeleteTask_(task_cam);
	
	EncountEndDemo(ENCOUNT_NORMAL);
}