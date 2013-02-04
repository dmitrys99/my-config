This is a dirty hack of 'amount-05', a set of scripts that deal with automounting in FreeBSD. The original software was published in:

http://forums.FreeBSD.org/register.php?a=act&u=24226&i=66c50e6811c65aaccb9a7bb811238f411243b444

The attachment in this forum containing 'amount-0.5' is:

https://freebsd-forums.liquidneon.com/attachment.php?attachmentid=1244&d=1306102276


My hack is customized for XFCE4 but it can be easily adapted to others wms.
NTFS automount works but it wasn't widely tested.

How does it work?

'automound' has to be launched when XFCE4 starts, so configure XFCE4 to run it at the begining.

Then everything should work transparently for the user. When a new media (pen driver, or USB drive) is inserted in the computer 'automountd' calls the 'updatedesktop.pl' script in order to create a new icon in the desktop. This icon, when clicked, calls to 'automount' to mount/unmount the media. Every time the icon is clicked it's label (icon's label) changes to reflect if the next action is 'Mount' or 'Unmout'. 

To do:

Large FAT32 support
More NTFS tests
MMC Card reader (it should be easy)

Thank you very much to 'aragon', the guy who make 'amount'.

Jes
jjjesss at gmail dot com