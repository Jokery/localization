//=============================================
//
//		demo305[B�����N����_2(���O)]
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
	local regen;

// �����f���Ǎ�
	// �L�����N�^�[
	local player = GetPlayerId_();						// ��l��
	local model_yamisbari = ReadNpc_("m129_00");		// ��݂��΂�
	local model_kusattasitai = ReadNpc_("m102_00");		// ������������
	local model_skeleton = ReadNpc_("m101_00");			// ��������
	local model_ghosti = ReadNpc_("m103_00");			// �S�[�X�g
	// �G�t�F�N�g
	LoadEffect_("ef742_01_div_mag_hoimi");				// ��

// ���z�u
	// ��l��
	SetPointPos_(player, "player000");
	SetDir_(player, 270);
	// �G�p�[�e�B
	local yamisbari = ArrangePointNpc_(model_yamisbari, "npc_yamisibari000");
	local kusattasitai = ArrangePointNpc_(model_kusattasitai, "npc_kusattashitai000");
	local skeleton = ArrangePointNpc_(model_skeleton, "npc_skeleton000");
	local ghosti = ArrangePointNpc_(model_ghosti, "npc__ghost000");
	SetScaleSilhouette(yamisbari, SCALE.S, SILHOUETTE_WIDTH.S);
	SetScaleSilhouette(kusattasitai, SCALE.N, SILHOUETTE_WIDTH.S);
	SetScaleSilhouette(skeleton, SCALE.N, SILHOUETTE_WIDTH.S);
	SetScaleSilhouette(ghosti, SCALE.S, SILHOUETTE_WIDTH.S);
	SetDir_(yamisbari, 110);
	SetDir_(kusattasitai, 430);
	SetDir_(skeleton, 445);
	SetDir_(ghosti, 95);

// ����풓���[�V�����Ǎ�
	local battlewait = ReadMotion_(player, "Player_battle_L");		// �퓬�ҋ@L

// ���J�����ݒ�
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");

//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------

	// ���J�b�g�P���`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`
	StartDemo(FADE_COLOR_BLACK);
	
	//===============================================
	// ���e���W�A
	// �u�����̑O�Ɂ@���ԃ����X�^�[��
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_TEREZIA");
	ShowMsg_("DEMO_305_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	PlaySE_("SE_SHA_003");		//��SE
	regen = SetSelectBoneEffect_("ef742_01_div_mag_hoimi", player, ATTACH_GLOBAL);		// �񕜃G�t�F�N�g
	
	//===============================================
	// ���V�X�e�����b�Z�[�W
	// �g�o�Ɓ@�l�o���@�S�񕜂����I
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_305_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	//===============================================
	// ���e���W�A
	// �u�ł́@������@�a�����N��
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_TEREZIA");
	ShowMsg_("DEMO_305_MSG_030");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetMotion_(player, battlewait, 15);
	Wait_(30);
	
	// ���J�b�g�Q���`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");
	WaitTask(task_cam);
	
	EncountEndDemo(ENCOUNT_NORMAL);
}