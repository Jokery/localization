//=============================================
//
//		demo805[�f�B�X�N�}�V�[���̔閧]
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
	local task_aroma_step;
	local efc_seed;

// �����\�[�X�Ǎ�
	// �M�~�b�N
	local model_disc = ReadGimmick_("o_com_18");	// �f�B�X�N���u
	local model_sougen = ReadGimmick_("o_A01_05");	// �����p�l���i�N���O�j
	local model_houraku = ReadGimmick_("o_A01_06");	// �����p�l���i�N���O�j
	local model_boti = ReadGimmick_("o_A01_07");	// ��n�p�l���i�N���O�j
	local model_koori = ReadGimmick_("o_A01_08");	// �X�p�l���i�N���O�j
	local model_suna = ReadGimmick_("o_A01_09");	// ���p�l���i�N���O�j
	local model_kazan = ReadGimmick_("o_A01_10");	// �ΎR�p�l���i�N���O�j
	local model_door = ReadGimmick_("o_A01_16");	// �G���x�[�^�[�̔�(�������)
	// �L�����N�^�[
	local player = GetPlayerId_();					// ��l��
	local model_aroma = ReadNpc_("n018");			// �A���}

// ���z�u
	// �f�B�X�N���u
	local disc = ArrangePointGimmick_("o_com_18", model_disc, "obj_disc000");
	SetMotion_(disc, MOT_GIMMICK_2, BLEND_N);
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
	// �G���x�[�^�[�̔�(�������)
	local door0 = ArrangePointGimmick_("o_A01_16", model_door, "obj_door000");
	local door1 = ArrangePointGimmick_("o_A01_16", model_door, "obj_door001");
	
	// ��l��
	SetPointPos_(player, "player000");
	// �A���}
	local aroma = ArrangePointNpc_(model_aroma, "npc_aroma000");
	SetStepSe_(aroma, SILENT_STEP_SE);
	
	task_aroma = Task_AnimeMove_(aroma, "anm_aroma000");
	DeleteTask_(task_aroma);
	
// ����풓���[�V�����Ǎ�
	local player_talk = ReadMotion_(player, "Player_talk");				// �ʏ�ҋ@������ׂ�
	local player_talk_L = ReadMotion_(player, "Player_talk_L");			// ����ׂ�L
	
	local aroma_star_seed_L = ReadMotion_(aroma, "n018_star_seed_L");	// �X�^�[�V�[�h������L
	local aroma_look_down_L = ReadMotion_(aroma, "n018_look_down_L");	// �������ҋ@L

// ���J�����ݒ�
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");

//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------
	
	StartDemo(FADE_COLOR_BLACK);
	
	Wait_(15);
	
	task_aroma = Task_AnimeMove_(aroma, "anm_aroma000");	// 50F
	SetMotionSpeed_(aroma, 0.88);
	SetMotion_(aroma, MOT_WALK, BLEND_N);
	task_aroma_step = Task_PlaySe_("SE_FLD_016", 17);
	
	Wait_(35);
	
	task_player = Task_RotateToDir_(player, 110, ROTATE_DEMO_DEF);
	SetMotionSpeed_(player, 0.9);
	SetMotion_(player, MOT_WALK, BLEND_M);
	
	WaitTask(task_aroma);
	SetMotionSpeed_(aroma, 1.0);
	SetMotion_(aroma, MOT_WAIT, BLEND_L);
	Wait_(5);
	DeleteTask_(task_aroma_step);
	
	WaitTask(task_player);
	SetMotionSpeed_(player, 1.0);
	SetMotion_(player, MOT_WAIT, BLEND_L);
	
	Wait_(40);
	
	//��������������������������������������
	//���J�b�g2
	//��������������������������������������
	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");
	
	SetPointPos_(player, "player001");
	SetPointPos_(aroma, "npc_aroma001");
	SetDirToPlayer_(aroma);
	SetDirToObject_(player, aroma);
	
	Wait_(5);
	
	SetMotion_(aroma, MOT_TALK, BLEND_M);
	task_aroma = Task_ChangeMotion_(aroma, MOT_TALKLOOP, BLEND_S);
	
	Wait_(22);
	
	//===============================================
	// ���A���}
	// �u���炽�߂Č������ǁc�c�Y���_��
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_AROMA");
	ShowMsg_("DEMO_805_MSG_010");
	KeyInputWait_();
	
	//===============================================
	// ���A���}
	// �u���ʂɂ���Ă��@�����ɂȂ�Ȃ���ˁB
	//-----------------------------------------------
	ShowMsg_("DEMO_805_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	//��������������������������������������
	//���J�b�g3
	//��������������������������������������
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");	// 150F
	
	SetActive_(player, false);
	
	//===============================================
	// ���A���}
	// �u�ł��c�c���łɑ΍�́@�m������Ă��B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_AROMA");
	ShowMsg_("DEMO_805_MSG_030");
	KeyInputWait_();
	
	//===============================================
	// ���A���}
	// �u���ꂼ��@�����`�z�R�p���@�����_�c�~�p��
	//-----------------------------------------------
	ShowMsg_("DEMO_805_MSG_040");
	KeyInputWait_();
	
	//===============================================
	// ���A���}
	// �u���ꂪ����΁@�A���^�ЂƂ�ł�
	//-----------------------------------------------
	ShowMsg_("DEMO_805_MSG_050");
	KeyInputWait_();
	
	DeleteTask_(task_aroma);
	SetMotion_(aroma, aroma_look_down_L, 10);
	
	Wait_(5);
	
	//===============================================
	// ���A���}
	// �u�����ˁc�c���̂R�̃A�N�Z�T���[����
	//-----------------------------------------------
	ShowMsg_("DEMO_805_MSG_060");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	Wait_(20);
	
	WaitTask(task_cam);
	
	Wait_(5);

	//��������������������������������������
	//���J�b�g4
	//��������������������������������������
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");	// 150F
	
	SetMotion_(aroma, MOT_WAIT, BLEND_N);
	
	Wait_(40);
	
	//===============================================
	// ���A���}
	// �u�m���Ă�Ƃ͎v�����ǁ@�f�B�X�N�V�X�e������
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_AROMA");
	ShowMsg_("DEMO_805_MSG_070");
	KeyInputWait_();
	
	//===============================================
	// ���A���}
	// �u������@�A�N�Z�T���[�̂���@�ِ��E��
	//-----------------------------------------------
	ShowMsg_("DEMO_805_MSG_080");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	WaitTask(task_cam);
	
	Wait_(25);
	
	//��������������������������������������
	//���J�b�g5
	//��������������������������������������
	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");	// 300F
	
	SetActive_(player, true);
	
	Wait_(5);
	
	SetMotion_(player, player_talk, BLEND_M);
	WaitMotion(player);
	SetMotion_(player, player_talk_L, BLEND_S);
	
	Wait_(48);
	
	SetMotion_(player, MOT_WAIT, 10);
	
	Wait_(11);
	
	SetMotion_(aroma, MOT_TALK, BLEND_M);
	task_aroma = Task_ChangeMotion_(aroma, MOT_TALKLOOP, BLEND_S);
	
	Wait_(15);
	
	//===============================================
	// ���A���}
	// �u�A�N�Z�T���[�̂���@�ِ��E�֍s��
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_AROMA");
	ShowMsg_("DEMO_805_MSG_090");
	KeyInputWait_();
	
	//===============================================
	// ���A���}
	// �u�����ā@���̃f�B�X�N�V�X�e���ɂ�
	//-----------------------------------------------
	ShowMsg_("DEMO_805_MSG_100");
	KeyInputWait_();
	
	//===============================================
	// ���A���}
	// �u���b�N���@�������Ă���悤������
	// �@���̃A�^�V�Ɂ@������΁c�c�I
	//-----------------------------------------------
	ShowMsg_("DEMO_805_MSG_103");
	KeyInputWait_();
	CloseMsgWnd_();
	//-----------------------------------------------
	SetMotion_(aroma, MOT_WAIT, 10);
	Wait_(20);
	SetMotion_(aroma, MOT_WALK, BLEND_M);
	task_aroma = Task_RotateToDir_(aroma, -90, 5.7);
	task_aroma_step = Task_PlaySe_("SE_FLD_016", 15);
	WaitTask(task_aroma);
	task_aroma = Task_MoveForward_(aroma, 1.0, false);				//�A���}�ړ�
	Wait_(20);

	SetMotion_(player, MOT_WALK, BLEND_M);
	task_player = Task_RotateToDir_(player, -90, 5.7);				//��l������
	WaitTask(task_player);
	SetMotion_(player, MOT_WAIT, BLEND_M);
	Wait_(20);
	//�t�F�[�h�A�E�g---------------------------------------------------------------------
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 30);
	WaitFade_();
	SetMotion_(aroma, MOT_WAIT, BLEND_M);
	DeleteTask_(task_aroma);
	DeleteTask_(task_aroma_step);
	Wait_(30);
	PlaySE_("SE_DEM_012");					//��SE�F�G�[�X�̃��A�N�^�[������
	Wait_(100);
	DeleteTask_(task_cam);
	//��������������������������������������
	//���J�b�g6
	//��������������������������������������
	SetPointPos_(player, "player002");
	SetPointPos_(aroma, "npc_aroma002");
	SetFace_(aroma, "Face_smile");
	task_cam = Task_AnimeMoveCamera_("anmeye003", "anmtgt003");		// 200F

	//�t�F�[�h�C��---------------------------------------------------------------------
	SetFade_(FADE_IN, FADE_COLOR_BLACK, 30);
	WaitFade_();
	
	SetMotion_(aroma, MOT_TALK, BLEND_M);
	task_aroma = Task_ChangeMotion_(aroma, MOT_TALKLOOP, BLEND_S);
	//===============================================
	// ���A���}
	// �u�J���b�y�L�I�@����ł����@�D���Ȏ���
	// �@�f�B�X�N���@����悤�ɂȂ�����I
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_AROMA");
	ShowMsg_("DEMO_805_MSG_106");
	KeyInputWait_();
	
	//===============================================
	// ���A���}
	// �u�l�`�o�ȃf�B�X�N���@���ɂ�������
	//-----------------------------------------------
	ShowMsg_("DEMO_805_MSG_110");
	KeyInputWait_();
	
	//===============================================
	// ���A���}
	// �u�L�[���[�h���@�g�ݍ��킹�ā@�f�B�X�N��
	//-----------------------------------------------
	ShowMsg_("DEMO_805_MSG_120");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetMotion_(aroma, MOT_WAIT, 10);
	
	Wait_(40);
	DeleteTask_(task_aroma);
	DeleteTask_(task_cam);	
	//��������������������������������������
	//���J�b�g7
	//��������������������������������������
	SetPointCameraEye_("cameye003");
	SetPointCameraTarget_("camtgt003");

	Wait_(5);
	
	SetMotion_(aroma, MOT_TALK, BLEND_M);
	task_aroma = Task_ChangeMotion_(aroma, MOT_TALKLOOP, BLEND_XL);
	
	Wait_(22);
	
	//===============================================
	// ���A���}
	// �u���Ƃ��΁c�c���́��L�[���[�h�P����
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_AROMA");
	ShowMsg_("DEMO_805_MSG_130");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	Wait_(20);
	
	DeleteTask_(task_aroma);
	SetMotion_(aroma, MOT_WAIT, BLEND_XL);	
	Wait_(20);	
	SetMotion_(aroma, aroma_star_seed_L, BLEND_XL);
	
	Wait_(25);
	//===============================================
	// ���V�X�e�����b�Z�[�W
	// �L�[���[�h�@���L�[���[�h�P����
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_805_MSG_140");
	PlayMe_("ME_010");
	WaitMe_();
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	Wait_(15);
	
	SetMotion_(aroma, MOT_TALK, BLEND_XL);
	SetMotionSpeed_(aroma, 0.9);
	task_aroma = Task_ChangeMotion_(aroma, MOT_TALKLOOP, BLEND_L);
	
	Wait_(20);
	
	//===============================================
	// ���A���}
	// �u�f�B�X�N�����Ƃ��ɂ́@�S�[���h���K�v�Ȃ́B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_AROMA");
	ShowMsg_("DEMO_805_MSG_150");
	KeyInputWait_();
	//-----------------------------------------------
	// ��
	// �u����������@�A�^�V�Ɍ�����̂�B
	//-----------------------------------------------
	ShowMsg_("DEMO_805_MSG_160");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	DeleteTask_(task_aroma);
	
	SetMotion_(aroma, MOT_WAIT, 10);
	
	Wait_(40);
	
	EndDemo(FADE_COLOR_BLACK);
}
