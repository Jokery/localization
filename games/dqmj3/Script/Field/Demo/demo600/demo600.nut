//=============================================
//
//		demo600[�R�A�E�S�i]
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
	local efc_player, efc_rena, efc_koutai;

// �����\�[�X�Ǎ�
	// �L�����N�^�[
	local player = GetPlayerId_();				// ��l��
	local n_rena = ReadNpc_("n007");			// ���i�[�e
	// �G�t�F�N�g
	LoadEffect_("ef732_17_antibody_m");			// M�R�̂̌�
	LoadEffect_("ef732_07_teleport_monolith");	// ���m���X�]���G�t�F�N�g
	LoadEffect_("ef732_13_light_reactor01");	// ���A�N�^�[�̌�(�܂Ԃ���)
	
// ���z�u
	// ��l��
	SetPointPos_(player, "player000");
	SetManualCalcAlpha_(player, true);
	SetAlpha_(player, ALPHA_CLEAR);
	// ���i�[�e
	local rena = ArrangePointNpc_(n_rena, "rena000");
	SetManualCalcAlpha_(rena, true);
	SetAlpha_(rena, ALPHA_CLEAR);
	
// ����풓���[�V�����Ǎ�
	local r_n007_show01	= ReadMotion_(rena, "n007_show01");
	local r_n007_show_L	= ReadMotion_(rena, "n007_show_L");
	local r_n007_show02	= ReadMotion_(rena, "n007_show02");
	local r_n007_look_left_L	= ReadMotion_(rena, "n007_look_left_L");
	local r_n007_look_up_L	= ReadMotion_(rena, "n007_look_up_L");
	local p_Player_look_up_L	= ReadMotion_(player, "Player_look_up_L");
	local p_Player_look_right_L	= ReadMotion_(player, "Player_look_right_L");
	local r_n007_talk01 = ReadMotion_(rena, "n007_talk01");
	local r_n007_talk01_L = ReadMotion_(rena, "n007_talk01_L");
	
// ���J�����ݒ�
	SetPointCameraEye_("cameye003");
	SetPointCameraTarget_("camtgt003");

//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);
	
	Wait_(15);
	
	PlaySE_("SE_DEM_017");
	efc_player = SetSelectBoneEffect_("ef732_07_teleport_monolith", player, ATTACH_GLOBAL);
	
	Wait_(1);
	SetAlpha_(player, 0.1);
	Wait_(1);
	SetAlpha_(player, 0.2);
	Wait_(1);
	SetAlpha_(player, 0.3);
	Wait_(1);
	SetAlpha_(player, 0.4);
	Wait_(1);
	SetAlpha_(player, 0.5);
	Wait_(1);
	SetAlpha_(player, 0.6);
	Wait_(1);
	SetAlpha_(player, 0.7);
	Wait_(1);
	SetAlpha_(player, 0.8);
	Wait_(1);
	SetAlpha_(player, 0.9);
	Wait_(1);
	SetAlpha_(player, 1.0);
	
	Wait_(100);
	
	//��������������������������������������
	//���J�b�g2
	//��������������������������������������
	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");
	
	SetMotion_(player, p_Player_look_up_L, BLEND_N);
	
	WaitTask(task_cam);
	
	Wait_(15);

	//��������������������������������������
	//���J�b�g3
	//��������������������������������������
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");
	
	WaitTask(task_cam);
	
	Wait_(20);
	
	PlaySE_("SE_DEM_017");
	efc_rena = SetSelectBoneEffect_("ef732_07_teleport_monolith", rena, ATTACH_GLOBAL);
	
	Wait_(1);
	SetAlpha_(rena, 0.1);
	Wait_(1);
	SetAlpha_(rena, 0.2);
	Wait_(1);
	SetAlpha_(rena, 0.3);
	Wait_(1);
	SetAlpha_(rena, 0.4);
	Wait_(1);
	SetAlpha_(rena, 0.5);
	Wait_(1);
	SetAlpha_(rena, 0.6);
	Wait_(1);
	SetAlpha_(rena, 0.7);
	Wait_(1);
	SetAlpha_(rena, 0.8);
	Wait_(1);
	SetAlpha_(rena, 0.9);
	Wait_(1);
	SetAlpha_(rena, 1.0);
	
	Wait_(70);
	
	SetMotion_(rena, r_n007_look_up_L, BLEND_L);
	
	Wait_(5);
	
	//===============================================
	// *���i�[�e
	// �u�Ȃ�ā@�܂��܂������p�c�c�}�f�̉�����
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_600_MSG_010");
	KeyInputWait_();
	SetMotion_(rena, r_n007_look_left_L, BLEND_L);
	Wait_(10);
	//-----------------------------------------------
	// *���i�[�e
	// �u�}���܂��傤�c�c<name_player/>�B
	//-----------------------------------------------
	ShowMsg_("DEMO_600_MSG_020");
	SetFace_(player, "Face_right");
	SetMotion_(player, p_Player_look_right_L, BLEND_L);
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetDirToObject_(player, rena);
	SetVisible(player, false);
	SetMotion_(rena, MOT_WAIT, BLEND_N);
	local task = Task_RotateToPos_(rena, GetPos_(player), 5.0);	
	
	//��������������������������������������
	//���J�b�g4
	//��������������������������������������
	SetPointCameraEye_("cameye002");
	SetPointCameraTarget_("camtgt002");
	
	//===============================================
	// *���i�[�e
	// �u�Y��Ȃ��Łc�c�ڎw���̂́@�R�A�̍Ő[���B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_600_MSG_030");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetMotion_(rena, r_n007_show01, BLEND_L);
	WaitMotion(rena);
	SetMotion_(rena, r_n007_show_L, BLEND_N);
	
	Wait_(30);
	
	PlaySE_("SE_DEM_142");
	efc_koutai = SetPointWorldEffect_("ef732_13_light_reactor01", "ef_Mkoutai");
	SetEffectScale_(efc_koutai, 0.2);
	
	Wait_(80);
	
	SetFade_(FADE_OUT, FADE_COLOR_WHITE, 30);
	WaitFade_();
	
	DeleteEffect_(efc_koutai);
	
	Wait_(50);
	
	local Mkoutai = SetPointWorldEffect_("ef732_17_antibody_m", "ef_Mkoutai");
	
	Wait_(20);
	
	SetFade_(FADE_IN, FADE_COLOR_WHITE, 30);
	WaitFade_();

	Wait_(30);
	
	//===============================================
	// *���i�[�e
	// �u�����ɒ�������@���̂l�R�̂�
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_600_MSG_040");
	KeyInputWait_();
	CloseMsgWnd_();

	SetVisible(player, true);
	
	//��������������������������������������
	//���J�b�g5
	//��������������������������������������
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");
	WaitTask(task_cam);
	SetFace_(player, "Face_default");
	
	//-----------------------------------------------
	// *���i�[�e
	// �u�ł��c�c���P�l����@������
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_600_MSG_050");
	KeyInputWait_();
	
	DeleteEffectEmitter_(Mkoutai);
	efc_koutai = SetPointWorldEffect_("ef732_13_light_reactor01", "ef_Mkoutai");
	SetEffectScale_(efc_koutai, 0.12);
	
	Wait_(10);
	
	DeleteEffectEmitter_(Mkoutai);
	
	Wait_(20);
	
	DeleteEffectEmitter_(efc_koutai);
	
	Wait_(15);
	
	SetMotion_(rena, r_n007_show02, BLEND_M);
//	Wait_(10);
	Wait_(15);
	SetMotion_(rena, r_n007_talk01, BLEND_L);
	WaitMotion(rena);
	SetMotion_(rena, r_n007_talk01_L, BLEND_N);
	
	//-----------------------------------------------
	// *���i�[�e
	// �u������@���Ȃ����K�v�Ȃ́@<name_player/>�B
	//-----------------------------------------------
	ShowMsg_("DEMO_600_MSG_060");
	KeyInputWait_();
	
	//-----------------------------------------------
	// *���i�[�e
	// �u�G�ɂ́@�܂��_�[�N�}�X�^�[������c�c�B
	//-----------------------------------------------
	ShowMsg_("DEMO_600_MSG_070");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetMotion_(rena, MOT_WAIT, BLEND_XL);
	
	EndDemo(FADE_COLOR_BLACK);
}
