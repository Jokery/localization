//=============================================
//
//		demo004[I[vjOf_7(´)]
//
//=============================================

//-------------------------------------------------------------------------
//
//		ÇÝÝEzu
//
//-------------------------------------------------------------------------
function Update()
{
// ¥VóÝè
	SetWeather_(WEATHER.BAD);						// «Vó
	SetTime_(15120);								// é
	
// ¥Ïè`
	local task_cam, task_player, task_reactor;
	local efc_player, efc_ractor00, efc_ractor01, efc_ractor02, efc_ractor03, efc_ractor04;
	local efc_thunder00, efc_thunder01,efc_thunder02 ,efc_thunder03 ,efc_thunder04 ,efc_thunder05;
	local size_reactor = SCALE.REACTOR;	

// ¥\[XÇ
	// LN^[
	local player = GetPlayerId_();					// ålö
	// M~bN
	local model_reactor = ReadGimmick_("o_dem_11");	// AN^[
	// GtFNg
	LoadEffect_("ef800_04_flying_reactor01");		// AN^[ÌOÕ
	LoadEffect_("ef800_06_flying_reactor03");		// AN^[Á¬
	LoadEffect_("ef800_10_crash_reactor01");		// iAN^[ÌÌÎÔj
	LoadEffect_("ef800_09_crash_reactor02");		// iAN^[É¿éj
	LoadEffect_("ef721_04_nat_smoke_psps");			// iÕ·Õ·j	
	LoadEffect_("ef800_11_crash_reactor03");		// iAN^[ÌãÌj	
	
	//VóGtFNg
	LoadEffect_("ef725_01_nat_rain_hard");			// åJ
	LoadEffect_("ef725_02_nat_thunder");			// iJÆZbgj
	

// ¥zu
	
	//AN^[
	local reactor = ArrangePointGimmick_("o_com_07", model_reactor, "obj_reactor000");
	SetScaleSilhouette(reactor, 5.0, 0.5);														//AN^[å«³ÏX
	efc_ractor00 = SetSelectBoneEffect_("ef800_04_flying_reactor01", reactor, ATTACH_GLOBAL);	//AN^[ÌOÕ
	SetEffectScale_(efc_ractor00, 5.0);
	
	//Vó
	SetCameraEffect_("ef725_01_nat_rain_hard", 100);											//åJ
//	PlayBgm_("BGM_028");//fobOpBGM
//-------------------------------------------------------------------------
//		Í¶ÜèÍ¶Üè
//-------------------------------------------------------------------------
	//¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬
	//¡Jbg1@Jª~ÁÄ¢éõi¨//¡Jbg2@A[`ÌOij
	//¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬
	// ¥JÝè
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");									// 80F
	WaitLod_();
	
	StartDemo(FADE_COLOR_BLACK);
	Wait_(10);
	
	efc_thunder00 = SetPointWorldEffect_("ef725_02_nat_thunder", "efc_thunder000");				// 3AT_[
	SetEffectScale_(efc_thunder00, 1.5);
	Wait_(40);
	efc_thunder01 = SetPointWorldEffect_("ef725_02_nat_thunder", "efc_thunder001");
	SetEffectScale_(efc_thunder01, 2.5);
	Wait_(60);	
	efc_thunder02 = SetPointWorldEffect_("ef725_02_nat_thunder", "efc_thunder002");
	SetEffectScale_(efc_thunder02, 1.5);

	Wait_(30);	
	efc_thunder03 = SetPointWorldEffect_("ef725_02_nat_thunder", "efc_thunder003");				// T_[
	SetEffectScale_(efc_thunder03, 0.7);
	
	WaitTask(task_cam);
	
	task_reactor = Task_AnimeMove_(reactor, "anm_reactor000");									//AN^[Aj[V	

	Wait_(80);

	DeleteTask_(task_cam);

	DeleteTask_(task_reactor);
	
	//¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬
	//¡Jbg3@ÉÅ½êé
	//¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬
	SetBgmVolume_(0.0, 140);		// 140t[©¯ÄABGM¹ÊðÁµÜ·
	//AjJÝè
	SetScaleSilhouette(reactor, 10.0, 5.0);														//AN^[Ìå«³ÏX
	SetEffectScale_(efc_ractor00, 10.0);														//ïÕÌå«³ÏX
	
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");									// 110F
	PlaySE_("SE_DEM_069");																		//¡SE |bhÉÅ½êéOÌV
	task_reactor = Task_AnimeMove_(reactor, "anm_reactor001");									//AN^[Aj[V
	
	Wait_(140);
	PlaySE_("SE_DEM_059");																		//¡SE |bhÉÅ½êÄ¿é
	efc_ractor03 = SetSelectBoneEffect_("ef800_09_crash_reactor02", reactor, ATTACH_GLOBAL);	//AN^[É
	SetEffectScale_(efc_ractor03, 4.0);
	DeleteEffect_(efc_ractor00);																//AN^[ÌI[ðÁ·
	
	Wait_(5);
	efc_ractor02 = SetSelectBoneEffect_("ef800_10_crash_reactor01", reactor, ATTACH_GLOBAL);	//AN^[©çÎÔ
	SetEffectScale_(efc_ractor02, 3.0);	
	
	efc_ractor03 = SetSelectBoneEffect_("ef800_11_crash_reactor03", reactor, ATTACH_GLOBAL);	//AN^[©ç
	SetEffectScale_(efc_ractor03, 5.0);		
	
	Wait_(25);
	SetBgmVolume_(1.0, 1);
	PlayBgm_("BG_AMBI_006");													//BGMØèÖ¦
	
	WaitTask(task_cam);
	
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 20);													//tF[hAEg
	WaitFade_();	

	DeleteTask_(task_reactor);	
	DeleteTask_(task_cam);
	
	//¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬
	//¡Jbg4@yÖÄ
	//¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬

	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");
	PlaySE_("SE_DEM_060");																		//¡SE |bhÄ

	WaitLod_();
	SetScaleSilhouette(reactor, 2.0, 0.5);														//AN^[å«³ÏX
	
//	efc_ractor03 = SetSelectBoneEffect_("ef800_10_crash_reactor01", reactor, ATTACH_GLOBAL);	//AN^[©ç
	SetEffectScale_(efc_ractor03, 1.0);
	
	SetFade_(FADE_IN, FADE_COLOR_BLACK, 10);													//tF[hC
	WaitFade_();

	task_reactor = Task_AnimeMove_(reactor, "anm_reactor002");									//AN^[Aj[V

	Wait_(75);
	efc_thunder04 = SetPointWorldEffect_("ef725_02_nat_thunder", "efc_thunder004");				// T_[
	SetEffectScale_(efc_thunder04, 2.0);

	Wait_(55);

	
	EndDemo(FADE_COLOR_BLACK);
}
