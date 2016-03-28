//=============================================
//
//		demo308[B�����N����_5(2��폟��)]
//
//=============================================
function Update()
{
	// BGM�ݒ�
	StopBgm_(0);
	
	//=====================================
	//���[�J���ϐ��̐ݒ�
	//=====================================
	
	//��������������������������������������
	//���J�b�g�P
	//��������������������������������������
	
	
	//=====================================
	//�J�����ݒ�
	//=====================================
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");
	
	//=====================================
	//�v���C���[�ݒu
	//=====================================
	
	//ID�̎擾
	local player = GetPlayerId_();
	
	//�ݒu
	SetPointPos_(player, "player000");
	
	//�����̌���
//	SetDir_(player, -90);
	
	//���[�V�����Ǎ�
	local battlewait = ReadMotion_(player, "Player_battle_L");
	
	//�����̃��[�V����
	SetMotion_(player, battlewait, BLEND_N);
	
	//=====================================
	//NPC�ݒu
	//=====================================
	
	//���\�[�X�̓ǂݍ���
	local model_octreach = ReadNpc_("m136_00");			// �I�N�g���[�`
	local model_bigsquid = ReadNpc_("m138_00");			// �剤�C�J
	local model_chargeish = ReadNpc_("m140_00");		// �Ƃ�������
	
	
	//�ݒu
	local octreach = ArrangePointNpc_(model_octreach, "npc_octreach");
	local bigsquid = ArrangePointNpc_(model_bigsquid, "npc_bigsquid");
	local chargeish = ArrangePointNpc_(model_chargeish, "npc_chargeish");
	
	//�T�C�Y�ݒ�
	SetScaleSilhouette(octreach, SCALE.S, SILHOUETTE_WIDTH.S);
	SetScaleSilhouette(bigsquid, SCALE.M, SILHOUETTE_WIDTH.M);
	SetScaleSilhouette(chargeish, SCALE.N, SILHOUETTE_WIDTH.N);
	
	//=====================================
	//���[�V�����̓ǂݍ���
	//=====================================
	
	
	//=====================================
	//�t�F�[�h�C��
	//=====================================
	StartDemo(FADE_COLOR_BLACK);
	
	//===============================================
	//���e���W�A
	//�u�Q��ڂ̏����@���߂łƂ��������܂��B
	//�@���悢��@���Ł@�Ō�ƂȂ�܂��B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_TEREZIA");
	ShowMsg_("DEMO_308_MSG_010");
	KeyInputWait_();
	//===============================================
	
	//===============================================
	//���e���W�A
	//�u���f����邱�ƂȂ�
	//�@�Ō�܂Ł@���������������܂��B
	//-----------------------------------------------
	ShowMsg_("DEMO_308_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	//��������������������������������������
	//���J�b�g2
	//��������������������������������������
	
	local task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");		//���퓬�p�̃J�������ۃR�s�ł��Ă��Ȃ��̂ŁA�g����悤�ɂȂ�����ύX���Ă��������B
	
	Wait_(80);
	
	Wait_(2);
	WaitTask(task_cam);
	DeleteTask_(task_cam);
	
	EncountEndDemo(ENCOUNT_NORMAL);
}