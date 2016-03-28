//=============================================
//
//		demo812[��_�̕���]
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
	local task_cam, task_player, task_aroma;
	local efc_player, efc_door000;

// �����\�[�X�Ǎ�
	// �L�����N�^�[
	local player = GetPlayerId_();							// ��l��
	local model_aroma = ReadNpc_("n018");					// �A���}
	// �G�t�F�N�g
	LoadEffect_("ef881_06_door_r");		// ���̌� ��

// ���z�u
	// ��l��
	SetPointPos_(player, "player000");
	local aroma = ArrangePointNpc_(model_aroma, "npc_aroma000");

	//	���M�~�b�N�̓ǂݍ���
	local model_red_door = ReadGimmick_("o_U00_05");		// ��:�Ԕ�
	local model_center_door = ReadGimmick_("o_U00_06");		// ��:�O�� ����
	local model_left_door = ReadGimmick_("o_U00_06");		// ��:�O�� ��
	local model_right_door = ReadGimmick_("o_U00_06");		// ��:�O�� �E
	local model_green_door00 = ReadGimmick_("o_U00_09");	// ��:�Δ�
	local model_green_door01 = ReadGimmick_("o_U00_10");	// ��:�Δ�

	local model_warp_center = ReadGimmick_("o_com_35");		// ���������O(��)
	local model_warp_right = ReadGimmick_("o_com_36");		// ���������O(��)
	local model_warp_left = ReadGimmick_("o_com_37");		// ���������O(��)
	
//	���M�~�b�N�̓ǂݍ���
	local center_door = ArrangePointGimmick_("o_U00_06", model_center_door, "obj_center");				//��:�O�� ����
	local left_door = ArrangePointGimmick_("o_U00_06", model_left_door, "obj_left");					//��:�O�� ��
	local right_door = ArrangePointGimmick_("o_U00_06", model_right_door, "obj_right");				//��:�O�� �E
	
	local red_door = ArrangePointGimmick_("o_U00_05", model_red_door, "obj_U00_05");					//��:�Ԕ�
	local green_door00 = ArrangePointGimmick_("o_U00_09", model_green_door00, "obj_U00_09");			//��:�Δ�
	local green_door01 = ArrangePointGimmick_("o_U00_10", model_green_door01, "obj_U00_10");			//��:�Δ�

	local warp_center = ArrangePointGimmick_("o_com_35", model_warp_center, "obj_warp_center000");		// ���������O(��)
	local warp_right = ArrangePointGimmick_("o_com_36", model_warp_right, "obj_warp_right000");			// ���������O(��)
	local warp_left = ArrangePointGimmick_("o_com_37", model_warp_left, "obj_warp_left000");			// ���������O(��)
	
//	���J�����ݒ�
	local density = GetFogDensity_();
	SetFogDensity_(0.5);
	local distmax = GetFogDistMax_();
	SetFogDistMax_(10000.0);
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");					// �n�k�J������
//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------
	//===============================================
	//�J�b�g1
	//===============================================
	StartDemo(FADE_COLOR_BLACK);

	SetMotion_(red_door, MOT_GIMMICK_1, BLEND_XL);								// �P�ڔ����J��
	PlaySE_("SE_DEM_196");
	SetMotionSpeed_(red_door, 0.6);
	Wait_(45);
	efc_door000 = SetPointWorldEffect_("ef881_06_door_r", "efc_door000");
	SetMotionSpeed_(red_door, 0.3);
	Wait_(35);
	PlaySE_("SE_DEM_197");
	Wait_(70);
	SetMotionSpeed_(red_door, 0.4);
	WaitMotion(red_door);
	Wait_(15);
	//=====================
	//��ڂ̔����J��
	//=====================
	SetMotion_(center_door, MOT_GIMMICK_1, BLEND_M);							// 2�ڔ����J��
	PlaySE_("SE_DEM_197");
	SetMotionSpeed_(center_door, 0.4);
	WaitMotion(center_door);

	WaitTask(task_cam);
	Wait_(40);
	//===============================================
	//�J�b�g2
	//===============================================
	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");
	
	task_aroma = Task_WalkAroundToPos(aroma, GetPos_(player), 5.7)
	task_player = Task_WalkAroundToPos(player, GetPos_(aroma), 5.7)
	WaitTask(task_aroma);

	SetMotion_(aroma, MOT_WAIT, BLEND_L);		//�A���}�ҋ@���[�V����
	SetMotion_(player, MOT_WAIT, BLEND_L);		//��l���ҋ@���[�V����
	WaitTask(task_aroma);
	WaitTask(task_player);
	Wait_(10);
	
	//===============================================
	// ���A���}
	// �u����̗􂯖ڂ̕�����@����������B�@����ŋ�̐_�z�A�J���Ɓ@�킦����B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_AROMA");
	ShowMsg_("DEMO_812_MSG_010");
	KeyInputWait_();
	//�u�A���^�̏������@�F���Ă��B�@����΂�Ȃ�����@<name_player/>�I
	ShowMsg_("DEMO_812_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//-----------------------------------------------
	Wait_(30);
	
//	EndDemo(FADE_COLOR_BLACK);
	EndDemoBgmFade_(FADE_DEF);
	
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
	WaitFade_();
	SetFogDensity_(density);
	SetFogDistMax_(distmax);
	DeleteAllTask_();
	SetSepiaColor_(false);
	End_();
}
