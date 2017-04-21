/etc/httpd/conf/httpd.conf:
  file.managed:
    - source: salt://web/files/httpd.conf
    - user: root
    - group: root
    - mode: 640

/var/www/html/{{ grains['hostname'] }}/static/.htaccess:
  file.managed:
    - source: salt://web/files/.htaccess
    - user: apache
    - group: apache
    - mode: 644

/etc/httpd/conf.d:
  file.recurse:
    - source: salt://web/files/conf.d
    - clean: True
    - template: jinja
    - defaults:
        host: {{ grains['hostname'] }}

/var/www:
  file.directory:
    - user: apache
    - group: apache
    - recurse:
        - user
        - group

httpd:
  service.running:
    - enable: True
    - reload: True
    - watch:
        - file: /etc/httpd/conf/httpd.conf
        - file: /etc/httpd/conf.d
