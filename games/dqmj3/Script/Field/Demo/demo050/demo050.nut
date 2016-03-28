//=============================================
//
//		demo050[�y������̒E�o_1(�c�[)]
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
	local task_cam, task_player, task_rena;
	local efc_player, efc_rena;

// �����\�[�X�Ǎ�
	// �L�����N�^�[
	local player = GetPlayerId_();												// ��l��
	local npc_rena = ReadNpc_("n007");											// ���i�[�e
	local model_rena = ReadNpc_("n034");										// �z���O�������i�[�e

// ���z�u
	// ��l��
	SetPointPos_(player, "player000");
	// ���i�[�e
	local rena = ArrangePointNpc_(npc_rena, "npc_renerte000");
	// �z���O�������i�[�e
	local holo_rena = ArrangePointNpc_(model_rena, "npc_renerte000");
	SetStepSe_(holo_rena, SILENT_STEP_SE);										// �����𖳉��ɂ���
	SetAlpha_(holo_rena, ALPHA_CLEAR);
	
// ����풓���[�V�����Ǎ�
	//��l��
	local player_look_up_L = ReadMotion_(player, "Player_look_up_L");			// ��l���@������ҋ@
	local player_battle_L = ReadMotion_(player, "Player_battle_L");				// ��l���@�퓬�ҋ@
	local player_surprise = ReadMotion_(player, "Player_surprise");				// ��l���@����
	local player_surprise_L = ReadMotion_(player, "Player_surprise_L");			// ��l���@����L

	//���i�[�e
	local rena_look_down = ReadMotion_(rena, "n007_look_down_L");				// ���i�[�e�@���ނ��ҋ@
	local rena_walk = ReadMotion_(rena, "n007_walk01_L");						// ���i�[�e�@�ڂ��ނ��ĕ���
	local rena_turn = ReadMotion_(rena, "n007_turn_left");						// ���i�[�e�@�U�����
	local rena_turn_L = ReadMotion_(rena, "n007_turn_left_L");					// ���i�[�e�@�ӂ�ނ�L
	local rena_touch_reactor = ReadMotion_(rena, "n007_touch_reactor");			// ���i�[�e�@���A�N�^�[�ɐG��
	local rena_touch_reactor_L = ReadMotion_(rena, "n007_touch_reactor_L");		// ���i�[�e�@���A�N�^�[�ɐG��L
	
// ���G�t�F�N�g�Ǎ�
	LoadEffect_("ef732_15_holography02");										// �z���O�����\���@�o��
	LoadEffect_("ef732_16_holography01");										// �z���O�����\���@����


//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------

	//��������������������������������������
	//���J�b�g1 ���i�[�e�Ɠ��A�o��
	//��������������������������������������

// ���J�����ݒ�
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");					// 80F

	StartDemo(FADE_COLOR_BLACK);
	SetMotion_(rena, rena_turn, BLEND_XL);										// ���i�[�e�U�����
	SetFace_(rena, "Face_left");
	SetMotionSpeed_(rena, 0.5);													// ���[�V�������������ɂȂ�
	task_rena = Task_RotateToPos_(rena, GetPos_(player), 3.0);
	Wait_(6);
	DeleteTask_(task_rena);
	
	SetMotion_(rena, rena_turn_L, BLEND_XL);
	Wait_(20);

	//===============================================
	// ���Ȃ��̏���
	// �u���̐�Ɍ����鐢�E����
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_MYSTERYGIRL");
	ShowMsg_("DEMO_050_MSG_010");	
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	SetMotionSpeed_(rena, 1.0);											// ���[�V�������x
	PlaySE_("SE_DEM_068");
	local efc = SetBoneEffect_("ef732_15_holography02", rena);			//�z���O�����o��
	SetAlpha_(rena, ALPHA_HALF);
	Wait_(3);
	SetAlpha_(rena, ALPHA_EXIST);
	Wait_(15);
	
	PlaySE_("SE_DEM_068");
	local efc = SetBoneEffect_("ef732_15_holography02", rena);			//�z���O�����o��
	SetAlpha_(rena, ALPHA_HALF);
	Wait_(3);
	SetAlpha_(rena, ALPHA_EXIST);
	Wait_(15);

	//===============================================
	// ���Ȃ��̏���
	// �u�c�c���߂�Ȃ����B���ׂĂ��@�`����ɂ�
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_MYSTERYGIRL");
	ShowMsg_("DEMO_050_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	Wait_(18);
	
	SetFace_(rena, "Face_default");
	SetMotion_(player, player_look_up_L, BLEND_N);								// ��l��������ҋ@
	DeleteTask_(task_cam);

	//��������������������������������������
	//���J�b�g2 �������ɂ��郌�i�[�e
	//��������������������������������������
	SetMotionSpeed_(player, 0.5);													// �� ���[�V�������������ɂȂ�

	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");					// 180F

	SetPointPos_(rena, "npc_renerte001");										// ���i�[�e�ړ�
	SetPointPos_(holo_rena, "npc_renerte001");									// �z�����i�ړ�

	SetDirToPos_(rena, GetPos_(player));										// ���i�[�e�����]��
	SetDirToPos_(holo_rena, GetPos_(player));

	SetMotion_(rena, MOT_WALK, BLEND_M);										// ���i�[�e����
	SetMotion_(holo_rena, MOT_WALK, BLEND_M);

	task_rena = Task_MoveForward_(rena, 0.8, false);
	local task_holo_rena = Task_MoveForward_(holo_rena, 0.8, false);

	Wait_(40.5);																	//�v87wait
	SetAlphaFade(holo_rena, 1, 1);
	SetAlpha_(rena, ALPHA_CLEAR);
	PlaySE_("SE_DEM_068");
	local efc = SetBoneEffect_("ef732_15_holography01", holo_rena);
	Wait_(14);
//	SetAlphaFade(rena, 0, 1);
//	SetAlpha_(rena, ALPHA_EXIST);
//	Wait_(8);
//	SetAlphaFade(holo_rena, 1, 1);
//	SetAlpha_(rena, ALPHA_CLEAR);
//	Wait_(3);
	local efc = SetBoneEffect_("ef732_15_holography01", holo_rena);
	SetAlphaFade(holo_rena, 0, 1);
	SetAlpha_(rena, ALPHA_EXIST);
	Wait_(31);
	
	DeleteTask_(task_rena);
	DeleteTask_(task_holo_rena);
	SetMotionSpeed_(rena, 0.5);													// ���i�[�e ���[�V�������������ɂȂ�
	SetMotion_(rena, rena_touch_reactor, BLEND_XL);								// ���i�[�e�E�^�b�`�E���A�N�^�[
	Wait_(30);
	DeleteTask_(task_cam);


	//��������������������������������������
	//���J�b�g3 ���i�[�e�A��l���A�b�v
	//��������������������������������������
	SetMotionSpeed_(player, 0.2);												// ����Ƀ��[�V�������������ɂȂ�

	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");
	Wait_(2);
	SetMotionSpeed_(rena, 0.3);
	WaitMotion(rena);
	SetMotion_(rena, rena_touch_reactor_L, BLEND_XL);							// ���i�[�e�E�^�b�`�E���A�N�^�[L
	Wait_(3);
	SetMotionSpeed_(rena, 0.2);
	//===============================================
	// ��
	// �u���̃��A�N�^�[�́@������ׁB
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_MYSTERYGIRL");
	ShowMsg_("DEMO_050_MSG_030");
	KeyInputWait_();
	WaitTask(task_cam);
	CloseMsgWnd_();
	//===============================================

	Wait_(20);

	//������������������������������
	//�����i�[�e�A��l������ɃA�b�v
	//������������������������������
	SetMotionSpeed_(rena, 0.4);
	SetMotionSpeed_(player, 0.3);
	
	task_cam = Task_AnimeMoveCamera_("anmeye005", "anmtgt005");

	//===============================================
	// ���Ȃ��̏���
	// �u�������Ȃ����c�c<name_player/>�B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_MYSTERYGIRL");
	ShowMsg_("DEMO_050_MSG_040");
	KeyInputWait_();
	//===============================================
	// ���Ȃ��̏���
	// �u�����ā@���Ȃ����@���ׂĂ�m�����Ƃ��c�c
	//-----------------------------------------------
	ShowMsg_("DEMO_050_MSG_050");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	PlaySE_("SE_DEM_068");														// ���i�[�e������
	efc_rena = SetSelectBoneEffectSetOffset_("ef732_15_holography02", rena, ATTACH_GLOBAL, Vec3(0.0, 0.0, 3.0));	// ���i�[�e����
	SetAlpha_(rena, ALPHA_HALF);
	Wait_(3);
	SetAlpha_(rena, ALPHA_EXIST);
	Wait_(30);

	PlaySE_("SE_DEM_048");														// ���i�[�e������
	efc_rena = SetSelectBoneEffectSetOffset_("ef732_16_holography01", rena, ATTACH_GLOBAL, Vec3(0.0, 0.0, 3.0));	// ���i�[�e����
	SetVisible(rena, false);
	Wait_(5);
	
	SetMotionSpeed_(player, 1.0);
	SetMotion_(player, player_surprise, BLEND_L);								// ��l���т�����
	WaitMotion(player);
	SetMotion_(player, player_surprise_L, BLEND_M);								// ��l���т�����L
	Wait_(60);

	WaitTask(task_cam);


	//��������������������������������������
	//���J�b�g4 ���i�[�e�̏���
	//��������������������������������������

	task_cam = Task_AnimeMoveCamera_("anmeye003", "anmtgt003");

	WaitTask(task_cam);
	Wait_(60);


	//��������������������������������������
	//���J�b�g5 �o���Ɍ������ă_�b�V���I
	//��������������������������������������
	SetStepSe_(player, SILENT_STEP_SE);	// ������ �����ɂ���
	task_cam = Task_AnimeMoveCamera_("anmeye004", "anmtgt004");

	SetMotion_(player, MOT_WAIT, BLEND_L);										// ��l���ҋ@
	Wait_(10);
	SetMotion_(player, MOT_WALK, BLEND_L);										// ��l�������o��
	task_player = Task_MoveForward_(player, 1.2, false);
	
	Wait_(16);
	PlaySE_("SE_FLD_015");
	Wait_(16);
	PlaySE_("SE_FLD_015");
	Wait_(16);
	PlaySE_("SE_FLD_015");	
	
	DeleteTask_(task_player);
	SetMotion_(player, MOT_RUN, BLEND_M);										// ��l������o��
	task_player = Task_MoveForward_(player, 1.2, true);
	Wait_(3);	
	Task_PlaySe_("SE_FLD_015", 8);	//
	Wait_(57);
	
	DeleteTask_(task_cam);

	EndDemo(FADE_COLOR_WHITE);

}
