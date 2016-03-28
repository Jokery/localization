//===================== V01_00�}�O�}�p�[�N ====================
// �ϐ���`
main_num	 <- C_NONE_ID;
volcano_num	 <- C_NONE_ID;

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

	//�}�b�v���B�t���O
	SetEventFlg_("BFG_ARRIVE_AT_V01", true);
	// ���[���|�C���g
	SetEventFlg_("BFG_RULER_ADD_020", true);//�}�O�}�p�[�N

	// �}�b�v�`�F���WNULL�̐ݒ�(�ŔM�̉ΎR(V00_00)�s��)
	if(main_num == GetFlagID_("CONST_SM_VOLCANO")){							// Num0 = 6
		if(volcano_num == GetFlagID_("CONST_SS_HV_TALK_MAGMA_PARK_ELDER")
		|| volcano_num == GetFlagID_("CONST_SS_HV_GO_TO_THE_BIRDY_HOUSE")){	// NUM7 = 3�`4
			// �C�x���g���͕�������
			SetHitEnableMapChangeNull_("w_V00_00ALdr_001", false);
			// ���[�����֎~����t���O��ݒ�
			SetEventFlg_("BFG_PLAYERABILITY_RULER_PROHIBIT", true);
		}
		else{
			SetHitEnableMapChangeNull_("w_V00_00ALdr_001", true);
			SetEventFlg_("BFG_PLAYERABILITY_RULER_PROHIBIT", false);
		}
	}

	//---------------
	// ���M�~�b�N�z�u
	//---------------


	//---------------
	// ��NPC�֘A
	//---------------
	// ID������
	npc0		 <- C_NONE_ID;
	npc1		 <- C_NONE_ID;
	npc2		 <- C_NONE_ID;
	npc3		 <- C_NONE_ID;
	npc_ELDER	 <- C_NONE_ID;
	npc_AIDE	 <- C_NONE_ID;
	npc_IMP	 <- C_NONE_ID;
	npc_INN	 <- C_NONE_ID;

	// NPC�̃��f��
	local n000ResId = ReadNpc_("m076_02");	//�� ���񂶂��
	local n002ResId = ReadNpc_("m082_01");	//�� �׃r��
	local n003ResId = ReadNpc_("m107_01");	//�� ���K�U�����b�N
	local n004ResId = ReadNpc_("m006_03");	//�� �x�X�L���O

	//npc�z�u
	npc0 = ArrangePointNpc_(n002ResId, "000");				//�}�O�}�p�[�N�Z�lA
	SetScaleSilhouette(npc0, SCALE.S, SILHOUETTE_WIDTH.S);	//�T�C�Y�̐ݒ�
	SetReactorMsg_(npc0, "VOLCANO_NPC_A_REC");
	
	npc1 = ArrangePointNpc_(n004ResId, "001");				//�}�O�}�p�[�N�Z�lB
	SetScaleSilhouette(npc1, SCALE.S, SILHOUETTE_WIDTH.S);	//�T�C�Y�̐ݒ�
	SetReactorMsg_(npc1, "VOLCANO_NPC_C_REC");
	
	npc2 = ArrangePointNpc_(n004ResId, "002");				//�}�O�}�p�[�N�Z�lC
	SetScaleSilhouette(npc2, SCALE.S, SILHOUETTE_WIDTH.S);	//�T�C�Y�̐ݒ�
	SetReactorMsg_(npc2, "VOLCANO_NPC_C_REC");
	
	npc3 = ArrangePointNpc_(n002ResId, "003");				//�}�O�}�p�[�N�Z�lD
	SetScaleSilhouette(npc3, SCALE.S, SILHOUETTE_WIDTH.S);	//�T�C�Y�̐ݒ�
	SetReactorMsg_(npc3, "VOLCANO_NPC_A_REC");
	
	npc_ELDER = ArrangePointNpc_(n000ResId, "005");				//�}�O�}�p�[�N���V
	SetScaleSilhouette(npc_ELDER, SCALE.S, SILHOUETTE_WIDTH.S);	//�T�C�Y�̐ݒ�
	SetTalkCameraType_(npc_ELDER, TALK_CAMERA_UP);				//�J�����̐ݒ�
	SetSearchableAngle_(npc_ELDER, SEARCHABLE_ANGLE_NORMAL);	//��b�\�p�x�̐ݒ�
	SetReactorMsg_(npc_ELDER, "VOLCANO_ELDE_REC");
	
	npc_AIDE = ArrangePointNpc_(n003ResId, "004");				//���V����
	SetScaleSilhouette(npc_AIDE, SCALE.N, SILHOUETTE_WIDTH.N);	//�T�C�Y�̐ݒ�
	SetReactorMsg_(npc_AIDE, "VOLCANO_AIDE_REC");
	
	npc_IMP = ArrangePointNpc_(n002ResId, "006");				//���
	SetScaleSilhouette(npc_IMP, SCALE.S, SILHOUETTE_WIDTH.S);	//�T�C�Y�̐ݒ�
	SetTalkCameraType_(npc_IMP, TALK_CAMERA_UP);				//�J�����̐ݒ�
	SetSearchableAngle_(npc_IMP, SEARCHABLE_ANGLE_MINIMUM);		//��b�\�p�x�̐ݒ�
	SetReactorMsg_(npc_IMP, "VOLCANO_NPC_A_REC");
	
	npc_INN = ArrangePointNpc_(n003ResId, "007");				//�h��
	SetScaleSilhouette(npc_INN, SCALE.N, SILHOUETTE_WIDTH.N);	//�T�C�Y�̐ݒ�
	SetTalkCameraType_(npc_INN, TALK_CAMERA_UP);				//�J�����̐ݒ�
	SetSearchableAngle_(npc_INN, SEARCHABLE_ANGLE_MINIMUM);		//��b�\�p�x�̐ݒ�
	SetReactorMsg_(npc_INN, "VOLCANO_NPC_B_REC");

	//-----------
	// ���n���z�u
	//-----------
	// ID������
	g_mine_keepout    <- C_NONE_ID;
	g_mine_bird_house <- C_NONE_ID;
	
	// ���}�O�}�p�[�N�����p�n��()
	if (main_num == GetFlagID_("CONST_SM_VOLCANO")) {							// Num0 = 6
		if(volcano_num == GetFlagID_("CONST_SS_HV_TALK_MAGMA_PARK_ELDER")
		|| volcano_num == GetFlagID_("CONST_SS_HV_GO_TO_THE_BIRDY_HOUSE")){		// NUM7 = 3�`4
			g_mine_keepout = SetPointCircleEventMine_("mine_keepout", false);
		}
	}
	// ���o�[�f�B�̉Ƃɓ������ۂ̃f���p�n��
	if (main_num == GetFlagID_("CONST_SM_VOLCANO")) {							// Num0 = 6
		if(volcano_num == GetFlagID_("CONST_SS_HV_GO_TO_THE_BIRDY_HOUSE")){		// NUM7 = 4
			g_mine_bird_house = SetPointBoxEventMine_("mine_birdy_house", false);
		}
	}

	//--------------------
	//�����A�N�^�[�|�C���g
	//--------------------
	// �V�R�̉���
	local reactorPoint01 = ArrangeMsgReactorPoint("reactorPoint01", GetFlagID_("BFG_REACTER_POINT_084")
		, SHORT_DIST, "REC_POINT_01_01", "REC_POINT_01_02");

	EventEnd_();
}	

//------------------------------------------------
//		�t�B�[���h����J�n
//------------------------------------------------
function EventStartOperate()
{

	main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");
	volcano_num	 = GetNumFlg_("NUM_SCENARIO_SUB_VOLCANO");

	if (main_num == GetFlagID_("CONST_SM_VOLCANO")) {
		if (volcano_num == GetFlagID_("CONST_SS_HV_PRE_MAGMA_PARK_DEMO")) {
			SetNumFlg_(str_num_sub, GetFlagID_("CONST_SS_HV_TALK_MAGMA_PARK_ELDER"));
			
			// �f���̕��A�ʒu���f���̊�����ɐݒ肵�܂�
			SetReturnDemoPosDir_(Vec3(47.092, 0.000, -300.000), 0);
			
			// Demo502[�n���̃V�F���^�[�̒�(�}�O�}�p�[�N)]�Đ�
			EventStartChangeDemo(502, FADE_COLOR_BLACK);
		}
	}

	EventEnd_();
}

//------------------------------------------------
// NPC�ɘb�������钼�O�ŋN������C�x���g�u���b�N
//------------------------------------------------
function BeforeTalkNpc()
{
	// �t���O���擾����
	main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");
	volcano_num	 = GetNumFlg_("NUM_SCENARIO_SUB_VOLCANO");

	// �b���������Ă���NPC��ID���擾
	local target = GetTargetId_();
	
	// ���̃^�C�~���O�Œ��V�ɘb���������ꍇ�f���Ɉڍs����̂ŉ�b���J�����͒ʏ�̂��̂ɂ��Ă���
	if(target == npc_ELDER){
		if(volcano_num == GetFlagID_("CONST_SS_HV_TALK_MAGMA_PARK_ELDER")){
			SetTalkCameraType_(target, TALK_CAMERA_DEF);
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
	volcano_num	 = GetNumFlg_("NUM_SCENARIO_SUB_VOLCANO");	// Num6
	
	local target = GetTargetId_();
	
	DebugPrint(" ");
	DebugPrint("ID: " + target + " �ɐڐG [TouchNpc]");
	
	switch (target) {
	case npc0:
		uTalknpc0();
		break;
	case npc1:
		uTalknpc1();
		break;
	case npc2:
		uTalknpc2();
		break;
	case npc3:
		uTalknpc3();
		break;
	case npc_ELDER:
		uTalknpc_ELDER();
		break;
	case npc_AIDE:
		uTalknpc_AIDE();
		break;
	case npc_IMP:
		uTalknpc_IMP();
		break;
	case npc_INN:
		uTalknpc_Inn();
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
	main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");
	volcano_num	 = GetNumFlg_("NUM_SCENARIO_SUB_VOLCANO");
	
	local target = GetTouchEventMineId_();
	
	DebugPrint(" ");
	DebugPrint("ID: " + target + " �ɐڐG [TouchEventMine]");
	
	switch (target) {
	case g_mine_keepout:
		uMineKeepout();
		break;
	case g_mine_bird_house :
		uMineBirdyHouse();
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
//		�}�O�}�p�[�N�Z�l�` ��b����
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalknpc0()
{
	main_num		 = GetNumFlg_("NUM_SCENARIO_MAIN");
	volcano_num		 = GetNumFlg_("NUM_SCENARIO_SUB_VOLCANO");
	local sky_num	 = GetNumFlg_("NUM_SCENARIO_SUB_SKY");			//Num9
	
	// �ΎR�V�i���I
	if (main_num == GetFlagID_("CONST_SM_VOLCANO")) {
		if (volcano_num < GetFlagID_("CONST_SS_HV_GO_TO_THE_BIRDY_HOUSE")) {
			OpenMsgWnd_();
			ShowMsg_("DEMO_502_AFT_NPC_A");		// �u�܂��� ���V�̂Ƃ���ɁI
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else if (volcano_num < GetFlagID_("CONST_SS_HV_CLIMBING_THE_VOLCANO")) {
			OpenMsgWnd_();
			ShowMsg_("DEMO_503_AFT_NPC_A");		// �u�o�[�f�B�Ɖ�񂾂��āH
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else if (volcano_num < GetFlagID_("CONST_SS_HV_GO_TO_THE_TOEWR")) {
			OpenMsgWnd_();
			ShowMsg_("DEMO_504_AFT_NPC_A");		// �u�o�[�f�B�� �R�Ɍ��������悤�����c�c�H
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else if (volcano_num >= GetFlagID_("CONST_SS_HV_GO_TO_THE_TOEWR")) {
			OpenMsgWnd_();
			ShowMsg_("12_NPC_A");		// �u�������c�c���� �R�A���U�߂�̂��B
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
	// �ΎR�V�i���I�N���A��`�K���r���X���j�O�܂�
	else if (main_num == GetFlagID_("CONST_SM_CORE")) {
			OpenMsgWnd_();
			ShowMsg_("12_NPC_A");		// �u�������c�c���� �R�A���U�߂�̂��B
			KeyInputWait_();
			CloseMsgWnd_();
	}
	// �K���r���X���j��`����v�����e�E�X���f�X�o�[�����j�O�܂�
	else if (main_num == GetFlagID_("CONST_SM_SKY")) {			// Num0 = 8
		if(sky_num < GetFlagID_("CONST_SS_SK_GO_CORE_SKY")){	// Num9 < 42
			OpenMsgWnd_();
			ShowMsg_("13_NPC_A");		// �u���̍����ԕ��� �s�C�����ȁc�c�B
			KeyInputWait_();
			CloseMsgWnd_();
		}
		// ����v�����e�E�X���f�X�o�[�����j�ォ��\�V�i���I�N���A�O�܂�
		else {
			OpenMsgWnd_();
			ShowMsg_("14_NPC_A");		// �u�R�A�� �����ԕ��� �W�܂��Ă���ȁB
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
	// �\�V�i���I�N���A��
	else if (main_num > GetFlagID_("CONST_SM_SKY")) {			// Num0 > 8
		OpenMsgWnd_();
		ShowMsg_("17_NPC_A");		// �u�������� ���a�ɂȂ����񂾁B
		KeyInputWait_();
		CloseMsgWnd_();
	}
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		�}�O�}�p�[�N�Z�l�a ��b����
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalknpc1()
{
	main_num		 = GetNumFlg_("NUM_SCENARIO_MAIN");
	volcano_num		 = GetNumFlg_("NUM_SCENARIO_SUB_VOLCANO");
	local sky_num	 = GetNumFlg_("NUM_SCENARIO_SUB_SKY");			//Num9
	
	// �ΎR�V�i���I
	if (main_num == GetFlagID_("CONST_SM_VOLCANO")) {
		if (volcano_num < GetFlagID_("CONST_SS_HV_GO_TO_THE_BIRDY_HOUSE")) {
			OpenMsgWnd_();
			ShowMsg_("DEMO_502_AFT_NPC_B");		// �u���� �������芵���������B
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else if (volcano_num < GetFlagID_("CONST_SS_HV_CLIMBING_THE_VOLCANO")) {
			OpenMsgWnd_();
			ShowMsg_("DEMO_503_AFT_NPC_B");		// �u�o�[�f�B�� ����Ă�ڂ��ł��B
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else if (volcano_num < GetFlagID_("CONST_SS_HV_GO_TO_THE_TOEWR")) {
			OpenMsgWnd_();
			ShowMsg_("DEMO_504_AFT_NPC_B");		// �u�o�[�f�B�������Ă����B�R�ɍs���񂾂낤�H
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else if (volcano_num >= GetFlagID_("CONST_SS_HV_GO_TO_THE_TOEWR")) {
			OpenMsgWnd_();
			ShowMsg_("12_NPC_B");		// �u�u���C�N�����X�^�[�œ|�� �o�A����̔ߊ�B
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
	// �ΎR�V�i���I�N���A��`�K���r���X���j�O�܂�
	else if (main_num == GetFlagID_("CONST_SM_CORE")) {
			OpenMsgWnd_();
			ShowMsg_("12_NPC_B");		// �u�u���C�N�����X�^�[�œ|�� �o�A����̔ߊ�B
			KeyInputWait_();
			CloseMsgWnd_();
	}
	// �K���r���X���j��`����v�����e�E�X���f�X�o�[�����j�O�܂�
	else if (main_num == GetFlagID_("CONST_SM_SKY")) {			// Num0 = 8
		if(sky_num < GetFlagID_("CONST_SS_SK_GO_CORE_SKY")){	// Num9 < 42
			OpenMsgWnd_();
			ShowMsg_("13_NPC_B");		// �u�����ԕ����Ȃ�Ȃ̂� �����ς�킩���B
			KeyInputWait_();
			CloseMsgWnd_();
		}
		// ����v�����e�E�X���f�X�o�[�����j�ォ��\�V�i���I�N���A�O�܂�
		else {
			OpenMsgWnd_();
			ShowMsg_("14_NPC_B");		// �u���悢�� �{���ɍŌ�̌�����Ă킯���B
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
	// �\�V�i���I�N���A��
	else if (main_num > GetFlagID_("CONST_SM_SKY")) {			// Num0 > 8
		OpenMsgWnd_();
		ShowMsg_("17_NPC_B");		// �u���L���̃o�A����̕�Q�� �s���Ȃ���Ȃ��B
		KeyInputWait_();
		CloseMsgWnd_();
	}
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		�}�O�}�p�[�N�Z�l�b ��b����
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalknpc2()
{
	main_num		 = GetNumFlg_("NUM_SCENARIO_MAIN");
	volcano_num		 = GetNumFlg_("NUM_SCENARIO_SUB_VOLCANO");
	local sky_num	 = GetNumFlg_("NUM_SCENARIO_SUB_SKY");			//Num9
	
	// �ΎR�V�i���I
	if (main_num == GetFlagID_("CONST_SM_VOLCANO")) {
		if (volcano_num < GetFlagID_("CONST_SS_HV_GO_TO_THE_BIRDY_HOUSE")) {
			OpenMsgWnd_();
			ShowMsg_("DEMO_502_AFT_NPC_C");		// �u���̃}�O�}�p�[�N�� ���Ȃ����ȑO��
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else if (volcano_num < GetFlagID_("CONST_SS_HV_CLIMBING_THE_VOLCANO")) {
			OpenMsgWnd_();
			ShowMsg_("DEMO_503_AFT_NPC_C");		// �u���Ȃ��� �߂��Ă���̂�
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else if (volcano_num < GetFlagID_("CONST_SS_HV_GO_TO_THE_TOEWR")) {
			OpenMsgWnd_();
			ShowMsg_("DEMO_504_AFT_NPC_C");		// �u�G���s�X�R�� ���E�ł����΂񍂂��R�B
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else if (volcano_num >= GetFlagID_("CONST_SS_HV_GO_TO_THE_TOEWR")) {
			OpenMsgWnd_();
			ShowMsg_("12_NPC_C");		// �u�o���Ă����āc�c���Ȃ��͂P�l����Ȃ��B
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
	// �ΎR�V�i���I�N���A��`�K���r���X���j�O�܂�
	else if (main_num == GetFlagID_("CONST_SM_CORE")) {
		OpenMsgWnd_();
		ShowMsg_("12_NPC_C");		// �u�o���Ă����āc�c���Ȃ��͂P�l����Ȃ��B
		KeyInputWait_();
		CloseMsgWnd_();
	}
	// �K���r���X���j��`����v�����e�E�X���f�X�o�[�����j�O�܂�
	else if (main_num == GetFlagID_("CONST_SM_SKY")) {			// Num0 = 8
		if(sky_num < GetFlagID_("CONST_SS_SK_GO_CORE_SKY")){	// Num9 < 42
			OpenMsgWnd_();
			ShowMsg_("13_NPC_C");		// �u������ �݂�ȂŃ`�J����
			KeyInputWait_();
			CloseMsgWnd_();
		}
		// ����v�����e�E�X���f�X�o�[�����j�ォ��\�V�i���I�N���A�O�܂�
		else {
			OpenMsgWnd_();
			ShowMsg_("14_NPC_C");		// �u���悢�� �Ō�̐킢�Ȃ̂ł��傤�H
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
	// �\�V�i���I�N���A��
	else if (main_num > GetFlagID_("CONST_SM_SKY")) {			// Num0 > 8
		OpenMsgWnd_();
		ShowMsg_("17_NPC_C");		// �u���Ȃ� �����ɒ�Z����C�� �Ȃ��́H
		KeyInputWait_();
		CloseMsgWnd_();
	}
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		�}�O�}�p�[�N�Z�l�c ��b����
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalknpc3()
{
	main_num		 = GetNumFlg_("NUM_SCENARIO_MAIN");
	volcano_num		 = GetNumFlg_("NUM_SCENARIO_SUB_VOLCANO");
	local sky_num	 = GetNumFlg_("NUM_SCENARIO_SUB_SKY");			//Num9
	
	// �ΎR�V�i���I
	if (main_num == GetFlagID_("CONST_SM_VOLCANO")) {
		if (volcano_num < GetFlagID_("CONST_SS_HV_GO_TO_THE_BIRDY_HOUSE")) {
			OpenMsgWnd_();
			ShowMsg_("DEMO_502_AFT_NPC_D");		// �u���񂽂� �����ɖ߂��Ă�������ɂ�
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else if (volcano_num < GetFlagID_("CONST_SS_HV_CLIMBING_THE_VOLCANO")) {
			OpenMsgWnd_();
			ShowMsg_("DEMO_503_AFT_NPC_D");		// �u�܂��o�[�f�B�� �܂�������
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else if (volcano_num < GetFlagID_("CONST_SS_HV_GO_TO_THE_TOEWR")) {
			OpenMsgWnd_();
			ShowMsg_("DEMO_504_AFT_NPC_D");		// �u�R�ł� �f�X�o�[���ɋC�����Ȃ�B
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else if (volcano_num >= GetFlagID_("CONST_SS_HV_GO_TO_THE_TOEWR")) {
			OpenMsgWnd_();
			ShowMsg_("12_NPC_D");		// �u�_�[�N�}�X�^�[�̓z��
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
	// �ΎR�V�i���I�N���A��`�K���r���X���j�O�܂�
	else if (main_num == GetFlagID_("CONST_SM_CORE")) {
		OpenMsgWnd_();
		ShowMsg_("12_NPC_D");		// �u�_�[�N�}�X�^�[�̓z��
		KeyInputWait_();
		CloseMsgWnd_();
	}
	// �K���r���X���j��`����v�����e�E�X���f�X�o�[�����j�O�܂�
	else if (main_num == GetFlagID_("CONST_SM_SKY")) {			// Num0 = 8
		if(sky_num < GetFlagID_("CONST_SS_SK_GO_CORE_SKY")){	// Num9 < 42
			OpenMsgWnd_();
			ShowMsg_("13_NPC_D");		// �u�_�[�N�}�X�^�[�� �|�����񂾂낤�H
			KeyInputWait_();
			CloseMsgWnd_();
		}
		// ����v�����e�E�X���f�X�o�[�����j�ォ��\�V�i���I�N���A�O�܂�
		else {
			OpenMsgWnd_();
			ShowMsg_("14_NPC_D");		// �u�K���r���X���Ă����̂��H
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
	// �\�V�i���I�N���A��
	else if (main_num > GetFlagID_("CONST_SM_SKY")) {			// Num0 > 8
		OpenMsgWnd_();
		ShowMsg_("17_NPC_D");		// �u�K���r���X�c�c���� �K���}�U�[�h���������B
		KeyInputWait_();
		CloseMsgWnd_();
	}
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		�}�O�}�p�[�N���V���� ��b����
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalknpc_AIDE()
{
	main_num		 = GetNumFlg_("NUM_SCENARIO_MAIN");
	volcano_num		 = GetNumFlg_("NUM_SCENARIO_SUB_VOLCANO");
	local sky_num	 = GetNumFlg_("NUM_SCENARIO_SUB_SKY");			//Num9
	
	// �ΎR�V�i���I
	if (main_num == GetFlagID_("CONST_SM_VOLCANO")) {
		if (volcano_num < GetFlagID_("CONST_SS_HV_GO_TO_THE_BIRDY_HOUSE")) {
			OpenMsgWnd_();
			ShowMsg_("DEMO_502_AFT_AIDE");		// �u���V�� ���҂����B
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else if (volcano_num < GetFlagID_("CONST_SS_HV_CLIMBING_THE_VOLCANO")) {
			OpenMsgWnd_();
			ShowMsg_("DEMO_503_AFT_AIDE");		// �u�o�[�f�B ���L�� �c�c�����ă��i�[�e�B
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else if (volcano_num < GetFlagID_("CONST_SS_HV_GO_TO_THE_TOEWR")) {	
			OpenMsgWnd_();
			ShowMsg_("DEMO_504_AFT_AIDE");		// �u���̎��� ���� �C���Ă����B
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else if (volcano_num >= GetFlagID_("CONST_SS_HV_GO_TO_THE_TOEWR")) {
			OpenMsgWnd_();
			ShowMsg_("12_AIDE");		// �u���i�[�e�� �����Ă������āI�H
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
	// �ΎR�V�i���I�N���A��`�K���r���X���j�O�܂�
	else if (main_num == GetFlagID_("CONST_SM_CORE")) {
		OpenMsgWnd_();
		ShowMsg_("12_AIDE");		// �u���i�[�e�� �����Ă������āI�H
		KeyInputWait_();
		CloseMsgWnd_();
	}
	// �K���r���X���j��`����v�����e�E�X���f�X�o�[�����j�O�܂�
	else if (main_num == GetFlagID_("CONST_SM_SKY")) {			// Num0 = 8
		if(sky_num < GetFlagID_("CONST_SS_SK_GO_CORE_SKY")){	// Num9 < 42
			OpenMsgWnd_();
			ShowMsg_("13_AIDE");		// �u���̂Ƃ��� ���ڂ̔�Q�� �Ȃ��B
			KeyInputWait_();
			CloseMsgWnd_();
		}
		// ����v�����e�E�X���f�X�o�[�����j�ォ��\�V�i���I�N���A�O�܂�
		else {
			OpenMsgWnd_();
			ShowMsg_("14_AIDE");		// �u�����������ɂȂ����� ���ł��߂��Ă����B
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
	// �\�V�i���I�N���A��
	else if (main_num > GetFlagID_("CONST_SM_SKY")) {			// Num0 > 8
		OpenMsgWnd_();
		ShowMsg_("17_AIDE");		// �u���܂ł� ���ꂩ���
		KeyInputWait_();
		CloseMsgWnd_();
	}
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		�}�O�}�p�[�N���V ��b����
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalknpc_ELDER()
{
	main_num		 = GetNumFlg_("NUM_SCENARIO_MAIN");
	volcano_num		 = GetNumFlg_("NUM_SCENARIO_SUB_VOLCANO");
	local sky_num	 = GetNumFlg_("NUM_SCENARIO_SUB_SKY");			//Num9
	
	// �ΎR�V�i���I
	if (main_num == GetFlagID_("CONST_SM_VOLCANO")) {
		if (volcano_num  <  GetFlagID_("CONST_SS_HV_GO_TO_THE_BIRDY_HOUSE")) {
			SetNumFlg_(str_num_sub, GetFlagID_("CONST_SS_HV_GO_TO_THE_BIRDY_HOUSE"));
			// �f����̕��A�ʒu�ƌ����̐ݒ�
			local player_pos = Vec3(57.959, 39.270, 123.246);
			local player_dir = -119;
			SetReturnDemoPosDir_(player_pos, player_dir);
			// Demo503[���V�Ƃ̖ʉ�]�̍Đ�
			TouchNpcChangeDemo(503);
		}
		else if (volcano_num < GetFlagID_("CONST_SS_HV_CLIMBING_THE_VOLCANO")) {
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_ELDER");
			ShowMsg_("DEMO_503_AFT_ELDE");		// �u�o�[�f�B�� ���͂���ɏZ��ł���B
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else if (volcano_num < GetFlagID_("CONST_SS_HV_GO_TO_THE_TOEWR")) {
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_ELDER");
			ShowMsg_("DEMO_504_AFT_ELDE");		// �u�o�[�f�B�� �G���s�X�R�� �s�����悤����ȁB
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else if (volcano_num >= GetFlagID_("CONST_SS_HV_GO_TO_THE_TOEWR")) {
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_ELDER");
			ShowMsg_("12_ELDE");		// �u�R�A�� �U�߂ɍs���ƂȁH
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
	// �ΎR�V�i���I�N���A��`�K���r���X���j�O�܂�
	else if (main_num == GetFlagID_("CONST_SM_CORE")) {
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_ELDER");
		ShowMsg_("12_ELDE");		// �u�R�A�� �U�߂ɍs���ƂȁH
		KeyInputWait_();
		CloseMsgWnd_();
	}
	// �K���r���X���j��`����v�����e�E�X���f�X�o�[�����j�O�܂�
	else if (main_num == GetFlagID_("CONST_SM_SKY")) {			// Num0 = 8
		if(sky_num < GetFlagID_("CONST_SS_SK_GO_CORE_SKY")){	// Num9 < 42
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_ELDER");
			ShowMsg_("13_ELDE");		// �u���̍����ԕ��� �R�A���琁���o��
			KeyInputWait_();
			CloseMsgWnd_();
		}
		// ����v�����e�E�X���f�X�o�[�����j�ォ��\�V�i���I�N���A�O�܂�
		else {
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_ELDER");
			ShowMsg_("14_ELDE");		// �u���� ���悢�� �Ō�̐킢����낤�H
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
	// �\�V�i���I�N���A��
	else if (main_num > GetFlagID_("CONST_SM_SKY")) {			// Num0 > 8
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_ELDER");
		ShowMsg_("17_ELDE");		// �u���ʂ����c�c�悤���Ă��ꂽ�B
		KeyInputWait_();
		CloseMsgWnd_();
	}
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		��� ��b����
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalknpc_IMP()
{
	// �ΎR�̃N���A�t���O
	local clear_flag = GetEventFlg_("BFG_SCENARIO_CLEAR_VOLCANO");
	local msg;

	if(clear_flag == true){
		msg = "ITM_MSG_002"; // �ΎR�N���A�チ�b�Z�[�W
	}
	else{
		if(main_num == GetFlagID_("CONST_SM_VOLCANO")
		&& volcano_num <= GetFlagID_("CONST_SS_HV_PRE_LAUNCH_PAD_DEMO_5")){
			msg = "ITM_MSG_001"; // �ΎR�N���A�O���b�Z�[�W
		}
		else{
			msg = "ITM_MSG_002"; // �ΎR�N���A�チ�b�Z�[�W
		}
	}

	OpenMsgWnd_();
	ShowMsg_(msg);
	KeyInputWait_();
	CloseMsgWnd_();

	// ����t���[�ֈڍs
	GotoMenuFadeOpen(MENU_OPEN.V01_00_ITEM);
	//����t���[�I����
	OpenMsgWnd_();
	ShowMsg_("ITM_MSG_003");
	KeyInputWait_();
	CloseMsgWnd_();
}

//---------------------------------------
// �h���̃��b�Z�[�W����
//---------------------------------------
function uTalknpc_Inn()
{
	main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");
	volcano_num	 = GetNumFlg_("NUM_SCENARIO_SUB_VOLCANO");
	
	// �Ó]�����̎�l���̕��A�ʒu�ƌ�����ݒ肷��
	local re_pos = Vec3(43, 0, -167);	// ���A�ʒu���w��
	local re_dir = -70;					// �������w��	
	
	// ���b�Z�[�W�L�[�̏�����
	local message_key_1 = 0;	// ���b�Z�[�W�L�[(�I������\�����郁�b�Z�[�W)
	local message_key_2 = 0;	// ���b�Z�[�W�L�[(��߂�ꍇ�̃��b�Z�[�W)
	local message_key_3 = 0;	// ���b�Z�[�W�L�[(���p�����ꍇ�̃��b�Z�[�W)
	// �ΎR�̃N���A�t���O
	local clear_flag = GetEventFlg_("BFG_SCENARIO_CLEAR_VOLCANO");

	if(clear_flag == true){
		if(GetEventFlg_("BFG_CHECK_INN_FIRST_MSG_ALL") == false){
			// �ΎR�N���A��̏h���ŕ\�����郁�b�Z�[�W���w��(����)
			message_key_1 = "INN_MSG_001";
			message_key_2 = "INN_MSG_002";
			message_key_3 = "INN_MSG_003";
		}
		else{
			// �ΎR�N���A��̏h���ŕ\�����郁�b�Z�[�W���w��(�Q��ڈȍ~)
			message_key_1 = "INN_MSG_004";
			message_key_2 = "INN_MSG_005";
			message_key_3 = "INN_MSG_006";
		}
		SetEventFlg_("BFG_CHECK_INN_FIRST_MSG_ALL", true);
		OpenMsgWnd_();
		ShowMsg_(message_key_1);
		KeyInputWait_();
		switch(GetQueryResult_())
		{
		case QUERY3_0:
		case QUERY3_1:
		// ���܂鏈��
		// �x�ޏ���
			CloseMsgWnd_();
			// �h���̋��ʂ̉񕜏���
			CommTaskInn(re_pos, re_dir, clear_flag, npc_INN);
			// ���b�Z�[�W�̕\��(�u���͂悤�I
			OpenMsgWnd_();
			ShowMsg_(message_key_3);
			KeyInputWait_();
			CloseMsgWnd_();
			break;
		case QUERY3_2:
		// ��߂鏈��
			// ���b�Z�[�W�̕\��(�u�c�c�������� �����͂���Ȃ�H
			ShowMsg_(message_key_2);
			KeyInputWait_();
			CloseMsgWnd_();
			break;
		}
	}
	else{
		// Demo532[�閧��n �����s�����I]�̍Đ��O�܂�
		if(main_num == GetFlagID_("CONST_SM_VOLCANO")
		&& volcano_num <= GetFlagID_("CONST_SS_HV_PRE_LAUNCH_PAD_DEMO_5")){
			// �ΎR�N���A�O�̏h���ŕ\�����郁�b�Z�[�W���w��
			message_key_1 = "INN_MSG_1ST_001";
			message_key_2 = "INN_MSG_1ST_002";
			message_key_3 = "INN_MSG_1ST_003";
		}
		// Demo532[�閧��n �����s�����I]�̍Đ���
		else{
			message_key_1 = "INN_MSG_1ST_004";
			message_key_2 = "INN_MSG_1ST_005";
			message_key_3 = "INN_MSG_1ST_006";
		}
		// ���b�Z�[�W�̕\���i�u�A���^���� ���͎��Ȃ��ȁB
		OpenMsgWnd_();
		ShowMsg_(message_key_1);
		KeyInputWait_();
		switch(GetQueryResult_())
		{
		case QUERY2_0:
		// ���܂鏈��
			CloseMsgWnd_();
			// �h���̋��ʂ̉񕜏���
			CommTaskInn(re_pos, re_dir, clear_flag, npc_INN);
			// ���b�Z�[�W�̕\��(�u�N���Ă����� �A���Z�X�B
			OpenMsgWnd_();
			ShowMsg_(message_key_3);
			KeyInputWait_();
			CloseMsgWnd_();
			break;
		case QUERY2_1:
		// ��߂鏈��
			// ���b�Z�[�W�̕\��(�u�c�c���������B������ ����Ȃ�H
			ShowMsg_(message_key_2);
			KeyInputWait_();
			CloseMsgWnd_();
			break;
		}
	}
}

//++++++++++++++++++++++++++++++++++++++++++++++++
// �}�O�}�p�[�N�����p�n���ɐG�ꂽ���̏���
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineKeepout()
{
	main_num    = GetNumFlg_("NUM_SCENARIO_MAIN");
	volcano_num = GetNumFlg_("NUM_SCENARIO_SUB_VOLCANO");

	// �����p���b�Z�[�W�̐ݒ�
	local msg_keepout;
	if(main_num == GetFlagID_("CONST_SM_VOLCANO")){							// Num0 = 6
		if(volcano_num == GetFlagID_("CONST_SS_HV_TALK_MAGMA_PARK_ELDER")){	// NUM7 = 3
			// �����b�Z�[�W(Redmine #1625�Q��)
			msg_keepout = "KEEPOUT_MSG_01";
		}
		else if(volcano_num == GetFlagID_("CONST_SS_HV_GO_TO_THE_BIRDY_HOUSE")){ // NUM7 = 4
			// �����b�Z�[�W(Redmine #1625�Q��)
			msg_keepout = "KEEPOUT_MSG_02";
		}
	}

	// ���b�Z�[�W�̕\��
	OpenMsgWnd_();
	ShowMsg_(msg_keepout);
	KeyInputWait_();
	CloseMsgWnd_();

	// �i���֎~����
	CommPlayerTurnMoveDirWalk(0);
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		�o�[�f�B�̉Ƃɓ�������
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineBirdyHouse()
{
	main_num    = GetNumFlg_("NUM_SCENARIO_MAIN");
	volcano_num = GetNumFlg_("NUM_SCENARIO_SUB_VOLCANO");

	if(main_num == GetFlagID_("CONST_SM_VOLCANO")){
		if (volcano_num < GetFlagID_("CONST_SS_HV_CLIMBING_THE_VOLCANO")) {
			// �V�i���I�i�s�t���O��i�߂�
			SetNumFlg_(str_num_sub, GetFlagID_("CONST_SS_HV_CLIMBING_THE_VOLCANO"));
			// �f����̕��A�ʒu�ƌ����̐ݒ�
			local player_pos = Vec3(-252.601, 11.500, 50.410);
			local player_dir = 90;
			SetReturnDemoPosDir_(player_pos, player_dir);
			// Demo504[�T�C���X�̃o�[�f�B]�̍Đ�
			ChangeDemo_(504);
		}
	}
}


