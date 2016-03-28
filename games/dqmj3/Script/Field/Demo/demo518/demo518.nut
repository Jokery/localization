//=============================================
//
//		demo518[�f�X�o�[���P��]
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
	local task_cam, task_player, task_burdy, task_desburn;
	local efc_cam, efc_player, efc_burdy, efc_desburn;

// �����\�[�X�Ǎ�
	// �L�����N�^�[
	local player = GetPlayerId_();					// ��l��
	local model_burdy = ReadNpc_("n019");			// �o�[�f�B
	local model_desburn = ReadNpc_("m206_00");		// �f�X�o�[��
	// �M�~�b�N
	local model_wall = ReadGimmick_("o_V00_03");	// �閧��n������̊��(�ҋ@)
	local model_switch = ReadGimmick_("o_V00_11");	// �F�ؑ��u�i�N���O�j
	local model_ruler = ReadGimmick_("o_com_08");	// ���[���|�C���g
	// �G�t�F�N�g
	LoadEffect_("ef712_10_emo_surprise01");			// �u�I�v
	LoadEffect_("ef733_01_sym_shuchusen01");		// �W����
	LoadEffect_("ef721_02_nat_smoke_n02");

// ���z�u
	// ��l��
	SetPointPos_(player, "player000");
	// �o�[�f�B
	local burdy = ArrangePointNpc_(model_burdy, "npc_burdy000");
	SetScaleSilhouette(burdy, SCALE.N, SILHOUETTE_WIDTH.N);
	// �f�X�o�[��
	local desburn = ArrangePointNpc_(model_desburn, "npc_desburn000");
	SetPointPosNoFit_(desburn, "npc_desburn000");
	
	// �閧��n������̊��(�ҋ@)
	local wall = ArrangePointGimmick_("o_V00_03", model_wall, "obj_wall000");
	// �F�ؑ��u�i�N���O�j
	local switch000 = ArrangePointGimmick_("o_V00_11", model_switch, "obj_switch000");
	// ���[���|�C���g
	local ruler = ArrangePointGimmick_("o_com_08", model_ruler, "obj_ruler000");
	if(GetEventFlg_("BFG_RULER_ADD_021") == true){
		SetMotion_(ruler, MOT_GIMMICK_2, BLEND_N);
	}

// ����풓���[�V�����Ǎ�
	local player_run_battle = ReadMotion_(player, "Player_run_battle");		// ���聨�퓬�ҋ@
	local player_battle_L = ReadMotion_(player, "Player_battle_L");			// �퓬�ҋ@L
	local player_look_left_L = ReadMotion_(player, "Player_look_left_L");	// ���������������L

	local burdy_idol_L = ReadMotion_(burdy, "n019_idol");	// �ҋ@L
	local burdy_talk_L = ReadMotion_(burdy, "n019_talk");	// ��bL
	local burdy_run_L = ReadMotion_(burdy, "n019_run_L");	// ����L
	
	local desburn_flight_Hovering_L = ReadMotion_(desburn, "m206_00_flight_Hovering_L");	// �z�o�����OL

// ���J�����ݒ�
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");
	WaitLod_();

// ���V��ݒ�
	SetWeather_(WEATHER.BAD);

//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------
	
	SetMotion_(desburn, desburn_flight_Hovering_L, BLEND_N);

	local task_burdy_step = Task_ChangeStepSe(burdy, "SE_FLD_032", 18);								//�o�[�f�B����

	SetMotion_(burdy, MOT_WALK, BLEND_N);
	task_burdy = Task_AnimeMove_(burdy, "anm_burdy000");	// 60F
	
	StartDemo(FADE_COLOR_BLACK);	
	
	Wait_(10);
	
	WaitTask(task_burdy);
	DeleteTaskStepSe(burdy, task_burdy_step);

	SetMotion_(burdy, burdy_talk_L, BLEND_L);
	
	//===============================================
	//*�o�[�f�B
	// 	�u���H�@�����������l�[�H
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_BIRDY");
	ShowMsg_("DEMO_518_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
		
	SetMotion_(burdy, burdy_idol_L, BLEND_L);
	
	Wait_(35);
	
	task_desburn = Task_AnimeMoveNoFit_(desburn, "anm_desburn000");	// 50F
	Wait_(15);
	
	StopBgm_(20);
	Wait_(20);
	
	efc_player = SetSelectBoneEffectSetOffset_("ef712_10_emo_surprise01", player, ATTACH_EFFECT1, Vec3(0.0, 0.0, 0.0));
	efc_burdy = SetSelectBoneEffectSetOffset_("ef712_10_emo_surprise01", burdy, ATTACH_EFFECT1, Vec3(-6.0, -0.2, 4.0));
	SetEffectScale_(efc_burdy, 1.75);
	PlaySE_("SE_DEM_053");
	
	SetMotion_(player, player_look_left_L, BLEND_L);
	
	Wait_(30);
		
	PlaySE_("SE_FLD_032");										//�o�[�f�B�̑���

	SetMotion_(burdy, MOT_WALK, BLEND_L);
	task_burdy = Task_RotateToDir_(burdy, 330, 2.85);
	
	WaitTask(task_burdy);
	
	SetMotion_(burdy, burdy_idol_L, BLEND_L);
	
	Wait_(35);
	
	DeleteTask_(task_desburn);
	
	SetScaleSilhouette(desburn, 0.85, 1.0);
	
	//��������������������������������������
	//���J�b�g2
	//��������������������������������������
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");		// 90F
	DeleteTask_(task_cam);
	
	SetPointPos_(player, "player001");
	SetPointPos_(burdy, "npc_burdy001");
	SetPointPosNoFit_(desburn, "npc_desburn001");
	SetPointPos_(switch000, "obj_switch001");
	
	SetStepSe_(player, SILENT_STEP_SE);	// ������ �����ɂ���
	
	
	
	SetMotion_(player, MOT_RUN, BLEND_N);
	local task_player_step = Task_ChangeStepSe(player, "SE_FLD_016", 10);							//��l������
	SetMotion_(burdy, burdy_run_L, BLEND_N);
	local task_burdy_step = Task_PlaySe_("SE_FLD_032", 20);										//�o�[�f�B�̑���
	Wait_(3);
	local task_burdy_step2 = Task_PlaySe_("SE_FLD_032", 20);										//�o�[�f�B�̑���
	
	task_player = Task_AnimeMove_(player, "anm_player000");	// 30F
	task_burdy = Task_AnimeMove_(burdy, "anm_burdy001");	// 30F
	Wait_(10);
	SetMotion_(player, player_run_battle, BLEND_XL);
	
	WaitTask(task_player);
	WaitTask(task_burdy);
	DeleteTaskStepSe(player, task_player_step);
	DeleteTask_(task_burdy_step);
	DeleteTask_(task_burdy_step2);
	
	SetMotion_(player, player_battle_L, BLEND_XL);

	SetMotion_(burdy, burdy_idol_L, BLEND_XL);
	
	Wait_(20);
	
	//===============================================
	//*�o�[�f�B
	// 	�u�z���b�c�I�H
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_BIRDY");
	ShowMsg_("DEMO_518_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	Wait_(5);
	
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");	// 90F
	local task_fly = Task_PlaySe_("SE_FLD_036", 20);
	PlayBgm_("BGM_007");
	task_desburn = Task_AnimeMoveNoFit_(desburn, "anm_desburn001");	// 115F
	
	WaitTask(task_cam);
	
	Wait_(20);
	
	SetMotion_(desburn, MOT_WAIT, 20);
	DeleteTask_(task_fly);
	
	Wait_(2);
	
	PlaySE_("SE_FLD_168");
	
	WaitTask(task_desburn);
	
	task_desburn = Task_AnimeMoveNoFit_(desburn, "anm_desburn002");	// 5F
	
	WaitTask(task_desburn);
	
	efc_desburn = SetSelectBoneEffectSetOffset_("ef721_02_nat_smoke_n02", desburn, ATTACH_GLOBAL, Vec3(0.0, -2.2, 0.0));
	SetEffectScale_(efc_desburn, 2.5);
	
	StartDecayEarthQuake_(30, 3, 2.0)

	Wait_(70);

	//===============================================
	//*�f�X�o�[��
	// 	�u�G���m�@���񂷂��[�܂����[�����A���B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_DEATHBURN");
	ShowMsg_("DEMO_518_MSG_030");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetMotion_(burdy, burdy_talk_L, BLEND_L);
	
	//===============================================
	//*�o�[�f�B
	// 	�u�ǂ����@�������Ă���Ȃ������l�[�I
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_BIRDY");
	ShowMsg_("DEMO_518_MSG_040");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetMotion_(burdy, burdy_idol_L, BLEND_L);
	
	Wait_(25);
	
	SetActive_(player, false);
	SetActive_(burdy, false);
	
	//��������������������������������������
	//���J�b�g3
	//��������������������������������������
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");		// 57F
	
	SetPointPos_(desburn, "npc_desburn002");
	
	Wait_(25);
	
	SetMotion_(desburn, MOT_SPELL_ACTUATE, BLEND_L);
	PlaySE_("SE_DEM_095");
	Wait_(25);
	
	efc_cam = SetCameraEffect_("ef733_01_sym_shuchusen01", CAMERA_DEF);
	SetMotionSpeed_(desburn, 0.8);
	
	Wait_(7);
	
	EncountEndDemo(ENCOUNT_BOSS);
}
