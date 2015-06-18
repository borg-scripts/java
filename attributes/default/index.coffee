module.exports = ->
  @default java:
    jdk_version: '6u33'
    jvm_dir: '/usr/lib/jvm'
    jdk_downloads:
      '6u33':
        x86_64:
          url: 'PROVIDE-URL-YOURSELF'
          checksum: 'PROVIDE-SHA256SUM-YOURSELF'
          extracts_to: 'jdk1.6.0_33'
      '7u60':
        x86_64:
          url: 'PROVIDE-URL-YOURSELF'
          checksum: 'PROVIDE-SHA256SUM-YOURSELF'
          extracts_to: 'jdk1.7.0_60'
    ant:
      install_dir: '/opt/apache-ant-1.9.5'
      download:
        url: "http://apache.arvixe.com//ant/binaries/apache-ant-1.9.5-bin.tar.gz"
        checksum: "e272e057a3c32b3536ffc050a6abce20aaa08b2618f79868e3e4c9c58628aeef"
        extracts_to: "apache-ant-1.9.5"
