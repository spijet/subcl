
class Mpc
	attr_accessor :debug

	def initialize
		@debug = false
	end

	def mpccall(cmd, quiet = true)
		call = "mpc #{cmd}"
		call << " > /dev/null" if quiet

		unless system(call)
			$stderr.puts "MPC call error: #{$?}"
		end

	end

	def add(url)
		if @debug
			puts "would add #{url}"
		else
			mpccall("add '#{url}'")
		end
	end

	def play
		if @debug
			puts "would play"
		else
			mpccall("play")
		end
	end

	#stops the player and clears the playlist
	def clear
		if @debug
			puts "would clear"
		else
			mpccall("stop")
			mpccall("clear")
		end
	end

	#returns the streaming url of the currently playing file
	def current
		`mpc --format '%file%' current`
	end

	#TODO use method_missing for clear, play and everything that will come
end
