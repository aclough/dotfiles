import XMonad
import XMonad.Config.Gnome
import XMonad.Hooks.ManageDocks
import XMonad.Util.EZConfig
import XMonad.Actions.CycleWS
import System.IO
import XMonad.Actions.Submap
import qualified XMonad.StackSet as W

myWorkspaces = map show [1..9]

main = xmonad $ gnomeConfig
    { terminal = "terminator"
    , modMask = mod4Mask -- use the mod key to the windows key
    }
    `additionalKeysP`(
        [ ("M-p", spawn "dmenu_run")
        , ("M-M1-p", spawn "exe=`dmenu_path | dmenu` && eval \"exec $exe\"")
        , ("M-c", kill)
        , ("M-S-q", spawn "gnome-session-save --gui --logout-dialog")
        , ("M-;", spawn "terminator")
        , ("M-b", spawn "google-chrome")
        , ("M-v", spawn "nautilus ~")
        , ("M-u", prevWS)
        , ("M-i", nextWS)
        , ("M-S-u", shiftToPrev)
        , ("M-S-i", shiftToNext)
        , ("M-M1-u", shiftToPrev >> prevWS)
        , ("M-M1-i", shiftToNext >> nextWS)
        , ("M-e", spawn "emacs")
        , ("M-x m", spawn "banshee")
        ]
        ++ [ ("M1-" ++ tag, windows $ W.greedyView tag) | tag <- myWorkspaces ])
