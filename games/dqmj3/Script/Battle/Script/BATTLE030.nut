//���C�h�A�g

// ������
function Init()
{
	DebugPrint("BATTLE030_function_Init")
	BattleCommon_Init();
	//�O���[�o���ϐ��̒�`
	gAttack <- GetActorIndex_(0);			//�U�������X�^�[�̑I�o
	gAttackSize <- GetMonsterSize_(gAttack);
	gTarget <- GetTargetIndex_(0,0);		//�Ώۃ����X�^�[�̑I�o
	gTargetSize <- GetMonsterSize_(gTarget);
	//gPartyNum <- GetRideAttackMemberNum_();	//�s���҈ȊO�̃p�[�e�B��
	gPartyNum <- 0;
	////DebugPrint(("RideAttackgPartyNum	: " + gPartyNum + "\n")
	gPartyIndex <- [];
	for(local i = 0 ; i < gPartyNum ; i++){
		gPartyIndex.append(GetRideAttackMemberMonster_(i))
	}
	gPartySize 	<- [];
	gSFlag <- false;							//�p�[�e�B�����X�^�[�̃T�C�Y����p
	gNFlag <- false;
	gMFlag <- false;
	gGFlag <- false;
	gTFlag <- false;
	gAttackTask <- null;
	gTargetTask <- null;
	gCameraTask <- null;
	
	cAction <- cActionInfo(0);
	Debug_cActionPrint(cAction)
	ChangeIndexPointData_(PERSONAL_POINT_DATA);
	
	gPartyTask <- [];	//Index���ƂɊi�[
	gMultiCount <- 0;
	gMultiStageCount <- 0;
	//�N���X�̃��[�h
	cAction <- cActionInfo(gMultiCount);

	gAttackEmpty			<- [];
	gTargetEmpty			<- [];
	gPartyEmpty			<- [];		//gPartyEmpty�͂Q�����z���
									//�EIndex
									//	=>�ECutNumber
	gCameraEmpty			<- [];
	gCameragTargetEmpty	<- [];
	
	for(local i = 0 ; i < gPartyNum ; i++){
		if(gPartyIndex[i] == INVALID_CHARACTER){
			local Size = GetMonsterSize_(Party[i])
			gPartySize.append(Size)
			if(gPartySize[i] == SIZE_S){gSFlag = true;}
			if(gPartySize[i] == SIZE_N){gNFlag = true;}
			if(gPartySize[i] == SIZE_M){gMFlag = true;}
			if(gPartySize[i] == SIZE_G){gGFlag = true;}
			if(gPartySize[i] == SIZE_T){gTFlag = true;}
		}
	}
	
	LoadEffect();
	LoadEffect_("EF000_01_MAGIC_ARIA");
	LoadEffect_("EF010_04_BOKOSUKA");
	LoadEffect_("EF010_06_BOKOSUKA");
	LoadEffect_("EF010_05_EXPLOSION");
	LoadEffect_("EF010_01_HIT");
	
	//�ΐ푊�葤�̃}�X�^�[�����C�h����Ȃ��ꍇ�̓}�X�^�[���\���ɂ���
	local cTargetParty = cFullPartyInfo(gTarget)
	if(cTargetParty.IsPartyRide == false){
		SetVisible_(cTargetParty.MasterIndex,false)
	}
	
}

// �X�V
function Update()
{
	DebugPrint("BATTLE030_function_Update")
	
	Exception_1stCheck(0, true, cAction);
	
	local CutNumber = 0;		//�J�b�g�ԍ��Ǘ��p
	RideCombo_EmptyEdit();
	
	RideCombo_ParamEdit();
	
	//�V�[���̗���
	Cut00(CutNumber);
	CutNumber = CutChange(CutNumber);
	//Cut01(CutNumber);
	CutNumber = CutChange(CutNumber);
	Cut02_2(CutNumber);
	CutNumber = CutChange(CutNumber);
	//Cut03_02(CutNumber);
	CutNumber = CutChange(CutNumber);
	Cut04_02(CutNumber);
	// ����񕜗p���A���o
	if(IsRezaoral_(gMultiCount, 0)){
		CharaStand("Target", true, gMultiCount, cAction);
		SetAlpha_(gTarget, 0.0);
		SetDamageEffect_ExceptionEffect(gMultiCount, cAction);
	}
	SetApealPoint_Init(true)
	BatteleScript_End();
}

//================================================================================
//�J�b�g�O�E�J�b�g�C��
function Cut00(CutNumber)
{
	DebugPrint("BATTLE030_function_Cut00")
	DebugPrint("	=>	:	CutNumber");
	
	ReplaySE_("SE_BTL_168");
	
	//�U���E�Ώۂ̗������X�^�[����U��\���ɂ���
	SetVisible_(gTarget, false);
	SetVisible_(gAttack, false);
	
	Gosign(CUTIN_RIDE_LINK);
	ChangeIndexPointData_(PERSONAL_POINT_DATA);
}

//================================================================================
//�J�b�g�P�E�{�R�X�J	1	=>	200F
//		�c��̃p�[�e�B�\���ɉ����ĕ\�����@��ω�
//		�v���C���[���͂ނ悤�ɉ���|����

function Cut01(CutNumber)
{
	DebugPrint("BATTLE030_function_Cut01")
	DebugPrint("	=>	:	CutNumber");
	local StartFrame = gCutStartFrame[CutNumber]
	//�J�����E�L�����ނ̃^�X�N�̐ݒ�
	SetVisible_(gAttack, false);
	SetVisible_(gTarget, true);
	gCameraTask = Task_AnimeMoveCamera_(gCameraEmpty[CutNumber], gCameragTargetEmpty[CutNumber] );
	gTargetTask = Task_AnimeMoveCharNoDir_(gTarget , gTargetEmpty[CutNumber])
	
	SetVisible_(gAttack, false);
	SetVisible_(gTarget, true);
	SetMotion_(gTarget, MOT_WAIT, 4);
	SetDir_(gTarget, 150);
	
	local Effect = [];
	
	//�p�[�e�B�����o�[�ɉ����āA�o��L��������ύX
	for(local i = 0 ; i < gPartyNum ; i++){
		gPartyTask.append(Task_AnimeMoveChar_(gPartyIndex[i] , gPartyEmpty[i][CutNumber]))
		SetVisible_(gPartyIndex[i] , true);
		SetMotion_(gPartyIndex[i] , MOT_MOVE_LOOP, 4);
		Effect.append(EffParamSizeEffect(gPartyIndex[i],"EF000_14_SMOKE_FOOT"))
	}
	
	
	Wait_(10);	
	local SmokeEffect = SetPointWorldEffect_("EF010_04_BOKOSUKA", "pos_002_EffectBokosukaSM");
	if(gTargetSize == SIZE_S){
		SetEffectScale_(SmokeEffect , 0.6);
	} else if(gTargetSize == SIZE_N){
		SetEffectScale_(SmokeEffect , 0.8);
	} else if(gTargetSize == SIZE_M){
		SetEffectScale_(SmokeEffect , 1.2);
	} else if(gTargetSize == SIZE_G){
		SetEffectScale_(SmokeEffect , 1.0);
	} else if(gTargetSize == SIZE_T){
		SetEffectScale_(SmokeEffect , 3.0);
	}
	//SetMotion_(gPartyIndex[0] , MOT_ATTACK, 4);
	ReplaySE_("SE_BTL_169");
	SetMotion_(gTarget, MOT_DAMAGE, 4);
	Wait_(20);
	SetMotion_(gTarget, MOT_DAMAGE, 4);
	Wait_(10);
	SetMotion_(gTarget, MOT_DAMAGE, 4);
	Wait_(20);
	DeleteEffect_(SmokeEffect);
	for(local i = 0 ; i < Effect.len() ; i++){
		DeleteEffect_(Effect[i])
	}

}

//�J�b�g�Q�i�{�R�X�J���ɓ˂�����ł����j	201	=>	400F
function Cut02(CutNumber)
{
	DebugPrint("BATTLE030_function_Cut02")
	DebugPrint("	=>	CutNumber	: " + CutNumber);
	//�J�����E�L�����ނ̃^�X�N�̐ݒ�
	
	SetVisible_(gAttack, true);
	SetVisible_(gTarget, true);
	gCameraTask = Task_SetFrameAnimeMoveCharNoDir_(gCameraEmpty[CutNumber], gCameragTargetEmpty[CutNumber],30);
	gAttackTask = Task_SetFrameAnimeMoveCharNoDir_(gAttack, gAttackEmpty[CutNumber], 30);
	gTargetTask = Task_SetFrameAnimeMoveCharNoDir_(gTarget, gTargetEmpty[CutNumber], 30);
	
	//�p�[�e�B�����o�[�ɉ����āA��\���L������ύX
	for(local i = 0 ; i < gPartyNum ; i++){
		SetVisible_(gPartyIndex[i] , false);
	}
	
	local SmokeEffect = null;
	
	//�P�̂̂Ƃ��̓{�R�X�J�G�t�F�N�g�Ȃ�
	if(gPartyNum == 0){
		//�{�R�X�J�G�t�F�N�g�Ȃ�
		SetVisible_(gTarget, true);
	} else {
		/*SmokeEffect = SetPointWorldEffect_("EF010_06_BOKOSUKA", "pos_001_EffectCenter");
		SetEffectScale_(SmokeEffect, 1.0);
		SetVisible_(gTarget, false);*/
	}
	
	SetDir_(gAttack, 180);
	SetDir_(gTarget, 0);
	SetMotion_(gTarget, MOT_WAIT, 4);
	SetMotion_(gAttack, MOT_MOVE_LOOP, 0);
	local SandEffect = EffParamSizeEffect(gAttack,"EF000_14_SMOKE_FOOT")
	SetMotionStepFrame_(gAttack, 0.5);
	SetMonsterPlayMoveSE_(gAttack,false);
	Wait_(19)
	local CameraEffect = SetCameraEffect_("EF000_03_SHUCHUSEN", 100);
	//Wait_(15);
	Wait_(15);
	DeleteEffect_(CameraEffect)
	if(SmokeEffect != null){
		DeleteEffect_(SmokeEffect)
	}
	DeleteEffect_(SandEffect)
	Wait_(15);
}

//�J�b�g�Q�i�{�R�X�J���ɓ˂�����ł����j	201	=>	400F
function Cut02_2(CutNumber)
{
	DebugPrint("BATTLE030_function_Cut02")
	DebugPrint("	=>	CutNumber	: " + CutNumber);
	//�J�����E�L�����ނ̃^�X�N�̐ݒ�
	
	SetVisible_(gAttack, true);
	SetVisible_(gTarget, true);
	//gCameraTask = Task_SetFrameAnimeMoveCamera_(gCameraEmpty[CutNumber], gCameragTargetEmpty[CutNumber],10);
	
	//�p�[�e�B�����o�[�ɉ����āA��\���L������ύX
	for(local i = 0 ; i < gPartyNum ; i++){
		SetVisible_(gPartyIndex[i] , false);
	}
	
	local SmokeEffect = null;
	
	//�P�̂̂Ƃ��̓{�R�X�J�G�t�F�N�g�Ȃ�
	if(gPartyNum == 0){
		//�{�R�X�J�G�t�F�N�g�Ȃ�
		SetVisible_(gTarget, true);
	} else {
		/*SmokeEffect = SetPointWorldEffect_("EF010_06_BOKOSUKA", "pos_001_EffectCenter");
		SetEffectScale_(SmokeEffect, 1.0);
		SetVisible_(gTarget, false);*/
	}
	
	//�s���҂̃T�C�Y�ɂ���ď����𕪊�
	if(gAttackSize == SIZE_S || gAttackSize == SIZE_N || gAttackSize == SIZE_M){
		//�r�E�m�E�l�T�C�Y
		gAttackTask = Task_SetFrameAnimeMoveCharNoDir_(gAttack, gAttackEmpty[CutNumber], 10);
		gTargetTask = Task_SetFrameAnimeMoveCharNoDir_(gTarget, gTargetEmpty[CutNumber], 10);
		
		gCameraTask = Task_SetFrameAnimeMoveCamera_(gCameraEmpty[CutNumber], gCameragTargetEmpty[CutNumber],10);
		SetDir_(gAttack, 180);
		SetDir_(gTarget, 0);
		SetMotion_(gAttack, MOT_WAIT, 4);
		SetMotion_(gTarget, MOT_WAIT, 4);
		//SetMotion_(gAttack, MOT_MOVE_LOOP, 4);
		SetMotion_(gAttack, MOT_SWORD_START, 0);
		local SandEffect = EffParamSizeEffect(gAttack,"EF000_14_SMOKE_FOOT")
		SetMotionStepFrame_(gAttack, 2.0);
		SetMonsterPlayMoveSE_(gAttack,false);
		Wait_(10)
		SetMotion_(gAttack, MOT_SWORD_EXERCISE, 4);
		local CameraEffect = SetCameraEffect_("EF000_03_SHUCHUSEN", 100);
		Wait_(10);
		DeleteEffect_(CameraEffect)
		if(SmokeEffect != null){
			DeleteEffect_(SmokeEffect)
		}
		DeleteEffect_(SandEffect)
	} else if(gAttackSize == SIZE_G) {
		//�f�T�C�Y
		switch(MonsterHightCheck(gAttack))
		{
		case "Low":
			DeleteAllTask_()
			//gCameraTask = Task_SetFrameAnimeMoveCamera_(gCameraEmpty[CutNumber], gCameragTargetEmpty[CutNumber],10);
			print("Low" + "\n")
			print("gCameraEmpty[CutNumber]		: " + gCameraEmpty[CutNumber] + "\n")
			print("gCameragTargetEmpty[CutNumber]	: " + gCameragTargetEmpty[CutNumber] + "\n")
			print("gAttackEmpty[CutNumber]		: " + gAttackEmpty[CutNumber] + "\n")
			print("gTargetEmpty[CutNumber]		: " + gTargetEmpty[CutNumber] + "\n")
			gCameraTask = Task_SetFrameAnimeMoveCamera_(gCameraEmpty[CutNumber], gCameragTargetEmpty[CutNumber],10);
			gAttackTask = Task_AnimeMoveCharNoDir_(gAttack, gAttackEmpty[CutNumber]);
			gTargetTask = Task_AnimeMoveCharNoDir_(gTarget, gTargetEmpty[CutNumber]);
			StartEarthQuake_(35, 5, 3);
			break;
		case "Middle":
			DeleteAllTask_()
			//gCameraTask = Task_SetFrameAnimeMoveCamera_(gCameraEmpty[CutNumber], gCameragTargetEmpty[CutNumber],10);
			gCameraTask = Task_AnimeMoveCamera_(gCameraEmpty[CutNumber], gCameragTargetEmpty[CutNumber]);
			gAttackTask = Task_AnimeMoveCharNoDir_(gAttack, gAttackEmpty[CutNumber]);
			gTargetTask = Task_AnimeMoveCharNoDir_(gTarget, gTargetEmpty[CutNumber]);
			StartEarthQuake_(35, 5, 3);
			print("Middle" + "\n")
			print("gCameraEmpty[CutNumber]		: " + gCameraEmpty[CutNumber] + "\n")
			print("gCameragTargetEmpty[CutNumber]	: " + gCameragTargetEmpty[CutNumber] + "\n")
			print("gAttackEmpty[CutNumber]		: " + gAttackEmpty[CutNumber] + "\n")
			print("gTargetEmpty[CutNumber]		: " + gTargetEmpty[CutNumber] + "\n")
			break;
		case "High":
			DeleteAllTask_()
			//gCameraTask = Task_SetFrameAnimeMoveCamera_(gCameraEmpty[CutNumber], gCameragTargetEmpty[CutNumber],10);
			gCameraTask = Task_AnimeMoveCamera_(gCameraEmpty[CutNumber], gCameragTargetEmpty[CutNumber]);
			gAttackTask = Task_AnimeMoveCharNoDir_(gAttack, gAttackEmpty[CutNumber]);
			gTargetTask = Task_AnimeMoveCharNoDir_(gTarget, gTargetEmpty[CutNumber]);
			StartEarthQuake_(35, 5, 3);
			print("High" + "\n")
			print("gCameraEmpty[CutNumber]		: " + gCameraEmpty[CutNumber] + "\n")
			print("gCameragTargetEmpty[CutNumber]	: " + gCameragTargetEmpty[CutNumber] + "\n")
			print("gAttackEmpty[CutNumber]		: " + gAttackEmpty[CutNumber] + "\n")
			print("gTargetEmpty[CutNumber]		: " + gTargetEmpty[CutNumber] + "\n")
			break;
		default:
			break;
		}
		
		//�i�f�T�C�Y�̏ꍇ�́A�A���O���������̂ŁA���T�C�Y��Ώێ҃T�C�Y�ɂ���ĕς���
		if(SmokeEffect != null){
			switch(gTargetSize)
			{
			case SIZE_S:
			case SIZE_N:
			case SIZE_M:
				SetEffectScale_(SmokeEffect, 1.0);
				break;
			case SIZE_G:
				SetEffectScale_(SmokeEffect, 2.0);
				break;
			case SIZE_T:
				SetEffectScale_(SmokeEffect, 2.0);
				break;
			default:
				break;
			}
		}
		SetDir_(gAttack, 180);
		SetDir_(gTarget, 0);
		SetMotion_(gTarget, MOT_WAIT, 4);
		
		SetMotion_(gAttack, MOT_SWORD_START, 0);
		local SandEffect = EffParamSizeEffect(gAttack,"EF000_14_SMOKE_FOOT")
		Wait_(35);
		if(SmokeEffect != null){
			DeleteEffect_(SmokeEffect)
		}
		DeleteEffect_(SandEffect)
	} else if(gAttackSize == SIZE_T){
		//�s�T�C�Y
		
		switch(MonsterHightCheck(gAttack))
		{
		case "Low":
			gCameraEmpty[CutNumber]			= "camera_Cut02_2_251_TtoSNMGT_LOW"
			gCameragTargetEmpty[CutNumber]	= "camtgt_Cut02_2_251_TtoSNMGT_LOW"
			gCameraTask = Task_AnimeMoveCamera_(gCameraEmpty[CutNumber], gCameragTargetEmpty[CutNumber]);
			gAttackTask = Task_AnimeMoveCharNoDir_(gAttack, gAttackEmpty[CutNumber]);
			gTargetTask = Task_AnimeMoveCharNoDir_(gTarget, gTargetEmpty[CutNumber]);
			StartEarthQuake_(15, 5, 10);
			print("gCameraEmpty[CutNumber]			: " + gCameraEmpty[CutNumber] + "\n")
			print("gCameragTargetEmpty[CutNumber]	: " + gCameragTargetEmpty[CutNumber] + "\n")
			print("gAttackEmpty[CutNumber]	: " + gAttackEmpty[CutNumber] + "\n")
			print("gTargetEmpty[CutNumber]	: " + gTargetEmpty[CutNumber] + "\n")
			break;
		case "Middle":
			gCameraTask = Task_AnimeMoveCamera_(gCameraEmpty[CutNumber], gCameragTargetEmpty[CutNumber]);
			gAttackTask = Task_AnimeMoveCharNoDir_(gAttack, gAttackEmpty[CutNumber]);
			gTargetTask = Task_AnimeMoveCharNoDir_(gTarget, gTargetEmpty[CutNumber]);
			print("gCameraEmpty[CutNumber]			: " + gCameraEmpty[CutNumber] + "\n")
			print("gCameragTargetEmpty[CutNumber]	: " + gCameragTargetEmpty[CutNumber] + "\n")
			print("gAttackEmpty[CutNumber]	: " + gAttackEmpty[CutNumber] + "\n")
			print("gTargetEmpty[CutNumber]	: " + gTargetEmpty[CutNumber] + "\n")
			StartEarthQuake_(15, 5, 10);
			break;
		case "High":
			gCameraTask = Task_AnimeMoveCamera_(gCameraEmpty[CutNumber], gCameragTargetEmpty[CutNumber]);
			gAttackTask = Task_AnimeMoveCharNoDir_(gAttack, gAttackEmpty[CutNumber]);
			gTargetTask = Task_AnimeMoveCharNoDir_(gTarget, gTargetEmpty[CutNumber]);
			print("gCameraEmpty[CutNumber]			: " + gCameraEmpty[CutNumber] + "\n")
			print("gCameragTargetEmpty[CutNumber]	: " + gCameragTargetEmpty[CutNumber] + "\n")
			print("gAttackEmpty[CutNumber]	: " + gAttackEmpty[CutNumber] + "\n")
			print("gTargetEmpty[CutNumber]	: " + gTargetEmpty[CutNumber] + "\n")
			StartEarthQuake_(15, 5, 10);
			break;
		default:
			break;
		}
		
		//gCameraTask = Task_SetFrameAnimeMoveCamera_(gCameraEmpty[CutNumber], gCameragTargetEmpty[CutNumber],1);
		
		
		SetDir_(gAttack, 180);
		SetDir_(gTarget, 0);
		SetMotion_(gTarget, MOT_WAIT, 4);
		SetMotionStepFrame_(gAttack, 0.2);
		SetMonsterPlayMoveSE_(gAttack,false);
		SetMotion_(gAttack, MOT_SWORD_START, 0);
		
		local SandEffect = EffParamSizeEffect(gAttack,"EF000_14_SMOKE_FOOT")
		//SetMotionStepFrame_(gAttack, 2.0);
		//SetMonsterPlayMoveSE_(gAttack,false);
		Wait_(10);
		//SetMotion_(gAttack, MOT_SWORD_EXERCISE, 4);
		//local CameraEffect = SetCameraEffect_("EF000_03_SHUCHUSEN", 100);
		Wait_(10);
		//DeleteEffect_(CameraEffect)
		DeleteEffect_(SandEffect)
	} else {
		//DebugPrint(("----------ERROR---------")
	
	}
	
}

//�J�b�g�R�i�^�[�Q�b�g�z���ɁA���C�h�����X�^�[���W�����v�U���j	401	=>	600F
function Cut03(CutNumber)
{
	DebugPrint("BATTLE030_function_Cut03")
	DebugPrint("	=>	:	CutNumber");
	//�J�����E�L�����ނ̃^�X�N�̐ݒ�
	//gCameraTask = Task_SetFrameAnimeMoveCamera_(gCameraEmpty[CutNumber], gCameragTargetEmpty[CutNumber] , gCutStartFrame[CutNumber]);	
	//gAttackTask = Task_SetFrameAnimeMoveCharNoDir_(gAttack, gAttackEmpty[CutNumber] , gCutStartFrame[CutNumber]);
	//gTargetTask = Task_SetFrameAnimeMoveCharNoDir_(gTarget, gTargetEmpty[CutNumber] , gCutStartFrame[CutNumber]);
	gCameraTask = Task_AnimeMoveCamera_(gCameraEmpty[CutNumber], gCameragTargetEmpty[CutNumber]);
	gAttackTask = Task_AnimeMoveCharNoDir_(gAttack, gAttackEmpty[CutNumber]);
	gTargetTask = Task_AnimeMoveCharNoDir_(gTarget, gTargetEmpty[CutNumber]);
	//DebugPrint(("gCameraEmpty[CutNumber]			: " + gCameraEmpty[CutNumber] + "\n");
	//DebugPrint(("gCameragTargetEmpty[CutNumber]		: " + gCameragTargetEmpty[CutNumber] + "\n");
	//DebugPrint(("gAttack					: " + gAttack + "\n");
	//DebugPrint(("gAttackEmpty[CutNumber]			: " + gAttackEmpty[CutNumber] + "\n");
	//DebugPrint(("gTarget					: " + gTarget + "\n");
	//DebugPrint(("gTargetEmpty[CutNumber]			: " + gTargetEmpty[CutNumber] + "\n");
	
	SetDir_(gAttack, 180);
	SetDir_(gTarget, 0);
	SetVisible_(gAttack, true);
	SetVisible_(gTarget, true);
	SetMotion_(gTarget, MOT_WAIT, 4);
	//local SmokeEffect = SetPointWorldEffect_("EF010_04_BOKOSUKA", "pos_001_EffectCenter");
	local StartWait = 45;
	//local EndWait = 15;
	local EndWait = 5;
	Wait_(1);
	JumpAction(StartWait);

	SetMotionStepFrame_(gAttack, 1.0);
	SetMonsterPlayMoveSE_(gAttack,true);
	SetMotion_(gTarget, MOT_DAMAGE, 4);
	SetMotionStepFrame_(gTarget, 0.3);
	SetMonsterPlayMoveSE_(gTarget,false);
	Task_ChangeMotion_(gTarget,MOT_WAIT,0)
	local AttackEffect = SetBoneEffect_("EF010_01_HIT", gTarget);

	if(gTargetSize == SIZE_S){
		SetEffectScale_(AttackEffect, 0.4);
	} else if(gTargetSize == SIZE_N){
		SetEffectScale_(AttackEffect, 0.6);
	} else if(gTargetSize == SIZE_M){
		SetEffectScale_(AttackEffect, 1.0);
	} else if(gTargetSize == SIZE_G){
		SetEffectScale_(AttackEffect, 3.7);
	} else if(gTargetSize == SIZE_T){
		SetEffectScale_(AttackEffect, 11.0);
	}

	StartEarthQuake_(EndWait, 10, 5);
	//DeleteEffectEmitter_(SmokeEffect)
	Wait_(20);
	local Explosion = SetPointWorldEffect_("EF010_05_EXPLOSION", "pos_003_EffectBomb");
	ReplaySE_("SE_BTL_170");
	StartEarthQuake_(60, 10, 10);
	SetEffectScale_(Explosion, 1.0);
	Wait_(EndWait);
	
	//Attack�������ݒ�ɖ߂�
	SetDir_(gAttack, 180);
	SetPitch_(gAttack, 0);
	SetMotionStepFrame_(gAttack, 1.0);
	SetMonsterPlayMoveSE_(gAttack,true);
	DeleteEffect_(AttackEffect)
	StopEarthQuake_();

}

function Cut03_02(CutNumber)
{
	DebugPrint("BATTLE030_function_Cut03")
	DebugPrint("	=>	:	CutNumber");
	//�J�����E�L�����ނ̃^�X�N�̐ݒ�
	gCameraTask = Task_AnimeMoveCamera_(gCameraEmpty[CutNumber], gCameragTargetEmpty[CutNumber]);
	gAttackTask = Task_AnimeMoveCharNoDir_(gAttack, gAttackEmpty[CutNumber]);
	gTargetTask = Task_AnimeMoveCharNoDir_(gTarget, gTargetEmpty[CutNumber]);
	
	SetDir_(gAttack, 180);
	SetDir_(gTarget, 0);
	SetVisible_(gAttack, true);
	SetVisible_(gTarget, true);
	SetMotion_(gTarget, MOT_WAIT, 4);
	local StartWait = 45;
	local EndWait = 5;
	Task_ChangeMotion_(gTarget,MOT_WAIT,4)
	
	local SmokeEffect = SetPointWorldEffect_("EF010_04_BOKOSUKA", "pos_001_EffectCenter");
	SetEffectScale_(SmokeEffect, 0.7);
	Wait_(15);
	DeleteEffectEmitter_(SmokeEffect)
	Wait_(15);

	SetMotionStepFrame_(gAttack, 2.0);
	SetMonsterPlayMoveSE_(gAttack,false);
	//SetMotion_(gTarget, MOT_SWORD_START, 4);
	SetMotion_(gTarget, MOT_SWORD_CHARGE, 4);
	
	Wait_(5)
	local AttackEffect = SetBoneEffect_("EF010_01_HIT", gTarget);
	SetMotion_(gTarget, MOT_DAMAGE, 4);
	SetMotionStepFrame_(gTarget, 1.5);
	SetMonsterPlayMoveSE_(gTarget,false);
	
	if(gTargetSize == SIZE_S){
		SetEffectScale_(AttackEffect, 0.4);
	} else if(gTargetSize == SIZE_N){
		SetEffectScale_(AttackEffect, 0.6);
	} else if(gTargetSize == SIZE_M){
		SetEffectScale_(AttackEffect, 1.0);
	} else if(gTargetSize == SIZE_G){
		SetEffectScale_(AttackEffect, 3.7);
	} else if(gTargetSize == SIZE_T){
		SetEffectScale_(AttackEffect, 11.0);
	}

	StartEarthQuake_(EndWait, 10, 5);
	local Explosion = SetPointWorldEffect_("EF010_05_EXPLOSION", "pos_003_EffectBomb");
	//ReplaySE_("SE_BTL_170");
	StartEarthQuake_(60, 10, 10);
	SetEffectScale_(Explosion, 1.0);
	Wait_(5);
	
	//Attack�������ݒ�ɖ߂�
	SetDir_(gAttack, 180);
	SetPitch_(gAttack, 0);
	SetMotionStepFrame_(gAttack, 1.0);
	SetMonsterPlayMoveSE_(gAttack,true);
	
	DeleteEffect_(AttackEffect)
	StopEarthQuake_();

}


//�J�b�g�S�i�����j	601	=>	800F
function Cut04(CutNumber)
{
	DebugPrint("BATTLE030_function_Cut04")
	DebugPrint("	=>	:	CutNumber");
	//�J�����E�L�����ނ̃^�X�N�̐ݒ�
	//gCameraTask = Task_SetFrameAnimeMoveCamera_(gCameraEmpty[CutNumber], gCameragTargetEmpty[CutNumber] , gCutStartFrame[CutNumber]);	
	//gAttackTask = Task_SetFrameAnimeMoveCharNoDir_(gAttack, gAttackEmpty[CutNumber] , gCutStartFrame[CutNumber]);
	//gTargetTask = Task_SetFrameAnimeMoveCharNoDir_(gTarget, gTargetEmpty[CutNumber] , gCutStartFrame[CutNumber]);
	gCameraTask = Task_AnimeMoveCamera_(gCameraEmpty[CutNumber], gCameragTargetEmpty[CutNumber]);
	gAttackTask = Task_AnimeMoveCharNoDir_(gAttack, gAttackEmpty[CutNumber]);
	gTargetTask = Task_AnimeMoveCharNoDir_(gTarget, gTargetEmpty[CutNumber]);
	//DebugPrint(("gCameraEmpty[CutNumber]			: " + gCameraEmpty[CutNumber] + "\n");
	//DebugPrint(("gCameragTargetEmpty[CutNumber]		: " + gCameragTargetEmpty[CutNumber] + "\n");
	//DebugPrint(("gAttack					: " + gAttack + "\n");
	//DebugPrint(("gAttackEmpty[CutNumber]			: " + gAttackEmpty[CutNumber] + "\n");
	//DebugPrint(("gTarget					: " + gTarget + "\n");
	//DebugPrint(("gTargetEmpty[CutNumber]			: " + gTargetEmpty[CutNumber] + "\n");
	
	SetVisible_(gAttack, true);
	SetVisible_(gTarget, true);
	
	SetDir_(gAttack, 180);
	SetMotionStepFrame_(gAttack, 1.0);
	SetMotionStepFrame_(gTarget, 1.0);
	SetMonsterPlayMoveSE_(gAttack,true);
	SetMonsterPlayMoveSE_(gTarget,true);
	Wait_(5);
	
	SetDamageEffectSE(0,false,false,gMultiCount,gMultiStageCount,false,cAction)

	SetMotion_(gAttack, MOT_JUMP_DOWN, 4);
	
	SetMotionStepFrame_(gTarget, 0.4);
	SetMonsterPlayMoveSE_(gTarget,false);
	
	local DeadCheck = IsDead_(0,0);
	if (DeadCheck == true){
		for(local i = 0; i <30; i++){
			SetAlpha_(gTarget, 1.0-((1.0/30.0)*i));
			Wait_(1);
			if (i == 10){
				//ReplaySE_("SE_BTL_009");
			}
			if (i == 25){
				SetMotion_(gAttack, MOT_WAIT, 5);
			}
		}
	} else {
		Wait_(40);
		SetMotion_(gAttack, MOT_WAIT, 10);
		Wait_(10);
	}
	Wait_(35);
	//SetMotionStepFrame_(gAttack, 1.0);
	//SetMotionStepFrame_(gTarget, 1.0);
	//SetMonsterPlayMoveSE_(gAttack,true);
	//SetMonsterPlayMoveSE_(gTarget,true);
}

//�J�b�g�S�i�����j	601	=>	800F
function Cut04_02(CutNumber)
{
	DebugPrint("BATTLE030_function_Cut04_02")
	DebugPrint("	=>	:	CutNumber");
	//�J�����E�L�����ނ̃^�X�N�̐ݒ�
	//DebugPrint(("CutNumber	: " + CutNumber + "\n")
	//DebugPrint(("gCameraEmpty[CutNumber]			: " + gCameraEmpty[CutNumber] + "\n");
	//DebugPrint(("gCameragTargetEmpty[CutNumber]		: " + gCameragTargetEmpty[CutNumber] + "\n");
	//DebugPrint(("gAttack					: " + gAttack + "\n");
	//DebugPrint(("gAttackEmpty[CutNumber]			: " + gAttackEmpty[CutNumber] + "\n");
	//DebugPrint(("gTarget					: " + gTarget + "\n");
	//DebugPrint(("gTargetEmpty[CutNumber]			: " + gTargetEmpty[CutNumber] + "\n");
	
	if(gAttackSize == SIZE_S || gAttackSize == SIZE_N || gAttackSize == SIZE_M){
		gCameraTask = Task_AnimeMoveCamera_(gCameraEmpty[CutNumber], gCameragTargetEmpty[CutNumber]);
		gAttackTask = Task_AnimeMoveCharNoDir_(gAttack, gAttackEmpty[CutNumber]);
		gTargetTask = Task_AnimeMoveCharNoDir_(gTarget, gTargetEmpty[CutNumber]);
		
		Wait_(1);
		
		SetVisible_(gAttack, true);
		SetVisible_(gTarget, true);
		
		SetDir_(gAttack, 180);
		
		SetMotionStepFrame_(gTarget, 0.5);
		SetMonsterPlayMoveSE_(gTarget,false);
		
		Wait_(4);
		
		SetMotion_(gAttack, MOT_SWORD_EXERCISE, 0);
		Task_ChangeMotion_(gAttack , MOT_WAIT , 0);
		SetMotionFrame_(gAttack, 20);
		
		//Wait_(20);	
		
		Wait_(6);
		SetMotionStepFrame_(gAttack, 0.2);
		SetMonsterPlayMoveSE_(gAttack,false);
		
		
		Wait_(14);
		SetMotionStepFrame_(gAttack, 0.4);
		SetMonsterPlayMoveSE_(gAttack,false);
		
		Wait_(15);
		
		local Explosion;
		if(gTargetSize == SIZE_S || gTargetSize == SIZE_N || gTargetSize == SIZE_M){
			Explosion = SetPointWorldEffect_("EF010_05_EXPLOSION", "pos_003_EffectBomb");
			SetEffectScale_(Explosion, 1.0);
		} else if(gTargetSize == SIZE_G){
			Explosion = SetPointWorldEffect_("EF010_05_EXPLOSION", "pos_003_EffectBomb");
			SetEffectScale_(Explosion, 2.0);
		} else if(gTargetSize == SIZE_T){
			Explosion = SetPointWorldEffect_("EF010_05_EXPLOSION", "pos_003_EffectBomb");
			SetEffectScale_(Explosion, 4.0);
		} else {
			//DebugPrint(("TargetSize : not found" + "\n")
		}
		
		//ReplaySE_("SE_BTL_170");
		//StartEarthQuake_(60, 10, 10);
		SetEffectScale_(Explosion, 1.0);
		SetDamageEffectSE(0,false,true,gMultiCount,gMultiStageCount,false,cAction)
		Wait_(5);
		SetMotionStepFrame_(gAttack, 0.6);
		SetMonsterPlayMoveSE_(gAttack,false);
		
			
		Wait_(5);
		SetMotionStepFrame_(gAttack, 0.8);
		SetMonsterPlayMoveSE_(gAttack,false);
		
			
		Wait_(5);
		//SetMotionStepFrame_(gAttack, 1.0);
		//SetMonsterPlayMoveSE_(gAttack,true);
		
		Wait_(10);
		
	/*	local DeadCheck = IsDead_(0,0);
		if (DeadCheck == true){
			for(local i = 0; i <30; i++){
				SetAlpha_(gTarget, 1.0-((1.0/30.0)*i));
				Wait_(1);
				if (i == 10){
					//ReplaySE_("SE_BTL_009");
				}
				if (i == 25){
					//SetMotion_(gAttack, MOT_WAIT, 5);
				}
			}
		} else {
			Wait_(40);
			//SetMotion_(gAttack, MOT_WAIT, 10);
			Wait_(10);
		}*/
		Wait_(60);
	} else if(gAttackSize == SIZE_G){
		
		gAttackTask = Task_AnimeMoveCharNoDir_(gAttack, gAttackEmpty[CutNumber]);
		gTargetTask = Task_AnimeMoveCharNoDir_(gTarget, gTargetEmpty[CutNumber]);
		
		switch(MonsterHightCheck(gAttack))
		{
		case "Low":
			gCameraTask = Task_AnimeMoveCamera_("camera_Cut04_2_431_GtoSNMG_Low", "camtgt_Cut04_2_431_GtoSNMG_Low");
			break;
		case "Middle":
			gCameraTask = Task_AnimeMoveCamera_(gCameraEmpty[CutNumber], gCameragTargetEmpty[CutNumber]);
			break;
		case "High":
			gCameraTask = Task_AnimeMoveCamera_(gCameraEmpty[CutNumber], gCameragTargetEmpty[CutNumber]);
			break;
		default:
			break;
		}
		
		SetDir_(gAttack, 180);
		
		Wait_(1);
		
		SetVisible_(gAttack, true);
		SetVisible_(gTarget, true);
		
		//SetMotionStepFrame_(gTarget, 0.5);
		SetMotionStepFrame_(gTarget, 0.3);
		SetMonsterPlayMoveSE_(gTarget,false);
		
		//Wait_(4);
		
		SetMotion_(gAttack, MOT_SWORD_EXERCISE, 0);
		Task_ChangeMotion_(gAttack , MOT_WAIT , 0)
		//SetMotionStepFrame_(gAttack, 0.6);
		//SetMonsterPlayMoveSE_(gAttack,false);
		

		Wait_(15);
		//Wait_(10);
		
		local Explosion;
		if(gTargetSize == SIZE_S || gTargetSize == SIZE_N || gTargetSize == SIZE_M){
			Explosion = SetPointWorldEffect_("EF010_05_EXPLOSION", "pos_003_EffectBomb");
			SetEffectScale_(Explosion, 1.0);
		} else if(gTargetSize == SIZE_G){
			Explosion = SetPointWorldEffect_("EF010_05_EXPLOSION", "pos_003_EffectBomb");
			SetEffectScale_(Explosion, 1.4);
			StartEarthQuake_(30, 10, 5);
		} else if(gTargetSize == SIZE_T){
			Explosion = SetPointWorldEffect_("EF010_05_EXPLOSION", "pos_003_EffectBomb");
			SetEffectScale_(Explosion, 2.0);
		} else {
			//DebugPrint(("TargetSize : not found" + "\n")
		}
		
		Wait_(10)
		
		SetDamageEffectSE(0,false,true,gMultiCount,gMultiStageCount,false,cAction)
		Wait_(5);
		SetMotionStepFrame_(gAttack, 0.6);
		SetMonsterPlayMoveSE_(gAttack,false);
		
		
		Wait_(5);
		SetMotionStepFrame_(gAttack, 0.8);
		SetMonsterPlayMoveSE_(gAttack,false);
		
			
		Wait_(5);
		SetMotionStepFrame_(gAttack, 1.0);
		SetMonsterPlayMoveSE_(gAttack,false);
		
		
		Wait_(60);
		
	} else if(gAttackSize == SIZE_T){
		switch(MonsterHightCheck(gAttack))
		{
		case "Low":
			gCameraEmpty[CutNumber]			= "camera_Cut04_2_441_TtoSNMG_LOW"
			gCameragTargetEmpty[CutNumber]	= "camtgt_Cut04_2_441_TtoSNMG_LOW"
			gCameraTask = Task_AnimeMoveCamera_(gCameraEmpty[CutNumber], gCameragTargetEmpty[CutNumber]);
			gAttackTask = Task_AnimeMoveCharNoDir_(gAttack, gAttackEmpty[CutNumber]);
			gTargetTask = Task_AnimeMoveCharNoDir_(gTarget, gTargetEmpty[CutNumber]);
			StartEarthQuake_(15, 5, 10);
			print("gCameraEmpty[CutNumber]			: " + gCameraEmpty[CutNumber] + "\n")
			print("gCameragTargetEmpty[CutNumber]	: " + gCameragTargetEmpty[CutNumber] + "\n")
			print("gAttackEmpty[CutNumber]	: " + gAttackEmpty[CutNumber] + "\n")
			print("gTargetEmpty[CutNumber]	: " + gTargetEmpty[CutNumber] + "\n")
			break;
		case "Middle":
			gCameraEmpty[CutNumber]			= "camera_Cut04_2_441_TtoSNMG_LOW"
			gCameragTargetEmpty[CutNumber]	= "camtgt_Cut04_2_441_TtoSNMG_LOW"
			gCameraTask = Task_AnimeMoveCamera_(gCameraEmpty[CutNumber], gCameragTargetEmpty[CutNumber]);
			gAttackTask = Task_AnimeMoveCharNoDir_(gAttack, gAttackEmpty[CutNumber]);
			gTargetTask = Task_AnimeMoveCharNoDir_(gTarget, gTargetEmpty[CutNumber]);
			print("gCameraEmpty[CutNumber]			: " + gCameraEmpty[CutNumber] + "\n")
			print("gCameragTargetEmpty[CutNumber]	: " + gCameragTargetEmpty[CutNumber] + "\n")
			print("gAttackEmpty[CutNumber]	: " + gAttackEmpty[CutNumber] + "\n")
			print("gTargetEmpty[CutNumber]	: " + gTargetEmpty[CutNumber] + "\n")
			StartEarthQuake_(15, 5, 10);
			break;
		case "High":
			gCameraTask = Task_AnimeMoveCamera_(gCameraEmpty[CutNumber], gCameragTargetEmpty[CutNumber]);
			gAttackTask = Task_AnimeMoveCharNoDir_(gAttack, gAttackEmpty[CutNumber]);
			gTargetTask = Task_AnimeMoveCharNoDir_(gTarget, gTargetEmpty[CutNumber]);
			print("gCameraEmpty[CutNumber]			: " + gCameraEmpty[CutNumber] + "\n")
			print("gCameragTargetEmpty[CutNumber]	: " + gCameragTargetEmpty[CutNumber] + "\n")
			print("gAttackEmpty[CutNumber]	: " + gAttackEmpty[CutNumber] + "\n")
			print("gTargetEmpty[CutNumber]	: " + gTargetEmpty[CutNumber] + "\n")
			StartEarthQuake_(15, 5, 10);
			break;
		default:
			break;
		}
		
		
		Wait_(1);
		
		SetVisible_(gAttack, true);
		SetVisible_(gTarget, true);
		
		SetDir_(gAttack, 180);
		
		SetMotionStepFrame_(gTarget, 0.5);
		SetMonsterPlayMoveSE_(gTarget,false);
		
		//Wait_(4);
		
		SetMotion_(gAttack, MOT_SWORD_EXERCISE, 1);
		SetMotionStepFrame_(gAttack, 0.6);
		SetMonsterPlayMoveSE_(gAttack,false);
		
		//Wait_(15);
		Wait_(10);
		
		local Explosion;
		if(gTargetSize == SIZE_S || gTargetSize == SIZE_N || gTargetSize == SIZE_M){
			Explosion = SetPointWorldEffect_("EF010_05_EXPLOSION", "pos_003_EffectBomb");
			SetEffectScale_(Explosion, 1.0);
			StartEarthQuake_(45, 5, 10);
		} else if(gTargetSize == SIZE_G){
			Explosion = SetPointWorldEffect_("EF010_05_EXPLOSION", "pos_003_EffectBomb");
			SetEffectScale_(Explosion, 1.4);
			StartEarthQuake_(45, 5, 10);
		} else if(gTargetSize == SIZE_T){
			Explosion = SetPointWorldEffect_("EF010_05_EXPLOSION", "pos_003_EffectBomb");
			SetEffectScale_(Explosion, 2.0);
			StartEarthQuake_(40 , 5 , 50);
		} else {
			//DebugPrint(("TargetSize : not found" + "\n")
		}
		//SetEffectScale_(Explosion, 1.0);
		SetDamageEffectSE(0,false,true,gMultiCount,gMultiStageCount,false,cAction)
		Wait_(5);
		SetMotionStepFrame_(gAttack, 0.6);
		SetMonsterPlayMoveSE_(gAttack,false);
		
		
		Wait_(5);
		SetMotionStepFrame_(gAttack, 0.8);
		SetMonsterPlayMoveSE_(gAttack,false);
		
		
		Wait_(5);
		//SetMotionStepFrame_(gAttack, 1.0);
		//SetMonsterPlayMoveSE_(gAttack,false);
		
		Wait_(25);
		
		StopEarthQuake_();
		StartEarthQuake_(20, 5 , 3);
		
		Wait_(55);
		
	} else {
		//DebugPrint(("**************** Error ****************" + "\n")
		//DebugPrint(("gAttackSize isn't Mistake...." + "\n")
		//DebugPrint(("gAttackSize	: " + gAttackSize +"\n")
	}
	
}

//�W�����v�A�N�V�����p
function JumpAction(Wait)
{
	DebugPrint("BATTLE030_function_IN_JumpAction")
	DebugPrint("	=>	:	Wait			:	" + Wait);
	DebugPrint("	=>	:	gJumpActionFlag	:	" + gJumpActionFlag);
	if(gJumpActionFlag == true){
		SetMotion_(gAttack, MOT_ATTACK, 4);
		SetMotionStepFrame_(gAttack, 0.4);
		SetMonsterPlayMoveSE_(gAttack,false);
		
		SetDir_(gAttack, 200);
		for(local i = 0.0 ; i <Wait ; i++){
			SetPitch_(gAttack, i/2);
			Wait_(1);
		}
	} else {
		SetMotion_(gAttack, MOT_ATTACK, 0);
		SetMotionStepFrame_(gAttack, 0.4);
		SetMonsterPlayMoveSE_(gAttack,false);
		
		SetDir_(gAttack, 180);
		Wait_(Wait)
	}
	
	DebugPrint("BATTLE030_function_OUT_JumpAction")
}

//�J�b�g�؂�ւ��p
function CutChange(CutNumber)
{
	DebugPrint("BATTLE030_function_IN_CutChange")
	DebugPrint("	=>	:	CutNumber	:	" + CutNumber);
	
	//�؂�ւ����Ƀ^�X�N�͎����z���Ȃ�
	//DeleteAllTask_();
	if(gAttackTask != null){
		DeleteTask_(gAttackTask);
		gAttackTask = null;
	}
	if(gTargetTask != null){
		DeleteTask_(gTargetTask);
		gTargetTask = null;
	}
	if(gCameraTask != null){
		DeleteTask_(gCameraTask);
		gCameraTask = null;
	}
	if(gPartyTask != []){
		for(local i = 0 ; i < gPartyTask.len() ; i++){
			DeleteTask_(gPartyTask[i]);
		}
		gPartyTask = [];	//Index���ƂɊi�[
	}
	
	//DeleteAllEffect_();
	
	//��U�S�����X�^�[�͔�\���ɂ���
	SetVisible_(gTarget, false);
	SetVisible_(gAttack, false);
	for(local i = 0 ; i < gPartyNum ; i++){
		if(gPartyIndex[i] != INVALID_CHARACTER){SetVisible_(gPartyIndex[i], false);}
	}
	
	//�J�b�g�i���o�[�̍X�V
	CutNumber++;
	
	ChangeIndexPointData_(PERSONAL_POINT_DATA);
	
	//DebugPrint(("CutChange		" + "\n")
	//DebugPrint(("	NextCut	[" + CutNumber + "]		" + "\n")
	
	DebugPrint("BATTLE030_function_OUT_CutChange")
	DebugPrint("	=>	:	CutNumber	:	" + CutNumber);
	return CutNumber;
}

//���C�h�A�g�p�e��EmptyEdit
function RideCombo_EmptyEdit()
{
	//���C�h�A�g���������X�^�[�̃T�C�Y�ɂ���āA�J������؂�Ԃ�
	//SIZE_S�ASIZE_N�͋��ʂ̂��̂��g���\�肾���O�̂��ߕ����ĊǗ�����
	
	
	//Empty���܂Ƃ߂邽�߂�List
	local gCameraEmptyList			= [];
	local gCameragTargetEmptyList		= [];
	local gAttackEmptyList			= [];
	local gTargetEmptyList			= [];
	local gPartyEmptyList			= [];	//���ꂾ���p�[�e�B���ɉ������Q�����z��
	local CutWaitList				= [];
	
	//Empty�f�[�^�̔z��
	local gPartyEmptyList = [];
	local Party00EmptyList = [];
	local Party01EmptyList = [];
	local Party02EmptyList = [];
	local Party00_S_EmptyList = [];
	local Party00_N_EmptyList = [];
	local Party00_M_EmptyList = [];
	local Party00_G_EmptyList = [];
	local Party00_T_EmptyList = [];
	local Party01_S_EmptyList = [];
	local Party01_N_EmptyList = [];
	local Party01_M_EmptyList = [];
	local Party01_G_EmptyList = [];
	local Party01_T_EmptyList = [];
	local Party02_S_EmptyList = [];
	local Party02_N_EmptyList = [];
	local Party02_M_EmptyList = [];
	local Party02_G_EmptyList = [];
	local Party02_T_EmptyList = [];
	
	local Attack_S_S_EmptyList = [];
	local Attack_S_N_EmptyList = [];
	local Attack_S_M_EmptyList = [];
	local Attack_S_G_EmptyList = [];
	local Attack_S_T_EmptyList = [];
	local Attack_N_S_EmptyList = [];
	local Attack_N_N_EmptyList = [];
	local Attack_N_M_EmptyList = [];
	local Attack_N_G_EmptyList = [];
	local Attack_N_T_EmptyList = [];
	local Attack_M_S_EmptyList = [];
	local Attack_M_N_EmptyList = [];
	local Attack_M_M_EmptyList = [];
	local Attack_M_G_EmptyList = [];
	local Attack_M_T_EmptyList = [];
	local Attack_G_S_EmptyList = [];
	local Attack_G_N_EmptyList = [];
	local Attack_G_M_EmptyList = [];
	local Attack_G_G_EmptyList = [];
	local Attack_G_T_EmptyList = [];
	local Attack_T_S_EmptyList = [];
	local Attack_T_N_EmptyList = [];
	local Attack_T_M_EmptyList = [];
	local Attack_T_G_EmptyList = [];
	local Attack_T_T_EmptyList = [];
	
	local Target_S_EmptyList = [];
	local Target_N_EmptyList = [];
	local Target_M_EmptyList = [];
	local Target_G_EmptyList = [];
	local Target_T_EmptyList = [];
	
	local Camera_S_S_S_EmptyList = [];
	local Camera_S_S_N_EmptyList = [];
	local Camera_S_S_M_EmptyList = [];
	local Camera_S_S_G_EmptyList = [];
	local Camera_S_N_S_EmptyList = [];
	local Camera_S_N_N_EmptyList = [];
	local Camera_S_N_M_EmptyList = [];
	local Camera_S_N_G_EmptyList = [];
	local Camera_S_M_S_EmptyList = [];
	local Camera_S_M_N_EmptyList = [];
	local Camera_S_M_M_EmptyList = [];
	local Camera_S_M_G_EmptyList = [];
	local Camera_S_G_S_EmptyList = [];
	local Camera_S_G_N_EmptyList = [];
	local Camera_S_G_M_EmptyList = [];
	local Camera_S_G_G_EmptyList = [];
	local Camera_S_T_S_EmptyList = [];
	local Camera_S_T_N_EmptyList = [];
	local Camera_S_T_M_EmptyList = [];
	local Camera_S_T_G_EmptyList = [];
	
	local Camera_N_S_S_EmptyList = [];
	local Camera_N_S_N_EmptyList = [];
	local Camera_N_S_M_EmptyList = [];
	local Camera_N_S_G_EmptyList = [];
	local Camera_N_N_S_EmptyList = [];
	local Camera_N_N_N_EmptyList = [];
	local Camera_N_N_M_EmptyList = [];
	local Camera_N_N_G_EmptyList = [];
	local Camera_N_M_S_EmptyList = [];
	local Camera_N_M_N_EmptyList = [];
	local Camera_N_M_M_EmptyList = [];
	local Camera_N_M_G_EmptyList = [];
	local Camera_N_G_S_EmptyList = [];
	local Camera_N_G_N_EmptyList = [];
	local Camera_N_G_M_EmptyList = [];
	local Camera_N_G_G_EmptyList = [];
	local Camera_N_T_S_EmptyList = [];
	local Camera_N_T_N_EmptyList = [];
	local Camera_N_T_M_EmptyList = [];
	local Camera_N_T_G_EmptyList = [];
	
	local Camera_M_S_S_EmptyList = [];
	local Camera_M_S_N_EmptyList = [];
	local Camera_M_S_M_EmptyList = [];
	local Camera_M_N_S_EmptyList = [];
	local Camera_M_N_N_EmptyList = [];
	local Camera_M_N_M_EmptyList = [];
	local Camera_M_M_S_EmptyList = [];
	local Camera_M_M_N_EmptyList = [];
	local Camera_M_M_M_EmptyList = [];
	local Camera_M_G_S_EmptyList = [];
	local Camera_M_G_N_EmptyList = [];
	local Camera_M_G_M_EmptyList = [];
	local Camera_M_T_S_EmptyList = [];
	local Camera_M_T_N_EmptyList = [];
	local Camera_M_T_M_EmptyList = [];
	
	local Camera_G_S_S_EmptyList = [];
	local Camera_G_S_N_EmptyList = [];
	local Camera_G_N_S_EmptyList = [];
	local Camera_G_N_N_EmptyList = [];
	local Camera_G_M_S_EmptyList = [];
	local Camera_G_M_N_EmptyList = [];
	local Camera_G_G_S_EmptyList = [];
	local Camera_G_G_N_EmptyList = [];
	local Camera_G_T_S_EmptyList = [];
	local Camera_G_T_N_EmptyList = [];
	
	local Camera_T_S_EmptyList = [];
	local Camera_T_N_EmptyList = [];
	local Camera_T_M_EmptyList = [];
	local Camera_T_G_EmptyList = [];
	local Camera_T_T_EmptyList = [];
	
	local CameraTarget_S_S_S_EmptyList = [];
	local CameraTarget_S_S_N_EmptyList = [];
	local CameraTarget_S_S_M_EmptyList = [];
	local CameraTarget_S_S_G_EmptyList = [];
	local CameraTarget_S_N_S_EmptyList = [];
	local CameraTarget_S_N_N_EmptyList = [];
	local CameraTarget_S_N_M_EmptyList = [];
	local CameraTarget_S_N_G_EmptyList = [];
	local CameraTarget_S_M_S_EmptyList = [];
	local CameraTarget_S_M_N_EmptyList = [];
	local CameraTarget_S_M_M_EmptyList = [];
	local CameraTarget_S_M_G_EmptyList = [];
	local CameraTarget_S_G_S_EmptyList = [];
	local CameraTarget_S_G_N_EmptyList = [];
	local CameraTarget_S_G_M_EmptyList = [];
	local CameraTarget_S_G_G_EmptyList = [];
	local CameraTarget_S_T_S_EmptyList = [];
	local CameraTarget_S_T_N_EmptyList = [];
	local CameraTarget_S_T_M_EmptyList = [];
	local CameraTarget_S_T_G_EmptyList = [];
	local CameraTarget_N_S_S_EmptyList = [];
	local CameraTarget_N_S_N_EmptyList = [];
	local CameraTarget_N_S_M_EmptyList = [];
	local CameraTarget_N_S_G_EmptyList = [];
	local CameraTarget_N_N_S_EmptyList = [];
	local CameraTarget_N_N_N_EmptyList = [];
	local CameraTarget_N_N_M_EmptyList = [];
	local CameraTarget_N_N_G_EmptyList = [];
	local CameraTarget_N_M_S_EmptyList = [];
	local CameraTarget_N_M_N_EmptyList = [];
	local CameraTarget_N_M_M_EmptyList = [];
	local CameraTarget_N_M_G_EmptyList = [];
	local CameraTarget_N_G_S_EmptyList = [];
	local CameraTarget_N_G_N_EmptyList = [];
	local CameraTarget_N_G_M_EmptyList = [];
	local CameraTarget_N_G_G_EmptyList = [];
	local CameraTarget_N_T_S_EmptyList = [];
	local CameraTarget_N_T_N_EmptyList = [];
	local CameraTarget_N_T_M_EmptyList = [];
	local CameraTarget_N_T_G_EmptyList = [];
	local CameraTarget_M_S_S_EmptyList = [];
	local CameraTarget_M_S_N_EmptyList = [];
	local CameraTarget_M_S_M_EmptyList = [];
	local CameraTarget_M_N_S_EmptyList = [];
	local CameraTarget_M_N_N_EmptyList = [];
	local CameraTarget_M_N_M_EmptyList = [];
	local CameraTarget_M_M_S_EmptyList = [];
	local CameraTarget_M_M_N_EmptyList = [];
	local CameraTarget_M_M_M_EmptyList = [];
	local CameraTarget_M_G_S_EmptyList = [];
	local CameraTarget_M_G_N_EmptyList = [];
	local CameraTarget_M_G_M_EmptyList = [];
	local CameraTarget_M_T_S_EmptyList = [];
	local CameraTarget_M_T_N_EmptyList = [];
	local CameraTarget_M_T_M_EmptyList = [];
	local CameraTarget_G_S_S_EmptyList = [];
	local CameraTarget_G_S_N_EmptyList = [];
	local CameraTarget_G_N_S_EmptyList = [];
	local CameraTarget_G_N_N_EmptyList = [];
	local CameraTarget_G_M_S_EmptyList = [];
	local CameraTarget_G_M_N_EmptyList = [];
	local CameraTarget_G_G_S_EmptyList = [];
	local CameraTarget_G_G_N_EmptyList = [];
	local CameraTarget_G_T_S_EmptyList = [];
	local CameraTarget_G_T_N_EmptyList = [];
	local CameraTarget_T_S_EmptyList = [];
	local CameraTarget_T_N_EmptyList = [];
	local CameraTarget_T_M_EmptyList = [];
	local CameraTarget_T_G_EmptyList = [];
	local CameraTarget_T_T_EmptyList = [];
	
	//Camera�p��Empty���܂Ƃ߂�
									//Cut0		Cut1						Cut2_2								Cut3	Cut4
	Camera_S_S_S_EmptyList =		[null,		"camera_Cut01_101_SNM_101",	"camera_Cut02_2_201_SNMtoSNMG",		null,	"camera_Cut04_2_401_SNtoSNMGT"];
	Camera_S_S_N_EmptyList =		[null,		"camera_Cut01_101_SNM_101",	"camera_Cut02_2_201_SNMtoSNMG",		null,	"camera_Cut04_2_401_SNtoSNMGT"];
	Camera_S_S_M_EmptyList =		[null,		"camera_Cut01_101_SNM_101",	"camera_Cut02_2_201_SNMtoSNMG",		null,	"camera_Cut04_2_401_SNtoSNMGT"];
	Camera_S_S_G_EmptyList =		[null,		"camera_Cut01_102_G_102",	"camera_Cut02_2_201_SNMtoSNMG",		null,	"camera_Cut04_2_401_SNtoSNMGT"];
	Camera_S_N_S_EmptyList =		[null,		"camera_Cut01_101_SNM_101",	"camera_Cut02_2_201_SNMtoSNMG",		null,	"camera_Cut04_2_401_SNtoSNMGT"];
	Camera_S_N_N_EmptyList =		[null,		"camera_Cut01_101_SNM_101",	"camera_Cut02_2_201_SNMtoSNMG",		null,	"camera_Cut04_2_401_SNtoSNMGT"];
	Camera_S_N_M_EmptyList =		[null,		"camera_Cut01_101_SNM_101",	"camera_Cut02_2_201_SNMtoSNMG",		null,	"camera_Cut04_2_401_SNtoSNMGT"];
	Camera_S_N_G_EmptyList =		[null,		"camera_Cut01_102_G_102",	"camera_Cut02_2_201_SNMtoSNMG",		null,	"camera_Cut04_2_401_SNtoSNMGT"];
	Camera_S_M_S_EmptyList =		[null,		"camera_Cut01_101_SNM_101",	"camera_Cut02_2_201_SNMtoSNMG",		null,	"camera_Cut04_2_401_SNtoSNMGT"];
	Camera_S_M_N_EmptyList =		[null,		"camera_Cut01_101_SNM_101",	"camera_Cut02_2_201_SNMtoSNMG",		null,	"camera_Cut04_2_401_SNtoSNMGT"];
	Camera_S_M_M_EmptyList =		[null,		"camera_Cut01_101_SNM_101",	"camera_Cut02_2_201_SNMtoSNMG",		null,	"camera_Cut04_2_401_SNtoSNMGT"];
	Camera_S_M_G_EmptyList =		[null,		"camera_Cut01_102_G_102",	"camera_Cut02_2_201_SNMtoSNMG",		null,	"camera_Cut04_2_401_SNtoSNMGT"];
	Camera_S_G_S_EmptyList =		[null,		"camera_Cut01_102_G_102",	"camera_Cut02_2_201_SNMtoSNMG",		null,	"camera_Cut04_2_401_SNtoSNMGT"];
	Camera_S_G_N_EmptyList =		[null,		"camera_Cut01_102_G_102",	"camera_Cut02_2_201_SNMtoSNMG",		null,	"camera_Cut04_2_401_SNtoSNMGT"];
	Camera_S_G_M_EmptyList =		[null,		"camera_Cut01_102_G_102",	"camera_Cut02_2_201_SNMtoSNMG",		null,	"camera_Cut04_2_401_SNtoSNMGT"];
	Camera_S_G_G_EmptyList =		[null,		"camera_Cut01_102_G_102",	"camera_Cut02_2_201_SNMtoSNMG",		null,	"camera_Cut04_2_401_SNtoSNMGT"];
	Camera_S_T_S_EmptyList =		[null,		"camera_Cut01_103_T_103",	"camera_Cut02_2_205_SNMtoT"	,		null,	"camera_Cut04_2_401_SNtoSNMGT"];
	Camera_S_T_N_EmptyList =		[null,		"camera_Cut01_103_T_103",	"camera_Cut02_2_205_SNMtoT",		null,	"camera_Cut04_2_401_SNtoSNMGT"];
	Camera_S_T_M_EmptyList =		[null,		"camera_Cut01_103_T_103",	"camera_Cut02_2_205_SNMtoT",		null,	"camera_Cut04_2_401_SNtoSNMGT"];
	Camera_S_T_G_EmptyList =		[null,		"camera_Cut01_103_T_103",	"camera_Cut02_2_205_SNMtoT",		null,	"camera_Cut04_2_401_SNtoSNMGT"];
	
	Camera_N_S_S_EmptyList =		[null,		"camera_Cut01_101_SNM_101",	"camera_Cut02_2_201_SNMtoSNMG",		null,	"camera_Cut04_2_401_SNtoSNMGT"];
	Camera_N_S_N_EmptyList =		[null,		"camera_Cut01_101_SNM_101",	"camera_Cut02_2_201_SNMtoSNMG",		null,	"camera_Cut04_2_401_SNtoSNMGT"];
	Camera_N_S_M_EmptyList =		[null,		"camera_Cut01_101_SNM_101",	"camera_Cut02_2_201_SNMtoSNMG",		null,	"camera_Cut04_2_401_SNtoSNMGT"];
	Camera_N_S_G_EmptyList =		[null,		"camera_Cut01_102_G_102",	"camera_Cut02_2_201_SNMtoSNMG",		null,	"camera_Cut04_2_401_SNtoSNMGT"];
	Camera_N_N_S_EmptyList =		[null,		"camera_Cut01_101_SNM_101",	"camera_Cut02_2_201_SNMtoSNMG",		null,	"camera_Cut04_2_401_SNtoSNMGT"];
	Camera_N_N_N_EmptyList =		[null,		"camera_Cut01_101_SNM_101",	"camera_Cut02_2_201_SNMtoSNMG",		null,	"camera_Cut04_2_401_SNtoSNMGT"];
	Camera_N_N_M_EmptyList =		[null,		"camera_Cut01_101_SNM_101",	"camera_Cut02_2_201_SNMtoSNMG",		null,	"camera_Cut04_2_401_SNtoSNMGT"];
	Camera_N_N_G_EmptyList =		[null,		"camera_Cut01_102_G_102",	"camera_Cut02_2_201_SNMtoSNMG",		null,	"camera_Cut04_2_401_SNtoSNMGT"];
	Camera_N_M_S_EmptyList =		[null,		"camera_Cut01_101_SNM_101",	"camera_Cut02_2_201_SNMtoSNMG",		null,	"camera_Cut04_2_401_SNtoSNMGT"];
	Camera_N_M_N_EmptyList =		[null,		"camera_Cut01_101_SNM_101",	"camera_Cut02_2_201_SNMtoSNMG",		null,	"camera_Cut04_2_401_SNtoSNMGT"];
	Camera_N_M_M_EmptyList =		[null,		"camera_Cut01_101_SNM_101",	"camera_Cut02_2_201_SNMtoSNMG",		null,	"camera_Cut04_2_401_SNtoSNMGT"];
	Camera_N_M_G_EmptyList =		[null,		"camera_Cut01_102_G_102",	"camera_Cut02_2_201_SNMtoSNMG",		null,	"camera_Cut04_2_401_SNtoSNMGT"];
	Camera_N_G_S_EmptyList =		[null,		"camera_Cut01_102_G_102",	"camera_Cut02_2_201_SNMtoSNMG",		null,	"camera_Cut04_2_401_SNtoSNMGT"];
	Camera_N_G_N_EmptyList =		[null,		"camera_Cut01_102_G_102",	"camera_Cut02_2_201_SNMtoSNMG",		null,	"camera_Cut04_2_401_SNtoSNMGT"];
	Camera_N_G_M_EmptyList =		[null,		"camera_Cut01_102_G_102",	"camera_Cut02_2_201_SNMtoSNMG",		null,	"camera_Cut04_2_401_SNtoSNMGT"];
	Camera_N_G_G_EmptyList =		[null,		"camera_Cut01_102_G_102",	"camera_Cut02_2_201_SNMtoSNMG",		null,	"camera_Cut04_2_401_SNtoSNMGT"];
	Camera_N_T_S_EmptyList =		[null,		"camera_Cut01_103_T_103",	"camera_Cut02_2_205_SNMtoT",		null,	"camera_Cut04_2_401_SNtoSNMGT"];
	Camera_N_T_N_EmptyList =		[null,		"camera_Cut01_103_T_103",	"camera_Cut02_2_205_SNMtoT",		null,	"camera_Cut04_2_401_SNtoSNMGT"];
	Camera_N_T_M_EmptyList =		[null,		"camera_Cut01_103_T_103",	"camera_Cut02_2_205_SNMtoT",		null,	"camera_Cut04_2_401_SNtoSNMGT"];
	Camera_N_T_G_EmptyList =		[null,		"camera_Cut01_103_T_103",	"camera_Cut02_2_205_SNMtoT",		null,	"camera_Cut04_2_401_SNtoSNMGT"];
	
	Camera_M_S_S_EmptyList =		[null,		"camera_Cut01_101_SNM_101",	"camera_Cut02_2_201_SNMtoSNMG",		null,	"camera_Cut04_2_421_MtoSNMGT"];
	Camera_M_S_N_EmptyList =		[null,		"camera_Cut01_101_SNM_101",	"camera_Cut02_2_201_SNMtoSNMG",		null,	"camera_Cut04_2_421_MtoSNMGT"];
	Camera_M_S_M_EmptyList =		[null,		"camera_Cut01_101_SNM_101",	"camera_Cut02_2_201_SNMtoSNMG",		null,	"camera_Cut04_2_421_MtoSNMGT"];
	Camera_M_N_S_EmptyList =		[null,		"camera_Cut01_101_SNM_101",	"camera_Cut02_2_201_SNMtoSNMG",		null,	"camera_Cut04_2_421_MtoSNMGT"];
	Camera_M_N_N_EmptyList =		[null,		"camera_Cut01_101_SNM_101",	"camera_Cut02_2_201_SNMtoSNMG",		null,	"camera_Cut04_2_421_MtoSNMGT"];
	Camera_M_N_M_EmptyList =		[null,		"camera_Cut01_101_SNM_101",	"camera_Cut02_2_201_SNMtoSNMG",		null,	"camera_Cut04_2_421_MtoSNMGT"];
	Camera_M_M_S_EmptyList =		[null,		"camera_Cut01_101_SNM_101",	"camera_Cut02_2_201_SNMtoSNMG",		null,	"camera_Cut04_2_421_MtoSNMGT"];
	Camera_M_M_N_EmptyList =		[null,		"camera_Cut01_101_SNM_101",	"camera_Cut02_2_201_SNMtoSNMG",		null,	"camera_Cut04_2_421_MtoSNMGT"];
	Camera_M_M_M_EmptyList =		[null,		"camera_Cut01_101_SNM_101",	"camera_Cut02_2_201_SNMtoSNMG",		null,	"camera_Cut04_2_421_MtoSNMGT"];
	Camera_M_G_S_EmptyList =		[null,		"camera_Cut01_102_G_102",	"camera_Cut02_2_201_SNMtoSNMG",		null,	"camera_Cut04_2_421_MtoSNMGT"];
	Camera_M_G_N_EmptyList =		[null,		"camera_Cut01_102_G_102",	"camera_Cut02_2_201_SNMtoSNMG",		null,	"camera_Cut04_2_421_MtoSNMGT"];
	Camera_M_G_M_EmptyList =		[null,		"camera_Cut01_102_G_102",	"camera_Cut02_2_201_SNMtoSNMG",		null,	"camera_Cut04_2_421_MtoSNMGT"];
	Camera_M_T_S_EmptyList =		[null,		"camera_Cut01_103_T_103",	"camera_Cut02_2_205_SNMtoT",		null,	"camera_Cut04_2_421_MtoSNMGT"];
	Camera_M_T_N_EmptyList =		[null,		"camera_Cut01_103_T_103",	"camera_Cut02_2_205_SNMtoT",		null,	"camera_Cut04_2_421_MtoSNMGT"];
	Camera_M_T_M_EmptyList =		[null,		"camera_Cut01_103_T_103",	"camera_Cut02_2_205_SNMtoT",		null,	"camera_Cut04_2_421_MtoSNMGT"];
	
	Camera_G_S_S_EmptyList =		[null,		"camera_Cut01_101_SNM_101",	"camera_Cut02_2_241_GtoSNMG",		null,	"camera_Cut04_2_431_GtoSNMG"];
	Camera_G_S_N_EmptyList =		[null,		"camera_Cut01_101_SNM_101",	"camera_Cut02_2_241_GtoSNMG",		null,	"camera_Cut04_2_431_GtoSNMG"];
	Camera_G_N_S_EmptyList =		[null,		"camera_Cut01_101_SNM_101",	"camera_Cut02_2_241_GtoSNMG",		null,	"camera_Cut04_2_431_GtoSNMG"];
	Camera_G_N_N_EmptyList =		[null,		"camera_Cut01_101_SNM_101",	"camera_Cut02_2_241_GtoSNMG",		null,	"camera_Cut04_2_431_GtoSNMG"];
	Camera_G_M_S_EmptyList =		[null,		"camera_Cut01_101_SNM_101",	"camera_Cut02_2_241_GtoSNMG",		null,	"camera_Cut04_2_431_GtoSNMG"];
	Camera_G_M_N_EmptyList =		[null,		"camera_Cut01_101_SNM_101",	"camera_Cut02_2_241_GtoSNMG",		null,	"camera_Cut04_2_431_GtoSNMG"];
	Camera_G_G_S_EmptyList =		[null,		"camera_Cut01_102_G_102",	"camera_Cut02_2_241_GtoSNMG",		null,	"camera_Cut04_2_431_GtoSNMG"];
	Camera_G_G_N_EmptyList =		[null,		"camera_Cut01_102_G_102",	"camera_Cut02_2_241_GtoSNMG",		null,	"camera_Cut04_2_431_GtoSNMG"];
	Camera_G_T_S_EmptyList =		[null,		"camera_Cut01_103_T_103",	"camera_Cut02_2_245_GtoT",			null,	"camera_Cut04_2_435_GtoT"];
	Camera_G_T_N_EmptyList =		[null,		"camera_Cut01_103_T_103",	"camera_Cut02_2_245_GtoT",			null,	"camera_Cut04_2_435_GtoT"];
	
	Camera_T_S_EmptyList =			[null,		null,						"camera_Cut02_2_251_TtoSNMGT",		null,	"camera_Cut04_2_441_TtoSNMG"];
	Camera_T_N_EmptyList =			[null,		null,						"camera_Cut02_2_251_TtoSNMGT",		null,	"camera_Cut04_2_441_TtoSNMG"];
	Camera_T_M_EmptyList =			[null,		null,						"camera_Cut02_2_251_TtoSNMGT",		null,	"camera_Cut04_2_441_TtoSNMG"];
	Camera_T_G_EmptyList =			[null,		null,						"camera_Cut02_2_251_TtoSNMGT",		null,	"camera_Cut04_2_441_TtoSNMG"];
	Camera_T_T_EmptyList =			[null,		null,						"camera_Cut02_2_251_TtoSNMGT",		null,	"camera_Cut04_2_445_TtoT"];
	
	//CameraTarget�p��Empty���܂Ƃ߂�
	CameraTarget_S_S_S_EmptyList =	[null,		"camtgt_Cut01_101_SNM_101",	"camtgt_Cut02_2_201_SNMtoSNMG",		null,	"camtgt_Cut04_2_401_SNtoSNMGT"];
	CameraTarget_S_S_N_EmptyList =	[null,		"camtgt_Cut01_101_SNM_101",	"camtgt_Cut02_2_201_SNMtoSNMG",		null,	"camtgt_Cut04_2_401_SNtoSNMGT"];
	CameraTarget_S_S_M_EmptyList =	[null,		"camtgt_Cut01_101_SNM_101",	"camtgt_Cut02_2_201_SNMtoSNMG",		null,	"camtgt_Cut04_2_401_SNtoSNMGT"];
	CameraTarget_S_S_G_EmptyList =	[null,		"camtgt_Cut01_102_G_102",	"camtgt_Cut02_2_201_SNMtoSNMG",		null,	"camtgt_Cut04_2_401_SNtoSNMGT"];
	CameraTarget_S_N_S_EmptyList =	[null,		"camtgt_Cut01_101_SNM_101",	"camtgt_Cut02_2_201_SNMtoSNMG",		null,	"camtgt_Cut04_2_401_SNtoSNMGT"];
	CameraTarget_S_N_N_EmptyList =	[null,		"camtgt_Cut01_101_SNM_101",	"camtgt_Cut02_2_201_SNMtoSNMG",		null,	"camtgt_Cut04_2_401_SNtoSNMGT"];
	CameraTarget_S_N_M_EmptyList =	[null,		"camtgt_Cut01_101_SNM_101",	"camtgt_Cut02_2_201_SNMtoSNMG",		null,	"camtgt_Cut04_2_401_SNtoSNMGT"];
	CameraTarget_S_N_G_EmptyList =	[null,		"camtgt_Cut01_102_G_102",	"camtgt_Cut02_2_201_SNMtoSNMG",		null,	"camtgt_Cut04_2_401_SNtoSNMGT"];
	CameraTarget_S_M_S_EmptyList =	[null,		"camtgt_Cut01_101_SNM_101",	"camtgt_Cut02_2_201_SNMtoSNMG",		null,	"camtgt_Cut04_2_401_SNtoSNMGT"];
	CameraTarget_S_M_N_EmptyList =	[null,		"camtgt_Cut01_101_SNM_101",	"camtgt_Cut02_2_201_SNMtoSNMG",		null,	"camtgt_Cut04_2_401_SNtoSNMGT"];
	CameraTarget_S_M_M_EmptyList =	[null,		"camtgt_Cut01_101_SNM_101",	"camtgt_Cut02_2_201_SNMtoSNMG",		null,	"camtgt_Cut04_2_401_SNtoSNMGT"];
	CameraTarget_S_M_G_EmptyList =	[null,		"camtgt_Cut01_102_G_102",	"camtgt_Cut02_2_201_SNMtoSNMG",		null,	"camtgt_Cut04_2_401_SNtoSNMGT"];
	CameraTarget_S_G_S_EmptyList =	[null,		"camtgt_Cut01_102_G_102",	"camtgt_Cut02_2_201_SNMtoSNMG",		null,	"camtgt_Cut04_2_401_SNtoSNMGT"];
	CameraTarget_S_G_N_EmptyList =	[null,		"camtgt_Cut01_102_G_102",	"camtgt_Cut02_2_201_SNMtoSNMG",		null,	"camtgt_Cut04_2_401_SNtoSNMGT"];
	CameraTarget_S_G_M_EmptyList =	[null,		"camtgt_Cut01_102_G_102",	"camtgt_Cut02_2_201_SNMtoSNMG",		null,	"camtgt_Cut04_2_401_SNtoSNMGT"];
	CameraTarget_S_G_G_EmptyList =	[null,		"camtgt_Cut01_102_G_102",	"camtgt_Cut02_2_201_SNMtoSNMG",		null,	"camtgt_Cut04_2_401_SNtoSNMGT"];
	CameraTarget_S_T_S_EmptyList =	[null,		"camtgt_Cut01_103_T_103",	"camtgt_Cut02_2_205_SMNtoT",		null,	"camtgt_Cut04_2_401_SNtoSNMGT"];
	CameraTarget_S_T_N_EmptyList =	[null,		"camtgt_Cut01_103_T_103",	"camtgt_Cut02_2_205_SMNtoT",		null,	"camtgt_Cut04_2_401_SNtoSNMGT"];
	CameraTarget_S_T_M_EmptyList =	[null,		"camtgt_Cut01_103_T_103",	"camtgt_Cut02_2_205_SMNtoT",		null,	"camtgt_Cut04_2_401_SNtoSNMGT"];
	CameraTarget_S_T_G_EmptyList =	[null,		"camtgt_Cut01_103_T_103",	"camtgt_Cut02_2_205_SMNtoT",		null,	"camtgt_Cut04_2_401_SNtoSNMGT"];

	CameraTarget_N_S_S_EmptyList =	[null,		"camtgt_Cut01_101_SNM_101",	"camtgt_Cut02_2_201_SNMtoSNMG",		null,	"camtgt_Cut04_2_401_SNtoSNMGT"];
	CameraTarget_N_S_N_EmptyList =	[null,		"camtgt_Cut01_101_SNM_101",	"camtgt_Cut02_2_201_SNMtoSNMG",		null,	"camtgt_Cut04_2_401_SNtoSNMGT"];
	CameraTarget_N_S_M_EmptyList =	[null,		"camtgt_Cut01_101_SNM_101",	"camtgt_Cut02_2_201_SNMtoSNMG",		null,	"camtgt_Cut04_2_401_SNtoSNMGT"];
	CameraTarget_N_S_G_EmptyList =	[null,		"camtgt_Cut01_102_G_102",	"camtgt_Cut02_2_201_SNMtoSNMG",		null,	"camtgt_Cut04_2_401_SNtoSNMGT"];
	CameraTarget_N_N_S_EmptyList =	[null,		"camtgt_Cut01_101_SNM_101",	"camtgt_Cut02_2_201_SNMtoSNMG",		null,	"camtgt_Cut04_2_401_SNtoSNMGT"];
	CameraTarget_N_N_N_EmptyList =	[null,		"camtgt_Cut01_101_SNM_101",	"camtgt_Cut02_2_201_SNMtoSNMG",		null,	"camtgt_Cut04_2_401_SNtoSNMGT"];
	CameraTarget_N_N_M_EmptyList =	[null,		"camtgt_Cut01_101_SNM_101",	"camtgt_Cut02_2_201_SNMtoSNMG",		null,	"camtgt_Cut04_2_401_SNtoSNMGT"];
	CameraTarget_N_N_G_EmptyList =	[null,		"camtgt_Cut01_102_G_102",	"camtgt_Cut02_2_201_SNMtoSNMG",		null,	"camtgt_Cut04_2_401_SNtoSNMGT"];
	CameraTarget_N_M_S_EmptyList =	[null,		"camtgt_Cut01_101_SNM_101",	"camtgt_Cut02_2_201_SNMtoSNMG",		null,	"camtgt_Cut04_2_401_SNtoSNMGT"];
	CameraTarget_N_M_N_EmptyList =	[null,		"camtgt_Cut01_101_SNM_101",	"camtgt_Cut02_2_201_SNMtoSNMG",		null,	"camtgt_Cut04_2_401_SNtoSNMGT"];
	CameraTarget_N_M_M_EmptyList =	[null,		"camtgt_Cut01_101_SNM_101",	"camtgt_Cut02_2_201_SNMtoSNMG",		null,	"camtgt_Cut04_2_401_SNtoSNMGT"];
	CameraTarget_N_M_G_EmptyList =	[null,		"camtgt_Cut01_102_G_102",	"camtgt_Cut02_2_201_SNMtoSNMG",		null,	"camtgt_Cut04_2_401_SNtoSNMGT"];
	CameraTarget_N_G_S_EmptyList =	[null,		"camtgt_Cut01_102_G_102",	"camtgt_Cut02_2_201_SNMtoSNMG",		null,	"camtgt_Cut04_2_401_SNtoSNMGT"];
	CameraTarget_N_G_N_EmptyList =	[null,		"camtgt_Cut01_102_G_102",	"camtgt_Cut02_2_201_SNMtoSNMG",		null,	"camtgt_Cut04_2_401_SNtoSNMGT"];
	CameraTarget_N_G_M_EmptyList =	[null,		"camtgt_Cut01_102_G_102",	"camtgt_Cut02_2_201_SNMtoSNMG",		null,	"camtgt_Cut04_2_401_SNtoSNMGT"];
	CameraTarget_N_G_G_EmptyList =	[null,		"camtgt_Cut01_102_G_102",	"camtgt_Cut02_2_201_SNMtoSNMG",		null,	"camtgt_Cut04_2_401_SNtoSNMGT"];
	CameraTarget_N_T_S_EmptyList =	[null,		"camtgt_Cut01_103_T_103",	"camtgt_Cut02_2_205_SMNtoT",		null,	"camtgt_Cut04_2_401_SNtoSNMGT"];
	CameraTarget_N_T_N_EmptyList =	[null,		"camtgt_Cut01_103_T_103",	"camtgt_Cut02_2_205_SMNtoT",		null,	"camtgt_Cut04_2_401_SNtoSNMGT"];
	CameraTarget_N_T_M_EmptyList =	[null,		"camtgt_Cut01_103_T_103",	"camtgt_Cut02_2_205_SMNtoT",		null,	"camtgt_Cut04_2_401_SNtoSNMGT"];
	CameraTarget_N_T_G_EmptyList =	[null,		"camtgt_Cut01_103_T_103",	"camtgt_Cut02_2_205_SMNtoT",		null,	"camtgt_Cut04_2_401_SNtoSNMGT"];

	CameraTarget_M_S_S_EmptyList =	[null,		"camtgt_Cut01_101_SNM_101",	"camtgt_Cut02_2_201_SNMtoSNMG",		null,	"camtgt_Cut04_2_421_MtoSNMGT"];
	CameraTarget_M_S_N_EmptyList =	[null,		"camtgt_Cut01_101_SNM_101",	"camtgt_Cut02_2_201_SNMtoSNMG",		null,	"camtgt_Cut04_2_421_MtoSNMGT"];
	CameraTarget_M_S_M_EmptyList =	[null,		"camtgt_Cut01_101_SNM_101",	"camtgt_Cut02_2_201_SNMtoSNMG",		null,	"camtgt_Cut04_2_421_MtoSNMGT"];
	CameraTarget_M_N_S_EmptyList =	[null,		"camtgt_Cut01_101_SNM_101",	"camtgt_Cut02_2_201_SNMtoSNMG",		null,	"camtgt_Cut04_2_421_MtoSNMGT"];
	CameraTarget_M_N_N_EmptyList =	[null,		"camtgt_Cut01_101_SNM_101",	"camtgt_Cut02_2_201_SNMtoSNMG",		null,	"camtgt_Cut04_2_421_MtoSNMGT"];
	CameraTarget_M_N_M_EmptyList =	[null,		"camtgt_Cut01_101_SNM_101",	"camtgt_Cut02_2_201_SNMtoSNMG",		null,	"camtgt_Cut04_2_421_MtoSNMGT"];
	CameraTarget_M_M_S_EmptyList =	[null,		"camtgt_Cut01_101_SNM_101",	"camtgt_Cut02_2_201_SNMtoSNMG",		null,	"camtgt_Cut04_2_421_MtoSNMGT"];
	CameraTarget_M_M_N_EmptyList =	[null,		"camtgt_Cut01_101_SNM_101",	"camtgt_Cut02_2_201_SNMtoSNMG",		null,	"camtgt_Cut04_2_421_MtoSNMGT"];
	CameraTarget_M_M_M_EmptyList =	[null,		"camtgt_Cut01_101_SNM_101",	"camtgt_Cut02_2_201_SNMtoSNMG",		null,	"camtgt_Cut04_2_421_MtoSNMGT"];
	CameraTarget_M_G_S_EmptyList =	[null,		"camtgt_Cut01_102_G_102",	"camtgt_Cut02_2_201_SNMtoSNMG",		null,	"camtgt_Cut04_2_421_MtoSNMGT"];
	CameraTarget_M_G_N_EmptyList =	[null,		"camtgt_Cut01_102_G_102",	"camtgt_Cut02_2_201_SNMtoSNMG",		null,	"camtgt_Cut04_2_421_MtoSNMGT"];
	CameraTarget_M_G_M_EmptyList =	[null,		"camtgt_Cut01_102_G_102",	"camtgt_Cut02_2_201_SNMtoSNMG",		null,	"camtgt_Cut04_2_421_MtoSNMGT"];
	CameraTarget_M_T_S_EmptyList =	[null,		"camtgt_Cut01_103_T_103",	"camtgt_Cut02_2_205_SMNtoT",		null,	"camtgt_Cut04_2_421_MtoSNMGT"];
	CameraTarget_M_T_N_EmptyList =	[null,		"camtgt_Cut01_103_T_103",	"camtgt_Cut02_2_205_SMNtoT",		null,	"camtgt_Cut04_2_421_MtoSNMGT"];
	CameraTarget_M_T_M_EmptyList =	[null,		"camtgt_Cut01_103_T_103",	"camtgt_Cut02_2_205_SMNtoT",		null,	"camtgt_Cut04_2_421_MtoSNMGT"];
	
	CameraTarget_G_S_S_EmptyList =	[null,		"camtgt_Cut01_101_SNM_101",	"camtgt_Cut02_2_241_GtoSNMG",		null,	"camtgt_Cut04_2_431_GtoSNMG"];
	CameraTarget_G_S_N_EmptyList =	[null,		"camtgt_Cut01_101_SNM_101",	"camtgt_Cut02_2_241_GtoSNMG",		null,	"camtgt_Cut04_2_431_GtoSNMG"];
	CameraTarget_G_N_S_EmptyList =	[null,		"camtgt_Cut01_101_SNM_101",	"camtgt_Cut02_2_241_GtoSNMG",		null,	"camtgt_Cut04_2_431_GtoSNMG"];
	CameraTarget_G_N_N_EmptyList =	[null,		"camtgt_Cut01_101_SNM_101",	"camtgt_Cut02_2_241_GtoSNMG",		null,	"camtgt_Cut04_2_431_GtoSNMG"];
	CameraTarget_G_M_S_EmptyList =	[null,		"camtgt_Cut01_101_SNM_101",	"camtgt_Cut02_2_241_GtoSNMG",		null,	"camtgt_Cut04_2_431_GtoSNMG"];
	CameraTarget_G_M_N_EmptyList =	[null,		"camtgt_Cut01_101_SNM_101",	"camtgt_Cut02_2_241_GtoSNMG",		null,	"camtgt_Cut04_2_431_GtoSNMG"];
	CameraTarget_G_G_S_EmptyList =	[null,		"camtgt_Cut01_102_G_102",	"camtgt_Cut02_2_241_GtoSNMG",		null,	"camtgt_Cut04_2_431_GtoSNMG"];
	CameraTarget_G_G_N_EmptyList =	[null,		"camtgt_Cut01_102_G_102",	"camtgt_Cut02_2_241_GtoSNMG",		null,	"camtgt_Cut04_2_431_GtoSNMG"];
	CameraTarget_G_T_S_EmptyList =	[null,		"camtgt_Cut01_103_T_103",	"camtgt_Cut02_2_245_GtoT",			null,	"camtgt_Cut04_2_435_GtoT"];
	CameraTarget_G_T_N_EmptyList =	[null,		"camtgt_Cut01_103_T_103",	"camtgt_Cut02_2_245_GtoT",			null,	"camtgt_Cut04_2_435_GtoT"];
	
	CameraTarget_T_S_EmptyList =	[null,		null,						"camtgt_Cut02_2_251_TtoSNMGT",		null,	"camtgt_Cut04_2_441_TtoSNMG"];
	CameraTarget_T_N_EmptyList =	[null,		null,						"camtgt_Cut02_2_251_TtoSNMGT",		null,	"camtgt_Cut04_2_441_TtoSNMG"];
	CameraTarget_T_M_EmptyList =	[null,		null,						"camtgt_Cut02_2_251_TtoSNMGT",		null,	"camtgt_Cut04_2_441_TtoSNMG"];
	CameraTarget_T_G_EmptyList =	[null,		null,						"camtgt_Cut02_2_251_TtoSNMGT",		null,	"camtgt_Cut04_2_441_TtoSNMG"];
	CameraTarget_T_T_EmptyList =	[null,		null,						"camtgt_Cut02_2_251_TtoSNMGT",		null,	"camtgt_Cut04_2_445_TtoT"];
	
	//�s���҂�EmptyList���܂Ƃ߂�B
	Attack_S_S_EmptyList =			[null,		null,						"move_Cut02_2_201_SNMtoSNMG",		null,	"move_401_Cut04_2_SNtoSNMGT"];
	Attack_S_N_EmptyList =			[null,		null,						"move_Cut02_2_201_SNMtoSNMG",		null,	"move_401_Cut04_2_SNtoSNMGT"];
	Attack_S_M_EmptyList =			[null,		null,						"move_Cut02_2_201_SNMtoSNMG",		null,	"move_401_Cut04_2_SNtoSNMGT"];
	Attack_S_G_EmptyList =			[null,		null,						"move_Cut02_2_201_SNMtoSNMG",		null,	"move_401_Cut04_2_SNtoSNMGT"];
	Attack_S_T_EmptyList =			[null,		null,						"move_Cut02_2_205_SNMtoT"	,		null,	"move_401_Cut04_2_SNtoSNMGT"];
	Attack_N_S_EmptyList =			[null,		null,						"move_Cut02_2_201_SNMtoSNMG",		null,	"move_401_Cut04_2_SNtoSNMGT"];
	Attack_N_N_EmptyList =			[null,		null,						"move_Cut02_2_201_SNMtoSNMG",		null,	"move_401_Cut04_2_SNtoSNMGT"];
	Attack_N_M_EmptyList =			[null,		null,						"move_Cut02_2_201_SNMtoSNMG",		null,	"move_401_Cut04_2_SNtoSNMGT"];
	Attack_N_G_EmptyList =			[null,		null,						"move_Cut02_2_201_SNMtoSNMG",		null,	"move_401_Cut04_2_SNtoSNMGT"];
	Attack_N_T_EmptyList =			[null,		null,						"move_Cut02_2_205_SNMtoT"	,		null,	"move_401_Cut04_2_SNtoSNMGT"];
	Attack_M_S_EmptyList =			[null,		null,						"move_Cut02_2_201_SNMtoSNMG",		null,	"move_421_Cut04_2_MtoSNMGT"];
	Attack_M_N_EmptyList =			[null,		null,						"move_Cut02_2_201_SNMtoSNMG",		null,	"move_421_Cut04_2_MtoSNMGT"];
	Attack_M_M_EmptyList =			[null,		null,						"move_Cut02_2_201_SNMtoSNMG",		null,	"move_421_Cut04_2_MtoSNMGT"];
	Attack_M_G_EmptyList =			[null,		null,						"move_Cut02_2_201_SNMtoSNMG",		null,	"move_421_Cut04_2_MtoSNMGT"];
	Attack_M_T_EmptyList =			[null,		null,						"move_Cut02_2_205_SNMtoT"	,		null,	"move_421_Cut04_2_MtoSNMGT"];
	Attack_G_S_EmptyList =			[null,		null,						"move_Cut02_2_241_GtoSNMG"	,		null,	"move_431_Cut04_2_GtoSNMG"];
	Attack_G_N_EmptyList =			[null,		null,						"move_Cut02_2_241_GtoSNMG"	,		null,	"move_431_Cut04_2_GtoSNMG"];
	Attack_G_M_EmptyList =			[null,		null,						"move_Cut02_2_241_GtoSNMG"	,		null,	"move_431_Cut04_2_GtoSNMG"];
	Attack_G_G_EmptyList =			[null,		null,						"move_Cut02_2_241_GtoSNMG"	,		null,	"move_431_Cut04_2_GtoSNMG"];
	Attack_G_T_EmptyList =			[null,		null,						"move_Cut02_2_245_GtoT"		,		null,	"move_435_Cut04_2_GtoT"];
	Attack_T_S_EmptyList =			[null,		null,						"move_Cut02_2_251_TtoSNMGT"	,		null,	"move_441_Cut04_2_TtoSNMG"];
	Attack_T_N_EmptyList =			[null,		null,						"move_Cut02_2_251_TtoSNMGT"	,		null,	"move_441_Cut04_2_TtoSNMG"];
	Attack_T_M_EmptyList =			[null,		null,						"move_Cut02_2_251_TtoSNMGT"	,		null,	"move_441_Cut04_2_TtoSNMG"];
	Attack_T_G_EmptyList =			[null,		null,						"move_Cut02_2_251_TtoSNMGT"	,		null,	"move_441_Cut04_2_TtoSNMG"];
	Attack_T_T_EmptyList =			[null,		null,						"move_Cut02_2_251_TtoSNMGT"	,		null,	"move_445_Cut04_2_TtoT"];

	//�Ώێ҂�EmptyList���܂Ƃ߂�B
	Target_S_EmptyList =			[null,		"move_151_Cut01_TargetSN",	"move_Cut02_2_291_TargetSN",		null,	"move_491_Cut04_2_TargetSN"];
	Target_N_EmptyList =			[null,		"move_151_Cut01_TargetSN",	"move_Cut02_2_291_TargetSN",		null,	"move_491_Cut04_2_TargetSN"];
	Target_M_EmptyList =			[null,		"move_153_Cut01_TargetM",	"move_Cut02_2_293_TargetM",			null,	"move_493_Cut04_2_TargetM"];
	Target_G_EmptyList =			[null,		"move_154_Cut01_TargetG",	"move_Cut02_2_294_TargetG",			null,	"move_494_Cut04_2_TargetG"];
	Target_T_EmptyList =			[null,		"move_155_Cut01_TargetT",	"move_Cut02_2_295_TargetT",			null,	"move_495_Cut04_2_TargetT"];
	
	//�p�[�e�B�p��EmptyList���܂Ƃ߂�B
	Party00_S_EmptyList =			[null,		"move_111_Cut01_Party00_SNM",	null,	null,	null];
	Party00_N_EmptyList =			[null,		"move_111_Cut01_Party00_SNM",	null,	null,	null];
	Party00_M_EmptyList =			[null,		"move_111_Cut01_Party00_SNM",	null,	null,	null];
	Party00_G_EmptyList =			[null,		"move_115_Cut01_Party03_G",		null,	null,	null];
	Party00_T_EmptyList =			[null,		null,							null,	null,	null];
	//===========================
	Party01_S_EmptyList =			[null,		"move_112_Cut01_Party01_SNM",	null,	null,	null];
	Party01_N_EmptyList =			[null,		"move_112_Cut01_Party01_SNM",	null,	null,	null];
	Party01_M_EmptyList =			[null,		"move_112_Cut01_Party01_SNM",	null,	null,	null];
	Party01_G_EmptyList =			[null,		null,							null,	null,	null];
	Party01_T_EmptyList =			[null,		null,							null,	null,	null];
	//===========================
	Party02_S_EmptyList =			[null,		"move_113_Cut01_Party02_SN",	null,	null,	null];
	Party02_N_EmptyList =			[null,		"move_113_Cut01_Party02_SN",	null,	null,	null];
	Party02_M_EmptyList =			[null,		null,							null,	null,	null];
	Party02_G_EmptyList =			[null,		null,							null,	null,	null];
	Party02_T_EmptyList =			[null,		null,							null,	null,	null];
	//===========================
	Party00EmptyList = [Party00_S_EmptyList,Party00_N_EmptyList,Party00_M_EmptyList,Party00_G_EmptyList,Party00_T_EmptyList];
	Party01EmptyList = [Party01_S_EmptyList,Party01_N_EmptyList,Party01_M_EmptyList,Party01_G_EmptyList,Party01_T_EmptyList];
	Party02EmptyList = [Party02_S_EmptyList,Party02_N_EmptyList,Party02_M_EmptyList,Party02_G_EmptyList,Party02_T_EmptyList];
	gPartyEmptyList = [Party00EmptyList,Party01EmptyList,Party02EmptyList];
	
	local ListS = 0;	//�z��Q�Ɨp
	local ListN = 1;	//�z��Q�Ɨp
	local ListM = 2;	//�z��Q�Ɨp
	local ListG = 3;	//�z��Q�Ɨp
	local ListT = 4;	//�z��Q�Ɨp
	
	//gAttackEmpty�̍쐬
	if(gAttackSize == SIZE_S){
		if(gTargetSize == SIZE_S){
			gAttackEmpty = Attack_S_S_EmptyList;
		} else if (gTargetSize == SIZE_N){
			gAttackEmpty = Attack_S_N_EmptyList;
		} else if (gTargetSize == SIZE_M){
			gAttackEmpty = Attack_S_M_EmptyList;
		} else if (gTargetSize == SIZE_G){
			gAttackEmpty = Attack_S_G_EmptyList;
		} else if (gTargetSize == SIZE_T){
			gAttackEmpty = Attack_S_T_EmptyList;
		}
	} else if(gAttackSize == SIZE_N){
		if(gTargetSize == SIZE_S){
			gAttackEmpty = Attack_N_S_EmptyList;
		} else if (gTargetSize == SIZE_N){
			gAttackEmpty = Attack_N_N_EmptyList;
		} else if (gTargetSize == SIZE_M){
			gAttackEmpty = Attack_N_M_EmptyList;
		} else if (gTargetSize == SIZE_G){
			gAttackEmpty = Attack_N_G_EmptyList;
		} else if (gTargetSize == SIZE_T){
			gAttackEmpty = Attack_N_T_EmptyList;
		}
	} else if(gAttackSize == SIZE_M){
		if(gTargetSize == SIZE_S){
			gAttackEmpty = Attack_M_S_EmptyList;
		} else if (gTargetSize == SIZE_N){
			gAttackEmpty = Attack_M_N_EmptyList;
		} else if (gTargetSize == SIZE_M){
			gAttackEmpty = Attack_M_M_EmptyList;
		} else if (gTargetSize == SIZE_G){
			gAttackEmpty = Attack_M_G_EmptyList;
		} else if (gTargetSize == SIZE_T){
			gAttackEmpty = Attack_M_T_EmptyList;
		}
	} else if(gAttackSize == SIZE_G){
		if(gTargetSize == SIZE_S){
			gAttackEmpty = Attack_G_S_EmptyList;
		} else if (gTargetSize == SIZE_N){
			gAttackEmpty = Attack_G_N_EmptyList;
		} else if (gTargetSize == SIZE_M){
			gAttackEmpty = Attack_G_M_EmptyList;
		} else if (gTargetSize == SIZE_G){
			gAttackEmpty = Attack_G_G_EmptyList;
		} else if (gTargetSize == SIZE_T){
			gAttackEmpty = Attack_G_T_EmptyList;
		}
	} else if(gAttackSize == SIZE_T){
		if(gTargetSize == SIZE_S){
			gAttackEmpty = Attack_T_S_EmptyList;
		} else if (gTargetSize == SIZE_N){
			gAttackEmpty = Attack_T_N_EmptyList;
		} else if (gTargetSize == SIZE_M){
			gAttackEmpty = Attack_T_M_EmptyList;
		} else if (gTargetSize == SIZE_G){
			gAttackEmpty = Attack_T_G_EmptyList;
		} else if (gTargetSize == SIZE_T){
			gAttackEmpty = Attack_T_T_EmptyList;
		}
	}
	
	//gTargetEmpty�̍쐬
	if(gTargetSize == SIZE_S){
		gTargetEmpty = Target_S_EmptyList
	} else if(gTargetSize == SIZE_N){
		gTargetEmpty = Target_N_EmptyList
	} else if(gTargetSize == SIZE_M){
		gTargetEmpty = Target_M_EmptyList
	} else if(gTargetSize == SIZE_G){
		gTargetEmpty = Target_G_EmptyList
	} else if(gTargetSize == SIZE_T){
		gTargetEmpty = Target_T_EmptyList
	}
	
	//gPartyEmpty�̍쐬
	////DebugPrint(("gPartyNum	: " + gPartyNum + "\n")
	for(local i = 0 ; i < gPartyNum ; i++){
		if(gPartyIndex[i] != INVALID_CHARACTER){
			local gPartySize = GetMonsterSize_(gPartyIndex[i]);
			local ListNum;
			if(gPartySize == SIZE_S){
				gPartyEmpty.append(gPartyEmptyList[i][ListS]);
				ListNum = ListS;
			} else if(gPartySize == SIZE_N){
				gPartyEmpty.append(gPartyEmptyList[i][ListN]);
				ListNum = ListN;
			} else if(gPartySize == SIZE_M){
				gPartyEmpty.append(gPartyEmptyList[i][ListM]);
				ListNum = ListM;
			} else if(gPartySize == SIZE_G){
				gPartyEmpty.append(gPartyEmptyList[i][ListG]);
				ListNum = ListG;
			} else if(gPartySize == SIZE_T){
				gPartyEmpty.append(gPartyEmptyList[i][ListT]);
				ListNum = ListT;
			}
			
			//DebugPrint(("ListNum				: " + ListNum + "\n");
			//DebugPrint(("gPartyEmpty[i].len()	: " + gPartyEmpty[i].len() + "\n");
			//DebugPrint(("gPartyEmpty[i]		: " + gPartyEmpty[i] + "\n");
		}
	}
	
	//=====================================================
	//Camera�AgCameragTargetEmpty�̍쐬
	//DebugPrint(("gAttackSize	: " + gAttackSize + "\n")
	//DebugPrint(("gTargetSize	: " + gTargetSize + "\n")
	//DebugPrint(("gGFlag		: " + gGFlag + "\n")
	//DebugPrint(("gMFlag		: " + gMFlag + "\n")
	//DebugPrint(("gNFlag		: " + gNFlag + "\n")
	//DebugPrint(("gSFlag		: " + gSFlag + "\n")
	if(gAttackSize == SIZE_S){
		if(gTargetSize == SIZE_S){
			if(gGFlag == true){
				gCameraEmpty			= Camera_S_S_G_EmptyList;
				gCameragTargetEmpty	= CameraTarget_S_S_G_EmptyList;
			} else if(gMFlag == true){
				gCameraEmpty			= Camera_S_S_M_EmptyList;
				gCameragTargetEmpty	= CameraTarget_S_S_M_EmptyList;
			} else if(gNFlag == true){
				gCameraEmpty			= Camera_S_S_N_EmptyList;
				gCameragTargetEmpty	= CameraTarget_S_S_N_EmptyList;
			} else if(gSFlag == true){
				gCameraEmpty			= Camera_S_S_S_EmptyList;
				gCameragTargetEmpty	= CameraTarget_S_S_S_EmptyList;
			} else {
				gCameraEmpty = Camera_S_S_S_EmptyList;	//�p�[�e�B�����X�^�[�����Ȃ��ꍇ�͂r�����Ƃ���
				gCameragTargetEmpty	= CameraTarget_S_S_S_EmptyList;
			}
		} else if(gTargetSize == SIZE_N){
			if(gGFlag == true){
				gCameraEmpty			= Camera_S_N_G_EmptyList;
				gCameragTargetEmpty	= CameraTarget_S_N_G_EmptyList;
			} else if(gMFlag == true){
				gCameraEmpty			= Camera_S_N_M_EmptyList;
				gCameragTargetEmpty	= CameraTarget_S_N_M_EmptyList;
			} else if(gNFlag == true){
				gCameraEmpty			= Camera_S_N_N_EmptyList;
				gCameragTargetEmpty	= CameraTarget_S_N_N_EmptyList;
			} else if(gSFlag == true){
				gCameraEmpty			= Camera_S_N_S_EmptyList;
				gCameragTargetEmpty	= CameraTarget_S_N_S_EmptyList;
			} else {
				gCameraEmpty			= Camera_S_N_S_EmptyList;	//�p�[�e�B�����X�^�[�����Ȃ��ꍇ�͂r�����Ƃ���
				gCameragTargetEmpty	= CameraTarget_S_N_S_EmptyList;
			}
		} else if(gTargetSize == SIZE_M){
			if(gGFlag == true){
				gCameraEmpty			= Camera_S_M_G_EmptyList;
				gCameragTargetEmpty	= CameraTarget_S_M_G_EmptyList;
			} else if(gMFlag == true){
				gCameraEmpty			= Camera_S_M_M_EmptyList;
				gCameragTargetEmpty	= CameraTarget_S_M_M_EmptyList;
			} else if(gNFlag == true){
				gCameraEmpty			= Camera_S_M_N_EmptyList;
				gCameragTargetEmpty	= CameraTarget_S_M_N_EmptyList;
			} else if(gSFlag == true){
				gCameraEmpty			= Camera_S_M_S_EmptyList;
				gCameragTargetEmpty	= CameraTarget_S_M_S_EmptyList;
			} else {
				gCameraEmpty			= Camera_S_M_S_EmptyList;	//�p�[�e�B�����X�^�[�����Ȃ��ꍇ�͂r�����Ƃ���
				gCameragTargetEmpty	= CameraTarget_S_M_S_EmptyList;
			}
		} else if(gTargetSize == SIZE_G){
			if(gGFlag == true){
				gCameraEmpty			= Camera_S_G_G_EmptyList;
				gCameragTargetEmpty	= CameraTarget_S_G_G_EmptyList;
			} else if(gMFlag == true){
				gCameraEmpty			= Camera_S_G_M_EmptyList;
				gCameragTargetEmpty	= CameraTarget_S_G_M_EmptyList;
			} else if(gNFlag == true){
				gCameraEmpty			= Camera_S_G_N_EmptyList;
				gCameragTargetEmpty	= CameraTarget_S_G_N_EmptyList;
			} else if(gSFlag == true){
				gCameraEmpty			= Camera_S_G_S_EmptyList;
				gCameragTargetEmpty	= CameraTarget_S_G_S_EmptyList;
			} else {
				gCameraEmpty			= Camera_S_G_S_EmptyList;	//�p�[�e�B�����X�^�[�����Ȃ��ꍇ�͂r�����Ƃ���
				gCameragTargetEmpty	= CameraTarget_S_G_S_EmptyList;
			}
		} else if(gTargetSize == SIZE_T){
			if(gGFlag == true){
				gCameraEmpty			= Camera_S_T_G_EmptyList;
				gCameragTargetEmpty	= CameraTarget_S_T_G_EmptyList;
			} else if(gMFlag == true){
				gCameraEmpty			= Camera_S_T_M_EmptyList;
				gCameragTargetEmpty	= CameraTarget_S_T_M_EmptyList;
			} else if(gNFlag == true){
				gCameraEmpty			= Camera_S_T_N_EmptyList;
				gCameragTargetEmpty	= CameraTarget_S_T_N_EmptyList;
			} else if(gSFlag == true){
				gCameraEmpty			= Camera_S_T_S_EmptyList;
				gCameragTargetEmpty	= CameraTarget_S_T_S_EmptyList;
			} else {
				gCameraEmpty			= Camera_S_T_S_EmptyList;	//�p�[�e�B�����X�^�[�����Ȃ��ꍇ�͂r�����Ƃ���
				gCameragTargetEmpty	= CameraTarget_S_T_S_EmptyList;
			}
		}
	} else if(gAttackSize == SIZE_N){
		if(gTargetSize == SIZE_S){
			if(gGFlag == true){
				gCameraEmpty			= Camera_N_S_G_EmptyList;
				gCameragTargetEmpty	= CameraTarget_N_S_G_EmptyList;
			} else if(gMFlag == true){
				gCameraEmpty			= Camera_N_S_M_EmptyList;
				gCameragTargetEmpty	= CameraTarget_N_S_M_EmptyList;
			} else if(gNFlag == true){
				gCameraEmpty			= Camera_N_S_N_EmptyList;
				gCameragTargetEmpty	= CameraTarget_N_S_N_EmptyList;
			} else if(gSFlag == true){
				gCameraEmpty			= Camera_N_S_S_EmptyList;
				gCameragTargetEmpty	= CameraTarget_N_S_S_EmptyList;
			} else {
				gCameraEmpty = Camera_N_S_S_EmptyList;	//�p�[�e�B�����X�^�[�����Ȃ��ꍇ�͂r�����Ƃ���
				gCameragTargetEmpty	= CameraTarget_N_S_S_EmptyList;
			}
		} else if(gTargetSize == SIZE_N){
			if(gGFlag == true){
				gCameraEmpty			= Camera_N_N_G_EmptyList;
				gCameragTargetEmpty	= CameraTarget_N_N_G_EmptyList;
			} else if(gMFlag == true){
				gCameraEmpty			= Camera_N_N_M_EmptyList;
				gCameragTargetEmpty	= CameraTarget_N_N_M_EmptyList;
			} else if(gNFlag == true){
				gCameraEmpty			= Camera_N_N_N_EmptyList;
				gCameragTargetEmpty	= CameraTarget_N_N_N_EmptyList;
			} else if(gSFlag == true){
				gCameraEmpty			= Camera_N_N_S_EmptyList;
				gCameragTargetEmpty	= CameraTarget_N_N_S_EmptyList;
			} else {
				gCameraEmpty			= Camera_N_N_S_EmptyList;	//�p�[�e�B�����X�^�[�����Ȃ��ꍇ�͂r�����Ƃ���
				gCameragTargetEmpty	= CameraTarget_N_N_S_EmptyList;
			}
		} else if(gTargetSize == SIZE_M){
			if(gGFlag == true){
				gCameraEmpty			= Camera_N_M_G_EmptyList;
				gCameragTargetEmpty	= CameraTarget_N_M_G_EmptyList;
			} else if(gMFlag == true){
				gCameraEmpty			= Camera_N_M_M_EmptyList;
				gCameragTargetEmpty	= CameraTarget_N_M_M_EmptyList;
			} else if(gNFlag == true){
				gCameraEmpty			= Camera_N_M_N_EmptyList;
				gCameragTargetEmpty	= CameraTarget_N_M_N_EmptyList;
			} else if(gSFlag == true){
				gCameraEmpty			= Camera_N_M_S_EmptyList;
				gCameragTargetEmpty	= CameraTarget_N_M_S_EmptyList;
			} else {
				gCameraEmpty			= Camera_N_M_S_EmptyList;	//�p�[�e�B�����X�^�[�����Ȃ��ꍇ�͂r�����Ƃ���
				gCameragTargetEmpty	= CameraTarget_N_M_S_EmptyList;
			}
		} else if(gTargetSize == SIZE_G){
			if(gGFlag == true){
				gCameraEmpty			= Camera_N_G_G_EmptyList;
				gCameragTargetEmpty	= CameraTarget_N_G_G_EmptyList;
			} else if(gMFlag == true){
				gCameraEmpty			= Camera_N_G_M_EmptyList;
				gCameragTargetEmpty	= CameraTarget_N_G_M_EmptyList;
			} else if(gNFlag == true){
				gCameraEmpty			= Camera_N_G_N_EmptyList;
				gCameragTargetEmpty	= CameraTarget_N_G_N_EmptyList;
			} else if(gSFlag == true){
				gCameraEmpty			= Camera_N_G_S_EmptyList;
				gCameragTargetEmpty	= CameraTarget_N_G_S_EmptyList;
			} else {
				gCameraEmpty			= Camera_N_G_S_EmptyList;	//�p�[�e�B�����X�^�[�����Ȃ��ꍇ�͂r�����Ƃ���
				gCameragTargetEmpty	= CameraTarget_N_G_S_EmptyList;
			}
		} else if(gTargetSize == SIZE_T){
			if(gGFlag == true){
				gCameraEmpty			= Camera_N_T_G_EmptyList;
				gCameragTargetEmpty	= CameraTarget_N_T_G_EmptyList;
			} else if(gMFlag == true){
				gCameraEmpty			= Camera_N_T_M_EmptyList;
				gCameragTargetEmpty	= CameraTarget_N_T_M_EmptyList;
			} else if(gNFlag == true){
				gCameraEmpty			= Camera_N_T_N_EmptyList;
				gCameragTargetEmpty	= CameraTarget_N_T_N_EmptyList;
			} else if(gSFlag == true){
				gCameraEmpty			= Camera_N_T_S_EmptyList;
				gCameragTargetEmpty	= CameraTarget_N_T_S_EmptyList;
			} else {
				gCameraEmpty			= Camera_N_T_S_EmptyList;	//�p�[�e�B�����X�^�[�����Ȃ��ꍇ�͂r�����Ƃ���
				gCameragTargetEmpty	= CameraTarget_N_T_S_EmptyList;
			}
		}
	} else if(gAttackSize == SIZE_M){
		if(gTargetSize == SIZE_S){
			if(gGFlag == true){
				gCameraEmpty			= Camera_M_S_G_EmptyList;
				gCameragTargetEmpty	= CameraTarget_M_S_G_EmptyList;
			} else if(gMFlag == true){
				gCameraEmpty			= Camera_M_S_M_EmptyList;
				gCameragTargetEmpty	= CameraTarget_M_S_M_EmptyList;
			} else if(gNFlag == true){
				gCameraEmpty			= Camera_M_S_N_EmptyList;
				gCameragTargetEmpty	= CameraTarget_M_S_N_EmptyList;
			} else if(gSFlag == true){
				gCameraEmpty			= Camera_M_S_S_EmptyList;
				gCameragTargetEmpty	= CameraTarget_M_S_S_EmptyList;
			} else {
				gCameraEmpty			= Camera_M_S_S_EmptyList;	//�p�[�e�B�����X�^�[�����Ȃ��ꍇ�͂r�����Ƃ���
				gCameragTargetEmpty	= CameraTarget_M_S_S_EmptyList;
			}
		} else if(gTargetSize == SIZE_N){
			if(gGFlag == true){
				gCameraEmpty			= Camera_M_N_G_EmptyList;
				gCameragTargetEmpty	= CameraTarget_M_N_G_EmptyList;
			} else if(gMFlag == true){
				gCameraEmpty			= Camera_M_N_M_EmptyList;
				gCameragTargetEmpty	= CameraTarget_M_N_M_EmptyList;
			} else if(gNFlag == true){
				gCameraEmpty			= Camera_M_N_N_EmptyList;
				gCameragTargetEmpty	= CameraTarget_M_N_N_EmptyList;
			} else if(gSFlag == true){
				gCameraEmpty			= Camera_M_N_S_EmptyList;
				gCameragTargetEmpty	= CameraTarget_M_N_S_EmptyList;
			} else {
				gCameraEmpty			= Camera_M_N_S_EmptyList;	//�p�[�e�B�����X�^�[�����Ȃ��ꍇ�͂r�����Ƃ���
				gCameragTargetEmpty	= CameraTarget_M_N_S_EmptyList;
			}
		} else if(gTargetSize == SIZE_M){
			if(gGFlag == true){
				gCameraEmpty			= Camera_M_M_G_EmptyList;
				gCameragTargetEmpty	= CameraTarget_M_M_G_EmptyList;
			} else if(gMFlag == true){
				gCameraEmpty			= Camera_M_M_M_EmptyList;
				gCameragTargetEmpty	= CameraTarget_M_M_M_EmptyList;
			} else if(gNFlag == true){
				gCameraEmpty			= Camera_M_M_N_EmptyList;
				gCameragTargetEmpty	= CameraTarget_M_M_N_EmptyList;
			} else if(gSFlag == true){
				gCameraEmpty			= Camera_M_M_S_EmptyList;
				gCameragTargetEmpty	= CameraTarget_M_M_S_EmptyList;
			} else {
				gCameraEmpty			= Camera_M_M_S_EmptyList;	//�p�[�e�B�����X�^�[�����Ȃ��ꍇ�͂r�����Ƃ���
				gCameragTargetEmpty	= CameraTarget_M_M_S_EmptyList;
			}
		} else if(gTargetSize == SIZE_G){
			if(gGFlag == true){
				gCameraEmpty			= Camera_M_G_G_EmptyList;
				gCameragTargetEmpty	= CameraTarget_M_G_G_EmptyList;
			} else if(gMFlag == true){
				gCameraEmpty			= Camera_M_G_M_EmptyList;
				gCameragTargetEmpty	= CameraTarget_M_G_M_EmptyList;
			} else if(gNFlag == true){
				gCameraEmpty			= Camera_M_G_N_EmptyList;
				gCameragTargetEmpty	= CameraTarget_M_G_N_EmptyList;
			} else if(gSFlag == true){
				gCameraEmpty			= Camera_M_G_S_EmptyList;
				gCameragTargetEmpty	= CameraTarget_M_G_S_EmptyList;
			} else {
				gCameraEmpty			= Camera_M_G_S_EmptyList;	//�p�[�e�B�����X�^�[�����Ȃ��ꍇ�͂r�����Ƃ���
				gCameragTargetEmpty	= CameraTarget_M_G_S_EmptyList;
			}
		} else if(gTargetSize == SIZE_T){
			if(gGFlag == true){
				gCameraEmpty			= Camera_M_T_G_EmptyList;
				gCameragTargetEmpty	= CameraTarget_M_T_G_EmptyList;
			} else if(gMFlag == true){
				gCameraEmpty			= Camera_M_T_M_EmptyList;
				gCameragTargetEmpty	= CameraTarget_M_T_M_EmptyList;
			} else if(gNFlag == true){
				gCameraEmpty			= Camera_M_T_N_EmptyList;
				gCameragTargetEmpty	= CameraTarget_M_T_N_EmptyList;
			} else if(gSFlag == true){
				gCameraEmpty			= Camera_M_T_S_EmptyList;
				gCameragTargetEmpty	= CameraTarget_M_T_S_EmptyList;
			} else {
				gCameraEmpty			= Camera_M_T_S_EmptyList;	//�p�[�e�B�����X�^�[�����Ȃ��ꍇ�͂r�����Ƃ���
				gCameragTargetEmpty	= CameraTarget_M_T_S_EmptyList;
			}
		}
	} else if(gAttackSize == SIZE_G){
		if(gTargetSize == SIZE_S){
			if(gGFlag == true){
				gCameraEmpty			= Camera_G_S_G_EmptyList;
				gCameragTargetEmpty	= CameraTarget_G_S_G_EmptyList;
			} else if(gMFlag == true){
				gCameraEmpty			= Camera_G_S_M_EmptyList;
				gCameragTargetEmpty	= CameraTarget_G_S_M_EmptyList;
			} else if(gNFlag == true){
				gCameraEmpty			= Camera_G_S_N_EmptyList;
				gCameragTargetEmpty	= CameraTarget_G_S_N_EmptyList;
			} else if(gSFlag == true){
				gCameraEmpty			= Camera_G_S_S_EmptyList;
				gCameragTargetEmpty	= CameraTarget_G_S_S_EmptyList;
			} else {
				gCameraEmpty			= Camera_G_S_S_EmptyList;	//�p�[�e�B�����X�^�[�����Ȃ��ꍇ�͂r�����Ƃ���
				gCameragTargetEmpty	= CameraTarget_G_S_S_EmptyList;
			}
		} else if(gTargetSize == SIZE_N){
			if(gGFlag == true){
				gCameraEmpty			= Camera_G_N_G_EmptyList;
				gCameragTargetEmpty	= CameraTarget_G_N_G_EmptyList;
			} else if(gMFlag == true){
				gCameraEmpty			= Camera_G_N_M_EmptyList;
				gCameragTargetEmpty	= CameraTarget_G_N_M_EmptyList;
			} else if(gNFlag == true){
				gCameraEmpty			= Camera_G_N_N_EmptyList;
				gCameragTargetEmpty	= CameraTarget_G_N_N_EmptyList;
			} else if(gSFlag == true){
				gCameraEmpty			= Camera_G_N_S_EmptyList;
				gCameragTargetEmpty	= CameraTarget_G_N_S_EmptyList;
			} else {
				gCameraEmpty			= Camera_G_N_S_EmptyList;	//�p�[�e�B�����X�^�[�����Ȃ��ꍇ�͂r�����Ƃ���
				gCameragTargetEmpty	= CameraTarget_G_N_S_EmptyList;
			}
		} else if(gTargetSize == SIZE_M){
			if(gGFlag == true){
				gCameraEmpty			= Camera_G_M_G_EmptyList;
				gCameragTargetEmpty	= CameraTarget_G_M_G_EmptyList;
			} else if(gMFlag == true){
				gCameraEmpty			= Camera_G_M_M_EmptyList;
				gCameragTargetEmpty	= CameraTarget_G_M_M_EmptyList;
			} else if(gNFlag == true){
				gCameraEmpty			= Camera_G_M_N_EmptyList;
				gCameragTargetEmpty	= CameraTarget_G_M_N_EmptyList;
			} else if(gSFlag == true){
				gCameraEmpty			= Camera_G_M_S_EmptyList;
				gCameragTargetEmpty	= CameraTarget_G_M_S_EmptyList;
			} else {
				gCameraEmpty			= Camera_G_M_S_EmptyList;	//�p�[�e�B�����X�^�[�����Ȃ��ꍇ�͂r�����Ƃ���
				gCameragTargetEmpty	= CameraTarget_G_M_S_EmptyList;
			}
		} else if(gTargetSize == SIZE_G){
			if(gGFlag == true){
				gCameraEmpty			= Camera_G_G_G_EmptyList;
				gCameragTargetEmpty	= CameraTarget_G_G_G_EmptyList;
			} else if(gMFlag == true){
				gCameraEmpty			= Camera_G_G_M_EmptyList;
				gCameragTargetEmpty	= CameraTarget_G_G_M_EmptyList;
			} else if(gNFlag == true){
				gCameraEmpty			= Camera_G_G_N_EmptyList;
				gCameragTargetEmpty	= CameraTarget_G_G_N_EmptyList;
			} else if(gSFlag == true){
				gCameraEmpty			= Camera_G_G_S_EmptyList;
				gCameragTargetEmpty	= CameraTarget_G_G_S_EmptyList;
			} else {
				gCameraEmpty			= Camera_G_G_S_EmptyList;	//�p�[�e�B�����X�^�[�����Ȃ��ꍇ�͂r�����Ƃ���
				gCameragTargetEmpty	= CameraTarget_G_G_S_EmptyList;
			}
		} else if(gTargetSize == SIZE_T){
			if(gGFlag == true){
				gCameraEmpty			= Camera_G_T_G_EmptyList;
				gCameragTargetEmpty	= CameraTarget_G_T_G_EmptyList;
			} else if(gMFlag == true){
				gCameraEmpty			= Camera_G_T_M_EmptyList;
				gCameragTargetEmpty	= CameraTarget_G_T_M_EmptyList;
			} else if(gNFlag == true){
				gCameraEmpty			= Camera_G_T_N_EmptyList;
				gCameragTargetEmpty	= CameraTarget_G_T_N_EmptyList;
			} else if(gSFlag == true){
				gCameraEmpty			= Camera_G_T_S_EmptyList;
				gCameragTargetEmpty	= CameraTarget_G_T_S_EmptyList;
			} else {
				gCameraEmpty			= Camera_G_T_S_EmptyList;	//�p�[�e�B�����X�^�[�����Ȃ��ꍇ�͂r�����Ƃ���
				gCameragTargetEmpty	= CameraTarget_G_T_S_EmptyList;
			}
		}
	} else if(gAttackSize == SIZE_T){
		if(gTargetSize == SIZE_S){
			gCameraEmpty				= Camera_T_S_EmptyList;
			gCameragTargetEmpty		= CameraTarget_T_S_EmptyList;
		} else if(gTargetSize == SIZE_N){
			gCameraEmpty				= Camera_T_N_EmptyList;
			gCameragTargetEmpty		= CameraTarget_T_N_EmptyList;
		} else if(gTargetSize == SIZE_M){
			gCameraEmpty				= Camera_T_M_EmptyList;
			gCameragTargetEmpty		= CameraTarget_T_M_EmptyList;
		} else if(gTargetSize == SIZE_G){
			gCameraEmpty				= Camera_T_G_EmptyList;
			gCameragTargetEmpty = CameraTarget_T_G_EmptyList;
		} else if(gTargetSize == SIZE_T){
			gCameraEmpty				= Camera_T_T_EmptyList;
			gCameragTargetEmpty		= CameraTarget_T_T_EmptyList;
		}
	}
	
}

//���C�h�A�g�p�̊e��p�����[�^�̐ݒ�
function RideCombo_ParamEdit()
{
	
	gJumpActionFlag		<- false;	//�W�����v�A�^�b�N���K�v���H
	gCutStartFrame		<- [];		//�e�J�b�g�̊J�n�t���[����
									//�z��̓J�b�g���ɑΉ�
	
	//=====================================================
	//gJumpActionFlag�̃`�F�b�N
	//�W�����v�A�^�b�N���������Ȃ��͈̂ȉ��̏ꍇ��z��
	
	if(gAttackSize == SIZE_S){
		if(gTargetSize == SIZE_S){	gJumpActionFlag = true;}
		if(gTargetSize == SIZE_N){	gJumpActionFlag = true;}
		if(gTargetSize == SIZE_M){	gJumpActionFlag = true;}
		if(gTargetSize == SIZE_G){	gJumpActionFlag = true;}
		if(gTargetSize == SIZE_T){	gJumpActionFlag = false;}
	} else if(gAttackSize == SIZE_N){
		if(gTargetSize == SIZE_S){	gJumpActionFlag = true;}
		if(gTargetSize == SIZE_N){	gJumpActionFlag = true;}
		if(gTargetSize == SIZE_M){	gJumpActionFlag = true;}
		if(gTargetSize == SIZE_G){	gJumpActionFlag = true;}
		if(gTargetSize == SIZE_T){	gJumpActionFlag = false;}
	} else if(gAttackSize == SIZE_M){
		if(gTargetSize == SIZE_S){	gJumpActionFlag = true;}
		if(gTargetSize == SIZE_N){	gJumpActionFlag = true;}
		if(gTargetSize == SIZE_M){	gJumpActionFlag = true;}
		if(gTargetSize == SIZE_G){	gJumpActionFlag = true;}
		if(gTargetSize == SIZE_T){	gJumpActionFlag = false;}
	} else if(gAttackSize == SIZE_G){
		if(gTargetSize == SIZE_S){	gJumpActionFlag = false;}
		if(gTargetSize == SIZE_N){	gJumpActionFlag = false;}
		if(gTargetSize == SIZE_M){	gJumpActionFlag = false;}
		if(gTargetSize == SIZE_G){	gJumpActionFlag = true;}
		if(gTargetSize == SIZE_T){	gJumpActionFlag = false;}
	} else if(gAttackSize == SIZE_T){
		if(gTargetSize == SIZE_S){	gJumpActionFlag = false;}
		if(gTargetSize == SIZE_N){	gJumpActionFlag = false;}
		if(gTargetSize == SIZE_M){	gJumpActionFlag = false;}
		if(gTargetSize == SIZE_G){	gJumpActionFlag = false;}
		if(gTargetSize == SIZE_T){	gJumpActionFlag = false;}
	}
	
	//=====================================================
	//gCutStartFrame�̃`�F�b�N
	//Blender�t�@�C����̉��t���[���ڂ���Đ����邩��ݒ�
	
	local CutNum = 4;				//���̉��o�Ŏg���J�b�g��
	local Cut00_StartFrame	= 0;	//�J�b�g00�̊J�nFrame
	local Cut01_StartFrame	= 1;	//�J�b�g01�̊J�nFrame
	local Cut02_StartFrame	= 1;	//�J�b�g02�̊J�nFrame
	local Cut03_StartFrame	= 1;	//�J�b�g03�̊J�nFrame
	local Cut04_StartFrame	= 1;	//�J�b�g04�̊J�nFrame
	
	gCutStartFrame.append(Cut00_StartFrame);
	gCutStartFrame.append(Cut01_StartFrame);
	gCutStartFrame.append(Cut02_StartFrame);
	gCutStartFrame.append(Cut03_StartFrame);
	gCutStartFrame.append(Cut04_StartFrame);
	
	
}

//�����X�^�[�̍����̃`�F�b�N
function MonsterHightCheck(Index)
{
	local BonePos = GetBonePos_(Index,"Effect2")
	local LowSetting;
	local HighSetting;
	switch(GetMonsterSize_(Index))
	{
	case SIZE_G:
		LowSetting	= 40;
		HighSetting	= 60;
		break;
	case SIZE_T:
		LowSetting	= 50;
		HighSetting	= 100;
		break;
	default:
		break;
	}
	local PosSet;
	
	print("BonePos	[x] :" + BonePos.x + "\n")
	print("		[y] :" + BonePos.y + "\n")
	print("		[z] :" + BonePos.z + "\n")
	print("GetMonsterSize_(Index)	: " + GetMonsterSize_(Index) + "\n")
	print("LowSetting	: " + LowSetting + "\n")
	print("HighSetting	: " + HighSetting + "\n")
	
	if(BonePos.y < LowSetting){
		PosSet = "Low"
	} else if(BonePos.y >= LowSetting && BonePos.y < HighSetting){
		PosSet = "Middle"
	} else {
		PosSet = "High"
	}
	
	print("PosSet	: " + PosSet + "\n")
	return PosSet;
}