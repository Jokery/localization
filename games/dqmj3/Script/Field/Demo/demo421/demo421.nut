//=============================================
//
//		demo421[�s���g�̎�l��]
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
	local efc_parapara00, efc_parapara01, efc_reactor;

// �����\�[�X�Ǎ�
	// �L�����N�^�[
	local player = GetPlayerId_();					// ��l��
	local n_spike = ReadNpc_("m127_01");			// ���N
	local n_sabo = ReadNpc_("m064_00");				// �T�{�e���{�[��
	local model_o_dem_07 = ReadGimmick_("o_dem_23");	// ���A�N�^�[
	local n_mother000 = ReadNpc_("m127_01");		// �X�p�C�N�w�b�h�i��e�j
	local n_tank = ReadNpc_("m132_01");		// �f�U�[�g�^���N

// ���z�u
	// ��l��
	SetPointPos_(player, "player000");

	// ���N
	local spike = ArrangePointNpc_(n_spike, "npc_spike000");
	SetScaleSilhouette(spike, SCALE.S, 0.4);

	// �T�{�e���{�[��
	local sabo1 = ArrangePointNpc_(n_sabo, "sabo1");
	SetScaleSilhouette(sabo1, SCALE.N, 0.6);

	// ��e
	local npc_mother000 = ArrangePointNpc_(n_mother000, "sabo2");
	SetScaleSilhouette(npc_mother000, 0.52, 0.52);

	// �f�U�[�g�^���N
	local tank = ArrangePointNpc_(n_tank, "sabo3");
	SetScaleSilhouette(tank, SCALE.S, 0.4);

	// ���A�N�^�[
	local gmc_o_dem_07 = ArrangePointGimmick_("o_dem_07", model_o_dem_07, "obj_reactor000");

// ����풓���[�V�����Ǎ�
	local player_Player_sleep2_L = ReadMotion_(player, "Player_sleep2_L");
	local player_Player_sleep2_awake = ReadMotion_(player, "Player_sleep2_awake");
	local player_Player_one_knee = ReadMotion_(player, "Player_one_knee");
	local player_Player_up01_L = ReadMotion_(player, "Player_up01_L");
	local player_Player_talk = ReadMotion_(player, "Player_talk");
	local player_Player_talk_L = ReadMotion_(player, "Player_talk_L");
	local player_touch_reactor = ReadMotion_(player, "Player_touch_reactor");
	local player_touch_reactor_L = ReadMotion_(player, "Player_touch_reactor_L");
	local spike_feel_down_L = ReadMotion_(spike, "m127_01_feel_down_L");
	local spike_m127_01_talk_L = ReadMotion_(spike, "m127_01_talk_L");

// ���G�t�F�N�g�ǂݍ���
	LoadEffect_("ef732_09_light_reactor_c");		// ���A�N�^�[����
	LoadEffect_("ef732_13_light_reactor01");		// ���A�N�^�[�����i�܂Ԃ����j

// ���J�����ݒ�
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");
	DeleteTask_(task_cam);

	SetMotion_(player, player_Player_sleep2_L, BLEND_N);
	SetDirToPlayer_(spike);
	SetFace_(player, "Face_loop_close");

//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------

//	StartDemo(FADE_COLOR_WHITE);
	SetFade_(FADE_IN, FADE_COLOR_WHITE, 60);
	Wait_(40);
	efc_parapara00 = SetPointWorldEffect_("ef726_01_nat_parapara", "efc_parapara000");
	SetEffectScale_(efc_parapara00, 1.4);
	WaitFade_();
	Wait_(5);
	DeleteEffectEmitter_(efc_parapara00);
	Wait_(15);
	efc_parapara01 = SetPointWorldEffect_("ef726_01_nat_parapara", "efc_parapara001");
	SetEffectScale_(efc_parapara01, 1.3);
	Wait_(10);

	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");
	Wait_(15);
	DeleteEffectEmitter_(efc_parapara01);
	WaitTask(task_cam);
	Wait_(30);
	DeleteTask_(task_cam);


	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");

	SetMotion_(player, player_Player_sleep2_awake, BLEND_XL);
	Wait_(100);
	SetFace_(player, "Face_eyes_close");
	WaitMotion(player);
	SetMotion_(player, player_Player_up01_L, BLEND_XL);
	Wait_(30);
	WaitTask(task_cam);
	SetPointPos_(sabo1, "sabo1_move");
	SetPointPos_(npc_mother000, "mother_move");
	SetPointPos_(tank, "tank_move");


	task_cam = Task_AnimeMoveCamera_("anmeye005", "anmtgt005");

	Wait_(15);
	SetMotion_(player, player_Player_one_knee, BLEND_XL);
	Wait_(15);
	SetMotion_(player, MOT_WAIT, BLEND_XL);
	Wait_(16);
	Task_RotateToPosSetMotion_(player, GetPos_(spike), ROTATE_DEMO_DEF, "WALK", "WAIT");
	SetMotion_(player, MOT_WAIT, BLEND_XL);
	SetMotion_(spike, spike_m127_01_talk_L, BLEND_XL);
	Wait_(20);

	//===============================================
	// *���N
	// �u���Z����I�@�悩�����c�c�B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_MONSTER_BOY");
	ShowMsg_("DEMO_421_MSG_010");
	KeyInputWait_();
	//===============================================
	// *���N
	// �u���������@�����@�������́H
	//-----------------------------------------------
	ShowMsg_("DEMO_421_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	SetMotion_(spike, MOT_WAIT, BLEND_XL);
	SetMotion_(player, player_Player_talk, BLEND_L);
	WaitMotion(player);
	SetMotion_(player, player_Player_talk_L, BLEND_L)
	Wait_(30);
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 30);
	WaitFade_();
	SetVisible(player, false);
	SetVisible(sabo1, false);
	SetVisible(npc_mother000, false);
	SetVisible(tank, false);


	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");

	SetScaleSilhouette(spike, SCALE.S, 0.35);
	SetFade_(FADE_IN, FADE_COLOR_BLACK, 20);

	SetMotion_(spike, spike_m127_01_talk_L, BLEND_XL);

	//===============================================
	// *���N
	// �u����ȁI�@���L���́@���񂶂�����́I�H
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_MONSTER_BOY");
	ShowMsg_("DEMO_421_MSG_030");
	KeyInputWait_();
	SetMotion_(spike, spike_feel_down_L, 14);
	Wait_(5);
	//===============================================
	// *���N
	// �u����ȁc�c�����@��Ȃ��Ȃ�āB
	//-----------------------------------------------
	ShowMsg_("DEMO_421_MSG_040");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	Wait_(5);


	task_cam = Task_AnimeMoveCamera_("anmeye003", "anmtgt003");

	SetVisible(player, true);
	SetMotion_(spike, MOT_TALK, BLEND_N);
	Wait_(3);
	SetMotion_(spike, MOT_TALKLOOP, BLEND_XL);

	//===============================================
	// *���N
	// �u���������ā@���Z����́@�߂��ɗ����Ă�
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_MONSTER_BOY");
	ShowMsg_("DEMO_421_MSG_050");
	KeyInputWait_();
	//===============================================
	// *���N
	// �u�����������񂾁c�c�B���Ⴀ�@�����
	//-----------------------------------------------
	ShowMsg_("DEMO_421_MSG_060");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	Wait_(1);
	WaitTask(task_cam);
	local task = Task_RotateToDir_(player, 45, 3);
	SetMotion_(player, MOT_WAIT, BLEND_XL);
	SetMotion_(gmc_o_dem_07, MOT_GIMMICK_1, BLEND_N);
	
	PlaySE_("SE_DEM_079");		// ���L�A�̃��A�N�^�[����
	efc_reactor = SetSelectBoneEffectSetOffset_("ef732_09_light_reactor_c", gmc_o_dem_07, ATTACH_GLOBAL, Vec3(-0.5, 0.0, 0.0));	// ���A�N�^�[����
	SetEffectScale_(efc_reactor, 0.3);
	Wait_(36);
	DeleteEffectEmitter_(efc_reactor);
	
	PlaySE_("SE_DEM_079");		// ���L�A�̃��A�N�^�[����
	efc_reactor = SetSelectBoneEffectSetOffset_("ef732_09_light_reactor_c", gmc_o_dem_07, ATTACH_GLOBAL, Vec3(-0.5, 0.0, 0.0));	// ���A�N�^�[����
	SetEffectScale_(efc_reactor, 0.3);
	Wait_(36);
	DeleteEffectEmitter_(efc_reactor);
	
	PlaySE_("SE_DEM_079");		// ���L�A�̃��A�N�^�[����
	efc_reactor = SetSelectBoneEffectSetOffset_("ef732_09_light_reactor_c", gmc_o_dem_07, ATTACH_GLOBAL, Vec3(-0.5, 0.0, 0.0));	// ���A�N�^�[����
	SetEffectScale_(efc_reactor, 0.3);
	Wait_(36);
	DeleteEffectEmitter_(efc_reactor);
	
//����l�����A�N�^�[��G�遡����������������
	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");

	SetVisible(spike, false);
	PlaySE_("SE_FLD_135");		// ���A�N�^�[������
	efc_player = SetSelectBoneEffect_("ef732_09_light_reactor_c", player, ATTACH_EFFECT1);	// ���A�N�^�[����
	SetEffectScale_(efc_reactor, 0.3);
	Wait_(10);
	SetMotion_(player, player_touch_reactor, BLEND_L);
	SetFace_(player, "Face_left");
	WaitMotion(player);
	SetMotion_(player, player_touch_reactor_L, BLEND_N);
	Wait_(60);

	SetVisible(player, false);
	
//�����A�N�^�[�̃J�b�g����������������������
	SetPointCameraEye_("cameye002");
	SetPointCameraTarget_("camtgt002");

	PlaySE_("SE_DEM_079");		// ���L�A�̃��A�N�^�[����
	efc_reactor = SetSelectBoneEffectSetOffset_("ef732_09_light_reactor_c", gmc_o_dem_07, ATTACH_GLOBAL, Vec3(-0.5, 0.0, 0.0));	// ���A�N�^�[����
	SetEffectScale_(efc_reactor, 0.3);
	Wait_(36);
	DeleteEffectEmitter_(efc_reactor);

	PlaySE_("SE_DEM_079");		// ���L�A�̃��A�N�^�[����
	efc_reactor = SetSelectBoneEffectSetOffset_("ef732_09_light_reactor_c", gmc_o_dem_07, ATTACH_GLOBAL, Vec3(-0.5, 0.0, 0.0));	// ���A�N�^�[����
	SetEffectScale_(efc_reactor, 0.3);
	Wait_(36);
	DeleteEffectEmitter_(efc_reactor);

	//===============================================
	// *���N
	// �u�ǁc�c�ǂ��Ȃ�������Ă�́I�H
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_MONSTER_BOY");
	ShowMsg_("DEMO_421_MSG_070");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	task_cam = Task_AnimeMoveCamera_("anmeye004", "anmtgt004");
	Wait_(20);
	
	PlaySE_("SE_DEM_079");		// ���L�A�̃��A�N�^�[����
	efc_reactor = SetSelectBoneEffectSetOffset_("ef732_09_light_reactor_c", gmc_o_dem_07, ATTACH_GLOBAL, Vec3(-0.5, 0.0, 0.0));	// ���A�N�^�[����
	SetEffectScale_(efc_reactor, 0.3);
	Wait_(36);
	DeleteEffectEmitter_(efc_reactor);
	
	WaitTask(task_cam);

	EndDemo(FADE_COLOR_BLACK);
}
