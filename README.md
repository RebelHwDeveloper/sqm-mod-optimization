# sqm-mod-optimization
This is the repo shall contain all the files concerning the IP QOS mechanism tailored for the MT-7620 board 
How should you walk this repo? 

First, you need to create the same configuration. 
1.	Start with an MT7620 board
2.	Install the sysupgrade file (flash the new firmware)
3.	Restore the backup (or copy by hand sqm, network and firewall config files)

Second, you need to test. (This can be done before flashing the new image as well to compare the test results, before and after)
1.	Start with a streaming (refer to instructions file)			            
2.	Measure with Wireshark and VLC statistics		                         
3.	Stress the system with iperf and collect his results as well	      

Third, analyze and report.

This is the general procedure followed with this board. In the repo you will find some of the data collected in the tests to “jump start” and have a look at how I organized the analytics and performance benchmark. It’s very simple, so feel free to complicate and spice things up.
