//===================== S02_02�C�b�^�u���č� 3F ====================

// �ϐ���`
main_num	 <- C_NONE_ID;					// ���C���t���O
prison_num	 <- C_NONE_ID;					// �V�i���I�T�u�t���O

str_num_sub	 <- "NUM_SCENARIO_SUB_PRISON";	// �V�i���I�T�u�t���O�̒萔�� : Num6

//------------------------------------------------
//		�퓬�I����
//------------------------------------------------
function AfterBattle()
{
	main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");
	prison_num	 = GetNumFlg_("NUM_SCENARIO_SUB_PRISON");
	
	local battle_result = GetBattleEndType_();
	
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {										// Num0 = 5
		// �C�b�^�u���� �s�k��
		if (prison_num == GetFlagID_("CONST_SS_PR_BATTLE_ITTABURU_START")					// Num6 = 22 or
		 || prison_num == GetFlagID_("CONST_SS_PR_REMATCH_ITTABURU_START")) {				// Num6 = 26
			if(battle_result == END_TYPE_LOSE){
				SetNumFlg_(str_num_sub, GetFlagID_("CONST_SS_PR_BATTLE_ITTABURU_LOSE"));	//Num6 = 23
				SetEventFlg_("BFG_LIMIT_1F_ALL", false);	// Bit_1242 �č��P�K�Ƀ����X�^�[��z�u
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
	main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");
	prison_num	 = GetNumFlg_("NUM_SCENARIO_SUB_PRISON");
	
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
	main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");			// Num0
	prison_num	 = GetNumFlg_("NUM_SCENARIO_SUB_PRISON");	// Num6
	
	DebugPrint(" ");
	DebugPrint("NUM_SCENARIO_MAIN �̒l�� " + main_num + " �ɂȂ�܂����B");
	DebugPrint("NUM_SCENARIO_SUB_PRISON �̒l�� " + prison_num + " �ɂȂ�܂����B");
	
	// �����X�^�[���o��������ŏ�������ݒ�(���P�ʂ�1=10cm)
	SetMonsterGenPlayerInvasionAreaMin_(-1)	// �������f�t�H���g�l�ɖ߂�
	
	// ���C�b�^�u�����j�܂Œ����̒ʘH���ӂɃ����X�^�[��z�u���Ȃ�
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num < GetFlagID_("CONST_SS_PR_INVULNERABILITY_PLAYER")) {		// Num6 < 28
			SetEventFlg_("BFG_LIMIT_3F_CENTER_PATHWAY", false);				// Bit_1226 �C�b�^�u�����j�i�����̒ʘH���ӂɃ����X�^�[��z�u�j
		} else {
			SetEventFlg_("BFG_LIMIT_3F_CENTER_PATHWAY", true);				// Bit_1226 �C�b�^�u�����j�i�����̒ʘH���ӂɃ����X�^�[��z�u�j
		}
	} else {
		SetEventFlg_("BFG_LIMIT_3F_CENTER_PATHWAY", true);					// Bit_1226 �C�b�^�u�����j�i�����̒ʘH���ӂɃ����X�^�[��z�u�j
	}
	
	//----------
	// ��NPC�z�u
	//----------
	// ID������
	g_npc_ittaburu		 <- C_NONE_ID;

	// ���C�b�^�u��
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num == GetFlagID_("CONST_SS_PR_BATTLE_ITTABURU_LOSE")			// Num6 = 23
		|| prison_num == GetFlagID_("CONST_SS_PR_PRE_REMACHI_ITTABURU")) {			// Num6 = 24
			local id_ittaburu	 = ReadNpc_("m205_00");		// �C�b�^�u��
			g_npc_ittaburu		 = ArrangePointNpc_(id_ittaburu, "npc_ittaburu000");
			SetReactorMsg_(g_npc_ittaburu, "REC_NPC_ITTABURU");
			// �Í��̃I�[����Z�킹��
			LoadEffect_("ef730_01_oth_dark_aura01");
			local efc_aura = SetSelectBoneEffectSetOffset_("ef730_01_oth_dark_aura01", g_npc_ittaburu, ATTACH_EFFECT2, Vec3(0.0, -10.0, 0.0));
		}
		else {
			// �ݒu���Ȃ�
		}
	}
	
	//-----------
	// ���n���z�u
	//-----------
	// ID������
	g_mine_demo417		 <- C_NONE_ID;
	g_mine_demo419		 <- C_NONE_ID;
	g_mine_door01		 <- C_NONE_ID;
	g_mine_door02		 <- C_NONE_ID;
	g_mine_ruler		 <- C_NONE_ID;
	g_mine_break_monster_event <- C_NONE_ID;
	
	// ��Demo417�N���n��
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num == GetFlagID_("CONST_SS_PR_BLAST_STRATEGY")) {				// Num6 = 20
			g_mine_demo417 = SetPointBoxEventMine_("mine_demo417", false);
		}
	}
	
	// ��Demo419�N���n��
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num == GetFlagID_("CONST_SS_PR_BATTLE_ITTABURU_LOSE")			// Num6 = 23
		|| prison_num == GetFlagID_("CONST_SS_PR_PRE_REMACHI_ITTABURU")) {			// Num6 = 24
			g_mine_demo419 = SetPointBoxEventMine_("mine_demo419", false);
		}
	}
	
	// �����b�N���n��
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num < GetFlagID_("CONST_SS_PR_BLAST_STRATEGY")) {				// Num6 < 20
			g_mine_door01 = SetPointCircleEventMine_("mine_door01", true);
			g_mine_door02 = SetPointCircleEventMine_("mine_door02", true);
		}
	}
	
	// �����[���|�C���g(�C�b�^�u���č� ���䎺)
	g_mine_ruler = SetPointCircleEventMine_("mine_ruler", true);
	
	// ���������X�^�[�C�x���g�p
	g_mine_break_monster_event = SetPointCircleEventMine_("mine_break_monster_event", true);

	//---------------
	// ���M�~�b�N�z�u
	//---------------
	// ID������
	g_gmk_door01		 <- C_NONE_ID;
	g_gmk_door02		 <- C_NONE_ID;
	g_gmk_rulerpoint	 <- C_NONE_ID;
	
	// ���\�[�X�ǂݍ���
	local id_rulerpoint		 = ReadGimmick_("o_com_08");	// ���[���|�C���g

	// �����b�N��
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num < GetFlagID_("CONST_SS_PR_BLAST_STRATEGY")) {				// Num6 < 20
			local id_door	= ReadGimmick_("o_S02_04");				// ���b�N��
			g_gmk_door01	= ArrangePointGimmick_("o_S02_04", id_door, "gmk_door01");
			g_gmk_door02	= ArrangePointGimmick_("o_S02_04", id_door, "gmk_door02");
		}
	}

	// ���p�C�v�̊W�i�J�j
	local id_paipu_open	 = ReadGimmick_("o_S02_22");				// �p�C�v�̊W�i�J�j
	local gmk_paipu_open = ArrangePointGimmick_("o_S02_22", id_paipu_open, "gmk_paipu_open");

	// �����䑕�u
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num < GetFlagID_("CONST_SS_PR_INVULNERABILITY_PLAYER")) {		// Num6 < 28
			local id_souti	 = ReadGimmick_("o_S02_09");
			local gmk_souti	 = ArrangePointGimmick_("o_S02_09", id_souti, "gmk_souti");
		} else {
			// �����䑕�u�i���j
			local id_souti_brake	 = ReadGimmick_("o_S02_12");
			local gmk_souti_brake	 = ArrangePointGimmick_("o_S02_12", id_souti_brake, "gmk_souti_brake");
		}
	} else {
		// �����䑕�u�i���j
		local id_souti_brake	 = ReadGimmick_("o_S02_12");
		local gmk_souti_brake	 = ArrangePointGimmick_("o_S02_12", id_souti_brake, "gmk_souti_brake");
	}


	// �����[���|�C���g(�C�b�^�u���č� ���䎺)�����̈ʒu�ɒu���Ă��܂�
	g_gmk_rulerpoint = ArrangePointGimmick_("o_com_08", id_rulerpoint, "g_rulerpoint");
	SetMotion_(g_gmk_rulerpoint, MOT_GIMMICK_0, BLEND_N);
	if(GetEventFlg_("BFG_RULER_ADD_019") == true){				// Bit_219 ���[���ǉ� �C�b�^�u���č� ���䎺
		SetMotion_(g_gmk_rulerpoint, MOT_GIMMICK_2, BLEND_N);
	}

	//-------------------------
	// �����A�N�^�[�|�C���g�z�u
	//-------------------------
	// �����C�����䑕�u
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num < GetFlagID_("CONST_SS_PR_INVULNERABILITY_PLAYER")) {		// Num6 < 28
			local reactorPoint01 = ArrangeMsgReactorPoint("recpoint_01_monitar", GetFlagID_("BFG_REACTER_POINT_078")// Bit_1577 ���C�����䑕�u
				, SHORT_DIST, "REC_POINT_01", "REC_POINT_01_2");
		}
	}
	
	// �����[���|�C���g(�C�b�^�u���č� ���䎺)
	local reactorPoint02 = ArrangeMsgReactorPoint("reactorPoint_ruler", GetFlagID_("BFG_REACTER_POINT_010")// Bit_1520 ���[���|�C���g
		, SHORT_DIST, "REC_POINT_02", "REC_POINT_02_2");
	
	//-----------------
	// ���}�b�v�i�r�z�u
	//-----------------
	// �����[���|�C���g�A�C�R��
	if(GetEventFlg_("BFG_RULER_ADD_019") == true){				// Bit_219 ���[���ǉ� �C�b�^�u���č� ���䎺
		local icon01 = ArrangePointNaviMapIcon_(NAVIMAP_ICON.RULER_POINT , "g_rulerpoint");
		SetNaviMapIconVisible_(icon01, true);
	}
	
	EventEnd_();
}


//------------------------------------------------
//		�t�B�[���h����J�n
//------------------------------------------------
function EventStartOperate()
{
	main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");			// Num0
	prison_num	 = GetNumFlg_("NUM_SCENARIO_SUB_PRISON");	// Num6
	local player = GetPlayerId_();
	
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {									// Num0 = 5
		// ���T�K�̍L�Ԃ�ڎw���Ă��鎞�̃��A�N�^�[���b�Z�[�W
		if (prison_num == GetFlagID_("CONST_SS_PR_MEETING_02")) {						// Num6 = 13
			local bit_rec_msg = GetEventFlg_("BFG_DISPLAYED_LEADING_5F_MSG_3F");	// Bit_1234 ���A�N�^�[�̗U��MSG���Đ�����
			if (!bit_rec_msg){
				SetEventFlg_("BFG_DISPLAYED_LEADING_5F_MSG_3F", true);				// Bit_1234 ���A�N�^�[�̗U��MSG���Đ�����
				
				// �K�i��o�肫��܂ő҂�
				Wait_(25);
				SetMotion_(player, MOT_WAIT, BLEND_XL);
				Wait_(BLEND_XL);
				
				// ���A�N�^�[�����t�����b�Z�[�W
				CommReactorActionNotice();			// ���A�N�^�[���������������̋��ʏ���
				OpenMsgWnd_();
				SetTalkName_("NAME_TAG_REACTOR");	// ���A�N�^�[
				ShowMsg_("REACTER_MSG_000");		// �u�T�K�� �����X�^�[�����̏��Ȃ� �L�Ԃ𔭌��B
				KeyInputWait_();
				CloseMsgWnd_();
				CommResetPlayerMotion();			// ���[�V������ҋ@��Ԃɖ߂����ʏ���
			}
		}
		// ���C�b�^�u�� �퓬�J�n
		if (prison_num == GetFlagID_("CONST_SS_PR_ITTABURU_INTERFERENCE")) {			// Num6 = 21
			SetNumFlg_(str_num_sub, GetFlagID_("CONST_SS_PR_BATTLE_ITTABURU_START"));	// Num6 <- 22
			
			// VS.�C�b�^�u��
			ChangeBattleParty_(17);
		}
		else if (prison_num == GetFlagID_("CONST_SS_PR_REMACHI_ITTABURU")) {			// Num6 = 25
			SetNumFlg_(str_num_sub, GetFlagID_("CONST_SS_PR_REMATCH_ITTABURU_START"));	// Num6 <- 26
			
			// VS.�C�b�^�u��
			ChangeBattleParty_(17);
		}
		
		// ���C�b�^�u�� �퓬����
		if (prison_num == GetFlagID_("CONST_SS_PR_BATTLE_ITTABURU_START")				// Num6 = 22 or
		 || prison_num == GetFlagID_("CONST_SS_PR_REMATCH_ITTABURU_START")) {			// Num6 = 26
			SetNumFlg_(str_num_sub, GetFlagID_("CONST_SS_PR_ITTABURU_WIN"));			// Num6 <- 27
			SetEventFlg_("BFG_LIMIT_1F_ALL", true);	// Bit_1242 �č��P�K�Ƀ����X�^�[��z�u
			// �f���Đ���̕��A�ʒu
			SetReturnDemoMap_("S01_00");
			SetReturnDemoPosDir_(Vec3(-77.0, 0.0, 51.0), 0);
			
			// Demo420[�C�b�^�u���폟��]�Đ�
			EventStartChangeDemo(420, FADE_COLOR_BLACK);
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
	prison_num	 = GetNumFlg_("NUM_SCENARIO_SUB_PRISON");	// Num6
	
	local target = GetTargetId_();
	
	DebugPrint(" ");
	DebugPrint("ID: " + target + " �ɐڐG [TouchNpc]");
	
	switch (target) {
	case g_npc_ittaburu :
		// ��b�Ȃ�
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
	prison_num	 = GetNumFlg_("NUM_SCENARIO_SUB_PRISON");
	
	local target = GetTouchEventMineId_();
	
	DebugPrint(" ");
	DebugPrint("ID: " + target + " �ɐڐG [TouchEventMine]");
	
	switch (target) {
	case g_mine_demo417 :
		uMineDemo417Start();
		break;
	case g_mine_demo419 :
		uMineDemo419Start();
		break;
	case g_mine_door01 :
		uMineDoor01();
		break;
	case g_mine_door02 :
		uMineDoor02();
		break;
	case g_mine_ruler :
		uMineRuler();
		break;
	case g_mine_break_monster_event :
		uMineBreakMonsterEvent();
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
//		���L�� ��b����
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkRukiya()
{
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num < GetFlagID_("CONST_SS_PR_BLAST_EXPLANATION_1ST")) {			// Num6 < 16
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_RUKIYA");	//���L��
			ShowMsg_("NPC_RUKIYA_MSG_100");		// �u�S�K�̉E��� �󂫕���������B
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		Demo417�N���n���ɐG�ꂽ��
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineDemo417Start()
{
	SetNumFlg_(str_num_sub, GetFlagID_("CONST_SS_PR_ITTABURU_INTERFERENCE"));		// Num6 <- 21
	
	// Demo417[�C�b�^�u���̖W�Q]�Đ�
	TouchNpcChangeDemo(417);
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		Demo419�N���n���ɐG�ꂽ��
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineDemo419Start()
{
	SetNumFlg_(str_num_sub, GetFlagID_("CONST_SS_PR_REMACHI_ITTABURU"));		// Num6 <- 25
	
	// Demo419[�C�b�^�u���Đ�]�Đ�
	StopBgmChangeDemo(419);
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		���b�N���n���@�ɐG�ꂽ��
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineDoor01()
{
	CommPlayerTurnAroundObj(g_gmk_door01);
	OpenMsgWnd_();
	ShowMsg_("SYSTEM_MSG_999");		// �i���j���ɂ� ���b�N���������Ă���B
	KeyInputWait_();
	CloseMsgWnd_();
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		���b�N���n���A�ɐG�ꂽ��
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineDoor02()
{
	CommPlayerTurnAroundObj(g_gmk_door02);
	OpenMsgWnd_();
	ShowMsg_("SYSTEM_MSG_999");		// �i���j���ɂ� ���b�N���������Ă���B
	KeyInputWait_();
	CloseMsgWnd_();
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		���[���|�C���g�ɐG�ꂽ��
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineRuler()
{
	CommPlayerTurnAroundObj(g_gmk_rulerpoint);
	CommRulerPointEvent(g_gmk_rulerpoint, "BFG_RULER_ADD_019", "g_rulerpoint"); 
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		�������X�^�[�C�x���g�p�̒n��
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineBreakMonsterEvent()
{
	CommPlayerTurnAroundDir(180);
	// �č��R�K�ɂ���z�����u�ɋ��G�X�^�[�N�����̃A�C�e�����߂Â�����A�u�͂��v��I���������H
	if(GetEventFlg_("BFG_BLENDING_BREAK_ESTARK_ITEM") == false){
		// �������X�^�[�쐬�����̃`�F�b�N
		if(CommCheckBreakEstarkMaking() == true){
			// �G�[�X���狥�����X�^�[�����A�C�e���̐����𕷂������H
			if(GetEventFlg_("BFG_DISPLAYED_BREAK_ESTARK_MSG") == true){
				// ���G�X�^�[�N���������Ă��Ȃ����`�F�b�N
				if(GetNumFlg_("NUM_BREAK_ESTARK_PHASE") == 0){		 // Num018 == 0
					OpenMsgWnd_();
					ShowMsg_("BREAK_ESTARK_EVENT_MSG_002_01");
					KeyInputWait_();
					ShowMsg_("BREAK_ESTARK_EVENT_MSG_002_02");
					KeyInputWait_();
					if(GetQueryResult_() == MES_QUERY_YES){
						CloseMsgWnd_();
						// �č��R�K�ɂ���z�����u�ɋ��G�X�^�[�N�����̃A�C�e�����߂Â�����A�u�͂��v��I���������H�t���O�𗧂Ă�
						SetEventFlg_("BFG_BLENDING_BREAK_ESTARK_ITEM", true);
						// �������X�^�[�̐i�s�t���O��i�߂�
						SetNumFlg_("NUM_BREAK_ESTARK_PHASE", 1);
						// �������X�^�[�������o
						uBreakMonsterRevival();
					}
					else{
						CloseMsgWnd_();
					}
				}
				// �������Ă��邪�A���Ԃɂ��Ă��Ȃ�
				else if(GetNumFlg_("NUM_BREAK_ESTARK_PHASE") >= 1
					&&  GetNumFlg_("NUM_BREAK_ESTARK_PHASE") <= 6){ // Num018 �� 1 �ȏ� 6 �ȉ�
					// �n�k���o�{���b�Z�[�W�̕\��
					uEarthQuakeAndMsg();
				}
				// �������āA���Ԃɂ����B
				else{ 												// Num018 �� 0 �` 6 �ȊO
					OpenMsgWnd_();
					ShowMsg_("BREAK_ESTARK_EVENT_MSG_000");
					KeyInputWait_();
					CloseMsgWnd_();
				}
			}
			else{
				OpenMsgWnd_();
				ShowMsg_("BREAK_ESTARK_EVENT_MSG_001");
				KeyInputWait_();
				CloseMsgWnd_();
			}
		}
		else{
			OpenMsgWnd_();
			ShowMsg_("BREAK_ESTARK_EVENT_MSG_001");
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
	else{
		// ���G�X�^�[�N�𒇊Ԃɂ��Ă��Ȃ��ꍇ
		if(GetNumFlg_("NUM_BREAK_ESTARK_PHASE") >= 1
		&& GetNumFlg_("NUM_BREAK_ESTARK_PHASE") <= 6){ // Num018 �� 1 �ȏ� 6 �ȉ�
			// �n�k���o�{���b�Z�[�W�̕\��
			uEarthQuakeAndMsg();
		}
		// ���G�X�^�[�N�͕������Ă��Ȃ�(�ʂ�Ȃ��͂�)
		else if(GetNumFlg_("NUM_BREAK_ESTARK_PHASE") == 0){
			OpenMsgWnd_();
			ShowMsg_("BREAK_ESTARK_EVENT_MSG_000");
			KeyInputWait_();
			CloseMsgWnd_();
		}
		// ���G�X�^�[�N�𒇊Ԃɂ��Ă���ꍇ
		else{
			OpenMsgWnd_();
			ShowMsg_("BREAK_ESTARK_EVENT_MSG_000");
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		�������X�^�[�������o
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uBreakMonsterRevival()
{
	local fade_spd = 15;
	// 1.�Ó](���b�Z�[�W�E�B���h�E�\���ł���Ó]�ɂ���)
	SetFadePlane_(FADE_PLANE.PLANE_3D);
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, fade_spd);
	SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, fade_spd);
	WaitFade_();
	Wait_(fade_spd);
	// 2.�A�C�e���̌��Z
	AddItem_(BREAK_ESTARK_01_ID, -1);
	AddItem_(BREAK_ESTARK_02_ID, -1);
	AddItem_(BREAK_ESTARK_03_ID, -1);
	AddItem_(BREAK_ESTARK_04_ID, -1);
	AddItem_(BREAK_ESTARK_05_ID, -1);
	// 3.���b�Z�[�W�i�߂Â����A�C�e���́c
	OpenMsgWnd_();
	ShowMsg_("BREAK_ESTARK_EVENT_MSG_003");
	KeyInputWait_();
	CloseMsgWnd_();
	// 4. �z���}�V���̋N�����̍Đ�
	PlaySE_("SE_SYS_021");
	Wait_(115);
	// 5.�Ó]����
	SetFade_(FADE_IN, FADE_COLOR_BLACK, fade_spd);
	SetFadeSub_(FADE_IN, FADE_COLOR_BLACK, fade_spd);
	WaitFade_();
	SetFadePlane_(FADE_PLANE.PLANE_NORMAL);
	Wait_(fade_spd);
	// �n�k���o�{���b�Z�[�W�̕\��
	uEarthQuakeAndMsg();
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		�n�k���o�{���b�Z�[�W�̕\��
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uEarthQuakeAndMsg()
{
	local earth_quake_frame = 20;
	local earth_quake_wait  = 25;
	// 6.�n�k��������
	PlaySE_("SE_DEM_014");
	StartDecayEarthQuake_(earth_quake_frame, 3, 5);
	Wait_(earth_quake_wait);
	// 7.���b�Z�[�W�i����̂ق��Łc
	OpenMsgWnd_();
	ShowMsg_("BREAK_ESTARK_EVENT_MSG_004");
	KeyInputWait_();
	CloseMsgWnd_();
}

