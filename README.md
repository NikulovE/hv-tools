# Hyper-V Guest Tools for OpenWrt

## Overview

This package provides Hyper-V Guest Tools for OpenWrt, including various utilities and daemons to enhance integration with Hyper-V virtual machines. The package contains scripts and daemons to support functionality like file copy, key-value pair exchange, and snapshot management.

## Package Contents

- **hv_fcopy_daemon**: Daemon for file copy operations.
- **hv_kvp_daemon**: Daemon for key-value pair exchange.
- **hv_vss_daemon**: Daemon for snapshot services.
- **hv_get_dhcp_info.sh**: Script to retrieve DHCP information.
- **hv_get_dns_info.sh**: Script to retrieve DNS information.

## Installation

To install the Hyper-V Guest Tools package on OpenWrt, follow these steps:

**Clone the OpenWrt repository** (if you haven't already):

```sh
git clone https://github.com/openwrt/openwrt.git
cd openwrt
```

Add the Hyper-V Guest Tools package to your OpenWrt build:

Navigate to the package/ directory:

```sh
cd package
```

Create a new directory for the package:

```sh
mkdir hv-tools
cd hv-tools
```

Create a Makefile and files/ directory as described in the package structure.
Configure and build OpenWrt:

```sh
./scripts/feeds update -a
./scripts/feeds install -a
make defconfig
make menuconfig 
make
```

Install the package on your OpenWrt device:

Copy the built package file from bin/targets/x86/64/packages/ to your OpenWrt device.
Install the package using opkg:

```sh
opkg install /tmp/hv-tools.ipk
```

Configuration
The package includes initialization scripts located in /etc/rc.d/:

hv_fcopy_daemon: Start the file copy daemon.
hv_kvp_daemon: Start the key-value pair daemon.
hv_vss_daemon: Start the VSS daemon.
Configuration of these daemons is handled via their respective configuration files in /etc/config/.

Scripts
hv_get_dhcp_info.sh: Retrieves DHCP status.
hv_get_dns_info.sh: Retrieves DNS server information.
These scripts are located in /usr/bin/ and can be used directly from the command line.

License
This package is licensed under the GPL-2.0 license. See the LICENSE file for more details.

Troubleshooting
If you encounter issues during installation or usage, refer to the OpenWrt documentation or check the system logs for detailed error messages. Ensure that all dependencies are met and the package is compatible with your OpenWrt version.

Contribution
Contributions to improve the package are welcome. Please submit issues or pull requests on the GitHub repository.

Contact
For support or inquiries, contact Evgeny Nilov.
