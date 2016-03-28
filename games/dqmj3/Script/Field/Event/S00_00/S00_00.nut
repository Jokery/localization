//===================== S00_00���S�̊č��� ====================
//---------------------------------
// ����Ԃ̗V�тŎg�p����萔
//---------------------------------
// �M�~�b�N�̋N���ƃN���A�t���O
const GIMMICK_FLG			 = "BFG_SPACE_GIMMICK_SAND";
const GIMMICK_CLEAR_FLG		 = "BFG_SPACE_GIMMICK_SAND_1ST_CLEAR";

// ��l���̕��A�ʒu�ƌ���
const XPOS_1				 = 447.366;		// ��ՃX�C�b�`�t��
const YPOS_1				 = -173.314;
const ZPOS_1				 = 1117.000;
const DIR_1					 = 144;

const XPOS_2				 = 1491.000;	// �S�[���{�X�̎�O
const YPOS_2				 = 1798.000;
const ZPOS_2				 = -831.000;
const DIR_2					 = 150;

// �[���f���Ŏg�p����J�����̃m�[�h��
const CAMERA_EYE			 = "cameye_001";
const CAMERA_TGT			 = "camtgt_001";

// ��ՃX�C�b�`���N��������ׂ̌�ID
const GIMMICK_KEY_ID		 = 905;

// ��ՃX�C�b�`���N�����������̃��b�Z�[�WID
const GIMMICK_MSG_ID		 = "MASTERS_LOAD_REACTOR_MSG_016";

// ��ՃX�C�b�`�N����̍Đ��f���i���o�[
const DEMO_NUM				 = 432;

// �{�X�����X�^�[��ID (1=����, 2=2��ڈȍ~)
const BOSS_ID_1				 = "m178_00";	// ���W�t���C���[
const BOSS_ID_2				 = "m178_00";	// ���W�t���C���[

// �{�X�����X�^�[��Exchange�pID
const BOSS_EXCHANGE_ID		 = 483;			// ���W�E�B���O

// �{�X�����X�^�[�̃X�P�[���Ɨ֊s���̐ݒ� (1=����, 2=2��ڈȍ~)
//�yN�T�C�Y�z�X�P�[��=0.6, �V���G�b�g��=0.8
//�yM�T�C�Y�z�X�P�[��=1.0, �V���G�b�g��=1.0
//�yG�T�C�Y�z�X�P�[��=2.5, �V���G�b�g��=1.0
//�yT�T�C�Y�z�X�P�[��=6.0, �V���G�b�g��=1.0
const BOSS_SCALE_1			 = 0.6;
const BOSS_SILHOUETTE_1		 = 0.8;
const BOSS_SCALE_2			 = 0.6;
const BOSS_SILHOUETTE_2		 = 0.8;

// �{�X��̓G�p�[�e�B�e�[�u�� (1=����, 2=2��ڈȍ~)
const BOSS_PARTY_TABLE_1	 = 161;
const BOSS_PARTY_TABLE_2	 = 161;

// �{�X�𒇊Ԃɂ���ۂ̃����X�^�[�p�����[�^ (1=����, 2=2��ڈȍ~)
const BOSS_PARAMETER_1		 = 1809;
const BOSS_PARAMETER_2		 = 1809;

// �{�X���Ԍ�̃}�b�v�`�F���WID
const MAP_ID				 = "S00_00";


// �ϐ���`
main_num	 <- C_NONE_ID;
prison_num	 <- C_NONE_ID;

str_num_sub	 <- "NUM_SCENARIO_SUB_PRISON";

// ���G�X�^�[�N�C�x���g�p�ϐ�
npc_B_Estark  <- C_NONE_ID;
mine_B_Estark <- C_NONE_ID;

//------------------------------------------------
//		�퓬�I����
//------------------------------------------------
function AfterBattle()
{
	main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");			// Num0
	prison_num	 = GetNumFlg_("NUM_SCENARIO_SUB_PRISON");	// Num6
	
	//---------------------------------
	// ����Ԃ̗V�уC�x���g�p�̃t���O
	//---------------------------------
	local info = {
		GIMMICK_FLG			 = GIMMICK_FLG,
	};
	
	MastersLoad_AfterBattle(info);

	//-------------------------------
	// �����G�X�^�[�N�C�x���g�p
	//-------------------------------
	// ���i�s�t���O
	local status_num = GetNumFlg_("NUM_BREAK_ESTARK_PHASE"); // NUM018
	// �퓬�̔���
	if(status_num == 3 || status_num == 6){
		local player = GetPlayerId_();
		// �[���f���ŏ�������l����������悤�ɂ���
		SetManualCalcAlpha_(player, true);
		SetAlpha_(player, 1.0);
		// �[���f���ŃJ�����𒲐������̂Ńf�t�H���g�ɖ߂��Ă���
		SetPlayableCamera_();
		// ����
		if(GetBattleEndType_() == END_TYPE_WIN){
			// �c���ĉf���Ă��鋥�G�X�^�[�N������
			SetManualCalcAlpha_(npc_B_Estark, true);
			SetAlpha_(npc_B_Estark, 0.0);
			// ���G�X�^�[�N��z�u
			local npc_B_Estark_l = ReadAndArrangePointNpc("m199_00", "e_BreakEstark_npc");
			SetTalkEnable_(npc_B_Estark_l, false);
			SetScaleSilhouette(npc_B_Estark_l, SCALE.T, SILHOUETTE_WIDTH.T);
			SetVisible(npc_B_Estark_l, true);
		}
		// �ɂ���
		else if(GetBattleEndType_() == END_TYPE_FLEE){
			// ���ɉ������Ȃ�
		}
		// ����
		else{
			// �i�s�t���O���Đ펞��
			SetNumFlg_("NUM_BREAK_ESTARK_PHASE", 4);
		}
	}

	
	EventEnd_();
}


//------------------------------------------------
//		�}�b�v�ɓ���O
//------------------------------------------------
function BeforeInitMap()
{
	// �t���O�̏�Ԃ��擾
	main_num		 = GetNumFlg_("NUM_SCENARIO_MAIN");							// Num0
	prison_num		 = GetNumFlg_("NUM_SCENARIO_SUB_PRISON");					// Num6
	local sky_num	 = GetNumFlg_("NUM_SCENARIO_SUB_SKY");						// Num9
	
	// ���C�h�����܂܈ړ����u���g���ė����烉�C�h��������
	if(GetEventFlg_("BFG_RIDE_OFF_USED_TRANSFER") == true){
		//���C�h��������
		SetRideOffStart_();
	}
	
	//-----------------------------------
	// ����Ԃ̗V�уC�x���g�p�̃t���O�ݒ�
	//-----------------------------------
	local info = {
		GIMMICK_FLG			 = GIMMICK_FLG,
		GIMMICK_CLEAR_FLG	 = GIMMICK_CLEAR_FLG,
	};
	
	MastersLoad_SetFlag(info);
	
	//-------------------------------
	// �����G�X�^�[�N�C�x���g�p
	//-------------------------------
	// ���i�s�t���O
	local status_num = GetNumFlg_("NUM_BREAK_ESTARK_PHASE"); // NUM018
	if(status_num == 2 || status_num == 5){ // NUM013 == 2 or 5
		//���C�h��������
		SetRideOffStart_();
	}
	
	
	EventEnd_();
}


//------------------------------------------------
//		�t�F�[�h�C��
//------------------------------------------------
function FadeIn()
{
	main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");			// Num0
	prison_num	 = GetNumFlg_("NUM_SCENARIO_SUB_PRISON");	// Num6
	
	DebugPrint(" ");
	DebugPrint("NUM_SCENARIO_MAIN �̒l�� " + main_num + " �ɂȂ�܂����B");
	DebugPrint("NUM_SCENARIO_SUB_PRISON �̒l�� " + prison_num + " �ɂȂ�܂����B");
	
	// ���}�b�v���B�t���O
	SetEventFlg_("BFG_ARRIVE_AT_S00", true);				// Bit_93 ���B�t���O �č����t�B�[���h�}�b�v
	// ���Z�[�u�֎~������(�Z�[�u�֎~�}�b�v����A���Ă������p)
	SetEventFlg_("BFG_SAVE_PROHIBIT", false);				// �Z�[�u�֎~(Bit451)

	// �����Ԃ̐ݒ�i�C�b�^�u�����j�܂ō����E�ȍ~�N���A�܂Ő���j
	if(main_num == GetFlagID_("CONST_SM_PRISON")){			// Num0 = 5
		if(prison_num < GetFlagID_("CONST_SS_PR_INVULNERABILITY_PLAYER")){	// Num6 < 28
			SetTime_(START_TIME_ZONE_NOON);		// ��
		} else {
			SetTime_(START_TIME_ZONE_NOON);		// ��
			SetEventFlg_("BFG_S00_00_WEATHER_FIX_BAD", false);
		}
	}
	
	//----------
	// ��NPC�z�u
	//----------
	
	// �z�u�Ȃ�
	
	//-----------
	// ���n���z�u
	//-----------
	// ID������
	g_mine_enter_transfer	 <- C_NONE_ID;
	g_mine_exit_transfer	 <- C_NONE_ID;
	g_mine_ruler			 <- C_NONE_ID;
	
	// ���]�����u�i�����̕X���j
	g_mine_enter_transfer = SetPointCircleEventMine_("mine_enter_transfer", true);
	
	// ���]�����u�i�ŔM�̉ΎR�j
	g_mine_exit_transfer = SetPointCircleEventMine_("mine_exit_transfer", true);
	
	// �����[���|�C���g(�C�b�^�u���č� �A���L��)
	g_mine_ruler = SetPointCircleEventMine_("mine_ruler", true);

	//---------------
	// ���M�~�b�N�z�u
	//---------------
	// ID������
	g_gmk_rulerpoint		 <- C_NONE_ID;
	
	// ���\�[�X�ǂݍ���
	local id_transfer		 = ReadGimmick_("o_com_01");		// �]�����u
	local id_rulerpoint		 = ReadGimmick_("o_com_08");		// ���[���|�C���g
	
	// ���]�����u�i�����̕X���j
	local gmk_enter_transfer = ArrangePointGimmick_("o_com_01", id_transfer, "gmk_enter_transfer");
	
	// ���]�����u�i�ŔM�̉ΎR�j
	local gmk_exit_transfer = ArrangePointGimmick_("o_com_01", id_transfer, "gmk_exit_transfer");
	
	// ���p�C�v�̊W�i�j
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {							// Num0 = 5
		if(prison_num < GetFlagID_("CONST_SS_PR_ITTABURU_WIN")){				// Num6 < 27
			local id_paipu_close	 = ReadGimmick_("o_S02_21");
			local gmk_paipu_close	 = ArrangePointGimmick_("o_S02_21", id_paipu_close, "gmk_paipu_close");
		}
	}

	// ���p�C�v�̊W�i�J�j
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {							// Num0 = 5
		if(prison_num > GetFlagID_("CONST_SS_PR_ITTABURU_WIN")){				// Num6 > 27
			local id_paipu_open	 = ReadGimmick_("o_S02_22");
			local gmk_paipu_open = ArrangePointGimmick_("o_S02_22", id_paipu_open, "gmk_paipu_open");
		}
	} else {
		local id_paipu_open	 = ReadGimmick_("o_S02_22");
		local gmk_paipu_open = ArrangePointGimmick_("o_S02_22", id_paipu_open, "gmk_paipu_open");
	}

	// �����[���|�C���g(�C�b�^�u���č� �A���L��)�����̈ʒu�ɒu���Ă��܂�
	g_gmk_rulerpoint = ArrangePointGimmick_("o_com_08", id_rulerpoint, "gmk_ruler");
	SetMotion_(g_gmk_rulerpoint, MOT_GIMMICK_0, BLEND_N);
	if(GetEventFlg_("BFG_RULER_ADD_018") == true){				// Bit_218 ���[���ǉ� �C�b�^�u���č� �A���L��
		SetMotion_(g_gmk_rulerpoint, MOT_GIMMICK_2, BLEND_N);
	}

	//-------------------------
	// �����A�N�^�[�|�C���g�z�u
	//-------------------------
	// ���ړ����u�i�����̕X���j
	local reactorPoint01 = ArrangeMsgReactorPoint("recPoint_01_transfer", GetFlagID_("BFG_REACTER_POINT_015")// Bit_1514 �ړ����u
		, SHORT_DIST, "REC_POINT_01", "REC_POINT_01_2");

	// ���ړ����u�i�ŔM�̉ΎR�j
	local reactorPoint02 = ArrangeMsgReactorPoint("recPoint_02_transfer", GetFlagID_("BFG_REACTER_POINT_015")// Bit_1514 �ړ����u
		, SHORT_DIST, "REC_POINT_02", "REC_POINT_02_2");

	// ���A���C�p�[�N
	local reactorPoint03 = ArrangeMsgReactorPoint("recPoint_03_park", GetFlagID_("BFG_REACTER_POINT_070")// Bit_1569 �A���C�p�[�N
		, SHORT_DIST, "REC_POINT_03", "REC_POINT_03_2");

	// ���R�A
	local reactorPoint04 = ArrangeMsgReactorPoint("recPoint_04_core", GetFlagID_("BFG_REACTER_POINT_001")// Bit_1500 �R�A
		, ENDLESS_DIST, "REC_POINT_04", "REC_POINT_04_2");
	
	// �����[���|�C���g(�C�b�^�u���č� �A���L��)
	local reactorPoint06 = ArrangeMsgReactorPoint("recPoint_ruler", GetFlagID_("BFG_REACTER_POINT_010")// Bit_1520 ���[���|�C���g
		, SHORT_DIST, "REC_POINT_06", "REC_POINT_06_2");
	
	// ���V���̒�
	local reactorPoint05 = ArrangeMsgReactorPoint("recPoint_05_keyhole", GetFlagID_("BFG_REACTER_POINT_176")
		, SHORT_DIST, "REC_POINT_07", "REC_POINT_07_2");
	
	//-----------------
	// ���}�b�v�i�r�z�u
	//-----------------
	// ���ړI�n
	local navi_park			= ArrangePointNaviMapIcon_(NAVIMAP_ICON.DESTINATION, "map_navi_park");			// �A���C�p�[�N
	local navi_ittaburu	 	= ArrangePointNaviMapIcon_(NAVIMAP_ICON.DESTINATION, "map_navi_ittaburu");		// �C�b�^�u���̊č�
	local navi_transfer	 	= ArrangePointNaviMapIcon_(NAVIMAP_ICON.DESTINATION, "map_navi_transfer");		// �ΎR�s�̈ړ����u
	SetNaviMapIconVisible_(navi_park, false);
	SetNaviMapIconVisible_(navi_ittaburu, false);
	SetNaviMapIconVisible_(navi_transfer, false);

	if (main_num == GetFlagID_("CONST_SM_PRISON")) {							// Num0 = 5
		if(prison_num < GetFlagID_("CONST_SS_PR_ITTABURU_PRISON_2ND")){			// Num6 < 7
			SetNaviMapIconVisible_(navi_park, true);
		}
		else  if(prison_num > GetFlagID_("CONST_SS_PR_LAST_ANSESU_1ST")){		// Num6 > 30
			SetNaviMapIconVisible_(navi_transfer, true);
		}
	}
	// �����[���|�C���g�A�C�R��
	if(GetEventFlg_("BFG_RULER_ADD_018") == true){				// Bit_218 ���[���ǉ� �C�b�^�u���č� �A���L��
		local ruler_icon = ArrangePointNaviMapIcon_(NAVIMAP_ICON.RULER_POINT , "gmk_ruler");
		SetNaviMapIconVisible_(ruler_icon, true);
	}

	//-----------------------------
	// ����Ԃ̗V�уC�x���g�p�̔z�u
	//-----------------------------
	// ID������
	g_keyhole			 <- C_NONE_ID;
	g_keyhole_goal_point <- C_NONE_ID;
	
	g_keyhole_npc		 <- C_NONE_ID;
	
	g_keyhole_mine		 <- C_NONE_ID;
	g_keyhole_goal_mine	 <- C_NONE_ID;
	
	local info = {
		GIMMICK_FLG			 = GIMMICK_FLG,
		GIMMICK_CLEAR_FLG	 = GIMMICK_CLEAR_FLG,
		BOSS_ID_1			 = BOSS_ID_1,
		BOSS_ID_2			 = BOSS_ID_2,
		BOSS_SCALE_1		 = BOSS_SCALE_1,
		BOSS_SILHOUETTE_1	 = BOSS_SILHOUETTE_1,
		BOSS_SCALE_2		 = BOSS_SCALE_2,
		BOSS_SILHOUETTE_2	 = BOSS_SILHOUETTE_2,
	};
	
	MastersLoad_Setting(info);
	
	//-------------------------------
	// �����G�X�^�[�N�C�x���g�p�̔z�u
	//-------------------------------
	// ���i�s�t���O
	local status_num = GetNumFlg_("NUM_BREAK_ESTARK_PHASE"); // NUM018
	// �����X�^�[�̔z�u�𐧌�����t���O�̐ؑւ�(Redmine#2783)
	if(status_num >= 1 && status_num <= 6){ // NUM018 �� 1 �` 6 �̎�(�C�x���g���̎�)
		// �C�x���g���͐�������
		SetEventFlg_("BFG_LIMIT_APPEAR_BREAK_ESTARK", false);
	}
	else{
		// �C�x���g�ȊO�͐������Ȃ�
		SetEventFlg_("BFG_LIMIT_APPEAR_BREAK_ESTARK", true);
	}
	

	// ���v���C�A�u���p��NPC�z�u
	if(status_num == 1 || status_num == 4){ // NUM018 == 1 or 4
		npc_B_Estark = ReadAndArrangePointNpc("m199_00", "e_BreakEstark_npc");
		local mot_B_Estark_Sleep = ReadMotion_(npc_B_Estark, "m199_00_sleep");
		SetMotion_(npc_B_Estark, mot_B_Estark_Sleep, BLEND_N);
		// �Q�Ă���G�t�F�N�g
		LoadEffect_("ef320_01_life_zzz");					// ZZZ
		local efc_zzz = SetSelectBoneEffect_("ef320_01_life_zzz", npc_B_Estark, ATTACH_EFFECT1);
		SetEffectScale_(efc_zzz, 6.0);
		SetTalkEnable_(npc_B_Estark, false);
		SetScaleSilhouette(npc_B_Estark, SCALE.T, SILHOUETTE_WIDTH.T);
		SetVisible(npc_B_Estark, true);
		SetReactorMsg_(npc_B_Estark, "NPC_B_ESTARK_REC"); // �A�i���C�Y���b�Z�[�W
	}
	// ���[���f���p��NPC�z�u
	else if(status_num == 2 || status_num == 5){
		npc_B_Estark = ReadAndArrangePointNpc("m199_00", "e_BreakEstark_npc");
		SetTalkEnable_(npc_B_Estark, false);
		SetScaleSilhouette(npc_B_Estark, SCALE.T, SILHOUETTE_WIDTH.T);
		SetVisible(npc_B_Estark, true);
	}

	// ���C�x���g�n��
	if(status_num == 1 || status_num == 4){
		mine_B_Estark = SetPointBoxEventMine_("e_BreakEstark_npc_mine", false);
	}

	EventEnd_();
}


//------------------------------------------------
//		�t�B�[���h����J�n
//------------------------------------------------
function EventStartOperate()
{
	main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");			// Num0
	prison_num	 = GetNumFlg_("NUM_SCENARIO_SUB_PRISON");	// Num6
	
	//-----------------------
	// ���ړ����u���g�p������
	//-----------------------
	if(GetEventFlg_("BFG_RIDE_OFF_USED_TRANSFER") == true){
		UsingTransfer();
		
		// �͂��߂č��S�č����ɗ����Ƃ�
		if (main_num == GetFlagID_("CONST_SM_PRISON")) {							// Num0 = 5
			if (prison_num == GetFlagID_("CONST_SS_PR_PRISON_START")) {				// Num6 = 0
				CommSavedAfterTransferDemo("BFG_SCENARIO_CLEAR_ICE", true);
			}
		}
		
		SetEventFlg_("BFG_RIDE_OFF_USED_TRANSFER", false);
	}

	//-----------
	// ���f���Đ�
	//-----------
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num == GetFlagID_("CONST_SS_PR_PRISON_START")) {					// Num6 = 0
			SetNumFlg_(str_num_sub, GetFlagID_("CONST_SS_PR_GO_TO_THE_PRISON"));	// Num6 <- 1
			
			// Demo400[���S�̊č����E�S�i]�Đ�
			EventStartChangeDemo(400, FADE_COLOR_BLACK);
		}
	}
	
	//-------------------------------------------
	// ����Ԃ̗V�уC�x���g�p�̃J�E���g�_�E���\��
	//-------------------------------------------
	local info = {
		GIMMICK_FLG			 = GIMMICK_FLG,
	};
	
	MastersLoad_CountDown(info);
	
	//--------------------------------
	// ����Ԃ̗V�уC�x���g�p�̐퓬����
	//--------------------------------
	local info = {
		GIMMICK_FLG			 = GIMMICK_FLG,
		GIMMICK_CLEAR_FLG	 = GIMMICK_CLEAR_FLG,
		XPOS_1				 = XPOS_1,
		YPOS_1				 = YPOS_1,
		ZPOS_1				 = ZPOS_1,
		DIR_1				 = DIR_1,
		CAMERA_EYE			 = CAMERA_EYE,
		CAMERA_TGT			 = CAMERA_TGT,
		BOSS_EXCHANGE_ID	 = BOSS_EXCHANGE_ID,
		BOSS_PARAMETER_1	 = BOSS_PARAMETER_1,
		BOSS_PARAMETER_2	 = BOSS_PARAMETER_2,
		MAP_ID				 = MAP_ID,
	};
	
	MastersLoad_BattleJudgment(info);

	//-------------------------------
	// �����G�X�^�[�N�C�x���g
	//-------------------------------
	local status_num = GetNumFlg_("NUM_BREAK_ESTARK_PHASE"); // NUM018
	// �[���f���Đ�
	if(status_num == 2 || status_num == 5){
		uPlayableDemoBreakEstark();
	}
	// �Đ펞
	else if(status_num == 4){
		// ���ɉ������Ȃ�
	}
	// ���s����
	else if(status_num == 3 || status_num == 6){
		// ����
		if(GetBattleEndType_() == END_TYPE_WIN){
			// �t�B�[���hBGM�𓪑ł�
			SetEventFlg_("BFG_RETURN_BATTLE_FIRLD_BGM_HEAD", true);
			
			// ���Ԕ���
			uCheckMateBreakEstark();
		}
		else{
			// �s�k�̓A�t�^�[�o�g���ŏ���
		}
	}

	EventEnd_();
}


//------------------------------------------------
//		�m�o�b�ڐG��
//------------------------------------------------
function TouchNpc()
{
	main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");			// Num0
	prison_num	 = GetNumFlg_("NUM_SCENARIO_SUB_PRISON");	// Num6
	
	local target = GetTargetId_();
	
	DebugPrint("ID: " + target + " �ɐڐG [TouchNpc]");
	
	/*
		�����Ȃ�
	*/
	
	EventEnd_();
}

//------------------------------------------------
//		�n���ڐG��
//------------------------------------------------
function TouchEventMine()
{
	main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");			// Num0
	prison_num	 = GetNumFlg_("NUM_SCENARIO_SUB_PRISON");	// Num6
	
	local target = GetTouchEventMineId_();
	
	DebugPrint("ID: " + target + " �ɐڐG [TouchEventMine]");
	
	switch (target) {
	case g_mine_enter_transfer :
		uMineEnterTransfer();
		break;
	case g_mine_exit_transfer :
		uMineExitTransfer();
		break;
	case g_mine_ruler :
		uMineRuler();
		break;
	// ���G�X�^�[�N�C�x���g�p
	case mine_B_Estark :
		uMineBreakEstark();
		break;
	// ��Ԃ̗V�� ��ՃX�C�b�`�𒲂ׂ���
	case g_keyhole_mine :
		local info = {
			GIMMICK_FLG			 = GIMMICK_FLG,
			GIMMICK_CLEAR_FLG	 = GIMMICK_CLEAR_FLG,
			GIMMICK_KEY_ID		 = GIMMICK_KEY_ID,
			GIMMICK_MSG_ID		 = GIMMICK_MSG_ID,
			XPOS_1				 = XPOS_1,
			YPOS_1				 = YPOS_1,
			ZPOS_1				 = ZPOS_1,
			DIR_1				 = DIR_1,
			BOSS_ID_1			 = BOSS_ID_1,
			BOSS_ID_2			 = BOSS_ID_2,
			BOSS_SCALE_1		 = BOSS_SCALE_1,
			BOSS_SILHOUETTE_1	 = BOSS_SILHOUETTE_1,
			BOSS_SCALE_1		 = BOSS_SCALE_2,
			BOSS_SILHOUETTE_1	 = BOSS_SILHOUETTE_2,
			DEMO_NUM			 = DEMO_NUM,
			MAP_ID				 = MAP_ID,
		};
		
		MastersLoad_MineStart(info);
		break;
	// ��Ԃ̗V�� �S�[���n��
	case g_keyhole_goal_mine :
		local info = {
			GIMMICK_FLG			 = GIMMICK_FLG,
			GIMMICK_CLEAR_FLG	 = GIMMICK_CLEAR_FLG,
			XPOS_2				 = XPOS_2,
			YPOS_2				 = YPOS_2,
			ZPOS_2				 = ZPOS_2,
			DIR_2				 = DIR_2,
			CAMERA_EYE			 = CAMERA_EYE,
			CAMERA_TGT			 = CAMERA_TGT,
			BOSS_EXCHANGE_ID	 = BOSS_EXCHANGE_ID,
			BOSS_PARTY_TABLE_1	 = BOSS_PARTY_TABLE_1,
			BOSS_PARTY_TABLE_2	 = BOSS_PARTY_TABLE_2,
		};
		
		MastersLoad_MineGoal(info);
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


//++++++++++++++++++++++++++++++++++++++++++++++++
//		�]�����u�i�����̕X���j�𒲂ׂ���
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineEnterTransfer()
{
	local return_pos = Vec3(1118.2, 990.4, -3238.7);
	local return_rot = -69;
	local dont_use_transfer = GetEventFlg_("BFG_DONT_TRANSFER_ICE_TO_SAND");// �X��-�����Ԃ̑嗤�ړ����u�̎g�p���֎~����t���O
	
	if(dont_use_transfer == false){
		OpenMsgWnd_();
		ShowMsg_("SYSTEM_MSG_000");			// �嗤�ړ����u�� �g����
		KeyInputWait_();
		
		if(GetQueryResult_() == QUERY2_0){
			CloseMsgWnd_();
			// �嗤�ړ����u���g���đ嗤�ړ������ꍇ�A���C�h���������邽�߂Ɏg�p����t���O
			SetEventFlg_("BFG_RIDE_OFF_USED_TRANSFER", true);
			// �����̕X���t�B�[���h��
			ChangeMapPosDir_("I00_00", return_pos, return_rot);
		}
		else{
			CloseMsgWnd_();
		}
	}
	// �ړ����u�̎g�p�֎~���������ꍇ
	else{
		// �V�X�e�����b�Z�[�W
		OpenMsgWnd_();
		ShowMsg_("DONT_USE_TRANSFER_010");		// �ړ����u�́@�����Ă��Ȃ��B
		KeyInputWait_();
		CloseMsgWnd_();
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		�]�����u�i�ŔM�̉ΎR�j�𒲂ׂ���
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineExitTransfer()
{
	local return_pos = Vec3(1608.0, 133.7, 1395.0);
	local return_rot = -140;
	local dont_use_transfer = GetEventFlg_("BFG_DONT_TRANSFER_SAND_TO_VOLCANO");// ����-�ΎR�Ԃ̑嗤�ړ����u�̎g�p���֎~����t���O
	
	if(dont_use_transfer == false){
		if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
			if (prison_num < GetFlagID_("CONST_SS_PR_LAST_ANSESU_6TH")) {				// Num6 < 35
				OpenMsgWnd_();
				ShowMsg_("SYSTEM_MSG_001");		// �嗤�ړ����u�� �����Ă��Ȃ��B
				KeyInputWait_();
				CloseMsgWnd_();
			}
			else if (prison_num == GetFlagID_("CONST_SS_PR_LAST_ANSESU_6TH")) {			// Num6 = 35
				DeleteEventMine_(g_mine_exit_transfer);
				
				// Bit�t���O�ݒ�
				SetEventFlg_("BFG_S00_00_EVENT_BGM005_PLAY", false);	// Bit_659  BGM_005 �𗬂����ǂ���
				SetEventFlg_("BFG_SAVE_POINT_FLAG", true);				// Bit_1033 �Z�[�u�|�C���g������
				SetEventFlg_("BFG_RIDE_OFF_USED_TRANSFER", true);		// Bit_1400 ���C�h�������邩�ǂ���
				
				// Num�t���O�ݒ�
				SetNumFlg_("NUM_SCENARIO_MAIN", GetFlagID_("CONST_SM_VOLCANO"));				// Num0 <- 6
				SetNumFlg_("NUM_SCENARIO_SUB_PRISON", GetFlagID_("CONST_SS_PR_PRISON_START"));	// Num6 <- 0
				
				//����̗􂯖ڃ��x�����グ��i���^���G���A���܂ނ��߃R�R�j
				SetNumFlg_( "NUM_FLG_CRACK_LEVEL", 2 );
				
				// �f���Đ���̕��A�ʒu
				SetReturnDemoMap_("V00_00");
				SetReturnDemoPosDir_(return_pos, return_rot);
				
				// Demo429[�ړ����u�g�p]�Đ�
				ChangeDemo_(429);
			}
		}
		else {
			OpenMsgWnd_();
			ShowMsg_("SYSTEM_MSG_002");			// �嗤�ړ����u�� �g����
			KeyInputWait_();
			
			if(GetQueryResult_() == QUERY2_0){
				CloseMsgWnd_();
				// ���C�h��Ԃő嗤�ړ������ꍇ�A���C�h����������t���O
				SetEventFlg_("BFG_RIDE_OFF_USED_TRANSFER", true);
				// �ŔM�̉ΎR�t�B�[���h��
				ChangeMapPosDir_("V00_00", return_pos, return_rot);
			}
			else{
				CloseMsgWnd_();
			}
		}
	}
	// �ړ����u�̎g�p�֎~���������ꍇ
	else{
		// �V�X�e�����b�Z�[�W
		OpenMsgWnd_();
		ShowMsg_("DONT_USE_TRANSFER_010");		// �ړ����u�́@�����Ă��Ȃ��B
		KeyInputWait_();
		CloseMsgWnd_();
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		���[���|�C���g�ɐG�ꂽ��
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineRuler()
{
	CommPlayerTurnAroundObj(g_gmk_rulerpoint);
	CommRulerPointEvent(g_gmk_rulerpoint, "BFG_RULER_ADD_018", "gmk_ruler"); 
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//  ���[�J���֐� : ���G�X�^�[�N�p�n���̏���
//------------------------------------------------
// ����   �F�Ȃ�
// �߂�l �F�Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineBreakEstark()
{
	local status_num = GetNumFlg_("NUM_BREAK_ESTARK_PHASE"); // NUM018
	
	if(status_num == 1){
		SetNumFlg_("NUM_BREAK_ESTARK_PHASE", 2);
	}
	else if(status_num == 4){
		SetNumFlg_("NUM_BREAK_ESTARK_PHASE", 5);
	}
	
	// ���C�h�����ׁ̈A�}�b�v�`�F���W
	ChangeMapPosDir_("S00_00", Vec3(-35.000, 1350.520, -40.000), 90);
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//  ���[�J���֐� : �[���f��[���G�X�^�[�N�Ƃ̐ڐG]
//------------------------------------------------
// ����   �F�Ȃ�
// �߂�l �F�Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uPlayableDemoBreakEstark()
{
	// �i�s�t���O�̏�Ԃ��擾
	local status_num = GetNumFlg_("NUM_BREAK_ESTARK_PHASE"); // NUM018
	
	// ����
	local player = GetPlayerId_();
	local pl_pos = Vec3(-35.000, 1350.520, -40.000);
	local pl_dir = 90;
	local rtn_pl_pos = Vec3(-80.000, 1350.420, -40.000); // ���A�ʒu
	local wait_frame = 27;
	local del_eff_wait = 30; // �Q�Ă���G�t�F�N�g��������܂ł̂�����E�F�C�g
	// �Ó]
	CommChangeMomentFadeOut(FADE_COLOR_BLACK);
	// ��l���������X�^�[�̐^���ʂɔz�u
	SetPos_(player, pl_pos);
	SetDir_(player, pl_dir);
	// ��l��������
	SetManualCalcAlpha_(player, true);
	SetAlpha_(player, 0.0);
	//SetCameraDir_(pl_dir);
	// ���G�X�^�[�N��Q�Ă��郂�[�V�����ɂ���B
	local mot_B_Estark_Sleep = ReadMotion_(npc_B_Estark, "m199_00_sleep");
	SetMotion_(npc_B_Estark, mot_B_Estark_Sleep, BLEND_N);
	// �Q�Ă���G�t�F�N�g
	LoadEffect_("ef320_01_life_zzz");					// ZZZ
	local efc_zzz = SetSelectBoneEffect_("ef320_01_life_zzz", npc_B_Estark, ATTACH_EFFECT1);
	SetEffectScale_(efc_zzz, 6.0);
	// �J�����̐ݒ�
	SetPointCameraEye_("cam_eye002");
	SetPointCameraTarget_("cam_target002");
	// �������I������̂ňÓ]����
	SetFade_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
	WaitFade_();

// �[���f���J�n
	// ���b�Z�[�W�\��( ����or�Đ�ŕ��� )
	if(status_num == 2){ // ����
		OpenMsgWnd_();
		ShowMsg_("BREAK_ESTARK_MSG_000");
		KeyInputWait_();
		CloseMsgWnd_();
		// �Q�Ă���G�t�F�N�g������
		DeleteEffectEmitter_(efc_zzz); 
		Wait_(del_eff_wait);
		// �N���郂�[�V�����ɐ؂�ւ���
		local mot_B_Estark_Wake = ReadMotion_(npc_B_Estark, "m199_00_wake");
		SetMotion_(npc_B_Estark, mot_B_Estark_Wake, BLEND_N);
		WaitMotion(npc_B_Estark);
		SetMotion_(npc_B_Estark, MOT_WAIT, BLEND_N);
		// ���b�Z�[�W�̑���
		OpenMsgWnd_();
		ShowMsg_("BREAK_ESTARK_MSG_001");
		KeyInputWait_();
		ShowMsg_("BREAK_ESTARK_MSG_002_01");
		KeyInputWait_();
		SetTalkName_("NAME_TAG_BRAEK_ESTARK");
		ShowMsg_("BREAK_ESTARK_MSG_003");
		KeyInputWait_();
		if(GetQueryResult_() == MES_QUERY_YES){
			if(uCheckEmptyCloakRoom()){
				// �퓬�ڍs����
				uBreakEstarkQuestionYes(3, true, wait_frame);
			}
			else{
				// uCheckEmptyCloakRoom()���ŗa�菊�̏������s��
				Wait_(10); // �Ԃ���������
				// �퓬�ڍs����
				uBreakEstarkQuestionYes(3, false, wait_frame);
			}
		}
		else{
			// ���b�Z�[�W��\��
			ShowMsg_("BREAK_ESTARK_MSG_004");
			KeyInputWait_();
			CloseMsgWnd_();
			// ���G�X�^�[�N�p�̐i�s�t���O���Đ�ɍ��킹��
			SetNumFlg_("NUM_BREAK_ESTARK_PHASE", 4);
			// �}�b�v�`�F���W
			ChangeMapPosDir_("S00_00", rtn_pl_pos, pl_dir);
			Wait_(1);
		}
	}
	else if(status_num == 5){ // ����ȊO
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_BRAEK_ESTARK");
		ShowMsg_("BREAK_ESTARK_MSG_000");
		KeyInputWait_();
		CloseMsgWnd_();
		// �Q�Ă���G�t�F�N�g������
		DeleteEffectEmitter_(efc_zzz);
		Wait_(del_eff_wait);
		// �N���郂�[�V�����ɐ؂�ւ���
		local mot_B_Estark_Wake = ReadMotion_(npc_B_Estark, "m199_00_wake");
		SetMotion_(npc_B_Estark, mot_B_Estark_Wake, BLEND_N);
		WaitMotion(npc_B_Estark);
		SetMotion_(npc_B_Estark, MOT_WAIT, BLEND_N);
		// ���b�Z�[�W�̑���
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_BRAEK_ESTARK");
		ShowMsg_("BREAK_ESTARK_MSG_001");
		KeyInputWait_();
		ShowMsg_("BREAK_ESTARK_MSG_002_02");
		KeyInputWait_();
		if(GetQueryResult_() == MES_QUERY_YES){
			if(uCheckEmptyCloakRoom()){
				// �퓬�ڍs����
				uBreakEstarkQuestionYes(6, true, wait_frame);
			}
			else{
				// uCheckEmptyCloakRoom()���ŗa�菊�̏������s��
				Wait_(10); // �Ԃ���������
				// �퓬�ڍs����
				uBreakEstarkQuestionYes(6, false, wait_frame);
			}
		}
		else{
			// ���b�Z�[�W��\��
			ShowMsg_("BREAK_ESTARK_MSG_004");
			KeyInputWait_();
			CloseMsgWnd_();
			// ���G�X�^�[�N�p�̐i�s�t���O����
			SetNumFlg_("NUM_BREAK_ESTARK_PHASE", 4);
			// �}�b�v�`�F���W
			ChangeMapPosDir_("S00_00", rtn_pl_pos, pl_dir);
			Wait_(1);
		}
	}
}


//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//  ���[�J���֐� : �����X�^�[�̗a�菊�ɋ󂫂����邩���ׂĖ߂�l��Ԃ��B(�󂫂��Ȃ��ꍇ�͗a�菊�����X�ƌĂяo��)
//-------------------------------------------------------------------------------------------
// ����   �F�Ȃ�
// �߂�l �Ftrue : �󂫂����� / false : �󂫂��Ȃ�
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function uCheckEmptyCloakRoom()
{
	local residue = GetFreeMonsterNum_();
	local empty_num = 0;

	// �󂫂��Ȃ�
	if(residue <= empty_num){
		CloseMsgWnd_();
		while(true){
			// �i�r�}�b�v���\��
			SetNavimapVisible_(false);
			// �����b�Z�[�W(�V�X�e�����b�Z�[�W)
			OpenMsgWnd_();
			ShowMsg_("BREAK_ESTARK_MSG_NOT_EMPTY");
			KeyInputWait_();
			CloseMsgWnd_();
			// �����ɈÓ]����
			SetFadeSub_(FADE_IN, FADE_COLOR_BLACK, FADE_SHORT);
			// �a�菊���Ăяo��
			GotoMenuFadeOpen(MENU_OPEN.LUGGAGE_OFFICE);
			// �ă`�F�b�N
			residue = GetFreeMonsterNum_();
			if(residue > empty_num){
				// �P�̂ł��󂫂��o�����甲����
				break;
			}
		}
		// �����ɈÓ]
		SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
		// �i�r�}�b�v��\��
		SetNavimapVisible_(true);
		return false;
	}
	// �󂫂�����
	else{
		return true;
	}
}


//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//  ����֐� : ���G�X�^�[�N�̎���Łu�͂��v��I�񂾂Ƃ��̐퓬�ڍs����
//-------------------------------------------------------------------
// �������F�i�s�t���O�̒萔( ���� : 3 / �Đ� : 6 ����)
// �������F�a���菊�`�F�b�N�̃t���O( ���ݒ�ł��肢���܂� )
// ��O�����F���G�X�^�[�N�̃A�^�b�N���[�V�����҂��̃t���[����
// �߂�l  �F�Ȃ�
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function uBreakEstarkQuestionYes(flg_num, flg, frame)
{
	// �a���菊���o�R�������`�F�b�N(�o�R�����ꍇ�́ufalse�v��ʂ�)
	if(flg == false){
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_BRAEK_ESTARK");
	}
	// ���b�Z�[�W��\��
	ShowMsg_("BREAK_ESTARK_MSG_005");
	KeyInputWait_();
	CloseMsgWnd_();
	// ���G�X�^�[�N�p�̐i�s�t���O��i�߂�
	SetNumFlg_("NUM_BREAK_ESTARK_PHASE", flg_num);
	// �퓬���[�V����
	PlaySE_("SE_FLD_074");
	SetMotion_(npc_B_Estark, MOT_ATTACK, BLEND_N);
	Wait_(frame);
	//���̜͂p�j�����X�^�[���폜
	InhibitMonsterGenerate_( 10000.0 );
	// �퓬�J�n(�u���[�̎w��͓��������)
	ChangeBattleParty_(132);
}

//+++++++++++++++++++++++++++++++++++++++++++++++++
//  ���[�J���֐� : �[���f��[���G�X�^�[�N�Ƃ̐퓬��]
//-------------------------------------------------
// ����   �F�Ȃ�
// �߂�l �F�Ȃ�
//+++++++++++++++++++++++++++++++++++++++++++++++++
function uCheckMateBreakEstark()
{
	// �i�s�t���O�̏�Ԃ��擾
	local status_num = GetNumFlg_("NUM_BREAK_ESTARK_PHASE"); // NUM018
	// ����
	local player = GetPlayerId_();
	local pl_pos = Vec3(-35.000, 1350.520, -40.000);
	local pl_dir = 90;
	local rtn_pl_pos = Vec3(-80.000, 1350.420, -40.000); // ���A�ʒu
	local wait_frame = 30;
	// �Ó]
	CommChangeMomentFadeOut(FADE_COLOR_BLACK);
	// ��l���������X�^�[�̐^���ʂɔz�u
	SetPos_(player, pl_pos);
	SetDir_(player, pl_dir);
	// ��l��������
	SetManualCalcAlpha_(player, true);
	SetAlpha_(player, 0.0);
	//SetCameraDir_(pl_dir);
	// �J�����̐ݒ�
	SetPointCameraEye_("cam_eye002");
	SetPointCameraTarget_("cam_target002");
	// �������I������̂ňÓ]����
	SetFade_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
	WaitFade_();

// �[���f���J�n
	local lmt_round = GetBattleRound_();
	DebugPrint("�퓬�I���^�[������ " + lmt_round + " �^�[���ł��B");
	// �K��^�[����(10���E���h�͉�)�ȓ��ŏ���
	if(lmt_round <= 10){
		// ���b�Z�[�W��\��
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_BRAEK_ESTARK");
		SetExchangeNumber_(lmt_round);
		ShowMsg_("BREAK_ESTARK_MSG_006_CLEAR");
		KeyInputWait_();
		ShowMsg_("BREAK_ESTARK_MSG_006_01");
		KeyInputWait_();
		CloseMsgWnd_();
		// ���ԂɂȂ������b�Z�[�W
		OpenMsgWnd_();
		ShowMsg_("BREAK_ESTARK_MSG_007");
		// ����ME
		PlayMe_("ME_010");
		WaitMe_();
		KeyInputWait_();
		CloseMsgWnd_();
		// ���O�t����ʂֈڍs
		local tsk_named_wnd = Task_AddFellow_(BREAK_MONSTER_06_E_ID, false);
		WaitTask(tsk_named_wnd);
		// �Ó]
		SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
		WaitFade_();
		// �v���C���[���f��
		SetVisible(player, true);
		// ���G�X�^�[�N�̕\�������ɖ߂�
		SetManualCalcAlpha_(npc_B_Estark, true);
		SetAlpha_(npc_B_Estark, 1.0);
		// ���G�X�^�[�N�p�̐i�s�t���O��߂�
		SetNumFlg_("NUM_BREAK_ESTARK_PHASE", 7);
	}
	else{
		// ���b�Z�[�W��\��
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_BRAEK_ESTARK");
		SetExchangeNumber_(lmt_round);
		ShowMsg_("BREAK_ESTARK_MSG_006_NOTCLEAR");
		KeyInputWait_();
		ShowMsg_("BREAK_ESTARK_MSG_006_02");
		KeyInputWait_();
		CloseMsgWnd_();
		// �Ó]
		SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
		WaitFade_();
		// ���G�X�^�[�N�̕\�������ɖ߂�
		SetManualCalcAlpha_(npc_B_Estark, true);
		SetAlpha_(npc_B_Estark, 1.0);
		// ���G�X�^�[�N�p�̐i�s�t���O��߂�
		SetNumFlg_("NUM_BREAK_ESTARK_PHASE", 4);
	}
	// �[���f���ŃJ�����𒲐������̂Ńf�t�H���g�ɖ߂��Ă���
	SetPlayableCamera_();
	// �}�b�v�`�F���W
	ChangeMapPosDir_("S00_00", rtn_pl_pos, pl_dir);
	Wait_(1);
}


