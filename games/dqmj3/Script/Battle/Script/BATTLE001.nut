// 戦闘開始（味方側）

// 初期化
function Init()
{
	DebugPrint("BATTLE001_function_Init");
	BattleCommon_Init();
	//モンスターの配置は初期設定のものを利用
	local Index = GetAllyIndex_(0)
	cParty <- cFullPartyInfo(Index);
	
}

// 更新
function Update()
{
	DebugPrint("BATTLE001_function_Update");
	//CameraDateはBattleCommonに内蔵
	ChangeIndexPointData_(BATTLE_COMMON_POINT_DATA);
	local Ally = true;
	local Enemy = false;
	local AllyPartyType = Get_PartyType(Ally);
	local EnemyPartyType = Get_PartyType(Enemy);
	
	AllyBattleStartCut(AllyPartyType);
	
	//SetMotion_(GetAllyMaster_() , MOT_BATTLE_WAIT, 0);
	
	//離脱用処理
	//AllyEscapeCut(AllyPartyType);
	
	BatteleScript_End();
}

function AllyBattleStartCut(PartyType)
{
	DebugPrint("BATTLE001_function_AllyBattleStartCut");
	DebugPrint("	=>	PartyType : " + PartyType);
	local Random = GetRandom_(3);
	local CameraTask = null;
	local RideFlag = true;
	//ＳＮＭ構成
	if(PartyType == PARTYTYPE.S4 || PartyType == PARTYTYPE.S3 || PartyType == PARTYTYPE.S2 || PartyType == PARTYTYPE.S1){
		if(cParty.MFlag != true){
			//ＳＮ構成
			if(RideFlag == true){
				//ライド状態の場合
				//CameraTask = Task_AnimeMoveCamera_("camera_300_ALLY_S_RIDEON", "camtgt_300_ALLY_S_RIDEON");
				CameraTask = Task_AnimeMoveCamera_("camera_300_ALLY_S_RIDEOFF", "camtgt_300_ALLY_S_RIDEOFF");
				Wait_(38);
			} else {
				//非ライド状態の場合
				CameraTask = Task_AnimeMoveCamera_("camera_300_ALLY_S_RIDEOFF", "camtgt_300_ALLY_S_RIDEOFF");
				Wait_(38);
			}
		} else {
			//Ｍ構成
			if(RideFlag == true){
				//ライド状態の場合
				//CameraTask = Task_AnimeMoveCamera_("camera_300_ALLY_S_RIDEON", "camtgt_300_ALLY_S_RIDEON");
				CameraTask = Task_AnimeMoveCamera_("camera_300_ALLY_S_RIDEOFF", "camtgt_300_ALLY_S_RIDEOFF");
				//Wait_(36);
				Wait_(38);
			} else {
				//非ライド状態の場合
				CameraTask = Task_AnimeMoveCamera_("camera_300_ALLY_S_RIDEOFF", "camtgt_300_ALLY_S_RIDEOFF");
				Wait_(38);
			}
		}
	//Ｇ体構成
	} else if (PartyType == PARTYTYPE.SG || PartyType == PARTYTYPE.GS || PartyType == PARTYTYPE.G1) {
			if(RideFlag == true){
				//ライド状態の場合
				//CameraTask = Task_AnimeMoveCamera_("camera_310_ALLY_SG_RIDEON", "camtgt_310_ALLY_SG_RIDEON");
				CameraTask = Task_AnimeMoveCamera_("camera_310_ALLY_SG_RIDEOFF", "camtgt_310_ALLY_SG_RIDEOFF");
				Wait_(60);
			} else {
				//非ライド状態の場合
				CameraTask = Task_AnimeMoveCamera_("camera_310_ALLY_SG_RIDEOFF", "camtgt_310_ALLY_SG_RIDEOFF");
				Wait_(60);
			}
	//Ｔ体構成
	} else if (PartyType == PARTYTYPE.T1) {
			if(RideFlag == true){
				//ライド状態の場合
				//CameraTask = Task_AnimeMoveCamera_("camera_320_ALLY_T1_RIDEON", "camtgt_320_ALLY_T1_RIDEON");
				CameraTask = Task_AnimeMoveCamera_("camera_320_ALLY_T1_RIDEOFF", "camtgt_320_ALLY_T1_RIDEOFF");
				Wait_(60);
			} else {
				//非ライド状態の場合
				CameraTask = Task_AnimeMoveCamera_("camera_320_ALLY_T1_RIDEOFF", "camtgt_320_ALLY_T1_RIDEOFF");
				Wait_(60);
			}		
	}
	//DeleteTask_(CameraTask);
}

function AllyEscapeCut(PartyType)
{
	DebugPrint("BATTLE001_function_AllyEscapeCut");
	DebugPrint("	=>	PartyType : " + PartyType);
	local Random = GetRandom_(3);
	local CameraTask = null;
	//Ｓ４構成
	if(PartyType == PARTYTYPE.S4){
		CameraTask = Task_AnimeMoveCamera_("camera_300_ALLY_S4_00", "camtgt_300_ALLY_S4_00");
		
		Wait_(30);
	//Ｓ３体構成
	} else if (PartyType == PARTYTYPE.S3) {
		CameraTask = Task_AnimeMoveCamera_("camera_300_ALLY_S4_00", "camtgt_300_ALLY_S4_00");
		
		Wait_(60);
	//Ｓ２体構成
	} else if (PartyType == PARTYTYPE.S2) {
		CameraTask = Task_AnimeMoveCamera_("camera_300_ALLY_S4_00", "camtgt_300_ALLY_S4_00");
		
		Wait_(60);
	//Ｓ１体構成
	} else if (PartyType == PARTYTYPE.S1) {
		CameraTask = Task_AnimeMoveCamera_("camera_300_ALLY_S4_00", "camtgt_300_ALLY_S4_00");
		
		Wait_(60);
	//ＳＧ体構成
	} else if (PartyType == PARTYTYPE.SG) {
		CameraTask = Task_AnimeMoveCamera_("camera_300_ALLY_S4_00", "camtgt_300_ALLY_S4_00");
		
		Wait_(60);
	//ＧＳ体構成
	} else if (PartyType == PARTYTYPE.GS) {
		CameraTask = Task_AnimeMoveCamera_("camera_300_ALLY_S4_00", "camtgt_300_ALLY_S4_00");
		
		Wait_(60);
	//Ｇ１体構成
	} else if (PartyType == PARTYTYPE.G1) {
		CameraTask = Task_AnimeMoveCamera_("camera_300_ALLY_S4_00", "camtgt_300_ALLY_S4_00");
		
		Wait_(60);
	//Ｔ１体構成
	} else if (PartyType == PARTYTYPE.T1) {
		CameraTask = Task_AnimeMoveCamera_("camera_300_ALLY_S4_00", "camtgt_300_ALLY_S4_00");
		
		Wait_(60);
	}
	DeleteTask_(CameraTask);

}
