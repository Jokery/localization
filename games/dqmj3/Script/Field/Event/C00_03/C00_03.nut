//===================== C00_03�R�A �Ő[�� ====================

// �ϐ���`
main_num	 <- C_NONE_ID;
core_num	 <- C_NONE_ID;
sky_num		 <- C_NONE_ID;
outside_num	 <- C_NONE_ID;

main_num_sub <- "NUM_SCENARIO_MAIN";
core_num_sub <- "NUM_SCENARIO_SUB_CORE";
sky_num_sub	 <- "NUM_SCENARIO_SUB_SKY";
outside_num_sub <- "NUM_SCENARIO_SUB_INSIDE_CLEAR";

//------------------------------------------------
//		�퓬�I����
//------------------------------------------------
function AfterBattle()
{
	// �t���O�̏�Ԃ��擾
	main_num = GetNumFlg_("NUM_SCENARIO_MAIN");		// Num0
	core_num = GetNumFlg_("NUM_SCENARIO_SUB_CORE");	// Num8
	sky_num	 = GetNumFlg_("NUM_SCENARIO_SUB_SKY");	// Num9
	outside_num = GetNumFlg_("NUM_SCENARIO_SUB_INSIDE_CLEAR");	// Num10
	
	// �{�X��ɕ���������NUM�t���O��ύX���鏈���i�v���Ӂj
	// �C�x���g�u���b�N��EventStartOperate()�ł͔s�k�𔻒�ł��Ȃ��̂�
	// �����Ŕs�k�̔���ƃt���O�ύX���s���B
	
	// ��[�J�V�����b�g���A�p�f�}�N��]
	if(main_num == GetFlagID_("CONST_SM_CORE")){											// Num0 = 7
		if(core_num == GetFlagID_("CONST_SS_CO_JDG_BATTLE_DARK_MASTER")						// Num8 = 8 (���펞)
		|| core_num == GetFlagID_("CONST_SS_CO_JDG_REMATCH_DARK_MASTER")){					// Num8 = 11(�Đ펞)
			// �s�k
			if(GetBattleEndType_() == END_TYPE_LOSE){
				SetNumFlg_(core_num_sub, GetFlagID_("CONST_SS_CO_CONTACT_DARK_MASTER"));	// Num8 = 9
				SetEventFlg_("BFG_C00_03_EVENT_BGM008_PLAY", true);							// Bit664 : C00_03 BGM_008 �𗬂�
			// ����
			}else{
				// ���������EventStartOperate()���ōs��
			}
		}
	}
	// ��[�K���r���X��]
	if(main_num == GetFlagID_("CONST_SM_CORE")){											// Num0 = 7
		if(core_num == GetFlagID_("CONST_SS_CO_JDG_BATTLE_GARUBIRUSU")						// Num8 = 14(���펞)
		|| core_num == GetFlagID_("CONST_SS_CO_JDG_REMATCH_GARUBIRUSU")){					// Num8 = 17(�Đ펞)
			// �s�k
			if(GetBattleEndType_() == END_TYPE_LOSE){
				SetNumFlg_(core_num_sub, GetFlagID_("CONST_SS_CO_CONTACT_GARUBIRUSU"));		// Num8 = 15
			// ����
			}else{
				// ���������EventStartOperate()���ōs��
			}
		}
	}
	// ��[�_�[�X�K���}]
	if(main_num == GetFlagID_("CONST_SM_INSIDE_CLEAR")){							// Num 0 = 9
		// �_�[�X�K���}[���̂P]�E[���̂Q]�E[���̂R]
		if(outside_num == GetFlagID_("CONST_SS_OS_JDG_BATTLE_DARTHGARUMA")			// Num10 = 15(���펞)
		|| outside_num == GetFlagID_("CONST_SS_OS_JDG_REMATCH_DARTHGARUMA")			// Num10 = 18([���̂P]�Đ펞)
		|| outside_num == GetFlagID_("CONST_SS_OS_JDG_REMATCH_DARTH_2")				// Num10 = 23([���̂Q]�Đ펞)
		|| outside_num == GetFlagID_("CONST_SS_OS_JDG_REMATCH_DARTH_3")){			// Num10 = 28([���̂R]�Đ펞)
			// �s�k
			if(GetBattleEndType_() == END_TYPE_LOSE){
				// �퓬�ŉ��i�K�܂ŕϐg���������擾
				local get_flg_num = GetNumFlg_("NUM_FLG_COUNT_UP_DEMO_834");
				local set_flg_id;
				switch(get_flg_num)
				{
				// ����
				case 0:
					set_flg_id ="CONST_SS_OS_CONTACT_DARTHGARUMA";
					break;
				// �萶��
				case 1:
					set_flg_id ="CONST_SS_OS_CONTACT_DARTH_2";
					break;
				// ������
				case 2:
					set_flg_id ="CONST_SS_OS_CONTACT_DARTH_3";
					break;
				default:
					// ����ȊO�͏����ɖ߂�
					set_flg_id ="CONST_SS_OS_CONTACT_DARTHGARUMA";
					break;
				}
				SetNumFlg_(outside_num_sub, GetFlagID_(set_flg_id));	// Num10 = 16
			// ����
			}else{
				// ���������EventStartOperate()���ōs��
			}
		}
	}
	// ��[�_�O�W���K���}]
	if(main_num == GetFlagID_("CONST_SM_INSIDE_CLEAR")){									// Num 0 = 9
		// �_�O�W���K���}
		if(outside_num == GetFlagID_("CONST_SS_OS_JDG_BATTLE_DAGJAGARUMA")					// Num10 = 30(���펞)
		|| outside_num == GetFlagID_("CONST_SS_OS_JDG_REMATCH_DAGJAGARUMA")){				// Num10 = 33(�Đ펞)
			// �s�k
			if(GetBattleEndType_() == END_TYPE_LOSE){
				SetNumFlg_(outside_num_sub, GetFlagID_("CONST_SS_OS_CONTACT_DAGJAGARUMA"));	// Num10 = 31
			// ����
			}else{
				// ���������EventStartOperate()���ōs��
			}
		}
	}
	
	
	EventEnd_();
}


//------------------------------------------------
//		�}�b�v�ɓ���O
//------------------------------------------------
function BeforeInitMap()
{
	main_num = GetNumFlg_("NUM_SCENARIO_MAIN");		// Num0
	core_num = GetNumFlg_("NUM_SCENARIO_SUB_CORE");	// Num8
	sky_num	 = GetNumFlg_("NUM_SCENARIO_SUB_SKY");	// Num9
	outside_num = GetNumFlg_("NUM_SCENARIO_SUB_INSIDE_CLEAR");	// Num10
	
	// �����V�i���I Demo828[�_�[�X�K���}�ɏ���]�Đ���̃^�C�~���O�Ń��C�h����
	if(main_num == GetFlagID_("CONST_SM_INSIDE_CLEAR")){
		if(outside_num == GetFlagID_("CONST_SS_OS_EXAMINE_STAR_SEED")){
			//���C�h��������
			SetRideOffStart_();
		}
	}
	
	EventEnd_();
}


//------------------------------------------------
//		�t�F�[�h�A�E�g��
//------------------------------------------------
function FadeIn()
{
	//�ϐ���`
	local	player;
	
	main_num = GetNumFlg_("NUM_SCENARIO_MAIN");		// Num0
	core_num = GetNumFlg_("NUM_SCENARIO_SUB_CORE");	// Num8
	sky_num	 = GetNumFlg_("NUM_SCENARIO_SUB_SKY");	// Num9
	outside_num = GetNumFlg_("NUM_SCENARIO_SUB_INSIDE_CLEAR");	// Num10
	player	 = GetPlayerId_();
	
	DebugPrint(" ");
	DebugPrint("NUM_SCENARIO_MAIN �̒l�� " + main_num + " �ɂȂ�܂����B");
	DebugPrint("NUM_SCENARIO_SUB_CORE �̒l�� " + core_num + " �ɂȂ�܂����B");
	
	
	//---------------
	// ���M�~�b�N�z�u
	//---------------
	// �}�U�[
	local id_mother02  = ReadGimmick_("o_C03_02");	// �}�U�[
	local id_mother03  = ReadGimmick_("o_C03_03");	// �}�U�[����
	
	// �K���r���X���j�O�͓��t����z�u(���j��͔z�u�Ȃ�)
	if (main_num <= GetFlagID_("CONST_SM_CORE")) {								// Num0 = 7 �ȉ�
		local gim_mother02 = ArrangePointGimmick_("o_C03_02", id_mother02, "gim_mother");
		SetMotion_(gim_mother02, MOT_GIMMICK_0, BLEND_N); // �}�U�[(������)
		local gim_mother03 = ArrangePointGimmick_("o_C03_03", id_mother03, "gim_mother");
	}
	// �K���r���X���`�K���}�U�[�h��I���܂Ń}�U�[�{�̂�z�u���Ȃ�(�K���}�U�[�h�ƃ}�U�[���Z�����Ă����)
	if (main_num == GetFlagID_("CONST_SM_SKY")) {								// Num0 = 8 
		local gim_mother03 = ArrangePointGimmick_("o_C03_03", id_mother03, "gim_mother");
	}
	// �\�V�i���I�N���A��(���V�i���I��)�͓�������z�u
	if (main_num >= GetFlagID_("CONST_SM_INSIDE_CLEAR")) {						// Num0 = 9 �ȏ�
		local gim_mother02 = ArrangePointGimmick_("o_C03_02", id_mother02, "gim_mother");
		SetMotion_(gim_mother02, MOT_GIMMICK_1, BLEND_N); // �}�U�[(���Ȃ�)
		local gim_mother03 = ArrangePointGimmick_("o_C03_03", id_mother03, "gim_mother");
	}
	
	// �X�^�[�V�[�h
	star_seed <- C_NONE_ID;
	if(main_num == GetFlagID_("CONST_SM_INSIDE_CLEAR")){					// Num 0 = 9
		if(outside_num == GetFlagID_("CONST_SS_OS_EXAMINE_STAR_SEED")){		// Num10 = 34
			// �X�^�[�V�[�h
			LoadEffect_("ef732_26_star_seed_base02");
			star_seed = SetPointWorldEffect_("ef732_26_star_seed_base02", "ef_star_piece");
			SetEffectScale_(star_seed, 0.45);
		}
	}
	
	//----------
	// ��NPC�z�u
	//----------
	// ID������
	g_npc_renerte		 <- C_NONE_ID;
	g_npc_garubirusu	 <- C_NONE_ID;
	g_npc_garuma		 <- C_NONE_ID;
	g_npc_aroma			 <- C_NONE_ID;
	
	// ���\�[�X�ǂݍ���
	local id_renerte	 = ReadNpc_("n007");	// ���i�[�e
	
	// �����i�[�e
	if(main_num == GetFlagID_("CONST_SM_CORE")){								// Num0 = 7
		if(core_num >= GetFlagID_("CONST_SS_CO_APPROACH_RENATE")){				// Num8 = 12 �ȏ�
			g_npc_renerte = ArrangePointNpc_(id_renerte, "npc_renerte");
			SetVisible(g_npc_renerte, true);
			SetTalkEnable_(g_npc_renerte, false);								//��b�A�C�R����\��
			SetReactorMsg_(g_npc_renerte, "NPC_RENATE_010");
		}
	}
	// ���K���r���X(�Đ�)
	if(main_num == GetFlagID_("CONST_SM_CORE")){
		if(core_num == GetFlagID_("CONST_SS_CO_CONTACT_GARUBIRUSU")){
			local id_boss = ReadNpc_("m184_00"); // �K���r���X
			g_npc_garubirusu = ArrangePointNpc_(id_boss, "npc_boss");
			SetVisible(g_npc_garubirusu, true);
			// �T�C�Y
			SetScaleSilhouette(g_npc_garubirusu, SCALE.G, SILHOUETTE_WIDTH.G);
			SetTalkEnable_(g_npc_garubirusu, false);
			SetReactorMsg_(g_npc_garubirusu, "NPC_GARUBIRUSU_REC");
		}
	}
	// �����i�[�e(���V�i���I�p�A�~�o���Ă��炤�܂Ŕz�u)
	if(main_num == GetFlagID_("CONST_SM_INSIDE_CLEAR")){					// Num 0 == 9
		if(outside_num <= GetFlagID_("CONST_SS_OS_EXAMINE_STAR_SEED")){		// Num10 34�ȉ�
			g_npc_renerte = ArrangePointNpc_(id_renerte, "npc_renerte_in_mother");
			SetVisible(g_npc_renerte, true);
			SetPointPosNoFit_(g_npc_renerte, "npc_renerte_in_mother");
			SetTalkEnable_(g_npc_renerte, false);
			SetReactorMsg_(g_npc_renerte, "NPC_RENATE_010");
			SetFace_(g_npc_renerte, "Face_loop_close");
			// ��풓���[�V����
			local renerte_mother = ReadMotion_(g_npc_renerte, "n007_mother_L");
			SetMotion_(g_npc_renerte, renerte_mother, BLEND_N);
		}
	}
	
	// ���_�[�X�K���}
	if(main_num == GetFlagID_("CONST_SM_INSIDE_CLEAR")){						// Num 0 = 9
		// �_�[�X�K���}[���̂P]
		if(outside_num == GetFlagID_("CONST_SS_OS_CONTACT_DARTHGARUMA")){		// Num10 = 16
			local id_boss1 = ReadNpc_("m180_00"); // �_�[�X�K���}
			g_npc_garuma = ArrangePointNpc_(id_boss1, "npc_ura_boss");
			// NPC���f���̃��b�V���\��
			SetMeshVisible_(g_npc_garuma, "Model",       true); // �{��
			SetMeshVisible_(g_npc_garuma, "cover",       true); // ����Ă��Ȃ��J�o�[
			SetMeshVisible_(g_npc_garuma, "breakCover", false); // ����Ă���J�o�[
			SetMeshVisible_(g_npc_garuma, "arm",        false); // �r
			SetMeshVisible_(g_npc_garuma, "head",       false); // ��(��)
			// �T�C�Y
			SetScaleSilhouette(g_npc_garuma, SCALE.G, SILHOUETTE_WIDTH.G);
			SetTalkEnable_(g_npc_garuma, false);
			SetReactorMsg_(g_npc_garuma, "NPC_DARTHGARUMA_REC");
			SetVisible(g_npc_garuma, true);
			// �܂��܂������I�[��
			LoadEffect_("ef730_01_oth_dark_aura01");
			local g_npc_garuma_eff = SetSelectBoneEffect_("ef730_01_oth_dark_aura01", g_npc_garuma, ATTACH_EFFECT2);
		}
		// �_�[�X�K���}[���̂Q]
		else if(outside_num == GetFlagID_("CONST_SS_OS_CONTACT_DARTH_2")){		// Num10 = 21
			local id_boss1 = ReadNpc_("m180_00"); // �_�[�X�K���}
			g_npc_garuma = ArrangePointNpc_(id_boss1, "npc_ura_boss");
			// NPC���f���̃��b�V���\��
			SetMeshVisible_(g_npc_garuma, "Model",       true); // �{��
			SetMeshVisible_(g_npc_garuma, "cover",       true); // ����Ă��Ȃ��J�o�[
			SetMeshVisible_(g_npc_garuma, "breakCover", false); // ����Ă���J�o�[
			SetMeshVisible_(g_npc_garuma, "arm",         true); // �r
			SetMeshVisible_(g_npc_garuma, "head",       false); // ��(��)
			// �T�C�Y
			SetScaleSilhouette(g_npc_garuma, SCALE.G, SILHOUETTE_WIDTH.G);
			SetTalkEnable_(g_npc_garuma, false);
			SetReactorMsg_(g_npc_garuma, "NPC_DARTHGARUMA_REC");
			SetVisible(g_npc_garuma, true);
			// �܂��܂������I�[��
			LoadEffect_("ef730_01_oth_dark_aura01");
			local g_npc_garuma_eff = SetSelectBoneEffect_("ef730_01_oth_dark_aura01", g_npc_garuma, ATTACH_EFFECT2);
		}
		// �_�[�X�K���}[���̂R]
		else if(outside_num == GetFlagID_("CONST_SS_OS_CONTACT_DARTH_3")){		// Num10 = 26
			local id_boss1 = ReadNpc_("m180_00"); // �_�[�X�K���}
			g_npc_garuma = ArrangePointNpc_(id_boss1, "npc_ura_boss");
			// NPC���f���̃��b�V���\��
			SetMeshVisible_(g_npc_garuma, "Model",       true); // �{��
			SetMeshVisible_(g_npc_garuma, "cover",      false); // ����Ă��Ȃ��J�o�[
			SetMeshVisible_(g_npc_garuma, "breakCover",  true); // ����Ă���J�o�[
			SetMeshVisible_(g_npc_garuma, "arm",         true); // �r
			SetMeshVisible_(g_npc_garuma, "head",        true); // ��(��)
			// �T�C�Y
			SetScaleSilhouette(g_npc_garuma, SCALE.G, SILHOUETTE_WIDTH.G);
			SetTalkEnable_(g_npc_garuma, false);
			SetReactorMsg_(g_npc_garuma, "NPC_DARTHGARUMA_REC");
			SetVisible(g_npc_garuma, true);
			// �܂��܂������I�[��
			LoadEffect_("ef730_01_oth_dark_aura01");
			local g_npc_garuma_eff = SetSelectBoneEffect_("ef730_01_oth_dark_aura01", g_npc_garuma, ATTACH_EFFECT2);
			SetEffectScale_(g_npc_garuma_eff, 1.5);
		}
	}
	// ���_�O�W���K���}
	if(main_num == GetFlagID_("CONST_SM_INSIDE_CLEAR")){						// Num 0 = 9
		// �_�O�W���K���}
		if(outside_num == GetFlagID_("CONST_SS_OS_CONTACT_DAGJAGARUMA")){		// Num10 = 31
			local id_boss2 = ReadNpc_("m186_00"); // �_�O�W���K���}
			g_npc_garuma = ArrangePointNpc_(id_boss2, "npc_ura_boss2");
			SetScaleSilhouette(g_npc_garuma, SCALE.G, SILHOUETTE_WIDTH.G);
			SetTalkEnable_(g_npc_garuma, false);
			SetReactorMsg_(g_npc_garuma, "NPC_DAGUJAGARUMA_REC");
			SetVisible(g_npc_garuma, true);
			// �܂��܂������I�[��
			LoadEffect_("ef730_01_oth_dark_aura01");
			local g_npc_garuma_eff = SetSelectBoneEffect_("ef730_01_oth_dark_aura01", g_npc_garuma, ATTACH_EFFECT2);
			SetEffectScale_(g_npc_garuma_eff, 1.7);
		}
	}
	// ���A���}
	if(main_num == GetFlagID_("CONST_SM_INSIDE_CLEAR")){					// Num 0 = 9
		// �_�[�X�K���}[���̂P]�Đ펞( Num10 == 16 )
		if(outside_num == GetFlagID_("CONST_SS_OS_CONTACT_DARTHGARUMA")){
			g_npc_aroma = ReadAndArrangePointNpc("n018", "npc_aroma_rematch");
			SetTalkCameraType_(g_npc_aroma, TALK_CAMERA_UP);
			SetReactorMsg_(g_npc_aroma, "NPC_AROMA_REC");
			// ��b�J�������ɓ��߂����̂ŃA���t�@�l��ݒ肷��
			SetManualCalcAlpha_(g_npc_aroma, true);
			SetAlpha_(g_npc_aroma, 1.0);
		}
		// �_�[�X�K���}[���̂Q]�Đ펞( Num10 == 21 )
		else if(outside_num == GetFlagID_("CONST_SS_OS_CONTACT_DARTH_2")){
			g_npc_aroma = ReadAndArrangePointNpc("n018", "npc_aroma_rematch");
			SetTalkCameraType_(g_npc_aroma, TALK_CAMERA_UP);
			SetReactorMsg_(g_npc_aroma, "NPC_AROMA_REC");
			// ��b�J�������ɓ��߂����̂ŃA���t�@�l��ݒ肷��
			SetManualCalcAlpha_(g_npc_aroma, true);
			SetAlpha_(g_npc_aroma, 1.0);
		}
		// �_�[�X�K���}[���̂R]�Đ펞( Num10 == 26 )
		else if(outside_num == GetFlagID_("CONST_SS_OS_CONTACT_DARTH_3")){
			g_npc_aroma = ReadAndArrangePointNpc("n018", "npc_aroma_rematch");
			SetTalkCameraType_(g_npc_aroma, TALK_CAMERA_UP);
			SetReactorMsg_(g_npc_aroma, "NPC_AROMA_REC");
			// ��b�J�������ɓ��߂����̂ŃA���t�@�l��ݒ肷��
			SetManualCalcAlpha_(g_npc_aroma, true);
			SetAlpha_(g_npc_aroma, 1.0);
		}
		// �_�O�W���K���}�Đ펞( Num10 == 31 )
		else if(outside_num == GetFlagID_("CONST_SS_OS_CONTACT_DAGJAGARUMA")){
			g_npc_aroma = ReadAndArrangePointNpc("n018", "npc_aroma_rematch");
			SetTalkCameraType_(g_npc_aroma, TALK_CAMERA_UP);
			SetReactorMsg_(g_npc_aroma, "NPC_AROMA_REC");
			// ��b�J�������ɓ��߂����̂ŃA���t�@�l��ݒ肷��
			SetManualCalcAlpha_(g_npc_aroma, true);
			SetAlpha_(g_npc_aroma, 1.0);
		}
		else if(outside_num == GetFlagID_("CONST_SS_OS_EXAMINE_STAR_SEED")){		// Num10 = 34
			g_npc_aroma = ReadAndArrangePointNpc("n018", "npc_aroma");
			SetTalkCameraType_(g_npc_aroma, TALK_CAMERA_UP);
			SetReactorMsg_(g_npc_aroma, "NPC_AROMA_REC");
			// ��b�J�������ɓ��߂����̂ŃA���t�@�l��ݒ肷��
			SetManualCalcAlpha_(g_npc_aroma, true);
			SetAlpha_(g_npc_aroma, 1.0);
			// �X�^�[�V�[�h
			LoadEffect_("ef732_26_star_seed_base02");
			local star_seed = SetPointWorldEffect_("ef732_26_star_seed_base02", "ef_star_piece");
		}
	}
	
	
	//-----------
	// ���n���z�u
	//-----------
	// ID������
	g_mine_event_02	 <- C_NONE_ID;
	g_mine_event_03	 <- C_NONE_ID;
	g_mine_event_04	 <- C_NONE_ID;
	g_mine_event_05	 <- C_NONE_ID;
	g_mine_event_06	 <- C_NONE_ID;
	g_mine_event_07	 <- C_NONE_ID;
	g_mine_star_seed <- C_NONE_ID;
	
	// ���C�x���g�n��
	if (main_num == GetFlagID_("CONST_SM_CORE")) {								// Num0 = 7
		if(core_num == GetFlagID_("CONST_SS_CO_APPROACH_RENATE")				// Num8 = 12
		|| core_num == GetFlagID_("CONST_SS_CO_CONTACT_GARUBIRUSU")) {			// Num8 = 15
			g_mine_event_02 = SetPointCircleEventMine_("mine_event_02", false);	// �K���r���X�Đ�f���p
		}
	}
	// �����V�i���I�p�C�x���g�n��
	if(main_num == GetFlagID_("CONST_SM_INSIDE_CLEAR")){							// Num 0 = 9
		// �{�X��p�n��
		if(outside_num == GetFlagID_("CONST_SS_OS_GO_TO_MOTHER_ROOM")){				// Num10 = 13
			// �f���C�x���g�p
			g_mine_event_03 = SetPointCircleEventMine_("mine_event_02", false);
		}
		// �{�X�Đ�p�n��(�_�[�X�K���}���̂P)
		else if(outside_num == GetFlagID_("CONST_SS_OS_CONTACT_DARTHGARUMA")){		// Num10 = 16
			g_mine_event_04 = SetPointCircleEventMine_("mine_event_02", false);
		}
		// �{�X�Đ�p�n��(�_�[�X�K���}���̂Q)
		else if(outside_num == GetFlagID_("CONST_SS_OS_CONTACT_DARTH_2")){			// Num10 = 21
			g_mine_event_05 = SetPointCircleEventMine_("mine_event_02", false);
		}
		// �{�X�Đ�p�n��(�_�[�X�K���}���̂R)
		else if(outside_num == GetFlagID_("CONST_SS_OS_CONTACT_DARTH_3")){			// Num10 = 26
			g_mine_event_06 = SetPointCircleEventMine_("mine_event_02", false);
		}
		// �{�X�Đ�p�n��(�_�O�W���K���})
		else if(outside_num == GetFlagID_("CONST_SS_OS_CONTACT_DAGJAGARUMA")){		// Num10 = 34
			g_mine_event_07 = SetPointCircleEventMine_("mine_event_02", false);
		}
		// �X�^�[�V�[�h
		else if(outside_num == GetFlagID_("CONST_SS_OS_EXAMINE_STAR_SEED")){		// Num10 = 34
			g_mine_star_seed = SetPointCircleEventMine_("mine_star_piece", true);
		}
	}
	
	
	
	//---------------------
	// �����A�N�^�[�|�C���g
	//---------------------
	// ���R�[���h�X���[�v
	local rec_point_sleep = ArrangeMsgReactorPoint("rec_sleep", GetFlagID_("BFG_REACTER_POINT_118")// Bit_1617 �R�[���h�X���[�v
		, SHORT_DIST, "REC_POINT_SLEEP_010", "REC_POINT_SLEEP_020");
	// ���X�^�[�V�[�h
	if(main_num == GetFlagID_("CONST_SM_INSIDE_CLEAR") && outside_num == GetFlagID_("CONST_SS_OS_EXAMINE_STAR_SEED")){
		local reactorPoint02  = ArrangeMsgReactorPoint("ReactorPoint_02", GetFlagID_("BFG_REACTER_POINT_119")
			, SHORT_DIST, "REC_POINT_02_01", "REC_POINT_02_02");
	}
	
	//---------------------
	// ���a�f�l�𖳉��ɐݒ�
	//---------------------
	if(main_num == GetFlagID_("CONST_SM_INSIDE_CLEAR")){				// Num 0 == 9
		if(outside_num == GetFlagID_("CONST_SS_OS_EXAMINE_STAR_SEED")){	// Num10 == 34
			// �����ɂ���
			SetEventFlg_("BFG_C00_03_EVENT_BGM_NONE", true);
		}
		else{
			// �����ɂ��Ȃ�
			SetEventFlg_("BFG_C00_03_EVENT_BGM_NONE", false);
		}
	}
	else{
		// �����ɂ��Ȃ�
		SetEventFlg_("BFG_C00_03_EVENT_BGM_NONE", false);
	}
	
	EventEnd_();
}


//------------------------------------------------
//		�t�B�[���h����J�n
//------------------------------------------------
function EventStartOperate()
{
	main_num = GetNumFlg_("NUM_SCENARIO_MAIN");		// Num0
	core_num = GetNumFlg_("NUM_SCENARIO_SUB_CORE");	// Num8
	sky_num	 = GetNumFlg_("NUM_SCENARIO_SUB_SKY");	// Num9
	
	//-------------
	// ���f���̍Đ�
	//-------------
	// �R�A�V�i���I
	if(main_num == GetFlagID_("CONST_SM_CORE")){										// Num0 = 7
		// ���y���}�b�v����ړ����Ă�����
		if(core_num == GetFlagID_("CONST_SS_CO_CHECK_UP_ANSESU")){						// Num8 = 6
			SetNumFlg_(core_num_sub, GetFlagID_("CONST_SS_CO_PRE_BATTLE_DARK_MASTER"));	// Num8 = 7
			//�f���Đ���̔z�u���W���w��
			SetReturnDemoPosDir_(Vec3(-4.5, 188.8, -688.1), 0);
			
			// ���[���E���C�h�E�܂񂽂�֎~������
			SetEventFlg_("BFG_RIDE_INPUT_PROHIBIT", false);				// ���C�h�֎~(Bit435)
			SetEventFlg_("BFG_PLAYERABILITY_RULER_PROHIBIT", false);	// ���[���֎~(Bit440)
			SetEventFlg_("BFG_PLAYERABILITY_MANTAN_PROHIBIT", false);	// �܂񂽂�֎~(Bit444)
			
			// Demo608[�����̌Z�̐��́F�R�AMap]�i�J�V�����b�g�E�A�p�f�}�N�Ɛ퓬�j
			SetFade_(FADE_OUT, FADE_COLOR_WHITE, FADE_SHORT);
			SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
			WaitFade_();
			ChangeDemo_(608); 
		}
		// ���J�V�����b�g�A�A�p�f�}�N��ŕ��������̍Đ폈��
		else if(core_num == GetFlagID_("CONST_SS_CO_CONTACT_DARK_MASTER")) {				// Num8 = 9
			//�t���O��i�s������
			SetNumFlg_(core_num_sub, GetFlagID_("CONST_SS_CO_PRE_REMATCH_DARK_MASTER"));// Num8 = 10
			// Demo609[�J�V�����b�g�A�A�p�f�}�N�Đ�]�Đ�
			EventStartChangeDemo(609, FADE_COLOR_BLACK);
		}
		// ���K���r���X���̘A���f���Đ�
		else if(core_num == GetFlagID_("CONST_SS_CO_VIOLENT_GARUBIRUSU")){					// Num8 = 18
			// ����V�i���I�J�n��NUM�t���O�ɐݒ�
			SetNumFlg_(main_num_sub, GetFlagID_("CONST_SM_SKY"));						// Num0 = 8
			SetNumFlg_(core_num_sub, 0);												// Num8 = 0
			SetNumFlg_(sky_num_sub, GetFlagID_("CONST_SS_SK_CONFESSIONS_RENATE_1"));	// Num9 = 0
			// �嗤�ړ����u�̎g�p���֎~����
			SetEventFlg_("BFG_DONT_TRANSFER_GREEN_TO_CITY",   true);// ����-�����Ԃ̑嗤�ړ����u�̎g�p���֎~����t���O
			SetEventFlg_("BFG_DONT_TRANSFER_CITY_TO_GRAVE",   true);// ����-�쓹�Ԃ̑嗤�ړ����u�̎g�p���֎~����t���O
			SetEventFlg_("BFG_DONT_TRANSFER_GRAVE_TO_ICE",    true);// �쓹-�X���Ԃ̑嗤�ړ����u�̎g�p���֎~����t���O
			SetEventFlg_("BFG_DONT_TRANSFER_ICE_TO_SAND",     true);// �X��-�����Ԃ̑嗤�ړ����u�̎g�p���֎~����t���O
			SetEventFlg_("BFG_DONT_TRANSFER_SAND_TO_VOLCANO", true);// ����-�ΎR�Ԃ̑嗤�ړ����u�̎g�p���֎~����t���O
			SetEventFlg_("BFG_DONT_TRANSFER_VOLCANO_TO_CORE", true);// �ΎR-�R�A�Ԃ̑嗤�ړ����u�̎g�p���֎~����t���O
			// �t���C�g�V�O�i���̎g�p���֎~����
			SetEventFlg_("BFG_WEATHER_BLACK_POLLEN_CITY",     true);// �s�s�������ԕ��ɕ����Ă��邩�ǂ���
			SetEventFlg_("BFG_WEATHER_BLACK_POLLEN_GRAVE",    true);// ��n�������ԕ��ɕ����Ă��邩�ǂ���
			SetEventFlg_("BFG_WEATHER_BLACK_POLLEN_ICE",      true);// �X���������ԕ��ɕ����Ă��邩�ǂ���
			SetEventFlg_("BFG_WEATHER_BLACK_POLLEN_SAND",     true);// �č��������ԕ��ɕ����Ă��邩�ǂ���
			SetEventFlg_("BFG_WEATHER_BLACK_POLLEN_VOLCANO",  true);// �ΎR�������ԕ��ɕ����Ă��邩�ǂ���
			// �f���Đ���̃}�b�v���w��
			SetReturnDemoMap_("H02_00");
			SetReturnDemoPosDir_(Vec3(-0.216, 0.0, 2.33), 145);
			// Demo614[�K���r���X�̖\���F���E�������ԕ�������]
			EventStartChangeDemo(614, FADE_COLOR_BLACK);
		}
	}
	
	// ���V�i���I(Demo829[���i�[�e�̉��]�Đ���ɘA���Đ�)
	if(main_num == GetFlagID_("CONST_SM_INSIDE_CLEAR")){						 // Num 0 =  9
		if(outside_num == GetFlagID_("CONST_SS_OS_EXAMINE_STAR_SEED_2")){		 // Num10 = 35
			SetNumFlg_(outside_num_sub, GetFlagID_("CONST_SS_OS_TALKED_AROMA")); // Num10 = 36
			//�f���Đ���̃}�b�v���w��
			SetReturnDemoMap_("A01_00");
			SetReturnDemoPosDir_(Vec3(0.00, 2.50, 235.50), 180);
			// Demo830[�l�ނ̕����A������]
			EventStartChangeDemo(830, FADE_COLOR_BLACK);
		}
	}

	
	//-------------
	// ���퓬�J�n
	//-------------
	// ��[�J�V�����b�g���A�p�f�}�N��]
	if(main_num == GetFlagID_("CONST_SM_CORE")){										// Num0 = 7
		if(core_num == GetFlagID_("CONST_SS_CO_PRE_BATTLE_DARK_MASTER")){				// Num8 = 7
			SetNumFlg_(core_num_sub, GetFlagID_("CONST_SS_CO_JDG_BATTLE_DARK_MASTER"));	// Num8 = 8
			ChangeBattleParty_(20);	// �J�V�����b�g���A�p�f�}�N��
		}
		// ��[�J�V�����b�g���A�p�f�}�N�Đ�]
		else if(core_num == GetFlagID_("CONST_SS_CO_PRE_REMATCH_DARK_MASTER")){			// Num8 = 10
			SetNumFlg_(core_num_sub, GetFlagID_("CONST_SS_CO_JDG_REMATCH_DARK_MASTER"));// Num8 = 11
			ChangeBattleParty_(20);	// �J�V�����b�g���A�p�f�}�N��
		}
		
		//-------------
		// ���퓬����
		//-------------
		if(core_num == GetFlagID_("CONST_SS_CO_JDG_BATTLE_DARK_MASTER")					// Num8 = 8 (���펞)
		|| core_num == GetFlagID_("CONST_SS_CO_JDG_REMATCH_DARK_MASTER")){				// Num8 = 11(�Đ펞)
			// ����
			if (GetBattleEndType_() == BATTLE_END_TYPE_WIN){
				SetNumFlg_(core_num_sub, GetFlagID_("CONST_SS_CO_APPROACH_RENATE"));	// Num8 = 12
				SetEventFlg_("BFG_C00_03_EVENT_BGM008_PLAY", false);					// Bit664 : C00_03 BGM_008 �𗬂�
				
				// �f����ɐݒ肳����l���̈ʒu�ƌ���
				SetReturnDemoPosDir_(Vec3(-4.5, 188.8, -688.1), 0);
				// Demo610[�_�[�N�}�X�^�[�̍Ŋ�]�Đ�
				EventStartChangeDemo(610, FADE_COLOR_BLACK);
			// �s�k
			}else{
				// �����ł͔s�k���肪�ł��Ȃ��̂�
				// AfterBattle()�Ŕs�k�̔���ƃt���O�ύX���s���B
			}
		}
	}
	// ��[�K���r���X��]
	if(main_num == GetFlagID_("CONST_SM_CORE")){										// Num0 = 7
		if(core_num == GetFlagID_("CONST_SS_CO_PRE_BATTLE_GARUBIRUSU")){				// Num8 = 13
			SetNumFlg_(core_num_sub, GetFlagID_("CONST_SS_CO_JDG_BATTLE_GARUBIRUSU"));	// Num8 = 14
			ChangeBattleParty_(21);	// �K���r���X��
		}
		// ��[�K���r���X�Đ�]
		else if(core_num == GetFlagID_("CONST_SS_CO_PRE_REMATCH_GARUBIRUSU")){			// Num8 = 16
			SetNumFlg_(core_num_sub, GetFlagID_("CONST_SS_CO_JDG_REMATCH_GARUBIRUSU"));	// Num8 = 17
			ChangeBattleParty_(21);	// �K���r���X�Đ�
		}
	
		//-------------
		// ���퓬����
		//-------------
		if(core_num == GetFlagID_("CONST_SS_CO_JDG_BATTLE_GARUBIRUSU")					// Num8 = 14(���펞)
		|| core_num == GetFlagID_("CONST_SS_CO_JDG_REMATCH_GARUBIRUSU")){				// Num8 = 17(�Đ펞)
			// ����
			if (GetBattleEndType_() == BATTLE_END_TYPE_WIN){
				SetNumFlg_(core_num_sub, GetFlagID_("CONST_SS_CO_VIOLENT_GARUBIRUSU"));	// Num8 = 18
				// �f����ɐݒ肳����l���̈ʒu�ƌ���
				SetReturnDemoPosDir_(Vec3(-504.0, 341.0, -592.0), 40);
				// Demo613[�K���r���X�̖\���F�R�AMap]�Đ�
				EventStartChangeDemo(613, FADE_COLOR_BLACK);
			// �s�k
			}else{
				// �����ł͔s�k���肪�ł��Ȃ��̂�
				// AfterBattle()�Ŕs�k�̔���ƃt���O�ύX���s���B
			}
		}
	}
	// ���_�[�X�K���}��
	if(main_num == GetFlagID_("CONST_SM_INSIDE_CLEAR")){									// Num 0 =  9
		// �_�[�X�K���}(���̂P)
		if(outside_num == GetFlagID_("CONST_SS_OS_PRE_BATTLE_DARTHGARUMA")){				// Num10 = 14
			SetNumFlg_(outside_num_sub, GetFlagID_("CONST_SS_OS_JDG_BATTLE_DARTHGARUMA"));	// Num10 = 15
			ChangeBattleParty_(170);
		}
		// �Đ�
		else if(outside_num == GetFlagID_("CONST_SS_OS_PRE_REMATCH_DARTHGARUMA")){			// Num10 = 17
			SetNumFlg_(outside_num_sub, GetFlagID_("CONST_SS_OS_JDG_REMATCH_DARTHGARUMA"));	// Num10 = 18
			ChangeBattleParty_(170);
		}
		//-------------
		// ���퓬����  
		//-------------
		else if(outside_num == GetFlagID_("CONST_SS_OS_JDG_BATTLE_DARTHGARUMA")				// Num10 = 15
		|| outside_num == GetFlagID_("CONST_SS_OS_JDG_REMATCH_DARTHGARUMA")){				// Num10 = 18
			// ����
			if (GetBattleEndType_() == BATTLE_END_TYPE_WIN){
				// �i�s�t���O��i�߂�(�퓬�񐔂��s���Ȃ̂ŉ��Ή�)
				SetNumFlg_(outside_num_sub, GetFlagID_("CONST_SS_OS_PRE_BATTLE_DAGJAGARUMA"));	// Num10 = 29
				// �_�[�X�K���}�E�_�O�W���K���}�̍Đ�f���͋��ʂȂ̂ŏ���������t���O��i�߂Ă���(�_�[�X�K���}�͐퓬�Ő؂�ւ���)
				SetNumFlg_("NUM_FLG_COUNT_UP_DEMO_834", 3);
				// Demo835[�_�[�X�K���}�ϐg]�Đ�
				EventStartChangeDemo(835, FADE_COLOR_BLACK);
			// �s�k
			}else{
				// �����ł͔s�k���肪�ł��Ȃ��̂�
				// AfterBattle()�Ŕs�k�̔���ƃt���O�ύX���s���B
			}
		}
		// �_�[�X�K���}(���̂Q)�Đ�
		else if(outside_num == GetFlagID_("CONST_SS_OS_PRE_REMATCH_DARTH_2")){			// Num10 = 22
			SetNumFlg_(outside_num_sub, GetFlagID_("CONST_SS_OS_JDG_REMATCH_DARTH_2"));	// Num10 = 23
			ChangeBattleParty_(171);
		}
		//-------------
		// ���퓬����
		//-------------
		else if(outside_num == GetFlagID_("CONST_SS_OS_JDG_REMATCH_DARTH_2")){			// Num10 = 23
			// ����
			if (GetBattleEndType_() == BATTLE_END_TYPE_WIN){
				// �i�s�t���O��i�߂�(�퓬�񐔂��s���Ȃ̂ŉ��Ή�)
				SetNumFlg_(outside_num_sub, GetFlagID_("CONST_SS_OS_PRE_BATTLE_DAGJAGARUMA"));	// Num10 = 29
				// �_�[�X�K���}�E�_�O�W���K���}�̍Đ�f���͋��ʂȂ̂ŏ���������t���O��i�߂Ă���(�_�[�X�K���}�͐퓬�Ő؂�ւ���)
				SetNumFlg_("NUM_FLG_COUNT_UP_DEMO_834", 3);
				// Demo835[�_�[�X�K���}�ϐg]�Đ�
				EventStartChangeDemo(835, FADE_COLOR_BLACK);
			// �s�k
			}else{
				// �����ł͔s�k���肪�ł��Ȃ��̂�
				// AfterBattle()�Ŕs�k�̔���ƃt���O�ύX���s���B
			}
		}

		// �_�[�X�K���}(���̂R)�Đ�
		else if(outside_num == GetFlagID_("CONST_SS_OS_PRE_REMATCH_DARTH_3")){			// Num10 = 27
			SetNumFlg_(outside_num_sub, GetFlagID_("CONST_SS_OS_JDG_REMATCH_DARTH_3"));	// Num10 = 28
			ChangeBattleParty_(172);
		}
		//-------------
		// ���퓬����  
		//-------------
		else if(outside_num == GetFlagID_("CONST_SS_OS_JDG_REMATCH_DARTH_3")){			// Num10 = 28
			// ����
			if (GetBattleEndType_() == BATTLE_END_TYPE_WIN){
				// �i�s�t���O��i�߂�(�퓬�񐔂��s���Ȃ̂ŉ��Ή�)
				SetNumFlg_(outside_num_sub, GetFlagID_("CONST_SS_OS_PRE_BATTLE_DAGJAGARUMA"));	// Num10 = 29
				// �_�[�X�K���}�E�_�O�W���K���}�̍Đ�f���͋��ʂȂ̂ŏ���������t���O��i�߂Ă���(�_�[�X�K���}�͐퓬�Ő؂�ւ���)
				SetNumFlg_("NUM_FLG_COUNT_UP_DEMO_834", 3);
				// Demo835[�_�[�X�K���}�ϐg]�Đ�
				EventStartChangeDemo(835, FADE_COLOR_BLACK);
			// �s�k
			}else{
				// �����ł͔s�k���肪�ł��Ȃ��̂�
				// AfterBattle()�Ŕs�k�̔���ƃt���O�ύX���s���B
			}
		}
	}
	// ���_�O�W���K���}��
	if(main_num == GetFlagID_("CONST_SM_INSIDE_CLEAR")){									// Num 0 =  9
		// �_�O�W���K���}
		if(outside_num == GetFlagID_("CONST_SS_OS_PRE_BATTLE_DAGJAGARUMA")){				// Num10 = 29
			SetNumFlg_(outside_num_sub, GetFlagID_("CONST_SS_OS_JDG_BATTLE_DAGJAGARUMA"));	// Num10 = 30
			ChangeBattleParty_(173);
		}
		// �_�O�W���K���}�Đ�
		else if(outside_num == GetFlagID_("CONST_SS_OS_PRE_REMATCH_DAGJAGARUMA")){			// Num10 = 32
			SetNumFlg_(outside_num_sub, GetFlagID_("CONST_SS_OS_JDG_REMATCH_DAGJAGARUMA"));	// Num10 = 33
			ChangeBattleParty_(173);
		}
		//-------------
		// ���퓬����  
		//-------------
		else if(outside_num == GetFlagID_("CONST_SS_OS_JDG_BATTLE_DAGJAGARUMA")				// Num10 = 30
		|| outside_num == GetFlagID_("CONST_SS_OS_JDG_REMATCH_DAGJAGARUMA")){				// Num10 = 33
			// ����
			if (GetBattleEndType_() == BATTLE_END_TYPE_WIN){
				// �i�s�t���O��i�߂�
				SetNumFlg_(outside_num_sub, GetFlagID_("CONST_SS_OS_EXAMINE_STAR_SEED"));	// Num10 = 34
				// �S��
				RecoverAll_();
				// �f����ɐݒ肳����l���̈ʒu�ƌ���
				SetReturnDemoPosDir_(Vec3(-7.549, 231.202, -352.768), -10);
				// Demo828[�_�[�X�K���}�ɏ���]�Đ�
				EventStartChangeDemo(828, FADE_COLOR_BLACK);
			// �s�k
			}else{
				// �����ł͔s�k���肪�ł��Ȃ��̂�
				// AfterBattle()�Ŕs�k�̔���ƃt���O�ύX���s���B
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
	// �b��������Ώۂ�NPC��������
	local target = GetTargetId_();
	switch(target)
	{
	case g_npc_aroma:
		uTalkAroma();
		break;
	default:
		break;
	}
	
	EventEnd_();
}

//------------------------------------------------
//		�n���ڐG��
//------------------------------------------------
function TouchEventMine()
{
	main_num = GetNumFlg_("NUM_SCENARIO_MAIN");		// Num0
	core_num = GetNumFlg_("NUM_SCENARIO_SUB_CORE");	// Num8
	sky_num	 = GetNumFlg_("NUM_SCENARIO_SUB_SKY");	// Num9
	
	local target = GetTouchEventMineId_();
	
	DebugPrint("ID: " + target + " �ɐڐG [TouchEventMine]");
	
	switch (target) {
	case g_mine_event_02 :	//�}�U�[���[���̒n��(���i�[�e�t��)
		uMineEvent02();
		break;
	case g_mine_event_03:
		DeleteEventMine_(g_mine_event_03);
		g_mine_event_03 <- C_NONE_ID;
		uMineEvent03();
		break;
	case g_mine_event_04:
		DeleteEventMine_(g_mine_event_04);
		g_mine_event_04 <- C_NONE_ID;
		uMineEvent04();
		break;
	case g_mine_event_05:
		DeleteEventMine_(g_mine_event_05);
		g_mine_event_05 <- C_NONE_ID;
		uMineEvent05();
		break;
	case g_mine_event_06:
		DeleteEventMine_(g_mine_event_06);
		g_mine_event_06 <- C_NONE_ID;
		uMineEvent06();
		break;
	case g_mine_event_07:
		DeleteEventMine_(g_mine_event_07);
		g_mine_event_07 <- C_NONE_ID;
		uMineEvent07();
		break;
	case g_mine_star_seed:
		uPlayerTurnAroundStarSeed(); // CommPlayerTurnAroundObj()���g���Ƃ��������Ȃ�̂�
		uMineEventStarSeed(g_mine_star_seed);
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
//	�}�U�[���[��(���i�[�e�t��)�̒n���ɐG�ꂽ��
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineEvent02()
{
	if (main_num == GetFlagID_("CONST_SM_CORE")) {										// Num0 = 7
		if (core_num == GetFlagID_("CONST_SS_CO_APPROACH_RENATE")) {					// Num8 = 12
			DeleteEventMine_(g_mine_event_02);
			//�t���O��i�s������
			SetNumFlg_(core_num_sub, GetFlagID_("CONST_SS_CO_PRE_BATTLE_GARUBIRUSU"));	// Num8 = 13
			//Demo611[�����̃K���r���X]�i�K���r���X�Ɛ퓬�j
			ChangeDemo_(611);
		}
		else if (core_num == GetFlagID_("CONST_SS_CO_CONTACT_GARUBIRUSU")) {			// Num8 = 15
			DeleteEventMine_(g_mine_event_02);
			//�t���O��i�s������
			SetNumFlg_(core_num_sub, GetFlagID_("CONST_SS_CO_PRE_REMATCH_GARUBIRUSU"));	// Num8 = 16
			//Demo612[�K���r���X�Đ�]�Đ�
			ChangeDemo_(612);
		}
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//	���V�i���I�Ń}�U�[���[���t�߂̒n���ɐG�ꂽ��
//------------------------------------------------
//	����	: �폜�n��
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineEvent03()
{
	//�t���O��i�s������
	SetNumFlg_(outside_num_sub, GetFlagID_("CONST_SS_OS_PRE_BATTLE_DARTHGARUMA"));	// Num10 = 13
	// Demo826[�Ō�̎���]
	ChangeDemo_(826);
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//	���V�i���I�Ń_�[�X�K���}�Đ펞�̒n���ɐG�ꂽ��
//------------------------------------------------
//	����	: �폜�n��
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineEvent04()
{
	//�t���O��i�s������
	SetNumFlg_(outside_num_sub, GetFlagID_("CONST_SS_OS_PRE_REMATCH_DARTHGARUMA")); // Num10 = 17
	// Demo827[�_�[�X�K���}�Đ�]
	ChangeDemo_(827);
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//	���V�i���I�Ń_�[�X�K���}2�Đ펞�̒n���ɐG�ꂽ��
//------------------------------------------------
//	����	: �폜�n��
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineEvent05()
{
	//�t���O��i�s������
	SetNumFlg_(outside_num_sub, GetFlagID_("CONST_SS_OS_PRE_REMATCH_DARTH_2")); // Num10 = 22
	// Demo827[�_�[�X�K���}�Đ�]
	ChangeDemo_(827);
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//	���V�i���I�Ń_�[�X�K���}3�Đ펞�̒n���ɐG�ꂽ��
//------------------------------------------------
//	����	: �폜�n��
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineEvent06()
{
	//�t���O��i�s������
	SetNumFlg_(outside_num_sub, GetFlagID_("CONST_SS_OS_PRE_REMATCH_DARTH_3")); // Num10 = 27
	// Demo827[�_�[�X�K���}�Đ�]
	ChangeDemo_(827);
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//	���V�i���I�Ń_�O�W���K���}�Đ펞�̒n���ɐG�ꂽ��
//------------------------------------------------
//	����	: �폜�n��
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineEvent07()
{
	//�t���O��i�s������
	SetNumFlg_(outside_num_sub, GetFlagID_("CONST_SS_OS_PRE_REMATCH_DAGJAGARUMA")); // Num10 = 32
	// Demo827[�_�[�X�K���}�Đ�]
	ChangeDemo_(827);
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//	���V�i���I�Ń}�U�[���[���t�߂̒n���ɐG�ꂽ��
//------------------------------------------------
//	����	: �폜�n��
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineEventStarSeed(mine)
{
	DeleteEventMine_(mine);
	//�t���O��i�s������
	SetNumFlg_(outside_num_sub, GetFlagID_("CONST_SS_OS_EXAMINE_STAR_SEED_2"));	// Num8 = 35
	// Demo829[���i�[�e�̉��]
	ChangeDemo_(829);
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//   �A���}�̉�b���e
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkAroma()
{
	// �i�s�t���O�̏�Ԃ��擾
	main_num    = GetNumFlg_("NUM_SCENARIO_MAIN");				// Num0
	outside_num = GetNumFlg_("NUM_SCENARIO_SUB_INSIDE_CLEAR");	// Num10

	if(main_num == GetFlagID_("CONST_SM_INSIDE_CLEAR")){				// NUM000 =  9

		// �_�[�X�K���}[���̂P]�Đ펞( Num10 == 16 )
		if(outside_num == GetFlagID_("CONST_SS_OS_CONTACT_DARTHGARUMA")){
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_AROMA");
			ShowMsg_("AROMA_REMATCH_MSG");
			KeyInputWait_();
			CloseMsgWnd_();
		}
		// �_�[�X�K���}[���̂Q]�Đ펞( Num10 == 21 )
		else if(outside_num == GetFlagID_("CONST_SS_OS_CONTACT_DARTH_2")){
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_AROMA");
			ShowMsg_("AROMA_REMATCH_MSG");
			KeyInputWait_();
			CloseMsgWnd_();
		}
		// �_�[�X�K���}[���̂R]�Đ펞( Num10 == 26 )
		else if(outside_num == GetFlagID_("CONST_SS_OS_CONTACT_DARTH_3")){
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_AROMA");
			ShowMsg_("AROMA_REMATCH_MSG");
			KeyInputWait_();
			CloseMsgWnd_();
		}
		// �_�O�W���K���}�Đ펞( Num10 == 31 )
		else if(outside_num == GetFlagID_("CONST_SS_OS_CONTACT_DAGJAGARUMA")){
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_AROMA");
			ShowMsg_("AROMA_REMATCH_MSG");
			KeyInputWait_();
			CloseMsgWnd_();
		}
		// Demo828[�_�[�X�K���}�ɏ���]�̍Đ���( Num10 == 34 )
		else if(outside_num == GetFlagID_("CONST_SS_OS_EXAMINE_STAR_SEED")){
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_AROMA");
			ShowMsg_("AROMA_MSG_001");
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		�`�F���W�f��
//------------------------------------------------
//	����	: number	�f���ԍ�
//			: color		�t�F�[�h�̐F
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uFadeChangeDemo(number, color)
{
	// �uuFadeChangeDemo()�v��EventCommon.nut�́uEventStartChangeDemo()�v�͓��������Ȃ̂ŁA��ł��̊֐��͏����ĉ������Bby ��{
	EventStartChangeDemo(number, color);
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		�m�o�b�E�n���ڐG���`�F���W�f��
//------------------------------------------------
//	����	: number	�f���ԍ�
//			: color		�t�F�[�h�̐F
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTouchChangeDemo(number, color)
{
	SetFade_(FADE_OUT, color, FADE_DEF);
	SetFadeSub_(FADE_OUT, color, FADE_DEF);
	WaitFade_();
	
	ChangeDemo_(number);
}

//++++++++++++++++++++++++++++++++++++++++++++++++
// ��l�����X�^�[�V�[�h�̕����Ɍ�����
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uPlayerTurnAroundStarSeed()
{
	local player = GetPlayerId_();
	local starseed_pos = Vec3(-15.854, 245.046, -334.479);
	local rotateTask = Task_RotateToPosSetMotion_(player, starseed_pos, ROTATE_EVENT_DEF, MOT_WALK, MOT_WAIT);
	WaitTask(rotateTask);
	// �Ԃ���������
	Wait_(15);
}

