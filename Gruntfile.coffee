module.exports = (grunt) ->

	grunt.config.init

		coffee:

			compile:
				files:
					'transform-to-matrix.js': 'transform-to-matrix.coffee'

		uglify:

			options:
				mangle:
					toplevel: true
				compress:
					dead_code: true
					unused: true
					join_vars: true
				comments: false

			standard:
				files:
					'transform-to-matrix.min.js': [
						'transform-to-matrix.js'
					]


	grunt.loadNpmTasks 'grunt-contrib-coffee'
	grunt.loadNpmTasks 'grunt-contrib-uglify'

	grunt.registerTask 'default', ['coffee', 'uglify']