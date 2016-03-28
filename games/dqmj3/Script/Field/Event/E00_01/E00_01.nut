//===================== ���_�y�y��(����)�z ====================

// �ϐ���`
main_num	 <- C_NONE_ID;
op_num		 <- C_NONE_ID;
core_num	 <- C_NONE_ID;

op_num_sub	 <- "NUM_SCENARIO_SUB_OP";
core_num_sub <- "NUM_SCENARIO_SUB_CORE";

//------------------------------------------------
//		�퓬�I����
//------------------------------------------------
function AfterBattle()
{
	// �t���O�̏�Ԃ��擾
	main_num = GetNumFlg_("NUM_SCENARIO_MAIN");		// Num0
	op_num	 = GetNumFlg_("NUM_SCENARIO_SUB_OP");	// Num1
	core_num = GetNumFlg_("NUM_SCENARIO_SUB_CORE");	// Num8
	
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
	// �t���O�̏�Ԃ��擾
	main_num = GetNumFlg_("NUM_SCENARIO_MAIN");		// Num0
	op_num	 = GetNumFlg_("NUM_SCENARIO_SUB_OP");	// Num1
	core_num = GetNumFlg_("NUM_SCENARIO_SUB_CORE");	// Num8
	
	// ��l�������N��Ԃɂ���
	if(main_num == GetFlagID_("CONST_SM_CORE")){	// Num0 = 7
		if(core_num <= GetFlagID_("CONST_SS_CO_TALK_ANSESU_4")){					// Num8 = 5 �ȉ�
			SetPlayerBoy(true);	// ���N�i��l���j���
		}
		if(core_num >= GetFlagID_("CONST_SS_CO_CHECK_UP_ANSESU")){					// Num8 = 6 �ȏ�
			SetPlayerBoy(false);	// ���N�i��l���j���
		}
	}
	
	EventEnd_();
}

//------------------------------------------------
//		�t�F�[�h�C��
//------------------------------------------------
function FadeIn()
{
	// �t���O�̏�Ԃ��擾
	main_num = GetNumFlg_("NUM_SCENARIO_MAIN");		// Num0
	op_num	 = GetNumFlg_("NUM_SCENARIO_SUB_OP");	// Num1
	core_num = GetNumFlg_("NUM_SCENARIO_SUB_CORE");	// Num8
	DebugPrint(" ");
	DebugPrint("NUM_SCENARIO_MAIN �̒l�� " + main_num + " �ɂȂ�܂����B");
	DebugPrint("NUM_SCENARIO_SUB_OP �̒l�� " + op_num + " �ɂȂ�܂����B");

	// �R�A�V�i���I�ł̋֎~����
	if(main_num == GetFlagID_("CONST_SM_CORE")){					// Num0 = 7
		SetEventFlg_("BFG_RIDE_INPUT_PROHIBIT", true);				// ���C�h�֎~(Bit435)
		SetEventFlg_("BFG_PLAYERABILITY_RULER_PROHIBIT", true);		// ���[���֎~(Bit440)
	}else{
		SetEventFlg_("BFG_RIDE_INPUT_PROHIBIT", false);
		SetEventFlg_("BFG_PLAYERABILITY_RULER_PROHIBIT", false);
	}
	
	//-----------------------------------
	// ���t�B�[���h�R�}���h���֏�Ԃ̐ݒ�
	//-----------------------------------
	if(main_num == 0 && op_num == 0){
		AddFieldMenu_(FIELD_COMMAND.TOOL);					//����i��A�N�e�B�u�j
		SetEventFlg_("BFG_TOOL_PROHIBIT", true);
		AddFieldMenu_(FIELD_COMMAND.SAVE);					//�Z�[�u�i��A�N�e�B�u�j
		SetEventFlg_("BFG_SAVE_PROHIBIT", true);
		AddFieldMenu_(FIELD_COMMAND.TACTICS);				//���i��A�N�e�B�u�j
		SetEventFlg_("BFG_TACTICS_PROHIBIT", true);
		AddFieldMenu_(FIELD_COMMAND.LUGGAGEOFFICE);			//�a���菊�i��A�N�e�B�u�j
		// �a�菊���֎~���邩�ǂ����̓v���O�������Ő��䂷��̂ŁA�����ŋ֎~�t���O�𗧂ĂȂ�
		AddFieldMenu_(FIELD_COMMAND.SKILLPOINT);			//�X�L���|�C���g�i��A�N�e�B�u�j
		SetEventFlg_("BFG_SKILLPOINT_PROHIBIT", true);
		AddFieldMenu_(FIELD_COMMAND.EQUIPACCESSORY);		//�A�N�Z�T���[�����i��A�N�e�B�u�j
		SetEventFlg_("BFG_EQUIPACCESSORY_PROHIBIT", true);
		AddFieldMenu_(FIELD_COMMAND.LIBRARY);				//���C�u�����i��A�N�e�B�u�j
		SetEventFlg_("BFG_LIBRARY_PROHIBIT", true);
		AddFieldMenu_(FIELD_COMMAND.COMMUNICATION);			//�ʐM�i��A�N�e�B�u�j
		SetEventFlg_("BFG_COMMUNICATION_PROHIBIT", true);
		AddFieldMenu_(FIELD_COMMAND.INFORMATION);			//���̐S���i�A�N�e�B�u�j
		SetEventFlg_("BFG_INFORMATION_PROHIBIT", false);
		SetEventFlg_("BFG_TRAVEL_INFO_SHOW_003", true);		// ���̐S���̍��ډ���t���O	�y��{�z�ړ����̃A�N�V����
	}

	// ��l�������A�N�^�[�����Ă��Ȃ���Ԃɂ���
	if(main_num == 0 && op_num == 0){
		SetEventFlg_("BFG_PUT_OUT_REACTOR", true);
	}

	//---------------
	// �M�~�b�N�̔z�u
	//---------------
	// ���H
	if(main_num == GetFlagID_("CONST_SM_OPENING")){
		local g_breakfast = ReadGimmick_("o_E00_01");
		local breakfast = ArrangePointGimmick_("o_E00_01", g_breakfast, "g_breakfast");
		// �A�j���̐ؑ�(�H�O�ƐH��)
		if(op_num == GetFlagID_("CONST_SS_OP_BREAKFAST")){
			// �H�ׂ�O(GIMMICK_0)
			SetMotion_(breakfast, "GIMMICK_0", 0);
			DebugPrint("���H�̃A�j����GIMMICK_0�ł�");
		}
		else{
			// �H�ׂ���(GIMMICK_1)
			SetMotion_(breakfast, "GIMMICK_1", 0);
			DebugPrint("���H�̃A�j����GIMMICK_1�ł�");
		}
	}

	//----------
	// ��NPC�z�u
	//----------
	// ID������
	g_npc_sancho <- C_NONE_ID;
	
	// ���\�[�X�ǂݍ���
	local id_npc_sancho  = ReadNpc_("n011");	// �T���`��
	
	// ���T���`��
	// �I�[�v�j���O�V�i���I
	if(main_num == GetFlagID_("CONST_SM_OPENING")){
		if(op_num == GetFlagID_("CONST_SS_OP_BREAKFAST")){
			g_npc_sancho = ArrangePointNpc_(id_npc_sancho, "npc_sancho_01");
			SetDir_(g_npc_sancho, 270);	// �����̒���
			SetTalkEnable_(g_npc_sancho, true);
			SetScaleSilhouette(g_npc_sancho, SCALE.SANCHO_EVENT, SILHOUETTE_WIDTH.SANCHO_EVENT); // �T���`���̃X�P�[���l��ݒ�
			SetTalkCameraType_(g_npc_sancho, TALK_CAMERA_UP);
		}
	}
	
	
	
	//-----------
	// ���n���z�u
	//-----------
	// ID������
	g_mine_door		 <- C_NONE_ID;
	g_mine_bookshelf <- C_NONE_ID;
	g_mine_bed		 <- C_NONE_ID;
	
	// �������o���t��
	if(main_num == GetFlagID_("CONST_SM_OPENING")){
		if(op_num == GetFlagID_("CONST_SS_OP_BREAKFAST")){
			g_mine_door = SetPointCircleEventMine_("mine_door", false);
		}
	}
	
	// ���{�I
	g_mine_bookshelf = SetPointCircleEventMine_("mine_bookshelf", true);
	
	// ���x�b�h
	if(main_num == GetFlagID_("CONST_SM_CORE")){								// Num0 = 7
		g_mine_bed = SetPointCircleEventMine_("mine_bed", true);
	}
	
	
	EventEnd_();
}

//------------------------------------------------
//		�t�B�[���h����J�n
//------------------------------------------------
function EventStartOperate()
{
	// �t���O�̏�Ԃ��擾
	main_num = GetNumFlg_("NUM_SCENARIO_MAIN");		// Num0
	op_num	 = GetNumFlg_("NUM_SCENARIO_SUB_OP");	// Num1
	core_num = GetNumFlg_("NUM_SCENARIO_SUB_CORE");	// Num8

	local null_point_on = GetEventFlg_("BFG_PARADISE_NULL_POINT_ON");

	DebugPrint(" ");
	DebugPrint("NUM_SCENARIO_MAIN �̒l�� " + main_num + " �ɂȂ�܂����B");
	DebugPrint("NUM_SCENARIO_SUB_OP �̒l�� " + op_num + " �ɂȂ�܂����B");

	// �}�b�v�`�F���WNULL�̐ݒ�(OFF�ɂ���)
	if(null_point_on == false){
		SetHitEnableMapChangeNull_("w_E00_00ALdr_004", false);
	}

	// �R�A�̃V�i���I�ōė��p����̂Ńf�o�b�O�p�̏�����ݒ肵�}�b�v�`�F���WNULL�̐ݒ�������I��ON�ɂ���
	if(main_num >= GetFlagID_("CONST_SM_GRASSLAND")){
		SetHitEnableMapChangeNull_("w_E00_00ALdr_004", true);
	}

//---------------------------------------------------------------------------------------
// �I�[�v�j���O�f���̍Đ�
	if(main_num == GetFlagID_("CONST_SM_OPENING")){
		switch(op_num){
		// Demo001[�I�[�v�j���O�f���@]�̍Đ�����
		case 0:
			SetNumFlg_("NUM_SCENARIO_SUB_OP", GetFlagID_("CONST_SS_OP_VOLCANO"));		// Num1 = 1
			EventStartChangeDemo(1, FADE_COLOR_BLACK);
			break;
		// �V�K�ǉ�Demo051[ OP�B�i�ΎR�j ]
		case GetFlagID_("CONST_SS_OP_VOLCANO"):
			SetNumFlg_("NUM_SCENARIO_SUB_OP", GetFlagID_("CONST_SS_OP_PRISON"));		// Num1 = 2
			EventStartChangeDemo(51, FADE_COLOR_BLACK);
			break;
		// �V�K�ǉ�Demo052[ OP�B�i�č��j ]
		case GetFlagID_("CONST_SS_OP_PRISON"):
			SetNumFlg_("NUM_SCENARIO_SUB_OP", GetFlagID_("CONST_SS_OP_ICE"));			// Num1 = 3
			EventStartChangeDemo(52, FADE_COLOR_BLACK);
			break;
		// �V�K�ǉ�Demo053[ OP�B�i�X���j ]
		case GetFlagID_("CONST_SS_OP_ICE"):
			SetNumFlg_("NUM_SCENARIO_SUB_OP", GetFlagID_("CONST_SS_OP_CEMETERY"));		// Num1 = 4
			EventStartChangeDemo(53, FADE_COLOR_BLACK);
			break;
		// �V�K�ǉ�Demo054[ OP�B�i�쓹�j ]
		case GetFlagID_("CONST_SS_OP_CEMETERY"):
			SetNumFlg_("NUM_SCENARIO_SUB_OP", GetFlagID_("CONST_SS_OP_BEGINNING"));		// Num1 = 5
			EventStartChangeDemo(54, FADE_COLOR_BLACK);
			break;
		// Demo003[ OP�B�i�����s�s�j]( ��Demo002[�I�[�v�j���O�f���A] )�̍Đ�����
		case GetFlagID_("CONST_SS_OP_BEGINNING"):
			SetNumFlg_("NUM_SCENARIO_SUB_OP", GetFlagID_("CONST_SS_OP_ACCIDENT_REACTOR")); // Num1 = 6
			EventStartChangeDemo(3, FADE_COLOR_BLACK);
			break;
		// �V�K�ǉ�Demo004[ ���A�N�^�[�̏� ]
		case GetFlagID_("CONST_SS_OP_ACCIDENT_REACTOR"):
			SetNumFlg_("NUM_SCENARIO_SUB_OP", GetFlagID_("CONST_SS_OP_AIM_PARADISE"));	// Num1 = 7
			EventStartChangeDemo(4, FADE_COLOR_BLACK);
			break;
		// Demo005[ OP�D�i�y��Map�j]( ��Demo003[�I�[�v�j���O�f���B] )�̍Đ�����
		case GetFlagID_("CONST_SS_OP_AIM_PARADISE"):
			SetNumFlg_("NUM_SCENARIO_SUB_OP", GetFlagID_("CONST_SS_OP_DISPLAY_JOKER"));	// Num1 = 8
			EventStartChangeDemo(5, FADE_COLOR_BLACK);
			break;
		// Demo006[ OP�E�i��l���̉Ɓj]( ��Demo004[�I�[�v�j���O�f���C] )�̍Đ�����
		case GetFlagID_("CONST_SS_OP_DISPLAY_JOKER"):
			SetNumFlg_("NUM_SCENARIO_SUB_OP", GetFlagID_("CONST_SS_OP_BREAKFAST"));		// Num1 = 9
			// �v���C���[�A�C�R���\��
			SetEventFlg_("BFG_NAVIMAP_REACTOR_PLAYER_UNLOCK", true);
			//�f���Đ���̕��A�ꏊ��ݒ�
			SetReturnDemoMap_("E00_01");
			SetReturnDemoPosDir_(Vec3(60.0, -0.5, -80.0), 315);
			EventStartChangeDemo(6, FADE_COLOR_BLACK);
			break;
		}
	}

	EventEnd_();
}

//------------------------------------------------
//		�m�o�b�ڐG��
//------------------------------------------------
function TouchNpc()
{
	// �t���O�̏�Ԃ��擾
	main_num = GetNumFlg_("NUM_SCENARIO_MAIN");		// Num0
	op_num	 = GetNumFlg_("NUM_SCENARIO_SUB_OP");	// Num1
	core_num = GetNumFlg_("NUM_SCENARIO_SUB_CORE");	// Num8
	
	local target = GetTargetId_();

	DebugPrint("ID: " + target + " �ɐڐG [TouchNpc]");
	
	switch(target){
	case g_npc_sancho :
		uTalkSancho();	// �T���`���Ɖ�b
		break;
	default:
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
	// �t���O�̏�Ԃ��擾
	main_num = GetNumFlg_("NUM_SCENARIO_MAIN");		// Num0
	op_num	 = GetNumFlg_("NUM_SCENARIO_SUB_OP");	// Num1
	core_num = GetNumFlg_("NUM_SCENARIO_SUB_CORE");	// Num8
	
	local target = GetTouchEventMineId_();

	switch(target){
	case g_mine_door:
		uMineDoor();	// �����̏o���t�߂̒n��(mine_door)
		break;
	case g_mine_bookshelf:
		uMineBookshelf();	// �{�I�̒n��
		break;
	case g_mine_bed:
		uMineBed();			// �x�b�h�̒n��
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


//++++++++++++++++++++++++++++++++++++++++++++++++
//		�T���`��  ��b����
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkSancho()
{
	//---------------------
	// �I�[�v�j���O�V�i���I
	//---------------------
	// Demo005[�����X�^�[�I��p�̎���]�̍Đ���
	if(main_num == GetFlagID_("CONST_SM_OPENING")){
		if(op_num == GetFlagID_("CONST_SS_OP_BREAKFAST")){
			// �}�b�v�`�F���WNULL�̐ݒ�(ON�ɂ���)
			SetEventFlg_("BFG_PARADISE_NULL_POINT_ON", true);
			SetHitEnableMapChangeNull_("w_E00_00ALdr_004", true);
			// ��b
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_SANCHO");
			ShowMsg_("DEMO_004_AFT_SNC_002");				//�u�h�E�] ���V�A�K�b�e�N�_�T�C�B
			KeyInputWait_();
			CloseMsgWnd_();
			// �V�i���I�̃T�u�t���O��i�߂�
			SetNumFlg_("NUM_SCENARIO_SUB_OP", GetFlagID_("CONST_SS_OP_SELECT_MONSTER"));
			// Demo007�Đ���̎�l���̕��A�ʒu
			SetReturnDemoPosDir_(Vec3(50.0, -0.5, 30.0), 270);
			TouchNpcChangeDemo(7);
		}
		else if(op_num == GetFlagID_("CONST_SS_OP_SELECT_MONSTER")){
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_SANCHO");
			ShowMsg_("DEMO_005_AFT_SNC_001");		//�u���H�m �x�x�K �f�L�e�C�}�X�B
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		�h�A�t�߂̒n��
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineDoor()
{
	local player = GetPlayerId_();
	
	// ���b�Z�[�W�̕\��
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_SANCHO");
	ShowMsg_("DEMO_004_AFT_SNC_001");				//�u���H�m ��Еt�P�� �V�e�I���}�X�B
	KeyInputWait_();
	// �E�B���h�E�����
	CloseMsgWnd_();
	// �o���Ƌt�����Ɍ�����
	SetDirToPos_(player, Vec3(0.0, 0.0, 65.0));
	CommPlayerTurnMoveDirWalk(180);
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		�H���t�߂̒n��
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineDining()
{
	local player = GetPlayerId_();
	
	// �}�b�v�`�F���WNULL�̐ݒ�(ON�ɂ���)
	SetEventFlg_("BFG_PARADISE_NULL_POINT_ON", true);
	SetHitEnableMapChangeNull_("w_E00_00ALdr_004", true);
	// ��l�����e�[�u���Ɍ�����
	Task_RotateToPos_(player, Vec3(39.5, 0.0, 41.5), ROTATE_EVENT_DEF);
	// �T���`������l���̂�������Ɍ�����
	Task_RotateToPos_(g_npc_sancho, GetPos_(player), ROTATE_EVENT_DEF);
	// ��b
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_SANCHO");
	ShowMsg_("DEMO_004_AFT_SNC_002");				//�u�h�E�] ���V�A�K�b�e�N�_�T�C�B
	KeyInputWait_();
	CloseMsgWnd_();
	// �V�i���I�̃T�u�t���O��i�߂�
	SetNumFlg_("NUM_SCENARIO_SUB_OP", GetFlagID_("CONST_SS_OP_SELECT_MONSTER"));
	// Demo007�Đ���̎�l���̕��A�ʒu
	SetReturnDemoPosDir_(Vec3(50.0, -0.5, 30.0), 270);
	// Demo007[�����X�^�[�I��p�̎���]���Đ�
	ChangeDemo_(7);
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		�{�I�̒n��
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineBookshelf()
{
	// ��l����{�I�Ɍ�����
	local bookshelf_dir = 180;
	CommPlayerTurnAroundDir(bookshelf_dir);
	// ���b�Z�[�W�̕\��
	OpenMsgWnd_();
	ShowMsg_("BOOKSHELF_MESSAGE");
	KeyInputWait_();
	CloseMsgWnd_();
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		�x�b�h�̒n��
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineBed()
{
	// �Ó]�����̎�l���̕��A�ʒu�ƌ�����ݒ肷��
	local re_pos = Vec3(71.5, 0.0, -75.6);	// ���A�ʒu���w��
	local re_dir = 169;						// �������w��

	// ��l����{�I�Ɍ�����
	local bed_dir = 175;
	CommPlayerTurnAroundDir(bed_dir);
	
	// ���b�Z�[�W�̕\��
	OpenMsgWnd_();
	ShowMsg_("MINE_BED_CORE_010");			// �x�b�h���g����  �x�߂������B
	KeyInputWait_();

	// �x�ޏꍇ
	if(GetQueryResult_() == QUERY_YES){
		// �x�ޏ���
		CloseMsgWnd_();
		// �h���̋��ʂ̉񕜏���
		CommTaskInn(re_pos, re_dir, false, g_mine_bed);
		// ���b�Z�[�W�̕\��
		OpenMsgWnd_();
		ShowMsg_("MINE_BED_CORE_020");		// �x�b�h�ŋx���  ���C�ɂȂ����I
		KeyInputWait_();
		CloseMsgWnd_();
	}
	// ��߂�ꍇ
	else{
		ShowMsg_("MINE_BED_CORE_030");		// �x�b�h�� �g�����Ƃ���߂��B
		KeyInputWait_();
		CloseMsgWnd_();
	}
}

