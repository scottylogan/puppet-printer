require 'spec_helper'

describe "printer::canon::mx860" do
  let(:params) {
    {
      :packages => [ "mcpd" ]
    }
  }
  it {
    should contain_package("PrinterCanonMx860-mcpd").with({
      :source   => "/tmp/pkg-mcpd.dmg",
      :provider => 'pkgdmg'
    })
  }
end

describe "printer::canon::mx860" do
  ids = {
    'msd'  => 'MDEwMDAwNDM1NjAx',
    'mcpd' => 'MDEwMDAwNTY3NjAy',
    'mnt'  => 'MDIwMDAwMTIxMjAz',
    'mepe' => 'MDIwMDAwMzI4OTAy',
  }

  ids.each do |pkg_name, pkg_id|
    it {
      should contain_package("PrinterCanonMx860-#{pkg_name}").with({
        :source   => "/tmp/pkg-#{pkg_name}.dmg",
        :provider => 'pkgdmg'
      })
    }
  end
end
