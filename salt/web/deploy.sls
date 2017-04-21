download-content:
  module.run:
    - name: s3.get
    - bucket: {{ grains['content-bucket'] }}
    - path: static/web.tar.gz
    - return_bin: true
    - local_file: /tmp/web.tar.gz

unpack-content:
  archive.extracted:
    - name: /var/www/html/{{ grains['hostname'] }}/static
    - source: /tmp/web.tar.gz
