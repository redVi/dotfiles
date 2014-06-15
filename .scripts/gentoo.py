#!/usr/bin/env python3
#
# Archey [version 0.3.1]
#
# Archey is a simple system information tool written in Python.
#
# Copyright 2010 Melik Manukyan <melik@archlinux.us>
# Copyright 2012-2013 redVi <liberty195@gmail.com>
#
# ASCII art by Brett Bohnenkamper <kittykatt@silverirc.com>
# Changes Jerome Launay <jerome@projet-libre.org>
#
# Distributed under the terms of the GNU General Public License v3.
# See http://www.gnu.org/licenses/gpl.txt for the full license text.

# Import libraries
import os, sys, subprocess, re
from optparse import OptionParser
from getpass import getuser

#----------Check python version-------#
if sys.version < '3.0':
		print("You need install python3")
		sys.exit()

#---------------Output---------------#

output = [ 'User', 'Hostname', 'Distro', 'Kernel',\
'Uptime', 'WindowManager', 'DesktopEnvironment',\
'Shell', 'Terminal', 'Packages', 'CPU', 'RAM', \
'Home' ]

#---------------Dictionaries---------------#

colorDict = {
	'Gentoo': ['\x1b[0;35m', '\x1b[1;35m'],
	'Debian': ['\x1b[0;31m', '\x1b[1;31m'],
	'Slackware': ['\x1b[0;37m', '\x1b[1;34m'],
	'Arch Linux':['\x1b[0;34m', '\x1b[1;34m'],
	'Sensors': ['\x1b[0;31m', '\x1b[0;32m', '\x1b[0;33m'],
	'Clear': ['\x1b[0m']
	}

deDict = {
	'gnome-session': 'GNOME',
	'mate-session': 'MATE',
	'cinnamon-session': 'Cinnamon',
	'ksmserver': 'KDE',
	'xfce4-session': 'Xfce',
	'lxsession': 'LXDE'
	}

wmDict = {
	'awesome': 'Awesome',
  'subtle': 'Subtle',
	'beryl': 'Beryl',
	'blackbox': 'Blackbox',
	'compiz': 'Compiz',
	'dwm': 'DWM',
	'enlightenment': 'Enlightenment',
	'fluxbox': 'Fluxbox',
	'fvwm': 'FVWM',
	'i3': 'i3',
	'icewm': 'IceWM',
	'kwin': 'KWin',
	'metacity': 'Metacity',
	'musca': 'Musca',
	'openbox': 'Openbox',
	'pekwm': 'PekWM',
	'ratpoison': 'ratpoison',
	'scrotwm': 'ScrotWM',
	'wmaker': 'Window Maker',
	'wmfs': 'Wmfs',
	'wmii': 'wmii',
	'xfwm4': 'Xfwm',
	'xmonad': 'xmonad'
	}

logosDict = {'Gentoo': '''{color[1]}
{color[1]}      -/oyddmdhs+:.                {results[0]}
{color[1]}    -odNMMMMMMMMNNmhy+-`           {results[1]}
{color[1]}   -yNMMMMMMMMMMMNNNmmdhy+-        {results[2]}
{color[1]} `omMMMMMMMMMMMMNmdmmmmddhhy/`     {results[3]}
{color[1]}omMMMMMMMMMMMNhhyyyohmdddhhhdo`    {results[4]}
{color[1]}.ydMMMMMMMMMMdhs++so/smdddhhhhdm+` {results[5]}
{color[1]}oyhdmNMMMMMMMNdyooydmddddhhhhyhNd. {results[6]}
{color[1]} :oyhhdNNMMMMMMMNNNmmdddhhhhhyymMh {results[7]}
{color[1]}   .:+sydNMMMMMNNNmmmdddhhhhhhmMmy {results[8]}
{color[1]}       /mMMMMMMNNNmmmdddhhhhhmMNhs {results[9]}
{color[1]}    `oNMMMMMMMNNNmmmddddhhdmMNhs+` {results[10]}
{color[0]} `sNMMMMMMMMNNNmmmdddddmNMmhs/.    {results[11]}
{color[0]} /NMMMMMMMMNNNNmmmdddmNMNdso:`     {results[12]}
{color[0]}+MMMMMMMNNNNNmmmmdmNMNdso/-        {results[13]}
{color[0]}MNNNNNNNmmmmmNNMmhs+/-`            {results[14]}
{color[0]}/hMMNNNNNNNNMNdhs++/-`             {results[15]}
{color[0]}`/ohdmmddhys+++/:.`                {results[16]}
{color[0]} `-//////:--.                      {results[17]}
\x1b[0m''',
'Debian': '''{color[1]}
{color[1]}       _,met$$$$$gg.        {results[0]}
{color[1]}    ,g$$$$$$$$$$$$$$$P.     {results[1]}
{color[1]}   ,g$$P""       """Y$$.".  {results[2]}
{color[1]}  ,$$P'              `$$$.  {results[3]}
{color[1]}',$$P       ,ggs.     `$$b: {results[4]}
{color[1]}`d$$'     ,$P"'   .    $$$  {results[5]}
{color[1]} $$P      d$'     ,    $$P  {results[6]}
{color[1]} $$:      $$.   -    ,d$$'  {results[7]}
{color[0]} $$;      Y$b._   _,d$P'    {results[8]}
{color[0]} Y$$.    `.`"Y$$$$P"'       {results[9]}
{color[0]} `$$b      "-.__            {results[10]}
{color[0]}  `Y$$b                     {results[11]}
{color[0]}   `Y$$.                    {results[12]}
{color[0]}     `$$b.                  {results[13]}
{color[0]}       `Y$$b.               {results[14]}
{color[0]}         `"Y$b._            {results[15]}
{color[0]}            `""""           {results[16]}
{color[0]}                            {results[17]}
\x1b[0m''',
'Arch Linux': '''{color[1]}
{color[1]}               +                {results[0]}
{color[1]}               #                {results[1]}
{color[1]}              ###               {results[2]}
{color[1]}             #####              {results[3]}
{color[1]}             ######             {results[4]}
{color[1]}            ; #####;            {results[5]}
{color[1]}           +##.#####            {results[6]}
{color[1]}          +##########           {results[7]}
{color[1]}         ######{color[0]}#####{color[1]}##;         {results[8]}
{color[1]}        ###{color[0]}############{color[1]}+        {results[9]}
{color[1]}       #{color[0]}######   #######        {results[10]}
{color[0]}     .######;     ;###;`\#.     {results[11]}
{color[0]}    .#######;     ;#####.       {results[12]}
{color[0]}    #########.   .########`     {results[13]}
{color[0]}   ######'           '######    {results[14]}
{color[0]}  ;####                 ####;   {results[15]}
{color[0]}  ##'                     '##   {results[16]}
{color[0]} #'                         `#  {results[17]}
\x1b[0m''',
'Slackware': '''{color[1]}
{color[1]}                                {results[0]}
{color[1]}                                {results[1]}
{color[1]}        cllcccccllll            {results[2]}
{color[1]}       lc           dc          {results[3]}
{color[1]}    cl   clclclcl  oc           {results[4]}
{color[1]}    o   lc      co  oc          {results[5]}
{color[1]}    o    clclcl   clc           {results[6]}
{color[1]}     lc        cclccclc         {results[7]}
{color[1]}      lcclcc         cl         {results[8]}
{color[1]}   cclcc     lccclc    oc       {results[9]}
{color[1]}   o    l          l   cl       {results[10]}
{color[0]}## o    clcllcccllcl   o        {results[11]}
{color[0]}## o                 clc        {results[12]}
{color[0]}## ccslclccclcccclccll          {results[13]}
{color[0]}############################    {results[14]}
{color[0]}                                {results[15]}
{color[0]}                                {results[16]}
{color[0]}                                {results[17]}
\x1b[0m'''
}

processes = str(subprocess.check_output(('ps', '-u', getuser(),\
	'-o', 'comm', '--no-headers')), encoding='utf8').rstrip('\n').split('\n')
detect = subprocess.getoutput('cat /etc/*release')

#---------------Classes---------------#

class Output:
	results = []
	results.extend(['']*(18-len(output)))

	def __init__(self):
		self.distro = self.__detectDistro()

	def __detectDistro(self):
		if 'Gentoo' in detect:
			return 'Gentoo'
		if 'Debian' in detect:
			return 'Debian'
		if 'arch' in detect:
			return 'Arch Linux'
		if 'Slackware' in detect:
			return 'Slackware'
		else:
			sys.exit(1)

	def append(self, display):
		self.results.append('%s%s: %s%s' % (colorDict[self.distro][1],\
			display.key, colorDict['Clear'][0], display.value))

	def output(self):
		print(logosDict[self.distro].format(color = colorDict[self.distro],\
			results = self.results))

class User:
	def __init__(self):
		self.key = 'User'
		self.value = os.getenv('USER')

class Hostname:
	def __init__(self):
		hostname = subprocess.getoutput('uname -n')
		self.key = 'Hostname'
		self.value = hostname

class Distro:
	def __init__(self):
		if 'Gentoo' in detect:
			distro = 'Gentoo'
		if 'Debian' in detect:
			distro =  'Debian'
		if 'arch' in detect:
			distro =  'Arch Linux'
		if 'Slackware' in detect:
			distro = 'Slackware'
		self.key = 'Distro'
		self.value = distro

class Kernel:
	def __init__(self):
		kernel = subprocess.getoutput('uname -r')
		self.key = 'Kernel'
		self.value = kernel

class Uptime:
	def __init__(self):
		fuptime = int(open('/proc/uptime').read().split('.')[0])
		day = int(fuptime / 86400)
		fuptime = fuptime % 86400
		hour = int(fuptime / 3600)
		fuptime = fuptime % 3600
		minute = int(fuptime / 60)
		uptime = ''
		if day == 1:
			uptime += '%d day, ' % day
		if day > 1:
			uptime += '%d days, ' % day
		uptime += '%d:%02d' % (hour, minute)
		self.key = 'Uptime'
		self.value = uptime

class WindowManager:
	def __init__(self):
		wm = ''
		for key in wmDict.keys():
			if key in processes:
				wm = wmDict[key]
				break

		self.key = 'Window Manager'
		self.value = wm

class DesktopEnvironment:
	def __init__(self):
		de = ''
		for key in deDict.keys():
			if key in processes:
				de = deDict[key]
				break

		self.key = 'Desktop Environment'
		self.value = de

class Shell:
	def __init__(self):
		self.key = 'Shell'
		self.value = os.getenv('SHELL')

class Terminal:
	def __init__(self):
		self.key = 'Terminal'
		self.value = os.getenv('TERM')

class Packages:
	def __init__(self):
		if 'Gentoo' in detect:
			packages = subprocess.getoutput('ls -d /var/db/pkg/*/* | wc -l')
		if 'Debian' in detect:
			packages = subprocess.getoutput('dpkg --get-selections | wc -l')
		if 'arch' in detect:
			packages = subprocess.getoutput('pacman -Qq | wc -l')
		if 'Slackware' in detect:
			packages = subprocess.getoutput('ls -1 /var/log/packages | wc -l')
		self.key = 'Packages'
		self.value = packages

class CPU:
    def __init__(self):
        file = open('/proc/cpuinfo').readlines()
        cpuinfo = re.sub('  +', ' ', file[4].replace('model name\t: ', '').rstrip('\n'))
        self.key = 'CPU'
        self.value = cpuinfo

class RAM:
	def __init__(self):
		raminfo = subprocess.getoutput('free -m --total | grep cache')
		used = raminfo.split()[8]
		free = raminfo.split()[9]
		ramdisplay = '%s%s %s* %s%s%s%s' % (colorDict['Sensors'][1],\
			used, colorDict['Clear'][0], colorDict['Gentoo'][0],\
			free, colorDict['Clear'][0], ' MB')
		self.key = 'RAM'
		self.value = ramdisplay

class Home:
    def __init__(self):
        home = subprocess.getoutput('df -Tlh --total | grep home')
        used = home.split()[3]
        size = home.split()[4]
        percent = home.split()[5]
        disk = '%s%s %s* %s%s %s-- %s%s' % (colorDict['Sensors'][0],\
        	used, colorDict['Clear'][0], colorDict['Gentoo'][0],\
        	size, colorDict['Clear'][0], colorDict['Sensors'][2],percent)
        self.key = 'Home'
        self.value = disk

classes = {
 'User': User,
 'Hostname': Hostname,
 'Distro': Distro,
 'Kernel': Kernel,
 'Uptime': Uptime,
 'WindowManager': WindowManager,
 'DesktopEnvironment': DesktopEnvironment,
 'Shell': Shell,
 'Terminal': Terminal,
 'Packages': Packages,
 'CPU': CPU,
 'RAM': RAM,
 'Home': Home,
 }


out = Output()
for x in output:
	out.append(classes[x]())
out.output()

#--------Take Screenshot-------#
parser = OptionParser()
parser.add_option('-s', '--screenshot', dest='screenshot',
		          action='store_true', default=False,
		          help="take screenshot")
options, args = parser.parse_args()

if options.screenshot:
	subprocess.getoutput('scrot -cd3')
if args:
	print('The rest args:', args)
