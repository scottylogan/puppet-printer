require 'spec_helper'

describe "printer::canon::mx860" do
#  let(:params) {
#    {
#      :packages => [ "mcpd" ]
#    }
#  }
  it {
    should contain_package("PrinterCanonMx860-mcpd").with({
      :source   => "http://pdisp01.c-wss.com/gdl/WWUFORedirectTarget.do?id=MDEwMDAwNTY3NjAy&cmp=ABR&lang=EN",
      :provider => 'appdmg'
    })
  }
end

