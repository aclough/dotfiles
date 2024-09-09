import XMonad
import XMonad.Config.Gnome
import XMonad.Hooks.ManageDocks -- Provides avoidStruts
import XMonad.Hooks.EwmhDesktops
import XMonad.Util.EZConfig -- Provides additionalKeysP
import XMonad.Actions.CycleWS
import XMonad.Actions.UpdatePointer
import XMonad.Layout.LayoutHints
import qualified XMonad.StackSet as W

myWorkspaces = map show [1..9]

myHandleEventHook = hintsEventHook

myTerminal = "kitty"

myScreenshot = "scrot -e 'mv $f ~/workspace/' "

myLayout = avoidStruts (tiled ||| Full)
  where
    -- default tiling algorithm partitions the screen into two panes
    tiled   = Tall nmaster delta ratio
    -- The default number of windows in the master pane
    nmaster = 1
    -- Default proportion of screen occupied by master pane
    ratio   = 1/2
    -- Percent of screen to increment by when resizing panes
    delta   = 3/100

main = xmonad $ ewmhFullscreen . ewmh $ gnomeConfig
    { terminal = myTerminal
    , modMask = mod4Mask -- use the mod key to the windows key
    , manageHook = manageHook gnomeConfig
    , layoutHook = myLayout
    , logHook = updatePointer (0.5,0.5) (0.5,0.5) >> logHook gnomeConfig
    , handleEventHook = myHandleEventHook
    , startupHook = startupHook gnomeConfig
    , focusedBorderColor = "#ffb000"
    }
    `additionalKeysP`(
        [ ("M-c", kill)
        , ("M-n", spawn "rofi -show run")
        , ("M-;", spawn myTerminal)
        -- , ("M-b", spawn "google-chrome --enable-features=UseOzonePlatform --ozone-platform=wayland")
        , ("M-b", spawn "google-chrome")
        , ("M-v", spawn "nemo ~")
        , ("M-p", spawn myScreenshot)
        , ("M-S-p", spawn $ myScreenshot ++ " -s")
        , ("M-M1-p", spawn $ myScreenshot ++ " -u")
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
        -- Shifts a window to specific workspace, and sets that workspace in screen
        ++ [ ("M-M1-" ++ tag, (windows $ W.shift tag) >> (windows $ W.greedyView tag)) | tag <- myWorkspaces ]
    )
