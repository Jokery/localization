//=============================================
//
//		demo510[�`�����N����_4(1��폟��)]
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
	local model_dorodorian = ReadNpc_("m104_03");		//�h���h���A��
	local model_baronnaito = ReadNpc_("m112_02");		//�o�����i�C�g
	local model_ailonkuku = ReadNpc_("m119_02");		//�A�C�A���N�b�N
	local model_togezyobo = ReadNpc_("m127_02");		//�Ƃ��W���{�[

// ���z�u
	// ��l��
	SetPointPos_(player, "player000");

	// ��NPC�ݒu
	//�ݒu
	local dorodorian = ArrangePointNpc_(model_dorodorian, "npc_dorodorian000");
	local baronnaito = ArrangePointNpc_(model_baronnaito, "npc_baronnaito000");
	local ailonkuku = ArrangePointNpc_(model_ailonkuku, "npc_ailonkuku000");
	local togezyobo = ArrangePointNpc_(model_togezyobo, "npc_togezyobo000");

	//�������X�^�[�̃X�P�[��
	SetScaleSilhouette(dorodorian, SCALE.N, SILHOUETTE_WIDTH.N);	
	SetScaleSilhouette(baronnaito, SCALE.N, SILHOUETTE_WIDTH.N);	
	SetScaleSilhouette(ailonkuku, SCALE.S, SILHOUETTE_WIDTH.S);	
	SetScaleSilhouette(togezyobo, SCALE.S, SILHOUETTE_WIDTH.S);	

//�����[�V�����̓ǂݍ���
	local battlewait = ReadMotion_(player, "Player_battle_L");		//�퓬�ҋ@

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
	//���e���W�A
	//�u���݂��Ƃł��@<name_player/>���܁B
	//�@�����ā@�Q��ڂ��@�J�n�������܂��B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_TEREZIA");
	ShowMsg_("DEMO_510_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	local task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");
	Wait_(82);
	DeleteTask_(task_cam);

	EncountEndDemo(ENCOUNT_NORMAL);
}
