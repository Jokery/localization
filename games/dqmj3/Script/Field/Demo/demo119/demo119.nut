//=============================================
//
//		demo119[������n_3(�쓹�ړ�)]
//
//=============================================

//-------------------------------------------------------------------------
//
//		�ǂݍ��݁E�z�u
//
//-------------------------------------------------------------------------
function Update()
{
	SetTime_(8700);		// ��
	SetFogDensity_(3.0);
	SetFogDistMax_(10000.0);

// ���ϐ���`
	local task_cam, task_player;
	local efc_player, efc_transfer;

// �����\�[�X�Ǎ�
	local player = GetPlayerId_();						// ��l��
	// �M�~�b�N
	local model_transfer = ReadGimmick_("o_dem_00");	// �]�����u
	// �G�t�F�N�g
	LoadEffect_("ef732_02_tec_device_travel02");		// �ړ����u�@�N��

// ���z�u
	// �]�����u
	local transfer = ArrangePointGimmick_("o_dem_00", model_transfer, "obj_transfer000");

// ���J�����ݒ�
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");

	SetMotion_(transfer, MOT_GIMMICK_0, BLEND_N);		// �]�����u�@�ҋ@
	SetAlpha_(player, ALPHA_CLEAR);						// ��l���@��\��



//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);

	Wait_(180);
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 20);			//�t�F�[�h�A�E�g
	WaitFade_();
	DeleteTask_(task_cam);

	task_cam = Task_AnimeMoveCamera_("anmeye003", "anmtgt003");
	SetFade_(FADE_IN, FADE_COLOR_BLACK, 10);			//�t�F�[�h�C��

	Wait_(120);
	DeleteTask_(task_cam);
	PlaySE_("SE_DEM_023");
	efc_transfer = SetPointWorldEffect_("ef732_02_tec_device_travel02", "obj_transfer000");
	Wait_(100);

	EndDemo(FADE_COLOR_BLACK);
}
