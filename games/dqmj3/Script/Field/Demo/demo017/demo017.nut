//=============================================
//
//		demo017[�G�[�X����̒ʐM�E���b�N�����O_1]
//
//=============================================

function Update()
{

// ���ϐ���`
	local task_cam, task_player;
	local efc_player;

// �����\�[�X�Ǎ�
	local player = GetPlayerId_();
	local model_king = ReadNpc_("n003");			// �L���O
	local model_nochoman = ReadNpc_("n000");		// �m�`���[����
	local model_nochogirl = ReadNpc_("n004");		// �m�`���[����
	
	local model_cage = ReadGimmick_("o_H00_02");

	LoadEffect_("ef732_09_light_reactor_c");

// ���z�u
	local cage = ArrangePointGimmick_("o_H00_02", model_cage, "obj_cage000");

	SetPointPos_(player, "player000");
	SetDir_(player, 335);
	local king = ArrangePointNpc_(model_king, "npc_king000");
	SetDir_(king, -80);
	local nochoman000 = ArrangePointNpc_(model_nochoman, "npc_nocho000");
	SetDir_(nochoman000, 170);
	local nochoman100 = ArrangePointNpc_(model_nochoman, "npc_nocho100");
	SetDir_(nochoman100, 32);
	local nochogirl200 = ArrangePointNpc_(model_nochogirl, "npc_nocho200");
	local nochogirl300 = ArrangePointNpc_(model_nochogirl, "npc_nocho300");
	
// ����풓���[�V�����Ǎ�
	local Player_touch_reactor = ReadMotion_(player, "Player_touch_reactor");			// ��l����������������遨���A�N�^�[��G��
	local Player_touch_reactor_L = ReadMotion_(player, "Player_touch_reactor_L");		// ��l�����A�N�^�[��G��L
	local Player_cage_look_L = ReadMotion_(player, "Player_cage_look_L");				// ��l���������
	local n003_shock_L = ReadMotion_(king, "n003_shock_L");								// �L���O����
	local n000_shock_L_nochoman000 = ReadMotion_(nochoman000, "n000_shock_L");			// �m�`���[������
	local n000_shock_L_nochoman100 = ReadMotion_(nochoman100, "n000_shock_L");			// �m�`���[������
	local n000_shock_L_nochogirl200 = ReadMotion_(nochogirl200, "n000_shock_L");		// �m�`���[������
	local n000_shock_L_nochogirl300 = ReadMotion_(nochogirl300, "n000_shock_L");		// �m�`���[������

	SetMotion_(player, Player_cage_look_L, BLEND_N);
	SetMotion_(king, n003_shock_L, BLEND_N);
	SetMotion_(nochoman000, n000_shock_L_nochoman000, BLEND_N);
	SetMotion_(nochoman100, n000_shock_L_nochoman100, BLEND_N);
	SetMotion_(nochogirl200, n000_shock_L_nochogirl200, BLEND_N);
	SetMotion_(nochogirl300, n000_shock_L_nochogirl300, BLEND_N);

// ���J�����ݒ�
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");
	
//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------
	
	StartDemo(FADE_COLOR_BLACK);
	
	Wait_(90);
	
	DeleteTask_(task_cam);
	
	//��������������������������������������
	//���J�b�g2
	//��������������������������������������	
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");
	
	Wait_(50);
	
	efc_player = SetSelectBoneEffectSetOffset_("ef732_09_light_reactor_c", player, ATTACH_EFFECT2, Vec3(0.0, 5.5, -1.0));
	
	PlaySE_("SE_DEM_019");		// SE:���A�N�^�[������
	
	Wait_(10);
	
	task_player = Task_RotateToPos_(player, GetPos_(nochogirl300), ROTATE_DEMO_DEF);

	SetMotion_(player,Player_touch_reactor, BLEND_XL);
	WaitMotion(player);
	SetMotion_(player,Player_touch_reactor_L, BLEND_XL);
	
	Wait_(20);
	
	OpenMsgWnd_();
	OpenConnective("connective_ace");
	SetTalkName_("NAME_TAG_ACE");
	//�G�[�X�u�������邩�����X�^�[�}�X�^�[
	ShowMsg_("DEMO_017_MSG_010");
	KeyInputWait_();
	//�G�[�X�u���ꂪ�L���O�����̂��܂��Ă���J�S��
	ShowMsg_("DEMO_017_MSG_020");
	KeyInputWait_();
	//�G�[�X�u�E�B���`�̐��䑕�u��T���I
	ShowMsg_("DEMO_017_MSG_030");
	KeyInputWait_();
	CloseMsgWnd_();
	CloseConnective();
	
	//��������������������������������������
	//���f���I��
	//��������������������������������������
	
	EndDemo(FADE_COLOR_BLACK);
}