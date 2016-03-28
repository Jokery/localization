//===================== ���_�y������(�y��)�z====================

// �ϐ���`
main_num		 <- C_NONE_ID;
op_num			 <- C_NONE_ID;
green_num		 <- C_NONE_ID;
sky_num			 <- C_NONE_ID;

main_num_sub	 <- "NUM_SCENARIO_MAIN";
op_num_sub		 <- "NUM_SCENARIO_SUB_OP";
green_num_sub	 <- "NUM_SCENARIO_SUB_GREEN";
sky_num_sub		 <- "NUM_SCENARIO_SUB_SKY";

//------------------------------------------------
//		�퓬�I����
//------------------------------------------------
function AfterBattle()
{
	main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");		// Num0
	op_num		 = GetNumFlg_("NUM_SCENARIO_SUB_OP");	// Num1
	green_num	 = GetNumFlg_("NUM_SCENARIO_SUB_GREEN");// Num2
	sky_num		 = GetNumFlg_("NUM_SCENARIO_SUB_SKY");	// Num9
	
	/*
		�����Ȃ�
	*/
	
	EventEnd_();
}


//------------------------------------------------
//		�}�b�v�ɓ���O
//------------------------------------------------
function BeforeInitMap()
{
	main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");		// Num0
	op_num		 = GetNumFlg_("NUM_SCENARIO_SUB_OP");	// Num1
	green_num	 = GetNumFlg_("NUM_SCENARIO_SUB_GREEN");// Num2
	sky_num		 = GetNumFlg_("NUM_SCENARIO_SUB_SKY");	// Num9
	
	// �K���r������H02_00�ɓ�������
	if(main_num == GetFlagID_("CONST_SM_SKY")){
		if(sky_num == 0){
			//���C�h��������
			SetRideOffStart_();
		}
	}
	
	EventEnd_();
}


//------------------------------------------------
//		�t�F�[�h�A�E�g��
//------------------------------------------------
function FadeIn()
{
	// �t���O���擾
	main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");		// Num0
	op_num		 = GetNumFlg_("NUM_SCENARIO_SUB_OP");	// Num1
	green_num	 = GetNumFlg_("NUM_SCENARIO_SUB_GREEN");// Num2
	sky_num		 = GetNumFlg_("NUM_SCENARIO_SUB_SKY");	// Num9
	DebugPrint(" ");
	DebugPrint("NUM_SCENARIO_MAIN �̒l�� " + main_num + " �ɂȂ�܂����B");
	DebugPrint("NUM_SCENARIO_SUB_OP �̒l�� " + op_num + " �ɂȂ�܂����B");
	DebugPrint("NUM_SCENARIO_SUB_SKY �̒l�� " + sky_num + " �ɂȂ�܂����B");

	//---------------
	// ���M�~�b�N�z�u
	//---------------
	// ���T���`���̎c�[
	if(main_num <= GetFlagID_("CONST_SM_CORE")){										// Num0 = 7 �ȉ�
		local g_Sancho = ReadGimmick_("o_dem_09");	// �T���`���̎c�[
		gim_sancho <- C_NONE_ID;					// ������
		gim_sancho = ArrangePointGimmick_("o_dem_09", g_Sancho, "g_Sancho");
	}

	// �����A�N�^�[�|�b�h<�풓>
	local pod_id = ReadGimmick_("o_dem_26");
	gim_rec_pod <- C_NONE_ID;
	gim_rec_pod = ArrangePointGimmick_("o_dem_26", pod_id, "g_pod");

	// ��S�����N�p���m���X
	if(main_num >= GetFlagID_("CONST_SM_SKY")											// Num0 = 8 �ȏ�
	&& sky_num  >= GetFlagID_("CONST_SS_SK_GO_TO_THE_COLOSSEUM")						// Num9 = 3 �ȏ�
	|| main_num >= GetFlagID_("CONST_SM_INSIDE_CLEAR")){								// Num0 = 9 �ȏ�
		local g_monolith = ReadGimmick_("o_com_02");
		monolith_s <- ArrangePointGimmick_("o_com_02", g_monolith, "obj_S_monolith");
		// ���m���X(�u�N���O�ҋ@�v�̃A�j����ݒ�)
		SetMotion_(monolith_s, "GIMMICK_0", 0);
		if(GetEventFlg_("BFG_START_S_MONOLITH") == true){
			// ���m���X�̋N����ҋ@�A�j�����Đ�
			SetMotion_(monolith_s, MOT_GIMMICK_2, BLEND_N);
			DebugPrint("���m���X�̃A�j����GIMMICK_2�ł�");
		}
	}

	//----------
	// ��NPC�z�u
	//----------
	// �����i�[�e(�I�[�v�j���O�V�i���I)
	if(main_num == GetFlagID_("CONST_SM_OPENING")){										// Num0 = 0
		if(op_num == GetFlagID_("CONST_SS_OP_APPEAR_RENATE")){
			local id_renate01 = ReadNpc_("n007");
			local npc_renate01 = ArrangePointNpc_(id_renate01, "npc_renate01");
			SetTalkEnable_(npc_renate01, false);	// ��b�����Ȃ�
		}
	}
	
	// �����i�[�e(����V�i���I)
	if(main_num == GetFlagID_("CONST_SM_SKY")){											// Num0 = 8
		if(sky_num < GetFlagID_("CONST_SS_SK_FIND_OUT_THE_S_DOOR")){					// Num9 < 4
			local id_renate02 = ReadNpc_("n007");
			g_npc_renate02 <- C_NONE_ID;
			g_npc_renate02 = ArrangePointNpc_(id_renate02, "npc_renate02");
			SetTalkCameraType_(g_npc_renate02, TALK_CAMERA_UP);
			SetReactorMsg_(g_npc_renate02, "NPC_RENATE_030");
			// ��b�J�������ɓ��߂����̂ŃA���t�@�l��ݒ肷��
			SetManualCalcAlpha_(g_npc_renate02, true);
			SetAlpha_(g_npc_renate02, 1.0);
		} else if(sky_num < GetFlagID_("CONST_SS_SK_GO_CITY_SKY")){						// Num9 < 12
			// �z�u���Ȃ�
		} else {
			local id_renate02 = ReadNpc_("n007");
			g_npc_renate02 <- C_NONE_ID;
			g_npc_renate02 = ArrangePointNpc_(id_renate02, "npc_renate02");
			SetTalkCameraType_(g_npc_renate02, TALK_CAMERA_UP);
			SetReactorMsg_(g_npc_renate02, "NPC_RENATE_030");
			// ��b�J�������ɓ��߂����̂ŃA���t�@�l��ݒ肷��
			SetManualCalcAlpha_(g_npc_renate02, true);
			SetAlpha_(g_npc_renate02, 1.0);
		}
	}

	//-----------
	// ���n���z�u
	//-----------
	// ID������
	mine_001 			<- C_NONE_ID;
	mine_002 			<- C_NONE_ID;
	g_mine_s_monolith 	<- C_NONE_ID;
	g_mine_reactor_pod	<- C_NONE_ID;
	
	// �����̏o���t�߂ɐݒu�����n��
	if(main_num == GetFlagID_("CONST_SM_OPENING")){										// Num0 = 0
		if(op_num == GetFlagID_("CONST_SS_OP_APPEAR_RENATE")){
			mine_001 = SetPointBoxEventMine_("m_001", false);
		}
	}

	// ���T���`���̎c�[
	if(main_num <= GetFlagID_("CONST_SM_CORE")){										// Num0 = 7 �ȉ�
		mine_002 = SetPointCircleEventMine_("m_002", true);
	}

	// ��S�����N�p���m���X
	if(main_num >= GetFlagID_("CONST_SM_SKY")											// Num0 = 8 �ȏ�
	&& sky_num  >= GetFlagID_("CONST_SS_SK_GO_TO_THE_COLOSSEUM")						// Num9 = 3 �ȏ�
	|| main_num >= GetFlagID_("CONST_SM_INSIDE_CLEAR")){								// Num0 = 9 �ȏ�
		g_mine_s_monolith = SetPointCircleEventMine_("mine_S_monolith", true);
	}

	// �����A�N�^�[�|�b�h�p�n��
	g_mine_reactor_pod = SetPointCircleEventMine_("mine_reactor_pod", true);

	//-------------------------
	// �����A�N�^�[�|�C���g�z�u
	//-------------------------
	// ���T���`��
	if(main_num <= GetFlagID_("CONST_SM_CORE")){										// Num0 = 7 �ȉ�
		local reactorPoint01 = ArrangeMsgReactorPoint("reactor_point_01", GetFlagID_("BFG_REACTER_POINT_038")
			, SHORT_DIST, "REC_POINT_01_01", "REC_POINT_01_02");
	}
	// ��S�����N�p���m���X
	if(main_num >= GetFlagID_("CONST_SM_SKY")											// Num0 = 8 �ȏ�
	&& sky_num  >= GetFlagID_("CONST_SS_SK_GO_TO_THE_COLOSSEUM")						// Num9 = 3 �ȏ�
	|| main_num >= GetFlagID_("CONST_SM_INSIDE_CLEAR")){								// Num0 = 9 �ȏ�
		local reactorPoint02 = ArrangeMsgReactorPoint("reactor_point_02", GetFlagID_("BFG_REACTER_POINT_039")
			, SHORT_DIST, "REC_POINT_02_01", "REC_POINT_02_02");
	}
	// �����A�N�^�[�|�b�h
	local reactorPoint03 = ArrangeMsgReactorPoint("reactor_point_03", GetFlagID_("BFG_REACTER_POINT_130")
	, SHORT_DIST, "REC_POINT_03_01", "REC_POINT_03_02");

	//-----------------
	// ���}�b�v�i�r�z�u
	//-----------------
	// ���u�I�v�A�C�R��
	// ��S�����N�p���m���X
	if(main_num >= GetFlagID_("CONST_SM_SKY")											// Num0 = 8 �ȏ�
	&& sky_num  >= GetFlagID_("CONST_SS_SK_GO_TO_THE_COLOSSEUM")						// Num9 = 3 �ȏ�
	|| main_num >= GetFlagID_("CONST_SM_INSIDE_CLEAR")){								// Num0 = 9 �ȏ�
		local exclamation01 = ArrangePointNaviMapIcon_(NAVIMAP_ICON.EXCLAMATION, "obj_S_monolith"); // �F�ؑ��u
		SetNaviMapIconVisible_(exclamation01, true);
	}

	EventEnd_();
}

//------------------------------------------------
//		�t�B�[���h����J�n
//------------------------------------------------
function EventStartOperate()
{
	main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");		// Num0
	op_num		 = GetNumFlg_("NUM_SCENARIO_SUB_OP");	// Num1
	green_num	 = GetNumFlg_("NUM_SCENARIO_SUB_GREEN");// Num2
	sky_num		 = GetNumFlg_("NUM_SCENARIO_SUB_SKY");	// Num9
	DebugPrint(" ");
	DebugPrint("NUM_SCENARIO_MAIN �̒l�� " + main_num + " �ɂȂ�܂����B");
	DebugPrint("NUM_SCENARIO_SUB_OP �̒l�� " + op_num + " �ɂȂ�܂����B");
	DebugPrint("NUM_SCENARIO_SUB_GREEN �̒l�� " + green_num + " �ɂȂ�܂����B");
	DebugPrint("NUM_SCENARIO_SUB_SKY �̒l�� " + sky_num + " �ɂȂ�܂����B");
	
	// ������(H02_00)�ŕ��A�����ۂ̍��W�ƌ���
	local rtn_demo_pos = Vec3(-105.17, 0.0, -24.299);
	local rtn_demo_dir = 0;

	//-----------
	// �f���̍Đ�
	//-----------
	// �I�[�v�j���O�V�i���I
	if(main_num == GetFlagID_("CONST_SM_OPENING")){										// Num0 = 0
		if(op_num == GetFlagID_("CONST_SS_OP_SELECT_MONSTER")){
			// �f���Đ��O�Ƀt�B�[���h���f��Ȃ����߂̑Ή�
			SetFade_(FADE_OUT, FADE_COLOR_WHITE, FADE_SHORT);
			SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
			WaitFade_();
			// �i�s�t���O��i�߂�
			SetNumFlg_(op_num_sub, GetFlagID_("CONST_SS_OP_APPEAR_RENATE"));
			//����t�B�[���h�R�}���h���A�N�e�B�u�ɂ���
			SetEventFlg_("BFG_TOOL_PROHIBIT", false);
			// ��l���̈ʒu��ݒ�
			SetReturnDemoPosDir_(rtn_demo_pos, rtn_demo_dir);
			// Demo049[���i�[�e�o��A]���Đ�
			ChangeDemo_(49);
		}
		else if(op_num == GetFlagID_("CONST_SS_OP_COLLAPSE_PARADISE")){
			// �f���Đ��O�Ƀt�B�[���h���f��Ȃ����߂̑Ή�
			SetFade_(FADE_OUT, FADE_COLOR_WHITE, FADE_SHORT);
			SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
			WaitFade_();
			// �V�i���I�̃t���O��i�߂�
			SetNumFlg_(op_num_sub, GetFlagID_("CONST_SS_OP_ESCAPE_PARADISE"));
			SetNumFlg_(green_num_sub, 0);
			//���A�N�^�[�̏����@�\��Ԑݒ�
			SetEventFlg_("BFG_TRAVEL_INFO_SHOW_001", true);		// ���̐S���̍��ډ���t���O	�y��{�z�b���^����ׂ�
			// �����֔��
			SetReturnDemoMap_("H00_00");
			SetReturnDemoPosDir_(Vec3(1539.809, 496.073, -764.230), -91);
			// demo008[�����t�B�[���h����]���Đ�
			ChangeDemo_(8);
		}
	}
	
	// ����V�i���I
	if(main_num == GetFlagID_("CONST_SM_SKY")){											// Num0 = 8
		if(sky_num == GetFlagID_("CONST_SS_SK_CONFESSIONS_RENATE_1")){					// Num9 = 0
			SetNumFlg_(sky_num_sub, GetFlagID_("CONST_SS_SK_CONFESSIONS_RENATE_2"));	// Num9 = 1
			// Demo615[���i�[�e�̍����F����Map]
			EventStartChangeDemo(615, FADE_COLOR_BLACK);
		}
		else if(sky_num == GetFlagID_("CONST_SS_SK_CONFESSIONS_RENATE_2")){				// Num9 = 1
			SetNumFlg_(sky_num_sub, GetFlagID_("CONST_SS_SK_CONFESSIONS_RENATE_3"));	// Num9 = 2
			// Demo616[���i�[�e�̍����F���󃉃C�hMap]
			EventStartChangeDemo(616, FADE_COLOR_BLACK);
		}
		else if(sky_num == GetFlagID_("CONST_SS_SK_CONFESSIONS_RENATE_3")){				// Num9 = 2
			SetNumFlg_(sky_num_sub, GetFlagID_("CONST_SS_SK_GO_TO_THE_COLOSSEUM"));		// Num9 = 3
			//�f���Đ���̕��A���W���w��
			SetReturnDemoPosDir_(Vec3(-0.216, 0.0, 2.33), 145);
			// Demo617[���i�[�e�̍����F����Map]
			EventStartChangeDemo(617, FADE_COLOR_BLACK);
		}
		//�o�[�`�����R���V�A����S�����N�����
		else if(sky_num == GetFlagID_("CONST_SS_SK_GO_OUT_THE_COLOSSEUM_2")){			// Num9 = 99
			SetNumFlg_(sky_num_sub, 12);												// Num9 = 12
			// ���[�����t���C�g�V�O�i���֎~����������
			SetEventFlg_("BFG_PLAYERABILITY_RULER_PROHIBIT", false);					// ���[�� �֎~
			SetEventFlg_("BFG_FLIGHT_PROHIBIT", false);									// �t���C�g�V�O�i�� �֎~
			// �f����̕��A�ʒu���w��
			SetReturnDemoPosDir_(Vec3(20.915, 0.0, -1.250), -123);
			//Demo624[�e�C�N�I�t�̑O��]
			EventStartChangeDemo(624, FADE_COLOR_BLACK);
		}
	}
	
	
	EventEnd_();
}

//------------------------------------------------
//		�m�o�b�ڐG����
//------------------------------------------------
function BeforeTalkNpc()
{
	local target = GetTargetId_();
	
	// ���C�h���Ƀ��i�[�e�ɘb����������
	if(target == g_npc_renate02){
		SetRideTalkCamOffset(OFFSET_RENATE);
	}

	EventEnd_();
}

//------------------------------------------------
//		�m�o�b�ڐG��
//------------------------------------------------
function TouchNpc()
{
	// �V�i���I�̃t���O���擾����
	main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");		// Num0
	op_num		 = GetNumFlg_("NUM_SCENARIO_SUB_OP");	// Num1
	green_num	 = GetNumFlg_("NUM_SCENARIO_SUB_GREEN");// Num2
	sky_num		 = GetNumFlg_("NUM_SCENARIO_SUB_SKY");	// Num9
	
	// ID���擾
	local target = GetTargetId_();
	local player = GetPlayerId_();
	
	DebugPrint("ID: " + target + " �ɐڐG [TouchEventMine]");
	
	switch (target) {
	case g_npc_renate02 :
		
		if (sky_num <= GetFlagID_("CONST_SS_SK_GO_OUT_THE_COLOSSEUM_1")) {			// Num9 = 11 �ȉ�
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_RENERTE");
			ShowMsg_("NPC_RENERTE_010");				//�u�s���܂��傤  �o�[�`�����R���V�A���ցB
			KeyInputWait_();
			CloseMsgWnd_();
		}
		if (sky_num >= GetFlagID_("CONST_SS_SK_GO_CITY_SKY")) {						// Num9 = 12 �ȏ�
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_RENERTE");
			ShowMsg_("NPC_RENERTE_020");				//�u����l���̖��O��  �t���C�g�V�O�i����
			KeyInputWait_();
			CloseMsgWnd_();
		}
		break;
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
	// �V�i���I�̃t���O���擾����
	main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");		// Num0
	op_num		 = GetNumFlg_("NUM_SCENARIO_SUB_OP");	// Num1
	green_num	 = GetNumFlg_("NUM_SCENARIO_SUB_GREEN");// Num2
	sky_num		 = GetNumFlg_("NUM_SCENARIO_SUB_SKY");	// Num9

	// ID���擾
	local target = GetTouchEventMineId_();
	local player = GetPlayerId_();

	switch(target){

	// �����̏o���t��
	case mine_001:
		// �C�x���g�n�����폜
		DeleteEventMine_(mine_001);
		// �V�i���I�̃T�u�t���O��i�߂�
		SetNumFlg_(op_num_sub, GetFlagID_("CONST_SS_OP_COLLAPSE_PARADISE"));
		// �z�u�C��
		SetReturnDemoPosDir_(Vec3(7.042, 46.696, -75.398), 5);
		// demo050[�y������̒E�o](��demo008[�y������̒E�o])���Đ������
		ChangeDemo_(50);
		break;

	// ���T���`���̎c�[
	case mine_002:
		// �c�[�̕����Ɏ�l����������
		CommPlayerTurnAroundObj(gim_sancho);
		OpenMsgWnd_();
		ShowMsg_("MES_CARCASS_SANCHO");
		KeyInputWait_();
		CloseMsgWnd_();
		break;

	// ��S�����N�p���m���X
	case g_mine_s_monolith:
		// ��l�����o���Ɍ�����
		CommPlayerTurnAroundObj(monolith_s);
		// ���m���X�̃A�j�����Đ�(EventCommon)
		MonolithAnime(monolith_s, "BFG_START_S_MONOLITH", "obj_S_monolith");
		ChangeMapPosDir_("O01_00", Vec3(0.0, 10.0, -1260.0), 0);
		break;

	// �����A�N�^�[�|�b�h
	case g_mine_reactor_pod:
		// ��l�������A�N�^�[�|�b�h�̍��W�Ɍ�����< ���A�N�^�[�|�b�h�̓f�U�C���z�u�Ȃ̂ō��W���w�� >
		local pos = Vec3(-23.337, 0.000, 70.084);
		uPlayerTurnAroundPos(pos);
		OpenMsgWnd_();
		ShowMsg_("EXAMINE_POD_MSG");
		KeyInputWait_();
		CloseMsgWnd_();
		break;
	default:
		DebugPrint("�ݒu���Ă��Ȃ��n���ɐG��Ă��܂��B");
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

//======================================================
// ����֐��F�Ώۍ��W�Ɏ�l����U���������
//------------------------------------------------------
// �������F��l����U�����������W
// �߂�l  �F�Ȃ�
//======================================================
function uPlayerTurnAroundPos(pos)
{
	local player = GetPlayerId_();
	// �Ώە��̕����ɉ�](1F��11.4������])
	local rotateTask = Task_RotateToPosSetMotion_(player, pos, ROTATE_EVENT_DEF, MOT_WALK, MOT_WAIT);
	WaitTask(rotateTask);
	// �Ԃ���������
	Wait_(15);
}

