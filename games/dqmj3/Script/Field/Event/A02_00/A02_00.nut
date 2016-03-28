//===================== A02_00���d�{�� ====================


//------------------------------------------------
//		�퓬�I����
//------------------------------------------------
function AfterBattle()
{
	// �t���O���擾
	local main_num   = GetNumFlg_("NUM_SCENARIO_MAIN");
	local city_num   = GetNumFlg_("NUM_SCENARIO_SUB_CITY");

	EventEnd_();
}

//------------------------------------------------
//		�t�F�[�h�A�E�g��
//------------------------------------------------
function FadeIn()
{
	// �}�b�v���B�t���O
	SetEventFlg_("BFG_ARRIVE_AT_A02", true);

	// �t���O���擾
	local main_num   = GetNumFlg_("NUM_SCENARIO_MAIN");
	local city_num   = GetNumFlg_("NUM_SCENARIO_SUB_CITY");

	local check_dead = GetEventFlg_("BFG_DEAD_RETURN");
	local bit_phantom_wall = GetEventFlg_("BFG_OPEN_SECRET_AREA_A02_00");

	DebugPrint(" ");
	DebugPrint("NUM_SCENARIO_MAIN �̒l�� " + main_num + " �ɂȂ�܂����B");
	DebugPrint("NUM_SCENARIO_SUB_CITY �̒l�� " + city_num + " �ɂȂ�܂����B");

	local bit_battery1 = GetEventFlg_("BFG_BATTERY_FIRST");
	local bit_battery2 = GetEventFlg_("BFG_BATTERY_SECOND");

	//---------------
	// ���M�~�b�N�z�u
	//---------------
	// ���~�d��
	local id_battery = ReadGimmick_("o_A02_01");
	battery01 <- ArrangePointGimmick_("o_A02_01", id_battery, "battery01");
	SetDir_(battery01, -90);
	if(bit_battery2){
		SetMotion_(battery01, "GIMMICK_1", 0);		// ON
	}
	battery02 <- ArrangePointGimmick_("o_A02_01", id_battery, "battery02");
	SetDir_(battery02, 90);
	if(bit_battery1){
		SetMotion_(battery02, "GIMMICK_1", 0);		// ON
	}

	// �����j�^
	local id_screen = ReadGimmick_("o_A02_02");
	screen <- ArrangePointGimmick_("o_A02_02", id_screen, "screen");
	// ���j�^(�d��Off)
	SetMotion_(screen, "GIMMICK_0", 0);
	if(main_num <= 2){
		if(city_num == GetFlagID_("CONST_SS_CI_START_UP_POWER_PLANT")){
			// ���j�^(�d��On)��
			if(bit_battery1 == false && bit_battery2 == false){
				SetMotion_(screen, "GIMMICK_1", 0);
			}
			// ���j�^(�~�d�퍶�_��)
			if(bit_battery1 == true && bit_battery2 == false){
				SetMotion_(screen, "GIMMICK_2", 0);
			}
			// ���j�^(�~�d��E�_��)
			if(bit_battery1 == false && bit_battery2 == true){
				SetMotion_(screen, "GIMMICK_3", 0);
			}
			// ���j�^(�~�d�헼�_��)
			if(bit_battery1 == true && bit_battery2 == true){
				SetMotion_(screen, "GIMMICK_4", 0);
			}
		}
		// ���j�^��
		else if(city_num >= GetFlagID_("CONST_SS_CI_RESTORATION_POWER_PLANT")){
			SetMotion_(screen, "GIMMICK_5", 0);
		}
	}
	else{
		// ���j�^��
		SetMotion_(screen, "GIMMICK_5", 0);
	}

	// �����C�g01(��)
	local id_light_01 = ReadGimmick_("o_A02_05");
	local light_01 = ArrangePointGimmick_("o_A02_05", id_light_01, "light01");
	if(bit_battery1 == true){
		SetMotion_(light_01, "GIMMICK_1", 0);	// ��
	}

	// �����C�g02(�E)
	local id_light_02 = ReadGimmick_("o_A02_04");
	local light_02 = ArrangePointGimmick_("o_A02_04", id_light_02, "light02");
	if(bit_battery2 == true){
		SetMotion_(light_02, "GIMMICK_1", 0);	// ��
	}

	// ���h�ЃV���b�^�[
	if(bit_battery1 == false || bit_battery2 == false){
		local id_door = ReadGimmick_("o_A02_00");
		door01 <- ArrangePointGimmick_("o_A02_00", id_door, "door01");
		door02 <- ArrangePointGimmick_("o_A02_00", id_door, "door02");
		door03 <- ArrangePointGimmick_("o_A02_00", id_door, "door03");
		door04 <- ArrangePointGimmick_("o_A02_00", id_door, "door04");
	}
	
	
	//-----------
	// ���n���z�u
	//-----------
	// ID������
	mineId_001    <- C_NONE_ID;
	mineId_002    <- C_NONE_ID;
	mineId_003    <- C_NONE_ID;
	mineId_004    <- C_NONE_ID;
	mineId_005    <- C_NONE_ID;
	mine_battery1 <- C_NONE_ID;
	mine_battery2 <- C_NONE_ID;
	mine_door01   <- C_NONE_ID;
	mine_door02   <- C_NONE_ID;
	mine_door03   <- C_NONE_ID;
	mine_door04   <- C_NONE_ID;
	
	if(main_num == GetFlagID_("CONST_SM_CITY")){
		// �����d�Ǘ����̓����t�߂̒n��
		if(city_num == GetFlagID_("CONST_SS_CI_GO_POWER_PLANT")){
			mineId_001 = SetPointBoxEventMine_("mine01", false);
		}
		if(city_num <= GetFlagID_("CONST_SS_CI_START_UP_POWER_PLANT")){
			// ���~�d�� ���i�N���O�j
			if(bit_battery1 == false){
				mineId_002 = SetPointCircleEventMine_("mine02", true);
			}
			// ���~�d�� �E�i�N���O�j
			if(bit_battery2 == false){
				mineId_003 = SetPointCircleEventMine_("mine03", true);
			}
			// �����j�^�[
			if(bit_battery1 == true && bit_battery2 == true){
				mineId_004 = SetPointCircleEventMine_("mine04", false);
			}
			else{
				mineId_004 = SetPointCircleEventMine_("mine04", true);
			}
		}
		// �����j�^�[
		if(city_num >= GetFlagID_("CONST_SS_CI_RESTORATION_POWER_PLANT")){
			mineId_004 = SetPointCircleEventMine_("mine04", true);
		}
	}
	else {
		// �����j�^�[
		mineId_004 = SetPointCircleEventMine_("mine04", true);
	}
	// ���~�d�� ���i�N����j
	if(bit_battery1 == true){
		mine_battery1 = SetPointCircleEventMine_("mine09", true);
	}
	// ���~�d�� �E�i�N����j
	if(bit_battery2 == true){
		mine_battery2 = SetPointCircleEventMine_("mine10", true);
	}

	// ���h�ЃV���b�^�[
	if(bit_battery1 == false || bit_battery2 == false){
		mine_door01 = SetPointCircleEventMine_("mine05", true);
		mine_door02 = SetPointCircleEventMine_("mine06", true);
		mine_door03 = SetPointCircleEventMine_("mine07", true);
		mine_door04 = SetPointCircleEventMine_("mine08", true);
	}

	// �����̕�
	if(bit_phantom_wall == false){
		mineId_005 = SetPointBoxEventMineNoFallWait_("mine_phantom_wall_01");
	}
	
	
	//-------------------------
	// �����A�N�^�[�|�C���g�z�u
	//-------------------------
	// �����d���䑕�u
	local reactorPoint01 = ArrangeMsgReactorPoint("reactorPoint_01", GetFlagID_("BFG_REACTER_POINT_018")
		, SHORT_DIST, "REC_POINT_NOC_01_01", "REC_POINT_NOC_01_02");
	// ���T�u�d���i�����j
	local reactorPoint02 = ArrangeMsgReactorPoint("reactorPoint_02", GetFlagID_("BFG_REACTER_POINT_019")
		, SHORT_DIST, "REC_POINT_NOC_02_01", "REC_POINT_NOC_02_02");
	// ���T�u�d���i�E���j
	local reactorPoint03 = ArrangeMsgReactorPoint("reactorPoint_03", GetFlagID_("BFG_REACTER_POINT_019")
		, SHORT_DIST, "REC_POINT_NOC_02_01", "REC_POINT_NOC_02_02");
	// ���h�ЃV���b�^�[
	if(bit_battery1 == false || bit_battery2 == false){
		// �T�u�d���i�E���j�k
		local reactorPoint04 = ArrangeMsgReactorPoint("reactorPoint_04", GetFlagID_("BFG_REACTER_POINT_016")
			, SHORT_DIST, "REC_POINT_NOC_03_01", "REC_POINT_NOC_03_02");
		// ������
		local reactorPoint05 = ArrangeMsgReactorPoint("reactorPoint_05", GetFlagID_("BFG_REACTER_POINT_016")
			, SHORT_DIST, "REC_POINT_NOC_03_01", "REC_POINT_NOC_03_02");
		// �����E
		local reactorPoint06 = ArrangeMsgReactorPoint("reactorPoint_06", GetFlagID_("BFG_REACTER_POINT_016")
			, SHORT_DIST, "REC_POINT_NOC_03_01", "REC_POINT_NOC_03_02");
		// ��������
		local reactorPoint07 = ArrangeMsgReactorPoint("reactorPoint_07", GetFlagID_("BFG_REACTER_POINT_016")
			, SHORT_DIST, "REC_POINT_NOC_03_01", "REC_POINT_NOC_03_02");
	}
	
	
	//-----------------
	// ���}�b�v�i�r�z�u
	//-----------------
	// ���u�I�v�A�C�R��
	if(main_num == GetFlagID_("CONST_SM_CITY")){
		if(city_num >= GetFlagID_("CONST_SS_CI_START_UP_POWER_PLANT")
		&& city_num <  GetFlagID_("CONST_SS_CI_GO_BACK_KING")){
			local exclamation01 = ArrangePointNaviMapIcon_(NAVIMAP_ICON.EXCLAMATION, "screen");     // ���j�^
			local exclamation02 = ArrangePointNaviMapIcon_(NAVIMAP_ICON.EXCLAMATION, "battery01");  // �~�d��
			local exclamation03 = ArrangePointNaviMapIcon_(NAVIMAP_ICON.EXCLAMATION, "battery02");  // �~�d��
			SetNaviMapIconVisible_(exclamation01, true);
			SetNaviMapIconVisible_(exclamation02, true);
			SetNaviMapIconVisible_(exclamation03, true);
		}
	}
	// ���h�ЃV���b�^�[
	if(bit_battery1 == true && bit_battery2 == true){
		SetEventFlg_("BFG_MAP_ICON_011", true);
	}


	EventEnd_();
}

//------------------------------------------------
//		�t�B�[���h����J�n
//------------------------------------------------
function EventStartOperate()
{
	// �t���O���擾
	local main_num     = GetNumFlg_("NUM_SCENARIO_MAIN");
	local city_num     = GetNumFlg_("NUM_SCENARIO_SUB_CITY");

	//-----------
	// �f���̍Đ�
	//-----------
	if (main_num == GetFlagID_("CONST_SM_CITY")) {												// Num0 = 2
		// Demo128[�d���̕���_1(�N��)]�Đ���
		if(city_num == GetFlagID_("CONST_SS_CI_RESTORATION_POWER_PLANT")){						// Num3 = 6
			if(GetEventFlg_("BFG_PLAY_DEMO_RESTORATION")){
				SetEventFlg_("BFG_PLAY_DEMO_RESTORATION", false);
				
				// Demo106[�d���̕���_2(�s�s�S�i)]�Đ�
				EventStartChangeDemo(106, FADE_COLOR_BLACK);
			}
			else {
				SetNumFlg_("NUM_SCENARIO_SUB_CITY", GetFlagID_("CONST_SS_CI_GO_BACK_KING"));	// Num3 <- 7
				
				// Demo107[�d���̕���_3(�N����)]�Đ�
				EventStartChangeDemo(107, FADE_COLOR_BLACK);
			}
		}
	}
	
	
	EventEnd_();
}

//------------------------------------------------
//		�m�o�b�ڐG��
//------------------------------------------------
function TouchNpc()
{
	// �t���O���擾
	local main_num   = GetNumFlg_("NUM_SCENARIO_MAIN");
	local city_num   = GetNumFlg_("NUM_SCENARIO_SUB_CITY");

	EventEnd_();
}

//------------------------------------------------
//		�n���ڐG��
//------------------------------------------------
function TouchEventMine()
{
	// �t���O���擾
	local main_num = GetNumFlg_("NUM_SCENARIO_MAIN");						// Num0
	local city_num = GetNumFlg_("NUM_SCENARIO_SUB_CITY");					// Num3

	// ���^���n���^�[�̋N��
	local bit_machine = GetEventFlg_("BFG_MACHINE_POWERON");				// Bit1043
	// �~�d��̋N��
	local bit_battery1 = GetEventFlg_("BFG_BATTERY_FIRST");					// Bit1044
	local bit_battery2 = GetEventFlg_("BFG_BATTERY_SECOND");				// Bit1045
	// ���̕�
	local bit_phantom_wall = GetEventFlg_("BFG_OPEN_SECRET_AREA_A02_00");	// Bit1812

	local target = GetTouchEventMineId_();

	switch(target){
	// �����d�Ǘ����̓����t�߂̒n��
	case mineId_001:
		if (main_num == GetFlagID_("CONST_SM_CITY")) {						// Num0 = 2
			if(city_num == GetFlagID_("CONST_SS_CI_GO_POWER_PLANT")){		// Num3 = 5
				SetNumFlg_("NUM_SCENARIO_SUB_CITY",GetFlagID_("CONST_SS_CI_START_UP_POWER_PLANT"));
				DeleteEventMine_(mineId_001);
				
				SetReturnDemoPosDir_(Vec3(363.6, 16.2, -241.7), -73);
				
				// Demo103[���d�{�݂��N��]�Đ�
				ChangeDemo_(103);
			}
		}
		break;
	// ���~�d��i�N���O�j
	case mineId_002:
		if (main_num == GetFlagID_("CONST_SM_CITY")) {						// Num0 = 2
			if(city_num == GetFlagID_("CONST_SS_CI_START_UP_POWER_PLANT")){	// Num3 = 5
				SetEventFlg_("BFG_BATTERY_FIRST", true);
				DeleteEventMine_(mineId_002);
				// �o�b�e���[�̕����Ɍ���
				CommPlayerTurnAroundObj(battery02);
				
				// ���d�{�݂̃��^���n���^�[�̓����Ă���E�����Ă��Ȃ���Ԑ؂�ւ��t���O
				//�y�~�d�r�N���O�zBFG_MACHINE_POWEROFF -> ON , BFG_MACHINE_POWERON -> OFF
				//�y�~�d�r�N����zBFG_MACHINE_POWEROFF -> OFF, BFG_MACHINE_POWERON -> ON
				SetEventFlg_("BFG_MACHINE_POWEROFF", false); //�i�N���O�t���O�j
				SetEventFlg_("BFG_MACHINE_POWERON",true);    //�i�N����t���O�j
				
				SetReturnDemoPosDir_(Vec3(-267.292, 16.225, -181.608), -90);
				
				// Demo104[�~�d��X�C�b�`ON 1]�Đ�
				ChangeDemo_(104);
			}
			else{
				CommPlayerTurnAroundObj(battery02);
				CommonMessage("NOT_START_UP_MSG");
			}
		}
		break;
	case mineId_003:
		if (main_num == GetFlagID_("CONST_SM_CITY")) {						// Num0 = 2
			if(city_num == GetFlagID_("CONST_SS_CI_START_UP_POWER_PLANT")){
				SetEventFlg_("BFG_BATTERY_SECOND", true);
				DeleteEventMine_(mineId_003);
				// �o�b�e���[�̕����Ɍ���
				CommPlayerTurnAroundObj(battery01);
				
				// ���d�{�݂̃��^���n���^�[�̓����Ă���E�����Ă��Ȃ���Ԑ؂�ւ��t���O
				//�y�~�d�r�N���O�zBFG_MACHINE_POWEROFF -> ON , BFG_MACHINE_POWERON -> OFF
				//�y�~�d�r�N����zBFG_MACHINE_POWEROFF -> OFF, BFG_MACHINE_POWERON -> ON
				SetEventFlg_("BFG_MACHINE_POWEROFF", false); //�i�N���O�t���O�j
				SetEventFlg_("BFG_MACHINE_POWERON",true);    //�i�N����t���O�j
				
				SetReturnDemoPosDir_(Vec3(-83.002, 16.225, -179.252), 90);
				
				// Demo105[�~�d��X�C�b�`ON 2]���Đ�
				ChangeDemo_(105);
			}
			else{
				CommPlayerTurnAroundObj(battery01);
				CommonMessage("NOT_START_UP_MSG");
			}
		}
		break;
	// ���~�d��i�N����j
	case mine_battery1:
		if( bit_battery1 == true){
			CommPlayerTurnAroundObj(battery02);
			CommonMessage("MSG_BATTERY_000");
		}
		break;
	case mine_battery2:
		if( bit_battery2 == true){
			CommPlayerTurnAroundObj(battery01);
			CommonMessage("MSG_BATTERY_000");
		}
		break;
	// ���j�^�[�t�߂̒n��
	case mineId_004:
		if (main_num == GetFlagID_("CONST_SM_CITY")) {						// Num0 = 2
			if(city_num == GetFlagID_("CONST_SS_CI_START_UP_POWER_PLANT")){
				if( bit_battery1  == true && bit_battery2  == true){
					SetNumFlg_("NUM_SCENARIO_SUB_CITY",GetFlagID_("CONST_SS_CI_RESTORATION_POWER_PLANT"));
					DeleteEventMine_(mineId_004);
					// �X�N���[���̕����Ɍ���
					CommPlayerTurnAroundObj(screen);
					// �G�p�[�e�B�̂����̐��𐧌�t���O(�i�s�x�S)
					SetNumFlg_("NUM_ENEMY_PARTY_STRENGTH", 4);
					// �����s�s�̓d������������t���O
					SetEventFlg_("BFG_RESTORATION_POWER_PLANT", true);
					// �Z���^�[�r���O�̔����J������z�u�����X�^�[�����ւ���p�t���O
					SetEventFlg_("BFG_LIMIT_ENTRANCE_CITY", true);
					// [�d���̕����@]���Đ�����t���O
					SetEventFlg_("BFG_PLAY_DEMO_RESTORATION", true);
					
					SetReturnDemoPosDir_(Vec3(366.433, 16.281, -250.0), -179);
					
					// Demo128[�d���̕����@]�Đ�
					ChangeDemo_(128);
				}
				else{
					uPlayerRotateScreenMsg("MSG_SCREEN_001");
				}
			}
			else if(city_num >= GetFlagID_("CONST_SS_CI_RESTORATION_POWER_PLANT")){
				uPlayerRotateScreenMsg("MSG_SCREEN_000");
			}
			else{
				uPlayerRotateScreenMsg("NOT_START_UP_MSG");
			}
		}
		else {
			uPlayerRotateScreenMsg("MSG_SCREEN_000");
		}
		break;
	// �B�������Ɏd�|�����n��
	case mineId_005:
		if(bit_phantom_wall  == false){
			SetEventFlg_("BFG_OPEN_SECRET_AREA_A02_00", true);
			DeleteEventMine_(mineId_005);
		}
		break;
	// �܂��Ă��鎩�����Ɏd�|�����n��
	case mine_door01:
		if(bit_battery1 == false || bit_battery2 == false){
			CommPlayerTurnAroundObj(door04);
			CommonMessage("MSG_DOOR_000");
		}
		break;
	case mine_door02:
		if(bit_battery1 == false || bit_battery2 == false){
			CommPlayerTurnAroundObj(door03);
			CommonMessage("MSG_DOOR_000");
		}
		break;
	case mine_door03:
		if(bit_battery1 == false || bit_battery2 == false){
			CommPlayerTurnAroundObj(door02);
			CommonMessage("MSG_DOOR_000");
		}
		break;
	case mine_door04:
		if(bit_battery1 == false || bit_battery2 == false){
			CommPlayerTurnAroundObj(door01);
			CommonMessage("MSG_DOOR_000");
		}
		break;
	default:
		DebugPrint("�Ώۂ̃C�x���g�n��������܂���");
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

//===========================================================
// ����֐��F���b�Z�[�W�̕\���֐�
//-----------------------------------------------------------
// ����    �F�\�����郁�b�Z�[�W�L�[
// �߂�l  �F�Ȃ�
//===========================================================
function CommonMessage(msg_key)
{
	OpenMsgWnd_();
	ShowMsg_(msg_key);
	KeyInputWait_();
	CloseMsgWnd_();
}

//===========================================================
// ����֐��F�X�N���[���̕����Ɏ�l���������ă��b�Z�[�W��\��
//-----------------------------------------------------------
// ����    �F�\�����郁�b�Z�[�W�L�[
// �߂�l  �F�Ȃ�
//===========================================================
function uPlayerRotateScreenMsg(msg_key)
{
	CommPlayerTurnAroundObj(screen);
	CommonMessage(msg_key);
}
