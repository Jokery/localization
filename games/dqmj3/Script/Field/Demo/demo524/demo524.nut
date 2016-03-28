//=============================================
//
//		demo524[�v�����e�E�X�폟��]
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
	local task_cam, task_player, task_rena, task_dark, task_birdy, task_pro;
	local efc_player, efc_rena, efc_dark, efc_birdy, efc_pro, efc_cam, efc_fire;
	
// ���t���O�ݒ�
	local bit_ruler = GetEventFlg_("BFG_RULER_ADD_023");	// Bit_223  ���[���ǉ��t���O �ŔM�̉ΎR�@�閧��n�@�n���{��
	
// �����\�[�X�Ǎ�
	// �L�����N�^�[
	local player = GetPlayerId_();						// ��l��
	local model_rena = ReadNpc_("n007");				// ���i�[�e
	local model_birdy = ReadNpc_("n019");				// �o�[�f�B
	local model_pro = ReadNpc_("m190_00");				// �v�����e�E�X
	local model_dark = ReadNpc_("n008"); 				// �_�[�N�}�X�^�[
	local model_boy = ReadNpc_("n040"); 				// ���ǂ���l��
	
	// �M�~�b�N
	local model_cold = ReadGimmick_("o_V02_10");			// �R�[���h�X���[�v���u
	local model_cpu = ReadGimmick_("o_V02_11");				// �R���s���[�^�̖���
	local model_cold_player = ReadGimmick_("o_V02_12");		// �R�[���h�X���[�v_��l��
	local model_light = ReadGimmick_("o_V02_13");			// �R�[���h�X���[�v����
	local model_ruler = ReadGimmick_("o_com_08");			// ���[���|�C���g
	local model_door = ReadGimmick_("o_V02_09");			// ��
	local model_door01 = ReadGimmick_("o_V02_02");			// �G���x�[�^�[��
	
	// �G�t�F�N�g�ݒ�
	LoadEffect_("ef733_01_sym_shuchusen01");			// �W����
	LoadEffect_("ef721_03_nat_smoke_n03");				// ��
	LoadEffect_("ef741_01_div_nor_death");				// �v�����e�E�X���S�G�t�F�N�g
	LoadEffect_("ef852_04_rura_dm01");					// �_�[�N�}�X�^�[�̃��[���i�����O�j
	LoadEffect_("ef852_05_rura_dm02");					// �_�[�N�}�X�^�[�̃��[���i������j
	
// ���z�u
	//�L�����N�^�[
	SetPointPos_(player, "player000");										// ��l��
	
	local rena = ArrangePointNpc_(model_rena, "npc_renerte000");			// ���i�[�e

	local dark = ArrangePointNpc_(model_dark, "npc_dark000");				// �_�[�N�}�X�^�[
	
	local birdy = ArrangePointNpc_(model_birdy, "npc_birdy000");			// �o�[�f�B
	SetScaleSilhouette(birdy, SCALE.N, SILHOUETTE_WIDTH.N);					// �T�C�YN

	local pro = ArrangePointNpc_(model_pro, "npc_pro000");					// �v�����e�E�X
	SetScaleSilhouette(pro, SCALE.M, SILHOUETTE_WIDTH.M);					// �T�C�YM
	
	local boy = ArrangePointNpc_(model_boy, "npc_boy000");					// ���ǂ���l���i�R�[���h�X���[�v�̒��ɔz�u�j
	//�M�~�b�N
	local cold_player = ArrangePointGimmick_("o_V02_10", model_cold_player, "obj_cold_player000");		//�R�[���h�X���[�v��l��
	
	local cold_cpu = ArrangePointGimmick_("o_V02_11", model_cpu, "obj_cpu000");					//�R���s���[�^�̖���
	local cold_light = ArrangePointGimmick_("o_V02_13", model_light, "obj_light000");			//�R�[���h�X���[�v����

	// ���[���|�C���g
	local ruler = ArrangePointGimmick_("o_com_08", model_ruler, "obj_ruler000");
	// �����[���|�C���g�����ɋN�����Ă����ꍇ
	if (bit_ruler) { SetMotion_(ruler, MOT_GIMMICK_2, BLEND_N); }
	
	// ��
	local door = ArrangePointGimmick_("o_V02_09", model_door, "obj_door000");
	// �G���x�[�^�[��
	local door01 = ArrangePointGimmick_("o_V02_02", model_door01, "obj_door001");
	SetMotion_(door01, MOT_GIMMICK_0, BLEND_N);			// ����
	
// ����풓���[�V�����Ǎ�
	//��l��
	local player_caution01 = ReadMotion_(player, "Player_caution01_L");				// �x��
	local player_battle_L = ReadMotion_(player, "Player_battle_L");					// �퓬�ҋ@
	local player_battle_look_up_L = ReadMotion_(player, "Player_battle01_L");		// �퓬�ҋ@�i�������j
	
	//���i�[�e
	local rena_talk = ReadMotion_(rena, "n007_talk01");								// ��b�J�n�i������ɂ��Ă�j
	local rena_talk_L = ReadMotion_(rena, "n007_talk01_L");							// ��bL�i������ɂ��Ă�j
	local rena_turn_left = ReadMotion_(rena, "n007_turn_left");						// �ҋ@���U��Ԃ�i�������j
	local rena_turn_left_L = ReadMotion_(rena, "n007_turn_left_L");					// �U��Ԃ�L�i�������j
	local rena_attack = ReadMotion_(rena, "n007_attack");							// �U��
	local rena_attack_L = ReadMotion_(rena, "n007_attack_L");						// �U��L
	local rena_run_L = ReadMotion_(rena, "n007_run_L");								// ����L
	local rena_look_down = ReadMotion_(rena, "n007_look_down_L");					// ���ނ��ҋ@
	local rena_caution = ReadMotion_(rena, "n007_caution_L");						// �x��L

	//�o�[�f�B
	local birdy_idol = ReadMotion_(birdy, "n019_idol");								// �ҋ@L

	//�_�[�N�}�X�^�[
	local dark_sup = ReadMotion_(dark, "n008_surprise_L");							// ����L
	local dark_stagger = ReadMotion_(dark, "n008_stagger_L");						// ��������
	local dark_totter = ReadMotion_(dark, "n008_totter_L");							// �����

	//�v�����e�E�X
	local pro_die = ReadMotion_(pro, "m190_00_die");								// �v�����e�E�X���S
	
	//���ǂ���l��
	local boy_sleep = ReadMotion_(boy, "n010_cold_sleep_L");						// �R�[���h�X���[�v�p���[�V����
	SetMotion_(boy, boy_sleep, BLEND_N);
	SetFace_(boy, "Face_loop_close02");

// ���������[�V����
	SetMotion_(player, player_battle_look_up_L, BLEND_N);							//��@�퓬�ҋ@�����
	SetMotion_(birdy, birdy_idol, BLEND_N);											//���@�ҋ@
	SetMotion_(rena, rena_caution, BLEND_N);										//���i�@�x��
	
// �����C�A�E�g
	LoadLayout_("black");
	
//����
	SetStepSe_(rena, "SE_FLD_016");

// ���J�����ݒ�

	task_cam = Task_AnimeMoveCamera_("anmeye004", "anmtgt004");

//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------
	SetVisible(player, false);
	SetVisible(dark, false);
	
	StartDemo(FADE_COLOR_BLACK);

	//��������������������������������������
	//���J�b�g1 ���K�������A�|���v�����e�E�X
	//��������������������������������������
	PlaySE_("SE_DEM_136");															//��SE:�v�����e�E�X���S
	
	SetMotion_(pro, pro_die, BLEND_M);												//���S���[�V����
	
	local task_pro_step = Task_ChangeStepSe(pro, "SE_FLD_033", 12);					//�v�����e�E�X����	
	Wait_(25);
	DeleteTaskStepSe(pro, task_pro_step);
	
	Wait_(70);

//	PlaySE_("SE_DEM_015");															//�|���SE

	Wait_(25);
	StartDecayEarthQuake_(25, 4, 2)													//�n�k
	Wait_(5);	
	efc_pro = SetSelectBoneEffect_("ef721_03_nat_smoke_n03", pro, ATTACH_GLOBAL);	//��
	SetEffectScale_(efc_pro, 2.5);

	Wait_(35);	
	
	efc_pro = SetSelectBoneEffect_("ef741_01_div_nor_death", pro, ATTACH_GLOBAL);	//���Sef
	SetEffectScale_(efc_pro, 3.0);
	PlaySE_("SE_DEM_010");															//���SSE
	
	Task_ObjectFadeOut_(pro, 30);													// 30�t���[���Ńt�F�[�h�A�E�g���܂�
	
	Wait_(60);
	
	//��������������������������������������
	//���J�b�g2 ��l�����ɂݕt����_�[�N�}�X�^�[
	//��������������������������������������
	SetVisible(dark, true);
	SetVisible(player, true);
	SetDir_(dark, 0);

	SetMotion_(dark, dark_sup, BLEND_N);											//�_�[�N�@����

	task_cam = Task_AnimeMoveCamera_("anmeye006", "anmtgt006");
	PlaySE_("SE_DEM_026");	// ��SE:�W����
	efc_cam = SetCameraEffect_("ef733_01_sym_shuchusen01", 100);							//�W����
	
	//===============================================
	//*�_�[�N�}�X�^�[
	// 	�u�o�c�c�o�J�ȁI�H
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_DARKMASTER");
	ShowMsg_("DEMO_524_MSG_010");
	KeyInputWait_();
	//===============================================
	DeleteEffectEmitter_(efc_cam);
	task_cam = Task_AnimeMoveCamera_("anmeye005", "anmtgt005");						//�U������ɍ��킹�ăY�[���A�E�g
	Wait_(10);
	SetMotion_(dark, MOT_WALK, BLEND_L);
	task_dark = Task_RotateToPos_(dark, GetPos_(rena), 5.7);
	WaitTask(task_dark);
	SetMotion_(dark, MOT_WAIT, BLEND_L);
	
	Wait_(15);
	//===============================================
	//*�_�[�N�}�X�^�[
	// 	�u�킩��ʁc�c�Ȃ����H
	//-----------------------------------------------
	ShowMsg_("DEMO_524_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	WaitTask(task_cam);
	Wait_(10);
	//��������������������������������������
	//���J�b�g3 ��l���A���i�[�e
	//��������������������������������������
	SetMotion_(player, player_caution01, BLEND_N);							//��@�x��
	

	SetMotion_(rena, MOT_WALK, BLEND_N);									//���i�@����
	Wait_(15);
	
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");
	local task_rena_step = Task_ChangeStepSe(rena, "SE_FLD_016", 6);		//���i����

	task_rena = Task_MoveForward_(rena, 1.0, false);
	Wait_(15);
	DeleteTaskStepSe(rena, task_rena_step);

	SetMotion_(rena, MOT_WAIT, BLEND_L);									//���i�@�ҋ@
	DeleteTask_(task_rena);

	Wait_(10);

	//===============================================
	//*���i�[�e
	// 	�u���Ȃ��ɂ́@�킩��Ȃ��B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_524_MSG_030");
	
	SetMotion_(rena, rena_talk, BLEND_L);									//���i�@��b
	WaitMotion(rena);
	SetMotion_(rena, rena_talk_L, BLEND_M);									//���i�@��bL
	
	KeyInputWait_();
	//===============================================	
		
	//===============================================
	//*���i�[�e
	// 	�u�����ā@��]��������肱����
	//-----------------------------------------------
	ShowMsg_("DEMO_524_MSG_040");
	
	SetMotion_(rena, rena_attack, BLEND_XL);									//���i�@�U��
	WaitMotion(rena);
	SetMotion_(rena, rena_attack_L, BLEND_XL);								//���i�@�U��L
	
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	Wait_(30);
	WaitTask(task_cam);
	
	//��������������������������������������
	//���J�b�g4 ��l���A���i�[�e�ADM
	//��������������������������������������
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");
	DeleteTask_(task_cam);
	SetPointPos_(rena, "npc_renerte001");									//���i�ړ�
	SetDirToObject_(player, dark);
	SetDirToObject_(birdy, dark);
	
	SetMotion_(rena, MOT_WAIT, BLEND_L);									//���i�@�ҋ@

	Wait_(10);

	SetMotion_(dark, MOT_TALK, BLEND_L);												//�_�N�}�X�b��
	WaitMotion(dark);
	SetMotion_(dark, MOT_TALKLOOP, BLEND_M);											//�_�N�}�X�b��
	//===============================================
	//*�_�[�N�}�X�^�[
	// 	�u�c�c�Ȃ񂽂鎸�Ԃ��I
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_DARKMASTER");
	ShowMsg_("DEMO_524_MSG_050");
	KeyInputWait_();
	//-----------------------------------------------
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");
		
//	local SE_VOL = PlaySE_("SE_DEM_137");															//��SE:�_�[�N�}�X�^�[���S
	StopBgm_(75);
	//-----------------------------------------------
	//*�_�[�N�}�X�^�[
	// 	�u��J���ʂ����̂́@���̋@��Ƃ��悤�B
	//-----------------------------------------------
	ShowMsg_("DEMO_524_MSG_070");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
//	WaitSe_(SE_VOL);				//�������̕�����SE�̍Đ��I���҂��ɕς���

	SetMotion_(dark, MOT_WAIT, BLEND_XL);											//�_�N�}�X�ҋ@
	PlaySE_("SE_DEM_137");
	efc_dark = SetSelectBoneEffect_("ef852_04_rura_dm01", dark, ATTACH_GLOBAL);		//�_�[�N���[�������O
	
	//��������������������������������������
	//���J�b�g6 DM���[��
	//��������������������������������������
	
	
	PlaySE_("SE_DEM_139");															//��SE:�_�[�N�}�X�^�[������
	Wait_(60);
	DeleteEffectEmitter_(efc_dark);
	Wait_(5);
	efc_dark = SetSelectBoneEffect_("ef852_05_rura_dm02", dark, ATTACH_GLOBAL);		//�_�[�N���[��������
	Wait_(10);

	//===============================================
	//���t���b�V���̂悤�ȃt�F�[�h�A�E�g
	SetFade_(FADE_OUT, FADE_COLOR_WHITE, 10);
	Task_ObjectFadeOut_(dark, 20);													// 20�t���[���Ńt�F�[�h�A�E�g���܂�

	SetMotion_(rena, rena_caution, BLEND_L);										//���i�@�x��
	SetMotion_(player, player_caution01, BLEND_L);									//��@�x��

	efc_dark = SetSelectBoneEffect_("ef852_05_rura_dm02", dark, ATTACH_GLOBAL);		//�_�[�N���[��������	
	Wait_(15);
	task_cam = Task_AnimeMoveCamera_("anmeye007", "anmtgt007");
	SetFade_(FADE_IN, FADE_COLOR_WHITE, 30);
	//===============================================
	Wait_(50);

	SetLayoutAnime_("fade_in", false);										//��������
	Wait_(30);
	SetLayoutAnime_("loop", false);
	
	//===============================================
	//*�_�[�N�}�X�^�[
	// 	�u�t�n�n�n�c�c�I
	//-----------------------------------------------
	ShowScreenMessage_("DEMO_524_MSG_080", false);
	//===============================================
	WaitTask(task_cam);
	SetLayoutAnime_("fade_out", false);										//������������
	Wait_(20);

	//��������������������������������������
	//���J�b�g7 ���i�[�e�A�b�v
	//��������������������������������������
	SetVisible(player, false);
	SetVisible(birdy, false);
	
	local task_rena_step = Task_ChangeStepSe(rena, "SE_FLD_016", 5);		//���i����

	SetPointPos_(rena, "npc_renerte003");									//���i�ړ�
	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");
//	DeleteTaskStepSe(player, task_player_step);
	
	DeleteTaskStepSe(rena, task_rena_step);

	SetMotion_(rena, MOT_WAIT, BLEND_XL);									//���i�@�ҋ@

	WaitTask(task_cam);

	SetMotion_(rena, rena_look_down, BLEND_XL);								//���i�@���ނ��ҋ@
	SetFace_(rena, "Face_loop_close");										//�ڕ�

	//===============================================
	//*���i�[�e
	// 	�u�c�c�@����̂Ƃ��́@�߂��c�c���B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_524_MSG_090");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	Wait_(20);

	//�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`���t�F�[�h�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 30);										//�t�F�[�h�A�E�g
	WaitFade_();
	
	SetStepSe_(rena, "SE_FLD_016");
	//��������������������������������������
	//���J�b�g8 �{�̂̑O�ɂ�
	//��������������������������������������
	SetVisible(player, true);
	SetVisible(birdy, true);
	SetPointPos_(player, "player002");										//��@�ړ�
	SetPointPos_(rena, "npc_renerte004");									//���i�ړ�
	SetPointPos_(birdy, "npc_birdy001");									//���@�ړ�

	SetMotion_(player, MOT_WAIT, BLEND_N);									//��@�ҋ@
	SetMotion_(rena, MOT_WAIT, BLEND_N);									//���i�@�ҋ@
	SetFace_(rena, "Face_default");											//�ڊJ��

	SetPointCameraEye_("cameye004");
	SetPointCameraTarget_("camtgt004");
	
	SetFade_(FADE_IN, FADE_COLOR_BLACK, 30);										//�t�F�[�h�C��
	
	//�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`���t�F�[�h�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`
	SetMotion_(rena, rena_run_L, BLEND_M);									//���i�@����

	SetMotion_(rena, MOT_WALK, BLEND_N);									//���i�@����
	task_rena = Task_MoveForward_(rena, 0.8, false);
	Wait_(65);
	SetMotion_(rena, MOT_WAIT, BLEND_L);									//���i�@�ҋ@
	DeleteTask_(task_rena);
	
	//===============================================
	//*���i�[�e
	// 	�u<name_player/>�c�c���Ȃ��͍�
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_524_MSG_100");
	KeyInputWait_();
	CloseMsgWnd_();
	
	//��������������������������������������
	//���J�b�g9 �{�̂ƃ��i�[�e�i�J�b�g8�ƂȂ���j
	//��������������������������������������
	task_cam = Task_AnimeMoveCamera_("anmeye003", "anmtgt003");

	Wait_(55);
	SetMotionSpeed_(rena, 0.8);													// ���[�V�������������ɂȂ�
	SetMotion_(rena, rena_turn_left, BLEND_XL);									//���i�[�e�U�����

	task_rena = Task_RotateToPos_(rena, GetPos_(player), 3);
	Wait_(10);
	DeleteTask_(task_rena);
	WaitMotion(rena);
	SetMotion_(rena, rena_turn_left_L, BLEND_L);
	Wait_(20);

	//===============================================
	//*���i�[�e
	// 	�u�����ā@�����ЂƂc�c���̑��u�ɋL�^���ꂽ
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_524_MSG_110");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================	
	Wait_(10);
	EndDemo(FADE_COLOR_BLACK);
}
