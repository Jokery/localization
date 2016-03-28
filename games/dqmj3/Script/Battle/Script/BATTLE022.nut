// スカウト開始用

// 初期化
function Init()
{
	BattleCommon_Init();
	DebugPrint("BATTLE022_function_Init")
	LoadEffect_("EF000_07_SA_AURA")
	
	for(local i = 0 ; i < 4 ; i++){
		SetVisible_(GetEnemyIndex_(i), false);
	}
}

// 更新
function Update()
{
	DebugPrint("BATTLE022_function_Update")
	BeginTryScoutScene_();
	//ReplaySE_("SE_BTL_043");
	//Gosign(CUTIN_SCOUT);
	
	ChangeIndexPointData_(PERSONAL_POINT_DATA);
	DeleteAllTask_();
	StartCombo_(0);
	CreateScoutGauge_();
	SetVisibleScoutGauge_(false);
	local itemValue = GetScoutItemValue_();
	SetScoutGaugeValue_(itemValue);
	LoadEffect()
	
	//ステータスUI反映
	for(local i = 0 ; i < 4 ; i++){
		if(GetAllyIndex_(i) != INVALID_CHARACTER){
			SetStatusChange_(0,i)
		}
	}
	
	//スカウトアタック
	ScoutAttack_FrontCut()
	
	
	BatteleScript_End();
}

function ScoutAttack_FrontCut()
{
	DebugPrint("BATTLE022_function_" + "ScoutAttack_FrontCut")
	
	local CameraFlag	= true;
	local AllyFlag		= true;
/*	
	cParty <- cSelectionPartyInfo(AllyIndex[0],AllyIndex[1],AllyIndex[2],AllyIndex[3])
	Wait_(10)
	CharaStand_PartyInfo(cParty,false,null);
*/
	DeleteAllTask_();
	CharaStand_PartyFull(true,true)
	ReplaySE_("SE_BTL_013")
	
	FilterOn_(0, 0, 0, 100);
	Wait_(10)
	
	for(local i = 0 ; i < 4 ; i++){
		if(GetAllyIndex_(i) != INVALID_CHARACTER){
			if(GetInitExistType_(GetAllyIndex_(i)) == LIVETYPE.ACTIVE){
				EffParamSizeEffect(GetAllyIndex_(i),"EF000_07_SA_AURA")
				Wait_(3)
			}
		}
	}
	
	Wait_(30)
}
