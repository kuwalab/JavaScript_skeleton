module.exports = (grunt) ->
  grunt.initConfig
    pkg: grunt.file.readJSON('package.json')
    dirs:
      root: 'src/main/webapp',
      coffee: '<%= dirs.root %>/coffee',
      dev: '<%= dirs.root %>/jssrc',
      dest: '<%= dirs.root %>/js'

    browserify:
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

    karma:
      unit:
        configFile: 'karma.conf.coffee'
      options:
        client:
          mocha:
            ui: 'tdd'

    watch:
      scripts:
        files: ['**/*.coffee']
        tasks: ['default']
        options:
          interrupt: true
    clean: [
      '<%= dirs.root $>/js/**/*.js'
      '<%= dirs.root %>/jssrc/*'
    ]

  grunt.loadNpmTasks('grunt-contrib-clean')
  grunt.loadNpmTasks('grunt-contrib-uglify')
  grunt.loadNpmTasks('grunt-contrib-watch')
  grunt.loadNpmTasks('grunt-browserify')
  grunt.loadNpmTasks('grunt-karma')

  grunt.registerTask('default', ['browserify', 'uglify'])
