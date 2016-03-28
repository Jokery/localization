//===================== V02_00秘密基地1F(溶岩洞窟)(ディスク) ====================

//------------------------------------------------
// フェードイン( イベントブロック )
//------------------------------------------------
function FadeIn()
{
	//=======================
	// ■オブジェクト(ギミック)
	//=======================
	// ■エレベータの扉
	local id_elevator_door = ReadGimmick_("o_V02_06");
	local g_gmk_elevator_door = ArrangePointGimmick_("o_V02_06", id_elevator_door, "gmk_elevator_door");
	
	// ■エレベータのリフト
	local id_elevator_lift = ReadGimmick_("o_V02_03");
	local g_gmk_elevator_lift = ArrangePointGimmick_("o_V02_03", id_elevator_lift, "gmk_elevator_lift");

	// < 備忘録 >
	// 浮島に関しては alienbrain://ALIEN-OM2/HARUKA:598/tose_works/Blender/Field/V/V00_00_gimmick.blend
	// で配置しているので、特に指示がない限りはイベントスクリプトでは配置しないようにして下さい。（処理負荷が発生します。）

	EventEnd_();
}

//=========================================================================================================
//                            ▼▼▼ここから下はローカル関数▼▼▼
//=========================================================================================================

//++++++++++++++++++++++++++++++++++++++++++++++++
//    ローカル関数
//------------------------------------------------
// 引数   : なし
// 戻り値 : なし
//++++++++++++++++++++++++++++++++++++++++++++++++
//function u()
//{
//}

