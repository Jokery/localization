//=============================================
//
//		demo707[�D�̕�� �^�C�g���f��]
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
	// �M�~�b�N
	local model_base = ReadGimmick_("o_effect_base");		// �G�t�F�N�g�x�[�X
	local model_pod = ReadGimmick_("o_U00_02");				// �E�o�|�b�h
	local model_red_door = ReadGimmick_("o_U00_05");		// ��:�Ԕ�
	local model_center_door = ReadGimmick_("o_U00_06");		// ��:�O�� ����
	local model_left_door = ReadGimmick_("o_U00_06");		// ��:�O�� ��
	local model_right_door = ReadGimmick_("o_U00_06");		// ��:�O�� �E
	local model_green_door00 = ReadGimmick_("o_U00_09");	// ��:�Δ�
	local model_green_door01 = ReadGimmick_("o_U00_10");	// ��:�Δ�
	// �L�����N�^�[

	// �G�t�F�N�g

// ���z�u
	// �|�b�h
	local pod00 = ArrangePointGimmick_("o_U00_02", model_pod, "obj_pod000");
	local pod01 = ArrangePointGimmick_("o_U00_02", model_pod, "obj_pod001");
	local pod02 = ArrangePointGimmick_("o_U00_02", model_pod, "obj_pod002");
	
	
	local red_door = ArrangePointGimmick_("o_U00_05", model_red_door, "obj_U00_05");					//��:�Ԕ�
	local center_door = ArrangePointGimmick_("o_U00_06", model_center_door, "obj_center");				//��:�O�� ����
	local left_door = ArrangePointGimmick_("o_U00_06", model_left_door, "obj_left");					//��:�O�� ��
	local right_door = ArrangePointGimmick_("o_U00_06", model_right_door, "obj_right");				//��:�O�� �E
	local green_door00 = ArrangePointGimmick_("o_U00_09", model_green_door00, "obj_U00_09");			//��:�Δ�
	local green_door01 = ArrangePointGimmick_("o_U00_10", model_green_door01, "obj_U00_10");			//��:�Δ�

//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------
	SetFade_(FADE_IN, FADE_COLOR_BLACK, 10);
	
	while(true)
	{
		// ���J�b�g�P���`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`
		SetFogDensity_(2.0);
		SetFogDistMax_(10000.0);
		
		task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");
	
		
		WaitTask(task_cam);


		DeleteTask_(task_cam);
	}
	
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 20);
	WaitFade_();
}
