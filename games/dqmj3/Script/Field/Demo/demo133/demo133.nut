//=============================================
//
//		demo133[�n�����ɂ�]
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
	// �M�~�b�N
	local model_elevatordoor = ReadGimmick_("o_A01_16");// �G���x�[�^�[��
	local model_diskdevice = ReadGimmick_("o_com_18");	// �f�B�X�N���u
	local model_sougen = ReadGimmick_("o_A01_05");		// �����p�l���i�N���O�j
	local model_houraku = ReadGimmick_("o_A01_06");		// �����p�l���i�N���O�j
	local model_boti = ReadGimmick_("o_A01_07");		// ��n�p�l���i�N���O�j
	local model_koori = ReadGimmick_("o_A01_08");		// �X�p�l���i�N���O�j
	local model_suna = ReadGimmick_("o_A01_09");		// ���p�l���i�N���O�j
	local model_kazan = ReadGimmick_("o_A01_10");		// �ΎR�p�l���i�N���O�j
	// �G�t�F�N�g
	LoadEffect_("ef732_09_light_reactor_c");			// ���A�N�^�[����

// ���z�u
	// ��l��
	SetPointPos_(player, "player000");
	// �e��p�l���i�N���O�j
	local sougen = ArrangePointGimmick_("o_A01_05", model_sougen, "obj_panel000");
	SetMotion_(sougen, MOT_GIMMICK_1, BLEND_N);
	local houraku = ArrangePointGimmick_("o_A01_06", model_houraku, "obj_panel000");
	SetMotion_(houraku, MOT_GIMMICK_1, BLEND_N);
	local boti = ArrangePointGimmick_("o_A01_07", model_boti, "obj_panel000");
	SetMotion_(boti, MOT_GIMMICK_1, BLEND_N);
	local koori = ArrangePointGimmick_("o_A01_08", model_koori, "obj_panel000");
	SetMotion_(koori, MOT_GIMMICK_1, BLEND_N);
	local suna = ArrangePointGimmick_("o_A01_09", model_suna, "obj_panel000");
	SetMotion_(suna, MOT_GIMMICK_1, BLEND_N);
	local kazan = ArrangePointGimmick_("o_A01_10", model_kazan, "obj_panel000");
	SetMotion_(kazan, MOT_GIMMICK_1, BLEND_N);
	// �G���x�[�^�[��
	local door = ArrangePointGimmick_("o_A01_16", model_elevatordoor, "obj_elevatordoor000");
	local door = ArrangePointGimmick_("o_A01_16", model_elevatordoor, "obj_elevatordoor001");
	// �]�����u
	local diskdevice = ArrangePointGimmick_("o_o_com_18", model_diskdevice, "obj_diskdevice000");

// ����풓���[�V�����Ǎ�
	local pl_touch_reacter = ReadMotion_(player, "Player_touch_reactor");// ��l���@��������������遨���A�N�^�[��G��
	local pl_touch_reacter_L = ReadMotion_(player, "Player_touch_reactor_L");// ��l���@��������������遨���A�N�^�[��G��L

// ���J�����ݒ�
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");

// �����[�V�����ݒ�
	SetMotion_(player, MOT_WALK, BLEND_N);
	task_player = Task_MoveForward_(player, 0.8, false);


//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);

	// ���J�b�g�P���G���x�[�^�[�O�@���A�N�^�[�����`�`�`�`�`�`�`
	Wait_(2);
	PlaySE_("SE_FLD_135");								// ���A�N�^�[������
	local light = SetSelectBoneEffect_("ef732_09_light_reactor_c", player, ATTACH_EFFECT1);// ���A�N�^�[����		
	Wait_(5);
	SetMotion_(player, MOT_WAIT, BLEND_L);
	DeleteTask_(task_player);
	Wait_(10);

	SetMotion_(player, pl_touch_reacter, BLEND_L);
	WaitMotion(player);
	SetMotion_(player, pl_touch_reacter_L, BLEND_M);
	Wait_(10);


	// ���J�b�g�Q���f�B�X�N���u�փY�[���C���`�`�`�`�`�`�`�`�`�`
	SetPointPos_(player, "player001");
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");
	Wait_(20);	
	SetMotion_(player, MOT_WAIT, BLEND_XL);
	WaitTask(task_cam);
	DeleteTask_(task_cam);
	Wait_(20);


	// ���J�b�g�R���f�B�X�N���u�@�ʃA���O���A�b�v�`�`�`�`�`�`�`
	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");

	LoadEffect_("ef732_12_monolith_on");				// ���m���X�̋N���G�t�F�N�g
	SetPointWorldEffect_("ef732_12_monolith_on", "obj_diskdevice000");
	PlaySE_("SE_FLD_101");								// ���m���X�N����
	SetMotion_(diskdevice, MOT_GIMMICK_1, BLEND_N);		// �f�B�X�N���u�N��
	Wait_(30);
	SetMotion_(diskdevice, MOT_GIMMICK_2, BLEND_N);		// �f�B�X�N���u�N����ҋ@
	Wait_(30);
	
	//===============================================
	// �����A�N�^�[
	// �u�`�����@�x�����邽�߂Ɂ@���ꂽ
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_REACTOR");
	ShowMsg_("DEMO_133_MSG_010");
	KeyInputWait_();
	
	//-----------------------------------------------
	// ��
	// �u�@�\���@�������܂��̂�
	//-----------------------------------------------
	ShowMsg_("DEMO_133_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	EndDemo(FADE_COLOR_BLACK);
}
