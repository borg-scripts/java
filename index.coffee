path = require 'path'

module.exports = ->
  @import __dirname, 'attributes', 'default'

  # validate version installed matches intended version
  @then @execute "java -version 2>&1", test: ({code, out}) =>
    if code is 0 and out.match new RegExp(@server.java.jdk_downloads[@server.java.jdk_version].x86_64.extracts_to.substr(3))
      return

    dl = @server.java.jdk_downloads[@server.java.jdk_version].x86_64
    file = path.basename dl.url
    @then @download dl.url,
      to: "/tmp/#{file}"
      checksum: dl.checksum
      owner: 'root'
      group: 'root'
      mode: '0644'
      sudo: true

    @then @execute "cd /tmp; tar zxvf #{file}"
    @then @directory @server.java.jvm_dir,
      recursive: true
      owner: 'root'
      group: 'root'
      mode: '0755'
      sudo: true
    @then @execute "rm -rf #{@server.java.jvm_dir}/#{@server.java.jdk_version}", sudo: true
    @then @execute "mv /tmp/#{dl.extracts_to}/ #{@server.java.jvm_dir}/#{@server.java.jdk_version}", sudo: true
    @then @chown "#{@server.java.jvm_dir}/#{@server.java.jdk_version}",
      recursive: true
      owner: 'root'
      group: 'root'
      mode: '0755'
      sudo: true

    @then @execute "update-alternatives --remove-all java", sudo: true, ignore_errors: true
    @then @execute "update-alternatives --install /usr/bin/java java '#{@server.java.jvm_dir}/#{@server.java.jdk_version}/bin/java' 1", sudo: true
    @then @execute "update-alternatives --remove-all javac", sudo: true, ignore_errors: true
    @then @execute "update-alternatives --install /usr/bin/javac javac '#{@server.java.jvm_dir}/#{@server.java.jdk_version}/bin/javac' 1", sudo: true

    # TODO: could list more jdk binaries
