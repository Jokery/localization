//=============================================
//
//		demo802[ルキヤとアロマ]
//
//=============================================
const FLASH = "ef732_13_light_reactor01";
function SetScale2way(chr, now_scale, next_scale, frm)
{
	local size = (now_scale - next_scale) / frm;
	local count = 1;
	
	while(1){
		
		if(count <= frm){
			SetEffectScale_(chr, now_scale - (count * size));
			count = count + 1;
		}
		
		
		Wait_(1);
		if(count >= frm){
			SetEffectScale_(chr, next_scale);
		}
		
		if(frm <= count){
			break;
		}
	}
}

function SetAlphaFade2(chr, alpha, frm)
{
	local n_alpha, n_alpha2;
	local now_alpha, now_alpha2;
	local change_alpha, change_alpha2;
	
	now_alpha = GetAlpha_(chr);
	change_alpha = (now_alpha - alpha) / frm;
	local count = 1;
	
	while(1){
		
		
		if(count >= frm){
			SetAlpha_(chr, alpha);
		}
		
		if(count <= frm){
			SetAlpha_(chr, now_alpha - (count * change_alpha));
			count = count + 1;
		}

		Wait_(1);

		n_alpha = GetAlpha_(chr);
		if(n_alpha == alpha){
			break;
		}
	}
}

function Task_Rot3(chr, rot, frm)
{

//半時計回り　加算
//時計回り　減算

	local dir = GetDir_(chr);
	
	local sita = dir+rot;
	
	local sita2 = sita-dir;

	if( sita2 <= 0 ){
		sita2 = sita2*-1;
	}
	
	local frm2 = sita2/frm;
	
	local task = Task_RotateToDir_(chr, sita, frm2);
	
	return task;
}
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
	local player = GetPlayerId_();					// 主人公
	local id_rukiya = ReadNpc_("n009");				// ルキヤ
	local id_aroma = ReadNpc_("n018");				// アロマ
	local id_base = ReadGimmick_("o_effect_base");	// エフェクトベース
	
	
	// エフェクト
	LoadEffect_("ef732_13_light_reactor01");			// リアクターの光(ルキヤを吸い込む光)
	LoadEffect_("ef861_03_m_draw");						// M抗体吸い込まれる


	// ギミック
	local id_pod = ReadGimmick_("o_U00_02");			// 脱出ポッド
	local id_alias = ReadGimmick_("o_U00_11");		// エイリアス装置

	local id_red_door = ReadGimmick_("o_U00_05");		// 扉:赤扉
	local id_green_door00 = ReadGimmick_("o_U00_09");	// 扉:緑扉
	local id_green_door01 = ReadGimmick_("o_U00_10");	// 扉:緑扉
	
// ▼配置
	// 主人公
	local task_player = Task_AnimeMove_(player, "player");
	DeleteTask_(task_player);
	local kaiten = Task_Rot3(player, 50, 1);
	
	//アロマ
	local aroma = ArrangePointNpc_(id_aroma, "aroma_show");
	SetStepSe_(aroma, SILENT_STEP_SE);
	
	//ルキヤ
	local rukiya = ArrangeNpc_(id_rukiya, false);
	local task_rukiya = Task_AnimeMove_(rukiya, "rukiya");
	DeleteTask_(task_rukiya);
	
	//ギミック
	
	local pod1 = ArrangePointGimmick_("o_U00_02", id_pod, "pod1");								//脱出ポッド３基
	local pod2 = ArrangePointGimmick_("o_U00_02", id_pod, "pod2");
	local pod3 = ArrangePointGimmick_("o_U00_02", id_pod, "pod3");
	
	local souti1 = ArrangeGimmick_("o_U00_11", id_alias, "souti1");						//エイリアス装置３基
	local souti2 = ArrangeGimmick_("o_U00_11", id_alias, "souti2");
	local souti3 = ArrangeGimmick_("o_U00_11", id_alias, "souti3");
	
	local red_door = ArrangeGimmick_("o_U00_05", id_red_door, "obj_door000");					//扉:赤扉
	local green_door00 = ArrangeGimmick_("o_U00_09", id_green_door00, "obj_door000");			//扉:緑扉
	local green_door01 = ArrangeGimmick_("o_U00_10", id_green_door01, "obj_door000");			//扉:緑扉

// ▼非常駐モーション読込
	//主人公
	local p_wait = ReadMotion_(player, "Player_caution01_L");									//警戒L
	local p_left = ReadMotion_(player, "Player_look_left_L");									//左向きL
	
	//アロマ
	local a_sleep = ReadMotion_(aroma, "n018_cold_sleep_L");							//カプセル
	local a_nobi = ReadMotion_(aroma, "n018_stretch");									//伸び
	local a_sita = ReadMotion_(aroma, "n018_look_down_L");								//下向き待機L
	
// ▼初期モーション
	SetMotion_(aroma, a_sleep, 1); 

	
// ▼カメラ設定
	SetPointCameraEye_("0_eye");
	SetPointCameraTarget_("0_tgt");
	
	SetFace_(aroma, "Face_loop_close");

//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------
	StartDemo(FADE_COLOR_BLACK);
	Wait_(15);
	local task_rukiya = Task_AnimeMove_(rukiya, "rukiya");
	WaitTask(task_rukiya);
	SetMotion_(player, p_left, 4);
	//===============================================
	// ■ルキヤ
	// 「ふぅ　あたしの本体は　無事なようだね。
	// 　何かあったら　どうしようかと思ったよ。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RUKIYA");
	ShowMsg_("DEMO_802_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	local task_rukiya = Task_AnimeMove_(rukiya, "rukiya2");
	SetMotion_(player,MOT_WAIT,16);
	local task_player = Task_AnimeMove_(player, "player");
	Wait_(58);
	SetMotion_(player,MOT_WALK,4);
	SetPointCameraEye_("1_eye");
	SetPointCameraTarget_("1_tgt");
	Wait_(120);
	SetMotion_(player,MOT_WAIT,4);
	Wait_(30);
	local task_cam = Task_AnimeMoveCamera_("2_eye", "2_tgt");
	DeleteTask_(task_cam);
	local taska = Task_Rot3(rukiya, 180, 60);
	WaitTask(taska);
	
	//===============================================
	// ■ルキヤ
	// 「さて　これで本体が　目覚めるはずさ。
	// 　そこで待ってな　○主人公の名前○。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RUKIYA");
	ShowMsg_("DEMO_802_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	local hikari = ArrangeGimmick_("o_effect_base", id_base, false);
	PlaySE_("SE_DEM_195");
	local efc = SetSelectBoneEffect_("ef732_13_light_reactor01", hikari, ATTACH_GLOBAL);
	SetEffectScale_(efc, 0.5);
	local task_cam = Task_AnimeMoveCamera_("2_eye", "2_tgt");
	DeleteTask_(task_cam);
	local task	 = Task_AnimeMoveNoFit_(hikari, "flash");
	DeleteTask_(task);
	SetScale2way(efc, 0.5, 0.8, 1);
	SetAlphaFade2(rukiya, 0, 60);
	SetVisible(rukiya, false);
	SetScale2way(efc, 0.8, 0.15, 50);
	local task_cam = Task_AnimeMoveCamera_("2_eye", "2_tgt");
	local task	 = Task_AnimeMoveNoFit_(hikari, "flash");
	Wait_(151);
	local efc_draw = SetPointWorldEffect_("ef861_03_m_draw", "draw");// 吸い込まれる
	SetEffectScale_(efc_draw, 0.5);
	DeleteEffectEmitter_(efc);
	WaitTask(task_cam);
	StopBgm_(30);
	SetFade_(FADE_OUT, FADE_COLOR_WHITE, 30);
	Wait_(30);
	local task_aroma = Task_AnimeMove_(aroma, "aroma");
	DeleteTask_(task_aroma);
	SetMotion_(aroma, MOT_WAIT, 1);
	Wait_(60);
	local task_cam = Task_AnimeMoveCamera_("3_eye", "3_tgt");
	SetFade_(FADE_IN, FADE_COLOR_WHITE, 30);

	Wait_(40);
	SetMotion_(aroma, a_nobi, 4);
	local taskaa = Task_ChangeMotion_(aroma, MOT_WAIT, 16);
	Wait_(90);
	
	//===============================================
	// *アロマ
	// 「んっ……ああ　よく寝た。
	// 　目覚めは　上々ってところかしら？
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_802_MSG_030");
	Wait_(20);
	SetFace_(aroma, "Face_eyes_close");
	KeyInputWait_();
	//-----------------------------------------------


	//-----------------------------------------------
	// 「この身体で　アンタに会うのは　はじめてだし
	// 　まずは　自己紹介をしておくわね。
	//-----------------------------------------------
	ShowMsg_("DEMO_802_MSG_040");
	SetFace_(aroma, "Face_smile");
	SetMotion_(aroma, MOT_TALK, BLEND_L);
	WaitMotion(aroma);
	SetMotion_(aroma, MOT_TALKLOOP, BLEND_M);	
	KeyInputWait_();
	//-----------------------------------------------
	
	//-----------------------------------------------
	// *アロマ
	// 「アタシの　本当の名前は　アロマ。
	// 　天才科学者　ルキヤ先生の……影武者よ。
	//-----------------------------------------------
	ShowMsg_("DEMO_802_MSG_050");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	DeleteTask_(task_cam);
	
	SetMotion_(player, p_left, BLEND_N);
	local task_dir = Task_RotateToDir_(player, 180, 180);
	
	SetPointCameraEye_("4_eye");
	SetPointCameraTarget_("4_tgt");
	
	task_aroma = Task_AnimeMoveSetMotion_(aroma, "aroma", MOT_WALK, a_sita);
	task_aroma_step = Task_PlaySe_("SE_FLD_021", 15);
	Wait_(70);
	
	SetMotionSpeed_(player, 0.2);	// モーションがゆっくりになる
	SetMotion_(player, MOT_WAIT, BLEND_XL);
	
	//===============================================
	// ■アロマ
	// 「アタシが姿を借りていた　ルキヤ先生はね
	// 　マザーを開発し　移民計画の発案した人……。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_AROMA");
	ShowMsg_("DEMO_802_MSG_060");
	Wait_(35);
	DeleteTask_(task_aroma_step);
	KeyInputWait_();
	//-----------------------------------------------
	
	
	//-----------------------------------------------
	// 「そして　アタシは　ルキヤ先生の弟子として
	// 　移民計画を実現するため　働いていたの。
	//-----------------------------------------------
	ShowMsg_("DEMO_802_MSG_070");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	WaitTask(task_aroma);
	
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 30);
	WaitFade_();
	PlayBgm_("BGM_009");
//===================================
//ここから過去映像カット
//===================================
	LoadLayout_("memories"); 
	SetLayoutAnime_("ev802_00_loop", true);
	SetFade_(FADE_IN, FADE_COLOR_BLACK, 30);
	WaitFade_();
	//===============================================
	// ■アロマ
	// 「でも先生は　ブレイクワールドが誕生したとき
	// 　マザーの暴走に巻きこまれ　亡くなったわ……。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_AROMA");
	ShowMsg_("DEMO_802_MSG_080");
	KeyInputWait_();
	//-----------------------------------------------
	
	//-----------------------------------------------
	// 「あの暴走で　コールドスリープ中だった仲間を
	// 　多く失って……移民団は　崩壊寸前だった。
	//-----------------------------------------------
	ShowMsg_("DEMO_802_MSG_090");
	KeyInputWait_();
	//-----------------------------------------------
	
	//-----------------------------------------------
	// 「そんなとき　リーダーだった先生が　死んだと
	// 　移民のみんなが　知ったらどうなるか……！
	//-----------------------------------------------
	ShowMsg_("DEMO_802_MSG_100");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 30);
	WaitFade_();
	SetLayoutAnime_("ev802_00_out", false);
	WaitLayoutAnime();
	SetLayoutAnime_("ev802_01_loop", true);
	SetFade_(FADE_IN, FADE_COLOR_BLACK, 30);
	WaitFade_();
	//===============================================
	// ■アロマ
	// 「混乱を恐れたアタシは　開発中だった
	// 　エイリアス装置で　先生に成り代わったの。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_AROMA");
	ShowMsg_("DEMO_802_MSG_110");
	KeyInputWait_();
	//-----------------------------------------------
	
	//-----------------------------------------------
	// ■アロマ
	// 「……それが　移民の仲間たちを
	// 　だますことになるって　わかった上でね。
	//-----------------------------------------------
	ShowMsg_("DEMO_802_MSG_120");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 30);
	WaitFade_();
	SetLayoutAnime_("ev802_01_out", false);
	WaitLayoutAnime();
//===================================
//ここまで過去映像カット
//===================================
	local task_kaiwa = Task_RotateToPos_(player, GetPos_(aroma), 100);
	local task_kaiwa = Task_RotateToPos_(aroma, GetPos_(player), 100);
	SetFace_(aroma, "Face_default");
	
	SetPointCameraEye_("5_eye");
	SetPointCameraTarget_("5_tgt");
	
	SetFade_(FADE_IN, FADE_COLOR_BLACK, 30);
	WaitFade_();
	//===============================================
	// ■アロマ
	// 「先生なしでは　仲間が　まとまらないほど
	// 　偉大な人だったのよ……。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_AROMA");
	ShowMsg_("DEMO_802_MSG_130");
	KeyInputWait_();
	//-----------------------------------------------
	SetMotion_(aroma, MOT_WAIT, 16);
	//-----------------------------------------------
	// ■アロマ
	// 「奥の部屋に　行きなさい。行けば　アンタにも
	// 　先生の偉大さが　わかるはずだから。
	//-----------------------------------------------
	ShowMsg_("DEMO_802_MSG_140");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	StopBgm_(30);
	EndDemo(FADE_COLOR_BLACK);
}
