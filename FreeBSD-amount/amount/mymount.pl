#!/usr/bin/perl -w

use strict;

my $MOUNTABLE='/tmp/.amountd/mountable';
my $AMOUNT='/etc/amount';
my $OPENTHUNAR=$AMOUNT . '/openthunar.sh';
my $ICON=$AMOUNT .'/icons/media-flash.svg';

my $USER=`whoami`; chomp($USER);
my $HOME="\/home\/$USER";
my $DESKTOP=$HOME . '/Desktop';


#print "User:$USER Home:$HOME Desktop:$DESKTOP\n";

#exit 1;

#Delete old stuff (icons)
system ("rm -f $DESKTOP\/AMOUNT_*.desktop");


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
	$label = $dev if !defined $label;	

	my $mountdir= '/media/' . $dev;

	my $name = "";
	
	if (-d $mountdir)
	{	$name ="Mount $label"; }
	else
	{	$name ="Unmount $label"; }
	
		
	
	$row =<<EOFROW ;
[Desktop Entry]
Name=$name
Exec=$OPENTHUNAR $label
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


