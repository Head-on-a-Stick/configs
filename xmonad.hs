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


baseConfig               = desktopConfig

main                     = xmonad =<< statusBar "xmobar" myPP toggleStrutsKey baseConfig {
    terminal           = "urxvtc"
  , modMask            = mod4Mask
  , borderWidth        = 2
  , normalBorderColor  = "#404040"
  , focusedBorderColor = "#00aacc"
  , startupHook        = startupHook baseConfig <+> spawnOnce "urxvtd -q -f -o"
                                                <+> spawnOnce "compton --backend glx --vsync opengl-mswc &"
                                                <+> spawnOnce "xsetroot -cursor_name left_ptr"
                                                <+> spawnOnce "sh ~/.fehbg"
                                                <+> spawnOnce "synclient tapbutton1=0 tapbutton2=0 tapbutton3=0 verttwofingerscroll=0 vertedgescroll=1 horizedgescroll=1 horizscrolldelta=10"
  , keys               = \c -> myKeys c `M.union` keys baseConfig c
  , layoutHook         = myLayoutHook
  , handleEventHook    = fullscreenEventHook
  , manageHook         = composeAll [ isFullscreen                --> doFullFloat
                                    , className =? "Gimp"         --> doFloat
                                    , className =? "Orage"        --> doFloat
			            , className =? "Lxappearance" --> doFloat
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
        tiled            = named "Tall" $ Tall 1 (3/100) (1/2)
	mtiled           = named "Wide" $ Mirror tiled
        full             = named "Full" $ Full
    myPP                 = defaultPP { ppSep     = " <fc=#0000ff>•</fc> "
                                     , ppTitle   = xmobarColor "#bfbfbf" "" . shorten 500
			             , ppCurrent = xmobarColor "#f0dfaf" "" . wrap "[" "]"
				     , ppLayout  = xmobarColor "#60b48a" ""
				     }
    toggleStrutsKey XConfig {XMonad.modMask = modMask} = (modMask, xK_b)
