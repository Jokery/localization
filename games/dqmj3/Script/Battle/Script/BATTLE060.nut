// �G�t�F�N�g���ؗpscript

// ������
function Init()
{
	DebugPrint("BATTLE060_function_Init");
	BattleCommon_Init();
	local actor = GetActorIndex_(0);
	
	//�G�t�F�N�g
	LoadEffect_("EF010_01_HIT");

	gSFlag <- false;
	gMFlag <- false;
	gGFlag <- false;
	
	gTargetNum <- GetgTargetNum_(0);
	if(gTargetNum >= 1){
		gTarget1 <- GetTargetMonster(0);
		gTarget1Size <- GetMonsterSize_(gTarget1);
		if(gTarget1Size == SIZE_S){gSFlag = true;}
		if(gTarget1Size == SIZE_M){gMFlag = true;}
		if(gTarget1Size == SIZE_G){gGFlag = true;}
	} else {
		//�������Ȃ�
	}
	if(gTargetNum >= 2){
		gTarget2 <- GetTargetMonster(1);
		gTarget2Size <- GetMonsterSize_(gTarget2);
		if(gTarget1Size == SIZE_S){gSFlag = true;}
		if(gTarget1Size == SIZE_M){gMFlag = true;}
		if(gTarget1Size == SIZE_G){gGFlag = true;}
	} else {
		//�������Ȃ�
	}
	if(gTargetNum >= 3){
		gTarget3 <- GetTargetMonster(2);
		gTarget3Size <- GetMonsterSize_(gTarget3);
		if(gTarget3Size == SIZE_S){gSFlag = true;}
		if(gTarget3Size == SIZE_M){gMFlag = true;}
		if(gTarget3Size == SIZE_G){gGFlag = true;}
	} else {
		//�������Ȃ�
	}

	if(gTargetNum >= 4){
		ggTarget4 <- GetTargetMonster(3);
		gTarget4Size <- GetMonsterSize_(gTarget4);
		if(gTarget4Size == SIZE_S){gSFlag = true;}
		if(gTarget4Size == SIZE_M){gMFlag = true;}
		if(gTarget4Size == SIZE_G){gGFlag = true;}
	} else {
		//�������Ȃ�
	}


	LoadEffect_("EF000_01_MAGIC_ARIA");
	gTestEffect <- "EF110_14_IONAZUN";
	LoadEffect_(gTestEffect);

	gEffectEmpty_S <- 301;
	gEffectEmpty_M <- 302;
	gEffectEmpty_G <- 303;
	gEffectEmpty_T <- 304;

}

// �X�V
function Update()
{
	DebugPrint("BATTLE060_function_Update")
	//�g��Ȃ������X�^�[���\��
	local actor = GetActorIndex_(0);
	SetVisible_(actor, false);
	
	//�Ώ۔���
	local gTargetNum;
	gTargetNum = GetgTargetNum_(0);
	if(gTargetNum == 1){
		SINGLE()
	} else {
		MULTI(gTargetNum)
	}
}

//�P��Ώ�
function SINGLE()
{
	DebugPrint("BATTLE060_function_SINGLE")
	//�r�T�C�Y�̏ꍇ
	if(gTarget1Size == SIZE_S ){
		Task_AnimeMoveCamera_(4);
		Task_AnimeMoveCharNoDir_(gTarget1, 7);
		local EffectPos = gEffectEmpty_S;
	//�l�T�C�Y�̏ꍇ
	} else if(gTarget1Size == SIZE_M ){
		Task_AnimeMoveCamera_(4);
		Task_AnimeMoveCharNoDir_(gTarget1, 7);
		local EffectPos = gEffectEmpty_M;
	//�f�T�C�Y�̏ꍇ
	} else if(gTarget1Size == SIZE_G ){
		Task_AnimeMoveCamera_(5);
		Task_AnimeMoveCharNoDir_(gTarget1, 11);
		local EffectPos = gEffectEmpty_G;
	} else {
		Task_AnimeMoveCamera_(6);
		Task_AnimeMoveCharNoDir_(gTarget1, 13);
		local EffectPos = gEffectEmpty_T;
	}

	SetMotion_(gTarget1, MOT_WAIT, 4);
	SetDir_(gTarget1, -90);

	//==========================================	

	Kind_Direction(gTarget1);
	
	//�����\���p
	SetVisible_(gTarget1, false);
	local Effect = SetPointWorldEffect_(gTestEffect, EffectPos);
	SetEffectScale_(Effect, 1.0);
	//�Ƃ肠����Wait��ݒ�
	Wait_(120);


	BatteleScript_End();
}

// �����Ώ�
function MULTI(gTargetNum)
{
	DebugPrint("BATTLE060_function_MULTI")
	//�^�[�Q�b�g���̊m�F
	//�^�[�Q�b�g���Q�C
	if(gTargetNum == 2){
		SetVisible_(gTarget2, true);;
	//�^�[�Q�b�g���R�C{
	} else if(gTargetNum == 3){
	
		SetVisible_(gTarget2, true);
		SetVisible_(gTarget3, true);
	}
	//�^�[�Q�b�g���S�C{
	else if(gTargetNum == 4){
		SetVisible_(gTarget2, true);
		SetVisible_(gTarget3, true);
		SetVisible_(gTarget4, true);
	}

	//�^�[�Q�b�g���ƁA�p�[�e�B�\���ɉ����Ċ֐��Ăяo��
	if(gTargetNum == 4){
		//�r�S�̍\��
		S4Action()
	} else if(gTargetNum == 3 ){
		//�r�R�̂܂��́A�r�Q�́{�l�P��
		S3Action()
	} else if(gTargetNum == 2 && gGFlag == true ){
		//�f�P�́{�r�P�̍\��
		G1S1Action()
	} else if(gTargetNum == 2 && gGFlag == false ){
		//�l�Q�́A�܂��͂r�P�́{�l�P�́A�܂��͂r�Q��
		S2Action();
	} else if(gTargetNum == 1 && gGFlag == false ){
		//�l�P�́A�܂��͂r�P��
		S1Action()
	} else if(gTargetNum == 1 && gGFlag == true ){
		//�f�P��
		G1Action()
	} else {
		//�s�P��
		S1Action()
	}
	BatteleScript_End();

}


function S4Action()	//�r�S�̂̏ꍇ�͂��̕���
{
	DebugPrint("BATTLE060_function_S4Action")

	//�ΏۂƂȂ郂���X�^�[�̔z�u
	Task_AnimeMoveCharNoDir_(gTarget1, 1);
	Task_AnimeMoveCharNoDir_(gTarget2, 2);
	Task_AnimeMoveCharNoDir_(gTarget3, 3);
	Task_AnimeMoveCharNoDir_(gTarget4, 4);
	Task_AnimeMoveCamera_(0);
	SetDir_(gTarget1, -90);
	SetDir_(gTarget2, -90);
	SetDir_(gTarget3, -90);
	SetDir_(gTarget4, -90);
	
	Kind_Direction(gTarget1)
	Kind_Direction(gTarget2)
	Kind_Direction(gTarget3)
	Kind_Direction(gTarget4)

	//�Ƃ肠�����҂��̎ڂ�����
	Wait_(90);

}


function S3Action()			//�r�R�́C�܂��͂r�Q�́{�l�P�̂̏ꍇ�͂��̕���
{
	DebugPrint("BATTLE060_function_S3Action")
	//�ΏۂƂȂ郂���X�^�[�̔z�u
	Task_AnimeMoveCharNoDir_(gTarget1, 6);
	Task_AnimeMoveCharNoDir_(gTarget2, 7);
	Task_AnimeMoveCharNoDir_(gTarget3, 8);
	Task_AnimeMoveCamera_(0);
	SetDir_(gTarget1, -90);
	SetDir_(gTarget2, -90);
	SetDir_(gTarget3, -90);

	Kind_Direction(gTarget1)
	Kind_Direction(gTarget2)
	Kind_Direction(gTarget3)

	//�Ƃ肠�����҂��̎ڂ�����
	Wait_(90);
}

function S2Action()			//�r�Q�́C�܂��͂r�P�́{�l�P�̂̏ꍇ�͂��̕���
{
	DebugPrint("BATTLE060_function_S2Action")
	//�ΏۂƂȂ郂���X�^�[�̔z�u
	Task_AnimeMoveCharNoDir_(gTarget1, 6);
	Task_AnimeMoveCharNoDir_(gTarget2, 8);
	Task_AnimeMoveCamera_(0);
	SetDir_(gTarget1, -90);
	SetDir_(gTarget2, -90);

	Kind_Direction(gTarget1)
	Kind_Direction(gTarget2)

	//�Ƃ肠�����҂��̎ڂ�����
	Wait_(90);

}

function S1Action()			//�r�P�́C�܂��͂l�P�̂̏ꍇ�͂��̕���
{
	DebugPrint("BATTLE060_function_S1Action")
	//�ΏۂƂȂ郂���X�^�[�̔z�u
	Task_AnimeMoveCharNoDir_(gTarget1, 11);
	Task_AnimeMoveCamera_(0);
	SetDir_(gTarget1, -90);

	//�G�t�F�N�g�Đ���SE�Đ�
	Kind_Direction(gTarget1)

	//�Ƃ肠�����҂��̎ڂ�����
	Wait_(90);

}

function G1S1Action()			//�r�P�́{�f�P�̂̏ꍇ�͂��̕���
{
	DebugPrint("BATTLE060_function_G1S1Action")
	//�ΏۂƂȂ郂���X�^�[�̔z�u
	Task_AnimeMoveCharNoDir_(gTarget1, 10);
	Task_AnimeMoveCharNoDir_(gTarget2, 11);
	Task_AnimeMoveCamera_(0);
	SetDir_(gTarget1, -90);
	SetDir_(gTarget2, -90);

	Kind_Direction(gTarget1)
	Kind_Direction(gTarget2)

	//�Ƃ肠�����҂��̎ڂ�����
	Wait_(90);

}

function G1Action()			//�f�P�̂̏ꍇ�͂��̕���
{
	DebugPrint("BATTLE060_function_G1Action")
	//�ΏۂƂȂ郂���X�^�[�̔z�u
	Task_AnimeMoveCharNoDir_(gTarget1, 10);
	Task_AnimeMoveCamera_(0);
	SetDir_(gTarget1, -90);

	Kind_Direction(gTarget1)

	//�Ƃ肠�����҂��̎ڂ�����
	Wait_(90);

}

function T1Action(gTarget1)			//�s�P�̂̏ꍇ�͂��̕���
{
	DebugPrint("BATTLE060_function_T1Action")
	//�ΏۂƂȂ郂���X�^�[�̔z�u
	Task_AnimeMoveCharNoDir_(gTarget1, 13);
	Task_AnimeMoveCamera_(0);
	SetDir_(gTarget1, -90);

	Kind_Direction(gTarget1)

	//�Ƃ肠�����҂��̎ڂ�����
	Wait_(90);

}

function Kind_Direction(Target)
{
	DebugPrint("BATTLE060_function_Kind_Direction")
	local Kind = GetActionEfficacy_();
	
	//
	
	if (Kind == EFFICACY.ATTACK){
		//�_���[�W�̏ꍇ
		SetDamageEffectSE(Target,true);
		SetMotion_(Target, MOT_DAMAGE, 4);
	} else if (Kind == EFFICACY.HEAL) {
		//�񕜂̏ꍇ
		SetBoneEffect_("EF010_01_HIT", Target);
	} else if (Kind == EFFICACY.HEAL) {
		//�h���̏ꍇ
	} else if (Kind == EFFICACY.OTHER) {
		//����ȊO�̏ꍇ
	}
}
