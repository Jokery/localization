//===================== A00_00 �����s�s(�f�B�X�N) ====================

//------------------------------------------------
// �t�F�[�h�C��( �C�x���g�u���b�N )
//------------------------------------------------
function FadeIn()
{
	//=======================
	// ���I�u�W�F�N�g(�M�~�b�N)
	//=======================

	// ���\�[�X�ǂݍ���
	local id_bill = ReadGimmick_("o_A00_04");
	local id_transfer = ReadGimmick_("o_com_01");

	// ���Z���^�[�r��(�_��)
	local bill_light = ArrangePointGimmick_("o_A00_04", id_bill, "g_bill");
	SetMotion_(bill_light, "GIMMICK_1", 0);

	// ���]�����u(�Î�̑����s)
	local transfer01 = ArrangePointGimmick_("o_com_01", id_transfer, "g_transfer");

	// ���]�����u(���y�̗쓹�s)
	local transfer02 = ArrangePointGimmick_("o_com_01", id_transfer, "g_transfer_02");


	// �������̓C�x���g���Ŕz�u���Ȃ�����

	EventEnd_();
}

//=========================================================================================================
//                            �������������牺�̓��[�J���֐�������
//=========================================================================================================

//++++++++++++++++++++++++++++++++++++++++++++++++
//    ���[�J���֐�
//------------------------------------------------
// ����   : �Ȃ�
// �߂�l : �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
//function u()
//{
//}
