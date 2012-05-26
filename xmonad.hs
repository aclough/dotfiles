import XMonad
import XMonad.Config.Gnome
import XMonad.Hooks.ManageDocks
import XMonad.Util.EZConfig
import XMonad.Actions.CycleWS
import XMonad.Actions.Submap


main = xmonad $ gnomeConfig
    { terminal = "gnome-terminal"
    , modMask = mod4Mask -- se the mod key to the windows key
    }
    `additionalKeysP`
        [ ("M-p", spawn "dmenu_run")
        , ("M-c", kill)
        , ("M-S-q", spawn "gnome-session-save --gui --logout-dialog")
        , ("M-;", spawn "gnome-terminal")
        , ("M-b", spawn "google-chrome")
        , ("M-v", spawn "nautilus ~")
        , ("M-u", prevWS)
        , ("M-i", nextWS)
        , ("M-S-u", shiftToPrev)
        , ("M-S-i", shiftToNext)
        , ("M-M1-u", shiftToPrev >> prevWS)
        , ("M-M1-i", shiftToNext >> nextWS)
        , ("M-t", sendMessage ToggleStruts)
        , ("M-x m", spawn "banshee")
        , ("M-e", spawn "emacs")
        , ("M-x", spawn "emacs ~/.xmonad/xmonad.hs")
        ]        
