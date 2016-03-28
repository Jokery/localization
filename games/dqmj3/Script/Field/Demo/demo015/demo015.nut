//=============================================
//
//		demo015[�B��Ă���m�`���[��]
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
	local efc_player;
	local task_cam, task_nochoman;
	
// �����f���Ǎ�
	// �L�����N�^�[
	local player = GetPlayerId_();					// ��l��
	local model_nochoman = ReadNpc_("n043");		// �m�`������
	// �G�t�F�N�g
	LoadEffect_("ef712_10_emo_surprise01");			// �u�I�v
	LoadEffect_("ef732_09_light_reactor_c");		// ���A�N�^�[����
	
	// �B��Ă���m�`���[��
	local model_box = ReadGimmick_("o_H01_04");		// �W���b�N�A�G�[�X�i�ؔ��j
	local model_barrel = ReadGimmick_("o_H01_03");	// �h���m�`���[���A�N�C�[���i�M�j

// ���z�u
	// ��l��
	SetPointPos_(player, "player000");
	SetDir_(player, -90);
	
	// �m�`���[��
	local nochoman = ArrangePointNpc_(model_nochoman, "npc_nochoman000");
	SetDir_(nochoman, -90);
	SetMotion_(nochoman, MOT_WAIT, BLEND_N);
	
	// �B��Ă���m�`���[��
	local jack = ArrangePointGimmick_("o_H01_04", model_box, "obj_jack000");		// �ؔ��ɉB��Ă���W���b�N
	local queen = ArrangePointGimmick_("o_H01_03", model_barrel, "obj_queen000");	// �܂ɉB��Ă���N�C�[��
	local ace = ArrangePointGimmick_("o_H01_04", model_box, "obj_ace000");			// �ؔ��ɉB��Ă���G�[�X
	local inn = ArrangePointGimmick_("o_H01_03", model_barrel, "obj_inn000");		// �M�ɉB��Ă���h���m�`���[��

// ����풓���[�V�����Ǎ�
	// ��l��
	local player_look_around_L = ReadMotion_(player, "Player_look_around_L");		// ��l���L�����L����
	local player_look_left_L = ReadMotion_(player, "Player_look_left_L");			// ��l�����������������
	local player_touch_reactor = ReadMotion_(player, "Player_touch_reactor");		// ��l����������������遨���A�N�^�[��G��
	local player_touch_reactor_L = ReadMotion_(player, "Player_touch_reactor_L");	// ��l�����A�N�^�[��G��L
	
	// �m�`���[��
	local nochoman_think02_L = ReadMotion_(nochoman, "n000_think02_L");				// �m�`���[���l����i�r�g�݁j
	local nochoman_stand_right_L = ReadMotion_(nochoman, "n000_stand_right_L");		// �m�`���[���r�g��L
	local nochoman_look_up = ReadMotion_(nochoman, "n002_look_up");					// ������ҋ@
	local nochoman_look_up_L = ReadMotion_(nochoman, "n002_look_up_L");				// ������ҋ@L
	local nochoman_think = ReadMotion_(nochoman, "n000_think");						// �ʏ��b���l����i�E�����j
	local nochoman_think_L = ReadMotion_(nochoman, "n000_think_L");					// �l����i�E�����jLOOOP
	local nochoman_talk_joy_L = ReadMotion_(nochoman, "n002_talk_joy_L");						// ��b�@��������

// ���J�����ݒ�
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");

//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);
	
	// �m�`���[���E������
	SetMotion_(nochoman, nochoman_stand_right_L, BLEND_L);
	Wait_(10);
		
	// ��l��
	SetMotion_(player, player_look_left_L, BLEND_XL);
	
	//===============================================
	// *�m�`���[��
	// �u�������܂�����[�I
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_015_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	
	// �m�`���[��
	SetMotion_(nochoman, MOT_WAIT, BLEND_L);
	Wait_(10);
	
	// ��l��
	SetMotion_(player, MOT_WAIT, BLEND_L);
	Wait_(20);
	
	// ���J�b�g�P�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");

	//-----------------------------------------------
	// ��
	// �u�ق�@�݁`��ȁ@�{�[�V���b�N�ɕ߂܂���
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_015_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	WaitTask(task_cam);
	DeleteTask_(task_cam);
	
	// ���J�b�g�Q�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");
	
	// ��l���@�L�����L����
	SetMotion_(player, player_look_around_L, BLEND_XL);
	// �m�`���[���@�l����
	SetMotion_(nochoman, nochoman_think02_L, BLEND_L);
	
	//===============================================
	// *�m�`���[��
	// �u�ł��@�^�悭�߂܂�Ȃ������@���Ԃ�
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_015_MSG_030");
	KeyInputWait_();
	
	SetMotion_(nochoman, nochoman_think, BLEND_L);
	task_nochoman = Task_ChangeMotion_(nochoman, nochoman_think_L, BLEND_M);
	
	SetMotion_(player, player_look_left_L, BLEND_XL);		// ��������
	
	//-----------------------------------------------
	// ��
	// �u���̒��ɂ̓I�C���̐e�F�@�W���b�N���������
	//-----------------------------------------------
	ShowMsg_("DEMO_015_MSG_040");
	KeyInputWait_();
	
	//-----------------------------------------------
	// ��
	// �u�W���b�N�̓z�@�{�[�V���b�N�������
	//-----------------------------------------------
	ShowMsg_("DEMO_015_MSG_050");
	KeyInputWait_();
	CloseMsgWnd_();

	Wait_(20);
	// �m�`���[���@�u�I�v
	SurpriseDisp(nochoman);
	DeleteTask_(task_nochoman);

	task_nochoman = Task_WalkAroundToPos(nochoman, GetPos_(player), ROTATE_DEMO_DEF);
	WaitTask(task_nochoman);
	DeleteTask_(task_nochoman);
	
	SetMotion_(nochoman, nochoman_talk_joy_L, BLEND_M);		// ��b��������
	task_nochoman = Task_ChangeMotion_(nochoman, nochoman_look_up_L, BLEND_M);	
	
	//-----------------------------------------------
	// ��
	// �u�����I�@���O�̓��̂���@���A�N�^�[��������I
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_015_MSG_060");
	KeyInputWait_();
	CloseMsgWnd_();
//	SetMotion_(nochoman, nochoman_look_up, BLEND_L);		// ������ҋ@

	Wait_(20);
	
	SetDir_(player, -60);
	SetAlpha_(nochoman, ALPHA_CLEAR);
	
	// ���J�b�g�R�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");
	
	//-----------------------------------------------
	// ��
	// �u���A�N�^�[�ɂ́@�T�[�`�@�\�����������B
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_015_MSG_070");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	Wait_(5);
	
	SetMotion_(player, player_touch_reactor, BLEND_L);		// ���A�N�^�[�ɐG��
	SetFace_(player, "Face_left");
	WaitMotion(player);
	SetMotion_(player, player_touch_reactor_L, BLEND_L);	// ���A�N�^�[�ɐG��
	
	// ���A�N�^�[�N��
	PlaySE_("SE_FLD_135");		// ���A�N�^�[������
	efc_player = SetSelectBoneEffect_("ef732_09_light_reactor_c", player, ATTACH_EFFECT1);	// ���A�N�^�[����
	SetEffectScale_(efc_player, 0.5);
	
	Wait_(10);
	
	//===============================================
	// �����A�N�^�[
	// �u�{�@�́@�T�[�`�@�\���@�N�����܂��B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_REACTOR");
	ShowMsg_("DEMO_015_MSG_080");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	//SetMotion_(player, player_look_left_L, BLEND_XL);
	Wait_(20);
	
	EndDemo(FADE_COLOR_BLACK);
}
