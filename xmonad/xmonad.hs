import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO
import XMonad.Layout.PerWorkspace (onWorkspace)
import XMonad.Layout.SimplestFloat
import XMonad.Layout.Circle
import XMonad.Layout.ThreeColumns
import XMonad.Layout.Tabbed
import XMonad.Layout.Accordion
import XMonad.Layout.Grid
import XMonad.Layout.IM
import Data.Ratio ((%))
import XMonad.Hooks.EwmhDesktops
import qualified XMonad.StackSet as W
import qualified Data.Map        as M
import Data.Monoid
import System.Exit
import XMonad.Layout.Spacing

myWorkspaces            = ["1:main","2:net","3:work","4:media", "5:chat" ]  ++ map show [6..9]
myLayout = onWorkspace "5:chat" pidginLayout $ onWorkspace "1:main" Circle  $ onWorkspace "2:net" Full $ onWorkspace "3:work" simpleTabbed $ defaultLayouts
--myNormalBorderColor  = "#808080"
--myFocusedBorderColor = "#414141"
myFocusedBorderColor = "#395573"
myNormalBorderColor = "#0080ff"
myTerm                  = "konsole"
myBorderWidth   = 2
myStartupHook = spawn "~/.xmonad/startup.sh"
myManageHook = composeAll
     [ className =? "MPlayer"        --> doFloat
     , className =? "Eclipse"        --> doFloat
     , className =?  "Eidete"        --> doFloat
     , className =? "Gimp"           --> doFloat
     , className =? "Pidgin"         --> doShift "5:chat"
     , className =? "Pidgin"         --> doFloat
     , className =? "arch - Skype™ (Beta)" --> doFloat
     , className =? "arch - Skype™ (Beta)" --> doShift "5:chat"
	 , className =? "Ktorrent"       --> doShift "1:main"]

defaultLayouts = tiled ||| Mirror tiled ||| Full ||| Circle ||| simpleTabbed ||| ThreeCol 1 (3/100) (1/2) ||| ThreeColMid 1 (3/100) (1/2) ||| Accordion ||| Grid
	where
      -- default tiling algorithm partitions the screen into two panes
      tiled = spacing 5 $ Tall nmaster delta ratio

      -- The default number of windows in the master pane
      nmaster = 1
      nmaster2 = 2

      -- Default proportion of screen occupied by master pane
      ratio = 2/3

      -- Percent of screen to increment by when resizing panes
      delta = 3/100
gridLayout = spacing 8 $ Grid      
pidginLayout = withIM (1%7)(Role "buddy_list") gridLayout

main = do
    xmproc <- spawnPipe "/usr/bin/xmobar /home/arch/.xmobarrc"
    xmonad $ defaultConfig
        { manageHook = manageDocks <+> myManageHook <+> manageHook defaultConfig
		, borderWidth = myBorderWidth
		, normalBorderColor = myNormalBorderColor
		, startupHook        = myStartupHook
		, focusedBorderColor = myFocusedBorderColor
        , terminal = myTerm
  		, workspaces  = myWorkspaces
		, layoutHook =  avoidStruts $ myLayout -- avoidStruts чтобы окна не загораживали xmobar
   , logHook = dynamicLogWithPP $ xmobarPP
                        { ppOutput = hPutStrLn xmproc
                    	, ppTitle = xmobarColor "green" "" . shorten 50
                        }
        , modMask = mod4Mask
        } `additionalKeys`
        [((mod4Mask, xK_Print), spawn "xfce4-screenshooter")
		, ((mod4Mask, xK_Return), spawn "terminal")
		, ((mod4Mask, xK_b), spawn "chromium")
		, ((mod4Mask, xK_f), spawn "firefox")
		, ((mod4Mask, xK_w), spawn "geany")
		, ((mod4Mask, xK_r), spawn "okular")
		, ((mod4Mask, xK_h), spawn "spacefm")
		, ((mod4Mask, xK_e), spawn "eclipse")
		, ((mod4Mask, xK_x), spawn "deadbeef")
        , ((mod4Mask, xK_i), spawn "pidgin")
        , ((mod4Mask, xK_c), spawn "cheese")
        ]