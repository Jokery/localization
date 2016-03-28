//=============================================
//
//		demo408[���L���̏���]
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
	local task_cam, task_npc_player0, task_npc_player1, task_spike1,task_efc_player0;	
	
// �����\�[�X�Ǎ�
	// �L�����N�^�[
	local n_npc_player = ReadNpc_("n027");				// ��l��
	local n_spike = ReadNpc_("m127_02");				// �g�Q�W���{�[�i���l�j
	local model_o_S02_02 = ReadGimmick_("o_S02_02");
	
	//�G�t�F�N�g
	LoadEffect_("ef712_10_emo_surprise01");					// �u�I�v
	local pos = Vec3(-6, 2, 0);

// ���z�u

	// ��l��
	local npc_player1 = ArrangePointNpc_(n_npc_player, "npc_player001");
	SetScaleSilhouette(npc_player1, 0.6, 0.4);

	// �g�Q�W���{�[�i���l�j
	local spike1 = ArrangePointNpc_(n_spike, "npc_spike001");
	SetScaleSilhouette(spike1, 0.8, 0.5);
	
	//�M�~�b�N
	local gmc_o_S02_02 = ArrangePointGimmick_("o_S02_02", model_o_S02_02, "obj_tobira000");	
	
// ����풓���[�V�����Ǎ�
	//���l�Ƃ��W���{�[
	local spike1_down_light = ReadMotion_(spike1, "m127_01_down_light_L");
	local spike1_down_light_look_left_L = ReadMotion_(spike1, "m127_01_down_light_look_left_L");
	local spike1_standup = ReadMotion_(spike1, "m127_01_standup");	
	local spike1_stand_L = ReadMotion_(spike1, "m127_01_hero_wait_L");
	local spike1_surprise = ReadMotion_(spike1, "m127_01_surprise");		//����
	local spike1_surprise_L = ReadMotion_(spike1, "m127_01_surprise_L");	//����L
	local spike1_sit_talk_L = ReadMotion_(spike1, "m127_01_sit_talk_L");	//�����b
	local spike1_talk_L = ReadMotion_(spike1, "m127_01_talk_L");	
	local spike1_what_L = ReadMotion_(spike1, "m127_01_what_L");	
	

	//��l��
	local npc_player_stand_L = ReadMotion_(npc_player1, "m127_01_hero_wait_L");
	local npc_player_talk_L = ReadMotion_(npc_player1, "m127_01_talk_L");
	local npc_player_surprise = ReadMotion_(npc_player1, "m127_01_surprise");		//����
	local npc_player_surprise_L = ReadMotion_(npc_player1, "m127_01_surprise_L");	//����L
		
//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------
	SetMotion_(npc_player1, spike1_down_light, BLEND_N);
	SetMotion_(spike1, npc_player_stand_L, BLEND_N);
	SetDirToPos_(spike1 GetPos_(npc_player1));

	Wait_(15);
	
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");
	StartDemo(FADE_COLOR_BLACK);
	
	//===============================================
	// *���l�`
	// �u���肪�Ƃ�c�c�V�l����B
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_408_MSG_010");
	KeyInputWait_();
	//===============================================
	
	SetMotion_(spike1, spike1_sit_talk_L, 20);	
	SetMotionSpeed_(spike1, 0.8);		
	//===============================================
	// *���l�`
	// �u�c�c�E�������@�킩��˂����ā@�炵�Ă�ȁB
	//-----------------------------------------------
	ShowMsg_("DEMO_408_MSG_020");	
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================	
	Wait_(20);
	SetMotion_(spike1, spike1_down_light, 20);	
	SetMotionSpeed_(spike1, 1.0);
	Wait_(20);	
	DeleteTask_(task_cam);
		
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");
	InitSilhouetteWidth_(spike1, 1.2);
	Wait_(20);		
	SetMotion_(spike1, spike1_standup, BLEND_L);
	SetMotionSpeed_(spike1, 1.3);	
	WaitMotion(spike1);
	SetMotion_(spike1, spike1_stand_L, BLEND_L);
	SetMotionSpeed_(spike1, 0.8);	
	//===============================================
	// *���l�`
	// �u���O�@�p�[�N�̃�������˂��ȁH
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_408_MSG_030");
	KeyInputWait_();
	//===============================================	
	
	SetMotion_(npc_player1, npc_player_surprise, BLEND_N);
	task_efc_player0 = SurpriseDispSetOffset(npc_player1, pos, 2.0);
	Wait_(15);
	SetMotion_(npc_player1, npc_player_surprise_L, BLEND_L);
	
	Wait_(20);		
	SetMotion_(spike1, spike1_talk_L, 20);	
	//===============================================
	// *���l�`
	// �u�S�z����ȁB�C�b�^�u���Ɂ@�`�N�낤�Ƃ�
	//-----------------------------------------------
	ShowMsg_("DEMO_408_MSG_040");
	KeyInputWait_();
	//===============================================
	
	//===============================================
	// *���l�`
	// �u�����c�c�Ȃ�̂��߂Ɂ@�����ɗ����H
	//-----------------------------------------------
	ShowMsg_("DEMO_408_MSG_050");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================	
	SetMotion_(spike1, spike1_stand_L, 20);	
	
	WaitTask(task_cam);
	Wait_(30);
	SetMotion_(npc_player1, npc_player_talk_L, BLEND_XL);
	Wait_(60);
	
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 15);
	WaitFade_();
	SetVisible(npc_player1, false);
	Wait_(15);
	DeleteTask_(task_cam);	
	SetFade_(FADE_IN, FADE_COLOR_BLACK, 30);	
	
	
	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");
	InitSilhouetteWidth_(spike1, 0.8);
	SetMotionSpeed_(spike1, 1.0);	
	SetMotion_(spike1, spike1_surprise, BLEND_N);
	Wait_(15);
	SetMotion_(spike1, spike1_surprise_L, BLEND_L);
	
	//===============================================
	// *���l�`
	// �u�Ȃ񂾂ƁH�@���L���Ɖ�ɗ��������āH
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_408_MSG_060");
	Wait_(20);	
	SetMotion_(spike1, spike1_what_L, 25);	
	KeyInputWait_();
	//===============================================

	//===============================================
	// *���l�`
	// �u�ׂ̘S�Ɂ@���L�����ēz�́@�������B
	//-----------------------------------------------
	ShowMsg_("DEMO_408_MSG_070");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	Wait_(20);	
	DeleteTask_(task_cam);	

	task_cam = Task_AnimeMoveCamera_("anmeye003", "anmtgt003");
	InitSilhouetteWidth_(spike1, 1.4);
	SetVisible(npc_player1, true);
	
	SetMotion_(npc_player1, MOT_WAIT, BLEND_N);
	SetMotion_(spike1, spike1_stand_L, 20);
	SetMotionSpeed_(spike1, 0.7);	
	local npc_pleyer01 = Task_RotateToDir_(spike1, 30, 1);	
	local npc_pleyer01 = Task_RotateToDir_(npc_player1, 145, 1);	

	//===============================================
	// *���l�`
	// �u�����Ɓ@�����ЂƂ@���˂��񂾂��́B
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_408_MSG_080");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================	
	WaitTask(task_cam);
	
	Wait_(20);
	EndDemo(FADE_COLOR_BLACK);
}
