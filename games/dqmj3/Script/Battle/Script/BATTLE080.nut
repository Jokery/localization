// 変身１

// 初期化
function Init()
{
	DebugPrint("BATTLE080_function_Init")
	BattleCommon_Init();
	ChangeIndexPointData_(PERSONAL_POINT_DATA);
	for(local i = 0 ; i < 4 ; i++){
		SetVisible_(GetAllyIndex_(i), false);
		SetVisible_(GetEnemyIndex_(i), false);
	}
	
	LoadEffect_("ef000_03_shuchusen");	// 集中線
	LoadEffect_("ef710_06_cha_dg01");	// ダースガルマ腕
}

// 更新
function Update()
{
	OnInit();
	
	OnUpdate();
	DebugPrint("BATTLE080_function_Update")
	BatteleScript_End();
}

function OnInit()
{
	local actorIndex = GetActorIndex_(0,0);
	
	SetNumFlg_(NUM_FLG_COUNT_UP_DEMO_834, DARS_GALMA_FORM.SECOND);
	SetVisible_(actorIndex, true);
	SetMonsterMeshVisible_(actorIndex, "arm", true);
	
	ReadMonsterAddMotion_(actorIndex, "m180_00_transform01");
	SetPos_(actorIndex, GetFbxPointPos_("pos_000"));
}

function OnUpdate()
{
	SetStatusChange_(0, 0);
	local actorIndex = GetActorIndex_(0,0);
	local taskId = Task_SetFrameAnimeMoveCamera_("cam_anm01" , "cam_tgt01",0);
	local eftId;
	local camEftId;
	
	SetMotion_(actorIndex, 15, 4);
	ShowActionName_(0);
	ReplaySE_("SE_DEM_211");
	Wait_(56);
	camEftId = SetCameraEffect_("ef000_03_shuchusen", 100)// 集中線
	Wait_(71 - 56);
	DeleteEffect_(camEftId);
	Wait_(85 - 71);
	eftId = SetFreeSelectBoneEffect_("ef710_06_cha_dg01", actorIndex, "LBicep1", Vec3(0.0, 0.0, 0.0));// エフェクト設定
	ReplaySE_("SE_DEM_212");
	Wait_(133 - 85);
	eftId = SetFreeSelectBoneEffect_("ef710_06_cha_dg01", actorIndex, "RBicep1", Vec3(0.0, 0.0, 0.0));// エフェクト設定
	ReplaySE_("SE_DEM_212");
	Wait_(183 - 133);
	ReplaySE_("SE_DEM_213");
	Wait_(215 - 183);
	StartBlurEffect_();
	Wait_(218 - 215);
	camEftId = SetCameraEffect_("ef000_03_shuchusen", 100)// 集中線
	Wait_(300 - 218);
}

