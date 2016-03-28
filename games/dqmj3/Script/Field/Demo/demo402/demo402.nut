//=============================================
//
//		demo402[�C�b�^�u���̃n�R]
//
//=============================================

//		�d�����̂������
//
//----------------------------------------------------------------------------
//	����	: chr			�L����
//			: mot			���[�V����
//			: spd			���[�V�����X�s�[�h(����:SPEED_N�A�������:SPEED_S)
//			: frm			����t������(�f�t�H���g���l)
//			: tsk			�^�X�N��
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
const SPEED_N = 1;
const SPEED_S = 0.5;
function WalkQuake_(chr, mot, spd, frm, tsk)
{
	local m_spd = frm / spd;
	SetMotion_(chr, mot, 8);
	SetMotionSpeed_(chr, spd);
	
	local cnt = 0;
	while(!IsTaskEnd_(tsk)){
		//StartEarthQuake_(10, 3, 0.7);
		PlaySE_("SE_DEM_014");
		Wait_(m_spd);
		cnt++;
	}
	SetMotionSpeed_(chr, 1);
	
	return cnt;
}

//-------------------------------------------------------------------------
//
//		�ǂݍ��݁E�z�u
//
//-------------------------------------------------------------------------
function Update()
{
// ���ϐ���`
	local task_cam, task_player, task_boy, task_ittaburu, task_box;
	local efc_player, efc_cam, efc_box, efc_aroi_a;

// �����\�[�X�Ǎ�
	// �L�����N�^�[
	local player = GetPlayerId_();							// ��l��
	local model_togejobo = ReadNpc_("m127_01");				// �Ƃ��W���{�[
	local model_saboten	 = ReadNpc_("m064_00");				// �T�{�e���{�[��
	local model_dessert	 = ReadNpc_("m132_01");				// �f�U�[�g�^���N
	local model_ittaburu = ReadNpc_("m205_00");				// �C�b�^�u��
	// �M�~�b�N
	local model_box = ReadGimmick_("o_S01_02");				// �S�̔�
	// �G�t�F�N�g
	LoadEffect_("ef733_01_sym_shuchusen01");				// �W����
	LoadEffect_("ef721_03_nat_smoke_n03");					// ����
	LoadEffect_("ef712_13_emo_sweat01");					// ��

// ���z�u
	// ��l��
	SetPointPos_(player, "player000");
	// ���N(�X�p�C�N�w�b�h)
	local boy = ArrangePointNpc_(model_togejobo, "npc_boy000");
	SetScaleSilhouette(boy, SCALE.S, 0.4);
	SetStepSePan_(boy, false);
	// �A���C�p�[�N�Z�l�`
	local aroi_a = ArrangePointNpc_(model_saboten, "npc_aroi_a000");
	SetScaleSilhouette(aroi_a, SCALE.SABOTENBOUL,SILHOUETTE_WIDTH.SABOTENBOUL);
	SetAlpha_(aroi_a, ALPHA_CLEAR);
	// �A���C�p�[�N�Z�l�a
	local aroi_b = ArrangePointNpc_(model_dessert, "npc_aroi_b000");
	SetScaleSilhouette(aroi_b, SCALE.DEZATOTANKU,SILHOUETTE_WIDTH.DEZATOTANKU);
	SetAlpha_(aroi_b, ALPHA_CLEAR);
	// �A���C�p�[�N�Z�l�b
	local aroi_c = ArrangePointNpc_(model_saboten, "npc_aroi_c000");
	SetScaleSilhouette(aroi_c, SCALE.SABOTENBOUL,SILHOUETTE_WIDTH.SABOTENBOUL);
	SetAlpha_(aroi_c, ALPHA_CLEAR);
	// �C�b�^�u��
	local ittaburu = ArrangePointNpc_(model_ittaburu, "npc_ittaburu000");
	SetScale_(ittaburu, SCALE.M);
	// �S�̔�
	local box = ArrangePointGimmick_("o_S01_02", model_box, "obj_box000");
	SetGimmickMapHitEnable_(box, false);

// ����풓���[�V�����Ǎ�
	local player_look_right_L = ReadMotion_(player, "Player_look_right_L");			// ��l���@�E������L
	local player_nod = ReadMotion_(player, "Player_nod");							// �ҋ@���������ҋ@
	local boy_talk_L = ReadMotion_(boy, "m127_01_talk_L");							// ���N(�X�p�C�N�w�b�h)�@��bL
	local boy_feel_down_L = ReadMotion_(boy, "m127_01_feel_down_L");				// ���N(�X�p�C�N�w�b�h)�@��������L
	local boy_what_L = ReadMotion_(boy, "m127_01_what_L");							// ���N(�X�p�C�N�w�b�h)�@��HL
	local boy_irritated_L = ReadMotion_(boy, "m127_01_irritated_L");				// ���N(�X�p�C�N�w�b�h)�@�ł�L
	local aroi_a_frightened_L = ReadMotion_(aroi_a, "m064_01_Frightened_L");		// �A���C�p�[�N�Z�l�`�@���т�L
	local aroi_c_frightened_L = ReadMotion_(aroi_c, "m064_01_Frightened_L");		// �A���C�p�[�N�Z�l�b�@���т�L
	local ittaburu_box_wait_L = ReadMotion_(ittaburu, "m205_00_box_wait_L");		// �C�b�^�u���@��������ҋ@L
	local ittaburu_box_carry_L = ReadMotion_(ittaburu, "m205_00_box_carry_L");		// �C�b�^�u���@��������ĕ���L
	local ittaburu_Pressure = ReadMotion_(ittaburu, "m205_00_Pressure");			// �C�b�^�u���@�ҋ@���Ј�
	local ittaburu_Pressure_L = ReadMotion_(ittaburu, "m205_00_Pressure_L");		// �C�b�^�u���@�Ј�L

	//��������������������������������������
	//���J�b�g1�@���N�O�@��l���@��b
	//��������������������������������������

// ���J�����ݒ�
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");

//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);
	WaitFade_();
	SetMotion_(boy, boy_talk_L, BLEND_XL);					// ���N�@��bL

	//===============================================
	// *���N
	// �u���Z����@���Ȃ��炾�ˁH
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_MONSTER_BOY");
	ShowMsg_("DEMO_412_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	SetMotion_(boy, MOT_WAIT, BLEND_XL);					// ���N�@�ҋ@
	Wait_(8);
	SetMotion_(player, player_nod, BLEND_L);				// ��l���@�ҋ@���������ҋ@
	Wait_(25);
	SetMotion_(player, MOT_WAIT, BLEND_M);					// ��l���@�ҋ@
	Wait_(15);

	//��������������������������������������
	//���J�b�g2�@���N�@�������݁���H�@�A�b�v���Y�[���C��
	//��������������������������������������

	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");

	SetMotion_(boy, boy_feel_down_L, BLEND_XL);				// ���N�@��������L
	Wait_(30);

	//===============================================
	// *���N
	// �u���L�����@�ǂ��ɍs�����̂��@�m���Ă��B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_MONSTER_BOY");
	ShowMsg_("DEMO_412_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	StopBgm_(200);										//BGM��~
	
	Wait_(15);
	StopBgm_(80);
	StartDecayEarthQuake_(10, 5, 2.5);
	PlaySE_("SE_DEM_014");
	Wait_(40);
	StartDecayEarthQuake_(8, 4, 2);
	PlaySE_("SE_DEM_014");
	Wait_(40);
	StartDecayEarthQuake_(6, 3, 1.5);
	PlaySE_("SE_DEM_014");
	Wait_(15);
	local task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");
	SetMotion_(boy, boy_what_L, 7);							// ���N�@��HL
	Wait_(30);
	DeleteTask_(task_cam);

	PlayBgm_("BGM_007");

	//��������������������������������������
	//���J�b�g3�@�C�b�^�u���@���s���ҋ@�@���������s�ɍ��킹�ăJ�����������ҋ@�ło�`�m�A�b�v
	//��������������������������������������
	InitSilhouetteWidth_(boy, 0.9);
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");
	task_ittaburu = Task_AnimeMove_(ittaburu, "anm_ittaburu000");
	task_box = Task_AnimeMove_(box, "anm_box000");

	SetMotion_(ittaburu, ittaburu_box_carry_L, BLEND_N);	// �C�b�^�u���@��������ĕ���L
	SetMotion_(box, MOT_GIMMICK_5, BLEND_N);				// �S�̔��@(�C�b�^�u��_���������s)
	SetMotionSpeed_(ittaburu, 0.5);
	SetMotionSpeed_(box, 0.5);
	Wait_(33);
	StartDecayEarthQuake_(12, 6, 2.5);
	PlaySE_("SE_DEM_014");
	Wait_(27);
	SetMotion_(ittaburu, ittaburu_box_wait_L, 36);			// �C�b�^�u���@��������ҋ@L
	SetMotion_(box, MOT_GIMMICK_4, 36);						// �S�̔��@(�C�b�^�u��_�������ҋ@)
	StartDecayEarthQuake_(10, 5, 2);
	PlaySE_("SE_DEM_014");
	Wait_(27);
	StartDecayEarthQuake_(8, 4, 1.5);
	PlaySE_("SE_DEM_014");
	Wait_(88);

	DeleteTask_(task_box);
	DeleteTask_(task_ittaburu);
	PlaySE_("SE_DEM_026");	// ��SE:�W����
	efc_cam = SetCameraEffect_("ef733_01_sym_shuchusen01", CAMERA_DEF);// �W����
	Wait_(10);
	DeleteEffectEmitter_(efc_cam);
	DeleteTask_(task_cam);

	//===============================================
	// *���N
	// �u����́c�c���≤�C�b�^�u���I
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_MONSTER_BOY");
	ShowMsg_("DEMO_412_MSG_030");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================


	//��������������������������������������
	//���J�b�g4�@��l���Ə��N�@��A�ɉB���
	//��������������������������������������

	SetPointCameraEye_("cameye002");
	SetPointCameraTarget_("camtgt002");

	SetAlpha_(aroi_a, ALPHA_EXIST);
	SetAlpha_(aroi_b, ALPHA_EXIST);
	SetAlpha_(aroi_c, ALPHA_EXIST);
	SetPointPos_(ittaburu, "npc_ittaburu000");				// �C�b�^�u���@�ړ���������߂�
	SetPointPos_(box, "obj_box000");						// �S�̔��@�ړ���������߂�
	SetMotion_(player, MOT_RUN, BLEND_N);					// ��l���@����
	SetMotion_(boy, MOT_RUN, BLEND_N);						// ���N�@����
	SetMotion_(aroi_a, aroi_a_frightened_L, BLEND_N);		// �A���C�p�[�N�Z�l�`�@���т�L
	SetMotion_(aroi_c, aroi_c_frightened_L, BLEND_N);		// �A���C�p�[�N�Z�l�b�@���т�L
	task_player = Task_AnimeMove_(player, "anm_player000");
	task_boy = Task_AnimeMove_(boy, "anm_boy000");
	Wait_(40);
	DeleteTask_(task_player);
	task_player = Task_RotateToDirSetMotion_(player, -173, 2.5, MOT_WALK, MOT_WAIT);
	Wait_(2);
	DeleteTask_(task_boy);
	task_boy = Task_RotateToDir_(boy, -165, 2.5);
	SetMotion_(boy, MOT_WALK, BLEND_L);						// ���N�@����
	WaitTask(task_boy);
	SetMotion_(boy, MOT_WAIT, BLEND_XL);					// ���N�@�ҋ@
	DeleteTask_(task_player);
	DeleteTask_(task_boy);
	Wait_(30);


	//��������������������������������������
	//���J�b�g5�@�C�b�^�u�������@������Z�l�@�J�����C�b�^�u�����Z�l������܂ŃY�[���A�E�g
	//��������������������������������������

	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");
	SetMotion_(box, MOT_GIMMICK_5, BLEND_N);				// �S�̔��@(�C�b�^�u��_���������s)
	task_ittaburu = Task_AnimeMove_(ittaburu, "anm_ittaburu001");
	task_box = Task_AnimeMove_(box, "anm_box001");

	WalkQuake_(ittaburu, ittaburu_box_carry_L, 0.5, 15, task_ittaburu)
	DeleteTask_(task_ittaburu);
	DeleteTask_(task_box);

	SetMotion_(ittaburu, ittaburu_box_wait_L, BLEND_XL);	// �C�b�^�u���@��������ҋ@L
	SetMotionSpeed_(box, 1);
	SetMotion_(box, MOT_GIMMICK_4, BLEND_XL);				// �S�̔��@(�C�b�^�u��_�������ҋ@)
	Wait_(1);
	StartDecayEarthQuake_(8, 4, 1.5);
	PlaySE_("SE_DEM_014");
	WaitTask(task_cam);
	DeleteTask_(task_cam);
	Wait_(30);


	//��������������������������������������
	//���J�b�g6�@�S�̔��@�n�k�{�����@�A�b�v
	//��������������������������������������

	SetPointCameraEye_("cameye003");
	SetPointCameraTarget_("camtgt003");

	SetAlpha_(ittaburu, ALPHA_CLEAR);
	SetPointPos_(box, "obj_box001");						// �S�̔��@����ݒu
	SetMotion_(box, MOT_GIMMICK_0, BLEND_N);				// �S�̔��@(�C�b�^�u��_�ҋ@)
	efc_box = SetPointWorldEffect_("ef721_03_nat_smoke_n03", "obj_box001");// ����
	SetEffectScale_(efc_box, 1.5);
	StartDecayEarthQuake_(24, 3, 3.5);
	PlaySE_("SE_DEM_074");
	Wait_(60);
	DeleteEffectEmitter_(efc_box);


	//��������������������������������������
	//���J�b�g7�@�C�b�^�u���@�Ј��@�A�b�v
	//��������������������������������������

	SetPointCameraEye_("cameye004");
	SetPointCameraTarget_("camtgt004");

	SetAlpha_(ittaburu, ALPHA_EXIST);
	SetMotion_(ittaburu, MOT_WAIT, BLEND_N);				// �C�b�^�u���@�ҋ@
	Wait_(1);
	SetMotion_(ittaburu, ittaburu_Pressure_L, BLEND_XL);	// �C�b�^�u���@�Ј�L
	Wait_(15);

	//===============================================
	// ���C�b�^�u��
	// �u�������@�C�P�j�G���@�}���ɎQ�����I
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ITABURU");
	ShowMsg_("DEMO_412_MSG_040");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================


	//��������������������������������������
	//���J�b�g8�@�A���C�p�[�N�Z�l�`�@���т��@�A�b�v
	//��������������������������������������

	SetPointCameraEye_("cameye005");
	SetPointCameraTarget_("camtgt005");

	SetAlpha_(player, ALPHA_CLEAR);
	SetAlpha_(boy, ALPHA_CLEAR);
	SetPointPos_(aroi_a, "npc_aroi_a001");					// �A���C�p�[�N�Z�l�`�@���т��J�����ʒu
	efc_aroi_a = SetSelectBoneEffect_("ef712_13_emo_sweat01", aroi_a, ATTACH_EFFECT2);// ��
	SetEffectScale_(efc_aroi_a, 3.0);

	//===============================================
	// *�A���C�p�[�N�Z�l�`
	// �u��c�c�킩���Ă���܂��I
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_412_MSG_050");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================


	//��������������������������������������
	//���J�b�g9�@�C�b�^�u���@�A�b�v���S�̔��܂ŃY�[���A�E�g
	//��������������������������������������

	task_cam = Task_AnimeMoveCamera_("anmeye003", "anmtgt003");

	DeleteEffectEmitter_(efc_aroi_a);
	SetMotion_(ittaburu, MOT_WAIT, BLEND_N);				// �C�b�^�u���@�ҋ@

	//===============================================
	// ���C�b�^�u��
	// �u���ށI�@�����Ȃ̂ł���B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ITABURU");
	ShowMsg_("DEMO_412_MSG_060");
	KeyInputWait_();
	//===============================================

	//===============================================
	// ���C�b�^�u��
	// �u�C�P�j�G�́@�����ʂ�
	//-----------------------------------------------
	ShowMsg_("DEMO_412_MSG_070");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	WaitTask(task_cam);
	DeleteTask_(task_cam);

	SetMotion_(ittaburu, MOT_WALK, BLEND_XL);				// �C�b�^�u���@����
	task_ittaburu = Task_RotateToDir_(ittaburu, 180, 3.0);
	SetMotionSpeed_(ittaburu,0.5);
	
	StartEarthQuake_(10, 3, 0.7);
	PlaySE_("SE_DEM_014");
	Wait_(30);
	
	StartEarthQuake_(10, 3, 0.7);
	PlaySE_("SE_DEM_014");
	Wait_(30);

	DeleteTask_(task_ittaburu);
	task_ittaburu = Task_AnimeMove_(ittaburu, "anm_ittaburu002");

	local m_spd = 15 / 0.5;
	SetMotion_(ittaburu, MOT_WALK, 8);
	SetMotionSpeed_(ittaburu, 0.5);
	
	local cnt = 0;
	while(!IsTaskEnd_(task_ittaburu)){
		StartEarthQuake_(10, 3, 0.7);
		PlaySE_("SE_DEM_014");
		Wait_(m_spd);
		cnt++;
	}

	StartEarthQuake_(10, 3, 0.7);
	PlaySE_("SE_DEM_014");
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 30);
	WaitFade_();
	DeleteTask_(task_ittaburu);
	SetMotion_(ittaburu, MOT_WAIT, BLEND_N);				// �C�b�^�u���@�ҋ@
	Wait_(30);


	//��������������������������������������
	//���J�b�g10�@��l���Ə��N�@����������l�@������l�փY�[���C��
	//��������������������������������������

	task_cam = Task_AnimeMoveCamera_("anmeye004", "anmtgt004");

	SetAlpha_(ittaburu, ALPHA_CLEAR);
	SetAlpha_(aroi_c, ALPHA_CLEAR);
	SetAlpha_(player, ALPHA_EXIST);
	SetAlpha_(boy, ALPHA_EXIST);
	SetPointPos_(player, "player001");
	SetPointPos_(boy, "npc_boy001");
	SetMotion_(player, player_look_right_L, BLEND_XL);		// ��l���@�E������L
	SetFade_(FADE_IN, FADE_COLOR_BLACK, 30);
	Wait_(15);

	//===============================================
	// *���N
	// �u���Z����@���L���͂ˁc�c�����O��
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_MONSTER_BOY");
	ShowMsg_("DEMO_412_MSG_080");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	task_boy = Task_RotateToDir_(boy, 80, 3.5);
	SetMotion_(boy, MOT_WALK, BLEND_L);						// ���N�@����
	Wait_(9);
	SetMotion_(player, MOT_WAIT, BLEND_XL);					// ��l���@�ҋ@
	WaitTask(task_boy);
	SetMotion_(boy, MOT_WAIT, BLEND_XL);					// ���N�@�ҋ@
	WaitTask(task_cam);
	DeleteTask_(task_cam);
//	Wait_(30);


	//��������������������������������������
	//���J�b�g11�@���N�@�������ށ���H�@�A�b�v���Y�[���C��
	//��������������������������������������
	InitSilhouetteWidth_(boy, 0.8);
	SetPointCameraEye_("cameye006");
	SetPointCameraTarget_("camtgt006");

	SetPointPos_(boy, "npc_boy000");
	SetDir_(boy, 120);
	SetMotion_(boy, boy_feel_down_L, BLEND_XL);				// ���N�@��������L
	Wait_(30);

	//===============================================
	// *���N
	// �u���̂Ƃ��@�C�P�j�G�Ɂ@�Ȃ�͂�������
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_MONSTER_BOY");
	ShowMsg_("DEMO_412_MSG_090");
	KeyInputWait_();
	//===============================================

	//===============================================
	// *���N
	// �u�ł��@���������@���L���������Ă��ꂽ�̂�
	//-----------------------------------------------
	ShowMsg_("DEMO_412_MSG_100");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	Wait_(30);
	SetMotion_(boy, boy_what_L, BLEND_XL);					// ���N�@��HL
	task_cam = Task_AnimeMoveCamera_("anmeye005", "anmtgt005");
	Wait_(15);

	//===============================================
	// *���N
	// �u�˂��c�c���Z����B�����ɂ́@�ǂ�����
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_MONSTER_BOY");
	ShowMsg_("DEMO_412_MSG_110");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	WaitTask(task_cam);
	DeleteTask_(task_cam);
	Wait_(15);

	EndDemo(FADE_COLOR_BLACK);
}
