//=============================================
//
//		demo317[�����A�[�U���[�N�o��]
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
	local task_cam, task_player, task_yetas, task_momonja1, task_silver, task_todo, task_azmk, task_reactor;
	local efc_cam, efc_player, efc_yetas00, efc_yetas01, efc_yetas02, efc_momonja1, efc_silver;
	local efc_reactor0, efc_reactor1, efc_reactor2, efc_reactor3, efc_reactor4;
	local offset_momonja1 = Vec3(0, 5, 0);
	local offset_reactor0 = Vec3(0, 40, 20);
	local offset_reactor1 = Vec3(0, 40.5, 10);

// �����\�[�X�Ǎ�
	// �M�~�b�N
	local model_ice_wall = ReadGimmick_("o_I01_00");// �X�̕�
	local model_proof = ReadGimmick_("o_dem_14");	// �I�T�̏�
	local model_reactor = ReadGimmick_("o_dem_15");	// �I�T�̏؂̃��A�N�^�[
	// �L�����N�^�[
	local player = GetPlayerId_();					// ��l��
	local model_yeti = ReadNpc_("n041");			// �C�G�^�X
	local model_momonja = ReadNpc_("m041_02");		// ���C�W�����񂶂�
	local model_silver = ReadNpc_("m077_00");		// �V���o�[�f�r��
	local model_todo = ReadNpc_("n039");			// �g�[�h�[�e��
	local model_azmk = ReadNpc_("m204_00");			// �A�[�U���[�N
	// �G�t�F�N�g
	LoadEffect_("ef712_10_emo_surprise01");			// �u�I�v
	LoadEffect_("ef712_13_emo_sweat01");			// ��
	LoadEffect_("ef733_01_sym_shuchusen01");				// �W����
	LoadEffect_("ef721_02_nat_smoke_n01");			// ��
	LoadEffect_("ef831_05_black_cyclone");			// ��������
	LoadEffect_("ef831_06_black_feather");			// �����H
	LoadEffect_("ef730_01_oth_dark_aura01");		// �ЁX�����I�[��
	LoadEffect_("ef733_02_sym_black_mist01");		// ������
	LoadEffect_("ef800_04_flying_reactor01");		// ���A�N�^�[��s�J�n
	LoadEffect_("ef831_07_appear_reactor_p");		// ���A�N�^�[�̕��i�o��
	LoadEffect_("ef831_08_union_reactor01");		// ���A�N�^�[�̍���

// ���z�u
	// �X�̕�
	local ice_wall = ArrangePointGimmick_("o_I01_00", model_ice_wall, "obj_ice_wall000");
	
	// �I�T�̏؂̃��A�N�^�[
	local reactor = ArrangePointGimmick_("o_dem_15", model_reactor, "obj_reactor000");
	SetMotion_(reactor, MOT_GIMMICK_1, BLEND_N);
	SetAlpha_(reactor, ALPHA_CLEAR);
	
	// ��l��
	SetPointPos_(player, "player000");
	// �C�G�^�X
	local yetas = ArrangePointNpc_(model_yeti, "npc_yetas000");
	SetScaleSilhouette(yetas, SCALE.N, 0.55);
	SetStepSe_(yetas, "SE_FLD_032");
	SetStepSePan_(yetas, false);
	// �����񂶂�P�E�Q
	local momonja1 = ArrangePointNpc_(model_momonja, "npc_momonja100");
	SetVisible(momonja1, false);
	// �V���o�[
	local silver = ArrangePointNpc_(model_silver, "npc_silver000");
	SetScaleSilhouette(silver, SCALE.N, SILHOUETTE_WIDTH.S);
	SetStepSePan_(silver, false);
	// �g�[�h�[(�I�T�̏؂Ȃ�)
	local todo = ArrangePointNpc_(model_todo, "npc_todo000");
	SetScaleSilhouette(todo, SCALE.TODO, SILHOUETTE_WIDTH.S);
	// �A�[�U���[�N
	local azmk = ArrangePointNpc_(model_azmk, "npc_azmk000");
	SetScaleSilhouette(azmk, SCALE.AZAMUKU, SILHOUETTE_WIDTH.S);
	SetPointPosNoFit_(azmk, "npc_azmk000");
	SetAlpha_(azmk, ALPHA_CLEAR);

	// �I�T�̏؁i�C�G�^�X�ɃA�^�b�`������̂Ȃ̂ŁA�C�G�^�X�����ArrangePointGimmick_����j
	local proof = ArrangePointGimmick_("o_dem_14", model_proof, "obj_proof000");
	SetScaleSilhouette(proof, 1.5, SILHOUETTE_WIDTH.REACTOR);
	SetAlpha_(proof, ALPHA_CLEAR);

// ����풓���[�V�����Ǎ�
	// ��l��
	local player_battle_L = ReadMotion_(player, "Player_battle_L");			// �퓬�ҋ@L
	local player_caution01_L = ReadMotion_(player, "Player_caution01_L");	// �x��L
	local player_look_left_L = ReadMotion_(player, "Player_look_left_L");	// �������ҋ@L
	local player_look_up_L = ReadMotion_(player, "Player_look_up_L");		// ������ҋ@L
	local player_battle01_L = ReadMotion_(player, "Player_battle01_L");		// ������퓬�ҋ@L
	// �C�G�^�X
	local yetas_wait_L = ReadMotion_(yetas, "m038_00_wait_L");				// �ҋ@L
	local yetas_talk_L = ReadMotion_(yetas, "m038_00_talk_L");				// ��bL
	local yetas_laugh_L = ReadMotion_(yetas, "m038_00_laugh_L");			// �ҋ@���΂�
	local yetas_pendant_L = ReadMotion_(yetas, "m038_00_pendant_L");		// �y���_���g������L
	local yetas_retreat = ReadMotion_(yetas, "m038_00_retreat");			// �ҋ@���ジ����
	local yetas_retreat_L = ReadMotion_(yetas, "m038_00_retreat_L");		// �ジ����L
	local yetas_float = ReadMotion_(yetas, "m038_00_float");				// �΂�������
	local yetas_float_L = ReadMotion_(yetas, "m038_00_float_L");			// ����L
	local yetas_attack = ReadMotion_(yetas, "n041_attack");				// �U���i�C�G�^�X�p�j

	// �V���o�[
	local silver_strike = ReadMotion_(silver, "m077_00_strike");			// �ҋ@���n�ʂ�ł��ҋ@
	local silver_wait_right_L = ReadMotion_(silver, "m077_00_wait_right_L");// ����E������L
	local silver_refer = ReadMotion_(silver, "m077_00_refer");				// �ҋ@���C�G�^�X���w����
	local silver_refer_L = ReadMotion_(silver, "m077_00_refer_L");			// �C�G�^�X���w����L
	local silver_wait_above_L = ReadMotion_(silver, "m077_00_wait_above_L");// ������ҋ@L
	// �g�[�h�[(�I�T�̏؂Ȃ�)
	local todo_lay_L = ReadMotion_(todo, "m141_00_lay_L");					// �Ђ�����L
	local todo_strike = ReadMotion_(todo, "m141_00_strike");				// �G�������n�ʂ�������
	// �A�[�U���[�N
	local azmk_appearance = ReadMotion_(azmk, "m204_00_appearance");		// �o��
	local azmk_talk_L = ReadMotion_(azmk, "m204_00_talk_L");				// ��b�i��jL
	local azmk_bow = ReadMotion_(azmk, "m204_00_bow");						// �����������A�N�^�[�����o��
	local azmk_take_reactor_L = ReadMotion_(azmk, "m204_00_take_reactor_L");// ���A�N�^�[�����o��L

// �����[�V�����ݒ�
	SetMotion_(yetas, MOT_WALK, BLEND_N);
	task_yetas = Task_MoveToPointSetSpeed_(yetas, "npc_yetas001", 0.5);
	SetMotion_(todo, todo_lay_L, BLEND_N);
	SetFace_(todo, "Face_look_up");
	
// ���J�����ݒ�
	task_cam = Task_AnimeMoveCamera_("anmeye011", "anmtgt011");		// 60F

//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);
	
	// ���J�b�g�P���C�G�^�X�o��`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`
	WaitTask(task_yetas);
	SetMotion_(yetas, MOT_WAIT, BLEND_L);
	
	//===============================================
	//���C�G�^�X
	//�u�肱���点�Ă��ꂽ�ȁ@�g�[�h�[�I
	//�@�����������@�I�T�̏؂��I
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_IETASU");
	ShowMsg_("DEMO_317_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetMotion_(yetas, yetas_attack, BLEND_XL);
	PlaySE_("SE_DEM_117");
	Wait_(18);
	
	//-----
	SetFade_(FADE_OUT, FADE_COLOR_WHITE, 8);
	WaitFade_();
	
	SetPointPos_(yetas,"npc_yetas002");
	SetMotion_(yetas, yetas_pendant_L, BLEND_N);
	
	SetMotion_(proof, MOT_GIMMICK_0, BLEND_N);
	AttachObject_(yetas, proof, ATTACH_EFFECT1);
	SetAlpha_(proof, ALPHA_EXIST);
	SetMeshVisible_(todo, "Model_2", false);								// �I�T�̏�
	
	Wait_(30);
	SetScaleSilhouette(proof, SCALE.REACTOR, SILHOUETTE_WIDTH.REACTOR);
	
	// ���J�b�g�Q���C�G�^�X�Y�[���A�E�g�`�`�`�`�`�`�`�`�`�`�`�`
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");		// 150F
	InitSilhouetteWidth_(yetas, 0.8);
	SetFade_(FADE_IN, FADE_COLOR_WHITE, FADE_DEF);
	WaitFade_();
	//-----
	
	WaitTask(task_cam);
	Wait_(30);

	// ���J�b�g�R���g�[�h�[�ƃC�G�^�X��b�`�`�`�`�`�`�`�`�`�`�`
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");		// 300F
	InitSilhouetteWidth_(yetas, 1.4);
	//===============================================
	//���g�[�h�[
	//�u�C�G�^�X�@�Ȃ��@����Ȃ��Ƃ��I�H
	//�@���̃I�T�̏؂����@���L���̎c�����c�c�I
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_TODO");
	ShowMsg_("DEMO_317_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	DeleteTask_(task_cam);
	SetAlpha_(todo, ALPHA_CLEAR);
	
	// ���J�b�g3.5���C�G�^�X�t�o�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`
	SetPointCameraEye_("cameye011");
	SetPointCameraTarget_("camtgt011");
	InitSilhouetteWidth_(yetas, 0.7);
	//===============================================
	//���C�G�^�X
	//�u�m���Ă���B������@���߂��̂��B
	//�@���L���̎c�����@��]���@�������������I
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_IETASU");
	ShowMsg_("DEMO_317_MSG_030");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetAlpha_(yetas, ALPHA_CLEAR);
	SetAlpha_(proof, ALPHA_CLEAR);
	SetAlpha_(todo, ALPHA_EXIST);
	DeleteTask_(task_cam);
	
	// ���J�b�g�S���g�[�h�[�Y�[���C���`�`�`�`�`�`�`�`�`�`�`�`�`
	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");		// 15F
	
	SetMotion_(todo, todo_strike, BLEND_M);							// �G�������n�ʂ�������
	task_todo = Task_ChangeMotion_(todo, todo_lay_L, BLEND_M);		// �G����L
	Wait_(25);
	
	SetPointWorldEffect_("ef721_02_nat_smoke_n01", "efc_smoke000");	// ��03
	PlaySE_("SE_DEM_014");		// �{�[�V���N������
	StartEarthQuake_(9, 3, 1);
	Wait_(9);
	StartDecayEarthQuake_(18, 3, 1);
	Wait_(20);
	
	//===============================================
	//���g�[�h�[
	//�u�o�J���I�@������@��������܂�
	//�@�����Ƃ��Ƃ��Ɓ@���L���́@������������I
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_TODO");
	ShowMsg_("DEMO_317_MSG_040");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	DeleteTask_(task_cam);
	DeleteTask_(task_todo);
	SetAlpha_(yetas, ALPHA_EXIST);
	SetAlpha_(proof, ALPHA_EXIST);
	
	// ���J�b�g�T���C�G�e�B�Y�[���C���`�`�`�`�`�`�`�`�`�`�`�`�`
	task_cam = Task_AnimeMoveCamera_("anmeye003", "anmtgt003");		// 180F
	
	//===============================================
	//���C�G�^�X
	//�u����Ȃ��Ƃ́@�m���ȁB
	//�@��ɓ���Ă��܂��΁@�ǂ��ɂł��Ȃ�B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_IETASU");
	ShowMsg_("DEMO_317_MSG_050");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	Wait_(12);
	
	//===============================================
	//*�V���o�[
	//�u�ق��c�c�₯�Ɂ@�}������Ȃ����B
	//�@�����@����ł��@����悤���ȁc�c�C�G�^�X�I
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_317_MSG_060");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetAlpha_(proof, ALPHA_CLEAR);
	SetMotion_(yetas, MOT_WAIT, BLEND_N);
	DeleteTask_(task_cam);
	
	SetMotion_(player, MOT_RUN, BLEND_N);
	task_player = Task_MoveToPointSetSpeed_(player, "player001", 1.0);
	SetMotion_(silver, MOT_RUN, BLEND_N);
	task_silver = Task_MoveToPointSetSpeed_(silver, "npc_silver001", 1.0);
	
	// ���J�b�g�U����l���ƃV���o�[�o��`�`�`�`�`�`�`�`�`�`�`�`
	SetPointCameraEye_("cameye010");
	SetPointCameraTarget_("camtgt010");
	
	WaitTask(task_silver);
	SetMotion_(silver, MOT_WAIT, BLEND_L);
	WaitTask(task_player);
	SetMotion_(player, player_battle_L, BLEND_M);		// �퓬�ҋ@L
	Wait_(15);
	
	// ���J�b�g�V���V���o�[�w�Y�[���C���`�`�`�`�`�`�`�`�`�`�`�`
	task_cam = Task_AnimeMoveCamera_("anmeye004", "anmtgt004");		// 10F
	PlaySE_("SE_DEM_026");	// ��SE:�W����
	efc_cam = SetCameraEffect_("ef733_01_sym_shuchusen01", CAMERA_DEF);	// �W����
	
	
	//===============================================
	//���g�[�h�[
	//�u�V���o�[�I�@�����Ă������̂��I�H
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_TODO");
	ShowMsg_("DEMO_317_MSG_070");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	DeleteEffect_(efc_cam);
	DeleteTask_(task_cam);
	
	SetPointPos_(player, "player002");
	SetPointPos_(silver, "npc_silver002");
	SetPointPos_(yetas, "npc_yetas003");
	SetPointPos_(momonja1, "npc_momonja101");
	SetDir_(todo, -70);
	
	SetMotion_(player, MOT_WALK, BLEND_N);
	SetMotion_(silver, MOT_WALK, BLEND_M);
	task_player = Task_MoveToPointSetSpeed_(player, "player003", 0.5);
	task_silver = Task_MoveToPointSetSpeed_(silver, "npc_silver003", 0.5);
	
	// ���J�b�g�W����l���ƃV���o�[�J�����C���`�`�`�`�`�`�`�`�`
	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");
	InitSilhouetteWidth_(yetas, 1.4);
	SetMotion_(yetas, yetas_retreat, BLEND_M);				// �ҋ@���ジ����
	Task_ChangeMotion_(yetas, yetas_retreat_L, BLEND_M);	// �ジ����L
	
	WaitTask(task_player);
	SetMotion_(player, player_caution01_L, BLEND_L);		// �x��L
	
	WaitTask(task_silver);
	SetMotion_(silver, MOT_WAIT, BLEND_L);
	
	//===============================================
	//���V���o�[
	//�u�����@���ʂ킯�Ȃ����낤�B
	//�@�ƌ����������c�c�^���@�悩�����������ȁB
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_SILVER");
	ShowMsg_("DEMO_317_MSG_080");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetDirToPos_(silver, GetPos_(momonja1));
	SetPointPos_(yetas, "npc_yetas004");
	SetMotion_(yetas, yetas_wait_L, BLEND_N);
	SetAlpha_(todo, ALPHA_CLEAR);
	
	// ���J�b�g�X����l���ƃV���o�[�`�`�`�`�`�`�`�`�`�`�`�`�`�`
	SetPointCameraEye_("cameye002");
	SetPointCameraTarget_("camtgt002");
	
	SetMotion_(silver, silver_wait_right_L, BLEND_XL);	//  ����E������L
	Wait_(10);
	
	SetMotion_(player, player_look_left_L, BLEND_XL);	// �������ҋ@L
	
	//===============================================
	//���V���o�[
	//�u�����@�������Ł@<name_player/>�Ɖ���B
	//�@�����ā@�����̐^���Ɂ@���ǂ�����̂��I
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_SILVER");
	ShowMsg_("DEMO_317_MSG_090");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetMotion_(silver, silver_refer, BLEND_L);		// �C�G�^�X���w����
	task_silver = Task_ChangeMotion_(silver, silver_refer_L, BLEND_M);
	Wait_(5);
	
	// ���J�b�g10���C�G�^�X�ւo�`�m�`�`�`�`�`�`�`�`�`�`�`�`�`�`
	task_cam = Task_AnimeMoveCamera_("anmeye005", "anmtgt005");		// 20F
	StartBlurEffect_();
	
	WaitTask(task_cam);
	EndBlurEffect_();
	
	PlaySE_("SE_DEM_053");												// �u�I�v
	efc_yetas02 = SetPointWorldEffect_("ef712_10_emo_surprise01", "efc_surprise000");// �u�I�v
	SetEffectScale_(efc_yetas02, 0.7);
	SetMotion_(yetas, yetas_retreat, BLEND_M);							// �ҋ@���ジ����
	task_yetas = Task_ChangeMotion_(yetas, yetas_retreat_L, BLEND_M);	// �ジ����L
	
	//===============================================
	//���V���o�[
	//�u�����́@�C�G�^�X���E����
	//�@�Ȃ肷�܂����@�^���Ԃȁ@�j�Z���m���I
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_SILVER");
	ShowMsg_("DEMO_317_MSG_100");
	KeyInputWait_();
	
	//-----------------------------------------------
	//���V���o�[
	//�u���҂��H�@���̂��@�����������I
	//-----------------------------------------------
	ShowMsg_("DEMO_317_MSG_110");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	DeleteTask_(task_yetas);
	DeleteTask_(task_silver);
	SetMotion_(yetas, yetas_wait_L, BLEND_N);								// �ҋ@L
	
	// ���J�b�g11���C�G�^�X�A�b�v�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`
	SetPointCameraEye_("cameye003");
	SetPointCameraTarget_("camtgt003");
	InitSilhouetteWidth_(yetas, 0.7);
	SetPointPosNoFit_(yetas, "npc_yetas004");
	//===============================================
	//���C�G�^�X
	//�u�z�[�b�z�b�z�b�z�b�I
	//�@�܂����@���Ȃ����@�����Ă��炵���Ƃ́B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_IETASU");
	ShowMsg_("DEMO_317_MSG_120");
	KeyInputWait_();
	//===============================================
	
	efc_yetas00 = SetBoneEffect_("ef730_01_oth_dark_aura01", yetas);		// �ЁX�����I�[��
	SetEffectScale_(efc_yetas00, 1.5);
	efc_cam = SetCameraEffect_("ef733_02_sym_black_mist01", 100);				// ������
	
	// ���J�b�g12���C�G�^�X�o�`�m�t�o�`�`�`�`�`�`�`�`�`�`�`�`�`
	SetMotion_(yetas, yetas_float, BLEND_XL);
	task_yetas = Task_AnimeMoveNoFitSetMotion_(yetas, "anm_yetas000", yetas_float, yetas_float_L);	// �΂�������
	task_cam = Task_AnimeMoveCamera_("anmeye006", "anmtgt006");		// 40F
	
	//===============================================
	//���C�G�^�X
	//�u�Ƃ񂾌�Z�ł����c�c���́@����܂���˂��B
	//�@���łɁ@���߂��J�M�́@�䂪��ɂ���I
	//-----------------------------------------------
	ShowMsg_("DEMO_317_MSG_130");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	WaitTask(task_cam);
	DeleteEffectEmitter_(efc_yetas00);
	
	// ���J�b�g13���C�G�^�X�փY�[���C���`�`�`�`�`�`�`�`�`�`�`�`
	task_cam = Task_AnimeMoveCamera_("anmeye007", "anmtgt007");			// 60F
	efc_yetas00 = SetSelectBoneEffect_("ef831_05_black_cyclone", yetas, ATTACH_GLOBAL);		// ��������
	efc_yetas01 = SetSelectBoneEffect_("ef831_06_black_feather", yetas, ATTACH_GLOBAL);		// �����H
	PlaySE_("SE_DEM_118");
	Wait_(45);
	
	//-----
	SetFade_(FADE_OUT, FADE_COLOR_WHITE, 8);
	WaitFade_();
	
	SetAlpha_(player, ALPHA_CLEAR);
	SetAlpha_(silver, ALPHA_CLEAR);
	SetAlpha_(todo, ALPHA_CLEAR);
	
	SetAlpha_(yetas, ALPHA_CLEAR);
	SetAlpha_(azmk, ALPHA_EXIST);
	SetMotion_(azmk, azmk_appearance, BLEND_N);
	DeleteTask_(task_cam);
	DeleteTask_(task_yetas);
	DeleteEffect_(efc_cam);
	DeleteEffect_(efc_yetas00);
	DeleteEffect_(efc_yetas01);
	
	// ���J�b�g14���A�[�U���[�N�o��`�`�`�`�`�`�`�`�`�`�`�`�`�`
	task_cam = Task_AnimeMoveCamera_("anmeye008", "anmtgt008");		// 125F
	
	SetFade_(FADE_IN, FADE_COLOR_WHITE, FADE_DEF);
	//-----
	PlayBgm_("BGM_007");
	Wait_(60);
	PlaySE_("SE_FLD_036");		// �u�o�T�b�v
	SetBoneEffect_("ef831_06_black_feather", azmk);
	Wait_(5);
	efc_cam = SetCameraEffect_("ef733_01_sym_shuchusen01", CAMERA_DEF);	// �W����
	Wait_(15);
	DeleteEffect_(efc_cam);
	
	WaitMotion(azmk);
	SetMotion_(azmk, MOT_WAIT, BLEND_L);
	
	Wait_(30);
	
	SetPointPos_(player, "player004");
	SetPointPos_(silver, "npc_silver004");
	SetPointPos_(todo, "npc_todo001");
	SetAlpha_(player, ALPHA_EXIST);
	SetAlpha_(silver, ALPHA_EXIST);
	SetAlpha_(todo, ALPHA_EXIST);
	SetMotion_(player, player_battle01_L, BLEND_N);
	SetMotion_(silver, silver_wait_above_L, BLEND_N);
	SetMotion_(todo, MOT_WAIT, BLEND_N);
	
	// ���J�b�g15���A�[�U���[�N������`�`�`�`�`�`�`�`�`�`�`�`�`
	SetPointCameraEye_("cameye004");
	SetPointCameraTarget_("camtgt004");
	
	//===============================================
	//���g�[�h�[
	//�u�Ȃ񂶂Ⴀ�@���񂵂́I�H
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_TODO");
	ShowMsg_("DEMO_317_MSG_140");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	// ���J�b�g16���A�[�U���[�N�t�o�`�`�`�`�`�`�`�`�`�`�`�`�`�`
	task_cam = Task_AnimeMoveCamera_("anmeye009", "anmtgt009");		// 90F
	
	Wait_(60);	
	//===============================================
	//*�A�[�U���[�N
	//�u�킽���[�����́@���O�͂��[���I
	//�@�A�@�@�@�U���D�D�D�N�b�I�I
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_317_MSG_150");
	KeyInputWait_();
	CloseMsgWnd_();	
	SetMotion_(azmk, azmk_bow, 30);		// �����������A�N�^�[�����o��
	WaitMotion(azmk);
	SetMotion_(azmk, azmk_take_reactor_L, BLEND_N);	
	//-----------------------------------------------
	//���A�[�U���[�N
	//�u�_�[�N�}�X�^�[���܂́@�����Ȃ�@�����Ƃ���
	//�@���W�X�^���X�̊�]�c�c���������܂���I
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_AZAMUKU");
	ShowMsg_("DEMO_317_MSG_160");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	WaitTask(task_cam);
	
	// ���J�b�g17�����A�N�^�[�փY�[���C���`�`�`�`�`�`�`�`�`�`�`
	task_cam = Task_AnimeMoveCamera_("anmeye012", "anmtgt012");		// 90F
	
	efc_reactor1 = SetSelectBoneEffect_("ef831_07_appear_reactor_p", reactor, ATTACH_EFFECT1);
	efc_reactor2 = SetSelectBoneEffect_("ef831_07_appear_reactor_p", reactor, ATTACH_EFFECT2);
	PlaySE_("SE_DEM_119");
	Wait_(5);
	
	SetAlpha_(reactor, ALPHA_EXIST);
	local effectId = SetSelectBoneEffect_("ef831_07_appear_reactor_p", reactor, ATTACH_GLOBAL);
	
	Wait_(30);
	local effectId2 = SetSelectBoneEffectSetOffset_("ef831_08_union_reactor01", reactor, ATTACH_GLOBAL, Vec3(0.0, 0.0, 0.0));
	SetMotion_(reactor, MOT_GIMMICK_2, BLEND_N);		// �������n�߂�
	Wait_(70);
	
	//===============================================
	//���t���b�V���̂悤�ȃt�F�[�h�A�E�g
	SetFade_(FADE_OUT, FADE_COLOR_WHITE, 10);
	Wait_(20);

	DeleteEffectEmitter_(efc_reactor1);
	DeleteEffectEmitter_(efc_reactor2);
	DeleteEffectEmitter_(effectId);

	SetAlpha_(reactor, ALPHA_CLEAR);
	SetMotion_(reactor, MOT_GIMMICK_3, BLEND_N);		// ����������
	
	
	// ���J�b�g18���A�[�U���[�N�A�Y�[���A�E�g�`�`�`�`�`�`�`�`�`
	task_cam = Task_AnimeMoveCamera_("anmeye010", "anmtgt010");		// 120F
	
	task_reactor = Task_ObjectFadeIn_(reactor, 30);
	efc_reactor0 = SetSelectBoneEffect_("ef800_04_flying_reactor01", reactor, ATTACH_GLOBAL);

	SetFade_(FADE_IN, FADE_COLOR_WHITE, FADE_DEF);
	WaitFade_();
	//===============================================
	Wait_(10);
	WaitTask(task_reactor);
	WaitTask(task_cam);
	DeleteEffectEmitter_(effectId2);
	
	//===============================================
	//���A�[�U���[�N
	//�u�����I�@���̃��L������́@���A�N�^�[���I
	//�@�c���ꂵ�@��]�ւ́@�J�M�ƂȂ�I
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_AZAMUKU");
	ShowMsg_("DEMO_317_MSG_170");
	KeyInputWait_();
	
	//-----------------------------------------------
	//���A�[�U���[�N
	//�u��]�c�c����́@��X���@�|�����߂�
	//�@�؂�D�ƂȂ镨�Ɂ@�Ⴂ����܂��񂩂�˂��I
	//-----------------------------------------------
	ShowMsg_("DEMO_317_MSG_180");
	KeyInputWait_();
	
	//-----------------------------------------------
	//���A�[�U���[�N
	//�u���W�X�^���X�́@�m���ȁ@�łт̂��߂Ɂc�c
	//�@�ׂ����ā@���������܂���[���I
	//-----------------------------------------------
	ShowMsg_("DEMO_317_MSG_190");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetBoneEffect_("ef831_05_black_cyclone", azmk);		// ��������
	PlaySE_("SE_DEM_120");
	Wait_(22);
	
	//-----
	SetFade_(FADE_OUT, FADE_COLOR_WHITE, 8);
	WaitFade_();
	
	SetAlpha_(azmk, ALPHA_CLEAR);
	SetAlpha_(reactor, ALPHA_CLEAR);
	DeleteEffect_(efc_reactor0);
	SetBoneEffect_("ef831_06_black_feather", azmk);		// �����H
	
	SetFade_(FADE_IN, FADE_COLOR_WHITE, 8);
	WaitFade_();
	//-----
	
	Wait_(30);
	
	// ���J�b�g19���R�l�������`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`
	SetPointCameraEye_("cameye009");
	SetPointCameraTarget_("camtgt009");
	
	//===============================================
	//���V���o�[
	//�u���A�N�^�[���@�D��ꂽ���I
	//�@�z�߁c�c�S�̔��M�́@����������C���ȁI
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_SILVER");
	ShowMsg_("DEMO_317_MSG_200");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	//===============================================
	//���g�[�h�[
	//�u���L���̌��������@�_����������Ƃ́c�c�B
	//�@�V���o�[�I�@���V����@�}���Œǂ����I
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_TODO");
	ShowMsg_("DEMO_317_MSG_210");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetAlpha_(player, ALPHA_EXIST);
	SetDir_(player, 210);
	SetAlpha_(todo, ALPHA_CLEAR);
	SetAlpha_(silver, ALPHA_CLEAR);
	
	// ���J�b�g20����l���t�o�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`
	SetPointCameraEye_("cameye008");
	SetPointCameraTarget_("camtgt008");
	
	Wait_(5);
	//===============================================
	//���g�[�h�[
	//�u�����Ƃ����ȁH�@�A�[�U���[�N�߂�
	//�@���񂵂�@���W�X�^���X��łڂ��̂��@�ړI�I
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_TODO");
	ShowMsg_("DEMO_317_MSG_220");
	KeyInputWait_();
	
	//-----------------------------------------------
	//���g�[�h�[
	//�u�z����@�̂��΂点�Ă����΁@���񂵂ɂ�
	//�@�K���@�Ђ����@�~�肩����͂�����I
	//-----------------------------------------------
	ShowMsg_("DEMO_317_MSG_230");
	KeyInputWait_();
	CloseMsgWnd_();
	//-----------------------------------------------
	
	SetAlpha_(todo, ALPHA_EXIST);
	SetAlpha_(player, ALPHA_CLEAR);
	
	// ���J�b�g21���g�[�h�[�t�o�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`
	SetPointCameraEye_("cameye007");
	SetPointCameraTarget_("camtgt007");
	
	SetFace_(todo, "Face_default");
	Wait_(5);
	//-----------------------------------------------
	//���g�[�h�[
	//�u���V����@�������ǂ��B���񂵂́@��s��
	//�@�쓌�ɂ���@�S�̔��M�ɍs���@�z���~�߂Ă���I
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_TODO");
	ShowMsg_("DEMO_317_MSG_240");
	KeyInputWait_();
	
	//-----------------------------------------------
	//���g�[�h�[
	//�u���M�́@�΂̐^�񒆂Ł@�����@��������܂�
	//�@������ł��邩��@�����킩��͂�����I
	//-----------------------------------------------
	ShowMsg_("DEMO_317_MSG_250");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	EndDemo(FADE_COLOR_BLACK);
}
