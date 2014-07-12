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
      install_dir: '/opt/apache-ant-1.9.4'
      version: 'Apache Ant(TM) version 1.9.4 compiled on April 29 2014'
      download:
        url: "http://mirror.cc.columbia.edu/pub/software/apache//ant/binaries/apache-ant-1.9.4-bin.tar.gz",
        checksum: "66d3edcbb0eba11387705cd89178ffb65e55cd53f13ca35c1bb983c0f9992540"
        extracts_to: "apache-ant-1.9.4"
