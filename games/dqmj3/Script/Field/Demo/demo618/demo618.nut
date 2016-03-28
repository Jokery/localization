//=============================================
//
//		demo618[�Ō�̃p���[_1(����)]
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
	local task_cam, task_player, task_rena;

// �����\�[�X�Ǎ�
	// �L�����N�^�[
	local player = GetPlayerId_();					// ��l��
	local n_rena = ReadNpc_("n007");				// ���i�[�e
	local model_o_com_02 = ReadGimmick_("o_com_02");		// ���m���X
	local model_door = ReadGimmick_("o_O01_02");			// ���i�����N�r�j

// ���z�u
	// ��l��
	SetPointPos_(player, "player001");
	SetAlpha_(player, 0.0);
	
	// ���i�[�e
	local rena = ArrangePointNpc_(n_rena, "rena000");
	SetPointPos_(rena, "rena001");
	SetAlpha_(rena, 0.0);
	
	// ���m���X
	local gmc_o_com_02 = ArrangePointGimmick_("o_com_02", model_o_com_02, "monoris");	// ���m���X
	SetMotion_(gmc_o_com_02, MOT_GIMMICK_2, BLEND_N);
	
	// ���i�����N�r�j
	local door = ArrangePointGimmick_("o_O01_02", model_door, "obj_door000");

// ����풓���[�V�����Ǎ�
	local r_n007_look_left_L	= ReadMotion_(rena, "n007_look_left_L");
	local r_n007_look_up_L	= ReadMotion_(rena, "n007_look_up_L");
	local p_Player_look_up_L	= ReadMotion_(player, "Player_look_up_L");
	
//����
	SetStepSe_(rena, "SE_FLD_016");

// ���J�����ݒ�
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");
	
// ���G�t�F�N�g
	LoadEffect_("ef732_07_teleport_monolith");

//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------
//cut01
	StartDemo(FADE_COLOR_BLACK);
	PlaySE_("SE_DEM_017");
	local efc_mono = SetSelectBoneEffect_("ef732_07_teleport_monolith", player, ATTACH_GLOBAL);
	local efc_mono_r = SetSelectBoneEffect_("ef732_07_teleport_monolith", rena, ATTACH_GLOBAL);
	Wait_(1);
	SetAlpha_(player, 0.1);
	SetAlpha_(rena, 0.1);
	Wait_(1);
	SetAlpha_(player, 0.2);
	SetAlpha_(rena, 0.2);
	Wait_(1);
	SetAlpha_(player, 0.3);
	SetAlpha_(rena, 0.3);
	Wait_(1);
	SetAlpha_(player, 0.4);
	SetAlpha_(rena, 0.4);
	Wait_(1);
	SetAlpha_(player, 0.5);
	SetAlpha_(rena, 0.5);
	Wait_(1);
	SetAlpha_(player, 0.6);
	SetAlpha_(rena, 0.6);
	Wait_(1);
	SetAlpha_(player, 0.7);
	SetAlpha_(rena, 0.7);
	Wait_(1);
	SetAlpha_(player, 0.8);
	SetAlpha_(rena, 0.8);
	Wait_(1);
	SetAlpha_(player, 0.9);
	SetAlpha_(rena, 0.9);
	Wait_(1);
	SetAlpha_(player, 1.0);
	SetAlpha_(rena, 1.0);
	Wait_(60);
	SetMotion_(player, MOT_WALK, BLEND_M);
	SetMotion_(rena, MOT_WALK, BLEND_M);
	task_player = Task_AnimeMove_(player, "anm_player000");
	task_rena = Task_AnimeMove_(rena, "anm_rena000");
	
	Wait_(65);
	DeleteTask_(task_player);
	DeleteTask_(task_rena);

//cut02
	task_player = Task_AnimeMove_(player, "anm_player001");
	task_rena = Task_AnimeMove_(rena, "anm_rena001");
	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");
	WaitTask(task_player);
	DeleteTask_(task_player);
	WaitTask(task_rena);
	
	SetMotion_(rena, MOT_WAIT, BLEND_L);
	task_player = Task_WalkAroundToDir(player, 340, 5.7);
	
	SetMotion_(player, MOT_WAIT, BLEND_L);
	Wait_(8);
	
	//===============================================
	// ���e���W�A
	// �u�悤�����@<name_player/>���܁B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_TEREZIA");
	SetMotion_(player, p_Player_look_up_L, BLEND_L);
	SetMotion_(rena, r_n007_look_up_L, BLEND_XL);
	ShowMsg_("DEMO_618_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	//===============================================
	// �����i�[�e
	// �u�v���Ԃ�ˁ@�e���W�A�B�����܂ł�����
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_618_MSG_020");
	
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================	
	
//cut03
	
	SetVisible(player, false);
	SetPointCameraEye_("cameye002");
	SetPointCameraTarget_("camtgt002");
	
	//===============================================
	// ���e���W�A
	// �u���́@�}�U�[�c�c���Ȃ��Ɂ@���ꂽ���݂ł��B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_TEREZIA");
	ShowMsg_("DEMO_618_MSG_030");
	KeyInputWait_();
	//===============================================
	
	//===============================================
	// ���e���W�A
	// �u�}�U�[�E���i�[�e�B�󋵂́@�������Ă��܂��B
	//-----------------------------------------------
	ShowMsg_("DEMO_618_MSG_040");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
//cut04
	SetVisible(player, true);
	SetPointPos_(player, "player000");
	SetPointPos_(rena, "rena000");
	SetPointCameraEye_("cameye003");
	SetPointCameraTarget_("camtgt003");
	
	//===============================================
	// �����i�[�e
	// �u�����B<name_player/>�Ɂ@�Ō�̎������B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_618_MSG_050");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	//===============================================
	// ���e���W�A
	// �u�����n�邽�߂̃`�J���@���󃉃C�h�ł��ˁB
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_TEREZIA");
	ShowMsg_("DEMO_618_MSG_060");
	KeyInputWait_();
	//===============================================
	
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");
	
	//===============================================
	// ���e���W�A
	// �u<name_player/>���܁@���̔��ɂǂ����B
	//-----------------------------------------------
	ShowMsg_("DEMO_618_MSG_070");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	SetMotion_(player, MOT_WAIT, BLEND_L);
	SetMotion_(rena, MOT_WAIT, BLEND_L);
	WaitTask(task_cam);
	Wait_(30);
	
	EndDemo(FADE_COLOR_BLACK);
}
