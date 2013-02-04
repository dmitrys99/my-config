#!/usr/bin/perl -w

use strict;

my $MOUNTABLE='/tmp/.amountd/mountable';
my $AMOUNT='/etc/amount';
my $OPENTHUNAR=$AMOUNT . '/openthunar.sh';

my $ICONDIR= $AMOUNT .'/icons/' ;
my $GENERIC_ICON="drive-removable-media-usb.png";
my $FLASH1_ICON="media-flash.svg";
my $FLASH2_ICON="gnome-dev-media-sm.png";

#my $ICON=$AMOUNT .'/icons/media-flash.svg';

my $USER=`whoami`; chomp($USER);
my $HOME="\/home\/$USER";
my $DESKTOP=$HOME . '/Desktop';

my $XFDESKTOP=`which xfdesktop`; chomp($XFDESKTOP);
my $XFDESKTOP_RELOAD= $XFDESKTOP . ' --reload';


#Exit if $DESKTOP not exists
unless (-d $DESKTOP)
{	exit 1;	}

#Test
#print "User:$USER Home:$HOME Desktop:$DESKTOP\n";
#exit 1;

#Delete old icons to repaint again later
system ("rm -f $DESKTOP\/AMOUNT_*.desktop");
`$XFDESKTOP_RELOAD`;

open(INPUT,"<$MOUNTABLE") or
	die "ERROR. $MOUNTABLE unreadable";
	
my $row="";

LINE:	while (<INPUT>)
{
	s/[\n\r\-]//g;
	s/[\s\t]+/ /g;
	
	my $line = $_ ;

	#print $line;
	my ($dev, $type, $label) = split(' ', $line);
	next if (!defined $dev || !defined $type);
	$label = $dev if !defined $label;	
	
	my $ICON;
	$ICON = "$ICONDIR$GENERIC_ICON" if ($dev =~ m/da\d/ ) ;
	$ICON = "$ICONDIR$FLASH2_ICON" if ($dev =~ m/mmc\d/ ) ;
		
	
	my $mountdir= '/media/' . $label;
	print "Mountdir = $mountdir\n";

	my $name = "";
	
	if (-d $mountdir)
	{	$name ="Unmount $label"; }
	else
	{	$name ="Mount $label"; }
	
		
	
	$row =<<EOFROW ;
[Desktop Entry]
Name=$name
Exec=$OPENTHUNAR $dev
Type=Application
Path=
Icon=$ICON
EOFROW

	my $outputfile=$DESKTOP . '/' . "AMOUNT_$label" . '.desktop';

	open(OUTPUT,">$outputfile") or
		die "ERROR. I can't write to $outputfile" ; 

	print OUTPUT $row ;
	close OUTPUT; 

	
}

close INPUT;

`$XFDESKTOP_RELOAD`;


