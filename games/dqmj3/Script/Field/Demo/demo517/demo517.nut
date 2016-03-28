//=============================================
//
//		demo517[�o�[�f�B�̔���]
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
	local task_cam, task_player, task_birdy;
	local efc_player, efc_birdy, efc_mono;

// �����\�[�X�Ǎ�
	// �L�����N�^�[
	local player = GetPlayerId_();												// ��l��
	local model_birdy = ReadNpc_("n019");										// �o�[�f�B
	// �M�~�b�N
	local model_mono = ReadGimmick_("o_com_02");								// ���m���X
	local model_gate = ReadGimmick_("o_V00_03");								// ���W�X�^���X�̔�
	local model_device = ReadGimmick_("o_V00_11");								// �F�ؑ��u
	local model_rula = ReadGimmick_("o_com_08");								// ���[���|�C���g
	//�G�t�F�N�g
	LoadEffect_("ef732_07_teleport_monolith");									// ���m���X�]���G�t�F�N�g
	LoadEffect_("ef721_03_nat_smoke_n03");										// ��

// ���z�u
	// ��l��
	SetPointPos_(player, "player000");
	// �o�[�f�B
	local birdy = ArrangePointNpc_(model_birdy, "npc_birdy000");
	SetScaleSilhouette(birdy, 0.6, 0.6);
	// ���m���X
	local mono = ArrangePointGimmick_("o_com_02", model_mono, "obj_monolith000");
	// ���W�X�^���X�̔�
	local gate = ArrangePointGimmick_("o_V00_03",model_gate, "obj_gate000");
	// �F�ؑ��u
	local device = ArrangePointGimmick_("o_V00_11",model_device, "obj_device000");
	// ���[���|�C���g
	local rula = ArrangePointGimmick_("o_com_08",model_rula, "obj_rula000");

// ����풓���[�V�����Ǎ�
	//	��l��
	local player_ride_L = ReadMotion_(player, "Player_ride00_L");							// ���C�hL
	local player_hover = ReadMotion_(player, "Player_flight_Hovering");						// �ҋ@����s(�z�o�����O)	
	local player_hover_L = ReadMotion_(player, "Player_flight_Hovering_L");					// ��s(�z�o�����O)
	local player_glide_L = ReadMotion_(player, "Player_flight_glide_L");					// ��s(����)
	local player_nod = ReadMotion_(player, "Player_nod");									// ����
	local player_talk = ReadMotion_(player, "Player_talk");									// �b��
	local player_talk_L = ReadMotion_(player, "Player_talk_L");								// �b��L
	local player_look_right_L = ReadMotion_(player, "Player_look_right_L");					// �E����L

	//	�o�[�f�B
	local birdy_idol = ReadMotion_(birdy, "n019_idol");										// �ҋ@L
	local birdy_before_flight = ReadMotion_(birdy, "n019_before_flight");					// �ҋ@����s�O
	local birdy_before_flight_L = ReadMotion_(birdy, "n019_before_flight_L");				// ��s�OL
	local birdy_flight_Hovering = ReadMotion_(birdy, "n019_flight_Hovering");				// �ҋ@����s(�z�o�����O)
	local birdy_flight_Hovering_L = ReadMotion_(birdy, "n019_flight_Hovering_L");			// ��s(�z�o�����O)L
	local birdy_glide_L = ReadMotion_(birdy, "n019_flight_glide_L");						// ����
	local birdy_talk = ReadMotion_(birdy, "n019_talk");										// �b��L
	local birdy_run_L = ReadMotion_(birdy, "n019_run_L");									// ����
	local birdy_why = ReadMotion_(birdy, "n019_why");										// �����������
	local birdy_wing_Appeal = ReadMotion_(birdy, "n019_wing_Appeal");						// ���߃|�[�Y
	local birdy_wing_Appeal_L = ReadMotion_(birdy, "n019_wing_Appeal_L");					// ���߃|�[�YL

// ���������[�V����
	SetMotion_(birdy,  birdy_run_L, BLEND_L);
	SetAlpha_(player, ALPHA_CLEAR);									//��@��\��
	SetMotion_(mono, MOT_GIMMICK_2, BLEND_N);

// ���V��ݒ�
	SetWeather_(WEATHER.BAD);

	//��������������������������������������
	//���J�b�g1 ���m���X����߂��l��
	//��������������������������������������

// ���J�����ݒ�
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");


//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);

	//��l���]��
	PlaySE_("SE_DEM_017");
	efc_mono = SetSelectBoneEffect_("ef732_07_teleport_monolith", player, ATTACH_GLOBAL);
	for (local i=1; i <= 10; i++) {
		SetAlpha_(player, ALPHA_CLEAR + (i * 0.1));
		Wait_(3);
	}

	WaitTask(task_cam);
	Wait_(10);
	task_birdy = Task_MoveForward_(birdy, 1.0, true);
	PlaySE_("SE_FLD_036");
	Wait_(28);
	DeleteTask_(task_birdy);
	SetMotion_(birdy, birdy_idol, BLEND_L);													//�o�[�f�B�ҋ@
	Wait_(15);
	SetMotion_(birdy, birdy_talk, BLEND_L);													//�o�[�f�B�b��

	//===============================================
	//*�o�[�f�B
	// 	�u�I�[�I�@�߂��Ă����l�[�I
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_BIRDY");
	ShowMsg_("DEMO_517_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	SetMotion_(birdy, birdy_idol, BLEND_XL);													//�o�[�f�B�ҋ@	
	SetMotion_(player, player_nod, BLEND_XL);
	WaitMotion(player);
	SetMotion_(player, player_talk, BLEND_L);
	WaitMotion(player);
	SetMotion_(player, player_talk_L, BLEND_N);
	Wait_(60);

	SetMotion_(birdy, birdy_talk, BLEND_L);	
	SetMotion_(player, MOT_WAIT, BLEND_XL);	

	//===============================================
	//*�o�[�f�B
	// 	�u��Ɂ@���W�X�^���X�̔閧��n�ց@�s�������H
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_BIRDY");
	ShowMsg_("DEMO_517_MSG_020");
	KeyInputWait_();
	//===============================================


	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");// �閧��n�̎R�����f��

	local task = Task_RotateToDir_(birdy, -130, 3);
	PlaySE_("SE_FLD_036");
	SetMotion_(player, player_look_right_L, BLEND_XL);	

	//-----------------------------------------------
	//*�o�[�f�B
	// 	�u���������̎R�܂Ł@���[���悹�ā@��ׂ΂����̃l�[�H
	//-----------------------------------------------
	ShowMsg_("DEMO_517_MSG_030");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	WaitTask(task_cam);
	Wait_(30);	
	SetPointPos_(birdy, "npc_birdy001");


	//��������������������������������������
	//���J�b�g2 �o�[�f�B�A�b�v
	//��������������������������������������

	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");

	//===============================================
	//*�o�[�f�B
	// 	�u�I�[�P�B�I�@�~�[�ɏ��f�[�X�I�@��������@���܂��Ăă��[�I
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_BIRDY");
	ShowMsg_("DEMO_517_MSG_040");
	SetMotion_(birdy, birdy_wing_Appeal, BLEND_XL)									//���@���߃|�[�Y
	WaitMotion(birdy); 
	SetMotion_(birdy, birdy_wing_Appeal_L, BLEND_N)									//���@���߃|�[�Y
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	Wait_(10);
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 30);										//���t�F�[�h������
	WaitFade_();
	SetPointPos_(birdy, "npc_birdy002");
	SetVisible(player, false);
	SetVisible(birdy, false);
	Wait_(1);
	SetVisible(birdy, true);
	Wait_(1);
	SetVisible(player, true);
	Wait_(1);
	AttachObject_(birdy, player, ATTACH_EFFECT2);
	SetMotion_(birdy, birdy_before_flight_L, BLEND_N);
	SetMotion_(player, player_ride_L, BLEND_N);										//��l�����C�h���[�V�����i�ҋ@�j


	//��������������������������������������
	//���J�b�g3 ��l���o�[�f�B�Ƀ��C�h������
	//��������������������������������������

	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");

	SetFade_(FADE_IN, FADE_COLOR_BLACK, 10);										//���t�F�[�h������߂�
	WaitTask(task_cam);

	//===============================================
	//*�o�[�f�B
	// 	�u���b�c�c�c�t���[�C�g�b�I�I
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_BIRDY");
	ShowMsg_("DEMO_517_MSG_050");
	KeyInputWait_();
	CloseMsgWnd_();	
	//===============================================

	//���ăA�j���ɐ؂�ւ�
	PlaySE_("SE_DEM_133");															//��SE:�o�[�f�B�Ăѐ�����s
	task_cam = Task_AnimeMoveCamera_("anmeye003", "anmtgt003");
	task_birdy = Task_AnimeMoveNoFit_(birdy, "anm_birdy000");
	SetMotion_(birdy, birdy_flight_Hovering, BLEND_L);
	SetMotion_(player, player_hover, BLEND_L);										//��l�����C�h���[�V�����i�z�o�����O�j
	WaitMotion(birdy);
	WaitMotion(player);
	SetMotion_(birdy, birdy_flight_Hovering_L, BLEND_L);
	SetMotion_(player, player_hover_L, BLEND_L);									//��l�����C�h���[�V�����i�z�o�����O�j
	WaitTask(task_cam);
	Wait_(3);
	SetMotion_(birdy, birdy_glide_L, BLEND_L);										//�o�[�f�B����
	SetMotion_(player, player_glide_L, BLEND_L);									//��l�����C�h���[�V�����i����j
	Wait_(100);
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 30);										//���t�F�[�h������
	WaitFade_();
	WaitTask(task_cam);


	//��������������������������������������
	//���J�b�g4�@��s���C�h�ړ��V�[��
	//��������������������������������������

	task_cam = Task_AnimeMoveCamera_("anmeye004", "anmtgt004");

	task_birdy = Task_AnimeMoveNoFit_(birdy, "anm_birdy001");
	SetFade_(FADE_IN, FADE_COLOR_BLACK, 30);										//���t�F�[�h������߂�
	WaitTask(task_cam);
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 30);										//���t�F�[�h������
	WaitFade_();
	SetPointPos_(birdy, "npc_birdy003");


	//��������������������������������������
	//���J�b�g5�@�����V�[��
	//��������������������������������������

	task_cam = Task_AnimeMoveCamera_("anmeye005", "anmtgt005");

	task_birdy = Task_AnimeMoveNoFit_(birdy, "anm_birdy002");
	SetFade_(FADE_IN, FADE_COLOR_BLACK, 30);										//���t�F�[�h������߂�
	Wait_(30)
	SetMotion_(player, player_hover_L, BLEND_XL);									//��l�����C�h���[�V�����i�z�o�����O�j
	SetMotion_(birdy,  birdy_flight_Hovering_L, BLEND_XL);
	local task_fly = Task_PlaySe_("SE_FLD_036", 26);
	Wait_(120)
	DeleteTask_(task_fly);

	SetMotion_(player, player_ride_L, BLEND_XL);									//��l�����C�h���[�V�����i�ҋ@�j
	SetMotion_(birdy,  birdy_before_flight_L, BLEND_XL);							//�o�[�f�B��s�O
	Wait_(10);
	
	PlaySE_("SE_FLD_032");
	efc_birdy = SetSelectBoneEffect_("ef721_03_nat_smoke_n03", birdy, ATTACH_GLOBAL);//��
	SetEffectScale_(efc_birdy, 2.0);
	
	WaitTask(task_cam);
	Wait_(80)


	//��������������������������������������
	//���J�b�g6 �o�[�f�Bon��l���@�A�b�v
	//��������������������������������������

	SetPointCameraEye_("cameye002");
	SetPointCameraTarget_("camtgt002");

	//===============================================
	//*�o�[�f�B
	// 	�u�����@�������l�[�I�@�閧��n�Ƃ����@�T���Ă݂�f�[�X�I
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_BIRDY");
	ShowMsg_("DEMO_517_MSG_060");
	KeyInputWait_();
	CloseMsgWnd_();	
	//===============================================

	Wait_(30)

	EndDemo(FADE_COLOR_BLACK);
}
