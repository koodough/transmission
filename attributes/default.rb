#
# Author:: Seth Chisamore (<schisamo@opscode.com>)
# Cookbook Name:: transmission
# Attribute:: default
#
# Copyright 2011, Opscode, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# Config Reference: https://trac.transmissionbt.com/wiki/EditConfigFiles

::Chef::Node.send(:include, Opscode::OpenSSL::Password)

case node['platform']
when "ubuntu","debian", "raspbian"
  default['transmission']['install_method'] = 'package'
  default['transmission']['user']           = 'debian-transmission'
  default['transmission']['group']          = 'debian-transmission'
else
  default['transmission']['install_method'] = 'source'
  default['transmission']['user']           = 'transmission'
  default['transmission']['group']          = 'transmission'
end

default['transmission']['url']              = 'http://download.transmissionbt.com/files'
default['transmission']['version']          = '2.03'
default['transmission']['checksum']         = '06802c6f4ba517341eb287b273145ccd5e7b0fba2a270da82f0eb0a683cf4046'


default['transmission']['home']             = '/var/lib/transmission-daemon'
default['transmission']['config_dir']       = '/var/lib/transmission-daemon/info'




# transmission settings.json file
default['transmission']['settings'] = {

# Bandwidth
'alt-speed-enabled'        	=> 'false', # aka 'Turtle Mode'
'alt-speed-up'         		=> 50, #KB/s
'alt-speed-down'        	=> 50, #KB/s
'speed-limit-down'         	=> 100, #KB/s
'speed-limit-down-enabled' 	=> 'false',
'speed-limit-up'           	=> 100, #KB/s
'speed-limit-up-enabled'   	=> 'false',
'upload-slots-per-torrent' 	=> 14,

# Blocklists
'blocklist-url' 	 		=> 'http://www.example.com/blocklist',
'blocklist-enabled' 		=> 'false',


# Files and Locations 
'download-dir'     		=> '/var/lib/transmission-daemon/downloads',
'incomplete-dir'   		=> '/var/lib/transmission-daemon/incomplete',
'incomplete-dir-enabled'=> 'false',
'preallocation'		  	=> 1,
'rename-partial-files' 	=> 'true',
'start-added-torrents' 	=> 'true',
'trash-original-torrent-files' => 'false',
'umask' 				=> 18,
'watch-dir'    			=> '/var/lib/transmission-daemon/watch',
'watch-dir-enabled'     => 'false',

# Misc
'cache-size-mb'       			=> 4, #MB
'dht-enabled'       			=> 'true', #Distributed Hash Table (DHT)
'encryption'       				=> 1, # 0 = Prefer unencrypted connections, 1 = Prefer encrypted connections, 2 = Require encrypted connections; default = 1
'lazy-bitfield-enabled'       	=> 'true',
'lpd-enabled'    				=> 'false', #Local Peer Discovery (LPD)
'message-level'       			=> 2, #(0 = None, 1 = Error, 2 = Info, 3 = Debug, default = 2)
'pex-enabled'      				=> 'true', #Peer Exchange (PEX)
'prefetch-enabled'     			=> 'true', 
'scrape-paused-torrents-enabled'=> 'true',
'script-torrent-done-enabled'   => 'false',
'script-torrent-done-filename'  => '',
'utp-enabled' 		 			=> 'true',

# Peers
'bind-address-ipv4'        => '0.0.0.0',
'bind-address-ipv6'        => '::',
'peer-congestion-algorithm'=> "",
'peer-limit-global'        => 240,
'peer-limit-per-torrent'   => 60,
'peer-socket-tos'          => 'default',

# Peer Port
'peer_port'        	 		=> 51413,
'peer-port-random-high' 	=> 65535,
'peer-port-random-low'  	=> 1024,
'peer-port-random-on-start' => 'false',
'port-forwarding-enabled' 	=> 'true',

# Queuing
'download-queue-enabled' 	=> 'true',
'download-queue-size' 		=> 5,
'queue-stalled-enabled' 	=> 'true',
'queue-stalled-minutes' 	=> 30,
'seed-queue-enabled' 		=> 'false',
'seed-queue-size' 			=> 10,

# RPC
'rpc-authentication-required' => 'false',
'rpc-bind-address' 			=> '0.0.0.0',
'rpc-enabled' 			=> 'true',
'rpc-username'     			=> 'transmission',
'rpc-password'     			=> 'transmission',
# set_unless['transmission']['rpc_password']  = secure_password
'rpc-port'       			=> 9091,
'rpc-whitelist'          	=> '127.0.0.1',
'rpc-whitelist-enabled'  	=> 'true',

# Scheduling
'alt-speed-time-enabled' 	=> 'false',
'alt-speed-time-begin' 		=> 540,
'alt-speed-time-end' 		=> 1020,
'alt-speed-time-day' 		=> 127,
'idle-seeding-limit' 		=> 30,
'idle-seeding-limit-enabled'=> 'false',
'ratio-limit' 				=> '2.0',
'ratio-limit-enabled' 		=> 'false',

# Proxy 
'proxy-authentication' => '',
'proxy-authentication-required' => 0,
'proxy-port' => 80,
'proxy-server' => '',
'proxy-server-enabled' => 0, 
'proxy-type' => 0, # (0 = HTTP, 1 = SOCKS4, 2 = SOCKS5, default = 0)
'proxy-username' => ''

}



