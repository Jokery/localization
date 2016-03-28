//===================== I02_00�X�̈�� ��w ====================


//------------------------------------------------
//		�퓬�I����
//------------------------------------------------
function AfterBattle()
{
	local main_num			= GetNumFlg_("NUM_SCENARIO_MAIN");			// Num0
	local ice_event_num		= GetNumFlg_("NUM_SCENARIO_SUB_ICE");		// Num5

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
	local main_num			 = GetNumFlg_("NUM_SCENARIO_MAIN");			// Num0
	local ice_event_num		 = GetNumFlg_("NUM_SCENARIO_SUB_ICE");		// Num5
	
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
	SetEventFlg_("BFG_ARRIVE_AT_I02", true);							// Bit_92 ���B�t���O �X�̈��

	local main_num			 = GetNumFlg_("NUM_SCENARIO_MAIN");			// Num0
	local ice_event_num		 = GetNumFlg_("NUM_SCENARIO_SUB_ICE");		// Num5

	local bit_door_est = GetEventFlg_("BFG_ICE_REMAINS_LOCK_DOOR_SECOND");	// Bit_1151 ���̃��b�N����
	local bit_door_west = GetEventFlg_("BFG_ICE_REMAINS_LOCK_DOOR_FIRST");	// Bit_1150 ���̃��b�N����

	DebugPrint(" ");
	DebugPrint("NUM_SCENARIO_MAIN �̒l�� " + main_num + " �ɂȂ�܂����B");

	//-----------
	// ���n���z�u
	//-----------
	// ID������
	g_mine_west		 <- C_NONE_ID;
	g_mine_est		 <- C_NONE_ID;
	g_mine_west_close	 <- C_NONE_ID;
	g_mine_est_close	 <- C_NONE_ID;

	//�� �u�ǔ��̃��b�N�n��
	if(bit_door_est == false){
		g_mine_est = SetPointCircleEventMine_("mine_est_open", true);
		//���b�N������������Ԃ̔��̃��b�Z�[�W
		g_mine_est_close = SetPointCircleEventMine_("mine_est_close", true);
	}

	//�� �u�ǔ��̃��b�N�n��
	if(bit_door_west == false){
		g_mine_west = SetPointCircleEventMine_("mine_west_open", true);
		//���b�N������������Ԃ̔��̃��b�Z�[�W
		g_mine_west_close = SetPointCircleEventMine_("mine_west_close", true);
	}

	DebugPrint("�C�x���g�n���̓Ǎ�");
	
	//---------------
	// ���M�~�b�N�z�u
	//---------------
	// ID������
	g_gmk_door_west		 <- C_NONE_ID;
	g_gmk_door_est		 <- C_NONE_ID;

		// ���\�[�X�ǂݍ���
	local id_door	 = ReadGimmick_("o_I02_01");	// �h�A

	// �������h�A�i���b�N����������ƃh�A���J���܂�
	if(bit_door_west == false){
		g_gmk_door_west	 = ArrangePointGimmick_("o_I02_01", id_door, "g_door_west");
		SetMotion_(g_gmk_door_west, MOT_GIMMICK_0, BLEND_N);
	}
	// �������h�A�i���b�N����������ƃh�A���J���܂�
	if(bit_door_est == false){
		g_gmk_door_est	 = ArrangePointGimmick_("o_I02_01", id_door, "g_door_est");
		SetMotion_(g_gmk_door_est, MOT_GIMMICK_0, BLEND_N);
	}

	//-------------------------
	// �����A�N�^�[�|�C���g�z�u
	//-------------------------
	// �������h�A �P�|�Q ���\�Ɨ����璲�ׂ���悤�Ƀh�A�P�ɂ��Q�����ɔz�u
	if(bit_door_est == false){
		reactorPoint02 <- ArrangeMsgReactorPoint("reactorPoint_02", GetFlagID_("BFG_REACTER_POINT_062")// Bit_1561
			, SHORT_DIST, "REC_POINT_ICE_01", "REC_POINT_ICE_01_2");
		reactorPoint02_2 <- ArrangeMsgReactorPoint("reactorPoint_02_2", GetFlagID_("BFG_REACTER_POINT_062")// Bit_1561
			, SHORT_DIST, "REC_POINT_ICE_01", "REC_POINT_ICE_01_2");
	}
	
	if(bit_door_west == false){
		reactorPoint01 <- ArrangeMsgReactorPoint("reactorPoint_01", GetFlagID_("BFG_REACTER_POINT_062")// Bit_1561
			, SHORT_DIST, "REC_POINT_ICE_01", "REC_POINT_ICE_01_2");
		reactorPoint01_2 <- ArrangeMsgReactorPoint("reactorPoint_01_2", GetFlagID_("BFG_REACTER_POINT_062")// Bit_1561
			, SHORT_DIST, "REC_POINT_ICE_01", "REC_POINT_ICE_01_2");
	}

	//-------------------------
	// ���i�r�}�b�v�A�C�R���z�u
	//-------------------------
	// ���u�I�v
	if(bit_door_west == false){
		g_exclamation01 <- ArrangePointNaviMapIcon_(NAVIMAP_ICON.EXCLAMATION, "icon_door01");  // �����h�A
	}
	
	if(bit_door_est == false){
		g_exclamation02 <- ArrangePointNaviMapIcon_(NAVIMAP_ICON.EXCLAMATION, "icon_door02");  // �����h�A
	}

	EventEnd_();
}

//------------------------------------------------
//		�t�B�[���h����J�n
//------------------------------------------------
function EventStartOperate()
{
	local main_num			= GetNumFlg_("NUM_SCENARIO_MAIN");			// Num0
	local ice_event_num		= GetNumFlg_("NUM_SCENARIO_SUB_ICE");		// Num5

	/*
		�����Ȃ�
	*/

	EventEnd_();
}

//------------------------------------------------
//		�m�o�b�ڐG��
//------------------------------------------------
function TouchNpc()
{
	local main_num			= GetNumFlg_("NUM_SCENARIO_MAIN");			// Num0
	local ice_event_num		= GetNumFlg_("NUM_SCENARIO_SUB_ICE");		// Num5

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
	local main_num			= GetNumFlg_("NUM_SCENARIO_MAIN");			// Num0
	local ice_event_num		= GetNumFlg_("NUM_SCENARIO_SUB_ICE");		// Num5

	local target = GetTouchEventMineId_();

	local bit_door_est = GetEventFlg_("BFG_ICE_REMAINS_LOCK_DOOR_SECOND");	// Bit_1151 ���̃��b�N����
	local bit_door_west = GetEventFlg_("BFG_ICE_REMAINS_LOCK_DOOR_FIRST");	// Bit_1150 ���̃��b�N����

	switch ( target ) {
	case g_mine_est_close:
		CommPlayerTurnAroundObj(g_gmk_door_est);
		if( bit_door_est  == false){
			OpenMsgWnd_();
			ShowMsg_("LOCK_MESSAGE");		// �i���j���ɂ� ���b�N���������Ă���B
			KeyInputWait_();
			CloseMsgWnd_();
		}
		break;

	//�����h�A
	case g_mine_west:
		CommPlayerTurnAroundObj(g_gmk_door_west);
		if( bit_door_west  == false){
			OpenMsgWnd_();
			ShowMsg_("SYSTEM_MSG_000");		// �i���j���̃��b�N�� �������܂����H
			KeyInputWait_();
			CloseMsgWnd_();
			
			// �u�͂��v
			if (GetQueryResult_() == QUERY2_0) {
				SetNaviMapIconVisible_(g_exclamation01, false);
				SetEventFlg_("BFG_ICE_REMAINS_LOCK_DOOR_FIRST", true);	// Bit_1150 ���̃��b�N����

				DeleteEventMine_(g_mine_west);
				DeleteEventMine_(g_mine_west_close);
				SetActive_(reactorPoint01, false);
				SetActive_(reactorPoint01_2, false);

				PlaySE_("SE_FLD_005");	// ���i�����ȓd�q���j
				SetMotion_(g_gmk_door_west, MOT_GIMMICK_1, BLEND_N);
				Wait_(25);
				SetActive_(g_gmk_door_west, false);
			}
			// �u�������v
			else {
				// �����Ȃ�
			}
		}
		break;

	case g_mine_west_close:
		CommPlayerTurnAroundObj(g_gmk_door_west);
		if( bit_door_west  == false){
			OpenMsgWnd_();
			ShowMsg_("LOCK_MESSAGE");		// �i���j���ɂ� ���b�N���������Ă���B
			KeyInputWait_();
			CloseMsgWnd_();
		}
		break;

	//�����h�A
	case g_mine_est:
		CommPlayerTurnAroundObj(g_gmk_door_est);
		if( bit_door_est  == false){
			OpenMsgWnd_();
			ShowMsg_("SYSTEM_MSG_000");		// �i���j���̃��b�N�� �������܂����H
			KeyInputWait_();
			CloseMsgWnd_();
			
			// �u�͂��v
			if (GetQueryResult_() == QUERY2_0) {
				SetNaviMapIconVisible_(g_exclamation02, false);
				SetEventFlg_("BFG_ICE_REMAINS_LOCK_DOOR_SECOND", true);	// Bit_1151 ���̃��b�N����

				DeleteEventMine_(g_mine_est);
				DeleteEventMine_(g_mine_est_close);
				SetActive_(reactorPoint02, false);
				SetActive_(reactorPoint02_2, false);

				PlaySE_("SE_FLD_005");	// ���i�����ȓd�q���j
				SetMotion_(g_gmk_door_est, MOT_GIMMICK_1, BLEND_N);
				Wait_(25);
				SetActive_(g_gmk_door_est, false);
			}
			// �u�������v
			else {
				// �����Ȃ�
			}
		}
		break;

	default:
		DebugPrint("�ݒu����Ă��Ȃ��n���ɐڐG���肵�Ă��܂��I");
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
	local main_num			= GetNumFlg_("NUM_SCENARIO_MAIN");			// Num0
	local ice_event_num		= GetNumFlg_("NUM_SCENARIO_SUB_ICE");		// Num5

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


