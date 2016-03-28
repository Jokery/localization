//=============================================
//
//		demo814[���̃X�^�[�s�[�X����]
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
	local efc_player, efc_yachihoko, efc_seed;

// �����\�[�X�Ǎ�
	// �M�~�b�N
	local model_base = ReadGimmick_("o_effect_base");	// �G�t�F�N�g�x�[�X
	// �L�����N�^�[
	local player = GetPlayerId_();						// ��l��
	local model_yachihoko = ReadNpc_("m171_00");		// ���̐_���`�z�R
	// �G�t�F�N�g
	LoadEffect_("ef881_01_god_die_land");				// �_���S�̌� ��
	LoadEffect_("ef732_19_star_seed_g");				// �X�^�[�V�[�h ��
	LoadEffect_("ef732_29_star_egg_g");					// �X�^�[�G�b�O ��

// ���z�u
	// ��l��
	SetPointPos_(player, "player000");
	SetVisible(player, false);
	// ���̐_���`�z�R
	local yachihoko = ArrangePointNpc_(model_yachihoko, "npc_yachihoko000");
	SetScale_(yachihoko, 4.0);
	
	// �X�^�[�V�[�h �΁i�G�t�F�N�g�x�[�X�j
	local seed = ArrangePointGimmick_("o_effect_base", model_base, "obj_seed000");

// ����풓���[�V�����Ǎ�
	// ��l��
	local player_hold_L = ReadMotion_(player, "Player_hold_L");		// ��������

// �����[�V�����ݒ�
	SetMotion_(yachihoko, MOT_SPELL_CHARGE, BLEND_N);
	SetMotionSpeed_(yachihoko, 0.2);
	
// ���J�����ݒ�
//	SetPointCameraEye_("cameye000");
//	SetPointCameraTarget_("camtgt000");
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");		// 200F
	DeleteTask_(task_cam);
	StartBlurEffect_();

//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);
	
	// ���J�b�g�P�����`�z�R�t�o�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`
	
	//===============================================
	// �����̐_���`�z�R
	// �u�����Ȃ�c�c�I
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_YACHIHOKO");
	ShowMsg_("DEMO_814_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	// ���J�b�g�Q�����`�z�R����`�`�`�`�`�`�`�`�`�`�`�`�`�`�`
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");		// 200F
	PlaySE_("SE_DEM_198");
	SetMotion_(yachihoko, MOT_DAMAGE, 45);
	Wait_(45);
	
	efc_yachihoko = SetBoneEffect_("ef881_01_god_die_land", yachihoko);	// �_���S�̌� ��
	SetMotionSpeed_(yachihoko, 0.1);
	Wait_(40);
	SetMotionSpeed_(yachihoko, 0.2);
	Wait_(100);
	
	SetAlpha_(yachihoko, ALPHA_CLEAR);
	
	efc_seed = SetSelectBoneEffect_("ef732_29_star_egg_g", seed, ATTACH_GLOBAL);
	SetEffectScale_(efc_seed, 4.0);
	
	EndBlurEffect_();

	DeleteTask_(task_cam);
	
	// ���J�b�g�Q���X�^�[�s�[�X�o���`�`�`�`�`�`�`�`�`�`�`�`�`�`

	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");
	Wait_(30);
	
	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");
	Wait_(280);
	
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
	// ���̃X�^�[�s�[�X���@��ɓ��ꂽ�I
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_814_MSG_020");
	PlayMe_("ME_010");
	WaitMe_();
	KeyInputWait_();
	
	//-----------------------------------------------
	// ��
	// �Z���^�[�r���́@�n���P�K�ő҂��Ă���
	//-----------------------------------------------
	ShowMsg_("DEMO_814_MSG_030");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	EndDemo(FADE_COLOR_BLACK);
}
