//=============================================
//
//		demo313[��]�Ƃ͂Ȃ񂼂�]
//
//=============================================

function Update()
{
	//=====================================
	//���[�J���ϐ��̐ݒ�
	//=====================================
	local task_cam, task_cam2, task_player, task_todo, task_okiduti;	//�^�X�N�֌W�̕ϐ�
	local task_todoSe;													//�^�X�N�֌W(����)�̕ϐ�
	local efc_cam, efc_player, efc_todo, efc_okiduti;					//�G�t�F�N�g�֌W�̕ϐ�
	local player, nochoM00;												//�L�����N�^�[�̕ϐ�
	local flg;															//�f���I���p�ϐ�
	
	//=====================================
	//�G�t�F�N�g�ǂݍ���
	//=====================================
	LoadEffect_("ef733_01_sym_shuchusen01");									// �W���D
	LoadEffect_("ef712_13_emo_sweat01")		;							// ��
	
	//=====================================
	//�M�~�b�N�ݒu
	//=====================================
	
	//=====================================
	//���\�[�X�ǂݍ���
	//=====================================
	
	//��l���iID�̎擾�j
	player = GetPlayerId_();
	
	//NPC
	local model_todo = ReadNpc_("n039");								//�g�[�h�[�e��
	local model_okiduti = ReadNpc_("m035_00")							// �������Â��i�g�[�h�[�q���j
	
	//=====================================
	//�ݒu
	//=====================================
	
	//��l��
	SetPointPos_(player, "player000");
	
	//NPC
	local todo = ArrangePointNpc_(model_todo, "npc_todo000");
	local okiduti = ArrangePointNpc_(model_okiduti, "npc_okiduti000");
	SetDir_(okiduti, -200);
	
	//�����̌���
	task_player = Task_RotateToPos_(player, GetPos_(todo), 286.5);
	
	//�T�C�Y�ݒ�
	SetScaleSilhouette(todo, SCALE.TODO, 0.5);
	SetScaleSilhouette(okiduti, SCALE.N, SILHOUETTE_WIDTH.N);
	
	//=====================================
	//��풍���[�V�����ǂݍ���
	//=====================================
	// ��l��
	local pl_talk_L = ReadMotion_(player, "Player_talk_L");						//	�b��L
	local pl_lookup_L = ReadMotion_(player, "Player_look_up_L");				//	��l�� ���グ��
	local pl_look_r_L = ReadMotion_(player, "Player_look_right_L");				//	��l�� �E�i�g�[�h�[�j������

	//	�g�[�h�[
	local todo_arm_folde_L = ReadMotion_(todo, "m141_00_arm_folde01_L");		//	�r�g��1L�i�ڕ��j
	local todo_talk_ang = ReadMotion_(todo, "m141_00_talk");					//	�r�g��1���{���b
	local todo_talk_ang_L = ReadMotion_(todo, "m141_00_talk_L");				//	�{���bL
	local todo_arm_above_L = ReadMotion_(todo, "m141_00_arm_above_L");			//	�r�g�ݏ������L
	local todo_arm_folde2_L = ReadMotion_(todo, "m141_00_arm_folde02_L");		//	�r�g��2L�i�ڊJ���j
	local todooyabun_run = ReadMotion_(todo, "n039_run");						//	����i�g�[�h�[�e���p�j

	//	�������Â�
	local oki_sup = ReadMotion_(okiduti, "m035_00_surprise");					//	�ҋ@���������ҋ@
	
	//=====================================
	//�������[�V����
	//=====================================
	SetMotion_(player, pl_talk_L, BLEND_N);										//��l���@�b��
	SetMotion_(todo, todo_arm_folde_L, BLEND_N);								//�g�h�@�r�g�ݑҋ@
	
	//��������������������������������������
	//���J�b�g�P�@��l������
	//��������������������������������������	
	
	//�`�`�`�`�`�`�`�`�`�J�����`�`�`�`�`�`�`�`�`�`�`
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");
	StartDemo(FADE_COLOR_BLACK);

	WaitTask(task_cam);
	SetMotion_(player, pl_lookup_L, BLEND_XL);									//��l���@���グ��
	Wait_(40);
	
	//��������������������������������������
	//���J�b�g2�@�g�[�h�[�A�b�v�u��]���ƁI�H
	//��������������������������������������
	DeleteTask_(task_cam);
	//�`�`�`�`�`�`�`�`�`�J�����`�`�`�`�`�`�`�`�`�`�`
	task_cam = Task_AnimeMoveCamera_("anmeye004", "anmtgt004");
	InitSilhouetteWidth_(todo, 0.9);
	
	SetMotion_(todo, todo_talk_ang, BLEND_M);									//�g�[�h�[�ڂ��J���{��b
	PlaySE_("SE_DEM_026");	// ��SE:�W����
	efc_cam = SetCameraEffect_("ef733_01_sym_shuchusen01", 100);
	WaitMotion(todo);
	SetMotion_(todo, todo_talk_ang_L, BLEND_M);									//�{��bL
	Wait_(10);
	
	efc_todo = SetPointWorldEffect_("ef712_13_emo_sweat01", "efc_sweat000");	// �΁i���G�t�F�N�g�j
	SetEffectScale_(efc_todo, 2.0);	
	//===============================================
	//���g�[�h�[
	//�u�Ȃɂ��I�@��]���@��ɓ���邾�ƁI�H
	//�@�z���@�����@�����Ă����񂩁I�H
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_TODO");
	ShowMsg_("DEMO_313_MSG_010");
	SetMotion_(player, MOT_WAIT, BLEND_M);										//��l���ҋ@
	KeyInputWait_();
	//===============================================
	
	DeleteEffectEmitter_(efc_cam);
	DeleteEffectEmitter_(efc_todo);
	WaitTask(task_cam);
	
	//��������������������������������������
	//���J�b�g3�@���グ��g�[�h�[
	//��������������������������������������
	//�`�`�`�`�`�`�`�`�`�J�����`�`�`�`�`�`�`�`�`�`�`
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");
	Wait_(10);
	SetMotion_(todo, todo_arm_folde2_L, BLEND_XL);								//�g�h�@�r�g��
	Wait_(20);
	SetMotion_(todo, todo_arm_folde_L, BLEND_XL);								//�g�h�@�r�g�݁@�ڕ�
	
	//===============================================
	//���g�[�h�[
	//�u��]�c�c�����́@���̒n���������@���L����
	//�@���V��Ɂ@�c���Ă��ꂽ�@���镨�̂��Ƃ���B
	//-----------------------------------------------
	ShowMsg_("DEMO_313_MSG_020");
	KeyInputWait_();
	//===============================================
	
	Wait_(25);
	
	//===============================================
	//���g�[�h�[
	//�u��]���@������@���E��ς���c�c�B
	//�@����ȕ��Ɂ@�����Ă������B
	//-----------------------------------------------
	SetMotion_(todo, todo_arm_above_L, BLEND_XL);								//�g�h�@�r�g�ݏ������L	
	
	ShowMsg_("DEMO_313_MSG_030");	
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	WaitTask(task_cam);
	
	//��������������������������������������
	//���J�b�g4�@�g�[�h�[�A�b�v
	//��������������������������������������
	//�`�`�`�`�`�`�`�`�`�J�����`�`�`�`�`�`�`�`�`�`�`	
	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");
	Wait_(10);
	
	//===============================================
	//���g�[�h�[
	//�u�����@���̘b�c�c���V��
	//�@�V���o�[�����@�m��ʂ͂��Ȃ񂶂�B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_TODO");
	ShowMsg_("DEMO_313_MSG_040");	
	SetMotion_(todo, todo_talk_ang_L, BLEND_L);										//�{��bL
	KeyInputWait_();
	//===============================================
	SetMotion_(todo, todo_arm_folde2_L, BLEND_XL);								//�g�h�@�r�g��
	
	//===============================================
	//���g�[�h�[
	//�u�C�G�^�X�́@��]�̂��Ƃ��@�ǂ��Œm�����H
	//�@��͂�@�������@���������̂��c�c�B
	//-----------------------------------------------
	ShowMsg_("DEMO_313_MSG_050");
	Wait_(20);
	SetMotion_(todo, todo_arm_folde_L, BLEND_XL);								//�g�h�@�r�g�݁@�ڕ�
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	Wait_(30);
	
	//��������������������������������������
	//���J�b�g5�@�������Â��J�����C��
	//��������������������������������������
	DeleteTask_(task_cam);

	//�`�`�`�`�`�`�`�`�`�J�����`�`�`�`�`�`�`�`�`�`�`
	task_cam = Task_AnimeMoveCamera_("anmeye003", "anmtgt003");

	//�������Â�����
	task_okiduti = Task_AnimeMove_(okiduti, "anm_okiduti000");
	SetMotion_(okiduti, MOT_RUN, BLEND_N);
	efc_okiduti = SetSelectBoneEffectSetOffset_("ef712_13_emo_sweat01", okiduti, ATTACH_EFFECT2, Vec3(0.0, 11.0, 0.0));		// ���G�t�F�N�g
	SetEffectScale_(efc_okiduti, 4.0);
	SetPointPos_(player, "player002");
	PlaySE_("SE_FLD_031");	// ����
	
	Wait_(55);
	SetMotion_(okiduti, oki_sup, BLEND_M);											//���q���ł�
	InitSilhouetteWidth_(okiduti, 0.8);
	WaitTask(task_cam);
	
	StopBgm_(18);
	//===============================================
	//*�g�[�h�[�̎q��
	//�u��ς��I�@�C�G�^�X�t�@�~���[�̘A����
	//�@�e�����o���Ɓ@�J�`�R�~�@�����Ă��₪�����I
	//-----------------------------------------------
	SetMotion_(okiduti, MOT_WAIT, BLEND_M);
	PlaySE_("SE_FLD_031");	// ����
	OpenMsgWnd_();
	ShowMsg_("DEMO_313_MSG_060");	
	KeyInputWait_();	
	CloseMsgWnd_();
	//===============================================
	
	//��������������������������������������
	//���J�b�g6�@�g�[�h�[�E�h�E�A�b�v
	//��������������������������������������
	DeleteTask_(task_cam);
	//�`�`�`�`�`�`�`�`�`�J�����`�`�`�`�`�`�`�`�`�`�`
	task_cam = Task_AnimeMoveCamera_("anmeye004", "anmtgt004");
	Wait_(15);	
	
	efc_cam = SetCameraEffect_("ef733_01_sym_shuchusen01", 100);
	
	PlayBgm_("BGM_021");
	SetMotion_(todo, todo_talk_ang, BLEND_M);										//�g�[�h�[�ڂ��J���{��b
	WaitMotion(todo);
	SetMotion_(todo, todo_talk_ang_L, BLEND_N);										//�{��bL
	Wait_(10);
	efc_todo = SetPointWorldEffect_("ef712_13_emo_sweat01", "efc_sweat000");		// �΁i���G�t�F�N�g�j
	SetEffectScale_(efc_todo, 2.0);

	//===============================================
	//���g�[�h�[
	//�u���������I�@�������z�炶��I
	//�@�������@���Ă�������킢�I
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_TODO");
	ShowMsg_("DEMO_313_MSG_070");
	KeyInputWait_();
	CloseMsgWnd_();
	Wait_(10);
	DeleteTask_(task_cam);
	DeleteEffectEmitter_(efc_cam);
	DeleteEffect_(efc_todo);
	DeleteEffect_(efc_okiduti);
	task_todo = Task_AnimeMove_(todo, "anm_todo000");
	task_okiduti = Task_AnimeMove_(okiduti, "anm_okiduti001");
	SetMotion_(todo, todooyabun_run, BLEND_N);
	SetMotion_(okiduti, MOT_RUN, BLEND_N);


	//��������������������������������������
	//���J�b�g7�@��������o��e���Ǝq��
	//��������������������������������������
	InitSilhouetteWidth_(todo, 1.3);
	//�`�`�`�`�`�`�`�`�`�J�����`�`�`�`�`�`�`�`�`�`�`
	task_cam = Task_AnimeMoveCamera_("anmeye005", "anmtgt005");
	SetPointPos_(okiduti, "npc_okiduti001");
	PlaySE_("SE_FLD_031");	// ����

	Wait_(4);
	PlaySE_("SE_FLD_029");	// ����
	task_todoSe = Task_PlaySe_("SE_FLD_029", 11);
	Wait_(36);
	SetMotion_(player,pl_look_r_L, BLEND_XL);										// ��l���E������

	Wait_(70);
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 30);
	Wait_(28);
	SetStepSe_(okiduti, SILENT_STEP_SE);
	DeleteTask_(task_todoSe);
	Wait_(2);

	EndDemo(FADE_COLOR_BLACK, 1);
}
