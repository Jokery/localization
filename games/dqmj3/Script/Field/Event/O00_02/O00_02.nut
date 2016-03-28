//--------------
//	�����ӎ�����
//--------------
//���̃}�b�v�̃Z�[�u�֎~�����́A�v���O�����ōs���Ă��܂��B


//===================== ����ԃ}�b�v ====================
// FieldCrackManager.h�����{
// ���b�Z�[�W�^�O�ԍ�
const MSG_TOUCHMASTER_ASK_BATTLE	= 0;	//�o�g�����邩�q�˂�
const MSG_TOUCHMASTER_SEL_YES		= 1;	//YES ���o�g���J�n
const MSG_TOUCHMASTER_SEL_NO		= 2;	//NO
const MSG_TOUCHMASTER_WIN_CMN_01	= 3;	//�o�g���������ʂP
const MSG_TOUCHMASTER_WIN_CMN_02	= 4;	//�o�g���������ʂQ
const MSG_TOUCHMASTER_LOSE_CMN_01	= 5;	//�o�g���s�k���ʂP

const MSG_TOUCHDISC_START_BATTLE	= 0;	//�o�g���J�n
const MSG_TOUCHDISC_END_BATTLE		= 1;	//�o�g���I��

const DARKLORD_RYUOU				= 0;	//����
const DARKLORD_SHIDO				= 1;	//�V�h�[
const DARKLORD_ZOMA					= 2;	//�]�[�}
const DARKLORD_DEATHPISARO			= 3;	//�f�X�s�T��
const DARKLORD_MILDLARS				= 4;	//�~���h���[�X
const DARKLORD_DEATHTAMUA			= 5;	//�f�X�^���[�A
const DARKLORD_OLGODEMIRA			= 6;	//�I���S�E�f�~�[��
const DARKLORD_RAPSONE				= 7;	//���v�\�[��
const DARKLORD_ELGIOS				= 8;	//�G���M�I�X

// �ϐ���`
g_crack_npc		 <- C_NONE_ID;	// �􂯖�NPC
g_mine_circle	 <- C_NONE_ID;	// �����n��


//------------------------------------------------
//		�퓬�I����
//------------------------------------------------
function AfterBattle()
{
	// �����ɔs�k������
	if(GetBattleEndType_() == END_TYPE_LOSE){
		// �S�ł�����v���C���[�̔�\��������
		local player = GetPlayerId_();
		SetVisible(player, true);
	}
	
	EventEnd_();
}

//------------------------------------------------
//		�t�F�[�h�C��
//------------------------------------------------
function FadeIn()
{
	// �ϐ���`
	local darklord_on, player;
	
	// �t���O�̏�Ԃ��擾
	darklord_on	 = IsDarkLordCrackMap_();	// �������E���ǂ���
	player		 = GetPlayerId_();			// �v���C���[ID�擾
	//------------------
	// ���􂯖�NPC�̐ݒ�
	//------------------
	//�������̎�
	if (darklord_on){
		// ���ϐ���`
		local crack_npc, crack_scale;
		
		crack_npc	 = GetCrackNPCModelResName_();	// �􂯖ڂ̐��ENPC�̃��f�����\�[�X�����擾
		crack_scale	 = GetCrackNPCScale_();			// �􂯖�NPC�̃X�P�[���l�i�{���j���擾
		
		DebugPrint("����������������");
		
		// ��NPC�z�u
		id_crack_npc <- ReadNpc_(crack_npc);
		g_crack_npc <- ArrangePointNpc_(id_crack_npc, "dl000");
		SetScale_(g_crack_npc, crack_scale);
		
		// ���A�N�^�[���b�Z�[�W
		switch (GetCrackNPCDarkLordNo_()) {
		//������
		case DARKLORD_RYUOU:
			SetReactorMsg_(g_crack_npc, "NPC_RYUOU_REC_010");
			break;
		//���V�h�[
		case DARKLORD_SHIDO:
			SetReactorMsg_(g_crack_npc, "NPC_SHIDO_REC_010");
			break;
		//���]�[�}
		case DARKLORD_ZOMA:
			SetReactorMsg_(g_crack_npc, "NPC_ZOMA_REC_010");
			break;
		//���f�X�s�T��
		case DARKLORD_DEATHPISARO:
			SetReactorMsg_(g_crack_npc, "NPC_DEATHPISARO_REC_010");
			break;
		//���~���h���[�X
		case DARKLORD_MILDLARS:
			SetReactorMsg_(g_crack_npc, "NPC_MILDLARS_REC_010");
			break;
		//���f�X�^���[�A
		case DARKLORD_DEATHTAMUA:
			SetReactorMsg_(g_crack_npc, "NPC_DEATHTAMUA_REC_010");
			break;
		//���I���S�E�f�~�[��
		case DARKLORD_OLGODEMIRA:
			SetReactorMsg_(g_crack_npc, "NPC_OLGODEMIRA_REC_010");
			break;
		//�����v�\�[��
		case DARKLORD_RAPSONE:
			SetReactorMsg_(g_crack_npc, "NPC_RAPSONE_REC_010");
			break;
		//���G���M�I�X
		case DARKLORD_ELGIOS:
			SetReactorMsg_(g_crack_npc, "NPC_ELGIOS_REC_010");
			break;
		default :
			DebugPrint("WARNING : ����_ID���s���ł� [TouchEventMine]");
			break;
		}
		
		// �������p�̒n���ݒ�
		// ���v�\�[���̂ݑ傫���n��
		if(GetCrackNPCDarkLordNo_() == DARKLORD_RAPSONE){
			g_mine_circle <- SetPointCircleEventMine_("mine_002", false);
		}else{
			g_mine_circle <- SetPointCircleEventMine_("mine_001", false);
		}
	}
	
	//-----------------
	// ���}�b�v�i�r�z�u
	//-----------------
	local navi_darklord = ArrangePointNaviMapIcon_(NAVIMAP_ICON.EXCLAMATION, "dl000");	// ����
	
	
	EventEnd_();
}

//------------------------------------------------
//		�C�x���g�X�^�[�g
//------------------------------------------------
function EventStartOperate()
{
	// �ϐ���`
	local darklord_on, player;
	
	// �t���O�̏�Ԃ��擾
	darklord_on		 = IsDarkLordCrackMap_();				// �������E���ǂ���
	player			 = GetPlayerId_();						// �v���C���[ID�擾
	
	//-------------
	// ���퓬����
	//-------------
	// �l�[���^�O�ݒ�
	if (GetBattleEndType_() != END_TYPE_NONE){			// �퓬�I���^�C�v"���̑�"���擾
		// �����ʂŏ������s���֐�
		uAfterBattleDarklord(END_TYPE_NONE);
		
		// �������ꍇ
		if (GetBattleEndType_() == END_TYPE_WIN){		// �퓬�I���^�C�v"����"���擾
			// �����ʂŏ������s���֐�
			uAfterBattleDarklord(END_TYPE_WIN);
		}
		// �������ꍇ
		else if (GetBattleEndType_() == END_TYPE_LOSE){	// �퓬�I���^�C�v"�s�k"���擾
			// ���s�k������AfterBattle()�ɋL�q
		}
		
		// ����̗􂯖ڊ֘A�̃N���A�t���O
		SetClearFlagCrackMap_( true );
	}
	
	EventEnd_();
}

//------------------------------------------------
//		�m�o�b�ڐG��
//------------------------------------------------
function TouchNpc()
{
	
	/*
		�����Ȃ�
	*/
	
	EventEnd_();
}
//------------------------------------------------
//		�n���ڐG��
//------------------------------------------------
function TouchEventMine()
{
	// �ϐ���`
	local darklord_on, target, player;
	
	// �t���O�̏�Ԃ��擾
	darklord_on	 = IsDarkLordCrackMap_();				//�������E���ǂ���
	target		 = GetTouchEventMineId_();
	player		 = GetPlayerId_();

	if(target == g_mine_circle){
		// �l�[���^�O�ݒ�
		SetCrackNPCMessageNameTag_( "NAME_TAG_CRACKLORD_" + ( GetCrackNPCDarkLordNo_() +1 ));
		switch (GetCrackNPCDarkLordNo_()) {
		//������
		case DARKLORD_RYUOU:
			uMineRyuou();
			break;
		//���V�h�[
		case DARKLORD_SHIDO:
			uMineShido();
			break;
		//���]�[�}
		case DARKLORD_ZOMA:
			uMineZoma();
			break;
		//���f�X�s�T��
		case DARKLORD_DEATHPISARO:
			uMineDeathpisaro();
			break;
		//���~���h���[�X
		case DARKLORD_MILDLARS:
			uMineMildlars();
			break;
		//���f�X�^���[�A
		case DARKLORD_DEATHTAMUA:
			uMineDeathtamua();
			break;
		//���I���S�E�f�~�[��
		case DARKLORD_OLGODEMIRA:
			uMineOlgoDemira();
			break;
		//�����v�\�[��
		case DARKLORD_RAPSONE:
			uMineRapsone();
			break;
		//���G���M�I�X
		case DARKLORD_ELGIOS:
			uMineElgios();
			break;
		default :
			DebugPrint("WARNING : ����_ID���s���ł� [TouchEventMine]");
			break;
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
//		�퓬�I����̏���  �����̏ꍇ
//------------------------------------------------
//	����	: type	�퓬�I���^�C�v
//						END_TYPE_NONE	���b�Z�[�W�^�O�ݒ�
//						END_TYPE_WIN	��������
//						END_TYPE_LOSE	��������
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uAfterBattleDarklord(type)
{
	local  battleround, dlordscoutround, task_fellow;
	
	battleround		 = GetBattleRound_();				// �o�g���̃��E���h���擾
	dlordscoutround	 = GetCrackNPCDarkLordScoutRound_();// �����X�J�E�g�\���E���h���擾
	
	// �l�[���^�O�ݒ�
	SetCrackNPCMessageNameTag_( "NAME_TAG_CRACKLORD_" + ( GetCrackNPCDarkLordNo_() +1 ));
	
	if(type == END_TYPE_WIN){
		switch (GetCrackNPCDarkLordNo_()){
		//������
		case DARKLORD_RYUOU:
			uShamDemoAfterBattle();							// �[���f���̋��ʏ���
			//���K��^�[�����ȓ��ɏ���
			if(battleround <= dlordscoutround){
				SetExchangeNumber_(battleround);
				uMessageHanyou("dlord_ryuou_battlewin_000");
				uNakamaKyoutsu("dlord_ryuou_win_001", 2701);
			//���K��^�[�����ȏォ������
			} else {
				SetExchangeNumber_(battleround);
				uMessageHanyou("dlord_ryuou_win_002");
			}
			break;
		//���V�h�[
		case DARKLORD_SHIDO:
			uShamDemoAfterBattle();							// �[���f���̋��ʏ���
			//���K��^�[�����ȓ��ɏ���
			if(battleround <= dlordscoutround){
				SetExchangeNumber_(battleround);
				uMessageHanyou("dlord_shido_win_000");
				uNakamaKyoutsu("dlord_shido_win_001", 2702);
			//���K��^�[�����ȏォ������
			} else {
				SetExchangeNumber_(battleround);
				uMessageHanyou("dlord_shido_win_002");
			}
			break;
		//���]�[�}
		case DARKLORD_ZOMA:
			uShamDemoAfterBattle();							// �[���f���̋��ʏ���
			//���K��^�[�����ȓ��ɏ���
			if(battleround <= dlordscoutround){
				SetExchangeNumber_(battleround);
				uMessageHanyou("dlord_zoma_win_000");
				uNakamaKyoutsu("dlord_zoma_win_001", 2703);
			//���K��^�[�����ȏォ������
			} else {
				SetExchangeNumber_(battleround);
				uMessageHanyou("dlord_zoma_win_002");
			}
			break;
		//���f�X�s�T��
		case DARKLORD_DEATHPISARO:
			uShamDemoAfterBattle();							// �[���f���̋��ʏ���
			//���K��^�[�����ȓ��ɏ���
			if(battleround <= dlordscoutround){
				SetExchangeNumber_(battleround);
				uMessageHanyou("dlord_deathpisaro_win_000");
				uNakamaKyoutsu("dlord_deathpisaro_win_001", 2704);
			//���K��^�[�����ȏォ������
			} else {
				SetExchangeNumber_(battleround);
				uMessageHanyou("dlord_deathpisaro_win_002");
			}
			break;
		//���~���h���[�X
		case DARKLORD_MILDLARS:
			uShamDemoAfterBattle();							// �[���f���̋��ʏ���
			//���K��^�[�����ȓ��ɏ���
			if(battleround <= dlordscoutround){
				SetExchangeNumber_(battleround);
				uMessageHanyou("dlord_mildlars_win_000");
				uNakamaKyoutsu("dlord_mildlars_win_001", 2705);
			//���K��^�[�����ȏォ������
			} else {
				SetExchangeNumber_(battleround);
				uMessageHanyou("dlord_mildlars_win_002");
			}
			break;
		//���f�X�^���[�A
		case DARKLORD_DEATHTAMUA:
			uShamDemoAfterBattle();							// �[���f���̋��ʏ���
			//���K��^�[�����ȓ��ɏ���
			if(battleround <= dlordscoutround){
				SetExchangeNumber_(battleround);
				uMessageHanyou("dlord_deathtamua_win_000");
				uNakamaKyoutsu("dlord_deathtamua_win_001", 2706);
			//���K��^�[�����ȏォ������
			} else {
				SetExchangeNumber_(battleround);
				uMessageHanyou("dlord_deathtamua_win_002");
			}
			break;
		//���I���S�E�f�~�[��
		case DARKLORD_OLGODEMIRA:
			uShamDemoAfterBattle();							// �[���f���̋��ʏ���
			//���K��^�[�����ȓ��ɏ���
			if(battleround <= dlordscoutround){
				SetExchangeNumber_(battleround);
				uMessageHanyou("dlord_olgodemira_win_000");
				uNakamaKyoutsu("dlord_olgodemira_win_001", 2707);
			//���K��^�[�����ȏォ������
			} else {
				SetExchangeNumber_(battleround);
				uMessageHanyou("dlord_olgodemira_win_002");
			}
			break;
		//�����v�\�[��
		case DARKLORD_RAPSONE:
			uShamDemoAfterBattle();							// �[���f���̋��ʏ���
			//���K��^�[�����ȓ��ɏ���
			if(battleround <= dlordscoutround){
				SetExchangeNumber_(battleround);
				uMessageHanyou("dlord_rapsone_win_000");
				uNakamaKyoutsu("dlord_rapsone_win_001", 2708);
			//���K��^�[�����ȏォ������
			} else {
				SetExchangeNumber_(battleround);
				uMessageHanyou("dlord_rapsone_win_002");
			}
			break;
		//���G���M�I�X
		case DARKLORD_ELGIOS:
			uShamDemoAfterBattle();							// �[���f���̋��ʏ���
			//���K��^�[�����ȓ��ɏ���
			if(battleround <= dlordscoutround){
				SetExchangeNumber_(battleround);
				uMessageHanyou("dlord_elgios_win_000");
				uNakamaKyoutsu("dlord_elgios_win_001", 2709);
			//���K��^�[�����ȏォ������
			} else {
				SetExchangeNumber_(battleround);
				uMessageHanyou("dlord_elgios_win_002");
			}
			break;
		default :
			DebugPrint("WARNING : ����_ID���s���ł� [uAfterBattleDarklord]");
			break;
		}
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		����  �n����b����
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineRyuou()
{
	uShamDemoBeforeBattle();							// �[���f���̋��ʏ���
	uMessageHanyou("dlord_ryuou_beforebattle_000");
	
	if(GetQueryResult_() == MES_QUERY_YES){
		DeleteEventMine_(g_mine_circle);
		uMessageHanyou("dlord_ryuou_beforebattle_001");
		
		// �o�g���J�n
		SetEventFlg_("BFG_DEAD_KEEP_MAP", false);
		ChangeBattleParty_( GetCrackNPCPartyID_() );
	}else{
		uMessageHanyou("dlord_ryuou_beforebattle_002");
		uPlayableReset();
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		�V�h�[  �n����b����
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineShido()
{
	uShamDemoBeforeBattle();							// �[���f���̋��ʏ���
	uMessageHanyou("dlord_shido_beforebattle_000");	
	// �V�X�e�����b�Z�[�W
	OpenMsgWnd_();
	ShowMsg_("dlord_shido_beforebattle_001");			// �j��_�V�h�[���@�������������Ă����I
	KeyInputWait_();
	CloseMsgWnd_();
	
	if(GetQueryResult_() == MES_QUERY_YES){
		DeleteEventMine_(g_mine_circle);
		uMessageHanyou("dlord_shido_beforebattle_002");
		
		// �o�g���J�n
		SetEventFlg_("BFG_DEAD_KEEP_MAP", false);
		ChangeBattleParty_( GetCrackNPCPartyID_() );
	}else{
		// �V�X�e�����b�Z�[�W
		OpenMsgWnd_();
		ShowMsg_("dlord_shido_beforebattle_003");		// <name_player/>�́@�����������B
		KeyInputWait_();
		CloseMsgWnd_();
		uPlayableReset();
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		�]�[�}  �n����b����
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineZoma()
{
	uShamDemoBeforeBattle();							// �[���f���̋��ʏ���
	uMessageHanyou("dlord_zoma_beforebattle_000");
	
	if(GetQueryResult_() == MES_QUERY_YES){
		DeleteEventMine_(g_mine_circle);
		uMessageHanyou("dlord_zoma_beforebattle_001");
		
		// �o�g���J�n
		SetEventFlg_("BFG_DEAD_KEEP_MAP", false);
		ChangeBattleParty_( GetCrackNPCPartyID_() );
	}else{
		uMessageHanyou("dlord_zoma_beforebattle_002");
		uPlayableReset();
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		�f�X�s�T��  �n����b����
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineDeathpisaro()
{
	uShamDemoBeforeBattle();							// �[���f���̋��ʏ���
	uMessageHanyou("dlord_deathpisaro_beforebattle_000");
	
	if(GetQueryResult_() == MES_QUERY_YES){
		DeleteEventMine_(g_mine_circle);
		uMessageHanyou("dlord_deathpisaro_beforebattle_001");
		
		// �o�g���J�n
		SetEventFlg_("BFG_DEAD_KEEP_MAP", false);
		ChangeBattleParty_( GetCrackNPCPartyID_() );
	}else{
		uMessageHanyou("dlord_deathpisaro_beforebattle_002");
		uPlayableReset();
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		�~���h���[�X  �n����b����
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineMildlars()
{
	uShamDemoBeforeBattle();							// �[���f���̋��ʏ���
	uMessageHanyou("dlord_mildlars_beforebattle_000");
	
	if(GetQueryResult_() == MES_QUERY_YES){
		DeleteEventMine_(g_mine_circle);
		uMessageHanyou("dlord_mildlars_beforebattle_001");
		
		// �o�g���J�n
		SetEventFlg_("BFG_DEAD_KEEP_MAP", false);
		ChangeBattleParty_( GetCrackNPCPartyID_() );
	}else{
		uMessageHanyou("dlord_mildlars_beforebattle_002");
		uPlayableReset();
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		�f�X�^���[�A  �n����b����
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineDeathtamua()
{
	uShamDemoBeforeBattle();							// �[���f���̋��ʏ���
	uMessageHanyou("dlord_deathtamua_beforebattle_000");
	
	if(GetQueryResult_() == MES_QUERY_YES){
		DeleteEventMine_(g_mine_circle);
		uMessageHanyou("dlord_deathtamua_beforebattle_001");
		
		// �o�g���J�n
		SetEventFlg_("BFG_DEAD_KEEP_MAP", false);
		ChangeBattleParty_( GetCrackNPCPartyID_() );
	}else{
		uMessageHanyou("dlord_deathtamua_beforebattle_002");
		uPlayableReset();
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		�I���S�f�~�[��  �n����b����
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineOlgoDemira()
{
	uShamDemoBeforeBattle();							// �[���f���̋��ʏ���
	uMessageHanyou("dlord_olgodemira_beforebattle_000");
	
	if(GetQueryResult_() == MES_QUERY_YES){
		DeleteEventMine_(g_mine_circle);
		uMessageHanyou("dlord_olgodemira_beforebattle_001");
		
		// �o�g���J�n
		SetEventFlg_("BFG_DEAD_KEEP_MAP", false);
		ChangeBattleParty_( GetCrackNPCPartyID_() );
	}else{
		uMessageHanyou("dlord_olgodemira_beforebattle_002");
		uPlayableReset();
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		���v�\�[��  �n����b����
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineRapsone()
{
	uShamDemoBeforeBattle();							// �[���f���̋��ʏ���
	uMessageHanyou("dlord_rapsone_beforebattle_000");
	
	if(GetQueryResult_() == MES_QUERY_YES){
		DeleteEventMine_(g_mine_circle);
		uMessageHanyou("dlord_rapsone_beforebattle_001");
		
		// �o�g���J�n
		SetEventFlg_("BFG_DEAD_KEEP_MAP", false);
		ChangeBattleParty_( GetCrackNPCPartyID_() );
	}else{
		uMessageHanyou("dlord_rapsone_beforebattle_002");
		uPlayableReset();
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		�G���M�I�X  �n����b����
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineElgios()
{
	uShamDemoBeforeBattle();							// �[���f���̋��ʏ���
	uMessageHanyou("dlord_elgios_beforebattle_000");
	
	if(GetQueryResult_() == MES_QUERY_YES){
		DeleteEventMine_(g_mine_circle);
		uMessageHanyou("dlord_elgios_beforebattle_001");
		
		// �o�g���J�n
		SetEventFlg_("BFG_DEAD_KEEP_MAP", false);
		ChangeBattleParty_( GetCrackNPCPartyID_() );
	}else{
		uMessageHanyou("dlord_elgios_beforebattle_002");
		uPlayableReset();
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		�l���Q��  �n����b����
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineNelgel()
{
	uMessageHanyou("dlord_nelgel_beforebattle_000");
	
	if(GetQueryResult_() == MES_QUERY_YES){
		DeleteEventMine_(g_mine_circle);
		uMessageHanyou("dlord_nelgel_beforebattle_001");
		
		// �o�g���J�n
		SetEventFlg_("BFG_DEAD_KEEP_MAP", true);
		ChangeBattleParty_( GetCrackNPCPartyID_() );
	}else{
		uMessageHanyou("dlord_nelgel_beforebattle_002");
		uPlayableReset();
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		�^�E�Ж�̉�  �n����b����
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineDisasterking()
{
	uMessageHanyou("dlord_disasterking_beforebattle_000");
	
	if(GetQueryResult_() == MES_QUERY_YES){
		DeleteEventMine_(g_mine_circle);
		uMessageHanyou("dlord_disasterking_beforebattle_001");
		
		// �o�g���J�n
		SetEventFlg_("BFG_DEAD_KEEP_MAP", true);
		ChangeBattleParty_( GetCrackNPCPartyID_() );
	}else{
		uMessageHanyou("dlord_disasterking_beforebattle_002");
		uPlayableReset();
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		���E�҃A�����V�A  �n����b����
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineEvilAnrcia()
{
	uMessageHanyou("dlord_evilanrcia_beforebattle_000");
	
	if(GetQueryResult_() == MES_QUERY_YES){
		DeleteEventMine_(g_mine_circle);
		uMessageHanyou("dlord_evilanrcia_beforebattle_001");
		
		// �o�g���J�n
		SetEventFlg_("BFG_DEAD_KEEP_MAP", true);
		ChangeBattleParty_( GetCrackNPCPartyID_() );
	}else{
		uMessageHanyou("dlord_evilanrcia_beforebattle_002");
		uPlayableReset();
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		�������[���h���h  �n����b����
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineEvilZeldorado()
{
	uMessageHanyou("dlord_evilzeldorado_beforebattle_000");
	
	if(GetQueryResult_() == MES_QUERY_YES){
		DeleteEventMine_(g_mine_circle);
		uMessageHanyou("dlord_evilzeldorado_beforebattle_001");
		
		// �o�g���J�n
		SetEventFlg_("BFG_DEAD_KEEP_MAP", true);
		ChangeBattleParty_( GetCrackNPCPartyID_() );
	}else{
		uMessageHanyou("dlord_evilzeldorado_beforebattle_001");
		uPlayableReset();
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		�n���_�}�f�T�S�[��  �n����b����
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineMadesagora()
{
	uMessageHanyou("dlord_madesagora_beforebattle_000");
	
	if(GetQueryResult_() == MES_QUERY_YES){
		DeleteEventMine_(g_mine_circle);
		uMessageHanyou("dlord_madesagora_beforebattle_001");
		
		// �o�g���J�n
		SetEventFlg_("BFG_DEAD_KEEP_MAP", true);
		ChangeBattleParty_( GetCrackNPCPartyID_() );
	}else{
		uMessageHanyou("dlord_madesagora_beforebattle_002");
		uPlayableReset();
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		�G�X�^�[�N  �n����b����
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineEstark()
{
	uMessageHanyou("dlord_estark_beforebattle_000");
	
	if(GetQueryResult_() == MES_QUERY_YES){
		DeleteEventMine_(g_mine_circle);
		uMessageHanyou("dlord_estark_beforebattle_001");
		
		// �o�g���J�n
		SetEventFlg_("BFG_DEAD_KEEP_MAP", true);
		ChangeBattleParty_( GetCrackNPCPartyID_() );
	}else{
		uMessageHanyou("dlord_estark_beforebattle_002");
		uPlayableReset();
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		�K���}�b�]  �n����b����
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineGalmazzo()
{
	uMessageHanyou("dlord_galmazzo_beforebattle_000");
	
	if(GetQueryResult_() == MES_QUERY_YES){
		DeleteEventMine_(g_mine_circle);
		uMessageHanyou("dlord_galmazzo_beforebattle_001");
		
		// �o�g���J�n
		SetEventFlg_("BFG_DEAD_KEEP_MAP", true);
		ChangeBattleParty_( GetCrackNPCPartyID_() );
	}else{
		uMessageHanyou("dlord_galmazzo_beforebattle_002");
		uPlayableReset();
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		���_���I�\�[�h  �n����b����
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineLeosword()
{
	uMessageHanyou("dlord_leosword_beforebattle_000");
	
	if(GetQueryResult_() == MES_QUERY_YES){
		DeleteEventMine_(g_mine_circle);
		uMessageHanyou("dlord_leosword_beforebattle_001");
		
		// �o�g���J�n
		SetEventFlg_("BFG_DEAD_KEEP_MAP", true);
		ChangeBattleParty_( GetCrackNPCPartyID_() );
	}else{
		uMessageHanyou("dlord_leosword_beforebattle_002");
		uPlayableReset();
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		�q�q���h���[�h  �n����b����
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineHihydlard()
{
	uMessageHanyou("dlord_hihydlard_beforebattle_000");
	
	if(GetQueryResult_() == MES_QUERY_YES){
		DeleteEventMine_(g_mine_circle);
		uMessageHanyou("dlord_hihydlard_beforebattle_001");
		
		// �o�g���J�n
		SetEventFlg_("BFG_DEAD_KEEP_MAP", true);
		ChangeBattleParty_( GetCrackNPCPartyID_() );
	}else{
		uMessageHanyou("dlord_hihydlard_beforebattle_002");
		uPlayableReset();
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		�����~���N���A  �n����b����
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineMilaclare()
{
	uMessageHanyou("dlord_milaclare_beforebattle_000");
	
	if(GetQueryResult_() == MES_QUERY_YES){
		DeleteEventMine_(g_mine_circle);
		uMessageHanyou("dlord_milaclare_beforebattle_001");
		
		// �o�g���J�n
		SetEventFlg_("BFG_DEAD_KEEP_MAP", true);
		ChangeBattleParty_( GetCrackNPCPartyID_() );
	}else{
		uMessageHanyou("dlord_milaclare_beforebattle_002");
		uPlayableReset();
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		�����Ȃ��ł̉�  �n����b����
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineUnknownDarklord()
{
		uMessageHanyou("dlord_unknowndarklord_beforebattle_000");
	
	if(GetQueryResult_() == MES_QUERY_YES){
		DeleteEventMine_(g_mine_circle);
		uMessageHanyou("dlord_unknowndarklord_beforebattle_001");
		
		// �o�g���J�n
		SetEventFlg_("BFG_DEAD_KEEP_MAP", true);
		ChangeBattleParty_( GetCrackNPCPartyID_() );
	}else{
		uMessageHanyou("dlord_unknowndarklord_beforebattle_002");
		uPlayableReset();
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		�ėp���b�Z�[�W�֐�
//------------------------------------------------
//	����	: msg	���b�Z�[�WID
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMessageHanyou(msg)
{
	OpenMsgWnd_();
	SetTalkName_(GetCrackNPCMessageNameTag_());
	ShowMsg_(msg);
	KeyInputWait_();
	CloseMsgWnd_();
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		�������ԋ��ʏ���
//------------------------------------------------
//	����	: msg	���b�Z�[�WID
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uNakamaKyoutsu(msg, party_id)
{
	// ���b�Z�[�W
	OpenMsgWnd_();
	ShowMsg_(msg);
	// ����ME(�d�v�A�C�e���擾�Ɠ���)
	PlayMe_("ME_010");
	WaitMe_();
	KeyInputWait_();
	CloseMsgWnd_();
	// �����X�^�[��������
	local task_fellow = Task_AddFellow_(party_id, false);
	WaitTask(task_fellow);
	// �����X�^�[���t�F�[�h�A�E�g
	SetManualCalcAlpha_(g_crack_npc, true);
	local task_fade = Task_ObjectFadeOut_(g_crack_npc, FADE_DEF);
	WaitTask(task_fade);
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		�퓬�O�̋[���f�����ʏ���
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uShamDemoBeforeBattle()
{
	//�t�F�[�h�A�E�g
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
	SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
	WaitFade_();
	// ��l���������Ȃ�����
	SetVisible(GetPlayerId_(), false);
	// �J������ݒu
	switch (GetCrackNPCDarkLordNo_()){
	//������
	case DARKLORD_RYUOU:
	//���V�h�[
	case DARKLORD_SHIDO:
		SetPointCameraEye_("cameye_001");
		SetPointCameraTarget_("camtgt_001");
		break;
	//���]�[�}
	case DARKLORD_ZOMA:
		SetPointCameraEye_("cameye_008");
		SetPointCameraTarget_("camtgt_008");
		break;
	//���f�X�s�T��
	case DARKLORD_DEATHPISARO:
		SetPointCameraEye_("cameye_002");
		SetPointCameraTarget_("camtgt_002");
		break;
	//���~���h���[�X
	case DARKLORD_MILDLARS:
		SetPointCameraEye_("cameye_003");
		SetPointCameraTarget_("camtgt_003");
		break;
	//���f�X�^���[�A
	case DARKLORD_DEATHTAMUA:
		SetPointCameraEye_("cameye_004");
		SetPointCameraTarget_("camtgt_004");
		break;
	//���I���S�E�f�~�[��
	case DARKLORD_OLGODEMIRA:
		SetPointCameraEye_("cameye_005");
		SetPointCameraTarget_("camtgt_005");
		break;
	//�����v�\�[��
	case DARKLORD_RAPSONE:
		SetPointCameraEye_("cameye_006");
		SetPointCameraTarget_("camtgt_006");
		break;
	//���G���M�I�X
	case DARKLORD_ELGIOS:
		SetPointCameraEye_("cameye_007");
		SetPointCameraTarget_("camtgt_007");
		break;
	default :
		DebugPrint("WARNING : ����_ID���s���ł� [uAfterBattleDarklord]");
		break;
	}
	//�t�F�[�h�C��
	SetFade_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
	WaitFade_();
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		�퓬��̋[���f�����ʏ���
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uShamDemoAfterBattle()
{
	local player = GetPlayerId_();
	
	// �`�������Ȃ������߂ɂP�t���[���ňÓ]
	CommChangeMomentFadeOut(FADE_COLOR_BLACK);
	
	// �J������ݒu
	switch (GetCrackNPCDarkLordNo_()){
	//������
	case DARKLORD_RYUOU:
	//���V�h�[
	case DARKLORD_SHIDO:
		SetPointCameraEye_("cameye_001");
		SetPointCameraTarget_("camtgt_001");
		break;
	//���]�[�}
	case DARKLORD_ZOMA:
		SetPointCameraEye_("cameye_008");
		SetPointCameraTarget_("camtgt_008");
		break;
	//���f�X�s�T��
	case DARKLORD_DEATHPISARO:
		SetPointCameraEye_("cameye_002");
		SetPointCameraTarget_("camtgt_002");
		break;
	//���~���h���[�X
	case DARKLORD_MILDLARS:
		SetPointCameraEye_("cameye_003");
		SetPointCameraTarget_("camtgt_003");
		break;
	//���f�X�^���[�A
	case DARKLORD_DEATHTAMUA:
		SetPointCameraEye_("cameye_004");
		SetPointCameraTarget_("camtgt_004");
		break;
	//���I���S�E�f�~�[��
	case DARKLORD_OLGODEMIRA:
		SetPointCameraEye_("cameye_005");
		SetPointCameraTarget_("camtgt_005");
		break;
	//�����v�\�[��
	case DARKLORD_RAPSONE:
		SetPointCameraEye_("cameye_006");
		SetPointCameraTarget_("camtgt_006");
		break;
	//���G���M�I�X
	case DARKLORD_ELGIOS:
		SetPointCameraEye_("cameye_007");
		SetPointCameraTarget_("camtgt_007");
		break;
	default :
		DebugPrint("WARNING : ����_ID���s���ł� [uAfterBattleDarklord]");
		break;
	}
	
	Wait_(15);
	
	// ��l����\�� �������A�J�����ɂ͉f��Ȃ��悤�ɂ���
	SetVisible(player, true);
	SetPos_(player, Vec3(0.0, 0.0, 0.0));
	
	// �t�F�[�h�C��
	SetFade_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
	WaitFade_();
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		�v���C���[���w��̈ʒu�ɕ��A������
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uPlayableReset()
{
	local player;
	player		 = GetPlayerId_();					// �v���C���[ID�擾
	
	// �t�F�[�h�A�E�g
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
	WaitFade_();
	// �v���C���[���f��
	SetVisible(player, true);
	// �J������ʏ��Ԃɖ߂�
	SetPlayableCamera_();
	SetCameraDir_(110);
	// ��l���𖂉����痣�ꂽ�Ƃ���ɔz�u
	SetPos_(player, Vec3(-272.0, 10.0, -3.0));
	SetDir_(player, 110);
	Wait_(15);
	// �t�F�[�h�C��
	SetFade_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
	SetFadeSub_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
	WaitFade_();
}

