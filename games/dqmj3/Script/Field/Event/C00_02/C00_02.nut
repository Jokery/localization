//===================== C00_02�R�A ��Q�w ====================
//�萔��`
const EFC_DEF =		 1.0;
const EFC_WALL =	 6.0;


// �ϐ���`
main_num	 <- C_NONE_ID;
core_num	 <- C_NONE_ID;
outside_num	 <- C_NONE_ID;
crystal_num	 <- C_NONE_ID;

core_num_sub <- "NUM_SCENARIO_SUB_CORE";

//------------------------------------------------
//		�퓬�I����
//------------------------------------------------
function AfterBattle()
{
	// �t���O�̎擾
	main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");				// Num0
	core_num	 = GetNumFlg_("NUM_SCENARIO_SUB_CORE");			// Num8
	crystal_num	 = GetNumFlg_("NUM_FLG_COUNT_BROKEN_CRYSTAL");	// Num125
	
	local daemon_battle	 = GetEventFlg_("BFG_BATTLE_BAD_ARCDEAMON");	// ���A�[�N�f�[�����Ɛ�������ǂ���	//Bit1310
	local daemon_win	 = GetEventFlg_("BFG_WIN_BAD_ARCDEAMON");		// ���A�[�N�f�[�����ɏ������t���O	//Bit1311
	local kessyou_battle = GetEventFlg_("BFG_BATTLE_CRYSTAL_MONSTER");	// ���������X�^�[�Ɛ�����t���O(Bit1322)
	local kessyou_win	 = GetEventFlg_("BFG_WIN_CRYSTAL_MONSTER");		// ���������X�^�[�ɏ������t���O(Bit1323)
	local player		 = GetPlayerId_();
	
	// �������󂵂��t���O
	local crystal_break1 = GetEventFlg_("BFG_BREAK_CRYSTAL_1");	// ����1���󂵂�
	local crystal_break2 = GetEventFlg_("BFG_BREAK_CRYSTAL_2");	// ����2���󂵂�
	local crystal_break3 = GetEventFlg_("BFG_BREAK_CRYSTAL_3");	// ����3���󂵂�
	local crystal_break4 = GetEventFlg_("BFG_BREAK_CRYSTAL_4");	// ����4���󂵂�
	local crystal_break5 = GetEventFlg_("BFG_BREAK_CRYSTAL_5");	// ����5���󂵂�
	local crystal_break6 = GetEventFlg_("BFG_BREAK_CRYSTAL_6");	// ����6���󂵂�
	
	
	// ���A�[�N�f�[�����Ƃ̐퓬����
	if(daemon_battle == true){
		// ����
		if(GetBattleEndType_() == END_TYPE_WIN){
			// ���A�[�N�f�[�����ɏ������t���O�𗧂Ă�
			SetEventFlg_("BFG_WIN_BAD_ARCDEAMON", true);
		}
		// �s�k
		else{
			// ���A�[�N�f�[�����Ɛ�����t���O���~�낷
			SetEventFlg_("BFG_BATTLE_BAD_ARCDEAMON", false);
			// �퓬�O�ɐݒ肵���v���C���[�̔�\��������
			SetVisible(player, true);
		}
	}
	
	// ���������X�^�[�Ƃ̐퓬����
	if(kessyou_battle == true){
		// ����
		if(GetBattleEndType_() == END_TYPE_WIN){
			SetEventFlg_("BFG_WIN_CRYSTAL_MONSTER", true);
			// ���������S�ɔj�󂵂��t���O�𗧂Ă�
			uSetCrystalCompleteFlg();
		// �s�k
		}else{
			SetNumFlg_("NUM_FLG_COUNT_BROKEN_CRYSTAL", crystal_num = crystal_num - 1);
			SetEventFlg_("BFG_BATTLE_CRYSTAL_MONSTER", false);	// ���������X�^�[�Ɛ�����t���O(Bit1322)
			SetEventFlg_("BFG_WIN_CRYSTAL_MONSTER", false);		// ���������X�^�[�ɏ������t���O(Bit1323)
		}
	}
	
	
	
	EventEnd_();
}


//------------------------------------------------
//		�}�b�v�ɓ���O
//------------------------------------------------
function BeforeInitMap()
{
	main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");				// Num0
	core_num	 = GetNumFlg_("NUM_SCENARIO_SUB_CORE");			// Num8
	
	
	// �R�A�V�i���I����̃V�i���I�ł̓M�~�b�N�z�u���s��Ȃ��悤�ɂ���
	if(main_num > GetFlagID_("CONST_SM_CORE")){
		SetNumFlg_("NUM_FLG_COUNT_BROKEN_CRYSTAL", 6);			// ���E�M�~�b�N�N���A�ς�
		SetEventFlg_("BFG_LOOKED_PLAYABLE_DEMO_C00_02", true);	// ���i�[�e�̋[���f����������
		SetEventFlg_("BFG_WIN_BAD_ARCDEAMON", true);			// ���A�[�N�f�[�����ɏ�����
		SetEventFlg_("BFG_PERFECT_BREAK_CRYSTAL_1", true);		// ����1�����S�ɔj�󂵂�
		SetEventFlg_("BFG_PERFECT_BREAK_CRYSTAL_2", true);		// ����2�����S�ɔj�󂵂�
		SetEventFlg_("BFG_PERFECT_BREAK_CRYSTAL_3", true);		// ����3�����S�ɔj�󂵂�
		SetEventFlg_("BFG_PERFECT_BREAK_CRYSTAL_4", true);		// ����4�����S�ɔj�󂵂�
		SetEventFlg_("BFG_PERFECT_BREAK_CRYSTAL_5", true);		// ����5�����S�ɔj�󂵂�
		SetEventFlg_("BFG_PERFECT_BREAK_CRYSTAL_6", true);		// ����6�����S�ɔj�󂵂�
	}
	
	
	EventEnd_();
}


//------------------------------------------------
//		�t�F�[�h�A�E�g��
//------------------------------------------------
function FadeIn()
{
	// �t���O�̎擾
	main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");				// Num0
	core_num	 = GetNumFlg_("NUM_SCENARIO_SUB_CORE");			// Num8
	crystal_num	 = GetNumFlg_("NUM_FLG_COUNT_BROKEN_CRYSTAL");	// Num125
	
	// �����̃��A�N�^�[�|�C���g�𒲂ׂ����ǂ����̃t���O
	local rec_flg1 = GetEventFlg_("BFG_CHECK_CRYSTAL_REC_POINT_1");	// ����1�̃��A�N�^�[�|�C���g�𒲂ׂ���	//Bit1313
	local rec_flg2 = GetEventFlg_("BFG_CHECK_CRYSTAL_REC_POINT_2");	// ����2�̃��A�N�^�[�|�C���g�𒲂ׂ���	//Bit1314
	local rec_flg3 = GetEventFlg_("BFG_CHECK_CRYSTAL_REC_POINT_3");	// ����3�̃��A�N�^�[�|�C���g�𒲂ׂ���	//Bit1315
	local rec_flg4 = GetEventFlg_("BFG_CHECK_CRYSTAL_REC_POINT_4");	// ����4�̃��A�N�^�[�|�C���g�𒲂ׂ���	//Bit1316
	local rec_flg5 = GetEventFlg_("BFG_CHECK_CRYSTAL_REC_POINT_5");	// ����5�̃��A�N�^�[�|�C���g�𒲂ׂ���	//Bit1317
	local rec_flg6 = GetEventFlg_("BFG_CHECK_CRYSTAL_REC_POINT_6");	// ����6�̃��A�N�^�[�|�C���g�𒲂ׂ���	//Bit1318
	
	// ���������X�^�[��|���A���S�ɔj��o���Ă邩�ǂ���
	local crystal_complete1 = GetEventFlg_("BFG_PERFECT_BREAK_CRYSTAL_1");	// ����1�����S�ɔj�󂵂�
	local crystal_complete2 = GetEventFlg_("BFG_PERFECT_BREAK_CRYSTAL_2");	// ����2�����S�ɔj�󂵂�
	local crystal_complete3 = GetEventFlg_("BFG_PERFECT_BREAK_CRYSTAL_3");	// ����3�����S�ɔj�󂵂�
	local crystal_complete4 = GetEventFlg_("BFG_PERFECT_BREAK_CRYSTAL_4");	// ����4�����S�ɔj�󂵂�
	local crystal_complete5 = GetEventFlg_("BFG_PERFECT_BREAK_CRYSTAL_5");	// ����5�����S�ɔj�󂵂�
	local crystal_complete6 = GetEventFlg_("BFG_PERFECT_BREAK_CRYSTAL_6");	// ����6�����S�ɔj�󂵂�
	
	local daemon_battle	 = GetEventFlg_("BFG_BATTLE_BAD_ARCDEAMON");		// ���A�[�N�f�[�����Ɛ�������ǂ���	//Bit1310
	local daemon_win	 = GetEventFlg_("BFG_WIN_BAD_ARCDEAMON");			// ���A�[�N�f�[�����ɏ������t���O	//Bit1311
	local kessyou_battle = GetEventFlg_("BFG_BATTLE_CRYSTAL_MONSTER");		// ���������X�^�[�Ɛ�����t���O(Bit1322)
	local kessyou_win	 = GetEventFlg_("BFG_WIN_CRYSTAL_MONSTER");			// ���������X�^�[�ɏ������t���O(Bit1323)
	local gimmick_help	 = GetEventFlg_("BFG_LOOKED_PLAYABLE_DEMO_C00_02");	// ���E�̏���������󂯂����ǂ���
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
	g_daemon		 <- C_NONE_ID;
	
	// �����A�[�N�f�[����
	if(daemon_win == false){
		g_daemon  = ReadAndArrangePointNpc("m202_00",  "npc_daemon");
		SetScaleSilhouette(g_daemon, SCALE.M, SILHOUETTE_WIDTH.M);	// �T�C�Y�̐ݒ�
		SetTalkEnable_(g_daemon, false);							// ��b�A�C�R����\��
		SetReactorMsg_(g_daemon, "NPC_DAEMON_ANALYZE_010");
	}
	
	
	
	//---------------
	// ���M�~�b�N�z�u
	//---------------
	// ID������
	g_crystal_01	 <- C_NONE_ID;
	g_crystal_02	 <- C_NONE_ID;
	g_crystal_03	 <- C_NONE_ID;
	g_crystal_04	 <- C_NONE_ID;
	g_crystal_05	 <- C_NONE_ID;
	g_crystal_06	 <- C_NONE_ID;
	g_ruler_point	 <- C_NONE_ID;
	
	// ���\�[�X�ǂݍ���
	local id_crystal = ReadGimmick_("o_C00_07");	// ����
	
	// ������
	if(crystal_complete1 == false){
		g_crystal_01 = ArrangePointGimmick_("o_C00_07", id_crystal, "gim_crystal_001");// 1�w�����t��
	}
	if(crystal_complete2 == false){
		g_crystal_02 = ArrangePointGimmick_("o_C00_07", id_crystal, "gim_crystal_002");// 1�w�k���t��
	}
	if(crystal_complete3 == false){
		g_crystal_03 = ArrangePointGimmick_("o_C00_07", id_crystal, "gim_crystal_003");// 2�w�k�t��
	}
	if(crystal_complete4 == false){
		g_crystal_04 = ArrangePointGimmick_("o_C00_07", id_crystal, "gim_crystal_004");// 2�w���t��
	}
	if(crystal_complete5 == false){
		g_crystal_05 = ArrangePointGimmick_("o_C00_07", id_crystal, "gim_crystal_005");// 3�w�����t��
	}
	if(crystal_complete6 == false){
		g_crystal_06 = ArrangePointGimmick_("o_C00_07", id_crystal, "gim_crystal_006");// 3�w�쐼�t��
	}
	
	// �����[���|�C���g
	local rulerpoint_id = ReadGimmick_("o_com_08");
	g_ruler_point = ArrangePointGimmick_("o_com_08", rulerpoint_id, "gim_ruler_point");
	SetMotion_(g_ruler_point, MOT_GIMMICK_0, BLEND_N);
	if(GetEventFlg_("BFG_RULER_ADD_025") == true){
		SetMotion_(g_ruler_point, MOT_GIMMICK_2, BLEND_N);
	}
	
	//--------------------
	//	���G�t�F�N�g�̐ݒu
	//--------------------
	// ID������
	g_efc_kekkai01	 <- C_NONE_ID;
	g_efc_kekkai02	 <- C_NONE_ID;
	g_efc_aura_01	 <- C_NONE_ID;
	g_efc_aura_02	 <- C_NONE_ID;
	g_efc_aura_03	 <- C_NONE_ID;
	g_efc_aura_04	 <- C_NONE_ID;
	g_efc_aura_05	 <- C_NONE_ID;
	g_efc_aura_06	 <- C_NONE_ID;
	
	// �G�t�F�N�g�̓ǂݍ���
	LoadEffect_("ef300_51_wall_block");			// ᏋC�̌��E
	LoadEffect_("ef731_10_mag_aura_crystal");	// �����̃I�[��
	
	// ��ᏋC�̌��E
	if(crystal_num < 3){
		g_efc_kekkai01 = SetPointWorldEffect_("ef300_51_wall_block", "efc_kekkai_001");
		SetEffectScale_(g_efc_kekkai01, EFC_WALL);
	}
	if(crystal_num < 6){
		g_efc_kekkai02 = SetPointWorldEffect_("ef300_51_wall_block", "efc_kekkai_002");
		SetEffectScale_(g_efc_kekkai02, EFC_WALL);
	}
	
	// �������̃I�[��
	if(rec_flg1 == true && crystal_complete1 == false){
		g_efc_aura_01 = SetPointWorldEffect_("ef731_10_mag_aura_crystal", "gim_crystal_001");
		SetEffectScale_(g_efc_aura_01, EFC_DEF);
	}
	if(rec_flg2 == true && crystal_complete2 == false){
		g_efc_aura_02 = SetPointWorldEffect_("ef731_10_mag_aura_crystal", "gim_crystal_002");
		SetEffectScale_(g_efc_aura_02, EFC_DEF);
	}
	if(rec_flg3 == true && crystal_complete3 == false){
		g_efc_aura_03 = SetPointWorldEffect_("ef731_10_mag_aura_crystal", "gim_crystal_003");
		SetEffectScale_(g_efc_aura_03, EFC_DEF);
	}
	if(rec_flg4 == true && crystal_complete4 == false){
		g_efc_aura_04 = SetPointWorldEffect_("ef731_10_mag_aura_crystal", "gim_crystal_004");
		SetEffectScale_(g_efc_aura_04, EFC_DEF);
	}
	if(rec_flg5 == true && crystal_complete5 == false){
		g_efc_aura_05 = SetPointWorldEffect_("ef731_10_mag_aura_crystal", "gim_crystal_005");
		SetEffectScale_(g_efc_aura_05, EFC_DEF);
	}
	if(rec_flg6 == true && crystal_complete6 == false){
		g_efc_aura_06 = SetPointWorldEffect_("ef731_10_mag_aura_crystal", "gim_crystal_006");
		SetEffectScale_(g_efc_aura_06, EFC_DEF);
	}
	
	//-----------
	// ���n���z�u
	//-----------
	// ID������
	g_mine_ruler_point	 <- C_NONE_ID;
	g_mine_daemon		 <- C_NONE_ID;
	g_mine_standby		 <- C_NONE_ID;
	g_mine_kekkai_01	 <- C_NONE_ID;
	g_mine_kekkai_02	 <- C_NONE_ID;
	g_mine_kekkai_03	 <- C_NONE_ID;
	g_mine_crystal_01	 <- C_NONE_ID;
	g_mine_crystal_02	 <- C_NONE_ID;
	g_mine_crystal_03	 <- C_NONE_ID;
	g_mine_crystal_04	 <- C_NONE_ID;
	g_mine_crystal_05	 <- C_NONE_ID;
	g_mine_crystal_06	 <- C_NONE_ID;
	g_mine_layer_01		 <- C_NONE_ID;
	g_mine_pane_01		 <- C_NONE_ID;
	
	
	// �����[���|�C���g
	g_mine_ruler_point = SetPointCircleEventMine_("mine_ruler_point", true);
	
	// �����A�[�N�f�[�����Ƃ̐퓬�p�n��
	if(daemon_win == false){
		g_mine_daemon = SetPointBoxEventMine_("mine_daemon", false);
	}
	
	// ���R�A�Ő[���ւ̓˓��m�F�n��
	if(main_num == GetFlagID_("CONST_SM_CORE")){							// Num0 = 7
		if(core_num == GetFlagID_("CONST_SS_CO_GO_MOTHER_ROOM")){			// Num8 = 1
			g_mine_standby = SetPointBoxEventMine_("mine_standby", false);
		}
	}
	
	// ��ᏋC�̌��E
	if(gimmick_help == false){
		g_mine_kekkai_01 = SetPointBoxEventMine_("mine_kekkai_001", false);	// ���i�[�e���b�����Ă���n��
	}
	if(crystal_num < 3){
		g_mine_kekkai_02 = SetPointBoxEventMine_("mine_kekkai_002", false);	// ��1�w�̌��E
	}
	if(crystal_num < 6){
		g_mine_kekkai_03 = SetPointBoxEventMine_("mine_kekkai_003", false);	// ��3�w�̌��E
	}
	
	// ������
	// ���A�N�^�[�Œ��ׂ��さ���������S�j��o���Ă��Ȃ����ɔz�u
	if(rec_flg1 == true && crystal_complete1 == false){
		g_mine_crystal_01 = SetPointCircleEventMine_("mine_crystal_001", true);
	}
	if(rec_flg2 == true && crystal_complete2 == false){
		g_mine_crystal_02 = SetPointCircleEventMine_("mine_crystal_002", true);
	}
	if(rec_flg3 == true && crystal_complete3 == false){
		g_mine_crystal_03 = SetPointCircleEventMine_("mine_crystal_003", true);
	}
	if(rec_flg4 == true && crystal_complete4 == false){
		g_mine_crystal_04 = SetPointCircleEventMine_("mine_crystal_004", true);
	}
	if(rec_flg5 == true && crystal_complete5 == false){
		g_mine_crystal_05 = SetPointCircleEventMine_("mine_crystal_005", true);
	}
	if(rec_flg6 == true && crystal_complete6 == false){
		g_mine_crystal_06 = SetPointCircleEventMine_("mine_crystal_006", true);
	}
	
	// ���v���C���[���ǂ̊K�w�ɂ���̂��𒲂ׂ�n��
	g_mine_layer_01	 = SetPointBoxEventMineNoFallWait_("mine_layer_01");
	SetMinePlayerStop_(g_mine_layer_01, false);
	
	// ���}�b�v�g���̂��߂̃y�C����������邽�߂̒n��
	local pane_flg = GetEventFlg_("BFG_OPEN_SECRET_AREA_01_C00_02");
	if(pane_flg == false){
		g_mine_pane_01 = SetPointBoxEventMineNoFallWait_("mine_pane_01");
	}
	
	//---------------------
	// �����A�N�^�[�|�C���g
	//---------------------
	// ID������
	g_rec_crystal_01 <- C_NONE_ID;
	g_rec_crystal_02 <- C_NONE_ID;
	g_rec_crystal_03 <- C_NONE_ID;
	g_rec_crystal_04 <- C_NONE_ID;
	g_rec_crystal_05 <- C_NONE_ID;
	g_rec_crystal_06 <- C_NONE_ID;
	
	
	// ������ȉ���
	local rec_point_hall = ArrangeMsgReactorPoint("rec_hall", GetFlagID_("BFG_REACTER_POINT_117")// Bit_1616 ����ȉ���
		, SHORT_DIST, "REC_POINT_HALL_010", "REC_POINT_HALL_020");
	
	// ������
	if(gimmick_help == true){
		if(crystal_complete1 == false){
			g_rec_crystal_01 = ArrangePointReactorPoint_("rec_crystal_001", SHORT_DIST);
			SetReactorEvent_(g_rec_crystal_01);
		}
		if(crystal_complete2 == false){
			g_rec_crystal_02 = ArrangePointReactorPoint_("rec_crystal_002", SHORT_DIST);
			SetReactorEvent_(g_rec_crystal_02);
		}
		if(crystal_complete3 == false){
			g_rec_crystal_03 = ArrangePointReactorPoint_("rec_crystal_003", SHORT_DIST);
			SetReactorEvent_(g_rec_crystal_03);
		}
		if(crystal_complete4 == false){
			g_rec_crystal_04 = ArrangePointReactorPoint_("rec_crystal_004", SHORT_DIST);
			SetReactorEvent_(g_rec_crystal_04);
		}
		if(crystal_complete5 == false){
			g_rec_crystal_05 = ArrangePointReactorPoint_("rec_crystal_005", SHORT_DIST);
			SetReactorEvent_(g_rec_crystal_05);
		}
		if(crystal_complete6 == false){
			g_rec_crystal_06 = ArrangePointReactorPoint_("rec_crystal_006", SHORT_DIST);
			SetReactorEvent_(g_rec_crystal_06);
		}
	}
	
	// �����[���|�C���g
	local reactorPoint01  = ArrangeMsgReactorPoint("ReactorPoint_01", GetFlagID_("BFG_REACTER_POINT_010")
		, SHORT_DIST, "REC_POINT_01_01", "REC_POINT_01_02");
	
	//---------------------
	// ���i�r�}�b�v�A�C�R��
	//---------------------
	// �����[���|�C���g
	if(GetEventFlg_("BFG_RULER_ADD_025") == true){
		local icon_ruler_point = ArrangePointNaviMapIcon_(NAVIMAP_ICON.RULER_POINT , "gim_ruler_point");
		SetNaviMapIconVisible_(icon_ruler_point, true);
	}
	
	
	EventEnd_();
}


//------------------------------------------------
//		�t�B�[���h����J�n
//------------------------------------------------
function EventStartOperate()
{
	// �t���O�̎擾
	main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");		// Num0
	core_num	 = GetNumFlg_("NUM_SCENARIO_SUB_CORE");	// Num8
	outside_num = GetNumFlg_("NUM_SCENARIO_SUB_INSIDE_CLEAR");	// Num10
	crystal_num	 = GetNumFlg_("NUM_FLG_COUNT_BROKEN_CRYSTAL");	// Num125
	
	// �Z�[�u�����[�h�Ή��̂��ߊK�w�ɂ���ēG�̔z�u��ύX����
	local player = GetPlayerId_();
	local pos = GetPos_(player);
	// �v���C���[��Y���W�����w����ɂ���ꍇ
	DebugPrint("Y���W�l�� " + pos.y + " �ɂȂ�܂����B");
	if(pos.y >= 255){
		SetEventFlg_("BFG_C00_02_IN_SENTER_LAYER", true);	// �R�A�R�w�ڂ̒��w�ȏ�ɂ���Ƃ�true,���w�ɂ���Ƃ�false�ɂȂ�t���O
		SetEventFlg_("BFG_C00_02_IN_DOWN_LAYER", false);	// �R�A�R�w�ڂ̒��w�ȏ�ɂ���Ƃ�false,���w�ɂ���Ƃ�true�ɂȂ�t���O
	}
	// �v���C���[��Y���W�����w��艺�ɂ���ꍇ
	else if(pos.y <= 254){
		SetEventFlg_("BFG_C00_02_IN_SENTER_LAYER", false);	// �R�A�R�w�ڂ̒��w�ȏ�ɂ���Ƃ�true,���w�ɂ���Ƃ�false�ɂȂ�t���O
		SetEventFlg_("BFG_C00_02_IN_DOWN_LAYER", true);		// �R�A�R�w�ڂ̒��w�ȏ�ɂ���Ƃ�false,���w�ɂ���Ƃ�true�ɂȂ�t���O
	}
	
	
	// ���������X�^�[��|���A���S�ɔj��o���Ă邩�ǂ���
	local crystal_complete1 = GetEventFlg_("BFG_PERFECT_BREAK_CRYSTAL_1");	// ����1�����S�ɔj�󂵂�
	local crystal_complete2 = GetEventFlg_("BFG_PERFECT_BREAK_CRYSTAL_2");	// ����2�����S�ɔj�󂵂�
	local crystal_complete3 = GetEventFlg_("BFG_PERFECT_BREAK_CRYSTAL_3");	// ����3�����S�ɔj�󂵂�
	local crystal_complete4 = GetEventFlg_("BFG_PERFECT_BREAK_CRYSTAL_4");	// ����4�����S�ɔj�󂵂�
	local crystal_complete5 = GetEventFlg_("BFG_PERFECT_BREAK_CRYSTAL_5");	// ����5�����S�ɔj�󂵂�
	local crystal_complete6 = GetEventFlg_("BFG_PERFECT_BREAK_CRYSTAL_6");	// ����6�����S�ɔj�󂵂�
	
	local daemon_battle	 = GetEventFlg_("BFG_BATTLE_BAD_ARCDEAMON");	// ���A�[�N�f�[�����Ɛ�������ǂ���	//Bit1310
	local daemon_win	 = GetEventFlg_("BFG_WIN_BAD_ARCDEAMON");		// ���A�[�N�f�[�����ɏ������t���O	//Bit1311
	local kessyou_battle = GetEventFlg_("BFG_BATTLE_CRYSTAL_MONSTER");	// ���������X�^�[�Ɛ�����t���O(Bit1322)
	local kessyou_win	 = GetEventFlg_("BFG_WIN_CRYSTAL_MONSTER");		// ���������X�^�[�ɏ������t���O(Bit1323)
	local player		 = GetPlayerId_();
	
	//-----------
	// ���퓬����
	//-----------
	// �����A�[�N�f�[����
	if(daemon_battle == true){
		// ���������ꍇ
		if(daemon_win == true){
			SetEventFlg_("BFG_RETURN_BATTLE_FIRLD_BGM_HEAD", true);		// �t�B�[���hBGM�𓪑ł�
			SetEventFlg_("BFG_BATTLE_BAD_ARCDEAMON", false);	// ������t���O���~�낷
			CommChangeMomentFadeOut(FADE_COLOR_BLACK)			// 1�t���ňÓ]
			SetVisible(g_daemon, false);						// NPC��\�������Ȃ�
			DeleteEventMine_(g_mine_daemon);					// �n���폜
			uPlayableReset(-303.1, 631.9, -233.2, -130);		// �v���C�A�u���ɕ��A������
		}
		// �����������AfterBattle()���ōs���Ă���
	}
	
	// �����������X�^�[��
	if(kessyou_battle == true){
		// ���������ꍇ
		if(kessyou_win == true){
			SetEventFlg_("BFG_BATTLE_CRYSTAL_MONSTER", false);	// ���������X�^�[�Ɛ�����t���O
			Wait_(20);
			// ������3�󂵂���
			if(crystal_num == 3){
				uBreakWall(1);	// 1�w�̌��E�������[���f��
			}
			// ������6�󂵂���
			else if(crystal_num == 6){
				uBreakWall(2);	// 3�w�̌��E�������[���f��
			}
		}
		// �����������AfterBattle()���ōs���Ă���
	}
	
	//-----------
	// ���i���֎~
	//-----------
	// ���V�i���I
	if(main_num == GetFlagID_("CONST_SM_INSIDE_CLEAR")){				// Num 0 =  9
		// Demo825[�R�A�̌���]���Đ�����܂�
		if(outside_num <= GetFlagID_("CONST_SS_OS_GO_TO_CORE")){		// Num10 <= 12
			// ���b�Z�[�W�̕\���{�R�A�˓����ֈړ�
			uNotEnterRoomMsg();
		}
	}
	
	
	EventEnd_();
}


//------------------------------------------------
//		�m�o�b�ڐG��
//------------------------------------------------
function TouchNpc()
{
	main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");		// Num0
	core_num	 = GetNumFlg_("NUM_SCENARIO_SUB_CORE");	// Num8
	
	local target = GetTargetId_();
	
	DebugPrint("ID: " + target + " �ɐڐG [TouchEventMine]");
	
	switch (target) {
//	case  :
//		break;
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
	// �t���O�̎擾
	main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");		// Num0
	core_num	 = GetNumFlg_("NUM_SCENARIO_SUB_CORE");	// Num8
	
	local target = GetTouchEventMineId_();
	
	DebugPrint("ID: " + target + " �ɐڐG [TouchEventMine]");
	
	switch (target) {
	case g_mine_ruler_point:
		uMineRulerPoint();
		break;
	case g_mine_daemon :
		uMineDaemonBattle();
		break;
	case g_mine_standby :
		uMineStandby();
		break;
	case g_mine_kekkai_01 :
		uMineKekkai01();
		break;
	case g_mine_kekkai_02 :
		uMineKekkai02();
		break;
	case g_mine_kekkai_03 :
		uMineKekkai03();
		break;
	case g_mine_crystal_01 :
		uMineCrystalBreak(g_crystal_01, g_efc_aura_01, g_mine_crystal_01);
		break;
	case g_mine_crystal_02 :
		uMineCrystalBreak(g_crystal_02, g_efc_aura_02, g_mine_crystal_02);
		break;
	case g_mine_crystal_03 :
		uMineCrystalBreak(g_crystal_03, g_efc_aura_03, g_mine_crystal_03);
		break;
	case g_mine_crystal_04 :
		uMineCrystalBreak(g_crystal_04, g_efc_aura_04, g_mine_crystal_04);
		break;
	case g_mine_crystal_05 :
		uMineCrystalBreak(g_crystal_05, g_efc_aura_05, g_mine_crystal_05);
		break;
	case g_mine_crystal_06 :
		uMineCrystalBreak(g_crystal_06, g_efc_aura_06, g_mine_crystal_06);
		break;
	case g_mine_layer_01 :
		uMineLayer();
		break;
	case g_mine_pane_01 :
		uMinePane01();
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
	// �t���O�̎擾
	main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");		// Num0
	core_num	 = GetNumFlg_("NUM_SCENARIO_SUB_CORE");	// Num8
	
	local target = GetTargetId_();
	
	switch(target){
	case g_rec_crystal_01:
		uReactorPointCrystal(g_rec_crystal_01);
		break;
	case g_rec_crystal_02:
		uReactorPointCrystal(g_rec_crystal_02);
		break;
	case g_rec_crystal_03:
		uReactorPointCrystal(g_rec_crystal_03);
		break;
	case g_rec_crystal_04:
		uReactorPointCrystal(g_rec_crystal_04);
		break;
	case g_rec_crystal_05:
		uReactorPointCrystal(g_rec_crystal_05);
		break;
	case g_rec_crystal_06:
		uReactorPointCrystal(g_rec_crystal_06);
		break;
	default:
		break;
	}
	
	
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
//		���[���|�C���g�̒n���ɐG�ꂽ��
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineRulerPoint()
{
	CommPlayerTurnAroundObj(g_ruler_point);
	CommRulerPointEvent(g_ruler_point, "BFG_RULER_ADD_025", "gim_ruler_point");
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		���A�[�N�f�[�����Ƃ̐퓬�p�n���ɐG�ꂽ��
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineDaemonBattle()
{
	// �t���O�̎擾
	main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");		// Num0
	core_num	 = GetNumFlg_("NUM_SCENARIO_SUB_CORE");	// Num8
	
	local daemon_battle	 = GetEventFlg_("BFG_BATTLE_BAD_ARCDEAMON");// ���A�[�N�f�[�����Ɛ�������ǂ���	//Bit1310
	local daemon_win	 = GetEventFlg_("BFG_WIN_BAD_ARCDEAMON");	// ���A�[�N�f�[�����ɏ������t���O	//Bit1311
	local player		 = GetPlayerId_();
	
	
	// �n���폜
	DeleteEventMine_(g_mine_daemon);
	
	// �A�[�N�f�[�����Ɛ�����t���O
	SetEventFlg_("BFG_BATTLE_BAD_ARCDEAMON", true);
	
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
	
	// ���A�[�N�f�[�����̃��b�Z�[�W
	OpenMsgWnd_();
	ShowMsg_("NPC_DAEMON_010");						//�u�R�R�J���c�c��n�c�c�s�J�Z�i�C�c�c�I
	KeyInputWait_();
	CloseMsgWnd_();
	
	// ���A�[�N�f�[�����̃��[�V�����Đ�
	PlaySE_("SE_FLD_073");
	SetMotion_(g_daemon, MOT_SPELL_START, BLEND_M);
	Wait_(20);
	SetMotion_(g_daemon, MOT_SPELL_CHARGE, BLEND_M);
	Wait_(10);
	SetMotion_(g_daemon, MOT_SPELL_ACTUATE, BLEND_M);
	Wait_(20);
	
	// ���A�[�N�f�[�����Ɛ퓬
	ChangeBattleParty_(166);
	
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		�R�A�Ő[���ւ̓˓��m�F�n���ɐG�ꂽ��
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineStandby()
{
	// �V�X�e�����b�Z�[�W
	OpenMsgWnd_();
	ShowMsg_("SYS_MESSAGE_010");			//���̉�����@�}�f�́@��������������c�c�B
	KeyInputWait_();
	// �u�͂��v
	if(GetQueryResult_() == QUERY2_0){
		CloseMsgWnd_();
		// �n���폜
		DeleteEventMine_(g_mine_standby);
		ChangeMap_("E00_00");
	}
	// �u�������v
	else{
		CloseMsgWnd_();
		// �o�b�N���Ĉړ�
		CommPlayerTurnMoveDirWalk(50);
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		���i�[�e���b�������Ă���ɐG�ꂽ��(��1�w)
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineKekkai01()
{
	SetEventFlg_("BFG_LOOKED_PLAYABLE_DEMO_C00_02", true);	// ���E�M�~�b�N�̏�������[���f�����������ǂ���
	DeleteEventMine_(g_mine_kekkai_01);
	// ���j�[�NID�̏�����
	g_mine_kekkai_01 = C_NONE_ID;
	
	// �t�F�[�h�A�E�g
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
	SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
	WaitFade_();
	Wait_(10);
	
	// �J������ݒu
	SetPointCameraEye_("cameye_002");
	SetPointCameraTarget_("camtgt_002");
	Wait_(10);
	
	// �t�F�[�h�C��
	SetFade_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
	WaitFade_();
	Wait_(20);
	
	// ���b�Z�[�W
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_RENATE_010");			//�u����́c�c�}�f�����ݏo���@�G�l���M�[��
	KeyInputWait_();
	CloseMsgWnd_();
	
	// �t�F�[�h�A�E�g
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
	SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
	WaitFade_();
	Wait_(10);
	
	//�J������ݒu
	SetPlayableCamera_();
	Wait_(10);
	
	// �t�F�[�h�C��
	SetFade_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
	SetFadeSub_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
	WaitFade_();
	Wait_(20);
	
	
	//---------------------------
	// �����A�N�^�[�|�C���g�̐ݒu
	//---------------------------
	// ������
	g_rec_crystal_01 = ArrangePointReactorPoint_("rec_crystal_001", SHORT_DIST);
	SetReactorEvent_(g_rec_crystal_01);
	g_rec_crystal_02 = ArrangePointReactorPoint_("rec_crystal_002", SHORT_DIST);
	SetReactorEvent_(g_rec_crystal_02);
	g_rec_crystal_03 = ArrangePointReactorPoint_("rec_crystal_003", SHORT_DIST);
	SetReactorEvent_(g_rec_crystal_03);
	g_rec_crystal_04 = ArrangePointReactorPoint_("rec_crystal_004", SHORT_DIST);
	SetReactorEvent_(g_rec_crystal_04);
	g_rec_crystal_05 = ArrangePointReactorPoint_("rec_crystal_005", SHORT_DIST);
	SetReactorEvent_(g_rec_crystal_05);
	g_rec_crystal_06 = ArrangePointReactorPoint_("rec_crystal_006", SHORT_DIST);
	SetReactorEvent_(g_rec_crystal_06);
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		ᏋC�̌��E�ɐG�ꂽ��(��1�w)
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineKekkai02()
{
	local player = GetPlayerId_();	// �v���C���[ID�擾
	
	// �t�F�[�h�A�E�g
	SetFadePlane_(FADE_PLANE.PLANE_3D);
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
	SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
	WaitFade_();
	
	SetVisible(player, true);
	SetPos_(player, Vec3(503.0, 15.0, -67.0));
	SetDir_(player, -83);
	
	// ���b�Z�[�W
	OpenMsgWnd_();
	ShowMsg_("SYS_KEKKAI_010");		// ���͂ȃG�l���M�[�o���A�ɂ����
	KeyInputWait_();
	CloseMsgWnd_();
	
	SetPlayableCamera_();
	SetCameraDir_(-83);
	Wait_(10);
	
	// �t�F�[�h�C��
	SetFade_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
	SetFadeSub_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
	WaitFade_();
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		ᏋC�̌��E�ɐG�ꂽ��(��3�w)
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineKekkai03()
{
	local player = GetPlayerId_();	// �v���C���[ID�擾
	
	// �t�F�[�h�A�E�g
	SetFadePlane_(FADE_PLANE.PLANE_3D);
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
	SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
	WaitFade_();
	
	// �����X�^�[�̔z�u��ύX
	SetEventFlg_("BFG_C00_02_IN_SENTER_LAYER", false);	// �R�A�R�w�ڂ̒��w�ȏ�ɂ���Ƃ�true,���w�ɂ���Ƃ�false�ɂȂ�t���O
	SetEventFlg_("BFG_C00_02_IN_DOWN_LAYER", true);		// �R�A�R�w�ڂ̒��w�ȏ�ɂ���Ƃ�false,���w�ɂ���Ƃ�true�ɂȂ�t���O
	
	SetVisible(player, true);
	SetPos_(player, Vec3(503.0, 15.0, -67.0));
	SetDir_(player, -83);
	
	// ���b�Z�[�W
	OpenMsgWnd_();
	ShowMsg_("SYS_KEKKAI_010");		// ���͂ȃG�l���M�[�o���A�ɂ����
	KeyInputWait_();
	CloseMsgWnd_();
	
	SetPlayableCamera_();
	SetCameraDir_(-83);
	Wait_(10);
	
	// �t�F�[�h�C��
	SetFade_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
	SetFadeSub_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
	WaitFade_();
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		�����𒲂ׂ���
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineCrystalBreak(obj, efc, mine)
{
	// �t���O�̎擾
	main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");				// Num0
	core_num	 = GetNumFlg_("NUM_SCENARIO_SUB_CORE");			// Num8
	crystal_num	 = GetNumFlg_("NUM_FLG_COUNT_BROKEN_CRYSTAL");	// Num125
	
	// �����̃��A�N�^�[�|�C���g�𒲂ׂ����ǂ����̃t���O
	local rec_flg1 = GetEventFlg_("BFG_CHECK_CRYSTAL_REC_POINT_1");	// ����1�̃��A�N�^�[�|�C���g�𒲂ׂ���	//Bit1313
	local rec_flg2 = GetEventFlg_("BFG_CHECK_CRYSTAL_REC_POINT_2");	// ����2�̃��A�N�^�[�|�C���g�𒲂ׂ���	//Bit1314
	local rec_flg3 = GetEventFlg_("BFG_CHECK_CRYSTAL_REC_POINT_3");	// ����3�̃��A�N�^�[�|�C���g�𒲂ׂ���	//Bit1315
	local rec_flg4 = GetEventFlg_("BFG_CHECK_CRYSTAL_REC_POINT_4");	// ����4�̃��A�N�^�[�|�C���g�𒲂ׂ���	//Bit1316
	local rec_flg5 = GetEventFlg_("BFG_CHECK_CRYSTAL_REC_POINT_5");	// ����5�̃��A�N�^�[�|�C���g�𒲂ׂ���	//Bit1317
	local rec_flg6 = GetEventFlg_("BFG_CHECK_CRYSTAL_REC_POINT_6");	// ����6�̃��A�N�^�[�|�C���g�𒲂ׂ���	//Bit1318
	
	local target = GetTouchEventMineId_();
	local player = GetPlayerId_();
	
	CommPlayerTurnAroundObj(obj);
	
	// ���b�Z�[�W
	OpenMsgWnd_();
	if(crystal_num == 2 || crystal_num == 5){
		ShowMsg_("SYS_KESSYOU_015");				// �����̓�������@�����̋C�z��������c�c�B
	}
	else{
		ShowMsg_("SYS_KESSYOU_010");				// �ڂ̑O�̌�����  �j�󂵂܂����H
	}
	KeyInputWait_();
	
	// �u�͂��v
	if (GetQueryResult_() == QUERY2_0) {
		CloseMsgWnd_();
		
		SetNumFlg_("NUM_FLG_COUNT_BROKEN_CRYSTAL", crystal_num = crystal_num + 1);
		
		//���t�F�[�h�A�E�g
		SetFade_(FADE_OUT, FADE_COLOR_WHITE, 10.0);
//		SetFadeSub_(FADE_OUT, FADE_COLOR_WHITE, FADE_DEF);
		WaitFade_();
		Wait_(10);
		
		// SE�Đ�
		PlaySE_("SE_FLD_064");	// �R�A�E�}�f�����C�g����������鉹
		Wait_(28);
		
		// �����I�u�W�F�N�g�ƃI�[���G�t�F�N�g�ƒn��������
		SetVisible(obj, false);
		DeleteEffectEmitter_(efc);
		DeleteEventMine_(mine);
		
		// ���j�[�NID�̏��������s��
		switch (mine) {
		case g_mine_crystal_01 :
			g_mine_crystal_01 = C_NONE_ID;
			SetEventFlg_("BFG_BREAK_CRYSTAL_1", true);	//�������󂵂�
			SetActive_(g_rec_crystal_01, false);		//�����̃��A�N�^�[�|�C���g������
			break;
		case g_mine_crystal_02 :
			g_mine_crystal_02 = C_NONE_ID;
			SetEventFlg_("BFG_BREAK_CRYSTAL_2", true);
			SetActive_(g_rec_crystal_02, false);
			break;
		case g_mine_crystal_03 :
			g_mine_crystal_03 = C_NONE_ID;
			SetEventFlg_("BFG_BREAK_CRYSTAL_3", true);
			SetActive_(g_rec_crystal_03, false);
			break;
		case g_mine_crystal_04 :
			g_mine_crystal_04 = C_NONE_ID;
			SetEventFlg_("BFG_BREAK_CRYSTAL_4", true);
			SetActive_(g_rec_crystal_04, false);
			break;
		case g_mine_crystal_05 :
			g_mine_crystal_05 = C_NONE_ID;
			SetEventFlg_("BFG_BREAK_CRYSTAL_5", true);
			SetActive_(g_rec_crystal_05, false);
			break;
		case g_mine_crystal_06 :
			g_mine_crystal_06 = C_NONE_ID;
			SetEventFlg_("BFG_BREAK_CRYSTAL_6", true);
			SetActive_(g_rec_crystal_06, false);
			break;
		default :
			DebugPrint("WARNING : MINE_ID���s���ł� [TouchEventMine]");
			break;
		}
		
		// �{�X��|���Ȃ��Ă����ꍇ�A���������S�ɔj�󂵂��t���O�𗧂Ă�
		if(crystal_num == 1 || crystal_num == 2 || crystal_num == 4 || crystal_num == 5){
			uSetCrystalCompleteFlg();
		}
		
		//�t�F�[�h�C��
		SetFade_(FADE_IN, FADE_COLOR_WHITE, FADE_DEF);
		WaitFade_();
		Wait_(10);
		
		// ���b�Z�[�W
		OpenMsgWnd_();
		ShowMsg_("SYS_KESSYOU_020");					// �}�f�̌������@�ЂƂj�󂵂��I
		KeyInputWait_();
		if(crystal_num == 1 || crystal_num == 4){
			ShowMsg_("SYS_KESSYOU_030");				// �o���A�̃G�l���M�[���@�����ቺ�����悤���B
			KeyInputWait_();
		}
		if(crystal_num == 2 || crystal_num == 5){
			ShowMsg_("SYS_KESSYOU_040");				// ���������Ł@���ł�����ꂻ�����B
			KeyInputWait_();
		}
		if(crystal_num == 3 || crystal_num == 6){
			// ���b�Z�[�W
			ShowMsg_("SYS_KESSYOU_060");				// ��������@��юU�����}�f�ɂ����
			KeyInputWait_();
		}
		CloseMsgWnd_();
		
		// ���E�̌����{�X�Ƃ̐퓬
//		if(crystal_num == 1 || crystal_num == 4){
//			SetEventFlg_("BFG_BATTLE_CRYSTAL_MONSTER", true);	// ���������X�^�[�Ɛ����(Bit1322)
//			ChangeBattleParty_(167);							// �R�A�@���E�̌����{�X�P
//		}
//		else if(crystal_num == 2 || crystal_num == 5){
//			SetEventFlg_("BFG_BATTLE_CRYSTAL_MONSTER", true);	// ���������X�^�[�Ɛ����(Bit1322)
//			ChangeBattleParty_(168);							// �R�A�@���E�̌����{�X�Q
//		}
		if(crystal_num == 3){
			SetEventFlg_("BFG_BATTLE_CRYSTAL_MONSTER", true);	// ���������X�^�[�Ɛ����(Bit1322)
			InhibitMonsterGenerate_( 10000.0 );
			ChangeBattleParty_(168);							// �R�A�@���E�̌����{�X�Q
		}
		if(crystal_num == 6){
			SetEventFlg_("BFG_BATTLE_CRYSTAL_MONSTER", true);	// ���������X�^�[�Ɛ����(Bit1322)
			InhibitMonsterGenerate_( 10000.0 );
			ChangeBattleParty_(169);							// �R�A�@���E�̌����{�X�R
		}
	}
	// �u�������v
	else {
		CloseMsgWnd_();
	}
	
	
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		���A�N�^�[�|�C���g�𒲂ׂ���
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uReactorPointCrystal(id)
{
	local rec_flg1 = GetEventFlg_("BFG_CHECK_CRYSTAL_REC_POINT_1");	// ����1�̃��A�N�^�[�|�C���g�𒲂ׂ���	//Bit1313
	local rec_flg2 = GetEventFlg_("BFG_CHECK_CRYSTAL_REC_POINT_2");	// ����2�̃��A�N�^�[�|�C���g�𒲂ׂ���	//Bit1314
	local rec_flg3 = GetEventFlg_("BFG_CHECK_CRYSTAL_REC_POINT_3");	// ����3�̃��A�N�^�[�|�C���g�𒲂ׂ���	//Bit1315
	local rec_flg4 = GetEventFlg_("BFG_CHECK_CRYSTAL_REC_POINT_4");	// ����4�̃��A�N�^�[�|�C���g�𒲂ׂ���	//Bit1316
	local rec_flg5 = GetEventFlg_("BFG_CHECK_CRYSTAL_REC_POINT_5");	// ����8�̃��A�N�^�[�|�C���g�𒲂ׂ���	//Bit1317
	local rec_flg6 = GetEventFlg_("BFG_CHECK_CRYSTAL_REC_POINT_6");	// ����6�̃��A�N�^�[�|�C���g�𒲂ׂ���	//Bit1318
	
	// �����̃I�[���G�t�F�N�g�ƒn����ݒu
	if(id == g_rec_crystal_01 && rec_flg1 == false){
		SetEventFlg_("BFG_CHECK_CRYSTAL_REC_POINT_1", true);
		g_mine_crystal_01 = SetPointCircleEventMine_("mine_crystal_001", true);
		g_efc_aura_01 = SetPointWorldEffect_("ef731_10_mag_aura_crystal", "gim_crystal_001");
		SetEffectScale_(g_efc_aura_01, EFC_DEF);
	}
	if(id == g_rec_crystal_02 && rec_flg2 == false){
		SetEventFlg_("BFG_CHECK_CRYSTAL_REC_POINT_2", true);
		g_mine_crystal_02 = SetPointCircleEventMine_("mine_crystal_002", true);
		g_efc_aura_02 = SetPointWorldEffect_("ef731_10_mag_aura_crystal", "gim_crystal_002");
		SetEffectScale_(g_efc_aura_02, EFC_DEF);
	}
	if(id == g_rec_crystal_03 && rec_flg3 == false){
		SetEventFlg_("BFG_CHECK_CRYSTAL_REC_POINT_3", true);
		g_mine_crystal_03 = SetPointCircleEventMine_("mine_crystal_003", true);
		g_efc_aura_03 = SetPointWorldEffect_("ef731_10_mag_aura_crystal", "gim_crystal_003");
		SetEffectScale_(g_efc_aura_03, EFC_DEF);
	}
	if(id == g_rec_crystal_04 && rec_flg4 == false){
		SetEventFlg_("BFG_CHECK_CRYSTAL_REC_POINT_4", true);
		g_mine_crystal_04 = SetPointCircleEventMine_("mine_crystal_004", true);
		g_efc_aura_04 = SetPointWorldEffect_("ef731_10_mag_aura_crystal", "gim_crystal_004");
		SetEffectScale_(g_efc_aura_04, EFC_DEF);
	}
	if(id == g_rec_crystal_05 && rec_flg5 == false){
		SetEventFlg_("BFG_CHECK_CRYSTAL_REC_POINT_5", true);
		g_mine_crystal_05 = SetPointCircleEventMine_("mine_crystal_005", true);
		g_efc_aura_05 = SetPointWorldEffect_("ef731_10_mag_aura_crystal", "gim_crystal_005");
		SetEffectScale_(g_efc_aura_05, EFC_DEF);
	}
	if(id == g_rec_crystal_06 && rec_flg6 == false){
		SetEventFlg_("BFG_CHECK_CRYSTAL_REC_POINT_6", true);
		g_mine_crystal_06 = SetPointCircleEventMine_("mine_crystal_006", true);
		g_efc_aura_06 = SetPointWorldEffect_("ef731_10_mag_aura_crystal", "gim_crystal_006");
		SetEffectScale_(g_efc_aura_06, EFC_DEF);
	}
	
	// ���b�Z�[�W
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_REACTOR");
	ShowMsg_("REC_KESSYOU_010");				// �u���Z�x�̃}�f��тт��@����������B
	KeyInputWait_();
	CloseMsgWnd_();
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		���E�������鉉�o
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uBreakWall(id)
{
	local player;
	player = GetPlayerId_();	// �v���C���[ID�擾
	
	// 1�w�̌��E
	if(id == 1){
		DeleteEventMine_(g_mine_kekkai_02);						// �n���폜
		g_mine_kekkai_02 = C_NONE_ID;							// ���j�[�NID�̏�����
	}
	// 3�w�̌��E
	else if(id == 2){
		DeleteEventMine_(g_mine_kekkai_03);						// �n���폜
		g_mine_kekkai_03 = C_NONE_ID;							// ���j�[�NID�̏�����
	}
	
	// �n�k���N����
	Wait_(15);
	PlaySE_("SE_FLD_129");
	StartEarthQuake_(15, 3, 0.3)
	Wait_(15);
	
	// �u�I�v�s�R��
	LoadEffect_("ef712_10_emo_surprise01");
	SurpriseDisp(player);
	Wait_(15);
	
	// �t�F�[�h�A�E�g
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
	SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
	WaitFade_();
	Wait_(10);
	
	// �J������ݒu
	// 1�w�̌��E
	if(id == 1){
		SetPointCameraEye_("cameye_002");
		SetPointCameraTarget_("camtgt_002");
	}
	// 3�w�̌��E
	else if(id == 2){
		SetPointCameraEye_("cameye_003");
		SetPointCameraTarget_("camtgt_003");
	}
	
	Wait_(10);
	
	// �t�F�[�h�C��
	SetFade_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
	WaitFade_();
	Wait_(10);
	
	// �G�t�F�N�g�̃A���t�@��"0"�ɂ��Č����Ȃ��悤�ɂ���
	// 1�w�̌��E
	if(id == 1){
		DeleteEffectEmitter_(g_efc_kekkai01);
	}
	// 3�w�̌��E
	else if(id == 2){
		DeleteEffectEmitter_(g_efc_kekkai02);
	}
	
	Wait_(90);
	
	// ���b�Z�[�W
	OpenMsgWnd_();
	ShowMsg_("SYS_KESSYOU_050");	// ���ł����悤���c�c�B
	KeyInputWait_();
	CloseMsgWnd_();
	
	// �t�F�[�h�A�E�g
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
	SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
	WaitFade_();
	Wait_(10);
	
	// �}�b�v�g���̂��߂̃y�C�����
	if(id == 1){ SetEventFlg_("BFG_OPEN_SECRET_AREA_00_C00_02", true); }
	if(id == 2){ SetEventFlg_("BFG_OPEN_SECRET_AREA_02_C00_02", true); }
	
	
	//�J������ݒu
	SetPlayableCamera_();
	Wait_(10);
	
	// �t�F�[�h�C��
	SetFade_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
	SetFadeSub_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
	WaitFade_();
	Wait_(20);
	
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


//++++++++++++++++++++++++++++++++++++++++++++++++
//		�ǂ̍����ɂ���̂����ׂ�n��
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineLayer()
{
	local layer_flg = GetEventFlg_("BFG_C00_02_SENTER_OR_DOWN_LAYER");	// �R�A�R�w�ڂ̒��w�ȏォ���w�ɂ��邩���f����t���O
	local player = GetPlayerId_();
	local pos = GetPos_(player);
	
	DebugPrint("Y���W�̒l�� " + pos.y + " �ɂȂ�܂����B");
	
	// �n������w�ɂ��邩���w�ɂ��邩�̔�����s��
	if(pos.y >= 245){
		SetEventFlg_("BFG_C00_02_SENTER_OR_DOWN_LAYER", true);
	}
	else{
		SetEventFlg_("BFG_C00_02_SENTER_OR_DOWN_LAYER", false);
	}
	
	// �t���O���Ď擾����
	layer_flg = GetEventFlg_("BFG_C00_02_SENTER_OR_DOWN_LAYER");
	DebugPrint("�t���O�̒l�� " + layer_flg + " �ɂȂ�܂����B");
	
	// �n��������w�ɋ�����
	if(layer_flg == true){
		SetEventFlg_("BFG_C00_02_IN_SENTER_LAYER", true);	// �R�A�R�w�ڂ̒��w�ȏ�ɂ���Ƃ�true,���w�ɂ���Ƃ�false�ɂȂ�t���O
		SetEventFlg_("BFG_C00_02_IN_DOWN_LAYER", false);	// �R�A�R�w�ڂ̒��w�ȏ�ɂ���Ƃ�false,���w�ɂ���Ƃ�true�ɂȂ�t���O
	}
	// ���w�ɋ�����
	else{
		SetEventFlg_("BFG_C00_02_IN_SENTER_LAYER", false);	// �R�A�R�w�ڂ̒��w�ȏ�ɂ���Ƃ�true,���w�ɂ���Ƃ�false�ɂȂ�t���O
		SetEventFlg_("BFG_C00_02_IN_DOWN_LAYER", true);		// �R�A�R�w�ڂ̒��w�ȏ�ɂ���Ƃ�false,���w�ɂ���Ƃ�true�ɂȂ�t���O
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		�}�b�v�g���̂��߂̃y�C�����������n��
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMinePane01()
{
	local pane_flg = GetEventFlg_("BFG_OPEN_SECRET_AREA_01_C00_02");
	if(pane_flg == false){
		SetEventFlg_("BFG_OPEN_SECRET_AREA_01_C00_02", true);	// �y�C���̉�����s��
		DeleteEventMine_(g_mine_pane_01);						// �n���폜
		g_mine_pane_01 = C_NONE_ID;								// ���j�[�NID�̏�����
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		���������S�ɔj�󂵂��t���O���Z�b�g����
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uSetCrystalCompleteFlg()
{
	// �������󂵂��t���O���擾
	local crystal_break1 = GetEventFlg_("BFG_BREAK_CRYSTAL_1");	// ����1���󂵂�
	local crystal_break2 = GetEventFlg_("BFG_BREAK_CRYSTAL_2");	// ����2���󂵂�
	local crystal_break3 = GetEventFlg_("BFG_BREAK_CRYSTAL_3");	// ����3���󂵂�
	local crystal_break4 = GetEventFlg_("BFG_BREAK_CRYSTAL_4");	// ����4���󂵂�
	local crystal_break5 = GetEventFlg_("BFG_BREAK_CRYSTAL_5");	// ����5���󂵂�
	local crystal_break6 = GetEventFlg_("BFG_BREAK_CRYSTAL_6");	// ����6���󂵂�
	
	// ���S�ɔj�󂵂��t���O���Z�b�g����
	if(crystal_break1 == true){ SetEventFlg_("BFG_PERFECT_BREAK_CRYSTAL_1", true); }// ����1�����S�ɔj�󂵂�
	if(crystal_break2 == true){ SetEventFlg_("BFG_PERFECT_BREAK_CRYSTAL_2", true); }// ����2�����S�ɔj�󂵂�
	if(crystal_break3 == true){ SetEventFlg_("BFG_PERFECT_BREAK_CRYSTAL_3", true); }// ����3�����S�ɔj�󂵂�
	if(crystal_break4 == true){ SetEventFlg_("BFG_PERFECT_BREAK_CRYSTAL_4", true); }// ����4�����S�ɔj�󂵂�
	if(crystal_break5 == true){ SetEventFlg_("BFG_PERFECT_BREAK_CRYSTAL_5", true); }// ����5�����S�ɔj�󂵂�
	if(crystal_break6 == true){ SetEventFlg_("BFG_PERFECT_BREAK_CRYSTAL_6", true); }// ����6�����S�ɔj�󂵂�
}

//++++++++++++++++++++++++++++++++++++++++++++++++
// �R�A�Ő[���i���֎~����  Redmine#2664
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uNotEnterRoomMsg()
{
	// �v���C���[�̕��A�ʒu
	local pl_return_pos = Vec3(57.993, 0.000, 23.173);;
	local pl_return_dir = 75;
	// ���b�Z�[�W�{�b�N�X�����̊K�w���Ó]����悤�ɐݒ�
	SetFadePlane_(FADE_PLANE.PLANE_3D);
	CommChangeMomentFadeOut(FADE_COLOR_WHITE);
	// ���b�Z�[�W
	OpenMsgWnd_();
	ShowMsg_("NOT_ENTER_MSG");
	KeyInputWait_();
	CloseMsgWnd_();
	// �Ó]
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
	SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
	WaitFade_();
	// �K�w��߂��Ă���
	SetFadePlane_(FADE_PLANE.PLANE_NORMAL);
	// �R�A�˓����ֈړ�
	ChangeMapPosDir_("C00_00", pl_return_pos, pl_return_dir);
}
