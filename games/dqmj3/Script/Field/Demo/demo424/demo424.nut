//=============================================
//
//		demo424[�A���Z�X�̍Ō�_2(�ߋ��f��-�쓹)]
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
	local task_cam, task_player, task_birdy, task_ansesu, task_rena;
	local task_archbreak, task_nagekibreak00, task_nagekibreak01
	local task_chimerabreak00, task_chimerabreak01, task_chimerabreak02;
	local efc_player, efc_cam;

// �����\�[�X�Ǎ�
	// �L�����N�^�[
	local ansesu = GetPlayerId_();							// ��l���H(�A���Z�X)
	local model_rena = ReadNpc_("n007");					// �Ȃ��̏���(���i�[�e)
	local model_birdy = ReadNpc_("n019");					// �Ȃ��̒��i�o�[�f�B�j
	local model_archbreak = ReadNpc_("m202_00");			// �A�[�N�u���C�N
	local model_nagekibreak = ReadNpc_("m197_00");			// �Ȃ����̃u���C�N
	local model_chimerabreak = ReadNpc_("m188_00");			// �u���C�N�L����
	// �G�t�F�N�g
	LoadEffect_("ef733_01_sym_shuchusen01");				// �W����
	// ���C�A�E�g
	LoadLayout_("noise");									// �m�C�Y

// ���z�u
	// ��l���H(�A���Z�X)
	SetPointPos_(ansesu, "npc_ansesu000");
	// �Ȃ��̏���(���i�[�e)
	local rena = ArrangePointNpc_(model_rena, "npc_birdy000");
	// �Ȃ��̒��i�o�[�f�B�j
	local birdy = ArrangePointNpc_(model_birdy, "npc_birdy000");
	SetScaleSilhouette(birdy, SCALE.N, SILHOUETTE_WIDTH.N);
	// �A�[�N�u���C�N
	local archbreak = ArrangePointNpc_(model_archbreak, "npc_ansesu000");
	SetScaleSilhouette(archbreak, SCALE.M, SILHOUETTE_WIDTH.M);
	// �Ȃ����̃u���C�N�P
	local nagekibreak00 = ArrangePointNpc_(model_nagekibreak, "npc_ansesu000");
	SetScaleSilhouette(nagekibreak00, SCALE.N, SILHOUETTE_WIDTH.N);
	// �Ȃ����̃u���C�N�Q
	local nagekibreak01 = ArrangePointNpc_(model_nagekibreak, "npc_ansesu000");
	SetScaleSilhouette(nagekibreak00, SCALE.N, SILHOUETTE_WIDTH.N);
	// �u���C�N�L�����P
	local chimerabreak00 = ArrangePointNpc_(model_chimerabreak, "npc_ansesu000");
	SetScaleSilhouette(chimerabreak00, SCALE.N, SILHOUETTE_WIDTH.N);
	// �u���C�N�L�����Q
	local chimerabreak01 = ArrangePointNpc_(model_chimerabreak, "npc_ansesu000");
	SetScaleSilhouette(chimerabreak01, SCALE.N, SILHOUETTE_WIDTH.N);
	// �u���C�N�L�����R
	local chimerabreak02 = ArrangePointNpc_(model_chimerabreak, "npc_ansesu000");
	SetScaleSilhouette(chimerabreak02, SCALE.N, SILHOUETTE_WIDTH.N);

// �������ݒ�
	SetStepSe_(ansesu, SILENT_STEP_SE);
	SetStepSe_(rena, SILENT_STEP_SE);
	SetStepSe_(birdy, SILENT_STEP_SE);
	SetStepSe_(archbreak, SILENT_STEP_SE);
	SetStepSe_(nagekibreak00, SILENT_STEP_SE);
	SetStepSe_(nagekibreak00, SILENT_STEP_SE);
	SetStepSe_(chimerabreak00, SILENT_STEP_SE);
	SetStepSe_(chimerabreak01, SILENT_STEP_SE);
	SetStepSe_(chimerabreak02, SILENT_STEP_SE);

// ����풓���[�V�����Ǎ�
	// ��l���H(�A���Z�X)
	local anse_ride_on = ReadMotion_(ansesu, "Player_ride_on");// ���C�h�I��
	local anse_flight_glide_L = ReadMotion_(ansesu, "Player_flight_glide_L");// ����L
	local anse_flight_Hovering_L = ReadMotion_(ansesu, "Player_flight_Hovering_L");// ��s(�z�o�����O)L
	local anse_turn_L = ReadMotion_(ansesu, "Player_turn_L")// �U��Ԃ�L

	// �Ȃ��̏���(���i�[�e)
	local rena_ride_hover_L = ReadMotion_(rena, "n007_ride_hovering_L");// �z�o�����O���̃o�[�f�B�ɏ��(�A���Z�X�ɃA�^�b�`���K�v)
	local rena_ride_L = ReadMotion_(rena, "n007_ride_L");	// ���󎞂̃o�[�f�B�ɏ��(�A���Z�X�ɃA�^�b�`���K�v)

	// �Ȃ��̒��i�o�[�f�B�j
	local birdy_flight_Hovering_L = ReadMotion_(birdy, "n019_flight_Hovering_L");// ��s(�z�o�����O)L
	local birdy_glide_L = ReadMotion_(birdy, "n019_flight_glide_L");// ����

// �����Ԑݒ�
	SetTime_(START_TIME_ZONE_NIGHT);

// ���F���ݒ�
	ChangeColorSepia();

	ReadWaitingLod("lodeye000", "lodtgt000");

// ���������[�V����
	SetMotion_(birdy, birdy_glide_L, BLEND_N);				// �o�[�f�B�@����L
	SetMotion_(ansesu, anse_flight_glide_L, BLEND_N);		// �A���Z�X�@����L
	SetMotion_(rena, rena_ride_L, BLEND_N);					// ���i�[�e�@���C�h���[�V����

	AttachObject_(birdy, ansesu, ATTACH_EFFECT2);			//�A���Z�X�˃o�[�f�B�ɃA�^�b�`
	AttachObject_(ansesu, rena, ATTACH_GLOBAL);				//���i�[�e�˃A���Z�X�ɃA�^�b�`

	SetMotionSpeed_(archbreak, 2.5);

	//�ꗥ�����Ă��܂����[�V�������o�������Ă���
	Wait_(2);
	SetMotion_(chimerabreak02, MOT_WALK, BLEND_N);			// �u���C�N�L�����R�@����
	Wait_(1);
	SetMotion_(chimerabreak02, MOT_WAIT, BLEND_N);			// �u���C�N�L�����R�@�ҋ@
	Wait_(2);
	SetMotion_(chimerabreak01, MOT_WALK, BLEND_N);			// �u���C�N�L�����Q�@����
	SetMotion_(nagekibreak01, MOT_WALK, BLEND_N);			// �Ȃ����̃u���C�N�Q�@����
	Wait_(1);
	SetMotion_(chimerabreak01, MOT_WAIT, BLEND_N);			// �u���C�N�L�����Q�@�ҋ@
	SetMotion_(nagekibreak01, MOT_WAIT, BLEND_N);			// �Ȃ����̃u���C�N�Q�@�ҋ@

	//��������������������������������������
	//���J�b�g1�@�A���Z�X�ƃ��i�[�e�ƃo�[�f�B�ƓG�Q�@�A���Z�X�B����с��G�Q�ǌ��@������
	//��������������������������������������

// ���J�����ݒ�
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");

//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_WHITE);

	SetLayoutAnime_("noise_in", false);													//�m�C�Y�@�C��
	PlayBgm_("BG_AMBI_016");															//�m�C�Y���n�܂���������a�f�l�Đ�
	WaitLayoutAnime();
	SetLayoutAnime_("noise_out", false);												//�m�C�Y�@�A�E�g
	WaitLayoutAnime(); 
	
	task_birdy = Task_AnimeMoveNoFit_(birdy, "anm_birdy000");
	task_rena = Task_AnimeMoveNoFit_(rena, "anm_birdy000");
	WaitTask(task_birdy);
	DeleteTask_(task_birdy);
	Wait_(8);
	SetPointPos_(archbreak, "npc_archbreak000");//�\�ߑO�X�����Ă���
	task_archbreak = Task_AnimeMoveNoFit_(archbreak, "anm_archbreak000");
	Wait_(3);
	task_nagekibreak00 = Task_AnimeMoveNoFit_(nagekibreak00, "anm_nagekibreak000");
	Wait_(4);
	task_chimerabreak00 = Task_AnimeMoveNoFit_(chimerabreak00, "anm_chimerabreak000");
	Wait_(3);
	task_chimerabreak01 = Task_AnimeMoveNoFit_(chimerabreak01, "anm_chimerabreak100");
	task_chimerabreak02 = Task_AnimeMoveNoFit_(chimerabreak02, "anm_chimerabreak200");
	Wait_(7);
	task_nagekibreak01 = Task_AnimeMoveNoFit_(nagekibreak01, "anm_nagekibreak100");
	WaitTask(task_nagekibreak01);
	DeleteTask_(task_archbreak);
	DeleteTask_(task_nagekibreak00);
	DeleteTask_(task_nagekibreak01);
	DeleteTask_(task_chimerabreak00);
	DeleteTask_(task_chimerabreak01);
	DeleteTask_(task_chimerabreak02);
	Wait_(2);

	//�`���f�肷�邱�Ƃ�����̂Ő�ɔz�u���Ă���
	task_birdy = Task_AnimeMoveNoFit_(birdy, "anm_birdy001");
	DeleteTask_(task_rena);
	task_rena = Task_AnimeMoveNoFit_(rena, "anm_birdy001");
	SetPointPos_(archbreak, "npc_archbreak001");//�\�ߑO�X�����Ă���
	task_archbreak = Task_AnimeMoveNoFit_(archbreak, "anm_archbreak001");
	task_nagekibreak00 = Task_AnimeMoveNoFit_(nagekibreak00, "anm_nagekibreak001");
	task_nagekibreak01 = Task_AnimeMoveNoFit_(nagekibreak01, "anm_nagekibreak101");
	task_chimerabreak00 = Task_AnimeMoveNoFit_(chimerabreak00, "anm_chimerabreak001");
	task_chimerabreak01 = Task_AnimeMoveNoFit_(chimerabreak01, "anm_chimerabreak101");
	task_chimerabreak02 = Task_AnimeMoveNoFit_(chimerabreak02, "anm_chimerabreak201");
	Wait_(1);


	//��������������������������������������
	//���J�b�g2�@�A���Z�X�ƃ��i�[�e�ƃo�[�f�B�ƓG�Q�@��Ɠ����@�΂߂���(�o�[�f�B�ʉߎ��J�����h��)
	//��������������������������������������

	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");

	Wait_(65);
	StartDecayEarthQuake_(36, 6, 4.0);
	Wait_(36);
	StopEarthQuake_();
	DeleteTask_(task_birdy);
	Wait_(5);

	task_birdy = Task_AnimeMoveNoFit_(birdy, "anm_birdy002");//�`���f�肷�邱�Ƃ�����̂Ő�ɔz�u���Ă���
	DeleteTask_(task_rena);
	task_rena = Task_AnimeMoveNoFit_(rena, "anm_birdy002");
	Wait_(1);
	DeleteTask_(task_archbreak);
	DeleteTask_(task_nagekibreak00);
	DeleteTask_(task_nagekibreak01);
	DeleteTask_(task_chimerabreak00);
	DeleteTask_(task_chimerabreak01);
	DeleteTask_(task_chimerabreak02);


	//��������������������������������������
	//���J�b�g3�@�A���Z�X�ƃ��i�[�e�ƃo�[�f�B�@�΂߉����犊��ŃJ�����C�����؋�@�����ɃY�[���C��
	//��������������������������������������

	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");

	Wait_(16);
	SetMotion_(ansesu, anse_flight_Hovering_L, BLEND_L);	// �A���Z�X�@��s(�z�o�����O)L
	SetMotion_(rena, rena_ride_hover_L, BLEND_L);			// ���i�[�e�@�z�o�����OL
	SetMotion_(birdy, birdy_flight_Hovering_L, BLEND_L);	// �o�[�f�B�@��s(�z�o�����O)L
	WaitTask(task_birdy);
	DeleteTask_(task_birdy);
	task_birdy = Task_RotateToDir_(birdy, -15, 10);
	WaitTask(task_birdy);
	DeleteTask_(task_birdy);
	DeleteTask_(task_cam);

	//===============================================
	//*�A���Z�X
	//�u�������I�@�������z�炾�I
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_424_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	Wait_(10);

	//��������������������������������������
	//���J�b�g4�@�A���Z�X�ƃ��i�[�e�@��b�@�΂߁��A���Z�X�ɃY�[���C��
	//��������������������������������������

	SetPointCameraEye_("cameye002");
	SetPointCameraTarget_("camtgt002");

	Wait_(10);

	//===============================================
	//���Ȃ��̏���
	//�u���̂܂܂��Ɓ@������ǂ������c�c�I
	//�@�ǂ�����́c�c�H
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_MYSTERYGIRL");
	ShowMsg_("DEMO_424_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	Wait_(10);
	SetFace_(ansesu, "Face_loop_close");					// �A���Z�X�@�ڕ�
	Wait_(10);
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");
	WaitTask(task_cam);
	DeleteTask_(task_cam);
	Wait_(5);
	SetFace_(ansesu, "Face_default");						// �A���Z�X�@�ڊJ��
	Wait_(30);

	//��������������������������������������
	//���J�b�g5�@�A���Z�X�ƃ��i�[�e�@�A���Z�X��э~��@�J���������΂߂���
	//��������������������������������������

	SetPointCameraEye_("cameye003");
	SetPointCameraTarget_("camtgt003");

	DetachObject_(birdy);
	DetachObject_(ansesu);
	AttachObject_(birdy, rena, ATTACH_EFFECT2);				//���i�[�e�˃o�[�f�B�ɃA�^�b�`
	task_ansesu = Task_AnimeMoveNoFit_(ansesu, "anm_ansesu000");
	SetMotion_(ansesu, anse_ride_on, BLEND_N);
	Wait_(40);
	DeleteTask_(task_ansesu);

	//��������������������������������������
	//���J�b�g6�@�A���Z�X�ƓG�Q�@�A���Z�X�ҋ@���U������@�w�㉓�߁��w���Y�[���C��
	//��������������������������������������

	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");

	SetPointPosNoFit_(ansesu, "npc_ansesu001");
	SetPointPosNoFit_(archbreak, "npc_archbreak002");
	SetPointPosNoFit_(nagekibreak00, "npc_nagekibreak000");
	SetPointPosNoFit_(nagekibreak01, "npc_nagekibreak100");
	SetPointPosNoFit_(chimerabreak00, "npc_chimerabreak000");
	SetPointPosNoFit_(chimerabreak01, "npc_chimerabreak100");
	SetPointPosNoFit_(chimerabreak02, "npc_chimerabreak200");
	SetMotion_(ansesu, MOT_WAIT, BLEND_N);					// �A���Z�X�@�ҋ@
	Wait_(100);
	SetMotion_(ansesu, anse_turn_L, BLEND_L);				// �A���Z�X�@�U��Ԃ�L
	SetFace_(ansesu, "Face_left");
	Wait_(5);
	DeleteTask_(task_cam);

	//===============================================
	//*�A���Z�X
	//�u�I�����@���Ƃ�ɂȂ�B
	//�@���̊ԂɁ@���O�����́@������񂾁B
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_424_MSG_030");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	Wait_(4);
	//�`���f�肷��̂Ő�ɔz�u���Ă���
	SetMotion_(birdy, birdy_glide_L, BLEND_N);				// �o�[�f�B�@����
	SetMotion_(rena, rena_ride_L, BLEND_N);					// ���i�[�e�@���C�h���[�V����
	SetMotionSpeed_(birdy, 0.75);
	SetMotionSpeed_(rena, 0.75);
//	SetFace_(rena, "Face_sad");								// ���i�[�e�@�߂���
	Wait_(1);

	//��������������������������������������
	//���J�b�g7�@���i�[�e�@�z�o�����O�@�΂ߐ��ʁ��Y�[���C��
	//��������������������������������������

	task_cam = Task_AnimeMoveCamera_("anmeye003", "anmtgt003");

	efc_cam = SetCameraEffect_("ef733_01_sym_shuchusen01", CAMERA_DEF);// �W����
	Wait_(10);
	DeleteEffectEmitter_(efc_cam);
	DeleteTask_(task_cam);

	//===============================================
	//���Ȃ��̏���
	//�u����́@�_���c�c�I
	//�@���Ȃ����@���Ȃ��Ɓc�c�I
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_MYSTERYGIRL");
	ShowMsg_("DEMO_424_MSG_040");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	Wait_(10);

	//��������������������������������������
	//���J�b�g8�@�A���Z�X�@�U�����������@�w��΂�
	//��������������������������������������

	SetPointCameraEye_("cameye004");
	SetPointCameraTarget_("camtgt004");

	SetVisible(nagekibreak01, false);
	SetVisible(chimerabreak02, false);
	Wait_(5);

	//===============================================
	//*�A���Z�X
	//�u���v���c�c���Ȃ��B
	//�@�I���́@�s���g�́������������H�@��
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_424_MSG_050");
	KeyInputWait_();
	//===============================================
	SetFace_(ansesu, "Face_default");
	SetMotion_(ansesu, MOT_WAIT, 10);						// �A���Z�X�@�ҋ@

//	//===============================================
//	//*�A���Z�X
//	//�u������I
//	//-----------------------------------------------

	CloseMsgWnd_();
	
	//===============================================

	Wait_(8);
	SetMotion_(ansesu, MOT_RUN, 6);							// �A���Z�X�@����
	task_ansesu = Task_AnimeMoveNoFit_(ansesu, "anm_ansesu001");
	Wait_(23);
	DeleteTask_(task_ansesu);
	SetMotion_(ansesu, MOT_WAIT, BLEND_N);					// �A���Z�X�@�ҋ@
	
	StopBgm_(3);
	PlaySE_("SE_DEM_126");
	SetLayoutAnime_("noise_in", false);						// �m�C�Y�@�C��
	WaitLayoutAnime();
	SetLayoutAnime_("noise_loop", true);					// �m�C�Y�@���[�v	

	EndDemo(FADE_COLOR_WHITE);
}
