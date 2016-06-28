-- Imports
import System.IO
import XMonad
import XMonad.Hooks.DynamicLog

-- The main function.
main = xmonad =<< statusBar myBar myPP toggleStrutsKey myConfig

-- Command to launch the bar.
myBar = "xmobar"

-- Custom PP.
myPP = xmobarPP { ppCurrent = xmobarColor "#657b83" "" . wrap "[" "]"
                , ppOrder = \(ws:_) -> [ws]
                }

-- Key binding to toggle the gap for the bar.
toggleStrutsKey XConfig {XMonad.modMask = modMask} = (modMask, xK_b)

-- Main configuration, override the defaults to your liking.
myConfig = defaultConfig
    { terminal = "urxvt"
    , borderWidth = 3
    }

