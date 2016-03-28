//=============================================
//
//		demo005[�I�[�v�j���O�f��_8(�y��)]
//
//=============================================

//-------------------------------------------------------------------------
//
//		�ǂݍ��݁E�z�u
//
//-------------------------------------------------------------------------
function Update()
{

	SetTime_(10000);	// ��
	
// ���ϐ���`
	local task_cam, task_reactor;
	local efc_reactor, efc_reactor000, efc_reactor001, efc_butterfly;

// �����\�[�X�Ǎ�
	// �M�~�b�N
	local model_reactor = ReadGimmick_("o_dem_11");	// ���A�N�^�[
	// �G�t�F�N�g
	LoadEffect_("ef800_11_crash_reactor03");		// ���A�N�^�[�̉�
	LoadEffect_("ef721_04_nat_smoke_psps");
	LoadEffect_("ef720_02_nat_oth_butterfly");
	// �L�����N�^�[
	local player = GetPlayerId_();					// ��l��
	
// ��LOD�ǂݍ���
	ReadWaitingLod("cameye001", "camtgt001");

// ���z�u
	// �M�~�b�N
	local reactor = ArrangePointGimmick_("o_dem_11", model_reactor, "obj_reactor000");
	// �L�����N�^�[
	SetPointPos_(player, "player000");
	SetActive_(player, false);

// ���J�����ݒ�
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");

//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------
	//��������������������������������������
	//���J�b�g1	�|�b�h�n�ʂɒė�
	//��������������������������������������
	efc_reactor = SetSelectBoneEffect_("ef800_11_crash_reactor03", reactor, ATTACH_GLOBAL);
	task_reactor = Task_AnimeMoveNoFit_(reactor, "anm_reactor000");
	Wait_(15);
	PlaySE_("SE_DEM_061");																		//��SE �|�b�h�n�ʂɒė�
	Wait_(5);
	StartDemo(FADE_COLOR_BLACK);

	WaitTask(task_reactor);
	
	StartEarthQuake_(15, 3, 0.8);
	
	Wait_(120);
	
	DeleteTask_(task_reactor);
	
	DeleteEffect_(efc_reactor);
	
	SetPointPosNoFit_(reactor, "obj_reactor000");
	
	efc_reactor000 = SetPointWorldEffect_("ef721_04_nat_smoke_psps", "efc_reactor000");
	SetEffectScale_(efc_reactor000, 0.7);
	
	efc_reactor001 = SetPointWorldEffect_("ef721_04_nat_smoke_psps", "efc_reactor001");
	SetEffectScale_(efc_reactor001, 0.6);
	
	SetScaleSilhouette(reactor, SCALE.REACTOR_CASE, SILHOUETTE_WIDTH.REACTOR_CASE);
	
	SetTime_(9500);	// ��

	//��������������������������������������
	//���J�b�g�Q �|�b�h�A�b�v�uJOKER�v
	//��������������������������������������
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");		// 80F
	PlaySE_("SE_DEM_062");																		//��SE �|�b�h�J�������g�N��

	Wait_(70);
	
	SetMotion_(reactor, MOT_GIMMICK_2, BLEND_N);
	
	Wait_(50);
	
	SetMotion_(reactor, MOT_GIMMICK_4, BLEND_N);
	
	Wait_(230);

	SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
	WaitFade_();
	
	DeleteEffect_(efc_reactor000);
	DeleteEffect_(efc_reactor001);
	
	DeleteTask_(task_cam);
	
	SetTime_(0000);	// ��

	Wait_(130);

	//��������������������������������������
	//���J�b�g�R �y���S�i�@
	//��������������������������������������
	task_cam = Task_AnimeMoveCamera_("anmeye003", "anmtgt003");		// 110F
	PlayBgm_("BG_AMBI_005");
	SetFade_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
	WaitFade_();

	WaitTask(task_cam);
	
	Wait_(15);

	DeleteTask_(task_cam);
	
	efc_butterfly = SetPointWorldEffect_("ef720_02_nat_oth_butterfly", "efc_butterfly000");

	//��������������������������������������
	//���J�b�g�S �y���S�i�A
	//��������������������������������������
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");		// 130F
	WaitTask(task_cam);

	Wait_(30);
	
	DeleteTask_(task_cam);
	
	DeleteEffect_(efc_butterfly);

	//��������������������������������������
	//���J�b�g�T �y���S�i�B
	//��������������������������������������
	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");		// 120F
	WaitTask(task_cam);

	Wait_(30);

	EndDemo(FADE_COLOR_BLACK);
}
