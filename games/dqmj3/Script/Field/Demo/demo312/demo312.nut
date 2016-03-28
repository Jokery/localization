//=============================================
//
//		demo312[�C�G�^�X�Ƃ̉]
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
	local task_cam, task_player, task_momonja0, task_momonja1, task_yetas;
	local efc_cam, efc_player, efc_momonja0, efc_momonja1, efc_yetas;
	local effect_pos = Vec3(0, 5, 0);	// �����񂶂�p�G�t�F�N�g���AEffect1��荂���ʒu�ɕ\������

// �����\�[�X�Ǎ�
	// �L�����N�^�[
	local player = GetPlayerId_();					// ��l��
	local model_yeti = ReadNpc_("n041");			// �C�G�^�X
	local model_momonja = ReadNpc_("n050");			// ���C�W�����񂶂�
	// �G�t�F�N�g
//	LoadEffect_("ef741_01_div_nor_death");			// ���S
	LoadEffect_("ef712_19_emo_confusion01");		// �s���s��
	LoadEffect_("ef712_10_emo_surprise01");			// �u�I�v
	LoadEffect_("ef733_01_sym_shuchusen01");		// �W����
	LoadEffect_("ef712_13_emo_sweat01");			// ��
	LoadEffect_("ef831_01_atc_yetas");				// �C�G�^�X�̍U��
	LoadEffect_("ef831_02_line_effect");			// ���ʐ�
	LoadEffect_("ef733_02_sym_black_mist01");		// ������

// ���z�u
	// ��l��
	SetPointPos_(player, "player000");
	SetAlpha_(player, ALPHA_CLEAR);
	
	// �C�G�^�X
	local yetas = ArrangePointNpc_(model_yeti, "npc_yetas000");
	SetScaleSilhouette(yetas, SCALE.N, 0.45);
	PosDebug(yetas);
	SetStepSe_(yetas, "SE_FLD_032");
	
	// �����񂶂�P�E�Q
	local momonja0 = ArrangePointNpc_(model_momonja, "npc_momonja000");
	local momonja1 = ArrangePointNpc_(model_momonja, "npc_momonja100");
	SetScaleSilhouette(momonja0, SCALE.N, 0.4);
	SetScaleSilhouette(momonja1, SCALE.N, 0.4);

// ����풓���[�V�����Ǎ�
	// ��l��
	local player_look_up_L = ReadMotion_(player, "Player_look_up_L");		// ������ҋ@L
	local pl_surprise = ReadMotion_(player, "Player_surprise");				// ����
	local pl_surprise_L = ReadMotion_(player, "Player_surprise_L");			// ����L
	local player_battle_L = ReadMotion_(player, "Player_battle_L");			// �퓬�ҋ@L
	local player_nod02 = ReadMotion_(player, "Player_nod02");			// ���������	
	
	// �C�G�^�X
	local yetas_wait_L = ReadMotion_(yetas, "n041_wait_L");				// �ҋ@L
	local yetas_talk_L = ReadMotion_(yetas, "n041_talk_L");				// ��bL
	local yetas_laugh_L = ReadMotion_(yetas, "n041_laugh_L");			// �ҋ@���΂�
	local yetas_scowl = ReadMotion_(yetas, "n041_scowl");				// �΂����ɂ��
	local yetas_attack = ReadMotion_(yetas, "n041_attack");					// �A�^�b�N

	// �����񂶂�P
	local momonja0_scare_L = ReadMotion_(momonja0, "m041_02_scare_L");		// ������L
	// �����񂶂�Q
	local momonja1_talk_L = ReadMotion_(momonja1, "m041_02_talk_L");		// ��bL
	local momonja1_think_L = ReadMotion_(momonja1, "m041_02_think_L");		// �l����L
	local momonja1_damage = ReadMotion_(momonja1, "m041_02_damage");		// ������с��|���1
	local momonja1_die_L = ReadMotion_(momonja1, "m041_02_die_L");			// �|���1L

// �����[�V�����ݒ�
	SetMotion_(yetas, yetas_wait_L, BLEND_N);

// ���J�����ݒ�
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");		// 240F

//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);
	// ���J�b�g�P���C�G�^�X�Ƃ����񂶂�o�`�m�`�`�`�`�`�`�`�`�`
	WaitTask(task_cam);
	
	SetAlpha_(momonja0, ALPHA_CLEAR);
	SetAlpha_(momonja1, ALPHA_CLEAR);
	
	// ���J�b�g�Q���C�G�^�X�փY�[���C���`�`�`�`�`�`�`�`�`�`�`�`
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");		// 300F
	
	//===============================================
	// *�C�G�^�X
	//�u�ق��I�@���̃C�G�^�X���܂̉��~��
	//�@�y���œ��ݍ���ł���Ƃ́@�����x�����ȁB
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_312_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	SetAlpha_(player, ALPHA_EXIST);
	SetMotion_(player, player_look_up_L, BLEND_N);					// ������ҋ@L
	DeleteTask_(task_cam);
	
	// ���J�b�g�R����l���Y�[���A�E�g�`�`�`�`�`�`�`�`�`�`�`�`�`
	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");		// 180F
	
	Wait_(5);
	//-----------------------------------------------
	// ���C�G�^�X
	//�u���̎p�́c�c���W�X�^���X�́@�����c�肩�B
	//�@�g�[�h�[�Ɂ@��������ā@�����ɗ����̂��H
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_IETASU");
	ShowMsg_("DEMO_312_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	Wait_(10);
	SetMotion_(player, player_nod02, BLEND_M);						//����
	Wait_(15);
	SetMotion_(player, player_look_up_L, BLEND_L);		
	Wait_(20);
	
	DeleteTask_(task_cam);
	
	// ���J�b�g�S���C�G�^�X�փY�[���C���`�`�`�`�`�`�`�`�`�`�`�`
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");		// 300F
	
	SetMotion_(yetas, yetas_laugh_L, BLEND_L);						// �ҋ@���΂�
	Wait_(15);
	
	//===============================================
	// ���C�G�^�X
	//�u�����@���܂������Ł@�E����������
	//�@�����̖��́@�ɂ����Ƃ����킯���c�c�B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_IETASU");
	ShowMsg_("DEMO_312_MSG_030");
	KeyInputWait_();
	
	//-----------------------------------------------
	// ��
	//�u����ȁ@�Ђ��傤�҂̌����@�a���Ȃ�
	//�@�󂯓���Ắ@����Ȃ��B
	//-----------------------------------------------
	ShowMsg_("DEMO_312_MSG_040");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	DeleteTask_(task_cam);
	SetAlpha_(player, ALPHA_CLEAR);
	SetAlpha_(momonja0, ALPHA_EXIST);
	SetAlpha_(momonja1, ALPHA_EXIST);
	
	// ���J�b�g�T���C�G�^�X�Ƃ����񂶂�`�`�`�`�`�`�`�`�`�`�`�`
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");
	
	SetMotion_(momonja1, MOT_WALK, BLEND_M);
	task_momonja1 = Task_RotateToDir_(momonja1, -90, ROTATE_DEMO_DEF);
	WaitTask(task_momonja1);
	SetMotion_(momonja1, momonja1_talk_L, BLEND_L);					// ��bL
	
	//===============================================
	// *�C�G�^�X����
	//�u�������@�C�G�^�X���܁B���܂�����������
	//�@�g�[�h�[���@�a�����@�������肤�ł��傤���H
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_312_MSG_050");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	// ���J�b�g�U�������񂶂�Y�[���A�E�g�`�`�`�`�`�`�`�`�`�`�`
	task_cam = Task_AnimeMoveCamera_("anmeye003", "anmtgt003");		// 180F
	
	SetMotion_(momonja1, momonja1_think_L, BLEND_L);				// �l����L
	
	Wait_(5);
	//-----------------------------------------------
	//�u��X�́@���������ā@�����d���
	//�@�J���Ⴂ���@���Ă���̂ł́c�c�H
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_312_MSG_060");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	DeleteTask_(task_cam);
	SetAlpha_(momonja0, ALPHA_CLEAR);
	SetAlpha_(momonja1, ALPHA_CLEAR);
	
	StopBgm_(BGM_STOP_DEF);
	
	// ���J�b�g�V���C�G�^�X�U���`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`
	task_cam = Task_AnimeMoveCamera_("anmeye004", "anmtgt004");								// 80F
	StopBgm_(30);
	efc_cam = SetCameraEffect_("ef733_02_sym_black_mist01", 100);							// ������
	
	SetMotion_(yetas, yetas_scowl, BLEND_M);												// �΂����ɂ��
	PlaySE_("SE_DEM_109");
	WaitMotion(yetas);																		// 30F
	Wait_(15);
	
	SetMotion_(yetas, yetas_attack, BLEND_XL);
	PlaySE_("SE_DEM_110");
	task_yetas = Task_RotateToDir_(yetas, 45, ROTATE_DEMO_DEF);
	efc_yetas = SetBoneEffect_("ef831_01_atc_yetas", yetas);
	Wait_(20);
	DeleteEffect_(efc_cam);
	
	efc_cam = SetCameraEffect_("ef733_01_sym_shuchusen01", CAMERA_DEF);						// �W����
	WaitMotion(yetas);
	
	DeleteEffect_(efc_cam);
	DeleteTask_(task_cam);
	SetAlpha_(momonja1, ALPHA_EXIST);
	task_momonja1 = Task_AnimeMoveNoDir_(momonja1, "anm_momonja100");
	SetMotion_(momonja1, momonja1_damage, BLEND_N);											// ������с��|���1
	efc_momonja1 = SetBoneEffect_("ef831_02_line_effect", momonja1);
	
	// ���J�b�g�W�������񂶂�A����`�`�`�`�`�`�`�`�`�`�`�`�`
	task_cam = Task_AnimeMoveCamera_("anmeye007", "anmtgt007");								// 30F
	SetMeshVisible_(momonja1, "Model1", true);												// �����񂶂�̖ڂ��~�ɂȂ�
	PlaySE_("SE_DEM_111");
	WaitTask(task_cam);
	
	DeleteEffect_(efc_momonja1);
	StartEarthQuake_(15, 3, 0.5);
	PlaySE_("SE_FLD_107");																	// �ǂɂԂ���
	WaitMotion(momonja1);
	SetMotion_(momonja1, momonja1_die_L, BLEND_N);											// �|���1L
	
	efc_momonja1 = SetPointWorldEffect_("ef712_19_emo_confusion01", "efc_momo000");			// ����ef ���ʒu����������̂�Blender�Ŕz�u
	SetEffectScale_(efc_momonja1, 0.05);
	Wait_(30);
	
	DeleteTask_(task_yetas);
	SetAlpha_(player, ALPHA_EXIST);
	SetAlpha_(yetas, ALPHA_CLEAR);
	
	// ���J�b�g�X����l�������`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`
	SetPointCameraEye_("cameye002");
	SetPointCameraTarget_("camtgt002");
	
	PlaySE_("SE_DEM_053");
	efc_player = SetSelectBoneEffectSetOffset_("ef712_10_emo_surprise01", player, ATTACH_EFFECT1, Vec3(0.0, 0.5, 1.0));
	SetEffectScale_(efc_player, 0.7);
	SetMotion_(player, pl_surprise, BLEND_M);				// ����
	WaitMotion(player);
	SetMotion_(player, pl_surprise_L, BLEND_M);				// ����L
	Wait_(30);
	
	SetAlpha_(momonja0, ALPHA_EXIST);
	SetDir_(momonja0, 75);
	SetMotion_(momonja0, momonja0_scare_L, BLEND_N);		// ������L
	efc_momonja0 = SetSelectBoneEffectSetOffset_("ef712_13_emo_sweat01", momonja0, ATTACH_EFFECT1, effect_pos);		// ��
	SetEffectScale_(efc_momonja0, 3.0);
	
	// ���J�b�g10�������񂶂�����`�`�`�`�`�`�`�`�`�`�`�`�`�`�`
	SetPointCameraEye_("cameye003");
	SetPointCameraTarget_("camtgt003");
	
	Wait_(45);
	SetPointPos_(momonja0, "npc_momonja001");
	SetAlpha_(yetas, ALPHA_EXIST);
	
	// ���J�b�g11���C�G�^�X�փY�[���C���`�`�`�`�`�`�`�`�`�`�`�`
	task_cam = Task_AnimeMoveCamera_("anmeye005", "anmtgt005");		// 210F
	
	SetMotion_(yetas, MOT_WALK, BLEND_N);
	task_yetas = Task_RotateToDir_(yetas, -18, ROTATE_DEMO_DEF/2);
	WaitTask(task_yetas);
	
	SetMotion_(player, player_battle_L, BLEND_XL);					// �퓬�ҋ@L
	SetMotion_(yetas, yetas_talk_L, BLEND_M);						// ��bL
	
	//===============================================
	// ���C�G�^�X
	//�u��؂Ȃ̂́@��]���@��ɓ���邱�Ƃ��B
	//�@�a���Ȃǁ@�K�v�Ȃ��c�c���Ă΂����B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_IETASU");
	ShowMsg_("DEMO_312_MSG_070");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	DeleteTask_(task_cam);
	
	// ���J�b�g12���C�G�^�X�փY�[���C���`�`�`�`�`�`�`�`�`�`�`�`
	task_cam = Task_AnimeMoveCamera_("anmeye006", "anmtgt006");		// 250F
	
	Wait_(5);
	//-----------------------------------------------
	//�u�M�l�́@�����Ŏn�����悤���Ɓ@�v������
	//�@�C���ς�����c�c�������Ă�낤�B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_IETASU");
	ShowMsg_("DEMO_312_MSG_080");
	KeyInputWait_();
	
	//-----------------------------------------------
	// ��
	//�u�A���ā@�g�[�h�[�ɓ`����@���W�X�^���X�B
	//�@������ā@�҂��Ă���c�c�ƂȁB
	//-----------------------------------------------
	ShowMsg_("DEMO_312_MSG_090");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	EndDemo(FADE_COLOR_BLACK);
}
