//=============================================
//
//		demo212[�̐l����󂯌p��������_2(�ߋ��f��-�č�)]
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
	local task_cam, task_rena, task_man0, task_man1, task_woman, task_birdy;
	local task_smyou0, task_smyou1, task_smyou2;
	local efc_cam, efc_player;
	local frame_sum = 0;							// ���t���[����

// �����\�[�X�Ǎ�
	// �M�~�b�N
	local model_transfer = ReadGimmick_("o_dem_00");	// �]�����u
	// �L�����N�^�[
	local anses = GetPlayerId_();					// ��l���i�A���Z�X�j
	local model_rena = ReadNpc_("n007");			// ���i�[�e
	local model_man0 = ReadNpc_("n012");			// ���W�X�^���X�j���P
	local model_woman = ReadNpc_("n013");			// ���W�X�^���X����
	local model_birdy = ReadNpc_("n019");			// �o�[�f�B
	local model_man1 = ReadNpc_("n020");			// ���W�X�^���X�j���Q
	local model_smyou = ReadNpc_("m111_00");		// ���܂悤��낢
	// �G�t�F�N�g
	LoadEffect_("ef741_02_div_nor_hit");			// �q�b�g�G�t�F�N�g
	LoadEffect_("ef733_01_sym_shuchusen01");				// �W����
	// ���C�A�E�g
	LoadLayout_("noise");							//�m�C�Y

// ���z�u
	// �]�����u
	local transfer = ArrangePointGimmick_("o_dem_00", model_transfer, "obj_transfer000");
	
	// ��l���i�A���Z�X�j
	SetPointPos_(anses, "npc_anses000");
	SetStepSe_(anses, SILENT_STEP_SE);
	// ���i�[�e
	local rena = ArrangePointNpc_(model_rena, "npc_rena000");
	SetStepSe_(rena, SILENT_STEP_SE);
	// ���W�X�^���X�j���P
	local man0 = ArrangePointNpc_(model_man0, "npc_man000");
	SetStepSe_(man0, SILENT_STEP_SE);
	// ���W�X�^���X�j���Q
	local man1 = ArrangePointNpc_(model_man1, "npc_man100");
	SetStepSe_(man1, SILENT_STEP_SE);
	// ���W�X�^���X����
	local woman = ArrangePointNpc_(model_woman, "npc_woman000");
	SetStepSe_(woman, SILENT_STEP_SE);
	// �o�[�f�B
	local birdy = ArrangePointNpc_(model_birdy, "npc_birdy000");
	SetPointPosNoFit_(birdy, "npc_birdy000");
	SetStepSe_(birdy, SILENT_STEP_SE);
	AttachObject_(birdy, anses, ATTACH_EFFECT2);
	// ���܂悤��낢�P�`�R
	local smyou0 = ArrangePointNpc_(model_smyou, "npc_smyou000");
	local smyou1 = ArrangePointNpc_(model_smyou, "npc_smyou100");
	local smyou2 = ArrangePointNpc_(model_smyou, "npc_smyou200");
	SetScaleSilhouette(smyou0, SCALE.M, SILHOUETTE_WIDTH.M);
	SetScaleSilhouette(smyou1, SCALE.M, SILHOUETTE_WIDTH.M);
	SetScaleSilhouette(smyou2, SCALE.M, SILHOUETTE_WIDTH.M);
	SetStepSe_(smyou0, SILENT_STEP_SE);
	SetStepSe_(smyou1, SILENT_STEP_SE);
	SetStepSe_(smyou2, SILENT_STEP_SE);

// ����풓���[�V�����Ǎ�
	// ��l���i�A���Z�X�j
	local anses_ride00_L = ReadMotion_(anses, "Player_ride00_L");				// ���C�hL
	local anses_glide_L = ReadMotion_(anses, "Player_flight_glide_L");			// �O���C�hL
	local anses_glide_right_L = ReadMotion_(anses, "Player_flight_glide_right_L");	// ��s�i����j�E����
	// ���W�X�^���X�j���P�E�Q
	local man0_run_L = ReadMotion_(man0, "n012_run_L");							// ����L
	local man0_guard_L = ReadMotion_(man0, "n012_guard_L");						// �\��L
	local man1_run_L = ReadMotion_(man1, "n012_run_L");							// ����L
	local man1_guard_L = ReadMotion_(man1, "n012_guard_L");						// �\��L
	local man1_turn = ReadMotion_(man1, "n012_turn");							// �U�����
	// ���W�X�^���X����
	local woman_run_L = ReadMotion_(woman, "n013_run_L");						// ����L
	local woman_guard_L = ReadMotion_(woman, "n013_guard_L");					// �\��L
	// ���i�[�e
	local rena_run_L = ReadMotion_(rena, "n007_run_L");							// ����L
	local rena_caution_L = ReadMotion_(rena, "n007_caution_L");					// �x��L
	local rena_look_down_L = ReadMotion_(rena, "n007_look_down_L");				// ���ނ�
	local rena_look_up_L = ReadMotion_(rena, "n007_look_up_L");					// �������
	local rena_look_right_L = ReadMotion_(rena, "n007_look_right_L");			// �E������
	local rena_look_up02_L = ReadMotion_(rena, "n007_look_up02_L");			// �E������	

	// �o�[�f�B
	local birdy_glide_L = ReadMotion_(birdy, "n019_flight_glide_L");			// ����
	local birdy_glide_attack = ReadMotion_(birdy, "n019_glide_attack");			// �o�ꁨ�G�ɓˌ�
	// ���܂悤��낢
	local smyou_fall0 = ReadMotion_(smyou0, "m111_00_fall");					// �R���痎����
	local smyou_fall1 = ReadMotion_(smyou1, "m111_00_fall");					// �R���痎����
	local smyou_fall2 = ReadMotion_(smyou2, "m111_00_fall");					// �R���痎����

// ���Z�s�A��
	ChangeColorSepia();

// �����[�V�����ݒ�
	SetMotion_(anses, anses_ride00_L, BLEND_N);

//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------

	SetFadePlane_(FADE_PLANE.PLANE_3D);
	SetFade_(FADE_OUT, FADE_COLOR_WHITE, FADE_SHORT);
	
	SetLayoutAnime_("noise_in", false);
	PlayBgm_("BG_AMBI_016");
	WaitLayoutAnime();
	SetLayoutAnime_("noise_out", false);
	WaitLayoutAnime();
	
	//===============================================
	// ���Ȃ��̏���
	// �u�����@�O�ɓ����āc�c�I
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_MYSTERYGIRL");
	ShowMsg_("DEMO_212_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetMotion_(woman, woman_run_L, BLEND_N);
	task_woman = Task_MoveForward_(woman, 1.0, true);
	
	// ���J�b�g�P�����W�X�^���X�����ē�����`�`�`�`�`�`�`�`�`�`
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");		// 120F
	
//	StartDemo(FADE_COLOR_WHITE);
	SetFade_(FADE_IN, FADE_COLOR_WHITE, FADE_DEF);
	WaitFade_();
	
	SetMotion_(man0, man0_run_L, BLEND_N);
	task_man0 = Task_MoveForward_(man0, 1.0, true);
	Wait_(20);
	
	SetMotion_(man1, man1_run_L, BLEND_N);
	task_man1 = Task_MoveForward_(man1, 1.0, true);
	Wait_(25);
	
	SetMotion_(rena, rena_run_L, BLEND_N);
	task_rena = Task_MoveForward_(rena, 1.0, true);
	
	WaitTask(task_cam);
	DeleteAllTask_();
	
	SetPointPos_(man0, "npc_man001");
	SetPointPos_(man1, "npc_man101");
	SetPointPos_(woman, "npc_woman001");
	SetPointPos_(rena, "npc_rena001");
	SetMotion_(man0, man0_guard_L, BLEND_N);
	SetMotion_(man1, man1_guard_L, BLEND_N);
	SetMotion_(woman, woman_guard_L, BLEND_N);
	
	// ���J�b�g�Q���G�������ӂ�����`�`�`�`�`�`�`�`�`�`�`�`�`�`
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");
	
	SetMotion_(rena, rena_run_L, BLEND_N);
	task_rena = Task_MoveForward_(rena, 1.0, true);
	Wait_(12);
	
	DeleteTask_(task_rena);
	SetMotion_(rena, rena_caution_L, BLEND_M);
	Wait_(60);
	
	// ���J�b�g�R�����W�X�^���X�j���`�`�`�`�`�`�`�`�`�`�`�`�`�`
	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");
	
	//===============================================
	// *���W�X�^���X�`�i�j�j
	// �u���肳��Ă邼�I
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_212_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	//===============================================
	// *���W�X�^���X�a�i���j
	// �u�Ȃ�Ă��ƂȂ́I
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_212_MSG_030");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	// ���J�b�g�S�����W�X�^���X�ƃ��i�[�e�`�`�`�`�`�`�`�`�`�`�`
	SetPointCameraEye_("cameye002");
	SetPointCameraTarget_("camtgt002");
	
	SetMotionSpeed_(man1, 2.0);
	SetMotion_(man1, man1_turn, BLEND_XL);		// �U�����
	Wait_(25);
	SetMotionSpeed_(man1, 1.0);
	SetMotion_(man1, man1_guard_L, BLEND_L);	// �\��L
	
	//===============================================
	// *���W�X�^���X�b�i�j�j
	// �u�������̕����̂ق��ɂ��@���Ă邼�I
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_212_MSG_040");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	// ���J�b�g�T�����i�[�e�Y�[���C���`�`�`�`�`�`�`�`�`�`�`�`�`
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");		// 120F
	
	SetMotion_(rena, rena_look_down_L, BLEND_XL);	// ���ނ��ҋ@
	Wait_(15);
	
	//===============================================
	// ���Ȃ��̏���
	// �u����ȁc�c�I�@����܂łȂ́c�c�H
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_MYSTERYGIRL");
	ShowMsg_("DEMO_212_MSG_050");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	Wait_(60);

	//===============================================
	// *�A���Z�X
	// �u������߂�ȁI
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_212_MSG_060");
	KeyInputWait_();
	//===============================================

	//===============================================
	// *�A���Z�X
	// �u���������@�o�[�f�B�I�I
	//-----------------------------------------------
	ShowMsg_("DEMO_212_MSG_070");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetMotion_(rena, rena_look_up02_L, BLEND_L);
	Wait_(20);
	
	DeleteTask_(task_cam);
	SetMotion_(anses, anses_glide_L, BLEND_N);
	SetMotion_(birdy, birdy_glide_attack, BLEND_N);		// �o�ꁨ�G�ɓˌ�
	
	// ���J�b�g�U���o�[�f�B�o��`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`
	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");		// 310F
	SetMotion_(rena, rena_caution_L, BLEND_M);
	Wait_(110);
	
	// ���܂悤��낢�A�o�[�f�B�̕�������
	task_smyou1 = Task_WalkAroundToDir(smyou1, -90, ROTATE_DEMO_DEF/2);
	Wait_(10);
	task_smyou0 = Task_WalkAroundToDir(smyou0, -90, ROTATE_DEMO_DEF/2);
	Wait_(10);
	task_smyou2 = Task_WalkAroundToDir(smyou2, -90, ROTATE_DEMO_DEF/2);
	
	// ��������͑ҋ@���[�V�����ɂ���
	frame_sum += WaitTask(task_smyou1);
	SetMotion_(smyou1, MOT_WAIT, BLEND_M);
	frame_sum += WaitTask(task_smyou0);
	SetMotion_(smyou0, MOT_WAIT, BLEND_M);
	frame_sum += WaitTask(task_smyou2);
	SetMotion_(smyou2, MOT_WAIT, BLEND_M);
	Wait_(75-frame_sum);
	
	// �o�[�f�B�ˌ�
	efc_cam = SetCameraEffect_("ef733_01_sym_shuchusen01", 0);		// �W����
	Wait_(13);
	DeleteEffect_(efc_cam);
	Wait_(8);
	
	// ���܂悤��낢�P�`�R�]��
	uFallEnemy(smyou1, smyou_fall1, "anm_smyou100");
	Wait_(3);
	uFallEnemy(smyou0, smyou_fall0, "anm_smyou000");
	Wait_(3);
	uFallEnemy(smyou2, smyou_fall2, "anm_smyou200");
	Wait_(15);
	SetVisible(anses, false);		// ��l���`�����h�~
	
	WaitTask(task_cam);
	
	DeleteAllTask_();
	SetVisible(smyou0, false);
	SetVisible(smyou1, false);
	SetVisible(smyou2, false);
	
	SetMotion_(birdy, birdy_glide_L, BLEND_N);
	SetScaleSilhouette(birdy, SCALE.N, SILHOUETTE_WIDTH.N);
	task_birdy = Task_AnimeMoveNoFit_(birdy, "anm_birdy000");
	
	// ���J�b�g�V���o�[�f�B�J�����C���`�`�`�`�`�`�`�`�`�`�`�`�`
	SetPointCameraEye_("cameye003");
	SetPointCameraTarget_("camtgt003");
	Wait_(3);
	SetVisible(anses, true);
	SetMotion_(anses, anses_glide_L, BLEND_M);
	WaitTask(task_birdy);
		
	//===============================================
	// *�A���Z�X
	// �u�����`�����X���I�@�݂�ȑ�����I
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_212_MSG_080");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	// ���J�b�g�W�����W�X�^���X�B�J�����A�E�g�`�`�`�`�`�`�`�`�`
	SetPointCameraEye_("cameye004");
	SetPointCameraTarget_("camtgt004");
	
	SetMotion_(woman, woman_run_L, BLEND_L);
	task_woman = Task_MoveForward_(woman, 1.0, true);
	Wait_(10);
	
	SetMotion_(man0, man0_run_L, BLEND_L);
	task_man0 = Task_MoveForward_(man0, 1.0, true);
	Wait_(10);
	
	SetMotion_(man1, man1_run_L, BLEND_L);
	task_man1 = Task_MoveForward_(man1, 1.0, true);
	Wait_(10);
	
	SetMotion_(rena, rena_run_L, BLEND_L);
	task_rena = Task_MoveToPointSetSpeed_(rena, "npc_rena002", 2.0);
	WaitTask(task_rena);
	SetMotion_(rena, MOT_WAIT, BLEND_L);
	Wait_(10);
	SetMotion_(rena, rena_look_right_L, BLEND_XL);		// �E������
	Wait_(45);
	
	SetMotion_(rena, rena_look_up_L, BLEND_N);			// �������
	SetDir_(rena, 100);
	
	// ���J�b�g�X�����i�[�e�ƃA���Z�X�`�`�`�`�`�`�`�`�`�`�`�`�`
	SetPointCameraEye_("cameye005");
	SetPointCameraTarget_("camtgt005");
	
	//===============================================
	// *�A���Z�X
	// �u�ǂ������H�@���O���}����B
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_212_MSG_090");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetMotion_(rena, MOT_WAIT, BLEND_N);
	
	// ���J�b�g10�����i�[�e�t�o�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`
	SetPointCameraEye_("cameye006");
	SetPointCameraTarget_("camtgt006");
	
	SetMotion_(rena, rena_look_down_L, BLEND_XL);		// ���ނ�
	Wait_(45);
	SetMotion_(rena, MOT_WAIT, BLEND_L);
	Wait_(10);
	
	//===============================================
	// ���Ȃ��̏���
	// �u�c�c���肪�Ƃ��@�����Ă���āB
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_MYSTERYGIRL");
	ShowMsg_("DEMO_212_MSG_100");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetFace_(anses, "Face_right");	
	
	task_rena = Task_WalkAroundToDir(rena, 180, ROTATE_DEMO_DEF/2);
	WaitTask(task_rena);
	SetMotion_(rena, rena_run_L, BLEND_L);
	task_rena = Task_MoveForward_(rena, 1.0, true);
	Wait_(45);
	DeleteTask_(task_rena);

	// ���J�b�g11���A���Z�X�t�o�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`
	SetPointCameraEye_("cameye007");
	SetPointCameraTarget_("camtgt007");
	
	SetMotion_(anses, anses_glide_right_L, BLEND_N);		// ��s�i����j�E����
	Wait_(60);
	
	StopBgm_(3);
	PlaySE_("SE_DEM_050");
	SetLayoutAnime_("noise_in", false);												//�m�C�Y
	Wait_(30);
	
	SetFadePlane_(FADE_PLANE.PLANE_NORMAL);
	EndDemo(FADE_COLOR_WHITE);
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		���܂悤��낢�@�R���痎���鏈��
//------------------------------------------------
//	����	: id	�L�����N�^�[ID
//			: mot	���[�V������
//			: pos	�m�[�h��
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uFallEnemy(id, mot, pos)
{
	local task;
	
	SetSelectBoneEffect_("ef741_02_div_nor_hit", id, ATTACH_EFFECT1);
	SetMotion_(id, mot, BLEND_M);
	task = Task_AnimeMoveNoDir_(id, pos);
}
