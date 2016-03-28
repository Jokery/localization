//=============================================
//
//		demo412[���W�X�^���X�̃��L��]
//
//=============================================
function Task_Rot3(chr, rot, frm)
{

//�����v���@���Z
//���v���@���Z

	local dir = GetDir_(chr);
	
	local sita = dir+rot;
	
	local sita2 = sita-dir;

	if( sita2 <= 0 ){
		sita2 = sita2*-1;
	}
	
	local frm2 = sita2/frm;
	
	local task = Task_RotateToDir_(chr, sita, frm2);
	
	return task;
}
//-------------------------------------------------------------------------
//
//		�ǂݍ��݁E�z�u
//
//-------------------------------------------------------------------------
function Update()
{
	
// ���ϐ���`
	local task_cam, task_player, task_ittaburu, task_kansyuA, task_kansyuB, task_rukiya;
	local efc_player, efc_kansyuA, efc_kansyuB;

// �����\�[�X�Ǎ�
	// �L�����N�^�[
	local player		 = GetPlayerId_();			// ��l��
	local id_rukiya		 = ReadNpc_("n009");		// ���L��

	local id_ittaburu	 = ReadNpc_("m205_00");		// �C�b�^�u��
	local id_sli_k		 = ReadNpc_("m035_00");		// �Ŏ�C�F�������Â�
	local id_ookizuchi	 = ReadNpc_("m008_00");		// �Ŏ�B�F�X���C���i�C�g

	local g_door		 = ReadGimmick_("o_S02_01");
	local g_lift		 = ReadGimmick_("o_S02_00");

// ���z�u
	// ��l��
	SetPointPos_(player, "player");

	// ���L��
	local rukiya	 = ArrangePointNpc_(id_rukiya,		 "rukiya");
	SetStepSe_(rukiya, SILENT_STEP_SE);

	// �C�b�^�u��
	local ittaburu	 = ArrangePointNpc_(id_ittaburu,	 "ittaburu");
	SetMotion_(ittaburu, MOT_WAIT, 1);
	SetStepSe_(ittaburu, "SILENT_STEP_SE");

	// �Ŏ�A
	local kansyuA	 = ArrangePointNpc_(id_sli_k,		 "kansyuA");
	SetScaleSilhouette(kansyuA, 0.6, 0.8);
	SetStepSe_(kansyuA, "SILENT_STEP_SE");

	// �Ŏ�B
	local kansyuB	 = ArrangePointNpc_(id_ookizuchi,	 "kansyuB");
	SetScaleSilhouette(kansyuB, 0.6, 0.8);
	SetStepSe_(kansyuB, "SILENT_STEP_SE");

	local door	 = ArrangePointGimmick_("o_S02_01", g_door, "door");
	local lift	 = ArrangePointGimmick_("o_S02_00", g_lift, "lift");
	
	SetMotion_(door, MOT_GIMMICK_0, 1);
	
	// ���G�t�F�N�g
	LoadEffect_("ef712_13_emo_sweat01");			// ��
	
	local pos = Vec3(0, 0, 0);
	LoadEffect_("ef712_10_emo_surprise01");			// �u�I�v�G�t�F�N�g

// ����풓���[�V�����Ǎ�
	local r_kubi	= ReadMotion_(rukiya,	"n009_look_left_L");	// ���L���A������
	local p_unn		= ReadMotion_(player,	"Player_nod");			// ����
	local p_kyoro	= ReadMotion_(player,	"Player_caution02_L");	// ����낫���
	local p_look	= ReadMotion_(player,	"Player_cage_look_L");	// �݂�
	local p_turn	= ReadMotion_(player,	"Player_look_right_L");	// �U�����L
	local p_tateL	= ReadMotion_(player,	"Player_one_knee_L");	// ���GL
	local p_tatu	= ReadMotion_(player,	"Player_battle01");		// ���GL���퓬�ҋ@
	local p_wait	= ReadMotion_(player,	"Player_caution01_L");	// �x��L
	SetMotion_(player, p_tateL, 1);

// ���J�����ݒ�
	SetPointCameraEye_("001_cameye");
	SetPointCameraTarget_("001_camtgt");

//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);
	SetMotion_(player, p_wait, 16);

	Wait_(30);
	//===============================================
	// *�Ȃ��̘V�k
	// �u�R���b�I�@�ڂ�ڂ₵�Ă񂶂�Ȃ��I
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_412_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	SurpriseDisp(player);
	SetMotion_(player, p_kyoro, 8);

	Wait_(60);

	//===============================================
	// *�Ȃ��̘V�k
	// �u�ȁ[�Ɂ@�L�����L�������Ă�񂾂��B
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_412_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	Task_Rot3(rukiya, 95, 1)
	SetMotion_(rukiya, MOT_WAIT, 1);
	task_cam = Task_AnimeMoveCamera_("002_anmeye", "002_anmtgt");
	task_rukiya = Task_AnimeMoveNoDirNoFit_(rukiya, "rukiya_anm001");
	task_player = Task_AnimeMoveSetMotion_(player, "player_anm001", MOT_WALK, MOT_WAIT);
	SetStepSe_(player, SILENT_STEP_SE);										// ������ �����ɂ���
	Wait_(140);
	ResetStepSe_(player);
	WaitTask(task_rukiya);
	SetMotion_(rukiya, MOT_TALKLOOP, 8);
	WaitTask(task_player);
	DeleteTask_(task_cam);
	task_cam = Task_AnimeMoveCamera_("004_anmeye", "004_anmtgt");
	//===============================================
	// *�Ȃ��̘V�k
	// �u�����c�c�܂������{����
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_MYSTERY_OLD_WOMAN");
	ShowMsg_("DEMO_412_MSG_030");
	KeyInputWait_();
	
	//===============================================
	
	//===============================================
	// *�Ȃ��̘V�k
	// �u����Ɓ@����ˁ@����l���̖��O���B
	//-----------------------------------------------
	ShowMsg_("DEMO_412_MSG_040");
	KeyInputWait_();
	//===============================================

	//===============================================
	// *�Ȃ��̘V�k
	// �u�c�c���ā@�ǂ������񂾂��H
	//-----------------------------------------------
	ShowMsg_("DEMO_412_MSG_050");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	SetMotion_(rukiya, MOT_WAIT, BLEND_XL);

	WaitTask(task_cam);	
	efc_player = SurpriseDispSetOffset(rukiya, pos, 0.7);
	DeleteTask_(task_cam);
	Wait_(30);
	//===============================================
	// *�Ȃ��̘V�k
	// �u���������΁@���񂽁@�L�����Ȃ��񂾂����ˁB
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_MYSTERY_OLD_WOMAN");
	ShowMsg_("DEMO_412_MSG_060");

	SetMotion_(rukiya, MOT_TALK, 8);
	WaitMotion(rukiya);
	SetMotion_(rukiya, MOT_TALKLOOP, 8);

	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	task_cam = Task_AnimeMoveCamera_("003_anmeye", "003_anmtgt");					//
	//===============================================
	// *�Ȃ��̘V�k
	// �u�������́@���W�X�^���X�́@���L���B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_MYSTERY_OLD_WOMAN");
	ShowMsg_("DEMO_412_MSG_070");
	KeyInputWait_();
	CloseMsgWnd_();
	SetMotion_(rukiya, MOT_WAIT, BLEND_XL);
	WaitTask(task_cam);
	//===============================================
	SetPointCameraEye_("0024_cameye");
	SetPointCameraTarget_("0024_camtgt");

	// �G���x�[�^�̂������Ă��鉹��炷
	PlaySE_("SE_DEM_087");
	Wait_(12);
	SurpriseDisp(player);
	SurpriseDisp(rukiya);
	SetMotion_(player, p_turn, 4);
	SetMotion_(rukiya, r_kubi, 4);
	Wait_(15);
	SetMotion_(rukiya, MOT_WALK, BLEND_XL);
	Task_Rot3(rukiya, -120, 30)
	Wait_(30);
	task_player		 = Task_AnimeMove_(player,		 "player_anm002");
	task_rukiya		 = Task_AnimeMove_(rukiya,		 "rukiya_anm002");
	SetMotion_(player, MOT_RUN, 8);
	WaitTask(task_player);
	SetMotion_(player, MOT_WAIT, 8);
	SetMotion_(rukiya, MOT_WAIT, BLEND_XL);
	task_ittaburu		 = Task_AnimeMove_(ittaburu,	"ittaburu_anm001");
	DeleteTask_(task_ittaburu);
	Task_Rot3(ittaburu, -90, 1)
	task_cam		 = Task_AnimeMoveCamera_	("005_anmeye",	 "005_anmtgt");
	task_ittaburu		 = Task_AnimeMove_(ittaburu,	"ittaburu_anm001");
	task_kansyuA		 = Task_AnimeMove_(kansyuA,		 "kansyuA_anm001");
	task_kansyuB		 = Task_AnimeMove_(kansyuB,		 "kansyuB_anm001");
	SetMotionSpeed_(ittaburu, 1);
	SetMotion_(door, MOT_GIMMICK_1, 1);
	Wait_(30)
	SetMotion_(door, MOT_GIMMICK_2, 1);
	SetMotion_(kansyuB, MOT_RUN, BLEND_M);
	SetMotion_(ittaburu, MOT_WALK, BLEND_L);
	local Istep = Task_PlaySe_("SE_FLD_052", 15);
	Wait_(15);
	StartEarthQuake_(10, 3, 0.7);

	Wait_(15);
	StartEarthQuake_(10, 3, 0.7);
	SetMotion_(kansyuB, MOT_WAIT, BLEND_M);
	Wait_(15);
	StartEarthQuake_(10, 3, 0.7);
	Wait_(5);

	SetMotion_(ittaburu, MOT_WAIT, BLEND_L);
	SetMotion_(kansyuB, MOT_RUN, BLEND_M);
	SetMotion_(kansyuA, MOT_RUN, BLEND_M);
	DeleteTask_(Istep);
	Wait_(20);
	SetMotion_(door, MOT_GIMMICK_3, 1);
	PlaySE_("SE_DEM_088");
	Wait_(20);
	WaitTask(task_kansyuB);
	task_kansyuB = Task_RotateToPos_(kansyuB, GetPos_(ittaburu), 10.0);
	WaitTask(task_kansyuB);
	SetMotion_(kansyuB, MOT_WAIT, BLEND_M);
	WaitTask(task_kansyuA);
	task_kansyuA = Task_RotateToPos_(kansyuA, GetPos_(ittaburu), 10.0);
	WaitTask(task_kansyuA);
	SetMotion_(kansyuA, MOT_WAIT, BLEND_M);
	Wait_(10);
	SetMotion_(door, MOT_GIMMICK_0, 1);
	//===============================================
	// ���C�b�^�u��
	// �u�}�U�[�Ɓ@�_�[�N�}�X�^�[���܂�
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ITABURU");
	ShowMsg_("DEMO_412_MSG_080");
	
	KeyInputWait_();
	//===============================================
	
	task_player = Task_WalkAroundToDir(player, -90, 100);
	task_rukiya = Task_WalkAroundToDir(rukiya, -90, 100);
	WaitTask(task_player);
	SetMotion_(player, MOT_WAIT, BLEND_L);
	
	//===============================================
	// ���C�b�^�u��
	// �u��΂Ɂ@�ǂ��l�߂�I
	//-----------------------------------------------
	ShowMsg_("DEMO_412_MSG_090");
	KeyInputWait_();
	WaitTask(task_player);
	CloseMsgWnd_();
	//===============================================
	SetMotionSpeed_(ittaburu, 0.8);
	efc_kansyuA = SetSelectBoneEffect_("ef712_13_emo_sweat01", kansyuA, ATTACH_EFFECT1);
	efc_kansyuB = SetSelectBoneEffect_("ef712_13_emo_sweat01", kansyuB, ATTACH_EFFECT1);
	SetEffectScale_(efc_kansyuA, 3.0);
	SetEffectScale_(efc_kansyuB, 3.0);

	task_kansyuA = Task_WalkAroundToDir(kansyuA, 90, 5);
	task_kansyuB = Task_WalkAroundToDir(kansyuB, 90, 10);
	SetMotion_(kansyuA, MOT_RUN, 8);
	SetMotion_(kansyuB, MOT_RUN, 8);
	WaitTask(task_kansyuB);
	task_cam		 = Task_AnimeMoveCamera_	("006_anmeye",	 "006_anmtgt");
	task_kansyuA	 = Task_AnimeMove_			(kansyuA,		 "kansyuA_anm002");
	
	task_kansyuB	 = Task_AnimeMove_			(kansyuB,		 "kansyuB_anm002");
	
	task_ittaburu	 = Task_AnimeMove_			(ittaburu,		 "ittaburu_anm002");
	Wait_(66);
	SetMotion_(ittaburu, MOT_WALK, 8);
	local Istep = Task_PlaySe_("SE_FLD_052", 20);
	Wait_(20);
	StartEarthQuake_(10, 3, 0.7);

	Wait_(20);

	WaitTask(task_cam);
	task_cam		 = Task_AnimeMoveCamera_	("007_anmeye",	 "007_anmtgt");
	task_rukiya = Task_RotateToPos_(rukiya, GetPos_(player), 10.0);
	task_player = Task_RotateToPos_(player, GetPos_(rukiya), 10.0);
	SetMotion_(player, MOT_WALK, BLEND_M);

	WaitTask(task_player);
	SetMotion_(player, MOT_WAIT, BLEND_M);
	WaitTask(task_rukiya);

	WaitTask(task_cam);
	DeleteTask_(Istep);
	SetMotion_(rukiya, MOT_TALK, BLEND_XL);
	Wait_(20);
	//===============================================
	// �����L��
	// �u����ȏ��ɂ�����@�������������܂��B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RUKIYA");
	ShowMsg_("DEMO_412_MSG_100");

	WaitMotion(rukiya);
	SetMotion_(rukiya, MOT_TALKLOOP, BLEND_XL);

	KeyInputWait_();
	//===============================================
	
	//===============================================
	// �����L��
	// �u�S�K�̖k���Ɂ@�󂫕���������B
	//-----------------------------------------------
	ShowMsg_("DEMO_412_MSG_110");
	KeyInputWait_();
	// �u����K�i���g���̂́@�܂����B
	ShowMsg_("DEMO_412_MSG_120");
	KeyInputWait_();
	
	CloseMsgWnd_();
	//===============================================
	SetMotion_(rukiya, MOT_WAIT, BLEND_XL);
	Wait_(10);
	SetMotion_(player, p_unn, BLEND_XL);

	WaitMotion(player);
	SetMotion_(player, MOT_WAIT, 8);
	
	EndDemo(FADE_COLOR_BLACK);
}
