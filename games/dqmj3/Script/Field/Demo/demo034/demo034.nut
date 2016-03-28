//=============================================
//
//		demo034[�m�`���[���̈ږ��v��]
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
	local task_cam, task_king;
	local efc_cam;
	local abare_kind = 157;			// �푰�h�c:���΂ꂤ���ǂ�
	
// �����\�[�X�Ǎ�
	// �L�����N�^�[
	local player = GetPlayerId_();				// ��l��
	local model_nocho_m = ReadNpc_("n000");		// �m�`���[���@�ėp�@�j
	local model_jack = ReadNpc_("n001");		// �W���b�N
	local model_king = ReadNpc_("n003");		// �L���O
	local model_nocho_f = ReadNpc_("n004");		// �m�`���[���@�ėp�@��
	local model_queen = ReadNpc_("n005");		// �N�C�[��
	local model_abare = ReadNpc_("m051_00");	// ���΂ꂤ���ǂ�
	local model_rin = ReadNpc_("n043");			// �m�`������

	// �G�t�F�N�g
	LoadEffect_("ef712_04_emo_joy01");			// �u��v
	LoadEffect_("ef733_01_sym_shuchusen01");			// �W����
	
// ���z�u
	// ��l��
	SetPointPos_(player, "player000");
	SetFace_(player, "Face_eyes_close");
	// �W���b�N
	local jack = ArrangePointNpc_(model_jack, "npc_jack000");
	// �L���O
	local king = ArrangePointNpc_(model_king, "npc_king000");
	// �N�C�[��
	local queen = ArrangePointNpc_(model_queen, "npc_queen000");
	// �m�`���[��
	local nocho00 = ArrangePointNpc_(model_nocho_m, "npc_nocho000");
	local nocho01 = ArrangePointNpc_(model_rin, "npc_nocho100");
	local nocho02 = ArrangePointNpc_(model_nocho_m, "npc_nocho200");
	local nocho03 = ArrangePointNpc_(model_nocho_f, "npc_nocho300");
	local nocho04 = ArrangePointNpc_(model_nocho_m, "npc_nocho400");
	local nocho05 = ArrangePointNpc_(model_nocho_m, "npc_nocho500");
	// ���΂ꂤ���ǂ�
	local abare = ArrangePointNpc_(model_abare, "npc_abare000");
	SetScaleSilhouette(abare, SCALE.N, SILHOUETTE_WIDTH.N);
	
// ����풓���[�V�����Ǎ�
	local nocho00_jump_L = ReadMotion_(nocho00, "n000_jump_L");			// �m�`���[���P��ђ���
	local nocho01_jump_L = ReadMotion_(nocho01, "n000_jump_L");			// �m�`���[���Q��ђ���
	local nocho02_jump_L = ReadMotion_(nocho02, "n000_jump_L");			// �m�`���[���R��ђ���
	local nocho03_jump_L = ReadMotion_(nocho03, "n000_jump_L");			// �m�`���[���S��ђ���
	local nocho04_jump_L = ReadMotion_(nocho04, "n000_jump_L");			// �m�`���[���T��ђ���
	local nocho05_jump_L = ReadMotion_(nocho05, "n000_jump_L");			// �m�`���[���U��ђ���
	local king_talk = ReadMotion_(king, "n003_talk");					// �L���O�ҋ@����b
	local king_talk_L = ReadMotion_(king, "n003_talk_L");				// �L���O��b
	local king_think = ReadMotion_(king, "n003_think");					// �L���O�ҋ@���l����
	local king_think_L = ReadMotion_(king, "n003_think_L");				// �L���O�l����
	local king_stick_up = ReadMotion_(king, "n003_stick_up");			// �L���O�ҋ@����f��
	local king_stick_up_L = ReadMotion_(king, "n003_stick_up_L");		// �L���O��f��
	local king_nod = ReadMotion_(king, "n003_nod");						// �L���O���ȂÂ�
	local king_feeldown_L = ReadMotion_(king, "n003_feeldown_L");		// �L���O��������
	
// ���G�t�F�N�g�ݒ�


// �����[�V�����ݒ�
	RideOn_(player, abare, abare_kind, SIZE_N);
	Wait_(15);//���C�h�����҂�
	SetMotion_(king, king_talk_L, BLEND_N);

// ���J�����ݒ�
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");		// 150F

//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);
	
	// ���J�b�g�P���`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`
	
	//===============================================
	// ���L���O
	// �u�ӂށB���Ɍ����ȁ@���΂ꂤ���ǂ�ł���B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_KING");
	ShowMsg_("DEMO_034_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetMotion_(king, king_nod, BLEND_XL);
	Wait_(50);
	
	SetMotion_(king, king_talk, BLEND_M);
	task_king = Task_ChangeMotion_(king, king_talk_L, BLEND_M);
	
	DeleteTask_(task_cam);
	
	// ���J�b�g�Q���L���O�ւo�`�m�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`
	task_cam = Task_AnimeMoveCamera_("anmeye003", "anmtgt003");		// 300F
	
	//===============================================
	// ���L���O
	// �u���́@�������c�c�B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_KING");
	ShowMsg_("DEMO_034_MSG_020");
	KeyInputWait_();
	
	//-----------------------------------------------
	// ��
	// �u<name_player/>��B���m�`���[����
	//-----------------------------------------------
	ShowMsg_("DEMO_034_MSG_030");
	KeyInputWait_();
	
	SetMotion_(king, king_feeldown_L, BLEND_XL);		// ��������
	
	//-----------------------------------------------
	// ��
	// �u����ǁ@�u���C�N�����X�^�[���o�����Ă���
	//-----------------------------------------------
	ShowMsg_("DEMO_034_MSG_040");
	KeyInputWait_();
	
	//-----------------------------------------------
	// ��
	// �u�z�炪�K�P������@�l�Ԃ̓s�s�֍s�����߂�
	//-----------------------------------------------
	ShowMsg_("DEMO_034_MSG_050");
	KeyInputWait_();
	
	//-----------------------------------------------
	// ��
	// �u����䂦�@�]�́@�l�Ԃ����̏Z��ł����s�s��
	//-----------------------------------------------
	ShowMsg_("DEMO_034_MSG_060");
	KeyInputWait_();
	
	//-----------------------------------------------
	// ��
	// �u�����c�c����@���̒n�́@��̌Ǔ��B�K�P���z��
	//-----------------------------------------------
	ShowMsg_("DEMO_034_MSG_070");
	KeyInputWait_();
	CloseMsgWnd_();
	
	Wait_(20);
	
	DeleteTask_(task_king);
	SetMotion_(king, king_talk, BLEND_XL);				// ��b
	task_king = Task_ChangeMotion_(king, king_talk_L, BLEND_M);
	
	DeleteTask_(task_cam);
	SetAlpha_(queen, ALPHA_CLEAR);
	
	// ���J�b�g�R�����΂ꂤ���ǂ���f���`�`�`�`�`�`�`�`�`�`�`�`
	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");
	
	//-----------------------------------------------
	// ��
	// �u�����v���Ă����@������c�c�]�͌����̂��B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_KING");
	ShowMsg_("DEMO_034_MSG_080");
	KeyInputWait_();
	
	//-----------------------------------------------
	// ��
	// �u�����ā@�]�͎v�����̂��I�@�����Ȃ��
	//-----------------------------------------------
	ShowMsg_("DEMO_034_MSG_090");
	KeyInputWait_();
	CloseMsgWnd_();
	Wait_(20);
	
	SetAlpha_(queen, ALPHA_EXIST);
	
	// ���J�b�g�S���L���O�����f���`�`�`�`�`�`�`�`�`�`�`�`�`�`�`
	SetPointCameraEye_("cameye002");
	SetPointCameraTarget_("camtgt002");
	
	local joy_nocho00 = SetSelectBoneEffect_("ef712_04_emo_joy01", nocho00, ATTACH_EFFECT2);
	local joy_nocho01 = SetSelectBoneEffect_("ef712_04_emo_joy01", nocho01, ATTACH_EFFECT2);
	local joy_nocho02 = SetSelectBoneEffect_("ef712_04_emo_joy01", nocho02, ATTACH_EFFECT2);
	local joy_nocho03 = SetSelectBoneEffect_("ef712_04_emo_joy01", nocho03, ATTACH_EFFECT2);
	local joy_nocho04 = SetSelectBoneEffect_("ef712_04_emo_joy01", nocho04, ATTACH_EFFECT2);
	local joy_nocho05 = SetSelectBoneEffect_("ef712_04_emo_joy01", nocho05, ATTACH_EFFECT2);
	
	SetMotion_(king, king_stick_up, BLEND_M);
	WaitMotion(king);
	SetMotion_(king, king_stick_up_L, BLEND_M);
	
	//-----------------------------------------------
	// ��
	// �u<name_player/>��I�@���̂��΂ꂤ���ǂ��
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_KING");
	ShowMsg_("DEMO_034_MSG_100");
	KeyInputWait_();
	
	//-----------------------------------------------
	// ��
	// �u�m�`���[���́@�ꑰ������I
	//-----------------------------------------------
	ShowMsg_("DEMO_034_MSG_110");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	DeleteTask_(task_cam);
	
	// ���J�b�g�T���Y�[���A�E�g�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`
	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");		// 60F
	
	PlaySE_("SE_DEM_027");											//�m�`���[�����SE
	
	efc_cam = SetCameraEffect_("ef733_01_sym_shuchusen01", CAMERA_DEF);	// �W����
	
	// ���[�V�����Đ��^�C�~���O���o���o���ɂ���
	SetMotion_(nocho00, nocho00_jump_L, BLEND_M);
	Wait_(3);
	SetMotion_(nocho01, nocho01_jump_L, BLEND_M);
	Wait_(3);
	SetMotion_(nocho02, nocho02_jump_L, BLEND_M);
	Wait_(3);
	SetMotion_(nocho03, nocho03_jump_L, BLEND_M);
	Wait_(3);
	SetMotion_(nocho04, nocho04_jump_L, BLEND_M);
	Wait_(3);
	SetMotion_(nocho05, nocho05_jump_L, BLEND_M);
	
	//===============================================
	// ���L���O
	// �u�ŏ��ɖڎw���́@�E�b�h�p�[�N�̖k�̃K�P���I
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_KING");
	ShowMsg_("DEMO_034_MSG_120");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	DeleteEffect_(efc_cam);
	
	EndDemo(FADE_COLOR_BLACK);
}
