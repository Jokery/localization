//=============================================
//
//		demo416[�������u���j���]
//
//=============================================

//-------------------------------------------------------------------------
//
//		�ǂݍ��݁E�z�u
//
//-------------------------------------------------------------------------
function Update()
{
	
// ���ϐ���`
	local task_cam, task_player, task_rukiya;
	local efc_player, efc_rukiya;

// �����\�[�X�Ǎ�
	// �L�����N�^�[
	local player = GetPlayerId_();					// ��l��
	local n_rukiya = ReadNpc_("n009");				// ���L��

// ���z�u
	SetPointPos_(player, "player000");							// ��l��
	local rukiya = ArrangePointNpc_(n_rukiya, "npc_rukiya000");	// ���L��

// ����풓���[�V�����Ǎ�
	local player_touch_reactor = ReadMotion_(player, "Player_touch_reactor");
	local player_touch_reactor_L = ReadMotion_(player, "Player_touch_reactor_L");

// ���G�t�F�N�g�ǂݍ���
	LoadEffect_("ef732_09_light_reactor_c");		// ���A�N�^�[����

// ���J�����ݒ�
	SetPointCameraEye_("2_eye");
	SetPointCameraTarget_("2_tgt");
//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);
	SetMotion_(rukiya, MOT_TALK, BLEND_XL);
	WaitMotion(rukiya);
	//===============================================
	// �����L��
	// �u���l���@�������Ă��ꂽ�݂������ˁB
	// �@�����낤����@�悭����Ă��ꂽ�B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RUKIYA");
	ShowMsg_("DEMO_416_MSG_005");
	SetMotion_(rukiya, MOT_TALKLOOP, BLEND_XL);
	KeyInputWait_();
	//-----------------------------------------------
	
	//-----------------------------------------------
	// �����L��
	// �u���āc�c�u���C�N���������u���@�Ԃ��󂷑O��
	//-----------------------------------------------
	ShowMsg_("DEMO_416_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	SetMotion_(rukiya, MOT_WAIT, BLEND_L);
	Wait_(10);	
		
	SetPointCameraEye_("3_eye");
	SetPointCameraTarget_("3_tgt");
		
	Wait_(10);
	PlaySE_("SE_FLD_135");		// ���A�N�^�[������
	efc_rukiya = SetSelectBoneEffect_("ef732_09_light_reactor_c", rukiya, ATTACH_EFFECT1);	// ���A�N�^�[����
	SetEffectScale_(efc_rukiya, 0.7);
	Wait_(30);
	PlaySE_("SE_FLD_135");		// ���A�N�^�[������
	efc_player = SetSelectBoneEffect_("ef732_09_light_reactor_c", player, ATTACH_EFFECT1);	// ���A�N�^�[����
	SetEffectScale_(efc_player, 0.7);
	Wait_(30);
	SetPointCameraEye_("4_eye");
	SetPointCameraTarget_("4_tgt");
	SetMotion_(player, player_touch_reactor, BLEND_L);
	SetFace_(player, "Face_left");	
	WaitMotion(player);
	SetMotion_(player, player_touch_reactor_L, BLEND_N);

	//===============================================
	// �����A�N�^�[
	// �u�c�c���m�̃V�X�e���f�[�^���@��M���܂����B
	// �@�퓬���C�h�̋@�\���@���p�\�ł��B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_REACTOR");
	ShowMsg_("DEMO_416_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetMotion_(rukiya, MOT_TALK, BLEND_XL);
	WaitMotion(rukiya);
	SetMotion_(rukiya, MOT_TALKLOOP, BLEND_XL)
	task_cam = Task_AnimeMoveCamera_("5_eye", "5_tgt");

	//===============================================
	// �����L��
	// �u�퓬���C�h���Ă����̂͂ˁ@�퓬���ɂ�
	// �@���Ԃɂ��������Ɂ@����悤�ɂȂ�@�@�\���B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RUKIYA");
	ShowMsg_("DEMO_416_MSG_030");
	KeyInputWait_();
	//===============================================
	
	//===============================================
	// �����L��
	// �u�퓬���@���񂽂������ɏ���
	// �@���̖����́@�������p���[�A�b�v����B
	//-----------------------------------------------
	ShowMsg_("DEMO_416_MSG_040");
	KeyInputWait_();
	//===============================================

	//===============================================
	// �����L��
	// �u�Ƃ������@�g���Ă݂�̂��������B
	// �@�܂��́@�`���[�g���A�����@����Ă݂ȁI
	//-----------------------------------------------
	ShowMsg_("DEMO_416_MSG_050");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetMotion_(rukiya, MOT_WAIT, BLEND_XL);
	EndDemo(FADE_COLOR_BLACK);
}
