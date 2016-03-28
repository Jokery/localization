//========================================================
//
//		demo314[トードーの頼み]
//
//========================================================

function Update()
{
	//=====================================
	//ローカル変数の設定
	//=====================================
	local task_cam, task_player, task_todo, task_ietasu;								//タスク関係の変数
	local task_okiduti, task_momo;														//タスク関係の変数
	local efc_player, efc_cam, efc_attack01, efc_attack02, efc_guard, efc_smoke;		//エフェクト関係の変数
	
	//=====================================
	//リソース読み込み
	//=====================================
	
	//▼主人公（IDの取得）
	local player = GetPlayerId_();
	
	//▼NPC
	local model_todo   = ReadNpc_("n039");								// トードー親分
	local model_ietasu = ReadNpc_("n041");								// イエタス
	local model_okiduti = ReadNpc_("m035_00");							// おおきづち
	local model_momo = ReadNpc_("m041_02");								// メイジももんじゃ
	
	//▼ギミック
	local ice_wall = ReadGimmick_("o_I01_00");							// 氷の壁
	
	//▼エフェクト
	LoadEffect_("ef733_01_sym_shuchusen01");									// 集中線
	LoadEffect_("ef831_01_atc_yetas");									// 黒い攻撃
	LoadEffect_("ef723_01_nat_explosion_n01");							// 汎用爆発
	LoadEffect_("ef712_10_emo_surprise01");								//！
	

	//=====================================
	//設置
	//====================================
	//▼キャラクター
	SetPointPos_(player, "player000");									//主人公

	local todo   = ArrangePointNpc_(model_todo, "npc_todo000");			//トードー
	SetScaleSilhouette(todo, SCALE.TODO, 0.5);
	SetFace_(todo, "Face_default");

	local ietasu = ArrangePointNpc_(model_ietasu, "npc_ietasu000");		//イエタス
	SetScaleSilhouette(ietasu, SCALE.N, 0.3);

	local okiduti00 = ArrangePointNpc_(model_okiduti, "npc_okiduti000");//おおきづちA
	SetScaleSilhouette(okiduti00, SCALE.N, SILHOUETTE_WIDTH.N);
	
	local okiduti01 = ArrangePointNpc_(model_okiduti, "npc_okiduti100");//おおきづちB
	SetScaleSilhouette(okiduti01, SCALE.N, SILHOUETTE_WIDTH.N);
	
	local okiduti02 = ArrangePointNpc_(model_okiduti, "npc_okiduti200");//おおきづちC
	SetScaleSilhouette(okiduti02, SCALE.N, SILHOUETTE_WIDTH.N);

	local momo00 = ArrangePointNpc_(model_momo, "npc_momo000");			//メイジももんじゃA
	SetScaleSilhouette(momo00, SCALE.N, SILHOUETTE_WIDTH.N);

	local momo01 = ArrangePointNpc_(model_momo, "npc_momo100");			//メイジももんじゃB
	SetScaleSilhouette(momo01, SCALE.N, SILHOUETTE_WIDTH.N);

	local momo02 = ArrangePointNpc_(model_momo, "npc_momo200");			//メイジももんじゃC
	SetScaleSilhouette(momo02, SCALE.N, SILHOUETTE_WIDTH.N);
	
	//※エフェクト設置のため配置
	local ietasu_atc = ArrangePointNpc_(model_ietasu, "efc_attack000");	//イエタスの攻撃
	SetPointPosNoFit_(ietasu_atc, "efc_attack000");						//空中配置
	SetAlpha_(ietasu_atc, ALPHA_CLEAR);									//非表示
	
	
	//▼ギミック
	local res_ice = ArrangePointGimmick_("o_I01_00", ice_wall, "obj_ice_wall000");	//氷の壁
	
	//=====================================
	//非常駐モーション読み込み
	//=====================================
	
	// 主人公
	local pl_sup = ReadMotion_(player, "Player_surprise");				// 驚く
	local pl_sup_L = ReadMotion_(player, "Player_surprise_L");			// 驚くL
	local pl_caution01_L = ReadMotion_(player, "Player_caution01_L");	// 警戒

	//トードー
	local todooyabun_attack = ReadMotion_(todo, "n039_attack");			// 攻撃（トードー親分用）
	local yetas_attack = ReadMotion_(ietasu, "n041_attack");			// 攻撃（イエタス用）

//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------
	
	//▼初期モーション
	SetMotion_(player, MOT_RUN, BLEND_N)									//主　走る

	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット１ 主人公　トドの家からカメライン
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//～～～～～～～～～カメラ～～～～～～～～～～～
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");

	task_player = Task_MoveForward_(player, 0.9, true);						//主人公走る
	StartDemo(FADE_COLOR_BLACK);											//フェードイン
	
	Wait_(33);

	SetMotion_(player, pl_sup, BLEND_L)										//主　驚く
	Wait_(4);
	SetStepSe_(player, SILENT_STEP_SE);
	WaitMotion(player);
	DeleteTask_(task_player);
	SetMotion_(player, pl_sup_L, BLEND_L)									//主　驚くL
	
	PlaySE_("SE_DEM_053");
	efc_player = SetSelectBoneEffectSetOffset_("ef712_10_emo_surprise01", player, ATTACH_EFFECT1, Vec3(0.6, 1.3, 0.0));
	SetEffectScale_(efc_player, 0.5);

	
	WaitTask(task_cam);
	Wait_(60);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット2 トドvsイエ　主ズームアップ後カメライン
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	SetPointPos_(player, "player001");										//主人公移動
	ResetStepSe_(player);
	SetMotion_(player, MOT_RUN, BLEND_N)									//主　走る
	
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");
	
	SetStepSe_(okiduti00, SILENT_STEP_SE);									//足音を無音にする
	SetMotion_(okiduti00, MOT_RUN, BLEND_N)									//おおきづち走る
	task_okiduti = Task_MoveForward_(okiduti00, 1.3, true);					//木槌走る
	Wait_(37);
	SetMotion_(okiduti00, MOT_WAIT, BLEND_L)								//おおきづち待機
	DeleteTask_(task_okiduti);
	
	WaitTask(task_cam);
	
	//主ズームアップ後カメライン
	task_player = Task_MoveForward_(player, 1.0, true);						//主人公走る
	Wait_(25);
	DeleteTask_(task_player);
	SetMotion_(player, pl_caution01_L, BLEND_L)								//主　警戒
	
	Wait_(30);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット3 トド　ズームイン
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");
	PlaySE_("SE_DEM_026");	// ■SE:集中線
	efc_cam = SetCameraEffect_("ef733_01_sym_shuchusen01", 100);					//トドに集中線
	WaitTask(task_cam);

	//===============================================
	//■トードー
	//「イエタス！　ワシはシルバーを殺しておらんっ！
	//　なぜだ？　何を根拠に　ワシを疑う！？
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_TODO");
	ShowMsg_("DEMO_314_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	DeleteEffectEmitter_(efc_cam);
	Wait_(10);
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット4 イエ　ズームイン
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	task_cam = Task_AnimeMoveCamera_("anmeye003", "anmtgt003");
	WaitTask(task_cam);

	//===============================================
	//■イエタス
	//「問答無用！　ひきょう者に　そのオサの証は
	//　ふさわしくないと　知るがいい！
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_IETASU");
	ShowMsg_("DEMO_314_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット5 イエ攻撃
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	task_cam = Task_AnimeMoveCamera_("anmeye004", "anmtgt004");									//攻撃時にズームアウト
	InitSilhouetteWidth_(ietasu, 1.5);

	efc_cam = SetCameraEffect_("ef733_01_sym_shuchusen01", 0);										//イエに集中線
	SetMotion_(ietasu, yetas_attack, BLEND_M)													//イエタス通常攻撃
	efc_attack01 = SetSelectBoneEffect_("ef831_01_atc_yetas", ietasu, ATTACH_EFFECT1);			//黒い攻撃ef
	SetEffectScale_(efc_attack01, 1.0);
	PlaySE_("SE_DEM_112");
	
	WaitTask(task_cam);
	Wait_(10);

	efc_attack02 = SetSelectBoneEffect_("ef831_01_atc_yetas", ietasu_atc, ATTACH_EFFECT1);		//見えないイエタスで攻撃ef※エフェクトの射程延長のため設置
	SetEffectScale_(efc_attack02, 0.01);
	Wait_(15);

	SetMotionSpeed_(todo, 1.5);																	// モーションが早くなる
	SetMotion_(todo, todooyabun_attack, BLEND_M)												//トド通常攻撃
	Wait_(10);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット6 トド防御
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	task_cam = Task_AnimeMoveCamera_("anmeye005", "anmtgt005");									//25F
	PlaySE_("SE_DEM_113");
	SetEffectScale_(efc_attack02, 1.0);
	Wait_(2);
	
	DeleteEffectEmitter_(efc_attack02);
	Wait_(3);
	StartEarthQuake_(-1, 3, 4);																	//地震
	efc_guard = SetPointWorldEffect_("ef723_01_nat_explosion_n01", "efc_guard000");				//◆仮　相殺エフェクト
	SetEffectScale_(efc_guard, 0.4);
	Wait_(12);
	StopEarthQuake_();
	DeleteEffectEmitter_(efc_cam);
	WaitTask(task_cam);

	SetMotion_(todo, MOT_WAIT, BLEND_XL)														//トド待機

	Wait_(30);
	

	SetMotionSpeed_(todo, 1.2);																	// モーション元に戻す
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット7 ズームイン
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	task_cam = Task_AnimeMoveCamera_("anmeye006", "anmtgt006");
	Wait_(3);
	efc_cam = SetCameraEffect_("ef733_01_sym_shuchusen01", 100);										//トドに集中線

	WaitTask(task_cam);
	DeleteEffectEmitter_(efc_cam);

	//===============================================
	//■トードー
	//「ええいっ　聞く耳持たんというわけか！
	//　こうなれば　真実を　明らかにするまで！
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_TODO");
	ShowMsg_("DEMO_314_MSG_030");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット8 主人公アップ
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	SetPointPos_(player, "player002");															//主人公移動

	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");
	
	Wait_(5);
	//===============================================
	//「<name_player/>よ！　シルバーの死を調べて
	//　我が無実の　決定的な証拠を　探してくれい！
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_TODO");
	ShowMsg_("DEMO_314_MSG_040");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	Wait_(5);
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 10);	
	WaitFade_();

	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット9 氷の霊園を映す
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	task_cam = Task_AnimeMoveCamera_("anmeye007", "anmtgt007");
	SetFade_(FADE_IN, FADE_COLOR_BLACK, 30);
	Wait_(20);

	//===============================================
	//■トードー
	//「東ポーラパークの中に　氷の霊園と
	//　ワシらが呼ぶ　墓場がある！
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_TODO");
	ShowMsg_("DEMO_314_MSG_050");
	KeyInputWait_();
	//===============================================
	
	//===============================================
	//「そこに葬られた　シルバーの棺を　調べろ！
	//　奴が　手がかりも残さず　死ぬはずがない！
	//-----------------------------------------------
	ShowMsg_("DEMO_314_MSG_060");
	KeyInputWait_();
	//===============================================
	
	//===============================================
	//「イエタスは　ワシが抑えておくけぇ
	//　証拠を見つけて　こやつを　だまらせてくれ！
	//-----------------------------------------------
	ShowMsg_("DEMO_314_MSG_070");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	Wait_(40);

	DeleteTask_(task_cam);

	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット10 トドアップ
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");
	
	//===============================================
	//■トードー
	//「もはや　おんしだけが　頼りじゃ！
	//　任せたぞ　<name_player/>！
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_TODO");
	ShowMsg_("DEMO_314_MSG_080");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	
	EndDemo(FADE_COLOR_BLACK);
	
}
