//=============================================
//
//		demo400[���S�̊č����E�S�i]
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
	local task_cam;

// �����\�[�X�Ǎ�
	// �L�����N�^�[
	local player = GetPlayerId_();
	// �M�~�b�N
	local model_trans = ReadGimmick_("o_com_01");	// �]�����u

// ���z�u
	// ��l��
	SetPointPos_(player, "player000");
	SetActive_(player, false);
	// �]�����u�i�����̕X���j
	local trans = ArrangePointGimmick_("o_com_01", model_trans, "obj_trans000");
	
// ���V��
	SetWeather_(WEATHER.BAD);						// ���V��ɐݒ肵�܂�
	
// ���J�����ݒ�
	local density = GetFogDensity_();
	SetFogDensity_(5.0);
	local distmax = GetFogDistMax_();
	SetFogDistMax_(10000.0);
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");	// 120F

//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);
	
	WaitTask(task_cam);
	
	Wait_(15);
	
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 20);
	WaitFade_();
//	SetFogDensity_(density);
//	SetFogDistMax_(distmax);
	Wait_(45);
	
	//��������������������������������������
	//���J�b�g2
	//��������������������������������������
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");	// 350F
	
	SetFade_(FADE_IN, FADE_COLOR_BLACK, 30);
	WaitFade_();
	
	WaitTask(task_cam);
	
	Wait_(15);
	
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 20);
	WaitFade_();
	
	Wait_(40);
	
	//��������������������������������������
	//���J�b�g3
	//��������������������������������������
	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");	// 120F
	
	SetFade_(FADE_IN, FADE_COLOR_BLACK, 25);
	WaitFade_();
	
	Wait_(100);
	
//	EndDemo(FADE_COLOR_BLACK);
	EndDemoBgmFade_(FADE_DEF);
	
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
	WaitFade_();
	SetFogDensity_(density);
	SetFogDistMax_(distmax);
	DeleteAllTask_();
	SetSepiaColor_(false);
	End_();
}
