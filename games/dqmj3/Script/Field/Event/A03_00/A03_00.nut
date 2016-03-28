//===================== A03_00�Z���^�[�r��2F ====================

// �J�[�h�L�[�̃A�C�e���h�c
const CARDKEY_A_ID = 97; // �J�[�h�L�[��
const CARDKEY_B_ID = 98; // �J�[�h�L�[��

//-------------------- ������ --------------------
// �N�������F�o�g���I����ɌĂ΂�܂�
// (�o�g���̏��s�����C�x���g�t���O�̐ݒ�̓R�R)
//-------------------- ������ --------------------
function AfterBattle()
{
//------------------------------------------------------------------
// �t���O�̏�Ԃ��擾
	local main_num   = GetNumFlg_("NUM_SCENARIO_MAIN");
	local city_num   = GetNumFlg_("NUM_SCENARIO_SUB_CITY");

	EventEnd_();
}
//-------------------- ������ --------------------
// �N�������F��ʐ؂�ւ��̃t�F�[�h�C����
// (NPC�ƒn���̐ݒu/�}�b�v���B�t���O�̓R�R)
//-------------------- ������ --------------------
function FadeIn()
{
	// �}�b�v���B�t���O
	SetEventFlg_("BFG_ARRIVE_AT_A03", true);

	// �t���O�̏�Ԃ��擾
	local main_num   = GetNumFlg_("NUM_SCENARIO_MAIN");
	local city_num   = GetNumFlg_("NUM_SCENARIO_SUB_CITY");
	local check_dead = GetEventFlg_("BFG_DEAD_RETURN");

	// ���A�ʒu�̃`�F�b�N
	if(check_dead == true){
		if(main_num == 2){
			if(city_num >= GetFlagID_("CONST_SS_CI_ESTABLISH_KINGDOM")){
				ChangeMap_("A01_00");
			}
		}
	}

	DebugPrint(" ");
	DebugPrint("NUM_SCENARIO_MAIN �̒l�� " + main_num + " �ɂȂ�܂����B");
	DebugPrint("NUM_SCENARIO_SUB_CITY �̒l�� " + city_num + " �ɂȂ�܂����B");

	local door_key_01 = GetEventFlg_("BFG_ELECTRONIC_DOOR_FIRST_GETKEY");
	local door_key_02 = GetEventFlg_("BFG_ELECTRONIC_DOOR_SECOND_GETKEY");
	local door_open_01 = GetEventFlg_("BFG_ELECTRONIC_DOOR_FIRST_OPEN");


//-------------------------------------------------------------------------------------
// �C�x���g�n��
	// ������
	Key_01        <- C_NONE_ID;
	Key_02        <- C_NONE_ID;
	door_lock     <- C_NONE_ID;
	west_elevator <- C_NONE_ID;
	east_elevator <- C_NONE_ID;

	// �C�x���g�n���̓Ǎ�
	// ���G���x�[�^�[�̃}�b�v�`�F���W�n��(�����Ή�)
	west_elevator = SetPointBoxEventMine_("Mine_Door_03", true);
	// ���G���x�[�^�[�̃}�b�v�`�F���W�n��(�����Ή�)
	east_elevator = SetPointBoxEventMine_("Mine_Door_02", true);

	// �J�M1�̎擾�p
	if(door_key_01 == false){
		Key_01 = SetPointCircleEventMine_("Mine_Key_01", false);
	}
	// �J�M2�̎擾�p
	if(door_key_02 == false){
		Key_02 = SetPointCircleEventMine_("Mine_Key_02", false);
	}
	// ���G���x�[�^�t�߂̃h�A���b�N�̒n��
	if(door_key_01 == false || door_open_01 == false){
		door_lock = SetPointBoxEventMine_("Mine_Door_01", true);
	}

	DebugPrint("�C�x���g�n���̓Ǎ�");

//------------------------------------------------------
// �M�~�b�N
	if(door_open_01 == false){
		local g_door01 = ReadGimmick_("o_A03_00");
		local door01 = ArrangePointGimmick_("o_A03_00", g_door01, "g_door_03");
	}

	// �G���x�[�^�̔�(�J�A�j����������ꍇ�̓O���[�o���ϐ��ɕύX)
	local elevator_id = ReadGimmick_("o_A03_01");
	local w_elevator = ArrangePointGimmick_("o_A03_01", elevator_id, "g_elevator_01"); // ���G���x�[�^�̔�
	local e_elevator = ArrangePointGimmick_("o_A03_01", elevator_id, "g_elevator_02"); // ���G���x�[�^�̔�

	// �G���x�[�^�̃��t�g
	local lift_id = ReadGimmick_("o_A01_01");
	local w_lift = ArrangePointGimmick_("o_A01_01", lift_id, "g_elevator_lift_01"); // ���G���x�[�^�̃��t�g
	local e_lift = ArrangePointGimmick_("o_A01_01", lift_id, "g_elevator_lift_02"); // ���G���x�[�^�̃��t�g

//-------------------------------------------------------------------------------
//���A�N�^�[�|�C���g
	//��ʗp�G���x�[�^
	reactor_point01 <- ArrangeMsgReactorPoint("reactorPoint_01", GetFlagID_("BFG_REACTER_POINT_022")
		, SHORT_DIST, "REC_POINT_GP_01_01", "REC_POINT_GP_01_02");
	//�W����p�G���x�[�^
	reactor_point02 <- ArrangeMsgReactorPoint("reactorPoint_02", GetFlagID_("BFG_REACTER_POINT_023")
		, SHORT_DIST, "REC_POINT_GP_02_01", "REC_POINT_GP_02_02");
	//�Z�L�����e�B���b�N��
	if(door_open_01 == false){
		local reactor_point03 = ArrangeMsgReactorPoint("reactorPoint_03", GetFlagID_("BFG_REACTER_POINT_024")
			, SHORT_DIST, "REC_POINT_GP_03_01", "REC_POINT_GP_03_02");
	}
	if(door_key_01 == false){
		//�Z�L�����e�BB�J�[�h
		reactor_point04 <- ArrangeMsgReactorPoint("reactorPoint_04", GetFlagID_("BFG_REACTER_POINT_025")
			, SHORT_DIST, "REC_POINT_GP_04_01", "REC_POINT_GP_04_02");
		// �u�I�v�A�C�R��
		exclamation01 <- ArrangePointNaviMapIcon_(NAVIMAP_ICON.EXCLAMATION, "reactorPoint_04");  // �J�[�h�L�[B
	}
	if(door_key_02 == false){
		//�Z�L�����e�BA�J�[�h
		reactor_point05 <- ArrangeMsgReactorPoint("reactorPoint_05", GetFlagID_("BFG_REACTER_POINT_027")
			, SHORT_DIST, "REC_POINT_GP_05_01", "REC_POINT_GP_05_02");
		// �u�I�v�A�C�R��
		exclamation02 <- ArrangePointNaviMapIcon_(NAVIMAP_ICON.EXCLAMATION, "reactorPoint_05");  // �J�[�h�L�[A
	}

//--------------------------------------------------------
// �d�v�A�C�e���̃G�t�F�N�g(FadeIn()�Őݒ肵�AEventStartOperate()��TouchEventMine()�ō폜)
	LoadEffect_("EF300_40_ITEM_SIGN");
	effect_key_01 <- SetPointWorldEffect_("EF300_40_ITEM_SIGN", "Effect_Key_01");
	effect_key_02 <- SetPointWorldEffect_("EF300_40_ITEM_SIGN", "Effect_Key_02");

	EventEnd_();
}

//-------------------- ������ --------------------
// �N�������F�t�B�[���h����J�n��
// ( �}�b�v�؂�ւ�����̃f���Đ��E�o�g���J�n���߁E�퓬�I�����̃��b�Z�[�W�̕\��
// ( �ݒu����Wait�����݂Ȃ��瑀�삷��̂̓R�R
//-------------------- ������ --------------------
function EventStartOperate()
{
// �t���O�̏�Ԃ��擾
	local main_num   = GetNumFlg_("NUM_SCENARIO_MAIN");
	local city_num   = GetNumFlg_("NUM_SCENARIO_SUB_CITY");

	// �h�A�L�[�̎擾���
	local door_key_01 = GetEventFlg_("BFG_ELECTRONIC_DOOR_FIRST_GETKEY");
	local door_key_02 = GetEventFlg_("BFG_ELECTRONIC_DOOR_SECOND_GETKEY");

//---------------------------------------------------------------------------------------
// �f���̍Đ�
	// Demo110[�J�[�h�L�[�`��T��]�Đ�
	if(main_num == 2){
		// �G���x�[�^�[�łQ�e�ɒ������痬���
		if(city_num == GetFlagID_("CONST_SS_CI_EARTHQUAKE")){
			// �f���Đ��O�Ƀt�B�[���h���f��Ȃ����߂̑Ή�
			SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
			SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
			WaitFade_();
			// �T�u�t���O��i�߂�( 9 -> 10 )
			SetNumFlg_("NUM_SCENARIO_SUB_CITY", GetFlagID_("CONST_SS_CI_FLOOR_ON_THE_KINGDOM"));
			// �f���I����̈ʒu���C��
			SetReturnDemoPosDir_(Vec3(-300.935, 0.4, -73.908), -2);
			ChangeDemo_(110);
		}
	}

//-------------------------------------------------------------
//�A�C�R��
	if(door_key_01 == false){
		// �u�I�v�A�C�R��
		SetNaviMapIconVisible_(exclamation01, true);
	}
	if(door_key_02 == false){
		// �u�I�v�A�C�R��
		SetNaviMapIconVisible_(exclamation02, true);
	}

//--------------------------------------------------------
// �d�v�A�C�e���̃G�t�F�N�g���폜
	if(door_key_01 == true){
		DeleteEffect_(effect_key_01);
	}
	if(door_key_02 == true){
		DeleteEffect_(effect_key_02);
	}

//-----------------------------------------------------------------------
// �Ђƒʂ�̏������I�������A�G���x�[�^�g�p���ɗ��ĂĂ����t���O���~�낷
	if(GetEventFlg_("BFG_CHECK_USED_ELEVATER_FADE_OFF") == true){
		// �G���x�[�^���g�p�����^�C�~���O�Ńf���𗬂��^�C�~���O�Ɣ�����ꍇ�t�F�[�h�̎�ނ�؂�ւ���ׂ̃t���O���ɖ߂�
		SetEventFlg_("BFG_CHECK_USED_ELEVATER_FADE_OFF", false);
	}

	EventEnd_();
}

//-------------------- NPC --------------------
//�N�������FNPC�Ɍ�������A�{�^���������ꂽ��
//OpenMsgWnd_() -> ShowMsg_() -> KeyInputWait_() �̏��ɌĂяo������
//-------------------- NPC --------------------
function TouchNpc()
{
// �t���O�̏�Ԃ��擾
	local main_num   = GetNumFlg_("NUM_SCENARIO_MAIN");
	local city_num   = GetNumFlg_("NUM_SCENARIO_SUB_CITY");

	EventEnd_();
}

//-------------------- �C�x���g�n�� --------------------
//�N�������F�}�b�v�ɔz�u�������b�V���ɐG�ꂽ�Ƃ�
//-------------------- �C�x���g�n�� --------------------
function TouchEventMine(){
	local target = GetTouchEventMineId_();
	local player = GetPlayerId_();

	DebugPrint("�C�x���g�n���̃C�x���g�u���b�N");

	local main_num = GetNumFlg_("NUM_SCENARIO_MAIN");
	local city_num = GetNumFlg_("NUM_SCENARIO_SUB_CITY");

	// ���G���x�[�^�[���փt���O
	local unlock_east_elevator = GetEventFlg_("BFG_UNLOCK_EAST_ELEVATOR");
	// �J�[�h�L�[�擾�t���O(��)
	local door_key_01 = GetEventFlg_("BFG_ELECTRONIC_DOOR_FIRST_GETKEY");
	local door_key_02 = GetEventFlg_("BFG_ELECTRONIC_DOOR_SECOND_GETKEY");
	local door_open_01 = GetEventFlg_("BFG_ELECTRONIC_DOOR_FIRST_OPEN");

	switch(target)
	{
	// ���G���x�[�^
	case west_elevator:
		// ��l�������A�N�^�[�|�C���g01�Ɍ�����
		CommPlayerTurnAroundObj(reactor_point01);
		// �n���폜
		DeleteEventMine_(west_elevator);
		uMoveUpWestEleveter();
		break;
	// ���G���x�[�^
	case east_elevator:
		// ��l�������A�N�^�[�|�C���g02�Ɍ�����
		CommPlayerTurnAroundObj(reactor_point02);
		// �n���폜
		DeleteEventMine_(east_elevator);
		if(unlock_east_elevator == false){
			SetEventFlg_("BFG_UNLOCK_EAST_ELEVATOR", true);
			PlaySE_("SE_FLD_062");
			Wait_(70);
			CommonMessage("UNLOCK_ELEVATOR");
		}
		uChoiceMoveEastEleveter();
		break;
	// �J�[�h�L�[��
	case Key_01:
		if(door_key_01 == false){
			DeleteEventMine_(Key_01);
			// ��l�������A�N�^�[�|�C���g04�Ɍ�����
			CommPlayerTurnAroundObj(reactor_point04);
			// �����Ń��A�N�^�[�|�C���g04���폜
			SetActive_(reactor_point04, false);
			//�u�I�v�A�C�R��������
			SetNaviMapIconVisible_(exclamation01, false);
			SetEventFlg_("BFG_ELECTRONIC_DOOR_FIRST_GETKEY", true);
			// �d�v�A�C�e���G�t�F�N�g���폜
			DeleteEffect_(effect_key_01);
			// �A�C�e�����菈��
			AddItemAndMsg(CARDKEY_A_ID, 1, true);
		}
		break;
	// �J�[�h�L�[��
	case Key_02:
		if(door_key_02 == false){
			DeleteEventMine_(Key_02);
			// ��l�������A�N�^�[�|�C���g05�Ɍ�����
			CommPlayerTurnAroundObj(reactor_point05);
			// �����Ń��A�N�^�[�|�C���g05���폜
			SetActive_(reactor_point05, false);
			//�u�I�v�A�C�R��������
			SetNaviMapIconVisible_(exclamation02, false);
			SetEventFlg_("BFG_ELECTRONIC_DOOR_SECOND_GETKEY", true);
			// �d�v�A�C�e���G�t�F�N�g���폜
			DeleteEffect_(effect_key_02);
			// �A�C�e�����菈��
			AddItemAndMsg(CARDKEY_B_ID, 1, true);
		}
		break;
	// ��w�֍s�����߂̊K�i�𕕍����Ă����
	case door_lock:
		if(main_num == GetFlagID_("CONST_SM_CITY")){
			if(city_num == GetFlagID_("CONST_SS_CI_FLOOR_ON_THE_KINGDOM")){
				if(door_key_01 == true){
					// �h�A���b�N�̒n�����폜
					DeleteEventMine_(door_lock);
					// ��l������̕��Ɍ�����
					CommPlayerTurnAroundDir(152);
					// �h�A���b�N������SE�i���j
					//PlaySE_("SE_DEM_044");
					// �h�A���b�N�����̃��b�Z�[�W��\��
					OpenMsgWnd_();
					//  ���b�Z�[�W�̒u������
					SetExchangeItemName_(CARDKEY_A_ID);
					ShowMsg_("UNLOCK_DOOR_MESSAGE");
					KeyInputWait_();
					CloseMsgWnd_();
					// �T�u�t���O��i�߂�( 10 -> 11 )
					SetNumFlg_("NUM_SCENARIO_SUB_CITY", GetFlagID_("CONST_SS_CI_UNLOCK_THE_DOOR_1"));
					SetEventFlg_("BFG_ELECTRONIC_DOOR_FIRST_OPEN", true);
					// �f���I����̈ʒu���C��
					SetReturnDemoPosDir_(Vec3(-285.527, 0.4, -96.226), 151);
					// Demo(��)125[�d�q�h�A�̉����P]
					ChangeDemo_(125);
				}else{
					if(door_open_01 == false){
						// ��l������̕��Ɍ�����
						CommPlayerTurnAroundDir(152);
						//  ���b�Z�[�W�̒u������
						SetExchangeItemName_(CARDKEY_A_ID);
						// ���Ƀ��b�N���������Ă��郁�b�Z�[�W
						CommonMessage("LOCK_MESSAGE");
					}
				}
			}
		}
		break;
	default:
		DebugPrint("�Ή����Ă���n��������܂���");
		break;
	}

	EventEnd_();
}

//--------------------------
//  ���b�Z�[�W�̕\���֐�
//--------------------------
function CommonMessage(message_key){
	OpenMsgWnd_();
	ShowMsg_(message_key);
	KeyInputWait_();
	CloseMsgWnd_();
}

//--------------------------
//�N�������F���A�N�^�[�Œ��ׂ�ꂽ�Ƃ��̖{����b(�}�C���h�X�L����)
//--------------------------
function ReactorAnalyze()
{
	EventEnd_();
}

//===========================================================================
// ���[�J���֐��F���G���x�[�^�̏���
//---------------------------------------------------------------------------
// ����    �F�Ȃ�
// �߂�l  �F�Ȃ�
//===========================================================================
function uMoveUpWestEleveter()
{
	OpenMsgWnd_();
	ShowMsg_("MOVE_WEST_ELEVATOR");
	KeyInputWait_();
	if(GetQueryResult_() == QUERY_YES){
		CloseMsgWnd_();
		// �n���폜
		DeleteEventMine_(west_elevator);
		// ���̊J�A�j��(�e���|�������Ȃ�̂ň�U�R�����g��<��Łuw_elevator�v���O���[�o���ϐ��ɂ���>)
		//SetMotion_(w_elevator, "GIMMICK_1", 4);
		//Wait_(6);
		// �G���x�[�^���g�p�����^�C�~���O�Ńf���𗬂��^�C�~���O�Ɣ�����ꍇ�t�F�[�h�̎�ނ�؂�ւ���ׂ̃t���O
		SetEventFlg_("BFG_CHECK_USED_ELEVATER_FADE_OFF", true);
		// �G���x�[�^�ňړ�SE
		PlaySE_("SE_FLD_061");
		// �L���O�_�����G���x�[�^�[�Ɉړ�
		ChangeMapPosDir_("A01_00", Vec3(A01_00_RTN_POS_W_X, A01_00_RTN_POS_W_Y, A01_00_RTN_POS_W_Z), RTN_DIR_W);
	}
	else{
		CloseMsgWnd_();
		// �n�����Đݒu
		SetPointBoxEventMine_("Mine_Door_03", true);
	}
}

//===========================================================================
// ���[�J���֐��F���G���x�[�^�̋��ʏ���
//---------------------------------------------------------------------------
// ����    �F�Ȃ�
// �߂�l  �F�Ȃ�
//===========================================================================
function uChoiceMoveEastEleveter()
{
	// �n���P�K���փt���O���`�F�b�N
	if(GetEventFlg_("BFG_UNLOCKED_EAST_ELEVETER_UNDER") == false){
		uMoveUpEastEleveter();
	}
	else{
		uMoveUpDownWestEleveter();
	}
}

//===========================================================================
// ���[�J���֐��F���G���x�[�^�̏���
//---------------------------------------------------------------------------
// ����    �F�Ȃ�
// �߂�l  �F�Ȃ�
//===========================================================================
function uMoveUpEastEleveter()
{
	OpenMsgWnd_();
	ShowMsg_("MOVE_EAST_ELEVATOR");
	KeyInputWait_();
	switch(GetQueryResult_())
	{
	// �R�O�K
	case QUERY3_0:
		CloseMsgWnd_();
		// �G���x�[�^���g�p�����^�C�~���O�Ńf���𗬂��^�C�~���O�Ɣ�����ꍇ�t�F�[�h�̎�ނ�؂�ւ���ׂ̃t���O
		SetEventFlg_("BFG_CHECK_USED_ELEVATER_FADE_OFF", true);
		// �G���x�[�^�ňړ�SE
		PlaySE_("SE_FLD_061");
		// �R�O�K�Ɉړ�
		ChangeMapPosDir_("A03_01", Vec3(A03_01_RTN_POS_E_X, A03_01_RTN_POS_E_Y, A03_01_RTN_POS_E_Z), RTN_DIR_E);
		break;
	// �P�K(�L���O�_��)
	case QUERY3_1:
		CloseMsgWnd_();
		// �G���x�[�^���g�p�����^�C�~���O�Ńf���𗬂��^�C�~���O�Ɣ�����ꍇ�t�F�[�h�̎�ނ�؂�ւ���ׂ̃t���O
		SetEventFlg_("BFG_CHECK_USED_ELEVATER_FADE_OFF", true);
		// �G���x�[�^�ňړ�SE
		PlaySE_("SE_FLD_061");
		// �P�K�Ɉړ�
		ChangeMapPosDir_("A01_00", Vec3(A01_00_RTN_POS_E_X, A01_00_RTN_POS_E_Y, A01_00_RTN_POS_E_Z), RTN_DIR_E);
		break;
	// ��߂�(���̂܂�)
	case QUERY3_2:
		CloseMsgWnd_();
		// �n�����Đݒu
		SetPointBoxEventMine_("Mine_Door_02", true);
		break;
	}
}

//===========================================================================
// ���[�J���֐��F���G���x�[�^�̒n���P�K����㏈��
//---------------------------------------------------------------------------
// ����    �F�Ȃ�
// �߂�l  �F�Ȃ�
//===========================================================================
function uMoveUpDownWestEleveter()
{
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
	// �P�K
	case QUERY_1:
		CloseMsgWnd_();
		// �G���x�[�^���g�p�����^�C�~���O�Ńf���𗬂��^�C�~���O�Ɣ�����ꍇ�t�F�[�h�̎�ނ�؂�ւ���ׂ̃t���O
		SetEventFlg_("BFG_CHECK_USED_ELEVATER_FADE_OFF", true);
		// �G���x�[�^�ňړ�SE
		PlaySE_("SE_FLD_061");
		// �P�K�Ɉړ�
		ChangeMapPosDir_("A01_00", Vec3(A01_00_RTN_POS_E_X, A01_00_RTN_POS_E_Y, A01_00_RTN_POS_E_Z), RTN_DIR_E);
		break;
	// �n���P�K
	case QUERY_2:
		CloseMsgWnd_();
		// �G���x�[�^���g�p�����^�C�~���O�Ńf���𗬂��^�C�~���O�Ɣ�����ꍇ�t�F�[�h�̎�ނ�؂�ւ���ׂ̃t���O
		SetEventFlg_("BFG_CHECK_USED_ELEVATER_FADE_OFF", true);
		// �G���x�[�^�ňړ�SE
		PlaySE_("SE_FLD_061");
		// �n���P�K�Ɉړ�
		ChangeMapPosDir_("A01_01", Vec3(A01_01_RTN_POS_E_X, A01_01_RTN_POS_E_Y, A01_01_RTN_POS_E_Z), RTN_DIR_E);
		break;
	// ��߂�
	case QUERY_3:
		CloseMsgWnd_();
		// �n�����Đݒu
		SetPointBoxEventMine_("Mine_Door_02", true);
		break;
	}
}

