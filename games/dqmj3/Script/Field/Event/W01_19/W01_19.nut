//===================== W01_19 ���� ====================

//------------------------------------------------
//		�퓬�I����
//------------------------------------------------
function AfterBattle()
{


	EventEnd_();
}

//------------------------------------------------
//		�}�b�v�ɓ���O
//------------------------------------------------
function BeforeInitMap()
{
	
	EventEnd_();
}


//------------------------------------------------
//		�t�F�[�h�A�E�g��
//------------------------------------------------
function FadeIn()
{

	//----------
	// ��NPC�z�u
	//----------
	//����

	//-----------
	// ���n���z�u
	//-----------
	// ID������
	g_mine_sky_return_point <- C_NONE_ID;

	g_mine_sky_return_point = SetPointBoxEventMine_("mine_sky_return_point", true);


	EventEnd_();
}

//------------------------------------------------
//		�t�B�[���h����J�n
//------------------------------------------------
function EventStartOperate()
{


	EventEnd_()
}

//------------------------------------------------
//		�m�o�b�ڐG��
//------------------------------------------------
function TouchNpc()
{

	local target = GetTargetId_();

	EventEnd_();
}

//------------------------------------------------
//		�n���ڐG��
//------------------------------------------------
function TouchEventMine()
{
	local target = GetTouchEventMineId_();
	
	switch (target) {
	case g_mine_sky_return_point:
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_REACTOR");
		ShowMsg_("SKY_RETURN_MSG_00");
		KeyInputWait_();
		if(GetQueryResult_() == QUERY_YES){

			//��󃉃C�h�Ƀ����X�^�[���ݒ肳��Ă��邩�`�F�b�N
			if ( IsFlightRideSetting_() == true ) {
				CloseMsgWnd_();
				DeleteEventMine_(g_mine_sky_return_point);
				ChangeMapToFlight_();

			//�ݒ肳��Ă��Ȃ��I
			} else {
				// �R�����g��< 2��DB #6294 >
				//OpenMsgWnd_();
				//SetTalkName_("NAME_TAG_REACTOR");
				ShowMsg_("SKY_RETURN_MSG_10");
				KeyInputWait_();
				ShowMsg_("SKY_RETURN_MSG_11");
				KeyInputWait_();
				CloseMsgWnd_();

			}

		} else {
			CloseMsgWnd_();
			//��l���t���[��
		}

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

