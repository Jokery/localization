//=============================================
//
//		demo112[�K�[�h�}�X�^�[�Đ�]
//
//=============================================
function Update()
{
	
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
	
	//�����̃��[�V����
	SetMotion_(res_gur, MOT_WAIT, BLEND_M);
	
	//��풓���[�V����
	local gur_stop_L = ReadMotion_(res_gur, "m121_00_stop_L");		//�Î~L
	local gur_up = ReadMotion_(res_gur, "m121_00_up");				//�Î~�����������
	local gur_up_L = ReadMotion_(res_gur, "m121_00_up_L");			//����グ��L
	local gur_stand = ReadMotion_(res_gur, "m121_00_stand");		//����グ�遨�ҋ@	
	
	//��������������������������������������
	//���J�b�g1
	//��������������������������������������
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");
	
	//=====================================
	//�t�F�[�h�C��
	//=====================================
	StartDemo(FADE_COLOR_BLACK);
	
	//=====================================
	//��b�J�n
	//=====================================
	
	OpenMsgWnd_();
//	SetTalkName_("NAME_TAG_GUARD_MASTER");
	ShowMsg_("DEMO_112_MSG_010");
	KeyInputWait_();
	
	CloseMsgWnd_();
	//===============================================
	
	PlaySE_("SE_DEM_043");							//�K�[�h�}�X�^�[�퓬�O
	
	SetMotion_(res_gur,MOT_ATTACK, BLEND_M);		//���L���[�}�V���U��
	Wait_(10);
	
	//=====================================
	//���퓬�u���[
	//=====================================
	EncountEndDemo(ENCOUNT_BOSS);
	
}