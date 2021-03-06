/* See LICENSE file for copyright and license details. */

/* appearance */
static const char font[]            = "-*-dejavu sans-medium-r-*-*-9-*-*-*-*-*-*-ru";
static const char normbordercolor[] = "#8282ff";
static const char normbgcolor[]     = "#222222";
static const char normfgcolor[]     = "#bbbbbb";
static const char selbordercolor[]  = "#3399ff";
static const char selbgcolor[]      = "#2f2f2f";
static const char selfgcolor[]      = "#eeeeee";
static const unsigned int borderpx  = 1;        /* border pixel of windows */
static const unsigned int snap      = 32;       /* snap pixel */
static const Bool showbar           = True;     /* False means no bar */
static const Bool topbar            = True;     /* False means bottom bar */
static const unsigned int systrayspacing = 2;   /* systray spacing */
static const Bool showsystray       = True;     /* False means no systray */
static void moveresize(const Arg *arg);

/* tagging */
static const char *tags[] = { "term", "www", "chat", "media", "work", "other" };

static const Rule rules[] = {
	/* class      instance    title       tags mask     isfloating   monitor */
	{ "Gimp",      NULL,      NULL,       0,            True,        -1 },
	{ "Chromium",  NULL,      NULL,       1 << 1,       False,       -1 },
    { "Pidgin",    NULL,      NULL,       1 << 2,       True,        -1 },
    { "mplayer",   NULL,      NULL,       1 << 3,       True,        -1 },
    { "subl",      NULL,      NULL,       1 << 4,       True,        -1 },
    { "evince",    NULL,      NULL,       1 << 3,       True         -1 },
};

/* layout(s) */
static const float mfact      = 0.55; /* factor of master area size [0.05..0.95] */
static const int nmaster      = 1;    /* number of clients in master area */
static const Bool resizehints = True; /* True means respect size hints in tiled resizals */

static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "><>",      NULL },    /* first entry is default */
	{ "[]=",      tile },
	{ "[M]",      monocle },
};

/* key definitions */
#define MODKEY Mod4Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static const char *dmenucmd[] = { "dmenu_run", "-fn", font, "-nb", normbgcolor, "-nf", normfgcolor, "-sb", selbgcolor, "-sf", selfgcolor, NULL };
static const char *termcmd[]  = { "sakura", NULL };
static const char *browsercmd[] = { "chromium",  NULL };
static const char *homecmd[] = { "spacefm",  NULL };
static const char *writecmd[] = { "subl",  NULL };
static const char *torrent[] = {"sakura", "-e", "rtorrent", NULL};
static const char *scrot[] = {"scrot", NULL};
static const char *musik[] = {"sakura", "-e", "mocp", NULL};

static Key keys[] = {
	/* modifier                     key        function        argument */
	{ MODKEY,                       XK_p,      spawn,          {.v = dmenucmd } },
	{ MODKEY|ShiftMask,             XK_Return, spawn,          {.v = termcmd } },
	{ MODKEY|ShiftMask,             XK_b,      spawn,          {.v = browsercmd } },
    { MODKEY|ShiftMask,             XK_h,      spawn,          {.v = homecmd }  },
    { MODKEY|ShiftMask,             XK_w,      spawn,          {.v = writecmd } },
    { MODKEY|ShiftMask,             XK_Print,  spawn,          {.v = scrot} },
    { MODKEY|ShiftMask,             XK_r,      spawn,          {.v = torrent} },
    { MODKEY|ShiftMask,             XK_i,      spawn,          {.v = (const char*[]){"mirage"}}},
    { MODKEY|ShiftMask,             XK_g,      spawn,          {.v = (const char*[]){"pidgin"}}},
    { MODKEY|ShiftMask,             XK_p,      spawn,          {.v = (const char*[]){"gmrun"}}},
    { MODKEY|ShiftMask,             XK_m,      spawn,          {.v = musik}},
	{ MODKEY,                       XK_b,      togglebar,      {0} },
	{ MODKEY,                       XK_j,      focusstack,     {.i = +1 } },
	{ MODKEY,                       XK_k,      focusstack,     {.i = -1 } },
	{ MODKEY,                       XK_i,      incnmaster,     {.i = +1 } },
	{ MODKEY,                       XK_d,      incnmaster,     {.i = -1 } },
	{ MODKEY,                       XK_h,      setmfact,       {.f = -0.05} },
	{ MODKEY,                       XK_l,      setmfact,       {.f = +0.05} },
	{ MODKEY,                       XK_Return, zoom,           {0} },
	{ MODKEY,                       XK_Tab,    view,           {0} },
	{ MODKEY|ShiftMask,             XK_c,      killclient,     {0} },
	{ MODKEY,                       XK_t,      setlayout,      {.v = &layouts[1]} },
	{ MODKEY,                       XK_f,      setlayout,      {.v = &layouts[0]} },
	{ MODKEY,                       XK_m,      setlayout,      {.v = &layouts[2]} },
	{ MODKEY,                       XK_space,  setlayout,      {0} },
	{ MODKEY|ShiftMask,             XK_space,  togglefloating, {0} },
	{ MODKEY,                       XK_0,      view,           {.ui = ~0 } },
	{ MODKEY|ShiftMask,             XK_0,      tag,            {.ui = ~0 } },
	{ MODKEY,                       XK_comma,  focusmon,       {.i = -1 } },
	{ MODKEY,                       XK_period, focusmon,       {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_comma,  tagmon,         {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_period, tagmon,         {.i = +1 } },
	{ MODKEY,                       XK_Down,   moveresize,     {.v = (int []){ 0, 25, 0, 0 }}},
	{ MODKEY,                       XK_Up,     moveresize,     {.v = (int []){ 0, -25, 0, 0 }}},
	{ MODKEY,                       XK_Right,  moveresize,     {.v = (int []){ 25, 0, 0, 0 }}},
	{ MODKEY,                       XK_Left,   moveresize,     {.v = (int []){ -25, 0, 0, 0 }}},
	{ MODKEY|ShiftMask,             XK_Down,   moveresize,     {.v = (int []){ 0, 0, 0, 25 }}},
	{ MODKEY|ShiftMask,             XK_Up,     moveresize,     {.v = (int []){ 0, 0, 0, -25 }}},
	{ MODKEY|ShiftMask,             XK_Right,  moveresize,     {.v = (int []){ 0, 0, 25, 0 }}},
	{ MODKEY|ShiftMask,             XK_Left,   moveresize,     {.v = (int []){ 0, 0, -25, 0 }}},
	TAGKEYS(                        XK_1,                      0)
	TAGKEYS(                        XK_2,                      1)
	TAGKEYS(                        XK_3,                      2)
	TAGKEYS(                        XK_4,                      3)
	TAGKEYS(                        XK_5,                      4)
	TAGKEYS(                        XK_6,                      5)
	TAGKEYS(                        XK_7,                      6)
	TAGKEYS(                        XK_8,                      7)
	TAGKEYS(                        XK_9,                      8)
	{ MODKEY|ShiftMask,             XK_q,      quit,           {0} },
};

/* button definitions */
/* click can be ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
	{ ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
	{ ClkWinTitle,          0,              Button2,        zoom,           {0} },
	{ ClkStatusText,        0,              Button2,        spawn,          {.v = termcmd } },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};

