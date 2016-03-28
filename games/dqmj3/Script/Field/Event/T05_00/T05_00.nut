//===================== テスト５ ====================

function FadeIn()
{
	//モデル読み込み
	local n_001 	= ReadNpc_("m076_02");	//←このモデル名を変えて確認します。
	local n_002 	= ReadNpc_("m082_01");
	local n_003 	= ReadNpc_("m107_01");
	local n_004 	= ReadNpc_("m006_03");
	local n_005 	= ReadNpc_("m000_00");
	local n_006 	= ReadNpc_("m083_00");
	local n_007 	= ReadNpc_("m052_00");
	local n_008 	= ReadNpc_("m037_00");
	local n_009 	= ReadNpc_("n001");
	local n_010 	= ReadNpc_("n001");

	local n_011 	= ReadNpc_("m007_00");
	local n_012 	= ReadNpc_("m016_00");
	local n_013 	= ReadNpc_("m086_02");
	local n_014 	= ReadNpc_("m128_02");
	local n_015 	= ReadNpc_("m113_00");
	local n_016 	= ReadNpc_("n001");
	local n_017 	= ReadNpc_("n001");
	local n_018 	= ReadNpc_("n001");
	local n_019 	= ReadNpc_("n001");
	local n_020 	= ReadNpc_("n001");

	local n_021 	= ReadNpc_("n001");
	local n_022 	= ReadNpc_("n001");
	local n_023 	= ReadNpc_("n001");
	local n_024 	= ReadNpc_("n001");
	local n_025 	= ReadNpc_("n001");
	local n_026 	= ReadNpc_("n001");
	local n_027 	= ReadNpc_("n001");
	local n_028 	= ReadNpc_("n001");
	local n_029 	= ReadNpc_("n001");
	local n_030 	= ReadNpc_("n000");

	//NPC配置( 初期化の為グローバル変数に"-1"を代入する )
	g_npc001 <- C_NONE_ID;
	g_npc002 <- C_NONE_ID;
	g_npc003 <- C_NONE_ID;
	g_npc004 <- C_NONE_ID;
	g_npc005 <- C_NONE_ID;
	g_npc006 <- C_NONE_ID;
	g_npc007 <- C_NONE_ID;
	g_npc008 <- C_NONE_ID;
	g_npc009 <- C_NONE_ID;
	g_npc010 <- C_NONE_ID;

	g_npc011 <- C_NONE_ID;
	g_npc012 <- C_NONE_ID;
	g_npc013 <- C_NONE_ID;
	g_npc014 <- C_NONE_ID;
	g_npc015 <- C_NONE_ID;
	g_npc016 <- C_NONE_ID;
	g_npc017 <- C_NONE_ID;
	g_npc018 <- C_NONE_ID;
	g_npc019 <- C_NONE_ID;
	g_npc020 <- C_NONE_ID;

	g_npc021 <- C_NONE_ID;
	g_npc022 <- C_NONE_ID;
	g_npc023 <- C_NONE_ID;
	g_npc024 <- C_NONE_ID;
	g_npc025 <- C_NONE_ID;
	g_npc026 <- C_NONE_ID;
	g_npc027 <- C_NONE_ID;
	g_npc028 <- C_NONE_ID;
	g_npc029 <- C_NONE_ID;
	g_npc030 <- C_NONE_ID;

	//配置
	g_npc001 = ArrangePointNpc_(n_001, "npc001");
	g_npc002 = ArrangePointNpc_(n_002, "npc002");
	g_npc003 = ArrangePointNpc_(n_003, "npc003");
	g_npc004 = ArrangePointNpc_(n_004, "npc004");
	g_npc005 = ArrangePointNpc_(n_005, "npc005");
	g_npc006 = ArrangePointNpc_(n_006, "npc006");
	g_npc007 = ArrangePointNpc_(n_007, "npc007");
	g_npc008 = ArrangePointNpc_(n_008, "npc008");
	g_npc009 = ArrangePointNpc_(n_009, "npc009");
	g_npc010 = ArrangePointNpc_(n_010, "npc010");

	g_npc011 = ArrangePointNpc_(n_011, "npc011");
	g_npc012 = ArrangePointNpc_(n_012, "npc012");
	g_npc013 = ArrangePointNpc_(n_013, "npc013");
	g_npc014 = ArrangePointNpc_(n_014, "npc014");
	g_npc015 = ArrangePointNpc_(n_015, "npc015");
	g_npc016 = ArrangePointNpc_(n_016, "npc016");
	g_npc017 = ArrangePointNpc_(n_017, "npc017");
	g_npc018 = ArrangePointNpc_(n_018, "npc018");
	g_npc019 = ArrangePointNpc_(n_019, "npc019");
	g_npc020 = ArrangePointNpc_(n_020, "npc020");

	g_npc021 = ArrangePointNpc_(n_021, "npc021");
	g_npc022 = ArrangePointNpc_(n_022, "npc022");
	g_npc023 = ArrangePointNpc_(n_023, "npc023");
	g_npc024 = ArrangePointNpc_(n_024, "npc024");
	g_npc025 = ArrangePointNpc_(n_025, "npc025");
	g_npc026 = ArrangePointNpc_(n_026, "npc026");
	g_npc027 = ArrangePointNpc_(n_027, "npc027");
	g_npc028 = ArrangePointNpc_(n_028, "npc028");
	g_npc029 = ArrangePointNpc_(n_029, "npc029");
	g_npc030 = ArrangePointNpc_(n_030, "npc030");

	//サイズ設定（※これは必要なやつだけコメントアウトを外して使用する）
	SetScaleSilhouette(g_npc001, SCALE.S, SILHOUETTE_WIDTH.S);
	SetScaleSilhouette(g_npc002, SCALE.S, SILHOUETTE_WIDTH.S);
	SetScaleSilhouette(g_npc003, SCALE.N, SILHOUETTE_WIDTH.N);
	SetScaleSilhouette(g_npc004, SCALE.S, SILHOUETTE_WIDTH.S);
	SetScaleSilhouette(g_npc005, SCALE.S, SILHOUETTE_WIDTH.S);
	SetScaleSilhouette(g_npc006, SCALE.S, SILHOUETTE_WIDTH.S);
	SetScaleSilhouette(g_npc007, SCALE.S, SILHOUETTE_WIDTH.S);
	SetScaleSilhouette(g_npc008, SCALE.S, SILHOUETTE_WIDTH.S);
	SetScaleSilhouette(g_npc009, SCALE.N, SILHOUETTE_WIDTH.N);
//	SetScaleSilhouette(g_npc010, SCALE.N, SILHOUETTE_WIDTH.N);

	SetScaleSilhouette(g_npc011, SCALE.WIFIRANKING, SILHOUETTE_WIDTH.S);
	SetScaleSilhouette(g_npc012, SCALE.WIFIBATTLE, SILHOUETTE_WIDTH.N);
	SetScaleSilhouette(g_npc013, SCALE.WIFIPRESENT, SILHOUETTE_WIDTH.S);
	SetScaleSilhouette(g_npc014, SCALE.WIFISHOP, SILHOUETTE_WIDTH.N);
	SetScaleSilhouette(g_npc015, SCALE.WIFIPROFILE, SILHOUETTE_WIDTH.N);
//	SetScaleSilhouette(g_npc016, SCALE.N, SILHOUETTE_WIDTH.N);
//	SetScaleSilhouette(g_npc017, SCALE.N, SILHOUETTE_WIDTH.N);
//	SetScaleSilhouette(g_npc018, SCALE.N, SILHOUETTE_WIDTH.N);
//	SetScaleSilhouette(g_npc019, SCALE.N, SILHOUETTE_WIDTH.N);
//	SetScaleSilhouette(g_npc020, SCALE.N, SILHOUETTE_WIDTH.N);

//	SetScaleSilhouette(g_npc021, SCALE.N, SILHOUETTE_WIDTH.N);
//	SetScaleSilhouette(g_npc022, SCALE.N, SILHOUETTE_WIDTH.N);
//	SetScaleSilhouette(g_npc023, SCALE.N, SILHOUETTE_WIDTH.N);
//	SetScaleSilhouette(g_npc024, SCALE.N, SILHOUETTE_WIDTH.N);
//	SetScaleSilhouette(g_npc025, SCALE.N, SILHOUETTE_WIDTH.N);
//	SetScaleSilhouette(g_npc026, SCALE.N, SILHOUETTE_WIDTH.N);
//	SetScaleSilhouette(g_npc027, SCALE.N, SILHOUETTE_WIDTH.N);
//	SetScaleSilhouette(g_npc028, SCALE.N, SILHOUETTE_WIDTH.N);
//	SetScaleSilhouette(g_npc029, SCALE.N, SILHOUETTE_WIDTH.N);
//	SetScaleSilhouette(g_npc030, SCALE.N, SILHOUETTE_WIDTH.N);


	EventEnd_();
}

//-------------------- 初期化 --------------------
//起動条件：マップチェンジしてきた時
//-------------------- 初期化 --------------------
function EventStartOperate()
{



	EventEnd_();

}

//-------------------- NPC --------------------
//起動条件：NPCに向かってAボタンが押された時
//OpenMsgWnd_() -> ShowMsg_() -> KeyInputWait_() の順に呼び出すこと
//-------------------- NPC --------------------
function TouchNpc()
{
	EventEnd_();
}

//-------------------- イベント地雷 --------------------
//起動条件：マップに配置したメッシュに触れたとき
//-------------------- イベント地雷 --------------------
function TouchEventMine(){
	EventEnd_();
}
