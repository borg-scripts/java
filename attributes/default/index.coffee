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
