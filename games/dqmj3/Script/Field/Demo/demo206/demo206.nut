//=============================================
//
//		demo206[�閧�����ւ̔�]
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
	local task_cam, task_player;
	local efc_stone1 ,efc_stone2, efc_bun;
	local efc_smoke0;

// ���t���O�ݒ�
	local bit_ruler = GetEventFlg_("BFG_RULER_ADD_010");			// Bit_210 ���[���ǉ��t���O ������n�@�A���f�b�h�K�[�f���n��

// �����\�[�X�Ǎ�
	// �L�����N�^�[
	local player = GetPlayerId_();					// ��l��
	local model_bundoru = ReadNpc_("m203_00")		//�u���h��

// ���z�u
	local bundoru = ArrangePointNpc_(model_bundoru, "npc_bundoru_000");		//�u���h��
	SetScaleSilhouette(bundoru, SCALE.M, SILHOUETTE_WIDTH.M);

// ���G�t�F�N�g�Ǎ�
	LoadEffect_("ef726_01_nat_parapara");		//��n�p���p��
	LoadEffect_("ef721_03_nat_smoke_n03");		//��3
	LoadEffect_("ef730_01_oth_dark_aura01");	// �܂��܂������I�[��

//	���M�~�b�N�ǂݍ���
	local obj_doa = ReadGimmick_("o_G02_02");		//���W�X�^���X�̔�
	local doa = ArrangePointGimmick_("o_G02_02",obj_doa, "obj_doa000");
	
	local model_ruler = ReadGimmick_("o_com_08");		//���[���|�C���g
	local ruler = ArrangePointGimmick_("o_com_08", model_ruler, "obj_ruler000");
	// �����[���|�C���g�����ɋN�����Ă����ꍇ
	if (bit_ruler) { SetMotion_(ruler, MOT_GIMMICK_2, BLEND_N); }
	
// �����Ԑݒ�
	SetTime_(START_TIME_ZONE_NIGHT);
	
// ���J�����ݒ�
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");

//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------
	efc_bun = SetSelectBoneEffectSetOffset_("ef730_01_oth_dark_aura01", bundoru, ATTACH_EFFECT2, Vec3(0.0, -5.0, 0.0));		//���I�[��

	StartDemo(FADE_COLOR_BLACK);

	Wait_(60);	
	PlaySE_("SE_FLD_098");	//�����J��SE
	StartEarthQuake_(-1, 3, 0.5); //�n�k
	//-----------------------------------------------
	
	//���̊J���M�~�b�N
	//-----------------------------------------------
	Wait_(30)
	SetMotion_(doa, MOT_GIMMICK_1, BLEND_M);							// �����J��
	SetMotionSpeed_(doa, 0.25);				
	
	efc_smoke0 = SetPointWorldEffect_("ef721_03_nat_smoke_n03", "efc_smoke000");	//��3
	SetEffectScale_(efc_smoke0, 0.8);	

	//-----------------------------------------------	
	//�G�t�F�N�g
	//-----------------------------------------------
	efc_stone1 = SetPointWorldEffect_("ef726_01_nat_parapara", "efc_stone000");	//�΂̔j��
	SetEffectScale_(efc_stone1, 1.6);
	
	Wait_(20);
	DeleteEffectEmitter_(efc_stone1);
	
	efc_stone2 = SetPointWorldEffect_("ef726_01_nat_parapara", "efc_stone001");	//�΂̔j��
	SetEffectScale_(efc_stone2, 1.6);

	Wait_(20);
	DeleteEffectEmitter_(efc_stone2);

	Wait_(20);
	efc_stone1 = SetPointWorldEffect_("ef726_01_nat_parapara", "efc_stone000");	//�΂̔j��
	SetEffectScale_(efc_stone1, 1.6);
	Wait_(15);
	efc_stone2 = SetPointWorldEffect_("ef726_01_nat_parapara", "efc_stone001");	//�΂̔j��
	SetEffectScale_(efc_stone2, 1.6);
	
	Wait_(5);
	DeleteEffectEmitter_(efc_stone1);
	
	Wait_(15);
	DeleteEffectEmitter_(efc_stone2);
	
	Wait_(15);
	efc_stone1 = SetPointWorldEffect_("ef726_01_nat_parapara", "efc_stone000");	//�΂̔j��
	SetEffectScale_(efc_stone1, 1.6);
	Wait_(10);
	DeleteEffectEmitter_(efc_stone1);
	
	StopEarthQuake_();				//�n�k�X�g�b�v
	
	Wait_(20);
	
	//===============================================
	//*�V�X�e�����b�Z�[�W
	//�B���ꂽ�@�����o�������B
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_206_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	EndDemo(FADE_COLOR_BLACK);
}
