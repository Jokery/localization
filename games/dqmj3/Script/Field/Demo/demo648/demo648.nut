//=============================================
//
//		demo648[�K���}�U�[�h�폟��_7(��-����)]
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
	local task_cam, task_player, task_ace, task_jack, task_king, task_hunter, task_nocho;
	local efc_player, efc_cam, efc_catastrophe000;

// �����Ԑݒ�
	SetTime_(8700);								//��

// �����\�[�X�Ǎ�
	// �L�����N�^�[
	local player = GetPlayerId_();													// ��l��
	local model_nocho = ReadNpc_("n043");			// �m�`������
	local model_nocho_female = ReadNpc_("n004");	// ��ʃm�`���[���i���j
	local model_jack = ReadNpc_("n001");			// �W���b�N
	local model_ace = ReadNpc_("n002");				// �G�[�X
	local model_king = ReadNpc_("n003");			// �L���O
	local model_queen = ReadNpc_("n005");			// �N�C�[��
	local model_hunter = ReadNpc_("n006");			// ���A�N�^�[�n���^�[
	// �M�~�b�N�ǂݍ���
	local obj_center = ReadGimmick_("o_A00_04");									// �Z���^�[�r���̖�����
	// �G�t�F�N�g�ǂݍ���
	LoadEffect_("ef864_04_catastrophe01");											// ᏋC
	LoadEffect_("ef864_05_catastrophe02");											// �V�g�̂͂���
	LoadEffect_("ef220_08_hikarinohadou");											// �Ђ���̔g��

// ���z�u
	//�m�`���[��
	local nochorin = ArrangePointNpc_(model_nocho, "npc_nocho000");				// �m�`������
	local nocho = ArrangePointNpc_(model_nocho_female, "npc_nocho100");			// �m�`����
	local jack = ArrangePointNpc_(model_jack, "npc_jack000");					// �W���b�N
	local ace = ArrangePointNpc_(model_ace, "npc_ace000");						// �G�[�X
	local king = ArrangePointNpc_(model_king, "npc_king000");					// �L���O
	local queen = ArrangePointNpc_(model_queen, "npc_queen000");				// �N�C�[��
	SetStepSe_(queen, SILENT_STEP_SE);
	local hunter = ArrangePointNpc_(model_hunter, "npc_hunter000");				// �n���^�[
	//�M�~�b�N
	local center = ArrangePointGimmick_("o_A00_04",obj_center, "obj_center000");
	SetMotion_(center, MOT_GIMMICK_1, BLEND_M);										// �Z���^�[�r���̖�����@�_��

// ����풓���[�V�����Ǎ�
	//�m�`���[��
	local ace_joy = ReadMotion_(ace, "n002_talk_joy_L");			// �G�[�X�@��������
	local ace_run = ReadMotion_(ace, "n001_run_L");					// �G�[�X ����L
	local jack_joy = ReadMotion_(jack, "n001_rejoice_L");			// �W���b�N�@��������
	local hunter_run = ReadMotion_(hunter, "n001_run_L");			// �n���^�[ ����L
	local nocho_jump = ReadMotion_(nochorin, "n002_talk_joy_L");	// �m�`������ ��ђ��˂�L
	local nocho_look_up = ReadMotion_(nocho, "n002_look_up_L");		// �m�`����������ҋ@L
	local queen_look_up = ReadMotion_(queen, "n002_look_up_L");		// �N�C�[��������ҋ@L
	local queen_nod = ReadMotion_(queen, "n001_nod");				// �N�C�[�����ȂÂ�	

	//�L���O
	local king_stick = ReadMotion_(king, "n003_stick_up");		// �ʏ�ҋ@�������������
	local king_stick_L = ReadMotion_(king, "n003_stick_up_L");	// �����������L

//	���������[�V����
	SetMotion_(jack, jack_joy, BLEND_N); 
	SetMotion_(nochorin, nocho_jump, BLEND_N);
	SetMotion_(nocho, nocho_look_up, BLEND_N);
	SetMotion_(queen, queen_look_up, BLEND_N);

//	�������G�t�F�N�g
	efc_catastrophe000 = SetCameraEffect_("ef864_04_catastrophe01", 100);			// ᏋC

//	���J�����ݒ�
	ReadWaitingLod("cameye000", "camtgt000");										//Lod�Ǎ�
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");


//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------

	//��������������������������������������
	//���J�b�g1 �����S�i
	//��������������������������������������

	StartDemoNoFade(FADE_COLOR_WHITE);

	efc_cam = SetCameraEffect_("ef220_08_hikarinohadou", 100);					//�g��
	SetEffectScale_(efc_cam, 4.0);
	PlaySE_("SE_DEM_192");
	DeleteEffectEmitter_(efc_catastrophe000);									//ᏋC����
	ChangeTime(0, 30, 8700);													//�邩�璋��

	// �V�g�̂͂���
	local efc_catastrophe000 = SetPointWorldEffect_("ef864_05_catastrophe02", "efc_catastrophe000");
	local efc_catastrophe001 = SetPointWorldEffect_("ef864_05_catastrophe02", "efc_catastrophe001");
	local efc_catastrophe002 = SetPointWorldEffect_("ef864_05_catastrophe02", "efc_catastrophe002");
	local efc_catastrophe005 = SetPointWorldEffect_("ef864_05_catastrophe02", "efc_catastrophe005");

	SetEffectScale_(efc_catastrophe000, 4.5);
	SetEffectScale_(efc_catastrophe001, 4.5);
	SetEffectScale_(efc_catastrophe002, 3.8);
	SetEffectScale_(efc_catastrophe005, 5.5);

	WaitTask(task_cam);
	//........................................................................................................

	SetFade_(FADE_OUT, FADE_COLOR_WHITE, 30);													//�t�F�[�h�A�E�g
	DeleteEffectEmitter_(efc_catastrophe000);									//�V�g�̒�����
	DeleteEffectEmitter_(efc_catastrophe001);									//�V�g�̒�����
	DeleteEffectEmitter_(efc_catastrophe002);									//�V�g�̒�����
	DeleteEffectEmitter_(efc_catastrophe005);									//�V�g�̒�����

	local efc_catastrophe003 = SetPointWorldEffect_("ef864_05_catastrophe02", "efc_catastrophe003");
	local efc_catastrophe004 = SetPointWorldEffect_("ef864_05_catastrophe02", "efc_catastrophe004");
	local efc_catastrophe006 = SetPointWorldEffect_("ef864_05_catastrophe02", "efc_catastrophe006");
	local efc_catastrophe007 = SetPointWorldEffect_("ef864_05_catastrophe02", "efc_catastrophe007");

	SetEffectScale_(efc_catastrophe003, 3.5);
	SetEffectScale_(efc_catastrophe004, 3.5);
	SetEffectScale_(efc_catastrophe006, 3.5);
	SetEffectScale_(efc_catastrophe007, 4.0);

	WaitFade_();
	ReadWaitingLod("cameye001", "camtgt001");										//Lod�Ǎ�
	SetMotion_(hunter, hunter_run, BLEND_N); 	
	task_hunter = Task_MoveForward_(hunter, 0.8, true);


	//��������������������������������������
	//���J�b�g2�@�m�`���[������
	//��������������������������������������

	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");

	SetFade_(FADE_IN, FADE_COLOR_WHITE, 30);													//�t�F�[�h�C��
	//........................................................................................................
	Wait_(20);
	SetMotion_(hunter, MOT_WAIT, BLEND_M); 										//�n���^�[����
	DeleteTask_(task_hunter);

	WaitTask(task_cam);
	task_nocho = Task_WalkAroundToPos(queen, GetPos_(king), 5.7);				//�N�C�[���@�L���O�Ɍ������ȂÂ�
	WaitTask(task_nocho);
	SetMotion_(queen, MOT_WAIT, BLEND_L);

	SetMotion_(king, king_stick, BLEND_XL);										//�L���O��
	WaitMotion(king);
	SetMotion_(king, king_stick_L, BLEND_M);

	Wait_(50);
	SetEffectScale_(efc_catastrophe004, 3.0);
	SetEffectScale_(efc_catastrophe006, 2.0);
	SetEffectScale_(efc_catastrophe007, 3.0);


	//��������������������������������������
	//���J�b�g3�@�G�[�X�A�m�`������
	//��������������������������������������

	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");

	SetMotion_(ace, ace_joy, BLEND_L);
	Wait_(180);

	EndDemo(FADE_COLOR_WHITE);
}
