//=============================================
//
//		demo526[�A���Z�X����̓`��]
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
	local task_cam, task_player;
	local efc_player;

// �����\�[�X�Ǎ�
	// �L�����N�^�[
	local player = GetPlayerId_();					// �A���Z�X
	
	LoadLayout_("noise");							//���C�A�E�g �m�C�Y

// ���z�u
	// ��l��
	SetPointPos_(player, "player000");

// ����풓���[�V�����Ǎ�
	local player_wood_look_down_L = ReadMotion_(player, "Player_wood_look_down_L");		//�A���Z�X �C�ɂ������(���ނ�)
	local Player_wood_look_front_L = ReadMotion_(player, "Player_wood_look_front_L");		//�A���Z�X �C�ɂ������(�O������)
	local Player_look_left_L = ReadMotion_(player, "Player_look_left_L");				//�A���Z�X ������Ɍ�����
	local player_talk = ReadMotion_(player, "Player_talk");								//�A���Z�X ��b
	local player_talk_L = ReadMotion_(player, "Player_talk_L");							//�A���Z�X ��bL
	local player_r_hand_hold01L = ReadMotion_(player, "Player_r_hand_hold01L");			//�A���Z�X �E�������1L
	local player_r_hand_hold02L = ReadMotion_(player, "Player_r_hand_hold02L");			//�A���Z�X �E�������2L
	
	
// ���J�����ݒ�
	
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");
	DeleteTask_(task_cam);

//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------
	
	SetMotion_(player, player_wood_look_down_L, BLEND_L);								//�A���Z�X �؂ɂ������(���ނ�)
	
	SetFace_(player, "Face_loop_close");												//�A���Z�X �ڂ����

	StartDemo(FADE_COLOR_WHITE);
	ChangeColorSepia();
	
	PlayBgm_("BG_AMBI_016");
	SetLayoutAnime_("noise_in", false);													//�m�C�Y�t�F�[�h�C��
	WaitLayoutAnime();
	SetLayoutAnime_("noise_out", false);												//�m�C�Y�t�F�[�h�A�E�g
	WaitLayoutAnime(); 
	
	//===============================================
	//*�o�[�f�B
	// 	�u�A�c�c�A���Z�X�I�H
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_BIRDY");
	ShowMsg_("DEMO_526_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	//===============================================
	//*���i�[�e
	// 	�u�o�[�f�B�@�Â��ɁB
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_526_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	SetMotion_(player, Player_wood_look_front_L, BLEND_XL);	
	SetFace_(player, "Face_eyes_close");													//�A���Z�X �ʏ�̖�
	Wait_(30);

	//�A���Z�X ���������đҋ@
	SetMotion_(player, Player_look_left_L, BLEND_XL);
	Wait_(60);
	
	//===============================================
	//*�A���Z�X
	// 	�u�f�����B���ā@�����ɑ���H
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ANSESU");
	ShowMsg_("DEMO_526_MSG_030");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	local task_player = Task_RotateToDir_(player, 200, 2);
	SetMotion_(player, MOT_WALK, BLEND_XL);
	Wait_(30);
	StopBgm_(30);
	
	SetMotion_(player, player_talk, BLEND_XL);											//�A���Z�X ��b
	WaitMotion(player);
	SetMotion_(player, player_talk_L, BLEND_XL);											//�A���Z�X ��bL
	
	Wait_(15);
	PlayBgm_("BGM_009");
	//===============================================
	//*�A���Z�X
	// 	�u�Ƃ肠�����c�c����������
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ANSESU");
	ShowMsg_("DEMO_526_MSG_040");
	KeyInputWait_();
	//===============================================	
	
	//===============================================
	//*�A���Z�X
	// 	�u�󋵂͈����Ɓ@���킴��𓾂Ȃ��B
	//-----------------------------------------------
	ShowMsg_("DEMO_526_MSG_050");
	KeyInputWait_();
	//===============================================

	SetMotion_(player, player_r_hand_hold01L, BLEND_XL);									//�A���Z�X ����1	
	Wait_(30);	
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");
	
	//===============================================
	//*�A���Z�X
	// 	�u�����c�c�܂��@������߂��Ⴂ�Ȃ��B
	//-----------------------------------------------
	ShowMsg_("DEMO_526_MSG_060");
	KeyInputWait_();
	//===============================================
			
	SetMotion_(player, player_r_hand_hold02L, BLEND_XL);									//�A���Z�X ����2L
	
	//===============================================
	//*�A���Z�X
	// 	�u�l�Ԃ������X�^�[���@�}�f�ɉ��������
	//-----------------------------------------------
	ShowMsg_("DEMO_526_MSG_070");
	KeyInputWait_();
	//===============================================

	SetMotion_(player, MOT_WAIT, BLEND_XL);										//�A���Z�X �ҋ@

	//===============================================
	//*�A���Z�X
	// 	�u������@�I�������́@�K�������Ė߂��B
	//-----------------------------------------------
	ShowMsg_("DEMO_526_MSG_080");
	KeyInputWait_();
	//===============================================
	
	//===============================================
	//*�A���Z�X
	// 	�u���ǁc�c�������@�I�����߂�Ȃ�������
	//-----------------------------------------------
	ShowMsg_("DEMO_526_MSG_090");
	KeyInputWait_();
	//===============================================	
	SetMotion_(player, player_talk, BLEND_XL);													//�A���Z�X ��b
	WaitMotion(player);
	SetMotion_(player, player_talk_L, BLEND_XL);												//�A���Z�X ��bL

	//===============================================
	//*�A���Z�X
	// 	�u���O�͂��O���B�I������Ȃ��B
	//-----------------------------------------------
	ShowMsg_("DEMO_526_MSG_100");
	KeyInputWait_();
	//===============================================	
	
	//===============================================
	//*�A���Z�X
	// 	�u<name_player/>�c�c�������g�̈ӎu��
	//-----------------------------------------------
	ShowMsg_("DEMO_526_MSG_110");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetMotion_(player, MOT_WAIT, BLEND_XL);
	Wait_(30);
	PlaySE_("SE_DEM_126");															//��SE:�f�����m�C�Y�ŏI���
	SetLayoutAnime_("noise_in", false);												//�m�C�Y�t�F�[�h�C��
	WaitLayoutAnime();
	SetLayoutAnime_("noise_loop", true);											//�m�C�Y�t�F�[�h�A�E�g
	
	EndDemo(FADE_COLOR_WHITE);
}
