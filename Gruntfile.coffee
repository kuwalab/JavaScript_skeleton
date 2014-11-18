module.exports = (grunt) ->
  grunt.initConfig
    pkg: grunt.file.readJSON('package.json')
    dirs:
      root: 'src/main/webapp',
      coffee: '<%= dirs.root %>/coffee',
      dev: '<%= dirs.root %>/jssrc',
      dest: '<%= dirs.root %>/js'

    browserify:
      client:
        src: ['<%= dirs.dev %>/bar.js']
        dest: '<%= dirs.dev %>/sample.coffee'
      coffee:
        files:
          '<%= dirs.dev %>/sample.js': ['<%= dirs.coffee %>/*.coffee']
      options:
        transform: ['coffeeify']
        browserifyOptions:
          extensions: ['.coffee']

    uglify:
      my_target:
        options:
          preserveComments: 'some' # /*!で始まるコメントを消さない
          sourceMap: true
          sourceMapName: '<%= dirs.dev %>/sample.map'
        files:
          '<%= dirs.dest %>/sample.min.js': ['<%= dirs.dev %>/sample.js']
    watch:
      scripts:
        files: ['**/*.coffee']
        tasks: ['default']
        options:
          interrupt: true

  grunt.loadNpmTasks('grunt-contrib-watch')
  grunt.loadNpmTasks('grunt-contrib-uglify')
  grunt.loadNpmTasks('grunt-browserify');

  grunt.registerTask('default', ['browserify', 'uglify'])
