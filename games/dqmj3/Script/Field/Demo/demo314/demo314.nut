//========================================================
//
//		demo314[�g�[�h�[�̗���]
//
//========================================================

function Update()
{
	//=====================================
	//���[�J���ϐ��̐ݒ�
	//=====================================
	local task_cam, task_player, task_todo, task_ietasu;								//�^�X�N�֌W�̕ϐ�
	local task_okiduti, task_momo;														//�^�X�N�֌W�̕ϐ�
	local efc_player, efc_cam, efc_attack01, efc_attack02, efc_guard, efc_smoke;		//�G�t�F�N�g�֌W�̕ϐ�
	
	//=====================================
	//���\�[�X�ǂݍ���
	//=====================================
	
	//����l���iID�̎擾�j
	local player = GetPlayerId_();
	
	//��NPC
	local model_todo   = ReadNpc_("n039");								// �g�[�h�[�e��
	local model_ietasu = ReadNpc_("n041");								// �C�G�^�X
	local model_okiduti = ReadNpc_("m035_00");							// �������Â�
	local model_momo = ReadNpc_("m041_02");								// ���C�W�����񂶂�
	
	//���M�~�b�N
	local ice_wall = ReadGimmick_("o_I01_00");							// �X�̕�
	
	//���G�t�F�N�g
	LoadEffect_("ef733_01_sym_shuchusen01");									// �W����
	LoadEffect_("ef831_01_atc_yetas");									// �����U��
	LoadEffect_("ef723_01_nat_explosion_n01");							// �ėp����
	LoadEffect_("ef712_10_emo_surprise01");								//�I
	

	//=====================================
	//�ݒu
	//====================================
	//���L�����N�^�[
	SetPointPos_(player, "player000");									//��l��

	local todo   = ArrangePointNpc_(model_todo, "npc_todo000");			//�g�[�h�[
	SetScaleSilhouette(todo, SCALE.TODO, 0.5);
	SetFace_(todo, "Face_default");

	local ietasu = ArrangePointNpc_(model_ietasu, "npc_ietasu000");		//�C�G�^�X
	SetScaleSilhouette(ietasu, SCALE.N, 0.3);

	local okiduti00 = ArrangePointNpc_(model_okiduti, "npc_okiduti000");//�������Â�A
	SetScaleSilhouette(okiduti00, SCALE.N, SILHOUETTE_WIDTH.N);
	
	local okiduti01 = ArrangePointNpc_(model_okiduti, "npc_okiduti100");//�������Â�B
	SetScaleSilhouette(okiduti01, SCALE.N, SILHOUETTE_WIDTH.N);
	
	local okiduti02 = ArrangePointNpc_(model_okiduti, "npc_okiduti200");//�������Â�C
	SetScaleSilhouette(okiduti02, SCALE.N, SILHOUETTE_WIDTH.N);

	local momo00 = ArrangePointNpc_(model_momo, "npc_momo000");			//���C�W�����񂶂�A
	SetScaleSilhouette(momo00, SCALE.N, SILHOUETTE_WIDTH.N);

	local momo01 = ArrangePointNpc_(model_momo, "npc_momo100");			//���C�W�����񂶂�B
	SetScaleSilhouette(momo01, SCALE.N, SILHOUETTE_WIDTH.N);

	local momo02 = ArrangePointNpc_(model_momo, "npc_momo200");			//���C�W�����񂶂�C
	SetScaleSilhouette(momo02, SCALE.N, SILHOUETTE_WIDTH.N);
	
	//���G�t�F�N�g�ݒu�̂��ߔz�u
	local ietasu_atc = ArrangePointNpc_(model_ietasu, "efc_attack000");	//�C�G�^�X�̍U��
	SetPointPosNoFit_(ietasu_atc, "efc_attack000");						//�󒆔z�u
	SetAlpha_(ietasu_atc, ALPHA_CLEAR);									//��\��
	
	
	//���M�~�b�N
	local res_ice = ArrangePointGimmick_("o_I01_00", ice_wall, "obj_ice_wall000");	//�X�̕�
	
	//=====================================
	//��풓���[�V�����ǂݍ���
	//=====================================
	
	// ��l��
	local pl_sup = ReadMotion_(player, "Player_surprise");				// ����
	local pl_sup_L = ReadMotion_(player, "Player_surprise_L");			// ����L
	local pl_caution01_L = ReadMotion_(player, "Player_caution01_L");	// �x��

	//�g�[�h�[
	local todooyabun_attack = ReadMotion_(todo, "n039_attack");			// �U���i�g�[�h�[�e���p�j
	local yetas_attack = ReadMotion_(ietasu, "n041_attack");			// �U���i�C�G�^�X�p�j

//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------
	
	//���������[�V����
	SetMotion_(player, MOT_RUN, BLEND_N)									//��@����

	//��������������������������������������
	//���J�b�g�P ��l���@�g�h�̉Ƃ���J�����C��
	//��������������������������������������
	//�`�`�`�`�`�`�`�`�`�J�����`�`�`�`�`�`�`�`�`�`�`
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");

	task_player = Task_MoveForward_(player, 0.9, true);						//��l������
	StartDemo(FADE_COLOR_BLACK);											//�t�F�[�h�C��
	
	Wait_(33);

	SetMotion_(player, pl_sup, BLEND_L)										//��@����
	Wait_(4);
	SetStepSe_(player, SILENT_STEP_SE);
	WaitMotion(player);
	DeleteTask_(task_player);
	SetMotion_(player, pl_sup_L, BLEND_L)									//��@����L
	
	PlaySE_("SE_DEM_053");
	efc_player = SetSelectBoneEffectSetOffset_("ef712_10_emo_surprise01", player, ATTACH_EFFECT1, Vec3(0.6, 1.3, 0.0));
	SetEffectScale_(efc_player, 0.5);

	
	WaitTask(task_cam);
	Wait_(60);
	
	//��������������������������������������
	//���J�b�g2 �g�hvs�C�G�@��Y�[���A�b�v��J�����C��
	//��������������������������������������
	SetPointPos_(player, "player001");										//��l���ړ�
	ResetStepSe_(player);
	SetMotion_(player, MOT_RUN, BLEND_N)									//��@����
	
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");
	
	SetStepSe_(okiduti00, SILENT_STEP_SE);									//�����𖳉��ɂ���
	SetMotion_(okiduti00, MOT_RUN, BLEND_N)									//�������Â�����
	task_okiduti = Task_MoveForward_(okiduti00, 1.3, true);					//�ؒƑ���
	Wait_(37);
	SetMotion_(okiduti00, MOT_WAIT, BLEND_L)								//�������Â��ҋ@
	DeleteTask_(task_okiduti);
	
	WaitTask(task_cam);
	
	//��Y�[���A�b�v��J�����C��
	task_player = Task_MoveForward_(player, 1.0, true);						//��l������
	Wait_(25);
	DeleteTask_(task_player);
	SetMotion_(player, pl_caution01_L, BLEND_L)								//��@�x��
	
	Wait_(30);
	
	//��������������������������������������
	//���J�b�g3 �g�h�@�Y�[���C��
	//��������������������������������������
	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");
	PlaySE_("SE_DEM_026");	// ��SE:�W����
	efc_cam = SetCameraEffect_("ef733_01_sym_shuchusen01", 100);					//�g�h�ɏW����
	WaitTask(task_cam);

	//===============================================
	//���g�[�h�[
	//�u�C�G�^�X�I�@���V�̓V���o�[���E���Ă������I
	//�@�Ȃ����H�@���������Ɂ@���V���^���I�H
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_TODO");
	ShowMsg_("DEMO_314_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	DeleteEffectEmitter_(efc_cam);
	Wait_(10);
	//��������������������������������������
	//���J�b�g4 �C�G�@�Y�[���C��
	//��������������������������������������
	task_cam = Task_AnimeMoveCamera_("anmeye003", "anmtgt003");
	WaitTask(task_cam);

	//===============================================
	//���C�G�^�X
	//�u�ⓚ���p�I�@�Ђ��傤�҂Ɂ@���̃I�T�̏؂�
	//�@�ӂ��킵���Ȃ��Ɓ@�m�邪�����I
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_IETASU");
	ShowMsg_("DEMO_314_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	//��������������������������������������
	//���J�b�g5 �C�G�U��
	//��������������������������������������
	task_cam = Task_AnimeMoveCamera_("anmeye004", "anmtgt004");									//�U�����ɃY�[���A�E�g
	InitSilhouetteWidth_(ietasu, 1.5);

	efc_cam = SetCameraEffect_("ef733_01_sym_shuchusen01", 0);										//�C�G�ɏW����
	SetMotion_(ietasu, yetas_attack, BLEND_M)													//�C�G�^�X�ʏ�U��
	efc_attack01 = SetSelectBoneEffect_("ef831_01_atc_yetas", ietasu, ATTACH_EFFECT1);			//�����U��ef
	SetEffectScale_(efc_attack01, 1.0);
	PlaySE_("SE_DEM_112");
	
	WaitTask(task_cam);
	Wait_(10);

	efc_attack02 = SetSelectBoneEffect_("ef831_01_atc_yetas", ietasu_atc, ATTACH_EFFECT1);		//�����Ȃ��C�G�^�X�ōU��ef���G�t�F�N�g�̎˒������̂��ߐݒu
	SetEffectScale_(efc_attack02, 0.01);
	Wait_(15);

	SetMotionSpeed_(todo, 1.5);																	// ���[�V�����������Ȃ�
	SetMotion_(todo, todooyabun_attack, BLEND_M)												//�g�h�ʏ�U��
	Wait_(10);
	
	//��������������������������������������
	//���J�b�g6 �g�h�h��
	//��������������������������������������
	task_cam = Task_AnimeMoveCamera_("anmeye005", "anmtgt005");									//25F
	PlaySE_("SE_DEM_113");
	SetEffectScale_(efc_attack02, 1.0);
	Wait_(2);
	
	DeleteEffectEmitter_(efc_attack02);
	Wait_(3);
	StartEarthQuake_(-1, 3, 4);																	//�n�k
	efc_guard = SetPointWorldEffect_("ef723_01_nat_explosion_n01", "efc_guard000");				//�����@���E�G�t�F�N�g
	SetEffectScale_(efc_guard, 0.4);
	Wait_(12);
	StopEarthQuake_();
	DeleteEffectEmitter_(efc_cam);
	WaitTask(task_cam);

	SetMotion_(todo, MOT_WAIT, BLEND_XL)														//�g�h�ҋ@

	Wait_(30);
	

	SetMotionSpeed_(todo, 1.2);																	// ���[�V�������ɖ߂�
	//��������������������������������������
	//���J�b�g7 �Y�[���C��
	//��������������������������������������
	task_cam = Task_AnimeMoveCamera_("anmeye006", "anmtgt006");
	Wait_(3);
	efc_cam = SetCameraEffect_("ef733_01_sym_shuchusen01", 100);										//�g�h�ɏW����

	WaitTask(task_cam);
	DeleteEffectEmitter_(efc_cam);

	//===============================================
	//���g�[�h�[
	//�u���������@������������Ƃ����킯���I
	//�@�����Ȃ�΁@�^�����@���炩�ɂ���܂ŁI
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_TODO");
	ShowMsg_("DEMO_314_MSG_030");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	//��������������������������������������
	//���J�b�g8 ��l���A�b�v
	//��������������������������������������
	SetPointPos_(player, "player002");															//��l���ړ�

	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");
	
	Wait_(5);
	//===============================================
	//�u<name_player/>��I�@�V���o�[�̎��𒲂ׂ�
	//�@�䂪�����́@����I�ȏ؋����@�T���Ă��ꂢ�I
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_TODO");
	ShowMsg_("DEMO_314_MSG_040");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	Wait_(5);
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 10);	
	WaitFade_();

	//��������������������������������������
	//���J�b�g9 �X�̗쉀���f��
	//��������������������������������������
	task_cam = Task_AnimeMoveCamera_("anmeye007", "anmtgt007");
	SetFade_(FADE_IN, FADE_COLOR_BLACK, 30);
	Wait_(20);

	//===============================================
	//���g�[�h�[
	//�u���|�[���p�[�N�̒��Ɂ@�X�̗쉀��
	//�@���V�炪�Ăԁ@��ꂪ����I
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_TODO");
	ShowMsg_("DEMO_314_MSG_050");
	KeyInputWait_();
	//===============================================
	
	//===============================================
	//�u�����ɑ���ꂽ�@�V���o�[�̊����@���ׂ�I
	//�@�z���@�肪������c�����@���ʂ͂����Ȃ��I
	//-----------------------------------------------
	ShowMsg_("DEMO_314_MSG_060");
	KeyInputWait_();
	//===============================================
	
	//===============================================
	//�u�C�G�^�X�́@���V���}���Ă�������
	//�@�؋��������ā@������@���܂点�Ă���I
	//-----------------------------------------------
	ShowMsg_("DEMO_314_MSG_070");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	Wait_(40);

	DeleteTask_(task_cam);

	//��������������������������������������
	//���J�b�g10 �g�h�A�b�v
	//��������������������������������������
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");
	
	//===============================================
	//���g�[�h�[
	//�u���͂�@���񂵂������@���肶��I
	//�@�C�������@<name_player/>�I
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_TODO");
	ShowMsg_("DEMO_314_MSG_080");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	
	EndDemo(FADE_COLOR_BLACK);
	
}
