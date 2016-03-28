//=============================================
//
//		demo113[�K�[�h�}�X�^�[���j]
//
//=============================================
function Update()
{
	
	//=====================================
	//�v���C���[�ݒu
	//=====================================
	
	//ID�̎擾
	local player = GetPlayerId_();
	
	//�ݒu
	SetPointPos_(player, "player000");
	
	//�����̌���
	SetDir_(player, 0);
	
	//�\��
	SetFace_(player, "Face_grimace");
	
	//���l�̎蓮�ݒ�
	SetManualCalcAlpha_(player, true);
	
	//�����̃��l
	SetAlpha_(player, ALPHA_CLEAR);
	
	//=====================================
	//NPC�ݒu
	//=====================================
	
	//���\�[�X�̓ǂݍ���
	local npc_gur = ReadNpc_("m121_00");									//�K�[�h�}�X�^�[
	local npc_ace = ReadNpc_("n002");										// �G�[�X
	local player_Player_nod = ReadMotion_(player, "Player_nod");			//��l������
	local model_monitor00 = ReadGimmick_("o_A03_04");						//���j�^�[
	
	//�ݒu
	local res_gur = ArrangePointNpc_(npc_gur, "npc_guard000");
	local res_ace = ArrangePointNpc_(npc_ace, "npc_ace000");
	SetStepSe_(res_ace, SILENT_STEP_SE);									// �����𖳉��ɂ���
	
	//�����̌���
	SetDir_(res_gur, 180);
	SetDir_(res_ace, 0);
	
	//�T�C�Y�ݒ�
	SetScaleSilhouette(res_gur, SCALE.M, SILHOUETTE_WIDTH.M);
	
	//���l�̎蓮�ݒ�
	SetManualCalcAlpha_(res_ace, true);
	
	//�����̃��l
	SetAlpha_(res_ace, ALPHA_CLEAR);
	
	//=====================================
	//���[�V�����̓ǂݍ���
	//=====================================
	
	//�K�[�h�}�X�^�[
	local gur_death = ReadMotion_(res_gur, "m121_00_death");				//�K�[�h�}�X�^�[�����I
	
	//��l��
	local guard_player = ReadMotion_(player, "Player_guard_L");				//��l���g�\���遨�U�����;	//�퓬�ҋ@
	local turn_player = ReadMotion_(player, "Player_guard_turn");			//��l���g�\���遨�U�����
	local turnL_player = ReadMotion_(player, "Player_guard_turn_L");		//��l���g�\���遨�U�����L
	
	//�G�[�X
	local hyoko_ace = ReadMotion_(res_ace, "n002_show_face");				//�G�[�X�h�A�������o��
	local hyokoL_ace = ReadMotion_(res_ace, "n002_show_face_L");			//�G�[�X�h�A�������o�����[�v
	local sousa_ace = ReadMotion_(res_ace, "n002_operate_L");				//�G�[�X���쒆
	local up_ace = ReadMotion_(res_ace, "n002_look_up");					//�G�[�X���쒆�������
	local upL_ace = ReadMotion_(res_ace, "n002_look_up_L");					//�G�[�X�����	
	local folde_ace = ReadMotion_(res_ace, "n002_arm_folde");				// �G�[�X�r��g��
	local foldeL_ace = ReadMotion_(res_ace, "n002_arm_folde_L");			// �G�[�X�r��g��L
	local think_ace = ReadMotion_(res_ace, "n002_think");					// �G�[�X�r��g��
	local thinkL_ace = ReadMotion_(res_ace, "n002_think_L");				// �G�[�X�r��g��L
	local ace_runL = ReadMotion_(res_ace, "n001_run_L");					// �G�[�X����
	local handup_ace = ReadMotion_(res_ace, "n002_hand_up");				// �G�[�X���������
	local handupL_ace = ReadMotion_(res_ace, "n002_hand_up_L");				// �G�[�X���������L
	local talk_joy__ace = ReadMotion_(res_ace, "n002_talk_joy_L");			// �G�[�X��b(��������)
	
	//�����̃��[�V����
	SetMotion_(player, guard_player, BLEND_M);								//����l���g�\����
	SetMotion_(res_gur, gur_death, BLEND_M);								//���K�[�h�}�X�^�[���S
	
	//=====================================
	//�M�~�b�N�ݒu
	//=====================================
	
	local model_red_screen = ReadGimmick_("o_A03_06");
	local model_main_screen = ReadGimmick_("o_A03_04");
	local red_screen = ArrangeGimmick_("o_A03_06", model_red_screen, false);
	local main_screen = ArrangePointGimmick_("o_A03_04", model_main_screen, "obj_screen000");
	SetMotion_(red_screen, MOT_GIMMICK_0, BLEND_N);							// �_��ON

	local gimmick001 = ReadGimmick_("o_A03_00");
	local res_gimmick001 = ArrangePointGimmick_("o_A03_00", gimmick001, "obj_door001");
	SetMotion_(res_gimmick001, MOT_GIMMICK_2, BLEND_N);						// �d�q�h�A ��l���������Ă����Ƃ���(�J���Ă�����);
	
	//=====================================
	//�G�t�F�N�g�̓ǂݍ���
	//=====================================
	LoadEffect_("ef723_01_nat_explosion_n01");
	LoadEffect_("ef400_15_explosion_s_house");
	LoadEffect_("ef721_03_nat_smoke_n03");
	LoadEffect_("ef900_00_test_smoke");
	
	//��������������������������������������
	//���J�b�g1
	//��������������������������������������
	
	SetAlpha_(res_ace, 0);
	
	local task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");	//�K�[�h�}�X�^�[���B�e�p
	
	//=====================================
	//�t�F�[�h�C��
	//=====================================
	PlaySE_("SE_DEM_044");													//�K�[�h�}�X�^�[����

	SetFade_(FADE_IN, FADE_COLOR_BLACK, 30);
	WaitFade_();
	
	Wait_(50);																//�����S�G�t�F�N�g���I��邭�炢�܂ŃE�F�C�g�𒲐�
	
	local smoke_gur = SetSelectBoneEffect_("ef400_15_explosion_s_house", res_gur, ATTACH_GLOBAL);
	SetEffectScale_(smoke_gur, 1.0);
	Wait_(15);
	StartEarthQuake_(18, 3, 2);
	local death_gur = SetSelectBoneEffect_("ef723_01_nat_explosion_n01", res_gur, ATTACH_GLOBAL);
	SetEffectScale_(death_gur, 2.0);
	
	for(local i = 0; i <= 10; i++)
	{
		SetAlpha_(res_gur, ALPHA_EXIST - (i * 0.1));
		Wait_(1);
	}
	
	Wait_(8);
	
	StartEarthQuake_(10, 3, 1);
	
	Wait_(80);
	
	SetAlpha_(player, ALPHA_EXIST);
	
	//��������������������������������������
	//���J�b�g2
	//��������������������������������������
	DeleteTask_(task_cam);
	
	SetPointCameraEye_("cameye001");										//��l�����K�[�h
	SetPointCameraTarget_("camtgt001");
	
	local smoke_player = SetSelectBoneEffect_("ef721_03_nat_smoke_n03", player, ATTACH_GLOBAL);
	
	Wait_(30);
	
	//�G�[�X�@�h�A����Ђ傱��
	SetAlpha_(res_ace, ALPHA_EXIST);
	SetMotion_(res_ace, hyoko_ace, BLEND_N);
	Wait_(5);
	PlaySE_("SE_FLD_011");													//��SE:�G�[�X����
	WaitMotion(res_ace);
	SetMotion_(res_ace, hyokoL_ace, BLEND_M);
	
	//�G�[�X�u�ӂ����c�c�r�r�点�₪���āI
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ACE");
	ShowMsg_("DEMO_113_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	
	SetFace_(player, "Face_eyes_close");
	
	SetMotion_(player, turn_player, BLEND_M);								//��l���g�\���遨�U�����
	WaitMotion(player);
	SetMotion_(player, turnL_player, BLEND_M);
	
	//��������������������������������������
	//���J�b�g3
	//��������������������������������������
	SetPointCameraEye_("cameye003");										//�G�[�X�A�b�v�p
	SetPointCameraTarget_("camtgt003");
	
	//�G�[�X�u�ł��@����Ŏז������ꂸ��
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ACE");
	ShowMsg_("DEMO_113_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	
	//��������������������������������������
	//���J�b�g4
	//��������������������������������������
	local task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");	
	
	SetDir_(res_ace, 90);
	SetMotion_(res_ace, ace_runL, BLEND_M);
	PlaySE_("SE_FLD_011");									//��SE:�G�[�X����
	Wait_(3);
	local task_ace = Task_MoveForward_(res_ace, 1.0, true);
	Wait_(4);
	DeleteTask_(task_ace);
	SetDir_(res_ace, 0);
	local task = Task_MoveForward_(res_ace, 1.0, true);
	PlaySE_("SE_FLD_011");									//��SE:�G�[�X����
	Wait_(8);
	PlaySE_("SE_FLD_011");									//��SE:�G�[�X����
	SetMotion_(res_ace, MOT_WAIT, BLEND_XL);				//�G�[�X�ҋ@	
	Wait_(9);
	
	PosDebug(res_ace);										//�G�[�X�̑����Ă����ʒu�̍��W�擾

	DeleteTask_(task);
	
	local task = Task_RotateToPlayerSetMotion_(res_ace, 8.0, MOT_WALK, MOT_WAIT);		//�G�[�X��l���̕�������
	PlaySE_("SE_FLD_011");									//��SE:�G�[�X����
	WaitTask(task);

	Wait_(10);

	SetMotion_(res_ace, talk_joy__ace, BLEND_L);			//�G�[�X��b(��������)

	//�G�[�X�u<name_player/>�I�@����
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ACE");
	ShowMsg_("DEMO_113_MSG_030");
	KeyInputWait_();
	CloseMsgWnd_();
	
	SetMotion_(res_ace, MOT_WAIT, BLEND_L);					//�G�[�X�ҋ@
	
	Wait_(20);

	//��������������������������������������
	//���f���I��
	//��������������������������������������
	EndDemo(FADE_COLOR_BLACK);
	
}