//=============================================
//
//		demo109[�Z���^�[�r���n�k����]
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
	local task_cam, task_player, task_jack, task_ace;
	local efc_player, efc_jack, efc_king, efc_fall00, efc_fall01, efc_fall02;

// �����\�[�X�Ǎ�
	// �M�~�b�N
	local model_elevator = ReadGimmick_("o_A01_00");	// �G���x�[�^�[��
	local model_mixture = ReadGimmick_("o_A01_02");		// �z�����u
	// �L�����N�^�[
	local player = GetPlayerId_();				// ��l��
	local model_jack = ReadNpc_("n001");		// �W���b�N
	local model_ace = ReadNpc_("n002");			// �G�[�X
	local model_king = ReadNpc_("n003");		// �L���O
	local model_queen = ReadNpc_("n005");		// �N�C�[��
	// �G�t�F�N�g
	LoadEffect_("ef712_13_emo_sweat01");		// ��
	LoadEffect_("ef726_01_nat_parapara");		// ������
	LoadEffect_("ef712_10_emo_surprise01");		// �u�I�v

// ���z�u
	// �G���x�[�^�[���i���j
	local elevator_left = ArrangePointGimmick_("o_A01_00", model_elevator, "obj_elevator000");
	// �G���x�[�^�[���i�E�j
	local elevator_right = ArrangePointGimmick_("o_A01_00", model_elevator, "obj_elevator100");
	// �z�����u
	local mixture = ArrangePointGimmick_("o_A01_02", model_mixture, "obj_mixture000");
	
	// ��l��
	SetPointPos_(player, "player000");
	// �W���b�N
	local jack = ArrangePointNpc_(model_jack, "npc_jack000");
	// �G�[�X
	local ace = ArrangePointNpc_(model_ace, "npc_ace000");
	SetStepSePan_(ace, false);
	// �L���O
	local king = ArrangePointNpc_(model_king, "npc_king000");

// ����풓���[�V�����Ǎ�
	// ��l��
	local player_quake_L = ReadMotion_(player, "Player_quake_L");				// �h��
	local player_caution01_L = ReadMotion_(player, "Player_caution01_L");		// �x��L
	local player_look_left_L = ReadMotion_(player, "Player_look_left_L");		// ��������
	local player_look_down_L = ReadMotion_(player, "Player_look_down_L");		// ��������
	
	// �W���b�N
	local jack_run_L = ReadMotion_(jack, "n001_run_L");							// ����L
	local jack_impatience_L = ReadMotion_(jack, "n001_impatience_L");			// �ł�L
	
	// �G�[�X
	local ace_run_L = ReadMotion_(ace, "n001_run_L");							// ����
	local ace_think = ReadMotion_(ace, "n002_think");							// �l����
	local ace_think_L = ReadMotion_(ace, "n002_think_L");						// �l����L
	local ace_arm_folde = ReadMotion_(ace, "n002_arm_folde");					// �l���遨�r�g��
	local ace_arm_folde_L = ReadMotion_(ace, "n002_arm_folde_L");				// �r�g��L	
	local ace_feel_down = ReadMotion_(ace, "n000_feel_down");					// ��������
	local ace_feel_down_L = ReadMotion_(ace, "n000_feel_down_L");				// ��������L
	
	// �L���O
	local king_quake_L = ReadMotion_(king, "n003_quake_L");						// �h��
	local king_look_jack = ReadMotion_(king, "n003_look_jack");					// �W���b�N���߂�
	local king_look_jack_L = ReadMotion_(king, "n003_look_jack_L");				// �W���b�N���߂�L
	local king_stick_up = ReadMotion_(king, "n003_stick_up");					// �ҋ@����f��
	local king_stick_up_L = ReadMotion_(king, "n003_stick_up_L");				// ��f��
	local king_talk_L = ReadMotion_(king, "n003_talk_L");						// ��b(�G�[�X�Ɍ���)
	local king_shock_L = ReadMotion_(king, "n003_shock_L");						// �����i�����jL
	local king_surprise_L = ReadMotion_(king, "n003_surprise_L");				// ����L
	local king_think = ReadMotion_(king, "n003_think");							// �ʏ�ҋ@���l����
	local king_think_L = ReadMotion_(king, "n003_think_L");						// �l����L
	local king_nod = ReadMotion_(king, "n003_nod");								// ���ȂÂ�

// ���J�����ݒ�
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");

	SetMotion_(mixture, MOT_GIMMICK_0, BLEND_N);
	SetMotion_(jack, jack_run_L, BLEND_M);							//�W���b�N����	
	
	efc_jack = SetSelectBoneEffect_("ef712_13_emo_sweat01", jack, ATTACH_EFFECT2);// ���G�t�F�N�g

//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);
	
	SetMotion_(king, king_think, BLEND_M);
	WaitMotion(king);
	SetMotion_(king, king_think_L, BLEND_M);
	
	//===============================================
	// ���L���O
	// �u�����Ɩ������@�z������c�c�H
	//-----------------------------------------------
	OpenMsgWnd_();	
	SetTalkName_("NAME_TAG_KING");
	ShowMsg_("DEMO_109_MSG_010");
	KeyInputWait_();
	
	SetMotion_(king, king_talk_L, BLEND_XL);		// ��bLOOP
	
	//-----------------------------------------------
	// ��
	// �u�����́@�����ƂȂ�̂Ȃ�
	//-----------------------------------------------
	ShowMsg_("DEMO_109_MSG_020");
	KeyInputWait_();
	
	SetMotion_(king, king_stick_up, BLEND_M);
	WaitMotion(king);
	SetMotion_(king, king_stick_up_L, BLEND_M);
	
	//-----------------------------------------------
	// ��
	// �u���������@���^�]���c�c�������I�H
	//-----------------------------------------------
	ShowMsg_("DEMO_109_MSG_030");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	StartEarthQuake_(-1, 3, 1);
	PlayLoopSE_("SE_DEM_013");
	StopBgm_(15);
	efc_player = SurpriseDisp(player);
	SetEffectScale_(efc_player, 1.5);
	
	SetMotion_(king, king_quake_L, BLEND_M);
	SetMotion_(player, player_quake_L, BLEND_M);
	
	// �G�t�F�N�g�ݒu�^�C�~���O�����炷
	efc_fall00 = SetPointWorldEffect_("ef726_01_nat_parapara", "efc_fall000");
	Wait_(5);
	efc_fall01 = SetPointWorldEffect_("ef726_01_nat_parapara", "efc_fall001");
	Wait_(5);
	efc_fall02 = SetPointWorldEffect_("ef726_01_nat_parapara", "efc_fall002");
	Wait_(50);
	
	//===============================================
	// ���L���O
	// �u�ʂ������I�@�����Ƃł��邩�[���I�H
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_KING");
	ShowMsg_("DEMO_109_MSG_040");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	StopEarthQuake_();
	StartDecayEarthQuake_(20, 3, 1)
	StopLoopSE_(20);
	
	// �G�t�F�N�g�폜�^�C�~���O�����炷
	DeleteEffectEmitter_(efc_fall02);
	Wait_(5);
	DeleteEffectEmitter_(efc_fall01);
	Wait_(5);
	DeleteEffectEmitter_(efc_fall00);
	
	SetMotion_(king, king_surprise_L, BLEND_L);
	SetMotion_(player, player_caution01_L, BLEND_M);
	Wait_(10);
	
	task_jack = Task_MoveForward_(jack, 1.0, true);		//Wait���v37
	Wait_(20);
	PlaySE_("SE_FLD_011");								//��SE:�W���b�N����
	Wait_(7);
	PlaySE_("SE_FLD_011");								//��SE:�W���b�N����
	Wait_(7);
	PlaySE_("SE_FLD_011");								//��SE:�W���b�N����
	Wait_(3);
	DeleteTask_(task_jack);
	
	SetMotion_(player, MOT_WAIT, BLEND_M);
	SetMotion_(jack, jack_impatience_L, BLEND_M);		// �ł�LOOP
	SetMotion_(king, king_look_jack, BLEND_L);			// �W���b�N������
	Wait_(30);											// WaitMotion���g�p����Ƒҋ@���Ԃ��������邽�߁A�҂����Ԏw�肷��
	SetMotion_(king, king_look_jack_L, BLEND_M);
	
	SetAlpha_(player, ALPHA_CLEAR);
	
	// ���J�b�g�Q���W���b�N�̃A�b�v�`�`�`�`�`�`�`�`�`�`�`�`�`�`
	SetPointCameraEye_("cameye003");
	SetPointCameraTarget_("camtgt003");
	
	SetPointPos_(jack, "npc_jack001");
	SetMotion_(jack, jack_impatience_L, BLEND_M);
	
	//===============================================
	// ���W���b�N
	// �u�L���O�[�b�I�@��ςł��I
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_JACK");
	ShowMsg_("DEMO_109_MSG_050");
	KeyInputWait_();
	
	//-----------------------------------------------
	// ��
	// �u�ꑰ�̎҂������@���т��Ă���܂��B
	//-----------------------------------------------
	ShowMsg_("DEMO_109_MSG_060");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	// ���J�b�g�R���L���O�̃A�b�v�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`
	SetPointCameraEye_("cameye004");
	SetPointCameraTarget_("camtgt004");
	
	//===============================================
	// ���L���O
	// �u���ށc�c�������@�킩��Ȃ��Ă�
	//-----------------------------------------------
	OpenMsgWnd_();	
	SetTalkName_("NAME_TAG_KING");
	ShowMsg_("DEMO_109_MSG_070");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	task_ace = Task_AnimeMove_(ace, "anm_ace000");
	SetMotion_(ace, MOT_WALK, BLEND_N);
	
	// ���J�b�g�S���G�[�X�̃A�b�v�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`
	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");
	
	//===============================================
	// ���G�[�X
	// �u����I�@�����Ȃ�@�킩���Ă��邺�B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ACE");
	ShowMsg_("DEMO_109_MSG_080");
	
	WaitTask(task_ace);
	DeleteTask_(task_ace);
	
	SetMotion_(ace, ace_think, BLEND_M);		// �l����
	WaitMotion(ace);
	SetMotion_(ace, ace_think_L, BLEND_M);		// �l����LOOP
	
	KeyInputWait_();
	
	//-----------------------------------------------
	// ��
	// �u�ŏ�K�ɂ���@�@�B���U�����Ă�񂾁B
	//-----------------------------------------------
	ShowMsg_("DEMO_109_MSG_090");
	SetMotion_(ace, ace_arm_folde, BLEND_M);	// �r�g��
	WaitMotion(ace);
	SetMotion_(ace, ace_arm_folde_L, BLEND_M);	// �r�g��LOOP
	
	KeyInputWait_();
	
	//-----------------------------------------------
	// ��
	// �u�h��́@���̂��Ƃ������������B
	//-----------------------------------------------
	ShowMsg_("DEMO_109_MSG_100");
	SetMotion_(ace, ace_feel_down, BLEND_XL);	// ��������
	WaitMotion(ace);
	SetMotion_(ace, ace_feel_down_L, BLEND_M);	// ��������LOOP
	
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	DeleteTask_(task_cam);
	
	// ���J�b�g�T���L���O�̃A�b�v�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`
	SetPointCameraEye_("cameye004");
	SetPointCameraTarget_("camtgt004");
	
	SetMotion_(king, king_talk_L, BLEND_XL);
	
	//===============================================
	// ���L���O
	// �u�G�[�X�I�@�Ȃ�Ƃ��@�ł���ł��邩�H
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_KING");
	ShowMsg_("DEMO_109_MSG_110");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	// ���J�b�g�U���G���x�[�^�[�������`�`�`�`�`�`�`�`�`�`�`�`
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");
	
	//===============================================
	// ���G�[�X
	// �u�G���x�[�^�[�𕜋�������΁@�����͂ł���B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ACE");
	ShowMsg_("DEMO_109_MSG_120");
	KeyInputWait_();
	
	//-----------------------------------------------
	// ��
	// �u<name_player/>���@��q���Ă����Ȃ�
	//-----------------------------------------------
	ShowMsg_("DEMO_109_MSG_130");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	DeleteTask_(task_cam);
	SetMotion_(player, MOT_WAIT, BLEND_N);
	
	// ���J�b�g�V���L���O�̃A�b�v�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`
	task_cam = Task_AnimeMoveCamera_("anmeye003", "anmtgt003");	
	
	//===============================================
	// ���L���O
	// �u���ށI�@�����܂�����̂ł���B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_KING");
	ShowMsg_("DEMO_109_MSG_140");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	Wait_(30);
	
	SetPointPos_(ace, "npc_ace001");						// �G�[�X�ړ�
	SetDirToObject_(ace, player);
	
	SetAlpha_(player, ALPHA_EXIST);							// ��l���z�u
	SetDir_(player, 210);	
	SetMotion_(player, player_look_left_L, BLEND_XL);		// ��������
	
	// ���J�b�g�W���G�[�X�Ǝ�l���`�`�`�`�`�`�`�`�`�`�`�`�`�`�`
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");
	
	MotionTalk(ace);
	
	//===============================================
	// ���G�[�X
	// �u���̃G���x�[�^�[���@�g����悤�ɂ��邩��
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ACE");
	ShowMsg_("DEMO_109_MSG_150");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetMotion_(ace, MOT_WAIT, BLEND_M);
	
	EndDemo(FADE_COLOR_BLACK);
}
