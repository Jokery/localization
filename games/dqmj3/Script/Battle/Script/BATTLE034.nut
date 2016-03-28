// “¦–S¸”s

// ‰Šú‰»
function Init()
{
	DebugPrint("BATTLE075_function_Init")
	BattleCommon_Init();
	gMultiCount <- 0;
	local Enemy00 = GetEnemyIndex_(0)
	cParty <- cFullPartyInfo(Enemy00);
	
}

// XV
function Update()
{
	DebugPrint("BATTLE075_function_Update")
	CharaStand_NonCamera(false);
	Cut_Escape()
	BatteleScript_End();
	
}

//“¦–S–WŠQƒJƒbƒg
function Cut_Escape()
{
	ShowBattleEventMessage_(false , 27)
	ChangeIndexPointData_(BATTLE_COMMON_POINT_DATA);
	switch(cParty.PartyType)
	{
		case PARTYTYPE.S4:
		case PARTYTYPE.S3:
		case PARTYTYPE.S2:
		case PARTYTYPE.S1:
			//Task_AnimeMoveCamera_("camera_EscapeFailure_Enemy_S4","camtgt_EscapeFailure_Enemy_S4");
			Task_SetFrameAnimeMoveCamera_("camera_EscapeFailure_Enemy_S4","camtgt_EscapeFailure_Enemy_S4",10);
			Wait_(50);
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
			//DebugPrint(("cParty.PartyType	: " + cParty.PartyType + "\n")
	}
}
