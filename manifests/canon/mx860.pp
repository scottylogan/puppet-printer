# include printer::canon::mx860
# Find the URLs at
# http://www.usa.canon.com/cusa/support/consumer/printers_multifunction/ \
#  pixma_mx_series/pixma_mx860#DriversAndSoftware
# Inspect the source, looking for input elements with onclick events like:
#
#  javascript:downloadFile('dlGroup_Desc_2_25','mwsa-mac-2_0_1-en.dmg');
#
# then look for a hidden input element with an ID that is the
# first downloadFile parameter appended to 'fileDownloadURL_'
# (e.g. fileDownloadURL_dlGroup_Desc_2_25)
#
# The value of that input element is the download URL (which
# is redirected to the correct URL)
#
#
# Packages
#
#  msd_-mac-mx860-... MX860 series Scanner Driver
#  mcpd-mac-mx860-... MX860 series CUPS Printer Driver
#  mnt_-mac-...       Canon IJ Network Tool
#  mepe-mac-...       Easy-PhotoPrint EX
#  mmig-mac-...       My Image Garden
#  mmno-mac-...       MP Navigator EX Opener
#  mnve_...-mac-...   MP Navigator EX
#  msm_-mac-...       Solution Menu
#  mwsa-mac-...       Canon PIXMA Wireless Setup Assistant (Mac)


class printer::canon::mx860 (
  $ensure    = 'present',
  $packages  = [ 'msd', 'mcpd', 'mnt', 'mepe', 'mwsa' ],
  $lang      = 'EN',
  $url_extra = 'cmp=ABR',
  $base_url  = 'http://pdisp01.c-wss.com/gdl/WWUFORedirectTarget.do',
  $ids       = {
    'msd'  => 'MDEwMDAwNDM1NjAx',
    'mcpd' => 'MDEwMDAwNTY3NjAy',
    'mnt'  => 'MDIwMDAwMTIxMjAz',
    'mepe' => 'MDIwMDAwMzI4OTAy',
    'mmig' => 'MDIwMDAwMzI4OTAy',
    'mmno' => 'MDIwMDAwMzMwMjAx',
    'mnve' => 'MDIwMDAwMzI4MzAx',
    'msm'  => 'MDIwMDAwMDM2MjA0',
    'mwsa' => 'MDIwMDAwMzMwOTAy',
  },
) {

  Printer::Canon::Package {
    ids       => $ids,
    lang      => $lang,
    url_extra => $url_extra,
    base_url  => $base_url,
  }

  printer::canon::package { $packages:
    ensure => $ensure,
  }
}

