//=============================================
//
//		demo705[É^ÉCÉgÉãÉfÉÇÅiâŒéRÅj]
//
//=============================================

//-------------------------------------------------------------------------
//
//		ì«Ç›çûÇ›ÅEîzíu
//
//-------------------------------------------------------------------------
function Update()
{
// Å•ïœêîíËã`
	local task_cam;

// Å•ÉäÉ\Å[ÉXì«çû
	local gi_kabe	 = ReadGimmick_("o_V00_03");
	local gi_souti	 = ReadGimmick_("o_V00_11");
//	local gi_dai	 = ReadGimmick_("o_V00_05");
//	local gi_mono	 = ReadGimmick_("o_com_02");

// Å•îzíu
	local kabe	 = ArrangePointGimmick_("o_V00_03", gi_kabe, "rock");
	local souti	 = ArrangePointGimmick_("o_V00_11", gi_souti, "souti");
//	local dai	 = ArrangePointGimmick_("o_V00_05", gi_dai, "ue");
//	local mono	 = ArrangeGimmick_("o_V00_05", gi_mono, Vec3(-286.0, 853.75, 1299.5));
	
	
// Å•ìVåÛê›íË
	SetWeather_(WEATHER.BAD);
//-------------------------------------------------------------------------
//		ÇÕÇ∂Ç‹ÇËÇÕÇ∂Ç‹ÇË
//-------------------------------------------------------------------------

	SetFade_(FADE_IN, FADE_COLOR_BLACK, 10);
	while(true)
	{
		ReadWaitingLod("lodeye000", "lodtgt000");

		// Å•ÉJÉbÉgÇPÅóÅ`Å`Å`Å`Å`Å`Å`Å`Å`Å`Å`Å`Å`Å`Å`Å`Å`Å`Å`Å`Å`Å`
		SetTime_(START_TIME_ZONE_NOON);		
		SetFogDensity_(1.0);
		task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");
		
		WaitTask(task_cam);	

		DeleteTask_(task_cam);

	}
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 20);
	WaitFade_();
	
	
}



