//=============================================
//
//		demo024[C�����N����_2(���O)]
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
	local efc_player;
	//local flg_rematch = GetEventFlg_("BFG_REMATCH_RANK_C");		// Bit_1024 C�����N�Đ�t���O

// �����\�[�X�Ǎ�
	// �L�����N�^�[
	local player = GetPlayerId_();					// ��l��
	local model_slime = ReadNpc_("m000_00");		// �X���C��
	local model_alumi = ReadNpc_("m036_00");		// �A���~���[�W
	local model_onion = ReadNpc_("m065_00");		// �I�j�I�[��
	//�G�t�F�N�g
	LoadEffect_("ef742_01_div_mag_hoimi");			// ��

// ���z�u
	// ��l��
	SetPointPos_(player, "player000");
	// �G�p�[�e�B
	local enemy00 = ArrangePointNpc_(model_slime, "npc_three000");
	local enemy01 = ArrangePointNpc_(model_alumi, "npc_three100");
	local enemy02 = ArrangePointNpc_(model_onion, "npc_three200");
	SetScaleSilhouette(enemy00, SCALE.S, SILHOUETTE_WIDTH.S);
	SetScaleSilhouette(enemy01, SCALE.S, SILHOUETTE_WIDTH.S);
	SetScaleSilhouette(enemy02, SCALE.N, SILHOUETTE_WIDTH.N);

// ����풓���[�V�����Ǎ�
	local player_battle_L = ReadMotion_(player, "Player_battle_L");		// �퓬�ҋ@L

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
	ShowMsg_("DEMO_024_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	PlaySE_("SE_SHA_003");		//��SE
	efc_player = SetSelectBoneEffect_("ef742_01_div_mag_hoimi", player, ATTACH_GLOBAL);		// �񕜃G�t�F�N�g
	
	//===============================================
	// ���V�X�e�����b�Z�[�W
	// �u�g�o�Ɓ@�l�o���@�S�񕜂����I
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_024_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	// ����
	//if (!flg_rematch) {
		//===============================================
		// ���e���W�A
		// �u�ł́@������@�b�����N��
		//-----------------------------------------------
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_TEREZIA");
		ShowMsg_("DEMO_024_MSG_030");
		KeyInputWait_();
		CloseMsgWnd_();
		//===============================================
	//}
	
	// �Đ펞
	/*else {
		//===============================================
		// ���e���W�A
		// �u�Ē�����@���҂����Ă���܂����B
		//-----------------------------------------------
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_TEREZIA");
		ShowMsg_("DEMO_024_MSG_004");
		KeyInputWait_();
		CloseMsgWnd_();
		//===============================================
	}*/
	
	SetMotion_(player, player_battle_L, BLEND_XL);		// �퓬�ҋ@LOOP
	Wait_(30);
	
	// ���J�b�g�Q���`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");
	
	WaitTask(task_cam);
	DeleteTask_(task_cam);
	
	EncountEndDemo(ENCOUNT_NORMAL);
}