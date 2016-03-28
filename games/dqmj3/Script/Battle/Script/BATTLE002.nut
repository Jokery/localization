// 戦闘開始（敵側）

// 初期化
function Init()
{
	DebugPrint("BATTLE001_function_Init");
	BattleCommon_Init();
	//モンスターの配置は初期設定のものを利用
}

// 更新
function Update()
{
	DebugPrint("BATTLE001_function_Update");
	DeleteAllTask_();
	//CameraDateはBattleCommonに内蔵
	ChangeIndexPointData_(BATTLE_COMMON_POINT_DATA);
	local Ally = true;
	local Enemy = false;
	local AllyPartyType = Get_PartyType(Ally);
	local EnemyPartyType = Get_PartyType(Enemy);
	
	local preemptSide = GetPreemptSide_();
	
	switch(preemptSide)
	{
		case PREEMPTSIDE.NONE:
			//通常登場演出
			EnemyBattleStartCut(EnemyPartyType);
			break;
		case PREEMPTSIDE.ALLY:
			//先制攻撃演出
			EnemyBattleStartCut(EnemyPartyType);
			EnemyBattleStartCut_FirstStrike();
			break;
		case PREEMPTSIDE.ENEMY:
			//不意打ち演出
			EnemyBattleStartCut(EnemyPartyType);
			EnemyBattleStartCut_SurpriseAttack();
			break;
		default:
			EnemyBattleStartCut(EnemyPartyType);
			break;
	}
	
	BatteleScript_End();
}

//敵パーティ通常登場カット
function EnemyBattleStartCut(PartyType)
{
	DebugPrint("BATTLE002_function_EnemyBattleStartCut");
	DebugPrint("	=>	PartyType : " + PartyType);
	//local Random = GetRandom_(3);
	local CameraTask = null;
	//Ｓ構成
	switch(PartyType){
		case PARTYTYPE.S4:
		case PARTYTYPE.S3:
		case PARTYTYPE.S2:
		case PARTYTYPE.S1:
			CameraTask = Task_AnimeMoveCamera_("camera_350_ENEMY_S4_00", "camtgt_350_ENEMY_S4_00");
			Wait_(29);
			break;
		case PARTYTYPE.SG:
		case PARTYTYPE.GS:
		case PARTYTYPE.G1:
			CameraTask = Task_AnimeMoveCamera_("camera_360_ENEMY_SG_00", "camtgt_360_ENEMY_SG_00");
			Wait_(29);
			break;
		case PARTYTYPE.T1:
			CameraTask = Task_AnimeMoveCamera_("camera_370_ENEMY_T1_00", "camtgt_370_ENEMY_T1_00");
			Wait_(30);
			break;
		default:
			//DebugPrint("**************************************" + "\n")
			//DebugPrint("BATTLE002_function_EnemyBattleStartCut" + "\n")
			//DebugPrint("PARTYTYPE_SELECTION_ERROR" + "\n")
			//DebugPrint("PARTYTYPE	: " + PartyType + "\n")
			//DebugPrint("**************************************" + "\n")
			ScriptStop()
			break;
	}
	
}

//敵パーティ先制攻撃登場カット
function EnemyBattleStartCut_FirstStrike()
{
	DebugPrint("BATTLE002_function_" + "IN" + "EnemyBattleStartCut_FirstStrike");
	local CameraFlag	= true;
	local AllyFlag		= false;
	//CharaStand_PartyFull(CameraFlag,AllyFlag)
	ShowBattleEventMessage_(true, 25);
	Wait_(30)
	
	DebugPrint("BATTLE002_function_" + "OUT" + "EnemyBattleStartCut_FirstStrike");
}

//敵パーティ不意打ち登場カット
function EnemyBattleStartCut_SurpriseAttack()
{
	DebugPrint("BATTLE002_function_" + "IN" + "EnemyBattleStartCut_SurpriseAttack");
	local CameraFlag	= true;
	local AllyFlag		= false;
	//CharaStand_PartyFull(CameraFlag,AllyFlag)
	ShowBattleEventMessage_(false, 26);
	SetFadeSub_(FADE_IN, FADE_COLOR_BLACK, 15);
	Wait_(30)
	
	DebugPrint("BATTLE002_function_" + "OUT" + "EnemyBattleStartCut_SurpriseAttack");
}