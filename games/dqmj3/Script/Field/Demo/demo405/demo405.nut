//=============================================
//
//		demo405[���S�̊č�����_1(�A���C�p�[�N)]
//
//=============================================
//
//		�d�����̂������
//
//----------------------------------------------------------------------------
//	����	: chr			�L����
//			: mot			���[�V����
//			: spd			���[�V�����X�s�[�h(����:SPEED_N�A�������:SPEED_S)
//			: frm			����t������(�f�t�H���g���l)
//			: tsk			�^�X�N��
//			: endMot		�^�X�N�I�����̃��[�V����
//			: endCnt		�I���܂ł̃J�E���g
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
const SPEED_N = 1;
const SPEED_S = 0.5;
function WalkQuake_(chr, mot, spd, frm, tsk, endMot, endCnt)
{
	local m_spd = frm / spd;
	SetMotion_(chr, mot, 8);
	SetMotionSpeed_(chr, spd);
	
	local cnt = 0;
	local taskCnt = 0;
	while(!IsTaskEnd_(tsk)){
		StartEarthQuake_(10, 3, 0.7);
		PlaySE_("SE_DEM_014");
		Wait_(m_spd);
		taskCnt += m_spd;
		cnt++;
		if(endCnt != -1 && endCnt == taskCnt){
			return;
		}
	}
	SetMotion_(chr, endMot, BLEND_M);
	
	return cnt;
}
//-------------------------------------------------------------------------
//
//		�ǂݍ��݁E�z�u
//
//-------------------------------------------------------------------------
function Update()
{
	
// ���ϐ���`
	local task_cam, task_player, task_ittaburu;

// �����\�[�X�Ǎ�
	// �L�����N�^�[
	local n_ittaburu = ReadNpc_("m205_00");					// �C�b�^�u��
	local g_box		 = ReadGimmick_("o_S01_02");			// �͂�

// ���z�u
	// �C�b�^�u��
	local ittaburu0 = ArrangePointNpc_(n_ittaburu, "npc_ittaburu000");
	SetScale_(ittaburu0, SCALE.M);
	
	// �n�R
	local gmc_box = ArrangePointGimmick_("o_S01_02", g_box, "obj_hako000");
	SetMotion_(gmc_box, MOT_GIMMICK_0, BLEND_N);
	SetGimmickMapHitEnable_(gmc_box, false);

// ����풓���[�V�����Ǎ�
	local ittaburu_box_check = ReadMotion_(ittaburu0, "m205_00_box_check");
	local ittaburu_box_wait_L = ReadMotion_(ittaburu0, "m205_00_box_wait_L");
	local ittaburu_box_carry_L = ReadMotion_(ittaburu0, "m205_00_box_carry_L");

// ���J�����ݒ�
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");
	
	task_ittaburu = Task_AnimeMove_(ittaburu0, "anm_ittaburu000");
	
// �����[�V����
	SetMotion_(ittaburu0, MOT_WALK, BLEND_L);
	SetMotionSpeed_(ittaburu0, 0.5);
//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);
	WalkQuake_(ittaburu0, MOT_WALK, 0.5, 15, task_ittaburu, MOT_WAIT, -1);
	SetMotionSpeed_(ittaburu0, 1);
	StartEarthQuake_(10, 3, 0.7);
	PlaySE_("SE_DEM_014");	
	SetMotion_(ittaburu0, MOT_WAIT, BLEND_L);
	//===============================================
	// ���C�b�^�u��
	// �u����[��Ɓ@�C�P�j�G��
	//-----------------------------------------------	
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ITABURU");
	ShowMsg_("DEMO_405_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 10);
	WaitFade_();

	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");

	task_ittaburu = Task_AnimeMove_(ittaburu0, "anm_hako");
	SetMotion_(ittaburu0, ittaburu_box_wait_L, BLEND_N);
	SetMotion_(gmc_box, MOT_GIMMICK_4, BLEND_M);

	task_ittaburu = Task_AnimeMove_(gmc_box, "anm_hako");

	SetFade_(FADE_IN, FADE_COLOR_BLACK, 10);
	WaitFade_();

	SetMotion_(gmc_box, MOT_GIMMICK_6, BLEND_M);
	SetMotion_(ittaburu0, ittaburu_box_check, BLEND_M);
	PlaySE_("SE_DEM_075");  			//�u�K�^�S�g�vSE�Đ�
	Wait_(10);
	WaitMotion(ittaburu0);
	SetMotion_(gmc_box, MOT_GIMMICK_4, BLEND_M);
	SetMotion_(ittaburu0, ittaburu_box_wait_L, BLEND_M);
	
	//===============================================
	// ���C�b�^�u��
	// �u�悵�I�@�ł́@������Ă����̂ł���I
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ITABURU");
	ShowMsg_("DEMO_405_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	SetMotion_(ittaburu0, ittaburu_box_carry_L, BLEND_M);
	SetMotionSpeed_(ittaburu0, 0.5);
	SetMotion_(gmc_box, MOT_GIMMICK_5, BLEND_M);
	SetMotionSpeed_(gmc_box, 0.5);

	StartEarthQuake_(10, 3, 0.7);
	PlaySE_("SE_DEM_014");
	
	local task = Task_RotateToDir_(ittaburu0, 180, 2);	
	local task_b = Task_RotateToDir_(gmc_box, 180, 2);	
	Wait_(30);
	StartEarthQuake_(10, 3, 0.7);
	PlaySE_("SE_DEM_014");	
	Wait_(30);
	StartEarthQuake_(10, 3, 0.7);
	PlaySE_("SE_DEM_014");	
	
	WaitTask(task_b);
	WaitTask(task);
	task_b = Task_AnimeMove_(gmc_box, "anm_ittaburu001");	
	task_ittaburu = Task_AnimeMove_(ittaburu0, "anm_ittaburu001");
	WalkQuake_(ittaburu0, ittaburu_box_carry_L, 0.5, 15, task_ittaburu, ittaburu_box_carry_L, 60);

	StartEarthQuake_(10, 3, 0.7);
	PlaySE_("SE_DEM_014");	
	EndDemo(FADE_COLOR_BLACK);
}
