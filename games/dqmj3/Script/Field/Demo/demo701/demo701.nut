//=============================================
//
//		demo701[�^�C�g���f���i�����j]
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
	
	//�M�~�b�N
	local model_biru = ReadGimmick_("o_A00_04");									//�Z���^�[�r��
	local model_door = ReadGimmick_("o_A00_01");									//���i����j
	local model_ruler = ReadGimmick_("o_com_08");									//���[���|�C���g
	local model_stel = ReadGimmick_("o_com_07");									//���Z�Δ�

// ���z�u
	/* �Ȃ� */
	
	local biru = ArrangePointGimmick_("o_A00_04", model_biru, "obj_biru000");		//�Z���^�[�r��(�_��)
	local door = ArrangePointGimmick_("o_A00_01", model_door, "obj_door000");		//��
	local ruler = ArrangePointGimmick_("o_com_08", model_ruler, "obj_ruler000");	//���[���|�C���g
	local stel = ArrangePointGimmick_("o_com_07", model_stel, "obj_stele000");		//���Z�Δ�

	SetMotion_(biru, MOT_GIMMICK_1, BLEND_N);										//�Z���^�[�r��(�_��)
	SetMotion_(door, MOT_GIMMICK_0, BLEND_N);										//���i����j

//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------
	SetFade_(FADE_IN, FADE_COLOR_BLACK, 10);
	
	while(true)
	{

		// ���J�b�g�P���`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`
		SetTime_(START_TIME_ZONE_NOON);		
		SetFogDensity_(2.0);
		SetFogDistMax_(10000.0);
		task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");

		
		WaitTask(task_cam);

		

		DeleteTask_(task_cam);

	}
	
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 20);
	WaitFade_();
}
