//=============================================
//
//		demo107[�d���̕���_3(�N����)]
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
	local efc00_acc, efc01_srp, efc02, ef0c3, efc04, efc05, efc06, efc07, efc08, efc09;
	local task_cam, task_player, task_npc01, task_npc02, task_npc03;
	
// �����f���Ǎ�
	// �L�����N�^�[
	local player = GetPlayerId_();					// ��l��
	// �M�~�b�N
	local model_monitor = ReadGimmick_("o_A02_02");	// ���j�^

// ���z�u
	// ���j�^
	local monitor = ArrangePointGimmick_("o_A02_02", model_monitor, "obj_monitor000");
	SetMotion_(monitor, MOT_GIMMICK_5, BLEND_N);		// ���j�^�J��
	
	// ��l��
	SetPointPos_(player, "player000");

// ����풓���[�V�����Ǎ�
	// ��l��
	local player_reactor = ReadMotion_(player, "Player_touch_reactor");			// ��������������遨���A�N�^�[��G��
	local player_reactor_L = ReadMotion_(player, "Player_touch_reactor_L");		// ���A�N�^�[��G��L
	local player_stand = ReadMotion_(player, "Player_stand01");					// ���A�N�^�[��G�遨�ҋ@�ɖ߂�
	
	
// ���G�t�F�N�g�ǂݍ���
	LoadEffect_("ef732_09_light_reactor_c");					// ���A�N�^�[����
	LoadEffect_("ef712_10_emo_surprise01");			//����

// ���J�����ݒ�
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");

//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);
	
	SurpriseDisp(player);		// ��l���@����
	Wait_(20);
	
	local light = SetSelectBoneEffect_("ef732_09_light_reactor_c", player, ATTACH_EFFECT1);	//���A�N�^�[����
	
	// �R�l�N�e�B�u���[�hON
	OpenConnectiveWithMotion("connective_ace", player, player_reactor, player_reactor_L);
	
	//===============================================
	// ���G�[�X
	// �u��������@<name_player/>�I
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ACE");
	ShowMsg_("DEMO_107_MSG_010");
	KeyInputWait_();
	//-----------------------------------------------
	// ��
	// �u�I���[���@�����߂��Ă�����I
	//-----------------------------------------------
	ShowMsg_("DEMO_107_MSG_020");
	KeyInputWait_();
	//-----------------------------------------------
	// ��
	// �u��蓹�@����Ȃ悾���I
	//-----------------------------------------------
	ShowMsg_("DEMO_107_MSG_030");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================	
	
	// �R�l�N�e�B�u���[�hOFF
	CloseConnective();
	
	Wait_(20);
	
	SetMotion_(player, player_stand, BLEND_L);
	
	EndDemo(FADE_COLOR_BLACK);
}
