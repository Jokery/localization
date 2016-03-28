//===================== S02_00イッタブル監獄 1F(ディスク) ====================

//------------------------------------------------
// フェードイン( イベントブロック )
//------------------------------------------------
function FadeIn()
{
	//=======================
	// ■オブジェクト(ギミック)
	//=======================
	// ■エレベーターの扉
	local id_elevator_door = ReadGimmick_("o_S02_01");
	local g_gmk_elevator_door = ArrangePointGimmick_("o_S02_01", id_elevator_door, "gmk_elevator_door");
	
	// ■エレベーターリフト
	local id_elevator_lift = ReadGimmick_("o_S02_00");
	local g_gmk_elevator_lift = ArrangePointGimmick_("o_S02_00", id_elevator_lift, "gmk_elevator_lift");

	// ■牢屋扉<全て開いている状態にする(2次DB #2831)>
	local id_jail_door = ReadGimmick_("o_S02_02");
	// 東
	local g_gmk_jail_door_east_1 = ArrangePointGimmick_("o_S02_02", id_jail_door, "gmk_jail_door_est_1");
	SetGimmickMapHitEnable_(g_gmk_jail_door_east_1, false);		// アタリを無効化
	SetMotion_(g_gmk_jail_door_east_1, MOT_GIMMICK_2, BLEND_N);
	local g_gmk_jail_door_east_2 = ArrangePointGimmick_("o_S02_02", id_jail_door, "gmk_jail_door_est_2");
	SetGimmickMapHitEnable_(g_gmk_jail_door_east_2, false);
	SetMotion_(g_gmk_jail_door_east_2, MOT_GIMMICK_2, BLEND_N);
	local g_gmk_jail_door_east_3 = ArrangePointGimmick_("o_S02_02", id_jail_door, "gmk_jail_door_est_3");
	SetGimmickMapHitEnable_(g_gmk_jail_door_east_3, false);
	SetMotion_(g_gmk_jail_door_east_3, MOT_GIMMICK_2, BLEND_N);
	local g_gmk_jail_door_east_4 = ArrangePointGimmick_("o_S02_02", id_jail_door, "gmk_jail_door_est_4");
	SetGimmickMapHitEnable_(g_gmk_jail_door_east_4, false);
	SetMotion_(g_gmk_jail_door_east_4, MOT_GIMMICK_2, BLEND_N);
	local g_gmk_jail_door_east_5 = ArrangePointGimmick_("o_S02_02", id_jail_door, "gmk_jail_door_est_5");
	SetGimmickMapHitEnable_(g_gmk_jail_door_east_5, false);
	SetMotion_(g_gmk_jail_door_east_5, MOT_GIMMICK_2, BLEND_N);
	local g_gmk_jail_door_east_6 = ArrangePointGimmick_("o_S02_02", id_jail_door, "gmk_jail_door_est_6");
	SetGimmickMapHitEnable_(g_gmk_jail_door_east_6, false);
	SetMotion_(g_gmk_jail_door_east_6, MOT_GIMMICK_2, BLEND_N);
	// 西
	local g_gmk_jail_door_west_1 = ArrangePointGimmick_("o_S02_02", id_jail_door, "gmk_jail_door_west_1");
	SetGimmickMapHitEnable_(g_gmk_jail_door_west_1, false);
	SetMotion_(g_gmk_jail_door_west_1, MOT_GIMMICK_2, BLEND_N);
	local g_gmk_jail_door_west_2 = ArrangePointGimmick_("o_S02_02", id_jail_door, "gmk_jail_door_west_2");
	SetGimmickMapHitEnable_(g_gmk_jail_door_west_2, false);
	SetMotion_(g_gmk_jail_door_west_2, MOT_GIMMICK_2, BLEND_N);
	local g_gmk_jail_door_west_3 = ArrangePointGimmick_("o_S02_02", id_jail_door, "gmk_jail_door_west_3");
	SetGimmickMapHitEnable_(g_gmk_jail_door_west_3, false);
	SetMotion_(g_gmk_jail_door_west_3, MOT_GIMMICK_2, BLEND_N);
	local g_gmk_jail_door_west_4 = ArrangePointGimmick_("o_S02_02", id_jail_door, "gmk_jail_door_west_4");
	SetGimmickMapHitEnable_(g_gmk_jail_door_west_4, false);
	SetMotion_(g_gmk_jail_door_west_4, MOT_GIMMICK_2, BLEND_N);
	local g_gmk_jail_door_west_5 = ArrangePointGimmick_("o_S02_02", id_jail_door, "gmk_jail_door_west_5");
	SetGimmickMapHitEnable_(g_gmk_jail_door_west_5, false);
	SetMotion_(g_gmk_jail_door_west_5, MOT_GIMMICK_2, BLEND_N);
	local g_gmk_jail_door_west_6 = ArrangePointGimmick_("o_S02_02", id_jail_door, "gmk_jail_door_west_6");
	SetGimmickMapHitEnable_(g_gmk_jail_door_west_6, false);
	SetMotion_(g_gmk_jail_door_west_6, MOT_GIMMICK_2, BLEND_N);

	// < 備忘録 >
	// 浮島に関しては alienbrain://ALIEN-OM2/HARUKA:598/tose_works/Blender/Field/S/S00_00_gimmick.blend
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

