//===================== C00_01�R�A �Q�w�ځi�v�[���G���A�j ====================

// �O���[�o���ϐ���`
main_num	 <- C_NONE_ID;
core_num	 <- C_NONE_ID;

core_num_sub <- "NUM_SCENARIO_SUB_CORE";

//------------------------------------------------
//		�퓬�I����
//------------------------------------------------
function AfterBattle()
{
	// �O���[�o���ϐ�
	main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");		// Num0
	core_num	 = GetNumFlg_("NUM_SCENARIO_SUB_CORE");	// Num8
	
	//���[�J���ϐ�
	local kuragon_battle = GetEventFlg_("BFG_BATTLE_BAD_KRAGON");	// Bit_1308 ���N���[�S���Ɛ�������ǂ���
	local kuragon_win	 = GetEventFlg_("BFG_WIN_BAD_KRAGON");		// Bit_1309 ���N���[�S���ɏ��������ǂ���
	local player		 = GetPlayerId_();
	
	// ���N���[�S���Ƃ̐퓬����
	if(kuragon_battle == true){
		// ����
		if(GetBattleEndType_() == END_TYPE_WIN){
			// ���N���[�S���ɏ������t���O�𗧂Ă�
			SetEventFlg_("BFG_WIN_BAD_KRAGON", true);
		}
		// �s�k
		else{
			// ���N���[�S���Ɛ�����t���O���~�낷
			SetEventFlg_("BFG_BATTLE_BAD_KRAGON", false);
			// �퓬�O�ɐݒ肵���v���C���[�̔�\��������
			SetVisible(player, true);
		}
	}
	
	
	EventEnd_();
}


//------------------------------------------------
//		�}�b�v�ɓ���O
//------------------------------------------------
function BeforeInitMap()
{
	// �O���[�o���ϐ�
	main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");		// Num0
	core_num	 = GetNumFlg_("NUM_SCENARIO_SUB_CORE");	// Num8
	
	
	// �R�A�V�i���I����̃V�i���I�ł̓M�~�b�N�z�u���s��Ȃ��悤�ɂ���
	if(main_num > GetFlagID_("CONST_SM_CORE")){
		SetEventFlg_("BFG_WIN_BAD_KRAGON", true);	// ���N���[�S���ɏ�����
	}
	
	// ���ʂɃ}�b�v�ɓ����Ă������͓G�̔z�u���s��
	SetEventFlg_("BFG_C00_01_IN_UP_LAYER", true);		// �R�A�Q�w�ڂ̏�w�ɂ���Ƃ�true,���w�ɂ���Ƃ�false�ɂȂ�t���O
	SetEventFlg_("BFG_C00_01_IN_DOWN_LAYER", false);	// �R�A�Q�w�ڂ̏�w�ɂ���Ƃ�false,���w�ɂ���Ƃ�true�ɂȂ�t���O
	
	EventEnd_();
}


//------------------------------------------------
//		�t�F�[�h�A�E�g��
//------------------------------------------------
function FadeIn()
{
	// �O���[�o���ϐ�
	main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");		// Num0
	core_num	 = GetNumFlg_("NUM_SCENARIO_SUB_CORE");	// Num8
	
	//���[�J���ϐ�
	local kuragon_battle = GetEventFlg_("BFG_BATTLE_BAD_KRAGON");	// Bit_1308 ���N���[�S���Ɛ�������ǂ���
	local kuragon_win	 = GetEventFlg_("BFG_WIN_BAD_KRAGON");		// Bit_1309 ���N���[�S���ɏ��������ǂ���
	local player		 = GetPlayerId_();
	
	DebugPrint(" ");
	DebugPrint("NUM_SCENARIO_MAIN �̒l�� " + main_num + " �ɂȂ�܂����B");
	DebugPrint("NUM_SCENARIO_SUB_CORE �̒l�� " + core_num + " �ɂȂ�܂����B");

	// �\�V�i���I�N���A��ɏo�����郂���X�^�[��ω�������(Redmine#1617)
	if(main_num >= GetFlagID_("CONST_SM_INSIDE_CLEAR")
	|| GetEventFlg_("BFG_SCENARIO_CLEAR_ALL") == true){
		SetEventFlg_("BFG_CHANGE_ENCOUNT_MONSTER_BEFORE", false);
		SetEventFlg_("BFG_CHANGE_ENCOUNT_MONSTER_AFTER", true);
	}
	else{
		SetEventFlg_("BFG_CHANGE_ENCOUNT_MONSTER_BEFORE", true);
		SetEventFlg_("BFG_CHANGE_ENCOUNT_MONSTER_AFTER", false);
	}

	//----------
	// ��NPC�z�u
	//----------
	// ID������
	g_kuragon		 <- C_NONE_ID;
	
	// �����N���[�S��
	if(kuragon_win == false){
		g_kuragon = ReadAndArrangePointNpc("m194_01",  "npc_kuragon");	// ���N���[�S��
		SetScaleSilhouette(g_kuragon, SCALE.M, SILHOUETTE_WIDTH.M);		// �T�C�Y�̐ݒ�
		SetTalkEnable_(g_kuragon, false);								// ��b�A�C�R����\��
		SetReactorMsg_(g_kuragon, "NPC_KURAGON_ANALYZE_010");
	}
	
	
	//-----------
	// ���n���z�u
	//-----------
	// ID������
	g_mine_kuragon	 	 <- C_NONE_ID;
	g_mine_layer_01_a	 <- C_NONE_ID;
	g_mine_layer_01_b	 <- C_NONE_ID;
	g_mine_layer_02_a	 <- C_NONE_ID;
	g_mine_layer_02_b	 <- C_NONE_ID;
	
	// �����N���[�S���Ƃ̐퓬�p�n��
	if(kuragon_win == false){
		g_mine_kuragon = SetPointBoxEventMine_("mine_kuragon", false);
	}
	
	// ���v���C���[���ǂ̊K�w�ɂ���̂��𒲂ׂ�n��
	g_mine_layer_01_a = SetPointBoxEventMineNoFallWait_("mine_layer_01_a");
	g_mine_layer_01_b = SetPointBoxEventMineNoFallWait_("mine_layer_01_b");
	g_mine_layer_02_a = SetPointBoxEventMineNoFallWait_("mine_layer_02_a");
	g_mine_layer_02_b = SetPointBoxEventMineNoFallWait_("mine_layer_02_b");
	SetMinePlayerStop_(g_mine_layer_01_a, false);
	SetMinePlayerStop_(g_mine_layer_01_b, false);
	SetMinePlayerStop_(g_mine_layer_02_a, false);
	SetMinePlayerStop_(g_mine_layer_02_b, false);
	
	
	
	//---------------
	// ���M�~�b�N�z�u
	//---------------
	
	// �z�u�Ȃ�
	
	
	
	//---------------------
	// �����A�N�^�[�|�C���g
	//---------------------
	// ���R�[���h�X���[�v
	local rec_point_trap01 = ArrangeMsgReactorPoint("rec_trap_001", GetFlagID_("BFG_REACTER_POINT_116")// Bit_1615 �Z���T�[�g���b�v
		, SHORT_DIST, "REC_POINT_TRAP_010", "REC_POINT_TRAP_020");
	local rec_point_trap02 = ArrangeMsgReactorPoint("rec_trap_002", GetFlagID_("BFG_REACTER_POINT_116")// Bit_1615 �Z���T�[�g���b�v
		, SHORT_DIST, "REC_POINT_TRAP_010", "REC_POINT_TRAP_020");
	local rec_point_trap03 = ArrangeMsgReactorPoint("rec_trap_003", GetFlagID_("BFG_REACTER_POINT_116")// Bit_1615 �Z���T�[�g���b�v
		, SHORT_DIST, "REC_POINT_TRAP_010", "REC_POINT_TRAP_020");
	local rec_point_trap04 = ArrangeMsgReactorPoint("rec_trap_004", GetFlagID_("BFG_REACTER_POINT_116")// Bit_1615 �Z���T�[�g���b�v
		, SHORT_DIST, "REC_POINT_TRAP_010", "REC_POINT_TRAP_020");
	local rec_point_trap05 = ArrangeMsgReactorPoint("rec_trap_005", GetFlagID_("BFG_REACTER_POINT_116")// Bit_1615 �Z���T�[�g���b�v
		, SHORT_DIST, "REC_POINT_TRAP_010", "REC_POINT_TRAP_020");
	local rec_point_trap06 = ArrangeMsgReactorPoint("rec_trap_006", GetFlagID_("BFG_REACTER_POINT_116")// Bit_1615 �Z���T�[�g���b�v
		, SHORT_DIST, "REC_POINT_TRAP_010", "REC_POINT_TRAP_020");
	local rec_point_trap07 = ArrangeMsgReactorPoint("rec_trap_007", GetFlagID_("BFG_REACTER_POINT_116")// Bit_1615 �Z���T�[�g���b�v
		, SHORT_DIST, "REC_POINT_TRAP_010", "REC_POINT_TRAP_020");
	
	
	
	EventEnd_();
}


//------------------------------------------------
//		�t�B�[���h����J�n
//------------------------------------------------
function EventStartOperate()
{
	// �O���[�o���ϐ�
	main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");		// Num0
	core_num	 = GetNumFlg_("NUM_SCENARIO_SUB_CORE");	// Num8
	
	//���[�J���ϐ�
	local kuragon_battle = GetEventFlg_("BFG_BATTLE_BAD_KRAGON");	// Bit_1308 ���N���[�S���Ɛ�������ǂ���
	local kuragon_win	 = GetEventFlg_("BFG_WIN_BAD_KRAGON");		// Bit_1309 ���N���[�S���ɏ��������ǂ���
	local player		 = GetPlayerId_();
	
	//-----------
	// ���퓬����
	//-----------
	// �����N���[�S��
	if(kuragon_battle == true){
		// ���������ꍇ
		if(kuragon_win == true){
			SetEventFlg_("BFG_RETURN_BATTLE_FIRLD_BGM_HEAD", true);	// �t�B�[���hBGM�𓪑ł�
			SetEventFlg_("BFG_BATTLE_BAD_KRAGON", false);	// ������t���O���~�낷
			CommChangeMomentFadeOut(FADE_COLOR_BLACK)		// 1�t���ňÓ]
			SetVisible(g_kuragon, false);					// NPC��\�������Ȃ�
			DeleteEventMine_(g_mine_kuragon);				// �n���폜
			uPlayableReset(534.0, 29.3, 427.2, 55);			// �v���C�A�u���ɕ��A������
		}
		// �����������AfterBattle()���ōs���Ă���
	}
	
	
	EventEnd_();
}


//------------------------------------------------
//		�m�o�b�ڐG��
//------------------------------------------------
function TouchNpc()
{
	// �O���[�o���ϐ�
	main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");		// Num0
	core_num	 = GetNumFlg_("NUM_SCENARIO_SUB_CORE");	// Num8
	
	local target = GetTouchEventMineId_();
	
	DebugPrint("ID: " + target + " �ɐڐG [TouchEventMine]");
	
	switch (target) {
//	case  :
//		break;
	default :
		DebugPrint("WARNING : NPC_ID���s���ł� [TouchNpc]");
		break;
	}
	
	EventEnd_();
}

//------------------------------------------------
//		�n���ڐG��
//------------------------------------------------
function TouchEventMine()
{
	// �O���[�o���ϐ�
	main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");		// Num0
	core_num	 = GetNumFlg_("NUM_SCENARIO_SUB_CORE");	// Num8
	
	local target = GetTouchEventMineId_();
	
	DebugPrint("ID: " + target + " �ɐڐG [TouchEventMine]");
	
	switch (target) {
	case g_mine_kuragon :
		uMineKuragonBattle();	// ���N���[�S���Ƃ̐퓬�n��
		break;
	case g_mine_layer_01_a :	// ��w�Ƀ����X�^�[��z�u����n��(����)
	case g_mine_layer_02_a :	// ��w�Ƀ����X�^�[��z�u����n��(����)
		uMineUpperLayer();
		break;
	case g_mine_layer_01_b :	// ���w�Ƀ����X�^�[��z�u����n��(����)
	case g_mine_layer_02_b :	// ���w�Ƀ����X�^�[��z�u����n��(����)
		uMineUnderLayer();
		break;
	default :
		DebugPrint("WARNING : MINE_ID���s���ł� [TouchEventMine]");
		break;
	}
	
	EventEnd_();
}


//------------------------------------------------
//		���A�N�^�[�N����
//------------------------------------------------
function ReactorOn()
{
	/*
		�����Ȃ�
	*/
	
	EventEnd_();
}


//------------------------------------------------
//		���A�N�^�[�Œ��ׂ���
//------------------------------------------------
function ReactorAnalyze()
{
	/*
		�����Ȃ�
	*/
	
	EventEnd_();
}


//------------------------------------------------
//		���A�N�^�[�I����
//------------------------------------------------
function ReactorOff()
{
	/*
		�����Ȃ�
	*/
	
	EventEnd_();
}



//=========================================================================================================
//									�������������牺�̓��[�J���֐�������
//=========================================================================================================

//++++++++++++++++++++++++++++++++++++++++++++++++
//		��w�Ƀ����X�^�[��z�u����n��
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineUpperLayer()
{
	// ��w�ɋ����鎞�ɗ��Ă�t���O
	SetEventFlg_("BFG_C00_01_IN_UP_LAYER", true);	// �R�A�Q�w�ڂ̏�w�ɂ���Ƃ�true,���w�ɂ���Ƃ�false�ɂȂ�t���O
	SetEventFlg_("BFG_C00_01_IN_DOWN_LAYER", false);// �R�A�Q�w�ڂ̏�w�ɂ���Ƃ�false,���w�ɂ���Ƃ�true�ɂȂ�t���O
	// �m�F�p
	local upper_flg = GetEventFlg_("BFG_C00_01_IN_UP_LAYER");
	local under_flg = GetEventFlg_("BFG_C00_01_IN_DOWN_LAYER");
	DebugPrint("��w�ɂ���t���O�� " + upper_flg + " �ɂȂ�܂����B");
	DebugPrint("���w�ɂ���t���O�� " + under_flg + " �ɂȂ�܂����B");
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		���w�Ƀ����X�^�[��z�u����n��
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineUnderLayer()
{
	// ���w�ɋ����鎞�ɗ��Ă�t���O
	SetEventFlg_("BFG_C00_01_IN_UP_LAYER", false);	// �R�A�Q�w�ڂ̏�w�ɂ���Ƃ�true,���w�ɂ���Ƃ�false�ɂȂ�t���O
	SetEventFlg_("BFG_C00_01_IN_DOWN_LAYER", true);	// �R�A�Q�w�ڂ̏�w�ɂ���Ƃ�false,���w�ɂ���Ƃ�true�ɂȂ�t���O
	// �m�F�p
	local upper_flg = GetEventFlg_("BFG_C00_01_IN_UP_LAYER");
	local under_flg = GetEventFlg_("BFG_C00_01_IN_DOWN_LAYER");
	DebugPrint("��w�ɂ���t���O�� " + upper_flg + " �ɂȂ�܂����B");
	DebugPrint("���w�ɂ���t���O�� " + under_flg + " �ɂȂ�܂����B");
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		���N���[�S���Ƃ̐퓬�p�n���ɐG�ꂽ��
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineKuragonBattle()
{
	// �O���[�o���ϐ�
	main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");		// Num0
	core_num	 = GetNumFlg_("NUM_SCENARIO_SUB_CORE");	// Num8
	
	// ���[�J���ϐ�
	local player = GetPlayerId_();
	
	
	// �n���폜
	DeleteEventMine_(g_mine_kuragon);
	
	// �N���[�S���Ɛ�����t���O
	SetEventFlg_("BFG_BATTLE_BAD_KRAGON", true);
	
	// �t�F�[�h�A�E�g
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
	SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
	WaitFade_();
	Wait_(10);
	
	// ��l��������
	SetVisible(player, false);
	
	//�J������ݒu
	SetPointCameraEye_("cameye_001");
	SetPointCameraTarget_("camtgt_001");
	Wait_(10);
	
	// �t�F�[�h�C��
	SetFade_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
	WaitFade_();
	Wait_(10);
	
	// ���N���[�S���̃��b�Z�[�W
	OpenMsgWnd_();
	ShowMsg_("NPC_KURAGON_010");						//�u�O�M���c�������������I�I
	KeyInputWait_();
	CloseMsgWnd_();
	
	// ���N���[�S���̃��[�V�����Đ�
	PlaySE_("SE_FLD_072");
	SetMotion_(g_kuragon, MOT_SPELL_START, BLEND_M);
	Wait_(20);
	SetMotion_(g_kuragon, MOT_SPELL_CHARGE, BLEND_M);
	Wait_(10);
	SetMotion_(g_kuragon, MOT_SPELL_ACTUATE, BLEND_M);
	Wait_(40);
	
	// ���N���[�S���Ɛ퓬
	ChangeBattleParty_(165);
	
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		�v���C���[���w��̈ʒu�ɕ��A������
//------------------------------------------------
//	����	: xpos	X���W
//			: ypos	Y���W
//			: zpos	Z���W
//			: dir	��]�l
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uPlayableReset(xpos, ypos, zpos, dir)
{
	local player;
	player = GetPlayerId_();	// �v���C���[ID�擾
	
	SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
	WaitFade_();
	
	SetVisible(player, true);
	SetPos_(player, Vec3(xpos, ypos, zpos));
	SetDir_(player, dir);
	
	SetPlayableCamera_();
	SetCameraDir_(dir);
	Wait_(10);
	
	SetFade_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
	SetFadeSub_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);// ����ʂ��t�F�[�h�C��
	WaitFade_();
}















