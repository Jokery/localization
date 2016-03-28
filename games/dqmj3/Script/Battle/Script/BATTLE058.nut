// 連続特性

// 初期化
function Init()
{
	DebugPrint("BATTLE058_function_Init")
	BattleCommon_Init();
	//エフェクトのロード（複数体用）
	cActionList <- array(GetActionNum_())
	for(local i = 0 ; i < GetActionNum_() ; i++){
		cActionList[i] =  cActionInfo(i)
		Debug_cActionPrint(cActionList[i])
		ChangeIndexPointData_(PERSONAL_POINT_DATA);
	}
	LoadEffect();
}

// 更新
function Update()
{
	DebugPrint("BATTLE058_function_Update")
	ContinuationEffect(cActionList);
	
	BatteleScript_End();

}
