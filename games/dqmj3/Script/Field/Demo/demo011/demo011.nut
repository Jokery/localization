//=============================================
//
//		demo011[�퓬�`���[�g���A������_2(�s�k)]
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
	local efc_player, efc_nochoman;

// �����f���Ǎ�
	// �L�����N�^�[
	local player = GetPlayerId_();					// ��l��
	local model_nochoman = ReadNpc_("n043");		// �m�`������
	// �G�t�F�N�g
	LoadEffect_("ef742_01_div_mag_hoimi");			// �񕜃G�t�F�N�g
	LoadEffect_("ef712_13_emo_sweat01");			// ���G�t�F�N�g�ǂݍ���

// ���z�u
	// ��l��
	SetPointPos_(player, "player000");
	SetFace_(player, "Face_grimace_close");
	// �m�`���[��
	local nochoman = ArrangePointNpc_(model_nochoman, "npc_nochoman000");
	
// ����풓���[�V�����Ǎ�
	local Player_down_L = ReadMotion_(player, "Player_down_L");	
	local n000_impatience_L = ReadMotion_(nochoman, "n000_impatience_L");					// �ł�

// �������̃��[�V����
	SetMotion_(player, Player_down_L, BLEND_N);
	SetMotion_(nochoman, n000_impatience_L, BLEND_N);

	efc_player = SetSelectBoneEffect_("ef712_13_emo_sweat01", nochoman, ATTACH_EFFECT2);	// ���G�t�F�N�g
	
// ���J�����ݒ�
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");

//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);
	
	//===============================================
	// *�m�`���[��
	// �u�͂��I�@�Ȃ�ŕ����Ă������I�H
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_011_MSG_010");
	KeyInputWait_();
	//�u�񕜂��邩��@�����P��@����΂������I
	ShowMsg_("DEMO_011_MSG_020");
	KeyInputWait_();
	//�u���O�Ȃ�@���Ԃɂ��������Ɓ@�ꏏ��
	ShowMsg_("DEMO_011_MSG_030");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	Wait_(20);
	
	//===============================================
	//�V�X�e�����b�Z�[�W�u�S�񕜂���
	//-----------------------------------------------	
	PlaySE_("SE_SHA_003");																// ��SE
	efc_player = SetSelectBoneEffect_("ef742_01_div_mag_hoimi", player, ATTACH_GLOBAL);	// �񕜃G�t�F�N�g

	OpenMsgWnd_();
	ShowMsg_("DEMO_011_MSG_040");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	EndDemo(FADE_COLOR_BLACK);
}
