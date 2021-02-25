-- Imports
import System.IO
import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.EwmhDesktops(fullscreenEventHook,ewmh)
import XMonad.Hooks.ManageHelpers(doFullFloat,isFullscreen)
import XMonad.Layout.Spacing
import XMonad.Layout.NoBorders

-- Command to launch the bar.
myBar = "xmobar"

-- Window Borders
myBorderWidth = 2
myNormalBorderColor  = "#666666"
myFocusedBorderColor = "#C4CAD3"

-- Use kitty as my terminal.
myTerminal = "kitty"

-- Window Rules.
myManageHook = composeAll
    [ className =? "mpv" --> doFloat
    , appName =? "Android Emulator" --> doFloat
    , isFullscreen --> doFullFloat ]

-- Layout
myLayoutHook = smartSpacingWithEdge 2 $ smartBorders $ Tall 1 (3/100) (1/2) ||| Full

-- XMobar PrettyPrint.

myXmobarPP = xmobarPP { ppCurrent   = xmobarColor "#F3F4F5" "" . wrap " " ""
                      , ppHidden    = xmobarColor "#747C84" "" . wrap " " ""
                      , ppTitle     = (\str -> "")
                      , ppLayout    = (\str -> "")
                      }

-- Key binding to toggle the gap for the bar.
toggleStrutsKey XConfig {XMonad.modMask = modMask} = (modMask, xK_b)

--------------------------------------------------------------------------------
main = xmonad =<< statusBar myBar myXmobarPP toggleStrutsKey myConfig

-- Main configuration.
myConfig = ewmh $ defaultConfig
    { terminal = myTerminal
    , borderWidth = myBorderWidth
    , normalBorderColor = myNormalBorderColor
    , focusedBorderColor = myFocusedBorderColor
    , layoutHook = myLayoutHook
    , manageHook = myManageHook
    }

