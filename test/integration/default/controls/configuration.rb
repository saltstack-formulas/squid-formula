title 'Verify configuration of squid'

describe file('/etc/squid3') do
    it { should be_directory }
end

describe file('/etc/squid3/squid.conf') do
    it { should be_file }
    it { should be_owned_by 'root' }
    its('group') { should eq 'root' }

    # verify http_port and https_port
    its('content') { should match 'http_port 3128'}
    its('content') { should match 'http_port 8080'}
    its('content') { should match 'https_port 443'}

    # verify ACL
    its('content') { should match 'acl localnet src 192.168.0.1/32' }
    its('content') { should match 'acl CONNECT method CONNECT' }
    its('content') { should match 'acl restricted_net src 192.168.100.0/24' }
    its('content') { should match 'acl SSL_ports port 443' }
    its('content') { should match 'acl safe_ports port 80' }
    its('content') { should match 'acl safe_ports port 443' }
    its('content') { should match 'acl restricted_domains dstdomain restricted_domain.tld' }
    its('content') { should match 'acl forbidden_domains dstdomain forbidden_domain.tld' }

    # verify cache manager
    its('content') { should match 'cache_mgr root@domain.tld' }
    its('content') { should match 'cachemgr_passwd mypassword' }
    its('content') { should match 'acl manager url_regex' }
    its('content') { should match 'http_access allow localhost manager' }
    its('content') { should match 'http_access deny manager' }

    # refresh patterns
    its('content') { should match 'refresh_pattern .            0       20%     4320' }

    # hostname
    its('content') { should match 'visible_hostname some.name' }
end

