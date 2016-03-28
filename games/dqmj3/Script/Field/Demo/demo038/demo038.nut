//=============================================
//
//		demo038[���ꊮ��]
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
	local task_cam, task_player, task_ace, task_queen, task_jack, task_king;
	local efc_maruta;
	local abare_kind = 157;			// �푰�h�c:���΂ꂤ���ǂ�

// �����f���Ǎ�
	// �L�����N�^�[
	local player = GetPlayerId_();					// ��l��
	local model_abare = ReadNpc_("m051_00");		// ���΂ꂤ���ǂ�
	local model_nocho = ReadNpc_("n000");			// ��ʃm�`���[��
	local model_jack = ReadNpc_("n001");			// �W���b�N
	local model_ace = ReadNpc_("n002");				// �G�[�X
	local model_king = ReadNpc_("n003");			// �L���O
	local model_queen = ReadNpc_("n005");			// �N�C�[��
	local model_rin = ReadNpc_("n043");				// �m�`������

	// �M�~�b�N
	local model_maruta000 = ReadGimmick_("o_H00_04");// �ۑ��i�|���O�j
	local model_maruta100 = ReadGimmick_("o_H00_05");// �ۑ��i�|�ꂽ��j
	local model_throne = ReadGimmick_("o_com_05");	// �ʍ�
	// �G�t�F�N�g
	LoadEffect_("ef721_03_nat_smoke_n03");			// ��03

// ���z�u
	// �ۑ�
	local maruta000 = ArrangePointGimmick_("o_H00_04", model_maruta000, "obj_maruta000");
	local maruta100 = ArrangePointGimmick_("o_H00_05", model_maruta100, "obj_maruta100");
	SetVisible(maruta100, false);
	// �ʍ�
	local throne = ArrangePointGimmick_("o_com_05", model_throne, "obj_throne");
	
	// ��l��
	SetPointPos_(player, "npc_abare001");
	// �W���b�N
	local jack = ArrangePointNpc_(model_jack, "npc_jack000");
	// �G�[�X
	local ace = ArrangePointNpc_(model_ace, "npc_ace000");
	// �L���O
	local king = ArrangePointNpc_(model_king, "npc_king000");
	// �N�C�[��
	local queen = ArrangePointNpc_(model_queen, "npc_queen000");
	// ������P
	local mob1 = ArrangePointNpc_(model_nocho, "npc_mob1");
	// ������P
	local mob2 = ArrangePointNpc_(model_nocho, "npc_mob2");
	// ������P
	local mob3 = ArrangePointNpc_(model_nocho, "npc_mob3");
	// �m�`������
	local mob4 = ArrangePointNpc_(model_rin, "npc_mob4");
	
	SetDirToPlayer_(jack);
	SetDirToPlayer_(ace);
	SetDirToPlayer_(king);
	SetDirToPlayer_(queen);
	SetDirToPlayer_(mob1);
	SetDirToPlayer_(mob2);
	SetDirToPlayer_(mob3);
	SetDirToPlayer_(mob4);

// ����풓���[�V�����Ǎ�
	// �W���b�N
	local jack_rejoice_L = ReadMotion_(jack, "n001_rejoice_L");					// �W�����v�i��сjL
	// �L���O
	local king_look_left = ReadMotion_(king, "n003_look_bldg");					// �ҋ@���Z���^�[�r��������
	local king_look_left_L = ReadMotion_(king, "n003_look_bldg_L");				// �Z���^�[�r��������L

// ���J�����ݒ�
	ReadWaitingLod("cameye000", "camtgt000");

	SetVisible(maruta000, false);
	SetVisible(maruta100, true);
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");
	
	Wait_(5);
	
	StartEarthQuake_(45, 3, 0.8);
	efc_maruta = SetPointWorldEffect_("ef721_03_nat_smoke_n03", "efc_maruta000");	// ��03
	PlaySE_("SE_DEM_031");															//��SE�F�ۑ�������

//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);
	
	// ���J�����P�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`
	Wait_(15);
	
	SetMotion_(jack, jack_rejoice_L, BLEND_M);			// �W�����v�i��сjL
	
	//===============================================
	// ���W���b�N
	// �u���܂������I�@�L���O��@
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_JACK");
	ShowMsg_("DEMO_038_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetMotion_(king, king_look_left, BLEND_L);								// �ҋ@���Z���^�[�r��������
	task_king = Task_ChangeMotion_(king, king_look_left_L, BLEND_M);		// �Z���^�[�r��������LOOP
	Wait_(30);
	
	//===============================================
	// ���L���O
	// �u���ށI�@�ł́@�]������
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_KING");
	ShowMsg_("DEMO_038_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	DeleteTask_(task_king);
	SetMotion_(king, MOT_WAIT, BLEND_XL);
	
	SetMotion_(ace, MOT_WALK, BLEND_M);
	task_ace = Task_MoveForward_(ace, 1.0, false);
	Wait_(5);
	
	SetMotion_(queen, MOT_WALK, BLEND_M);
	task_queen = Task_MoveForward_(queen, 1.0, false);
	Wait_(5);
	
	SetMotion_(jack, MOT_WALK, BLEND_M);
	task_jack = Task_MoveForward_(jack, 1.0, false);
	Wait_(10);
	
	EndDemo(FADE_COLOR_BLACK);
}
