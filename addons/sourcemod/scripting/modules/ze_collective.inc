#tryinclude <lilac>

#if defined _lilac_included
// Hackerman Item on ze_collective_css can trigger detection, block the detection for this item only
public bool lilac_allow_cheat_detection(int client, int cheat)
{
	if (!g_bCollective)
		return false;

	if (cheat == CHEAT_AIMBOT)
	{
		int weapon = GetPlayerWeaponSlot(client, 1);
		if (weapon == -1)
			return false;

		if (GetEntProp(weapon, Prop_Data, "m_iHammerID") == 11111017)
		{
			LogAction(-1, -1, "Blocked cheat detection (Aimbot) for client %L on ze_collective_css for Hackerman Item", client);
			return true;
		}
	}

	return false;
}
#endif