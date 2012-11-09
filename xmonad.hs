import XMonad
import XMonad.Config.Gnome
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.Minimize
import XMonad.Util.EZConfig
import XMonad.Actions.CycleWS
import System.IO
import XMonad.Actions.Submap
import XMonad.Layout.Minimize
import XMonad.Layout.LimitWindows
import qualified XMonad.StackSet as W

myWorkspaces = map show [1..9]

myManageHook :: [ManageHook]
myManageHook =
        [ resource =? "Do"  --> doIgnore ]

myLayout =  minimize (avoidStruts ( tiled ||| Full |||  Mirror tiled ))
  where
    tiled = limitWindows 6 $ Tall 1 0.03 0.5

myHandleEventHook = minimizeEventHook

main = xmonad $ gnomeConfig
    { terminal = "terminator"
    , modMask = mod4Mask -- use the mod key to the windows key
    , manageHook = manageHook gnomeConfig <+> composeAll myManageHook 
    , layoutHook = myLayout
    , handleEventHook = myHandleEventHook
    }
    `additionalKeysP`(
        [ ("M-S-q", spawn "gnome-session-save --gui --logout-dialog")
        , ("M-c", kill)
        , ("M-n", spawn "gnome-do")
        , ("M-;", spawn "terminator")
        , ("M-b", spawn "google-chrome")
        , ("M-v", spawn "nautilus ~")
        , ("M-m", withFocused minimizeWindow)
        , ("M-M1-m", sendMessage RestoreNextMinimizedWin)
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
