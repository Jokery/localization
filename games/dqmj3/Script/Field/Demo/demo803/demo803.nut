//=============================================
//
//		demo803[���̓X�^�[�V�[�h]
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
	local task_cam, task_player, task_aroma;
	local task_aroma_step;
	local efc_player, efc_seed;

// �����\�[�X�Ǎ�
	// �L�����N�^�[
	local player = GetPlayerId_();						// ��l��
	local model_aroma = ReadNpc_("n018");				// �A���}
	
	// �G�t�F�N�g
	LoadEffect_("ef732_25_star_seed_base01");			// �X�^�[�V�[�h�x�[�X�@�����O
	LoadEffect_("ef340_06_star_seed_case");				// �X�^�[�V�[�h�̓��ꕨ
	LoadEffect_("ef340_07_star_seed_shaton_u");			// �d�C�G�t�F�N�g�@��
	LoadEffect_("ef340_08_star_seed_shaton_d");			// �d�C�G�t�F�N�g�@��
	// �M�~�b�N
	local model_base = ReadGimmick_("o_effect_base");	// �G�t�F�N�g�x�[�X
	local model_pod = ReadGimmick_("o_U00_02");			// �E�o�|�b�h
	local model_alias = ReadGimmick_("o_U00_11");		// �G�C���A�X���u

	local model_red_door = ReadGimmick_("o_U00_05");		// ��:�Ԕ�
	local model_green_door00 = ReadGimmick_("o_U00_09");	// ��:�Δ�
	local model_green_door01 = ReadGimmick_("o_U00_10");	// ��:�Δ�
	
// ���z�u
	// ��l��
	SetPointPos_(player, "player000");

	//�A���}
	local aroma = ArrangePointNpc_(model_aroma, "npc_aroma000");
	SetStepSe_(aroma, SILENT_STEP_SE);
	
	//�M�~�b�N
	local seed = ArrangePointGimmick_("o_effect_base", model_base, "obj_seed000");						//�X�^�[�V�[�h�i�G�t�F�N�g�x�[�X�j
	SetPointPosNoFit_(seed, "obj_seed000");
	efc_seed = SetSelectBoneEffect_("ef732_25_star_seed_base01", seed, ATTACH_GLOBAL);
	SetEffectScale_(efc_seed, 0.5);
	local efc_case = SetSelectBoneEffect_("ef340_06_star_seed_case", seed, ATTACH_GLOBAL);				//�X�^�[�V�[�h�̓��ꕨ
	local efc_shaton_u = SetPointWorldEffect_("ef340_07_star_seed_shaton_u", "efc_shaton_d000");		//�d�C�@��
	local efc_shaton_d = SetPointWorldEffect_("ef340_08_star_seed_shaton_d", "efc_shaton_u000");		//�d�C�@��

	local pod00 = ArrangePointGimmick_("o_U00_02", model_pod, "obj_pod000");							//�E�o�|�b�h�R��
	local pod01 = ArrangePointGimmick_("o_U00_02", model_pod, "obj_pod001");
	local pod02 = ArrangePointGimmick_("o_U00_02", model_pod, "obj_pod002");
	
	local alias00 = ArrangePointGimmick_("o_U00_11", model_alias, "obj_alias000");						//�G�C���A�X���u�R��
	local alias01 = ArrangePointGimmick_("o_U00_11", model_alias, "obj_alias001");
	local alias02 = ArrangePointGimmick_("o_U00_11", model_alias, "obj_alias002");
	
	local red_door = ArrangePointGimmick_("o_U00_05", model_red_door, "obj_U00_05");					//��:�Ԕ�
	local green_door00 = ArrangePointGimmick_("o_U00_09", model_green_door00, "obj_U00_09");			//��:�Δ�
	local green_door01 = ArrangePointGimmick_("o_U00_10", model_green_door01, "obj_U00_10");			//��:�Δ�
	
// ����풓���[�V�����Ǎ�
	//��l��
	local player_look_up = ReadMotion_(player, "Player_look_up_L");								//������ҋ@L
	
	//�A���}
	local aro_look_right_L = ReadMotion_(aroma, "n018_look_right_L");							//�E�����ҋ@L
	local aro_look_left_L = ReadMotion_(aroma, "n018_look_left_L");								//�������ҋ@L
	local aro_look_up_L = ReadMotion_(aroma, "n018_look_up_L");									//������ҋ@L
	local aro_look_down_L = ReadMotion_(aroma, "n018_look_down_L");								//�������ҋ@L
	local aro_star_L = ReadMotion_(aroma, "n018_star_seed_L");									//�X�^�[�V�[�h�����i�b�����[�V�����̃p�^�[���ǉ��j
	local aro_stretch = ReadMotion_(aroma, "n018_stretch");										//�X�g���b�`
	
// ���������[�V����
	SetMotion_(player, player_look_up, BLEND_N); 
	SetMotion_(aroma, MOT_WALK, BLEND_N); 
	
// ���J�����ݒ�
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");

//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------
	task_aroma = Task_MoveForward_(aroma, 1.0, false);
	task_aroma_step = Task_PlaySe_("SE_FLD_021", 15);
	
	StartDemo(FADE_COLOR_BLACK);
	//��������������������������������������
	//���J�b�g1 �A���}�Ǝ�
	//��������������������������������������
	
	Wait_(35);
	SetMotion_(aroma, MOT_WAIT, BLEND_L); 
	DeleteTask_(task_aroma);
	DeleteTask_(task_aroma_step);
	Wait_(50);
	//��������������������������������������
	//���J�b�g2 �X�^�[�V�[�h��3�̔�
	//��������������������������������������
	SetMotion_(player, MOT_WAIT, BLEND_N); 
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");
	SetPointPos_(aroma, "npc_aroma001");

	WaitTask(task_cam);
	Wait_(15);
	
	//��������������������������������������
	//���J�b�g3 �X�^�[�V�[�h�@�Y�[���C��
	//��������������������������������������
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");
	WaitTask(task_cam);
	//===============================================
	// *�A���}
	// �u���̋@�B�̖��O�́@�X�^�[�V�[�h�B
	//�@���i�[�e�������o���@���ߎ�ƂȂ���̂�B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_AROMA");
	ShowMsg_("DEMO_803_MSG_010");
	KeyInputWait_();
	//===============================================
	
	//===============================================
	// *�A���}
	// �u�X�^�[�V�[�h�́@�����ǂ��萯�̎�B
	//�@�f���n���@�փ}�U�[�́@�j�ƂȂ鑶�݂Ȃ́B
	//-----------------------------------------------
	ShowMsg_("DEMO_803_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	Wait_(40);
	
	//��������������������������������������
	//���J�b�g4 �A���}�A�b�v
	//��������������������������������������
	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");

	Wait_(30);
	SetMotion_(aroma, aro_look_left_L, BLEND_XL);
	task_aroma = Task_RotateToPos_(aroma, GetPos_(player), 2);
	Wait_(15);
	DeleteTask_(task_aroma);
	Wait_(20);
	//===============================================
	// *�A���}
	// �u���@���i�[�e�͉�ꂽ�}�U�[�̋@�\��
	//�@�₤���߂Ɂ@�R�A�̒��Ɂ@�c���Ă����B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_AROMA");
	ShowMsg_("DEMO_803_MSG_030");
	KeyInputWait_();
	//===============================================
	
	//===============================================
	// *�A���}
	// �u�ł��@���̃X�^�[�V�[�h���g���ā@�}�U�[��
	//�@�C������΁@�ޏ������R�ɂł���͂���B
	//-----------------------------------------------
	ShowMsg_("DEMO_803_MSG_040");
	KeyInputWait_();
	//===============================================
	
	SetMotion_(aroma, MOT_WAIT, BLEND_XL);
	task_aroma = Task_RotateToPos_(aroma, GetPos_(seed), 2);
	Wait_(15);
	DeleteTask_(task_aroma);
	
	//===============================================
	// *�A���}
	// �u�����c�c���̃X�^�[�V�[�h���ā@�������łˁB
	//�@�X�^�[�s�[�X���Ă������i���@�g�ݍ��܂Ȃ��ƁB
	//-----------------------------------------------
	ShowMsg_("DEMO_803_MSG_050");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	Wait_(10);	
	
	//��������������������������������������
	//���J�b�g5 �X�^�[�V�[�h�Y�[���A�E�g
	//��������������������������������������
	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");

	WaitTask(task_cam);
	//===============================================
	// *�A���}
	// �u�X�^�[�s�[�X�́@�S���Ł@�R�B
	//�@���̐�́@����̗􂯖ڂ̒��ɂ����B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_AROMA");
	ShowMsg_("DEMO_803_MSG_060");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	Wait_(30);	
	SetDirToObject_(player, aroma);
	SetDirToObject_(aroma, player);

	//��������������������������������������
	//���J�b�g6 �A���}����
	//��������������������������������������
	task_cam = Task_AnimeMoveCamera_("anmeye003", "anmtgt003");

	MotionTalk(aroma);

	//===============================================
	// *�A���}
	// �u�ł��@�������ɓ����ɂ́@�Y���_�ƌĂ΂��
	//�@�_���܂Ɂ@�`�J����F�߂Ă��炤�K�v������́B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_AROMA");
	ShowMsg_("DEMO_803_MSG_070");
	KeyInputWait_();
	//===============================================
	
	//===============================================
	// *�A���}
	// �u�A���^�́@�m��Ȃ��Ǝv�����ǁc�c
	//�@�Y���_�̋����́@�z����₷���B
	//-----------------------------------------------
	ShowMsg_("DEMO_803_MSG_080");
	SetFace_(aroma, "Face_loop_close");
	SetMotion_(aroma, aro_look_down_L, BLEND_XL);
	KeyInputWait_();
	//===============================================
	
	//===============================================
	// *�A���}
	// �u�A���Z�X������@�����X�^�[�}�X�^�[�R�c��
	//�@���ɂȂ��ā@�悤�₭���Ă����肾���́B
	//-----------------------------------------------
	ShowMsg_("DEMO_803_MSG_090");
	SetFace_(aroma, "Face_default");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	SetMotion_(aroma, MOT_WAIT, BLEND_XL);
	
	WaitTask(task_cam);
	Wait_(20);	
	//��������������������������������������
	//���J�b�g7 �A���}�@�Y�[���A�b�v
	//��������������������������������������
	SetVisible(player, false);
	task_cam = Task_AnimeMoveCamera_("anmeye004", "anmtgt004");
	Wait_(20);		
	SetMotion_(aroma, aro_star_L, BLEND_XL);
	SetFace_(aroma, "Face_smile");
	Wait_(20);	
	//===============================================
	// *�A���}
	// �u�ӂӁ`��B���̘b�@�����ăr�r����������H
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_AROMA");
	ShowMsg_("DEMO_803_MSG_100");
	KeyInputWait_();
	//===============================================
	
	//===============================================
	// *�A���}
	// �u���S�Ȃ����I�@���̃A���}�l�̌����ʂ�ɂ����
	//�@�A���^�ЂƂ�Ł@�Y���_�ɏ��Ă�悤�ɂȂ��I
	//-----------------------------------------------
	ShowMsg_("DEMO_803_MSG_110");
	KeyInputWait_();
	//===============================================
	
	//===============================================
	// *�A���}
	// �u�܂��́@�Z���^�[�r���̒n���Ɂ@�s���̂�I
	//�@�����Ł@���񂲂����̂������Ă������I
	//-----------------------------------------------
	ShowMsg_("DEMO_803_MSG_120");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	WaitTask(task_cam);	
	
	EndDemo(FADE_COLOR_BLACK);
}
