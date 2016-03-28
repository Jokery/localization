//=============================================
//
//		demo019[�{�[�V���b�N�Đ�]
//
//=============================================

function Update()
{

// ���ϐ���`
	local task_cam, task_player;
	local efc_cam, efc_bor;

// �����\�[�X�Ǎ�
	local model_cage = ReadGimmick_("o_H00_03");
	
	local player = GetPlayerId_();
	local model_bor = ReadNpc_("m207_00");			// �{�[�V���b�N
	local model_big = ReadNpc_("m048_00");			// �r�b�O�n�b�g
	local model_king = ReadNpc_("n003");			// �L���O
	local model_nochoman = ReadNpc_("n000");		// �m�`���[����
	local model_nochogirl = ReadNpc_("n004");		// �m�`���[����
	
	LoadEffect_("ef730_01_oth_dark_aura01");
	LoadEffect_("ef733_01_sym_shuchusen01");

// ���z�u
	local cage = ArrangePointGimmick_("o_H00_03", model_cage, "obj_cage000");

	SetPointPos_(player, "player000");
	SetFace_(player, "Face_eyes_close");
	SetDirToPoint_(player, "npc_bor000");
	
	local bor = ArrangePointNpc_(model_bor, "npc_bor000");
	SetScaleSilhouette(bor, SCALE.M, SILHOUETTE_WIDTH.M);
	SetDir_(bor, 291);
	
	local big000 = ArrangePointNpc_(model_big, "npc_big000");			// �r�b�O�n�b�gA
	SetScaleSilhouette(big000, SCALE.S, SILHOUETTE_WIDTH.S);
	SetDir_(big000, 290);
	
	local big100 = ArrangePointNpc_(model_big, "npc_big100");			// �r�b�O�n�b�gB
	SetScaleSilhouette(big100, SCALE.S, SILHOUETTE_WIDTH.S);
	SetDir_(big100, 290);
	
	local king = ArrangePointNpc_(model_king, "npc_king000");
	SetDir_(king, 280);
	
	local nocho000 = ArrangePointNpc_(model_nochoman, "npc_nocho000");
	SetDir_(nocho000, 260);
	
	local nocho100 = ArrangePointNpc_(model_nochoman, "npc_nocho100");
	SetDir_(nocho100, 290);
	
	local nocho200 = ArrangePointNpc_(model_nochogirl, "npc_nocho200");
	SetDir_(nocho200, 260);
	
	local nocho300 = ArrangePointNpc_(model_nochogirl, "npc_nocho300");
	SetDir_(nocho300, 290);

// ����풓���[�V�����Ǎ�
	local player_battle_L = ReadMotion_(player, "Player_battle_L");	// �퓬�ҋ@
	local bor_talk_L = ReadMotion_(bor, "m202_00_talk_L");			// �{�[�V���b�N��b
	local bor_attack = ReadMotion_(bor, "m202_00_attack");			// �{�[�V���b�N��b���P���|����
	local nocho000_shock_L = ReadMotion_(nocho000, "n000_shock_L");	// �m�`���[������
	local nocho100_shock_L = ReadMotion_(nocho100, "n000_shock_L");	// �m�`���[������
	local nocho200_shock_L = ReadMotion_(nocho200, "n000_shock_L");	// �m�`���[������
	local nocho300_shock_L = ReadMotion_(nocho300, "n000_shock_L");	// �m�`���[������
	local king_shock_L = ReadMotion_(king, "n003_shock_L");			// �L���O����

// ���������[�V����
	SetMotion_(player, MOT_RUN, 15);
	SetMotion_(bor, bor_talk_L, BLEND_N);
	SetMotion_(king, king_shock_L, BLEND_N);
	SetMotion_(nocho000, nocho000_shock_L, BLEND_N);
	SetMotion_(nocho100, nocho100_shock_L, BLEND_N);
	SetMotion_(nocho200, nocho200_shock_L, BLEND_N);
	SetMotion_(nocho300, nocho300_shock_L, BLEND_N);
	
	efc_bor = SetBoneEffect_("ef730_01_oth_dark_aura01", bor);

// ���J�����ݒ�
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");

//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------

	task_player = Task_MoveForward_(player, 1.0, true);
	
	StartDemo(FADE_COLOR_BLACK);
	
	Wait_(7);
	
	DeleteTask_(task_player);
	
	SetMotion_(player, player_battle_L, BLEND_M);
	
	Wait_(60);
	
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_BORSHOCK");
	ShowMsg_("DEMO_019_MSG_010");
	KeyInputWait_();
	ShowMsg_("DEMO_019_MSG_020");
	KeyInputWait_();
	ShowMsg_("DEMO_019_MSG_030");
	KeyInputWait_();
	CloseMsgWnd_();

	efc_cam = SetCameraEffect_("ef733_01_sym_shuchusen01", 100);
	
	SetDir_(bor, 295.5);
	
	SetMotion_(bor, bor_attack, BLEND_M);		// �퓬�J�n���[�V�������P
	PlaySE_("SE_DEM_025");						// ��SE:�{�[�V���b�N�̃��[�V����SE
	
	Wait_(10);
	
	//��������������������������������������
	//���f���I��
	//��������������������������������������
	
	EncountEndDemo(ENCOUNT_BOSS);
	
}