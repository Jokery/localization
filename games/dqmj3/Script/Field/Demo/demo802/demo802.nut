//=============================================
//
//		demo802[���L���ƃA���}]
//
//=============================================
const FLASH = "ef732_13_light_reactor01";
function SetScale2way(chr, now_scale, next_scale, frm)
{
	local size = (now_scale - next_scale) / frm;
	local count = 1;
	
	while(1){
		
		if(count <= frm){
			SetEffectScale_(chr, now_scale - (count * size));
			count = count + 1;
		}
		
		
		Wait_(1);
		if(count >= frm){
			SetEffectScale_(chr, next_scale);
		}
		
		if(frm <= count){
			break;
		}
	}
}

function SetAlphaFade2(chr, alpha, frm)
{
	local n_alpha, n_alpha2;
	local now_alpha, now_alpha2;
	local change_alpha, change_alpha2;
	
	now_alpha = GetAlpha_(chr);
	change_alpha = (now_alpha - alpha) / frm;
	local count = 1;
	
	while(1){
		
		
		if(count >= frm){
			SetAlpha_(chr, alpha);
		}
		
		if(count <= frm){
			SetAlpha_(chr, now_alpha - (count * change_alpha));
			count = count + 1;
		}

		Wait_(1);

		n_alpha = GetAlpha_(chr);
		if(n_alpha == alpha){
			break;
		}
	}
}

function Task_Rot3(chr, rot, frm)
{

//�����v���@���Z
//���v���@���Z

	local dir = GetDir_(chr);
	
	local sita = dir+rot;
	
	local sita2 = sita-dir;

	if( sita2 <= 0 ){
		sita2 = sita2*-1;
	}
	
	local frm2 = sita2/frm;
	
	local task = Task_RotateToDir_(chr, sita, frm2);
	
	return task;
}
//-------------------------------------------------------------------------
//
//		�ǂݍ��݁E�z�u
//
//-------------------------------------------------------------------------
function Update()
{
	
// ���ϐ���`
	local task_cam, task_player, task_aroma;
	local task_aroma_step;
	local efc_player, efc_seed;

// �����\�[�X�Ǎ�
	// �L�����N�^�[
	local player = GetPlayerId_();					// ��l��
	local id_rukiya = ReadNpc_("n009");				// ���L��
	local id_aroma = ReadNpc_("n018");				// �A���}
	local id_base = ReadGimmick_("o_effect_base");	// �G�t�F�N�g�x�[�X
	
	
	// �G�t�F�N�g
	LoadEffect_("ef732_13_light_reactor01");			// ���A�N�^�[�̌�(���L�����z�����ތ�)
	LoadEffect_("ef861_03_m_draw");						// M�R�̋z�����܂��


	// �M�~�b�N
	local id_pod = ReadGimmick_("o_U00_02");			// �E�o�|�b�h
	local id_alias = ReadGimmick_("o_U00_11");		// �G�C���A�X���u

	local id_red_door = ReadGimmick_("o_U00_05");		// ��:�Ԕ�
	local id_green_door00 = ReadGimmick_("o_U00_09");	// ��:�Δ�
	local id_green_door01 = ReadGimmick_("o_U00_10");	// ��:�Δ�
	
// ���z�u
	// ��l��
	local task_player = Task_AnimeMove_(player, "player");
	DeleteTask_(task_player);
	local kaiten = Task_Rot3(player, 50, 1);
	
	//�A���}
	local aroma = ArrangePointNpc_(id_aroma, "aroma_show");
	SetStepSe_(aroma, SILENT_STEP_SE);
	
	//���L��
	local rukiya = ArrangeNpc_(id_rukiya, false);
	local task_rukiya = Task_AnimeMove_(rukiya, "rukiya");
	DeleteTask_(task_rukiya);
	
	//�M�~�b�N
	
	local pod1 = ArrangePointGimmick_("o_U00_02", id_pod, "pod1");								//�E�o�|�b�h�R��
	local pod2 = ArrangePointGimmick_("o_U00_02", id_pod, "pod2");
	local pod3 = ArrangePointGimmick_("o_U00_02", id_pod, "pod3");
	
	local souti1 = ArrangeGimmick_("o_U00_11", id_alias, "souti1");						//�G�C���A�X���u�R��
	local souti2 = ArrangeGimmick_("o_U00_11", id_alias, "souti2");
	local souti3 = ArrangeGimmick_("o_U00_11", id_alias, "souti3");
	
	local red_door = ArrangeGimmick_("o_U00_05", id_red_door, "obj_door000");					//��:�Ԕ�
	local green_door00 = ArrangeGimmick_("o_U00_09", id_green_door00, "obj_door000");			//��:�Δ�
	local green_door01 = ArrangeGimmick_("o_U00_10", id_green_door01, "obj_door000");			//��:�Δ�

// ����풓���[�V�����Ǎ�
	//��l��
	local p_wait = ReadMotion_(player, "Player_caution01_L");									//�x��L
	local p_left = ReadMotion_(player, "Player_look_left_L");									//������L
	
	//�A���}
	local a_sleep = ReadMotion_(aroma, "n018_cold_sleep_L");							//�J�v�Z��
	local a_nobi = ReadMotion_(aroma, "n018_stretch");									//�L��
	local a_sita = ReadMotion_(aroma, "n018_look_down_L");								//�������ҋ@L
	
// ���������[�V����
	SetMotion_(aroma, a_sleep, 1); 

	
// ���J�����ݒ�
	SetPointCameraEye_("0_eye");
	SetPointCameraTarget_("0_tgt");
	
	SetFace_(aroma, "Face_loop_close");

//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------
	StartDemo(FADE_COLOR_BLACK);
	Wait_(15);
	local task_rukiya = Task_AnimeMove_(rukiya, "rukiya");
	WaitTask(task_rukiya);
	SetMotion_(player, p_left, 4);
	//===============================================
	// �����L��
	// �u�ӂ��@�������̖{�̂́@�����Ȃ悤���ˁB
	// �@������������@�ǂ����悤���Ǝv������B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RUKIYA");
	ShowMsg_("DEMO_802_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	local task_rukiya = Task_AnimeMove_(rukiya, "rukiya2");
	SetMotion_(player,MOT_WAIT,16);
	local task_player = Task_AnimeMove_(player, "player");
	Wait_(58);
	SetMotion_(player,MOT_WALK,4);
	SetPointCameraEye_("1_eye");
	SetPointCameraTarget_("1_tgt");
	Wait_(120);
	SetMotion_(player,MOT_WAIT,4);
	Wait_(30);
	local task_cam = Task_AnimeMoveCamera_("2_eye", "2_tgt");
	DeleteTask_(task_cam);
	local taska = Task_Rot3(rukiya, 180, 60);
	WaitTask(taska);
	
	//===============================================
	// �����L��
	// �u���ā@����Ŗ{�̂��@�ڊo�߂�͂����B
	// �@�����ő҂��Ăȁ@����l���̖��O���B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RUKIYA");
	ShowMsg_("DEMO_802_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	local hikari = ArrangeGimmick_("o_effect_base", id_base, false);
	PlaySE_("SE_DEM_195");
	local efc = SetSelectBoneEffect_("ef732_13_light_reactor01", hikari, ATTACH_GLOBAL);
	SetEffectScale_(efc, 0.5);
	local task_cam = Task_AnimeMoveCamera_("2_eye", "2_tgt");
	DeleteTask_(task_cam);
	local task	 = Task_AnimeMoveNoFit_(hikari, "flash");
	DeleteTask_(task);
	SetScale2way(efc, 0.5, 0.8, 1);
	SetAlphaFade2(rukiya, 0, 60);
	SetVisible(rukiya, false);
	SetScale2way(efc, 0.8, 0.15, 50);
	local task_cam = Task_AnimeMoveCamera_("2_eye", "2_tgt");
	local task	 = Task_AnimeMoveNoFit_(hikari, "flash");
	Wait_(151);
	local efc_draw = SetPointWorldEffect_("ef861_03_m_draw", "draw");// �z�����܂��
	SetEffectScale_(efc_draw, 0.5);
	DeleteEffectEmitter_(efc);
	WaitTask(task_cam);
	StopBgm_(30);
	SetFade_(FADE_OUT, FADE_COLOR_WHITE, 30);
	Wait_(30);
	local task_aroma = Task_AnimeMove_(aroma, "aroma");
	DeleteTask_(task_aroma);
	SetMotion_(aroma, MOT_WAIT, 1);
	Wait_(60);
	local task_cam = Task_AnimeMoveCamera_("3_eye", "3_tgt");
	SetFade_(FADE_IN, FADE_COLOR_WHITE, 30);

	Wait_(40);
	SetMotion_(aroma, a_nobi, 4);
	local taskaa = Task_ChangeMotion_(aroma, MOT_WAIT, 16);
	Wait_(90);
	
	//===============================================
	// *�A���}
	// �u����c�c�����@�悭�Q���B
	// �@�ڊo�߂́@��X���ĂƂ��납����H
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_802_MSG_030");
	Wait_(20);
	SetFace_(aroma, "Face_eyes_close");
	KeyInputWait_();
	//-----------------------------------------------


	//-----------------------------------------------
	// �u���̐g�̂Ł@�A���^�ɉ�̂́@�͂��߂Ă���
	// �@�܂��́@���ȏЉ�����Ă�����ˁB
	//-----------------------------------------------
	ShowMsg_("DEMO_802_MSG_040");
	SetFace_(aroma, "Face_smile");
	SetMotion_(aroma, MOT_TALK, BLEND_L);
	WaitMotion(aroma);
	SetMotion_(aroma, MOT_TALKLOOP, BLEND_M);	
	KeyInputWait_();
	//-----------------------------------------------
	
	//-----------------------------------------------
	// *�A���}
	// �u�A�^�V�́@�{���̖��O�́@�A���}�B
	// �@�V�ˉȊw�ҁ@���L���搶�́c�c�e���҂�B
	//-----------------------------------------------
	ShowMsg_("DEMO_802_MSG_050");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	DeleteTask_(task_cam);
	
	SetMotion_(player, p_left, BLEND_N);
	local task_dir = Task_RotateToDir_(player, 180, 180);
	
	SetPointCameraEye_("4_eye");
	SetPointCameraTarget_("4_tgt");
	
	task_aroma = Task_AnimeMoveSetMotion_(aroma, "aroma", MOT_WALK, a_sita);
	task_aroma_step = Task_PlaySe_("SE_FLD_021", 15);
	Wait_(70);
	
	SetMotionSpeed_(player, 0.2);	// ���[�V�������������ɂȂ�
	SetMotion_(player, MOT_WAIT, BLEND_XL);
	
	//===============================================
	// ���A���}
	// �u�A�^�V���p���؂�Ă����@���L���搶�͂�
	// �@�}�U�[���J�����@�ږ��v��̔��Ă����l�c�c�B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_AROMA");
	ShowMsg_("DEMO_802_MSG_060");
	Wait_(35);
	DeleteTask_(task_aroma_step);
	KeyInputWait_();
	//-----------------------------------------------
	
	
	//-----------------------------------------------
	// �u�����ā@�A�^�V�́@���L���搶�̒�q�Ƃ���
	// �@�ږ��v����������邽�߁@�����Ă����́B
	//-----------------------------------------------
	ShowMsg_("DEMO_802_MSG_070");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	WaitTask(task_aroma);
	
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 30);
	WaitFade_();
	PlayBgm_("BGM_009");
//===================================
//��������ߋ��f���J�b�g
//===================================
	LoadLayout_("memories"); 
	SetLayoutAnime_("ev802_00_loop", true);
	SetFade_(FADE_IN, FADE_COLOR_BLACK, 30);
	WaitFade_();
	//===============================================
	// ���A���}
	// �u�ł��搶�́@�u���C�N���[���h���a�������Ƃ�
	// �@�}�U�[�̖\���Ɋ������܂�@�S���Ȃ�����c�c�B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_AROMA");
	ShowMsg_("DEMO_802_MSG_080");
	KeyInputWait_();
	//-----------------------------------------------
	
	//-----------------------------------------------
	// �u���̖\���Ł@�R�[���h�X���[�v�����������Ԃ�
	// �@���������āc�c�ږ��c�́@���󐡑O�������B
	//-----------------------------------------------
	ShowMsg_("DEMO_802_MSG_090");
	KeyInputWait_();
	//-----------------------------------------------
	
	//-----------------------------------------------
	// �u����ȂƂ��@���[�_�[�������搶���@���񂾂�
	// �@�ږ��݂̂�Ȃ��@�m������ǂ��Ȃ邩�c�c�I
	//-----------------------------------------------
	ShowMsg_("DEMO_802_MSG_100");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 30);
	WaitFade_();
	SetLayoutAnime_("ev802_00_out", false);
	WaitLayoutAnime();
	SetLayoutAnime_("ev802_01_loop", true);
	SetFade_(FADE_IN, FADE_COLOR_BLACK, 30);
	WaitFade_();
	//===============================================
	// ���A���}
	// �u���������ꂽ�A�^�V�́@�J����������
	// �@�G�C���A�X���u�Ł@�搶�ɐ���������́B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_AROMA");
	ShowMsg_("DEMO_802_MSG_110");
	KeyInputWait_();
	//-----------------------------------------------
	
	//-----------------------------------------------
	// ���A���}
	// �u�c�c���ꂪ�@�ږ��̒��Ԃ�����
	// �@���܂����ƂɂȂ���ā@�킩������łˁB
	//-----------------------------------------------
	ShowMsg_("DEMO_802_MSG_120");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 30);
	WaitFade_();
	SetLayoutAnime_("ev802_01_out", false);
	WaitLayoutAnime();
//===================================
//�����܂ŉߋ��f���J�b�g
//===================================
	local task_kaiwa = Task_RotateToPos_(player, GetPos_(aroma), 100);
	local task_kaiwa = Task_RotateToPos_(aroma, GetPos_(player), 100);
	SetFace_(aroma, "Face_default");
	
	SetPointCameraEye_("5_eye");
	SetPointCameraTarget_("5_tgt");
	
	SetFade_(FADE_IN, FADE_COLOR_BLACK, 30);
	WaitFade_();
	//===============================================
	// ���A���}
	// �u�搶�Ȃ��ł́@���Ԃ��@�܂Ƃ܂�Ȃ��ق�
	// �@�̑�Ȑl�������̂�c�c�B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_AROMA");
	ShowMsg_("DEMO_802_MSG_130");
	KeyInputWait_();
	//-----------------------------------------------
	SetMotion_(aroma, MOT_WAIT, 16);
	//-----------------------------------------------
	// ���A���}
	// �u���̕����Ɂ@�s���Ȃ����B�s���΁@�A���^�ɂ�
	// �@�搶�̈̑傳���@�킩��͂�������B
	//-----------------------------------------------
	ShowMsg_("DEMO_802_MSG_140");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	StopBgm_(30);
	EndDemo(FADE_COLOR_BLACK);
}
