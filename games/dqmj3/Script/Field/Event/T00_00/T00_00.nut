//==============================================================
// T00_00 �p�C�x���g�X�N���v�g
//==============================================================

//==============================================================
// �؂�ւ���t�F�[�h�C�����ɓǂ݂��ނ���
//==============================================================
function FadeIn()
{
	// ��NPC�ǂݍ��݁E�ݒu=================================
	// NPC���\�[�X�ǂݍ���
	local n000Res = ReadNpc_("n000");	// ���ʂ̃m�`��
	local n001Res = ReadNpc_("n001");	// �W���b�N
	local n002Res = ReadNpc_("n002");	// �G�[�X
	local n003Res = ReadNpc_("n003");	// �L���O
	local n004Res = ReadNpc_("n004");	// �m�`���[����
	local n005Res = ReadNpc_("n005");	// �m�`���[���N�C�[��
	local n006Res = ReadNpc_("n006");	// �}�X�^�[���Ԃ�
	local n007Res = ReadNpc_("n007");	// ���i�[�e
	local n008Res = ReadNpc_("n008");	// �_�[�N�}�X�^�[
	local n009Res = ReadNpc_("n009");	// ���L��
	local n010Res = ReadNpc_("n010");	// ��l��
	local n011Res = ReadNpc_("n011");	// �T���`��
	local n012Res = ReadNpc_("n012");	// ���W�X�^���X�i�j���j
	local n013Res = ReadNpc_("n013");	// ���W�X�^���X�i�����j
	local n014Res = ReadNpc_("n014");	// ���W�X�^���X�i��������j
	local n019Res = ReadNpc_("n019");	// �o�[�f�B

	// NPC��FBX�Ŏw�肵���ʒu�Ɉړ�
	//npc0 <- ArrangePointNpc_(n000Res, "000");	// �h����b�e�X�g
	//npc1 <- ArrangePointNpc_(n001Res, "001");	// �p�j�{�퓬�e�X�g
	//npc2 <- ArrangePointNpc_(n002Res, "002");	// �f���e�X�g
	npc3 <- ArrangePointNpc_(n003Res, "003");	// �f�B�X�N�{��
	//npc4 <- ArrangePointNpc_(n000Res, "004");
	//npc5 <- ArrangePointNpc_(n001Res, "005");
	npc6 <- ArrangePointNpc_(n001Res, "006");	//���[�X��t
	//npc7 <- ArrangePointNpc_(n004Res, "007");
	//npc8 <- ArrangePointNpc_(n004Res, "008");
	
	// �f�U�C�i�[�v�] NPC�m�F�p�z�u
	test_n000 <- ArrangePointNpc_(n000Res, "pos_test_n000");
	test_n001 <- ArrangePointNpc_(n001Res, "pos_test_n001");
	test_n002 <- ArrangePointNpc_(n002Res, "pos_test_n002");
	test_n003 <- ArrangePointNpc_(n003Res, "pos_test_n003");
	test_n004 <- ArrangePointNpc_(n004Res, "pos_test_n004");
	test_n005 <- ArrangePointNpc_(n005Res, "pos_test_n005");
	test_n006 <- ArrangePointNpc_(n006Res, "pos_test_n006");
	test_n007 <- ArrangePointNpc_(n007Res, "pos_test_n007");
	test_n008 <- ArrangePointNpc_(n008Res, "pos_test_n008");
	test_n009 <- ArrangePointNpc_(n009Res, "pos_test_n009");
	test_n010 <- ArrangePointNpc_(n010Res, "pos_test_n010");
	test_n011 <- ArrangePointNpc_(n011Res, "pos_test_n011");
	test_n012 <- ArrangePointNpc_(n012Res, "pos_test_n012");
	test_n013 <- ArrangePointNpc_(n013Res, "pos_test_n013");
	test_n014 <- ArrangePointNpc_(n014Res, "pos_test_n014");
	test_n019 <- ArrangePointNpc_(n019Res, "pos_test_n019");
	
	SetPointPos_(test_n000, "pos_test_n000");
	SetPointPos_(test_n001, "pos_test_n001");
	SetPointPos_(test_n002, "pos_test_n002");
	SetPointPos_(test_n003, "pos_test_n003");
	SetPointPos_(test_n004, "pos_test_n004");
	SetPointPos_(test_n005, "pos_test_n005");
	SetPointPos_(test_n006, "pos_test_n006");
	SetPointPos_(test_n007, "pos_test_n007");
	SetPointPos_(test_n008, "pos_test_n008");
	SetPointPos_(test_n009, "pos_test_n009");
	SetPointPos_(test_n010, "pos_test_n010");
	SetPointPos_(test_n011, "pos_test_n011");
	SetPointPos_(test_n012, "pos_test_n012");
	SetPointPos_(test_n013, "pos_test_n013");
	SetPointPos_(test_n014, "pos_test_n014");
	SetPointPos_(test_n019, "pos_test_n019");

	local treeRes  = ReadGimmick_("o_H00_05");
	treeGimmick <- ArrangePointGimmick_("o_H00_05", treeRes, "gimmick_test");

	
	//�n��=================================================
	//// ����n���̐ݒu�i�ڐG�N���j
	//mineCircle_00 <- SetPointCircleEventMine_("circlemine_000", false);
	// ����n���̐ݒu�i�{�^�������N���j
	mineCircle_01 <- SetPointCircleEventMine_("circlemine_001", true);
	//// ���^�n���̐ݒu�i�ڐG�N���j
	//mineBox_00 <- SetPointBoxEventMine_("boxmine_000", false);
	//// ���^�n���̐ݒu�i�{�^�������N���j
	//mineBox_01 <- SetPointBoxEventMine_("boxmine_001", true);
	//=====================================================
	
	//�G�t�F�N�g===========================================
	LoadEffect_("EF000_06_ROCK");
	LoadEffect_("EF300_21_TALK_ICON");
	//=====================================================
	
	//�X�N���v�g���t���O�e�X�g
	testFlag <- false;
	
	// �b�������e�X�g�p
	gTalkNum <- 0;

	EventEnd_();
}

//==============================================================
// ��ʕ\����̓���
//==============================================================
function EventStartOperate()
{
	// ���Ăяo������́A�t�F�[�h�������ł������Ă���̂�
	// ���t�F�[�h������������ꍇ�͍ŏ��ɍs��

	// �C�x���g�t���O�̎擾
	GetEventFlg_("BFG_TOUCH_NPC_0");
	
	//==========================================================
	// �퓬�I����A�����Ƀ��b�Z�[�W�\��
	//==========================================================
	local type = GetBattleEndType_();
	local plDir;
	local playerPath = GetPlayerId_();
	
	//// ������Ȃ�
	//if(type == END_TYPE_WIN){
	//	SetDirToPos_(npc0, GetPos_(playerPath));
	//	SetDirToPos_(playerPath, GetPos_(npc0));
	//	
	//	SetMotion_(npc0, "TALKLOOP", 0);
	//	OpenMsgWnd_();
	//	ShowMsg_("battle_win");
	//	KeyInputWait_();
	//	CloseMsgWnd_();
	//	SetMotion_(npc0, "WAIT", 0);
	//}
	//// �s�k�Ȃ�
	//else if (type == END_TYPE_LOSE){
	//	SetDirToPos_(npc0, GetPos_(playerPath));
	//	SetDirToPos_(playerPath, GetPos_(npc0));
	//	
	//	SetMotion_(npc0, "TALKLOOP", 0);
	//	OpenMsgWnd_();
	//	ShowMsg_("battle_lose");
	//	KeyInputWait_();
	//	CloseMsgWnd_();
	//	SetMotion_(npc0, "WAIT", 0);
	//}
	//else if (type == END_TYPE_SCOUT){
	//	print("�X�J�E�g���Đ퓬�I��\n");
	//}
	
	//==========================================================
	// ���[�X���A��A�����Ƀ��b�Z�[�W�\��
	//==========================================================
	//���[�X��A���b�Z�[�W�\��
	if(GetEventFlg_("BFG_RETURN_FROM_RACE")){
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_NOCHORA");
		ShowMsg_("npc_011");
		KeyInputWait_();
		CloseMsgWnd_();
		SetEventFlg_("BFG_RETURN_FROM_RACE", false);
	}
	
	//==========================================================
	// �A���f���e�X�g�i�S�f��BGM���Ⴄ�Łj
	//==========================================================
	// NPC�N�� Demo990 �� Demo991 �� Demo992�A���f��===============
	if(GetEventFlg_("BFG_DUMMY_0")){	// Demo990 �� Demo991
		EventStartChangeDemo(991, FADE_COLOR_BLACK);
		SetEventFlg_("BFG_DUMMY_0", false);
		SetEventFlg_("BFG_DUMMY_1", true);
	}
	else if(GetEventFlg_("BFG_DUMMY_1")){	// Demo991 �� Demo992
		EventStartChangeDemo(992, FADE_COLOR_BLACK);
		SetEventFlg_("BFG_DUMMY_1", false);
	}
	// ===========================================================
	
	
	//==========================================================
	// �A���f���e�X�g�i�S�f��BGM�������Łj
	//==========================================================
	//// NPC�N�� Demo993 �� Demo994 �� Demo995�A���f��===============
	//if(GetEventFlg_("BFG_DUMMY_2")){	// Demo990 �� Demo991
	//	EventStartChangeDemo(994, FADE_COLOR_BLACK);
	//	SetEventFlg_("BFG_DUMMY_2", false);
	//	SetEventFlg_("BFG_DUMMY_3", true);
	//}
	//else if(GetEventFlg_("BFG_DUMMY_3")){	// Demo991 �� Demo992
	//	EventStartChangeDemo(995, FADE_COLOR_BLACK);
	//	SetEventFlg_("BFG_DUMMY_3", false);
	//}
	// ===========================================================
	
	EventEnd_();
}

//==============================================================
// NPC���ׂ����̃C�x���g
//==============================================================
function TouchNpc()
{
	// ���ׂ��Ă���NPC��ID���擾
	local target = GetTargetId_();
	
	//===================================================
	// npc6�Ƃ̉�b
	//===================================================
	if(target == npc6){
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_NOCHORA");
		ShowMsg_("npc_010");
		KeyInputWait_();
		CloseMsgWnd_();
		// ���[�X��
		if (GetQueryResult_() == MES_QUERY_YES){
			SetEventFlg_("BFG_RETURN_FROM_RACE", true);
			ChangeRace_();
		}
	}
	//===================================================
	// npc3�Ƃ̉�b
	//===================================================
	if(target == npc3){
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_NOCHORA");
		ShowMsg_("npc_003");
		KeyInputWait_();
		CloseMsgWnd_();
		if(GetQueryResult_() == MES_QUERY_YES){
			GotoMenuOpen_(MENU_OPEN.DISC_FACILITY);
		}
	}
	//===================================================
	// test_n005�i�N�C�[���j�Ƃ̉�b
	//===================================================
	if(target == test_n005){
		CommAddAccessory(226, 2);
	}
	
	//===================================================
	// test_n005�i�m�`���[�����j�Ƃ̉�b���A���f���J�n
	//===================================================
	if(target == test_n004){
		ChangeDemo_(990);
		SetEventFlg_("BFG_DUMMY_0", true);
	}
	
	//===================================================
	// test_n013�i���W�X�^���X�i�����j�j�Ƃ̉�b���A���f���J�n
	//===================================================
	if(target == test_n013){
		ChangeRaceTutorial_();
	}
	
	EventEnd_();
}

//==============================================================
// ���A�N�^�[�Œ��ׂ�ꂽ�Ƃ��̃C�x���g
//==============================================================
function ReactorAnalyze()
{
	local target = GetTargetId_();
	if(target == reactorPoint2){
		OpenMsgWnd_();
		ShowMsg_("battle_start");
		KeyInputWait_();
		CloseMsgWnd_();
	}
	
	EventEnd_();
}

//==============================================================
// ���A�N�^�[�N�����̃C�x���g
//==============================================================
function ReactorOn()
{
	//// ���A�N�^�[�N�����ɉ�b�A�C�R�����o���e�X�g
	//if(!testFlag)
	//{
	//	talkIcon0 <- SetSelectBoneEffect_("EF300_21_TALK_ICON", npc5, ATTACH_EFFECT1);
	//}
	EventEnd_();
}

//==============================================================
// ���A�N�^�[�I�����̃C�x���g
//==============================================================
function ReactorOff()
{
	// ���A�N�^�[�I�����ɂ͏����Ă���
	if(!testFlag)
	{
		DeleteEffect_(talkIcon0);
	}
	EventEnd_();
}


//==============================================================
// ��b��A�p
//==============================================================
function TalkMessage(messageTag)
{
	OpenMsgWnd_();
	ShowMsg_(messageTag);
	KeyInputWait_();
	CloseMsgWnd_();
}

//==============================================================
// �����X�^�[���C�h���N���C�x���g
//==============================================================
function RideOn()
{
	OpenMsgWnd_();
	ShowMsg_("battle_start");
	KeyInputWait_();
	CloseMsgWnd_();
	
	EventEnd_();
}


//==============================================================
// ��������Ȃ�NPC��b������ύX����C�x���g
//==============================================================
function BeforeTalkNpc()
{
	// �b���������Ă���NPC��ID���擾
	local target = GetTargetId_();
	
	if(target == test_n013){
		if(GetEventFlg_("BFG_DUMMY_3")){
			SetTalkCameraType_(target, TALK_CAMERA_UP);
		}else{
			SetTalkCameraType_(target, TALK_CAMERA_DEF);
		}
		SetEventFlg_("BFG_DUMMY_3", !GetEventFlg_("BFG_DUMMY_3"));
	}
	
	EventEnd_();
}
