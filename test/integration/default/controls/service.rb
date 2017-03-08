title 'Verify squid service'

describe service('squid3') do
    it { should be_installed }
    it { should be_running }
end

