// 変身２

// 初期化
function Init()
{
	DebugPrint("BATTLE081_function_Init")
	BattleCommon_Init();
	ChangeIndexPointData_(PERSONAL_POINT_DATA);
	for(local i = 0 ; i < 4 ; i++){
		SetVisible_(GetAllyIndex_(i), false);
		SetVisible_(GetEnemyIndex_(i), false);
	}
	
	LoadEffect_("ef000_03_shuchusen");	// 集中線
	LoadEffect_("ef710_07_cha_dg02");	// ダースガルマ尾
	LoadEffect_("ef710_08_cha_dg03");	// ダースガルマ首
}

// 更新
function Update()
{
	OnInit();
	
	OnUpdate();
	DebugPrint("BATTLE081_function_Update")
	BatteleScript_End();
}

function OnInit()
{
	local actorIndex = GetActorIndex_(0,0);

	SetNumFlg_(NUM_FLG_COUNT_UP_DEMO_834, DARS_GALMA_FORM.THIRD);
	SetVisible_(actorIndex, true);
	SetMonsterMeshVisible_(actorIndex, "head", true);
	
	ReadMonsterAddMotion_(actorIndex, "m180_00_transform02");	
	SetPos_(actorIndex, GetFbxPointPos_("pos_000"));
}

function OnUpdate()
{
	SetStatusChange_(0, 0);
	local actorIndex = GetActorIndex_(0,0);
	local taskId = Task_SetFrameAnimeMoveCamera_("cam_anm02" , "cam_tgt02",0);
	local eftId;
	
	ShowActionName_(0);
	SetMotion_(actorIndex, 15, 0);
	ReplaySE_("SE_DEM_215");
	Wait_(152);
	StartBlurEffect_();
	eftId = SetFreeSelectBoneEffect_("ef710_07_cha_dg02", actorIndex, "Tail1", Vec3(0.0, 0.0, 0.0));// エフェクト設定
	ReplaySE_("SE_DEM_216");
	Wait_(185 - 152);
	EndBlurEffect_();
	Wait_(210 - 185);
	ReplaySE_("SE_DEM_217");
	Wait_(312 - 210);
	SetMonsterMeshVisible_(actorIndex, "cover", false);
	SetMonsterMeshVisible_(actorIndex, "breakCover", true);
	eftId = SetFreeSelectBoneEffect_("ef710_08_cha_dg03", actorIndex, "Neck1", Vec3(0.0, 0.0, 0.0));// エフェクト設定
	Wait_(314 - 312);
	SetCameraEffect_("ef000_03_shuchusen", 100)// 集中線
	StartBlurEffect_();
	Wait_(420 - 314);
}

