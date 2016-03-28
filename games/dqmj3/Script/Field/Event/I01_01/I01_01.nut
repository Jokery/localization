//===================== I01_01�X�̗쉀 ====================


//------------------------------------------------
//		�퓬�I����
//------------------------------------------------
function AfterBattle()
{
	local main_num			= GetNumFlg_("NUM_SCENARIO_MAIN");							// Num0
	local ice_event_num		= GetNumFlg_("NUM_SCENARIO_SUB_ICE");						// Num5

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
	local main_num			 = GetNumFlg_("NUM_SCENARIO_MAIN");							// Num0
	local ice_event_num		 = GetNumFlg_("NUM_SCENARIO_SUB_ICE");						// Num5
	
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
	local main_num			 = GetNumFlg_("NUM_SCENARIO_MAIN");							// Num0
	local ice_event_num		 = GetNumFlg_("NUM_SCENARIO_SUB_ICE");						// Num5

	DebugPrint(" ");
	DebugPrint("NUM_SCENARIO_MAIN �̒l�� " + main_num + " �ɂȂ�܂����B");
	//----------
	// ��NPC�z�u
	//----------
	// ID������
	g_gost		 <- C_NONE_ID;
	g_silver	 <- C_NONE_ID;

	// ���\�[�X�ǂݍ���
	local id_silver   = ReadNpc_("m077_00");	// �V���o�[���f��
	local id_gost     = ReadNpc_("m041_02");	// �H�샂�f��(�����C�W�����񂶂�)

	// ���H��
	// �X���V�i���I��
	if(main_num <= GetFlagID_("CONST_SM_ICE_FIELD")){									// Num0 = 4
		g_gost  = ArrangePointNpc_(id_gost,  "NPC_02");
		SetReactorMsg_(g_gost, "NPC_GOST_REC");
		SetTalkCameraType_(g_gost, TALK_CAMERA_UP);//�J�����̐ݒ�
		SetScaleSilhouette(g_gost, SCALE.N , SILHOUETTE_WIDTH.N);//�T�C�Y�̐ݒ�
	}
	// �č��V�i���I�ȍ~
	else{
		g_gost  = ArrangePointNpc_(id_gost,  "NPC_01_2");
		SetDir_(g_gost, -154);
		SetReactorMsg_(g_gost, "NPC_GOST_REC");
		SetTalkCameraType_(g_gost, TALK_CAMERA_UP);//�J�����̐ݒ�
		SetScaleSilhouette(g_gost, SCALE.N , SILHOUETTE_WIDTH.N);//�T�C�Y�̐ݒ�
	}

	// ���V���o�[
	if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){									// Num0 = 4
		//[�����Ă����V���o�[]�̍Đ��ォ��[�C�G�^�X�̎���]�̍Đ���
		if(ice_event_num == GetFlagID_("CONST_SS_IF_EXAMINE_THE_ICE_WALL"))				// Num5 = 18
		{
			g_silver  = ArrangePointNpc_(id_silver,  "NPC_01");
			SetReactorMsg_(g_silver, "NPC_SILVER_REC");
			SetTalkCameraType_(g_silver, TALK_CAMERA_UP);//�J�����̐ݒ�
			SetScaleSilhouette(g_silver, SCALE.N ,SILHOUETTE_WIDTH.N);//�T�C�Y�̐ݒ�
		}
		if( ice_event_num == GetFlagID_("CONST_SS_IF_SECOND_ATTACK"))					// Num5 = 19
		{
			g_silver  = ArrangePointNpc_(id_silver,  "NPC_01_2");
			SetReactorMsg_(g_silver, "NPC_SILVER_REC");
			SetTalkCameraType_(g_silver, TALK_CAMERA_UP);//�J�����̐ݒ�
			SetScaleSilhouette(g_silver, SCALE.N ,SILHOUETTE_WIDTH.N);//�T�C�Y�̐ݒ�
		}
	}
	//-----------
	// ���n���z�u
	//-----------
	// ID������
	g_mine01	 <- C_NONE_ID;
	g_mine02	 <- C_NONE_ID;
	g_mine_disc	 <- C_NONE_ID;

	if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){									// Num0 = 4
		// ���X�̗쉀�̒��ɂ���A�V���o�[�̊��̒n��
		if(ice_event_num == GetFlagID_("CONST_SS_IF_GO_TO_THE_ICE_CEMETERY")){			// Num5 = 17
			g_mine01 = SetPointCircleEventMine_("mine01", true);
		}
		// ���X�̗쉀�̒��ɂ���A�l���X�ǂ̒n��
		if(ice_event_num == GetFlagID_("CONST_SS_IF_EXAMINE_THE_ICE_WALL")){			// Num5 = 18
			g_mine02 = SetPointCircleEventMine_("mine02", true);
		}
	}
	
	// �����^���f�B�X�N
	if(GetEventFlg_("BFG_PLAYED_METAL_DISC_MSG") == false){	// ���^���f�B�X�N���胁�b�Z�[�W���������H
		if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){									// Num0 = 4
			if(ice_event_num >= GetFlagID_("CONST_SS_IF_EXAMINE_THE_ICE_WALL")){			// Num5 = 18
				g_mine_disc = SetPointCircleEventMine_("mine_disc", false);
			}
		}
		else if(main_num >= GetFlagID_("CONST_SM_PRISON")){									// Num0 = 5
			g_mine_disc = SetPointCircleEventMine_("mine_disc", false);
		}
	}
	
	//-----------------
	// ���G�t�F�N�g�z�u
	//-----------------
	// ID������
	g_efc_disc <- C_NONE_ID;
	
	// �����^���f�B�X�N
	if(GetEventFlg_("BFG_PLAYED_METAL_DISC_MSG") == false){	// ���^���f�B�X�N���胁�b�Z�[�W���������H
		if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){									// Num0 = 4
			if(ice_event_num >= GetFlagID_("CONST_SS_IF_EXAMINE_THE_ICE_WALL")){			// Num5 = 18
				LoadEffect_("EF300_40_ITEM_SIGN");
				g_efc_disc = SetPointWorldEffect_("EF300_40_ITEM_SIGN", "efc_disc");
			}
		}
		else if(main_num >= GetFlagID_("CONST_SM_PRISON")){									// Num0 = 5
			LoadEffect_("EF300_40_ITEM_SIGN");
			g_efc_disc = SetPointWorldEffect_("EF300_40_ITEM_SIGN", "efc_disc");
		}
	}
	
	//---------------
	// ���M�~�b�N�z�u
	//---------------
	// ���\�[�X�ǂݍ���
	local id_yetas			 = ReadGimmick_("o_dem_08");
	local id_hitugi_futa	 = ReadGimmick_("o_I01_03");
	local id_hitugi			 = ReadGimmick_("o_I01_04");
	local id_hitugi_open	 = ReadGimmick_("o_I01_05");
	
	// ���C�G�^�X�̎���
	local yetas = ArrangePointGimmick_("o_dem_08", id_yetas, "g_yetas");

	// ���l���X��
	if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){									// Num0 = 4
		if(ice_event_num <= GetFlagID_("CONST_SS_IF_EXAMINE_THE_ICE_WALL")){			// Num5 <= 18
			local id_aice_wall	 = ReadGimmick_("o_I01_01");
			local aice_wall		 = ArrangePointGimmick_("o_I01_01", id_aice_wall, "g_aice_wall");
		} else {
			local id_break_aice_wall = ReadGimmick_("o_I01_02");
			local break_aice_wall	 = ArrangePointGimmick_("o_I01_02", id_break_aice_wall, "g_aice_wall");
		}
	} else {
		local id_break_aice_wall = ReadGimmick_("o_I01_02");
		local break_aice_wall	 = ArrangePointGimmick_("o_I01_02", id_break_aice_wall, "g_aice_wall");
	}
	
	// ������
	local hitugi = ArrangePointGimmick_("o_I01_04", id_hitugi, "g_hitugi");

	// �������̊W�i������ԁj
	if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){									// Num0 = 4
		if(ice_event_num < GetFlagID_("CONST_SS_IF_EXAMINE_THE_ICE_WALL")){				// Num5 < 18
			local hitugi_futa = ArrangePointGimmick_("o_I01_03", id_hitugi_futa, "g_hitugi_futa");
		}
	}
	
	// �������̊W�i�J������ԁj
	if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){									// Num0 = 4
		if(ice_event_num >= GetFlagID_("CONST_SS_IF_EXAMINE_THE_ICE_WALL")){			// Num5 >= 18
			local hitugi_open = ArrangePointGimmick_("o_I01_05", id_hitugi_open, "g_hitugi_open");
		}
	} else {
		local hitugi_open = ArrangePointGimmick_("o_I01_05", id_hitugi_open, "g_hitugi_open");
	}

	//-------------------------
	// �����A�N�^�[�|�C���g�z�u
	//-------------------------
	// ���l���X��
	if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){									// Num0 = 4
		if(ice_event_num <= GetFlagID_("CONST_SS_IF_EXAMINE_THE_ICE_WALL")){			// Num5 <= 18
			local reactorPoint01 = ArrangeMsgReactorPoint("recpoint_01_kabe", GetFlagID_("BFG_REACTER_POINT_060")// Bit_1559
				, SHORT_DIST, "REC_POINT_ICE_01", "REC_POINT_ICE_01_2");
		}
	}

	// ���X�̊��� �P�|�W
	local reactorPoint02_1 = ArrangeMsgReactorPoint("recpoint_02_kanoke01", GetFlagID_("BFG_REACTER_POINT_061")// Bit_1560
		, SHORT_DIST, "REC_POINT_ICE_02", "REC_POINT_ICE_02_2");

	local reactorPoint02_2 = ArrangeMsgReactorPoint("recpoint_02_kanoke02", GetFlagID_("BFG_REACTER_POINT_061")// Bit_1560
		, SHORT_DIST, "REC_POINT_ICE_02", "REC_POINT_ICE_02_2");

	local reactorPoint02_3 = ArrangeMsgReactorPoint("recpoint_02_kanoke03", GetFlagID_("BFG_REACTER_POINT_061")// Bit_1560
		, SHORT_DIST, "REC_POINT_ICE_02", "REC_POINT_ICE_02_2");

	local reactorPoint02_4 = ArrangeMsgReactorPoint("recpoint_02_kanoke04", GetFlagID_("BFG_REACTER_POINT_061")// Bit_1560
		, SHORT_DIST, "REC_POINT_ICE_02", "REC_POINT_ICE_02_2");

	local reactorPoint02_5 = ArrangeMsgReactorPoint("recpoint_02_kanoke05", GetFlagID_("BFG_REACTER_POINT_061")// Bit_1560
		, SHORT_DIST, "REC_POINT_ICE_02", "REC_POINT_ICE_02_2");

	local reactorPoint02_6 = ArrangeMsgReactorPoint("recpoint_02_kanoke06", GetFlagID_("BFG_REACTER_POINT_061")// Bit_1560
		, SHORT_DIST, "REC_POINT_ICE_02", "REC_POINT_ICE_02_2");

	local reactorPoint02_7 = ArrangeMsgReactorPoint("recpoint_02_kanoke07", GetFlagID_("BFG_REACTER_POINT_061")// Bit_1560
		, SHORT_DIST, "REC_POINT_ICE_02", "REC_POINT_ICE_02_2");

	local reactorPoint02_8 = ArrangeMsgReactorPoint("recpoint_02_kanoke08", GetFlagID_("BFG_REACTER_POINT_061")// Bit_1560
		, SHORT_DIST, "REC_POINT_ICE_02", "REC_POINT_ICE_02_2");

	//-------------------------
	// ���i�r�}�b�v�A�C�R���z�u
	//-------------------------
	// ID������
	exclamation03 <- C_NONE_ID;
	
	// ���V���o�[�̊�
	if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){								// Num0 = 4
		if(ice_event_num < GetFlagID_("CONST_SS_IF_EXAMINE_THE_ICE_WALL")){			// Num5 < 18
			local exclamation01 = ArrangePointNaviMapIcon_(NAVIMAP_ICON.EXCLAMATION, "mine01");
		}
	}
	// ���V������
	if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){								// Num0 = 4
		if(ice_event_num == GetFlagID_("CONST_SS_IF_EXAMINE_THE_ICE_WALL")){		// Num5 = 18
			local exclamation02 = ArrangePointNaviMapIcon_(NAVIMAP_ICON.EXCLAMATION, "mine02");
		}
	}
	
	// �����^���f�B�X�N
	if(GetEventFlg_("BFG_PLAYED_METAL_DISC_MSG") == false){	// ���^���f�B�X�N���胁�b�Z�[�W���������H
		if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){									// Num0 = 4
			if(ice_event_num >= GetFlagID_("CONST_SS_IF_EXAMINE_THE_ICE_WALL")){			// Num5 = 18
				exclamation03 = ArrangePointNaviMapIcon_(NAVIMAP_ICON.EXCLAMATION, "mine_disc");
			}
		}
		else if(main_num >= GetFlagID_("CONST_SM_PRISON")){									// Num0 = 5
			exclamation03 = ArrangePointNaviMapIcon_(NAVIMAP_ICON.EXCLAMATION, "mine_disc");
		}
	}
	
	EventEnd_();
}


//------------------------------------------------
//		�t�B�[���h����J�n
//------------------------------------------------
function EventStartOperate()
{
	local main_num			= GetNumFlg_("NUM_SCENARIO_MAIN");							// Num0
	local ice_event_num		= GetNumFlg_("NUM_SCENARIO_SUB_ICE");						// Num5

	// ���H��𔼓����ɂ���
	SetManualCalcAlpha_(g_gost, true);
	SetAlpha_(g_gost, 0.3);

	EventEnd_();
}


//------------------------------------------------
//		�m�o�b�ڐG��
//------------------------------------------------
function TouchNpc()
{
	local main_num			= GetNumFlg_("NUM_SCENARIO_MAIN");							// Num0
	local ice_event_num		= GetNumFlg_("NUM_SCENARIO_SUB_ICE");						// Num5

	local target = GetTargetId_();
	
	// ���H��
	if(target == g_gost){
		// �X���V�i���I��
		if(main_num <= GetFlagID_("CONST_SM_ICE_FIELD")){									// Num0 = 4
			OpenMsgWnd_();
			ShowMsg_("DEMO_009_AFT_EST_GOST");		//�u�����Ł@�������E���ꂽ�̂��@������B
			KeyInputWait_();
			CloseMsgWnd_();
		}
		// �č��V�i���I�ȍ~
		else{
			OpenMsgWnd_();
			ShowMsg_("NPC_GOST_010");				//�u���̐l���@���ł���X��
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
	// ���V���o�[
	if(target == g_silver){
		if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){								// Num0 = 4
			//�V���o�[�Ƃ̏o���
			if(ice_event_num == GetFlagID_("CONST_SS_IF_EXAMINE_THE_ICE_WALL")){		// Num5 = 18
				OpenMsgWnd_();
				SetTalkName_("NAME_TAG_SILVER");
				ShowMsg_("DEMO_010_AFT_EST_SILV");	//�u������@����B�X�̒��Ɂ@��������
				KeyInputWait_();
				CloseMsgWnd_();
			}
			//�U�C�G�^�X���o��
			if(ice_event_num == GetFlagID_("CONST_SS_IF_SECOND_ATTACK")){				// Num5 = 19
				OpenMsgWnd_();
				SetTalkName_("NAME_TAG_SILVER");
				ShowMsg_("DEMO_011_AFT_EST_SILV");	//�u�}���Ł@���|�[���p�[�N�ɖ߂�
				KeyInputWait_();
				CloseMsgWnd_();
			}
		}
	}

	EventEnd_();
}


//------------------------------------------------
//		�n���ڐG��
//------------------------------------------------
function TouchEventMine()
{
	local main_num			= GetNumFlg_("NUM_SCENARIO_MAIN");							// Num0
	local ice_event_num		= GetNumFlg_("NUM_SCENARIO_SUB_ICE");						// Num5

	local target = GetTouchEventMineId_();
	local player = GetPlayerId_();

	switch ( target ) {
	//�V���o�[�̊��𒲂ׂ�ƃf��315[�����Ă����V���o�[]���Đ�
	case g_mine01:
		if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){								// Num0 = 4
			if(ice_event_num == GetFlagID_("CONST_SS_IF_GO_TO_THE_ICE_CEMETERY")){		// Num5 = 17
				SetNumFlg_("NUM_SCENARIO_SUB_ICE",GetFlagID_("CONST_SS_IF_EXAMINE_THE_ICE_WALL"));// Num5 <- 18
				DeleteEventMine_(g_mine01);

				SetReturnDemoPosDir_(Vec3(216.185, -2.677, -106.534), -57);
				//315[�����Ă����V���o�[]
				TouchNpcChangeDemo(315);
			}
		}
		break;

	//�l���X�ǂ𒲂ׂ�ƃf��316[�C�G�^�X�̎���]���Đ�
	case g_mine02:
		if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){								// Num0 = 4
			if(ice_event_num == GetFlagID_("CONST_SS_IF_EXAMINE_THE_ICE_WALL")){		// Num5 = 18
				SetNumFlg_("NUM_SCENARIO_SUB_ICE",GetFlagID_("CONST_SS_IF_SECOND_ATTACK"));// Num5 <- 19
				DeleteEventMine_(g_mine02);

				SetReturnDemoPosDir_(Vec3(-175.540, -44.778, -72.604), -176);

				SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
				SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
				WaitFade_();

				SetEventFlg_("BFG_MAP_ICON_028", true);

				ChangeDemo_(316);	//316[�C�G�^�X�̎���]
			}
		}
		break;
	case g_mine_disc:
		if(GetEventFlg_("BFG_PLAYED_METAL_DISC_MSG") == false){
			uPlayerTurnAroundPos(197.5, -4.5, -116.5);
			// �����f�B�X�N��MAX�ł͖�����
			if(CheckDiscMax_() == false){
				// ���b�Z�[�W�\���t���O
				SetEventFlg_("BFG_PLAYED_METAL_DISC_MSG", true);
				// ���b�Z�[�W
				OpenMsgWnd_();
				ShowMsg_("GET_METAL_DISC_MSG_1");
				PlayMe_("ME_010");  // �d�v�A�C�e������ME
				WaitMe_();
				AddSpecialDisc_(SPECIAL_DISC.METAL); // ���^���G���A�f�B�X�N
				KeyInputWait_();
				CloseMsgWnd_();
				// �A�C�e���n���A���A�N�^�[�|�C���g, �z�u�����G�t�F�N�g�̍폜
				DeleteEventMine_(g_mine_disc);
				DeleteEffect_(g_efc_disc);
				SetNaviMapIconVisible_(exclamation03, false);
			}
			// �����f�B�X�N��MAX�̎�
			else{
				// ���b�Z�[�W
				OpenMsgWnd_();
				ShowMsg_("GET_METAL_DISC_MSG_2");
				KeyInputWait_();
				CloseMsgWnd_();
				// �w������֕�������
				CommPlayerTurnMoveDirWalk(0, 40);
			}
		}
		
	default:
		DebugPrint("�ݒu����Ă��Ȃ��n���ɐڐG���肵�Ă��܂��I");
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
	local main_num			= GetNumFlg_("NUM_SCENARIO_MAIN");							// Num0
	local ice_event_num		= GetNumFlg_("NUM_SCENARIO_SUB_ICE");						// Num5

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

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//		�w�肵�����W�ɕ����Ȃ���U���������
//
//---------------------------------------------------------------------------
// �������F�w�肵�����W(Vec3)
// �߂�l  �F�Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function uPlayerTurnAroundPos(posx, posy, posz)
{
	local player    = GetPlayerId_();
	// �Ώە��̕����ɉ�](1F��11.4������])
	local rotateTask = Task_RotateToPosSetMotion_(player, Vec3(posx, posy, posz), ROTATE_EVENT_DEF MOT_WALK, MOT_WAIT);
	WaitTask(rotateTask);
	// �Ԃ���������
	Wait_(15);
}

