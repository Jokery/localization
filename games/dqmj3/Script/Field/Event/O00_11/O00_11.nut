//===================== ���_�y�C�̐_(O00_11)�z ====================

// �o�g���I�����̕��A���W
const RTN_BATTLE_POS_X =        0;
const RTN_BATTLE_POS_Y =        0;
const RTN_BATTLE_POS_Z = -247.035;
const RTN_BATTLE_DIR   =        0;

//------------------------------------------------
//		�퓬�I����
//------------------------------------------------
function AfterBattle()
{
	// �i�s�t���O�̏�Ԃ��擾
	local status_num = GetNumFlg_("NUM_WADATUMI_PHASE");

	// �퓬�̔���
	if(status_num == 3 || status_num == 6){
		local player = GetPlayerId_();
		// �[���f���ŏ�������l����������悤�ɂ���
		SetManualCalcAlpha_(player, true);
		SetAlpha_(player, 1.0);
		// �[���f���ŃJ�����𒲐������̂Ńf�t�H���g�ɖ߂��Ă���
		SetPlayableCamera_();
		
		// ����
		if(GetBattleEndType_() == END_TYPE_WIN){
			// �����Ȃ�
		}
		// �ɂ���
		else if(GetBattleEndType_() == END_TYPE_FLEE){
			// �����Ȃ�
		}
		// ����
		else{
			// �i�s�t���O���Đ펞��
			SetNumFlg_("NUM_WADATUMI_PHASE", 4);
			// ���[���ƃt���C�g�V�O�i���̋֎~�̉���
			SetEventFlg_("BFG_PLAYERABILITY_RULER_PROHIBIT", false);
			SetEventFlg_("BFG_FLIGHT_PROHIBIT", false);
		}
	}

	EventEnd_();
}

//------------------------------------------------
//		�}�b�v�ɓ���O
//------------------------------------------------
function BeforeInitMap()
{
	// �i�s�t���O�̏�Ԃ��擾
	local status_num = GetNumFlg_("NUM_WADATUMI_PHASE");
	
	if(status_num == 2 || status_num == 5){ // NUM014 == 2 or 5
		//���C�h��������
		SetRideOffStart_();
	}

	EventEnd_();
}

//------------------------------------------------
//		�t�F�[�h�A�E�g��
//------------------------------------------------
function FadeIn()
{
	// �i�s�t���O�̏�Ԃ��擾
	local status_num = GetNumFlg_("NUM_WADATUMI_PHASE");
	DebugPrint(" ");
	DebugPrint("NUM_WADATUMI_PHASE �̒l�� " + status_num + " �ɂȂ�܂����B");

	//---------------
	// ���M�~�b�N�z�u
	//---------------
	// ID������
	
	// ���\�[�X�ǂݍ���
	
	// ���z�u�Ȃ�
	
	
	//----------
	// ��NPC�z�u
	//----------
	// ID������
	g_npc_wadatumi <- C_NONE_ID;
	
	// �����_�c�~(4�s�ڂŏ�����)
	if(status_num == 1 || status_num == 4){ // NUM014 == 1 or 4
		g_npc_wadatumi = ReadAndArrangePointNpc("m183_00", "npc_god");
		SetTalkCameraType_(g_npc_wadatumi, TALK_CAMERA_UP);
		SetReactorMsg_(g_npc_wadatumi, "NPC_WADATUMI_REC");
		SetScaleSilhouette(g_npc_wadatumi, SCALE.T, SILHOUETTE_WIDTH.T);
		SetVisible(g_npc_wadatumi, true);
	}
	// ���[���f���p�̐ݒu
	else if(status_num == 2 || status_num == 5){
		g_npc_wadatumi = ReadAndArrangePointNpc("m183_00", "npc_god");
		SetTalkCameraType_(g_npc_wadatumi, TALK_CAMERA_UP);
		SetReactorMsg_(g_npc_wadatumi, "NPC_YATIHOKO_REC");
		SetScaleSilhouette(g_npc_wadatumi, SCALE.T, SILHOUETTE_WIDTH.T);
		SetVisible(g_npc_wadatumi, true);
	}
	
	
	//-----------------
	// ���G�t�F�N�g�z�u
	//-----------------
	// ������̗􂯖�
	LoadEffect_("ef300_25_wormhole");
	local wormhole_01 = SetPointWorldEffect_("ef300_25_wormhole", "ef_wormhole_01");
	
	
	//-----------
	// ���n���z�u
	//-----------
	// ������
	g_mine_01			 <- C_NONE_ID;
	g_mine_02			 <- C_NONE_ID;
	g_mine_wormhole_01	 <- C_NONE_ID;
	
	// �����_�c�~�p�n��(5�s�ڂŏ�����)
	if(status_num == 1 || status_num == 4){ // NUM014 == 1 or 4
		g_mine_01 =  SetPointBoxEventMine_("mine_01_box", false);
		g_mine_02 =  SetPointBoxEventMine_("mine_01_box_2", false);
	}
	// ������̗􂯖�
	g_mine_wormhole_01 = SetPointCircleEventMine_("mine_wormhole_01", true);
	
	
	//-------------------------
	// �����A�N�^�[�|�C���g�z�u
	//-------------------------
	// ���z�u�Ȃ�
	
	
	//-----------------
	// ���}�b�v�i�r�z�u
	//-----------------
	// ������̗􂯖�
	local navi_wormhole = ArrangePointNaviMapIcon_(NAVIMAP_ICON.CREVICE, "mine_wormhole_01");
	
	
	EventEnd_();
}

//------------------------------------------------
//		�t�B�[���h����J�n
//------------------------------------------------
function EventStartOperate()
{
	// �i�s�t���O�̏�Ԃ��擾
	local status_num = GetNumFlg_("NUM_WADATUMI_PHASE");
	
	//-----------
	// �f���̍Đ�
	//-----------
	// �[���f���Đ�
	if(status_num == 2 || status_num == 5){
		uPlayableDemoWadatumi();
	}
	// �Đ펞
	else if(status_num == 4){
		// �����Ȃ�
	}
	// ���s����
	else if(status_num == 3 || status_num == 6){
		// ����
		if(GetBattleEndType_() == END_TYPE_WIN){
			// �t���O
			SetNumFlg_("NUM_WADATUMI_PHASE", 7);
			SetEventFlg_("BFG_GET_SEA_STAR_PIECE", true);  // �C�̃X�^�[�s�[�X�擾�t���O
			SetEventFlg_("BFG_KNOCK_DOWN_WADATUMI", true); // ���_�c�~���j�擾�t���O
			// ���A�ʒu
			SetReturnDemoPosDir_(Vec3(RTN_BATTLE_POS_X, RTN_BATTLE_POS_Y, RTN_BATTLE_POS_Z), RTN_BATTLE_DIR);
			// �A�C�e���擾(Redmine#2349)
			AddItem_(SEA_STAR_PIECE_ID, 1);
			// Demo816[�C�̃X�^�[�s�[�X����]�Đ�
			EventStartChangeDemo(816, FADE_COLOR_BLACK);
		}
		else{
			// �s�k�̓A�t�^�[�o�g���ŏ���
		}
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
	// �G�ꂽ�n���̎擾
	local target = GetTouchEventMineId_();
	
	// ��l���̏��
	local player = GetPlayerId_();
	
	switch(target)
	{
	case g_mine_01:
	case g_mine_02:
		uMine01();
		break;
	case g_mine_wormhole_01:
		uChangeMap();
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

//======================================================
//  ���[�J���֐� : ���_�c�~�p�n���̏���
//------------------------------------------------------
// �������F�Ȃ�
// �߂�l  �F�Ȃ�
//======================================================
function uMine01()
{
	// �i�s�t���O�̏�Ԃ��擾
	local status_num = GetNumFlg_("NUM_WADATUMI_PHASE");
	
	// �n�����폜
	DeleteEventMine_(g_mine_01);
	DeleteEventMine_(g_mine_02);
	
	if(status_num == 1){
		// �V�i���I�i�s�t���O��i�߂�
		SetNumFlg_("NUM_WADATUMI_PHASE", 2);
	}
	else if(status_num == 4){
		// �V�i���I�i�s�t���O��i�߂�
		SetNumFlg_("NUM_WADATUMI_PHASE", 5);
	}
	// ���C�h�����ׁ̈A�}�b�v�`�F���W
	ChangeMapPosDir_("O00_11", Vec3(26.740, -14.900, -60.276), 180);
}

//======================================================
//  ���[�J���֐� : �[���f��[�C�̐_���_�c�~]
//------------------------------------------------------
// �������F�Ȃ�
// �߂�l  �F�Ȃ�
//======================================================
function uPlayableDemoWadatumi()
{
	// �i�s�t���O�̏�Ԃ��擾
	local status_num = GetNumFlg_("NUM_WADATUMI_PHASE");
	
	// ����
	local cam_pos = Vec3(7.537, -14.900, -21.867);
	local cam_dir = 175;
	local wait_motion = 45;
	// �Ó]
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
	SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
	WaitFade_();
	// ��l���������X�^�[�̐^���ʂɔz�u
	local player = GetPlayerId_();
	SetPos_(player, cam_pos);
	SetDir_(player, cam_dir);
	// ��l��������
	SetManualCalcAlpha_(player, true);
	SetAlpha_(player, 0.0);
	SetCameraDir_(cam_dir);
	// �J�����̐ݒ�
	SetPointCameraEye_("cam_eye");
	SetPointCameraTarget_("cam_target");
	// �������I������̂ňÓ]����
	SetFade_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
	WaitFade_();
/*
	// �S�Ŏ��͂��̏ꕜ�A(�f�o�b�O�p)
	SetEventFlg_("BFG_DEAD_KEEP_MAP", true);
*/
	// ���b�Z�[�W�\��
	// ����or�Đ�ŕ���
	if(status_num == 2){
		OpenMsgWnd_();
		ShowMsg_("WADATUMI_MSG_001");
		KeyInputWait_();
		SetTalkName_("NAME_TAG_WADATSUMI");
		ShowMsg_("WADATUMI_MSG_002");
		KeyInputWait_();
		CloseMsgWnd_();
		// �V�i���I�i�s�t���O��i�߂�
		SetNumFlg_("NUM_WADATUMI_PHASE", 3);
	}
	else if(status_num == 5){
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_WADATSUMI");
		ShowMsg_("WADATUMI_MSG_003");
		KeyInputWait_();
		CloseMsgWnd_();
		// �V�i���I�i�s�t���O��i�߂�
		SetNumFlg_("NUM_WADATUMI_PHASE", 6);
	}
	
	// �퓬���[�V����
	SetMotion_(g_npc_wadatumi, MOT_ATTACK, BLEND_N);
	PlaySE_("SE_FLD_069");
	Wait_(25);
	// �퓬�J�n(�u���[�̎w��͓��������)
	ChangeBattleParty_(123);
}

//======================================================
//  ���[�J���֐� : ���̐��E�ɖ߂鏈��
//------------------------------------------------------
// �������F�Ȃ�
// �߂�l  �F�Ȃ�
//======================================================
function uChangeMap()
{
	// �n�����폜
	DeleteEventMine_(g_mine_wormhole_01);
	// ���b�Z�[�W
	OpenMsgWnd_();
	ShowMsg_("SYSTEM_MSG_001");
	KeyInputWait_();
	if(GetQueryResult_() == QUERY_YES){
		CloseMsgWnd_();
		// ���[���ƃt���C�g�V�O�i���̋֎~�̉���
		SetEventFlg_("BFG_PLAYERABILITY_RULER_PROHIBIT", false);
		SetEventFlg_("BFG_FLIGHT_PROHIBIT", false);
		// ����̗􂯖ڂ̋��ʏ���
		CommDisplayedWormholeEffect();
		// �w�肵���}�b�v�Ɉړ�
		ChangeMapPosDir_("U00_00", Vec3(2840.651, 185.419, -2473.350), -105);
	}
	else{
		CloseMsgWnd_();
		// �n�����Đݒu
		SetPointCircleEventMine_("mine_wormhole_01", true);
	}
}

