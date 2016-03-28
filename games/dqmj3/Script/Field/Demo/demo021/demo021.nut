//=============================================
//
//		demo021[�L���O�̋A��]
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
	local task_cam, task_player, task_jack, task_king, task_foot;
	local efc_nocho100, efc_nocho200, efc_nocho400;
	local pos_jack = Vec3(-27.14326, 4.48512, -29.71423);		// 130���Ɍ���

// �����f���Ǎ�
	// �M�~�b�N
	local model_monolith = ReadGimmick_("o_com_02");
	local monolith = ArrangePointGimmick_("o_com_02", model_monolith, "obj_monolith000");
	// �L�����N�^�[
	local player = GetPlayerId_();					// ��l��
	local model_jack = ReadNpc_("n001");			// �W���b�N
	local model_king = ReadNpc_("n003");			// �L���O
	local model_queen = ReadNpc_("n005");			// �N�C�[��
	local model_ace = ReadNpc_("n002");				// �G�[�X
	local model_nocho = ReadNpc_("n000");			// �m�`��
	local model_nocho_f = ReadNpc_("n004");			// �m�`����
	local model_rin = ReadNpc_("n043");				// �m�`������
	//�G�t�F�N�g
	LoadEffect_("ef712_10_emo_surprise01");
	LoadEffect_("ef712_04_emo_joy01");

// ���z�u
	// ��l��
	SetPointPos_(player, "player000");
	// �W���b�N
	local jack = ArrangePointNpc_(model_jack, "npc_jack000");
	// �L���O
	local king = ArrangePointNpc_(model_king, "npc_king000");
	// �N�C�[��
	local queen = ArrangePointNpc_(model_queen, "npc_queen000");
	// �G�[�X
	local ace = ArrangePointNpc_(model_ace, "npc_ace000");
	// �m�`���[���P
	local nocho000 = ArrangePointNpc_(model_rin, "npc_nocho000");
	// �m�`���[���Q
	local nocho100 = ArrangePointNpc_(model_nocho, "npc_nocho100");
	// �m�`���[���R
	local nocho200 = ArrangePointNpc_(model_nocho_f, "npc_nocho200");
	// �m�`���[���S
	local nocho300 = ArrangePointNpc_(model_nocho_f, "npc_nocho300");
	// �m�`���[���T
	local nocho400 = ArrangePointNpc_(model_nocho, "npc_nocho400");

// ����풓���[�V�����Ǎ�
	// ��l��
	local player_look_walk_L = ReadMotion_(player, "Player_look_walk_L");	// �L����
	// �W���b�N
	local jack_bow_talk = ReadMotion_(jack, "n001_talk01");			// �W���b�N���������遨�ʏ��b
	local jack_nod = ReadMotion_(jack, "n001_nod");					// �W���b�N���ȂÂ�
	// �L���O
	local king_look_jack = ReadMotion_(king, "n003_look_jack");		// �L���O�W���b�N���߂�
	local king_look_jack_L = ReadMotion_(king, "n003_look_jack_L");	// �L���O�W���b�N���߂�
	local king_think01 = ReadMotion_(king, "n003_think01");			// �L���O�������l����
	local king_think_L = ReadMotion_(king, "n003_think_L");			// �L���O�l����
	local king_stand = ReadMotion_(king, "n003_stand01");			// �L���O�l���遨�ʏ�ҋ@
	local king_talk = ReadMotion_(king, "n003_talk");				// �L���O�ҋ@����b
	local king_talk_L = ReadMotion_(king, "n003_talk_L");			// �L���O��bL
	local king_stick_up = ReadMotion_(king, "n003_stick_up");		// �L���O�ҋ@����f��
	local king_stick_up_L = ReadMotion_(king, "n003_stick_up_L");	// �L���O��f��
	local king_feeldown_L = ReadMotion_(king, "n003_feeldown_L");	// �L���O��������
	// �m�`���[��
	local nocho100_talk_joy_L = ReadMotion_(nocho100, "n000_talk_joy_L");	// ��b�i���������jL
	local nocho200_talk_joy_L = ReadMotion_(nocho200, "n000_talk_joy_L");	// ��b�i���������jL
	local nocho400_talk_joy_L = ReadMotion_(nocho400, "n000_talk_joy_L");	// ��b�i���������jL

// ���������[�V�����ݒ�
	SetMotion_(king, king_look_jack_L, BLEND_N);
	SetMotion_(player, player_look_walk_L, BLEND_N);
	SetMotion_(nocho000, MOT_TALKLOOP, BLEND_N);
	SetMotion_(nocho100, nocho100_talk_joy_L, BLEND_N);
	SetMotion_(nocho200, nocho200_talk_joy_L, BLEND_N);
	SetMotion_(nocho300, MOT_TALKLOOP, BLEND_N);
	SetMotion_(nocho400, nocho400_talk_joy_L, BLEND_N);
	
	task_player = Task_MoveForward_(player, 1.0, false);
	task_foot = Task_PlaySe_("SE_FLD_015", 16);
	
// ���G�t�F�N�g�ݒ�
	local efc_nocho200 = SetSelectBoneEffect_("ef712_04_emo_joy01", nocho200, ATTACH_EFFECT2);
	local efc_nocho100 = SetSelectBoneEffect_("ef712_04_emo_joy01", nocho100, ATTACH_EFFECT2);
	local efc_nocho400 = SetSelectBoneEffect_("ef712_04_emo_joy01", nocho400, ATTACH_EFFECT2);

// ���J�����ݒ�
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");

//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------	
	
	// ���J�b�g�P����l���L�����L�����`�`�`�`�`�`�`�`�`�`�`�`�`
	StartDemo(FADE_COLOR_BLACK);
	Wait_(15);
	
	//++++++++++++++++++++++++++++++++++++++
	//���N���X�t�F�[�h
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 15);
	WaitFade_();
	SetFade_(FADE_IN, FADE_COLOR_BLACK, 15);
	//++++++++++++++++++++++++++++++++++++++
	SetMotionSpeed_(player, 1.0);	
	SetMotion_(player, MOT_WAIT, BLEND_M);
	DeleteTask_(task_player);
	DeleteTask_(task_foot);
	
	// ���J�b�g�Q�������������ƌ��n���`�`�`�`�`�`�`�`�`�`�`�`
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");		// 210F
	WaitTask(task_cam);
	
	//++++++++++++++++++++++++++++++++++++++
	//���N���X�t�F�[�h
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 15);
	WaitFade_();
	SetFade_(FADE_IN, FADE_COLOR_BLACK, 15);
	//++++++++++++++++++++++++++++++++++++++
	
	DeleteEffect_(efc_nocho100);
	DeleteEffect_(efc_nocho200);
	DeleteEffect_(efc_nocho400);
	
	DeleteTask_(task_cam);
	SetPointPos_(player, "player001");
	
	// ���J�b�g�R����l���A�L���O�̑O�֕����`�`�`�`�`�`�`�`�`�`
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");		// 400F
	
	SetMotion_(player, MOT_WALK, BLEND_M);
	task_player = Task_MoveForward_(player, 1.0, false);
	Wait_(60);
	
	SetMotion_(player, MOT_WAIT, BLEND_M);
	DeleteTask_(task_player);
	
	MotionTalk(jack);
	
	SetMotion_(king, MOT_WAIT, BLEND_XL);
	
	task_jack = Task_WalkAroundToPos(jack, GetPos_(player), ROTATE_DEMO_DEF);
	WaitTask(task_jack);
	
	SetMotion_(jack, jack_bow_talk, BLEND_L);		// ���������遨�ʏ��b
	WaitMotion(jack);
	
	SetMotion_(jack, MOT_TALKLOOP, BLEND_M);
	
	//===============================================
	// ���W���b�N
	// �u�����@<name_player/>�ǂ́I
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_JACK");
	ShowMsg_("DEMO_021_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetMotion_(jack, MOT_WAIT, BLEND_M);
	Wait_(20);
	DeleteTask_(task_cam);
	
	DeleteTask_(task_jack);
	
	// ���J�b�g�S���L���O�Y�[���A�b�v�`�`�`�`�`�`�`�`�`�`�`�`�`
	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");		// 400F
	
	SetMotion_(king, king_talk, BLEND_M);
	WaitMotion(king);
	SetMotion_(king, king_talk_L, BLEND_M);
	
	//===============================================
	// ���L���O
	// �u�ł́@<name_player/>��B�񑩒ʂ�
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_KING");
	ShowMsg_("DEMO_021_MSG_020");
	KeyInputWait_();
	
	SetMotion_(king, king_think01, BLEND_L);
	task_king = Task_ChangeMotion_(king, king_think_L, BLEND_M);
	
	//-----------------------------------------------
	// ��
	// �u���āc�c�]�����@�m�`���[������
	//-----------------------------------------------
	ShowMsg_("DEMO_021_MSG_030");
	KeyInputWait_();
	
	DeleteTask_(task_king);
	SetMotion_(king, king_stand, BLEND_L);
	SetMotionSpeed_(king, 2.5);	// ���[�V�����������Ȃ�
	WaitMotion(king);
	SetMotion_(king, king_talk, BLEND_L);
	SetMotionSpeed_(king, 1);	// ���[�V���������ɖ߂�
	task_king = Task_ChangeMotion_(king, king_talk_L, BLEND_L);

	//-----------------------------------------------
	// ��
	// �u�������@���鎞�@�łɐ��܂肵�ٌ`�̖����c�c
	//-----------------------------------------------
	ShowMsg_("DEMO_021_MSG_040");
	KeyInputWait_();
	CloseMsgWnd_();
	
	Wait_(20);
	DeleteTask_(task_cam);
	task_cam = Task_AnimeMoveCamera_("anmeye004", "anmtgt004");		// 120F
	
	//�L���O����グ��
	SetMotion_(king, king_stick_up, BLEND_N);
	WaitMotion(king);
	SetMotion_(king, king_stick_up_L, BLEND_L);
	
	//-----------------------------------------------
	// ��
	// �u����ǁ@�ł���Ƃ���@������B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_KING");
	ShowMsg_("DEMO_021_MSG_050");
	KeyInputWait_();
	
	SetMotion_(king, king_talk_L, BLEND_L);
	
	//-----------------------------------------------
	// ��
	// �u���A�N�^�[��g�ɒ����@�u���C�N�����X�^�[��
	//-----------------------------------------------
	ShowMsg_("DEMO_021_MSG_060");
	KeyInputWait_();
	
	//-----------------------------------------------
	// ��
	// �u�����ā@���̃��W�X�^���X�̒��ɂ�
	//-----------------------------------------------
	ShowMsg_("DEMO_021_MSG_070");
	KeyInputWait_();

	//-----------------------------------------------
	// ��
	// �u�u���C�N�����X�^�[�Ɂ@������������
	//-----------------------------------------------	
	ShowMsg_("DEMO_021_MSG_080");
	KeyInputWait_();
	
	SetMotion_(king, king_feeldown_L, BLEND_XL);
	//-----------------------------------------------
	// ��
	// �u�������c�c�����ɖ����B���W�X�^���X�͂���
	//-----------------------------------------------
	ShowMsg_("DEMO_021_MSG_090");
	KeyInputWait_();
	
	//-----------------------------------------------
	// ��
	// �u�����܂��@�u���C�N�����X�^�[�Ɏx�z����
	//-----------------------------------------------
	ShowMsg_("DEMO_021_MSG_100");
	KeyInputWait_();
	CloseMsgWnd_();

	Wait_(20);

	SetAlpha_(nocho000, ALPHA_CLEAR);
	SetAlpha_(nocho100, ALPHA_CLEAR);
	SetAlpha_(nocho200, ALPHA_CLEAR);
	SetAlpha_(nocho300, ALPHA_CLEAR);
	SetAlpha_(nocho400, ALPHA_CLEAR);
	DeleteTask_(task_cam);
		
	// ���J�b�g�T����l���A�b�v�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`
	task_cam = Task_AnimeMoveCamera_("anmeye005", "anmtgt005");		// 80F
	
	//-----------------------------------------------
	// ��
	// �u�����@�܂���]�͎c���Ă����I
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_KING");
	ShowMsg_("DEMO_021_MSG_110");
	KeyInputWait_();

	//===============================================
	// ���L���O
	// �u���������@�u���C�N�����X�^�[��ł��łڂ�
	//-----------------------------------------------
	ShowMsg_("DEMO_021_MSG_120");
	KeyInputWait_();
	CloseMsgWnd_();

	Wait_(20);
	DeleteTask_(task_cam);
	
	SetMotion_(king, king_talk_L, BLEND_N);
	
	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");		// 400F
	
	//===============================================
	// ���L���O
	// �u�悢���@<name_player/>��B���ꂩ���
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_KING");
	ShowMsg_("DEMO_021_MSG_130");
	KeyInputWait_();
	
	//-----------------------------------------------
	// ��
	// �u�����́@��߂���`�J���̉��������
	//-----------------------------------------------
	ShowMsg_("DEMO_021_MSG_140");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	Wait_(20);
	DeleteTask_(task_cam);
	DeleteTask_(task_king);
	SetMotion_(king, king_look_jack, BLEND_L);
	task_king = Task_ChangeMotion_(king, king_look_jack_L, BLEND_M);
	
	// ���J�b�g�W���L���O�A�W���b�N�ɖ��߁`�`�`�`�`�`�`�`�`�`�`
	SetPointCameraEye_("cameye002");
	SetPointCameraTarget_("camtgt002");

	task_jack = Task_WalkAroundToPos(jack, GetPos_(king), ROTATE_DEMO_DEF);
	WaitTask(task_jack);
	SetMotion_(jack, MOT_WAIT, BLEND_M);
	DeleteTask_(task_jack);
	Wait_(15);
	
	SurpriseDisp(jack);
	
	SetMotion_(jack, jack_nod, BLEND_M);
	WaitMotion(jack);
	
	SetMotion_(king, MOT_WAIT, BLEND_XL);
	
	task_jack = Task_WalkAroundToPos(jack, pos_jack, ROTATE_DEMO_DEF);
	WaitTask(task_jack);
	DeleteTask_(task_jack);
	
	task_jack = Task_MoveForward_(jack, 1.0, false);
	
	//�t�F�[�h�A�E�g===================================
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
	WaitFade_();
	DeleteTask_(task_jack);
	SetMotion_(jack, MOT_WAIT, BLEND_M);
	SetMotion_(king, king_talk_L, BLEND_N);
	//=================================================
	
	// ���J�b�g�X���`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`
	task_cam = Task_AnimeMoveCamera_("anmeye003", "anmtgt003");		// 180F
	
	SetPointPos_(jack, "npc_jack001");		//�W���b�N�@���m���X�̑O�ֈړ�
	//�t�F�[�h�C��===================================
	SetFade_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
	WaitFade_();
	//=================================================
	
	//===============================================
	// ���L���O
	// �u���̎�n�߂Ɂ@���̃E�b�h�p�[�N�ɂ���
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_KING");
	ShowMsg_("DEMO_021_MSG_150");
	KeyInputWait_();
	//-----------------------------------------------
	// ��
	// �u���n�̖��́@�o�[�`�����R���V�A���B
	//-----------------------------------------------
	ShowMsg_("DEMO_021_MSG_160");
	KeyInputWait_();

	//-----------------------------------------------
	// ��
	// �u�����𐮂�����@���m���X�𒲂ׂ邪�悢�B
	//-----------------------------------------------
	ShowMsg_("DEMO_021_MSG_170");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	WaitTask(task_cam);
	
	EndDemo(FADE_COLOR_BLACK);
}