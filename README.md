# Roblox Intro Cinematic

A professional intro cinematic system for Roblox games that displays your studio logo, development team, and a play button.

## Features

- **Studio Logo Display**: Shows your studio's logo with smooth fade-in and fade-out animations
- **Developer Credits**: Displays developer names and their roles
- **Interactive Play Button**: User-activated button to dismiss the cinematic
- **Smooth Transitions**: Uses TweenService for professional animations
- **Fully Customizable**: Easy to modify colors, timings, and content

## Installation

1. Open Roblox Studio and your game project
2. In the Explorer window, navigate to:
   - **StarterGui** (recommended) OR
   - **StarterPlayer > StarterPlayerScripts**
3. Right-click and select **Insert Object > LocalScript**
4. Rename the script to "IntroCinematic"
5. Copy and paste the code from `IntroCinematic.lua` into the script

## Configuration

### Setting Your Studio Logo

1. Upload your studio logo image to Roblox:
   - Go to the [Create page](https://create.roblox.com/)
   - Navigate to "Development Items" > "Decals"
   - Click "Upload Asset" and select your logo
   - Copy the Asset ID from the uploaded decal

2. In the script, replace line 12:
   ```lua
   local STUDIO_DECAL_ID = "rbxassetid://0" -- Replace with your studio logo decal ID
   ```
   With your decal ID:
   ```lua
   local STUDIO_DECAL_ID = "rbxassetid://YOUR_DECAL_ID_HERE"
   ```

### Customizing Developers List

Update the `DEVELOPERS` table (lines 16-21) with your team members:

```lua
local DEVELOPERS = {
	{name = "John Doe", role = "Lead Developer"},
	{name = "Jane Smith", role = "Scripter"},
	{name = "Bob Johnson", role = "Builder"},
	{name = "Alice Williams", role = "UI Designer"}
}
```

Add or remove entries as needed.

### Adjusting Timings

Modify these values at the top of the script:

```lua
local FADE_IN_TIME = 1.5          -- Time for fade-in animations
local STUDIO_DISPLAY_TIME = 3     -- How long to show each screen
local FADE_OUT_TIME = 1.5         -- Time for fade-out animations
```

### Customizing Colors

You can customize colors by modifying the Color3.fromRGB values throughout the script:

- **Background**: Line 40 - `BackgroundColor3 = Color3.fromRGB(0, 0, 0)` (black)
- **Text**: Lines 73, 106, 110, 161 - White/gray text colors
- **Play Button**: Line 158 - `BackgroundColor3 = Color3.fromRGB(45, 45, 45)` (dark gray)

## How It Works

The cinematic follows this sequence:

1. **Studio Logo Phase**
   - Fades in your studio logo
   - Displays for the configured time
   - Fades out smoothly

2. **Developers Phase**
   - Shows "DEVELOPED BY" title
   - Lists all developers with their names and roles
   - Displays for the configured time
   - Fades out

3. **Play Button Phase**
   - Shows an interactive "PLAY" button
   - Button has hover effects
   - When clicked, the entire cinematic fades out and is removed
   - Player can now interact with the game

## Troubleshooting

### Logo Not Showing
- Ensure you've uploaded the decal to Roblox and it's approved
- Verify the Asset ID is correct in the script
- Make sure you're using `rbxassetid://` prefix

### Cinematic Not Appearing
- Check that the script is a **LocalScript** (not a regular Script)
- Verify it's placed in **StarterGui** or **StarterPlayerScripts**
- Check the Output window for any error messages

### Play Button Not Working
- Ensure the script has fully loaded
- Check that no other GUI is blocking the button (DisplayOrder)

## Advanced Customization

### Changing Fonts
Available fonts can be found in [Roblox Fonts Documentation](https://create.roblox.com/docs/building-and-visuals/ui/fonts)

Replace `Enum.Font.GothamBold` or `Enum.Font.Gotham` with your preferred font.

### Modifying Animations
The script uses TweenService with customizable easing styles. Modify the `createTween` function parameters to change animation behavior.

### Adding More Screens
You can add additional screens by following the pattern used for the developers screen:
1. Create a new Frame
2. Add your content
3. Add the screen to the `playCinematic()` function sequence

## License

Feel free to use and modify this script for your Roblox projects!

## Support

If you encounter issues or have questions, check the Roblox Developer Forum or the script's comments for guidance.
