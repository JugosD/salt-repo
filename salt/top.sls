base:
  '*':
    - common
  'role:web*':
    - match: grain
    - web
  'role:app*':
    - match: grain
    - app