//=============================================
//
//		demo606[�Z�E�A���Z�X]
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
	local task_cam, task_player, task_sancho, task_anses, task_slime, task_toge;
	local efc_cam, efc_player;
	local flg;		// �^�X�N���������ǂ����t���O

// �����\�[�X�Ǎ�
	// �L�����N�^�[
	local player = GetPlayerId_();					// ��l��
	local model_dark = ReadNpc_("n008");			// �_�[�N�}�X�^�[
	local model_child = ReadNpc_("n010");			// ��l���q��
	local model_sancho = ReadNpc_("n011");			// �T���`��
	local model_anses = ReadNpc_("n036");			// �A���Z�X
	
	local model_slime = ReadNpc_("m000_00");		// �X���C��
	local model_break_slime = ReadNpc_("m187_00");	// ���X���C��
	local model_toge = ReadNpc_("m127_02");			// �g�Q�W���{�[
	local model_break_toge = ReadNpc_("m195_00");	// ���g�Q�W���{�[
	
	// �G�t�F�N�g
	LoadEffect_("ef712_10_emo_surprise01");			// �u�I�v
	LoadEffect_("ef732_09_light_reactor_c");		// ���A�N�^�[�̌�
	LoadEffect_("ef733_03_sym_core_dream");			// �y���ɔ�΂����Ƃ�
	LoadEffect_("ef860_01_release");				// ��������̉��

// ���z�u
	// ��l��
	SetPointPos_(player, "player000");
	SetAlpha_(player, ALPHA_CLEAR);
	// �_�[�N�}�X�^�[
	local dark = ArrangePointNpc_(model_dark, "npc_dark000");
	SetPointPosNoFit_(dark, "npc_dark000");
	SetAlpha_(dark, ALPHA_CLEAR);
	// ��l���q��
	local child = ArrangePointNpc_(model_child, "player000");
	// �T���`��
	local sancho = ArrangePointNpc_(model_sancho, "npc_sancho000");
	SetScaleSilhouette(sancho, SCALE.SANCHO, SILHOUETTE_WIDTH.SANCHO);
	SetAlpha_(sancho, ALPHA_CLEAR);
	// �A���Z�X
	local anses = ArrangePointNpc_(model_anses, "npc_anses000");
	SetFace_(anses, "Face_smile");				// �Ί�
	SetStepSe_(anses, "SE_FLD_015");
	
	// �X���C��
	local slime = ArrangePointNpc_(model_slime, "npc_slime000");
	SetScaleSilhouette(slime, 0.3, 0.3);
	SetAlpha_(slime, ALPHA_CLEAR);
	// ���X���C��
	local break_slime = ArrangePointNpc_(model_break_slime, "npc_slime001");
	SetScaleSilhouette(break_slime, 0.3, 0.3);
	SetAlpha_(break_slime, ALPHA_CLEAR);
	// �g�Q�W���{�[
	local toge = ArrangePointNpc_(model_toge, "npc_toge000");
	SetScaleSilhouette(toge, 0.5, 0.4);
	SetAlpha_(toge, ALPHA_CLEAR);
	// ���g�Q�W���{�[
	local break_toge = ArrangePointNpc_(model_break_toge, "npc_toge002");
	SetScaleSilhouette(break_toge, 0.5, 0.4);
	SetAlpha_(break_toge, ALPHA_CLEAR);

// ����풓���[�V�����Ǎ�
	// ��l��
	local player_surprise = ReadMotion_(player, "Player_surprise");			// ����
	local player_surprise_L = ReadMotion_(player, "Player_surprise_L");		// ����L
	local player_headache_L = ReadMotion_(player, "Player_headache_L");		// ����L
	local player_caution01_L = ReadMotion_(player, "Player_caution01_L");	// �x��L
	
	// ��l���q��
	local child_caution_L = ReadMotion_(child, "n010_caution_L");			// �x��L
	local child_surprise_L = ReadMotion_(child, "n010_surprise_L");			// ����L
	local child_headache_L = ReadMotion_(child, "n010_headache_L");			// ����L
	local child_look_around_L = ReadMotion_(child, "n010_look_around_L");	// �x�����ĕӂ������L
	
	// �A���Z�X
	local anses_surprise = ReadMotion_(anses, "Player_surprise");			// ����
	local anses_surprise_L = ReadMotion_(anses, "Player_surprise_L");		// ����L
	local anses_talk = ReadMotion_(anses, "Player_talk");					// ����ׂ�
	local anses_talk_L = ReadMotion_(anses, "Player_talk_L");				// ����ׂ�L
	local anses_caution01_L = ReadMotion_(anses, "Player_caution01_L");		// �x��L
	
	// �_�[�N�}�X�^�[
	local dark_surprise_L = ReadMotion_(dark, "n008_surprise_L");			// ����L

// ���J�����ݒ�
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");		// 80F

//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);
	
	// ���J�b�g�P���A���Z�X�ɃY�[���C���`�`�`�`�`�`�`�`�`�`�`�`
	Wait_(15);
	
	SetMotion_(anses, MOT_WALK, BLEND_L);
	Wait_(5);
	task_anses = Task_RotateToDir_(anses, -136, ROTATE_DEMO_DEF);
	WaitTask(task_anses);
	
	SetMotion_(anses, anses_talk, BLEND_M);			// ����ׂ�
	WaitMotion(anses);
	SetMotion_(anses, anses_talk_L, BLEND_M);		// ����ׂ�L
	
	//===============================================
	// ���A���Z�X
	// �u���͂悤�@<name_player/>�I
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ANSESU");
	ShowMsg_("DEMO_606_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetMotion_(anses, MOT_WAIT, BLEND_N);
	DeleteTask_(task_cam);
	
	
	// ���J�b�g�Q����l���t�o�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");
	
	SurpriseDispSetOffset(child, Vec3(0.0, 0.2, 0.0), 0.4);
	SetMotion_(child, child_caution_L, BLEND_M);		// �x��L
	SetFace_(child, "Face_surprise");					// ������
	Wait_(30);
	
	
	// ���J�b�g�R���A���Z�X�Ǝq����l���`�`�`�`�`�`�`�`�`�`�`�`
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");		// 0F��
	DeleteTask_(task_cam);
	
	SetMotion_(anses, anses_talk, BLEND_M);			// ����ׂ�
	WaitMotion(anses);
	SetMotion_(anses, anses_talk_L, BLEND_M);		// ����ׂ�L
	
	//===============================================
	// ���A���Z�X
	// �u����H�@�ǂ������񂾂�H
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ANSESU");
	ShowMsg_("DEMO_606_MSG_020");
	KeyInputWait_();
	
	//-----------------------------------------------
	// ��
	// �u�I���́@�����Ɓ@�����ɂ��邼�B
	//-----------------------------------------------
	ShowMsg_("DEMO_606_MSG_030");
	KeyInputWait_();
	
	// �Y�[���A�E�g
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");		// 150F
	
	//-----------------------------------------------
	// ��
	// �u�����@�I���́@�ǂ��ɂ��s���₵�Ȃ��B
	//-----------------------------------------------
	ShowMsg_("DEMO_606_MSG_040");
	KeyInputWait_();
	
	task_slime = Task_AnimeMoveSetMotion_(slime, "anm_slime000", MOT_WALK, MOT_WAIT);
	task_toge = Task_AnimeMoveSetMotion_(toge, "anm_toge000", MOT_WALK, MOT_WAIT);
	task_sancho = Task_AnimeMoveSetMotion_(sancho, "anm_sancho000", MOT_WALK, MOT_WAIT);
	SetAlpha_(slime, ALPHA_EXIST);
	SetAlpha_(toge, ALPHA_EXIST);
	SetAlpha_(sancho, ALPHA_EXIST);
	
	//-----------------------------------------------
	// ��
	// �u����Ƃ��c�c�B
	//-----------------------------------------------
	ShowMsg_("DEMO_606_MSG_050");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetMotion_(anses, MOT_WAIT, BLEND_XL);
	WaitTask(task_cam);
	WaitTask(task_slime);
	WaitTask(task_toge);
	WaitTask(task_sancho);
	Wait_(60);
	
//	SetFace_(anses, "Face_default");
	SetAlpha_(slime, ALPHA_CLEAR);
	SetAlpha_(toge, ALPHA_CLEAR);
	SetAlpha_(sancho, ALPHA_CLEAR);
	
	
	// ���J�b�g�S���q����l���Y�[���C���`�`�`�`�`�`�`�`�`�`�`�`
	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");		// 90F
	
	//===============================================
	// ���A���Z�X
	// �u���O�́@���̊y�����@�C���Ȃ̂��H
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ANSESU");
	ShowMsg_("DEMO_606_MSG_060");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	efc_cam = SetCameraEffect_("ef733_03_sym_core_dream", 300);
	PlaySE_("SE_DEM_143");
	Wait_(70);
	
	//=====
	StartBlurEffect_();
	StartEarthQuake_(150, 150, 1);
	SetMotion_(child, child_headache_L, BLEND_L);		// ����L
	SetFace_(child, "Face_loop_close02");				// �ڕ��i�΂��ĂȂ��j
	Wait_(60);
	
	StopEarthQuake_();
	DeleteTask_(task_cam);
	
	
	// ���J�b�g�T���A���Z�X����_�[�N�}�X�^�[�֕ϐg�`�`�`�`�`�`
	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");
	
	// ���A���Z�XOut
	StartEarthQuake_(150, 150, 1);
	PlaySE_("SE_DEM_097");
	SetAlphaFade(anses, 0.3, 90);
	
	Wait_(5);
	
	// ���_�[�N�}�X�^�[In
	efc_cam = SetCameraEffect_("ef860_01_release", 30);
	SetAlpha_(anses, ALPHA_CLEAR);
	SetAlphaFade(dark, 1.0, 45);
	
	Wait_(20);
	
	SetMotion_(child, child_look_around_L, BLEND_N);		// �x�����ĕӂ������L
	SetFace_(child, "Face_default");
	SetPointPos_(dark, "npc_dark000");
	SetPointPos_(toge, "npc_toge002");
	SetPointPos_(sancho, "npc_sancho003");
	SetAlpha_(slime, ALPHA_EXIST);
	SetAlpha_(toge, ALPHA_EXIST);
	SetAlpha_(sancho, ALPHA_EXIST);
	StopEarthQuake_();
	
	
	// ���J�b�g�U���q����l���𒆐S�ɂ�����Ǝʂ��`�`�`�`�`�`�`
	task_cam = Task_AnimeMoveCamera_("anmeye003", "anmtgt003");		// 300F
	SetDirToObject_(sancho, player);
	Wait_(30);
	
	// ���ʏ�Out
	task_slime = Task_ObjectFadeOut_(slime, 30);
	task_toge = Task_ObjectFadeOut_(toge, 30);
	Wait_(15);
	
	// ���u���C�NIn
	efc_cam = SetCameraEffect_("ef860_01_release", 30);
	Wait_(5);
	
	DeleteTask_(task_slime);
	DeleteTask_(task_toge);
	SetAlpha_(slime, ALPHA_CLEAR);
	SetAlpha_(toge, ALPHA_CLEAR);
	SetAlpha_(break_slime, 0.1);
	SetAlpha_(break_toge, 0.3);
	task_slime = Task_ObjectFadeIn_(break_slime, 90);
	task_toge = Task_ObjectFadeIn_(break_toge, 45);
	Wait_(45);
	
	// ���u���C�NOut
	DeleteTask_(task_slime);
	DeleteTask_(task_toge);
	task_slime = Task_ObjectFadeOut_(break_slime, 30);
	task_toge = Task_ObjectFadeOut_(break_toge, 30);
	Wait_(15);
	
	// ���ʏ�In
	efc_cam = SetCameraEffect_("ef860_01_release", 30);
	Wait_(5);
	
	DeleteTask_(task_slime);
	DeleteTask_(task_toge);
	SetAlpha_(slime, 0.3);
	SetAlpha_(toge, 0.4);
	SetAlpha_(break_slime, ALPHA_CLEAR);
	SetAlpha_(break_toge, ALPHA_CLEAR);
	task_slime = Task_ObjectFadeIn_(slime, 45);
	task_toge = Task_ObjectFadeIn_(toge, 45);
	Wait_(35);
	
	// ���ʏ�Out
	DeleteTask_(task_slime);
	DeleteTask_(task_toge);
	task_slime = Task_ObjectFadeOut_(slime, 30);
	task_toge = Task_ObjectFadeOut_(toge, 30);
	Wait_(20);
	
	// ���u���C�NIn
	efc_cam = SetCameraEffect_("ef860_01_release", 30);
	Wait_(5);
	
	DeleteTask_(task_slime);
	DeleteTask_(task_toge);
	SetAlpha_(slime, ALPHA_CLEAR);
	SetAlpha_(toge, ALPHA_CLEAR);
	SetAlpha_(break_slime, 0.15);
	SetAlpha_(break_toge, 0.3);
	task_slime = Task_ObjectFadeIn_(break_slime, 120);
	task_toge = Task_ObjectFadeIn_(break_toge, 90);
	Wait_(125);		// �J�b�g�U��Wait�̍��v�� 300F �ɂȂ�悤�ɒ�������
	
	SetPointPosNoFit_(dark, "npc_dark000");
	SetAlpha_(break_slime, ALPHA_CLEAR);
	SetAlpha_(break_toge, ALPHA_CLEAR);
	DeleteTask_(task_cam);
	
	
	// ���J�b�g�V���_�[�N�}�X�^�[����A���Z�X�֕ϐg�`�`�`�`�`�`
	task_cam = Task_AnimeMoveCamera_("anmeye004", "anmtgt004");		// 0F��
	DeleteTask_(task_cam);
	
	// ���_�[�N�}�X�^�[Out
	StartEarthQuake_(150, 150, 1);
	PlaySE_("SE_DEM_097");
	SetAlphaFade(dark, 0.31, 90);
	
	Wait_(5);
	
	// ���A���Z�XIn
	efc_cam = SetCameraEffect_("ef860_01_release", 30);
	SetAlpha_(dark, ALPHA_CLEAR);
	SetAlphaFade(anses, 1.0, 55);
	StopEarthQuake_();
	EndBlurEffect_();
	//=====
	
	// �Y�[���C��
	task_cam = Task_AnimeMoveCamera_("anmeye004", "anmtgt004");		// 75F
	
	SetMotion_(anses, anses_talk, BLEND_XL);			// ����ׂ�
	SetFace_(anses, "Face_smile");					// �Ί�
	WaitMotion(anses);
	SetMotion_(anses, anses_talk_L, BLEND_M);		// ����ׂ�L
	
	//===============================================
	// ���A���Z�X
	// �u�������Ƃ́@�Ȃ����낤�c�c�H
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ANSESU");
	ShowMsg_("DEMO_606_MSG_070");
	KeyInputWait_();
	//-----------------------------------------------
	// ��
	// �u�����Ɓ@�����ɂ���΁@�����B
	//-----------------------------------------------
	ShowMsg_("DEMO_606_MSG_080");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetPointPos_(slime, "npc_slime002");
	SetPointPos_(toge, "npc_toge000");
	SetPointPos_(sancho, "npc_sancho002");
	SetDir_(toge, 75);
	SetMotion_(anses, MOT_WAIT, BLEND_N);
	
	SetAlpha_(child, ALPHA_CLEAR);
	SetAlpha_(slime, ALPHA_EXIST);
	SetAlpha_(toge, ALPHA_EXIST);
	SetAlpha_(sancho, ALPHA_EXIST);
	DeleteTask_(task_cam);
	
	
	// ���J�b�g�W���T���`���ƃ����X�^�[�B�`�`�`�`�`�`�`�`�`�`�`
	SetPointCameraEye_("cameye002");
	SetPointCameraTarget_("camtgt002");
	
	task_sancho = Task_MoveToPointSetSpeed_(sancho, "npc_sancho003", 0.5);
	WaitTask(task_sancho);
	
	MotionTalk(sancho);
	
	//===============================================
	// ���T���`��
	// �u�A���Z�X���܂́@�����Ƃ���f�X�B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_SANCHO");
	ShowMsg_("DEMO_606_MSG_090");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetMotion_(sancho, MOT_WAIT, BLEND_L);
	SetMotion_(slime, MOT_WALK, BLEND_M);
	
	//===============================================
	// *�X���C��
	// �u�{�N�������@�ꏏ����I
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_606_MSG_100");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetMotion_(child, child_caution_L, BLEND_N);		// �x��L
	SetMotion_(sancho, MOT_WAIT, BLEND_N);
	SetMotion_(slime, MOT_WAIT, BLEND_N);
	SetAlpha_(child, ALPHA_EXIST);
	SetAlpha_(slime, ALPHA_CLEAR);
	SetAlpha_(toge, ALPHA_CLEAR);
	SetAlpha_(sancho, ALPHA_CLEAR);
	
	
	// ���J�b�g�X���A���Z�X�Ǝq����l���`�`�`�`�`�`�`�`�`�`�`�`
	SetPointCameraEye_("cameye003");
	SetPointCameraTarget_("camtgt003");
	
	MotionTalk(anses);
	
	//===============================================
	// ���A���Z�X
	// �u����Ƃ��c�c���������ā@���O��
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ANSESU");
	ShowMsg_("DEMO_606_MSG_110");
	SetFace_(anses, "Face_default");	
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	// ���J�b�g10���A���Z�X�t�o�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`
	task_cam = Task_AnimeMoveCamera_("anmeye008", "anmtgt008");		// 120F

	//===============================================
	// ���A���Z�X
	// �u�c�c���i�[�e�Ȃ�ā@�����ɂ́@���Ȃ��B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ANSESU");
	ShowMsg_("DEMO_606_MSG_120");
	KeyInputWait_();
	
	//-----------------------------------------------
	// ��
	// �u�������c�c���i�[�e���@��������@
	//-----------------------------------------------
	ShowMsg_("DEMO_606_MSG_130");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	DeleteTask_(task_cam);
	
	// ���J�b�g11���q����l���Y�[���C���`�`�`�`�`�`�`�`�`�`�`�`
	SetFace_(child, "Face_surprise");					// ������
	task_cam = Task_AnimeMoveCamera_("anmeye005", "anmtgt005");		// 180F
	
	//===============================================
	// ���A���Z�X
	// �u���O�́@�����Ɗւ��ׂ�����@�Ȃ������B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ANSESU");
	ShowMsg_("DEMO_606_MSG_140");
	KeyInputWait_();
	
	while(true)
	{
		//-----------------------------------------------
		// ��
		// �u�Y���@<name_player/>�I
		//-----------------------------------------------
		ShowMsg_("DEMO_606_MSG_150");
		KeyInputWait_();
		CloseMsgWnd_();
		//===============================================
		
		// ����̂݁Atask_cam ������
		if(!flg) {
			DeleteTask_(task_cam);
			flg = true;
		}
		
		// �y�������̏ꍇ�z �� ���[�v�𔲂���
		if (GetQueryResult_() == QUERY2_1) {
			break;
		}
		// �y�͂��̏ꍇ�z
		else {
			SetMotion_(child, child_headache_L, BLEND_L);		// ����L
			SetFace_(child, "Face_loop_close02");				// �ڕ��i�΂��ĂȂ��j
			
			//=====
			StartBlurEffect_();
			StartEarthQuake_(90, 90, 1.5);
			
			Wait_(90);
			
			StopEarthQuake_();
			EndBlurEffect_();
			//=====
			
			SetMotion_(child, child_caution_L, BLEND_L);		// �x��L
			SetFace_(child, "Face_surprise");
			Wait_(10);
			
			//===============================================
			// ���A���Z�X
			// �u<name_player/>�@�Y��Ă��܂��I
			//-----------------------------------------------
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_ANSESU");
			ShowMsg_("DEMO_606_MSG_160");
			KeyInputWait_();
			CloseMsgWnd_();
			//===============================================
			
			SetMotion_(child, child_headache_L, BLEND_L);		// ����L
			SetFace_(child, "Face_loop_close02");				// �ڕ��i�΂��ĂȂ��j
			
			//=====
			StartBlurEffect_();
			StartEarthQuake_(90, 90, 1.5);
			
			Wait_(90);
			
			StopEarthQuake_();
			EndBlurEffect_();
			//=====
			
			SetMotion_(child, child_caution_L, BLEND_L);		// �x��L
			SetFace_(child, "Face_surprise");
			Wait_(10);
			
			//===============================================
			// ���A���Z�X
			// �u�Y���@<name_player/>�I�v�փ��[�v����
			//-----------------------------------------------
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_ANSESU");
		}
	}
	
	efc_cam = SetCameraEffect_("ef733_03_sym_core_dream", 300);
	PlaySE_("SE_DEM_143");
	Wait_(70);
	
	SetPointPos_(toge, "npc_toge003");
	SetPointPos_(sancho, "npc_sancho004");
	SetMotion_(anses, MOT_WAIT, BLEND_N);
	SetAlpha_(slime, ALPHA_EXIST);
	SetAlpha_(toge, ALPHA_EXIST);
	SetAlpha_(sancho, ALPHA_EXIST);
	
	
	// ���J�b�g12����l���A�q�������l�֕ϐg����`�`�`�`�`�`�`
	SetPointCameraEye_("cameye005");
	SetPointCameraTarget_("camtgt005");
	
	//=====
	StartBlurEffect_();
	StartEarthQuake_(150, 150, 1);
	
	SetMotion_(player, player_headache_L, BLEND_L);		// ����L
	SetMotion_(child, child_headache_L, BLEND_L);		// ����L
	SetFace_(player, "Face_loop_close");				// �ڕ�
	SetFace_(child, "Face_loop_close02");				// �ڕ��i�΂��ĂȂ��j
	
	// �q��Out
	StartEarthQuake_(150, 150, 1);
	PlaySE_("SE_DEM_097");
	SetAlphaFade(child, 0.3, 90);
	
	Wait_(5);
	
	// ��lIn
	efc_cam = SetCameraEffect_("ef860_01_release", 30);
	SetAlpha_(child, ALPHA_CLEAR);
	SetAlphaFade(player, 1.0, 55);
	
	StopEarthQuake_();
	EndBlurEffect_();
	//=====
	
	SetMotion_(player, player_caution01_L, BLEND_L);	// �x��L
	SetFace_(player, "Face_default");
	Wait_(5);
	
	SurpriseDispSetOffset(anses, Vec3(0.0, 0.0, 0.0), 0.7);
	SetMotion_(anses, anses_surprise, BLEND_M);			// ����
	WaitMotion(anses);
	SetMotion_(anses, anses_surprise_L, BLEND_M);		// ����L
	
	//===============================================
	// ���A���Z�X
	// �u�Ȃ��c�c�I�H
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ANSESU");
	ShowMsg_("DEMO_606_MSG_170");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetPointPos_(dark, "npc_dark000");
	
	
	// ���J�b�g13���A���Z�X����_�[�N�}�X�^�[�֕ϐg�`�`�`�`�`�`
	task_cam = Task_AnimeMoveCamera_("anmeye006", "anmtgt006");		// 0F��
	DeleteTask_(task_cam);
	
	SetMotion_(anses, anses_caution01_L, BLEND_L);		// �x��L
	SetMotion_(dark, dark_surprise_L, BLEND_L);			// ����L
	
	//=====
	// ���A���Z�XOut
	StartBlurEffect_();
	StartEarthQuake_(205, 205, 1);
	PlaySE_("SE_DEM_097");
	SetAlphaFade(anses, 0.3, 90);
	Wait_(5);
	
	// ���_�[�N�}�X�^�[In
	efc_cam = SetCameraEffect_("ef860_01_release", 30);
	SetAlpha_(anses, ALPHA_CLEAR);
	SetAlphaFade(dark, 0.99, 45);
	
	// ���_�[�N�}�X�^�[Out
	SetAlphaFade(dark, 0.3, 15);
	
	// ���A���Z�XIn
	SetCameraEffect_("ef860_01_release", 30);
	SetAlpha_(anses, ALPHA_EXIST);
	SetAlpha_(dark, ALPHA_CLEAR);
	SetAlphaFade(anses, 1.0, 45);
	Wait_(5);
	
	StopEarthQuake_();
	EndBlurEffect_();
	//=====
	
	SetSelectBoneEffectSetOffset_("ef732_09_light_reactor_c", player, ATTACH_EFFECT1, Vec3(0.0, -2.0, 0.0));
	PlaySE_("SE_FLD_135");		// ���A�N�^�[������
	
	//===============================================
	// �����A�N�^�[
	// �u���͂̐l������@�ُ�����m���܂����B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_REACTOR");
	ShowMsg_("DEMO_606_MSG_180");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	// �Y�[���C��
	task_cam = Task_AnimeMoveCamera_("anmeye006", "anmtgt006");		// 60F
	WaitTask(task_cam);
	
	//===============================================
	// �����A�N�^�[
	// �u����Ԃ��܂��B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_REACTOR");
	ShowMsg_("DEMO_606_MSG_190");
	KeyInputWait_();
	
	//-----------------------------------------------
	// ��
	// �u���͂̐l������@�ُ�����m���܂����B
	//-----------------------------------------------
	ShowMsg_("DEMO_606_MSG_200");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	EndDemo(FADE_COLOR_BLACK);
}
