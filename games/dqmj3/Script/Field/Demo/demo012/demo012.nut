//=============================================
//
//		demo012[�m�`�������Ƃ̏o�_2(���Ԍ�)]
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
	local task_cam, task_player, task_mons, task_nocho, task_window;
	local flg_mons = GetNumFlg_("NUM_CHANGE_FIRST_MONSTER");		// Num12
	local player_rot = Vec3(851.55402, 198.02789, -587.7608);
	local nocho_rot = Vec3(824.51355, 191.20386, -551.92377);
	local mons_scale = 0;			// �X�P�[���l
	local mons_outline = 0;			// �A�E�g���C��
	local mons_param = 0;			// �p�����[�^�h�c
	local mons_kind = 0;			// �푰�h�c
	local mons_res = 0;				// ���\�[�X��
	local frame_sum = 0;

	// �������ԃ����X�^�[�ݒ�
	switch(flg_mons)
	{
	// �u�v���Y�j�����v
	case PURIZUNYAN:		// Num12 = 0
		mons_scale = SCALE.PURIZUNYAN;
		mons_outline = SILHOUETTE_WIDTH.PURIZUNYAN;
		mons_param = 1203;
		mons_kind = 128;
		mons_res = "m040_00";
		break;
	// �u�t�H���f���v
	case FONDHU:			// Num12 = 1
		mons_scale = SCALE.FONDHU;
		mons_outline = SILHOUETTE_WIDTH.FONDHU;
		mons_param = 1202;
		mons_kind = 392;
		mons_res = "m125_00";
		break;
	// �u�h���L�[�v
	case DORAKI:			// Num12 = 2
		mons_scale = SCALE.DORAKI;
		mons_outline = SILHOUETTE_WIDTH.DORAKI;
		mons_param = 1201;
		mons_kind = 160;
		mons_res = "m052_00";
		break;
	// �u�i�X�r�[���v
	case NASUBINARA:		// Num12 = 3
		mons_scale = SCALE.NASUBINARA;
		mons_outline = SILHOUETTE_WIDTH.NASUBINARA;
		mons_param = 1204;
		mons_kind = 214;
		mons_res = "m069_00";
		break;
	default :
		DebugPrint("WARNING : �t���OID (" + flg_mons + ") ���s���ł�[Update]");
	}
	
// �����f���Ǎ�
	// �M�~�b�N
	local model_bush = ReadGimmick_("o_dem_02");	// �΂�
	// �L�����N�^�[
	local player = GetPlayerId_();					// ��l��
	local model_n_man = ReadNpc_("n043");			// �m�`������
	local model_mons = ReadNpc_(mons_res);			// ���������X�^�[

// ���z�u
	// �΂�
	local bush00 = ArrangePointGimmick_("o_dem_02", model_bush, "obj_bush000");
	
	// ��l��
	SetPointPos_(player, "player003");
	SetFace_(player, "Face_eyes_close");
	SetAlpha_(player, ALPHA_CLEAR);
	// �m�`���[��
	local nocho00 = ArrangePointNpc_(model_n_man, "npc_nocho003");
	SetStepSePan_(nocho00, false);
	// ���������X�^�[
	local mons = ArrangePointNpc_(model_mons, "npc_priz002");
	SetScaleSilhouette(mons, mons_scale, mons_outline);
	SetAlpha_(mons, ALPHA_CLEAR);

// ����풓���[�V�����Ǎ�
	// �m�`���[��
	local nch_think02_L = ReadMotion_(nocho00, "n000_think02_L");		// �l����i�r�g�݁jL
	local nch_arm_folde = ReadMotion_(nocho00, "n000_arm_folde");		// �l����i�r�g�݁j���r�g��
	local nch_arm_folde_L = ReadMotion_(nocho00, "n000_arm_folde_L");	// �r�g��L

// ���J�����ݒ�
	task_cam = Task_AnimeMoveCamera_("anmeye011", "anmtgt011");			// 300F

//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);
	
	// ���J�b�g16���m�`���[���Y�[���`�`�`�`�`�`�`�`�`�`�`�`
	MotionTalk(nocho00);
	
	//===============================================
	// *�m�`���[��
	// �u�������X�^�[�����I�@�C�C���O������ˁ[�I
	//-----------------------------------------------
	SetExchangePartyMonsterName_(MONSTER_PLACE.PLACE_PARTY, 0);
	
	OpenMsgWnd_();
	ShowMsg_("DEMO_012_MSG_010");
	KeyInputWait_();
	
	//-----------------------------------------------
	// ��
	// �u�Ƃ���Ł@���O�c�c���O�́H
	//-----------------------------------------------
	ShowMsg_("DEMO_012_MSG_020");
	KeyInputWait_();
	
	SetMotion_(nocho00, nch_think02_L, BLEND_XL);					// �l����i�r�g�݁jL
	
	//-----------------------------------------------
	// ��
	// �u�܂����@����ȂƂ���Ł@���O�Ƃ���
	//-----------------------------------------------
	ShowMsg_("DEMO_012_MSG_030");
	KeyInputWait_();
	
	SetMotion_(nocho00, nch_arm_folde, BLEND_L);					// �l����i�r�g�݁j���r�g��
	WaitMotion(nocho00);
	SetMotion_(nocho00, nch_arm_folde_L, BLEND_L);					// �r�g��L
	
	//-----------------------------------------------
	// ��
	// �u����́@�݂�Ȃ���������@�`�����X�����B
	//-----------------------------------------------
	ShowMsg_("DEMO_012_MSG_040");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	// �m�`���[���@�����Ă���
	SetMotion_(nocho00, MOT_WALK, BLEND_L);
	task_nocho = Task_RotateToPos_(nocho00, nocho_rot, ROTATE_DEMO_DEF);
	WaitTask(task_nocho);
	DeleteTask_(task_nocho);
	task_nocho = Task_MoveForward_(nocho00, 1.0, false);
	Wait_(60);
	
	// �E�E�E�E�E�E�E�E�E�E
	DeleteTask_(task_cam);
	SetAlpha_(player, ALPHA_EXIST);
	SetAlpha_(mons, ALPHA_EXIST);
	task_player = Task_RotateToPos_(player, player_rot, ROTATE_DEMO_DEF);
	SetMotion_(player, MOT_WALK, BLEND_N);
	SetMotion_(mons, MOT_WALK, BLEND_N);
	// �E�E�E�E�E�E�E�E�E�E
	
	// ���J�b�g16���m�`���[�������Ă����`�`�`�`�`�`�`�`�`�`�`�`
	task_cam = Task_AnimeMoveCamera_("anmeye014", "anmtgt014");		// 90F
	task_mons = Task_RotateToPosSetMotion_(mons, nocho_rot, ROTATE_DEMO_DEF, MOT_WALK, MOT_WAIT);
	
	frame_sum = 0;
	frame_sum = WaitTask(task_player);
	SetMotion_(player, MOT_WAIT, BLEND_M);
	Wait_(60 - frame_sum);
	
	EndDemo(FADE_COLOR_BLACK);
}
