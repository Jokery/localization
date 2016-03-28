//=============================================
//
//		demo016[�W���b�N�Ƃ̏o�]
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
	local task_cam, task_jack, task_box;
	local efc_cam, efc_jack;
	
// �����f���Ǎ�
	// �M�~�b�N
	local model_box = ReadGimmick_("o_dem_12");		// �ؔ�
	local model_stick = ReadGimmick_("o_dem_13");	// �W���b�N�����؂̖_
	// �L�����N�^�[
	local player = GetPlayerId_();					// ��l��
	local model_jack = ReadNpc_("n001");			// �W���b�N
	local model_nocho = ReadNpc_("n043");			// �m�`������
	local model_ace = ReadNpc_("n002");				// �G�[�X
	// �G�t�F�N�g
	LoadEffect_("ef733_01_sym_shuchusen01");				// �W����
	LoadEffect_("ef712_13_emo_sweat01");			// ��

// ���z�u
	// �ؔ�
	local box = ArrangePointGimmick_("o_dem_12", model_box, "obj_box000");
	// �W���b�N�����؂̖_
	local stick = ArrangePointGimmick_("o_dem_13", model_stick, "npc_jack000");
	// ��l��
	SetPointPos_(player, "player000");
	// �W���b�N
	local jack = ArrangePointNpc_(model_jack, "npc_jack000");
	SetAlpha_(jack, ALPHA_CLEAR);
	// �m�`���[��
	local nocho = ArrangePointNpc_(model_nocho, "npc_nocho000");
	// �G�[�X
	local ace = ArrangePointNpc_(model_ace, "npc_ace000");
	SetAlpha_(ace, ALPHA_CLEAR);
	
// ����풓���[�V�����Ǎ�
	// ��l��
	local Player_look_left_L = ReadMotion_(player, "Player_look_left_L");	// ��������
	local Player_look_right_L = ReadMotion_(player, "Player_look_right_L");	// �E������
	local Player_look_down_L = ReadMotion_(player, "Player_look_down_L");	// ��������
	local Player_nod = ReadMotion_(player, "Player_nod");					// �ҋ@�����ȂÂ����ҋ@
	// �W���b�N
	local jack_scary_L = ReadMotion_(jack, "n001_scary_L");					// �W���b�N�������܂苯����
	local jack_resolution = ReadMotion_(jack, "n001_resolution");			// �W���b�N�������܂苯���遨�o������߂�
	local jack_resolution_L = ReadMotion_(jack, "n001_resolution_L");		// �W���b�N�o������߂�
	local jack_run_L = ReadMotion_(jack, "n001_run_L");						// �W���b�N����
	local jack_look_player = ReadMotion_(jack, "n001_look_player");			// �W���b�N��l��������
	local jack_look_player_L = ReadMotion_(jack, "n001_look_player_L");		// �W���b�N��l��������L
	local jack_anger_L = ReadMotion_(jack, "n001_anger_L");					// �W���b�N�{��L
	local jack_talk02 = ReadMotion_(jack, "n001_talk02");					// �W���b�N�l���遨��b�i���������j
	local jack_talk02_L = ReadMotion_(jack, "n001_talk02_L");				// �W���b�N��b�i���������j
	local jack_jump = ReadMotion_(jack, "n002_jump");						// �W���b�N��яo��
	local jack_impatience_L = ReadMotion_(jack, "n001_impatience_L");		// �W���b�N�ł�	
	local jack_battle_L = ReadMotion_(jack, "n001_battle_L");				// �W���b�N�U��L
	// �m�`���[��
	local nocho_show_face = ReadMotion_(nocho, "n000_show_face");			// ���u�ʏ�ҋ@������o��
	local nocho_show_face_L = ReadMotion_(nocho, "n000_show_face_L");		// ���u����o��
	local nocho_stand_right_L = ReadMotion_(nocho, "n000_stand_right_L");	// ���u��l��������L
	local nocho_talk_joy_L = ReadMotion_(nocho, "n000_talk_joy_L");			// ���u��b�i���������j
	local nocho_think02_L = ReadMotion_(nocho, "n000_think02_L");			// ���u�l����
	
// ���������[�V�����ݒ�
	SetMotion_(jack, jack_scary_L, BLEND_N);
	
// ���J�����ݒ�
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");

//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------
	
	StartDemo(FADE_COLOR_BLACK);
	
	//===============================================
	// *�W���b�N
	// �u���͂�@����܂łł�����[�I
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_016_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetMotion_(box, MOT_GIMMICK_1, BLEND_N);		// �K�^�K�^
	PlaySE_("SE_DEM_016");							//��SE:�W���b�N�o��
	Wait_(30);
	
	WaitTask(task_cam);
	DeleteTask_(task_cam);
	
	SetAlpha_(jack, ALPHA_EXIST);
	SetMotion_(jack, jack_jump, BLEND_M);			// �W���b�N��яo��
	SetMotion_(box, MOT_GIMMICK_0, BLEND_N);		// �ʏ�
	
	task_jack = Task_AnimeMoveNoFit_(jack, "anm_jack000");
	
	// �W���b�N��яo��
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");		// 20F
	efc_cam = SetCameraEffect_("ef733_01_sym_shuchusen01", CAMERA_DEF);		// �W����
	
	Wait_(10);
	
	//���t�F�[�h
	//----------------------------------------------------------------
	SetFade_(FADE_OUT, FADE_COLOR_WHITE, 10);
	WaitFade_();
	
	SetAlpha_(player, ALPHA_CLEAR);
	SetAlpha_(nocho, ALPHA_CLEAR);
	SetActive_(box, false);
	
	DeleteEffect_(efc_cam);
	DeleteTask_(task_cam);
	DeleteTask_(task_jack);
	
	//��������������������������������������
	//���J�b�g�Q
	//��������������������������������������
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");
	
	Wait_(15);
	
	SetPointPos_(jack, "npc_jack000");
	SetMotion_(jack, jack_battle_L, BLEND_N);		// �U��L
	SetMotion_(stick, MOT_GIMMICK_1, BLEND_N);		// �W���b�N������
	
//	efc_jack = SetSelectBoneEffect_("ef712_13_emo_sweat01", jack, ATTACH_EFFECT1);	
	efc_jack = SetSelectBoneEffectSetOffset_("ef712_13_emo_sweat01", jack, ATTACH_EFFECT1, Vec3(-0.2, 1.7, -1.5));
	SetEffectScale_(efc_jack, 1.1);
	
	SetFade_(FADE_IN, FADE_COLOR_WHITE, 30);
	//----------------------------------------------------------------
	
	Wait_(45);
	
	SetAlpha_(player, ALPHA_EXIST);
	SetAlpha_(nocho, ALPHA_EXIST);
	
	DeleteEffect_(efc_jack);
	SetMotion_(stick, MOT_GIMMICK_0, BLEND_N);		// �n�ʂɗ����Ă�
	
	//��������������������������������������
	//���J�b�g�R
	//��������������������������������������
	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");
	
	SetMotion_(nocho, nocho_show_face, BLEND_M);
	WaitMotion(nocho);
	SetMotion_(nocho, nocho_show_face_L, BLEND_M);
	
	SetMotion_(player, Player_look_left_L, BLEND_L);
	
	//===============================================
	// *�m�`���[��
	//�u��������������@�W���b�N�B
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_016_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetDir_(jack, -24);
	SetDirToObject_(player, jack);
	SetDirToObject_(nocho, jack);
	
	//��������������������������������������
	//���J�b�g�S
	//��������������������������������������
	SetPointCameraEye_("cameye002");
	SetPointCameraTarget_("camtgt002");
	
	SetMotion_(jack, jack_run_L, BLEND_N);
	
	task_jack = Task_MoveForward_(jack, 0.8, true);
	PlaySE_("SE_FLD_011");
	Wait_(9);
	PlaySE_("SE_FLD_011");
	
	DeleteTask_(task_jack);
	
	SetMotion_(jack, MOT_TALKLOOP, BLEND_M);
	
	//===============================================
	// ���W���b�N
	// �u���c�c�����I�@�悭��������
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_JACK");
	ShowMsg_("DEMO_016_MSG_030");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetMotion_(jack, MOT_WAIT, BLEND_M);
	
	//============
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
	WaitFade_();
	
	SetPointPos_(player, "player001");
	SetPointPos_(jack, "npc_jack001");
	SetPointPos_(nocho, "npc_nocho001");
	SetMotion_(player, MOT_WAIT, BLEND_N);
	SetMotion_(nocho, MOT_WAIT, BLEND_N);
	
	//��������������������������������������
	//���J�b�g�T
	//��������������������������������������
	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");
	
	SetFade_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
	WaitFade_();
	//============
	
	Wait_(30);
	
	SetMotion_(jack, MOT_TALKLOOP, BLEND_M);
	SetMotion_(player, Player_look_right_L, BLEND_L);		// �E������
	
	//===============================================
	// ���W���b�N
	// �u�������́@�͂�Ẵm�`�������B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_JACK");
	ShowMsg_("DEMO_016_MSG_040");
	KeyInputWait_();
	//-----------------------------------------------
	// ��
	// �u�Ȃ�قǁc�c�ꏏ�Ɂ@�����ꂽ
	//-----------------------------------------------
	ShowMsg_("DEMO_016_MSG_050");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetMotion_(jack, MOT_WAIT, BLEND_M);
	SetMotion_(nocho, nocho_think02_L, BLEND_L);
	SetMotion_(player, Player_look_left_L, BLEND_L);		// ��������
	
	//===============================================
	// ���m�`������
	// �u�L���O�́@���̐g�̂ł́@�������Ȃ�������B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_NOCHORIN");
	ShowMsg_("DEMO_016_MSG_060");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	//��������������������������������������
	//���J�b�g�U
	//��������������������������������������
	SetPointCameraEye_("cameye003");
	SetPointCameraTarget_("camtgt003");
	
	DeleteTask_(task_cam);
	
	SetMotion_(jack, jack_anger_L, BLEND_N);
	SetMotion_(nocho, MOT_WAIT, BLEND_M);
	
	//===============================================
	// ���W���b�N
	// �u�����I�@�������킵��@�m�`���[���L���O�I
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_JACK");
	ShowMsg_("DEMO_016_MSG_070");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	//��������������������������������������
	//���J�b�g�V
	//��������������������������������������
	SetPointCameraEye_("cameye004");
	SetPointCameraTarget_("camtgt004");
	
	SetDir_(jack, 168);
	SetDir_(player, 77);
	SetDir_(nocho, -7);
	
	SetMotion_(player, Player_look_down_L, BLEND_N);		// ��������
	SetMotion_(nocho, nocho_talk_joy_L, BLEND_M);
	
	//===============================================
	// ���m�`������
	// �u�Ȃ����Ȃ�����@�W���b�N�I
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_NOCHORIN");
	ShowMsg_("DEMO_016_MSG_080");
	KeyInputWait_();
	CloseMsgWnd_();
	Wait_(10);
	
	//��������������������������������������
	//���J�b�g�W
	//��������������������������������������
	task_cam = Task_AnimeMoveCamera_("anmeye003", "anmtgt003");
	Wait_(10);	
	//-----------------------------------------------
	// ��
	// �u<name_player/>�́@�����X�^�}�X�^�[�B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_NOCHORIN");
	ShowMsg_("DEMO_016_MSG_090");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	DeleteTask_(task_cam);
	
	SetDir_(player, 50);
	
	SetMotion_(player, MOT_WAIT, BLEND_N);
	SetMotion_(nocho, MOT_WAIT, BLEND_N);
	
	//��������������������������������������
	//���J�b�g�X
	//��������������������������������������
	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");
	
	SetMotion_(jack, jack_look_player, BLEND_L);						// ��l��������
	
	task_jack = Task_ChangeMotion_(jack, jack_look_player_L, BLEND_M);	// ��l��������LOOP
	
	//===============================================
	// ���W���b�N
	// �u�������I�@���Ȃ����@�L���O��
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_JACK");
	ShowMsg_("DEMO_016_MSG_100");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	DeleteTask_(task_cam);
	
	SetMotion_(player, Player_nod, BLEND_L);		// �ҋ@�����ȂÂ����ҋ@
	WaitMotion(player);
	SetMotion_(player, MOT_WAIT, BLEND_L);
	
	DeleteTask_(task_jack);
	
	task_jack = Task_WalkAroundToPos(jack, GetPos_(player), ROTATE_DEMO_DEF);
	WaitTask(task_jack);
	DeleteTask_(task_jack);
	
	SetMotion_(jack, jack_talk02, BLEND_M);
	WaitMotion(jack);
	SetMotion_(jack, jack_talk02_L, BLEND_M);
	
	//===============================================
	// ���W���b�N
	// �u�Ȃ�Ɓ@���肪�����I�@�Ȃ�Ɓ@���������I
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_JACK");
	ShowMsg_("DEMO_016_MSG_110");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetMotion_(nocho, nocho_stand_right_L, BLEND_M);
	
	//��������������������������������������
	//���J�b�g�X
	//��������������������������������������
	task_cam = Task_AnimeMoveCamera_("anmeye004", "anmtgt004");
	
	SetAlpha_(ace, ALPHA_EXIST);
	
	Wait_(30);
	
	SetMotion_(jack, MOT_TALKLOOP, BLEND_M);
	
	//===============================================
	// ���W���b�N
	// �u����ł́@�܂��́@�������ɂ���@�G�[�X�Ƃ����E�E
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_JACK");
	ShowMsg_("DEMO_016_MSG_120");
	KeyInputWait_();
	//-----------------------------------------------
	// ��
	//�u���c�̒m�b�́@�K����
	//-----------------------------------------------
	ShowMsg_("DEMO_016_MSG_130");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetMotion_(jack, MOT_WAIT, BLEND_M);
	
	EndDemo(FADE_COLOR_BLACK);
}