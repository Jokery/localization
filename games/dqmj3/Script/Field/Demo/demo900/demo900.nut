//=============================================
//
//		demo900[�L���p�f��]
//
//=============================================

//-------------------------------------------------------------------------
//
//		�ǂݍ��݁E�z�u
//
//-------------------------------------------------------------------------
function Update()
{
	DummyMsg();
	
// ���ϐ���`
	local task_cam, task_player;
	local efc_player;

// �����\�[�X�Ǎ�
	// �L�����N�^�[
	local player = GetPlayerId_();									// ��l��
	
	//NPC
	local model_nocho = ReadNpc_("n000");							// �m�`���[��
	local model_nebyurasu = ReadNpc_("m123_02");					// �_�[�N�l�r�����X
	local model_hikui = ReadNpc_("m053_00")							// �Ђ����ǂ�

// ���z�u
	// ��l��
	SetPointPos_(player, "player000");
	
	//NPC
	local nocho = ArrangePointNpc_(model_nocho, "npc_nocho000");		// �m�`���[��
	
	local nebyu = ArrangePointNpc_(model_nebyurasu, "player000");
	SetScaleSilhouette(nebyu, SCALE.N, SILHOUETTE_WIDTH.N);			// �l�r���@�T�C�YN

	local hikui = ArrangePointNpc_(model_hikui, "player000");
	SetScaleSilhouette(nebyu, SCALE.N, SILHOUETTE_WIDTH.N);			// �Ђ����@�T�C�YN
	SetVisible(hikui, false);
	
// ���M�~�b�N�ݒu	
	local window = ReadGimmick_("o_A00_04");						//�Z���^�[�r���̑��M�~�b�N
	local res_tele = ArrangePointGimmick_("o_A00_04", window, "obj_window000");
	SetMotion_(res_tele, MOT_GIMMICK_1, BLEND_N);	

// ����풓���[�V�����Ǎ�
	local ride_L = ReadMotion_(player, "Player_ride00_L");			// ���C�hL
	SetMotion_(player, ride_L, BLEND_N);							// ��@�������[�V����



//	SetMotionSpeed_(player, 0.2);	
//	SetMotionSpeed_(nocho, 0.2);	
//	SetMotionSpeed_(hikui, 0.2);	
//	SetMotionSpeed_(nebyu, 0.2);	
	
//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------
	//===================================
	//�J�b�g1-1�@�l�r�����X
	//===================================
	RideOn_(player, nebyu, 388, 0.6);							//���C�h�I���@�l�r�����X
	
	ReadWaitingLod("cameye000", "camtgt000");
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");
	
	StartDemo(FADE_COLOR_BLACK);
	
	Wait_(300);
	
	//===================================
	//�J�b�g1-2�@�Ђ����ǂ�
	//===================================
	//...........................................................................
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 30);					//�t�F�[�h�A�E�g
	WaitFade_();
	
	RideOff_(player, nebyu);									//���C�h�I�t
	SetVisible(nebyu, false);
	SetVisible(hikui, true);
	RideOn_(player, hikui, 164, 0.6);							//���C�h�I���@�Ђ����ǂ�

	SetFade_(FADE_IN, FADE_COLOR_BLACK, 30);					//�t�F�[�h�C��
	//...........................................................................
	Wait_(300);
	
	//===================================
	//�J�b�g2-1�l�r�����X
	//===================================
	//...........................................................................
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 30);					//�t�F�[�h�A�E�g
	WaitFade_();
	
	RideOff_(player, hikui);									//���C�h�I�t
	SetVisible(hikui, false);
	SetVisible(nebyu, true);
	
	SetPointPos_(player, "player001");
	SetPointPos_(nebyu, "player001");
	SetPointPos_(nocho, "npc_nocho001");
	RideOn_(player, nebyu, 164, 0.6);							//���C�h�I���@�l�r�����X
	
	ReadWaitingLod("cameye001", "camtgt001");
	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");

	SetFade_(FADE_IN, FADE_COLOR_BLACK, 30);					//�t�F�[�h�C��
	//...........................................................................
	Wait_(300);
	
	//===================================
	//�J�b�g2-2�@�Ђ����ǂ�
	//===================================
	//...........................................................................
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 30);					//�t�F�[�h�A�E�g
	WaitFade_();
	
	RideOff_(player, nebyu);									//���C�h�I�t
	SetVisible(nebyu, false);
	SetVisible(hikui, true);
	
	RideOn_(player, hikui, 164, 0.6);							//���C�h�I���@�Ђ����ǂ�
	SetPointPos_(hikui, "player001");

	SetFade_(FADE_IN, FADE_COLOR_BLACK, 30);					//�t�F�[�h�C��
	//...........................................................................
	Wait_(300);
	
	//===================================
	//�J�b�g3-1�@�l�r�����X
	//===================================
	//...........................................................................
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 30);					//�t�F�[�h�A�E�g
	WaitFade_();
	
	RideOff_(player, hikui);									//���C�h�I�t
	SetVisible(hikui, false);
	SetVisible(nebyu, true);
	
	SetPointPos_(player, "player002");
	SetPointPos_(nebyu, "player002");
	SetPointPos_(nocho, "npc_nocho002");
	RideOn_(player, nebyu, 164, 0.6);							//���C�h�I���@�l�r�����X

	ReadWaitingLod("cameye002", "camtgt002");
	SetPointCameraEye_("cameye002");
	SetPointCameraTarget_("camtgt002");
	
	SetFade_(FADE_IN, FADE_COLOR_BLACK, 30);					//�t�F�[�h�C��
	//...........................................................................
	
	Wait_(300);
	
	//===================================
	//�J�b�g3-2�@�Ђ����ǂ�
	//===================================
	//...........................................................................
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 30);					//�t�F�[�h�A�E�g
	WaitFade_();
	
	RideOff_(player, nebyu);									//���C�h�I�t
	SetVisible(nebyu, false);
	SetVisible(hikui, true);
	
	RideOn_(player, hikui, 164, 0.6);							//���C�h�I���@�Ђ����ǂ�
	SetPointPos_(hikui, "player002");

	SetFade_(FADE_IN, FADE_COLOR_BLACK, 30);					//�t�F�[�h�C��
	//...........................................................................
	Wait_(300);
	
	EndDemo(FADE_COLOR_BLACK);
}
