//=============================================
//
//		demo210[���A�N�^�[�̈⌾]
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
	local task_cam;
	local efc_player, efc_reactor;

// �����\�[�X�Ǎ�
	// �M�~�b�N
	local model_reactor = ReadGimmick_("o_dem_07");		// ���A�N�^�[
	// �L�����N�^�[
	local player = GetPlayerId_();						// ��l��
	// �G�t�F�N�g
	LoadEffect_("ef732_09_light_reactor_c");
	LoadEffect_("ef732_13_light_reactor01");

// ���z�u
	// ���A�N�^�[
	local reactor = ArrangePointGimmick_("o_dem_07", model_reactor, "obj_reactor000");
	SetPointPosNoFit_(reactor, "obj_reactor000");
	SetMotion_(reactor, MOT_GIMMICK_1, BLEND_N);
	
	// ��l��
	SetPointPos_(player, "player000");

// ����풓���[�V�����Ǎ�
	local player_hold = ReadMotion_(player, "Player_hold");				// �ҋ@����������
	local player_hold_L = ReadMotion_(player, "Player_hold_L");			// ��������L
	local player_dazzle = ReadMotion_(player, "Player_dazzle");			// ���������܂Ԃ���
	local player_dazzle_L = ReadMotion_(player, "Player_dazzle_L");		// �܂Ԃ���L

// �����Ԑݒ�
	SetTime_(START_TIME_ZONE_NIGHT);
	Wait_(30);

// ���J�����ݒ�
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");

//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------

	//��������������������������������������
	//���J�b�g1
	//��������������������������������������
	
	StartDemo(FADE_COLOR_BLACK);
	Wait_(40);
	
	SetMotion_(player, player_hold, BLEND_XL);
	Wait_(20);
	AttachObject_(player, reactor, ATTACH_EFFECT3);
	Wait_(15);
	DeleteTask_(task_cam);
	
	//��������������������������������������
	//���J�b�g2
	//��������������������������������������
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");
	
	WaitMotion(player);
	SetMotion_(player, player_hold_L, BLEND_M);
	Wait_(40);
	
	PlaySE_("SE_FLD_135");		// ���A�N�^�[������
	efc_player = SetSelectBoneEffect_("ef732_09_light_reactor_c", player, ATTACH_EFFECT1);	// ���A�N�^�[����
	SetEffectScale_(efc_player, 0.5);
	Wait_(70);
	
	//��������������������������������������
	//���J�b�g3
	//��������������������������������������
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");
	
	SetMotion_(reactor, MOT_GIMMICK_2, BLEND_N);
	
	//===============================================
	// �����A�N�^�[
	// �u�c�c�����ɐ��ނ̂��@���E�̂悤���B
	// �@�u���h���h�́@���̔閧��n�ɋC�t���Ă���B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_REACTOR");
	ShowMsg_("DEMO_210_MSG_010");
	KeyInputWait_();
	
	//-----------------------------------------------
	// �����A�N�^�[
	// �u��ɒE�o�������ޏ�����@���܂ꂽ���b�Z�[�W��
	// �@�����̑��u�̒��Ɂ@���łɁ@�Z�b�g���Ă���B
	//-----------------------------------------------
	ShowMsg_("DEMO_210_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	DeleteTask_(task_cam);
	
	//��������������������������������������
	//���J�b�g4
	//��������������������������������������
	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");
	
	SetMotion_(reactor, MOT_GIMMICK_1, BLEND_N);
	
	//===============================================
	// �����A�N�^�[
	// �u����̃p�X���[�h���@�ꏏ�ɉB�����B
	// �@�ړ����u�𕕂�����́@����ŊJ���͂��B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_REACTOR");
	ShowMsg_("DEMO_210_MSG_030");
	KeyInputWait_();
	
	//-----------------------------------------------
	// �����A�N�^�[
	// �u����������΁@���A�N�^�[��ʂ���
	// �@��ɓ���悤�ɂ��Ă������B
	//-----------------------------------------------
	ShowMsg_("DEMO_210_MSG_040");
	KeyInputWait_();
	
	//-----------------------------------------------
	// �����A�N�^�[
	// �u���ځ@��n���Ȃ��̂́@�c�O�����d���Ȃ��B
	// �@�Ȃ�Ƃ��@���܂��󂯎���Ăق����B
	//-----------------------------------------------
	ShowMsg_("DEMO_210_MSG_050");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	DeleteTask_(task_cam);
	
	//��������������������������������������
	//���J�b�g5
	//��������������������������������������
	task_cam = Task_AnimeMoveCamera_("anmeye003", "anmtgt003");
	
	//===============================================
	// �����A�N�^�[
	// �u�����c�����@�������̖�ڂ́@�Ŋ��̊�]�ł���
	// �@�����̂��߂Ɂ@�����Ђ炭���Ɓc�c
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_REACTOR");
	ShowMsg_("DEMO_210_MSG_060");
	KeyInputWait_();
	
	//-----------------------------------------------
	// �����A�N�^�[
	// �u���O�����̂��߂Ɂ@�����̕X���ւƍs�����񂾁B
	// �@�������낤�c�c���L���c�c�H
	//-----------------------------------------------
	ShowMsg_("DEMO_210_MSG_070");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	efc_reactor = SetSelectBoneEffectSetOffset_("ef732_13_light_reactor01", player, ATTACH_EFFECT3, Vec3(-0.5, 1.0, 0.0));
	SetEffectScale_(efc_reactor, 0.15);
	PlaySE_("SE_DEM_046");
	
	Wait_(10);
	
	SetMotion_(player, player_dazzle, BLEND_M);
	SetFace_(player, "Face_loop_close");
	WaitMotion(player);
	SetMotion_(player, player_dazzle_L, BLEND_XL);
	
	Wait_(35);
	
	//��������������������������������������
	//���J�b�g6
	//��������������������������������������
	//���t�F�[�h�A�E�g
	SetFadePlane_(FADE_PLANE.PLANE_3D);
	SetFade_(FADE_OUT, FADE_COLOR_WHITE, 70);
	WaitFade_();
	
	Wait_(10);
	
	//===============================================
	// �����A�N�^�[
	// �u�Z�L�����e�B�R�[�h���@��M���܂��B
	// �@�����̃V�X�e���Ɂ@�A�N�Z�X���\�ł��B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_REACTOR");
	ShowMsg_("DEMO_210_MSG_080");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	DeleteEffect_(efc_reactor);
	Wait_(10);
	
	//��������������������������������������
	//���J�b�g7
	//��������������������������������������
	// ���t�F�[�h�C��
	SetFade_(FADE_IN, FADE_COLOR_WHITE, 70);
	WaitFade_();
	
	// ��l���p�����Ă܂Ԃ�����
	Wait_(10);
	
	SetMotion_(player, player_hold_L, 20);
	Wait_(10);
	SetFace_(player, "Face_default");
	Wait_(10);	
	
	DeleteTask_(task_cam);
	
	//��������������������������������������
	//���J�b�g8
	//��������������������������������������
	task_cam = Task_AnimeMoveCamera_("anmeye004", "anmtgt004");
	DeleteTask_(task_cam);
	Wait_(20);
	
	SetMotion_(reactor, MOT_GIMMICK_7, BLEND_N);
	Wait_(60);
	
	task_cam = Task_AnimeMoveCamera_("anmeye004", "anmtgt004");
	Wait_(90);
	
	EndDemo(FADE_COLOR_BLACK);
}
