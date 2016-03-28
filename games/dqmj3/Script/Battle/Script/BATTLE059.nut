// 関数テスト用（連続魔法）

// 初期化
function Init()
{
	DebugPrint("BATTLE059_function_Init")
	BattleCommon_Init();
	LoadEffect();
}

// 更新
function Update()
{
	DebugPrint("BATTLE059_function_Update")
	ContinuationMagic();
	
	BatteleScript_End();

}
