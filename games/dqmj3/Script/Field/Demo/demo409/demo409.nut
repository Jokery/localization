//=============================================
//
//		demo409[���L���̃k�P�K��]
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
	local npc_player = ReadNpc_("n027");					// ��l��(�L�O���~)
	// �M�~�b�N
	local model_rukiya_doll = ReadGimmick_("o_dem_16");		// ���L���̔����k
	local model_jail_door = ReadGimmick_("o_S02_02");		// �S����
	// �G�t�F�N�g
	LoadEffect_("ef712_10_emo_surprise01");					// �u�I�v

// ���z�u
	// ��l��(�L�O���~)
	local player = ArrangePointNpc_(npc_player, "player000");
	SetScaleSilhouette(player, 0.6 ,0.6);
	// ���L���̃k�P�K��
	local rukiya_doll = ArrangePointGimmick_("o_dem_16", model_rukiya_doll, "obj_rukiya_doll000");
	InitSilhouetteWidth_(rukiya_doll, 0.7);

	// �S���� ���Q
	local jail_door_est_2 = ArrangePointGimmick_("o_S02_02", model_jail_door, "obj_jail_door_est_2_000");
	SetMotion_(jail_door_est_2, MOT_GIMMICK_4, BLEND_N);	// ���J���E�ҋ@
	
//��풓���[�V�����ǂݍ���
	local player_stand_L = ReadMotion_(player, "m127_01_hero_wait_L");
	local player_surprise = ReadMotion_(player, "m127_01_surprise");		//����
	local player_surprise_L = ReadMotion_(player, "m127_01_surprise_L");	//����L


// ���J�����ݒ�
	SetMotion_(player, player_stand_L, BLEND_M);
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");

//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);

	Wait_(5);
	
	local pos = Vec3(3, 2.2, -1.6);
	efc_player = SurpriseDispSetOffset(player, pos, 1.7);
	
	SetMotion_(player, player_surprise, BLEND_M);
	WaitMotion(player);
	SetMotion_(player, player_surprise_L, BLEND_M);
		
	Wait_(30);

	//===============================================
	//���V�X�e�����b�Z�[�W
	//�Ȃ�Ɓ@���g���@�Ȃ��I
	//�k�P�K���c�c����@�L�O���~�̂悤���B
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_409_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");
	Wait_(180);

	EndDemo(FADE_COLOR_BLACK);
}
