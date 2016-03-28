//=============================================
//
//		demo607[いつわりの兄の正体_1(楽園)]
//
//=============================================
function SetAlphaFade2(chr, alpha, frm, chr2 = 0, alpha2 = 0,frm2 = 0, delay = 0)
{
	local n_alpha, n_alpha2;
	local now_alpha, now_alpha2;
	local change_alpha, change_alpha2;

	now_alpha = GetAlpha_(chr);
	if(chr2 == 0){ }else{
		now_alpha2 = GetAlpha_(chr2);
	}
	change_alpha = (now_alpha - alpha) / frm;
	if(chr2 == 0){ }else{ change_alpha2 = (now_alpha2 - alpha2) / frm2; }
	local count = 1;
	local dcount2 = 1;
	local count2 = 1;

	while(1){

		if(chr2 == 0 ){
		}else{
			if(dcount2 >= delay && count2 >= frm2){
				SetAlpha_(chr2, alpha2);
			}
		}

		if(count >= frm){
			SetAlpha_(chr, alpha);
		}

		if(count <= frm){
			SetAlpha_(chr, now_alpha - (count * change_alpha));
			count = count + 1;
		}

		if(chr == 0 ){
		}else{
			if( delay <= dcount2 && frm > count2){
			SetVisible(chr2, true);
			SetAlpha_(chr2, now_alpha2 - (count2 * change_alpha2));
				if( frm >= count2 ){
					count2 = count2 + 1;
				}
			}
			dcount2 = dcount2 + 1;
		}

		Wait_(1);

		n_alpha = GetAlpha_(chr);
		if(chr2 == 0){
		}else{
			n_alpha2 = GetAlpha_(chr2);
		}
		if(n_alpha == alpha){
			if(chr2 == 0){
			}else{
				if( n_alpha2 == alpha2){
					break;
				}
				if(chr2 == 0){
				break;
				}
			}
		}
	}
}

const WHITE_FLASH	 = "ef733_03_sym_core_dream";
const ASE			 = "ef712_13_emo_sweat01";
const SYUTYU		 = "ef000_03_shuchusen";
const CORE_DREAM	 = "ef733_03_sym_core_dream";
const REACTER		 = "ef732_09_light_reactor_c";

function UseEffectOffSet(type, chr = 0, bone = 0, x = 0, y = 0, z = 0)
{

	LoadEffect_(type);
	if( chr == 0 ){
	local efc_syutyu = SetCameraEffect_(type, 300);
	return efc_syutyu;
	}

	local efc = SetSelectBoneEffectSetOffset_(type, chr, bone, Vec3(x, y, z));
	
	return efc;
}

//-------------------------------------------------------------------------
//
//		読み込み・配置
//
//-------------------------------------------------------------------------
function Update()
{

// ▼変数定義
	local task_cam, task_player;
	local efc_player, effectId;

// ▼リソース読込
	// キャラクター
	local player	 = GetPlayerId_();					// 主人公
	local id_dark	 = ReadNpc_("n008");
	local id_boy	 = ReadNpc_("n036");

// ▼配置
	// 主人公
	SetPointPos_(player, "boy");
	local dark = ArrangePointNpc_(id_dark, "player");
	SetDir_(dark, 214);
	local boy = ArrangePointNpc_(id_boy, "player");

	SetVisible(dark, false);

// ▼α値設定
	SetManualCalcAlpha_(boy, true);
	SetManualCalcAlpha_(dark, true);
	SetManualCalcAlpha_(player, true);
	SetAlpha_(dark,0.31);
	SetAlpha_(player,1.0);
	SetAlpha_(boy,1.0);

// ▼エフェクト
	LoadEffect_("ef860_01_release");											// 呪縛からの解放EF
	LoadEffect_("ef860_02_change_dm");											// 変身解除

// ▼非常駐モーション読み込み
	local a_supL = ReadMotion_(boy, "Player_surprise_L");						// 驚きL
	SetMotion_(boy, a_supL, BLEND_N);

	local d_supL = ReadMotion_(dark, "n008_surprise_L");						// 驚きL
	SetMotion_(dark, d_supL, BLEND_N);

	local Player_caution01_L = ReadMotion_(player, "Player_caution01_L");		// 警戒L
	SetMotion_(player, Player_caution01_L, BLEND_N);

// ▼カメラ設定
	SetPointCameraEye_("001_cameye");
	SetPointCameraTarget_("001_camtgt");


//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);

	StartBlurEffect_();
	StartEarthQuake_(150, 150, 1)
	Wait_(30);
	PlaySE_("SE_DEM_097");
	local efc_player = SetCameraEffect_("ef860_01_release", 100);
	SetVisible(boy, false);
	Wait_(5);
	SetAlphaFade2(boy,0.31,90, dark, 0.9, 90, 0);
	Wait_(20);
	PlaySE_("SE_DEM_137");														//■SE:ダークマスターが去ろうとする
	local effectId = SetPointWorldEffect_("ef860_02_change_dm", "ef");
	local efc_player = SetCameraEffect_("ef860_01_release", 130);
	SetVisible(boy, false);
	SetAlpha_(dark,1.0);	
	Wait_(30);
	StopEarthQuake_();
	EndBlurEffect_();


	SetPointCameraEye_("001_cameye");
	SetPointCameraTarget_("001_camtgt");

	Wait_(50);
	UseEffectOffSet(CORE_DREAM);
	PlaySE_("SE_DEM_143");
	Wait_(30);

	EndDemo(FADE_COLOR_WHITE);
}
