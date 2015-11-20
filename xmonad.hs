import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Util.SpawnOnce
import qualified Data.Map as M

main = xmonad =<< xmobar defaultConfig {
      terminal           = "urxvtc"
    , modMask            = mod4Mask
    , borderWidth        = 1
    , workspaces         = ["0","1","10","11","100","101","110","111"]
    , normalBorderColor  = "#404040"
    , focusedBorderColor = "#00aacc"
    , startupHook        = startupHook defaultConfig <+> spawnOnce "urxvtd -q -f -o"
                                                     <+> spawnOnce "compton --backend glx --vsync opengl-mswc &"
                                                     <+> spawnOnce "xsetroot -cursor_name left_ptr"
						     <+> spawnOnce "sh ~/.fehbg"
                                                     <+> spawnOnce "synclient tapbutton1=0 tapbutton2=0 tapbutton3=0 verttwofingerscroll=0 vertedgescroll=1 horizedgescroll=1 horizscrolldelta=10"
    , keys               = \c -> myKeys c `M.union` keys defaultConfig c
}
    where
    myKeys (XConfig {modMask = modm}) = M.fromList $
        [ ((0, xK_Menu), spawn "dmenu_run") ]
