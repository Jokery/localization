//===================== G02_01�閧�n�� ====================

// �萔�̐錾
const EFC_SIZE_MIN		= 0.0;	// �G�t�F�N�g�T�C�Y�̍ŏ��l
const EFC_SIZE_MAX		= 0.5;	// �G�t�F�N�g�T�C�Y�̍ő�l
const GRADUALLY_SMALL	= 0.05;	// �G�t�F�N�g�T�C�Y��i�X����������l


//------------------------------------------------
//		�퓬�I����
//------------------------------------------------
function AfterBattle()
{
	//�t���O�̏�Ԃ��擾
	local main_num  = GetNumFlg_("NUM_SCENARIO_MAIN");
	local grave_num = GetNumFlg_("NUM_SCENARIO_SUB_GRAVE");
	
	// �Α��̃t���O���擾
	uGetSekizouFlag();
	
	// �Α��̃t���O���Z�b�g
	uSetSekizouFlag();// �퓬��͐Α��̌�����ێ����邽�߁A�擾�����l�����̂܂܃Z�b�g

	// �u���h���h�ɕ���������NUM�t���O��ύX���鏈���i�v���Ӂj
	// �C�x���g�u���b�N��EventStartOperate()�ł͔s�k�𔻒�ł��Ȃ��̂ł����Ŕs�k�̔���ƃt���O�ύX���s���B
	if(main_num == 3){
		if(grave_num == GetFlagID_("CONST_SS_CC_JDG_BATTLE_BUNDORUDO")		// Num4 = 8
		|| grave_num == GetFlagID_("CONST_SS_CC_JDG_REMATCH_BUNDORUDO")){	// Num4 = 11
			// �u���h���h�ɔs�k
			if(GetBattleEndType_() == END_TYPE_LOSE){
				SetNumFlg_("NUM_SCENARIO_SUB_GRAVE", GetFlagID_("CONST_SS_CC_BE_WIPED_OUT_BUNDORUDO"));// Num4 = 9
			}
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
	local main_num   = GetNumFlg_("NUM_SCENARIO_MAIN");
	local grave_num  = GetNumFlg_("NUM_SCENARIO_SUB_GRAVE");
	local ice_num    = GetNumFlg_("NUM_SCENARIO_SUB_ICE");
	local check_dead = GetEventFlg_("BFG_DEAD_RETURN");
	local route      = GetEnteredMapChangeNullName_();
	local seikai     = GetEventFlg_("BFG_MOVE_SUCCESS_SECOND");// �U�̂̐Α��M�~�b�N�𐳊m�Ȉʒu�ɍ��킹��ꂽ�t���O
	// �Α��̃t���O���擾
	uGetSekizouFlag();
	
	// �Α��̌����̏����ݒ�
	if( route == "w_G02_00ALru_000" ){
		// �菇�J�E���g��0�ɂ���
		SetNumFlg_("NUM_FLG_SECRETROOM_COUNT", 0);
		// �Α��M�~�b�N�����U���̏ꍇ
		if( seikai == false ){
			// �Α��̊p�x��NUM�t���O�ɒu��������
			uResetNumStone(2, 3, 1, 1, 0, 1);	// 0=0�x, 1=90�x, 2=180�x, 3=270, 4=360�x �Ƃ���
			// ��������l���Z�b�g
			uSetSekizouFlag();
		}
		// �Α��M�~�b�N���U���ς݂̏ꍇ
		if( seikai == true ){
			// �Α��̊p�x��NUM�t���O�ɒu��������
			uResetNumStone(1, 3, 1, 3, 1, 3);	// 0=0�x, 1=90�x, 2=180�x, 3=270, 4=360�x �Ƃ���
			// ��������l���Z�b�g
			uSetSekizouFlag();
		}
	}else{
		// �}�b�v�`�F���W�����Ȃ������ꍇ�͉�]�l��ێ�����̂Ŏ擾�����l�����̂܂܃Z�b�g
		uSetSekizouFlag();
	}
	
	// �Α��̃i�r�}�b�v�A�C�R���i�^�[�Q�b�g�j
	g_map_navi01 <- ArrangePointNaviMapIcon_(NAVIMAP_ICON.DIRECTION, "map_navi_01");  // ����
	g_map_navi02 <- ArrangePointNaviMapIcon_(NAVIMAP_ICON.DIRECTION, "map_navi_02");  // �E��
	g_map_navi03 <- ArrangePointNaviMapIcon_(NAVIMAP_ICON.DIRECTION, "map_navi_03");  // ����
	g_map_navi04 <- ArrangePointNaviMapIcon_(NAVIMAP_ICON.DIRECTION, "map_navi_04");  // �E��
	g_map_navi05 <- ArrangePointNaviMapIcon_(NAVIMAP_ICON.DIRECTION, "map_navi_05");  // ����
	g_map_navi06 <- ArrangePointNaviMapIcon_(NAVIMAP_ICON.DIRECTION, "map_navi_06");  // �E��
	SetNaviMapIconVisible_(g_map_navi01, true);
	SetNaviMapIconVisible_(g_map_navi02, true);
	SetNaviMapIconVisible_(g_map_navi03, true);
	SetNaviMapIconVisible_(g_map_navi04, true);
	SetNaviMapIconVisible_(g_map_navi04, true);
	SetNaviMapIconVisible_(g_map_navi05, true);
	SetNaviMapIconVisible_(g_map_navi06, true);
	
	
	// ���Ԃ̐ݒ�
	if(main_num == 3){
		if(grave_num <= GetFlagID_("CONST_SS_CC_GET_RACE_PROGRAM")){	// Num4 <= 17
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
	g_gost_e		 <- C_NONE_ID;
	g_gost_f		 <- C_NONE_ID;
	g_npc_chomach	 <- C_NONE_ID;
	
	// ���\�[�X�ǂݍ���
	local id_npc_gost	 = ReadNpc_("m100_01");	// �����X�^�[�̗H��
	local id_chomach	 = ReadNpc_("n006");	// �`���[�}�b�n

	// �������X�^�[�̗H��E
	g_gost_e = ArrangePointNpc_(id_npc_gost,  "npc_gost_e");
	SetScaleSilhouette(g_gost_e, SCALE.S, SILHOUETTE_WIDTH.S);
	SetReactorMsg_(g_gost_e, "GRAVE_NPC_GOST_REC");
	
	// �������X�^�[�̗H��F
	g_gost_f = ArrangePointNpc_(id_npc_gost,  "npc_gost_f");
	SetScaleSilhouette(g_gost_f, SCALE.S, SILHOUETTE_WIDTH.S);
	SetReactorMsg_(g_gost_f, "GRAVE_NPC_GOST_REC");
	
	// ���`���[�}�b�n
	if(main_num == GetFlagID_("CONST_SM_CEMETERY")){						// Num0 = 3
		// Demo213[�̐l����󂯌p�������̇A]�̍Đ���܂�
		if(grave_num <= GetFlagID_("CONST_SS_CC_GO_TO_THE_NEXT_TRANSFER")){	// Num4 = 16 �ȉ�
			g_npc_chomach  = ArrangePointNpc_(id_chomach,  "npc_chomach_01");
			SetTalkCameraType_(g_npc_chomach, TALK_CAMERA_UP);	// ��b���J�����̐ݒ�
			SetReactorMsg_(g_npc_chomach, "GRAVE_NPC_CHOMACH_REC");
			// �A�i���C�Y�̃^�[�Q�b�g����؂�ւ���(�}�X�^�[�E�m�`���[�����`���[�}�b�n)
			SetTargetNameKey_(g_npc_chomach, "NAME_TAG_CHOMACH");
		}
		// Demo220[���[�X�v���O��������]�̍Đ���
		if(grave_num >= GetFlagID_("CONST_SS_CC_GET_RACE_PROGRAM")){		// Num4 = 17 �ȏ�
			g_npc_chomach  = ArrangePointNpc_(id_chomach,  "npc_chomach_02");
			SetTalkCameraType_(g_npc_chomach, TALK_CAMERA_UP);	// ��b���J�����̐ݒ�
			SetReactorMsg_(g_npc_chomach, "GRAVE_NPC_CHOMACH_REC");
			// �A�i���C�Y�̃^�[�Q�b�g����؂�ւ���(�}�X�^�[�E�m�`���[�����`���[�}�b�n)
			SetTargetNameKey_(g_npc_chomach, "NAME_TAG_CHOMACH");
		}
	}
	
	// ���u���h���h
	LoadEffect_("ef730_01_oth_dark_aura01");		// �܂��܂������I�[��
	if(main_num == 3){
		if(grave_num == GetFlagID_("CONST_SS_CC_INTO_THE_SECRET_ROOM")){		// Num4 = 6
			local id_npc_bundorudo = ReadNpc_("m203_00");						// ���\�[�X�ǂݍ���
			local npc_bundorudo = ArrangePointNpc_(id_npc_bundorudo,  "npc_boss_01");
			local efc_bun = SetSelectBoneEffectSetOffset_("ef730_01_oth_dark_aura01", npc_bundorudo, ATTACH_EFFECT2, Vec3(0.0, -5.0, 0.0));		//���I�[��
			SetReactorMsg_(npc_bundorudo, "GRAVE_NPC_BUNDORUDO_REC");
			SetHideIfFar_(npc_bundorudo, false);
		}
		if(grave_num == GetFlagID_("CONST_SS_CC_BE_WIPED_OUT_BUNDORUDO")){		// Num4 = 9
			local id_npc_bundorudo = ReadNpc_("m203_00");						// ���\�[�X�ǂݍ���
			local npc_bundorudo = ArrangePointNpc_(id_npc_bundorudo,  "npc_boss_02");
			local efc_bun = SetSelectBoneEffectSetOffset_("ef730_01_oth_dark_aura01", npc_bundorudo, ATTACH_EFFECT2, Vec3(0.0, -5.0, 0.0));		//���I�[��
			SetReactorMsg_(npc_bundorudo, "GRAVE_NPC_BUNDORUDO_REC");
			SetHideIfFar_(npc_bundorudo, false);
		}
	}

	//-----------
	// ���n���z�u
	//-----------
	DebugPrint("�C�x���g�n���̓Ǎ�");

	// ID������
	g_mine_wall_paper		<- C_NONE_ID;
	g_mine_ruler			<- C_NONE_ID;
	g_mine_book_01			<- C_NONE_ID;
	g_mine_book_02			<- C_NONE_ID;
	g_mine_hint_01			<- C_NONE_ID;
	g_mine_hint_02			<- C_NONE_ID;
	g_mine_hint_03			<- C_NONE_ID;
	g_mine_hint_04			<- C_NONE_ID;
	g_mine_01 				<- C_NONE_ID;
	g_mine_02 				<- C_NONE_ID;
	g_mine_03 				<- C_NONE_ID;
	g_mine_04 				<- C_NONE_ID;
	g_mine_stone_01 		<- C_NONE_ID;
	g_mine_stone_02 		<- C_NONE_ID;
	g_mine_stone_03 		<- C_NONE_ID;
	g_mine_stone_04 		<- C_NONE_ID;
	g_mine_stone_05 		<- C_NONE_ID;
	g_mine_stone_06 		<- C_NONE_ID;
	g_mine_phantom_wall_01 	<- C_NONE_ID;
	g_mine_phantom_wall_02 	<- C_NONE_ID;

	// �����莆
	g_mine_wall_paper		 = SetPointCircleEventMine_("mine_wall_paper", true);
	
	// �����[���|�C���g
	g_mine_ruler			 = SetPointCircleEventMine_("mine_rulerpoint", true);

	// �����̕�
	g_mine_phantom_wall_01	 = SetPointBoxEventMineNoFallWait_("mine_phantom_wall_01");// ����
	g_mine_phantom_wall_02	 = SetPointBoxEventMineNoFallWait_("mine_phantom_wall_02");// �k��
	
	// �����W�X�^���X�̃A�W�g�ɂ���{�I
	g_mine_book_01			 = SetPointCircleEventMine_("mine_book_01", true);// �^�񒆗�
	g_mine_book_02			 = SetPointCircleEventMine_("mine_book_02", true);// ������O
	
	// ���{�I�̃q���g
	g_mine_hint_01			 = SetPointCircleEventMine_("mine_hint_01", true);// ����
	g_mine_hint_02			 = SetPointCircleEventMine_("mine_hint_02", true);// �E��
	g_mine_hint_03			 = SetPointCircleEventMine_("mine_hint_03", true);// �E��
	g_mine_hint_04			 = SetPointCircleEventMine_("mine_hint_04", true);// ����

	// ���Α�
	g_mine_stone_01			 = SetPointCircleEventMine_("mine_stone01", true);// ����
	g_mine_stone_02			 = SetPointCircleEventMine_("mine_stone02", true);// �E��
	g_mine_stone_03			 = SetPointCircleEventMine_("mine_stone03", true);// ����
	g_mine_stone_04			 = SetPointCircleEventMine_("mine_stone04", true);// �E��
	g_mine_stone_05			 = SetPointCircleEventMine_("mine_stone05", true);// ����
	g_mine_stone_06			 = SetPointCircleEventMine_("mine_stone06", true);// �E��
	
	if(main_num == 3){
		// �����A�N�^�[�̒n���i�f��210[���A�N�^�[�̈⌾]�Đ��j
		if(grave_num == GetFlagID_("CONST_SS_CC_FIND_OUT_SECRET_ROOM")){	// Num4 = 12
			g_mine_04 = SetPointCircleEventMine_("mine03", true);
		}
		// �����j�^�̒n��
		if(grave_num >= GetFlagID_("CONST_SS_CC_FIND_OUT_SECRET_ROOM")		// Num4 = 12
		&& grave_num <= GetFlagID_("CONST_SS_CC_TAKE_OVER_VOLITION_2")){	// Num4 = 15
			g_mine_03 = SetPointCircleEventMine_("mine02", true);
		}
		// ���u���h���h�Đ펞�̃f��
		if(grave_num == GetFlagID_("CONST_SS_CC_BE_WIPED_OUT_BUNDORUDO")){	// Num4 = 9
			g_mine_02 = SetPointBoxEventMine_("mine01", false);
		}
		// ���閧�����ɓ��������̃f��
		if(grave_num == GetFlagID_("CONST_SS_CC_INTO_THE_SECRET_ROOM")){	// Num4 = 6
			g_mine_01 = SetPointBoxEventMine_("mine01", false);
		}
	}
	
	//---------------
	// ���M�~�b�N�z�u
	//---------------
	
	//���Α��M�~�b�N�Ŏg�p����NUM�t���O�̃t���O�ԍ���
	//�@�Α��̊p�x�ɒu�������Ďg�p���A���A���^�C���ŐΑ��̊p�x�̒l���擾�o����悤�ɂ��Ă��܂��B
	///////////////////////////////////////////////////////
	//�y�p�x�z  �P�W�O�x      �yNUM�ԍ��z     �Q         //
	//            ��                          ��         //
	// �Q�V�O�x ��  �� �X�O�x            �R ��  �� �P    //
	//            ��                          ��         //
	//           �O�x(�R�U�O�x)               �O(�S)     //
	///////////////////////////////////////////////////////


	//------------------------------------------------
	//6�̂̐Α��M�~�b�N�̉�]�l��NUM�t���O�Ɋi�[����
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
	// �Α�5�̏ꍇ
	if(g_num_stone5 == 0){ g_dir05 <-   0; }
	if(g_num_stone5 == 1){ g_dir05 <-  90; }
	if(g_num_stone5 == 2){ g_dir05 <- 180; }
	if(g_num_stone5 == 3){ g_dir05 <- 270; }
	if(g_num_stone5 == 4){ g_dir05 <- 360; }
	// �Α�6�̏ꍇ
	if(g_num_stone6 == 0){ g_dir06 <-   0; }
	if(g_num_stone6 == 1){ g_dir06 <-  90; }
	if(g_num_stone6 == 2){ g_dir06 <- 180; }
	if(g_num_stone6 == 3){ g_dir06 <- 270; }
	if(g_num_stone6 == 4){ g_dir06 <- 360; }
	
	//---------------------------
	//	6�̂̐Α��̓ǂݍ��݂Ɛݒu
	//---------------------------
	// ID������
	g_stone_01			 <- C_NONE_ID;
	g_stone_02			 <- C_NONE_ID;
	g_stone_03			 <- C_NONE_ID;
	g_stone_04			 <- C_NONE_ID;
	g_stone_05			 <- C_NONE_ID;
	g_stone_06			 <- C_NONE_ID;
	g_gim_rulerpoint	 <- C_NONE_ID;
	
	// ���\�[�X�ǂݍ���
	local id_stone_panther	= ReadGimmick_("o_G02_22");// �w���R���h���̐Α��L���[�p���T�[�̐Α�
	local id_stone_fish 	= ReadGimmick_("o_G02_21");// �Ƃ��������̐Α�
	local id_stone_condor 	= ReadGimmick_("o_G02_20");// �L���[�p���T�[�̐Α�
	local id_rulerpoint		= ReadGimmick_("o_com_08");// ���[���|�C���g
	
	// 6�̂̐Α��̐ݒu
	g_stone_01 = ArrangePointGimmick_("o_G02_20", id_stone_panther, "g_stone01");// ����
	g_stone_02 = ArrangePointGimmick_("o_G02_20", id_stone_panther, "g_stone02");// �E��
	g_stone_03 = ArrangePointGimmick_("o_G02_21", id_stone_fish, "g_stone03");	 // ����
	g_stone_04 = ArrangePointGimmick_("o_G02_21", id_stone_fish, "g_stone04");	 // �E��
	g_stone_05 = ArrangePointGimmick_("o_G02_22", id_stone_condor, "g_stone05"); // ����
	g_stone_06 = ArrangePointGimmick_("o_G02_22", id_stone_condor, "g_stone06"); // �E��
	
	// �Α��ƃi�r�}�b�v�A�C�R���̌���������̒l�̕����Ɍ�������
	uSetDirStoneAndNavi();
	
	//	���̐ݒu
	if(main_num <= 3){
		if(grave_num <= GetFlagID_("CONST_SS_CC_SOLVE_THE_STONE_MYSTERY")){	// Num4 = 5
			// �����W�X�^���X�̔�
			local id_lock_door = ReadGimmick_("o_G02_02");
			local lock_door = ArrangePointGimmick_("o_G02_02", id_lock_door, "g_door");
		}
	}
	
	// �����A�N�^�[
	local id_reactor  = ReadGimmick_("o_dem_07");		// ���A�N�^�[
	local gmk_reactor = ArrangePointGimmick_("o_dem_07", id_reactor, "g_rec");
	SetScale_(gmk_reactor, 1.5);	// �����ɂ����̂ŁA1.5�{�ɂ���
	if(main_num == 3){
		if (grave_num == GetFlagID_("CONST_SS_CC_FIND_OUT_SECRET_ROOM")) {	// Num4 = 12
			SetMotion_(gmk_reactor, MOT_GIMMICK_2, BLEND_N);
		}
	}
	
	// �����[���|�C���g
	g_gim_rulerpoint = ArrangePointGimmick_("o_com_08", id_rulerpoint, "g_rulerpoint");
	SetMotion_(g_gim_rulerpoint, MOT_GIMMICK_0, 0);
	if(GetEventFlg_("BFG_RULER_ADD_010") == true){					// Bit_210 ���[���ǉ� �閧�n��
		SetMotion_(g_gim_rulerpoint, MOT_GIMMICK_2, 0);
	}
	
	// ���R���s���[�^�[�̖���
	if(main_num == GetFlagID_("CONST_SM_CEMETERY")){	// Num0 = 3
		if(grave_num == GetFlagID_("CONST_SS_CC_FIND_OUT_THE_SCREEN")){	// Num4 = 13
			local id_flash  = ReadGimmick_("o_G02_11");
			local gmk_flash = ArrangePointGimmick_("o_G02_11", id_flash, "g_flash");
			SetMotion_(gmk_flash, MOT_GIMMICK_0, BLEND_N);
		}
	}
	
	// ���f�B�X�v���C
	if(main_num == GetFlagID_("CONST_SM_CEMETERY")){	// Num0 = 3
		if(grave_num >= GetFlagID_("CONST_SS_CC_FIND_OUT_THE_SCREEN")){	// Num4 = 13 �ȏ�
			local id_display  = ReadGimmick_("o_G02_14");
			local gmk_display = ArrangePointGimmick_("o_G02_14", id_display, "g_display");
		}
	}
	// �X���V�i���I�ȍ~
	else if(main_num >= GetFlagID_("CONST_SM_ICE_FIELD")){	// Num0 = 4 �ȏ�
		local id_display  = ReadGimmick_("o_G02_14");
		local gmk_display = ArrangePointGimmick_("o_G02_14", id_display, "g_display");
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
	base3to5 <- ArrangePointGimmick_("o_effect_base", model_base, "obj003");//�Α�3���Α�5�֔�Ԍ�
	base4to2 <- ArrangePointGimmick_("o_effect_base", model_base, "obj004");//�Α�4���Α�2�֔�Ԍ�
	base4to3 <- ArrangePointGimmick_("o_effect_base", model_base, "obj004");//�Α�4���Α�3�֔�Ԍ�
	base4to6 <- ArrangePointGimmick_("o_effect_base", model_base, "obj004");//�Α�4���Α�6�֔�Ԍ�
	base5to3 <- ArrangePointGimmick_("o_effect_base", model_base, "obj005");//�Α�5���Α�3�֔�Ԍ�
	base5to6 <- ArrangePointGimmick_("o_effect_base", model_base, "obj005");//�Α�5���Α�6�֔�Ԍ�
	base6to4 <- ArrangePointGimmick_("o_effect_base", model_base, "obj006");//�Α�6���Α�4�֔�Ԍ�
	base6to5 <- ArrangePointGimmick_("o_effect_base", model_base, "obj006");//�Α�6���Α�5�֔�Ԍ�
	
	// ���G�t�F�N�g�̓ǂݍ���
	LoadEffect_("ef731_01_mag_light01");
	efc_1to2 <- SetSelectBoneEffect_("ef731_01_mag_light01", base1to2, ATTACH_GLOBAL);
	efc_1to3 <- SetSelectBoneEffect_("ef731_01_mag_light01", base1to3, ATTACH_GLOBAL);
	efc_2to1 <- SetSelectBoneEffect_("ef731_01_mag_light01", base2to1, ATTACH_GLOBAL);
	efc_2to4 <- SetSelectBoneEffect_("ef731_01_mag_light01", base2to4, ATTACH_GLOBAL);
	efc_3to1 <- SetSelectBoneEffect_("ef731_01_mag_light01", base3to1, ATTACH_GLOBAL);
	efc_3to4 <- SetSelectBoneEffect_("ef731_01_mag_light01", base3to4, ATTACH_GLOBAL);
	efc_3to5 <- SetSelectBoneEffect_("ef731_01_mag_light01", base3to5, ATTACH_GLOBAL);
	efc_4to2 <- SetSelectBoneEffect_("ef731_01_mag_light01", base4to2, ATTACH_GLOBAL);
	efc_4to3 <- SetSelectBoneEffect_("ef731_01_mag_light01", base4to3, ATTACH_GLOBAL);
	efc_4to6 <- SetSelectBoneEffect_("ef731_01_mag_light01", base4to6, ATTACH_GLOBAL);
	efc_5to3 <- SetSelectBoneEffect_("ef731_01_mag_light01", base5to3, ATTACH_GLOBAL);
	efc_5to6 <- SetSelectBoneEffect_("ef731_01_mag_light01", base5to6, ATTACH_GLOBAL);
	efc_6to4 <- SetSelectBoneEffect_("ef731_01_mag_light01", base6to4, ATTACH_GLOBAL);
	efc_6to5 <- SetSelectBoneEffect_("ef731_01_mag_light01", base6to5, ATTACH_GLOBAL);
	
	// ���G�t�F�N�g�̃T�C�Y�ݒ� (������Ԃ�"0"�ɂ��Č����Ȃ��悤�ɂ���)
	SetEffectScale_(efc_1to2, EFC_SIZE_MIN);
	SetEffectScale_(efc_1to3, EFC_SIZE_MIN);
	SetEffectScale_(efc_2to1, EFC_SIZE_MIN);
	SetEffectScale_(efc_2to4, EFC_SIZE_MIN);
	SetEffectScale_(efc_3to1, EFC_SIZE_MIN);
	SetEffectScale_(efc_3to4, EFC_SIZE_MIN);
	SetEffectScale_(efc_3to5, EFC_SIZE_MIN);
	SetEffectScale_(efc_4to2, EFC_SIZE_MIN);
	SetEffectScale_(efc_4to3, EFC_SIZE_MIN);
	SetEffectScale_(efc_4to6, EFC_SIZE_MIN);
	SetEffectScale_(efc_5to3, EFC_SIZE_MIN);
	SetEffectScale_(efc_5to6, EFC_SIZE_MIN);
	SetEffectScale_(efc_6to4, EFC_SIZE_MIN);
	SetEffectScale_(efc_6to5, EFC_SIZE_MIN);
	
	
	//-------------------------
	// �����A�N�^�[�|�C���g�z�u
	//-------------------------
	// ���d�|����
	if( seikai == false ){
		local reactorPoint01 = ArrangeMsgReactorPoint("recpointo_door", GetFlagID_("BFG_REACTER_POINT_092")// Bit_1591 �d�|����
			, SHORT_DIST, "REC_POINT_DOOR_01", "REC_POINT_DOOR_02");
	}
	
	// ���{�I�i����j
	local reactorPoint02 = ArrangeMsgReactorPoint("recpointo_book01", GetFlagID_("BFG_REACTER_POINT_089")// Bit_1588 �{�I
		, SHORT_DIST, "REC_POINT_BOOK_01", "REC_POINT_BOOK_02");
	
	// ���{�I�i�E��j
	local reactorPoint03 = ArrangeMsgReactorPoint("recpointo_book02", GetFlagID_("BFG_REACTER_POINT_089")// Bit_1588 �{�I
		, SHORT_DIST, "REC_POINT_BOOK_01", "REC_POINT_BOOK_02");
	
	// ���{�I�i�E���j
	local reactorPoint04 = ArrangeMsgReactorPoint("recpointo_book03", GetFlagID_("BFG_REACTER_POINT_089")// Bit_1588 �{�I
		, SHORT_DIST, "REC_POINT_BOOK_01", "REC_POINT_BOOK_02");
	
	// ���{�I�i�����j
	local reactorPoint05 = ArrangeMsgReactorPoint("recpointo_book04", GetFlagID_("BFG_REACTER_POINT_089")// Bit_1588 �{�I
		, SHORT_DIST, "REC_POINT_BOOK_01", "REC_POINT_BOOK_02");
	
	// ���ʐM���u
	local reactorPoint06 = ArrangeMsgReactorPoint("recpointo_monitor", GetFlagID_("BFG_REACTER_POINT_093")// Bit_1592 �ʐM���u
		, SHORT_DIST, "REC_POINT_MONITOR_01", "REC_POINT_MONITOR_02");
	
	// �����A�N�^�[�̎c�[
	local reactorPoint07 = ArrangeMsgReactorPoint("recpointo_reactor", GetFlagID_("BFG_REACTER_POINT_094")// Bit_1593 ���A�N�^�[�̎c�[
		, SHORT_DIST, "REC_POINT_REACTOR_01", "REC_POINT_REACTOR_02");
	
	// ���Α��i����j�i�w���R���h���j
	local reactorPoint08 = ArrangeMsgReactorPoint("recpointo_stone01", GetFlagID_("BFG_REACTER_POINT_091")// Bit_1590 �Α�
		, SHORT_DIST, "REC_POINT_STONE_01", "REC_POINT_HERUKONDORU");
	
	// ���Α��i�E��j�i�w���R���h���j
	local reactorPoint09 = ArrangeMsgReactorPoint("recpointo_stone02", GetFlagID_("BFG_REACTER_POINT_091")// Bit_1590 �Α�
		, SHORT_DIST, "REC_POINT_STONE_01", "REC_POINT_HERUKONDORU");
	
	// ���Α��i�����j�i�Ƃ��������j
	local reactorPoint10 = ArrangeMsgReactorPoint("recpointo_stone03", GetFlagID_("BFG_REACTER_POINT_091")// Bit_1590 �Α�
		, SHORT_DIST, "REC_POINT_STONE_01", "REC_POINT_TOTUGEKIUO");
	
	// ���Α��i�E���j�i�Ƃ��������j
	local reactorPoint11 = ArrangeMsgReactorPoint("recpointo_stone04", GetFlagID_("BFG_REACTER_POINT_091")// Bit_1590 �Α�
		, SHORT_DIST, "REC_POINT_STONE_01", "REC_POINT_TOTUGEKIUO");
	
	// ���Α��i�����j�i�L���[�p���T�[�j
	local reactorPoint12 = ArrangeMsgReactorPoint("recpointo_stone05", GetFlagID_("BFG_REACTER_POINT_091")// Bit_1590 �Α�
		, SHORT_DIST, "REC_POINT_STONE_01", "REC_POINT_KIRAPANSA");
	
	// ���Α��i�E���j�i�L���[�p���T�[�j
	local reactorPoint13 = ArrangeMsgReactorPoint("recpointo_stone06", GetFlagID_("BFG_REACTER_POINT_091")// Bit_1590 �Α�
		, SHORT_DIST, "REC_POINT_STONE_01", "REC_POINT_KIRAPANSA");
	
	// ���r�玆
	local reactorPoint14 = ArrangeMsgReactorPoint("recpointo_harigami", GetFlagID_("BFG_REACTER_POINT_090")// Bit_1589 �r�玆
		, SHORT_DIST, "REC_POINT_HARIGAMI_01", "REC_POINT_HARIGAMI_02");
	
	// �����[���|�C���g
	local reactorPoint_ruler = ArrangeMsgReactorPoint("recpointo_ruler", GetFlagID_("BFG_REACTER_POINT_010")// Bit_1520 ���A�N�^�[ ���[���|�C���g
		, SHORT_DIST, "REC_POINT_GRAVE_01", "REC_POINT_GRAVE_01_2");
	
	//-------------------------
	// ���i�r�}�b�v�A�C�R���z�u
	//-------------------------
	// ID������
	g_exclamation02	 <- C_NONE_ID;
	g_exclamation03	 <- C_NONE_ID;
	
	
	// �����[���|�C���g�A�C�R��
	if(GetEventFlg_("BFG_RULER_ADD_010") == true){									// Bit_210 ���[���ǉ� �閧�n��
		local ruler_icon = ArrangePointNaviMapIcon_(NAVIMAP_ICON.RULER_POINT , "g_rulerpoint");
		SetNaviMapIconVisible_(ruler_icon, true);
	}
	
	// ���u�I�v
	if(grave_num == GetFlagID_("CONST_SS_CC_FIND_OUT_SECRET_ROOM")){					// Num4 = 12
		g_exclamation03 = ArrangePointNaviMapIcon_(NAVIMAP_ICON.EXCLAMATION, "mine03");	// ���A�N�^�[
	}
	if(grave_num == GetFlagID_("CONST_SS_CC_FIND_OUT_THE_SCREEN")){						// Num4 = 12
		g_exclamation02 = ArrangePointNaviMapIcon_(NAVIMAP_ICON.EXCLAMATION, "mine02");	// ���j�^
	}
	
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

	if(main_num >= 3){
		// �����X�^�[�̗H��E�𔼓����ɂ���
		SetManualCalcAlpha_(g_gost_e, true);
		SetAlpha_(g_gost_e, 0.3);
		// �����X�^�[�̗H��F�𔼓����ɂ���
		SetManualCalcAlpha_(g_gost_f, true);
		SetAlpha_(g_gost_f, 0.3);
	}

	// �퓬�J�n
	if(main_num == 3){
		if(grave_num == GetFlagID_("CONST_SS_CC_PRE_REMATCH_BUNDORUDO")){	// Num4 = 10
			// �u���h���h�Đ풆�̃t���O
			SetNumFlg_("NUM_SCENARIO_SUB_GRAVE", GetFlagID_("CONST_SS_CC_JDG_REMATCH_BUNDORUDO"));	// Num4 = 11
			// �u���h���h�Đ�
			ChangeBattleParty_(15); // �u���h���h
		}
		if(grave_num == GetFlagID_("CONST_SS_CC_PRE_BATTLE_BUNDORUDO")){	// Num4 = 7
			// �u���h���h�풆�̃t���O
			SetNumFlg_("NUM_SCENARIO_SUB_GRAVE", GetFlagID_("CONST_SS_CC_JDG_BATTLE_BUNDORUDO"));	// Num4 = 8
			// �u���h���h��
			ChangeBattleParty_(15); // �u���h���h
		}
	}

	// �퓬����
	if(main_num == 3){
		//�u���h���h�Đ�
		if(grave_num == GetFlagID_("CONST_SS_CC_JDG_REMATCH_BUNDORUDO")){	// Num4 = 11
			if (GetBattleEndType_() == BATTLE_END_TYPE_WIN){
				// �u���h���h�ɏ���
				SetNumFlg_("NUM_SCENARIO_SUB_GRAVE", GetFlagID_("CONST_SS_CC_FIND_OUT_SECRET_ROOM"));// Num4 = 12
				// �f����ɐݒ肳����l���̈ʒu�ƌ���
				SetReturnDemoPosDir_(Vec3(-17.8, 0.0, -216.1), -85);
				// Demo209[�u���h���h�폟��]���Đ������
				StopBgm_(0);
				EventStartChangeDemo(209, FADE_COLOR_BLACK);//209[�u���h���h�폟��]
			}
			else{
				// ���s�k������AfterBattle()�ŋL�q
			}
		}
		//�u���h���h����
		if(grave_num == GetFlagID_("CONST_SS_CC_JDG_BATTLE_BUNDORUDO")){	// Num4 = 8
			if (GetBattleEndType_() == BATTLE_END_TYPE_WIN){
				// �u���h���h�ɏ���
				SetNumFlg_("NUM_SCENARIO_SUB_GRAVE", GetFlagID_("CONST_SS_CC_FIND_OUT_SECRET_ROOM"));// Num4 = 12
				// �f����ɐݒ肳����l���̈ʒu�ƌ���
				SetReturnDemoPosDir_(Vec3(-17.8, 0.0, -216.1), -85);
				// Demo209[�u���h���h�폟��]���Đ������
				StopBgm_(0);
				EventStartChangeDemo(209, FADE_COLOR_BLACK);//209[�u���h���h�폟��]
			}
			else{
				// ���s�k������AfterBattle()�ŋL�q
			}
		}
	}

	// �f���̍Đ�
	if(main_num == 3){
		//�f��220[���[�X�v���O��������]�Đ�
		if(grave_num == GetFlagID_("CONST_SS_CC_GO_TO_THE_NEXT_TRANSFER")){// Num4 = 16
			SetNumFlg_("NUM_SCENARIO_SUB_GRAVE", GetFlagID_("CONST_SS_CC_GET_RACE_PROGRAM"));// Num4 = 17
			// �f���̕��A�ʒu���f���̊�����ɐݒ肵�܂�
			SetReturnDemoPosDir_(Vec3(-107.3, 0.0, -201.836), 48);
			EventStartChangeDemo(220, FADE_COLOR_BLACK);//220[���[�X�v���O��������]
		}
		//�f��213[�̐l����󂯌p�������̇A]�Đ�
		if(grave_num == GetFlagID_("CONST_SS_CC_TAKE_OVER_VOLITION_2")){// Num4 = 15
			SetNumFlg_("NUM_SCENARIO_SUB_GRAVE", GetFlagID_("CONST_SS_CC_GO_TO_THE_NEXT_TRANSFER"));// Num4 = 16
			SetFade_(FADE_OUT, FADE_COLOR_WHITE, FADE_SHORT);
			SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
			WaitFade_();
			ChangeDemo_(213);//213[�̐l����󂯌p�������̇A]
		}
		//�f��212[�̐l����󂯌p�������� �ߋ��f��]�Đ�
		if(grave_num == GetFlagID_("CONST_SS_CC_TAKE_OVER_VOLITION_1")){// Num4 = 14
			SetNumFlg_("NUM_SCENARIO_SUB_GRAVE", GetFlagID_("CONST_SS_CC_TAKE_OVER_VOLITION_2"));// Num4 = 15
			SetFade_(FADE_OUT, FADE_COLOR_WHITE, FADE_SHORT);
			SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
			WaitFade_();
			ChangeDemo_(212);//212[�̐l����󂯌p�������� �ߋ��f��]
		}
		//�͂��߂Ĕ閧�n���ɓ��������̃f��
		if(grave_num == GetFlagID_("CONST_SS_CC_DESCEND_THE_STAIRS")){// Num4 = 4
			SetNumFlg_("NUM_SCENARIO_SUB_GRAVE", GetFlagID_("CONST_SS_CC_SOLVE_THE_STONE_MYSTERY"));// Num4 = 5
			EventStartChangeDemo(205, FADE_COLOR_BLACK);//205[6�̂̐Α�]
		}
	}
	
	local route = GetEnteredMapChangeNullName_();
	DebugPrint(" ���[�g�̒l�� "+ route +" �ł� ");
	
	EventEnd_();
}


//------------------------------------------------
//		�m�o�b�ڐG��
//------------------------------------------------
function TouchNpc()
{
// �t���O�̏�Ԃ��擾
	local main_num  = GetNumFlg_("NUM_SCENARIO_MAIN");
	local grave_num = GetNumFlg_("NUM_SCENARIO_SUB_GRAVE");

	// NPC�̎�ނ��擾
	local target = GetTargetId_();

	switch(target){
	case g_gost_e :		//�����X�^�[�̗H��E
		uTalkGostE();
		break;
	case g_gost_f :		//�����X�^�[�̗H��F
		uTalkGostF();
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
	//�t���O�̏�Ԃ��擾
	local main_num  = GetNumFlg_("NUM_SCENARIO_MAIN");
	local grave_num = GetNumFlg_("NUM_SCENARIO_SUB_GRAVE");
	local count_num = GetNumFlg_("NUM_FLG_SECRETROOM_COUNT");	// �Α��̎菇���Z�b�g�p
	local seikai    = GetEventFlg_("BFG_MOVE_SUCCESS_SECOND");	// �U�̂̐Α��M�~�b�N�𐳊m�Ȉʒu�ɍ��킹��ꂽ�t���O
	
	//�Α��̉�]�^�X�N�Ɏg�p
	local task1, task2, task3, task4, task5, task6;
	//�G�t�F�N�g�Ɏg�p
	local efc_task1to2, efc_task1to3, efc_task2to1, efc_task2to4;
	local efc_task3to1, efc_task3to4, efc_task3to5, efc_task4to2, efc_task4to3, efc_task4to6;
	local efc_task5to3, efc_task5to6, efc_task6to4, efc_task6to5;
	local alpha_def;
	
	switch ( target ) {
	case g_mine_01:			//�閧�����ɓ��������̃f��
		uMinePlayDemo01();
		break;
	case g_mine_02:			//�u���h���h�Đ펞�̃f��
		uMinePlayDemo02();
		break;
	case g_mine_03:			//���j�^�̒n��
		uMinePlayDemo03();
		break;
	case g_mine_04:			//���A�N�^�[�̒n���i�f��210[���A�N�^�[�̈⌾]�Đ��j
		uMinePlayDemo04();
		break;
	case g_mine_wall_paper:	//���莆
		uMineWallPaper();
		break;
	case g_mine_ruler:		//���[���|�C���g
		uMineRulerPoint();
		break;
	case g_mine_book_01:	//���W�X�^���X�̃A�W�g�ɂ���{�I(�^�񒆗�)
		uMineResistanceBookShelf1();
		break;
	case g_mine_book_02:	//���W�X�^���X�̃A�W�g�ɂ���{�I(������O)
		uMineResistanceBookShelf2();
		break;
	case g_mine_hint_01:	//�{�I(����)
		uMineBookShelf1();
		break;
	case g_mine_hint_02:	//�{�I(�E��)
		uMineBookShelf2();
		break;
	case g_mine_hint_03:	//�{�I(�E��)
		uMineBookShelf3();
		break;
	case g_mine_hint_04:	//�{�I(����)
		uMineBookShelf4();
		break;
	case g_mine_stone_01:	//�Α�1(����)
		uMineRotateStone1();
		break;
	case g_mine_stone_02:	//�Α�2(�E��)
		uMineRotateStone2();
		break;
	case g_mine_stone_03:	//�Α�3(����)
		uMineRotateStone3();
		break;
	case g_mine_stone_04:	//�Α�4(�E��)
		uMineRotateStone4();
		break;
	case g_mine_stone_05:	//�Α�5(����)
		uMineRotateStone5();
		break;
	case g_mine_stone_06:	//�Α�6(�E��)
		uMineRotateStone6();
		break;
	default:
		DebugPrint("�ݒu����Ă��Ȃ��n���ɐڐG���肵�Ă��܂��I");
		break;
	}
	
	
	DebugPrint("�Α�1��NUM�t���O�� " + g_num_stone1 + " �ɂȂ�܂����B");
	DebugPrint("�Α�2��NUM�t���O�� " + g_num_stone2 + " �ɂȂ�܂����B");
	DebugPrint("�Α�3��NUM�t���O�� " + g_num_stone3 + " �ɂȂ�܂����B");
	DebugPrint("�Α�4��NUM�t���O�� " + g_num_stone4 + " �ɂȂ�܂����B");
	DebugPrint("�Α�5��NUM�t���O�� " + g_num_stone5 + " �ɂȂ�܂����B");
	DebugPrint("�Α�6��NUM�t���O�� " + g_num_stone6 + " �ɂȂ�܂����B");
	DebugPrint("�Α�1�� " + g_dir01 + " �x�ɂȂ�܂����B");
	DebugPrint("�Α�2�� " + g_dir02 + " �x�ɂȂ�܂����B");
	DebugPrint("�Α�3�� " + g_dir03 + " �x�ɂȂ�܂����B");
	DebugPrint("�Α�4�� " + g_dir04 + " �x�ɂȂ�܂����B");
	DebugPrint("�Α�5�� " + g_dir05 + " �x�ɂȂ�܂����B");
	DebugPrint("�Α�6�� " + g_dir06 + " �x�ɂȂ�܂����B");
	
	
	// �菇�̉񐔂��擾
	count_num = GetNumFlg_("NUM_FLG_SECRETROOM_COUNT");
	
	//�菇�ʂ�ɐ����ɂȂ����ꍇ
	if( count_num == 3 ){
		//�Α��̌����������̌����ɂȂ�����
		if( g_num_stone1 == 1 && g_num_stone2 == 3 && 
			g_num_stone3 == 1 && g_num_stone4 == 3 &&
			g_num_stone5 == 1 && g_num_stone4 == 3 ){
			if( seikai == false ){
				// �n��������
				DeleteEventMine_(g_mine_stone_01);
				DeleteEventMine_(g_mine_stone_02);
				DeleteEventMine_(g_mine_stone_03);
				DeleteEventMine_(g_mine_stone_04);
				DeleteEventMine_(g_mine_stone_05);
				DeleteEventMine_(g_mine_stone_06);
				
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
				SetNumFlg_("NUM_SCENARIO_SUB_GRAVE", GetFlagID_("CONST_SS_CC_INTO_THE_SECRET_ROOM"));// Num4 = 6
				SetEventFlg_("BFG_MOVE_SUCCESS_SECOND", true);// �U�̂̐Α��M�~�b�N�𐳊m�Ȉʒu�ɍ��킹��ꂽ�t���O
				
				ChangeDemo_(206);
			}
		}
		// �菇�I�[�o�[�����ꍇ
		else{
			// �菇�J�E���g��0�ɖ߂�
			SetNumFlg_("NUM_FLG_SECRETROOM_COUNT", 0);
			
			// �t�F�[�h�A�E�g
			SetFadePlane_(FADE_PLANE.PLANE_3D);
			SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
			SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
			WaitFade_();
			
			//�Α��̔z�u������������
			uResetNumStone(2, 3, 1, 1, 0, 1);		//�����l���O���[�o���ϐ��ɑ��
			uSetSekizouFlag();						//��������l���Z�b�g
			uResetDirStone(180, 270, 90, 90, 0, 90)	//�Α��̌���������������
			uSetDirStoneAndNavi();					//�Α��ƃi�r�}�b�v�A�C�R���̌���������̒l�̕����Ɍ�������
			
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
	
	// ���̕ǂɐG�ꂽ��B���������i�r�}�b�v�ɕ\��������
	if(target == g_mine_phantom_wall_01){
		DeleteEventMine_(g_mine_phantom_wall_01);
		SetEventFlg_("BFG_OPEN_SECRET_AREA_G02_01_1", true);// �����̉B�������I�[�v���t���O
	}
	if(target == g_mine_phantom_wall_02){
		DeleteEventMine_(g_mine_phantom_wall_02);
		SetEventFlg_("BFG_OPEN_SECRET_AREA_G02_01_2", true);// �k���̉B�������I�[�v���t���O
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
//		�����X�^�[�̗H��E�̉�b����
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkGostE()
{
	// �t���O�̏�Ԃ��擾
	local main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");				//Num0
	local grave_num	 = GetNumFlg_("NUM_SCENARIO_SUB_GRAVE");		//Num4
	local sky_num	 = GetNumFlg_("NUM_SCENARIO_SUB_SKY");			//Num9
	
	// �쓹�V�i���I�J�n�`�u���h���h���j�܂�
	if(main_num == GetFlagID_("CONST_SM_CEMETERY")){						// Num0 = 3
		if(grave_num <= GetFlagID_("CONST_SS_CC_FIND_OUT_THE_SCREEN")){		// Num4 = 13 �ȉ�
			uMessage("NPC_GOST_E_010");			//�u�u���h���h�́@�����т傤�҂��B
		// �u���h���h���j��
		}else if(grave_num <= GetFlagID_("CONST_SS_CC_CLEAR_CEMETERY")){	// Num4 = 18 �ȉ�
			uMessage("NPC_GOST_E_020");			//�u�����т傤�҂́@�u���h���h�߁I
		}
	}
	// �쓹�V�i���I�N���A��`�K���r���X���j�O�܂�
	else if(main_num <= GetFlagID_("CONST_SM_CORE")){						// Num0 = 7 �ȉ�
		uMessage("NPC_GOST_E_020");				//�u�����т傤�҂́@�u���h���h�߁I
	}
	// �K���r���X���j��`����u���h���h���j�O�܂�
	else if(main_num == GetFlagID_("CONST_SM_SKY")){						// Num0 = 8
		if(sky_num <= GetFlagID_("CONST_SS_SK_JDG_REMATCH_G_BUNDORUDO")){	// Num9 = 23 �ȉ�
			uMessage("NPC_GOST_E_030");			//�u�O�́@���������ƂɁ@�Ȃ��Ă�݂������ȁB
		}
		// ����u���h���h���j��`�\�V�i���I�N���A�܂�
		else if(sky_num <= GetFlagID_("CONST_SS_SK_DATA_SAVED")){			// Num9 = 58 �ȉ�
			uMessage("NPC_GOST_E_040");			//�u�H�쒇�Ԃ������畷������B
		}
	}
	// �\�V�i���I�N���A��
	else if(main_num >= GetFlagID_("CONST_SM_INSIDE_CLEAR")){				// Num0 = 9 �ȏ�
		uMessage("NPC_GOST_E_050");				//�u�悤�I�@�����́@���̗p��
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		�����X�^�[�̗H��F�̉�b����
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkGostF()
{
	//�����X�^�[�̗H��F��MSG�Œ�
	OpenMsgWnd_();
	ShowMsg_("NPC_GOST_F_010");					//�u���̃A���f�b�h�K�[�f���́@��������
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
	// �t���O�̏�Ԃ��擾
	local main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");				//Num0
	local grave_num	 = GetNumFlg_("NUM_SCENARIO_SUB_GRAVE");		//Num4
	
	if(main_num == GetFlagID_("CONST_SM_CEMETERY")){						// Num0 = 3
		// Demo213[�̐l����󂯌p�������̇A]�̍Đ���܂�
		if(grave_num <= GetFlagID_("CONST_SS_CC_GO_TO_THE_NEXT_TRANSFER")){	// Num4 = 16 �ȉ�
			// �`���[�}�b�n�̃��b�Z�[�W
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_CHOMACH");
			ShowMsg_("NPC_CHOMACH_010");				//�u�܂��@�����@�����Ă邠�������I
			KeyInputWait_();
			CloseMsgWnd_();
		}
		// Demo220[���[�X�v���O��������]�̍Đ���
		if(grave_num >= GetFlagID_("CONST_SS_CC_GET_RACE_PROGRAM")){		// Num4 = 17 �ȏ�
			// �`���[�}�b�n�̃��b�Z�[�W
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_CHOMACH");
			ShowMsg_("NPC_CHOMACH_020");				//�u�����Ɂ@�����s�s�֍s�����Ɓ@�v��������
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		�閧�����ɓ��������̏���
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMinePlayDemo01()
{
	local grave_num = GetNumFlg_("NUM_SCENARIO_SUB_GRAVE");
	
	if(grave_num == GetFlagID_("CONST_SS_CC_INTO_THE_SECRET_ROOM")){						// Num4 = 6
		DeleteEventMine_(g_mine_01);
		SetNumFlg_("NUM_SCENARIO_SUB_GRAVE",GetFlagID_("CONST_SS_CC_PRE_BATTLE_BUNDORUDO"));// Num4 = 7
		// �f���̕��A�ʒu���f���̊�����ɐݒ肵�܂�
		//SetReturnDemoPosDir_(Vec3(261.301, 75.308, -113.488), -28);
		//207[�u���h���h�o��]
		ChangeDemo_(207);
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		�u���h���h�Đ펞�̏���
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMinePlayDemo02()
{
	local grave_num = GetNumFlg_("NUM_SCENARIO_SUB_GRAVE");
	
	if(grave_num == GetFlagID_("CONST_SS_CC_BE_WIPED_OUT_BUNDORUDO")){						 // Num4 = 9
		DeleteEventMine_(g_mine_02);
		SetNumFlg_("NUM_SCENARIO_SUB_GRAVE",GetFlagID_("CONST_SS_CC_PRE_REMATCH_BUNDORUDO"));// Num4 = 10
		// �f���̕��A�ʒu���f���̊�����ɐݒ肵�܂�
		//SetReturnDemoPosDir_(Vec3(261.301, 75.308, -113.488), -28);
		//Demo208[�u���h���h�Đ�]
		ChangeDemo_(208);
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		���j�^�̒n���ɐG�ꂽ���̏���
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMinePlayDemo03()
{
	local grave_num = GetNumFlg_("NUM_SCENARIO_SUB_GRAVE");
	local player = GetPlayerId_();
	
	CommPlayerTurnAroundDir(180);
	
	//�f��211[�̐l����󂯌p�������̇@]�Đ��j
	if(grave_num == GetFlagID_("CONST_SS_CC_FIND_OUT_THE_SCREEN")){							// Num4 = 13
		DeleteEventMine_(g_mine_03);
		SetNaviMapIconVisible_(g_exclamation02, false);	// �u�I�v�A�C�R��������
		SetNumFlg_("NUM_SCENARIO_SUB_GRAVE",GetFlagID_("CONST_SS_CC_TAKE_OVER_VOLITION_1"));// Num4 = 14
		//Demo211[�̐l����󂯌p�������̇@]
		ChangeDemo_(211);
	}
	//�Z�L�����e�B�R�[�h��m��O�̃��j�^�i�V�X�e��MSG�\���j
	if(grave_num == GetFlagID_("CONST_SS_CC_FIND_OUT_SECRET_ROOM")){//�t���O�u12�v
		local pos  = Vec3(-6.5, 0.0, -299.2);
		//�V�X�e�����b�Z�[�W
		OpenMsgWnd_();
		ShowMsg_("DEMO_209_AFT_SYS_01");
		KeyInputWait_();
		CloseMsgWnd_();
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		���A�N�^�[�̒n���ɐG�ꂽ���̏���
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMinePlayDemo04()
{
	local grave_num = GetNumFlg_("NUM_SCENARIO_SUB_GRAVE");
	
	CommPlayerTurnAroundDir(-90);
	
	if(grave_num == GetFlagID_("CONST_SS_CC_FIND_OUT_SECRET_ROOM")){						// Num4 = 12
		DeleteEventMine_(g_mine_04);
		SetNaviMapIconVisible_(g_exclamation03, false);	// �u�I�v�A�C�R��������
		SetNumFlg_("NUM_SCENARIO_SUB_GRAVE",GetFlagID_("CONST_SS_CC_FIND_OUT_THE_SCREEN"));	// Num4 = 13
		// �f���̕��A�ʒu���f���̊�����ɐݒ肵�܂�
		SetReturnDemoPosDir_(Vec3(-114.487, 0.0, -187.9), -188);
		//Demo210[���A�N�^�[�̈⌾]
		ChangeDemo_(210);
	}
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
	
	local pos  = Vec3(50.0, 0.0, 320.0);
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
//		���[���|�C���g�𒲂ׂ����̏���
//
//----------------------------------------------------------------------------
//	����	: �Ȃ�
//
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function uMineRulerPoint()
{
	CommPlayerTurnAroundObj(g_gim_rulerpoint);
	CommRulerPointEvent(g_gim_rulerpoint, "BFG_RULER_ADD_010", "g_rulerpoint"); 
}


//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//		���W�X�^���X�̃A�W�g�ɂ���{�I(�^�񒆗�)�𒲂ׂ����̏���
//
//----------------------------------------------------------------------------
//	����	: �Ȃ�
//
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function uMineResistanceBookShelf1()
{
	local player = GetPlayerId_();
	
	local pos  = Vec3(81.8, 0.0, -230.9);
	uPlayerTurnAroundPos(pos);
	
	//�V�X�e�����b�Z�[�W
	OpenMsgWnd_();
	ShowMsg_("MINE_BOOK_SHELF_001");
	KeyInputWait_();
	CloseMsgWnd_();
}


//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//		���W�X�^���X�̃A�W�g�ɂ���{�I(������O)�𒲂ׂ����̏���
//
//----------------------------------------------------------------------------
//	����	: �Ȃ�
//
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function uMineResistanceBookShelf2()
{
	local player = GetPlayerId_();
	
	local pos  = Vec3(76.0, 0.0, -142.8);
	uPlayerTurnAroundPos(pos);
	
	//�V�X�e�����b�Z�[�W
	OpenMsgWnd_();
	ShowMsg_("MINE_BOOK_SHELF_002");
	KeyInputWait_();
	CloseMsgWnd_();
}


//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//		�{�I(����)�𒲂ׂ����̏���
//
//----------------------------------------------------------------------------
//	����	: �Ȃ�
//
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function uMineBookShelf1()
{
	local player = GetPlayerId_();
	
	SetEventFlg_("BFG_LIMIT_BOOKSHELF_G02_01", true); // Bit_1121 �{�I���ӂ̔z�u�����X�^�[������
	local pos  = Vec3(-90.1, -10.0, -79.1);
	uPlayerTurnAroundPos(pos);
	
	// �{�I�̃��b�Z�[�W���e���擾
	local msg = uReturnBookshelfMsg("NUM_FLG_EXAMINE_BOOKSHELF_A")
	
	//�V�X�e�����b�Z�[�W
	OpenMsgWnd_();
	ShowMsg_(msg);
	KeyInputWait_();
	CloseMsgWnd_();
}


//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//		�{�I(�E��)�𒲂ׂ����̏���
//
//----------------------------------------------------------------------------
//	����	: �Ȃ�
//
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function uMineBookShelf2()
{
	local player = GetPlayerId_();
	
	SetEventFlg_("BFG_LIMIT_BOOKSHELF_G02_01", true); // Bit_1121 �{�I���ӂ̔z�u�����X�^�[������
	local pos  = Vec3(82.0, -10.0, -79.3);
	uPlayerTurnAroundPos(pos);
	
	// �{�I�̃��b�Z�[�W���e���擾
	local msg = uReturnBookshelfMsg("NUM_FLG_EXAMINE_BOOKSHELF_B")
	
	//�V�X�e�����b�Z�[�W
	OpenMsgWnd_();
	ShowMsg_(msg);
	KeyInputWait_();
	CloseMsgWnd_();
}


//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//		�{�I(�E��)�𒲂ׂ����̏���
//
//----------------------------------------------------------------------------
//	����	: �Ȃ�
//
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function uMineBookShelf3()
{
	local player = GetPlayerId_();
	
	SetEventFlg_("BFG_LIMIT_BOOKSHELF_G02_01", true); // Bit_1121 �{�I���ӂ̔z�u�����X�^�[������
	local pos  = Vec3(65.9, -10.0, 92.0);
	uPlayerTurnAroundPos(pos);
	
	// �{�I�̃��b�Z�[�W���e���擾
	local msg = uReturnBookshelfMsg("NUM_FLG_EXAMINE_BOOKSHELF_C")
	
	//�V�X�e�����b�Z�[�W
	OpenMsgWnd_();
	ShowMsg_(msg);
	KeyInputWait_();
	CloseMsgWnd_();
}


//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//		�{�I(����)�𒲂ׂ����̏���
//
//----------------------------------------------------------------------------
//	����	: �Ȃ�
//
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function uMineBookShelf4()
{
	local player = GetPlayerId_();
	
	SetEventFlg_("BFG_LIMIT_BOOKSHELF_G02_01", true); // Bit_1121 �{�I���ӂ̔z�u�����X�^�[������
	local pos  = Vec3(-72.2, -10.0, 93.1);
	uPlayerTurnAroundPos(pos);
	
	// �{�I�̃��b�Z�[�W���e���擾
	local msg = uReturnBookshelfMsg("NUM_FLG_EXAMINE_BOOKSHELF_D")
	
	//�V�X�e�����b�Z�[�W
	OpenMsgWnd_();
	ShowMsg_(msg);
	KeyInputWait_();
	CloseMsgWnd_();
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
	local count_num = GetNumFlg_("NUM_FLG_SECRETROOM_COUNT");	// �Α��̎菇���Z�b�g�p
	local seikai    = GetEventFlg_("BFG_MOVE_SUCCESS_SECOND");	// �U�̂̐Α��M�~�b�N�𐳊m�Ȉʒu�ɍ��킹��ꂽ�t���O

	//�Α��̉�]�^�X�N�Ɏg�p
	local task1, task2, task3, task4, task5, task6;
	//�G�t�F�N�g�Ɏg�p
	local efc_task1to2, efc_task1to3, efc_task2to1, efc_task2to4;
	local efc_task3to1, efc_task3to4, efc_task3to5, efc_task4to2, efc_task4to3, efc_task4to6;
	local efc_task5to3, efc_task5to6, efc_task6to4, efc_task6to5;
	local alpha_def;
	
	CommPlayerTurnAroundObj(g_stone_01);
	if( seikai == false ){	//�M�~�b�N���U���̏ꍇ
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
			SetNumFlg_("NUM_FLG_SECRETROOM_COUNT", count_num);
			
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
			break;
		// �����v���
		case QUERY3_1:
			CloseMsgWnd_();
			
			//�Α��M�~�b�N�̎菇���J�E���g����
			count_num = count_num + 1;
			SetNumFlg_("NUM_FLG_SECRETROOM_COUNT", count_num);
			
			//��]�l���v�Z����֐�
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
			break;
		// ��߂�
		case QUERY3_2:
			// ���b�Z�[�W�E�C���h�E�����(��)
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
	if( count_num == 1 ){
		OpenMsgWnd_();
		ShowMsg_("SYS_HELP_MES_020");	// �Α��𓮂�����@�c��񐔂́@���ƂQ�񂾁c�c�B
		KeyInputWait_();
		CloseMsgWnd_();
	}
	if( count_num == 2 ){
		OpenMsgWnd_();
		ShowMsg_("SYS_HELP_MES_010");	// �Α��𓮂�����@�c��񐔂́@���ƂP�񂾁c�c�B
		KeyInputWait_();
		CloseMsgWnd_();
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
	local count_num = GetNumFlg_("NUM_FLG_SECRETROOM_COUNT");	// �Α��̎菇���Z�b�g�p
	local seikai    = GetEventFlg_("BFG_MOVE_SUCCESS_SECOND");	// �U�̂̐Α��M�~�b�N�𐳊m�Ȉʒu�ɍ��킹��ꂽ�t���O

	//�Α��̉�]�^�X�N�Ɏg�p
	local task1, task2, task3, task4, task5, task6;
	//�G�t�F�N�g�Ɏg�p
	local efc_task1to2, efc_task1to3, efc_task2to1, efc_task2to4;
	local efc_task3to1, efc_task3to4, efc_task3to5, efc_task4to2, efc_task4to3, efc_task4to6;
	local efc_task5to3, efc_task5to6, efc_task6to4, efc_task6to5;
	local alpha_def;
	
	CommPlayerTurnAroundObj(g_stone_02);
	if( seikai == false ){	//�M�~�b�N���U���̏ꍇ
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
			SetNumFlg_("NUM_FLG_SECRETROOM_COUNT", count_num);
			
			//��]�l���v�Z����֐�
			uStoneRotateRight(g_stone_02);	//�Α�2���E��90�x��]������
			uStoneRotateRight(g_stone_01);	//�Α�1���E��90�x��]������
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
			break;
		// �����v���
		case QUERY3_1:
			CloseMsgWnd_();
			
			//�Α��M�~�b�N�̎菇���J�E���g����
			count_num = count_num + 1;
			SetNumFlg_("NUM_FLG_SECRETROOM_COUNT", count_num);
			
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
			break;
		// ��߂�
		case QUERY3_2:
			// ���b�Z�[�W�E�C���h�E�����(��)
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
	if( count_num == 1 ){
		OpenMsgWnd_();
		ShowMsg_("SYS_HELP_MES_020");	// �Α��𓮂�����@�c��񐔂́@���ƂQ�񂾁c�c�B
		KeyInputWait_();
		CloseMsgWnd_();
	}
	if( count_num == 2 ){
		OpenMsgWnd_();
		ShowMsg_("SYS_HELP_MES_010");	// �Α��𓮂�����@�c��񐔂́@���ƂP�񂾁c�c�B
		KeyInputWait_();
		CloseMsgWnd_();
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
	local count_num = GetNumFlg_("NUM_FLG_SECRETROOM_COUNT");	// �Α��̎菇���Z�b�g�p
	local seikai    = GetEventFlg_("BFG_MOVE_SUCCESS_SECOND");	// �U�̂̐Α��M�~�b�N�𐳊m�Ȉʒu�ɍ��킹��ꂽ�t���O

	//�Α��̉�]�^�X�N�Ɏg�p
	local task1, task2, task3, task4, task5, task6;
	//�G�t�F�N�g�Ɏg�p
	local efc_task1to2, efc_task1to3, efc_task2to1, efc_task2to4;
	local efc_task3to1, efc_task3to4, efc_task3to5, efc_task4to2, efc_task4to3, efc_task4to6;
	local efc_task5to3, efc_task5to6, efc_task6to4, efc_task6to5;
	local alpha_def;
	
	CommPlayerTurnAroundObj(g_stone_03);
	if( seikai == false ){	//�M�~�b�N���U���̏ꍇ
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
			SetNumFlg_("NUM_FLG_SECRETROOM_COUNT", count_num);
			
			//��]�l���v�Z����֐�
			uStoneRotateRight(g_stone_03);	//�Α�3���E��90�x��]������
			uStoneRotateRight(g_stone_01);	//�Α�1���E��90�x��]������
			uStoneRotateRight(g_stone_04);	//�Α�4���E��90�x��]������
			uStoneRotateRight(g_stone_05);	//�Α�5���E��90�x��]������
			
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
			SetEffectScale_(efc_3to5, EFC_SIZE_MAX);
			efc_task3to1 = Task_AnimeMoveNoFit_(base3to1, "beem3_to_1");
			efc_task3to4 = Task_AnimeMoveNoFit_(base3to4, "beem3_to_4");
			efc_task3to5 = Task_AnimeMoveNoFit_(base3to5, "beem3_to_5");
			WaitTask(efc_task3to1);
			
			//�G�t�F�N�g�T�C�Y��"0"�ɂ��Č����Ȃ��悤�ɂ���
			for(alpha_def = EFC_SIZE_MAX; alpha_def >= EFC_SIZE_MIN; alpha_def = alpha_def - GRADUALLY_SMALL){
				SetEffectScale_(efc_3to1, alpha_def);
				SetEffectScale_(efc_3to4, alpha_def);
				SetEffectScale_(efc_3to5, alpha_def);
				Wait_(1);
			}
			
			//�G�t�F�N�g�̃��l��0�ɂ���
			SetEffectScale_(efc_3to1, EFC_SIZE_MIN);
			SetEffectScale_(efc_3to4, EFC_SIZE_MIN);
			SetEffectScale_(efc_3to5, EFC_SIZE_MIN);
			
			//�r�[���̈ʒu�����ɖ߂�
			SetPointPos_(base3to1, "obj003");
			SetPointPos_(base3to4, "obj003");
			SetPointPos_(base3to5, "obj003");
			
			//�r�[�������������Α��̉�]����
			PlaySE_("SE_FLD_100");
			task1 = Task_RotateToDirSetMotion_(g_stone_01, g_dir01, 2.0, "WAIT", "WAIT");
			task4 = Task_RotateToDirSetMotion_(g_stone_04, g_dir04, 2.0, "WAIT", "WAIT");
			task5 = Task_RotateToDirSetMotion_(g_stone_05, g_dir05, 2.0, "WAIT", "WAIT");
			WaitTask(task1);
			
			//�i�r�}�b�v�A�C�R���̌�����ς���
			SetNaviMapIconDir_(g_map_navi01, g_dir01);
			SetNaviMapIconDir_(g_map_navi04, g_dir04);
			SetNaviMapIconDir_(g_map_navi05, g_dir05);
			
			//�V�X�e�����b�Z�[�W
			OpenMsgWnd_();
			ShowMsg_("GRAVE_FAKE_SYS_04");
			KeyInputWait_();
			CloseMsgWnd_();
			break;
		// �����v���
		case QUERY3_1:
			CloseMsgWnd_();
			
			//�Α��M�~�b�N�̎菇���J�E���g����
			count_num = count_num + 1;
			SetNumFlg_("NUM_FLG_SECRETROOM_COUNT", count_num);
			
			//��]�l���v�Z����֐�
			uStoneRotateLeft(g_stone_03);	//�Α�3������90�x��]������
			uStoneRotateLeft(g_stone_01);	//�Α�1������90�x��]������
			uStoneRotateLeft(g_stone_04);	//�Α�4������90�x��]������
			uStoneRotateLeft(g_stone_05);	//�Α�5������90�x��]������
			
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
			SetEffectScale_(efc_3to5, EFC_SIZE_MAX);
			efc_task3to1 = Task_AnimeMoveNoFit_(base3to1, "beem3_to_1");
			efc_task3to4 = Task_AnimeMoveNoFit_(base3to4, "beem3_to_4");
			efc_task3to5 = Task_AnimeMoveNoFit_(base3to5, "beem3_to_5");
			WaitTask(efc_task3to1);
			
			//�G�t�F�N�g�T�C�Y��"0"�ɂ��Č����Ȃ��悤�ɂ���
			for(alpha_def = EFC_SIZE_MAX; alpha_def >= EFC_SIZE_MIN; alpha_def = alpha_def - GRADUALLY_SMALL){
				SetEffectScale_(efc_3to1, alpha_def);
				SetEffectScale_(efc_3to4, alpha_def);
				SetEffectScale_(efc_3to5, alpha_def);
				Wait_(1);
			}
			
			//�G�t�F�N�g�̃��l��0�ɂ���
			SetEffectScale_(efc_3to1, EFC_SIZE_MIN);
			SetEffectScale_(efc_3to4, EFC_SIZE_MIN);
			SetEffectScale_(efc_3to5, EFC_SIZE_MIN);
			
			//�r�[���̈ʒu�����ɖ߂�
			SetPointPos_(base3to1, "obj003");
			SetPointPos_(base3to4, "obj003");
			SetPointPos_(base3to5, "obj003");
			
			//�r�[�������������Α��̉�]����
			PlaySE_("SE_FLD_100");
			task1 = Task_RotateToDirSetMotion_(g_stone_01, g_dir01, 2.0, "WAIT", "WAIT");
			task4 = Task_RotateToDirSetMotion_(g_stone_04, g_dir04, 2.0, "WAIT", "WAIT");
			task5 = Task_RotateToDirSetMotion_(g_stone_05, g_dir05, 2.0, "WAIT", "WAIT");
			WaitTask(task1);
			
			//�i�r�}�b�v�A�C�R���̌�����ς���
			SetNaviMapIconDir_(g_map_navi01, g_dir01);
			SetNaviMapIconDir_(g_map_navi04, g_dir04);
			SetNaviMapIconDir_(g_map_navi05, g_dir05);
			
			//�V�X�e�����b�Z�[�W
			OpenMsgWnd_();
			ShowMsg_("GRAVE_FAKE_SYS_04");
			KeyInputWait_();
			CloseMsgWnd_();
			break;
		// ��߂�
		case QUERY3_2:
			// ���b�Z�[�W�E�C���h�E�����(��)
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
	if( count_num == 1 ){
		OpenMsgWnd_();
		ShowMsg_("SYS_HELP_MES_020");	// �Α��𓮂�����@�c��񐔂́@���ƂQ�񂾁c�c�B
		KeyInputWait_();
		CloseMsgWnd_();
	}
	if( count_num == 2 ){
		OpenMsgWnd_();
		ShowMsg_("SYS_HELP_MES_010");	// �Α��𓮂�����@�c��񐔂́@���ƂP�񂾁c�c�B
		KeyInputWait_();
		CloseMsgWnd_();
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
	local count_num = GetNumFlg_("NUM_FLG_SECRETROOM_COUNT");	// �Α��̎菇���Z�b�g�p
	local seikai    = GetEventFlg_("BFG_MOVE_SUCCESS_SECOND");	// �U�̂̐Α��M�~�b�N�𐳊m�Ȉʒu�ɍ��킹��ꂽ�t���O

	//�Α��̉�]�^�X�N�Ɏg�p
	local task1, task2, task3, task4, task5, task6;
	//�G�t�F�N�g�Ɏg�p
	local efc_task1to2, efc_task1to3, efc_task2to1, efc_task2to4;
	local efc_task3to1, efc_task3to4, efc_task3to5, efc_task4to2, efc_task4to3, efc_task4to6;
	local efc_task5to3, efc_task5to6, efc_task6to4, efc_task6to5;
	local alpha_def;
	
	CommPlayerTurnAroundObj(g_stone_04);
	if( seikai == false ){	//�M�~�b�N���U���̏ꍇ
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
			SetNumFlg_("NUM_FLG_SECRETROOM_COUNT", count_num);
			
			//��]�l���v�Z����֐�
			uStoneRotateRight(g_stone_04);	//�Α�4���E��90�x��]������
			uStoneRotateRight(g_stone_02);	//�Α�2���E��90�x��]������
			uStoneRotateRight(g_stone_03);	//�Α�3���E��90�x��]������
			uStoneRotateRight(g_stone_06);	//�Α�6���E��90�x��]������
			
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
			SetEffectScale_(efc_4to6, EFC_SIZE_MAX);
			efc_task4to2 = Task_AnimeMoveNoFit_(base4to2, "beem4_to_2");
			efc_task4to3 = Task_AnimeMoveNoFit_(base4to3, "beem4_to_3");
			efc_task4to6 = Task_AnimeMoveNoFit_(base4to6, "beem4_to_6");
			WaitTask(efc_task4to2);
			
			//�G�t�F�N�g�T�C�Y��"0"�ɂ��Č����Ȃ��悤�ɂ���
			for(alpha_def = EFC_SIZE_MAX; alpha_def >= EFC_SIZE_MIN; alpha_def = alpha_def - GRADUALLY_SMALL){
				SetEffectScale_(efc_4to2, alpha_def);
				SetEffectScale_(efc_4to3, alpha_def);
				SetEffectScale_(efc_4to6, alpha_def);
				Wait_(1);
			}
			
			//�G�t�F�N�g�̃��l��0�ɂ���
			SetEffectScale_(efc_4to2, EFC_SIZE_MIN);
			SetEffectScale_(efc_4to3, EFC_SIZE_MIN);
			SetEffectScale_(efc_4to6, EFC_SIZE_MIN);
			
			//�r�[���̈ʒu�����ɖ߂�
			SetPointPos_(base4to2, "obj004");
			SetPointPos_(base4to3, "obj004");
			SetPointPos_(base4to6, "obj004");
			
			//�r�[�������������Α��̉�]����
			PlaySE_("SE_FLD_100");
			task2 = Task_RotateToDirSetMotion_(g_stone_02, g_dir02, 2.0, "WAIT", "WAIT");
			task3 = Task_RotateToDirSetMotion_(g_stone_03, g_dir03, 2.0, "WAIT", "WAIT");
			task6 = Task_RotateToDirSetMotion_(g_stone_06, g_dir06, 2.0, "WAIT", "WAIT");
			WaitTask(task2);
			
			//�i�r�}�b�v�A�C�R���̌�����ς���
			SetNaviMapIconDir_(g_map_navi02, g_dir02);
			SetNaviMapIconDir_(g_map_navi03, g_dir03);
			SetNaviMapIconDir_(g_map_navi06, g_dir06);
			
			//�V�X�e�����b�Z�[�W
			OpenMsgWnd_();
			ShowMsg_("GRAVE_FAKE_SYS_04");
			KeyInputWait_();
			CloseMsgWnd_();
			break;
		// �����v���
		case QUERY3_1:
			CloseMsgWnd_();
			
			//�Α��M�~�b�N�̎菇���J�E���g����
			count_num = count_num + 1;
			SetNumFlg_("NUM_FLG_SECRETROOM_COUNT", count_num);
			
			//��]�l���v�Z����֐�
			uStoneRotateLeft(g_stone_04);	//�Α�4������90�x��]������
			uStoneRotateLeft(g_stone_02);	//�Α�2������90�x��]������
			uStoneRotateLeft(g_stone_03);	//�Α�3������90�x��]������
			uStoneRotateLeft(g_stone_06);	//�Α�6������90�x��]������
			
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
			SetEffectScale_(efc_4to6, EFC_SIZE_MAX);
			efc_task4to2 = Task_AnimeMoveNoFit_(base4to2, "beem4_to_2");
			efc_task4to3 = Task_AnimeMoveNoFit_(base4to3, "beem4_to_3");
			efc_task4to6 = Task_AnimeMoveNoFit_(base4to6, "beem4_to_6");
			WaitTask(efc_task4to2);
			
			//�G�t�F�N�g�T�C�Y��"0"�ɂ��Č����Ȃ��悤�ɂ���
			for(alpha_def = EFC_SIZE_MAX; alpha_def >= EFC_SIZE_MIN; alpha_def = alpha_def - GRADUALLY_SMALL){
				SetEffectScale_(efc_4to2, alpha_def);
				SetEffectScale_(efc_4to3, alpha_def);
				SetEffectScale_(efc_4to6, alpha_def);
				Wait_(1);
			}
			
			//�G�t�F�N�g�̃��l��0�ɂ���
			SetEffectScale_(efc_4to2, EFC_SIZE_MIN);
			SetEffectScale_(efc_4to3, EFC_SIZE_MIN);
			SetEffectScale_(efc_4to6, EFC_SIZE_MIN);
			
			//�r�[���̈ʒu�����ɖ߂�
			SetPointPos_(base4to2, "obj004");
			SetPointPos_(base4to3, "obj004");
			SetPointPos_(base4to6, "obj004");
			
			//�r�[�������������Α��̉�]����
			PlaySE_("SE_FLD_100");
			task2 = Task_RotateToDirSetMotion_(g_stone_02, g_dir02, 2.0, "WAIT", "WAIT");
			task3 = Task_RotateToDirSetMotion_(g_stone_03, g_dir03, 2.0, "WAIT", "WAIT");
			task6 = Task_RotateToDirSetMotion_(g_stone_06, g_dir06, 2.0, "WAIT", "WAIT");
			WaitTask(task2);
			
			//�i�r�}�b�v�A�C�R���̌�����ς���
			SetNaviMapIconDir_(g_map_navi02, g_dir02);
			SetNaviMapIconDir_(g_map_navi03, g_dir03);
			SetNaviMapIconDir_(g_map_navi06, g_dir06);
			
			//�V�X�e�����b�Z�[�W
			OpenMsgWnd_();
			ShowMsg_("GRAVE_FAKE_SYS_04");
			KeyInputWait_();
			CloseMsgWnd_();
			break;
		// ��߂�
		case QUERY3_2:
			// ���b�Z�[�W�E�C���h�E�����(��)
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
	if( count_num == 1 ){
		OpenMsgWnd_();
		ShowMsg_("SYS_HELP_MES_020");	// �Α��𓮂�����@�c��񐔂́@���ƂQ�񂾁c�c�B
		KeyInputWait_();
		CloseMsgWnd_();
	}
	if( count_num == 2 ){
		OpenMsgWnd_();
		ShowMsg_("SYS_HELP_MES_010");	// �Α��𓮂�����@�c��񐔂́@���ƂP�񂾁c�c�B
		KeyInputWait_();
		CloseMsgWnd_();
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//		�Α�5(����)��90�x��]������^�X�N����
//
//----------------------------------------------------------------------------
//	����	: �Ȃ�
//
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function uMineRotateStone5()
{
	//�t���O�̏�Ԃ��擾
	local count_num = GetNumFlg_("NUM_FLG_SECRETROOM_COUNT");	// �Α��̎菇���Z�b�g�p
	local seikai    = GetEventFlg_("BFG_MOVE_SUCCESS_SECOND");	// �U�̂̐Α��M�~�b�N�𐳊m�Ȉʒu�ɍ��킹��ꂽ�t���O

	//�Α��̉�]�^�X�N�Ɏg�p
	local task1, task2, task3, task4, task5, task6;
	//�G�t�F�N�g�Ɏg�p
	local efc_task1to2, efc_task1to3, efc_task2to1, efc_task2to4;
	local efc_task3to1, efc_task3to4, efc_task3to5, efc_task4to2, efc_task4to3, efc_task4to6;
	local efc_task5to3, efc_task5to6, efc_task6to4, efc_task6to5;
	local alpha_def;
	
	CommPlayerTurnAroundObj(g_stone_05);
	if( seikai == false ){	//�M�~�b�N���U���̏ꍇ
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
			SetNumFlg_("NUM_FLG_SECRETROOM_COUNT", count_num);
			
			//��]�l���v�Z����֐�
			uStoneRotateRight(g_stone_05);	//�Α�5���E��90�x��]������
			uStoneRotateRight(g_stone_03);	//�Α�3���E��90�x��]������
			uStoneRotateRight(g_stone_06);	//�Α�6���E��90�x��]������
			
			//--------------------------------
			//�^�X�N�ɂĐΑ��𓯎��ɉ�]������
			//--------------------------------
			//���ׂ��Α��̉�]����
			PlaySE_("SE_FLD_100");
			task5 = Task_RotateToDirSetMotion_(g_stone_05, g_dir05, 2.0, "WAIT", "WAIT");
			WaitTask(task5);
			
			//�i�r�}�b�v�A�C�R���̌�����ς���
			SetNaviMapIconDir_(g_map_navi05, g_dir05);
			
			//�G�t�F�N�g�T�C�Y��W���T�C�Y�ɂ��Ă��甭��
			PlaySE_("SE_DEM_103");
			SetEffectScale_(efc_5to3, EFC_SIZE_MAX);
			SetEffectScale_(efc_5to6, EFC_SIZE_MAX);
			efc_task5to3 = Task_AnimeMoveNoFit_(base5to3, "beem5_to_3");
			efc_task5to6 = Task_AnimeMoveNoFit_(base5to6, "beem5_to_6");
			WaitTask(efc_task5to3);
			
			//�G�t�F�N�g�T�C�Y��"0"�ɂ��Č����Ȃ��悤�ɂ���
			for(alpha_def = EFC_SIZE_MAX; alpha_def >= EFC_SIZE_MIN; alpha_def = alpha_def - GRADUALLY_SMALL){
				SetEffectScale_(efc_5to3, alpha_def);
				SetEffectScale_(efc_5to6, alpha_def);
				Wait_(1);
			}
			
			//�G�t�F�N�g�̃��l��0�ɂ���
			SetEffectScale_(efc_5to3, EFC_SIZE_MIN);
			SetEffectScale_(efc_5to6, EFC_SIZE_MIN);
			
			//�r�[���̈ʒu�����ɖ߂�
			SetPointPos_(base5to3, "obj005");
			SetPointPos_(base5to6, "obj005");
			
			//�r�[�������������Α��̉�]����
			PlaySE_("SE_FLD_100");
			task3 = Task_RotateToDirSetMotion_(g_stone_03, g_dir03, 2.0, "WAIT", "WAIT");
			task6 = Task_RotateToDirSetMotion_(g_stone_06, g_dir06, 2.0, "WAIT", "WAIT");
			WaitTask(task3);
			
			//�i�r�}�b�v�A�C�R���̌�����ς���
			SetNaviMapIconDir_(g_map_navi03, g_dir03);
			SetNaviMapIconDir_(g_map_navi06, g_dir06);
			
			//�V�X�e�����b�Z�[�W
			OpenMsgWnd_();
			ShowMsg_("GRAVE_FAKE_SYS_04");
			KeyInputWait_();
			CloseMsgWnd_();
			break;
		// �����v���
		case QUERY3_1:
			CloseMsgWnd_();
			
			//�Α��M�~�b�N�̎菇���J�E���g����
			count_num = count_num + 1;
			SetNumFlg_("NUM_FLG_SECRETROOM_COUNT", count_num);
			
			//��]�l���v�Z����֐�
			uStoneRotateLeft(g_stone_05);	//�Α�5������90�x��]������
			uStoneRotateLeft(g_stone_03);	//�Α�3������90�x��]������
			uStoneRotateLeft(g_stone_06);	//�Α�6������90�x��]������
			
			//--------------------------------
			//�^�X�N�ɂĐΑ��𓯎��ɉ�]������
			//--------------------------------
			//���ׂ��Α��̉�]����
			PlaySE_("SE_FLD_100");
			task5 = Task_RotateToDirSetMotion_(g_stone_05, g_dir05, 2.0, "WAIT", "WAIT");
			WaitTask(task5);
			
			//�i�r�}�b�v�A�C�R���̌�����ς���
			SetNaviMapIconDir_(g_map_navi05, g_dir05);
			
			//�G�t�F�N�g�T�C�Y��W���T�C�Y�ɂ��Ă��甭��
			PlaySE_("SE_DEM_103");
			SetEffectScale_(efc_5to3, EFC_SIZE_MAX);
			SetEffectScale_(efc_5to6, EFC_SIZE_MAX);
			efc_task5to3 = Task_AnimeMoveNoFit_(base5to3, "beem5_to_3");
			efc_task5to6 = Task_AnimeMoveNoFit_(base5to6, "beem5_to_6");
			WaitTask(efc_task5to3);
			
			//�G�t�F�N�g�T�C�Y��"0"�ɂ��Č����Ȃ��悤�ɂ���
			for(alpha_def = EFC_SIZE_MAX; alpha_def >= EFC_SIZE_MIN; alpha_def = alpha_def - GRADUALLY_SMALL){
				SetEffectScale_(efc_5to3, alpha_def);
				SetEffectScale_(efc_5to6, alpha_def);
				Wait_(1);
			}
			
			//�G�t�F�N�g�̃��l��0�ɂ���
			SetEffectScale_(efc_5to3, EFC_SIZE_MIN);
			SetEffectScale_(efc_5to6, EFC_SIZE_MIN);
			
			//�r�[���̈ʒu�����ɖ߂�
			SetPointPos_(base5to3, "obj005");
			SetPointPos_(base5to6, "obj005");
			
			//�r�[�������������Α��̉�]����
			PlaySE_("SE_FLD_100");
			task3 = Task_RotateToDirSetMotion_(g_stone_03, g_dir03, 2.0, "WAIT", "WAIT");
			task6 = Task_RotateToDirSetMotion_(g_stone_06, g_dir06, 2.0, "WAIT", "WAIT");
			WaitTask(task3);
			
			//�i�r�}�b�v�A�C�R���̌�����ς���
			SetNaviMapIconDir_(g_map_navi03, g_dir03);
			SetNaviMapIconDir_(g_map_navi06, g_dir06);
			
			//�V�X�e�����b�Z�[�W
			OpenMsgWnd_();
			ShowMsg_("GRAVE_FAKE_SYS_04");
			KeyInputWait_();
			CloseMsgWnd_();
			break;
		// ��߂�
		case QUERY3_2:
			// ���b�Z�[�W�E�C���h�E�����(��)
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
	if( count_num == 1 ){
		OpenMsgWnd_();
		ShowMsg_("SYS_HELP_MES_020");	// �Α��𓮂�����@�c��񐔂́@���ƂQ�񂾁c�c�B
		KeyInputWait_();
		CloseMsgWnd_();
	}
	if( count_num == 2 ){
		OpenMsgWnd_();
		ShowMsg_("SYS_HELP_MES_010");	// �Α��𓮂�����@�c��񐔂́@���ƂP�񂾁c�c�B
		KeyInputWait_();
		CloseMsgWnd_();
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//		�Α�6(�E��)��90�x��]������^�X�N����
//
//----------------------------------------------------------------------------
//	����	: �Ȃ�
//
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function uMineRotateStone6()
{
	//�t���O�̏�Ԃ��擾
	local count_num = GetNumFlg_("NUM_FLG_SECRETROOM_COUNT");	// �Α��̎菇���Z�b�g�p
	local seikai    = GetEventFlg_("BFG_MOVE_SUCCESS_SECOND");	// �U�̂̐Α��M�~�b�N�𐳊m�Ȉʒu�ɍ��킹��ꂽ�t���O

	//�Α��̉�]�^�X�N�Ɏg�p
	local task1, task2, task3, task4, task5, task6;
	//�G�t�F�N�g�Ɏg�p
	local efc_task1to2, efc_task1to3, efc_task2to1, efc_task2to4;
	local efc_task3to1, efc_task3to4, efc_task3to5, efc_task4to2, efc_task4to3, efc_task4to6;
	local efc_task5to3, efc_task5to6, efc_task6to4, efc_task6to5;
	local alpha_def;
	
	CommPlayerTurnAroundObj(g_stone_06);
	if( seikai == false ){	//�M�~�b�N���U���̏ꍇ
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
			SetNumFlg_("NUM_FLG_SECRETROOM_COUNT", count_num);
			
			//��]�l���v�Z����֐�
			uStoneRotateRight(g_stone_06);	//�Α�6���E��90�x��]������
			uStoneRotateRight(g_stone_04);	//�Α�4���E��90�x��]������
			uStoneRotateRight(g_stone_05);	//�Α�5���E��90�x��]������
			
			//--------------------------------
			//�^�X�N�ɂĐΑ��𓯎��ɉ�]������
			//--------------------------------
			//���ׂ��Α��̉�]����
			PlaySE_("SE_FLD_100");
			task6 = Task_RotateToDirSetMotion_(g_stone_06, g_dir06, 2.0, "WAIT", "WAIT");
			WaitTask(task6);
			
			//�i�r�}�b�v�A�C�R���̌�����ς���
			SetNaviMapIconDir_(g_map_navi06, g_dir06);
			
			//�G�t�F�N�g�T�C�Y��W���T�C�Y�ɂ��Ă��甭��
			PlaySE_("SE_DEM_103");
			SetEffectScale_(efc_6to4, EFC_SIZE_MAX);
			SetEffectScale_(efc_6to5, EFC_SIZE_MAX);
			efc_task6to4 = Task_AnimeMoveNoFit_(base6to4, "beem6_to_4");
			efc_task6to5 = Task_AnimeMoveNoFit_(base6to5, "beem6_to_5");
			WaitTask(efc_task6to4);
			
			//�G�t�F�N�g�T�C�Y��"0"�ɂ��Č����Ȃ��悤�ɂ���
			for(alpha_def = EFC_SIZE_MAX; alpha_def >= EFC_SIZE_MIN; alpha_def = alpha_def - GRADUALLY_SMALL){
				SetEffectScale_(efc_6to4, alpha_def);
				SetEffectScale_(efc_6to5, alpha_def);
				Wait_(1);
			}
			
			//�G�t�F�N�g�̃��l��0�ɂ���
			SetEffectScale_(efc_6to4, EFC_SIZE_MIN);
			SetEffectScale_(efc_6to5, EFC_SIZE_MIN);
			
			//�r�[���̈ʒu�����ɖ߂�
			SetPointPos_(base6to4, "obj006");
			SetPointPos_(base6to5, "obj006");
			
			//�r�[�������������Α��̉�]����
			PlaySE_("SE_FLD_100");
			task4 = Task_RotateToDirSetMotion_(g_stone_04, g_dir04, 2.0, "WAIT", "WAIT");
			task5 = Task_RotateToDirSetMotion_(g_stone_05, g_dir05, 2.0, "WAIT", "WAIT");
			WaitTask(task4);
			
			//�i�r�}�b�v�A�C�R���̌�����ς���
			SetNaviMapIconDir_(g_map_navi04, g_dir04);
			SetNaviMapIconDir_(g_map_navi05, g_dir05);
			
			//�V�X�e�����b�Z�[�W
			OpenMsgWnd_();
			ShowMsg_("GRAVE_FAKE_SYS_04");
			KeyInputWait_();
			CloseMsgWnd_();
			break;
		// �����v���
		case QUERY3_1:
			CloseMsgWnd_();
			
			//�Α��M�~�b�N�̎菇���J�E���g����
			count_num = count_num + 1;
			SetNumFlg_("NUM_FLG_SECRETROOM_COUNT", count_num);
			
			//��]�l���v�Z����֐�
			uStoneRotateLeft(g_stone_06);	//�Α�6������90�x��]������
			uStoneRotateLeft(g_stone_04);	//�Α�4������90�x��]������
			uStoneRotateLeft(g_stone_05);	//�Α�5������90�x��]������
			
			//--------------------------------
			//�^�X�N�ɂĐΑ��𓯎��ɉ�]������
			//--------------------------------
			//���ׂ��Α��̉�]����
			PlaySE_("SE_FLD_100");
			task6 = Task_RotateToDirSetMotion_(g_stone_06, g_dir06, 2.0, "WAIT", "WAIT");
			WaitTask(task6);
			
			//�i�r�}�b�v�A�C�R���̌�����ς���
			SetNaviMapIconDir_(g_map_navi06, g_dir06);
			
			//�G�t�F�N�g�T�C�Y��W���T�C�Y�ɂ��Ă��甭��
			PlaySE_("SE_DEM_103");
			SetEffectScale_(efc_6to4, EFC_SIZE_MAX);
			SetEffectScale_(efc_6to5, EFC_SIZE_MAX);
			efc_task6to4 = Task_AnimeMoveNoFit_(base6to4, "beem6_to_4");
			efc_task6to5 = Task_AnimeMoveNoFit_(base6to5, "beem6_to_5");
			WaitTask(efc_task6to4);
			
			//�G�t�F�N�g�T�C�Y��"0"�ɂ��Č����Ȃ��悤�ɂ���
			for(alpha_def = EFC_SIZE_MAX; alpha_def >= EFC_SIZE_MIN; alpha_def = alpha_def - GRADUALLY_SMALL){
				SetEffectScale_(efc_6to4, alpha_def);
				SetEffectScale_(efc_6to5, alpha_def);
				Wait_(1);
			}
			
			//�G�t�F�N�g�̃��l��0�ɂ���
			SetEffectScale_(efc_6to4, EFC_SIZE_MIN);
			SetEffectScale_(efc_6to5, EFC_SIZE_MIN);
			
			//�r�[���̈ʒu�����ɖ߂�
			SetPointPos_(base6to4, "obj006");
			SetPointPos_(base6to5, "obj006");
			
			//�r�[�������������Α��̉�]����
			PlaySE_("SE_FLD_100");
			task4 = Task_RotateToDirSetMotion_(g_stone_04, g_dir04, 2.0, "WAIT", "WAIT");
			task5 = Task_RotateToDirSetMotion_(g_stone_05, g_dir05, 2.0, "WAIT", "WAIT");
			WaitTask(task4);
			
			//�i�r�}�b�v�A�C�R���̌�����ς���
			SetNaviMapIconDir_(g_map_navi04, g_dir04);
			SetNaviMapIconDir_(g_map_navi05, g_dir05);
			
			//�V�X�e�����b�Z�[�W
			OpenMsgWnd_();
			ShowMsg_("GRAVE_FAKE_SYS_04");
			KeyInputWait_();
			CloseMsgWnd_();
			break;
		// ��߂�
		case QUERY3_2:
			// ���b�Z�[�W�E�C���h�E�����(��)
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
	if( count_num == 1 ){
		OpenMsgWnd_();
		ShowMsg_("SYS_HELP_MES_020");	// �Α��𓮂�����@�c��񐔂́@���ƂQ�񂾁c�c�B
		KeyInputWait_();
		CloseMsgWnd_();
	}
	if( count_num == 2 ){
		OpenMsgWnd_();
		ShowMsg_("SYS_HELP_MES_010");	// �Α��𓮂�����@�c��񐔂́@���ƂP�񂾁c�c�B
		KeyInputWait_();
		CloseMsgWnd_();
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
	g_num_stone1 <- GetNumFlg_("NUM_FLG_SECRETROOM_STONE_STATUE_01");
	g_num_stone2 <- GetNumFlg_("NUM_FLG_SECRETROOM_STONE_STATUE_02");
	g_num_stone3 <- GetNumFlg_("NUM_FLG_SECRETROOM_STONE_STATUE_03");
	g_num_stone4 <- GetNumFlg_("NUM_FLG_SECRETROOM_STONE_STATUE_04");
	g_num_stone5 <- GetNumFlg_("NUM_FLG_SECRETROOM_STONE_STATUE_05");
	g_num_stone6 <- GetNumFlg_("NUM_FLG_SECRETROOM_STONE_STATUE_06");
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		�Α���p�̃t���O���Z�b�g����
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uSetSekizouFlag()
{
	SetNumFlg_("NUM_FLG_SECRETROOM_STONE_STATUE_01", g_num_stone1);
	SetNumFlg_("NUM_FLG_SECRETROOM_STONE_STATUE_02", g_num_stone2);
	SetNumFlg_("NUM_FLG_SECRETROOM_STONE_STATUE_03", g_num_stone3);
	SetNumFlg_("NUM_FLG_SECRETROOM_STONE_STATUE_04", g_num_stone4);
	SetNumFlg_("NUM_FLG_SECRETROOM_STONE_STATUE_05", g_num_stone5);
	SetNumFlg_("NUM_FLG_SECRETROOM_STONE_STATUE_06", g_num_stone6);
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		�Α��̉�]�l(num)��ς��鏈��
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uResetNumStone(num1, num2, num3, num4, num5, num6)
{
	g_num_stone1 <- num1;
	g_num_stone2 <- num2;
	g_num_stone3 <- num3;
	g_num_stone4 <- num4;
	g_num_stone5 <- num5;
	g_num_stone6 <- num6;
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		�Α��̉�]�l(dir)��ς��鏈��
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uResetDirStone(dir1, dir2, dir3, dir4, dir5, dir6)
{
	g_dir01 <- dir1;
	g_dir02 <- dir2;
	g_dir03 <- dir3;
	g_dir04 <- dir4;
	g_dir05 <- dir5;
	g_dir06 <- dir6;
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
	SetDir_( g_stone_05, g_dir05 );
	SetDir_( g_stone_06, g_dir06 );
	// �i�r�}�b�v�A�C�R���̌���������̒l�̕����Ɍ�������
	SetNaviMapIconDir_(g_map_navi01, g_dir01);
	SetNaviMapIconDir_(g_map_navi02, g_dir02);
	SetNaviMapIconDir_(g_map_navi03, g_dir03);
	SetNaviMapIconDir_(g_map_navi04, g_dir04);
	SetNaviMapIconDir_(g_map_navi05, g_dir05);
	SetNaviMapIconDir_(g_map_navi06, g_dir06);
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
		SetNumFlg_("NUM_FLG_SECRETROOM_STONE_STATUE_01", g_num_stone1);	//"-1"���ꂽ�l���Z�b�g
		
		//�Α��̉�]�l���v�Z����
		if( g_dir01 == 0 ){ g_dir01 <- 360; }			//��]�l���}�C�i�X�ɂȂ�Ȃ��l�ɂ���
		g_dir01 = g_dir01 - 90;							//�ϐ��̒l��"-90"����
	}
	//�Α�2(�E��)�̏ꍇ
	if( id == g_stone_02 ){
		if( g_num_stone2 == 0 ){ g_num_stone2 <- 4; }
		g_num_stone2 = g_num_stone2 - 1;
		SetNumFlg_("NUM_FLG_SECRETROOM_STONE_STATUE_02", g_num_stone2);
		
		if( g_dir02 == 0 ){ g_dir02 <- 360; }
		g_dir02 = g_dir02 - 90;
	}
	//�Α�3(����)�̏ꍇ
	if( id == g_stone_03 ){
		if( g_num_stone3 == 0 ){ g_num_stone3 <- 4; }
		g_num_stone3 = g_num_stone3 - 1;
		SetNumFlg_("NUM_FLG_SECRETROOM_STONE_STATUE_03", g_num_stone3);
		
		if( g_dir03 == 0 ){ g_dir03 <- 360; }
		g_dir03 = g_dir03 - 90;
	}
	//�Α�4(�E��)�̏ꍇ
	if( id == g_stone_04 ){
		if( g_num_stone4 == 0 ){ g_num_stone4 <- 4; }
		g_num_stone4 = g_num_stone4 - 1;
		SetNumFlg_("NUM_FLG_SECRETROOM_STONE_STATUE_04", g_num_stone4);
		
		if( g_dir04 == 0 ){ g_dir04 <- 360; }
		g_dir04 = g_dir04 - 90;
	}
	//�Α�5(����)�̏ꍇ
	if( id == g_stone_05 ){
		if( g_num_stone5 == 0 ){ g_num_stone5 <- 4; }
		g_num_stone5 = g_num_stone5 - 1;
		SetNumFlg_("NUM_FLG_SECRETROOM_STONE_STATUE_05", g_num_stone5);
		
		if( g_dir05 == 0 ){ g_dir05 <- 360; }
		g_dir05 = g_dir05 - 90;
	}
	//�Α�6(�E��)�̏ꍇ
	if( id == g_stone_06 ){
		if( g_num_stone6 == 0 ){ g_num_stone6 <- 4; }
		g_num_stone6 = g_num_stone6 - 1;
		SetNumFlg_("NUM_FLG_SECRETROOM_STONE_STATUE_06", g_num_stone6);
		
		if( g_dir06 == 0 ){ g_dir06 <- 360; }
		g_dir06 = g_dir06 - 90;
	}
}
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

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
		SetNumFlg_("NUM_FLG_SECRETROOM_STONE_STATUE_01", g_num_stone1);//"+1"���ꂽ�l���Z�b�g
		
		//�Α��̉�]�l���v�Z����
		g_dir01 = g_dir01 + 90;							//�ϐ��̒l��"+90"����
		if( g_dir01 == 360 ){	g_dir01 <- 0;	}		//��]�l��"360"���傫���Ȃ�Ȃ��l�ɂ���
	}
	//�Α�2(�E��)�̏ꍇ
	if( id == g_stone_02 ){
		g_num_stone2 = g_num_stone2 + 1;
		if( g_num_stone2 == 4 ){ g_num_stone2 <- 0; }
		SetNumFlg_("NUM_FLG_SECRETROOM_STONE_STATUE_02", g_num_stone2);
		
		g_dir02 = g_dir02 + 90;
		if( g_dir02 == 360 ){	g_dir02 <- 0;	}
	}
	//�Α�3(����)�̏ꍇ
	if( id == g_stone_03 ){
		g_num_stone3 = g_num_stone3 + 1;
		if( g_num_stone3 == 4 ){ g_num_stone3 <- 0; }
		SetNumFlg_("NUM_FLG_SECRETROOM_STONE_STATUE_03", g_num_stone3);
		
		g_dir03 = g_dir03 + 90;
		if( g_dir03 == 360 ){	g_dir03 <- 0;	}
	}
	//�Α�4(�E��)�̏ꍇ
	if( id == g_stone_04 ){
		g_num_stone4 = g_num_stone4 + 1;
		if( g_num_stone4 == 4 ){ g_num_stone4 <- 0; }
		SetNumFlg_("NUM_FLG_SECRETROOM_STONE_STATUE_04", g_num_stone4);
		
		g_dir04 = g_dir04 + 90;
		if( g_dir04 == 360 ){	g_dir04 <- 0;	}
	}
	//�Α�5(����)�̏ꍇ
	if( id == g_stone_05 ){
		g_num_stone5 = g_num_stone5 + 1;
		if( g_num_stone5 == 4 ){ g_num_stone5 <- 0; }
		SetNumFlg_("NUM_FLG_SECRETROOM_STONE_STATUE_05", g_num_stone5);
		
		g_dir05 = g_dir05 + 90;
		if( g_dir05 == 360 ){	g_dir05 <- 0;	}
	}
	//�Α�6(�E��)�̏ꍇ
	if( id == g_stone_06 ){
		g_num_stone6 = g_num_stone6 + 1;
		if( g_num_stone6 == 4 ){ g_num_stone6 <- 0; }
		SetNumFlg_("NUM_FLG_SECRETROOM_STONE_STATUE_06", g_num_stone6);
		
		g_dir06 = g_dir06 + 90;
		if( g_dir06 == 360 ){	g_dir06 <- 0;	}
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

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//		�{�I�̃��b�Z�[�W��Ԃ�����
//---------------------------------------------------------------
//	����	: �{�I�H�����Ԗڂɒ��ׂ�ꂽ�����Ǘ�����num�t���O�ԍ�
//	�߂�l	: �ԍ��ɑΉ��������b�Z�[�WID
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function uReturnBookshelfMsg(flg_name)
{
	if(GetNumFlg_(flg_name) == 0){
		local num = GetNumFlg_("NUM_FLG_CHECK_BOOKSHELF_COUNT");
		num = num + 1;
		SetNumFlg_("NUM_FLG_CHECK_BOOKSHELF_COUNT", num);
		SetNumFlg_(flg_name, num);
	}
	
	switch(GetNumFlg_(flg_name))
	{
	case 1:
		return "MINE_BOOK_HINT_001";
	case 2:
		return "MINE_BOOK_HINT_002";
	case 3:
		return "MINE_BOOK_HINT_003";
	case 4:
		return "MINE_BOOK_HINT_004";
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		�ėp���b�Z�[�W�֐�(�l�[���^�O����)
//------------------------------------------------
//	����	: msg	���b�Z�[�WID
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMessage(msg)
{
	OpenMsgWnd_();
	ShowMsg_(msg);
	KeyInputWait_();
	CloseMsgWnd_();
}


