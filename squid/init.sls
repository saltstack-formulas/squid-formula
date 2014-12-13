squid:
  pkg.installed: []
  service.running:
    - enable: True
    - require:
      - pkg: squid
    - watch:
      - file: squid
  file.managed:
    - name: /etc/squid/squid.conf
    - source: salt://squid/files/squid.conf
    - template: jinja
