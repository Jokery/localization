//=============================================
//
//		demo020[�{�[�V���b�N�폟��] 
//
//=============================================

function Update()
{
// ���ϐ���`
	local task_cam, task_player;
	local efc_bor000, efc_bor001, efc_nocho000, efc_nocho100, efc_nocho200, efc_nocho300;
	
// �����\�[�X�Ǎ�
	local model_cage = ReadGimmick_("o_H00_03");
	
	local player = GetPlayerId_();
	local model_bor = ReadNpc_("m207_00");		// �{�[�V���b�N
	local model_king = ReadNpc_("n003");		// �L���O
	local model_nochoman = ReadNpc_("n000");	// �m�`���[����
	local model_nochogirl = ReadNpc_("n004");	// �m�`���[����
	
	LoadEffect_("ef741_01_div_nor_death");
	LoadEffect_("ef721_03_nat_smoke_n03");
	LoadEffect_("ef712_04_emo_joy01");

// ���z�u
	local cage = ArrangePointGimmick_("o_H00_03", model_cage, "obj_cage000");
	
	SetPointPos_(player, "player000");
	SetFace_(player, "Face_eyes_close");
	SetDir_(player, 290);

	local bor = ArrangePointNpc_(model_bor, "npc_bor000");
	SetScaleSilhouette(bor, SCALE.M, SILHOUETTE_WIDTH.M);
	SetDir_(bor, 100);
		
	local king = ArrangePointNpc_(model_king, "npc_king000");
	SetDir_(king, 290);
	
	local nocho000 = ArrangePointNpc_(model_nochoman, "npc_nocho000");
	SetDir_(nocho000, 260);
	
	local nocho100 = ArrangePointNpc_(model_nochoman, "npc_nocho100");
	SetDir_(nocho100, 310);
	
	local nocho200 = ArrangePointNpc_(model_nochogirl, "npc_nocho200");
	SetDir_(nocho200, 260);
	
	local nocho300 = ArrangePointNpc_(model_nochogirl, "npc_nocho300");
	SetDir_(nocho300, 310);

// ����풓���[�V�����Ǎ�
	local player_battle_L = ReadMotion_(player, "Player_battle_L");	// �퓬�ҋ@
	local player_talk = ReadMotion_(player, "Player_talk");			// ��l���b��
	local player_talk_L = ReadMotion_(player, "Player_talk_L");		// ��l���b��L
	local nocho000_jump_L = ReadMotion_(nocho000, "n000_jump_L");	// �m�`���[����ђ���
	local nocho100_jump_L = ReadMotion_(nocho100, "n000_jump_L");	// �m�`���[����ђ���
	local nocho200_jump_L = ReadMotion_(nocho200, "n000_jump_L");	// �m�`���[����ђ���
	local nocho300_jump_L = ReadMotion_(nocho300, "n000_jump_L");	// �m�`���[����ђ���
	local bor_down_L = ReadMotion_(bor, "m202_00_downL");			// �{�[�V���b�N�G�t��
	local bor_death = ReadMotion_(bor, "m202_00_death");			// �{�[�V���b�N�G�t�������S
	local king_talk_L = ReadMotion_(king, "n003_talk_L");			// �L���O��b
	local king_stick_up = ReadMotion_(king, "n003_stick_up");		// �L���O�ҋ@����f��
	local king_stick_up_L = ReadMotion_(king, "n003_stick_up_L");	// �L���O��f��
	local king_think = ReadMotion_(king, "n003_think");				// �L���O�ʏ�ҋ@���l����
	local king_think_L = ReadMotion_(king, "n003_think_L");			// �L���O�l����L
	local king_nod = ReadMotion_(king, "n003_nod");					// �L���O���ȂÂ�

// ���������[�V����
	SetMotion_(player, player_battle_L, BLEND_N);
	SetMotion_(bor, bor_down_L, BLEND_N);
	SetMotion_(king, MOT_WAIT, BLEND_N);
	SetMotion_(nocho000, nocho000_jump_L, BLEND_N);
	SetMotion_(nocho100, nocho100_jump_L, BLEND_N);
	SetMotion_(nocho200, nocho200_jump_L, BLEND_N);
	SetMotion_(nocho300, nocho300_jump_L, BLEND_N);
	
	efc_nocho000 = SetSelectBoneEffect_("ef712_04_emo_joy01", nocho000, ATTACH_EFFECT2);
	efc_nocho100 = SetSelectBoneEffect_("ef712_04_emo_joy01", nocho100, ATTACH_EFFECT2);
	efc_nocho200 = SetSelectBoneEffect_("ef712_04_emo_joy01", nocho200, ATTACH_EFFECT2);
	efc_nocho300 = SetSelectBoneEffect_("ef712_04_emo_joy01", nocho300, ATTACH_EFFECT2);

// ���J�����ݒ�
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");
	
//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------
	
	StartDemo(FADE_COLOR_BLACK);
	
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_BORSHOCK");
	//�{�[�V���b�N�u�u�Ȃ�Ă������@���ꂿ�܂����ׁc�c�B
	ShowMsg_("DEMO_020_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	
	SetMotion_(bor, bor_death, BLEND_M);
	
	PlaySE_("SE_DEM_015");
	
	Wait_(45);
	
	efc_bor000 = SetSelectBoneEffect_("ef721_03_nat_smoke_n03", bor, ATTACH_GLOBAL);
	SetEffectScale_(efc_bor000, 3.0);

	StartDecayEarthQuake_(25, 4, 2)

	Wait_(35);	
	
	efc_bor001 = SetSelectBoneEffect_("ef741_01_div_nor_death", bor, ATTACH_GLOBAL);
	SetEffectScale_(efc_bor001, 3.0);

	PlaySE_("SE_DEM_010");
	
	SetAlpha_(bor, 0.9);
	Wait_(2);
	SetAlpha_(bor, 0.8);
	Wait_(2);
	SetAlpha_(bor, 0.7);
	Wait_(2);
	SetAlpha_(bor, 0.6);
	Wait_(2);
	SetAlpha_(bor, 0.5);
	Wait_(2);
	SetAlpha_(bor, 0.4);
	Wait_(2);
	SetAlpha_(bor, 0.3);
	Wait_(2);
	SetAlpha_(bor, 0.2);
	Wait_(2);
	SetAlpha_(bor, 0.1);
	Wait_(2);
	SetAlpha_(bor, 0.0);
	
	Wait_(30);	

	PlayBgm_("BGM_012");
	
	//��������������������������������������
	//���J�b�g2
	//��������������������������������������
	SetAlpha_(player, ALPHA_CLEAR);			// ��l����\��
	
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");	
	WaitTask(task_cam);
	DeleteTask_(task_cam);

	SetMotion_(king, king_talk_L, BLEND_XL);
	
	OpenMsgWnd_();
	//�L���O�u�E���ȐN��B�悭���@�����~���Ă��ꂽ�B
	ShowMsg_("DEMO_020_MSG_020");
	KeyInputWait_();
	SetTalkName_("NAME_TAG_KING");
	//�L���O�u�����𑀂�@�키�@���̎p�c�c
	ShowMsg_("DEMO_020_MSG_030");
	KeyInputWait_();
	CloseMsgWnd_();
	
	SetMotion_(nocho000, MOT_WAIT, BLEND_M);
	DeleteEffect_(efc_nocho000);	
	Wait_(2);	
	SetMotion_(nocho100, MOT_WAIT, BLEND_M);
	DeleteEffect_(efc_nocho100);	
	Wait_(2);	
	SetMotion_(nocho200, MOT_WAIT, BLEND_M);
	DeleteEffect_(efc_nocho200);	
	Wait_(2);
	SetMotion_(nocho300, MOT_WAIT, BLEND_M);
	DeleteEffect_(efc_nocho300);	
	Wait_(2);	
	
	//��������������������������������������
	//���J�b�g3
	//��������������������������������������
	SetAlpha_(player, ALPHA_EXIST);			// ��l���\��
	
	SetDirToObject_(player, king);	

	SetMotion_(player, MOT_WALK, BLEND_M);	// ��l������
	
	SetPointPos_(player, "player001");
	
	task_player = Task_MoveForward_(player, 1.0, false);

	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");
	SetMotion_(king, MOT_WAIT, BLEND_XL);	// �L���O�ҋ@
	
	Wait_(75);
	
	SetMotion_(king, king_talk_L, BLEND_L);	// �L���O��b
	
	OpenMsgWnd_();		
	SetTalkName_("NAME_TAG_KING");
	//�L���O�u�������@���̏o�ŗ����c�{�[�V���b�N�̌����ʂ�	
	ShowMsg_("DEMO_020_MSG_040");
	
	DeleteTask_(task_player);
	SetMotion_(player, MOT_WAIT, BLEND_M);	// ��l���ҋ@

	KeyInputWait_();
	CloseMsgWnd_();
	
	SetMotion_(king, MOT_WAIT, BLEND_XL);	// �L���O�ҋ@	
	
	SetMotion_(player, player_talk, BLEND_M);	// ��l������
	WaitMotion(player);
	SetMotion_(player, player_talk_L, BLEND_L);
	
	Wait_(70);

	//��������������������������������������
	//���J�b�g4
	//��������������������������������������
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");
	
	SetMotion_(player, MOT_WAIT, BLEND_L);
	
	SetMotion_(king, king_think, BLEND_M);
	WaitMotion(king);
	SetMotion_(king, king_think_L, BLEND_M);
	
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_KING");
	//�L���O�u�c�c�ق��B���W�X�^���X���@�m��ʂƂȁH
	ShowMsg_("DEMO_020_MSG_050");
	KeyInputWait_();
	//�L���O�u�Ȃ�قǁc�c�������L�����@���߂�����
	ShowMsg_("DEMO_020_MSG_060");
	KeyInputWait_();
	CloseMsgWnd_();

	SetMotion_(king, king_nod, BLEND_L);
	WaitMotion(king);
	SetMotion_(king, king_talk_L, BLEND_L);

	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_KING");
	//�L���O�u�c�c�悩�낤�B�����Ă��ꂽ�@��������B
	ShowMsg_("DEMO_020_MSG_070");
	KeyInputWait_();
	//�L���O�u�E�b�h�p�[�N�֗��邪�悢�B
	ShowMsg_("DEMO_020_MSG_080");
	KeyInputWait_();
	//�L���O�u�����X�^�[�}�X�^�[�ł���@������
	ShowMsg_("DEMO_020_MSG_090");	
	
	Wait_(15);
	SetMotion_(king, king_stick_up, BLEND_M);
	WaitMotion(king);
	SetMotion_(king, king_stick_up_L, BLEND_M);
	
	KeyInputWait_();
	CloseMsgWnd_();
	
	DeleteTask_(task_cam);
	
	//��������������������������������������
	//���f���I��
	//��������������������������������������
	
	EndDemo(FADE_COLOR_BLACK);
	
}