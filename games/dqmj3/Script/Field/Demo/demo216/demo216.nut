//=============================================
//
//		demo216[�Α���]�@����]
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
	local player;
	local model_stone1, model_stone2, model_base;																//�M�~�b�N�ϐ�
	local stone000, stone000copy, stone001, stone001copy, stone002, stone002copy, stone003, stone003copy;
	
	local efc_002to000, efc_002to003, efc_002for000, efc_002for003;												//�G�t�F�N�g�ϐ�
	local efc_003, efc_002, efc_000;
	
	local task_stone003, task_stone002, task_stone000;															//�^�X�N�ϐ�
	local task_efc002to000, task_efc002to003, task_efc002for000, task_efc002for003;
	local base002to000, base002to003, base002for000, base002for003;

	local task_cam;
	
	local alpha_def;
	
	//-----------------------------------------------------------
	// �Α��M�~�b�N�̉�]�t���O(���v���:true / �����v���:false)
	//-----------------------------------------------------------
	local flg = GetEventFlg_("BFG_MOVE_DIR_STATUE");

// �����\�[�X�Ǎ�
	// �L�����N�^�[
	player = GetPlayerId_();					// ��l��
	// �G�t�F�N�g
	LoadEffect_("ef821_01_smoke_stone");		// �ėp��03 �ԑ�̂��̂����������炢

// ���z�u
	// ��l��
	SetPointPos_(player, "player000");
	
	//=====================================
	//�M�~�b�N�ݒu
	//=====================================
	
	//�L���[�p���T�[�̑�
	model_stone1 = ReadGimmick_("o_G02_20");
	stone000 = ArrangePointGimmick_("o_G02_20", model_stone1, "obj_hidariue000");						//����
	stone000copy = ArrangePointGimmick_("o_G02_20", model_stone1, "obj_hidariue001");
	
	stone001 = ArrangePointGimmick_("o_G02_20", model_stone1, "obj_migiue000");							//�E��
	stone001copy = ArrangePointGimmick_("o_G02_20", model_stone1, "obj_migiue001");
	
	//�ˌ����̑�
	model_stone2 = ReadGimmick_("o_G02_21");
	stone002 = ArrangePointGimmick_("o_G02_21", model_stone2, "obj_hidarisita000");						//����
	stone002copy = ArrangePointGimmick_("o_G02_21", model_stone2, "obj_hidarisita001");
	
	stone003 = ArrangePointGimmick_("o_G02_21", model_stone2, "obj_migisita000");						//�E��
	stone003copy = ArrangePointGimmick_("o_G02_21", model_stone2, "obj_migisita001");
	
	//�G�t�F�N�g�x�[�X
	model_base = ReadGimmick_("o_effect_base");
	base002to000 = ArrangePointGimmick_("o_effect_base", model_base, "obj_efc_base000");
	base002to003 = ArrangePointGimmick_("o_effect_base", model_base, "obj_efc_base000");
	base002for000 = ArrangePointGimmick_("o_effect_base", model_base, "obj_efc_base000");
	base002for003 = ArrangePointGimmick_("o_effect_base", model_base, "obj_efc_base000");
	
	//���G�t�F�N�g
	LoadEffect_("ef731_01_mag_light01");
	efc_002to000 = SetSelectBoneEffect_("ef731_01_mag_light01", base002to000, ATTACH_GLOBAL);
	SetEffectScale_(efc_002to000, 0.5);
	efc_002to003 = SetSelectBoneEffect_("ef731_01_mag_light01", base002to003, ATTACH_GLOBAL);
	SetEffectScale_(efc_002to003, 0.5);
	efc_002for000 = SetSelectBoneEffect_("ef731_01_mag_light01", base002for000, ATTACH_GLOBAL);
	SetEffectScale_(efc_002for000, 0.5);
	efc_002for003 = SetSelectBoneEffect_("ef731_01_mag_light01", base002for003, ATTACH_GLOBAL);
	SetEffectScale_(efc_002for003, 0.5);
	
// �����Ԑݒ�
	SetTime_(START_TIME_ZONE_NIGHT);
	
// ���J�����ݒ�
	SetPointCameraEye_("cameye000");									//����
	SetPointCameraTarget_("camtgt000");									//����
	
//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------
	
	//��������������������������������������
	//���J�b�g1�@���� �ˌ��������������
	//��������������������������������������

	StartDemo(FADE_COLOR_BLACK);
	
	Wait_(36);
	
	if(flg == true){
		task_stone002 = Task_RotateToPos_(stone002, GetPos_(stone003), 1.2);						// ���v���
	}else{
		task_stone002 = Task_RotateToPos_(stone002, GetPos_(stone002copy), 1.2);					// �����v���
	}
	
	PlaySE_("SE_FLD_100");
	
	efc_002 = SetPointWorldEffect_("ef821_01_smoke_stone", "efc_smoke_hidarisita000");				// �ėp��03 �ԑ�̂��̂����������炢
	SetEffectScale_(efc_002, 1.0);
	Wait_(30)
	DeleteEffectEmitter_(efc_002);
	Wait_(7);
	
	efc_002 = SetPointWorldEffect_("ef821_01_smoke_stone", "efc_smoke_hidarisita000");				// �ėp��03 �ԑ�̂��̂����������炢
	SetEffectScale_(efc_002, 1.0);
	Wait_(30)
	DeleteEffectEmitter_(efc_002);
	Wait_(7);
		
	for (local i=1; i <= 8; i++) {
		efc_002 = SetPointWorldEffect_("ef821_01_smoke_stone", "efc_smoke_hidarisita000");			// �ėp��03 �ԑ�̂��̂����������炢
		SetEffectScale_(efc_002, 1.0);
		
		DeleteEffectEmitter_(efc_002);
	}
		
		
	Wait_(40);
	
	
	task_efc002to000 = Task_AnimeMoveNoFit_(base002to000, "anm_efc002_beam_to_000");				//���A�j��
	task_efc002to003 = Task_AnimeMoveNoFit_(base002to003, "anm_efc002_beam_to_003");				//���A�j��
	PlaySE_("SE_DEM_103");
	Wait_(60);
	
	//��������������������������������������
	//���J�b�g�Q
	//��������������������������������������
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");	// 60F
	PlaySE_("SE_DEM_104");
	
	DeleteEffect_(efc_002to000);
	DeleteEffect_(efc_002to003);
	DeleteTask_(task_efc002to000);
	DeleteTask_(task_efc002to003);
	DeleteTask_(task_stone002);
	
	
	task_efc002for003 = Task_AnimeMoveNoFit_(base002for003, "anm_efc002_beam_for_003");
	Wait_(58);

	for(alpha_def = 0.5; alpha_def >= 0; alpha_def = alpha_def - 0.05){
		SetEffectScale_(efc_002for003, alpha_def);
		Wait_(1);
	}
	SetEffectScale_(efc_002for003, 0);
	
	PlaySE_("SE_FLD_100");
	
	if(flg == true){
		task_stone003 = Task_RotateToPos_(stone003, GetPos_(stone003copy), 1.2);					//���v���
	}else{
		task_stone003 = Task_RotateToPos_(stone003, GetPos_(stone001), 1.2);						//�����v���
	}
	
	efc_003 = SetPointWorldEffect_("ef821_01_smoke_stone", "efc_smoke_migisita000");				// �ėp��03 �ԑ�̂��̂����������炢
	SetEffectScale_(efc_003, 1.0);
	Wait_(15);
	DeleteEffectEmitter_(efc_003);
	Wait_(10);

	for (local i=1; i <= 4; i++) {
		efc_003 = SetPointWorldEffect_("ef821_01_smoke_stone", "efc_smoke_migisita000");							// �ėp��03 �ԑ�̂��̂����������炢
		SetEffectScale_(efc_003, 1.0);
		Wait_(5);
		DeleteEffectEmitter_(efc_003);
		Wait_(7);
	}
	
	Wait_(60);
	
	DeleteTask_(task_efc002for003);
	DeleteTask_(task_cam);
	
	//��������������������������������������
	//���J�b�g�R
	//��������������������������������������
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");	// 60F
	PlaySE_("SE_DEM_104");
	
	DeleteTask_(task_stone003);
	
	task_efc002for000 = Task_AnimeMoveNoFit_(base002for000, "anm_efc002_beam_for_000");
	Wait_(58);
	
	for(alpha_def = 0.5; alpha_def >= 0; alpha_def = alpha_def - 0.05){
		SetEffectScale_(efc_002for000, alpha_def);
		Wait_(1);
	}
	SetEffectScale_(efc_002for000, 0);
	
	PlaySE_("SE_FLD_100");
	
	if(flg == true){
		task_stone000 = Task_RotateToPos_(stone000, GetPos_(stone000copy), 1.2);	//���v���
	}else{
		task_stone000 = Task_RotateToPos_(stone000, GetPos_(stone002), 1.2);		//�����v���
	}
	
	efc_000 = SetPointWorldEffect_("ef821_01_smoke_stone", "efc_smoke_hidariue000");				// �ėp��03 �ԑ�̂��̂����������炢
	SetEffectScale_(efc_000, 1.0);
	Wait_(15);
	DeleteEffectEmitter_(efc_000);
	Wait_(10);
	
	for (local i=1; i <= 4; i++) {
		efc_000 = SetPointWorldEffect_("ef821_01_smoke_stone", "efc_smoke_hidariue000");			// �ėp��03 �ԑ�̂��̂����������炢
		SetEffectScale_(efc_000, 1.0);
		Wait_(5);
		DeleteEffectEmitter_(efc_000);
		Wait_(7);
	}
	
	Wait_(60);
	
	//��������������������������������������
	//���f���I��
	//��������������������������������������
	
	EndDemo(FADE_COLOR_BLACK);
	
}
