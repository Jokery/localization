//=====================================================================================
//
//		demo102[�Z���^�[�r���ɓ���Ȃ��m�`���[��]
//
//=====================================================================================

//-------------------------------------------------------------------------
//
//		�ǂݍ��݁E�z�u
//
//-------------------------------------------------------------------------
function Update()
{
// ���ϐ���`
	local task_cam, task_player, task_ace, task_jack, task_queen, task_nocho01, task_nocho02, task_nocho03, task_nocho04;
	
// ���t���O�ݒ�
	local bit_ruler = GetEventFlg_("BFG_RULER_ADD_005");			// Bit_205 ���[���ǉ��t���O

// �����\�[�X�Ǎ�
	// �M�~�b�N
	local obj_gate = ReadGimmick_("o_A00_03");		// �V�F���^�[
	local model_window = ReadGimmick_("o_A00_04");	// �Z���^�[�r���̑�
	local model_throne = ReadGimmick_("o_com_05");	// �ʍ�
	local model_ruler = ReadGimmick_("o_com_08");	// ���[���|�C���g
	// �L�����N�^�[
	local player = GetPlayerId_();					// ��l��
	local npc_nocho = ReadNpc_("n000");				// �m�`���[��
	local npc_jack = ReadNpc_("n001");				// �W���b�N
	local npc_ace = ReadNpc_("n002");				// �G�[�X
	local npc_king = ReadNpc_("n003");				// �L���O
	local npc_queen = ReadNpc_("n005");				// �N�C�[��
	// �G�t�F�N�g
	LoadEffect_("ef712_10_emo_surprise01");

// ���z�u
	// �V�F���^�[
	local res_gate = ArrangePointGimmick_("o_A00_03", obj_gate, "obj_shutter000");
	// �Z���^�[�r���̑�
	local window = ArrangePointGimmick_("o_A00_04", model_window, "obj_light000");
	SetMotion_(window, MOT_GIMMICK_0, BLEND_N);
	// �ʍ�
	local throne = ArrangePointGimmick_("o_com_05", model_throne, "obj_throne000");
	SetDir_(throne, 90);
	// ���[���|�C���g
	local ruler = ArrangePointGimmick_("o_com_08", model_ruler, "obj_ruler000");
	// �����[���|�C���g�����ɋN�����Ă����ꍇ
	if (bit_ruler) { SetMotion_(ruler, MOT_GIMMICK_2, BLEND_N); }
	
	// ��l��
	SetPointPos_(player, "player000");
	// �L���O
	local res_king = ArrangePointNpc_(npc_king, "npc_king000");
	// �G�[�X
	local res_ace = ArrangePointNpc_(npc_ace, "npc_ace000");
	// �W���b�N
	local res_jack = ArrangePointNpc_(npc_jack, "npc_jack000");
	// �N�C�[��
	local res_queen = ArrangePointNpc_(npc_queen, "npc_queen000");
	// �m�`���[��
	local res_nocho01 = ArrangePointNpc_(npc_nocho, "npc_nocho000");
	local res_nocho02 = ArrangePointNpc_(npc_nocho, "npc_nocho001");
	local res_nocho04 = ArrangePointNpc_(npc_nocho, "npc_nocho003");

// ����풓���[�V�����Ǎ�
	local player_right = ReadMotion_(player, "Player_look_right_L");	// �v���C���[�E������
	
	local bldgL_king = ReadMotion_(res_king, "n003_look_bldg_L");		// �L���O�Z���^�|�r��������L
	local rightL_king = ReadMotion_(res_king, "n003_look_right_L");		// �L���O�Z���^�|�r��������L
	local talk_king = ReadMotion_(res_king, "n003_talk");				// �L���O�ҋ@����b
	local talkL_king = ReadMotion_(res_king, "n003_talk_L");			// �L���O��b
	local think_king = ReadMotion_(res_king, "n003_think");				// �L���O�ҋ@���l����
	local thinkL_king = ReadMotion_(res_king, "n003_think_L");			// �L���O�l����
	
	local hand_ace = ReadMotion_(res_ace, "n002_hand_up");				// �G�[�X��b�����������
	local handL_ace = ReadMotion_(res_ace, "n002_hand_up_L");			// �G�[�X���������L
	local tlook_upL_ace = ReadMotion_(res_ace, "n002_look_up_L");		// �G�[�X������ҋ@L

// ���������[�V����
	SetMotion_(res_king, bldgL_king, BLEND_N);
	SetMotion_(res_ace,  MOT_WAIT, BLEND_N);
	SetMotion_(player, MOT_WALK, BLEND_N);
	task_player = Task_MoveForward_(player, 1.0, false);
	
	SetDirToObject_(res_jack, res_king);
	SetDirToObject_(res_ace, res_king);
	SetDirToObject_(res_queen, res_king);
	SetDirToObject_(res_nocho04, res_king);
	SetDirToObject_(res_nocho01, res_king);
	SetDirToObject_(res_nocho02, res_king);

// ���J�����ݒ�
	task_cam = Task_AnimeMoveCamera_("anmeye003", "anmtgt003");		// 105F
	WaitLod_();

//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);
	
	Wait_(50);
	
	SetMotion_(player, MOT_WAIT, BLEND_M);
	DeleteTask_(task_player);
	
	local sup_king = SurpriseDisp(res_king);
	SetEffectScale_(sup_king, 1.5);
	Wait_(15);
	
	SetMotion_(res_king, rightL_king, 16);		// �������E����������
	
	task_ace = Task_WalkAroundToPos(res_ace, GetPos_(player), ROTATE_DEMO_DEF);
	Wait_(2);
	task_queen = Task_WalkAroundToPos(res_queen, GetPos_(player), ROTATE_DEMO_DEF);
	Wait_(1);
	task_nocho02 = Task_WalkAroundToPos(res_nocho02, GetPos_(player), ROTATE_DEMO_DEF);
	Wait_(1);
	task_jack = Task_WalkAroundToPos(res_jack, GetPos_(player), ROTATE_DEMO_DEF);
	Wait_(1);
	task_nocho04 = Task_WalkAroundToPos(res_nocho04, GetPos_(player), ROTATE_DEMO_DEF);
	
	WaitTask(task_jack);
	SetMotion_(res_jack, MOT_WAIT, BLEND_M);
	DeleteTask_(task_jack);
	WaitTask(task_ace);
	SetMotion_(res_ace, MOT_WAIT, BLEND_M);
	DeleteTask_(task_ace);
	SetMotion_(res_nocho02, MOT_WAIT, BLEND_M);
	DeleteTask_(task_nocho02);
	WaitTask(task_queen);
	SetMotion_(res_queen, MOT_WAIT, BLEND_M);
	DeleteTask_(task_queen);
	
	//��������������������������������������
	//���J�b�g2�@�L���O�A�b�v
	//��������������������������������������	
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 10);
	WaitFade_();
	
	DeleteTask_(task_cam);
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");
	
	SetMotion_(res_nocho04, MOT_WAIT, BLEND_N);
	DeleteTask_(task_nocho04);
	
	SetPointPos_(player, "player001");
		
	SetMotion_(res_king, MOT_WAIT, BLEND_N);

	SetDirToPlayer_(res_king);
	SetDirToPlayer_(res_ace);
	SetDirToPlayer_(res_jack);
	SetDirToPlayer_(res_queen);
	SetDirToPlayer_(res_nocho01);
	SetDirToPlayer_(res_nocho02);
	SetDirToPlayer_(res_nocho04);
	SetAlpha_(res_nocho04, ALPHA_CLEAR);
	
	SetFade_(FADE_IN, FADE_COLOR_BLACK, 10);
	WaitFade_();
	
	SetMotion_(res_king, talk_king, BLEND_M);	//�b���L���O
	WaitMotion(res_king);
	SetMotion_(res_king, talkL_king, BLEND_M);
	
	// ���L���O
	// �u<name_player/>�I�@�������I
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_KING");
	ShowMsg_("DEMO_102_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	
	SetAlpha_(res_nocho04, ALPHA_EXIST);
	
	//��������������������������������������
	//���J�b�g3�@�V���b�^�[�����グ��
	//��������������������������������������
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");
	
	MotionTalk(res_ace);
	
	// ���G�[�X
	// �u���́@�s�s�S�̂̓d�����@�����Ă���
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ACE");
	ShowMsg_("DEMO_102_MSG_020");
	KeyInputWait_();
	
	SetMotion_(res_king, bldgL_king, BLEND_L);	//���グ��L���O
	
	// �u���Ɂ@�l�Ԃ����邩������ˁ[���Ă̂�
	ShowMsg_("DEMO_102_MSG_030");
	KeyInputWait_();
	CloseMsgWnd_();
	
	SetMotion_(res_ace, MOT_WAIT, BLEND_M);
	
	WaitTask(task_cam);	
	
	DeleteTask_(task_cam);

	//��������������������������������������
	//���J�b�g4�@�G�[�X���W���b�N
	//��������������������������������������
	SetAlpha_(res_queen, ALPHA_CLEAR);										//�N�C�[����\��
	
	SetDirToObject_(res_jack, player);										//�W���b�N�A�G�[�X��l���֌���
	SetDirToObject_(res_ace, player);
	SetDirToObject_(player, res_ace);										//��l���G�[�X�̕�������
	
	task_cam = Task_AnimeMoveCamera_("anmeye004", "anmtgt004");
	
	//���G�[�X
	// �u�����ǁ@�d�����u�̂���@���d�{�݂ւ̓��ɂ�
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ACE");	
	ShowMsg_("DEMO_102_MSG_040");	
	
	SetMotion_(res_ace, MOT_WALK, BLEND_M);									//�G�[�X������
	local task_ace = Task_MoveForward_(res_ace, 1.0, false);				//�G�[�X�ړ�
	
	Wait_(25);
	DeleteTask_(task_ace);
	
	MotionTalk(res_ace);
	KeyInputWait_();
	CloseMsgWnd_();
	SetMotion_(res_ace, MOT_WAIT, BLEND_M);
	
	// ���W���b�N
	// �u<name_player/>�ǂ́@�ǂ������d�{�݂֍s��
	MotionTalk(res_jack);
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_JACK");
	ShowMsg_("DEMO_102_MSG_050");
	
	SetMotion_(player, player_right, BLEND_L);								//��l���W���b�N�̕��i�E�j������
	
	KeyInputWait_();
	CloseMsgWnd_();	
	SetMotion_(res_jack, MOT_WAIT, BLEND_M);
	
	DeleteTask_(task_cam);
	
	//��������������������������������������
	//���J�b�g5�@���d�{��
	//��������������������������������������
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 10);	
	WaitFade_();

	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");
	
	SetFade_(FADE_IN, FADE_COLOR_BLACK, 20);
		
	WaitFade_();
	
	// ���W���b�N
	// �u���̏ꏊ����@���֓��Ȃ�ɐi�񂾐��
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_JACK");	
	ShowMsg_("DEMO_102_MSG_060");
	KeyInputWait_();
	CloseMsgWnd_();
	
	// ���G�[�X
	// �u�k���̂�����Ɂ@�Δ肪���邩��
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ACE");
	ShowMsg_("DEMO_102_MSG_070");
	KeyInputWait_();
	
	ShowMsg_("DEMO_102_MSG_080");
	KeyInputWait_();	
	
	CloseMsgWnd_();
	
	Wait_(20);
	
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 10);
	
	SetMotion_(player, MOT_WAIT, BLEND_M);			//��l���ҋ@
	WaitFade_();
	
	DeleteTask_(task_cam);
	
	//��������������������������������������
	//���J�b�g6�@�L���O�A�b�v
	//��������������������������������������
	SetMotion_(res_king, talkL_king, BLEND_N);
	
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");
	
	SetFade_(FADE_IN, FADE_COLOR_BLACK, 10);
	WaitFade_();
	
	// ���L���O
	// �u�d�������̌��@��낵�����ނ̂ł���B
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_KING");
	ShowMsg_("DEMO_102_MSG_090");
	KeyInputWait_();
	CloseMsgWnd_();
	
	//��������������������������������������
	//���f���I��
	//��������������������������������������
	
	EndDemo(FADE_COLOR_BLACK);
}
