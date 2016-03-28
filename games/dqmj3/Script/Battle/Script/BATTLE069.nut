// “¦–S¸”s

// ‰Šú‰»
function Init()
{
	DebugPrint("BATTLE075_function_Init")
	BattleCommon_Init();
	gMultiCount <- 0;
	Enemy00 = GetEnemyIndex_(0)
	cParty <- cFullPartyInfo(Enemy00);
	
}

// XV
function Update()
{
	DebugPrint("BATTLE075_function_Update")
	Cut_Escape()
	BatteleScript_End();
	
}

//“¦–S–WŠQƒJƒbƒg
function Cut_Escape()
{
	ShowBattleEventMessage_(false , 27)
	switch(cParty.PartyType)
	{
		case PARTYTYPE.S4:
		case PARTYTYPE.S3:
		case PARTYTYPE.S2:
		case PARTYTYPE.S1:
			Task_AnimeMoveCamera_("camera_EscapeFailure_Enemy_S4","camtgt_EscapeFailure_Enemy_S4");
			Wait_(60);
			break;
		case PARTYTYPE.SG:
		case PARTYTYPE.GS:
		case PARTYTYPE.G1:
			Task_AnimeMoveCamera_("camera_EscapeFailure_Enemy_SG","camtgt_EscapeFailure_Enemy_SG");
			Wait_(60);
			break;
		case PARTYTYPE.T1:
			Task_AnimeMoveCamera_("camera_EscapeFailure_Enemy_T1","camtgt_EscapeFailure_Enemy_T1");
			Wait_(60);
			break;
		default:
			//DebugPrint(("++++++++++PartyTypeError!++++++++++" + "\n")
			//DebugPrint(("cParty.PartyType	: " + + "\n")
	}
}
