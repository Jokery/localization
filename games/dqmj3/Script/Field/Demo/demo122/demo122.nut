//=============================================
//
//		demo122[�L���O�ɏ󋵂��]
//
//=============================================
function Update()
{
	//=====================================
	//���[�J���ϐ��̐ݒ�
	//=====================================
	local task_cam, task_player, task_ace, task_king;
	local efc_jack;
	
	//=====================================
	//�v���C���[�ݒu
	//=====================================
	
	//ID�̎擾
	local player = GetPlayerId_();
	
	//�ݒu
	SetPointPos_(player, "player000");
	
	//�����̌���
	SetDir_(player, 180);
	
	//�����̃��[�V����
	SetMotion_(player, MOT_WAIT, 15);
	
	//���l�̎蓮�ݒ�
	SetManualCalcAlpha_(player, true);
	
	//�����̃��l
	SetAlpha_(player, 1.0);
	
	//=====================================
	//NPC�ݒu
	//=====================================
	
	//���\�[�X�̓ǂݍ���
	local npc_ace = ReadNpc_("n002");										// �G�[�X
	local npc_king = ReadNpc_("n003");										// �L���O
	local model_jack = ReadNpc_("n001");									// �W���b�N
	local model_qween = ReadNpc_("n005");									// �N�C�[��
	// �M�~�b�N
	local model_mixture = ReadGimmick_("o_A01_02");							// �z�����u
	local model_lift = ReadGimmick_("o_A01_00");			// �G���x�[�^��
	//�ݒu
	local res_ace = ArrangePointNpc_(npc_ace, "npc_ace000");
	local res_king = ArrangePointNpc_(npc_king, "npc_king000");
	local res_qween = ArrangePointNpc_(model_qween, "npc_queen000");
	local res_jack = ArrangePointNpc_(model_jack, "npc_jack000");
	SetStepSe_(res_jack, SILENT_STEP_SE);									// �����𖳉��ɂ���
	
	// �z�����u
	local mixture = ArrangePointGimmick_("o_A01_02", model_mixture, "obj_mixture000");
	
	//�G���x�[�^��
	local lift01 = ArrangeGimmick_("o_A01_00", model_lift, Vec3(230.0, 2.0, 0.0));
	SetDir_(lift01, -90);
	SetMotion_(lift01, MOT_GIMMICK_0, BLEND_M);	

	local lift02 = ArrangeGimmick_("o_A01_00", model_lift, Vec3(-230.153, 2.0, 0.0));
	SetDir_(lift02, 90);
	SetMotion_(lift02, MOT_GIMMICK_0, BLEND_M);
	
	
	//�����̌���
	SetDir_(res_ace, 180);
	SetDir_(res_king, 0);
	local task_rotate = Task_RotateToPos_(res_qween, GetPos_(res_ace), 172);	
	local task_rotate2 = Task_RotateToPos_(res_jack, GetPos_(res_ace), 172);	
	
	//���l�̎蓮�ݒ�
	SetManualCalcAlpha_(res_ace, true);
	
	//�����̃��l
	SetAlpha_(res_ace, 1.0);
	
	//=====================================
	//���[�V�����̓ǂݍ���
	//=====================================
	
	local look_left = ReadMotion_(player, "Player_look_left_L");			// ��l�����������������
	local think_king = ReadMotion_(res_king, "n003_think");					//�L���O�ҋ@���l����
	local thinkL_king = ReadMotion_(res_king, "n003_think_L");				//�L���O�l����
	local nod_king = ReadMotion_(res_king, "n003_nod");						//�L���O�l����
	local look_jack_king = ReadMotion_(res_king, "n003_look_jack");			//�L���O�W���b�N���߂�
	local look_jackL_king = ReadMotion_(res_king, "n003_look_jack_L");		//�L���O�W���b�N���߂�
	
	local joytalk_ace = ReadMotion_(res_ace, "n002_talk_joy_L");			//�G�[�X���������ɘb��
	local stand_ace = ReadMotion_(res_ace, "n002_stand01");					//�G�[�X��b���W�����v���ҋ@
	local lookplayer_ace = ReadMotion_(res_ace, "n002_look_player");		//�G�[�X�ҋ@����l��������
	local lookplayerL_ace = ReadMotion_(res_ace, "n002_look_player_L");		//�G�[�X��l��������
	local think_ace = ReadMotion_(res_ace, "n002_think");					//�G�[�X�l����
	local think_aceL = ReadMotion_(res_ace, "n002_think_L");				//�G�[�X�l����L
	local nocho_arm_folde_L = ReadMotion_(res_ace, "n000_arm_folde_L");		// �r�g��L
	
	local jack_impatienceL = ReadMotion_(res_jack, "n001_impatience_L");	//�W���b�N�ł�
	local jack_runL = ReadMotion_(res_jack, "n001_run_L");					//�W���b�N����
	
	//�����̃��[�V����
	SetMotion_(res_king, MOT_WAIT, BLEND_M);
	
	//=====================================
	//�G�t�F�N�g�̓ǂݍ���
	//=====================================
	LoadEffect_("ef712_13_emo_sweat01");			// ��
	
	//��������������������������������������
	//���J�b�g1 �S�̕`��
	//��������������������������������������
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");
	
	//=====================================
	//�t�F�[�h�C��
	//=====================================
	StartDemo(FADE_COLOR_BLACK);
	
	MotionTalk(res_ace);
	
	//===============================================
	// ���G�[�X
	// �u�L���O�@�������ܖ߂������I
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ACE");
	ShowMsg_("DEMO_122_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	//��������������������������������������
	//���J�b�g2�@�G�[�X�A�b�v
	//��������������������������������������
	DeleteTask_(task_cam);
	
	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");
	
	SetMotion_(res_ace, joytalk_ace, BLEND_N);
	
	//-----------------------------------------------
	// ��
	// �u�������ɂ́@��n�𓮂������u�������Ăȁc�c
	// �@�����̌�쓮�Ł@�n�k���N���Ă����炵���B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ACE");
	ShowMsg_("DEMO_122_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	SetMotion_(res_ace, MOT_WAIT, BLEND_XL);					// �G�[�X�ҋ@
	Wait_(10);
	DeleteTask_(task_cam);

//	
	//��������������������������������������
	//���J�b�g3 �L���O�A�b�v
	//��������������������������������������
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");
	
	SetMotion_(res_king, nod_king, BLEND_L);
	WaitMotion(res_king);
	SetMotion_(res_king, MOT_WAIT, BLEND_L);
	
	//===============================================
	// ���L���O
	// �u�����c�c�Ȃ�Ɓ@�傫�Ȕ��z�ł��邩�I
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_KING");
	ShowMsg_("DEMO_122_MSG_080");
	KeyInputWait_();
	//===============================================
	
	//===============================================
	// ���L���O
	// �u�������@��쓮�Ƃ́c�c�B
	// �@�G�[�X��@���́@�������̂ł��邩�H
	//-----------------------------------------------
	ShowMsg_("DEMO_122_MSG_090");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetMotion_(player, look_left, BLEND_L);			//��l���G�[�X����
	
	//�W���b�N���ړ�	
	SetPointPos_(res_jack, "npc_jack001");
	
	//��������������������������������������
	//���J�b�g4�@�G�[�X�A�W���b�N
	//��������������������������������������
	task_cam = Task_AnimeMoveCamera_("anmeye003", "anmtgt003");

	local task_step = Task_ChangeStepSe(res_jack, "SE_FLD_011", 8);						//��SE:�m�`���[���ړ�
	Wait_(8);
	//===============================================
	// ���W���b�N
	// �u���c�c�����I�@�厖�Ȃ̂́@����ł��I
	// �@�܂��@�n�k���N�����Ắ@���܂�܂��񂼁I
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_JACK");
	ShowMsg_("DEMO_122_MSG_100");	

	SetMotion_(res_jack, jack_runL, BLEND_M);											//�W���b�N����
	local task_jack = Task_MoveForward_(res_jack, 1.0, true);							//�W���b�N�J�����C��
	efc_jack = SetSelectBoneEffect_("ef712_13_emo_sweat01", res_jack, ATTACH_EFFECT2);	// ��
	
	local task_ace = Task_WalkAroundToPos(res_ace, GetPos_(res_jack), ROTATE_DEMO_DEF);
	local task_player = Task_WalkAroundToPos(player, GetPos_(res_jack), ROTATE_DEMO_DEF);

	WaitTask(task_ace);
	WaitTask(task_player);
	
	DeleteTask_(task_ace);
	SetMotion_(res_ace, MOT_WAIT, BLEND_M);					// �G�[�X�ҋ@
	
	DeleteTask_(task_player);	
	SetMotion_(player, MOT_WAIT, BLEND_M);					// ��l���ҋ@
	
	DeleteTask_(task_jack);
	SetMotion_(res_jack, jack_impatienceL, BLEND_M);
	DeleteTaskStepSe(res_jack, task_step);
	
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetMotion_(res_ace, nocho_arm_folde_L, BLEND_L);						//�r�g��L

	//===============================================
	// ���G�[�X
	// �u���[��c�c�@�B�́@���肵�Ă���
	// �@�����@�n�k�́@�N����Ȃ��Ǝv�����B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ACE");
	ShowMsg_("DEMO_122_MSG_110");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	SetMotion_(res_king, look_jackL_king, BLEND_M);			//�L���O�@�W���b�N�̕�������
	
	DeleteTask_(task_cam);
	
	//��������������������������������������
	//���J�b�g5�@�L���O�A�W���b�N
	//��������������������������������������	
	task_cam = Task_AnimeMoveCamera_("anmeye004", "anmtgt004");
	
	SetDirToObject_(player, res_king);						//��l�� �L���O�̕�������
	SetDirToObject_(res_ace, res_king);						//�G�[�X �L���O�̕�������	
	SetDirToObject_(res_jack, res_king);					//�W���b�N �L���O�̕�������	
	
	SetMotion_(res_jack, MOT_WAIT, BLEND_M);
	DeleteEffect_(efc_jack);
	
	SetMotion_(res_ace, MOT_WAIT, BLEND_M);

	//===============================================
	// ���L���O
	// �u�W���b�N��c�c�G�[�X���@���������Ȃ��
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_KING");
	ShowMsg_("DEMO_122_MSG_120");
	KeyInputWait_();
	ShowMsg_("DEMO_122_MSG_130");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetPointPos_(player, "player001");
	SetPointPos_(res_ace, "npc_ace001");
	SetDir_(player, 180);
	SetDir_(res_ace, 180);
	
	SetMotion_(res_king, MOT_WAIT, BLEND_L);
	SetAlpha_(res_king, ALPHA_CLEAR);
	
	DeleteTask_(task_cam);
	
	//��������������������������������������
	//���J�b�g6�@��l���A�G�[�X
	//��������������������������������������	
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");
	
	SetMotion_(res_ace, MOT_TALKLOOP, BLEND_M);
	
	//===============================================
	// ���G�[�X
	// �u�L���O�I�@���������������Ƃ���Łc�c�I
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ACE");
	ShowMsg_("DEMO_122_MSG_140");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetMotion_(res_ace, MOT_WAIT, BLEND_M);
	
	//===============================================
	// ���L���O
	// �u���ށB���́@���łɏo���Ă���B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_KING");
	ShowMsg_("DEMO_122_MSG_150");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetMotion_(res_ace, stand_ace, BLEND_M);	
	
	//===============================================
	// ���G�[�X
	// �u���������I�@�����ɂł��@���^�]���Ă݂�I
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ACE");
	ShowMsg_("DEMO_122_MSG_160");
	
	WaitMotion(res_ace);
	
	SetMotion_(res_ace, lookplayer_ace, BLEND_M);	
	WaitMotion(res_ace);
	SetMotion_(res_ace, lookplayerL_ace, BLEND_M);
	
	SetMotion_(player, look_left, BLEND_L);				//��l���G�[�X������
	
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	//��������������������������������������
	//���f���I��
	//��������������������������������������
	
	EndDemo(FADE_COLOR_BLACK);
}