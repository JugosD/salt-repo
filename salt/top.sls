base:
  '*':
    - base
  'role:web*':
    - match: grain
    - web
  'role:app*':
    - match: grain
    - app