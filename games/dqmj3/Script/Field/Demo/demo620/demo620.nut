//=============================================
//
//		demo620[�Ō�̃p���[_4(1��폟��)]
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
	local player = GetPlayerId_();						// ��l��
	local model_fankidorago = ReadNpc_("m019_02");		// �t�@���L�[�h���S
	local model_captendorago = ReadNpc_("m019_03");		// �L���v�e���h���S
	local model_doragonkis = ReadNpc_("m021_00");		// �h���S���L�b�Y
	local model_merakthedo = ReadNpc_("m021_01");		// �������U�[�h
	

// ���z�u
	// ��l��
	SetPointPos_(player, "player000");


	// ��NPC�ݒu	
	// �ݒu
	local fankidorago = ArrangePointNpc_(model_fankidorago, "npc_fankidorago000");
	local captendorago = ArrangePointNpc_(model_captendorago, "npc_captendorago000");
	local doragonkis = ArrangePointNpc_(model_doragonkis, "npc_doragonkis000");
	local merakthedo = ArrangePointNpc_(model_merakthedo, "npc_merakthedo000");
	
	//�������X�^�[�̃X�P�[��
	SetScaleSilhouette(fankidorago, SCALE.S, SILHOUETTE_WIDTH.S);	
	SetScaleSilhouette(captendorago, SCALE.S, SILHOUETTE_WIDTH.S);	
	SetScaleSilhouette(doragonkis, SCALE.S, SILHOUETTE_WIDTH.S);	
	SetScaleSilhouette(merakthedo, SCALE.S, SILHOUETTE_WIDTH.S);	
	
	//�����[�V�����̓ǂݍ���
	local battlewait = ReadMotion_(player, "Player_battle_L");		// �퓬�ҋ@

// ����풓���[�V�����Ǎ�
	local player_battle_L = ReadMotion_(player, "Player_battle_L");

	//�����[�V�����̎��s
	SetMotion_(player, battlewait, 15);	
	Wait_(30);
// ���J�����ݒ�
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");

//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);
	
	//===============================================
	// ���e���W�A
	// �u���݂��Ƃł��@<name_player/>���܁B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_TEREZIA");
	ShowMsg_("DEMO_620_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	local task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");
	Wait_(80);
	
	Wait_(2);
	
	DeleteTask_(task_cam);
	
	EncountEndDemo(ENCOUNT_NORMAL);
}