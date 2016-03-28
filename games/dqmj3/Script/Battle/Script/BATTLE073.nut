//������i�G���s���j�iBattleCommon��Skip�j

// ������
function Init()
{
	DebugPrint("BATTLE073_function_Init")
	BattleCommon_Init();
	LoadEffect();
	cAction <- cActionInfo(0)
	Debug_cActionPrint(cAction)
	ChangeIndexPointData_(PERSONAL_POINT_DATA);
	
	gMultiCount <- 0;
	gMultiStageCount <- 0;
	gActor <- GetActorIndex_(0);
	LoadEffect_("EF010_07_SMOKE_MS")
}

// �X�V
function Update()
{
	DebugPrint("BATTLE073_function_Update")
	
	EnemyEscape()
	
	BatteleScript_End();
}

function EnemyEscape()
{
	
	//�s���҃J�b�g�����邩�H
	local CharaStand_Select = "Action"
	local CameraFlag = true;
	local NameVisibleFlag = true;
	ShowActionMessage(gMultiCount,NameVisibleFlag);
	CharaStand(CharaStand_Select , CameraFlag , gMultiCount,cAction);
	
	//local Effect = MonsterSizeEffect(gActor,"EF000_14_SMOKE_FOOT")
	Wait_(5)
	local SandEffect00 = SetBoneEffect_("EF010_07_SMOKE_MS", gActor);
	local NowPos	= GetPos_(gActor);
	local MovePos	= Vec3(NowPos.x , NowPos.y , NowPos.z - 10)
	local MovePath = [NowPos , MovePos]
	Task_PathMoveCharNoDir_(MovePath ,1.0 , gActor)
	local IndexCount = 0;
	
	
	Task_ObjectFadeOut_(gActor, 20);
	SetStatusChange_(gMultiCount, IndexCount);
	SetParamChange_(gMultiCount, IndexCount);
	SetMonsterDead_(gActor)
	Wait_(20);
	DeleteEffectEmitter_(SandEffect00)
	Wait_(20);
}

