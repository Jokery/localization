// �ʂ����Ǝa��i���񂾃A�C�e���Љ�j

// ������
function Init()
{
	DebugPrint("BATTLE084_function_Init")
	BattleCommon_Init();
	cAction <- cActionInfo(0)
	Debug_cActionPrint(cAction)
	ChangeIndexPointData_(PERSONAL_POINT_DATA);
	
	gMultiCount <- 0;
	gMultiStageCount <- 0;
	gAttack <- GetActorIndex_(0);
}

// �X�V
function Update()
{
	OnInit();
	
	OnUpdate();
	DebugPrint("BATTLE084_function_Update")
	BatteleScript_End();
}

function OnInit()
{
	CharaStand("Target", true, gMultiCount, cAction);
}

function OnUpdate()
{
	SetExchangeItemName_(GetStoleItem_(0, 0));
	ShowBattleEventMessage_(IsAlly_(GetActorIndex_(0)), 601);
	Wait_(30)
}

