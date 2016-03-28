//=============================================
//
//		demo214[�H��̂���]
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
	local alpha_poison;

// �����\�[�X�Ǎ�
	// �M�~�b�N
	local model_transfer = ReadGimmick_("o_dem_00");
	// �L�����N�^�[
	local player = GetPlayerId_();											// ��l��
	local model_poison = ReadNpc_("m100_01");								// �|�C�Y���g����
	//�G�t�F�N�g
	LoadEffect_("ef712_04_emo_joy01");										// ���

// ���z�u
	// �]�����u
	local transfer = ArrangePointGimmick_("o_dem_00", model_transfer, "obj_transfer000");
	SetMotion_(transfer, MOT_GIMMICK_0, BLEND_N);							//�N���O

	// ��l��
	SetPointPos_(player, "player000");

	// �|�C�Y���g����
	local poison = ArrangePointNpc_(model_poison, "npc_poison000");
	SetPointPosNoFit_(poison, "npc_poison000");
	SetScaleSilhouette(poison, SCALE.S, SILHOUETTE_WIDTH.S);				//�|�C�Y���@�T�C�YS
	SetAlpha_(poison, 0.8);
	SetStepSe_(poison, SILENT_STEP_SE);

// ����풓���[�V�����Ǎ�
	// ��l��
	local player_look_up_L = ReadMotion_(player, "Player_look_up_L");		// ��l���@������ҋ@
	local player_nod = ReadMotion_(player, "Player_nod");					// ��l���@���ȂÂ�
	
	// �|�C�Y���g����
	local pt_joy = ReadMotion_(poison, "m100_01_joy_L");					// ��b�i��сj
	local pt_talk_L = ReadMotion_(poison, "m100_01_talk_L");				// ��bL
	local pt_hand = ReadMotion_(poison, "m100_01_shake_hand_L");			// ���U��
	
// �����Ԑݒ�
	SetTime_(START_TIME_ZONE_NIGHT);

// ���J�����ݒ�
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");				// 270F

//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);

	// ���J�b�g�P����l���ƃ|�C�Y���g�����`�`�`�`�`�`�`�`�`�`�`

	//===============================================
	//*�����X�^�[�̗H��`
	//�u�u���h���h���@��������񂾂ˁB
	//�@���������Ȃ����I
	//��
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_214_MSG_010");
	efc_poison = SetSelectBoneEffect_("ef712_04_emo_joy01", poison, ATTACH_EFFECT1);	//�|�C�Y���g�������
	SetEffectScale_(efc_poison, 4.0);
	SetMotion_(poison, pt_joy, BLEND_L);									// �|�C�Y���g�����@��b�i��сj
	KeyInputWait_();
	//===============================================
	//*�����X�^�[�̗H��`
	//�u�������Ł@��������́@�����ł����B
	//�@�Ȃ����́@�䂪�Ƃ��c�c���肪�Ƃ��I
	//��
	//-----------------------------------------------
	ShowMsg_("DEMO_214_MSG_020");
	KeyInputWait_();
	//===============================================
	//*�����X�^�[�̗H��`
	//�u�����@��������Ȃ��Ɓc�c�������I
	//�@���̐΂��@������Ă����H
	//��
	//-----------------------------------------------
	DeleteEffectEmitter_(efc_poison);
	SetMotion_(poison, pt_talk_L, BLEND_L);									// �|�C�Y���g�����@��bL
	ShowMsg_("DEMO_214_MSG_030");
	KeyInputWait_();
	//===============================================
	//*�����X�^�[�̗H��`
	//�u���L������@��������������ǁc�c
	//�@�L�~���@�����Ă�ق����@�����Ƃ����B
	//��
	//-----------------------------------------------
	ShowMsg_("DEMO_214_MSG_040");
	KeyInputWait_();
	//===============================================

	SetMotion_(poison, MOT_WAIT, BLEND_XL);
	Wait_(15);

	//===============================================
	// *�V�X�e�����b�Z�[�W
	//<name_player/>��
	//<yellow/>�����̓V����<white/>���@��������I
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_214_MSG_050");
	PlayMe_("ME_010");
	WaitMe_();
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	WaitTask(task_cam);
	Wait_(20);
	task_poison = Task_WalkAroundToPos(poison, GetPos_(transfer), ROTATE_DEMO_DEF);					// �|�C�Y���g�����@�U�����	

	// ���J�b�g�Q���]�����u�ւo�`�m�`�`�`�`�`�`�`�`�`�`�`�`�`�`
	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");

	//===============================================
	//*�����X�^�[�̗H��`
	//�u�L�~�́@���L�����@�ǂ��Ă����񂾂낤�H
	//�@��������@���̈ړ����u���@�g���Ȃ�B
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_214_MSG_060");
	KeyInputWait_();
	SetMotion_(player, player_look_up_L, BLEND_XL);							// ��l���@�������
	CloseMsgWnd_();
	//===============================================

	Wait_(15);
	WaitTask(task_poison);
	DeleteTask_(task_poison);
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");				// 180F
	WaitTask(task_cam);
	Wait_(70);

	SetMotion_(player, MOT_WAIT, BLEND_N);									//��l���ҋ@
	SetDirToObject_(player, poison);

	// ���J�b�g�R����l���@�b���`�`�`�`�`�`�`�`�`�`�`�`

	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");

	task_poison = Task_WalkAroundToPos(poison, GetPos_(player), ROTATE_DEMO_DEF);					// �|�C�Y���g�����@�U�����
	Wait_(30);
	SetMotion_(poison, pt_talk_L, BLEND_L);									// �|�C�Y���g�����@��bL

	//===============================================
	//*�����X�^�[�̗H��`
	//�u�ړ����u�́@��ɂ���̂́@�����̕X�����B
	//�@��������@�܂��́@�|�[���p�[�N�֊��Ƃ����B
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_214_MSG_070");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	WaitTask(task_poison);
	DeleteTask_(task_poison);

	//��l���Y�[���A�b�v
	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");				// 200F

	//===============================================
	//*�����X�^�[�̗H��`
	//�u�|�[���p�[�N�́@�傫�ȑ�������ˁB
	//�@���L����T���ɂ́@�����炦��������B
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_214_MSG_080");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	SetMotion_(player, player_nod, BLEND_L);								// ��l���@���ȂÂ�
	WaitMotion(player);
	SetMotion_(player, MOT_WAIT, BLEND_L);									// ��l���@�ҋ@
	Wait_(30);
	DeleteTask_(task_cam);
	SetVisible(player, false);												//��l�� ��\��

	// ���J�b�g�S���|�C�Y���g�����A�b�v�`�`�`�`�`�`�`�`�`�`�`�`

	SetPointCameraEye_("cameye002");
	SetPointCameraTarget_("camtgt002");

	//===============================================
	//*�����X�^�[�̗H��`
	//�u���ꂶ�Ⴀ�@�s���Ă�����Ⴂ�B
	//�@���C�łˁ@<name_player/>�I
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_214_MSG_090");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	SetMotion_(poison, pt_hand, BLEND_XL);									// ���U��
	Wait_(15);

	//�|�C�Y���g�����@�����������Ă���
//	Task_ObjectFadeOut_(poison, 50);
//	PlaySE_("SE_DEM_018");
//	Wait_(70);

	Wait_(30);

	EndDemo(FADE_COLOR_BLACK);
}
