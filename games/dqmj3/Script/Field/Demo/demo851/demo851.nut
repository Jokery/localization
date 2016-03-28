//=============================================
//
//		demo851[�`�������W�o�g��_2(�퓬��)]
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
		local task_cam, task_player;
		local player, npc_Aroma2go;

	// ����l��
		player = GetPlayerId_();
		SetPointPos_(player, "player000");
		SetManualCalcAlpha_(player, true);

		//��풓���[�V����
		local player_battle_L = ReadMotion_(player, "Player_battle_L");							// �퓬�ҋ@L
		local player_hand = ReadMotion_(player, "Player_r_hand_hold01L");						//�������1
		local player_hand2 = ReadMotion_(player, "Player_r_hand_hold02L");						//�������2
		//�������[�V����
		SetMotion_(player, player_battle_L, BLEND_N);											//�퓬�ҋ@

	//���A���}�Q���i�i��ҁj
		npc_Aroma2go = ArrangePointNpc_(ReadNpc_("n018"), "npc_aroma000");
		SetManualCalcAlpha_(npc_Aroma2go, true);
		SetVisible(npc_Aroma2go, false);
	
	// ���G�t�F�N�g�ǂݍ���
		LoadEffect_("ef732_15_holography02");													// �z���O�����\���@�o��

//������������������������������������������������������������������������������������������������������������������������������
// ���`�������W�o�g��1��� VS�m�`����������
//������������������������������������������������������������������������������������������������������������������������������
	
	//�e��폈���̌Ăяo���i�P�̃f�����ŕ����C�x���g���s���̂ŁA�匳�ŕ�������j
	switch ( GetNumFlg_("NUM_CHALLENGE_BATTLE_MAIN") ) {
	case 0:
	// ���m�`������
		local nocho = ArrangePointNpc_(ReadNpc_("n043"), "npc_VS1_nocho000");

		// ����풓���[�V�����Ǎ�
		local nocho_hand = ReadMotion_(nocho, "n002_hand_up");					// ��b�����������i�G�[�X�̃��[�V�����̗��p�j
		local nocho_hand_L = ReadMotion_(nocho, "n002_hand_up_L");				// ���������L�i�G�[�X�̃��[�V�����̗��p�j
		local nocho_down = ReadMotion_(nocho, "n000_feel_down");				// �ʏ��b����������
		local nocho_down_L = ReadMotion_(nocho, "n000_feel_down_L");			// ��������LOOP
		local nocho_talk_joy_L = ReadMotion_(nocho, "n002_talk_joy_L");			// ��b�@��������
		
		SetVisible(nocho, false);
		SetManualCalcAlpha_(nocho, true);

		// ���J�����ݒ�
		SetPointCameraEye_("cameye000");										//��l�������p���f��
		SetPointCameraTarget_("camtgt000");

		//-------------------------------------------------------------------------
		//		�͂��܂�͂��܂�i�P���j
		//-------------------------------------------------------------------------
		//��������������������������������������
		//���J�b�g�P ��l�������p���f��
		//��������������������������������������
		SetFadePlane_(FADE_PLANE.PLANE_3D);
		SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
		
		//===============================================
		//���A���}
		//�u��������I�@���҂́c�c
		//-----------------------------------------------
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_AROMA_NO2");
		ShowMsg_("DEMO_851_VS1_MSG_010");
		KeyInputWait_();
		CloseMsgWnd_();
		//===============================================
		task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");
		StartDemo(FADE_COLOR_BLACK);
		
		//===============================================
		//���A���}
		//�u<name_player/>�I
		//�@�݂Ȃ���@�ނɁ@�ɂ��݂Ȃ�������I
		//-----------------------------------------------
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_AROMA_NO2");
		ShowMsg_("DEMO_851_VS1_MSG_020");
		PlayMe_("ME_006");														// ��ME�@�t�@���t�@�[���E��
		Wait_(180);
		SetMotion_(player, MOT_WAIT, 20);										//��l���@�ҋ@
		WaitMe_();
		PlayBgm_("BG_AMBI_014");												// ��BGM�@����
		KeyInputWait_();
		CloseMsgWnd_();
		//===============================================

		SetFade_(FADE_OUT, FADE_COLOR_BLACK, 5);
		WaitFade_();
		DeleteTask_(task_cam);
		
		//��������������������������������������
		//���J�b�g�Q �m�`�������̊���f��
		//��������������������������������������
		SetPointCameraEye_("VS1_cameye000");
		SetPointCameraTarget_("VS1_camtgt000");

		SetVisible(nocho, true);												//�m�`�������\��
		SetFade_(FADE_IN, FADE_COLOR_BLACK, 5);
		WaitFade_();

		SetMotion_(nocho, nocho_down, BLEND_XL);								//�m�`��������������
		WaitMotion(nocho);
		SetMotion_(nocho, nocho_down_L, BLEND_XL);								//�m�`��������������

		//===============================================
		//���m�`������
		//�u�����ށc�c�����������������B
		//�@�܂��܂��@���O�̔w���́@�����悤��������B
		//-----------------------------------------------
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_NOCHORIN");
		ShowMsg_("DEMO_851_VS1_MSG_030");
		KeyInputWait_();
		//===============================================
		SetMotion_(nocho, nocho_talk_joy_L, BLEND_XL);							//��щ�b

		//===============================================
		//���m�`������
		//�u�ł��@���O�ɂ́@�I�C���̖ڕW�Ƃ���
		//�@���������Ăق�������@����ł���������B
		//-----------------------------------------------
		ShowMsg_("DEMO_851_VS1_MSG_040");
		KeyInputWait_();
		//===============================================
		
		//===============================================
		//���m�`������
		//�u�������I�@�������@���O�ɂ�������B
		//�@�������g���ā@�����Ƌ����Ȃ��Ă��������B
		//-----------------------------------------------
		ShowMsg_("DEMO_851_VS1_MSG_050");
		KeyInputWait_();
		CloseMsgWnd_();
		//===============================================
		SetMotion_(nocho, nocho_hand, BLEND_XL);								//�m�`��������グ
		WaitMotion(nocho);
		SetMotion_(nocho, nocho_hand_L, BLEND_XL);
		Wait_(10);
		
		//��V�v���[���g
		//����
		if ( GetEventFlg_("BFG_CHALLENGE_BATTLE_FIRSTREWARD") == false ) {		//�t���O�FBIT1173
			//===============================================
			//<name_player/>�́@�m�`����������
			//�����ӂ��n�̃f�B�X�N���@��������I
			//-----------------------------------------------
			PlaySE_("SE_SYS_011");
			OpenMsgWnd_();
			ShowMsg_("DEMO_851_VS1_MSG_060");
			KeyInputWait_();
			CloseMsgWnd_();
			//===============================================

		//�Q��ڈȍ~
		} else {
			//===============================================
			//<name_player/>�́@�m�`����������
			//�V���̃\�[�}���@��������I
			//-----------------------------------------------
			PlaySE_("SE_SYS_011");
			OpenMsgWnd_();
			ShowMsg_("DEMO_851_VS1_MSG_070");
			KeyInputWait_();
			CloseMsgWnd_();
			//===============================================
		}

		SetMotion_(nocho, MOT_TALKLOOP, BLEND_XL);								//�m�`�������̉�b���[�V����
		//===============================================
		//���m�`������
		//�u�I�C���@�܂��C�s���������I
		//�@�܂��@���O�Ɛ키�@���̓�������܂ŁI
		//-----------------------------------------------
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_NOCHORIN");
		ShowMsg_("DEMO_851_VS1_MSG_080");
		KeyInputWait_();
		CloseMsgWnd_();
		//===============================================

		SetMotion_(nocho, MOT_WAIT, BLEND_XL);									//�m�`�������̑ҋ@���[�V����
		Wait_(10);
		
		break;
		
//������������������������������������������������������������������������������������������������������������������������������
// ���`�������W�o�g��2��� VS�L���O����
//������������������������������������������������������������������������������������������������������������������������������
	case 1:
		// ���L���O
		local king = ArrangePointNpc_(ReadNpc_("n003"), "npc_VS2_king000");
		SetPointPosNoFit_(king, "npc_VS2_king000");

		local model_throne = ReadGimmick_("o_com_05");										// �ʍ�
		local throne = ArrangePointGimmick_("o_com_05", model_throne, "obj_throne000");

		// ����풓���[�V�����Ǎ�
		king_down <- ReadMotion_(king, "n003_feeldown_L");									// �L���O��������
		king_talk_motion <- ReadMotion_(king, "n003_talk");									// �L���O�ҋ@����b
		king_talk_motion_L <- ReadMotion_(king, "n003_talk_L");								// �L���O��bL
		king_motion <- ReadMotion_(king, "n003_stick_up");									// �ҋ@����f��
		king_motion_L <- ReadMotion_(king, "n003_stick_up_L");								// ��f��
		
		SetVisible(king, false);
		SetVisible(throne, false);
		SetManualCalcAlpha_(king, true);

		// ���J�����ݒ�
		SetPointCameraEye_("cameye000");
		SetPointCameraTarget_("camtgt000");

		//-------------------------------------------------------------------------
		//		�͂��܂�͂��܂�i�Q���j
		//-------------------------------------------------------------------------
		//��������������������������������������
		//���J�b�g�P ��l�������p���f��
		//��������������������������������������
		SetFadePlane_(FADE_PLANE.PLANE_3D);
		SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
		
		//===============================================
		//���A���}
		//�u��������I�@���҂́c�c
		//-----------------------------------------------
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_AROMA_NO2");
		ShowMsg_("DEMO_851_VS2_MSG_010");
		KeyInputWait_();
		CloseMsgWnd_();
		//===============================================
		task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");
		StartDemo(FADE_COLOR_BLACK);
		
		//===============================================
		//���A���}
		//�u<name_player/>�I
		//�@�݂Ȃ���@�ނɁ@�ɂ��݂Ȃ�������I
		//-----------------------------------------------
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_AROMA_NO2");
		ShowMsg_("DEMO_851_VS2_MSG_020");
		PlayMe_("ME_006");														// ��ME�@�t�@���t�@�[���E��
		Wait_(180);
		SetMotion_(player, MOT_WAIT, 20);										//��l���@�ҋ@
		WaitMe_();
		PlayBgm_("BG_AMBI_014");												// ��BGM�@����
		KeyInputWait_();
		CloseMsgWnd_();
		//===============================================

		SetFade_(FADE_OUT, FADE_COLOR_BLACK, 5);
		WaitFade_();
		DeleteTask_(task_cam);
		
		//��������������������������������������
		//���J�b�g�Q �L���O�̊���f��
		//��������������������������������������
		SetPointCameraEye_("VS2_cameye000");
		SetPointCameraTarget_("VS2_camtgt000");

		SetVisible(king, true);													//�L���O�\��
		SetVisible(throne, true);
		SetFade_(FADE_IN, FADE_COLOR_BLACK, 5);
		WaitFade_();

		SetMotion_(king, king_down, 20);										//��������

		//===============================================
		//���L���O
		//�u���������c�c�������́@<name_player/>��B
		//�@�]�ł́@�����ɂ��@����΂ʂ悤���B
		//-----------------------------------------------
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_KING");
		ShowMsg_("DEMO_851_VS2_MSG_030");
		KeyInputWait_();
		//===============================================
		SetMotion_(king, king_talk_motion, BLEND_XL);							//�L���O�̉�b���[�V����
		WaitMotion(king);
		SetMotion_(king, king_talk_motion_L, BLEND_XL);
		
		//===============================================
		//���L���O
		//�u�u�����@�]�͂��ꂵ�����B��������́@������
		//�@�������ā@�ЂƏ����@�ł����̂�����ȁB
		//-----------------------------------------------
		ShowMsg_("DEMO_851_VS2_MSG_040");
		KeyInputWait_();
		//===============================================
		
		//===============================================
		//���L���O
		//�u�����ā@�悭���@�{�C�Ő���Ă��ꂽ�B
		//�@���̗�ł���c�c������@�󂯎�邪�悢�B
		//-----------------------------------------------
		ShowMsg_("DEMO_851_VS2_MSG_050");
		KeyInputWait_();
		CloseMsgWnd_();
		//===============================================
		SetMotion_(king, king_motion, BLEND_XL);								//�L���O�̏񃂁[�V����
		WaitMotion(king);
		SetMotion_(king, king_motion_L, BLEND_XL);
		Wait_(10);
		
		//��V�v���[���g
		//����
		if ( GetEventFlg_("BFG_CHALLENGE_BATTLE_SECONDREWARD") == false ) {		//�t���O�FBIT1174
			//===============================================
			//<name_player/>�́@�L���O����
			//���y�̓V���΂��@��������I
			//-----------------------------------------------
			PlaySE_("SE_SYS_011");
			OpenMsgWnd_();
			ShowMsg_("DEMO_851_VS2_MSG_060");
			KeyInputWait_();
			CloseMsgWnd_();
			//===============================================

		//�Q��ڈȍ~
		} else {
			//===============================================
			//<name_player/>�́@�L���O����
			//�F�X�ȁ@���˂��@��������I
			//-----------------------------------------------
			PlaySE_("SE_SYS_011");
			OpenMsgWnd_();
			ShowMsg_("DEMO_851_VS2_MSG_070");
			KeyInputWait_();
			CloseMsgWnd_();
			//===============================================
		}

		SetMotion_(king, king_talk_motion, BLEND_XL);							//�L���O�̉�b���[�V����
		WaitMotion(king);
		SetMotion_(king, king_talk_motion_L, BLEND_XL);

		//===============================================
		//���L���O
		//�u�����̃o�g���́@�܂��Ɓ@�y�������̂ł������B
		//�@������@�܂��킨�����@<name_player/>��I
		//-----------------------------------------------
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_KING");
		ShowMsg_("DEMO_851_VS2_MSG_080");
		KeyInputWait_();
		CloseMsgWnd_();
		//===============================================

		SetMotion_(king, MOT_WAIT, BLEND_XL);									//�L���O�̑ҋ@���[�V����
		Wait_(10);
		
		break;
		
//������������������������������������������������������������������������������������������������������������������������������
// ���`�������W�o�g��3��� VS���i�[�e����
//������������������������������������������������������������������������������������������������������������������������������
	case 2:
		//�����i�[�e
		rena <- ArrangePointNpc_(ReadNpc_("n007"), "npc_VS3_rena000");

		// ����풓���[�V�����Ǎ�
		local rena_weaken = ReadMotion_(rena, "n007_look_down_L");				// ���ނ��ҋ@
		local rena_send = ReadMotion_(rena, "n007_show_send");					// ����
		local rena_send_L = ReadMotion_(rena, "n007_show_send_L");				// ����L
		local rena_talk = ReadMotion_(rena, "n007_talk01");						// �b��
		local rena_talk_L = ReadMotion_(rena, "n007_talk01_L");					// �b��L
		
		SetVisible(rena, false);
		SetManualCalcAlpha_(rena, true);

		// ���J�����ݒ�
		SetPointCameraEye_("cameye000");
		SetPointCameraTarget_("camtgt000");

		//-------------------------------------------------------------------------
		//		�͂��܂�͂��܂�i�R���j
		//-------------------------------------------------------------------------
		//��������������������������������������
		//���J�b�g�P ��l�������p���f��
		//��������������������������������������
		SetFadePlane_(FADE_PLANE.PLANE_3D);
		SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
		
		//===============================================
		//���A���}
		//�u��������I�@���҂́c�c
		//-----------------------------------------------
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_AROMA_NO2");
		ShowMsg_("DEMO_851_VS3_MSG_010");
		KeyInputWait_();
		CloseMsgWnd_();
		//===============================================
		task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");
		StartDemo(FADE_COLOR_BLACK);
		
		//===============================================
		//���A���}
		//�u<name_player/>�I
		//�@�݂Ȃ���@�ނɁ@�ɂ��݂Ȃ�������I
		//-----------------------------------------------
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_AROMA_NO2");
		ShowMsg_("DEMO_851_VS3_MSG_020");
		PlayMe_("ME_006");														// ��ME�@�t�@���t�@�[���E��
		Wait_(180);
		SetMotion_(player, MOT_WAIT, 20);										//��l���@�ҋ@
		WaitMe_();
		PlayBgm_("BG_AMBI_014");												// ��BGM�@����
		KeyInputWait_();
		CloseMsgWnd_();
		//===============================================

		SetFade_(FADE_OUT, FADE_COLOR_BLACK, 5);
		WaitFade_();
		DeleteTask_(task_cam);

		//��������������������������������������
		//���J�b�g�Q ���i�[�e�̊���f��
		//��������������������������������������
		SetPointCameraEye_("VS3_cameye000");
		SetPointCameraTarget_("VS3_camtgt000");
		SetMotion_(rena, rena_weaken, BLEND_N);									//���i�[�e��胂�[�V����
		SetFace_(rena, "Face_loop_close");										// �ڕ�
		SetVisible(rena, true);													//���i�[�e�\��
		Wait_(10);
		SetFade_(FADE_IN, FADE_COLOR_BLACK, 5);
		WaitFade_();

		//===============================================
		//�����i�[�e
		//�u����ς�@�������́@�܂��܂��̂悤�ˁB
		//�@�����׋����@�����Ă��������c�c�B
		//-----------------------------------------------
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_RENERTE");
		ShowMsg_("DEMO_851_VS3_MSG_030");
		KeyInputWait_();
		//===============================================
		SetFace_(rena, "Face_default");											// �ڊJ��

		SetMotion_(rena, MOT_WAIT, BLEND_XL);									//���i��b���[�V����
		//===============================================
		//�����i�[�e
		//�u����́@���́@����Ƃ������Ƃ����B
		//�@�󂯎���Ă����c�c�H
		//-----------------------------------------------
		ShowMsg_("DEMO_851_VS3_MSG_040");
		KeyInputWait_();
		CloseMsgWnd_();
		//===============================================
		SetMotion_(rena, rena_send, BLEND_XL);									//���i���郂�[�V����
		WaitMotion(rena);
		SetMotion_(rena, rena_send_L, BLEND_XL);
		Wait_(10);
		
		//��V�v���[���g
		//����
		if ( GetEventFlg_("BFG_CHALLENGE_BATTLE_THIRDREWARD") == false ) {		//�t���O�FBIT1175

			//===============================================
			//<name_player/>�́@���i�[�e����
			//�n���̈�`�q5���@��������I
			//-----------------------------------------------
			PlaySE_("SE_SYS_011");
			OpenMsgWnd_();
			ShowMsg_("DEMO_851_VS3_MSG_050");
			KeyInputWait_();
			CloseMsgWnd_();
			//===============================================


		//�Q��ڈȍ~
		} else {

			//===============================================
			//<name_player/>�́@���i�[�e����
			//�������ȃ��_�����@5�@��������I
			//-----------------------------------------------
			PlaySE_("SE_SYS_011");
			OpenMsgWnd_();
			ShowMsg_("DEMO_851_VS3_MSG_060");
			KeyInputWait_();
			CloseMsgWnd_();
			//===============================================

		}
		SetMotion_(rena, rena_talk, BLEND_XL);									//���i��b���[�V����
		WaitMotion(rena);
		SetMotion_(rena, rena_talk_L, BLEND_XL);
		//===============================================
		//�����i�[�e
		//�u���������@�����Ƌ����Ȃ�B
		//�@�����Ȃ��ā@�܂��@���Ȃ��Ɛ킢�����c�c�B
		//-----------------------------------------------
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_RENERTE");
		ShowMsg_("DEMO_851_VS3_MSG_070");
		KeyInputWait_();
		CloseMsgWnd_();
		//===============================================

		SetMotion_(rena, MOT_WAIT, BLEND_XL);									//���i�[�e�̑ҋ@���[�V����
		Wait_(10);

		break;
		
//������������������������������������������������������������������������������������������������������������������������������
// ���`�������W�o�g��4��� VS�A���Z�X����
//������������������������������������������������������������������������������������������������������������������������������
	case 3:
		//���A���Z�X
		ansesu <- ArrangePointNpc_(ReadNpc_("n036"), "npc_VS4_ansesu000");
		
		// ����풓���[�V�����Ǎ�
		local ansesu_one_knee = ReadMotion_(ansesu, "Player_one_knee");			// �㔼�g���N���������G
		local ansesu_up03_L = ReadMotion_(ansesu, "Player_one_knee_L");			// �ЕG
		local ansesu_talk = ReadMotion_(ansesu, "Player_talk");					// �b��
		local ansesu_talk_L = ReadMotion_(ansesu, "Player_talk_L");				// �b��L
		local ansesu_adieu = ReadMotion_(ansesu, "Player_get_reactor");			// ����̂΂�
		
		SetVisible(ansesu, false);
		SetManualCalcAlpha_(ansesu, true);

		// ���J�����ݒ�
		SetPointCameraEye_("cameye000");
		SetPointCameraTarget_("camtgt000");

		//-------------------------------------------------------------------------
		//		�͂��܂�͂��܂�i�S���j
		//-------------------------------------------------------------------------
		//��������������������������������������
		//���J�b�g�P ��l�������p���f��
		//��������������������������������������
		SetFadePlane_(FADE_PLANE.PLANE_3D);
		SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);

		//===============================================
		//���A���}
		//�u��������I�@���҂́c�c
		//-----------------------------------------------
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_AROMA_NO2");
		ShowMsg_("DEMO_851_VS4_MSG_010");
		KeyInputWait_();
		CloseMsgWnd_();
		//===============================================
		task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");

		StartDemo(FADE_COLOR_BLACK);

		//===============================================
		//���A���}
		//�u<name_player/>�I
		//�@�݂Ȃ���@�ނɁ@�ɂ��݂Ȃ�������I
		//-----------------------------------------------
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_AROMA_NO2");
		ShowMsg_("DEMO_851_VS4_MSG_020");
		PlayMe_("ME_006");														// ��ME�@�t�@���t�@�[���E��
		Wait_(180);
		SetMotion_(player, MOT_WAIT, 20);										//��l���@�ҋ@
		WaitMe_();
		PlayBgm_("BG_AMBI_014");												// ��BGM�@����
		KeyInputWait_();
		CloseMsgWnd_();
		//===============================================

		SetFade_(FADE_OUT, FADE_COLOR_BLACK, 5);
		WaitFade_();
		DeleteTask_(task_cam);
		//��������������������������������������
		//���J�b�g�Q �A���Z�X�̊���f��
		//��������������������������������������
//		SetPointCameraEye_("VS4_cameye000");
//		SetPointCameraTarget_("VS4_camtgt000");
		task_cam = Task_AnimeMoveCamera_("VS4_anmeye000", "VS4_anmtgt000");
		DeleteTask_(task_cam);
		
		SetVisible(ansesu, true);												//�A���Z�X�\��
		SetMotion_(ansesu, ansesu_up03_L, BLEND_N);								//�A���Z�X����L
		SetFace_(ansesu, "Face_smile");											//�Ί�
		Wait_(5);
		SetFade_(FADE_IN, FADE_COLOR_BLACK, 5);
		WaitFade_();
		Wait_(10);
		PlaySE_("SE_DEM_068");
		local efc_ansesu = SetSelectBoneEffectSetOffset_("ef732_15_holography02", ansesu, ATTACH_EFFECT2, Vec3(0.0, -10.0, 0.0));//�z���O�����o��
		SetAlpha_(ansesu, ALPHA_HALF);
		Wait_(3);
		SetAlpha_(ansesu, ALPHA_EXIST);
		//===============================================
		//���A���Z�X
		//�u�A�j�L�ł���@�I�����@���������c�c�B
		//�@���₵�������邪�c�c��낱�Ԃׂ����Ƃ��ȁB
		//-----------------------------------------------
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_ANSESU");
		ShowMsg_("DEMO_851_VS4_MSG_030");
		KeyInputWait_();
		//===============================================
		Wait_(15);
		task_cam = Task_AnimeMoveCamera_("VS4_anmeye000", "VS4_anmtgt000");
		Wait_(10);
		SetMotion_(ansesu, ansesu_one_knee, BLEND_XL);								//�A���Z�X����
		Wait_(10);
		SetMotion_(ansesu, MOT_WAIT, BLEND_L);										//�A���Z�X�ҋ@���[�V����
		Wait_(10);
		SetMotion_(ansesu, ansesu_talk, BLEND_L);									//�A���Z�X��b���[�V����
		WaitMotion(ansesu);
		SetMotion_(ansesu, ansesu_talk_L, BLEND_XL);
		
		//===============================================
		//���A���Z�X
		//�u�ŋ��̃����X�^�[�}�X�^�[�Ɓ@�Ă΂��̂�
		//�@���ꂩ��́@���O�������@�ӂ��킵���B
		//-----------------------------------------------
		ShowMsg_("DEMO_851_VS4_MSG_040");
		KeyInputWait_();
		//===============================================
		SetMotion_(ansesu, MOT_WAIT, BLEND_XL);
		
		PlaySE_("SE_DEM_068");
		local efc_ansesu = SetBoneEffect_("ef732_15_holography02", ansesu);			//�z���O�����o��
		SetAlpha_(ansesu, ALPHA_HALF);
		Wait_(3);
		SetAlpha_(ansesu, ALPHA_EXIST);
		
		//===============================================
		//���A���Z�X
		//�u�����́@�e���W�A���p�ӂ����@���ق��т��B
		//�@�Ƃ��Ă����@<name_player/>�B
		//-----------------------------------------------
		ShowMsg_("DEMO_851_VS4_MSG_050");
		KeyInputWait_();
		CloseMsgWnd_();
		//===============================================
		SetMotionSpeed_(ansesu, 0.7);
		SetMotion_(ansesu, ansesu_adieu, BLEND_XL);									//�A���Z�X���L�΂�
		WaitMotion(ansesu);
		SetMotion_(ansesu, MOT_WAIT, BLEND_XL);
		SetMotionSpeed_(ansesu, 1.0);

		Wait_(10);

		//��V�v���[���g
			//===============================================
			//<name_player/>�́@�A���Z�X����
			//�����ӂ�ɂ����@5�@��������I
			//-----------------------------------------------
			PlaySE_("SE_SYS_011");
			OpenMsgWnd_();
			ShowMsg_("DEMO_851_VS4_MSG_060");
			KeyInputWait_();
			CloseMsgWnd_();
			//===============================================
		
		SetMotion_(ansesu, MOT_TALKLOOP, BLEND_XL);									//�A���Z�X�̉�b���[�V����
		//===============================================
		//���A���Z�X
		//�u�����́@�Ȃ��Ȃ��@�y�����o�g���������B
		//�@�܂��@�����������悤���I�@�񑩂��I
		//-----------------------------------------------
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_ANSESU");
		ShowMsg_("DEMO_851_VS4_MSG_070");
		KeyInputWait_();
		CloseMsgWnd_();
		//===============================================
		SetMotion_(ansesu, MOT_WAIT, BLEND_XL);										//�A���Z�X�̑ҋ@���[�V����
		Wait_(20);
		PlaySE_("SE_DEM_068");
		local efc_ansesu = SetBoneEffect_("ef732_15_holography02", ansesu);			//�z���O�����o��
		SetAlpha_(ansesu, ALPHA_HALF);
		Wait_(3);
		SetAlpha_(ansesu, ALPHA_EXIST);
		Wait_(10);
		PlaySE_("SE_DEM_068");
		local efc_ansesu = SetBoneEffect_("ef732_15_holography02", ansesu);			//�z���O�����o��
		SetAlpha_(ansesu, ALPHA_HALF);
		Wait_(3);
		SetAlpha_(ansesu, ALPHA_CLEAR);
		Wait_(20);
		WaitTask(task_cam);
		
		break;
		
//������������������������������������������������������������������������������������������������������������������������������
// ���`�������W�o�g��5��� VS�A���}����
//������������������������������������������������������������������������������������������������������������������������������
	case 4:
		//���A���}2��
		aroma_VS <- ArrangePointNpc_(ReadNpc_("n018"), "npc_VS5_aroma000");
		
		// ����풓���[�V�����Ǎ�
		local aroma_stretch = ReadMotion_(aroma_VS, "n018_stretch");				//�L��
		local aroma_send = ReadMotion_(aroma_VS, "n018_star_seed_send");			//����
		local aroma_send_L = ReadMotion_(aroma_VS, "n018_star_seed_send_L");
		local aroma_guard_L = ReadMotion_(aroma_VS, "n018_guard_L");				//�\��
		
		SetVisible(aroma_VS, false);
		SetManualCalcAlpha_(aroma_VS, true);

		// ���J�����ݒ�
		SetPointCameraEye_("cameye000");
		SetPointCameraTarget_("camtgt000");

		//-------------------------------------------------------------------------
		//		�͂��܂�͂��܂�i�T���j
		//-------------------------------------------------------------------------
		//��������������������������������������
		//���J�b�g�P ��l�������p���f��
		//��������������������������������������
		SetFadePlane_(FADE_PLANE.PLANE_3D);
		SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);

		//===============================================
		//���A���}
		//�u��������I�@���҂́c�c
		//-----------------------------------------------
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_AROMA_NO2");
		ShowMsg_("DEMO_851_VS5_MSG_010");
		KeyInputWait_();
		CloseMsgWnd_();
		//===============================================
		task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");
		StartDemo(FADE_COLOR_BLACK);
		
		//===============================================
		//���A���}
		//�u<name_player/>�I
		//�@�݂Ȃ���@�ނɁ@�ɂ��݂Ȃ�������I
		//-----------------------------------------------
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_AROMA_NO2");
		ShowMsg_("DEMO_851_VS5_MSG_020");
		PlayMe_("ME_006");														// ��ME�@�t�@���t�@�[���E��
		Wait_(180);
		SetMotion_(player, MOT_WAIT, 20);										//��l���@�ҋ@
		WaitMe_();
		PlayBgm_("BG_AMBI_014");												// ��BGM�@����
		KeyInputWait_();
		CloseMsgWnd_();
		//===============================================

		SetFade_(FADE_OUT, FADE_COLOR_BLACK, 5);
		WaitFade_();
		DeleteTask_(task_cam);
		
		//��������������������������������������
		//���J�b�g�Q �A���}2���̊���f��
		//��������������������������������������
		SetPointCameraEye_("VS5_cameye005");
		SetPointCameraTarget_("VS5_camtgt005");

		SetVisible(aroma_VS, true);												//�A���}2���\��

		SetFade_(FADE_IN, FADE_COLOR_BLACK, 5);
		WaitFade_();
		Wait_(10);
		SetMotion_(aroma_VS, aroma_guard_L, BLEND_L);							//�A���}2���̍\��
		PlaySE_("SE_DEM_068");
		local efc_aroma = SetBoneEffect_("ef732_15_holography02", aroma_VS);	//�z���O�����o��
		SetAlpha_(aroma_VS, ALPHA_HALF);
		Wait_(3);
		SetAlpha_(aroma_VS, ALPHA_EXIST);
		Wait_(10);
		//===============================================
		//���A���}2��
		//�u�܂����@�������̂ق���
		//�@�R�e���p���Ɂ@�����Ȃ�āc�c�B
		//-----------------------------------------------
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_AROMA_NO2");
		ShowMsg_("DEMO_851_VS5_MSG_030");
		KeyInputWait_();
		//===============================================
		SetFace_(aroma_VS, "Face_smile");											//�Ί�

		SetMotion_(aroma_VS, MOT_TALK, BLEND_XL);								//�A���}2���̘b�����[�V����
		WaitMotion(aroma_VS);
		SetMotion_(aroma_VS, MOT_TALKLOOP, BLEND_N);

		//===============================================
		//���A���}2��
		//�u�����ɂ��݂����킸�@�f���Ɂ@�ق߂Ă�����B
		//�@���񂽂̋����́@�������̌v�Z�ȏゾ�����B
		//-----------------------------------------------
		ShowMsg_("DEMO_851_VS5_MSG_040");
		KeyInputWait_();
		//===============================================
		PlaySE_("SE_DEM_068");
		local efc_aroma = SetBoneEffect_("ef732_15_holography02", aroma_VS);	//�z���O�����o��
		SetAlpha_(aroma_VS, ALPHA_HALF);
		Wait_(3);
		SetAlpha_(aroma_VS, ALPHA_EXIST);
		//===============================================
		//���A���}2��
		//�u���ꂶ��@�������@���񂽂ɂ�����B
		//�@�������ɏ������@���ق��т��Ǝv���Ȃ����I
		//-----------------------------------------------
		ShowMsg_("DEMO_851_VS5_MSG_060");
		KeyInputWait_();
		CloseMsgWnd_();
		//===============================================

		SetMotion_(aroma_VS, aroma_send, BLEND_XL);								//�A���}2���̑��郂�[�V����
		WaitMotion(aroma_VS);
		SetMotion_(aroma_VS, aroma_send_L, BLEND_N);
		Wait_(10);

		//��V�v���[���g
		PlayMe_("ME_010");														// ����ME(�d�v�A�C�e���擾�Ɠ���Redmine#2831)
			//===============================================
			//<name_player/>�́@�A���}�Q������
			//�T���`�����@��������I
			//-----------------------------------------------
			OpenMsgWnd_();
			ShowMsg_("DEMO_851_VS5_MSG_070");
			WaitMe_();
			KeyInputWait_();
			CloseMsgWnd_();
			//===============================================

		SetMotion_(aroma_VS, MOT_TALK, BLEND_XL);								//�A���}2���̘b�����[�V����
		WaitMotion(aroma_VS);
		SetMotion_(aroma_VS, MOT_TALKLOOP, BLEND_N);

		//===============================================
		//���A���}2��
		//�u�v���Ԃ�Ɂ@������Ɓ@�͂��Ⴂ���������B
		//�@�܂��@��肽����ˁ@���������o�g�����B
		//-----------------------------------------------
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_AROMA_NO2");
		ShowMsg_("DEMO_851_VS5_MSG_080");
		KeyInputWait_();
		CloseMsgWnd_();
		//===============================================
		SetMotion_(aroma_VS, MOT_WAIT, BLEND_XL);								//�ҋ@���[�V����
		PlaySE_("SE_DEM_068");
		local efc_aroma = SetBoneEffect_("ef732_15_holography02", aroma_VS);	//�z���O�����o��
		SetAlpha_(aroma_VS, ALPHA_HALF);
		Wait_(3);
		SetAlpha_(aroma_VS, ALPHA_EXIST);
		Wait_(10);
		PlaySE_("SE_DEM_068");
		local efc_aroma = SetBoneEffect_("ef732_15_holography02", aroma_VS);			//�z���O�����o��
		SetAlpha_(aroma_VS, ALPHA_HALF);
		Wait_(3);
		SetAlpha_(aroma_VS, ALPHA_CLEAR);
		Wait_(20);
		
		break;
//������������������������������������������������������������������������������������������������������������������������������

	default:
		DebugPrint("�z�肵�Ă��Ȃ��`�������W�o�g���̉��ł��B");
		break;
	}

	StopBgm_(BGM_STOP_DEF);

	DeleteAllTask_();

	EndDemo(FADE_COLOR_BLACK, FADE_DEF);

}



