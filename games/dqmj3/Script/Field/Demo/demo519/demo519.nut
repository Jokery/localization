//=============================================
//
//		demo519[�f�X�o�[���Đ�]
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
	LoadEffect_("ef733_01_sym_shuchusen01");				// �W����
	LoadEffect_("ef721_02_nat_smoke_n02");

// ���z�u
	// ��l��
	SetPointPos_(player, "player002");
	// �o�[�f�B
	local burdy = ArrangePointNpc_(model_burdy, "npc_burdy002");
	SetScaleSilhouette(burdy, SCALE.N, SILHOUETTE_WIDTH.N);
	// �f�X�o�[��
	local desburn = ArrangePointNpc_(model_desburn, "npc_desburn001");
	SetScaleSilhouette(desburn, 0.85, 1.0);
	task_desburn = Task_AnimeMoveNoFit_(desburn, "anm_desburn001");	// 115F
	DeleteTask_(task_desburn);
	
	// �閧��n������̊��(�ҋ@)
	local wall = ArrangePointGimmick_("o_V00_03", model_wall, "obj_wall000");
	// �F�ؑ��u�i�N���O�j
	local switch000 = ArrangePointGimmick_("o_V00_11", model_switch, "obj_switch000");
	SetPointPos_(switch000, "obj_switch001");
	// ���[���|�C���g
	local ruler = ArrangePointGimmick_("o_com_08", model_ruler, "obj_ruler000");
	if(GetEventFlg_("BFG_RULER_ADD_021") == true){
		SetMotion_(ruler, MOT_GIMMICK_2, BLEND_N);
	}

// ����풓���[�V�����Ǎ�
	local player_battle_L = ReadMotion_(player, "Player_battle_L");			// �퓬�ҋ@L

	local burdy_idol_L = ReadMotion_(burdy, "n019_idol");	// �ҋ@L
	local burdy_talk_L = ReadMotion_(burdy, "n019_talk");	// ��bL
	
	local desburn_flight_Hovering_L = ReadMotion_(desburn, "m206_00_flight_Hovering_L");	// �z�o�����OL

// ���J�����ݒ�
	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");
	WaitLod_();

// ���V��ݒ�
	SetWeather_(WEATHER.BAD);

//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------

	SetMotion_(player, player_battle_L, BLEND_N);
	SetMotion_(burdy, burdy_idol_L, BLEND_N);
	SetMotion_(desburn, desburn_flight_Hovering_L, BLEND_N);
	
	task_desburn = Task_AnimeMoveNoFit_(desburn, "anm_desburn001");	// 130F

	StartDemo(FADE_COLOR_BLACK);
	local task_fly = Task_PlaySe_("SE_FLD_036", 26);

	Wait_(95);
	
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

	Wait_(80);
	
	SetMotion_(burdy, burdy_talk_L, BLEND_L);
	
	Wait_(5);
	
	//===============================================
	//*�o�[�f�B
	// 	�u�߂��Ă����l�[�@�A���Z�X�I 
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_BIRDY");
	ShowMsg_("DEMO_519_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetMotion_(burdy, burdy_idol_L, BLEND_L);
	
	Wait_(30);
	
	SetActive_(player, false);
	SetActive_(burdy, false);
	
	//��������������������������������������
	//���J�b�g2
	//��������������������������������������
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");		// 57F
	DeleteTask_(task_cam);
	
	SetPointPos_(desburn, "npc_desburn002");
	
	Wait_(10);
	
	//===============================================
	//*�f�X�o�[��
	// 	�u�G���m�@���񂷂��[�܂����[�����A���B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_DEATHBURN");
	ShowMsg_("DEMO_519_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");		// 57F
	
	Wait_(25);
	
	SetMotion_(desburn, MOT_SPELL_ACTUATE, BLEND_L);
	PlaySE_("SE_DEM_095");

	Wait_(25);
	
	efc_cam = SetCameraEffect_("ef733_01_sym_shuchusen01", CAMERA_DEF);
	SetMotionSpeed_(desburn, 0.8);
	
	Wait_(7);
	
	EncountEndDemo(ENCOUNT_BOSS);
}
