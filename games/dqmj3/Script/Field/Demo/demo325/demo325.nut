//=============================================
//
//		demo325[���L���̃��b�Z�[�W]
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
	local task_cam, task_cam2;
	local efc_reactor0, efc_smoke0, efc_smoke1;
	local Player1, Player;
	local model_reactor, reactor;
	
// �����\�[�X�Ǎ�
	// �L�����N�^�[
	local player = GetPlayerId_();					// ��l��

// ���z�u
	// ��l��
	SetPointPos_(player, "player000");

// ����풓���[�V�����Ǎ�
	Player1 = ReadMotion_(player, "Player_touch_reactor_L");	// ���A�N�^�[��G�郂�[�V����

// ���J�����ݒ�
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");
	
//	���M�~�b�N�ǂݍ���
	model_reactor = ReadGimmick_("o_dem_15");					// ���L���̃��A�N�^�[
	reactor = ArrangePointGimmick_("o_dem_15", model_reactor, "obj_reactor000");

	local obj_PC = ReadGimmick_("o_I02_18");					// �m�[�gPC
	local PC = ArrangePointGimmick_("o_I02_18", obj_PC, "obj_PC000");
	SetMotion_(PC, MOT_GIMMICK_1, BLEND_N);	

	local model_daiza = ReadGimmick_("o_I02_19");					// ���A�N�^�[���
	local daiza = ArrangePointGimmick_("o_I02_19", model_daiza, "obj_daiza000");		// ���A�N�^�[���

//	���G�t�F�N�g
	LoadEffect_("ef732_09_light_reactor_c");					// ���A�N�^�[�̔����G�t�F�N�g
	LoadEffect_("ef721_04_nat_smoke_psps");						// �d���Ɖ�

	SetMotion_(daiza, MOT_GIMMICK_0, BLEND_N);
//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------

	efc_smoke0 = SetPointWorldEffect_("ef721_04_nat_smoke_psps", "efc_smoke000");	// �Ղ��Ղ��G�t�F�N�g
	SetEffectScale_(efc_smoke0, 2.0);		
	efc_smoke1 = SetPointWorldEffect_("ef721_04_nat_smoke_psps", "efc_smoke001");	// �Ղ��Ղ��G�t�F�N�g
	SetEffectScale_(efc_smoke1, 2.0);
	
	
	StartDemo(FADE_COLOR_BLACK);
	
	PlaySE_("SE_FLD_135");																	// ���A�N�^�[������
	efc_reactor0 = SetSelectBoneEffectSetOffset_("ef732_09_light_reactor_c", reactor, ATTACH_GLOBAL, Vec3(0.0, -1.0, 0.0));		// ���A�N�^�[�̔����G�t�F�N�g
	SetEffectScale_(efc_reactor0, 0.5);	
	
	Wait_(40);
	
	PlaySE_("SE_FLD_135");																	// ���A�N�^�[������
	efc_reactor0 = SetPointWorldEffect_("ef732_09_light_reactor_c", "efc_reactor000");		// ���A�N�^�[�̔����G�t�F�N�g
	SetEffectScale_(efc_reactor0, 0.3);

	Wait_(30);
	SetMotion_(player, Player1, BLEND_XL);													// ���A�N�^�[��G�郂�[�V����
	Wait_(50);

	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");	
	Wait_(5);
	//===============================================
	//*���L���̃��A�N�^�[
	//�u�������邩���@<name_player/>�H
	//�@���̃��b�Z�[�W�́@���񂽂̂��߂Ɂ@���������B
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_325_MSG_010");
	KeyInputWait_();
	//===============================================

	//===============================================
	//*���L���̃��A�N�^�[
	//�u������@�����Ă�����Ă��Ƃ́@�����ɂ���
	//�@���C���V�X�e�����@�̏Ⴕ�Ă���͂��B
	//-----------------------------------------------
	ShowMsg_("DEMO_325_MSG_020");
	KeyInputWait_();
	//===============================================

	//===============================================
	//*���L���̃��A�N�^�[
	//�u���Ԃ��Ȃ���Ł@��Z�Ɍ����B
	//�@�����́@�T�u�V�X�e�����@�����グ�ȁB
	//-----------------------------------------------
	ShowMsg_("DEMO_325_MSG_030");
	KeyInputWait_();
	//===============================================

	//===============================================
	//*���L���̃��A�N�^�[
	//�u�ړ����u���@�g����悤�ɂȂ�͂��B
	//�@����������@���S�̊č����Ɂ@����񂾁B
	//-----------------------------------------------
	ShowMsg_("DEMO_325_MSG_040");
	KeyInputWait_();
	//===============================================

	//===============================================
	//*���L���̃��A�N�^�[
	//�u�҂��Ă����@<name_player/>�B
	//-----------------------------------------------
	ShowMsg_("DEMO_325_MSG_050");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	WaitTask(task_cam);

	// �T�u�V�X�e�����f��
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");	// 100F

	WaitTask(task_cam);
	Wait_(40);
	EndDemo(FADE_COLOR_BLACK);
}
