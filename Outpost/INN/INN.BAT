@echo off

:doscreen

cls


echo              ษอออออออออออออออออออออออออออออออออออออออออออออออออออป
echo              บ                  ImagiNation CD                   บ
echo              วฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤถ
echo              บ                                                   บ
echo              บ    This CD contains the software for The          บ
echo              บ ImagiNation Network.                              บ
echo              บ                                                   บ
echo              บ    To install ImagiNation onto your hard disk,    บ
echo              บ press 1.                                          บ
echo              บ                                                   บ
echo              บ    To exit to DOS press 2.                        บ
echo              บ                                                   บ
echo              บ                                                   บ
echo              บ               1 - Install ImagiNation             บ
echo              บ               2 - Exit to DOS                     บ
echo              บ                                                   บ
echo              บ                                                   บ
echo              ศอออออออออออออออออออออออออออออออออออออออออออออออออออผ


..\what CE 12

if "%what%" == "1" goto install_INN

if "%what%" == "2" goto drop2dos
if "%what%" == "" goto drop2dos

goto doscreen

:install_INN
install

:drop2dos
cls
