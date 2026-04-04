#pragma semicolon 1
#pragma newdecls required

#include <sourcemod>
#include <sdktools>

// Uncomment to enable lilac fix for ze_collective_css
//#define ENABLE_COLLECTIVE_MODULE

#if defined ENABLE_COLLECTIVE_MODULE
bool g_bCollective = false;
#include "modules/ze_collective"
#endif

public Plugin myinfo = 
{
	name = "Maps files fixer",
	author = ".Rushaway",
	description = "Downloads fixed files for multiples map",
	version = "1.2.0",
	url = ""
};

public void OnMapStart()
{
#if defined ENABLE_COLLECTIVE_MODULE
	g_bCollective = false;
#endif

	char sCurrentMap[256];
	GetCurrentMap(sCurrentMap, sizeof(sCurrentMap));
	if (strcmp(sCurrentMap, "ze_paranoid_rezurrection_v11_9", false) == 0)
	{
		ApplyParanoidFix();
		ApplyGargantuaFix();
	}
	else if (strcmp(sCurrentMap, "ze_sky_athletic_adv_v9_12s", false) == 0)
	{
		ApplySkyAthleticFix();
	}
	else if (strcmp(sCurrentMap, "ze_avalanche_reboot_beta7", false) == 0 || strcmp(sCurrentMap, "ze_l0v0l_v1_4", false) == 0 ||
		strcmp(sCurrentMap, "ze_mountain_escape_v5_zy", false) == 0 || strcmp(sCurrentMap, "ze_Pidaras_v1_4fix3", false) == 0 ||
		strcmp(sCurrentMap, "ze_sandstorm_css_v1_5x3", false) == 0 || strcmp(sCurrentMap, "ze_tyranny_v5fix", false) == 0)
	{
		ApplyGargantuaFix();
	}
	#if defined ENABLE_COLLECTIVE_MODULE
	else if (strncmp(sCurrentMap, "ze_collective_css", 17, false) == 0)
	{
		g_bCollective = true;
	}
#endif
}

stock void ApplyParanoidFix()
{
	AddFileToDownloadsTable("materials/rafuron/paranoid/new_bsod.vmt");
	AddFileToDownloadsTable("materials/rafuron/paranoid/new_bsod.vtf");

	AddFileToDownloadsTable("materials/rafuron/paranoid/new_bsod2.vmt");
	AddFileToDownloadsTable("materials/rafuron/paranoid/new_bsod2.vtf");

	AddFileToDownloadsTable("materials/models/lotr/singularity/decalmetalvent004a.vmt");

	AddFileToDownloadsTable("materials/berke1/zombieescape1/paranoidrezurrection1/allitemsmode1.vmt");
	AddFileToDownloadsTable("materials/berke1/zombieescape1/paranoidrezurrection1/allitemsmode1.vtf");
}

// See: https://github.com/Moltard/CSS-ZE-Configs/commit/28793dbfa52fbdcdddf4af3f5d6bdc13c0439ace
stock void ApplyGargantuaFix()
{
	PrecacheModel("models/garg_fix_2025.mdl");

	AddFileToDownloadsTable("materials/models/garg_fix_2025/garg_body.vmt");
	AddFileToDownloadsTable("materials/models/garg_fix_2025/garg_body.vtf");
	AddFileToDownloadsTable("materials/models/garg_fix_2025/garg_body_normal.vtf");
	AddFileToDownloadsTable("materials/models/garg_fix_2025/garg_eye_Chrome.vmt");
	AddFileToDownloadsTable("materials/models/garg_fix_2025/garg_eye_Chrome.vtf");

	AddFileToDownloadsTable("models/garg_fix_2025.dx80.vtx");
	AddFileToDownloadsTable("models/garg_fix_2025.dx90.vtx");
	AddFileToDownloadsTable("models/garg_fix_2025.mdl");
	AddFileToDownloadsTable("models/garg_fix_2025.phy");
	AddFileToDownloadsTable("models/garg_fix_2025.sw.vtx");
	AddFileToDownloadsTable("models/garg_fix_2025.vvd");
}

stock void ApplySkyAthleticFix()
{
	AddFileToDownloadsTable("materials/skybox/sky_csgo_night02bbk.vmt");
	AddFileToDownloadsTable("materials/skybox/sky_csgo_night02bbk.vtf");
	AddFileToDownloadsTable("materials/skybox/sky_csgo_night02bdn.vmt");
	AddFileToDownloadsTable("materials/skybox/sky_csgo_night02bdn.vtf");
	AddFileToDownloadsTable("materials/skybox/sky_csgo_night02bft.vmt");
	AddFileToDownloadsTable("materials/skybox/sky_csgo_night02bft.vtf");
	AddFileToDownloadsTable("materials/skybox/sky_csgo_night02bk.vmt");
	AddFileToDownloadsTable("materials/skybox/sky_csgo_night02bk.vtf");
	AddFileToDownloadsTable("materials/skybox/sky_csgo_night02blf.vmt");
	AddFileToDownloadsTable("materials/skybox/sky_csgo_night02blf.vtf");
	AddFileToDownloadsTable("materials/skybox/sky_csgo_night02brt.vmt");
	AddFileToDownloadsTable("materials/skybox/sky_csgo_night02brt.vtf");
	AddFileToDownloadsTable("materials/skybox/sky_csgo_night02bup.vmt");
	AddFileToDownloadsTable("materials/skybox/sky_csgo_night02bup.vtf");
	AddFileToDownloadsTable("materials/skybox/sky_csgo_night02dn.vmt");
	AddFileToDownloadsTable("materials/skybox/sky_csgo_night02dn.vtf");
	AddFileToDownloadsTable("materials/skybox/sky_csgo_night02ft.vmt");
	AddFileToDownloadsTable("materials/skybox/sky_csgo_night02ft.vtf");
	AddFileToDownloadsTable("materials/skybox/sky_csgo_night02lf.vmt");
	AddFileToDownloadsTable("materials/skybox/sky_csgo_night02lf.vtf");
	AddFileToDownloadsTable("materials/skybox/sky_csgo_night02rt.vmt");
	AddFileToDownloadsTable("materials/skybox/sky_csgo_night02rt.vtf");
	AddFileToDownloadsTable("materials/skybox/sky_csgo_night02up.vmt");
	AddFileToDownloadsTable("materials/skybox/sky_csgo_night02up.vtf");
}