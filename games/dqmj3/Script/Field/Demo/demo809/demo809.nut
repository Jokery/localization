//=============================================
//
//		demo809[����̉��]
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
	local task_cam, task_player;
	local task_aroma_step;
	local efc_player;

// �����\�[�X�Ǎ�
	// �L�����N�^�[
	local player = GetPlayerId_();					// ��l��
	local model_aroma = ReadNpc_("n018");			//�A���}
	
	local model_pod = ReadGimmick_("o_U00_02");				// �E�o�|�b�h

	local model_red_door = ReadGimmick_("o_U00_05");		// ��:�Ԕ�
	local model_green_door00 = ReadGimmick_("o_U00_09");	// ��:�Δ�
	local model_green_door01 = ReadGimmick_("o_U00_10");	// ��:�Δ�
	
// ���z�u
	// ��l��
	SetPointPos_(player, "player000");
	
	local aroma = ArrangePointNpc_(model_aroma, "npc_aroma000");
	SetStepSe_(aroma, SILENT_STEP_SE);
	
	local pod00 = ArrangePointGimmick_("o_U00_02", model_pod, "obj_pod000");							//�E�o�|�b�h�R��
	local pod01 = ArrangePointGimmick_("o_U00_02", model_pod, "obj_pod001");
	local pod02 = ArrangePointGimmick_("o_U00_02", model_pod, "obj_pod002");
	
	local red_door = ArrangePointGimmick_("o_U00_05", model_red_door, "obj_U00_05");					//��:�Ԕ�
	local green_door00 = ArrangePointGimmick_("o_U00_09", model_green_door00, "obj_U00_09");			//��:�Δ�
	local green_door01 = ArrangePointGimmick_("o_U00_10", model_green_door01, "obj_U00_10");			//��:�Δ�

// ����풓���[�V�����Ǎ�
	

// ���J�����ݒ�
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");

//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);
	
	//�A���} ��l���̂Ƃ���܂ŕ���
	SetMotion_(aroma, MOT_WALK, BLEND_XL);
	local task_aroma = Task_MoveForward_(aroma, 0.6, false);
	task_aroma_step = Task_PlaySe_("SE_FLD_021", 15);
	Wait_(57);
	DeleteTask_(task_aroma);
	DeleteTask_(task_aroma_step);
	
	SetMotion_(aroma, MOT_WAIT, BLEND_XL);
	Wait_(15);

	//��l�� �A���}�̕��ɐU�����
	SetMotion_(player, MOT_WALK, BLEND_M);
	local task_player = Task_RotateToDir_(player, 10, 6);
	Wait_(30);
	
	SetMotion_(player, MOT_WAIT, BLEND_XL);
	Wait_(20);
	
	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");
	
	SetPointPos_(aroma, "npc_aroma001");
	SetMotion_(aroma, MOT_TALKLOOP, BLEND_XL);

	//===============================================
	// ���A���}
	// �u���҂����@����l���̖��O���B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_AROMA");
	ShowMsg_("DEMO_809_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
		
	Wait_(20);

	SetPointCameraEye_("cameye002");
	SetPointCameraTarget_("camtgt002");
	SetAlpha_(player, 0);

	//===============================================
	// ���A���}
	// �u���󂪉�������@�����̎���̗􂯖ڂ���
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_AROMA");
	ShowMsg_("DEMO_809_MSG_020");
	KeyInputWait_();

	//===============================================
	
	//===============================================
	// ���A���}
	// �u�ł��@���ꂮ����@���f�͂��Ȃ����ƁB
	//-----------------------------------------------
	
	ShowMsg_("DEMO_809_MSG_030");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
		
	SetMotion_(aroma, MOT_WAIT, BLEND_XL);

	Wait_(40);
	
	EndDemo(FADE_COLOR_BLACK);
}
