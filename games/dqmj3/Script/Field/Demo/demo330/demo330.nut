//=============================================
//
//		demo330[���̍�����]
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
	local task_cam, task_player, task_silver, task_todo;
	local task_silver_step, task_todo_step;

// �����\�[�X�Ǎ�
	// �L�����N�^�[
	local player = GetPlayerId_();					// ��l��
	local model_silver = ReadNpc_("m077_00");		// �V���o�[
	local model_todo = ReadNpc_("n039");			// �g�[�h�[�e��
	// �G�t�F�N�g
	LoadEffect_("ef712_10_emo_surprise01");			// �u�I�v
	
//	���M�~�b�N
	
	local model_daiza = ReadGimmick_("o_I02_19");										// ���A�N�^�[���
	local daiza = ArrangePointGimmick_("o_I02_19", model_daiza, "obj_daiza000");		// ���A�N�^�[���
	SetMotion_(daiza, MOT_GIMMICK_0, BLEND_N);
	
	local model_reactor = ReadGimmick_("o_dem_15");					//���L���̃��A�N�^�[
	local reactor = ArrangePointGimmick_("o_dem_15", model_reactor, "obj_reactor000");
	
// ���z�u
	// ��l��
	SetPointPos_(player, "player000");
	// �V���o�[
	local silver = ArrangePointNpc_(model_silver, "npc_silver000");
	SetScaleSilhouette(silver, SCALE.N, SILHOUETTE_WIDTH.S);
	SetStepSePan_(silver, false);
	// �g�[�h�[
	local todo = ArrangePointNpc_(model_todo, "npc_todo000");
	SetScaleSilhouette(todo, SCALE.TODO, 0.8);
	SetMeshVisible_(todo, "Model_2", false);									// �I�T�̏�
	SetStepSePan_(todo, false);
	
// ����풓���[�V�����Ǎ�
	local player_nod = ReadMotion_(player, "Player_nod");						// ��l������
	local player_look_right_L = ReadMotion_(player, "Player_look_right_L");		// �E������L
	
	local silver_wait_L = ReadMotion_(silver, "m077_00_wait_L");				// �ҋ@02L
	local silver_wait_above_L = ReadMotion_(silver, "m077_00_wait_above_L");	// ������ҋ@L
	
	local todo_arm_folde02_L = ReadMotion_(todo, "m141_00_arm_folde02_L");		// �r�g��2L
	local todo_arm_folde01_L = ReadMotion_(todo, "m141_00_arm_folde01_L");		// �r�g��1L
	local todo_arm_folde01 = ReadMotion_(todo, "m141_00_arm_folde01");			// �ҋ@���r�g��
	local todo_talk_L = ReadMotion_(todo, "m141_00_talk_L");					// �{���bL
	local todooyabun_run = ReadMotion_(todo, "n039_run");						// ����i�g�[�h�[�e���p�j

// ���J�����ݒ�
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");
	
//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------

	SetMotion_(silver, MOT_RUN, BLEND_N);
	SetMotion_(todo, todooyabun_run, BLEND_N);

	task_silver = Task_MoveForward_(silver, 0.65, true);
	task_todo = Task_MoveForward_(todo, 0.65, true);
	
	SetFade_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
	
	task_todo_step = Task_ChangeStepSe(todo, "SE_FLD_033", 11);
	task_silver_step = Task_ChangeStepSe(silver, "SE_FLD_036", 16);
	
	Wait_(20);
	
	SurpriseDispSetOffset(player, Vec3(0, 1.7, 0), 0.7);
	
	Wait_(20);
	
	SetMotion_(player, MOT_WALK, BLEND_M);
	task_player = Task_RotateToDir_(player, -140, 8.0);
	WaitTask(task_player);
	SetMotion_(player, player_look_right_L, BLEND_L);
	
	Wait_(40);
	DeleteTaskStepSe(silver, task_silver_step);
	Wait_(5);
	
	DeleteTask_(task_silver);
	DeleteTask_(task_todo);
	
	DeleteTask_(task_todo_step);
	SetStepSe_(todo, "SE_FLD_033");
	
	SetPointPos_(player, "player001");
	SetPointPos_(silver, "npc_silver001");
	SetPointPos_(todo, "npc_todo001");
	SetMotion_(player, MOT_WALK, BLEND_N);
	SetMotion_(silver, silver_wait_L, BLEND_N);
	SetMotion_(todo, MOT_WAIT, BLEND_N);
	
	//��������������������������������������
	//���J�b�g2
	//��������������������������������������
	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");
	
	task_player = Task_AnimeMoveSetMotion_(player, "anm_player000", MOT_WALK, MOT_WAIT);	// 80F
	
	WaitTask(task_player);
	
	SetMotion_(todo, todo_arm_folde01, BLEND_L);
	WaitMotion(todo);
	SetMotion_(todo, todo_arm_folde02_L, BLEND_L);
	
	//===============================================
	//*�g�[�h�[
	// �u�A�[�U���[�N��|�������I
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_TODO");
	ShowMsg_("DEMO_330_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetMotion_(silver, silver_wait_above_L, BLEND_L);
	Wait_(5);
	
	//===============================================
	//*�V���o�[
	// 	�u���L���̌��������c�c�B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_SILVER");
	ShowMsg_("DEMO_330_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	Wait_(10);
	
	SetActive_(silver, false);
	
	//��������������������������������������
	//���J�b�g3
	//��������������������������������������
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");		// 100F
	SetScaleSilhouette(todo, SCALE.TODO, 0.7);

	//===============================================
	//*�g�[�h�[
	// �u���������̂��B���V��ƃ��L���̂R�l��
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_TODO");
	ShowMsg_("DEMO_330_MSG_030");
	KeyInputWait_();
	
	SetMotion_(todo, todo_arm_folde01_L, BLEND_L);
	
	//===============================================
	//*�g�[�h�[
	// �u���̒n�ɗ΂������炷�c�c���L����
	//-----------------------------------------------
	ShowMsg_("DEMO_330_MSG_040");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	WaitTask(task_cam);
	
	Wait_(10);
	DeleteTask_(task_cam);
	//��������������������������������������
	//���J�b�g4
	//��������������������������������������
	SetScaleSilhouette(todo, SCALE.TODO, 1.4);	
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");		// 200F
	
	SetPointPos_(silver, "npc_silver002");
	SetPointPos_(todo, "npc_todo002");
	SetMotion_(silver, MOT_WALK, BLEND_N);
	SetMotion_(todo, MOT_WALK, BLEND_N);
	SetActive_(todo, false);
	
	Wait_(145);
	
	SetActive_(silver, true);
	SetActive_(todo, true);
	task_silver = Task_AnimeMove_(silver, "anm_silver000");	// 35F
	task_todo = Task_AnimeMove_(todo, "anm_todo000");		// 35F
	
	WaitTask(task_silver);
	WaitTask(task_todo);
	
	SetMotion_(silver, silver_wait_above_L, BLEND_L);
	SetMotion_(todo, todo_arm_folde01, BLEND_L);
	WaitMotion(todo);
	SetMotion_(todo, todo_arm_folde02_L, BLEND_L);
	
	WaitTask(task_cam);
	
	//===============================================
	//*�V���o�[
	// �u���ށc�c����g�[�h�[�@���̐A�����I
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_SILVER");
	ShowMsg_("DEMO_330_MSG_050");
	KeyInputWait_();

	//===============================================
	//*�V���o�[
	// 	�u���ꂱ���@���̊�]�Ȃ̂��ȁB
	//-----------------------------------------------
	ShowMsg_("DEMO_330_MSG_060");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	Wait_(10);
	DeleteTask_(task_cam);	
	//��������������������������������������
	//���J�b�g5
	//��������������������������������������
	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");	// 120F
	
	SetPointPos_(silver, "npc_silver003");
	SetPointPos_(todo, "npc_todo003");
	SetFace_(todo, "Face_look_up");
	
	SetActive_(player, false);
	
	//===============================================
	//*�g�[�h�[
	// 	�u�������@�܂�����Ȃ��؂���̂��B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_TODO");
	ShowMsg_("DEMO_330_MSG_070");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	//===============================================
	//*�V���o�[
	// �u�܂��@���͗��Ă��Ȃ��̂��낤�B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_SILVER");
	ShowMsg_("DEMO_330_MSG_080");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	WaitTask(task_cam);
	
	Wait_(10);
	DeleteTask_(task_cam);	
	SetActive_(player, true);
	SetPointPos_(player, "player002");
	SetPointPos_(silver, "npc_silver004");
	SetPointPos_(todo, "npc_todo004");
	
	//��������������������������������������
	//���J�b�g6
	//��������������������������������������
	SetPointCameraEye_("cameye002");
	SetPointCameraTarget_("camtgt002");
	
	task_player = Task_AnimeMoveSetMotion_(player, "anm_player001", MOT_WALK, MOT_WAIT);	// 60F
	DeleteTask_(task_player);
	
	Wait_(10);
	
	task_player = Task_AnimeMoveSetMotion_(player, "anm_player001", MOT_WALK, MOT_WAIT);	// 60F
	
	Wait_(40);
	
	task_silver = Task_RotateToDirSetMotion_(silver, 275, ROTATE_DEMO_DEF, MOT_WALK, silver_wait_above_L);
	task_todo = Task_RotateToDirSetMotion_(todo, 195, ROTATE_DEMO_DEF, MOT_WALK, MOT_WAIT);
	SetFace_(todo, "Face_default");
	
	WaitTask(task_player);
	WaitTask(task_silver);
	WaitTask(task_todo);

	task_cam = Task_AnimeMoveCamera_("anmeye003", "anmtgt003");	// 180F
	
	//===============================================
	//*�V���o�[
	// �u�@�B�������Ă���c�c�B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_SILVER");
	ShowMsg_("DEMO_330_MSG_090");
	KeyInputWait_();
	
	//===============================================
	//*�V���o�[
	// �u�������@����Ń��L���Ɖ������
	//-----------------------------------------------
	ShowMsg_("DEMO_330_MSG_100");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetMotion_(todo, todo_arm_folde01, BLEND_L);
	WaitMotion(todo);
	SetMotion_(todo, todo_talk_L, BLEND_L);
	
	//===============================================	
	//*�g�[�h�[
	// 	�u���S�̊č����ւ́@�ړ����u�Ɍ������ɂ�
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_TODO");
	ShowMsg_("DEMO_330_MSG_110");
	KeyInputWait_();
	
	//===============================================
	//*�g�[�h�[
	// 	�u���낢��@���b�ɂȂ��Ă΂��肶��������@�悩������@�܂��E�`��K�˂Ă��ꂢ�B
	//-----------------------------------------------
	ShowMsg_("DEMO_330_MSG_120");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetMotion_(todo, todo_arm_folde02_L, BLEND_L);
	
	Wait_(5);
	
	SetMotion_(player, player_nod, BLEND_M);
	WaitMotion(player);
	SetMotion_(player, MOT_WALK, BLEND_M);
	
	task_player = Task_RotateToDir_(player, 270, ROTATE_DEMO_DEF);
	WaitTask(task_player);
	task_player = Task_MoveForward_(player, 1.0, false);
	
	Wait_(45);
	SetStepSe_(player, SILENT_STEP_SE);
	
	EndDemo(FADE_COLOR_BLACK);
}
