//=============================================
//
//		demo218[�Α���]�@����]
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
	
	local efc_000to001, efc_000to002, efc_000for001, efc_000for002;												//�G�t�F�N�g�ϐ�
	local efc_000, efc_002, efc_001;
	
	local task_stone000, task_stone002, task_stone001;
	local task_efc000to001, task_efc000to002, task_efc000for002, task_efc000for001;								//�^�X�N�ϐ�
	local base000to001, base000to002, base000for001, base000for002;

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
	base000to001 = ArrangePointGimmick_("o_effect_base", model_base, "obj_efc_base000");
	base000to002 = ArrangePointGimmick_("o_effect_base", model_base, "obj_efc_base000");
	base000for001 = ArrangePointGimmick_("o_effect_base", model_base, "obj_efc_base000");
	base000for002 = ArrangePointGimmick_("o_effect_base", model_base, "obj_efc_base000");
	
	//���G�t�F�N�g
	LoadEffect_("ef731_01_mag_light01");
	efc_000to001 = SetSelectBoneEffect_("ef731_01_mag_light01", base000to001, ATTACH_GLOBAL);
	SetEffectScale_(efc_000to001, 0.5);
	efc_000to002 = SetSelectBoneEffect_("ef731_01_mag_light01", base000to002, ATTACH_GLOBAL);
	SetEffectScale_(efc_000to002, 0.5);
	efc_000for001 = SetSelectBoneEffect_("ef731_01_mag_light01", base000for001, ATTACH_GLOBAL);
	SetEffectScale_(efc_000for001, 0.5);
	efc_000for002 = SetSelectBoneEffect_("ef731_01_mag_light01", base000for002, ATTACH_GLOBAL);
	SetEffectScale_(efc_000for002, 0.5);
	
// �����Ԑݒ�
	SetTime_(START_TIME_ZONE_NIGHT);
	
// ���J�����ݒ�
	SetPointCameraEye_("cameye000");			//����
	SetPointCameraTarget_("camtgt000");			//����

//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------
	
	//��������������������������������������
	//���J�b�g1
	//��������������������������������������

	StartDemo(FADE_COLOR_BLACK);
	
	Wait_(36);
	
	if(flg == true){
		task_stone000 = Task_RotateToPos_(stone000, GetPos_(stone000copy), 1.2);			//���v���
	}else{
		task_stone000 = Task_RotateToPos_(stone000, GetPos_(stone002), 1.2);				//�����v���
	}
	
	PlaySE_("SE_FLD_100");
	
	efc_000 = SetPointWorldEffect_("ef821_01_smoke_stone", "efc_smoke_hidariue000");		// �ėp��03 �ԑ�̂��̂����������炢
	SetEffectScale_(efc_000, 1.0);
	Wait_(30)
	DeleteEffectEmitter_(efc_000);
	Wait_(7);
	
	efc_000 = SetPointWorldEffect_("ef821_01_smoke_stone", "efc_smoke_hidariue000");		// �ėp��03 �ԑ�̂��̂����������炢
	SetEffectScale_(efc_000, 1.0);
	Wait_(30)
	DeleteEffectEmitter_(efc_000);
	Wait_(7);
		
	for (local i=1; i <= 8; i++) {
		efc_000 = SetPointWorldEffect_("ef821_01_smoke_stone", "efc_smoke_hidariue000");	// �ėp��03 �ԑ�̂��̂����������炢
		SetEffectScale_(efc_000, 1.0);
		DeleteEffectEmitter_(efc_000);
	}
	
	DeleteEffectEmitter_(efc_000);
	Wait_(40);
	
	
	task_efc000to001 = Task_AnimeMoveNoFit_(base000to001, "anm_efc000_beam_to_001");		//���G�t�F�N�g�̃A�j���[�V����
	task_efc000to002 = Task_AnimeMoveNoFit_(base000to002, "anm_efc000_beam_to_002");		//���G�t�F�N�g
	PlaySE_("SE_DEM_103");
	Wait_(60);
	
	//��������������������������������������
	//���J�b�g�Q
	//��������������������������������������
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");	// 60F
	PlaySE_("SE_DEM_104");
	
	DeleteEffect_(efc_000to001);
	DeleteEffect_(efc_000to002);
	DeleteTask_(task_efc000to001);
	DeleteTask_(task_efc000to002);
	DeleteTask_(task_stone000);
	
	
	task_efc000for001 = Task_AnimeMoveNoFit_(base000for001, "anm_efc000_beam_for_001");
	
	for(alpha_def = 0.5; alpha_def >= 0; alpha_def = alpha_def - 0.05){
		SetEffectScale_(efc_000for001, alpha_def);
		Wait_(1);
	}
	SetEffectScale_(efc_000for001, 0);
	
	PlaySE_("SE_FLD_100");
	
	if(flg == true){
		task_stone001 = Task_RotateToPos_(stone001, GetPos_(stone000), 1.2);	//���v���
	}else{
		task_stone001 = Task_RotateToDir_(stone001, 90, 1.2);					//�����v���
	}
	
	efc_001 = SetPointWorldEffect_("ef821_01_smoke_stone", "efc_smoke_migiue000");			// �ėp��03 �ԑ�̂��̂����������炢
	SetEffectScale_(efc_001, 1.0);
	Wait_(15);
	DeleteEffectEmitter_(efc_001);
	Wait_(10);
	
	for (local i=1; i <= 4; i++) {
		efc_001 = SetPointWorldEffect_("ef821_01_smoke_stone", "efc_smoke_migiue000");		// �ėp��03 �ԑ�̂��̂����������炢
		SetEffectScale_(efc_001, 1.0);
		Wait_(5);
		DeleteEffectEmitter_(efc_001);
		Wait_(7);
	}
	
	Wait_(60);
	
	DeleteTask_(task_efc000for001);
	DeleteTask_(task_cam);
	
	//��������������������������������������
	//���J�b�g�R
	//��������������������������������������
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");	// 60F
	PlaySE_("SE_DEM_104");
	
	DeleteTask_(task_stone001);
	
	task_efc000for002 = Task_AnimeMoveNoFit_(base000for002, "anm_efc000_beam_for_002");
	Wait_(58);
	
	for(alpha_def = 0.5; alpha_def >= 0; alpha_def = alpha_def - 0.05){
		SetEffectScale_(efc_000for002, alpha_def);
		Wait_(1);
	}
	SetEffectScale_(efc_000for002, 0);
	
	PlaySE_("SE_FLD_100");
	
	if(flg == true){
		task_stone002 = Task_RotateToPos_(stone002, GetPos_(stone003), 1.2);				//���v���
	}else{
		task_stone002 = Task_RotateToPos_(stone002, GetPos_(stone002copy), 1.2);			//�����v���
	}
	
	efc_002 = SetPointWorldEffect_("ef821_01_smoke_stone", "efc_smoke_hidarisita000");		// �ėp��03 �ԑ�̂��̂����������炢
	SetEffectScale_(efc_002, 1.0);
	Wait_(15);
	DeleteEffectEmitter_(efc_002);
	Wait_(10);

	for (local i=1; i <= 4; i++) {
		efc_002 = SetPointWorldEffect_("ef821_01_smoke_stone", "efc_smoke_hidarisita000");	// �ėp��03 �ԑ�̂��̂����������炢
		SetEffectScale_(efc_002, 1.0);
		Wait_(5);
		DeleteEffectEmitter_(efc_002);
		Wait_(7);
	}
	
	Wait_(60);
	
	//��������������������������������������
	//���f���I��
	//��������������������������������������
	
	EndDemo(FADE_COLOR_BLACK);
	
}
