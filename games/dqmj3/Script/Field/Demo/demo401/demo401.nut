//=============================================
//
//		demo401[�A���C�p�[�N�̏Z�l����]
//
//=============================================

//-------------------------------------------------------------------------
//
//		�ǂݍ��݁E�z�u
//
//-------------------------------------------------------------------------
function Update()
{
// ���ϐ���`
	local task_cam, task_player;
	local efc_player, efc_saboten;

// �����\�[�X�Ǎ�
	// �L�����N�^�[
	local player = GetPlayerId_();							// ��l��
	local togejobo	 = ReadNpc_("m127_01");					// �Ƃ��W���{�[
	local saboten	 = ReadNpc_("m064_00");					// �T�{�e���{�[��
	local dessert	 = ReadNpc_("m132_01");					// �f�U�[�g�^���N

// ���z�u
	// ���N
	local g_npc_boy = ArrangePointNpc_(togejobo, "npc_boy000");
	SetScaleSilhouette(g_npc_boy, 0.35, 0.35);
	// ��e
	local g_npc_mother = ArrangePointNpc_(togejobo, "npc_mother000");
	SetScaleSilhouette(g_npc_mother, 0.52, 0.52);
	// ���
	local g_npc_item = ArrangePointNpc_(dessert, "npc_item000");
	SetScaleSilhouette(g_npc_item, SCALE.DEZATOTANKU,SILHOUETTE_WIDTH.DEZATOTANKU);
	// �h��
	local g_npc_inn = ArrangePointNpc_(saboten, "npc_inn000");
	SetScaleSilhouette(g_npc_inn, SCALE.SABOTENBOUL,SILHOUETTE_WIDTH.SABOTENBOUL);
	// �A���C�p�[�N�Z�l�`
	local g_npc_aroi_a = ArrangePointNpc_(saboten, "npc_aroi_a000");
	SetScaleSilhouette(g_npc_aroi_a, SCALE.SABOTENBOUL,SILHOUETTE_WIDTH.SABOTENBOUL);
	// �A���C�p�[�N�Z�l�a
	local g_npc_aroi_b = ArrangePointNpc_(dessert, "npc_aroi_b000");
	SetScaleSilhouette(g_npc_aroi_b, SCALE.DEZATOTANKU,SILHOUETTE_WIDTH.DEZATOTANKU);
	// �A���C�p�[�N�Z�l�b
	local g_npc_aroi_c = ArrangePointNpc_(saboten, "npc_aroi_c000");
	SetScaleSilhouette(g_npc_aroi_c, SCALE.SABOTENBOUL,SILHOUETTE_WIDTH.SABOTENBOUL);
	// �A���C�p�[�N�Z�l�c
	local g_npc_aroi_d = ArrangePointNpc_(dessert, "npc_aroi_d000");
	SetScaleSilhouette(g_npc_aroi_d, SCALE.DEZATOTANKU,SILHOUETTE_WIDTH.DEZATOTANKU);

// ����풓���[�V�����Ǎ�
	local feel_down_b = ReadMotion_(g_npc_boy, "m127_01_feel_down_L");// ���N�@��������L
	local feel_down_m = ReadMotion_(g_npc_mother, "m127_01_feel_down_L");// ��e�@��������L

// ���������[�V�����ݒ�
	SetMotion_(g_npc_boy, feel_down_b, BLEND_N);			// ���N�@��������L
	SetMotion_(g_npc_mother, feel_down_b, BLEND_N);			// ��e�@��������L

// ���J�����ݒ�
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");

//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
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
