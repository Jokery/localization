//=============================================
//
//		demo315[�����Ă����V���o�[]
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
	local task_cam, task_player, task_silver;
	local efc_smoke, efc_silver;
	
// �����\�[�X�Ǎ�
	// �G�t�F�N�g
	LoadEffect_("ef712_10_emo_surprise01");			// �u�I�v
	LoadEffect_("ef721_03_nat_smoke_n03");			// ��
	// �L�����N�^�[
	local player = GetPlayerId_();					// ��l��
	local model_silver = ReadNpc_("m077_00")		// �V���o�[
	// �M�~�b�N
	local model_huta = ReadGimmick_("o_I01_03");	// �W
	local model_hitugi = ReadGimmick_("o_I01_04");	// ��
	
// ���z�u
	// ��l��
	SetPointPos_(player, "player000");
	// �V���o�[
	local silver = ArrangePointNpc_(model_silver, "npc_silver000");
	SetScaleSilhouette(silver, SCALE.N, 0.5);
	SetActive_(silver, false);
	// �M�~�b�N
	local huta = ArrangePointGimmick_("o_I01_03", model_huta, "obj_huta000");
	local hitugi = ArrangePointGimmick_("o_I01_04", model_hitugi, "obj_hitugi000");

// ����풓���[�V�����Ǎ�
	local player_gatagata = ReadMotion_(player, "Player_gatagata");				// ���̊W���K�^�K�^������
	local player_surprise = ReadMotion_(player, "Player_surprise");				// ��l������
	local player_surprise_L = ReadMotion_(player, "Player_surprise_L");			// ��l������L
	local player_nod = ReadMotion_(player, "Player_nod");						// �ҋ@���������ҋ@
	local player_look_left_L = ReadMotion_(player, "Player_look_left_L");		// ���������������L
	
	local silver_coffin = ReadMotion_(silver, "m077_00_coffin");				// �G�������N���オ��
	local silver_talk_L = ReadMotion_(silver, "m077_00_talk_L");				// ��bL
	local silver_wait_above_L = ReadMotion_(silver, "m077_00_wait_above_L");	// ������ҋ@L
	local silver_hold_fist01_L = ReadMotion_(silver, "m077_00_hold_fist01_L");	// �������L
	local silver_hold_fist02_L = ReadMotion_(silver, "m077_00_hold_fist02_L");	// �������2L
	local silver_strike = ReadMotion_(silver, "m077_00_strike");				// �ҋ@���n�ʂ�ł��ҋ@
	local silver_wait_L = ReadMotion_(silver, "m077_00_wait_L");				// �ҋ@02L
	
// ���J�����ݒ�
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");			// 180F

//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------
	
	StartDemo(FADE_COLOR_BLACK);

	Wait_(55);
	
	SetMotion_(player, player_gatagata, BLEND_L);

	Wait_(14);
	
	PlaySE_("SE_FLD_129");
	SetMotion_(huta, MOT_GIMMICK_6, BLEND_N);
	SetMotion_(hitugi, MOT_GIMMICK_2, BLEND_N);
	
	Wait_(21);
	
	SetMotion_(huta, MOT_GIMMICK_0, BLEND_N);
	SetMotion_(hitugi, MOT_GIMMICK_0, BLEND_N);
	
	Wait_(18);
	
	SetMotion_(huta, MOT_GIMMICK_6, BLEND_N);
	SetMotion_(hitugi, MOT_GIMMICK_2, BLEND_N);
	Wait_(7);
	PlaySE_("SE_FLD_129");
	Wait_(51);

	PlaySE_("SE_FLD_129");
	
	Wait_(40);
	
	SetActive_(player, false);
	DeleteTask_(task_cam);
		
	//��������������������������������������
	//���J�b�g2
	//��������������������������������������
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");
	
	SetMotion_(huta, MOT_GIMMICK_0, BLEND_N);
	SetMotion_(hitugi, MOT_GIMMICK_0, BLEND_N);
	
	Wait_(45);
	
	PlaySE_("SE_DEM_114");
	SetMotion_(huta, MOT_GIMMICK_2, BLEND_N);
	WaitMotion(huta);
	SetMotion_(huta, MOT_GIMMICK_3, BLEND_N);
	
	Wait_(70);

	//��������������������������������������
	//���J�b�g3
	//��������������������������������������
	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");
	
	SetActive_(player, true);
	SetMotion_(player, MOT_WAIT, BLEND_N);
	SetPointPos_(player, "player001");
	
	SetActive_(silver, true);
	SetMotion_(silver, silver_coffin, BLEND_N);
	SetMotionSpeed_(silver, 0.4);
	PlaySE_("SE_DEM_115");
	
	SetMotion_(huta, MOT_GIMMICK_4, BLEND_N);
	SetMotionSpeed_(huta, 0.5);
	
	Wait_(50);
	
	SetMotionSpeed_(silver, 0.85);

	SurpriseDisp(player);
	SetMotion_(player, player_surprise, BLEND_M);
	WaitMotion(player);
	SetMotion_(player, player_surprise_L, BLEND_M);	
	
	Wait_(15);
	
	StartDecayEarthQuake_(30, 3, 0.5)
	
	efc_smoke = SetPointWorldEffect_("ef721_03_nat_smoke_n03", "efc_smoke000");
	SetEffectScale_(efc_smoke, 0.55);
	
	WaitMotion(huta);
	SetMotion_(huta, MOT_GIMMICK_5, BLEND_N);

	Wait_(80);
	
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 20);
	WaitFade_();
	
	SetPointPos_(player, "player002");
	SetPointPos_(silver, "npc_silver001");
	SetMotion_(player, MOT_WAIT, BLEND_N);
	SetMotion_(silver, MOT_WAIT, BLEND_N);
	SetMotionSpeed_(silver, 1.0);
	
	Wait_(40);
	
	SetMotion_(silver, silver_talk_L, BLEND_N);
	
	//��������������������������������������
	//���J�b�g4
	//��������������������������������������
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");			// 240F
	
	SetFade_(FADE_IN, FADE_COLOR_BLACK, 20);
	WaitFade_();
	
	Wait_(30);
	
	//===============================================
	//*�V���o�[
	// 	�u�c�c�N�����m��񂪁@�����������B
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_315_MSG_010");
	KeyInputWait_();
	
	//===============================================
	//*�V���o�[
	// 	�u�|�[���p�[�N�̎҂ł́@�Ȃ��悤�����c�c�H
	//-----------------------------------------------
	ShowMsg_("DEMO_315_MSG_020");
	
	Wait_(25);
	SetMotion_(silver, silver_wait_above_L, BLEND_L);
	efc_silver = SetSelectBoneEffectSetOffset_("ef712_10_emo_surprise01", silver, ATTACH_EFFECT1, Vec3(0.0, 3.0, 0.0));
	SetEffectScale_(efc_silver, 2.0);
	PlaySE_("SE_DEM_053");
	
	KeyInputWait_();
	
	//===============================================
	//*�V���o�[
	//�u�������c�c���O���@���L���̌����Ă���
	//-----------------------------------------------
	ShowMsg_("DEMO_315_MSG_030");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	DeleteTask_(task_cam);
	DeleteEffect_(efc_silver);
	
	SetActive_(player, false);
	
	//��������������������������������������
	//���J�b�g5
	//��������������������������������������
	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");			// 100F
	
	Wait_(5);
	//===============================================
	//*�V���o�[
	// �u���ȏЉ�x�ꂽ�ȁB���́@�V���o�[�B
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_315_MSG_040");
	KeyInputWait_();
	
	SetMotion_(silver, silver_hold_fist01_L, BLEND_L);
	
	//===============================================
	//���V���o�[
	//�u�����Ƃ��@���S�̃C�G�^�X�ɗ��؂��
	//�@�E���ꂩ���ā@���̃U�}�����ȁB
	//-----------------------------------------------
	SetTalkName_("NAME_TAG_SILVER");
	ShowMsg_("DEMO_315_MSG_050");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	WaitTask(task_cam);
	
	SetActive_(player, true);
	
	SetMotion_(silver, silver_hold_fist02_L, BLEND_L);
	
	//��������������������������������������
	//���J�b�g6
	//��������������������������������������
	SetPointCameraEye_("cameye002");
	SetPointCameraTarget_("camtgt002");

	Wait_(5);
	//===============================================
	//���V���o�[
	//�u<name_player/>��@���O��
	//�@�C�G�^�X�Ɂ@��������Ƃ͂��邩�H
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_SILVER");
	ShowMsg_("DEMO_315_MSG_060");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	Wait_(5);
	
	SetMotion_(player, player_nod, BLEND_M);
	WaitMotion(player);
	SetMotion_(player, MOT_WAIT, BLEND_M);
	
	Wait_(10);
	
	//===============================================
	//���V���o�[
	//�u�������c�c��͂�@�C�G�^�X�߁B
	//�@������@�I�T�̏؂�D���@�Ֆڂ��p���ł������B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_SILVER");
	ShowMsg_("DEMO_315_MSG_070");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetActive_(player, false);
	
	//��������������������������������������
	//���J�b�g7
	//��������������������������������������
	SetPointCameraEye_("cameye003");
	SetPointCameraTarget_("camtgt003");
	
	SetMotion_(silver, silver_strike, BLEND_N);
	
	Wait_(5);
	//===============================================
	//���V���o�[
	//�u���g�������@�����Ă����@�I�T�̏؂�
	//�@�Ȃ��Ȃ��Ă����̂Ł@������Ƃ́@�v�������B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_SILVER");
	ShowMsg_("DEMO_315_MSG_080");
	
	WaitMotion(silver);
	SetMotion_(silver, silver_talk_L, BLEND_L);
	
	KeyInputWait_();
	
	//===============================================
	//���V���o�[
	//�u�����@�����E���Ȃ������͎̂��s�������ȁB
	//-----------------------------------------------
	ShowMsg_("DEMO_315_MSG_090");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetActive_(player, true);
	
	//��������������������������������������
	//���J�b�g8
	//��������������������������������������
	SetPointCameraEye_("cameye004");
	SetPointCameraTarget_("camtgt004");
	
	SetMotion_(silver, MOT_WALK, BLEND_N);
	task_silver = Task_RotateToDir_(silver, 5, 2.85);
	WaitTask(task_silver);
	task_silver = Task_MoveForward_(silver, 0.65, false);
	Wait_(8);
	task_player = Task_RotateToDirSetMotion_(player, 325, 2.85, MOT_WALK, MOT_WAIT);
	Wait_(31);
	DeleteTask_(task_silver);
	SetMotion_(silver, silver_wait_above_L, BLEND_L);
	Wait_(1);
	efc_silver = SetSelectBoneEffectSetOffset_("ef712_10_emo_surprise01", silver, ATTACH_EFFECT1, Vec3(0.0, 2.2, 0.0));
	SetEffectScale_(efc_silver, 2.2);
	PlaySE_("SE_DEM_053");
	
	Wait_(29);
	
	SetMotion_(silver, silver_wait_L, BLEND_L);
	
	//===============================================
	//*�V���o�[
	// �u�����H�@�Ȃ񂾁@����́H
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_SILVER");
	ShowMsg_("DEMO_315_MSG_100");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	task_cam = Task_AnimeMoveCamera_("anmeye003", "anmtgt003");			// 150F
	WaitTask(task_cam);
	
	Wait_(60);
	
	EndDemo(FADE_COLOR_BLACK);
}
