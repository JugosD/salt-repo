/root/.vimrc:
  file.managed:
    - source: salt://base/files/.vimrc
    - user: root
    - group: root
    - mode: 644