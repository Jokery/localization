//=============================================
//
//		demo411[�~���̐�]
//
//=============================================

//-------------------------------------------------------------------------
//
//		�ǂݍ��݁E�z�u
//
//-------------------------------------------------------------------------
function Update()
{
//	DummyMsg();
	
// ���ϐ���`
	local task_cam, task_player;
	local efc_player;

// �����\�[�X�Ǎ�
	// �L�����N�^�[
	local player = GetPlayerId_();						// ��l��
	local id_samayou = ReadNpc_("m111_00");				// �Ŏ�A�F���܂悤��낢
	local id_ittaburu = ReadNpc_("m205_00");			// �C�b�^�u��
	// �M�~�b�N
	local id_elevator_lift = ReadGimmick_("o_S02_00");	// �G���x�[�^�[���t�g
	local id_elevator_door= ReadGimmick_("o_S02_01")	// �G���x�[�^�[�̔�
	local id_door = ReadGimmick_("o_S02_11")			// 4�E5F���ʔ�
	// �G�t�F�N�g
	LoadEffect_("ef712_13_emo_sweat01");				// ��

// ���z�u
	// ��l��
	SetPointPos_(player, "player000");

	// �Ŏ�`
	local g_npc_jailer_a	 = ArrangePointNpc_(id_samayou, "npc_kansyu");
	SetScaleSilhouette(g_npc_jailer_a,		 SCALE.N,			 SILHOUETTE_WIDTH.N);
	SetVisible(g_npc_jailer_a,			 false);							// ��\���ɂ���

	// �C�b�^�u��
	local npc_ittaburu		 = ArrangePointNpc_(id_ittaburu, "npc_ittaburu");
	SetVisible(npc_ittaburu,			 false);							// ��\���ɂ���
	SetStepSe_(npc_ittaburu, "SE_FLD_052");
	task_player = Task_AnimeMove_(g_npc_jailer_a, "anm_kansyu001");
	
	// �G���x�[�^�[���t�g
	local g_elevator_lift	 = ArrangePointGimmick_("o_S02_01", id_elevator_lift, "gmc_elevator_lift");
	
	// �G���x�[�^�[�̔�
	local g_elevator_door	 = ArrangePointGimmick_("o_S02_01", id_elevator_door, "gmc_elevator_door");
	
	// 4�E5F���ʔ�
	local g_door			 = ArrangePointGimmick_("o_S02_11", id_door, "gmc_door");
	SetMotion_(g_door, MOT_GIMMICK_4, 1);

// ����풓���[�V�����Ǎ�
	local p_kubi	= ReadMotion_(player,	"Player_look_left_L");
	local p_kyoro	= ReadMotion_(player,	"Player_look_around_L");
	local player_touch_reactor = ReadMotion_(player, "Player_touch_reactor");
	local player_touch_reactor_L = ReadMotion_(player, "Player_touch_reactor_L");
	
	SetFace_(player, "Face_left");	

//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------

	task_cam = Task_AnimeMoveCamera_("001_anmeye", "001_anmtgt");
	task_player = Task_AnimeMove_(player, "anm_player000");
	SetMotion_(player, MOT_RUN, 1);

	StartDemo(FADE_COLOR_BLACK);

	Wait_(20);
	SetMotion_(player, p_kyoro, 1);

	WaitTask(task_cam);
	Wait_(30);
	
	task_cam = Task_AnimeMoveCamera_("002_anmeye", "002_anmtgt");
	SetPointPos_(player, "player000");
	SetMotion_(player, p_kubi, 1);
	SetVisible(npc_ittaburu,			 true);										// �\���ɂ���
	task_player = Task_AnimeMove_(npc_ittaburu, "anm_ittaburu001");
	SetMotion_(npc_ittaburu, MOT_WALK, 1);
	SetVisible(player,			 true);												// ��\���ɂ���
	SetVisible(g_npc_jailer_a,			 true);										// �\���ɂ���
	local efc = SetSelectBoneEffect_("ef712_13_emo_sweat01", g_npc_jailer_a, ATTACH_EFFECT1);	// ��
	SetEffectScale_(efc, 3.0);														// ���X�P�[��
	SetMotion_(g_npc_jailer_a, MOT_WAIT, 1);
	
	//===============================================
	// ���C�b�^�u��
	// �u�z�́@�܂��������̂ł��邩�I�H
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ITABURU");
	ShowMsg_("DEMO_411_MSG_010");

	WaitTask(task_player);
	SetMotion_(npc_ittaburu, MOT_WAIT, 8);

	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	//===============================================
	// *�Ŏ烂���X�^�[�`
	// �u�͂͂��I
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_411_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	DeleteEffect_(efc);
	WaitTask(task_cam);


	local task = Task_RotateToDir_(g_npc_jailer_a, -90, 10);
	SetMotion_(g_npc_jailer_a, MOT_RUN, 1);
	WaitTask(task);

	task_player = Task_AnimeMove_(g_npc_jailer_a, "anm_kansyu002");
	SetMotion_(g_npc_jailer_a, MOT_RUN, 1);
	task_cam = Task_AnimeMove_(npc_ittaburu, "anm_ittaburu002");
	SetMotion_(npc_ittaburu, MOT_WALK, 1);
	WaitTask(task_player);

	PlaySE_("SE_FLD_135");		// ���A�N�^�[������
	efc_player = SetSelectBoneEffect_("ef732_09_light_reactor_c", player, ATTACH_EFFECT1);	// ���A�N�^�[����
	Wait_(10);
	SetMotion_(player, player_touch_reactor, BLEND_L);
	SetFace_(player, "Face_left");	
	WaitMotion(player);
	SetMotion_(player, player_touch_reactor_L, BLEND_N);
	
	//===============================================
	// *���L��
	// �u������Ă�I�@����������I
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_MYSTERY_COMMUNICATION");
	ShowMsg_("DEMO_411_MSG_030");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	SetFace_(player, "Face_default");
	SetMotion_(player, MOT_WAIT, BLEND_L);
	Wait_(50);
	task_cam = Task_AnimeMoveCamera_("004_anmeye", "004_anmtgt");

	//===============================================
	// *���L��
	// �u���^���^���Ȃ��I�@�����@������񂾂�I
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_MYSTERY_COMMUNICATION");
	ShowMsg_("DEMO_411_MSG_040");
	KeyInputWait_();
	CloseMsgWnd_();
	WaitTask(task_cam);
	//===============================================
	WaitTask(task_cam);
	
	EndDemo(FADE_COLOR_BLACK);
}
