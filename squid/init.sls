# This is the main state file for configuring squid.

{% from "squid/map.jinja" import map with context %}

squid_pkgs:
  pkg.installed:
    - pkgs:
      {% for pkg in map.pkgs %}
      - {{ pkg }}
      {% endfor %}

squid_service:
  service.running:
    - name: {{ map.service }}
    - enable: True
    - require:
      - pkg: squid_pkgs
    - watch:
      - file: squid_config

squid_config:
  file.managed:
    - name: {{ map.conf_dir }}/{{ map.conf_file }}
    - source: salt://squid/files/squid.conf
    - template: jinja
