//=============================================
//
//		demo523[�v�����e�E�X�Đ�]
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
	local task_cam, task_player;
	local efc_player, efc_plometeusu;

// �����\�[�X�Ǎ�
	// �L�����N�^�[
	local player = GetPlayerId_();								// ��l��
	local npc_burdy = ReadNpc_("n019");							// �o�[�f�B
	local npc_darkmaster = ReadNpc_("n008");					// �_�[�N�}�X�^�[
	local npc_plometeusu = ReadNpc_("m190_00");					// �v�����e�E�X
	local npc_rena = ReadNpc_("n007");							// ���i�[�e
	local model_boy = ReadNpc_("n040"); 						// ���ǂ���l��
	
	// �M�~�b�N
	local obj_couldsleep = ReadGimmick_("o_V02_12");			// �R�[���h�X���[�v(��l���p)
	local model_cold = ReadGimmick_("o_V02_10");				// �R�[���h�X���[�v���u
	local model_door = ReadGimmick_("o_V02_09");			// ��
	// �G�t�F�N�g
	LoadEffect_("ef730_01_oth_dark_aura01");

	
// ���z�u
	// ��l��
	SetPointPos_(player, "player000");
	// ���i�[�e
	local rena = ArrangePointNpc_(npc_rena, "npc_rena000");
	
	local boy = ArrangePointNpc_(model_boy, "npc_boy000");		// ���ǂ���l���i�R�[���h�X���[�v�̒��ɔz�u�j

	local burdy = ArrangePointNpc_(npc_burdy, "npc_burdy000");
	local darkmaster000 = ArrangePointNpc_(npc_darkmaster, "npc_darkmaster000");
	SetStepSe_(darkmaster000,"SE_FLD_016");
	local darkmaster001 = ArrangePointNpc_(npc_darkmaster, "npc_darkmaster001");
	SetStepSe_(darkmaster001,"SE_FLD_016");
	local plometeusu = ArrangePointNpc_(npc_plometeusu, "npc_plometeusu000");
	efc_plometeusu = SetSelectBoneEffectSetOffset_("ef730_01_oth_dark_aura01", plometeusu, ATTACH_EFFECT2, Vec3(0.0, 0.0, 0.0));
	
	//�M�~�b�N
	local couldsleep = ArrangePointGimmick_("o_V02_11", obj_couldsleep, "obj_couldsleep000");
	// ��
	local door = ArrangePointGimmick_("o_V02_09", model_door, "obj_door000");

// ����풓���[�V�����Ǎ�
	local player_run_battle = ReadMotion_(player, "Player_run_battle");			// ��l�� �ʏ�̐퓬�ҋ@�Ɉڍs
	local player_battle_L = ReadMotion_(player, "Player_battle_L");				// ��l�� �퓬�ҋ@
	local darkmaster_laugh_L = ReadMotion_(darkmaster000, "n008_laugh_L");		// �_�[�N�}�X�^�[ �΂�
	local burdy_idolL = ReadMotion_(burdy, "n019_idol");						// �o�[�f�B �ҋ@
	local burdy_wing_Appeal = ReadMotion_(burdy, "n019_wing_Appeal");			// �o�[�f�B �ҋ@�������L���|�[�Y�����߂�
	local burdy_wing_Appeal_L = ReadMotion_(burdy, "n019_wing_Appeal_L");		// ���߃|�[�YL
	local rena_caution_L = ReadMotion_(rena, "n007_caution_L");					// ���i�[�e �x��L
	
	//���ǂ���l��
	local boy_sleep = ReadMotion_(boy, "n010_cold_sleep_L");					// �R�[���h�X���[�v�p���[�V����
	SetMotion_(boy, boy_sleep, BLEND_N);
	SetFace_(boy, "Face_loop_close02");

// ���J�����ݒ�
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");

//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------

	SetMotion_(rena, rena_caution_L, BLEND_L);										//���i�[�e �x��L

	SetScaleSilhouette(burdy, SCALE.N, SILHOUETTE_WIDTH.N);
	
	SetAlpha_(darkmaster000, 0);
	SetAlpha_(darkmaster001, 1);
	
	SetMotion_(burdy, burdy_idolL, BLEND_L);										//�o�[�f�B �ҋ@

	StartDemo(FADE_COLOR_BLACK);
	
	SetMotion_(player, MOT_RUN, BLEND_L);
	local task_player = Task_AnimeMove_(player, "anmplayer000");
	Wait_(8);
	SetMotion_(player, player_run_battle, BLEND_L);
	Wait_(10);
	SetMotion_(player, player_battle_L, BLEND_L);
	
	Wait_(20);

	SetMotion_(darkmaster001, MOT_WALK, BLEND_L);
	SetMotion_(plometeusu, MOT_WALK, BLEND_L);
	local task_plometeusu_step = Task_ChangeStepSe(plometeusu, "SE_FLD_033", 30);							//�v�����e�E�X����
	
	local task_darkmaster = Task_RotateToPos_(darkmaster001, GetPos_(player), 2.0);
	local task_plometeusu = Task_RotateToPos_(plometeusu, GetPos_(player), 2.0);
	Wait_(80);
	SetMotion_(darkmaster001, MOT_WAIT, BLEND_L);
	SetMotion_(plometeusu, MOT_WAIT, BLEND_L);

	Wait_(30);
	DeleteTaskStepSe(plometeusu, task_plometeusu_step);

//�o�[�f�B �J����
	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");
	
	DeleteTask_(task_darkmaster);
	DeleteTask_(task_plometeusu);
		
	SetMotion_(burdy, burdy_wing_Appeal, BLEND_XL);									//�o�[�f�B �ҋ@�������L���|�[�Y�����߂�
	Wait_(33);//����wait�ň�a���Ȃ����[�V�������q����
	SetMotion_(burdy, burdy_wing_Appeal_L, BLEND_L);								//�o�[�f�B �ҋ@�������L���|�[�Y�����߂�L
	
	//===============================================
	//*�o�[�f�B
	// 	�u�c�c���[���@���Ƃ��A���Z�X�łȂ��Ă�
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_BIRDY");
	ShowMsg_("DEMO_523_MSG_010");
	KeyInputWait_();
	//===============================================
	
	//===============================================
	//*�o�[�f�B
	// 	�u�n�[�h���������ǁ@���Ԃ͉҂������[�I
	//-----------------------------------------------
	ShowMsg_("DEMO_523_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	Wait_(20);
		
	SetAlpha_(burdy, 0);
	SetAlpha_(darkmaster000, 1);
	SetAlpha_(darkmaster001, 0);

//�_�[�N�}�X�^�[�ƃv�����e�E�X �J����

	SetPointCameraEye_("cameye002");
	SetPointCameraTarget_("camtgt002");
	SetVisible(player, false);
	SetDir_(darkmaster000, 277.5);//�J��������(����������l���̂���ʒu)�����銴����
	SetAlpha_(burdy, 0);
	
	SetMotion_(darkmaster000, darkmaster_laugh_L, BLEND_L);				//�_�[�N�}�X�^�[ �΂�
	Wait_(5);

	//===============================================
	//*�_�[�N�}�X�^�[
	// �u�t�n�n�n�I�@�K�����ȁH
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_DARKMASTER");
	ShowMsg_("DEMO_523_MSG_030");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	Wait_(5);

//�_�v�����e�E�X�퓬�O �J����
	SetPointCameraEye_("cameye003");
	SetPointCameraTarget_("camtgt003");
	SetAlpha_(darkmaster000, 0);
	SetAlpha_(player, 0);
	SetPointPos_(plometeusu, "npc_plometeusu002");

	PlaySE_("SE_DEM_135");															//��SE:�v�����e�E�X�퓬���O
	SetMotion_(plometeusu, MOT_SPELL_ACTUATE, BLEND_L);
	Wait_(25);

	EncountEndDemo(ENCOUNT_BOSS);
}
