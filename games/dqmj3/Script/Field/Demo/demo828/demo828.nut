//=============================================
//
//		demo828[�_�O�W���K���}�ɏ���]
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
	local task_cam, task_aroma, task_garuma, task_seed;
	local efc_seed000, efc_seed001, efc_garuma, efc_bone000, efc_bone001, efc_bone002, efc_bone003, efc_bone004, efc_bone005;

// �����\�[�X�Ǎ�
	// �M�~�b�N
	local model_core000 = ReadGimmick_("o_C03_02");	// �}�U�[
	local model_core100 = ReadGimmick_("o_C03_03");	// �}�U�[����
	// �L�����N�^�[
	local player = GetPlayerId_();					// ��l��
	local model_aroma = ReadNpc_("n018");			// �A���}
	local model_garuma = ReadNpc_("m186_00");		// �_�[�X�K���}
	local model_rena = ReadNpc_("n007");			// ���i�[�e
	// �G�t�F�N�g
	LoadEffect_("ef732_26_star_seed_base02");		// �X�^�[�V�[�h �x�[�X02
	LoadEffect_("ef732_13_light_reactor01");		// ���A�N�^�[�̌�(�܂Ԃ���)
	LoadEffect_("ef721_02_nat_smoke_n02");
	LoadEffect_("ef882_01_dg_die01");				// �_�[�X�K���}�m���G�t�F�N�g
	LoadEffect_("ef882_02_dg_die02");				// �_�[�X�K���}���S�G�t�F�N�g
	
	local baseResId = ReadGimmick_("o_effect_base");
	local baseObj000 = ArrangePointGimmick_("o_effect_base", baseResId, "efc_seed000");
	local baseObj001 = ArrangePointGimmick_("o_effect_base", baseResId, "efc_seed003");

// ���z�u
	// �}�U�[
	local core000 = ArrangePointGimmick_("o_C03_02", model_core000, "obj_core000");
	SetMotion_(core000, MOT_GIMMICK_1, BLEND_N);
	local core100 = ArrangePointGimmick_("o_C03_03", model_core100, "obj_core000");
	
	// ��l��
	SetPointPos_(player, "player000");
	// �A���}
	local aroma = ArrangePointNpc_(model_aroma, "npc_aroma000");
	// �_�[�X�K���}
	local garuma = ArrangePointNpc_(model_garuma, "npc_garuma000");
	SetScaleSilhouette(garuma, 2.3, SILHOUETTE_WIDTH.G);
	// ���i�[�e
	local rena = ArrangePointNpc_(model_rena, "obj_core000");
	SetPointPosNoFit_(rena, "obj_core000");
	SetFace_(rena, "Face_loop_close");

// ����풓���[�V�����Ǎ�
	local player_caution01_L = ReadMotion_(player, "Player_caution01_L");	// �x��L
	
	local aroma_star_seed_L = ReadMotion_(aroma, "n018_star_seed_L");				// �X�^�[�V�[�h������L
	local aroma_star_seed_look_L = ReadMotion_(aroma, "n018_star_seed_look_L");		// �X�^�[�V�[�h������L
	
	local garuma_damage = ReadMotion_(garuma, "m186_00_damage");			// �_���[�W���m��
	local garuma_dying_L = ReadMotion_(garuma, "m186_00_dying_L");			// �m��L
	local garuma_die = ReadMotion_(garuma, "m186_00_die");					// �m�������S
	local rena_mother_L = ReadMotion_(rena, "n007_mother_L");				// �}�U�[�̒��̃��i�[�e
	
// ���J�����ݒ�
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");	// 80F

//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------
	SetMotion_(rena, rena_mother_L, BLEND_N);
	SetMotion_(player, player_caution01_L, BLEND_N);
	SetMotion_(garuma, garuma_damage, BLEND_N);
	task_garuma = Task_ChangeMotion_(garuma, garuma_dying_L, BLEND_M);
	SetMotionSpeed_(garuma, 0.5);
	
	efc_bone000 = SetSelectBoneEffectSetBoneName_("ef882_01_dg_die01", garuma, "j_tail_07", Vec3(0.0, 0.0, 0.0));
	SetEffectScale_(efc_bone000, 2.3);
	efc_bone001 = SetSelectBoneEffectSetBoneName_("ef882_01_dg_die01", garuma, "j_hane_d_01_l", Vec3(0.0, 0.0, 0.0));
	efc_bone002 = SetSelectBoneEffectSetBoneName_("ef882_01_dg_die01", garuma, "j_kubi", Vec3(0.0, -3.5, -3.0));
	SetEffectScale_(efc_bone002, 0.9);
	efc_bone003 = SetSelectBoneEffectSetBoneName_("ef882_01_dg_die01", garuma, "j_te_r", Vec3(-1.0, 0.0, -0.5));
	SetEffectScale_(efc_bone003, 1.5);
	efc_bone004 = SetSelectBoneEffectSetBoneName_("ef882_01_dg_die01", garuma, "j_ude_a_ru", Vec3(-0.5, -1.5, 0.0));
	SetEffectScale_(efc_bone004, 1.5);
	efc_bone005 = SetSelectBoneEffectSetBoneName_("ef882_01_dg_die01", garuma, "j_ude_b_lu", Vec3(0.0, 0.0, 0.0));
	
	PlaySE_("SE_DEM_224");
	SetFade_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
	Wait_(15);
	Wait_(15);
	
	Wait_(42);
	PlaySE_("SE_FLD_168");
	Wait_(8);
	
	StartDecayEarthQuake_(36, 3, 2.0)

	efc_garuma = SetSelectBoneEffectSetOffset_("ef721_02_nat_smoke_n02", garuma, ATTACH_GLOBAL, Vec3(-3.0, -5.0, 20.0));
	SetEffectScale_(efc_garuma, 1.5);
	
	SetMotionSpeed_(garuma, 1.0);
	
	Wait_(105);
	
	DeleteTask_(task_cam);
	DeleteTask_(task_garuma);
	DeleteEffect_(efc_garuma);
	
	//��������������������������������������
	//���J�b�g2
	//��������������������������������������
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");	
	
	Wait_(5);
	
	SetMotionSpeed_(aroma, 0.8);
	SetMotion_(aroma, MOT_TALK, BLEND_L);
	task_aroma = Task_ChangeMotion_(aroma, MOT_TALKLOOP, BLEND_S);
	
	Wait_(20);
	
	SetMotionSpeed_(aroma, 1.0);
	
	//===============================================
	// ���A���}
	// �u�A���^�̕�����@�_�[�N�}�X�^�[�I
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_AROMA");
	ShowMsg_("DEMO_828_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	DeleteTask_(task_aroma);
	
	SetMotion_(aroma, MOT_WAIT, 10);

	Wait_(45);
	
	//��������������������������������������
	//���J�b�g3
	//��������������������������������������
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");	// 90F
	DeleteTask_(task_cam);
	
	Wait_(35);
	PlaySE_("SE_DEM_225");
	efc_seed000 = SetSelectBoneEffect_("ef732_13_light_reactor01", baseObj000, ATTACH_GLOBAL);
	SetEffectScale_(efc_seed000, 0.8);
	task_seed = Task_AnimeMoveNoFit_(baseObj000, "anm_seed000");	// 100F
	DeleteTask_(task_seed);
	
	Wait_(50);
	
	DeleteEffectEmitter_(efc_seed000);
	
	Wait_(5);
	
	efc_seed001 = SetSelectBoneEffect_("ef732_26_star_seed_base02", baseObj000, ATTACH_GLOBAL);
	SetEffectScale_(efc_seed001, 0.56);
	
	Wait_(80);
	
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");	// 90F
	
	Wait_(10);

	task_seed = Task_AnimeMoveNoFit_(baseObj000, "anm_seed000");	// 100F
	
	WaitTask(task_cam);
	WaitTask(task_seed);
	
	efc_seed000 = SetSelectBoneEffect_("ef732_26_star_seed_base02", baseObj001, ATTACH_GLOBAL);
	SetEffectScale_(efc_seed000, 0.26);
	
	Wait_(50);
	
	DeleteEffect_(efc_seed001);
	
	//��������������������������������������
	//���J�b�g4
	//��������������������������������������
	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");	// 90F
	
	task_seed = Task_AnimeMoveNoFit_(baseObj001, "anm_seed001");	// 90F

	Wait_(60);
	
	SetMotion_(aroma, aroma_star_seed_look_L, 20);
		
	WaitTask(task_cam);
	WaitTask(task_seed);	
	Wait_(20);
	//===============================================
	// ���A���}
	// �u����́@���E�̊�]�Ɩ������@�l�܂�����q��B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_AROMA");
	ShowMsg_("DEMO_828_MSG_020");
	KeyInputWait_();
	
	//===============================================
	// ���A���}
	// �u���̂܂܁@�����ĂȂ��Ȃ�Ȃ����B
	//-----------------------------------------------
	ShowMsg_("DEMO_828_MSG_030");
	SetMotion_(aroma, aroma_star_seed_L, BLEND_M);
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================	
	
	efc_seed001 = SetPointWorldEffect_("ef732_26_star_seed_base02", "efc_seed002");
	SetEffectScale_(efc_seed001, 0.0);
	
	Wait_(30);
	
	DeleteEffect_(efc_seed000);
	
	//��������������������������������������
	//���J�b�g5
	//��������������������������������������
	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");

	SetEffectScale_(efc_seed001, 0.36);
	
	Wait_(10);
	
	//===============================================
	// ���_�[�N�}�X�^�[
	// �u���c�c���̂�I�@���̂ꂥ�������I�I
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_DARKMASTER");
	ShowMsg_("DEMO_828_MSG_040");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	StartBlurEffect_();
	
	SetMotion_(garuma, garuma_die, BLEND_XL);
	SetMotionSpeed_(garuma, 0.8);
	
	Wait_(15);
	StartEarthQuake_(36, 3, 1.0)
	Wait_(15);
	PlaySE_("SE_DEM_226");
	Wait_(21);
	
	//��������������������������������������
	//���J�b�g6
	//��������������������������������������
	task_cam = Task_AnimeMoveCamera_("anmeye004", "anmtgt004");	// 84F
	
	SetVisible(player, false);
	SetVisible(aroma, false);
	DeleteEffect_(efc_seed001);
	
	Wait_(20);
	//===============================================
	// ���_�[�N�}�X�^�[
	// �u�������������������I�I
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_DARKMASTER");
	ShowMsg_("DEMO_828_MSG_050");	
	Wait_(34);
	CloseMsgWnd_();
	//===============================================
	
	WaitTask(task_cam);
	DeleteTask_(task_cam);
	
	SetPointCameraEye_("cameye003");
	SetPointCameraTarget_("camtgt003");		
	StartEarthQuake_(-1, 3, 2.0)	

	DeleteEffect_(efc_bone000);
	DeleteEffect_(efc_bone001);
	DeleteEffect_(efc_bone002);
	DeleteEffect_(efc_bone003);
	DeleteEffect_(efc_bone004);
	DeleteEffect_(efc_bone005);
	
	StopEarthQuake_();	
	StartEarthQuake_(189, 3, 2)
	PlayLoopSE_("SE_DEM_013");

	StopBgm_(195);
	efc_garuma = SetSelectBoneEffectSetOffset_("ef882_02_dg_die02", garuma, ATTACH_GLOBAL, Vec3(0.0, 0.0, 0.0));	
	Wait_(150);

	SetActive_(garuma, false);	// �G�t�F�N�g�������Ȃ��Ă���ԂɃ��f��������
	Wait_(39);
	
	StartDecayEarthQuake_(90, 3, 2.0)
	StopLoopSE_(90);
	DeleteEffect_(efc_seed001);
	
	Wait_(51);
	DeleteEffectEmitter_(efc_garuma);
	
	EndBlurEffect_();
	Wait_(110);
	
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 30);
	Wait_(30);	
	efc_seed000 = SetPointWorldEffect_("ef732_26_star_seed_base02", "efc_seed001");
	SetEffectScale_(efc_seed000, 0.3);	
	SetVisible(player, true);
	SetVisible(aroma, true);
	
	//��������������������������������������
	//���J�b�g7
	//��������������������������������������
	SetPointCameraEye_("cameye002");
	SetPointCameraTarget_("camtgt002");	
	SetFade_(FADE_IN, FADE_COLOR_BLACK, 15);
	
	
	SetMotion_(player, MOT_WAIT, BLEND_N);
	SetPointPos_(player, "player001");
	SetPointPos_(aroma, "npc_aroma001");
	
	Wait_(30);
	
	//===============================================
	// ���A���}
	// �u�I�������ˁc�c<name_player/>
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_AROMA");
	ShowMsg_("DEMO_828_MSG_060");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	Wait_(30);
	
	EndDemo(FADE_COLOR_BLACK);
}
