//=============================================
//
//		demo111[�K�[�h�}�X�^�[�N��]
//
//=============================================
function Update()
{
	//=====================================
	//���[�J���ϐ��̐ݒ�
	//=====================================
	local ef811_0, efc_light_monoeye;
	
	//=====================================
	//NPC�ݒu
	//=====================================
	
	//���\�[�X�̓ǂݍ���
	local npc_gur = ReadNpc_("m121_00");		//�K�[�h�}�X�^�[	���K�[�h�}�X�^�[�̃��f�����������Ȃ̂ŃL���[�}�V���Q�ő�p���Ă��܂��B
	local model_monitor00 = ReadGimmick_("o_A03_04");										//���j�^�[
	
	//�ݒu
	local res_gur = ArrangePointNpc_(npc_gur, "npc_guard000");
	local monitor00 = ArrangePointGimmick_("o_A03_04", model_monitor00, "obj_monitor00");	//���j�^�[
	local model_red_screen = ReadGimmick_("o_A03_06");										//�_�ł���ԃ��j�^�[(��)
	local red_screen = ArrangeGimmick_("o_A03_06", model_red_screen, false);
	SetMotion_(red_screen, MOT_GIMMICK_0, BLEND_N);											// �_��ON

	//�����̌���
	SetDir_(res_gur, 180);
	
	//�T�C�Y�ݒ�
	SetScaleSilhouette(res_gur, SCALE.M, SILHOUETTE_WIDTH.M);
	
	//=====================================
	//���[�V�����̓ǂݍ���
	//=====================================
	
	//��풓���[�V����
	local gur_stop_L = ReadMotion_(res_gur, "m121_00_stop_L");		//�Î~L
	local gur_up = ReadMotion_(res_gur, "m121_00_up");				//�Î~�����������
	local gur_up_L = ReadMotion_(res_gur, "m121_00_up_L");			//����グ��L
	local gur_stand = ReadMotion_(res_gur, "m121_00_stand");		//����グ�遨�ҋ@	
	
	//�����̃��[�V����
	SetMotion_(res_gur, gur_stop_L, BLEND_N);		//���K�[�h�}�X�^�[�Î~���[�V����
	
	//=====================================
	//�G�t�F�N�g�̓ǂݍ���
	//=====================================
	LoadEffect_("ef811_01_light_monoeye");	//���m�A�C����
	LoadEffect_("ef812_01_off_monoeye");	//���m�A�C�B��
	local monoeye_OFF = SetSelectBoneEffect_("ef812_01_off_monoeye", res_gur, ATTACH_GLOBAL);
	
	//��������������������������������������
	//���J�b�g1
	//��������������������������������������
	
	local task1 = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");
	
	//=====================================
	//�t�F�[�h�C��
	//=====================================
	StartDemo(FADE_COLOR_BLACK);
		
	//���K�[�h�}�X�^�[�N��
	//��SE�w�r�R�[���x
	PlaySE_("SE_DEM_042");
	efc_light_monoeye = SetPointWorldEffect_("ef811_01_light_monoeye", "efc_light_monoeye");			//���m�A�C����
	SetEffectScale_(efc_light_monoeye, 0.4);
	Wait_(10);
	DeleteEffect_(monoeye_OFF);//���m�A�C�B���폜
	Wait_(27);

	SetMotion_(res_gur, gur_up, BLEND_XL);		//���Î~������グ�郂�[�V����
	Wait_(40);
	
	DeleteTask_(task1);
	
	local task2 = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");

	SetMotion_(res_gur, gur_up_L, BLEND_M);		//������グ��B
	Wait_(10);
	
	SetMotion_(res_gur, gur_stand, BLEND_M);		//������グ�遨�ҋ@�B
	Wait_(45);
	SetMotion_(res_gur,MOT_WAIT, BLEND_XL);		//���L���[�}�V���ҋ@
	Wait_(10);

	//===============================================
	//�u�V���j���E�V���@�n�b�P���I
	OpenMsgWnd_();		
//	SetTalkName_("NAME_TAG_GUARD_MASTER");
	ShowMsg_("DEMO_111_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	PlaySE_("SE_DEM_043");							//�K�[�h�}�X�^�[�퓬�O

	SetMotion_(res_gur,MOT_ATTACK, BLEND_M);		//���L���[�}�V���U��
	Wait_(5);
	//=====================================
	//���퓬�u���[
	//=====================================
	EncountEndDemo(ENCOUNT_BOSS);

	
}