use strict;
use warnings;
#!/usr/bin/Rscript

while(1 == 1)
{
	my $t = localtime();
	print "\n===============================\nStarted at: $t\n===============================\n\n";
	my @a = split /\s/, $t;
#	print "@a\n";

	my @arr = split /:/, $a[3];
#	print "$arr[0]\n";
	if($arr[0] >= 13 && $arr[0] <= 18)		#run only between 1 and 5 pm CEST
	{
#		print "Entered\n1\n";
		#run perl prog for webscrapping
		system("perl perl_web_scrapper.pl");
		
		#run make graph prog
		system(`"C:/Program Files/R/R-3.6.3/bin/Rscript.exe" graphs.r`);
		
#		print "2\n";
		#run daily rise in cases and deaths
		system(`"C:/Program Files/R/R-3.6.3/bin/Rscript.exe" daily_rise.r`);
		
#		print "3\n";
		#run rss feed script; runs after every 60 minutes (depending on time defined in sleep function)
		system(`"C:/Program Files/R/R-3.6.3/bin/Rscript.exe" rss_feed_extraction.r`);
		
		sleep(20);
		
		system("perl git.pl");
		sleep(1760);
	}
	else
	{
		#run rss feed script; runs after every 60 minutes (depending on time defined in sleep function)
		system(`"C:/Program Files/R/R-3.6.3/bin/Rscript.exe" rss_feed_extraction.r`);
		
		sleep(20);
		
		system("perl git.pl");
		sleep(10700);
	}
}