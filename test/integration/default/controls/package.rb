title 'Verify installation of squid'

describe package('squid3') do
    it { should be_installed }
end

