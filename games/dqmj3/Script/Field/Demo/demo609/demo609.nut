//=============================================
//
//		demo609[�J�V�����b�g�A�A�p�f�}�N�Đ�]
//
//=============================================
function Task_Rot3(chr, rot, frm)
{

//�����v���@���Z
//���v���@���Z

	local dir = GetDir_(chr);
	
	local sita = dir+rot;
	
	local sita2 = sita-dir;

	if( sita2 <= 0 ){
		sita2 = sita2*-1;
	}
	
	local frm2 = sita2/frm;
	
//	SetMotion_(chr, MOT_WALK, BLEND_M);
	local task = Task_RotateToDir_(chr, sita, frm2);
	
	return task;
}
//-------------------------------------------------------------------------
//
//		�ǂݍ��݁E�z�u
//
//-------------------------------------------------------------------------
function Update()
{
	
// ���ϐ���`
	local task_cam, task_player;
	local efc_player;

// �����\�[�X�Ǎ�
	// �L�����N�^�[
	local player = GetPlayerId_();					// ��l��
	local id_dark	 = ReadNpc_("n008");
	local id_kasya	 = ReadNpc_("m200_00");
	local id_apa	 = ReadNpc_("m201_00");
	
	// �M�~�b�N
	local model_core000 = ReadGimmick_("o_C03_02");	// �}�U�[
	local model_core100 = ReadGimmick_("o_C03_03");	// �}�U�[����

// ���z�u
	// ��l��
	SetPointPos_(player, "player");
	local dark	 = ArrangePointNpc_(id_dark, "dark");
	local apa	 = ArrangePointNpc_(id_apa, "apa");
	local kasya	 = ArrangePointNpc_(id_kasya, "kasya");
	SetScaleSilhouette(kasya, 0.8, 0.8);
	local task_kaiwa = Task_RotateToPos_(dark, GetPos_(player), 180);
	local task_kaiwa = Task_RotateToPos_(apa, GetPos_(player), 180);
	local task_kaiwa = Task_RotateToPos_(kasya, GetPos_(player), 180);
	Wait_(2);
	local task = Task_Rot3(apa, -15, 1);
	local task = Task_Rot3(kasya, 15, 1);
	
	// �}�U�[
	local core000 = ArrangePointGimmick_("o_C03_02", model_core000, "obj_core000");
	local core100 = ArrangePointGimmick_("o_C03_03", model_core100, "obj_core000");
	
// ����풓���[�V�����Ǎ�
	local d_summon	 = ReadMotion_(dark, "n008_summon");
	local d_summonL	 = ReadMotion_(dark, "n008_summon_L");
	local a_battle	 = ReadMotion_(apa, "m201_00_battle");

// ���J�����ݒ�
	SetPointCameraEye_("cameye");
	SetPointCameraTarget_("camtgt");

//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);
	
	
	//===============================================
	// ���_�[�N�}�X�^�[
	// �u�c�c�����̂тā@�Ȃ��}�U�[�Ɂ@�n���������B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_DARKMASTER");
	ShowMsg_("DEMO_609_MSG_010");
	KeyInputWait_();
	//===============================================
	
	//===============================================
	// ���_�[�N�}�X�^�[
	// �u�悩�낤�B�Ȃ�΁@���x�ł��@��������Ă��B
	//-----------------------------------------------
	ShowMsg_("DEMO_609_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	SetMotion_(dark, d_summon, 4);
	SetMotion_(apa, a_battle, 4);
	Wait_(50);
	SetMotion_(kasya, MOT_SPELL_ACTUATE, 4);
	Wait_(20);
	PlaySE_("SE_DEM_145");
	
	Wait_(14);
	SetMotionSpeed_(kasya, 0.3);
	WaitMotion(dark);
	SetMotion_(dark, d_summonL, 4);
	Wait_(10);
	
	EncountEndDemo(ENCOUNT_BOSS);
}