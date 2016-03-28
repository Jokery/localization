// �A���U���i����j

// ������
function Init()
{
	DebugPrint("BATTLE029_function_Init")
	BattleCommon_Init();
	local attack1 = GetActorIndex_(0);
	local attack2 = GetActorIndex_(1);
	local attack3 = GetActorIndex_(2);
	local attack4 = GetActorIndex_(3);
	local target = GetTargetIndex_(0,0);
	gAttackNum <- GetActionNum_();
	gMultiCount <- 0;
	gMultistagecount <- 0;
	cAction <- cActionInfo(gMultiCount)

	
	//�s���҂��Q��
	if(gAttackNum >= 2){
		gAttack1Size <- GetMonsterSize_(attack1);
		gAttack2Size <- GetMonsterSize_(attack2);
	} else {}
	//�s���҂��R��
	if(gAttackNum >= 3){
		gAttack3Size <- GetMonsterSize_(attack3);
	} else {}
	//�s���҂��S��
	if(gAttackNum >= 4){
		gAttack4Size <- GetMonsterSize_(attack4);
	} else {}
	
	SetMotion_(target, MOT_WAIT, 0);
	
	LoadEffect_("EF000_01_MAGIC_ARIA");
	LoadEffect_("EF000_03_SHUCHUSEN");
	LoadEffect();
}

// �X�V
function Update()
{
	DebugPrint("BATTLE029_function_Update")
	//�s���Ґ��E�T�C�Y����
	local attack1 = GetActorIndex_(0);
	local attack2 = GetActorIndex_(1);
	local attack3 = GetActorIndex_(2);
	local attack4 = GetActorIndex_(3);
	local target = GetTargetIndex_(0,0);
	
	//�T�C�Y���̓t���O
	local SFlag = false;
	local MFlag = false;
	local GFlag = false;
	
	//�s���҂��Q��
	if(gAttackNum == 2){
		if(gAttack1Size == SIZE_S){SFlag = true;}
		if(gAttack2Size == SIZE_S){SFlag = true;}
		if(gAttack1Size == SIZE_M){MFlag = true;}
		if(gAttack2Size == SIZE_M){MFlag = true;}
		if(gAttack1Size == SIZE_G){GFlag = true;}
		if(gAttack2Size == SIZE_G){GFlag = true;}
	//�s���҂��R��
	} else if(gAttackNum == 3){
		if(gAttack1Size == SIZE_S){SFlag = true;}
		if(gAttack2Size == SIZE_S){SFlag = true;}
		if(gAttack3Size == SIZE_S){SFlag = true;}
		if(gAttack1Size == SIZE_M){MFlag = true;}
		if(gAttack2Size == SIZE_M){MFlag = true;}
		if(gAttack3Size == SIZE_M){MFlag = true;}
		if(gAttack1Size == SIZE_G){GFlag = true;}
		if(gAttack2Size == SIZE_G){GFlag = true;}
		if(gAttack3Size == SIZE_G){GFlag = true;}
	//�s���҂��S��
	} else {
		if(gAttack1Size == SIZE_S){SFlag = true;}
		if(gAttack2Size == SIZE_S){SFlag = true;}
		if(gAttack3Size == SIZE_S){SFlag = true;}
		if(gAttack4Size == SIZE_S){SFlag = true;}
		if(gAttack1Size == SIZE_M){MFlag = true;}
		if(gAttack2Size == SIZE_M){MFlag = true;}
		if(gAttack3Size == SIZE_M){MFlag = true;}
		if(gAttack4Size == SIZE_M){MFlag = true;}
		if(gAttack1Size == SIZE_G){GFlag = true;}
		if(gAttack2Size == SIZE_G){GFlag = true;}
		if(gAttack3Size == SIZE_G){GFlag = true;}
		if(gAttack4Size == SIZE_G){GFlag = true;}
	}
	
	// �J�����ݒ�
	local CameraStartFrame = 0;
	if(gAttackNum == 4){
		CameraStartFrame = 0;
	} else if(gAttackNum == 3){
		CameraStartFrame = 15;
	} else if(gAttackNum == 2){
		CameraStartFrame = 30;
	}
	if(MFlag != true){
		Task_SetFrameAnimeMoveCamera_("camera_000" , "camtgt_000",CameraStartFrame);
	} else {
		Task_SetFrameAnimeMoveCamera_("camera_001" , "camtgt_001",CameraStartFrame);
	}
	
	if(gAttackNum == 4){
		S4Action(attack1,attack2,attack3,attack4,target);	//�r�S�̍\��
	}
	else if(gAttackNum == 3 && MFlag == false ){
		S3Action(attack1,attack2,attack3,target);			//�r�R�̍\��
	}
	else if(gAttackNum == 3 && MFlag == true ){
		S2M1Action(attack1,attack2,attack3,target);			//�r�Q�́{�l�P�̍\��
	}
	else if(gAttackNum == 2 && MFlag == false ){
		S2Action(attack1,attack2,target);					//�r�Q�̍\��
	}
	else if(gAttackNum == 2 && SFlag == true && MFlag == true ){
		S1M1Action(attack1,attack2,target);					//�r�P�́{�l�P�̍\��
	}
	else if(gAttackNum == 2 && SFlag == false && MFlag == true ){
		M2Action(attack1,attack2,target);					//�l�Q�̍\��
	}
	else{
		//�for�s�P�̍\��
	}
	
	
	
	ContinuationMagic(gMultiCount,gMultistagecount);
	BatteleScript_End();
}
function S4Action(attack1,attack2,attack3,attack4,target)	//�r�S�̍\��
{
	DebugPrint("BATTLE029_function_S4Action")
	
	// �L�����ݒ�
	if(gAttackNum >= 2){
		Task_AnimeMoveCharNoDir_(attack1, "move_015_S01S4target");
		Task_AnimeMoveCharNoDir_(attack2, "move_016_S01S4target");
	}
	if(gAttackNum >= 3){
		Task_AnimeMoveCharNoDir_(attack3, "move_017_S01S4target");
	}
	if(gAttackNum >= 4){
		Task_AnimeMoveCharNoDir_(attack4, "move_018_S01S4target");
	}
	SetVisible_(attack2, true);
	SetVisible_(attack3, true);
	SetVisible_(attack4, true);
	SetVisible_(target, false);
	SetDir_(attack1, 90);
	SetDir_(attack2, 90);
	SetDir_(attack3, 90);
	SetDir_(attack4, 90);
	
	if(gAttackNum >= 4){
		// ��l�ډr���J�n
		SetMotion_(attack4, MOT_PARTICULAR_START, 4);
		SetBoneEffect_("EF000_01_MAGIC_ARIA", attack4);
		//ReplaySE_("SE_SHA_002");
		
		Wait_(5);
		SetCameraEffect_("EF000_03_SHUCHUSEN", 100);
		
		Wait_(10);
	} else if(gAttackNum >= 3){
		// ��l�ډr���J�n
		SetMotion_(attack3, MOT_PARTICULAR_START, 4);
		SetMotion_(attack4, MOT_PARTICULAR_CHANT, 4);
		SetBoneEffect_("EF000_01_MAGIC_ARIA", attack3);
		////ReplaySE_("SE_SHA_002");
		
		Wait_(5);
		SetCameraEffect_("EF000_03_SHUCHUSEN", 100);
		
		Wait_(10);
	} else if(gAttackNum >= 2){
		// �O�l�ډr���J�n
		SetMotion_(attack2, MOT_PARTICULAR_START, 4);
		SetMotion_(attack3, MOT_PARTICULAR_CHANT, 4);
		SetBoneEffect_("EF000_01_MAGIC_ARIA", attack2);
		//ReplaySE_("SE_SHA_002");
		
		Wait_(5);
		SetCameraEffect_("EF000_03_SHUCHUSEN", 100);
		
		Wait_(10);
	}
	// �l�l�ډr���J�n
	SetMotion_(attack1, MOT_PARTICULAR_START, 4);
	SetMotion_(attack2, MOT_PARTICULAR_CHANT, 4);
	SetBoneEffect_("EF000_01_MAGIC_ARIA", attack1);
	//ReplaySE_("SE_SHA_002");
	
	Wait_(5);
	SetCameraEffect_("EF000_03_SHUCHUSEN", 100);
	
	Wait_(10);
	
	// �S������
	SetMotion_(attack1, MOT_PARTICULAR_EXERCISE, 4);
	SetMotion_(attack2, MOT_PARTICULAR_EXERCISE, 4);
	SetMotion_(attack3, MOT_PARTICULAR_EXERCISE, 4);
	SetMotion_(attack4, MOT_PARTICULAR_EXERCISE, 4);
	
	Wait_(45);
	
}
function S3Action(attack1,attack2,attack3,target)	//�r�R�̍\��
{
	DebugPrint("BATTLE029_function_S3Action")
	// �J�����ݒ�
	//Task_AnimeMoveCamera_("camera_000" , "camtgt_000");
	
	// �L�����ݒ�
	Task_AnimeMoveCharNoDir_(attack1, "move_015_S01S4target");
	Task_AnimeMoveCharNoDir_(attack2, "move_016_S01S4target");
	Task_AnimeMoveCharNoDir_(attack3, "move_017_S01S4target");
	SetVisible_(attack2, true);
	SetVisible_(attack3, true);
	SetVisible_(target, false);
	SetDir_(attack1, 90);
	SetDir_(attack2, 90);
	SetDir_(attack3, 90);
	
//	Skip_(15)
	
	// ��l�ډr���J�n
	SetMotion_(attack3, MOT_PARTICULAR_START, 4);
	SetBoneEffect_("EF000_01_MAGIC_ARIA", attack3);
	ReplaySE_("SE_SHA_002");
	
	Wait_(5);
	SetCameraEffect_("EF000_03_SHUCHUSEN", 100);
	
	Wait_(10);
	
	// �O�l�ډr���J�n
	SetMotion_(attack2, MOT_PARTICULAR_START, 4);
	SetMotion_(attack3, MOT_PARTICULAR_CHANT, 4);
	SetBoneEffect_("EF000_01_MAGIC_ARIA", attack2);
	ReplaySE_("SE_SHA_002");
	
	Wait_(5);
	SetCameraEffect_("EF000_03_SHUCHUSEN", 100);
	
	Wait_(10);
	
	// �l�l�ډr���J�n
	SetMotion_(attack1, MOT_PARTICULAR_START, 4);
	SetMotion_(attack2, MOT_PARTICULAR_CHANT, 4);
	SetBoneEffect_("EF000_01_MAGIC_ARIA", attack1);
	ReplaySE_("SE_SHA_002");
	
	Wait_(5);
	SetCameraEffect_("EF000_03_SHUCHUSEN", 100);
	
	Wait_(10);
	
	// �S������
	SetMotion_(attack1, MOT_PARTICULAR_EXERCISE, 4);
	SetMotion_(attack2, MOT_PARTICULAR_EXERCISE, 4);
	SetMotion_(attack3, MOT_PARTICULAR_EXERCISE, 4);
	
	Wait_(45);
}
function S2M1Action(attack1,attack2,attack3,target)	//�r�Q�́{�l�P�̍\��
{
	DebugPrint("BATTLE029_function_S2M1Action")
	// �J�����ݒ�
	//Task_AnimeMoveCamera_("camera_001" , "camtgt_001");
	
	// �L�����ݒ�
	Task_AnimeMoveCharNoDir_(attack1, "move_023_S07G1master");
	Task_AnimeMoveCharNoDir_(attack2, "move_024_S07G1target");
	Task_AnimeMoveCharNoDir_(attack3, "move_025_S07G1target");
	SetVisible_(attack2, true);
	SetVisible_(attack3, true);
	SetVisible_(target, false);
	SetDir_(attack1, 90);
	SetDir_(attack2, 90);
	SetDir_(attack3, 90);
	
//	Skip_(15)
	
	// ��l�ډr���J�n
	SetMotion_(attack3, MOT_PARTICULAR_START, 4);
	SetBoneEffect_("EF000_01_MAGIC_ARIA", attack3);
	ReplaySE_("SE_SHA_002");
	
	Wait_(5);
	SetCameraEffect_("EF000_03_SHUCHUSEN", 100);
	
	Wait_(10);
	
	// �O�l�ډr���J�n
	SetMotion_(attack2, MOT_PARTICULAR_START, 4);
	SetMotion_(attack3, MOT_PARTICULAR_CHANT, 4);
	SetBoneEffect_("EF000_01_MAGIC_ARIA", attack2);
	ReplaySE_("SE_SHA_002");
	
	Wait_(5);
	SetCameraEffect_("EF000_03_SHUCHUSEN", 100);
	
	Wait_(10);
	
	// �l�l�ډr���J�n
	SetMotion_(attack1, MOT_PARTICULAR_START, 4);
	SetMotion_(attack2, MOT_PARTICULAR_CHANT, 4);
	SetBoneEffect_("EF000_01_MAGIC_ARIA", attack1);
	ReplaySE_("SE_SHA_002");
	
	Wait_(5);
	SetCameraEffect_("EF000_03_SHUCHUSEN", 100);
	
	Wait_(15);
	
	// �S������
	SetMotion_(attack1, MOT_PARTICULAR_EXERCISE, 4);
	SetMotion_(attack2, MOT_PARTICULAR_EXERCISE, 4);
	SetMotion_(attack3, MOT_PARTICULAR_EXERCISE, 4);
	
	Wait_(70);
}
function S2Action(attack1,attack2,target)	//�r�Q�̍\��
{
	DebugPrint("BATTLE029_function_S2Action")
	// �J�����ݒ�
	//Task_AnimeMoveCamera_("camera_000" , "camtgt_000");
	
	// �L�����ݒ�
	Task_AnimeMoveCharNoDir_(attack1, "move_015_S01S4target");
	Task_AnimeMoveCharNoDir_(attack2, "move_016_S01S4target");
	SetVisible_(attack2, true);
	SetVisible_(target, false);
	SetDir_(attack1, 90);
	SetDir_(attack2, 90);
	
//	Skip_(30)
	
	// �O�l�ډr���J�n
	SetMotion_(attack2, MOT_PARTICULAR_START, 4);
	SetBoneEffect_("EF000_01_MAGIC_ARIA", attack2);
	ReplaySE_("SE_SHA_002");
	
	Wait_(5);
	SetCameraEffect_("EF000_03_SHUCHUSEN", 100);
	
	Wait_(10);
	
	// �l�l�ډr���J�n
	SetMotion_(attack1, MOT_PARTICULAR_START, 4);
	SetMotion_(attack2, MOT_PARTICULAR_CHANT, 4);
	SetBoneEffect_("EF000_01_MAGIC_ARIA", attack1);
	ReplaySE_("SE_SHA_002");
	
	Wait_(5);
	SetCameraEffect_("EF000_03_SHUCHUSEN", 100);
	
	Wait_(10);
	
	// �S������
	SetMotion_(attack1, MOT_PARTICULAR_EXERCISE, 4);
	SetMotion_(attack2, MOT_PARTICULAR_EXERCISE, 4);
	
	Wait_(45);
}
function S1M1Action(attack1,attack2,target)	//�r�P�́{�l�P�̍\��
{
	DebugPrint("BATTLE029_function_S1M1Action")
	// �J�����ݒ�
	//Task_AnimeMoveCamera_("camera_001" , "camtgt_001");
	
	// �L�����ݒ�
	Task_AnimeMoveCharNoDir_(attack1, "move_023_S07G1master");
	Task_AnimeMoveCharNoDir_(attack2, "move_024_S07G1target");
	SetVisible_(attack2, true);
	SetVisible_(target, false);
	SetDir_(attack1, 90);
	SetDir_(attack2, 90);
	
//	Skip_(30)
	
	// �O�l�ډr���J�n
	SetMotion_(attack2, MOT_PARTICULAR_START, 4);
	SetBoneEffect_("EF000_01_MAGIC_ARIA", attack2);
	ReplaySE_("SE_SHA_002");
	
	Wait_(5);
	SetCameraEffect_("EF000_03_SHUCHUSEN", 100);
	
	Wait_(10);
	
	// �l�l�ډr���J�n
	SetMotion_(attack1, MOT_PARTICULAR_START, 4);
	SetMotion_(attack2, MOT_PARTICULAR_CHANT, 4);
	SetBoneEffect_("EF000_01_MAGIC_ARIA", attack1);
	ReplaySE_("SE_SHA_002");
	
	Wait_(5);
	SetCameraEffect_("EF000_03_SHUCHUSEN", 100);
	
	Wait_(15);
	
	// �S������
	SetMotion_(attack1, MOT_PARTICULAR_EXERCISE, 4);
	SetMotion_(attack2, MOT_PARTICULAR_EXERCISE, 4);
	
	Wait_(70);
}
function M2Action(attack1,attack2,target)	//�l�Q�̍\��
{
	DebugPrint("BATTLE029_function_M2Action")
	// �J�����ݒ�
	//Task_AnimeMoveCamera_("camera_001" , "camtgt_001");
	
	// �L�����ݒ�
	Task_AnimeMoveCharNoDir_(attack1, "move_023_S07G1master");
	Task_AnimeMoveCharNoDir_(attack2, "move_024_S07G1target");
	SetVisible_(attack2, true);
	SetVisible_(target, false);
	SetDir_(attack1, 90);
	SetDir_(attack2, 90);
	
//	Skip_(30)
	
	// �O�l�ډr���J�n
	SetMotion_(attack2, MOT_PARTICULAR_START, 4);
	SetBoneEffect_("EF000_01_MAGIC_ARIA", attack2);
	ReplaySE_("SE_SHA_002");
	
	Wait_(5);
	SetCameraEffect_("EF000_03_SHUCHUSEN", 100);
	
	Wait_(10);
	
	// �l�l�ډr���J�n
	SetMotion_(attack1, MOT_PARTICULAR_START, 4);
	SetMotion_(attack2, MOT_PARTICULAR_CHANT, 4);
	SetBoneEffect_("EF000_01_MAGIC_ARIA", attack1);
	ReplaySE_("SE_SHA_002");
	
	Wait_(5);
	SetCameraEffect_("EF000_03_SHUCHUSEN", 100);
	
	Wait_(15);
	
	// �S������
	SetMotion_(attack1, MOT_PARTICULAR_EXERCISE, 4);
	SetMotion_(attack2, MOT_PARTICULAR_EXERCISE, 4);
	
	Wait_(70);
}
