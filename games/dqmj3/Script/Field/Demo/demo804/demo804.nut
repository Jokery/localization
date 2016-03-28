//=============================================
//
//		demo804[�A���}�ƃL���O����]
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
	local task_cam, task_player, task_aroma, task_king;
	local task_aroma_step;
	local efc_king;
	
// ���t���O�ݒ�
	local bit_game_over = GetEventFlg_("BFG_CHECK_SAME_TIME_DEAD_AND_DEMO_1");		// Bit_1087 �S�ŕ��A��Demo804[�A���}�ƃL���O����]���d�Ȃ������ɗ��Ă�t���O
	
// �����\�[�X�Ǎ�
	// �M�~�b�N
	local model_elevator = ReadGimmick_("o_A01_00");						// �G���x�[�^�[��
	local model_mixture = ReadGimmick_("o_A01_02");							// �z�����u
	// �L�����N�^�[
	local player = GetPlayerId_();
	local model_aroma = ReadNpc_("n018");									// �A���}
	local model_king = ReadNpc_("n003");									// �L���O
	local model_jack = ReadNpc_("n001");									// �W���b�N
	local model_queen = ReadNpc_("n005");									// �N�C�[��
	// �G�t�F�N�g
	LoadEffect_("ef712_10_emo_surprise01");									// �u�I�v

// ���z�u
	SetPointPos_(player, "player000");
	local aroma = ArrangePointNpc_(model_aroma, "npc_aroma000");
	SetStepSe_(aroma, SILENT_STEP_SE);
	local king = ArrangePointNpc_(model_king, "npc_king000");
	local queen = ArrangePointNpc_(model_queen, "npc_queen000");
	local jack = ArrangePointNpc_(model_jack, "npc_jack000");

	// �G���x�[�^�[���i���j
	local elevator_left = ArrangePointGimmick_("o_A01_00", model_elevator, "obj_elevator000");
	// �G���x�[�^�[���i�E�j
	local elevator_right = ArrangePointGimmick_("o_A01_00", model_elevator, "obj_elevator100");
	// �z�����u
	local mixture = ArrangePointGimmick_("o_A01_02", model_mixture, "obj_mixture000");
	SetMotion_(mixture, MOT_GIMMICK_2, BLEND_N);

// ����풓���[�V�����Ǎ�
	// ��l��
	local look_left_L = ReadMotion_(player, "Player_look_left_L");			// ���������������
	local player_nod = ReadMotion_(player, "Player_nod");					// ����
	// �L���O
	local king_talk = ReadMotion_(king, "n003_talk");						// �ҋ@����b
	local king_talk_L = ReadMotion_(king, "n003_talk_L");					// ��bL
	local king_surprise = ReadMotion_(king, "n003_surprise");				// �ҋ@������
	local king_surprise_L = ReadMotion_(king, "n003_surprise_L");			// ����L
	local king_think = ReadMotion_(king, "n003_think");						// �ҋ@���l����
	local king_think_L = ReadMotion_(king, "n003_think_L");					// �l����L
	local king_nod = ReadMotion_(king, "n003_nod");							// ����
	// �A���}
	local aroma_look_right_L = ReadMotion_(aroma, "n018_look_right_L");		// �E�����ҋ@L

	
//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------

	// ���������������������������������y�S�ŕ��A�Ɣ�����ꍇ�z��������������������������������
	if(bit_game_over)
	{
		//��������������������������������������
		//���J�b�g�P�@��l���ƃA���}�ƃL���O�i��@�A���}�̕����V�[�����J�b�g�j
		//��������������������������������������
		SetPointCameraEye_("cameye001");
		SetPointCameraTarget_("camtgt001");

		StartDemo(FADE_COLOR_BLACK);
		Wait_(20);
		//===============================================
		//���L���O
		//�u�������I�@<name_player/>���I
		//�@�����́@�ǂ������H�@���p�ł��邩�H
		//-----------------------------------------------
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_KING");
		ShowMsg_("DEMO_804_MSG_010");
		KeyInputWait_();
		CloseMsgWnd_();
		//===============================================

		SetMotion_(king, MOT_WAIT, BLEND_XL);									// �L���O�@�ҋ@
		Wait_(10);
		SetMotion_(aroma, MOT_TALK, BLEND_L);									// �A���}�@��b

		//===============================================
		//���A���}
		//�u�L���O�@�v���Ԃ�I
		//�@���ς�炸�@�ł�������ˁ@�A���^�B
		//-----------------------------------------------
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_AROMA");
		ShowMsg_("DEMO_804_MSG_020");
		WaitMotion(aroma);
		SetMotion_(aroma, MOT_TALKLOOP, BLEND_L);								// �A���}�@��bL
		KeyInputWait_();
		CloseMsgWnd_();
		//===============================================

		Wait_(5);
	}
	// ���������������������������������y�S�ł��Ă��Ȃ��ꍇ�z��������������������������������������
	else
	{
		//��������������������������������������
		//���J�b�gelse�P�@��l���ƃA���}�@��l���s���J�����A�E�g�@��l�̎΂ߑO��
		//��������������������������������������

		// ���������[�V�����ݒ�
		SetMotion_(player, MOT_WALK, BLEND_N);									// ��l���@����
		SetMotionSpeed_(player, 1.1);
		SetMotion_(aroma, MOT_WALK, BLEND_N);									// �A���}�@����
		task_player = Task_AnimeMove_(player, "anm_player000");
		task_aroma = Task_AnimeMove_(aroma, "anm_aroma000");
		task_aroma_step = Task_PlaySe_("SE_FLD_016", 15);
			
		// ���J�����ݒ�
		SetPointCameraEye_("cameye000");
		SetPointCameraTarget_("camtgt000");

		StartDemo(FADE_COLOR_BLACK);

		Wait_(49);
		DeleteTask_(task_player);
		DeleteTask_(task_aroma);
		SetMotion_(aroma, MOT_WAIT, BLEND_N);		// �A���}�@�����ɍ��킹�邽�߁A���[�V�������Đ����Ȃ���


		//��������������������������������������
		//���J�b�gelse�Q�@��l���ƃA���}�ƃL���O���̑��@��l���s���J�����C����ɑҋ@�@�L���O�̍����΂߉��O��������
		//��������������������������������������

		SetPointCameraEye_("cameye001");
		SetPointCameraTarget_("camtgt001");

		SetMotion_(aroma, MOT_WALK, BLEND_N);
		task_aroma = Task_AnimeMove_(aroma, "anm_aroma001");
		Wait_(10);
		task_player = Task_AnimeMove_(player, "anm_player001");
		WaitTask(task_aroma);
		DeleteTask_(task_aroma_step);
		SetMotion_(aroma, MOT_WAIT, BLEND_M);										// �A���}�@�ҋ@
		WaitTask(task_player);
		SetMotion_(player, MOT_WAIT, BLEND_M);										// ��l���@�ҋ@
		SetMotionSpeed_(player, 1.0);

		SetMotion_(king, king_talk, BLEND_XL);									// �L���O�@�ҋ@����b
		WaitMotion(king);
		SetMotion_(king, king_talk_L, BLEND_XL);								// �L���O�@��b

		//===============================================
		//���L���O
		//�u�������I�@<name_player/>���I
		//�@�����́@�ǂ������H�@���p�ł��邩�H
		//-----------------------------------------------
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_KING");
		ShowMsg_("DEMO_804_MSG_010");
		KeyInputWait_();
		CloseMsgWnd_();
		//===============================================

		SetMotion_(king, MOT_WAIT, BLEND_XL);									// �L���O�@�ҋ@
		Wait_(10);
		SetMotion_(aroma, MOT_TALK, BLEND_L);									// �A���}�@��b

		//===============================================
		//���A���}
		//�u�L���O�@�v���Ԃ�I
		//�@���ς�炸�@�ł�������ˁ@�A���^�B
		//-----------------------------------------------
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_AROMA");
		ShowMsg_("DEMO_804_MSG_020");
		WaitMotion(aroma);
		SetMotion_(aroma, MOT_TALKLOOP, BLEND_L);								// �A���}�@��bL
		KeyInputWait_();
		CloseMsgWnd_();
		//===============================================

		Wait_(5);
	}

	//��������������������������������������
	//���J�b�g�R�@�L���O�@��b�������@�L���O�A�b�v
	//��������������������������������������

	SetPointCameraEye_("cameye002");
	SetPointCameraTarget_("camtgt002");

	SetMotion_(aroma, MOT_WAIT, BLEND_L);									// �A���}�@�ҋ@
	SetMotion_(king, king_talk, BLEND_XL);									// �L���O�@��b
	WaitMotion(king);
	SetMotion_(king, king_talk_L, BLEND_XL);								// �L���O�@��bL

	//===============================================
	//���L���O
	//�u�����Ȃ�@����Ȑl�Ԃ̖��ł���ȁI
	//�@���c�c����@�l�Ԃ��I�H
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_KING");
	ShowMsg_("DEMO_804_MSG_030");
	Wait_(25);
	efc_king = SetSelectBoneEffectSetOffset_("ef712_10_emo_surprise01", king, ATTACH_EFFECT1,  Vec3(1, -8.0, 12));
	SetEffectScale_(efc_king, 1.5);
	PlaySE_("SE_DEM_053");
	SetMotion_(king, king_surprise, BLEND_XL);								// �L���O�@����
	WaitMotion(king);
	SetMotion_(king, king_surprise_L, BLEND_XL);							// �L���O�@����L
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================


	//��������������������������������������
	//���J�b�g�S�@�A���}�@��b�@�A���}�A�b�v
	//��������������������������������������

	SetPointCameraEye_("cameye003");
	SetPointCameraTarget_("camtgt003");

	SetVisible(player, false);
	SetMotion_(aroma, MOT_TALK, BLEND_L);									// �A���}�@��b
	SetFace_(aroma, "Face_smile");
	//===============================================
	//���A���}
	//�u�������c�c���̎p�Ł@��̂́@���߂Ă������B
	//�@�A�^�V�̓��L���搶�̏���c�c�A���}��I
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_AROMA");
	ShowMsg_("DEMO_804_MSG_040");
	WaitMotion(aroma);
	SetMotion_(aroma, MOT_TALKLOOP, BLEND_L);								// �A���}�@��bL
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	SetMotion_(aroma, MOT_WAIT, BLEND_XL);									// �A���}�@�ҋ@
	Wait_(30);
	SetVisible(player, true);


	//��������������������������������������
	//���J�b�g�T�@��l���ƃA���}�ƃL���O���̑�
	//��������������������������������������

	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");

	SetVisible(queen, false);
	SetMotion_(king, king_surprise, BLEND_XL);								// �L���O�@����
	WaitMotion(king);
	SetMotion_(king, king_surprise_L, BLEND_XL);							// �L���O�@����L
	//===============================================
	//���L���O
	//�u�Ȃ�Ɓ@���L���̏���ƂȁI�H
	//�@�ł́@���L���{�l�́@�ǂ��ɁI�H
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_KING");
	ShowMsg_("DEMO_804_MSG_050");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	SetMotion_(king, MOT_WAIT, BLEND_XL);									// �L���O�@�ҋ@
	Wait_(8);
	SetMotion_(aroma, MOT_TALK, BLEND_L);									// �A���}�@��b

	//===============================================
	//���A���}
	//�u���I�@���c�c����́c�c�B�@��
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_AROMA");
	ShowMsg_("DEMO_804_MSG_060");
	WaitMotion(aroma);
	SetMotion_(aroma, MOT_TALKLOOP, BLEND_L);								// �A���}�@��bL
	KeyInputWait_();
	//===============================================

	//===============================================
	//���A���}
	//�u�c�c�搶�́@������Ɖ����Ƃ���ɂˁB
	//�@������@�L���O�Ɂ@���肢������̂����ǁB�@��
	//-----------------------------------------------
	ShowMsg_("DEMO_804_MSG_070");
	KeyInputWait_();
	//===============================================

	//===============================================
	//���A���}
	//�u������Ɓ@�n����݂��ė~�����̂�B
	//�@�f�B�X�N�V�X�e���̂���@�n���P�K���ˁB
	//-----------------------------------------------
	ShowMsg_("DEMO_804_MSG_080");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	SetMotion_(aroma, MOT_WAIT, BLEND_XL);									// �A���}�@�ҋ@
	Wait_(30);
	DeleteTask_(task_cam);


	//��������������������������������������
	//���J�b�g�U�@�L���O�@��b�@�L���O�A�b�v
	//��������������������������������������

	SetPointCameraEye_("cameye002");
	SetPointCameraTarget_("camtgt002");

	SetVisible(queen, true);
	SetMotion_(king, king_think, BLEND_XL);									// �L���O�@�l����

	//===============================================
	//���L���O
	//�u�ق��@�n���P�K�ƂȁH
	//�@�ʂɂ��܂�ʂ��c�c�Ȃ�̂��߂ɂł��邩�H
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_KING");
	ShowMsg_("DEMO_804_MSG_090");
	WaitMotion(king);
	SetMotion_(king, king_think_L, BLEND_XL);								// �L���O�@�l����L
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	SetMotion_(king, MOT_WAIT, 20);											// �L���O�@�ҋ@
	Wait_(35);


	//��������������������������������������
	//���J�b�g�V�@��l���ƃA���}�@��l���������@�΂ߑO��
	//��������������������������������������
	SetFace_(aroma, "Face_default");

	SetPointCameraEye_("cameye004");
	SetPointCameraTarget_("camtgt004");

	Wait_(10);
	SetMotion_(aroma, aroma_look_right_L, BLEND_XL);						// �A���}�@ �E�����ҋ@L
	Wait_(15);
	SetMotion_(player, look_left_L, BLEND_XL);								// ��l���@���������������
	SetFace_(player, "Face_left");
	Wait_(40);

	//===============================================
	//���A���}
	//�u�ނ̂��߁c�c�����ā@���i�[�e�̂��߂�B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_AROMA");
	ShowMsg_("DEMO_804_MSG_100");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	SetMotion_(aroma, MOT_WAIT, BLEND_XL);									// �A���}�@�ҋ@
	Wait_(55);


	//��������������������������������������
	//���J�b�g�W�@��l���ƃA���}�ƃL���O���̑��@�������Z���t��ɏ�グ�@�L���O�̍����΂߉��O��������
	//��������������������������������������

	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");

	SetMotion_(player, MOT_WAIT, BLEND_N);									// ��l���@�ҋ@
	SetFace_(player, "Face_default");
	SetMotion_(king, king_nod, BLEND_XL);									// �L���O�@����

	//===============================================
	//���L���O
	//�u�ӂށc�c��炪�F�̂��߂Ȃ��
	//�@���ޗ��R�͂Ȃ��B�D���ɂ��邪�悢�B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_KING");
	ShowMsg_("DEMO_804_MSG_110");
	WaitMotion(king);
	SetMotion_(king, MOT_WAIT, 20);											// �L���O�@�ҋ@
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	Wait_(25);

	//��������������������������������������
	//���J�b�g�X�@��l���ƃA���}�@��l���������@�΂ߑO��
	//��������������������������������������

	SetPointCameraEye_("cameye004");
	SetPointCameraTarget_("camtgt004");

	SetDir_(player, 255);
	Wait_(5);
	SetMotion_(aroma, aroma_look_right_L, BLEND_XL);						// �A���}�@�E�����ҋ@L
	Wait_(16);

	//===============================================
	//���A���}
	//�u�������@<name_player/>�H
	//�@���ꂶ��@�����@�n���P�K�ɍs�����I
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_AROMA");
	ShowMsg_("DEMO_804_MSG_120");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	SetMotion_(player, player_nod, BLEND_L);								// ��l���@����
	WaitMotion(player);
	SetMotion_(player, MOT_WAIT, BLEND_M);									// ��l���@�ҋ@
	Wait_(25);


	EndDemo(FADE_COLOR_BLACK);
}