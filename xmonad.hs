import XMonad
import XMonad.Config.Gnome
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.EwmhDesktops
import XMonad.Util.EZConfig
import XMonad.Actions.CycleWS
import XMonad.Actions.UpdatePointer
import XMonad.Layout.LayoutHints
import qualified XMonad.StackSet as W

myWorkspaces = map show [1..9]

myManageHook = composeAll [
          (resource   =? "Do")  --> doIgnore
        , (className  =? "Gnome-panel" <&&> title =? "Run Application") --> doFloat
        ]

myLayout = avoidStruts (layouts)
  where
    layouts =  tiled ||| Mirror tiled ||| Full
    tiled = Tall 1 (3/100) (1/2)

myHandleEventHook = hintsEventHook <+> ewmhDesktopsEventHook

myTerminal = "gnome-terminal"

main = xmonad $ gnomeConfig
    { terminal = myTerminal
    , modMask = mod4Mask -- use the mod key to the windows key
    , manageHook = myManageHook <+> manageHook gnomeConfig
    , layoutHook = myLayout
    , logHook = updatePointer (Relative 0.1 0.1) >> logHook gnomeConfig >> ewmhDesktopsLogHook
    , handleEventHook = myHandleEventHook
    , startupHook = ewmhDesktopsStartup >> startupHook gnomeConfig
    }
    `additionalKeysP`(
        [ ("M-c", kill)
        , ("M-n", spawn "yeganesh_run.sh")
        , ("M-;", spawn myTerminal)
        , ("M-b", spawn "google-chrome")
        , ("M-v", spawn "nautilus ~")
        , ("M-u", prevWS)
        , ("M-i", nextWS)
        , ("M-S-u", shiftToPrev)
        , ("M-S-i", shiftToNext)
        , ("M-M1-u", shiftToPrev >> prevWS)
        , ("M-M1-i", shiftToNext >> nextWS)
        , ("M-M1-j", windows W.swapDown)
        , ("M-M1-k", windows W.swapUp)
        , ("M-y", nextScreen)
        , ("M-S-y", shiftNextScreen)
        , ("M-M1-y", shiftNextScreen >> nextScreen)
        ]
        -- Shifts a window to specifiec workspace, and sets that workspace in screen
        ++ [ ("M-M1-" ++ tag, (windows $ W.shift tag) >> (windows $ W.greedyView tag)) | tag <- myWorkspaces ]
    )
