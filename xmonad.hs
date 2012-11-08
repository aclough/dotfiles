import XMonad
import XMonad.Config.Gnome
import XMonad.Hooks.ManageDocks
import XMonad.Util.EZConfig
import XMonad.Actions.CycleWS
import System.IO
import XMonad.Actions.Submap
import qualified XMonad.StackSet as W

myWorkspaces = map show [1..9]

myManageHook :: [ManageHook]
myManageHook =
        [ resource =? "Do"  --> doIgnore ]

main = xmonad $ gnomeConfig
    { terminal = "terminator"
    , modMask = mod4Mask -- use the mod key to the windows key
    , manageHook = manageHook gnomeConfig <+> composeAll myManageHook 
    }
    `additionalKeysP`(
        [ ("M-S-q", spawn "gnome-session-save --gui --logout-dialog")
        , ("M-c", kill)
        , ("M-M1-p", spawn "yeganesh -")
        , ("M-n", spawn "yeganesh -x")
        , ("M-p", spawn "gnome-do")
        , ("M-;", spawn "terminator")
        , ("M-b", spawn "google-chrome")
        , ("M-v", spawn "nautilus ~")
        , ("M-u", prevWS)
        , ("M-i", nextWS)
        , ("M-S-u", shiftToPrev)
        , ("M-S-i", shiftToNext)
        , ("M-M1-j", windows W.swapDown)
        , ("M-M1-k", windows W.swapUp)
        , ("M-M1-u", shiftToPrev >> prevWS)
        , ("M-M1-i", shiftToNext >> nextWS)
        , ("M-y", nextScreen)
        , ("M-M1-y", shiftNextScreen >> nextScreen)
        ]
        -- ++ [ ("M1-" ++ tag, windows $ W.greedyView tag) | tag <- myWorkspaces ]
    )
