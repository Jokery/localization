//=============================================
//
//		demo307[B�����N����_4(1��폟��)]
//
//=============================================

//-------------------------------------------------------------------------
//
//		�ǂݍ��݁E�z�u
//
//-------------------------------------------------------------------------
function Update()
{

// �����[�J���ϐ��̐ݒ�
	// �t���O�擾
	local regen;
	
// ���v���C���[�ݒu
	//ID�̎擾
	local player = GetPlayerId_();
	
	//�ݒu
	SetPointPos_(player, "player000");
	
// �����\�[�X�̓ǂݍ���

	//���f���̓ǂݍ���
	local model_aiantrtle = ReadNpc_("m144_00");			// �A�C�A���^�[�g��
	local model_putianon = ReadNpc_("m133_00");				// �v�`�A�[�m��
	local model_puristnight = ReadNpc_("m084_00");			// �v���[�X�g�i�C�g
	local model_bikkurimarion = ReadNpc_("m147_01");		// �s�b�O�}���I��

	//���[�V�����̓ǂݍ���
	local battlewait = ReadMotion_(player, "Player_battle_L");		//�퓬�ҋ@
	local player_battle_L = ReadMotion_(player, "Player_battle_L");
	
	//�G�t�F�N�g�̓ǂݍ���
	LoadEffect_("ef742_01_div_mag_hoimi");// �񕜃G�t�F�N�g
	
// ��NPC�ݒu	
	//�ݒu
	local aiantrtle = ArrangePointNpc_(model_aiantrtle, "npc_aiantrtle000");
	local putianon = ArrangePointNpc_(model_putianon, "npc_putianon000");
	local puristnight = ArrangePointNpc_(model_puristnight, "npc_spuristnight000");
	local bikkurimarion = ArrangePointNpc_(model_bikkurimarion, "npc__bikkurimarion000");
	
	//�����X�^�[�̃X�P�[��
	SetScaleSilhouette(aiantrtle, SCALE.N, SILHOUETTE_WIDTH.S);	
	SetScaleSilhouette(putianon, SCALE.S, SILHOUETTE_WIDTH.S);	
	SetScaleSilhouette(puristnight, SCALE.N, SILHOUETTE_WIDTH.S);	
	SetScaleSilhouette(bikkurimarion, SCALE.S, SILHOUETTE_WIDTH.S);	
	
	//�����̌���
	SetDir_(player, 270);
	
	SetDir_(aiantrtle, 110);
	SetDir_(putianon, 430);
	SetDir_(puristnight, 445);
	SetDir_(bikkurimarion, 95);
	
// �����[�V�����ݒ�
	SetMotion_(player, player_battle_L, BLEND_N);

	
	//��������������������������������������
	//���J�b�g�P
	//��������������������������������������
	
	SetMotion_(player, battlewait, 15);	
	Wait_(30);
	
	// ���J�������_�ݒ�
	SetPointCameraEye_("cameye000");
	
	// ���J���������_�ݒ�
	SetPointCameraTarget_("camtgt000");
		
	StartDemo(FADE_COLOR_BLACK);
	StartDemo(FADE_COLOR_BLACK);
	
	//===============================================
	//���e���W�A
	// �u���݂��Ƃł��@<name_player/>���܁B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_TEREZIA");
	ShowMsg_("DEMO_307_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
		
	//��������������������������������������
	//���J�b�g2
	//��������������������������������������
	
	// BGM��~
	StopBgm_(30);
	
	local task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");		//���퓬�p�̃J�������ۃR�s�ł��Ă��Ȃ��̂ŁA�g����悤�ɂȂ�����ύX���Ă��������B
	
	Wait_(80);
	
	Wait_(2);
	
	DeleteTask_(task_cam);
	
	//��������������������������������������
	//���f���I��
	//��������������������������������������
	
	EncountEndDemo(ENCOUNT_NORMAL);
}