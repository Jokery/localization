//=============================================
//
//		demo827 [�_�[�X�K���}�Đ�]
//
//=============================================

//-------------------------------------------------------------------------
//
//		�ǂݍ��݁E�z�u
//
//-------------------------------------------------------------------------
function Update()
{
	local flg = GetNumFlg_("NUM_FLG_COUNT_UP_DEMO_834");	// Num124	���`�ԁF0�@���`�ԁF1�@��O�`�ԁF2�@�ŏI�`�ԁF3
	//m180_00:�_�[�X�K���}(�P�`�R�`��)�@m186_00:�_�O�W���K���}(�ŏI�`��)
	//���b�V����	�yarm�z��A			���`�Ԃŕ\��
	//				�ybreakCover�z��Ǝ�ƐK���A	��O�`�Ԃŕ\��
	//				�ycover�z��̌㕔���A	��O�`�ԂŔ�\��
	//SetMeshVisible_(npc, "cover", false);

// ���ϐ���`
	local task_cam, task_player, task_aroma;
	local efc_player;

// �����\�[�X�Ǎ�
	// �L�����N�^�[
	local player = GetPlayerId_();					// ��l��
	local model_rena = ReadNpc_("n007");			// ���i�[�e
	local m_boss = ReadNpc_("m180_00");				// �_�[�X�K���}
	local m_boss2 = ReadNpc_("m186_00");			// �_�O�W���K���}
	local g_mother = ReadGimmick_("o_C03_02");
	local g_motherK = ReadGimmick_("o_C03_03");

	LoadEffect_("ef730_01_oth_dark_aura01");

// ���z�u
	SetPos_(player,false);

	// ���i�[�e
	local rena = ArrangePointNpc_(model_rena, "mother");
	SetPointPosNoFit_(rena, "mother");
	SetFace_(rena, "Face_loop_close");

	local mother = ArrangePointGimmick_("o_C03_02", g_mother, "mother");
	local motherK = ArrangePointGimmick_("o_C03_03", g_motherK, "mother");
	SetMotion_(mother, MOT_GIMMICK_1 ,1);

	local galma, efc_gal;
	local galma_spell_actuate;
	if(flg <= 2){
		// �_�[�X�K���}
		galma = ArrangePointNpc_(m_boss, "galmid");
		if(flg == 0){
			SetMeshVisible_(galma, "Model", true);		// �{��
			SetMeshVisible_(galma, "cover", true);		// ����ĂȂ��J�o�[
			SetMeshVisible_(galma, "arm", false);		// �r
			SetMeshVisible_(galma, "breakCover", false);// ����Ă�J�o�[
			SetMeshVisible_(galma, "head", false);		// ��
			SetPointCameraEye_("a_eye");
			SetPointCameraTarget_("a_tgt1");
			efc_gal = SetSelectBoneEffectSetOffset_("ef730_01_oth_dark_aura01", galma, ATTACH_GLOBAL, Vec3(0.0, 40.0, 0.0))		//�_�[�N���[�������O
			SetEffectScale_(efc_gal,1.5);
		}
		if(flg == 1){
			SetMeshVisible_(galma, "Model", true);		// �{��
			SetMeshVisible_(galma, "cover", true);		// ����ĂȂ��J�o�[
			SetMeshVisible_(galma, "arm", true);		// �r
			SetMeshVisible_(galma, "breakCover", false);// ����Ă�J�o�[
			SetMeshVisible_(galma, "head", false);		// ��
			SetPointCameraEye_("a_eye");
			SetPointCameraTarget_("a_tgt1");
			efc_gal = SetSelectBoneEffectSetOffset_("ef730_01_oth_dark_aura01", galma, ATTACH_GLOBAL, Vec3(0.0, 40.0, 0.0))		//�_�[�N���[�������O
			SetEffectScale_(efc_gal,1.5);
		}
		if(flg == 2){
			// �{���̓f�t�H���g�Ń��b�V���͂��̏�Ԃ����A�����̈Ӗ���
			SetMeshVisible_(galma, "Model", true);		// �{��
			SetMeshVisible_(galma, "cover", false);		// ����ĂȂ��J�o�[
			SetMeshVisible_(galma, "arm", true);		// �r
			SetMeshVisible_(galma, "breakCover", true);	// ����Ă�J�o�[
			SetMeshVisible_(galma, "head", true);		// ��
			SetPointCameraEye_("a_eye");
			SetPointCameraTarget_("a_tgt2");
			efc_gal = SetSelectBoneEffectSetOffset_("ef730_01_oth_dark_aura01", galma, ATTACH_GLOBAL, Vec3(0.0, 30.0, 0.0))		//�_�[�N���[�������O
			SetEffectScale_(efc_gal,1.5);
		}
	}else{
		// �_�O�W���K���}
		galma = ArrangePointNpc_(m_boss2, "galma");
		SetPointCameraEye_("d_eye");
		SetPointCameraTarget_("d_tgt");
		efc_gal = SetSelectBoneEffectSetOffset_("ef730_01_oth_dark_aura01", galma, ATTACH_GLOBAL, Vec3(0.0, 20.0, 0.0))		//�_�[�N���[�������O
		SetEffectScale_(efc_gal,1.5);
		
		galma_spell_actuate = ReadMotion_(galma, "n042_spell_actuate");	// ���@�r��
	}
	SetScaleSilhouette(galma, SCALE.G, SILHOUETTE_WIDTH.G);

// ����풓���[�V�����Ǎ�
	local p_wait = ReadMotion_(player, "Player_battle01_L");
	local p_run = ReadMotion_(player, "Player_run_battle");
	local rena_mother_L = ReadMotion_(rena, "n007_mother_L");				// �}�U�[�̒��̃��i�[�e

// ���������[�V����
	SetMotion_(rena, rena_mother_L, BLEND_N);

	SetDir_(player, 0);
	SetMotion_(player, MOT_RUN, BLEND_M);
	SetMotionSpeed_(player, 0.875);
	local task_player = Task_AnimeMoveNoDir_(player, "player");


//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------
//cut01
	StartDemoNoFade(FADE_COLOR_BLACK);// �t�F�[�h���Ƀ��[�V������@���K�v�������
	
	Wait_(26);
	SetMotion_(player, p_run, 8);
	Wait_(8);
	PlaySE_("SE_FLD_016");//����
	SetMotion_(player, p_wait, 20);
	Wait_(8);
	PlaySE_("SE_FLD_016");//����
	Wait_(38);
	
	if(flg <= 1){
		SetPointCameraEye_("b_eye");
		SetPointCameraTarget_("b_tgt");
	}
	
	if(flg == 2){
		SetPointCameraEye_("b_eye");
		SetPointCameraTarget_("b2_tgt");
	}
	
	if(flg == 3){
		SetPointCameraEye_("d2_eye");
		SetPointCameraTarget_("d2_tgt");
	}
	
	// �y�_�[�X�K���}�ɕ������ꍇ�z
	if(flg <= 2){
		//===============================================
		// ���_�[�X�K���}
		// �u�������B���x�����c�c
		// �@���x�����@�M�l�Ɂ@�g�h�����h���I
		//-----------------------------------------------
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_DARSGARUMA");
		ShowMsg_("DEMO_827_MSG_010");
		KeyInputWait_();
		
		if(flg <= 1){
			SetMotion_(galma, MOT_SPELL_START, 8);
			local task_gal = Task_ChangeMotion_(galma, MOT_SPELL_CHARGE, 8);
		}
		else if(flg == 2){
			SetMotion_(galma, MOT_SWORD_START, 8);
			local task_gal = Task_ChangeMotion_(galma, MOT_SWORD_CHARGE, 8);
		}
		
		//-----------------------------------------------
		// �u���̃_�[�X�K���}�́@�`�J���Ƌ��|��
		// �@�n���̖�ԂɁ@�`���邪�����I
		//-----------------------------------------------
		ShowMsg_("DEMO_827_MSG_020");
		KeyInputWait_();
		CloseMsgWnd_();
		//===============================================
	}
	
	// �y�_�O�W���K���}�ɕ������ꍇ�z
	else{
		//===============================================
		// ���_�O�W���K���}
		// �u�����������c�c����@�߂��Ă���Ƃ�
		// �@������́@�ǂ��ɂ��Ȃ��Ɓ@������߂����H
		//-----------------------------------------------
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_DAGUJAGARUMA");
		ShowMsg_("DEMO_827_MSG_030");
		KeyInputWait_();
		
		//-----------------------------------------------
		// �u����Ƃ��@�܂����c�c������x�@�킦��
		// �@���Ă�ȂǂƁ@�v���Ă���̂ł́@����܂��ȁH
		//-----------------------------------------------
		ShowMsg_("DEMO_827_MSG_040");
		KeyInputWait_();
		
		SetMotion_(galma, MOT_SPELL_START, 16);
		local task_gal = Task_ChangeMotion_(galma, MOT_SPELL_CHARGE, 16);
		
		//-----------------------------------------------
		// �u���̃_�[�X�K���}�́@�`�J���Ƌ��|��
		// �@�n���̖�ԂɁ@�`���邪�����I
		//-----------------------------------------------
		ShowMsg_("DEMO_827_MSG_050");
		KeyInputWait_();
		CloseMsgWnd_();
		//===============================================
	}
	
	Wait_(15);
	if(flg <= 1){
		SetMotion_(galma, MOT_SWORD_ACTUATE, 32);
		PlaySE_("SE_DEM_210");
		Wait_(28);
	}
	
	if(flg == 2){
		SetMotion_(galma, MOT_SPELL_ACTUATE, 32);
		Wait_(32);
		PlaySE_("SE_SKL_020");
	}
	
	if(flg == 3){
		SetMotion_(galma, galma_spell_actuate, BLEND_XL);
		PlaySE_("SE_DEM_223");
		SetMotionSpeed_(galma, 0.5);
		Wait_(20);
		SetMotionSpeed_(galma, 0.3);
		Wait_(45);
		SetMotionSpeed_(galma, 1.0);
		Wait_(10);
	
		StartDecayEarthQuake_(15, 3, 15);
		Wait_(15);
	
		SetMotionSpeed_(galma, 0.1);
		StopBgm_(BGM_STOP_DEF);
		local task = Task_EncountEffect_(ENCOUNT_BOSS);
		WaitTask(task);
		DeleteAllTask_();
		End_();
	}else{
		EncountEndDemo(ENCOUNT_BOSS);
	}
}
