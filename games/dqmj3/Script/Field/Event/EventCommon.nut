// �O���[�o���ϐ�(NPC��C�x���g�n��)�Ȃǂ�����������ۂɎg���萔
const C_NONE_ID					=-1;

// �I������`=====
const QUERY_YES					= 1;		// �u�͂��v
const QUERY_NO					= 2;		// �u�������v

// �퓬����=======
const END_TYPE_NONE				= 0;
const END_TYPE_WIN				= 1;
const END_TYPE_LOSE				= 2;
const END_TYPE_DRAW				= 3;
const END_TYPE_FLEE				= 4;
const END_TYPE_SCOUT			= 5;

// ��b���̃J�����̐ݒ���s���ۂ̒萔
const TALK_CAMERA_DEF			= 0;		// �������Ȃ�
const TALK_CAMERA_UP			= 1;		// ��b����NPC���A�b�v�ɂ���ݒ�

// ���Z�萔
const ABILITY_RULER				= 0;
const ABILITY_FULLTANK			= 1;
const ABILITY_RANARUTA			= 2;
const ABILITY_RANARION			= 3;
const ABILITY_MAKE_UP			= 4;

// �C�x���g�Ŏ擾�ł���Œ�f�B�X�N�̃R�[�h�̒萔(14_00_�f�B�X�N�p�����[�^.xlsm�́u�R�[�h�v���Q��)
const FIX_DISC_CODE_1			= 199;		// �ŏ��́i���ԓ���j 
const FIX_DISC_CODE_2			= 161;		// �ӑĂȁi�����s�s�N���A�j 
const FIX_DISC_CODE_3			= 174;		// �L��  �i������ԁj

// �C�x���g�Ŏ擾�ł���Œ�f�B�X�N�̃��x���̒萔(03_00_�f�B�X�N.xlsx�́u�T�v�v���Q��)
const DISC_LEVEL_20				= 20;		// ���y�̗쓹�N���A��

// ���C��̐_�̃A�N�Z�T���h�c
const YATIHOKO_ACCE_ID			= 216;		// ���`�z�R(���̐_�̃A�N�Z�T��)
const WADATUMI_ACCE_ID			= 218;		// ���_�c�~(�C�̐_�̃A�N�Z�T��)
const HOAKARI_ACCE_ID			= 217;		// �z�A�J��(��̐_�̃A�N�Z�T��)

// ���C��̃X�^�[�s�[�X�̃A�C�e���h�c
const LAND_STAR_PIECE_ID		= 75;		// ���̃X�^�[�s�[�X
const SEA_STAR_PIECE_ID			= 78;		// �C�̃X�^�[�s�[�X
const SKY_STAR_PIECE_ID			= 81;		// ��̃X�^�[�s�[�X

// �Z���^�[�r���̓��G���x�[�^���A���W(�R�O�K)
const A03_01_RTN_POS_E_X		= 325.00;	// X
const A03_01_RTN_POS_E_Y		=   0.37;	// Y
const A03_01_RTN_POS_E_Z		=  -5.74;	// Z
// �Z���^�[�r���̓��G���x�[�^���A���W(�Q�X�K)
const A03_00_RTN_POS_E_X		= 325.00;	// X
const A03_00_RTN_POS_E_Y		=   1.00;	// Y
const A03_00_RTN_POS_E_Z		=  -0.40;	// Z
// �Z���^�[�r���̓��G���x�[�^���A���W(�P�K)
const A01_00_RTN_POS_E_X		= 150.00;	// X
const A01_00_RTN_POS_E_Y		=   0.00;	// Y
const A01_00_RTN_POS_E_Z		=   1.60;	// Z
// �Z���^�[�r���̓��G���x�[�^���A���W(�n���P�K)
const A01_01_RTN_POS_E_X		= 123.00;	// X
const A01_01_RTN_POS_E_Y		=   0.00;	// Y
const A01_01_RTN_POS_E_Z		=   0.00;	// Z

// �Z���^�[�r���̓��G���x�[�^���A����
const RTN_DIR_E					= -90;

// �Z���^�[�r���̐��G���x�[�^���A���W(�Q�X�K)
const A03_00_RTN_POS_W_X		= -325.00;	// X
const A03_00_RTN_POS_W_Y		=    0.40;	// Y
const A03_00_RTN_POS_W_Z		=   -0.93;	// Z
// �Z���^�[�r���̐��G���x�[�^���A���W(�P�K)
const A01_00_RTN_POS_W_X		= -150.00;	// X
const A01_00_RTN_POS_W_Y		=    0.00;	// Y
const A01_00_RTN_POS_W_Z		=    1.60;	// Z

// �Z���^�[�r���̐��G���x�[�^���A����
const RTN_DIR_W					= 90;

// �Z���^�[�r���̖k�G���x�[�^���A���W(�n���P�K)
const A01_01_RTN_POS_N_X		=  -12.60;	// X
const A01_01_RTN_POS_N_Y		=    0.00;	// Y
const A01_01_RTN_POS_N_Z		= -140.00;	// Z

// �Z���^�[�r���̖k�G���x�[�^���A���W(�n���Q�K)
const A01_02_RTN_POS_N_X		=    0.82;	// X
const A01_02_RTN_POS_N_Y		=  -15.00;	// Y
const A01_02_RTN_POS_N_Z		=-1110.00;	// Z

// �Z���^�[�r���̖k�G���x�[�^���A����
const RTN_DIR_N					= 0;

// �Z���^�[�r���̓���̂R�i�K�ڂ�������邽�߂̃A�C�e��ID
const ITEM_SHOP_EXTEND_ITEM_ID	= 912;		// �ǂ����̒B�l

// �Z���^�[�r���̓����̂R�i�K�ڂ�������邽�߂̃A�C�e��ID
const MEAT_SHOP_EXTEND_ITEM_ID	= 911;		// �������̋Ɉ�

// �{�����C���i�b�v���փA�C�e����ID
const BOOK_ITEM_ID_01			= 74;		// ��m�̋L�^�E�O��
const BOOK_ITEM_ID_02			= 76;		// ��m�̋L�^�E���
const BOOK_ITEM_ID_03			= 77;		// �m���̋L�^�E�O��
const BOOK_ITEM_ID_04			= 79;		// �m���̋L�^�E���
const BOOK_ITEM_ID_05			= 80;		// ���@�g���̋L�^�E�O��
const BOOK_ITEM_ID_06			= 82;		// ���@�g���̋L�^�E���
const BOOK_ITEM_ID_07			= 83;		// �����Ƃ̋L�^�E�O��
const BOOK_ITEM_ID_08			= 85;		// �����Ƃ̋L�^�E���
const BOOK_ITEM_ID_09			= 86;		// �����̋L�^�E�O��
const BOOK_ITEM_ID_10			= 88;		// �����̋L�^�E���
const BOOK_ITEM_ID_11			= 89;		// ���|�l�̋L�^�E�O��
const BOOK_ITEM_ID_12			= 91;		// ���|�l�̋L�^�E���

// �{���œn�����A�C�e���h�c�Ń��C���i�b�v�ɕ��ԏ�(���̂P)
const BOOK_LIST_01_ITEM_ID_01	= 592;		// ��m�̏�
const BOOK_LIST_01_ITEM_ID_02	= 846;		// ��m�̗͂̏�
const BOOK_LIST_01_ITEM_ID_03	= 594;		// �m���̏�
const BOOK_LIST_01_ITEM_ID_04	= 852;		// �m���̗͂̏�
const BOOK_LIST_01_ITEM_ID_05	= 593;		// ���@�g���̏�
const BOOK_LIST_01_ITEM_ID_06	= 849;		// ���@�g���̗͂̏�
const BOOK_LIST_01_ITEM_ID_07	= 595;		// �����Ƃ̏�
const BOOK_LIST_01_ITEM_ID_08	= 855;		// �����Ƃ̗͂̏�
const BOOK_LIST_01_ITEM_ID_09	= 596;		// �����̏�
const BOOK_LIST_01_ITEM_ID_10	= 858;		// �����̗͂̏�
const BOOK_LIST_01_ITEM_ID_11	= 597;		// ���|�l�̏�
const BOOK_LIST_01_ITEM_ID_12	= 861;		// ���|�l�̗͂̏�

// �{���œn�����A�C�e���h�c�Ń��C���i�b�v�ɕ��ԏ�(���̂Q)
const BOOK_LIST_02_ITEM_ID_01	= 845;		// ��m���K���̏�
const BOOK_LIST_02_ITEM_ID_02	= 847;		// ��m�̋Z�̏�
const BOOK_LIST_02_ITEM_ID_03	= 851;		// �m�����K���̏�
const BOOK_LIST_02_ITEM_ID_04	= 853;		// �m���̋Z�̏�
const BOOK_LIST_02_ITEM_ID_05	= 848;		// ���@�g�����K���̏�
const BOOK_LIST_02_ITEM_ID_06	= 850;		// ���@�g���̋Z�̏�
const BOOK_LIST_02_ITEM_ID_07	= 854;		// �����ƌ��K���̏�
const BOOK_LIST_02_ITEM_ID_08	= 856;		// �����Ƃ̋Z�̏�
const BOOK_LIST_02_ITEM_ID_09	= 857;		// �������K���̏�
const BOOK_LIST_02_ITEM_ID_10	= 859;		// �����̋Z�̏�
const BOOK_LIST_02_ITEM_ID_11	= 860;		// ���|�l���K���̏�
const BOOK_LIST_02_ITEM_ID_12	= 862;		// ���|�l�̋Z�̏�

// �������X�^�[�쐬�ɕK�v�ȃA�C�e��ID
const BREAK_BODY_ITEM_ID_01		= 921;		// ���X���C���̂��炾
const BREAK_MIND_ITEM_ID_01		=  65;		// �_�[�N�}�f�����C�g
const BREAK_BODY_ITEM_ID_02		= 922;		// ���L�����̂��炾
const BREAK_MIND_ITEM_ID_02		=  65;		// �_�[�N�}�f�����C�g
const BREAK_BODY_ITEM_ID_03		= 923;		// ���剤�C�J�̂��炾
const BREAK_MIND_ITEM_ID_03		=  65;		// �_�[�N�}�f�����C�g
const BREAK_BODY_ITEM_ID_04		= 924;		// ���L���O���U�[�h�̂��炾
const BREAK_MIND_ITEM_ID_04		=  65;		// �_�[�N�}�f�����C�g
const BREAK_BODY_ITEM_ID_05		= 925;		// ���ɂ������Ⴍ�̂��炾
const BREAK_MIND_ITEM_ID_05		=  65;		// �_�[�N�}�f�����C�g

// �������X�^�[�̎푰ID
const BREAK_MONSTER_01_ID		= 492;		// ���X���C��
const BREAK_MONSTER_02_ID		= 495;		// ���L����
const BREAK_MONSTER_03_ID		= 509;		// ���剤�C�J
const BREAK_MONSTER_04_ID		= 503;		// ���L���O���U�[�h
const BREAK_MONSTER_05_ID		= 505;		// ���ɂ������Ⴍ

// �A�C�e�������Œ��Ԃɂ��鎞�̋������X�^�[�̓GID
const BREAK_MONSTER_01_E_ID		= 1813;		// ���X���C��
const BREAK_MONSTER_02_E_ID		= 1814;		// ���L����
const BREAK_MONSTER_03_E_ID		= 1815;		// ���剤�C�J
const BREAK_MONSTER_04_E_ID		= 1816;		// ���L���O���U�[�h
const BREAK_MONSTER_05_E_ID		= 1817;		// ���ɂ������Ⴍ
const BREAK_MONSTER_06_E_ID		= 1818;		// ���G�X�^�[�N

// ���G�X�^�[�N�̃A�C�e��ID
const BREAK_ESTARK_01_ID		= 92;		// �鉤�̂��炾
const BREAK_ESTARK_02_ID		= 93;		// �鉤�̊��
const BREAK_ESTARK_03_ID		= 94;		// �鉤�̓{��
const BREAK_ESTARK_04_ID		= 95;		// �鉤�̈�����
const BREAK_ESTARK_05_ID		= 96;		// �鉤�̊y����

// ���C�h���̉�b�J�����ݒ�p��NPC_ID
const OFFSET_RENATE				= 1;
const OFFSET_RUKIYA				= 2;

// ���j���[=======
enum MENU_SCENE
{
 	COUPLING,			// �z��
 	VIRTUALCOLOSSEUM,	// �o�[�`�����R���V�A��
 	RACE_FACILITY,		// ���[�X��t
 	WIFI_BATTLE,		// Wi-Fi�o�g��
 	FREE_BATTLE,		// �g���[�j���O�o�g��
 	PROFILE_SETTING,	// �v���t�B�[���ݒ�
}

enum MENU_OPEN
{
 	DISC_FACILITY,		// �f�B�X�N�{��
 	ACCESSORY,			// �A�N�Z�T����
 	GOLD_BANK,			// ��s
 	WIFI_RANKING,		// Wi-Fi�����L���O
 	WIFI_SHOP,			// Wi-Fi�V���b�v
 	WIFI_DATA_DL,		// Wi-Fi�f�[�^�󂯎��
 	A01_00_ITEM,		// �m�`���[���L���O�_�� ���
 	A01_00_MEET,		// �m�`���[���L���O�_�� ����
 	A01_00_BOOK,		// �m�`���[���L���O�_�� �{��
 	A01_00_TEMP_0,		// �m�`���[���L���O�_�� �󂫘g
 	A01_00_TEMP_1,		// �m�`���[���L���O�_�� �󂫘g
 	H01_00_ITEM,		// �E�b�h�p�[�N ���
 	H01_00_TEMP_0,		// �E�b�h�p�[�N �󂫘g
 	G01_00_ITEM,		// �l�I���p�[�N ���
 	G01_00_TEMP_0,		// �l�I���p�[�N �󂫘g
 	I01_00_ITEM,		// �|�[���p�[�N ���
 	I01_00_TEMP_0,		// �|�[���p�[�N �󂫘g
 	S01_00_ITEM,		// �A���C�p�[�N ���
 	S01_00_TEMP_0,		// �A���C�p�[�N �󂫘g
 	V01_00_ITEM,		// �}�O�}�p�[�N ���
 	V01_00_TEMP_0,		// �}�O�}�p�[�N �󂫘g
 	DUNGEON_ITEM,		// �_���W���� ���
 	WIFI_ITEM,			// Wi-Fi ���
 	MASTER_MEET,		// �}�X�^�[ ����
 	LUGGAGE_OFFICE,		// �a�菊
}

// �t�B�[���h���j���[=======
// squierrel�̎d�l�ŁA�ŏ���1��ݒ肵�Ă����̍��ڂ�������0�ɂȂ�̂�
// �l��S�ē����
// FieldMenuDef �� eCOMMANDUID �ɑΉ�
enum FIELD_COMMAND
{
	TOOL = 1,				// ����
	SAVE = 2,				// �Z�[�u
	TACTICS = 3,			// ���
	LUGGAGEOFFICE = 4,		// �a�菊
	MONSTERABILITY = 5,		// �����X�^�[���Z
	LIBRARY = 6,			// ���C�u����
	PLAYERABILITY = 7,		// �v���C���[���Z
	EQUIPACCESSORY = 8,		// �A�N�Z�T���[����
	SKILLPOINT = 9,			// �X�L���|�C���g
	FIELDRIDE = 10,			// ���C�h�����X�^�[
	COMMUNICATION = 11,		// �ʐM
	INFORMATION = 12,		// ���т̂����낦
}

// �v���C���[���Z���j���[=======
// FieldMenuDef �� ePLAYERABILITYID �ɑΉ�
enum PLAYERABILITYID
{
	RULER,			// ���[��
	RANARUTA,		// ���i���[�^
	RANARION,		// ���i���I��
	MANTAN,			// �܂񂽂�
	COLOR_CHANGE	// �F�ւ�
}

// �i�r�}�b�v�A�C�R��
enum NAVIMAP_ICON
{
	S_BOX,				// �X�e���X�{�b�N�X
	CREVICE,			// ����̗􂯖�
	DESTINATION,		// �ړI�n
	DESTINATION_EFFECT,	// �ړI�n�G�t�F�N�g
	AREA_BORDER,		// �G���A��؂��
	EXCLAMATION,		// ���ׂ���ꏊ
	RULER_POINT,		// ���[���|�C���g
	STONE,				// �Δ�
	DIRECTION,			// �������
	MONSTER,			// �����X�^�[
	GOAL,				// �S�[��
}

// �i�r�}�b�v ���C�h�t�B���^
enum RIDE_FILTER
{
	HIGHJUMP,	// ���ド�C�h���ւōs����ꏊ
	DIVE,		// ������ւōs����ꏊ
	MULTIJUMP,	// ���i�W�����v���ւōs����ꏊ
}

// ���C�t�T�C�N��
enum SCHEDULE
{
	NOON,				// ��
	NIGHT,				// ��
}

// �����X�^�[�^�C�v
enum MONSTER_TYPE
{
	TERRA,				// ��
	AQUA,				// ��
	AERO,				// ��
}

// �����X�^�[�̌n��
enum MONSTER_LINEAGE
{
	NONE,		// �����l
	SLIME,		// �X���C��
	DRAGON,		// �h���S��
	BEAST,		// ���b
	NATURE,		// ���R
	DEVIL,		// ����
	ZOMBIE,		// �]���r
	MATERIAL,	// ����
	BREAK,		// �u���C�N
	UNKNOWN,	// ???
};

// ���p�[�e�B�����X�^�[�����N
enum MONSTER_RANK{
	NONE,		// �s���Ȓl
	F,
	E,
	D,
	C,
	B,
	A,
	S,
	SS,
};

// �������i�̃O���[�h�i���̐��j
enum EQUIP_GRADE{
	NONE,		// �Ȃ�
	GRADE_1,	// ��
	GRADE_2,	// ����
	GRADE_3,	// ������
};

// ������f�B�X�N�̎��
enum SPECIAL_DISC{
	METAL,		// ���^��
	SHINE,		// �����ӂ��
};

// ���ʐM�R�C���̎��
enum COIN_TYPE{
	BRONZE,
	SILVER,
	GOLD,
	PLATINA,
};

//=====================================================================================
// ���ʊ֐��F�m�o�b�z�u����
//-------------------------------------------------------------------------------------
// �������FNPC�̃��\�[�X��
// �������FFBX�̃m�[�h��
// �߂�l  �FNPC_ID
//=====================================================================================
function ReadAndArrangePointNpc(model_name, node)
{
	local model_id;
	local return_id;

	model_id  = ReadNpc_(model_name);
	return_id = ArrangePointNpc_(model_id, node);

	return return_id;
}

//============================================================================
// ���ʊ֐��F�P�t���[���Ńt�F�[�h�A�E�g����
//----------------------------------------------------------------------------
// �������FFADE_COLOR_BLACK or FADE_COLOR_WHITE
// �߂�l  �F�Ȃ�
//============================================================================
function CommChangeMomentFadeOut(color)
{
	SetFade_(FADE_OUT, color, FADE_SHORT);
	SetFadeSub_(FADE_OUT, color, FADE_SHORT);
	WaitFade_();
}

//============================================================================
// ���ʊ֐��FTouchNpc()���Ńf�����Ăяo��
//----------------------------------------------------------------------------
// �������F�Đ�����f���ԍ�
// �߂�l  �F�Ȃ�
//============================================================================
function TouchNpcChangeDemo(num)
{
	// �t�F�[�h�A�E�g 
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
	SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
	WaitFade_();
	
	ChangeDemo_(num); 
}

//============================================================================
// ���ʊ֐��FBGM���~�����Ȃ���f�����Ăяo��
//----------------------------------------------------------------------------
// �������F�Đ�����f���ԍ�
// �߂�l  �F�Ȃ�
//============================================================================
function StopBgmChangeDemo(num)
{
	// BGM�� 20F �Œ�~������
	FieldBgmStop_(FADE_MAPCHANGE);
	
	// �t�F�[�h�A�E�g 
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_MAPCHANGE);
	SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_MAPCHANGE);
	WaitFade_();
	
	ChangeDemo_(num); 
}

//============================================================================
// ���ʊ֐��F�V���b�v���j���[�ɓ���O�̋��ʃt�F�[�h
//----------------------------------------------------------------------------
// �������F���j���[�R�}���h
// �߂�l  �F�Ȃ�
//============================================================================
function GotoMenuFadeOpen(menu)
{
	// ����ʂ̂݃t�F�[�h��������
	SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_MENU);
	Wait_(FADE_MENU + 1);	// �m���ɈÓ]�����邽�߂�1�t���]���Ƀv���X
	SetFadeSub_(FADE_IN, FADE_COLOR_BLACK, FADE_MENU);

	//���j���[�t���[�Ɉڍs
	GotoMenuOpen_(menu);
}

//=====================================================================================
// ���ʊ֐��FEventStartOperate()���Ńf�����Ăяo��
//-------------------------------------------------------------------------------------
// �������F�Đ�����f���ԍ�
// �������F�t�F�[�h�̐F( FADE_COLOR_BLACK or FADE_COLOR_WHITE )
// �߂�l  �F�Ȃ�
//=====================================================================================
function EventStartChangeDemo(num, color)
{
	// �f���ƃf���̊Ԃ̃`�������Ȃ������߂ɂP�t���[���Ńt�F�[�h
	CommChangeMomentFadeOut(color);

	ChangeDemo_(num); 
}

//=====================================================================================
// ���ʊ֐��F�V��Ǝ��Ԃ��f���Ɉ����p�����̋��ʏ���
// ����{�I�Ƀ}�X�^�[�Y���[�h�ł����g�p���Ȃ��ł��������B
//   �}�X�^�[�Y���[�h�ȊO�Ŏg�p����ꍇ�͎d�l�ύX�𔺂����߃v���O���}�ɗv���k
//-------------------------------------------------------------------------------------
// �������F�Đ�����f���ԍ�
// �߂�l  �F�Ȃ�
//=====================================================================================
function WeatherTimeChangeDemo(num)
{
	// �V��Ǝ��Ԃ��f���Ɉ����p��
	SetEventFlg_("BFG_WEATHER_TIME_TAKEOVER_DEMO", true);
	
	ChangeDemo_(num); 
}

//=====================================================================================
// ���ʊ֐��F���Z�Δ�N������
//-------------------------------------------------------------------------------------
// �������F�M�~�b�N�h�c
// �������F���Z�萔
// �߂�l  �F�Ȃ�
//=====================================================================================
function SkillStelePerformance(obj, ability)
{
	local player = GetPlayerId_();
	local task;
	local name, desc;
	local efc_player;
	
	// ��풓���[�V�����Ǎ�
	local reactor = ReadMotion_(player, "Player_touch_reactor");     // ��������������遨���A�N�^�[��G��
	local reactor_L = ReadMotion_(player, "Player_touch_reactor_L"); // ���A�N�^�[��G��L
	// �G�t�F�N�g�̓Ǎ�
	LoadEffect_("ef712_10_emo_surprise01");  // �u�I�v
	LoadEffect_("ef732_09_light_reactor_c"); // ���A�N�^�[�̌�
	
	switch (ability) {
	// �u���[���v
	case ABILITY_RULER :
		name = "COMM_ABILITY_NAME_RULER";
		desc = "COMM_ABILITY_DESC_RULER";
		break;
	// �u�܂񂽂�v
	case ABILITY_FULLTANK :
		name = "COMM_ABILITY_NAME_FULLTANK";
		desc = "COMM_ABILITY_DESC_FULLTANK";
		break;
	// �u���i���[�^�v
	case ABILITY_RANARUTA :
		name = "COMM_ABILITY_NAME_RANARUTA";
		desc = "COMM_ABILITY_DESC_RANARUTA";
		break;
	// �u���i���I���v
	case ABILITY_RANARION :
		name = "COMM_ABILITY_NAME_RANARION";
		desc = "COMM_ABILITY_DESC_RANARION";
		break;
	// �u�C���[�W�`�F���W�v
	case ABILITY_MAKE_UP :
		name = "COMM_ABILITY_NAME_MAKE_UP";
		desc = "COMM_ABILITY_DESC_MAKE_UP";
		break;
	default :
		DebugPrint("WARNING : �w�肵�����Z���s���ł� [AbilityStelePerform]");
		break;
	}
	
	SetFade_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
	WaitFade_();
	Wait_(10);
	
	// ���b�Z�[�W�\��
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_REACTOR");
	SetExchangeMsg_(name);
	ShowMsg_("COMM_ABILITY_ACCESS");		// �u�c�c�Δ�ւ� �A�N�Z�X���m�F�B
	KeyInputWait_();
	CloseMsgWnd_();
	
	// �񃉃C�h��Ԃ̎��������[�V�����Đ�
	if(!IsPlayerRide_()){
		SetMotion_(player, reactor, BLEND_L);
		WaitMotion(player);
		SetMotion_(player, reactor_L, BLEND_L);
		efc_player = SetBoneEffect_("ef732_09_light_reactor_c", player);
	}
	else{
		efc_player = SetSelectBoneEffectPlayer_("ef732_09_light_reactor_c", PLAYER_MODEL.NORMAL, ATTACH_EFFECT1);
	}
	
	PlaySE_("SE_FLD_135");
	Wait_(30);
	
	SetMotion_(obj, MOT_GIMMICK_1, BLEND_M);
	PlaySE_("SE_FLD_117");
	Wait_(80);
	
	SetMotion_(obj, MOT_GIMMICK_2, BLEND_M);
	Wait_(15);
	
	SetExchangeMsg_(name);
	// �V�X�e�����b�Z�[�W
	OpenMsgWnd_();
	ShowMsg_("COMM_ABILITY_GET");		// ������ ���ڂ����I
	PlayMe_("ME_010");
	WaitMe_();
	KeyInputWait_();
	CloseMsgWnd_();
	
	SetMotion_(player, MOT_WAIT, BLEND_XL);
	Wait_(5);
	
	// ���Z�������b�Z�[�W
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_REACTOR");
	ShowMsg_(desc);
	KeyInputWait_();
	CloseMsgWnd_();
	
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
	SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
	WaitFade_();
	Wait_(10);
	
	SetPlayableCamera_();
	Wait_(10);
}

//======================================================
// ���ʊ֐��F���Z�Δ�ɋ߂Â������̃��b�Z�[�W�̋��ʏ���
//------------------------------------------------------
// �������F���Z�萔
// �߂�l  �F�Ȃ�
//======================================================
function CommApproachStatueMsg(constant)
{
	local dest_msg; // �u����������Z��

	switch (constant)
	{
	case ABILITY_RULER:
		dest_msg = "COMM_ABILITY_NAME_RULER";
		break;
	case ABILITY_FULLTANK:
		dest_msg = "COMM_ABILITY_NAME_FULLTANK";
		break;
	case ABILITY_RANARUTA:
		dest_msg = "COMM_ABILITY_NAME_RANARUTA";
		break;
	case ABILITY_RANARION:
		dest_msg = "COMM_ABILITY_NAME_RANARION";
		break;
	case ABILITY_MAKE_UP:
		dest_msg = "COMM_ABILITY_NAME_MAKE_UP";
		break;
	default : DebugPrint("�w�肵���萔���s���ł�(" + constant + ") [CommApproachStatueMsg]");
		break;
	}

	// ���b�Z�[�W�\��
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_REACTOR");
	SetExchangeMsg_(dest_msg);			// �u����������Z��
	ShowMsg_("COMM_APPROACH_STATUE");	// �u���̕t�߂Ɂ@�z�u����Ă���Δ�𒲂�
	KeyInputWait_();
	CloseMsgWnd_();
}

//======================================================
// ���ʊ֐��F���[���|�C���g�ɐG�������̋��ʏ���
//------------------------------------------------------
// �������FArrangePointGimmick_�Ŋi�[�������[���|�C���g�̕ϐ�
// �������F���[���|�C���g�̋N�����`�F�b�N����t���O
// ��O�����F�}�b�v�i�r�A�C�R�����W(FBX)
// �߂�l  �F�Ȃ�
//======================================================
function CommRulerPointEvent(arg_pnt_gim, r_pnt_flg, fbx = "")
{
	local player = GetPlayerId_();					// ID�̎擾
	local r_pnt_pos = GetPos_(arg_pnt_gim);			// ���[���|�C���g�̍��W���擾
	local bit_starting = GetEventFlg_(r_pnt_flg);	// ���[���|�C���g�N���t���O
	local icon;		// �i�r�}�b�v�A�C�R��ID
	local dest;		// �s���於
	local dest2;	// �s���於�Q
	local task;
	
	// ���[���|�C���g���N�����Ă��Ȃ�
	if (!bit_starting) {
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_REACTOR");
		ShowMsg_("COMM_RULER_ACCESS");		// �u�c�c���[���|�C���g�� �N�����܂��B
		KeyInputWait_();
		CloseMsgWnd_();
		
		// ���[���擾SE
		PlaySE_("SE_FLD_155");
		SetMotion_(arg_pnt_gim, MOT_GIMMICK_1, BLEND_N);
		Wait_(40);
		SetMotion_(arg_pnt_gim, MOT_GIMMICK_2, BLEND_N);
		Wait_(15); // ���[���擾SE�҂�
		
		// ���[���|�C���g�N���t���O�𗧂Ă�
		SetEventFlg_(r_pnt_flg, true);
		
		// �� �i�r�}�b�v���o���Ă��Ȃ��}�b�v�����邽�߁A���� fbx �̓f�t�H���g�󕶎��ɂ��Ă����B
		//    �S�}�b�v�̃i�r�}�b�v������������A�f�t�H���g�󕶎��A�󕶎�����������B
		if (fbx != "") {
			icon = ArrangePointNaviMapIcon_(NAVIMAP_ICON.RULER_POINT, fbx);
			SetNaviMapIconVisible_(icon, true);
		}
		
		// �s���於�𔻒�
		switch (r_pnt_flg) {
		case "BFG_RULER_ADD_000" : dest  = "COMM_RULER_DEST_LAND_01";
								   dest2 = "COMM_RULER_DEST_00";
								   break;
		case "BFG_RULER_ADD_001" : dest  = "COMM_RULER_DEST_LAND_01";
								   dest2 = "COMM_RULER_DEST_01";
								   break;
		case "BFG_RULER_ADD_002" : dest  = "COMM_RULER_DEST_LAND_02";
								   dest2 = "COMM_RULER_DEST_02";
								   break;
		case "BFG_RULER_ADD_003" : dest  = "COMM_RULER_DEST_LAND_02";
								   dest2 = "COMM_RULER_DEST_03";
								   break;
		case "BFG_RULER_ADD_004" : dest  = "COMM_RULER_DEST_LAND_02";
								   dest2 = "COMM_RULER_DEST_04";
								   break;
		case "BFG_RULER_ADD_005" : dest  = "COMM_RULER_DEST_LAND_02";
								   dest2 = "COMM_RULER_DEST_05";
								   break;
		case "BFG_RULER_ADD_006" : dest  = "COMM_RULER_DEST_LAND_02";
								   dest2 = "COMM_RULER_DEST_06";
								   break;
		case "BFG_RULER_ADD_007" : dest  = "COMM_RULER_DEST_LAND_03";
								   dest2 = "COMM_RULER_DEST_07";
								   break;
		case "BFG_RULER_ADD_008" : dest  = "COMM_RULER_DEST_LAND_03";
								   dest2 = "COMM_RULER_DEST_08";
								   break;
		case "BFG_RULER_ADD_009" : dest  = "COMM_RULER_DEST_LAND_03";
								   dest2 = "COMM_RULER_DEST_09";
								   break;
		case "BFG_RULER_ADD_010" : dest  = "COMM_RULER_DEST_LAND_03";
								   dest2 = "COMM_RULER_DEST_10";
								   break;
		case "BFG_RULER_ADD_011" : dest  = "COMM_RULER_DEST_LAND_04";
								   dest2 = "COMM_RULER_DEST_11";
								   break;
		case "BFG_RULER_ADD_012" : dest  = "COMM_RULER_DEST_LAND_04";
								   dest2 = "COMM_RULER_DEST_12";
								   break;
		case "BFG_RULER_ADD_013" : dest  = "COMM_RULER_DEST_LAND_04";
								   dest2 = "COMM_RULER_DEST_13";
								   break;
		case "BFG_RULER_ADD_014" : dest  = "COMM_RULER_DEST_LAND_04";
								   dest2 = "COMM_RULER_DEST_14";
								   break;
		case "BFG_RULER_ADD_015" : dest  = "COMM_RULER_DEST_LAND_04";
								   dest2 = "COMM_RULER_DEST_15";
								   break;
		case "BFG_RULER_ADD_016" : dest  = "COMM_RULER_DEST_LAND_04";
								   dest2 = "COMM_RULER_DEST_16";
								   break;
		case "BFG_RULER_ADD_017" : dest  = "COMM_RULER_DEST_LAND_05";
								   dest2 = "COMM_RULER_DEST_17";
								   break;
		case "BFG_RULER_ADD_018" : dest  = "COMM_RULER_DEST_LAND_05";
								   dest2 = "COMM_RULER_DEST_18";
								   break;
		case "BFG_RULER_ADD_019" : dest  = "COMM_RULER_DEST_LAND_05";
								   dest2 = "COMM_RULER_DEST_19";
								   break;
		case "BFG_RULER_ADD_020" : dest  = "COMM_RULER_DEST_LAND_06";
								   dest2 = "COMM_RULER_DEST_20";
								   break;
		case "BFG_RULER_ADD_021" : dest  = "COMM_RULER_DEST_LAND_06";
								   dest2 = "COMM_RULER_DEST_21";
								   break;
		case "BFG_RULER_ADD_022" : dest  = "COMM_RULER_DEST_LAND_06";
								   dest2 = "COMM_RULER_DEST_22";
								   break;
		case "BFG_RULER_ADD_023" : dest  = "COMM_RULER_DEST_LAND_06";
								   dest2 = "COMM_RULER_DEST_23";
								   break;
		case "BFG_RULER_ADD_024" : dest  = "COMM_RULER_DEST_LAND_07";
								   dest2 = "COMM_RULER_DEST_24";
								   break;
		case "BFG_RULER_ADD_025" : dest  = "COMM_RULER_DEST_LAND_07";
								   dest2 = "COMM_RULER_DEST_25";
								   break;
		case "BFG_RULER_ADD_026" : dest  = "COMM_RULER_DEST_26";
								   break;
		case "BFG_RULER_ADD_027" : dest  = "COMM_RULER_DEST_27";
								   break;
		case "BFG_RULER_ADD_028" : dest  = "COMM_RULER_DEST_LAND_02";
								   dest2 = "COMM_RULER_DEST_28";
								   break;
		case "BFG_RULER_ADD_029" : dest  = "COMM_RULER_DEST_LAND_02";
								   dest2 = "COMM_RULER_DEST_29";
								   break;
		case "BFG_RULER_ADD_030" : dest  = "COMM_RULER_DEST_LAND_02";
								   dest2 = "COMM_RULER_DEST_30";
								   break;
		case "BFG_RULER_ADD_031" : dest  = "COMM_RULER_DEST_LAND_03";
								   dest2 = "COMM_RULER_DEST_31";
								   break;
		case "BFG_RULER_ADD_032" : dest  = "COMM_RULER_DEST_LAND_06";
								   dest2 = "COMM_RULER_DEST_32";
								   break;
		default : DebugPrint("WARNING : �w�肵���t���O���s���ł�(" + r_pnt_flg + ") [CommRulerPointEvent]"); break;
		}
		// �|�C���g�[���E�o�[�`�����R���V�A���̏ꍇ
		if(r_pnt_flg == "BFG_RULER_ADD_026" || r_pnt_flg == "BFG_RULER_ADD_027"){
			// ������u��
			SetExchangeMsg_(dest);
			
			OpenMsgWnd_();
			ShowMsg_("COMM_RULER_ADD");			// ���[���� �s�����
			PlayMe_("ME_010");					// �d�v�A�C�e������ME
			WaitMe_();
			KeyInputWait_();
			CloseMsgWnd_();
		}
		// �A���f�b�h�K�[�f�������E�A���f�b�h�K�[�f���n��
		else if(r_pnt_flg == "BFG_RULER_ADD_009" || r_pnt_flg == "BFG_RULER_ADD_010"){
			// ������u���Q��
			SetExchangeMsg_(dest);
			SetExchangeMsg_(dest2);
			
			OpenMsgWnd_();
			ShowMsg_("COMM_RULER_ADD3");		// ���[���� �s�����
			PlayMe_("ME_010");					// �d�v�A�C�e������ME
			WaitMe_();
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else{
			// ������u���Q��
			SetExchangeMsg_(dest);
			SetExchangeMsg_(dest2);
			
			OpenMsgWnd_();
			ShowMsg_("COMM_RULER_ADD2");		// ���[���� �s�����
			PlayMe_("ME_010");					// �d�v�A�C�e������ME
			WaitMe_();
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
	// ���[���|�C���g�N����
	else {
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_REACTOR");
		ShowMsg_("COMM_RULER_DONE");		// �u���̃��[���|�C���g��
		KeyInputWait_();
		CloseMsgWnd_();
	}
}

//======================================================
// ���ʊ֐��F���m���X�̋N���̃A�j������ [ ��l�������f�t�H���g�����Ȃ̂ň����ǉ��̎��͗v���� ]
//------------------------------------------------------
// �������FArrangePointGimmick_�Ŋi�[�������m���X�̕ϐ�
// �������F���m���X���N�����Ă��邩���`�F�b�N����t���O
// ��O�����F���m���X��z�u���Ă���m�[�h��
// ��l�����F�b�����N���̃��C�h�C�x���g�����̃��b�Z�[�W��\�����邩�ǂ���(�f�t�H���g����:false)
// �߂�l  �F�Ȃ�
//======================================================
function MonolithAnime(monolith, flgName, node, eventEndMsgFlg = false)
{
	//ID�̎擾
	local player = GetPlayerId_();
	// ���m���X���N�����Ă��邩���`�F�b�N����t���O���擾
	local checkStartFlg = GetEventFlg_(flgName);
	// ���l�̐ݒ�
	local alpha_def = 1.0;
	// ���l��ύX����O�͕K�����̖��߂��L��
	SetManualCalcAlpha_(player, true);

	if(checkStartFlg == false){
		// ���m���X���N�����Ă��邩���`�F�b�N����t���O��true��
		SetEventFlg_(flgName, true);
		// ���m���X�̋N���A�j�����Đ�
		PlaySE_("SE_FLD_101");	// �N���p�̉��r�d���Đ�
		SetMotion_(monolith, MOT_GIMMICK_1, BLEND_N);// ��:FieldCommon.nut�̒萔������
		// ���m���X�̋N���G�t�F�N�g
		LoadEffect_("ef732_12_monolith_on");
		SetPointWorldEffect_("ef732_12_monolith_on", node);
		Wait_(30);
		// ���m���X�̋N����ҋ@�A�j�����Đ�
		SetMotion_(monolith, MOT_GIMMICK_2, BLEND_N);
		// �Ԃ���������
		Wait_(40);
	}

	if(eventEndMsgFlg == true){
		local main_num = GetNumFlg_("NUM_SCENARIO_MAIN");
		// ���b�Z�[�W��\��
		if(main_num == GetFlagID_("CONST_SM_GRASSLAND")){
			// ���ド�C�h
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_TEREZIA");
			ShowMsg_("RIDE_TUT_EVENT_004");
			KeyInputWait_();
			CloseMsgWnd_();
			Wait_(30);
		}
		else if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){
			// �������C�h
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_TEREZIA");
			ShowMsg_("RIDE_TUT_EVENT_005");
			KeyInputWait_();
			CloseMsgWnd_();
			Wait_(30);
		}
		else if(main_num == GetFlagID_("CONST_SM_VOLCANO")){
			// �󒆃��C�h
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_TEREZIA");
			ShowMsg_("RIDE_TUT_EVENT_006");
			KeyInputWait_();
			CloseMsgWnd_();
			Wait_(30);
		}
	}

// ��l���Ƀe���|�[�g�G�t�F�N�g������
	// �G�t�F�N�g�̓ǂݍ���
	LoadEffect_("ef732_07_teleport_monolith");	//���m���X�]���G�t�F�N�g
	PlaySE_("SE_DEM_017");						// �r�d�Đ�
	local effectId = SetSelectBoneEffect_("ef732_07_teleport_monolith", player, ATTACH_GLOBAL);
	Wait_(1);
	// ��l���̎p��i�X�Ə����Ă���
	for(alpha_def = 1.0; alpha_def >= 0.0; alpha_def = alpha_def - 0.1){
		SetAlpha_(player, alpha_def);
		Wait_(1);
	}
	SetAlpha_(player, 0.0);
	
	// �Ԃ���������
	Wait_(30);
	
	// �t�F�[�h�A�E�g
	FieldBgmStop_(FADE_MAPCHANGE);
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_MAPCHANGE);
	SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_MAPCHANGE);
	WaitFade_();
	
	// ��l���̃��l�����ɖ߂�
	SetAlpha_(player, 1.0);
}

//======================================================
// ���ʊ֐��F�f�B�X�N���u�̋N���A�j������(���m���X�̋N���A�j���𗬗p)
//------------------------------------------------------
// �������FArrangePointGimmick_�Ŋi�[�����f�B�X�N���u�̕ϐ�
// �������F�f�B�X�N���u���N�����Ă��邩���`�F�b�N����t���O
// ��O�����F�f�B�X�N���u��z�u���Ă���m�[�h��
// �߂�l  �F�Ȃ�
//======================================================
function DiscDeviceAnime(discdevice, flgName, node)
{
	//ID�̎擾
	local player = GetPlayerId_();
	// ���m���X���N�����Ă��邩���`�F�b�N����t���O���擾
	local checkStartFlg = GetEventFlg_(flgName);
	// ���l�̐ݒ�
	local alpha_def = 1.0;
	// ���l��ύX����O�͕K�����̖��߂��L��
	SetManualCalcAlpha_(player, true);

	if(checkStartFlg == false){
		// �f�B�X�N���u���N�����Ă��邩���`�F�b�N����t���O��true��
		SetEventFlg_(flgName, true);
		// �f�B�X�N���u�̋N���A�j�����Đ�
		PlaySE_("SE_FLD_101");	// �N���p�̉��r�d���Đ�
		SetMotion_(discdevice, MOT_GIMMICK_1, BLEND_N);
		// �f�B�X�N���u�̋N���G�t�F�N�g
		LoadEffect_("ef732_12_monolith_on");
		SetPointWorldEffect_("ef732_12_monolith_on", node);
		Wait_(30);
		// �f�B�X�N���u�̋N����ҋ@�A�j�����Đ�
		SetMotion_(discdevice, MOT_GIMMICK_2, BLEND_N);
		// �Ԃ���������
		Wait_(40);
	}

// ��l���Ƀe���|�[�g�G�t�F�N�g������
	// �G�t�F�N�g�̓ǂݍ���
	LoadEffect_("ef732_07_teleport_monolith");	//���m���X�]���G�t�F�N�g
	PlaySE_("SE_DEM_017");						// �r�d�Đ�
	local effectId = SetSelectBoneEffect_("ef732_07_teleport_monolith", player, ATTACH_GLOBAL);
	Wait_(1);
	// ��l���̎p��i�X�Ə����Ă���
	for(alpha_def = 1.0; alpha_def >= 0.0; alpha_def = alpha_def - 0.1){
		SetAlpha_(player, alpha_def);
		Wait_(1);
	}
	SetAlpha_(player, 0.0);
	// �Ԃ���������
	Wait_(30);
	// �Ó]������(��l�����������܂܂ɂȂ�Ȃ��悤�ɂ����ňÓ]�����ă��l�����ɖ߂�)
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 15);
	SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, 15);
	WaitFade_();
	// ��l���̃��l�����ɖ߂�
	SetAlpha_(player, 1.0);
}

//======================================================
// ���ʊ֐��F���̊J�n�t���[���ɖ߂�
//------------------------------------------------------
// �������F�e�嗤�̃N���A�t���O(�u�E�b�h�p�[�N�v�Ȃ�uBFG_SCENARIO_CLEAR_GRASS�v
//                                �u�L���O�_���v�Ȃ�uBFG_SCENARIO_CLEAR_CITY�v )
// �߂�l  �F�Ȃ�
//======================================================
function ResetTimeZone(flg_name)
{
	// �嗤���N���A���Ȃ��ƒ��̊J�n�t���[���ɖ߂������͔������Ȃ��̂Ńt���O���`�F�b�N
	local check_flg = GetEventFlg_(flg_name);
	if(check_flg){
		// ���̎��ԑтɐݒ�
		SetTime_(START_TIME_ZONE_NOON);
	}
}

//======================================================
// ���ʊ֐��F��������ꂩ����
//------------------------------------------------------
// �������F�e�嗤�̃N���A�t���O(�u�E�b�h�p�[�N�v�Ȃ�uBFG_SCENARIO_CLEAR_GRASS�v
//                                �u�L���O�_���v�Ȃ�uBFG_SCENARIO_CLEAR_CITY�v )
// �߂�l  �F�Ȃ�
//======================================================
function ChangeTimeZone(flg_name)
{
	// �嗤���N���A���Ȃ��ƒ��邢�ꂩ���͔������Ȃ��̂Ńt���O���`�F�b�N
	local check_flg = GetEventFlg_(flg_name);
	if(check_flg){
		// ���̎��ԑт��擾
		local check_daytime = GetDaytimeState_();
		if(check_daytime == SCHEDULE.NOON){
			// ��̎��ԑтɐݒ�
			SetTime_(START_TIME_ZONE_NIGHT);
		}
		else if(check_daytime == SCHEDULE.NIGHT){
			// ���̎��ԑтɐݒ�
			SetTime_(START_TIME_ZONE_NOON);
		}
	}
}

//======================================================
// ���ʊ֐��F�h���̋��ʂ̉񕜏���
//------------------------------------------------------
// �������F�Ó]������̎�l���̍Ĕz�u����ꏊ
// �������F�Ó]������̎�l���̌���
// ��O�����F�N���A�t���O
// ��l�����F�h����ID���(�Ó]���Ɏ�l���̕����ɏh�����������)
//			�i�f�t�H���g�l�F�󔒕����j
// �߂�l  �F�Ȃ�
//======================================================
function CommTaskInn(pos, dir, clear_flg, inn = "")
{
	local player = GetPlayerId_();
	// �Ó]
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
	SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
// ���y���Ή� ------------------------------
	// �h����ME���Đ�����X�N���v�g
	Wait_(12);
	PlayMe_("ME_003");
	WaitFade_();
	
	// ����ύX
	if (clear_flg) {
		switch (GetQueryResult_()) {
		// �u���܂�v
		case QUERY3_0 :
			SetTime_(START_TIME_ZONE_NOON);
			break;
			
		// �u�₷�ށv
		case QUERY3_1 :
			// ���̎��ԑт��擾
			local check_daytime = GetDaytimeState_();
			if(check_daytime == SCHEDULE.NOON){
				// ��̎��ԑтɐݒ�
				SetTime_(START_TIME_ZONE_NIGHT);
			}
			else if(check_daytime == SCHEDULE.NIGHT){
				// ���̎��ԑтɐݒ�
				SetTime_(START_TIME_ZONE_NOON);
			}
			break;
		}
	}
	
	// �X�e�[�^�X��
	RecoverAll_();
	// �h����ME���Đ��҂�
	WaitMe_();
	PlayBgmStartHead_();
	
// ���y���Ή� ---------------------------------
	// �Ó]����
	SetFade_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
	SetFadeSub_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
	WaitFade_();
	//Wait_(30);
}

//======================================================
// ���ʊ֐��F�w��m�o�b�Ƃ̌�������������
//------------------------------------------------------
// �������F�L�����N�^�[ID
// �߂�l  :�w��m�o�b�̌��̌���
//======================================================
function FaceToFaceNpc(chr)
{
	local task;
	
	// �u�I�v�s���I
	SetBoneEffect_("ef300_20_target_icon", chr);
	PlaySE_("SE_DEM_053");
	Wait_(15);
	
	// �w��L��������l���̕��֌�����
	task = Task_RotateToPlayerSetMotion_(chr, 5.7, MOT_WALK, MOT_WAIT);
	WaitTask(task);
}

//======================================================
// ���ʊ֐��F�N���֎~�̃C�x���g�n���ɐG�ꂽ�ۂ̈ړ�����
//------------------------------------------------------
// �������F�߂鎞�̌���
// �������F�ړ��t���[����(�f�t�H���g����:30F)
// �߂�l  �F�Ȃ�
//======================================================
function CommPlayerTurnMoveDirWalk(dir, move_frame = 30)
{
	local player    = GetPlayerId_();
	
	local task_walk = Task_MoveForward_(player, 1.0, false);
	SetMotion_(player, MOT_WALK, BLEND_N);
	SetDir_(player, dir);
	Wait_(move_frame);
	
	DeleteTask_(task_walk);
}

//======================================================
// ���ʊ֐��F�w������Ɏ�l����U��������鋤�ʏ���
//------------------------------------------------------
// �������F�߂鎞�̌���
// �߂�l  �F�Ȃ�
//======================================================
function CommPlayerTurnAroundDir(dir)
{
	local player    = GetPlayerId_();
	
	// �Ώە��̕����ɉ�](1F��11.4������])
	local rotateTask = Task_RotateToDirSetMotion_(player, dir, ROTATE_EVENT_DEF, MOT_WALK, MOT_WAIT);
	WaitTask(rotateTask);
	
	// �Ԃ���������
	Wait_(15);
}

//======================================================
// ���ʊ֐��F�Ώە��̕����Ɏ�l����U��������鋤�ʏ���
//------------------------------------------------------
// �������F�Ώە���ID
// �߂�l  �F�Ȃ�
//======================================================
function CommPlayerTurnAroundObj(obj_id)
{
	local player    = GetPlayerId_();
	
	// �Ώە��̕����ɉ�](1F��11.4������])
	local obj_pos = GetPos_(obj_id);
	local rotateTask = Task_RotateToPosSetMotion_(player, obj_pos, ROTATE_EVENT_DEF, MOT_WALK, MOT_WAIT);
	WaitTask(rotateTask);
	
	// �Ԃ���������
	Wait_(15);
}

//===================================================================================
// ���ʊ֐��F�w������Ɏ�l����U�����������A�J�������f�t�H���g�̈ʒu�ɖ߂����ʏ���
//-----------------------------------------------------------------------------------
// �������F�U������������
// �߂�l  �F�Ȃ�
//===================================================================================
function CommTurnAroundAndSetPlayableCamera(dir)
{
	// �w������Ɏ�l����U���������
	CommPlayerTurnAroundDir(dir);
	// �J�������f�t�H���g�ʒu�ɖ߂�<�C�����Ȃ̂�Redmine#3817>
	SetPlayableCamera_();
}

//======================================================
// ���ʊ֐��F�񕜏����{���ʃ��b�Z�[�W�\��
//------------------------------------------------------
// �������F�Ȃ�
// �߂�l  �F�Ȃ�
//======================================================
function RecoveryAndMsg()
{
	local player = GetPlayerId_();
	
	// �񕜏���
	LoadEffect_("ef742_01_div_mag_hoimi");
	SetSelectBoneEffect_("ef742_01_div_mag_hoimi", player, ATTACH_GLOBAL);
	PlaySE_("SE_SHA_003");		// ��SE
	RecoverAll_();
	
	// ���b�Z�[�W
	OpenMsgWnd_();
	ShowMsg_("COMM_RECOVERY");		// ���ԃ����X�^�[�� �S�񕜂����I
	KeyInputWait_();
	CloseMsgWnd_();
}


//======================================================
// ���ʊ֐��F�A�C�e�����菈��
//------------------------------------------------------
// �������F�A�C�e��ID
// �������F�����
// ��O�����F�d�v�A�C�e���t���O (�f�t�H���g�l:false)
// �߂�l  �F�Ȃ�
//======================================================
function AddItemAndMsg(item_id, number, flg = false)
{
	local msg;
	
	AddItem_(item_id, number);
	SetExchangeItemName_(item_id);
	
	// �A�C�e�������
	if (number <= 1) {
		msg = "COMM_ITEM_SINGLE_GET";		// ������ ��ɓ��ꂽ�I
	}
	// �A�C�e����������
	else {
		SetExchangeNumber_(number);
		msg = "COMM_ITEM_MULTIPLE_GET";		// ������ ������ ��ɓ��ꂽ�I
	}
	
	OpenMsgWnd_();
	ShowMsg_(msg);
	
	// �d�v�A�C�e�����莞
	if (flg) {
		PlayMe_("ME_010");			// �d�v�A�C�e������ME
		WaitMe_();
	}
	// �ėp�A�C�e�����莞
	else {
		PlaySE_("SE_SYS_011");		// �A�C�e������SE
	}
	
	KeyInputWait_();
	CloseMsgWnd_();
}

//=============================================================
// ���ʊ֐��F�A�N�Z�T���p�̓��菈�����̂P<���̂Q�ƃZ�b�g�Ŏg��>
//-------------------------------------------------------------
// �������F�A�C�e��ID
// �������F�����
// ��O�����F�d�v�A�C�e���t���O (�f�t�H���g�l:false)
// �߂�l  �F�Ȃ�
//=============================================================
function AddItemAndMsgAQ1(item_id, number, flg = false)
{
	// ���b�Z�[�W
	OpenMsgWnd_();
	SetExchangeItemName_(item_id);
	SetExchangeNumber_(number);
	ShowMsg_("COMM_ITEM_GET_AQ_01"); // �u��l���́@�N�C�[������
	
	// �d�v�A�C�e�����莞
	if (flg) {
		PlayMe_("ME_010");			// �d�v�A�C�e������ME
		WaitMe_();
	}
	// �ėp�A�C�e�����莞
	else {
		PlaySE_("SE_SYS_011");		// �A�C�e������SE
	}
	
	// �A�C�e�����菈��
	AddItem_(item_id, number);
	
	KeyInputWait_(); // ������ AddItemAndMsgAQ2() �֍s���̂� CloseMsgWnd_() �͍s��Ȃ�
}

//=============================================================
// ���ʊ֐��F�A�N�Z�T���p�̓��菈�����̂Q<���̂P�ƃZ�b�g�Ŏg��>
//-------------------------------------------------------------
// �������F�A�C�e��ID
// �������F�����
// ��O�����F�d�v�A�C�e���t���O (�f�t�H���g�l:false)
// �߂�l  �F�Ȃ�
//=============================================================
function AddItemAndMsgAQ2(item_id, number, flg = false)
{
	// ���b�Z�[�W( AddItemAndMsgAQ1() �� OpenMsgWnd_() ���s���Ă���̂Œ��� )
	SetExchangeItemName_(item_id);
	SetExchangeNumber_(number);
	ShowMsg_("COMM_ITEM_GET_AQ_02"); // �u�������@�����@��������I
	
	// �d�v�A�C�e�����莞
	if (flg) {
		PlayMe_("ME_010");			// �d�v�A�C�e������ME
		WaitMe_();
	}
	// �ėp�A�C�e�����莞
	else {
		PlaySE_("SE_SYS_011");		// �A�C�e������SE
	}
	
	// �A�C�e�����菈��
	AddItem_(item_id, number);
	
	KeyInputWait_();
	CloseMsgWnd_();
}

//======================================================
// ���ʊ֐��F�X�J�E�g�p�̓��菈�����̂P
//------------------------------------------------------
// �������F�A�C�e��ID
// �������F�����
// ��O�����F�d�v�A�C�e���t���O (�f�t�H���g�l:false)
// �߂�l  �F�Ȃ�
//======================================================
function AddItemAndMsgSQ1(item_id, number, flg = false)
{
	// ���b�Z�[�W
	OpenMsgWnd_();
	SetExchangeItemName_(item_id);
	SetExchangeNumber_(number);
	ShowMsg_("COMM_ITEM_GET_SQ_00"); // �m�`����������@���ق��тƂ���
	
	// �d�v�A�C�e�����莞
	if (flg) {
		PlayMe_("ME_010");			// �d�v�A�C�e������ME
		WaitMe_();
	}
	// �ėp�A�C�e�����莞
	else {
		PlaySE_("SE_SYS_011");		// �A�C�e������SE
	}
	
	// �A�C�e�����菈��
	AddItem_(item_id, number);
	
	KeyInputWait_();
	CloseMsgWnd_();
}

//===========================================================
// ���ʊ֐��F�X�J�E�g�p�̓��菈�����̂Q<���̂R�ƃZ�b�g�Ŏg��>
//-----------------------------------------------------------
// �������F�A�C�e��ID
// �������F�����
// ��O�����F�d�v�A�C�e���t���O (�f�t�H���g�l:false)
// �߂�l  �F�Ȃ�
//===========================================================
function AddItemAndMsgSQ2(item_id, number, flg = false)
{
	// ���b�Z�[�W
	OpenMsgWnd_();
	SetExchangeItemName_(item_id);
	SetExchangeNumber_(number);
	ShowMsg_("COMM_ITEM_GET_SQ_01"); // �m�`����������@���ق��тƂ���
	
	// �d�v�A�C�e�����莞
	if (flg) {
		PlayMe_("ME_010");			// �d�v�A�C�e������ME
		WaitMe_();
	}
	// �ėp�A�C�e�����莞
	else {
		PlaySE_("SE_SYS_011");		// �A�C�e������SE
	}
	
	// �A�C�e�����菈��
	AddItem_(item_id, number);
	
	KeyInputWait_(); // ������ AddItemAndMsgSQ3() �֍s���̂� CloseMsgWnd_() �͍s��Ȃ�
}

//===========================================================
// ���ʊ֐��F�X�J�E�g�p�̓��菈�����̂R<���̂Q�ƃZ�b�g�Ŏg��>
//-----------------------------------------------------------
// �������F�A�C�e��ID
// �������F�����
// ��O�����F�d�v�A�C�e���t���O (�f�t�H���g�l:false)
// �߂�l  �F�Ȃ�
//===========================================================
function AddItemAndMsgSQ3(item_id, number, flg = false)
{
	// ���b�Z�[�W( AddItemAndMsgSQ2() �� OpenMsgWnd_() ���s���Ă���̂Œ��� )
	SetExchangeItemName_(item_id);
	SetExchangeNumber_(number);
	ShowMsg_("COMM_ITEM_GET_SQ_02"); // �u�������@�����@��������I
	
	// �d�v�A�C�e�����莞
	if (flg) {
		PlayMe_("ME_010");			// �d�v�A�C�e������ME
		WaitMe_();
	}
	// �ėp�A�C�e�����莞
	else {
		PlaySE_("SE_SYS_011");		// �A�C�e������SE
	}
	
	// �A�C�e�����菈��
	AddItem_(item_id, number);
	
	KeyInputWait_();
	CloseMsgWnd_();
}

//======================================================
// ���ʊ֐��F�A�N�Z�T����ǉ�����
//------------------------------------------------------
// �������F�A�C�e��ID
// �������F�O���[�h
// �߂�l  �F�Ȃ�
//======================================================
function CommAddAccessory(id, grade)
{
	if(CheckAccessoryMax_()){
		local task = Task_AddAccessoryFlow_(id, grade);
		WaitTask(task);
	} else {
		AddAccessory_(id, grade);
	}
}

//======================================================
// ���ʊ֐��F�A�N�Z�T���[����̈ꊇ����
//------------------------------------------------------
// �������F�A�N�Z�T���[ID(�A�C�e��ID)
// �������F�����
// ��O�����F�A�N�Z�T���[�̃O���[�h
// ��l�����F�d�v�A�C�e���t���O (�f�t�H���g�l:false)
// �߂�l  �F�Ȃ�
//======================================================
function AddAccessoryAndMsg(acce_id, number, grade, flg = false)
{
	// �A�N�Z�T���[���ő及�����܂ŏ������Ă��邩�`�F�b�N
	if(CheckAccessoryMax_()){
		local task = Task_AddAccessoryFlow_(acce_id, grade);
		WaitTask(task);
	} else {
		local msg;
		local add_num = 0;
		
		// �A�N�Z�T���[�̒ǉ�����
		for(add_num = 0; add_num <= (number - 1); add_num++){
			AddAccessory_(acce_id, grade);
		}
		SetExchangeItemName_(acce_id);
		
		// �A�N�Z�T�������
		if (number <= 1) {
			msg = "COMM_ITEM_SINGLE_GET";		// ������ ��ɓ��ꂽ�I
		}
		// �A�N�Z�T����������
		else {
			SetExchangeNumber_(number);
			msg = "COMM_ITEM_MULTIPLE_GET";		// ������ ������ ��ɓ��ꂽ�I
		}
		
		OpenMsgWnd_();
		ShowMsg_(msg);
		
		// �d�v�A�C�e�����莞
		if (flg) {
			PlayMe_("ME_010");			// �d�v�A�C�e������ME
			WaitMe_();
		}
		// �ėp�A�C�e�����莞
		else {
			PlaySE_("SE_SYS_011");		// �A�C�e������SE
		}
		
		KeyInputWait_();
		CloseMsgWnd_();
	}
}

//======================================================
// ���ʊ֐��F�����i��ǉ�����
//------------------------------------------------------
// �������F�A�C�e��ID
// �������F�O���[�h
// �߂�l  �F�Ȃ�
//======================================================
function CommAddOrnament(id)
{
	if(CheckOrnamentMax_()){
		//local task = Task_AddOrnamentFlow_(id);
		//WaitTask(task);
	} else {
		AddOrnament_(id);
	}
}

//======================================================
// ���ʊ֐��F�����i����̈ꊇ����
//------------------------------------------------------
// �������F�����iID(�A�C�e��ID)
// �������F�����
// ��O�����F�d�v�A�C�e���t���O (�f�t�H���g�l:false)
// �߂�l  �F�Ȃ�
//======================================================
function AddOrnamentAndMsg(orna_id, number, flg = false)
{
	// �����i���ő及�����܂ŏ������Ă��邩�`�F�b�N
	if(CheckOrnamentMax_()){
		//local task = Task_AddOrnamentFlow_(orna_id);
		//WaitTask(task);
	} else {
		local msg;
		local add_num = 0;
		
		// �����i�̒ǉ�����
		for(add_num = 0; add_num <= (number - 1); add_num++){
			AddOrnament_(orna_id);
		}
		SetExchangeItemName_(orna_id);
		
		// �����i�����
		if (number <= 1) {
			msg = "COMM_ITEM_SINGLE_GET";		// ������ ��ɓ��ꂽ�I
		}
		// �����i��������
		else {
			SetExchangeNumber_(number);
			msg = "COMM_ITEM_MULTIPLE_GET";		// ������ ������ ��ɓ��ꂽ�I
		}
		
		OpenMsgWnd_();
		ShowMsg_(msg);
		
		// �d�v�A�C�e�����莞
		if (flg) {
			PlayMe_("ME_010");			// �d�v�A�C�e������ME
			WaitMe_();
		}
		// �ėp�A�C�e�����莞
		else {
			PlaySE_("SE_SYS_011");		// �A�C�e������SE
		}
		
		KeyInputWait_();
		CloseMsgWnd_();
	}
}

//======================================================
// ���ʊ֐��F�嗤�Ԉړ��̏���f����ɃZ�[�u���鏈��
//------------------------------------------------------
// �������F�嗤�N���A�t���O
// �������F�Z�[�u����Ƀf�������邩�ǂ���
// �߂�l  �F�Ȃ�
//======================================================
function CommSavedAfterTransferDemo(flg_name, isNextDemo = false)
{
	// �嗤�ړ��̃f�����ɃZ�[�u�|�C���g�����ލۂɎg�p����t���O
	local save_pnt_flg = GetEventFlg_("BFG_SAVE_POINT_FLAG");
	if(save_pnt_flg == true){
		// �嗤�ړ��̃f�����ɃZ�[�u�|�C���g�����ލۂɎg�p����t���O��false��
		SetEventFlg_("BFG_SAVE_POINT_FLAG", false);
		// ���b�Z�[�W�{�b�N�X�����̊K�w�ɈÓ]����悤�ɐݒ�
		SetFadePlane_(FADE_PLANE.PLANE_3D);	// ����
		SetNavimapVisible_(false);			// �����(�}�b�v���f��Ȃ�����)
		// �Ó]( ����ʂŃ��b�Z�[�W��\������̂ŁA�����ł�SetFadeSub_()�͌Ăяo���Ȃ����� )
		SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
		WaitFade_();
		// �Z�[�u�p�̉����b�Z�[�W
		OpenMsgWnd_();
		ShowMsg_("CHECK_SAVE_MSG");
		KeyInputWait_();
		if(GetQueryResult_() == QUERY2_0){
			CloseMsgWnd_();
			// �Z�[�u��ʂֈڍs
			local tsk_saved_wnd = Task_Save_();
			WaitTask(tsk_saved_wnd);
			DebugPrint("�Z�[�u����");
			KeyInputWait_();
		}
		else{
			CloseMsgWnd_();
		}
		Wait_(1);
		// �Ó]�����O�ɉ���ʂ��Ó]������
		SetNavimapVisible_(true);
		SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
		WaitFadeSub_();
		
		// �Z�[�u�I���シ���Ƀf��������ꍇ�́ABGM�̉��ʂ�
		// 0�t���[���Ō��ɖ߂�
		// �t�F�[�h�������Ă��܂��ƁA�t�F�[�h�����̓r���Ńf���ɓ����Ă��܂�
		// �f����BGM�̉��ʂ��ς���Ă��܂�����
		local volume = FADE_DEF;
		if(isNextDemo){
			volume = 0;
		}

		// �Ó]���������Ȃ���A�嗤�ړ����u����v���C���[�������Ă���̂�
		// �t�F�[�h�I����҂��Ȃ�
		// �Ó]����
		SetFade_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
		SetFadeSub_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
		// �Ó]����K�w�����̏�Ԃɖ߂�
		SetFadePlane_(FADE_PLANE.PLANE_NORMAL);
	}
	// �嗤�N���A�t���O
	SetEventFlg_(flg_name, true);
}

//=====================================================================================
// ���ʊ֐��F�S�ŕ��A�̋��ʏ���
//-------------------------------------------------------------------------------------
// �������F��l���̕��A���W
// �������F��l���̌���
// �߂�l  �F�Ȃ�
//=====================================================================================
function CommDeadReturn(pos, dir)
{
	local player = GetPlayerId_();
	// �Ó]
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
	SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
	WaitFade_();
	// ���A�ʒu���w��
	SetPos_(player, Vec3(pos.x, pos.y, pos.z));
	SetDir_(player, dir);
	// �J��������l���̕��ɗ���܂ňÓ]
	Wait_(60);
	SetFade_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
	SetFadeSub_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
	WaitFade_();
	// �񕜏����{���ʃ��b�Z�[�W�\��
	RecoveryAndMsg();
	// �S�ŒʒmBit�t���O��false�ɖ߂�( �v���O�����ŗ��ĂăX�N���v�g�ō~�낷 )
	SetEventFlg_("BFG_DEAD_RETURN", false);
}

//=====================================================================================
// ���ʊ֐��F�B��Ă���m�`���[���̋��ʏ���
//-------------------------------------------------------------------------------------
// �������F�b�������鑊��
// �������F�B��Ă��鑊��̃��A�N�^�[�|�C���g
// ��O�����F�v���C���[ID
// �߂�l  �F�Ȃ�
//=====================================================================================
function CommHideAndSeek(target, rpoint, player)
{
	local flg_name;
	local rtn_player_pos;
	local rtn_player_dir;
	local rtn_camera_dir;
	local nocho_node;
	local rmsg;
	local nocho_tag = "NAME_NONE"; // �l�[���^�O�͕\������Ȃ�<2��DB #3587>
	local nocho_msg;

	switch(target)
	{
	case npc_ACE:
		flg_name = "BFG_FIRST_TIME_TALK_ACE";
		rtn_player_pos = Vec3(33.029, -0.039, -105.935);
		rtn_player_dir = -165;
		rtn_camera_dir = 155;
		nocho_node = "A002_2";
		rmsg = "NPC_NOCHO_MEN_REC";
		nocho_msg = "DEMO_012_AFT_ACE";
		SetTargetNameKey_(npc_ACE, "NAME_TAG_NOCHORA"); // �A�i���C�Y�̃^�[�Q�b�g����؂�ւ���(�G�[�X���m�`���[��)
		break;
	case npc_INN:
		flg_name = "BFG_FIRST_TIME_TALK_INN";
		rtn_player_pos = Vec3(205.971, -1.260, -1.622);
		rtn_player_dir = -132;
		rtn_camera_dir = -160;
		nocho_node = "A003_2";
		rmsg = "NPC_NOCHO_MEN_REC";
		nocho_msg = "DEMO_012_AFT_INN";
		break;
	case npc_QEN:
		flg_name = "BFG_FIRST_TIME_TALK_QUEEN";
		rtn_player_pos = Vec3(13.531, -0.039, 116.898);
		rtn_player_dir = -52;
		rtn_camera_dir = 10;
		nocho_node = "A001_2";
		rmsg = "NPC_NOCHO_WOMEN_REC";
		nocho_msg = "DEMO_012_AFT_QEN";
		SetTargetNameKey_(npc_QEN, "NAME_TAG_NOCHORA"); // �A�i���C�Y�̃^�[�Q�b�g����؂�ւ���(�N�C�[�����m�`���[��)
		break;
	}

	// ���߂Ęb�����������t���O
	SetEventFlg_(flg_name, true);
	// �I�u�W�F�N�g�̕����Ɍ�����
	//CommPlayerTurnAroundObj(target);
	// �Ó]
	SetFade_(FADE_OUT , FADE_COLOR_BLACK, FADE_DEF);
	SetFadeSub_(FADE_OUT , FADE_COLOR_BLACK, FADE_DEF);
	WaitFade_();
	WaitFadeSub_();
	// ���l�����ɖ߂�
	SetManualCalcAlpha_(target, true);
	SetAlpha_(target, 1.0);
	//��������SE
	PlaySE_("SE_DEM_034");
	// �����Ń��A�N�^�[�|�C���g���폜
	SetActive_(rpoint, false);
	// ��l���̈ʒu�ƌ�����ݒ�
	SetPos_(player, rtn_player_pos);
	SetDir_(player, rtn_player_dir);
	//�J�����̌�����ݒ�
	SetCameraDir_(rtn_camera_dir);
	//�B��Ă���m�`���[�����ړ�������
	SetPointPosNoFit_(target , nocho_node); 
	// �m�`���[������l���̈ʒu�Ɍ�����
	SetDirToPlayer_(target);
	SetReactorMsg_(target, rmsg);
	Wait_(30); 
	// ���点�Ȃ�
	SetMotion_(target, "WAIT", BLEND_N);
	//�Ó]���J����
	SetFade_(FADE_IN, FADE_COLOR_BLACK, 30);
	SetFadeSub_(FADE_IN, FADE_COLOR_BLACK, 30);
	WaitFade_();
	Wait_(30); 
	// ��b�J�n
	SetMotion_(target, "TALKLOOP", BLEND_N);
	CommonMessageT(nocho_msg, nocho_tag);
	SetMotion_(target, "WAIT", BLEND_N);
}

//======================================================
// ���ʊ֐��F�Z���^�[�r���̃V���b�v�̒i�K����t���O�̈ꊇ�ύX
//------------------------------------------------------
// �������F����i�K�i�O�`�Q�j
// �߂�l  �F�Ȃ�
//======================================================
function CommShopLevelChange(change_level)
{
	CommItemLevelChange(change_level);
	CommMeatLevelChange(change_level);
}

//======================================================
// ���ʊ֐��F�Z���^�[�r���̓���̒i�K����t���O�̕ύX
//------------------------------------------------------
// �������F����i�K�i�O�`�Q�j
// �߂�l  �F�Ȃ�
//======================================================
function CommItemLevelChange(change_level)
{
	SetNumFlg_("NUM_FLG_SHOP_A01_00_ITEM_LEVEL", change_level);
}

//======================================================
// ���ʊ֐��F�Z���^�[�r���̓����̒i�K����t���O�̕ύX
//------------------------------------------------------
// �������F����i�K�i�O�`�Q�j
// �߂�l  �F�Ȃ�
//======================================================
function CommMeatLevelChange(change_level)
{
	SetNumFlg_("NUM_FLG_SHOP_A01_00_MEET_LEVEL", change_level);
}

//======================================================
// ���ʊ֐��F�Z���^�[�r���̓���̂R�i�K����֐�
//------------------------------------------------------
// �������F�Ȃ�
// �߂�l  �F�Ȃ�
//======================================================
function CommCheckItemShopChangeLv3()
{
	local change_item_id = ITEM_SHOP_EXTEND_ITEM_ID; // �u�ǂ����̒B�l�v�̃A�C�e��ID
	local get_num = GetItemNum_(change_item_id);
	
	if(get_num >= 1){
		AddItem_(change_item_id, -1);
		local change_lv = 3;
		SetNumFlg_("NUM_FLG_SHOP_A01_00_ITEM_LEVEL", change_lv);
		SetEventFlg_("BFG_LOOK_ITEMSHOP_LV_MSG_3", true);
		
		// ���b�Z�[�W�̕\��
		SetExchangeItemName_(change_item_id);
		OpenMsgWnd_();
		ShowMsg_("GIVE_FOR_ITEM_SHOP");
		KeyInputWait_();
		CloseMsgWnd_();
	}
}

//======================================================
// ���ʊ֐��F�Z���^�[�r���̓����̂R�i�K����֐�
//------------------------------------------------------
// �������F�Ȃ�
// �߂�l  �F�Ȃ�
//======================================================
function CommCheckMeatShopChangeLv3()
{
	local change_item_id = MEAT_SHOP_EXTEND_ITEM_ID; // �u�������̋ɈӁv�̃A�C�e��ID
	local get_num = GetItemNum_(change_item_id);
	
	if(get_num >= 1){
		AddItem_(change_item_id, -1);
		local change_lv = 3;
		SetNumFlg_("NUM_FLG_SHOP_A01_00_MEET_LEVEL", change_lv);
		SetEventFlg_("BFG_LOOK_MEATSHOP_LV_MSG_3", true);
		
		// ���b�Z�[�W�̕\��
		SetExchangeItemName_(change_item_id);
		OpenMsgWnd_();
		ShowMsg_("GIVE_FOR_MEAT_SHOP");
		KeyInputWait_();
		CloseMsgWnd_();
	}
}

//===========================================================================
// ���ʊ֐��F���`�z�R/���_�c�~/�z�A�J���̂����ꂩ�̂�т�������Ă��邩����
//---------------------------------------------------------------------------
// ����    �F�Ȃ�
// �߂�l  �Ftrue / false
//===========================================================================
function CommAccessoryCheck()
{
	local get_num_y = GetAccessoryNum_(YATIHOKO_ACCE_ID); // ���`�z�R�̂�т�̑���
	local get_num_w = GetAccessoryNum_(WADATUMI_ACCE_ID); // ���_�c�~�̂�т�̑���
	local get_num_h = GetAccessoryNum_(HOAKARI_ACCE_ID);  // �z�A�J���̂�т�̑���

	DebugPrint(" ");
	DebugPrint("���`�z�R�p�A�C�e���̑����� " + get_num_y + " �ł��B");
	DebugPrint("���_�c�~�p�A�C�e���̑����� " + get_num_w + " �ł��B");
	DebugPrint("�z�A�J���p�A�C�e���̑����� " + get_num_h + " �ł��B");

	if(get_num_y >= 1){
		return true;
	}
	if(get_num_w >= 1){
		return true;
	}
	if(get_num_h >= 1){
		return true;
	}

	return false;
}

//================================================================================
// ���ʊ֐�:���`�z�R/���_�c�~/�z�A�J���̂����ꂩ�̂�т���̂Ă��蕪�������肵����
//          Demo809[����̉��]�̌�ɗ����f���𔻒肷�邽�߂̃t���O�̒l��ۑ�����
//--------------------------------------------------------------------------------
// ����    �F�Ȃ�
// �߂�l  �F�Ȃ�
//================================================================================
function CommLostAccessoryCheck()
{
	local get_num_y = GetAccessoryNum_(YATIHOKO_ACCE_ID); // ���`�z�R�p�A�N�Z�T���̑���
	local get_num_w = GetAccessoryNum_(WADATUMI_ACCE_ID); // ���_�c�~�p�A�N�Z�T���̑���
	local get_num_h = GetAccessoryNum_(HOAKARI_ACCE_ID ); // �z�A�J���p�A�N�Z�T���̑���
	
	// �D�揇�ʂ� 1.�� �� 2.�C �� 3.�� �̏�
	if(get_num_y >= 1){
		// NUM�t���O�ɑ��
		SetNumFlg_("NUM_RELEASE_AND_DECOMPOSE_ACCESSORY", 1);
	}
	else{
		if(get_num_w >= 1){
			// NUM�t���O�ɑ��
			SetNumFlg_("NUM_RELEASE_AND_DECOMPOSE_ACCESSORY", 2);
		}
		else{
			if(get_num_h >= 1){
				SetNumFlg_("NUM_RELEASE_AND_DECOMPOSE_ACCESSORY", 3);
			}
			else{
				// ��O
			}
		}
	}
}

//===========================================================================
// ���ʊ֐��F����ꗗ�ɗ�/�C/��̂����ꂩ�̃X�^�[�s�[�X�����邩����
//---------------------------------------------------------------------------
// ����    �F�Ȃ�
// �߂�l  �Ftrue / false
//===========================================================================
function CommStarPieceCheck()
{
	local get_num_land = GetItemNum_(LAND_STAR_PIECE_ID); // ���̃X�^�[�s�[�X
	local get_num_sea  = GetItemNum_(SEA_STAR_PIECE_ID);  // �C�̃X�^�[�s�[�X
	local get_num_sky  = GetItemNum_(SKY_STAR_PIECE_ID);  // ��̃X�^�[�s�[�X

	DebugPrint(" ");
	DebugPrint("���̃X�^�[�s�[�X�̑����� " + get_num_land + " �ł��B");
	DebugPrint("�C�̃X�^�[�s�[�X�̑����� " + get_num_sea + " �ł��B");
	DebugPrint("��̃X�^�[�s�[�X�̑����� " + get_num_sky + " �ł��B");

	if(get_num_land >= 1){
		return true;
	}
	if(get_num_sea >= 1){
		return true;
	}
	if(get_num_sky >= 1){
		return true;
	}

	return false;
}

//============================================================================
// ���ʊ֐��F���G�X�^�[�N�쐬�����̃`�F�b�N
//----------------------------------------------------------------------------
// ����    �F�Ȃ�
// �߂�l  �Ftrue �� �쐬�\ / false �� �쐬�s��
//============================================================================
function CommCheckBreakEstarkMaking()
{
	// �鉤�̂��炾
	local est_body_num = GetItemNum_(BREAK_ESTARK_01_ID);
	// �鉤�̊��
	local est_joy_num  = GetItemNum_(BREAK_ESTARK_02_ID);
	// �鉤�̓{��
	local est_ang_num  = GetItemNum_(BREAK_ESTARK_03_ID);
	// �鉤�̈�����
	local est_sad_num  = GetItemNum_(BREAK_ESTARK_04_ID);
	// �鉤�̊y����
	local est_fun_num  = GetItemNum_(BREAK_ESTARK_05_ID);

	// ���S�̊č������N���A���Ă��邩�H
	if(GetEventFlg_("BFG_SCENARIO_CLEAR_SAND") == true){
		// �����A�C�e���̃`�F�b�N
		if(est_body_num >= 1){
			if(est_joy_num >= 1){
				if(est_ang_num >= 1){
					if(est_sad_num >= 1){
						if(est_fun_num >= 1){
							return true;
						}
						else{
							return false;
						}
					}
					else{
						return false;
					}
				}
				else{
					return false;
				}
			}
			else{
				return false;
			}
		}
		else{
			return false;
		}
	}
	else{
		return false;
	}
}

//======================================================
// ���ʊ֐��F���V�i���I�̎���̗􂯖ڂ̉��o�Ŏg�����ʏ���
//------------------------------------------------------
// ����    �F�Ȃ�
// �߂�l  �F�Ȃ�
//======================================================
function CommDisplayedWormholeEffect()
{
	local fade_spd  =  40;
	local cam_range = 100;
	local eff_frame =  30;
	// SE�Đ�(�􂯖ڗp��SE)
	PlaySE_("SE_FLD_024");
	// �􂯖ڂɓ���G�t�F�N�g��\��
	LoadEffect_("ef300_35_wormhole_rarity02");
	local efc_01 = SetCameraEffect_("ef300_35_wormhole_rarity02", cam_range);
	Wait_(eff_frame);
	// �Ó]
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, fade_spd);
	SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, fade_spd);
	// �Ó]�����ɍ��킹�āABGM�E�������t�F�[�h�A�E�g
	SetBgmVolume_(0.0, fade_spd);
	WaitFade_();
}

//======================================================
// ���ʊ֐��F���N��Ԃɐݒ肷��
//------------------------------------------------------
// �������F���N��Ԃɐݒ肷�邩
// �߂�l  �F�Ȃ�
//======================================================
function SetPlayerBoy(boy)
{
	SetEventFlg_("BFG_PLAYER_BOY", boy);	// �v���C���[���f�������N��Ԃɂ���
	SetEventFlg_("BFG_NAVIMAP_REACTOR_CONTROL_UNLOCK", !boy);	// ���A�N�^�[���g�p�ł��Ȃ��悤�ɂ���
}

//=============================================================================
// ���ʊ֐��F���A�N�^�[��������������(���A�N�^�[����̂��m�点�̋���)
//-----------------------------------------------------------------------------
// ����  �F�Ȃ�
// �߂�l�F�Ȃ�
//=============================================================================
function CommReactorActionNotice()
{
	local player = GetPlayerId_();

	// ���A�N�^�[������
	PlaySE_("SE_FLD_135");

	// ���C�h���Ă���
	if(IsPlayerRide_()){
		// ���ɉ������Ȃ�
	}
	// ���C�h���Ă��Ȃ�
	else{
		// ��풓���[�V�����Ǎ�
		local reactor = ReadMotion_(player, "Player_touch_reactor");		// ��������������遨���A�N�^�[��G��
		local reactor_L = ReadMotion_(player, "Player_touch_reactor_L");	// ���A�N�^�[��G��L
		SetMotion_(player, reactor, BLEND_M);
		Wait_(BLEND_M);
		SetMotion_(player, reactor_L, BLEND_XL);
	}
	Wait_(45);
}

//=============================================================================
// ���ʊ֐��F���A�N�^�[��������������(���A�N�^�[�������𔭌���������)
//-----------------------------------------------------------------------------
// ����  �F�Ȃ�
// �߂�l�F�Ȃ�
//=============================================================================
function CommReactorActionDiscover()
{
	local player = GetPlayerId_();
	local efc_player;

	// ���A�N�^�[������
	PlaySE_("SE_FLD_135");

	// ���C�h���Ă���
	if(IsPlayerRide_()){
		efc_player = SetSelectBoneEffectPlayer_("ef732_09_light_reactor_c", PLAYER_MODEL.NORMAL, ATTACH_EFFECT1);
	}
	// ���C�h���Ă��Ȃ�
	else{
		// �G�t�F�N�g
		LoadEffect_("ef732_09_light_reactor_c");		// ���A�N�^�[�̌�
		// ��풓���[�V�����Ǎ�
		local reactor = ReadMotion_(player, "Player_touch_reactor");		// ��������������遨���A�N�^�[��G��
		local reactor_L = ReadMotion_(player, "Player_touch_reactor_L");	// ���A�N�^�[��G��L
		SetMotion_(player, reactor, BLEND_M);
		Wait_(BLEND_M);
		SetMotion_(player, reactor_L, BLEND_XL);
		efc_player = SetBoneEffect_("ef732_09_light_reactor_c", player);
	}
	Wait_(45);
}

//======================================================
// ���ʊ֐��F��l���̃��[�V������ҋ@��Ԃɂ���(���C�h���͖�������)
//------------------------------------------------------
// ����  �F�Ȃ�
// �߂�l�F�Ȃ�
//======================================================
function CommResetPlayerMotion()
{
	// ���C�h���Ă���
	if(IsPlayerRide_()){
		// ���ɉ������Ȃ�
	}
	// ���C�h���Ă��Ȃ�
	else{
		local player = GetPlayerId_();
		SetMotion_(player, MOT_WAIT, BLEND_XL);
		Wait_(BLEND_XL);
	}
}

//======================================================
// ���ʊ֐��F�v���C���[�����̉�������
// ( ���ӓ_�F�[���f���I�����̈Ó]�ŕK���uSetManualCalcAlpha_(player, false);�v���s������ )
//------------------------------------------------------
// ����  �F�Ȃ�
// �߂�l�F�Ȃ�
//======================================================
function CommBeforePlayableDemoAlpha()
{
	local player = GetPlayerId_();
	SetManualCalcAlpha_(player, true);   // ���l���X�N���v�g�Őݒ�ł���悤�ɂ���
	SetAlpha_(player, 1);                // ���l��1�ɂ���
}

//======================================================
// ���ʊ֐��F���C�h���̉�b�J�����ݒ�
//------------------------------------------------------
// ����  �Fnpc_id	NPC_ID
// �߂�l�F�Ȃ�
//======================================================
function SetRideTalkCamOffset(npc_id)
{
	local target = GetTargetId_();
	local offset_y = 0;
	local offset_z = 0;
	
	switch(npc_id)
	{
	case OFFSET_RENATE:
		offset_y = -14.0;
		offset_z = 0;
		break;
	case OFFSET_RUKIYA:
		offset_y = -5.0;
		offset_z = 0;
		break;
	default:
		DebugPrint("����NPC (ID:" + npc_id + ") �͏������o�^����Ă��܂���B [SetRideTalkCamOffset]");
		break;
	}
	
	// ���C�h���̏ꍇ
	if(IsPlayerRide_() == true){
		SetTalkCameraEyeOffset_(target, offset_y, offset_z);
	}
	else{
		SetTalkCameraEyeOffset_(target, 0.0, 0.0);
	}
}

//======================================================
// ���ʊ֐��FEventStartOperate�ł�SetTalkAction
//------------------------------------------------------
// ����  �Fnpc_id	NPC_ID
// �߂�l�F�Ȃ�
//======================================================
function EventStartOperateTalkAction(npc_id)
{
	// ���[�V�����𔽉f�����邽��1�t���[���҂�
	CommChangeMomentFadeOut(FADE_COLOR_BLACK);
	// NPC��b�J������ݒ�
	SetTalkAction_(npc_id);
	// �{���̎c��t�F�[�h��ݒ�
	SetFade_(FADE_IN, FADE_COLOR_BLACK, FADE_MAPCHANGE - FADE_SHORT);
	SetFadeSub_(FADE_IN, FADE_COLOR_BLACK, FADE_MAPCHANGE - FADE_SHORT);
}

//======================================================
// ���ʊ֐��F�ړ����u���g�p������
//------------------------------------------------------
// ����  �F�Ȃ�
// �߂�l�F�Ȃ�
//======================================================
function UsingTransfer()
{
	// �Z�[�u����������Ȃ��ꍇ
	if (!GetEventFlg_("BFG_SAVE_POINT_FLAG")) {						// Bit1033
		// �Ó]�������A��l���̑ҋ@���[�V�����������Ȃ��悤�ɂ���
		SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
		SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
		WaitFade_();
		Wait_(30);
		SetFade_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
		SetFadeSub_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
	}
}

//======================================================
// �}�X�^�[�Y���[�h�F�퓬��
//------------------------------------------------------
// ����  �Finfo		�}�X�^�[�Y���[�h���
// �߂�l�F�Ȃ�
//======================================================
function MastersLoad_AfterBattle(info)
{
	// �ŏI�����X�^�[�Ɛ���ĕ��������t���O�Ŕ��f
	if(GetEventFlg_("BFG_CHECK_BATTLE_GOAL_MONSTER") == true){
		// �v���C���[ID�̎擾
		local player = GetPlayerId_();
		
		// ����
		if(GetBattleEndType_() == END_TYPE_WIN){
			SetVisible(player, false);	// �v���C���[�������Ȃ�����
			SetEventFlg_("BFG_RETURN_BATTLE_FIRLD_BGM_HEAD", true);// �t�B�[���hBGM�𓪑ł�
		}
		// �ɂ���
		else if(GetBattleEndType_() == END_TYPE_FLEE){
			SetVisible(player, true);	// �v���C���[��������悤�ɂ���
		}
		// ����
		else{
			SetVisible(player, true);
			SetEventFlg_("BFG_CHECK_BATTLE_GOAL_MONSTER", false);	// �S�[�������X�^�[�Ɛ������
			SetEventFlg_(info.GIMMICK_FLG, false);					// ��Ԃ̗V�уM�~�b�N�N��
			SetEventFlg_("BFG_ARRANGE_FIELD_ITEM", true);			// �t�B�[���h�̃����_���z�u�A�C�e���̔z�u����
		}
	}
}


//======================================================
// �}�X�^�[�Y���[�h�F�t���O�ݒ�
//------------------------------------------------------
// ����  �Finfo		�}�X�^�[�Y���[�h���
// �߂�l�F�Ȃ�
//======================================================
function MastersLoad_SetFlag(info)
{
	// ���t���O�擾
	local gim_start_flg = GetEventFlg_(info.GIMMICK_FLG);			// ��Ԃ̗V�уM�~�b�N�N��
	local gim_clear_flg = GetEventFlg_(info.GIMMICK_CLEAR_FLG);		// ��Ԃ̗V�я���N���A
	local metal_select = true;										// ���^���z�u  true:�����ς݁i��z�u�j  false:�������i�z�u�j
	
	// ���󔠔z�u�t���O
	if(gim_start_flg == true){	//�N����
		if(gim_clear_flg == true){
			SetEventFlg_("BFG_SPACE_TREASURE_UNLOCK", true);	//153
			metal_select = false;
		}else{
			SetEventFlg_("BFG_SPACE_TREASURE_UNLOCK", false);
		}
	}else{	//���N����
		SetEventFlg_("BFG_SPACE_TREASURE_UNLOCK", false);
	}
	DebugPrint("<----------  �}�X�^�[�Y���[�h  ���^���z�u���I  "+metal_select+"  ----------->")
	SetEventFlg_("BFG_ENCOUNTBIT_017", metal_select);	// 717
	SetEventFlg_("BFG_ENCOUNTBIT_018", metal_select);	// 718
	SetEventFlg_("BFG_ENCOUNTBIT_019", metal_select);	// 719
	SetEventFlg_("BFG_ENCOUNTBIT_020", metal_select);	// 720
}


//======================================================
// �}�X�^�[�Y���[�h�F�z�u����
//------------------------------------------------------
// ����  �Finfo		�}�X�^�[�Y���[�h���
// �߂�l�F�Ȃ�
//======================================================
function MastersLoad_Setting(info)
{
	// ���t���O
	local gim_start_flg = GetEventFlg_(info.GIMMICK_FLG);		// ��Ԃ̗V�уM�~�b�N�N��
	local gim_clear_flg = GetEventFlg_(info.GIMMICK_CLEAR_FLG);	// ��Ԃ̗V�я���N���A
	
	// �J�E���g�_�E���\���p�̃t���O������
	SetEventFlg_("BFG_SPACE_GIMMICK_COUNTDOWN", false);
	
	// ���M�~�b�N
	// �N���X�C�b�`
	local id_keyhole = ReadGimmick_("o_com_19");		// ��΃X�C�b�`
	g_keyhole = ArrangePointGimmick_("o_com_19", id_keyhole, "g_keyhole");
	if(gim_start_flg == false){
		SetMotion_(g_keyhole, MOT_GIMMICK_0, BLEND_N);	// �N���O
	}
	else{
		SetMotion_(g_keyhole, MOT_GIMMICK_2, BLEND_N);	// �N����
	}
	
	// �S�[���|�C���g
	if(gim_start_flg == true){
		local id_goal = ReadGimmick_("o_com_38");		// �S�[���|�C���g
		g_keyhole_goal_point = ArrangePointGimmick_("o_com_38", id_goal, "g_keyhole_goal_mine");
		SetMotion_(g_keyhole_goal_point, MOT_GIMMICK_0, BLEND_N);
	}
	
	// ��NPC
	local id_sp_monster;
	// �M�~�b�N�N���t���O�������Ă�����SP�����X�^�[��z�u
	if(gim_start_flg == true){
		if(gim_clear_flg == false){
			// ����			���b��d�l�ׁ̈A���������X�^�[
			id_sp_monster = ReadNpc_(info.BOSS_ID_1);
		}
		else{
			// �Q��ڈȍ~	���b��d�l�ׁ̈A���������X�^�[
			id_sp_monster = ReadNpc_(info.BOSS_ID_2);
		}
		g_keyhole_npc = ArrangePointNpc_(id_sp_monster, "g_keyhole_npc");
		if(gim_clear_flg == false){
			SetScaleSilhouette(g_keyhole_npc, info.BOSS_SCALE_1, info.BOSS_SILHOUETTE_1);
		}
		else{
			SetScaleSilhouette(g_keyhole_npc, info.BOSS_SCALE_2, info.BOSS_SILHOUETTE_2);
		}
		//SetReactorMsg_(g_keyhole_npc, ""); // ���A�N�^�[���b�Z�[�W�͖��ݒ�
		SetTalkEnable_(g_keyhole_npc, false);
		SetMotion_(g_keyhole_npc, MOT_WAIT, BLEND_N);
	}
	
	// ���n��
	// ��Ԃ̗V�уC�x���g�̋N���p�M�~�b�N�ɐݒu����n��
	g_keyhole_mine = SetPointCircleEventMine_("g_keyhole_mine", true);
	
	// �S�[���̒��n�_�̒n��
	if(gim_start_flg == true){
		g_keyhole_goal_mine = SetPointCircleEventMine_("g_keyhole_goal_mine", false);
	}
	
	// ���}�b�v�i�r(�S�[���n�_)
	local navi_goal	 = ArrangePointNaviMapIcon_(NAVIMAP_ICON.GOAL, "g_keyhole_navi_goal");
	SetNaviMapIconVisible_(navi_goal, false);
	if(gim_start_flg == true){
		SetNaviMapIconVisible_(navi_goal, true);
	}
}


//======================================================
// �}�X�^�[�Y���[�h�F�J�E���g�_�E��
//------------------------------------------------------
// ����  �Finfo		�}�X�^�[�Y���[�h���
// �߂�l�F�Ȃ�
//======================================================
function MastersLoad_CountDown(info)
{
	if(GetEventFlg_(info.GIMMICK_FLG) == true){						// ��Ԃ̗V�уM�~�b�N�N���t���O
		if(GetEventFlg_("BFG_SPACE_GIMMICK_COUNTDOWN") == false){	// ��Ԃ̗V�уM�~�b�N�ŃJ�E���g�_�E���\���𐧌䂷��t���O
			SetEventFlg_("BFG_SPACE_GIMMICK_COUNTDOWN", true);
			// �J�E���g�_�E�����C�A�E�g�̕\��
			LoadLayout_("masters_road");
			SetLayoutAnime_("start_count3", false);		// �R
			WaitLayoutAnime();
			SetLayoutAnime_("start_count2", false);		// �Q
			WaitLayoutAnime();
			SetLayoutAnime_("start_count1", false);		// �P
			WaitLayoutAnime();
			PlaySE_("SE_FLD_002");						// ���[�X�E�X�^�[�g�\��
			SetLayoutAnime_("race_start", false);		// �r�s�`�q�s
		}
	}
}


//======================================================
// �}�X�^�[�Y���[�h�F�퓬����
//------------------------------------------------------
// ����  �Finfo		�}�X�^�[�Y���[�h���
// �߂�l�F�Ȃ�
//======================================================
function MastersLoad_BattleJudgment(info)
{
	// �t���O�擾
	local gim_clear_flg = GetEventFlg_(info.GIMMICK_CLEAR_FLG);		// ��Ԃ̗V�я���N���A
	
	if(GetEventFlg_("BFG_CHECK_BATTLE_GOAL_MONSTER") == true){		// �S�[�������X�^�[�Ɛ������
		// ���[�V�����̐ݒ�
		SetMotion_(g_keyhole_npc, MOT_WAIT, BLEND_N);
		// �v���C���[ID�擾
		local player = GetPlayerId_();
		
		DebugPrint("��Ԃ̗V�уC�x���g�p�̐퓬����ł��B");
		// ��������
		if(GetBattleEndType_() == END_TYPE_WIN){
			// �`�������Ȃ������߂ɂP�t���[���ňÓ]
			CommChangeMomentFadeOut(FADE_COLOR_BLACK)
			// �J������ݒu
			SetPointCameraEye_(info.CAMERA_EYE);
			SetPointCameraTarget_(info.CAMERA_TGT);
			Wait_(15);
			// �t�F�[�h�C��
			SetFade_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
			WaitFade_();
			
			// 2��ڈȍ~�ŋK��^�[�����ȏォ�������ꍇ
			local lmt_round = GetBattleRound_();
			if(gim_clear_flg == true && lmt_round >= 6){
				// �͗ʕs�����b�Z�[�W
				OpenMsgWnd_();
				SetExchangeMonsterKindName_(info.BOSS_EXCHANGE_ID);
				SetTalkName_("NAME_TAG_REACTOR");
				ShowMsg_("MASTERS_LOAD_REACTOR_MSG_150");				//�u�c�O�Ȃ���@�������X�^�[�̖��O����
				KeyInputWait_();
				CloseMsgWnd_();
				// �����X�^�[���t�F�[�h�A�E�g
				SetManualCalcAlpha_(g_keyhole_npc, true);
				local task = Task_ObjectFadeOut_(g_keyhole_npc, FADE_DEF);
				WaitTask(task);
				// ���b�Z�[�W
				OpenMsgWnd_();
				SetExchangeMonsterKindName_(info.BOSS_EXCHANGE_ID);
				ShowMsg_("MASTERS_LOAD_SYSTEM_MSG_130");				// <exchange/>�͂��̏ꂩ��@�����Ă��܂����I
				KeyInputWait_();
				CloseMsgWnd_();
				// ���A�N�^�[
				OpenMsgWnd_();
				SetTalkName_("NAME_TAG_REACTOR");
				ShowMsg_("MASTERS_LOAD_REACTOR_MSG_160");				// �u�ȏ�Ł@����̃}�X�^�[�Y���[�h��
				KeyInputWait_();
				CloseMsgWnd_();
				// �t�F�[�h�A�E�g
				SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
				WaitFade_();
				// �t���O��ݒ�
				SetEventFlg_(info.GIMMICK_FLG, false);
				SetEventFlg_("BFG_CHECK_BATTLE_GOAL_MONSTER", false);
				SetEventFlg_("BFG_SPACE_GIMMICK_COUNTDOWN", false);
				// �z�u�A�C�e���̐���؂�ւ��i��Ԃ̗V�їp���ʏ�p�j
				SetEventFlg_("BFG_ARRANGE_FIELD_ITEM", true);
				// ��Ԃ̗V�я����Ń}�b�v�`�F���W�������ǂ����̃t���O��ݒ�
				SetEventFlg_("BFG_RETURN_SPACE_GIMMICK_WIN", true);
				// �z�u���������X�^�[�m�o�b���폜���邽�߂Ƀ}�b�v�`�F���W
				ChangeMapPosDir_(info.MAP_ID, Vec3(info.XPOS_1, info.YPOS_1, info.ZPOS_1), info.DIR_1);
			}
			// 1��ڂ�2��ڈȍ~�̋K��^�[�����ȓ��ŏ������ꍇ (��{�I�ɂ������ʂ邱�ƂɂȂ�)
			else{
				// ���Ԃɂ��郁�b�Z�[�W
				// �Ώۃ����X�^�[
				OpenMsgWnd_();
				SetTalkName_("NAME_TAG_REACTOR");
				SetExchangeMonsterKindName_(info.BOSS_EXCHANGE_ID);
				// 1���
				if(gim_clear_flg == false){
					ShowMsg_("MASTERS_LOAD_REACTOR_MSG_130");	// �u�}�X�^�[�Y���[�h�@���S�N���A�ł��B
				}
				// 2��ڈȍ~
				else{
					ShowMsg_("MASTERS_LOAD_REACTOR_MSG_140");	// �u�T�^�[���ȓ��Ɂ@�퓬�ɏ��������̂Łc�c
				}
				KeyInputWait_();
				CloseMsgWnd_();
				
				// �V�X�e��
				OpenMsgWnd_();
				SetExchangeMonsterKindName_(info.BOSS_EXCHANGE_ID);
				ShowMsg_("MASTERS_LOAD_SYSTEM_MSG_120");		// <exchange/>�����ԂɂȂ����I
				// ����ME(�d�v�A�C�e���擾�Ɠ���Redmine#2831)
				PlayMe_("ME_010");
				WaitMe_();
				KeyInputWait_();
				CloseMsgWnd_();
				
				// ���Ԃɂ��郂���X�^�[�p�����[�^���w��
				local enemy_param;
				if(gim_clear_flg == false){ enemy_param = info.BOSS_PARAMETER_1; }
				if(gim_clear_flg == true){  enemy_param = info.BOSS_PARAMETER_2; }
				// ���O�t����ʂֈڍs
				local tsk_named_wnd = Task_AddFellow_(enemy_param, false);
				WaitTask(tsk_named_wnd);
				// �t���O��ݒ�
				SetEventFlg_(info.GIMMICK_FLG, false);
				SetEventFlg_("BFG_CHECK_BATTLE_GOAL_MONSTER", false);
				SetEventFlg_("BFG_SPACE_GIMMICK_COUNTDOWN", false);
				SetEventFlg_(info.GIMMICK_CLEAR_FLG, true);
				// �z�u�A�C�e���̐���؂�ւ��i��Ԃ̗V�їp���ʏ�p�j
				SetEventFlg_("BFG_ARRANGE_FIELD_ITEM", true);
				
				// �����㋤�ʏ���
				// �����X�^�[���t�F�[�h�A�E�g
				SetManualCalcAlpha_(g_keyhole_npc, true);
				local task = Task_ObjectFadeOut_(g_keyhole_npc, FADE_DEF);
				WaitTask(task);
				
				// �J�����؂�ւ������邽�߁A�t�F�[�h�A�E�g
				SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
				WaitFade_();
				// �v���C���[���f��
				SetVisible(player, true);
				// �J���������ɖ߂�
				SetPlayableCamera_();
				// �t�F�[�h�C��
				SetFade_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
				WaitFade_();
				
				// ���A�N�^�[
				OpenMsgWnd_();
				SetTalkName_("NAME_TAG_REACTOR");
				ShowMsg_("MASTERS_LOAD_REACTOR_MSG_160");			// �u�ȏ�Ł@����̃}�X�^�[�Y���[�h��
				KeyInputWait_();
				CloseMsgWnd_();
				
				// �t�F�[�h�A�E�g
				SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
				WaitFade_();
				// ��Ԃ̗V�я����Ń}�b�v�`�F���W�������ǂ����̃t���O��ݒ�
				SetEventFlg_("BFG_RETURN_SPACE_GIMMICK_WIN", true);
				// �z�u���������X�^�[�m�o�b���폜���邽�߂Ƀ}�b�v�`�F���W
				ChangeMapPosDir_(info.MAP_ID, Vec3(info.XPOS_1, info.YPOS_1, info.ZPOS_1), info.DIR_1);
			}
		}
		// �ɂ���
		else if(GetBattleEndType_() == END_TYPE_FLEE){
			// SP�����X�^�[�Ƃ̐퓬�t���O���~�낷
			SetEventFlg_("BFG_CHECK_BATTLE_GOAL_MONSTER", false);
			SetEventFlg_("BFG_SPACE_GIMMICK_COUNTDOWN", false);
			// �J������ʏ��Ԃɖ߂��܂�
			SetPlayableCamera_();
		}
		else{
			// �u�s�k���v������ʂ�Ȃ��̂ŃA�t�^�[�o�g���ŏ���
			SetEventFlg_("BFG_CHECK_BATTLE_GOAL_MONSTER", false);
			SetEventFlg_("BFG_SPACE_GIMMICK_COUNTDOWN", false);
		}
	} else {
		// ��Ԃ̗V�я����Ń}�b�v�`�F���W���Ă������Ƀ��b�Z�[�W���o��
		if(GetEventFlg_("BFG_RETURN_SPACE_GIMMICK_WIN")){
			// ���b�Z�[�W�����o�����߁A3D�ʂɃt�F�[�h
			SetFadePlane_(FADE_PLANE.PLANE_3D);
			SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
			SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
			WaitFade_();
			
			// �V�X�e�����b�Z�[�W
			OpenMsgWnd_();
			ShowMsg_("MASTERS_LOAD_SYSTEM_MSG_140");			// �}�X�^�[�Y���[�h�́@�����ւƁ@��΂��ꂽ�I
			KeyInputWait_();
			CloseMsgWnd_();
			// ��Ԃ̗V�я����Ń}�b�v�`�F���W�������ǂ����̃t���O�����낷
			SetEventFlg_("BFG_RETURN_SPACE_GIMMICK_WIN", false);
			
			// �t�F�[�h�C��
			SetFade_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
			SetFadeSub_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
			WaitFade_();
		}
	}
}


//======================================================
// �}�X�^�[�Y���[�h�F�J�n�n�� �ڐG����
//------------------------------------------------------
// ����  �Finfo		�}�X�^�[�Y���[�h���
// �߂�l�F�Ȃ�
//======================================================
function MastersLoad_MineStart(info)
{
	// �M�~�b�N�Ɏ�l����������
	CommPlayerTurnAroundObj(g_keyhole);
	// �M�~�b�N�N���t���O���`�F�b�N
	local gim_start_flg = GetEventFlg_(info.GIMMICK_FLG);
	// �M�~�b�N����N���A�t���O���`�F�b�N
	local gim_clear_flg = GetEventFlg_(info.GIMMICK_CLEAR_FLG);
	// ��Ղ̃J�M�i���j�������Ă��邩���`�F�b�N
	local check_item_num = GetItemNum_(info.GIMMICK_KEY_ID);
	DebugPrint("��Ղ̃J�M�i���j�� " + check_item_num + " �ł��B");
	
	if(check_item_num >= 1){
		if(gim_start_flg == false){
			// ���b�Z�[�W
			OpenMsgWnd_();
			ShowMsg_("MASTERS_LOAD_SYSTEM_MSG_010");		// �Âт��@��Ղ�����B
			KeyInputWait_();
			SetExchangeItemName_(info.GIMMICK_KEY_ID);
			ShowMsg_("MASTERS_LOAD_SYSTEM_MSG_030");		// �����Ă���@���A�C�e��������
			KeyInputWait_();
			CloseMsgWnd_();
			// ���b�Z�[�W
			CommReactorActionNotice();		// ���A�N�^�[���������������̋��ʏ���
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_REACTOR");
			SetExchangeItemName_(info.GIMMICK_KEY_ID);
			ShowMsg_("MASTERS_LOAD_REACTOR_MSG_010");		//�u�}�X�^�[�Y���[�h�ɂ���
			KeyInputWait_();
			SetExchangeItemName_(info.GIMMICK_KEY_ID);
			ShowMsg_(info.GIMMICK_MSG_ID);		//�u���������N�́@�}�X�^�[�Y���[�h��
			KeyInputWait_();
			CloseMsgWnd_();
			CommResetPlayerMotion();		// ���[�V������ҋ@��Ԃɖ߂����ʏ���
			// �u�͂��v
			if(GetQueryResult_() == QUERY2_0){
				// �󔠔z�u�t���O
				if(gim_clear_flg == true){
					SetEventFlg_("BFG_SPACE_TREASURE_UNLOCK", true);
				}else{
					SetEventFlg_("BFG_SPACE_TREASURE_UNLOCK", false);
				}
				// �n���폜
				DeleteEventMine_(g_keyhole_mine);
				// ���b�Z�[�W
				OpenMsgWnd_();
				SetExchangeItemName_(info.GIMMICK_KEY_ID);
				ShowMsg_("MASTERS_LOAD_SYSTEM_MSG_040");		// ��ՂɁ��A�C�e�������i���j���g�����I
				KeyInputWait_();
				CloseMsgWnd_();
				// SE�Đ�
				PlaySE_("SE_FLD_065");		// �����̈�ՃX�C�b�`�N��
				// �N���A�j��
				SetMotion_(g_keyhole, MOT_GIMMICK_1, BLEND_M);
				Wait_(30);
				// �Δ�͌���Ȃ�
				SetMotion_(g_keyhole, MOT_GIMMICK_2, BLEND_M);
				Wait_(30);
				// �t�F�[�h�A�E�g
				SetFadePlane_(FADE_PLANE.PLANE_3D);
				SetFade_(FADE_OUT, FADE_COLOR_BLACK, 15);
				SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, 15);
				WaitFade_();
				Wait_(10);
				
				// ��ԗV�уM�~�b�N�̊J�n����
				SetEventFlg_(info.GIMMICK_FLG, true);			// ��Ԃ̗V�уM�~�b�N�N���t���O
				SetEventFlg_("BFG_ARRANGE_FIELD_ITEM", false);	// �z�u�A�C�e���̐���؂�ւ��i�ʏ�p �� ��Ԃ̗V�їp�j
				
				// �ΐ탂���X�^�[���m�o�b�Ƃ��Ĕz�u
				local id_sp_monster;
				if(gim_start_flg == true){
					if(gim_clear_flg == false){
						// ����
						id_sp_monster = ReadNpc_(info.BOSS_ID_1);
					}
					else{
						// �Q��ڈȍ~
						id_sp_monster = ReadNpc_(info.BOSS_ID_2);
					}
					g_keyhole_npc = ArrangePointNpc_(id_sp_monster, "g_keyhole_npc");
					if(gim_clear_flg == false){
						// ����
						SetScaleSilhouette(g_keyhole_npc, info.BOSS_SCALE_1, info.BOSS_SILHOUETTE_1);
					}
					else{
						// �Q��ڈȍ~
						SetScaleSilhouette(g_keyhole_npc, info.BOSS_SCALE_2, info.BOSS_SILHOUETTE_2);
					}
					//SetReactorMsg_(g_keyhole_npc, ""); // ���A�N�^�[���b�Z�[�W�͖��ݒ�
					SetTalkEnable_(g_keyhole_npc, false);
				}
				// �f���Đ���̎�l���̕��A�ʒu
				SetReturnDemoPosDir_(Vec3(info.XPOS_1, info.YPOS_1, info.ZPOS_1), info.DIR_1);
				WeatherTimeChangeDemo(info.DEMO_NUM);	// �V��Ǝ��Ԃ��f���Ɉ����p��
			}
			// �u�������v
			else{
				// ���ɂȂɂ����Ȃ�
			}
		}
		// ��ՃX�C�b�`�N����
		else{
			// �V�X�e�����b�Z�[�W�\��
			OpenMsgWnd_();
			ShowMsg_("MASTERS_LOAD_SYSTEM_MSG_050");	// ���A�N�^�[���@���������I
			KeyInputWait_();
			CloseMsgWnd_();
			// ���A�N�^�[���b�Z�[�W�\��
			CommReactorActionNotice();					// ���A�N�^�[���������������̋��ʏ���
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_REACTOR");
			ShowMsg_("MASTERS_LOAD_REACTOR_MSG_020");	// �@�\���I�����邩�́@�m�F������܂����B
			KeyInputWait_();
			CloseMsgWnd_();
			CommResetPlayerMotion();					// ���[�V������ҋ@��Ԃɖ߂����ʏ���
			// �u�͂��v
			if(GetQueryResult_() == QUERY2_0){
				// �n���폜
				DeleteEventMine_(g_keyhole_mine);
				// SE�Đ�
				PlaySE_("SE_FLD_071");
				// �I���A�j��
				SetMotion_(g_keyhole, MOT_GIMMICK_3, BLEND_M);
				Wait_(30);
				// ��ԗV�уM�~�b�N�̏I������
				SetEventFlg_(info.GIMMICK_FLG, false);			// ��Ԃ̗V�уM�~�b�N�N���t���O
				SetEventFlg_("BFG_ARRANGE_FIELD_ITEM", true);	// �z�u�A�C�e���̐���؂�ւ��i�ʏ�p �� ��Ԃ̗V�їp�j
				// �t�F�[�h�A�E�g
				SetFadePlane_(FADE_PLANE.PLANE_3D);
				SetFade_(FADE_OUT, FADE_COLOR_BLACK, 15);
				SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, 15);
				WaitFade_();
				Wait_(10);
				// ���b�Z�[�W�\��
				OpenMsgWnd_();
				ShowMsg_("MASTERS_LOAD_SYSTEM_MSG_060");		// �}�X�^�[�Y���[�h���@�@�\���~�����I
				KeyInputWait_();
				CloseMsgWnd_();
				// �J�E���g�_�E���\���̃t���O���~�낷
				SetEventFlg_("BFG_SPACE_GIMMICK_COUNTDOWN", false);
				// �z�u���������X�^�[�m�o�b���폜���邽�߂Ƀ}�b�v�`�F���W
				ChangeMapPosDir_(info.MAP_ID, Vec3(info.XPOS_1, info.YPOS_1, info.ZPOS_1), info.DIR_1);
			}
		}
	}
	// ��Ղ̌��������Ă��Ȃ��ꍇ
	else{
		// ���b�Z�[�W�\��
		OpenMsgWnd_();
		ShowMsg_("MASTERS_LOAD_SYSTEM_MSG_010");			// �Âт��@��Ղ�����B
		KeyInputWait_();
		ShowMsg_("MASTERS_LOAD_SYSTEM_MSG_020");			// ���ׂĂ݂Ă��@�����͂Ȃ��悤���c�c�B
		KeyInputWait_();
		CloseMsgWnd_();
	}
}


//======================================================
// �}�X�^�[�Y���[�h�F�S�[���n�� �ڐG����
//------------------------------------------------------
// ����  �Finfo		�}�X�^�[�Y���[�h���
// �߂�l�F�Ȃ�
//======================================================
function MastersLoad_MineGoal(info)
{
	// �M�~�b�N����N���A�t���O���`�F�b�N
	local gim_clear_flg = GetEventFlg_(info.GIMMICK_CLEAR_FLG);
	// �v���C���[ID�擾
	local player = GetPlayerId_();
	
	// �����X�^�[�̕����Ɍ�����
	CommPlayerTurnAroundObj(g_keyhole_npc);
	
	// �uFINISH�v���o��
	LoadLayout_("masters_road");
	PlaySE_("SE_FLD_003");						// ���[�X�E�^�C���A�b�v
	SetLayoutAnime_("race_finish", false);
	WaitLayoutAnime();
	
	//�t�F�[�h�A�E�g
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
	SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
	WaitFade_();
	// ��l���ƃS�[���|�C���g�������Ȃ�����
	SetVisible(player, false);
	SetVisible(g_keyhole_goal_point, false);
	// �J������ݒu
	SetPointCameraEye_(info.CAMERA_EYE);
	SetPointCameraTarget_(info.CAMERA_TGT);
	//�t�F�[�h�C��
	SetFade_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
	WaitFade_();
	
	// ���A�N�^�[������
	PlaySE_("SE_FLD_135");
	Wait_(45);
	// ���A�N�^�[���b�Z�[�W
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_REACTOR");
	// 1���
	if(gim_clear_flg == false){
		ShowMsg_("MASTERS_LOAD_REACTOR_MSG_110");	// �u�S�[���L�[�p�[�Ɛ킢�@���������
	}
	// 2��ڈȍ~
	else{
		ShowMsg_("MASTERS_LOAD_REACTOR_MSG_120");	// �u�T�^�[���ȓ��Ł@�S�[���L�[�p�[�Ɂ@���������
	}
	KeyInputWait_();
	CloseMsgWnd_();
	// �V�X�e��
	OpenMsgWnd_();
	SetExchangeMonsterKindName_(info.BOSS_EXCHANGE_ID);
	ShowMsg_("MASTERS_LOAD_SYSTEM_MSG_110");		// �킢�܂����H
	KeyInputWait_();
	CloseMsgWnd_();
	// �u�͂��v
	if(GetQueryResult_() == QUERY2_0){
		// �퓬���[�V����
		PlaySE_("SE_FLD_088");
		SetMotion_(g_keyhole_npc, MOT_ATTACK, BLEND_N);
		Wait_(30);
		// ��Ԃ̗V�їp�ɐݒu�����S�[�������X�^�[�Ɛ�������t���O��ǉ�
		SetEventFlg_("BFG_CHECK_BATTLE_GOAL_MONSTER", true);
		// ���C�h�����܂ܐ퓬�ɓ���ƃn���O����̂Œn����������ID�̏��������s��
		DeleteEventMine_(g_keyhole_goal_mine);
		g_keyhole_goal_mine = C_NONE_ID;
		InhibitMonsterGenerate_( 10000.0 );	// ���̜͂p�j�����X�^�[���폜
		// �키
		if(gim_clear_flg == false){ ChangeBattleParty_(info.BOSS_PARTY_TABLE_1); }// 1���
		if(gim_clear_flg == true){  ChangeBattleParty_(info.BOSS_PARTY_TABLE_2); }// 2��ڈȍ~
	}
	// �u�������v
	else{
		// �t�F�[�h�A�E�g
		SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
		WaitFade_();
		// �v���C���[���f��
		SetVisible(player, true);
		// �J������ʏ��Ԃɖ߂�
		SetPlayableCamera_();
		SetCameraDir_(info.DIR_2);
		// ��l���������X�^�[���痣�ꂽ�Ƃ���ɔz�u
		SetPos_(player, Vec3(info.XPOS_2, info.YPOS_2, info.ZPOS_2));
		SetDir_(player, info.DIR_2);
		
		// �S�[���G�t�F�N�g���ĕ\��
		SetVisible(g_keyhole_goal_point, true);
		
		// �t�F�[�h�C��
		SetFade_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
		SetFadeSub_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
		WaitFade_();
	}
}

