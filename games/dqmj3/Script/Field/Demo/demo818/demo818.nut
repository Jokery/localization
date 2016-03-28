//=============================================
//
//		demo818[��̃X�^�[�s�[�X����]
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
	local task_cam, task_player, task_seed;
	local efc_player, efc_hoakari, efc_seed;

// �����\�[�X�Ǎ�
	// �M�~�b�N
	local model_base = ReadGimmick_("o_effect_base");	// �G�t�F�N�g�x�[�X
	// �L�����N�^�[
	local player = GetPlayerId_();						// ��l��
	local model_hoakari = ReadNpc_("m172_00");			// ��̐_�z�A�J��
	// �G�t�F�N�g
	LoadEffect_("ef881_03_god_die_air");				// �_���S�̌� ��
	LoadEffect_("ef732_31_star_egg_r");				// �X�^�[�V�[�h ��

// ���z�u
	// ��l��
	SetPointPos_(player, "player000");
	SetVisible(player, false);
	// ��̐_�z�A�J��
	local hoakari = ArrangePointNpc_(model_hoakari, "npc_hoakari000");
	SetScale_(hoakari, 4.0);
	
	// �X�^�[�V�[�h �΁i�G�t�F�N�g�x�[�X�j
	local seed = ArrangePointGimmick_("o_effect_base", model_base, "obj_seed000");

// ����풓���[�V�����Ǎ�
	// ��l��
	local player_hold_L = ReadMotion_(player, "Player_hold_L");		// ��������

// �����[�V�����ݒ�
	SetMotion_(hoakari, MOT_SWORD_CHARGE, BLEND_N);
	SetMotionSpeed_(hoakari, 0.3);
	
// ���J�����ݒ�
//	SetPointCameraEye_("cameye000");
//	SetPointCameraTarget_("camtgt000");
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");
	DeleteTask_(task_cam);
	StartBlurEffect_();

//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);
	
	// ���J�b�g�P���z�A�J���t�o�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`
	
	//===============================================
	// ����̐_�z�A�J��
	// �u�z�z�z�c�c�悭���@����ɏ��������̂�ȁB
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_HOAKARI");
	ShowMsg_("DEMO_818_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	// ���J�b�g�Q���z�A�J������`�`�`�`�`�`�`�`�`�`�`�`�`�`�`
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");		// 200F
	
	PlaySE_("SE_DEM_198");
	SetMotion_(hoakari, MOT_DAMAGE, 60);
	Wait_(45);
	
	efc_hoakari = SetBoneEffect_("ef881_03_god_die_air", hoakari);	// �_���S�̌� ��
	SetMotionSpeed_(hoakari, 0.3);
	Wait_(140);
	
	SetAlpha_(hoakari, ALPHA_CLEAR);
	
	efc_seed = SetSelectBoneEffect_("ef732_31_star_egg_r", seed, ATTACH_GLOBAL);
	SetEffectScale_(efc_seed, 4.0);
	
	EndBlurEffect_();
	DeleteTask_(task_cam);
	
	// ���J�b�g�Q���X�^�[�s�[�X�o���`�`�`�`�`�`�`�`�`�`�`�`�`�`
	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");
	Wait_(310);
	
	task_seed = Task_AnimeMoveNoFit_(seed, "anm_seed000");
	WaitTask(task_seed);
	
	SetVisible(player, true);
	SetEffectScale_(efc_seed, 0.5);
	
	SetPos_(seed, false);
	
	// ���J�b�g�R���X�^�[�s�[�X�A��l���̌��ց`�`�`�`�`�`�`�`�`
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");
	task_seed = Task_AnimeMoveNoFit_(seed, "anm_seed001");
	Wait_(60);
	
	SetMotion_(player, player_hold_L, BLEND_XL);
	WaitTask(task_seed);
	Wait_(60);
	
	//===============================================
	// ���V�X�e�����b�Z�[�W
	// ��̃X�^�[�s�[�X���@��ɓ��ꂽ�I
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_818_MSG_020");
	PlayMe_("ME_010");
	WaitMe_();
	KeyInputWait_();
	
	//-----------------------------------------------
	// ��
	// �Z���^�[�r���́@�n���P�K�ő҂��Ă���
	//-----------------------------------------------
	ShowMsg_("DEMO_818_MSG_030");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	EndDemo(FADE_COLOR_BLACK);
}
