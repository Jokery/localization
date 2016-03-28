//===================== G02_00�A���f�b�h�K�[�f�� ====================

// �萔�̐錾
const EFC_SIZE_MIN		= 0.0;	// �G�t�F�N�g�T�C�Y�̍ŏ��l
const EFC_SIZE_MAX		= 0.5;	// �G�t�F�N�g�T�C�Y�̍ő�l
const GRADUALLY_SMALL	= 0.05;	// �G�t�F�N�g�T�C�Y��i�X����������l


//------------------------------------------------
//		�퓬�I����
//------------------------------------------------
function AfterBattle()
{
	// �t���O�̏�Ԃ��擾
	local main_num  = GetNumFlg_("NUM_SCENARIO_MAIN");
	local grave_num = GetNumFlg_("NUM_SCENARIO_SUB_GRAVE");
	
	// �Α��̃t���O���擾
	uGetSekizouFlag();
	
	// �Α��̃t���O���Z�b�g
	uSetSekizouFlag();// �퓬��͐Α��̌�����ێ����邽�߁A�擾�����l�����̂܂܃Z�b�g
	
	EventEnd_();
}


//------------------------------------------------
//		�t�F�[�h�C��
//------------------------------------------------
function FadeIn()
{
	// �}�b�v���B�t���O
	SetEventFlg_("BFG_ARRIVE_AT_G02", true);

	// �t���O�̏�Ԃ��擾
	local main_num		 = GetNumFlg_("NUM_SCENARIO_MAIN");
	local grave_num		 = GetNumFlg_("NUM_SCENARIO_SUB_GRAVE");
	local check_dead	 = GetEventFlg_("BFG_DEAD_RETURN");
	local statue_demo	 = GetEventFlg_("BFG_MOVE_STATUE_FIRST_TIME_DEMO");	// �Α��̏���f���������t���O
	local demo_tyokugo	 = GetEventFlg_("BFG_DISPLAYED_DEMO_MOVE_STATUE");	// �Α��̏���f������������̃t���O
	local seikai		 = GetEventFlg_("BFG_MOVE_SUCCESS_FIRST");			// �S�̂̐Α��M�~�b�N�𐳊m�Ȉʒu�ɍ��킹��ꂽ�t���O
	// �Α��̃t���O���擾
	uGetSekizouFlag();
	
	// �Α��̌����̏����ݒ�
	// �Α��̏���f������������ł͂Ȃ��ꍇ
	if(demo_tyokugo == false){
		SetNumFlg_("NUM_FLG_PRAYROOM_COUNT", 0);				// �菇�J�E���g��0�ɂ���
		// �Α��M�~�b�N�����U���̏ꍇ
		if( seikai == false ){
			// �Α��̊p�x��NUM�t���O�ɒu��������
			uResetNumStone(3, 0, 2, 1);	// 0=0�x, 1=90�x, 2=180�x, 3=270, 4=360�x �Ƃ���
			// ��������l���Z�b�g
			uSetSekizouFlag();
		}
		// �Α��M�~�b�N���U���ς݂̏ꍇ
		if( seikai == true ){
			// �Α��̊p�x��NUM�t���O�ɒu��������
			uResetNumStone(1, 3, 1, 3);	// 0=0�x, 1=90�x, 2=180�x, 3=270, 4=360�x �Ƃ���
			// ��������l���Z�b�g
			uSetSekizouFlag();
		}
	}
	
	// �Α��̃i�r�}�b�v�A�C�R���i�^�[�Q�b�g�j
	g_map_navi01 <- ArrangePointNaviMapIcon_(NAVIMAP_ICON.DIRECTION, "map_navi_01");  // ����
	g_map_navi02 <- ArrangePointNaviMapIcon_(NAVIMAP_ICON.DIRECTION, "map_navi_02");  // �E��
	g_map_navi03 <- ArrangePointNaviMapIcon_(NAVIMAP_ICON.DIRECTION, "map_navi_03");  // ����
	g_map_navi04 <- ArrangePointNaviMapIcon_(NAVIMAP_ICON.DIRECTION, "map_navi_04");  // �E��
	SetNaviMapIconVisible_(g_map_navi01, true);
	SetNaviMapIconVisible_(g_map_navi02, true);
	SetNaviMapIconVisible_(g_map_navi03, true);
	SetNaviMapIconVisible_(g_map_navi04, true);
	
	// ���Ԃ̐ݒ�
	if(main_num == GetFlagID_("CONST_SM_CEMETERY")){						// Num0 = 3
		if(grave_num <= GetFlagID_("CONST_SS_CC_GET_RACE_PROGRAM")){		// Num4 = 17
			// �V�i���I�i�s���͖�iᏋC�j�ɐݒ�
			SetTime_(8700);
		}
	}
	
	DebugPrint(" ");
	DebugPrint("NUM_SCENARIO_MAIN �̒l�� " + main_num + " �ɂȂ�܂����B");


	//----------
	// ��NPC�z�u
	//----------
	// ID������
	g_npc_gost_d	 <- C_NONE_ID;
	g_npc_chomach	 <- C_NONE_ID;
	
	// ���\�[�X�ǂݍ���
	local id_gost	 = ReadNpc_("m100_01");		// �����X�^�[�̗H��
	local id_chomach = ReadNpc_("n006");		// �`���[�}�b�n
	
	// �������X�^�[�̗H��D
	g_npc_gost_d  = ArrangePointNpc_(id_gost,  "npc_gost_d");
	SetScaleSilhouette(g_npc_gost_d, SCALE.S, SILHOUETTE_WIDTH.S);
	SetReactorMsg_(g_npc_gost_d, "GRAVE_NPC_GOST_REC");
	
	// ���`���[�}�b�n
	if(main_num == GetFlagID_("CONST_SM_CEMETERY")){						// Num0 = 3
		if(grave_num <= GetFlagID_("CONST_SS_CC_DESCEND_THE_STAIRS")){		// Num4 = 4 �ȉ�
			g_npc_chomach  = ArrangePointNpc_(id_chomach,  "npc_chomach");
			SetTalkCameraType_(g_npc_chomach, TALK_CAMERA_UP);	// ��b���J�����̐ݒ�
			SetReactorMsg_(g_npc_chomach, "GRAVE_NPC_CHOMACH_REC");
			// �A�i���C�Y�̃^�[�Q�b�g����؂�ւ���(�}�X�^�[�E�m�`���[�����`���[�}�b�n)
			SetTargetNameKey_(g_npc_chomach, "NAME_TAG_CHOMACH");
		}
	}
	
	
	//-----------
	// ���n���z�u
	//-----------
	DebugPrint("�C�x���g�n���̓Ǎ�");
	
	// ID������
	g_mine_book_01		<- C_NONE_ID;
	g_mine_venus_relief <- C_NONE_ID;
	g_mine_stone_01		<- C_NONE_ID;
	g_mine_stone_02		<- C_NONE_ID;
	g_mine_stone_03		<- C_NONE_ID;
	g_mine_stone_04		<- C_NONE_ID;
	g_mine_wall_paper	<- C_NONE_ID;
	
	// ���{�I
	g_mine_book_01 = SetPointCircleEventMine_("mine_book01", true);
	
	// �����莆
	g_mine_wall_paper = SetPointCircleEventMine_("mine_wall_paper", true);
	
	// ���A���Z�X�̕�
	if(main_num == GetFlagID_("CONST_SM_CEMETERY")){						// Num0 = 3
		if(grave_num == GetFlagID_("CONST_SS_CC_MOVE_THE_STONE")){			// Num4 = 3
			g_mine_venus_relief = SetPointCircleEventMine_("mine_venus_relief", true);
		}
	}
	
	// ���Α�
	g_mine_stone_01 = SetPointCircleEventMine_("mine_stone01", true);// ����
	g_mine_stone_02 = SetPointCircleEventMine_("mine_stone02", true);// �E��
	g_mine_stone_03 = SetPointCircleEventMine_("mine_stone03", true);// ����
	g_mine_stone_04 = SetPointCircleEventMine_("mine_stone04", true);// �E��

	//---------------
	// ���M�~�b�N�z�u
	//---------------

	//���Α��M�~�b�N�Ŏg�p����NUM�t���O�̃t���O�ԍ���
	//  �Α��̊p�x�ɒu�������Ďg�p���A���A���^�C���ŐΑ��̊p�x�̒l���擾�o����悤�ɂ��Ă��܂��B
	///////////////////////////////////////////////////////
	//�y�p�x�z  �P�W�O�x      �yNUM�ԍ��z     �Q         //
	//            ��                          ��         //
	// �Q�V�O�x ��  �� �X�O�x            �R ��  �� �P    //
	//            ��                          ��         //
	//           �O�x(�R�U�O�x)               �O(�S)     //
	///////////////////////////////////////////////////////

	//------------------------------------------------
	//	4�̂̐Α��M�~�b�N�̉�]�l��NUM�t���O�Ɋi�[����
	//------------------------------------------------
	// �Α�1�̏ꍇ
	if(g_num_stone1 == 0){ g_dir01 <-   0; }	//NUM�t���O��"0"��������  "0"�x�ɂ���
	if(g_num_stone1 == 1){ g_dir01 <-  90; }	//NUM�t���O��"1"�������� "90"�x�ɂ���
	if(g_num_stone1 == 2){ g_dir01 <- 180; }	//NUM�t���O��"2"��������"180"�x�ɂ���
	if(g_num_stone1 == 3){ g_dir01 <- 270; }	//NUM�t���O��"3"��������"270"�x�ɂ���
	if(g_num_stone1 == 4){ g_dir01 <- 360; }	//NUM�t���O��"4"��������"360"�x�ɂ���
	// �Α�2�̏ꍇ
	if(g_num_stone2 == 0){ g_dir02 <-   0; }
	if(g_num_stone2 == 1){ g_dir02 <-  90; }
	if(g_num_stone2 == 2){ g_dir02 <- 180; }
	if(g_num_stone2 == 3){ g_dir02 <- 270; }
	if(g_num_stone2 == 4){ g_dir02 <- 360; }
	// �Α�3�̏ꍇ
	if(g_num_stone3 == 0){ g_dir03 <-   0; }
	if(g_num_stone3 == 1){ g_dir03 <-  90; }
	if(g_num_stone3 == 2){ g_dir03 <- 180; }
	if(g_num_stone3 == 3){ g_dir03 <- 270; }
	if(g_num_stone3 == 4){ g_dir03 <- 360; }
	// �Α�4�̏ꍇ
	if(g_num_stone4 == 0){ g_dir04 <-   0; }
	if(g_num_stone4 == 1){ g_dir04 <-  90; }
	if(g_num_stone4 == 2){ g_dir04 <- 180; }
	if(g_num_stone4 == 3){ g_dir04 <- 270; }
	if(g_num_stone4 == 4){ g_dir04 <- 360; }
	
	//---------------------------
	//	4�̂̐Α��̓ǂݍ��݂Ɛݒu
	//---------------------------
	// ID������
	g_stone_01 <- C_NONE_ID;
	g_stone_02 <- C_NONE_ID;
	g_stone_03 <- C_NONE_ID;
	g_stone_04 <- C_NONE_ID;
	
	// ���\�[�X�ǂݍ���
	local id_stone_panther = ReadGimmick_("o_G02_20");// �L���[�p���T�[�̐Α�
	local id_stone_fish    = ReadGimmick_("o_G02_21");// �Ƃ��������̐Α�
	
	// 4�̂̐Α��̐ݒu
	g_stone_01 = ArrangePointGimmick_("o_G02_20", id_stone_panther, "g_stone01");//����
	g_stone_02 = ArrangePointGimmick_("o_G02_20", id_stone_panther, "g_stone02");//�E��
	g_stone_03 = ArrangePointGimmick_("o_G02_21", id_stone_fish, "g_stone03");	 //����
	g_stone_04 = ArrangePointGimmick_("o_G02_21", id_stone_fish, "g_stone04");	 //�E��
	
	// �Α��ƃi�r�}�b�v�A�C�R���̌���������̒l�̕����Ɍ�������
	uSetDirStoneAndNavi();
	
	//	���̐ݒu
	if(main_num <= GetFlagID_("CONST_SM_CEMETERY")){						// Num0 = 3
		if(grave_num <= GetFlagID_("CONST_SS_CC_MOVE_THE_STONE")){			// Num4 = 3
			// �B����
			local id_lock_door = ReadGimmick_("o_G02_01");//�E�҂̕�i���j
			local lock_door = ArrangePointGimmick_("o_G02_01", id_lock_door, "g_door");
		}
	}
	
	//------------------
	//	�G�t�F�N�g�̐ݒu
	//------------------
	//�A�^�b�`�p�̃��f����ݒu
	local model_base = ReadGimmick_("o_effect_base");
	base1to2 <- ArrangePointGimmick_("o_effect_base", model_base, "obj001");//�Α�1���Α�2�֔�Ԍ�
	base1to3 <- ArrangePointGimmick_("o_effect_base", model_base, "obj001");//�Α�1���Α�3�֔�Ԍ�
	base2to1 <- ArrangePointGimmick_("o_effect_base", model_base, "obj002");//�Α�2���Α�1�֔�Ԍ�
	base2to4 <- ArrangePointGimmick_("o_effect_base", model_base, "obj002");//�Α�2���Α�4�֔�Ԍ�
	base3to1 <- ArrangePointGimmick_("o_effect_base", model_base, "obj003");//�Α�3���Α�1�֔�Ԍ�
	base3to4 <- ArrangePointGimmick_("o_effect_base", model_base, "obj003");//�Α�3���Α�4�֔�Ԍ�
	base4to2 <- ArrangePointGimmick_("o_effect_base", model_base, "obj004");//�Α�4���Α�2�֔�Ԍ�
	base4to3 <- ArrangePointGimmick_("o_effect_base", model_base, "obj004");//�Α�4���Α�3�֔�Ԍ�
	
	// ���G�t�F�N�g�̓ǂݍ���
	LoadEffect_("ef731_01_mag_light01");
	efc_1to2 <- SetSelectBoneEffect_("ef731_01_mag_light01", base1to2, ATTACH_GLOBAL);
	efc_1to3 <- SetSelectBoneEffect_("ef731_01_mag_light01", base1to3, ATTACH_GLOBAL);
	efc_2to1 <- SetSelectBoneEffect_("ef731_01_mag_light01", base2to1, ATTACH_GLOBAL);
	efc_2to4 <- SetSelectBoneEffect_("ef731_01_mag_light01", base2to4, ATTACH_GLOBAL);
	efc_3to1 <- SetSelectBoneEffect_("ef731_01_mag_light01", base3to1, ATTACH_GLOBAL);
	efc_3to4 <- SetSelectBoneEffect_("ef731_01_mag_light01", base3to4, ATTACH_GLOBAL);
	efc_4to2 <- SetSelectBoneEffect_("ef731_01_mag_light01", base4to2, ATTACH_GLOBAL);
	efc_4to3 <- SetSelectBoneEffect_("ef731_01_mag_light01", base4to3, ATTACH_GLOBAL);
	
	// ���G�t�F�N�g�̃T�C�Y�ݒ� (������Ԃ�"0"�ɂ��Č����Ȃ��悤�ɂ���)
	SetEffectScale_(efc_1to2, EFC_SIZE_MIN);
	SetEffectScale_(efc_1to3, EFC_SIZE_MIN);
	SetEffectScale_(efc_2to1, EFC_SIZE_MIN);
	SetEffectScale_(efc_2to4, EFC_SIZE_MIN);
	SetEffectScale_(efc_3to1, EFC_SIZE_MIN);
	SetEffectScale_(efc_3to4, EFC_SIZE_MIN);
	SetEffectScale_(efc_4to2, EFC_SIZE_MIN);
	SetEffectScale_(efc_4to3, EFC_SIZE_MIN);
	
	//-------------------------
	// �����A�N�^�[�|�C���g�z�u
	//-------------------------
	// �������[�t
	if(main_num <= GetFlagID_("CONST_SM_CEMETERY")){						// Num0 = 3
		if(grave_num <= GetFlagID_("CONST_SS_CC_MOVE_THE_STONE")){			// Num4 = 3
			local reactorPoint01 = ArrangeMsgReactorPoint("rec_point_relief", GetFlagID_("BFG_REACTER_POINT_088")// Bit_1587 �����[�t
				, SHORT_DIST, "REC_POINT_RELIEF_010", "REC_POINT_RELIEF_011");
		}
	}

	// ���{�I
	local reactorPoint02 = ArrangeMsgReactorPoint("rec_point_book_01", GetFlagID_("BFG_REACTER_POINT_089")// Bit_1588 �{�I
		, SHORT_DIST, "REC_POINT_BOOK_010", "REC_POINT_BOOK_011");

	// ���r�玆
	local reactorPoint03 = ArrangeMsgReactorPoint("rec_point_harigami", GetFlagID_("BFG_REACTER_POINT_090")// Bit_1589 �r�玆
		, SHORT_DIST, "REC_POINT_HARIGAMI_010", "REC_POINT_HARIGAMI_011");

	// ���Α�1(����)
	local reactorPoint04 = ArrangeMsgReactorPoint("rec_point_stone01", GetFlagID_("BFG_REACTER_POINT_091")// Bit_1590 �Α�
		, SHORT_DIST, "REC_POINT_STATUE_010", "REC_POINT_KIRAPANSA");

	// ���Α�2(�E��)
	local reactorPoint05 = ArrangeMsgReactorPoint("rec_point_stone02", GetFlagID_("BFG_REACTER_POINT_091")// Bit_1590 �Α�
		, SHORT_DIST, "REC_POINT_STATUE_010", "REC_POINT_KIRAPANSA");

	// ���Α�3(����)
	local reactorPoint06 = ArrangeMsgReactorPoint("rec_point_stone03", GetFlagID_("BFG_REACTER_POINT_091")// Bit_1590 �Α�
		, SHORT_DIST, "REC_POINT_STATUE_010", "REC_POINT_TOTUGEKIUO");

	// ���Α�4(�E��)
	local reactorPoint07 = ArrangeMsgReactorPoint("rec_point_stone04", GetFlagID_("BFG_REACTER_POINT_091")// Bit_1590 �Α�
		, SHORT_DIST, "REC_POINT_STATUE_010", "REC_POINT_TOTUGEKIUO");

	//------------------
	//�}�b�v�i�r
	//------------------

	EventEnd_();
}


//------------------------------------------------
//		�C�x���g�X�^�[�g
//------------------------------------------------
function EventStartOperate()
{
	// �t���O�̏�Ԃ��擾
	local main_num  = GetNumFlg_("NUM_SCENARIO_MAIN");
	local grave_num = GetNumFlg_("NUM_SCENARIO_SUB_GRAVE");
	local demo_tyokugo = GetEventFlg_("BFG_DISPLAYED_DEMO_MOVE_STATUE");// �Α��̏���f������������̃t���O

	// �����X�^�[�̗H��D�𔼓����ɂ���
	SetManualCalcAlpha_(g_npc_gost_d, true);
	SetAlpha_(g_npc_gost_d, 0.3);

	// �f���̍Đ�
	if(main_num == GetFlagID_("CONST_SM_CEMETERY")){						// Num0 = 3
		// �͂��߂ăA���f�b�h�K�[�f���ɓ��������̃f��
		if(grave_num == GetFlagID_("CONST_SS_CC_FIND_THE_GHOST")){			// Num4 = 2
			SetNumFlg_("NUM_SCENARIO_SUB_GRAVE", GetFlagID_("CONST_SS_CC_MOVE_THE_STONE"));	//�t���O�u3�v
			SetReturnDemoPosDir_(Vec3(-36.3, 0.000, 202.9), -103);
			EventStartChangeDemo(203, FADE_COLOR_BLACK);//203[���������]
		}
	}
	
	// �Α��̏���f�����������ゾ�����b�Z�[�W�\��
	if(demo_tyokugo == true){
		SetEventFlg_("BFG_DISPLAYED_DEMO_MOVE_STATUE", false);	// �f������������̃t���O
		
		Wait_(10);
		OpenMsgWnd_();
		ShowMsg_("SYS_HELP_MES_010");	// �Α��𓮂�����@�c��񐔂́@���ƂP�񂾁c�c�B
		KeyInputWait_();
		CloseMsgWnd_();
	}
	
	
	EventEnd_();
}


//------------------------------------------------
//		�m�o�b�ڐG��
//------------------------------------------------
function TouchNpc()
{
	//�t���O�̏�Ԃ��擾
	local main_num  = GetNumFlg_("NUM_SCENARIO_MAIN");
	local grave_num = GetNumFlg_("NUM_SCENARIO_SUB_GRAVE");
	
	//NPC�̎�ނ��擾
	local target = GetTargetId_();
	
	switch(target){
	case g_npc_gost_d :		// �����X�^�[�̗H��D
		uTalkGostD();
		break;
	case g_npc_chomach :	// �`���[�}�b�n
		uTalkChomach();
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
function TouchEventMine(){
	local target = GetTouchEventMineId_();
	local player = GetPlayerId_();
	local demo_tyokugo = GetEventFlg_("BFG_DISPLAYED_DEMO_MOVE_STATUE");	// �Α��̏���f������������̃t���O

	//�t���O�̏�Ԃ��擾
	local main_num		 = GetNumFlg_("NUM_SCENARIO_MAIN");
	local grave_num		 = GetNumFlg_("NUM_SCENARIO_SUB_GRAVE");
	local count_num		 = GetNumFlg_("NUM_FLG_PRAYROOM_COUNT");			// �Α��̎菇���Z�b�g�p
	local seikai		 = GetEventFlg_("BFG_MOVE_SUCCESS_FIRST");			// �S�̂̐Α��M�~�b�N�𐳊m�Ȉʒu�ɍ��킹��ꂽ�t���O
	local statue_demo	 = GetEventFlg_("BFG_MOVE_STATUE_FIRST_TIME_DEMO");	// �Α��̏���f���������t���O
	
	
	switch(target){
	case g_mine_book_01:		//�{�I
		uMineBookShelf();
		break;
	case g_mine_wall_paper:		//���莆
		uMineWallPaper();
		break;
	case g_mine_venus_relief:	//���_�̊G
		uMineVenusRelief();
		break;
	case g_mine_stone_01:		//�Α�1(����)
		uMineRotateStone1();	
		break;
	case g_mine_stone_02:		//�Α�2(�E��)
		uMineRotateStone2();	
		break;
	case g_mine_stone_03:		//�Α�3(����)
		uMineRotateStone3();	
		break;
	case g_mine_stone_04:		//�Α�4(�E��)
		uMineRotateStone4();	
		break;
	default:
		DebugPrint("�ݒu����Ă��Ȃ��n���ɐڐG���肵�Ă��܂��I");
		break;
	}
	
	
	DebugPrint("�Α�1��NUM�t���O�� " + g_num_stone1 + " �ɂȂ�܂����B");
	DebugPrint("�Α�2��NUM�t���O�� " + g_num_stone2 + " �ɂȂ�܂����B");
	DebugPrint("�Α�3��NUM�t���O�� " + g_num_stone3 + " �ɂȂ�܂����B");
	DebugPrint("�Α�4��NUM�t���O�� " + g_num_stone4 + " �ɂȂ�܂����B");
	DebugPrint("�Α�1�� " + g_dir01 + " �x�ɂȂ�܂����B");
	DebugPrint("�Α�2�� " + g_dir02 + " �x�ɂȂ�܂����B");
	DebugPrint("�Α�3�� " + g_dir03 + " �x�ɂȂ�܂����B");
	DebugPrint("�Α�4�� " + g_dir04 + " �x�ɂȂ�܂����B");
	
	
	// �菇�̉񐔂��擾
	count_num = GetNumFlg_("NUM_FLG_PRAYROOM_COUNT");
	
	//�菇�ʂ�ɐ����ɂȂ����ꍇ
	if( count_num == 2 ){
		//�Α��̌����������̌����ɂȂ�����
		if( g_num_stone1 == 1 && g_num_stone2 == 3 && g_num_stone3 == 1 && g_num_stone4 == 3 ){
			if( seikai == false ){
				//�n��������
				DeleteEventMine_(g_mine_stone_01);
				DeleteEventMine_(g_mine_stone_02);
				DeleteEventMine_(g_mine_stone_03);
				DeleteEventMine_(g_mine_stone_04);
				
				// �n�k���N����
				Wait_(15);
				PlaySE_("SE_FLD_129");
				StartEarthQuake_(15, 3, 0.3)
				Wait_(15);
				
				// �u�I�v�s�R��
				LoadEffect_("ef712_10_emo_surprise01");
				SurpriseDisp(player);
				Wait_(15);
				
				// �t�F�[�h�A�E�g
				SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
				SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
				WaitFade_();
				
				// ���������t���O	�i�r�}�b�v�̃y�C���폜�̂��߁A���̃^�C�~���O�ŉ������
				SetEventFlg_("BFG_MOVE_SUCCESS_FIRST", true);// �S�̂̐Α��M�~�b�N�𐳊m�Ȉʒu�ɍ��킹��ꂽ�t���O
				SetNumFlg_("NUM_SCENARIO_SUB_GRAVE", GetFlagID_("CONST_SS_CC_DESCEND_THE_STAIRS"));	//�t���O�u4�v
				
				ChangeDemo_(204);
			}
		}
		// �菇�I�[�o�[�����ꍇ
		else{
			// �菇�J�E���g��0�ɖ߂�
			SetNumFlg_("NUM_FLG_PRAYROOM_COUNT", 0);
			
			// �t�F�[�h�A�E�g
			SetFadePlane_(FADE_PLANE.PLANE_3D);
			SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
			SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
			WaitFade_();
			
			//�Α��̔z�u������������
			uResetNumStone(3, 0, 2, 1);		//�����l���O���[�o���ϐ��ɑ��
			uSetSekizouFlag();				//��������l���Z�b�g
			uResetDirStone(270, 0, 180, 90)	//�Α��̌���������������
			uSetDirStoneAndNavi();			//�Α��ƃi�r�}�b�v�A�C�R���̌���������̒l�̕����Ɍ�������
			
			Wait_(20);
			
			// �V�X�e�����b�Z�[�W
			OpenMsgWnd_();
			ShowMsg_("GIMMICK_NOT_CLEAR_001");		// �������́@�����Ȃ������悤���c�c�B
			KeyInputWait_();
			CloseMsgWnd_();
			
			PlaySE_("SE_FLD_129");
			
			// �V�X�e�����b�Z�[�W
			OpenMsgWnd_();
			ShowMsg_("GIMMICK_NOT_CLEAR_002");		// �Α����@���̌����Ɂ@���ǂ����B
			KeyInputWait_();
			CloseMsgWnd_();
			
			// �t�F�[�h�C��
			Wait_(10);
			SetFade_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
			SetFadeSub_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
			WaitFade_();
			
		}
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
// �t���O�̏�Ԃ��擾
	local main_num  = GetNumFlg_("NUM_SCENARIO_MAIN");
	local grave_num = GetNumFlg_("NUM_SCENARIO_SUB_GRAVE");
	
	// NPC�̎�ނ��擾
	local target = GetTargetId_();
	
	
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
//		�H��D�Ƃ̉�b����
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkGostD()
{
	// �����X�^�[�̗H��D�̃��b�Z�[�W
	OpenMsgWnd_();
	ShowMsg_("DEMO_203_AFT_NPC_GOST_D");			//�u���̕����́@���W�X�^���X���@�g���Ă��񂾁B
	KeyInputWait_();
	CloseMsgWnd_();
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		�`���[�}�b�n�Ƃ̉�b����
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkChomach()
{
	// �`���[�}�b�n�̃��b�Z�[�W
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_CHOMACH");
	ShowMsg_("DEMO_203_AFT_NPC_CHOMACH");			//�u�����@�����Ă���̂��@������������I
	KeyInputWait_();
	CloseMsgWnd_();
}


//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//		�{�I�𒲂ׂ����̏���
//
//----------------------------------------------------------------------------
//	����	: �Ȃ�
//
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function uMineBookShelf()
{
	local player = GetPlayerId_();
	
	SetEventFlg_("BFG_LIMIT_BOOKSHELF_G02_00", true); // Bit_1120 �{�I���ӂ̔z�u�����X�^�[������
	local pos  = Vec3(230.6, 70.0, -290.0);
	uPlayerTurnAroundPos(pos);
	//�V�X�e�����b�Z�[�W
	OpenMsgWnd_();
	ShowMsg_("MINE_BOOK_SHELF_001");
	KeyInputWait_();
	CloseMsgWnd_();
}


//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//		�ǂ̒��莆�𒲂ׂ����̏���
//
//----------------------------------------------------------------------------
//	����	: �Ȃ�
//
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function uMineWallPaper()
{
	local player = GetPlayerId_();
	
	// ���C�A�E�g�̓ǂݍ���
	LoadLayout_("black");
	
	local pos  = Vec3(-190.4, 0.0, 134.6);
	uPlayerTurnAroundPos(pos);
	SetLayoutAnime_("fade_in", false);
	//���������C��
	Wait_(30);
	SetLayoutAnime_("loop", false);
	//��������L
	Wait_(5);
	// ���b�Z�[�W
	ShowScreenMessage_("MINE_WALL_PAPER_001", false);
	//���������A�E�g
	SetLayoutAnime_("fade_out", false);			//�V�X�e�����b�Z�[�W(�Z���^�����O)
	
}


//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//		�����ɂ��鏗�_�̊G�𒲂ׂ����̏���
//
//----------------------------------------------------------------------------
//	����	: �Ȃ�
//
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function uMineVenusRelief()
{
	//�t���O�̏�Ԃ��擾
	local main_num  = GetNumFlg_("NUM_SCENARIO_MAIN");
	local grave_num = GetNumFlg_("NUM_SCENARIO_SUB_GRAVE");
	
	local player = GetPlayerId_();
	
	// ���C�A�E�g�̓ǂݍ���
	LoadLayout_("black");
	
	
	if(main_num == GetFlagID_("CONST_SM_CEMETERY")){						// Num0 = 3
		if(grave_num == GetFlagID_("CONST_SS_CC_MOVE_THE_STONE")){			// Num4 = 3
			local pos  = Vec3(2.5, 16.0, -374.0);
			uPlayerTurnAroundPos(pos);
			SetLayoutAnime_("fade_in", false);
			//���������C��
			Wait_(30);
			SetLayoutAnime_("loop", false);
			//��������L
			Wait_(5);
			// ���b�Z�[�W
			ShowScreenMessage_("MINE_SECRET_DOOR_001", false);
			//���������A�E�g
			SetLayoutAnime_("fade_out", false);			//�V�X�e�����b�Z�[�W(�Z���^�����O)
			
			//�V�X�e�����b�Z�[�W
			OpenMsgWnd_();
			ShowMsg_("MINE_SECRET_DOOR_002");
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//		�Α�1(����)��90�x��]������^�X�N����
//
//----------------------------------------------------------------------------
//	����	: �Ȃ�
//
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function uMineRotateStone1()
{
	//�t���O�̏�Ԃ��擾
	local count_num		 = GetNumFlg_("NUM_FLG_PRAYROOM_COUNT");			// �Α��̎菇���Z�b�g�p
	local statue_demo	 = GetEventFlg_("BFG_MOVE_STATUE_FIRST_TIME_DEMO");	// �Α��̏���f���������t���O
	local seikai		 = GetEventFlg_("BFG_MOVE_SUCCESS_FIRST");			// �S�̂̐Α��M�~�b�N�𐳊m�Ȉʒu�ɍ��킹��ꂽ�t���O

	//�Α��̉�]�^�X�N�Ɏg�p
	local task1, task2, task3, task4;
	//�G�t�F�N�g�Ɏg�p
	local efc_task1to2, efc_task1to3, efc_task2to1, efc_task2to4;
	local efc_task3to1, efc_task3to4, efc_task4to2, efc_task4to3;
	local alpha_def;
	
	
	CommPlayerTurnAroundObj(g_stone_01);
	//�M�~�b�N���U���̏ꍇ
	if( seikai == false ){
		//�V�X�e�����b�Z�[�W
		OpenMsgWnd_();
		ShowMsg_("STONE_ROTATE_QUE");
		KeyInputWait_();
		switch(GetQueryResult_()){
		// ���v���
		case QUERY3_0:
			CloseMsgWnd_();
			
			//�Α��M�~�b�N�̎菇���J�E���g����
			count_num = count_num + 1;
			SetNumFlg_("NUM_FLG_PRAYROOM_COUNT", count_num);
			
			//�Α��������f������x�����Ă��Ȃ��ꍇ
			if(statue_demo == false){
				SetEventFlg_("BFG_MOVE_STATUE_FIRST_TIME_DEMO", true);	//�Α��������f�����������t���O
				SetEventFlg_("BFG_MOVE_DIR_STATUE", true);				//���v����I�������t���O
				SetEventFlg_("BFG_DISPLAYED_DEMO_MOVE_STATUE", true);	//�f������������̃t���O
				
				//��]�l���v�Z����֐�(���ʂ̏o�͂�"function FadeIn()"���ōs����)
				uStoneRotateRight(g_stone_01);	//�Α�1���E��90�x��]������
				uStoneRotateRight(g_stone_02);	//�Α�2���E��90�x��]������
				uStoneRotateRight(g_stone_03);	//�Α�3���E��90�x��]������
				
				// �f���̕��A�ʒu���f���̊�����ɐݒ肵�܂�
				//SetReturnDemoPosDir_(Vec3(261.301, 75.308, -113.488), -28);
				ChangeDemo_(218);//218[�Α���] ����]
			}
			//�Α��������f������x�ł������ꍇ
			if(statue_demo == true){
				
				//��]�l���v�Z����֐�
				uStoneRotateRight(g_stone_01);	//�Α�1���E��90�x��]������
				uStoneRotateRight(g_stone_02);	//�Α�2���E��90�x��]������
				uStoneRotateRight(g_stone_03);	//�Α�3���E��90�x��]������
				
				//--------------------------------
				//�^�X�N�ɂĐΑ��𓯎��ɉ�]������
				//--------------------------------
				//���ׂ��Α��̉�]����
				PlaySE_("SE_FLD_100");
				task1 = Task_RotateToDirSetMotion_(g_stone_01, g_dir01, 2.0, "WAIT", "WAIT");
				WaitTask(task1);
				
				//�i�r�}�b�v�A�C�R���̌�����ς���
				SetNaviMapIconDir_(g_map_navi01, g_dir01);
				
				//�G�t�F�N�g�T�C�Y��W���T�C�Y�ɂ��Ă��甭��
				PlaySE_("SE_DEM_103");
				SetEffectScale_(efc_1to2, EFC_SIZE_MAX);
				SetEffectScale_(efc_1to3, EFC_SIZE_MAX);
				efc_task1to2 = Task_AnimeMoveNoFit_(base1to2, "beem1_to_2");
				efc_task1to3 = Task_AnimeMoveNoFit_(base1to3, "beem1_to_3");
				WaitTask(efc_task1to2);
				
				//�G�t�F�N�g�T�C�Y��"0"�ɂ��Č����Ȃ��悤�ɂ���
				for(alpha_def = EFC_SIZE_MAX; alpha_def >= EFC_SIZE_MIN; alpha_def = alpha_def - GRADUALLY_SMALL){
					SetEffectScale_(efc_1to2, alpha_def);
					SetEffectScale_(efc_1to3, alpha_def);
					Wait_(1);
				}
				
				//�G�t�F�N�g�̃��l��0�ɂ���
				SetEffectScale_(efc_1to2, EFC_SIZE_MIN);
				SetEffectScale_(efc_1to3, EFC_SIZE_MIN);
				
				//�r�[���̈ʒu�����ɖ߂�
				SetPointPos_(base1to2, "obj001");
				SetPointPos_(base1to3, "obj001");
				
				//�r�[�������������Α��̉�]����
				PlaySE_("SE_FLD_100");
				task2 = Task_RotateToDirSetMotion_(g_stone_02, g_dir02, 2.0, "WAIT", "WAIT");
				task3 = Task_RotateToDirSetMotion_(g_stone_03, g_dir03, 2.0, "WAIT", "WAIT");
				WaitTask(task2);
				
				//�i�r�}�b�v�A�C�R���̌�����ς���
				SetNaviMapIconDir_(g_map_navi02, g_dir02);
				SetNaviMapIconDir_(g_map_navi03, g_dir03);
				
				//�V�X�e�����b�Z�[�W
				OpenMsgWnd_();
				ShowMsg_("GRAVE_FAKE_SYS_04");
				KeyInputWait_();
				CloseMsgWnd_();
			}
			break;
		// �����v���
		case QUERY3_1:
			//�Α��M�~�b�N�̎菇���J�E���g����
			count_num = count_num + 1;
			SetNumFlg_("NUM_FLG_PRAYROOM_COUNT", count_num);
			
			//�Α��������f������x�����Ă��Ȃ��ꍇ
			if(statue_demo == false){
				SetEventFlg_("BFG_MOVE_STATUE_FIRST_TIME_DEMO", true);	//�Α��������f�����������t���O
				SetEventFlg_("BFG_MOVE_DIR_STATUE", false);				//�����v����I�������t���O
				SetEventFlg_("BFG_DISPLAYED_DEMO_MOVE_STATUE", true);	//�f������������̃t���O
				
				//��]�l���v�Z����֐�(���ʂ̏o�͂�"function FadeIn()"���ōs����)
				uStoneRotateLeft(g_stone_01);	//�Α�1������90�x��]������
				uStoneRotateLeft(g_stone_02);	//�Α�2������90�x��]������
				uStoneRotateLeft(g_stone_03);	//�Α�3������90�x��]������
				
				// �f���̕��A�ʒu���f���̊�����ɐݒ肵�܂�
				//SetReturnDemoPosDir_(Vec3(261.301, 75.308, -113.488), -28);
				ChangeDemo_(218);//218[�Α���] ����]
			}
			//�Α��������f������x�ł������ꍇ
			if(statue_demo == true){
				CloseMsgWnd_();
				//���ׂ��Α��̉�]����
				uStoneRotateLeft(g_stone_01);	//�Α�1������90�x��]������
				uStoneRotateLeft(g_stone_02);	//�Α�2������90�x��]������
				uStoneRotateLeft(g_stone_03);	//�Α�3������90�x��]������
				
				//--------------------------------
				//�^�X�N�ɂĐΑ��𓯎��ɉ�]������
				//--------------------------------
				//���ׂ��Α��̉�]����
				PlaySE_("SE_FLD_100");
				task1 = Task_RotateToDirSetMotion_(g_stone_01, g_dir01, 2.0, "WAIT", "WAIT");
				WaitTask(task1);
				
				//�i�r�}�b�v�A�C�R���̌�����ς���
				SetNaviMapIconDir_(g_map_navi01, g_dir01);
				
				//�G�t�F�N�g�T�C�Y��W���T�C�Y�ɂ��Ă��甭��
				PlaySE_("SE_DEM_103");
				SetEffectScale_(efc_1to2, EFC_SIZE_MAX);
				SetEffectScale_(efc_1to3, EFC_SIZE_MAX);
				efc_task1to2 = Task_AnimeMoveNoFit_(base1to2, "beem1_to_2");
				efc_task1to3 = Task_AnimeMoveNoFit_(base1to3, "beem1_to_3");
				WaitTask(efc_task1to2);
				
				//�G�t�F�N�g�T�C�Y��"0"�ɂ��Č����Ȃ��悤�ɂ���
				for(alpha_def = EFC_SIZE_MAX; alpha_def >= EFC_SIZE_MIN; alpha_def = alpha_def - GRADUALLY_SMALL){
					SetEffectScale_(efc_1to2, alpha_def);
					SetEffectScale_(efc_1to3, alpha_def);
					Wait_(1);
				}
				
				//�G�t�F�N�g�̃��l��0�ɂ���
				SetEffectScale_(efc_1to2, EFC_SIZE_MIN);
				SetEffectScale_(efc_1to3, EFC_SIZE_MIN);
				
				//�r�[���̈ʒu�����ɖ߂�
				SetPointPos_(base1to2, "obj001");
				SetPointPos_(base1to3, "obj001");
				
				//�r�[�������������Α��̉�]����
				PlaySE_("SE_FLD_100");
				task2 = Task_RotateToDirSetMotion_(g_stone_02, g_dir02, 2.0, "WAIT", "WAIT");
				task3 = Task_RotateToDirSetMotion_(g_stone_03, g_dir03, 2.0, "WAIT", "WAIT");
				WaitTask(task2);
				
				//�i�r�}�b�v�A�C�R���̌�����ς���
				SetNaviMapIconDir_(g_map_navi02, g_dir02);
				SetNaviMapIconDir_(g_map_navi03, g_dir03);
				
				//�V�X�e�����b�Z�[�W
				OpenMsgWnd_();
				ShowMsg_("GRAVE_FAKE_SYS_04");
				KeyInputWait_();
				CloseMsgWnd_();
			}
			break;
		// ��߂�
		case QUERY3_2:
			//���b�Z�[�W�E�C���h�E�����(��)
			CloseMsgWnd_();
			break;
		}
	}else{
		//�M�~�b�N�U��������̃��b�Z�[�W
		OpenMsgWnd_();
		ShowMsg_("GRAVE_FAKE_SYS_05");
		KeyInputWait_();
		CloseMsgWnd_();
	}
	
	// �菇�̉񐔂������郁�b�Z�[�W��\��
	if(statue_demo == true){					// �Α��������f����������
		if( count_num == 1 ){					// �菇�̉񐔂����ƈ��̏ꍇ
			OpenMsgWnd_();
			ShowMsg_("SYS_HELP_MES_010");		// �Α��𓮂�����@�c��񐔂́@���ƂP�񂾁c�c�B
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//		�Α�2(�E��)��90�x��]������^�X�N����
//
//----------------------------------------------------------------------------
//	����	: �Ȃ�
//
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function uMineRotateStone2()
{
	//�t���O�̏�Ԃ��擾
	local count_num		 = GetNumFlg_("NUM_FLG_PRAYROOM_COUNT");			// �Α��̎菇���Z�b�g�p
	local statue_demo	 = GetEventFlg_("BFG_MOVE_STATUE_FIRST_TIME_DEMO");	// �Α��̏���f���������t���O
	local seikai		 = GetEventFlg_("BFG_MOVE_SUCCESS_FIRST");			// �S�̂̐Α��M�~�b�N�𐳊m�Ȉʒu�ɍ��킹��ꂽ�t���O

	//�Α��̉�]�^�X�N�Ɏg�p
	local task1, task2, task3, task4;
	//�G�t�F�N�g�Ɏg�p
	local efc_task1to2, efc_task1to3, efc_task2to1, efc_task2to4;
	local efc_task3to1, efc_task3to4, efc_task4to2, efc_task4to3;
	local alpha_def;
	
	
	CommPlayerTurnAroundObj(g_stone_02);
	//�M�~�b�N���U���̏ꍇ
	if( seikai == false ){
		//�V�X�e�����b�Z�[�W
		OpenMsgWnd_();
		ShowMsg_("STONE_ROTATE_QUE");
		KeyInputWait_();
		switch(GetQueryResult_()){
		// ���v���
		case QUERY3_0:
			CloseMsgWnd_();
			
			//�Α��M�~�b�N�̎菇���J�E���g����
			count_num = count_num + 1;
			SetNumFlg_("NUM_FLG_PRAYROOM_COUNT", count_num);
			
			//�Α��������f������x�����Ă��Ȃ��ꍇ
			if(statue_demo == false){
				SetEventFlg_("BFG_MOVE_STATUE_FIRST_TIME_DEMO", true);	//�Α��������f�����������t���O
				SetEventFlg_("BFG_MOVE_DIR_STATUE", true);				//���v����I�������t���O
				SetEventFlg_("BFG_DISPLAYED_DEMO_MOVE_STATUE", true);	//�f������������̃t���O
				
				//��]�l���v�Z����֐�(���ʂ̏o�͂�"function FadeIn()"���ōs����)
				uStoneRotateRight(g_stone_01);	//�Α�1���E��90�x��]������
				uStoneRotateRight(g_stone_02);	//�Α�2���E��90�x��]������
				uStoneRotateRight(g_stone_04);	//�Α�4���E��90�x��]������
				
				// �f���̕��A�ʒu���f���̊�����ɐݒ肵�܂�
				//SetReturnDemoPosDir_(Vec3(261.301, 75.308, -113.488), -28);
				ChangeDemo_(217);//217[�Α���] �E��]
			}
			//�Α��������f������x�ł������ꍇ
			if(statue_demo == true){
				
				//��]�l���v�Z����֐�
				uStoneRotateRight(g_stone_01);	//�Α�1���E��90�x��]������
				uStoneRotateRight(g_stone_02);	//�Α�2���E��90�x��]������
				uStoneRotateRight(g_stone_04);	//�Α�4���E��90�x��]������
				
				//--------------------------------
				//�^�X�N�ɂĐΑ��𓯎��ɉ�]������
				//--------------------------------
				//���ׂ��Α��̉�]����
				PlaySE_("SE_FLD_100");
				task2 = Task_RotateToDirSetMotion_(g_stone_02, g_dir02, 2.0, "WAIT", "WAIT");
				WaitTask(task2);
				
				//�i�r�}�b�v�A�C�R���̌�����ς���
				SetNaviMapIconDir_(g_map_navi02, g_dir02);
				
				//�G�t�F�N�g�T�C�Y��W���T�C�Y�ɂ��Ă��甭��
				PlaySE_("SE_DEM_103");
				SetEffectScale_(efc_2to1, EFC_SIZE_MAX);
				SetEffectScale_(efc_2to4, EFC_SIZE_MAX);
				efc_task2to1 = Task_AnimeMoveNoFit_(base2to1, "beem2_to_1");
				efc_task2to4 = Task_AnimeMoveNoFit_(base2to4, "beem2_to_4");
				WaitTask(efc_task2to1);
				
				//�G�t�F�N�g�T�C�Y��"0"�ɂ��Č����Ȃ��悤�ɂ���
				for(alpha_def = EFC_SIZE_MAX; alpha_def >= EFC_SIZE_MIN; alpha_def = alpha_def - GRADUALLY_SMALL){
					SetEffectScale_(efc_2to1, alpha_def);
					SetEffectScale_(efc_2to4, alpha_def);
					Wait_(1);
				}
				
				//�G�t�F�N�g�̃��l��0�ɂ���
				SetEffectScale_(efc_2to1, EFC_SIZE_MIN);
				SetEffectScale_(efc_2to4, EFC_SIZE_MIN);
				
				//�r�[���̈ʒu�����ɖ߂�
				SetPointPos_(base2to1, "obj002");
				SetPointPos_(base2to4, "obj002");
				
				//�r�[�������������Α��̉�]����
				PlaySE_("SE_FLD_100");
				task1 = Task_RotateToDirSetMotion_(g_stone_01, g_dir01, 2.0, "WAIT", "WAIT");
				task4 = Task_RotateToDirSetMotion_(g_stone_04, g_dir04, 2.0, "WAIT", "WAIT");
				WaitTask(task1);
				
				//�i�r�}�b�v�A�C�R���̌�����ς���
				SetNaviMapIconDir_(g_map_navi01, g_dir01);
				SetNaviMapIconDir_(g_map_navi04, g_dir04);
				
				//�V�X�e�����b�Z�[�W
				OpenMsgWnd_();
				ShowMsg_("GRAVE_FAKE_SYS_04");
				KeyInputWait_();
				CloseMsgWnd_();
			}
			break;
		// �����v���
		case QUERY3_1:
			//�Α��M�~�b�N�̎菇���J�E���g����
			count_num = count_num + 1;
			SetNumFlg_("NUM_FLG_PRAYROOM_COUNT", count_num);
			
			//�Α��������f������x�����Ă��Ȃ��ꍇ
			if(statue_demo == false){
				SetEventFlg_("BFG_MOVE_STATUE_FIRST_TIME_DEMO", true);	//�Α��������f�����������t���O
				SetEventFlg_("BFG_MOVE_DIR_STATUE", false);				//�����v����I�������t���O
				SetEventFlg_("BFG_DISPLAYED_DEMO_MOVE_STATUE", true);	//�f������������̃t���O
				
				//��]�l���v�Z����֐�(���ʂ̏o�͂�"function FadeIn()"���ōs����)
				uStoneRotateLeft(g_stone_01);	//�Α�1������90�x��]������
				uStoneRotateLeft(g_stone_02);	//�Α�2������90�x��]������
				uStoneRotateLeft(g_stone_04);	//�Α�4������90�x��]������
				
				// �f���̕��A�ʒu���f���̊�����ɐݒ肵�܂�
				//SetReturnDemoPosDir_(Vec3(261.301, 75.308, -113.488), -28);
				ChangeDemo_(217);//217[�Α���] �E��]
			}
			//�Α��������f������x�ł������ꍇ
			if(statue_demo == true){
				CloseMsgWnd_();
				//��]�l���v�Z����֐�
				uStoneRotateLeft(g_stone_01);	//�Α�1������90�x��]������
				uStoneRotateLeft(g_stone_02);	//�Α�2������90�x��]������
				uStoneRotateLeft(g_stone_04);	//�Α�4������90�x��]������
				
				//--------------------------------
				//�^�X�N�ɂĐΑ��𓯎��ɉ�]������
				//--------------------------------
				//���ׂ��Α��̉�]����
				PlaySE_("SE_FLD_100");
				task2 = Task_RotateToDirSetMotion_(g_stone_02, g_dir02, 2.0, "WAIT", "WAIT");
				WaitTask(task2);
				
				//�i�r�}�b�v�A�C�R���̌�����ς���
				SetNaviMapIconDir_(g_map_navi02, g_dir02);
				
				//�G�t�F�N�g�T�C�Y��W���T�C�Y�ɂ��Ă��甭��
				PlaySE_("SE_DEM_103");
				SetEffectScale_(efc_2to1, EFC_SIZE_MAX);
				SetEffectScale_(efc_2to4, EFC_SIZE_MAX);
				efc_task2to1 = Task_AnimeMoveNoFit_(base2to1, "beem2_to_1");
				efc_task2to4 = Task_AnimeMoveNoFit_(base2to4, "beem2_to_4");
				WaitTask(efc_task2to1);
				
				//�G�t�F�N�g�T�C�Y��"0"�ɂ��Č����Ȃ��悤�ɂ���
				for(alpha_def = EFC_SIZE_MAX; alpha_def >= EFC_SIZE_MIN; alpha_def = alpha_def - GRADUALLY_SMALL){
					SetEffectScale_(efc_2to1, alpha_def);
					SetEffectScale_(efc_2to4, alpha_def);
					Wait_(1);
				}
				
				//�G�t�F�N�g�̃��l��0�ɂ���
				SetEffectScale_(efc_2to1, EFC_SIZE_MIN);
				SetEffectScale_(efc_2to4, EFC_SIZE_MIN);
				
				//�r�[���̈ʒu�����ɖ߂�
				SetPointPos_(base2to1, "obj002");
				SetPointPos_(base2to4, "obj002");
				
				//�r�[�������������Α��̉�]����
				PlaySE_("SE_FLD_100");
				task1 = Task_RotateToDirSetMotion_(g_stone_01, g_dir01, 2.0, "WAIT", "WAIT");
				task4 = Task_RotateToDirSetMotion_(g_stone_04, g_dir04, 2.0, "WAIT", "WAIT");
				WaitTask(task1);
				
				//�i�r�}�b�v�A�C�R���̌�����ς���
				SetNaviMapIconDir_(g_map_navi01, g_dir01);
				SetNaviMapIconDir_(g_map_navi04, g_dir04);
				
				//�V�X�e�����b�Z�[�W
				OpenMsgWnd_();
				ShowMsg_("GRAVE_FAKE_SYS_04");
				KeyInputWait_();
				CloseMsgWnd_();
			}
			break;
		// ��߂�
		case QUERY3_2:
			//���b�Z�[�W�E�C���h�E�����(��)
			CloseMsgWnd_();
			break;
		}
	}else{
		//�M�~�b�N�U��������̃��b�Z�[�W
		OpenMsgWnd_();
		ShowMsg_("GRAVE_FAKE_SYS_05");
		KeyInputWait_();
		CloseMsgWnd_();
	}
	
	// �菇�̉񐔂������郁�b�Z�[�W��\��
	if(statue_demo == true){					// �Α��������f����������
		if( count_num == 1 ){					// �菇�̉񐔂����ƈ��̏ꍇ
			OpenMsgWnd_();
			ShowMsg_("SYS_HELP_MES_010");		// �Α��𓮂�����@�c��񐔂́@���ƂP�񂾁c�c�B
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//		�Α�3(����)��90�x��]������^�X�N����
//
//----------------------------------------------------------------------------
//	����	: �Ȃ�
//
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function uMineRotateStone3()
{
	//�t���O�̏�Ԃ��擾
	local count_num		 = GetNumFlg_("NUM_FLG_PRAYROOM_COUNT");			// �Α��̎菇���Z�b�g�p
	local statue_demo	 = GetEventFlg_("BFG_MOVE_STATUE_FIRST_TIME_DEMO");	// �Α��̏���f���������t���O
	local seikai		 = GetEventFlg_("BFG_MOVE_SUCCESS_FIRST");			// �S�̂̐Α��M�~�b�N�𐳊m�Ȉʒu�ɍ��킹��ꂽ�t���O

	//�Α��̉�]�^�X�N�Ɏg�p
	local task1, task2, task3, task4;
	//�G�t�F�N�g�Ɏg�p
	local efc_task1to2, efc_task1to3, efc_task2to1, efc_task2to4;
	local efc_task3to1, efc_task3to4, efc_task4to2, efc_task4to3;
	local alpha_def;
	
//	statue_demo = true;	//�f�o�b�O�m�F�p(�L���ɂ���Ə���f�����������Ȃ��Ȃ�)
	
	CommPlayerTurnAroundObj(g_stone_03);
	//�M�~�b�N���U���̏ꍇ
	if( seikai == false ){
		//�V�X�e�����b�Z�[�W
		OpenMsgWnd_();
		ShowMsg_("STONE_ROTATE_QUE");
		KeyInputWait_();
		switch(GetQueryResult_()){
		// ���v���
		case QUERY3_0:
			CloseMsgWnd_();
			
			//�Α��M�~�b�N�̎菇���J�E���g����
			count_num = count_num + 1;
			SetNumFlg_("NUM_FLG_PRAYROOM_COUNT", count_num);
			
			//�Α��������f������x�����Ă��Ȃ��ꍇ
			if(statue_demo == false){
				SetEventFlg_("BFG_MOVE_STATUE_FIRST_TIME_DEMO", true);	//�Α��������f�����������t���O
				SetEventFlg_("BFG_MOVE_DIR_STATUE", true);				//���v����I�������t���O
				SetEventFlg_("BFG_DISPLAYED_DEMO_MOVE_STATUE", true);	//�f������������̃t���O
				
				//��]�l���v�Z����֐�(���ʂ̏o�͂�"function FadeIn()"���ōs����)
				uStoneRotateRight(g_stone_01);	//�Α�1���E��90�x��]������
				uStoneRotateRight(g_stone_03);	//�Α�3���E��90�x��]������
				uStoneRotateRight(g_stone_04);	//�Α�4���E��90�x��]������
				
				// �f���̕��A�ʒu���f���̊�����ɐݒ肵�܂�
				//SetReturnDemoPosDir_(Vec3(261.301, 75.308, -113.488), -28);
				ChangeDemo_(216);//216[�Α���] ����]
			}
			//�Α��������f������x�ł������ꍇ
			if(statue_demo == true){
				
				//��]�l���v�Z����֐�
				uStoneRotateRight(g_stone_01);	//�Α�1���E��90�x��]������
				uStoneRotateRight(g_stone_03);	//�Α�3���E��90�x��]������
				uStoneRotateRight(g_stone_04);	//�Α�4���E��90�x��]������
				
				//--------------------------------
				//�^�X�N�ɂĐΑ��𓯎��ɉ�]������
				//--------------------------------
				//���ׂ��Α��̉�]����
				PlaySE_("SE_FLD_100");
				task3 = Task_RotateToDirSetMotion_(g_stone_03, g_dir03, 2.0, "WAIT", "WAIT");
				WaitTask(task3);
				
				//�i�r�}�b�v�A�C�R���̌�����ς���
				SetNaviMapIconDir_(g_map_navi03, g_dir03);
				
				//�G�t�F�N�g�T�C�Y��W���T�C�Y�ɂ��Ă��甭��
				PlaySE_("SE_DEM_103");
				SetEffectScale_(efc_3to1, EFC_SIZE_MAX);
				SetEffectScale_(efc_3to4, EFC_SIZE_MAX);
				efc_task3to1 = Task_AnimeMoveNoFit_(base3to1, "beem3_to_1");
				efc_task3to4 = Task_AnimeMoveNoFit_(base3to4, "beem3_to_4");
				WaitTask(efc_task3to1);
				
				//�G�t�F�N�g�T�C�Y��"0"�ɂ��Č����Ȃ��悤�ɂ���
				for(alpha_def = EFC_SIZE_MAX; alpha_def >= EFC_SIZE_MIN; alpha_def = alpha_def - GRADUALLY_SMALL){
					SetEffectScale_(efc_3to1, alpha_def);
					SetEffectScale_(efc_3to4, alpha_def);
					Wait_(1);
				}
				
				//�G�t�F�N�g�̃��l��0�ɂ���
				SetEffectScale_(efc_3to1, EFC_SIZE_MIN);
				SetEffectScale_(efc_3to4, EFC_SIZE_MIN);
				
				//�r�[���̈ʒu�����ɖ߂�
				SetPointPos_(base3to1, "obj003");
				SetPointPos_(base3to4, "obj003");
				
				//�r�[�������������Α��̉�]����
				PlaySE_("SE_FLD_100");
				task1 = Task_RotateToDirSetMotion_(g_stone_01, g_dir01, 2.0, "WAIT", "WAIT");
				task4 = Task_RotateToDirSetMotion_(g_stone_04, g_dir04, 2.0, "WAIT", "WAIT");
				WaitTask(task1);
				
				//�i�r�}�b�v�A�C�R���̌�����ς���
				SetNaviMapIconDir_(g_map_navi01, g_dir01);
				SetNaviMapIconDir_(g_map_navi04, g_dir04);
				
				//�V�X�e�����b�Z�[�W
				OpenMsgWnd_();
				ShowMsg_("GRAVE_FAKE_SYS_04");
				KeyInputWait_();
				CloseMsgWnd_();
			}
			break;
		// �����v���
		case QUERY3_1:
			//�Α��M�~�b�N�̎菇���J�E���g����
			count_num = count_num + 1;
			SetNumFlg_("NUM_FLG_PRAYROOM_COUNT", count_num);
			
			//�Α��������f������x�����Ă��Ȃ��ꍇ
			if(statue_demo == false){
				SetEventFlg_("BFG_MOVE_STATUE_FIRST_TIME_DEMO", true);	//�Α��������f�����������t���O
				SetEventFlg_("BFG_MOVE_DIR_STATUE", false);				//�����v����I�������t���O
				SetEventFlg_("BFG_DISPLAYED_DEMO_MOVE_STATUE", true);	//�f������������̃t���O
				
				//��]�l���v�Z����֐�(���ʂ̏o�͂�"function FadeIn()"���ōs����)
				uStoneRotateLeft(g_stone_01);	//�Α�1������90�x��]������
				uStoneRotateLeft(g_stone_03);	//�Α�3������90�x��]������
				uStoneRotateLeft(g_stone_04);	//�Α�4������90�x��]������
				
				// �f���̕��A�ʒu���f���̊�����ɐݒ肵�܂�
				//SetReturnDemoPosDir_(Vec3(261.301, 75.308, -113.488), -28);
				ChangeDemo_(216);//216[�Α���] ����]
			}
			//�Α��������f������x�ł������ꍇ
			if(statue_demo == true){
				CloseMsgWnd_();
				//��]�l���v�Z����֐�
				uStoneRotateLeft(g_stone_01);	//�Α�1������90�x��]������
				uStoneRotateLeft(g_stone_03);	//�Α�3������90�x��]������
				uStoneRotateLeft(g_stone_04);	//�Α�4������90�x��]������
				
				//--------------------------------
				//�^�X�N�ɂĐΑ��𓯎��ɉ�]������
				//--------------------------------
				//���ׂ��Α��̉�]����
				PlaySE_("SE_FLD_100");
				task3 = Task_RotateToDirSetMotion_(g_stone_03, g_dir03, 2.0, "WAIT", "WAIT");
				WaitTask(task3);
				
				//�i�r�}�b�v�A�C�R���̌�����ς���
				SetNaviMapIconDir_(g_map_navi03, g_dir03);
				
				//�G�t�F�N�g�T�C�Y��W���T�C�Y�ɂ��Ă��甭��
				PlaySE_("SE_DEM_103");
				SetEffectScale_(efc_3to1, EFC_SIZE_MAX);
				SetEffectScale_(efc_3to4, EFC_SIZE_MAX);
				efc_task3to1 = Task_AnimeMoveNoFit_(base3to1, "beem3_to_1");
				efc_task3to4 = Task_AnimeMoveNoFit_(base3to4, "beem3_to_4");
				WaitTask(efc_task3to1);
				
				//�G�t�F�N�g�T�C�Y��"0"�ɂ��Č����Ȃ��悤�ɂ���
				for(alpha_def = EFC_SIZE_MAX; alpha_def >= EFC_SIZE_MIN; alpha_def = alpha_def - GRADUALLY_SMALL){
					SetEffectScale_(efc_3to1, alpha_def);
					SetEffectScale_(efc_3to4, alpha_def);
					Wait_(1);
				}
				
				//�G�t�F�N�g�̃��l��0�ɂ���
				SetEffectScale_(efc_3to1, EFC_SIZE_MIN);
				SetEffectScale_(efc_3to4, EFC_SIZE_MIN);
				
				//�r�[���̈ʒu�����ɖ߂�
				SetPointPos_(base3to1, "obj003");
				SetPointPos_(base3to4, "obj003");
				
				//�r�[�������������Α��̉�]����
				PlaySE_("SE_FLD_100");
				task1 = Task_RotateToDirSetMotion_(g_stone_01, g_dir01, 2.0, "WAIT", "WAIT");
				task4 = Task_RotateToDirSetMotion_(g_stone_04, g_dir04, 2.0, "WAIT", "WAIT");
				WaitTask(task1);
				
				//�i�r�}�b�v�A�C�R���̌�����ς���
				SetNaviMapIconDir_(g_map_navi01, g_dir01);
				SetNaviMapIconDir_(g_map_navi04, g_dir04);
				
				//�V�X�e�����b�Z�[�W
				OpenMsgWnd_();
				ShowMsg_("GRAVE_FAKE_SYS_04");
				KeyInputWait_();
				CloseMsgWnd_();
			}
			break;
		// ��߂�
		case QUERY3_2:
			//���b�Z�[�W�E�C���h�E�����(��)
			CloseMsgWnd_();
			break;
		}
	}else{
		//�M�~�b�N�U��������̃��b�Z�[�W
		OpenMsgWnd_();
		ShowMsg_("GRAVE_FAKE_SYS_05");
		KeyInputWait_();
		CloseMsgWnd_();
	}
	
	// �菇�̉񐔂������郁�b�Z�[�W��\��
	if(statue_demo == true){					// �Α��������f����������
		if( count_num == 1 ){					// �菇�̉񐔂����ƈ��̏ꍇ
			OpenMsgWnd_();
			ShowMsg_("SYS_HELP_MES_010");		// �Α��𓮂�����@�c��񐔂́@���ƂP�񂾁c�c�B
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//		�Α�4(�E��)��90�x��]������^�X�N����
//
//----------------------------------------------------------------------------
//	����	: �Ȃ�
//
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function uMineRotateStone4()
{
	//�t���O�̏�Ԃ��擾
	local count_num		 = GetNumFlg_("NUM_FLG_PRAYROOM_COUNT");			// �Α��̎菇���Z�b�g�p
	local statue_demo	 = GetEventFlg_("BFG_MOVE_STATUE_FIRST_TIME_DEMO");	// �Α��̏���f���������t���O
	local seikai		 = GetEventFlg_("BFG_MOVE_SUCCESS_FIRST");			// �S�̂̐Α��M�~�b�N�𐳊m�Ȉʒu�ɍ��킹��ꂽ�t���O

	//�Α��̉�]�^�X�N�Ɏg�p
	local task1, task2, task3, task4;
	//�G�t�F�N�g�Ɏg�p
	local efc_task1to2, efc_task1to3, efc_task2to1, efc_task2to4;
	local efc_task3to1, efc_task3to4, efc_task4to2, efc_task4to3;
	local alpha_def;
	
	
	CommPlayerTurnAroundObj(g_stone_04);
	//�M�~�b�N���U���̏ꍇ
	if( seikai == false ){
		//�V�X�e�����b�Z�[�W
		OpenMsgWnd_();
		ShowMsg_("STONE_ROTATE_QUE");
		KeyInputWait_();
		switch(GetQueryResult_()){
		// ���v���
		case QUERY3_0:
			CloseMsgWnd_();
			
			//�Α��M�~�b�N�̎菇���J�E���g����
			count_num = count_num + 1;
			SetNumFlg_("NUM_FLG_PRAYROOM_COUNT", count_num);
			
			//�Α��������f������x�����Ă��Ȃ��ꍇ
			if(statue_demo == false){
				SetEventFlg_("BFG_MOVE_STATUE_FIRST_TIME_DEMO", true);	//�Α��������f�����������t���O
				SetEventFlg_("BFG_MOVE_DIR_STATUE", true);				//���v����I�������t���O
				SetEventFlg_("BFG_DISPLAYED_DEMO_MOVE_STATUE", true);	//�f������������̃t���O
				
				//��]�l���v�Z����֐�(���ʂ̏o�͂�"function FadeIn()"���ōs����)
				uStoneRotateRight(g_stone_02);	//�Α�2���E��90�x��]������
				uStoneRotateRight(g_stone_03);	//�Α�3���E��90�x��]������
				uStoneRotateRight(g_stone_04);	//�Α�4���E��90�x��]������
				
				// �f���̕��A�ʒu���f���̊�����ɐݒ肵�܂�
				//SetReturnDemoPosDir_(Vec3(261.301, 75.308, -113.488), -28);
				ChangeDemo_(215);//215[�Α���] �E��]
			}
			//�Α��������f������x�ł������ꍇ
			if(statue_demo == true){
				
				//��]�l���v�Z����֐�
				uStoneRotateRight(g_stone_02);	//�Α�2���E��90�x��]������
				uStoneRotateRight(g_stone_03);	//�Α�3���E��90�x��]������
				uStoneRotateRight(g_stone_04);	//�Α�4���E��90�x��]������
				
				//--------------------------------
				//�^�X�N�ɂĐΑ��𓯎��ɉ�]������
				//--------------------------------
				//���ׂ��Α��̉�]����
				PlaySE_("SE_FLD_100");
				task4 = Task_RotateToDirSetMotion_(g_stone_04, g_dir04, 2.0, "WAIT", "WAIT");
				WaitTask(task4);
				
				//�i�r�}�b�v�A�C�R���̌�����ς���
				SetNaviMapIconDir_(g_map_navi04, g_dir04);
				
				//�G�t�F�N�g�T�C�Y��W���T�C�Y�ɂ��Ă��甭��
				PlaySE_("SE_DEM_103");
				SetEffectScale_(efc_4to2, EFC_SIZE_MAX);
				SetEffectScale_(efc_4to3, EFC_SIZE_MAX);
				efc_task4to2 = Task_AnimeMoveNoFit_(base4to2, "beem4_to_2");
				efc_task4to3 = Task_AnimeMoveNoFit_(base4to3, "beem4_to_3");
				WaitTask(efc_task4to2);
				
				//�G�t�F�N�g�T�C�Y��"0"�ɂ��Č����Ȃ��悤�ɂ���
				for(alpha_def = 1.0; alpha_def >= EFC_SIZE_MIN; alpha_def = alpha_def - GRADUALLY_SMALL){
					SetEffectScale_(efc_4to2, alpha_def);
					SetEffectScale_(efc_4to3, alpha_def);
					Wait_(1);
				}
				
				//�G�t�F�N�g�̃��l��0�ɂ���
				SetEffectScale_(efc_4to2, EFC_SIZE_MIN);
				SetEffectScale_(efc_4to3, EFC_SIZE_MIN);
				
				//�r�[���̈ʒu�����ɖ߂�
				SetPointPos_(base4to2, "obj004");
				SetPointPos_(base4to3, "obj004");
				
				//�r�[�������������Α��̉�]����
				PlaySE_("SE_FLD_100");
				task2 = Task_RotateToDirSetMotion_(g_stone_02, g_dir02, 2.0, "WAIT", "WAIT");
				task3 = Task_RotateToDirSetMotion_(g_stone_03, g_dir03, 2.0, "WAIT", "WAIT");
				WaitTask(task2);
				
				//�i�r�}�b�v�A�C�R���̌�����ς���
				SetNaviMapIconDir_(g_map_navi02, g_dir02);
				SetNaviMapIconDir_(g_map_navi03, g_dir03);
				
				//�V�X�e�����b�Z�[�W
				OpenMsgWnd_();
				ShowMsg_("GRAVE_FAKE_SYS_04");
				KeyInputWait_();
				CloseMsgWnd_();
			}
			break;
		// �����v���
		case QUERY3_1:
			//�Α��M�~�b�N�̎菇���J�E���g����
			count_num = count_num + 1;
			SetNumFlg_("NUM_FLG_PRAYROOM_COUNT", count_num);
			
			//�Α��������f������x�����Ă��Ȃ��ꍇ
			if(statue_demo == false){
				SetEventFlg_("BFG_MOVE_STATUE_FIRST_TIME_DEMO", true);	//�Α��������f�����������t���O
				SetEventFlg_("BFG_MOVE_DIR_STATUE", false);				//�����v����I�������t���O
				SetEventFlg_("BFG_DISPLAYED_DEMO_MOVE_STATUE", true);	//�f������������̃t���O
				
				//��]�l���v�Z����֐�(���ʂ̏o�͂�"function FadeIn()"���ōs����)
				uStoneRotateLeft(g_stone_02);	//�Α�2������90�x��]������
				uStoneRotateLeft(g_stone_03);	//�Α�3������90�x��]������
				uStoneRotateLeft(g_stone_04);	//�Α�4������90�x��]������
				
				// �f���̕��A�ʒu���f���̊�����ɐݒ肵�܂�
				//SetReturnDemoPosDir_(Vec3(261.301, 75.308, -113.488), -28);
				ChangeDemo_(215);//215[�Α���] �E��]
			}
			//�Α��������f������x�ł������ꍇ
			if(statue_demo == true){
				CloseMsgWnd_();
				//��]�l���v�Z����֐�
				uStoneRotateLeft(g_stone_02);	//�Α�2������90�x��]������
				uStoneRotateLeft(g_stone_03);	//�Α�3������90�x��]������
				uStoneRotateLeft(g_stone_04);	//�Α�4������90�x��]������
				
				//--------------------------------
				//�^�X�N�ɂĐΑ��𓯎��ɉ�]������
				//--------------------------------
				//���ׂ��Α��̉�]����
				PlaySE_("SE_FLD_100");
				task4 = Task_RotateToDirSetMotion_(g_stone_04, g_dir04, 2.0, "WAIT", "WAIT");
				WaitTask(task4);
				
				//�i�r�}�b�v�A�C�R���̌�����ς���
				SetNaviMapIconDir_(g_map_navi04, g_dir04);
				
				//�G�t�F�N�g�T�C�Y��W���T�C�Y�ɂ��Ă��甭��
				PlaySE_("SE_DEM_103");
				SetEffectScale_(efc_4to2, EFC_SIZE_MAX);
				SetEffectScale_(efc_4to3, EFC_SIZE_MAX);
				efc_task4to2 = Task_AnimeMoveNoFit_(base4to2, "beem4_to_2");
				efc_task4to3 = Task_AnimeMoveNoFit_(base4to3, "beem4_to_3");
				WaitTask(efc_task4to2);
				
				//�G�t�F�N�g�T�C�Y��"0"�ɂ��Č����Ȃ��悤�ɂ���
				for(alpha_def = EFC_SIZE_MAX; alpha_def >= EFC_SIZE_MIN; alpha_def = alpha_def - GRADUALLY_SMALL){
					SetEffectScale_(efc_4to2, alpha_def);
					SetEffectScale_(efc_4to3, alpha_def);
					Wait_(1);
				}
				
				//�G�t�F�N�g�̃��l��0�ɂ���
				SetEffectScale_(efc_4to2, EFC_SIZE_MIN);
				SetEffectScale_(efc_4to3, EFC_SIZE_MIN);
				
				//�r�[���̈ʒu�����ɖ߂�
				SetPointPos_(base4to2, "obj004");
				SetPointPos_(base4to3, "obj004");
				
				//�r�[�������������Α��̉�]����
				PlaySE_("SE_FLD_100");
				task2 = Task_RotateToDirSetMotion_(g_stone_02, g_dir02, 2.0, "WAIT", "WAIT");
				task3 = Task_RotateToDirSetMotion_(g_stone_03, g_dir03, 2.0, "WAIT", "WAIT");
				WaitTask(task2);
				
				//�i�r�}�b�v�A�C�R���̌�����ς���
				SetNaviMapIconDir_(g_map_navi02, g_dir02);
				SetNaviMapIconDir_(g_map_navi03, g_dir03);
				
				//�V�X�e�����b�Z�[�W
				OpenMsgWnd_();
				ShowMsg_("GRAVE_FAKE_SYS_04");
				KeyInputWait_();
				CloseMsgWnd_();
			}
			break;
		// ��߂�
		case QUERY3_2:
			//���b�Z�[�W�E�C���h�E�����(��)
			CloseMsgWnd_();
			break;
		}
	}else{
		//�M�~�b�N�U��������̃��b�Z�[�W
		OpenMsgWnd_();
		ShowMsg_("GRAVE_FAKE_SYS_05");
		KeyInputWait_();
		CloseMsgWnd_();
	}
	
	// �菇�̉񐔂������郁�b�Z�[�W��\��
	if(statue_demo == true){					// �Α��������f����������
		if( count_num == 1 ){					// �菇�̉񐔂����ƈ��̏ꍇ
			OpenMsgWnd_();
			ShowMsg_("SYS_HELP_MES_010");		// �Α��𓮂�����@�c��񐔂́@���ƂP�񂾁c�c�B
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		�Α���p�̃t���O���擾����
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uGetSekizouFlag()
{
	g_num_stone1 <- GetNumFlg_("NUM_FLG_PRAYROOM_STONE_STATUE_01");
	g_num_stone2 <- GetNumFlg_("NUM_FLG_PRAYROOM_STONE_STATUE_02");
	g_num_stone3 <- GetNumFlg_("NUM_FLG_PRAYROOM_STONE_STATUE_03");
	g_num_stone4 <- GetNumFlg_("NUM_FLG_PRAYROOM_STONE_STATUE_04");
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		�Α���p�̃t���O���Z�b�g����
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uSetSekizouFlag()
{
	SetNumFlg_("NUM_FLG_PRAYROOM_STONE_STATUE_01", g_num_stone1);
	SetNumFlg_("NUM_FLG_PRAYROOM_STONE_STATUE_02", g_num_stone2);
	SetNumFlg_("NUM_FLG_PRAYROOM_STONE_STATUE_03", g_num_stone3);
	SetNumFlg_("NUM_FLG_PRAYROOM_STONE_STATUE_04", g_num_stone4);
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		�Α��̉�]�l(num)��ς��鏈��
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uResetNumStone(num1, num2, num3, num4)
{
	g_num_stone1 <- num1;
	g_num_stone2 <- num2;
	g_num_stone3 <- num3;
	g_num_stone4 <- num4;
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		�Α��̉�]�l(dir)��ς��鏈��
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uResetDirStone(dir1, dir2, dir3, dir4)
{
	g_dir01 <- dir1;
	g_dir02 <- dir2;
	g_dir03 <- dir3;
	g_dir04 <- dir4;
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		�Α��ƃi�r�}�b�v�A�C�R���̌�����ς��鏈��
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uSetDirStoneAndNavi()
{
	// �Α��̌���������̒l�̕����Ɍ�������
	SetDir_( g_stone_01, g_dir01 );
	SetDir_( g_stone_02, g_dir02 );
	SetDir_( g_stone_03, g_dir03 );
	SetDir_( g_stone_04, g_dir04 );
	// �i�r�}�b�v�A�C�R���̌���������̒l�̕����Ɍ�������
	SetNaviMapIconDir_(g_map_navi01, g_dir01);
	SetNaviMapIconDir_(g_map_navi02, g_dir02);
	SetNaviMapIconDir_(g_map_navi03, g_dir03);
	SetNaviMapIconDir_(g_map_navi04, g_dir04);
}


//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//		�Α����E��90�x��]������v�Z���s��
//
//----------------------------------------------------------------------------
//	����	: id	�M�~�b�NID
//
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function uStoneRotateRight(id)
{
	// ���݂̊p�x����-90�x��]�����A������NUM�t���O�̒l���ϓ�������
	//�Α�1(����)�̏ꍇ
	if( id == g_stone_01 ){
		//NUM�t���O�̌v�Z������
		if( g_num_stone1 == 0 ){ g_num_stone1 <- 4; }	//NUM�t���O�̒l���}�C�i�X�ɂȂ�Ȃ��l�ɂ���
		g_num_stone1 = g_num_stone1 - 1;				//NUM�t���O�̒l��"-1"����
		SetNumFlg_("NUM_FLG_PRAYROOM_STONE_STATUE_01", g_num_stone1);	//"-1"���ꂽ�l���Z�b�g
		
		//�Α��̉�]�l���v�Z����
		if( g_dir01 == 0 ){ g_dir01 <- 360; }			//��]�l���}�C�i�X�ɂȂ�Ȃ��l�ɂ���
		g_dir01 = g_dir01 - 90;							//�ϐ��̒l��"-90"����
	}
	//�Α�2(�E��)�̏ꍇ
	if( id == g_stone_02 ){
		if( g_num_stone2 == 0 ){ g_num_stone2 <- 4; }
		g_num_stone2 = g_num_stone2 - 1;
		SetNumFlg_("NUM_FLG_PRAYROOM_STONE_STATUE_02", g_num_stone2);
		
		if( g_dir02 == 0 ){ g_dir02 <- 360; }
		g_dir02 = g_dir02 - 90;
	}
	//�Α�3(����)�̏ꍇ
	if( id == g_stone_03 ){
		if( g_num_stone3 == 0 ){ g_num_stone3 <- 4; }
		g_num_stone3 = g_num_stone3 - 1;
		SetNumFlg_("NUM_FLG_PRAYROOM_STONE_STATUE_03", g_num_stone3);
		
		if( g_dir03 == 0 ){ g_dir03 <- 360; }
		g_dir03 = g_dir03 - 90;
	}
	//�Α�4(�E��)�̏ꍇ
	if( id == g_stone_04 ){
		if( g_num_stone4 == 0 ){ g_num_stone4 <- 4; }
		g_num_stone4 = g_num_stone4 - 1;
		SetNumFlg_("NUM_FLG_PRAYROOM_STONE_STATUE_04", g_num_stone4);
		
		if( g_dir04 == 0 ){ g_dir04 <- 360; }
		g_dir04 = g_dir04 - 90;
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//		�Α�������90�x��]������v�Z���s��
//
//----------------------------------------------------------------------------
//	����	: id	�M�~�b�NID
//
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function uStoneRotateLeft(id)
{
	// ���݂̊p�x����+90�x��]�����A������NUM�t���O�̒l���ϓ�������
	//�Α�1(����)�̏ꍇ
	if( id == g_stone_01 ){
		//NUM�t���O�̌v�Z������
		g_num_stone1 = g_num_stone1 + 1;				//NUM�t���O�̒l��"+1"����
		if( g_num_stone1 == 4 ){ g_num_stone1 <- 0; }	//NUM�t���O�̒l��"4"���傫���Ȃ�Ȃ��l�ɂ���
		SetNumFlg_("NUM_FLG_PRAYROOM_STONE_STATUE_01", g_num_stone1);//"+1"���ꂽ�l���Z�b�g
		
		//�Α��̉�]�l���v�Z����
		g_dir01 = g_dir01 + 90;							//�ϐ��̒l��"+90"����
		if( g_dir01 == 360 ){	g_dir01 <- 0;	}		//��]�l��"360"���傫���Ȃ�Ȃ��l�ɂ���
	}
	//�Α�2(�E��)�̏ꍇ
	if( id == g_stone_02 ){
		g_num_stone2 = g_num_stone2 + 1;
		if( g_num_stone2 == 4 ){ g_num_stone2 <- 0; }
		SetNumFlg_("NUM_FLG_PRAYROOM_STONE_STATUE_02", g_num_stone2);
		
		g_dir02 = g_dir02 + 90;
		if( g_dir02 == 360 ){	g_dir02 <- 0;	}
	}
	//�Α�3(����)�̏ꍇ
	if( id == g_stone_03 ){
		g_num_stone3 = g_num_stone3 + 1;
		if( g_num_stone3 == 4 ){ g_num_stone3 <- 0; }
		SetNumFlg_("NUM_FLG_PRAYROOM_STONE_STATUE_03", g_num_stone3);
		
		g_dir03 = g_dir03 + 90;
		if( g_dir03 == 360 ){	g_dir03 <- 0;	}
	}
	//�Α�4(�E��)�̏ꍇ
	if( id == g_stone_04 ){
		g_num_stone4 = g_num_stone4 + 1;
		if( g_num_stone4 == 4 ){ g_num_stone4 <- 0; }
		SetNumFlg_("NUM_FLG_PRAYROOM_STONE_STATUE_04", g_num_stone4);
		
		g_dir04 = g_dir04 + 90;
		if( g_dir04 == 360 ){	g_dir04 <- 0;	}
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//		�w�肵�����W�ɕ����Ȃ���U���������
//
//---------------------------------------------------------------------------
// �������F�w�肵�����W(Vec3)
// �߂�l  �F�Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function uPlayerTurnAroundPos(pos)
{
	local player    = GetPlayerId_();
	// �Ώە��̕����ɉ�](1F��11.4������])
	local rotateTask = Task_RotateToPosSetMotion_(player, Vec3(pos.x, pos.y, pos.z), ROTATE_EVENT_DEF MOT_WALK, MOT_WAIT);
	WaitTask(rotateTask);
	// �Ԃ���������
	Wait_(15);
}

