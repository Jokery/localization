//=============================================
//
//		demo404[�݂����͎�l��]
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
	local task_cam, task_player, task_boy, task_mother;
	local efc_boy;
	
// �����\�[�X�Ǎ�
	// �L�����N�^�[
	local player	 = GetPlayerId_();					// ��l��
	local n_boy		 = ReadNpc_("m127_01");				// �X�p�C�N�w�b�h�i�q���j
	local n_mother	 = ReadNpc_("m127_01");			// �X�p�C�N�w�b�h�i��e�j
	local c_tokusyu	 = ReadNpc_("m127_01");			// �X�p�C�N�w�b�h�i�L�O���~�j
	local n_kigurumi = ReadNpc_("n027");			// �X�p�C�N�w�b�h�i�L�O���~�j
	local g_box		 = ReadGimmick_("o_S01_02");			// �͂�

	LoadEffect_("ef712_13_emo_sweat01");			// ��

// ���z�u
	// ��l��
	SetPointPos_(player, "player000");

	// �q��
	local npc_boy = ArrangePointNpc_(n_boy, "npc_boy000");
	SetScaleSilhouette(npc_boy, 0.35, 0.45);

	// ��e
	local npc_mother = ArrangePointNpc_(n_mother, "npc_mother000");
	SetScaleSilhouette(npc_mother, 0.52, 0.4);

	// �L�O���~
	local npc_kigurumi = ArrangePointNpc_(n_kigurumi, "player000");
	SetScaleSilhouette(npc_kigurumi, 0.6, 0.4);

	// �J����������p
	local cam_tokusyu = ArrangePointNpc_(c_tokusyu, "cam_tokusyu");

	// �͂�
	local gmc_box = ArrangePointGimmick_("o_S01_02", g_box, "npc_box000");

// ����풓���[�V�����Ǎ�

	// �q���p���[�V����
	local feel_down_b	= ReadMotion_(npc_boy,		 "m127_01_feel_down_L");	// ��������L
	local irritated_b	= ReadMotion_(npc_boy,		 "m127_01_irritated_L");	// �ł�L
	local talk_b		= ReadMotion_(npc_boy,		 "m127_01_talk_L");			// ��bL

	// ��e�p���[�V����
	local impressed_m	= ReadMotion_(npc_mother,	 "m127_01_impressed_L");	// ����L
	local talk_m		= ReadMotion_(npc_mother,	 "m127_01_talk_L");			// ��bL
	local wear		= ReadMotion_(npc_kigurumi,	 "m127_01_wear_check_L");			// �L�O���~�`�F�b�N
	local hero_wait_L = ReadMotion_(npc_kigurumi,	 "m127_01_hero_wait_L");			// �L�O���~�ҋ@	

//	�������ݒ�
	SetMotion_(npc_boy,		 feel_down_b, 1);									// �������ݏ�Ԃ���X�^�[�g
	SetMotion_(npc_kigurumi, hero_wait_L, 1);									// �L�O���~�ҋ@

	SetStepSe_(npc_boy, SILENT_STEP_SE);										// �����Ɖ�������Ȃ��̂ő���OFF

	SetVisible(npc_kigurumi, false);											// �L�O���~���\���ɂ���
	SetVisible(cam_tokusyu,	 false);											// �J�����p���\���ɂ���

// ���J�����ݒ�
	SetPointCameraEye_("000_cameye");											// �J�����A�C���������W�ɐݒ�
	SetPointCameraTarget_("000_camtgt");										// �J�����^�[�Q�b�g���������W�ɐݒ�
	local task_kaiwa = Task_RotateToPos_(npc_boy, GetPos_(player), 100);		// ��l���̕�������
	local task_kaiwa = Task_RotateToPos_(player, GetPos_(npc_mother), 100);		// ��e�̕���������l��
	SetMotion_(npc_mother,	 impressed_m, BLEND_N);								// ��l���̎��ȋ]���Ɋ��������

//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);

	//===============================================
	// *��e
	// �u�����c�c�_���܁B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_BOYS_MOTHER");
	ShowMsg_("DEMO_404_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	// ���������Ƃ���������čs���ꂻ���ɂȂ��ďł�q��
	efc_boy = SetSelectBoneEffect_("ef712_13_emo_sweat01", npc_boy, ATTACH_EFFECT1);	// ��
	SetEffectScale_(efc_boy, 3.0);														// ���X�P�[��

	task_boy = Task_AnimeMove_(npc_boy, "anm_boy000");									// �q���ړ�
	SetMotion_(npc_boy,	 MOT_WALK, BLEND_M);											// �������[�V����
	
	//===============================================
	// *���N
	// �u����c�c������Ƒ҂��āI
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_MONSTER_BOY");
	ShowMsg_("DEMO_404_MSG_020");

	Wait_(10);																			// �ړ��҂�
	SetMotion_(npc_boy, talk_b, BLEND_L);												// ��b���[�V�����őҋ@
	
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	SetPointCameraEye_("001_cmreye");													// �J�����A�C���������W�ɐݒ�
	SetPointCameraTarget_("001_cmrtgt");												// �J�����^�[�Q�b�g���������W�ɐݒ�
	local task_kaiwa = Task_RotateToPos_(player, GetPos_(cam_tokusyu), 100.0);			// �J�����̕���������l��
	InitSilhouetteWidth_(npc_boy, 0.7);
	//===============================================
	
	//===============================================
	// *���N
	// �u���L���Ɓ@������̂Ȃ�
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_MONSTER_BOY");
	ShowMsg_("DEMO_404_MSG_030");
	KeyInputWait_();
	//===============================================

	DeleteEffect_(efc_boy);	

	//===============================================
	// *���N
	// �u�ł��@���̊i�D����@������
	//-----------------------------------------------
	ShowMsg_("DEMO_404_MSG_040");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	task_cam = Task_AnimeMoveCamera_("000_anmeye", "000_anmtgt");					// �J��������������
	SetVisible(npc_boy,			 false);											// ��l�����\���ɂ���
	WaitTask(task_cam);
	
	Wait_(30);
	SetVisible(player,			 false);											// ��l�����\���ɂ���
	SetVisible(npc_boy,			 true);												// ��l�����\���ɂ���
	
	local task_kaiwa = Task_RotateToPos_(player, GetPos_(npc_mother), 5);			// ��e�̕���������l��
	task_cam = Task_AnimeMoveCamera_("001_anmeye", "001_anmtgt");					// �J�������������ƃY�[��
	InitSilhouetteWidth_(npc_boy, 1.4);

	local task_kaiwa = Task_RotateToPos_(npc_mother, GetPos_(npc_boy), 5);			// �q���̕���������e
	SetMotion_(npc_mother, talk_m, BLEND_L);										// ��b
	SetMotion_(npc_boy, MOT_WAIT, BLEND_M);											// �ҋ@
	
	//===============================================
	// *��e
	// �u��������@���̎���@�g���܂��傤�B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_BOYS_MOTHER");
	ShowMsg_("DEMO_404_MSG_050");

	WaitTask(task_kaiwa);															// �U������҂�

	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	SetMotion_(npc_boy, talk_b, BLEND_M);											// ��b
	SetMotion_(npc_mother, MOT_WAIT, BLEND_M);										// �ҋ@
	task_kaiwa = Task_RotateToPos_(npc_boy, GetPos_(npc_mother), 10);				// ��e�̕��������q��
	SetMotion_(npc_boy, MOT_WALK, BLEND_M);
	//===============================================
	// *���N
	// �u���������ā@�L�O���~�����́H
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_MONSTER_BOY");
	ShowMsg_("DEMO_404_MSG_060");
	WaitTask(task_kaiwa);
	SetMotion_(npc_boy, MOT_WAIT, BLEND_M);
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	DeleteTask_(task_cam);															// �U������҂�
	SetMotion_(npc_mother, talk_m, BLEND_M);										// ��b
	SetMotion_(npc_boy, MOT_WAIT, BLEND_M);											// �ҋ@

	SetPointCameraEye_("000_cameye");												// �J�����A�C���������W�ɐݒ�
	SetPointCameraTarget_("000_camtgt");											// �J�����^�[�Q�b�g���������W�ɐݒ�

	SetVisible(player,			 true);												// ��l�����\���ɂ���
	task_kaiwa = Task_RotateToPos_(npc_mother, GetPos_(player), 6.0);				// ��l���̕�������
	SetMotion_(npc_mother, MOT_WALK, BLEND_M);

	task_kaiwa = Task_RotateToPos_(npc_boy, GetPos_(player), 5.0);					// ��l���̕�������
	SetMotion_(npc_boy, MOT_WALK, BLEND_M);

	WaitTask(task_kaiwa);
	SetMotion_(npc_mother, talk_m, BLEND_XL);										// ��b
	SetMotion_(npc_boy, MOT_WAIT, BLEND_M);
	
	//===============================================
	// *��e
	// �u���v�ł���@����l���̖��O������B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_BOYS_MOTHER");
	ShowMsg_("DEMO_404_MSG_070");
	KeyInputWait_();
	//===============================================
	
	//===============================================
	// *��e
	// �u���������@�҂��Ă��Ă��������ˁB
	//-----------------------------------------------
	ShowMsg_("DEMO_404_MSG_080");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 30);
	Wait_(30);
	
	PlaySE_("SE_DEM_076");
	Wait_(30);

	Wait_(30);

	Wait_(30);
	
	SetVisible(player,			 false);											// ��l�����\���ɂ���
	SetVisible(npc_boy,			 false);											// �q�����\���ɂ���
	SetVisible(npc_mother,		 false);											// ��e���\���ɂ���
	SetVisible(npc_kigurumi,	 true);												// �L�O���~��\������
	local task_kaiwa = Task_RotateToPos_(npc_kigurumi, GetPos_(cam_tokusyu), 10);	// �J�����̕��������L�O���~

	SetFade_(FADE_IN, FADE_COLOR_BLACK, 30);
	task_cam = Task_AnimeMoveCamera_("003_anmeye", "003_anmtgt");					// �J�������������ƃY�[��
	Wait_(60);

	//===============================================
	// *��e
	// �u�c�c�ł��܂����I
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_BOYS_MOTHER");
	ShowMsg_("DEMO_404_MSG_090");

	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	//===============================================
	// *���N
	// �u����I�@���������R�Ȋi�D����@���Z����I
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_MONSTER_BOY");
	ShowMsg_("DEMO_404_MSG_100");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	WaitTask(task_cam);
	
	SetMotion_(npc_kigurumi, wear, BLEND_XL);									// �L�O���~�`�F�b�N	
	Wait_(80);
	SetMotion_(npc_kigurumi, hero_wait_L, BLEND_XL);									// �L�O���~�ҋ@
	Wait_(60);
	
	task_cam = Task_AnimeMoveCamera_("002_anmeye", "002_anmtgt");					// �J�������������ƃY�[��

	//===============================================
	// *��e
	// �u����ł́c�c����l���̖��O������B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_BOYS_MOTHER");
	ShowMsg_("DEMO_404_MSG_110");
	KeyInputWait_();
	
	//===============================================
	// *��e
	// �u���ɂ���΁@�C�b�^�u�����@����Ă���
	//-----------------------------------------------
	ShowMsg_("DEMO_404_MSG_120");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	WaitTask(task_cam);
	EndDemo(FADE_COLOR_BLACK);
}
