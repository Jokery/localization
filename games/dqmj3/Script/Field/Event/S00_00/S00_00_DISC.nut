//===================== S00_00���S�̊č���(�f�B�X�N) ====================

//------------------------------------------------
// �t�F�[�h�C��( �C�x���g�u���b�N )
//------------------------------------------------
function FadeIn()
{
	//=======================
	// ���I�u�W�F�N�g(�M�~�b�N)
	//=======================

	// ���\�[�X�ǂݍ���
	local id_paipu_close = ReadGimmick_("o_S02_21");
	local id_paipu_open = ReadGimmick_("o_S02_22");
	local id_transfer = ReadGimmick_("o_com_01");

	// ���p�C�v�̊W�i�j
	local gmk_paipu_close = ArrangePointGimmick_("o_S02_21", id_paipu_close, "gmk_paipu_close");

	// ���p�C�v�̊W�i�J�j
	local gmk_paipu_open = ArrangePointGimmick_("o_S02_22", id_paipu_open, "gmk_paipu_open");

	// ���]�����u�i�����̕X���j
	local transfer01 = ArrangePointGimmick_("o_com_01", id_transfer, "gmk_enter_transfer");

	// ���]�����u�i�ŔM�̉ΎR�j
	local transfer02 = ArrangePointGimmick_("o_com_01", id_transfer, "gmk_exit_transfer");


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

