//=============================================
//
//		demo619[�Ō�̃p���[_2(���O)]
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
	local player = GetPlayerId_();								// ��l��
	local model_seto = ReadNpc_("m017_03");						// �Z�g
	local model_jenelal = ReadNpc_("m017_04");					// ���������R
	local model_sumaillhtred = ReadNpc_("m019_00");				// �X�}�C�����U�[�h
	local model_mizutamadoragon = ReadNpc_("m019_01");			// �݂����܃h���S��
	// �G�t�F�N�g
	LoadEffect_("ef742_01_div_mag_hoimi");						// ��

// ���z�u
	// ��l��
	SetPointPos_(player, "player000");
	
	// �G�p�[�e�B
	local seto = ArrangePointNpc_(model_seto, "npc_seto000");
	local jenelal = ArrangePointNpc_(model_jenelal, "npc_jenelal000");
	local sumaillhtred = ArrangePointNpc_(model_sumaillhtred, "npc_sumaillhtred000");
	local mizutamadoragon = ArrangePointNpc_(model_mizutamadoragon, "npc_mizutamadoragon000");
	SetScaleSilhouette(seto, SCALE.N, SILHOUETTE_WIDTH.N);
	SetScaleSilhouette(jenelal, SCALE.N, SILHOUETTE_WIDTH.N);
	SetScaleSilhouette(sumaillhtred, SCALE.S, SILHOUETTE_WIDTH.S);
	SetScaleSilhouette(mizutamadoragon, SCALE.S, SILHOUETTE_WIDTH.S);

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
	ShowMsg_("DEMO_619_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	PlaySE_("SE_SHA_003");		// ��SE
	regen = SetSelectBoneEffect_("ef742_01_div_mag_hoimi", player, ATTACH_GLOBAL);		// �񕜃G�t�F�N�g
	
	//===============================================
	// *�V�X�e�����b�Z�[�W
	// �g�o�Ɓ@�l�o���@�S�񕜂����I
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_619_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	//===============================================
	// ���e���W�A
	// �u�ł́@������@�r�����N��
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_TEREZIA");
	ShowMsg_("DEMO_619_MSG_030");
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