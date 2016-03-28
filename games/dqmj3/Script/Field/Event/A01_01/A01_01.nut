//===================== ���_�y�m�`���[���L���O�_��(B1F)�z ====================

//+++++++++++++++++++++++++++++++++++++++++++++++++
// �N�������F�퓬�I����
//-------------------------------------------------
// ��ȗp�r�F�퓬�I����Ƀt���O�𑀍삷�鎞�Ȃǂ��s��
//+++++++++++++++++++++++++++++++++++++++++++++++++
function AfterBattle()
{
	EventEnd_();
}

//+++++++++++++++++++++++++++++++++++++++++++++++++
// �N�������FFadeIn()���O�ɌĂ΂��
//-------------------------------------------------
// ��ȗp�r�F�f����Ƀ��C�h��Ԃ̋���������
//           ��O�I�ȃC�x���g�t���O�̐ݒ�Ȃǂ��s��
//+++++++++++++++++++++++++++++++++++++++++++++++++
function BeforeInitMap()
{
	// �i�s�t���O�̏�Ԃ��擾
	local main_num  = GetNumFlg_("NUM_SCENARIO_MAIN");
	local outside_num = GetNumFlg_("NUM_SCENARIO_SUB_INSIDE_CLEAR"); // �\�V�i���I�N���A��

	if(main_num == GetFlagID_("CONST_SM_INSIDE_CLEAR")){
		if(outside_num == GetFlagID_("CONST_SS_OS_GO_POINT_ZERO_LAB_2")){
			if(GetEventFlg_("BFG_PLAY_PSEUDO_DEMO_A01_01") == true){
				//���C�h��������
				SetRideOffStart_();
			}
		}
	}

	EventEnd_();
}

//+++++++++++++++++++++++++++++++++++++++++++++++++
// �N�������F��ʐ؂�ւ��t�F�[�h�C����
//-------------------------------------------------
// ��ȗp�r�FNPC�A�n�����̓ǂݍ��݂Ɛݒu�Ȃǂ��s��
//+++++++++++++++++++++++++++++++++++++++++++++++++
function FadeIn()
{
	// �i�s�t���O�̏�Ԃ��擾
	local main_num  = GetNumFlg_("NUM_SCENARIO_MAIN");
	local outside_num = GetNumFlg_("NUM_SCENARIO_SUB_INSIDE_CLEAR"); // �\�V�i���I�N���A��
	local allclear_num = GetNumFlg_("NUM_SCENARIO_SUB_ALL_CLEAR");   // ���S�N���A��
	DebugPrint(" ");
	DebugPrint("NUM_SCENARIO_MAIN �̒l�� " + main_num + " �ɂȂ�܂����B");

	// �}�b�v���B�t���O
	//SetEventFlg_("", true);// (��)�Ή�����t���O���p�ӂ���Ă��Ȃ��̂ŃR�����g��
	// ���[���|�C���g���
	SetEventFlg_("BFG_RULER_ADD_028", true);

//--------------------------
// �M�~�b�N
	// ������
	g_DiscDevice <- C_NONE_ID;
	g_lift_e <- C_NONE_ID;
	g_lift_n <- C_NONE_ID;

	// �G���x�[�^�̔�
	local elevator_id = ReadGimmick_("o_A01_16");
	local g_elevator_e = ArrangePointGimmick_("o_A01_16", elevator_id, "g_elevator");
	local g_elevator_n = ArrangePointGimmick_("o_A01_16", elevator_id, "g_elevator02");
	// �G���x�[�^�̃��t�g
	local lift_id = ReadGimmick_("o_A01_17");
	g_lift_e = ArrangePointGimmick_("o_A01_17", lift_id, "g_elevator_lift");
	g_lift_n = ArrangePointGimmick_("o_A01_17", lift_id, "g_elevator_lift02");
	//�f�B�X�N���u
	local DiscDeviceID = ReadGimmick_("o_com_18");
	g_DiscDevice = ArrangePointGimmick_("o_com_18", DiscDeviceID, "g_disc_device");
	// �f�B�X�N���u�̃A�j����ݒ�
	SetMotion_(g_DiscDevice, MOT_GIMMICK_2, BLEND_M);
	// �����p�l��
	local gr_panel_id = ReadGimmick_("o_A01_05");
	local g_gr_panel = ArrangePointGimmick_("o_A01_05", gr_panel_id, "g_panel");
	if(GetEventFlg_("BFG_SCENARIO_CLEAR_GRASS") == false){
		SetMotion_(g_gr_panel, MOT_GIMMICK_0, BLEND_M);
	}
	else{
		SetMotion_(g_gr_panel, MOT_GIMMICK_1, BLEND_M);
	}
	// �����p�l��
	local ci_panel_id = ReadGimmick_("o_A01_06");
	local g_ci_panel = ArrangePointGimmick_("o_A01_06", ci_panel_id, "g_panel");
	if(GetEventFlg_("BFG_SCENARIO_CLEAR_CITY") == false){
		SetMotion_(g_ci_panel, MOT_GIMMICK_0, BLEND_M);
	}
	else{
		SetMotion_(g_ci_panel, MOT_GIMMICK_1, BLEND_M);
	}
	// �쓹�p�l��
	local ce_panel_id = ReadGimmick_("o_A01_07");
	local g_ce_panel = ArrangePointGimmick_("o_A01_07", ce_panel_id, "g_panel");
	if(GetEventFlg_("BFG_SCENARIO_CLEAR_GRAVE") == false){
		SetMotion_(g_ce_panel, MOT_GIMMICK_0, BLEND_M);
	}
	else{
		SetMotion_(g_ce_panel, MOT_GIMMICK_1, BLEND_M);
	}
	// �X���p�l��
	local ic_panel_id = ReadGimmick_("o_A01_08");
	local g_ic_panel = ArrangePointGimmick_("o_A01_08", ic_panel_id, "g_panel");
	if(GetEventFlg_("BFG_SCENARIO_CLEAR_ICE") == false){
		SetMotion_(g_ic_panel, MOT_GIMMICK_0, BLEND_M);
	}
	else{
		SetMotion_(g_ic_panel, MOT_GIMMICK_1, BLEND_M);
	}
	// �č��p�l��
	local pr_panel_id = ReadGimmick_("o_A01_09");
	local g_pr_panel = ArrangePointGimmick_("o_A01_09", pr_panel_id, "g_panel");
	if(GetEventFlg_("BFG_SCENARIO_CLEAR_SAND") == false){
		SetMotion_(g_pr_panel, MOT_GIMMICK_0, BLEND_M);
	}
	else{
		SetMotion_(g_pr_panel, MOT_GIMMICK_1, BLEND_M);
	}
	// �ΎR�p�l��
	local vo_panel_id = ReadGimmick_("o_A01_10");
	local g_vo_panel = ArrangePointGimmick_("o_A01_10", vo_panel_id, "g_panel");
	if(GetEventFlg_("BFG_SCENARIO_CLEAR_VOLCANO") == false){
		SetMotion_(g_vo_panel, MOT_GIMMICK_0, BLEND_M);
	}
	else{
		SetMotion_(g_vo_panel, MOT_GIMMICK_1, BLEND_M);
	}

//----------------------------------------------------------------
// NPC�֘A��Ǎ���
	npc_Aroma <- C_NONE_ID;
	npc_Renate <- C_NONE_ID;
	npc_RecShop <- C_NONE_ID;
	npc_Nocho_B <- C_NONE_ID;
	npc_Citizen_Wom_A <- C_NONE_ID;
	npc_Resistance_Man <- C_NONE_ID;
	npc_Resistance_Wom <- C_NONE_ID;

	// �\�V�i���I�N���A��
	if(main_num == GetFlagID_("CONST_SM_INSIDE_CLEAR")){
		if(outside_num == GetFlagID_("CONST_SS_OS_MAKE_DISC_TALK_AROMA")){
			// �A���}(NUM000 == 9 ���� NUM010 == 6 �̎�)
			npc_Aroma = ReadAndArrangePointNpc("n018", "npc_aroma_01");
			SetTalkCameraType_(npc_Aroma, TALK_CAMERA_UP);
			SetReactorMsg_(npc_Aroma, "NPC_AROMA_REC");
			// ��b�J�������ɓ��߂����̂ŃA���t�@�l��ݒ肷��
			SetManualCalcAlpha_(npc_Aroma, true);
			SetAlpha_(npc_Aroma, 1.0);
		}
		else if(outside_num == GetFlagID_("CONST_SS_OS_GET_DISC_ACCESSORY")){
			// �A���}(NUM000 == 9 ���� NUM010 == 8 �̎�)
			npc_Aroma = ReadAndArrangePointNpc("n018", "npc_aroma_02");
			SetTalkCameraType_(npc_Aroma, TALK_CAMERA_UP);
			SetReactorMsg_(npc_Aroma, "NPC_AROMA_REC");
			// ��b�J�������ɓ��߂����̂ŃA���t�@�l��ݒ肷��
			SetManualCalcAlpha_(npc_Aroma, true);
			SetAlpha_(npc_Aroma, 1.0);
		}
		else if(outside_num == GetFlagID_("CONST_SS_OS_GO_POINT_ZERO_LAB_2")){
			// �A���}(NUM000 == 9 ���� NUM010 == 9 �̎�)
			npc_Aroma = ReadAndArrangePointNpc("n018", "npc_aroma_02");
			SetTalkCameraType_(npc_Aroma, TALK_CAMERA_UP);
			SetReactorMsg_(npc_Aroma, "NPC_AROMA_REC");
			// ��b�J�������ɓ��߂����̂ŃA���t�@�l��ݒ肷��
			SetManualCalcAlpha_(npc_Aroma, true);
			SetAlpha_(npc_Aroma, 1.0);
		}
		else if(outside_num >= GetFlagID_("CONST_SS_OS_COLLECT_STAR_PIECE")
		&& outside_num <= GetFlagID_("CONST_SS_OS_EXAMINE_STAR_SEED_2")){
			// ���A�N�^�[��(NUM000 == 9 ���� NUM010 �� 10�`35 �̎�)
			npc_RecShop = ReadAndArrangePointNpc("n000", "npc_Def_reactor");
			SetReactorMsg_(npc_RecShop, "NPC_NOCHO_MEN_REC");
		}
		else if(outside_num == GetFlagID_("CONST_SS_OS_TALKED_AROMA")){
			// �A���}(NUM000 == 9 ���� NUM010 == 36 �̎�)
			npc_Aroma = ReadAndArrangePointNpc("n018", "npc_aroma_03");
			SetTalkCameraType_(npc_Aroma, TALK_CAMERA_UP);
			SetReactorMsg_(npc_Aroma, "NPC_AROMA_REC");
			// ��b�J�������ɓ��߂����̂ŃA���t�@�l��ݒ肷��
			SetManualCalcAlpha_(npc_Aroma, true);
			SetAlpha_(npc_Aroma, 1.0);
			// �s�����`
			npc_Citizen_Wom_A = ReadAndArrangePointNpc("n016", "npc_Def_citizen_woman");
			SetReactorMsg_(npc_Citizen_Wom_A, "CITIZEN_WOMAN_REC");
			// �m�`���a
			npc_Nocho_B = ReadAndArrangePointNpc("n000", "npc_Def_nocho_b");
			SetReactorMsg_(npc_Nocho_B, "NPC_NOCHO_MEN_REC");
			SetComMode_(npc_Nocho_B, 1);
			SetWalkRadius_(npc_Nocho_B, 10);
			// ���A�N�^�[��
			npc_RecShop = ReadAndArrangePointNpc("n000", "npc_Def_reactor");
			SetReactorMsg_(npc_RecShop, "NPC_NOCHO_MEN_REC");
			SetComMode_(npc_RecShop, 1);
			SetWalkRadius_(npc_RecShop, 15);
			// ���W�X�^���X�j�`
			npc_Resistance_Man = ReadAndArrangePointNpc("n012", "npc_Def_resist_man");
			SetReactorMsg_(npc_Resistance_Man, "RESISTANCE_MAN_A_REC");
			// ���W�X�^���X���`
			npc_Resistance_Wom = ReadAndArrangePointNpc("n013", "npc_Def_resist_woman");
			SetReactorMsg_(npc_Resistance_Wom, "RESISTANCE_WOMAN_A_REC");
		}
	}

	// ���S�N���A��
	else if(main_num == GetFlagID_("CONST_SM_ALL_CLEAR")){
		// ���i�[�e
		if(allclear_num == GetFlagID_("CONST_SS_ALL_GO_TO_CENTER_BILL_B2F")){
			npc_Renate = ReadAndArrangePointNpc("n007", "npc_Def_renate");
			SetTalkCameraType_(npc_Renate, TALK_CAMERA_UP);
			SetReactorMsg_(npc_Renate, "NPC_RENATE_REC");
			// ��b�J�������ɓ��߂����̂ŃA���t�@�l��ݒ肷��
			SetManualCalcAlpha_(npc_Renate, true);
			SetAlpha_(npc_Renate, 1.0);
		}
		// �s�����`(�풓)
		npc_Citizen_Wom_A = ReadAndArrangePointNpc("n016", "npc_Def_citizen_woman");
		SetReactorMsg_(npc_Citizen_Wom_A, "CITIZEN_WOMAN_REC");
		SetComMode_(npc_Citizen_Wom_A, 1);
		SetWalkRadius_(npc_Citizen_Wom_A, 15);
		// �m�`���a(�풓)
		npc_Nocho_B = ReadAndArrangePointNpc("n000", "npc_Def_nocho_b");
		SetReactorMsg_(npc_Nocho_B, "NPC_NOCHO_MEN_REC");
		SetComMode_(npc_Nocho_B, 1);
		SetWalkRadius_(npc_Nocho_B, 10);
		SetComMode_(npc_Nocho_B, 1);
		SetWalkRadius_(npc_Nocho_B, 15);
		// ���A�N�^�[��(�풓)
		npc_RecShop = ReadAndArrangePointNpc("n000", "npc_Def_reactor");
		SetReactorMsg_(npc_RecShop, "NPC_NOCHO_MEN_REC");
		SetComMode_(npc_RecShop, 1);
		SetWalkRadius_(npc_RecShop, 15);
		// ���W�X�^���X�j�`(�풓)
		npc_Resistance_Man = ReadAndArrangePointNpc("n012", "npc_Def_resist_man");
		SetReactorMsg_(npc_Resistance_Man, "RESISTANCE_MAN_A_REC");
		// ���W�X�^���X���`(�풓)
		npc_Resistance_Wom = ReadAndArrangePointNpc("n013", "npc_Def_resist_woman");
		SetReactorMsg_(npc_Resistance_Wom, "RESISTANCE_WOMAN_A_REC");
	}


//-----------------------------
// ���A�N�^�[�|�C���g
	local reactorPoint01 = ArrangeMsgReactorPoint("reactor_point_01", GetFlagID_("BFG_REACTER_POINT_040")
		, LONG_DIST, "REC_POINT_01_01", "REC_POINT_01_02");
	local reactorPoint02 = ArrangeMsgReactorPoint("reactor_point_02", GetFlagID_("BFG_REACTER_POINT_041")
		, SHORT_DIST, "REC_POINT_02_01", "REC_POINT_02_02");
	local reactorPoint03 = ArrangeMsgReactorPoint("reactor_point_03", GetFlagID_("BFG_REACTER_POINT_042")
		, SHORT_DIST, "REC_POINT_03_01", "REC_POINT_03_02");
	local reactorPoint05 = ArrangeMsgReactorPoint("reactor_point_05", GetFlagID_("BFG_REACTER_POINT_043")
		, LONG_DIST, "REC_POINT_04_01", "REC_POINT_04_02");

//----------------------------------------------------------------
// �C�x���g�n����Ǎ���
	// �f�B�X�N���u
	mine_DiscDevice <- C_NONE_ID;
	mine_DiscDevice = SetPointCircleEventMine_("mine_disc_device", true);
	// ���G���x�[�^
	mine_EastEleveter <- C_NONE_ID;
	mine_EastEleveter = SetPointBoxEventMine_("mine_east_eleveter", true);
	// �k�G���x�[�^
	mine_NorthEleveter <- C_NONE_ID;
	mine_NorthEleveter = SetPointBoxEventMine_("mine_eleveter", true);
	//���j�^�̃R���\�[������
	g_mine_endrole <- C_NONE_ID;
	g_mine_endrole = SetPointBoxEventMine_("mine_endrole", true);


	EventEnd_();
}

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// �N�������F�t�B�[���h����J�n��
//------------------------------------------------------------------------------
// ��ȗp�r�F�}�b�v�؂�ւ�����̃f���Đ��E�o�g���J�n����
//           �E�퓬�I�����̃��b�Z�[�W�̕\���EWait�����݂Ȃ��瑀�삷��Ȃǂ��s��
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function EventStartOperate()
{
	// �i�s�t���O�̏�Ԃ��擾
	local main_num  = GetNumFlg_("NUM_SCENARIO_MAIN");
	local outside_num = GetNumFlg_("NUM_SCENARIO_SUB_INSIDE_CLEAR"); // �\�V�i���I�N���A��
	DebugPrint(" ");

//---------------------------------------------------------------------------------------
// �f���̍Đ�
	// ���y�̗쓹�N���A��
	if(main_num >= GetFlagID_("CONST_SM_ICE_FIELD")){
		if(main_num <= GetFlagID_("CONST_SM_SKY")){
			if(GetEventFlg_("BFG_PLAYED_BASEMENT_DEMO") == false){
				// �f���Đ��O�Ƀt�B�[���h���f��Ȃ����߂̑Ή�
				CommChangeMomentFadeOut(FADE_COLOR_BLACK);
				// �Q��Đ�����Ȃ��悤�ɂ���
				SetEventFlg_("BFG_PLAYED_BASEMENT_DEMO", true);
				// �f�B�X�N���u����A���Ă����Ƃ��̃��b�Z�[�W�Ɣ��Ȃ��悤�ɂ���
				SetEventFlg_("BFG_CHECK_DISC_MACHINE_RTNMSG", true);
				// �f����̎�l���̈ʒu���C��
				SetReturnDemoPosDir_(Vec3(123.0, 0.0, 0.0), -90);
				// Demo133[�n�����ɂ�]
				ChangeDemo_(133);
			}
		}
		else{
			// �\�V�i���I�N���A�ȍ~
			// �\�V�i���I�N���A���Demo133[�n�����ɂ�]��Demo805[�f�B�X�N�V�X�e���̔閧]�������ɍĐ�����Ȃ��悤�ɂ���
			if(outside_num <= GetFlagID_("CONST_SS_OS_GO_POINT_ZERO_LAB_1")){
				if(main_num == GetFlagID_("CONST_SM_INSIDE_CLEAR")){
					if(GetEventFlg_("BFG_PLAYED_BASEMENT_DEMO") == false){
						// �f���Đ��O�Ƀt�B�[���h���f��Ȃ����߂̑Ή�
						CommChangeMomentFadeOut(FADE_COLOR_BLACK);
						// �Q��Đ�����Ȃ��悤�ɂ���
						SetEventFlg_("BFG_PLAYED_BASEMENT_DEMO", true);
						// �f�B�X�N���u����A���Ă����Ƃ��̃��b�Z�[�W�Ɣ��Ȃ��悤�ɂ���
						SetEventFlg_("BFG_CHECK_DISC_MACHINE_RTNMSG", true);
						// �f����̎�l���̈ʒu���C��
						SetReturnDemoPosDir_(Vec3(123.0, 0.0, 0.0), -90);
						// Demo133[�n�����ɂ�]
						ChangeDemo_(133);
					}
				}
			}
			else if(outside_num == GetFlagID_("CONST_SS_OS_GO_CENTER_BILL_B1F")){
				// �f���Đ��O�Ƀt�B�[���h���f��Ȃ����߂̑Ή�
				CommChangeMomentFadeOut(FADE_COLOR_BLACK);
				// Demo133[�n�����ɂ�]���Đ�����Ȃ��悤�ɂ���
				SetEventFlg_("BFG_PLAYED_BASEMENT_DEMO", true);
				// �f�B�X�N�쐬�@�\�ǉ�
				SetEventFlg_("BFG_UNLOCK_DISC_CREATE_MENU", true);
				SetEventFlg_("BFG_TRAVEL_INFO_SHOW_045", true); // ���̐S���̍��ډ���t���O	�y�f�B�X�N�z�f�B�X�N�̍쐬
				// ���`�z�R�p�̃L�[���[�h�ǉ�
				SetEventFlg_("BFG_TROPHY_GET_GOD_OF_THE_LAND", true);
				// �f�B�X�N���u����A���Ă����Ƃ��̃��b�Z�[�W�Ɣ��Ȃ��悤�ɂ���
				SetEventFlg_("BFG_CHECK_DISC_MACHINE_RTNMSG", true);
				// �T�u�t���O��i�߂�
				SetNumFlg_("NUM_SCENARIO_SUB_INSIDE_CLEAR", GetFlagID_("CONST_SS_OS_MAKE_DISC_TALK_AROMA"));
				// �f����̎�l���̈ʒu���C��
				SetReturnDemoPosDir_(Vec3(60.0, 0.0, 0.0), -90);
				// Demo805[�f�B�X�N�V�X�e���̔閧]
				ChangeDemo_(805);
			}
			// NUM000 == 9 ���� NUM010 == 6 �̎�
			else if(outside_num == GetFlagID_("CONST_SS_OS_MAKE_DISC_TALK_AROMA")){
				// �f�B�X�N�쐬�̃`���[�g���A���p�t���O
				SetEventFlg_("BFG_TUTORIAL_DISC_CREATE", true);
				// ��������32000G�ǉ�
				AddGold_(32000);
				// FadeIn�ł̔z�u�𔽉f���邽��1F�҂�( 2��DB #6284 )
				Wait_(1);
				// �f�B�X�N�{�݌Ăяo��
				GotoMenuFadeOpen(MENU_OPEN.DISC_FACILITY);
				// �f�B�X�N�쐬�̃`���[�g���A���p�t���O
				SetEventFlg_("BFG_TUTORIAL_DISC_CREATE", false);
				// �T�u�t���O��i�߂�
				SetNumFlg_("NUM_SCENARIO_SUB_INSIDE_CLEAR", GetFlagID_("CONST_SS_OS_GET_DISC_ACCESSORY"));
				// �f�B�X�N�V�X�e���̏��񃁃b�Z�[�W��\���������H
				SetEventFlg_("BFG_DISPLAYED_DISC_SYSTEM_MSG", true);
				// ���_�c�~�p�̃L�[���[�h�ǉ�
				SetEventFlg_("BFG_TROPHY_GET_GOD_OF_THE_SEA", true);
				// �z�A�J���p�̃L�[���[�h�ǉ�
				SetEventFlg_("BFG_TROPHY_GET_GOD_OF_THE_SKY", true);
				// Demo807[�R�̌��t�ƂR���̃f�B�X�N]�Đ��t���O�𗧂Ă�
				SetEventFlg_("BFG_PLAY_PSEUDO_DEMO_A01_01", true);
				// �f�B�X�N���u����A���Ă����Ƃ��̃��b�Z�[�W�Ɣ��Ȃ��悤�ɂ���
				SetEventFlg_("BFG_CHECK_DISC_MACHINE_RTNMSG", true);
				// �f����̎�l���̈ʒu���C��
				SetReturnDemoPosDir_(Vec3(72.00, 0.00, 11.625), 180);
				// Demo807[�R�̌��t�ƂR���̃f�B�X�N]
				ChangeDemo_(807);
			}
			else if(outside_num == GetFlagID_("CONST_SS_OS_GET_DISC_ACCESSORY")){
				if(GetEventFlg_("BFG_PLAY_PSEUDO_DEMO_A01_01") == true){
					// Demo807[�R�̌��t�ƂR���̃f�B�X�N]�Đ��t���O���~�낷
					SetEventFlg_("BFG_PLAY_PSEUDO_DEMO_A01_01", false);
					// �J�������Đݒ�
					SetCameraDir_(-90);
				}
			}
			else if(outside_num == GetFlagID_("CONST_SS_OS_GO_POINT_ZERO_LAB_2")){
				if(GetEventFlg_("BFG_PLAY_PSEUDO_DEMO_A01_01") == true){
					// �[���f��[��������ւ̈ē�]�Đ��t���O���~�낷
					SetEventFlg_("BFG_PLAY_PSEUDO_DEMO_A01_01", false);
					// �f�B�X�N���u����A���Ă����Ƃ��̃��b�Z�[�W�Ɣ��Ȃ��悤�ɂ���
					SetEventFlg_("BFG_CHECK_DISC_MACHINE_RTNMSG", true);
					// �[���f��[��������ւ̈ē�]
					uPlayableDemo();
				}
			}
			else if(outside_num == GetFlagID_("CONST_SS_OS_TALKED_AROMA_2")){
				// �f���Đ��O�Ƀt�B�[���h���f��Ȃ����߂̑Ή�
				CommChangeMomentFadeOut(FADE_COLOR_BLACK);
				// �T�u�t���O��i�߂�
				SetNumFlg_("NUM_SCENARIO_SUB_INSIDE_CLEAR", GetFlagID_("CONST_SS_OS_DATA_SAVED"));
				// �Z�[�u�|�C���g�����ނ��߂̃t���O
				SetEventFlg_("BFG_SAVE_POINT_FLAG", true);
				// �f�B�X�N���u����A���Ă����Ƃ��̃��b�Z�[�W�Ɣ��Ȃ��悤�ɂ���
				SetEventFlg_("BFG_CHECK_DISC_MACHINE_RTNMSG", true);
				// �f����̎�l���̈ʒu���C��
				SetReturnDemoMap_("A01_00");
				SetReturnDemoPosDir_(Vec3(0.00, 2.50, 235.50), 180);
				// Demo832[�A���}�Ƃ̕ʂ�]
				ChangeDemo_(832);
			}
		}
	}

//-------------------------------------------------------
// �f�B�X�N���u����A���Ă����Ƃ��̃��b�Z�[�W��\��
	if(GetEventFlg_("BFG_CHECK_DISC_MACHINE_RTNMSG") == false){ // �f�B�X�N���u����A���Ă����Ƃ��̃��b�Z�[�W���f���Ɣ��Ȃ����`�F�b�N
		if(GetEventFlg_("BFG_DISC_MACHINE_RETURN_MESSAGE") == true){ // �f�B�X�N���u�̖߂胁�b�Z�[�W��\�����邽�߂̃t���O
			// �t���O��߂��Ă���
			SetEventFlg_("BFG_DISC_MACHINE_RETURN_MESSAGE", false);
			if(GetEventFlg_("BFG_DISPLAYED_DISC_MACHINE_RTNMSG") == false){ // �f�B�X�N���u���珉�߂ċA���Ă����Ƃ��̃��b�Z�[�W��\���������ǂ����H
				// �t���O
				SetEventFlg_("BFG_DISPLAYED_DISC_MACHINE_RTNMSG", true);
				// �Ԃ���������
				Wait_(20);
				// ���b�Z�[�W�\��
				OpenMsgWnd_();
				SetTalkName_("NAME_TAG_DISC_SYSTEM");
				ShowMsg_("DISC_SYSTEM_END_MSG");
				KeyInputWait_();
				CloseMsgWnd_();
			}
			else{
				// �Ԃ���������
				Wait_(20);
				// ���b�Z�[�W�\��
				OpenMsgWnd_();
				SetTalkName_("NAME_TAG_DISC_SYSTEM");
				ShowMsg_("DISC_SYSTEM_MSG_002_NO");
				KeyInputWait_();
				CloseMsgWnd_();
			}
		}
	}

//-------------------------------
// �A�N�Z�T�����胁�b�Z�[�W�̕\��
	// ���`�z�R�̂�т�
	if(GetEventFlg_("BFG_GET_ACCESSORY_YATIHOKO") == false){
		// ���`�F�b�N
		local get_num_y = GetAccessoryNum_(YATIHOKO_ACCE_ID);
		if(get_num_y >= 1){
			// Demo809[����̉��]�̍Đ��O(NUM9 �� 8 �` 9 )
			if(outside_num == GetFlagID_("CONST_SS_OS_GO_POINT_ZERO_LAB_2")
			|| outside_num == GetFlagID_("CONST_SS_OS_GET_DISC_ACCESSORY")){
				Wait_(FADE_DEF);
				local msg = "SYSTEM_MSG_001_01"; // �A���}�͒n����
				OpenMsgWnd_();
				ShowMsg_(msg);
				KeyInputWait_();
				CloseMsgWnd_();
				// 2�x�\�����Ȃ��悤�ɂ���
				SetEventFlg_("BFG_GET_ACCESSORY_YATIHOKO", true);
			}
			// Demo809[����̉��]�̍Đ���(NUM9 �� 10 �` 11 )
			if(outside_num == GetFlagID_("CONST_SS_OS_COLLECT_STAR_PIECE")
			|| outside_num == GetFlagID_("CONST_SS_OS_COLLECT_STAR_PIECE_2")){
				Wait_(FADE_DEF);
				local msg = "SYSTEM_MSG_001_04"; // �A���}�̓|�C���g�[��
				OpenMsgWnd_();
				ShowMsg_(msg);
				KeyInputWait_();
				CloseMsgWnd_();
				// 2�x�\�����Ȃ��悤�ɂ���
				SetEventFlg_("BFG_GET_ACCESSORY_YATIHOKO", true);
			}
		}
	}
	// ���_�c�~�̂�т�
	if(GetEventFlg_("BFG_GET_ACCESSORY_WADATUMI") == false){
		// ���`�F�b�N
		local get_num_w = GetAccessoryNum_(WADATUMI_ACCE_ID);
		if(get_num_w >= 1){
			// Demo809[����̉��]�̍Đ��O(NUM9 �� 8 �` 9 )
			if(outside_num == GetFlagID_("CONST_SS_OS_GO_POINT_ZERO_LAB_2")
			|| outside_num == GetFlagID_("CONST_SS_OS_GET_DISC_ACCESSORY")){
				Wait_(FADE_DEF);
				local msg = "SYSTEM_MSG_001_02"; // �A���}�͒n����
				OpenMsgWnd_();
				ShowMsg_(msg);
				KeyInputWait_();
				CloseMsgWnd_();
				// 2�x�\�����Ȃ��悤�ɂ���
				SetEventFlg_("BFG_GET_ACCESSORY_WADATUMI", true);
			}
			// Demo809[����̉��]�̍Đ���(NUM9 �� 10 �` 11 )
			if(outside_num == GetFlagID_("CONST_SS_OS_COLLECT_STAR_PIECE")
			|| outside_num == GetFlagID_("CONST_SS_OS_COLLECT_STAR_PIECE_2")){
				Wait_(FADE_DEF);
				local msg = "SYSTEM_MSG_001_05"; // �A���}�̓|�C���g�[��
				OpenMsgWnd_();
				ShowMsg_(msg);
				KeyInputWait_();
				CloseMsgWnd_();
				// 2�x�\�����Ȃ��悤�ɂ���
				SetEventFlg_("BFG_GET_ACCESSORY_WADATUMI", true);
			}
		}
	}
	// �z�A�J���̂�т�
	if(GetEventFlg_("BFG_GET_ACCESSORY_HOAKARI") == false){
		// ���`�F�b�N
		local get_num_h = GetAccessoryNum_(HOAKARI_ACCE_ID);
		if(get_num_h >= 1){
			// Demo809[����̉��]�̍Đ��O(NUM9 �� 8 �` 9 )
			if(outside_num == GetFlagID_("CONST_SS_OS_GO_POINT_ZERO_LAB_2")
			|| outside_num == GetFlagID_("CONST_SS_OS_GET_DISC_ACCESSORY")){
				Wait_(FADE_DEF);
				local msg = "SYSTEM_MSG_001_03"; // �A���}�͒n����
				OpenMsgWnd_();
				ShowMsg_(msg);
				KeyInputWait_();
				CloseMsgWnd_();
				// 2�x�\�����Ȃ��悤�ɂ���
				SetEventFlg_("BFG_GET_ACCESSORY_HOAKARI", true);
			}
			// Demo809[����̉��]�̍Đ���(NUM9 �� 10 �` 11 )
			if(outside_num == GetFlagID_("CONST_SS_OS_COLLECT_STAR_PIECE")
			|| outside_num == GetFlagID_("CONST_SS_OS_COLLECT_STAR_PIECE_2")){
				Wait_(FADE_DEF);
				local msg = "SYSTEM_MSG_001_06"; // �A���}�̓|�C���g�[��
				OpenMsgWnd_();
				ShowMsg_(msg);
				KeyInputWait_();
				CloseMsgWnd_();
				// 2�x�\�����Ȃ��悤�ɂ���
				SetEventFlg_("BFG_GET_ACCESSORY_HOAKARI", true);
			}
		}
	}

//----------------------------------------------
// �G���h���[���Đ���̃t�F�[�h����(2��DB #4739)
	if(GetEventFlg_("BFG_RETURN_ENDROLL_FADE") == true){
		SetEventFlg_("BFG_RETURN_ENDROLL_FADE", false);
		CommChangeMomentFadeOut(FADE_COLOR_BLACK);
		SetFade_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
		SetFadeSub_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
		WaitFade_();
	}

	// �Ђƒʂ�̏������I�������A�G���x�[�^�g�p���ɗ��ĂĂ����t���O���~�낷
	if(GetEventFlg_("BFG_CHECK_USED_ELEVATER_FADE_OFF") == true){
		// �G���x�[�^���g�p�����^�C�~���O�Ńf���𗬂��^�C�~���O�Ɣ�����ꍇ�t�F�[�h�̎�ނ�؂�ւ���ׂ̃t���O���ɖ߂�
		SetEventFlg_("BFG_CHECK_USED_ELEVATER_FADE_OFF", false);
	}

	// �f�B�X�N���u���珉�߂ċA���Ă����Ƃ��̃��b�Z�[�W���f���Ɣ��Ȃ����`�F�b�N����t���O�����ɖ߂�
	if(GetEventFlg_("BFG_CHECK_DISC_MACHINE_RTNMSG") == true){
		SetEventFlg_("BFG_CHECK_DISC_MACHINE_RTNMSG", false);
	}

	EventEnd_();
}

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// �N�������FFadeIn()�Ȃǂ̃C�x���g�u���b�N��ArrangePointNpc_()���s�����Ƃ�
//------------------------------------------------------------------------------
// ��ȗp�r�FFaadIn()�̃C�x���g�u���b�N�Őݒ�ł��Ȃ����Ƃ�TouchNpc()�̒��O�ōs���C�x���g�u���b�N
// ���ӓ_  �F�K���utarget�v�������ɐݒ肷�邱��
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function BeforeTalkNpc()
{
	local target = GetTargetId_();
	
	// ���C�h���Ƀ��i�[�e�ɘb�����������͎��_�̃I�t�Z�b�g�l��Y���݂̂�ύX����
	// �y���Y�^�z�unpc_info.nut�v�Ŏ��_�ƒ����_�̃I�t�Z�b�g�l�����_�̒������Ă��܂��B
	//            �Ȃ̂ŁA�R�R�ōs�����_�̃I�t�Z�b�g�l�ύX�́unpc_info.nut�v�Ō��_���������l����
	//            ����ɒ������邱�ƂɂȂ�̂ŕύX���鎞�͗v���ӁB
	if(target == npc_Renate){
		SetRideTalkCamOffset(OFFSET_RENATE);
	}

	EventEnd_();
}

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// �N�������FFadeIn()�Ȃǂ̃C�x���g�u���b�N��ArrangePointNpc_()���s�����Ƃ�
//------------------------------------------------------------------------------
// ��ȗp�r�FNPC�ɘb�������s����������
// ���ӓ_  �F�K���utarget�v�������ɐݒ肷�邱��
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function TouchNpc()
{
	// �i�s�t���O�̏�Ԃ��擾
	local main_num  = GetNumFlg_("NUM_SCENARIO_MAIN");

	// �b��������Ώۂ�NPC��������
	local target    = GetTargetId_();
	switch(target)
	{
	case npc_Aroma:
		uAromaMsg();
		break;
	case npc_Renate:
		uRenateMsg();
		break;
	case npc_RecShop:
		uRecShopMsg();
		break;
	case npc_Nocho_B:
		uNochoBMsg();
		break;
	case npc_Citizen_Wom_A:
		uCitizenWomMsg();
		break;
	case npc_Resistance_Man:
		uResistManMsg();
		break;
	case npc_Resistance_Wom:
		uResistWomMsg();
		break;
	default:
		DebugPrint("�ݒu���Ă��Ȃ�NPC�ɘb�������Ă��܂��B");
		break;
	}

	EventEnd_();
}

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// �N�������F�}�b�v�ɔz�u�������b�V���ɐG�ꂽ��
//------------------------------------------------------------------------------
// ��ȗp�r�F�}�b�v�ɔz�u�������b�V���ɐG�ꂽ�Ƃ��Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function TouchEventMine()
{
	local player    = GetPlayerId_();
	local main_num  = GetNumFlg_("NUM_SCENARIO_MAIN");

	// ���ׂ���G�����肵���C�x���g�n����������
	local target    = GetTouchEventMineId_();
	switch(target)
	{
	// �f�B�X�N
	case mine_DiscDevice:
		uDiscDeviceMine();
		break;
	// ���G���x�[�^
	case mine_EastEleveter:
		// �G���x�[�^�̕����Ɍ���
		CommPlayerTurnAroundObj(g_lift_e);
		// �n���폜
		DeleteEventMine_(mine_EastEleveter);
		uChoiceMoveEastEleveter();
		break;
	// �k�G���x�[�^
	case mine_NorthEleveter:
		// �G���x�[�^�̕����Ɍ���
		CommPlayerTurnAroundObj(g_lift_n);
		// �n���폜
		DeleteEventMine_(mine_NorthEleveter);
		uChoiceMoveNorthEleveter();
		break;
	// ���j�^�̃R���\�[������
	case g_mine_endrole:
		// ���j�^�̕����Ɍ���
		CommPlayerTurnAroundDir(270);
		// �n���폜
		//�\�V�i���I�N���A��
		if (GetFlagID_("CONST_SM_INSIDE_CLEAR") <= GetNumFlg_("NUM_SCENARIO_MAIN")) {
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_REACTOR");		//�u���̑��u�ɂ́@�f���f�[�^��
			ShowMsg_("ENDROLE_SELECT");
			KeyInputWait_();
			if (GetQueryResult_() == QUERY2_0) {
				ShowMsg_("ENDROLE_SELECT_HELP");	//�u�f�����@�I������Ƃ���
				KeyInputWait_();
				CloseMsgWnd_();
				// �G���h���[���Đ��t���O
				SetEventFlg_("BFG_RETURN_ENDROLL_FADE", true);
				// �X�^�b�t���[���i�����X�^�[���[���j�Đ�
				ChangeEndRoll_();
			} else {
				CloseMsgWnd_();

			}

		//�\�N���A�O
		} else {
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_REACTOR");
			ShowMsg_("ENDROLE_NOT_SELECT");
			KeyInputWait_();
			CloseMsgWnd_();
		}
		break;

	// �ݒu���Ă��Ȃ��n���ɐڐG
	default:
		DebugPrint("�ݒu���Ă��Ȃ��n���ɐG��Ă��܂��B");
		break;
	}

	EventEnd_();
}

//+++++++++++++++++++++++++++++++++++++++++++++++++
// �N�������F���A�N�^�[���N��������
//-------------------------------------------------
// ��ȗp�r�F���A�N�^�[�N����̃t���O�ݒ��
//           �ݒu���̑���Ȃǂ��s��
//+++++++++++++++++++++++++++++++++++++++++++++++++
function ReactorOn()
{
	EventEnd_();
}

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// �N�������F���A�N�^�[�|�C���g�Ȃǂ𒲂ׂ���
//----------------------------------------------------------
// ��ȗp�r�F�X�N���v�g�ݒu�̃��A�N�^�[�|�C���g�𒲂ׂ���
// ���ӓ_  �F�g�p����ۂ́AFadeIn()�Ȃǂ̃C�x���g�u���b�N��
//           SetReactorEvent_()�̖��߂�ǉ�����K�v������
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function ReactorAnalyze()
{
	EventEnd_();
}

//+++++++++++++++++++++++++++++++++++++++++++++++++++
// �N�������F���A�N�^�[���I��������
//---------------------------------------------------
// ��ȗp�r�F���A�N�^�[�@�\���n�e�e�ɂ���^�C�~���O��
//           �t���O�ݒ��ݒu���̑���Ȃǂ��s��
//+++++++++++++++++++++++++++++++++++++++++++++++++++
function ReactorOff()
{
	EventEnd_();
}

//===========================================================================
// ���[�J���֐��F�k�G���x�[�^�̋N����Ԃ̔���
//---------------------------------------------------------------------------
// ����    �F�Ȃ�
// �߂�l  �F�Ȃ�
//===========================================================================
function uChoiceMoveNorthEleveter()
{
	// �n���Q�K���փt���O���`�F�b�N
	if(GetEventFlg_("BFG_RELEASE_CENTER_BILL_B2F") == true){
		uNorthEleveterDown();
	}
	else{
		// �g�p�s���b�Z�[�W
		OpenMsgWnd_();
		ShowMsg_("NOT_MOVE_ELEVATOR");
		KeyInputWait_();
		CloseMsgWnd_();
		// �n�����Đݒu
		SetPointBoxEventMine_("mine_eleveter", true);
	}
}

//===========================================================================
// ���[�J���֐��F�k�G���x�[�^�̈ړ�����
//---------------------------------------------------------------------------
// ����    �F�Ȃ�
// �߂�l  �F�Ȃ�
//===========================================================================
function uNorthEleveterDown()
{
	OpenMsgWnd_();
	ShowMsg_("MOVE_NORTH_ELEVATOR");
	KeyInputWait_();
	if(GetQueryResult_() == QUERY_YES){
		CloseMsgWnd_();
		// �G���x�[�^���g�p�����^�C�~���O�Ńf���𗬂��^�C�~���O�Ɣ�����ꍇ�t�F�[�h�̎�ނ�؂�ւ���ׂ̃t���O
		SetEventFlg_("BFG_CHECK_USED_ELEVATER_FADE_OFF", true);
		// �G���x�[�^�ňړ�SE
		PlaySE_("SE_FLD_061");
		// �n���Q�K�Ɉړ�
		ChangeMapPosDir_("A01_02", Vec3(A01_02_RTN_POS_N_X, A01_02_RTN_POS_N_Y, A01_02_RTN_POS_N_Z), RTN_DIR_N);
	}
	else{
		CloseMsgWnd_();
		// �n�����Đݒu
		SetPointBoxEventMine_("mine_eleveter", true);
	}
}

//===========================================================================
// ���[�J���֐��F���G���x�[�^�̈ړ�����
//---------------------------------------------------------------------------
// ����    �F�Ȃ�
// �߂�l  �F�Ȃ�
//===========================================================================
function uChoiceMoveEastEleveter()
{
	// �J�[�\���̈ʒu���P�K�ɂ���( 2��DB #6698 )
	SetQueryDefault_(QUERY_2);
	
	OpenMsgWnd_();
	ShowMsg_("CHOICE_MOVE_UP_OR_DOWN");
	KeyInputWait_();
	switch(GetQueryResult_()){
	// �R�O�K
	case QUERY_0:
		CloseMsgWnd_();
		// �G���x�[�^���g�p�����^�C�~���O�Ńf���𗬂��^�C�~���O�Ɣ�����ꍇ�t�F�[�h�̎�ނ�؂�ւ���ׂ̃t���O
		SetEventFlg_("BFG_CHECK_USED_ELEVATER_FADE_OFF", true);
		// �G���x�[�^�ňړ�SE
		PlaySE_("SE_FLD_061");
		// �R�O�K�Ɉړ�
		ChangeMapPosDir_("A03_01", Vec3(A03_01_RTN_POS_E_X, A03_01_RTN_POS_E_Y, A03_01_RTN_POS_E_Z), RTN_DIR_E);
		break;
	// �Q�X�K
	case QUERY_1:
		CloseMsgWnd_();
		// �G���x�[�^���g�p�����^�C�~���O�Ńf���𗬂��^�C�~���O�Ɣ�����ꍇ�t�F�[�h�̎�ނ�؂�ւ���ׂ̃t���O
		SetEventFlg_("BFG_CHECK_USED_ELEVATER_FADE_OFF", true);
		// �G���x�[�^�ňړ�SE
		PlaySE_("SE_FLD_061");
		// �Q�X�K�Ɉړ�
		ChangeMapPosDir_("A03_00", Vec3(A03_00_RTN_POS_E_X, A03_00_RTN_POS_E_Y, A03_00_RTN_POS_E_Z), RTN_DIR_E);
		break;
	// �P�K
	case QUERY_2:
		CloseMsgWnd_();
		// �G���x�[�^���g�p�����^�C�~���O�Ńf���𗬂��^�C�~���O�Ɣ�����ꍇ�t�F�[�h�̎�ނ�؂�ւ���ׂ̃t���O
		SetEventFlg_("BFG_CHECK_USED_ELEVATER_FADE_OFF", true);
		// �G���x�[�^�ňړ�SE
		PlaySE_("SE_FLD_061");
		// �P�K�Ɉړ�
		ChangeMapPosDir_("A01_00", Vec3(A01_00_RTN_POS_E_X, A01_00_RTN_POS_E_Y, A01_00_RTN_POS_E_Z), RTN_DIR_E);
		break;
	// ��߂�
	case QUERY_3:
		CloseMsgWnd_();
		// �n�����Đݒu
		SetPointBoxEventMine_("mine_east_eleveter", true);
		break;
	}
}

//=================================================================
// ���[�J���֐��F�f�B�X�N�V�X�e���̏���
//-----------------------------------------------------------------
// ����    �F�Ȃ�
// �߂�l  �F�Ȃ�
//=================================================================
function uDiscDeviceMine()
{
	DeleteEventMine_(mine_DiscDevice);
	CommPlayerTurnAroundObj(g_DiscDevice);
	// ��b����
	if(GetEventFlg_("BFG_DISPLAYED_DISC_SYSTEM_MSG") == false){
		SetEventFlg_("BFG_DISPLAYED_DISC_SYSTEM_MSG", true);
		// ���񃁃b�Z�[�W
		OpenMsgWnd_();
		ShowMsg_("DISC_SYSTEM_MSG_001");
		KeyInputWait_();
		CloseMsgWnd_();
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_DISC_SYSTEM");
		ShowMsg_("DISC_SYSTEM_MSG_002");
	}
	else{
		// �ʏ탁�b�Z�[�W
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_DISC_SYSTEM");
		ShowMsg_("DISC_SYSTEM_MSG_003");
	}
	KeyInputWait_();
	switch(GetQueryResult_()){
	// �͂�
	case QUERY2_0:
		CloseMsgWnd_();
		GotoMenuFadeOpen(MENU_OPEN.DISC_FACILITY);
		break;
	// ������
	case QUERY2_1:
		local msg;
		if(GetEventFlg_("BFG_DISPLAYED_DISC_SYSTEM_MSG") == false){
			msg = "DISC_SYSTEM_MSG_002_NO";
		}
		else{
			msg = "DISC_SYSTEM_MSG_003_NO";
		}
		ShowMsg_(msg);
		KeyInputWait_();
		CloseMsgWnd_();
		break;
	}
	Wait_(15);
	// �n���̍Ĕz�u
	SetPointCircleEventMine_("mine_disc_device", true);
}

//=================================================================
// ���[�J���֐��F�A���}�̉�b����
//-----------------------------------------------------------------
// ����    �F�Ȃ�
// �߂�l  �F�Ȃ�
//=================================================================
function uAromaMsg()
{
	local main_num    = GetNumFlg_("NUM_SCENARIO_MAIN");
	local outside_num = GetNumFlg_("NUM_SCENARIO_SUB_INSIDE_CLEAR"); // �\�V�i���I�N���A��
	if(main_num == GetFlagID_("CONST_SM_INSIDE_CLEAR")){
		// NUM000 == 9 ���� NUM010 == 8 �̎�
		if(outside_num == GetFlagID_("CONST_SS_OS_GET_DISC_ACCESSORY")){
			// �f�B�X�N���E��1�ł��L�[�A�C�e�����擾���Ă���
			if(CommAccessoryCheck() == true){
				CommLostAccessoryCheck();
				uWaitNpcFade();
				// �T�u�t���O��i�߂�
				SetNumFlg_("NUM_SCENARIO_SUB_INSIDE_CLEAR", GetFlagID_("CONST_SS_OS_GO_POINT_ZERO_LAB_2"));
				// �[���f��[��������ւ̈ē�]�Đ��t���O�𗧂Ă�
				SetEventFlg_("BFG_PLAY_PSEUDO_DEMO_A01_01", true);
				ChangeMap_("A01_01");
			}
			// ����ȊO
			else{
				OpenMsgWnd_();
				SetTalkName_("NAME_TAG_AROMA");
				ShowMsg_("AROMA_MSG_002");
				KeyInputWait_();
				CloseMsgWnd_();
			}
		}
		// NUM000 == 9 ���� NUM010 == 9 �̎�
		else if(outside_num == GetFlagID_("CONST_SS_OS_GO_POINT_ZERO_LAB_2")){
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_AROMA");
			ShowMsg_("AROMA_MSG_004"); // �|�C���g�[���ɂ��錤�����ɍs���Ȃ����B
			KeyInputWait_();
			switch(GetQueryResult_()){
			// �͂�
			case QUERY2_0:
				ShowMsg_("AROMA_MSG_004_YES");
				KeyInputWait_();
				CloseMsgWnd_();
				break;
			// ������
			case QUERY2_1:
				ShowMsg_("AROMA_MSG_004_NO");
				KeyInputWait_();
				CloseMsgWnd_();
				break;
			}
		}
		// NUM000 == 9 ���� NUM010 == 36 �̎�
		else if(outside_num == GetFlagID_("CONST_SS_OS_TALKED_AROMA")){
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_AROMA");
			ShowMsg_("AROMA_MSG_005"); // ��l���c�c�b������́B
			KeyInputWait_();
			switch(GetQueryResult_()){
			// �͂�
			case QUERY2_0:
				ShowMsg_("AROMA_MSG_005_YES");
				KeyInputWait_();
				CloseMsgWnd_();
				// �T�u�t���O��i�߂�
				SetNumFlg_("NUM_SCENARIO_SUB_INSIDE_CLEAR", GetFlagID_("CONST_SS_OS_TALKED_AROMA_2"));
				
				// F.O�Ɠ����ɑ���������
				SetStepSe_(npc_Nocho_B, SILENT_STEP_SE);
				SetStepSe_(npc_RecShop, SILENT_STEP_SE);
				
				// Demo831[�̋��̐�]�̍Đ�
				StopBgmChangeDemo(831);
				break;
			// ������
			case QUERY2_1:
				ShowMsg_("AROMA_MSG_005_NO");
				KeyInputWait_();
				CloseMsgWnd_();
				break;
			}
		}
	}
}

//=================================================================
// ���[�J���֐��F���i�[�e�̉�b����
//-----------------------------------------------------------------
// ����    �F�Ȃ�
// �߂�l  �F�Ȃ�
//=================================================================
function uRenateMsg()
{
	local main_num    = GetNumFlg_("NUM_SCENARIO_MAIN");
	local outside_num = GetNumFlg_("NUM_SCENARIO_SUB_INSIDE_CLEAR"); // �\�V�i���I�N���A��
	local allclear_num = GetNumFlg_("NUM_SCENARIO_SUB_ALL_CLEAR");   // ���S�N���A��
	if(main_num == GetFlagID_("CONST_SM_INSIDE_CLEAR")){
		// NUM000 == 9 ���� NUM010 == 36 �̎�
		if(outside_num == GetFlagID_("CONST_SS_OS_TALKED_AROMA")){
//			OpenMsgWnd_();
//			SetTalkName_("NAME_TAG_RENERTE");
//			ShowMsg_("RENATE_MSG_001");
//			KeyInputWait_();
//			CloseMsgWnd_();
		}
	}
	else if(main_num == GetFlagID_("CONST_SM_ALL_CLEAR")){
		if(allclear_num == GetFlagID_("CONST_SS_ALL_GO_TO_CENTER_BILL_B2F")){
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_RENERTE");
			ShowMsg_("RENATE_MSG_002");
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
}

//=================================================================
// ���[�J���֐��F�m�`���a�̉�b����
//-----------------------------------------------------------------
// ����    �F�Ȃ�
// �߂�l  �F�Ȃ�
//=================================================================
function uNochoBMsg()
{
	local main_num    = GetNumFlg_("NUM_SCENARIO_MAIN");
	local outside_num = GetNumFlg_("NUM_SCENARIO_SUB_INSIDE_CLEAR"); // �\�V�i���I�N���A��
	local allclear_num = GetNumFlg_("NUM_SCENARIO_SUB_ALL_CLEAR");   // ���S�N���A��
	if(main_num == GetFlagID_("CONST_SM_INSIDE_CLEAR")){
		// NUM000 == 9 ���� NUM010 == 36 �̎�
		if(outside_num == GetFlagID_("CONST_SS_OS_TALKED_AROMA")){
			OpenMsgWnd_();
			ShowMsg_("NOCHO_B_MSG_001");
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
	else if(main_num == GetFlagID_("CONST_SM_ALL_CLEAR")){
		if(allclear_num == GetFlagID_("CONST_SS_ALL_GO_TO_CENTER_BILL_B2F")){
			OpenMsgWnd_();
			ShowMsg_("NOCHO_B_MSG_002");
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else if(allclear_num >= GetFlagID_("CONST_SS_ALL_UNLOCK_BATTLE_GP")){
			OpenMsgWnd_();
			ShowMsg_("NOCHO_B_MSG_003");
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
}

//=================================================================
// ���[�J���֐��F�s�����`�̉�b����
//-----------------------------------------------------------------
// ����    �F�Ȃ�
// �߂�l  �F�Ȃ�
//=================================================================
function uCitizenWomMsg()
{
	local main_num    = GetNumFlg_("NUM_SCENARIO_MAIN");
	local outside_num = GetNumFlg_("NUM_SCENARIO_SUB_INSIDE_CLEAR"); // �\�V�i���I�N���A��
	local allclear_num = GetNumFlg_("NUM_SCENARIO_SUB_ALL_CLEAR");   // ���S�N���A��
	if(main_num == GetFlagID_("CONST_SM_INSIDE_CLEAR")){
		// NUM000 == 9 ���� NUM010 == 36 �̎�
		if(outside_num == GetFlagID_("CONST_SS_OS_TALKED_AROMA")){
			OpenMsgWnd_();
			ShowMsg_("CITIZEN_WOMAN_MSG_001");
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
	else if(main_num == GetFlagID_("CONST_SM_ALL_CLEAR")){
		if(allclear_num == GetFlagID_("CONST_SS_ALL_GO_TO_CENTER_BILL_B2F")){
			OpenMsgWnd_();
			ShowMsg_("CITIZEN_WOMAN_MSG_002");
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else if(allclear_num >= GetFlagID_("CONST_SS_ALL_UNLOCK_BATTLE_GP")){
			OpenMsgWnd_();
			ShowMsg_("CITIZEN_WOMAN_MSG_003");
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
}

//=================================================================
// ���[�J���֐��F���A�N�^�[���̉�b����
//-----------------------------------------------------------------
// ����    �F�Ȃ�
// �߂�l  �F�Ȃ�
//=================================================================
function uRecShopMsg()
{
	local main_num    = GetNumFlg_("NUM_SCENARIO_MAIN");
	local outside_num = GetNumFlg_("NUM_SCENARIO_SUB_INSIDE_CLEAR"); // �\�V�i���I�N���A��
	// ���V�i���I��
	if(main_num == GetFlagID_("CONST_SM_INSIDE_CLEAR")){
		// NUM010 �� 10�`11�̎�
		if(outside_num >= GetFlagID_("CONST_SS_OS_COLLECT_STAR_PIECE")
		&& outside_num <= GetFlagID_("CONST_SS_OS_COLLECT_STAR_PIECE_2")){
			local msg;
			if(GetEventFlg_("BFG_TALKED_RECSHOP_A01_01") == false){
				// ����
				msg = "REC_SHOP_MSG_001";
				SetEventFlg_("BFG_TALKED_RECSHOP_A01_01", true);
			}
			else{
				// �ʏ�
				msg = "REC_SHOP_MSG_002";
			}
			OpenMsgWnd_();
			ShowMsg_(msg);
			KeyInputWait_();
			switch(GetQueryResult_()){
			// �͂�
			case QUERY2_0:
				ShowMsg_("REC_SHOP_MSG_YES");
				KeyInputWait_();
				CloseMsgWnd_();
				break;
			// ������
			case QUERY2_1:
				ShowMsg_("REC_SHOP_MSG_NO");
				KeyInputWait_();
				CloseMsgWnd_();
				break;
			}
		}
		// NUM010 �� 12 �` 35 �̎�
		else if(outside_num >= GetFlagID_("CONST_SS_OS_GO_TO_CORE")
		&& outside_num <= GetFlagID_("CONST_SS_OS_EXAMINE_STAR_SEED_2")){
			OpenMsgWnd_();
			ShowMsg_("REC_SHOP_MSG_003");
			KeyInputWait_();
			CloseMsgWnd_();
		}
		// ���i�[�e�~�o��
		else if(outside_num == GetFlagID_("CONST_SS_OS_TALKED_AROMA")){
			OpenMsgWnd_();
			ShowMsg_("REC_SHOP_MSG_004");
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
	// ���S�N���A��
	else if(main_num == GetFlagID_("CONST_SM_ALL_CLEAR")){
		OpenMsgWnd_();
		ShowMsg_("REC_SHOP_MSG_004");
		KeyInputWait_();
		CloseMsgWnd_();
	}
}

//=================================================================
// ���[�J���֐��F���W�X�^���X�j�̉�b����
//-----------------------------------------------------------------
// ����    �F�Ȃ�
// �߂�l  �F�Ȃ�
//=================================================================
function uResistManMsg()
{
	local main_num    = GetNumFlg_("NUM_SCENARIO_MAIN");
	local outside_num = GetNumFlg_("NUM_SCENARIO_SUB_INSIDE_CLEAR"); // �\�V�i���I�N���A��
	local allclear_num = GetNumFlg_("NUM_SCENARIO_SUB_ALL_CLEAR");   // ���S�N���A��
	if(main_num == GetFlagID_("CONST_SM_INSIDE_CLEAR")){
		// NUM000 == 9 ���� NUM010 == 36 �̎�
		if(outside_num == GetFlagID_("CONST_SS_OS_TALKED_AROMA")){
			OpenMsgWnd_();
			ShowMsg_("RESISTANCE_MAN_A_MSG_001");
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
	else if(main_num == GetFlagID_("CONST_SM_ALL_CLEAR")){
		if(allclear_num == GetFlagID_("CONST_SS_ALL_GO_TO_CENTER_BILL_B2F")){
			OpenMsgWnd_();
			ShowMsg_("RESISTANCE_MAN_A_MSG_002");
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else if(allclear_num >= GetFlagID_("CONST_SS_ALL_UNLOCK_BATTLE_GP")){
			OpenMsgWnd_();
			ShowMsg_("RESISTANCE_MAN_A_MSG_003");
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
}

//=================================================================
// ���[�J���֐��F���W�X�^���X���̉�b����
//-----------------------------------------------------------------
// ����    �F�Ȃ�
// �߂�l  �F�Ȃ�
//=================================================================
function uResistWomMsg()
{
	local main_num    = GetNumFlg_("NUM_SCENARIO_MAIN");
	local outside_num = GetNumFlg_("NUM_SCENARIO_SUB_INSIDE_CLEAR"); // �\�V�i���I�N���A��
	local allclear_num = GetNumFlg_("NUM_SCENARIO_SUB_ALL_CLEAR");   // ���S�N���A��
	if(main_num == GetFlagID_("CONST_SM_INSIDE_CLEAR")){
		// NUM000 == 9 ���� NUM010 == 36 �̎�
		if(outside_num == GetFlagID_("CONST_SS_OS_TALKED_AROMA")){
			OpenMsgWnd_();
			ShowMsg_("RESISTANCE_WOMAN_A_MSG_001");
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
	else if(main_num == GetFlagID_("CONST_SM_ALL_CLEAR")){
		if(allclear_num == GetFlagID_("CONST_SS_ALL_GO_TO_CENTER_BILL_B2F")){
			OpenMsgWnd_();
			ShowMsg_("RESISTANCE_WOMAN_A_MSG_002");
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else if(allclear_num >= GetFlagID_("CONST_SS_ALL_UNLOCK_BATTLE_GP")){
			OpenMsgWnd_();
			ShowMsg_("RESISTANCE_WOMAN_A_MSG_003");
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
}

//=================================================================
// ���[�J���֐��F�[���f��[��������ւ̈ē�]
//-----------------------------------------------------------------
// ����    �F�Ȃ�
// �߂�l  �F�Ȃ�
//=================================================================
function uPlayableDemo()
{
// �Ó]
	uWaitNpcFade();
// ����
	// ��l���̈ʒu
	local player_pos = Vec3(72.00, 0.00, 11.625);
	local player_dir = 180;
	// �E�F�C�g
	local wait_speed     = 15;
	local wait_speed_def = 30;
	// �v���C���[ID
	local player = GetPlayerId_();
	// �J�����̊p�x
	local cam_dir = 130;
	// ��풓���[�V�����Ǎ�(��l�����Ȃ���)
	local nod = ReadMotion_(player, "Player_nod");
	// ��`�������l���Z�b�g
	Wait_(wait_speed);
	SetPos_(player, player_pos);
	SetDir_(player, player_dir);
	SetCameraDir_(cam_dir);
	SetDirToPlayer_(npc_Aroma);
	// �A���}(�ҋ@���[�V��������b���[�V����)
	SetMotion_(npc_Aroma, "TALKLOOP", BLEND_N);
// �Ó]����
	SetFade_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
	Wait_(FADE_DEF);
	// ���b�Z�[�W�\��
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_AROMA");
	ShowMsg_("AROMA_MSG_003");
	KeyInputWait_();
	CloseMsgWnd_();
	// �A���}(��b���[�V�������ҋ@���[�V����)
	SetMotion_(npc_Aroma, "WAIT", BLEND_L);
	Wait_(wait_speed);
	// ��l�������Ȃ���
	SetMotion_(player, nod, BLEND_M);
	Wait_(wait_speed_def);
// �Ó]
	uWaitNpcFade();
	// �J�������Đݒ�
	SetCameraDir_(-135);
// �Ó]����
	SetFade_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
	SetFadeSub_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
	Wait_(FADE_DEF);
}

//============================================================================
// ���[�J���֐��F�b���������炷���Ƀt�F�[�h���n�܂�悤�ɂ���֐�
//----------------------------------------------------------------------------
// ����    �F�Ȃ�
// �߂�l  �F�Ȃ�
//============================================================================
function uWaitNpcFade()
{
	// �b���������炷���Ƀt�F�[�h���n�܂�悤�ɂ���
	local fade_spd = 15;
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, fade_spd);
	SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, fade_spd);
	WaitFade_();
}

