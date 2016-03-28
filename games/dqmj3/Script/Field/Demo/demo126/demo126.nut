//=============================================
//
//		demo126[���������K�[�h�}�X�^�[]
//
//=============================================
function Update()
{

// ���ϐ���`
	local task_cam, task_player, task_ace;
	local efc_ace;
	
// �����\�[�X�Ǎ�
	local player = GetPlayerId_();
	local model_guard = ReadNpc_("m121_00");	// ���K�[�h�}�X�^�[�̃��f�����������Ȃ̂ŃL���[�}�V���Q�ő�p���Ă��܂��B
	local model_ace = ReadNpc_("n002");			// �G�[�X
	
	local model_door = ReadGimmick_("o_A03_00");
	
	LoadEffect_("ef712_01_emo_notice01");		// �C�Â�
	LoadEffect_("ef812_01_off_monoeye");		// ���m�A�C����
	
// ���z�u
	SetPointPos_(player, "player000");
	
	local guard = ArrangePointNpc_(model_guard, "npc_guard000");
	SetScaleSilhouette(guard, SCALE.M, SILHOUETTE_WIDTH.M);
	SetDir_(guard, 180);
	
	local ace = ArrangePointNpc_(model_ace, "npc_ace000");
	
	local door000 = ArrangePointGimmick_("o_A03_00", model_door, "obj_door000");
	local monoeye_OFF = SetSelectBoneEffect_("ef812_01_off_monoeye", guard, ATTACH_GLOBAL);
	
// ����풓���[�V�����Ǎ�
	local player_look_walk_L = ReadMotion_(player, "Player_look_walk_L");		// �L�����L��������
	local player_look_around_L = ReadMotion_(player, "Player_look_around_L");	// �L�����L����L
	local player_battle_L = ReadMotion_(player, "Player_battle_L");				// �퓬�ҋ@
	local guard_stop_L = ReadMotion_(guard, "m121_00_stop_L");					// �Î~L
	local ace_surprise = ReadMotion_(ace, "n000_surprise");						// ����
	local ace_shock_L = ReadMotion_(ace, "n000_shock_L");						// ����L�i�����镗�j
	local ace_run_L = ReadMotion_(ace, "n001_run_L");							// ����
	local ace_look_araund02_L = ReadMotion_(ace, "n002_look_araund02_L");		// �ӂ������2L
	
// �������̃��[�V����
	SetMotion_(guard, guard_stop_L, BLEND_N);		// ���K�[�h�}�X�^�[�Î~���[�V����
	
// ���J�����ݒ�
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");
	
//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);
	
	SetMotion_(door000, MOT_GIMMICK_1, BLEND_N);	// �d�q�h�A(�J��);
	PlaySE_("SE_DEM_041");
	
	Wait_(15);
	SetMotion_(ace, ace_run_L, BLEND_M);			// ����
	Wait_(2);
	task_ace = Task_MoveForward_(ace, 0.6, true);
	
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 10);
	WaitFade_();
	
	Wait_(10);
	SetMotion_(door000, MOT_GIMMICK_2, BLEND_N);	// �d�q�h�A(�J�������);
	
	//��������������������������������������
	//���J�b�g2
	//��������������������������������������
	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");
	
	SetPointPos_(ace, "npc_ace001");
	SetMotion_(ace, ace_look_araund02_L, BLEND_N);	// �ӂ������2L
	DeleteTask_(task_ace);
	
	SetPointPos_(player, "player001");
	SetMotion_(player, player_look_walk_L, BLEND_N);// �L�����L��������
	task_player = Task_MoveForward_(player, 1.0, false);
	
	SetFade_(FADE_IN, FADE_COLOR_BLACK, 10);
	
	Wait_(35);
	SetMotion_(player, player_look_around_L, BLEND_L);// �L�����L����L
	DeleteTask_(task_player);
	
	//�G�[�X�u�悤�₭�@���̕����Ɂ@���ꂽ���B
	OpenMsgWnd_();	
	SetTalkName_("NAME_TAG_ACE");
	ShowMsg_("DEMO_126_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	
	//��������������������������������������
	//���J�b�g3
	//��������������������������������������
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");
	Wait_(90);
	
	SetAlpha_(ace, ALPHA_CLEAR);		// �G�[�X��\��
	SetAlpha_(player, ALPHA_CLEAR);		// ��l����\��
	
	WaitTask(task_cam);
	DeleteTask_(task_cam);
	
	SetPointPos_(player, "player002");
	SetPointPos_(ace, "npc_ace002");
	
	SetAlpha_(ace, ALPHA_EXIST);		// �G�[�X�\��
	SetAlpha_(player, ALPHA_EXIST);		// ��l���\��
	
	//��������������������������������������
	//���J�b�g4
	//��������������������������������������
	SetPointCameraEye_("cameye002");
	SetPointCameraTarget_("camtgt002");
	
	SetMotion_(player, player_battle_L, BLEND_M);	// �퓬�ҋ@LOOP
	
	//�G�[�X�u�ǂ킠���I�@�Ȃ񂩁@���邼���I�H
	OpenMsgWnd_();	
	SetTalkName_("NAME_TAG_ACE");
	ShowMsg_("DEMO_126_MSG_020");
	
	SetMotion_(ace, ace_surprise, BLEND_M);			// �ʏ�ҋ@������
	efc_ace = SetSelectBoneEffect_("ef712_01_emo_notice01", ace, ATTACH_EFFECT2);	// �C�Â�
	WaitMotion(ace);
	DeleteEffect_(efc_ace);
	SetMotion_(ace, ace_run_L, BLEND_M);			// ����
	task_ace = Task_AnimeMove_(ace, "anm_ace000");
	WaitTask(task_ace);
	DeleteTask_(task_ace);
	
	task_ace = Task_RotateToPos_(ace, GetPos_(player), 17.2);
	WaitTask(task_ace);
	SetMotion_(ace, ace_shock_L, BLEND_L);			// ����L�i�����镗�j
	DeleteTask_(task_ace);
	
	KeyInputWait_();
	CloseMsgWnd_();
	
	//��������������������������������������
	//���f���I��
	//��������������������������������������
	
	EndDemo(FADE_COLOR_BLACK);
}
