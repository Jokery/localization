//=============================================
//
//		demo403[���N�̌��ӂƕ�e�̂Ȃ���]
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
	local task_cam, task_player, task_boy, task_mother;
	local efc_boy, efc_mother, efc_syutyu;
	
// �����\�[�X�Ǎ�
	// �L�����N�^�[
	local player = GetPlayerId_();					// ��l��
	local n_boy000 = ReadNpc_("m127_01");			// �X�p�C�N�w�b�h�i�q���j
	local n_mother000 = ReadNpc_("m127_01");		// �X�p�C�N�w�b�h�i��e�j

// ���z�u
	// ��l��
	SetPointPos_(player, "player000");

	// �q��
	local npc_boy000 = ArrangePointNpc_(n_boy000, "npc_boy000");
	SetScaleSilhouette(npc_boy000, 0.35, 0.25);

	// ��e
	local npc_mother000 = ArrangePointNpc_(n_mother000, "npc_mother000");
	SetScaleSilhouette(npc_mother000, 0.52, 0.35);

// ����풓���[�V�����Ǎ�
	local feel_down_b	= ReadMotion_(npc_boy000,		 "m127_01_feel_down_L");	// ��������L
	local feel_down_m	= ReadMotion_(npc_mother000,	 "m127_01_feel_down_L");	// ��������L
	local talk_b		= ReadMotion_(npc_boy000,		 "m127_01_talk_L");			// ��bL
	local talk_m		= ReadMotion_(npc_mother000,	 "m127_01_talk_L");			// ��bL
	local what_b		= ReadMotion_(npc_boy000,		 "m127_01_what_L");			// ��HL
	local what_m		= ReadMotion_(npc_mother000,	 "m127_01_what_L");			// ��HL
	local irritated_b	= ReadMotion_(npc_boy000,		 "m127_01_irritated_L");	// �ł�L
	local nod_m			= ReadMotion_(npc_mother000,	 "m127_01_nod");			// �ҋ@�����������遨�ҋ@
	local nod_p			= ReadMotion_(player,			 "Player_nod");				// �ҋ@�����������遨�ҋ@

	LoadEffect_("ef712_10_emo_surprise01");											// �u�I�v�G�t�F�N�g
	LoadEffect_("ef733_01_sym_shuchusen01");												// �W�����G�t�F�N�g
	
	SetMotion_(npc_boy000, feel_down_b, 1);											// �������ݏ�Ԃ���X�^�[�g

// ���J�����ݒ�
	SetPointCameraEye_("cameye004");								// �J�����A�C���������W�ɐݒ�
	SetPointCameraTarget_("camtgt004");								// �J�����^�[�Q�b�g���������W�ɐݒ�
	task_mother = Task_AnimeMove_(npc_mother000, "anm_mother000");	// ��e�̈ʒu�������ʒu�Ɉړ�(���ۂɂ͈ړ����Ă��Ȃ�)
//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------
	StartDemo(FADE_COLOR_BLACK);
	
	Wait_(10);																	// �J�n���ɏ���������
	
	SetMotion_(npc_mother000, talk_m, BLEND_L);									// ��e����b
	//===============================================
	// *��e
	// �u�������瓦����̂�I�@���킢�����Ȃ���
	//	�@�C�P�j�G�ɂȂ�ā@���ꂳ��ł��Ȃ���I
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_BOYS_MOTHER");
	ShowMsg_("DEMO_403_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	SetMotion_(npc_mother000, "WAIT", BLEND_L);	
	
	SetPointCameraEye_("cameye002");											// ���N�A�b�v
	SetPointCameraTarget_("camtgt002");											// ���N�A�b�v
	InitSilhouetteWidth_(npc_boy000, 0.9);
	
	//===============================================
	// *���N
	// �u�c�c�_������@���ꂳ��B
	//	�@�{�N����������@�݂�ȂɁ@���f��������B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_MONSTER_BOY");
	ShowMsg_("DEMO_403_MSG_020");
	KeyInputWait_();
	//===============================================

	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");					// �W�����p�J�������[�u
	PlaySE_("SE_DEM_026");	// ��SE:�W����
	efc_syutyu = SetCameraEffect_("ef733_01_sym_shuchusen01", 100);				// �W�����\��
	SetMotion_(npc_boy000, talk_b, BLEND_L);									// ��������ł��Ԃ����b���[�V�����ɕύX
	
	SetMotion_(npc_mother000, feel_down_m, BLEND_XL);							// ��e����������
	//===============================================
	// *���N
	// �u����Ɂ@�ǂ��Ɂ@��������Ă����̂��B
	//-----------------------------------------------
	ShowMsg_("DEMO_403_MSG_030");

	Wait_(20);																	// �W������20F�\��
	DeleteEffect_(efc_syutyu);													// �W����������

	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	SetMotion_(npc_boy000, feel_down_b, BLEND_XL);	
	WaitTask(task_cam);
	DeleteTask_(task_cam);
	DeleteTask_(task_mother);

	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");					// ��l�����߂Â��Ă���J����
	InitSilhouetteWidth_(npc_boy000, 1.4);

	task_player = Task_AnimeMove_(player, "anm_player000");						// ��l���߂Â�
	SetMotion_(player, MOT_WALK, BLEND_M);										// �������[�V����

	WaitTask(task_player);														// ��l���������Ă���܂ő҂�
	SetMotion_(player, MOT_WAIT, BLEND_M);										// �����Ă�����l����ҋ@���[�V������
	local task_kaiwa = Task_RotateToPos_(player, GetPos_(npc_mother000), 5);	// ��l�����e�̕��֌�����

	// �r�b�N���}�[�N�̉�
	PlaySE_("SE_DEM_053");

	// �r�b�N���}�[�N��\��
	efc_boy = SetSelectBoneEffectSetOffset_("ef712_10_emo_surprise01", npc_boy000, ATTACH_EFFECT1, Vec3(0.0, 5.0, 0.0));
	SetEffectScale_(efc_boy, 3.0);

	// �r�b�N���}�[�N��\��
	efc_mother = SetSelectBoneEffectSetOffset_("ef712_10_emo_surprise01", npc_mother000, ATTACH_EFFECT1, Vec3(1.0, -3.5, 0.0));
	SetEffectScale_(efc_mother, 2.7);

	// ��l���̕�������
	task_boy = Task_RotateToPlayerSetMotion_(npc_boy000, 5.0, "WALK", "WAIT");
	task_mother = Task_RotateToPlayerSetMotion_(npc_mother000, 1.0, "WALK", "WAIT");

	WaitTask(task_boy);															// �q������l���̕��������܂ő҂�
	SetMotion_(npc_boy000, talk_b, BLEND_L);									// �q���͉�b

	//===============================================
	// *���N
	// �u�����I�@���Z����I
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_MONSTER_BOY");
	ShowMsg_("DEMO_403_MSG_040");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	DeleteTask_(task_cam);
	DeleteTask_(task_boy);
	DeleteTask_(task_player);
	DeleteTask_(task_mother);

	SetMotion_(npc_mother000, talk_m, BLEND_L);									// ��e����b
	SetMotion_(npc_boy000, "WAIT", BLEND_L);									// �q���͑ҋ@
	
	//===============================================
	// *��e
	// �u���̕��́c�c�H
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_BOYS_MOTHER");
	ShowMsg_("DEMO_403_MSG_050");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	SetMotion_(npc_boy000, talk_b, BLEND_L);									// �q������b
	SetMotion_(npc_mother000, "WAIT", BLEND_L);									// ��e�͑ҋ@

	// �q������e�̕��������Ȃ���b��
	local task_kaiwa = Task_RotateToPos_(npc_boy000, GetPos_(npc_mother000), 5);
	SetMotion_(npc_boy000, MOT_WALK, BLEND_L);								// ��l���ɕ��݊���e
	Wait_(30);
	SetMotion_(npc_boy000, talk_b, BLEND_XL);									// �q������b	
	//===============================================
	// *���N
	// �u���̂��Z����@���L����
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_MONSTER_BOY");
	ShowMsg_("DEMO_403_MSG_060");
	WaitTask(task_kaiwa);
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	task_mother = Task_AnimeMove_(npc_mother000, "anm_mother002");				// �J�����𓮂���
	SetMotion_(npc_mother000, MOT_WALK, BLEND_L);								// ��l���ɕ��݊���e
	
	local task_kaiwa = Task_RotateToPos_(npc_boy000, GetPos_(player), 5);	// ��l���̕��������q��
	SetMotion_(npc_boy000, MOT_WALK, BLEND_L);								
	
	//===============================================
	// *��e
	// �u���L������Ɂc�c�H
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_BOYS_MOTHER");
	ShowMsg_("DEMO_403_MSG_070");

	WaitTask(task_kaiwa);
	SetMotion_(npc_boy000, MOT_WAIT, BLEND_L);								
	WaitTask(task_mother);														// ���݊�肫��܂ő҂�
	DeleteTask_(task_mother);													// �^�X�N������
	SetMotion_(npc_mother000, talk_m, BLEND_L);									// ��e����b	
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	SetMotion_(player, nod_p, BLEND_L);											// ���ȂÂ���l��
	WaitMotion(player);															// ���ȂÂ��҂�

	SetPointCameraEye_("cameye001");											// �J�����؂�ւ�
	SetPointCameraTarget_("camtgt001");											// �J�����؂�ւ�
	SetVisible(player, false);													// ��l�����f�荞�ނ̂Ŕ�\���ɂ���
	InitSilhouetteWidth_(npc_boy000, 0.9);

	//===============================================
	// *��e
	// �u�����c�c��͂�@�����ł��ˁB
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_BOYS_MOTHER");
	ShowMsg_("DEMO_403_MSG_080");
	KeyInputWait_();
	//===============================================

	SetMotion_(npc_mother000, nod_m, BLEND_L);									// �����������e
	
	//===============================================
	// *��e
	// �u���Ȃ��́@�`�J���ɂȂ��Ăق�����
	//-----------------------------------------------
	ShowMsg_("DEMO_403_MSG_090");

	WaitMotion(npc_mother000);													// ���[�V�����I���҂�
	SetMotion_(npc_mother000, "WAIT", BLEND_L);									// �ҋ@���[�V����

	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	local task = Task_RotateToDir_(npc_boy000, 85, 15);							// ��e�̕��֌������N
	SetMotion_(npc_boy000, MOT_WALK, BLEND_L);									// ���N��b���[�V����
	WaitTask(task);
	SetMotion_(npc_boy000, talk_b, BLEND_XL);									// ���N��b���[�V����

	//===============================================
	// *���N
	// �u������c�c�{�N���@�C�P�j�G�ɂȂ����
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_MONSTER_BOY");
	ShowMsg_("DEMO_403_MSG_100");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	SetPointCameraEye_("cameye002");											// �J�����؂�ւ�
	SetPointCameraTarget_("camtgt002");											// �J�����؂�ւ�
	InitSilhouetteWidth_(npc_boy000, 0.8);
	SetVisible(npc_mother000, false);											// ��e���\����
	SetMotion_(npc_boy000, feel_down_b, BLEND_XL);								// ���N��������

	//===============================================
	// *���N
	// �u���L���݂����Ɂ@�݂������@���Ȃ��
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_MONSTER_BOY");
	ShowMsg_("DEMO_403_MSG_110");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	SetDir_(npc_mother000, -100);												// ��e�̌�����ύX
	SetPointCameraEye_("cameye003");											// �J�����؂�ւ�
	SetPointCameraTarget_("camtgt003");											// �J�����؂�ւ�

	SetVisible(npc_mother000, true);											// ��e���ĕ\��
	SetMotion_(npc_mother000, feel_down_m, 20);									// �������ޕ�e
	task_cam = Task_AnimeMoveCamera_("anmeye003", "anmtgt003");					// �J�������������ƈ���
	InitSilhouetteWidth_(npc_boy000, 1.2);
	
	//===============================================
	// *��e
	// �u����́@�킩���Ă��܂��c�c�B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_BOYS_MOTHER");
	ShowMsg_("DEMO_403_MSG_120");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	//===============================================
	// *���N
	// �u���ꂳ��c�c����ł��@�N����
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_MONSTER_BOY");
	ShowMsg_("DEMO_403_MSG_130");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	Wait_(30);

	EndDemo(FADE_COLOR_BLACK);
	SetVisible(player, true);													// �����Ă�����l����߂�
}
