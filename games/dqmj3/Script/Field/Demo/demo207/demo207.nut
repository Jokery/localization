//=============================================
//
//		demo207[�u���h���h�o��]
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
	local task_cam, task_player, task_bundoru;
	local efc_cam, efc_bun;

// ���t���O�ݒ�
	local bit_ruler = GetEventFlg_("BFG_RULER_ADD_010");			// Bit_210 ���[���ǉ��t���O

// �����\�[�X�Ǎ�
	// �M�~�b�N
	local model_ruler = ReadGimmick_("o_com_08");	// ���[���|�C���g
	// �L�����N�^�[
	local player = GetPlayerId_();					// ��l��
	local model_bundoru = ReadNpc_("m203_00");		// �u���h���h
	// �G�t�F�N�g
	LoadEffect_("ef733_01_sym_shuchusen01");		// �W����
	LoadEffect_("ef730_01_oth_dark_aura01");		// �܂��܂������I�[��

// ���z�u
	// ��l��
	SetPointPos_(player, "player000");
	// �u���h���h
	local bundoru = ArrangePointNpc_(model_bundoru, "npc_bundoru000");
	SetScaleSilhouette(bundoru, SCALE.M, SILHOUETTE_WIDTH.M);
	efc_bun = SetSelectBoneEffectSetOffset_("ef730_01_oth_dark_aura01", bundoru, ATTACH_EFFECT2, Vec3(0.0, -5.0, 0.0));		//���I�[��


// ����풓���[�V�����Ǎ�
	// ���[���|�C���g
	local ruler = ArrangePointGimmick_("o_com_08", model_ruler, "obj_ruler000");
	// �����[���|�C���g�����ɋN�����Ă����ꍇ
	if (bit_ruler) { SetMotion_(ruler, MOT_GIMMICK_2, BLEND_N); }
	
	// ��l��
	local player_caution01_L = ReadMotion_(player, "Player_caution01_L");	// �x��L
	local player_run_battle = ReadMotion_(player, "Player_run_battle");		// ���聨�퓬�ҋ@
	local player_battle_L = ReadMotion_(player, "Player_battle_L");			// �퓬�ҋ@L
	
	// �u���h���h
	local bundoru_stand_L = ReadMotion_(bundoru, "m203_00_stand_L");		// �f���p�ʏ�ҋ@L
	local bundoru_talk = ReadMotion_(bundoru, "m203_00_talk");				// ��b�J�n
	local bundoru_talk_L = ReadMotion_(bundoru, "m203_00_talk_L");			// ��bL

// ���������[�V�����ݒ�
	SetMotion_(player, MOT_WALK, BLEND_N);
	task_player = Task_MoveForward_(player, 1.0, false);
	SetMotion_(bundoru, bundoru_stand_L, BLEND_N);
	
// �����Ԑݒ�
	SetTime_(START_TIME_ZONE_NIGHT);
	
// ���J�����ݒ�
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");			// 135F

//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);
	
	// ���J�b�g�P����l���J�����C���`�`�`�`�`�`�`�`�`�`�`�`�`�`
	Wait_(105);
	DeleteTask_(task_player);
	SetMotion_(player, player_caution01_L, BLEND_L);		// �x��L
	
	WaitTask(task_cam);
	
	// ���J�b�g�Q���u���h���h������A�b�v�`�`�`�`�`�`�`�`�`�`�`
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");
	
	task_bundoru = Task_WalkAroundToDir(bundoru, 0, ROTATE_DEMO_DEF);
	WaitTask(task_bundoru);
	SetMotion_(bundoru, bundoru_talk, BLEND_M);		// ��b
	WaitMotion(bundoru);
	SetMotion_(bundoru, bundoru_talk_L, BLEND_M);	// ��bL
	
	//===============================================
	// *�u���h���h
	// �u�L�������b�I�H�@�N�ŃX���I
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_207_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetPointPos_(player, "player001");
	SetMotion_(bundoru, bundoru_stand_L, BLEND_L);	// �ҋ@L
	
	// ���J�b�g�R����l���J�����C���`�`�`�`�`�`�`�`�`�`�`�`�`�`
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");			// 45F
	
	Wait_(10);
	SetMotion_(player, player_run_battle, BLEND_L);	// ���聨�퓬�ҋ@
	WaitMotion(player);
	SetMotion_(player, player_battle_L, BLEND_L);	// �퓬�ҋ@L
	
	SetMotion_(bundoru, bundoru_talk, BLEND_M);		// ��b
	WaitMotion(bundoru);
	SetMotion_(bundoru, bundoru_talk_L, BLEND_M);	// ��bL
	
	//===============================================
	// ���u���h���h
	// �u���c�c���O���@�ǂ����Ă����ɁI�H
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_BUNDORUDO");
	ShowMsg_("DEMO_207_MSG_020");
	KeyInputWait_();
	
	//-----------------------------------------------
	// ��
	// �u�܂����c�c�{�[�V���b�N��|����
	//-----------------------------------------------
	ShowMsg_("DEMO_207_MSG_030");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	WaitTask(task_cam);
	SetMotion_(bundoru, MOT_WAIT, BLEND_N);	// �ҋ@L
	
	// ���J�b�g�S���u���h���h�A�b�v�`�`�`�`�`�`�`�`�`�`�`�`�`�`
	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");
	
	//===============================================
	// ���u���h���h
	// �u���ނށc�c�{�[�V���b�N�̐K�ʂ�����
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_BUNDORUDO");
	ShowMsg_("DEMO_207_MSG_040");
	KeyInputWait_();
	
	//-----------------------------------------------
	// ��
	// �u�������@�y����E�o�����@���O��
	//-----------------------------------------------
	ShowMsg_("DEMO_207_MSG_050");
	KeyInputWait_();
	
	//-----------------------------------------------
	// ��
	// �u�Ђ��̍��́@���߂ɒf�Ɍ���c�c
	//-----------------------------------------------
	ShowMsg_("DEMO_207_MSG_060");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	StopBgm_(BGM_STOP_DEF);
	SetMotion_(bundoru, MOT_SWORD_ACTUATE, BLEND_M);
	PlaySE_("SE_DEM_106");
	Wait_(36);
	SetMotionSpeed_(bundoru, 0.8);
	efc_cam = SetCameraEffect_("ef733_01_sym_shuchusen01", CAMERA_DEF);		// �W����
	
	EncountEndDemo(ENCOUNT_BOSS);
}
