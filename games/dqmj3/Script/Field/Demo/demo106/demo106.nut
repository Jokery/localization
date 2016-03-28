//=============================================
//
//		demo106[�d���̕���_2(�s�s�S�i)]
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
	local task_cam;
	
// �����f���ǂݍ���
	local npc_ace = ReadNpc_("n002");		// �G�[�X
	local npc_king = ReadNpc_("n003");		// �L���O
	local npc_jack = ReadNpc_("n001");		// �W���b�N
	local npc_queen = ReadNpc_("n005");		// �N�C�[��
	local npc_nocho = ReadNpc_("n000");		// �m�`���[��
	
// ���M�~�b�N�ݒu	
	local window = ReadGimmick_("o_dem_05");									// �Z���^�[�r���̑��M�~�b�N
	local model_shelter = ReadGimmick_("o_A00_03");	//�V�F���^�[
	local model_door = ReadGimmick_("o_A00_01");	//��
	local model_throne = ReadGimmick_("o_com_05");								// �ʍ�
	local model_centar = ReadGimmick_("o_A00_04");								// �Z���^�[�r��(�_��)
	
	local res_tele = ArrangePointGimmick_("o_dem_05", window, "obj_light000");		// �Z���^�[�r���̑��M�~�b�N
	local shelter000 = ArrangePointGimmick_("o_A00_03", model_shelter, "obj_shelter000");
	local shelter001 = ArrangePointGimmick_("o_A00_03", model_shelter, "obj_shelter001");
	local shelter002 = ArrangePointGimmick_("o_A00_03", model_shelter, "obj_shelter002");
	local door000 = ArrangePointGimmick_("o_A00_01", model_door, "obj_door000");
	local door001 = ArrangePointGimmick_("o_A00_01", model_door, "obj_door001");
	local throne = ArrangePointGimmick_("o_com_05", model_throne, "obj_throne000");	// ����
	local centar = ArrangePointGimmick_("o_A00_04", model_centar, "obj_light000");	// �Z���^�[�r��(�_��)
	SetActive_(centar, false);
	
// ���ݒu
	local res_ace = ArrangePointNpc_(npc_ace, "npc_ace000");
	local res_king = ArrangePointNpc_(npc_king, "npc_king000");
	local res_jack = ArrangePointNpc_(npc_jack, "npc_jack000");
	local res_queen = ArrangePointNpc_(npc_queen, "npc_queen000");
	local res_nocho = ArrangePointNpc_(npc_nocho, "npc_nocho000");
	local res_nocho2 = ArrangePointNpc_(npc_nocho, "npc_nocho001");
	local res_nocho3 = ArrangePointNpc_(npc_nocho, "npc_nocho002");
	local res_nocho4 = ArrangePointNpc_(npc_nocho, "npc_nocho003");
	
	//�����̌���
	SetDir_(res_ace, 200);
	SetDir_(res_king, 160);
	SetDir_(res_jack, 190);
	SetDir_(res_queen, 180);
	SetDir_(res_nocho, 180);
	SetDir_(res_nocho2, 180);
	SetDir_(res_nocho3, 180);
	SetDir_(res_nocho4, 180);
	
// �����[�V�����̓ǂݍ���
	local joyL_mob1 = ReadMotion_(res_nocho, "n000_rejoice_L");		//�m�`���[���P���
	local joyL_mob2 = ReadMotion_(res_nocho2, "n000_rejoice_L");	//�m�`���[���Q���
	local joyL_mob3 = ReadMotion_(res_nocho3, "n000_rejoice_L");	//�m�`���[���R���
	local joyL_mob4 = ReadMotion_(res_nocho4, "n000_rejoice_L");	//�m�`���[���S���
	local joyL_king = ReadMotion_(res_king, "n003_rejoice_L");		//�L���O���
	local joyL_jack = ReadMotion_(res_jack, "n001_rejoice_L");		//�W���b�N���
	local joyL_ace = ReadMotion_(res_ace, "n002_talk_joy_L");		//�G�[�X�P���
	local stick_king = ReadMotion_(res_king, "n003_stick_up");		//�L���O�ҋ@����f��
	local stickL_king = ReadMotion_(res_king, "n003_stick_up_L");	//�L���O��f��
	
// ���J�����ݒ�
	// ���J�����P�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");
	SetTime_(15120);		// �[���O
// ���G�t�F�N�g�̓ǂݍ���
	LoadEffect_("ef712_04_emo_joy01");
	LoadEffect_("ef712_10_emo_surprise01");
	LoadEffect_("ef810_03_power_on");
	
	local pwr_on = SetPointWorldEffect_("ef810_03_power_on", "obj_light000");
	
	SetMotion_(res_tele, MOT_GIMMICK_1, 1);	

//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------
//	StartDemo(FADE_COLOR_BLACK);
	SetFade_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
	Wait_(28);
	PlaySE_("SE_DEM_040");
	Wait_(2);
	Wait_(250);
	
	WaitTask(task_cam);
	Wait_(30);
	DeleteTask_(task_cam);

	// �t�F�[�h�C��
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 30);
	WaitFade_();
	DeleteEffect_(pwr_on);
	SetActive_(centar, true);
	SetActive_(res_tele, false);
	SetMotion_(centar, MOT_GIMMICK_1, BLEND_N);
	Wait_(25);
	//�J�b�g�Q
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");
	Wait_(35);
	// �t�F�[�h�C��
	SetFade_(FADE_IN, FADE_COLOR_BLACK, 30);
	WaitFade_();
	
	Wait_(10);
	SetMotion_(shelter000, MOT_GIMMICK_1, 0);
	PlaySE_("SE_DEM_038");
	
	local sup_king = SetSelectBoneEffect_("ef712_10_emo_surprise01", res_king, ATTACH_EFFECT2);
	local sup_ace = SetSelectBoneEffect_("ef712_10_emo_surprise01", res_ace, ATTACH_EFFECT2);
	Wait_(10);
	local sup_jack = SetSelectBoneEffect_("ef712_10_emo_surprise01", res_jack, ATTACH_EFFECT2);
	local sup_queen = SetSelectBoneEffect_("ef712_10_emo_surprise01", res_queen, ATTACH_EFFECT2);
	local sup_moti1 = SetSelectBoneEffect_("ef712_10_emo_surprise01", res_nocho, ATTACH_EFFECT2);
	Wait_(3);
	local sup_moti2 = SetSelectBoneEffect_("ef712_10_emo_surprise01", res_nocho2, ATTACH_EFFECT2);
	local sup_moti3 = SetSelectBoneEffect_("ef712_10_emo_surprise01", res_nocho3, ATTACH_EFFECT2);
	local sup_moti4 = SetSelectBoneEffect_("ef712_10_emo_surprise01", res_nocho4, ATTACH_EFFECT2);
	
	Wait_(10);
	SetMotion_(res_ace, joyL_ace, BLEND_L);
	Wait_(10);
	SetMotion_(res_king, stick_king, BLEND_M);
	Wait_(20);
	SetMotion_(res_king, stickL_king, BLEND_M);
	StartEarthQuake_(4, 4, 2);
	Wait_(4);
	StartEarthQuake_(3, 3, 2);
	Wait_(3);
	StartEarthQuake_(15, 3, 1);
	Wait_(3);
	SetMotion_(res_jack, joyL_jack, BLEND_L);
	Wait_(3);
	SetMotion_(res_nocho, joyL_mob1, BLEND_L);
	Wait_(4);
	SetMotion_(res_nocho2, joyL_mob2, BLEND_L);
	SetMotion_(res_nocho3, joyL_mob3, BLEND_L);
	Wait_(5);
	SetMotion_(res_nocho4, joyL_mob4, BLEND_L);
	
	Wait_(120);
	
	EndDemo(FADE_COLOR_BLACK);
}
