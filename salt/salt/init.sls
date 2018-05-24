{% set pip_index_url = pillar['pip']['index_url'] %}

include:
  - python-pip

python-pip-install_swig_pkg:
  pkg.installed:
    - name: {{ pillar['swig']['package-name'] }}
    - ignore_epoch: True

python-pip-install_gcc_pkg:
  pkg.installed:
    - name: {{ pillar['gcc']['package-name'] }}
    - ignore_epoch: True

python-pip-install_libssl-dev_pkg:
  pkg.installed:
    - name: {{ pillar['libssl-dev']['package-name'] }}
    - ignore_epoch: True

python-pip-install_x509_deps:
  pip.installed:
    - pkgs:
      - M2Crypto == 0.23
    - upgrade: True
    - reload_modules: True
    - index_url: {{ pip_index_url }}
    - require:
      - pkg: python-pip-install_swig_pkg
      - pkg: python-pip-install_gcc_pkg
      - pkg: python-pip-install_libssl-dev_pkg
