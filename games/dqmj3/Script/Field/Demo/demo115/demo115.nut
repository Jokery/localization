//=============================================
//
//		demo115[�A���Z�X�̗�����]
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
	local task_cam, task_anse, task_rena, task_ruki, task_birdy, task_boy;
	local efc_player,
	efc_rena, efc_ruki, efc_birdy, efc_boy;

// �����\�[�X�Ǎ�
	// �L�����N�^�[
	local ansesu = GetPlayerId_();						// ��l���H(�A���Z�X)
	local model_rena = ReadNpc_("n007");				// �Ȃ��̏���(���i�[�e)
	local model_ruki = ReadNpc_("n009");				// �Ȃ��̘V�k�i���L���j
	local model_boy = ReadNpc_("n010");					// �Ȃ��̏��N(�q����l��)
	local model_birdy = ReadNpc_("n019");				// �Ȃ��̒��i�o�[�f�B�j

// ���z�u
	SetPointPos_(ansesu, "npc_ansesu000");								// ��l���H(�A���Z�X)
	local rena = ArrangePointNpc_(model_rena, "npc_renerte000");		// �Ȃ��̏���(���i�[�e)
	local ruki = ArrangePointNpc_(model_ruki, "npc_rukiya000");			// �Ȃ��̘V�k�i���L���j
	local boy = ArrangePointNpc_(model_boy, "npc_boy000");				// �Ȃ��̏��N(�q����l��)
	
	local birdy = ArrangePointNpc_(model_birdy, "npc_birdy000");		// �Ȃ��̒��i�o�[�f�B�j
	SetScaleSilhouette(birdy, SCALE.N, SILHOUETTE_WIDTH.N);				// �o�[�f�B�@�T�C�YN
	
	SetStepSe_(ansesu, SILENT_STEP_SE);									// �����𖳉��ɂ���
	SetStepSe_(rena, SILENT_STEP_SE);
	SetStepSe_(ruki, SILENT_STEP_SE);
	SetStepSe_(boy, SILENT_STEP_SE);
	SetStepSe_(birdy, SILENT_STEP_SE);
	
// ����풓���[�V�����Ǎ�
	// ����l���H(�A���Z�X)
	local anse_nod = ReadMotion_(ansesu, "Player_nod");							// ���ȂÂ�
	local anse_look_right = ReadMotion_(ansesu, "Player_look_right_L");			// �E������
	local anse_talk = ReadMotion_(ansesu, "Player_talk");						// �b��
	local anse_talk_L = ReadMotion_(ansesu, "Player_talk_L");					// �b��L
	local anse_look_left = ReadMotion_(ansesu, "Player_look_left_L");			// ��������
	local anse_ride_on = ReadMotion_(ansesu, "Player_ride_on");					// ���C�h�I��
	local anse_ride_L = ReadMotion_(ansesu, "Player_ride00_L");					// ���C�hL
	
	//���Ȃ��̏���(���i�[�e)
	local rena_nod = ReadMotion_(rena, "n007_nod");									// ���ȂÂ�
	local rena_right = ReadMotion_(rena, "n007_look_right_L");						// �E������
	local rena_left = ReadMotion_(rena, "n007_look_left_L");						// ��������
	local rena_ride_hover = ReadMotion_(rena, "n007_ride_hovering_L");				// �z�o�����O���̃o�[�f�B�ɏ��(�A���Z�X�ɃA�^�b�`���K�v)
	local rena_ride = ReadMotion_(rena, "n007_ride_L");								// ���󎞂̃o�[�f�B�ɏ��(�A���Z�X�ɃA�^�b�`���K�v)

	//���Ȃ��̘V�k�i���L���j
	local ruki_look_right_L = ReadMotion_(ruki, "n009_look_right_L");				// �E�����ҋ@L
	local ruki_look_left_L = ReadMotion_(ruki, "n009_look_left_L");					// �������ҋ@L
	local ruki_look_up_L = ReadMotion_(ruki, "n009_look_up_L");						// ������ҋ@L
	local ruki_look_down_L = ReadMotion_(ruki, "n009_look_down_L");					// �������ҋ@L
	
	//���Ȃ��̏��N(�q����l��)
	local boy_look_down = ReadMotion_(boy, "n010_look_down_L");						// ���ނ��ҋ@L
	local boy_look_up = ReadMotion_(boy, "n010_look_up_L");							// ������ҋ@L
	SetFace_(boy, "Face_sad");
	
	//���Ȃ��̒��i�o�[�f�B�j
	local birdy_idol = ReadMotion_(birdy, "n019_idol");								// �ҋ@L
	local birdy_before_flight = ReadMotion_(birdy, "n019_before_flight");			// �ҋ@����s�O
	local birdy_before_flight_L = ReadMotion_(birdy, "n019_before_flight_L");		// ��s�OL
	local birdy_flight_Hovering = ReadMotion_(birdy, "n019_flight_Hovering");		// �ҋ@����s(�z�o�����O)
	local birdy_flight_Hovering_L = ReadMotion_(birdy, "n019_flight_Hovering_L");	// ��s(�z�o�����O)L
	local birdy_glide_L = ReadMotion_(birdy, "n019_flight_glide_L");				// ����
	
// ���F���ݒ�
	ChangeColorSepia();
	
// �����C�A�E�g
	LoadLayout_("noise");															//�m�C�Y
	
// ���������[�V����
	SetMotion_(ansesu, anse_talk_L, BLEND_N);										//�A���Z�X�b��
	SetMotion_(rena, MOT_WAIT, BLEND_N);											//���i�[�e�ҋ@
	SetMotion_(birdy, birdy_idol, BLEND_N);											//�o�[�f�B�ҋ@
	SetMotion_(ruki, MOT_WALK, BLEND_N);											//���L������
	SetMotion_(boy, MOT_WALK, BLEND_N);												//���N����

//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------

	ReadWaitingLod("lodeye000", "lodtgt000");
	SetPointCameraEye_("lodeye000");
	SetPointCameraTarget_("lodtgt000");
	
	//��������������������������������������
	//���J�b�g1 ��l������������ꏊ�@PANDOWN
	//��������������������������������������
	StartDemo(FADE_COLOR_WHITE);
	
	PlayBgm_("BG_AMBI_016");
	SetLayoutAnime_("noise_in", false);												//�m�C�Y
	WaitLayoutAnime();
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");
	SetLayoutAnime_("noise_out", false);											//�m�C�Y�A�E�g
	
	WaitTask(task_cam);

	task_ruki = Task_MoveForward_(ruki, 1.0, false);
	task_boy = Task_MoveForward_(boy, 1.0, false);
	
	Wait_(40);

	DeleteTask_(task_ruki);
	DeleteTask_(task_boy);

	SetMotion_(ruki, MOT_WAIT, BLEND_XL);											//���L���ҋ@
	SetMotion_(boy, MOT_WAIT, BLEND_XL);											//���N�ҋ@

	SetMotion_(ansesu, anse_look_right, BLEND_XL);									//�A���Z�X�E������
	SetMotion_(rena, rena_left, BLEND_XL);											//���i�[�e��������
	
	Wait_(60);

	//�J�b�g3�Ɍ����Ĉʒu�E�\������
	SetMotion_(rena, MOT_WAIT, BLEND_N);											//���i�ҋ@
	SetVisible(boy, false);															//���N��\��
	
	SetPointPos_(boy, "npc_boy001");												// ���N�E���E���i�ړ�
	SetPointPos_(birdy, "npc_birdy001");
	SetPointPos_(rena, "npc_renerte001");
	SetVisible(rena, false);														//���i�[�e��\��
	
	SetDirToObject_(ansesu, ruki);													//�����ύX
	SetDirToObject_(birdy, ruki);
	
	SetMotion_(ansesu, MOT_WAIT, BLEND_N);											//�A���Z�X�ҋ@
	
	//��������������������������������������
	//���J�b�g2 ���L���ɃY�[���C��
	//��������������������������������������
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");
	
	SetMotion_(ruki, MOT_TALK, BLEND_L);											//���L�b��
	WaitMotion(ruki); 
	SetMotion_(ruki, MOT_TALKLOOP, BLEND_M);										//���L�b��L
	
	//-------------------------------------------------------------------------
	//	���Ȃ��̘V�k
	//	�u���낻��o�������H
	//-------------------------------------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_MYSTERY_OLD_WOMAN");
	ShowMsg_("DEMO_115_MSG_010");
	KeyInputWait_();

	//-------------------------------------------------------------------------
	//	���Ȃ��̘V�k
	//	�u���܂Ȃ��ˁc�c���񂽂����̔w���Ɂ@���ׂĂ��@�w���킹���܂����B
	//-------------------------------------------------------------------------
	ShowMsg_("DEMO_115_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//-------------------------------------------------------------------------	

	SetMotion_(ruki, ruki_look_down_L, BLEND_XL);									//���L���ҋ@
	Wait_(10);
	SetFace_(ruki, "Face_loop_close");
	WaitTask(task_cam);
	Wait_(80);

	//��������������������������������������
	//���J�b�g3 �A���Z�X�E���i�[�e�E�o�[�f�B
	//��������������������������������������
	SetVisible(rena, true);															//���i�[�e�\��
	
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");
	//-------------------------------------------------------------------------
	//	���A���Z�X
	//	�u����܂�Ȃ��Ă����B�@�I���������@��������ƌ��߂��񂾁B
	//-------------------------------------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_115_MSG_030");
	
	SetMotion_(ansesu, anse_talk, BLEND_L);											//�A���Z�X�b��
	WaitMotion(ansesu); 
	SetMotion_(ansesu, anse_talk_L, BLEND_M);										//�A���Z�X�b��L

	KeyInputWait_();
	CloseMsgWnd_();
	//-------------------------------------------------------------------------
	SetMotion_(ansesu, MOT_WAIT, BLEND_L);											//�A���Z�X�ҋ@
	SetMotion_(rena, rena_nod, BLEND_XL);											//���i�[�e���ȂÂ�
	WaitMotion(rena); 
	SetMotion_(rena, MOT_WAIT, BLEND_XL);											//���i�ҋ@

	Wait_(40);
	
	//��������������������������������������
	//���J�b�g4 ���i�[�e�A�b�v
	//��������������������������������������
	SetVisible(ansesu, false);														//�A���Z�X��\��
	SetVisible(birdy, false);														//�o�[�f�B��\��

	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");
	
	SetMotion_(rena, MOT_TALK, BLEND_L);											//���i�b��
	WaitMotion(rena); 
	SetMotion_(rena, MOT_TALKLOOP, BLEND_M);										//���i�b��L
	
	//-------------------------------------------------------------------------
	//	���Ȃ��̏���
	//	�u���v�@�K�������Ė߂邩��c�c�B�@���ƔނƂȂ�@�����Ƃ���Ă݂���B
	//-------------------------------------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_MYSTERYGIRL");
	ShowMsg_("DEMO_115_MSG_040");
	KeyInputWait_();
	CloseMsgWnd_();
	//-------------------------------------------------------------------------
	SetMotion_(rena, MOT_WAIT, BLEND_XL);											//���i�ҋ@

	Wait_(40);
	
	//��������������������������������������
	//���J�b�g5 ���L���E���N
	//��������������������������������������
	SetPointPos_(ruki, "npc_rukiya001");											//���L�ړ�

	SetVisible(rena, false);														//���i�[�e��\��
	SetVisible(boy, true);															//���N�\��
	SetMotion_(boy, boy_look_down, BLEND_N);										//���N�������ݑҋ@

	SetPointCameraEye_("cameye002");
	SetPointCameraTarget_("camtgt002");
	
	SetMotion_(ruki, ruki_look_left_L, BLEND_XL);									//���L���ҋ@
	SetFace_(ruki, "Face_default");
	Wait_(60);
	SetMotion_(boy, MOT_WAIT, BLEND_L);											//���N�ҋ@
	Wait_(20);
	//-------------------------------------------------------------------------
	//	���Ȃ��̘V�k
	//	�u���̎q�̂��Ƃ́@�������ɔC���Ă����ȁB�@�G�ɂ́@�w��{�G�ꂳ���₵�Ȃ���B
	//-------------------------------------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_MYSTERY_OLD_WOMAN");
	ShowMsg_("DEMO_115_MSG_050");
	
	SetMotion_(ruki, MOT_TALK, BLEND_L);											//���L�b��
	WaitMotion(ruki); 
	SetMotion_(ruki, MOT_TALKLOOP, BLEND_M);										//���L�b��L

	KeyInputWait_();
	CloseMsgWnd_();
	//-------------------------------------------------------------------------
	SetMotion_(ruki, MOT_WAIT, BLEND_L);											//���L�ҋ@

	Wait_(60);
	
	//��������������������������������������
	//���J�b�g6 �A���E���i�E�o�[
	//��������������������������������������
	SetVisible(ansesu, true);														//�A���Z�X�\��
	SetVisible(birdy, true);														//�o�[�f�B�\��
	SetVisible(rena, true);															//���i�[�e�\��
	SetVisible(boy, false);															//���N��\��
	SetVisible(ruki, false);														//���L��\��

	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");

	SetMotion_(rena, rena_nod, BLEND_XL);											//���i�[�e���ȂÂ�
	WaitMotion(rena); 
	SetMotion_(rena, MOT_WAIT, BLEND_L);											//���i�ҋ@
	Wait_(20);
	//-------------------------------------------------------------------------
	//	���Ȃ��̏���
	//	�u�����c�c�M���Ă����B�@���ꂶ��@���낻��s���܂��傤�H
	//-------------------------------------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_MYSTERYGIRL");
	ShowMsg_("DEMO_115_MSG_060")
	SetMotion_(rena, MOT_TALK, BLEND_L);											//���i�b��
	WaitMotion(rena); 
	SetMotion_(rena, MOT_TALKLOOP, BLEND_M);										//���i�b��L
	Wait_(15);
	SetMotion_(rena, rena_right, BLEND_XL);											//���i�E������
	
	task_anse = Task_WalkAroundToPos(ansesu, GetPos_(rena), 5.5);					//�A���Z�X��������
	WaitTask(task_anse);
	SetMotion_(ansesu, MOT_WAIT, BLEND_M);											//�A���Z�X�ҋ@
	
	KeyInputWait_();
	CloseMsgWnd_();
	//-------------------------------------------------------------------------
	
	SetMotion_(ansesu, anse_nod, BLEND_XL);											//�A���Z�X���ȂÂ�
	WaitMotion(ansesu); 
	SetMotion_(ansesu, MOT_WAIT, BLEND_L);											//�A���Z�X�ҋ@
	Wait_(60);
	//��������������������������������������
	//���J�b�g7 �o�[�f�B�ɏ���Ĕ���
	//��������������������������������������
	SetAlpha_(rena, ALPHA_CLEAR);
	SetMotion_(birdy, birdy_flight_Hovering_L, BLEND_N);							//�o�[�f�B�z�o�����OL
	SetMotion_(ansesu, anse_ride_L, BLEND_N);										//�A���E���i�@���C�h���[�V����
	SetMotion_(rena, rena_ride_hover, BLEND_N);

	AttachObject_(birdy, ansesu, ATTACH_EFFECT2);									//�A���˃o�[�f�B�ɃA�^�b�`
	AttachObject_(ansesu, rena, ATTACH_GLOBAL);										//���i�˃A���Z�X�ɃA�^�b�`
	
	task_cam = Task_AnimeMoveCamera_("anmeye003", "anmtgt003");
	Wait_(3);
	SetAlpha_(rena, ALPHA_EXIST);

	WaitTask(task_cam);
	Wait_(80);
	//��������������������������������������
	//���J�b�g8 �����]��������
	//��������������������������������������
	SetVisible(ruki, true);															//���L�\��
	SetMotion_(ruki, MOT_WAIT, BLEND_N);											//���L�ҋ@
	SetVisible(boy, true);															//���N�\��
	SetDir_(boy, 180);
	SetPointPosNoFit_(birdy, "npc_birdy002");										//���ړ�

	SetPointCameraEye_("cameye004");
	SetPointCameraTarget_("camtgt004");
	
	SetMotion_(ruki, ruki_look_up_L, BLEND_XL);											//���L��ҋ@
	task_birdy = Task_RotateToDir_(birdy, 205, 5);
	WaitTask(task_birdy);
	
	task_cam = Task_AnimeMoveCamera_("anmeye004", "anmtgt004");
	task_birdy = Task_AnimeMoveNoFit_(birdy, "anm_birdy001");
	
	SetMotion_(boy, MOT_WALK, BLEND_M);													//���N����
	task_boy = Task_MoveForward_(boy, 1.0, false);
	Wait_(15);
	DeleteTask_(task_boy);
	SetMotion_(boy, boy_look_up, BLEND_M);												//���N��ҋ@
	
	WaitTask(task_cam);
	Wait_(80);
	//��������������������������������������
	//���J�b�g9 ���L���A�b�v
	//��������������������������������������
	SetVisible(boy, false);															//���N��\��
	SetPointCameraEye_("cameye003");
	SetPointCameraTarget_("camtgt003");

	//-------------------------------------------------------------------------
	//	���Ȃ��̘V�k
	//	�u�܂�������@�ӂ���Ƃ��B�@���̃u���C�N���[���h�́@�������c�c�B
	//-------------------------------------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_MYSTERY_OLD_WOMAN");
	ShowMsg_("DEMO_115_MSG_070");
	KeyInputWait_();
	CloseMsgWnd_();
	
	Wait_(40);

	StopBgm_(3);
	PlaySE_("SE_DEM_050");
	local noise = SetLayoutAnime_("noise_in", false);								//�m�C�Y
	Wait_(30);
	SetSepiaColor_(false);
	EndDemo(FADE_COLOR_WHITE);
}
