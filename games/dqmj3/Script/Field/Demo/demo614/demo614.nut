//=============================================
//
//		demo614[�K���r���X�̖\��_2(�ԕ�����)]
//
//=============================================

//-------------------------------------------------------------------------
//
//		�ǂݍ��݁E�z�u
//
//-------------------------------------------------------------------------
function Update()
{
	
// ���ϐ���`
	local task_cam;
	local efc_dark_energy;

// �����\�[�X�Ǎ�
	// �L�����N�^�[
	local player = GetPlayerId_();					// ��l��
	
	//�M�~�b�N
	local model_coa000 = ReadGimmick_("o_dem_19");	// �R�A�O��
	
	//�G�t�F�N�g
	LoadEffect_("ef861_15_dark_energy");			// �ǂ������G�l���M�[
	
	
// ���z�u
	// ��l��
	SetPointPos_(player, "player000");

	// �M�~�b�N
	local coa000 = ArrangePointGimmick_("o_dem_19", model_coa000, "obj_coa000");

// ���J�����ݒ�
	local task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");
	
//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------
		
	
	StartDemo(FADE_COLOR_BLACK);
	Wait_(40);
	efc_dark_energy = SetPointWorldEffect_("ef861_15_dark_energy", "efc_dark_energy");			// �ǂ������G�l���M�[
	SetEffectScale_(efc_dark_energy, 5.8);
	PlaySE_("SE_DEM_159");
	WaitTask(task_cam);

	Wait_(120);
	EndDemo(FADE_COLOR_BLACK);
}
