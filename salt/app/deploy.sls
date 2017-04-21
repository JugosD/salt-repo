download-app-bundle:
  module.run:
    - name: s3.get
    - bucket: {{ grains['deployment-bucket'] }}
    - path: artifacts/{{ pillar['webapp']['prefix']}}-{{ pillar['webapp']['version'] }}.war
    - return_bin: true
    - local_file: /tmp/webapp-{{ pillar['webapp']['version'] }}.war

undeploy-bundle:
  tomcat.undeployed:
    - name: /simple-app
    - require:
      - module: download-app-bundle

deploy-bundle:
  tomcat.war_deployed:
    - name: /simple-app
    - war: /tmp/webapp-{{ pillar['webapp']['version'] }}.war
    - require:
      - tomcat: undeploy-bundle

replace-content:
  file.managed:
    - name: /usr/share/tomcat/webapps/simple-app/WEB-INF/classes/greeting.txt
    - source: salt://app/files/greeting.txt
    - user: tomcat
    - group: tomcat
    - mode: 644
    - template: jinja
    - defaults:
        message: {{ pillar['welcome-message'] }}
        version: {{ pillar['webapp']['version'] }}
    - require:
        - tomcat: deploy-bundle
