vimrc/root/.vimrc:
  file.managed:
    - name: /root/.vimrc
    - source: salt://common/files/.vimrc
    - user: root
    - group: root
    - mode: 644