#echo:
#    docker_image.absent:
#        - images:
#            - k8s.gcr.io/echoserver
#        - force: True
#    docker_container.absent:
#        - force: True
# template_host router_id dn42_ipv4 xvnet_asn xvnet_ipv6
bird:
  file.managed:
    - name: /etc/bird/bird.conf
    - source: salt://bird/bird.conf.j2
    - context:
        tpldir: salt://bird/
    - template: jinja
    - user: bird
    - group: bird
    - mode: "0666"
#  service.running:
#    - enable: True
#    - reload: True
#    - watch:
#      - file: bird
#    - defaults:
#        custom_var: "default value"
#        other_var: 123
#{% if grains['os'] == 'Ubuntu' %}
#    - context:
#        custom_var: "override"
#{% endif %}
