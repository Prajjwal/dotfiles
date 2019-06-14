-- Imports
import System.IO
import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.EwmhDesktops(fullscreenEventHook,ewmh)
import XMonad.Hooks.ManageHelpers(doFullFloat,isFullscreen)
import XMonad.Layout.NoBorders

-- Command to launch the bar.
myBar = "xmobar"

-- Use urxvt as my terminal.
myTerminal = "urxvt"

-- Window Borders.
myBorderWidth = 1
myNormalBorderColor  = "#C4CAD3"
myFocusedBorderColor = "#666666"

-- Window Rules.
myManageHook = composeAll
    [ className =? "mpv" --> doFloat
    , isFullscreen --> doFullFloat ]

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
    , manageHook = myManageHook
    }

