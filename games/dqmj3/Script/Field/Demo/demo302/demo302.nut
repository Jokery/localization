//=============================================
//
//		demo302[��e���g�[�h�[]
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
	local task_cam, task_player, task_todo, task_ookizuti;
	local efc_cam, efc_todo, efc_ookizuti;
	
// �����\�[�X�Ǎ�
	// �G�t�F�N�g
	LoadEffect_("ef712_10_emo_surprise01");		// �u�I�v
	LoadEffect_("ef733_01_sym_shuchusen01");	// �W����
	LoadEffect_("ef712_13_emo_sweat01");		// ��
	// �L�����N�^�[
	local player = GetPlayerId_();
	local model_todo = ReadNpc_("n039");		// �g�[�h�[�e��
	local model_ookizuti = ReadNpc_("m035_00")	// �g�[�h�[�q��(�������Â�)
	
// ���z�u
	// �L�����N�^�[
	SetPointPos_(player, "player000");
	SetDir_(player, 70);

	local todo = ArrangePointNpc_(model_todo, "npc_todo000");
	SetScaleSilhouette(todo, SCALE.TODO, 0.55);
	SetVisible(todo, false);

	local ookizuti = ArrangePointNpc_(model_ookizuti, "npc_ookizuti000");
	SetScaleSilhouette(ookizuti, SCALE.N, 0.4);
	SetStepSePan_(ookizuti, false);

// ����풓���[�V�����Ǎ�
	local player_surprise = ReadMotion_(player, "Player_surprise");			// ��l������
	local player_surprise_L = ReadMotion_(player, "Player_surprise_L");		// ��l������L
	local player_look_up = ReadMotion_(player, "Player_look_up_L");			// ��l�����グ��
	local player_nod = ReadMotion_(player, "Player_nod");					// ��l�����ȂÂ�
	local player_nod2 = ReadMotion_(player, "Player_nod02");				// ��l�����ȂÂ�(���グ)
	local player_talk = ReadMotion_(player, "Player_talk");					// ��l���b��
	local player_talk_L = ReadMotion_(player, "Player_talk_L");				// ��l���b��L
	
	local todo_arm_folde = ReadMotion_(todo, "n039_arm_folde01");		// �ҋ@���r�g��
	local todo_arm_folde_L = ReadMotion_(todo, "n039_arm_folde01_L");	// �r�g��1L�i�ڕ��j
	local todo_talk = ReadMotion_(todo, "n039_talk");					// �r�g��1���{���b
	local todo_talk_L = ReadMotion_(todo, "n039_talk_L");				// �{���bL
	local todo_arm_folde02_L = ReadMotion_(todo, "n039_arm_folde02_L");	// �r�g��2L�i�ڊJ���j
	local todo_arm_above_L = ReadMotion_(todo, "n039_arm_above_L");		// �r�g�݁@���グ��
	local todo_bow = ReadMotion_(todo, "n039_bow");						//�g�[�h�[ ����������
	local todo_talk2_L = ReadMotion_(todo, "m141_00_talk02_L");				//�g�[�h�[ ��b�Q

	local ookizuti_talk_L = ReadMotion_(ookizuti, "m035_00_talk_L");		// ��bL
	
	SetMotion_(player, MOT_WALK, BLEND_N);
	
// ���J�����ݒ�
	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");
	
//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------
	
	StartDemo(FADE_COLOR_BLACK);
	
	//===============================================
	//*�g�[�h�[�̎q���`
	// �u�g�[�h�[�e�����܂˂��I�@��蓦�����܂����ׁI
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_302_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetVisible(ookizuti, false);
	SetVisible(todo, true);
	
	//��������������������������������������
	//���J�b�g2
	//��������������������������������������
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");
	InitSilhouetteWidth_(todo, 0.9);
	Wait_(10);
	PlaySE_("SE_DEM_026");	// ��SE:�W����
	efc_cam = SetCameraEffect_("ef733_01_sym_shuchusen01", CAMERA_DEF);
	
	efc_todo = SetSelectBoneEffectSetOffset_("ef712_13_emo_sweat01", todo, ATTACH_EFFECT2, Vec3(0.6, 9.8, 15.1));
	SetEffectScale_(efc_todo, 2.0);
	SetMotion_(todo, todo_talk2_L, BLEND_M);

	//===============================================
	//*�g�[�h�[
	// �u�����[���I�@�܂������������̂��I
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_TODO");
	ShowMsg_("DEMO_302_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();

	DeleteTask_(task_cam);
	DeleteEffect_(efc_cam);
	DeleteEffect_(efc_todo);
	
	SetVisible(ookizuti, true);
	InitSilhouetteWidth_(ookizuti, 1.5);
	
	SetPointPos_(todo, "npc_todo001");
	
	//��������������������������������������
	//���J�b�g3
	//��������������������������������������
	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");
	SetMotion_(todo, MOT_WAIT, BLEND_N);
	InitSilhouetteWidth_(todo, 1.5);
	
	task_player = Task_AnimeMove_(player, "anm_player000");
	Wait_(5);
	
	SetMotion_(todo, todo_arm_folde, BLEND_L);
	WaitMotion(todo);
	SetMotion_(todo, todo_arm_folde_L, BLEND_XL);					//�ڕ�
	
	WaitTask(task_player);
	SetMotion_(player, player_look_up, BLEND_L);

	
	// ��l���ɋC�Â���l
	efc_todo = SetSelectBoneEffectSetOffset_("ef712_10_emo_surprise01", todo, ATTACH_EFFECT1, Vec3(5.0, 1.5, 0.0));
	SetEffectScale_(efc_todo, 3.0);
	efc_ookizuti = SetSelectBoneEffect_("ef712_10_emo_surprise01", ookizuti, ATTACH_EFFECT1);	// �u�I�v
	SetEffectScale_(efc_ookizuti, 3.0);
	PlaySE_("SE_DEM_053");		// �u�s���b�I�v
	SetMotion_(todo, todo_arm_folde02_L, BLEND_L);
	
	Wait_(30);
	
	SetMotion_(ookizuti, MOT_WALK, BLEND_M);
	task_ookizuti = Task_RotateToDir_(ookizuti, 250, ROTATE_DEMO_DEF);
	WaitTask(task_ookizuti);
	task_ookizuti = Task_RotateToDir_(ookizuti, 360, ROTATE_DEMO_DEF);
	WaitTask(task_ookizuti);
	task_ookizuti = Task_AnimeMove_(ookizuti, "anm_ookizuti000");
	
	//===============================================
	//*�g�[�h�[�̎q���`
	// �u�����I�@���O�ǂ��̑g�̂��񂾂ׁH
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_302_MSG_040");
	
	WaitTask(task_ookizuti);
	SetMotion_(ookizuti, MOT_WAIT, BLEND_M);
	
	// ��l���̂�����
	SetMotion_(player, player_surprise, BLEND_M);
	WaitMotion(player);
	SetMotion_(player, player_surprise_L, BLEND_M);
	
	KeyInputWait_();
	CloseMsgWnd_();

	DeleteTask_(task_cam);
	SetPointPos_(todo, "npc_todo000");

	//��������������������������������������
	//���J�b�g4
	//��������������������������������������
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");
	InitSilhouetteWidth_(ookizuti, 1.0);
	SetStepSe_(player, SILENT_STEP_SE);	// ������ �����ɂ���
	SetPointPos_(player, "player001");
	SetMotion_(ookizuti, ookizuti_talk_L, BLEND_N);
	Wait_(5);
	ResetStepSe_(player);

	//===============================================
	//*�g�[�h�[�̎q���`
	// �u�|�[���p�[�N���d�؂�@�g�[�h�[�e���̉��~��
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_302_MSG_050");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	Wait_(10);
	DeleteEffect_(efc_todo);
	SetVisible(ookizuti, false);

	//��������������������������������������
	//���J�b�g5
	//��������������������������������������
	task_cam = Task_AnimeMoveCamera_("anmeye005", "anmtgt005");
	InitSilhouetteWidth_(todo, 0.6);
	efc_cam = SetCameraEffect_("ef733_01_sym_shuchusen01", CAMERA_DEF);
	PlaySE_("SE_DEM_001");		// ���ėp�E�吺�̉��o

	SetMotion_(todo, todo_talk_L, BLEND_N);
	
	efc_todo = SetSelectBoneEffectSetOffset_("ef712_13_emo_sweat01", todo, ATTACH_EFFECT2, Vec3(0.6, 9.8, 15.1));
	SetEffectScale_(efc_todo, 2.0);
	
	//===============================================
	//*�g�[�h�[
	// �u��߂񂩁I�@�C�G�^�X�̎艺�ɂጩ����B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_TODO");
	ShowMsg_("DEMO_302_MSG_060");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	Wait_(7);
	
	task_ookizuti = Task_AnimeMove_(ookizuti, "anm_ookizuti001");
	Wait_(3);
	
	DeleteEffect_(efc_todo);
	
	DeleteTask_(task_cam);
	DeleteEffect_(efc_cam);

	SetMotion_(ookizuti, MOT_WALK, BLEND_N);
	SetVisible(ookizuti, true);
	
	//��������������������������������������
	//���J�b�g6
	//��������������������������������������
	task_cam = Task_AnimeMoveCamera_("anmeye003", "anmtgt003");
	InitSilhouetteWidth_(todo, 1.45);
	SetMotion_(player, MOT_WAIT, BLEND_N);
	
	SetStepSe_(todo, SILENT_STEP_SE);					// �����𖳉��ɂ���
	SetStepSe_(ookizuti, SILENT_STEP_SE);				// �����𖳉��ɂ���
	SetMotion_(todo, MOT_WALK, BLEND_L);
	task_todo = Task_AnimeMove_(todo, "anm_todo000");
	SetPointPos_(player, "player002");
	
	WaitTask(task_ookizuti);
	DeleteTask_(task_ookizuti);
	task_ookizuti = Task_RotateToPos_(ookizuti, GetPos_(todo), ROTATE_DEMO_DEF);
	SetMotion_(ookizuti, MOT_WAIT, BLEND_M);
	SetMotion_(player, player_look_up, BLEND_XL);
	
	PlaySE_("SE_FLD_029");		// �����X�^�[�ړ��F�����E4���i�d�j
	Wait_(30);
	PlaySE_("SE_FLD_029");		// �����X�^�[�ړ��F�����E4���i�d�j
	WaitTask(task_todo);

	SetMotion_(todo, todo_arm_folde02_L, BLEND_XL);
	
	//===============================================
	//*�g�[�h�[
	// �u��H�@���̎p�́@�܂����c�c�H
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_TODO");
	ShowMsg_("DEMO_302_MSG_070");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	DeleteTask_(task_ookizuti);
	SetMotion_(ookizuti, MOT_WALK, BLEND_M);
	task_ookizuti = Task_MoveForward_(ookizuti, 0.5, false);
	Wait_(20);
	DeleteTask_(task_ookizuti);
	SetMotion_(ookizuti, MOT_WAIT, BLEND_M);
	
	//===============================================
	//*�g�[�h�[�̎q���`
	// �u�e���c�c���������ꂽ�ׁH
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_302_MSG_080");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	Wait_(20);
	DeleteTask_(task_cam);
	//��������������������������������������
	//���J�b�g7�@��A�b�v
	//��������������������������������������
	SetVisible(ookizuti, false);

	SetPointCameraEye_("cameye002");
	SetPointCameraTarget_("camtgt002");
	
	//===============================================
	//*�g�[�h�[
	// �u�c�c���񂵂́@<name_player/>����ȁB
	// �@���L���Ɂ@��ɗ����񂩁c�c�H
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_TODO");
	ShowMsg_("DEMO_302_MSG_090");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	SetMotion_(player, player_nod2, BLEND_L);						//���グ����
	Wait_(20);
	SetMotion_(player, player_look_up, BLEND_L);
	
	Wait_(30);
	
	//��������������������������������������
	//���J�b�g8�@�g�[�h�[�A�b�v
	//��������������������������������������
	SetVisible(ookizuti, true);

	task_cam = Task_AnimeMoveCamera_("anmeye004", "anmtgt004");
	InitSilhouetteWidth_(todo, 0.6);

	Wait_(30);
	SetMotion_(todo, todo_arm_folde02_L, BLEND_XL);					//�ڊJ��

	//===============================================
	//*�g�[�h�[
	// �u���L���́@���V�̌Â��F�ɂ��ā@���l�B
	//�@�z����@���񂵂̂��Ƃ́@�����Ă������B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_TODO");
	ShowMsg_("DEMO_302_MSG_100");
	KeyInputWait_();
	//===============================================
	SetMotion_(todo, todo_arm_folde_L, BLEND_L);

	//===============================================
	//*�g�[�h�[
	// �u���L������@���񂵂��@���S�̊č����ɍs��
	//�@��`�����@���܂�Ƃ������c�c
	//-----------------------------------------------
	ShowMsg_("DEMO_302_MSG_110");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	Wait_(30);
	DeleteTask_(task_cam);
	
	//��������������������������������������
	//���J�b�g9�@�S��
	//��������������������������������������
	SetPointPos_(player, "player003");								//��@�ړ�
	SetPointPos_(ookizuti, "npc_ookizuti001");						//�������Â��ړ�
	SetPointPos_(todo, "npc_todo002");								//�g�[�h�[�ړ�
	task_cam = Task_AnimeMoveCamera_("anmeye006", "anmtgt006");
	
	//===============================================
	//*�g�[�h�[
	// �u���L�������������Ɓ@���S�̊č����ւ�
	//�@�ړ����u���@�g���Ȃ��Ȃ��Ă̂��B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_TODO");
	ShowMsg_("DEMO_302_MSG_120");
	KeyInputWait_();
	//===============================================
	
	SetMotion_(todo, todo_arm_folde_L, BLEND_XL);					//�ڕ�
	//===============================================
	//*�g�[�h�[
	// �u�Ȃ�Ƃ��@�����������񂶂Ⴊ�@���V���
	//�@���@�傫�Ȗ����@�������Ă���񂶂�B
	//-----------------------------------------------
	ShowMsg_("DEMO_302_MSG_130");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	Wait_(50);
	
	PlaySE_("SE_DEM_053");																// SE�u�s���b�I�v
	efc_todo = SetPointWorldEffect_("ef712_10_emo_surprise01", "efc_bikkuri000");		//�u�I�v���J�����̓s���ɂ��Blender�Őݒu
	SetEffectScale_(efc_todo, 1.4);
	
	SetMotion_(todo, todo_talk, BLEND_M);							//�{���b
	WaitMotion(todo);
	SetMotion_(todo, todo_talk_L, BLEND_XL);						//�{���bL

	//===============================================
	//*�g�[�h�[
	// �u�c�c��������I�@���񂵁@���V��̖���
	//�@��������̂Ɂ@���݂��Ă���񂩁H
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_TODO");
	ShowMsg_("DEMO_302_MSG_140");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	Wait_(10);
	DeleteTask_(task_cam);
	//��������������������������������������
	//���J�b�g10�@�g�[�h�[�A�b�v
	//��������������������������������������
	SetAlpha_(player, ALPHA_CLEAR);
	task_cam = Task_AnimeMoveCamera_("anmeye008", "anmtgt008");
	//===============================================
	//*�g�[�h�[
	// �u���@���V��́@���|�[���p�[�N�̃C�G�^�X��
	//�@�͂������@�R�����Ă����ĂȁB
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_TODO");
	ShowMsg_("DEMO_302_MSG_150");
	KeyInputWait_();
	//===============================================
	
	//===============================================
	//*�g�[�h�[
	// �u���Ⴊ�@����ȑ����́@�I��点������
	//�@�C�G�^�X�Ɂ@�`���Ă��Ă���񂩁B
	//-----------------------------------------------
	ShowMsg_("DEMO_302_MSG_160");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	SetMotion_(todo, todo_arm_folde02_L, 20);					//�ڊJ��
	Wait_(30);
	DeleteTask_(task_cam);
	SetAlpha_(player, ALPHA_EXIST);
	//��������������������������������������
	//���J�b�g11 ��u���ł��v
	//��������������������������������������
	SetVisible(ookizuti, false);	
	SetMotion_(player, player_talk_L, BLEND_N);						//��@�u���ł��v
	task_cam = Task_AnimeMoveCamera_("anmeye007", "anmtgt007");
	WaitTask(task_cam);
	SetMotion_(player, player_look_up, BLEND_XL);
	Wait_(50);
	SetVisible(ookizuti, true);
	
	//��������������������������������������
	//���J�b�g12 �S��
	//��������������������������������������
	task_cam = Task_AnimeMoveCamera_("anmeye006", "anmtgt006");
	SetMotion_(todo, todo_arm_folde_L, BLEND_XL);					//�g�[�h�[�ڕ�
	
	//===============================================
	//���g�[�h�[
	// �u�C�G�^�X���@���L���̐��b�Ɂ@�Ȃ��Ƃ�B
	//�@���񂵂��Ԃɓ���΁@�����͎��܂�͂�����I
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_TODO");
	ShowMsg_("DEMO_302_MSG_180");
	SetMotion_(todo, MOT_WAIT, BLEND_XL);						//�ʏ�ҋ@	
	KeyInputWait_();
	//===============================================

	//===============================================
	//*�g�[�h�[
	// �u���̒ʂ�@���ށI�@���|�[���p�[�N�ɍs����
	//�@�C�G�^�X�Ɂ@�R���́@���܂�����Ɠ`���Ă���I
	//-----------------------------------------------
	ShowMsg_("DEMO_302_MSG_190");
	
	SetMotion_(todo, todo_bow, BLEND_XL);						//������
//	SetMotionSpeed_(todo, 1.5);	
	WaitMotion(todo);
	SetMotion_(todo, MOT_WAIT, BLEND_XL);						//�ʏ�ҋ@
//	SetMotionSpeed_(todo, 1.0);	

	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================	
	Wait_(20);
	DeleteTask_(task_cam);
	//��������������������������������������
	//���J�b�g13�@��A�b�v
	//��������������������������������������
	SetVisible(ookizuti, false);
	SetPointPos_(player, "player002");								//��@�ړ�
	task_cam = Task_AnimeMoveCamera_("anmeye009", "anmtgt009");
	//===============================================
	//*�g�[�h�[
	// �u���Ⴊ�@���|�[���p�[�N�ւ́@�X���ɂ���
	//�@�����g���l������@���肹��Ɓ@�s����̂��B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_TODO");
	ShowMsg_("DEMO_302_MSG_200");
	KeyInputWait_();
	//===============================================
	//===============================================
	//*�g�[�h�[
	// �u����l���̖��O����@�܂���
	//�@�쐼�ɂ���@���m���X�Ɂ@���񂶂�B
	//-----------------------------------------------
	ShowMsg_("DEMO_302_MSG_210");
	KeyInputWait_();
	//===============================================	
	//===============================================
	//*�g�[�h�[
	// �u�o�[�`�����R���V�A���Ł@������i�߂�
	//�@�V���ȃ����X�^�[���C�h���@��ɓ����񂶂�I
	//-----------------------------------------------
	ShowMsg_("DEMO_302_MSG_220");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	Wait_(10);
	SetMotion_(player, player_nod2, BLEND_L);						//��@�u���傤���Ȃ��v���グ����
	Wait_(20);
	SetMotion_(player, player_look_up, BLEND_L);
	Wait_(50);
	DeleteTask_(task_cam);
	
	//��������������������������������������
	//���J�b�g14�@�g�h�A�b�v
	//��������������������������������������
	SetPointCameraEye_("cameye004");
	SetPointCameraTarget_("camtgt004");
	
	SetMotion_(todo, todo_arm_folde02_L, BLEND_XL);					//�ڊJ��
	//===============================================
	//*�g�[�h�[
	// �u���m���X�����@�艺�Ɂ@�b�͓`���Ă����B
	//�@���񂾂����@<name_player/>�B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_TODO");
	ShowMsg_("DEMO_302_MSG_230");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
//	SetMotion_(todo, todo_arm_folde02_L, BLEND_XL);					//�ڊJ��
	Wait_(30);
	EndDemo(FADE_COLOR_BLACK);
}
