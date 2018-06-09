#!/usr/bin/env perl
# Krishna Bhattarai
# Perl script for raspberry pi

use strict;
use warnings;
$name         = `tvservice -n | awk -F'=' '{print \$2}'`;
$status       = `tvservice -s`;

$ips      = `ip addr | grep -Po '(?!(inet 127.\d.\d.1))(inet \K(\d{1,3}\.){3}\d{1,3})'`;
$ip_eth0  = `ip route | grep "eth0  proto" | awk '{print \$9}'`;
$ip_wlan0 = `ip route | grep "wlan0  proto" | awk '{print \$9}'`;

$memory = `vcgencmd get_mem arm && vcgencmd get_mem gpu`;
$arm    = `vcgencmd get_mem arm`;
$gpu    = `vcgencmd get_mem gpu`;
$orientation  = `cat s3-ingestor.json | python -m json.tool | grep \"etl/images/orientation= | head -1 | sed 's/.*orientation=//; s/\/.*//'`;

print($orientation);
print($name);
print($status);
print($ips);
print($ip_eth0);
print($ip_wlan0);
print($memory);
print($arm);
print($gpu);

#memory
$free_memory      = `cat /proc/meminfo | grep MemFree | awk '{print \$2/1024}'`;                       # get free memory in Mb
$total_memory     = `cat /proc/meminfo | grep MemTotal | awk '{print \$2/1024}'`;                      # get total memory in Mb
$available_memory = `cat /proc/meminfo | grep MemAvailable | awk '{print \$2/1024}'`;                  # get availabe memory in Mb
$buffers          = `cat /proc/meminfo | grep Buffers | awk '{print \$2/1024}'`;                       # get Buffers info in Mb
$cached_memory    = `cat /proc/meminfo | grep Cached | awk 'NR==1' | awk '{print \$2/1024}'`;          # get Cached memory info in Mb
$dirty_memory     = `cat /proc/meminfo | grep Dirty | awk '{print \$2/1024}'`;                         # get Dirty memory info in Mb
$active_memory    = `cat /proc/meminfo | grep Active | awk 'NR==1' | awk '{print \$2/1024}'`;          # get Active memory info in Mb
$inactive_memory  = `cat /proc/meminfo | grep Inactive | awk '{print \$2/1024}'`;                      # get Inactive memory info in Mb
$temperature      = `cat /sys/class/thermal/thermal_zone0/temp | awk '{print \$1/1000}'`;

print($free_memory);
print($total_memory);
print($available_memory);
print($buffers);
print($cached_memory);
print($dirty_memory);
print($active_memory);
print($inactive_memory);
print($temperature);

#system
$hardware         = `cat /proc/cpuinfo | grep Hardware | awk '{print \$3}'`;                           # Hardware
$revision         = `cat /proc/cpuinfo | grep Revision | awk '{print \$3}'`;                           # Revision
$hostname         = `hostname`;                                                                       # get the hostname
$uptime           = `uptime -p`;                                                                      # get system uptime
$serial           = `cat /proc/cpuinfo | grep Serial | awk '{print \$3}'`;                             # get serial number of the pi
$eth0_macaddress  = `cat /sys/class/net/eth0/address`;                                                # get hardware mac address [eth0]
$wlan0_macaddress = `cat /sys/class/net/wlan0/address`;                                               # get wireless mac address [wlan0]
$kernel           = `uname -mrs`;                                                                     # kernel information
$processor        = `cat /proc/cpuinfo | grep 'model name' | cut -d' ' -f 3- | awk 'NR==1'`;          # get processor model information

print($hardware);
print($revision);
print($hostname);
print($uptime);
print($serial);
print($eth0_macaddress);
print($wlan0_macaddress);
print($kernel);
print($processor);

# voltages
$core_voltage    = `vcgencmd measure_volts core | awk -F'=' '{print \$2 }'`;             # Measure core voltage
$sdram_c_voltage = `vcgencmd measure_volts sdram_c | awk -F'=' '{print \$2 }'`;          # measure sdram_c voltage
$sdram_i_voltage = `vcgencmd measure_volts sdram_i | awk -F'=' '{print \$2 }'`;          # measure sdram_i voltage
$sdram_p_voltage = `vcgencmd measure_volts sdram_p | awk -F'=' '{print \$2 }'`;          # measure sdram_p voltage

print($core_voltage);
print($sdram_c_voltage);
print($sdram_i_voltage);
print($sdram_p_voltage);

# clock
$clock_arm  = `vcgencmd measure_clock arm`;
$clock_h264 = `vcgencmd measure_clock h264`;
$clock_isp  = `vcgencmd measure_clock isp`;
$clock_v3d  = `vcgencmd measure_clock v3d`;
$clock_uart = `vcgencmd measure_clock uart`;
$clock_pwm  = `vcgencmd measure_clock pwm`;
$clock_emmc = `vcgencmd measure_clock emmc`;
$clock_pixel= `vcgencmd measure_clock pixel`;
$clock_vec  = `vcgencmd measure_clock vec`;
$clock_hdmi = `vcgencmd measure_clock hdmi`;
$clock_dpi  = `vcgencmd measure_clock dpi`;

print($clock_arm);
print($clock_h264);
print($clock_isp);
print($clock_v3d);
print($clock_uart);
print($clock_pwm);
print($clock_emmc);
print($clock_pixel);
print($clock_vec);
print($clock_hdmi);
print($clock_dpi);