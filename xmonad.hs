import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Util.SpawnOnce
import qualified Data.Map as M
import XMonad.Layout.NoBorders
import XMonad.Layout.Spacing
import XMonad.Layout.Named

main                         = xmonad =<< xmobar defaultConfig {
      terminal               = "urxvtc"
    , modMask                = mod4Mask
    , borderWidth            = 2
    , normalBorderColor      = "#404040"
    , focusedBorderColor     = "#00aacc"
    , startupHook            = startupHook defaultConfig <+> spawnOnce "urxvtd -q -f -o"
                                                         <+> spawnOnce "compton --backend glx --vsync opengl-mswc &"
                                                         <+> spawnOnce "xsetroot -cursor_name left_ptr"
                                                         <+> spawnOnce "sh ~/.fehbg"
                                                         <+> spawnOnce "synclient tapbutton1=0 tapbutton2=0 tapbutton3=0 verttwofingerscroll=0 vertedgescroll=1 horizedgescroll=1 horizscrolldelta=10"
    , keys                   = \c -> myKeys c `M.union` keys defaultConfig c
    , layoutHook             = myLayoutHook
}
    where
    myKeys (XConfig {modMask = modm}) = M.fromList $
       [ ((0, xK_Menu), spawn "dmenu_run") ]
    myLayoutHook             = smartBorders  ( tiled ||| mtiled ||| full )
      where
        tiled                = named "Tiled" $ Tall 1 (3/100) (1/2)
	mtiled               = named "Mirror Tiled" $ Mirror tiled
        full                 = named "Full" $ Full
