//=============================================
//
//		demo110[�J�[�h�L�[A��T��_1]
//
//=============================================
function Update()
{
	//=====================================
	//���[�J���ϐ��̐ݒ�
	//=====================================
	local task_cam, task_player, task_ace;
	local task_ace_step;
	
	//=====================================
	//�M�~�b�N�ݒu
	//=====================================
	local model_eledoor = ReadGimmick_("o_A03_01");																// �G���x�[�^�[��
	local model_door03 = ReadGimmick_("o_A03_00");																// �d�q�h�A
	local eledoor = ArrangePointGimmick_("o_A03_01", model_eledoor, "obj_elevator001");							// �G���x�[�^�[��
	local door03 = ArrangePointGimmick_("o_A03_00", model_door03, "obj_door000");								// �d�q�h�A
	
	//=====================================
	//�v���C���[�ݒu
	//=====================================
	
	//ID�̎擾
	local player = GetPlayerId_();
	
	//�ݒu
	SetPointPos_(player, "player000");
	
	//�����̌���
	SetDir_(player, 90);
	
	//���[�V�����̓ǂݍ���
	local battlewait = ReadMotion_(player, "Player_battle_L");					//�퓬�ҋ@
	local look_walk = ReadMotion_(player, "Player_look_walk_L");				//�L��������
	local pl_look_around_L = ReadMotion_(player, "Player_look_around_L");		// ��l���@�L�����L����L
	local pl_cage_turn_L = ReadMotion_(player, "Player_cage_turn_L");			// ��l���@�U�����
	local pl_look_left_L = ReadMotion_(player, "Player_look_left_L");			// ��l���@���������������L
	
	//�����̃��[�V����
	SetMotion_(player, MOT_WAIT, 15);
	
	//���l�̎蓮�ݒ�
	SetManualCalcAlpha_(player, true);
	
	//�����̃��l
	SetAlpha_(player, 1.0);
	
	//=====================================
	//NPC�ݒu
	//=====================================
	
	//���\�[�X�̓ǂݍ���
	local npc_kil = ReadNpc_("m120_00");										// ���^���n���^�[
	local npc_ace = ReadNpc_("n002");											// �G�[�X
	
	//�ݒu
	local res_kil = ArrangePointNpc_(npc_kil, "npc_hunter000");
	local res_ace = ArrangePointNpc_(npc_ace, "npc_ace000");
	
	//�����̌���
	SetDir_(res_kil, 270);
	SetDir_(res_ace, 90);
	
	//�T�C�Y�ݒ�
	SetScaleSilhouette(res_kil, SCALE.N, SILHOUETTE_WIDTH.N);
	
	//���l�̎蓮�ݒ�
	SetManualCalcAlpha_(res_ace, true);
	
	//�����̃��l
	SetAlpha_(res_ace, 1.0);
	
	//=====================================
	//���[�V�����̓ǂݍ���
	//=====================================
	
	local bibiriwalk_ace = ReadMotion_(res_ace, "n002_walk01_L");				//�G�[�X��������
	local bibirilook_ace = ReadMotion_(res_ace, "n002_look_araund_L");			//�G�[�X��������
	local shock_ace = ReadMotion_(res_ace, "n002_shock");						//�G�[�X������������
	local shockL_ace = ReadMotion_(res_ace, "n002_shock_L");					//�G�[�X������
	local ac_talk_joy_L = ReadMotion_(res_ace, "n002_talk_joy_L");				// �G�[�X�@��b�i���������jL
	local ac_look_araund_L = ReadMotion_(res_ace, "n002_look_araund_L");		// �G�[�X�@�ӂ������L�i���т��������j
	local ac_look_araund2_L = ReadMotion_(res_ace, "n002_look_araund02_L");		// �G�[�X�@�ӂ������L�i���ʂɃL�����L�����j
	local ac_surprise = ReadMotion_(res_ace, "n000_surprise");					// �G�[�X�@�ʏ�ҋ@������
	local ac_surprise_L = ReadMotion_(res_ace, "n000_surprise_L");				// �G�[�X�@����L
	local ac_look_player = ReadMotion_(res_ace, "n002_look_player");			// �G�[�X�@�ҋ@����l��������
	local ac_look_player_L = ReadMotion_(res_ace, "n002_look_player_L");		// �G�[�X�@��l��������L
	local ac_run_L = ReadMotion_(res_ace, "n001_run_L");						// �G�[�X�@����L
	local ac_impatience_L = ReadMotion_(res_ace, "n002_impatience_L");			// �G�[�X�@�ł�L
	local folde_ace = ReadMotion_(res_ace, "n002_arm_folde");					// �G�[�X�r��g��
	local foldeL_ace = ReadMotion_(res_ace, "n002_arm_folde_L");				// �G�[�X�r��g��L
	local think_ace = ReadMotion_(res_ace, "n002_think");						// �G�[�X�l����
	local thinkL_ace = ReadMotion_(res_ace, "n002_think_L");					// �G�[�X�l����L	
	
	local kil_search_L = ReadMotion_(res_kil, "m120_01_search_L");				// ���^���n���^�[�@�L�����L����
	
	//=====================================
	//�G�t�F�N�g�̓ǂݍ���
	//=====================================
	LoadEffect_("ef712_10_emo_surprise01");										//[!]
	LoadEffect_("ef712_13_emo_sweat01");										// ���G�t�F�N�g�ǂݍ���
	
	//��������������������������������������
	//���J�b�g1
	//��������������������������������������
	local task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");
	
	//=====================================
	//�t�F�[�h�C��
	//=====================================
	StartDemo(FADE_COLOR_BLACK);
	
	//=====================================
	//��b�J�n
	//=====================================
	
	SetMotion_(eledoor, MOT_GIMMICK_1, 0);
	PlaySE_("SE_DEM_041");
	WaitMotion(eledoor);
	SetMotion_(eledoor, MOT_GIMMICK_2, 0);
	WaitMotion(eledoor);
	SetMotion_(player, MOT_WALK, BLEND_M);
	SetMotion_(res_ace, MOT_WALK, BLEND_M);
	
	//�����X�s�[�h
	local task1 = Task_MoveForward_(res_ace, 1.05, false);
	Wait_(1);
	local task2 = Task_MoveForward_(player, 1.0, false);
	Wait_(110);
	
	//�G�[�X�X�g�b�v
	DeleteTask_(task1);
	SetDir_(res_ace, 70);
	SetMotion_(res_ace, ac_look_araund2_L, BLEND_L);		//�G�[�X���ʂɃL�����L����
	
	Wait_(15);
	
	//��l���X�g�b�v
	DeleteTask_(task2);
	SetDir_(player, 90);
	SetMotion_(player, MOT_WAIT, BLEND_L);					//��l���@�ҋ@

	WaitFade_();

	//�G�[�X�u���āA�ŏ�K�ɍs�����߂ɂ́E�E�E
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ACE");
	ShowMsg_("DEMO_110_MSG_010");
		
	SetMotion_(player, pl_look_around_L, BLEND_L);			//��l�����ʂɃL�����L����
	KeyInputWait_();
	CloseMsgWnd_();
	
	Wait_(20);
	
	//��������������������������������������
	//���J�b�g2
	//��������������������������������������
	DeleteTask_(task_cam);
	
	local task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");
	
	task_player = Task_RotateToPos_(player, GetPos_(door03), 229);
	task_ace = Task_RotateToPos_(res_ace, GetPos_(door03), 229);
	SetMotion_(player, MOT_WAIT, BLEND_M);
	SetMotion_(res_ace, ac_talk_joy_L, BLEND_M);
	
	OpenMsgWnd_();
	
	SetTalkName_("NAME_TAG_ACE");
	ShowMsg_("DEMO_110_MSG_020");
	KeyInputWait_();
	
	ShowMsg_("DEMO_110_MSG_030");
	KeyInputWait_();
	
	CloseMsgWnd_();
	
	//��������������������������������������
	//�����ɋ삯���G�[�X�̃J�b�g
	//��������������������������������������
	SetMotion_(res_ace, ac_run_L, BLEND_M);
	task_ace = Task_AnimeMove_(res_ace, "anm_ace000");
	task_ace_step = Task_PlaySe_("SE_FLD_011", 7);
	WaitTask(task_ace);
	
	task_ace = Task_RotateToPos_(res_ace, GetPos_(door03), 172);
	SetMotion_(res_ace, ac_impatience_L, BLEND_M);
	DeleteTask_(task_ace_step);
	
	//��������������������������������������
	//���J�b�g2
	//��������������������������������������
	DeleteTask_(task_cam);
	
	SetPointCameraEye_("cameye002");
	SetPointCameraTarget_("camtgt002");
	
	SetMotion_(player, MOT_WALK, BLEND_M);
	task_player = Task_AnimeMove_(player, "anm_player000");
	WaitTask(task_player);
	SetMotion_(player, MOT_WAIT, BLEND_M);
	
	// ���G�t�F�N�g
	local sweat = SetSelectBoneEffect_("ef712_13_emo_sweat01", res_ace, ATTACH_EFFECT1);
	
	//�G�[�X�u�ʂ����I�@�J���Ȃ����[���I�H
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ACE");
	ShowMsg_("DEMO_110_MSG_040");
	KeyInputWait_();
	CloseMsgWnd_();
	
	Wait_(20);
	DeleteEffect_(sweat);													//������
	SetMotion_(res_ace, think_ace, BLEND_M);								//�G�[�X�l����	
	WaitMotion(res_ace);
	SetMotion_(res_ace, thinkL_ace, BLEND_M);								//�G�[�X�l����
	
	//��������������������������������������
	//���J�b�g3
	//��������������������������������������
	DeleteTask_(task_cam);
	SetMotion_(door03, MOT_GIMMICK_2, 0);
	
	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");
	
	SetDir_(res_ace, 165);
	SetDir_(player, 195);
	
	OpenMsgWnd_();
	//�G�[�X�u�����́c�c�������邽�߂�
	SetTalkName_("NAME_TAG_ACE");
	ShowMsg_("DEMO_110_MSG_050");
	KeyInputWait_();
	
	local task_npc00 = Task_AnimeMoveNoFitSetMotion_(res_kil, "anm_hunter000", MOT_WALK, kil_search_L);	//���^�n���o��
	SetMotion_(res_kil, MOT_WALK, BLEND_M);
	
	//�G�[�X�u�ǂ����Ł@�J�[�h�L�[���c�c
	ShowMsg_("DEMO_110_MSG_060");
	
	SetMotion_(res_ace, ac_look_player_L, BLEND_XL);					//�G�[�X��l��������
	
	KeyInputWait_();
	CloseMsgWnd_();
	
	WaitTask(task_npc00);
	
	SurpriseDisp(res_ace);												//��l�����G�[�X�u�I�v
	SurpriseDisp(player);
	SetDir_(player, 30);
	SetDir_(res_ace, 30);
	SetMotion_(player, pl_cage_turn_L, BLEND_M);
	
	// ���G�t�F�N�g
	local sweat = SetSelectBoneEffect_("ef712_13_emo_sweat01", res_ace, ATTACH_EFFECT1);
	
	SetMotion_(res_ace, ac_surprise, BLEND_M);
	Wait_(10);
	SetMotion_(res_ace, ac_surprise_L, BLEND_M);
	Wait_(45);
	
	//��������������������������������������
	//���J�b�g4		���^�n���A�b�v
	//��������������������������������������
	local task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");

	//�G�[�X�u���Ђ����I�H	
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ACE");
	ShowMsg_("DEMO_110_MSG_070");
	KeyInputWait_();

	//�G�[�X�u���c�c���������������@���邩��
	ShowMsg_("DEMO_110_MSG_080");
	KeyInputWait_();
	CloseMsgWnd_();

	//��������������������������������������
	//���J�b�g5
	//��������������������������������������
	DeleteTask_(task_cam);
	
	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");
	
	SetDir_(res_ace, 53);												//�G�[�X��l���֕����]��
	
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ACE");
	//�G�[�X�u���͂������Ȃт�������Ă������I
	ShowMsg_("DEMO_110_MSG_090");
	
	SetMotion_(res_ace, ac_run_L, BLEND_M);								//����
	local task_ace = Task_MoveForward_(res_ace, 1.0, true);				//�G�[�X��l���ɋ߂Â�
	Wait_(3);
	DeleteTask_(task_ace);
	SetDir_(res_ace, 15);
	SetMotion_(res_ace, shockL_ace, 0);									//�����\��

	KeyInputWait_();
	CloseMsgWnd_();
	
	//��������������������������������������
	//���f���I��
	//��������������������������������������
	
	EndDemo(FADE_COLOR_BLACK);
}