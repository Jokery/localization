//=============================================
//
//		demo417[�C�b�^�u���̖W�Q]
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
	local task_cam, task_player, task_ittaburu, task_rukiya;
	local efc_player;

// ���t���O�ݒ�
	local bit_ruler = GetEventFlg_("BFG_RULER_ADD_019");			// Bit_219 ���[���ǉ��t���O

// �����\�[�X�Ǎ�
	// �L�����N�^�[
	local player		 = GetPlayerId_();					// ��l��
	local id_rukiya		 = ReadNpc_("n009");				// ���L��
	local id_ittaburu	 = ReadNpc_("m205_00");				// �C�b�^�u��
	// �M�~�b�N
	local id_core		 = ReadGimmick_("o_S02_09");
	local id_bom		 = ReadGimmick_("o_dem_17");
	local model_ruler = ReadGimmick_("o_com_08");			// ���[���|�C���g
	// �G�t�F�N�g
	LoadEffect_("ef733_01_sym_shuchusen01");				// �W�����G�t�F�N�g

// ���z�u
	// ��l��
	SetPointPos_(player, "player001");

	// ���L��
	local rukiya	 = ArrangePointNpc_(id_rukiya,		 "rukiya001");

	// �C�b�^�u��
	local ittaburu	 = ArrangePointNpc_(id_ittaburu,	 "rukiya001");
	SetMotion_(ittaburu, MOT_WAIT, 1);
	SetVisible(ittaburu,			 false);										//��\���ɂ���
	LoadEffect_("ef730_01_oth_dark_aura01");
	local efc_azamuku = SetSelectBoneEffectSetOffset_("ef730_01_oth_dark_aura01", ittaburu, ATTACH_EFFECT2, Vec3(0.0, -10.0, 0.0));

	local g_core = ArrangeGimmick_("o_S02_009", id_core, Vec3(0.0, 0.0, 0.0));
	local g_bom = ArrangePointGimmick_("o_dem_17", id_bom, "bom");
	
	// ���[���|�C���g
	local ruler = ArrangePointGimmick_("o_com_08", model_ruler, "obj_ruler000");
	// �����[���|�C���g�����ɋN�����Ă����ꍇ
	if (bit_ruler) { SetMotion_(ruler, MOT_GIMMICK_2, BLEND_N); }

// ����풓���[�V�����Ǎ�
	local p_nod		 = ReadMotion_(player, "Player_nod");			// ���ȂÂ�
	local p_turn	 = ReadMotion_(player, "Player_cage_turn");		// �U�����
	local p_turnL	 = ReadMotion_(player, "Player_cage_turn_L");	// �U������ҋ@
	local p_battle	 = ReadMotion_(player, "Player_run_battle");	// �퓬�ҋ@
	local p_ue		 = ReadMotion_(player, "Player_battle01_L");	// �퓬�ҋ@�����ނ�
	local p_left	 = ReadMotion_(player, "Player_look_left_L");	// ��������
	local p_right	 = ReadMotion_(player, "Player_look_right_L");	// �E������	
	local p_caution	 = ReadMotion_(player, "Player_caution01_L");	// �x��L
	local i_pres	 = ReadMotion_(ittaburu, "m205_00_Pressure_L");	// �Ј�

// ���J�����ݒ�
	SetPointCameraEye_("001_cameye");
	SetPointCameraTarget_("001_camtgt");

// ���������[�V����
	task_player	 = Task_AnimeMove_(player, "player_anm001");
	SetMotion_(player, MOT_RUN, 1);
	SetMotion_(rukiya, MOT_WALK, 1);

	SetStepSe_(ittaburu, SILENT_STEP_SE);							//���L���E�C�b�^�u����SE�𖳉��ɂ���
	SetStepSe_(rukiya, SILENT_STEP_SE);

//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);
	
	task_rukiya	 = Task_AnimeMove_(rukiya, "rukiya_anm001");
	Wait_(35);
	SetMotion_(player, p_caution, BLEND_M);							//��@���L��������܂Ōx�����[�V����
	WaitTask(task_player);	
	Wait_(10);
	
	SetMotion_(player, p_right, BLEND_XL);

	WaitTask(task_rukiya);
	SetMotion_(rukiya, MOT_WAIT, BLEND_L);

	Wait_(20);
	task_rukiya = Task_RotateToPos_(rukiya, GetPos_(player), 5.3);
	Wait_(20);
	DeleteTask_(task_rukiya);

	SetMotion_(player, MOT_WALK, BLEND_M);
	task_player = Task_RotateToPos_(player, GetPos_(rukiya), 5.7);
	Wait_(20);
	SetMotion_(player, MOT_WAIT, BLEND_M);	
	//===============================================
	// �����L��
	// �u���ĂƁc�c���������Ɓ@�Ԃ��󂷂�I
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RUKIYA");
	ShowMsg_("DEMO_417_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetMotion_(player, p_nod, BLEND_L);								//��@���ȂÂ�
	WaitMotion(player);
	SetMotion_(player, MOT_WAIT, BLEND_XL);
	
	task_rukiya = Task_RotateToDir_(rukiya, 180, 5.0);
	WaitTask(task_rukiya);
	task_rukiya	 = Task_AnimeMove_(rukiya, "rukiya_anm002");
	SetMotion_(rukiya, MOT_WALK, BLEND_L);
	Wait_(30);
	
	SetMotion_(player, MOT_RUN, BLEND_L);	
	task_player = Task_RotateToDir_(player, 180, 7.7);
	WaitTask(task_player);
	task_player = Task_MoveForward_(player, 0.7, true);
	
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 20);
	Wait_(20);
	DeleteTask_(task_player);

	WaitTask(task_rukiya);	
	SetPointPosNoFit_(rukiya, "rukiya001");
	SetMotion_(player, MOT_WAIT, 1);
	
	//���e��ǂݍ��݁A�z�u�A�\������
	
	SetMotion_(rukiya, MOT_WAIT, 1);
	SetDir_(rukiya, 197);
	task_cam = Task_AnimeMoveCamera_("001_anmeye", "001_anmtgt");
	Wait_(10);
	SetFade_(FADE_IN, FADE_COLOR_BLACK, 30);
	
	WaitTask(task_cam);
	
	//===============================================
	// �����L��
	// �u���肠�킹�ō�����@�`���`�Ȕ��e������
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RUKIYA");
	ShowMsg_("DEMO_417_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetPointPos_(player, "player001");
	local task_kaiwa = Task_RotateToPos_(rukiya, GetPos_(player), 5.0);
	WaitTask(task_kaiwa);
	SetPointCameraEye_("002_cameye");
	SetPointCameraTarget_("002_camtgt");
	
	SetDir_(rukiya, 180);
	task_rukiya	 = Task_AnimeMoveNoFit_(rukiya, "rukiya_anm003");
	WaitTask(task_rukiya);
	local task_kaiwa = Task_RotateToDir_(rukiya, 180, 5.0);
	WaitTask(task_kaiwa);
	
	Wait_(120);
	StopBgm_(30);
	StartEarthQuake_(10, 3, 0.3);
	PlaySE_("SE_DEM_014");
	Wait_(30);
	StartEarthQuake_(10, 3, 0.5);
	PlaySE_("SE_DEM_014");
	Wait_(30);
	
	SetVisible(ittaburu, true);										//�\���ɂ���
	task_rukiya	 = Task_AnimeMove_(ittaburu, "ittaburu_anm");
	SetMotion_(ittaburu, MOT_WALK, 1);
	SetMotionSpeed_(ittaburu, 0.5);
	task_cam = Task_AnimeMoveCamera_("002_anmeye", "002_anmtgt");
	DeleteTask_(task_cam);
	PlayBgm_("BGM_007");

	StartEarthQuake_(10, 3, 0.7);
	PlaySE_("SE_DEM_014");
	Wait_(30);

	StartEarthQuake_(10, 3, 0.7);
	PlaySE_("SE_DEM_014");
	Wait_(30);

	StartEarthQuake_(10, 3, 0.7);
	PlaySE_("SE_DEM_014");
	Wait_(30);

	StartEarthQuake_(10, 3, 0.7);
	PlaySE_("SE_DEM_014");
	Wait_(30);
	
	StartEarthQuake_(10, 3, 0.7);
	PlaySE_("SE_DEM_014");	

	SetMotionSpeed_(ittaburu, 1);
	
	Wait_(10);		
	SetMotion_(ittaburu, MOT_WAIT, BLEND_M);
	Wait_(5);
	StartEarthQuake_(10, 3, 0.7);
	PlaySE_("SE_DEM_014");
	
	WaitTask(task_rukiya);

	Wait_(30);
	
	task_cam = Task_AnimeMoveCamera_("002_anmeye", "002_anmtgt");
	StartBlurEffect_();															//�u���[�J�n
	WaitTask(task_cam);
	EndBlurEffect_();															//�u���[�I��
	Wait_(15);
	PlaySE_("SE_DEM_026");	// ��SE:�W����
	local efc_syutyu = SetCameraEffect_("ef733_01_sym_shuchusen01", 100);				//�W�����\��
	//===============================================
	// ���C�b�^�u��
	// �u�����́@������̂ł���I
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ITABURU");
	ShowMsg_("DEMO_417_MSG_030");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	DeleteEffect_(efc_syutyu);
	SetPointCameraEye_("003_cameye");
	SetPointCameraTarget_("003_camtgt");

	SetMotion_(ittaburu, MOT_WAIT, 1);

	local task_kaiwap = Task_RotateToPos_(player, GetPos_(ittaburu), 10.0);			//
	SetMotion_(player, MOT_WALK, BLEND_M);
	local task_kaiwa = Task_RotateToPos_(rukiya, GetPos_(ittaburu), 10.0);			//
	WaitTask(task_kaiwap);
	SetMotion_(player, MOT_WAIT, BLEND_M);
	
	SetMotion_(rukiya, MOT_TALK, BLEND_L);
	
	//===============================================
	// �����L��
	// �u����܂��@�x���o�΂��˂��@�C�b�^�u���I
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RUKIYA");
	ShowMsg_("DEMO_417_MSG_040");
	WaitMotion(rukiya);
	SetMotion_(rukiya, MOT_TALKLOOP, 1);
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	task_cam = Task_AnimeMoveCamera_("003_anmeye", "003_anmtgt");
		
	SetMotion_(player, p_battle, BLEND_L);	// ���聨�퓬�ҋ@
	
	task_player = Task_MoveForward_(player, 0.5, true);
		
	Wait_(5);
	
	task_rukiya	 = Task_AnimeMove_(rukiya, "rukiya_anm004");

	Wait_(15);
	
	DeleteTask_(task_player);
	
	SetMotion_(player, p_ue, BLEND_M);
	
	SetMotion_(rukiya, MOT_WAIT, 1);
	WaitTask(task_player);
	SetMotion_(player, p_ue, 1);
		
	WaitTask(task_cam);
	//===============================================
	// ���C�b�^�u��
	// �u�c�c�M�l�̓��L���I�@�Ȃ��R�R�ɁI�H
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ITABURU");
	ShowMsg_("DEMO_417_MSG_050");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	SetVisible(player, false);
	SetPointCameraEye_("004_cameye");
	SetPointCameraTarget_("004_camtgt");
	SetFace_(rukiya, "Face_laugh");
	SetMotion_(rukiya, MOT_TALKLOOP, BLEND_L);
	//===============================================
	// �����L��
	// �u�����͂��́I�@���́@�����܂Ȋč���
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RUKIYA");
	ShowMsg_("DEMO_417_MSG_060");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	SetMotion_(ittaburu, i_pres, 1);
	Wait_(10);
	SetPointCameraEye_("005_cameye");
	SetPointCameraTarget_("005_camtgt");
	SetVisible(rukiya, false);
	
	//===============================================
	// ���C�b�^�u��
	// �u���܂�I�@���̃l�Y�~�ǂ��߂��I
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ITABURU");
	ShowMsg_("DEMO_417_MSG_070");
	KeyInputWait_();
	//===============================================
	
	//===============================================
	// ���C�b�^�u��
	// �u����ȏ�@�M�l��́@�D���ɂ͂�����I
	//-----------------------------------------------
	ShowMsg_("DEMO_417_MSG_080");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetMotion_(ittaburu, MOT_SPELL_START, 2);
	WaitMotion(ittaburu);
	PlaySE_("SE_DEM_091");
	SetMotion_(ittaburu, MOT_SPELL_ACTUATE, 1);
	Wait_(35);
	SetLinearCameraEye_(Vec3(0.0, 25.60247, 120.76274), 5);
	
	EncountEndDemo(ENCOUNT_BOSS);
}
