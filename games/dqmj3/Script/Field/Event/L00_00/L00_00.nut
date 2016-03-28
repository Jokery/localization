//===================== �ʐM���r�[ ====================
// BossDef.h �����{
const BOSS_FLOWKIND_NONE             = 0;
const BOSS_FLOWKIND_FIRSTCHECK       = 1;	// �����`�F�b�N
const BOSS_FLOWKIND_NPC_CHECK        = 2;	// NPC�`�F�b�N�t���[
const BOSS_FLOWKIND_NPC_REGIST       = 3;	// NPC�o�^�t���[
const BOSS_FLOWKIND_FGONLYT          = 4;	// �������s�O�`�F�b�N
const BOSS_FLOWKIND_ENTER_MENU_CHECK = 5;	// ���j���[�O�`�F�b�N(�t�B�[���h�j���[�^�C�g�����j���[)
const BOSS_FLOWKIND_CHECK_ONLY       = 6;	// �`�F�b�N�I�����[(�t�B�[���h�j���[�^�C�g�����j���[)
const BOSS_FLOWEXT_MESSAGE           = 1;	// ���b�Z�[�W�\��        �p�����[�^�F���b�Z�[�W���
const BOSS_FLOWEXT_SELECT            = 2;	// �I�����\��            �p�����[�^�F���b�Z�[�W���
const BOSS_FLOWEXT_ASSERT            = 3;	// �A�v���̋�����~      �p�����[�^�F���b�Z�[�W���
const BOSS_FLOWEXT_READY_APPLET      = 4;	// �A�v���b�g����/��n�� �p�����[�^�Ftrue/false
const BOSS_FLOWEXT_CREATE_EXTSDMC    = 5;	// �g���Z�[�u�쐬        �p�����[�^�Ftrue(�J�n) false(�I��)
const BOSS_FLOWEXT_SAVE              = 6;	// �Z�[�u
const BOSS_FLOWEXT_END               = 7;	// ����I��              �p�����[�^�F�����̐���

const BOSSDAT_KIND_STEALTHBOX_ITEM   = 1;	// ���̊ԂɃX�e���X�{�b�N�X �A�C�e��
const BOSSDAT_KIND_STEALTHBOX_MONS   = 2;	// ���̊ԂɃX�e���X�{�b�N�X �����X�^�[
const BOSSDAT_KIND_SKYMAPMONSTER     = 3;	// ���̊Ԃɍ���
const BOSSDAT_KIND_CROSS             = 4;	// ���̊Ԃɂ���Ⴂ

ace_npc <- null;				// ���̊Ԃ�NPC
wifi_runking_npc <- null;		//Wi-Fi�����L���ONPC
wifi_battle_npc <- null;		//Wi-Fi�ΐ�NPC
wifi_present_npc <- null;		//Wi-Fi�v���[���g�_�E�����[�hNPC
wifi_shop_npc <- null;			//Wi-Fi�V���b�vNPC
profile_npc <- null;			//�v���t�B�[���ݒ�NPC
meet_change_npc <- null;		//�������ӂ�ɂ�����NPC
training_battle_npc <- null;	//�g���[�j���O�o�g��NPC

gate_mine <- null;				//�o�����p�n��
hologram_mine <- null;			//�z���O�������u�p�n��

//-------------------- ������ --------------------
//�N�������F�t�F�[�h�C��
//-------------------- ������ --------------------
function FadeIn()
{
	// �g���[�j���O�o�g�����փt���O
	SetEventFlg_("BFG_FREE_BATTLE_UNLOCK", true);	// �g���[�j���O�o�g������t���O�𗧂Ă�
	SetEventFlg_("BFG_TRAVEL_INFO_SHOW_060", true); // ���̐S���̍��ډ���t���O	�y�o�[�`�����R���V�A���z�g���[�j���O�o�g��
	
	// BOSS�K�C�h���C��
//	if (GetEventFlg_("BFG_BOSS_ENABLE") == true )
	local n000ResId = ReadNpc_("n002");			// �G�[�X
	local n001ResId = ReadNpc_("m007_00");		// �X���C���^���[�iWi-Fi�����L���O�j
	local n002ResId = ReadNpc_("m111_00");		// ���܂悤��낢�iWi-Fi�ΐ�j
	local n003ResId = ReadNpc_("m100_02");		// ���b�h�v�����iWi-Fi�v���[���g�j
	local n004ResId = ReadNpc_("m128_02");		// ���C�����~�~�b�N�iWi-Fi�V���b�v�j
	local n005ResId = ReadNpc_("m113_00");		// �G���^�V�X�}���i�v���t�B�[���j
	local n007ResId = ReadNpc_("m045_01");		// ���炭��`���b�s�[�i�g���[�j���O�o�g���j

	ace_npc = ArrangePointNpc_(n000ResId, "ace00");
	wifi_runking_npc = ArrangePointNpc_(n001ResId, "npc00");
	wifi_battle_npc = ArrangePointNpc_(n002ResId, "npc01");
	wifi_present_npc = ArrangePointNpc_(n003ResId, "npc02");
	
	// ���b�h�v�����͕�������
	local wifi_present_npc_pos = GetPos_(wifi_present_npc);
	wifi_present_npc_pos.y += 5;
	SetPosNoFit_(wifi_present_npc, wifi_present_npc_pos);
	
	wifi_shop_npc = ArrangePointNpc_(n004ResId, "npc03");
	profile_npc = ArrangePointNpc_(n005ResId, "npc04");
	training_battle_npc = ArrangePointNpc_(n007ResId, "npc06");
	
	// ��b�\�p�x�ݒ�
	SetSearchableAngle_(wifi_runking_npc, SEARCHABLE_ANGLE_MINIMUM);
	SetSearchableAngle_(wifi_battle_npc, SEARCHABLE_ANGLE_MINIMUM);
	SetSearchableAngle_(wifi_present_npc, SEARCHABLE_ANGLE_MINIMUM);
	SetSearchableAngle_(wifi_shop_npc, SEARCHABLE_ANGLE_MINIMUM);
	
	//NPC�X�P�[���ݒ�	
	SetScaleSilhouette(wifi_runking_npc, SCALE.WIFIRANKING, SILHOUETTE_WIDTH.S);
	SetScaleSilhouette(wifi_battle_npc, SCALE.WIFIBATTLE, SILHOUETTE_WIDTH.N);
	SetScaleSilhouette(wifi_present_npc, SCALE.WIFIPRESENT, SILHOUETTE_WIDTH.S);
	SetScaleSilhouette(wifi_shop_npc, SCALE.WIFISHOP, SILHOUETTE_WIDTH.N);
	SetScaleSilhouette(profile_npc, SCALE.WIFIPROFILE, SILHOUETTE_WIDTH.N);
	SetScaleSilhouette(training_battle_npc, SCALE.N, SILHOUETTE_WIDTH.N);

	// ���A�N�^�[���b�Z�[�W
	SetReactorMsg_(ace_npc, "REC_NPC_ace");
	SetReactorMsg_(wifi_runking_npc, "REC_NPC_wifi_runking");
	SetReactorMsg_(wifi_battle_npc, "REC_NPC_wifi_battle");
	SetReactorMsg_(wifi_present_npc, "REC_NPC_wifi_present");
	SetReactorMsg_(wifi_shop_npc, "REC_NPC_wifi_shop");
	SetReactorMsg_(profile_npc, "REC_NPC_profile");
	SetReactorMsg_(training_battle_npc, "REC_NPC_training");
	
	// ��b�J�����ݒ�
	SetTalkCameraType_(ace_npc, TALK_CAMERA_UP);
	SetTalkCameraType_(wifi_runking_npc, TALK_CAMERA_UP);
	SetTalkCameraType_(wifi_battle_npc, TALK_CAMERA_UP);
	SetTalkCameraType_(wifi_present_npc, TALK_CAMERA_UP);
	SetTalkCameraType_(wifi_shop_npc, TALK_CAMERA_UP);
	SetTalkCameraType_(profile_npc, TALK_CAMERA_UP);
	SetTalkCameraType_(training_battle_npc, TALK_CAMERA_UP);
	
	// �������ӂ�ɂ��������͕\�V�i���I�N���A��ɔz�u
	local main_num  = GetNumFlg_("NUM_SCENARIO_MAIN");
	if(main_num >= GetFlagID_("CONST_SM_INSIDE_CLEAR")){	// NUM000 = 9 �ȏ�
		local n006ResId = ReadNpc_("m002_02");				// �S�[���h�G���[���i�������ӂ�ɂ������j
		meet_change_npc = ArrangePointNpc_(n006ResId, "npc05");
		SetScaleSilhouette(meet_change_npc, SCALE.S, SILHOUETTE_WIDTH.S);
		SetReactorMsg_(meet_change_npc, "REC_NPC_meet");	
		SetTalkCameraType_(meet_change_npc, TALK_CAMERA_UP);
		
		SetEventFlg_("BFG_MAP_ICON_056", true);		// Bit1856 : �I�A�C�R��  �����ӂ������������
	}
	
	if (GetEventFlg_("BFG_BOSS_ENABLE") == true )
	{
		if (BossLoadNewStealthBoxData_())
		{
			BossArrangeStealthBox_("stealthbox00");
		}
	}
	
	gate_mine = SetPointCircleEventMine_("mine00", true);
	
	// �z���O�������ׂ�n��
	hologram_mine = SetPointCircleEventMine_("hologram_mine", true);
	
	// ���[�v���u�p�G�t�F�N�g
	LoadEffect_("ef510_16_wireless_warp");

	EventEnd_();
}

//-------------------- ������ --------------------
//�N�������F�}�b�v�`�F���W���Ă�����
//-------------------- ������ --------------------
function EventStartOperate()
{
	
	// �K�C�h���C���`�F�b�N���I����Ă���A�e���j���[�߂胁�b�Z�[�W��\������
	// WIFI�o�g������߂��Ă������̃��b�Z�[�W
	if(GetEventFlg_("BFG_WIFI_BATTLE_RETURN_MESSAGE")){
		EventStartOperateTalkAction(wifi_battle_npc)
		TalkWiFiBattleMenuClose();
		SetEventFlg_("BFG_WIFI_BATTLE_RETURN_MESSAGE", false);
	}
	// �t���[�o�g������߂��Ă������̃��b�Z�[�W
	else if(GetEventFlg_("BFG_WIFI_FREE_BATTLE_RTN_MSG")){
		EventStartOperateTalkAction(training_battle_npc)
		TalkWiFiFreeBattleMenuClose();
		SetEventFlg_("BFG_WIFI_FREE_BATTLE_RTN_MSG", false);
	}
	// �v���t�B�[���ݒ肩��߂��Ă������̃��b�Z�[�W
	else if(GetEventFlg_("BFG_WIFI_PROFILE_RTN_MSG")){
		EventStartOperateTalkAction(profile_npc)
		TalkWiFiProfileMenuClose();
		SetEventFlg_("BFG_WIFI_PROFILE_RTN_MSG", false);
	}
	// Wi-Fi�����L���O���j���[���甲�������̃��b�Z�[�W��\��<2��DB #3067>
	else if(GetEventFlg_("BFG_WIFI_RANKING_RETURN_MSG")){
		EventStartOperateTalkAction(wifi_runking_npc)
		TalkWiFiRankingMenuReturnMsg();
		SetEventFlg_("BFG_WIFI_RANKING_RETURN_MSG", false); // �uBFG_WIFI_RANKING_RETURN_MSG�v�̓v���O��������true�ɂ��ăX�N���v�g����false�ɂ��Ă��܂��B
	}
	// �ʏ�̃}�b�v�`�F���W�iBOSS�K�C�h���C���`�F�b�N�j
	else if (GetEventFlg_("BFG_BOSS_ENABLE") == true )
	{
		// ��ʂ��B��
		SetNavimapVisible_(false);
		SetFade_(FADE_OUT, FADE_COLOR_BLACK, 1);
		
		// �`�F�b�N���đʖڂȂ��
		local index = BossTaskGuideFlowMenu_(BOSS_FLOWKIND_CHECK_ONLY);
		WaitTask( index );
		if (!BossTaskGuideFlowMenuResult_())
		{
			local index = BossTaskGuideFlowMenu_(BOSS_FLOWKIND_ENTER_MENU_CHECK);
			WaitTask( index );
		}
		
		// �t�F�[�h�ŕ��A
		SetFade_(FADE_IN, FADE_COLOR_BLACK, 30);
		SetNavimapVisible_(true);
	}
	
	EventEnd_();
}

//-------------------- NPC --------------------
//�N�������FNPC�Ɍ�������A�{�^���������ꂽ��
//-------------------- NPC --------------------
function TouchNpc()
{
	local target = GetTargetId_();
	local bit = false;
	local bit_boss_able;
	
	if (target == ace_npc)
	{
		if (GetEventFlg_("BFG_BOSS_ENABLE") == true )
		{
			bit_boss_able = BossNPCGuideLineFlow( BOSS_FLOWKIND_NPC_REGIST );
			if (bit_boss_able)
			{
				// ���̊Ԃɂ��N����
				OpenMsgWnd_();
					SetTalkName_( "NAME_TAG_ACE" );
					ShowMsg_( "npc_boss_mes_02" );
					KeyInputWait_();
				CloseMsgWnd_();
				// �{�X��~�t���[
				BossNPCUnRegistFlow();
			}
		}else{
			// Boss ����
			OpenMsgWnd_();
				SetTalkName_( "NAME_TAG_ACE" );
				ShowMsg_( "npc_boss_mes_01" );
				KeyInputWait_();
			CloseMsgWnd_();
			// �m�F
			OpenMsgWnd_();
				SetTalkName_( "NAME_TAG_ACE" );
				ShowMsg_( "npc_boss_mes_01_ask" );
				KeyInputWait_();
			CloseMsgWnd_();
			if (GetQueryResult_() == MES_QUERY_YES)
			{
				bit_boss_able = BossNPCGuideLineFlow( BOSS_FLOWKIND_NPC_REGIST );
				if (bit_boss_able)
				{
					SetEventFlg_("BFG_BOSS_ENABLE", true);
					// �^�X�N�o�^
					BossRegistTasks_();
					// �Z�[�u
					local index = Task_Save_();
					WaitTask( index );
					
					// 
					OpenMsgWnd_();
						SetTalkName_( "NAME_TAG_ACE" );
						ShowMsg_( "npc_boss_mes_01_yes" );
						KeyInputWait_();
					CloseMsgWnd_();
				}
			}else{
				OpenMsgWnd_();
				SetTalkName_( "NAME_TAG_ACE" );
				ShowMsg_( "npc_boss_mes_01_no" );
				KeyInputWait_();
				CloseMsgWnd_();
				
				// �^�X�N�����Ă���
				BossUnRegistTasks_();
			}
		}
	}

	//Wi-Fi�����L���ONPC
	if (target == wifi_runking_npc)
	{
		TalkWiFiRanking();
	}
	
	// Wi-Fi�ΐ�NPC
	if (target == wifi_battle_npc)
	{
		TalkWiFiBattle();
	}
	
	// Wi-Fi�v���[���gNPC
	if (target == wifi_present_npc)
	{
		TalkWiFiPresent();
	}
	
	// Wi-Fi�V���b�vNPC
	if (target == wifi_shop_npc)
	{
		TalkWiFiShop();
	}
	
	// �v���t�B�[��NPC
	if (target == profile_npc)
	{
		TalkProfileSetting();
	}
	
	// �������ӂ�ɂ�������NPC
	if (target == meet_change_npc)
	{
		TalkMeetChange();
	}
	
	// �g���[�j���O�o�g��NPC
	if (target == training_battle_npc)
	{
		TalkTrainingBattle();
	}
	
	
	EventEnd_();
}

//-------------------- �n�� --------------------
//�N�������F�n���ɐG�ꂽ or �n���̏��A�{�^���������ꂽ��
//-------------------- �n�� --------------------
function TouchEventMine()
{
	local target = GetTouchEventMineId_();
	
	if(target == gate_mine){
		// �ǂ��ɖ߂邩�̑I��
		OpenMsgWnd_();
			ShowMsg_( "sys_gate_mes_00" );
			KeyInputWait_();
		CloseMsgWnd_();
		
		switch (GetQueryResult_()){
			case QUERY3_0:	// �t�B�[���h
				CommonGateWarp();
				ChangeNetworkLobbyToField_();
				break;
			case QUERY3_1:	// �^�C�g��
				CommonGateWarp();
				ChangeNetworkLobbyToTitle_();
				break;
			case QUERY3_2:	// ��߂�
				break;
		}
	}
	else if(target == hologram_mine){	// �z���O�����n���𒲂ׂ�ƃI�����C����ԃ��b�Z�[�W�\��
		// �w�肵�����W�̕�������
		local pos = Vec3(0.0, 0.0, -255.0);
		uPlayerTurnAroundPos(pos);
		// ���b�Z�[�W�\��
		OpenMsgWnd_();
			if(CheckNetworkLogin_()){	// �I�����C���Ȃ�
				ShowMsg_( "hologram_01" );
			} else {	// �I�t���C���Ȃ�
				ShowMsg_( "hologram_00" );
			}
			KeyInputWait_();
		CloseMsgWnd_();
	}
	EventEnd_();
}


//-------------------- NPC --------------------
// BOSS��~�t���[
//-------------------- NPC --------------------
function BossNPCUnRegistFlow()
{
	print("BossNPCUnRegistFlow\n");
	// ���̊Ԃɕs���t���[
	OpenMsgWnd_();
		SetTalkName_( "NAME_TAG_ACE" );
		ShowMsg_( "npc_boss_mes_02_ask" );
		KeyInputWait_();
	CloseMsgWnd_();
	if (GetQueryResult_() == MES_QUERY_YES)
	{
		SetEventFlg_("BFG_BOSS_ENABLE", false);
		// �^�X�N�o�^
		BossUnRegistTasks_();
		// �Z�[�u
		local index = Task_Save_();
		WaitTask( index );
		
		// 
		OpenMsgWnd_();
			SetTalkName_( "NAME_TAG_ACE" );
			ShowMsg_( "npc_boss_mes_02_yes" );
			KeyInputWait_();
		CloseMsgWnd_();
	}else{
		OpenMsgWnd_();
		SetTalkName_( "NAME_TAG_ACE" );
		ShowMsg_( "npc_boss_mes_02_no" );
		KeyInputWait_();
		CloseMsgWnd_();
	}
}

//-------------------- NPC --------------------
// Boss�̃K�C�h���C���t���[
//-------------------- NPC --------------------
function BossNPCGuideLineFlow( check_kind )
{
	local bit_boss_able = false;
	local loop = true;
	local closeWin = false;
	local closeDialog = false;
	while(loop)
	{
		BossNPCRegistFlow_( check_kind );
		local flow_kind  = BossNPCRegistFlowGetKind_();
		local flow_param = BossNPCRegistFlowGetParam_();
		if (closeWin)
		{
			CloseMsgWnd_();
			closeWin = false;
		}
		if (closeDialog)
		{
			CloseDialog_();
			closeDialog = false;
		}
		
		switch(flow_kind)
		{
			case BOSS_FLOWEXT_MESSAGE:
				print("BOSS_FLOWEXT_MESSAGE\n");
				OpenMsgWnd_();
				SetTalkName_( "NAME_TAG_ACE" );
				ShowMsg_( "npc_boss_flow_" + flow_param );
				KeyInputWait_();
				CloseMsgWnd_();
				BossNPCRegistFlowResponse_( -1 )
				break;
			case BOSS_FLOWEXT_SELECT:
				print("BOSS_FLOWEXT_SELECT\n");
				OpenMsgWnd_();
				SetTalkName_( "NAME_TAG_ACE" );
				ShowMsg_( "npc_boss_flow_" + flow_param );
				KeyInputWait_();
				CloseMsgWnd_();
				if (GetQueryResult_() == MES_QUERY_YES)
				{
					// �͂�
					BossNPCRegistFlowResponse_( 1 )
				}else{
					// ������
					BossNPCRegistFlowResponse_( 0 )
				}
				break;
			case BOSS_FLOWEXT_READY_APPLET:
				BossNPCRegistFlowResponse_( -1 )
				break;
			case BOSS_FLOWEXT_CREATE_EXTSDMC:
				print("BOSS_FLOWEXT_SELECT ACE\n");
				// �Z�[�u����
				OpenDialog_( "npc_boss_flow_13", false, true );
				BossNPCRegistFlowResponse_( -1 )
				closeDialog = true;
				break;
			case BOSS_FLOWEXT_SAVE:
				print("BOSS_FLOWEXT_SAVE ACE\n");
				// �Z�[�u
				{
					local index = Task_Save_();
					WaitTask( index );
				}
				BossNPCRegistFlowResponse_( -1 );
				break;
			case BOSS_FLOWEXT_END:
				print("BOSS_FLOWEXT_END\n");
				loop = false;
				bit_boss_able = flow_param;
				BossNPCRegistFlowResponse_( -1 );
				break;
		}
		
	}
	print("bit_boss_able " + bit_boss_able + "\n");
	return bit_boss_able;
}


//-------------------- NPC --------------------
//�N�������F�X�e���X�{�b�N�X��Open�����Ƃ�
//-------------------- NPC --------------------
function OpenTreasureBox()
{
	// �����I�ɉ�b��Ԃ�ݒ�
	SetTalkCameraType_(ace_npc, TALK_CAMERA_UP);
	SetTalkAction_(ace_npc);
	
	OpenMsgWnd_();
		SetTalkName_( "NAME_TAG_ACE" );
		ShowMsg_( "npc_boss_mes_getbox" );
		KeyInputWait_();
	CloseMsgWnd_();
	// BOSS�f�[�^�Ɋ��ǃt���O�𗧂ĂĂ���
	BossSetReadFlagToStealthBox_();
	// �Z�[�u
	local index = Task_Save_();
	WaitTask( index );
	
	
	EventEnd_();
}

//------------- L00_00 �p�֐�-----------------
// �]�����u�œ]������鎞�̋��ʏ���
//------------- L00_00 �p�֐�-----------------
function CommonGateWarp()
{
	// �u�I�v���o�Ȃ��悤�ɐ�ɒn���������Ă���
	DeleteEventMine_(gate_mine);
	gate_mine = null;

	// �n���̒��S�Ɍ������ĕ����Ă���
	local playerId = GetPlayerId_();
	SetMotion_(playerId, MOT_WALK, BLEND_M);
	local moveTask = Task_MoveToPointSetSpeed_(playerId, "mine00", FORWARD_MOVE_SPEED);
	WaitTask(moveTask);
	SetMotion_(playerId, MOT_WAIT, BLEND_M);

	// ���[�v�G�t�F�N�g
	// �G�t�F�N�g�����[�v���u�ɂ��܂��Ă��܂��̂ŁAy���W�������グ��
	SetPosWorldEffect_("ef510_16_wireless_warp", Vec3(0, 15.523, -102.343));
	PlaySE_("SE_FLD_066");
	Wait_(30);

	// ��ʂ𔒃t�F�[�h
	SetFade_(FADE_OUT, FADE_COLOR_WHITE, 10);
	WaitFade_();
}

//------------- L00_00 �p�֐�-----------------
// Wi-Fi�����L���O�p��b�t���[
//------------- L00_00 �p�֐�-----------------
function TalkWiFiRanking()
{
	SetEventFlg_("BFG_MAP_ICON_052", true);		// Bit1852 : NEW�A�C�R�� Wi-Fi�����L���O
	
	OpenMsgWnd_();	// ���b�Z�[�W�����^�C�~���O�̓��j���[�O�����b�Z�[�W�I�������

	ShowMsg_( "wifi_ranking_00" );		// �u�����́@Wi-Fi�����L���O��
	KeyInputWait_();

	if(CheckPlayerNameNgWord_()){	// �֎~�p�ꂪ�������ꍇ
		ShowMsg_( "wifi_ranking_03" );	// �u�����H�@�v���C���[�̖��O���@Mii�̖��O��
		KeyInputWait_();
		ShowMsg_( "wifi_ranking_04" );	// �u�v���t�B�[���ݒ�Ł@���O��ς��Ă���
		KeyInputWait_();
		CloseMsgWnd_();	// �������ŃE�B���h�E����
	} else {
		// �֎~�p�ꂪ���������ꍇ
		if(!GetEventFlg_("BFG_WIFI_RANKING_1ST_MESSAGE")){	// ���񃁃b�Z�[�W���K�v��
			ShowMsg_( "wifi_ranking_05" );	// �uWi-Fi�����L���O�ɎQ������ۂɂ́c�c
			KeyInputWait_();
			ShowMsg_( "wifi_ranking_06" );	// �u�v���C���[�⃂���X�^�[�@Mii�Ȃǂ̏���
			KeyInputWait_();
			ShowMsg_( "wifi_ranking_07" );	// �u�C���^�[�l�b�g�ʐM���g���@����
			KeyInputWait_();
			
			if (GetQueryResult_() == MES_QUERY_YES){
				// �u�͂��v�I��
				SetEventFlg_("BFG_WIFI_RANKING_1ST_MESSAGE", true);	// ���񃁃b�Z�[�W�𕷂����t���O��true��
				ShowMsg_( "wifi_ranking_08" );	// �u���肪�Ƃ��`�B�@���ꂶ��@���߂āc�c
				KeyInputWait_();
				CloseMsgWnd_();		// �������ŃE�B���h�E����
				GotoMenuFadeOpen(MENU_OPEN.WIFI_RANKING);	// ���j���[���J��
				// ���j���[����߂����ۂ̃��b�Z�[�W
				TalkWiFiRankingMenuClose();
				// ���j���[�ŏ��̉�ʂ���߂����ۂ͏I�����b�Z�[�W���o��̂ŁA�t���O������
			} else {
				// �u�������v�I��
				ShowMsg_( "wifi_ranking_09" );	// �u����͎c�O�`�B
				KeyInputWait_();
				CloseMsgWnd_();	// �������ŃE�B���h�E����
			}
			
		} else {
			// ���񃁃b�Z�[�W���s�v�Ȏ�
			ShowMsg_( "wifi_ranking_01" );	// �u�����́@�ǂ�Ȃ��p�ł����`�H
			KeyInputWait_();
			CloseMsgWnd_();	// �������ŃE�B���h�E����
			GotoMenuFadeOpen(MENU_OPEN.WIFI_RANKING);	// ���j���[���J��
			// ���j���[����߂����ۂ̃��b�Z�[�W
			TalkWiFiRankingMenuClose();
		}
	}
}


//------------- L00_00 �p�֐�-----------------
// Wi-Fi�����L���O�p�I�����b�Z�[�W
//------------- L00_00 �p�֐�-----------------
function TalkWiFiRankingMenuClose()
{
	// ���j���[����߂����ۂ̃��b�Z�[�W
	OpenMsgWnd_();
	ShowMsg_( "wifi_ranking_02" );	// �u�܂��V�тɗ��Ăˁ`
//	ShowMsg_( "wifi_ranking_10" );	// �u���Ⴀ�@�܂��ˁI
	KeyInputWait_();
	CloseMsgWnd_();	// �������ŃE�B���h�E����
}


//------------- L00_00 �p�֐�----------------------
// Wi-Fi�����L���O���j���[���甲�������̃��b�Z�[�W 
//------------- L00_00 �p�֐�----------------------
function TalkWiFiRankingMenuReturnMsg()
{
	// ���j���[����߂����ۂ̃��b�Z�[�W
	OpenMsgWnd_();
	ShowMsg_( "wifi_ranking_10" );	// �u���Ⴀ�@�܂��ˁI
	KeyInputWait_();
	CloseMsgWnd_();	// �������ŃE�B���h�E����
}


//------------- L00_00 �p�֐�-----------------
// Wi-Fi�o�g���p��b�t���[
//------------- L00_00 �p�֐�-----------------
function TalkWiFiBattle()
{
	SetEventFlg_("BFG_MAP_ICON_053", true);		// Bit1853 : NEW�A�C�R�� Wi-Fi�ΐ�
	
	OpenMsgWnd_();	// ���b�Z�[�W�����^�C�~���O�̓��j���[�O�����b�Z�[�W�I�������

	ShowMsg_( "wifi_battle_00" );		// �u�����́@Wi-Fi�ΐ��
	KeyInputWait_();

	if(CheckPlayerNameNgWord_()){	// �֎~�p�ꂪ�������ꍇ
		ShowMsg_( "wifi_battle_03" );	// �u��H�@�v���C���[�̖��O���@Mii�̖��O��
		KeyInputWait_();
		ShowMsg_( "wifi_battle_04" );	// �u�v���t�B�[���ݒ�Ł@���O��ς��Ă���
		KeyInputWait_();
		CloseMsgWnd_();	// �������ŃE�B���h�E����
	} else {
		// �֎~�p�ꂪ���������ꍇ
		if(!GetEventFlg_("BFG_WIFI_BATTLE_1ST_MESSAGE")){	// ���񃁃b�Z�[�W���K�v��
			ShowMsg_( "wifi_battle_05" );	// �uWi-Fi�����L���O�ɎQ������ۂɂ́c�c
			KeyInputWait_();
			ShowMsg_( "wifi_battle_06" );	// �u�v���C���[�⃂���X�^�[�@Mii�Ȃǂ̏���
			KeyInputWait_();
			ShowMsg_( "wifi_battle_07" );	// �u�C���^�[�l�b�g�ʐM���g���@����
			KeyInputWait_();
			
			if (GetQueryResult_() == MES_QUERY_YES){
				// �u�͂��v�I��
				SetEventFlg_("BFG_WIFI_BATTLE_1ST_MESSAGE", true);	// ���񃁃b�Z�[�W�𕷂����t���O��true��
				ShowMsg_( "wifi_battle_08" );	// �u���߂āc�c�����́@Wi-Fi�ΐ��
				KeyInputWait_();
				if (GetQueryResult_() == MES_QUERY_YES){
					CloseMsgWnd_();	// �������ŃE�B���h�E����
					GotoMenuSceneFadeOut();
					GotoMenuScene_(MENU_SCENE.WIFI_BATTLE);
				} else {
					ShowMsg_( "wifi_battle_02" );	// �u�܂��́@�����p���@���҂����Ă��܂����I
					KeyInputWait_();
					CloseMsgWnd_();	// �������ŃE�B���h�E����
				}
				
			} else {
				// �u�������v�I��
				ShowMsg_( "wifi_battle_09" );	// �u�ނނށc�c����́@�c�O�ł����B
				KeyInputWait_();
				CloseMsgWnd_();	// �������ŃE�B���h�E����
			}
			
		} else {
			// ���񃁃b�Z�[�W���s�v�Ȏ�
			ShowMsg_( "wifi_battle_01" );	// �uWi-Fi�ΐ�Ɂ@�Q������܂����H
			KeyInputWait_();
			if (GetQueryResult_() == MES_QUERY_YES){
				CloseMsgWnd_();	// �������ŃE�B���h�E����
				GotoMenuSceneFadeOut();
				GotoMenuScene_(MENU_SCENE.WIFI_BATTLE);
			} else {
				ShowMsg_( "wifi_battle_02" );	// �u�܂������p���������܂��I
				KeyInputWait_();
				CloseMsgWnd_();	// �������ŃE�B���h�E����
			}
		}
	}
}

//------------- L00_00 �p�֐�-----------------
// Wi-Fi�o�g���p�I�����b�Z�[�W
//------------- L00_00 �p�֐�-----------------
function TalkWiFiBattleMenuClose()
{
	// ���j���[����߂����ۂ̃��b�Z�[�W
	OpenMsgWnd_();
	ShowMsg_( "wifi_battle_10" );	// �u�܂��́@�����p���@���҂����Ă��܂����B
	KeyInputWait_();
	CloseMsgWnd_();	// �������ŃE�B���h�E����
}


//------------- L00_00 �p�֐�-----------------
// Wi-Fi�v���[���g�p��b�t���[
//------------- L00_00 �p�֐�-----------------
function TalkWiFiPresent()
{
	SetEventFlg_("BFG_MAP_ICON_054", true);		// Bit1854 :�v���[���g�_�E�����[�h
	
	OpenMsgWnd_();	// ���b�Z�[�W�����^�C�~���O�̓��j���[�O�����b�Z�[�W�I�������
	
	ShowMsg_( "wifi_present_00" );		// �u�v���[���g�f�[�^�́@�_�E�����[�h��
	KeyInputWait_();
	ShowMsg_( "wifi_present_01" );		// �u�_�E�����[�h�̏����́@
	KeyInputWait_();
	if (GetQueryResult_() == MES_QUERY_YES)
	{
		CloseMsgWnd_();	// �������ŃE�B���h�E����
		// �͂� ��I�񂾎�
		GotoMenuFadeOpen(MENU_OPEN.WIFI_DATA_DL);
		
		OpenMsgWnd_();	// ���j���[�𔲂������̃��b�Z�[�W
		ShowMsg_( "wifi_present_03" );		// �u�܂�������ȁI�@�҂��Ă邺�I
		KeyInputWait_();
		CloseMsgWnd_();	// �������ŃE�B���h�E����
	} else {
		// ������ ��I�񂾎�
		ShowMsg_( "wifi_present_02" );	// �u���ł��@�҂��Ă�����ȁ`�I
		KeyInputWait_();
		CloseMsgWnd_();	// �������ŃE�B���h�E����
	}
}

//------------- L00_00 �p�֐�-----------------
// Wi-Fi�V���b�v�p��b�t���[
//------------- L00_00 �p�֐�-----------------
function TalkWiFiShop()
{
	SetEventFlg_("BFG_MAP_ICON_055", true);		// Bit1855 :�ʐM�R�C��������
	
	OpenMsgWnd_();
	ShowMsg_( "wifi_shop_00" );		// �u�����́@�ʐM�R�C�����������ׁB
	KeyInputWait_();
	CloseMsgWnd_();
	
	GotoMenuFadeOpen(MENU_OPEN.WIFI_SHOP);
	
	// �t���[���甲�������̃��b�Z�[�W
	OpenMsgWnd_();
	ShowMsg_( "wifi_shop_01" );		// �u���߂����@�܂�����̂��@�҂��Ă�ׁI
	KeyInputWait_();
	CloseMsgWnd_();
	
	
}

//------------- L00_00 �p�֐�-----------------
// �v���t�B�[���ݒ�p��b�t���[
//------------- L00_00 �p�֐�-----------------
function TalkProfileSetting()
{
	OpenMsgWnd_();	// ���b�Z�[�W�����^�C�~���O�̓��j���[�O�����b�Z�[�W�I�������
	
	ShowMsg_( "profile_00" );		// �u�悤�����@�݂�Ȃ̒ʐM���r�[�ցI
	KeyInputWait_();
	
	ShowMsg_( "profile_01" );		// �u���Ȃ��̃v���t�B�[��
	KeyInputWait_();
	if (GetQueryResult_() == MES_QUERY_YES)
	{
		CloseMsgWnd_();	// �������ŃE�B���h�E����
		GotoMenuSceneFadeOut();
		// �͂� ��I�񂾎�
		GotoMenuScene_(MENU_SCENE.PROFILE_SETTING);
	} else {
		// ������ ��I�񂾎�
		ShowMsg_( "profile_02" );	// �u�܂���������Ⴂ�I
		KeyInputWait_();
		CloseMsgWnd_();	// �������ŃE�B���h�E����
	}
}

//------------- L00_00 �p�֐�-----------------
// Wi-Fi�v���t�B�[���p�I�����b�Z�[�W
//------------- L00_00 �p�֐�-----------------
function TalkWiFiProfileMenuClose()
{
	// ���j���[����߂����ۂ̃��b�Z�[�W
	OpenMsgWnd_();
	ShowMsg_( "profile_03" );	// �u���ꂶ��@�܂����ˁ`��I
	KeyInputWait_();
	CloseMsgWnd_();	// �������ŃE�B���h�E����
}


//------------- L00_00 �p�֐�-----------------
// �������ӂ�ɂ��������p��b�t���[
//------------- L00_00 �p�֐�-----------------
function TalkMeetChange()
{
	OpenMsgWnd_();			// �������ŃE�B���h�E���J��
	
	ShowMsg_( "meet_change_00" );				//�u���ققفI�@�悭������ˁI
	KeyInputWait_();
	ShowMsg_( "meet_change_01" );				//�u�����́@�������ӂ�ɂ��������@�P����
	KeyInputWait_();
	ShowMsg_( "meet_change_02" );				//�u�������ӂ�ɂ��������Ɓ@�������ӂ�ɂ���
	KeyInputWait_();
	if (GetQueryResult_() == MES_QUERY_YES){
		// �͂� ��I�񂾎�
		local meet_ticket = GetItemNum_(67);	// �������ӂ�ɂ�������
		if(meet_ticket >= 1){
			// �������ӂ�ɂ��������������Ă�����
			ShowMsg_( "meet_change_04" );		//�u�ł́@��������ǂ����T�}�X�I
			KeyInputWait_();
			CloseMsgWnd_();	// �������ŃE�B���h�E����
			
			AddItem_(48, meet_ticket);			// �������ӂ�ɂ����������̐������莝���ɒǉ�
			AddItem_(67, -meet_ticket);			// �������ӂ�ɂ���������S�Ė�����
			
			OpenMsgWnd_();	// �������ŃE�B���h�E���J��
			ShowMsg_( "meet_change_05" );		//�u����l���̖��O���́@�������ӂ�ɂ���������
			PlayMe_("ME_010"); 					// �d�v�A�C�e������ME
			WaitMe_();
			KeyInputWait_();
			CloseMsgWnd_();	// �������ŃE�B���h�E����
			
			OpenMsgWnd_();	// �������ŃE�B���h�E���J��
			ShowMsg_( "meet_change_08" );		//�u�ǂ�Ȗ������ꔭ�Ł@���������ɂȂ��Ă��܂�
			KeyInputWait_();
			CloseMsgWnd_();	// �������ŃE�B���h�E����
		}else{
			// �������ӂ�ɂ��������������Ă��Ȃ�������
			ShowMsg_( "meet_change_06" );		//�u���炠��H�@�ǂ����@�������ӂ�ɂ���������
			KeyInputWait_();
			ShowMsg_( "meet_change_07" );		//�u�������ӂ�ɂ����������@��ɓ��ꂽ��
			KeyInputWait_();
			CloseMsgWnd_();	// �������ŃE�B���h�E����
		}
	} else {
		// ������ ��I�񂾎�
		ShowMsg_( "meet_change_03" );			//�u�܂��@����͎c�O�U�}�X�B
		KeyInputWait_();
		CloseMsgWnd_();	// �������ŃE�B���h�E����
	}
}

//------------- L00_00 �p�֐�-----------------
// �g���[�j���O�o�g���p��b�t���[
//------------- L00_00 �p�֐�-----------------
function TalkTrainingBattle()
{
	// �t���O�擾
	local mes_flg = GetEventFlg_("BFG_FREE_BATTLE_FIRST_MESSAGE");	// �g���[�j���O�o�g����NPC�ɏ��񂾂��������b�Z�[�W��\��������t���O
	
	OpenMsgWnd_();	// ���b�Z�[�W�����^�C�~���O�̓��j���[�O�����b�Z�[�W�I�������
	
	ShowMsg_( "training_00" );			// �u�������I�@�����́@�g���[�j���O�o�g����
	KeyInputWait_();
	
	// ���񂾂��\�����郁�b�Z�[�W
	if(mes_flg == false){
		SetEventFlg_("BFG_FREE_BATTLE_FIRST_MESSAGE", true);
		ShowMsg_( "training_03" );		// �u�g���[�j���O�o�g���́@���񂽂̗a���菊�ɂ���
		KeyInputWait_();
		ShowMsg_( "training_04" );		// �u�g�񂾃p�[�e�B���m��
		KeyInputWait_();
		ShowMsg_( "training_05" );		// �u�ǂ�ȁ@�p�[�e�B�������̂��c�c
		KeyInputWait_();
		ShowMsg_( "training_06" );		// �u�ǂ������H�@����
		KeyInputWait_();
	}
	// 2��ڈȍ~�ɕ\�����郁�b�Z�[�W
	else{
		ShowMsg_( "training_01" );		// �u�ǂ������@���񂽁H
		KeyInputWait_();
	}
	if (GetQueryResult_() == MES_QUERY_YES)
	{
		CloseMsgWnd_();	// �������ŃE�B���h�E����
		GotoMenuSceneFadeOut();
		// �͂� ��I�񂾎�
		GotoMenuScene_(MENU_SCENE.FREE_BATTLE);
	} else {
		// ������ ��I�񂾎�
		ShowMsg_( "training_02" );		// �u�܂�������@<name_player/>�I
		KeyInputWait_();
		CloseMsgWnd_();	// �������ŃE�B���h�E����
	}
}
//------------- L00_00 �p�֐�-----------------
// Wi-Fi�t���[�o�g���p�I�����b�Z�[�W
//------------- L00_00 �p�֐�-----------------
function TalkWiFiFreeBattleMenuClose()
{
	// ���j���[����߂����ۂ̃��b�Z�[�W
	OpenMsgWnd_();
	ShowMsg_( "training_07" );	// �u���Ⴀ�ȁI�@���̋@���҂��Ă邼�I
	KeyInputWait_();
	CloseMsgWnd_();	// �������ŃE�B���h�E����
}

//------------- L00_00 �p�֐�------------------
// ��b���GotoMenuScene_()�ɍs�����O�̈Ó]����
//------------- L00_00 �p�֐�------------------
function GotoMenuSceneFadeOut()
{
	// �Ó]�܂ł̃t���[������ݒ�< ���߂���ۂ��o�R����ɑ��k >
	local fade_speed = 10; // 10F
	
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, fade_speed);
	SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, fade_speed);
	WaitFade_();
}


//+++++++++++++++++++++++++++++++++++++++
//	�w�肵�����W�ɕ����Ȃ���U���������
//---------------------------------------
// �������F�w�肵�����W(Vec3)
// �߂�l  �F�Ȃ�
//+++++++++++++++++++++++++++++++++++++++
function uPlayerTurnAroundPos(pos)
{
	local player    = GetPlayerId_();
	// �Ώە��̕����ɉ�](1F��11.4������])
	local rotateTask = Task_RotateToPosSetMotion_(player, Vec3(pos.x, pos.y, pos.z), ROTATE_EVENT_DEF MOT_WALK, MOT_WAIT);
	WaitTask(rotateTask);
	// �Ԃ���������
	Wait_(15);
}

