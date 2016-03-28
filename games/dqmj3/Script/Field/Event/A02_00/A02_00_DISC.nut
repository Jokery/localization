//===================== A02_00送電施設(ディスク) ====================

function FadeIn()
{
	// 蓄電器
	local g_battery01 = ReadGimmick_("o_A02_01");
	local battery01 = ArrangePointGimmick_("o_A02_01", g_battery01, "battery01");
	SetDir_(battery01, -90);
	SetMotion_(battery01, "GIMMICK_1", 0);
	local battery02 = ArrangePointGimmick_("o_A02_01", g_battery01, "battery02");
	SetDir_(battery02, 90);
	SetMotion_(battery02, "GIMMICK_1", 0);

	// モニタ
	local g_screen = ReadGimmick_("o_A02_02");
	local screen = ArrangePointGimmick_("o_A02_02", g_screen, "screen");
	SetMotion_(screen, "GIMMICK_5", 0);

	// ライト01(左)
	local g_light_01 = ReadGimmick_("o_A02_05");
	local light_01 = ArrangePointGimmick_("o_A02_05", g_light_01, "light01");
	SetMotion_(light_01, "GIMMICK_1", 0);

	// ライト02(右)
	local g_light_02 = ReadGimmick_("o_A02_04");
	local light_02 = ArrangePointGimmick_("o_A02_04", g_light_02, "light02");
	SetMotion_(light_02, "GIMMICK_1", 0);

	EventEnd_();
}
