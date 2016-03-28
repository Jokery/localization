//=============================================
//
//		demo112[ガードマスター再戦]
//
//=============================================
function Update()
{
	
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
	
	//初期のモーション
	SetMotion_(res_gur, MOT_WAIT, BLEND_M);
	
	//非常駐モーション
	local gur_stop_L = ReadMotion_(res_gur, "m121_00_stop_L");		//静止L
	local gur_up = ReadMotion_(res_gur, "m121_00_up");				//静止→顔をあげる
	local gur_up_L = ReadMotion_(res_gur, "m121_00_up_L");			//顔を上げるL
	local gur_stand = ReadMotion_(res_gur, "m121_00_stand");		//顔を上げる→待機	
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット1
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");
	
	//=====================================
	//フェードイン
	//=====================================
	StartDemo(FADE_COLOR_BLACK);
	
	//=====================================
	//会話開始
	//=====================================
	
	OpenMsgWnd_();
//	SetTalkName_("NAME_TAG_GUARD_MASTER");
	ShowMsg_("DEMO_112_MSG_010");
	KeyInputWait_();
	
	CloseMsgWnd_();
	//===============================================
	
	PlaySE_("SE_DEM_043");							//ガードマスター戦闘前
	
	SetMotion_(res_gur,MOT_ATTACK, BLEND_M);		//◆キラーマシン攻撃
	Wait_(10);
	
	//=====================================
	//◆戦闘ブラー
	//=====================================
	EncountEndDemo(ENCOUNT_BOSS);
	
}