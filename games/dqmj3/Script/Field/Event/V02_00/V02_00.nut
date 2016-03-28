//===================== V02_00�閧��n1F(�n�⓴�A) ====================
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
	main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");
	volcano_num	 = GetNumFlg_("NUM_SCENARIO_SUB_VOLCANO");

	DebugPrint(" ");
	DebugPrint("NUM_SCENARIO_MAIN �̒l�� " + main_num + " �ɂȂ�܂����B");
	DebugPrint("NUM_SCENARIO_SUB_VOLCANO �̒l�� " + volcano_num + " �ɂȂ�܂����B");

	// �}�b�v���B�t���O
	SetEventFlg_("BFG_ARRIVE_AT_V02", true);

	// Demo521[�閧��n��]���폜���ꂽ�̂ňȉ��̐i�s�x�̎������V�i���I�t���O��i�߂�
	if(main_num == GetFlagID_("CONST_SM_VOLCANO")){
		if(volcano_num == GetFlagID_("CONST_SS_HV_FIND_OUT_AUTHEN_SYSTEM")){		 // Num7 = 24 
			SetNumFlg_(str_num_sub, GetFlagID_("CONST_SS_HV_ENTER_THE_ALIAS_ROOM")); // Num7 24 �� 25
		}
	}

	//---------------
	// ���M�~�b�N�z�u
	//---------------
	// ID������
//	g_rulerpoint		 <- C_NONE_ID;
	g_gmk_elevator_door	 <- C_NONE_ID;
	g_gmk_elevator_lift	 <- C_NONE_ID;

	// ���\�[�X�ǂݍ���
	local id_rulerpoint = ReadGimmick_("o_com_08");	// ���[���|�C���g
	local id_elevator_door	 = ReadGimmick_("o_V02_06");	// �G���x�[�^�̔�
	local id_elevator_lift	 = ReadGimmick_("o_V02_03");	// �G���x�[�^�̃��t�g

	// ���G���x�[�^�̔�
	g_gmk_elevator_door = ArrangePointGimmick_("o_V02_06", id_elevator_door, "gmk_elevator_door");

	// ���G���x�[�^�̃��t�g
	g_gmk_elevator_lift = ArrangePointGimmick_("o_V02_03", id_elevator_lift, "gmk_elevator_lift");

	// �����[���|�C���g(V00_00�Ɉړ������̂ŃR�����g��)
//	g_rulerpoint = ArrangePointGimmick_("o_com_08", id_rulerpoint, "g_ruler_point");
//	if(GetEventFlg_("BFG_RULER_ADD_022") == true){
//		SetMotion_(g_rulerpoint, MOT_GIMMICK_2, BLEND_N);
//	}

	//----------
	// ��NPC�֘A
	//----------

	//-----------
	// ���n���z�u
	//-----------
	// ID������
	g_elevator <- C_NONE_ID;
//	mine_ruler <- C_NONE_ID;	// ���[���|�C���g( BFG_RULER_ADD_022 )
	mine_phantom_wall <- C_NONE_ID;// ���̕�

	// ���G���x�[�^�[
	// �G���x�[�^�[�̃}�b�v�`�F���W�n��(�����Ή�)
	g_elevator = SetPointBoxEventMine_("g_elevator_01", true);
	// �����[���|�C���g(V00_00�Ɉړ������̂ŃR�����g��)
//	mine_ruler = SetPointCircleEventMine_("mine_ruler", true);
	// �����̕�
	local bit_phantom_wall = GetEventFlg_("BFG_OPEN_SECRET_AREA_V02_00");
	if(bit_phantom_wall == false){
		mine_phantom_wall = SetPointBoxEventMineNoFallWait_("mine_phantom_wall");
	}

	//---------------------
	// �����A�N�^�[�|�C���g
	//---------------------
	// �G���x�[�^�[
	local reactorPoint01 = ArrangeMsgReactorPoint("reactorPoint01", GetFlagID_("BFG_REACTER_POINT_085")
		, SHORT_DIST, "REC_POINT_01_01", "REC_POINT_01_02");
	// ���[���|�C���g(V00_00�Ɉړ������̂ŃR�����g��)
//	local reactorPoint02 = ArrangeMsgReactorPoint("reactorPoint02", GetFlagID_("BFG_REACTER_POINT_010")
//		, SHORT_DIST, "REC_POINT_02_01", "REC_POINT_02_02");

	EventEnd_();
}	
//------------------------------------------------
//		�t�B�[���h����J�n
//------------------------------------------------
function EventStartOperate()
{
	main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");
	volcano_num	 = GetNumFlg_("NUM_SCENARIO_SUB_VOLCANO");
	
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
/*
// ����NPC�͔z�u���Ȃ��̂ŃR�����g��
	main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");			// Num0
	volcano_num	 = GetNumFlg_("NUM_SCENARIO_SUB_VOLCANO");	// Num6
	
	local target = GetTargetId_();
	
	DebugPrint(" ");
	DebugPrint("ID: " + target + " �ɐڐG [TouchNpc]");
	
	switch (target)
	{
	default :
		DebugPrint("WARNING : NPC_ID���s���ł� [TouchNpc]");
		break;
	}
*/

	EventEnd_();
}

//------------------------------------------------
//		�n���ڐG��
//------------------------------------------------
function TouchEventMine()
{
	main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");
	volcano_num	 = GetNumFlg_("NUM_SCENARIO_SUB_VOLCANO");
	
	local target = GetTouchEventMineId_();
	
	DebugPrint(" ");
	DebugPrint("ID: " + target + " �ɐڐG [TouchEventMine]");
	
	switch (target) {
	case g_elevator :
		local pl_dir = -30;
		CommPlayerTurnAroundDir(pl_dir);
		uMineElevator();
		break;
//	case mine_ruler :
//		uMineRuler();
//		break;
	case mine_phantom_wall:
		local bit_phantom_wall = GetEventFlg_("BFG_OPEN_SECRET_AREA_V02_00");
		if(bit_phantom_wall == false){
			SetEventFlg_("BFG_OPEN_SECRET_AREA_V02_00", true);
			DeleteEventMine_(mine_phantom_wall);
		}
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
//		�G���x�[�^�[�𒲂ׂ��Ƃ�
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
		DeleteEventMine_(g_elevator);
		// �G���x�[�^�ňړ�SE
		PlaySE_("SE_FLD_061");
		// B1F�ֈړ�
		ChangeMapPosDir_("V02_01", Vec3(-480.0, 10.0, -0), 90);
	}
	// �y�������̏ꍇ�F�P�z
	else{
		CloseMsgWnd_();
		// �n�����Đݒu
		SetPointBoxEventMine_("g_elevator_01", true);
	}
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		���[���|�C���g�𒲂ׂ��Ƃ�
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineRuler()
{
	CommPlayerTurnAroundObj(g_rulerpoint);
	CommRulerPointEvent(g_rulerpoint, "BFG_RULER_ADD_022", "g_ruler_point");
}

