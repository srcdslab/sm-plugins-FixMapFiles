# Copilot Instructions for FixMapFiles SourceMod Plugin

## Repository Overview

This repository contains a SourceMod plugin for Counter-Strike: Source that automatically applies file fixes for specific zombie escape maps. The plugin handles two main types of fixes:

1. **Paranoid Rezurrection fixes** - Custom textures and materials for ze_paranoid_rezurrection_v11_9
2. **Gargantua model fixes** - Fixed model files applied to multiple maps with Gargantua model issues

### Key Files
- `addons/sourcemod/scripting/FixMapsFiles.sp` - Main plugin source code
- `materials/` - Game texture and material files (.vmt, .vtf)
- `models/` - Game model files (.mdl, .vtx, .phy, .vvd)
- `sourceknight.yaml` - Build configuration for SourceKnight build system
- `.github/workflows/ci.yml` - Automated build, test, and release pipeline

## Development Environment

### Language & Platform
- **Language**: SourcePawn (Source engine scripting language)
- **Platform**: SourceMod 1.11+ (minimum required version defined in sourceknight.yaml)
- **Target Game**: Counter-Strike: Source
- **Build Tool**: SourceKnight build system

### Required Headers
All SourcePawn files must include these pragmas at the top:
```sourcepawn
#pragma semicolon 1
#pragma newdecls required
```

## Code Style Standards

### Naming Conventions
- **Functions**: PascalCase (e.g., `ApplyParanoidFix()`)
- **Variables**: camelCase for locals, PascalCase with `g_` prefix for globals
- **Constants**: ALL_CAPS with underscores
- **Stock functions**: Use `stock` keyword for utility functions

### Formatting
- **Indentation**: Use tabs (4 spaces equivalent)
- **Braces**: Opening brace on same line
- **Spacing**: No trailing spaces, consistent spacing around operators

### Example Code Structure
```sourcepawn
#pragma semicolon 1
#pragma newdecls required

#include <sourcemod>
#include <sdktools>

public Plugin myinfo = {
    name = "Plugin Name",
    author = "Author",
    description = "Description",
    version = "1.0.0",
    url = ""
};

public void OnMapStart() {
    // Map detection logic
}

stock void UtilityFunction() {
    // Implementation
}
```

## Plugin Architecture

### Core Functionality
The plugin operates on a simple event-driven model:
1. **OnMapStart()** - Triggered when map loads, checks current map name
2. **Map Detection** - Uses string comparison to identify supported maps
3. **Fix Application** - Calls appropriate fix functions based on map

### Supported Maps
- **Paranoid + Gargantua fixes**: `ze_paranoid_rezurrection_v11_9`
- **Gargantua fixes only**: `ze_avalanche_reboot_beta7`, `ze_l0v0l_v1_4`, `ze_mountain_escape_v5_zy`, `ze_Pidaras_v1_4fix3`, `ze_sandstorm_css_v1_5x3`, `ze_tyranny_v5fix`

### Adding New Map Support
To add support for a new map:

1. **Add map to OnMapStart() logic**:
```sourcepawn
else if (strcmp(sCurrentMap, "new_map_name", false) == 0) {
    ApplyGargantuaFix(); // or create new fix function
}
```

2. **Create new fix function if needed**:
```sourcepawn
stock void ApplyNewMapFix() {
    // Precache models if needed
    PrecacheModel("models/new_model.mdl");
    
    // Add files to download table
    AddFileToDownloadsTable("materials/path/to/texture.vmt");
    AddFileToDownloadsTable("materials/path/to/texture.vtf");
    AddFileToDownloadsTable("models/new_model.mdl");
}
```

3. **Add corresponding asset files**:
   - Place materials in `materials/` directory structure
   - Place models in `models/` directory
   - Ensure file paths match exactly what's in the code

## Asset File Management

### File Types and Structure
- **Materials**: `.vmt` (material definition) and `.vtf` (texture) files in `materials/`
- **Models**: `.mdl`, `.vtx`, `.phy`, `.vvd` files in `models/`
- **Directory Structure**: Must match game's expected paths exactly

### Important Notes
- **File Paths**: Must be relative to game root and match exactly in code
- **Case Sensitivity**: Linux servers are case-sensitive, ensure proper casing
- **Download Table**: All custom files must be added via `AddFileToDownloadsTable()`
- **Model Precaching**: Models must be precached with `PrecacheModel()` before use

### Asset Validation
When adding new assets:
1. Verify file paths match between code and actual file locations
2. Test that files download properly on client connection
3. Ensure models load without errors in-game
4. Check that materials display correctly

## Build System

### SourceKnight Configuration
The `sourceknight.yaml` file defines:
- SourceMod version dependency (currently 1.11.0-git6934)
- Build targets and output directories
- Project structure and dependencies

### Build Process
```bash
# Build using SourceKnight (handled by CI)
sourceknight build

# Manual compilation (if needed)
spcomp -i addons/sourcemod/scripting/include addons/sourcemod/scripting/FixMapsFiles.sp
```

### Local Development Setup
1. Install SourceMod compiler (spcomp)
2. Set up include paths for SourceMod headers
3. Use SourceKnight for automated builds

## Testing and Validation

### Plugin Testing
- **Compile Check**: Ensure plugin compiles without errors
- **Map Loading**: Test on supported maps to verify fixes apply
- **File Download**: Verify clients download required files
- **Model Loading**: Check that models load and display correctly
- **Error Handling**: Test with unsupported maps (should do nothing)

### Server Testing Requirements
- Counter-Strike: Source dedicated server
- SourceMod 1.11+ installed
- Test maps available on server
- Client connection testing for file downloads

### Testing Checklist
- [ ] Plugin compiles successfully
- [ ] No console errors on map start
- [ ] Files added to download table correctly
- [ ] Models precache without errors
- [ ] Client downloads complete successfully
- [ ] Materials/models display correctly in-game

## CI/CD Pipeline

### Automated Workflows
- **Build**: Compiles plugin using SourceKnight on Ubuntu 24.04
- **Package**: Creates release package with plugin and asset files
- **Release**: Automatically creates GitHub releases with built artifacts

### Release Process
1. **Push to main/master**: Triggers build and creates "latest" release
2. **Git tag**: Triggers versioned release with tag name
3. **Artifact Upload**: Includes compiled .smx plugin and all asset files

### Package Structure
Release packages include:
- Compiled plugin (.smx file)
- All material files in proper directory structure
- All model files in proper directory structure
- Ready for server deployment

## Common Patterns and Best Practices

### Error Prevention
- Always validate file paths before adding to download table
- Use consistent string comparison with `false` parameter for case-insensitive matching
- Precache models before adding related files to download table
- Test compilation after any changes

### Performance Considerations
- File operations only occur on map start (not performance-critical)
- String comparisons are minimal and only happen once per map load
- Asset file sizes should be reasonable for client downloads

### Maintenance
- Keep supported map list updated in both code and README
- Verify asset file integrity when adding new maps
- Update SourceMod version in sourceknight.yaml as needed
- Monitor for new map versions that may need updated fixes

## Code Examples

### Adding a New Map with Custom Fix
```sourcepawn
// In OnMapStart()
else if (strcmp(sCurrentMap, "ze_newmap_v1", false) == 0) {
    ApplyNewMapFix();
}

// New fix function
stock void ApplyNewMapFix() {
    // Precache any models
    PrecacheModel("models/custom/newmodel.mdl");
    
    // Add materials
    AddFileToDownloadsTable("materials/custom/newtexture.vmt");
    AddFileToDownloadsTable("materials/custom/newtexture.vtf");
    
    // Add model files
    AddFileToDownloadsTable("models/custom/newmodel.mdl");
    AddFileToDownloadsTable("models/custom/newmodel.dx80.vtx");
    AddFileToDownloadsTable("models/custom/newmodel.dx90.vtx");
    AddFileToDownloadsTable("models/custom/newmodel.phy");
    AddFileToDownloadsTable("models/custom/newmodel.sw.vtx");
    AddFileToDownloadsTable("models/custom/newmodel.vvd");
}
```

## Troubleshooting

### Common Issues
- **File not downloading**: Check file path matches exactly in code and filesystem
- **Model not loading**: Ensure PrecacheModel() is called before AddFileToDownloadsTable()
- **Case sensitivity**: Linux servers require exact case matching
- **Missing dependencies**: Verify all related files (materials for models) are included

### Debugging
- Enable SourceMod logging to see download table additions
- Check server console for file loading errors
- Test with single client connection to verify downloads
- Use `sm_dump_admcache` and related commands for debugging

This plugin is specifically designed for Counter-Strike: Source zombie escape servers and focuses on providing essential file fixes for popular community maps.