// �A������

// ������
function Init()
{
	DebugPrint("BATTLE058_function_Init")
	BattleCommon_Init();
	//�G�t�F�N�g�̃��[�h�i�����̗p�j
	cActionList <- array(GetActionNum_())
	for(local i = 0 ; i < GetActionNum_() ; i++){
		cActionList[i] =  cActionInfo(i)
		Debug_cActionPrint(cActionList[i])
		ChangeIndexPointData_(PERSONAL_POINT_DATA);
	}
	LoadEffect();
}

// �X�V
function Update()
{
	DebugPrint("BATTLE058_function_Update")
	ContinuationEffect(cActionList);
	
	BatteleScript_End();

}
