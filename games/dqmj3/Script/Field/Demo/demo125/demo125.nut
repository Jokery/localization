//=============================================
//
//		demo125[�J�[�h�L�[A��T��_2(�����)]
//
//=============================================
function Update()
{

// ���ϐ���`
	local task_cam, task_player;
	local rotate_pos = Vec3( -294.9, 0, -100.9);

// �����\�[�X�Ǎ�
	local player = GetPlayerId_();
	local model_door = ReadGimmick_("o_A03_00");

// ���z�u
	SetPointPos_(player, "player000");
	local door = ArrangePointGimmick_("o_A03_00", model_door, "obj_door000");

// �������̃��[�V����
	SetMotion_(player, MOT_WAIT, BLEND_N);
	SetMotion_(door, MOT_GIMMICK_0, BLEND_N);		// �d�q�h�A(�������)

// ���J�����ݒ�
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");


//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);

	SetMotion_(door, MOT_GIMMICK_1, BLEND_N);		// �d�q�h�A(�J��)
	PlaySE_("SE_DEM_041");
	Wait_(45);

	SetMotion_(door, MOT_GIMMICK_2, BLEND_N);		// �d�q�h�A(�J�������)
	Wait_(30);

	EndDemo(FADE_COLOR_BLACK);
}
