//=============================================
//
//		demo422[���L�����₵���������]
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
	local task_cam, task_player, task_spike;
	local efc_player;

// �����\�[�X�Ǎ�
	// �L�����N�^�[
	local player = GetPlayerId_();						// ��l��
	local n_spike = ReadNpc_("m127_01");				// ���N
	local model_o_dem_07 = ReadGimmick_("o_dem_23");	// ���A�N�^�[

// ���z�u
	// ��l��
	SetPointPos_(player, "player000");
	
	// ���N
	local spike = ArrangePointNpc_(n_spike, "npc_spike000");
	SetScaleSilhouette(spike, SCALE.S, 0.25);
	
	// ���A�N�^�[
	local gmc_o_dem_07 = ArrangePointGimmick_("o_dem_07", model_o_dem_07, "obj_reactor000");

// ����풓���[�V�����Ǎ�
	local spike_m127_01_talk_L = ReadMotion_(spike, "m127_01_talk_L");
	local spike_m127_01kyorokyoro_L = ReadMotion_(spike, "m127_01_kyorokyoro_L");
	local player_Player_hold_L = ReadMotion_(player, "Player_hold_L");

// ���J�����ݒ�
	SetPointCameraEye_("001_cameye");
	SetPointCameraTarget_("001_camtgt");

//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------

	SetVisible(spike, false);
	SetMotion_(gmc_o_dem_07, MOT_GIMMICK_2, BLEND_XL);
	SetMotion_(player, player_Player_hold_L, BLEND_N);
	AttachObject_(player, gmc_o_dem_07, ATTACH_EFFECT3);
	StartDemo(FADE_COLOR_BLACK);
	
	//===============================================
	// *���L���̐�����
	// �u�c�c�������邩���@����l���̖��O���B
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_422_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetVisible(spike, true);
	task_cam = Task_AnimeMoveCamera_("001_anmeye", "001_anmtgt");
	SetMotion_(spike, spike_m127_01_talk_L, BLEND_L);
	
	//===============================================
	// *���N
	// �u�������I�H�@���L�����I�H
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_MONSTER_BOY");
	ShowMsg_("DEMO_422_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	InitSilhouetteWidth_(spike, 1.6);
	SetPointPos_(player, "player001");
	SetPointPos_(spike, "npc_spike001");

	SetDirToObject_(player, spike);
	SetMotion_(spike, spike_m127_01kyorokyoro_L, BLEND_L);
	task_cam = Task_AnimeMoveCamera_("002_anmeye", "002_anmtgt");
	
	//===============================================
	// �����L���̐�
	// �u���������@���񂾂Ƃ��ɔ�����
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RUKIYA_VOICE");
	ShowMsg_("DEMO_422_MSG_030");
	KeyInputWait_();
	//===============================================
	
	//===============================================
	// �����L���̐�
	// �u���������H�@���̃��A�N�^�[�̒��ɂ�
	//-----------------------------------------------
	ShowMsg_("DEMO_422_MSG_040");
	KeyInputWait_();

	//===============================================
	// �����L���̐�
	// �u�ǂ�ȃg�r���ł��J����@���@�̃J�M���B
	//-----------------------------------------------
	ShowMsg_("DEMO_422_MSG_050");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	SetPointPos_(player, "player000");
	SetMotion_(spike, MOT_WAIT, BLEND_L);
	task_cam = Task_AnimeMoveCamera_("003_anmeye", "003_anmtgt");
	SetVisible(spike, false);

	//===============================================
	// �����L���̐�
	// �u���̃}�X�^�[�L�[�Ł@�č��̍ŏ�K�ɂ���
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RUKIYA_VOICE");
	ShowMsg_("DEMO_422_MSG_060");
	KeyInputWait_();
	//===============================================
	
	//===============================================
	// �����L���̐�
	// �u���ɂ́@�ړ����u���g�����߂́@�@�B������B
	//-----------------------------------------------
	ShowMsg_("DEMO_422_MSG_070");
	KeyInputWait_();
	//===============================================
	
	//===============================================
	// �����L���̐�
	// �u���̋@�B���g���΁@�ŔM�̉ΎR�ւ�
	//-----------------------------------------------
	ShowMsg_("DEMO_422_MSG_080");
	KeyInputWait_();
	//===============================================
	
	//===============================================
	// �����L���̐�
	// �u����������ړ����u�Ł@�ŔM�̉ΎR�ɍs���񂾁B
	//-----------------------------------------------
	ShowMsg_("DEMO_422_MSG_090");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	task_cam = Task_AnimeMoveCamera_("004_anmeye", "004_anmtgt");
	
	//===============================================
	// �����L���̐�
	// �u���܂Ȃ��ˁB�{���Ȃ�@�ꏏ��
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RUKIYA_VOICE");
	ShowMsg_("DEMO_422_MSG_100");
	KeyInputWait_();
	//===============================================
	
	//===============================================
	// �����L���̐�
	// �u�������ǁ@���́@���ꂪ����t�B
	//-----------------------------------------------

	ShowMsg_("DEMO_422_MSG_110");
	KeyInputWait_();

	//===============================================
	
	//===============================================
	// �����L���̐�
	// �u���񂾂�@����l���̖��O���B
	//-----------------------------------------------
	ShowMsg_("DEMO_422_MSG_120");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetMotion_(gmc_o_dem_07, MOT_GIMMICK_1, BLEND_XL);
	Wait_(5);
	WaitTask(task_cam);
	DeleteTask_(task_cam);
	
	task_cam = Task_AnimeMoveCamera_("005_anmeye", "005_anmtgt");	
	
	DeleteTask_(task_cam);
	Wait_(50);
	SetMotion_(gmc_o_dem_07, MOT_GIMMICK_7, BLEND_L);
	task_cam = Task_AnimeMoveCamera_("005_anmeye", "005_anmtgt");	
	WaitTask(task_cam);
	//===============================================
	// *�V�X�e�����b�Z�[�W
	// �}�X�^�[�L�[���@��ɓ��ꂽ�B
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_422_MSG_130");
	PlayMe_("ME_010");
	WaitMe_();
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	Wait_(20);
	
	EndDemo(FADE_COLOR_BLACK);
}
