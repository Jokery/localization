//=============================================
//
//		demo202[�����X�^�[�̗H��`�Ƃ̏o�]
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
	local task_cam, task_player, task_poison;
	local efc_player, efc_poison;

// �����\�[�X�Ǎ�
	// �L�����N�^�[
	local player = GetPlayerId_();					// ��l��
	local model_poison = ReadNpc_("m100_01");		// �|�C�Y���g����
	//�G�t�F�N�g
	LoadEffect_("ef712_04_emo_joy01");										// ���

// ���z�u
	// ��l��
	SetPointPos_(player, "player000");
	// �|�C�Y���g����
	local poison = ArrangePointNpc_(model_poison, "npc_poison000");
	SetPointPosNoFit_(poison, "npc_poison000");
	SetScaleSilhouette(poison, SCALE.POISONTRILL, SILHOUETTE_WIDTH.POISONTRILL);
	SetAlpha_(poison, 0.8);

// ����풓���[�V�����Ǎ�
	// ��l��
	local pl_nod = ReadMotion_(player, "Player_nod");						// �ҋ@�����ȂÂ����ҋ@
	// �|�C�Y���g����
	local poison_joy = ReadMotion_(poison, "m100_01_joy_L");				// ��ԁi��ђ��˂�j
	local poison_sad_L = ReadMotion_(poison, "m100_01_sad_L");				// ��������L
	local poison_talk_L = ReadMotion_(poison, "m100_01_talk_L");			// ��b
	
// ���������[�V�����ݒ�
	SetMotion_(poison, poison_talk_L, BLEND_XL);							// �ҋ@
	
// ���J�����ݒ�
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");

//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------

	SetMotion_(poison, poison_joy, BLEND_M);								// ��ԁi��ђ��˂�j

	StartDemo(FADE_COLOR_BLACK);
	
	// ���J�b�g�P����l���ƃ|�C�Y���g�����`�`�`�`�`�`�`�`�`�`�`
	efc_poison = SetSelectBoneEffect_("ef712_04_emo_joy01", poison, ATTACH_EFFECT1);	//�|�C�Y���g�������
	SetEffectScale_(efc_poison, 4.0);
	//===============================================
	//*�����X�^�[�̗H��`
	//�u���̃��A�N�^�[�c�c�L�~�ɂ́@�{�N�݂�����
	//�@�����X�^�[�̗H��̎p���@������񂾂ˁH
	// ��
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_202_MSG_010");
	KeyInputWait_();
	//-----------------------------------------------
	
	SetMotion_(poison, poison_talk_L, BLEND_L);								// �Ő�
	//-----------------------------------------------
	//*�����X�^�[�̗H��`
	//�u�Ƃ������Ƃ́@�L�~���@���L���̌����Ă�
	//�@<name_player/>���ȁH
	//-----------------------------------------------
	ShowMsg_("DEMO_202_MSG_020");
	DeleteEffectEmitter_(efc_poison);
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	SetMotion_(poison, MOT_WAIT, BLEND_L);									// �őҋ@

	SetMotion_(player, pl_nod, BLEND_L);									// �ҋ@�����ȂÂ����ҋ@
	WaitMotion(player);
	SetMotion_(player, MOT_WAIT, BLEND_L);
	
	Wait_(10);
	SetAlpha_(player, ALPHA_CLEAR);
	
	// ���J�b�g�Q���|�C�Y���g�����A�b�v�`�`�`�`�`�`�`�`�`�`�`�`
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");					// 120F
	SetMotion_(poison, poison_joy, BLEND_L);								// �Ŋ��
	
	//===============================================
	//*�����X�^�[�̗H��`
	//�u����ς�I�@�O���畷���Ă��񂾁@�L�~�̂��ƁB
	//�@�˂��c�c�{�N�́@���肢���@�����Ă���Ȃ��H
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_202_MSG_030");
	KeyInputWait_();
	CloseMsgWnd_();
	//-----------------------------------------------
	
	Wait_(10);
	DeleteTask_(task_cam);
	SetAlpha_(player, 1);
	
	// ���J�b�g�R����l���ƃ|�C�Y���g�����`�`�`�`�`�`�`�`�`�`�`
	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");					// 180F

	SetMotion_(poison, MOT_WAIT, 15);				// �ҋ@
	Wait_(15);
	SetMotion_(poison, poison_sad_L, BLEND_XL);									// ��������

	//-----------------------------------------------
	//�u���̊��y�̗쓹�ɂ́@�u���h���h���Ă���
	//�@�������������ā@�����������@����񂾁B
	// ��
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_202_MSG_040");
	KeyInputWait_();
	//-----------------------------------------------

	//-----------------------------------------------
	//�u�{�N�����@�����̂����Ł@�˂����
	//�@�ǂ��o����āc�c�������@�T���Ă��񂾂�B
	//-----------------------------------------------
	ShowMsg_("DEMO_202_MSG_050");
	KeyInputWait_();
	CloseMsgWnd_();
	//-----------------------------------------------

	Wait_(20);
	DeleteTask_(task_cam);
	SetAlpha_(poison, ALPHA_CLEAR);

	// ���J�b�g�S����l���Y�[���C���`�`�`�`�`�`�`�`�`�`
	task_cam = Task_AnimeMoveCamera_("anmeye003", "anmtgt003");					// 120F

	//===============================================
	//*�����X�^�[�̗H��`
	//�u���L������@���������ǁ@�L�~���ċ����񂾂�H
	//�@���肢����I�@�u���h���h���@������Ă�I
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_202_MSG_060");
	KeyInputWait_();
	CloseMsgWnd_();
	//-----------------------------------------------

	Wait_(15);
	DeleteTask_(task_cam);
	Wait_(15);
	SetAlpha_(poison, 0.8);
	SetAlpha_(player, ALPHA_CLEAR);
	SetMotion_(poison, poison_talk_L, BLEND_N);									// ��b

	// ���J�b�g�U���|�C�Y���g�����A�b�v�`�`�`�`�`�`�`�`�`�`�`
	task_cam = Task_AnimeMoveCamera_("anmeye004", "anmtgt004");					// 270F

	//-----------------------------------------------
	//�u�u���h���h�́@���y�̗쓹�̖k�c�c
	//�@�A���f�b�h�K�[�f�����ďꏊ�Ɂ@����񂾁B
	// ��
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_202_MSG_070");
	KeyInputWait_();
	//-----------------------------------------------

	//-----------------------------------------------
	//�u�ł��@�����́@�A���f�b�h�K�[�f����
	//�@�J�M�������ā@���������Ă��܂��Ăˁc�c�B
	// ��
	//-----------------------------------------------
	SetMotion_(poison, MOT_WAIT, 14);				// �ҋ@
	Wait_(8);
	ShowMsg_("DEMO_202_MSG_080");
	Wait_(6);
	SetMotion_(poison, poison_sad_L, BLEND_XL);									// ��������
	Wait_(16);
	KeyInputWait_();
	//-----------------------------------------------
	SetMotion_(poison, poison_talk_L, BLEND_L);									// ��b

	//-----------------------------------------------
	//�u�A���f�b�h�K�[�f���̃J�M��
	//�@�����́@�R�l�̎艺���@�����Ă�͂�����B
	// ��
	//-----------------------------------------------
	ShowMsg_("DEMO_202_MSG_090");
	KeyInputWait_();
	//-----------------------------------------------

	//-----------------------------------------------
	//�u�艺��3�l���@���Ȃ�@�苭���z��Ȃ񂾁B
	//�@���A�N�^�[���g���Ȃ���@�T���Ă݂Ă�B
	//-----------------------------------------------
	ShowMsg_("DEMO_202_MSG_100");
	KeyInputWait_();
	CloseMsgWnd_();
	//-----------------------------------------------
	SetMotion_(poison, MOT_WAIT, BLEND_XL);				// �ҋ@

	EndDemo(FADE_COLOR_BLACK);
}
