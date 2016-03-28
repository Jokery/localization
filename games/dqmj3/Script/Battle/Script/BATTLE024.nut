// ���C�h�p

// ������
function Init()
{
	BattleCommon_Init();
}

// �X�V
function Update()
{
    local master = GetActorIndex_(0);
    local monster = GetTargetIndex_(0,0);
	
	local task = Task_RideChange_(master, monster);

	while(!IsTaskEnd_(task)){
		Wait_(1);
	}
	
	if(GetEventFlg_(BFG_TUTORIAL_RIDE)){
		switch(GetRound_())
		{
			case 0:
				OpenMessageWindow_();
				SetTalkName_("NAME_TAG_REACTOR");
				SetMessage_("RideTutorial_2");
				
				while(IsOpenMessageWindow_()){
				    Wait_(1);
				}
				break;
			case 1:
			default:
				break;
    	}
    }

	BatteleScript_End();
}
