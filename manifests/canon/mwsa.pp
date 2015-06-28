# include printer::canon::mwsa
#
# Packages
#
#  mwsa-mac-...       Canon PIXMA Wireless Setup Assistant (Mac)


class printer::canon::mwsa (
  $ensure    = 'present',
  $lang      = 'EN',
  $url_extra = 'cmp=ABR',
  $base_url  = 'http://pdisp01.c-wss.com/gdl/WWUFORedirectTarget.do',
  $id        = 'MDIwMDAwMzMwOTAy',
) {
  printer::canon::package { 'mwsa':
    ensure    => $ensure,
    ids       => { 'mwsa' => $id },
    lang      => $lang,
    url_extra => $url_extra,
    base_url  => $base_url,
    provider  => 'appdmg',
  }
}

