//=============================================
//
//		demo621[�Ō�̃p���[_5(2��폟��)]
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
	local player = GetPlayerId_();					// ��l��

	local model_bebynewto = ReadNpc_("m021_02");		// �x�r�[�j���[�g
	local model_ltiyraiban = ReadNpc_("m021_03");		// ���g�����C�o�[��
	local model_kireapansaer = ReadNpc_("m032_00");		// �L���[�p���T�[
	local model_kireataiger = ReadNpc_("m032_01");		// �L���[�^�C�K�[

// ���z�u
	// ��l��
	SetPointPos_(player, "player000");

	local bebynewto = ArrangePointNpc_(model_bebynewto, "npc_bebynewto000");
	local ltiyraiban = ArrangePointNpc_(model_ltiyraiban, "npc_ltiyraiban000");
	local kireapansaer = ArrangePointNpc_(model_kireapansaer, "npc_nizikujac000");
	local kireataiger = ArrangePointNpc_(model_kireataiger, "npc_kireataiger000");

//�������X�^�[�̃X�P�[��
	SetScaleSilhouette(bebynewto, SCALE.S, SILHOUETTE_WIDTH.S);	
	SetScaleSilhouette(ltiyraiban, SCALE.S, SILHOUETTE_WIDTH.S);	
	SetScaleSilhouette(kireapansaer, SCALE.N, SILHOUETTE_WIDTH.N);
	SetScaleSilhouette(kireataiger, SCALE.N, SILHOUETTE_WIDTH.N);
		
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
	// ���e���W�A
	// �u�Q��ڂ̏����@���߂łƂ��������܂��B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_TEREZIA");
	ShowMsg_("DEMO_621_MSG_010");
	KeyInputWait_();
	//===============================================
	
	//===============================================
	// ���e���W�A
	// �u���f����邱�ƂȂ�
	//-----------------------------------------------
	ShowMsg_("DEMO_621_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");
	
	WaitTask(task_cam);
	DeleteTask_(task_cam);
	
	EncountEndDemo(ENCOUNT_NORMAL);
}
