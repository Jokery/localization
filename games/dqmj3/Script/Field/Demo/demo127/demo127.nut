//=============================================
//
//		demo127[�J�[�h�L�[B��T��]
//
//=============================================
function Update()
{
// ���ϐ���`
	local task_cam, task_player, task_ace;
	
// ���t���O�ݒ�
	local bit_ruler = GetEventFlg_("BFG_RULER_ADD_006");				// Bit_206  ���[���ǉ��t���O �Z���^�[�r���@��w
	
// �����\�[�X�Ǎ�
	local player = GetPlayerId_();
	local model_ace = ReadNpc_("n002");									// �G�[�X
	
	local model_door = ReadGimmick_("o_A03_00");						// �d�q�h�A
	local model_ruler = ReadGimmick_("o_com_08");						// ���[���|�C���g
	
// ���z�u
	SetPointPos_(player, "player000");
	local ace = ArrangePointNpc_(model_ace, "npc_ace000");

	local door = ArrangePointGimmick_("o_A03_00", model_door, "obj_door000");	// �d�q�h�A
	local rura = ArrangePointGimmick_("o_com_08", model_ruler, "obj_rura000");	// ���[��
	if (bit_ruler) { SetMotion_(rura, MOT_GIMMICK_2, BLEND_N); }				// �����[���|�C���g�����ɋN�����Ă����ꍇ
	
// ����풓���[�V�����Ǎ�
	local ace_look_up_L = ReadMotion_(ace, "n002_look_up_L");		// �G�[�X��������
	local ace_feel_down = ReadMotion_(ace, "n000_feel_down");		// �G�[�X�ʏ��b����������
	local ace_feel_down_L = ReadMotion_(ace, "n000_feel_down_L");	// �G�[�X��������L
	
// �������̃��[�V����
	SetMotion_(player, MOT_WAIT, BLEND_N);
	SetMotion_(ace, ace_look_up_L, BLEND_N);
	
	SetManualCalcAlpha_(player, true);
	SetAlpha_(player, 1.0);

	SetManualCalcAlpha_(ace, true);
	SetAlpha_(ace, 1.0);
	
// ���J�����ݒ�
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");

//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------
	
	StartDemo(FADE_COLOR_BLACK);

	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ACE");
	ShowMsg_("DEMO_127_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	
	//��������������������������������������
	//���J�b�g2
	//��������������������������������������
	DeleteTask_(task_cam);
	SetDir_(player, 0);

	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");
	
	SetMotion_(player, MOT_WALK, BLEND_M);
	SetMotion_(ace, MOT_WALK, BLEND_M);
	
	task_player = Task_RotateToPos_(player, GetPos_(ace), ROTATE_DEMO_DEF);
	task_ace = Task_RotateToPos_(ace, GetPos_(player), 17.2);
	
	WaitTask(task_player);
	SetMotion_(player, MOT_WAIT, BLEND_M);
	
	WaitTask(task_ace);
	SetMotion_(ace, MOT_WAIT, BLEND_M);
	
	SetMotion_(ace, ace_feel_down, BLEND_M);
	WaitMotion(ace);
	SetMotion_(ace, ace_feel_down_L, BLEND_M);
	
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ACE");
	ShowMsg_("DEMO_127_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	
	EndDemo(FADE_COLOR_BLACK);
}