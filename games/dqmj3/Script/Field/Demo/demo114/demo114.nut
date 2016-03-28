//=============================================
//
//		demo114[���i�[�e�Ɖߋ��̘^��f��]
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
	local task_player, task_res_rena, task_ace;
	local efc_player, efc_holography, efc_ace;
	local rete_on1 = [0.3, 0.6, 0.4, 0.3, 0.5, 0.3, 0.6, 0.4, 0.3, 0.5, 0.4, 0.3, 0.7];
	local rete_on2 = [1, 1, 15, 1, 1, 1, 1, 5, 1, 1, 1, 1, 1];

// �����\�[�X�Ǎ�
	// �M�~�b�N
	local model_main_screen = ReadGimmick_("o_A03_04");		// �ǐ������C�����j�^�[
	local model_red_screen = ReadGimmick_("o_A03_06");		// �_�ł���ԃ��j�^�[(��)
	local model_screen_right = ReadGimmick_("o_A03_09");	// �f�B�X�v���C���(�E)
	local model_screen_left = ReadGimmick_("o_A03_10");		// �f�B�X�v���C���(��)
	// �L�����N�^�[
	local player = GetPlayerId_();							// ��l��
	local model_ace = ReadNpc_("n002");						// �G�[�X
	local model_rena = ReadNpc_("n034");					// ���i�[�e
	// �G�t�F�N�g
	LoadEffect_("ef712_10_emo_surprise01");					// �u�I�v
	LoadEffect_("ef732_09_light_reactor_c");				// ���A�N�^�[����
	LoadEffect_("ef732_14_holography01");					// �z���O�����\���@�풓
	LoadEffect_("ef732_15_holography01");					// �z���O�����\���@�o��
	LoadEffect_("ef732_16_holography01");					// �z���O�����\���@����
	LoadEffect_("ef712_01_emo_notice01");					// �C�Â�

// ���z�u
	// �ǐ������C�����j�^�[
	local main_screen = ArrangePointGimmick_("o_A03_04", model_main_screen, "obj_screen000");
	// �_�ł���ԃ��j�^�[(��)
	local red_screen = ArrangeGimmick_("o_A03_06", model_red_screen, false);
	SetMotion_(red_screen, MOT_GIMMICK_0, BLEND_N);			// �_��ON
	// �f�B�X�v���C���(��)
	local screen_left = ArrangeGimmick_("o_A03_10", model_screen_left, false);
	
	// ��l��
	SetPointPos_(player, "player000");
	SetDir_(player, 5);
	// �G�[�X
	local ace = ArrangePointNpc_(model_ace, "npc_ace000");
	// ���i�[�e
	local res_rena = ArrangePointNpc_(model_rena, "npc_rena000");
	SetAlpha_(res_rena, ALPHA_CLEAR);

// ����풓���[�V�����Ǎ�
	// ��l��
	local pl_touch_reacter = ReadMotion_(player, "Player_touch_reactor");			// ��l���@��������������遨���A�N�^�[��G��
	local pl_touch_reacter_L = ReadMotion_(player, "Player_touch_reactor_L");		// ��l���@��������������遨���A�N�^�[��G��L
	local player_right = ReadMotion_(player, "Player_look_right_L");				// ��l���@�E������
	local player_left = ReadMotion_(player, "Player_look_left_L");					// ��l���@��������
	local player_caution_turn = ReadMotion_(player, "Player_caution_turn");			// ��l���@�x���E�U�����
	local player_caution_turn_L = ReadMotion_(player, "Player_caution_turn_L");		// ��l���@�x���E�U�����L
	local player_back_L = ReadMotion_(player, "Player_back_L");						// ��l���@����L
	local pl_caution01_L = ReadMotion_(player, "Player_caution01_L");				// �x��
	// �G�[�X
	local ace_shock = ReadMotion_(ace, "n002_shock");								// ����
	local ace_shock_L = ReadMotion_(ace, "n002_shock_L");							// ����L�i�����镗�j
	// ���i�[�e
	local rena_look_down = ReadMotion_(res_rena, "n007_look_down_L");				// ���i�[�e�@���ނ��ҋ@
	local rena_look_up = ReadMotion_(res_rena, "n007_look_up_L");					// ���i�[�e�@������ҋ@
	local rena_look_up02 = ReadMotion_(res_rena, "n007_look_up02_L");				// ���i�[�e�@������ҋ@02L
	local rena_look_left_L = ReadMotion_(res_rena, "n007_look_left_L");				// ���i�[�e�@�������ҋ@

// �����[�V�����ݒ�
	SetMotion_(res_rena, rena_look_down, BLEND_M);									// ���i�[�e�@�ҋ@
	SetFace_(res_rena, "Face_loop_close");

// ���J�����ݒ�
	local task_cam = Task_AnimeMoveCamera_("anmeye006", "anmtgt006");				// 60F
	DeleteTask_(task_cam);

//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------

	//��������������������������������������
	//���J�b�g1�@�R���\�[���O�@��l���@���A�N�^�[����
	//��������������������������������������

	StartDemo(FADE_COLOR_BLACK);

	Wait_(20);
	PlaySE_("SE_FLD_135");																	// ���A�N�^�[������
	local light = SetSelectBoneEffect_("ef732_09_light_reactor_c", player, ATTACH_EFFECT1);	// ���A�N�^�[����
	SetEffectScale_(light, 0.8);
	Wait_(10);
	SetFace_(player, "Face_left");	
	SetMotion_(player, pl_touch_reacter, BLEND_L);
	WaitMotion(player);
	SetMotion_(player, pl_touch_reacter_L, BLEND_M);
	Wait_(20);
	
	//===============================================
	// ���V�X�e�����b�Z�[�W�E�Z���^�����O
	// ���̃��b�Z�[�W���@�Đ����ꂽ�Ƃ������Ƃ�
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_114_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	//��������������������������������������
	//���J�b�g2�@�Y�[���A�E�g
	//��������������������������������������
	local task_cam = Task_AnimeMoveCamera_("anmeye006", "anmtgt006");				// 60F

	WaitTask(task_cam);
	Wait_(30);
	
	PlaySE_("SE_DEM_047");															//���i�[�e�����

	
	efc_holography = SetBoneEffect_("ef732_15_holography01", res_rena);
	for (local i = 0; i< rete_on1.len(); i ++){									// ���i�[�e�@�_��
		SetAlpha_(res_rena, rete_on1[i]);
		Wait_(rete_on2[i]);
	}
	SetAlpha_(res_rena, 1);															// ���i�[�e�@���l
	DeleteEffect_(efc_holography);
	efc_holography = SetBoneEffect_("ef732_14_holography01", res_rena);
	
	Wait_(30);

	//��������������������������������������
	//���J�b�g3�@��l���U�����
	//��������������������������������������
	SetPointPos_(ace, "npc_ace001");

	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");
	SetDir_(player, -25);
	SetFace_(player, "Face_right");	
	Wait_(10);
	
	
	local pos = Vec3(3.0, 3.2, 0.0);
	efc_player = SurpriseDispSetOffset(player, pos, 0.55);
	SetMotionSpeed_(player, 1.3);
	SetMotion_(player, player_caution_turn, 6);
	Wait_(5);
	
//	task_ace = Task_RotateToDirSetMotion_(ace, -165, 15, MOT_WALK, ace_shock);
	SetMotion_(ace, ace_shock, BLEND_M);											// �����i�����镗�j
	efc_ace = SetSelectBoneEffect_("ef712_01_emo_notice01", ace, ATTACH_EFFECT1);	// �C�Â�
	task_ace = Task_RotateToDir_(ace, -165, 10);		// ��]
	Wait_(10);
	
	SetMotionSpeed_(player, 1.0);
	SetMotion_(ace, ace_shock_L, BLEND_M);		// ����L�i�����镗�j
//	WaitMotion(player);
	SetMotion_(player, player_caution_turn_L, BLEND_M);
	
//	WaitTask(task_ace);
	
	Wait_(57);
	SetPointPos_(ace, "npc_ace001");

	//��������������������������������������
	//���J�b�g4�@���i�[�e�@�������o�X�g�A�b�v���Y�[���C��
	//��������������������������������������
	local task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");
	WaitTask(task_cam);
	Wait_(27);

	SetMotion_(res_rena, rena_look_up, BLEND_XL);									// ���i�[�e�@������ҋ@
	
	Wait_(10);
	SetFace_(res_rena, "Face_default");
	Wait_(10);

	//===============================================
	// ���Ȃ��̏���
	// �u���̂��Ȃ��́@�����X�^�[�}�X�^�[�Ƃ���
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_MYSTERYGIRL");
	ShowMsg_("DEMO_114_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	Wait_(10);
	
	SetMotionSpeed_(res_rena, 0.7);
	SetMotion_(res_rena, MOT_WALK, 10);										// ���i�[�e�@����
	SetStepSe_(res_rena, SILENT_STEP_SE);											// ���i�[�e�@�����𖳉��ɂ���

	Wait_(5);
	
	task_res_rena = Task_RotateToDir_(res_rena, -20, 2.85);
	WaitTask(task_res_rena);
	task_res_rena = Task_MoveForward_(res_rena, 0.5, false);
	Wait_(62);
	DeleteTask_(task_res_rena);
	SetDir_(res_rena, 0);

	//��������������������������������������
	//���J�b�g5�@��l���ƃ��i�[�e�@���i�[�e�������ҋ@�{��l�������i�[�e�̉f������@���i�[�e��聨��l����
	//��������������������������������������
	SetDirToObject_(player, res_rena);
	SetFace_(player, "Face_default");	
	SetMotion_(player, pl_caution01_L, BLEND_N);									// ��@�x��

	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");

	task_res_rena = Task_AnimeMove_(res_rena, "anm_rena000");

	Wait_(75);

	WaitTask(task_res_rena);
	SetMotion_(res_rena, MOT_WAIT, BLEND_L);										// ���i�[�e�@�ҋ@
	WaitTask(task_cam);

	//===============================================
	// ���Ȃ��̏���
	// �u�c�c�܂��܂��@�킩��Ȃ����Ƃ��炯�̂͂��B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_MYSTERYGIRL");
	ShowMsg_("DEMO_114_MSG_030");
	KeyInputWait_();
	SetMotion_(player, MOT_WAIT, BLEND_XL);											// ��l���@�ҋ@
	CloseMsgWnd_();
	//===============================================
	
	//��������������������������������������
	//���J�b�g6�@���i�[�e�̉f���@������
	//��������������������������������������
	task_cam = Task_AnimeMoveCamera_("anmeye004", "anmtgt004");
	
	SetDir_(res_rena, 20);
	SetMotionSpeed_(res_rena, 1.0);
	SetMotion_(res_rena, rena_look_down, BLEND_XL);									// ���i�[�e�@���ނ��ҋ@
	SetFace_(res_rena, "Face_loop_close");
	WaitTask(task_cam);
	
	//===============================================
	// ���Ȃ��̏���
	// �u���Ȃ��́@�����Ɓ@���̐��E�ŋN���Ă��邱�Ƃ�
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_MYSTERYGIRL");
	ShowMsg_("DEMO_114_MSG_040");
	KeyInputWait_();
	CloseMsgWnd_();	
	//===============================================

	Wait_(5);
	SetFace_(res_rena, "Face_default");
	SetMotion_(res_rena, rena_look_up02, BLEND_XL);									// ���i�[�e�@������ҋ@
	Wait_(15);

	//===============================================
	// ���Ȃ��̏���
	// �u������c�c�����Ɂ@�L�^���c������c�c�B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_MYSTERYGIRL");
	ShowMsg_("DEMO_114_MSG_050");
	KeyInputWait_();
	
	SetMotion_(res_rena, rena_look_left_L, BLEND_XL);		// �������ҋ@
	
	//-----------------------------------------------
	// ��
	// �u���āc�c�����āc�c�����āc�c�B
	//-----------------------------------------------
	ShowMsg_("DEMO_114_MSG_060");
	KeyInputWait_();
	CloseMsgWnd_();	
	//===============================================

	SetAlpha_(player, ALPHA_CLEAR);
	SetAlpha_(res_rena, ALPHA_CLEAR);
	SetAlpha_(ace, ALPHA_CLEAR);
	DeleteEffect_(efc_holography);

	//��������������������������������������
	//���J�b�g7�@���C�����j�^�[�@�m�C�Y�A�j���@���j�^�[�փY�[���C��
	//��������������������������������������
	task_cam = Task_AnimeMoveCamera_("anmeye005", "anmtgt005");
	WaitTask(task_cam);
		
	PlaySE_("SE_DEM_050");															//�m�C�Y�ł����

	SetMotion_(screen_left, MOT_GIMMICK_1, BLEND_N);								// �m�C�Y
	Wait_(30);

	EndDemo(FADE_COLOR_WHITE);
}
