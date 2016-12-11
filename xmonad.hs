import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Util.SpawnOnce
import qualified Data.Map as M
import XMonad.Layout.NoBorders
import XMonad.Layout.Spacing
import XMonad.Layout.Named
import XMonad.Config.Desktop
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageHelpers


baseConfig             = desktopConfig

main                   = xmonad =<< statusBar "xmobar" myPP toggleStrutsKey baseConfig {
    terminal           = "st"
  , modMask            = mod4Mask
  , borderWidth        = 3
  , normalBorderColor  = "#404040"
  , focusedBorderColor = "#4084d6"
  , startupHook        = startupHook baseConfig <+> spawnOnce "xset s 300 -dpms"
						<+> spawnOnce "while true;do feh --randomize --bg-fill ~/Pictures/simplewallpapers;sleep 600;done &"
  , keys               = \c -> myKeys c `M.union` keys baseConfig c
  , layoutHook         = myLayoutHook
  , handleEventHook    = fullscreenEventHook
  , manageHook         = composeAll [ isFullscreen                    --> doFullFloat
                                    , className =? "Gimp"             --> doFloat
                                    , className =? "Gimp-2.9"         --> doFloat
                                    , className =? "Kodi"             --> doFullFloat
                                    , className =? "Orage"            --> doFloat
			            , className =? "Lxappearance"     --> doFloat
				    , className =? "Galculator"       --> doFloat
				    , className =? "Xsensors"         --> doFloat
				    , className =? "Transmission-gtk" --> doFloat
		                    ]
}
  where
    myKeys (XConfig {modMask = modm}) = M.fromList $
       [ ((0, xK_Menu),    spawn "dmenu_run")
       , ((0, 0x1008ff11), spawn "amixer set -c0 Master 5%- unmute")
       , ((0, 0x1008ff12), spawn "amixer set -c0 Master toggle")
       , ((0, 0x1008ff13), spawn "amixer set -c0 Master 5%+ unmute")
       , ((0, 0x1008ff03), spawn "xbacklight -dec 1")
       , ((0, 0x1008ff02), spawn "xbacklight -inc 1") ]
    myLayoutHook         = smartBorders  ( tiled ||| mtiled ||| full )
      where
        tiled            = named "Tall" $ Tall 1 (1/100) (1/2)
	mtiled           = named "Wide" $ Mirror tiled
        full             = named "Full" $ Full
    myPP                 = defaultPP { ppSep     = " <fc=#4084d6>•</fc> "
                                     , ppTitle   = xmobarColor "#bfbfbf" "" . shorten 500
			             , ppCurrent = xmobarColor "#f0dfaf" "" . wrap "[" "]"
				     , ppLayout  = xmobarColor "#60b48a" ""
				     }
    toggleStrutsKey XConfig {XMonad.modMask = modMask} = (modMask, xK_b)
