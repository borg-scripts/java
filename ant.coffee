path = require 'path'

module.exports = ->
  @then @execute "which ant", test: ({code}) =>
    return if code is 0
    dl = @server.java.ant.download
    file = path.basename dl.url

    @then @download dl.url,
      to: "/tmp/#{file}"
      checksum: @server.java.ant.download.checksum
      owner: 'root'
      group: 'root'
      mode: '0644'
      sudo: true

    @then @execute "cd /tmp; tar zxvf #{file}"
    @then @execute "rm -rf #{@server.java.ant.install_dir}", sudo: true
    @then @execute "mv /tmp/#{dl.extracts_to}/ #{@server.java.ant.install_dir}", sudo: true

    @then @append_line_to_file '/etc/environment',
      unless_find: 'ANT_HOME'
      append: 'ANT_HOME='+@server.java.ant.install_dir
      sudo: true

    @then @link "#{@server.java.ant.install_dir}/bin/ant", target: "/usr/local/bin/ant", sudo: true

    @then @execute "ant -version", expect: 0
