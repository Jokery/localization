//=============================================
//
//		demo903[�ߋ���z�F���i�[�e���]
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
	local task_cam, task_player, task_boy, task_aroma, task_rena;
	local efc_player;

// �����\�[�X�Ǎ�
	// �L�����N�^�[
	local player = GetPlayerId_();					// ��l��
	local model_rena = ReadNpc_("n007");					// ���i�[�e
	local model_boy = ReadNpc_("n010");					// ���N	
	local model_aroma = ReadNpc_("n018");					// �A���}
	// �M�~�b�N
	local model_window = ReadGimmick_("o_A00_04");		// �Z���^�[�r���̑�
	
// ���z�u
	// ��l��
	SetPointPos_(player, "player000");
	local rena = ArrangePointNpc_(model_rena, "rena000");	//���i�[�e�z�u
	local boy = ArrangePointNpc_(model_boy, "rena000");	//���N�z�u	
	local aroma = ArrangePointNpc_(model_aroma, "aroma000");	//�A���}�z�u
	
	local window = ArrangePointGimmick_("o_A00_04", model_window, "obj_000");	
	SetMotion_(window, MOT_GIMMICK_0, BLEND_N);

// ����풓���[�V�����Ǎ�
	local n007_kako01 = ReadMotion_(rena, "n007_kako01");						// ���i�[�e�ߋ���z�p�i�|��j	
	local n010_kako01 = ReadMotion_(boy, "n010_kako01");						// ���N�ߋ���z�p�i����j
	local n018_kako01 = ReadMotion_(aroma, "n018_kako03");						// �A���}�ߋ���z�p�i����j

// ���J�����ݒ�
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");
	ReadWaitingLod("cameye000", "camtgt000");	
	//��������������������������������������
	//���J�b�g�P
	//��������������������������������������
	SetMotion_(rena, n007_kako01, BLEND_L);
	SetMotion_(boy, n010_kako01, BLEND_L);
	SetMotion_(aroma, n018_kako01, BLEND_L);

	SetVisible(aroma, false);
	
//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------
	SetFace_(rena, "Face_loop_close");
		
	StartDemo(FADE_COLOR_BLACK);
	
	Wait_(300);
	
	EndDemo(FADE_COLOR_BLACK);
}
