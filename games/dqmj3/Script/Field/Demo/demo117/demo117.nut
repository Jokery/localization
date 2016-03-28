//=============================================
//
//		demo117[������n_1(����)]
//
//=============================================
function Update()
{
	//=====================================
	//���[�J���ϐ��̐ݒ�
	//=====================================
	local task_cam;
	
	//=====================================
	//�v���C���[�ݒu
	//=====================================
	
	//ID�̎擾
	local player = GetPlayerId_();
	
	//�ݒu
	SetPointPos_(player, "player000");
	
	//�����̌���
	SetDir_(player, -70);
	
	//�����̃��[�V����
	SetMotion_(player, MOT_WAIT, 15);
	
	//���l�̎蓮�ݒ�
	SetManualCalcAlpha_(player, true);
	
	//�����̃��l
	SetAlpha_(player, 1.0);
	
	//=====================================
	//NPC�ݒu
	//=====================================
	
	//���\�[�X�̓ǂݍ���
	local npc_ace = ReadNpc_("n002");		// �G�[�X
	
	//�ݒu
	local res_ace = ArrangePointNpc_(npc_ace, "npc_ace000");
	
	//�����̌���
	SetDir_(res_ace, -90);
	
	//���l�̎蓮�ݒ�
	SetManualCalcAlpha_(res_ace, true);
	
	//�����̃��l
	SetAlpha_(res_ace, 1.0);
	
	LoadEffect_("ef712_13_emo_sweat01")		;								// ���G�t�F�N�g�ǂݍ���
	
	//=====================================
	//���[�V�����̓ǂݍ���
	//=====================================
	local pl_caution01_L = ReadMotion_(player, "Player_caution01_L");		// ��l���@�x��L
	local ac_impatience_L = ReadMotion_(res_ace, "n002_impatience_L");		// �G�[�X�@�ł�L
	
	//�����̃��[�V����
	SetMotion_(res_ace, ac_impatience_L, BLEND_M);
	
	//=====================================
	//�M�~�b�N�ݒu
	//=====================================
	local model_red_screen = ReadGimmick_("o_A03_05");
	local red_screen = ArrangePointGimmick_("o_A03_05", model_red_screen, "obj_screen000");
	SetMotion_(red_screen, MOT_GIMMICK_0, BLEND_N);							// �_��ON
		
	//�Ǘ������j�^�[
	local model_monitor = ReadGimmick_("o_A03_04");
	local monitor = ArrangePointGimmick_("o_A03_04", model_monitor, "obj_monitor000");
	SetMotion_(monitor, MOT_GIMMICK_0, BLEND_N);
	
	//�f�B�X�v���C
	local model_monitor = ReadGimmick_("o_A03_09");
	local monitor = ArrangePointGimmick_("o_A03_09", model_monitor, "obj_monitor001");
	SetMotion_(monitor, MOT_GIMMICK_0, BLEND_N);
	
	//��������������������������������������
	//���J�b�g1
	//��������������������������������������
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");
	
	//=====================================
	//�t�F�[�h�C��
	//=====================================
	StartDemo(FADE_COLOR_BLACK);
	
	//�G�[�X�ł�
	SetMotion_(player, pl_caution01_L, BLEND_M);
	SetMotion_(res_ace, ac_impatience_L, BLEND_M);
	local effectId = SetSelectBoneEffect_("ef712_13_emo_sweat01", res_ace, ATTACH_EFFECT2);		// ���G�t�F�N�g

	PlayLoopSE_("SE_DEM_013");
	StartEarthQuake_(-1, 3, 1);
	Wait_(6);
	StopEarthQuake_();	
	StartEarthQuake_(-1, 3, 0.8);
	Wait_(15);
	StopEarthQuake_();	
	StartEarthQuake_(-1, 3, 0.4);

	//=====================================
	//�G�[�X�u�������@�����o�������I
	//=====================================
	OpenMsgWnd_();
	
	SetTalkName_("NAME_TAG_ACE");
	ShowMsg_("DEMO_117_MSG_010");
	KeyInputWait_();
	
	CloseMsgWnd_();
	
	StopEarthQuake_();
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");	
	
	Wait_(120);
	
	//��������������������������������������
	//���f���I��
	//��������������������������������������
	StopLoopSE_(30);
	EndDemo(FADE_COLOR_BLACK);
}