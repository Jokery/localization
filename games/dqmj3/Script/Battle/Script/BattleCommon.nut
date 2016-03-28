//��ԃX�e�[�^�X�ω����̊e��ݒ�
gStateData <- [
	//�t�H�[�}�b�g
	//{ Name			= "STATUS_NONE"		:�X�e�[�^�X�̖��O���L�ڂ��܂��B
	//	Effect			= "EF010_01_HIT" ,	:�\������G�t�F�N�g�̎��
	//	Motion			= "MOT_DAMAGE",		�\�����郂�[�V�����̎��
	//	Wait			= 0 ,				:Wait�̎��ԁi0�̏ꍇ�́AWait�Ȃ��j
	//	PopVisible		= false ,			:Pop��\�����邩�H
	//	PopKind			= null ,			:�\������|�b�v�̎��
	//	MissPop			= true , 			:�~�X�����ꍇ�ɁA�~�X�|�b�v��\�����邩�H
	//	NonDamageWait	= false , 			:�����U�����Ȃ��ꍇ�ɁAWait�𔭐������邩�H
	//	CameraChange	= false ,			:�p�����[�^�ύX���ɃJ������؂�ւ��邩�H
	//	MessageVisible	= false ,			:�p�����[�^�ύX���Ƀ��b�Z�[�W��\�������邩�H
	//	MessageID		= false ,			:�p�����[�^�ύX���Ƀ��b�Z�[�W��\�������邩�H
	//
	//	Up_			: �㏸���̐ݒ�
	//	Down_		: �������̐ݒ�
	//
	
	// STATUS_NONE
	{	Name						= "STATUS_NONE"				,
		Up_Effect					= null						,
		Up_Motion					= null						,
		Up_Wait						= 0							,
		Up_MissPop					= false						,
		Down_Effect					= null						,
		Down_Motion					= null						,
		Down_Wait					= 0							,
		Down_MissPop				= false						,
		Reset_Wait					= 0							,
	},
	// STATUS_TENSION			�e���V����
	{	Name						= "STATUS_TENSION"			,
		Up_Effect					= null						,
		Up_Motion					= null						,
		Up_Wait						= 30						,
		Up_MissPop					= false						,
		Down_Effect					= null						,
		Down_Motion					= null						,
		Down_Wait					= 30						,
		Down_MissPop				= true						,
		Reset_Wait					= 30						,
	},
	// STATUS_ATTACK			�U����
	{	Name						= "STATUS_ATTACK"			,
		Up_Effect					= "EF130_01_BAIKIRUTO"		,
		Up_Motion					= null						,
		Up_Wait						= 30						,
		Up_MissPop					= false						,
		Down_Effect					= "EF130_03_HENATOSU"		,
		Down_Motion					= null						,
		Down_Wait					= 30						,
		Down_MissPop				= true						,
		Reset_Wait					= 30						,
	},
	// STATUS_DEFENCE			�����
	{	Name						= "STATUS_DEFENCE"			,
		Up_Effect					= "EF130_05_SUKARA"			,
		Up_Motion					= null						,
		Up_Wait						= 30						,
		Up_MissPop					= true						,
		Down_Effect					= "EF130_07_RUKANI"			,
		Down_Motion					= null						,
		Down_Wait					= 30						,
		Down_MissPop				= true						,
		Reset_Wait					= 30						,
	},
	// STATUS_QUICK				�f����
	{	Name						= "STATUS_QUICK"			,
		Up_Effect					= "EF130_09_PIORA"			,
		Up_Motion					= null						,
		Up_Wait						= 30						,
		Up_MissPop					= false						,
		Down_Effect					= "EF130_11_BIMIE"			,
		Down_Motion					= null						,
		Down_Wait					= 30						,
		Down_MissPop				= true						,
		Reset_Wait					= 30						,
	},
	// STATUS_WISE				����
	{	Name						= "STATUS_WISE"				,
		Up_Effect					= "EF130_13_INTE"			,
		Up_Motion					= null						,
		Up_Wait						= 30						,
		Up_MissPop					= false						,
		Down_Effect					= "EF130_15_FOOL"			,
		Down_Motion					= null						,
		Down_Wait					= 30						,
		Down_MissPop				= true						,
		Reset_Wait					= 30						,
	},
	// STATUS_CONFUSION			����
	{	Name						= "STATUS_CONFUSION"		,
		Up_Effect					= null						,
		Up_Motion					= MOT_DAMAGE				,
		Up_Wait						= 30						,
		Up_MissPop					= true						,
		Down_Effect					= null						,
		Down_Motion					= null						,
		Down_Wait					= 30						,
		Down_MissPop				= false						,
		Reset_Wait					= 30						,
	},
	// STATUS_SLEEP				����
	{	Name						= "STATUS_SLEEP"			,
		Up_Effect					= null						,
		Up_Motion					= MOT_DAMAGE				,
		Up_Wait						= 30						,
		Up_MissPop					= true						,
		Down_Effect					= null						,
		Down_Motion					= null						,
		Down_Wait					= 30						,
		Down_MissPop				= false						,
		Reset_Wait					= 30						,
	},
	// STATUS_PARALYSIS			�}�q
	{	Name						= "STATUS_PARALYSIS"		,
		Up_Effect					= null						,
		Up_Motion					= MOT_DAMAGE				,
		Up_Wait						= 30						,
		Up_MissPop					= true						,
		Down_Effect					= null						,
		Down_Motion					= null						,
		Down_Wait					= 30						,
		Down_MissPop				= false						,
		Reset_Wait					= 30						,
	},
	// STATUS_MIND				�x��
	{	Name						= "STATUS_MIND"				,
		Up_Effect					= null						,
		Up_Motion					= MOT_DAMAGE				,
		Up_Wait						= 30						,
		Up_MissPop					= true						,
		Down_Effect					= null						,
		Down_Motion					= null						,
		Down_Wait					= 30						,
		Down_MissPop				= true						,
		Reset_Wait					= 30						,
	},
	// STATUS_POISON			��
	{	Name						= "STATUS_POISON"			,
		Up_Effect					= null						,
		Up_Motion					= MOT_DAMAGE				,
		Up_Wait						= 30						,
		Up_MissPop					= true						,
		Down_Effect					= null						,
		Down_Motion					= null						,
		Down_Wait					= 30						,
		Down_MissPop				= false						,
		Reset_Wait					= 30						,
	},
	// STATUS_CURSE				��
	{	Name						= "STATUS_CURSE"			,
		Up_Effect					= null						,
		Up_Motion					= MOT_DAMAGE				,
		Up_Wait						= 30						,
		Up_MissPop					= true						,
		Down_Effect					= null						,
		Down_Motion					= null						,
		Down_Wait					= 30						,
		Down_MissPop				= false						,
		Reset_Wait					= 30						,
	},
	// STATUS_DEATH				���S
	{	Name						= "STATUS_DEATH"			,
		Up_Effect					= null						,
		Up_Motion					= MOT_DAMAGE				,
		Up_Wait						= 30						,
		Up_MissPop					= true						,
		Down_Effect					= null						,
		Down_Motion					= null						,
		Down_Wait					= 0							,
		Down_MissPop				= false						,
		Reset_Wait					= 0							,
	},
	// STATUS_ERASE				�h���s��
	{	Name						= "STATUS_ERASE"			,
		Up_Effect					= null						,
		Up_Motion					= MOT_DAMAGE				,
		Up_Wait						= 30						,
		Up_MissPop					= true						,
		Down_Effect					= null						,
		Down_Motion					= null						,
		Down_Wait					= 0							,
		Down_MissPop				= false						,
		Reset_Wait					= 0							,
	},
	// STATUS_HPMAX_DOWN		�ő�HP����
	{	Name						= "STATUS_HPMAX_DOWN"		,
		Up_Effect					= null						,
		Up_Motion					= null						,
		Up_Wait						= 0							,
		Up_MissPop					= false						,
		Down_Effect					= null						,
		Down_Motion					= null						,
		Down_Wait					= 0							,
		Down_MissPop				= false						,
		Reset_Wait					= 0							,
	},
	// STATUS_MPMAX_DOWN		�ő�MP����
	{	Name						= "STATUS_MPMAX_DOWN"		,
		Up_Effect					= null						,
		Up_Motion					= null						,
		Up_Wait						= 0							,
		Up_MissPop					= false						,
		Down_Effect					= null						,
		Down_Motion					= null						,
		Down_Wait					= 0							,
		Down_MissPop				= false						,
		Reset_Wait					= 0							,
	},
	// STATUS_HIT				����
	{	Name						= "STATUS_HIT"				,
		Up_Effect					= null						,
		Up_Motion					= null						,
		Up_Wait						= 0							,
		Up_MissPop					= true						,
		Down_Effect					= null						,
		Down_Motion					= MOT_DAMAGE				,
		Down_Wait					= 45						,
		Down_MissPop				= true						,
		Reset_Wait					= 0							,
	},
	// STATUS_DODGE				���
	{	Name						= "STATUS_DODGE"			,
		Up_Effect					= null						,
		Up_Motion					= null						,
		Up_Wait						= 0							,
		Up_MissPop					= true						,
		Down_Effect					= null						,
		Down_Motion					= null						,
		Down_Wait					= 45						,
		Down_MissPop				= true						,
		Reset_Wait					= 0							,
	},
	// STATUS_MAHOHACK			�ϐ�
	{	Name						= "STATUS_MAHOHACK"			,
		Up_Effect					= null						,
		Up_Motion					= null						,
		Up_Wait						= 45						,
		Up_MissPop					= false						,
		Down_Effect					= null						,
		Down_Motion					= MOT_DAMAGE				,
		Down_Wait					= 45						,
		Down_MissPop				= true						,
		Reset_Wait					= 0							,
	},
	// STATUS_DUMMY_01			����(�_�~�[)
	{	Name						= "STATUS_DUMMY_01"			,
		Up_Effect					= null						,
		Up_Motion					= null						,
		Up_Wait						= 45						,
		Up_MissPop					= false						,
		Down_Effect					= null						,
		Down_Motion					= MOT_DAMAGE				,
		Down_Wait					= 45						,
		Down_MissPop				= false						,
		Reset_Wait					= 0							,
	},
	// STATUS_FEAT_UP			����������
	{	Name						= "STATUS_FEAT_UP"			,
		Up_Effect					= null						,
		Up_Motion					= null						,
		Up_Wait						= 45						,
		Up_MissPop					= false						,
		Down_Effect					= null						,
		Down_Motion					= MOT_DAMAGE				,
		Down_Wait					= 45						,
		Down_MissPop				= false						,
		Reset_Wait					= 0							,
	},
	// STATUS_CHANGE			�X�e�[�^�X����
	{	Name						= "STATUS_CHANGE"			,
		Up_Effect					= null						,
		Up_Motion					= null						,
		Up_Wait						= 45						,
		Up_MissPop					= false						,
		Down_Effect					= null						,
		Down_Motion					= MOT_DAMAGE				,
		Down_Wait					= 45						,
		Down_MissPop				= false						,
		Reset_Wait					= 0							,
	},
	// STATUS_INCITE			�ΏیŒ�(���傤�͂�)
	{	Name						= "STATUS_INCITE"			,
		Up_Effect					= null						,
		Up_Motion					= null						,
		Up_Wait						= 45						,
		Up_MissPop					= false						,
		Down_Effect					= null						,
		Down_Motion					= MOT_DAMAGE				,
		Down_Wait					= 45						,
		Down_MissPop				= false						,
		Reset_Wait					= 0							,
	},
	// STATUS_HIDE				�Ώۏ��O(�������)
	{	Name						= "STATUS_HIDE"				,
		Up_Effect					= null						,
		Up_Motion					= null						,
		Up_Wait						= 45						,
		Up_MissPop					= false						,
		Down_Effect					= null						,
		Down_Motion					= MOT_DAMAGE				,
		Down_Wait					= 45						,
		Down_MissPop				= false						,
		Reset_Wait					= 0							,
	},
	// STATUS_TACTICS_SEAL		��핕��
	{	Name						= "STATUS_TACTICS_SEAL"		,
		Up_Effect					= null						,
		Up_Motion					= null						,
		Up_Wait						= 45						,
		Up_MissPop					= false						,
		Down_Effect					= null						,
		Down_Motion					= MOT_DAMAGE				,
		Down_Wait					= 45						,
		Down_MissPop				= false						,
		Reset_Wait					= 0							,
	},
	// STATUS_NOTICE_DEATH		���S�\��
	{	Name						= "STATUS_NOTICE_DEATH"		,
		Up_Effect					= null						,
		Up_Motion					= null						,
		Up_Wait						= 45						,
		Up_MissPop					= false						,
		Down_Effect					= null						,
		Down_Motion					= MOT_DAMAGE				,
		Down_Wait					= 45						,
		Down_MissPop				= false						,
		Reset_Wait					= 0							,
	},
	// STATUS_GUARD				�h��
	{	Name						= "STATUS_GUARD"			,
		Up_Effect					= null						,
		Up_Motion					= null						,
		Up_Wait						= 45						,
		Up_MissPop					= false						,
		Down_Effect					= null						,
		Down_Motion					= MOT_DAMAGE				,
		Down_Wait					= 45						,
		Down_MissPop				= false						,
		Reset_Wait					= 0							,
	},	
	// STATUS_DUMMY_02			��h��
	{	Name						= "STATUS_DUMMY_02"			,
		Up_Effect					= null						,
		Up_Motion					= null						,
		Up_Wait						= 45						,
		Up_MissPop					= false						,
		Down_Effect					= null						,
		Down_Motion					= MOT_DAMAGE				,
		Down_Wait					= 45						,
		Down_MissPop				= false						,
		Reset_Wait					= 0							,
	},
	// STATUS_DESPERATE			�_���[�W�Q�{(�̂Đg)
	{	Name						= "STATUS_DESPERATE"		,
		Up_Effect					= null						,
		Up_Motion					= null						,
		Up_Wait						= 45						,
		Up_MissPop					= false						,
		Down_Effect					= null						,
		Down_Motion					= MOT_DAMAGE				,
		Down_Wait					= 45						,
		Down_MissPop				= false						,
		Reset_Wait					= 0							,
	},
	// STATUS_INHALEBREATH		���_���[�W�␳
	{	Name						= "STATUS_INHALEBREATH"		,
		Up_Effect					= null						,
		Up_Motion					= null						,
		Up_Wait						= 45						,
		Up_MissPop					= false						,
		Down_Effect					= null						,
		Down_Motion					= MOT_DAMAGE				,
		Down_Wait					= 45						,
		Down_MissPop				= false						,
		Reset_Wait					= 30						,
		Reset_Wait					= 0							,
	},
	// STATUS_ATACANTA			��������
	{	Name						= "STATUS_ATACANTA"			,
		Up_Effect					= null						,
		Up_Motion					= null						,
		Up_Wait						= 0							,
		Up_MissPop					= false						,
		Down_Effect					= null						,
		Down_Motion					= MOT_DAMAGE				,
		Down_Wait					= 0							,
		Down_MissPop				= false						,
		Reset_Wait					= 0							,
	},
	// STATUS_MAHOCANTA			��������	
	{	Name						= "STATUS_MAHOCANTA"		,
		Up_Effect					= null						,
		Up_Motion					= null						,
		Up_Wait						= 45						,
		Up_MissPop					= false						,
		Down_Effect					= null						,
		Down_Motion					= MOT_DAMAGE				,
		Down_Wait					= 0							,
		Down_MissPop				= false						,
		Reset_Wait					= 0							,
	},
	// STATUS_TENCHI			��������(�P��)
	{	Name						= "STATUS_TENCHI"			,
		Up_Effect					= null						,
		Up_Motion					= null						,
		Up_Wait						= 45						,
		Up_MissPop					= false						,
		Down_Effect					= null						,
		Down_Motion					= MOT_DAMAGE				,
		Down_Wait					= 0							,
		Down_MissPop				= false						,
		Reset_Wait					= 0							,
	},
	// STATUS_MAHOTURN			��������(�P��)
	{	Name						= "STATUS_MAHOTURN"			,
		Up_Effect					= null						,
		Up_Motion					= null						,
		Up_Wait						= 45						,
		Up_MissPop					= false						,
		Down_Effect					= null						,
		Down_Motion					= MOT_DAMAGE				,
		Down_Wait					= 0							,
		Down_MissPop				= false						,
		Reset_Wait					= 0							,
	},
	// STATUS_KYOTENDOCHI		�̋Z����(�P��)
	{	Name						= "STATUS_KYOTENDOCHI"		,
		Up_Effect					= null						,
		Up_Motion					= null						,
		Up_Wait						= 45						,
		Up_MissPop					= false						,
		Down_Effect					= null						,
		Down_Motion					= MOT_DAMAGE				,
		Down_Wait					= 0							,
		Down_MissPop				= false						,
		Reset_Wait					= 0							,
	},
	// STATUS_REVERSEWIND		������(���)
	{	Name						= "STATUS_REVERSEWIND"		,
		Up_Effect					= null						,
		Up_Motion					= null						,
		Up_Wait						= 45						,
		Up_MissPop					= false						,
		Down_Effect					= null						,
		Down_Motion					= MOT_DAMAGE				,
		Down_Wait					= 0							,
		Down_MissPop				= false						,
		Reset_Wait					= 0							,
	},
	// STATUS_REVERSETURN		�x�蔽��(���)
	{	Name						= "STATUS_REVERSETURN"		,
		Up_Effect					= null						,
		Up_Motion					= null						,
		Up_Wait						= 45						,
		Up_MissPop					= false						,
		Down_Effect					= null						,
		Down_Motion					= MOT_DAMAGE				,
		Down_Wait					= 0							,
		Down_MissPop				= false						,
		Reset_Wait					= 0							,
	},
	// STATUS_PREDICT_PHYSICAL	�����\��
	{	Name						= "STATUS_PREDICT_PHYSICAL"	,
		Up_Effect					= null						,
		Up_Motion					= null						,
		Up_Wait						= 45						,
		Up_MissPop					= false						,
		Down_Effect					= null						,
		Down_Motion					= MOT_DAMAGE				,
		Down_Wait					= 0							,
		Down_MissPop				= false						,
		Reset_Wait					= 0							,
	},
	// STATUS_PREDICT_SPELL		�����\��
	{	Name						= "STATUS_PREDICT_SPELL"	,
		Up_Effect					= null						,
		Up_Motion					= null						,
		Up_Wait						= 45						,
		Up_MissPop					= false						,
		Down_Effect					= null						,
		Down_Motion					= MOT_DAMAGE				,
		Down_Wait					= 0							,
		Down_MissPop				= false						,
		Reset_Wait					= 0							,
	},
	// STATUS_PREDICT_ARTS		�̋Z�\��
	{	Name						= "STATUS_PREDICT_ARTS"		,
		Up_Effect					= null						,
		Up_Motion					= null						,
		Up_Wait						= 45						,
		Up_MissPop					= false						,
		Down_Effect					= null						,
		Down_Motion					= MOT_DAMAGE				,
		Down_Wait					= 0							,
		Down_MissPop				= false						,
		Reset_Wait					= 0							,
	},
	// STATUS_PREDICT_BREATH	���\��
	{	Name						= "STATUS_PREDICT_ARTS"		,
		Up_Effect					= null						,
		Up_Motion					= null						,
		Up_Wait						= 45						,
		Up_MissPop					= false						,
		Down_Effect					= null						,
		Down_Motion					= MOT_DAMAGE				,
		Down_Wait					= 0							,
		Down_MissPop				= false						,
		Reset_Wait					= 0							,
	},
	// STATUS_PREDICT_DANCE		�x��\��	
	{	Name						= "STATUS_PREDICT_DANCE"	,
		Up_Effect					= null						,
		Up_Motion					= null						,
		Up_Wait						= 45						,
		Up_MissPop					= false						,
		Down_Effect					= null						,
		Down_Motion					= MOT_DAMAGE				,
		Down_Wait					= 0							,
		Down_MissPop				= false						,
		Reset_Wait					= 0							,
	},
	// STATUS_PREDICT_RECORD	�L�^����	
	{	Name						= "STATUS_PREDICT_RECORD"	,
		Up_Effect					= null						,
		Up_Motion					= null						,
		Up_Wait						= 45						,
		Up_MissPop					= false						,
		Down_Effect					= null						,
		Down_Motion					= MOT_DAMAGE				,
		Down_Wait					= 0							,
		Down_MissPop				= false						,
		Reset_Wait					= 0							,
	},
	// STATUS_PREDICT_FIELD		���ԗ\��
	{	Name						= "STATUS_PREDICT_FIELD"	,
		Up_Effect					= null						,
		Up_Motion					= null						,
		Up_Wait						= 45						,
		Up_MissPop					= false						,
		Down_Effect					= null						,
		Down_Motion					= MOT_DAMAGE				,
		Down_Wait					= 0							,
		Down_MissPop				= false						,
		Reset_Wait					= 0							,
	},
	// STATUS_ASTRON			���ʖ���
	{	Name						= "STATUS_ASTRON"			,
		Up_Effect					= null						,
		Up_Motion					= null						,
		Up_Wait						= 45						,
		Up_MissPop					= false						,
		Down_Effect					= null						,
		Down_Motion					= MOT_DAMAGE				,
		Down_Wait					= 0							,
		Down_MissPop				= false						,
		Reset_Wait					= 0							,
	},
	// STATUS_CURTAIN			���ʖ����i1�����j
	{	Name						= "STATUS_CURTAIN"			,
		Up_Effect					= null						,
		Up_Motion					= null						,
		Up_Wait						= 45						,
		Up_MissPop					= false						,
		Down_Effect					= null						,
		Down_Motion					= MOT_DAMAGE				,
		Down_Wait					= 0							,
		Down_MissPop				= false						,
		Reset_Wait					= 0							,
	},
	// STATUS_SWAPTARGET		�Ώی���
	{	Name						= "STATUS_SWAPTARGET"		,
		Up_Effect					= null						,
		Up_Motion					= null						,
		Up_Wait						= 45						,
		Up_MissPop					= false						,
		Down_Effect					= null						,
		Down_Motion					= MOT_DAMAGE				,
		Down_Wait					= 0							,
		Down_MissPop				= false						,
		Reset_Wait					= 0							,
	},
	// STATUS_REHOIMI			�p����
	{	Name						= "STATUS_REHOIMI"			,
		Up_Effect					= null						,
		Up_Motion					= null						,
		Up_Wait						= 45						,
		Up_MissPop					= false						,
		Down_Effect					= null						,
		Down_Motion					= MOT_DAMAGE				,
		Down_Wait					= 0							,
		Down_MissPop				= false						,
		Reset_Wait					= 0							,
	},
	// STATUS_REZAORAL			�����h��
	{	Name						= "STATUS_REZAORAL"			,
		Up_Effect					= null						,
		Up_Motion					= null						,
		Up_Wait						= 45						,
		Up_MissPop					= false						,
		Down_Effect					= null						,
		Down_Motion					= MOT_DAMAGE				,
		Down_Wait					= 0							,
		Down_MissPop				= false						,
		Reset_Wait					= 0							,
	},	
	// STATUS_DUMMY_03			��������
	{	Name						= "STATUS_DUMMY_03"			,
		Up_Effect					= null						,
		Up_Motion					= null						,
		Up_Wait						= 45						,
		Up_MissPop					= false						,
		Down_Effect					= null						,
		Down_Motion					= MOT_DAMAGE				,
		Down_Wait					= 0							,
		Down_MissPop				= false						,
		Reset_Wait					= 0							,
	},
	// STATUS_DUMMY_04			��������
	{	Name						= "STATUS_DUMMY_04"			,
		Up_Effect					= null						,
		Up_Motion					= null						,
		Up_Wait						= 45						,
		Up_MissPop					= false						,
		Down_Effect					= null						,
		Down_Motion					= MOT_DAMAGE				,
		Down_Wait					= 0							,
		Down_MissPop				= false						,
		Reset_Wait					= 0							,
	},
	// STATUS_DUMMY_05			�̋Z����
	{	Name						= "STATUS_DUMMY_05"			,
		Up_Effect					= null						,
		Up_Motion					= null						,
		Up_Wait						= 45						,
		Up_MissPop					= false						,
		Down_Effect					= null						,
		Down_Motion					= MOT_DAMAGE				,
		Down_Wait					= 0							,
		Down_MissPop				= false						,
		Reset_Wait					= 0							,
	},
	// STATUS_DUMMY_06			�񕜖���
	{	Name						= "STATUS_DUMMY_06"			,
		Up_Effect					= null						,
		Up_Motion					= null						,
		Up_Wait						= 45						,
		Up_MissPop					= false						,
		Down_Effect					= null						,
		Down_Motion					= MOT_DAMAGE				,
		Down_Wait					= 0							,
		Down_MissPop				= false						,
		Reset_Wait					= 0							,
	},
	// STATUS_DUMMY_07			�������
	{	Name						= "STATUS_DUMMY_07"			,
		Up_Effect					= null						,
		Up_Motion					= null						,
		Up_Wait						= 45						,
		Up_MissPop					= false						,
		Down_Effect					= null						,
		Down_Motion					= MOT_DAMAGE				,
		Down_Wait					= 0							,
		Down_MissPop				= false						,
		Reset_Wait					= 0							,
	},
	// STATUS_DUMMY_08			�s�����t�]
	{	Name						= "STATUS_DUMMY_08"			,
		Up_Effect					= null						,
		Up_Motion					= null						,
		Up_Wait						= 45						,
		Up_MissPop					= false						,
		Down_Effect					= null						,
		Down_Motion					= MOT_DAMAGE				,
		Down_Wait					= 0							,
		Down_MissPop				= false						,
		Reset_Wait					= 0							,
	},
	// STATUS_DUMMY_09			�s���������_��
	{	Name						= "STATUS_DUMMY_09"			,
		Up_Effect					= null						,
		Up_Motion					= null						,
		Up_Wait						= 45						,
		Up_MissPop					= false						,
		Down_Effect					= null						,
		Down_Motion					= MOT_DAMAGE				,
		Down_Wait					= 0							,
		Down_MissPop				= false						,
		Reset_Wait					= 0							,
	},
	// STATUS_DUMMY_10			�s���񐔐���
	{	Name						= "STATUS_DUMMY_10"			,
		Up_Effect					= null						,
		Up_Motion					= null						,
		Up_Wait						= 45						,
		Up_MissPop					= false						,
		Down_Effect					= null						,
		Down_Motion					= MOT_DAMAGE				,
		Down_Wait					= 0							,
		Down_MissPop				= false						,
		Reset_Wait					= 0							,
	},
	// STATUS_CHAIN				�s�����A��
	{	Name						= "STATUS_CHAIN"			,
		Up_Effect					= null						,
		Up_Motion					= null						,
		Up_Wait						= 45						,
		Up_MissPop					= false						,
		Down_Effect					= null						,
		Down_Motion					= MOT_DAMAGE				,
		Down_Wait					= 0							,
		Down_MissPop				= false						,
		Reset_Wait					= 0							,
	},
	// STATUS_DECREACE_ATTACK	�U���͌���
	{	Name						= "STATUS_DECREACE_ATTACK"	,
		Up_Effect					= null						,
		Up_Motion					= null						,
		Up_Wait						= 45						,
		Up_MissPop					= false						,
		Down_Effect					= null						,
		Down_Motion					= MOT_DAMAGE				,
		Down_Wait					= 45						,
		Down_MissPop				= false						,
		Reset_Wait					= 0							,
	},
	// STATUS_DECREACE_DEFENCE	����͌���
	{	Name						= "STATUS_DECREACE_DEFENCE"	,
		Up_Effect					= null						,
		Up_Motion					= null						,
		Up_Wait						= 45						,
		Up_MissPop					= false						,
		Down_Effect					= null						,
		Down_Motion					= MOT_DAMAGE				,
		Down_Wait					= 45						,
		Down_MissPop				= false						,
		Reset_Wait					= 0							,
	},
	// STATUS_DECREACE_SPEED	�f��������
	{	Name						= "STATUS_DECREACE_SPEED"	,
		Up_Effect					= null						,
		Up_Motion					= null						,
		Up_Wait						= 45						,
		Up_MissPop					= false						,
		Down_Effect					= null						,
		Down_Motion					= MOT_DAMAGE				,
		Down_Wait					= 45						,
		Down_MissPop				= false						,
		Reset_Wait					= 0							,
	},
	// STATUS_DECREACE_WISE		��������
	{	Name						= "STATUS_DECREACE_WISE"	,
		Up_Effect					= null						,
		Up_Motion					= null						,
		Up_Wait						= 45						,
		Up_MissPop					= false						,
		Down_Effect					= null						,
		Down_Motion					= MOT_DAMAGE				,
		Down_Wait					= 45						,
		Down_MissPop				= false						,
		Reset_Wait					= 0							,
	},
	// STATUS_ANGRY				�{��
	{	Name						= "STATUS_ANGRY"			,
		Up_Effect					= null						,
		Up_Motion					= null						,
		Up_Wait						= 45						,
		Up_MissPop					= false						,
		Down_Effect					= null						,
		Down_Motion					= MOT_DAMAGE				,
		Down_Wait					= 0							,
		Down_MissPop				= false						,
		Reset_Wait					= 0							,
	},
	// STATUS_LUCKY				���b�L�[
	{	Name						= "STATUS_LUCKY"			,
		Up_Effect					= null						,
		Up_Motion					= null						,
		Up_Wait						= 45						,
		Up_MissPop					= false						,
		Down_Effect					= null						,
		Down_Motion					= MOT_DAMAGE				,
		Down_Wait					= 0							,
		Down_MissPop				= false						,
		Reset_Wait					= 0							,
	},
	// STATUS_SUPERLUCKY		�X�[�p�[���b�L�[
	{	Name						= "STATUS_SUPERLUCKY"		,
		Up_Effect					= null						,
		Up_Motion					= null						,
		Up_Wait						= 45						,
		Up_MissPop					= false						,
		Down_Effect					= null						,
		Down_Motion					= MOT_DAMAGE				,
		Down_Wait					= 0							,
		Down_MissPop				= false						,
		Reset_Wait					= 0							,
	},
	// STATUS_UNLUCKY			�A�����b�L�[
	{	Name						= "STATUS_UNLUCKY"			,
		Up_Effect					= null						,
		Up_Motion					= null						,
		Up_Wait						= 45						,
		Up_MissPop					= false						,
		Down_Effect					= null						,
		Down_Motion					= MOT_DAMAGE				,
		Down_Wait					= 0							,
		Down_MissPop				= false						,
		Reset_Wait					= 0							,
	},
	// STATUS_DEADACTION		 ���S���s��
	{	Name						= "STATUS_DEADACTION"		,
		Up_Effect					= null						,
		Up_Motion					= null						,
		Up_Wait						= 45						,
		Up_MissPop					= false						,
		Down_Effect					= null						,
		Down_Motion					= MOT_DAMAGE				,
		Down_Wait					= 0							,
		Down_MissPop				= false						,
		Reset_Wait					= 0							,
	},
	// STATUS_DUMMY_11			���₵�̉J�i�������j
	{	Name						= "STATUS_DUMMY_11"			,
		Up_Effect					= null						,
		Up_Motion					= null						,
		Up_Wait						= 45						,
		Up_MissPop					= false						,
		Down_Effect					= null						,
		Down_Motion					= MOT_DAMAGE				,
		Down_Wait					= 0							,
		Down_MissPop				= false						,
		Reset_Wait					= 0							,
	},
	// STATUS_DUMMY_12			�����ꂢ�̂����i�������j
	{	Name						= "STATUS_DUMMY_12"			,
		Up_Effect					= null						,
		Up_Motion					= null						,
		Up_Wait						= 45						,
		Up_MissPop					= false						,
		Down_Effect					= null						,
		Down_Motion					= MOT_DAMAGE				,
		Down_Wait					= 0							,
		Down_MissPop				= false						,
		Reset_Wait					= 0							,
	},
	// STATUS_STEALTHATTACK		�X�e���X�A�^�b�N�i�������j
	{	Name						= "STATUS_STEALTHATTACK"	,
		Up_Effect					= null						,
		Up_Motion					= null						,
		Up_Wait						= 45						,
		Up_MissPop					= false						,
		Down_Effect					= null						,
		Down_Motion					= MOT_DAMAGE				,
		Down_Wait					= 0							,
		Down_MissPop				= false						,
		Reset_Wait					= 0							,
	},
	// STATUS_DUMMY_14			������Ȃ��i�������j
	{	Name						= "STATUS_DUMMY_14"			,
		Up_Effect					= null						,
		Up_Motion					= null						,
		Up_Wait						= 45						,
		Up_MissPop					= false						,
		Down_Effect					= null						,
		Down_Motion					= MOT_DAMAGE				,
		Down_Wait					= 0							,
		Down_MissPop				= false						,
		Reset_Wait					= 0							,
	},
	// STATUS_DUMMY_15			��������Â��i�������j
	{	Name						= "STATUS_DUMMY_15"			,
		Up_Effect					= null						,
		Up_Motion					= null						,
		Up_Wait						= 45						,
		Up_MissPop					= false						,
		Down_Effect					= null						,
		Down_Motion					= MOT_DAMAGE				,
		Down_Wait					= 0							,
		Down_MissPop				= false						,
		Reset_Wait					= 0							,
	},
	// STATUS_HEALINGE_FLUTE	���₵�̂ӂ��i�������j
	{	Name						= "STATUS_HEALINGE_FLUTE"	,
		Up_Effect					= null						,
		Up_Motion					= null						,
		Up_Wait						= 45						,
		Up_MissPop					= false						,
		Down_Effect					= null						,
		Down_Motion					= MOT_DAMAGE				,
		Down_Wait					= 0							,
		Down_MissPop				= false						,
		Reset_Wait					= 0							,
	},
	// STATUS_REPOS_EFLUTE		�₷�炬�̂ӂ��i�������j
	{	Name						= "STATUS_REPOS_EFLUTE"		,
		Up_Effect					= null						,
		Up_Motion					= null						,
		Up_Wait						= 45						,
		Up_MissPop					= false						,
		Down_Effect					= null						,
		Down_Motion					= MOT_DAMAGE				,
		Down_Wait					= 0							,
		Down_MissPop				= false						,
		Reset_Wait					= 0							,
	},
	// STATUS_FIGHT_FLUTE		���������̂ӂ��i�������j
	{	Name						= "STATUS_FIGHT_FLUTE"		,
		Up_Effect					= null						,
		Up_Motion					= null						,
		Up_Wait						= 45						,
		Up_MissPop					= false						,
		Down_Effect					= null						,
		Down_Motion					= MOT_DAMAGE				,
		Down_Wait					= 0							,
		Down_MissPop				= false						,
		Reset_Wait					= 0							,
	},
	// STATUS_GUARD_FLUTE		�܂���̂ӂ��i�������j
	{	Name						= "STATUS_GUARD_FLUTE"		,
		Up_Effect					= null						,
		Up_Motion					= null						,
		Up_Wait						= 45						,
		Up_MissPop					= false						,
		Down_Effect					= null						,
		Down_Motion					= MOT_DAMAGE				,
		Down_Wait					= 0							,
		Down_MissPop				= false						,
		Reset_Wait					= 0							,
	},
	// STATUS_FALCON_FLUTE		�n���u�T�̂ӂ��i�������j
	{	Name						= "STATUS_FALCON_FLUTE"		,
		Up_Effect					= null						,
		Up_Motion					= null						,
		Up_Wait						= 45						,
		Up_MissPop					= false						,
		Down_Effect					= null						,
		Down_Motion					= MOT_DAMAGE				,
		Down_Wait					= 0							,
		Down_MissPop				= false						,
		Reset_Wait					= 0							,
	},
	// STATUS_WISE_FLUTE		�������̂ӂ��i�������j
	{	Name						= "STATUS_WISE_FLUTE"		,
		Up_Effect					= null						,
		Up_Motion					= null						,
		Up_Wait						= 45						,
		Up_MissPop					= false						,
		Down_Effect					= null						,
		Down_Motion					= MOT_DAMAGE				,
		Down_Wait					= 0							,
		Down_MissPop				= false						,
		Reset_Wait					= 0							,
	}
];

//�����X�^�[��{���N���X
class cMonsterInfo
{
	Index = INVALID_CHARACTER;	//�����X�^�[�C���f�b�N�X
	AllyFlag = false;			//�G��������
	Type = LIVETYPE.NONE;		//������Ԕ���
	Size = SIZE_S;				//�����X�^�[�T�C�Y
	IsRide = false;				//���C�h����
	EffectSize = 1.0			//�G�t�F�N�g�A�^�b�`���̔{��
	HighRankEffectSize = 1.0	//��]�����̃G�t�F�N�g�T�C�Y
	BigSizeFlag = false			//GSize�ȏォ�H
	PopDate_X = 0				//Pop�\���ʒu(X)
	PopDate_Y = 0				//Pop�\���ʒu(Y)
	constructor(Monster)
	{
		//DebugPrint("Class_ConstructorIN" + "_" + "cMonsterInfo");
		Index = Monster;
		if(Monster != INVALID_CHARACTER){
			AllyFlag = IsAlly_(Monster);
			Type = GetInitExistType_(Monster);
			if(Type != LIVETYPE.NONE){
				Size = GetMonsterSize_(Monster);
			}
			switch(Size)
			{
			case SIZE_S:
				EffectSize = 0.4;
				break;
			case SIZE_N:
				EffectSize = 0.6;
				break;
			case SIZE_M:
				EffectSize = 1.0;
				break;
			case SIZE_G:
				EffectSize = 2.0;
				break;
			case SIZE_T:
				EffectSize = 2.4;
				break;
			default:
				break
			}
		}
		
		IsRide = IsRide_(Monster)
		
		//BigSizeFlag
		if(Size == SIZE_G || Size == SIZE_T){
			BigSizeFlag = true;
		}
		//HighRankEffectSize
		switch(Size)
		{
		case SIZE_S:
			HighRankEffectSize = 0.4;
			break;
		case SIZE_N:
			HighRankEffectSize = 0.6;
			break;
		case SIZE_M:
			HighRankEffectSize = 1.0;
			break;
		case SIZE_G:
			HighRankEffectSize = 3.7;
			break;
		case SIZE_T:
			HighRankEffectSize = 11.0;
			break;
		default:
			break
		}
		
		//PopDate
		switch(Size)
		{
		case SIZE_S:
			local BaseY = 40;
			local UpY = 18;
			PopDate_X = [0	,-20 , 20 ,-20 , 20	,-20];
			PopDate_Y = [BaseY ,BaseY + UpY , BaseY + (UpY*2) , BaseY + (UpY*3) ,BaseY + (UpY*4) ,BaseY + (UpY*5)];
			break;
		case SIZE_N:
			local BaseY = 55;
			local UpY = 18;
			PopDate_X = [0	,-20 , 20 ,-20 , 20	,-20];
			PopDate_Y = [BaseY ,BaseY + UpY , BaseY + (UpY*2) , BaseY + (UpY*3) ,BaseY + (UpY*4) ,BaseY + (UpY*5)];
			break;
		case SIZE_M:
			local BaseY = 65;
			local UpY = 18;
			PopDate_X = [0	,-20 , 20 ,-20 , 20	,-20];
			PopDate_Y = [BaseY ,BaseY + UpY , BaseY + (UpY*2) , BaseY + (UpY*3) ,BaseY + (UpY*4) ,BaseY + (UpY*5)];
			break;
		case SIZE_G:
			local BaseY = 50;
			local UpY = 18;
			PopDate_X = [0	,-20 , 20 ,-20 , 20	,-20];
			PopDate_Y = [BaseY ,BaseY + UpY , BaseY + (UpY*2) , BaseY + (UpY*3) ,BaseY + (UpY*4) ,BaseY + (UpY*5)];
			break;
		case SIZE_T:
			local BaseY = 50;
			local UpY = 18;
			PopDate_X = [0	,-20 , 20 ,-20 , 20	,-20];
			PopDate_Y = [BaseY ,BaseY + UpY , BaseY + (UpY*2) , BaseY + (UpY*3) ,BaseY + (UpY*4) ,BaseY + (UpY*5)];
			break;
		default:
			break
		}
		
		//DebugPrint("Class_ConstructorOUT" + "_" + "cMonsterInfo");
	}
}

//�����X�^�[�A�N�V�������N���X
class cTargetMonsterInfo extends cMonsterInfo
{
	//�A�N�V��������p
	IndexIs = -1;			//Is����p�C���f�b�N�X
	IsCritical = null;		//�N���e�B�J������
	IsMiss = null;			//�~�X����
	IsDead = null;			//���S����
	IsGuard = null;			//�h�䔻��
	IsAbsorption = null;	//�z������
	IsReflect = null;		//���˔���
	IsRevival = null;		//�h������
	GetActHitNum = 0;		//�_���[�W��
	SingleFlag = false 		//�P��Ώۂ̋Z���H
	IsPoisonDamage = null;	//�Ń_���[�W����
	DamageValue	= null;		//�_���[�W�l
	StatusFlag = null;		//�X�e�[�^�X�ω�����
	StatusValue = null;		//�X�e�[�^�X�ω���
	StatusEndFlag = null;	//�X�e�[�^�X��������
	MultiStageCount	= 1;	//���i�U�����萔
	
	constructor(Monster,MultiCount)
	{
		//DebugPrint("Class_ConstructorIN" + "_" + "cTargetMonsterInfo");
		
		if(Monster != INVALID_CHARACTER){
			//�N���X�̌p��
			cMonsterInfo.constructor(Monster);
			//�g�p����N���X�̓Ǎ�
			local Count = 0;
			local ActNum;
			
			//IndexIs�̍쐬
			//�P�̑Ώۂ̏ꍇ�͋����I��0��Ԃ�
			local SingleFlag = IsTargetSingle_(MultiCount);
			if(SingleFlag == true){
				local TargetCheck= GetTargetIndex_(MultiCount, 0);
				if(Monster == TargetCheck){
					IndexIs = 0;
				} else {
					IndexIs = -1;
					////DebugPrint("***************************************" + "\n");
					////DebugPrint("IndexIs�ݒ�G���[" + "\n");
					////DebugPrint("	Monster		:	" + Monster + "\n");
					////DebugPrint("	IndexIs		:	" + IndexIs + "\n");
					////DebugPrintt("	TargetCheck	:	" + TargetCheck + "\n");
					////DebugPrint("***************************************");
				}
			} else {
				local TargetNum = GetTargetNum_(MultiCount);
				local localTarget		= array(TargetNum);
				local localType			= array(TargetNum);
				local localStealthValue	= array(TargetNum);
				for(local i = 0 ; i < TargetNum ; i++ ){
					localTarget[i]			= GetTargetIndex_(MultiCount,i);
					localType[i]			= GetInitExistType_(localTarget[i]);
					localStealthValue[i]	= GetMonsterStatusValue_(STATUS.STEALTHATTACK,localTarget[i]);
					if(Monster > localTarget[i] && localType[i] == LIVETYPE.ACTIVE){
						//IndexIs�ŃJ�E���g���Ȃ��̂�
						//������MonsterIndex�����
						//�܂��́A����ł��郂���X�^�[�̏ꍇ
						Count++;
					} else if(Monster > localTarget[i] && localStealthValue[i] == 1){
						//��O�I�ɃX�e���X��Ԃ̃����X�^�[�̓J�E���g����
						Count++;
					}
				}
				IndexIs = Count;
			}
			
			MultiStageCount = GetActHitNum_(MultiCount, IndexIs);
			
			if(MultiStageCount > 0){
				IsCritical		= array(MultiStageCount);	//�N���e�B�J������
				IsMiss			= array(MultiStageCount);	//�~�X����
				IsDead			= array(MultiStageCount);	//���S����
				IsGuard			= array(MultiStageCount);	//�h�䔻��
				IsAbsorption	= array(MultiStageCount);	//�z������
				IsReflect		= array(MultiStageCount);	//���˔���
				IsRevival		= array(MultiStageCount);	//�h������
				IsPoisonDamage	= array(MultiStageCount);	//�Ń_���[�W����
				DamageValue		= array(MultiStageCount);	//�_���[�W�l
				for(local i = 0 ; i < MultiStageCount ; i++){
					IsMiss[i]			= IsMiss_(MultiCount,IndexIs,i);
					IsCritical[i]		= IsCritical_(MultiCount,IndexIs,i);
					IsDead[i]			= IsDead_(MultiCount,IndexIs);
					IsAbsorption[i]		= IsAbsorb_(MultiCount , IndexIs);
					IsGuard[i]			= IsGuard_(MultiCount, IndexIs);
					IsReflect[i]		= IsReflect_(MultiCount, IndexIs);
					IsRevival[i]		= IsRevival_(MultiCount, IndexIs);
					IsPoisonDamage[i]	= IsPoisonDamage_(MultiCount, IndexIs);
					DamageValue[i]		= GetDamageValue_(MultiCount,IndexIs,i);
				}
			}
			
			if(MultiStageCount == 0){
				IsCritical		= array(1);					//�N���e�B�J������
				IsMiss			= array(1);					//�~�X����
				IsDead			= array(1);					//���S����
				IsGuard			= array(1);					//�h�䔻��
				IsAbsorption	= array(1);					//�z������
				IsReflect		= array(1);					//���˔���
				IsRevival		= array(1);					//�h������
				IsPoisonDamage	= array(1);					//�Ń_���[�W����
				DamageValue		= array(1);					//�_���[�W�l
				//GetActHitNum���u�O�v�̏ꍇ�́A��O�I�Ƀ_�~�[�̒l������
				//�����n�Ŕ�������H
				IsMiss[0]		= IsMiss_(MultiCount,IndexIs,0);
				IsCritical[0]	= IsCritical_(MultiCount,IndexIs,0);
				IsDead[0]		= IsDead_(MultiCount,IndexIs);
				IsAbsorption[0]	= IsAbsorb_(MultiCount,IndexIs);	//���肪�Ȃ��̂ň�U�ۗ�
				IsGuard[0]		= IsGuard_(MultiCount, IndexIs);
				IsReflect[0]	= IsReflect_(MultiCount, IndexIs);
				IsRevival[0]	= IsRevival_(MultiCount, IndexIs);
				DamageValue[0]	= GetDamageValue_(MultiCount,IndexIs,0);
			}
			
			StatusFlag		= array(STATUS_NUM);
			StatusValue		= array(STATUS_NUM);
			StatusEndFlag	= array(STATUS_NUM);
			for(local i = STATUS_TOP ; i < STATUS_NUM ; i++){
				StatusFlag[i] = GetStatusFlag_(i,MultiCount,IndexIs);
				StatusValue[i] = GetStatusValue_(i,MultiCount,IndexIs);
				StatusEndFlag[i] = GetStatusEndFlag_(i,MultiCount,IndexIs);
			}
		} else {
			//Monster���s���Ȓl�̏ꍇ�͉����s��Ȃ��B
			print("++++++++++++++++++++++++" + "\n")
			print("     ERROR     " + "\n")
			print("cTargetMonsterInfo" + "\n")
			print("    ArgumentList" + "\n")
			print("       => " + "Monster    : " + Monster + "\n")
			print("       => " + "MultiCount : " + MultiCount +"\n")
			print("++++++++++++++++++++++++" + "\n")
		}
		//DebugPrint("Class_ConstructorOUT" + "_" + "cTargetMonsterInfo");
	}
	
}

//�p�[�e�B���N���X
class cPartyInfo
{
	AllyFlag = false;			//�G��������
	PartyNum = 0;				//�p�[�e�B�l��
	PartyType = 0;				//�p�[�e�B�\�� �֐��FGet_ParyType�Őݒ�
								// 0	:	S4
								// 1	:	S3
								// 2	:	S2
								// 3	:	S1
								// 4	:	SG
								// 5	:	G1
								// 6	:	T1
	Index = null;				//�����X�^�[�C���f�b�N�X
	Type = null;				//������Ԕ���
	Size = null;				//�T�C�Y
	IsRide = null				//���C�h��Ԃ�����
	IsPartyRide = false			//�p�[�e�B���Ƀ��C�h��Ԃ̃����X�^�[�����邩�H
	SFlag = false;				//�p�[�e�B���ɂr�����邩����
	NFlag = false;				//�p�[�e�B���ɂm�����邩����
	MFlag = false;				//�p�[�e�B���ɂl�����邩����
	GFlag = false;				//�p�[�e�B���ɂf�����邩����
	TFlag = false;				//�p�[�e�B���ɂs�����邩����
	Empty = null;				//�S�̔z�u����Empty
	Empty_Substitute = null;	//�S�̔z�u���݂̂����ΏۊOEmpty
	Rotate = null;				//�S�̔z�u���̌���
	UpCam = null;				//�S�̔z�u���̒P�̕\��CameraEmpty
	UpCamTgt = null;			//�S�̔z�u���̒P�̕\��CameraTargetEmpty
	CamEmpty_Area = 0;			//�S�̕\�����̑S�̕\��CameraEmpty
	CamTgtEmpty_Area = 0;		//�S�̕\�����̑S�̕\��CameraTargetEmpty
	CamEmpty_God = 0;			//�S�̔z�u���̑S�̕\��CameraEmpty�iGODHAND�p�j
	CamTgtEmpty_God = 0;		//�S�̔z�u���̑S�̕\��CameraTargetEmpty�iGODHAND�p�j
	Empty_Master = null;		//�S�̔z�u���̃}�X�^�[��Empty
	Rotate_Master = null;		//�S�̔z�u���̃}�X�^�[�̌���
	CamEmpty_Master = 0;		//�S�̕\�����̃}�X�^�[�\��CameraEmpty
	CamTgtEmpty_Master = 0;		//�S�̕\�����̃}�X�^�[�\��CameraTargetEmpty
	StandbyCutRunner = null;	//StandbyCut�̃����i�[
	StandbyCutCam = null;		//StandbyCut��CameraEmpty
	StandbyCutCamTgt = null;	//StandbyCut��CameraTargetEmpty
	EffectEmpty_Area = 0;		//�S�̕\������Effect�z�u��Empty�ԍ�
	EffectScale_Area = 1.0;		//�S�̕\������Effect�\���̔{��
	
	Extra = null;				//�p�[�e�B�\�����̃G�L�X�g���̃����X�^�[�C���f�b�N�X
	MasterIndex = null;			//�}�X�^�[�̃C���f�b�N�X
	MasterType = null;			//�}�X�^�[�̎��
	MasterEmpty = null;			//�}�X�^�[�̔z�u���W
	MasterRotate = null;		//�}�X�^�[�̌���
	
	constructor()
	{
		//DebugPrint("Class_ConstructorIN" + "_" + "cPartyInfo");
		//�����̃����X�^�[�̓����X�^�[�C���f�b�N�X���w��B�i�P�̂̂݁j
		//����ȊO�͂����Ő�������B
		
		//�z���`�̂��̂�constructor�ōĒ�`�i�������j
		Index				= array(4);		//�����X�^�[�C���f�b�N�X
		Type				= array(4);		//������Ԕ���
		Size				= array(4);		//�T�C�Y
		IsRide				= array(4);		//���C�h��Ԃ�����
		Empty				= array(4);		//�S�̔z�u����Empty
		Empty_Substitute	= array(4);		//�S�̔z�u���݂̂����ΏۊOEmpty
		Rotate				= array(4);		//�S�̔z�u���̌���
		UpCam				= array(4);		//�S�̔z�u���̃A�b�v����CameraEmpty
		UpCamTgt			= array(4);		//�S�̔z�u���̃A�b�v����CameraTargetEmpty
		StandbyCutRunner	= array(4);		//StandbyCut�̃����i�[��Empty;
		StandbyCutCam		= array(4);		//StandbyCut��CameraEmpty;
		StandbyCutCamTgt	= array(4);		//StandbyCut��CameraTargetEmpty;
		Extra				= array(3);		//�p�[�e�B�\�����̃G�L�X�g���̃����X�^�[�C���f�b�N�X
		//DebugPrint("Class_ConstructorOUT" + "_" + "cPartyInfo");
	}
}

//�p�[�e�B�S���̏��N���X
class cFullPartyInfo extends cPartyInfo
{
	
	constructor(Monster)
	{
		//DebugPrint("Class_ConstructorIN" + "_" + "cFullPartyInfo");		
		//�N���X�̌p��
		cPartyInfo.constructor();
		
		if(Monster != INVALID_CHARACTER){
			AllyFlag = IsAlly_(Monster);
			//�p�[�e�B���̎擾
			for(local i = 0 ; i < 4 ; i++){
				if(AllyFlag == true){
					Index[i] = GetAllyIndex_(i);
				} else {
					Index[i] = GetEnemyIndex_(i);
				}
				Type[i] = GetInitExistType_(Index[i]);
				if(Type[i] != LIVETYPE.NONE){
					PartyNum += 1;
					local cMonster = cMonsterInfo(Index[i]);
					Size[i] = cMonster.Size;
					if(Size[i] == SIZE_S){SFlag = true;}
					if(Size[i] == SIZE_N){NFlag = true;}
					if(Size[i] == SIZE_M){MFlag = true;}
					if(Size[i] == SIZE_G){GFlag = true;}
					if(Size[i] == SIZE_T){TFlag = true;}
					IsRide[i]	= cMonster.IsRide;
					if(IsRide[i] == true){
						IsPartyRide = true;
					}
				}
			}
			//�S�̔z�u���s���ۂɐݒ肳��Ă���p�[�e�B�̊�{�ƂȂ�
			//�E�e�����X�^�[��Empty���W	: IndexXXEmpty
			//�E�J������Empty���W		: CamEmpty
			//�E�G�t�F�N�g��Empty���W	: EffectEmpty
			//local cPartyEmpty = cPartyEmptyInfo(Monster);
			
			//�p�[�e�B�^�C�v�̐���
			PartyType = Get_PartyType(AllyFlag);
			
			//�p�[�e�B��Empty�����擾
			for(local i = 0 ; i < PartyNum ; i += 1){
				if(Index[i] != INVALID_CHARACTER){
					local cEmpty = cEmptyInfo(PartyType,Index[i],i);
					Empty[i]			= cEmpty.Empty;
					Empty_Substitute[i]	= cEmpty.Empty_Substitute;
					Rotate[i]			= cEmpty.Rotate;
					//UpCam��[N] / [M] / [����ȊO]�ŕ�����
					if(Size[i] == SIZE_N){
						UpCam[i]	= cEmpty.UpCamN;
						UpCamTgt[i]	= cEmpty.UpCamTgtN;
					} else if(Size[i] == SIZE_M){
						UpCam[i]	= cEmpty.UpCamM;
						UpCamTgt[i]	= cEmpty.UpCamTgtM;
					} else {
						UpCam[i]	= cEmpty.UpCam;
						UpCamTgt[i]	= cEmpty.UpCamTgt;
					}
					StandbyCutRunner[i]	= cEmpty.StandbyCutRunner;
					StandbyCutCam[i]		= cEmpty.StandbyCutCam;
					StandbyCutCamTgt[i]	= cEmpty.StandbyCutCamTgt;
					if(i == 0){
						CamEmpty_Area		= cEmpty.Cam_Area;
						CamTgtEmpty_Area	= cEmpty.CamTgt_Area;
						CamEmpty_God		= cEmpty.Cam_God
						CamTgtEmpty_God		= cEmpty.CamTgt_God
						Empty_Master		= cEmpty.Empty_Master
						Rotate_Master		= cEmpty.Rotate_Master
						CamEmpty_Master		= cEmpty.Cam_Master;
						CamTgtEmpty_Master	= cEmpty.CamTgt_Master;
						EffectEmpty_Area	= cEmpty.EffectEmpty_Area;
						EffectScale_Area	= cEmpty.EffectScale_Area;
					}
				}
				//�G�L�X�g���̐ݒ�
				if(i < PartyNum - 1){	//�{�l�͏����̂�-1
					Extra[i]	= GetExtra(Monster, i);
				}
			}
		} else {
			//Index�����݂��Ȃ��ꍇ�͉������Ȃ�
		}
		
		//�}�X�^�[���
		if(AllyFlag == true){
			MasterIndex		= GetAllyMaster_();
		} else {
			MasterIndex		= GetEnemyMaster_();
		}
		MasterType		= GetMasterKind_(AllyFlag);	//�}�X�^�[�̎��
		
		//DebugPrint("Class_ConstructorOUT" + "_" + "cFullPartyInfo");
	}
}

//�I�����������̃����X�^�[�C���f�b�N�X�݂̂̃p�[�e�B�\��
class cSelectionPartyInfo extends cPartyInfo
{
	constructor(Index00,Index01,Index02,Index03)
	{
		//DebugPrint("Class_" + "ConstructorIN" + "_" + "SelectionPartyInfo");
		//�N���X�̌p��
		cPartyInfo.constructor();
		
		Index = [Index00 , Index01 , Index02 , Index03];
		
		local IndexCheck = false;	//Index��INVALID_CHARACTER�ł͂Ȃ����H
		for(local i = 0 ; i < 4 ; i++){
			if(Index[i] != INVALID_CHARACTER){
				IndexCheck = true;
			}
		}
		
		if(IndexCheck == true){
			//Index�ɉ��炩�����Ă���ꍇ
			for(local i = 0 ; i < 4 ; i += 1){
				if(Index[i] != INVALID_CHARACTER){
					PartyNum += 1;
					Size[i]		= GetMonsterSize_(Index[i]);
					Type[i]		= GetInitExistType_(Index[i]);
					if(Size[i] == SIZE_S){ SFlag = true;}
					if(Size[i] == SIZE_N){ NFlag = true;}
					if(Size[i] == SIZE_M){ MFlag = true;}
					if(Size[i] == SIZE_G){ GFlag = true;}
					if(Size[i] == SIZE_T){ TFlag = true;}
				}
			}
			
			PartyType = Get_SelectionPartyType(Index[0] , Index[1] , Index[2] , Index[3])
			
			//�p�[�e�B��Empty�����擾
			for(local i = 0 ; i < PartyNum ; i += 1){
				if(Index[i] != INVALID_CHARACTER){
					local cEmpty = cEmptyInfo(PartyType,Index[i],i);
					Empty[i]	= cEmpty.Empty;
					Empty_Substitute[i]	= cEmpty.Empty_Substitute;
					Rotate[i]	= cEmpty.Rotate;
					//UpCam��[N] / [M] / [����ȊO]�ŕ�����
					if(Size[i] == SIZE_N){
						UpCam[i]	= cEmpty.UpCamN;
						UpCamTgt[i]	= cEmpty.UpCamTgtN;
					} else if(Size[i] == SIZE_M){
						UpCam[i]	= cEmpty.UpCamM;
						UpCamTgt[i]	= cEmpty.UpCamTgtM;
					} else {
						UpCam[i]	= cEmpty.UpCam;
						UpCamTgt[i]	= cEmpty.UpCamTgt;
					}
					StandbyCutRunner[i]	= cEmpty.StandbyCutRunner;
					StandbyCutCam[i]	= cEmpty.StandbyCutCam;
					StandbyCutCamTgt[i]	= cEmpty.StandbyCutCamTgt;
					if(i == 0){
						CamEmpty_Area = cEmpty.Cam_Area;
						CamTgtEmpty_Area = cEmpty.CamTgt_Area;
						CamEmpty_God		= cEmpty.Cam_God
						CamTgtEmpty_God		= cEmpty.CamTgt_God
						Empty_Master		= cEmpty.Empty_Master
						Rotate_Master		= cEmpty.Rotate_Master
						CamEmpty_Master		= cEmpty.Cam_Master;
						CamTgtEmpty_Master	= cEmpty.CamTgt_Master;
						EffectEmpty_Area = cEmpty.EffectEmpty_Area;
						EffectScale_Area = cEmpty.EffectScale_Area;
					}
				}
			}
		} else {
			//Index���S��INVALID_CHARACTER�̏ꍇ�͉������Ȃ�
		}
		//DebugPrint("Class_" + "ConstructorOUT" + "_" + "SelectionPartyInfo");
	}
}



//Target�Ɏw�肳�ꂽ�����X�^�[�݂̂ō\�������p�[�e�B�\��
class cTargetPartyInfo extends cPartyInfo
{
	constructor(Count)
	{
		//DebugPrint("Class_" + "ConstructorIN" + "_" + "cTargetPartyInfo");
		//�N���X�̌p��
		cPartyInfo.constructor();
		
		local TargetNum = GetTargetNum_(Count);
		for (local i = 0 ; i < 4 ; i += 1 ){
			Index[i]	= GetTargetIndex_(Count,i);
			if(Index[i] != INVALID_CHARACTER){
				Size[i]	= GetMonsterSize_(Index[i]);
				if(Size[i] == SIZE_S){ SFlag = true;}
				if(Size[i] == SIZE_N){ NFlag = true;}
				if(Size[i] == SIZE_M){ MFlag = true;}
				if(Size[i] == SIZE_G){ GFlag = true;}
				if(Size[i] == SIZE_T){ TFlag = true;}
			}
		}
		
		if(TargetNum != 0){
			//local cEmpty =cPartyEmptyInfo(Index[0]);
			local AllyFlag = IsAlly_(Index[0])
			
			PartyType = Get_SelectionPartyType(Index[0],Index[1],Index[2],Index[3])
			
			//�p�[�e�B��Empty�����擾
			for(local i = 0 ; i < TargetNum ; i += 1){
				if(Index[i] != INVALID_CHARACTER){
					local cEmpty = cEmptyInfo(PartyType,Index[i],i);
					Empty[i]	= cEmpty.Empty;
					Empty_Substitute[i]	= cEmpty.Empty_Substitute;
					Rotate[i]	= cEmpty.Rotate;
					//UpCam��[N] / [M] / [����ȊO]�ŕ�����
					if(Size[i] == SIZE_N){
						UpCam[i]	= cEmpty.UpCamN;
						UpCamTgt[i]	= cEmpty.UpCamTgtN;
					} else if(Size[i] == SIZE_M){
						UpCam[i]	= cEmpty.UpCamM;
						UpCamTgt[i]	= cEmpty.UpCamTgtM;
					} else {
						UpCam[i]	= cEmpty.UpCam;
						UpCamTgt[i]	= cEmpty.UpCamTgt;
					}
					StandbyCutRunner[i]	= cEmpty.StandbyCutRunner;
					StandbyCutCam[i]	= cEmpty.StandbyCutCam;
					StandbyCutCamTgt[i]	= cEmpty.StandbyCutCamTgt;
					if(i == 0){
						CamEmpty_Area		= cEmpty.Cam_Area;
						CamTgtEmpty_Area	= cEmpty.CamTgt_Area;
						CamEmpty_God		= cEmpty.Cam_God;
						CamTgtEmpty_God		= cEmpty.CamTgt_God;
						Empty_Master		= cEmpty.Empty_Master
						Rotate_Master		= cEmpty.Rotate_Master
						CamEmpty_Master		= cEmpty.Cam_Master;
						CamTgtEmpty_Master	= cEmpty.CamTgt_Master;
						EffectEmpty_Area = cEmpty.EffectEmpty_Area;
						EffectScale_Area = cEmpty.EffectScale_Area;
					}
				}
			}
		} else {
			//�Ώۂ�0�̂̏ꍇ�͉������Ȃ�
		}
		//DebugPrint("Class_" + "ConstructorOUT" + "_" + "cTargetPartyInfo");
	}
}

//�p�[�e�B�S���̏��N���X
class cAllyFlagPartyInfo extends cPartyInfo
{
	
	constructor(flag)
	{
		//DebugPrint("Class_ConstructorIN" + "_" + "cFullPartyInfo");		
		//�N���X�̌p��
		cPartyInfo.constructor();
		AllyFlag = flag;
		Update(AllyFlag)
	}
	//�p�[�e�B���̎擾
	function Update(AllyFlag)
	{
		for(local i = 0 ; i < 4 ; i++){
			if(AllyFlag == true){
				Index[i] = GetAllyIndex_(i);
			} else {
				Index[i] = GetEnemyIndex_(i);
			}
			Type[i] = GetInitExistType_(Index[i]);
			if(Type[i] != LIVETYPE.NONE){
				PartyNum += 1;
				local cMonster = cMonsterInfo(Index[i]);
				Size[i] = cMonster.Size;
				if(Size[i] == SIZE_S){SFlag = true;}
				if(Size[i] == SIZE_N){NFlag = true;}
				if(Size[i] == SIZE_M){MFlag = true;}
				if(Size[i] == SIZE_G){GFlag = true;}
				if(Size[i] == SIZE_T){TFlag = true;}
				IsRide[i]	= cMonster.IsRide;
				if(IsRide[i] == true){
					IsPartyRide = true;
				}
			}
		}
		//�S�̔z�u���s���ۂɐݒ肳��Ă���p�[�e�B�̊�{�ƂȂ�
		//�E�e�����X�^�[��Empty���W	: IndexXXEmpty
		//�E�J������Empty���W		: CamEmpty
		//�E�G�t�F�N�g��Empty���W	: EffectEmpty
		
		//�p�[�e�B�^�C�v�̐���
		PartyType = Get_PartyType(AllyFlag);
		
		//�p�[�e�B��Empty�����擾
		for(local i = 0 ; i < PartyNum ; i += 1){
			if(Index[i] != INVALID_CHARACTER){
				local cEmpty = cEmptyInfo(PartyType,Index[i],i);
				Empty[i]			= cEmpty.Empty;
				Empty_Substitute[i]	= cEmpty.Empty_Substitute;
				Rotate[i]			= cEmpty.Rotate;
				//UpCam��[N] / [M] / [����ȊO]�ŕ�����
				if(Size[i] == SIZE_N){
					UpCam[i]	= cEmpty.UpCamN;
					UpCamTgt[i]	= cEmpty.UpCamTgtN;
				} else if(Size[i] == SIZE_M){
					UpCam[i]	= cEmpty.UpCamM;
					UpCamTgt[i]	= cEmpty.UpCamTgtM;
				} else {
					UpCam[i]	= cEmpty.UpCam;
					UpCamTgt[i]	= cEmpty.UpCamTgt;
				}
				StandbyCutRunner[i]	= cEmpty.StandbyCutRunner;
				StandbyCutCam[i]		= cEmpty.StandbyCutCam;
				StandbyCutCamTgt[i]	= cEmpty.StandbyCutCamTgt;
				if(i == 0){
					CamEmpty_Area		= cEmpty.Cam_Area;
					CamTgtEmpty_Area	= cEmpty.CamTgt_Area;
					CamEmpty_God		= cEmpty.Cam_God
					CamTgtEmpty_God		= cEmpty.CamTgt_God
					Empty_Master		= cEmpty.Empty_Master
					Rotate_Master		= cEmpty.Rotate_Master
					CamEmpty_Master		= cEmpty.Cam_Master;
					CamTgtEmpty_Master	= cEmpty.CamTgt_Master;
					EffectEmpty_Area	= cEmpty.EffectEmpty_Area;
					EffectScale_Area	= cEmpty.EffectScale_Area;
				}
			}
			//�G�L�X�g���̐ݒ�
			/*if(i < PartyNum - 1){	//�{�l�͏����̂�-1
				Extra[i]	= GetExtra(Monster, i);
			}*/
		}
	
		//�}�X�^�[���
		if(AllyFlag == true){
			MasterIndex		= GetAllyMaster_();
		} else {
			MasterIndex		= GetEnemyMaster_();
		}
		MasterType		= GetMasterKind_(AllyFlag);	//�}�X�^�[�̎��
	}
}


//�w�肵���񐔖ڂ̍s���̏ڍ׏����܂Ƃ߂�
class cActionInfo
{
	Attack = 0;								//�s���̃����X�^�[�C���f�b�N�X
	AttackMulti = null;						//�s�������X�^�[�C���f�b�N�X�i�A���U���p�j
	ActionNum = 0;							//�s����
	TargetNum = 0;							//�ΏۑΏۂƂȂ��������X�^�[��
	Target = null;							//�Ώۃ����X�^�[�C���f�b�N�X�i�z��j
	MultiCount = 0;							//����ڂ̍s�����H
	AttackAllyFlag = false;					//�s���҂̓G��������
	TargetAllyFlag = false;					//�s���҂̓G��������
	IndexIs = null;							//�Ώۃ����X�^�[�C���f�b�N�X��Is����ϊ��i�z��j
	
	//SE�֘A
	HitTypeSEFlag		= false;				//����SE���Đ����邩�H
	HitTypeSE			= "SE_BTL_019";			//����SE�iMiss�ECritical�Ȃǁj�̂ǂ���Đ����邩�H
	HealTypeSEFlag		= false;				//��SE���Đ����邩�H
	HealTypeSE			= "SE_BTL_020"			//��SE
	RevivalTypeSEFlag	= false;				//�h��SE���Đ����邩�H
	RevivalTypeSE		= "SE_BTL_019";			//�h��SE
	StatusTypeSEFlag	= false;				//�X�e�[�^�X�ω�SE���Đ����邩�H
	StatusTypeSE		= "SE_BTL_019";			//�X�e�[�^�X�ω�SE
	OtherTypeSEFlag		= false;				//���̑�SE���Đ����邩�H
	OtherTypeSE			= "SE_BTL_019";			//���̑�SE
	DamageSE			= "SE_BTL_019";			//�ʏ�_���[�WSE
	MissSE				= "SE_BTL_022";			//�~�XSE
	CriticalSE			= "SE_BTL_003";			//��S�̈ꌂSE
	DeadSE				= "SE_BTL_009";			//���SSE
	GuardSE				= "SE_BTL_024";			//�K�[�hSE
	AbsorptionSE		= "SE_SHA_003";			//�z��SE
	ReflectSE			= "SE_BTL_023";			//����SE
	RevivalSE			= "SE_BTL_023";			//�h��SE�i���f�[�^�j
	
	//�ėp�G�t�F�N�g�֘A
	HitEffect			= "EF010_01_HIT";			//��e�G�t�F�N�g
	CriticalEffect		= "EF010_02_HIT_KAISHIN";	//��S�G�t�F�N�g
	DeadEffect			= "EF000_12_MONSTER_DEATH";	//���S�G�t�F�N�g
	GuardEffect			= "EF000_13_COUNTER";		//�h��G�t�F�N�g
	AbsorptionEffect	= null;						//�z���G�t�F�N�g
	ReflectEffect		= "EF000_13_COUNTER";		//���˃G�t�F�N�g
	RevivalEffect		= null;						//�h���G�t�F�N�g
	
	//�_���[�W����
	Kind				= null;			//�s���̎��
	Category			= null;			//�s���̃J�e�S��
	MissFlag			= false;		//����̍s���Ń~�X�������������H
	CriticalFlag		= false;		//����̍s���ŃN���e�B�J���������������H
	DeadFlag			= false;		//����̍s���Ŏ��S�������������H
	GuardFlag			= false;		//����̍s���Ŗh�䂪�����������H
	AbsorptionFlag		= false;		//����̍s���ŋz���������������H
	RevivalFlag			= false;		//����̍s���őh���������������H
	ReflectFlag			= false;		//����̍s���Ŕ��˂������������H
	PoisonDamageFlag	= false;		//����̍s���œŃ_���[�W�������������H
	//�|�b�v�\��
	PopVisibleFlag		= null;			//����̍s���Ń_���[�W�|�b�v���K�v���H
	
	//�q�b�g����iIndexIs , MultiStageCount �̂Q�����z��j
	IsMiss			= null;			//�~�X�������������H
	IsCritical		= null;			//�N���e�B�J���������������H
	IsDead			= null;			//���S�������������H
	IsGuard			= null;			//�h�䂪�����������H
	IsAbsorption	= null;			//�z���������������H
	IsReflect		= null;			//���˂������������H
	IsRevival		= null;			//�h���������������H
	IsPoisonDamage	= null;			//�Ń_���[�W�������������H
	
	StateDamage				= null;		//�_���[�W�̒l�iTarget[]�ɑΉ������z��j
										//�_���[�W�����A�Q�����z��ɂȂ�\��
	StatusFlag				= null;		//�X�e�[�^�X�ω��̔���
	StatusValue				= null;		//�X�e�[�^�X�ω��̒l
	StatusEndFlag			= null;		//�X�e�[�^�X�ω��I���̔���
										
	//���i�U������p
	MultiStageCount			= null;		//���i�U���p����iTarget[]�ɑΉ������z��j
										//�ʏ�́A�P�B���i�̏ꍇ�͂��̉�
	MaxMultiStageCount		= 1;		//���i�U������i�ő吔�j
	
	//�|�b�v�\������p
	PopKind				= null;			//�\������|�b�v�̎�ށiTarget[]�ɑΉ������z��j
	PopValue			= null;			//�\������|�b�v�̒l�iTarget[]�ɑΉ������z��j
	PopValueKind		= null;			//�\������|�b�v�̒l�̎��Target[]�ɑΉ������z��j
	PopMiss				= null;			//�~�X�|�b�v��\�����邩����iTarget[]�ɑΉ������z��j
	
	//���Z�G�t�F�N�g�ݒ�
	SingleActEffect0_Name		= null;					//�P�̔z�u�G�t�F�N�g�O�̖��O
	SingleActEffect0_Frame		= 0;					//�P�̔z�u�G�t�F�N�g�O�̃t���[����
	SingleActEffect0_SEFlag		= true;					//�P�̔z�u�G�t�F�N�g�O��SE�Đ��ݒ�
	SingleActEffect1_Name		= null;					//�P�̔z�u�G�t�F�N�g�P�̖��O
	SingleActEffect1_Frame		= 0;					//�P�̔z�u�G�t�F�N�g�P�̃t���[����
	SingleActEffect1_SEFlag		= true;					//�P�̔z�u�G�t�F�N�g�O��SE�Đ��ݒ�
	AllActEffect0_Name			= null;					//�S�̔z�u�G�t�F�N�g�O�̖��O
	AllActEffect0_Frame			= 0;					//�S�̔z�u�G�t�F�N�g�O�̃t���[����
	AllActEffect0_SEFlag		= true;					//�S�̔z�u�G�t�F�N�g�O��SE�Đ��ݒ�
	AllActEffect1_Name			= null;					//�S�̔z�u�G�t�F�N�g�P�̖��O
	AllActEffect1_Frame			= 0;					//�S�̔z�u�G�t�F�N�g�P�̃t���[����
	AllActEffect1_SEFlag		= true;					//�S�̔z�u�G�t�F�N�g�P��SE�Đ��ݒ�
	ActEffectFlag				= false;				//���̃G�t�F�N�g���ݒ肳��Ă��Ȃ����H
	SingleActEffectAttach		= null					//�P�̓��Z�E�����̏ꍇ�̃G�t�F�N�g�̃A�^�b�`�ʒu
	EffectFrame					= 0;					//�s���ɑΉ��������Z�G�t�F�N�g�̍Đ��t���[��
														//	0F ����J�n
														//	��	DirectionWait �Ń��[�V�����E�|�b�v�\��
														//		��	MotionWait	�őҋ@��Ԃɖ߂�
														//			��	EndWait	�ŏI��
	EffectFrame_DamageDirectionWait		= 0;			//�G�t�F�N�g�J�n�`�_���[�W�����܂ł�Wait
	EffectFrame_EndWait					= 0;			//���o���I������܂ł̊�
	BAKURETSU_AllOnlyWait		= 0;					//���i�U���ŁA�ʃG�t�F�N�g���Ȃ��ꍇ��Wait
														//�ʃG�t�F�N�g������ꍇ�́A0�̂܂�
	ShakeFlag					= false;				//��ʗh����s��������
	SingleTargetFlag			= false;				//�P�̍s���̋Z���H
	EffectAreaFlag 				= true;					//�G�t�F�N�g�̕\�����P�̂��S�̂�
	EffectEmpty_Area			= 0;					//EffectEmpty�������Z�ɂ����
														//���W���ς�邩���m��Ȃ��̂ŔO�̂��ߗp��_
	EffectAttach				= ATTACH_GLOBAL;		//�����X�^�[�ɂ���G�t�F�N�g���W
	SelfTargetFlag				= false					//�s���҂ƑΏێ҂��������H
	
	//�s��Wait�֘A
	LineEffect_WaitFlag		= true						//LineEffect_Init�ł�Wait����
	
	//��O����
	IsAutoHeal				= false;					//�����񕜏������H
	
	constructor(Count)
	{
		//DebugPrint("Class_" + "ConstructorIN" + "_" + "cActionInfo");
		//DebugPrint("	=>	Count	:	" + Count);
		Attack = GetActorIndex_(Count);			//�s���̃����X�^�[�C���f�b�N�X
		ActionNum = GetActionNum_();			//�s����
		TargetNum = GetTargetNum_(Count);			//�ΏۑΏۂƂȂ��������X�^�[��
		SingleTargetFlag = IsTargetSingle_(Count);	//�P�̍s���̋Z���H
		if(IsScout_() != true){
			Category = GetActionCategory_(Count)	//�s���̎�ނ͉����H
		}
		
		//�ő�q�b�g����
		
		MaxMultiStageCount = GetMaxActHitNum(Count)
		
		//�z���`�̂��̂�constructor�ōĒ�`
		AttackMulti = [];						//�A���U�������X�^�[�C���f�b�N�X�i�z��j
		Target				= array(TargetNum);	//�Ώۃ����X�^�[�C���f�b�N�X�i�z��j
		IndexIs				= array(TargetNum);	//�Ώۃ����X�^�[�C���f�b�N�X��Is����ϊ��i�z��j
		IsMiss				= array(TargetNum);	//�~�X�������������H
		IsCritical			= array(TargetNum);	//�N���e�B�J���������������H
		IsDead				= array(TargetNum);	//���S�������������H
		IsGuard				= array(TargetNum);	//�h�䂪�����������H
		IsAbsorption		= array(TargetNum);	//�z���������������H
		IsReflect			= array(TargetNum);	//���˂������������H
		IsRevival			= array(TargetNum);	//�h���������������H
		IsPoisonDamage 		= array(TargetNum);	//�Ń_���[�W�������������H
		StateDamage			= array(TargetNum);	//�_���[�W�̒l([TargetNum][MultiStageCount])
		StatusFlag			= array(TargetNum);	//�X�e�[�^�X�ω��̔���([TargetNum][STATUS_NUM])
		StatusValue			= array(TargetNum);	//�X�e�[�^�X�ω��̒l([TargetNum][STATUS_NUM])
		StatusEndFlag		= array(TargetNum);	//�X�e�[�^�X�ω��I���̔���([TargetNum][STATUS_NUM])
		PopKind				= array(TargetNum);	//�\������|�b�v�̎�ށiTarget[]�ɑΉ������z��j
		PopValue			= array(TargetNum);	//�\������|�b�v�̒l�iTarget[]�ɑΉ������z��j
		PopValueKind		= array(TargetNum);	//�\������|�b�v�̒l�iTarget[]�ɑΉ������z��j
		PopMiss				= array(TargetNum);	//�~�X�|�b�v��\�����邩����iTarget[]�ɑΉ������z��j
		PopVisibleFlag		= array(TargetNum);	//�|�b�v��\�����邩�̔���iTarget[]�ɑΉ������z��j
		MultiStageCount		= array(TargetNum); //���i�U�����萔�iTarget[]�ɑΉ������z��j
		
		//Count�ɍ��킹�Đ��l����蒼��
		TargetNum = GetTargetNum_(Count);
		Attack = GetActorIndex_(Count);
		/*for(local i = 0 ; i < 4 ; i++){
			AttackMulti.append(GetActorIndex_(i));
		}*/
		MultiCount = Count;
		
		//�N���X�̓Ǎ�
		local PartyInfo = cFullPartyInfo(GetTargetIndex_(Count,0));
		
		//���Z�E�����̃G�t�F�N�g���E�t���[�������擾
		SingleActEffect0_Name	= GetSingleEffectName_(Count,0);
		SingleActEffect0_Frame	= GetSingleEffectFrame_(Count,0);
		SingleActEffect1_Name	= GetSingleEffectName_(Count,1);
		SingleActEffect1_Frame	= GetSingleEffectFrame_(Count,1)
		AllActEffect0_Name		= GetAllEffectName_(Count,0);
		AllActEffect0_Frame		= GetAllEffectFrame_(Count,0);
		AllActEffect1_Name		= GetAllEffectName_(Count,1);
		AllActEffect1_Frame		= GetAllEffectFrame_(Count,1);
		SingleActEffectAttach	= ATTACH_EFFECT2;		//SingleEffect�̃A�^�b�`�ʒu�̎擾���@�͗v���k
		
		//�G�t�F�N�g�����̍X�V
		UpdateEffect(Count)
		
		//�s���񐔂Ŕ�������ꍇ�͂���
		Kind = GetActionEfficacy_(Count);
		
		//�e�Ώۂ��ƂŔ�������ꍇ�͂���
		for(local x = 0 ; x < TargetNum ; x++){
			Target[x] = GetTargetIndex_(Count,x);
			
			local cMonster = cTargetMonsterInfo(Target[x],Count)
			if(cMonster.Index != INVALID_CHARACTER){
				IndexIs[x]			= cMonster.IndexIs;
				//���i�n�̔���
				/*for(local y = 0 ; y < MultiStageCount ; y++){
					IsMiss[x][y]			= IsMiss_(Count,Target[x],y);
					IsCritical[x][y]		= IsCritical_(Count,Target[x],y);
					IsDead[x][y]			= IsDead_(Count,Target[x]);
					IsGuard[x][y]			= IsGuard_(Count,Target[x]);
					IsAbsorption[x][y]		= IsAbsorb_(Count,Target[x]);//�z���̔��肪������
					IsReflect[x][y]			= IsReflect_(Count,Target[x]);
					IsRevival[x][y]			= IsRevival_(Count,Target[x]);
					IsPoisonDamage[x][y]	= IsPoisonDamage_(Count,Target[x])
				}
				//�X�e�[�^�X����
				for(local Status = STATUS_TOP ; Status < STATUS_NUM ; Status++){
					StateFlag[x][Status]		= GetStatusFlag_(Status,Count,Target[x])
					StatusValue[x][Status]		= GetStatusValue_(Status,Count,Target[x])
					StateEndFlag[x][Status]		= GetStatusEndFlag_(Status,Count,Target[x])
				}*/
				
				IsMiss[x]			= cMonster.IsMiss;
				IsCritical[x]		= cMonster.IsCritical;
				IsDead[x]			= cMonster.IsDead;
				IsGuard[x]			= cMonster.IsGuard;
				IsAbsorption[x]		= cMonster.IsAbsorption;
				IsReflect[x]		= cMonster.IsReflect;
				IsRevival[x]		= cMonster.IsRevival;
				IsPoisonDamage[x]	= cMonster.IsPoisonDamage;
				StateDamage[x]		= cMonster.DamageValue;
				StatusFlag[x]		= cMonster.StatusFlag;
				StatusValue[x]		= cMonster.StatusValue;
				StatusEndFlag[x]	= cMonster.StatusEndFlag;
				//���i�q�b�g���̑S�̃`�F�b�N
				MultiStageCount[x]	= cMonster.MultiStageCount
				for(local y = 0; y < MultiStageCount[x] ; y++){
					if(IsMiss[x][y] == true)		{MissFlag = true;}
					if(IsCritical[x][y] == true)	{CriticalFlag = true;}
					if(IsDead[x][y] == true)		{DeadFlag = true;}
					if(IsGuard[x][y] == true)		{GuardFlag = true;}
					if(IsAbsorption[x][y] == true)	{AbsorptionFlag = true;}
					if(IsReflect[x][y] == true)		{ReflectFlag = true;}
					if(IsRevival[x][y] == true)		{RevivalFlag = true;}
					if(IsPoisonDamage[x][y] == true){PoisonDamageFlag = true;}
					//�|�b�v�\���p�̃~�X����
					if(IsMiss[x][y] == true){
						PopMiss[x]	= true;
					} else {
						PopMiss[x]	= false;
					}
					
				}
				
				
				//�X�e�[�^�X�ω��̒l���S��0�������ꍇ�i�_���[�W�j
				if(Kind == EFFICACY.ATTACK){
					local DamageType = GetDamageType_(Count,x)
					local AllyFlag = IsAlly_(Target[x]);
					//�_���[�W�l�̂ݏ��������G
					if(MultiStageCount[x] == 0){
						PopKind.append(POPSTYLE.NONE)
						PopValue.append(null)
					} else {
						if(AllyFlag == true){
							//�����ւ̃_���[�W�̏ꍇ
							PopKind[x]			= POPSTYLE.DAMAGE_ENEMY
							PopValue[x]			= StateDamage
							PopVisibleFlag[x]	= true;
						} else {
							//�G�ւ̃_���[�W
							PopKind[x]			= POPSTYLE.DAMAGE_ALLY
							PopValue[x]			= StateDamage
							PopVisibleFlag[x]	= true;
						}
						if(IsReflect[x][0] == true){
							PopVisibleFlag[x]	= false;
						}
					}
				//�X�e�[�^�X�ω��̒l���S��0�������ꍇ�i�񕜁j
				} else if(Kind == EFFICACY.HEAL){
					//HP�񕜂̏ꍇ
					PopKind[x]			= POPSTYLE.HEAL_HP
					PopValue[x]			= StateDamage
					PopVisibleFlag[x]	= true;
				}
				//�Ń_���[�W�̍ۂ̓|�b�v�\�����s��
				local PoisonDamageFlag = IsPoisonDamage_(Count, x);
				local AllyFlag = IsAlly_(Target[x]);
				if(Kind == EFFICACY.OTHER && PoisonDamageFlag == true){
						PopValue[x]		= StateDamage
						PopVisibleFlag[x] = true;
					if(AllyFlag == true){
						PopKind[x]		= POPSTYLE.DAMAGE_ENEMY
					} else {
						PopKind[x]		= POPSTYLE.DAMAGE_ALLY
					}
				}
			}
		}
		
		//���d������z�肵�ʘg��SE�ݒ�
		//	�iMiss�ȊO�́AEffect�\����SE���Đ������̂ň�UHitTypeSEFlag��false�ɂ��܂��B�j
		if(Kind == EFFICACY.ATTACK){
			HitTypeSEFlag = true;
			if(CriticalFlag == true){					//�N���e�B�J���̏ꍇ
				HitTypeSEFlag = false;
				if(IsAlly_(Attack) == true){
					HitTypeSE = CriticalSE;
				} else {
					HitTypeSE = "SE_BTL_006"//�G���̏ꍇ�͒ɍ�
				}
				ShakeFlag = true;
			}
			if(MissFlag == true) {						//�~�X�̏ꍇ
				HitTypeSEFlag = true;
				HitTypeSE = MissSE;
			}
			if(GuardFlag == true) {				//�K�[�h�̏ꍇ
				HitTypeSEFlag = false;
				HitTypeSE = GuardSE;
			}
			if(AbsorptionFlag == true) {		//�z���̏ꍇ
				HitTypeSEFlag = false;
				HitTypeSE = AbsorptionSE;
			}
			if(ReflectFlag == true) {		//���˂̏ꍇ
				HitTypeSEFlag = true;
				HitTypeSE = ReflectSE;
			}
		}
		
		
		SingleTargetFlag = IsTargetSingle_(Count);
		
		//�Z�ɑΉ�����EffectEmpty_Area�̗p��
		EffectEmpty_Area = PartyInfo.EffectEmpty_Area
		
		//�s���҂ƑΏێ҂�����������
		if(Attack == GetTargetIndex_(Count,0) && SingleTargetFlag == true){
			SelfTargetFlag = true;
		}
		
		//�s���҂ƑΏێ҂̐w�c����
		if(Attack != INVALID_CHARACTER){
			AttackAllyFlag = IsAlly_(Attack);
		}
		if(GetTargetIndex_(Count,0) != INVALID_CHARACTER){
			TargetAllyFlag = IsAlly_(GetTargetIndex_(Count,0));
		}
		//��S�̈ꌂSE��ɍ���SE�ɕύX���邩�H
		if(Attack != INVALID_CHARACTER){
			if(IsAlly_(Attack) != true){
				CriticalSE = "SE_BTL_006"//�G���̏ꍇ�͒ɍ�
			}
		}
		
		//DebugPrint("Class_" + "ConstructorOUT" + "_" + "cActionInfo");
	}
	
	//�G�t�F�N�g�f�[�^�̍X�V
	//cActionInfo�̃G�t�F�N�g�f�[�^���蓮�ōX�V����ꍇ��
	//���L�̏����X�V���Ă��������B
	//cAction.SingleActEffect0_Name		�F�P�̃G�t�F�N�g�i�P�j
	//cAction.SingleActEffect0_Frame	�F�P�̃G�t�F�N�g�i�P�j�̍Đ��t���[����
	//cAction.SingleActEffect1_Name		�F�P�̃G�t�F�N�g�i�Q�j
	//cAction.SingleActEffect1_Frame	�F�P�̃G�t�F�N�g�i�Q�j�̍Đ��t���[����
	//cAction.AllActEffect0_Name		�F�S�̃G�t�F�N�g�i�P�j
	//cAction.AllActEffect0_Frame		�F�S�̃G�t�F�N�g�i�P�j�̍Đ��t���[����
	//cAction.AllActEffect1_Name		�F�S�̃G�t�F�N�g�i�Q�j
	//cAction.AllActEffect1_Frame		�F�S�̃G�t�F�N�g�i�Q�j�̍Đ��t���[����
	//	�������A�G�t�F�N�g���P�����̏ꍇ�́A�����̍X�V�����ő��v�ł��B
	//		�G�t�F�N�g�ƃt���[�����̓Z�b�g�ōX�V���Ă��������B
	function UpdateEffect(Count)
	{
		if(SingleActEffect0_Name != null)	{ActEffectFlag = true;}
		if(SingleActEffect1_Name != null)	{ActEffectFlag = true;}
		if(AllActEffect0_Name != null)		{ActEffectFlag = true;}
		if(AllActEffect1_Name != null)		{ActEffectFlag = true;}
		
		if(SingleActEffect0_Frame > EffectFrame){EffectFrame = SingleActEffect0_Frame;}
		if(SingleActEffect0_Frame > EffectFrame){EffectFrame = SingleActEffect1_Frame;}
		if(AllActEffect0_Frame > EffectFrame)	{EffectFrame = AllActEffect0_Frame;}
		if(AllActEffect1_Frame > EffectFrame)	{EffectFrame = AllActEffect1_Frame;}
		
		if(ActEffectFlag == true){
			switch(AllActEffect0_Name)
			{
			//�S�̃G�t�F�N�g�t���[����O
			case "EF213_19_GOD_HAND":
				//EffectFrame = 45;
				EffectFrame_DamageDirectionWait	= 15;
				EffectFrame_EndWait				= 30;
				break;
			case "EF213_21_ABYSS_HAND":
				EffectFrame = 70;
				EffectFrame_DamageDirectionWait	= EffectFrame*0.7;
				EffectFrame_EndWait				= EffectFrame*0.6;
				break;
			case "EF213_23_JUDGMENT":
				EffectFrame = 45;
				EffectFrame_DamageDirectionWait	= 15;
				EffectFrame_EndWait				= 30;
				break;
			case "EF130_40_MEGANTE":
				//���K���e�̏ꍇ�͎ڂ����炷�B
				EffectFrame = 150;
				EffectFrame_DamageDirectionWait	= 60;
				EffectFrame_EndWait				= 50;
				break;
			case "EF040_14_PROP_HAMETSUNOHI":
				//�j�ł̓��͎ڒ���
				EffectFrame = 420;
				EffectFrame_DamageDirectionWait	= 370;
				EffectFrame_EndWait				= 50;
				break;
			case "EF200_15_PARTY_CHANGE":
				//�p�[�e�B�`�F���W�͗�O�I�ɂ����Œ����͎ڒ���
				EffectFrame = 75;
				EffectFrame_DamageDirectionWait	= 50;
				EffectFrame_EndWait				= 45;
				break;
			default:
				if(SingleActEffect0_Name != null){
					switch(SingleActEffect0_Name)
					{
					//�P�̃G�t�F�N�g�t���[����O
					case "EF110_40_BETARUMBLE":
						//�x�^�����u���̏ꍇ�͎ڂ����炷�B
						EffectFrame_DamageDirectionWait	= 100;
						EffectFrame_EndWait				= 50;
						break;
					case "EF110_49_MEDOLORE":
						//���h���[�A
						EffectFrame_DamageDirectionWait	= 100;
						EffectFrame_EndWait				= 50;
						break;
					case "EF030_10_TENSION01":
						EffectFrame_DamageDirectionWait	= 0;
						EffectFrame_EndWait				= 25;
					//���i�n�G�t�F�N�g��O�ݒ�
					case "EF110_52_MERAMATER":
					case "EF110_53_ZABAMATER":
					case "EF110_54_BAGIMATER":
					case "EF110_55_JIBAMATER":
					case "EF110_56_IOMATER":
					case "EF110_57_HYADOMATER":
					case "EF110_58_DEINAMATER":
					case "EF110_59_BETANAMATER":
					case "EF110_60_GIRAMATER":
					case "EF110_61_DORUMATER":
						EffectFrame = 15;
						EffectFrame_DamageDirectionWait	= EffectFrame*0.5;
						EffectFrame_EndWait				= EffectFrame*0.3;
						break;
					case "EF130_28_GIGATAMETORA_ABS":
						EffectFrame = 30;
						EffectFrame_DamageDirectionWait	= 15;
						EffectFrame_EndWait				= 0;
					case "EF130_32_GIGAMAHOTORA_ABS":
						EffectFrame = 20;
						EffectFrame_DamageDirectionWait	= 15;
						EffectFrame_EndWait				= 5;
						break;
					default:
						EffectFrame_DamageDirectionWait	= EffectFrame*0.5;
						EffectFrame_EndWait				= EffectFrame*0.5;
						if(GetTargetType_(Count) != TARGET.BAKURETSU && GetTargetType_(Count) != TARGET.ALLY_MULTI_RANDOM){
							//BAKURETSU�n�ł͂Ȃ��ꍇ��Wait�␳��p��
							if(EffectFrame_EndWait <= 25){
								EffectFrame_EndWait = 25;
							}
						}
						break;
					}
				} else {
					if(GetTargetType_(Count) != TARGET.BAKURETSU && GetTargetType_(Count) != TARGET.ALLY_MULTI_RANDOM){
						EffectFrame_DamageDirectionWait	= EffectFrame*0.7;
						EffectFrame_EndWait				= EffectFrame*0.4;
						local MaxHit = 0;
						for(local i = 0 ; i < TargetNum ; i++){
							local l = GetActHitNum_(Count,i);
							if(MaxHit < l){MaxHit = l;}
						}
						if(MaxHit > 1){
							EffectFrame_EndWait = EffectFrame_EndWait - (MaxHit * 15)
							if(EffectFrame_EndWait <= 0){
								//�G�t�F�N�g�I���҂��ɂ͂P�ȏ�̐��l��Ԃ��悤�ɂ���B
								EffectFrame_EndWait = 1;
							}
						}
					} else {
						//���i�U���̏ꍇ��Wait�ڂ̎�����ύX����
						if(SingleActEffect0_Name != null){
							EffectFrame_DamageDirectionWait	= EffectFrame*0.7;
							EffectFrame_EndWait				= EffectFrame*0.6;
							local MaxHit = 0;
							for(local i = 0 ; i < TargetNum ; i++){
								local l = GetActHitNum_(Count,i);
								if(MaxHit < l){MaxHit = l;}
							}
							if(MaxHit > 1){
								EffectFrame_EndWait = EffectFrame_EndWait - (MaxHit * 15)
								if(EffectFrame_EndWait <= 0){
									//�G�t�F�N�g�I���҂��ɂ͂P�ȏ�̐��l��Ԃ��悤�ɂ���B
									EffectFrame_EndWait = 1;
								}
							}
						} else {
							//���i���ASingleEffect���Ȃ��ꍇ��
							//�S�̃G�t�F�N�g��\����A10F�Ԋu�ŕ\��������
							BAKURETSU_AllOnlyWait			= EffectFrame*0.7;
							EffectFrame_DamageDirectionWait	= 5;
							EffectFrame_EndWait				= 5;
							local MaxHit = 0;
							for(local i = 0 ; i < TargetNum ; i++){
								local l = GetActHitNum_(Count,i);
								if(MaxHit < l){MaxHit = l;}
							}
							if(MaxHit > 1){
								EffectFrame_EndWait = EffectFrame_EndWait - (MaxHit * 15)
								if(EffectFrame_EndWait <= 0){
									//�G�t�F�N�g�I���҂��ɂ͂P�ȏ�̐��l��Ԃ��悤�ɂ���B
									EffectFrame_EndWait = 1;
								}
							}
						}
					}
				}
				break;
			}
		} else if(GetActorIndex_(Count) != INVALID_CHARACTER){
			//�i�f�E�s�T�C�Y�����U���j
			//�����Ƃ���
			//�E�s���҂��f�܂��͂s�T�C�Y
			//�E�S�̑Ώۂł���
			//�E�������킯�ł͂Ȃ��iIsPasser_�ɂĔ���j
			//�E���Z�ł͂Ȃ��A�����U��
			local ActorSize = GetMonsterSize_(GetActorIndex_(Count))
			if(ActorSize == SIZE_G || ActorSize == SIZE_T){
				if(GetTargetType_(Count) == TARGET.ENEMY_ALL){
					if(IsPasser_(Count) != true){
						if(IsTokugi_(Count) == false && Category == CATEGORY.PHYSICAL){
							//�f�E�s�T�C�Y�p�����U�����o
							ActEffectFlag = true;
							SingleActEffect0_Name			= null;
							SingleActEffect1_Name			= null;
							AllActEffect0_Name				= "EF010_09_ATTACK_G_SIZE01";
							AllActEffect1_Name				= null;
							SingleActEffect0_Frame			= 0;
							SingleActEffect0_Frame			= 0;
							AllActEffect0_Frame				= 30;
							AllActEffect1_Frame				= 0;
							EffectFrame_DamageDirectionWait	= 15;
							EffectFrame_EndWait				= 45;
						}
					}
				}
			} else {
				//�r�E�m�E�l�ŃG�t�F�N�g���Ȃ��ꍇ
				EffectFrame = 0;					//���p�����[�^
				EffectFrame_DamageDirectionWait	= 10;
				EffectFrame_EndWait				= 25;
			}
		} else {
			//�G�t�F�N�g�̂Ȃ��V�[���ł�Wait�ݒ�
			EffectFrame = 0;					//���p�����[�^
			EffectFrame_DamageDirectionWait	= 10;
			EffectFrame_EndWait				= 25;
		}
		//��O�p
		if(EffectFrame_DamageDirectionWait	== 0){EffectFrame_DamageDirectionWait	= 15;}
		if(EffectFrame_EndWait				== 0){EffectFrame_EndWait				= 25;}
	}
	//cAction�̃p�����[�^���e�L�X�g�o��
	function ParamPrint()
	{
	//print("Attack			: " + Attack + "\n")
	//print("ActionNum		: " + ActionNum + "\n")
	//print("TargetNum		: " + TargetNum + "\n")
	//print("MultiCount		: " + MultiCount + "\n")
	//print("AttackAllyFlag	: " + AttackAllyFlag + "\n")
	//print("TargetAllyFlag	: " + TargetAllyFlag + "\n")
	//
	//for(local x = 0 ; x < TargetNum ; x++){
	//	//print("Index[" + x + "]			: " + Index[x] + "\n")
	//	print("Target[" + x + "]		: " + Target[x] + "\n")
	//	print("IndexIs[" + x + "]		: " + IndexIs[x] + "\n")
	//}
	//
	//
	////SE�֘A
	//print("HitTypeSEFlag	: " + HitTypeSEFlag + "\n")
	//print("HitTypeSE		: " + HitTypeSE + "\n")
	//print("HealTypeSEFlag	: " + HealTypeSEFlag + "\n")
	//print("HealTypeSE		: " + HealTypeSE + "\n")
	//print("RevivalTypeSEFlag: " + RevivalTypeSEFlag + "\n")
	//print("RevivalTypeSE	: " + RevivalTypeSE + "\n")
	//print("StatusTypeSEFlag	: " + StatusTypeSEFlag + "\n")
	//print("StatusTypeSE		: " + StatusTypeSE + "\n")
	//print("OtherTypeSEFlag	: " + OtherTypeSEFlag + "\n")
	//print("OtherTypeSE		: " + OtherTypeSE + "\n")
	//print("DamageSE			: " + DamageSE + "\n")
	//print("MissSE			: " + MissSE + "\n")
	//print("CriticalSE		: " + CriticalSE + "\n")
	//print("DeadSE			: " + DeadSE + "\n")
	//print("GuardSE			: " + GuardSE + "\n")
	//print("AbsorptionSE		: " + AbsorptionSE + "\n")
	//print("ReflectSE		: " + ReflectSE + "\n")
	//print("RevivalSE		: " + RevivalSE + "\n")
	//print("HitEffect		: " + HitEffect + "\n")
	//print("CriticalEffect	: " + CriticalEffect + "\n")
	//print("DeadEffect		: " + DeadEffect + "\n")
	//print("GuardEffect		: " + GuardEffect + "\n")
	//print("AbsorptionEffect	: " + AbsorptionEffect + "\n")
	//print("ReflectEffect	: " + ReflectEffect + "\n")
	//print("RevivalEffect	: " + RevivalEffect + "\n")
	//
	////�_���[�W����
	//print("Kind				: " + Kind + "\n")
	//print("Category			: " + Category + "\n")
	//print("MissFlag			: " + MissFlag + "\n")
	//print("CriticalFlag		: " + CriticalFlag + "\n")
	//print("DeadFlag			: " + DeadFlag + "\n")
	//print("GuardFlag		: " + GuardFlag + "\n")
	//print("AbsorptionFlag	: " + AbsorptionFlag + "\n")
	//print("RevivalFlag		: " + RevivalFlag + "\n")
	//print("ReflectFlag		: " + ReflectFlag + "\n")
	//print("PoisonDamageFlag	: " + PoisonDamageFlag + "\n")
	//print("PopVisibleFlag	: " + PopVisibleFlag + "\n")
	
	//�q�b�g����iIndexIs , MultiStageCount �̂Q�����z��j
	/*for(local x = 0 ; x < MultiStageCount ; x++){
		print("--- ���� : " +  x + "�i�ڂ̔��� ----" + "\n");
		for(local y = 0 ; y < TargetNum ; y++){
			print("IsMiss[" + x +"]["+ y + "]			: " + IsMiss[x][y] + "\n")
			print("IsCritical[" + x +"]["+ y + "]		: " + IsCritical[x][y] + "\n")
			print("IsDead[" + x +"]["+ y + "]			: " + IsDead[x][y] + "\n")
			print("IsGuard[" + x +"]["+ y + "]			: " + IsGuard[x][y] + "\n")
			print("IsAbsorption[" + x +"]["+ y + "]	: " + IsAbsorption[x][y] + "\n")
			print("IsReflect[" + x +"]["+ y + "]		: " + IsReflect[x][y] + "\n")
			print("IsRevival[" + x +"]["+ y + "]		: " + IsRevival[x][y] + "\n")
			print("StateDamage[" + x +"]["+ y + "]	: " + StateDamage[x][y] + "\n")
			print("MultiStageCount[" + x + "][" + y + "[	: " + MultiStageCount[x][y] + "\n")
		}
	}
	
	//�X�e�[�^�X�ُ�
	for(local x = 0 ; x < TargetNum ; x++){
		for(local y = STATUS_TOP ; y < STATUS_NUM ; y++){
			if(StatusValue[x][y] != 0){
				print("StatusValue[" + x +"]["+ y + "]		: " + StatusValue[x][y] + "\n")
				print("StatusFlag[" + x +"]["+ y + "]		: " + StatusFlag[x][y] + "\n")
				print("StatusEndFlag[" + x +"]["+ y + "]	: " + StatusEndFlag[x][y] + "\n")
			}
		}
	}
	
	
	for(local x = 0 ; x < TargetNum ; x++){
		print("PopKind[x]		: " + PopKind[x] + "\n")
		print("PopValue[x]		: " + PopValue[x] + "\n")
		print("PopValueKind[x]	: " + PopValueKind[x] + "\n")
		print("PopMiss[x]		: " + PopMiss[x] + "\n")
	}*/
	
	//print("SingleActEffect0_Name			: " + SingleActEffect0_Name + "\n")
	//print("SingleActEffect0_Frame			: " + SingleActEffect0_Frame + "\n")
	//print("SingleActEffect1_Name			: " + SingleActEffect1_Name + "\n")
	//print("SingleActEffect1_Frame			: " + SingleActEffect1_Frame + "\n")
	//print("AllActEffect0_Name				: " + AllActEffect0_Name + "\n")
	//print("AllActEffect0_Frame				: " + AllActEffect0_Frame + "\n")
	//print("AllActEffect1_Name				: " + AllActEffect1_Name + "\n")
	//print("AllActEffect1_Frame				: " + AllActEffect1_Frame + "\n")
	//print("ActEffectFlag					: " + ActEffectFlag + "\n")
	//print("SingleActEffectAttach			: " + SingleActEffectAttach + "\n")
	//print("EffectFrame						: " + EffectFrame + "\n")
	//
	//print("EffectFrame_DamageDirectionWait	: " + EffectFrame_DamageDirectionWait + "\n")
	//print("EffectFrame_EndWait				: " + EffectFrame_EndWait + "\n")
	//
	//
	//
	//print("BAKURETSU_AllOnlyWait	: " + BAKURETSU_AllOnlyWait + "\n")
	//print("ShakeFlag			: " + ShakeFlag + "\n")
	//print("SingleTargetFlag			: " + SingleTargetFlag + "\n")
	//
	//print("EffectAreaFlag			: " + EffectAreaFlag + "\n")
	//print("EffectEmpty_Area			: " + EffectEmpty_Area + "\n")
	//print("EffectAttach				: " + EffectAttach + "\n")
	//print("SelfTargetFlag			: " + SelfTargetFlag + "\n")
	//print("LineEffect_WaitFlag			: " + LineEffect_WaitFlag + "\n")
	
	}
}

//Empty���N���X�i�p�[�e�B�̂݁j
class cEmptyInfo
{
	PartyNum = null;			//�p�[�e�B�̐�
	Empty = null;				//�����X�^�[�z�u�pEmpty
	Empty_Substitute = null;	//�����X�^�[�z�u�p�i�݂����ΏۊO�jEmpty
	Rotate = null;				//�����X�^�[�z�u�p�������
	UpCam = null;				//�A�b�v�\���p�J����
	UpCamTgt = null;			//�A�b�v�\���p�J�����^�[�Q�b�g
	UpCamN = null;				//�A�b�v�\���p�J�����i�m�T�C�Y�p�j
	UpCamTgtN = null;			//�A�b�v�\���p�J�����^�[�Q�b�g�i�m�T�C�Y�p�j
	UpCamM = null;				//�A�b�v�\���p�J�����i�l�T�C�Y�p�j
	UpCamTgtM = null;			//�A�b�v�\���p�J�����^�[�Q�b�g�i�l�T�C�Y�p�j
	Cam_Area = null;			//�S�̕\���p�J����
	CamTgt_Area = null;			//�S�̕\���p�J�����^�[�Q�b�g
	Cam_God = null;				//�S�̕\���p�J�����iGODHAND�p�j
	CamTgt_God = null;			//�S�̕\���p�J�����^�[�Q�b�g�iGODHAND�p�j
	Empty_Master = null;		//�S�̔z�u���}�X�^�[���W
	Rotate_Master = null;		//�S�̔z�u���}�X�^�[����
	Cam_Master = null;			//�}�X�^�[�\���p�J����
	CamTgt_Master = null;		//�}�X�^�[�J�����^�[�Q�b�g
	StandbyCutRunner = null;	//StandbyCut�pEmpty
	StandbyCutCam = null;		//StandbyCut�p�J����
	StandbyCutCamTgt = null;	//StandbyCut�p�J�����^�[�Q�b�g
	EffectEmpty_Area = null;	//�S�̕\���G�t�F�N�g���W
	EffectScale_Area = null;	//�S�̕\�����̃G�t�F�N�g�{��
	
	constructor(PartyType,Index,IndexCount)
	{
		//DebugPrint("Class_" + "ConstructorIN" + "_" + "cPartyEmptyInfo");
		
		
		local AllyFlag = IsAlly_(Index);
		if(PartyType == PARTYTYPE.S4){
			//���ʐݒ�
			if(AllyFlag == true){
				Cam_Area			= "camera_000_ALLYS4";
				CamTgt_Area			= "camtgt_000_ALLYS4";
				Cam_Master			= "camera_100_ALLYS4_Master";
				CamTgt_Master		= "camtgt_100_ALLYS4_Master";
				EffectEmpty_Area	= "pos_301_ALLYEffectS";
				EffectScale_Area	= 1.0;
				Cam_God				= "camera_000_ALLYS4_GOD";
				CamTgt_God			= "camtgt_000_ALLYS4_GOD";
				Empty_Master		= "move_000_S01S4master";
				Rotate_Master		= 180;
			} else {
				Cam_Area			= "camera_001_ENEMYS4";
				CamTgt_Area			= "camtgt_001_ENEMYS4";
				Cam_Master			= "camera_100_ENEMYS4_Master";
				CamTgt_Master		= "camtgt_100_ENEMYS4_Master";
				EffectEmpty_Area	= "pos_351_ENEMYEffectS";
				EffectScale_Area	= 1.0;
				Cam_God				= "camera_001_ENEMYS4_GOD";
				CamTgt_God			= "camtgt_001_ENEMYS4_GOD";
				Empty_Master		= "move_014_S05S4master";
				Rotate_Master		= 0;
			}
			//�ȉ��ʐݒ�
			if(IndexCount == 0){
				if(AllyFlag == true){	Empty				= "move_001_S01S4target";
										Empty_Substitute	= "move_001_S01S4target_Substitute";
										Rotate				= 180;
										UpCam				= "camera_101_ALLYS4_00"
										UpCamTgt			= "camtgt_101_ALLYS4_00"
										UpCamN				= "camera_101_ALLYN4_00"
										UpCamTgtN			= "camtgt_101_ALLYN4_00"
										UpCamM				= "camera_101_ALLYM4_00"
										UpCamTgtM			= "camtgt_101_ALLYM4_00"
										StandbyCutRunner	= "move_051_S01S4targetRun"
										StandbyCutCam		= "camera_021_ALLYS401ZOOM"
										StandbyCutCamTgt	= "camtgt_021_ALLYS401ZOOM"
				} else 				{	Empty				= "move_015_S05S4target";
										Empty_Substitute	= "move_015_S05S4target_Substitute";
										Rotate				= 0;
										UpCam				= "camera_115_ENEMYS4_00"
										UpCamTgt			= "camtgt_115_ENEMYS4_00"
										UpCamN				= "camera_115_ENEMYN4_00"
										UpCamTgtN			= "camtgt_115_ENEMYN4_00"
										UpCamM				= "camera_115_ENEMYM4_00"
										UpCamTgtM			= "camtgt_115_ENEMYM4_00"
										StandbyCutRunner	= "move_065_S05S4targetRun"
										StandbyCutCam		= "camera_031_ENEMYS401ZOOM"
										StandbyCutCamTgt	= "camtgt_031_ENEMYS401ZOOM"
				}
			} else if(IndexCount == 1){
				if(AllyFlag == true){	Empty				= "move_002_S01S4target";
										Empty_Substitute	= "move_002_S01S4target_Substitute";
										Rotate				= 180;
										UpCam				= "camera_102_ALLYS4_01"
										UpCamTgt			= "camtgt_102_ALLYS4_01"
										UpCamN				= "camera_102_ALLYN4_01"
										UpCamTgtN			= "camtgt_102_ALLYN4_01"
										UpCamM				= "camera_102_ALLYM4_01"
										UpCamTgtM			= "camtgt_102_ALLYM4_01"
										StandbyCutRunner	= "move_052_S01S4targetRun"
										StandbyCutCam		= "camera_022_ALLYS402ZOOM"
										StandbyCutCamTgt	= "camtgt_022_ALLYS402ZOOM"
				} else 				{	Empty				= "move_016_S05S4target";
										Empty_Substitute	= "move_016_S05S4target_Substitute";
										Rotate				= 0;
										UpCam				= "camera_116_ENEMYS4_01"
										UpCamTgt			= "camtgt_116_ENEMYS4_01"
										UpCamN				= "camera_116_ENEMYN4_01"
										UpCamTgtN			= "camtgt_116_ENEMYN4_01"
										UpCamM				= "camera_116_ENEMYM4_01"
										UpCamTgtM			= "camtgt_116_ENEMYM4_01"
										StandbyCutRunner	= "move_066_S05S4targetRun"
										StandbyCutCam		= "camera_032_ENEMYS402ZOOM"
										StandbyCutCamTgt	= "camtgt_032_ENEMYS402ZOOM"
				}
			} else if(IndexCount == 2){
				if(AllyFlag == true){	Empty				= "move_003_S01S4target";
										Empty_Substitute	= "move_003_S01S4target_Substitute";
										Rotate				= 180;
										UpCam				= "camera_103_ALLYS4_02"
										UpCamTgt			= "camtgt_103_ALLYS4_02"
										UpCamN				= "camera_103_ALLYN4_02"
										UpCamTgtN			= "camtgt_103_ALLYN4_02"
										UpCamM				= "camera_103_ALLYM4_02"
										UpCamTgtM			= "camtgt_103_ALLYM4_02"
										StandbyCutRunner	= "move_053_S01S4targetRun"
										StandbyCutCam		= "camera_023_ALLYS403ZOOM"
										StandbyCutCamTgt	= "camtgt_023_ALLYS403ZOOM"
				} else 				{	Empty				= "move_017_S05S4target";
										Empty_Substitute	= "move_017_S05S4target_Substitute";
										Rotate				= 0;
										UpCam				= "camera_117_ENEMYS4_02"
										UpCamTgt			= "camtgt_117_ENEMYS4_02"
										UpCamN				= "camera_117_ENEMYN4_02"
										UpCamTgtN			= "camtgt_117_ENEMYN4_02"
										UpCamM				= "camera_117_ENEMYM4_02"
										UpCamTgtM			= "camtgt_117_ENEMYM4_02"
										StandbyCutRunner	= "move_067_S05S4targetRun"
										StandbyCutCam		= "camera_033_ENEMYS403ZOOM"
										StandbyCutCamTgt	= "camtgt_033_ENEMYS403ZOOM"
				}
			} else if(IndexCount == 3){
				if(AllyFlag == true){	Empty				= "move_004_S01S4target";
										Empty_Substitute	= "move_004_S01S4target_Substitute";
										Rotate				= 180;
										UpCam				= "camera_104_ALLYS4_03"
										UpCamTgt			= "camtgt_104_ALLYS4_03"
										UpCamN				= "camera_104_ALLYN4_03"
										UpCamTgtN			= "camtgt_104_ALLYN4_03"
										UpCamM				= "camera_104_ALLYM4_03"
										UpCamTgtM			= "camtgt_104_ALLYM4_03"
										StandbyCutRunner	= "move_054_S01S4targetRun"
										StandbyCutCam		= "camera_024_ALLYS404ZOOM"
										StandbyCutCamTgt	= "camtgt_024_ALLYS404ZOOM"
				} else 				{	Empty				= "move_018_S05S4target";
										Empty_Substitute	= "move_018_S05S4target_Substitute";
										Rotate				= 0;
										UpCam				= "camera_118_ENEMYS4_03"
										UpCamTgt			= "camtgt_118_ENEMYS4_03"
										UpCamN				= "camera_118_ENEMYN4_03"
										UpCamTgtN			= "camtgt_118_ENEMYN4_03"
										UpCamM				= "camera_118_ENEMYM4_03"
										UpCamTgtM			= "camtgt_118_ENEMYM4_03"
										StandbyCutRunner	= "move_068_S05S4targetRun"
										StandbyCutCam		= "camera_034_ENEMYS404ZOOM"
										StandbyCutCamTgt	= "camtgt_034_ENEMYS404ZOOM"
				}
			}
		} else if(PartyType == PARTYTYPE.S3){
			//���ʐݒ�
			if(AllyFlag == true){
				Cam_Area			= "camera_000_ALLYS4";
				CamTgt_Area			= "camtgt_000_ALLYS4";
				Cam_Master			= "camera_100_ALLYS4_Master";
				CamTgt_Master		= "camtgt_100_ALLYS4_Master";
				EffectEmpty_Area	= "pos_301_ALLYEffectS";
				EffectScale_Area	= 1.0;
				Cam_God				= "camera_000_ALLYS4_GOD";
				CamTgt_God			= "camtgt_000_ALLYS4_GOD";
				Empty_Master		= "move_000_S01S4master";
				Rotate_Master		= 180;
			} else {
				Cam_Area			= "camera_001_ENEMYS4";
				CamTgt_Area			= "camtgt_001_ENEMYS4";
				Cam_Master			= "camera_100_ENEMYS4_Master";
				CamTgt_Master		= "camtgt_100_ENEMYS4_Master";
				EffectEmpty_Area	= "pos_351_ENEMYEffectS";
				EffectScale_Area	= 1.0;
				Cam_God				= "camera_001_ENEMYS4_GOD";
				CamTgt_God			= "camtgt_001_ENEMYS4_GOD";
				Empty_Master		= "move_014_S05S4master";
				Rotate_Master		= 0;
			}
			//�ȉ��ʐݒ�
			if(IndexCount == 0){
				if(AllyFlag == true){	Empty				= "move_006_S02S3target";
										Empty_Substitute	= "move_006_S02S3target_Substitute";
										Rotate				= 180;
										UpCam				= "camera_105_ALLYS3_00"
										UpCamTgt			= "camtgt_105_ALLYS3_00"
										UpCamN				= "camera_105_ALLYN3_00"
										UpCamTgtN			= "camtgt_105_ALLYN3_00"
										UpCamM				= "camera_105_ALLYM3_00"
										UpCamTgtM			= "camtgt_105_ALLYM3_00"
										StandbyCutRunner	= "move_056_S02S3targetRun"
										StandbyCutCam		= "camera_025_ALLYS301ZOOM"
										StandbyCutCamTgt	= "camtgt_025_ALLYS301ZOOM"
				} else 				{	Empty				= "move_020_S06S3target";
										Empty_Substitute	= "move_020_S06S3target_Substitute";
										Rotate				= 0;
										UpCam				= "camera_120_ENEMYS3_00"
										UpCamTgt			= "camtgt_120_ENEMYS3_00"
										UpCamN				= "camera_120_ENEMYN3_00"
										UpCamTgtN			= "camtgt_120_ENEMYN3_00"
										UpCamM				= "camera_120_ENEMYM3_00"
										UpCamTgtM			= "camtgt_120_ENEMYM3_00"
										StandbyCutRunner	= "move_070_S06S3targetRun"
										StandbyCutCam		= "camera_035_ENEMYS301ZOOM"
										StandbyCutCamTgt	= "camtgt_035_ENEMYS301ZOOM"
				}
			} else if(IndexCount == 1){
				if(AllyFlag == true){	Empty				= "move_007_S02S3target";
										Empty_Substitute	= "move_007_S02S3target_Substitute";
										Rotate				= 180;
										UpCam				= "camera_106_ALLYS3_01"
										UpCamTgt			= "camtgt_106_ALLYS3_01"
										UpCamN				= "camera_106_ALLYN3_01"
										UpCamTgtN			= "camtgt_106_ALLYN3_01"
										UpCamM				= "camera_106_ALLYM3_01"
										UpCamTgtM			= "camtgt_106_ALLYM3_01"
										StandbyCutRunner	= "move_057_S02S3targetRun"
										StandbyCutCam		= "camera_026_ALLYS302ZOOM"
										StandbyCutCamTgt	= "camtgt_026_ALLYS302ZOOM"
				} else 				{	Empty				= "move_021_S06S3target";
										Empty_Substitute	= "move_021_S06S3target_Substitute";
										Rotate				= 0;
										UpCam				= "camera_121_ENEMYS3_01"
										UpCamTgt			= "camtgt_121_ENEMYS3_01"
										UpCamN				= "camera_121_ENEMYN3_01"
										UpCamTgtN			= "camtgt_121_ENEMYN3_01"
										UpCamM				= "camera_121_ENEMYM3_01"
										UpCamTgtM			= "camtgt_121_ENEMYM3_01"
										StandbyCutRunner	= "move_071_S06S3targetRun"
										StandbyCutCam		= "camera_036_ENEMYS302ZOOM"
										StandbyCutCamTgt	= "camtgt_036_ENEMYS302ZOOM"
				}
			} else if(IndexCount == 2){
				if(AllyFlag == true){	Empty				= "move_008_S02S3target";
										Empty_Substitute	= "move_008_S02S3target_Substitute";
										Rotate				= 180;
										UpCam				= "camera_107_ALLYS3_02"
										UpCamTgt			= "camtgt_107_ALLYS3_02"
										UpCamN				= "camera_107_ALLYN3_02"
										UpCamTgtN			= "camtgt_107_ALLYN3_02"
										UpCamM				= "camera_107_ALLYM3_02"
										UpCamTgtM			= "camtgt_107_ALLYM3_02"
										StandbyCutRunner	= "move_058_S02S3targetRun"
										StandbyCutCam		= "camera_027_ALLYS302ZOOM"
										StandbyCutCamTgt	= "camtgt_027_ALLYS303ZOOM"
				} else 				{	Empty				= "move_022_S06S3target";
										Empty_Substitute	= "move_022_S06S3target_Substitute";
										Rotate				= 0;
										UpCam				= "camera_122_ENEMYS3_02"
										UpCamTgt			= "camtgt_122_ENEMYS3_02"
										UpCamN				= "camera_122_ENEMYN3_02"
										UpCamTgtN			= "camtgt_122_ENEMYN3_02"
										UpCamM				= "camera_122_ENEMYM3_02"
										UpCamTgtM			= "camtgt_122_ENEMYM3_02"
										StandbyCutRunner	= "move_072_S06S3targetRun"
										StandbyCutCam		= "camera_037_ENEMYS303ZOOM"
										StandbyCutCamTgt	= "camtgt_037_ENEMYS302ZOOM"
				}
			}
		} else if(PartyType == PARTYTYPE.S2){
			//���ʐݒ�
			if(AllyFlag == true){
				Cam_Area			= "camera_000_ALLYS4";
				CamTgt_Area			= "camtgt_000_ALLYS4";
				Cam_Master			= "camera_100_ALLYS4_Master";
				CamTgt_Master		= "camtgt_100_ALLYS4_Master";
				EffectEmpty_Area	= "pos_301_ALLYEffectS";
				EffectScale_Area	= 1.0;
				Cam_God				= "camera_000_ALLYS4_GOD";
				CamTgt_God			= "camtgt_000_ALLYS4_GOD";
				Empty_Master		= "move_000_S01S4master";
				Rotate_Master		= 180;
			} else {
				Cam_Area			= "camera_001_ENEMYS4";
				CamTgt_Area			= "camtgt_001_ENEMYS4";
				Cam_Master			= "camera_100_ENEMYS4_Master";
				CamTgt_Master		= "camtgt_100_ENEMYS4_Master";
				EffectEmpty_Area	= "pos_351_ENEMYEffectS";
				EffectScale_Area	= 1.0;
				Cam_God				= "camera_001_ENEMYS4_GOD";
				CamTgt_God			= "camtgt_001_ENEMYS4_GOD";
				Empty_Master		= "move_014_S05S4master";
				Rotate_Master		= 0;
			}
			//�ȉ��ʐݒ�
			if(IndexCount == 0){
				if(AllyFlag == true){	Empty				= "move_006_S02S3target";
										Empty_Substitute	= "move_006_S02S3target_Substitute";
										Rotate				= 180;
										UpCam				= "camera_105_ALLYS3_00"
										UpCamTgt			= "camtgt_105_ALLYS3_00"
										UpCamN				= "camera_105_ALLYN3_00"
										UpCamTgtN			= "camtgt_105_ALLYN3_00"
										UpCamM				= "camera_105_ALLYM3_00"
										UpCamTgtM			= "camtgt_105_ALLYM3_00"
										StandbyCutRunner	= "move_056_S02S3targetRun"
										StandbyCutCam		= "camera_025_ALLYS301ZOOM"
										StandbyCutCamTgt	= "camtgt_025_ALLYS301ZOOM"
				} else 				{	Empty				= "move_020_S06S3target";
										Empty_Substitute	= "move_020_S06S3target_Substitute";
										Rotate				= 0;
										UpCam				= "camera_120_ENEMYS3_00"
										UpCamTgt			= "camtgt_120_ENEMYS3_00"
										UpCamN				= "camera_120_ENEMYN3_00"
										UpCamTgtN			= "camtgt_120_ENEMYN3_00"
										UpCamM				= "camera_120_ENEMYM3_00"
										UpCamTgtM			= "camtgt_120_ENEMYM3_00"
										StandbyCutRunner	= "move_070_S06S3targetRun"
										StandbyCutCam		= "camera_035_ENEMYS301ZOOM"
										StandbyCutCamTgt	= "camtgt_035_ENEMYS301ZOOM"
				}
			} else if(IndexCount == 1){
				if(AllyFlag == true){	Empty				= "move_008_S02S3target";
										Empty_Substitute	= "move_008_S02S3target_Substitute";
										Rotate				= 180;
										UpCam				= "camera_107_ALLYS3_02"
										UpCamTgt			= "camtgt_107_ALLYS3_02"
										UpCamN				= "camera_107_ALLYN3_02"
										UpCamTgtN			= "camtgt_107_ALLYN3_02"
										UpCamM				= "camera_107_ALLYM3_02"
										UpCamTgtM			= "camtgt_107_ALLYM3_02"
										StandbyCutRunner	= "move_058_S02S3targetRun"
										StandbyCutCam		= "camera_027_ALLYS302ZOOM"
										StandbyCutCamTgt	= "camtgt_027_ALLYS303ZOOM"
				} else 				{	Empty				= "move_022_S06S3target";
										Empty_Substitute	= "move_022_S06S3target_Substitute";
										Rotate				= 0;
										UpCam				= "camera_122_ENEMYS3_02"
										UpCamTgt			= "camtgt_122_ENEMYS3_02"
										UpCamN				= "camera_122_ENEMYN3_02"
										UpCamTgtN			= "camtgt_122_ENEMYN3_02"
										UpCamM				= "camera_122_ENEMYM3_02"
										UpCamTgtM			= "camtgt_122_ENEMYM3_02"
										StandbyCutRunner	= "move_072_S06S3targetRun"
										StandbyCutCam		= "camera_037_ENEMYS303ZOOM"
										StandbyCutCamTgt	= "camtgt_037_ENEMYS302ZOOM"
				}
			}
		} else if(PartyType == PARTYTYPE.S1){
			//���ʐݒ�
			if(AllyFlag == true){
				Cam_Area			= "camera_000_ALLYS4";
				CamTgt_Area			= "camtgt_000_ALLYS4";
				Cam_Master			= "camera_100_ALLYS4_Master";
				CamTgt_Master		= "camtgt_100_ALLYS4_Master";
				EffectEmpty_Area	= "pos_301_ALLYEffectS";
				EffectScale_Area	= 1.0;
				Cam_God				= "camera_000_ALLYS4_GOD";
				CamTgt_God			= "camtgt_000_ALLYS4_GOD";
				Empty_Master		= "move_000_S01S4master";
				Rotate_Master		= 180;
			} else {
				Cam_Area			= "camera_001_ENEMYS4";
				CamTgt_Area			= "camtgt_001_ENEMYS4";
				Cam_Master			= "camera_100_ENEMYS4_Master";
				CamTgt_Master		= "camtgt_100_ENEMYS4_Master";
				EffectEmpty_Area	= "pos_351_ENEMYEffectS";
				EffectScale_Area	= 1.0;
				Cam_God				= "camera_001_ENEMYS4_GOD";
				CamTgt_God			= "camtgt_001_ENEMYS4_GOD";
				Empty_Master		= "move_014_S05S4master";
				Rotate_Master		= 0;
			}
			//�ȉ��ʐݒ�
			if(IndexCount == 0){
				if(AllyFlag == true){	Empty				= "move_007_S02S3target";
										Empty_Substitute	= "move_007_S02S3target_Substitute";
										Rotate				= 180;
										UpCam				= "camera_106_ALLYS3_01"
										UpCamTgt			= "camtgt_106_ALLYS3_01"
										UpCamN				= "camera_106_ALLYN3_01"
										UpCamTgtN			= "camtgt_106_ALLYN3_01"
										UpCamM				= "camera_106_ALLYM3_01"
										UpCamTgtM			= "camtgt_106_ALLYM3_01"
										StandbyCutRunner	= "move_057_S02S3targetRun"
										StandbyCutCam		= "camera_026_ALLYS302ZOOM"
										StandbyCutCamTgt	= "camtgt_026_ALLYS302ZOOM"
				} else 				{	Empty				= "move_021_S06S3target";
										Empty_Substitute	= "move_021_S06S3target_Substitute";
										Rotate				= 0;
										UpCam				= "camera_121_ENEMYS3_01"
										UpCamTgt			= "camtgt_121_ENEMYS3_01"
										UpCamN				= "camera_121_ENEMYN3_01"
										UpCamTgtN			= "camtgt_121_ENEMYN3_01"
										UpCamM				= "camera_121_ENEMYM3_01"
										UpCamTgtM			= "camtgt_121_ENEMYM3_01"
										StandbyCutRunner	= "move_071_S06S3targetRun"
										StandbyCutCam		= "camera_036_ENEMYS302ZOOM"
										StandbyCutCamTgt	= "camtgt_036_ENEMYS302ZOOM"
				}
			}
		} else if(PartyType == PARTYTYPE.SG){
			//���ʐݒ�
			if(AllyFlag == true){
				Cam_Area			= "camera_002_ALLYSG";
				CamTgt_Area			= "camtgt_002_ALLYSG";
				Cam_Master			= "camera_100_ALLYSG_Master";
				CamTgt_Master		= "camtgt_100_ALLYSG_Master";
				EffectEmpty_Area	= "pos_303_ALLYEffectG";
				EffectScale_Area	= 2.0;
				Cam_God				= "camera_002_ALLYSG";
				CamTgt_God			= "camtgt_002_ALLYSG";
				Empty_Master		= "move_009_S03SGmaster";
				Rotate_Master		= 180;
			} else {
				Cam_Area			= "camera_008_ENEMYSG";
				CamTgt_Area			= "camtgt_008_ENEMYSG";
				Cam_Master			= "camera_100_ENEMYSG_Master";
				CamTgt_Master		= "camtgt_100_ENEMYSG_Master";
				EffectEmpty_Area	= "pos_353_ENEMYEffectG";
				EffectScale_Area	= 2.0;
				Cam_God				= "camera_008_ENEMYSG";
				CamTgt_God			= "camtgt_008_ENEMYSG";
				Empty_Master		= "move_023_S07SGmaster";
				Rotate_Master		= 0;
			}
			//�ȉ��ʐݒ�
			if(IndexCount == 0){
				if(AllyFlag == true){	Empty				= "move_010_S03SGtarget";
										Empty_Substitute	= "move_010_S03SGtarget_Substitute";
										Rotate				= 180;
										UpCam				= "camera_110_ALLYSG_00"
										UpCamTgt			= "camtgt_110_ALLYSG_00"
										UpCamN				= "camera_110_ALLYSG_00"	//SN����
										UpCamTgtN			= "camtgt_110_ALLYSG_00"
										UpCamM				= null
										UpCamTgtM			= null
										StandbyCutRunner	= "move_060_S03SGtargetRun"
										StandbyCutCam		= "camera_021_ALLYS401ZOOM"
										StandbyCutCamTgt	= "camtgt_021_ALLYS401ZOOM"
				} else 				{	Empty				= "move_024_S07SGtarget";
										Empty_Substitute	= "move_024_S07SGtarget_Substitute"
										Rotate				= 0;
										UpCam				= "camera_124_ENEMYSG_00"
										UpCamTgt			= "camtgt_124_ENEMYSG_00"
										UpCamN				= "camera_124_ENEMYSG_00"
										UpCamTgtN			= "camtgt_124_ENEMYSG_00"
										UpCamM				= null
										UpCamTgtM			= null
										StandbyCutRunner	= "move_074_S07SGtargetRun"
										StandbyCutCam		= "camera_031_ENEMYS401ZOOM"
										StandbyCutCamTgt	= "camtgt_031_ENEMYS401ZOOM"
				}
			} else if(IndexCount == 1){
				if(AllyFlag == true){	Empty				= "move_011_S03SGtarget";
										Empty_Substitute	= "move_011_S03SGtarget_Substitute";
										Rotate				= 180;
										UpCam				= "camera_111_ALLYSG_01"
										UpCamTgt			= "camtgt_111_ALLYSG_01"
										UpCamN				= "camera_111_ALLYSG_01"
										UpCamTgtN			= "camtgt_111_ALLYSG_01"
										UpCamM				= null
										UpCamTgtM			= null
										StandbyCutRunner	= "move_061_S03SGtargetRun"
										StandbyCutCam		= "camera_029_ALLYSG02ZOOM"
										StandbyCutCamTgt	= "camtgt_029_ALLYSG02ZOOM"
				} else 				{	Empty				= "move_025_S07SGtarget";
										Empty_Substitute	= "move_025_S07SGtarget_Substitute";
										Rotate				= 0;
										UpCam				= "camera_125_ENEMYSG_01"
										UpCamTgt			= "camtgt_125_ENEMYSG_01"
										UpCamN				= "camera_125_ENEMYSG_01"
										UpCamTgtN			= "camtgt_125_ENEMYSG_01"
										UpCamM				= null
										UpCamTgtM			= null
										StandbyCutRunner	= "move_075_S07SGtargetRun"
										StandbyCutCam		= "camera_039_ENEMYSG02ZOOM"
										StandbyCutCamTgt	= "camtgt_039_ENEMYSG02ZOOM"
				}
			}
		} else if(PartyType == PARTYTYPE.GS){
			//���ʐݒ�
			if(AllyFlag == true){
				Cam_Area			= "camera_002_ALLYSG";
				CamTgt_Area			= "camtgt_002_ALLYSG";
				Cam_Master			= "camera_100_ALLYSG_Master";
				CamTgt_Master		= "camtgt_100_ALLYSG_Master";
				EffectEmpty_Area	= "pos_303_ALLYEffectG";
				EffectScale_Area	= 2.0;
				Cam_God				= "camera_002_ALLYSG";
				CamTgt_God			= "camtgt_002_ALLYSG";
				Empty_Master		= "move_009_S03SGmaster";
				Rotate_Master		= 180;
			} else {
				Cam_Area			= "camera_008_ENEMYSG";
				CamTgt_Area			= "camtgt_008_ENEMYSG";
				Cam_Master			= "camera_100_ENEMYSG_Master";
				CamTgt_Master		= "camtgt_100_ENEMYSG_Master";
				EffectEmpty_Area	= "pos_353_ENEMYEffectG";
				EffectScale_Area	= 2.0;
				Cam_God				= "camera_008_ENEMYSG";
				CamTgt_God			= "camtgt_008_ENEMYSG";
				Empty_Master		= "move_023_S07SGmaster";
				Rotate_Master		= 0;
			}
			//�ȉ��ʐݒ�
			if(IndexCount == 0){
				if(AllyFlag == true){	Empty				= "move_011_S03SGtarget";
										Empty_Substitute	= "move_011_S03SGtarget_Substitute";
										Rotate				= 180;
										UpCam				= "camera_111_ALLYSG_01"
										UpCamTgt			= "camtgt_111_ALLYSG_01"
										UpCamN				= "camera_111_ALLYSG_01"
										UpCamTgtN			= "camtgt_111_ALLYSG_01"
										UpCamM				= null
										UpCamTgtM			= null
										StandbyCutRunner	= "move_061_S03SGtargetRun"
										StandbyCutCam		= "camera_029_ALLYSG02ZOOM"
										StandbyCutCamTgt	= "camtgt_029_ALLYSG02ZOOM"
				} else 				{	Empty				= "move_025_S07SGtarget";
										Empty_Substitute	= "move_025_S07SGtarget_Substitute";
										Rotate				= 0;
										UpCam				= "camera_125_ENEMYSG_01"
										UpCamTgt			= "camtgt_125_ENEMYSG_01"
										UpCamN				= "camera_125_ENEMYSG_01"
										UpCamTgtN			= "camtgt_125_ENEMYSG_01"
										UpCamM				= null
										UpCamTgtM			= null
										StandbyCutRunner	= "move_075_S07SGtargetRun"
										StandbyCutCam		= "camera_039_ENEMYSG02ZOOM"
										StandbyCutCamTgt	= "camtgt_039_ENEMYSG02ZOOM"
				}
			} else if(IndexCount == 1){
				if(AllyFlag == true){	Empty				= "move_012_S03SGtarget";
										Empty_Substitute	= "move_012_S03SGtarget_Substitute";
										Rotate				= 180;
										UpCam				= "camera_112_ALLYSG_02"
										UpCamTgt			= "camtgt_112_ALLYSG_02"
										UpCamN				= "camera_112_ALLYSG_02"
										UpCamTgtN			= "camtgt_112_ALLYSG_02"
										UpCamM				= null
										UpCamTgtM			= null
										StandbyCutRunner	= "move_062_S03SGtargetRun"
										StandbyCutCam		= "camera_024_ALLYS404ZOOM"
										StandbyCutCamTgt	= "camtgt_024_ALLYS404ZOOM"
				} else 				{	Empty				= "move_026_S07SGtarget";
										Empty_Substitute	= "move_026_S07SGtarget_Substitute";
										Rotate				= 0;
										UpCam				= "camera_126_ENEMYSG_02"
										UpCamTgt			= "camtgt_126_ENEMYSG_02"
										UpCamN				= "camera_126_ENEMYSG_02"
										UpCamTgtN			= "camtgt_126_ENEMYSG_02"
										UpCamM				= null
										UpCamTgtM			= null
										StandbyCutRunner	= "move_076_S07SGtargetRun"
										StandbyCutCam		= "camera_034_ENEMYS404ZOOM"
										StandbyCutCamTgt	= "camtgt_034_ENEMYS404ZOOM"
				}
			}
		} else if(PartyType == PARTYTYPE.G1){
			//���ʐݒ�
			if(AllyFlag == true){
				Cam_Area			= "camera_002_ALLYSG";
				CamTgt_Area			= "camtgt_002_ALLYSG";
				Cam_Master			= "camera_100_ALLYSG_Master";
				CamTgt_Master		= "camtgt_100_ALLYSG_Master";
				EffectEmpty_Area	= "pos_303_ALLYEffectG";
				EffectScale_Area	= 2.0;
				Cam_God				= "camera_002_ALLYSG";
				CamTgt_God			= "camtgt_002_ALLYSG";
				Empty_Master		= "move_009_S03SGmaster";
				Rotate_Master		= 180;
			} else {
				Cam_Area			= "camera_008_ENEMYSG";
				CamTgt_Area			= "camtgt_008_ENEMYSG";
				Cam_Master			= "camera_100_ENEMYSG_Master";
				CamTgt_Master		= "camtgt_100_ENEMYSG_Master";
				EffectEmpty_Area	= "pos_353_ENEMYEffectG";
				EffectScale_Area	= 2.0;
				Cam_God				= "camera_008_ENEMYSG";
				CamTgt_God			= "camtgt_008_ENEMYSG";
				Empty_Master		= "move_023_S07SGmaster";
				Rotate_Master		= 0;
			}
			//�ȉ��ʐݒ�
			if(IndexCount == 0){
				if(AllyFlag == true){	Empty				= "move_011_S03SGtarget";
										Empty_Substitute	= "move_011_S03SGtarget_Substitute";
										Rotate				= 180;
										UpCam				= "camera_111_ALLYSG_01"
										UpCamTgt			= "camtgt_111_ALLYSG_01"
										UpCamN				= "camera_111_ALLYSG_01"
										UpCamTgtN			= "camtgt_111_ALLYSG_01"
										UpCamM				= null
										UpCamTgtM			= null
										StandbyCutRunner	= "move_061_S03SGtargetRun"
										StandbyCutCam		= "camera_029_ALLYSG02ZOOM"
										StandbyCutCamTgt	= "camtgt_029_ALLYSG02ZOOM"
				} else 				{	Empty				= "move_025_S07SGtarget";
										Empty_Substitute	= "move_025_S07SGtarget_Substitute";
										Rotate				= 0;
										UpCam				= "camera_125_ENEMYSG_01"
										UpCamTgt			= "camtgt_125_ENEMYSG_01"
										UpCamN				= "camera_125_ENEMYSG_01"
										UpCamTgtN			= "camtgt_125_ENEMYSG_01"
										UpCamM				= null
										UpCamTgtM			= null
										StandbyCutRunner	= "move_075_S07SGtargetRun"
										StandbyCutCam		= "camera_039_ENEMYSG02ZOOM"
										StandbyCutCamTgt	= "camtgt_039_ENEMYSG02ZOOM"
				}
			}
		} else if(PartyType == PARTYTYPE.T1){
			//���ʐݒ�
			if(AllyFlag == true){
				Cam_Area			= "camera_003_ALLYT1";
				CamTgt_Area			= "camtgt_003_ALLYT1";
				Cam_Master			= "camera_100_ALLYSG_Master";
				CamTgt_Master		= "camtgt_100_ALLYT1_Master";
				EffectEmpty_Area	= "pos_304_ALLYEffectT";
				EffectScale_Area	= 3.0;
				Cam_God				= "camera_003_ALLYT1";
				CamTgt_God			= "camtgt_003_ALLYT1";
				Empty_Master		= "move_012_S04T1master";
				Rotate_Master		= 180;
			} else {
				Cam_Area			= "camera_009_ENEMYT1";
				CamTgt_Area			= "camtgt_009_ENEMYT1";
				Cam_Master			= "camera_100_ENEMYT1_Master";
				CamTgt_Master		= "camtgt_100_ENEMYT1_Master";
				EffectEmpty_Area	= "pos_354_ENEMYEffectT";
				EffectScale_Area	= 3.0;
				Cam_God				= "camera_009_ENEMYT1";
				CamTgt_God			= "camtgt_009_ENEMYT1";
				Empty_Master		= "move_026_S08T1master";
				Rotate_Master		= 0;
			}
			//�ȉ��ʐݒ�
			if(IndexCount == 0){
				if(AllyFlag == true){	Empty				= "move_013_S04T1target";
										Empty_Substitute	= "move_013_S04T1target";//T�ł݂͂���肪�������Ȃ�
										Rotate				= 180;
										UpCam				= "camera_113_ALLYT1_00"
										UpCamTgt			= "camtgt_113_ALLYT1_00"
										UpCamN				= "camera_113_ALLYT1_00"
										UpCamTgtN			= "camtgt_113_ALLYT1_00"
										UpCamM				= null
										UpCamTgtM			= null
										StandbyCutRunner	= "move_063_S04T1targetRun"
										StandbyCutCam		= "camera_030_ALLYT101ZOOM"
										StandbyCutCamTgt	= "camtgt_030_ALLYT101ZOOM"
				} else 				{	Empty				= "move_027_S08T1target";
										Empty_Substitute	= "move_027_S08T1target";//T�ł݂͂���肪�������Ȃ�
										Rotate				= 0;
										UpCam				= "camera_127_ENEMYT1_00"
										UpCamTgt			= "camtgt_127_ENEMYT1_00"
										UpCamN				= "camera_127_ENEMYT1_00"
										UpCamTgtN			= "camtgt_127_ENEMYT1_00"
										UpCamM				= null
										UpCamTgtM			= null
										StandbyCutRunner	= "move_077_S08T1targetRun"
										StandbyCutCam		= "camera_040_ENEMYT101ZOOM"
										StandbyCutCamTgt	= "camtgt_040_ENEMYT101ZOOM"
				}
			}
		}
		//DebugPrint("Class_" + "ConstructorOUT" + "_" + "cPartyEmptyInfo");
	}
}

// BattleCommon�������֐�
function BattleCommon_Init()
{
	g_ShowCriticalGuard <- false;
	g_ShowGambleBody <- false;
	g_funcDepth <- 0;
}
		
// ��S���񂺂�K�[�h���L����
function IsActiveCriticalGuard(MultiCount, IndexCount, MultiStageCount)
{
	return (IsCritical_(MultiCount, IndexCount, MultiStageCount) && IsCriticalGuard_(MultiCount, IndexCount));
}

// �X�e�[�^�X�֘A�֐���`�J�n===========================
function GetStatusResetWait( status )
{
	switch(status)
	{
	case STATUS.TENSION:
	case STATUS.ATTACK:
	case STATUS.DEFENCE:
	case STATUS.QUICK:
	case STATUS.WISE:
		return 45;
	default:
		return 0;
	}
	return 0;
}
		
function IsStatusUpCameraChange( status )
{
	switch(status)
	{
	case STATUS.NONE:
	case STATUS.TENSION:
	case STATUS.CONFUSION:
	case STATUS.SLEEP:
	case STATUS.PARALYSIS:
	case STATUS.MIND:
	case STATUS.POISON:
	case STATUS.CURSE:
	case STATUS.POISON:
	case STATUS.DEATH:
	case STATUS.ERASE:
		return false;
	default:
		return true;
	}
	return false;
}

function IsStatusDownCameraChange( status )
{
	switch(status)
	{
	case STATUS.NONE:
	case STATUS.TENSION:
	case STATUS.ATTACK:
	case STATUS.DEFENCE:
	case STATUS.QUICK:
	case STATUS.WISE:
	case STATUS.CONFUSION:
	case STATUS.SLEEP:
	case STATUS.PARALYSIS:
	case STATUS.MIND:
	case STATUS.POISON:
	case STATUS.CURSE:
	case STATUS.DEATH:
		return false;
	default:
		return true;
	}
	return false;
}

function IsStatusUpMessageVisible( status )
{
	switch(status)
	{
	case STATUS.ATTACK:
	case STATUS.DEFENCE:
	case STATUS.QUICK:
	case STATUS.WISE:
	case STATUS.CONFUSION:
	case STATUS.SLEEP:
	case STATUS.PARALYSIS:
	case STATUS.MIND:
	case STATUS.POISON:
	case STATUS.CURSE:
		return true;
	default:
		return false;
	}
	return false;
}

function IsStatusDownMessageVisible( status )
{
	switch(status)
	{
	case STATUS.ATTACK:
	case STATUS.DEFENCE:
	case STATUS.QUICK:
	case STATUS.WISE:
		return true;
	default:
		return false;
	}
	return false;
}

function IsStatusResetMessageVisible( status )
{
	switch(status)
	{
	case STATUS.ATTACK:
	case STATUS.DEFENCE:
	case STATUS.QUICK:
	case STATUS.WISE:
	case STATUS.DEADACTION:
		return true;
	default:
		return false;
	}
	return false;
}

function GetStatusUpMessageId( status )
{
	return (status + 100);
}

function GetStatusDownMessageId( status )
{
	return (status + 300);
}

function GetStatusResetMessageId( status )
{
	return (status + 500);
}
// �X�e�[�^�X�֘A�֐���`�I��===========================

// �X�J�E�g�E���C�h�A�g�J�b�g�C��===========================
function Gosign( cutinKind )
{
	//DebugPrint_FuncName_IN("Gosign");
	FUNCTION_STACK = FUNCTION_STACK + 1;
	ChangeIndexPointData_(BATTLE_COMMON_POINT_DATA);

	local attack = GetActorIndex_(0);
	local target = GetTargetIndex_(0,0);
	
	local AllyFlag = IsAlly_(attack);
	local master;		// �}�X�^�[
	
	if(AllyFlag == true){
		master = GetAllyMaster_();
	} else {
		master = GetEnemyMaster_();
	}
	
	if(cutinKind == CUTIN_RIDE_LINK){
		local MultiCount = 0;
		local NameVisibleFlag = false;
		ShowActionMessage(MultiCount,NameVisibleFlag)
	}
	
	SetVisible_(attack, false);
	SetVisible_(target, false);
	
	for(local i = 0 ; i < 4 ; i++){
		SetVisible_(GetAllyIndex_(i), false);
		SetVisible_(GetEnemyIndex_(i), false);
	}
	
	SetVisible_(master, true);
	
	//�J�����ʒu
	Task_AnimeMoveCamera_("camera_210","camtgt_210");
	
	//�}�X�^�[�؂藣������
	RideOffMaster_(master);
	
	//�}�X�^�[��]
	SetDir_(master, -90);
	
	//�}�X�^�[�@���[�V�����@�z�u
	local MasterTask = Task_AnimeMoveCharNoDir_(master, "move_400_Gosign");
	
	SetMotion_(master, MOT_SCOUT, 0);
	SetMotionStepFrame_(master, 0.6);
	
	
	ShowActionName_(0);
	
	// �X�J�E�g�̎�
	if (cutinKind == CUTIN_SCOUT)
	{
		ReplaySE_("SE_BTL_017");
	}
	
	//�s�v�ȃ����X�^�[��S�Ĕ�\���ɂ���
	local AllyIndex = [];
	local EnemyIndex = [];
	local AllIndex = [];
	for(local i = 0 ; i < 4 ; i++){
		AllyIndex.append(GetAllyIndex_(i));
		AllIndex.append(GetAllyIndex_(i));
	}
	for(local i = 0 ; i < 4 ; i++){
		EnemyIndex.append(GetAllyIndex_(i));
		AllIndex.append(GetEnemyIndex_(i));
	}
	for(local i = 0 ; i < 8 ; i++ )
	{
		local Type = GetInitExistType_(AllIndex[i]);
		if(Type == LIVETYPE.ACTIVE || Type == LIVETYPE.INACTIVE){SetVisible_(AllIndex[i], false);}
	}
	
	Wait_(14)
	
	//�G�t�F�N�g����������
	
	Wait_(1)
	
	SetMotionStepFrame_(master, 1.0);
	
	
	Wait_(18)

	DeleteTask_(MasterTask);	
	//DeleteAllTask_();
	RideMaster_(master);
	/*
	
	local RideFlag =false;
	for(local i = 0 ; i < AllyIndex.len() ; i++){
		if(IsRide_(AllyIndex[i]) == true){RideFlag == true;}
	}
	if(RideFlag == false){
		local cParty = cFullPartyInfo(AllyIndex[0]);
		Task_AnimeMoveCharNoDir_(master, cParty.Empty_Master);
		SetDir_(master , cParty.Rotate_Master)
		//SetMotion_(master, 15, 0);
	}	
	*/
	Wait_(7)
	
	FUNCTION_STACK = FUNCTION_STACK + 1;
	//DebugPrint_FuncName_OUT("Gosign");
}

// �A�C�e���p�J�b�g�C��===========================
function Gosign_Item()
{
	//DebugPrint_FuncName_IN("Gosign_Item");
	FUNCTION_STACK = FUNCTION_STACK + 1;
	ChangeIndexPointData_(BATTLE_COMMON_POINT_DATA);
	
	local AllyFlag = IsAlly_(GetActorIndex_(0));
	local Master;		// �}�X�^�[
	
	if(AllyFlag == true){
		Master = GetAllyMaster_();
	} else {
		Master = GetEnemyMaster_();
	}
	
	for(local i = 0 ; i < 4 ; i++){
		SetVisible_(GetAllyIndex_(i), false);
		SetVisible_(GetEnemyIndex_(i), false);
	}
	
	SetVisible_(Master, true);
	
	//�J�����ʒu
	Task_AnimeMoveCamera_("camera_CutIn_Item","camtgt_CutIn_Item");
	
	//�}�X�^�[�؂藣������
	RideOffMaster_(Master);
	
	//�}�X�^�[��]
	SetDir_(Master, -90);
	
	//�}�X�^�[�@���[�V�����@�z�u
	Task_AnimeMoveCharNoDir_(Master, "move_400_Gosign");
	SetMotion_(Master, MOT_USE_ITEM, 0);
	Task_ChangeMotion_(Master,MOT_USE_ITEM_LOOP,0)
	SetMotionStepFrame_(Master, 1.0);
	
	//UI���f
	StartCombo_(0);
	ItemIconInvisible_();
	
	Wait_(37)
	
	//������
	DeleteAllTask_();
	RideMaster_(Master);
	
	Wait_(5)
	
	//DebugPrint_FuncName_OUT("Gosign_Item");
}



// �㋉�����̏ꍇ�Ɋ�̕����オ�艉�o===================================
//	MultiCount		: ����ڂ̍s�����H
//	EffectEmpty		: �ǂ��Ɋ��\�����邩�iEmpty�j
//	cAction			: cAction�N���X
function HighRankSpellEffect(MultiCount,EffectEmpty,cAction)
{
	//DebugPrint_FuncName_IN("HighRankSpell");
	
	local HighRankFlag = IsHighRankSpell_(0);
	local Index = GetActorIndex_(0)
	local cIndex = cMonsterInfo(Index)
	
	//�㋉���@�̏ꍇ�A��G�t�F�N�g��\��
	if(HighRankFlag == true && cAction.SelfTargetFlag != true){
		local RockEffect = SetPointWorldEffect_("EF000_06_ROCK", EffectEmpty);
		SetEffectScale_(RockEffect , cIndex.HighRankEffectSize)
	}
	
	//���̖͂\������
	MagicRunawayQuake(MultiCount)
	
	//DebugPrint_FuncName_OUT("HighRankSpell");
}

// ���ʃG�t�F�N�g�ǂݍ���===============================================
function LoadEffect()
{
	//DebugPrint_FuncName_IN("LoadEffect");

	// ���������K�v�ɂȂ�G�t�F�N�g���܂Ƃ߂ēǂ݂���
	LoadEffect_("EF010_01_HIT");
	LoadEffect_("EF010_02_HIT_KAISHIN");
	LoadEffect_("EF000_12_MONSTER_DEATH");
	LoadEffect_("EF000_01_MAGIC_ARIA");
	LoadEffect_("EF000_02_SKILL_ARIA");
	LoadEffect_("EF000_14_SMOKE_FOOT");
	LoadEffect_("EF000_03_SHUCHUSEN");
	LoadEffect_("EF000_13_COUNTER");
	LoadEffect_("EF010_09_ATTACK_G_SIZE01")
	
	local ActionNum = GetActionNum_();
	for(local MultiCount = 0 ; MultiCount < ActionNum ; MultiCount++){
		local HighRankFlag = IsHighRankSpell_(MultiCount);
		if(HighRankFlag == true){
			LoadEffect_("EF000_06_ROCK");
		}
		
		local SingleActEffect0 = GetSingleEffectName_(MultiCount,0);
		local SingleActEffect1 = GetSingleEffectName_(MultiCount,1);
		local AllActEffect0 = GetAllEffectName_(MultiCount,0);
		local AllActEffect1 = GetAllEffectName_(MultiCount,1);
		if(SingleActEffect0	!= null){LoadEffect_(SingleActEffect0);}
		if(SingleActEffect1	!= null){LoadEffect_(SingleActEffect1);}
		if(AllActEffect0	!= null){LoadEffect_(AllActEffect0);}
		if(AllActEffect1	!= null){LoadEffect_(AllActEffect1);}
		local TargetNum = GetTargetNum_(MultiCount)
		for(local x = STATUS_TOP ; x < STATUS_NUM ; x++){
			for(local y = 0 ; y < TargetNum ; y++){
				local StateFlag = GetStatusFlag_(x,MultiCount,0)
				if(StateFlag == true){
					if(gStateData[x].Up_Effect			!= null){LoadEffect_(gStateData[x].Up_Effect);}
					if(gStateData[x].Down_Effect		!= null){LoadEffect_(gStateData[x].Down_Effect);}
				}
			}
		}
		//MP�_���[�W�p�G�t�F�N�g
		local DamageType	= GetDamageType_(MultiCount,0)
		switch(DamageType)
		{
			case AFFECT_PARAM.MP:
			case AFFECT_PARAM.MAX_MP:
				//LoadEffect_("EF130_31_MAHOTORA_REC")
				break;
			case AFFECT_PARAM.TS:
				//LoadEffect_("EF130_27_TAMETORA_REC")
				break;
			default:
				break;
		}
		local TargetNum = GetTargetNum_(MultiCount)
		for(local IndexCount = 0 ; IndexCount < TargetNum ; IndexCount++){
			//�V�g�̋C�܂��ꔻ��
			if(IsRezaoral_(MultiCount,IndexCount) || IsAngel_(MultiCount,IndexCount)){
				LoadEffect_(REVIVAL_EFFECT_NAME);
			}
			if(IsLivingDead_(MultiCount,IndexCount)){
				LoadEffect_(LIVING_DEAD_EFFECT_NAME);
			}
		}
		
		if(IsPalpnte_(MultiCount)){
			LoadEffect_("EF130_45_PARUPUNTE")
		}
	}
	
	if(IsScout_()){
		//�X�J�E�g�p�G�t�F�N�g
		LoadEffect_("EF000_07_SA_AURA");
		LoadEffect_("EF000_08_SA_ATTACK");
	}
	
	//�f�o�b�O�p�i��ɍ폜�\��j
	LoadEffect_("EF120_01_HOIMI");
	
	//DebugPrint_FuncName_OUT("LoadEffect");
}


// ��e�����i�P���p�j
//	IndexCount					�FIndexCount�Ԗڂ̑Ώۂ̃����X�^�[�iIndex�ł͂Ȃ��j
//	SEFlag�itrue,false�j		�FSE���Đ����邩�H
//	MotionFlag�itrue,false�j	�F���[�V�������Đ����邩�H
//	MultiCount					�F�s����
//	MultiStageCount				�F���i�q�b�g��
//	PierceFlag					�F�ђʉ��o����
//	cAction						�FcAction�N���X
function SetDamageEffectSE(IndexCount,SEFlag,MotionFlag,MultiCount,MultiStageCount,PierceFlag,cAction)
{
	//DebugPrint_FuncName_IN("SetDamageEffectSE");
	//DebugPrint("	=>	:	IndexCount		:" + IndexCount);
	//DebugPrint("	=>	:	SEFlag			:" + SEFlag);
	//DebugPrint("	=>	:	MotionFlag		:" + MotionFlag);
	//DebugPrint("	=>	:	MultiCount		:" + MultiCount);
	//DebugPrint("	=>	:	MultiStageCount	:" + MultiStageCount);
	//DebugPrint("	=>	:	PierceFlag		:" + PierceFlag);
	
	local Target			= GetTargetIndex_(MultiCount,IndexCount)
	local IsPoisonDamage	= IsPoisonDamage_(MultiCount, IndexCount);
	local Efficacy			= GetActionEfficacy_(MultiCount)
	local TargetType		= GetTargetType_(MultiCount)
	local DamageType		= GetDamageType_(MultiCount,IndexCount)
	local DamageValue		= GetDamageValue_(MultiCount,IndexCount,MultiStageCount)
	local MotionTask		= null;		//���[�V�����^�X�N�Ǘ�
	local IsScout			= false;
	
	switch(Efficacy)
	{
	case EFFICACY.NONE:
		//�����ݒ肪�Ȃ��ꍇ�͉������Ȃ��B
		switch(DamageType)
		{
			case AFFECT_PARAM.HP:
				//���z�C�~��O�Ή�
				MotionTask = SetHealEffect(IndexCount,SEFlag,MotionFlag,MultiCount,MultiStageCount,cAction);
				SetPopEffect(IndexCount,MultiCount,MultiStageCount,cAction)
				break;
			default:
				//�ʏ�͉������Ȃ�
				break;
		}
		break;
	case EFFICACY.ATTACK:
		//�_���[�W�̏ꍇ
		switch(DamageType)
		{
		case AFFECT_PARAM.NONE:
			break;
		default:
			MotionTask = SetDamageEffectSE_DamageInit(IndexCount,SEFlag,MotionFlag,MultiCount,MultiStageCount,PierceFlag,cAction);
			SetPopEffect(IndexCount,MultiCount,MultiStageCount,cAction)
			break;
		}
		break;
	case EFFICACY.HEAL:
		switch(DamageType)
		{
		case AFFECT_PARAM.NONE:
			//���z�C�~�n
			break;
		default:
			//�񕜁E�h���̏ꍇ
			if(DamageValue <= 0){
				//�񕜒l�̏ꍇ
				MotionTask = SetHealEffect(IndexCount,SEFlag,MotionFlag,MultiCount,MultiStageCount,cAction);
				SetPopEffect(IndexCount,MultiCount,MultiStageCount,cAction)
			} else {
				//�_���[�W�l�̏ꍇ
				MotionTask = SetDamageEffectSE_DamageInit(IndexCount,SEFlag,MotionFlag,MultiCount,MultiStageCount,PierceFlag,cAction);
				SetPopEffect(IndexCount,MultiCount,MultiStageCount,cAction)	
			}
			break;
		}
		break;
	case EFFICACY.SUPPORT:
		//�X�e�[�^�X�ω��i�o�t�j�̏ꍇ
		switch(DamageType)
		{
		case AFFECT_PARAM.HP:
			MotionTask = SetDamageEffectSE_DamageInit(IndexCount,SEFlag,MotionFlag,MultiCount,MultiStageCount,PierceFlag,cAction);
			SetPopEffect(IndexCount,MultiCount,MultiStageCount,cAction)
			break;
		case AFFECT_PARAM.MP:
			MotionTask = SetDamageEffectSE_DamageInit(IndexCount,SEFlag,MotionFlag,MultiCount,MultiStageCount,PierceFlag,cAction);
			SetPopEffect(IndexCount,MultiCount,MultiStageCount,cAction)
			break;
		}
		break;
	case EFFICACY.WEAK:
		//�X�e�[�^�X�ω��i�f�o�t�j�̏ꍇ
		switch(DamageType)
		{
		case AFFECT_PARAM.MP:
			MotionTask = SetDamageEffectSE_DamageInit(IndexCount,SEFlag,MotionFlag,MultiCount,MultiStageCount,PierceFlag,cAction);
			SetPopEffect(IndexCount,MultiCount,MultiStageCount,cAction)
			break;
		case AFFECT_PARAM.NONE:
			//NONE�̏ꍇ�A�_���[�W���o���s��Ȃ�
			break;
		case AFFECT_PARAM.TS:
			//NONE�̏ꍇ�A�_���[�W���o���s��Ȃ�
			break;
		case AFFECT_PARAM.HP:
			//HP�̏ꍇ�A�_���[�W���o���s��Ȃ�
			break;
		default:
			MotionTask = SetDamageEffectSE_DamageInit(IndexCount,SEFlag,MotionFlag,MultiCount,MultiStageCount,PierceFlag,cAction);
			break;
		}
		break;
	case EFFICACY.DEFENSE:
		//�h��̏ꍇ���������Ȃ��B
		
		break;
	case EFFICACY.OTHER:
		//Other�̏ꍇ�A���S�������ǂ�������
		//SetStateEffect_Init�̗���̒��Ŏ��S�����͗����̂�
		//�����ł͕s�v�Ȃ͂�
		//MotionTask = SetDeadEffect_ExceptionDead(IndexCount,SEFlag,MotionFlag,MultiCount,MultiStageCount,PierceFlag,cAction);
		break;
	default:
		//�����Ȃ��ꍇ�̓X���[
		//DebugPrint("Error : " + "BattleCommon_function_" + "SetDamageEffectSE" + "\n");
		//DebugPrint("		<= Efficacy		: " + Efficacy + "\n")
		ScriptStop()
		break;
	}
	
	//��e���K�[�h�����������b�Z�[�W
	SetDamageGuardFeatMessage(MultiCount,IndexCount,MultiStageCount)
	
	//DebugPrint_FuncName_OUT("SetDamageEffectSE");
	//DebugPrint("	<=	:	MotionTask		:" + MotionTask);
	return MotionTask;
	
}

// ��e�����i���i�p�j
//	IndexCount					�FIndexCount�Ԗڂ̑Ώۂ̃����X�^�[�iIndex�ł͂Ȃ��j
//	SEFlag�itrue,false�j		�FSE���Đ����邩�H
//	MotionFlag�itrue,false�j	�F���[�V�������Đ����邩�H
//	MultiCount					�F�s����
//	MultiStageCount				�F���i�q�b�g��
//	cAction						�FcAction�N���X
//	PopCount					�F�o���|�b�v�͉��ڂ��H
function SetBAKURETSUDamageEffectSE(IndexCount,SEFlag,MotionFlag,MultiCount,MultiStageCount,cAction,PopCount)
{
	//DebugPrint_FuncName_IN("SetBAKURETSUDamageEffectSE");
	//DebugPrint("	=>	:	IndexCount		:" + IndexCount);
	//DebugPrint("	=>	:	SEFlag			:" + SEFlag);
	//DebugPrint("	=>	:	MotionFlag		:" + MotionFlag);
	//DebugPrint("	=>	:	MultiCount		:" + MultiCount);
	//DebugPrint("	=>	:	MultiStageCount	:" + MultiStageCount);
	
	local Target			= GetTargetIndex_(MultiCount,IndexCount)
	local IsPoisonDamage	= IsPoisonDamage_(MultiCount, IndexCount);
	local Efficacy			= GetActionEfficacy_(MultiCount)
	local TargetType		= GetTargetType_(MultiCount)
	local MotionTask		= null;		//���[�V�����^�X�N�Ǘ�
	local DamageValue		= GetDamageValue_(MultiCount,IndexCount,MultiStageCount)
	
	switch(Efficacy)
	{
		case EFFICACY.NONE:
			//�����ݒ肪�Ȃ��ꍇ�͉������Ȃ��B
			break;
		case EFFICACY.ATTACK:
			//�_���[�W�̏ꍇ
			MotionTask = SetBAKURETSUDamageEffectSE_DamageInit(IndexCount,SEFlag,MotionFlag,MultiCount,MultiStageCount,cAction);
			SetBAKURETSUPopEffect(IndexCount,MultiCount,MultiStageCount,cAction,PopCount)
			break;
		case EFFICACY.HEAL:
			//�񕜁E�h���̏ꍇ
			if(DamageValue <= 0){
				//�񕜒l�̏ꍇ
				SetHealEffect(IndexCount,SEFlag,MotionFlag,MultiCount,MultiStageCount,cAction);
				SetBAKURETSUPopEffect(IndexCount,MultiCount,MultiStageCount,cAction,PopCount)
			} else {
				MotionTask = SetBAKURETSUDamageEffectSE_DamageInit(IndexCount,SEFlag,MotionFlag,MultiCount,MultiStageCount,cAction);
				SetBAKURETSUPopEffect(IndexCount,MultiCount,MultiStageCount,cAction,PopCount)
			}
			break;
		case EFFICACY.SUPPORT:
			//�X�e�[�^�X�ω��i�o�t�j�̏ꍇ
			break;
		case EFFICACY.WEAK:
			//�X�e�[�^�X�ω��i�f�o�t�j�̏ꍇ
			local DamageType = GetDamageType_(MultiCount,IndexCount)
			switch(DamageType)
			{
			case AFFECT_PARAM.MP:
				MotionTask = SetBAKURETSUDamageEffectSE_DamageInit(IndexCount,SEFlag,MotionFlag,MultiCount,MultiStageCount,cAction);
				SetPopEffect(IndexCount,MultiCount,MultiStageCount,cAction)
				break;
			case AFFECT_PARAM.NONE:
				//NONE�̏ꍇ�A�_���[�W���o���s��Ȃ�
				break;
			case AFFECT_PARAM.TS:
				//NONE�̏ꍇ�A�_���[�W���o���s��Ȃ�
				break;
			case AFFECT_PARAM.HP:
				//HP�̏ꍇ�A�_���[�W���o���s��Ȃ�
				break;
			default:
				MotionTask = SetBAKURETSUDamageEffectSE_DamageInit(IndexCount,SEFlag,MotionFlag,MultiCount,MultiStageCount,cAction);
				break;
			}
			break;
		case EFFICACY.DEFENSE:
			//�h��̏ꍇ���������Ȃ��B
			break;
		case EFFICACY.OTHER:
			//Other�̏ꍇ�A���S�������ǂ�������
			MotionTask = SetDeadEffect_ExceptionDead(IndexCount,SEFlag,MotionFlag,MultiCount,MultiStageCount,PierceFlag,cAction);
			break;
		default:
			//�����Ȃ��ꍇ�̓X���[
			//DebugPrint("Error!	: " + "SetBAKURETSUDamageEffectSE" + "\n")
			//DebugPrint("Efficacy	: " + Efficacy + "\n")
			ScriptStop()
			break;
	}
	
	//��e���K�[�h�����������b�Z�[�W
	SetDamageGuardFeatMessage(MultiCount,IndexCount,MultiStageCount)
	
	//DebugPrint_FuncName_OUT("SetBAKURETSUDamageEffectSE");
	//DebugPrint("	<=	:	MotionTask		:" + MotionTask);
	//�߂�l�̐ݒ�
	return MotionTask;
	
}

//�_���[�W���󂯂�ꍇ�͂��̏���
//		IndexCount		: �ΏێҔԍ��iIndex�ԍ��Ƃ͈قȂ�j
//		SEFlag			: SE���Đ����邩�H
//		Motion			: Motion���Đ����邩�H
//		MultiCount		: ����ڂ̍s�����H
//		MultiStageCount	: ���i�ڂ̍U�����H
//		PierceFlag		: �ђʉ��o����
//		cAction			: cAction�N���X
function SetDamageEffectSE_DamageInit(IndexCount,SEFlag,MotionFlag,MultiCount,MultiStageCount,PierceFlag,cAction)
{
	//DebugPrint_FuncName_IN("SetDamageEffectSE_DamageInit");
	//local ArgList =	["IndexCount"	,	IndexCount
	//				,"SEFlag"	,	SEFlag
	//				,"MotionFlag"	,	MotionFlag
	//				,"MultiCount"	,	MultiCount
	//				,"MultiStageCount"	,	MultiStageCount
	//				,"PierceFlag"	,	PierceFlag
	//				]
	//DebugPrint_functionParam("SetDamageEffectSE_DamageInit" , ArgList)
	
	local IsCritical		= IsCritical_(MultiCount , IndexCount, MultiStageCount);
	local IsMiss			= IsMiss_(MultiCount, IndexCount, MultiStageCount);
	local IsDead			= IsDead_(MultiCount, IndexCount);
	local IsGuard			= IsGuard_(MultiCount, IndexCount);
	local IsAbsorption		= IsAbsorb_(MultiCount, IndexCount);
	local IsReflect			= IsReflect_(MultiCount, IndexCount);
	local IsRevival			= IsRevival_(MultiCount, IndexCount);
	local IsGambleBody		= IsGambleBody_(MultiCount, IndexCount, MultiStageCount);
	local IsCriticalGuard	= IsActiveCriticalGuard(MultiCount, IndexCount, MultiStageCount);
	local MotionTask		= null;
	local Efficacy			= GetActionEfficacy_(MultiCount)
	local DamageType		= GetDamageType_(MultiCount,IndexCount,MultiStageCount)
	local IsTeraAttack		= IsTeraAttack_(MultiCount)
	local DeathValue		= GetStatusValue_(STATUS.DEATH, MultiCount,IndexCount)	//�����̏�Ԉُ��SetStateEffect_Init�Ŏ��S�����邽��
	
	//local ListStart =	"<<SetDamageEffectSE_DamageInit : Information>>"
	//local List =		["IsCritical"		,	IsCritical
	//					,"IsMiss"	,	IsMiss
	//					,"IsDead"	,	IsDead
	//					,"IsGuard"	,	IsGuard
	//					,"IsAbsorption"	,	IsAbsorption
	//					,"IsReflect"	,	IsReflect
	//					,"IsRevival"	,	IsRevival
	//					,"IsGambleBody"	,	IsGambleBody
	//					,"IsCriticalGuard"	,	IsCriticalGuard
	//					,"Efficacy"	,	DebugPrint_Efficacy(Efficacy)
	//					,"DamageType"	,	DebugPrint_DamageType(DamageType)
	//					,"IsTeraAttack"	,	IsTeraAttack
	//					,"StatusDeadCheck"	,StatusDeadCheck
	//					]
	//local ListEnd =		"LINE"
	//local ListFront =	null
	//DebugPrint_OneList(List , ListStart , ListEnd , ListFront)
	
	if(IsDead == true && IsTeraAttack == false && DeathValue == 0){	//���S�̏ꍇ
		MotionTask = SetDeadEffect(IndexCount,SEFlag,MotionFlag,MultiCount,MultiStageCount,PierceFlag,cAction);
	} else if(IsMiss == true && IsReflect == false){		//�~�X�̏ꍇ
		MotionTask = SetMissEffect(IndexCount,SEFlag,MotionFlag,MultiCount,MultiStageCount,cAction);
	} else if(IsGuard == true){						//�h��̏ꍇ
		MotionTask = SetGuardEffect(IndexCount,SEFlag,MotionFlag,MultiCount,MultiStageCount,cAction);
	} else if(IsAbsorption == true){
		MotionTask = SetAbsorptionEffect(IndexCount,SEFlag,MotionFlag,MultiCount,MultiStageCount,cAction);
	} else if(IsReflect == true) {					//���˂̏ꍇ
		MotionTask = SetReflectEffect(IndexCount,SEFlag,MotionFlag,MultiCount,MultiStageCount,cAction);
	} else if(IsGambleBody == true) {				//�M�����u���{�f�B�̏ꍇ
		MotionTask = SetReflectEffect(IndexCount,SEFlag,MotionFlag,MultiCount,MultiStageCount,cAction);
	} else if(IsCriticalGuard == true) {			//��S���S�K�[�h�̏ꍇ
		MotionTask = SetReflectEffect(IndexCount,SEFlag,MotionFlag,MultiCount,MultiStageCount,cAction);
	} else if(IsCritical == true && IsReflect == false && IsGambleBody == false){		//��S�̏ꍇ
		MotionTask = SetCriticalEffect(IndexCount,SEFlag,MotionFlag,MultiCount,MultiStageCount,cAction);
	} else {										//�ʏ�_���[�W
		if(Efficacy != EFFICACY.WEAK){
			//EFFICACY.WEAK�ȊO�́A�_���[�W����
			MotionTask = SetNormalDamageEffect(IndexCount,SEFlag,MotionFlag,MultiCount,MultiStageCount,cAction);
		} else {
			//EFFICACY.WEAK�̏ꍇ�́A�ʏ�̃_���[�W�������s��Ȃ�
			if(DamageType == AFFECT_PARAM.MP){
				//MP�_���[�W�̏ꍇ
				MotionTask = SetMPDamageEffect(IndexCount,SEFlag,MotionFlag,MultiCount,MultiStageCount,cAction)
			}
		}
	}
	//DebugPrint_FuncName_OUT("SetDamageEffectSE_DamageInit");
	//DebugPrint("	<=	:	MotionTask		:" + MotionTask);
	return MotionTask;
}


//�_���[�W���󂯂�ꍇ�͂��̏����i���i�U���p�j
//		IndexCount		: �ΏێҔԍ��iIndex�ԍ��Ƃ͈قȂ�j
//		SEFlag			: SE���Đ����邩�H
//		Motion			: Motion���Đ����邩�H
//		MultiCount		: ����ڂ̍s�����H
//		MultiStageCount	: ���i�ڂ̍U�����H
//		cAction			: cAction�N���X
function SetBAKURETSUDamageEffectSE_DamageInit(IndexCount,SEFlag,MotionFlag,MultiCount,MultiStageCount,cAction)
{
	//DebugPrint_FuncName_IN("SetBAKURETSUDamageEffectSE_DamageInit");
	local IsCritical		= IsCritical_(MultiCount , IndexCount, MultiStageCount);
	local IsMiss			= IsMiss_(MultiCount , IndexCount, MultiStageCount);
	local IsDead			= IsDead_(MultiCount , IndexCount);
	local IsGuard			= IsGuard_(MultiCount , IndexCount);
	local IsAbsorption		= IsAbsorb_(MultiCount , IndexCount)
	local IsReflect			= IsReflect_(MultiCount , IndexCount);
	local IsRevival			= IsRevival_(MultiCount , IndexCount);
	local MotionTask		= null;
	local Efficacy			= GetActionEfficacy_(MultiCount)
	local DamageType		= GetDamageType_(MultiCount,IndexCount,MultiStageCount)
	local TargetNum			= GetTargetNum_(MultiCount)
	local IsTeraAttack		= IsTeraAttack_(MultiCount)
	local DeathValue		= GetStatusValue_(STATUS.DEATH, MultiCount,IndexCount)	//�����̏�Ԉُ��SetStateEffect_Init�Ŏ��S�����邽��
	
	//�^�[�Q�b�g�^�C�v��ݒ肷��
	local TargetType = GetTargetType_(MultiCount)
	
	if(IsDead == true && IsTeraAttack == false && DeathValue == 0){ //���S�̏ꍇ�i�A���̏ꍇ�͍ŏI�i�̂݁j
		MotionTask = SetDeadEffect(IndexCount,SEFlag,MotionFlag,MultiCount,MultiStageCount,false,cAction);
	} else if(IsMiss == true && IsReflect == false){	//�~�X�̏ꍇ
		MotionTask = SetMissEffect(IndexCount,SEFlag,MotionFlag,MultiCount,MultiStageCount,cAction);
	} else if(IsCritical == true && IsReflect == false && IsGuard == false){	//��S�̏ꍇ
		MotionTask = SetCriticalEffect(IndexCount,SEFlag,MotionFlag,MultiCount,MultiStageCount,cAction);
	} else if(IsGuard == true){			//�h��̏ꍇ
		MotionTask = SetGuardEffect(IndexCount,SEFlag,MotionFlag,MultiCount,MultiStageCount,cAction);
	} else if(IsAbsorption == true){	//�z���̏ꍇ�i�����ł����Ƃ��p�j
		MotionTask = SetAbsorptionEffect(IndexCount,SEFlag,MotionFlag,MultiCount,MultiStageCount,cAction);
	} else if(IsReflect == true) {		//���˂̏ꍇ
		MotionTask = SetReflectEffect(IndexCount,SEFlag,MotionFlag,MultiCount,MultiStageCount,cAction);
	} else {							//�ʏ�_���[�W
		if(Efficacy != EFFICACY.WEAK){
			//EFFICACY.WEAK�ȊO�́A�_���[�W����
			MotionTask = SetNormalDamageEffect(IndexCount,SEFlag,MotionFlag,MultiCount,MultiStageCount,cAction);
		} else {
			//EFFICACY.WEAK�̏ꍇ�́A�ʏ�̃_���[�W�������s��Ȃ�
			if(DamageType == AFFECT_PARAM.MP){
				//MP�_���[�W�̏ꍇ
				MotionTask = SetMPDamageEffect(IndexCount,SEFlag,MotionFlag,MultiCount,MultiStageCount,cAction)
			}
		}
	}
	// �q�b�g������Ƀ~�X������ƃ_���[�W���[�V�����̂܂܌ł܂��Ă��܂��̂őҋ@�ɖ߂�
	// DeleteTask�őҋ@�ɖ߂��^�X�N��������邽��
	if(MotionTask == null){
		local Target = GetTargetIndex_(MultiCount,IndexCount)
		Task_ChangeMotion_(Target, MOT_WAIT, 1);
	}

	//DebugPrint_FuncName_OUT("SetBAKURETSUDamageEffectSE_DamageInit");
	//DebugPrint("	<=	:	MotionTask		:" + MotionTask);
	return MotionTask;
}

// ��S�������ꍇ
function SetCriticalEffect(IndexCount,SEFlag,MotionFlag,MultiCount,MultiStageCount,cAction)
{
	//DebugPrint_FuncName_IN("SetCriticalEffect");
	//DebugPrint("	=>	IndexCount			:	" + IndexCount);
	//DebugPrint("	=>	SEFlag				:	" + SEFlag);
	//DebugPrint("	=>	MotionFlag			:	" + MotionFlag);
	//DebugPrint("	=>	MultiCount			:	" + MultiCount);
	//DebugPrint("	=>	MultiStageCount		:	" + MultiStageCount);
	
	local Target		= GetTargetIndex_(MultiCount,IndexCount)
	local Actor			= GetActorIndex_(MultiCount)
	local TargetType	= GetTargetType_(MultiCount)
	local MotionTask	= null;
	
	EffParamSizeEffect_NoSE(Target,"EF010_02_HIT_KAISHIN");
	if(SEFlag == true){ReplaySE_(cAction.CriticalSE);}
	StopEarthQuake_();
	StartEarthQuake_(20, 5 , 10);
	if(MotionFlag == true){
		SetMotion_(Target, MOT_DAMAGE, 4);
		MotionTask = Task_ChangeMotion_(Target, MOT_WAIT, 4);
	}
	
	//�߂�l�̐ݒ�
	//DebugPrint_FuncName_OUT("SetCriticalEffect");
	//DebugPrint("	<=	:	MotionTask		:" + MotionTask);
	return MotionTask;
}

// ���i��S�������ꍇ
function SetBAKURETSUCriticalEffect(IndexCount,SEFlag,MotionFlag,MultiCount,MultiStageCount,cAction)
{
	//DebugPrint_FuncName_IN("SetBAKURETSUCriticalEffect");
	//DebugPrint("	=>	IndexCount			:	" + IndexCount);
	//DebugPrint("	=>	SEFlag				:	" + SEFlag);
	//DebugPrint("	=>	MotionFlag			:	" + MotionFlag);
	//DebugPrint("	=>	MultiCount			:	" + MultiCount);
	//DebugPrint("	=>	MultiStageCount		:	" + MultiStageCount);
	
	local Target		= GetTargetIndex_(MultiCount,IndexCount)
	local Actor			= GetActorIndex_(MultiCount)
	local TargetType	= GetTargetType_(MultiCount)
	local MotionTask	= null;
	
	EffParamSizeEffect_NoSE(Target,"EF010_02_HIT_KAISHIN");
	if(SEFlag == true){
		ReplaySE_(cAction.CriticalSE);
	} else {};
	StartEarthQuake_(20, 5, 10);
	if(MotionFlag == true){
		SetMotion_(Target, MOT_DAMAGE, 4);
		MotionTask = Task_ChangeMotion_(Target, MOT_WAIT, 4);
	}
	
	//�߂�l�̐ݒ�
	//DebugPrint_FuncName_OUT("SetBAKURETSUCriticalEffect");
	//DebugPrint("	<=	:	MotionTask		:" + MotionTask);
	return MotionTask;
}
// �~�X��
function SetMissEffect(IndexCount,SEFlag,MotionFlag,MultiCount,MultiStageCount,cAction)
{
	//DebugPrint_FuncName_IN("SetMissEffect");
	//local ArgList =		["IndexCount"	,	IndexCount
	//					,"SEFlag"	,	SEFlag
	//					,"MotionFlag"	,	MotionFlag
	//					,"MultiCount"	,	MultiCount
	//					,"MultiStageCount"	,	MultiStageCount
	//					]
	//DebugPrint_functionParam("SetMissEffect" , ArgList)
	
	//�^�[�Q�b�g�C���f�b�N�X�̐���
	local Target		= GetTargetIndex_(MultiCount,IndexCount)
	local TargetType	= GetTargetType_(MultiCount)
	local MotionTask	= null;
	
	
	if(SEFlag == true){
		ReplaySE_(cAction.MissSE);
	}
	
	//�߂�l�̐ݒ�
	//DebugPrint_FuncName_OUT("SetMiss");
	//DebugPrint("	<=	:	MotionTask		:" + MotionTask);
	return MotionTask;
}

// ���莀�S���i�ʏ�_���[�W�j
//IndexCount		:���̖ڂ̑Ώۂ��H
//SEFlag			:�r�d���Đ����邩�H
//MotionFlag		:���[�V�������Đ����邩�H
//MultiCount		:����ڂ̍s�����H
//MultiStageCount	:���i�ڂ̍s�����H
//PierceFlag		:�ђʉ��o���H
//cAction			:�s���ԍ����Q�Ƃ���cActionInfo
function SetDeadEffect(IndexCount,SEFlag,MotionFlag,MultiCount,MultiStageCount,PierceFlag,cAction)
{
	//DebugPrint_FuncName_IN("SetDeadEffect");
	//�f�o�b�O�o�͗p
	//local ArgList =		["IndexCount"	,	IndexCount
	//					,"SEFlag"	,	SEFlag
	//					,"MotionFlag"	,	MotionFlag
	//					,"MultiCount"	,	MultiCount
	//					,"MultiStageCount"	,	MultiStageCount
	//					,"PierceFlag"	,	PierceFlag
	//					]
	//DebugPrint_functionParam("SetDeadEffect" , ArgList)
	
	local Target		= GetTargetIndex_(MultiCount,IndexCount)
	local Actor			= GetActorIndex_(MultiCount)
	local IsMiss 		= IsMiss_(MultiCount,IndexCount,MultiStageCount);//Miss����
	local TargetType	= GetTargetType_(MultiCount)
	local MotionTask	= null;
	local ActHitNum		= GetActHitNum_(MultiCount,IndexCount)
	local AllyFlag		= IsAlly_(Target);
	local RideFlag		= IsRide_(Target);
	local MasterKind	= GetMasterKind_(AllyFlag);
	local isCritical	= IsCritical_(MultiCount,IndexCount,MultiStageCount);
	
	//if(IsTeraAttack_(MultiCount) == true){return;}
	
	if(isCritical){
		SetCriticalEffect(IndexCount,SEFlag,MotionFlag,MultiCount,MultiStageCount,cAction)
	} else {
		if(IsMiss == true){
			SetMissEffect(IndexCount,SEFlag,MotionFlag,MultiCount,MultiStageCount,cAction)
		} else {
			SetNormalDamageEffect(IndexCount,SEFlag,MotionFlag,MultiCount,MultiStageCount,cAction)
		}
	}
	
	//���i���莞�ɂ́A�ŏI�i�ȊO�ł͒ʏ폈���ɖ߂�p�ɂ���B
	if(MultiStageCount != ActHitNum-1){
		return;
	}
	
	SetVisible_(Target,true);
	SetAlpha_(Target,1.0);
	
	if(cAction.StateDamage[IndexCount] == 0){
		//�_���[�W�Ȃ��̎��S�̏ꍇ
		MotionFlag = false;
	} else {
		//�_���[�W����̎��S�̏ꍇ
		if(PierceFlag != true){
			//�ђʎ��ɂ́A�q�b�g�G�t�F�N�g��\�����Ȃ�
			EffParamSizeEffect(Target,cAction.HitEffect);
		}
	}
	
	//���S���o
	SetDeadEffect_MonsterEffectSE(Target , MotionFlag , SEFlag)
	
	//�}�X�^�[��������
	SetDeadEffect_RideOff(Target)
	
	//���S�����L�����N�^�[�̍s������UI����폜
	SetDeadEffect_DeleteAllow(Target)
	
	//�߂�l�̐ݒ�
	//DebugPrint_FuncName_OUT("SetDeadEffect");
	//DebugPrint("	<=	:	MotionTask		:" + MotionTask);
	return MotionTask;
}

// ���莀�S���i�e���ǉ��_���[�W���̎��S����j
//IndexCount		:���̖ڂ̑Ώۂ��H
//SEFlag			:�r�d���Đ����邩�H
//MotionFlag		:���[�V�������Đ����邩�H
//MultiCount		:����ڂ̍s�����H
//MultiStageCount	:���i�ڂ̍s�����H
//PierceFlag		:�ђʉ��o���H
//cAction			:�s���ԍ����Q�Ƃ���cActionInfo
function SetDeadEffect_TeraDamage(MultiCount,IndexCount,SEFlag,MotionFlag,cAction)
{
	//DebugPrint_FuncName_IN("SetDeadEffect_TeraDamage");
	//local ArgList =	["MultiCount"	,	MultiCount
	//				,"IndexCount"	,	IndexCount
	//				,"SEFlag"	,	SEFlag
	//				,"MotionFlag"	,	MotionFlag
	//				]
	//DebugPrint_functionParam("SetDeadEffect_TeraDamage" , ArgList)
	
	local Target		= GetTargetIndex_(MultiCount,IndexCount)
	local MotionTask	= null;
	
	SetVisible_(Target,true);
	SetAlpha_(Target,1.0);
	
	//���S�����o
	SetDeadEffect_MonsterEffectSE(Target,MotionFlag,SEFlag)
	
	//��������
	SetDeadEffect_RideOff(Target)
	
	//���S�����L�����N�^�[�̍s������UI����폜
	SetDeadEffect_DeleteAllow(Target)
	
	//�߂�l�̐ݒ�
	//DebugPrint_FuncName_OUT("SetDeadEffect_TeraDamage");
	//DebugPrint("	<=	:	MotionTask		:" + MotionTask);
	return MotionTask;
}

//���莀�S���i�X�e�[�^�X���ʁj
function SetDeadEffect_StateDead(MultiCount,IndexCount,SEFlag,MotionFlag,cAction)
{
	//DebugPrint_FuncName_IN("SetDeadEffect_StateDead");
	//local ArgList =	["MultiCount"	,	MultiCount
	//				,"IndexCount"	,	IndexCount
	//				,"SEFlag"	,	SEFlag
	//				,"MotionFlag"	,	MotionFlag
	//				]
	//DebugPrint_functionParam("SetDeadEffect_StateDead" , ArgList)
	
	local Target		= GetTargetIndex_(MultiCount,IndexCount)
	local MotionTask	= null;
	
	SetVisible_(Target,true);
	SetAlpha_(Target,1.0);
	
	//���S�����o
	SetDeadEffect_MonsterEffectSE(Target , MotionFlag , SEFlag)
	
	//��������
	SetDeadEffect_RideOff(Target)
	
	//���S�����L�����N�^�[�̍s������UI����폜
	SetDeadEffect_DeleteAllow(Target)
	
	//�߂�l�̐ݒ�
	//DebugPrint_FuncName_OUT("SetDeadEffect_StateDead");
	//DebugPrint("	<=	:	MotionTask		:" + MotionTask);
	return MotionTask;
	
}

//���莀�S���i��O���S���j
function SetDeadEffect_ExceptionDead(IndexCount,SEFlag,MotionFlag,MultiCount,MultiStageCount,PierceFlag,cAction)
{
	//DebugPrint_FuncName_IN("SetDeadEffect_ExceptionDead");
	//local ArgList =	["IndexCount"		,IndexCount
	//				,"SEFlag"			,SEFlag
	//				,"MotionFlag"		,MotionFlag
	//				,"MultiCount"		,MultiCount
	//				,"MultiStageCount"	,MultiStageCount
	//				,"PierceFlag"		,PierceFlag
	//				]
	//DebugPrint_functionParam("SetDeadEffect_ExceptionDead" , ArgList)
	
	//���S���Ă��Ȃ��ꍇ�́Areturn
	if(IsDead_(MultiCount,IndexCount) == false){return}
	
	local Target		= GetTargetIndex_(MultiCount,IndexCount)
	local MotionTask	= null;
	
	SetVisible_(Target,true);
	SetAlpha_(Target,1.0);
	
	//���S�����o
	SetDeadEffect_MonsterEffectSE(Target , MotionFlag , SEFlag)
	
	//��������
	SetDeadEffect_RideOff(Target)
	
	//���S�����L�����N�^�[�̍s������UI����폜
	SetDeadEffect_DeleteAllow(Target)
	
	//�߂�l�̐ݒ�
	//DebugPrint_FuncName_OUT("SetDeadEffect_ExceptionDead");
	//DebugPrint("	<=	:	MotionTask		:" + MotionTask);
	return MotionTask;
	
}

//���S�������F�L�����N�^�[���S���o
function SetDeadEffect_MonsterEffectSE(Index , MotionFlag , SEFlag)
{
	//DebugPrint_FuncName_IN("SetDeadEffect_MonsterEffectSE");

	EffParamSizeEffect(Index,"EF000_12_MONSTER_DEATH");
	if(SEFlag == true){
		ReplaySE_("SE_BTL_009");
	}
	if(MotionFlag == true){
		SetMotion_(Index, MOT_DAMAGE, 0);
		SetMonsterPlayMoveSE_(Index,false);
		SetMotionStepFrame_(Index, 0.7);
	}
	Task_ObjectFadeOut_(Index, 30)

	//DebugPrint_FuncName_OUT("SetDeadEffect_MonsterEffectSE");
}

//���S�������F���S�����L�����N�^�[�̍s������UI����폜
function SetDeadEffect_DeleteAllow(Index)
{
	if(ExceptionDeadEscapeCheck){
		UnSettingAllowTarget_(Index);
		SetMonsterDead_(Index);
	}
}

//���S�������F���C�h����������
//Index		: �s���Ώێ�
function SetDeadEffect_RideOff(Index)
{
	local AllyFlag		= IsAlly_(Index);
	local RideFlag		= IsRide_(Index);
	local MasterKind	= GetMasterKind_(AllyFlag);
	
	if(RideFlag == true && MasterKind != MASTER_KIND.PROMETHEUS){
		local MasterIndex = GetAllyMaster_();
		if(IsAlly_(Index) != true){
			MasterIndex = GetEnemyMaster_();
		}
		if(AllyFlag == false){MasterIndex = GetEnemyMaster_();}
		local IndexPos = GetPos_(Index);
		local RidePos = GetRidePos_(Index);
		local IndexRidePos = Vec3(IndexPos.x + RidePos.x ,IndexPos.y + RidePos.y , IndexPos.z + RidePos.z)
		local DownPos = Vec3(IndexPos.x + RidePos.x , 0 , IndexPos.z + RidePos.z);
		RideOffMaster_(MasterIndex);
		local MovePath = [IndexRidePos,DownPos]
		local MasterDir = GetDir_(MasterIndex)
		local IndexDir = GetDir_(Index)
		SetPos_(MasterIndex , IndexRidePos)
		Task_PathMoveCharNoDir_(MovePath, 1.0 , MasterIndex)
		SetDir_(MasterIndex , MasterDir)
		SetMotion_(MasterIndex, MOT_SLIP, 0);
		Task_ChangeMotion_(MasterIndex, MOT_SLIP_LOOP, 4);
		SetFall_(MasterIndex,Index)
		Task_ObjectFadeOut_(MasterIndex, 30);
	}
	
}

//�X�e�[�^�X�ُ펀�S�`�F�b�N
//�X�e�[�^�X�����Ŏ��S���������Ă���ꍇ��true��Ԃ�
function SetStateEffect_DeadCheck(MultiCount,IndexCount)
{
	local StatusDeadFlag = false;
	for(local Status = STATUS_TOP ; Status < STATUS_NUM ; Status += 1){
		switch(Status)
		{
		case STATUS.DEATH:
		case STATUS.ERASE:
			//���S�E�h���s��
			local StatusValue		= GetStatusValue_(Status,MultiCount,IndexCount);
			local StatusFlag		= GetStatusFlag_(Status,MultiCount,IndexCount);
			if(StatusValue != 0 && StatusFlag == true && StatusDeadFlag == false){
				StatusDeadFlag = true;
			}
		case STATUS.NOTICE_DEATH:
			//���S�\���͉������Ɏ��S
			local StatusEndFlag		= GetStatusEndFlag_(Status,MultiCount,IndexCount);
			if(StatusEndFlag == true && StatusDeadFlag == false){
				StatusDeadFlag = true;
			}
			break;
		default:
			break;
		}
	}
	return StatusDeadFlag;
}


// �K�[�h����i���̖��Ȃǁj��
function SetGuardEffect(IndexCount,SEFlag,MotionFlag,MultiCount,MultiStageCount,cAction)
{
	//DebugPrint_FuncName_IN("SetGuardEffect");
	//DebugPrint("	=>	IndexCount			:	" + IndexCount);
	//DebugPrint("	=>	SEFlag				:	" + SEFlag);
	//DebugPrint("	=>	MotionFlag			:	" + MotionFlag);
	//DebugPrint("	=>	MultiCount			:	" + MultiCount);
	//DebugPrint("	=>	MultiStageCount		:	" + MultiStageCount);
	
	local Target		= GetTargetIndex_(MultiCount,IndexCount)
	local TargetType	= GetTargetType_(MultiCount)
	local MotionTask	= null;
	
	EffParamSizeEffect(Target,cAction.GuardEffect);
	if(MotionFlag == true){
		//SetMotion_(Target, MOT_WAIT, 4);
		//MotionTask = Task_ChangeMotion_(Target, MOT_WAIT, 4);
	}
	if(SEFlag == true){
		ReplaySE_(cAction.GuardSE);
	}
	
	//�߂�l�̐ݒ�
	//DebugPrint_FuncName_OUT("SetGuardEffect");
	//DebugPrint("	<=	:	MotionTask		:" + MotionTask);
	return MotionTask;
}

// �z����
function SetAbsorptionEffect(IndexCount,SEFlag,MotionFlag,MultiCount,MultiStageCount,cAction)
{
	//DebugPrint_FuncName_IN("SetAbsorptionEffect");
	//DebugPrint("	=>	IndexCount			:	" + IndexCount);
	//DebugPrint("	=>	SEFlag				:	" + SEFlag);
	//DebugPrint("	=>	MotionFlag			:	" + MotionFlag);
	//DebugPrint("	=>	MultiCount			:	" + MultiCount);
	//DebugPrint("	=>	MultiStageCount		:	" + MultiStageCount);
	
	local Target		= GetTargetIndex_(MultiCount,IndexCount)
	local TargetType	= GetTargetType_(MultiCount)
	local MotionTask	= null;
	//EffParamSizeEffect(Target,cAction.AbsorptionEffect);
	if(SEFlag == true){
		ReplaySE_(cAction.AbsorptionSE);
	} else {}
	
	//�߂�l�̐ݒ�
	//DebugPrint_FuncName_OUT("SetAbsorptionEffect");
	//DebugPrint("	<=	:	MotionTask		:" + MotionTask);
	return MotionTask;
}

// ���ˎ�
function SetReflectEffect(IndexCount,SEFlag,MotionFlag,MultiCount,MultiStageCount,cAction)
{
	//DebugPrint_FuncName_IN("SetReflectEffect");
	//DebugPrint("	=>	IndexCount			:	" + IndexCount);
	//DebugPrint("	=>	SEFlag				:	" + SEFlag);
	//DebugPrint("	=>	MotionFlag			:	" + MotionFlag);
	//DebugPrint("	=>	MultiCount			:	" + MultiCount);
	//DebugPrint("	=>	MultiStageCount		:	" + MultiStageCount);

	local Target		= GetTargetIndex_(MultiCount,IndexCount)
	local TargetType	= GetTargetType_(MultiCount)
	local MotionTask	= null;
	
	EffParamSizeEffect(Target,"EF000_13_COUNTER");
	
	if(IsCritical_(MultiCount,IndexCount,MultiStageCount) == true){
		//�N���e�B�J�����菈���������
	}
	
	if(SEFlag == true){
		ReplaySE_(cAction.ReflectSE);
	}
	
	//�߂�l�̐ݒ�
	//DebugPrint_FuncName_OUT("SetReflectEffect");
	//DebugPrint("	<=	:	MotionTask		:" + MotionTask);
	return MotionTask;
}

// �ʏ�_���[�W��
function SetNormalDamageEffect(IndexCount,SEFlag,MotionFlag,MultiCount,MultiStageCount,cAction)
{
	//DebugPrint_FuncName_IN("SetNormalDamageEffect");
	//local ArgList =	["IndexCount"		,IndexCount
	//				,"SEFlag"			,SEFlag
	//				,"MotionFlag"		,MotionFlag
	//				,"MultiCount"		,MultiCount
	//				,"MultiStageCount"	,MultiStageCount
	//				]
	//DebugPrint_functionParam("SetNormalDamageEffect" , ArgList)
	
	
	local Target		= GetTargetIndex_(MultiCount,IndexCount)
	local Actor			= GetActorIndex_(MultiCount)
	local TargetType		= GetTargetType_(MultiCount)
	local MotionTask	= null;
	
	EffParamSizeEffect(Target,"EF010_01_HIT");
	if(SEFlag == true){
		//ReplaySE_(cAction.DamageSE);
	}
	if(MotionFlag == true){
		local Damage = GetDamageValue_(MultiCount, IndexCount, MultiStageCount);
		if(Damage > 0){
			//�_���[�W��0�łȂ��ꍇ�́A��e���[�V�������s��
			SetMotion_(Target, MOT_DAMAGE, 4);
			MotionTask = Task_ChangeMotion_(Target, MOT_WAIT, 4);
		}
	}
	
	//�߂�l�̐ݒ�
	//DebugPrint_FuncName_OUT("SetNormalDamageEffect");
	//DebugPrint("	<=	:	MotionTask		:" + MotionTask);
	return MotionTask;
}

// �l�o�_���[�W��
function SetMPDamageEffect(IndexCount,SEFlag,MotionFlag,MultiCount,MultiStageCount,cAction)
{
	//DebugPrint_FuncName_IN("SetMPDamageEffect");	
	//DebugPrint("	=>	IndexCount			:	" + IndexCount);
	//DebugPrint("	=>	SEFlag				:	" + SEFlag);
	//DebugPrint("	=>	MotionFlag			:	" + MotionFlag);
	//DebugPrint("	=>	MultiCount			:	" + MultiCount);
	//DebugPrint("	=>	MultiStageCount		:	" + MultiStageCount);
	
	local Target		= GetTargetIndex_(MultiCount,IndexCount)
	local Actor			= GetActorIndex_(MultiCount)
	local TargetType		= GetTargetType_(MultiCount)
	local MotionTask	= null;
	
	ReplaySE_("SE_BTL_019")
	
	if(MotionFlag == true){
		local Damage = GetDamageValue_(MultiCount, IndexCount, MultiStageCount);
		if(Damage > 0){
			//�_���[�W��0�łȂ��ꍇ�́A��e���[�V�������s��
			SetMotion_(Target, MOT_DAMAGE, 4);
			MotionTask = Task_ChangeMotion_(Target, MOT_WAIT, 4);
		}
	}
	
	//�߂�l�̐ݒ�
	//DebugPrint_FuncName_OUT("SetMPDamageEffect");
	//DebugPrint("	<=	:	MotionTask		:" + MotionTask);
	return MotionTask;
}

// �񕜂̏ꍇ
function SetHealEffect(IndexCount,SEFlag,MotionFlag,MultiCount,MultiStageCount,cAction)
{
	//DebugPrint_FuncName_IN("SetHealEffect");
	//DebugPrint("	=>	IndexCount			:	" + IndexCount);
	//DebugPrint("	=>	SEFlag				:	" + SEFlag);
	//DebugPrint("	=>	MotionFlag			:	" + MotionFlag);
	//DebugPrint("	=>	MultiCount			:	" + MultiCount);
	//DebugPrint("	=>	MultiStageCount		:	" + MultiStageCount);
	
	local Target		= GetTargetIndex_(MultiCount,IndexCount)
	local TargetType	= GetTargetType_(MultiCount)
	local MotionTask	= null;
	local Value			= GetDamageValue_(MultiCount,IndexCount,MultiStageCount)
	
	
	//�h���̏ꍇ�͉��L
	if(IsRevival_(MultiCount,IndexCount) == true){
		Task_ObjectFadeIn_(Target, 30);
	}
	
	//���E�̖��ȂǂŃ_���[�W�̏ꍇ
	
	
	//�߂�l�̐ݒ�
	//DebugPrint_FuncName_OUT("SetHealEffect");
	//DebugPrint("	<=	:	MotionTask		:" + MotionTask);
	return MotionTask;
}

// �~�X�|�b�v�\��
function SetMissPop(targetIndex, multiStageCount)
{
	local cTarget = cMonsterInfo(targetIndex);
	SetPop_(targetIndex, POPSTYLE.NONE, 0, true, cTarget.PopDate_X[multiStageCount % gPopMaxNum], cTarget.PopDate_Y[multiStageCount % gPopMaxNum], 1.0);
}

//�|�b�v�\����p
function SetPopEffect(IndexCount,MultiCount,MultiStageCount,cAction)
{
	//DebugPrint_FuncName_IN("SetPopEffect");
	//DebugPrint("	=>	IndexCount			:	" + IndexCount);
	//DebugPrint("	=>	MultiCount			:	" + MultiCount);
	//DebugPrint("	=>	MultiStageCount		:	" + MultiStageCount);
	
	local Target		= GetTargetIndex_(MultiCount,IndexCount)
	local cTarget		= cMonsterInfo(Target)
	local AllyFlag		= IsAlly_(Target);
	local DamageValue	= GetDamageValue_(MultiCount,IndexCount,MultiStageCount)
	local DamageType	= GetDamageType_(MultiCount,IndexCount)
	local IsMiss		= IsMiss_(MultiCount,IndexCount,MultiStageCount);
	local IsReflect		= IsReflect_(MultiCount,IndexCount);
	local PopKind		= POPSTYLE.NONE;
	local Efficacy		= GetActionEfficacy_(MultiCount)
	local ActHitNum 	= GetActHitNum_(MultiCount,IndexCount);
	local TargetType	= GetTargetType_(MultiCount)
	
	//�|�b�v��ނ̎擾
	PopKind = SetPopKindCheck(MultiCount,IndexCount,MultiStageCount);
	
	//�|�b�v�pSE�̍Đ�
	SetPopEffect_PlaySE(MultiCount,IndexCount,MultiStageCount,PopKind,cAction)
	
	//�|�b�v�\������
	if(PopKind != POPSTYLE.NONE){
		if(ActHitNum != 0){
			if(IsReflect_(MultiCount,IndexCount) == false
			 && IsGuard_(MultiCount,IndexCount) == false
			 && IsGambleBody_(MultiCount, IndexCount, MultiStageCount) ==false
			 && IsActiveCriticalGuard(MultiCount, IndexCount, MultiStageCount) == false){
				if(DamageValue < 0 && DamageValue != null){
					DamageValue = SetAbsoluteValue(DamageValue)//�|�l�̏ꍇ�͐�Βl�ϊ�
				}
				SetPop_(Target, PopKind, DamageValue, IsMiss,cTarget.PopDate_X[MultiStageCount % gPopMaxNum],cTarget.PopDate_Y[MultiStageCount % gPopMaxNum],1.0);
			}
		}
	}
	
	
	//UI���f
	SetDamageUI_Init(MultiCount,IndexCount,MultiStageCount,cAction)
	
	//DebugPrint_FuncName_OUT("SetPopEffect");
}

//�|�b�v�\����p
function SetBAKURETSUPopEffect(IndexCount,MultiCount,MultiStageCount,cAction,PopCount)
{
	//DebugPrint_FuncName_IN("SetBAKURETSUPopEffect");
	//DebugPrint("	=>	IndexCount			:	" + IndexCount);
	//DebugPrint("	=>	MultiCount			:	" + MultiCount);
	//DebugPrint("	=>	MultiStageCount		:	" + MultiStageCount);
	
	local Target		= GetTargetIndex_(MultiCount,IndexCount)
	local cTarget		= cMonsterInfo(Target);
	local AllyFlag		= IsAlly_(Target);
	local DamageValue	= GetDamageValue_(MultiCount,IndexCount,MultiStageCount)
	local DamageType	= GetDamageType_(MultiCount,MultiStageCount)
	local IsMiss		= IsMiss_(MultiCount,IndexCount,MultiStageCount);
	local IsRefrect		= IsReflect_(MultiCount,IndexCount)
	local PopKind		= POPSTYLE.NONE;
	local Efficacy		= GetActionEfficacy_(MultiCount)
	local MultiStage 	= GetActHitNum_(MultiCount,IndexCount);
	local TargetType	= GetTargetType_(MultiCount)
	local PopSpeed		= 1.0;
	
	//�|�b�v��ނ̎擾
	PopKind = SetPopKindCheck(MultiCount,IndexCount,MultiStageCount);
	//�|�b�v�pSE�̍Đ�
	SetPopEffect_PlaySE(MultiCount,IndexCount,MultiStageCount,PopKind,cAction)

	
	//�|�b�v�\������
	if(PopKind != POPSTYLE.NONE){
		if(MultiStage != 0){
			if(IsReflect_(MultiCount,IndexCount) == false
			 && IsGuard_(MultiCount,IndexCount) == false
			 && IsGambleBody_(MultiCount, IndexCount, MultiStageCount) ==false
			 && IsActiveCriticalGuard(MultiCount, IndexCount, MultiStageCount) == false){
				if(DamageValue < 0 && DamageValue != null){
					DamageValue = SetAbsoluteValue(DamageValue)//�|�l�̏ꍇ�͐�Βl�ϊ�
				}
				switch(TargetType)
				{
				case TARGET.BAKURETSU:
				case TARGET.ALLY_MULTI_RANDOM:
					PopSpeed = 2.0;
					break;
				default:
					break;
				}
				SetPop_(Target, PopKind, DamageValue, IsMiss,cTarget.PopDate_X[PopCount % gPopMaxNum],cTarget.PopDate_Y[PopCount % gPopMaxNum],1.0);
			}
		}
	}
	
	//UI���f
	SetDamageUI_Init(MultiCount,IndexCount,MultiStageCount,cAction)
	
	//DebugPrint_FuncName_OUT("SetBAKURETSUPopEffect");
}

//�|�b�v�\����p�i�݂����j
function SetSubstitutePopEffect(IndexCount, MultiCount, MultiStageCount, cAction)
{
	//DebugPrint_FuncName_IN("SetSubstitutePopEffect");
	//DebugPrint("	=>	IndexCount			:	" + IndexCount);
	//DebugPrint("	=>	MultiCount			:	" + MultiCount);
	//DebugPrint("	=>	MultiStageCount		:	" + MultiStageCount);
	
	local Target		= GetTargetIndex_(MultiCount,IndexCount)
	local cTarget		= cMonsterInfo(Target)
	local AllyFlag		= IsAlly_(Target);
	local DamageValue	= GetDamageValue_(MultiCount,IndexCount,MultiStageCount)
	local DamageType	= GetDamageType_(MultiCount,IndexCount)
	local IsMiss		= IsMiss_(MultiCount,IndexCount,MultiStageCount);
	local IsReflect		= IsReflect_(MultiCount,IndexCount);
	local PopKind		= POPSTYLE.NONE;
	local Efficacy		= GetActionEfficacy_(MultiCount)
	local ActHitNum 	= GetActHitNum_(MultiCount,IndexCount);
	local TargetType	= GetTargetType_(MultiCount)
	
	//�|�b�v��ނ̎擾
	PopKind = SetPopKindCheck(MultiCount,IndexCount,MultiStageCount);
	
	//�|�b�v�pSE�̍Đ�
	SetPopEffect_PlaySE(MultiCount,IndexCount,MultiStageCount,PopKind,cAction)
	
	//�|�b�v�\������
	if(PopKind != POPSTYLE.NONE){
		if(ActHitNum != 0){
			if(IsReflect_(MultiCount, IndexCount)== false
			 && IsGuard_(MultiCount, IndexCount) == false
			 && IsGambleBody_(MultiCount, IndexCount, MultiStageCount) ==false
			 && IsActiveCriticalGuard(MultiCount, IndexCount, MultiStageCount) == false){
				if(DamageValue < 0 && DamageValue != null){
					DamageValue = SetAbsoluteValue(DamageValue)//�|�l�̏ꍇ�͐�Βl�ϊ�
				}
				SetPop_(Target, PopKind, DamageValue, IsMiss,cTarget.PopDate_X[MultiStageCount % gPopMaxNum],cTarget.PopDate_Y[MultiStageCount % gPopMaxNum],1.0);
			}
		}
	}
	
	SetDamageUI_Init(MultiCount,IndexCount,MultiStageCount,cAction)
	
	//DebugPrint_FuncName_OUT("SetSubstitutePopEffect");
}

//�|�b�v��ނ̐ݒ�
function SetPopKindCheck(MultiCount,IndexCount,MultiStageCount)
{
	local Target		= GetTargetIndex_(MultiCount,IndexCount)
	local cTarget		= cMonsterInfo(Target)
	local AllyFlag		= IsAlly_(Target);
	local DamageValue	= GetDamageValue_(MultiCount,IndexCount,MultiStageCount)
	local DamageType	= GetDamageType_(MultiCount,IndexCount)
	local IsMiss		= IsMiss_(MultiCount,IndexCount,MultiStageCount);
	local IsReflect		= IsReflect_(MultiCount,IndexCount);
	local IsAbsorption	= IsAbsorb_(MultiCount,IndexCount)
	local Efficacy		= GetActionEfficacy_(MultiCount)
	local ActHitNum 	= GetActHitNum_(MultiCount,IndexCount);
	local TargetType	= GetTargetType_(MultiCount)
	
	//�߂�l
	local PopKind = POPSTYLE.NONE;
	
	//�|�b�v�̏����ݒ�
	switch (Efficacy)
	{
	case EFFICACY.ATTACK:
		if(ActHitNum == 0){PopKind = POPSTYLE.NONE;}
		switch (DamageType)
		{
		//HP�_���[�W
		case AFFECT_PARAM.HP:
			if(DamageValue >= 0 && IsAbsorption == false){
				if(AllyFlag == true){
					PopKind = POPSTYLE.DAMAGE_ENEMY;
				} else {
					PopKind = POPSTYLE.DAMAGE_ALLY;
				}
			} else if(DamageValue <= 0){
				PopKind = POPSTYLE.HEAL_HP;
			}
			break;
		//MP�_���[�W
		case AFFECT_PARAM.MP:
			if(DamageValue >= 0){
				PopKind = POPSTYLE.DAMAGE_MP;
			} else if(DamageValue < 0){
				PopKind = POPSTYLE.HEAL_MP;
			}
			break;
		//�_���[�W�Ȃ�
		case AFFECT_PARAM.NONE:
			PopKind = POPSTYLE.NONE;
			break;
		//�e���V�����_���[�W
		case AFFECT_PARAM.TS:
			if(cAction.ActEffectFlag == false){
				//SetBoneEffect_("EF130_27_TAMETORA_REC" , Target)
			}
			if(DamageValue< 0){
				PopKind = POPSTYLE.TENSION_DOWN;
			} else {
				PopKind = POPSTYLE.TENSION_UP;
			}
			break;
		//�ő�g�o�_���[�W
		case AFFECT_PARAM.MAX_HP:
			if(AllyFlag == true){
				PopKind = POPSTYLE.DAMAGE_ENEMY;
			} else {
				PopKind = POPSTYLE.DAMAGE_ALLY;
			}
			break;
		//�ő�l�o�_���[�W
		case AFFECT_PARAM.MAX_MP:
			if(cAction.ActEffectFlag == false){
				//SetBoneEffect_("EF130_31_MAHOTORA_REC" , Target)
			}
			PopKind = POPSTYLE.DAMAGE_MP;
			break;
		//����ȊO
		default:
			//DebugPrint("Error : " + "BattleCommon_function_" + "SetPopEffect" + "\n");
			//DebugPrint("Efficacy	: " + Efficacy + "\n")
			ScriptStop()
			break;
		}
		break;
	case EFFICACY.HEAL:
		switch (DamageType)
		{
		case AFFECT_PARAM.HP:
		case AFFECT_PARAM.HMP:
			if(DamageValue <= 0){
				//if(cAction.ActEffectFlag == false){
				//	ReplaySE_("SE_SKL_022")
				//}
				PopKind = POPSTYLE.HEAL_HP;					//�񕜗p�̃|�b�v
			} else {
				//�_���[�W���ɂ͂�����𗘗p
				if(AllyFlag == true){
					PopKind = POPSTYLE.DAMAGE_ENEMY;
				} else {
					PopKind = POPSTYLE.DAMAGE_ALLY;
				}
			}
			break;
		case AFFECT_PARAM.MP:
			if(DamageValue < 0){
				/*if(cAction.ActEffectFlag == false){
					ReplaySE_("SE_SKL_022")
				}*/
				PopKind = POPSTYLE.HEAL_MP;					//�񕜗p�̃|�b�v
			} else {
				//�_���[�W���͂�����𗘗p
				PopKind = POPSTYLE.DAMAGE_MP;
			}
			break;
		default:
			PopKind = POPSTYLE.NONE;//(��)
			break;
		}
		break;
	case EFFICACY.SUPPORT:
		switch (DamageType)
		{
		//HP�_���[�W
		case AFFECT_PARAM.HP:
			if(DamageValue >= 0  && IsAbsorption == false){
				if(AllyFlag == true){
					PopKind = POPSTYLE.DAMAGE_ENEMY;
				} else {
					PopKind = POPSTYLE.DAMAGE_ALLY;
				}
				break;
			} else if(DamageValue <= 0){
				PopKind = POPSTYLE.HEAL_HP;
			}
			break;
		//MP�_���[�W
		case AFFECT_PARAM.MP:
			if(cAction.ActEffectFlag == false){
				if(DamageValue < 0){
					//MP�񕜎���MP�񕜃G�t�F�N�g���o��
					//SetBoneEffect_("EF130_31_MAHOTORA_REC" , Target)
				}
			}
			if(DamageValue >= 0){
				PopKind = POPSTYLE.DAMAGE_MP;
			} else if(DamageValue < 0){
				PopKind = POPSTYLE.HEAL_MP;
			}
			break;
		}
		break;
	case EFFICACY.WEAK:
		switch (DamageType)
		{
		case AFFECT_PARAM.MP:
			if(DamageValue >= 0){
				PopKind = POPSTYLE.DAMAGE_MP;
			} else {
				PopKind = POPSTYLE.HEAL_MP;
			}
		default:
			break;
		}
		break;
	case EFFICACY.OTHER:
		local IsPoisonDamage = IsPoisonDamage_(MultiCount,IndexCount)
		if(IsPoisonDamage == true){						//�Ń_���[�W
			if(AllyFlag == true){
				PopKind = POPSTYLE.DAMAGE_ENEMY;
			} else {
				PopKind = POPSTYLE.DAMAGE_ALLY;
			}
		} else {
			PopKind = POPSTYLE.NONE;//(��)
		}
		break;
	default:
		//�������Ȃ�
		break;
	}
	
	
	return PopKind;
	
}

//����̃|�b�v�\���ŁASE���Đ����邩�H
//MultiCount		�F����ڂ̍s�����H
//IndexCount		�F���̖ڂ̑Ώۂ��H
//MultiStageCount	�F���i�ڂ̍U�����H
//SEFlag			�FSE���Đ����邩�H
//PopKind			�F�|�b�v���
function SetPopEffect_PlaySE(MultiCount,IndexCount,MultiStageCount,PopKind,cAction)
{
	switch(PopKind)
	{
	case POPSTYLE.DAMAGE_ALLY:
	case POPSTYLE.DAMAGE_ENEMY:
	case POPSTYLE.DAMAGE_MP:
	case POPSTYLE.TENSION_UP:
	case POPSTYLE.TENSION_DOWN:
	case POPSTYLE.NONE:
		break;
	case POPSTYLE.HEAL_HP:
		if(cAction.ActEffectFlag == false){
			ReplaySE_("SE_SHA_003")
		}
		break;
	case POPSTYLE.HEAL_MP:
		if(cAction.ActEffectFlag == false){
			ReplaySE_("SE_SHA_004")
		}
		break;
	default:
		//local ListStart =	"*********** function SetPopEffect_PlaySE is Error! ***********"
		//local ListFront =	"�E"
		//local List =			["MultiCount"	,	MultiCount
		//						,"IndexCount"	,	IndexCount
		//						,"MultiStageCount"	,	MultiStageCount
		//						,"PopKind"	,	DebugPrint_PopStyle(PopStyle)
		//						]
		//local ListEnd =		"**************************************************************"
		//DebugPrint_OneList(List , ListStart , ListEnd , ListFront)
		break;
	}
}


//����̍s���Ńe���̒ǉ��_���[�W�������������̊m�F
//MultiCount		: ����ڂ̍s�����H
//SEFlag			: SE���Đ����邩�H
//
function SetTeraPlusDamage_Init(MultiCount,EffectFlag,MotionFlag,cAction)
{
	//DebugPrint_FuncName_IN("SetTeraPlusDamage_Init");
	//DebugPrint("	=>	MultiCount		:" + MultiCount)
	//DebugPrint("	=>	IndexCount		:" + IndexCount)
	//DebugPrint("	=>	MultiStageCount	:" + MultiStageCount)}
	
	//�s���҂����Ȃ��ꍇ��return
	//�s���҂��}�X�^�[�̏ꍇ��return
	if(GetActorIndex_(MultiCount) == INVALID_CHARACTER || IsMaster_(GetActorIndex_(MultiCount)) == true){
		//DebugPrint_FuncName_OUT("SetTeraPlusDamage_Init");
		return;
	}
	
	//�e���A�^�b�N�ł͂Ȃ��ꍇ��return
	if(IsTeraAttack_(MultiCount) == false){
		//DebugPrint_FuncName_OUT("SetTeraPlusDamage_Init");
		return;
	}
	
	Wait_(40)
	
	//�e���U���p�G�t�F�N�g�̕\��
	local cParty = cFullPartyInfo(cAction.Target[0]);
	local TargetNum = GetTargetNum_(MultiCount)
	local EffectParam = SetPointWorldEffect_("EF010_09_ATTACK_G_SIZE01", cParty.EffectEmpty_Area);
	SetEffectScale_(EffectParam, cParty.EffectScale_Area);
	Wait_(15);
	
	for(local IndexCount = 0 ; IndexCount < TargetNum ; IndexCount++){
		SetDamageEffectSE_TeraPlusDamage(MultiCount,IndexCount);
		SetPopEffect_TeraDamage(MultiCount,IndexCount,0)
		SetDamageUI_TeraPlusDamage(MultiCount,IndexCount)

		local DeathValue = GetStatusValue_(STATUS.DEATH, MultiCount,IndexCount)	//�����̏�Ԉُ��SetStateEffect_Init�Ŏ��S�����邽��
		if(IsDead_(MultiCount,IndexCount) && DeathValue == 0){
			SetDeadEffect_TeraDamage(MultiCount,IndexCount,true,MotionFlag,cAction)
		}
	}
	
	Wait_(25)
	//DebugPrint_FuncName_OUT("SetTeraPlusDamage_Init");
}

function SetTeraPlusDamage_Substitute_Init(MultiCount,MotionFlag,cAction)
{
	//DebugPrint_FuncName_IN("SetTeraPlusDamage_Substitute_Init");
	//�s���҂����Ȃ��ꍇ��return
	//�s���҂��}�X�^�[�̏ꍇ��return
	if(GetActorIndex_(MultiCount) == INVALID_CHARACTER || IsMaster_(GetActorIndex_(MultiCount)) == true){
		//DebugPrint_FuncName_OUT("SetTeraPlusDamage_Substitute_Init");
		return;
	}
	
	//�e���A�^�b�N�ł͂Ȃ��ꍇ��return
	if(IsTeraAttack_(MultiCount) == false){
		//DebugPrint_FuncName_OUT("SetTeraPlusDamage_Substitute_Init");
		return;
	}
	
	Wait_(40)
	
	//�e���U���p�G�t�F�N�g�̕\��
	local cParty = cFullPartyInfo(cAction.Target[0]);
	local TargetNum = GetTargetNum_(MultiCount)
	local EffectParam = SetPointWorldEffect_("EF010_09_ATTACK_G_SIZE01", cParty.EffectEmpty_Area);
	local PopCount = 0;
	local MotionTask = null;
	SetEffectScale_(EffectParam, cParty.EffectScale_Area);
	Wait_(15);

	//�����̏�Ԉُ��SetStateEffect_Init�Ŏ��S�����邽��
	//��ł����S�̏�Ԉُ킪����Ύ��S���o���s��Ȃ�
	local StatusDeadCheck = false;
	for(local IndexCount = 0 ; IndexCount < TargetNum ; IndexCount++){
		local DeathValue = GetStatusValue_(STATUS.DEATH, MultiCount,IndexCount)
		if(DeathValue > 0){
			StatusDeadCheck = true;
		}
	}

	for(local IndexCount = 0 ; IndexCount < TargetNum ; IndexCount++){
		if(MotionTask != null){
			DeleteTask_(MotionTask)
			Wait_(10)
		}
		MotionTask = SetDamageEffectSE_TeraPlusDamage(MultiCount,IndexCount);
		SetPopEffect_TeraDamage(MultiCount,IndexCount,PopCount)
		SetDamageUI_TeraPlusDamage(MultiCount,IndexCount)
		
		if(IsDead_(MultiCount,IndexCount) && TargetNum == IndexCount + 1 && StatusDeadCheck == false){
			SetDeadEffect_TeraDamage(MultiCount,IndexCount,true,MotionFlag,cAction)
		}
		PopCount++;
	}
	Wait_(25)
	//DebugPrint_FuncName_OUT("SetTeraPlusDamage_Substitute_Init");
}

//�e���̒ǉ��_���[�W�\��
function SetDamageEffectSE_TeraPlusDamage(MultiCount,IndexCount)
{
	//DebugPrint_FuncName_IN("SetDamageEffectSE_TeraPlusDamage");
	local MissCheck		= SetTeraDamage_MissCheck(MultiCount,IndexCount)
	local MotionTask	= null;
	local Value			= GetTeraDamageValue_(MultiCount,IndexCount);
	local Target		= GetTargetIndex_(MultiCount,IndexCount)
	
	switch(GetDamageType_(MultiCount,IndexCount))
	{
	case AFFECT_PARAM.HP:
	case AFFECT_PARAM.HMP:
	case AFFECT_PARAM.MP:
	case AFFECT_PARAM.MAX_HP:
	case AFFECT_PARAM.MAX_MP:
		if(MissCheck == true){
			//�~�X�̏ꍇ�͉������Ȃ�
		} else if(IsReflect_(MultiCount,IndexCount)){
			//���˂͒ʏ�_���[�W����Ɠ�������
			EffParamSizeEffect(Target,"EF000_13_COUNTER");
		/*} else if(IsReflect_(MultiCount,IndexCount)){
			//�h��͒ʏ�_���[�W����Ɠ�������
			EffParamSizeEffect(Target,"EF000_13_COUNTER");*/
		} else {
			//�i�e���_���[�W�ł͋z�����������Ȃ��j
			//�ʏ�_���[�W����
			EffParamSizeEffect(Target,"EF010_01_HIT");
			if(Value > 0){
				//�_���[�W���O���傫���ꍇ
				SetMotion_(Target, MOT_DAMAGE, 4);
				MotionTask = Task_ChangeMotion_(Target, MOT_WAIT, 4);
				
			} else {
				//�_���[�W���O�̏ꍇ
				
			}
		}
		break;
	default:
		break;
	}
	//DebugPrint_FuncName_OUT("SetDamageEffectSE_TeraPlusDamage");
	return MotionTask;
}

//�|�b�v�\���Q�e���ǉ��_���[�W�p
function SetPopEffect_TeraDamage(MultiCount,IndexCount,PopCount)
{
	//DebugPrint_FuncName_IN("SetPopEffect_TeraDamage");
	//DebugPrint("	=>	MultiCount		:" + MultiCount)
	//DebugPrint("	=>	IndexCount		:" + IndexCount)
	
	//���ˁE�h��̏ꍇ��return
	if(IsReflect_(MultiCount,IndexCount)){return;}
	if(IsGuard_(MultiCount,IndexCount)){return;}
	
	local ActHitNum	= GetActHitNum_(MultiCount,IndexCount)
	local MissCheck	= SetTeraDamage_MissCheck(MultiCount,IndexCount);
	
	//�e���̒ǉ��_���[�W��Miss���ǂ�����Script���Ŕ���
	local Value			= GetTeraDamageValue_(MultiCount,IndexCount);
	local AllyFlag		= IsAlly_(GetTargetIndex_(MultiCount,IndexCount));
	local Target		= GetTargetIndex_(MultiCount,IndexCount);
	local cTarget		= cMonsterInfo(Target)
	local PopKind;
	
	//�_���[�W�|�b�v��ނ̎w��
	switch(GetDamageType_(MultiCount,IndexCount))
	{
	case AFFECT_PARAM.HP:
	case AFFECT_PARAM.HMP:
		//HP�_���[�W
		if(AllyFlag){
			PopKind = POPSTYLE.DAMAGE_ENEMY;
		} else {
			PopKind = POPSTYLE.DAMAGE_ALLY;
		}
		break;
	case AFFECT_PARAM.MP:
		//MP�_���[�W
		PopKind = POPSTYLE.DAMAGE_MP
		break;
	case AFFECT_PARAM.MAX_HP:
		//�ő�HP�_���[�W
		if(AllyFlag){
			PopKind = POPSTYLE.DAMAGE_ENEMY;
		} else {
			PopKind = POPSTYLE.DAMAGE_ALLY;
		}
		break;
	case AFFECT_PARAM.MAX_MP:
		//�ő�MP�_���[�W
		PopKind = POPSTYLE.DAMAGE_MP
		break;
	default:
		break;
	}
/*	print("MultiCount	: " + MultiCount + "\n")
	print("IndexCount	: " + IndexCount + "\n")
	print("Target	: " + Target + "\n")
	print("PopKind	: " + PopKind + "\n")
	print("Value	: " + Value + "\n")
	print("MissCheck	: " + MissCheck + "\n")
	print("cTarget.PopDate_X[0]	: " + cTarget.PopDate_X[0] + "\n")
	print("cTarget.PopDate_Y[0]	: " + cTarget.PopDate_Y[0] + "\n")*/
	
	SetPop_(Target,PopKind,Value,MissCheck, cTarget.PopDate_X[PopCount] , cTarget.PopDate_Y[PopCount] , 1.0);
	//DebugPrint_FuncName_OUT("SetPopEffect_TeraDamage");
}

//�e���ǉ��U�����~�X���ǂ����𔻒肵�Ԃ�
//	MultiCOunt	: ����ڂ̍s�����H
//	IndexCount	: ���̖ڂ̑Ώۂ��H
function SetTeraDamage_MissCheck(MultiCount,IndexCount)
{
	local MissCheck = false;
	//DebugPrint_FuncName_IN("SetTeraDamage_MissCheck");
	//DebugPrint("	=>	MultiCount		:" + MultiCount)
	//DebugPrint("	=>	IndexCount		:" + IndexCount)
	//�e���̒ǉ��_���[�W��Miss���ǂ�����Script���Ŕ���
	local ActHitNum = GetActHitNum_(MultiCount,IndexCount)
	for(local MultiStageCount = 0 ; MultiStageCount < ActHitNum ; MultiStageCount++){
		if(IsMiss_(MultiCount,IndexCount,MultiStageCount) != false && MissCheck == false){
			MissCheck = true;
		}
	}
	//DebugPrint_FuncName_OUT("SetTeraDamage_MissCheck");
	//DebugPrint("	<=	MissCheck		:" + MissCheck)
	return MissCheck;
}

//�e���ǉ��U�������˂��ǂ����𔻒肵�Ԃ�
//	MultiCOunt	: ����ڂ̍s�����H
//	IndexCount	: ���̖ڂ̑Ώۂ��H
function SetTeraDamage_RefrectCheck(MultiCount,IndexCount)
{
	local MissCheck = false;
	//DebugPrint_FuncName_IN("SetTeraDamage_RefrectCheck");
	//DebugPrint("	=>	MultiCount		:" + MultiCount)
	//DebugPrint("	=>	IndexCount		:" + IndexCount)
	//�e���̒ǉ��_���[�W��Miss���ǂ�����Script���Ŕ���
	local ActHitNum = GetActHitNum_(MultiCount,IndexCount)
	for(local MultiStageCount = 0 ; MultiStageCount < ActHitNum ; MultiStageCount++){
		if(IsMiss_(MultiCount,IndexCount,MultiStageCount) != false && MissCheck == false){
			MissCheck = true;
		}
	}
	//DebugPrint_FuncName_OUT("SetTeraDamage_RefrectCheck");
	//DebugPrint("	<=	MissCheck		:" + MissCheck)
	return MissCheck;
}

//�_���[�W������UI���f
function SetDamageUI_Init(MultiCount,IndexCount,MultiStageCount,cAction)
{
	//DebugPrint_FuncName_IN("SetDamageUI_Init");
	//DebugPrint("	=>	MultiCount		:" + MultiCount)
	//DebugPrint("	=>	IndexCount		:" + IndexCount)
	//DebugPrint("	=>	MultiStageCount	:" + MultiStageCount)
	
	//DebugPrint("cAction.MultiStageCount	:" + cAction.MultiStageCount)
	
	//�����UI�ւ̔��f(HP�_���[�W)
	if(cAction.MultiStageCount[IndexCount] != 0){
		local Target		= GetTargetIndex_(MultiCount,IndexCount)
		local DamageValue	= GetDamageValue_(MultiCount,IndexCount,MultiStageCount)
		local DamageType	= GetDamageType_(MultiCount,IndexCount)
		//DebugPrint("++++++  DAMAGECHECK!  +++++++" + "\n")
		if(DamageValue != 0){
			switch(DamageType)
			{
			//HP�_���[�W�̏ꍇ
			case AFFECT_PARAM.HP:
			case AFFECT_PARAM.HMP:
				//DebugPrint("      HP_DAMAGE" + "\n")
				if(IsRevival_(MultiCount,IndexCount) == true){
					MonsterRevival_(Target , DamageValue);
				} else {
					SetHpDamage_(Target , DamageValue);
					if(IsLastStand_(MultiCount,IndexCount) == true || IsBraveHart_(MultiCount,IndexCount) == true){
						//���X�g�X�^���h�E�������ʐS�p��O����
						SetHpDamage_(Target , -1);
					}
				}
				break;
			//MP�_���[�W�̏ꍇ
			case AFFECT_PARAM.MP:
				//DebugPrint("      MP_DAMAGE" + "\n")
				SetMpDamage_(Target , DamageValue);
				break
			//�ő�HP�_���[�W�̏ꍇ
			case AFFECT_PARAM.MAX_HP:
				//DebugPrint("      MAXHP_DAMAGE" + "\n")
				SetHpMaxDamage_(Target , DamageValue)
				break;
			//�ő�MP�_���[�W�̏ꍇ
			case AFFECT_PARAM.MAX_MP:
				//DebugPrint("      MAXMP_DAMAGE" + "\n")
				SetMpMaxDamage_(Target , DamageValue)
				break;
			//����ȊO
			default:
				break;
			}
		}
		
		//DebugPrint("        Target		: " + Target + "\n")
		//DebugPrint("        DamageValue	: " + DamageValue + "\n")
		if(IsDead_(MultiCount , IndexCount)){
			//DebugPrint("        Target is Dead. " + "\n")
		}
	}
	
	//DebugPrint_FuncName_OUT("SetDamageUI_Init");
}

//�e���ǉ��_���[�W������UI���f
function SetDamageUI_TeraPlusDamage(MultiCount,IndexCount)
{
	//DebugPrint_FuncName_IN("SetDamageUI_TeraPlusDamage");
	//DebugPrint("	=>	MultiCount		:" + MultiCount)
	//DebugPrint("	=>	IndexCount		:" + IndexCount)
	
	//�����UI�ւ̔��f(HP�_���[�W)
	local Target		= GetTargetIndex_(MultiCount,IndexCount);
	local DamageValue	= GetTeraDamageValue_(MultiCount,IndexCount);
	local DamageType	= GetDamageType_(MultiCount,IndexCount);
	//DebugPrint("++++++  TERADAMAGECHECK!  +++++++" + "\n")
	if(DamageValue != 0){
		switch(DamageType)
		{
		//HP�_���[�W�̏ꍇ
		case AFFECT_PARAM.HP:
		case AFFECT_PARAM.HMP:
			//DebugPrint("      HP_DAMAGE" + "\n")
			SetHpDamage_(Target , DamageValue);
			if(IsLastStand_(MultiCount,IndexCount) == true || IsBraveHart_(MultiCount,IndexCount) == true){
				//���X�g�X�^���h�E�������ʐS�p��O����
				SetHpDamage_(Target , -1);
			}
			break;
		//MP�_���[�W�̏ꍇ
		case AFFECT_PARAM.MP:
			//DebugPrint("      MP_DAMAGE" + "\n")
			SetMpDamage_(Target , DamageValue);
			break
		//�ő�HP�_���[�W�̏ꍇ
		case AFFECT_PARAM.MAX_HP:
			//DebugPrint("      MAXHP_DAMAGE" + "\n")
			SetHpMaxDamage_(Target , DamageValue)
			break;
		//�ő�MP�_���[�W�̏ꍇ
		case AFFECT_PARAM.MAX_MP:
			//DebugPrint("      MAXMP_DAMAGE" + "\n")
			SetMpMaxDamage_(Target , DamageValue)
			break;
		//����ȊO
		default:
			break;
		}
	}
	
	//DebugPrint_FuncName_OUT("SetDamageUI_TeraPlusDamage");
}


//�X�e�[�^�X�ω��G�t�F�N�g�֐�
//	IndexCount		:���̖ڂ̑Ώۃ����X�^�[���H
//	MultiCount		:����ڂ̍s�����H
//	cAction			:cAction�N���X
function SetStateEffect_Init(IndexCount,MultiCount,cAction)
{
	//DebugPrint_FuncName_IN("SetStateEffect_Init");
	//local ArgList =		["MultiCount"	,	MultiCount
	//					,"IndexCount"	,	IndexCount
	//					]
	//DebugPrint_functionParam("SetStateEffect_Init" , ArgList)
	
	
	//���^�[���p�̒l�iWaitFrame���j
	local WaitFrame = 0;
	
	local Target			= GetTargetIndex_(MultiCount,IndexCount);
	local cTarget			= cMonsterInfo(Target)
	
	local IsReflect			= IsReflect_(MultiCount,IndexCount)
	local IsDead			= IsDead_(MultiCount,IndexCount);
	local Efficacy			= GetActionEfficacy_(MultiCount)
	local DamageType		= GetDamageType_(MultiCount,IndexCount)

	//�ǂ̃X�e�[�^�X�ω���������������
	if(IsDead == true){
		local SEFlag		= true;
		local MotionFlag	= true;
		WaitFrame = SetStateEffect_DeadMonsterEffect(MultiCount,IndexCount,SEFlag,MotionFlag)
	}
	else{
		for(local y = STATUS_TOP ; y < STATUS_NUM ; y += 1){	//StateList�̂P�ڂ̒l�̓_���[�W�Ȃ̂Ŗ�������
			local StateFlag			= GetStatusFlag_(y,MultiCount,IndexCount);
			local StateEndFlag		= GetStatusEndFlag_(y,MultiCount,IndexCount);
			local StateValue		= GetStatusValue_(y,MultiCount,IndexCount);
			local NowStateValue		= GetMonsterStatusValue_(y,Target);
			local AllyFlag			= IsAlly_(Target);
			local Actor				= GetActorIndex_(MultiCount)
			//�f�o�b�O�p
			//if(StateValue != 0){
			//	local ListStart =		"LINE";
			//	local ListEnd =			"LINE";
			//	local ListFront =		null;
			//	local List =			["StateName"			, gStateData[y].Up_Motion
			//							,"StateFlag"			, StateFlag
			//							,"StateEndFlag"			, StateEndFlag
			//							,"StateValue"			, StateValue
			//							,"NowStateValue"		, NowStateValue
			//							,"gStateData[y].Name"	, gStateData[y].Name
			//							,"gStateData[y].Up_Effect"	, gStateData[y].Up_Effect
			//							,"gStateData[y].Up_Motion"	, gStateData[y].Up_Motion
			//							,"gStateData[y].Up_Wait"	, gStateData[y].Up_Wait
			//							,"gStateData[y].Up_MissPop"	, gStateData[y].Up_MissPop
			//							,"gStateData[y].Down_Effect"	, gStateData[y].Down_Effect
			//							,"gStateData[y].Down_Motion"	, gStateData[y].Down_Motion
			//							,"gStateData[y].Down_Wait"	, gStateData[y].Down_Wait
			//							,"gStateData[y].Down_MissPop"	, gStateData[y].Down_MissPop
			//							,"gStateData[y].Reset_Wait"	, gStateData[y].Reset_Wait
			//							]
			//	//DebugPrint_OneList(List , ListStart , ListEnd , ListFront)
			//}
			//���b�Z�[�W�\���͏�Ԑ��ۂɊ֌W�Ȃ��\��
			if(StateValue != 0){
				if(IndexCount == 0){
					//�㏸��
					if(StateValue > 0){
						if(IsStatusUpMessageVisible(y) == true){
							if(GetActionNum_() == 1){
								//�P���U����
								//if(SetStateEffect_StateChangeCheck(MultiCount)){
									//�N���ɃX�e�[�^�X�ω����������ۂ̂ݔ���
										AddBattleOtherMessage_(GetStatusUpMessageId(y))
								//}
							} else {
								//�A���U�����̃X�e�[�^�X�ω����b�Z�[�W�́A�ςݏd�˂�
								if(SetStateEffect_StateChangeCheck(MultiCount)){
									AddBattleOtherMessage_(GetStatusUpMessageId(y))
								}
							}
						} else {
							//��O�I�Ƀ��b�Z�[�W���o���ꍇ
							switch(y)
							{
							case STATUS.DEATH:
								//�����U�����̂�
								local IsAttack = (Efficacy == EFFICACY.ATTACK && DamageType == AFFECT_PARAM.HP)
								if(IsAttack == true){
									AddBattleOtherMessage_(GetStatusUpMessageId(STATUS.DEATH))
								}
								break;
							default:
								break;
							}
						}
					//������
					} else {
						if(IsStatusDownMessageVisible(y) == true){
							if(GetActionNum_() == 1){
								//�P���U����
								//if(SetStateEffect_StateChangeCheck(MultiCount)){
									//�N���ɃX�e�[�^�X�ω����������ۂ̂ݔ���
									AddBattleOtherMessage_(GetStatusDownMessageId(y))
								//}
							} else {
								//�A���U�����̃X�e�[�^�X�ω����b�Z�[�W�́A�ςݏd�˂�
								if(SetStateEffect_StateChangeCheck(MultiCount)){
									AddBattleOtherMessage_(GetStatusDownMessageId(y))
								}
							}
						}
					}
				}
			} else if(StateEndFlag == true){
				if(IsStatusResetMessageVisible(y) == true){
					if(IsLightWave_(MultiCount)){
						//���̂͂ǂ��̏ꍇ�̓��b�Z�[�W��\�����Ȃ�
						WaitFrame = GetStatusResetWait(y);
					}else if(IsFreezeWave_(MultiCount)){
						//���Ă��͂ǂ��̏ꍇ�̓��b�Z�[�W��\�����Ȃ�
						WaitFrame = GetStatusResetWait(y);
					} else {
						//�ʏ폈��
						AddBattleOtherMessage_(GetStatusResetMessageId(y))
						WaitFrame = GetStatusResetWait(y);
					}
				}
			}
			//�X�e�[�^�X�ω����������ꍇ
			if(StateFlag == true && StateValue != 0){
				//�㏸�X�e�[�^�X��
				if(StateValue > 0){
					if(gStateData[y].Up_Effect != null){
						//�G�t�F�N�g�͕\���͍s��Ȃ�
						//MonsterSizeEffect(Target,gStateData[y].Up_Effect);
					}
					if(gStateData[y].Up_Motion != null){
						SetMotion_(Target, gStateData[y].Up_Motion, 0);
						Task_ChangeMotion_(Target , MOT_WAIT , 0);
					}
					switch(y)
					{
					case STATUS.TENSION:
						SetStateEffect_TensionPop(MultiCount , IndexCount , true)
						break;
					case STATUS.POISON:
						ReplaySE_("SE_BTL_010")
						break;
					case STATUS.SLEEP:
						ReplaySE_("SE_BTL_011")
						break;
					case STATUS.PARALYSIS:
						ReplaySE_("SE_BTL_012")
						break;
					case STATUS.HIDE:
						Task_ObjectFadeOut_(Target, 15);
						break;
					case STATUS.DEATH:
						SetHpDamage_(Target , GetMonsterHp_(Target));
						break;
					default:
						break;
					}
					WaitFrame = gStateData[y].Up_Wait;
				//�����X�e�[�^�X��
				} else if(StateValue < 0){
					if(gStateData[y].Down_Effect != null){
						//�G�t�F�N�g�͕\���͍s��Ȃ�
						//MonsterSizeEffect(Target,gStateData[y].Down_Effect);
					}
					if(gStateData[y].Down_Motion != null){
						SetMotion_(Target, gStateData[y].Down_Motion, 4);
						Task_ChangeMotion_(Target , MOT_WAIT , 4);
					}
					switch(y)
					{
					case STATUS.TENSION:
						SetStateEffect_TensionPop(MultiCount , IndexCount , false)
						break;
					case STATUS.HIDE:
						Task_ObjectFadeIn_(Target, 15);
						break
					default:
						break
					}
					WaitFrame = gStateData[y].Down_Wait;
				}
			//�X�e�[�^�X�ω��Ń~�X�������ꍇ
			} else if(StateFlag == false && StateValue != 0 && IsReflect == false){
				//�㏸�X�e�[�^�X��
				if(StateValue > 0){
					if(gStateData[y].Up_MissPop == true){
						SetPop_(Target , POPSTYLE.NONE , 0 , true,cTarget.PopDate_X[0],cTarget.PopDate_Y[0],1.0)
						ReplaySE_("SE_BTL_022");
					}
					WaitFrame = gStateData[y].Up_Wait;
				//�����X�e�[�^�X��
				} else if(StateValue < 0){
					if(gStateData[y].Down_MissPop == true){
						SetPop_(Target , POPSTYLE.NONE , 0 , true,cTarget.PopDate_X[0],cTarget.PopDate_Y[0],1.0)
						ReplaySE_("SE_BTL_022");
					}
					WaitFrame = gStateData[y].Down_Wait;
				}
			//�X�e�[�^�X�ω��Ŕ��˂������ꍇ
			} else if(StateFlag == false && StateValue != 0 && IsReflect == true){
				//�㏸�X�e�[�^�X��
				if(StateValue > 0){
					switch(y)
					{
					case STATUS.HPMAX_DOWN:
					case STATUS.MPMAX_DOWN:
						break;
					default:
						MonsterSizeEffect(Target,"EF000_13_COUNTER")
						WaitFrame = gStateData[y].Up_Wait;
						break;
					}
				//�����X�e�[�^�X��
				} else if(StateValue < 0){
					switch(y)
					{
					case STATUS.HPMAX_DOWN:
					case STATUS.MPMAX_DOWN:
						break;
					default:
						MonsterSizeEffect(Target,"EF000_13_COUNTER")
						WaitFrame = gStateData[y].Down_Wait;
						break;
					}
				}
			}
			//�X�e���X�A�^�b�N���������ꂽ��A�����I�ɕ\��
			local IsDead = IsDead_(MultiCount,IndexCount);
			if(y == STATUS.STEALTHATTACK && StateEndFlag == true && IsDead == false){
				Task_ObjectFadeIn_(Target, 30);
			}
		}
	}
	
	//�u�`�F���W�v�̗�O����
	SetStateEffect_Spell_Change(MultiCount,IndexCount)
	
	//UI���f
	//�����n�����������p��O����
	if(IsResurrectionFromDead(MultiCount,IndexCount) == true){
		local hp = GetMonsterHp_(Target);
		SetHpDamage_(Target , (hp - 1));	// HP��1�ɂ���
	} else {
		SetStatusChange_(MultiCount, IndexCount);
	}
	
	//DebugPrint_FuncName_OUT("SetStateEffect_Init");
	return WaitFrame;
}


//�X�e�[�^�X�ω��G�t�F�N�g�֐�
//	IndexCount		:���̖ڂ̑Ώۃ����X�^�[���H
//	MultiCount		:����ڂ̍s�����H
//	cAction			:cAction�N���X
function SetBAKURETSUStateEffect_Init(IndexCount,MultiCount,MultiStageCount,MotionTask,cAction)
{
	//DebugPrint_FuncName_IN("SetBAKURETSUStateEffect_Init");
	//DebugPrint("	=>	IndexCount		:" + IndexCount)
	//DebugPrint("	=>	MultiCount		:" + MultiCount)
	
	//���^�[���p�̒l�iWaitFrame���j
	local WaitFrame = 0;
	
	local Target			= GetTargetIndex_(MultiCount,IndexCount);
	local cTarget			= cMonsterInfo(Target)
	local Actor				= GetActorIndex_(MultiCount)
	local AllyFlag			= IsAlly_(Target);
	local IsReflect			= IsReflect_(MultiCount,IndexCount)
	
	//�ǂ̃X�e�[�^�X�ω���������������
	if(IsDead_(MultiCount,IndexCount) == false){
		for(local y = STATUS_TOP ; y < STATUS_NUM ; y += 1){	//StateList�̂P�ڂ̒l�̓_���[�W�Ȃ̂Ŗ�������
			local StateValue		= GetStatusValue_(y,MultiCount,IndexCount);
			local StateEndFlag		= GetStatusEndFlag_(y,MultiCount,IndexCount);
			if(StateValue != 0 || StateEndFlag == true){
				local StateFlag			= GetStatusFlag_(y,MultiCount,IndexCount);
				local StateEndFlag		= GetStatusEndFlag_(y,MultiCount,IndexCount);
				local NowStateValue		= GetMonsterStatusValue_(y,Target);
				//���b�Z�[�W�\���͏�Ԑ��ۂɊ֌W�Ȃ��\��
				if(StateValue != 0){
					if(IndexCount == 0){
						if(StateValue > 0){
							if(IsStatusUpMessageVisible(y) == true){
								if(GetActionNum_() == 1){
									//�P���U����
									//if(SetStateEffect_StateChangeCheck(MultiCount)){
										//�X�e�[�^�X�ω������������ꍇ�̂݃��b�Z�[�W��\��
										AddBattleOtherMessage_(GetStatusUpMessageId(y))
									//}
								} else {
									//�A���U�����̃X�e�[�^�X�ω����b�Z�[�W�́A�ςݏd�˂�
									if(SetStateEffect_StateChangeCheck(MultiCount)){
										//�X�e�[�^�X�ω������������ꍇ�̂݃��b�Z�[�W��\��
										AddBattleOtherMessage_(GetStatusUpMessageId(y))
									}
								}
							}
						} else {
							if(IsStatusDownMessageVisible(y) == true){
								if(GetActionNum_() == 1){
									//�P���U����
									//if(SetStateEffect_StateChangeCheck(MultiCount)){
										//�X�e�[�^�X�ω������������ꍇ�̂݃��b�Z�[�W��\��
										AddBattleEventMessage_(GetStatusDownMessageId(y))
									//}
								} else {
									//�A���U�����̃X�e�[�^�X�ω����b�Z�[�W�́A�ςݏd�˂�
									if(SetStateEffect_StateChangeCheck(MultiCount)){
										//�X�e�[�^�X�ω������������ꍇ�̂݃��b�Z�[�W��\��
										AddBattleEventMessage_(GetStatusUpMessageId(y))
									}
								}
							}
						}
					}
				} else if(StateEndFlag == true){
					if(IsStatusResetMessageVisible(y) == true){
						//�X�e�[�^�X������
						AddBattleEventMessage_(IsAlly_(Actor) , GetStatusResetMessageId(y))
						WaitFrame = GetStatusResetWait(y);
					}
				}
				//�X�e�[�^�X�ω����������ꍇ
				if(StateFlag == true && StateValue != 0){
					//�㏸�X�e�[�^�X��
					if(StateValue > 0){
						if(gStateData[y].Up_Effect != null){
							//�G�t�F�N�g�\���͍s��Ȃ�
							//MonsterSizeEffect(Target,gStateData[y].Up_Effect);
						}
						if(gStateData[y].Up_Motion != null){
							SetMotion_(Target, gStateData[y].Up_Motion, 4);
							if(MotionTask != null){
								DeleteTask_(MotionTask)
							}
							MotionTask = Task_ChangeMotion_(Target , MOT_WAIT , 4);
						}
						//�e��X�e�[�^�X��O����
						switch(y)
						{
						case STATUS.TENSION:
							SetBAKURETSUStateEffect_TensionPop(MultiCount , IndexCount , true)
							break;
						default:
							break;
						}
						WaitFrame = gStateData[y].Up_Wait;
					//�����X�e�[�^�X��
					} else if(StateValue < 0){
						if(gStateData[y].Down_Effect != null){
							//�G�t�F�N�g�\���͍s��Ȃ�
							//MonsterSizeEffect(Target,gStateData[y].Down_Effect);
						}
						if(gStateData[y].Down_Motion != null){
							SetMotion_(Target, gStateData[y].Down_Motion, 4);
							if(MotionTask != null){
								DeleteTask_(MotionTask)
							}
							Task_ChangeMotion_(Target , MOT_WAIT , 4);
						}
						//�e��X�e�[�^�X��O����
						switch(y)
						{
						case STATUS.TENSION:
							SetBAKURETSUStateEffect_TensionPop(MultiCount , IndexCount , false)
							break;
						default:
							break;
						}
						WaitFrame = gStateData[y].Down_Wait;
					}
				//�X�e�[�^�X�ω��Ń~�X�������ꍇ
				} else if(StateFlag == false && StateValue != 0 && IsReflect == false){
					//�㏸�X�e�[�^�X��
					if(StateValue > 0){
						//�X�e�[�^�X���Ƃŕ���
						switch(y)
						{
						case STATUS.TENSION:
							SetBAKURETSUStateEffect_TensionPop(MultiCount , IndexCount , false)
							break;
						default:
							if(gStateData[y].Up_MissPop == true){
								SetPop_(Target , POPSTYLE.NONE , 0 , true,cTarget.PopDate_X[0],cTarget.PopDate_Y[0],1.0)
								ReplaySE_("SE_BTL_022");
							}
							break;
						}
						WaitFrame = gStateData[y].Up_Wait;
					//�����X�e�[�^�X��
					} else if(StateValue < 0){
						//�X�e�[�^�X���Ƃŕ���
						switch(y)
						{
						case STATUS.TENSION:
							SetBAKURETSUStateEffect_TensionPop(MultiCount , IndexCount , false)
							ReplaySE_("SE_BTL_022");
							break;
						default:
							if(gStateData[y].Down_MissPop == true){
								SetPop_(Target , POPSTYLE.NONE , 0 , true,cTarget.PopDate_X[0],cTarget.PopDate_Y[0],1.0)
								ReplaySE_("SE_BTL_022");
							}
							break;
						}
						WaitFrame = gStateData[y].Down_Wait;
					}
				//�X�e�[�^�X�ω��Ŕ��˂������ꍇ
				} else if(StateFlag == false && StateValue != 0 && IsReflect == true){
					//�㏸�X�e�[�^�X��
					if(StateValue > 0){
						//�X�e�[�^�X���Ƃŕ���
						switch(y)
						{
						case STATUS.TENSION:
							MonsterSizeEffect(Target,"EF000_13_COUNTER")
							WaitFrame = gStateData[y].Up_Wait;
							break;
						case STATUS.HPMAX_DOWN:
						case STATUS.MPMAX_DOWN:
							break;
						default:
							MonsterSizeEffect(Target,"EF000_13_COUNTER")
							WaitFrame = gStateData[y].Up_Wait;
							break;
						}
						
					//�����X�e�[�^�X��
					} else if(StateValue < 0){
						//�X�e�[�^�X���Ƃŕ���
						switch(y)
						{
						case STATUS.TENSION:
							MonsterSizeEffect(Target,"EF000_13_COUNTER")
							WaitFrame = gStateData[y].Down_Wait;
							break;
						case STATUS.HPMAX_DOWN:
						case STATUS.MPMAX_DOWN:
							break;
						default:
							MonsterSizeEffect(Target,"EF000_13_COUNTER")
							WaitFrame = gStateData[y].Down_Wait;
							break;
						}
					}
				//�X�e�[�^�X�ω��������̏ꍇ
				} else if(StateEndFlag == true){
					//�������p�̏����i���̂Ƃ��뉉�o�Ȃ��j
					WaitFrame = gStateData[y].Reset_Wait;
				}
				//�X�e���X�A�^�b�N���������ꂽ��A�����I�ɕ\��
				local IsDead = IsDead_(MultiCount,IndexCount);
				if(y == STATUS.STEALTHATTACK && StateEndFlag == true && IsDead == false){
					Task_ObjectFadeIn_(Target, 30);
				}
			} else {
				//�ω����Ȃ��ꍇ��Skip
			}
		}
	}
	
	//�u�`�F���W�v�̗�O����
	SetStateEffect_Spell_Change(MultiCount,IndexCount)
	
	//UI���f
	SetStatusChange_(MultiCount, IndexCount);
	
	local ReturnParam = [];//�߂�l
	ReturnParam.append(WaitFrame);	//�X�e�[�^�X�ω���WaitFrame��
	ReturnParam.append(MotionTask);	//TaskChangeMotion�Őݒ肳�ꂽTask
	
	//DebugPrint_FuncName_OUT("SetBAKURETSUStateEffect_Init");
	return ReturnParam;
}

//�X�e�[�^�X�ω��G�t�F�N�g�i�����U���p�j�֐�
function SetAttackStateEffect_Init(IndexCount,MultiCount,cAction)
{
	//DebugPrint_FuncName_IN("SetAttackStateEffect_Init");
	//DebugPrint("	=>	IndexCount		:" + IndexCount)
	//DebugPrint("	=>	MultiCount		:" + MultiCount)
	
	//�߂�l�p�̒l
	local WaitFrame		= 0;	//WaitFrame��
	
	local Target			= GetTargetIndex_(MultiCount,IndexCount)
	local cTarget			= cMonsterInfo(Target)
	
	//�ǂ̃X�e�[�^�X�ω���������������
	
	if(IsDead_(MultiCount,IndexCount) == false){
		for(local y = STATUS_TOP ; y < STATUS_NUM ; y += 1){	//StateList�̂P�ڂ̒l�̓_���[�W�Ȃ̂Ŗ�������
			local StateFlag			= GetStatusFlag_(y,MultiCount,IndexCount)
			local StateValue		= GetStatusValue_(y,MultiCount,IndexCount)
			local NowStateValue		= GetMonsterStatusValue_(y,Target)
			local StateEndFlag		= GetStatusEndFlag_(y,MultiCount,IndexCount);
			local AllyFlag			= IsAlly_(Target);
			local Actor				= GetActorIndex_(MultiCount)
			//if(StateValue != 0){
			//	local ListStart =	"LINE"
			//	local ListFront =	"�E"
			//	local List =			["Name"				,	gStateData[y].Name
			//							,"StateFlag"		,	StateFlag
			//							,"StateValue"		,	StateValue
			//							,"StateEndFlag"		,	StateEndFlag
			//							,"IndexCount"		,	IndexCount
			//							,"MultiCount"		,	MultiCount
			//							,"NowStateValue"	,	NowStateValue
			//							]
			//	local ListEnd =		"LINE"
			//	//DebugPrint_OneList(List , ListStart , ListEnd , ListFront)
			//}
			//�X�e�[�^�X�ω����������ꍇ
			if(StateFlag == true && StateValue != 0){
				//�㏸�X�e�[�^�X��
				if(StateValue > 0){
					if(IsStatusUpMessageVisible(y) == true){
						if(GetActionNum_() == 1){
							AddBattleOtherMessage_(GetStatusUpMessageId(y))
						} else {
							//�A���U�����̃X�e�[�^�X�ω����b�Z�[�W�́A�ςݏd�˂�
							AddBattleOtherMessage_(GetStatusUpMessageId(y))
						}
					}
					if(gStateData[y].Up_Effect != null){
						EffParamSizeEffect(Target,gStateData[y].Up_Effect);
					}
					if(gStateData[y].Up_Motion != null){
						SetMotion_(Target, gStateData[y].Up_Motion, 4);
						Task_ChangeMotion_(Target , MOT_WAIT , 4);
					}
					if(y == STATUS.TENSION){
						SetStateEffect_TensionPop(MultiCount , IndexCount , true)
					}
					WaitFrame = gStateData[y].Up_Wait;
				//�����X�e�[�^�X��
				} else if(StateValue < 0){
					if(IsStatusDownMessageVisible(y) == true){
						if(GetActionNum_() == 1){
							AddBattleOtherMessage_(IsAlly_(Actor) , GetStatusDownMessageId(y))
						} else {
							AddBattleOtherMessage_(GetStatusDownMessageId(y))
						}
					}
					if(gStateData[y].Down_Effect != null){
						EffParamSizeEffect(Target,gStateData[y].Down_Effect)
					}
					if(gStateData[y].Down_Motion != null){
						SetMotion_(Target, gStateData[y].Down_Motion, 4);
						Task_ChangeMotion_(Target , MOT_WAIT , 4);
					}
					if(y == STATUS.TENSION){
						SetStateEffect_TensionPop(MultiCount , IndexCount , false)
					}
					WaitFrame = gStateData[y].Down_Wait;
				}
			//�X�e�[�^�X�ω��Ń~�X�������ꍇ
			} else if(StateFlag == false && StateValue != 0){
				//�~�X�̏ꍇ�͉������Ȃ�
				WaitFrame = 0;
			//�X�e�[�^�X�ω��������̏ꍇ
			} else if(StateEndFlag == true){
				if(IsStatusResetMessageVisible(y) == true){
					AddBattleOtherMessage_(AllyFlag, GetStatusResetMessageId(y));
					WaitFrame = 0;
				}
			}
		}
	} else {
		//���S���݂̂̃X�e�[�^�X����
		local SEFlag		= true;
		local MotionFlag	= true;
		WaitFrame = SetAttackStateEffect_DeadMonsterEffect(MultiCount,IndexCount,SEFlag,MotionFlag)
	}
	
	//�u�`�F���W�v�̗�O����
	SetStateEffect_Spell_Change(MultiCount,IndexCount)
	
	
	//if(IsDead_(MultiCount,IndexCount) == false){
		SetStatusChange_(MultiCount, IndexCount);
	//}
	
	//�߂�l�̐ݒ�
	local MotionTask = null;
	local ReturnParam = [];
	ReturnParam.append(WaitFrame)
	ReturnParam.append(MotionTask)
	
	return ReturnParam;
	
	//DebugPrint_FuncName_OUT("SetAttackStateEffect_Init");
}

//�����X�^�[���S���p�X�e�[�^�X�ω�
function SetStateEffect_DeadMonsterEffect(MultiCount,IndexCount,SEFlag,MotionFlag)
{
	//DebugPrint_FuncName_IN("SetStateEffect_DeadMonsterEffect");
	//local ArgList =	["MultiCount"	,	MultiCount
	//				,"IndexCount"	,	IndexCount
	//				,"SEFlag"		,	SEFlag
	//				,"MotionFlag"	,	MotionFlag
	//				]
	//DebugPrint_functionParam("SetStateEffect_DeadMonsterEffect" , ArgList)
	
	local Target = GetTargetIndex_(MultiCount,IndexCount)
	local WaitFrame = 0;
	
	for(local y = STATUS_TOP ; y < STATUS_NUM ; y += 1){
		local StateValue		= GetStatusValue_(y,MultiCount,IndexCount);
		//�f�o�b�O�p
		if(StateValue != 0){
			local StateFlag			= GetStatusFlag_(y,MultiCount,IndexCount);
			local StateEndFlag		= GetStatusEndFlag_(y,MultiCount,IndexCount);
			local NowStateValue		= GetMonsterStatusValue_(y,Target)
			//local ListStart =		"-------- [DeadStateChange] --------";
			//local ListFront =		null;
			//local List =			["StateName"			, gStateData[y].Up_Motion
			//						,"StateFlag"			, StateFlag
			//						,"StateEndFlag"			, StateEndFlag
			//						,"StateValue"			, StateValue
			//						,"NowStateValue"		, NowStateValue
			//						,"gStateData[y].Name"	, gStateData[y].Name
			//						,"gStateData[y].Up_Effect"	, gStateData[y].Up_Effect
			//						,"gStateData[y].Up_Motion"	, gStateData[y].Up_Motion
			//						,"gStateData[y].Up_Wait"	, gStateData[y].Up_Wait
			//						,"gStateData[y].Up_MissPop"	, gStateData[y].Up_MissPop
			//						,"gStateData[y].Down_Effect"	, gStateData[y].Down_Effect
			//						,"gStateData[y].Down_Motion"	, gStateData[y].Down_Motion
			//						,"gStateData[y].Down_Wait"	, gStateData[y].Down_Wait
			//						,"gStateData[y].Down_MissPop"	, gStateData[y].Down_MissPop
			//						,"gStateData[y].Reset_Wait"	, gStateData[y].Reset_Wait
			//						]
			//local ListEnd =			"LINE";
			//DebugPrint_OneList(List , ListStart , ListEnd , ListFront)
		}
		switch(y)
		{
		case STATUS.DEATH:
		case STATUS.ERASE:
			//���S�E�h���s��
			local StateFlag			= GetStatusFlag_(y,MultiCount,IndexCount);
			if(StateValue != 0){
				//���ʁi�P�̖ڂ̂݁j
				if(IndexCount == 0){
					//�㏸�����b�Z�[�W
					if(StateValue > 0 && IsStatusUpMessageVisible(y) == true){
						AddBattleOtherMessage_(GetStatusUpMessageId(y))
					}
					//�ȉ���O�p
					switch(y)
					{
					case STATUS.DEATH:
						//�����U�����̂�
						local Efficacy		= GetActionEfficacy_(MultiCount)
						local DamageType	= GetDamageType_(MultiCount,IndexCount)
						if(Efficacy	== EFFICACY.ATTACK && DamageType == AFFECT_PARAM.HP){
							AddBattleOtherMessage_(GetStatusUpMessageId(STATUS.DEATH))
						}
						break;
					default:
						break;
					}
					//���������b�Z�[�W
					if(StateValue < 0 && IsStatusDownMessageVisible(y) == true){
						AddBattleOtherMessage_(GetStatusDownMessageId(y))
					}
				}
				//���ʁi����j
				if(StateValue > 0){
					//�㏸��
					if(gStateData[y].Up_Wait){
						WaitFrame = gStateData[y].Up_Wait
					}
				} else if(StateValue < 0){
					//������
					if(gStateData[y].Down_Wait){
						WaitFrame = gStateData[y].Down_Wait
					}
				}
			}
			//�ʏ���
			local IsDead = IsDead_(MultiCount,IndexCount)
			if(StateValue != 0 && IsDead){
				//������
				SetDeadEffect_StateDead(MultiCount,IndexCount,SEFlag,MotionFlag,cAction)
			} else if((StateValue != 0 && StateFlag == false && IsReflect_(MultiCount,IndexCount) == false)){
				//�~�X��
				local MultiStageCount = 0;
				if(StateValue > 0 && gStateData[y].Up_MissPop == true){
					SetMissPop(Target, MultiStageCount);
				} else if(StateValue < 0 && gStateData[y].Down_MissPop == true){
					SetMissPop(Target, MultiStageCount);
				}
			} else if((StateValue != 0 && StateFlag == false && IsReflect_(MultiCount,IndexCount) == true)){
				//���ˎ�
				local MultiStageCount = 0;
				SetStateEffect_RefrectEffect(IndexCount,SEFlag,MotionFlag,MultiCount,MultiStageCount,cAction)
			}
			break;
		case STATUS.NOTICE_DEATH:
			local StateEndFlag		= GetStatusEndFlag_(y,MultiCount,IndexCount);
			//���S�\���͉������Ɏ��S
			if(StateEndFlag == true){
				//������
				SetDeadEffect_StateDead(MultiCount,IndexCount,SEFlag,MotionFlag,cAction)
			} else if((StateValue != 0 && StateFlag == false && IsReflect_(MultiCount,IndexCount) == false)){
				//�~�X��
				local MultiCount = 0;
				if(StateValue > 0 && gStateData[y].Up_MissPop == true){
					SetMissPop(Target, MultiStageCount);
				} else if(StateValue < 0 && gStateData[y].Down_MissPop == true){
					SetMissPop(Target, MultiStageCount);
				}
			} else if((StateValue != 0 && StateFlag == false && IsReflect_(MultiCount,IndexCount) == true)){
				//���ˎ�
				local MultiStageCount = 0;
				SetStateEffect_RefrectEffect(IndexCount,SEFlag,MotionFlag,MultiCount,MultiStageCount,cAction)
			}
			break;
		default:
			break;
		}
	}
	
	return WaitFrame;
}

//�����X�^�[���S���p�X�e�[�^�X�ω��i�P�̕����j
function SetAttackStateEffect_DeadMonsterEffect(MultiCount,IndexCount,SEFlag,MotionFlag)
{
	//DebugPrint_FuncName_IN("SetAttackStateEffect_DeadMonsterEffect");
	//local ArgList =	["MultiCount"	,	MultiCount
	//				,"IndexCount"	,	IndexCount
	//				,"SEFlag"		,	SEFlag
	//				,"MotionFlag"	,	MotionFlag
	//				]
	//DebugPrint_functionParam("SetAttackStateEffect_DeadMonsterEffect" , ArgList)
	
	local Target = GetTargetIndex_(MultiCount,IndexCount)
	local WaitFrame = 0;
	
	for(local y = STATUS_TOP ; y < STATUS_NUM ; y += 1){
		local StateValue		= GetStatusValue_(y,MultiCount,IndexCount);
		//�f�o�b�O�p
		if(StateValue != 0){
			local StateFlag			= GetStatusFlag_(y,MultiCount,IndexCount);
			local StateEndFlag		= GetStatusEndFlag_(y,MultiCount,IndexCount);
			local NowStateValue		= GetMonsterStatusValue_(y,Target)
			//local ListStart =		"-------- [DeadStateChange] --------";
			//local ListFront =		null;
			//local List =			["StateName"			, gStateData[y].Up_Motion
			//						,"StateFlag"			, StateFlag
			//						,"StateEndFlag"			, StateEndFlag
			//						,"StateValue"			, StateValue
			//						,"NowStateValue"		, NowStateValue
			//						,"gStateData[y].Name"	, gStateData[y].Name
			//						,"gStateData[y].Up_Effect"	, gStateData[y].Up_Effect
			//						,"gStateData[y].Up_Motion"	, gStateData[y].Up_Motion
			//						,"gStateData[y].Up_Wait"	, gStateData[y].Up_Wait
			//						,"gStateData[y].Up_MissPop"	, gStateData[y].Up_MissPop
			//						,"gStateData[y].Down_Effect"	, gStateData[y].Down_Effect
			//						,"gStateData[y].Down_Motion"	, gStateData[y].Down_Motion
			//						,"gStateData[y].Down_Wait"	, gStateData[y].Down_Wait
			//						,"gStateData[y].Down_MissPop"	, gStateData[y].Down_MissPop
			//						,"gStateData[y].Reset_Wait"	, gStateData[y].Reset_Wait
			//						]
			//local ListEnd =			"LINE";
			//DebugPrint_OneList(List , ListStart , ListEnd , ListFront)
		}
		
		
		switch(y)
		{
		case STATUS.DEATH:
		case STATUS.ERASE:
			local StateFlag			= GetStatusFlag_(y,MultiCount,IndexCount);
						
			//���S�E�h���s��
			if(StateValue != 0){
				//�X�e�[�^�X����O��Wait�ݒ�
				if(StateFlag == true){
					Wait_(30);

					//���ʁi�P�̖ڂ̂݁j
					if(IndexCount == 0){
						//�㏸�����b�Z�[�W
						if(StateValue > 0 && IsStatusUpMessageVisible(y) == true){
							AddBattleOtherMessage_(GetStatusUpMessageId(y))
						}
						//���������b�Z�[�W
						if(StateValue < 0 && IsStatusDownMessageVisible(y) == true){
							AddBattleOtherMessage_(GetStatusDownMessageId(y))
						}
					}
					
					//���ʁi����j
					if(StateValue > 0){
						//�㏸��
						if(gStateData[y].Up_Wait){
							WaitFrame = gStateData[y].Up_Wait
						}
					} else if(StateValue < 0){
						//������
						if(gStateData[y].Down_Wait){
							WaitFrame = gStateData[y].Down_Wait
						}
					}
					
					if(y == STATUS.DEATH) {
						AddBattleOtherMessage_(GetStatusUpMessageId(STATUS.DEATH))
					}
				}

				//�ʏ���
				if(IsReflect_(MultiCount,IndexCount)){
					//���ˎ�
					local MultiStageCount = 0;
					SetStateEffect_RefrectEffect(IndexCount,SEFlag,MotionFlag,MultiCount,MultiStageCount,cAction)
				} else {
					//������
					SetDeadEffect_StateDead(MultiCount,IndexCount,SEFlag,MotionFlag,cAction)
				}
			}
			break;
		case STATUS.NOTICE_DEATH:
			local StateEndFlag		= GetStatusEndFlag_(y,MultiCount,IndexCount);
			//���S�\���͉������Ɏ��S
			if(StateEndFlag == true){
				//������
				SetDeadEffect_StateDead(MultiCount,IndexCount,SEFlag,MotionFlag,cAction)
			} else if((StateValue != 0 && StateFlag == false && IsReflect_(MultiCount,IndexCount) == false)){
				//�~�X��
				local MultiCount = 0;
				if(StateValue > 0 && gStateData[y].Up_MissPop == true){
					SetMissPop(Target, MultiStageCount)
				} else if(StateValue < 0 && gStateData[y].Down_MissPop == true){
					SetMissPop(Target, MultiStageCount)
				}
			} else if((StateValue != 0 && StateFlag == false && IsReflect_(MultiCount,IndexCount) == true)){
				//���ˎ�
				local MultiStageCount = 0;
				SetStateEffect_RefrectEffect(IndexCount,SEFlag,MotionFlag,MultiCount,MultiStageCount,cAction)
			}
			break;
		default:
			break;
		}
	}
	
	return WaitFrame;
}


//�X�e�[�^�X�ω��i�A�������j�֐�
//	IndexCount		:���̖ڂ̑Ώۃ����X�^�[���H
//	MultiCount		:����ڂ̍s�����H
//	cAction			:cAction�N���X
function SetStateEffect_ContinuationEffect(IndexCount,MultiCount,cAction)
{
	//DebugPrint_FuncName_IN("SetStateEffect_ContinuationEffect");
	//DebugPrint("	=>	IndexCount		:" + IndexCount)
	//DebugPrint("	=>	MultiCount		:" + MultiCount)
	
	//���^�[���p�̒l�iWaitFrame���j
	local WaitFrame = 0;
	
	local Target			= GetTargetIndex_(MultiCount,IndexCount);
	local cTarget			= cMonsterInfo(Target)
	local AllyFlag			= IsAlly_(Target);
	local Actor				= GetActorIndex_(MultiCount)
	
	//�ǂ̃X�e�[�^�X�ω���������������
	if(IsDead_(MultiCount,IndexCount) == false){
		for(local y = STATUS_TOP ; y < STATUS_NUM ; y += 1){	//StateList�̂P�ڂ̒l�̓_���[�W�Ȃ̂Ŗ�������
			local StateFlag			= GetStatusFlag_(y,MultiCount,IndexCount);
			local StateEndFlag		= GetStatusEndFlag_(y,MultiCount,IndexCount);
			local StateValue		= GetStatusValue_(y,MultiCount,IndexCount);
			local NowStateValue		= GetMonsterStatusValue_(y,Target);
			local StateEndFlag		= GetStatusEndFlag_(y,MultiCount,IndexCount);
			//���b�Z�[�W�\���͏�Ԑ��ۂɊ֌W�Ȃ��\��
			if(StateValue != 0 && StateEndFlag == false){
				if(StateValue > 0 && IsStatusUpMessageVisible(y) == true){
					//�X�e�[�^�X�㏸�����b�Z�[�W
					if(MultiCount == GetActionNum_() - 1){
						AddBattleOtherMessage_(GetStatusUpMessageId(y))
					}
				} else if(StateValue < 0 && IsStatusDownMessageVisible(y) == true){
					//�X�e�[�^�X���~�����b�Z�[�W
					if(MultiCount == GetActionNum_() - 1){
						AddBattleOtherMessage_(GetStatusDownMessageId(y))
					}
				}
			} else if(StateEndFlag == true){
				if(IsStatusResetMessageVisible(y) == true){
					//�X�e�[�^�X�������b�Z�[�W
					if(MultiCount == GetActionNum_() - 1){
						AddBattleOtherMessage_(GetStatusResetMessageId(y))
					}
				}
			}
			//�X�e�[�^�X�ω����������ꍇ
			if(StateFlag == true && StateValue != 0 && StateEndFlag == false){
				//�㏸�X�e�[�^�X��
				if(StateValue > 0){
					if(gStateData[y].Up_Effect != null){
						MonsterSizeEffect(Target,gStateData[y].Up_Effect);
					}
					if(gStateData[y].Up_Motion != null){
						SetMotion_(Target, gStateData[y].Up_Motion, 4);
						Task_ChangeMotion_(Target , MOT_WAIT , 4);
					}
					if(y == STATUS.TENSION){
						SetStateEffect_TensionPop(MultiCount , IndexCount , true)
					}
					WaitFrame = gStateData[y].Up_Wait;
				//�����X�e�[�^�X��
				} else if(StateValue < 0){
					if(gStateData[y].Down_Effect != null){
						MonsterSizeEffect(Target,gStateData[y].Down_Effect);
					}
					if(gStateData[y].Down_Motion != null){
						SetMotion_(Target, gStateData[y].Down_Motion, 4);
						Task_ChangeMotion_(Target , MOT_WAIT , 4);
					}
					if(y == STATUS.TENSION){
						SetStateEffect_TensionPop(MultiCount , IndexCount , false)
					}
					WaitFrame = gStateData[y].Down_Wait;
				}
			//�X�e�[�^�X�ω��Ń~�X�������ꍇ
			} else if(StateFlag == false && StateValue != 0){
				//�㏸�X�e�[�^�X��
				if(StateValue > 0){
					if(gStateData[y].Up_MissPop == true){
						SetPop_(Target , POPSTYLE.NONE , 0 , true,cTarget.PopDate_X[0],cTarget.PopDate_Y[0],1.0)
						ReplaySE_("SE_BTL_022");
					}
					WaitFrame = gStateData[y].Up_Wait;
				//�����X�e�[�^�X��
				} else if(StateValue < 0){
					if(gStateData[y].Down_MissPop == true){
						SetPop_(Target , POPSTYLE.NONE , 0 , true,cTarget.PopDate_X[0],cTarget.PopDate_Y[0],1.0)
						ReplaySE_("SE_BTL_022");
					}
					WaitFrame = gStateData[y].Down_Wait;
				}
			}
			//�X�e���X�A�^�b�N���������ꂽ��A�����I�ɕ\��
			local IsDead = IsDead_(MultiCount,IndexCount);
			if(y == STATUS.STEALTHATTACK && StateEndFlag == true && IsDead == false){
				Task_ObjectFadeIn_(Target, 30);
			}
		}
	}
	
	//�u�`�F���W�v�̗�O����
	SetStateEffect_Spell_Change(MultiCount,IndexCount)
	
	//UI���f{
	SetStatusChange_(MultiCount, IndexCount);
	
	//DebugPrint_FuncName_OUT("SetStateEffect_ContinuationEffect");
	//DebugPrint("	<=	WaitFrame	:" + WaitFrame);
	return WaitFrame;
}

//����̍s���ŁA�X�e�[�^�X�ُ킪���������̔���i��������true�ŕԂ��j
//	MultiCount	: ����ڂ̍s�����H
function SetStateEffect_StateChangeCheck(MultiCount)
{
	//DebugPrint_FuncName_IN("SetStateEffect_StateChangeCheck");
	//DebugPrint("	=>	MultiCount		:" + MultiCount)	
	
	local StateChangeFlag = false;
	
	for(local IndexCount = 0 ; IndexCount < GetTargetNum_(MultiCount) ; IndexCount++){
		for(local State = STATUS_TOP ; State < STATUS_NUM ; State++){
			local StateFlag			= GetStatusFlag_(State,MultiCount,IndexCount);
			local StateValue		= GetStatusValue_(State,MultiCount,IndexCount);
			if(StateFlag == true && StateValue != 0){
				StateChangeFlag = true;
			}
		}
	}
	
	//DebugPrint_FuncName_OUT("SetStateEffect_StateChangeCheck");
	//DebugPrint("	<=	StateChangeFlag		:" + StateChangeFlag)
	return StateChangeFlag;
}

//�e���V�����p�|�b�v�\��
//	Target		: �|�b�v��\�����郂���X�^�[�C���f�b�N�X
//	PopCount	: ���ڂ̃|�b�v�ɕ\�����邩
//	UpFlag		: �㏸�l���H�itrue�ŏ㏸�Afalse�ŉ��~�j
function SetStateEffect_TensionPop(MultiCount , IndexCount , UpFlag)
{
	//DebugPrint_FuncName_IN("SetStateEffect_TensionPop");
	//DebugPrint("	=>	MultiCount		:" + MultiCount)
	//DebugPrint("	=>	IndexCount		:" + IndexCount)
	//DebugPrint("	=>	UpFlag			:" + UpFlag)
	
	local Target		= GetTargetIndex_(MultiCount,IndexCount)
	local cTarget		= cMonsterInfo(Target)
	local TensionValue	= 0;
	local PopCount		= 0;
	local PopValue		= 0;
	local PopKind		= true;
	local cTargetParty	= cFullPartyInfo(Target)
	
	//����̍s���̃|�b�v�̕\���ʒu���v�Z
	local PartyPopCount		= array(cTargetParty.PartyNum);
	local TargetNum			= GetTargetNum_(MultiCount)
	for(local i = 0; i < IndexCount + 1 ; i++){
		local Tgt	= GetTargetIndex_(MultiCount,i);
		for(local l = 0 ; l < cTargetParty.PartyNum ; l++){
			if(cTargetParty.Index[l] == Tgt){
				if(PartyPopCount[l] == null){
					PartyPopCount[l] = -1;
				}
				PartyPopCount[l] = PartyPopCount[l] + 1;
			}
		}
	}
	
	//����̃|�b�v�̑Ώۂ�����
	Target = GetTargetIndex_(MultiCount,IndexCount);
	for(local i = 0 ; i < cTargetParty.PartyNum ; i++){
		if(cTargetParty.Index[i] == Target){
			PopCount = PartyPopCount[i]
		}
	}
	
	//����̃|�b�v�̒l���v�Z
	local PartyPopValue		= array(cTargetParty.PartyNum);
	for(local i = 0 ; i < IndexCount + 1 ; i++){
		for(local l = 0 ; l < cTargetParty.PartyNum ; l++){
			local Tgt = GetTargetIndex_(MultiCount,i)
			if(cTargetParty.Index[l] == Tgt){
				local StateValue		= GetStatusValue_(STATUS.TENSION , MultiCount , i);
				if(StateValue > 0){
					PopKind = POPSTYLE.TENSION_UP;
				} else if(StateValue < 0){
					PopKind = POPSTYLE.TENSION_DOWN;
				}
				if(PartyPopValue[l] == null){
					PartyPopValue[l] = 0;
				}
				PartyPopValue[l] = PartyPopValue[l] + StateValue;
			}
		}
	}
	for(local i = 0 ; i < cTargetParty.PartyNum ; i++){
		if(cTargetParty.Index[i] == Target){
			local NowStateValue		= GetMonsterStatusValue_(STATUS.TENSION , Target);
			PopValue	= NowStateValue + PartyPopValue[i]
		}
	}
	
	if(PopValue > 4	){PopValue = 4;}
	if(PopValue < -4){PopValue = -4;}
	
	//�|�b�v�\��
	if(PopCount != 0){PopCount =  PopCount % gPopMaxNum;}
	
	SetPop_(Target , PopKind , PopValue , false,cTarget.PopDate_X[PopCount],cTarget.PopDate_Y[PopCount],1.0)
	
	//DebugPrint_FuncName_OUT("SetStateEffect_TensionPop");
}


//���i�n�e���V�����|�b�v�\���ʒu�Z�o
function SetBAKURETSUStateEffect_TensionPop(MultiCount , IndexCount , UpFlag)
{
	//DebugPrint_FuncName_IN("SetBAKURETSUStateEffect_TensionPop");
	//DebugPrint("	=>	MultiCount		:" + MultiCount)
	//DebugPrint("	=>	IndexCount		:" + IndexCount)
	//DebugPrint("	=>	UpFlag			:" + UpFlag)
	
	local Target		= GetTargetIndex_(MultiCount,IndexCount)
	local cTarget		= cMonsterInfo(Target)
	local TensionValue	= 0;
	local PopCount		= 0;
	local PopValue		= 0
	local PopKind		= true;
	local cTargetParty	= cFullPartyInfo(Target)
	local MissCheck		= false
	
	
	//����̍s���̃|�b�v�̕\���ʒu���v�Z
	local PartyPopCount		= array(cTargetParty.PartyNum);
	local TargetNum			= GetTargetNum_(MultiCount)
	for(local i = 0; i < IndexCount + 1 ; i++){
		local Tgt	= GetTargetIndex_(MultiCount,i);
		for(local l = 0 ; l < cTargetParty.PartyNum ; l++){
			if(cTargetParty.Index[l] == Tgt){
				if(PartyPopCount[l] == null){
					PartyPopCount[l] = -1;
				}
				PartyPopCount[l] = PartyPopCount[l] + 1;
			}
		}
	}
	
	//����̃|�b�v�̑Ώۂ�����
	Target = GetTargetIndex_(MultiCount,IndexCount);
	for(local i = 0 ; i < cTargetParty.PartyNum ; i++){
		if(cTargetParty.Index[i] == Target){
			PopCount = PartyPopCount[i]
		}
	}
	
	//�~�X���ǂ����𔻒�
	if(GetStatusFlag_(STATUS.TENSION , MultiCount , IndexCount) == true){
		MissCheck = false;
	} else {
		MissCheck = true;
	}
	
	//����̃|�b�v�̒l���v�Z
	local StateValue		= GetStatusValue_(STATUS.TENSION , MultiCount , IndexCount);
	local NowStateValue		= GetMonsterStatusValue_(STATUS.TENSION , Target);
	if(MissCheck == false){
		PopValue	= NowStateValue + StateValue;
		if(PopValue > 4	){PopValue = 4;}
		if(PopValue < -4){PopValue = -4;}
	}
	
	//�|�b�v�̎�ނ�ݒ�
	if(StateValue > 0){
		PopKind = POPSTYLE.TENSION_UP;
	} else {
		PopKind	= POPSTYLE.TENSION_DOWN;
	}
	
	//�|�b�v�\��
	if(PopCount != 0){PopCount =  PopCount % gPopMaxNum;}
	
	SetPop_(Target , PopKind , PopValue , MissCheck , cTarget.PopDate_X[PopCount],cTarget.PopDate_Y[PopCount],1.0)
	
	//DebugPrint_FuncName_OUT("SetBAKURETSUStateEffect_TensionPop");
}

// �X�e�[�^�X�ω��p���ˉ��o
function SetStateEffect_RefrectEffect(IndexCount,SEFlag,MotionFlag,MultiCount,MultiStageCount,cAction)
{
	//DebugPrint_FuncName_IN("SetStateEffect_RefrectEffect");
	//DebugPrint("	=>	IndexCount			:	" + IndexCount);
	//DebugPrint("	=>	SEFlag				:	" + SEFlag);
	//DebugPrint("	=>	MotionFlag			:	" + MotionFlag);
	//DebugPrint("	=>	MultiCount			:	" + MultiCount);
	//DebugPrint("	=>	MultiStageCount		:	" + MultiStageCount);
	
	//�^�[�Q�b�g�C���f�b�N�X�̐���
	local Target		= GetTargetIndex_(MultiCount,IndexCount)
	
	EffParamSizeEffect(Target,"EF000_13_COUNTER");
	if(SEFlag == true){RePlaySE_("SE_BTL_023");}
	
	//�߂�l�̐ݒ�
	//DebugPrint_FuncName_OUT("SetStateEffect_RefrectEffect");
	//DebugPrint("	<=	:	MotionTask		:" + MotionTask);
	return MotionTask;
}


//�`�F���W�̏ꍇ�̗�O����
//MultiCount			: ����ڂ̍s�����H
//IndexCount			: ���̖ڂ̑Ώۂ��H
function SetStateEffect_Spell_Change(MultiCount,IndexCount)
{
	//DebugPrint_FuncName_IN("SetStateEffect_Spell_Change");
	//DebugPrint("	=>	MultiCount		:" + MultiCount)
	//DebugPrint("	=>	IndexCount		:" + IndexCount)
	
	SetParamChange_(MultiCount,IndexCount);
	//DebugPrint_FuncName_OUT("SetStateEffect_Spell_Change");
}

//�s�����o�E��O���o�i�ėp�j
function SetDamageEffect_ExceptionEffect(MultiCount,cAction)
{
	//DebugPrint_FuncName_IN("SetDamageEffect_ExceptionEffect");
	//DebugPrint("	=>	MultiCount		:" + MultiCount)

	local CameraFlag = false
	SetExceptionEffect_HoldOn(MultiCount,null,CameraFlag,cAction);
	//�V�g�̋C�܂��ꔻ��
	SetExceptionEffect_Rezaoral(MultiCount,null,CameraFlag,cAction);
	
	//DebugPrint_FuncName_OUT("SetDamageEffect_ExceptionEffect");
}

//�s�����o�E��O���o�i���i�p�E�݂����p�j
function SetDamageEffect_ExceptionEffect_IndexCount(MultiCount,IndexCount,cAction)
{
	//DebugPrint_FuncName_IN("SetDamageEffect_ExceptionEffect_IndexCount");
	//DebugPrint("	=>	MultiCount		:" + MultiCount)
	//DebugPrint("	=>	IndexCount		:" + IndexCount)
	local CameraFlag = false;
	SetExceptionEffect_HoldOn(MultiCount,IndexCount,CameraFlag,cAction);
	//�V�g�̋C�܂��ꔻ��
	SetExceptionEffect_Rezaoral(MultiCount,IndexCount,CameraFlag,cAction);
	
	//DebugPrint_FuncName_OUT("SetDamageEffect_ExceptionEffect_IndexCount");
}

//�s�����o�E��O���o�i�P�̕����p�j
function SetDamageMotionEffect_ExceptionEffect(MultiCount,cAction)
{
	//DebugPrint_FuncName_IN("SetDamageMotionEffect_ExceptionEffect");
	//DebugPrint("	=>	MultiCount		:" + MultiCount)
	local CameraFlag = false
	SetExceptionEffect_HoldOn(MultiCount,0,CameraFlag,cAction);
	local CameraFlag = false
	//�V�g�̋C�܂��ꔻ��
	SetExceptionEffect_Rezaoral(MultiCount,0,CameraFlag,cAction);
	
	
	//DebugPrint_FuncName_OUT("SetDamageMotionEffect_ExceptionEffect");
}

//�s�����o�E��O���o�i�A�������p�j
function SetDamageMotionRushEffect_ExceptionEffect(MultiCount,cAction)
{
	//DebugPrint_FuncName_IN("SetDamageMotionRushEffect_ExceptionEffect");
	//DebugPrint("	=>	MultiCount		:" + MultiCount)
	local CameraFlag = false;
	SetExceptionEffect_HoldOn(MultiCount,0,CameraFlag,cAction);
	//�V�g�̋C�܂��ꔻ��
	local CameraFlag = true;
	SetExceptionEffect_Rezaoral(MultiCount,0,CameraFlag,cAction);
	
	
	//DebugPrint_FuncName_OUT("SetDamageMotionRushEffect_ExceptionEffect");
}

//�s�����o�E��O���o�i�P�̕����p�j
function SetDamageMotionEffect_ExceptionEffect(MultiCount,cAction)
{
	//DebugPrint_FuncName_IN("SetDamageMotionEffect_ExceptionEffect");
	//DebugPrint("	=>	MultiCount		:" + MultiCount)
	local CameraFlag = false
	SetExceptionEffect_HoldOn(MultiCount,0,CameraFlag,cAction);
	local CameraFlag = false
	//�V�g�̋C�܂��ꔻ��
	SetExceptionEffect_Rezaoral(MultiCount,0,CameraFlag,cAction);
	
	
	//DebugPrint_FuncName_OUT("SetDamageMotionEffect_ExceptionEffect");
}


//��O����F�ӂ�΂�n
//MultiCount				:����ڂ̍s�����H
//IndexCount				:���̖ڂ̔��肩�H
//							 �����A�S�̂��猟�����ď�������ꍇ��
//							 null��n���Ă��������B
//cAction					:cActionInfoClass�iMultiCount�ɑΉ��������́j
function SetExceptionEffect_HoldOn(MultiCount,IndexCount,CameraFlag,cAction)
{
	//DebugPrint_FuncName_IN("SetExceptionEffect_HoldOn");
	//DebugPrint("	=>	MultiCount		:" + MultiCount)
	//DebugPrint("	=>	IndexCount		:" + IndexCount)
	//DebugPrint("	=>	CameraFlag		:" + CameraFlag)
	
	//local ArgList =	["MultiCount"	,	MultiCount
	//				,"IndexCount"	,	IndexCount
	//				,"CameraFlag"	,	CameraFlag
	//				]
	//DebugPrint_functionParam("SetExceptionEffect_HoldOn" , ArgList)
	
	const BTL_EVT_MSG_LIVING_DEAD	= 31;
	const BTL_EVT_MSG_BRAVE_HART	= 51;
	const BTL_EVT_MSG_LAST_STAND	= 50;
	
	local isLivingDead = false;
	local isBraveHart = false;
	local isLastStand = false;
	local TargetNum = GetTargetNum_(MultiCount)
	
	if(IndexCount == null){
		//IndexCount���ݒ肳��Ă��Ȃ��ꍇ�́A0���猟������
		for(local i = 0 ; i < TargetNum ; i++){
			if(IsLivingDead_(MultiCount,i) == true){
				isLivingDead = true;
				continue;
			}
			if(IsBraveHart_(MultiCount,i) == true){
				isBraveHart = true;
				continue;
			}
			if(IsLastStand_(MultiCount,i) == true){
				isLastStand = true;
				continue;
			}
		}
	} else {
		//IndexCount���ݒ肳��Ă���ꍇ�A���̒l�Ŕ���
		isLivingDead = IsLivingDead_(MultiCount,IndexCount)
		isBraveHart = IsBraveHart_(MultiCount,IndexCount)
		isLastStand = IsLastStand_(MultiCount,IndexCount)
	}

	if(isLivingDead){
		SetHoldOnFeatMessage_IsLivingDead()
	}
	if(isBraveHart){
		SetHoldOnFeatMessage_BraveHart()
	}
	if(isLastStand){
		SetHoldOnFeatMessage_LastStand()
	}

	if(isLivingDead || isBraveHart || isLastStand){
		if(CameraFlag == true){
			Wait_(30)
			DeleteAllTask_();
			local Target = GetTargetIndex_(MultiCount,IndexCount)
			if(IsAlly_(Target)){
				SetVisible_(GetAllyMaster_() , false)
			} else {
				SetVisible_(GetEnemyMaster_() , false)
			}
			CharaStand_PartyFull(false , IsAlly_(GetActorIndex_(MultiCount)))
			CharaStand_Target(CameraFlag,MultiCount)
			//SetAlpha_(GetTargetIndex_(MultiCount,IndexCount), 0.0);
		}
		
		//�S�҂̎��O�G�t�F�N�g�̕\��
		if(IndexCount != null){
			if(IsLivingDead_(MultiCount,IndexCount) == true){
				MonsterSizeEffect(GetTargetIndex_(MultiCount,IndexCount),LIVING_DEAD_EFFECT_NAME);
			}
		} else {
			for(local i = 0 ; i < TargetNum ; i++){
				if(IsLivingDead_(MultiCount,i) == true){
					MonsterSizeEffect(GetTargetIndex_(MultiCount,i),LIVING_DEAD_EFFECT_NAME)
				}
			}
		}
		
		local WaitFrame = 30;
		
		//�ʉ��o
		if(IndexCount == null){
			//�P���p�iTargetNum����������j
			for(local i = 0 ; i < TargetNum ; i++){
				if(IsLivingDead_(MultiCount,i) || IsBraveHart_(MultiCount,i) || IsLastStand_(MultiCount,i)){
					//WaitFrame = SetExceptionEffect_Rezaoral_Effect(MultiCount,i)
				}
			}
		} else {
			if(IsLivingDead_(MultiCount,IndexCount) || IsBraveHart_(MultiCount,IndexCount) || IsLastStand_(MultiCount,IndexCount)){
				//WaitFrame = SetExceptionEffect_Rezaoral_Effect(MultiCount,IndexCount)
			}
		}
		
		//�A�����o����Wait���X�L�b�v����
		if(GetActionNum_() > 1){return;}
		
		//���o�I���҂�
		if(WaitFrame != 0){Wait_(WaitFrame);}
	}
	//DebugPrint_FuncName_OUT("SetExceptionEffect_HoldOn");
}
	
//��O����F���U�I����
//MultiCount				:����ڂ̍s�����H
//IndexCount				:���̖ڂ̔��肩�H
//							 �����A�S�̂��猟�����ď�������ꍇ��
//							 null��n���Ă��������B
//cAction					:cActionInfoClass�iMultiCount�ɑΉ��������́j
function SetExceptionEffect_Rezaoral(MultiCount,IndexCount,CameraFlag,cAction)
{
	//DebugPrint_FuncName_IN("SetExceptionEffect_Rezaoral");
	//DebugPrint("	=>	MultiCount		:" + MultiCount)
	//DebugPrint("	=>	IndexCount		:" + IndexCount)
	//DebugPrint("	=>	CameraFlag		:" + CameraFlag)
	
	const BTL_EVT_MSG_REZAORAL	= 29;
	const BTL_EVT_MSG_ANGEL		= 30;
	
	local isRezaoral = false;	
	local isAngel = false;		
	local TargetNum = GetTargetNum_(MultiCount)
	
	if(IndexCount == null){
		//IndexCount���ݒ肳��Ă��Ȃ��ꍇ�́A0���猟������
		for(local i = 0 ; i < TargetNum ; i++){
			if(IsRezaoral_(MultiCount,i) == true){
				isRezaoral = true;
				continue;
			}
			if(IsAngel_(MultiCount,i) == true){
				isAngel = true;
				continue;
			}
		}
	} else {
		//IndexCount���ݒ肳��Ă���ꍇ�A���̒l�Ŕ���
		isRezaoral = IsRezaoral_(MultiCount,IndexCount)
		isAngel = IsAngel_(MultiCount,IndexCount)
	}
	
	if(isRezaoral || isAngel){
		//���U�I�����E�V�g�̋C�܂��ꉉ�o
		if(CameraFlag == true){
			Wait_(60)
			DeleteAllTask_();
			//CharaStand_AllNonCam()
			local Target = GetTargetIndex_(MultiCount,IndexCount)
			if(IsAlly_(Target)){
				SetVisible_(GetAllyMaster_() , false)
			} else {
				SetVisible_(GetEnemyMaster_() , false)
			}
			CharaStand_PartyFull(false , IsAlly_(GetActorIndex_(MultiCount)))
			CharaStand_Target(CameraFlag,MultiCount)
			SetAlpha_(GetTargetIndex_(MultiCount,IndexCount), 0.0);
		}
		
		Wait_(60);//���S�����ő҂�
		
		//���ʃ��b�Z�[�W�i��
		//local Index = IndexCount;
		//if(Index == null){Index = 0;}
		//AddBattleFeatMessage_(IsAlly_(GetTargetIndex_(MultiCount,Index)) , 29);
		if(isRezaoral){
			AddBattleFeatMessage_(BTL_EVT_MSG_REZAORAL)
		}
		if(isAngel){
			AddBattleFeatMessage_(BTL_EVT_MSG_ANGEL)
		}
		
		
		local WaitFrame = 0;
		
		//�ʉ��o
		if(IndexCount == null){
			//�P���p�iTargetNum����������j
			for(local i = 0 ; i < TargetNum ; i++){
				if(IsRezaoral_(MultiCount,i) || IsAngel_(MultiCount,i)){
					WaitFrame = SetExceptionEffect_Rezaoral_Effect(MultiCount,i)
				}
			}
		} else {
			if(IsRezaoral_(MultiCount,IndexCount) || IsAngel_(MultiCount,IndexCount)){
				WaitFrame = SetExceptionEffect_Rezaoral_Effect(MultiCount,IndexCount)
			}
		}
		//���o�I���҂�
		if(WaitFrame != 0){Wait_(WaitFrame);}
	}
	//DebugPrint_FuncName_OUT("SetExceptionEffect_Rezaoral");
}

//���U�I�������o
//	MultiCount			: ����ڂ̍s�����H
//	IndexCount			: ���̖ڂ̑Ώۂ��H
function SetExceptionEffect_Rezaoral_Effect(MultiCount,IndexCount)
{
	//DebugPrint_FuncName_IN("SetExceptionEffect_Rezaoral_Effect");
	//DebugPrint("	=>	MultiCount		:" + MultiCount)
	//DebugPrint("	=>	IndexCount		:" + IndexCount)
	local Target		= GetTargetIndex_(MultiCount,IndexCount);
	local cTarget		= cMonsterInfo(Target)
	local Value			= GetRevivalValue_(MultiCount,IndexCount);
	local PopValue		= SetAbsoluteValue(Value)
	MonsterSizeEffect(Target, REVIVAL_EFFECT_NAME);
	if(IsRide_(Target)){
		local Master;
		if(IsAlly_(Target)){
			Master = GetAllyMaster_();
		} else {
			Master = GetEnemyMaster_();
		}
		//RideOffMaster_(Master);
		//Task_ObjectFadeOut_(Master)
	}
	Task_ObjectFadeIn_(Target, 30);
	SetPop_(Target, POPSTYLE.HEAL_HP, PopValue , false , cTarget.PopDate_X[0] , cTarget.PopDate_Y[0] , 1.0);
	MonsterRevival_(Target , Value);
	SetMotion_(Target,MOT_WAIT,1);
	//DebugPrint("++++++  AngelFickle_CHECK!  +++++++" + "\n")
	//DebugPrint("      HP_HEAL" + "\n")
	//DebugPrint("        Target		: " + Target + "\n")
	//DebugPrint("        HealValue	: " + Value + "\n")
	//DebugPrint("        PopValue	: " + PopValue + "\n")
	local WaitFrame = 45;	//�V�g�̋C�܂���ł̑҂�����
	//DebugPrint_FuncName_OUT("SetExceptionEffect_Rezaoral_Effect");
	
	return WaitFrame;
}

//���̍s���Ŗ{���Ɏ��񂾂�����
//	MultiCount			: ����ڂ̍s�����H
//	MultiStageCount		: ���i�ڂ̍s�����H
//	IndexCount			: ���̖ڂ̑Ώۂ��H
function ExceptionDeadEscapeCheck(MultiCount,MultiStageCount,IndexCount)
{
	//DebugPrint_FuncName_IN("ExceptionDeadEscapeCheck");
	//DebugPrint("	=>	IndexCount			:	" + IndexCount);
	//DebugPrint("	=>	MultiCount			:	" + MultiCount);
	//DebugPrint("	=>	MultiStageCount		:	" + MultiStageCount);
	local DeadCheck = true;
	
	//DebugPrint_FuncName_OUT("ExceptionDeadEscapeCheck");
	//�{���Ɏ���ł���ꍇ��true��Ԃ��B
	return DeadCheck;
}

//��e���K�[�h�����������b�Z�[�W
//	MultiCount			: ����ڂ̍s�����H
//	IndexCount			: ���̖ڂ̑Ώۂ��H
//	MultiStageCount		: ���i�ڂ̍s�����H
function SetDamageGuardFeatMessage(MultiCount,IndexCount,MultiStageCount)
{
	//DebugPrint_FuncName_IN("SetDamageGuardFeatMessage");
	//�M�����u���{�f�B
	if(IsGambleBody_(MultiCount, IndexCount, MultiStageCount) && g_ShowGambleBody == false){
		g_ShowGambleBody = true;
		SetDamageGuardFeatMessage_GambleBody()
	}
	//��S���S�K�[�h
	if(IsActiveCriticalGuard(MultiCount, IndexCount, MultiStageCount) && g_ShowCriticalGuard == false){
		g_ShowCriticalGuard = true;
		SetDamageGuardFeatMessage_IsCriticalGuard()
	}
	//DebugPrint_FuncName_OUT("SetDamageGuardFeatMessage");
}

//�M�����u���{�f�B���b�Z�[�W
function SetDamageGuardFeatMessage_GambleBody()
{
	//DebugPrint_FuncName_IN("SetDamageGuardFeatMessage_GambleBody");
	AddBattleFeatMessage_(57)
	//DebugPrint_FuncName_OUT("SetDamageGuardFeatMessage_GambleBody");
}

//��S���S�K�[�h���b�Z�[�W
function SetDamageGuardFeatMessage_IsCriticalGuard()
{
	//DebugPrint_FuncName_IN("SetDamageGuardFeatMessage_IsCriticalGuard");
	//��S���S�K�[�h
	AddBattleFeatMessage_(58)
	//DebugPrint_FuncName_OUT("SetDamageGuardFeatMessage_IsCriticalGuard");
}

//�S�҂̎��O���b�Z�[�W
function SetHoldOnFeatMessage_IsLivingDead()
{
	//DebugPrint_FuncName_IN("SetHoldOnFeatMessage_IsLivingDead");
	AddBattleFeatMessage_(31)
	//DebugPrint_FuncName_OUT("SetHoldOnFeatMessage_IsLivingDead");
}

//���X�g�X�^���h���b�Z�[�W�\��
function SetHoldOnFeatMessage_LastStand()
{
	//DebugPrint_FuncName_IN("SetHoldOnFeatMessage_LastStand");
	//���X�g�X�^���h
	AddBattleFeatMessage_(50)
	//DebugPrint_FuncName_OUT("SetHoldOnFeatMessage_LastStand");
}

//�������ʐS���b�Z�[�W�\��
function SetHoldOnFeatMessage_BraveHart()
{
	//DebugPrint_FuncName_IN("SetHoldOnFeatMessage_BraveHart");
	//�������ʐS
	AddBattleFeatMessage_(51)
	//DebugPrint_FuncName_OUT("SetHoldOnFeatMessage_BraveHart");
}

// ������==========================================================================
//�L��������z�u�i�L�����f�[�^�̎擾�j
function CharaStand(CharaStand_Select,CameraFlag,MultiCount,cAction)
{
	//CharaStand_Select			Full		: �p�[�e�B�S���i�����Ŗ������G�����w��j
	//											�J�����͕K���S��
	//							Action		: �s����
	//											�i�A�b�v�J�����j
	//											�s���҂��P�̂̏ꍇ�̓A�b�v�J����
	//											�s���҂������̏ꍇ�͑S�̔z�u
	//											�������s���҈ȊO�͋l�߂�
	//							Target		: �Ώێҁi������MultiCount)
	//											�Ώۂ��P�̂̏ꍇ�̓A�b�v�J����
	//											�Ώۂ������̏ꍇ�͑S�̔z�u
	//���ʂ�������
	//		CameraFlag	:	�J������ݒu���邩�H

	//DebugPrint_FuncName_IN("CharaStand");
	//DebugPrint("	=>	CharaStand_Select		:	" + CharaStand_Select);
	//DebugPrint("	=>	CameraFlag				:	" + CameraFlag);
	//DebugPrint("	=>	MultiCount				:	" + MultiCount);

	//���O����
	DeleteAllEffect_();
	ChangeIndexPointData_(BATTLE_COMMON_POINT_DATA);
	SetVisibleNeedModel_();
	StopEarthQuake_();
	DeleteAllTask_();			//CharaStand�ɗ����ꍇ�A��U�S�Ă�Task���폜����B
	
	switch(CharaStand_Select)
	{
		case "ActorFull":					//�s���҃p�[�e�B�S�̔z�u�̏ꍇ
			CharaStand_ActorFull(CameraFlag);
			CharaStand_NonCamera(IsAlly_(GetActorIndex_(MultiCount)))
			break;
		case "TargetFull":					//�Ώێ҃p�[�e�B�S�̔z�u�̏ꍇ
			CharaStand_TargetFull(CameraFlag);
			CharaStand_NonCamera(IsAlly_(GetTargetIndex_(MultiCount,0)))
			break;
		case "Action":					//�s���Ҕz�u�̏ꍇ
			CharaStand_Action(MultiCount,CameraFlag);
			CharaStand_NonCamera(IsAlly_(GetActorIndex_(MultiCount)))
			break;
		case "Target":					//�ΏێҔz�u�̏ꍇ
			if(SubstituteCheck(MultiCount)){
				//�݂�����p�z�u
				CharaStand_Substitute(CameraFlag,MultiCount);
				CharaStand_NonCamera(IsAlly_(GetTargetIndex_(MultiCount,0)))
			} else {
				//�ʏ�S�̔z�u
				CharaStand_Target(CameraFlag,MultiCount);
				CharaStand_NonCamera(IsAlly_(GetTargetIndex_(MultiCount,0)))
			}
			break;
		case "Master":					//�}�X�^�[�z�u�̏ꍇ
			CharaStand_Master(CameraFlag,MultiCount);
			break;
		case "AllNonCam":				//�S���i�J�����Ȃ��̔z�u�����j
			CharaStand_AllNonCam();
			break;
		default:
			//�w�肪�Ȃ��ꍇ�͉������Ȃ�
			break;
	}
	
	//DebugPrint_FuncName_OUT("CharaStand");
}

//�L�����z�u�Q�s���҃p�[�e�B�S��
function CharaStand_ActorFull(CameraFlag){
	//DebugPrint_FuncName_IN("CharaStand_ActorFull");
	//DebugPrint("	=>	CameraFlag	:	" + CameraFlag);
	
	local Actor = GetActorIndex_(0);
	local AllyFlag = IsAlly_(Actor);
	local Index;
	if(AllyFlag == true){
		Index = GetAllyIndex_(0);
	} else {
		Index = GetEnemyIndex_(0);
	}
	
	local cParty = cFullPartyInfo(Index);
	
	//BattleCommon������W��ǂݍ���
	ChangeIndexPointData_(BATTLE_COMMON_POINT_DATA);
	
	//�S�����X�^�[��\��
	for(local i =0 ; i < cParty.PartyNum ; i += 1){
		SetMonster_Empty(cParty.Index[i], cParty.Empty[i], cParty.Rotate[i]);
	}
	if(CameraFlag == true){
		Task_AnimeMoveCamera_(cParty.CamEmpty_Area , cParty.CamTgtEmpty_Area);
	}
	
	//DebugPrint_FuncName_OUT("CharaStand_ActorFull");
}

//�L�����z�u�Q�Ώێ҃p�[�e�B�S��
function CharaStand_TargetFull(CameraFlag){
	//DebugPrint_FuncName_IN("CharaStand_TargetFull");
	//DebugPrint("	=>	CameraFlag	:	" + CameraFlag);
	
	local Target = GetTargetIndex_(0);
	local AllyFlag = IsAlly_(Target);
	if(AllyFlag == true){
		Index = GetAllyIndex_(0);
	} else {
		Index = GetEnemyIndex_(0);
	}
	
	local cParty = cFullPartyInfo(Index);
	
	//BattleCommon������W��ǂݍ���
	ChangeIndexPointData_(BATTLE_COMMON_POINT_DATA);
	
	//�S�����X�^�[��\��
	for(local i =0 ; i < cParty.PartyNum ; i += 1){
		SetMonster_Empty(cParty.Index[i], cParty.Empty[i], cParty.Rotate[i]);
	}
	if(CameraFlag == true){
		Task_AnimeMoveCamera_(cParty.CamEmpty_Area , cParty.CamTgtEmpty_Area);
	}
	
	
	
	//DebugPrint_FuncName_OUT("CharaStand_TargetFull");
}

//�L�����z�u�Q�p�[�e�B�S��
//AllyFlag	:	�G�����̂ǂ����\�����邩�H
function CharaStand_PartyFull(CameraFlag,AllyFlag){
	//DebugPrint_FuncName_IN("CharaStand_PartyFull");
	//DebugPrint("	=>	CameraFlag	:	" + CameraFlag);
	
	local Index;
	
	if(AllyFlag == true){
		Index = GetAllyIndex_(0);
	} else {
		Index = GetEnemyIndex_(0);
	}
	
	local cParty = cFullPartyInfo(Index);
	
	//BattleCommon������W��ǂݍ���
	ChangeIndexPointData_(BATTLE_COMMON_POINT_DATA);
	
	//�S�����X�^�[��\��
	for(local i =0 ; i < cParty.PartyNum ; i += 1){
		SetMonster_Empty(cParty.Index[i], cParty.Empty[i], cParty.Rotate[i]);
	}
	if(CameraFlag == true){
		Task_AnimeMoveCamera_(cParty.CamEmpty_Area , cParty.CamTgtEmpty_Area);
	}
	
	//DebugPrint_FuncName_OUT("CharaStand_PartyFull");
}

//�L�����z�u�Q�s���ҁi�񐔎w��j
//MultiCount	:����ڂ̍s�����H
//CameraFlag	:�J������z�u���邩�H
function CharaStand_Action(MultiCount,CameraFlag){
	//DebugPrint_FuncName_IN("CharaStand_Action");
	//DebugPrint("	=>	CameraFlag	:	" + CameraFlag);
	
	//BattleCommon������W��ǂݍ���
	ChangeIndexPointData_(BATTLE_COMMON_POINT_DATA);
	
	//�s���҂��P�̂̏ꍇ
	local CamCenterMonster = GetActorIndex_(MultiCount);
	local cParty = cFullPartyInfo(CamCenterMonster)
	for(local i = 0 ; i < cParty.PartyNum ; i += 1 ){
		CharaStand_SingleCameraSetting(	cParty.Index[i],
										cParty.Empty[i],
										cParty.UpCam[i],
										cParty.UpCamTgt[i],
										cParty.Rotate[i],
										CameraFlag,
										CamCenterMonster);
	}
	
	//DebugPrint_FuncName_OUT("CharaStand_Action");
}

//�L�����z�u�Q�}�X�^�[�\��
function CharaStand_Master(CameraFlag,MultiCount){
	//DebugPrint_FuncName_IN("CharaStand_Master");
	//DebugPrint("	=>	CameraFlag	:	" + CameraFlag);
	//DebugPrint("	=>	AllyFlag	:	" + AllyFlag);
	
	local Actor = GetActorIndex_(MultiCount);
	local AllyFlag = IsAlly_(Actor)
	local Index;
	if(AllyFlag == true){
		Index = GetAllyIndex_(0);
	} else {
		Index = GetEnemyIndex_(0);
	}
	local cParty = cFullPartyInfo(Index);
	
	//BattleCommon������W��ǂݍ���
	ChangeIndexPointData_(BATTLE_COMMON_POINT_DATA);
	
	//�S�����X�^�[��\��
	for(local i =0 ; i < cParty.PartyNum ; i += 1){
		SetMonster_Empty(cParty.Index[i], cParty.Empty[i], cParty.Rotate[i]);
	}
	//�}�X�^�[�p�̃J������z�u
	if(CameraFlag == true){
		
		Task_AnimeMoveCamera_(cParty.CamEmpty_Master , cParty.CamTgtEmpty_Master);
	}
	
	//DebugPrint_FuncName_OUT("CharaStand_Master");
}


//�L�����z�u�Q�Ώێ҃p�[�e�B�z�u
function CharaStand_Target(CameraFlag,MultiCount){
	//DebugPrint_FuncName_IN("CharaStand_Target");
	//DebugPrint("	=>	CameraFlag	:	" + CameraFlag);
	//DebugPrint("	=>	MultiCount	:	" + MultiCount);
	
	//BattleCommon������W��ǂݍ���
	ChangeIndexPointData_(BATTLE_COMMON_POINT_DATA);
	
	//�K�v�ƂȂ�ϐ��̒�`
	local Target = GetTargetIndex_(0,0);
	local TargetNum = GetTargetNum_(MultiCount)
	local cParty = cFullPartyInfo(Target)
	local SingleTargetFlag = IsTargetSingle_(MultiCount);
	
	//�Ώێ҂��P�̂̏ꍇ
	if(SingleTargetFlag == true){
		local CamCenterMonster = GetTargetIndex_(MultiCount,0);
		for(local i = 0 ; i < cParty.PartyNum ; i += 1 ){
			CharaStand_SingleCameraSetting(	cParty.Index[i],
											cParty.Empty[i],
											cParty.UpCam[i],
											cParty.UpCamTgt[i],
											cParty.Rotate[i],
											CameraFlag,
											CamCenterMonster);
		}
	} else {
	//�Ώێ҂������̏ꍇ
		for(local i = 0 ; i < cParty.PartyNum ; i++){
			SetMonster_Empty(cParty.Index[i] , cParty.Empty[i] , cParty.Rotate[i]);

		}
		Task_AnimeMoveCamera_(cParty.CamEmpty_Area,cParty.CamTgtEmpty_Area);
	}
	
	
	//DebugPrint_FuncName_OUT("CharaStand_Target");
}

//�L�����z�u�Q�݂����z�u
function CharaStand_Substitute(CameraFlag,MultiCount){
	//DebugPrint_FuncName_IN("CharaStand_Substitute");
	//DebugPrint("	=>	CameraFlag	:	" + CameraFlag);
	//DebugPrint("	=>	MultiCount	:	" + MultiCount);
	
	//BattleCommon������W��ǂݍ���
	ChangeIndexPointData_(BATTLE_COMMON_POINT_DATA);
	
	//�K�v�ƂȂ�ϐ��̒�`
	local Target = GetTargetIndex_(0,0);
	local TargetNum = GetTargetNum_(MultiCount);
	local cParty = cFullPartyInfo(Target);
	local SingleTargetFlag = IsTargetSingle_(MultiCount);
	
	//�Ώێ҂��P�̂̏ꍇ
	if(SingleTargetFlag == true){
		local CamCenterMonster = GetTargetIndex_(MultiCount,0);
		for(local i = 0 ; i < cParty.PartyNum ; i += 1 ){
			if(cParty.Index[i] == Target){
				CharaStand_SingleCameraSetting(	cParty.Index[i],
												cParty.Empty[i],
												cParty.UpCam[i],
												cParty.UpCamTgt[i],
												cParty.Rotate[i],
												CameraFlag,
												CamCenterMonster);
			} else {
				//�݂����ΏۊO�z�u
				CharaStand_SingleCameraSetting(	cParty.Index[i],
												cParty.Empty_Substitute[i],
												cParty.UpCam[i],
												cParty.UpCamTgt[i],
												cParty.Rotate[i],
												CameraFlag,
												CamCenterMonster);
			}
		}
	} else {
	//�Ώێ҂������̏ꍇ
		for(local i = 0 ; i < cParty.PartyNum ; i++){
			if(cParty.Index[i] == Target){
				SetMonster_Empty(cParty.Index[i] , cParty.Empty[i] , cParty.Rotate[i]);
			} else {
				//�݂����ΏۊO�z�u
				SetMonster_Empty(cParty.Index[i] , cParty.Empty_Substitute[i] , cParty.Rotate[i]);
			}
		}	
		Task_AnimeMoveCamera_(cParty.CamEmpty_Area,cParty.CamTgtEmpty_Area);
	}
	
	//DebugPrint_FuncName_OUT("CharaStand_Substitute");
}

//�L�����z�u�Q�X�J�E�g�Ώ۔z�u
function CharaStand_ScoutTarget()
{
	//DebugPrint_FuncName_IN("CharaStand_ScoutTarget");
	
	//BattleCommon������W��ǂݍ���
	ChangeIndexPointData_(BATTLE_COMMON_POINT_DATA);
	
	//�K�v�ƂȂ�ϐ��̒�`
	local Target = GetTargetIndex_(0,0);
	local cParty = cFullPartyInfo(Target)
	local CamCenterMonster = GetTargetIndex_(0,0);
	
	//�X�J�E�g�Ώۂ��A�b�v�ŕ\��
	for(local i = 0 ; i < cParty.PartyNum ; i += 1 ){
		CharaStand_SingleCameraSetting(	cParty.Index[i],
										cParty.Empty[i],
										cParty.UpCam[i],
										cParty.UpCamTgt[i],
										cParty.Rotate[i],
										true,
										CamCenterMonster);
		if(cParty.Index[i] != Target){
			SetVisible_(cParty.Index[i] , false);
		}
	}
	
	//DebugPrint_FuncName_OUT("CharaStand_Target");
}

//�L�����z�u�Q�S���z�u
function CharaStand_AllNonCam()
{
	//DebugPrint_FuncName_IN("CharaStand_AllNonCam");
	//BattleCommon������W��ǂݍ���
	ChangeIndexPointData_(BATTLE_COMMON_POINT_DATA);
	
	local CameraFlag	= false
	
	//���p�[�e�B��z�u����
	CharaStand_PartyFull(false , true)
	CharaStand_PartyFull(false , false)
	//DebugPrint_FuncName_OUT("CharaStand_AllNonCam");
}

//�L�����z�u�Q�p�[�e�B�S���z�u�{�J�����P�̑Ώ�
//AllyFlag				:	�G�����̂ǂ����\�����邩�H
//CamCenterMonster		:	�J�����̒��S�Ƃ��郂���X�^�[
function CharaStand_PartyFull_CamCenter(AllyFlag,CamCenterMonster){
	//DebugPrint_FuncName_IN("CharaStand_PartyFull_CamCenter");
	//DebugPrint("	=>	AllyFlag			:	" + AllyFlag);
	//DebugPrint("	=>	CamCenterMonster	:	" + CamCenterMonster);
	
	local cParty = cFullPartyInfo(CamCenterMonster);
	
	//�X�J�E�g�Ώۂ��A�b�v�ŕ\��
	for(local i = 0 ; i < cParty.PartyNum ; i += 1 ){
		CharaStand_SingleCameraSetting(	cParty.Index[i],
										cParty.Empty[i],
										cParty.UpCam[i],
										cParty.UpCamTgt[i],
										cParty.Rotate[i],
										true,
										CamCenterMonster);
	}
	
	//DebugPrint_FuncName_OUT("CharaStand_PartyFull_CamCenter");
}

//�L�����z�u�QPartyInfo
//cParty			: cPartyInfo�`��
//SingleFlag		: �P�̕\�����s�����H
//CamCenterMonster	: �P�̕\�����̒��S�����X�^�[�i�S�̂̏ꍇ��null)
function CharaStand_PartyInfo(cParty , SingleFlag , CamCenterMonster)
{
	//DebugPrint_FuncName_IN("CharaStand_PartyInfo");
	//DebugPrint("	=>	SingleFlag				:	" + SingleFlag);
	//DebugPrint("	=>	CamCenterMonster		:	" + CamCenterMonster);
	
	//BattleCommon������W��ǂݍ���
	ChangeIndexPointData_(BATTLE_COMMON_POINT_DATA);
	
	if(SingleFlag == true){
		//�P�̕\���̍ۂ͂�����
		for(local i = 0 ; i < cParty.PartyNum ; i += 1 ){
			CharaStand_SingleCameraSetting(	cParty.Index[i],
											cParty.Empty[i],
											cParty.UpCam[i],
											cParty.UpCamTgt[i],
											cParty.Rotate[i],
											true,
											CamCenterMonster);
		}
	} else {
		//�S�̕\���̍ۂ͂�����
		for(local i = 0 ; i < cParty.PartyNum ; i++){
			SetMonster_Empty(cParty.Index[i] , cParty.Empty[i] , cParty.Rotate[i]);
		}
		Task_AnimeMoveCamera_(cParty.CamEmpty_Area , cParty.CamTgtEmpty_Area);
	}
	
	//DebugPrint_FuncName_OUT("CharaStand_PartyInfo");
}

//�P�̔z�u�p�L�����E�J�����z�u
//Monster			�F�����X�^�[�C���f�b�N�X
//MonsterEmpty		�F�����X�^�[�̔z�uEmpty
//CameraEmpty		�FCameraEmpty
//CameraTargetEmpty	�FCameraTargetEmpty
//Rotate			�F�����X�^�[�̌������
//CameraFlag		�F�J������z�u���邩�H
//CamTargetMonster	�F�J�����̒��S�Ƃ��郂���X�^�[�C���f�b�N�X
function CharaStand_SingleCameraSetting(Monster,MonsterEmpty,CameraEmpty,CameraTargetEmpty,Rotate,CameraFlag,CamCenterMonster)
{
	
	//DebugPrint_FuncName_IN("CharaStand_Single_CharaSet");
	//DebugPrint("	=>	Monster				:	" + Monster);
	//DebugPrint("	=>	CamCenterMonster	:	" + CamCenterMonster);
	//DebugPrint("	=>	MonsterEmpty		:	" + MonsterEmpty);
	//DebugPrint("	=>	CameraEmpty			:	" + CameraEmpty);
	//DebugPrint("	=>	CameraTargetEmpty	:	" + CameraTargetEmpty);
	//DebugPrint("	=>	Rotate				:	" + Rotate);
	//DebugPrint("	=>	CameraFlag			:	" + CameraFlag);
	
	if(Monster == INVALID_CHARACTER){return;}
	
	//�K�v�ƂȂ�N���X�̓Ǎ�
	local cMonster = cMonsterInfo(Monster)
	
	//BattleCommon������W��ǂݍ���
	ChangeIndexPointData_(BATTLE_COMMON_POINT_DATA);
	
	if(cMonster.Type != LIVETYPE.NONE){
		SetMonster_Empty(Monster,MonsterEmpty,Rotate);
		local Action = GetActorIndex_(0)
		if(Monster == CamCenterMonster){
			if(CameraFlag == true){
				Task_AnimeMoveCamera_(CameraEmpty,CameraTargetEmpty);
			}
		}
	}
	
	//Gsize���Ώۂ̏ꍇ�́ASSize���\���ɐ؂�ւ���
	if(GetMonsterSize_(CamCenterMonster) == SIZE_G){
		if(CamCenterMonster == GetAllyIndex_(0)){
			SetVisible_(GetAllyIndex_(1),false);
		} else if(CamCenterMonster == GetAllyIndex_(1)){
			SetVisible_(GetAllyIndex_(0),false);
		} else if(CamCenterMonster == GetEnemyIndex_(0)){
			SetVisible_(GetEnemyIndex_(1),false);
		} else if(CamCenterMonster == GetEnemyIndex_(1)){
			SetVisible_(GetEnemyIndex_(0),false);
		}
	}
	
	//DebugPrint_FuncName_OUT("CharaStand_Single_CharaSet");
}

//�f���Ă��Ȃ����̃����X�^�[�𐮗񂵁A��\�����B
//AllyFlag		: �h�f���ق��́hAllyFlag
function CharaStand_NonCamera(AllyFlag)
{
	local Index
	if(AllyFlag){
		Index = GetEnemyIndex_(0)
	} else {
		Index = GetAllyIndex_(0)
	}
	local cParty = cFullPartyInfo(Index)
	//BattleCommon������W��ǂݍ���
	ChangeIndexPointData_(BATTLE_COMMON_POINT_DATA);
	//�S�̕\���̍ۂ͂�����
	for(local i = 0 ; i < cParty.PartyNum ; i++){
		SetMonster_Empty(cParty.Index[i] , cParty.Empty[i] , cParty.Rotate[i]);
		SetVisible_(cParty.Index[i], false);
	}
	
	//�}�X�^�[��z�u
	CharaStand_Master(AllyFlag)
}

//�}�X�^�[���f�t�H���g�ʒu�ɔz�u
//AllyFlag	: �G�����A��������
function CharaStand_Master(AllyFlag)
{
	local cParty = cAllyFlagPartyInfo(AllyFlag)
	
	//�}�X�^�[�����C�h��Ԃ̏ꍇ�͌��̏����ɖ߂�
	if(cParty.IsPartyRide == true){return;}
	
	//cParty�̏����}�X�^�[��z�u
	SetMaster_Empty(cParty.MasterIndex,cParty.Empty_Master,cParty.Rotate_Master)
	
}

//�L�����z�u���W�擾�E�J�������_���W
//AllyFlag					:�G��������i������true�j
function GetVec3_Camera(AllyFlag){
	//DebugPrint_FuncName_IN("GetVec3_Camera");
	//DebugPrint("	=>	AllyFlag	:	" + AllyFlag);
	
	local Vec3;
	local Index;
	
	if(AllyFlag == true){
		Index = GetAllyIndex_(0);
	} else {
		Index = GetEnemyIndex_(0);
	}
	
	local cParty = cFullPartyInfo(Index);
	
	//BattleCommon������W��ǂݍ���
	ChangeIndexPointData_(BATTLE_COMMON_POINT_DATA);
	
	Vec3 = GetFbxPos_(cParty.CamEmpty_Area);
	
	//DebugPrint_FuncName_OUT("GetVec3_Camera");
	
	return Vec3;
}

//�L�����z�u���W�擾�E�J���������_���W
//AllyFlag					:�G��������i������true�j
function GetVec3_CameraTarget(AllyFlag){
	//DebugPrint_FuncName_IN("GetVec3_CameraTarget");
	//DebugPrint("	=>	AllyFlag	:	" + AllyFlag);
	
	local Vec3;
	local Index;
	
	if(AllyFlag == true){
		Index = GetAllyIndex_(0);
	} else {
		Index = GetEnemyIndex_(0);
	}
	
	local cParty = cFullPartyInfo(Index);
	
	//BattleCommon������W��ǂݍ���
	ChangeIndexPointData_(BATTLE_COMMON_POINT_DATA);
	
	Vec3 = GetFbxPos_(cParty.CamTgtEmpty_Area);
	
	//DebugPrint_FuncName_OUT("GetVec3_CameraTarget");
	
	return Vec3;
}

//�L�����z�u���W�擾�E�L�����z�u���W
//MonsNum						:�����X�^�[�ԍ��i0�`7�A��������0�`3�A�G����4�`7�j
function GetVec3_Monster(MonsNum){
	//DebugPrint_FuncName_IN("GetVec3_Monster");
	//DebugPrint("	=>	MonsNum	:	" + MonsNum);
	
	local Vec3;
	local Index;
	
	if(Index < 4){
		Index = GetAllyIndex_(MonsNum);
	} else {
		MonsNum = MonsNum - 4	//�G�����l�␳
		Index = GetEnemyIndex_(MonsNum);
	}

	local cParty = cFullPartyInfo(Index);
	
	//BattleCommon������W��ǂݍ���
	ChangeIndexPointData_(BATTLE_COMMON_POINT_DATA);
	
	local InitCheck = GetInitExistType_(Index);
	if(InitCheck == LIVETYPE.NONE){
		Vec3 = Vec3(0,0,0)
	} else {
		Vec3 = GetFbxPointPos_(cParty.Empty[MonsNum]);
	}
	
	//DebugPrint_FuncName_OUT("GetVec3_Monster");
	
	return Vec3;
}

//Empty���W�擾�E�S�̃G�t�F�N�g�z�u���W
//AllyFlag						:�G��������
function GetVec3_EffectEmpty(AllyFlag)
{
	//DebugPrint_FuncName_IN("GetVec3_EffectEmpty");
	//DebugPrint("	=>	AllyFlag	:	" + AllyFlag);
	
	local Vec3;
	local Index;
	
	if(AllyFlag == true){
		Index = GetAllyIndex_(0);
	} else {
		Index = GetEnemyIndex_(0);
	}
	
	local cParty = cFullPartyInfo(Index);
	
	//BattleCommon������W��ǂݍ���
	ChangeIndexPointData_(BATTLE_COMMON_POINT_DATA);
	
	Vec3 = GetFbxPointPos_(cParty.EffectEmpty_Area);
	
	//DebugPrint_FuncName_OUT("GetVec3_EffectEmpty");
	
	return Vec3;
}



//���ʉ��o=====================================================================
//CharaStandFlag�iToF�j		:	�L�����z����s�����H
//								�P�̔z�u
//MultiCount�i�����j		:	����ڂ̓��삩�H
//MultiStageCount�i�����j	:	���i�ڂ̓��삩�H
//WaitFlag	(ToF)			:	�G�t�F�N�g�\�����Wait�����邩�H
function LineEffect_Init(CharaStandFlag,MultiCount,MultiStageCount,WaitFlag,cAction)
{
	//DebugPrint_FuncName_IN("LineEffect_Init");
	//local ArgList =		["MultiCount"	,	MultiCount
	//					,"MultiStageCount"	,	MultiStageCount
	//					,"CharaStandFlag"	,	CharaStandFlag
	//					,"WaitFlag"	,	WaitFlag
	//					]
	//DebugPrint_functionParam("LineEffect_Init" , ArgList)
	
	if(IsScout_()){
		//�X�J�E�g�Ώۂ̏ꍇ�͕ʊ֐����Ăяo���B
		LineEffect_ScoutAttack(MultiCount)
	} else {
		local TargetType = GetTargetType_(MultiCount);
		if(TargetType == TARGET.ALL){
			LineEffect_AllDamage(CharaStandFlag,MultiCount,MultiStageCount,WaitFlag,cAction)
		} else {
			LineEffect_NormalDamage(CharaStandFlag,MultiCount,MultiStageCount,WaitFlag,cAction)
		}
	}
	
	SetApealPoint_Init(true);
	
	//DebugPrint_FuncName_OUT("LineEffect_Init");
}


//���ʉ��o�F�ʏ폈��
function LineEffect_NormalDamage(CharaStandFlag,MultiCount,MultiStageCount,WaitFlag,cAction)
{
	//DebugPrint_FuncName_IN("LineEffect_NormalDamage");
	//CharaStandFlag�iToF�j	:	�L�����z����s�����H
	//							�P�̔z�u
	//MultiCount�i�����j	:	����ڂ̓��삩�H
	//WaitFlag	(ToF)		:	�G�t�F�N�g�\�����Wait�����邩�H
	//DebugPrint("	=>	CharaStandFlag		:	" + CharaStandFlag);
	//DebugPrint("	=>	MultiCount 			:	" + MultiCount);
	//DebugPrint("	=>	MultiStageCount		:	" + MultiStageCount);
	//DebugPrint("BattleCommon_LoadParamIn_function_" + "LineEffect_NormalDamage");
	
	//�^�[�Q�b�g�^�C�v���擾
	local TargetType		= GetTargetType_(MultiCount)
	
	//�L�����N�^�[�𐮗񂳂��邩�H
	if(CharaStandFlag == true && IsScout_() != true){
		local CharaStand_Select = "Target";
		local CameraFlag = true;
		if(TargetType == TARGET.FIELD){
			//�t�B�[���h���ʂ̏ꍇ�́ACharaStand��ύX����B
			local AllyCheck;
			if(IsAlly_(GetActorIndex_(MultiCount))){
				AllyCheck = false;
			} else {
				AllyCheck = true;
			}
			DeleteAllEffect_()
			DeleteAllTask_();
			CharaStand_PartyFull(CameraFlag,AllyCheck)
			CharaStand_NonCamera(AllyCheck)
		} else {
			DeleteAllEffect_()
			CharaStand(CharaStand_Select,CameraFlag,MultiCount,cAction);
		}
	}
	
	if(cAction.AllActEffect0_Name != "EF213_23_JUDGMENT" && cAction.AllActEffect0_Name != "EF213_21_ABYSS_HAND"){
		Wait_(1);
	}
	
	
	//��O���b�Z�[�W�\������
	LineEffect_ExpentionMessage(MultiCount)
	
	//��O���� 2nd
	local SingleAttackFlag	= false;
	Exception_2ndCheck(MultiCount,SingleAttackFlag,cAction)
	
	//�݂����`�F�b�N
	
	
	//�^�[�Q�b�g�^�C�v�ɂ���āA�_���[�W������؂�ւ���B
	switch(TargetType)
	{
	case TARGET.BAKURETSU:			//�G2��ڈȍ~�����_��
	case TARGET.ALLY_MULTI_RANDOM:	//���������񃉃��_��
		LineEffect_BAKURETSU(MultiCount,MultiStageCount,cAction,WaitFlag)
		break;
	case TARGET.FIELD:				//�t�B�[���h����
		local EffectFlag = true;
		LineEffect_FIELD(MultiCount,MultiStageCount,cAction,WaitFlag,EffectFlag)
		break;
	default:
		local EffectFlag = true;
		if(SubstituteCheck(MultiCount)){
			//�݂�����p����
			LineEffect_Substitute(MultiCount,MultiStageCount,cAction,WaitFlag)
		} else {
			//�ʏ�_���[�W����
			LineEffect_SingleStage(MultiCount,MultiStageCount,cAction,WaitFlag,EffectFlag);
		}
		break;
	}
	
	//DebugPrint_FuncName_OUT("LineEffect_NormalDamage");
}

//�݂���蔻��
//MultiCount		: ����ڂ̍s�����H
function SubstituteCheck(MultiCount)
{
	local SubstituteCheck = false
	local TargetNum = GetTargetNum_(MultiCount)
	for(local IndexCount = 0 ; IndexCount < TargetNum ; IndexCount++){
		if(IsSwapTarget_(MultiCount,IndexCount)){
			SubstituteCheck = true;
		}
	}
	return SubstituteCheck;
}

//LineEffect�i�P���U���p�j
function LineEffect_SingleStage(MultiCount,MultiStageCount,cAction,WaitFlag,EffectFlag)
{
	//DebugPrint_FuncName_IN("LineEffect_SingleStage");
	//local ArgList =	["MultiCount"		,	MultiCount
	//					,"MultiStageCount"	,	MultiStageCount
	//					,"WaitFlag"			,	WaitFlag
	//					,"EffectFlag"		,	EffectFlag
	//					]
	//DebugPrint_functionParam("LineEffect_SingleStage" , ArgList)
	
	local TargetNum		= GetTargetNum_(MultiCount)
	local DamageType	= GetDamageType_(MultiCount,0)
	local EffectFrame	= cAction.EffectFrame;
	local DamageWait	= cAction.EffectFrame_DamageDirectionWait;
	local StateWait		= 0;
	local EndWait		= cAction.EffectFrame_EndWait;
	local Efficacy		= GetActionEfficacy_(MultiCount);
	
	//local ListStart =	"----< LineEffect_SingleStage_Info >----"
	//local ListFront =	"�E"
	//local List =			["TargetNum"		,	TargetNum
	//						,"Efficacy"			,	DebugPrint_Efficacy(Efficacy)
	//						,"DamageType"		,	DebugPrint_DamageType(DamageType)
	//						,"EffectFrame"		,	EffectFrame
	//						,"DamageWait"		,	DamageWait
	//						,"StateWait"		,	StateWait
	//						,"EndWait"			,	EndWait
	//						]
	//local ListEnd =		"LINE"
	//DebugPrint_OneList(List , ListStart , ListEnd , ListFront)
	
	if(EffectFlag == true){
		//���Z�G�t�F�N�g�̕\���E���Z�r�d�̍Đ�
		LineEffect_EffectBornDirection(MultiCount,MultiStageCount,cAction);
		
		//�_���[�W�����܂ł̑҂��ݒ�
		if(WaitFlag == true){
			switch(DamageType)
			{
			case AFFECT_PARAM.HP:
			case AFFECT_PARAM.HMP:
				if(cAction.AllActEffect0_Name == "EF213_19_GOD_HAND"){
					StartEarthQuake_(30, 5, 5);
					Wait_(DamageWait);
				} else {
					Wait_(DamageWait);
				}
				break;
			case AFFECT_PARAM.MP:
				Wait_(DamageWait);
				break;
			case AFFECT_PARAM.MAX_HP:
				Wait_(DamageWait);
				break;
			case AFFECT_PARAM.MAX_MP:
				Wait_(DamageWait);
				break;
			case AFFECT_PARAM.AT:
				Wait_(DamageWait);
				break;
			case AFFECT_PARAM.DF:
				Wait_(DamageWait);
				break;
			case AFFECT_PARAM.QC:
				Wait_(DamageWait);
				break;
			case AFFECT_PARAM.WS:
				Wait_(DamageWait);
				break;
			case AFFECT_PARAM.TS:
				Wait_(DamageWait);
				break;
			default:
				//�_���[�W�^�C�v���Ȃ��ꍇ��Wait���s��Ȃ�
				//�j�ł̓��p��O����
				if(cAction.AllActEffect0_Name == "EF040_14_PROP_HAMETSUNOHI"){
					Wait_(DamageWait)
				}
				//�W�o�n���r������O����
				if(cAction.AllActEffect0_Name == "EF110_28_JIBA_MAGIC_CIRCLE"){
					Wait_(DamageWait)
				}
				break;
			}
		}
	}
	
	//���Z�̃_���[�W����
	local MaxActHitNum = GetMaxActHitNum(MultiCount)
	
	for(MultiStageCount ; MultiStageCount < MaxActHitNum ; MultiStageCount++){
		for(local IndexCount = 0; IndexCount < TargetNum ; IndexCount++){
			local ActHitNum = GetActHitNum_(MultiCount, IndexCount);
			if(MultiStageCount < ActHitNum){
				local Target = GetTargetIndex_(MultiCount,IndexCount)
				if(Target != INVALID_CHARACTER){
					local SEFlag = true;
					local MotionFlag = true;
					SetDamageEffectSE(IndexCount,SEFlag,MotionFlag,MultiCount,MultiStageCount,false,cAction);
				}
			}
		}
		if(MaxActHitNum > 1){
			Wait_(15)
		}
	}
	
	//�e���_���[�W�`�F�b�N
	SetTeraPlusDamage_Init(MultiCount,WaitFlag,EffectFlag,cAction);

	//�X�e�[�^�X�����܂ł̑҂��ݒ�
	if(WaitFlag == true){
		local StateFlag		= false;
		local StateValue = 0
		for(local i = STATUS_TOP ; i < STATUS_NUM ; i++){
			for(local IndexCount = 0 ; IndexCount < TargetNum ; IndexCount++){
				local WorkStateValue = GetStatusValue_(i,MultiCount,IndexCount)
				if(WorkStateValue > 0){
					StateValue = GetStatusValue_(i,MultiCount,IndexCount)
					StateWait = gStateData[i].Up_Wait;
				} else if(WorkStateValue < 0 ){
					StateValue = GetStatusValue_(i,MultiCount,IndexCount)
					StateWait = gStateData[i].Down_Wait;
				}
			}
		}
		
		if(StateValue != 0 && Efficacy == EFFICACY.ATTACK && DamageType == AFFECT_PARAM.HP){
			//�X�e�[�^�X�ω��{�_���[�W������
			Wait_(40);
		}
		else{
			if(StateWait == 0){
				Wait_(EndWait);
			} else {
				switch(cAction.AllActEffect0_Name)
				{
				case "EF040_14_PROP_HAMETSUNOHI":	//�j�ł̓�����
					break;
				default:
					Wait_(DamageWait);
					break;
				}
			}
		}
	}
	
	//�X�e�[�^�X�ω�����
	local WaitFrame = 0;
	for(local IndexCount = 0 ; IndexCount < TargetNum ; IndexCount++){
		local WaitValue = SetStateEffect_Init(IndexCount ,MultiCount,cAction)
		if(WaitValue != 0){WaitFrame = WaitValue;}
	}
	
	if(WaitFrame != 0 && WaitFlag == true){Wait_(WaitFrame);}
	
	//��O���o�\��
	SetDamageEffect_ExceptionEffect(MultiCount,cAction)

	if(cAction.AllActEffect0_Name == "EF040_14_PROP_HAMETSUNOHI"){
		Wait_(EndWait)
	}

	//DebugPrint_FuncName_OUT("LineEffect_SingleStage");
}

//LineEffect�i�S�̍U���p�j
function LineEffect_AllDamage(CharaStandFlag,MultiCount,MultiStageCount,WaitFlag,cAction)
{
	//DebugPrint_FuncName_IN("LineEffect_AllDamage");
	local TargetNum		= GetTargetNum_(MultiCount)
	local DamageType	= GetDamageType_(MultiCount,0)
	local EffectFrame	= cAction.EffectFrame;
	local DamageWait	= cAction.EffectFrame_DamageDirectionWait;
	local StateWait		= 0;
	local EndWait		= cAction.EffectFrame_EndWait;
	local EffectFlag	= true;
	
	// M�EG�̉r���J�b�g�̒����ɍ��킹��
	Wait_(30);
	
	local FirstTarget = GetTargetIndex_(MultiCount, 0);
	
	// �ŏ��̑Ώێ҂̂���w�c����
	LineEffect_AllDamage_OneSide(MultiCount, MultiStageCount, cAction, WaitFlag, EffectFlag, IsAlly_(FirstTarget))
	LineEffect_AllDamage_OneSide(MultiCount, MultiStageCount, cAction, WaitFlag, EffectFlag, IsAlly_(FirstTarget) == false)
	
	//DebugPrint_FuncName_OUT("LineEffect_AllDamage");
}

//LineEffect�i�S�̍U���̕Б����o�j
//MultiCount		:����ڂ̍s�����H
//MultiStageCount	:���i�ڂ̍s�����H
//cAction			:cActionInfo�N���X�i�������A�S�̍U���ł͐���Ɏ��Ȃ��\������j
//WaitFlag			:����������Wait���s�����H
//EffectFlag		:���������ŃG�t�F�N�g��\�����邩�H
//AllyFlag			:�G��������i�ǂ��瑤��\�����邩�H�j
function LineEffect_AllDamage_OneSide(MultiCount,MultiStageCount,cAction,WaitFlag,EffectFlag,AllyFlag)
{
	//DebugPrint_FuncName_IN("LineEffect_AllDamage_OneSide");
	local cParty;
	local TargetNum		= GetTargetNum_(MultiCount)
	local DamageType	= GetDamageType_(MultiCount,0)
	local EffectFrame	= cAction.EffectFrame;
	local DamageWait	= cAction.EffectFrame_DamageDirectionWait;
	local StateWait		= 0;
	local EndWait		= cAction.EffectFrame_EndWait;
	
	ChangeIndexPointData_(BATTLE_COMMON_POINT_DATA);
	
	local cAllyParty	= cFullPartyInfo(GetAllyIndex_(0))
	local cEnemyParty	= cFullPartyInfo(GetEnemyIndex_(0))
	
	local cParty;
	if(AllyFlag == true){
		cParty		= cAllyParty
	} else {
		cParty		= cEnemyParty
	}
	
	local AllyTargetNum = cAllyParty.PartyNum;
	
	//�L�����̔z�u
	local CameraFlag = true;
	CharaStand_PartyFull(CameraFlag,AllyFlag)
	CharaStand_NonCamera(AllyFlag)
	DeleteAllEffect_()
	Wait_(1)
	
	//��O���b�Z�[�W�\������
	LineEffect_ExpentionMessage(MultiCount)
	
	
	if(EffectFlag == true){
		//���Z�G�t�F�N�g�̕\���E���Z�r�d�̍Đ�
		for(local IndexCount = 0 ; IndexCount < TargetNum ; IndexCount++){
			if(IsAlly_(GetTargetIndex_(MultiCount,IndexCount)) == AllyFlag){
				MonsterSizeEffect(GetTargetIndex_(MultiCount,IndexCount) , GetSingleEffectName_(MultiCount,0));
				MonsterSizeEffect(GetTargetIndex_(MultiCount,IndexCount) , GetSingleEffectName_(MultiCount,1));
			}
		}
		
		if(GetAllEffectName_(MultiCount,0) != null){
			local effectHandle = SetPointWorldEffect_(GetAllEffectName_(MultiCount,0), cParty.EffectEmpty_Area);
			SetEffectScale_(effectHandle, cParty.EffectScale_Area);
		}
		if(GetAllEffectName_(MultiCount,1) != null){
			local effectHandle = SetPointWorldEffect_(GetAllEffectName_(MultiCount,1), cParty.EffectEmpty_Area);
			SetEffectScale_(effectHandle, cParty.EffectScale_Area);
		}
	}
	Wait_(DamageWait);
	
	
	//����̍ő�A�������擾
	local MaxActHitNum = GetMaxActHitNum(MultiCount)
	
	for(MultiStageCount ; MultiStageCount < MaxActHitNum ; MultiStageCount++){
		for(local IndexCount = 0 ; IndexCount < TargetNum ; IndexCount++){
			if(IsAlly_(GetTargetIndex_(MultiCount,IndexCount)) == AllyFlag){
				local ActHitNum = GetActHitNum_(MultiCount, IndexCount);
				if(MultiStageCount < ActHitNum){
					local Target = GetTargetIndex_(MultiCount,IndexCount)
					if(Target != INVALID_CHARACTER){
						local SEFlag = true;
						local MotionFlag = true;
						SetDamageEffectSE(IndexCount,SEFlag,MotionFlag,MultiCount,MultiStageCount,false,cAction);
					}
				}
			}
		}
		if(MaxActHitNum > 1){
			Wait_(15)
		}
	}
	
	//��O���o�\���i���i����Ɠ����j
	for(local IndexCount = 0 ; IndexCount < TargetNum ; IndexCount++){
		if(IsAlly_(GetTargetIndex_(MultiCount,IndexCount)) == AllyFlag){
			SetDamageEffect_ExceptionEffect_IndexCount(MultiCount,IndexCount,cAction)
		}
	}
	
	//�X�e�[�^�X�����܂ł̑҂��ݒ�
	if(WaitFlag == true){
		local StateFlag = false 
		for(local i = STATUS_TOP ; i < STATUS_NUM ; i++){
			for(local IndexCount = 0 ; IndexCount < TargetNum ; IndexCount++){
				if(IsAlly_(GetTargetIndex_(MultiCount,IndexCount)) == AllyFlag){
					local StateValue = GetStatusValue_(i,MultiCount,IndexCount)
					if(StateValue >0 ){
						StateWait = gStateData[i].Up_Wait;
					} else if(StateValue < 0 ) {
						StateWait = gStateData[i].Down_Wait;
					}
				}
			}
		}
		if(StateWait == 0){
			Wait_(EndWait);
		} else {
			Wait_(DamageWait);
		}
	}
	
	//�X�e�[�^�X�ω�����
	local WaitFrame = 0;
	local WaitValue = 0;
	for(local IndexCount = 0 ; IndexCount < TargetNum ; IndexCount++){
		if(IsAlly_(GetTargetIndex_(MultiCount,IndexCount)) == AllyFlag){
			WaitValue = SetStateEffect_Init(IndexCount ,MultiCount,cAction)
		}
		if(WaitValue != 0){WaitFrame = WaitValue;}
	}
	if(WaitFrame != 0 && WaitFlag == true){Wait_(WaitFrame);}
	
	//DebugPrint_FuncName_OUT("LineEffect_AllDamage_OneSide");
}


//LineEffect�i���i�U���p�j
function LineEffect_BAKURETSU(MultiCount,MultiStageCount,cAction,WaitFlag)
{
	//DebugPrint_FuncName_OUT("LineEffect_BAKURETSU");
	local TargetNum		= GetTargetNum_(MultiCount);
	local EffectFrame	= 0;
	local DamageWait	= cAction.EffectFrame_DamageDirectionWait;
	local StateWait		= 0;
	local EndWait		= cAction.EffectFrame_EndWait;
	local Target		= GetTargetIndex_(MultiCount,0)
	local cParty		= cFullPartyInfo(Target)
	
	//�S��Effect�͂��炩���ߏo���Ă���
	if(cAction.AllActEffect0_Name != null){
		ChangeIndexPointData_(BATTLE_COMMON_POINT_DATA);
		local EffectParam = SetPointWorldEffect_(cAction.AllActEffect0_Name, cParty.EffectEmpty_Area);
		SetEffectScale_(EffectParam, cParty.EffectScale_Area);
	}
	if(cAction.AllActEffect1_Name != null){
		ChangeIndexPointData_(BATTLE_COMMON_POINT_DATA);
		local EffectParam = SetPointWorldEffect_(cAction.AllActEffect1_Name, cParty.EffectEmpty_Area);
		SetEffectScale_(EffectParam, cParty.EffectScale_Area);
	}
	
	local Target		= GetTargetIndex_(MultiCount , 0);
	local cParty		= cFullPartyInfo(Target);
	local MotionTask	= array(cParty.PartyNum,null);
	local PopCount		= array(cParty.PartyNum,0);
	
	//����̍ő�A�������擾
	local MaxActHitNum = GetMaxActHitNum(MultiCount)
	
	//�ʃG�t�F�N�g���Ȃ��ꍇ�͂�����Wait���s��
	if(cAction.BAKURETSU_AllOnlyWait != 0){
		Wait_(cAction.BAKURETSU_AllOnlyWait);
	}
	
	//�X�e�[�^�X�ω������O�Ɋm�F
	local StateChangeFlag	= false;
	local StateWait			= 0;
	for(local i = STATUS_TOP ; i < STATUS_NUM ; i++){
		for(local IndexCount = 0 ; IndexCount < TargetNum ; IndexCount++){
			local StateValue	= GetStatusValue_(i,MultiCount,IndexCount)
			local StateEndFlag	= GetStatusEndFlag_(i,MultiCount,IndexCount)
			if(StateValue != 0 || StateEndFlag == true){
				StateChangeFlag = true;
				local StatusEndFlag = GetStatusEndFlag_(i,MultiCount,0)
				if(GetStatusValue_(i,MultiCount,IndexCount) >0 ){
					StateWait = gStateData[i].Up_Wait;
				} else if(StateValue < 0 ){
					StateWait = gStateData[i].Down_Wait;
				} else if(StateValue == 0 && StateEndFlag == true){
					StateWait = gStateData[i].Reset_Wait;
				}
			}
		}
	}
	
	for(MultiStageCount ; MultiStageCount < MaxActHitNum ; MultiStageCount++){
		for(local IndexCount = 0 ; IndexCount < TargetNum ; IndexCount++){
			Target = GetTargetIndex_(MultiCount , IndexCount);
			local DamageType = GetDamageType_(MultiCount,IndexCount)
			if(cAction.SingleActEffect0_Name != null){
				MonsterNonSizeEffect(Target,cAction.SingleActEffect0_Name);
			}
			if(cAction.SingleActEffect1_Name != null){
				MonsterNonSizeEffect(Target,cAction.SingleActEffect1_Name);
			}
			//�_���[�W�����܂ł̑҂��ݒ�
			if(WaitFlag == true){
				switch(DamageType)
				{
				case AFFECT_PARAM.HP:
				case AFFECT_PARAM.MP:
					Wait_(DamageWait);
					break;
				default:
					break;
				}
			}
			
			local PartyCount	= 0;
			
			//���Z�̃_���[�W����
			if(Target != INVALID_CHARACTER){
				local SEFlag		= true;
				local MotionFlag	= true;
				for(PartyCount = 0 ; PartyCount < cParty.PartyNum ; PartyCount++){
					if(cParty.Index[PartyCount] == Target){break;}
				}
				if(MotionTask[PartyCount] != null){
					//���i����̏ꍇ�ATaskMotion�̊Ǘ��������ōs��
					DeleteTask_(MotionTask[PartyCount]);
					MotionTask[PartyCount] = null;
				}
				if(GetDamageType_(MultiCount,IndexCount) == AFFECT_PARAM.HP || GetDamageType_(MultiCount,IndexCount) == AFFECT_PARAM.MP){
					MotionTask[PartyCount] = SetBAKURETSUDamageEffectSE(IndexCount,SEFlag,MotionFlag,MultiCount,MultiStageCount,cAction,PopCount[PartyCount]);
					PopCount[PartyCount] += 1
				
				}
			}
			//��O���o�\��
			SetDamageEffect_ExceptionEffect_IndexCount(MultiCount,IndexCount,cAction)
			
			//�X�e�[�^�X�����܂ł̑҂��ݒ�
			if(WaitFlag == true && EndWait > 0){Wait_(EndWait);}
			if(StateChangeFlag == true){
				//�X�e�[�^�X�ω�����
				local WaitFrame = 0;
				if(IsTargetSingle_(MultiCount)){
					local ReturnParam = SetBAKURETSUStateEffect_Init(IndexCount ,MultiCount,MultiStageCount,MotionTask[PartyCount],cAction);
					local WaitValue				= ReturnParam[0];
					MotionTask[PartyCount]		= ReturnParam[1];
					if(WaitValue != 0){WaitFrame = WaitValue;}
				} else {
					local ReturnParam 	= SetBAKURETSUStateEffect_Init(IndexCount ,MultiCount,MultiStageCount,MotionTask[PartyCount],cAction);
					local WaitValue				= ReturnParam[0];
					MotionTask[PartyCount]		= ReturnParam[1];
					if(WaitValue != 0){WaitFrame = WaitValue;}
				}
				//���i�n�X�e�[�^�X�҂��͒ʏ�̔���
				if(WaitFrame != 0 && WaitFlag == true){Wait_(WaitFrame/2);}
			}
		}
		StopEarthQuake_()
	}
	
	//�����I�ɏI���܂ő҂�����B
	if(TargetNum == 1){
		Wait_(45);
	} else {
		Wait_(30);
	}
	
	//DebugPrint_FuncName_OUT("LineEffect_BAKURETSU");
}

//LineEffect�i�t�B�[���h���ʗp�j
function LineEffect_FIELD(MultiCount,MultiStageCount,cAction,WaitFlag,EffectFlag)
{
	//DebugPrint_FuncName_IN("LineEffect_FIELD");
	//local ArgList =	["MultiCount"		,	MultiCount
	//					,"MultiStageCount"	,	MultiStageCount
	//					,"WaitFlag"			,	WaitFlag
	//					,"EffectFlag"		,	EffectFlag
	//					]
	//DebugPrint_functionParam("LineEffect_FIELD" , ArgList)

	local DamageType	= GetDamageType_(MultiCount,0)
	local EffectFrame	= cAction.EffectFrame;
	local DamageWait	= cAction.EffectFrame_DamageDirectionWait;
	local StateWait		= 0;
	local Actor			= GetActorIndex_(MultiCount);
	local CharaStand_Index;
	if(IsAlly_(Actor)){
		CharaStand_Index = GetEnemyIndex_(0);
	} else {
		CharaStand_Index = GetAllyIndex_(0);
	}
	local cParty		= cFullPartyInfo(CharaStand_Index)
	local EndWait		= cAction.EffectFrame_EndWait;
	
	if(EffectFlag == true){
		//�S�̃G�t�F�N�g�i�O�j
		if(cAction.AllActEffect0_Name != null){
			ChangeIndexPointData_(BATTLE_COMMON_POINT_DATA);
			switch(cAction.AllActEffect0_Name){
			case "EF213_19_GOD_HAND":
				local EffectParam = SetPointWorldEffect_(cAction.AllActEffect0_Name, cParty.EffectEmpty_Area);
				SetEffectFrame_(EffectParam, 76)
				SetEffectScale_(EffectParam, cParty.EffectScale_Area);
				break;
			case "EF213_21_ABYSS_HAND":
				local EffectParam = SetPointWorldEffect_(cAction.AllActEffect0_Name, cParty.EffectEmpty_Area);
				SetEffectFrame_(EffectParam, 51)
				SetEffectScale_(EffectParam, cParty.EffectScale_Area);
				break;
			case "EF213_23_JUDGMENT":
				local EffectParam = SetPointWorldEffect_(cAction.AllActEffect0_Name, cParty.EffectEmpty_Area);
				SetEffectFrame_(EffectParam, 96)
				SetEffectScale_(EffectParam, cParty.EffectScale_Area);
				break;
			default:
				local EffectParam = SetPointWorldEffect_(cAction.AllActEffect0_Name, cParty.EffectEmpty_Area);
				SetEffectScale_(EffectParam, cParty.EffectScale_Area);
				break;
			}
		}
		//�S�̃G�t�F�N�g�i�P�j
		if(cAction.AllActEffect1_Name != null){
			ChangeIndexPointData_(BATTLE_COMMON_POINT_DATA);
			switch(cAction.AllActEffect1_Name){
			case "EF213_20_GOD_HAND_M":
				local EffectParam = SetPointWorldEffect_(cAction.AllActEffect1_Name, cParty.EffectEmpty_Area);
				SetEffectFrame_(EffectParam, 76)
				SetEffectScale_(EffectParam, cParty.EffectScale_Area);
				break;
			case "EF213_22_ABYSS_HAND_M":
				local EffectParam = SetPointWorldEffect_(cAction.AllActEffect1_Name, cParty.EffectEmpty_Area);
				SetEffectFrame_(EffectParam, 51)
				SetEffectScale_(EffectParam, cParty.EffectScale_Area);
				break;
			case "EF213_24_JUDGMENT_M":
				local EffectParam = SetPointWorldEffect_(cAction.AllActEffect1_Name, cParty.EffectEmpty_Area);
				SetEffectFrame_(EffectParam, 96)
				SetEffectScale_(EffectParam, cParty.EffectScale_Area);
				break;
			default:
				local EffectParam = SetPointWorldEffect_(cAction.AllActEffect1_Name, cParty.EffectEmpty_Area);
				SetEffectScale_(EffectParam, cParty.EffectScale_Area);
				break;
			}
		}
	}
	
	Wait_(DamageWait);
	
	for(MultiStageCount ; MultiStageCount < GetMaxActHitNum(MultiCount) ; MultiStageCount++){
		for(local IndexCount = 0 ; IndexCount < GetTargetNum_(MultiCount) ; IndexCount++){
			if(GetTargetIndex_(MultiCount , IndexCount) != INVALID_CHARACTER){
				local SEFlag = true;
				local MotionFlag = true;
				local PierceFlag = false;
				SetDamageEffectSE(IndexCount,SEFlag,MotionFlag,MultiCount,MultiStageCount,PierceFlag,cAction)
				SetStateEffect_Init(IndexCount,MultiCount,cAction)
			}
		}
	}
	
	//��O���o�\��
	SetDamageEffect_ExceptionEffect(MultiCount,cAction)
	
	Wait_(EndWait);

	//DebugPrint_FuncName_OUT("LineEffect_FIELD");
}

//LineEffect�i�݂����_���[�W�j
function LineEffect_Substitute(MultiCount,MultiStageCount,cAction,WaitFlag)
{
	//DebugPrint_FuncName_IN("LineEffect_Substitute");
	
	local TargetNum = GetTargetNum_(MultiCount);
	local EffectFrame	= 0;
	local DamageWait	= cAction.EffectFrame_DamageDirectionWait;
	local EndWait		= cAction.EffectFrame_EndWait;
	local Target = GetTargetIndex_(MultiCount,0)
	local cParty = cFullPartyInfo(Target)
	local TargetType = GetTargetType_(MultiCount)
	local MaxActHitNum = GetMaxActHitNum(MultiCount);
	
	//�S��Effect�͂��炩���ߏo���Ă���
	if(cAction.AllActEffect0_Name != null){
		ChangeIndexPointData_(BATTLE_COMMON_POINT_DATA);
		local EffectParam = SetPointWorldEffect_(cAction.AllActEffect0_Name, cParty.EffectEmpty_Area);
		SetEffectScale_(EffectParam, cParty.EffectScale_Area);
	}
	if(cAction.AllActEffect1_Name != null){
		ChangeIndexPointData_(BATTLE_COMMON_POINT_DATA);
		local EffectParam = SetPointWorldEffect_(cAction.AllActEffect1_Name, cParty.EffectEmpty_Area);
		SetEffectScale_(EffectParam, cParty.EffectScale_Area);
	}
	
	local Target		= GetTargetIndex_(MultiCount , 0);
	local cParty		= cFullPartyInfo(Target);
	local MotionTask	= null;
	local PopCount		= 0;
	
	//�_���[�W����
	for(local IndexCount = 0 ; IndexCount < TargetNum ; IndexCount++){
		Target = GetTargetIndex_(MultiCount, IndexCount);
		local DamageType = GetDamageType_(MultiCount, IndexCount)
		//�G�t�F�N�g�̕\��
		MonsterNonSizeEffect(Target,cAction.SingleActEffect0_Name);
		MonsterNonSizeEffect(Target,cAction.SingleActEffect1_Name);
		
		//�_���[�W�����܂ł̑҂��ݒ�
		if(WaitFlag == true){
			switch(DamageType)
			{
			case AFFECT_PARAM.HP:
			case AFFECT_PARAM.MP:
				if(IndexCount == 0){
					Wait_(DamageWait);
				} else {
					Wait_(10);
				}
				break;
			default:
				break;
			}
		}
		
		if(IndexCount == 0 || cAction.SingleActEffect0_Name != null){
			Wait_(EndWait);
		}
		
		local ActHitNum = GetActHitNum_(MultiCount,IndexCount)
		for(MultiStageCount = 0 ; MultiStageCount < ActHitNum ; MultiStageCount++){
			//���Z�̃_���[�W����
			if(Target != INVALID_CHARACTER){
				local SEFlag		= true;
				local MotionFlag	= true;
				local PartyCount	= 0;
				
				for(PartyCount = 0 ; PartyCount < cParty.PartyNum ; PartyCount++){
					if(cParty.Index[PartyCount] == Target){break;}
				}
				if(MotionTask != null){
					//���i����̏ꍇ�ATaskMotion�̊Ǘ��������ōs��
					DeleteTask_(MotionTask);
					MotionTask = null;
				}
				MotionTask = SetBAKURETSUDamageEffectSE(IndexCount,SEFlag,MotionFlag,MultiCount,MultiStageCount,cAction,PopCount);
				PopCount += 1

				Wait_(10)
			}
		}
		
		if(GetActionEfficacy_(MultiCount) != EFFICACY.ATTACK){
			local WaitValue = SetStateEffect_Init(IndexCount ,MultiCount,cAction)
			if(WaitFlag == true){
				if(WaitValue != 0){
					Wait_(WaitValue);
				}
			}
		}
	}
	
	if(GetActionEfficacy_(MultiCount) == EFFICACY.ATTACK){
		SetTeraPlusDamage_Substitute_Init(MultiCount, true, cAction);
		local checkStatus = false;
		local isDead = false;
		for(local IndexCount = 0 ; IndexCount < TargetNum ; IndexCount++){
			checkStatus = checkStatus || (GetStatusValue_(STATUS.DEATH, MultiCount, IndexCount) != 0);
			isDead = isDead || (IsDead_(MultiCount, IndexCount));
		}
		
		if(checkStatus || isDead == false){
			for(local IndexCount = 0 ; IndexCount < TargetNum ; IndexCount++){
				local WaitValue = SetStateEffect_Init(IndexCount, MultiCount, cAction);
				if(WaitFlag == true){
					if(WaitValue != 0){
						Wait_(WaitValue);
					}
				}
			}
		}
	}
	
	for(local IndexCount = 0 ; IndexCount < TargetNum ; IndexCount++){
		//��O����
		SetDamageEffect_ExceptionEffect_IndexCount(MultiCount,IndexCount,cAction);
	}
	Wait_(30)

	//DebugPrint_FuncName_OUT("LineEffect_Substitute");
}

//LineEffect�i�A�������j
function LineEffect_ContinuationEffect(MultiCount,MultiStageCount,cAction)
{
	//DebugPrint_FuncName_IN("LineEffect_ContinuationEffect");
	local TargetNum		= GetTargetNum_(MultiCount)
	local DamageType	= GetDamageType_(MultiCount,0)
	local EffectFrame	= cAction.EffectFrame;
	local DamageWait	= cAction.EffectFrame_DamageDirectionWait;
	local StateWait		= 0;
	local EndWait		= cAction.EffectFrame_EndWait;
	local MaxCount		= GetActionNum_()
	
	//���Z�G�t�F�N�g�̕\���E���Z�r�d�̍Đ�
	LineEffect_EffectBornDirection(MultiCount,MultiStageCount,cAction);
	
	//����̍ő�A�������擾
	local MaxActHitNum = GetMaxActHitNum(MultiCount)
	
	for(MultiStageCount ; MultiStageCount < MaxActHitNum ; MultiStageCount++){
		for(local IndexCount = 0; IndexCount < TargetNum ; IndexCount++){
			local ActHitNum = GetActHitNum_(MultiCount, IndexCount);
			if(MultiStageCount < ActHitNum){
				local Target = GetTargetIndex_(MultiCount,IndexCount)
				if(Target != INVALID_CHARACTER){
					local SEFlag = true;
					local MotionFlag = true;
					SetDamageEffectSE(IndexCount,SEFlag,MotionFlag,MultiCount,MultiStageCount,false,cAction);
				}
			}
		}
		if(MaxActHitNum > 1){
			Wait_(15)
		}
	}
	
	//��O���o�\��
	SetDamageEffect_ExceptionEffect(MultiCount,cAction)
	
	//�X�e�[�^�X�����܂ł̑҂��ݒ�
	local StateFlag = false 
	for(local i = STATUS_TOP ; i < STATUS_NUM ; i++){
		for(local IndexCount = 0 ; IndexCount < TargetNum ; IndexCount++){
			local StateValue = GetStatusValue_(i,MultiCount,IndexCount)
			if(StateValue >0 ){
				StateWait = gStateData[i].Up_Wait;
			} else if(StateValue < 0 ){
				StateWait = gStateData[i].Down_Wait;
			}
		}
	}
	
	//�X�e�[�^�X�ω�����
	local WaitFrame = 0;
	for(local IndexCount = 0 ; IndexCount < TargetNum ; IndexCount++){
		local WaitValue = SetStateEffect_ContinuationEffect(IndexCount ,MultiCount,cAction)
		if(WaitValue != 0){WaitFrame = WaitValue;}
	}
	
	if(WaitFrame != 0 && MultiCount == MaxCount -1){Wait_(WaitFrame);}
	
	//DebugPrint_FuncName_OUT("LineEffect_ContinuationEffect");
}

//���Z�G�t�F�N�g�̕\���E���Z�r�d�̍Đ�
function LineEffect_EffectBornDirection(MultiCount,MultiStageCount,cAction)	
{
	//DebugPrint_FuncName_IN("LineEffect_EffectBornDirection");
	//Attack�F�������g���������X�^�[
	//DebugPrint("	=>	MultiCount			:	" + MultiCount);
	//DebugPrint("	=>	MultiStageCount		:	" + MultiStageCount);
	//�K�v�ƂȂ�N���X�̓Ǎ�
	local cParty = cFullPartyInfo(cAction.Target[0]);
	
	//��O�I�ɉ�]���K�v�ȏ����p
	local AllyFlag = IsAlly_(GetTargetIndex_(MultiCount,0,0))
	local RotateY = 0;
	if(AllyFlag == true){
		RotateY = 3.14;
	} else {
		RotateY = 0;
	}
	
	//�P�̃G�t�F�N�g�̓\��t��
	for(local i = 0 ; i <  cAction.TargetNum ; i++){
		local SingleActEffect0 = MonsterSizeEffect(cAction.Target[i],cAction.SingleActEffect0_Name);
		local SingleActEffect1 = MonsterSizeEffect(cAction.Target[i],cAction.SingleActEffect1_Name);
		if(cAction.SingleActEffect0_SEFlag != true){
			SetEffectSoundEnable_(SingleActEffect0, false);
		}
		if(cAction.SingleActEffect1_SEFlag != true){
			SetEffectSoundEnable_(SingleActEffect1, false);
		}
	}
	
	//�S�̃G�t�F�N�g�O�̓\��t��
	if(cAction.AllActEffect0_Name != null){
		ChangeIndexPointData_(BATTLE_COMMON_POINT_DATA);
		switch(cAction.AllActEffect0_Name){
		case "EF213_19_GOD_HAND":
			local EffectParam = SetPointWorldEffect_(cAction.AllActEffect0_Name, cParty.EffectEmpty_Area);
			SetEffectFrame_(EffectParam, 76)
			SetEffectScale_(EffectParam, cParty.EffectScale_Area);
			SetEffectRotateY_(EffectParam,RotateY)
			break;
		case "EF213_21_ABYSS_HAND":
			local EffectParam = SetPointWorldEffect_(cAction.AllActEffect0_Name, cParty.EffectEmpty_Area);
			SetEffectFrame_(EffectParam, 51)
			SetEffectScale_(EffectParam, cParty.EffectScale_Area);
			SetEffectRotateY_(EffectParam,RotateY)
			break;
		case "EF213_23_JUDGMENT":
			local EffectParam = SetPointWorldEffect_(cAction.AllActEffect0_Name, cParty.EffectEmpty_Area);
			SetEffectFrame_(EffectParam, 96)
			SetEffectScale_(EffectParam, cParty.EffectScale_Area);
			SetEffectRotateY_(EffectParam,RotateY)
			break;
		case "EF040_14_PROP_HAMETSUNOHI":
			//�j�ł̓��̓J�����G�t�F�N�g�ŕ\������
			SetCameraEffect_("EF040_14_PROP_HAMETSUNOHI" , 300)
			break;
		default:
			local EffectParam = SetPointWorldEffect_(cAction.AllActEffect0_Name, cParty.EffectEmpty_Area);
			SetEffectScale_(EffectParam, cParty.EffectScale_Area);
			if(cAction.AllActEffect0_SEFlag != true){
				SetEffectSoundEnable_(EffectParam, false);
			}
			break;
		}
	}
	//�S�̃G�t�F�N�g�P�̓\��t��
	if(cAction.AllActEffect1_Name != null){
		ChangeIndexPointData_(BATTLE_COMMON_POINT_DATA);
		switch(cAction.AllActEffect1_Name){
		case "EF213_20_GOD_HAND_M":
			local EffectParam = SetPointWorldEffect_(cAction.AllActEffect1_Name, cParty.EffectEmpty_Area);
			SetEffectFrame_(EffectParam, 76)
			SetEffectScale_(EffectParam, cParty.EffectScale_Area);
			SetEffectRotateY_(EffectParam,RotateY)
			break;
		case "EF213_22_ABYSS_HAND_M":
			local EffectParam = SetPointWorldEffect_(cAction.AllActEffect1_Name, cParty.EffectEmpty_Area);
			SetEffectFrame_(EffectParam, 51)
			SetEffectScale_(EffectParam, cParty.EffectScale_Area);
			SetEffectRotateY_(EffectParam,RotateY)
			break;
		case "EF213_24_JUDGMENT_M":
			local EffectParam = SetPointWorldEffect_(cAction.AllActEffect1_Name, cParty.EffectEmpty_Area);
			SetEffectFrame_(EffectParam, 96)
			SetEffectScale_(EffectParam, cParty.EffectScale_Area);
			SetEffectRotateY_(EffectParam,RotateY)
			break;
		default:
			local EffectParam = SetPointWorldEffect_(cAction.AllActEffect1_Name, cParty.EffectEmpty_Area);
			SetEffectScale_(EffectParam, cParty.EffectScale_Area);
			if(cAction.AllActEffect1_SEFlag != true){
				SetEffectSoundEnable_(EffectParam, false);
			}
			break;
		}
	}
	
	//DebugPrint_FuncName_OUT("LineEffect_EffectBornDirection");
}

//���ʂɂ�锽��SE
/*function LineEffect_Kind_DirectionSE(Target,MultiCount,MultiStageCount,cAction)
{
	//DebugPrint_FuncName_IN("LineEffect_Kind_DirectionSE");
	//DebugPrint("	=>	Target				:	" + Target);
	//DebugPrint("	=>	MultiCount			:	" + MultiCount);
	//DebugPrint("	=>	MultiStageCount		:	" + MultiStageCount);
	
	//�N���X�̓Ǎ�
	local cParty = cFullPartyInfo(Target);
	
	if(cAction.Kind == EFFICACY.ATTACK ){
		//�U������SE�Đ�����
		if(cAction.HitTypeSEFlag == true){ReplaySE_(cAction.HitTypeSE);}
	} else if (cAction.Kind == EFFICACY.HEAL ){
		//�񕜎���SE�Đ�����
		if(cAction.HealTypeSEFlag == true){ReplaySE_(cAction.HealTypeSE);}
	} else if (cAction.Kind == EFFICACY.HEAL ){
		//�h������SE�Đ�����
		if(cAction.RevivalTypeSEFlag == true){ReplaySE_(cAction.RevivalTypeSE);}
	} else if (cAction.Kind == EFFICACY.SUPPORT || cAction.Kind == EFFICACY.WEAK){
		//�X�e�[�^�X�ω�����SE�Đ�����
		if(cAction.StatusTypeSEFlag == true){ReplaySE_(cAction.StatusTypeSE);}
	} else {
		//����ȊO��SE
		if(cAction.OtherTypeSEFlag == true){ReplaySE_(cAction.OtherTypeSE);}
	}
	
	if(cAction.DeadFlag == true){
		ReplaySE_(cAction.DeadSE)
	}
	
	//DebugPrint_FuncName_OUT("LineEffect_Kind_DirectionSE");
}*/

//���ʉ��o�E��O���b�Z�[�W�\��
function LineEffect_ExpentionMessage(MultiCount)
{
	//�������킯
	if(IsPasser_(MultiCount)){
		AddBattleFeatMessage_(52);
	}
	
	//�M�����u���{�f�B
	
	//
	
}

//�G�t�F�N�g�̃X�P�[���ύX=====================================================================
//�����X�^�[�T�C�Y���ƂɃA�^�b�`����G�t�F�N�g�̑傫����Ή�������i�ėp�j
//		Monster		:	�����X�^�[�̃C���f�b�N�X�ԍ�
//		EffectName	:	�G�t�F�N�g��
function MonsterSizeEffect(Monster,EffectName)
{
	//DebugPrint_FuncName_IN("MonsterSizeEffect");
	//DebugPrint("	=>	Monster				:	" + Monster);
	//DebugPrint("	=>	EffectName			:	" + EffectName);
	
	local EffectParam = null;
	
	if(EffectName != null){
		//�N���X�̓Ǎ�
		local cMonster		= cMonsterInfo(Monster)
		local EffectSize	= cMonster.EffectSize;
		EffectParam = SetBoneEffect_(EffectName, Monster);
		
		//��O�����p
		/*switch(cMonster.Size)
		{
		case SIZE_S:
		case SIZE_N:
		case SIZE_M:
		case SIZE_G:
		case SIZE_T:
			break;
		default:
			switch(EffectName)
			{
			case "":
				//EffectSize = 0
				break;
			default:
				break;
			}
			break;
		}*/
		
		SetEffectScale_(EffectParam, cMonster.EffectSize);
		
	}
	
	//DebugPrint_FuncName_OUT("MonsterSizeEffect");
	
	//�߂�l�ŃG�t�F�N�g�̃^�X�N�ԍ���Ԃ�
	return EffectParam;
}

//�G�t�F�N�g�p�����[�^�̃X�P�[���ݒ�𗘗p����ꍇ
function EffParamSizeEffect(Monster,EffectName)
{
	//DebugPrint_FuncName_IN("EffParamSizeEffect");
	//local ArgList =	["Monster"		,	Monster
	//					,"EffectName"	,	EffectName
	//					]
	//DebugPrint_functionParam("EffParamSizeEffect" , ArgList )
	
	local EffectParam = null;
	
	//�N���X�̓Ǎ�
	if(EffectName != null){
		EffectParam = SetBoneEffect_(EffectName, Monster);
	}
	
	//DebugPrint_FuncName_OUT("EffParamSizeEffect");
	return EffectParam;
}

//�G�t�F�N�g�p�����[�^�̃X�P�[���ݒ�𗘗p����ꍇ�iSE�����Łj
function EffParamSizeEffect_NoSE(Monster,EffectName)
{
	//DebugPrint_FuncName_IN("EffParamSizeEffect_NoSE");
	//DebugPrint("	=>	Monster				:	" + Monster);
	//DebugPrint("	=>	EffectName			:	" + EffectName);
	
	
	local EffectParam = null;
	
	//�N���X�̓Ǎ�
	if(EffectName != null){
		EffectParam = SetBoneEffect_(EffectName, Monster);
	}
	
	SetEffectSoundEnable_(EffectParam,false);
	//DebugPrint_FuncName_OUT("EffParamSizeEffect_NoSE");
	
	return EffectParam;
}

//�T�C�Y���Ǘ�����ꍇ�i�}�[�^�n�p�j
function MonsterNonSizeEffect(Monster,EffectName)
{
	//DebugPrint_FuncName_IN("MonsterNonSizeEffect");
	//DebugPrint("	=>	Monster				:	" + Monster);
	//DebugPrint("	=>	EffectName			:	" + EffectName);
	
	//�N���X�̓Ǎ�
	
	local EffectParam = null;
	
	if(EffectName != null){
		local cMonster = cMonsterInfo(Monster)
		EffectParam = SetBoneEffect_(EffectName, Monster);
		if(cMonster.Size == SIZE_T){
			//SetEffectScale_(EffectParam, 2.4);
		} else {
			//SetEffectScale_(EffectParam, 1.0);
		}
	}
	
	//DebugPrint_FuncName_OUT("MonsterNonSizeEffect");
}

//�A�����ʂɂ�锽��==========================================================================
//�A���s�����̌��ʂɂ����ʂɂ��ҋ@
//	Target			: ���������郂���X�^�[
//	MultiCount		: ���ڂ̋Z��
//	MultiStageCount	: ���i�ڂ̍U�����H
function LineEffect_Kind_DirectionWaitMulti(Target,MultiCount,MultiStageCount,cAction)
{
	//DebugPrint_FuncName_IN("LineEffect_Kind_DirectionWaitMulti");
	//DebugPrint("	=>	Target				:	" + Target);
	//DebugPrint("	=>	MultiCount			:	" + MultiCount);
	//DebugPrint("	=>	MultiStageCount		:	" + MultiStageCount);

	local Kind = GetActionEfficacy_(MultiCount);
	local Attack = GetActorIndex_(MultiCount);
	local Target = GetTargetIndex_(MultiCount,0);
	
	if (Kind == EFFICACY.ATTACK){
		//�_���[�W���o�̏ꍇ
		Wait_(cAction.EffectFrame/3);
		local TargetNum = GetTargetNum_(0);
		if(TargetNum >= 1){
			Target = GetTargetIndex_(MultiCount,0);
			SetMotion_(Target, MOT_WAIT, 4);
		} else {}
		if(TargetNum >= 2){
			Target = GetTargetIndex_(MultiCount,0);
			SetMotion_(Target, MOT_WAIT, 4);
		} else {}
		if(TargetNum >= 3){
			Target = GetTargetIndex_(MultiCount,0);
			SetMotion_(Target, MOT_WAIT, 4);
		} else {}
		if(TargetNum >= 4){
			Target = GetTargetIndex_(MultiCount,0);
			SetMotion_(Target, MOT_WAIT, 4);
		} else {}
		//Wait_(cAction.EffectFrame/3);
	} else if (Kind == EFFICACY.HEAL) {
		//�񕜂̏ꍇ
		Wait_(10);
	} else if (Kind == EFFICACY.HEAL) {
		//�h���̏ꍇ
		Wait_(10);
	} else if (Kind == EFFICACY.OTHER) {
		//����ȊO�̏ꍇ��Wait�͍s��Ȃ��B
	}
	//DebugPrint_FuncName_OUT("LineEffect_Kind_DirectionWaitMulti");
}


//�A���������o�i�����Ȃ�n�Ή��E�P�̂ŕ��������ɂ͌����Ή��j
function ContinuationEffect(cActionList)
{
	//DebugPrint_FuncName_IN("ContinuationEffect");
	SetVisibleNeedModel_();
	ChangeIndexPointData_(BATTLE_COMMON_POINT_DATA);
	
	//���[�J���֐��̒�`
	local MultiCount = 0;
	local MultiStageCount = 0;
	local Actor = GetActorIndex_(MultiCount);
	local Target = GetTargetIndex_(MultiCount , 0);
	local ActionNum = GetActionNum_();
	
	
	//�s���҂ƑΏێ҂��Ⴄ�ꍇ�͑Ώێ҃J�b�g��\������B
	if(Actor =! Target && ActionNum == 1){
		local CharaStand_Select = "ActorFull";	//�܂��s���ґ���\��
		local CameraFlag = true;				//�J�����𐶐�����
		local NameVisibleFlag = true
		StartCombo_(MultiCount);
		ShowActionMessage(MultiCount,NameVisibleFlag)
		CharaStand(CharaStand_Select , CameraFlag , MultiCount,cActionList[MultiCount]);

		local Attack = GetActorIndex_(MultiCount)
		SetMotion_(Attack, MOT_WAIT, 4);
		Wait_(45);

		local CharaStand_Select = "ActorFull";
		local CameraFlag = true;
		CharaStand(CharaStand_Select , CameraFlag , MultiCount,cActionList[MultiCount]);
	} else {
		//�s�����̕\��
		StartCombo_(MultiCount);
		for(local i = 0 ; i < ActionNum ; i++){
			Actor = GetActorIndex_(i)
			ShowActionMessage_IconAnimation(i,Actor)
		}
		local CharaStand_Select = "ActorFull";
		local CameraFlag = true;
		CharaStand(CharaStand_Select , CameraFlag , MultiCount,cActionList[MultiCount]);
		Wait_(15);
	}
	
	//�s���񐔕������G�t�F�N�g�̃��[�v
	for(MultiCount ; MultiCount < ActionNum ; MultiCount += 1){	
		local TargetNum = GetTargetNum_(MultiCount);
		local SingleFlag = IsTargetSingle_(MultiCount);
		for( local y = 0 ; y < TargetNum ; y += 1){	
			LineEffect_ContinuationEffect(MultiCount,MultiStageCount,cActionList[MultiCount])
		}
	}
	
	SetApealPoint_Init(true);
	
	//DebugPrint_FuncName_OUT("ContinuationEffect");
}


//�A�����@�p�̉��o
function ContinuationMagic(MultiCount,MultiStageCount)
{
	//DebugPrint_FuncName_IN("ContinuationMagic");
	//DebugPrint("	=>	MultiCount			:	" + MultiCount);
	//DebugPrint("	=>	MultiStageCount		:	" + MultiStageCount);
	SetVisibleNeedModel_();
	ChangeIndexPointData_(BATTLE_COMMON_POINT_DATA);
	
	//�G�t�F�N�g�̃��[�h�i�����̗p�j
	LoadEffect();
		
	//�L�����𐳖ʔz�u
	
	//�U�����̃����X�^�[���
	local ActionIndex = [];
	local TargetIndex = [];
	local MultiTargetIndex = [];
	local TargetNum = GetTargetNum_(0);
	local ActionNum = GetActionNum_();
	for(local x = 0 ; x < ActionNum ; x++){
		ActionIndex.append(GetActorIndex_(x))
		TargetNum = GetTargetNum_(x);
		TargetIndex = null;
		TargetIndex = [];	//�z��̏�����
		for(local y = 0 ; y < TargetNum ; y++){
			TargetIndex.append(GetTargetIndex_(x, y))
		}
		MultiTargetIndex.append(TargetIndex);
	}
	
	//TargetNum�őΏۃL���������擾
	//�������炻�̎������P�̑Ώۂ��A�S�̑Ώۂ��𔻒肷��
	local TargetSingle = IsTargetSingle_(0);

	//�L�����̐��ʔz�u
	local CharaStand_Select = "Target"	//�Ώۂ̕\��
	local CameraFlag		= true		//�J������z�u
	local cAction = cActionInfo(MultiCount);
	local NameVisibleFlag = false;
	CharaStand(CharaStand_Select,CameraFlag,MultiCount,cAction);
	
	for(MultiCount ; MultiCount < ActionNum ; MultiCount++){
		//�N���X�̃��[�h
		if(MultiCount != 0){
			cAction = cActionInfo(MultiCount);
		}
		//Debug_cActionPrint(cAction)
		ShowActionMessage(MultiCount,NameVisibleFlag)
		
		local CharaStandFlag = false;	//�L�����𗧂����Ȃ�
		local WaitFlag = true			//Wait�͓����
		local MultiStageCount = 0
		LineEffect_Init(CharaStandFlag , MultiCount , MultiStageCount , WaitFlag , cAction)
	}

	//DebugPrint_FuncName_OUT("ContinuationMagic");
}

//�A�����@�̃_���[�W�p
function ContinuationMagicTarget(MultiCount,MultiStageCount,cAction)
{
	//DebugPrint_FuncName_IN("ContinuationMagicTarget");
	//DebugPrint("	=>	MultiCount			:	" + MultiCount);
	//DebugPrint("	=>	MultiStageCount		:	" + MultiStageCount);
	// MultiCount	: ���ڂ̋Z���H
	local Attack = GetActorIndex_(MultiCount);
	local TargetNum = GetTargetNum_(MultiCount);
	local Target;
	local SEFlag = false;
	local MotionFlag = true;
	
	for(local IndexCount = 0 ; IndexCount < TargetNum ; IndexCount += 1){
		if(IndexCount == 0){
			SEFlag = true;
			SetDamageEffectSE(IndexCount,SEFlag,MotionFlag,MultiCount,MultiStageCount,false,cAction);
		} else { 
			SEFlag = false;
			SetDamageEffectSE(IndexCount,SEFlag,MotionFlag,MultiCount,MultiStageCount,false,cAction);
		}
	}
	//DebugPrint_FuncName_OUT("ContinuationMagicTarget");

}

//�ʏ�U���E�P�̓��Z�E�s���L����������o���ăY�[��
function StandbyCut_Assault(MultiCount,cAction)
{
	//DebugPrint_FuncName_IN("StandbyCut_Assault");
	
	//�퓬���o��O����
	local SingleAttackFlag = true
	Exception_1stCheck(MultiCount,SingleAttackFlag,cAction)
	
	ChangeIndexPointData_(BATTLE_COMMON_POINT_DATA);
	local NameVisibleFlag = true;
	ShowActionMessage(MultiCount , NameVisibleFlag)

	local Actor = GetActorIndex_(MultiCount);
	local cActor = cMonsterInfo(Actor);
	local AllyFlag = IsAlly_(Actor);
	
	
	//�L�����̐���
	StandbyCut_LineSort(true);
	
	//��O����
	local SingleAttackFlag = true;
	Exception_1stCheck(MultiCount,SingleAttackFlag,cAction)
	
	if(IsScout_()){
		if(IsScoutFirstAttack_()){
			PlaySE_("SE_BTL_014");
		}
	}
	
	//�����i�[�̑I�o
	local cParty;
	local CameraTask;
	if(AllyFlag == true){
		cParty = cFullPartyInfo(Actor);
		ReplaySE_("SE_BTL_001")
	} else {
		cParty = cFullPartyInfo(Actor);
		ReplaySE_("SE_BTL_004")
	}
	for(local i = 0 ; i < cParty.PartyNum ; i++){
		if(Actor == cParty.Index[i]){
			Task_AnimeMoveCharNoDir_(cParty.Index[i] , cParty.StandbyCutRunner[i]);
			CameraTask = Task_AnimeMoveCamera_(cParty.StandbyCutCam[i] , cParty.StandbyCutCamTgt[i]);
			//DebugPrint("i	: " + i + "\n")
			//DebugPrint("cParty.Index[i]	: " + cParty.Index[i] + "\n")
			//DebugPrint("cParty.StandbyCutRunner[i]	: " + cParty.StandbyCutRunner[i] + "\n")
			//DebugPrint("cParty.StandbyCutCam[i]		: " + cParty.StandbyCutCam[i] + "\n")
			//DebugPrint("cParty.StandbyCutCamTgt[i]	: " + cParty.StandbyCutCamTgt[i] + "\n")
			SetMotion_(Actor, MOT_MOVE_LOOP, 4);
		}
	}
	Wait_(10);
	
	//DebugPrint_FuncName_OUT("StandbyCut_Assault");
	
}

//�����X�^�[���ݔ���p
function GetMonsterState(Index)
{
	//DebugPrint_FuncName_IN("GetMonsterState");
	//DebugPrint("	=>	Index		:	" + Index);
	local Monster;
	local MonsterType = GetInitExistType_(Index);
	if(MonsterType == LIVETYPE.ACTIVE || MonsterType == LIVETYPE.INACTIVE){
		Monster = Index;
	} else {
		Monster = INVALID_CHARACTER;
	}
	//DebugPrint("Return");
	//DebugPrint("	=>	Monster	:	" + Monster);
	//DebugPrint_FuncName_OUT("GetMonsterState");
	return Monster;
}

//�S�̓��Z�E�����p�E�S�̂���r���L�����ɃY�[��
function StandbyCut_Magic(MultiCount,cAction)
{
	//DebugPrint_FuncName_IN("StandbyCut_Magic");
	ChangeIndexPointData_(BATTLE_COMMON_POINT_DATA);
	
	//�퓬���o��O����
	local SingleAttackFlag = false;
	Exception_1stCheck(MultiCount,SingleAttackFlag,cAction)
	
	local NameVisibleFlag = true
	ShowActionMessage(MultiCount,NameVisibleFlag);
		
	local ActionMonster = GetActorIndex_(0);
	local AllyFlag = IsAlly_(ActionMonster);
		
	local AllyIndex		= GetAllyIndex_(0);
	local EnemyIndex	= GetEnemyIndex_(0);
	
	local cParty;
	//�����X�^�[�̔z�u
	//StandbyCut_LineSort(false);
	CharaStand_ActorFull(false);
	
	//�X�J�E�g�pSE�̍Đ�
	if(IsScout_()){
		if(IsScoutFirstAttack_()){
			PlaySE_("SE_BTL_014");
		}
	}
	
	//�Y�[������J�����̎w��
	if(AllyFlag == true){
		cParty = cFullPartyInfo(AllyIndex)
	} else {
		cParty = cFullPartyInfo(EnemyIndex)
	}
	
	for(local i = 0 ; i<cParty.PartyNum ; i++){
		if(ActionMonster == cParty.Index[i]){
			ChangeIndexPointData_(BATTLE_COMMON_POINT_DATA);
			Task_AnimeMoveCamera_(cParty.UpCam[i],cParty.UpCamTgt[i]);
		}
	}
	
	Wait_(10);
	
	//DebugPrint_FuncName_OUT("StandbyCut_Magic");
}

//�X�^���o�C�J�b�g�p�E���񏈗�
// RunnningFlag			: �����X�^�[�𑖂点�邩�H
function StandbyCut_LineSort(RunningFlag)
{
	//DebugPrint_FuncName_IN("StanbyCut_LineSort");
	
	ChangeIndexPointData_(BATTLE_COMMON_POINT_DATA);
	
	return;
	
	local cAllyParty	= cFullPartyInfo(GetAllyIndex_(0))
	local cEnemyParty	= cFullPartyInfo(GetEnemyIndex_(0))
	
	StandbyCut_LineSort_PartySet(cAllyParty)
	StandbyCut_LineSort_PartySet(cEnemyParty)
	
	//DebugPrint_FuncName_OUT("StanbyCut_LineSort");
}

//�X�^���o�C�J�b�g�p�p�[�e�B�z�u
//cParty		: �z�u����p�[�e�B�ݒ�
function StandbyCut_LineSort_PartySet(cParty)
{
	
	for(local i = 0 ; i < cParty.PartyNum ; i++){
		if(cParty.Type[i] != LIVETYPE.NONE){
			//�����X�^�[�̔z�u
			Task_AnimeMoveCharNoDir_(cParty.Index[i] , cParty.Empty[i]);
			SetDir_(cParty.Index[i],cParty.Rotate[i]);
			if(cParty.Type[i] == LIVETYPE.ACTIVE)
				SetVisible_(cParty.Index[i] , true);
			} else {
				SetVisible_(cParty.Index[i] , false);
		}
	}
	
	Task_AnimeMoveCharNoDir_(cParty.MasterIndex , cParty.Empty_Master);
	SetDir_(cParty.MasterIndex , cParty.Rotate_Master)
	
}


//�p�[�e�B�����擾
function Get_PartyType(AllyFlag)
{
	//DebugPrint_FuncName_IN("Get_PartyType");
	
	local Monster = [];			//Index��z��ŊǗ�
	local PartyNum = 0;			//�����X�^�[��
	local Size = [];			//�����X�^�[�̃T�C�Y
	local Type = [];			//�����X�^�[�̐�����Ԕ���
	local SFlag = false;		//�r�T�C�Y�����邩����
	local MFlag = false;		//�l�T�C�Y�����邩����
	local GFlag = false;		//�f�T�C�Y�����邩����
	local TFlag = false;		//�s�T�C�Y�����邩����
	local PartyType;			//�p�[�e�B�\��
	
	for(local i = 0 ; i < 4 ; i++){
		if(AllyFlag == true){
			Monster.append(GetAllyIndex_(i));
		} else {
			Monster.append(GetEnemyIndex_(i));
		}
		if(Monster[i] != INVALID_CHARACTER){
			Type.append(GetInitExistType_(Monster[i]));
			if(Type[i] != LIVETYPE.NONE){
				PartyNum += 1;
				Size.append(GetMonsterSize_(Monster[i]));
				if(Size[i] == SIZE_S){SFlag = true;}
				if(Size[i] == SIZE_M){MFlag = true;}
				if(Size[i] == SIZE_G){GFlag = true;}
				if(Size[i] == SIZE_T){TFlag = true;}
			}
		}
	}
	
	if(PartyNum == 4){
		PartyType = PARTYTYPE.S4;		//S4
	} else if(PartyNum == 3){
		PartyType = PARTYTYPE.S3;		//S3
	} else if(PartyNum == 2 && GFlag == false){
		PartyType = PARTYTYPE.S2;		//S2
	} else if(PartyNum == 1 && GFlag == false && TFlag == false){
		PartyType = PARTYTYPE.S1;		//S1
	} else if(PartyNum == 2 && GFlag == true){
		if(Size[0] != SIZE_G){
			PartyType = PARTYTYPE.SG;	//SG
		} else {
			PartyType = PARTYTYPE.GS;	//GS
		}
	} else if(PartyNum == 1 && GFlag == true && TFlag == false){
		PartyType = PARTYTYPE.G1;		//G1
	} else if(PartyNum == 1 && GFlag == false && TFlag == true){
		PartyType = PARTYTYPE.T1;		//T1
	} else {
		//DebugPrint("Error : " + "BattleCommon_function_" + "Get_PartyType" + "\n");
		//DebugPrint("PartyNum	: " + PartyNum + "\n");
		//DebugPrint("SFlag		: " + SFlag + "\n");
		//DebugPrint("MFlag		: " + MFlag + "\n");
		//DebugPrint("GFlag		: " + GFlag + "\n");
		//DebugPrint("TFlag		: " + TFlag + "\n");
		ScriptStop()
	}
	
	//DebugPrint_FuncName_OUT("Get_PartyType");
	//DebugPrint("	<=	PartyType	:	" + PartyType);
	return PartyType;

}

//�����œn���������X�^�[�C���f�b�N�X�ō\������p�[�e�B�����擾
function Get_SelectionPartyType(Monster0,Monster1,Monster2,Monster3)
{
	//DebugPrint_FuncName_IN("Get_SelectionPartyType");	
	//DebugPrint("	=>	Monster0		:	" + Monster0);
	//DebugPrint("	=>	Monster1		:	" + Monster1);
	//DebugPrint("	=>	Monster2		:	" + Monster2);
	//DebugPrint("	=>	Monster3		:	" + Monster3);
	
	local Monster= []			//�����X�^�[�C���f�b�N�X
	Monster = [Monster0 , Monster1 , Monster2 , Monster3]
	local PartyNum = 0;			//�����X�^�[��
	local Size = [];			//�����X�^�[�̃T�C�Y
	local Type = [];			//�����X�^�[�̐�����Ԕ���
	local SFlag = false;		//�r�T�C�Y�����邩����
	local NFlag = false;		//�r�T�C�Y�����邩����
	local MFlag = false;		//�l�T�C�Y�����邩����
	local GFlag = false;		//�f�T�C�Y�����邩����
	local TFlag = false;		//�s�T�C�Y�����邩����
	local PartyType;			//�p�[�e�B�\��
	
	for (local i = 0 ; i < 4 ; i++){
		if(Monster[i] != INVALID_CHARACTER){
			Type.append(GetInitExistType_(Monster[i]));
			if(Type[i] != LIVETYPE.NONE){
				PartyNum += 1;
				Size.append(GetMonsterSize_(Monster[i]));
				if(Size[i] == SIZE_S){SFlag = true;}
				if(Size[i] == SIZE_N){NFlag = true;}
				if(Size[i] == SIZE_M){MFlag = true;}
				if(Size[i] == SIZE_G){GFlag = true;}
				if(Size[i] == SIZE_T){TFlag = true;}
			}
		}
	}
		
	if(PartyNum == 4){
		PartyType = PARTYTYPE.S4;		//S4
	} else if(PartyNum == 3){
		PartyType = PARTYTYPE.S3;		//S3
	} else if(PartyNum == 2 && GFlag == false){
		PartyType = PARTYTYPE.S2;		//S2
	} else if(PartyNum == 1 && GFlag == false && TFlag == false){
		PartyType = PARTYTYPE.S1;		//S1
	} else if(PartyNum == 2 && GFlag == true){
		if(Size[0] != SIZE_G){
			PartyType = PARTYTYPE.SG;	//SG
		} else {
			PartyType = PARTYTYPE.GS;	//GS
		}
	} else if(PartyNum == 1 && GFlag == true && TFlag == false){
		PartyType = PARTYTYPE.G1;		//G1
	} else if(PartyNum == 1 && GFlag == false && TFlag == true){
		PartyType = PARTYTYPE.T1;		//T1
	} else {
		//DebugPrint("Error : " + "BattleCommon_function_" + "Get_SelectionPartyType" + "\n");
		//DebugPrint("PartyNum	: " + PartyNum + "\n");
		//DebugPrint("SFlag		: " + SFlag + "\n");
		//DebugPrint("MFlag		: " + MFlag + "\n");
		//DebugPrint("GFlag		: " + GFlag + "\n");
		//DebugPrint("TFlag		: " + TFlag + "\n");
		ScriptStop()
	}
	
	
	//DebugPrint_FuncName_OUT("Get_SelectionPartyType");
	//DebugPrint("	<=	PartyType	:	" + PartyType);
	return PartyType;
}

//�p�[�e�B�̐l�����擾
function Get_PartyNum(AllyFlag)
{
	//DebugPrint_FuncName_IN("Get_PartyNum");
	local Index = []
	local PartyNum = 0;
	for(local i = 0 ; i < 4 ; i++){
		if(AllyFlag == true){
			Index.append(GetAllyIndex_(i));
		} else {
			Index.append(GetEnemyIndex_(i));
		}
		if(GetInitExistType_(Index[i]) != LIVETYPE.NONE){
			PartyNum += 1
		}
	}
	
	//DebugPrint_FuncName_OUT("Get_PartyNum");
	//DebugPrint("	<=	PartyNum	:	" + PartyNum)
	return PartyNum;
}

//�G�L�X�g���p�̃����X�^�[�C���f�b�N�X�̎擾
function GetExtra(index, num)
{
	//DebugPrint_FuncName_IN("GetExtra");
	//DebugPrint("	=>	index		:	" + index);
	//DebugPrint("	=>	num			:	" + num);
	local isAlly = IsAlly_(index);
	
	local count = 0;
	
	for(local i = 0; i < 4; i++){
		local search;
		if(isAlly){
			search = GetAllyIndex_(i);
		} else {
			search = GetEnemyIndex_(i);
		}
		if(index != search){
			if(count == num){
				local TypeCheck = GetInitExistType_(search)
				if(TypeCheck != LIVETYPE.ACTIVE){
					search = INVALID_CHARACTER;
				} else {}
				//DebugPrint_FuncName_OUT("GetExtra");
				//DebugPrint("	<= Search	: " + search);
				return search;
			}
			count++;
		}
	}
	//DebugPrint_FuncName_OUT("GetExtra");
}

//�G�L�X�g���p�̃����X�^�[��Visible�̐ݒ�擾
function SetExtraVisible(index)
{
	//DebugPrint_FuncName_IN("SetExtraVisible");
	for(local i = 0;i < 3;i++){
		local extra = GetExtra(index, i);
		if(extra != INVALID_CHARACTER){
			SetVisible_(extra, false);
		}
	}
	//DebugPrint_FuncName_OUT("SetExtraVisible");
}

//�����U���p��e����
//Target				����		: ���o�Ώ�
//DeleteTaskFlag		TorF		: Miss��Reflect���ɂ�Task���������H
//TargetKnockBackTask	Task		: ��e�����X�^�[��MotionTask
//MultiCount			����		: ������s���p
//Vec3					���W		: �G�t�F�N�g���t�B�[���h�ݒu����ۂ�Empty���W
//PierceFlag						: �ђʉ��o����
//cAction				�N���X		: cActionInfo
function SetDamageMotion(Target,DeleteTaskFlag,TargetKnockBackTask,MultiCount,Vec3,PierceFlag,cAction)
{
	local MotionTask;
	//�X�J�E�g�A�^�b�N���͔����؂�ւ���B
	if(IsScout_()){
		MotionTask = SetDamageMotion_ScoutAttack(MultiCount);
	} else {
		MotionTask = SetDamageMotion_NormalDamage(Target,DeleteTaskFlag,TargetKnockBackTask,MultiCount,Vec3,PierceFlag,cAction)
	}
	
	return MotionTask;
}

// �����U���p��e����
function SetDamageMotion_NormalDamage(Target,DeleteTaskFlag,TargetKnockBackTask,MultiCount,Vec3,PierceFlag,cAction)
{
	
	//DebugPrint_FuncName_IN("SetDamageMotion_NormalDamage");
	//DebugPrint("	=>	Target					:	" + Target);
	//DebugPrint("	=>	DeleteTaskFlag			:	" + DeleteTaskFlag);
	//DebugPrint("	=>	TargetKnockBackTask		:	" + TargetKnockBackTask);
	//DebugPrint("	=>	MultiCount				:	" + MultiCount);
	//DebugPrint("	=>	Vec3	_x				:	" + Vec3.x);
	//DebugPrint("	=>		_y					:	" + Vec3.y);
	//DebugPrint("	=>		_z					:	" + Vec3.z);
	//DebugPrint("	=>	PierceFlag				:	" + PierceFlag);
	
	local IndexCount	= 0
	local Attack		= GetActorIndex_(MultiCount);
	local Effect		= GetSingleEffectName_(MultiCount,0);
	local ActHitNum		= GetActHitNum_(MultiCount,IndexCount)
	local SEFlag		= true;
	local MotionFlag	= true;
	local MotionTask	= null
	
	if(PierceFlag == true){
		//�ђʉ��o���菈��
		MotionFlag	= false;
	}
	
	//�ђʉ��o���͓��Z�G�t�F�N�g���_���[�W���ɕ\�����Ȃ�
	if(cAction.SingleActEffect0_Name != null && PierceFlag == false){
		MonsterSizeEffect(Target, cAction.SingleActEffect0_Name);
	}
	if(cAction.SingleActEffect1_Name != null && PierceFlag == false){
		MonsterSizeEffect(Target, cAction.SingleActEffect1_Name);
	}
	
	//�_���[�W�\��
	for(local MultiStageCount = 0 ; MultiStageCount < ActHitNum ; MultiStageCount++){
		local IsMiss	= IsMiss_(MultiCount,IndexCount,MultiStageCount)
		local IsReflect	= IsReflect_(MultiCount,IndexCount)
		if(IsMiss == true){
			//�~�X�̏ꍇ
			if(DeleteTaskFlag == true){
				if(MultiStageCount == 0){
					DeleteTask_(TargetKnockBackTask);
				}
			}
			MotionTask = SetDamageEffectSE(IndexCount,SEFlag,MotionFlag,MultiCount,MultiStageCount,PierceFlag,cAction);
		} else if(IsReflect == true){
			//���˂̏ꍇ
			if(DeleteTaskFlag == true){
				if(MultiStageCount == 0){
					DeleteTask_(TargetKnockBackTask);
				}
			}
			MotionTask = SetDamageEffectSE(IndexCount,SEFlag,MotionFlag,MultiCount,MultiStageCount,PierceFlag,cAction);
		} else {
			MotionTask = SetDamageEffectSE(IndexCount,SEFlag,MotionFlag,MultiCount,MultiStageCount,PierceFlag,cAction);
		}
		if(ActHitNum > 1 && MultiStageCount != ActHitNum){
			//���̃|�b�v�\���܂ł̑ҋ@
			Wait_(15);
		}
	}
	
	if(cAction.ActEffectFlag == true){
		Wait_(cAction.EffectFrame_DamageDirectionWait)
	}
	
	local CameraFlag = false;
	//�J�����؂�ւ����K�v�ȏꍇ�̓J������؂�ւ���
	for(local y = STATUS_TOP ; y < STATUS_NUM ; y += 1){
		local StateFlag = GetStatusFlag_(y,MultiCount,IndexCount)
		local StateValue = GetStatusValue_(y,MultiCount,IndexCount)
		local Target = GetTargetIndex_(MultiCount,IndexCount)
		local NowStateValue = GetMonsterStatusValue_(y,Target)
		//�X�e�[�^�X�ω����������ꍇ
		if(StateFlag == true && StateValue != 0){
			if(StateValue > 0){
				if(IsStatusUpCameraChange(y) == true){
					CameraFlag = true;
					DeleteSceneOffset_();
					DeleteAllEffect_();
					CharaStand_Target(CameraFlag,MultiCount);
					Wait_(1);
				}
			} else if(StateValue < 0){
				if(IsStatusDownCameraChange(y) == true){
					CameraFlag = true;
					DeleteSceneOffset_();
					DeleteAllEffect_();
					CharaStand_Target(CameraFlag,MultiCount);
					Wait_(1);
				}
			}
		}
	}
	
	local ReturnParam	= SetAttackStateEffect_Init(IndexCount,MultiCount,cAction)
	local WaitFrame		= ReturnParam[0]
	local MotionTask	= ReturnParam[1]
	
	if(WaitFrame != 0){
		if(CameraFlag = true){
			Wait_(WaitFrame);
		} else {
			Wait_(WaitFrame/2);
		}
	}
	
	//��O����
	SetDamageMotionEffect_ExceptionEffect(MultiCount,cAction)
	
	return MotionTask;
	
	//DebugPrint_FuncName_OUT("SetDamageMotion_NormalDamage");
}

// �����U���p��e����
/*
function SetDamagePierceMotion_NormalDamage(Target,DeleteTaskFlag,TargetKnockBackTask,MultiCount,Vec3,cAction)
{
	
	//DebugPrint_FuncName_IN("SetDamageMotion");
	//DebugPrint("	=>	Target					:	" + Target);
	//DebugPrint("	=>	DeleteTaskFlag			:	" + DeleteTaskFlag);
	//DebugPrint("	=>	TargetKnockBackTask		:	" + TargetKnockBackTask);
	//DebugPrint("	=>	MultiCount				:	" + MultiCount);
	//DebugPrint("	=>	Vec3	_x				:	" + Vec3.x);
	//DebugPrint("	=>		_y					:	" + Vec3.y);
	//DebugPrint("	=>		_z					:	" + Vec3.z);
	//DebugPrint("BattleCommon_LoadParamIN_function_" + "SetDamageMotion");
	local IndexCount	= 0
	local Attack		= GetActorIndex_(MultiCount);
	local Effect		= GetSingleEffectName_(MultiCount,0);
	local ActHitNum		= GetActHitNum_(MultiCount,IndexCount)
	local SEFlag		= false;
	local MotionFlag	= false;
	
	//�ϐ��A�g�\��
	SetTolerChainRate_(MultiCount)
	
	//�_���[�W�\��
	for(local MultiStageCount = 0 ; MultiStageCount < ActHitNum ; MultiStageCount++){
		local IsMiss	= IsMiss_(MultiCount,IndexCount,MultiStageCount)
		local IsReflect	= IsReflect_(MultiCount,IndexCount)
		if(IsMiss == true){
			//�~�X�̏ꍇ
			if(DeleteTaskFlag == true){
				if(MultiStageCount == 0){
					DeleteTask_(TargetKnockBackTask);
				}
			}
			SetDamageEffectSE(IndexCount,SEFlag,MotionFlag,MultiCount,MultiStageCount,PierceFlag,cAction);
		} else if(IsReflect == true){
			//���˂̏ꍇ
			if(DeleteTaskFlag == true){
				if(MultiStageCount == 0){
					DeleteTask_(TargetKnockBackTask);
				}
			}
			SetDamageEffectSE(IndexCount,SEFlag,MotionFlag,MultiCount,MultiStageCount,PierceFlag,cAction);
		} else {
			SetDamageEffectSE(IndexCount,SEFlag,MotionFlag,MultiCount,MultiStageCount,PierceFlag,cAction);
		}
		if(ActHitNum > 1 && MultiStageCount != ActHitNum){
			//���̃|�b�v�\���܂ł̑ҋ@
			Wait_(15);
		}
	}
	
	if(cAction.ActEffectFlag == true){
		Wait_(cAction.EffectFrame)
	}
	
	//�J�����؂�ւ����K�v�ȏꍇ�̓J������؂�ւ���
	for(local y = STATUS_TOP ; y < STATUS_NUM ; y += 1){
		local StateFlag = GetStatusFlag_(y,MultiCount,IndexCount)
		local StateValue = GetStatusValue_(y,MultiCount,IndexCount)
		local Target = GetTargetIndex_(MultiCount,IndexCount)
		local NowStateValue = GetMonsterStatusValue_(y,Target)
		//�X�e�[�^�X�ω����������ꍇ
		if(StateFlag == true && StateValue != 0){
			if(StateValue > 0){
				if(IsStatusUpCameraChange(y) == true){
					local CameraFlag = true;
					DeleteSceneOffset_();
					DeleteAllEffect_();
					CharaStand_Target(CameraFlag,MultiCount);
					Wait_(1);
				}
			} else if(StateValue < 0){
				if(IsStatusDownCameraChange(y) == true){
					local CameraFlag = true;
					DeleteSceneOffset_();
					DeleteAllEffect_();
					CharaStand_Target(CameraFlag,MultiCount);
					Wait_(1);
				}
			}
		}
	}
	
	local ReturnParam = SetAttackStateEffect_Init(IndexCount,MultiCount,cAction)
	local WaitFrame		= ReturnParam[0]
	local MotionTask	= ReturnParam[1]
	
	if(WaitFrame != 0){
		Wait_(WaitFrame);
	}
	
	//��O����
	SetDamageMotionEffect_ExceptionEffect(MultiCount,cAction)
	
	//DebugPrint_FuncName_OUT("SetDamageMotion");
}*/


// �����_���[�W��AWait���o
function SetDamageMotion_EndWait(Wait00,Effect,Wait01)
{
	//DebugPrint_FuncName_IN("SetDamageMotion_EndWait");
	//DebugPrint("	=>	Wait00		:" + Wait00)
	//DebugPrint("	=>	Effect		:" + Effect)
	//DebugPrint("	=>	Wait01		:" + Wait01)
	
	SetApealPoint_Init(false)
	Wait00 = Wait00 / 2;
	Wait01 = Wait01 / 2;
	
	//�X�J�E�g�A�^�b�N�̏ꍇ�AWait��ݒ肵�Ȃ��B
	if(IsScout_() == false){
		Wait_(Wait00);
		if(Effect != null){DeleteEffectEmitter_(Effect);}
		Wait_(Wait01);
	} else {
		Wait_(10)
	}
	
	//�A�s�[���|�C���g�̕\���ҋ@
	for(local i = 0 ; i < 10 ; i++){
		if(IsEndAppealPointAnim_() == true){
			Wait_(10);
			break;
		} else {
			Wait_(1)
			i = 0;
		}
	}
	
	//DebugPrint_FuncName_OUT("SetDamageMotion_EndWait");
}

// �A���U���p������e���o
function SetDamageMotion_Rush(Attack,Target,TargetAngle,MultiCount,MultiStageCount,SandEffect)
{
	//DebugPrint_FuncName_IN("SetDamageMotion_Rush");
	//DebugPrint("	=>	Attack				:	" + Attack);
	//DebugPrint("	=>	Target				:	" + Target);
	//DebugPrint("	=>	TargetAngle			:	" + TargetAngle);
	//DebugPrint("	=>	MultiCount			:	" + MultiCount);
	//DebugPrint("	=>	MultiStageCount		:	" + MultiStageCount);
	//DebugPrint("BattleCommon_LoadParamIN_function_SetDamageMotion_Rush");
	local cAction = cActionInfo(MultiCount);
	//Debug_cActionPrint(cAction)
	
	local cMonster = cTargetMonsterInfo(Target,MultiCount);
	local SEFlag = true;
	local MotionFlag = true;
	local SingleEffectName = GetSingleEffectName_(MultiCount,0);
	local ActionNum = GetActionNum_();
	local IndexCount = 0;	//�Ώۂ͒P�̂Ȃ̂ŁA����O�Œ�
	local MotionTask = null;
	local ActHitNum = GetActHitNum_(MultiCount,IndexCount);
	local WaitValue = 0;
	
	//�ϐ��A�g�\��
	//SetTolerChainRate_(MultiCount)
	
	Wait_(5);
	if(cAction.SingleActEffect0_Name != null){
			MonsterSizeEffect(Target , cAction.SingleActEffect0_Name)
	}
	if(cAction.SingleActEffect1_Name != null){
		MonsterSizeEffect(Target , cAction.SingleActEffect1_Name)
	}
	
	SetDir_(Target, TargetAngle);
	for(MultiStageCount ; MultiStageCount < ActHitNum ; MultiStageCount++){
		if(MotionTask != null){DeleteTask_(MotionTask)}
		MotionTask = SetDamageEffectSE(IndexCount,SEFlag,MotionFlag,MultiCount,MultiStageCount,false,cAction);
		Wait_(1);
	}
	
	//��O����F�ӂ�΂�n
	SetExceptionEffect_HoldOn(MultiCount,IndexCount,false,cAction)	
	
	if(GetActionNum_() != MultiCount + 1){
		//�ŏI�i�ȊO
		DeleteEffectEmitter_(SandEffect);
		WaitValue = SetAttackStateEffect_Init(IndexCount,MultiCount,cAction);
		if(WaitValue != 0){
			Wait_(1);
		}
		//�ŏI�i�ȊO�ł̓��[�V�����^�X�N���폜���Ă���
		//if(MotionTask != null){DeleteTask_(MotionTask);}
	} else {
		//�ŏI�i
		SetApealPoint_Init(false)
		DeleteEffectEmitter_(SandEffect);
		Wait_(35);
		//local cAction = cActionInfo(MultiCount);
		local ReParam = SetAttackStateEffect_Init(IndexCount,MultiCount,cAction);
		WaitValue = ReParam[0]
		local MotionTask = ReParam[1]
		if(WaitValue != 0){
			Wait_(WaitValue);
		}
		
		//��O����E�h���n
		SetExceptionEffect_Rezaoral(MultiCount,IndexCount,true,cAction)
		
		//�A�s�[���|�C���g����
		for(local i = 0 ; i < 10 ; i++){
			if(IsEndAppealPointAnim_() == true){
				Wait_(15)
				return;
		} else {
				Wait_(1)
				i = 0;
			}
		}
	}
	
	return MotionTask;
	
	//DebugPrint_FuncName_OUT("SetDamageMotion_Rush");
}



//�J�b�g�C�����o�`�F�b�N
function SpecialCutCheck(MultiCount){
	local AllEffect0 = GetAllEffectName_(MultiCount,0)
	switch(AllEffect0)
	{
	case "EF213_19_GOD_HAND":
		SpecialCut_GODHAND()
		break;
	case "EF213_21_ABYSS_HAND":
		SpecialCut_ABYSSHAND()
		break;
	case "EF213_23_JUDGMENT":
		SpecialCut_JUDGMENT()
		break;
	default:
		//�p���v���e�̏ꍇ
		if(IsPalpnte_(MultiCount)){
			SpecialCut_PARUPUNTE()
		}
		
		//�ʏ펞�͉������Ȃ�
		break;
	}
}

//GODHAND��p�J�b�g
function SpecialCut_GODHAND()
{
	//�J�n���Ƀ^�X�N�n����ʂ�폜
	CutReset();
	ChangeIndexPointData_(BATTLE_COMMON_POINT_DATA);
	SetPointWorldEffect_("EF213_19_GOD_HAND","pos_SpecialCut_GODHAND")
	SetPointWorldEffect_("EF213_20_GOD_HAND_M","pos_SpecialCut_GODHAND")
	Task_AnimeMoveCamera_("camera_999_GODHAND","camtgt_999_GODHAND")
	Wait_(65)
	//�I�����ɂ��^�X�N�n����ʂ�폜
	CutReset();
}

//ABYSSHAND��p�J�b�g
function SpecialCut_ABYSSHAND()
{
	CutReset();
	ChangeIndexPointData_(BATTLE_COMMON_POINT_DATA);
	SetPointWorldEffect_("EF213_21_ABYSS_HAND","pos_SpecialCut_ABYSSHAND")
	SetPointWorldEffect_("EF213_22_ABYSS_HAND_M","pos_SpecialCut_ABYSSHAND")
	Task_AnimeMoveCamera_("camera_999_ABYSSHAND","camtgt_999_ABYSSHAND")
	StartEarthQuake_(50, 3, 3);
	Wait_(50);
	StopEarthQuake_();
	CutReset();
}

//JUDGMENT��p�J�b�g
function SpecialCut_JUDGMENT()
{
	CutReset();
	ChangeIndexPointData_(BATTLE_COMMON_POINT_DATA);
	SetPointWorldEffect_("EF213_23_JUDGMENT","pos_SpecialCut_JUDGMENT")
	SetPointWorldEffect_("EF213_24_JUDGMENT_M","pos_SpecialCut_JUDGMENT")
	Task_AnimeMoveCamera_("camera_999_JUDGMENT","camtgt_999_JUDGMENT")
	StartEarthQuake_(20, 3, 3);
	Wait_(20)
	StopEarthQuake_();
	StartEarthQuake_(20, 4, 4);
	Wait_(20)
	StopEarthQuake_();
	StartEarthQuake_(60, 5, 5);
	Wait_(60)
	CutReset()
}

function SpecialCut_PARUPUNTE()
{
	CutReset();
	//ChangeIndexPointData_(BATTLE_COMMON_POINT_DATA);
	CharaStand_Action(0,true);
	EffParamSizeEffect(GetActorIndex_(0),"EF130_45_PARUPUNTE");
	Wait_(45)
}

//�V�[���ݒ�����Z�b�g
function CutReset()
{
	DeleteAllTask_()
	DeleteAllEffect_();
	StopEarthQuake_();
	for(local i = 0; i < 4 ; i++){
		local Ally	= GetAllyIndex_(i);
		local Enemy	= GetAllyIndex_(i);
		SetVisible_(Ally, false); 
		SetVisible_(Enemy, false); 
	}
}

//��Βl���擾
function SetAbsoluteValue(Value)
{
	//DebugPrint_FuncName_IN("SetAbsoluteValue");
	//DebugPrint("	=>	Value : " + Value);
	local AbsValue = 0;
	if(Value <0 ){
		for(local i = 0 ; i > Value ; i--){
			AbsValue++
		}
		Value = AbsValue;
	} else {
		Value = AbsValue;
	}
	
	//DebugPrint_FuncName_OUT("SetAbsoluteValue");
	//DebugPrint("	<=	AbsValue	:	" + AbsValue);
	return AbsValue;
}

//����̍ő�A�������擾
function GetMaxActHitNum(MultiCount)
{
	//DebugPrint_FuncName_IN("GetMaxActHitNum");
	//DebugPrint("	=>	MultiCount : " + MultiCount);
	local ActHitNum		= 0;
	local MaxActHitNum	= 0;
	local TargetNum		= GetTargetNum_(MultiCount)
	
	for(local i = 0 ; i < TargetNum ; i++){
		local ActHitNum	= GetActHitNum_(MultiCount,i)
		if(ActHitNum > MaxActHitNum){
			MaxActHitNum = ActHitNum ;//�A���񐔂����킹��
		}
	}
	
	//DebugPrint_FuncName_OUT("GetMaxActHitNum");
	//DebugPrint("	<=	MaxActHitNum : " + MaxActHitNum);
	return MaxActHitNum;
}


//�s�����\�����b�Z�[�W�E�B���h�E����
function ShowActionMessage(MultiCount,NameVisibleFlag)
{
	//DebugPrint_FuncName_IN("ShowActionMessage");
	//DebugPrint("	=>	MultiCount		: " + MultiCount);
	//DebugPrint("	=>	NameVisibleFlag	: " + NameVisibleFlag);
	//MultiCoun			: ����ڂ̍s�����H
	//NameVisibleFlag	: �P��ڂ̍s������ōs������\�����邩�H
	local ActionNum = GetActionNum_();
	
	if(IsScout_()){
		//�X�J�E�g���ɂ͍s������\�����Ȃ�
	} else {
		//�s������\������
		if(ActionNum == 1){
			if(NameVisibleFlag == true){
				StartCombo_(MultiCount);
			} else {
				ShowActionName_(MultiCount)
			}
		} else {
			if(MultiCount == 0){
				StartCombo_(MultiCount);
			} else {
				AddActionName_(MultiCount);
			}
			//SetTolerChainRate_(MultiCount);
		}
	}
	
	local UsedMP = GetUseMp_(MultiCount);
	local ActorIndex = GetActorIndex_(MultiCount);
	SetMpDamage_(ActorIndex, UsedMP);
	
	//local ListStart =	"----- UserMP ------"
	//local ListFront =	null
	//local List =			["ActorIndex"		,	ActorIndex
	//						,"UsedMP"		,	UsedMP
	//						]
	//local ListEnd =		null
	//DebugPrint_OneList(List , ListStart , ListEnd , ListFront)
	
	
	SetTolerChainRate_(MultiCount)
	
	//�s�����\���ɍ��킹�ĉ���ʂ̃����X�^�[�A�C�R����h�炷
	ShowActionMessage_IconAnimation(MultiCount,ActorIndex)
	
	//�s�����\���ɍ��킹�ĉ���ʂ̖��A�C�R��������
	if(IsScout_()){
		//�X�J�E�g�A�^�b�N�̏ꍇ�͖��������Ȃ�
	} else {
		UnSettingAllowTarget_(ActorIndex);
	}
	//DebugPrint_FuncName_OUT("ShowActionMessage");
}

//�s�����\�����b�Z�[�W�E�B���h�E�����i���Ȃ��j
function ShowActionMessage_NoAllow(MultiCount,NameVisibleFlag)
{
	//DebugPrint_FuncName_IN("ShowActionMessage_NoAllow");
	//DebugPrint("	=>	MultiCount		: " + MultiCount);
	//DebugPrint("	=>	NameVisibleFlag	: " + NameVisibleFlag);
	//MultiCoun			: ����ڂ̍s�����H
	//NameVisibleFlag	: �P��ڂ̍s������ōs������\�����邩�H
	local ActionNum = GetActionNum_();
	if(ActionNum == 1){
		if(NameVisibleFlag == true){
			StartCombo_(MultiCount);
		} else {
			StartCombo_(MultiCount);
		}
	} else {
		if(MultiCount == 0){
			StartCombo_(MultiCount);
		} else {
			AddActionName_(MultiCount);
		}
	}
	
	SetTolerChainRate_(MultiCount);
	
	//�s���҂��}�X�^�[�ȊO�̏ꍇ�A�s�����̕\���ɍ��킹��MP������s��
	local UsedMP = GetUseMp_(MultiCount);
	local ActorIndex = GetActorIndex_(MultiCount);
	local IsMaster = IsMaster_(ActorIndex)
	if(IsMaster == false){
		SetMpDamage_(ActorIndex, UsedMP);
	}
	
	//�s�����\���ɍ��킹�ĉ���ʂ̃����X�^�[�A�C�R����h�炷
	if(IsMaster == false){
		ShowActionMessage_IconAnimation(MultiCount,ActorIndex)
	}
	
	//DebugPrint_FuncName_OUT("ShowActionMessage_NoAllow");
}

//�s���ɍ��킹�������X�^�[�A�C�R���̃A�j���[�V����
function ShowActionMessage_IconAnimation(MultiCount,Actor)
{
	//DebugPrint_FuncName_IN("ShowActionMonster_IconAnimetion");
	//DebugPrint("	=>	MultiCount		: " + MultiCount);
	//DebugPrint("	=>	Actor	: " + Actor);
	
	if(IsScout_()){
		//�X�J�E�g�A�^�b�N���͍s���҃A�C�R���𕨗��^�C�v�ŗh�炷
		PlayIconAttackAnim_(Actor);
	} else {
		local Efficacy = GetActionEfficacy_(MultiCount);
		switch(Efficacy)
		{
		case EFFICACY.ATTACK:
		case EFFICACY.WEAK:
				PlayIconAttackAnim_(Actor);
				break;
		case EFFICACY.SUPPORT:
		case EFFICACY.HEAL:
				PlayIconHealAndSupportAnim_(Actor);
				break;
		case EFFICACY.NONE:
		case EFFICACY.DEFENSE:
		case EFFICACY.OTHER:
				break;
		default:
			//�����Ȃ��ꍇ�͉������Ȃ�
			break;
		
		}
	}
	
	//DebugPrint_FuncName_OUT("ShowActionMonster_IconAnimetion");
}

//���̖͂\�����o
function MagicRunawayQuake(MultiCount)
{
	local Category			= GetActionCategory_(MultiCount)
	local TargetNum			= GetTargetNum_(MultiCount)
	local CriticalFlag		= false
	
	//���@�ȊO�ł͔��������Ȃ�
	if(Category != CATEGORY.SPELL){return;}
	
	for(local IndexCount = 0 ; IndexCount < TargetNum ; IndexCount++){
		for(local MultiStageCount = 0 ; MultiStageCount < GetActHitNum_(MultiCount,IndexCount) ; MultiStageCount++){
			if(CriticalFlag == false){
				CriticalFlag = IsCritical_(MultiCount , IndexCount , MultiStageCount)
			}
		}
	}
	
	if(CriticalFlag != true){return;}
	
	//���̖͂\�����o
	AddBattleOtherMessage_(59)
	StartEarthQuake_(30, 10, 5);
}

//�w�肵���ʒu�Ƀ����X�^�[�̔z�u�iIndex���Ȃ��ꍇ�͔�\���A���S���̓��l��0�Ŕz�u�j
function SetMonster_Empty(Monster,Empty,Rotate)
{
	//DebugPrint_FuncName_IN("SetMonster_Empty");
	//DebugPrint("	=>	Monster		: " + Monster);
	//DebugPrint("	=>	Empty		: " + Empty);
	//DebugPrint("	=>	Rotate		: " + Rotate);
	local MonsterType = GetInitExistType_(Monster);
	
	if(Monster != INVALID_CHARACTER){
		//�����X�^�[���ݎ��̋��ʉӏ�
		if(MonsterType != LIVETYPE.NONE){
			Task_AnimeMoveCharNoDir_(Monster, Empty);
			SetVisible_(Monster, true);
			SetMotion_(Monster, MOT_WAIT, 0);
			if(Rotate != null){
				SetDir_(Monster, Rotate);
			}
		}
		if(MonsterType == LIVETYPE.ACTIVE){
			//�����X�^�[�������̏���
			SetAlpha_(Monster, 1.0);
		} else if (MonsterType == LIVETYPE.INACTIVE){
			//DebugPrint("Monster is Dead : " + Monster + "\n")
			//�����X�^�[���S���̏���;
			SetAlpha_(Monster, 0.0);
		}
		//Debug_EmptyPrint(Monster,Empty,Rotate)
		
	}
	
	//DebugPrint_FuncName_OUT("SetMonster_Empty");
}

//�w�肵���ʒu�Ƀ}�X�^�[�̔z�u
function SetMaster_Empty(Master,Empty,Rotate)
{
	//DebugPrint_FuncName_IN("SetMaster_Empty");
	//DebugPrint("	=>	Master		: " + Master);
	//DebugPrint("	=>	Empty		: " + Empty);
	//DebugPrint("	=>	Rotate		: " + Rotate);
	
	//local ArgList =	["Master"	,	Master
	//				,"Empty"	,	Empty
	//				,"Rotate"	,	Rotate
	//				]
	//DebugPrint_functionParam("SetMaster_Empty" , ArgList)
	
	//�}�X�^�[�̐ݒu�i���C�h���͌��󔻒肪�Ȃ��̂Ŗ����j
	local RideFlag = false;
	local AllyFlag = true;
	
	if(IsAlly_(Master)){
		AllyFlag = true;
	} else {
		AllyFlag = false;
	}
	
	for(local i = 0 ; i < 4 ; i++){
		if(RideFlag == false){
			if(AllyFlag == true){
				RideFlag = IsRide_(GetAllyIndex_(i))
			} else {
				RideFlag = IsRide_(GetEnemyIndex_(i))
			}
		}
	}
	
	
	if(RideFlag == false){
		Task_AnimeMoveCharNoDir_(Master, Empty);
		SetVisible_(Master, true);
		SetMotion_(Master, MOT_BATTLE_WAIT, 0);
		if(Rotate != null){
			SetDir_(Master, Rotate);
		}
	}
	//DebugPrint_FuncName_OUT("SetMaster_Empty");
}

//�퓬���o��O�`�F�b�N�i�J�n���j
function Exception_1stCheck(MultiCount,SingleAttackFlag,cAction)
{
	//DebugPrint_FuncName_IN("Exception_1stCheck");
	//print("ExecMissType" + GetExecMissType_() + "\n");
	switch(GetExecMissType_())
	{
	case EXEC_MISS_TYPE.NONE:
		//�ُ킪�Ȃ��ꍇ�A�݂����`�F�b�N���s��
		if(SingleAttackFlag == true){
			SubstituteCheck_Init(MultiCount,SingleAttackFlag,cAction)	//�݂���肩�H
		}
		break;
	case EXEC_MISS_TYPE.LACK_MP:		//MP�؂�̏ꍇ
		Exception_MPLack_Init(MultiCount,cAction)
		break;
	case EXEC_MISS_TYPE.MIST:			//����Ԃ̏ꍇ
		Exception_Mist_Init(MultiCount,cAction)
		break;
	case EXEC_MISS_TYPE.MISS:			//���s�̏ꍇ
		Exception_Miss_Init(MultiCount,cAction)
		break;
	case EXEC_MISS_TYPE.DIFFERENT_SIZE:	//�T�C�Y�Ⴂ�̏ꍇ
	case EXEC_MISS_TYPE.AES_MISS:		//�Ώۂ�AES�̍s�����~�X�������ꍇ
		break;
	case EXEC_MISS_TYPE.LACK_TS:		//�e���V�����s���̏ꍇ
		Exception_TSLack_Init(MultiCount,cAction)
		break;
	default:
		break;
	}
	if(SingleAttackFlag == true){
		Exception_2ndCheck(MultiCount,SingleAttackFlag,cAction)
	}
	//DebugPrint_FuncName_OUT("Exception_1stCheck");
}

//�퓬���o��O�`�F�b�N�i���ʃJ�b�g�O�j
function Exception_2ndCheck(MultiCount,SingleAttackFlag,cAction)
{
	if(SingleAttackFlag == false){
		//����ȊO�͂����ł݂����`�F�b�N���s���B
		SubstituteCheck_Init(MultiCount,SingleAttackFlag,cAction)
	}
}

//�s�����s�E�l�o�؂ꉉ�o
function Exception_MPLack_Init(MultiCount,cAction)
{
	//DebugPrint_FuncName_IN("Exception_MPLack_Init");
	//DebugPrint("	=>	MultiCount		: " + MultiCount);
	
	//�K�v�ȃN���X���Ăяo��
	local Actor = GetActorIndex_(MultiCount);
	
	local CharaStand_Select = "Action"
	local CameraFlag = true;
	CharaStand(CharaStand_Select , CameraFlag , gMultiCount,cAction);
	//�Z���̕\��
	ShowActionMessage(MultiCount, true);
	SetMotion_(Actor , MOT_SWORD_START , 4);
	Wait_(15);
	SetMotion_(Actor , MOT_SWORD_CHARGE , 4);
	Wait_(30);
	SetMotion_(Actor , MOT_SWORD_EXERCISE , 4);
	Wait_(5);
	DeleteAllActionName_();
	ShowBattleEventMessage_(IsAlly_(Actor), 9);
	Wait_(50);
	
	BatteleScript_End();
	
	//DebugPrint_FuncName_OUT("Exception_MPLack_Init");
}

//�s�����s�E�����o
function Exception_Mist_Init(MultiCount,cAction)
{
	//DebugPrint_FuncName_IN("Exception_Mist_Init");
	//DebugPrint("	=>	MultiCount		: " + MultiCount);
	
	//�K�v�ȃN���X���Ăяo��
	local Actor = GetActorIndex_(MultiCount);
	
	local CharaStand_Select = "Action"
	local CameraFlag = true;
	CharaStand(CharaStand_Select , CameraFlag , gMultiCount,cAction);
	//�Z���̕\��
	ShowActionMessage(MultiCount,true);
	SetMotion_(Actor , MOT_SWORD_START , 4);
	Wait_(15);
	SetMotion_(Actor , MOT_SWORD_CHARGE , 4);
	Wait_(30);
	SetMotion_(Actor , MOT_SWORD_EXERCISE , 4);
	Wait_(5);
	DeleteAllActionName_();
	ShowBattleEventMessage_(IsAlly_(Actor), 10);
	Wait_(50);
	
	BatteleScript_End();
	
	//DebugPrint_FuncName_OUT("Exception_Mist_Init");
}

//�s�����s�E�~�X���o
function Exception_Miss_Init(MultiCount,cAction)
{
	//DebugPrint_FuncName_IN("Exception_Miss_Init");
	//DebugPrint("	=>	MultiCount		: " + MultiCount);
	
	//�K�v�ȃN���X���Ăяo��
	local Actor = GetActorIndex_(MultiCount);
	
	local CharaStand_Select = "Action"
	local CameraFlag = true;
	CharaStand(CharaStand_Select , CameraFlag , gMultiCount,cAction);
	//�Z���̕\��
	local NameVisibleFlag = true;
	ShowActionMessage(MultiCount,true);
	SetMotion_(Actor , MOT_SWORD_START , 4);
	Wait_(15);
	SetMotion_(Actor , MOT_SWORD_CHARGE , 4);
	Wait_(30);
	SetMotion_(Actor , MOT_SWORD_EXERCISE , 4);
	Wait_(5);
	DeleteAllActionName_();
	ShowBattleEventMessage_(IsAlly_(Actor), 13);
	Wait_(50);
	
	BatteleScript_End();
	
	//DebugPrint_FuncName_OUT("Exception_Miss_Init");
}

//�s�����s�E�e���V�����s�����o
function Exception_TSLack_Init(MultiCount,cAction)
{
	//DebugPrint_FuncName_IN("Exception_Miss_Init");
	//DebugPrint("	=>	MultiCount		: " + MultiCount);
	
	//�K�v�ȃN���X���Ăяo��
	local Actor = GetActorIndex_(MultiCount);
	
	local CharaStand_Select = "Action"
	local CameraFlag = true;
	CharaStand(CharaStand_Select , CameraFlag , gMultiCount,cAction);
	//�Z���̕\��
	local NameVisibleFlag = true;
	ShowActionMessage(MultiCount,true);
	SetMotion_(Actor , MOT_SWORD_START , 4);
	Wait_(15);
	SetMotion_(Actor , MOT_SWORD_CHARGE , 4);
	Wait_(30);
	SetMotion_(Actor , MOT_SWORD_EXERCISE , 4);
	Wait_(5);
	DeleteAllActionName_();
	ShowBattleEventMessage_(IsAlly_(Actor), 584);
	Wait_(50);
	
	BatteleScript_End();
	
	//DebugPrint_FuncName_OUT("Exception_Miss_Init");
}

//�݂���艉�o�E�P�̍U������
//SingleAttackFlag		: �����P�̍U������
function SubstituteCheck_Init(MultiCount , SingleAttackFlag , cAction)
{
	//DebugPrint_FuncName_IN("SubstituteCheck_Init");
	//DebugPrint("	=>	MultiCount				: " + MultiCount);
	//DebugPrint("	=>	SingleAttackFlag		: " + SingleAttackFlag);
	local NameVisibleFlag	= true;
	local Actor				= GetActorIndex_(MultiCount)
	
	//�݂����̉��o���������Ȃ��ꍇ�͖߂�
	local SubstituteFlag	= false;
	if(SubstituteFlag == false){
		//DebugPrint_FuncName_OUT("SubstituteCheck_Init");
		return;
	}
	
	if(SingleAttackFlag == true){
		//�P�̕����U�������o
		CharaStand_Action(0,true)
		ShowActionMessage(MultiCount,NameVisibleFlag)
		SpellCastEffect(Actor,MultiCount)
		SetMotion_(cAction.Attack , MOT_SWORD_START , 4)
		Wait_(15);
		SetMotion_(cAction.Attack , MOT_SWORD_CHARGE , 4)
		Wait_(30);
		SetMotion_(cAction.Attack , MOT_SWORD_EXERCISE , 4)
		SetCameraEffect_("EF000_03_SHUCHUSEN", 100);
		Wait_(30);
	} else {
		//����ȊO
	}
	
	//��e�����͋���
	local CameraFlag		= true;
	CharaStand_Substitute(CameraFlag,MultiCount);
	local MultiStageCount	= 0;
	local WaitFlag			= true;
	Wait_(1);	//�L�����E�J�����z�u�҂�
	LineEffect_Substitute(MultiCount,MultiStageCount,cAction,WaitFlag)
	//�݂���莞�͂��̏�����������Script���I������B
	BatteleScript_End();
	
	//DebugPrint_FuncName_OUT("SubstituteCheck_Init");
}


//���Z�r���pEffect
function SpellCastEffect(Actor,MultiCount)
{
	//DebugPrint_FuncName_IN("SpellCastEffect");
	//DebugPrint("	=>	Actor		: " + Actor);
	//DebugPrint("	=>	MultiCount		: " + MultiCount);
	local Category = GetActionCategory_(MultiCount)
	local IsTokugi = IsTokugi_(MultiCount)
	
	if(IsTokugi == true){
		switch (Category)
		{
		case CATEGORY.NONE:
			//�ʏ�U���̏ꍇ�A�������Ȃ�
			break;
		case CATEGORY.PHYSICAL	:
			EffParamSizeEffect(Actor,"EF000_02_SKILL_ARIA")
			break;
		case CATEGORY.SPELL		:
			EffParamSizeEffect(Actor,"EF000_01_MAGIC_ARIA")
			//ReplaySE_("SE_SHA_002");
			break;
		case CATEGORY.ARTS	:
			EffParamSizeEffect(Actor,"EF000_02_SKILL_ARIA")
			break;
		case CATEGORY.BREATH		:
			EffParamSizeEffect(Actor,"EF000_02_SKILL_ARIA")
			break;
		case CATEGORY.DANCE		:
			EffParamSizeEffect(Actor,"EF000_02_SKILL_ARIA")
			break;
		case CATEGORY.FEAT		:
			break;
		case CATEGORY.ITEM		:
			break;
		case CATEGORY.OTHER		:
			break;
		default:
			//�����Ȃ��ꍇ�͉������Ȃ�
		}
	} else {}
	
	//DebugPrint_FuncName_OUT("SpellCastEffect");
}

//�X�N���v�g�J�n���E�`�F�b�N
function ScriptStartCheck()
{
	//�X�J�E�g�`�F�b�N
	ScoutStartCheck();
	
	
	
}
//�s���J�n�E�X�J�E�g�`�F�b�N
function ScoutStartCheck()
{
	//DebugPrint_FuncName_IN("ScoutStartCheck");
	if(IsScout_() != true){
		//DebugPrint_FuncName_OUT("ScoutStartCheck");
		return;
	}
	
	//��ʂ̕\���؂�ւ�
	if(IsScout_()){
		//�����l�̒l�̑���i���쐬�j
		SetVisibleScoutGauge_(true);
		ScoutAttackPrint(0)
		FilterOn_(0, 0, 0, 100);
	}
	
	//��ʃG�t�F�N�g�̕\���i���쐬�j
	//DebugPrint_FuncName_OUT("ScoutStartCheck");
}

//�X�J�E�g�A�^�b�N�p�l�Q��
function ScoutAttackPrint(MultiCount)
{	
	local MultiStageCount = 0;
	//DebugPrint("<<<<<<< ScoutAttackPrint >>>>>>>>"  + "\n")
	//DebugPrint("IsScout_()					: " + IsScout_() + "\n")
	//DebugPrint("GetScoutDamageValue_()		: " + GetScoutDamageValue_(MultiCount) + "\n")
	//DebugPrint("IsScoutSuccess_()			: " + IsScoutSuccess_() + "\n")
	//DebugPrint("GetActHitNum_(MultiCount,0)	: "	 + GetActHitNum_(MultiCount,0) + "\n")
}

//�X�J�E�g�A�^�b�N�_���[�W����
function SetDamageMotion_ScoutAttack(MultiCount)
{
	//DebugPrint_FuncName_IN("SetDamageMotion_ScoutAttack");
	//DebugPrint("	=>	MultiCount		:" + MultiCount)
	
	if(IsScout_() != true){
		//DebugPrint_FuncName_OUT("SetDamageMotion_ScoutAttack");
		return;
	}
	
	local MotionTask			= null;
	local MaxActHitNum			= GetActHitNum_(MultiCount,0)
	local FirstScoutDamageFlag	= true;	//�X�J�E�g�_���[�W���P��ڂ̏ꍇ
	local MotionTask			= null;
	
	//�X�J�E�g�_���[�W���o
	for(local MultiStageCount = 0 ; MultiStageCount < 1; MultiStageCount++){
		//�A�������Ŋ��Ƀ��[�V�����^�X�N���ݒ肳�ꂽ�ꍇ�͔j������
		if(MotionTask != null){
			DeleteTask_(MotionTask);
		}
		//�_���[�W����
		if(IsCritical_(MultiCount, 0 ,MultiStageCount)){
			//�N���e�B�J�����o
			MotionTask = SetScoutDamageMotion_Critical(MultiCount,MultiStageCount)
			SetScoutDamageMotion_UIEffect(MultiCount,FirstScoutDamageFlag)
		} else if(IsMiss_(MultiCount, 0 ,MultiStageCount)){
			//�~�X���o
			MotionTask = SetScoutDamageMotion_Miss(MultiCount,MultiStageCount)
		} else {
			//�ʏ�_���[�W���o
			MotionTask = SetScoutDamageMotion_NormalDamage(MultiCount,MultiStageCount)
			SetScoutDamageMotion_UIEffect(MultiCount,FirstScoutDamageFlag)
		}
	}
	
	return MotionTask;
	//DebugPrint_FuncName_OUT("SetDamageMotion_ScoutAttack");
}

//�X�J�E�g�A�^�b�N�F�f�s�T�C�Y��
//MultiCount		: ����ڂ̍s�����H
function LineEffect_ScoutAttack(MultiCount)
{
	//DebugPrint_FuncName_IN("LineEffect_ScoutDamage");
	//DebugPrint("	=>	MultiCount		:" + MultiCount)
	
	if(IsScout_() != true){
		//DebugPrint_FuncName_OUT("LineEffect_ScoutDamage");
		return;
	}
	
	//�X�J�E�g�Ώ۔z�u
	DeleteAllTask_();
	CharaStand_ScoutTarget()
	local Target = GetTargetIndex_(0,0)
	Wait_(15)
	
	local MotionTask = null
	local MaxActHitNum = GetActHitNum_(MultiCount,0)
	local FirstScoutDamageFlag = true
	//�X�J�E�g�_���[�W���o
	for(local MultiStageCount = 0 ; MultiStageCount < MaxActHitNum; MultiStageCount++){
		//�A�������Ŋ��Ƀ��[�V�����^�X�N���ݒ肳�ꂽ�ꍇ�͔j������
		if(MotionTask != null){
			DeleteTask_(MotionTask);
		}
		//�_���[�W����
		if(IsCritical_(MultiCount,0,MultiStageCount)){
			//�N���e�B�J�����o
			MotionTask = SetScoutDamageMotion_Critical(MultiCount,MultiStageCount)
			SetScoutDamageMotion_UIEffect(MultiCount,FirstScoutDamageFlag)
		} else if(IsMiss_(MultiCount,0,MultiStageCount)){
			//�~�X���o
			SetScoutDamageMotion_Miss(MultiCount,MultiStageCount)
		} else {
			//�ʏ�_���[�W���o
			MotionTask = SetScoutDamageMotion_NormalDamage(MultiCount,MultiStageCount)
			SetScoutDamageMotion_UIEffect(MultiCount,FirstScoutDamageFlag)
		}
		FirstScoutDamageFlag = false
	}
	
	Wait_(30)
	
	//DebugPrint_FuncName_OUT("LineEffect_ScoutDamage");
}

//�X�J�E�g�A�^�b�N�E�N���e�B�J�����o
//MultiCount		: ����ڂ̍s�����H
//MultiStageCount	: ���i�ڂ̍U�����H
//-----�߂�l----
//MotionTask		: ��e���[�V�����̃^�X�N�ԍ�
function SetScoutDamageMotion_Critical(MultiCount,MultiStageCount)
{
	//DebugPrint_FuncName_IN("SetScoutDamageMotion_Critical");
	//DebugPrint("	=>	MultiCount			:" + MultiCount)
	//DebugPrint("	=>	MultiStageCount		:" + MultiStageCount)
	
	local Target		= GetTargetIndex_(MultiCount,0)
	local Actor			= GetActorIndex_(MultiCount)
	local MotionTask	= null;
	
	EffParamSizeEffect(Target,"EF010_02_HIT_KAISHIN");
	EffParamSizeEffect(Target,"EF000_08_SA_ATTACK");
	
	StartEarthQuake_(20, 5, 10);
	SetMotion_(Target, MOT_DAMAGE, 4);
	MotionTask = Task_ChangeMotion_(Target, MOT_WAIT, 4);
	
	return MotionTask;
	//DebugPrint_FuncName_OUT("SetScoutDamageMotion_Critical");
	//DebugPrint("	<=	MotionTask			:" + MotionTask)
}

//�X�J�E�g�A�^�b�N�E�~�X���o
//MultiCount		: ����ڂ̍s�����H
//MultiStageCount	: ���i�ڂ̍U�����H
//-----�߂�l----
//�Ȃ�				�F Miss�ł�MotionTask��Ԃ��Ȃ��B
function SetScoutDamageMotion_Miss(MultiCount,MultiStageCount)
{
	//DebugPrint_FuncName_IN("SetScoutDamageMotion_Miss");
	//DebugPrint("	=>	MultiCount			:" + MultiCount)
	//DebugPrint("	=>	MultiStageCount		:" + MultiStageCount)
	local MotionTask = null;
	
	local Target		= GetTargetIndex_(MultiCount,0)
	local cMonster = cMonsterInfo(Target)
	
	ReplaySE_("SE_BTL_022");
	SetPop_(Target, POPSTYLE.DAMAGE_ENEMY, 0 , true , cMonster.PopDate_X[MultiStageCount] , cMonster.PopDate_Y[MultiStageCount] , 1.0);
	
	return MotionTask;
	//DebugPrint_FuncName_OUT("SetScoutDamageMotion_Miss");
}

//�X�J�E�g�A�^�b�N�E�ʏ�_���[�W���o
//MultiCount		: ����ڂ̍s�����H
//MultiStageCount	: ���i�ڂ̍U�����H
//-----�߂�l----
//MotionTask		: ��e���[�V�����̃^�X�N�ԍ�
function SetScoutDamageMotion_NormalDamage(MultiCount,MultiStageCount)
{
	//DebugPrint_FuncName_IN("SetScoutDamageMotion_NormalDamage");
	//DebugPrint("	=>	MultiCount			:" + MultiCount)
	//DebugPrint("	=>	MultiStageCount		:" + MultiStageCount)
	
	local Target		= GetTargetIndex_(MultiCount,0)
	local Actor			= GetActorIndex_(MultiCount)
	local MotionTask	= null;
	
	EffParamSizeEffect(Target,"EF010_01_HIT");
	EffParamSizeEffect(Target,"EF000_08_SA_ATTACK");
	SetMotion_(Target, MOT_DAMAGE, 4);
	MotionTask = Task_ChangeMotion_(Target, MOT_WAIT, 4);
	
	//DebugPrint_FuncName_OUT("SetScoutDamageMotion_NormalDamage");
	//DebugPrint("	<=	MotionTask			:" + MotionTask)
	return MotionTask;
}

//�X�J�E�g�A�^�b�N�E�t�h���f
//MultiCount			: ����ڂ̍s�����H
//FirstScoutDamageFlag	: �ŏ��̃X�J�E�g�_���[�W���H
function SetScoutDamageMotion_UIEffect(MultiCount,FirstScoutDamageFlag)
{
	//DebugPrint_FuncName_IN("SetScoutDamageMotion_UIEffect");
	//DebugPrint("	=>	MultiCount		:" + MultiCount)
	//DebugPrint("	=>	FirstScoutDamageFlag		:" + FirstScoutDamageFlag)

	//�Q�[�W�̃J�E���g�A�b�v���Ɣ��̂ŏ���ōĐ�����SE���~
	if(IsScoutFirstAttack_()){
		StopSE_("SE_BTL_014");
	}
	
	if(FirstScoutDamageFlag == true){
		//�ŏ��̂P��ڂ̃_���[�W�ł݂̂t�h�X�V
		local ScoutDamageValue = GetScoutDamageValue_(MultiCount);
		AddScoutGaugeValue_(ScoutDamageValue);
		while(IsFinishScoutGaugeAnime_() != true)
		{
			UpdateScoutGauge_();
			Wait_(1);
		}
	}
	FirstScoutDamageFlag = false;
	//DebugPrint_FuncName_OUT("SetScoutDamageMotion_UIEffect");
	//DebugPrint("	<=	FirstScoutDamageFlag		:" + FirstScoutDamageFlag)
	return FirstScoutDamageFlag;
}


//�����U���i�ђʁj��e���o
//Target		: �Ώێ҂�Index
//Actor			: �s���҂�Index
//cAction		: cActionInfo
function TargetPierceMotion(Target,Actor,OldPattern,cAction)
{
	//DebugPrint_FuncName_IN("TargetPierceMotion");
	//DebugPrint("	=>	Target			:" + Target)
	//DebugPrint("	=>	Actor			:" + Actor)
	//DebugPrint("	=>	OldPattern		:" + OldPattern)
	
	//���Z�G�t�F�N�g�Ɣ�e
	if(cAction.SingleActEffect0_Name != null){
		MonsterSizeEffect(Target, cAction.SingleActEffect0_Name);
	}
	if(cAction.SingleActEffect1_Name != null){
		MonsterSizeEffect(Target, cAction.SingleActEffect1_Name);
	}
	SetMotion_(Target, MOT_DAMAGE, 4);
	Task_ChangeMotion_(Target , MOT_WAIT , 1)
	
	if(OldPattern == true){
		SetMotionStepFrame_(Target, 0.3);
		SetMonsterPlayMoveSE_(Target,false);
		
	} else {
		SetMotionStepFrame_(Target, 0.23);
		SetMonsterPlayMoveSE_(Target,false);
		
	}
	//ReplaySE_(cAction.DamageSE);
	//EffParamSizeEffect(Target,"EF010_01_HIT");
	//DebugPrint_FuncName_OUT("TargetPierceMotion");
}

//�A�s�[���|�C���g�\��
//WaitFlag		: �������ŁA�A�j���[�V�����I����҂��H
function SetApealPoint_Init(WaitFlag)
{
	local ActionNum		= GetActionNum_()
	local TargetNum		= 0
	local AllyPoint		= 0;
	local EnemyPoint	= 0;
	for(local MultiCount = 0 ; MultiCount < ActionNum ; MultiCount++){
		TargetNum		= GetTargetNum_(MultiCount);
		for(local IndexCount = 0 ; IndexCount < TargetNum ; IndexCount++){
			AllyPoint	= AllyPoint + GetAllyAppealPoint_(MultiCount, IndexCount);
			EnemyPoint	= EnemyPoint + GetEnemyAppealPoint_(MultiCount, IndexCount);
		}
	}
	
	print("<<<<<<< ApealPointCheck >>>>>>>>"  + "\n")
	print(" AllyApealPoint  : " + AllyPoint + "\n")
	print(" EnemyApealPoint : " + EnemyPoint + "\n")
	AddAppealPoint_(AllyPoint,EnemyPoint);
	StartAppealPointAnim_();
	local count = 0;
	
	//�������őҋ@���s���ꍇ�́A
	if(WaitFlag == true){
		for(local i = 0 ; i < 10 ; i++){
			if(IsEndAppealPointAnim_() == true){
				Wait_(15);
				return;
			} else {
				Wait_(1)
				i = 0;
				count++
			}
		}
	}
	
}

// �����������i�������ʐS�Ȃǁj��HP1�ŕ��A���邩�ǂ���
function IsResurrectionFromDead(MultiCount,IndexCount)
{
	// HP1�ŕ��A�ł���������������Ă��邩
	if(IsLastStand_(MultiCount,IndexCount) == false &&
		 IsBraveHart_(MultiCount,IndexCount) == false){
		 return false;
	}
	return true;
}

//�퓬Script��p���f����
function BatteleScript_End()
{
	End_();
	Wait_(1);
}

//Script���f�p����
function ScriptStop()
{
	//�G���[���ɋ����i�s��~
	for(local i = 0 ; i < 3 ; i++){
		Wait_(1)
		i=0;
	}
}

//==============�f�o�b�O�@�\================//

// �֐����ƁAIN/OUT�����\������p
// inout:����Ƃ���"in", �o��Ƃ���"out"��
function DebugPrint_FuncName_IN (funcName)
{
	local padding = ""
	for(local i = 0;i < g_funcDepth;i++){
		padding += "  ";
	}
	g_funcDepth++;
	print(padding + "func_in:" + funcName + "\n");
}

function DebugPrint_FuncName_OUT (funcName)
{
	g_funcDepth--;
	if(g_funcDepth < 0) {
		g_funcDepth = 0;
		print("in���out�̂ق��������ł���\n");
	}
	local padding = ""
	for(local i = 0;i < g_funcDepth;i++){
		padding += "  ";
	}
	print(padding + "func_out:" + funcName + "\n");
}

//�f�o�b�O�pEmpty�v�����g
//function Debug_EmptyPrint(Monster,Empty,Rotate)
//{
//	return;
//	
//	if(DEBUG_CACTIONPRINTFLAG == "false"){
//		return;
//	}
//	local EmptyPos = GetPos_(Monster)
//	
//	print("----[Debug_EmptyPrint]---------------------------" + "\n")
//	print("Monster		: " + Monster + "\n")
//	print("Empty		: " + Empty + "\n")
//	print("EmptyPos.x	: " + EmptyPos.x + "\n")
//	print("EmptyPos.y	: " + EmptyPos.y + "\n")
//	print("EmptyPos.z	: " + EmptyPos.z + "\n")
//	print("Rotate		: " + Rotate + "\n")
//}

//�f�o�b�O�v�����g�p�e�L�X�g�\��
//function DebugPrint_DamageType(DamageType)
//{
//	local PrintText;
//	switch(DamageType)
//	{
//		case AFFECT_PARAM.NONE:
//			PrintText = "AFFECT_PARAM.NONE"
//			break;
//		case AFFECT_PARAM.MAX_HP:
//			PrintText = "AFFECT_PARAM.MAX_HP"
//			break;
//		case AFFECT_PARAM.MAX_MP:
//			PrintText = "AFFECT_PARAM.MAX_MP"
//			break;
//		case AFFECT_PARAM.HP:
//			PrintText = "AFFECT_PARAM.HP"
//			break;
//		case AFFECT_PARAM.MP:
//			PrintText = "AFFECT_PARAM.MP"
//			break;
//		case AFFECT_PARAM.AT:
//			PrintText = "AFFECT_PARAM.AT"
//			break;
//		case AFFECT_PARAM.DF:
//			PrintText = "AFFECT_PARAM.DF"
//			break;
//		case AFFECT_PARAM.QC:
//			PrintText = "AFFECT_PARAM.QC"
//			break;
//		case AFFECT_PARAM.WS:
//			PrintText = "AFFECT_PARAM.WS"
//			break;
//		case AFFECT_PARAM.TS:
//			PrintText = "AFFECT_PARAM.TS"
//			break;
//		case AFFECT_PARAM.HMP:
//			PrintText = "AFFECT_PARAM.HMP"
//			break;
//		default:
//			print("++++++ DamageType ERRPR ++++++" + "\n")
//			print("DamageType : " + Efficacy + "\n")
//			ScriptStop();
//			break;
//	}
//	return PrintText;
//}

//function DebugPrint_TargetType(TargetType)
//{
//	local PrintText;
//	switch(TargetType)
//	{
//		case TARGET.NONE:
//			PrintText = "TARGET.NONE";
//			break;	
//		case TARGET.ALLY:
//			PrintText = "TARGET.ALLY";
//			break;	
//		case TARGET.ALLY_ALL:
//			PrintText = "TARGET.ALLY_ALL";
//			break;	
//		case TARGET.ALLY_RANDOM:
//			PrintText = "TARGET.ALLY_RANDOM";
//			break;	
//		case TARGET.ALLY_MULTI_RANDOM:
//			PrintText = "TARGET.ALLY_MULTI_RANDOM";
//			break;	
//		case TARGET.ALLY_ENEMY:
//			PrintText = "TARGET.ALLY_ENEMY";
//			break;	
//		case TARGET.ALL:
//			PrintText = "TARGET.ALL";
//			break;	
//		case TARGET.ENEMY:
//			PrintText = "TARGET.ENEMY";
//			break;	
//		case TARGET.ENEMY_ALL:
//			PrintText = "TARGET.ENEMY_ALL";
//			break;	
//		case TARGET.ENEMY_RANDOM:
//			PrintText = "TARGET.ENEMY_RANDOM";
//			break;	
//		case TARGET.BAKURETSU:
//			PrintText = "TARGET.BAKURETSU";
//			break;	
//		case TARGET.SELF:
//			PrintText = "TARGET.SELF";
//			break;	
//		case TARGET.RANDOM:
//			PrintText = "TARGET.RANDOM";
//			break;	
//		case TARGET.FIELD:
//			PrintText = "TARGET.FIELD";
//			break;	
//		case TARGET.OTHER:
//			PrintText = "TARGET.OTHER";
//			break;	
//		default:
//			print("++++++ TARGETTYPE ERRPR ++++++" + "\n")
//			print("TargetType : " + TargetType + "\n")
//			ScriptStop();
//			break;
//	}
//	return PrintText;
//}

//function DebugPrint_MonsterSize(Size)
//{
//	local PrintText;
//	switch(Size)
//	{
//		case SIZE_S:
//			PrintText = "SIZE_S";
//			break;	
//		case SIZE_N:
//			PrintText = "SIZE_N";
//			break;	
//		case SIZE_M:
//			PrintText = "SIZE_M";
//			break;	
//		case SIZE_G:
//			PrintText = "SIZE_G";
//			break;	
//		case SIZE_T:
//			PrintText = "SIZE_T";
//			break;	
//		default:
//			print("++++++ SIZE ERRPR ++++++" + "\n")
//			print("Size : " + Size + "\n")
//			ScriptStop();
//			break;
//	}
//	return PrintText;
//}

//function DebugPrint_Efficacy(Efficacy)
//{
//	local PrintText;
//	switch(Efficacy)
//	{
//		case EFFICACY.NONE:
//			PrintText = "EFFICACY.NONE";
//			break;	
//		case EFFICACY.ATTACK:
//			PrintText = "EFFICACY.ATTACK";
//			break;	
//		case EFFICACY.WEAK:
//			PrintText = "EFFICACY.WEAK";
//			break;	
//		case EFFICACY.SUPPORT:
//			PrintText = "EFFICACY.SUPPORT";
//			break;	
//		case EFFICACY.HEAL:
//			PrintText = "EFFICACY.HEAL";
//			break;	
//		case EFFICACY.DEFENSE:
//			PrintText = "EFFICACY.DEFENSE";
//			break;	
//		case EFFICACY.OTHER:
//			PrintText = "EFFICACY.OTHER";
//			break;	
//		default:
//			print("++++++ Efficacy ERRPR ++++++" + "\n")
//			print("Efficacy : " + Efficacy + "\n")
//			ScriptStop();
//			break;
//	}
//	return PrintText;
//}


//function DebugPrint_PartyType(PartyType)
//{
//	local PrintText;
//	switch(PartyType)
//	{
//		case PARTYTYPE.S4:
//			PrintText = "PARTYTYPE.S4";
//			break;	
//		case PARTYTYPE.S3:
//			PrintText = "PARTYTYPE.S3";
//			break;	
//		case PARTYTYPE.S2:
//			PrintText = "PARTYTYPE.S2";
//			break;	
//		case PARTYTYPE.S1:
//			PrintText = "PARTYTYPE.S1";
//			break;	
//		case PARTYTYPE.SG:
//			PrintText = "PARTYTYPE.SG";
//			break;	
//		case PARTYTYPE.GS:
//			PrintText = "PARTYTYPE.GS";
//			break;	
//		case PARTYTYPE.G1:
//			PrintText = "PARTYTYPE.G1";
//			break;	
//		case PARTYTYPE.T1:
//			PrintText = "PARTYTYPE.T1";
//			break;	
//		default:
//			print("++++++ PartyType ERRPR ++++++" + "\n")
//			print("PartyType : " + PartyType + "\n")
//			ScriptStop();
//			break;
//	}
//	return PrintText;
//}

//function DebugPrint_Category(Category)
//{
//	local PrintText;
//	switch (Category)
//	{
//		case CATEGORY.NONE:
//			PrintText = "CATEGORY.NONE";
//			break;
//		case CATEGORY.PHYSICAL	:
//			PrintText = "CATEGORY.PHYSICAL";
//			break;
//		case CATEGORY.SPELL		:
//			PrintText = "CATEGORY.SPELL";
//			break;
//		case CATEGORY.ARTS	:
//			PrintText = "CATEGORY.ARTS";
//			break;
//		case CATEGORY.BREATH		:
//			PrintText = "CATEGORY.BREATH";
//			break;
//		case CATEGORY.DANCE		:
//			PrintText = "CATEGORY.DANCE";
//			break;
//		case CATEGORY.FEAT		:
//			PrintText = "CATEGORY.FEAT";
//			break;
//		case CATEGORY.ITEM		:
//			PrintText = "CATEGORY.ITEM";
//			break;
//		case CATEGORY.OTHER		:
//			PrintText = "CATEGORY.OTHER";
//			break;
//		default:
//			print("++++++ Category ERRPR ++++++" + "\n")
//			print("Category : " + Category + "\n")
//			ScriptStop();
//			break;
//	}
//	return PrintText;
//}

//function DebugPrint_MasterKind(MasterKind)
//{
//	local PrintText;
//	switch (MasterKind)
//	{
//		case MASTER_KIND.NONE:
//			PrintText = "MASTER_KIND.NONE";
//			break
//		case MASTER_KIND.PLAYER:
//			PrintText = "MASTER_KIND.PLAYER";
//			break
//		case MASTER_KIND.NOTYORIN:
//			PrintText = "MASTER_KIND.NOTYORIN";
//			break
//		case MASTER_KIND.NOTYORA_WOMEN:
//			PrintText = "MASTER_KIND.NOTYORA_WOMEN";
//			break
//		case MASTER_KIND.KING:
//			PrintText = "MASTER_KIND.KING";
//			break
//		case MASTER_KIND.JACK:
//			PrintText = "MASTER_KIND.JACK";
//			break
//		case MASTER_KIND.ACE:
//			PrintText = "MASTER_KIND.ACE";
//			break
//		case MASTER_KIND.ADVENTURER:
//			PrintText = "MASTER_KIND.ADVENTURER";
//			break
//		case MASTER_KIND.ADVENTURER_BLUE:
//			PrintText = "MASTER_KIND.ADVENTURER_BLUE";
//			break
//		case MASTER_KIND.ADVENTURER_GREEN:
//			PrintText = "MASTER_KIND.ADVENTURER_GREEN";
//			break
//		case MASTER_KIND.ADVENTURER_YELLOW:
//			PrintText = "MASTER_KIND.ADVENTURER_YELLOW";
//			break
//		case MASTER_KIND.ADVENTURER_ORANGE:
//			PrintText = "MASTER_KIND.ADVENTURER_ORANGE";
//			break
//		case MASTER_KIND.ADVENTURER_PURPLE:
//			PrintText = "MASTER_KIND.ADVENTURER_PURPLE";
//			break
//		case MASTER_KIND.ADVENTURER_BLACK:
//			PrintText = "MASTER_KIND.ADVENTURER_BLACK";
//			break
//		case MASTER_KIND.QUEEN:
//			PrintText = "MASTER_KIND.QUEEN";
//			break
//		case MASTER_KIND.RENATE:
//			PrintText = "MASTER_KIND.RENATE";
//			break
//		case MASTER_KIND.RUKIYA:
//			PrintText = "MASTER_KIND.RUKIYA";
//			break
//		case MASTER_KIND.DARK_MASTER:
//			PrintText = "MASTER_KIND.DARK_MASTER";
//			break
//		case MASTER_KIND.RESISTANCE_MAN:
//			PrintText = "MASTER_KIND.RESISTANCE_MAN";
//			break
//		case MASTER_KIND.RESISTANCE_WOMAN:
//			PrintText = "MASTER_KIND.RESISTANCE_WOMAN";
//			break
//		case MASTER_KIND.RESISTANCE_GENTLEMAN:
//			PrintText = "MASTER_KIND.RESISTANCE_GENTLEMAN";
//			break
//		case MASTER_KIND.IMMIGRANT_MAN:
//			PrintText = "MASTER_KIND.IMMIGRANT_MAN";
//			break
//		case MASTER_KIND.IMMIGRANT_WOMAN:
//			PrintText = "MASTER_KIND.IMMIGRANT_WOMAN";
//			break
//		case MASTER_KIND.IMMIGRANT_BOY:
//			PrintText = "MASTER_KIND.IMMIGRANT_BOY";
//			break
//		case MASTER_KIND.COOL:
//			PrintText = "MASTER_KIND.COOL";
//			break
//		case MASTER_KIND.SYNTHE:
//			PrintText = "MASTER_KIND.SYNTHE";
//			break
//		case MASTER_KIND.PROMETHEUS:
//			PrintText = "MASTER_KIND.PROMETHEUS";
//			break
//		case MASTER_KIND.MII:
//			PrintText = "MASTER_KIND.MII";
//			break
//		default:
//			print("++++++ MasterKind ERRPR ++++++" + "\n")
//			print("MasterKind : " + MasterKind + "\n")
//			ScriptStop();
//			break;
//	}
//	return PrintText;
//}

//function DebugPrint_ExistType(ExistType)
//{
//	local PrintText;
//	switch (ExistType)
//	{
//		case LIVETYPE.ACTIVE:
//			PrintText = "LIVETYPE.ACTIVE";
//			break;
//		case LIVETYPE.INACTIVE:
//			PrintText = "LIVETYPE.INACTIVE";
//			break;
//		case LIVETYPE.NONE:
//			PrintText = "LIVETYPE.NONE";
//			break;
//		default:
//			print("++++++ ExistType ERRPR ++++++" + "\n")
//			print("  DebugPrint_ExistType  " + "\n")
//			print("ExistType : " + ExistType + "\n")
//			ScriptStop();
//			break;
//	}
//	return PrintText;
//}

//function DebugPrint_PopStyle(PopStyle)
//{
//	local PrintText;
//	switch (PopStyle)
//	{
//		case POPSTYLE.DAMAGE_ALLY:
//			PrintText = "POPSTYLE.DAMAGE_ALLY";
//			break;
//		case POPSTYLE.DAMAGE_ENEMY:
//			PrintText = "POPSTYLE.DAMAGE_ENEMY";
//			break;
//		case POPSTYLE.DAMAGE_MP:
//			PrintText = "POPSTYLE.DAMAGE_MP";
//			break;
//		case POPSTYLE.TENSION_UP:
//			PrintText = "POPSTYLE.TENSION_UP";
//			break;
//		case POPSTYLE.TENSION_DOWN:
//			PrintText = "POPSTYLE.TENSION_DOWN";
//			break;
//		case POPSTYLE.HEAL_HP:
//			PrintText = "POPSTYLE.HEAL_HP";
//			break;
//		case POPSTYLE.HEAL_MP:
//			PrintText = "POPSTYLE.HEAL_MP";
//			break;
//		case POPSTYLE.NONE:
//			PrintText = "POPSTYLE.DAMAGE_ALLY";
//			break;
//		default:
//			print("++++++ PopStyle ERRPR ++++++" + "\n")
//			print("  DebugPrint_PopStyle  " + "\n")
//			print("PopStyle : " + PopStyle + "\n")
//			ScriptStop();
//			break;
//	}
//	return PrintText;
//}

//function DebugPrint_ExecMissType()
//{
//	local PrintText;
//	switch (GetExecMissType_())
//	{
//		case EXEC_MISS_TYPE.NONE:
//			PrintText = "EXEC_MISS_TYPE.NONE";
//			break;
//		case EXEC_MISS_TYPE.LACK_MP:
//			PrintText = "EXEC_MISS_TYPE.LACK_MP";
//			break;
//		case EXEC_MISS_TYPE.MIST:
//			PrintText = "EXEC_MISS_TYPE.MIST";
//			break;
//		case EXEC_MISS_TYPE.DIFFERENT_SIZE:
//			PrintText = "EXEC_MISS_TYPE.DIFFERENT_SIZE";
//			break;
//		case EXEC_MISS_TYPE.OVERLAP:
//			PrintText = "EXEC_MISS_TYPE.OVERLAP";
//			break;
//		case EXEC_MISS_TYPE.MISS:
//			PrintText = "EXEC_MISS_TYPE.MISS";
//			break;
//		case EXEC_MISS_TYPE.LACK_TS:
//			PrintText = "EXEC_MISS_TYPE.MISS";
//			break;
//		default:
//			print("++++++ ExecMissType ERRPR ++++++" + "\n")
//			print("  DebugPrint_ExecMissType  " + "\n")
//			print("ExecMissType : " + GetExecMissType_() + "\n")
//			ScriptStop();
//			break;
//	}
//	return PrintText;
//}

//function�pDebugPrint�i1List�Łj
//FuncName				: �֐���
//ArgList				: �֐��p����
//�P��List�őS�Ă��s���ꍇ�p�ł��B
//���̍ۂ�
//��Ԗ�	�F�֐��p������
//�����Ԗ�	�F�֐��p������
//�Ƃ��Ă�������
//�����o�͂��s�v�ȏꍇ��ArgList��null��n���Ă��������B
//�֐����o�͗p�i�T���v���j
//local ArgList =	["MultiCount"	,	MultiCount
//					,"MultiCount"	,	MultiCount
//					,"MultiCount"	,	MultiCount
//					]
//function DebugPrint_functionParam(FuncName , ArgList)
//{
//	print("----- << function : " + FuncName + " >> -----" + "\n")
//	
//	//�ϐ��o�͂�����ꍇ�͈ȉ�
//	if(ArgList != null){
//		local MaxTextLenge_NameList = 0;
//		for(local i = 0 ; i < ArgList.len() ; i = i+2){
//			if(MaxTextLenge_NameList < ArgList[i].len()){
//				MaxTextLenge_NameList = ArgList[i].len();
//			}
//		}
//		for(local i = 0 ; i < ArgList.len() ; i = i+2){
//			local TextSpace = ""
//			if(MaxTextLenge_NameList > ArgList[i].len()){
//				for(local l = 0 ; MaxTextLenge_NameList > ArgList[i].len() + l ; l++){
//					TextSpace = TextSpace + " ";
//				}
//			}
//			print(ArgList[i] + TextSpace +" : " + ArgList[i + 1] + "\n")
//		}
//	}
//	
//	print("---------------------------------" + "\n")
//}

//�f�o�b�O�e�L�X�g�p�u�������e�L�X�g
function DebugPrint_OneList_Template(Text)
{
	//�T���v��
	switch(Text)
	{
	case "LINE":
		Text = "---------------------------------------";
		break;
	case "DOUBLELINE":
		Text = "=======================================";
		break;
	default:
		break;
	}
	return Text;
}

//���X�g�o��DebugPrint�p
//���X�g�`���̃e�L�X�g�t�@�C�����Q�v�f���o�͂���B
//List			: �o�͂���z��
//				  ["PrintText"		,	Number]�Ƃ����
//				  PrintText       : Number
//				  �Əo�͂����i�Q�v�f�ږ��ŉ��s�j
//ListStart		: �ŏ��ɏ��������e�L�X�g�i������j�A�s�v�ȏꍇ��null
//ListEnd		: �Ō�ɏ��������e�L�X�g�i������j�A�s�v�ȏꍇ��null
//ListFront		: ���X�g�o�͎��̑O�ɏ��������e�L�X�g�i������j�A�s�v�ȏꍇ��null
//				  �Ⴆ��"�E"�Ɛݒ肵���ꍇ�AList�o�͎���
//�ȉ��T���v��
//local ListStart =	"��������͂��܂�"
//local ListFront =	"�E"
//local List =			["PrintText"		,	PrintText
//						,"MultiCount"	,	MultiCount
//						]
//local ListEnd =		"�����ŏI���"
//DebugPrint_OneList(List , ListStart , ListEnd , ListFront)
function DebugPrint_OneList(List , ListStart , ListEnd , ListFront)
{
	if(ListStart != null){
		ListStart = DebugPrint_OneList_Template(ListStart);
		print(ListStart + "\n")
	}
	
	//List�̏o��
	if(List != null){
		local MaxTextLenge_NameList = 0;
		for(local i = 0 ; i < List.len() ; i = i+2){
			if(MaxTextLenge_NameList < List[i].len()){
				MaxTextLenge_NameList = List[i].len();
			}
		}
		//List�̏o��
		for(local i = 0 ; i < List.len() ; i = i+2){
			//ListFront�̏o��
			if(ListFront != null){print(ListFront);}
			//�P�v�f�ڂ̏o��
			local TextSpace = ""
			if(MaxTextLenge_NameList > List[i].len()){
				for(local l = 0 ; MaxTextLenge_NameList > List[i].len() + l ; l++){
					TextSpace = TextSpace + " ";
				}
			}
			print(List[i] + TextSpace +" : ")
			//�Q�v�f�ڂ̏o��
			print(List[i + 1] + "\n")
		}
	}
	
	//�ŏI�i�ɏo��
	if(ListEnd != null){
		ListEnd = DebugPrint_OneList_Template(ListEnd);
		print(ListEnd + "\n")
	}	
}

//Debug�pcActionPrint

function Debug_cActionPrint(cAction)
{
}


/*
function Debug_cActionPrint(cAction)
{
	if(DEBUG_CACTIONPRINTFLAG == "false"){
		return;
	}
	//�X�J�E�g�A�^�b�N���̓X�L�b�v����B
	if(IsScout_()){return;}
	
	//�z�u�f�[�^�̓ǂݑւ�
	//ChangeIndexPointData_(PERSONAL_POINT_DATA);
	
	local MultiCount				= cAction.MultiCount
	local Actor						= GetActorIndex_(MultiCount)
	local TargetNum					= GetTargetNum_(MultiCount)
	local TargetType				= GetTargetType_(MultiCount)
	local SingleEffect1				= cAction.SingleActEffect0_Name;
	local SingleEffectFrame1		= cAction.SingleActEffect0_Frame;
	local SingleEffect2				= cAction.SingleActEffect1_Name;
	local SingleEffectFrame2		= cAction.SingleActEffect1_Frame;
	local AllEffect1				= cAction.AllActEffect0_Name;
	local AllEffectFrame1			= cAction.AllActEffect0_Frame;
	local AllEffect2				= cAction.AllActEffect1_Name;
	local AllEffectFrame2			= cAction.AllActEffect1_Frame;
	local IsTargetSingle			= IsTargetSingle_(MultiCount)
	local UseMp						= GetUseMp_(MultiCount)
	local Efficacy					= GetActionEfficacy_(MultiCount);
	local IsScout					= IsScout_();
	local Category					= GetActionCategory_(MultiCount);
	local AllyTortalAppealPoint	= 0;
	local EnemyTortalAppealPoint= 0;
	local AllyRideMaster			= GetMasterKind_(true)
	local EnemyRideMaster			= GetMasterKind_(false)
	local IsTokugi					= IsTokugi_(MultiCount)
	local IsTeraAttack				= false
	local ExecMissType				= DebugPrint_ExecMissType()
	print("Actor					: " + Actor + "\n")
	print("TargetNum				: " + TargetNum + "\n")
	print("TargetType				: " + DebugPrint_TargetType(TargetType) + "\n")
	print("SingleEffect1				: " + SingleEffect1 + "\n")
	print("SingleEffectFrame1			: " + SingleEffectFrame1 + "\n")
	print("SingleEffect2				: " + SingleEffect2 + "\n")
	print("SingleEffectFrame2			: " + SingleEffectFrame2 + "\n")
	print("AllEffect1				: " + AllEffect1 + "\n")
	print("AllEffectFrame1				: " + AllEffectFrame1 + "\n")
	print("AllEffect2				: " + AllEffect2 + "\n")
	print("AllEffectFrame2				: " + AllEffectFrame2 + "\n")
	print("EffectFrame_DamageDirectionWait		: " + cAction.EffectFrame_DamageDirectionWait + "\n")
	print("EffectFrame_EndWait			: " + cAction.EffectFrame_EndWait + "\n")
	print("IsTargetSingle				: " + IsTargetSingle + "\n")
	print("UseMp					: " + UseMp + "\n")
	print("Efficacy				: " + DebugPrint_Efficacy(Efficacy) + "\n")
	print("IsScout					: " + IsScout + "\n")
	print("IsTokugi				: " + IsTokugi + "\n")
	print("ExecMissType				: " + ExecMissType + "\n")
	if(GetActorIndex_(MultiCount) == INVALID_CHARACTER || IsMaster_(GetActorIndex_(MultiCount)) == true){
		IsTeraAttack				= IsTeraAttack_(MultiCount)
	}
	print("IsTeraAttack				: " + IsTeraAttack + "\n");
	print("AllyMasterKind				: " + DebugPrint_MasterKind(AllyRideMaster) + "\n")
	print("EnemyMasterKind				: " + DebugPrint_MasterKind(EnemyRideMaster) + "\n")
	if(IsScout != true){
		//�X�J�E�g���ɂ͎Q�Ƃ��Ȃ�
		print("Category				: " + DebugPrint_Category(Category) + "\n")
	}
	for(local IndexCount = 0 ; IndexCount < TargetNum ; IndexCount++){
		local Target		= GetTargetIndex_(MultiCount,IndexCount);
		if(Target == INVALID_CHARACTER){return;}
		local cMonster			= cMonsterInfo(Target);
		local ActHitNum			= GetActHitNum_(MultiCount,IndexCount);
		local DamageType		=  GetDamageType_(MultiCount,IndexCount);
		local IsRezaoral		= IsRezaoral_(MultiCount,IndexCount);
		local IsAngel			= IsAngel_(MultiCount,IndexCount);
		local GetRevivalValue	= GetRevivalValue_(MultiCount,IndexCount);
		local AllyApealPoint	= GetAllyAppealPoint_(MultiCount, IndexCount);
		local EnemyAppealPoint	= GetEnemyAppealPoint_(MultiCount, IndexCount);
		local IsRide			= IsRide_(Target)
		local IsLivingDead		= IsLivingDead_(MultiCount,IndexCount)
		local IsBraveHart		= IsBraveHart_(MultiCount,IndexCount)
		local IsLastStand		= IsLastStand_(MultiCount,IndexCount)
		AllyTortalAppealPoint	= AllyTortalAppealPoint + AllyApealPoint;
		EnemyTortalAppealPoint	= EnemyTortalAppealPoint + EnemyAppealPoint
		print("- - - - - - - - - - - - - - - - - - - - - - - - " + "\n")
		print("IndexCount				: " + IndexCount + "\n")
		print("Target					: " + Target + "\n")
		print("cMonster.Size				: " + DebugPrint_MonsterSize(cMonster.Size) + "\n")
		print("cMonster.EffectSize			: " + cMonster.EffectSize + "\n")
		print("cMonster.HighRankEffectSize		: " + cMonster.HighRankEffectSize + "\n")
		print("ActHitNum				: " + ActHitNum + "\n")
		print("DamageType				: " + DebugPrint_DamageType(DamageType) + "\n")
		print("IsRezaoral				: " + IsRezaoral + "\n")
		print("IsAngel					: " + IsAngel + "\n")
		print("GetRevivalValue				: " + GetRevivalValue + "\n")
		print("AllyApealPoint				: " + AllyApealPoint + "\n")
		print("EnemyAppealPoint			: " + EnemyAppealPoint + "\n")
		print("IsRide					: " + IsRide + "\n")
		print("IsLivingDead				: " + IsLivingDead + "\n")
		print("IsBraveHart				: " + IsBraveHart + "\n")
		print("IsLastStand				: " + IsLastStand + "\n")
		if(IsTeraAttack == true){
			local TeraDamageValue = GetTeraDamageValue_(MultiCount,IndexCount)
			print("TeraDamageValue				: " + TeraDamageValue + "\n")
		}
		for(local MultiStageCount = 0 ; MultiStageCount < ActHitNum ; MultiStageCount++){
			local DamageValue		= GetDamageValue_(MultiCount,IndexCount,MultiStageCount);
			local IsCritical		= IsCritical_(MultiCount , IndexCount, MultiStageCount);
			local IsMiss			= IsMiss_(MultiCount , IndexCount, MultiStageCount);
			local IsDead			= IsDead_(MultiCount , IndexCount);
			local IsGuard			= IsGuard_(MultiCount , IndexCount);
			local IsAbsorption		= IsAbsorb_(MultiCount , IndexCount)
			local IsReflect			= IsReflect_(MultiCount , IndexCount);
			local IsRevival			= IsRevival_(MultiCount , IndexCount);
			local IsPoisonDamage	= IsPoisonDamage_(MultiCount , IndexCount);
			local IsGambleBody		= IsGambleBody_(MultiCount , IndexCount , MultiStageCount);
			local IsCriticalGuard	= IsActiveCriticalGuard(MultiCount , IndexCount, MultiStageCount);
			print("*" + "MultiStageCount			: " + MultiStageCount + "\n")
			print(" " + "DamageValue				: " + DamageValue + "\n")
			print(" " + "IsCritical				: " + IsCritical + "\n")
			print(" " + "IsMiss					: " + IsMiss + "\n")
			print(" " + "IsDead					: " + IsDead + "\n")
			print(" " + "IsGuard				: " + IsGuard + "\n")
			print(" " + "IsAbsorption				: " + IsAbsorption + "\n")
			print(" " + "IsReflect				: " + IsReflect + "\n")
			print(" " + "IsRevival				: " + IsRevival + "\n")
			print(" " + "IsPoisonDamage				: " + IsPoisonDamage + "\n")
			print(" " + "IsGambleBody				: " + IsGambleBody + "\n")
			print(" " + "IsCriticalGuard			: " + IsCriticalGuard + "\n")
			
		}
		if(ActHitNum == 0){
			local MultiStageCount = 0;
			local DamageValue		= GetDamageValue_(MultiCount,IndexCount,MultiStageCount);
			local IsCritical		= IsCritical_(MultiCount , IndexCount, MultiStageCount);
			local IsMiss			= IsMiss_(MultiCount , IndexCount, MultiStageCount);
			local IsDead			= IsDead_(MultiCount , IndexCount);
			local IsGuard			= IsGuard_(MultiCount , IndexCount);
			local IsAbsorption		= IsAbsorb_(MultiCount , IndexCount)
			local IsReflect			= IsReflect_(MultiCount , IndexCount);
			local IsRevival			= IsRevival_(MultiCount , IndexCount);
			local IsPoisonDamage	= IsPoisonDamage_(MultiCount , IndexCount);
			local IsGambleBody		= IsGambleBody_(MultiCount , IndexCount , MultiStageCount);
			local IsCriticalGuard	= IsActiveCriticalGuard(MultiCount , IndexCount, MultiStageCount);
			print("*" + "MultiStageCount			: " + MultiStageCount + "\n")
			print(" " + "DamageValue				: " + DamageValue + "\n")
			print(" " + "IsCritical				: " + IsCritical + "\n")
			print(" " + "IsMiss					: " + IsMiss + "\n")
			print(" " + "IsDead					: " + IsDead + "\n")
			print(" " + "IsGuard				: " + IsGuard + "\n")
			print(" " + "IsAbsorption				: " + IsAbsorption + "\n")
			print(" " + "IsReflect				: " + IsReflect + "\n")
			print(" " + "IsRevival				: " + IsRevival + "\n")
			print(" " + "IsPoisonDamage				: " + IsPoisonDamage + "\n")
			print(" " + "IsGambleBody				: " + IsGambleBody + "\n")
			print(" " + "IsCriticalGuard			: " + IsCriticalGuard + "\n")
		}
		for(local State = STATUS_TOP ; State < STATUS_NUM ; State++){
			local NowStateValue		= GetMonsterStatusValue_(State, Target);
			local StateValue		= GetStatusValue_(State, MultiCount , IndexCount);
			local StateFlag			= GetStatusFlag_(State, MultiCount , IndexCount);
			local StateEndFlag		= GetStatusEndFlag_(State, MultiCount , IndexCount);
			if(NowStateValue != 0){
				print("**" + "gStateData[" + State + "].Name			: " + gStateData[State].Name + "\n")
				print("  " + "NowStateValue				: " + NowStateValue + "\n");
			}
			if(StateValue != 0){
				print("**" + "gStateData["+ State + "].Name			: " + gStateData[State].Name + "\n")
				print("  " + "StateValue				: " + StateValue + "\n")
				print("  " + "StateFlag				: " + StateFlag + "\n")
			}
			if(StateEndFlag == true){
				print("  " + "StateEndFlag				: " + StateEndFlag + "\n")
				
			}
			if(StateValue != 0 ||  StateEndFlag == true){
				print("  " + "gStateData[" + State + "].Up_Effect		: " + gStateData[State].Up_Effect + "\n")
				print("  " + "gStateData[" + State + "].Up_Motion		: " + gStateData[State].Up_Motion + "\n")
				print("  " + "gStateData[" + State + "].Up_Wait		: " + gStateData[State].Up_Wait + "\n")
				print("  " + "gStateData[" + State + "].Up_MissPop		: " + gStateData[State].Up_MissPop + "\n")
				print("  " + "gStateData[" + State + "].Down_Effect		: " + gStateData[State].Down_Effect + "\n")
				print("  " + "gStateData[" + State + "].Down_Motion		: " + gStateData[State].Down_Motion + "\n")
				print("  " + "gStateData[" + State + "].Down_Wait		: " + gStateData[State].Down_Wait + "\n")
				print("  " + "gStateData[" + State + "].Down_MissPop		: " + gStateData[State].Down_MissPop + "\n")
				print("  " + "gStateData[" + State + "].Reset_Wait		: " + gStateData[State].Reset_Wait + "\n")
			}
		}

	}
	print("- - - - - - - - - - - - - - - - - - - - - - - - " + "\n")
	local Target = GetTargetIndex_(MultiCount,0);
	if(Target != INVALID_CHARACTER){
		local cParty = cFullPartyInfo(Target)
		print("cParty.PartyType		: " + DebugPrint_PartyType(cParty.PartyType) + "\n")
		for(local i = 0 ; i < cParty.PartyNum ; i++){
			print("cParty.Index[" + i +"]			: " + cParty.Index[i] + "\n")
			print("cParty.Type[" + i +"]			: " + DebugPrint_ExistType(cParty.Type[i]) + "\n")
			print("cParty.Size[" + i +"]			: " + DebugPrint_MonsterSize(cParty.Size[i]) + "\n")
			print("cParty.Empty[" + i +"]			: " + cParty.Empty[i] + "\n")
		}
		
		print("cParty.CamEmpty_Area		: " + cParty.CamEmpty_Area + "\n")
		print("cParty.CamTgtEmpty_Area		: " + cParty.CamTgtEmpty_Area + "\n")
		print("cParty.Empty_Master		: " + cParty.Empty_Master + "\n")
		print("cParty.Rotate_Master		: " + cParty.Rotate_Master + "\n")
		print("cParty.CamEmpty_Master		: " + cParty.CamEmpty_Master + "\n")
		print("cParty.CamTgtEmpty_Master	: " + cParty.CamTgtEmpty_Master + "\n")
		if(cParty.EffectEmpty_Area != null){
			print("cParty.EffectEmpty_Area		: " + cParty.EffectEmpty_Area + "\n")
			print("cParty.EffectScale_Area		: " + cParty.EffectScale_Area + "\n")
		}
	}
	
	print("- - - - - - - - - - - - - - - - - - - - - - - - " + "\n")
	print("ApealPoint" + "\n")
	print("AllyTortalAppealPoint	: " + AllyTortalAppealPoint + "\n")
	print("EnemyTortalAppealPoint	: " + EnemyTortalAppealPoint + "\n")	
	
	
	print("------------------------------------------------" + "\n")
}
*/