//=============================================
//
//		demo602[�y���ӂ�����]
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
	local task_cam, task_player, task_santyo;
	local efc_player;

// �����\�[�X�Ǎ�
	// �L�����N�^�[
	local ansesu = GetPlayerId_();										// �A���Z�X
	local model_player = ReadNpc_("n010");								// �c������l��
	local model_santyo = ReadNpc_("n011");								// �T���`��
	
	// �G�t�F�N�g
	LoadEffect_("EF712_10_EMO_SURPRISE01");								// �u�I�v
	LoadEffect_("ef720_01_nat_oth_birds");								// ��

// ���z�u
	SetPointPos_(ansesu, "ansesu000");									// �A���Z�X��\��
	SetVisible(ansesu, false);
	
	local player = ArrangePointNpc_(model_player, "player000");			// �c������l��
	
	local santyo = ArrangePointNpc_(model_santyo, "npc_santyo000");		// �T���`��
	SetScaleSilhouette(santyo, SCALE.SANCHO, SILHOUETTE_WIDTH.SANCHO);
	
// ����풓���[�V�����Ǎ�
	// �q����l��
	local pl_surprise = ReadMotion_(player, "n010_surprise_L");			// ����
	local pl_caution = ReadMotion_(player, "n010_caution_L");			// �x��
	
	// �T���`��
	local santyo_bow = ReadMotion_(santyo, "n011_bow");					// ������

// ���t�F�[�h�F�ݒ�
	SetFade_(FADE_OUT, FADE_COLOR_WHITE, FADE_DEF);
	WaitFade_();

//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------
	//��������������������������������������
	//���J�b�g�P �Ɓ���x��
	//��������������������������������������
	StartBlurEffect_();
	SetMotion_(player, MOT_WAIT, BLEND_N);							//��@�������[�V�����@�x��
	SetFace_(player, "Face_surprise");									//��@������

	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");			//�ŏ��̃J�b�g�ŃA�j������~����悤�ݒ�
	DeleteTask_(task_cam);

	Wait_(70);
	
	local efc_birds = SetPointWorldEffect_("ef720_01_nat_oth_birds", "efc_birds000");		//���G�t�F�N�g
	SetEffectScale_(efc_birds, 1.2);
	
	StartDemo(FADE_COLOR_WHITE);
	PlayBgm_("BG_AMBI_005");
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");			//�t�F�[�h�J��30F��ɃA�j���J�n
	WaitTask(task_cam);
	Wait_(50);
	SetMotion_(player, MOT_WAIT, BLEND_N);
	EndBlurEffect_();
	//��������������������������������������
	//���J�b�g�Q ��u�ڂ��o�߂�Ƒ̂��k��ł����I�v
	//��������������������������������������
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");
	SetMotion_(player, pl_surprise, BLEND_XL);
	
	WaitTask(task_cam);
	Wait_(50);
	SetMotion_(player, MOT_WAIT, BLEND_N);

	//��������������������������������������
	//���J�b�g�R �T���`���J�����C��
	//��������������������������������������
	task_santyo = Task_AnimeMove_(santyo, "anm_santyo000");
	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");			//�T���`��in�܂ŃJ������~
	DeleteTask_(task_cam);
	Wait_(30);
	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");
	Wait_(20);
	PlaySE_("SE_FLD_040");												//��SE:�T���`�������i���V�����X�^�[�̑����j
	Wait_(20);
	PlaySE_("SE_FLD_040");												//��SE:�T���`�������i���V�����X�^�[�̑����j
	
	WaitTask(task_cam);
	WaitTask(task_santyo);
	
	SetMotion_(santyo, santyo_bow, BLEND_L);
	WaitMotion(santyo);
	SetMotion_(santyo, MOT_TALK, BLEND_XL);
	WaitMotion(santyo);
	SetMotion_(santyo, MOT_TALKLOOP, BLEND_M);
	//===============================================
	// ���T���`��
	// �u���͂悤�������}�X�@����l���̖��O�����܁B
	// �@�������@�����C�����Ł@�����f�X�B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_SANCHO");
	ShowMsg_("DEMO_602_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_()
	//===============================================
//	local pos = Vec3(0.2, -0.6, 0);
//	efc_player = SurpriseDispSetOffset(player, pos, 0.6);

	Wait_(10);
	SetMotion_(player, MOT_WAIT, BLEND_N);

	//��������������������������������������
	//���J�b�g�S �T���`���A�b�v
	//��������������������������������������
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");
	
	//===============================================
	// ���T���`��
	// �u�ǂ�����}�V���H�@����ȂɁ@���ǂ낢�āB
	// �@�����I�@�����@�ǂ��Ȃ��Ă�̂��f�X���H
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_SANCHO");
	ShowMsg_("DEMO_602_MSG_020");
	KeyInputWait_();
	//===============================================
	//===============================================
	// ���T���`��
	// �u�����́���l���̖��O�����܂Ɓ@���Z���܂ł���
	// �@�A���Z�X���܂��Z�ށ@�{���̊y���f�X�B
	//-----------------------------------------------
	ShowMsg_("DEMO_602_MSG_030");
	KeyInputWait_();
	CloseMsgWnd_()
	//===============================================
	SetMotion_(santyo, MOT_WAIT, BLEND_XL);
	Wait_(20);
	
	//��������������������������������������
	//���J�b�g�T ��u�I�v
	//��������������������������������������
	task_cam = Task_AnimeMoveCamera_("anmeye004", "anmtgt004");
	Wait_(5);
	local pos = Vec3(0, -0.24, 0.5);
	efc_player = SurpriseDispSetOffset(player, pos, 0.45);
	SetMotion_(player, pl_caution, BLEND_M);							//��@�x��

	Wait_(40);
	DeleteTask_(task_cam);	
	//��������������������������������������
	//���J�b�g�U �T���`���@��
	//��������������������������������������
	task_cam = Task_AnimeMoveCamera_("anmeye003", "anmtgt003");
	SetMotion_(santyo, MOT_TALK, BLEND_XL);
	//===============================================
	// ���T���`��
	// �u�A���Z�X���܂́@�킢����@�߂�ꂽ����
	// �@���Ȃ��Ɓ@�ꏏ�Ɂ@���̒n�ɏZ��ł����}�X�B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_SANCHO");
	ShowMsg_("DEMO_602_MSG_040");
	WaitMotion(santyo);
	SetMotion_(santyo, MOT_TALKLOOP, BLEND_M);
	KeyInputWait_();
	//===============================================
	//===============================================
	// ���T���`��
	// �u���̃A���Z�X���܂́@��������@���ɂ���
	// �@�X�̉��ց@�s���Ɓ@�����Ă����܃V�^�B
	//-----------------------------------------------
	ShowMsg_("DEMO_602_MSG_050");
	KeyInputWait_();
	CloseMsgWnd_()
	//===============================================
	Wait_(10);
	DeleteTask_(task_cam);

	//��������������������������������������
	//���J�b�g�V �T���`���ăA�b�v
	//��������������������������������������
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");
	//===============================================
	// ���T���`��
	// �u�����@�A���Z�X���܂Ɂ@�p��������̂ŃV�^��
	// �@����l���̖��O�����܂��@�s����e�n�H
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_SANCHO");
	ShowMsg_("DEMO_602_MSG_060");
	KeyInputWait_();
	CloseMsgWnd_()
	//===============================================
	SetMotion_(santyo, MOT_WAIT, BLEND_XL);
	Wait_(30);
	
	EndDemo(FADE_COLOR_BLACK);
}
