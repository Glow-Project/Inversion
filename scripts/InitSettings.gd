extends Settings

# Initialize the settings
func _enter_tree():
    auto_load = true
    auto_save = true

    set_default("volume", 1.0)
    set_default("music", true)
    set_default("fullscreen", false)

    adapt_settings()

# Adapt the settings
# For e.g. set the fullscreen
func adapt_settings():
    # Set fullscreen to the setting 'fullscreen'
    # Default is false
    OS.window_fullscreen = gets("fullscreen")