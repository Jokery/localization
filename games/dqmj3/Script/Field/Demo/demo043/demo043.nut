//=============================================
//
//		demo043[�ӂ����ȐΔ�]
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
	local efc_player;
	local task_cam, task_player;

// �����f���Ǎ�
	// �M�~�b�N
	local model_stele = ReadGimmick_("o_com_07");	// ���Z�Δ�
	// �L�����N�^�[
	local player = GetPlayerId_();					// ��l��
	// �G�t�F�N�g
	LoadEffect_("ef712_10_emo_surprise01");			// �u�I�v
	LoadEffect_("ef732_09_light_reactor_c");		// ���A�N�^�[�̌�
	
// ���z�u
	// ���Z�Δ�
	local stele = ArrangePointGimmick_("o_com_07", model_stele, "obj_stele000");
	SetMotion_(stele, MOT_GIMMICK_0, BLEND_N);
	
	// ��l��
	SetPointPos_(player, "player000");
	SetFace_(player, "Face_eyes_close");

// ����풓���[�V�����Ǎ�
	// ��l��
	local reactor = ReadMotion_(player, "Player_touch_reactor");		// ��������������遨���A�N�^�[��G��
	local reactor_L = ReadMotion_(player, "Player_touch_reactor_L");	// ���A�N�^�[��G��L

// ���J�����ݒ�
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");

// ���������[�V�����ݒ�
	SetMotion_(player, MOT_WALK, BLEND_N);
	task_player = Task_MoveForward_(player, 1.0, false);

//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);
	
	// ���J�b�g�P����������Ă���`�`�`�`�`�`�`�`�`�`�`�`�`�`�`
	Wait_(15);
	
	efc_player = SetBoneEffect_("ef732_09_light_reactor_c", player);
	PlaySE_("SE_FLD_135");		// ���A�N�^�[������
	Wait_(15);
	
	SetMotion_(player, MOT_WAIT, BLEND_M);
	DeleteTask_(task_player);
	
	SurpriseDisp(player);
	Wait_(5);
	SetMotion_(player, reactor, BLEND_M);
	WaitMotion(player);
	SetMotion_(player, reactor_L, BLEND_M);
	Wait_(30);
	
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 10);
	WaitFade_();
	SetFade_(FADE_IN, FADE_COLOR_BLACK, 10);
	
	// ���J�b�g�Q���Δ�Y�[���C���`�`�`�`�`�`�`�`�`�`�`�`�`�`�`
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");		// 90F
	WaitTask(task_cam);
	
	EndDemo(FADE_COLOR_BLACK);
}
