//=============================================
//
//		demo419[�C�b�^�u���Đ�]
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
	local efc_player;

// �����\�[�X�Ǎ�
	// �L�����N�^�[
	local player = GetPlayerId_();						// ��l��
	local model_ittabule = ReadNpc_("m205_00");			// �C�b�^�u��
	local model_control = ReadGimmick_("o_S02_09");		// �R���g���[���p�l���d��

// ���z�u
	// ��l��
	local ittabule = ArrangePointNpc_(model_ittabule, "monster_ittabule000");
	local m_control = ArrangePointGimmick_("o_S02_09", model_control, "modele_control000");

	LoadEffect_("ef730_01_oth_dark_aura01");
	local efc_azamuku = SetSelectBoneEffectSetOffset_("ef730_01_oth_dark_aura01", ittabule, ATTACH_EFFECT2, Vec3(0.0, -10.0, 0.0));

// ���J�����ݒ�
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");

//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------
	
	StartDemo(FADE_COLOR_BLACK);
	
	//===============================================
	// ���C�b�^�u��
	// �u���[�n�b�n�b�n�b�I
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ITABURU");
	ShowMsg_("DEMO_419_MSG_001");
	KeyInputWait_();
	//===============================================
	
	//===============================================
	// ���C�b�^�u��
	// �u�s���g�̃A���Z�X�Ƃ�
	//-----------------------------------------------
	ShowMsg_("DEMO_419_MSG_002");
	KeyInputWait_();
	//===============================================
	
	//===============================================
	// ���C�b�^�u��
	// �u���������x�@���悤�Ɓ@���ʂȂ̂ł���I
	//-----------------------------------------------
	ShowMsg_("DEMO_419_MSG_003");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetMotion_(ittabule, MOT_SPELL_ACTUATE, BLEND_L);		// �C�b�^�u�� �U��
	PlaySE_("SE_DEM_091");

	Wait_(30);
		
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");
		
	EncountEndDemo(ENCOUNT_BOSS);
}
