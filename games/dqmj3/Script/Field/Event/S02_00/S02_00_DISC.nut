//===================== S02_00�C�b�^�u���č� 1F(�f�B�X�N) ====================

//------------------------------------------------
// �t�F�[�h�C��( �C�x���g�u���b�N )
//------------------------------------------------
function FadeIn()
{
	//=======================
	// ���I�u�W�F�N�g(�M�~�b�N)
	//=======================
	// ���G���x�[�^�[�̔�
	local id_elevator_door = ReadGimmick_("o_S02_01");
	local g_gmk_elevator_door = ArrangePointGimmick_("o_S02_01", id_elevator_door, "gmk_elevator_door");
	
	// ���G���x�[�^�[���t�g
	local id_elevator_lift = ReadGimmick_("o_S02_00");
	local g_gmk_elevator_lift = ArrangePointGimmick_("o_S02_00", id_elevator_lift, "gmk_elevator_lift");

	// ���S����<�S�ĊJ���Ă����Ԃɂ���(2��DB #2831)>
	local id_jail_door = ReadGimmick_("o_S02_02");
	// ��
	local g_gmk_jail_door_east_1 = ArrangePointGimmick_("o_S02_02", id_jail_door, "gmk_jail_door_est_1");
	SetGimmickMapHitEnable_(g_gmk_jail_door_east_1, false);		// �A�^���𖳌���
	SetMotion_(g_gmk_jail_door_east_1, MOT_GIMMICK_2, BLEND_N);
	local g_gmk_jail_door_east_2 = ArrangePointGimmick_("o_S02_02", id_jail_door, "gmk_jail_door_est_2");
	SetGimmickMapHitEnable_(g_gmk_jail_door_east_2, false);
	SetMotion_(g_gmk_jail_door_east_2, MOT_GIMMICK_2, BLEND_N);
	local g_gmk_jail_door_east_3 = ArrangePointGimmick_("o_S02_02", id_jail_door, "gmk_jail_door_est_3");
	SetGimmickMapHitEnable_(g_gmk_jail_door_east_3, false);
	SetMotion_(g_gmk_jail_door_east_3, MOT_GIMMICK_2, BLEND_N);
	local g_gmk_jail_door_east_4 = ArrangePointGimmick_("o_S02_02", id_jail_door, "gmk_jail_door_est_4");
	SetGimmickMapHitEnable_(g_gmk_jail_door_east_4, false);
	SetMotion_(g_gmk_jail_door_east_4, MOT_GIMMICK_2, BLEND_N);
	local g_gmk_jail_door_east_5 = ArrangePointGimmick_("o_S02_02", id_jail_door, "gmk_jail_door_est_5");
	SetGimmickMapHitEnable_(g_gmk_jail_door_east_5, false);
	SetMotion_(g_gmk_jail_door_east_5, MOT_GIMMICK_2, BLEND_N);
	local g_gmk_jail_door_east_6 = ArrangePointGimmick_("o_S02_02", id_jail_door, "gmk_jail_door_est_6");
	SetGimmickMapHitEnable_(g_gmk_jail_door_east_6, false);
	SetMotion_(g_gmk_jail_door_east_6, MOT_GIMMICK_2, BLEND_N);
	// ��
	local g_gmk_jail_door_west_1 = ArrangePointGimmick_("o_S02_02", id_jail_door, "gmk_jail_door_west_1");
	SetGimmickMapHitEnable_(g_gmk_jail_door_west_1, false);
	SetMotion_(g_gmk_jail_door_west_1, MOT_GIMMICK_2, BLEND_N);
	local g_gmk_jail_door_west_2 = ArrangePointGimmick_("o_S02_02", id_jail_door, "gmk_jail_door_west_2");
	SetGimmickMapHitEnable_(g_gmk_jail_door_west_2, false);
	SetMotion_(g_gmk_jail_door_west_2, MOT_GIMMICK_2, BLEND_N);
	local g_gmk_jail_door_west_3 = ArrangePointGimmick_("o_S02_02", id_jail_door, "gmk_jail_door_west_3");
	SetGimmickMapHitEnable_(g_gmk_jail_door_west_3, false);
	SetMotion_(g_gmk_jail_door_west_3, MOT_GIMMICK_2, BLEND_N);
	local g_gmk_jail_door_west_4 = ArrangePointGimmick_("o_S02_02", id_jail_door, "gmk_jail_door_west_4");
	SetGimmickMapHitEnable_(g_gmk_jail_door_west_4, false);
	SetMotion_(g_gmk_jail_door_west_4, MOT_GIMMICK_2, BLEND_N);
	local g_gmk_jail_door_west_5 = ArrangePointGimmick_("o_S02_02", id_jail_door, "gmk_jail_door_west_5");
	SetGimmickMapHitEnable_(g_gmk_jail_door_west_5, false);
	SetMotion_(g_gmk_jail_door_west_5, MOT_GIMMICK_2, BLEND_N);
	local g_gmk_jail_door_west_6 = ArrangePointGimmick_("o_S02_02", id_jail_door, "gmk_jail_door_west_6");
	SetGimmickMapHitEnable_(g_gmk_jail_door_west_6, false);
	SetMotion_(g_gmk_jail_door_west_6, MOT_GIMMICK_2, BLEND_N);

	// < ���Y�^ >
	// �����Ɋւ��Ă� alienbrain://ALIEN-OM2/HARUKA:598/tose_works/Blender/Field/S/S00_00_gimmick.blend
	// �Ŕz�u���Ă���̂ŁA���Ɏw�����Ȃ�����̓C�x���g�X�N���v�g�ł͔z�u���Ȃ��悤�ɂ��ĉ������B�i�������ׂ��������܂��B�j

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

