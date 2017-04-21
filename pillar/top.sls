base:
  'role:app*':
    - match: grain
    - app
    - secrets.app
  'role:app-1':
    - match: grain
    - app1
  'role:app-2':
    - match: grain
    - app2
