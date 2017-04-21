/usr/share/tomcat/conf/tomcat-users.xml:
  file.managed:
    - source: salt://app/files/tomcat-users.xml
    - user: root
    - group: tomcat
    - mode: 640
    - template: jinja
    - defaults:
        username: {{ pillar['tomcat-manager']['user'] }}
        password: {{ pillar['tomcat-manager']['passwd'] }}

tomcat:
  service.running:
    - enable: True
    - reload: True
    - watch:
        - file: /usr/share/tomcat/conf/tomcat-users.xml
