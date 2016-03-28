//=============================================
//
//		demo502[�n���V�F���^�[�̒�_2]
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

// �����\�[�X�Ǎ�
	// �L�����N�^�[
	local player = GetPlayerId_();					// ��l��
	local n_bevil = ReadNpc_("m082_01");			//�׃r��
	local n_genjyutusi = ReadNpc_("m076_02");		//���񂶂��
	local n_bes = ReadNpc_("m006_03");				//�x�X�L���O
	local n_megazaru = ReadNpc_("m107_01");			//���K�U�����b�N

// ���z�u
	// ��l��
	local task = Task_AnimeMove_(player,"player");
	DeleteTask_(task);

	//�׃r��																��l���̗�(�Z�lA)
	local bevil = ArrangeNpc_(n_bevil, false);
	SetScaleSilhouette(bevil, SCALE.S, 0.4);
	local task = Task_AnimeMove_(bevil,"bevil");
	DeleteTask_(task);

	//�׃r��																���
	local bevil_mob = ArrangeNpc_(n_bevil, false);
	SetScaleSilhouette(bevil_mob, SCALE.S, 0.4);
	local task = Task_AnimeMove_(bevil_mob,"bevil_mob");
	DeleteTask_(task);

	//�׃r��																�Z�lD
	local bevil_item = ArrangeNpc_(n_bevil, false);
	SetScaleSilhouette(bevil_item, SCALE.S, 0.4);
	local task = Task_AnimeMove_(bevil_item,"bevil_item");
	DeleteTask_(task);

	//���񂶂��															���V
	local genjyutusi = ArrangePointNpc_(n_genjyutusi, "genjyutusi000");
	SetScaleSilhouette(genjyutusi, SCALE.S, 0.4);

	//���K�U�����b�N														�h��
	local mega_a = ArrangeNpc_(n_megazaru, false);
	SetScaleSilhouette(mega_a, SCALE.N, 0.6);
	local task = Task_AnimeMove_(mega_a,"mega_a");
	DeleteTask_(task);

	//���K�U�����b�N														����
	local mega_b = ArrangePointNpc_(n_megazaru, "mega_b");
	SetScaleSilhouette(mega_b, SCALE.N, 0.6);

	//�x�X�L���O															�Z�lB
	local bes_a = ArrangeNpc_(n_bes, false);
	SetScaleSilhouette(bes_a, SCALE.S, 0.3);
	local task = Task_AnimeMove_(bes_a,"bes_a");
	DeleteTask_(task);

	local task_iwa = Task_RotateToPos_(bevil_item, GetPos_(mega_a), 100);

// ����풓���[�V�����Ǎ�
	local g_m076_02_wait_L	= ReadMotion_(genjyutusi, "m076_02_wait_L");
	SetMotion_(genjyutusi, g_m076_02_wait_L, BLEND_N);

// ���J�����ݒ�
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");

// ���G�t�F�N�g�ǂݍ���
	LoadEffect_("EF712_10_EMO_SURPRISE01");			// �u�I�v


//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------

// �J�b�g1
	StartDemo(FADE_COLOR_BLACK);

	Wait_(10);

	//===============================================
	//*�}�O�}�p�[�N�Z�l�`
	// 	�u���[���@�݂�ȁ[�I
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_502_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================


// �J�b�g2
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");

	Wait_(1);
	SetAlpha_(player, 0);
	local taskg = Task_AnimeMoveSetMotion_(player, "player", MOT_WALK, MOT_WAIT);
	Wait_(2);
	local efc = SurpriseDispSetOffset(bevil_mob, Vec3(0, 3, 0), 7.0);
	local task = Task_RotateToPlayerSetMotion_(bevil_mob, 3.0, MOT_WALK, MOT_WAIT);
	Wait_(40);
	local efc = SurpriseDispSetOffset(mega_a, Vec3(0, 8, 0), 2.5);
	local task = Task_RotateToPlayerSetMotion_(mega_a, 3.0, MOT_WALK, MOT_WAIT);
	Wait_(15);
	local efc = SurpriseDispSetOffset(bes_a, Vec3(0, 6, 0), 6.5);
	local task = Task_RotateToPlayerSetMotion_(bes_a, 3.0, MOT_WALK, MOT_WAIT);
	Wait_(20);
	local efc = SurpriseDispSetOffset(bevil_item, Vec3(0, 3, 0), 4.0);
	local taska = Task_RotateToPlayerSetMotion_(bevil_item, 3.0, MOT_WALK, MOT_WAIT);
	Wait_(60);
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 15);
	WaitFade_();

	SetPointPos_(player, "player000");
	SetMotion_(bevil_mob, MOT_WALK, 4);
	SetMotion_(bevil_item, MOT_WALK, 4);
	SetMotion_(mega_a, MOT_WALK, 4);
	local taska = Task_AnimeMoveSetMotion_(bes_a		, "bes_a", MOT_WALK, MOT_WAIT);
	local taskd = Task_AnimeMoveSetMotion_(bevil		, "bevil", MOT_WALK, MOT_WAIT);
	local taske = Task_AnimeMove_(bevil_mob				, "bevil_mob");
	local taskf = Task_AnimeMove_(bevil_item			, "bevil_item");
	local taskc = Task_AnimeMove_(mega_a				, "mega_a");
	SetAlpha_(player, 1);
	Wait_(1);


// �J�b�g3
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");

	SetFade_(FADE_IN, FADE_COLOR_BLACK, 10);
	WaitFade_();
	WaitTask(taskf);
	SetMotion_(bevil_item, MOT_WAIT, 8);
	WaitTask(taske);
	SetMotion_(bevil_mob, MOT_WAIT, 8);
	SetMotion_(mega_a, MOT_WAIT, 16);
	Wait_(5);
	SetMotion_(bevil_item, MOT_RUN, 8);
	SetStepSe_(bevil_item, SILENT_STEP_SE);

	//===============================================
	//*�}�O�}�p�[�N�Z�l�a
	// 	�u�s���g�̃A���Z�X�I
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_502_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	WaitTask(taska);
	//===============================================

	SetMotion_(bevil_item, MOT_WAIT, 8);
	Wait_(1);
	SetMotion_(bes_a, MOT_WALK, 8);
	SetStepSe_(bes_a, SILENT_STEP_SE);

	//===============================================
	//*�}�O�}�p�[�N�Z�l�b
	// 	�u��������Ȃ����@�A���Z�X�B
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_502_MSG_030");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	SetMotion_(bes_a, MOT_WAIT, 8);
	DeleteTask_(task_cam);
	SetDirToPlayer_(bevil);


// �J�b�g4
	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");

	SetVisible(bes_a		, false);
	SetVisible(mega_a		, false);
	SetVisible(bevil_mob	, false);
	SetVisible(bevil_item	, false);
	SetVisible(player		, false);

	//===============================================
	//*�}�O�}�p�[�N�Z�l�`
	// 	�u�A���Z�X�@�܂��͒��V�ɉ����
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_502_MSG_040");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================


// �J�b�g5
	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");

	Wait_(30);

	//===============================================
	//*�}�O�}�p�[�N�Z�l�`
	// 	�u�ꏊ�́@�̂ƕς���ĂȂ��B
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_502_MSG_050");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	WaitTask(task_cam);
	Wait_(30);

	EndDemo(FADE_COLOR_BLACK);
}
