//=============================================
//
//		demo703[�^�C�g���f���i�X���j]
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
	/* �Ȃ� */

// ���z�u
	/* �Ȃ� */

//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------

	SetFade_(FADE_IN, FADE_COLOR_BLACK, 10);
		SetTime_(START_TIME_ZONE_NOON);		
		SetFogDensity_(5.5);
		SetFogDistMax_(10000.0);
		
	while(true)
	{
		task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");	
		
		WaitTask(task_cam);
		DeleteTask_(task_cam);
	}
	
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 20);
	WaitFade_();
}