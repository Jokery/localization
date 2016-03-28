//=============================================
//
//		demo612[�K���r���X�Đ�]
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
	local task_cam, task_player, task_player_step;
	local efc_player, efc_mag_dark, efc_mist;

// �����\�[�X�Ǎ�
	// �L�����N�^�[
	local player = GetPlayerId_();												// ��l��
	local model_rena = ReadNpc_("n007");										// ���i�[�e
	local model_garu = ReadNpc_("m184_00");										// �K���r���X	
	local model_mother = ReadGimmick_("o_C03_02");								// �}�U�[
	local model_decoration = ReadGimmick_("o_C03_03");							// �}�U�[

// ���z�u
	// ��l��
	SetPointPos_(player, "player000");
	// ���i�[�e
	local rena = ArrangePointNpc_(model_rena, "npc_rena000");
	// �K���r���X
	local garu = ArrangePointNpc_(model_garu, "npc_garu000");
	SetScaleSilhouette(garu, SCALE.G, SILHOUETTE_WIDTH.G);
	// �}�U�[
	local mother = ArrangePointGimmick_("o_C03_02", model_mother, "obj_mother000");
	local decoration = ArrangePointGimmick_("o_C03_03", model_decoration, "obj_mother000");

// ����풓���[�V�����Ǎ�
	local player_run_battle = ReadMotion_(player, "Player_run_battle");			// ��l�� ���聨�퓬�ҋ@
	local rena_look_left_L = ReadMotion_(rena, "n007_look_left_L");				// ���i�[�e ��������
	local player_battle_L = ReadMotion_(player, "Player_battle_L");				// ��l�� �퓬�ҋ@
	local garu_shout = ReadMotion_(garu, "m184_00_shout");						// �K���r���X �ҋ@�����K���ҋ@
	SetDir_(player, 18);
	SetDir_(mother, 180);
	SetDir_(decoration, 180);

// ���J�����ݒ�
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");


//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);

	SetMotion_(player, player_run_battle, BLEND_L);								// ���聨�퓬�ҋ@
	task_player_step = Task_ChangeStepSe(player, "SE_FLD_018", 8);
	task_player = Task_MoveForward_(player, 0.5, true);
	Wait_(23);
	DeleteTask_(task_player);
	DeleteTaskStepSe(player, task_player_step);
	SetMotion_(player, player_battle_L, BLEND_M);
	Wait_(40);


// ��l���ƃ��i�[�e�B�e�p
	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");

	SetDir_(rena, 40);
	SetPointPos_(player, "player001");
	Wait_(10);
	SetMotion_(rena, rena_look_left_L, BLEND_L);								// ���i�[�e ��������
	Wait_(10);

	//===============================================
	// �����i�[�e
	// �u<name_player/>�I
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_612_MSG_010");
	KeyInputWait_();
	//===============================================
	// �����i�[�e
	// �u�K���r���X�����|����
	//-----------------------------------------------
	ShowMsg_("DEMO_612_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================


	//�K���r���X �퓬�O
	SetPointCameraEye_("cameye002");
	SetPointCameraTarget_("camtgt002");	

	SetAlpha_(rena, 0);

	//===============================================
	// ���K���r���X
	// �u�}�U�[���@�򉻂Ȃ�Ă����Ȃ���B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_GARUBIRUSU");
	ShowMsg_("DEMO_612_MSG_030");
	KeyInputWait_();
	//===============================================
	// ���K���r���X
	// �u�{�N�́@�J���}�b�\���������@���ׂĂ𒴉z����
	//-----------------------------------------------
	ShowMsg_("DEMO_612_MSG_040");
	KeyInputWait_();
	//===============================================
	// ���K���r���X
	// �u���̎ז��́@�����Ȃ�����I�I
	//-----------------------------------------------
	ShowMsg_("DEMO_612_MSG_050");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

//�K���r���X���K
	local task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");

	SetMotion_(garu, garu_shout, BLEND_M);		// �ҋ@�����K���ҋ@
	PlaySE_("SE_DEM_155");
	Wait_(70);

	EncountEndDemo(ENCOUNT_BOSS);
}
