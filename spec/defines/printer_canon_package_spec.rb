require 'spec_helper'

describe "printer::canon::package" do
  let(:params) {
    {
      :ids   => {
        "mcpd" => "MDEwMDAwNTY3NjAy"
      },
      :provider => 'pkgdmg'
    }
  }
  let(:title) { 'mcpd' }

  it do
    should contain_package("PrinterCanonMx860-mcpd").with({
      :source   => '/tmp/pkg-mcpd.dmg',
      :provider => 'pkgdmg'
    })
  end
end


describe "printer::canon::package" do

  let(:params) {
    {
      :ids   => {
        "mwsa" => "MDIwMDAwMzMwOTAy"
      },
      :provider => 'appdmg'
    }
  }
  let(:title) { 'mwsa' }

  it do
    should contain_package("PrinterCanonMx860-mwsa").with({
      :source   => 'http://pdisp01.c-wss.com/gdl/WWUFORedirectTarget.do?id=MDIwMDAwMzMwOTAy&cmp=ABR&lang=EN',
      :provider => 'appdmg'
    })
  end
end

