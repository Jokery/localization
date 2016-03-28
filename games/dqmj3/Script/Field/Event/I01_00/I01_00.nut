//===================== I01_00�|�[���p�[�N ====================


//------------------------------------------------
//		�퓬�I����
//------------------------------------------------
function AfterBattle()
{
	local main_num			= GetNumFlg_("NUM_SCENARIO_MAIN");							// Num0
	local ice_event_num		= GetNumFlg_("NUM_SCENARIO_SUB_ICE");						// Num5

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
	local main_num			 = GetNumFlg_("NUM_SCENARIO_MAIN");							// Num0
	local ice_event_num		 = GetNumFlg_("NUM_SCENARIO_SUB_ICE");						// Num5
	
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
	// �}�b�v���B�t���O
	SetEventFlg_("BFG_ARRIVE_AT_I01", true);											// Bit_91 ���B�t���O �|�[���p�[�N

	local main_num			= GetNumFlg_("NUM_SCENARIO_MAIN");							// Num0
	local ice_event_num		= GetNumFlg_("NUM_SCENARIO_SUB_ICE");						// Num5

	local bit_ruler_est		= GetNumFlg_("BFG_RULER_ADD_012");						// Bit_212 ���[���ǉ� ����

	// �����[���|�C���g(����)
	SetEventFlg_("BFG_RULER_ADD_011", true);											// Bit_211 ���[���ǉ� ����

	// �����[���֎~
	if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){									// Num0 = 4
		if(ice_event_num == GetFlagID_("CONST_SS_IF_GET_OUT_OF_THE_HOUSE")				// Num5 = 4
		||ice_event_num == GetFlagID_("CONST_SS_IF_FIRST_ATTACK")){						// Num5 = 16
			// ���[�����֎~����t���O��ݒ�
			SetEventFlg_("BFG_PLAYERABILITY_RULER_PROHIBIT", true);						// Bit_440 ���[���֎~
		}
	}

	// ����X�ǂ��Ȃ��Ȃ����t���O
	if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){									// Num0 = 4
		if(ice_event_num < GetFlagID_("CONST_SS_IF_CLEAR_ICE_FIELD")){					// Num5 < 36
			//
		} else {
			SetEventFlg_("BFG_REMOVE_ICE_WALL", true);									// Bit_1157 ��X�ǂ��Ȃ��Ȃ���
		}
	} else {
		SetEventFlg_("BFG_REMOVE_ICE_WALL", true);										// Bit_1157 ��X�ǂ��Ȃ��Ȃ���
	}

	//----------
	// ��NPC�z�u
	//----------
	// ID������
	g_npc_item		 <- C_NONE_ID;
	g_npc_inn		 <- C_NONE_ID;
	g_npc_west1 	 <- C_NONE_ID;
	g_npc_west2		 <- C_NONE_ID;
	g_npc_west3		 <- C_NONE_ID;
	g_npc_west4		 <- C_NONE_ID;
	g_todo_child1	 <- C_NONE_ID;
	g_todo_child2	 <- C_NONE_ID;
	g_todo_child3	 <- C_NONE_ID;
	g_todo			 <- C_NONE_ID;
	g_npc_est1		 <- C_NONE_ID;
	g_npc_est2		 <- C_NONE_ID;
	g_npc_est3		 <- C_NONE_ID;
	g_npc_est4		 <- C_NONE_ID;
	g_silver		 <- C_NONE_ID;
	g_npc_gardman	 <- C_NONE_ID;
	g_yetas		 	 <- C_NONE_ID;
	g_npc_est_sibou	 <- C_NONE_ID;

	// ���\�[�X�ǂݍ���
	local id_silver			= ReadNpc_("m077_00");	// �V���o�[���f��
	local id_todo			= ReadNpc_("n039");		// �g�[�h�[���f��
	local id_yetas			= ReadNpc_("n041");		// �C�G�^�X���f��
	local id_meijimomonja	= ReadNpc_("m041_02");	// ���C�W�����񂶂�
	local id_okiduti		= ReadNpc_("m035_00");	// �������Â�
	local id_todo_child		= ReadNpc_("m035_00");	// �g�[�h�[�q�����f��
	local id_darkmmn		= ReadNpc_("m083_04");	// �_�[�N���[����
	local id_arakurechappy	= ReadNpc_("m045_01");	// ���炭��`���b�s�[
	
	// �����
	g_npc_item        = ArrangePointNpc_(id_darkmmn, "npc_item");
	SetSearchableAngle_(g_npc_item, SEARCHABLE_ANGLE_MINIMUM);	// ����30�x���� �b�������\
	SetReactorMsg_(g_npc_item, "NPC_WEST_B_REC");
	SetTalkCameraType_(g_npc_item, TALK_CAMERA_UP);				//�J�����̐ݒ�
	SetTalkCameraEyeOffset_(g_npc_item, -2.0, -10.0);			//�J�����̈ʒu�̒���
	SetScaleSilhouette(g_npc_item, SCALE.S ,SILHOUETTE_WIDTH.S);

	// ���h��
	g_npc_inn         = ArrangePointNpc_(id_okiduti, "npc_inn");
	SetSearchableAngle_(g_npc_inn, SEARCHABLE_ANGLE_MINIMUM);	// ����30�x���� �b�������\
	SetReactorMsg_(g_npc_inn, "NPC_WEST_A_REC");
	SetTalkCameraType_(g_npc_inn,TALK_CAMERA_UP);				//�J�����̐ݒ�
	SetTalkCameraEyeOffset_(g_npc_inn, -2.0, -10.0);			//�J�����̈ʒu�̒���
	SetScaleSilhouette(g_npc_inn, SCALE.N ,SILHOUETTE_WIDTH.N);

	// �����|�[���p�[�N�Z���`
	if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){									// Num0 = 4
		if(ice_event_num >= GetFlagID_("CONST_SS_IF_FIRST_ATTACK")						// Num5 >= 16
		&& ice_event_num <= GetFlagID_("CONST_SS_IF_MOVE_THE_WORLD_4"))					// Num5 <= 35
		{
			g_npc_west1= ArrangePointNpc_(id_okiduti, "npc_west_a_2");
			SetReactorMsg_(g_npc_west1, "NPC_WEST_A_REC");
			SetScaleSilhouette(g_npc_west1, SCALE.N ,SILHOUETTE_WIDTH.N);
		}
		else if(ice_event_num == GetFlagID_("CONST_SS_IF_GO_TO_SEE_TODO")){				// Num5 = 3
			g_npc_west1= ArrangePointNpc_(id_okiduti, "npc_west_a_3");
			SetReactorMsg_(g_npc_west1, "NPC_WEST_A_REC");
			SetScaleSilhouette(g_npc_west1, SCALE.N ,SILHOUETTE_WIDTH.N);
		}
		else{
			g_npc_west1= ArrangePointNpc_(id_okiduti, "npc_west_a");
			SetReactorMsg_(g_npc_west1, "NPC_WEST_A_REC");
			SetScaleSilhouette(g_npc_west1, SCALE.N ,SILHOUETTE_WIDTH.N);
		}
	}
	else{
		g_npc_west1= ArrangePointNpc_(id_okiduti, "npc_west_a");
		SetReactorMsg_(g_npc_west1, "NPC_WEST_A_REC");
		SetScaleSilhouette(g_npc_west1, SCALE.N ,SILHOUETTE_WIDTH.N);
	}

	// �����|�[���p�[�N�Z���a-�b
	if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){									// Num0 = 4
		if(ice_event_num >= GetFlagID_("CONST_SS_IF_FIRST_ATTACK")						// Num5 >= 16
		&& ice_event_num <= GetFlagID_("CONST_SS_IF_MOVE_THE_WORLD_4"))					// Num5 <= 35
		{
			g_npc_west2   = ArrangePointNpc_(id_okiduti, "npc_west_b_2");
			SetReactorMsg_(g_npc_west2, "NPC_WEST_A_REC");
			SetScaleSilhouette(g_npc_west2, SCALE.N ,SILHOUETTE_WIDTH.N);

			g_npc_west3   = ArrangePointNpc_(id_okiduti, "npc_west_c_2");
			SetReactorMsg_(g_npc_west3, "NPC_WEST_A_REC");
			SetScaleSilhouette(g_npc_west3, SCALE.N ,SILHOUETTE_WIDTH.N);
		}
		else{
			g_npc_west2   = ArrangePointNpc_(id_okiduti, "npc_west_b");
			SetReactorMsg_(g_npc_west2, "NPC_WEST_A_REC");
			SetSearchableAngle_(g_npc_west2, SEARCHABLE_ANGLE_MINIMUM);
			SetScaleSilhouette(g_npc_west2, SCALE.N ,SILHOUETTE_WIDTH.N);

			g_npc_west3   = ArrangePointNpc_(id_okiduti, "npc_west_c");
			SetReactorMsg_(g_npc_west3, "NPC_WEST_A_REC");
			SetSearchableAngle_(g_npc_west3, SEARCHABLE_ANGLE_MINIMUM);
			SetScaleSilhouette(g_npc_west3, SCALE.N ,SILHOUETTE_WIDTH.N);
		}
	}
	else{
		g_npc_west2   = ArrangePointNpc_(id_okiduti, "npc_west_b");
		SetReactorMsg_(g_npc_west2, "NPC_WEST_A_REC");
		SetSearchableAngle_(g_npc_west2, SEARCHABLE_ANGLE_MINIMUM);
		SetScaleSilhouette(g_npc_west2, SCALE.N ,SILHOUETTE_WIDTH.N);

		g_npc_west3   = ArrangePointNpc_(id_okiduti, "npc_west_c");
		SetReactorMsg_(g_npc_west3, "NPC_WEST_A_REC");
		SetSearchableAngle_(g_npc_west3, SEARCHABLE_ANGLE_MINIMUM);
		SetScaleSilhouette(g_npc_west3, SCALE.N ,SILHOUETTE_WIDTH.N);
	}

	// �����|�[���p�[�N�Z���c
	if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){									// Num0 = 4
		if(ice_event_num == GetFlagID_("CONST_SS_IF_GO_TO_SEE_TODO")){					// Num5 = 3
			g_npc_west4   = ArrangePointNpc_(id_darkmmn, "npc_west_d_2");
			SetReactorMsg_(g_npc_west4, "NPC_WEST_B_REC");
			SetScaleSilhouette(g_npc_west4, SCALE.S ,SILHOUETTE_WIDTH.S);
		}
		else {
			g_npc_west4   = ArrangePointNpc_(id_darkmmn, "npc_west_d");
			SetReactorMsg_(g_npc_west4, "NPC_WEST_B_REC");
			SetScaleSilhouette(g_npc_west4, SCALE.S ,SILHOUETTE_WIDTH.S);
		}
	}
	else {
		g_npc_west4   = ArrangePointNpc_(id_darkmmn, "npc_west_d");
		SetReactorMsg_(g_npc_west4, "NPC_WEST_B_REC");
		SetScaleSilhouette(g_npc_west4, SCALE.S ,SILHOUETTE_WIDTH.S);
	}
	// ���g�[�h�[�q���`
	if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){									// Num0 = 4
		if(ice_event_num == GetFlagID_("CONST_SS_IF_GO_TO_SEE_TODO"))					// Num5 = 3
		{
			g_todo_child1= ArrangePointNpc_(id_todo_child, "npc_todo_child_a_3");
			SetReactorMsg_(g_todo_child1, "NPC_TODO_CHILD_REC");
			SetScaleSilhouette(g_todo_child1, SCALE.N ,SILHOUETTE_WIDTH.N);
		}
		else if(ice_event_num >= GetFlagID_("CONST_SS_IF_FIRST_ATTACK")					// Num5 >= 16
		&& ice_event_num <= GetFlagID_("CONST_SS_IF_MOVE_THE_WORLD_4"))					// Num5 <= 35
		{
			g_todo_child1= ArrangePointNpc_(id_todo_child, "npc_todo_child_a_2");
			SetReactorMsg_(g_todo_child1, "NPC_TODO_CHILD_REC");
			SetScaleSilhouette(g_todo_child1, SCALE.N ,SILHOUETTE_WIDTH.N);
			if(ice_event_num < GetFlagID_("CONST_SS_IF_GO_TO_THE_ICE_RUINS")){			// Num5 < 20
				SetTalkTurn_(g_todo_child1, false);	// �b�������Ă��U������Ȃ�
			}
		}
		else{
			g_todo_child1= ArrangePointNpc_(id_todo_child, "npc_todo_child_a");
			SetReactorMsg_(g_todo_child1, "NPC_TODO_CHILD_REC");
			SetScaleSilhouette(g_todo_child1, SCALE.N ,SILHOUETTE_WIDTH.N);
		}
	}
	else{
		g_todo_child1= ArrangePointNpc_(id_todo_child, "npc_todo_child_a");
		SetReactorMsg_(g_todo_child1, "NPC_TODO_CHILD_REC");
		SetScaleSilhouette(g_todo_child1, SCALE.N ,SILHOUETTE_WIDTH.N);
	}

	// ���g�[�h�[�q���a-�b
	if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){									// Num0 = 4
		if(ice_event_num >= GetFlagID_("CONST_SS_IF_FIRST_ATTACK")						// Num5 >= 16
		&& ice_event_num <= GetFlagID_("CONST_SS_IF_MOVE_THE_WORLD_4"))					// Num5 <= 35
		{
			g_todo_child2= ArrangePointNpc_(id_todo_child, "npc_todo_child_b_2");//���|�[���p�[�N�Z�l�ƑΛ���
			SetReactorMsg_(g_todo_child2, "NPC_TODO_CHILD_REC");
			SetScaleSilhouette(g_todo_child2, SCALE.N ,SILHOUETTE_WIDTH.N);

			g_todo_child3= ArrangePointNpc_(id_darkmmn, "npc_todo_child_c_2"); //���|�[���p�[�N�Z�l�ƑΛ���
			SetReactorMsg_(g_todo_child3, "NPC_TODO_CHILD_REC");
			SetScaleSilhouette(g_todo_child3, SCALE.S ,SILHOUETTE_WIDTH.S);

			if(ice_event_num < GetFlagID_("CONST_SS_IF_GO_TO_THE_ICE_RUINS")){				// Num5 < 20
				SetTalkTurn_(g_todo_child2, false);	// �b�������Ă��U������Ȃ�
				SetTalkTurn_(g_todo_child3, false);	// �b�������Ă��U������Ȃ�
			}
		}
		else{
			g_todo_child2= ArrangePointNpc_(id_todo_child, "npc_todo_child_b");
			SetReactorMsg_(g_todo_child2, "NPC_TODO_CHILD_REC");
			SetScaleSilhouette(g_todo_child2, SCALE.N ,SILHOUETTE_WIDTH.N);

			g_todo_child3= ArrangePointNpc_(id_darkmmn, "npc_todo_child_c");
			SetReactorMsg_(g_todo_child3, "NPC_TODO_CHILD_REC");
			SetScaleSilhouette(g_todo_child3, SCALE.S ,SILHOUETTE_WIDTH.S);
		}
	}
	else{
		g_todo_child2= ArrangePointNpc_(id_todo_child, "npc_todo_child_b");
		SetReactorMsg_(g_todo_child2, "NPC_TODO_CHILD_REC");
		SetScaleSilhouette(g_todo_child2, SCALE.N ,SILHOUETTE_WIDTH.N);

		g_todo_child3= ArrangePointNpc_(id_darkmmn, "npc_todo_child_c");
		SetReactorMsg_(g_todo_child3, "NPC_TODO_CHILD_REC");
		SetScaleSilhouette(g_todo_child3, SCALE.S ,SILHOUETTE_WIDTH.S);
	}

	// �����|�[���p�[�N�Z�l�`�E�a�E�c�E�����
	if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){									// Num0 = 4
		if(ice_event_num < GetFlagID_("CONST_SS_IF_FIRST_ATTACK"))						// Num5 < 16
		{
			g_npc_est1    = ArrangePointNpc_(id_arakurechappy, "npc_est_a");
			SetReactorMsg_(g_npc_est1, "NPC_EST_A_REC");
			SetScaleSilhouette(g_npc_est1, SCALE.N ,SILHOUETTE_WIDTH.N);

			g_npc_est2    = ArrangePointNpc_(id_meijimomonja, "npc_est_b");
			SetReactorMsg_(g_npc_est2, "NPC_EST_B_REC");
			SetScaleSilhouette(g_npc_est2, SCALE.N ,SILHOUETTE_WIDTH.N);

			if(ice_event_num < GetFlagID_("CONST_SS_IF_GO_BACK_WEST_ICE_PARK"))			// Num5 < 15
			{
				g_npc_est4    = ArrangePointNpc_(id_meijimomonja, "npc_est_d_4");
				SetReactorMsg_(g_npc_est4, "NPC_EST_B_REC");
				SetScaleSilhouette(g_npc_est4, SCALE.N ,SILHOUETTE_WIDTH.N);
				
				g_npc_est_sibou    = ArrangePointNpc_(id_meijimomonja, "npc_est_sibou");
				SetReactorMsg_(g_npc_est_sibou, "NPC_EST_B_REC");
				SetScaleSilhouette(g_npc_est_sibou, SCALE.N ,SILHOUETTE_WIDTH.N);
			}
			else {
				g_npc_est4    = ArrangePointNpc_(id_meijimomonja, "npc_est_d");
				SetReactorMsg_(g_npc_est4, "NPC_EST_B_REC");
				SetScaleSilhouette(g_npc_est4, SCALE.N ,SILHOUETTE_WIDTH.N);
			}
		}
		else if(ice_event_num < GetFlagID_("CONST_SS_IF_CLEAR_ICE_FIELD"))					// Num5 < 36
		{
			g_npc_est1    = ArrangePointNpc_(id_arakurechappy, "npc_est_a_2"); //���|�[���p�[�N�Z�l�ƑΛ���
			SetReactorMsg_(g_npc_est1, "NPC_EST_A_REC");
			SetScaleSilhouette(g_npc_est1, SCALE.N ,SILHOUETTE_WIDTH.N);
			if(ice_event_num < GetFlagID_("CONST_SS_IF_GO_TO_THE_ICE_RUINS")){				// Num5 < 20
				SetTalkTurn_(g_npc_est1, false);	// �b�������Ă��U������Ȃ�
			}

			g_npc_est2    = ArrangePointNpc_(id_meijimomonja, "npc_est_b_2"); //���|�[���p�[�N�Z�l�ƑΛ���
			SetReactorMsg_(g_npc_est2, "NPC_EST_B_REC");
			SetScaleSilhouette(g_npc_est2, SCALE.N ,SILHOUETTE_WIDTH.N);
			if(ice_event_num < GetFlagID_("CONST_SS_IF_GO_TO_THE_ICE_RUINS")){				// Num5 < 20
				SetTalkTurn_(g_npc_est2, false);	// �b�������Ă��U������Ȃ�
			}

			g_npc_est4    = ArrangePointNpc_(id_meijimomonja, "npc_est_d_2"); //���|�[���p�[�N�Z�l�ƑΛ���
			SetReactorMsg_(g_npc_est4, "NPC_EST_B_REC");
			SetScaleSilhouette(g_npc_est4, SCALE.N ,SILHOUETTE_WIDTH.N);
			if(ice_event_num < GetFlagID_("CONST_SS_IF_GO_TO_THE_ICE_RUINS")){				// Num5 < 20
				SetTalkTurn_(g_npc_est4, false);	// �b�������Ă��U������Ȃ�
			}
		}
		else{
			g_npc_est1    = ArrangePointNpc_(id_arakurechappy, "npc_est_a");
			SetReactorMsg_(g_npc_est1, "NPC_EST_A_REC");
			SetScaleSilhouette(g_npc_est1, SCALE.N ,SILHOUETTE_WIDTH.N);

			g_npc_est2    = ArrangePointNpc_(id_meijimomonja, "npc_est_b");
			SetReactorMsg_(g_npc_est2, "NPC_EST_B_REC");
			SetScaleSilhouette(g_npc_est2, SCALE.N ,SILHOUETTE_WIDTH.N);

			g_npc_est4    = ArrangePointNpc_(id_meijimomonja, "npc_est_d_3");
			SetReactorMsg_(g_npc_est4, "NPC_EST_B_REC");
			SetScaleSilhouette(g_npc_est4, SCALE.N ,SILHOUETTE_WIDTH.N);
		}
	}
	else{
		g_npc_est1    = ArrangePointNpc_(id_arakurechappy, "npc_est_a");
		SetReactorMsg_(g_npc_est1, "NPC_EST_A_REC");
		SetScaleSilhouette(g_npc_est1, SCALE.N ,SILHOUETTE_WIDTH.N);

		g_npc_est2    = ArrangePointNpc_(id_meijimomonja, "npc_est_b");
		SetReactorMsg_(g_npc_est2, "NPC_EST_B_REC");
		SetScaleSilhouette(g_npc_est2, SCALE.N ,SILHOUETTE_WIDTH.N);

		g_npc_est4    = ArrangePointNpc_(id_meijimomonja, "npc_est_d_3");
		SetReactorMsg_(g_npc_est4, "NPC_EST_B_REC");
		SetScaleSilhouette(g_npc_est4, SCALE.N ,SILHOUETTE_WIDTH.N);
	}

	// �����|�[���p�[�N�Z�l�b
	g_npc_est3    = ArrangePointNpc_(id_meijimomonja, "npc_est_c");
	SetReactorMsg_(g_npc_est3, "NPC_EST_B_REC");
	SetSearchableAngle_(g_npc_est3, SEARCHABLE_ANGLE_MINIMUM);
	SetScaleSilhouette(g_npc_est3, SCALE.N ,SILHOUETTE_WIDTH.N);

	// ���쉀���
	if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){									// Num0 = 4
		if(ice_event_num <= GetFlagID_("CONST_SS_IF_GO_BACK_WEST_ICE_PARK"))			// Num5 <= 15
		{
			g_npc_gardman     = ArrangePointNpc_(id_arakurechappy, "npc_monban");
			SetReactorMsg_(g_npc_gardman, "NPC_EST_A_REC");
			SetScaleSilhouette(g_npc_gardman, SCALE.N ,SILHOUETTE_WIDTH.N);
		}
	}

	// ���g�[�h�[
	if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){									// Num0 = 4
		if(ice_event_num <=  GetFlagID_("CONST_SS_IF_GO_BACK_WEST_ICE_PARK"))			// Num5 <= 15
		{
			g_todo        = ArrangePointNpc_(id_todo,  "npc_todo");//�g�[�h�[
			SetReactorMsg_(g_todo, "NPC_TODO_REC");
			SetTalkCameraType_(g_todo,TALK_CAMERA_UP);//�J�����̐ݒ�
			SetScaleSilhouette(g_todo , SCALE.TODO ,SILHOUETTE_WIDTH.TODO);

			if(ice_event_num == GetFlagID_("CONST_SS_IF_GET_OUT_OF_THE_HOUSE")){		// Num5 = 4
				local todo_arm_folde_L = ReadMotion_(g_todo, "n039_arm_folde01_L");		// �ҋ@���r�g��
				SetMotion_(g_todo, todo_arm_folde_L, BLEND_N);
				SetTalkTurn_(g_todo, false);//�b�������Ă��U������Ȃ�
			}
		}
		else if(ice_event_num == GetFlagID_("CONST_SS_IF_FIRST_ATTACK"))				// Num5 = 16
		{
			g_todo        = ArrangePointNpc_(id_todo,  "npc_todo_2");
			SetReactorMsg_(g_todo, "NPC_TODO_REC");
			SetTalkEnable_(g_todo, false);		// ��b�ł��Ȃ�
			SetScaleSilhouette(g_todo, SCALE.TODO ,SILHOUETTE_WIDTH.TODO);
		}
		else if(ice_event_num <= GetFlagID_("CONST_SS_IF_EXAMINE_THE_ICE_WALL"))		// Num5 <= 18
		{
			g_todo        = ArrangePointNpc_(id_todo,  "npc_todo_2_2");
			SetDirToPoint_(g_todo, "npc_yetas");
			SetReactorMsg_(g_todo, "NPC_TODO_REC");
			SetTalkEnable_(g_todo, false);		// ��b�ł��Ȃ�
			SetTalkTurn_(g_todo, false);		// �b�������Ă��U������Ȃ�(���|�[���p�[�N�Z�l�ƑΛ���)
			local todo_sword = ReadMotion_(g_todo, "n039_push");		// ����������
			SetMotion_(g_todo, todo_sword, BLEND_N);
			SetScaleSilhouette(g_todo, SCALE.TODO ,SILHOUETTE_WIDTH.TODO);
		}
		else if(ice_event_num <= GetFlagID_("CONST_SS_IF_MOVE_THE_WORLD_4"))			// Num5 <= 35
		{
			g_todo        = ArrangePointNpc_(id_todo,  "npc_todo_3");
			SetMeshVisible_(g_todo, "Model_2", false);	// �I�T�̏�
			SetReactorMsg_(g_todo, "NPC_TODO_REC");
			SetTalkCameraType_(g_todo,TALK_CAMERA_UP);	//�J�����̐ݒ�
			SetScaleSilhouette(g_todo, SCALE.TODO ,SILHOUETTE_WIDTH.TODO);
		}
	}
	else{
		g_todo        = ArrangePointNpc_(id_todo,  "npc_todo");
		SetMeshVisible_(g_todo, "Model_2", false);	// �I�T�̏�
		SetReactorMsg_(g_todo, "NPC_TODO_REC");
		SetTalkCameraType_(g_todo,TALK_CAMERA_UP);	//�J�����̐ݒ�
		SetScaleSilhouette(g_todo, SCALE.TODO ,SILHOUETTE_WIDTH.TODO);
	}

	// ���V���o�[
	if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){									// Num0 = 4
		if(ice_event_num >= GetFlagID_("CONST_SS_IF_CLEAR_ICE_FIELD"))					// Num5 >= 36
		{
			// �z�u���Ȃ�
		}
		else if(ice_event_num >= GetFlagID_("CONST_SS_IF_GO_TO_THE_ICE_RUINS"))			// Num5 >= 20
		{
			g_silver      = ArrangePointNpc_(id_silver,  "npc_silver");
			SetReactorMsg_(g_silver, "NPC_SILVER_REC");
			SetTalkCameraType_(g_silver,TALK_CAMERA_UP);//�J�����̐ݒ�
			SetScaleSilhouette(g_silver, SCALE.N ,SILHOUETTE_WIDTH.N);
		}
	}
	else{
		g_silver      = ArrangePointNpc_(id_silver,  "npc_silver_or_yetas");
		SetReactorMsg_(g_silver, "NPC_SILVER_REC");
		SetTalkCameraType_(g_silver,TALK_CAMERA_UP);//�J�����̐ݒ�
		SetScaleSilhouette(g_silver, SCALE.N ,SILHOUETTE_WIDTH.N);
	}

	// ���C�G�^�X
	if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){									// Num0 = 4
		if(ice_event_num < GetFlagID_("CONST_SS_IF_FIRST_ATTACK"))						// Num5 < 16
		{
			g_yetas       = ArrangePointNpc_(id_yetas, "npc_silver_or_yetas");
			SetReactorMsg_(g_yetas, "NPC_YETAS_REC");
			SetScaleSilhouette(g_yetas, SCALE.N ,SILHOUETTE_WIDTH.N);
		}
		else if(ice_event_num == GetFlagID_("CONST_SS_IF_FIRST_ATTACK")){				// Num5 = 16
			g_yetas       = ArrangePointNpc_(id_yetas, "npc_yetas");
			SetReactorMsg_(g_yetas, "NPC_YETAS_REC");
			SetScaleSilhouette(g_yetas, SCALE.N ,SILHOUETTE_WIDTH.N);
			SetTalkEnable_(g_yetas, false);		// ��b�ł��Ȃ�
		}
		else if(ice_event_num < GetFlagID_("CONST_SS_IF_GO_TO_THE_ICE_RUINS")){			// Num5 < 20
			g_yetas      = ArrangePointNpc_(id_yetas, "npc_yetas");
			local retreat = ReadMotion_(g_yetas, "n041_push");	// ��풓���[�V�����ǂݍ���
			SetMotion_(g_yetas, retreat, BLEND_N);
			SetDirToPoint_(g_yetas, "npc_todo_2_2");
			SetReactorMsg_(g_yetas, "NPC_YETAS_REC");
			SetScaleSilhouette(g_yetas, SCALE.N ,SILHOUETTE_WIDTH.N);
			SetTalkTurn_(g_yetas, false);		// �b�������Ă��U������Ȃ�(���|�[���p�[�N�Z�l�ƑΛ���)
			SetTalkEnable_(g_yetas, false);		// ��b�ł��Ȃ�
		}
	}

	//-----------
	// ���n���z�u
	//-----------
	// ID������
	g_mine01 		<- C_NONE_ID;
	g_mine02 		<- C_NONE_ID;
	g_mine03 		<- C_NONE_ID;
	g_mine_exit 	<- C_NONE_ID;
	g_mine_exit02 	<- C_NONE_ID;
	g_mine_exit03 	<- C_NONE_ID;
	g_mine04	 	<- C_NONE_ID;
	g_mine_est_park	<- C_NONE_ID;

	if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){									// Num0 = 4
		// ���g�[�h�[�̕����ɓ��������̃f���p�n��
		if(ice_event_num == GetFlagID_("CONST_SS_IF_GO_TO_SEE_TODO")){					// Num5 = 3
			g_mine01 = SetPointBoxEventMine_("mine01", false);
		}
		// ���g�[�h�[�̕�������o�����̃f���p�n��
		if(ice_event_num == GetFlagID_("CONST_SS_IF_GET_OUT_OF_THE_HOUSE")){			// Num5 = 4
			g_mine02 = SetPointBoxEventMine_("mine02", false);
		}
		// ���C�G�^�X�̕����ɓ��������̃f���p�n��
		if(ice_event_num == GetFlagID_("CONST_SS_IF_GO_TO_THE_EAST_ICE_PARK")){			// Num5 = 14
			g_mine03 = SetPointBoxEventMine_("mine03", false);
		}
		// �����|�[���p�[�N�Z�l�c���C�G�^�X�̉��~�̓������ǂ��n��
		if(ice_event_num >= GetFlagID_("CONST_SS_IF_GO_BACK_WEST_ICE_PARK")				// Num5 >= 15
		&& ice_event_num <= GetFlagID_("CONST_SS_IF_FIRST_ATTACK")){					// Num5 <= 16
			g_mine_exit = SetPointBoxEventMine_("Mine_Exit", false);
		}
		// ���쉀��Ԃ��������ǂ��n��
		if(ice_event_num >= GetFlagID_("CONST_SS_IF_GO_TO_THE_EAST_ICE_PARK")			// Num5 >= 14
		&& ice_event_num <= GetFlagID_("CONST_SS_IF_FIRST_ATTACK")){					// Num5 <= 16
			g_mine_exit02 = SetPointBoxEventMine_("Mine_Exit_02", false);
		}
		// �����|�[���p�[�N�Z�l�ɋ߂Â������f��[�g�[�h�[�̗��݇A]���Đ�����n��
		if(ice_event_num == GetFlagID_("CONST_SS_IF_FIRST_ATTACK")){					// Num5 = 16
			g_mine04 = SetPointBoxEventMine_("mine04", false);
		}
		// ���C�G�^�X��}����g�[�h�[�ɋ߂Â��Ɖ����߂����n��
		if(ice_event_num > GetFlagID_("CONST_SS_IF_FIRST_ATTACK")						// Num5 > 16
		&& ice_event_num < GetFlagID_("CONST_SS_IF_GO_TO_THE_ICE_RUINS")){				// Num5 < 20
			g_mine_exit03 = SetPointBoxEventMine_("Mine_Exit_03", false);
		}
		// �� ���[���̂Ƃѐ�ǉ��n���i�����j 
		if(!bit_ruler_est){						// Bit_212 ���[���ǉ� ����
			g_mine_est_park = SetPointBoxEventMine_("mine_est_park", false);
		}
	}

	//---------------
	// ���M�~�b�N�z�u
	//---------------
	// ����X��
	if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){									// Num0 = 4
		if(ice_event_num < GetFlagID_("CONST_SS_IF_CLEAR_ICE_FIELD")){					// Num5 < 36
			local id_icewall	 = ReadGimmick_("o_I01_00");
			local icewall		 = ArrangePointGimmick_("o_I01_00", id_icewall, "gmk_icewall");
		}
	}
	
	//------------------
	// �����A�N�^�[�|�C���g�z�u
	//------------------
	// ����X�� ���|��
	if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){									// Num0 = 4
		if(ice_event_num < GetFlagID_("CONST_SS_IF_CLEAR_ICE_FIELD")){					// Num5 < 36
			local reactorPoint01 = ArrangeMsgReactorPoint("recpoint_01_daihyoheki01", GetFlagID_("BFG_REACTER_POINT_056")// Bit_1555
				, SHORT_DIST, "REC_POINT_ICE_01", "REC_POINT_ICE_01_2");

			local reactorPoint01_2 = ArrangeMsgReactorPoint("recpoint_01_daihyoheki02", GetFlagID_("BFG_REACTER_POINT_056")// Bit_1555
				, SHORT_DIST, "REC_POINT_ICE_01", "REC_POINT_ICE_01_2");
		}
	}

	// ���ږ��D ���|��
	local reactorPoint02 = ArrangeMsgReactorPoint("recpoint_02_iminsen01", GetFlagID_("BFG_REACTER_POINT_057")// Bit_1556
		, SHORT_DIST, "REC_POINT_ICE_02", "REC_POINT_ICE_02_2");

	local reactorPoint02_2 = ArrangeMsgReactorPoint("recpoint_02_iminsen02", GetFlagID_("BFG_REACTER_POINT_057")// Bit_1556
		, SHORT_DIST, "REC_POINT_ICE_02", "REC_POINT_ICE_02_2");

	// ���X�̖�
	local reactorPoint03 = ArrangeMsgReactorPoint("recpoint_03_ki", GetFlagID_("BFG_REACTER_POINT_058")// Bit_1557
		, SHORT_DIST, "REC_POINT_ICE_03", "REC_POINT_ICE_03_2");

	// ���������P�|�T
	local reactorPoint04 = ArrangeMsgReactorPoint("recpoint_04_tyozobako01", GetFlagID_("BFG_REACTER_POINT_059")// Bit_1558
		, SHORT_DIST, "REC_POINT_ICE_04", "REC_POINT_ICE_04_2");

	local reactorPoint04_2 = ArrangeMsgReactorPoint("recpoint_04_tyozobako02", GetFlagID_("BFG_REACTER_POINT_059")// Bit_1558
		, SHORT_DIST, "REC_POINT_ICE_04", "REC_POINT_ICE_04_2");

	local reactorPoint04_3 = ArrangeMsgReactorPoint("recpoint_04_tyozobako03", GetFlagID_("BFG_REACTER_POINT_059")// Bit_1558
		, SHORT_DIST, "REC_POINT_ICE_04", "REC_POINT_ICE_04_2");

	local reactorPoint04_4 = ArrangeMsgReactorPoint("recpoint_04_tyozobako04", GetFlagID_("BFG_REACTER_POINT_059")// Bit_1558
		, SHORT_DIST, "REC_POINT_ICE_04", "REC_POINT_ICE_04_2");

	local reactorPoint04_5 = ArrangeMsgReactorPoint("recpoint_04_tyozobako05", GetFlagID_("BFG_REACTER_POINT_059")// Bit_1558
		, SHORT_DIST, "REC_POINT_ICE_04", "REC_POINT_ICE_04_2");

	// Demo313 �ȍ~ Demo317 �܂Ńt�B�[���hBGM��ύX
	if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){
		if(ice_event_num == GetFlagID_("CONST_SS_IF_FIRST_ATTACK")){
			SetEventFlg_("BFG_I01_00_EVENT_BGM021_PLAY", true);
		}
		else if(ice_event_num == GetFlagID_("CONST_SS_IF_GO_TO_THE_ICE_RUINS")){
			SetEventFlg_("BFG_I01_00_EVENT_BGM021_PLAY", false);
		}
	}

	EventEnd_();
}

	
//------------------------------------------------
//		�t�B�[���h����J�n
//------------------------------------------------
function EventStartOperate()
{
	local main_num			= GetNumFlg_("NUM_SCENARIO_MAIN");							// Num0
	local ice_event_num		= GetNumFlg_("NUM_SCENARIO_SUB_ICE");						// Num5

	//-------------
	// ���f���̍Đ�
	//-------------
	if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){									// Num0 = 4
		//���͂��߂ă|�[���p�[�N�ɓ��������̃f��
		if(ice_event_num == GetFlagID_("CONST_SS_IF_GO_TO_THE_WEST_ICE_PARK")){			// Num5 = 2
			SetNumFlg_("NUM_SCENARIO_SUB_ICE", GetFlagID_("CONST_SS_IF_GO_TO_SEE_TODO"));// Num5 <- 3

			SetReturnDemoPosDir_(Vec3(-214.634, 31.180, 166.685), 158);
			//301[�S�C�ʂƂ̑���]
			EventStartChangeDemo(301, FADE_COLOR_BLACK);
		}
		//��316[�C�G�^�X�̎���]��A���|�[���p�[�N�ɓ��������̃f��
		if(ice_event_num == GetFlagID_("CONST_SS_IF_SECOND_ATTACK")){					// Num5 = 19
			//�ǂ̃}�b�v�؂�ւ��|�C���g��ʂ�����
			if(GetEnteredMapChangeNullName_() == "w_I00_00ALru_000"			//����
				|| GetEnteredMapChangeNullName_() == "w_I00_00CLru_000"){	//�k��
				SetNumFlg_("NUM_SCENARIO_SUB_ICE", GetFlagID_("CONST_SS_IF_GO_TO_THE_ICE_RUINS"));	// Num5 <- 20

				SetReturnDemoPosDir_(Vec3(-199.6, 31.1, 101.2), -17);
				//317[�����A�[�U���[�N�o��]
				EventStartChangeDemo(317, FADE_COLOR_BLACK);
				// �|�[���p�[�N��BGM��ύX���邽�߂̒n���ݒu�����Ȃ��悤�ɂ���
				SetEventFlg_("BFG_SET_CHANGE_BGM_MINE", false);
			}
		}
	}
	EventEnd_();
}

//------------------------------------------------
//		�m�o�b�ڐG��
//------------------------------------------------
function TouchNpc()
{
	local main_num			= GetNumFlg_("NUM_SCENARIO_MAIN");							// Num0
	local ice_event_num		= GetNumFlg_("NUM_SCENARIO_SUB_ICE");						// Num5

	local target = GetTargetId_();

	DebugPrint("ID: " + target + " �ɐڐG [TouchNpc]");

	switch (target) {
	case g_npc_item:
		uTalkNpc_item();
		break;
	case g_npc_inn:
		uTalkNpc_inn();
		break;
	case g_npc_west1:
		uTalkNpc_west1();
		break;
	case g_npc_west2:
		uTalkNpc_west2();
		break;
	case g_npc_west3:
		uTalkNpc_west3();
		break;
	case g_npc_west4:
		uTalkNpc_west4();
		break;
	case g_todo_child1:
		uTalkTodo_child1();
		break;
	case g_todo_child2:
		uTalkTodo_child2();
		break;
	case g_todo_child3:
		uTalkTodo_child3();
		break;
	case g_todo:
		uTalkTodo();
		break;
	case g_npc_est1:
		uTalkNpc_est1();
		break;
	case g_npc_est2:
		uTalkNpc_est2();
		break;
	case g_npc_est3:
		uTalkNpc_est3();
		break;
	case g_npc_est4:
		uTalkNpc_est4();
		break;
	case g_silver:
		uTalkSilver();
		break;
	case g_npc_gardman:
		uTalkNpc_gardman();
		break;
	case g_yetas:
		uTalkYetas();
		break;
	default :
		DebugPrint("WARNING : NPC_ID���s���ł� [TouchNpc]");
		break;
	}
	
	EventEnd_();
}

//------------------------------------------------
//		�n���ڐG��
//------------------------------------------------
function TouchEventMine()
{
	local main_num			= GetNumFlg_("NUM_SCENARIO_MAIN");							// Num0
	local ice_event_num		= GetNumFlg_("NUM_SCENARIO_SUB_ICE");						// Num5

	local target = GetTouchEventMineId_();
	local player = GetPlayerId_();

	switch ( target ) {
	// �C�G�^�X��}����g�[�h�[�ɋ߂Â��Ɖ����߂����n��
	case g_mine_exit03:
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_TODO");
		ShowMsg_("DEMO_009_AFT_TODO");				// �u�C�G�^�X�� �����Ń��V���}���Ă����I
		KeyInputWait_();
		CloseMsgWnd_();
		
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_IETASU");
		ShowMsg_("DEMO_009_AFT_YETAS");				// �u�ʂ������I�I
		KeyInputWait_();
		CloseMsgWnd_();
		
		uPlayerTurnMoveDirWalk(-214.1, 31.0, 114.8);
		break;

	// �g�[�h�[�ɋ߂Â������f��[�g�[�h�[�̗��݇A]���Đ�����n��
	case g_mine04:
		if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){								// Num0 = 4
			if(ice_event_num == GetFlagID_("CONST_SS_IF_FIRST_ATTACK")){				// Num5 = 16
				// ���[���֎~����������
				SetEventFlg_("BFG_PLAYERABILITY_RULER_PROHIBIT", false);				// Bit_440 ���[���֎~
				SetNumFlg_("NUM_SCENARIO_SUB_ICE",GetFlagID_("CONST_SS_IF_GO_TO_THE_ICE_CEMETERY"));	// Num5 <- 17
				DeleteEventMine_(g_mine04);
				// �f���̕��A�ʒu���f���̊�����ɐݒ肵�܂�
				SetReturnDemoPosDir_(Vec3(-147.580, 30.979, 33.82), -0);
				//314[�g�[�h�[�̗��݇A]
				TouchNpcChangeDemo(314);//���g�[�h�[�ɘb�����������ɍĐ�����ꍇ������̂Œ��ӂ���
			}
		}
		break;

	//���|�[���p�[�N�Z�l�c���C�G�^�X�̉��~�̓������ǂ��n��
	case g_mine_exit:
		if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){								// Num0 = 4
			if(ice_event_num >= GetFlagID_("CONST_SS_IF_GO_BACK_WEST_ICE_PARK")			// Num5 >= 15
			&& ice_event_num <= GetFlagID_("CONST_SS_IF_FIRST_ATTACK")){				// Num5 <= 16
				local dir = GetDir_(g_npc_est4);
				
				FaceToFaceNpc(g_npc_est4);
				
				OpenMsgWnd_();
				ShowMsg_("DEMO_007_AFT_EST_NPC_D");
				KeyInputWait_();
				CloseMsgWnd_();
				
				Task_RotateToDirSetMotion_(g_npc_est4, dir, 5.7, MOT_WALK, MOT_WAIT);
				
				CommPlayerTurnMoveDirWalk(-20);
			}
		}
		break;

	//�쉀��Ԃ��������ǂ��n��
	case g_mine_exit02:
		if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){								// Num0 = 4
			if(ice_event_num >= GetFlagID_("CONST_SS_IF_GO_TO_THE_EAST_ICE_PARK")		// Num5 >= 14
			&& ice_event_num <= GetFlagID_("CONST_SS_IF_FIRST_ATTACK")){				// Num5 <= 16
				local dir = GetDir_(g_npc_gardman);
				
				FaceToFaceNpc(g_npc_gardman);
				
				OpenMsgWnd_();
				ShowMsg_("DEMO_006_AFT_EST_NPC_GARD");
				KeyInputWait_();
				CloseMsgWnd_();
				
				Task_RotateToDirSetMotion_(g_npc_gardman, dir, 5.7, MOT_WALK, MOT_WAIT);
				
				CommPlayerTurnMoveDirWalk(-90);
			}
		}
		break;

	//�C�G�^�X�̕����ɓ��������̃f���̒n��
	case g_mine03:
		if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){								// Num0 = 4
			if(ice_event_num == GetFlagID_("CONST_SS_IF_GO_TO_THE_EAST_ICE_PARK")){		// Num5 = 14
				SetNumFlg_("NUM_SCENARIO_SUB_ICE",GetFlagID_("CONST_SS_IF_GO_BACK_WEST_ICE_PARK"));	// Num5 <- 15
				DeleteEventMine_(g_mine03);
				// �f���̕��A�ʒu���f���̊�����ɐݒ肵�܂�
				SetReturnDemoPosDir_(Vec3(281.795, 75.135, -178.661), -20);
				//312[�C�G�^�X�Ƃ̉]
				TouchNpcChangeDemo(312);
			}
		}
		break;
		
	//�͂��߂ăg�[�h�[�̕����ɓ��������̃f���̒n��
	case g_mine01:
		if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){								// Num0 = 4
			if(ice_event_num == GetFlagID_("CONST_SS_IF_GO_TO_SEE_TODO")){				// Num5 = 3(CONST_SS_IF_GO_TO_SEE_TODO -> )
				// ���[�����֎~����t���O��ݒ� < SQEX�v�]�Ńf���𓝍����邽�߃R�����g�� (Redmine#3818) >
				//SetEventFlg_("BFG_PLAYERABILITY_RULER_PROHIBIT", true);					// Bit_440 ���[���֎~
				SetNumFlg_("NUM_SCENARIO_SUB_ICE",GetFlagID_("CONST_SS_IF_GO_TO_SEE_GATEKEEPER"));	// Num5 <- 6
				DeleteEventMine_(g_mine01);
				// �f���̕��A�ʒu���f���̊�����ɐݒ肵�܂�
				SetReturnDemoPosDir_(Vec3(-22.522, 75.135, -508.036), 161);
				//302[��e���̃g�[�h�[]
				TouchNpcChangeDemo(302);
			}
		}
		break;

	// ���[���̂Ƃѐ�ǉ��n���i�����j
	case g_mine_est_park:
			DeleteEventMine_(g_mine_est_park);
			SetEventFlg_("BFG_RULER_ADD_012", true);	// Bit_212 ���[���ǉ� ����
		break;

	default:
		DebugPrint("�ݒu����Ă��Ȃ��n���ɐڐG���肵�Ă��܂��I");
		break;
	}

	EventEnd_();
}


//------------------------------------------------
//		���A�N�^�[�Œ��ׂ���
//------------------------------------------------
function ReactorAnalyze()
{
	local main_num			= GetNumFlg_("NUM_SCENARIO_MAIN");							// Num0
	local ice_event_num		= GetNumFlg_("NUM_SCENARIO_SUB_ICE");						// Num5

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
//		�h�� ��b����
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkNpc_inn()
{
	// �Ó]�����̎�l���̕��A�ʒu�ƌ�����ݒ肷��
	local re_pos = Vec3(-239.782, 44.741, -3.216);	// ���A�ʒu���w��
	local re_dir = -118;							// �������w��
	// ���b�Z�[�W�L�[�̏�����
	local message_key_1 = 0;	// ���b�Z�[�W�L�[(�I������\�����郁�b�Z�[�W)
	local message_key_2 = 0;	// ���b�Z�[�W�L�[(��߂�ꍇ�̃��b�Z�[�W)
	local message_key_3 = 0;	// ���b�Z�[�W�L�[(���p�����ꍇ�̃��b�Z�[�W)
	// �X���̃N���A�t���O
	local clear_flag	= GetEventFlg_("BFG_SCENARIO_CLEAR_ICE");						//Bit_43 �X�N���A

	if(clear_flag == true){
		if(GetEventFlg_("BFG_CHECK_INN_FIRST_MSG_ALL") == false){
			// �X���N���A��̏h���ŕ\�����郁�b�Z�[�W���w��(����)
			message_key_1 = "INN_MSG_001";
			message_key_2 = "INN_MSG_002";
			message_key_3 = "INN_MSG_003";
		}
		else{
			// �X���N���A��̏h���ŕ\�����郁�b�Z�[�W���w��(�Q��ڈȍ~)
			message_key_1 = "INN_MSG_004";
			message_key_2 = "INN_MSG_005";
			message_key_3 = "INN_MSG_006";
		}
		SetEventFlg_("BFG_CHECK_INN_FIRST_MSG_ALL", true);
		// ���b�Z�[�W�̕\���i�u�₟ ��������Ⴂ�c
		OpenMsgWnd_();
		ShowMsg_(message_key_1);
		KeyInputWait_();
		switch(GetQueryResult_())
		{
		case QUERY3_0:
		case QUERY3_1:
		// ���܂鏈��
		// �x�ޏ���
			CloseMsgWnd_();
			// �h���̋��ʂ̉񕜏���
			CommTaskInn(re_pos, re_dir, clear_flag, g_npc_inn);
			// ���b�Z�[�W�̕\��(�u���͂�[��������c
			OpenMsgWnd_();
			ShowMsg_(message_key_3);
			KeyInputWait_();
			CloseMsgWnd_();
			break;
		case QUERY3_2:
		// ��߂鏈��
			// ���b�Z�[�W�̕\��(�u�킩����������c
			ShowMsg_(message_key_2);
			KeyInputWait_();
			CloseMsgWnd_();
			break;
		}
	}
	else{
		// �X���N���A�O�̏h���ŕ\�����郁�b�Z�[�W���w��
		local ice_event_num = GetNumFlg_("NUM_SCENARIO_SUB_ICE");
		if(ice_event_num <= GetFlagID_("CONST_SS_IF_FIRST_ATTACK")){ // Num5 <= 16
			message_key_1 = "INN_MSG_1ST_001";
			message_key_2 = "INN_MSG_1ST_002";
			message_key_3 = "INN_MSG_1ST_003";
		}
		// Demo314[�g�[�h�[�̗��݇A]�Đ���
		else if(ice_event_num >= GetFlagID_("CONST_SS_IF_GO_TO_THE_ICE_CEMETERY")
		&& ice_event_num <= GetFlagID_("CONST_SS_IF_SECOND_ATTACK")){ // Num5 >= 17 && Num5 <= 19
			message_key_1 = "INN_MSG_1ST_004";
			message_key_2 = "INN_MSG_1ST_005";
			message_key_3 = "INN_MSG_1ST_006";
		}
		// Demo317[�����A�[�U���[�N�o��]�Đ���
		else if(ice_event_num >= GetFlagID_("CONST_SS_IF_GO_TO_THE_ICE_RUINS")
		&& ice_event_num <= GetFlagID_("CONST_SS_IF_MOVE_THE_WORLD_4")){ // Num5 >= 19 && Num5 <= 35
			message_key_1 = "INN_MSG_1ST_007";
			message_key_2 = "INN_MSG_1ST_008";
			message_key_3 = "INN_MSG_1ST_009";
		}
		// Demo330[���̍�����]�Đ���(�A�U�[���[�N��|���Ă��獕�S�̊č����s���̈ړ����u�ɏ��܂�)
		else{ // Num5 >= 36
			message_key_1 = "INN_MSG_1ST_010";
			message_key_2 = "INN_MSG_1ST_011";
			message_key_3 = "INN_MSG_1ST_012";
		}

		// ���b�Z�[�W�̕\���i�u�₟ ��������Ⴂ�c
		OpenMsgWnd_();
		ShowMsg_(message_key_1);
		KeyInputWait_();
		switch(GetQueryResult_())
		{
		case QUERY2_0:
		// ���܂鏈��
			CloseMsgWnd_();
			// �h���̋��ʂ̉񕜏���
			CommTaskInn(re_pos, re_dir, clear_flag, g_npc_inn);
			// ���b�Z�[�W�̕\��(�u���͂�[��������c
			OpenMsgWnd_();
			ShowMsg_(message_key_3);
			KeyInputWait_();
			CloseMsgWnd_();
			break;
		case QUERY2_1:
		// ��߂鏈��
			// ���b�Z�[�W�̕\��(�u�킩����������c
			ShowMsg_(message_key_2);
			KeyInputWait_();
			CloseMsgWnd_();
			break;
		}
	}
}
//++++++++++++++++++++++++++++++++++++++++++++++++
//		��� ��b����
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkNpc_item()
{
	// �C�x���g�t���O
	local main_num      = GetNumFlg_("NUM_SCENARIO_MAIN");    // Num0
	local ice_event_num = GetNumFlg_("NUM_SCENARIO_SUB_ICE"); // Num5
	// ���b�Z�[�W�L�[�̏�����
	local msg_key_1 = 0; // ���b�Z�[�W�L�[(�J�n���b�Z�[�W)
	local msg_key_2 = 0; // ���b�Z�[�W�L�[(�߂胁�b�Z�[�W)
	
	// �����̕X���̃V�i���I��
	if(main_num <= GetFlagID_("CONST_SM_ICE_FIELD")){
		// �X���J�n�`Demo313[��]�Ƃ͂Ȃ񂼂�]�̍Đ���
		if(ice_event_num <= GetFlagID_("CONST_SS_IF_FIRST_ATTACK")){
			msg_key_1 = "ITM_MSG_001";
			msg_key_2 = "ITM_MSG_002";
		}
		// Demo314[�g�[�h�[�̗��݇A]�Đ���`Demo316[�C�G�^�X�̎���]�̍Đ���
		else if(ice_event_num >= GetFlagID_("CONST_SS_IF_GO_TO_THE_ICE_CEMETERY")
		&& ice_event_num <= GetFlagID_("CONST_SS_IF_SECOND_ATTACK")){
			msg_key_1 = "ITM_MSG_003";
			msg_key_2 = "ITM_MSG_004";
		}
		// Demo317[�����A�[�U���[�N�o��]�Đ���`Demo329[���E�ړ����\�ɇC]�i���䎺�j�̍Đ���
		else if(ice_event_num >= GetFlagID_("CONST_SS_IF_GO_TO_THE_ICE_RUINS")
		&& ice_event_num <= GetFlagID_("CONST_SS_IF_MOVE_THE_WORLD_4")){
			msg_key_1 = "ITM_MSG_005";
			msg_key_2 = "ITM_MSG_006";
		}
		// Demo330[���̍�����]�̍Đ���
		else{
			msg_key_1 = "ITM_MSG_007";
			msg_key_2 = "ITM_MSG_008";
		}
	}
	// ���S�̊č����`���S�N���A
	else{
		msg_key_1 = "ITM_MSG_007";
		msg_key_2 = "ITM_MSG_008";
	}
	
	OpenMsgWnd_();
	ShowMsg_(msg_key_1);
	KeyInputWait_();
	CloseMsgWnd_();
	//����t���[�Ɉڍs
	GotoMenuFadeOpen(MENU_OPEN.I01_00_ITEM);
	//����t���[�I����
	OpenMsgWnd_();
	ShowMsg_(msg_key_2);
	KeyInputWait_();
	CloseMsgWnd_();
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		���|�[���p�[�N�Z���` ��b����
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkNpc_west1()
{
	local main_num			 = GetNumFlg_("NUM_SCENARIO_MAIN");							// Num0
	local ice_event_num		 = GetNumFlg_("NUM_SCENARIO_SUB_ICE");						// Num5
	local sky_num			 = GetNumFlg_("NUM_SCENARIO_SUB_SKY");						// Num9
	local bit_sinario_clesr	 = GetEventFlg_("BFG_SCENARIO_CLEAR_ALL");					// Bit_46 �V�i���I�N���A
	
	if(bit_sinario_clesr == true){							// Bit_46 �V�i���I�N���A
		OpenMsgWnd_();
		ShowMsg_("SINARIO_CLEAR_AFT_WST_NPC_A");	// �u�悤�����̂� <name_player/>�����B
		KeyInputWait_();
		CloseMsgWnd_();
	}
	else if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){								// Num0 = 4
		if (ice_event_num < GetFlagID_("CONST_SS_IF_FIRST_ATTACK")) {					// Num5 < 16
			OpenMsgWnd_();
			ShowMsg_("DEMO_002_AFT_WST_NPC_A");		// �u������ �|�[���p�[�N�����イ
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else if (ice_event_num < GetFlagID_("CONST_SS_IF_GO_TO_THE_ICE_RUINS")) {		// Num5 < 20
			OpenMsgWnd_();
			ShowMsg_("DEMO_008_AFT_WST_NPC_A");		// �u��ς��ׁI �C�G�^�X�Ǝ艺������
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else if (ice_event_num < GetFlagID_("CONST_SS_IF_CLEAR_ICE_FIELD")) {			// Num5 < 36
			OpenMsgWnd_();
			ShowMsg_("DEMO_012_AFT_WST_NPC_A");		// �u�ȁc�Ȃ񂾂ׁI�H �N������ ����c�c�I
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else {
			OpenMsgWnd_();
			ShowMsg_("DEMO_019_AFT_WST_NPC_A");		// �u���낢��Ɛ��b�ɂȂ����ׁB
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
	else if(main_num == GetFlagID_("CONST_SM_SKY")){								// Num0 = 8
		if(sky_num < GetFlagID_("CONST_SS_SK_GO_PRISON_SKY")) {			// Num9 < 30
			OpenMsgWnd_();
			ShowMsg_("GARUBIRUSU_AFT_WST_NPC_A");			// �u�������� ���Ă��ꂽ�̂� ����ȋ�ł͂Ȃ��B
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else {
			OpenMsgWnd_();
			ShowMsg_("BIG_AZAMUKU_AFT_WST_NPC_A");			// �u�悤���Ă��ꂽ�I �����ԕ����Ȃ��Ȃ���
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
	else {
		OpenMsgWnd_();
		ShowMsg_("DEMO_019_AFT_WST_NPC_A");				// �u���낢��Ɛ��b�ɂȂ����ׁB
		KeyInputWait_();
		CloseMsgWnd_();
	}
}
//++++++++++++++++++++++++++++++++++++++++++++++++
//		���|�[���p�[�N�Z���a ��b����
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkNpc_west2()
{
	local main_num = GetNumFlg_("NUM_SCENARIO_MAIN");									// Num0
	local ice_event_num   = GetNumFlg_("NUM_SCENARIO_SUB_ICE");							// Num5
	local sky_num		 = GetNumFlg_("NUM_SCENARIO_SUB_SKY");							// Num9
	local bit_sinario_clesr	 = GetEventFlg_("BFG_SCENARIO_CLEAR_ALL");					// Bit_46 �V�i���I�N���A
	
	if(bit_sinario_clesr == true){							// Bit_46 �V�i���I�N���A
		OpenMsgWnd_();
		ShowMsg_("SINARIO_CLEAR_AFT_WST_NPC_B");	// �u�����������Ƃ� ���񂽂����Ȃ��Ă�
		KeyInputWait_();
		CloseMsgWnd_();
	}
	else if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){								// Num0 = 4
		if (ice_event_num < GetFlagID_("CONST_SS_IF_FIRST_ATTACK")) {					// Num5 < 16
			OpenMsgWnd_();
			ShowMsg_("DEMO_002_AFT_WST_NPC_B");		// �u�̂� �V���o�[������Ă���
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else if (ice_event_num < GetFlagID_("CONST_SS_IF_GO_TO_THE_ICE_RUINS")) {		// Num5 < 20
			OpenMsgWnd_();
			ShowMsg_("DEMO_008_AFT_WST_NPC_B");		// �u�C�G�^�X�߂� ���q�ɏ�肷������I
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else if (ice_event_num < GetFlagID_("CONST_SS_IF_CLEAR_ICE_FIELD")) {			// Num5 < 36
			OpenMsgWnd_();
			ShowMsg_("DEMO_012_AFT_WST_NPC_B");		// �u�A�[�U���[�N�Ȃ�ēz �t�@�~���[��
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else {
			OpenMsgWnd_();
			ShowMsg_("DEMO_019_AFT_WST_NPC_B");		// �u�V���o�[�e���� �����Ƃ����Ȃ�
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
	else if(main_num == GetFlagID_("CONST_SM_SKY")){								// Num0 = 8
		if(sky_num < GetFlagID_("CONST_SS_SK_GO_PRISON_SKY")) {			// Num9 < 30
			OpenMsgWnd_();
			ShowMsg_("GARUBIRUSU_AFT_WST_NPC_B");			// �u�܂��� �V�ϒn�ق��ׁB
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else {
			OpenMsgWnd_();
			ShowMsg_("BIG_AZAMUKU_AFT_WST_NPC_B");			// �u�悤�₭ ���邢�� �����悤�ɂȂ����ׁB
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
	else {
		OpenMsgWnd_();
		ShowMsg_("DEMO_019_AFT_WST_NPC_B");				// �u�V���o�[�e���� �����Ƃ����Ȃ�
		KeyInputWait_();
		CloseMsgWnd_();
	}
}
//++++++++++++++++++++++++++++++++++++++++++++++++
//		���|�[���p�[�N�Z���b ��b����
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkNpc_west3()
{
	local main_num = GetNumFlg_("NUM_SCENARIO_MAIN");									// Num0
	local ice_event_num   = GetNumFlg_("NUM_SCENARIO_SUB_ICE");							// Num5
	local sky_num		 = GetNumFlg_("NUM_SCENARIO_SUB_SKY");							// Num9
	local bit_sinario_clesr	 = GetEventFlg_("BFG_SCENARIO_CLEAR_ALL");					// Bit_46 �V�i���I�N���A
	
	if(bit_sinario_clesr == true){							// Bit_46 �V�i���I�N���A
		OpenMsgWnd_();
		ShowMsg_("SINARIO_CLEAR_AFT_WST_NPC_C");	// �u���[��c�c���񂽂ɂ� ����
		KeyInputWait_();
		CloseMsgWnd_();
	}
	else if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){								// Num0 = 4
		if (ice_event_num < GetFlagID_("CONST_SS_IF_FIRST_ATTACK")) {					// Num5 < 16
			OpenMsgWnd_();
			ShowMsg_("DEMO_002_AFT_WST_NPC_C");		// �u���� ���W�X�^���X���H
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else if (ice_event_num < GetFlagID_("CONST_SS_IF_GO_TO_THE_ICE_RUINS")) {		// Num5 < 20
			OpenMsgWnd_();
			ShowMsg_("DEMO_008_AFT_WST_NPC_C");		// �u�o���肩�B�����Ɛ̂� �v�������̂��B
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else if (ice_event_num < GetFlagID_("CONST_SS_IF_CLEAR_ICE_FIELD")) {			// Num5 < 36
			OpenMsgWnd_();
			ShowMsg_("DEMO_012_AFT_WST_NPC_C");		// �u�h���E�V���o�[�ƃg�[�h�[�e���� ���낢���݁B
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else {
			OpenMsgWnd_();
			ShowMsg_("DEMO_019_AFT_WST_NPC_C");		// �u���񂽂� ���W�X�^���X�ɂ�
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
	else if(main_num == GetFlagID_("CONST_SM_SKY")){								// Num0 = 8
		if(sky_num < GetFlagID_("CONST_SS_SK_GO_PRISON_SKY")) {			// Num9 < 30
			OpenMsgWnd_();
			ShowMsg_("GARUBIRUSU_AFT_WST_NPC_C");			// �u������ �g�[�h�[�e���ł�
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else {
			OpenMsgWnd_();
			ShowMsg_("BIG_AZAMUKU_AFT_WST_NPC_C");			// �u�����ԕ��� �����Ă���
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
	else {
		OpenMsgWnd_();
		ShowMsg_("DEMO_019_AFT_WST_NPC_C");				// �u���񂽂� ���W�X�^���X�ɂ�
		KeyInputWait_();
		CloseMsgWnd_();
	}
}
//++++++++++++++++++++++++++++++++++++++++++++++++
//		���|�[���p�[�N�Z���c ��b����
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkNpc_west4()
{
	local main_num = GetNumFlg_("NUM_SCENARIO_MAIN");									// Num0
	local ice_event_num   = GetNumFlg_("NUM_SCENARIO_SUB_ICE");							// Num5
	local sky_num		 = GetNumFlg_("NUM_SCENARIO_SUB_SKY");							// Num9
	local bit_sinario_clesr	 = GetEventFlg_("BFG_SCENARIO_CLEAR_ALL");					// Bit_46 �V�i���I�N���A
	
	if(bit_sinario_clesr == true){							// Bit_46 �V�i���I�N���A
		OpenMsgWnd_();
		ShowMsg_("SINARIO_CLEAR_AFT_WST_NPC_D");	// �u�悤 ����ꂽ�ׁB
		KeyInputWait_();
		CloseMsgWnd_();
	}
	else if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){								// Num0 = 4
		if (ice_event_num < GetFlagID_("CONST_SS_IF_GO_TO_SEE_GATEKEEPER")) {			// Num5 < 6
			OpenMsgWnd_();
			ShowMsg_("DEMO_002_AFT_WST_NPC_D");		// �u���̉��� �g�[�h�[�e���̉��~������ׁB
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else if (ice_event_num < GetFlagID_("CONST_SS_IF_FIRST_ATTACK")) {				// Num5 < 16
			OpenMsgWnd_();
			ShowMsg_("DEMO_004_AFT_WST_NPC_D");		// �u���� �g�[�h�[�e���̋q�l���������B
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else if (ice_event_num < GetFlagID_("CONST_SS_IF_GO_TO_THE_ICE_RUINS")) {		// Num5 < 20
			OpenMsgWnd_();
			ShowMsg_("DEMO_008_AFT_WST_NPC_D");		// �u�g�[�h�[�e���̗���� ���̃��V�����I
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else if (ice_event_num < GetFlagID_("CONST_SS_IF_CLEAR_ICE_FIELD")) {			// Num5 < 36
			OpenMsgWnd_();
			ShowMsg_("DEMO_012_AFT_WST_NPC_D");		// �u�ǂ�ȓz���낤�� �e���̉��~�ɂ͓���Ȃ��ׁI
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else {
			OpenMsgWnd_();
			ShowMsg_("DEMO_019_AFT_WST_NPC_D");		// �u�����Ƌq�l ���߂肾�ׂ��B
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
	else if(main_num == GetFlagID_("CONST_SM_SKY")){								// Num0 = 8
		if(sky_num < GetFlagID_("CONST_SS_SK_GO_PRISON_SKY")) {			// Num9 < 30
			OpenMsgWnd_();
			ShowMsg_("GARUBIRUSU_AFT_WST_NPC_D");			// �u���� ����Ȏ��� �悭���Ă��ꂽ���ȁB
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else {
			OpenMsgWnd_();
			ShowMsg_("BIG_AZAMUKU_AFT_WST_NPC_D");			// �u���V�� ���񂽂��s�����Ȃ� ���R�͂Ȃ��ׁB
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
	else {
		OpenMsgWnd_();
		ShowMsg_("ICE_CLEAR_AFT_WST_NPC_D");			// �u���񂽂��B�g�[�h�[�e���� �p�����ׂ��H
		KeyInputWait_();
		CloseMsgWnd_();
	}
}
//++++++++++++++++++++++++++++++++++++++++++++++++
//		�g�[�h�[�q���` ��b����
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkTodo_child1()
{
	local main_num = GetNumFlg_("NUM_SCENARIO_MAIN");									// Num0
	local ice_event_num   = GetNumFlg_("NUM_SCENARIO_SUB_ICE");							// Num5
	local sky_num		 = GetNumFlg_("NUM_SCENARIO_SUB_SKY");							// Num9
	local bit_sinario_clesr	 = GetEventFlg_("BFG_SCENARIO_CLEAR_ALL");					// Bit_46 �V�i���I�N���A
	
	if(bit_sinario_clesr == true){							// Bit_46 �V�i���I�N���A
		OpenMsgWnd_();
		ShowMsg_("SINARIO_CLEAR_AFT_CHILD_A");		// �u�悤 ��������ɗ��� ���ꂽ�ׁB
		KeyInputWait_();
		CloseMsgWnd_();
	}
	else if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){								// Num0 = 4
		if (ice_event_num < GetFlagID_("CONST_SS_IF_GO_TO_THE_EAST_ICE_PARK")) {		// Num5 < 14
			OpenMsgWnd_();
			ShowMsg_("DEMO_003_AFT_CHILD_A");		// �u�I����������ނׁ@<name_player/>����I
			KeyInputWait_();
			CloseMsgWnd_();
		}
		
		else if (ice_event_num < GetFlagID_("CONST_SS_IF_FIRST_ATTACK")) {				// Num5 < 16
			OpenMsgWnd_();
			ShowMsg_("DEMO_006_AFT_CHILD_A");		// �u���Ƃ��Ɓ@�|�[���p�[�N�́@�ЂƂ̑��������B
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else if (ice_event_num < GetFlagID_("CONST_SS_IF_GO_TO_THE_ICE_RUINS")) {		// Num5 < 20
			// �g�[�h�[�̎q���`
			OpenMsgWnd_();
			ShowMsg_("DEMO_008_AFT_CHILD_A");		// �u���߂����I�@�ǂ����ā@�g�[�h�[�e����
			KeyInputWait_();
			CloseMsgWnd_();
			// ���|�[���p�[�N�Z�l�`
			OpenMsgWnd_();
			ShowMsg_("DEMO_008_AFT_EST_NPC_A");		// �u���Ⴀ�@�N���@�h���E�V���o�[��
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else if (ice_event_num < GetFlagID_("CONST_SS_IF_CLEAR_ICE_FIELD")) {			// Num5 < 36
			OpenMsgWnd_();
			ShowMsg_("DEMO_012_AFT_CHILD_A");		// �u�C�G�^�X���������I�H
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else {
			OpenMsgWnd_();
			ShowMsg_("DEMO_019_AFT_CHILD_A");		// �u�A�[�U���[�N�� �|�����ƁH
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
	else if(main_num == GetFlagID_("CONST_SM_SKY")){								// Num0 = 8
		if(sky_num < GetFlagID_("CONST_SS_SK_GO_PRISON_SKY")) {			// Num9 < 30
			OpenMsgWnd_();
			ShowMsg_("GARUBIRUSU_AFT_CHILD_A");			// �u�N�� ���V��̋�� �D�����񂾂ׂ��B
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else {
			OpenMsgWnd_();
			ShowMsg_("BIG_AZAMUKU_AFT_CHILD_A");		// �u�����I �󂪍L���Ȃ����ׁI
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
	else {
		OpenMsgWnd_();
		ShowMsg_("ICE_CLEAR_AFT_CHILD_A");			// �u�q�l�c�c�����h���Ȃ�����
		KeyInputWait_();
		CloseMsgWnd_();
	}
}
//++++++++++++++++++++++++++++++++++++++++++++++++
//		�g�[�h�[�q���a ��b����
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkTodo_child2()
{
	local main_num = GetNumFlg_("NUM_SCENARIO_MAIN");									// Num0
	local ice_event_num   = GetNumFlg_("NUM_SCENARIO_SUB_ICE");							// Num5
	local sky_num		 = GetNumFlg_("NUM_SCENARIO_SUB_SKY");							// Num9
	local bit_sinario_clesr	 = GetEventFlg_("BFG_SCENARIO_CLEAR_ALL");					// Bit_46 �V�i���I�N���A
	
	if(bit_sinario_clesr == true){							// Bit_46 �V�i���I�N���A
		OpenMsgWnd_();
		ShowMsg_("SINARIO_CLEAR_AFT_CHILD_B");		// �u���� �����炵�� �h���Ȃ��̂��H
		KeyInputWait_();
		CloseMsgWnd_();
	}
	else if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){								// Num0 = 4
		if (ice_event_num < GetFlagID_("CONST_SS_IF_GO_TO_THE_EAST_ICE_PARK")) {		// Num5 < 14
			OpenMsgWnd_();
			ShowMsg_("DEMO_003_AFT_CHILD_B");		// �u���̓z����@���́@���ԂȂ񂾂ׁB
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else if (ice_event_num < GetFlagID_("CONST_SS_IF_FIRST_ATTACK")) {				// Num5 < 16
			OpenMsgWnd_();
			ShowMsg_("DEMO_006_AFT_CHILD_B");		// �u�������C�h���Ă���Œ��Ɂ@B�{�^����������
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else if (ice_event_num < GetFlagID_("CONST_SS_IF_GO_TO_THE_ICE_RUINS")) {		// Num5 < 20
			// �g�[�h�[�̎q���a
			OpenMsgWnd_();
			ShowMsg_("DEMO_008_AFT_CHILD_B");		// �u�����炪�@�K�}���̌��E���ׁI
			KeyInputWait_();
			CloseMsgWnd_();
			// ���|�[���p�[�N�Z�l�a
			OpenMsgWnd_();
			ShowMsg_("DEMO_008_AFT_EST_NPC_B");		// �u�Ă߂��I�@�����₪�����ȁI
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else if (ice_event_num < GetFlagID_("CONST_SS_IF_CLEAR_ICE_FIELD")) {			// Num5 < 36
			OpenMsgWnd_();
			ShowMsg_("DEMO_012_AFT_CHILD_B");		// �u���̓z��� �ǂ��������Ǝv�����̂ɂ�B
			KeyInputWait_();
			CloseMsgWnd_();
		} else {
			OpenMsgWnd_();
			ShowMsg_("DEMO_019_AFT_CHILD_B");		// �u�q�l�� �����𗷗��񂩁H
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
	else if(main_num == GetFlagID_("CONST_SM_SKY")){								// Num0 = 8
		if(sky_num < GetFlagID_("CONST_SS_SK_GO_PRISON_SKY")) {			// Num9 < 30
			OpenMsgWnd_();
			ShowMsg_("GARUBIRUSU_AFT_CHILD_B");			// �u���Ƃ� ���̐����ǂ��Ȃ낤��
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else {
			OpenMsgWnd_();
			ShowMsg_("BIG_AZAMUKU_AFT_CHILD_B");		// �u�悤�₭ �����ԕ����Ȃ��Ȃ����ׂȁB
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
	else {
		OpenMsgWnd_();
		ShowMsg_("ICE_CLEAR_AFT_CHILD_B");			// �u�g�[�h�[�e���� ���񂽂𗊂�ɂ��Ă�B
		KeyInputWait_();
		CloseMsgWnd_();
	}
}
//++++++++++++++++++++++++++++++++++++++++++++++++
//		�g�[�h�[�q���b ��b����
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkTodo_child3()
{
	local main_num = GetNumFlg_("NUM_SCENARIO_MAIN");									// Num0
	local ice_event_num   = GetNumFlg_("NUM_SCENARIO_SUB_ICE");							// Num5
	local sky_num		 = GetNumFlg_("NUM_SCENARIO_SUB_SKY");							// Num9
	local bit_sinario_clesr	 = GetEventFlg_("BFG_SCENARIO_CLEAR_ALL");					// Bit_46 �V�i���I�N���A
	
	if(bit_sinario_clesr == true){							// Bit_46 �V�i���I�N���A
		OpenMsgWnd_();
		ShowMsg_("SINARIO_CLEAR_AFT_CHILD_C");		//�u�g�[�h�[�e���� �V���o�[�e���� �����g�V���B
		KeyInputWait_();
		CloseMsgWnd_();
	}
	else if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){								// Num0 = 4
		if (ice_event_num < GetFlagID_("CONST_SS_IF_GO_TO_THE_EAST_ICE_PARK")) {		// Num5 < 14
			OpenMsgWnd_();
			ShowMsg_("DEMO_003_AFT_CHILD_C");		// �u���ꂽ��@���Ԃ��̂��@�g�[�h�[�g���ׁB
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else if (ice_event_num < GetFlagID_("CONST_SS_IF_FIRST_ATTACK")) {				// Num5 < 16
			OpenMsgWnd_();
			ShowMsg_("DEMO_006_AFT_CHILD_C");		// �u���̓����̕X���ȊO�ł��@�������C�h��
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else if (ice_event_num < GetFlagID_("CONST_SS_IF_GO_TO_THE_ICE_RUINS")) {		// Num5 < 20
			// ���|�[���p�[�N�Z�l�c
			OpenMsgWnd_();
			ShowMsg_("DEMO_008_AFT_EST_NPC_D");		// �u���������@�叫�̖��߂Ȃ�łȁc�c�B
			KeyInputWait_();
			CloseMsgWnd_();
			// �g�[�h�[�̎q���b
			OpenMsgWnd_();
			ShowMsg_("DEMO_008_AFT_CHILD_C");		// �u�����Ԃ�@����Ȃ��Ƃ��@�����ׁI
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else if (ice_event_num < GetFlagID_("CONST_SS_IF_CLEAR_ICE_FIELD")) {			// Num5 < 36
			OpenMsgWnd_();
			ShowMsg_("DEMO_012_AFT_CHILD_C");		// �u�ǂ���� �����̂�����
			KeyInputWait_();
			CloseMsgWnd_();
		} else {
			OpenMsgWnd_();
			ShowMsg_("DEMO_019_AFT_CHILD_C");		// �u<name_player/>�� ���Ă���Ă悩�����B
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
	else if(main_num == GetFlagID_("CONST_SM_SKY")){								// Num0 = 8
		if(sky_num < GetFlagID_("CONST_SS_SK_GO_PRISON_SKY")) {			// Num9 < 30
			OpenMsgWnd_();
			ShowMsg_("GARUBIRUSU_AFT_CHILD_C");			// �u�����ԕ��� ���V��̓G�Ȃ̂� �킩��񂾁B
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else {
			OpenMsgWnd_();
			ShowMsg_("BIG_AZAMUKU_AFT_CHILD_C");		// �u������ �������񂤂���
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
	else {
		OpenMsgWnd_();
		ShowMsg_("ICE_CLEAR_AFT_CHILD_C");			// �u�e�����c�c�����ă|�[���p�[�N���~���Ă��ꂽ
		KeyInputWait_();
		CloseMsgWnd_();
	}
}
//++++++++++++++++++++++++++++++++++++++++++++++++
//		���|�[���p�[�N�Z�l�` ��b����
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkNpc_est1()
{
	local main_num = GetNumFlg_("NUM_SCENARIO_MAIN");									// Num0
	local ice_event_num   = GetNumFlg_("NUM_SCENARIO_SUB_ICE");							// Num5
	local sky_num		 = GetNumFlg_("NUM_SCENARIO_SUB_SKY");							// Num9
	local bit_sinario_clesr	 = GetEventFlg_("BFG_SCENARIO_CLEAR_ALL");					// Bit_46 �V�i���I�N���A
	
	if(bit_sinario_clesr == true){							// Bit_46 �V�i���I�N���A
		OpenMsgWnd_();
		ShowMsg_("SINARIO_CLEAR_AFT_EST_NPC_A");	//�u���񂽂̊������� �Ȃ��������S�����B
		KeyInputWait_();
		CloseMsgWnd_();
	}
	else if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){								// Num0 = 4
		if (ice_event_num < GetFlagID_("CONST_SS_IF_FIRST_ATTACK")) {				// Num5 < 16
			OpenMsgWnd_();
			ShowMsg_("DEMO_006_AFT_EST_NPC_A");		// �u���W�X�^���X�c�c�H �܂������c�肪�������B
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else if (ice_event_num < GetFlagID_("CONST_SS_IF_GO_TO_THE_ICE_RUINS")) {		// Num5 < 20
			// �g�[�h�[�̎q���`
			OpenMsgWnd_();
			ShowMsg_("DEMO_008_AFT_CHILD_A");		// �u���߂����I�@�ǂ����ā@�g�[�h�[�e����
			KeyInputWait_();
			CloseMsgWnd_();
			//���|�[���p�[�N�Z�l�`
			OpenMsgWnd_();
			ShowMsg_("DEMO_008_AFT_EST_NPC_A");		// �u���Ⴀ�@�N���@�h���E�V���o�[��
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else if (ice_event_num < GetFlagID_("CONST_SS_IF_CLEAR_ICE_FIELD")) {			// Num5 < 36
			OpenMsgWnd_();
			ShowMsg_("DEMO_012_AFT_EST_NPC_A");		// �i���j�u�C�G�^�X���܂� �j�Z���m�H
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else {
			OpenMsgWnd_();
			ShowMsg_("DEMO_019_AFT_EST_NPC_A");		// �u������ �������� �_�}���ꂽ�񂾂Ȃ��B
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
	else if(main_num == GetFlagID_("CONST_SM_SKY")){								// Num0 = 8
		if(sky_num < GetFlagID_("CONST_SS_SK_GO_PRISON_SKY")) {			// Num9 < 30
			OpenMsgWnd_();
			ShowMsg_("GARUBIRUSU_AFT_EST_NPC_A");			// �u����Ȏ����� ���Ɛ��� �ЂƂɂȂ���
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else {
			OpenMsgWnd_();
			ShowMsg_("BIG_AZAMUKU_AFT_EST_NPC_A");			// �u�����ԕ��� �󂩂�������񂾂��āH
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
	else {
		OpenMsgWnd_();
		ShowMsg_("ICE_CLEAR_AFT_EST_NPC_A");			// �u�������c�c�A�S���ɂ��c�c�B
		KeyInputWait_();
		CloseMsgWnd_();
	}
}
//++++++++++++++++++++++++++++++++++++++++++++++++
//		���|�[���p�[�N�Z�l�a ��b����
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkNpc_est2()
{
	local main_num = GetNumFlg_("NUM_SCENARIO_MAIN");									// Num0
	local ice_event_num   = GetNumFlg_("NUM_SCENARIO_SUB_ICE");							// Num5
	local sky_num		 = GetNumFlg_("NUM_SCENARIO_SUB_SKY");							// Num9
	local bit_sinario_clesr	 = GetEventFlg_("BFG_SCENARIO_CLEAR_ALL");					// Bit_46 �V�i���I�N���A
	
	if(bit_sinario_clesr == true){							// Bit_46 �V�i���I�N���A
		OpenMsgWnd_();
		ShowMsg_("SINARIO_CLEAR_AFT_EST_NPC_B");	//�u�O�� �I���� ���O�̂��Ƃ�
		KeyInputWait_();
		CloseMsgWnd_();
	}
	else if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){								// Num0 = 4
		if (ice_event_num < GetFlagID_("CONST_SS_IF_FIRST_ATTACK")) {					// Num5 < 16
			OpenMsgWnd_();
			ShowMsg_("DEMO_006_AFT_EST_NPC_B");		// �u�I�������� �C�G�^�X�t�@�~���[�B
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else if (ice_event_num < GetFlagID_("CONST_SS_IF_GO_TO_THE_ICE_RUINS")) {		// Num5 < 20
			// �g�[�h�[�̎q���a
			OpenMsgWnd_();
			ShowMsg_("DEMO_008_AFT_CHILD_B");		// �u�����炪�@�K�}���̌��E���ׁI
			KeyInputWait_();
			CloseMsgWnd_();
			// ���|�[���p�[�N�Z�l�a
			OpenMsgWnd_();
			ShowMsg_("DEMO_008_AFT_EST_NPC_B");		// �u�Ă߂��I�@�����₪�����ȁI
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else if (ice_event_num < GetFlagID_("CONST_SS_IF_CLEAR_ICE_FIELD")) {			// Num5 < 36
			OpenMsgWnd_();
			ShowMsg_("DEMO_012_AFT_EST_NPC_B");		// �i���j�u�ǁ[�Ȃ��Ă�񂾁E�E�B
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else {
			OpenMsgWnd_();
			ShowMsg_("DEMO_019_AFT_EST_NPC_B");		// �u�I�������� �V���o�[�t�@�~���[�B
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
	else if(main_num == GetFlagID_("CONST_SM_SKY")){								// Num0 = 8
		if(sky_num < GetFlagID_("CONST_SS_SK_GO_PRISON_SKY")) {			// Num9 < 30
			OpenMsgWnd_();
			ShowMsg_("GARUBIRUSU_AFT_EST_NPC_B");			// �u�����Ȃ����� ����������˂��ƂȁB
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else {
			OpenMsgWnd_();
			ShowMsg_("BIG_AZAMUKU_AFT_EST_NPC_B");			// �u�����ԕ����� �X������������̂� ���O���B
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
	else {
		OpenMsgWnd_();
		ShowMsg_("ICE_CLEAR_AFT_EST_NPC_B");			// �u����̈ꌏ�� �h���E�V���o�[�ɂ�
		KeyInputWait_();
		CloseMsgWnd_();
	}
}
//++++++++++++++++++++++++++++++++++++++++++++++++
//		���|�[���p�[�N�Z�l�b ��b����
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkNpc_est3()
{
	local main_num = GetNumFlg_("NUM_SCENARIO_MAIN");									// Num0
	local ice_event_num   = GetNumFlg_("NUM_SCENARIO_SUB_ICE");							// Num5
	local sky_num		 = GetNumFlg_("NUM_SCENARIO_SUB_SKY");							// Num9
	local bit_sinario_clesr	 = GetEventFlg_("BFG_SCENARIO_CLEAR_ALL");					// Bit_46 �V�i���I�N���A
	
	if(bit_sinario_clesr == true){							// Bit_46 �V�i���I�N���A
		OpenMsgWnd_();
		ShowMsg_("SINARIO_CLEAR_AFT_EST_NPC_C");	//�u�ǂ�Ȗ��� �����Ă����Ƃ��Ă�
		KeyInputWait_();
		CloseMsgWnd_();
	}
	else if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){								// Num0 = 4
		if (ice_event_num < GetFlagID_("CONST_SS_IF_GO_TO_THE_ICE_CEMETERY")) {			// Num5 < 17
			OpenMsgWnd_();
			ShowMsg_("DEMO_006_AFT_EST_NPC_C");		// �u�V���o�[�̂���Ȃ� �����Ă������Ƃ�
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else if (ice_event_num < GetFlagID_("CONST_SS_IF_CLEAR_ICE_FIELD")) {			// Num5 < 36
			OpenMsgWnd_();
			ShowMsg_("DEMO_009_AFT_EST_NPC_C");		// �u�����c�c�݂�ȏo����� �s�����܂�����B
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else {
			OpenMsgWnd_();
			ShowMsg_("DEMO_019_AFT_EST_NPC_C");		// �u�����c�c�呛����������
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
	else if(main_num == GetFlagID_("CONST_SM_SKY")){								// Num0 = 8
		if(sky_num < GetFlagID_("CONST_SS_SK_GO_PRISON_SKY")) {			// Num9 < 30
			OpenMsgWnd_();
			ShowMsg_("GARUBIRUSU_AFT_EST_NPC_C");			// �u�S�z�Ȃ� �����Ƃ��̋�� �Ȃ�Ƃ��Ȃ邳�B
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else {
			OpenMsgWnd_();
			ShowMsg_("BIG_AZAMUKU_AFT_EST_NPC_C");			// �u���񂽂� �X�����~���Ă����B
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
	else {
		OpenMsgWnd_();
		ShowMsg_("ICE_CLEAR_AFT_EST_NPC_C");			// �u���������܂� ���ꂩ��͕��a���̂��̂��B
		KeyInputWait_();
		CloseMsgWnd_();
	}
}
//++++++++++++++++++++++++++++++++++++++++++++++++
//		���|�[���p�[�N�Z�l�c ��b����
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkNpc_est4()
{
	local main_num = GetNumFlg_("NUM_SCENARIO_MAIN");									// Num0
	local ice_event_num   = GetNumFlg_("NUM_SCENARIO_SUB_ICE");							// Num5
	local sky_num		 = GetNumFlg_("NUM_SCENARIO_SUB_SKY");							// Num9
	local bit_sinario_clesr	 = GetEventFlg_("BFG_SCENARIO_CLEAR_ALL");					// Bit_46 �V�i���I�N���A
	
	if(bit_sinario_clesr == true){							// Bit_46 �V�i���I�N���A
		OpenMsgWnd_();
		ShowMsg_("SINARIO_CLEAR_AFT_EST_NPC_D");	//�u�債�����ĂȂ����ł��� ���܂Ȃ���
		KeyInputWait_();
		CloseMsgWnd_();
	}
	else if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){								// Num0 = 4
		if (ice_event_num < GetFlagID_("CONST_SS_IF_FIRST_ATTACK")) {					// Num5 < 16
			OpenMsgWnd_();
			ShowMsg_("DEMO_007_AFT_EST_NPC_D");		// �u�C�G�^�X���܂͋M�l�ȂǂƂ� ��������I
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else if (ice_event_num < GetFlagID_("CONST_SS_IF_GO_TO_THE_ICE_RUINS")) {		// Num5 < 20
			// ���|�[���p�[�N�Z�l�c
			OpenMsgWnd_();
			ShowMsg_("DEMO_008_AFT_EST_NPC_D");		// �u���������@�叫�̖��߂Ȃ�łȁc�c�B
			KeyInputWait_();
			CloseMsgWnd_();
			// �g�[�h�[�̎q���b
			OpenMsgWnd_();
			ShowMsg_("DEMO_008_AFT_CHILD_C");		// �u�����Ԃ�@����Ȃ��Ƃ��@�����ׁI
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else if (ice_event_num < GetFlagID_("CONST_SS_IF_CLEAR_ICE_FIELD")) {			// Num5 < 36
			OpenMsgWnd_();
			ShowMsg_("DEMO_012_AFT_EST_NPC_D");		// �i���j�u�V���o�[�e���� �����Ă������Ȃ�āI
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else {
			OpenMsgWnd_();
			ShowMsg_("DEMO_019_AFT_EST_NPC_D");		// �u�h���E�V���o�[�� �ǂ��Ȃ����Ă���H
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
	else if(main_num == GetFlagID_("CONST_SM_SKY")){								// Num0 = 8
		if(sky_num < GetFlagID_("CONST_SS_SK_GO_PRISON_SKY")) {			// Num9 < 30
			OpenMsgWnd_();
			ShowMsg_("GARUBIRUSU_AFT_EST_NPC_D");			// �u�c�c�h���E�V���o�[�� ����Ă���Ă���B
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else {
			OpenMsgWnd_();
			ShowMsg_("BIG_AZAMUKU_AFT_EST_NPC_D");			// �u�h���E�V���o�[���� ���O�̂��Ƃ�
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
	else {
		OpenMsgWnd_();
		ShowMsg_("ICE_CLEAR_AFT_EST_NPC_D");			// �u���O �h���E�V���o�[�ɗp�����H
		KeyInputWait_();
		CloseMsgWnd_();
	}
}
//++++++++++++++++++++++++++++++++++++++++++++++++
//		�쉀��� ��b����
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkNpc_gardman()
{
	local main_num = GetNumFlg_("NUM_SCENARIO_MAIN");									// Num0
	local ice_event_num   = GetNumFlg_("NUM_SCENARIO_SUB_ICE");							// Num5
	
	if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){									// Num0 = 4
		if (ice_event_num < GetFlagID_("CONST_SS_IF_GO_TO_THE_ICE_CEMETERY")) {			// Num5 < 17
			OpenMsgWnd_();
			ShowMsg_("DEMO_006_AFT_EST_NPC_GARD");		// �u�C�G�^�X���܂̖��߂��I
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
}
//++++++++++++++++++++++++++++++++++++++++++++++++
//		�g�[�h�[ ��b����
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkTodo()
{
	local main_num = GetNumFlg_("NUM_SCENARIO_MAIN");									// Num0
	local ice_event_num   = GetNumFlg_("NUM_SCENARIO_SUB_ICE");							// Num5
	local sky_num		 = GetNumFlg_("NUM_SCENARIO_SUB_SKY");							// Num9
	local bit_sinario_clesr	 = GetEventFlg_("BFG_SCENARIO_CLEAR_ALL");					// Bit_46 �V�i���I�N���A
	
	if(bit_sinario_clesr == true){							// Bit_46 �V�i���I�N���A
		OpenMsgWnd_();
		ShowMsg_("SINARIO_CLEAR_AFT_TODO");				//�u�悤������ <name_player/>�B
		KeyInputWait_();
		CloseMsgWnd_();
	}
	else if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){								// Num0 = 4
		if (ice_event_num < GetFlagID_("CONST_SS_IF_GO_TO_THE_EAST_ICE_PARK")) {		// Num5 < 14
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_TODO");
			ShowMsg_("DEMO_003_AFT_TODO");				// �u<name_player/>��@�܂���
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else if (ice_event_num < GetFlagID_("CONST_SS_IF_GO_BACK_WEST_ICE_PARK")) {		// Num5 < 15
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_TODO");
			ShowMsg_("DEMO_006_AFT_TODO");				// �u�������I �������� ���L���̌����񂾒j����I
			KeyInputWait_();
			CloseMsgWnd_();
		}
		//[�C�G�^�X�Ƃ̉]��̃��b�Z�[�W
		else if(ice_event_num == GetFlagID_("CONST_SS_IF_GO_BACK_WEST_ICE_PARK")){		// Num5 = 15
			// ���[�����֎~����t���O��ݒ�
			SetEventFlg_("BFG_PLAYERABILITY_RULER_PROHIBIT", true);						// Bit_440 ���[���֎~
			// ���b�Z�[�W��\����A�f���̍Đ�������
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_TODO");
			ShowMsg_("DEMO_007_AFT_TODO");				// �u�����c�c�߂������B
			KeyInputWait_();
			CloseMsgWnd_();
			SetNumFlg_("NUM_SCENARIO_SUB_ICE",GetFlagID_("CONST_SS_IF_FIRST_ATTACK"));	// Num5 <- 16
			// �f���̕��A�ʒu���f���̊�����ɐݒ肵�܂�
			SetReturnDemoPosDir_(Vec3(-29.876, 75.135, -542.234), -17);
			// Demo313[��]�Ƃ͂Ȃ񂼂�]�Đ�
			TouchNpcChangeDemo(313);
			SetEventFlg_("BFG_SET_CHANGE_BGM_MINE", true);						// Bit_1390 �|�[���p�[�N��BGM��ύX����t���O
		}
		else if (ice_event_num < GetFlagID_("CONST_SS_IF_GO_TO_THE_ICE_RUINS")) {		// Num5 < 20
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_TODO");
			ShowMsg_("DEMO_009_AFT_TODO");				// �u�C�G�^�X�� �����Ń��V���}���Ă����I
			KeyInputWait_();
			CloseMsgWnd_();
		
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_IETASU");
			ShowMsg_("DEMO_009_AFT_YETAS");				// �u�ʂ������I�I
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else {
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_TODO");
			ShowMsg_("DEMO_012_AFT_TODO");				// �u���V����������ǂ��B�k�V�͐�s����
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
	else if(main_num == GetFlagID_("CONST_SM_SKY")){								// Num0 = 8
		if(sky_num < GetFlagID_("CONST_SS_SK_GO_PRISON_SKY")) {			// Num9 < 30
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_TODO");
			ShowMsg_("GARUBIRUSU_AFT_TODO");			// �u���� <name_player/>���I
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else {
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_TODO");
			ShowMsg_("BIG_AZAMUKU_AFT_TODO");			// �u���񂵁c�c���̍����ԕ��� �Еt�����񂶂�ȁB
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
	else {
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_TODO");
		ShowMsg_("ICE_CLEAR_AFT_TODO");				// �u���� �悤�����̂��B
		KeyInputWait_();
		CloseMsgWnd_();
	}
}
//++++++++++++++++++++++++++++++++++++++++++++++++
//		�V���o�[ ��b����
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkSilver()
{
	local main_num		 = GetNumFlg_("NUM_SCENARIO_MAIN");								// Num0
	local ice_event_num	 = GetNumFlg_("NUM_SCENARIO_SUB_ICE");							// Num5
	local sky_num		 = GetNumFlg_("NUM_SCENARIO_SUB_SKY");							// Num9
	local bit_sinario_clesr	 = GetEventFlg_("BFG_SCENARIO_CLEAR_ALL");					// Bit_46 �V�i���I�N���A
	
	if(bit_sinario_clesr == true){							// Bit_46 �V�i���I�N���A
		OpenMsgWnd_();
		ShowMsg_("SINARIO_CLEAR_AFT_EST_SILV");		//�u������ �ǂ������񂾁H
		KeyInputWait_();
		CloseMsgWnd_();
	}
	else if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){								// Num0 = 4
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_SILVER");
		ShowMsg_("DEMO_012_AFT_EST_SILV");			// �u�z�� �Ȃ� ���L���̊�]��~����H
		KeyInputWait_();
		CloseMsgWnd_();
	}
	else if(main_num == GetFlagID_("CONST_SM_SKY")){								// Num0 = 8
		if(sky_num < GetFlagID_("CONST_SS_SK_GO_PRISON_SKY")) {			// Num9 < 30
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_SILVER");
			ShowMsg_("GARUBIRUSU_AFT_EST_SILV");			// �u�c�c���̍����ԕ��� �o�Ă��Ĉȗ�
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else {
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_SILVER");
			ShowMsg_("BIG_AZAMUKU_AFT_EST_SILV");			// �u�n�n�n�c�c�����ԕ��� �������Ǝv����
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
	else {
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_SILVER");
		ShowMsg_("ICE_CLEAR_AFT_EST_SILV");			// �u�����̂Ƃ��� �|�[���p�[�N�̗��Ē�����
		KeyInputWait_();
		CloseMsgWnd_();
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		�C�G�^�X ��b����
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkYetas()
{
	local main_num		 = GetNumFlg_("NUM_SCENARIO_MAIN");								// Num0
	local ice_event_num	 = GetNumFlg_("NUM_SCENARIO_SUB_ICE");							// Num5

	if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){								// Num0 = 4
		if (ice_event_num < GetFlagID_("CONST_SS_IF_GO_TO_THE_ICE_RUINS")) {		// Num5 < 20
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_TODO");
			ShowMsg_("DEMO_009_AFT_TODO");				// �u�C�G�^�X�� �����Ń��V���}���Ă����I
			KeyInputWait_();
			CloseMsgWnd_();

			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_IETASU");
			ShowMsg_("DEMO_009_AFT_YETAS");				// �u�ʂ������I�I
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++++++++
// �i���֎~�n���ɐG�ꂽ���A�����Ԃ�����
//------------------------------------------------------
// �������F���ꂽ�����W
// �������F�ړ��t���[����(�f�t�H���g����:30F)
// �߂�l  �F�Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++++++++
function uPlayerTurnMoveDirWalk( pos_x, pos_y, pos_z, move_frame = 30)
{
	local player	 = GetPlayerId_();
	local task_walk	 = Task_MoveForward_(player, 1.0, false);

	SetDirToPos_(player, Vec3(pos_x, pos_y, pos_z));
	local dir = GetDir_(player);
	SetMotion_(player, MOT_WALK, BLEND_N);
	SetDir_(player, dir+180);
	Wait_(move_frame);
	DeleteTask_(task_walk);
}


