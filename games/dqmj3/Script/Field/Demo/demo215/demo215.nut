//=============================================
//
//		demo215[�Α���]�@�E��]
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
	
	local efc_003to001, efc_003to002, efc_003for001, efc_003for002;												//�G�t�F�N�g�ϐ�
	local efc_003, efc_002, efc_001;
	
	local task_stone003, task_stone002, task_stone001;															//�^�X�N�ϐ�
	local task_efc003to001, task_efc003to002, task_efc003for002, task_efc003for001;
	local base003to001, base003to002, base003for001, base003for002;
	
	local task_cam;
	
	local alpha_def;
	
	//-----------------------------------------------------------
	// �Α��M�~�b�N�̉�]�t���O(���v���:true / �����v���:false)
	//-----------------------------------------------------------
	local flg = GetEventFlg_("BFG_MOVE_DIR_STATUE");

// �����\�[�X�Ǎ�
	// �L�����N�^�[
	player = GetPlayerId_();									// ��l��
	// �G�t�F�N�g
	LoadEffect_("ef821_01_smoke_stone");						// �Α��𓮂������Ƃ��̉�

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
	base003to001 = ArrangePointGimmick_("o_effect_base", model_base, "obj_efc_base000");
	base003to002 = ArrangePointGimmick_("o_effect_base", model_base, "obj_efc_base000");
	base003for001 = ArrangePointGimmick_("o_effect_base", model_base, "obj_efc_base000");
	base003for002 = ArrangePointGimmick_("o_effect_base", model_base, "obj_efc_base000");
	
	//���G�t�F�N�g
	LoadEffect_("ef731_01_mag_light01");
	efc_003to001 = SetSelectBoneEffect_("ef731_01_mag_light01", base003to001, ATTACH_GLOBAL);
	SetEffectScale_(efc_003to001, 0.5);
	efc_003to002 = SetSelectBoneEffect_("ef731_01_mag_light01", base003to002, ATTACH_GLOBAL);
	SetEffectScale_(efc_003to002, 0.5);
	efc_003for001 = SetSelectBoneEffect_("ef731_01_mag_light01", base003for001, ATTACH_GLOBAL);
	SetEffectScale_(efc_003for001, 0.5);
	efc_003for002 = SetSelectBoneEffect_("ef731_01_mag_light01", base003for002, ATTACH_GLOBAL);
	SetEffectScale_(efc_003for002, 0.5);
	
// �����Ԑݒ�
	SetTime_(START_TIME_ZONE_NIGHT);
	
// ���J�����ݒ�
	SetPointCameraEye_("cameye000");													//�E���J����
	SetPointCameraTarget_("camtgt000");													//�E��

//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------
	
	//��������������������������������������
	//���J�b�g1 �E�� �ˌ��������������
	//��������������������������������������

	StartDemo(FADE_COLOR_BLACK);
	
	Wait_(36);
	
	if(flg == true){
		task_stone003 = Task_RotateToPos_(stone003, GetPos_(stone003copy), 1.2);	// ���v���
	}else{
		task_stone003 = Task_RotateToPos_(stone003, GetPos_(stone001), 1.2);		// �����v���
	}
	
	PlaySE_("SE_FLD_100");
	
	efc_003 = SetPointWorldEffect_("ef821_01_smoke_stone", "efc_smoke_migisita000");	// �Α��𓮂������Ƃ��̉�
	SetEffectScale_(efc_003, 1.0);
	Wait_(30)
	DeleteEffectEmitter_(efc_003);
	Wait_(7);

	efc_003 = SetPointWorldEffect_("ef821_01_smoke_stone", "efc_smoke_migisita000");	// �Α��𓮂������Ƃ��̉�
	SetEffectScale_(efc_003, 1.0);
	Wait_(30);
	DeleteEffectEmitter_(efc_003);
	Wait_(7);

	for (local i=1; i <= 8; i++) {
		efc_003 = SetPointWorldEffect_("ef821_01_smoke_stone", "efc_smoke_migisita000");			// �Α��𓮂������Ƃ��̉�
		SetEffectScale_(efc_003, 1.0);
		DeleteEffectEmitter_(efc_003);
	}
	
	DeleteEffectEmitter_(efc_003);
	Wait_(40);
	
	//�E���@�ˌ��������������
	task_efc003to001 = Task_AnimeMoveNoFit_(base003to001, "anm_efc003_beam_to_001");	//���A�j�� �E���ˉE��
	task_efc003to002 = Task_AnimeMoveNoFit_(base003to002, "anm_efc003_beam_to_002");	//���A�j�� �E���ˍ���
	PlaySE_("SE_DEM_103");
	Wait_(60);
	
	//��������������������������������������
	//���J�b�g2 ���� �ˌ����������󂯎��
	//��������������������������������������
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");	// 60F
	PlaySE_("SE_DEM_104");
	
	DeleteEffect_(efc_003to001);
	DeleteEffect_(efc_003to002);
	DeleteTask_(task_efc003to001);
	DeleteTask_(task_efc003to002);
	DeleteTask_(task_stone003);
	
	//�����@�ˌ����������󂯎��
	task_efc003for002 = Task_AnimeMoveNoFit_(base003for002, "anm_efc003_beam_for_002");	//���A�j�� �E���ˍ���
	Wait_(58);
	
	for(alpha_def = 0.5; alpha_def >= 0; alpha_def = alpha_def - 0.05){
		SetEffectScale_(efc_003for002, alpha_def);
		Wait_(1);
	}
	SetEffectScale_(efc_003for002, 0);
	
	PlaySE_("SE_FLD_100");
	
	if(flg == true){
		task_stone002 = Task_RotateToPos_(stone002, GetPos_(stone003), 1.2);		//���v���
	}else{
		task_stone002 = Task_RotateToPos_(stone002, GetPos_(stone002copy), 1.2);	//�����v���
	}
	
	efc_002 = SetPointWorldEffect_("ef821_01_smoke_stone", "efc_smoke_hidarisita000");				// �Α��𓮂������Ƃ��̉�
	SetEffectScale_(efc_002, 1.0);
	Wait_(15);
	DeleteEffectEmitter_(efc_002);
	Wait_(10);

	for (local i=1; i <= 4; i++) {
		efc_002 = SetPointWorldEffect_("ef821_01_smoke_stone", "efc_smoke_hidarisita000");			// �Α��𓮂������Ƃ��̉�
		SetEffectScale_(efc_002, 1.0);
		Wait_(5);
		DeleteEffectEmitter_(efc_002);
		Wait_(7);
	}
	
	Wait_(60);
	
	DeleteTask_(task_efc003for002);
	DeleteTask_(task_cam);
	
	//��������������������������������������
	//���J�b�g�R �E�� �L���p���������󂯎��
	//��������������������������������������
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");	// 60F
	PlaySE_("SE_DEM_104");
	
	DeleteTask_(task_stone002);
	
	task_efc003for001 = Task_AnimeMoveNoFit_(base003for001, "anm_efc003_beam_for_001");	//���A�j�� �E���ˉE��
	Wait_(58);
	
	for(alpha_def = 0.5; alpha_def >= 0; alpha_def = alpha_def - 0.05){
		SetEffectScale_(efc_003for001, alpha_def);
		Wait_(1);
	}
	SetEffectScale_(efc_003for001, 0);
	
	PlaySE_("SE_FLD_100");
	
	if(flg == true){
		task_stone001 = Task_RotateToPos_(stone001, GetPos_(stone000), 1.2);	//���v���
	}else{
		task_stone001 = Task_RotateToDir_(stone001, 90, 1.2);					//�����v���
	}

	efc_001 = SetPointWorldEffect_("ef821_01_smoke_stone", "efc_smoke_migiue000");		// �Α��𓮂������Ƃ��̉�
	SetEffectScale_(efc_001, 1.0);
	Wait_(15);
	DeleteEffectEmitter_(efc_001);
	Wait_(10);
	
	for (local i=1; i <= 4; i++) {
		efc_001 = SetPointWorldEffect_("ef821_01_smoke_stone", "efc_smoke_migiue000");			// �Α��𓮂������Ƃ��̉�
		SetEffectScale_(efc_001, 1.0);
		Wait_(5);
		DeleteEffectEmitter_(efc_001);
		Wait_(7);
	}
	
	Wait_(60);
	
	//��������������������������������������
	//���f���I��
	//��������������������������������������
	
	EndDemo(FADE_COLOR_BLACK);
	
}
