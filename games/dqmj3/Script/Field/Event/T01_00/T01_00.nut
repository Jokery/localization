function FadeIn()
{
	gimmick_res <- ReadGimmick_("o_com_96");
	gimmick <- ArrangePointGimmick_("o_com_96", gimmick_res, "000");
	
	local gimmick000 = ReadGimmick_("o_dem_00");
	gTransfer <- ArrangePointGimmick_("o_dem_00", gimmick000, "001");
	
	local npc000Res = ReadNpc_("n000");
	gNpc <- ArrangePointNpc_(npc000Res, "002");
	
	LoadEffect_("ef732_01_tec_device_travel01");
	
	EventEnd_();
}

function EventStartOperate()
{
	EventEnd_();
}

function TouchNpc()
{
	local touchNpc = GetTargetId_();

	if(touchNpc == gNpc){
		SetMotion_(gTransfer, MOT_GIMMICK_1, 0);
		Wait_(30);
		SetPointWorldEffect_("ef732_01_tec_device_travel01", "001");
	}


	EventEnd_();
}

function TouchEventMine()
{
	EventEnd_();
}
