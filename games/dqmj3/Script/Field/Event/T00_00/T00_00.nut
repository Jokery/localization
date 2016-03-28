//==============================================================
// T00_00 用イベントスクリプト
//==============================================================

//==============================================================
// 切り替え後フェードイン中に読みこむもの
//==============================================================
function FadeIn()
{
	// ▼NPC読み込み・設置=================================
	// NPCリソース読み込み
	local n000Res = ReadNpc_("n000");	// 普通のノチョ
	local n001Res = ReadNpc_("n001");	// ジャック
	local n002Res = ReadNpc_("n002");	// エース
	local n003Res = ReadNpc_("n003");	// キング
	local n004Res = ReadNpc_("n004");	// ノチョーラ♀
	local n005Res = ReadNpc_("n005");	// ノチョーラクイーン
	local n006Res = ReadNpc_("n006");	// マスターかぶれ
	local n007Res = ReadNpc_("n007");	// レナーテ
	local n008Res = ReadNpc_("n008");	// ダークマスター
	local n009Res = ReadNpc_("n009");	// ルキヤ
	local n010Res = ReadNpc_("n010");	// 主人公
	local n011Res = ReadNpc_("n011");	// サンチョ
	local n012Res = ReadNpc_("n012");	// レジスタンス（男性）
	local n013Res = ReadNpc_("n013");	// レジスタンス（女性）
	local n014Res = ReadNpc_("n014");	// レジスタンス（おじさん）
	local n019Res = ReadNpc_("n019");	// バーディ

	// NPCをFBXで指定した位置に移動
	//npc0 <- ArrangePointNpc_(n000Res, "000");	// 宿屋会話テスト
	//npc1 <- ArrangePointNpc_(n001Res, "001");	// 徘徊＋戦闘テスト
	//npc2 <- ArrangePointNpc_(n002Res, "002");	// デモテスト
	npc3 <- ArrangePointNpc_(n003Res, "003");	// ディスク施設
	//npc4 <- ArrangePointNpc_(n000Res, "004");
	//npc5 <- ArrangePointNpc_(n001Res, "005");
	npc6 <- ArrangePointNpc_(n001Res, "006");	//レース受付
	//npc7 <- ArrangePointNpc_(n004Res, "007");
	//npc8 <- ArrangePointNpc_(n004Res, "008");
	
	// デザイナー要望 NPC確認用配置
	test_n000 <- ArrangePointNpc_(n000Res, "pos_test_n000");
	test_n001 <- ArrangePointNpc_(n001Res, "pos_test_n001");
	test_n002 <- ArrangePointNpc_(n002Res, "pos_test_n002");
	test_n003 <- ArrangePointNpc_(n003Res, "pos_test_n003");
	test_n004 <- ArrangePointNpc_(n004Res, "pos_test_n004");
	test_n005 <- ArrangePointNpc_(n005Res, "pos_test_n005");
	test_n006 <- ArrangePointNpc_(n006Res, "pos_test_n006");
	test_n007 <- ArrangePointNpc_(n007Res, "pos_test_n007");
	test_n008 <- ArrangePointNpc_(n008Res, "pos_test_n008");
	test_n009 <- ArrangePointNpc_(n009Res, "pos_test_n009");
	test_n010 <- ArrangePointNpc_(n010Res, "pos_test_n010");
	test_n011 <- ArrangePointNpc_(n011Res, "pos_test_n011");
	test_n012 <- ArrangePointNpc_(n012Res, "pos_test_n012");
	test_n013 <- ArrangePointNpc_(n013Res, "pos_test_n013");
	test_n014 <- ArrangePointNpc_(n014Res, "pos_test_n014");
	test_n019 <- ArrangePointNpc_(n019Res, "pos_test_n019");
	
	SetPointPos_(test_n000, "pos_test_n000");
	SetPointPos_(test_n001, "pos_test_n001");
	SetPointPos_(test_n002, "pos_test_n002");
	SetPointPos_(test_n003, "pos_test_n003");
	SetPointPos_(test_n004, "pos_test_n004");
	SetPointPos_(test_n005, "pos_test_n005");
	SetPointPos_(test_n006, "pos_test_n006");
	SetPointPos_(test_n007, "pos_test_n007");
	SetPointPos_(test_n008, "pos_test_n008");
	SetPointPos_(test_n009, "pos_test_n009");
	SetPointPos_(test_n010, "pos_test_n010");
	SetPointPos_(test_n011, "pos_test_n011");
	SetPointPos_(test_n012, "pos_test_n012");
	SetPointPos_(test_n013, "pos_test_n013");
	SetPointPos_(test_n014, "pos_test_n014");
	SetPointPos_(test_n019, "pos_test_n019");

	local treeRes  = ReadGimmick_("o_H00_05");
	treeGimmick <- ArrangePointGimmick_("o_H00_05", treeRes, "gimmick_test");

	
	//地雷=================================================
	//// 球状地雷の設置（接触起動）
	//mineCircle_00 <- SetPointCircleEventMine_("circlemine_000", false);
	// 球状地雷の設置（ボタン押し起動）
	mineCircle_01 <- SetPointCircleEventMine_("circlemine_001", true);
	//// 箱型地雷の設置（接触起動）
	//mineBox_00 <- SetPointBoxEventMine_("boxmine_000", false);
	//// 箱型地雷の設置（ボタン押し起動）
	//mineBox_01 <- SetPointBoxEventMine_("boxmine_001", true);
	//=====================================================
	
	//エフェクト===========================================
	LoadEffect_("EF000_06_ROCK");
	LoadEffect_("EF300_21_TALK_ICON");
	//=====================================================
	
	//スクリプト内フラグテスト
	testFlag <- false;
	
	// 話しかけテスト用
	gTalkNum <- 0;

	EventEnd_();
}

//==============================================================
// 画面表示後の動作
//==============================================================
function EventStartOperate()
{
	// ※呼び出し直後は、フェードが自動でかかっているので
	// ※フェード操作をしたい場合は最初に行う

	// イベントフラグの取得
	GetEventFlg_("BFG_TOUCH_NPC_0");
	
	//==========================================================
	// 戦闘終了後、すぐにメッセージ表示
	//==========================================================
	local type = GetBattleEndType_();
	local plDir;
	local playerPath = GetPlayerId_();
	
	//// 勝利後なら
	//if(type == END_TYPE_WIN){
	//	SetDirToPos_(npc0, GetPos_(playerPath));
	//	SetDirToPos_(playerPath, GetPos_(npc0));
	//	
	//	SetMotion_(npc0, "TALKLOOP", 0);
	//	OpenMsgWnd_();
	//	ShowMsg_("battle_win");
	//	KeyInputWait_();
	//	CloseMsgWnd_();
	//	SetMotion_(npc0, "WAIT", 0);
	//}
	//// 敗北なら
	//else if (type == END_TYPE_LOSE){
	//	SetDirToPos_(npc0, GetPos_(playerPath));
	//	SetDirToPos_(playerPath, GetPos_(npc0));
	//	
	//	SetMotion_(npc0, "TALKLOOP", 0);
	//	OpenMsgWnd_();
	//	ShowMsg_("battle_lose");
	//	KeyInputWait_();
	//	CloseMsgWnd_();
	//	SetMotion_(npc0, "WAIT", 0);
	//}
	//else if (type == END_TYPE_SCOUT){
	//	print("スカウトして戦闘終了\n");
	//}
	
	//==========================================================
	// レース復帰後、すぐにメッセージ表示
	//==========================================================
	//レース後、メッセージ表示
	if(GetEventFlg_("BFG_RETURN_FROM_RACE")){
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_NOCHORA");
		ShowMsg_("npc_011");
		KeyInputWait_();
		CloseMsgWnd_();
		SetEventFlg_("BFG_RETURN_FROM_RACE", false);
	}
	
	//==========================================================
	// 連続デモテスト（全デモBGMが違う版）
	//==========================================================
	// NPC起動 Demo990 → Demo991 → Demo992連続デモ===============
	if(GetEventFlg_("BFG_DUMMY_0")){	// Demo990 → Demo991
		EventStartChangeDemo(991, FADE_COLOR_BLACK);
		SetEventFlg_("BFG_DUMMY_0", false);
		SetEventFlg_("BFG_DUMMY_1", true);
	}
	else if(GetEventFlg_("BFG_DUMMY_1")){	// Demo991 → Demo992
		EventStartChangeDemo(992, FADE_COLOR_BLACK);
		SetEventFlg_("BFG_DUMMY_1", false);
	}
	// ===========================================================
	
	
	//==========================================================
	// 連続デモテスト（全デモBGMが同じ版）
	//==========================================================
	//// NPC起動 Demo993 → Demo994 → Demo995連続デモ===============
	//if(GetEventFlg_("BFG_DUMMY_2")){	// Demo990 → Demo991
	//	EventStartChangeDemo(994, FADE_COLOR_BLACK);
	//	SetEventFlg_("BFG_DUMMY_2", false);
	//	SetEventFlg_("BFG_DUMMY_3", true);
	//}
	//else if(GetEventFlg_("BFG_DUMMY_3")){	// Demo991 → Demo992
	//	EventStartChangeDemo(995, FADE_COLOR_BLACK);
	//	SetEventFlg_("BFG_DUMMY_3", false);
	//}
	// ===========================================================
	
	EventEnd_();
}

//==============================================================
// NPC調べた時のイベント
//==============================================================
function TouchNpc()
{
	// 調べられているNPCのIDを取得
	local target = GetTargetId_();
	
	//===================================================
	// npc6との会話
	//===================================================
	if(target == npc6){
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_NOCHORA");
		ShowMsg_("npc_010");
		KeyInputWait_();
		CloseMsgWnd_();
		// レースへ
		if (GetQueryResult_() == MES_QUERY_YES){
			SetEventFlg_("BFG_RETURN_FROM_RACE", true);
			ChangeRace_();
		}
	}
	//===================================================
	// npc3との会話
	//===================================================
	if(target == npc3){
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_NOCHORA");
		ShowMsg_("npc_003");
		KeyInputWait_();
		CloseMsgWnd_();
		if(GetQueryResult_() == MES_QUERY_YES){
			GotoMenuOpen_(MENU_OPEN.DISC_FACILITY);
		}
	}
	//===================================================
	// test_n005（クイーン）との会話
	//===================================================
	if(target == test_n005){
		CommAddAccessory(226, 2);
	}
	
	//===================================================
	// test_n005（ノチョーラ♀）との会話→連続デモ開始
	//===================================================
	if(target == test_n004){
		ChangeDemo_(990);
		SetEventFlg_("BFG_DUMMY_0", true);
	}
	
	//===================================================
	// test_n013（レジスタンス（女性））との会話→連続デモ開始
	//===================================================
	if(target == test_n013){
		ChangeRaceTutorial_();
	}
	
	EventEnd_();
}

//==============================================================
// リアクターで調べられたときのイベント
//==============================================================
function ReactorAnalyze()
{
	local target = GetTargetId_();
	if(target == reactorPoint2){
		OpenMsgWnd_();
		ShowMsg_("battle_start");
		KeyInputWait_();
		CloseMsgWnd_();
	}
	
	EventEnd_();
}

//==============================================================
// リアクター起動時のイベント
//==============================================================
function ReactorOn()
{
	//// リアクター起動中に会話アイコンを出すテスト
	//if(!testFlag)
	//{
	//	talkIcon0 <- SetSelectBoneEffect_("EF300_21_TALK_ICON", npc5, ATTACH_EFFECT1);
	//}
	EventEnd_();
}

//==============================================================
// リアクター終了時のイベント
//==============================================================
function ReactorOff()
{
	// リアクター終了時には消しておく
	if(!testFlag)
	{
		DeleteEffect_(talkIcon0);
	}
	EventEnd_();
}


//==============================================================
// 会話一連用
//==============================================================
function TalkMessage(messageTag)
{
	OpenMsgWnd_();
	ShowMsg_(messageTag);
	KeyInputWait_();
	CloseMsgWnd_();
}

//==============================================================
// モンスターライド時起動イベント
//==============================================================
function RideOn()
{
	OpenMsgWnd_();
	ShowMsg_("battle_start");
	KeyInputWait_();
	CloseMsgWnd_();
	
	EventEnd_();
}


//==============================================================
// 特定条件科でNPC会話挙動を変更するイベント
//==============================================================
function BeforeTalkNpc()
{
	// 話しかけられているNPCのIDを取得
	local target = GetTargetId_();
	
	if(target == test_n013){
		if(GetEventFlg_("BFG_DUMMY_3")){
			SetTalkCameraType_(target, TALK_CAMERA_UP);
		}else{
			SetTalkCameraType_(target, TALK_CAMERA_DEF);
		}
		SetEventFlg_("BFG_DUMMY_3", !GetEventFlg_("BFG_DUMMY_3"));
	}
	
	EventEnd_();
}
