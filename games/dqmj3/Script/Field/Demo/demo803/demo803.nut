//=============================================
//
//		demo803[秘策はスターシード]
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
	local task_cam, task_player, task_aroma;
	local task_aroma_step;
	local efc_player, efc_seed;

// ▼リソース読込
	// キャラクター
	local player = GetPlayerId_();						// 主人公
	local model_aroma = ReadNpc_("n018");				// アロマ
	
	// エフェクト
	LoadEffect_("ef732_25_star_seed_base01");			// スターシードベース　完成前
	LoadEffect_("ef340_06_star_seed_case");				// スターシードの入れ物
	LoadEffect_("ef340_07_star_seed_shaton_u");			// 電気エフェクト　上
	LoadEffect_("ef340_08_star_seed_shaton_d");			// 電気エフェクト　下
	// ギミック
	local model_base = ReadGimmick_("o_effect_base");	// エフェクトベース
	local model_pod = ReadGimmick_("o_U00_02");			// 脱出ポッド
	local model_alias = ReadGimmick_("o_U00_11");		// エイリアス装置

	local model_red_door = ReadGimmick_("o_U00_05");		// 扉:赤扉
	local model_green_door00 = ReadGimmick_("o_U00_09");	// 扉:緑扉
	local model_green_door01 = ReadGimmick_("o_U00_10");	// 扉:緑扉
	
// ▼配置
	// 主人公
	SetPointPos_(player, "player000");

	//アロマ
	local aroma = ArrangePointNpc_(model_aroma, "npc_aroma000");
	SetStepSe_(aroma, SILENT_STEP_SE);
	
	//ギミック
	local seed = ArrangePointGimmick_("o_effect_base", model_base, "obj_seed000");						//スターシード（エフェクトベース）
	SetPointPosNoFit_(seed, "obj_seed000");
	efc_seed = SetSelectBoneEffect_("ef732_25_star_seed_base01", seed, ATTACH_GLOBAL);
	SetEffectScale_(efc_seed, 0.5);
	local efc_case = SetSelectBoneEffect_("ef340_06_star_seed_case", seed, ATTACH_GLOBAL);				//スターシードの入れ物
	local efc_shaton_u = SetPointWorldEffect_("ef340_07_star_seed_shaton_u", "efc_shaton_d000");		//電気　上
	local efc_shaton_d = SetPointWorldEffect_("ef340_08_star_seed_shaton_d", "efc_shaton_u000");		//電気　下

	local pod00 = ArrangePointGimmick_("o_U00_02", model_pod, "obj_pod000");							//脱出ポッド３基
	local pod01 = ArrangePointGimmick_("o_U00_02", model_pod, "obj_pod001");
	local pod02 = ArrangePointGimmick_("o_U00_02", model_pod, "obj_pod002");
	
	local alias00 = ArrangePointGimmick_("o_U00_11", model_alias, "obj_alias000");						//エイリアス装置３基
	local alias01 = ArrangePointGimmick_("o_U00_11", model_alias, "obj_alias001");
	local alias02 = ArrangePointGimmick_("o_U00_11", model_alias, "obj_alias002");
	
	local red_door = ArrangePointGimmick_("o_U00_05", model_red_door, "obj_U00_05");					//扉:赤扉
	local green_door00 = ArrangePointGimmick_("o_U00_09", model_green_door00, "obj_U00_09");			//扉:緑扉
	local green_door01 = ArrangePointGimmick_("o_U00_10", model_green_door01, "obj_U00_10");			//扉:緑扉
	
// ▼非常駐モーション読込
	//主人公
	local player_look_up = ReadMotion_(player, "Player_look_up_L");								//上向き待機L
	
	//アロマ
	local aro_look_right_L = ReadMotion_(aroma, "n018_look_right_L");							//右向き待機L
	local aro_look_left_L = ReadMotion_(aroma, "n018_look_left_L");								//左向き待機L
	local aro_look_up_L = ReadMotion_(aroma, "n018_look_up_L");									//上向き待機L
	local aro_look_down_L = ReadMotion_(aroma, "n018_look_down_L");								//下向き待機L
	local aro_star_L = ReadMotion_(aroma, "n018_star_seed_L");									//スターシードを持つ（話すモーションのパターン追加）
	local aro_stretch = ReadMotion_(aroma, "n018_stretch");										//ストレッチ
	
// ▼初期モーション
	SetMotion_(player, player_look_up, BLEND_N); 
	SetMotion_(aroma, MOT_WALK, BLEND_N); 
	
// ▼カメラ設定
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");

//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------
	task_aroma = Task_MoveForward_(aroma, 1.0, false);
	task_aroma_step = Task_PlaySe_("SE_FLD_021", 15);
	
	StartDemo(FADE_COLOR_BLACK);
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット1 アロマと主
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	
	Wait_(35);
	SetMotion_(aroma, MOT_WAIT, BLEND_L); 
	DeleteTask_(task_aroma);
	DeleteTask_(task_aroma_step);
	Wait_(50);
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット2 スターシードと3つの扉
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	SetMotion_(player, MOT_WAIT, BLEND_N); 
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");
	SetPointPos_(aroma, "npc_aroma001");

	WaitTask(task_cam);
	Wait_(15);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット3 スターシード　ズームイン
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");
	WaitTask(task_cam);
	//===============================================
	// *アロマ
	// 「その機械の名前は　スターシード。
	//　レナーテを助け出す　決め手となるものよ。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_AROMA");
	ShowMsg_("DEMO_803_MSG_010");
	KeyInputWait_();
	//===============================================
	
	//===============================================
	// *アロマ
	// 「スターシードは　文字どおり星の種。
	//　惑星創造機関マザーの　核となる存在なの。
	//-----------------------------------------------
	ShowMsg_("DEMO_803_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	Wait_(40);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット4 アロマアップ
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");

	Wait_(30);
	SetMotion_(aroma, aro_look_left_L, BLEND_XL);
	task_aroma = Task_RotateToPos_(aroma, GetPos_(player), 2);
	Wait_(15);
	DeleteTask_(task_aroma);
	Wait_(20);
	//===============================================
	// *アロマ
	// 「今　レナーテは壊れたマザーの機能を
	//　補うために　コアの中に　残っているわ。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_AROMA");
	ShowMsg_("DEMO_803_MSG_030");
	KeyInputWait_();
	//===============================================
	
	//===============================================
	// *アロマ
	// 「でも　このスターシードを使って　マザーを
	//　修復すれば　彼女を自由にできるはずよ。
	//-----------------------------------------------
	ShowMsg_("DEMO_803_MSG_040");
	KeyInputWait_();
	//===============================================
	
	SetMotion_(aroma, MOT_WAIT, BLEND_XL);
	task_aroma = Task_RotateToPos_(aroma, GetPos_(seed), 2);
	Wait_(15);
	DeleteTask_(task_aroma);
	
	//===============================================
	// *アロマ
	// 「ただ……このスターシードって　未完成でね。
	//　スターピースっていう部品を　組み込まないと。
	//-----------------------------------------------
	ShowMsg_("DEMO_803_MSG_050");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	Wait_(10);	
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット5 スターシードズームアウト
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");

	WaitTask(task_cam);
	//===============================================
	// *アロマ
	// 「スターピースは　全部で　３つ。
	//　この先の　時空の裂け目の中にあるわ。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_AROMA");
	ShowMsg_("DEMO_803_MSG_060");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	Wait_(30);	
	SetDirToObject_(player, aroma);
	SetDirToObject_(aroma, player);

	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット6 アロマ＆主
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	task_cam = Task_AnimeMoveCamera_("anmeye003", "anmtgt003");

	MotionTalk(aroma);

	//===============================================
	// *アロマ
	// 「でも　それを手に入れるには　産星神と呼ばれる
	//　神さまに　チカラを認めてもらう必要があるの。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_AROMA");
	ShowMsg_("DEMO_803_MSG_070");
	KeyInputWait_();
	//===============================================
	
	//===============================================
	// *アロマ
	// 「アンタは　知らないと思うけど……
	//　産星神の強さは　想像を絶するわ。
	//-----------------------------------------------
	ShowMsg_("DEMO_803_MSG_080");
	SetFace_(aroma, "Face_loop_close");
	SetMotion_(aroma, aro_look_down_L, BLEND_XL);
	KeyInputWait_();
	//===============================================
	
	//===============================================
	// *アロマ
	// 「アンセス率いる　モンスターマスター軍団が
	//　束になって　ようやく勝てた相手だもの。
	//-----------------------------------------------
	ShowMsg_("DEMO_803_MSG_090");
	SetFace_(aroma, "Face_default");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	SetMotion_(aroma, MOT_WAIT, BLEND_XL);
	
	WaitTask(task_cam);
	Wait_(20);	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット7 アロマ　ズームアップ
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	SetVisible(player, false);
	task_cam = Task_AnimeMoveCamera_("anmeye004", "anmtgt004");
	Wait_(20);		
	SetMotion_(aroma, aro_star_L, BLEND_XL);
	SetFace_(aroma, "Face_smile");
	Wait_(20);	
	//===============================================
	// *アロマ
	// 「ふふ～ん。今の話　聞いてビビっちゃった？
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_AROMA");
	ShowMsg_("DEMO_803_MSG_100");
	KeyInputWait_();
	//===============================================
	
	//===============================================
	// *アロマ
	// 「安心なさい！　このアロマ様の言う通りにすれば
	//　アンタひとりで　産星神に勝てるようになるわ！
	//-----------------------------------------------
	ShowMsg_("DEMO_803_MSG_110");
	KeyInputWait_();
	//===============================================
	
	//===============================================
	// *アロマ
	// 「まずは　センタービルの地下に　行くのよ！
	//　そこで　すんごいものを見せてあげるわ！
	//-----------------------------------------------
	ShowMsg_("DEMO_803_MSG_120");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	WaitTask(task_cam);	
	
	EndDemo(FADE_COLOR_BLACK);
}
