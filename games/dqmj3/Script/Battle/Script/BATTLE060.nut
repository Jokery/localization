// エフェクト検証用script

// 初期化
function Init()
{
	DebugPrint("BATTLE060_function_Init");
	BattleCommon_Init();
	local actor = GetActorIndex_(0);
	
	//エフェクト
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
		//何もしない
	}
	if(gTargetNum >= 2){
		gTarget2 <- GetTargetMonster(1);
		gTarget2Size <- GetMonsterSize_(gTarget2);
		if(gTarget1Size == SIZE_S){gSFlag = true;}
		if(gTarget1Size == SIZE_M){gMFlag = true;}
		if(gTarget1Size == SIZE_G){gGFlag = true;}
	} else {
		//何もしない
	}
	if(gTargetNum >= 3){
		gTarget3 <- GetTargetMonster(2);
		gTarget3Size <- GetMonsterSize_(gTarget3);
		if(gTarget3Size == SIZE_S){gSFlag = true;}
		if(gTarget3Size == SIZE_M){gMFlag = true;}
		if(gTarget3Size == SIZE_G){gGFlag = true;}
	} else {
		//何もしない
	}

	if(gTargetNum >= 4){
		ggTarget4 <- GetTargetMonster(3);
		gTarget4Size <- GetMonsterSize_(gTarget4);
		if(gTarget4Size == SIZE_S){gSFlag = true;}
		if(gTarget4Size == SIZE_M){gMFlag = true;}
		if(gTarget4Size == SIZE_G){gGFlag = true;}
	} else {
		//何もしない
	}


	LoadEffect_("EF000_01_MAGIC_ARIA");
	gTestEffect <- "EF110_14_IONAZUN";
	LoadEffect_(gTestEffect);

	gEffectEmpty_S <- 301;
	gEffectEmpty_M <- 302;
	gEffectEmpty_G <- 303;
	gEffectEmpty_T <- 304;

}

// 更新
function Update()
{
	DebugPrint("BATTLE060_function_Update")
	//使わないモンスターを非表示
	local actor = GetActorIndex_(0);
	SetVisible_(actor, false);
	
	//対象判定
	local gTargetNum;
	gTargetNum = GetgTargetNum_(0);
	if(gTargetNum == 1){
		SINGLE()
	} else {
		MULTI(gTargetNum)
	}
}

//単一対象
function SINGLE()
{
	DebugPrint("BATTLE060_function_SINGLE")
	//Ｓサイズの場合
	if(gTarget1Size == SIZE_S ){
		Task_AnimeMoveCamera_(4);
		Task_AnimeMoveCharNoDir_(gTarget1, 7);
		local EffectPos = gEffectEmpty_S;
	//Ｍサイズの場合
	} else if(gTarget1Size == SIZE_M ){
		Task_AnimeMoveCamera_(4);
		Task_AnimeMoveCharNoDir_(gTarget1, 7);
		local EffectPos = gEffectEmpty_M;
	//Ｇサイズの場合
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
	
	//呪文表示用
	SetVisible_(gTarget1, false);
	local Effect = SetPointWorldEffect_(gTestEffect, EffectPos);
	SetEffectScale_(Effect, 1.0);
	//とりあえずWaitを設定
	Wait_(120);


	BatteleScript_End();
}

// 複数対象
function MULTI(gTargetNum)
{
	DebugPrint("BATTLE060_function_MULTI")
	//ターゲット数の確認
	//ターゲットが２匹
	if(gTargetNum == 2){
		SetVisible_(gTarget2, true);;
	//ターゲットが３匹{
	} else if(gTargetNum == 3){
	
		SetVisible_(gTarget2, true);
		SetVisible_(gTarget3, true);
	}
	//ターゲットが４匹{
	else if(gTargetNum == 4){
		SetVisible_(gTarget2, true);
		SetVisible_(gTarget3, true);
		SetVisible_(gTarget4, true);
	}

	//ターゲット数と、パーティ構成に応じて関数呼び出し
	if(gTargetNum == 4){
		//Ｓ４体構成
		S4Action()
	} else if(gTargetNum == 3 ){
		//Ｓ３体または、Ｓ２体＋Ｍ１体
		S3Action()
	} else if(gTargetNum == 2 && gGFlag == true ){
		//Ｇ１体＋Ｓ１体構成
		G1S1Action()
	} else if(gTargetNum == 2 && gGFlag == false ){
		//Ｍ２体、またはＳ１体＋Ｍ１体、またはＳ２体
		S2Action();
	} else if(gTargetNum == 1 && gGFlag == false ){
		//Ｍ１体、またはＳ１体
		S1Action()
	} else if(gTargetNum == 1 && gGFlag == true ){
		//Ｇ１体
		G1Action()
	} else {
		//Ｔ１体
		S1Action()
	}
	BatteleScript_End();

}


function S4Action()	//Ｓ４体の場合はこの分岐
{
	DebugPrint("BATTLE060_function_S4Action")

	//対象となるモンスターの配置
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

	//とりあえず待ちの尺を決定
	Wait_(90);

}


function S3Action()			//Ｓ３体，またはＳ２体＋Ｍ１体の場合はこの分岐
{
	DebugPrint("BATTLE060_function_S3Action")
	//対象となるモンスターの配置
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

	//とりあえず待ちの尺を決定
	Wait_(90);
}

function S2Action()			//Ｓ２体，またはＳ１体＋Ｍ１体の場合はこの分岐
{
	DebugPrint("BATTLE060_function_S2Action")
	//対象となるモンスターの配置
	Task_AnimeMoveCharNoDir_(gTarget1, 6);
	Task_AnimeMoveCharNoDir_(gTarget2, 8);
	Task_AnimeMoveCamera_(0);
	SetDir_(gTarget1, -90);
	SetDir_(gTarget2, -90);

	Kind_Direction(gTarget1)
	Kind_Direction(gTarget2)

	//とりあえず待ちの尺を決定
	Wait_(90);

}

function S1Action()			//Ｓ１体，またはＭ１体の場合はこの分岐
{
	DebugPrint("BATTLE060_function_S1Action")
	//対象となるモンスターの配置
	Task_AnimeMoveCharNoDir_(gTarget1, 11);
	Task_AnimeMoveCamera_(0);
	SetDir_(gTarget1, -90);

	//エフェクト再生とSE再生
	Kind_Direction(gTarget1)

	//とりあえず待ちの尺を決定
	Wait_(90);

}

function G1S1Action()			//Ｓ１体＋Ｇ１体の場合はこの分岐
{
	DebugPrint("BATTLE060_function_G1S1Action")
	//対象となるモンスターの配置
	Task_AnimeMoveCharNoDir_(gTarget1, 10);
	Task_AnimeMoveCharNoDir_(gTarget2, 11);
	Task_AnimeMoveCamera_(0);
	SetDir_(gTarget1, -90);
	SetDir_(gTarget2, -90);

	Kind_Direction(gTarget1)
	Kind_Direction(gTarget2)

	//とりあえず待ちの尺を決定
	Wait_(90);

}

function G1Action()			//Ｇ１体の場合はこの分岐
{
	DebugPrint("BATTLE060_function_G1Action")
	//対象となるモンスターの配置
	Task_AnimeMoveCharNoDir_(gTarget1, 10);
	Task_AnimeMoveCamera_(0);
	SetDir_(gTarget1, -90);

	Kind_Direction(gTarget1)

	//とりあえず待ちの尺を決定
	Wait_(90);

}

function T1Action(gTarget1)			//Ｔ１体の場合はこの分岐
{
	DebugPrint("BATTLE060_function_T1Action")
	//対象となるモンスターの配置
	Task_AnimeMoveCharNoDir_(gTarget1, 13);
	Task_AnimeMoveCamera_(0);
	SetDir_(gTarget1, -90);

	Kind_Direction(gTarget1)

	//とりあえず待ちの尺を決定
	Wait_(90);

}

function Kind_Direction(Target)
{
	DebugPrint("BATTLE060_function_Kind_Direction")
	local Kind = GetActionEfficacy_();
	
	//
	
	if (Kind == EFFICACY.ATTACK){
		//ダメージの場合
		SetDamageEffectSE(Target,true);
		SetMotion_(Target, MOT_DAMAGE, 4);
	} else if (Kind == EFFICACY.HEAL) {
		//回復の場合
		SetBoneEffect_("EF010_01_HIT", Target);
	} else if (Kind == EFFICACY.HEAL) {
		//蘇生の場合
	} else if (Kind == EFFICACY.OTHER) {
		//それ以外の場合
	}
}
