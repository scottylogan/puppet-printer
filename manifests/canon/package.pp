# include printer::canon::package
# Find the URLs at
#  http://www.usa.canon.com/cusa/support/consumer/printers_multifunction/...
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

define printer::canon::package (
  $ensure    = 'present',
  $ids       = undef,
  $lang      = 'EN',
  $url_extra = 'cmp=ABR',
  $base_url  = 'http://pdisp01.c-wss.com/gdl/WWUFORedirectTarget.do',
  $provider  = 'pkgdmg',
) {
  $pkg_id = $ids[$title]
  $source = "${base_url}?id=${pkg_id}&${url_extra}&lang=${lang}"

  if $provider == 'appdmg' {

    package { "PrinterCanonMx860-${title}":
      ensure   => $ensure,
      provider => $provider,
      source   => $source,
    }

  } elsif $provider == 'pkgdmg' {

    include wget

    $tmpfile = "/tmp/pkg-${title}.dmg"

    wget::fetch { $source:
      destination => $tmpfile,
    }
    ->
    package { "PrinterCanonMx860-${title}":
      ensure   => $ensure,
      provider => $provider,
      source   => $tmpfile,
    }
    ->
    file { $tmpfile:
      ensure => absent,
    }

  } else {

    fail('only pkgdmg and appdmg providers are supported')
  }

}

