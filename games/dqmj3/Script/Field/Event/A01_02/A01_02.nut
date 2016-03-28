//===================== ���_�y�m�`���[���L���O�_��(B2F)�z ====================


//+++++++++++++++++++++++++++++++++++++++++++++++++
// �N�������F�퓬�I����
//-------------------------------------------------
// ��ȗp�r�F�퓬�I����Ƀt���O�𑀍삷�鎞�Ȃǂ��s��
//+++++++++++++++++++++++++++++++++++++++++++++++++
function AfterBattle()
{
	// �퓬����߂��Ă���
	// �������ꍇ
	if(GetBattleEndType_() == END_TYPE_WIN){
		// �����ł�����Ԃɂ���
		SetEventFlg_("BFG_CHALLENGE_BATTLE_CHALLENGE_WIN", true);
	} else {
		// �S��
		RecoverAll_();
		// �����ł��Ȃ�������Ԃɂ���i�s�k�A�����͓����j
		SetEventFlg_("BFG_CHALLENGE_BATTLE_CHALLENGE_WIN",false);
		// �C�x���g�i�s���I�����O�ɂ���
		SetNumFlg_("NUM_CHALLENGE_BATTLE_SUB", 3);
		// BGM�̓��o��������
		SetEventFlg_("BFG_RETURN_BATTLE_FIRLD_BGM_HEAD",true);
	}

	EventEnd_();
}

//+++++++++++++++++++++++++++++++++++++++++++++++++
// �N�������FFadeIn()���O�ɌĂ΂��
//-------------------------------------------------
// ��ȗp�r�F�f����Ƀ��C�h��Ԃ̋���������
//           ��O�I�ȃC�x���g�t���O�̐ݒ�Ȃǂ��s��
//+++++++++++++++++++++++++++++++++++++++++++++++++
function BeforeInitMap()
{
	EventEnd_();
}

//+++++++++++++++++++++++++++++++++++++++++++++++++
// �N�������F��ʐ؂�ւ��t�F�[�h�C����
//-------------------------------------------------
// ��ȗp�r�FNPC�A�n�����̓ǂݍ��݂Ɛݒu�Ȃǂ��s��
//+++++++++++++++++++++++++++++++++++++++++++++++++
function FadeIn()
{
	// �i�s�t���O�̏�Ԃ��擾
	local main_num = GetNumFlg_("NUM_SCENARIO_MAIN");
	local allclear_num = GetNumFlg_("NUM_SCENARIO_SUB_ALL_CLEAR");   // ���S�N���A��

	// BGM�̐ݒ�
	if(main_num == GetFlagID_("CONST_SM_ALL_CLEAR")){							// NUM0  == 10
		if(allclear_num <= GetFlagID_("CONST_SS_ALL_GO_TO_CENTER_BILL_B2F")){	// NUM11 <=  1
			// Demo833���Đ������܂ł͖����ɂ���
			SetEventFlg_("BFG_A01_02_EVENT_BGM_NONE", true);
		}else{
			// BGM�̖���������
			SetEventFlg_("BFG_A01_02_EVENT_BGM_NONE", false);
		}
	}
	
	
	
	// �}�b�v���B�t���O
	//SetEventFlg_("", true);// (��)�Ή�����t���O���p�ӂ���Ă��Ȃ��̂ŃR�����g��

	// �S�Œʒm�̃`�F�b�N
	if( GetEventFlg_("BFG_DEAD_RETURN") == true ){
		// �S�ŒʒmBit�t���O��false�ɖ߂�( �v���O�����ŗ��ĂăX�N���v�g�ō~�낷 )
		//�����ł͂��̏ꕜ�A�̂��߁A���������Ƀt���Ofalse
		SetEventFlg_("BFG_DEAD_RETURN", false);
	}

//--------------------------
// �M�~�b�N
	// ������
	g_lift <- C_NONE_ID;	// ��l�������t�g�̕����Ɍ����鏈��������̂ŃO���[�o���ϐ�
	
	// ���\�[�X�̓ǂݍ���
	local door_blue_id	 = ReadGimmick_("o_A01_14");// �̔�
	local door_red_id	 = ReadGimmick_("o_A01_15");// �Ԃ̔�
	local elevator_id	 = ReadGimmick_("o_A01_18");// �G���x�[�^�̔�
	local lift_id		 = ReadGimmick_("o_A01_17");// �G���x�[�^�̃��t�g
	
	
	// ���̔�
	local door_blue = ArrangePointGimmick_("o_A01_14", door_blue_id, "g_door_blue");
	
	// ���Ԃ̔�
	local door_red = ArrangePointGimmick_("o_A01_15", door_red_id, "g_door_red");
	
	// ���G���x�[�^�̔�
	local elevator = ArrangePointGimmick_("o_A01_18", elevator_id, "g_elevator");
	
	// ���G���x�[�^�̃��t�g
	g_lift = ArrangePointGimmick_("o_A01_17", lift_id, "g_elevator_lift");

//----------------------------------------------------------------
// NPC�֘A��Ǎ���
	// ������
	npc_Aroma2go <- C_NONE_ID;
	npc_Renate <- C_NONE_ID;
	npc_Nocho_D <- C_NONE_ID;
	npc_Nocho_C <- C_NONE_ID;
	npc_Citizen_Man_B <- C_NONE_ID;
	npc_Citizen_Chi_B <- C_NONE_ID;
	npc_Citizen_Wom_B <- C_NONE_ID;
	npc_Resist_Man_B <- C_NONE_ID;
	npc_Resist_Wom_B <- C_NONE_ID;
	npc_Yoncho <- C_NONE_ID;
	
	if(main_num == GetFlagID_("CONST_SM_ALL_CLEAR")){					 // NUM0  == 10
		if(allclear_num == GetFlagID_("CONST_SS_ALL_UNLOCK_BATTLE_GP")){ // NUM11 ==  2
			// �A���}�Q��
			npc_Aroma2go = ReadAndArrangePointNpc("n018", "npc_aroma2go");
			SetTalkCameraType_(npc_Aroma2go, TALK_CAMERA_UP);
			SetReactorMsg_(npc_Aroma2go, "NPC_AROMA2GO_REC");
			// ��b�J�������ɓ��߂����̂ŃA���t�@�l��ݒ肷��
			SetManualCalcAlpha_(npc_Aroma2go, true);
			SetAlpha_(npc_Aroma2go, 1.0);
			// �A�i���C�Y�̃^�[�Q�b�g����؂�ւ���(�A���}���A���}�Q��)
			SetTargetNameKey_(npc_Aroma2go, "NAME_TAG_AROMA_NO2");
			
			// ���i�[�e
			npc_Renate = ReadAndArrangePointNpc("n007", "npc_renate");
			SetTalkCameraType_(npc_Renate, TALK_CAMERA_UP);
			SetReactorMsg_(npc_Renate, "NPC_RENATE_REC");
			// ��b�J�������ɓ��߂����̂ŃA���t�@�l��ݒ肷��
			SetManualCalcAlpha_(npc_Renate, true);
			SetAlpha_(npc_Renate, 1.0);
			
			// NPC�m�`���[��D(�I�X)
			npc_Nocho_D = ReadAndArrangePointNpc("n000", "npc_nocho_d");
			SetReactorMsg_(npc_Nocho_D, "NPC_NOCHO_MEN_REC");
			
			// NPC�m�`���[��C(���X)
			npc_Nocho_C = ReadAndArrangePointNpc("n004", "npc_nocho_c");
			SetReactorMsg_(npc_Nocho_C, "NPC_NOCHO_WOMEN_REC");
			
			// �s���j�a
			npc_Citizen_Man_B = ReadAndArrangePointNpc("n015", "npc_city_man_b");
			SetReactorMsg_(npc_Citizen_Man_B, "NPC_CITIZEN_MAN_B_REC");
			
			// �s���q���a
			npc_Citizen_Chi_B = ReadAndArrangePointNpc("n017", "npc_city_child_b");
			SetReactorMsg_(npc_Citizen_Chi_B, "NPC_CITIZEN_CHILD_B_REC");
			
			// �s�����a
			npc_Citizen_Wom_B = ReadAndArrangePointNpc("n016", "npc_city_woman_b");
			SetReactorMsg_(npc_Citizen_Wom_B, "CITIZEN_WOMAN_B_REC");
			
			// ���W�X�^���X�j�a
			npc_Resist_Man_B = ReadAndArrangePointNpc("n020", "npc_resi_man_b");
			SetReactorMsg_(npc_Resist_Man_B, "RESISTANCE_MAN_B_REC");
			
			// ���W�X�^���X���a
			npc_Resist_Wom_B = ReadAndArrangePointNpc("n022", "npc_resi_woman_b");
			SetReactorMsg_(npc_Resist_Wom_B, "RESISTANCE_WOMAN_B_REC");
			
			// �����`��
			npc_Yoncho = ReadAndArrangePointNpc("n011", "npc_yoncho");
			SetReactorMsg_(npc_Yoncho, "NPC_YONCHO_REC");
			SetTargetNameKey_(npc_Yoncho, "NAME_TAG_YONCHO"); // �A�i���C�Y�̃^�[�Q�b�g����؂�ւ���(�T���`���������`��)
			SetScaleSilhouette(npc_Yoncho, SCALE.SANCHO_EVENT, SILHOUETTE_WIDTH.SANCHO_EVENT); // �T���`���̃X�P�[���l��ݒ�
			SetTalkCameraType_(npc_Yoncho, TALK_CAMERA_UP);
		}
	}

//-----------------------------
// ���A�N�^�[�|�C���g
	// �k�G���x�[�^�[
	local reactorPoint01 = ArrangeMsgReactorPoint("reactor_point_01", GetFlagID_("BFG_REACTER_POINT_105")
		, SHORT_DIST, "REC_POINT_01_01", "REC_POINT_01_02");
	// �k�o����Q�[�g
	local reactorPoint02 = ArrangeMsgReactorPoint("reactor_point_02", GetFlagID_("BFG_REACTER_POINT_106")
		, SHORT_DIST, "REC_POINT_02_01", "REC_POINT_02_02");
	// ��o����Q�[�g
	local reactorPoint03 = ArrangeMsgReactorPoint("reactor_point_03", GetFlagID_("BFG_REACTER_POINT_107")
		, SHORT_DIST, "REC_POINT_03_01", "REC_POINT_03_02");
	// �󒆍L�����u�`
	local reactorPoint04 = ArrangeMsgReactorPoint("reactor_point_04", GetFlagID_("BFG_REACTER_POINT_108")
		, SHORT_DIST, "REC_POINT_04_01", "REC_POINT_04_02");
	// �󒆍L�����u�a
	local reactorPoint05 = ArrangeMsgReactorPoint("reactor_point_05", GetFlagID_("BFG_REACTER_POINT_108")
		, SHORT_DIST, "REC_POINT_04_01", "REC_POINT_04_02");
	// �󒆍L�����u�b
	local reactorPoint06 = ArrangeMsgReactorPoint("reactor_point_06", GetFlagID_("BFG_REACTER_POINT_108")
		, SHORT_DIST, "REC_POINT_04_01", "REC_POINT_04_02");
	// �󒆍L�����u�c
	local reactorPoint07 = ArrangeMsgReactorPoint("reactor_point_07", GetFlagID_("BFG_REACTER_POINT_108")
		, SHORT_DIST, "REC_POINT_04_01", "REC_POINT_04_02");
	// �󒆍L�����u�d
	local reactorPoint08 = ArrangeMsgReactorPoint("reactor_point_08", GetFlagID_("BFG_REACTER_POINT_108")
		, SHORT_DIST, "REC_POINT_04_01", "REC_POINT_04_02");
	// ���C�u���j�^�[
	local reactorPoint09 = ArrangeMsgReactorPoint("reactor_point_09", GetFlagID_("BFG_REACTER_POINT_109")
		, SHORT_DIST, "REC_POINT_05_01", "REC_POINT_05_02");

//----------------------------------------------------------------
// �C�x���g�n����Ǎ���
	// ������
	mine_Eleveter <- C_NONE_ID;
	mine_01 <- C_NONE_ID;

	// �k�G���x�[�^
	mine_Eleveter = SetPointBoxEventMine_("mine_eleveter", true);
	// Demo833[�A���}�̒u���y�Y]�Đ��p�n��
	if(main_num == GetFlagID_("CONST_SM_ALL_CLEAR")){
		if(allclear_num == GetFlagID_("CONST_SS_ALL_GO_TO_CENTER_BILL_B2F")){
			mine_01 = SetPointBoxEventMine_("mine_01", false);
		}
	}


	EventEnd_();
}

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// �N�������F�t�B�[���h����J�n��
//------------------------------------------------------------------------------
// ��ȗp�r�F�}�b�v�؂�ւ�����̃f���Đ��E�o�g���J�n����
//           �E�퓬�I�����̃��b�Z�[�W�̕\���EWait�����݂Ȃ��瑀�삷��Ȃǂ��s��
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function EventStartOperate()
{
	//�V�i���I���C���t���O
	local main_num = GetNumFlg_("NUM_SCENARIO_MAIN");
	local allclear_num = GetNumFlg_("NUM_SCENARIO_SUB_ALL_CLEAR");   // ���S�N���A��


	// �Ђƒʂ�̏������I�������A�G���x�[�^�g�p���ɗ��ĂĂ����t���O���~�낷
	if(GetEventFlg_("BFG_CHECK_USED_ELEVATER_FADE_OFF") == true){
		// �G���x�[�^���g�p�����^�C�~���O�Ńf���𗬂��^�C�~���O�Ɣ�����ꍇ�t�F�[�h�̎�ނ�؂�ւ���ׂ̃t���O���ɖ߂�
		SetEventFlg_("BFG_CHECK_USED_ELEVATER_FADE_OFF", false);
	}

	//�C�x���g�J�n�ŕ��������
	switch ( GetNumFlg_("NUM_CHALLENGE_BATTLE_SUB") ) {
	case 1:
		// �S�Ŏ����̏ꕜ�ABit�t���O
		//�ȉ��̏����ɓ���ȏ�A�K���퓬����̂ł����ŗ��ĂĂ܂��B
		SetEventFlg_("BFG_DEAD_KEEP_MAP", true);

		//�e��폈���̌Ăяo��
		switch ( GetNumFlg_("NUM_CHALLENGE_BATTLE_MAIN") ) {
		case 0:
			uChallengeBattle_1_Before();
			break;
		case 1:
			uChallengeBattle_2_Before();
			break;
		case 2:
			uChallengeBattle_3_Before();
			break;
		case 3:
			uChallengeBattle_4_Before();
			break;
		case 4:
			uChallengeBattle_5_Before();
			break;
		default:
			DebugPrint("�z�肵�Ă��Ȃ��`�������W�o�g���̉��ł��B");
			break;
		}
		break;

	//�`�������W�o�g���̐퓬���A��
	case 2:
		//�e��폈���̌Ăяo��
		switch ( GetNumFlg_("NUM_CHALLENGE_BATTLE_MAIN") ) {
		case 0:
			uChallengeBattle_1_After();
			break;
		case 1:
			uChallengeBattle_2_After();
			break;
		case 2:
			uChallengeBattle_3_After();
			break;
		case 3:
			uChallengeBattle_4_After();
			break;
		case 4:
			uChallengeBattle_5_After();
			break;
		default:
			DebugPrint("�z�肵�Ă��Ȃ��`�������W�o�g���̉��ł��B");
			break;
		}
		break;

	//�`�������W�o�g���̒���I���Ŏ�t�O
	case 3:
		// �S�Ŏ����̏ꕜ�ABit�t���O
		//�`�������W�o�g���ł͍Ō�͂����ɂ���̂ŁA������false
		SetEventFlg_("BFG_DEAD_KEEP_MAP", false);
		
		// �S��
		RecoverAll_();
		
		//�Ō�̎�t�O�̉�b�Ăяo��
		uChallengeBattle_ChallengeEnd();
		break;

	default:
		DebugPrint("�z�肵�Ă��Ȃ��`�������W�o�g���̐i�s�x�ł��B");
		break;
	}

	//�R���V�A�����j���[�őI�΂ꂽ���ڂɂ���ď�������
	//�����������o�g���́A���j���[���Ŋ������Ă���̂ŕ��򖳂��B
	//�`�������W�o�g����I������
	if ( GetEventFlg_("BFG_COLOSSEUM_CHALLENGE_BATTLE_START") == true ) {
		SetEventFlg_("BFG_COLOSSEUM_CHALLENGE_BATTLE_START", false);
		//�P���P�񐧌��̓o�^
		SetEventDate_();

		// �����I�ɉ�b��Ԃ�ݒ�
		SetTalkCameraType_(npc_Aroma2go, TALK_CAMERA_UP);
		SetTalkAction_(npc_Aroma2go);

		// ���b�Z�[�W
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_AROMA_NO2");
		ShowMsg_("AROMA_2GO_MSG_110");			//�u�ӂӂ�@�����Ԏ�����Ȃ��B
		KeyInputWait_();

		// ��b�J�����̂܂܃t�F�[�h�A�E�g������
		FieldBgmStop_(FADE_MAPCHANGE);
		SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_MAPCHANGE);
		SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_MAPCHANGE);
		WaitFade_();
		CloseMsgWnd_();

		//�T�u�t���O�i�s
		SetNumFlg_( "NUM_CHALLENGE_BATTLE_SUB", 1 );

		//������Ƀ}�b�v�`�F���W
		SetReturnDemoMap_("A01_02");
		SetReturnDemoPosDir_(Vec3(0.0, 0.0, -20.0), 0);

		// Demo850[�`�������W�o�g���퓬�O]
		WeatherTimeChangeDemo(850);

	//��߂�EB�L�����Z����I������
	} else if ( GetEventFlg_("BFG_COLOSSEUM_END") == true ) {
		SetEventFlg_("BFG_COLOSSEUM_END", false);
		uRtnAroma2goMsg();
	}

	EventEnd_();
}

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// �N�������FFadeIn()�Ȃǂ̃C�x���g�u���b�N��ArrangePointNpc_()���s�����Ƃ�
//------------------------------------------------------------------------------
// ��ȗp�r�FFaadIn()�̃C�x���g�u���b�N�Őݒ�ł��Ȃ����Ƃ�TouchNpc()�̒��O�ōs���C�x���g�u���b�N
// ���ӓ_  �F�K���utarget�v�������ɐݒ肷�邱��
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function BeforeTalkNpc()
{
	local target = GetTargetId_();
	
	// ���C�h���Ƀ��i�[�e�ɘb�����������͎��_�̃I�t�Z�b�g�l��Y���݂̂�ύX����
	// �y���Y�^�z�unpc_info.nut�v�Ŏ��_�ƒ����_�̃I�t�Z�b�g�l�����_�̒������Ă��܂��B
	//            �Ȃ̂ŁA�R�R�ōs�����_�̃I�t�Z�b�g�l�ύX�́unpc_info.nut�v�Ō��_���������l����
	//            ����ɒ������邱�ƂɂȂ�̂ŕύX���鎞�͗v���ӁB
	if(target == npc_Renate){
		SetRideTalkCamOffset(OFFSET_RENATE);
	}

	EventEnd_();
}

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// �N�������FFadeIn()�Ȃǂ̃C�x���g�u���b�N��ArrangePointNpc_()���s�����Ƃ�
//------------------------------------------------------------------------------
// ��ȗp�r�FNPC�ɘb�������s����������
// ���ӓ_  �F�K���utarget�v�������ɐݒ肷�邱��
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function TouchNpc()
{
	// �b��������Ώۂ�NPC��������
	local target = GetTargetId_();
	switch(target)
	{
	// �A���}�Q��
	case npc_Aroma2go:
		uTalkAroma2go();
		break;
	// ���i�[�e
	case npc_Renate:
		uRenateMsg();
		break;
	// �m�`���[���c
	case npc_Nocho_D:
		uNochoDMsg();
		break;
	// �m�`���[���b
	case npc_Nocho_C:
		uNochoCMsg();
		break;
	// �s���j
	case npc_Citizen_Man_B:
		uCitizenManMsg();
		break;
	// �s���q��
	case npc_Citizen_Chi_B:
		uCitizenChiMsg();
		break;
	// �s����
	case npc_Citizen_Wom_B:
		uCitizenWomMsg();
		break;
	// ���W�X�^���X�j
	case npc_Resist_Man_B:
		uResistManMsg();
		break;
	// ���W�X�^���X��
	case npc_Resist_Wom_B:
		uResistWomMsg();
		break;
	// �����`��
	case npc_Yoncho:
		uTalkYoncho();
		break;
	default:
		DebugPrint("�ݒu���Ă��Ȃ�NPC�ɘb�������Ă��܂��B");
		break;
	}

	EventEnd_();
}

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// �N�������F�}�b�v�ɔz�u�������b�V���ɐG�ꂽ��
//------------------------------------------------------------------------------
// ��ȗp�r�F�}�b�v�ɔz�u�������b�V���ɐG�ꂽ�Ƃ��Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function TouchEventMine()
{
	// ���ׂ���G�����肵���C�x���g�n����������
	local target    = GetTouchEventMineId_();
	switch(target)
	{
	// �k�G���x�[�^
	case mine_Eleveter:
		CommPlayerTurnAroundObj(g_lift);
		DeleteEventMine_(mine_Eleveter);
		uChoiceMoveEleveter();
		break;
	case mine_01:
		uPlayDemo833();
		break;
	// �ݒu���Ă��Ȃ��n���ɐڐG
	default:
		DebugPrint("�ݒu���Ă��Ȃ��n���ɐG��Ă��܂��B");
		break;
	}

	EventEnd_();
}

//+++++++++++++++++++++++++++++++++++++++++++++++++
// �N�������F���A�N�^�[���N��������
//-------------------------------------------------
// ��ȗp�r�F���A�N�^�[�N����̃t���O�ݒ��
//           �ݒu���̑���Ȃǂ��s��
//+++++++++++++++++++++++++++++++++++++++++++++++++
function ReactorOn()
{
	EventEnd_();
}

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// �N�������F���A�N�^�[�|�C���g�Ȃǂ𒲂ׂ���
//----------------------------------------------------------
// ��ȗp�r�F�X�N���v�g�ݒu�̃��A�N�^�[�|�C���g�𒲂ׂ���
// ���ӓ_  �F�g�p����ۂ́AFadeIn()�Ȃǂ̃C�x���g�u���b�N��
//           SetReactorEvent_()�̖��߂�ǉ�����K�v������
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function ReactorAnalyze()
{
	EventEnd_();
}

//+++++++++++++++++++++++++++++++++++++++++++++++++++
// �N�������F���A�N�^�[���I��������
//---------------------------------------------------
// ��ȗp�r�F���A�N�^�[�@�\���n�e�e�ɂ���^�C�~���O��
//           �t���O�ݒ��ݒu���̑���Ȃǂ��s��
//+++++++++++++++++++++++++++++++++++++++++++++++++++
function ReactorOff()
{
	EventEnd_();
}

//===========================================================================
// ���[�J���֐��F�k�G���x�[�^�łǂ���̈ړ����s���̂��I��
//---------------------------------------------------------------------------
// ����    �F�Ȃ�
// �߂�l  �F�Ȃ�
//===========================================================================
function uChoiceMoveEleveter()
{
	OpenMsgWnd_();
	ShowMsg_("CHOICE_MOVE_UP_OR_DOWN");
	KeyInputWait_();
	if(GetQueryResult_() == QUERY_YES){
		CloseMsgWnd_();
		// �G���x�[�^���g�p�����^�C�~���O�Ńf���𗬂��^�C�~���O�Ɣ�����ꍇ�t�F�[�h�̎�ނ�؂�ւ���ׂ̃t���O���ɖ߂�
		SetEventFlg_("BFG_CHECK_USED_ELEVATER_FADE_OFF", true);
		// �G���x�[�^�ňړ�SE
		PlaySE_("SE_FLD_061");
		// �n���P�K�Ɉړ�
		ChangeMapPosDir_("A01_01", Vec3(A01_01_RTN_POS_N_X, A01_01_RTN_POS_N_Y, A01_01_RTN_POS_N_Z), RTN_DIR_N);
	}
	else{
		CloseMsgWnd_();
		// �n�����Đݒu
		SetPointBoxEventMine_("mine_eleveter", true);
	}
}

//==============================================
// ���[�J���֐��FDemo833[�A���}�̒u���y�Y]�̍Đ�
//----------------------------------------------
// ����    �F�Ȃ�
// �߂�l  �F�Ȃ�
//==============================================
function uPlayDemo833()
{
	//�V�i���I���C���t���O
	local main_num = GetNumFlg_("NUM_SCENARIO_MAIN");
	local allclear_num = GetNumFlg_("NUM_SCENARIO_SUB_ALL_CLEAR");   // ���S�N���A��

	if(main_num == GetFlagID_("CONST_SM_ALL_CLEAR")){
		if(allclear_num == GetFlagID_("CONST_SS_ALL_GO_TO_CENTER_BILL_B2F")){
			SetNumFlg_("NUM_SCENARIO_SUB_ALL_CLEAR", GetFlagID_("CONST_SS_ALL_UNLOCK_BATTLE_GP")); // Num11 = 2
			// �t�F�[�h�A�E�g(����ύX���B������)
			SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
			SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
			WaitFade_();
			// ���ԑт��f���ɍ��킹��
			SetTime_(START_TIME_ZONE_NOON);
			// ���[���|�C���g���
			SetEventFlg_("BFG_RULER_ADD_029", true);
			// ���������o�g������t���O�𗧂Ă�
			SetEventFlg_("BFG_TOURNAMENT_BATTLE_UNLOCK", true);
			//�f���Đ���̃}�b�v���w��
			SetReturnDemoPosDir_(Vec3(160.35, 0.00, -160.55), -50);
			// Demo833[�A���}�̒u���y�Y]
			ChangeDemo_(833);
		}
	}
}

//==============================================
// ���[�J���֐��F�A���}�Q���Ɖ�b�������̏���
//----------------------------------------------
// ����    �F�Ȃ�
// �߂�l  �F�Ȃ�
//==============================================
function uTalkAroma2go()
{
	//�V�i���I���C���t���O
	local main_num = GetNumFlg_("NUM_SCENARIO_MAIN");
	local allclear_num = GetNumFlg_("NUM_SCENARIO_SUB_ALL_CLEAR");   // ���S�N���A��

	if(main_num == GetFlagID_("CONST_SM_ALL_CLEAR")){					 // Num0  == 10
		if(allclear_num == GetFlagID_("CONST_SS_ALL_UNLOCK_BATTLE_GP")){ // Num11 ==  2
			uMonsterBattleQuestion();
		}
	}
}

//===============================================
// ���[�J���֐��F�����X�^�[�o�g���f�o�ڍs����
//-----------------------------------------------
// ����    �F�Ȃ�
// �߂�l  �F�Ȃ�
//===============================================
function uMonsterBattleQuestion()
{
	local fade_frame = 15;
	
	//�܂�������Ȃ�
	if ( GetEventFlg_("BFG_CHALLENGE_BATTLE_FIRSTCHALLENGE") == false ) {
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_AROMA_NO2");
		ShowMsg_("AROMA_2GO_MSG_101");
		KeyInputWait_();
		ShowMsg_("AROMA_2GO_MSG_102");
		KeyInputWait_();
		ShowMsg_("AROMA_2GO_MSG_103");
		KeyInputWait_();
		if(GetQueryResult_() == QUERY_YES){
			// �����f�B�X�N��MAX�ł͖�����
			if(CheckDiscMax_() == false){
				// �Ó]
				SetFade_(FADE_OUT, FADE_COLOR_BLACK, fade_frame);
				SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, fade_frame);
				WaitFade_();
				CloseMsgWnd_();
				
				// �R���V�A�����j���[�̌Ăяo��
				GotoMenuScene_(MENU_SCENE.VIRTUALCOLOSSEUM);
			}
			// �����f�B�X�N��MAX�̎�
			else{
				ShowMsg_("AROMA_2GO_MSG_115");
				KeyInputWait_();
				CloseMsgWnd_();
			}
		} else {
			ShowMsg_("AROMA_2GO_MSG_111");
			KeyInputWait_();
			CloseMsgWnd_();
		}
		
	// �P��ȏ㒧�킵��
	} else {
		//�O�̃`�������W�o�g���������o�߂�����
		if ( CheckEventDate_() == true ) {
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_AROMA_NO2");
			ShowMsg_("AROMA_2GO_MSG_120");
			KeyInputWait_();
			ShowMsg_("AROMA_2GO_MSG_121");
			KeyInputWait_();
			if(GetQueryResult_() == QUERY_YES){
				// �����f�B�X�N��MAX�ł͖�����
				if(CheckDiscMax_() == false){
					// �Ó]
					SetFade_(FADE_OUT, FADE_COLOR_BLACK, fade_frame);
					SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, fade_frame);
					WaitFade_();
					CloseMsgWnd_();
					
					// �R���V�A�����j���[�̌Ăяo��
					GotoMenuScene_(MENU_SCENE.VIRTUALCOLOSSEUM);
				}
				// �����f�B�X�N��MAX�̎�
				else{
					ShowMsg_("AROMA_2GO_MSG_115");
					KeyInputWait_();
					CloseMsgWnd_();
				}
			} else {
				ShowMsg_("AROMA_2GO_MSG_111");
				KeyInputWait_();
				CloseMsgWnd_();
			}
			
		//�܂��o�߂��ĂȂ�
		} else {
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_AROMA_NO2");
			ShowMsg_("AROMA_2GO_MSG_130");
			KeyInputWait_();
			ShowMsg_("AROMA_2GO_MSG_131");
			KeyInputWait_();
			if(GetQueryResult_() == QUERY_YES){
				// �����f�B�X�N��MAX�ł͖�����
				if(CheckDiscMax_() == false){
					// �Ó]
					SetFade_(FADE_OUT, FADE_COLOR_BLACK, fade_frame);
					SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, fade_frame);
					WaitFade_();
					CloseMsgWnd_();
					
					// �R���V�A�����j���[�̌Ăяo��
					GotoMenuScene_(MENU_SCENE.VIRTUALCOLOSSEUM);
				}
				// �����f�B�X�N��MAX�̎�
				else{
					ShowMsg_("AROMA_2GO_MSG_115");
					KeyInputWait_();
					CloseMsgWnd_();
				}
			} else {
				ShowMsg_("AROMA_2GO_MSG_111");
				KeyInputWait_();
				CloseMsgWnd_();
			}
		}
	}

}

//==============================================
// ���[�J���֐��F�`�������W�o�g���P���@�퓬�O�̈�A
//----------------------------------------------
// ����    �F�Ȃ�
// �߂�l  �F�Ȃ�
//==============================================
function uChallengeBattle_1_Before()
{
	//�T�u�t���O�i�s
	SetNumFlg_( "NUM_CHALLENGE_BATTLE_SUB", 2 );

	// �P���̑���Ɛ퓬
	ChangeBattleParty_(125);

}

//==============================================
// ���[�J���֐��F�`�������W�o�g���@�P���@�퓬��̈�A
//----------------------------------------------
// ����    �F�Ȃ�
// �߂�l  �F�Ȃ�
//==============================================
function uChallengeBattle_1_After()
{
	//��V�v���[���g
	//����
	if ( GetEventFlg_("BFG_CHALLENGE_BATTLE_FIRSTREWARD") == false ) {
		// �f�B�X�N���菈��
		AddSpecialDisc_(SPECIAL_DISC.SHINE); // �����ӂ��f�B�X�N
	//�Q��ڈȍ~
	} else {
		// �A�C�e�����菈��
		AddItem_(11, 1);					//�V���̃\�[�}�~1

	}

	//�T�u�t���O�i�s
	SetNumFlg_( "NUM_CHALLENGE_BATTLE_SUB", 3 );

	SetReturnDemoMap_("A01_02");
	SetReturnDemoPosDir_(Vec3(0.0, 0.0, -20.0), 0);
	// Demo851[�`�������W�o�g���퓬������]
	SetEventFlg_("BFG_WEATHER_TIME_TAKEOVER_DEMO", true);	// �V��Ǝ��Ԃ��f���Ɉ����p��
	EventStartChangeDemo(851, FADE_COLOR_BLACK);

}

//==============================================
// ���[�J���֐��F�`�������W�o�g���Q���@�퓬�O�̈�A
//----------------------------------------------
// ����    �F�Ȃ�
// �߂�l  �F�Ȃ�
//==============================================
function uChallengeBattle_2_Before()
{
	//�T�u�t���O�i�s
	SetNumFlg_( "NUM_CHALLENGE_BATTLE_SUB", 2 );

	// �Q���̑���Ɛ퓬
	ChangeBattleParty_(126);

}

//==============================================
// ���[�J���֐��F�`�������W�o�g���@�Q���@�퓬��̈�A
//----------------------------------------------
// ����    �F�Ȃ�
// �߂�l  �F�Ȃ�
//==============================================
function uChallengeBattle_2_After()
{
	//��V�v���[���g
	//����
	if ( GetEventFlg_("BFG_CHALLENGE_BATTLE_SECONDREWARD") == false ) {
		// �A�C�e�����菈��
		AddItem_(903, 1);				//���y�̓V����

	//�Q��ڈȍ~
	} else {
		//------------------------------------------------------------------------------
		// �A�C�e��ID�ꗗ	/tose_works/data/parameter/10_04_�A�C�e���p�����[�^.xlsm�Q��
		//------------------------------------------------------------------------------
		// 36 -> ���̂��̖؂̂�
		// 37 -> �ӂ����Ȗ؂̂�
		// 38 -> ������̃^�l
		// 39 -> ���΂₳�̃^�l
		// 40 -> �܂���̃^�l
		// 41 -> ���������̃^�l
		// 42 -> �X�L���̃^�l
		// 43 -> �����킹�̃^�l
		//------------------------------------------------------------------------------
		//��L�̎�S�Ă�5�ǉ�����
		local id;
		for(id = 36; id <= 43; id ++){
			AddItem_(id, 5);
		}

	}

	//�T�u�t���O�i�s
	SetNumFlg_( "NUM_CHALLENGE_BATTLE_SUB", 3 );

	//��t�O�̍��W�\��
	SetReturnDemoMap_("A01_02");
	SetReturnDemoPosDir_(Vec3(0.0, 0.0, -20.0), 0);
	// Demo851[�`�������W�o�g���퓬������]
	SetEventFlg_("BFG_WEATHER_TIME_TAKEOVER_DEMO", true);	// �V��Ǝ��Ԃ��f���Ɉ����p��
	EventStartChangeDemo(851, FADE_COLOR_BLACK);

}


//==============================================
// ���[�J���֐��F�`�������W�o�g���R���@�퓬�O�̈�A
//----------------------------------------------
// ����    �F�Ȃ�
// �߂�l  �F�Ȃ�
//==============================================
function uChallengeBattle_3_Before()
{
	//�T�u�t���O�i�s
	SetNumFlg_( "NUM_CHALLENGE_BATTLE_SUB", 2 );

	// �R���̑���Ɛ퓬
	ChangeBattleParty_(127);

}

//==============================================
// ���[�J���֐��F�`�������W�o�g���@�R���@�퓬��̈�A
//----------------------------------------------
// ����    �F�Ȃ�
// �߂�l  �F�Ȃ�
//==============================================
function uChallengeBattle_3_After()
{
	//��V�v���[���g
	//����
	if ( GetEventFlg_("BFG_CHALLENGE_BATTLE_THIRDREWARD") == false ) {
		// �A�C�e�����菈��
		AddItem_(96, 1);				//�n���̈�`�q5�~1

	//�Q��ڈȍ~
	} else {
		// �A�C�e�����菈��
		AddItem_(60, 5);				//�������ȃ��_���~5

	}

	//�T�u�t���O�i�s
	SetNumFlg_( "NUM_CHALLENGE_BATTLE_SUB", 3 );

	//��t�O�̍��W�\��
	SetReturnDemoMap_("A01_02");
	SetReturnDemoPosDir_(Vec3(0.0, 0.0, -20.0), 0);
	// Demo851[�`�������W�o�g���퓬������]
	SetEventFlg_("BFG_WEATHER_TIME_TAKEOVER_DEMO", true);	// �V��Ǝ��Ԃ��f���Ɉ����p��
	EventStartChangeDemo(851, FADE_COLOR_BLACK);

}


//==============================================
// ���[�J���֐��F�`�������W�o�g���S���@�퓬�O�̈�A
//----------------------------------------------
// ����    �F�Ȃ�
// �߂�l  �F�Ȃ�
//==============================================
function uChallengeBattle_4_Before()
{
	//�T�u�t���O�i�s
	SetNumFlg_( "NUM_CHALLENGE_BATTLE_SUB", 2 );

	// �S���̑���Ɛ퓬
	ChangeBattleParty_(128);

}

//==============================================
// ���[�J���֐��F�`�������W�o�g���@�S���@�퓬��̈�A
//----------------------------------------------
// ����    �F�Ȃ�
// �߂�l  �F�Ȃ�
//==============================================
function uChallengeBattle_4_After()
{
	//��V�v���[���g
	AddItem_(47, 5);			// �����ӂ�ɂ��~5

	//�T�u�t���O�i�s
	SetNumFlg_( "NUM_CHALLENGE_BATTLE_SUB", 3 );

	//��t�O�̍��W�\��
	SetReturnDemoMap_("A01_02");
	SetReturnDemoPosDir_(Vec3(0.0, 0.0, -20.0), 0);
	// Demo851[�`�������W�o�g���퓬������]
	SetEventFlg_("BFG_WEATHER_TIME_TAKEOVER_DEMO", true);	// �V��Ǝ��Ԃ��f���Ɉ����p��
	EventStartChangeDemo(851, FADE_COLOR_BLACK);

}


//==============================================
// ���[�J���֐��F�`�������W�o�g���T���@�퓬�O�̈�A
//----------------------------------------------
// ����    �F�Ȃ�
// �߂�l  �F�Ȃ�
//==============================================
function uChallengeBattle_5_Before()
{
	//�T�u�t���O�i�s
	SetNumFlg_( "NUM_CHALLENGE_BATTLE_SUB", 2 );

	// �T���̑���Ɛ퓬
	ChangeBattleParty_(129);

}

//==============================================
// ���[�J���֐��F�`�������W�o�g���@�T���@�퓬��̈�A
//----------------------------------------------
// ����    �F�Ȃ�
// �߂�l  �F�Ȃ�
//==============================================
function uChallengeBattle_5_After()
{
	//��V�������X�^�[�Ȃ̂ŁA�����ł͒��ԉ������ł��Ȃ��I�i�Ȃ̂ŉ����\��j
	SetEventFlg_( "BFG_CHALLENGE_BATTLE_ADDMONS_RESERV", true );

	//�T�u�t���O�i�s
	SetNumFlg_( "NUM_CHALLENGE_BATTLE_SUB", 3 );

	//��t�O�̍��W�\��
	SetReturnDemoMap_("A01_02");
	SetReturnDemoPosDir_(Vec3(0.0, 0.0, -20.0), 0);
	// Demo851[�`�������W�o�g���퓬������]
	SetEventFlg_("BFG_WEATHER_TIME_TAKEOVER_DEMO", true);	// �V��Ǝ��Ԃ��f���Ɉ����p��
	EventStartChangeDemo(851, FADE_COLOR_BLACK);

}


//==============================================
// ���[�J���֐��F�`�������W�o�g���@�퓬���t�O�̈�A
//----------------------------------------------
// ����    �F�Ȃ�
// �߂�l  �F�Ȃ�
//==============================================
function uChallengeBattle_ChallengeEnd()
{
	//�b���n�߂̑O�Ɉꔏ�̊�
//	Wait_(30);

	// �����I�ɉ�b��Ԃ�ݒ�
	SetTalkCameraType_(npc_Aroma2go, TALK_CAMERA_UP);
	EventStartOperateTalkAction(npc_Aroma2go);
	
	//�����Ă������Ă�����ςɂ���
	SetEventFlg_( "BFG_CHALLENGE_BATTLE_FIRSTCHALLENGE", true );	//���߂Ă̒���ς�

	//����I����̂����J�n
	//�������ꍇ
	if( GetEventFlg_("BFG_CHALLENGE_BATTLE_CHALLENGE_WIN") == true ){

		//���ԉ����\�񂪓����Ă���Ȃ��������
		if( GetEventFlg_("BFG_CHALLENGE_BATTLE_ADDMONS_RESERV") == true ){
			// ���ԉ����\�������
			SetEventFlg_("BFG_CHALLENGE_BATTLE_ADDMONS_RESERV", false);
			
			// �a�菊�̋󂫏�Ԃ��`�F�b�N
			uDecreaseCloakRoom();
			
			// ���O�t����ʂֈڍs
			local tsk_named_wnd = Task_AddFellow_(1261, false);
			WaitTask(tsk_named_wnd);
			
			// ����ʂ��Ó]�������Ȃ��悤�ɂ��鏈��
			SetFadeSub_(FADE_IN, FADE_COLOR_BLACK, FADE_SHORT);
			WaitFade_();
		}
		
		// �ʐM�R�C���̒ǉ�
		AddCoin_(COIN_TYPE.BRONZE, 3);
		AddCoin_(COIN_TYPE.SILVER, 2);
		AddCoin_(COIN_TYPE.GOLD,   1);
		
		// Wait_()�����ނ�SetTalkAction_()�����삵�Ȃ��Ȃ�̂Œ���
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_AROMA_NO2");
		ShowMsg_("AROMA_2GO_MSG_900");
		KeyInputWait_();
		ShowMsg_("AROMA_2GO_MSG_901");
		KeyInputWait_();
		CloseMsgWnd_();
		
		
		OpenMsgWnd_();
		PlaySE_("SE_SYS_011");			// �A�C�e������r�d
		ShowMsg_("AROMA_2GO_MSG_902");
		KeyInputWait_();
		ShowMsg_("AROMA_2GO_MSG_903");
		KeyInputWait_();
		CloseMsgWnd_();
		
		
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_AROMA_NO2");
		ShowMsg_("AROMA_2GO_MSG_904");
		KeyInputWait_();
		ShowMsg_("AROMA_2GO_MSG_905");
		KeyInputWait_();
		CloseMsgWnd_();

		//�T�u�t���O�i�s�i���C�����P�i�s�����āA�T�u�͎��̉��p�ɖ߂��j
		SetNumFlg_( "NUM_CHALLENGE_BATTLE_MAIN", GetNumFlg_("NUM_CHALLENGE_BATTLE_MAIN")+1 );
		if ( 5 <= GetNumFlg_("NUM_CHALLENGE_BATTLE_MAIN") ) {
			SetNumFlg_( "NUM_CHALLENGE_BATTLE_MAIN", 0 );	//�T���I����Ă���Ȃ�P���ɖ߂�
		}

		//����(�`�������W�o�g���̂P��평���V������������H)
		if(GetNumFlg_("NUM_CHALLENGE_BATTLE_MAIN") == 1){
			if ( GetEventFlg_("BFG_CHALLENGE_BATTLE_FIRSTREWARD") == false ) {
				//�����V�l��
				SetEventFlg_( "BFG_CHALLENGE_BATTLE_FIRSTREWARD", true );
			}
		}
		//����(�`�������W�o�g���̂Q��평���V������������H)
		else if(GetNumFlg_("NUM_CHALLENGE_BATTLE_MAIN") == 2){
			if ( GetEventFlg_("BFG_CHALLENGE_BATTLE_SECONDREWARD") == false ) {
				//�����V�l��
				SetEventFlg_( "BFG_CHALLENGE_BATTLE_SECONDREWARD", true );
			}
		}
		//����(�`�������W�o�g���̂R��평���V������������H)
		else if(GetNumFlg_("NUM_CHALLENGE_BATTLE_MAIN") == 3){
			if ( GetEventFlg_("BFG_CHALLENGE_BATTLE_THIRDREWARD") == false ) {
				//�����V�l��
				SetEventFlg_( "BFG_CHALLENGE_BATTLE_THIRDREWARD", true );
			}
		}
		
		//��l���t���[��

	//�������ꍇ
	} else {
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_AROMA_NO2");
		ShowMsg_("AROMA_2GO_MSG_910");
		KeyInputWait_();
		ShowMsg_("AROMA_2GO_MSG_911");
		KeyInputWait_();
		ShowMsg_("AROMA_2GO_MSG_912");
		KeyInputWait_();
		CloseMsgWnd_();

	}

	//���s�ɂ�����炸�A�T�u�t���O�͂�����x����ł���悤�ɖ߂�
	SetNumFlg_( "NUM_CHALLENGE_BATTLE_SUB", 0 );
	SetEventFlg_("BFG_CHALLENGE_BATTLE_CHALLENGE_WIN", false);		//��������������

	//��l���t���[��
}

//=================================================================
// ���[�J���֐��F���i�[�e�̉�b����
//-----------------------------------------------------------------
// ����    �F�Ȃ�
// �߂�l  �F�Ȃ�
//=================================================================
function uRenateMsg()
{
	local main_num    = GetNumFlg_("NUM_SCENARIO_MAIN");
	local allclear_num = GetNumFlg_("NUM_SCENARIO_SUB_ALL_CLEAR");   // ���S�N���A��

	if(main_num == GetFlagID_("CONST_SM_ALL_CLEAR")){
		if(allclear_num == GetFlagID_("CONST_SS_ALL_UNLOCK_BATTLE_GP")){
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_RENERTE");
			ShowMsg_("NPC_RENATE_MSG");
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
}

//=================================================================
// ���[�J���֐��F�m�`��D�̉�b����
//-----------------------------------------------------------------
// ����    �F�Ȃ�
// �߂�l  �F�Ȃ�
//=================================================================
function uNochoDMsg()
{
	local main_num    = GetNumFlg_("NUM_SCENARIO_MAIN");
	local allclear_num = GetNumFlg_("NUM_SCENARIO_SUB_ALL_CLEAR");   // ���S�N���A��

	if(main_num == GetFlagID_("CONST_SM_ALL_CLEAR")){
		if(allclear_num == GetFlagID_("CONST_SS_ALL_UNLOCK_BATTLE_GP")){
			OpenMsgWnd_();
			ShowMsg_("NPC_NOCHO_D_MSG");
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
}

//=================================================================
// ���[�J���֐��F�m�`��C�̉�b����
//-----------------------------------------------------------------
// ����    �F�Ȃ�
// �߂�l  �F�Ȃ�
//=================================================================
function uNochoCMsg()
{
	local main_num    = GetNumFlg_("NUM_SCENARIO_MAIN");
	local allclear_num = GetNumFlg_("NUM_SCENARIO_SUB_ALL_CLEAR");   // ���S�N���A��

	if(main_num == GetFlagID_("CONST_SM_ALL_CLEAR")){
		if(allclear_num == GetFlagID_("CONST_SS_ALL_UNLOCK_BATTLE_GP")){
			OpenMsgWnd_();
			ShowMsg_("NPC_NOCHO_C_MSG");
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
}

//=================================================================
// ���[�J���֐��F�s���j�a�̉�b����
//-----------------------------------------------------------------
// ����    �F�Ȃ�
// �߂�l  �F�Ȃ�
//=================================================================
function uCitizenManMsg()
{
	local main_num    = GetNumFlg_("NUM_SCENARIO_MAIN");
	local allclear_num = GetNumFlg_("NUM_SCENARIO_SUB_ALL_CLEAR");   // ���S�N���A��

	if(main_num == GetFlagID_("CONST_SM_ALL_CLEAR")){
		if(allclear_num == GetFlagID_("CONST_SS_ALL_UNLOCK_BATTLE_GP")){
			OpenMsgWnd_();
			ShowMsg_("NPC_CITIZEN_MAN_B_MSG");
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
}

//=================================================================
// ���[�J���֐��F�s���q���a�̉�b����
//-----------------------------------------------------------------
// ����    �F�Ȃ�
// �߂�l  �F�Ȃ�
//=================================================================
function uCitizenChiMsg()
{
	local main_num    = GetNumFlg_("NUM_SCENARIO_MAIN");
	local allclear_num = GetNumFlg_("NUM_SCENARIO_SUB_ALL_CLEAR");   // ���S�N���A��

	if(main_num == GetFlagID_("CONST_SM_ALL_CLEAR")){
		if(allclear_num == GetFlagID_("CONST_SS_ALL_UNLOCK_BATTLE_GP")){
			OpenMsgWnd_();
			ShowMsg_("NPC_CITIZEN_CHILD_B_MSG");
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
}

//=================================================================
// ���[�J���֐��F�s�����a�̉�b����
//-----------------------------------------------------------------
// ����    �F�Ȃ�
// �߂�l  �F�Ȃ�
//=================================================================
function uCitizenWomMsg()
{
	local main_num    = GetNumFlg_("NUM_SCENARIO_MAIN");
	local allclear_num = GetNumFlg_("NUM_SCENARIO_SUB_ALL_CLEAR");   // ���S�N���A��

	if(main_num == GetFlagID_("CONST_SM_ALL_CLEAR")){
		if(allclear_num == GetFlagID_("CONST_SS_ALL_UNLOCK_BATTLE_GP")){
			OpenMsgWnd_();
			ShowMsg_("CITIZEN_WOMAN_B_MSG");
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
}

//=================================================================
// ���[�J���֐��F���W�X�^���X�j�̉�b����
//-----------------------------------------------------------------
// ����    �F�Ȃ�
// �߂�l  �F�Ȃ�
//=================================================================
function uResistManMsg()
{
	local main_num    = GetNumFlg_("NUM_SCENARIO_MAIN");
	local allclear_num = GetNumFlg_("NUM_SCENARIO_SUB_ALL_CLEAR");   // ���S�N���A��

	if(main_num == GetFlagID_("CONST_SM_ALL_CLEAR")){
		if(allclear_num == GetFlagID_("CONST_SS_ALL_UNLOCK_BATTLE_GP")){
			OpenMsgWnd_();
			ShowMsg_("RESISTANCE_MAN_B_MSG");
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
}

//=================================================================
// ���[�J���֐��F���W�X�^���X���̉�b����
//-----------------------------------------------------------------
// ����    �F�Ȃ�
// �߂�l  �F�Ȃ�
//=================================================================
function uResistWomMsg()
{
	local main_num    = GetNumFlg_("NUM_SCENARIO_MAIN");
	local allclear_num = GetNumFlg_("NUM_SCENARIO_SUB_ALL_CLEAR");   // ���S�N���A��

	if(main_num == GetFlagID_("CONST_SM_ALL_CLEAR")){
		if(allclear_num == GetFlagID_("CONST_SS_ALL_UNLOCK_BATTLE_GP")){
			OpenMsgWnd_();
			ShowMsg_("RESISTANCE_WOMAN_B_MSG");
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
}

//==============================================
// ���[�J���֐��F�����`���Ɖ�b�������̏���
//----------------------------------------------
// ����    �F�Ȃ�
// �߂�l  �F�Ȃ�
//==============================================
function uTalkYoncho()
{
	//�V�i���I���C���t���O
	local main_num = GetNumFlg_("NUM_SCENARIO_MAIN");
	local allclear_num = GetNumFlg_("NUM_SCENARIO_SUB_ALL_CLEAR");   // ���S�N���A��

	if(main_num == GetFlagID_("CONST_SM_ALL_CLEAR")){					 // Num0  == 10
		if(allclear_num == GetFlagID_("CONST_SS_ALL_UNLOCK_BATTLE_GP")){ // Num11 ==  2
			// ����`�F�b�N
			if(GetEventFlg_("BFG_FIRST_CONTACT_YONCHO") == false){
				SetEventFlg_( "BFG_FIRST_CONTACT_YONCHO", true );
				// �����`��(�����O)
				OpenMsgWnd_();
				ShowMsg_("YONCHO_MSG_001");
				KeyInputWait_();
				// �����`��(����)
				SetTalkName_("NAME_TAG_YONCHO");
				ShowMsg_("YONCHO_MSG_002");
				KeyInputWait_();
			}
			else{
				// �����`��(�Q��ڈȍ~)
				OpenMsgWnd_();
				SetTalkName_("NAME_TAG_YONCHO");
				ShowMsg_("YONCHO_MSG_003");
				KeyInputWait_();
			}
			// �`�������W�o�g���\���𔻒肵�ă��b�Z�[�W��ύX
			// ������̏ꍇ
			if(GetEventFlg_("BFG_CHALLENGE_BATTLE_FIRSTCHALLENGE") == false){
				ShowMsg_("YONCHO_MSG_PLAY_OK");
			}
			// ����ς݂̏ꍇ
			else{
				// �\(�O�̃`�������W�o�g���������o�߂���)
				if(CheckEventDate_() == true){
					ShowMsg_("YONCHO_MSG_PLAY_OK");
				}
				// �s��(�O�̃`�������W�o�g���������o�߂��Ă��Ȃ�)
				else{
					ShowMsg_("YONCHO_MSG_PLAY_NG");
				}
			}
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
}

//==========================================================================
// ���[�J���֐��F�A���}�Q���̖߂胁�b�Z�[�W
//--------------------------------------------------------------------------
// ����    �F�Ȃ�
// �߂�l  �F�Ȃ�
//==========================================================================
function uRtnAroma2goMsg()
{
	// �����I�ɉ�b��Ԃ�ݒ�
	SetTalkCameraType_(npc_Aroma2go, TALK_CAMERA_UP);
	EventStartOperateTalkAction(npc_Aroma2go);
	// ���b�Z�[�W
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_AROMA_NO2");
	ShowMsg_("AROMA_2GO_MSG_140");
	KeyInputWait_();
	CloseMsgWnd_();
}

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//  ���[�J���֐� : �����X�^�[�̗a�菊�𒲂ׂāA�󂫍��Ȃ�����͗a�菊�����X�ƌĂяo��
//-----------------------------------------------------------------------------------
// ����   �F�Ȃ�
// �߂�l �F�Ȃ�
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function uDecreaseCloakRoom()
{
	local residue = GetFreeMonsterNum_();
	local empty_num = 0;

	// �󂫂��Ȃ�
	if(residue <= empty_num){
		while(true){
			// �i�r�}�b�v���\��
			SetNavimapVisible_(false);
			// �V�X�e�����b�Z�[�W
			OpenMsgWnd_();
			ShowMsg_("NOT_EMPTY_CLOAKROOM_MSG");
			KeyInputWait_();
			CloseMsgWnd_();
			// �����ɈÓ]����
			SetFadeSub_(FADE_IN, FADE_COLOR_BLACK, FADE_SHORT);
			// �a�菊���Ăяo��
			GotoMenuFadeOpen(MENU_OPEN.LUGGAGE_OFFICE);
			// �ă`�F�b�N
			residue = GetFreeMonsterNum_();
			if(residue > empty_num){
				// �P�̂ł��󂫂��o�����甲����
				break;
			}
		}
		// �����ɈÓ]
		SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
		// �i�r�}�b�v��\��
		SetNavimapVisible_(true);
	}
	// �󂫂�����
	else{
		// ���ɉ������Ȃ�
	}
}

