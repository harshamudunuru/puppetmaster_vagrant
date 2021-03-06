require 'spec_helper'

describe port(3389) do
  it { should be_listening.with('udp')  }
  it { should be_listening.with('tcp')  }
end


describe file('c:/windows') do
  it { should be_directory }
end

# uru environment is simply a custom PATH prefix

describe command(<<-EOF
 pushd env:
 dir 'PATH' | format-list
 popd
  EOF
) do
  its(:stdout) { should match Regexp.new('_U1_;c:/uru\\\\ruby\\\\bin;_U2_;') }
end

