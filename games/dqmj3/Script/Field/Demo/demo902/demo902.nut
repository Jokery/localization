//=============================================
//
//		demo902[�ߋ���z�F�A���}�A�G�C���A�X���u�O]
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
	local task_cam, task_player, task_aroma;
	local efc_player;

// �����\�[�X�Ǎ�
	// �L�����N�^�[
	local player = GetPlayerId_();					// ��l��
	local model_aroma = ReadNpc_("n018");					// �A���}
	
// ���z�u
	// ��l��
	SetPointPos_(player, "player000");
	local aroma = ArrangePointNpc_(model_aroma, "aroma000");	//�A���}�z�u
// ����풓���[�V�����Ǎ�
	local n018_kako01 = ReadMotion_(aroma, "n018_kako02");						// �A���}�ߋ���z�p�i�Ŏ��j

// ���J�����ݒ�
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");
	
	//��������������������������������������
	//���J�b�g�P
	//��������������������������������������

	SetMotion_(aroma, n018_kako01, BLEND_L);
	
//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------

		
	StartDemo(FADE_COLOR_BLACK);
	
	Wait_(300);
	
	EndDemo(FADE_COLOR_BLACK);
}
