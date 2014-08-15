path = require 'path'

module.exports = ->
  @unless "which ant", =>
    dl = @server.java.ant.download
    file = path.basename dl.url
    @then @download, dl.url,
      to: "/tmp/#{file}"
      checksum: @server.java.ant.download.checksum
      owner: 'root'
      group: 'root'
      mode: '0644'

    @then @execute, "cd /tmp; tar zxvf #{file}"
    @then @execute, "rm -rf #{@server.java.ant.install_dir}", sudo: true
    @then @execute, "mv /tmp/#{dl.extracts_to}/ #{@server.java.ant.install_dir}", sudo: true

    @then @setEnv, 'ANT_HOME', value: @server.java.ant.install_dir
    @then @link, "#{@server.java.ant.install_dir}/bin/ant", target: "/usr/local/bin/ant", sudo: true

    @then (cb) => @execute "ant -version", @mustExit 0, cb
