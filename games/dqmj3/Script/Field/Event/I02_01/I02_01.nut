//===================== I02_01�X�̈�� ���w ====================


//------------------------------------------------
//		�퓬�I����
//------------------------------------------------
function AfterBattle()
{
	local main_num			= GetNumFlg_("NUM_SCENARIO_MAIN");			// Num0
	local ice_event_num		= GetNumFlg_("NUM_SCENARIO_SUB_ICE");		// Num5

	/*
		�����Ȃ�
	*/

	EventEnd_();
}


//------------------------------------------------
//		�}�b�v�ɓ���O
//------------------------------------------------
function BeforeInitMap()
{
	local main_num			 = GetNumFlg_("NUM_SCENARIO_MAIN");			// Num0
	local ice_event_num		 = GetNumFlg_("NUM_SCENARIO_SUB_ICE");		// Num5
	
	/*
		�����Ȃ�
	*/
	
	EventEnd_();
}


//------------------------------------------------
//		�t�F�[�h�A�E�g��
//------------------------------------------------
function FadeIn()
{
	local main_num			 = GetNumFlg_("NUM_SCENARIO_MAIN");			// Num0
	local ice_event_num		 = GetNumFlg_("NUM_SCENARIO_SUB_ICE");		// Num5

	//-----------
	// ���n���z�u
	//-----------
	// ID������
	g_mine_phantom_wall01	 <- C_NONE_ID;
	g_mine_phantom_wall02	 <- C_NONE_ID;
	g_mine_phantom_wall03	 <- C_NONE_ID;
	g_mine_phantom_wall04	 <- C_NONE_ID;
	g_mine_phantom_wall05	 <- C_NONE_ID;
	
	// �����̕�
	g_mine_phantom_wall01 = SetPointBoxEventMineNoFallWait_("mine_phantom_wall01");
	g_mine_phantom_wall02 = SetPointBoxEventMineNoFallWait_("mine_phantom_wall02");
	g_mine_phantom_wall03 = SetPointBoxEventMineNoFallWait_("mine_phantom_wall03");
	g_mine_phantom_wall04 = SetPointBoxEventMineNoFallWait_("mine_phantom_wall04");
	g_mine_phantom_wall05 = SetPointBoxEventMineNoFallWait_("mine_phantom_wall05");
	
	EventEnd_();
}

//------------------------------------------------
//		�t�B�[���h����J�n
//------------------------------------------------
function EventStartOperate()
{
	local main_num			 = GetNumFlg_("NUM_SCENARIO_MAIN");			// Num0
	local ice_event_num		 = GetNumFlg_("NUM_SCENARIO_SUB_ICE");		// Num5

	/*
		�����Ȃ�
	*/

	EventEnd_();
}

//------------------------------------------------
//		�m�o�b�ڐG��
//------------------------------------------------
function TouchNpc()
{
	local main_num			 = GetNumFlg_("NUM_SCENARIO_MAIN");			// Num0
	local ice_event_num		 = GetNumFlg_("NUM_SCENARIO_SUB_ICE");		// Num5

	/*
		�����Ȃ�
	*/

	EventEnd_();
}

//------------------------------------------------
//		�n���ڐG��
//------------------------------------------------
function TouchEventMine()
{
	local main_num			 = GetNumFlg_("NUM_SCENARIO_MAIN");			// Num0
	local ice_event_num		 = GetNumFlg_("NUM_SCENARIO_SUB_ICE");		// Num5

	local target = GetTouchEventMineId_();
	local player = GetPlayerId_();

	switch (target) {
	case g_mine_phantom_wall01 :
		uMinePhantom_wall01();
		break;
	case g_mine_phantom_wall02 :
		uMinePhantom_wall02();
		break;
	case g_mine_phantom_wall03 :
		uMinePhantom_wall03();
		break;
	case g_mine_phantom_wall04 :
		uMinePhantom_wall04();
		break;
	case g_mine_phantom_wall05 :
		uMinePhantom_wall05();
		break;
	default :
		DebugPrint("WARNING : MINE_ID���s���ł� [TouchEventMine]");
		break;
	}

	EventEnd_();
}


//------------------------------------------------
//		���A�N�^�[�N����
//------------------------------------------------
function ReactorOn()
{
	/*
		�����Ȃ�
	*/
	
	EventEnd_();
}


//------------------------------------------------
//		���A�N�^�[�Œ��ׂ���
//------------------------------------------------
function ReactorAnalyze()
{
	local main_num			= GetNumFlg_("NUM_SCENARIO_MAIN");			// Num0
	local ice_event_num		= GetNumFlg_("NUM_SCENARIO_SUB_ICE");		// Num5

	/*
		�����Ȃ�
	*/

	EventEnd_();
}


//------------------------------------------------
//		���A�N�^�[�I����
//------------------------------------------------
function ReactorOff()
{
	/*
		�����Ȃ�
	*/
	
	EventEnd_();
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		���̕Ǉ@�ɐG�ꂽ��
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMinePhantom_wall01()
{
	SetEventFlg_("BFG_OPEN_SECRET_AREA_I02_01_1", true);		// Bit_1823 �B�������I�[�v���t���O �X�̈�Շ@
	DeleteEventMine_(g_mine_phantom_wall01);
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		���̕ǇA�ɐG�ꂽ��
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMinePhantom_wall02()
{
	SetEventFlg_("BFG_OPEN_SECRET_AREA_I02_01_2", true);		// Bit_1824 �B�������I�[�v���t���O �X�̈�ՇA
	DeleteEventMine_(g_mine_phantom_wall02);
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		���̕ǇB�ɐG�ꂽ��
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMinePhantom_wall03()
{
	SetEventFlg_("BFG_OPEN_SECRET_AREA_I02_01_3", true);		// Bit_1825 �B�������I�[�v���t���O �X�̈�ՇB
	DeleteEventMine_(g_mine_phantom_wall03);
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		���̕ǇC�ɐG�ꂽ��
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMinePhantom_wall04()
{
	SetEventFlg_("BFG_OPEN_SECRET_AREA_I02_01_4", true);		// Bit_1826 �B�������I�[�v���t���O �X�̈�ՇC
	DeleteEventMine_(g_mine_phantom_wall04);
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		���̕ǇD�ɐG�ꂽ��
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMinePhantom_wall05()
{
	SetEventFlg_("BFG_OPEN_SECRET_AREA_I02_01_5", true);		// Bit_1827 �B�������I�[�v���t���O �X�̈�ՇD
	DeleteEventMine_(g_mine_phantom_wall05);
}


