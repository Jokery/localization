//=============================================
//
//		[�`�����N����_2(���O)]
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

// �����\�[�X�Ǎ�
	// �L�����N�^�[
	local player = GetPlayerId_();						// ��l��
	local model_lejendhoon = ReadNpc_("m043_01");		// ���W�F���h�z�[��
	local model_seto = ReadNpc_("m017_03");				// �܂����t�@�C�^�[
	local model_behomasuraimu = ReadNpc_("m005_02");	// �x�z�}�X���C��
	local model_zigokunoyoroi = ReadNpc_("m111_01");	// �������̂�낢
	// �G�t�F�N�g
	LoadEffect_("ef742_01_div_mag_hoimi");				// ��

// ���z�u
	// ��l��
	SetPointPos_(player, "player000");
	// �G�p�[�e�B
	local lejendhoon = ArrangePointNpc_(model_lejendhoon, "npc_lejendhoon000");
	local seto = ArrangePointNpc_(model_seto, "npc_zigokunoyoroi000");				//�ʒu���Ԉ���Ă��邽�߁A��������낢�Ɠ���ւ�
	local behomasuraimu = ArrangePointNpc_(model_behomasuraimu, "npc_behomasuraimu000");
	local zigokunoyoroi = ArrangePointNpc_(model_zigokunoyoroi, "npc_seto000");		//�ʒu���Ԉ���Ă��邽�߁A�܂����t�@�C�^�[�Ɠ���ւ�
	SetScaleSilhouette(lejendhoon, SCALE.N, SILHOUETTE_WIDTH.N);
	SetScaleSilhouette(seto, SCALE.N, SILHOUETTE_WIDTH.N);
	SetScaleSilhouette(behomasuraimu, SCALE.S, SILHOUETTE_WIDTH.S);
	SetScaleSilhouette(zigokunoyoroi, SCALE.N, SILHOUETTE_WIDTH.N);

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
	ShowMsg_("DEMO_508_MSG_010");
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
	ShowMsg_("DEMO_508_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	//===============================================
	// ���e���W�A
	// �u�ł́@������@�`�����N��
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_TEREZIA");
	ShowMsg_("DEMO_508_MSG_030");
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