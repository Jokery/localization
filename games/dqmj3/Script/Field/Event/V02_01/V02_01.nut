//===================== V02_01�閧��nB1F(�G�C���A�X���[��) ====================
// �ϐ���`
main_num	 <- C_NONE_ID;
volcano_num	 <- C_NONE_ID;
player <- C_NONE_ID;

str_num_sub <- "NUM_SCENARIO_SUB_VOLCANO";

//------------------------------------------------
//		�퓬�I����
//------------------------------------------------
function AfterBattle()
{
	main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");
	volcano_num	 = GetNumFlg_("NUM_SCENARIO_SUB_VOLCANO");

	if (main_num == GetFlagID_("CONST_SM_VOLCANO"))										// Num0 = 6 
	{
		if (volcano_num == GetFlagID_("CONST_SS_HV_JDG_BATTLE_PROMETHEUS")) 			// Num7 = 27
		{
			// �v�����e�E�X�ɔs�k
			if(GetBattleEndType_() == END_TYPE_LOSE)
			{
				SetNumFlg_(str_num_sub, GetFlagID_("CONST_SS_HV_CONTACT_PROMETHEUS"));	// Num7 <- 28
			}
		}
		//�Đ펞
		if (volcano_num == GetFlagID_("CONST_SS_HV_JDG_REMATCH_PROMETHEUS")) 			// Num7 = 30
		{
			// �v�����e�E�X�ɔs�k
			if(GetBattleEndType_() == END_TYPE_LOSE)
			{
				SetNumFlg_(str_num_sub, GetFlagID_("CONST_SS_HV_CONTACT_PROMETHEUS"));	// Num7 <- 28
			}
		}
	}
	EventEnd_();
}

//------------------------------------------------
//		�}�b�v�ɓ���O
//------------------------------------------------
function BeforeInitMap()
{
	main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");
	volcano_num	 = GetNumFlg_("NUM_SCENARIO_SUB_VOLCANO");
	
	/*
		�����Ȃ�
	*/
	
	EventEnd_();
}

//------------------------------------------------
//		�t�F�[�h�A�E�g��
//------------------------------------------------
function FadeIn()
{
	//�}�b�v���B�t���O
	SetEventFlg_("BFG_ARRIVE_AT_V00", true);

	local check_dead	= GetEventFlg_("BFG_DEAD_RETURN");
	main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");
	volcano_num	 = GetNumFlg_("NUM_SCENARIO_SUB_VOLCANO");
	
	DebugPrint(" ");
	DebugPrint("NUM_SCENARIO_MAIN �̒l�� " + main_num + " �ɂȂ�܂����B");
	DebugPrint("NUM_SCENARIO_SUB_VOLCANO �̒l�� " + volcano_num + " �ɂȂ�܂����B");

	//---------------
	// ���M�~�b�N�z�u
	//---------------
	// ID������
	g_gmk_elevator_door <- C_NONE_ID;
	g_gmk_elevator_lift <- C_NONE_ID;
	g_gmk_door01 <- C_NONE_ID;
	g_gmk_door02 <- C_NONE_ID;
	g_gmk_door03 <- C_NONE_ID;
//	g_gmk_case01 <- C_NONE_ID;
//	g_gmk_case02 <- C_NONE_ID;
//	g_gmk_case03 <- C_NONE_ID;
//	g_gmk_case04 <- C_NONE_ID;
//	g_gmk_case05 <- C_NONE_ID;
//	g_gmk_case06 <- C_NONE_ID;
//	g_gmk_case07 <- C_NONE_ID;
//	g_gmk_case08 <- C_NONE_ID;
//	g_gmk_case09 <- C_NONE_ID;
//	g_gmk_case10 <- C_NONE_ID;
//	g_gmk_case11 <- C_NONE_ID;
//	g_gmk_case12 <- C_NONE_ID;
//	g_gmk_case13 <- C_NONE_ID;
//	g_gmk_case14 <- C_NONE_ID;
	g_gmk_monitor <- C_NONE_ID;
	g_gmk_ruler_point <- C_NONE_ID;
	
	// ���\�[�X�ǂݍ���
	local id_elevator_door = ReadGimmick_("o_V02_02");	// �G���x�[�^�̔�
	local id_elevator_lift = ReadGimmick_("o_V02_03");	// �G���x�[�^�̃��t�g
	local id_door = ReadGimmick_("o_V02_09");	// ��
	local id_case = ReadGimmick_("o_V02_10");	// �R�[���h�X���[�v�̃P�[�X
	local id_monitor = ReadGimmick_("o_V02_11");	// �R���s���[�^�̖���
	local id_cold_sleeper = ReadGimmick_("o_V02_12");	// �R�[���h�X���[�v(��l���p)
	local id_case_flashing = ReadGimmick_("o_V02_13");	// �R�[���h�X���[�v�̖���
	local id_rulerpoint = ReadGimmick_("o_com_08");	// ���[���|�C���g
	
	// ���G���x�[�^�̔�
	g_gmk_elevator_door = ArrangePointGimmick_("o_V02_02", id_elevator_door, "gmk_elevator_door");
	
	// ���G���x�[�^�̃��t�g
	g_gmk_elevator_lift = ArrangePointGimmick_("o_V02_03", id_elevator_lift, "gmk_elevator_lift");
	
	// �����@�|�B(���ׂ�ƊJ���E�}�b�v�؂�ւ����ɕ�����Ԃ���n�܂�)
	if(GetEventFlg_("BFG_CHECK_AUTO_DOOR_1") == false){
		g_gmk_door01 = ArrangePointGimmick_("o_V02_09", id_door, "gmk_door01");
		SetMotion_(g_gmk_door01, MOT_GIMMICK_0, BLEND_N);
	}
	if(GetEventFlg_("BFG_CHECK_AUTO_DOOR_2") == false){
		g_gmk_door02 = ArrangePointGimmick_("o_V02_09", id_door, "gmk_door02");
		SetMotion_(g_gmk_door02, MOT_GIMMICK_0, BLEND_N);
	}
	if(GetEventFlg_("BFG_CHECK_AUTO_DOOR_3") == false){
		g_gmk_door03 = ArrangePointGimmick_("o_V02_09", id_door, "gmk_door03");
		SetMotion_(g_gmk_door03, MOT_GIMMICK_0, BLEND_N);
	}
	
	// ���R�[���h�X���[�v�̃P�[�X(�f�U�C���z�u�ɂȂ����̂ŃR�����g�� < Redmine#3785 >)
//	g_gmk_case01 = ArrangePointGimmick_("o_V02_10", id_case, "gmk_case01");
//	g_gmk_case02 = ArrangePointGimmick_("o_V02_10", id_case, "gmk_case02");
//	g_gmk_case03 = ArrangePointGimmick_("o_V02_10", id_case, "gmk_case03");
//	g_gmk_case04 = ArrangePointGimmick_("o_V02_10", id_case, "gmk_case04");
//	g_gmk_case05 = ArrangePointGimmick_("o_V02_10", id_case, "gmk_case05");
//	g_gmk_case06 = ArrangePointGimmick_("o_V02_10", id_case, "gmk_case06");
//	g_gmk_case07 = ArrangePointGimmick_("o_V02_10", id_case, "gmk_case07");
//	g_gmk_case08 = ArrangePointGimmick_("o_V02_10", id_case, "gmk_case08");
//	g_gmk_case09 = ArrangePointGimmick_("o_V02_10", id_case, "gmk_case09");
//	g_gmk_case10 = ArrangePointGimmick_("o_V02_10", id_case, "gmk_case10");
//	g_gmk_case11 = ArrangePointGimmick_("o_V02_10", id_case, "gmk_case11");
//	g_gmk_case12 = ArrangePointGimmick_("o_V02_10", id_case, "gmk_case12");
//	g_gmk_case13 = ArrangePointGimmick_("o_V02_10", id_case, "gmk_case13");
//	g_gmk_case14 = ArrangePointGimmick_("o_V02_10", id_case, "gmk_case14");
	
	// ���R���s���[�^�̖���
	g_gmk_monitor = ArrangePointGimmick_("o_V02_11", id_monitor, "gmk_monitor");
	
	// ���R�[���h�X���[�v(��l���p)gmk_cold_sleeper
	local g_gmk_cold_sleeper = ArrangePointGimmick_("o_V02_12", id_cold_sleeper, "gmk_cold_sleeper");
	
	// ���R�[���h�X���[�v�̃P�[�X�̖���
	local g_gmk_case_flashing = ArrangePointGimmick_("o_V02_13", id_case_flashing, "gmk_case_flashing");

	// �����[���|�C���g
	g_gmk_ruler_point = ArrangePointGimmick_("o_com_08", id_rulerpoint, "gmk_ruler_point");
	SetMotion_(g_gmk_ruler_point, MOT_GIMMICK_0, BLEND_N);
	if(GetEventFlg_("BFG_RULER_ADD_023") == true){
		SetMotion_(g_gmk_ruler_point, MOT_GIMMICK_2, BLEND_N);
	}

	//-----------
	// ��NPC�z�u
	//-----------
	// ID������
	g_birdy		 <- C_NONE_ID;
	g_renerte	 <- C_NONE_ID;
	g_darkmaster <- C_NONE_ID;
	g_prometheus <- C_NONE_ID;
	
	// ���R�[���h�X���[�v��Ԃ̎�l��
	local cold_sleeper = ReadAndArrangePointNpc("n040", "npc_cold_sleeper");
	local sleep_motion = ReadMotion_(cold_sleeper, "n010_cold_sleep_L"); // ��풓���[�V����(���u�����V)
	SetMotion_(cold_sleeper, sleep_motion, BLEND_N);
	SetFace_(cold_sleeper, "Face_loop_close02");
	SetTalkEnable_(cold_sleeper, false);
	
	// ���o�[�f�B
	if (main_num == GetFlagID_("CONST_SM_VOLCANO")){						// Num0 = 6
		//�v�����e�E�X�Đ펞
		if (volcano_num == GetFlagID_("CONST_SS_HV_CONTACT_PROMETHEUS")){	// Num7 = 28
			local id_birdy = ReadNpc_("n019");
			g_birdy = ArrangePointNpc_(id_birdy, "birdy01");
			SetReactorMsg_(g_birdy, "VOLCANO_BIRDY_REC");
			SetTalkEnable_(g_birdy, false);
			SetScaleSilhouette(g_birdy, SCALE.N, SILHOUETTE_WIDTH.N);
		}
		//�v�����e�E�X�����`Demo534[�R�A�ɒe�����h����]�̍Đ���܂�
		if (volcano_num >= GetFlagID_("CONST_SS_HV_TALK_GIRL_1")				// Num7 >= 31
		&& volcano_num <= GetFlagID_("CONST_SS_HV_PRE_LAUNCH_PAD_DEMO_5")){		// Num7 <= 39
			local id_birdy = ReadNpc_("n019");
			g_birdy = ArrangePointNpc_(id_birdy, "birdy02");
			SetReactorMsg_(g_birdy, "VOLCANO_BIRDY_REC");
			SetTalkCameraType_(g_birdy, TALK_CAMERA_UP);				//�J�����̐ݒ�
			SetScaleSilhouette(g_birdy, SCALE.N, SILHOUETTE_WIDTH.N);	//�T�C�Y�̐ݒ�
		}
		if(volcano_num >= GetFlagID_("CONST_SS_HV_GO_TO_THE_TOEWR")){		// Num7 >= 40
			local id_birdy = ReadNpc_("n019");
			g_birdy = ArrangePointNpc_(id_birdy, "birdy01");
			SetReactorMsg_(g_birdy, "VOLCANO_BIRDY_REC");
			SetTalkCameraType_(g_birdy, TALK_CAMERA_UP);
			SetScaleSilhouette(g_birdy, SCALE.N, SILHOUETTE_WIDTH.N);
		}
	}
	// �ΎR�N���A��
	if (main_num >= GetFlagID_("CONST_SM_CORE")){
		local id_birdy = ReadNpc_("n019");
		g_birdy = ArrangePointNpc_(id_birdy, "birdy01");
		SetReactorMsg_(g_birdy, "VOLCANO_BIRDY_REC");
		SetTalkCameraType_(g_birdy, TALK_CAMERA_UP);				//�J�����̐ݒ�
		SetScaleSilhouette(g_birdy, SCALE.N, SILHOUETTE_WIDTH.N);	//�T�C�Y�̐ݒ�
	}
	
	// �����i�[�e
	if (main_num == GetFlagID_("CONST_SM_VOLCANO")){						// Num0 = 6
		//�v�����e�E�X�Đ펞
		if (volcano_num == GetFlagID_("CONST_SS_HV_CONTACT_PROMETHEUS")){	// Num7 = 28
			local id_renerte = ReadNpc_("n007");
			g_renerte = ArrangePointNpc_(id_renerte, "renerte01");
			SetReactorMsg_(g_renerte, "VOLCANO_RENERTE_REC");
			SetTalkEnable_(g_renerte, false);
			// ��b�J�������ɓ��߂����̂ŃA���t�@�l��ݒ肷��
			SetManualCalcAlpha_(g_renerte, true);
			SetAlpha_(g_renerte, 1.0);
		}
		//�v�����e�E�X�����`Demo533[�ړ����u �R�A�N��]�̍Đ���܂�
		if (volcano_num >= GetFlagID_("CONST_SS_HV_TALK_GIRL_1")			// Num7 31�`40�܂�
		&& volcano_num < GetFlagID_("CONST_SS_HV_CLEAR_HEAT_VOLCANO")){
			// NPC�̔z�u
			local id_renerte = ReadNpc_("n007");
			if(volcano_num <= GetFlagID_("CONST_SS_HV_TALK_GIRL_2")){ // Num7 31�`33
				// �G�C���A�X���[��
				if(volcano_num == GetFlagID_("CONST_SS_HV_TALK_GIRL_1")){ // Num7 31
					g_renerte = ArrangePointNpc_(id_renerte, "renerte02");
				}
				else if(volcano_num == GetFlagID_("CONST_SS_HV_TALK_GIRL_2")){ // Num7 33
					g_renerte = ArrangePointNpc_(id_renerte, "renerte03");
				}
				else{
					g_renerte = ArrangePointNpc_(id_renerte, "renerte02");
				}
			}
			else{
				// ���̕���
				g_renerte = ArrangePointNpc_(id_renerte, "renerte04");
			}
			
			// NPC�̐ݒ�
			SetReactorMsg_(g_renerte, "VOLCANO_RENERTE_REC");
			if(volcano_num == GetFlagID_("CONST_SS_HV_TALK_GIRL_1")){ // Num7 >= 31
				SetTalkTurn_ (g_renerte, false);
			}
			else if(volcano_num == GetFlagID_("CONST_SS_HV_TALK_GIRL_2")){ // Num7 >= 33
				SetDir_(g_renerte, -100);
				SetTalkTurn_ (g_renerte, false);
			}
			else{
				SetTalkCameraType_(g_renerte, TALK_CAMERA_UP); //�J�����̐ݒ�
			}
			// ��b�J�������ɓ��߂����̂ŃA���t�@�l��ݒ肷��
			SetManualCalcAlpha_(g_renerte, true);
			SetAlpha_(g_renerte, 1.0);
		}
	}
	
	// ���_�[�N�}�X�^�[�E�v�����e�E�X
	if (main_num == GetFlagID_("CONST_SM_VOLCANO")){						// Num0 = 6
		//�v�����e�E�X�Đ펞
		if (volcano_num == GetFlagID_("CONST_SS_HV_CONTACT_PROMETHEUS")){	// Num7 = 28
			// ���_�[�N�}�X�^�[
			local g_id_darkmaster = ReadNpc_("n008");//�_�[�N�}�X�^�[
			g_darkmaster = ArrangePointNpc_(g_id_darkmaster, "darkmaster01");
			SetReactorMsg_(g_darkmaster, "VOLCANO_DARKMASTER_REC");
			SetTalkEnable_(g_darkmaster, false);
			// ���v�����e�E�X
			local g_id_prometheus = ReadNpc_("m190_00");//�v�����e�E�X
			g_prometheus = ArrangePointNpc_(g_id_prometheus, "prometheus01");
			SetScaleSilhouette(g_prometheus, SCALE.M, SILHOUETTE_WIDTH.M);
			SetReactorMsg_(g_prometheus, "VOLCANO_PROMETHEUS_REC");
			SetTalkEnable_(g_prometheus, false);
			// �v�����e�E�X�̃I�[��
			LoadEffect_("ef730_01_oth_dark_aura01");
			local efect = SetBoneEffect_("ef730_01_oth_dark_aura01", g_prometheus);
		}
	}
	
	//-----------
	// ���n���z�u
	//-----------
	// ID������
	g_mine_sleep       <- C_NONE_ID;
	g_mine_elevator    <- C_NONE_ID;
	g_mine01           <- C_NONE_ID;
	g_mine_door01      <- C_NONE_ID;
	g_mine_door02      <- C_NONE_ID;
	g_mine_door03      <- C_NONE_ID;
	g_mine_ruler_point <- C_NONE_ID;
	
	// ���R�[���h�X���[�v��Ԃ̎�l��
	g_mine_sleep = SetPointCircleEventMine_("mine_sleep", true);
	
	// ���G���x�[�^�[�̃}�b�v�`�F���W�n��
	g_mine_elevator = SetPointBoxEventMine_("mine_elevator", true);
	
	// ��������
	if(GetEventFlg_("BFG_CHECK_AUTO_DOOR_1") == false){
		g_mine_door01 = SetPointCircleEventMine_("mine_door01", true);
	}
	if(GetEventFlg_("BFG_CHECK_AUTO_DOOR_2") == false){
		g_mine_door02 = SetPointCircleEventMine_("mine_door02", true);
	}
	if(GetEventFlg_("BFG_CHECK_AUTO_DOOR_3") == false){
		g_mine_door03 = SetPointCircleEventMine_("mine_door03", true);
	}
	
	// ���C�x���g�n��
	if (main_num == GetFlagID_("CONST_SM_VOLCANO")){							// Num0 = 6
		if (volcano_num == GetFlagID_("CONST_SS_HV_ENTER_THE_ALIAS_ROOM")){		// Num7 = 25
			// �f��522[�G�C���A�X]���Đ�����n��
			g_mine01 = SetPointBoxEventMine_("mine01", false);
		}
		else if(volcano_num == GetFlagID_("CONST_SS_HV_CONTACT_PROMETHEUS")){	// Num7 = 28
			// �f��523[�v�����e�E�X�Đ�]���Đ�����n��
			g_mine01 = SetPointBoxEventMine_("mine01", false);
		}
	}
	// �����[���|�C���g
	g_mine_ruler_point = SetPointCircleEventMine_("mine_ruler_point", true);

	//------------
	//���}�b�v�i�r
	//------------
	// ���[���|�C���g
	if(GetEventFlg_("BFG_RULER_ADD_023") == true){
		local icon01 = ArrangePointNaviMapIcon_(NAVIMAP_ICON.RULER_POINT , "gmk_ruler_point");
		SetNaviMapIconVisible_(icon01, true);
	}
	// ��(�I�}�[�N�A�C�R��)
	if(GetEventFlg_("BFG_CHECK_AUTO_DOOR_1") == false){
		icon02 <- ArrangePointNaviMapIcon_(NAVIMAP_ICON.EXCLAMATION , "icon_door_01");
		SetNaviMapIconVisible_(icon02, true);
	}
	// ��(�I�}�[�N�A�C�R��)
	if(GetEventFlg_("BFG_CHECK_AUTO_DOOR_2") == false){
		icon03 <- ArrangePointNaviMapIcon_(NAVIMAP_ICON.EXCLAMATION , "icon_door_02");
		SetNaviMapIconVisible_(icon03, true);
	}
	// ��(�I�}�[�N�A�C�R��)
	if(GetEventFlg_("BFG_CHECK_AUTO_DOOR_3") == false){
		icon04 <- ArrangePointNaviMapIcon_(NAVIMAP_ICON.EXCLAMATION , "icon_door_03");
		SetNaviMapIconVisible_(icon04, true);
	}

	//--------------------
	//�����A�N�^�[�|�C���g
	//--------------------
	// �G���x�[�^
	local reactorPoint01 = ArrangeMsgReactorPoint("reactorpoint01", GetFlagID_("BFG_REACTER_POINT_085")
		, SHORT_DIST, "REC_POINT_01_01", "REC_POINT_01_02");
	// �R�[���h�X���[�v
	local reactorPoint02_a = ArrangeMsgReactorPoint("reactorpoint02_01", GetFlagID_("BFG_REACTER_POINT_086")
		, SHORT_DIST, "REC_POINT_02_01", "REC_POINT_02_02");
	local reactorPoint02_b = ArrangeMsgReactorPoint("reactorpoint02_02", GetFlagID_("BFG_REACTER_POINT_086")
		, SHORT_DIST, "REC_POINT_02_01", "REC_POINT_02_02");
	local reactorPoint02_c = ArrangeMsgReactorPoint("reactorpoint02_03", GetFlagID_("BFG_REACTER_POINT_086")
		, SHORT_DIST, "REC_POINT_02_01", "REC_POINT_02_02");
	local reactorPoint02_d = ArrangeMsgReactorPoint("reactorpoint02_04", GetFlagID_("BFG_REACTER_POINT_086")
		, SHORT_DIST, "REC_POINT_02_01", "REC_POINT_02_02");
	local reactorPoint02_e = ArrangeMsgReactorPoint("reactorpoint02_05", GetFlagID_("BFG_REACTER_POINT_086")
		, SHORT_DIST, "REC_POINT_02_01", "REC_POINT_02_02");
	local reactorPoint02_f = ArrangeMsgReactorPoint("reactorpoint02_06", GetFlagID_("BFG_REACTER_POINT_086")
		, SHORT_DIST, "REC_POINT_02_01", "REC_POINT_02_02");
	local reactorPoint02_g = ArrangeMsgReactorPoint("reactorpoint02_07", GetFlagID_("BFG_REACTER_POINT_086")
		, SHORT_DIST, "REC_POINT_02_01", "REC_POINT_02_02");
	local reactorPoint02_h = ArrangeMsgReactorPoint("reactorpoint02_08", GetFlagID_("BFG_REACTER_POINT_086")
		, SHORT_DIST, "REC_POINT_02_01", "REC_POINT_02_02");
	// �G�C���A�X���u
	local reactorPoint03 = ArrangeMsgReactorPoint("reactorpoint03", GetFlagID_("BFG_REACTER_POINT_087")
		, SHORT_DIST, "REC_POINT_03_01", "REC_POINT_03_02");
	// ���[���|�C���g
	local reactorPoint04 = ArrangeMsgReactorPoint("reactorpoint04", GetFlagID_("BFG_REACTER_POINT_010")
		, SHORT_DIST, "REC_POINT_04_01", "REC_POINT_04_02");

	//------------------------------------------
	// demo527[�W���[�J�[�v��]�Đ���̃J�����ݒ�
	//------------------------------------------
	if(main_num == GetFlagID_("CONST_SM_VOLCANO")){ // Num0 = 6
		if(volcano_num == GetFlagID_("CONST_SS_HV_GO_TO_THE_TOEWR")){ // Num7 = 40
			if(GetEventFlg_("BFG_CAMERA_DIR_FIX") == true){
				SetEventFlg_("BFG_CAMERA_DIR_FIX", false);
				SetCameraDir_(90);
			}
		}
	}

	//---------------------
	// ���a�f�l��ݒ�
	//---------------------
	if(main_num == GetFlagID_("CONST_SM_VOLCANO")){					// Num 0 == 6
		if(volcano_num == GetFlagID_("CONST_SS_HV_TALK_GIRL_1")){	// Num10 == 31
			// �����ɂ���
			SetEventFlg_("BFG_V02_01_EVENT_BGM_NONE", true);
			// �yBGM_009�z��炳�Ȃ�
			SetEventFlg_("BFG_V02_01_EVENT_BGM009_PLAY", false);
		}
		else if(volcano_num == GetFlagID_("CONST_SS_HV_TALK_GIRL_2")// Num10 == 33
		|| volcano_num == GetFlagID_("CONST_SS_HV_TALK_GIRL_3")){	// Num10 == 34
			// �����ɂ��Ȃ�
			SetEventFlg_("BFG_V02_01_EVENT_BGM_NONE", false);
			// �yBGM_009�z��炷
			SetEventFlg_("BFG_V02_01_EVENT_BGM009_PLAY", true);
		}
		else{
			// �����ɂ��Ȃ�
			SetEventFlg_("BFG_V02_01_EVENT_BGM_NONE", false);
			// �yBGM_009�z��炳�Ȃ�
			SetEventFlg_("BFG_V02_01_EVENT_BGM009_PLAY", false);
		}
	}
	else{
		// �����ɂ��Ȃ�
		SetEventFlg_("BFG_V02_01_EVENT_BGM_NONE", false);
		// �yBGM_009�z��炳�Ȃ�
		SetEventFlg_("BFG_V02_01_EVENT_BGM009_PLAY", false);
	}

	EventEnd_();
}	

//--------------------------------------------------
//		�m�o�b�ڐG���钼�O( TouchNpc()�̒��O�ɋN�� )
//--------------------------------------------------
function BeforeTalkNpc()
{
	local target = GetTargetId_();
	
	// ���C�h���Ƀ��i�[�e�ɘb�����������͎��_�̃I�t�Z�b�g�l��Y���݂̂�ύX����
	// �y���Y�^�z�unpc_info.nut�v�Ŏ��_�ƒ����_�̃I�t�Z�b�g�l�����_�̒������Ă��܂��B
	//            �Ȃ̂ŁA�R�R�ōs�����_�̃I�t�Z�b�g�l�ύX�́unpc_info.nut�v�Ō��_���������l����
	//            ����ɒ������邱�ƂɂȂ�̂ŕύX���鎞�͗v���ӁB
	if(target == g_renerte){
		SetRideTalkCamOffset(OFFSET_RENATE);
	}

	EventEnd_();
}

//------------------------------------------------
//		�m�o�b�ڐG��
//------------------------------------------------
function TouchNpc()
{
	main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");			// Num0
	volcano_num	 = GetNumFlg_("NUM_SCENARIO_SUB_VOLCANO");	// Num6
	
	local target = GetTargetId_();
	
	DebugPrint(" ");
	DebugPrint("ID: " + target + " �ɐڐG [TouchNpc]");
	
	switch (target)
	{
	case g_birdy:						//�o�[�f�B
		uTalkbirdy();
		break;
	case g_renerte:						//���i�[�e
		uTalkrenerte();
		break;	
//	case g_darkmaster:					//�_�[�N�}�X�^�[
//		uTalkdarkmaster();
//		break;
//	case g_prometheus:					//�v�����e�E�X
//		uTalkprometheus();
//		break;
	default :
		DebugPrint("WARNING : NPC_ID���s���ł� [TouchNpc]");
		break;
	}
	
	EventEnd_();
}

//------------------------------------------------
//	�C�x���g�n���ڐG��
//------------------------------------------------
function TouchEventMine()
{
	main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");
	volcano_num	 = GetNumFlg_("NUM_SCENARIO_SUB_VOLCANO");
	
	local target = GetTouchEventMineId_();
	
	DebugPrint(" ");
	DebugPrint("ID: " + target + " �ɐڐG [TouchEventMine]");
	
	switch (target) {
	case g_mine_sleep :					//�R�[���h�X���[�v��Ԃ̎�l��
		uMineSleep();
		break;
	case g_mine_elevator :				//�G���x�[�^�[�𒲂ׂ��Ƃ�
		local pl_dir = -90;
		CommPlayerTurnAroundDir(pl_dir);
		uMineElevator();
		break;
	case g_mine_door01 :
		local pl_dir = 90;
		CommPlayerTurnAroundDir(pl_dir);
		SetEventFlg_("BFG_CHECK_AUTO_DOOR_1", true);
		uMineDoor01();
		break;
	case g_mine_door02 :
		local pl_dir = 90;
		CommPlayerTurnAroundDir(pl_dir);
		SetEventFlg_("BFG_CHECK_AUTO_DOOR_2", true);
		uMineDoor02();
		break;
	case g_mine_door03 :
		local pl_dir = 90;
		CommPlayerTurnAroundDir(pl_dir);
		SetEventFlg_("BFG_CHECK_AUTO_DOOR_3", true);
		uMineDoor03();
		break;
	case g_mine01 :						//�f��522[�G�C���A�X]���Đ�����n��
		uMine01();
		break;	
	case g_mine_ruler_point:
		// ���[���|�C���g�̋��ʏ���
		CommPlayerTurnAroundObj(g_gmk_ruler_point);
		CommRulerPointEvent(g_gmk_ruler_point, "BFG_RULER_ADD_023", "gmk_ruler_point");
	default :
		DebugPrint("WARNING : MINE_ID���s���ł� [TouchEventMine]");
		break;
	}
	EventEnd_();
}

//------------------------------------------------
//		�t�B�[���h����J�n
//------------------------------------------------
function EventStartOperate()
{
	main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");
	volcano_num	 = GetNumFlg_("NUM_SCENARIO_SUB_VOLCANO");
	
	//-------------
	// ���f���Đ�
	//-------------
	//	<!-- ��demo526[�A���Z�X����̓`��]�� -->
	//demo525�̒���ɔ��� ��function uTalkrenerte���Q��
	if (main_num == GetFlagID_("CONST_SM_VOLCANO")){	// Num7 = 32
		if (volcano_num  ==  GetFlagID_("CONST_SS_HV_PRE_ANSESU_DEMO")){
			SetFade_(FADE_OUT, FADE_COLOR_WHITE, FADE_SHORT);    // ���ʂ͔��Ó](��z�f���̈�)
			SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT); // ����ʂ͍��Ó]
			SetNumFlg_(str_num_sub, GetFlagID_("CONST_SS_HV_TALK_GIRL_2"));
			SetReturnDemoPosDir_(Vec3(25.605, 4.401, -26.526), 108);
			ChangeDemo_(526);
		}
	}
	//	<!-- ��demo529[�ړ����u���ˑ䂪�o��]�� -->
	//demo528�̒���ɔ��� ��function uTalkrenerte���Q��
	if (main_num == GetFlagID_("CONST_SM_VOLCANO")){	// Num7 = 36
		if (volcano_num  ==  GetFlagID_("CONST_SS_HV_PRE_LAUNCH_PAD_DEMO_1")){
			SetNumFlg_(str_num_sub, GetFlagID_("CONST_SS_HV_PRE_LAUNCH_PAD_DEMO_4"));
			EventStartChangeDemo(529, FADE_COLOR_BLACK);
		}
	}
/*
//*************************************
// �V�i���I�u�b�N�̕ύX�ō폜(2015/8/6)
//*************************************
	//	<!-- ��demo530[�閧��n ���˃X�C�b�`�n�m]�� -->
	//demo529�̒���ɔ���
	if (main_num == GetFlagID_("CONST_SM_VOLCANO")){	// Num7 = 37
		if (volcano_num  ==  GetFlagID_("CONST_SS_HV_PRE_LAUNCH_PAD_DEMO_2")){
			SetNumFlg_(str_num_sub, GetFlagID_("CONST_SS_HV_PRE_LAUNCH_PAD_DEMO_3"));
			EventStartChangeDemo(530, FADE_COLOR_BLACK);
		}
	}
	//	<!-- ��demo531[�閧��n ���˃X�C�b�`�n�m]�� -->
	//demo530�̒���ɔ���
	if (main_num == GetFlagID_("CONST_SM_VOLCANO")){	// Num7 = 38
		if (volcano_num  ==  GetFlagID_("CONST_SS_HV_PRE_LAUNCH_PAD_DEMO_3")){
			SetNumFlg_(str_num_sub, GetFlagID_("CONST_SS_HV_PRE_LAUNCH_PAD_DEMO_4"));
			EventStartChangeDemo(531, FADE_COLOR_BLACK);
		}
	}
*/
	//	<!-- ��demo534[�R�A�ɒe�����h����]�� -->
	//demo531�̒���ɔ���
	if (main_num == GetFlagID_("CONST_SM_VOLCANO")){	// Num7 = 39
		if (volcano_num  ==  GetFlagID_("CONST_SS_HV_PRE_LAUNCH_PAD_DEMO_4")){
			SetNumFlg_(str_num_sub, GetFlagID_("CONST_SS_HV_PRE_LAUNCH_PAD_DEMO_5"));
			EventStartChangeDemo(534, FADE_COLOR_BLACK);
		}
	}
	//	<!-- ��demo532[�閧��n �����s�����I]�� -->
	//demo534�̒���ɔ���
	if (main_num == GetFlagID_("CONST_SM_VOLCANO")){	// Num7 = 40
		if (volcano_num  ==  GetFlagID_("CONST_SS_HV_PRE_LAUNCH_PAD_DEMO_5")){
			SetNumFlg_(str_num_sub, GetFlagID_("CONST_SS_HV_GO_TO_THE_TOEWR"));
			SetReturnDemoPosDir_(Vec3(553.288, 0.000, -33.215), 120);
			EventStartChangeDemo(532, FADE_COLOR_BLACK);
		}
	}

	//-------------
	// ���퓬�J�n
	//-------------
	// �C�x���g��[�v�����e�E�X��]
	if (main_num == GetFlagID_("CONST_SM_VOLCANO")){							// Num0 = 6
		if (volcano_num == GetFlagID_("CONST_SS_HV_PRE_BATTLE_PROMETHEUS")){	// Num7 = 26
			SetNumFlg_(str_num_sub, GetFlagID_("CONST_SS_HV_JDG_BATTLE_PROMETHEUS")); // Num7 26��27
			// �v�����e�E�X��
			ChangeBattleParty_(19);
		}
	}
	// �C�x���g��[�v�����e�E�X�Đ�]
	if (main_num == GetFlagID_("CONST_SM_VOLCANO")){							// Num0 = 6
		if (volcano_num == GetFlagID_("CONST_SS_HV_PRE_REMATCH_PROMETHEUS")){	// Num7 = 29
			SetNumFlg_(str_num_sub, GetFlagID_("CONST_SS_HV_JDG_REMATCH_PROMETHEUS")); // Num7 29��30
			// �v�����e�E�X��
			ChangeBattleParty_(19);
		}
	}

	//-------------
	// ���퓬����
	//-------------
	if (main_num == GetFlagID_("CONST_SM_VOLCANO")){							// Num0 = 6
		// ����
		if(volcano_num == GetFlagID_("CONST_SS_HV_JDG_BATTLE_PROMETHEUS")){		// Num7 = 27
			if(GetBattleEndType_() == BATTLE_END_TYPE_WIN){
				// �v�����e�E�X�ɏ���
				uWinPrometheus();
			}
			else{
				// �v�����e�E�X�ɔs�k
				// �����ł̓v�����e�E�X��̔s�k���肪�ł��Ȃ��̂�
				// �C�x���g�u���b�N��AfterBattle()�Ŕs�k�̔���ƃt���O�ύX���s���B
			}
		}
		//�Đ펞
		else if(volcano_num == GetFlagID_("CONST_SS_HV_JDG_REMATCH_PROMETHEUS")){ // Num7 = 30
			if(GetBattleEndType_() == BATTLE_END_TYPE_WIN){
				// �v�����e�E�X�ɏ���
				uWinPrometheus();
			}
			else{
				// �v�����e�E�X�ɔs�k
				// �����ł̓v�����e�E�X��̔s�k���肪�ł��Ȃ��̂�
				// �C�x���g�u���b�N��AfterBattle()�Ŕs�k�̔���ƃt���O�ύX���s���B
			}
		}
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
//		�o�[�f�B ��b����
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkbirdy()
{
	main_num		 = GetNumFlg_("NUM_SCENARIO_MAIN");
	volcano_num		 = GetNumFlg_("NUM_SCENARIO_SUB_VOLCANO");
	local sky_num	 = GetNumFlg_("NUM_SCENARIO_SUB_SKY");			//Num9
	local bit_sinario_clesr		 = GetEventFlg_("BFG_SCENARIO_CLEAR_ALL");		// Bit_46 �V�i���I�N���A
	local bit_sinario_all_clesr	 = GetEventFlg_("BFG_SCENARIO_CLEAR_EXTRA");	// Bit_47 ���V�i���I�N���A
	
	if(bit_sinario_all_clesr == true){							// Bit_47 ���V�i���I�N���A
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_BIRDY");
		ShowMsg_("18_NPC_BIRDY");				//�u�w���v���ꂽ ���i�[�e���� �A���������l�[�B
		KeyInputWait_();
		CloseMsgWnd_();
	}
	else if(bit_sinario_clesr == true){							// Bit_46 �V�i���I�N���A
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_BIRDY");
		ShowMsg_("17_NPC_BIRDY");				//�u�c�c����Ȃ��Ă����f�[�X�B
		KeyInputWait_();
		CloseMsgWnd_();
	}
	else if (main_num == GetFlagID_("CONST_SM_VOLCANO")){ // Num0 = 6
		// ��demo524�v�����e�E�X�폟����̃��b�Z�[�W��
		if (volcano_num == GetFlagID_("CONST_SS_HV_TALK_GIRL_1")){ // Num7 = 31
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_BIRDY");
			ShowMsg_("DEMO_524_AFT_BIRDY");		// �u���i�[�e�� �����������̂��ĂȂ�f�[�X�H
			KeyInputWait_();
			CloseMsgWnd_();
		}
		// ��demo526[�A���Z�X����̓`��]�̃��b�Z�[�W��
		else if (volcano_num == GetFlagID_("CONST_SS_HV_TALK_GIRL_2")){ // Num7 = 33
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_BIRDY");
			ShowMsg_("DEMO_526_AFT_BIRDY");		// �u�T�v���[�C�Y�f�[�X�c�c�B
			KeyInputWait_();
			CloseMsgWnd_();
		}
		// ��demo527[�W���[�J�[�v��]��̃��b�Z�[�W��
		else if (volcano_num == GetFlagID_("CONST_SS_HV_TALK_GIRL_3")){ // Num7 = 34
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_BIRDY");
			ShowMsg_("DEMO_527_AFT_BIRDY");		// �u �}�E�X�� �͂��ޘb�ł� �Ȃ������f�[�X�B
			KeyInputWait_();
			CloseMsgWnd_();
		}
		// ��demo532[�閧��n �����s�����I]��̃��b�Z�[�W��
		else if (volcano_num >= GetFlagID_("CONST_SS_HV_GO_TO_THE_TOEWR")){ // Num7 >= 40
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_BIRDY");
			ShowMsg_("DEMO_532_AFT_BIRDY");		// �u �O�b�h���b�N�I �S�b�h�X�s�[�h�I
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
	// ���ΎR�V�i���I�N���A��`�K���r���X���j�O�܂Ł�
	else if (main_num == GetFlagID_("CONST_SM_CORE")) // Num0 = 7
	{
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_BIRDY");
		ShowMsg_("CLEAR_AFT_BIRDY");		// �u�閧��n�� �m�[�v���u�����l�[�I
		KeyInputWait_();
		CloseMsgWnd_();
	}
	// ���K���r���X���j��`����v�����e�E�X���f�X�o�[�����j�O�܂Ł�
	else if (main_num == GetFlagID_("CONST_SM_SKY")) {			// Num0 = 8
		if(sky_num < GetFlagID_("CONST_SS_SK_GO_CORE_SKY")){	// Num9 < 42
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_BIRDY");
			ShowMsg_("13_NPC_BIRDY");		// �u�I�[�I <name_player/>�I
			KeyInputWait_();
			CloseMsgWnd_();
		}
		// ������v�����e�E�X���f�X�o�[�����j�ォ��\�V�i���I�N���A�O�܂Ł�
		else {
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_BIRDY");
			ShowMsg_("14_NPC_BIRDY");		// �u�Ƃ��Ƃ� �����܂ŗ��܂����f�[�X�B
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		���i�[�e ��b����
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkrenerte()
{
	main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");
	volcano_num	 = GetNumFlg_("NUM_SCENARIO_SUB_VOLCANO");
	
	if (main_num == GetFlagID_("CONST_SM_VOLCANO")){
		// ��demo524�v�����e�E�X�폟����̃��b�Z�[�W��
		if(volcano_num  ==  GetFlagID_("CONST_SS_HV_TALK_GIRL_1")){ // Num7 = 31
			SetNumFlg_(str_num_sub, GetFlagID_("CONST_SS_HV_PRE_ANSESU_DEMO"));
			//Demo525[���i�[�e�����������]�Đ�
			TouchNpcChangeDemo(525);
		}
		// ��demo526[�A���Z�X����̓`��]�̃��b�Z�[�W��
		else if(volcano_num == GetFlagID_("CONST_SS_HV_TALK_GIRL_2")){ // Num7 = 33
			SetNumFlg_(str_num_sub, GetFlagID_("CONST_SS_HV_TALK_GIRL_3"));
			//Demo527[�W���[�J�[�v��]�Đ�
			SetReturnDemoPosDir_(Vec3(5.405, 4.401, 0.814), 90);
			TouchNpcChangeDemo(527);
		}
		// ��demo527[�W���[�J�[�v��]��̃��b�Z�[�W��
		else if(volcano_num == GetFlagID_("CONST_SS_HV_TALK_GIRL_3")){ // Num7 = 34
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_RENERTE");
			ShowMsg_("DEMO_527_AFT_RENERTE_1"); // �u�������� �ꏏ�ɐ���Ă����H
			KeyInputWait_();
			// �y�͂��̏ꍇ�F�P�z
			if (GetQueryResult_() == QUERY2_0){
				CloseMsgWnd_();
				//Demo528[�ړ����u��ł��グ��]�Đ�
				SetNumFlg_(str_num_sub, GetFlagID_("CONST_SS_HV_PRE_LAUNCH_PAD_DEMO_1"));
				SetEventFlg_("BFG_CAMERA_DIR_FIX", true);
				StopBgmChangeDemo(528);
			}
			// �y�������̏ꍇ�F�P�z
			else{
				ShowMsg_("DEMO_527_AFT_RENERTE_2"); // �u�����c�c�B
				KeyInputWait_();
				CloseMsgWnd_();
			}
		}
		// ��demo532[�閧��n �����s�����I]��̃��b�Z�[�W��
		else if (volcano_num >= GetFlagID_("CONST_SS_HV_GO_TO_THE_TOEWR")){ // Num7 40,41
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_RENERTE");
			ShowMsg_("DEMO_532_AFT_RENERTE"); // �u���ɂ� �ړ����u�������
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		�R�[���h�X���[�v��Ԃ̎�l���𒲂ׂ���
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineSleep()
{
	// �w�肵�����W�Ƀv���C���[����������
	local pos = Vec3(45.0, 0.0, 0.0);
	uPlayerTurnAroundPos(pos);
	
	// �V�X�e�����b�Z�[�W
	OpenMsgWnd_();
	ShowMsg_("SYSTEM_MES_010");		// �Ԏ����Ȃ��B�[�������Ă���悤���B
	KeyInputWait_();
	CloseMsgWnd_();
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		�G���x�[�^�[�̒n���𒲂ׂ���
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineElevator()
{
	OpenMsgWnd_();
	ShowMsg_("VOLCANO_ELEVATOR");
	KeyInputWait_();
	// �y�͂��̏ꍇ�F�P�z
	if (GetQueryResult_() == QUERY2_0){
		CloseMsgWnd_();
		// �n���폜
		DeleteEventMine_(g_mine_elevator);
		// �G���x�[�^�ňړ�SE
		PlaySE_("SE_FLD_061");
		// B1F�ֈړ�
		ChangeMapPosDir_("V02_00", Vec3(-525.0, -87.0, 1055), 150);
	}
	// �y�������̏ꍇ�F�P�z
	else{
		CloseMsgWnd_();
		// �n�����Đݒu
		SetPointBoxEventMine_("mine_elevator", true);
	}
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		�������@�i��O�j�𒲂ׂ���
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineDoor01()
{
	
	DeleteEventMine_(g_mine_door01);
	SetMotion_(g_gmk_door01, MOT_GIMMICK_1, BLEND_N);
	PlaySE_("SE_FLD_005");
	Wait_(29);
	SetMotion_(g_gmk_door01, MOT_GIMMICK_2, BLEND_N);
	SetActive_(g_gmk_door01, false);
	SetNaviMapIconVisible_(icon02, false);
	
	Wait_(10);
	DeleteEventMine_(g_mine01);
	// Demo522[�G�C���A�X]�̍Đ�
	SetNumFlg_(str_num_sub, GetFlagID_("CONST_SS_HV_PRE_BATTLE_PROMETHEUS"));	// Num7 = 26
	TouchNpcChangeDemo(522);
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		�������A�i�^�񒆁j�𒲂ׂ���
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineDoor02()
{
	DeleteEventMine_(g_mine_door02);
	SetMotion_(g_gmk_door02, MOT_GIMMICK_1, BLEND_N);
	PlaySE_("SE_FLD_005");
	Wait_(29);
	SetMotion_(g_gmk_door02, MOT_GIMMICK_2, BLEND_N);
	SetActive_(g_gmk_door02, false);
	SetNaviMapIconVisible_(icon03, false);
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		�������B�i�ŉ��j�𒲂ׂ���
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineDoor03()
{
	DeleteEventMine_(g_mine_door03);
	SetMotion_(g_gmk_door03, MOT_GIMMICK_1, BLEND_N);
	PlaySE_("SE_FLD_005");
	Wait_(29);
	SetMotion_(g_gmk_door03, MOT_GIMMICK_2, BLEND_N);
	SetActive_(g_gmk_door03, false);
	SetNaviMapIconVisible_(icon04, false);
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//�f��522�u�G�C���A�X�v�f��523�u�v�����e�E�X�Đ�v�Đ��n���ɐG�ꂽ��
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMine01()
{
	main_num    = GetNumFlg_("NUM_SCENARIO_MAIN");
	volcano_num = GetNumFlg_("NUM_SCENARIO_SUB_VOLCANO");
	
	if (main_num == GetFlagID_("CONST_SM_VOLCANO")){
		if(volcano_num == GetFlagID_("CONST_SS_HV_CONTACT_PROMETHEUS")){ // Num7 = 27
			SetNumFlg_(str_num_sub, GetFlagID_("CONST_SS_HV_PRE_REMATCH_PROMETHEUS"));	// Num7 = 28
			DeleteEventMine_(g_mine01);
			// Demo523[�v�����e�E�X�Đ�]�̍Đ�
			StopBgmChangeDemo(523);
		}
	}
}

//+++++++++++++++++++++++++++++++++++++++++
// �v�����e�E�X��(�Đ�)�ɏ���������̏���
//-----------------------------------------
// ����  : �Ȃ�
// �߂�l: �Ȃ�
//+++++++++++++++++++++++++++++++++++++++++
function uWinPrometheus()
{
	SetNumFlg_(str_num_sub, GetFlagID_("CONST_SS_HV_TALK_GIRL_1")); // Num7 27��31
	// �f����ɐݒ肳����l���̈ʒu�ƌ���
	local rtn_pos = Vec3(-24.962, 4.401, -5.582);
	local rtn_dir = 79;
	SetReturnDemoPosDir_(rtn_pos, rtn_dir);
	EventStartChangeDemo(524, FADE_COLOR_BLACK);
}

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//		�w�肵�����W�ɕ����Ȃ���U���������
//---------------------------------------------------------------------------
// �������F�w�肵�����W(Vec3)
// �߂�l  �F�Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function uPlayerTurnAroundPos(pos)
{
	local player    = GetPlayerId_();
	// �Ώە��̕����ɉ�](1F��11.4������])
	local rotateTask = Task_RotateToPosSetMotion_(player, Vec3(pos.x, pos.y, pos.z), ROTATE_EVENT_DEF MOT_WALK, MOT_WAIT);
	WaitTask(rotateTask);
	// �Ԃ���������
	Wait_(15);
}


