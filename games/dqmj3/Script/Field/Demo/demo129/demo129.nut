//=============================================
//
//		demo129[�G�[�X���ڂ�t�����@�B]
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
	local task_cam, task_player, task_ace;
	local efc_player;
	local rot_ace = Vec3(0, 0, -252.53227);

// �����\�[�X�Ǎ�
	// �M�~�b�N
	local model_mixture = ReadGimmick_("o_A01_02");			// �z�����u
	local model_lift = ReadGimmick_("o_A01_00");			// �z�����u
	// �L�����N�^�[
	local player = GetPlayerId_();					// ��l��
	local model_nocho = ReadNpc_("n000");			// ��ʃm�`���[��
	local model_nocho_fe = ReadNpc_("n004");		// ��ʃm�`���[����
	local model_jack = ReadNpc_("n001");			// �W���b�N
	local model_ace = ReadNpc_("n002");				// �G�[�X
	local model_king = ReadNpc_("n003");			// �L���O
	local model_queen = ReadNpc_("n005");			// �N�C�[��
	local model_rin = ReadNpc_("n043");				// �m�`������
	// �G�t�F�N�g
	LoadEffect_("ef712_10_emo_surprise01");			// �u�I�v
	LoadEffect_("ef712_04_emo_joy01");				// ��сu��v


// ���z�u
	// �z�����u
	local mixture = ArrangePointGimmick_("o_A01_02", model_mixture, "obj000");
	SetMotion_(mixture, MOT_GIMMICK_0, BLEND_M);
	//�G���x�[�^��
	local lift01 = ArrangeGimmick_("o_A01_00", model_lift, Vec3(230.0, 2.0, 0.0));
	SetDir_(lift01, -90);
	SetMotion_(lift01, MOT_GIMMICK_0, BLEND_M);	

	local lift02 = ArrangeGimmick_("o_A01_00", model_lift, Vec3(-230.153, 2.0, 0.0));
	SetDir_(lift02, 90);
	SetMotion_(lift02, MOT_GIMMICK_0, BLEND_M);
	
	// ��l��
	SetPointPos_(player, "player000");
	// �m�`������
	local nocho00 = ArrangePointNpc_(model_rin, "npc_nocho000");
	// �m�`���[���P��
	local nocho01 = ArrangePointNpc_(model_nocho_fe, "npc_nocho001");
	// �m�`���[���Q
	local nocho02 = ArrangePointNpc_(model_nocho, "npc_nocho002");
	// �m�`���[���R
	local nocho03 = ArrangePointNpc_(model_nocho, "npc_nocho003");
	// �m�`���[���S
	local nocho04 = ArrangePointNpc_(model_nocho, "npc_nocho004");
	// �m�`���[���T
	local nocho05 = ArrangePointNpc_(model_nocho, "npc_nocho005");
	// �m�`���[���U
	local nocho06 = ArrangePointNpc_(model_nocho, "npc_nocho006");
	// �m�`���[���V��
	local nocho_fe = ArrangePointNpc_(model_nocho_fe, "npc_nocho_fe000");
	
	// �W���b�N
	local jack = ArrangePointNpc_(model_jack, "npc_jack000");
	// �G�[�X
	local ace = ArrangePointNpc_(model_ace, "npc_ace000");
	// �L���O
	local king = ArrangePointNpc_(model_king, "npc_king000");
	// �N�C�[��
	local queen = ArrangePointNpc_(model_queen, "npc_queen000");

// ����풓���[�V�����Ǎ�
	// ��l��
	local pl_look_down = ReadMotion_(player, "Player_look_down_L");		// �m�`���[��������
	local pl_nod = ReadMotion_(player, "Player_nod");					// �ҋ@�����ȂÂ����ҋ@
	// �G�[�X
	local ac_talk_joy_L = ReadMotion_(ace, "n002_talk_joy_L");			// ��b�@��������
	local ac_run_L = ReadMotion_(ace, "n001_run_L");					// �G�[�X�@����
	local ace_think = ReadMotion_(ace, "n002_think");					// �G�[�X�l����
	local ace_think_L = ReadMotion_(ace, "n002_think_L");				// �G�[�X�l����L
	local ace_arm = ReadMotion_(ace, "n002_arm_folde");					// �G�[�X�l���遨�r�g��
	local ace_arm_L = ReadMotion_(ace, "n002_arm_folde_L");				// �G�[�X�r�g��L	
	local ac_joy = ReadMotion_(ace, "n000_jump_L");						// �G�[�X ��ђ��ˁi��сj
	// �L���O
	local kg_look_bldg_L = ReadMotion_(king, "n003_look_bldg_L");		// �Z���^�|�r��������L
	local kg_look_jack_L = ReadMotion_(king, "n003_look_jack_L");		// �W�����N�̕�������L
	local kg_look_right_L = ReadMotion_(king, "n003_look_right_L");		// �E������L
	local kg_talk = ReadMotion_(king, "n003_talk");						// �ҋ@����b
	local kg_talk_L = ReadMotion_(king, "n003_talk_L");					// ��b
	local kg_think = ReadMotion_(king, "n003_think");					// �ҋ@���l����
	local kg_think_L = ReadMotion_(king, "n003_think_L");				// �l����L

	local nc02_joy = ReadMotion_(nocho02, "n002_talk_joy_L");			// ���u�m�`��2 ��щ�b
	local nc03_joy = ReadMotion_(nocho03, "n002_talk_joy_L");			// ���u�m�`��3 ��щ�b
	local ncfe_joy = ReadMotion_(nocho_fe, "n002_talk_joy_L");			// ���u�m�`���� ��щ�b

	local nc05_joy = ReadMotion_(nocho05, "n002_talk_joy_L");			// ���u�m�`��5 ��щ�b
	local nc06_joy = ReadMotion_(nocho06, "n002_talk_joy_L");			// ���u�m�`��6 ��щ�b

	
// �������G�t�F�N�g
	//��уG�t�F�N�g
	local nc02_ef_joy = SetSelectBoneEffect_("ef712_04_emo_joy01", nocho02, ATTACH_EFFECT1);
	local nc03_ef_joy = SetSelectBoneEffect_("ef712_04_emo_joy01", nocho03, ATTACH_EFFECT1);
	local ncfe_ef_joy = SetSelectBoneEffect_("ef712_04_emo_joy01", nocho_fe, ATTACH_EFFECT1);
	
	local nc05_ef_joy = SetSelectBoneEffect_("ef712_04_emo_joy01", nocho05, ATTACH_EFFECT1);
	local nc06_ef_joy = SetSelectBoneEffect_("ef712_04_emo_joy01", nocho06, ATTACH_EFFECT1);

// ���������[�V����
	SetDirToObject_(nocho02, nocho_fe);										// ���u2���X�̕���
	SetMotion_(nocho02, MOT_TALKLOOP, BLEND_M);								// ���u2�ӂ���b
	
	SetDirToObject_(nocho03, nocho_fe);										// ���u3���X�̕���
	SetMotion_(nocho03, MOT_TALKLOOP, BLEND_M);								// ���u3�ӂ���b
	SetMotion_(nocho_fe, ncfe_joy, BLEND_M);								// ���u����낱�щ�b
	
	SetMotion_(nocho05, nc05_joy, BLEND_M);									// ���u5��낱��
	SetMotion_(nocho06, nc06_joy, BLEND_M);									// ���u6��낱��

// ���J�����ݒ�
	task_cam = Task_AnimeMoveCamera_("anmeye003", "anmtgt003");				// 100F

//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);
	
	// ���J�b�g�P�`�Q���L���O�_���S�i�`�`�`�`�`�`�`�`�`�`�`�`�`
	Wait_(60);
	
	//-----
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 10);
	WaitFade_();
	
	DeleteTask_(task_cam);
	task_cam = Task_AnimeMoveCamera_("anmeye004", "anmtgt004");			// 90F
	
	SetFade_(FADE_IN, FADE_COLOR_BLACK, 10);
	//-----
	
	Wait_(80);
	
	//-----
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 10);
	WaitFade_();
	
	DeleteTask_(task_cam);
	
	//�m�`��������\��
	SetVisible(nocho01, false);
	SetVisible(nocho02, false);
	SetVisible(nocho03, false);
	SetVisible(nocho04, false);
	SetVisible(nocho05, false);
	SetVisible(nocho06, false);
	SetVisible(nocho_fe, false);
	
	//�G�t�F�N�g����
	DeleteEffect_(nc02_ef_joy);
	DeleteEffect_(nc03_ef_joy);
	DeleteEffect_(ncfe_ef_joy);
	DeleteEffect_(nc05_ef_joy);
	DeleteEffect_(nc06_ef_joy);
	
	SetFade_(FADE_IN, FADE_COLOR_BLACK, 10);
	//-----
	
	// ���J�b�g�R���L���O�̑O�ɑS���W���`�`�`�`�`�`�`�`�`�`�`�`
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");			// 100F
	
	SetMotion_(king, kg_look_bldg_L, 30);								// ��������
	Wait_(45);
	SetMotion_(king, kg_look_right_L, 30);								// �E������
	Wait_(45);
	SetMotion_(king, kg_talk, BLEND_XL);								// ��b
	WaitMotion(king);
	SetMotion_(king, kg_talk_L, BLEND_M);								// ��bLOOP
	
	//===============================================
	// ���L���O
	// �u�r���̒��Ɂ@�l�Ԃ̎p�́@�Ȃ������炵���B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_KING");
	ShowMsg_("DEMO_129_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetMotion_(king, MOT_WAIT, BLEND_XL);
	Wait_(10);
	
	task_ace = Task_WalkAroundToPos(ace, rot_ace, 3.0);
	WaitTask(task_ace);
	SetMotion_(ace, MOT_WAIT, BLEND_M);	
	DeleteTask_(task_ace);
	
	Wait_(20);
	
	// ���J�b�g�S���G�[�X�t�o�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`
	SetPointCameraEye_("cameye002");
	SetPointCameraTarget_("camtgt002");
	
	SetAlpha_(player, ALPHA_CLEAR);
	
	SetMotion_(ace, ace_think, BLEND_M);						// �G�[�X�l����
	WaitMotion(ace);
	SetMotion_(ace, ace_think_L, BLEND_M);						// �l����L
	
	//===============================================
	// ���G�[�X
	// �u�r���̋@�\���@�܂������Ă������Ƃ���@�l����
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ACE");
	ShowMsg_("DEMO_129_MSG_020");
	KeyInputWait_();
	
	SetMotion_(ace, ace_arm, BLEND_M);							// �G�[�X�l���遨�r�g��
	WaitMotion(ace);
	SetMotion_(ace, ace_arm_L, BLEND_M);						// �r�g��L
	
	//-----------------------------------------------
	// ��
	// �u����Ȃ���@�����́@�����ƃ{���{���̂͂����B
	//-----------------------------------------------
	ShowMsg_("DEMO_129_MSG_030");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	// ���J�b�g�T���z�����u�Y�[���C���`�`�`�`�`�`�`�`�`�`�`�`�`
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");		// 90F
	WaitTask(task_cam);
	
	DeleteTask_(task_cam);
	
	SetAlpha_(player, ALPHA_EXIST);
	SetDirToObject_(player, ace);
	
	// ���J�b�g�U���G�[�X�Ǝ�l���`�`�`�`�`�`�`�`�`�`�`�`�`�`�`
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");
	
	SetMotion_(player, pl_look_down, BLEND_M);						// �m�`���[��������
	SetMotion_(ace, ac_talk_joy_L, BLEND_M);						// �G�[�X��b�@��������
	
	//===============================================
	// ���G�[�X
	//�u������Ɓ@���ׂĂ��邺�B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ACE");
	ShowMsg_("DEMO_129_MSG_040");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetMotion_(ace, ac_run_L, BLEND_M);								// ����
	task_ace = Task_MoveForward_(ace, 0.8, true);
	Wait_(10);
	DeleteTask_(task_ace);
	
	task_ace = Task_AnimeMove_(ace, "npc_ace_move000");				// 90F
	
	// ���J�b�g�V���L���O�A�b�v�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`
	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");
	
	SetMotion_(king, kg_think, BLEND_M);							// �ҋ@���l����
	WaitMotion(king);
	SetMotion_(king, kg_think_L, BLEND_M);							// �l����LOOP
	
	//===============================================
	// ���L���O
	// �u�����c�c�d���̂Ȃ��z���B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_KING");
	ShowMsg_("DEMO_129_MSG_050");
	
	WaitTask(task_ace);
	SetDirToObject_(player, king);
	
	SetMotion_(ace, ac_joy, BLEND_M);								// �G�[�X��낱��
	DeleteTask_(task_ace);
	
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	// ���J�b�g�W���L���O�Ǝ�l���ƃm�`���[���`�`�`�`�`�`�`�`�`
	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");		// 300F
	
	SetMotion_(king, kg_talk, BLEND_XL);							// ��b
	WaitMotion(king);
	SetMotion_(king, kg_talk_L, BLEND_M);							// ��bLOOP
	
	//===============================================
	// ���L���O
	// �u���܂ʂ��@<name_player/>��B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_KING");
	ShowMsg_("DEMO_129_MSG_060");
	KeyInputWait_();
//	CloseMsgWnd_();	
	//===============================================
	
	SetMotion_(king, kg_look_jack_L, BLEND_XL);						// �W�����N�̕�������L
	Wait_(10);
	
	//===============================================
	// ���L���O
	// �u�]�����́@���̏ꏊ���@���ׂĂ݂悤�B
	//-----------------------------------------------
//	OpenMsgWnd_();
//	SetTalkName_("NAME_TAG_KING");
	ShowMsg_("DEMO_129_MSG_070");
	KeyInputWait_();
	CloseMsgWnd_();	
	//===============================================
	
	SetMotion_(king, MOT_WAIT, BLEND_XL);
	Wait_(10);
	
	SetMotion_(player, pl_nod, BLEND_L);							// �ҋ@�����ȂÂ����ҋ@
	WaitMotion(player);
	SetMotion_(player, MOT_WAIT, BLEND_L);
	
	EndDemo(FADE_COLOR_BLACK);
}
