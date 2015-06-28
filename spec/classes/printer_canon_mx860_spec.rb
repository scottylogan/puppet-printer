require 'spec_helper'

describe "printer::canon::mx860" do
  let(:params) {
    {
      :packages => [ "mcpd" ]
    }
  }
  it {
    should contain_package("PrinterCanonMx860-mcpd").with({
      :source   => "http://pdisp01.c-wss.com/gdl/WWUFORedirectTarget.do?id=MDEwMDAwNTY3NjAy&cmp=ABR&lang=EN",
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
        :source   => "http://pdisp01.c-wss.com/gdl/WWUFORedirectTarget.do?id=#{pkg_id}&cmp=ABR&lang=EN",
        :provider => 'pkgdmg'
      })
    }
  end
end
