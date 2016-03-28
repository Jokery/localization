//=============================================
//
//		demo116[�G�[�X�̗��ݎ�]
//
//=============================================
function Update()
{
	//=====================================
	//���[�J���ϐ��̐ݒ�
	//=====================================
	local task_cam, task_player, task_ace;
	local efc_holography, efc_ace, efc_fall00, efc_fall01, efc_fall02;

	//=====================================
	//�v���C���[�ݒu
	//=====================================
	//ID�̎擾
	local player = GetPlayerId_();
	//�ݒu
	SetPointPos_(player, "player000");
	//�����̃��[�V����
	SetMotion_(player, MOT_WAIT, BLEND_N);
	//���l�̎蓮�ݒ�
	SetManualCalcAlpha_(player, true);
	//�����̃��l
	SetAlpha_(player, 1.0);

	//=====================================
	//NPC�ݒu
	//=====================================
	//���\�[�X�̓ǂݍ���
	local npc_ace = ReadNpc_("n002");										// �G�[�X
	//�ݒu
	local res_ace = ArrangePointNpc_(npc_ace, "npc_ace000");
	//���l�̎蓮�ݒ�
	SetManualCalcAlpha_(res_ace, true);
	//�����̃��l
	SetAlpha_(res_ace, 1.0);

	//���\�[�X�̓ǂݍ���
	local npc_rena = ReadNpc_("n034");										// ���i�[�e
	//�ݒu
	local res_rena = ArrangePointNpc_(npc_rena, "npc_rena000");
	//���l�̎蓮�ݒ�
	SetManualCalcAlpha_(res_rena, true);
	//�����̃��l
	SetAlpha_(res_rena, 1.0);

	//=====================================
	//�M�~�b�N�ݒu
	//=====================================
	local model_red_screen = ReadGimmick_("o_A03_05");
	local red_screen = ArrangeGimmick_("o_A03_05", model_red_screen, false);
	SetMotion_(red_screen, MOT_GIMMICK_0, BLEND_N);							// �_��ON
	local gimmickRes = ReadGimmick_("o_A03_04");
	local gimmick = ArrangePointGimmick_("o_A03_04", gimmickRes, "obj_screen000");

	//=====================================
	//�G�t�F�N�g�̓ǂݍ���
	//=====================================
	LoadEffect_("ef712_13_emo_sweat01");
	LoadEffect_("ef732_14_holography01");									// �z���O�����\���@�풓
	LoadEffect_("ef732_16_holography01");									// �z���O�����\���@����
	efc_holography = SetBoneEffect_("ef732_14_holography01", res_rena);
	LoadEffect_("ef726_01_nat_parapara");									// ������

	//=====================================
	//���[�V�����̓ǂݍ���
	//=====================================
	local player_surprise = ReadMotion_(player, "Player_surprise");			// ��l���@����
	local player_surprise_L = ReadMotion_(player, "Player_surprise_L");		// ��l���@����L
	local player_talk = ReadMotion_(player, "Player_talk");					// ��l���@�b��
	local player_talk_L = ReadMotion_(player, "Player_talk_L");				// ��l���@�b��L
	local player_caution01_L = ReadMotion_(player, "Player_caution01_L");	// ��l���@�x��L
	local res_rena_look_left_L = ReadMotion_(res_rena, "n007_look_left_L");	// ���i�[�e�@�������ҋ@L
	local ace_look_araund2_L = ReadMotion_(res_ace, "n002_look_araund02_L");// �G�[�X�@�ӂ������L�i���ʂɃL�����L�����j
	local ace_think = ReadMotion_(res_ace, "n002_think");					// �G�[�X�@�l����
	local ace_think_L = ReadMotion_(res_ace, "n002_think_L");				// �G�[�X�@�l����L
	local ace_arm_folde = ReadMotion_(res_ace, "n002_arm_folde");			// �G�[�X�@�l���遨���グ��
	local ace_arm_folde_L = ReadMotion_(res_ace, "n002_arm_folde_L");		// �G�[�X�@���グ��L
	local ace_impatience_L = ReadMotion_(res_ace, "n002_impatience_L");		// �G�[�X�@�ł�L
	local ace_look_up_L = ReadMotion_(res_ace, "n002_look_up_L");			// �G�[�X�@������ҋ@L
	//�����̃��[�V����
	SetMotion_(res_rena, res_rena_look_left_L, BLEND_N);


	//��������������������������������������
	//���J�b�g�P�@���i�[�e�Ǝ�l���@���i�[�e�������ҋ@L����l�������@���i�[�e�����ʁ���l������
	//��������������������������������������

// ���J�����ݒ�
	local task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");

//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);

	//===============================================
	//*���i�[�e
	//�u�c�c<name_player/>�B���L�����c�c
	//�@���W�X�^���X�́@���L�����@�T���āc�c�B�@��
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_116_MSG_010");
	KeyInputWait_();
	//===============================================
	//*���i�[�e
	//�u���L�����c�c���E���@�m�邽�߂�
	//�@���Ȃ��̗��́@������ׂƂȂ�c�c�B�@��
	//-----------------------------------------------
	ShowMsg_("DEMO_116_MSG_020");
	KeyInputWait_();
	//===============================================
	//*���i�[�e
	//�u�肪����́c�c���y�̗쓹�Ɂc�c�B
	//-----------------------------------------------
	ShowMsg_("DEMO_116_MSG_030");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	WaitTask(task_cam);
	DeleteTask_(task_cam);
	PlaySE_("SE_DEM_048");													// ���i�[�e������
	Wait_(10);
	SetVisible(res_rena, false);
	DeleteEffect_(efc_holography);
	efc_holography = SetBoneEffect_("ef732_16_holography01", res_rena);
	Wait_(5);
	SetMotion_(player, player_surprise, BLEND_M);							// ��l���@����
	WaitMotion(player);
	SetMotion_(player, player_surprise_L, BLEND_M);							// ��l���@����L
	Wait_(15);
	SetFade_(FADE_OUT, FADE_COLOR_WHITE, 25);
	Wait_(25);
	SetPointPos_(player, "player001");
	SetMotion_(player, MOT_WAIT, BLEND_N);									// ��l���@�ҋ@
	SetMotion_(res_ace, ace_impatience_L, BLEND_N);						// �G�[�X�@�ӂ������L�i���ʂɃL�����L�����j
	Wait_(65);


	//��������������������������������������
	//���J�b�g�Q�@��l���ƃG�[�X�@�G�[�X����낫��끨��b�@���ʉ�ʉE���
	//��������������������������������������

	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");
	local efc_ace = SetSelectBoneEffect_("ef712_13_emo_sweat01", res_ace, ATTACH_EFFECT2);// ���G�t�F�N�g
	
	PlayBgm_("BGM_027");
	SetFade_(FADE_IN, FADE_COLOR_WHITE, 25);
	Wait_(25);

	//===============================================
	//���G�[�X
	//�u�͂��I�@���@���̂́@�Ȃ񂾂����񂾂��H
	//�@<name_player/>�@���v���H�@��
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ACE");
	ShowMsg_("DEMO_116_MSG_040");
	KeyInputWait_();
	//===============================================
	
	DeleteEffectEmitter_(efc_ace);
	SetMotion_(res_ace, ace_think, BLEND_XL);								// �G�[�X�@��b
	//���G�[�X
	//�u���̂��ā@�I���[�Ɍ������@���b�Z�[�W����ȁH
	//�@�L�^�Ɂ@�o�Ă����̂́@�I���[�������̂��H
	//-----------------------------------------------
	ShowMsg_("DEMO_116_MSG_050");
	WaitMotion(res_ace);
	SetMotion_(res_ace, ace_think_L, BLEND_L);								// �G�[�X�@��bL
	Wait_(20);
	SetMotion_(res_ace, ace_arm_folde_L, BLEND_L);								// �G�[�X�@��bL	
	Wait_(10);
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	Wait_(10);

	//��������������������������������������
	//���J�b�g�R�@��l���@��b�@�E�΂ߑO����ʍ����
	//��������������������������������������

	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");

	SetMotion_(player, player_talk, BLEND_N);								// ��l���@�b��
	WaitMotion(player);
	SetMotion_(player, player_talk_L, BLEND_M);								// ��l���@�b��L
	Wait_(45);
	SetMotion_(player, MOT_WAIT, 20);										// ��l���@�ҋ@
	Wait_(30);


	//��������������������������������������
	//���J�b�g�S�@��l���ƃG�[�X�@�G�[�X�l���遨���������l�x���ł�@��l���ʁ�����
	//��������������������������������������
	SetMotion_(res_ace, ace_arm_folde_L, BLEND_N);								// �G�[�X�@�l����
	
//	SetPointCameraEye_("cameye002");
//	SetPointCameraTarget_("camtgt002");

	local task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");

	//===============================================
	//���G�[�X
	//�u�������@�I���[�@�̂̋L�����Ȃ��񂾂����ȁB
	//�@�ł��@����̓I���[�Ƃ����@�v���Ȃ������B�@��
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ACE");
	ShowMsg_("DEMO_116_MSG_060");
	KeyInputWait_();
	//===============================================
	//���G�[�X
	//�u�ǂ����c�c�I���[�ɂ́@�������m��Ȃ�
	//�@�B���ꂽ�閧���@����݂������ȁB
	//-----------------------------------------------
	ShowMsg_("DEMO_116_MSG_070");
	SetMotion_(res_ace, MOT_TALK, BLEND_L);							// �G�[�X�@��b�J�n
	WaitMotion(res_ace);
	SetMotion_(res_ace, MOT_TALKLOOP, BLEND_M);							// �G�[�X�@��b
	Wait_(4);
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	SetMotion_(res_ace, MOT_WAIT, BLEND_L);										// �G�[�X�@�ҋ@
	WaitTask(task_cam);
	Wait_(30);
	DeleteTask_(task_cam);
	
	StartEarthQuake_(-1, 3, 0.8);
	PlayLoopSE_("SE_DEM_013");
	SetMotion_(player, player_caution01_L, BLEND_L);						// ��l���@�x��L
	SetMotion_(res_ace, ace_impatience_L, BLEND_L);							// �G�[�X�@�ł�L
	local efc_ace = SetSelectBoneEffect_("ef712_13_emo_sweat01", res_ace, ATTACH_EFFECT2);// ���G�t�F�N�g
	efc_fall00 = SetPointWorldEffect_("ef726_01_nat_parapara", "efc_fall000");
	Wait_(5);
	SetEffectScale_(efc_fall00, 1.6);
	Wait_(5);
	efc_fall01 = SetPointWorldEffect_("ef726_01_nat_parapara", "efc_fall001");
	Wait_(5);
	efc_fall02 = SetPointWorldEffect_("ef726_01_nat_parapara", "efc_fall002");
	SetEffectScale_(efc_fall02, 0.8);
	Wait_(75);
	StopEarthQuake_();
	StartDecayEarthQuake_(20, 3, 0.8)
	StopLoopSE_(20);
	Wait_(5);
	DeleteEffectEmitter_(efc_fall02);
	Wait_(5);
	DeleteEffectEmitter_(efc_fall01);
	Wait_(5);
	DeleteEffectEmitter_(efc_fall00);
	Wait_(20);
	DeleteEffect_(efc_ace);
	SetMotion_(res_ace, MOT_WAIT, BLEND_L);									// �G�[�X�@�ҋ@
	Wait_(30);

	//��������������������������������������
	//���J�b�g�T�@�G�[�X�@��b�@���ʂ�⍶�΂߉�ʉE���
	//��������������������������������������

	SetPointCameraEye_("cameye003");
	SetPointCameraTarget_("camtgt003");

	SetVisible(player, false);
	SetMotion_(res_ace, MOT_TALK, BLEND_N);									// �G�[�X�@��b

	//===============================================
	//���G�[�X
	//�u�������ƁI�@��������@�Y��Ă��B
	//�@�n�k�́@�����ɂȂ����@�B���@���ׂˁ[�ƁB
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ACE");
	ShowMsg_("DEMO_116_MSG_080");
	Wait_(15);
	SetMotion_(res_ace, MOT_TALKLOOP, BLEND_L);								// �G�[�X�@��bL
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	SetMotion_(res_ace, MOT_WAIT, BLEND_L);										// �G�[�X�@�ҋ@
	Wait_(30);

	EndDemo(FADE_COLOR_BLACK);
}
