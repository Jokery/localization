//=============================================
//
//		demo801[���L���Ƃ̍ĉ�]
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
	local task_player_step;
	local efc_player, efc_catastrophe000;

// �����\�[�X�Ǎ�
	// �L�����N�^�[
	local player = GetPlayerId_();					// ��l��
	local id_rukiya = ReadNpc_("n009");
	local id_ruki = ReadNpc_("n035");
	LoadEffect_("ef712_10_emo_surprise01");
	local pos = Vec3(0, 1.3, 0);
	LoadEffect_("ef732_18_r_holography01");											// ���L���p�풓�G�t�F�N�g
	LoadEffect_("ef732_15_holography01");											// �z���O�����\���@�o��

// ���z�u
	local rukiya = ArrangePointNpc_(id_rukiya, "rukiya");
	local ruki = ArrangePointNpc_(id_ruki, "rukiya");
	SetVisible(rukiya,false);
	SetVisible(ruki,false);

// ����풓���[�V�����Ǎ�
	local r_sita = ReadMotion_(rukiya, "n009_look_down_L");
	local r_sitaa = ReadMotion_(ruki, "n009_look_down_L");
	
	local p_sup = ReadMotion_(player, "Player_surprise");
	local p_supL = ReadMotion_(player, "Player_surprise_L");
	local p_nod = ReadMotion_(player, "Player_nod");
	local p_look_walk_L = ReadMotion_(player, "Player_look_walk_L");

// ���������[�V�����ݒ�
	SetMotion_(player, p_look_walk_L, BLEND_N);
	task_player = Task_AnimeMove_(player, "player");
	task_player_step = Task_ChangeStepSe(player, "SE_FLD_015", 18);

// ���J�����ݒ�
	task_cam = Task_AnimeMoveCamera_("006_eye", "006_tgt");

//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);
	Wait_(75);
	
	SetMotion_(player, MOT_WAIT, BLEND_M);
	DeleteTaskStepSe(player, task_player_step);
	Wait_(20);
	
	SetStepSe_(player, SILENT_STEP_SE);
	SetMotion_(player, p_sup, BLEND_M);
	efc_player = SurpriseDispSetOffset(player, pos, 0.55);
	WaitMotion(player);
	
	SetMotion_(player, p_supL, BLEND_M);
	Wait_(30);
	
	ResetStepSe_(player);
	SetMotion_(player, MOT_RUN, BLEND_M);
	WaitTask(task_player);
	
	Wait_(30);
	DeleteTask_(task_cam);
	
	task_player = Task_AnimeMove_(player, "player_1");
	task_cam = Task_AnimeMoveCamera_("001_eye", "001_tgt");
	
	SetMotion_(player, MOT_WAIT, BLEND_N);
	Wait_(80);
	
	SetVisible(rukiya,true);
	SetVisible(ruki,true);
	SetAlphaFade(ruki, 0, 1);
	WaitTask(task_cam);
	Wait_(40);
	
	task_cam = Task_AnimeMoveCamera_("002_eye", "002_tgt");
	WaitTask(task_cam);
	
	SetMotion_(rukiya, MOT_TALK, 4);
	task_rukiya = Task_ChangeMotion_(rukiya, MOT_TALKLOOP, 1);
	
	//===============================================
	// �����L��
	// �u�Ȃ񂾂��Ȃ񂾂��@�H��ł������悤�Ȋ炵�āB
	// �@�������́@�����Ɩ{���c�c�{���̃��L�����B�v
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RUKIYA");
	ShowMsg_("DEMO_801_MSG_010");
	KeyInputWait_();
	//-----------------------------------------------
	
	//-----------------------------------------------
	// �u�������@���g�ł͂Ȃ����ˁB
	//-----------------------------------------------
	ShowMsg_("DEMO_801_MSG_020");
	KeyInputWait_();
	//-----------------------------------------------
	
	//-----------------------------------------------
	// �u���傢�Ɓ@��������ĂˁB�������̐g�̂�
	// �@���񂽂Ɠ����@�G�C���A�X�Ȃ̂��B
	//-----------------------------------------------
	ShowMsg_("DEMO_801_MSG_030");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	DeleteTask_(task_cam);
	
	task_cam = Task_AnimeMoveCamera_("003_eye", "003_tgt");
	SetPointPos_(player, "player_3");
	
	//===============================================
	// �����L��
	// �u�܂��@���񂽂����@�����̋@�B���g���Ă邩��
	// �@��������܂Ł@���Ԃ��@���������܂������ǁB
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RUKIYA");
	ShowMsg_("DEMO_801_MSG_040");
	KeyInputWait_();
	//-----------------------------------------------
	
	SetMotion_(rukiya, r_sita, 16);
	SetMotion_(ruki, r_sitaa, 16);
	//-----------------------------------------------
	// �u�������Ł@�Ō�̐킢���@��`���Ȃ������B
	// �@���̂��Ƃ́@���܂Ȃ������Ǝv���Ă��B
	//-----------------------------------------------
	ShowMsg_("DEMO_801_MSG_050");
	KeyInputWait_();
	//-----------------------------------------------
	
	//-----------------------------------------------
	// �u���̎q�c�c���i�[�e�ɂ��@�d���g�����ۂ�
	// �@�������ЂƂ�@�R�A�Ɏc���Ă��Ă��܂����B
	//-----------------------------------------------
	ShowMsg_("DEMO_801_MSG_060");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	DeleteTask_(task_cam);
	
	SetPointCameraEye_("004_eye");
	SetPointCameraTarget_("004_tgt");
	
	SetMotion_(rukiya, MOT_TALK, 8);
	SetMotion_(ruki, MOT_TALK, 8);
	task_rukiya = Task_ChangeMotion_(rukiya, MOT_TALKLOOP, 1);
	
	//===============================================
	// �����L��
	// �u�ł��ˁ@������߂�̂�
	// �@�܂�������@����l���̖��O���I�I
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RUKIYA");
	ShowMsg_("DEMO_801_MSG_070");
	KeyInputWait_();
	//-----------------------------------------------
	
	//-----------------------------------------------
	// �u�������������@�`�J�������킹��΁@���̎q��
	// �@����������@���������Ă�������񂾁I
	//-----------------------------------------------
	ShowMsg_("DEMO_801_MSG_080");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetMotion_(rukiya, MOT_WAIT, 4);
	SetMotion_(ruki, MOT_WAIT, 4);
	
	DeleteTask_(task_cam);
	task_cam = Task_AnimeMoveCamera_("p_eye", "p_tgt");
	WaitTask(task_cam);
	SetMotion_(player, p_nod, 16);
	WaitMotion(player);
	SetMotion_(player, MOT_WAIT, 8);
	Wait_(30);	
	
	SetPointCameraEye_("005_eye");
	SetPointCameraTarget_("005_tgt");
	
	Wait_(15);
	PlaySE_("SE_DEM_068");
	local efc = SetBoneEffect_("ef732_15_holography01", ruki);
	SetAlphaFade(ruki, 1, 1);
	SetAlpha_(rukiya, ALPHA_CLEAR);
	Wait_(3);
	SetAlphaFade(ruki, 0, 1);
	SetAlpha_(rukiya, ALPHA_EXIST);
	
	SetMotion_(player, p_sup, 8);
	task_player = Task_ChangeMotion_(player, p_supL, 1);
	efc_player = SurpriseDispSetOffset(player, pos, 0.65);
	
	Wait_(4);
	SetAlphaFade(ruki, 1, 1);
	SetAlpha_(rukiya, ALPHA_CLEAR);
	PlaySE_("SE_DEM_068");
	local efc = SetBoneEffect_("ef732_15_holography01", ruki);
	Wait_(3);
	SetAlphaFade(ruki, 0, 1);
	SetAlpha_(rukiya, ALPHA_EXIST);
	Wait_(8);
	SetAlphaFade(ruki, 1, 1);
	SetAlpha_(rukiya, ALPHA_CLEAR);
	PlaySE_("SE_DEM_068");
	local efc = SetBoneEffect_("ef732_15_holography01", ruki);
	Wait_(3);
	SetAlphaFade(ruki, 0, 1);
	SetAlpha_(rukiya, ALPHA_EXIST);
	
	
	Wait_(4);
	SetAlphaFade(ruki, 1, 1);
	SetAlpha_(rukiya, ALPHA_CLEAR);
	PlaySE_("SE_DEM_068");
	local efc = SetBoneEffect_("ef732_15_holography01", ruki);
	Wait_(3);
	SetAlphaFade(ruki, 0, 1);
	SetAlpha_(rukiya, ALPHA_EXIST);
	Wait_(15);
	SetAlphaFade(ruki, 1, 1);
	SetAlpha_(rukiya, ALPHA_CLEAR);
	PlaySE_("SE_DEM_068");
	local efc = SetBoneEffect_("ef732_15_holography01", ruki);
	Wait_(3);
	SetAlphaFade(ruki, 0, 1);
	SetAlpha_(rukiya, ALPHA_EXIST);
	Wait_(4);
	SetAlphaFade(ruki, 1, 1);
	SetAlpha_(rukiya, ALPHA_CLEAR);
	PlaySE_("SE_DEM_068");
	local efc = SetBoneEffect_("ef732_15_holography01", ruki);
	Wait_(30);
	local efcy2 = SetBoneEffect_("ef732_18_r_holography01", ruki);
	SetMotion_(rukiya, MOT_TALK, 8);
	local task_rukiya = Task_ChangeMotion_(rukiya, MOT_TALKLOOP, 1);
	SetMotion_(ruki, MOT_TALK, 8);
	local task_ruki = Task_ChangeMotion_(ruki, MOT_TALKLOOP, 1);
	
	//===============================================
	// �����L��
	// �u�����c�c����ς苌���́@�����Ȃ��˂��B
	// �@�ǂ����@���̃G�C���A�X�͌��E�݂������B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RUKIYA");
	ShowMsg_("DEMO_801_MSG_090");
	KeyInputWait_();
	//-----------------------------------------------
	
	//-----------------------------------------------
	// �u�ǂ����@���i�[�e���@�����o���O��
	// �@���������g���@�Ȃ�Ƃ����Ȃ��ƃ_����������B
	//-----------------------------------------------
	ShowMsg_("DEMO_801_MSG_100");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	SetMotion_(rukiya, MOT_WAIT, 8);
	SetMotion_(ruki, MOT_WAIT, 8);
	
	DeleteEffectEmitter_(efcy2);
	SetAlphaFade(ruki, 0, 1);
	SetAlpha_(rukiya, ALPHA_EXIST);
	Wait_(3);
	SetAlphaFade(ruki, 1, 1);
	SetAlpha_(rukiya, ALPHA_CLEAR);
	PlaySE_("SE_DEM_068");
	local efc = SetBoneEffect_("ef732_15_holography01", ruki);
	Wait_(4);
	SetAlphaFade(ruki, 0, 1);
	SetAlpha_(rukiya, ALPHA_EXIST);
	Wait_(8);
	SetAlphaFade(ruki, 1, 1);
	SetAlpha_(rukiya, ALPHA_CLEAR);
	PlaySE_("SE_DEM_068");
	local efc = SetBoneEffect_("ef732_15_holography01", ruki);
	Wait_(3);
	SetAlphaFade(ruki, 0, 1);
	SetAlpha_(rukiya, ALPHA_EXIST);
	Wait_(30);
	
	SetPointCameraEye_("004_eye");
	SetPointCameraTarget_("004_tgt");
	
	SetMotion_(rukiya, MOT_TALK, 8);
	task_rukiya = Task_ChangeMotion_(rukiya, MOT_TALKLOOP, 1);
	
	//===============================================
	// �����L��
	// �u����l���̖��O���@���������@�R�A�̐�ɂ���
	// �@�|�C���g�[���ւƁ@�A��Ă����Ă���Ȃ������H
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RUKIYA");
	ShowMsg_("DEMO_801_MSG_110");
	KeyInputWait_();
	//-----------------------------------------------
	
	//-----------------------------------------------
	// �u��󃉃C�h���g��Ȃ��Ɓ@�|�C���g�[���ւ�
	// �@�s���Ȃ���ł˂��c�c���񂾂�B
	//-----------------------------------------------
	ShowMsg_("DEMO_801_MSG_120");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetMotion_(rukiya, MOT_WAIT, 8);
	Wait_(15);
	
	EndDemo(FADE_COLOR_BLACK);
}
