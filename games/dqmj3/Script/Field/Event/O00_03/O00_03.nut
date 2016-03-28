//===================== ����ԃ}�b�v ====================
// FieldCrackManager.h�����{
const eNPC_KIND_MASTER_ITEM  = 0;	//�A�C�e��(�f�t�H���g)
const eNPC_KIND_MASTER_GOLD  = 1;	//��
const eNPC_KIND_MASTER_SHOP  = 2;	//�V���b�v(��)
const eNPC_KIND_DISC_SUBDUE  = 3;	//DISC����
const eNPC_KIND_DARKLORD     = 4;	//����

const eNPC_KIND_MASTER_ITEM_ITEMSET = 0;	// ���𗧂�
const eNPC_KIND_MASTER_ITEM_SEED    = 1;	// ��
const eNPC_KIND_MASTER_ITEM_MEDAL   = 2;	// ���_��
const eNPC_KIND_MASTER_ITEM_PROOF   = 3;	// ��

const DiscQuestEndType_None    = 0; //!< �I�����Ă��Ȃ�
const DiscQuestEndType_Success = 1; //!< ����
const DiscQuestEndType_Failure = 2; //!< ���s

// ���b�Z�[�W�^�O�ԍ�
const MSG_TOUCHMASTER_ASK_BATTLE  = 0;		//�o�g�����邩�q�˂�
const MSG_TOUCHMASTER_SEL_YES     = 1;		//YES ���o�g���J�n
const MSG_TOUCHMASTER_SEL_NO      = 2;		//NO�@����l���t���[
const MSG_TOUCHMASTER_WIN_CMN_01  = 3;		//�o�g���������ʂP�i�L������b�@�̂���j
const MSG_TOUCHMASTER_WIN_CMN_02  = 4;		//�o�g���������ʂQ�i��V�l������1�̎��j
const MSG_TOUCHMASTER_WIN_CMN_04  = 5;		//�o�g���������ʂQ�i��V�l������2�ȏ�̎��j
const MSG_TOUCHMASTER_WIN_CMN_03  = 6;		//�o�g���������ʂR�i�L������b�@�ʂ�j
const MSG_TOUCHMASTER_LOSE_CMN_01 = 7;		//�o�g���s�k���ʂP
const MSG_TOUCHMASTER_LOSE_CMN_02 = 8;		//�o�g���s�k���ʂQ�@��2015/10/19���݁A���̏�������D���ꍇ�̂݁B

const MSG_TOUCHMASTER_WIN_SHOP_01  = 8;		//�o�g�������@�����i�L������b�@�̂���j
const MSG_TOUCHMASTER_WIN_SHOP_02  = 9;		//�o�g�������@�����i�L������b�@�V���b�v��Ċm�F�j
const MSG_TOUCHMASTER_WIN_SHOP_03  = 10;		//�o�g�������@�����i�L������b�@�ʂ�j
const MSG_TOUCHMASTER_LOSE_SHOP_01 = 11;	//�o�g���s�k�@�����i�L������b�@�艿�̔��j
const MSG_TOUCHMASTER_LOSE_SHOP_02 = 12;	//�o�g���s�k�@�����i�L������b�@�V���b�v��Ċm�F�j
const MSG_TOUCHMASTER_LOSE_SHOP_03 = 13;	//�o�g���s�k�@�����i�L������b�@�ʂ�j

const MSG_TOUCHDISC_ASK_BATTLE     = 13;	//�o�g�����邩�q�˂�
const MSG_TOUCHDISC_SEL_YES        = 14;	//YES ���o�g���J�n
const MSG_TOUCHDISC_SEL_NO         = 15;	//NO�@����l���t���[
const MSG_TOUCHDISC_WIN_CMN_01     = 16;	//�o�g���������ʂP�i�L������b�@�̂���j
const MSG_TOUCHDISC_LOSE_CMN_01    = 17;	//�o�g���s�k���ʂP�i�L������b�@�c�O�j

// �ϐ���`
g_crack_npc	 <- C_NONE_ID;	// �􂯖�NPC
g_mineCircle <- C_NONE_ID;	// �����n��
g_disc_master_msg_type <- C_NONE_ID;	//�f�B�X�N�̑����}�X�^�[�̉�b�^�C�v�i��ԓ��ŌŒ艻���邽�߁j

//------------------------------------------------
//		�t�F�[�h�C��
//------------------------------------------------
function FadeIn()
{
	// �ϐ���`
	local master_on, player;
	
	// �t���O�̏�Ԃ��擾
	master_on	 = IsMasterCrackMap_();		// �􂯖ڂ̐��E���ǂ���
	player		 = GetPlayerId_();			// �v���C���[ID�擾
	
	//------------------
	// ���􂯖�NPC�̐ݒ�
	//------------------
	
	//�������}�X�^�[�̎�
	if (master_on){
		//�܂��z�u����Ă��Ȃ��Ƃ������z�u
		if ( g_crack_npc == C_NONE_ID ) {
			// �ϐ���`
			local crack_npc, crack_scale;
			
			crack_npc	 = GetCrackNPCModelResName_();	// �􂯖ڂ̐��ENPC�̃��f�����\�[�X�����擾
			crack_scale	 = GetCrackNPCScale_();			// �􂯖�NPC�̃X�P�[���l�i�{���j���擾
			
			DebugPrint("����������������");
			
			// NPC�z�u
			id_crack_npc <- ReadNpc_(crack_npc);
			g_crack_npc <- ArrangePointNpc_(id_crack_npc, "npc000");
			SetScale_(g_crack_npc, crack_scale);
			SetReactorMsg_(g_crack_npc, "REACTOR_MSG_MASTER_NOCHO");
			SetTalkCameraType_(g_crack_npc, TALK_CAMERA_UP);
			// �A�i���C�Y�̃^�[�Q�b�g����؂�ւ���(�`���[�}�b�n���}�X�^�[�E�m�`���[��)
			SetTargetNameKey_(g_crack_npc, "NAME_TAG_MASTER_NOCHORA");
		}
	}

	
	// �Z�[�u�֎~	�������ɂ��Ă͊e�嗤��"FadeIn()"�ɂčs���Ă���B
	//���̃}�b�v�̃Z�[�u�֎~�́A�v���O�����ōs���Ă��܂��B

	//-----------------
	// ���}�b�v�i�r�z�u
	//-----------------
	local navi_master = ArrangePointNaviMapIcon_(NAVIMAP_ICON.EXCLAMATION, "npc000");	// �����}�X�^�[
	
	
	EventEnd_();
}

//------------------------------------------------
//		�C�x���g�X�^�[�g
//------------------------------------------------
function EventStartOperate()
{
	// �ϐ���`
	local master_on, player;
	
	// �t���O�̏�Ԃ��擾
	master_on		 = IsMasterCrackMap_();					// �􂯖ڂ̐��E���ǂ���
	player			 = GetPlayerId_();						// �v���C���[ID�擾
	
	//-------------
	// ���퓬����
	//-------------
	// �l�[���^�O�ݒ�
	if (GetBattleEndType_() != END_TYPE_NONE){			// �퓬�I���^�C�v"���̑�"���擾
		SetEventFlg_("BFG_DEAD_KEEP_MAP", false);		// ���̏ꕜ�A�t���O�����낷
		
		// UI Stop
		SetDiscQuestUIStop_( true );

		switch (GetCrackNPCKind_()){					// �􂯖ڐ��E��NPC�̎�ʂ��擾
		case eNPC_KIND_MASTER_ITEM:
			uAfterBattleMasterItem(END_TYPE_NONE);
			break;
		case eNPC_KIND_MASTER_GOLD:
			uAfterBattleMasterGold(END_TYPE_NONE);
			break;
		case eNPC_KIND_MASTER_SHOP:
			uAfterBattleMasterShop(END_TYPE_NONE);
			break;
		case eNPC_KIND_DISC_SUBDUE:
			uAfterBattleDidcSubdue(END_TYPE_NONE);
			break;
		case eNPC_KIND_DARKLORD:
		default :
			DebugPrint("WARNING : NPC_ID���s���ł� [EventStartOperate]");
			break;
		}
		
		SetDirToPos_(player, GetPos_(g_crack_npc));		//�v���C���[��NPC�̕���
		SetDirToPos_(g_crack_npc, GetPos_(player));		//NPC���v���C���[�̕��Ɍ�������
		
		// ������ or �X�J�E�g�����ꍇ
		if(GetBattleEndType_() == END_TYPE_WIN			// �퓬�I���^�C�v"����"���擾
		|| GetBattleEndType_() == END_TYPE_SCOUT){		// �퓬�I���^�C�v"�X�J�E�g"���擾
			
			// �������̂�QuestValue�𑫂�
			AddDiscQuestValue_( 1 );
			
			switch (GetCrackNPCKind_()){				// �􂯖ڐ��E��NPC�̎�ʂ��擾
			case eNPC_KIND_MASTER_ITEM:
				uAfterBattleMasterItem(END_TYPE_WIN);
				break;
			case eNPC_KIND_MASTER_GOLD:
				uAfterBattleMasterGold(END_TYPE_WIN);
				break;
			case eNPC_KIND_MASTER_SHOP:
				uAfterBattleMasterShop(END_TYPE_WIN);
				break;
			case eNPC_KIND_DISC_SUBDUE:
				uAfterBattleDidcSubdue(END_TYPE_WIN);
				break;
			case eNPC_KIND_DARKLORD:
			default :
				DebugPrint("WARNING : NPC_ID���s���ł� [EventStartOperate]");
				break;
			}
		}
		// ������ or ���������ꍇ
		else{
			switch (GetCrackNPCKind_()){				// �􂯖ڐ��E��NPC�̎�ʂ��擾
			case eNPC_KIND_MASTER_ITEM:
				uAfterBattleMasterItem(END_TYPE_LOSE);
				break;
			case eNPC_KIND_MASTER_GOLD:
				uAfterBattleMasterGold(END_TYPE_LOSE);
				break;
			case eNPC_KIND_MASTER_SHOP:
				uAfterBattleMasterShop(END_TYPE_LOSE);
				break;
			case eNPC_KIND_DISC_SUBDUE:
				uAfterBattleDidcSubdue(END_TYPE_LOSE);
				break;
			case eNPC_KIND_DARKLORD:
			default :
				DebugPrint("WARNING : NPC_ID���s���ł� [EventStartOperate]");
				break;
			}
		}
		
		if (GetCrackNPCKind_() != eNPC_KIND_DISC_SUBDUE){
			// ����̗􂯖ڊ֘A�̃N���A�t���O
			SetClearFlagCrackMap_( true );
		}else{
			// ��b�J�����̂܂܏I���������̂ŁA�����Ńt�F�[�h�A�E�g
			SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
			SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
			WaitFade_();
			
			// DISC�̃N���A�t���O
			if (GetBattleEndType_() == BATTLE_END_TYPE_WIN){
				SetDiscQuestEnd_( DiscQuestEndType_Success );
			}else{
				SetDiscQuestEnd_( DiscQuestEndType_Failure );
			}
		}
		// �v���C���[���~�߂�
		PlayerForcePause_( true );
	}

	EventEnd_();
}

//------------------------------------------------
//		�m�o�b�ڐG��
//------------------------------------------------
function TouchNpc()
{
	// �ϐ���`
	local master_on, target, bit;
	
	// �t���O�̏�Ԃ��擾
	master_on	 = IsMasterCrackMap_();					//�􂯖ڂ̐��E���ǂ���
	target		 = GetTargetId_();
	bit			 = false;
	
	if (target == g_crack_npc)
	{
		// UI Stop
		SetDiscQuestUIStop_( true );
		
		switch (GetCrackNPCKind_()){
		case eNPC_KIND_MASTER_ITEM:
			uTalkMasterItem();
			break;
		case eNPC_KIND_MASTER_GOLD:
			uTalkMasterGold();
			break;
		case eNPC_KIND_MASTER_SHOP:
			uTalkMasterShop();
			break;
		case eNPC_KIND_DISC_SUBDUE:
			uTalkDiscSubdue();
			break;
		case eNPC_KIND_DARKLORD:
		default :
			DebugPrint("WARNING : NPC_ID���s���ł� [EventStartOperate]");
			break;
		}
		// UI Stop����
		SetDiscQuestUIStop_( false );
	}
	EventEnd_();
}
//------------------------------------------------
//		�n���ڐG��
//------------------------------------------------
function TouchEventMine()
{
	/*
		�����Ȃ�
	*/
	
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
//		�퓬�I����̏���  �A�C�e���̏ꍇ
//------------------------------------------------
//	����	: type	�퓬�I���^�C�v
//						END_TYPE_NONE	���b�Z�[�W�^�O�ݒ�
//						END_TYPE_WIN	��������
//						END_TYPE_LOSE	��������
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uAfterBattleMasterItem(type)
{

	if(type == END_TYPE_NONE){
		SetCrackNPCMessageNameTag_( "NAME_TAG_MASTER_NOCHORA" );

		switch (GetCrackNPCSubKind_()){
		//�`���ɖ𗧂Z�b�g�̃m�`���[��
		case eNPC_KIND_MASTER_ITEM_ITEMSET:
			SetCrackNPCMessageTag_(MSG_TOUCHMASTER_WIN_CMN_01,  "NPCMSG_001_WIN_01");
			SetCrackNPCMessageTag_(MSG_TOUCHMASTER_WIN_CMN_02,  "NPCMSG_WIN_REWORD_ITEM_SET_01");
			SetCrackNPCMessageTag_(MSG_TOUCHMASTER_WIN_CMN_04,  "NPCMSG_WIN_REWORD_ITEM_SET_02");
			SetCrackNPCMessageTag_(MSG_TOUCHMASTER_WIN_CMN_03,  "NPCMSG_001_WIN_02");
			SetCrackNPCMessageTag_(MSG_TOUCHMASTER_LOSE_CMN_01, "NPCMSG_001_LOSE_01");
			break;
		//��̃m�`���[��
		case eNPC_KIND_MASTER_ITEM_SEED:
			SetCrackNPCMessageTag_(MSG_TOUCHMASTER_WIN_CMN_01,  "NPCMSG_002_WIN_01");
			SetCrackNPCMessageTag_(MSG_TOUCHMASTER_WIN_CMN_02,  "NPCMSG_WIN_REWORD_ITEM");
			SetCrackNPCMessageTag_(MSG_TOUCHMASTER_WIN_CMN_04,  "NPCMSG_WIN_REWORD_ITEMS");
			SetCrackNPCMessageTag_(MSG_TOUCHMASTER_WIN_CMN_03,  "NPCMSG_002_WIN_02");
			SetCrackNPCMessageTag_(MSG_TOUCHMASTER_LOSE_CMN_01, "NPCMSG_002_LOSE_01");
			break;
		//���_���̃m�`���[��
		case eNPC_KIND_MASTER_ITEM_MEDAL:
			SetCrackNPCMessageTag_(MSG_TOUCHMASTER_WIN_CMN_01,  "NPCMSG_003_WIN_01");
			SetCrackNPCMessageTag_(MSG_TOUCHMASTER_WIN_CMN_02,  "NPCMSG_WIN_REWORD_MEDAL");
			SetCrackNPCMessageTag_(MSG_TOUCHMASTER_WIN_CMN_04,  "NPCMSG_WIN_REWORD_MEDALS");
			SetCrackNPCMessageTag_(MSG_TOUCHMASTER_WIN_CMN_03,  "NPCMSG_003_WIN_02");
			SetCrackNPCMessageTag_(MSG_TOUCHMASTER_LOSE_CMN_01, "NPCMSG_003_LOSE_01");
			break;
		//�X�L���̏؂̃m�`���[��
		case eNPC_KIND_MASTER_ITEM_PROOF:
			SetCrackNPCMessageTag_(MSG_TOUCHMASTER_WIN_CMN_01,  "NPCMSG_006_WIN_01");
			SetCrackNPCMessageTag_(MSG_TOUCHMASTER_WIN_CMN_02,  "NPCMSG_WIN_REWORD_SKILL");
			SetCrackNPCMessageTag_(MSG_TOUCHMASTER_WIN_CMN_03,  "NPCMSG_006_WIN_02");
			SetCrackNPCMessageTag_(MSG_TOUCHMASTER_LOSE_CMN_01, "NPCMSG_006_LOSE_01");
			break;
		default :
			DebugPrint("WARNING : GetCrackNPCSubKind_�̒l���s���ł� [uAfterBattleMasterItem]");
			break;
		}
	}
	if(type == END_TYPE_WIN){
		SetTalkAction_( g_crack_npc );
		
		// ��V���̒��I
		LotteryCrackNPCItemNum_();
		local item_num = GetCrackNPCItemNum_();
		
		//�������b�Z�[�W
		uReservMessageDisplay( MSG_TOUCHMASTER_WIN_CMN_01, true );
		
		//��VSE�ƃ��b�Z�[�W
		PlaySE_("SE_SYS_011");

		if (GetCrackNPCSubKind_() != eNPC_KIND_MASTER_ITEM_ITEMSET)
		{
			PushCrackNPCItemNameAndNumMessage_(0);		// �A�C�e�����Ɛ���<exchange/>�ɓo�^
			if(item_num <= 1){
				// ��V�����u1�v�̎��̃��b�Z�[�W
				uReservMessageDisplay( MSG_TOUCHMASTER_WIN_CMN_02, false );
			}else{
				// ��V�����u2�ȏ�v�̎��̃��b�Z�[�W
				uReservMessageDisplay( MSG_TOUCHMASTER_WIN_CMN_04, false );
			}
		}else
		{
			// ���𗧂��Z�b�g
			OpenMsgWnd_();
				PushCrackNPCItemNameAndNumMessage_(0);
				ShowMsg_( GetCrackNPCMessageTag_(MSG_TOUCHMASTER_WIN_CMN_02) );
				KeyInputWait_();
				PushCrackNPCItemNameAndNumMessage_(1);
				ShowMsg_( GetCrackNPCMessageTag_(MSG_TOUCHMASTER_WIN_CMN_04) );
				KeyInputWait_();
			CloseMsgWnd_();
		}
		
		//���ʂꃁ�b�Z�[�W
		uReservMessageDisplay( MSG_TOUCHMASTER_WIN_CMN_03, true );
		
		// ���s
		ExecuteCrackNPCPresent_(BATTLE_END_TYPE_WIN);
	}
	if(type == END_TYPE_LOSE){
		SetTalkAction_( g_crack_npc );
		
		//�s�k���b�Z�[�W
		uReservMessageDisplay( MSG_TOUCHMASTER_LOSE_CMN_01, true );
	}
	
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		�퓬�I����̏���  �S�[���h�̏ꍇ
//------------------------------------------------
//	����	: type	�퓬�I���^�C�v
//						END_TYPE_NONE	���b�Z�[�W�^�O�ݒ�
//						END_TYPE_WIN	��������
//						END_TYPE_LOSE	��������
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uAfterBattleMasterGold(type)
{
	if(type == END_TYPE_NONE){
		SetCrackNPCMessageNameTag_( "NAME_TAG_MASTER_NOCHORA" );
		SetCrackNPCMessageTag_(MSG_TOUCHMASTER_WIN_CMN_01,  "NPCMSG_004_WIN_01");
		SetCrackNPCMessageTag_(MSG_TOUCHMASTER_WIN_CMN_02,  "NPCMSG_WIN_REWORD_MONEY_DOUBLE");
		SetCrackNPCMessageTag_(MSG_TOUCHMASTER_WIN_CMN_03,  "NPCMSG_004_WIN_02");
		SetCrackNPCMessageTag_(MSG_TOUCHMASTER_LOSE_CMN_01, "NPCMSG_004_LOSE_01");
		SetCrackNPCMessageTag_(MSG_TOUCHMASTER_LOSE_CMN_02, "NPCMSG_004_LOSE_02");
	}
	if(type == END_TYPE_WIN){
		SetTalkAction_( g_crack_npc );

		// ��V���̒��I
		LotteryCrackNPCItemNum_();

		//�������b�Z�[�W
		uReservMessageDisplay( MSG_TOUCHMASTER_WIN_CMN_01, true );
		
		//��VSE�ƃ��b�Z�[�W
		PushCrackNPCItemNameAndNumMessage_(0);		// ����S�[���h��<exchange/>�ɓo�^
		PlaySE_("SE_SYS_011");
		uReservMessageDisplay( MSG_TOUCHMASTER_WIN_CMN_02, false );

		//���ʂꃁ�b�Z�[�W
		uReservMessageDisplay( MSG_TOUCHMASTER_WIN_CMN_03, true );

		// ���s
		ExecuteCrackNPCPresent_(BATTLE_END_TYPE_WIN);
	}
	if(type == END_TYPE_LOSE){
		SetTalkAction_( g_crack_npc );

		// ��V���̒��I
		LotteryCrackNPCItemNum_();

		//�s�k���b�Z�[�W
		uReservMessageDisplay( MSG_TOUCHMASTER_LOSE_CMN_01, true );

		//���z�{�b�V���[�g���b�Z�[�W
		uReservMessageDisplay( MSG_TOUCHMASTER_LOSE_CMN_02, false );

		// ���s
		ExecuteCrackNPCPresent_(BATTLE_END_TYPE_LOSE);
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		�퓬�I����̏���  �V���b�v(��)�̏ꍇ
//------------------------------------------------
//	����	: type	�퓬�I���^�C�v
//						END_TYPE_NONE	���b�Z�[�W�^�O�ݒ�
//						END_TYPE_WIN	��������
//						END_TYPE_LOSE	��������
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uAfterBattleMasterShop(type)
{
	if(type == END_TYPE_NONE){
		SetCrackNPCMessageNameTag_( "NAME_TAG_MASTER_NOCHORA" );
		SetCrackNPCMessageTag_(MSG_TOUCHMASTER_WIN_SHOP_01,  "NPCMSG_005_WIN_REWORD_SHOP_01");
		SetCrackNPCMessageTag_(MSG_TOUCHMASTER_WIN_SHOP_02,  "NPCMSG_005_WIN_REWORD_SHOP_02");
		SetCrackNPCMessageTag_(MSG_TOUCHMASTER_WIN_SHOP_03,  "NPCMSG_005_WIN_REWORD_SHOP_03");
		SetCrackNPCMessageTag_(MSG_TOUCHMASTER_LOSE_SHOP_01, "NPCMSG_005_LOSE_REWORD_SHOP_01");
		SetCrackNPCMessageTag_(MSG_TOUCHMASTER_LOSE_SHOP_02, "NPCMSG_005_LOSE_REWORD_SHOP_02");
		SetCrackNPCMessageTag_(MSG_TOUCHMASTER_LOSE_SHOP_03, "NPCMSG_005_LOSE_REWORD_SHOP_03");
	}
	if(type == END_TYPE_WIN){
		SetTalkAction_( g_crack_npc );

		//�������b�Z�[�W
		uReservMessageDisplay( MSG_TOUCHMASTER_WIN_SHOP_01, true );

		// ���s
		ExecuteCrackNPCPresent_(BATTLE_END_TYPE_WIN);
		while(true){
			// �����̉��i�𔼊z�ɂ���t���O��ON
			SetEventFlg_("BFG_MASTER_MEET_HALF_PRICE", true);
			// �V���b�v���j���[���Ăяo��
			GotoMenuFadeOpen(MENU_OPEN.MASTER_MEET);
			// �����̉��i�𔼊z�ɂ���t���O��OFF
			SetEventFlg_("BFG_MASTER_MEET_HALF_PRICE", false);

			//�����\���������H
			uReservMessageDisplay( MSG_TOUCHMASTER_WIN_SHOP_02, true );
			// �͂�
			if (GetQueryResult_() == MES_QUERY_YES) {
				uReservMessageDisplay( MSG_TOUCHMASTER_WIN_SHOP_03, true );

				break;
			// ������
			} else {
				//���[�v
			}
		}
	}
	if(type == END_TYPE_LOSE){
		SetTalkAction_( g_crack_npc );

		//�s�k���b�Z�[�W
		uReservMessageDisplay( MSG_TOUCHMASTER_LOSE_SHOP_01, true );

		while(true){
			// �V���b�v���j���[���Ăяo��
			GotoMenuFadeOpen(MENU_OPEN.MASTER_MEET);

			//�����\���������H
			uReservMessageDisplay( MSG_TOUCHMASTER_LOSE_SHOP_02, true );
			// �͂�
			if (GetQueryResult_() == MES_QUERY_YES) {
				uReservMessageDisplay( MSG_TOUCHMASTER_LOSE_SHOP_03, true );

				break;
			// ������
			} else {
				//���[�v
			}
		}
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		�퓬�I����̏���  DISC�����̏ꍇ
//------------------------------------------------
//	����	: type	�퓬�I���^�C�v
//						END_TYPE_NONE	���b�Z�[�W�^�O�ݒ�
//						END_TYPE_WIN	��������
//						END_TYPE_LOSE	��������
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uAfterBattleDidcSubdue(type)
{
	if(type == END_TYPE_NONE){
		SetCrackNPCMessageNameTag_( "NAME_TAG_MASTER_NOCHORA" );
		switch ( g_disc_master_msg_type ){
		case 0:
			SetCrackNPCMessageTag_( MSG_TOUCHDISC_WIN_CMN_01, "DISC_NPCMSG_001_WIN_01");
			SetCrackNPCMessageTag_( MSG_TOUCHDISC_LOSE_CMN_01, "DISC_NPCMSG_001_LOSE_01");
			break;
		case 1:
			SetCrackNPCMessageTag_( MSG_TOUCHDISC_WIN_CMN_01, "DISC_NPCMSG_002_WIN_01");
			SetCrackNPCMessageTag_( MSG_TOUCHDISC_LOSE_CMN_01, "DISC_NPCMSG_002_LOSE_01");
			break;
		case 2:
			SetCrackNPCMessageTag_( MSG_TOUCHDISC_WIN_CMN_01, "DISC_NPCMSG_003_WIN_01");
			SetCrackNPCMessageTag_( MSG_TOUCHDISC_LOSE_CMN_01, "DISC_NPCMSG_003_LOSE_01");
			break;
		case 3:
			SetCrackNPCMessageTag_( MSG_TOUCHDISC_WIN_CMN_01, "DISC_NPCMSG_004_WIN_01");
			SetCrackNPCMessageTag_( MSG_TOUCHDISC_LOSE_CMN_01, "DISC_NPCMSG_004_LOSE_01");
			break;
		case 4:
			SetCrackNPCMessageTag_( MSG_TOUCHDISC_WIN_CMN_01, "DISC_NPCMSG_005_WIN_01");
			SetCrackNPCMessageTag_( MSG_TOUCHDISC_LOSE_CMN_01, "DISC_NPCMSG_005_LOSE_01");
			break;
		default:
			//�����ɂ͗��Ȃ��͂�
			break;
		}
	}
	if(type == END_TYPE_WIN){
		SetTalkAction_( g_crack_npc );

		uReservMessageDisplay( MSG_TOUCHDISC_WIN_CMN_01, true );
	}
	if(type == END_TYPE_LOSE){
		SetTalkAction_( g_crack_npc );

		//�s�k���b�Z�[�W
		uReservMessageDisplay( MSG_TOUCHDISC_LOSE_CMN_01, true );
	}
	
}



//++++++++++++++++++++++++++++++++++++++++++++++++
//		�}�X�^�[�E�A�C�e��  ��b����
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkMasterItem()
{
	// ���b�Z�[�W�^�O�ݒ�
	SetCrackNPCMessageNameTag_( "NAME_TAG_MASTER_NOCHORA" );

	switch (GetCrackNPCSubKind_()){
	//�`���ɖ𗧂Z�b�g�̃m�`���[��
	case eNPC_KIND_MASTER_ITEM_ITEMSET:
		SetCrackNPCMessageTag_( MSG_TOUCHMASTER_ASK_BATTLE, "NPCMSG_001_ASK_BATTLE");
		SetCrackNPCMessageTag_( MSG_TOUCHMASTER_SEL_YES,    "NPCMSG_001_YES_BATTLE_START");
		SetCrackNPCMessageTag_( MSG_TOUCHMASTER_SEL_NO,     "NPCMSG_001_NO_BATTLE_ESCAPE");
		break;
	//��̃m�`���[��
	case eNPC_KIND_MASTER_ITEM_SEED:
		SetCrackNPCMessageTag_( MSG_TOUCHMASTER_ASK_BATTLE, "NPCMSG_002_ASK_BATTLE");
		SetCrackNPCMessageTag_( MSG_TOUCHMASTER_SEL_YES,    "NPCMSG_002_YES_BATTLE_START");
		SetCrackNPCMessageTag_( MSG_TOUCHMASTER_SEL_NO,     "NPCMSG_002_NO_BATTLE_ESCAPE");
		break;
	//���_���̃m�`���[��
	case eNPC_KIND_MASTER_ITEM_MEDAL:
		SetCrackNPCMessageTag_( MSG_TOUCHMASTER_ASK_BATTLE, "NPCMSG_003_ASK_BATTLE");
		SetCrackNPCMessageTag_( MSG_TOUCHMASTER_SEL_YES,    "NPCMSG_003_YES_BATTLE_START");
		SetCrackNPCMessageTag_( MSG_TOUCHMASTER_SEL_NO,     "NPCMSG_003_NO_BATTLE_ESCAPE");
		break;
	//�X�L���̏؂̃m�`���[��
	case eNPC_KIND_MASTER_ITEM_PROOF:
		SetCrackNPCMessageTag_( MSG_TOUCHMASTER_ASK_BATTLE, "NPCMSG_006_ASK_BATTLE");
		SetCrackNPCMessageTag_( MSG_TOUCHMASTER_SEL_YES,    "NPCMSG_006_YES_BATTLE_START");
		SetCrackNPCMessageTag_( MSG_TOUCHMASTER_SEL_NO,     "NPCMSG_006_NO_BATTLE_ESCAPE");
		break;
	default :
		DebugPrint("WARNING : GetCrackNPCSubKind_�̒l���s���ł� [uTalkMasterItem]");
		break;
	}

	
	// �o�g�����邩�q�˂�
	uMessageOpenClose( MSG_TOUCHMASTER_ASK_BATTLE, true );
	// �͂�
	if (GetQueryResult_() == MES_QUERY_YES){
		uMessageOpenClose( MSG_TOUCHMASTER_SEL_YES, false );

		// �o�g���J�n
		SetEventFlg_("BFG_DEAD_KEEP_MAP", true);
		ChangeBattleParty_( GetCrackNPCPartyID_() );
	}
	// ������
	else{
		uMessageOpenClose( MSG_TOUCHMASTER_SEL_NO, false );
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		�}�X�^�[�E�S�[���h  ��b����
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkMasterGold()
{
	// ���b�Z�[�W�^�O�ݒ�
	SetCrackNPCMessageNameTag_( "NAME_TAG_MASTER_NOCHORA" );
	SetCrackNPCMessageTag_( MSG_TOUCHMASTER_ASK_BATTLE, "NPCMSG_004_ASK_BATTLE");
	SetCrackNPCMessageTag_( MSG_TOUCHMASTER_SEL_YES,    "NPCMSG_004_YES_BATTLE_START");
	SetCrackNPCMessageTag_( MSG_TOUCHMASTER_SEL_NO,     "NPCMSG_004_NO_BATTLE_ESCAPE");
	
	// �o�g�����邩�q�˂�
	uMessageOpenClose( MSG_TOUCHMASTER_ASK_BATTLE, true );
	// �͂�
	if (GetQueryResult_() == MES_QUERY_YES){
		uMessageOpenClose( MSG_TOUCHMASTER_SEL_YES, false );

		// �o�g���J�n
		SetEventFlg_("BFG_DEAD_KEEP_MAP", true);
		ChangeBattleParty_( GetCrackNPCPartyID_() );
	}
	// ������
	else{
		uMessageOpenClose( MSG_TOUCHMASTER_SEL_NO, false );
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		�}�X�^�[�E�V���b�v  ��b����
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkMasterShop()
{
	// ���b�Z�[�W�^�O�ݒ�
	SetCrackNPCMessageNameTag_( "NAME_TAG_MASTER_NOCHORA" );
	SetCrackNPCMessageTag_( MSG_TOUCHMASTER_ASK_BATTLE, "NPCMSG_005_ASK_BATTLE");
	SetCrackNPCMessageTag_( MSG_TOUCHMASTER_SEL_YES,    "NPCMSG_005_YES_BATTLE_START");
	SetCrackNPCMessageTag_( MSG_TOUCHMASTER_SEL_NO,     "NPCMSG_005_NO_BATTLE_ESCAPE");
	
	// �o�g�����邩�q�˂�
	uMessageOpenClose( MSG_TOUCHMASTER_ASK_BATTLE, true );
	// �͂�
	if (GetQueryResult_() == MES_QUERY_YES){
		uMessageOpenClose( MSG_TOUCHMASTER_SEL_YES, false );

		// �o�g���J�n
		SetEventFlg_("BFG_DEAD_KEEP_MAP", true);
		ChangeBattleParty_( GetCrackNPCPartyID_() );
	}
	// ������
	else{
		uMessageOpenClose( MSG_TOUCHMASTER_SEL_NO, false );
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		DISC����  ��b����
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkDiscSubdue()
{
	// ���b�Z�[�W�^�O�ݒ�i�p�^�[���֌W�Ȃ��̂ŃR�R�j
	SetCrackNPCMessageNameTag_( "NAME_TAG_MASTER_NOCHORA" );

	if ( g_disc_master_msg_type == C_NONE_ID ) {
		g_disc_master_msg_type = GetRandom_(5);
	}

	switch ( g_disc_master_msg_type ){
	case 0:
		SetCrackNPCMessageTag_( MSG_TOUCHDISC_ASK_BATTLE, "DISC_NPCMSG_001_ASK_BATTLE");
		SetCrackNPCMessageTag_( MSG_TOUCHDISC_SEL_YES, "DISC_NPCMSG_001_YES");
		SetCrackNPCMessageTag_( MSG_TOUCHDISC_SEL_NO, "DISC_NPCMSG_001_NO");
		break;
	case 1:
		SetCrackNPCMessageTag_( MSG_TOUCHDISC_ASK_BATTLE, "DISC_NPCMSG_002_ASK_BATTLE");
		SetCrackNPCMessageTag_( MSG_TOUCHDISC_SEL_YES, "DISC_NPCMSG_002_YES");
		SetCrackNPCMessageTag_( MSG_TOUCHDISC_SEL_NO, "DISC_NPCMSG_002_NO");
		break;
	case 2:
		SetCrackNPCMessageTag_( MSG_TOUCHDISC_ASK_BATTLE, "DISC_NPCMSG_003_ASK_BATTLE");
		SetCrackNPCMessageTag_( MSG_TOUCHDISC_SEL_YES, "DISC_NPCMSG_003_YES");
		SetCrackNPCMessageTag_( MSG_TOUCHDISC_SEL_NO, "DISC_NPCMSG_003_NO");
		break;
	case 3:
		SetCrackNPCMessageTag_( MSG_TOUCHDISC_ASK_BATTLE, "DISC_NPCMSG_004_ASK_BATTLE");
		SetCrackNPCMessageTag_( MSG_TOUCHDISC_SEL_YES, "DISC_NPCMSG_004_YES");
		SetCrackNPCMessageTag_( MSG_TOUCHDISC_SEL_NO, "DISC_NPCMSG_004_NO");
		break;
	case 4:
		SetCrackNPCMessageTag_( MSG_TOUCHDISC_ASK_BATTLE, "DISC_NPCMSG_005_ASK_BATTLE");
		SetCrackNPCMessageTag_( MSG_TOUCHDISC_SEL_YES, "DISC_NPCMSG_005_YES");
		SetCrackNPCMessageTag_( MSG_TOUCHDISC_SEL_NO, "DISC_NPCMSG_005_NO");
		break;
	default:
		//�����ɂ͗��Ȃ��͂�
		break;
	}

	// �o�g�����邩�q�˂�
	uMessageOpenClose( MSG_TOUCHDISC_ASK_BATTLE, true );
	// �͂�
	if (GetQueryResult_() == MES_QUERY_YES){
		uMessageOpenClose( MSG_TOUCHDISC_SEL_YES, false );
		//�퓬�J�n��
		SetEventFlg_("BFG_DEAD_KEEP_MAP", true);
		ChangeBattleParty_( GetCrackNPCPartyID_() );
	}
	// ������
	else{
		uMessageOpenClose( MSG_TOUCHDISC_SEL_NO, false);
	}
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		�ėp���b�Z�[�W�֐�
//------------------------------------------------
//	����	: msg		���b�Z�[�WID
//	����	: check		true = �I�[�v�������܂ܕ��Ȃ�
//						false = �I�[�v��������Ԃ������
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMessageOpenClose(msg, check)
{
	if ( check == true ) {
		OpenMsgWnd_();
		SetTalkName_(GetCrackNPCMessageNameTag_());
		ShowMsg_( GetCrackNPCMessageTag_(msg) );
		KeyInputWait_();
	}
	if ( check == false ) {
		ShowMsg_( GetCrackNPCMessageTag_(msg) );
		KeyInputWait_();
		CloseMsgWnd_();
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		�ėp���b�Z�[�W�֐�
//------------------------------------------------
//	����	: msg	���b�Z�[�WID
//	����	: false = �l�[���^�O���Atrue = �l�[���^�O�L��
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uReservMessageDisplay(msg, tagchk)
{
	OpenMsgWnd_();
	if ( tagchk == true ) {
		SetTalkName_(GetCrackNPCMessageNameTag_());
	}
	ShowMsg_( GetCrackNPCMessageTag_(msg) );
	KeyInputWait_();
	CloseMsgWnd_();
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
	
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
	WaitFade_();
	
	SetPos_(player, Vec3(-272.0, 10.0, -3.0));
	SetDir_(player, 110);
	SetCameraDir_(110);
	Wait_(10);
	
	SetFade_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
	WaitFade_();
}

