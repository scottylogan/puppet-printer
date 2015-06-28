require 'spec_helper'

describe "printer::canon::mwsa" do
  it {
    should contain_package("PrinterCanonMx860-mwsa").with({
      :source   => "http://pdisp01.c-wss.com/gdl/WWUFORedirectTarget.do?id=MDIwMDAwMzMwOTAy&cmp=ABR&lang=EN",
      :provider => 'appdmg'
    })
  }
end

