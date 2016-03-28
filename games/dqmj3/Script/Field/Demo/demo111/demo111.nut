//=============================================
//
//		demo111[ガードマスター起動]
//
//=============================================
function Update()
{
	//=====================================
	//ローカル変数の設定
	//=====================================
	local ef811_0, efc_light_monoeye;
	
	//=====================================
	//NPC設置
	//=====================================
	
	//リソースの読み込み
	local npc_gur = ReadNpc_("m121_00");		//ガードマスター	◆ガードマスターのモデルが未実装なのでキラーマシン２で代用しています。
	local model_monitor00 = ReadGimmick_("o_A03_04");										//モニター
	
	//設置
	local res_gur = ArrangePointNpc_(npc_gur, "npc_guard000");
	local monitor00 = ArrangePointGimmick_("o_A03_04", model_monitor00, "obj_monitor00");	//モニター
	local model_red_screen = ReadGimmick_("o_A03_06");										//点滅する赤モニター(左)
	local red_screen = ArrangeGimmick_("o_A03_06", model_red_screen, false);
	SetMotion_(red_screen, MOT_GIMMICK_0, BLEND_N);											// 点滅ON

	//初期の向き
	SetDir_(res_gur, 180);
	
	//サイズ設定
	SetScaleSilhouette(res_gur, SCALE.M, SILHOUETTE_WIDTH.M);
	
	//=====================================
	//モーションの読み込み
	//=====================================
	
	//非常駐モーション
	local gur_stop_L = ReadMotion_(res_gur, "m121_00_stop_L");		//静止L
	local gur_up = ReadMotion_(res_gur, "m121_00_up");				//静止→顔をあげる
	local gur_up_L = ReadMotion_(res_gur, "m121_00_up_L");			//顔を上げるL
	local gur_stand = ReadMotion_(res_gur, "m121_00_stand");		//顔を上げる→待機	
	
	//初期のモーション
	SetMotion_(res_gur, gur_stop_L, BLEND_N);		//◆ガードマスター静止モーション
	
	//=====================================
	//エフェクトの読み込み
	//=====================================
	LoadEffect_("ef811_01_light_monoeye");	//モノアイ光る
	LoadEffect_("ef812_01_off_monoeye");	//モノアイ隠し
	local monoeye_OFF = SetSelectBoneEffect_("ef812_01_off_monoeye", res_gur, ATTACH_GLOBAL);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット1
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	
	local task1 = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");
	
	//=====================================
	//フェードイン
	//=====================================
	StartDemo(FADE_COLOR_BLACK);
		
	//◆ガードマスター起動
	//◆SE『ビコーン』
	PlaySE_("SE_DEM_042");
	efc_light_monoeye = SetPointWorldEffect_("ef811_01_light_monoeye", "efc_light_monoeye");			//モノアイ光る
	SetEffectScale_(efc_light_monoeye, 0.4);
	Wait_(10);
	DeleteEffect_(monoeye_OFF);//モノアイ隠し削除
	Wait_(27);

	SetMotion_(res_gur, gur_up, BLEND_XL);		//◆静止→顔を上げるモーション
	Wait_(40);
	
	DeleteTask_(task1);
	
	local task2 = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");

	SetMotion_(res_gur, gur_up_L, BLEND_M);		//◆顔を上げる。
	Wait_(10);
	
	SetMotion_(res_gur, gur_stand, BLEND_M);		//◆顔を上げる→待機。
	Wait_(45);
	SetMotion_(res_gur,MOT_WAIT, BLEND_XL);		//◆キラーマシン待機
	Wait_(10);

	//===============================================
	//「シンニュウシャ　ハッケン！
	OpenMsgWnd_();		
//	SetTalkName_("NAME_TAG_GUARD_MASTER");
	ShowMsg_("DEMO_111_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	PlaySE_("SE_DEM_043");							//ガードマスター戦闘前

	SetMotion_(res_gur,MOT_ATTACK, BLEND_M);		//◆キラーマシン攻撃
	Wait_(5);
	//=====================================
	//◆戦闘ブラー
	//=====================================
	EncountEndDemo(ENCOUNT_BOSS);

	
}