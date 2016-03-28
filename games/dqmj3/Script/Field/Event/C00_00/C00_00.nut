//===================== C00_00�R�A �P�w�ځi�����j ====================

// �ϐ���`
main_num	 <- C_NONE_ID;
core_num	 <- C_NONE_ID;
outside_num	 <- C_NONE_ID;

core_num_sub <- "NUM_SCENARIO_SUB_CORE";
outside_num_sub <- "NUM_SCENARIO_SUB_INSIDE_CLEAR";

//------------------------------------------------
//		�퓬�I����
//------------------------------------------------
function AfterBattle()
{
	main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");		// Num0
	core_num	 = GetNumFlg_("NUM_SCENARIO_SUB_CORE");	// Num8
	
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
	core_num	 = GetNumFlg_("NUM_SCENARIO_SUB_CORE");	// Num8
	outside_num	 = GetNumFlg_("NUM_SCENARIO_SUB_INSIDE_CLEAR");	// Num10
	
	// ���V�i���I�ŃR�A�ɓ�����Demo825[�R�A�̌���]���Đ�����^�C�~���O
	if(main_num == GetFlagID_("CONST_SM_INSIDE_CLEAR")){			// Num0  ==  9
		if(outside_num == GetFlagID_("CONST_SS_OS_GO_TO_CORE")){	// Num10 == 12
			//���C�h��������
			SetRideOffStart_();
		}
	}
	
	// ���C�h�����܂܈ړ����u���g���ė����烉�C�h��������
	if(GetEventFlg_("BFG_RIDE_OFF_USED_TRANSFER") == true){
		SetEventFlg_("BFG_RIDE_OFF_USED_TRANSFER", false);
		SetRideOffStart_();
	}
	
	EventEnd_();
}


//------------------------------------------------
//		�t�F�[�h�A�E�g��
//------------------------------------------------
function FadeIn()
{
	// �}�b�v���B�t���O
	SetEventFlg_("BFG_ARRIVE_AT_C00", true);
	// �Z�[�u�֎~������(�Z�[�u�֎~�}�b�v����A���Ă������p)
	SetEventFlg_("BFG_SAVE_PROHIBIT", false);		// �Z�[�u�֎~(Bit451)
	
	//�ϐ���`
	local	player;
	
	main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");		// Num0
	core_num	 = GetNumFlg_("NUM_SCENARIO_SUB_CORE");	// Num8
	outside_num	 = GetNumFlg_("NUM_SCENARIO_SUB_INSIDE_CLEAR");	// Num10
	
	player		 = GetPlayerId_();
	
	DebugPrint(" ");
	DebugPrint("NUM_SCENARIO_MAIN �̒l�� " + main_num + " �ɂȂ�܂����B");
	DebugPrint("NUM_SCENARIO_SUB_CORE �̒l�� " + core_num + " �ɂȂ�܂����B");
	
	//----------
	// ��PC�z�u(�f�o�b�O�p)
	//----------
	//	SetPos_(player, Vec3(0.0, -11.0, 0.0));
	//	SetDir_(player, 50);
	
	//----------
	// ��NPC�z�u
	//----------
	// ID������
	g_npc_renate <- C_NONE_ID;
	g_npc_aroma  <- C_NONE_ID;
	
	// ���i�[�e
	if(main_num == GetFlagID_("CONST_SM_CORE")){					// Num0 == 7
		if(core_num == GetFlagID_("CONST_SS_CO_GO_MOTHER_ROOM")){	// Num8 == 1
			local n000ResId = ReadNpc_("n007");
			g_npc_renate = ArrangePointNpc_(n000ResId, "npc_renate");
			SetReactorMsg_(g_npc_renate, "NPC_RENATE_REC");
			SetTalkCameraType_(g_npc_renate, TALK_CAMERA_UP);
			// ��b�J�������ɓ��߂����̂ŃA���t�@�l��ݒ肷��
			SetManualCalcAlpha_(g_npc_renate, true);
			SetAlpha_(g_npc_renate, 1.0);
		}
	}
	
	// �A���}
	if(main_num == GetFlagID_("CONST_SM_INSIDE_CLEAR")){				// Num0  ==  9
		if(outside_num == GetFlagID_("CONST_SS_OS_GO_TO_MOTHER_ROOM")){	// Num10 == 13
			g_npc_aroma = ReadAndArrangePointNpc("n018", "npc_aroma");
			SetTalkCameraType_(g_npc_aroma, TALK_CAMERA_UP);
			SetReactorMsg_(g_npc_aroma, "NPC_AROMA_REC");
			// ��b�J�������ɓ��߂����̂ŃA���t�@�l��ݒ肷��
			SetManualCalcAlpha_(g_npc_aroma, true);
			SetAlpha_(g_npc_aroma, 1.0);
		}
	}
	
	//-----------------
	// �������X�^�[�z�u
	//-----------------
	// �A���}�����Ȃ��������z�u����
	if(outside_num != GetFlagID_("CONST_SS_OS_GO_TO_MOTHER_ROOM")){	// Num10 != 13
		// �R�A�˓���(C00_00)�̃����X�^�[�z�u�𐧌䂷��t���O
		SetEventFlg_("BFG_DISPOSITION_MONSTER_C00_00", true);
	}
	
	//-----------
	// ���n���z�u
	//-----------
	// ID������
	g_mine_enter_transfer	 <- C_NONE_ID;
	g_mine_barrier <- C_NONE_ID;
	g_mine_ruler_point <- C_NONE_ID;
	
	// ���]�����u�i�ŔM�̉ΎR�j
	g_mine_enter_transfer 	= SetPointCircleEventMine_("mine_enter_transfer", true);
	
	// ���i���s��(���V�i���I)
	if(main_num == GetFlagID_("CONST_SM_INSIDE_CLEAR")){								// Num0  ==  9
		if(outside_num <= GetFlagID_("CONST_SS_OS_GO_TO_CORE")){						// Num10 == 12
			g_mine_barrier = SetPointCircleEventMine_("mine_barrier", false);
		}
	}
	
	// �����[���|�C���g
	g_mine_ruler_point = SetPointCircleEventMine_("mine_ruler_point", true);
	
	//---------------
	// ���M�~�b�N�z�u
	//---------------
	// ID������
	g_ruler_point <- C_NONE_ID;
	
	// ���o���A(�G�t�F�N�g)
	if(main_num == GetFlagID_("CONST_SM_INSIDE_CLEAR")){								// Num0  ==  9
		if(outside_num <= GetFlagID_("CONST_SS_OS_GO_TO_CORE")){						// Num10 == 12
			LoadEffect_("ef882_03_barrier_ren");
			local effectId = SetPointWorldEffect_("ef882_03_barrier_ren", "eff_barrier");
		}
	}
	
	// �����[���|�C���g
	local rulerpoint_id = ReadGimmick_("o_com_08");
	g_ruler_point = ArrangePointGimmick_("o_com_08", rulerpoint_id, "gim_ruler_point");
	SetMotion_(g_ruler_point, MOT_GIMMICK_0, BLEND_N);
	if(GetEventFlg_("BFG_RULER_ADD_024") == true){
		SetMotion_(g_ruler_point, MOT_GIMMICK_2, BLEND_N);
	}
	
	//-------------------------
	// �����A�N�^�[�|�C���g�z�u
	//-------------------------
	// ���ړ����u��
	local rec_point_transfer = ArrangeMsgReactorPoint("rec_transfer", GetFlagID_("BFG_REACTER_POINT_115")// Bit_1614 �R�A�̈ړ����u
		, SHORT_DIST, "REC_POINT_TRANSFER_010", "REC_POINT_TRANSFER_020");
	
	// �����[���|�C���g
	local reactorPoint01  = ArrangeMsgReactorPoint("ReactorPoint_01", GetFlagID_("BFG_REACTER_POINT_010")
		, SHORT_DIST, "REC_POINT_01_01", "REC_POINT_01_02");
	
	
	//-----------------
	// ���}�b�v�i�r�z�u
	//-----------------
	// �����[���|�C���g�A�C�R��
	if(GetEventFlg_("BFG_RULER_ADD_024") == true){				// Bit_224 ���[���ǉ� �R�A�@�˓���
		local ruler_icon = ArrangePointNaviMapIcon_(NAVIMAP_ICON.RULER_POINT , "gim_ruler_point");
		SetNaviMapIconVisible_(ruler_icon, true);
	}
	
	EventEnd_();
}


//------------------------------------------------
//		�t�B�[���h����J�n
//------------------------------------------------
function EventStartOperate()
{
	main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");									// Num0
	core_num	 = GetNumFlg_("NUM_SCENARIO_SUB_CORE");								// Num8
	outside_num	 = GetNumFlg_("NUM_SCENARIO_SUB_INSIDE_CLEAR");						// Num10
	
	//---------------------------------------------------------------------------------------
	// ���Z�[�u��ʂ̌Ăяo��(�嗤�Ԉړ��̏���f���Đ��O�ɁuSetEventFlg_("BFG_SAVE_POINT_FLAG", true);�v��ǉ����ĉ�����)
	//---------------------------------------------------------------------------------------
	// �R�A�ɗ��čŏ��̃^�C�~���O
	if(main_num == GetFlagID_("CONST_SM_CORE")){
		if(core_num == 0){
			CommSavedAfterTransferDemo("BFG_SCENARIO_CLEAR_VOLCANO");
		}
	}
	
	if (main_num == GetFlagID_("CONST_SM_CORE")) {									// Num0 = 7
		if (core_num == 0) {														// Num8 = 0
			SetNumFlg_(core_num_sub, GetFlagID_("CONST_SS_CO_GO_MOTHER_ROOM"));		// Num8 = 1
			SetReturnDemoPosDir_(Vec3(-150.941, 0.000, -59.218), 70);
			// Demo600[�R�A�E�S�i]�Đ�
			EventStartChangeDemo(600, FADE_COLOR_BLACK);
		}
	}
	
	if(main_num == GetFlagID_("CONST_SM_INSIDE_CLEAR")){								// Num0  ==  9
		if(outside_num == GetFlagID_("CONST_SS_OS_GO_TO_CORE")){						// Num10 == 12
			SetNumFlg_(outside_num_sub, GetFlagID_("CONST_SS_OS_GO_TO_MOTHER_ROOM"));	// Num10 == 13
			// �A���}�z�u���̓����X�^�[��z�u���Ȃ�
			SetEventFlg_("BFG_DISPOSITION_MONSTER_C00_00", false);
			// Demo825[�R�A�̌���]�̍Đ�
			SetReturnDemoPosDir_(Vec3(93.720, 0.000, 40.396), 90);
			EventStartChangeDemo(825, FADE_COLOR_BLACK);
		}
	}
	
	EventEnd_();
}


//==============================================================
// NPC�ɘb�������ĉ�b�̒��O�ŋN������C�x���g�u���b�N
//==============================================================
function BeforeTalkNpc()
{
	local target = GetTargetId_();
	
	// ���C�h���Ƀ��i�[�e�ɘb�����������͎��_�̃I�t�Z�b�g�l��Y���݂̂�ύX����
	// �y���Y�^�z�unpc_info.nut�v�Ŏ��_�ƒ����_�̃I�t�Z�b�g�l�����_�̒������Ă��܂��B
	//            �Ȃ̂ŁA�R�R�ōs�����_�̃I�t�Z�b�g�l�ύX�́unpc_info.nut�v�Ō��_���������l����
	//            ����ɒ������邱�ƂɂȂ�̂ŕύX���鎞�͗v���ӁB
	if(target == g_npc_renate){
		SetRideTalkCamOffset(OFFSET_RENATE);
	}

	EventEnd_();
}


//------------------------------------------------
//		�m�o�b�ڐG��
//------------------------------------------------
function TouchNpc()
{
	main_num = GetNumFlg_("NUM_SCENARIO_MAIN");     // Num0
	core_num = GetNumFlg_("NUM_SCENARIO_SUB_CORE"); // Num8
	
	local target = GetTargetId_();
	
	switch (target) {
	case g_npc_renate:
		uRenateMsg();
		break;
	case g_npc_aroma:
		uAromaMsg();
		break;
	default :
		DebugPrint("WARNING : MINE_ID���s���ł� [TouchEventMine]");
		break;
	}
	
	EventEnd_();
}

//------------------------------------------------
//		�n���ڐG��
//------------------------------------------------
function TouchEventMine()
{
	main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");		// Num0
	core_num	 = GetNumFlg_("NUM_SCENARIO_SUB_CORE");	// Num8
	
	local target = GetTouchEventMineId_();
	
	DebugPrint("ID: " + target + " �ɐڐG [TouchEventMine]");
	
	switch (target) {
	case g_mine_ruler_point:
		uMineRulerPoint();
		break;
	case g_mine_enter_transfer :
		uMineEnterTransfer();
		break;
	case g_mine_barrier :
		OpenMsgWnd_();
		ShowMsg_("BARRIER_MSG");
		KeyInputWait_();
		CloseMsgWnd_();
		CommPlayerTurnMoveDirWalk(-110);
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
//		���[���|�C���g�̒n���ɐG�ꂽ��
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineRulerPoint()
{
	CommPlayerTurnAroundObj(g_ruler_point);
	CommRulerPointEvent(g_ruler_point, "BFG_RULER_ADD_024", "gim_ruler_point");
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		���i�[�e�̃��b�Z�[�W����
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uRenateMsg()
{
	main_num = GetNumFlg_("NUM_SCENARIO_MAIN");		// Num0
	core_num = GetNumFlg_("NUM_SCENARIO_SUB_CORE");	// Num8
	
	if(main_num == GetFlagID_("CONST_SM_CORE")){					// Num0 == 7
		// Demo600[�R�A�E�S�i]�̍Đ���
		if(core_num == GetFlagID_("CONST_SS_CO_GO_MOTHER_ROOM")){	// Num8 == 1
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_RENERTE");
			ShowMsg_("RENATE_MSG");
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		�A���}�̃��b�Z�[�W����
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uAromaMsg()
{
	main_num = GetNumFlg_("NUM_SCENARIO_MAIN");					// Num0
	outside_num = GetNumFlg_("NUM_SCENARIO_SUB_INSIDE_CLEAR");	// Num10
	
	if(main_num == GetFlagID_("CONST_SM_INSIDE_CLEAR")){				// Num0 = 9
		if(outside_num == GetFlagID_("CONST_SS_OS_GO_TO_MOTHER_ROOM")){	// Num10=13
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_AROMA");
			ShowMsg_("AROMA_MSG");
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		�]�����u�̒n��
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineEnterTransfer()
{
	CommPlayerTurnAroundDir(-135);
	local dont_use_transfer = GetEventFlg_("BFG_DONT_TRANSFER_VOLCANO_TO_CORE");// �ΎR-�R�A�Ԃ̑嗤�ړ����u�̎g�p���֎~����t���O
	
	if(dont_use_transfer == false){
		// �I�������b�Z�[�W
		OpenMsgWnd_();
		ShowMsg_("TRANSFER_MSG");
		KeyInputWait_();
		if(GetQueryResult_() == QUERY_YES){
			CloseMsgWnd_();
			DeleteEventMine_(g_mine_enter_transfer);
			
			// �嗤�ړ����u���g���đ嗤�ړ������ꍇ�A���C�h���������邽�߂Ɏg�p����t���O
			SetEventFlg_("BFG_RIDE_OFF_USED_TRANSFER", true);
			// ��l���Ƀe���|�[�g�G�t�F�N�g������
			//ID�̎擾
			local player = GetPlayerId_();
			// ���l�̐ݒ�
			local alpha_def = 1.0;
			// ���l��ύX����O�͕K�����̖��߂��L��
			SetManualCalcAlpha_(player, true);
			// �G�t�F�N�g�̓ǂݍ���
			LoadEffect_("ef732_07_teleport_monolith");	//���m���X�]���G�t�F�N�g
			PlaySE_("SE_DEM_017");						// �r�d�Đ�
			local effectId = SetSelectBoneEffect_("ef732_07_teleport_monolith", player, ATTACH_GLOBAL);
			Wait_(1);
			// ��l���̎p��i�X�Ə����Ă���
			for(alpha_def = 1.0; alpha_def >= 0.0; alpha_def = alpha_def - 0.1){
				SetAlpha_(player, alpha_def);
				Wait_(1);
			}
			SetAlpha_(player, 0.0);
			// �Ԃ���������
			Wait_(30);
			// �Ó]������(��l�����������܂܂ɂȂ�Ȃ��悤�ɂ����ňÓ]�����ă��l�����ɖ߂�)
			SetFade_(FADE_OUT, FADE_COLOR_BLACK, 15);
			SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, 15);
			WaitFade_();
			// ��l���̃��l�����ɖ߂�
			SetAlpha_(player, 1.0);
			
			// �ΎR�̕��A�ʒu
			ChangeMapPosDir_("V00_00", Vec3(-545.718, 1488.606, -1079.813), 0);
		}
		else{
			CloseMsgWnd_();
		}
	}
	// �]�����u�̎g�p�֎~���������ꍇ
	else{
		// �V�X�e�����b�Z�[�W
		OpenMsgWnd_();
		ShowMsg_("DONT_USE_TELEPORTER_010");		// �]�����u�́@�����Ă��Ȃ��B
		KeyInputWait_();
		CloseMsgWnd_();
	}
}







