// �퓬�J�n�i�������j

// ������
function Init()
{
	DebugPrint("BATTLE001_function_Init");
	BattleCommon_Init();
	//�����X�^�[�̔z�u�͏����ݒ�̂��̂𗘗p
	local Index = GetAllyIndex_(0)
	cParty <- cFullPartyInfo(Index);
	
}

// �X�V
function Update()
{
	DebugPrint("BATTLE001_function_Update");
	//CameraDate��BattleCommon�ɓ���
	ChangeIndexPointData_(BATTLE_COMMON_POINT_DATA);
	local Ally = true;
	local Enemy = false;
	local AllyPartyType = Get_PartyType(Ally);
	local EnemyPartyType = Get_PartyType(Enemy);
	
	AllyBattleStartCut(AllyPartyType);
	
	//SetMotion_(GetAllyMaster_() , MOT_BATTLE_WAIT, 0);
	
	//���E�p����
	//AllyEscapeCut(AllyPartyType);
	
	BatteleScript_End();
}

function AllyBattleStartCut(PartyType)
{
	DebugPrint("BATTLE001_function_AllyBattleStartCut");
	DebugPrint("	=>	PartyType : " + PartyType);
	local Random = GetRandom_(3);
	local CameraTask = null;
	local RideFlag = true;
	//�r�m�l�\��
	if(PartyType == PARTYTYPE.S4 || PartyType == PARTYTYPE.S3 || PartyType == PARTYTYPE.S2 || PartyType == PARTYTYPE.S1){
		if(cParty.MFlag != true){
			//�r�m�\��
			if(RideFlag == true){
				//���C�h��Ԃ̏ꍇ
				//CameraTask = Task_AnimeMoveCamera_("camera_300_ALLY_S_RIDEON", "camtgt_300_ALLY_S_RIDEON");
				CameraTask = Task_AnimeMoveCamera_("camera_300_ALLY_S_RIDEOFF", "camtgt_300_ALLY_S_RIDEOFF");
				Wait_(38);
			} else {
				//�񃉃C�h��Ԃ̏ꍇ
				CameraTask = Task_AnimeMoveCamera_("camera_300_ALLY_S_RIDEOFF", "camtgt_300_ALLY_S_RIDEOFF");
				Wait_(38);
			}
		} else {
			//�l�\��
			if(RideFlag == true){
				//���C�h��Ԃ̏ꍇ
				//CameraTask = Task_AnimeMoveCamera_("camera_300_ALLY_S_RIDEON", "camtgt_300_ALLY_S_RIDEON");
				CameraTask = Task_AnimeMoveCamera_("camera_300_ALLY_S_RIDEOFF", "camtgt_300_ALLY_S_RIDEOFF");
				//Wait_(36);
				Wait_(38);
			} else {
				//�񃉃C�h��Ԃ̏ꍇ
				CameraTask = Task_AnimeMoveCamera_("camera_300_ALLY_S_RIDEOFF", "camtgt_300_ALLY_S_RIDEOFF");
				Wait_(38);
			}
		}
	//�f�̍\��
	} else if (PartyType == PARTYTYPE.SG || PartyType == PARTYTYPE.GS || PartyType == PARTYTYPE.G1) {
			if(RideFlag == true){
				//���C�h��Ԃ̏ꍇ
				//CameraTask = Task_AnimeMoveCamera_("camera_310_ALLY_SG_RIDEON", "camtgt_310_ALLY_SG_RIDEON");
				CameraTask = Task_AnimeMoveCamera_("camera_310_ALLY_SG_RIDEOFF", "camtgt_310_ALLY_SG_RIDEOFF");
				Wait_(60);
			} else {
				//�񃉃C�h��Ԃ̏ꍇ
				CameraTask = Task_AnimeMoveCamera_("camera_310_ALLY_SG_RIDEOFF", "camtgt_310_ALLY_SG_RIDEOFF");
				Wait_(60);
			}
	//�s�̍\��
	} else if (PartyType == PARTYTYPE.T1) {
			if(RideFlag == true){
				//���C�h��Ԃ̏ꍇ
				//CameraTask = Task_AnimeMoveCamera_("camera_320_ALLY_T1_RIDEON", "camtgt_320_ALLY_T1_RIDEON");
				CameraTask = Task_AnimeMoveCamera_("camera_320_ALLY_T1_RIDEOFF", "camtgt_320_ALLY_T1_RIDEOFF");
				Wait_(60);
			} else {
				//�񃉃C�h��Ԃ̏ꍇ
				CameraTask = Task_AnimeMoveCamera_("camera_320_ALLY_T1_RIDEOFF", "camtgt_320_ALLY_T1_RIDEOFF");
				Wait_(60);
			}		
	}
	//DeleteTask_(CameraTask);
}

function AllyEscapeCut(PartyType)
{
	DebugPrint("BATTLE001_function_AllyEscapeCut");
	DebugPrint("	=>	PartyType : " + PartyType);
	local Random = GetRandom_(3);
	local CameraTask = null;
	//�r�S�\��
	if(PartyType == PARTYTYPE.S4){
		CameraTask = Task_AnimeMoveCamera_("camera_300_ALLY_S4_00", "camtgt_300_ALLY_S4_00");
		
		Wait_(30);
	//�r�R�̍\��
	} else if (PartyType == PARTYTYPE.S3) {
		CameraTask = Task_AnimeMoveCamera_("camera_300_ALLY_S4_00", "camtgt_300_ALLY_S4_00");
		
		Wait_(60);
	//�r�Q�̍\��
	} else if (PartyType == PARTYTYPE.S2) {
		CameraTask = Task_AnimeMoveCamera_("camera_300_ALLY_S4_00", "camtgt_300_ALLY_S4_00");
		
		Wait_(60);
	//�r�P�̍\��
	} else if (PartyType == PARTYTYPE.S1) {
		CameraTask = Task_AnimeMoveCamera_("camera_300_ALLY_S4_00", "camtgt_300_ALLY_S4_00");
		
		Wait_(60);
	//�r�f�̍\��
	} else if (PartyType == PARTYTYPE.SG) {
		CameraTask = Task_AnimeMoveCamera_("camera_300_ALLY_S4_00", "camtgt_300_ALLY_S4_00");
		
		Wait_(60);
	//�f�r�̍\��
	} else if (PartyType == PARTYTYPE.GS) {
		CameraTask = Task_AnimeMoveCamera_("camera_300_ALLY_S4_00", "camtgt_300_ALLY_S4_00");
		
		Wait_(60);
	//�f�P�̍\��
	} else if (PartyType == PARTYTYPE.G1) {
		CameraTask = Task_AnimeMoveCamera_("camera_300_ALLY_S4_00", "camtgt_300_ALLY_S4_00");
		
		Wait_(60);
	//�s�P�̍\��
	} else if (PartyType == PARTYTYPE.T1) {
		CameraTask = Task_AnimeMoveCamera_("camera_300_ALLY_S4_00", "camtgt_300_ALLY_S4_00");
		
		Wait_(60);
	}
	DeleteTask_(CameraTask);

}
