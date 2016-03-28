//=============================================
//
//		demo529[�ړ����u��ł��グ��_2(���ˑ��u)]
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
	local task_cam, task_rocket, task_efc;
	local efc_lift, efc_rocket, efc_rocket_light;

// �����\�[�X�Ǎ�
	// �L�����N�^�[
	local player = GetPlayerId_();					// ��l��
	// �M�~�b�N
	local model_rocket = ReadGimmick_("o_V00_04");	// �傫�ȍY
	local model_gate = ReadGimmick_("o_V00_05");	// ���ˑ�̔�
	local model_lift = ReadGimmick_("o_dem_24");	// ���ˑ�̃��t�g
	local model_monolith = ReadGimmick_("o_com_02");// ���m���X
	local model_ruler = ReadGimmick_("o_com_08");	// ���[���|�C���g
	local model_switch = ReadGimmick_("o_V00_11");	// �F�ؑ��u
	// �G�t�F�N�g
	LoadEffect_("ef853_01_launch01");				// ���ˎ��̂܂������鉌
	LoadEffect_("ef853_02_launch02");				// ���ˎ��̃G���W������o�鉌
	LoadEffect_("ef853_05_launch05");				// �r�[�R��
	
	local baseResId = ReadGimmick_("o_effect_base");
	local baseObj = ArrangePointGimmick_("o_effect_base", baseResId, "efc_rocket000");

// ���z�u
	// ��l��
	SetPointPos_(player, "player000");
	SetActive_(player, false);
	
	// �傫�ȍY
	local rocket = ArrangePointGimmick_("o_V00_04", model_rocket, "obj_rocket000");
	// ���ˑ�̔��i��j
	local gateup = ArrangePointGimmick_("o_V00_05", model_gate, "obj_gateup000");
	// ���ˑ�̔��i���j
	local gatedown = ArrangePointGimmick_("o_V00_05", model_gate, "obj_gatedown000");
	// ���ˑ�̃��t�g
	local lift = ArrangePointGimmick_("o_dem_24", model_lift, "obj_lift000");
	// ���m���X
	local monolith = ArrangePointGimmick_("o_com_02", model_monolith, "obj_monolith000");
	if(GetEventFlg_("BFG_START_A_MONOLITH") == true){
		SetMotion_(monolith, MOT_GIMMICK_2, BLEND_N);
	}
	// ���[���|�C���g
	local ruler = ArrangePointGimmick_("o_com_08", model_ruler, "obj_ruler000");
	if(GetEventFlg_("BFG_RULER_ADD_021") == true){
		SetMotion_(ruler, MOT_GIMMICK_2, BLEND_N);
	}
	// �F�ؑ��u
	local switch000 = ArrangePointGimmick_("o_V00_11", model_switch, "obj_switch000");
	SetMotion_(switch000, MOT_GIMMICK_3, BLEND_N);

// ���J�����ݒ�
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");
	WaitLod_();
	
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");		// 550F

// ���V��ݒ�
	SetWeather_(WEATHER.NORMAL);

//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------
	SetMotion_(gateup, MOT_GIMMICK_0, BLEND_N);
	SetMotionSpeed_(gateup, 0.5);
	SetMotion_(gatedown, MOT_GIMMICK_0, BLEND_N);
	SetMotionSpeed_(gatedown, 0.5);
	SetMotion_(lift, MOT_GIMMICK_0, BLEND_N);

	StartDemo(FADE_COLOR_BLACK);
	
	Wait_(60);
	
	PlaySE_("SE_DEM_098");											//��SE:���ˑ�̔����J��
	SetMotion_(gateup, MOT_GIMMICK_1, BLEND_N);
	Wait_(35);
	SetMotion_(gateup, MOT_GIMMICK_2, BLEND_N);

//	PlaySE_("SE_DEM_140");											//��SE:���[�v���u������
	SetMotion_(gatedown, MOT_GIMMICK_1, BLEND_N);
	Wait_(35);
	SetMotion_(gatedown, MOT_GIMMICK_2, BLEND_N);
	
	SetMotion_(lift, MOT_GIMMICK_1, BLEND_N);
	Wait_(83);
	PlaySE_("SE_DEM_099");											//��SE:�������ˑ��u���łĂ���
	Wait_(202);
	SetMotion_(lift, MOT_GIMMICK_2, BLEND_N);
	
	Wait_(35);
	
	//===============================================
	//*���i�[�e
	// 	�u�����炱�̑��u�Ł@�ړ����u����������
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_529_MSG_010");
	KeyInputWait_();
	
	//===============================================
	//*���i�[�e
	// 	�u�����c�c���ꂱ���@���L���̈₵�Ă��ꂽ
	//-----------------------------------------------
	ShowMsg_("DEMO_529_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	WaitTask(task_cam);
	
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");		// 80F
	
	WaitTask(task_cam);
	
	task_rocket = Task_AnimeMoveNoFit_(rocket, "anm_rocket000");	// 150F
	SetDir_(rocket, 0);

	Wait_(7);
	PlaySE_("SE_DEM_100");											//�e�����P�b�g���łĂ���
	Wait_(133);
	
	Wait_(10);
	DeleteTask_(task_rocket);
	StartDecayEarthQuake_(21, 3, 3)

	Wait_(20);

	efc_rocket_light = SetSelectBoneEffectSetOffset_("ef853_05_launch05", baseObj, ATTACH_GLOBAL, Vec3(0.0, 0.0, 0.0));	//�r�[�R��
	
	Wait_(60);
	
	StartEarthQuake_(30, 3, 5)	

	PlaySE_("SE_DEM_101");											//�e�����P�b�g�̔���
	
	efc_lift = SetPointWorldEffect_("ef853_01_launch01", "efc_lift000");
	efc_rocket = SetSelectBoneEffect_("ef853_02_launch02", baseObj, ATTACH_GLOBAL);
	
	Wait_(15);

	Wait_(15);
	
	StartEarthQuake_(30, 3, 4)	

	task_efc = Task_AnimeMoveNoFit_(baseObj, "anm_efc000");			// 565F
	SetDir_(baseObj, 0);
	
	task_rocket = Task_AnimeMoveNoFit_(rocket, "anm_rocket001");	// 565F
	SetDir_(rocket, 0);
	
	Wait_(30);	
	StartEarthQuake_(24, 3, 3)	
	Wait_(24);
	
	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");		// 300F
	Wait_(120);

	StartDecayEarthQuake_(69, 3, 5)	
	
	EndDemo(FADE_COLOR_BLACK);
}
