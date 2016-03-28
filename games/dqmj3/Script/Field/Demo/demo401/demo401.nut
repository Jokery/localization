//=============================================
//
//		demo401[アロイパークの住人たち]
//
//=============================================

//-------------------------------------------------------------------------
//
//		読み込み・配置
//
//-------------------------------------------------------------------------
function Update()
{
// ▼変数定義
	local task_cam, task_player;
	local efc_player, efc_saboten;

// ▼リソース読込
	// キャラクター
	local player = GetPlayerId_();							// 主人公
	local togejobo	 = ReadNpc_("m127_01");					// とげジョボー
	local saboten	 = ReadNpc_("m064_00");					// サボテンボール
	local dessert	 = ReadNpc_("m132_01");					// デザートタンク

// ▼配置
	// 少年
	local g_npc_boy = ArrangePointNpc_(togejobo, "npc_boy000");
	SetScaleSilhouette(g_npc_boy, 0.35, 0.35);
	// 母親
	local g_npc_mother = ArrangePointNpc_(togejobo, "npc_mother000");
	SetScaleSilhouette(g_npc_mother, 0.52, 0.52);
	// 道具屋
	local g_npc_item = ArrangePointNpc_(dessert, "npc_item000");
	SetScaleSilhouette(g_npc_item, SCALE.DEZATOTANKU,SILHOUETTE_WIDTH.DEZATOTANKU);
	// 宿屋
	local g_npc_inn = ArrangePointNpc_(saboten, "npc_inn000");
	SetScaleSilhouette(g_npc_inn, SCALE.SABOTENBOUL,SILHOUETTE_WIDTH.SABOTENBOUL);
	// アロイパーク住人Ａ
	local g_npc_aroi_a = ArrangePointNpc_(saboten, "npc_aroi_a000");
	SetScaleSilhouette(g_npc_aroi_a, SCALE.SABOTENBOUL,SILHOUETTE_WIDTH.SABOTENBOUL);
	// アロイパーク住人Ｂ
	local g_npc_aroi_b = ArrangePointNpc_(dessert, "npc_aroi_b000");
	SetScaleSilhouette(g_npc_aroi_b, SCALE.DEZATOTANKU,SILHOUETTE_WIDTH.DEZATOTANKU);
	// アロイパーク住人Ｃ
	local g_npc_aroi_c = ArrangePointNpc_(saboten, "npc_aroi_c000");
	SetScaleSilhouette(g_npc_aroi_c, SCALE.SABOTENBOUL,SILHOUETTE_WIDTH.SABOTENBOUL);
	// アロイパーク住人Ｄ
	local g_npc_aroi_d = ArrangePointNpc_(dessert, "npc_aroi_d000");
	SetScaleSilhouette(g_npc_aroi_d, SCALE.DEZATOTANKU,SILHOUETTE_WIDTH.DEZATOTANKU);

// ▼非常駐モーション読込
	local feel_down_b = ReadMotion_(g_npc_boy, "m127_01_feel_down_L");// 少年　落ち込むL
	local feel_down_m = ReadMotion_(g_npc_mother, "m127_01_feel_down_L");// 母親　落ち込むL

// ▼初期モーション設定
	SetMotion_(g_npc_boy, feel_down_b, BLEND_N);			// 少年　落ち込むL
	SetMotion_(g_npc_mother, feel_down_b, BLEND_N);			// 母親　落ち込むL

// ▼カメラ設定
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");

//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);

	WaitTask(task_cam);
	DeleteTask_(task_cam);
	Wait_(20);
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 30);
	WaitFade_();
	SetFade_(FADE_IN, FADE_COLOR_BLACK, 30);

	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");
	Wait_(100);
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 30);
	WaitFade_();


	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");
	SetFade_(FADE_IN, FADE_COLOR_BLACK, 30);
	WaitTask(task_cam);
	DeleteTask_(task_cam);
	Wait_(35);

	EndDemo(FADE_COLOR_BLACK);
}
