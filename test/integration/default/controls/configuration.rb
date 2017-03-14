title 'Verify configuration of squid'

describe file('/etc/squid3') do
    it { should be_directory }
end

describe file('/etc/squid3/squid.conf') do
    it { should be_file }
    it { should be_owned_by 'root' }
    its('group') { should eq 'root' }
end


