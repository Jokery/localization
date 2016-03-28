//=============================================
//
//		demo850[�`�������W�o�g��_1(�퓬�O)]
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
	local task_cam, task_player_move;
	local player, aroma, efc_cam, efc_ansesu, efc_aroma;

	// �����\�[�X�Ǎ��Ɣz�u�i���̂Q�l�͊e��틤�ʂŎg�p����̂ŃR�R�j
	//��l���̐퓬�O�����ʒu�ݒ�
	player = GetPlayerId_();
	SetPointPos_(player, "player000");
	SetDir_(player, 270);
	SetManualCalcAlpha_(player, true);

	// �A���}�Q��
	aroma = ArrangePointNpc_(ReadNpc_("n018"), "npc_aroma000");
	SetFace_(aroma, "Face_smile");
	SetDir_(aroma, 0);
	SetManualCalcAlpha_(aroma, true);

	// ����풓���[�V�����Ǎ�
	local player_battle_L = ReadMotion_(player, "Player_battle_L");	// �퓬�ҋ@L
	
	// ���G�t�F�N�g�ǂݍ���
	LoadEffect_("ef733_01_sym_shuchusen01");						// �W����
	LoadEffect_("ef721_03_nat_smoke_n03");							// ��
	LoadEffect_("ef850_01_smoke_fall");								// ����
	LoadEffect_("ef732_15_holography02");							// �z���O�����\���@�o��
	LoadEffect_("ef732_14_holography01");							// �z���O�����\���@�풓

//������������������������������������������������������������������������������������������������������������������������������
// ���`�������W�o�g��1��� VS�m�`������
//������������������������������������������������������������������������������������������������������������������������������
	
	//�e��폈���̌Ăяo���i�P�̃f�����ŕ����C�x���g���s���̂ŁA�匳�ŕ�������j
	switch ( GetNumFlg_("NUM_CHALLENGE_BATTLE_MAIN") ) {

	case 0:
	// ���m�`������
		nocho <- ArrangePointNpc_(ReadNpc_("n043"), "npc_VS1_nocho000");							//�m�`�������̓ǂݍ��݂ƈʒu�ݒ�
		SetDir_(nocho, 90);
		
		// ����풓���[�V�����Ǎ�
		g_ex_motion <- ReadMotion_(nocho, "n002_hand_up");											//��b�����������i�G�[�X�̃��[�V�����̗��p�j
		g_ex_motion_L <- ReadMotion_(nocho, "n002_hand_up_L");										//���������L�i�G�[�X�̃��[�V�����̗��p�j
		
		SetVisible(nocho, false);																	//���o�܂ŕ��䑳�i��U��\���j
		SetManualCalcAlpha_(nocho, true);

	// ���v���Y�j����
		g_enemy_monster01 <- ArrangePointNpc_(ReadNpc_("m040_00"), "npc_VS1_priz000");				//�G�����X�^�[1�̖ڂ̓ǂݍ��݂ƈʒu�ݒ�
		SetScaleSilhouette(g_enemy_monster01, SCALE.S, SILHOUETTE_WIDTH.S);							//S�T�C�Y
		SetVisible(g_enemy_monster01, false);														//���o�܂ŕ��䑳�i��U��\���j

	// ���t�H���f��
		g_enemy_monster02 <- ArrangePointNpc_(ReadNpc_("m125_00"), "npc_VS1_fondu000");				//�G�����X�^�[2�̖ڂ̓ǂݍ��݂ƈʒu�ݒ�
		SetScaleSilhouette(g_enemy_monster02, SCALE.N, SILHOUETTE_WIDTH.N);							//S�T�C�Y
		SetVisible(g_enemy_monster02, false);														//���o�܂ŕ��䑳�i��U��\���j

	// ���h���L�[
		g_enemy_monster03 <- ArrangePointNpc_(ReadNpc_("m052_00"), "npc_VS1_doraki000");			//�G�����X�^�[3�̖ڂ̓ǂݍ��݂ƈʒu�ݒ�
		SetScaleSilhouette(g_enemy_monster03, SCALE.S, SILHOUETTE_WIDTH.S);							//S�T�C�Y
		SetVisible(g_enemy_monster03, false);														//���o�܂ŕ��䑳�i��U��\���j

	// ���i�X�r�i�[��
		g_enemy_monster04 <- ArrangePointNpc_(ReadNpc_("m069_00"), "npc_VS1_nasu000");				//�G�����X�^�[4�̖ڂ̓ǂݍ��݂ƈʒu�ݒ�
		SetScaleSilhouette(g_enemy_monster04, SCALE.S, SILHOUETTE_WIDTH.S);							//S�T�C�Y
		SetVisible(g_enemy_monster04, false);														//���o�܂ŕ��䑳�i��U��\���j

	// ���J�����ݒ�
		SetPointCameraEye_("cameye000");															//���S�̂��f��
		SetPointCameraTarget_("camtgt000");

	//-------------------------------------------------------------------------
	//		�͂��܂�͂��܂�i�P���j
	//-------------------------------------------------------------------------
		//��������������������������������������
		//���J�b�g�P �����f����
		//��������������������������������������
		StartDemoNoFade(FADE_COLOR_BLACK);

		local task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");
		WaitTask(task_cam);

		SetFade_(FADE_OUT, FADE_COLOR_BLACK, 5);								//�J�b�g�؂�ւ��Ó]
		WaitFade_();
		
		//��������������������������������������
		//���J�b�g�Q �A���}�Q�����f��
		//��������������������������������������
		SetPointCameraEye_("cameye001");
		SetPointCameraTarget_("camtgt001");

		SetFade_(FADE_IN, FADE_COLOR_BLACK, 5);									//�J�b�g�؂�ւ��Ó]
		WaitFade_();
		
		SetMotion_(aroma, MOT_TALKLOOP, BLEND_XL);								// �A���}�Q���̉�b���[�V����
		
		//===============================================
		//���A���}
		//�u�����ā@�݂Ȃ���@���҂����ˁI
		//�@�i���ꖼ���@�C�x���g�o�g���́@�͂��܂��I
		//-----------------------------------------------
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_AROMA_NO2");
		ShowMsg_("DEMO_850_VS1_MSG_010");
		KeyInputWait_();
		//===============================================
		
		//===============================================
		//���A���}
		//�u�܂��́@�݂Ȃ���@�������@��炪�q�[���[�I
		//�@�����X�^�[�}�X�^�[�@<name_player/>�[���I�I
		//-----------------------------------------------
		ShowMsg_("DEMO_850_VS1_MSG_020");
		KeyInputWait_();
		CloseMsgWnd_();
		//==============================================
		
		SetMotion_(aroma, MOT_WAIT, BLEND_XL);									// �A���}�Q���̑ҋ@���[�V����
		Wait_(10);

		SetFade_(FADE_OUT, FADE_COLOR_BLACK, 5);								//�J�b�g�؂�ւ��Ó]
		WaitFade_();
		
		//��������������������������������������
		//���J�b�g�R ��l��������f��
		//��������������������������������������
		SetPointCameraEye_("cameye002");
		SetPointCameraTarget_("camtgt002");
		SetMotion_(player, MOT_WALK, BLEND_L);									//�Ó]�������l�������n��
		task_player_move = Task_MoveForward_(player, 1.0, false);

		SetFade_(FADE_IN, FADE_COLOR_BLACK, 5);									//�J�b�g�؂�ւ��Ó]����
		WaitFade_();
		PlayLoopSE_("SE_WIFI_001");												//��SE:�����i���[�v�j
		Wait_(80);																//��l����������
		DeleteTask_(task_player_move);
		SetMotion_(player, player_battle_L, BLEND_XL);
		Wait_(5);
		
		//===============================================
		//���A���}
		//�u�����ā@�΂���́c
		//-----------------------------------------------
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_AROMA_NO2");
		ShowMsg_("DEMO_850_VS1_MSG_030");
		KeyInputWait_();
		CloseMsgWnd_();
		//==============================================
		StopLoopSE_(15);
		Wait_(5);
		SetFade_(FADE_OUT, FADE_COLOR_BLACK, 5);								//�J�b�g�؂�ւ��Ó]�i�[���f�����Ȃ̂ŁA���ʂ̂݁j
		WaitFade_();
		
		//��������������������������������������
		//���J�b�g�S �m�`�������o��
		//��������������������������������������
		task_cam = Task_AnimeMoveCamera_("VS1_anmeye001", "VS1_anmtgt01");
		DeleteTask_(task_cam);

		SetVisible(nocho, true);												//�m�`�������\��������
		SetAlpha_(nocho, ALPHA_EXIST);
		SetMotion_(nocho, MOT_WALK, BLEND_N);
		local task_nocho = Task_MoveForward_(nocho, 1.0, false);				//�ړ�
		SetMotionSpeed_(nocho, 1.0);
		SetFade_(FADE_IN, FADE_COLOR_BLACK, 5);									//�J�b�g�؂�ւ��Ó]����
		WaitFade_();
		
		//===============================================
		//���A���}
		//�u�������Ȃ�΁@�N�ɂ������Ȃ��I
		//�@�{�[�V���b�N������@�����̂т��T�o�C�o�[�c�c
		//-----------------------------------------------
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_AROMA_NO2");
		ShowMsg_("DEMO_850_VS1_MSG_040");
		
		Wait_(25);
		SetMotion_(nocho, MOT_WAIT, BLEND_L);
		DeleteTask_(task_nocho);
		SetMotionSpeed_(nocho, 1.0);

		KeyInputWait_();
		CloseMsgWnd_();
		//===============================================
		task_cam = Task_AnimeMoveCamera_("VS1_anmeye001", "VS1_anmtgt01");
		StartBlurEffect_();														//�u���[�ݒ�
		Wait_(30);
		EndBlurEffect_();
		Wait_(5);
		PlayLoopSE_("SE_WIFI_001");												// ��SE:�����i���[�v�j
		efc_cam = SetCameraEffect_("ef733_01_sym_shuchusen01", CAMERA_DEF);		// �W����
		WaitTask(task_cam);
		//===============================================
		//���A���}
		//�u�m�`�����[���b�I�I
		//-----------------------------------------------
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_AROMA_NO2");
		ShowMsg_("DEMO_850_VS1_MSG_050");
		KeyInputWait_();
		CloseMsgWnd_();
		//===============================================
		Wait_(10);
		StopLoopSE_(20);
		DeleteEffectEmitter_(efc_cam);
		
		SetMotion_(nocho, MOT_TALKLOOP, BLEND_XL);								//�m�`�������̉�b���[�V����
		//===============================================
		//���m�`������
		//�u���O���@���Ă��邤����
		//�@�I�C�����@�}�X�^�[������Ă݂����Ȃ��āc�c
		//-----------------------------------------------
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_NOCHORIN");
		ShowMsg_("DEMO_850_VS1_MSG_060");
		KeyInputWait_();
		//===============================================
		
		//===============================================
		//���m�`������
		//�u�Ђ����Ɂ@�C�s���܂�����
		//�@���̊i����Ɂ@�����i���@����������I
		//-----------------------------------------------
		ShowMsg_("DEMO_850_VS1_MSG_070");
		KeyInputWait_();
		//===============================================
		
		Wait_(10);
		SetMotion_(nocho, g_ex_motion, BLEND_M);								//�m�`�������̐퓬�J�n�O���[�V����
		WaitMotion(nocho);
		SetMotion_(nocho, g_ex_motion_L, BLEND_M);
		//===============================================
		//���m�`������
		//�u�����@�C�s�̐��ʂ��@���[��ԁI
		//�@���O�Ɂ@�Ԃ������ā@���炤������[���I�I
		//-----------------------------------------------
		ShowMsg_("DEMO_850_VS1_MSG_080");
		KeyInputWait_();
		CloseMsgWnd_();
		//===============================================
		
		SetFade_(FADE_OUT, FADE_COLOR_BLACK, 5);								//�J�b�g�؂�ւ��Ó]
		WaitFade_();
		
		//��������������������������������������
		//���J�b�g�T �G�����X�^�[�p�[�e�B���f��
		//��������������������������������������
		
		SetPointCameraEye_("VS1_cameye003");
		SetPointCameraTarget_("VS1_camtgt003");

 		SetVisible(nocho, false);												//�m�`�������̔�\��
		SetVisible(aroma, false);												// ���t�F���[�̃A���}������
		SetVisible(player, false);												//��l����\��
		
		//�G�����X�^�[�p�[�e�B��\��
		SetVisible(g_enemy_monster01, true);
		SetVisible(g_enemy_monster02, true);
		SetVisible(g_enemy_monster03, true);
		SetVisible(g_enemy_monster04, true);

		SetFade_(FADE_IN, FADE_COLOR_BLACK, 5);									//�J�b�g�؂�ւ��Ó]����
		WaitFade_();
		
		//===============================================
		//���A���}
		//�u����ł́@�C�x���g�o�g���@��1��
		//�@���f�B�[�c�c�S�[�I�I
		//-----------------------------------------------
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_AROMA_NO2");
		ShowMsg_("DEMO_850_VS1_MSG_090");
		KeyInputWait_();
		CloseMsgWnd_();
		//===============================================
		SetMotionSpeed_(g_enemy_monster01, 0.8);
		SetMotion_(g_enemy_monster01, MOT_ATTACK, BLEND_M);
		SetMotion_(g_enemy_monster02, MOT_ATTACK, BLEND_M);
		SetMotion_(g_enemy_monster03, MOT_ATTACK, BLEND_M);
		SetMotion_(g_enemy_monster04, MOT_ATTACK, BLEND_M);

		break;
		
//������������������������������������������������������������������������������������������������������������������������������
// ���`�������W�o�g��2��� VS�L���O
//������������������������������������������������������������������������������������������������������������������������������
	case 1:
		// ���L���O
		king <- ArrangePointNpc_(ReadNpc_("n003"), "npc_VS2_king000");						//�L���O�̓ǂݍ��݂ƈʒu�ݒ�
		SetPointPosNoFit_(king, "npc_VS2_king000");
		SetVisible(king, false);															//���o�܂ŕ��䑳�i��U��\���j
		SetManualCalcAlpha_(king, true);
		
		local model_throne = ReadGimmick_("o_com_05");										// �ʍ�
		local throne = ArrangePointGimmick_("o_com_05", model_throne, "obj_throne000");
		SetVisible(throne, false);															//���o�܂ŕ��䑳�i��U��\���j
		
		// ����풓���[�V�����Ǎ�
		g_ex_talk_motion <- ReadMotion_(king, "n003_talk");									// �L���O�ҋ@����b
		g_ex_talk_motion_L <- ReadMotion_(king, "n003_talk_L");								// �L���O��bL
		g_ex_motion <- ReadMotion_(king, "n003_stick_up");									// �ҋ@����f��
		g_ex_motion_L <- ReadMotion_(king, "n003_stick_up_L");								// ��f��


		// �����^���L���O
		g_enemy_monster01 <- ArrangePointNpc_(ReadNpc_("m006_02"), "npc_VS2_meta000");		//�G�����X�^�[1�̖ڂ̓ǂݍ��݂ƈʒu�ݒ�
		SetScaleSilhouette(g_enemy_monster01, SCALE.N, SILHOUETTE_WIDTH.N);
		SetVisible(g_enemy_monster01, false);

		// ���L���O���U�[�h
		g_enemy_monster02 <- ArrangePointNpc_(ReadNpc_("m020_00"), "npc_VS2_riza000");		//�G�����X�^�[2�̖ڂ̓ǂݍ��݂ƈʒu�ݒ�
		SetScaleSilhouette(g_enemy_monster02, SCALE.M, SILHOUETTE_WIDTH.M);
		SetVisible(g_enemy_monster02, false);

		// ���I�[�N�L���O
		g_enemy_monster03 <- ArrangePointNpc_(ReadNpc_("m039_01"), "npc_VS2_ork000");		//�G�����X�^�[3�̖ڂ̓ǂݍ��݂ƈʒu�ݒ�
		SetScaleSilhouette(g_enemy_monster03, SCALE.N, SILHOUETTE_WIDTH.N);
		SetVisible(g_enemy_monster03, false);

	//-------------------------------------------------------------------------
	//		�͂��܂�͂��܂�i�Q���j
	//-------------------------------------------------------------------------
		// ���J�����ݒ�
		SetPointCameraEye_("cameye000");
		SetPointCameraTarget_("camtgt000");
		
		//��������������������������������������
		//���J�b�g�P �����f����
		//��������������������������������������
		StartDemoNoFade(FADE_COLOR_BLACK);
		local task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");		//�����f����
		WaitTask(task_cam);

		SetFade_(FADE_OUT, FADE_COLOR_BLACK, 5);
		WaitFade_();
		
		//��������������������������������������
		//���J�b�g�Q �A���}�Q�����f��
		//��������������������������������������
		SetPointCameraEye_("cameye001");
		SetPointCameraTarget_("camtgt001");
		SetFade_(FADE_IN, FADE_COLOR_BLACK, 5);
		WaitFade_();
		SetMotion_(aroma, MOT_TALKLOOP, BLEND_XL);								// �A���}�Q���̉�b���[�V����
		
		//===============================================
		//���A���}
		//�u�����ā@�݂Ȃ���@���҂����ˁI
		//�@�i���ꖼ���@�C�x���g�o�g���́@�͂��܂��I
		//-----------------------------------------------
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_AROMA_NO2");
		ShowMsg_("DEMO_850_VS2_MSG_010");
		KeyInputWait_();
		//===============================================
		//===============================================
		//���A���}
		//�u�܂��́@�݂Ȃ���@�������@��炪�q�[���[�I
		//�@�����X�^�[�}�X�^�[�@<name_player/>�[���I�I
		//-----------------------------------------------
		ShowMsg_("DEMO_850_VS2_MSG_020");
		KeyInputWait_();
		CloseMsgWnd_();
		//==============================================

		SetMotion_(aroma, MOT_WAIT, BLEND_XL);									// �A���}�Q���̑ҋ@���[�V����
		Wait_(10);

		SetFade_(FADE_OUT, FADE_COLOR_BLACK, 5);
		WaitFade_();
		//��������������������������������������
		//���J�b�g�R ��l��������f��
		//��������������������������������������
		SetPointCameraEye_("cameye002");
		SetPointCameraTarget_("camtgt002");
		SetMotion_(player, MOT_WALK, BLEND_L);									//�Ó]�������l�������n��
		task_player_move = Task_MoveForward_(player, 1.0, false);

		SetFade_(FADE_IN, FADE_COLOR_BLACK, 5);									//�J�b�g�؂�ւ��Ó]����
		WaitFade_();
		PlayLoopSE_("SE_WIFI_001");												//��SE:�����i���[�v�j
		Wait_(80);																//��l����������
		DeleteTask_(task_player_move);
		SetMotion_(player, player_battle_L, BLEND_XL);
		Wait_(5);

		//===============================================
		//���A���}
		//�u�����ā@�΂���́c
		//-----------------------------------------------
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_AROMA_NO2");
		ShowMsg_("DEMO_850_VS2_MSG_030");
		KeyInputWait_();
		CloseMsgWnd_();
		//==============================================
		StopLoopSE_(15);
		Wait_(5);
		SetFade_(FADE_OUT, FADE_COLOR_BLACK, 5);
		WaitFade_();
		//��������������������������������������
		//���J�b�g�S�L���O�o��
		//��������������������������������������
		task_cam = Task_AnimeMoveCamera_("VS2_anmeye001", "VS2_anmtgt001");
		DeleteTask_(task_cam);
		SetVisible(king, true);													//�L���O�\��
		SetVisible(throne, true);												//�ʍ��\��
		SetAlpha_(king, ALPHA_EXIST);

		SetFade_(FADE_IN, FADE_COLOR_BLACK, 5);
		WaitFade_();

		//===============================================
		//���A���}
		//�u�m�`���[�����Ɂ@���̐l����I
		//�@�ꑰ�𗦂���@����[���@�������I�I
		//-----------------------------------------------
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_AROMA_NO2");
		ShowMsg_("DEMO_850_VS2_MSG_040");
		KeyInputWait_();
		CloseMsgWnd_();
		//===============================================
		task_cam = Task_AnimeMoveCamera_("VS2_anmeye001", "VS2_anmtgt001");
		StartBlurEffect_();														//�u���[�ݒ�
		Wait_(30);
		EndBlurEffect_();
		Wait_(5);
		PlayLoopSE_("SE_WIFI_001");												// ��SE:�����i���[�v�j
		efc_cam = SetCameraEffect_("ef733_01_sym_shuchusen01", CAMERA_DEF);		// �W����
		WaitTask(task_cam);
		//===============================================
		//���A���}
		//�m�`���[���E�L���O���[���I�I
		//-----------------------------------------------
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_AROMA_NO2");
		ShowMsg_("DEMO_850_VS2_MSG_050");
		KeyInputWait_();
		CloseMsgWnd_();
		//===============================================
		Wait_(10);
		StopLoopSE_(20);
		DeleteEffectEmitter_(efc_cam);
		
		task_cam = Task_AnimeMoveCamera_("VS2_anmeye002", "VS2_anmtgt002");		//�񂠂����[�V�����Ŗڂ��B���̂ŃA���O���ύX
		SetMotion_(king, g_ex_talk_motion, BLEND_XL);							//�L���O�̉�b���[�V����
		WaitMotion(king);
		SetMotion_(king, g_ex_talk_motion_L, BLEND_XL);

		//===============================================
		//���L���O
		//�u�������ꂽ�c�c�����@�����ׂ��Ȃ̂ł��낤�ȁB
		//�@�܂������@�����̎p�Ɂ@�������ꂽ�̂ł���B
		//-----------------------------------------------
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_KING");
		ShowMsg_("DEMO_850_VS2_MSG_060");
		KeyInputWait_();
		//===============================================

		//===============================================
		//���L���O
		//�u���̂������ꂪ�@�]�̂��Ƃ��@�˂����������B
		//�@�K���ɂ��Ȃ��@���� ���킢���̂��B
		//-----------------------------------------------
		ShowMsg_("DEMO_850_VS2_MSG_070");
		KeyInputWait_();
		//===============================================
		Wait_(10);
		
		SetMotion_(king, g_ex_motion, BLEND_M);									//�L���O�̐퓬�J�n�O���[�V����
		WaitMotion(king);
		SetMotion_(king, g_ex_motion_L, BLEND_M);
		//===============================================
		//���L���O
		//�u�����@<name_player/>��@�ЂƏ������悤���I
		//�@������͂���ʂ��@�������Ă܂���I
		//-----------------------------------------------
		ShowMsg_("DEMO_850_VS2_MSG_080");
		KeyInputWait_();
		CloseMsgWnd_();
		//===============================================
		
		SetFade_(FADE_OUT, FADE_COLOR_BLACK, 5);
		WaitFade_();
		DeleteTask_(task_cam);
		//��������������������������������������
		//���J�b�g�T �G�����X�^�[�p�[�e�B���f��
		//��������������������������������������
		SetPointCameraEye_("VS2_cameye003");
		SetPointCameraTarget_("VS2_camtgt003");
		
		SetVisible(king, false);												//�L���O��\��
		SetVisible(throne, false);												//�ʍ���\��
		SetVisible(player, false);												//��l����\��
		SetVisible(aroma, false);												// ���t�F���[�̃A���}������

		SetVisible(g_enemy_monster01, true);									//�G�����X�^�[�p�[�e�B��\��
		SetVisible(g_enemy_monster02, true);
		SetVisible(g_enemy_monster03, true);

		SetFade_(FADE_IN, FADE_COLOR_BLACK, 5);
		WaitFade_();

		//===============================================
		//���A���}
		//�u����ł́@�C�x���g�o�g���@��Q��
		//�@���f�B�[�c�c�S�[�I�I
		//-----------------------------------------------
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_AROMA_NO2");
		ShowMsg_("DEMO_850_VS2_MSG_090");
		KeyInputWait_();
		CloseMsgWnd_();
		//===============================================
		SetMotionSpeed_(g_enemy_monster02, 0.7);

		SetMotion_(g_enemy_monster01, MOT_ATTACK, BLEND_M);
		SetMotion_(g_enemy_monster02, MOT_ATTACK, BLEND_M);
		SetMotion_(g_enemy_monster03, MOT_ATTACK, BLEND_M);
		break;
		
//������������������������������������������������������������������������������������������������������������������������������
// ���`�������W�o�g��3��� VS���i�[�e
//������������������������������������������������������������������������������������������������������������������������������
	case 2:
	// �����i�[�e
		rena <- ArrangePointNpc_(ReadNpc_("n007"), "npc_VS3_rena000");			//���i�[�e�̓ǂݍ��݂ƈʒu�ݒ�
		SetDir_(rena, 90);
		SetStepSe_(rena, SILENT_STEP_SE);										// �����𖳉��ɂ���

		// ����풓���[�V�����Ǎ�
		local g_ex_motion_S = ReadMotion_(rena, "n007_attack_start");			//�U���J�n
		local g_ex_motion_SL = ReadMotion_(rena, "n007_attack_start_L");
		local g_ex_motion = ReadMotion_(rena, "n007_attack");					//�U��
		local g_ex_motion_L = ReadMotion_(rena, "n007_attack_L");
		local rena_talk = ReadMotion_(rena, "n007_talk01");						// ��b�J�n�i������ɂ��Ă�j
		local rena_talk_L = ReadMotion_(rena, "n007_talk01_L");					// ��bL�i������ɂ��Ă�j
		local rena_look_down = ReadMotion_(rena, "n007_look_down_L");			// ���ނ��ҋ@
		local rena_caution = ReadMotion_(rena, "n007_caution_L");				// �x��L

		SetVisible(rena, false);
		SetManualCalcAlpha_(rena, true);
		
	// ������o�[�f�B
		birdy <- ArrangePointNpc_(ReadNpc_("n019"), "npc_VS3_birdy000");						//�G�����X�^�[1�̖ڂ̓ǂݍ��݂ƈʒu�ݒ�
		SetDir_(birdy, 90);
		SetScaleSilhouette(birdy, SCALE.G, SILHOUETTE_WIDTH.G);
		SetVisible(birdy, false);
		
		// ����풓���[�V�����Ǎ�
		local birdy_idol = ReadMotion_(birdy, "n019_idol");										// �ҋ@L
		local birdy_flight_Hovering_L = ReadMotion_(birdy, "n019_flight_Hovering_L");			// ��s(�z�o�����O)L
		local birdy_wing_Appeal = ReadMotion_(birdy, "n019_wing_Appeal");						// ���߃|�[�Y
		local birdy_wing_Appeal_L = ReadMotion_(birdy, "n019_wing_Appeal_L");					// ���߃|�[�YL
		
	//-------------------------------------------------------------------------
	//		�͂��܂�͂��܂�i�R���j
	//-------------------------------------------------------------------------
	// ���J�����ݒ�
		SetPointCameraEye_("cameye000");
		SetPointCameraTarget_("camtgt000");
		
		//��������������������������������������
		//���J�b�g�P �����f����
		//��������������������������������������
		StartDemoNoFade(FADE_COLOR_BLACK);

		local task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");
		WaitTask(task_cam);

		SetFade_(FADE_OUT, FADE_COLOR_BLACK, 5);
		WaitFade_();
		//��������������������������������������
		//���J�b�g�Q �A���}�Q�����f��
		//��������������������������������������
		SetPointCameraEye_("cameye001");
		SetPointCameraTarget_("camtgt001");

		SetFade_(FADE_IN, FADE_COLOR_BLACK, 5);
		WaitFade_();

		SetMotion_(aroma, MOT_TALKLOOP, BLEND_XL);								// �A���}�Q���̉�b���[�V����
		
		//===============================================
		//���A���}
		//�u�����ā@�݂Ȃ���@���҂����ˁI
		//�@�i���ꖼ���@�C�x���g�o�g���́@�͂��܂��I
		//-----------------------------------------------
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_AROMA_NO2");
		ShowMsg_("DEMO_850_VS3_MSG_010");
		KeyInputWait_();
		//===============================================
		//===============================================
		//���A���}
		//�u�܂��́@�݂Ȃ���@�������@��炪�q�[���[�I
		//�@�����X�^�[�}�X�^�[�@<name_player/>�[���I�I
		//-----------------------------------------------
		ShowMsg_("DEMO_850_VS3_MSG_020");
		KeyInputWait_();
		CloseMsgWnd_();
		//==============================================
		
		SetMotion_(aroma, MOT_WAIT, BLEND_XL);									// �A���}�Q���̑ҋ@���[�V����
		Wait_(10);

		SetFade_(FADE_OUT, FADE_COLOR_BLACK, 5);
		WaitFade_();
		//��������������������������������������
		//���J�b�g�R ��l��������f��
		//��������������������������������������
		SetPointCameraEye_("cameye002");
		SetPointCameraTarget_("camtgt002");
		SetMotion_(player, MOT_WALK, BLEND_L);									//�Ó]�������l�������n��
		task_player_move = Task_MoveForward_(player, 1.0, false);

		SetFade_(FADE_IN, FADE_COLOR_BLACK, 5);									//�J�b�g�؂�ւ��Ó]����
		WaitFade_();
		PlayLoopSE_("SE_WIFI_001");												//��SE:�����i���[�v�j
		Wait_(80);																//��l����������
		DeleteTask_(task_player_move);
		SetMotion_(player, player_battle_L, BLEND_XL);
		Wait_(5);
		//===============================================
		//���A���}
		//�u�����ā@�΂���́c
		//-----------------------------------------------
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_AROMA_NO2");
		ShowMsg_("DEMO_850_VS3_MSG_030");
		KeyInputWait_();
		CloseMsgWnd_();
		//==============================================
		StopLoopSE_(15);
		Wait_(5);
		SetFade_(FADE_OUT, FADE_COLOR_BLACK, 5);
		WaitFade_();
		//��������������������������������������
		//���J�b�g�S ���i�[�e�o��
		//��������������������������������������
		task_cam = Task_AnimeMoveCamera_("VS3_anmeye001", "VS3_anmtgt001");
		DeleteTask_(task_cam);
		SetFace_(rena, "Face_loop_close");									// �ڕ�

		SetVisible(rena, true);												//���i�\��������
		SetAlpha_(rena, ALPHA_EXIST);
		SetMotion_(rena, MOT_WALK, BLEND_N);
		local task_rena = Task_MoveForward_(rena, 0.85, false);				//�ړ�
		SetMotionSpeed_(rena, 0.95);
		SetFade_(FADE_IN, FADE_COLOR_BLACK, 5);								//�J�b�g�؂�ւ��Ó]����
		WaitFade_();
		PlaySE_("SE_FLD_015");												// ��SE:����

		//===============================================
		//���A���}
		//�u���̃u���C�N���[���h�́@��ɕ�����
		//�@���E�̑��c�c���̕��g����@���̏������I
		//-----------------------------------------------
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_AROMA_NO2");
		ShowMsg_("DEMO_850_VS3_MSG_040");
		
		Wait_(20);
		PlaySE_("SE_FLD_015");												// ��SE:����
		Wait_(10);
		SetMotion_(rena, MOT_WAIT, BLEND_L);
		DeleteTask_(task_rena);
		SetMotionSpeed_(rena, 1.0);
		
		KeyInputWait_();
		CloseMsgWnd_();
		//===============================================
		task_cam = Task_AnimeMoveCamera_("VS3_anmeye001", "VS3_anmtgt001");
		SetMotion_(rena, rena_look_down, BLEND_L);								//���i�[�e���ނ��ҋ@

		StartBlurEffect_();														//�u���[�ݒ�
		Wait_(30);
		EndBlurEffect_();
		Wait_(5);	
		PlayLoopSE_("SE_WIFI_001");												// ��SE:�����i���[�v�j
		efc_cam = SetCameraEffect_("ef733_01_sym_shuchusen01", CAMERA_DEF);		// �W����
		WaitTask(task_cam);

		//===============================================
		//���A���}
		//�u<name_player/>���@�������ҁc�c
		//�@���i�[�e�̓o���I�I
		//-----------------------------------------------
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_AROMA_NO2");
		ShowMsg_("DEMO_850_VS3_MSG_050");
		SetMotion_(rena, MOT_WAIT, BLEND_XL);									//���i�[�e���ނ��ҋ@
		SetFace_(rena, "Face_default");											// �ڊJ��
		KeyInputWait_();
		CloseMsgWnd_();
		//===============================================
		Wait_(10);
		StopLoopSE_(20);
		DeleteEffectEmitter_(efc_cam);
		
		SetMotion_(rena, rena_talk, BLEND_XL);									// ���i�b��
		WaitMotion(rena);
		SetMotion_(rena, rena_talk_L, BLEND_M);

		//===============================================
		//�����i�[�e
		//�u�O�̐킢�ł́@���Ȃ��Ɂ@���肫�肾�����B
		//�@���ǁ@����ł́@�_�����Ǝv�����́c�c�B
		//-----------------------------------------------
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_RENERTE");
		ShowMsg_("DEMO_850_VS3_MSG_060");
		KeyInputWait_();
		//===============================================

		//===============================================
		//�����i�[�e
		//�u���Ȃ��悤�Ɂ@�����Ȃ�B
		//�@���̐��E���c�c���ꂩ����@��邽�߂ɁB
		//-----------------------------------------------
		ShowMsg_("DEMO_850_VS3_MSG_070");
		KeyInputWait_();
		//===============================================
		Wait_(10);

		SetMotion_(rena, g_ex_motion_S, BLEND_XL);								//���i�[�e�̐퓬�J�n�O���[�V����
		WaitMotion(rena);
		SetMotion_(rena, g_ex_motion_SL, BLEND_XL);

		//===============================================
		//�����i�[�e
		//�u�o�[�f�B�I�@�������́@���̃`�J����
		//�@<name_player/>�Ɂ@���Ă��炤��c�c�I
		//-----------------------------------------------
		ShowMsg_("DEMO_850_VS3_MSG_080");
		SetMotion_(rena, g_ex_motion, BLEND_XL);
		WaitMotion(rena);
		SetMotion_(rena, g_ex_motion_L, BLEND_XL);
		KeyInputWait_();
		CloseMsgWnd_();
		//===============================================

		SetFade_(FADE_OUT, FADE_COLOR_BLACK, 5);
		WaitFade_();
		
		//��������������������������������������
		//���J�b�g�U �G�����X�^�[�p�[�e�B���f��
		//��������������������������������������
		SetVisible(aroma, false);																	// ���t�F���[�̃A���}������
		SetVisible(player, false);																	//��l����\��
		SetVisible(rena, false);																	//���i�[�e��\��
		SetPointCameraEye_("VS3_cameye003");
		SetPointCameraTarget_("VS3_camtgt003");

		SetVisible(birdy, true);																	//�G�����X�^�[�p�[�e�B��\��
		SetMotion_(birdy, birdy_flight_Hovering_L, BLEND_N);										//�o�[�f�B�z�o�����O���[�V����
		local task_birdy = Task_AnimeMoveNoDirNoFit_(birdy, "anm_VS3_birdy000");
		SetFade_(FADE_IN, FADE_COLOR_BLACK, 5);
		WaitFade_();
		PlaySE_("SE_FLD_219");																		// ��SE:���󃉃C�h�H
		SetMotion_(rena, rena_caution, BLEND_XL);													//���i�[�e�\�����[�V����
		Wait_(35);
		PlaySE_("SE_FLD_219");																		// ��SE:���󃉃C�h�H
		Wait_(35);
		SetMotion_(birdy, birdy_idol, BLEND_XL);													//�o�[�f�B�ҋ@���[�V����
		Wait_(15);
		
		StartDecayEarthQuake_(20, 3, 3)																//�n�k
		PlaySE_("SE_DEM_014");
		local efc_birdy = SetSelectBoneEffect_("ef721_03_nat_smoke_n03", birdy, ATTACH_GLOBAL);		//��
		SetEffectScale_(efc_birdy, 3.0);
		
		//===============================================
		//���A���}
		//�u����ł́@�C�x���g�o�g���@��3��
		//�@���f�B�[�c�c�S�[�I�I
		//-----------------------------------------------
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_AROMA_NO2");
		ShowMsg_("DEMO_850_VS3_MSG_090");
		KeyInputWait_();
		CloseMsgWnd_();
		//===============================================
		SetMotion_(birdy, birdy_wing_Appeal, BLEND_L)												//���@���߃|�[�Y
		break;
		
//������������������������������������������������������������������������������������������������������������������������������
// ���`�������W�o�g��4��� VS�A���Z�X
//������������������������������������������������������������������������������������������������������������������������������
	case 3:
		
	// ���A���Z�X
		ansesu <- ArrangePointNpc_(ReadNpc_("n036"), "npc_VS4_ansesu000");					//�A���Z�X�̓ǂݍ��݂ƈʒu�ݒ�
		SetVisible(ansesu, false);
		SetManualCalcAlpha_(ansesu, true);

		// ����풓���[�V�����Ǎ�
		local ansesu_battle = ReadMotion_(ansesu, "Player_battle_L");
		local ansesu_land = ReadMotion_(ansesu, "Player_hero_landing");						// ���n
		local ansesu_float_L = ReadMotion_(ansesu, "Player_ride_on");					// ����L
		local ansesu_one_knee = ReadMotion_(ansesu, "Player_one_knee");						// �㔼�g���N���������G
		local ansesu_up03_L = ReadMotion_(ansesu, "Player_one_knee_L");						// �ЕG
		
	// ���{�[�V���b�N
		g_enemy_monster01 <- ArrangePointNpc_(ReadNpc_("m207_00"), "npc_VS4_bosho000");		//�G�����X�^�[1�̖ڂ̓ǂݍ��݂ƈʒu�ݒ�
		SetScaleSilhouette(g_enemy_monster01, 0.8, SILHOUETTE_WIDTH.N);
		SetVisible(g_enemy_monster01, false);
		
	// ���u���h���h
		g_enemy_monster02 <- ArrangePointNpc_(ReadNpc_("m203_00"), "npc_VS4_bundo000");		//�G�����X�^�[2�̖ڂ̓ǂݍ��݂ƈʒu�ݒ�
		SetScaleSilhouette(g_enemy_monster02, SCALE.N, SILHOUETTE_WIDTH.N);
		SetVisible(g_enemy_monster02, false);

	// ���A�[�U���[�N
		g_enemy_monster03 <- ArrangePointNpc_(ReadNpc_("m204_00"), "npc_VS4_aza000");		//�G�����X�^�[3�̖ڂ̓ǂݍ��݂ƈʒu�ݒ�
		SetScaleSilhouette(g_enemy_monster03, 0.8, SILHOUETTE_WIDTH.N);
		SetVisible(g_enemy_monster03, false);
		
	// ���C�b�^�u��
		g_enemy_monster04 <- ArrangePointNpc_(ReadNpc_("m205_00"), "npc_VS4_itta000");		//�G�����X�^�[4�̖ڂ̓ǂݍ��݂ƈʒu�ݒ�
		SetScaleSilhouette(g_enemy_monster04, SCALE.N, SILHOUETTE_WIDTH.N);
		SetVisible(g_enemy_monster04, false);


	//-------------------------------------------------------------------------
	//		�͂��܂�͂��܂�i�S���j
	//-------------------------------------------------------------------------
		// ���J�����ݒ�
		SetPointCameraEye_("cameye000");
		SetPointCameraTarget_("camtgt000");
		
		//��������������������������������������
		//���J�b�g�P �����f����
		//��������������������������������������
		StartDemoNoFade(FADE_COLOR_BLACK);
		local task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");
		WaitTask(task_cam);

		SetFade_(FADE_OUT, FADE_COLOR_BLACK, 5);
		WaitFade_();
		//��������������������������������������
		//���J�b�g�Q �A���}�Q�����f��
		//��������������������������������������
		SetPointCameraEye_("cameye001");
		SetPointCameraTarget_("camtgt001");
		SetFade_(FADE_IN, FADE_COLOR_BLACK, 5);
		WaitFade_();

		SetMotion_(aroma, MOT_TALKLOOP, BLEND_XL);								// �A���}�Q���̉�b���[�V����

		//===============================================
		//���A���}
		//�u�����ā@�݂Ȃ���@���҂����ˁI
		//�@�i���ꖼ���@�C�x���g�o�g���́@�͂��܂��I
		//-----------------------------------------------
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_AROMA_NO2");
		ShowMsg_("DEMO_850_VS4_MSG_010");
		KeyInputWait_();
		//===============================================
		//===============================================
		//���A���}
		//�u�܂��́@�݂Ȃ���@�������@��炪�q�[���[�I
		//�@�����X�^�[�}�X�^�[�@<name_player/>�[���I�I
		//-----------------------------------------------
		ShowMsg_("DEMO_850_VS4_MSG_020");
		KeyInputWait_();
		CloseMsgWnd_();
		//==============================================
		
		SetMotion_(aroma, MOT_WAIT, BLEND_XL);									// �A���}�Q���̑ҋ@���[�V����

		Wait_(10);

		SetFade_(FADE_OUT, FADE_COLOR_BLACK, 5);
		WaitFade_();
		//��������������������������������������
		//���J�b�g�R ��l��������f��
		//��������������������������������������
		SetPointCameraEye_("cameye002");
		SetPointCameraTarget_("camtgt002");
		SetMotion_(player, MOT_WALK, BLEND_L);									//�Ó]�������l�������n��
		task_player_move = Task_MoveForward_(player, 1.0, false);

		SetFade_(FADE_IN, FADE_COLOR_BLACK, 5);									//�J�b�g�؂�ւ��Ó]����
		WaitFade_();
		PlayLoopSE_("SE_WIFI_001");												//��SE:�����i���[�v�j
		Wait_(80);																//��l����������
		DeleteTask_(task_player_move);
		SetMotion_(player, player_battle_L, BLEND_XL);
		Wait_(5);

		//===============================================
		//���A���}
		//�u�����ā@�΂���́c
		//-----------------------------------------------
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_AROMA_NO2");
		ShowMsg_("DEMO_850_VS4_MSG_030");
		KeyInputWait_();
		CloseMsgWnd_();
		//==============================================
		StopLoopSE_(15);
		Wait_(5);
		SetFade_(FADE_OUT, FADE_COLOR_BLACK, 5);
		WaitFade_();
		
		//��������������������������������������
		//���J�b�g�S �A���Z�X�o��I�I�I�I�I
		//��������������������������������������
		task_cam = Task_AnimeMoveCamera_("VS4_anmeye001", "VS4_anmtgt001");
		DeleteTask_(task_cam);
		
		SetFade_(FADE_IN, FADE_COLOR_BLACK, 5);
		WaitFade_();

		//===============================================
		//���A���}
		//���W�X�^���X�ŋ��́@�����X�^�[�}�X�^�[�ɂ���
		//�@�̋��̐��́@�����X�^�[�o�g���f�o���ҁI
		//-----------------------------------------------
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_AROMA_NO2");
		ShowMsg_("DEMO_850_VS4_MSG_040");
		KeyInputWait_();
		CloseMsgWnd_();
		//===============================================
		task_cam = Task_AnimeMoveCamera_("VS4_anmeye001", "VS4_anmtgt001");
		SetVisible(ansesu, true);														//�A���Z�X�\��
		SetFace_(ansesu, "Face_smile");													//�Ί�
		SetAlpha_(ansesu, ALPHA_EXIST);
		SetMotion_(ansesu, ansesu_float_L, BLEND_N);									//�����i��э~���j

		local task_ansesu = Task_AnimeMoveNoDirNoFit_(ansesu, "anm_VS4_ansesu000");		//�A���Z�X �h��ȓo��
		PlaySE_("SE_DEM_132");															//��SE:���n

		Wait_(18);
		SetMotion_(ansesu, ansesu_land, 14);
		Wait_(8)
		StartDecayEarthQuake_(10.0,3.0,0.8);												//�n�k
		local efc = SetSelectBoneEffectSetOffset_("ef850_01_smoke_fall", ansesu, ATTACH_GLOBAL, Vec3(0,0,0));		//���G�t�F�N�g
		SetEffectScale_(efc, 0.3);

		Wait_(30);
//		SetMotion_(ansesu, ansesu_one_knee, BLEND_L);									//�A���Z�X����
//		Wait_(10);
		SetMotion_(ansesu, MOT_WAIT, BLEND_XL);											//�A���Z�X�ҋ@���[�V����
		Wait_(10);
		efc_cam = SetCameraEffect_("ef733_01_sym_shuchusen01", CAMERA_DEF);				// �W����
		
		Wait_(10);
		PlayLoopSE_("SE_WIFI_001");														// ��SE:�����i���[�v�j
		WaitTask(task_cam);
		//===============================================
		//���A���}
		//�u�A���Z�X���[���I�I
		//-----------------------------------------------
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_AROMA_NO2");
		ShowMsg_("DEMO_850_VS4_MSG_050");
		KeyInputWait_();
		CloseMsgWnd_();
		//===============================================
		task_cam = Task_AnimeMoveCamera_("VS4_anmeye002", "VS4_anmtgt002");
		Wait_(10);
		StopLoopSE_(20);
		DeleteEffectEmitter_(efc_cam);
		SetMotion_(ansesu, MOT_TALKLOOP, BLEND_XL);										//�A���Z�X�̉�b���[�V����

		//===============================================
		//���A���Z�X
		//�u�ււ��I�@���ǂ낢�����H
		//�@�Ƃ����Ă��@�I���́@�{������Ȃ��B
		//-----------------------------------------------
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_ANSESU");
		ShowMsg_("DEMO_850_VS4_MSG_060");
		KeyInputWait_();
		//===============================================

		//===============================================
		//���A���Z�X
		//�u�e���W�A�̎����Ă����@�f�[�^����
		//�@�S�����̎p���@�Č����ꂽ�@�z���O�������B
		//-----------------------------------------------
		ShowMsg_("DEMO_850_VS4_MSG_070");
		
		PlaySE_("SE_DEM_068");
		efc_ansesu = SetBoneEffect_("ef732_15_holography02", ansesu);					//�z���O�����o��
		SetAlpha_(ansesu, ALPHA_HALF);
		Wait_(3);
		SetAlpha_(ansesu, ALPHA_EXIST);
		KeyInputWait_();
		//===============================================
		Wait_(10);
		SetMotion_(ansesu, ansesu_battle, BLEND_XL);									//�A���Z�X�̐퓬�J�n�O���[�V����
		//===============================================
		//���A���Z�X
		//�u�����@�`�J���́@�{���ƕς��Ȃ����B
		//�@�����I�@�������Ă����@<name_player/>�I�I
		//-----------------------------------------------
		ShowMsg_("DEMO_850_VS4_MSG_080");
		KeyInputWait_();
		CloseMsgWnd_();
		//===============================================
		Wait_(10);
		SetFade_(FADE_OUT, FADE_COLOR_BLACK, 5);
		WaitFade_();
		DeleteTask_(task_cam);
		//��������������������������������������
		//���J�b�g�U �G�����X�^�[�p�[�e�B���f��
		//��������������������������������������
		SetPointCameraEye_("VS4_cameye003");
		SetPointCameraTarget_("VS4_camtgt003");
		SetVisible(player, false);														//��l����\��
		SetVisible(ansesu, false);														//�A���Z�X��\��

		SetVisible(g_enemy_monster01, true);											//�G�����X�^�[�p�[�e�B��\��
		SetVisible(g_enemy_monster02, true);
		SetVisible(g_enemy_monster03, true);
		SetVisible(g_enemy_monster04, true);
		
		SetFade_(FADE_IN, FADE_COLOR_BLACK, 5);
		WaitFade_();

		//===============================================
		//���A���}
		//�u����ł́@�C�x���g�o�g���@��4��
		//�@���f�B�[�c�c�S�[�I�I
		//-----------------------------------------------
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_AROMA_NO2");
		ShowMsg_("DEMO_850_VS4_MSG_090");
		KeyInputWait_();
		CloseMsgWnd_();
		//===============================================
		SetMotionSpeed_(g_enemy_monster04, 1.3);										//�C�b�^�u�� ���[�V��������
		SetMotion_(g_enemy_monster01, MOT_SPELL_ACTUATE, BLEND_M);
		SetMotion_(g_enemy_monster02, MOT_SWORD_ACTUATE, BLEND_M);
		SetMotion_(g_enemy_monster03, MOT_SPELL_ACTUATE, BLEND_M);
		SetMotion_(g_enemy_monster04, MOT_SPELL_ACTUATE, BLEND_M);
		
		break;
		
//������������������������������������������������������������������������������������������������������������������������������
// ���`�������W�o�g��5��� VS�A���}
//������������������������������������������������������������������������������������������������������������������������������
	// ���A���}
	case 4:
		aroma_VS <- ArrangePointNpc_(ReadNpc_("n018"), "npc_VS5_aroma000");				//�A���}2��(�ΐ�)�̓ǂݍ��݂ƈʒu�ݒ�
		SetStepSe_(aroma_VS, SILENT_STEP_SE);											// �����𖳉��ɂ���
		SetVisible(aroma_VS, false);
		SetManualCalcAlpha_(aroma_VS, true);
		
		// ����풓���[�V�����Ǎ�
		g_ex_motion <- ReadMotion_(aroma_VS, "n018_angry");								// �{��
		g_ex_motion_L <- ReadMotion_(aroma_VS, "n018_angry_L");							// �{��L
		g_ex_motion_L2 <- ReadMotion_(aroma_VS, "n018_guard_L");						// �\����L

	// ���T���`��
		sancho <- ArrangePointNpc_(ReadNpc_("m179_00"), "npc_VS5_sancho000");			//�G�����X�^�[1�̖ڂ̓ǂݍ��݂ƈʒu�ݒ�
		SetScaleSilhouette(sancho, 0.8, 0.8);
		SetVisible(sancho, false);
		
	// ���m�`���[�����{
		robo <- ArrangePointNpc_(ReadNpc_("m174_00"), "npc_VS5_robo000");				//�G�����X�^�[2�̖ڂ̓ǂݍ��݂ƈʒu�ݒ�
		SetScaleSilhouette(robo, 2.0, 2.0);
		SetVisible(robo, false);

	//-------------------------------------------------------------------------
	//		�͂��܂�͂��܂�i�T���j
	//-------------------------------------------------------------------------
		SetPointCameraEye_("cameye000");
		SetPointCameraTarget_("camtgt000");
		
		//��������������������������������������
		//���J�b�g�P �����f����
		//��������������������������������������
		StartDemoNoFade(FADE_COLOR_BLACK);
		local task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");		//�����f����
		WaitTask(task_cam);

		SetFade_(FADE_OUT, FADE_COLOR_BLACK, 5);
		WaitFade_();

		//��������������������������������������
		//���J�b�g�Q �A���}�Q�����f��
		//��������������������������������������
		SetPointCameraEye_("cameye001");
		SetPointCameraTarget_("camtgt001");
		SetFade_(FADE_IN, FADE_COLOR_BLACK, 5);
		WaitFade_();

		SetMotion_(aroma, MOT_TALKLOOP, BLEND_XL);								// �A���}�Q���̉�b���[�V����
		
		//===============================================
		//���A���}
		//�u�����ā@�݂Ȃ���@���҂����ˁI
		//�@�i���ꖼ���@�C�x���g�o�g���́@�͂��܂��I
		//-----------------------------------------------
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_AROMA_NO2");
		ShowMsg_("DEMO_850_VS5_MSG_010");
		KeyInputWait_();
		//===============================================
		//===============================================
		//���A���}
		//�u�܂��́@�݂Ȃ���@�������@��炪�q�[���[�I
		//�@�����X�^�[�}�X�^�[�@<name_player/>�[���I�I
		//-----------------------------------------------
		ShowMsg_("DEMO_850_VS5_MSG_020");
		KeyInputWait_();
		CloseMsgWnd_();
		//==============================================
		
		SetMotion_(aroma, MOT_WAIT, BLEND_XL);									// �A���}�Q���̑ҋ@���[�V����

		Wait_(10);

		SetFade_(FADE_OUT, FADE_COLOR_BLACK, 5);
		WaitFade_();
		//��������������������������������������
		//���J�b�g�R ��l��������f��
		//��������������������������������������
		SetPointCameraEye_("cameye002");
		SetPointCameraTarget_("camtgt002");
		SetMotion_(player, MOT_WALK, BLEND_L);									//�Ó]�������l�������n��
		task_player_move = Task_MoveForward_(player, 1.0, false);

		SetFade_(FADE_IN, FADE_COLOR_BLACK, 5);									//�J�b�g�؂�ւ��Ó]����
		WaitFade_();
		PlayLoopSE_("SE_WIFI_001");												//��SE:�����i���[�v�j
		Wait_(80);																//��l����������
		DeleteTask_(task_player_move);
		SetMotion_(player, player_battle_L, BLEND_XL);
		Wait_(5);

		//===============================================
		//���A���}
		//�u�����ā@�΂���́c
		//-----------------------------------------------
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_AROMA_NO2");
		ShowMsg_("DEMO_850_VS5_MSG_030");
		KeyInputWait_();
		CloseMsgWnd_();
		//==============================================
		StopLoopSE_(15);
		Wait_(5);
		SetFade_(FADE_OUT, FADE_COLOR_BLACK, 5);
		WaitFade_();
		
		//��������������������������������������
		//���J�b�g�S �A���}2���̑������f��
		//��������������������������������������
		task_cam = Task_AnimeMoveCamera_("VS5_anmeye001", "VS5_anmtgt001");

		SetVisible(aroma_VS, true);												//�A���}2���\���i���J�����߂��ł������ɂȂ�Ȃ��ݒ�j
		SetAlpha_(aroma_VS, ALPHA_EXIST);
		
		SetMotion_(aroma_VS, MOT_WALK, BLEND_N);
		local task_aroma = Task_AnimeMove_(aroma_VS, "anm_VS5_aroma000");		//�ړ�

		SetFade_(FADE_IN, FADE_COLOR_BLACK, 5);
		WaitFade_();

		PlaySE_("SE_FLD_015");												// ��SE:����
		Wait_(22);
		PlaySE_("SE_FLD_015");												// ��SE:����
		Wait_(8);
		PlaySE_("SE_DEM_068");
		efc_aroma = SetBoneEffect_("ef732_15_holography02", aroma_VS);		//�z���O�����o��
		SetAlpha_(aroma_VS, ALPHA_HALF);
		Wait_(3);
		SetAlpha_(aroma_VS, ALPHA_EXIST);
		
		Wait_(20);
		PlaySE_("SE_FLD_015");												// ��SE:����
		Wait_(7);
		PlaySE_("SE_DEM_068");
		efc_aroma = SetBoneEffect_("ef732_15_holography02", aroma_VS);		//�z���O�����o��
		SetAlpha_(aroma_VS, ALPHA_HALF);
		Wait_(3);
		SetAlpha_(aroma_VS, ALPHA_EXIST);
		
		WaitTask(task_aroma);
		SetMotion_(aroma_VS, MOT_WAIT, BLEND_L);
		WaitTask(task_cam);
		
		//===============================================
		//���A���}
		//�u����Ƃ��́@���W�X�^���X�̎w���ҁc�c
		//�@�����ā@�܂��@����Ƃ��́@���񂽂̋��͎ҁc�c
		//-----------------------------------------------
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_AROMA_NO2");
		ShowMsg_("DEMO_850_VS5_MSG_040");
		KeyInputWait_();
		CloseMsgWnd_();
		//===============================================
		task_cam = Task_AnimeMoveCamera_("VS5_anmeye002", "VS5_anmtgt002");
		
		Wait_(10);
		PlaySE_("SE_DEM_068");
		efc_aroma = SetBoneEffect_("ef732_15_holography02", aroma_VS);			//�z���O�����o��
		SetAlpha_(aroma_VS, ALPHA_HALF);
		Wait_(3);
		SetAlpha_(aroma_VS, ALPHA_EXIST);
		Wait_(24);

		PlayLoopSE_("SE_WIFI_001");												// ��SE:�����i���[�v�j
		efc_cam = SetCameraEffect_("ef733_01_sym_shuchusen01", CAMERA_DEF);		// �W����
		
		SetFace_(aroma_VS, "Face_smile");										//�Ί�
		SetMotion_(aroma_VS, g_ex_motion, BLEND_XL);							//�A���}2���̓{��
		WaitMotion(aroma_VS);
		SetMotion_(aroma_VS, g_ex_motion_L, BLEND_XL);							//�A���}2���̓{��L
		WaitTask(task_cam);
		//===============================================
		//���A���}
		//�u�����I�@���x�̑���́@���̂������I
		//�@�V�˔������Ȋw�ҁ@�A���}���܂�I�I
		//-----------------------------------------------
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_AROMA_NO2");
		ShowMsg_("DEMO_850_VS5_MSG_050");
		KeyInputWait_();
		//===============================================
		DeleteEffectEmitter_(efc_cam); 
		StopLoopSE_(20);
		Wait_(10);
		SetMotion_(aroma_VS, MOT_TALK, BLEND_XL);								//�A���}2�� �b��
		WaitMotion(aroma_VS);
		SetMotion_(aroma_VS, MOT_TALKLOOP, BLEND_M);

		//===============================================
		//���A���}2��
		//�u���āc�c�������@���́@�I���W�i���̃R�s�[�B
		//�@�ł��@�`�J���́@�I���W�i���Ɠ���������ˁB
		//-----------------------------------------------
		ShowMsg_("DEMO_850_VS5_MSG_060");
		KeyInputWait_();
		//===============================================

		//===============================================
		//���A���}2��
		//�u�������́@�Ȋw�����̏�����Ȃ��B
		//�@�}�X�^�[�Ƃ��Ă��@�ꗬ���Ɓ@�����Ă�����I
		//-----------------------------------------------
		ShowMsg_("DEMO_850_VS5_MSG_070");
		KeyInputWait_();
		//===============================================
		Wait_(10);
		
		SetMotion_(aroma_VS, g_ex_motion_L2, BLEND_XL);							//�A���}2���̍\���郂�[�V����
		//===============================================
		//���A���}2��
		//�u�����@�������Ă��Ȃ����@<name_player/>�I
		//�@�R�e���p���Ɂ@���Ă������I
		//-----------------------------------------------
		ShowMsg_("DEMO_850_VS5_MSG_080");
		KeyInputWait_();
		CloseMsgWnd_();
		//===============================================

		SetFade_(FADE_OUT, FADE_COLOR_BLACK, 5);
		WaitFade_();
		
		SetVisible(aroma, false);																	// ���t�F���[�̃A���}������
		SetVisible(player, false);																	//��l����\��
		SetVisible(aroma_VS, false);																//�ΐ푊��̃A���}��\��
		//��������������������������������������
		//���J�b�g�U �G�����X�^�[�p�[�e�B���f��
		//��������������������������������������
		SetPointCameraEye_("VS5_cameye003");
		SetPointCameraTarget_("VS5_camtgt003");

		SetVisible(robo, true);																		//�m�`�����{��\��
		SetMotion_(robo, MOT_JUMP_DOWN, BLEND_N);													//���{�z�o�����O���[�V����
		SetVisible(sancho, true);																	//�T���`���\��
		SetMotion_(sancho, MOT_JUMP_DOWN, BLEND_N);													//�T���`���z�o�����O���[�V����
		
		local task_robo = Task_AnimeMoveNoDirNoFit_(robo, "anm_VS5_robo000");
		local task_sancho = Task_AnimeMoveNoDirNoFit_(sancho, "anm_VS5_sancho000");

		SetFade_(FADE_IN, FADE_COLOR_BLACK, 5);
		WaitFade_();
		
		Wait_(35);
		SetMotion_(robo, MOT_WAIT, BLEND_XL);														//���{�ҋ@���[�V����
		SetMotion_(sancho, MOT_WAIT, BLEND_XL);														//�T���`���ҋ@���[�V����
		Wait_(13);
		
		StartDecayEarthQuake_(20, 3, 3)																//�n�k
		PlaySE_("SE_DEM_014");
		local efc_robo = SetSelectBoneEffect_("ef721_03_nat_smoke_n03", robo, ATTACH_GLOBAL);		//��
		SetEffectScale_(efc_robo, 2.0);
		local efc_sancho = SetSelectBoneEffect_("ef721_03_nat_smoke_n03", sancho, ATTACH_GLOBAL);		//��
		SetEffectScale_(efc_sancho, 1.3);
		
		Wait_(30);
		//===============================================
		//���A���}
		//�u����ł́@�C�x���g�o�g���@��5��
		//�@���f�B�[�c�c�S�[�I�I
		//-----------------------------------------------
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_AROMA_NO2");
		ShowMsg_("DEMO_850_VS5_MSG_090");
		KeyInputWait_();
		CloseMsgWnd_();
		//===============================================
		
		SetMotion_(robo, MOT_SPELL_ACTUATE, BLEND_M);												//���{�U�����[�V����
		SetMotion_(sancho, MOT_SWORD_ACTUATE, BLEND_M);												//�T���`���U�����[�V����

		
//������������������������������������������������������������������������������������������������������������������������������

		break;
	default:
		DebugPrint("�z�肵�Ă��Ȃ��`�������W�o�g���̉��ł��B");
		break;
	}


	StopBgm_(BGM_STOP_DEF);

	EncountEndDemo(ENCOUNT_NORMAL);

}

