//=============================================
//
//		demo007[�����X�^�[�I��p�̎���]
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
	local task_cam;

// �����\�[�X�Ǎ�
	// �M�~�b�N
	local model_breakfast = ReadGimmick_("o_E00_01");	// ���H
	// �L�����N�^�[
	local player = GetPlayerId_();					// ��l��
	local model_santyo = ReadNpc_("n011");			// �T���`��

// ���z�u
	// ���H
	local breakfast = ArrangePointGimmick_("o_E00_01", model_breakfast, "obj_breakfast000");
	// ��l��
	SetPointPosNoFit_(player, "player000");
	// �T���`��
	local santyo = ArrangePointNpc_(model_santyo, "npc_santyo000");
	SetScaleSilhouette(santyo, SCALE.SANCHO, SILHOUETTE_WIDTH.SANCHO);
	SetActive_(santyo, false);

// ����풓���[�V�����Ǎ�
	// ��l��
	local player_sit_L = ReadMotion_(player, "Player_sit_L");			// ����L
	local player_sit02 = ReadMotion_(player, "Player_sit02");			// ���遨����i�T���`��������j
	local player_sit02_L = ReadMotion_(player, "Player_sit02_L");		// ����i�T���`��������jL
	
	// �T���`��
	local santyo_bow = ReadMotion_(santyo, "n011_bow");					// ������

// �����[�V�����ݒ�
	SetMotion_(breakfast, MOT_GIMMICK_1, BLEND_N);						// �H�ׂ���(MOT_GIMMICK_1)
	SetMotion_(player, player_sit_L, BLEND_N);
	
// ���J�����ݒ�
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");

//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------

	SetFadePlane_(FADE_PLANE.PLANE_3D);
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 1);

	Wait_(30);

	//===============================================
	// ���V�X�e�����b�Z�[�W
	// ����l���̖��O���́@�o���ꂽ���H���@�H�ׂ��B�@
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_007_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	Wait_(30);

	StartDemo(FADE_COLOR_BLACK);
	
	Wait_(60);
	
	SetPointPosNoFit_(player, "player001");
	
	//��������������������������������������
	//���J�b�g�Q
	//��������������������������������������
	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");
	
	SetActive_(santyo, true);
	
	SetMotion_(santyo, MOT_TALK, BLEND_N);
	SetMotion_(player, player_sit02, BLEND_M);		// ���遨����i�T���`��������j
	Wait_(21);
	SetMotion_(player, player_sit02_L, BLEND_M);	// ����i�T���`��������jL
	Wait_(7);
	SetMotion_(santyo, MOT_TALKLOOP, BLEND_M);
	
	//===============================================
	// ���T���`��
	// �u�ق�ڂꂷ��@�H�ׂ��Ղ�f�V�^�I
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_SANCHO");
	ShowMsg_("DEMO_007_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	
	Wait_(10);
	//��������������������������������������
	//���J�b�g�R
	//��������������������������������������
	SetPointCameraEye_("cameye002");
	SetPointCameraTarget_("camtgt002");
	
	SetPointPos_(santyo, "npc_santyo001");
	
	//-----------------------------------------------
	// ��
	// �u�Ƃ���Ł@����l���܁B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_SANCHO");
	ShowMsg_("DEMO_007_MSG_030");
	KeyInputWait_();
	
	//-----------------------------------------------
	// ��
	// �u�������@���V�C���@��낵���悤�f�X�B
	//-----------------------------------------------
	ShowMsg_("DEMO_007_MSG_040");
	KeyInputWait_();
	
	while(true)
	{
		// �y�͂��̏ꍇ�F�P�z
		if (GetQueryResult_() == QUERY2_0) {
			//-----------------------------------------------
			// ��
			// �u�ł́@����ւǂ����B
			//-----------------------------------------------
			ShowMsg_("DEMO_007_MSG_050");
			KeyInputWait_();
			
			SetNumFlg_("NUM_CHANGE_FIRST_MONSTER", PURIZUNYAN);			// �v���Y�j����
			
			break;
		}
		
		//-----------------------------------------------
		// ��
		// �u�ł�����@���{��ǂ܂�}�X�J�H
		//-----------------------------------------------
		ShowMsg_("DEMO_007_MSG_060");
		KeyInputWait_();
		
		// �y�͂��̏ꍇ�F�Q�z
		if (GetQueryResult_() == QUERY2_0) {
			//-----------------------------------------------
			// ��
			// �u�������܂�}�V�^�B
			//-----------------------------------------------
			ShowMsg_("DEMO_007_MSG_070");
			KeyInputWait_();
			
			//-----------------------------------------------
			// ��
			// �u����܂ł́@������Ɓ@�������������T�C�B
			//-----------------------------------------------
			ShowMsg_("DEMO_007_MSG_080");
			KeyInputWait_();
			
			SetNumFlg_("NUM_CHANGE_FIRST_MONSTER", FONDHU);			// �t�H���f��
			
			break;
		}
		
		//-----------------------------------------------
		// ��
		// �u�Ȃ�΁@����Ɂ@�o���ẮH 
		//-----------------------------------------------
		ShowMsg_("DEMO_007_MSG_090");
		KeyInputWait_();
		
		// �y�͂��̏ꍇ�F�R�z
		if (GetQueryResult_() == QUERY2_0) {
			//-----------------------------------------------
			// ��
			// �u�킩��܂����@����ւǂ����B
			//-----------------------------------------------
			ShowMsg_("DEMO_007_MSG_100");
			KeyInputWait_();
			
			//-----------------------------------------------
			// ��
			// �u������䂭�܂Ł@��������
			//-----------------------------------------------
			ShowMsg_("DEMO_007_MSG_110");
			KeyInputWait_();
			//-----------------------------------------------
			
			SetNumFlg_("NUM_CHANGE_FIRST_MONSTER", DORAKI);			// �h���L�[
			
			break;
		}
		
		//-----------------------------------------------
		// ��
		// �u����ł́@�䂩���ȁ@�����X�^�[������
		//-----------------------------------------------
		ShowMsg_("DEMO_007_MSG_120");
		KeyInputWait_();
		
		// �y�͂��̏ꍇ�F11�z
		if (GetQueryResult_() == QUERY2_0) {
			//-----------------------------------------------
			// ��
			// �u�͂��I�@�X���C�����@���[�������@�Ƃ̊O��
			//-----------------------------------------------
			ShowMsg_("DEMO_007_MSG_130");
			KeyInputWait_();
			//-----------------------------------------------
			
			SetNumFlg_("NUM_CHANGE_FIRST_MONSTER", NASUBINARA);		// �i�X�r�i�[��
			
			break;
		}
		
		//-----------------------------------------------
		// ��
		// �u�����ł����c�c�킩��}�V�^�B
		//-----------------------------------------------
		ShowMsg_("DEMO_007_MSG_140");
		KeyInputWait_();
		
		//-----------------------------------------------
		// ��
		// �u����ł́@����ς�@�����
		//-----------------------------------------------
		ShowMsg_("DEMO_007_MSG_150");
		KeyInputWait_();
	}
	
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");		// 80F
	
	
	
//	SetMotion_(santyo, MOT_TALK, BLEND_M);
//	Wait_(28);
	SetMotion_(santyo, MOT_TALKLOOP, BLEND_M);

	//-----------------------------------------------
	// ��
	// �u����ł́@�������@�悢�P�����B
	//-----------------------------------------------
	ShowMsg_("DEMO_007_MSG_160");
	KeyInputWait_();
	
	//-----------------------------------------------
	// ��
	// �u�����͊y���c�c���S�Ł@�₳�������E�B
	//-----------------------------------------------
	ShowMsg_("DEMO_007_MSG_170");
	KeyInputWait_();
	
	//-----------------------------------------------
	// ��
	// �u�����ā@�ǂ�Ȃ��Ƃł��@����l���܂̎��R�B
	//-----------------------------------------------
	ShowMsg_("DEMO_007_MSG_180");
	KeyInputWait_();
	
	//-----------------------------------------------
	// ��
	// �u�����@�ł���̂��@�m���߂����̂ł�����
	//-----------------------------------------------
	ShowMsg_("DEMO_007_MSG_190");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetMotion_(santyo, santyo_bow, BLEND_XL);
	WaitMotion(santyo);
	
	SetMotion_(santyo, MOT_WAIT, BLEND_XL);
	
	Wait_(15);

	WaitTask(task_cam);

	EndDemo(FADE_COLOR_BLACK);
}
