//=============================================
//
//		demo327[���E�ړ����\��]
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
	local efc_player;

// �����\�[�X�Ǎ�
	// �L�����N�^�[
	local player = GetPlayerId_();					// ��l��

// ���z�u
	// ��l��
	SetPointPos_(player, "player000");
	
// ���M�~�b�N�ݒu
	local obj_PC = ReadGimmick_("o_I02_18");					// �m�[�gPC
	local PC = ArrangePointGimmick_("o_I02_18", obj_PC, "obj_pc000");

// ����풓���[�V�����Ǎ�
	
// ���J�����ݒ�
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");			
//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);
	
	Wait_(90);
	
	StartEarthQuake_(60, 3, 0.15)
	PlayLoopSE_("SE_DEM_013");
	Wait_(30);
	StopLoopSE_(30);
	//...........................................................................
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 30);					// �t�F�[�h�A�E�g
	WaitFade_();
	Wait_(10);
	LoadLayout_("w_map");										// ���C�A�E�g�ǂݍ���
	SetLayoutAnime_("move_03", false);
	Wait_(30);
	SetFade_(FADE_IN, FADE_COLOR_BLACK, 30);					// �t�F�[�h�C��
	//...........................................................................
	Wait_(50);
	PlaySE_("SE_DEM_180");
	Wait_(100);
	PlaySE_("SE_DEM_178");
	Wait_(155);
//	WaitLayoutAnime();
	EndDemo(FADE_COLOR_BLACK);
}
