//=============================================
//
//		demo512[�`�����N����_5(2��폟��)]
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

	local model_kimendousi = ReadNpc_("m076_01");		//���߂�ǂ���
	local model_gamegonlood = ReadNpc_("m024_01");		//�K���S�����[�h
	local model_nizikujac = ReadNpc_("m061_00");		//�ɂ������Ⴍ


// ���z�u
	// ��l��
	SetPointPos_(player, "player000");

	local kimendousi = ArrangePointNpc_(model_kimendousi, "npc_nizikujac000");					//�ʒu���Ԉ���Ă��邽�߁A�ɂ������Ⴍ�Ɠ���ւ�
	local gamegonlood = ArrangePointNpc_(model_gamegonlood, "npc_gamegonlood000");
	local nizikujac = ArrangePointNpc_(model_nizikujac, "npc_kimendousi000");					//�ʒu���Ԉ���Ă��邽�߁A���߂�ǂ����Ɠ���ւ�

	//�������X�^�[�̃X�P�[��
	SetScaleSilhouette(kimendousi, SCALE.N, SILHOUETTE_WIDTH.N);	
	SetScaleSilhouette(gamegonlood, SCALE.M, SILHOUETTE_WIDTH.M);	
	SetScaleSilhouette(nizikujac, SCALE.N, SILHOUETTE_WIDTH.N);	
	
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
	//*�e���W�A
	// 	�u�Q��ڂ̏����@���߂łƂ��������܂��B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_TEREZIA");
	ShowMsg_("DEMO_512_MSG_010");
	KeyInputWait_();
	//===============================================
	
	//===============================================
	//*�e���W�A
	// 	�u�Ō�܂Ł@���������������܂��B
	//-----------------------------------------------
	ShowMsg_("DEMO_512_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");
	
	WaitTask(task_cam);
	DeleteTask_(task_cam);
	
	EncountEndDemo(ENCOUNT_NORMAL);
}
