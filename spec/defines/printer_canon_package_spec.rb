require 'spec_helper'

describe "printer::canon::package" do
  let(:params) {
    {
      :ids   => {
        "mcpd" => "MDEwMDAwNTY3NjAy"
      }
    }
  }
  let(:title) { 'mcpd' }

  it do
    should contain_package("PrinterCanonMx860-mcpd").with({
      :source   => "http://pdisp01.c-wss.com/gdl/WWUFORedirectTarget.do?id=MDEwMDAwNTY3NjAy&cmp=ABR&lang=EN",
      :provider => 'pkgdmg'
    })
  end
end

