// 上級呪文に分岐する演出

// 初期化
function Init()
{
	DebugPrint("BATTLE050_function_Init")
	BattleCommon_Init();

}

// 更新
function Update()
{
	DebugPrint("BATTLE050_function_Update")
	HighRankSpell();

	BatteleScript_End();

}
