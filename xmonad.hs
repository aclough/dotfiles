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

myLayout = avoidStruts (layouts)
  where
    layouts =  tiled ||| Full
    tiled = Tall 1 (3/100) (1/2)

myHandleEventHook = hintsEventHook

myTerminal = "gnome-terminal"

main = xmonad $ gnomeConfig
    { terminal = myTerminal
    , modMask = mod4Mask -- use the mod key to the windows key
    , manageHook = manageHook gnomeConfig
    , layoutHook = myLayout
    , logHook = updatePointer (0.5,0.5) (0.5,0.5) >> logHook gnomeConfig >> ewmhDesktopsLogHook
    , handleEventHook = myHandleEventHook
    , startupHook = ewmhDesktopsStartup >> startupHook gnomeConfig
    }
    `additionalKeysP`(
        [ ("M-c", kill)
        , ("M-n", spawn "rofi -bg '#93a1a1' -show run")
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
