//�萔��`

//�֐��Ǘ��p
FUNCTION_STACK <- 0;

//DebugPrintFlag
const	DEBUG_CACTIONPRINTFLAG = "true";

// �����X�^�[���[�V����ID��`=====
const MOT_WAIT					= 0;				// �ҋ@�i���[�v�j
const MOT_MOVE_LOOP				= 1;				// ����i���[�v�j
const MOT_WALK_LOOP				= 2;				// �����i���[�v�j
const MOT_JUMP_UP				= 3;				// �W�����v�i�㏸���j
const MOT_JUMP_DOWN				= 4;				// �W�����v�i���~���j
const MOT_DAMAGE				= 7;				// �_���[�W
const MOT_ATTACK				= 8;				// �U��
const MOT_PARTICULAR_START		= 9;				// ����i�J�n�j
const MOT_PARTICULAR_CHANT 		= 10;				// ����i�r���j
const MOT_PARTICULAR_EXERCISE	= 11;				// ����i�����j
const MOT_SWORD_START			= 12;				// ���Z�i�J�n�j
const MOT_SWORD_CHARGE			= 13;				// ���Z�i���ߒ��j
const MOT_SWORD_EXERCISE		= 14;				// ���Z�i�����j

// �}�X�^�[���[�V����ID��`
const MOT_SLIP					= 7;				// ��������J�n
const MOT_SLIP_LOOP				= 8;				// ����������[�v
const MOT_SCOUT					= 9;				// �X�J�E�g�J�n
const MOT_SCOUT_LOOP			= 10;				// �X�J�E�g���[�v
const MOT_BATTLE_WAIT			= 11;				// �퓬�ҋ@
const MOT_WIN					= 12;				// �퓬����
const MOT_WIN_LOOP				= 13;				// �퓬�������[�v
const MOT_LOSE					= 14;				// �퓬�s�k
const MOT_USE_ITEM				= 15;				// �A�C�e���g�p
const MOT_USE_ITEM_LOOP			= 16;				// �A�C�e���g�p���[�v
const MOT_CHANGE_RIDE			= 17;				// ���C�h��芷��

// �d�l�z�u�f�[�^==================
const PERSONAL_POINT_DATA		= 0;
const BATTLE_COMMON_POINT_DATA	= 1;

// �|�b�v�̔z�u���W==============
gPopMaxNum	<- 4

// �J�b�g�C���̎��==============
const CUTIN_RIDE_LINK			= 1;				// ���C�h�A�g
const CUTIN_SCOUT				= 2;				// �X�J�E�g�A�^�b�N

// �����^�C�v====================
enum LIVETYPE{
	ACTIVE			// �����Ă���
	INACTIVE		// ����ł���
	NONE			// ���̑��i�p�[�e�B�Ƃ��đ��݂��Ȃ��A���j
}

// ������======================
enum EFFICACY{
	NONE			// �Ȃ�
	ATTACK			// �U��
	WEAK			// ���
	SUPPORT			// ����
	HEAL 			// ��
	DEFENSE			// �h��
	OTHER			// ���̑�
}

// �s������======================
enum CATEGORY{
	NONE		// �Ȃ�
	PHYSICAL	// ����
	SPELL		// ����
	ARTS		// �̋Z
	BREATH		// �u���X
	DANCE		// �x��
	FEAT		// ����
	ITEM		// �A�C�e��
	OTHER		// ���̑�
}

// ���s����======================
enum EXEC_MISS_TYPE{
	NONE			// �Ȃ�
	LACK_MP			// �l�o�s��
	MIST			// ��
	DIFFERENT_SIZE	// �T�C�Y�Ⴂ
	OVERLAP			// ���E
	MISS			// ���������𖞂����Ă��Ȃ�
	LACK_TS			// �e���V�����s��
	AES_MISS		// AES�̍s�����~�X����
}

// �|�b�v�̎��===================
enum POPSTYLE{
	DAMAGE_ALLY		// �G�ɗ^����_���[�W
	DAMAGE_ENEMY	// �G����󂯂�_���[�W
	DAMAGE_MP		// MP�_���[�W
	TENSION_UP		// �e���V�����㏸
	TENSION_DOWN	// �e���V�������~
	HEAL_HP			// HP��
	HEAL_MP			// MP��
	NONE			// �w�i����(��Ԉُ편�s�Ȃ�)
}

// �����X�^�[���󂯂�e���̎��===
enum AFFECT_PARAM{
	NONE		// �Ȃ�
	MAX_HP		// �ő�HP
	MAX_MP		// �ő�MP
	HP			// HP
	MP			// MP
	AT			// �U��
	DF			// ���
	QC			// �f����
	WS			// ����
	TS			// �e���V����
	HMP			// HP��MP
}

// �Ώ�
enum TARGET
{
	NONE				// �Ȃ�
	ALLY				// ����
	ALLY_ALL			// �����S��
	ALLY_RANDOM 		// ���������_��
	ALLY_MULTI_RANDOM 	// �������������_��
	ALLY_ENEMY			// �G�����P��
	ALL					// �S��
	ENEMY				// �G
	ENEMY_ALL			// �G�S��
	ENEMY_RANDOM		// �G�����_��
	BAKURETSU			// 2��ڈȍ~�����_��
	SELF				// �������g
	RANDOM				// �S�������_��
	FIELD				// �t�B�[���h
	OTHER				// ���̑�
}

//PartyType_enum
enum PARTYTYPE{
	S4
	S3
	S2
	S1
	SG
	GS
	G1
	T1
}

//�ǂ̐w�c���搧������
enum PREEMPTSIDE{
	NONE
	ALLY
	ENEMY
}

//�}�X�^�[�̎��
enum MASTER_KIND{
	NONE
	PLAYER
	NOTYORIN
	NOTYORA_WOMEN
	KING
	JACK
	ACE
	ADVENTURER
	ADVENTURER_BLUE
	ADVENTURER_GREEN
	ADVENTURER_YELLOW
	ADVENTURER_ORANGE
	ADVENTURER_PURPLE
	ADVENTURER_BLACK
	QUEEN
	RENATE
	RUKIYA
	DARK_MASTER
	RESISTANCE_MAN
	RESISTANCE_WOMAN
	RESISTANCE_GENTLEMAN
	IMMIGRANT_MAN
	IMMIGRANT_WOMAN
	IMMIGRANT_BOY
	COOL
	SYNTHE
	PROMETHEUS
	MII
}	

//Motion�Đ����ԑ҂�
const	ATTACKMOTIONWAIT = 21;

// �X�e�[�^�X�̎��===
enum	STATUS{
	 NONE				// 00:�Ȃ�
	 TENSION			// 01:�e���V����
	 ATTACK				// 02:�U����
	 DEFENCE			// 03:�����
	 QUICK				// 04:�f����
	 WISE				// 05:����
	 CONFUSION			// 06:����
	 SLEEP				// 07:����
	 PARALYSIS			// 08:�}�q
	 MIND				// 09:�x��
	 POISON				// 10:��
	 CURSE				// 11:��
	 DEATH				// 12:���S
	 ERASE				// 13:�h���s��
	 HPMAX_DOWN			// 14:�ő�HP����
	 MPMAX_DOWN			// 15:�ő�MP����
	 HIT				// 16:����
	 DODGE				// 17:���
	 MAHOHACK			// 18:�ϐ�
	 DUMMY_01			// 19:����(�_�~�[)
	 FEAT_UP			// 20:����������
	 CHANGE				// 21:�X�e�[�^�X����
	 INCITE				// 22:�ΏیŒ�(���傤�͂�)
	 HIDE				// 23:�Ώۏ��O(�������)
	 TACTICS_SEAL		// 24:��핕��
	 NOTICE_DEATH		// 25:���S�\��	
	 GUARD				// 26:�h��
	 DUMMY_02			// 27:��h��
	 DESPERATE			// 28:�_���[�W�Q�{(�̂Đg)
	 INHALEBREATH		// 29:���_���[�W�␳
	 ATACANTA			// 30:��������
	 MAHOCANTA			// 31:��������
	 TENCHI				// 32:��������(�P��)
	 MAHOTURN			// 33:��������(�P��)
	 KYOTENDOCHI		// 34:�̋Z����(�P��)
	 REVERSEWIND		// 35:������(���)
	 REVERSETURN		// 36:�x�蔽��(���)
	 PREDICT_PHYSICAL	// 37:�����\��
	 PREDICT_SPELL		// 38:�����\��
	 PREDICT_ARTS		// 39:�̋Z�\��
	 PREDICT_BREATH		// 40:���\��
	 PREDICT_DANCE		// 41:�x��\��
	 PREDICT_RECORD		// 42:�L�^����
	 PREDICT_FIELD		// 43:���ԗ\��
	 ASTRON				// 44:���ʖ���
	 CURTAIN			// 45:���ʖ����i1�����j
	 SWAPTARGET			// 46:�Ώی���
	 REHOIMI			// 47:�p����
	 REZAORAL			// 48:�����h��
	 eSTATUS_FANATICISM // 49:���M
	 CHAIN				// 50:�`�F�C��
	 DUMMY_05			// 51:�̋Z����
	 DUMMY_06			// 52:�񕜖���
	 DUMMY_07			// 53:�������
	 DUMMY_08			// 54:�s�����t�]
	 DUMMY_09			// 55:�s���������_��
	 DUMMY_10			// 56:�s���񐔐���
	 DUMMY_04			// 57:�s�����A��
	 DECREACE_ATTACK	// 58:�U���͌���
	 DECREACE_DEFENCE	// 59:����͌���
	 DECREACE_SPEED		// 60:�f��������
	 DECREACE_WISE		// 61:��������
	 ANGRY				// 62:�{��
	 LUCKY				// 63:���b�L�[
	 SUPERLUCKY			// 64:�X�[�p�[���b�L�[
	 UNLUCKY			// 65:�A�����b�L�[
	 DEADACTION			// 66:���S���s��
	 DUMMY_11			// 67:���₵�̉J�i�������j
	 DUMMY_12			// 68:�����ꂢ�̂����i�������j
	 STEALTHATTACK		// 69:�X�e���X�A�^�b�N�i�������j
	 DUMMY_14			// 70:������Ȃ��i�������j
	 DUMMY_15			// 71:��������Â��i�������j
	 HEALINGE_FLUTE		// 72:���₵�̂ӂ��i�������j
	 REPOSE_FLUTE		// 73:�₷�炬�̂ӂ��i�������j
	 FIGHT_FLUTE		// 74:���������̂ӂ��i�������j
	 GUARD_FLUTE		// 75:�܂���̂ӂ��i�������j
	 FALCON_FLUTE		// 76:�n���u�T�̂ӂ��i�������j
	 WISE_FLUTE			// 77:�������̂ӂ��i�������j
	 RIDE				// 78:���C�h
}
const	STATUS_NUM				= 78// �X�e�[�^�X�̌�
const	STATUS_TOP				= 1 // �X�e�[�^�X�̐擪

enum FIELD
{
	NORMAL,		// �ʏ�

	REVERS,		// ���o�[�X
	SHUFFLE,	// �V���b�t��
	SLOW,		// �X���[�y�[�X
	
	REDMIST,	// �Ԃ���
	BLACKMIST,	// ������
	WHITEMIST,	// ������
	DARKMIST,	// ���E�̖�
	BLUEMIST,	// �V��̖�

	FAINTNESS,	// ����傭�̏�
	CRUSH,		// �ӂ񂳂��̏�
	SLOW,		// �ǂ񂻂��̏�
	INNOCENT,	// ����񂵂�̏�
};

enum RIDE_MOTION_ID
{
	WAIT,
	WALK,
};

const INVALID_CHARACTER			= 0;				// �����ȃL�����N�^�[�C���f�b�N�X

const	REVIVAL_EFFECT_NAME 	= "EF120_01_HOIMI";
const	HOLD_ON_EFFECT_NAME 	= "EF040_01_PROP_MOUJYA";
const	LIVING_DEAD_EFFECT_NAME = "EF040_01_PROP_MOUJYA";

// �C�x���g�֘A======================
const	BFG_TUTORIAL_RIDE = 50;
const	NUM_FLG_COUNT_UP_DEMO_834 = 124;

enum DARS_GALMA_FORM
{
	FIRST	// ���`��
	SECOND	// ���`��
	THIRD	// ��O�`��
}

