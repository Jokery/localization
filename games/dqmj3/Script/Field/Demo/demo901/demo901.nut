//=============================================
//
//		demo901[�ߋ���z�F���L�����S]
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
	local task_cam, task_player, task_rukiya, task_aroma;
	local efc_player;

// �����\�[�X�Ǎ�
	// �L�����N�^�[
	local player = GetPlayerId_();					// ��l��
	local model_rukiya = ReadNpc_("n009");					// ���L��	
	local model_aroma = ReadNpc_("n018");					// �A���}
	
// ���z�u
	// ��l��
	SetPointPos_(player, "player000");
	local rukiya = ArrangePointNpc_(model_rukiya, "rukiya000");	//���L���z�u
	local aroma = ArrangePointNpc_(model_aroma, "rukiya000");	//�A���}�z�u
	
	//�M�~�b�N
//	local model_red_door = ReadGimmick_("o_U00_05");		// ��:�Ԕ�
//	local model_center_door = ReadGimmick_("o_U00_06");		// ��:�O�� ����
//	local model_left_door = ReadGimmick_("o_U00_06");		// ��:�O�� ��
//	local model_right_door = ReadGimmick_("o_U00_06");		// ��:�O�� �E
//	local model_green_door00 = ReadGimmick_("o_U00_09");	// ��:�Δ�
//	local model_green_door01 = ReadGimmick_("o_U00_10");	// ��:�Δ�
	
//	local red_door = ArrangePointGimmick_("o_U00_05", model_red_door, "obj_door000");					//��:�Ԕ�
//	local center_door = ArrangePointGimmick_("o_U00_06", model_center_door, "obj_door000");				//��:�O�� ����
//	local left_door = ArrangePointGimmick_("o_U00_06", model_left_door, "obj_door000");					//��:�O�� ��
//	local right_door = ArrangePointGimmick_("o_U00_06", model_right_door, "obj_door000");				//��:�O�� �E
//	local green_door00 = ArrangePointGimmick_("o_U00_09", model_green_door00, "obj_door000");			//��:�Δ�
//	local green_door01 = ArrangePointGimmick_("o_U00_10", model_green_door01, "obj_door000");			//��:�Δ�
	

// ����풓���[�V�����Ǎ�
	local n009_kako01 = ReadMotion_(rukiya, "n009_kako01");						// ���L���ߋ���z�p�i���S�j	
	local n018_kako01 = ReadMotion_(aroma, "n018_kako01");						// �A���}�ߋ���z�p�i�Ŏ��j

// ���J�����ݒ�
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");
	
	//��������������������������������������
	//���J�b�g�P
	//��������������������������������������
	SetMotion_(rukiya, n009_kako01, BLEND_L);
	SetMotion_(aroma, n018_kako01, BLEND_L);
	SetFace_(rukiya, "Face_loop_close");
	
//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------
//	SetFace_(rukiya, "Face_loop_close");
		
	StartDemo(FADE_COLOR_BLACK);
	
	Wait_(300);
	
	EndDemo(FADE_COLOR_BLACK);
}
