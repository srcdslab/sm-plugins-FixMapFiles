# sm-plugins-FixMapFiles

A SourceMod plugin that automatically downloads and applies fixed files for specific maps in Counter-Strike: Source.

## Description

This plugin automatically applies necessary file fixes for specific maps when they are loaded. It handles two main types of fixes:

1. Paranoid Rezurrection specific fixes
2. Gargantua model fixes (applies to multiple maps)

## Supported Maps

### Maps with Paranoid + Gargantua Fixes
- `ze_paranoid_rezurrection_v11_9`

### Maps with Gargantua Fixes Only
- `ze_avalanche_reboot_beta7`
- `ze_l0v0l_v1_4`
- `ze_mountain_escape_v5_zy`
- `ze_Pidaras_v1_4fix3`
- `ze_sandstorm_css_v1_5x3`
- `ze_tyranny_v5fix`

## Features

### Paranoid Rezurrection Fixes
- Adds fixed BSOD (Blue Screen of Death) textures
- Fixes metal vent decals
- Adds all items mode textures

### Gargantua Model Fixes
- Applies fixed Gargantua model files
- Includes all necessary model files and textures
- Fixes model compatibility issues

## Installation

1. Place the compiled plugin in your server's `addons/sourcemod/plugins` directory
2. Ensure all required files are present in your server's `cstrike/*` directory
3. The plugin will automatically apply fixes when supported maps are loaded

## Requirements

- SourceMod 1.10 or higher
- Counter-Strike: Source
