//=============================================
//
//		demo816[�C�̃X�^�[�s�[�X����]
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
	local efc_player, efc_wadatsumi, efc_seed;

// �����\�[�X�Ǎ�
	// �M�~�b�N
	local model_base = ReadGimmick_("o_effect_base");	// �G�t�F�N�g�x�[�X
	// �L�����N�^�[
	local player = GetPlayerId_();						// ��l��
	local model_wadatsumi = ReadNpc_("m183_00");		// �C�̐_���_�c�~
	// �G�t�F�N�g
	LoadEffect_("ef881_02_god_die_sea");				// �_���S�̌� �C
	LoadEffect_("ef732_30_star_egg_b");					// �X�^�[�V�[�h ��

// ���z�u
	// ��l��
	SetPointPos_(player, "player000");
	SetVisible(player, false);
	// �C�̐_���_�c�~
	local wadatsumi = ArrangePointNpc_(model_wadatsumi, "npc_wadatsumi000");
	SetScale_(wadatsumi, 4.0);
	
	// �X�^�[�V�[�h �΁i�G�t�F�N�g�x�[�X�j
	local seed = ArrangePointGimmick_("o_effect_base", model_base, "obj_seed000");

// ����풓���[�V�����Ǎ�
	// ��l��
	local player_hold_L = ReadMotion_(player, "Player_hold_L");		// ��������

// �����[�V�����ݒ�
	SetMotion_(wadatsumi, MOT_SWORD_CHARGE, BLEND_N);
	SetMotionSpeed_(wadatsumi, 0.1);
	
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
	
	// ���J�b�g�P�����_�c�~�t�o�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`
	
	//===============================================
	// ���C�̐_���_�c�~
	// �u�܁c�c�܂����Ă��@�s�ꂽ���ƁI�H
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_WADATSUMI");
	ShowMsg_("DEMO_816_MSG_010");
	KeyInputWait_();
	//-----------------------------------------------
	
	//-----------------------------------------------
	// ���C�̐_���_�c�~
	// �u���̃��V�̎��@���̂�����́@����Ă��I
	//-----------------------------------------------
	ShowMsg_("DEMO_816_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	// ���J�b�g�Q�����_�c�~����`�`�`�`�`�`�`�`�`�`�`�`�`�`�`
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");		// 200F
	
	PlaySE_("SE_DEM_198");
	SetMotion_(wadatsumi, MOT_DAMAGE, 45);
	Wait_(45);
	
	efc_wadatsumi = SetBoneEffect_("ef881_02_god_die_sea", wadatsumi);	// �_���S�̌� �C
	SetMotionSpeed_(wadatsumi, 0.1);
	Wait_(130);
	
	SetMotion_(wadatsumi, MOT_WAIT, BLEND_N);	// �G�t�F�N�g�ʒu����
	SetAlpha_(wadatsumi, ALPHA_CLEAR);
	
	efc_seed = SetSelectBoneEffect_("ef732_30_star_egg_b", seed, ATTACH_GLOBAL);
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
	// �C�̃X�^�[�s�[�X���@��ɓ��ꂽ�I
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_816_MSG_030");
	PlayMe_("ME_010");
	WaitMe_();
	KeyInputWait_();
	
	//-----------------------------------------------
	// ��
	// �Z���^�[�r���́@�n���P�K�ő҂��Ă���
	//-----------------------------------------------
	ShowMsg_("DEMO_816_MSG_040");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	EndDemo(FADE_COLOR_BLACK);
}
