//=============================================
//
//		demo831[�̋��̐�]
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
	local task_cam, task_player, task_rena, task_aroma, task_star;
	local task_aroma_step;
	local efc_player, efc_aroma, efc_star;

// �����Ԑݒ�
	SetTime_(START_TIME_ZONE_NIGHT);

// �����\�[�X�Ǎ�
	// �M�~�b�N
	local model_base = ReadGimmick_("o_effect_base");	// �G�t�F�N�g�x�[�X
	local model_reactor = ReadGimmick_("o_dem_07");		// ���A�N�^�[
	// �L�����N�^�[
	local player = GetPlayerId_();						// ��l��
	local model_rena = ReadNpc_("n007");				// ���i�[�e
	local model_aroma = ReadNpc_("n018");				// �A���}
	// �G�t�F�N�g
	LoadEffect_("ef712_10_emo_surprise01");				// �u�I�v
	LoadEffect_("ef712_04_emo_joy01");					// ���
	LoadEffect_("ef732_25_star_seed_base01");			// �X�^�[�V�[�h

// ���z�u
	// ���A�N�^�[�i��l�����j
	local reactor0 = ArrangeGimmick_("o_dem_07", model_reactor, false);
	SetScaleSilhouette(reactor0, 0.7, 0.7);
	SetMotion_(reactor0, MOT_GIMMICK_1, BLEND_N);
	// ���A�N�^�[�i�A���}���j
	local reactor1 = ArrangeGimmick_("o_dem_07", model_reactor, false);
	SetScaleSilhouette(reactor1, 0.7, 0.7);
	SetMotion_(reactor1, MOT_GIMMICK_1, BLEND_N);
	// �X�^�[�V�[�h�i�G�t�F�N�g�x�[�X�j
	local star = ArrangePointGimmick_("o_effect_base", model_base, "obj_star000");
	SetPointPosNoFit_(star, "obj_star000");

	// ��l��
	SetPointPos_(player, "player000");
	// ���i�[�e
	local rena = ArrangePointNpc_(model_rena, "npc_rena000");
	SetStepSe_(rena, "SE_FLD_016");
	// �A���}
	local aroma = ArrangePointNpc_(model_aroma, "npc_aroma000");
	SetStepSe_(aroma, SILENT_STEP_SE);

// ����풓���[�V�����Ǎ�
	// ��l��
	local player_look_left_L = ReadMotion_(player, "Player_look_left_L");		// ��������L
	local player_look_right_L = ReadMotion_(player, "Player_look_right_L");		// �E������L
	local player_nod = ReadMotion_(player, "Player_nod");						// ����
	local player_exchange_L = ReadMotion_(player, "Player_exchange_reactor_L");	// ���A�N�^�[������L
	local player_exchange = ReadMotion_(player, "Player_exchange_reactor");		// ���A�N�^�[��n�����ҋ@
	// ���i�[�e
	local rena_look_left_L = ReadMotion_(rena, "n007_look_left_L");				// ��������L
	local rena_look_right_L = ReadMotion_(rena, "n007_look_right_L");			// �E������L
	local rena_talk01 = ReadMotion_(rena, "n007_talk01");						// ��b�i������ɂ��Ă�j
	local rena_talk01_L = ReadMotion_(rena, "n007_talk01_L");					// ��bL�i������ɂ��Ă�j
	// �A���}
	local aroma_look_up_L = ReadMotion_(aroma, "n018_look_up_L");				// �������L
	local aroma_look_down_L = ReadMotion_(aroma, "n018_look_down_L");			// ��������L
	local aroma_look_right_L = ReadMotion_(aroma, "n018_look_right_L");			// �E������L
	local aroma_star_L = ReadMotion_(aroma, "n018_star_seed_L");				// �X�^�[�V�[�h������L
	local aroma_star_look_L = ReadMotion_(aroma, "n018_star_seed_look_L");		// �X�^�[�V�[�h����L
	local aroma_exchange_L = ReadMotion_(aroma, "n018_exchange_reactor_L");		// ���A�N�^�[������L
	local aroma_exchange = ReadMotion_(aroma, "n018_exchange_reactor");			// ���A�N�^�[��n�����ҋ@

// ��LOD�ǂݍ���
	ReadWaitingLod("lodeye000", "lodtgt000");

// ���J�����ݒ�
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");		// 180F


//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);

	// ���J�b�g�P���A���}�փY�[���C���`�`�`�`�`�`�`�`�`�`�`�`�`
	Wait_(35);
	task_aroma = Task_RotateToDir_(aroma, -65, 0.25);

	WaitTask(task_aroma);
	WaitTask(task_cam);
	Wait_(50);

	//---
	SetMotion_(player, MOT_WALK, BLEND_N);
	Wait_(5);
	SetMotion_(rena, MOT_WALK, BLEND_N);

	task_player = Task_MoveToPointSetSpeed_(player, "player001", 0.5);
	task_rena = Task_MoveToPointSetSpeed_(rena, "npc_rena001", 0.5);

	DeleteTask_(task_aroma);
	SetDir_(aroma, -90);
	//---


	// ���J�b�g�Q����l���ƃ��i�[�e�A�J�����C���`�`�`�`�`�`�`�`
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");		// 75F

	WaitTask(task_rena);
	SetMotion_(rena, MOT_WAIT, BLEND_L);
	WaitTask(task_player);
	SetMotion_(player, MOT_WAIT, BLEND_L);

	WaitTask(task_cam);
	Wait_(30);


	// ���J�b�g�R���A���}�A�U������`�`�`�`�`�`�`�`�`�`�`�`�`�`
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");

	SurpriseDispSetOffset(aroma, Vec3(0, 2.1, 0), 0.5);
	Wait_(30);

	SetMotion_(aroma, MOT_WALK, BLEND_L);
	task_aroma = Task_RotateToDir_(aroma, 90, ROTATE_DEMO_DEF);
	task_aroma_step = Task_PlaySe_("SE_FLD_016", 15);
	WaitTask(task_aroma);
	SetMotion_(aroma, MOT_WAIT, BLEND_XL);
	Wait_(6);
	DeleteTask_(task_aroma_step);

	//---
	SetPointPos_(player, "player002");
	SetPointPos_(rena, "npc_rena002");

	SetMotion_(player, MOT_WALK, BLEND_N);
	Wait_(5);
	SetMotion_(rena, MOT_WALK, BLEND_N);

	task_player = Task_MoveToPointSetSpeed_(player, "player003", 0.5);
	Wait_(5);
	task_rena = Task_MoveToPointSetSpeed_(rena, "npc_rena003", 0.5);

	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");
	//---


	// ���J�b�g�S����l���ƃ��i�[�e�A�J�����C���`�`�`�`�`�`�`�`
	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");

	WaitTask(task_player);
	SetMotion_(player, MOT_WAIT, BLEND_L);

	WaitTask(task_rena);
	task_rena = Task_RotateToDir_(rena, -45, ROTATE_DEMO_DEF);
	WaitTask(task_rena);
	SetMotion_(rena, MOT_WAIT, BLEND_L);

	MotionTalk(aroma);

	//===============================================
	// ���A���}
	// �u�����I�@����Ɨ�����ˁ@�ӂ���Ƃ��B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_AROMA");
	ShowMsg_("DEMO_831_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	SetMotion_(aroma, MOT_WAIT, 24);
	MotionTalk(rena);

	//===============================================
	// �����i�[�e
	// �u�A���}�c�c�����������́c�c�H
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_831_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	SetMotion_(rena, MOT_WAIT, BLEND_XL);
	Wait_(10);

	SetMotion_(aroma, aroma_look_down_L, BLEND_XL);		// ��������L
	Wait_(45);

	SetMotion_(aroma, MOT_WAIT, BLEND_XL);
	Wait_(22);
	SetMotion_(aroma, MOT_TALKLOOP, 14);

	//===============================================
	// ���A���}
	// �u�c�c�ږ����@�����ԗ��������ā@�q�}�ɂȂ�����
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_AROMA");
	ShowMsg_("DEMO_831_MSG_030");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	SetMotion_(aroma, MOT_WALK, BLEND_XL);
	task_aroma_step = Task_PlaySe_("SE_FLD_016", 15);
	Wait_(5);
	task_aroma = Task_RotateToDir_(aroma, -90, 3.25);
	WaitTask(task_aroma);
	SetMotion_(aroma, MOT_WAIT, 12);
	Wait_(14);
	DeleteTask_(task_aroma_step);

	SetVisible(rena, false);


	// ���J�b�g�T���A���}�A�o�`�m�t�o�`�`�`�`�`�`�`�`�`�`�`�`�`
	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");		// 180F

	SetMotion_(aroma, aroma_look_up_L, 20);		// �������L

	//===============================================
	// ���A���}
	// �u���āc�c�A�^�V�����́@�̋��̐����̂Ă��B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_AROMA");
	ShowMsg_("DEMO_831_MSG_040");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	SetVisible(player, false);
	SetVisible(rena, true);
	DeleteTask_(task_cam);


	// ���J�b�g�U�����i�[�e�t�o�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`
	SetPointCameraEye_("cameye002");
	SetPointCameraTarget_("camtgt002");

	SetMotion_(rena, rena_talk01, BLEND_M);		// ��b
	WaitMotion(rena);
	SetMotion_(rena, rena_talk01_L, BLEND_M);	// ��bL

	//===============================================
	// �����i�[�e
	// �u�̋��̐��c�c�������@�L�����Ă����B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_831_MSG_050");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	SetMotion_(rena, MOT_WAIT, BLEND_N);
	SetVisible(rena, false);


	// ���J�b�g�V���A���}�t�o�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`
	SetPointCameraEye_("cameye003");
	SetPointCameraTarget_("camtgt003");

	SetMotion_(aroma, MOT_WALK, BLEND_L);
	task_aroma = Task_RotateToDir_(aroma, 90, 4.5);
	task_aroma_step = Task_PlaySe_("SE_FLD_016", 15);
	WaitTask(task_aroma);
	DeleteTask_(task_aroma_step);
	SetMotion_(aroma, MOT_WAIT, BLEND_XL);

	//===============================================
	// ���A���}
	// �u������������Ȃ��c�c�ł��@�������̂�B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_AROMA");
	ShowMsg_("DEMO_831_MSG_060");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================


	// ���J�b�g�W���A���}�t�o�A�X�^�[�V�[�h���o���`�`�`�`�`�`�`
	task_cam = Task_AnimeMoveCamera_("anmeye003", "anmtgt003");		// 210F

	SetMotion_(aroma, aroma_star_look_L, 24);		// �X�^�[�V�[�h����L
	Wait_(32);

	PlaySE_("SE_DEM_229");
	efc_star = SetSelectBoneEffect_("ef732_25_star_seed_base01", star, ATTACH_GLOBAL);
	SetEffectScale_(efc_star, 0.3);
	task_star = Task_AnimeMoveNoFit_(star, "anm_star000");

	//===============================================
	// ���A���}
	// �u�R�[���h�X���[�v����ڊo�߂��@�w�҂�����
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_AROMA");
	ShowMsg_("DEMO_831_MSG_070");
	KeyInputWait_();
	//-----------------------------------------------
	// ��
	// �u<name_player/>�́@�퓬�f�[�^�̂�������
	//-----------------------------------------------
	ShowMsg_("DEMO_831_MSG_080");
	KeyInputWait_();
	//-----------------------------------------------
	// ��
	// �u�V�����@�X�^�[�V�[�h�����@�����ł����
	//-----------------------------------------------
	ShowMsg_("DEMO_831_MSG_090");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	DeleteEffectEmitter_(efc_star);
	Wait_(30);
	SetMotion_(aroma, MOT_WAIT, 20);
	Wait_(28);

	SetVisible(player, true);
	SetVisible(rena, true);
	SetPointPos_(player, "player004");
	SetPointPos_(rena, "npc_rena004");
	DeleteTask_(task_cam);


	// ���J�b�g�X����l���ƃ��i�[�e�ƃA���}�`�`�`�`�`�`�`�`�`�`
	task_cam = Task_AnimeMoveCamera_("anmeye004", "anmtgt004");		// 210F

	SetMotion_(aroma, aroma_look_up_L, BLEND_XL);		// �������L
	Wait_(5);

	//===============================================
	// ���A���}
	// �u���̂��߂ɂ͓��R�c�c�u���C�N���[���h��
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_AROMA");
	ShowMsg_("DEMO_831_MSG_100");
	KeyInputWait_();
	SetMotion_(aroma, MOT_TALKLOOP, BLEND_XL);
	//-----------------------------------------------
	// ��
	// �u�|�C���g�[���Ɂ@�ً}�E�o�p�̃|�b�h��
	//-----------------------------------------------
	ShowMsg_("DEMO_831_MSG_110");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	SetVisible(player, false);
	SetVisible(rena, false);
	DeleteTask_(task_cam);


	// ���J�b�g10���A���}�t�o�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`
	task_cam = Task_AnimeMoveCamera_("anmeye005", "anmtgt005");		// 400F

	SetMotion_(aroma, aroma_look_down_L, BLEND_XL);		// ��������L
	Wait_(15);

	//===============================================
	// ���A���}
	// �u����Łc�c�����O�Ɂ@���肢������́B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_AROMA");
	ShowMsg_("DEMO_831_MSG_120");
	Wait_(20);
	SetMotion_(aroma, MOT_WAIT, BLEND_XL);
	Wait_(20);
	KeyInputWait_();
	SetMotion_(aroma, MOT_TALKLOOP, BLEND_XL);
	//-----------------------------------------------
	// ��
	// �u�Z���`�����^���Y���Ƃ������c�c���́c�c
	//-----------------------------------------------
	ShowMsg_("DEMO_831_MSG_130");
	KeyInputWait_();
	//-----------------------------------------------
	// ��
	// �u������c�c�ˁH
	//-----------------------------------------------
	ShowMsg_("DEMO_831_MSG_140");
	KeyInputWait_();


	// �y�������z��I�������ꍇ
	while(GetQueryResult_() == QUERY2_1)
	{
		SetMotion_(aroma, MOT_WAIT, BLEND_XL);

		//-----------------------------------------------
		// ��
		// �u���̂��c�c<name_player/>�H
		//-----------------------------------------------
		ShowMsg_("DEMO_831_MSG_150");
		KeyInputWait_();
		CloseMsgWnd_();
		//===============================================

		Wait_(5);
		SurpriseDispSetOffset(aroma, Vec3(0, 0, 3.8), 0.4);
		Wait_(30);
		SetMotion_(aroma, MOT_TALKLOOP, BLEND_XL);

		//===============================================
		// ���A���}
		// �u�����I�@���������ā@���A�N�^�[�ɕۑ�����
		//-----------------------------------------------
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_AROMA");
		ShowMsg_("DEMO_831_MSG_160");
		KeyInputWait_();
		//-----------------------------------------------
		// ��
		// �u����Ȃ�@�S�z�v��Ȃ����āB
		//-----------------------------------------------
		ShowMsg_("DEMO_831_MSG_170");
		KeyInputWait_();
		//-----------------------------------------------
		// ��
		// �u������@���肢��B
		//-----------------------------------------------
		ShowMsg_("DEMO_831_MSG_180");
		KeyInputWait_();
	}


	//-----------------------------------------------
	// ��
	// �u���肪�Ƃ��I�@���ꂶ��@���̃f�[�^�Ƃ�
	//-----------------------------------------------
	ShowMsg_("DEMO_831_MSG_190");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	//----------
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 30);
	WaitFade_();

	DeleteTask_(task_cam);
	Wait_(10);
	PlaySE_("SE_FLD_054");
	Wait_(30);

	SetVisible(player, true);
	SetVisible(rena, true);

	SetPointPos_(player, "player005");
	SetPointPos_(rena, "npc_rena005");
	SetPointPos_(aroma, "npc_aroma001");

	SetMeshVisible_(player, "reactor_Model", false);
	SetMeshVisible_(aroma, "Model_2", false);

	// �y��l���z����(EFFECT3)�F�Ⴄ �^ �E��(EFFECT2)�F�n��
	SetMotion_(player, player_exchange_L, BLEND_N);		// ���A�N�^�[������L
	AttachObject_(player, reactor0, ATTACH_EFFECT2);

	// �y�A���}�z����(EFFECT2)�F�Ⴄ �^ �E��(EFFECT1)�F�n��
	SetMotion_(aroma, aroma_exchange_L, BLEND_N);		// ���A�N�^�[������L
	AttachObject_(aroma, reactor1, ATTACH_EFFECT1);


	// ���J�b�g11���A���}�Ǝ�l�����A�N�^�[�����`�`�`�`�`�`�`�`
	task_cam = Task_AnimeMoveCamera_("anmeye006", "anmtgt006");		// 180F

	SetFade_(FADE_IN, FADE_COLOR_BLACK, 30);
	WaitFade_();
	//----------

	PlaySE_("SE_DEM_230");
	SetMotion_(player, player_exchange, BLEND_L);		// ���A�N�^�[��n�����ҋ@
	SetMotion_(aroma, aroma_exchange, BLEND_L);			// ���A�N�^�[��n�����ҋ@
	task_player = Task_ChangeMotion_(player, MOT_WAIT, BLEND_XL);
	task_aroma = Task_ChangeMotion_(aroma, MOT_WAIT, BLEND_XL);
	Wait_(45);

	DetachObject_(player);
	DetachObject_(aroma);
	AttachObject_(player, reactor1, ATTACH_EFFECT3);
	AttachObject_(aroma, reactor0, ATTACH_EFFECT2);
	Wait_(65);

	SetMeshVisible_(player, "reactor_Model", true);
	SetMeshVisible_(aroma, "Model_2", true);
	DetachObject_(player);
	DetachObject_(aroma);
	SetVisible(reactor0, false);
	SetVisible(reactor1, false);

	WaitTask(task_player);
	WaitTask(task_aroma);
	WaitTask(task_cam);
	Wait_(30);

	SetVisible(player, false);
	SetVisible(rena, false);


	// ���J�b�g12���A���}�t�o�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`
	SetPointCameraEye_("cameye004");
	SetPointCameraTarget_("camtgt004");
	SetFace_(aroma, "Face_smile");
	MotionTalk(aroma);

	//===============================================
	// ���A���}
	// �u����c�c�厖�Ɂ@���邩�炳�B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_AROMA");
	ShowMsg_("DEMO_831_MSG_200");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	SetMotion_(aroma, MOT_WAIT, BLEND_N);
	SetVisible(player, true);
	SetVisible(aroma, false);


	// ���J�b�g13����l���t�o�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`
	SetPointCameraEye_("cameye005");
	SetPointCameraTarget_("camtgt005");

	SetMotion_(player, player_nod, BLEND_M);		// ����
	WaitMotion(player);
	SetMotion_(player, MOT_WAIT, BLEND_L);
	Wait_(10);

	SetVisible(player, false);
	SetVisible(aroma, true);


	// ���J�b�g14���A���}�t�o�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`
	SetPointCameraEye_("cameye004");
	SetPointCameraTarget_("camtgt004");

	MotionTalk(aroma);

	//===============================================
	// ���A���}
	// �u��낵���I�@���ꂶ��@�s����ˁB
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_AROMA");
	ShowMsg_("DEMO_831_MSG_210");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	SetMotion_(aroma, MOT_WALK, BLEND_XL);
	task_aroma_step = Task_PlaySe_("SE_FLD_016", 15);
	Wait_(5);

	task_aroma = Task_MoveForward_(aroma, 1.0, false);
	Wait_(30);

	//---
	SetVisible(player, true);
	SetVisible(rena, true);

	SetPointPos_(player, "player006");
	SetPointPos_(rena, "npc_rena006");
	SetPointPos_(aroma, "npc_aroma002");

	DeleteTask_(task_aroma);
	task_aroma = Task_MoveToPointSetSpeed_(aroma, "npc_aroma003", 0.5);

	SetMotion_(player, player_look_left_L, BLEND_N);
	SetMotion_(rena, rena_look_right_L, BLEND_N);
	//---


	// ���J�b�g15���A���}�A�J�����C���`�`�`�`�`�`�`�`�`�`�`�`�`
	task_cam = Task_AnimeMoveCamera_("anmeye007", "anmtgt007");		// 120F
	Wait_(30);

	SetMotion_(player, MOT_WAIT, BLEND_XL);
	SetMotion_(rena, MOT_WAIT, BLEND_XL);
	Wait_(15);

	SetMotion_(player, player_look_right_L, BLEND_XL);
	SetMotion_(rena, rena_look_left_L, BLEND_XL);

	WaitTask(task_aroma);
	SetMotion_(aroma, MOT_WAIT, 20);
	Wait_(20);
	DeleteTask_(task_aroma_step);

	//===============================================
	// ���A���}
	// �u�����@�̋��̐����@����������c�c
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_AROMA");
	ShowMsg_("DEMO_831_MSG_220");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	SetVisible(player, false);
	SetVisible(rena, false);
	DeleteTask_(task_cam);


	// ���J�b�g16���A���}�A���̏ꂩ�狎��`�`�`�`�`�`�`�`�`�`�`
	SetPointCameraEye_("cameye006");
	SetPointCameraTarget_("camtgt006");

	SetMotion_(aroma, aroma_look_right_L, BLEND_XL);		// �E������L
	Wait_(15);

	//===============================================
	// ���A���}
	// �u�F���̉ʂĂɂ���@��ꂽ���E���~����
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_AROMA");
	ShowMsg_("DEMO_831_MSG_230");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	SetMotion_(aroma, MOT_WAIT, 20);
	Wait_(24);
	SetMotion_(aroma, MOT_WALK, BLEND_XL);
	task_aroma = Task_MoveForward_(aroma, 0.7, false);
	task_aroma_step = Task_PlaySe_("SE_FLD_016", 15);
	Wait_(30);

	EndDemo(FADE_COLOR_BLACK);
}
