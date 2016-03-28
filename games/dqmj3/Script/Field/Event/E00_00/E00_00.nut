//===================== ���_�y�y��(�O��)�z ====================

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
	// �t���O�̏�Ԃ��擾
	main_num = GetNumFlg_("NUM_SCENARIO_MAIN");		// Num0
	op_num	 = GetNumFlg_("NUM_SCENARIO_SUB_OP");	// Num1
	core_num = GetNumFlg_("NUM_SCENARIO_SUB_CORE");	// Num8
	
	// ���C�h��������
	SetRideOffStart_();
	
	// ��l�������N��Ԃɂ���
	if(main_num == GetFlagID_("CONST_SM_CORE")){	// Num0 = 7
		if(core_num <= GetFlagID_("CONST_SS_CO_TALK_ANSESU_4")){					// Num8 = 5 �ȉ�
			SetPlayerBoy(true);		// ���N�i��l���j���
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
		SetEventFlg_("BFG_PLAYERABILITY_MANTAN_PROHIBIT", true);	// �܂񂽂�֎~(Bit444)
	}else{
		SetEventFlg_("BFG_RIDE_INPUT_PROHIBIT", false);
		SetEventFlg_("BFG_PLAYERABILITY_RULER_PROHIBIT", false);
		SetEventFlg_("BFG_PLAYERABILITY_MANTAN_PROHIBIT", false);
	}
	
	//---------------
	// ���M�~�b�N�z�u
	//---------------
	//�� ���A�N�^�[(�|�b�h)
	// ���\�[�X�ǂݍ���
	local id_reactor = ReadGimmick_("o_dem_11");
	// ID������
	g_reactor <- C_NONE_ID;
	if(main_num == GetFlagID_("CONST_SM_OPENING")){
		if(op_num == GetFlagID_("CONST_SS_OP_SELECT_MONSTER")){
			g_reactor = ArrangePointGimmick_("o_dem_11", id_reactor, "g_reactor");
			SetMotion_(g_reactor, MOT_GIMMICK_1, BLEND_N); // �|�b�h���J���Ă����Ԃɐݒ�
			// �u�I�v�A�C�R��(�}�b�v�p)
			local exclamation = ArrangePointNaviMapIcon_(NAVIMAP_ICON.EXCLAMATION, "g_reactor");
			SetNaviMapIconVisible_(exclamation, true);
		}
	}

	// ���􂯖ڂƌ�
	local id_rip_light = ReadGimmick_("o_E00_02");
	g_rip_light <- C_NONE_ID; // ID������
	g_rip_light =  ArrangePointGimmick_("o_E00_02", id_rip_light, "g_rip_light");

	//----------
	// ��NPC�z�u
	//----------
	// ���T���`��(�I�[�v�j���O�E�R�A����)
	// �I�[�v�j���O�V�i���I
	g_sancho <- C_NONE_ID;
	g_sancho_eff <- C_NONE_ID;
	if(main_num == GetFlagID_("CONST_SM_OPENING")){
		if(op_num == GetFlagID_("CONST_SS_OP_SELECT_MONSTER")){
			local id_sancho = ReadNpc_("n011");
			g_sancho = ArrangePointNpc_(id_sancho, "npc_sancho01");
			SetWalkRadius_(g_sancho, 35);
			SetComMode_(g_sancho, 1);
			SetScaleSilhouette(g_sancho, SCALE.SANCHO_EVENT, SILHOUETTE_WIDTH.SANCHO_EVENT); // �T���`���̃X�P�[���l��ݒ�
			SetTalkCameraType_(g_sancho, TALK_CAMERA_UP);
			// �T���`����ڗ�������G�t�F�N�g
			LoadEffect_("ef732_11_sancho_eff");
			g_sancho_eff = SetSelectBoneEffect_("ef732_11_sancho_eff", g_sancho, ATTACH_GLOBAL);
		}
	}
	// �R�A�V�i���I
	if(main_num == GetFlagID_("CONST_SM_CORE")){								// Num0 = 7
		if(core_num <= GetFlagID_("CONST_SS_CO_TALK_ANSESU_4")){				// Num8 = 5 �ȉ�
			local id_sancho = ReadNpc_("n011");
			g_sancho = ArrangePointNpc_(id_sancho, "npc_sancho01");
			SetWalkRadius_(g_sancho, 35);
			SetComMode_(g_sancho, 1);
			SetScaleSilhouette(g_sancho, SCALE.SANCHO_EVENT, SILHOUETTE_WIDTH.SANCHO_EVENT); // �T���`���̃X�P�[���l��ݒ�
			SetTalkCameraType_(g_sancho, TALK_CAMERA_UP);
			SetReactorMsg_(g_sancho, "NPC_SANCYO_CORE_REC_060");
		}
	}
	if(main_num == GetFlagID_("CONST_SM_CORE")){								// Num0 = 7
		if(core_num >= GetFlagID_("CONST_SS_CO_CHECK_UP_ANSESU")){				// Num8 = 6 �ȏ�
			local id_sancho = ReadNpc_("n011");
			g_sancho = ArrangePointNpc_(id_sancho, "npc_sancho02");
			SetScaleSilhouette(g_sancho, SCALE.SANCHO_EVENT, SILHOUETTE_WIDTH.SANCHO_EVENT); // �T���`���̃X�P�[���l��ݒ�
			SetTalkCameraType_(g_sancho, TALK_CAMERA_UP);
			SetReactorMsg_(g_sancho, "NPC_SANCYO_CORE_REC_060");
		}
	}

	// ���n�o�p�����X�^�[�m�o�b(�X���C���E�s���N���[����)
	g_slime_op <- C_NONE_ID;
	g_pnkmo_op <- C_NONE_ID;
	if(main_num == GetFlagID_("CONST_SM_OPENING")){
		if(op_num == GetFlagID_("CONST_SS_OP_SELECT_MONSTER")){
			// �X���C��
			g_slime_op = ReadAndArrangePointNpc("n051", "npc_op_slime");
			SetScaleSilhouette(g_slime_op, SCALE.OP_MONS_NPC, SILHOUETTE_WIDTH.OP_MONS_NPC);
			// �s���N���[����
			g_pnkmo_op = ReadAndArrangePointNpc("n052", "npc_op_pinkmomon");
			SetScaleSilhouette(g_pnkmo_op, SCALE.OP_MONS_NPC, SILHOUETTE_WIDTH.OP_MONS_NPC);
		}
	}
	
	// ���A���Z�X(�R�A�V�i���I�p)
	// ID������
	g_npc_ansesu <- C_NONE_ID;
	// ���\�[�X�ǂݍ���
	local id_ansesu	 = ReadNpc_("n036");	// �A���Z�X
	if(main_num == GetFlagID_("CONST_SM_CORE")){								// Num0 = 7
		if(core_num == GetFlagID_("CONST_SS_CO_TALK_ANSESU_1")){				// Num8 = 2
			g_npc_ansesu = ArrangePointNpc_(id_ansesu, "npc_ansesu_01");
			SetTalkTurn_(g_npc_ansesu, false);									// �b�������Ă��U������Ȃ�
			SetReactorMsg_(g_npc_ansesu, "NPC_ANSESU_CORE_REC_060");
		}
		else if(core_num == GetFlagID_("CONST_SS_CO_TALK_ANSESU_2")){			// Num8 = 3
			g_npc_ansesu = ArrangePointNpc_(id_ansesu, "npc_ansesu_01");
			SetTalkCameraType_(g_npc_ansesu, TALK_CAMERA_UP);
			SetTalkCameraEyeOffset_(g_npc_ansesu, 5.0, 0.0);
			SetDir_(g_npc_ansesu, -150);
			SetReactorMsg_(g_npc_ansesu, "NPC_ANSESU_CORE_REC_060");
		}
		else if(core_num == GetFlagID_("CONST_SS_CO_TALK_ANSESU_4")){			// Num8 = 5
			g_npc_ansesu = ArrangePointNpc_(id_ansesu, "npc_ansesu_02");
			SetTalkEnable_(g_npc_ansesu, false);								//��b�A�C�R����\��
			SetReactorMsg_(g_npc_ansesu, "NPC_ANSESU_CORE_REC_060");
		}
		else if(core_num >= GetFlagID_("CONST_SS_CO_CHECK_UP_ANSESU")){			// Num8 = 6 �ȏ�
			g_npc_ansesu = ArrangePointNpc_(id_ansesu, "npc_ansesu_02");
			SetTalkCameraType_(g_npc_ansesu, TALK_CAMERA_UP);
			SetTalkCameraEyeOffset_(g_npc_ansesu, -5.0, 0.0);
			SetDir_(g_npc_ansesu, 160);
//			SetReactorMsg_(g_npc_ansesu, "NPC_ANSESU_CORE_REC_060");
		}
	}
	
	// ���R�A�V�i���I�p�����X�^�[�m�o�b
	g_core_angel_a	 <- C_NONE_ID;
	g_core_angel_b	 <- C_NONE_ID;
	g_core_jobo_a	 <- C_NONE_ID;
	g_core_jobo_b	 <- C_NONE_ID;
	g_core_pink_a	 <- C_NONE_ID;
	g_core_pink_b	 <- C_NONE_ID;
	g_core_slime_a	 <- C_NONE_ID;
	g_core_slime_b	 <- C_NONE_ID;
	
	// ���S�[���h�G���[��A
	if(main_num == GetFlagID_("CONST_SM_CORE")){								// Num0 = 7
		if(core_num <= GetFlagID_("CONST_SS_CO_CHECK_UP_ANSESU")){				// Num8 = 6 �ȉ�
			g_core_angel_a = ReadAndArrangePointNpc("m002_02", "npc_core_angelA");
			SetScaleSilhouette(g_core_angel_a, SCALE.S, SILHOUETTE_WIDTH.S);
			SetReactorMsg_(g_core_angel_a, "NPC_RAKUEN03_CORE_REC");
			
		}
	}
	
	// ���S�[���h�G���[��B
	if(main_num == GetFlagID_("CONST_SM_CORE")){								// Num0 = 7
		if(core_num <= GetFlagID_("CONST_SS_CO_CHECK_UP_ANSESU")){				// Num8 = 6 �ȉ�
			g_core_angel_b = ReadAndArrangePointNpc("m002_02", "npc_core_angelB");
			SetScaleSilhouette(g_core_angel_b, SCALE.S, SILHOUETTE_WIDTH.S);
			SetReactorMsg_(g_core_angel_b, "NPC_RAKUEN03_CORE_REC");
		}
	}
	
	// ���Ƃ��W���{�[A
	if(main_num == GetFlagID_("CONST_SM_CORE")){								// Num0 = 7
		if(core_num <= GetFlagID_("CONST_SS_CO_TALK_ANSESU_4")){				// Num8 = 5 �ȉ�
			g_core_jobo_a = ReadAndArrangePointNpc("m127_02", "npc_core_joboA");
			SetScaleSilhouette(g_core_jobo_a, 0.5, 0.4);	// �f���Ɠ����T�C�Y�ɂ���
			SetReactorMsg_(g_core_jobo_a, "NPC_RAKUEN04_CORE_REC");
		}
		if(core_num == GetFlagID_("CONST_SS_CO_CHECK_UP_ANSESU")){				// Num8 = 6
			g_core_jobo_a = ReadAndArrangePointNpc("m127_02", "npc_core_joboA2");
			SetScaleSilhouette(g_core_jobo_a, 0.5, 0.4);	// �f���Ɠ����T�C�Y�ɂ���
			SetReactorMsg_(g_core_jobo_a, "NPC_RAKUEN04_CORE_REC");
		}
	}
	
	// ���Ƃ��W���{�[B
	if(main_num == GetFlagID_("CONST_SM_CORE")){								// Num0 = 7
		if(core_num <= GetFlagID_("CONST_SS_CO_CHECK_UP_ANSESU")){				// Num8 = 6 �ȉ�
			g_core_jobo_b = ReadAndArrangePointNpc("m127_02", "npc_core_joboB");
			SetScaleSilhouette(g_core_jobo_b, 0.5, 0.4);	// �f���Ɠ����T�C�Y�ɂ���
			SetReactorMsg_(g_core_jobo_b, "NPC_RAKUEN04_CORE_REC");
		}
	}
	
	// ���s���N���[����A
	if(main_num == GetFlagID_("CONST_SM_CORE")){								// Num0 = 7
		if(core_num <= GetFlagID_("CONST_SS_CO_TALK_ANSESU_4")){				// Num8 = 5 �ȉ�
			g_core_pink_a = ReadAndArrangePointNpc("m083_01", "npc_core_pinkA");
			SetScaleSilhouette(g_core_pink_a, SCALE.S, SILHOUETTE_WIDTH.S);
			SetReactorMsg_(g_core_pink_a, "NPC_RAKUEN02_CORE_REC");
		}
		if(core_num == GetFlagID_("CONST_SS_CO_CHECK_UP_ANSESU")){				// Num8 = 6
			g_core_pink_a = ReadAndArrangePointNpc("m083_01", "npc_core_pinkA2");
			SetScaleSilhouette(g_core_pink_a, SCALE.S, SILHOUETTE_WIDTH.S);
			SetReactorMsg_(g_core_pink_a, "NPC_RAKUEN02_CORE_REC");
		}
	}
	
	// ���s���N���[����B
	if(main_num == GetFlagID_("CONST_SM_CORE")){								// Num0 = 7
		if(core_num <= GetFlagID_("CONST_SS_CO_CHECK_UP_ANSESU")){				// Num8 = 6 �ȉ�
			g_core_pink_b = ReadAndArrangePointNpc("m083_01", "npc_core_pinkB");
			SetScaleSilhouette(g_core_pink_b, SCALE.S, SILHOUETTE_WIDTH.S);
			SetReactorMsg_(g_core_pink_b, "NPC_RAKUEN02_CORE_REC");
		}
	}
	
	// ���X���C��A
	if(main_num == GetFlagID_("CONST_SM_CORE")){								// Num0 = 7
		if(core_num <= GetFlagID_("CONST_SS_CO_TALK_ANSESU_4")){				// Num8 = 5 �ȉ�
			g_core_slime_a = ReadAndArrangePointNpc("m000_00", "npc_core_slimeA");
			SetScaleSilhouette(g_core_slime_a, SCALE.S, SILHOUETTE_WIDTH.S);
			SetReactorMsg_(g_core_slime_a, "NPC_RAKUEN01_CORE_REC");
		}
		if(core_num == GetFlagID_("CONST_SS_CO_CHECK_UP_ANSESU")){				// Num8 = 6
			g_core_slime_a = ReadAndArrangePointNpc("m000_00", "npc_core_slimeA2");
			SetScaleSilhouette(g_core_slime_a, SCALE.S, SILHOUETTE_WIDTH.S);
			SetReactorMsg_(g_core_slime_a, "NPC_RAKUEN01_CORE_REC");
		}
	}
	
	// ���X���C��B
	if(main_num == GetFlagID_("CONST_SM_CORE")){								// Num0 = 7
		if(core_num <= GetFlagID_("CONST_SS_CO_CHECK_UP_ANSESU")){				// Num8 = 6 �ȉ�
			g_core_slime_b = ReadAndArrangePointNpc("m000_00", "npc_core_slimeB");
			SetScaleSilhouette(g_core_slime_b, SCALE.S, SILHOUETTE_WIDTH.S);
			SetReactorMsg_(g_core_slime_b, "NPC_RAKUEN01_CORE_REC");
		}
	}
	
	
	//-----------
	// ���n���z�u
	//-----------
	// ID������
	g_mine_reactor		<- C_NONE_ID;
	g_mine_ansesu		<- C_NONE_ID;
	
	// �����A�N�^�[�p�n��
	if(main_num == GetFlagID_("CONST_SM_OPENING")){
		if(op_num == GetFlagID_("CONST_SS_OP_SELECT_MONSTER")){
			g_mine_reactor = SetPointCircleEventMine_("mine_reactor", true);
		}
	}
	
	// ���A���Z�X�p�n��
	if(main_num == GetFlagID_("CONST_SM_CORE")){								// Num0 = 7
		if(core_num == GetFlagID_("CONST_SS_CO_TALK_ANSESU_4")){				// Num8 = 5
			g_mine_ansesu = SetPointBoxEventMine_("mine_ansesu", false);
		}
	}
	
	
	//---------------------
	// �����A�N�^�[�|�C���g
	//---------------------
	// ID������
	g_reactor_ansesu_02 <- C_NONE_ID;
	
	// ���A���Z�X
	if(main_num == GetFlagID_("CONST_SM_CORE")){								// Num0 = 7
		if(core_num == GetFlagID_("CONST_SS_CO_CHECK_UP_ANSESU")){				// Num8 = 6
			g_reactor_ansesu_02 = ArrangePointReactorPoint_("reactor_ansesu_02", SHORT_DIST);
			SetReactorEvent_(g_reactor_ansesu_02);
		}
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
	
	//-------------
	// ���f���̍Đ�
	//-------------
	if(main_num == GetFlagID_("CONST_SM_CORE")){								// Num0 = 7
		if(core_num == GetFlagID_("CONST_SS_CO_GO_MOTHER_ROOM")){				// Num8 = 1
			// �V�i���I�ύX�̈�NUM8��2�`4�̃C�x���g���J�b�g���Ĉ�C��5�܂Ŕ�΂�
//			SetNumFlg_(core_num_sub, GetFlagID_("CONST_SS_CO_TALK_ANSESU_1"));	// Num8 = 2
			SetNumFlg_(core_num_sub, GetFlagID_("CONST_SS_CO_TALK_ANSESU_4"));	// Num8 = 5
			SetPlayerBoy(false);								// ���N�i��l���j���
			// �f���Đ���̃}�b�v�Ɣz�u���W���w��
			SetReturnDemoPosDir_(Vec3(-25.0, -25.0, 350.0), 28);
			// Demo602[�y���ӂ����ч@�F�y��Map]
			EventStartChangeDemo(602, FADE_COLOR_BLACK);
		}
	}
	
	
	EventEnd_();
}
//------------------------------------------------
//		�m�o�b�ڐG��
//------------------------------------------------
function TouchNpc()
{
	// �V�i���I�̃t���O���擾����
	main_num = GetNumFlg_("NUM_SCENARIO_MAIN");		// Num0
	op_num	 = GetNumFlg_("NUM_SCENARIO_SUB_OP");	// Num1
	core_num = GetNumFlg_("NUM_SCENARIO_SUB_CORE");	// Num8
	
	local target = GetTargetId_();
	local player = GetPlayerId_();
	
	DebugPrint("ID: " + target + " �ɐڐG [TouchNpc]");
	
	switch (target) {
	case g_sancho :
		uTalkSancho();
		break;
	case g_npc_ansesu :
		uTalkAnsesu();
		break;
	case g_slime_op :
		uTalkSlimeOP();
		break;
	case g_pnkmo_op :
		uTalkPinkMomonOP();
		break;
	case g_core_angel_a :
		uTalkCoreAngelA();
		break;
	case g_core_angel_b :
		uTalkCoreAngelB();
		break;
	case g_core_jobo_a :
		uTalkCoreJoboA();
		break;
	case g_core_jobo_b :
		uTalkCoreJoboB();
		break;
	case g_core_pink_a :
		uTalkCorePinkA();
		break;
	case g_core_pink_b :
		uTalkCorePinkB();
		break;
	case g_core_slime_a :
		uTalkCoreSlimeA();
		break;
	case g_core_slime_b :
		uTalkCoreSlimeB();
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
	main_num = GetNumFlg_("NUM_SCENARIO_MAIN");		// Num0
	op_num	 = GetNumFlg_("NUM_SCENARIO_SUB_OP");	// Num1
	core_num = GetNumFlg_("NUM_SCENARIO_SUB_CORE");	// Num8
	
	local target = GetTouchEventMineId_();
	
	switch(target){
	case g_mine_reactor :
		uMineReactorGet();		// ���A�N�^�[�������Ă���t�߂ɐݒu�����n��
		break;
	case g_mine_ansesu :
		uMineAnsesu();
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
	// �V�i���I�̃t���O���擾����
	main_num = GetNumFlg_("NUM_SCENARIO_MAIN");		// Num0
	op_num	 = GetNumFlg_("NUM_SCENARIO_SUB_OP");	// Num1
	core_num = GetNumFlg_("NUM_SCENARIO_SUB_CORE");	// Num8
	
	local target = GetTargetId_();
	
	switch(target){
	case g_reactor_ansesu_02 :
		uReactorPointAnsesu02();		// ���A�N�^�[�������Ă���t�߂ɂ���A���Z�X
		break;
	default:
		break;
	}
	
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
	if(main_num == GetFlagID_("CONST_SM_OPENING")){										// Num0 = 0
		//  6/19ROM�Ή�
		DeleteEffectEmitter_(g_sancho_eff); // �ڗ�������G�t�F�N�g����U�폜
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_SANCHO");
		ShowMsg_("SANCHO_001");				// �����b�Z�[�W
		KeyInputWait_();
		CloseMsgWnd_();
		g_sancho_eff = SetSelectBoneEffect_("ef732_11_sancho_eff", g_sancho, ATTACH_GLOBAL); // ��b�I���ɃG�t�F�N�g���Đݒu
	}
	if(main_num == GetFlagID_("CONST_SM_CORE")){										// Num0 = 7
		if(core_num == GetFlagID_("CONST_SS_CO_TALK_ANSESU_4")){						// Num8 = 5
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_SANCHO");
			ShowMsg_("NPC_SANCHO_CORE_010");
			KeyInputWait_();
			CloseMsgWnd_();
		}
		if(core_num >= GetFlagID_("CONST_SS_CO_CHECK_UP_ANSESU")){						// Num8 = 6 �ȏ�
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_SANCHO");
			ShowMsg_("NPC_SANCHO_CORE_020");
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		�A���Z�X  ��b����
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkAnsesu()
{
	if(main_num == GetFlagID_("CONST_SM_CORE")){										// Num0 = 7
		if(core_num == GetFlagID_("CONST_SS_CO_TALK_ANSESU_1")){						// Num8 = 2
			SetNumFlg_(core_num_sub, GetFlagID_("CONST_SS_CO_TALK_ANSESU_2"));			// Num8 = 3
			SetPlayerBoy(false);														// ���N�i��l���j���
			// Demo603[�y���ӂ����чA]�Đ�
			TouchNpcChangeDemo(603);
		}
		else if(core_num == GetFlagID_("CONST_SS_CO_TALK_ANSESU_2")){					// Num8 = 3
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_ANSESU");
			ShowMsg_("NPC_ANSESU_CORE_020");			//�u�ǂ����� <name_player/>�H
			KeyInputWait_();
			
			// �u�͂��v
			if (GetQueryResult_() == QUERY2_0) {
				CloseMsgWnd_();
				SetNumFlg_(core_num_sub, GetFlagID_("CONST_SS_CO_TALK_ANSESU_3"));		// Num8 = 4
				SetPlayerBoy(false);													// ���N�i��l���j���
				// Demo604[�A���Z�X�Ƃ̖ⓚ�@]�Đ�
				SetReturnDemoPosDir_(Vec3(39.7, -26.8, 433.2), -146);
				TouchNpcChangeDemo(604);
			}
			// �u�������v
			else {
				ShowMsg_("NPC_ANSESU_CORE_021");		//�u�������B�Ȃ� ����Ȋ�� ������񂶂�Ȃ��B
				KeyInputWait_();
				CloseMsgWnd_();
			}
		}
		else if(core_num == GetFlagID_("CONST_SS_CO_TALK_ANSESU_4")){					// Num8 = 5
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_ANSESU");
			ShowMsg_("NPC_ANSESU_CORE_050");			//�u�c�c�Ȃ� <name_player/>�B������
			KeyInputWait_();
			// �u�͂��v
			if(GetQueryResult_() == QUERY2_0){
				ShowMsg_("NPC_ANSESU_CORE_051");		//�u�킩���Ă����� �����B
				KeyInputWait_();
				CloseMsgWnd_();
			}
			// �u�������v
			else{
				CloseMsgWnd_();
				SetNumFlg_(core_num_sub, GetFlagID_("CONST_SS_CO_CHECK_UP_ANSESU"));	// Num8 = 6
				SetPlayerBoy(false);													// ���N�i��l���j���
				// Demo606[�A���Z�X�Ƃ̖ⓚ�B]
				SetReturnDemoPosDir_(Vec3(-1048.9, 4.5, 208.6), 11);
				TouchNpcChangeDemo(606);
			}
		}
		else if(core_num == GetFlagID_("CONST_SS_CO_CHECK_UP_ANSESU")){					// Num8 = 6
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_ANSESU");
			ShowMsg_("NPC_ANSESU_CORE_060");			//�u�� ���� ����l���̖��O���c�c�H
			KeyInputWait_();
			CloseMsgWnd_();
			
			//���A�N�^�[SE���Đ�
			PlaySE_("SE_FLD_135");						//�y���A�N�^�[��������z�\��
			Wait_(30);
			
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_REACTOR");
			ShowMsg_("SYS_REACTOR_CORE_060");			//�u����Ԃ��܂��B
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		�I�[�v�j���O�̃X���C��  ��b����
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkSlimeOP()
{
	OpenMsgWnd_();
	ShowMsg_("OP_NPC_MSG_001");
	KeyInputWait_();
	CloseMsgWnd_();
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		�I�[�v�j���O�̃s���N���[����  ��b����
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkPinkMomonOP()
{
	OpenMsgWnd_();
	ShowMsg_("OP_NPC_MSG_002");
	KeyInputWait_();
	CloseMsgWnd_();
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		�R�A�V�i���I�̃S�[���h�G���[��A  ��b����
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkCoreAngelA()
{
	if(main_num == GetFlagID_("CONST_SM_CORE")){								// Num0 = 7
		if(core_num <= GetFlagID_("CONST_SS_CO_TALK_ANSESU_4")){				// Num8 = 5 �ȉ�
			OpenMsgWnd_();
			ShowMsg_("NPC_CORE_ANGEL_A_010");
			KeyInputWait_();
			CloseMsgWnd_();
		}
		if(core_num == GetFlagID_("CONST_SS_CO_CHECK_UP_ANSESU")){				// Num8 = 6
			OpenMsgWnd_();
			ShowMsg_("NPC_CORE_ANGEL_A_020");
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		�R�A�V�i���I�̃S�[���h�G���[��B  ��b����
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkCoreAngelB()
{
	OpenMsgWnd_();
	ShowMsg_("NPC_CORE_ANGEL_B_010");
	KeyInputWait_();
	CloseMsgWnd_();
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		�R�A�V�i���I�̂Ƃ��W���{�[A  ��b����
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkCoreJoboA()
{
	if(main_num == GetFlagID_("CONST_SM_CORE")){								// Num0 = 7
		if(core_num <= GetFlagID_("CONST_SS_CO_TALK_ANSESU_4")){				// Num8 = 5 �ȉ�
			OpenMsgWnd_();
			ShowMsg_("NPC_CORE_JOBO_A_010");
			KeyInputWait_();
			CloseMsgWnd_();
		}
		if(core_num == GetFlagID_("CONST_SS_CO_CHECK_UP_ANSESU")){				// Num8 = 6
			OpenMsgWnd_();
			ShowMsg_("NPC_CORE_JOBO_A_020");
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		�R�A�V�i���I�̂Ƃ��W���{�[B  ��b����
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkCoreJoboB()
{
	OpenMsgWnd_();
	ShowMsg_("NPC_CORE_JOBO_B_010");
	KeyInputWait_();
	CloseMsgWnd_();
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		�R�A�V�i���I�̃s���N���[����A  ��b����
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkCorePinkA()
{
	if(main_num == GetFlagID_("CONST_SM_CORE")){								// Num0 = 7
		if(core_num <= GetFlagID_("CONST_SS_CO_TALK_ANSESU_4")){				// Num8 = 5 �ȉ�
			OpenMsgWnd_();
			ShowMsg_("NPC_CORE_PINK_A_010");
			KeyInputWait_();
			CloseMsgWnd_();
		}
		if(core_num == GetFlagID_("CONST_SS_CO_CHECK_UP_ANSESU")){				// Num8 = 6
			OpenMsgWnd_();
			ShowMsg_("NPC_CORE_PINK_A_020");
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		�R�A�V�i���I�̃s���N���[����B  ��b����
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkCorePinkB()
{
	OpenMsgWnd_();
	ShowMsg_("NPC_CORE_PINK_B_010");
	KeyInputWait_();
	CloseMsgWnd_();
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		�R�A�V�i���I�̃X���C��A  ��b����
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkCoreSlimeA()
{
	if(main_num == GetFlagID_("CONST_SM_CORE")){								// Num0 = 7
		if(core_num <= GetFlagID_("CONST_SS_CO_TALK_ANSESU_4")){				// Num8 = 5 �ȉ�
			OpenMsgWnd_();
			ShowMsg_("NPC_CORE_SLIME_A_010");
			KeyInputWait_();
			CloseMsgWnd_();
		}
		if(core_num == GetFlagID_("CONST_SS_CO_CHECK_UP_ANSESU")){				// Num8 = 6
			OpenMsgWnd_();
			ShowMsg_("NPC_CORE_SLIME_A_020");
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		�R�A�V�i���I�̃X���C��B  ��b����
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkCoreSlimeB()
{
	OpenMsgWnd_();
	ShowMsg_("NPC_CORE_SLIME_B_010");
	KeyInputWait_();
	CloseMsgWnd_();
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		��ɗ����Ă��郊�A�N�^�[�𒲂ׂ���
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineReactorGet()
{
	local player = GetPlayerId_();
	// ������(H02_00)�ŕ��A�����ۂ̍��W�ƌ���
	local rtn_demo_pos = Vec3(-105.17, 0.0, -24.299);
	local rtn_demo_dir = 0;
	// ��풓���[�V�����Ǎ�
	local hirou_kaishi = ReadMotion_(player, "Player_hirou_kaishi"); // ���A�N�^�[���E���n��
	local hirou_owari  = ReadMotion_(player, "Player_hirou_owari");  // ���A�N�^�[���E���I���

	// Demo005[�����X�^�[�I��p�̎���]�̍Đ���
	if(main_num == GetFlagID_("CONST_SM_OPENING")){
		if(op_num == GetFlagID_("CONST_SS_OP_SELECT_MONSTER")){
		// ��l�������A�N�^�[�Ɍ����E��
			CommPlayerTurnAroundObj(g_reactor);
			SetMotion_(player, hirou_kaishi, BLEND_M);
			Wait_(15);
		// ���A�N�^�[���E�����ǂ����̑I�������b�Z�[�W
			OpenMsgWnd_();
			ShowMsg_("DEMO_005_AFT_SYS_001");			//�������Ƃ̂Ȃ� �@�B�������Ă���B
			KeyInputWait_();
			CloseMsgWnd_();
		// ���A�N�^�[���E��Ȃ�
			if(GetQueryResult_() == MES_QUERY_NO){
				SetMotion_(player, hirou_owari, BLEND_M);
				Wait_(20);
				SetMotion_(player, MOT_WAIT, BLEND_M);
				OpenMsgWnd_();
				ShowMsg_("DEMO_005_AFT_SYS_002");		//�@�B�� �n�ʂɂ��ǂ����B
				KeyInputWait_();
				CloseMsgWnd_();
			}
		// ���A�N�^�[���E��
			else{
				// �t�F�[�h�A�E�g
				SetFade_(FADE_OUT, FADE_COLOR_BLACK, 15);
				SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, 15);
				WaitFade_();
				
				// �f���Ɉڍs����O�ɕK���ҋ@�ɖ߂�
				SetMotion_(player, MOT_WAIT, BLEND_N);
				
				// �����i�ɃA�C�e����ǉ�(���A�N�^�[)
				AddItem_(63, 1);
				
				// Demo048[���i�[�e�o��@]��Demo049[���i�[�e�o��A]��A���Đ����邽��
				// �V�i���I�̃T�u�t���O��i�߂Ȃ��i�v���Ӂj
				//SetNumFlg_("NUM_SCENARIO_SUB_OP", GetFlagID_("CONST_SS_OP_APPEAR_RENATE"));
				
				// �C�x���g�n�����폜
				DeleteEventMine_(g_mine_reactor);
				
				// ��l�������A�N�^�[��������Ԃɂ���
				SetEventFlg_("BFG_PUT_OUT_REACTOR", false);
				// ���A�N�^�[�����������ǂ���
				SetEventFlg_("BFG_EQUIP_REACTOR", true);
				
				// ������(�y��)�֔��
				SetReturnDemoMap_("H02_00");
				SetReturnDemoPosDir_(rtn_demo_pos, rtn_demo_dir);
				
				// Demo048[���i�[�e�o��@]���Đ������
				ChangeDemo_(48);
			}
		}
	}
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		�A���Z�X�ɋ߂Â������Ƀf�����Đ�����n��
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineAnsesu()
{
	// �C�x���g�n�����폜
	DeleteEventMine_(g_mine_ansesu);
	SetNumFlg_(core_num_sub, GetFlagID_("CONST_SS_CO_CHECK_UP_ANSESU"));	// Num8 = 6
	// �t�F�[�h�A�E�g
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
	SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
	WaitFade_();
	SetPlayerBoy(false);													// ���N�i��l���j���
	// Demo606[�Z�E�A���Z�X]���Đ������
	SetReturnDemoPosDir_(Vec3(-1041.296, 4.94, 206.251), -11);
	ChangeDemo_(606);
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		�A���Z�X  �A�i���C�Y����
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uReactorPointAnsesu02()
{
	if(main_num == GetFlagID_("CONST_SM_CORE")){									// Num0 = 7
		if(core_num == GetFlagID_("CONST_SS_CO_CHECK_UP_ANSESU")){					// Num8 = 6
			SetActive_(g_reactor_ansesu_02, false);		//���A�N�^�[�|�C���g��\�������Ȃ�
			//���A�N�^�[�������I�ɏI��������
			SetFade_(FADE_OUT, FADE_COLOR_BLACK, 15);
			SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, 15);
			WaitFade_();
			ReactorPowerOff_();
			//�f���Đ���̃}�b�v���w��
			SetReturnDemoMap_("C00_03");
			SetReturnDemoPosDir_(Vec3(-4.5, 188.8, -688.1), 0);
			// Demo607[�����̌Z�̐��́F�y��Map]
			ChangeDemo_(607);
		}
	}
}

