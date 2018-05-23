
flags = [
	"-x", "c++",
	"-std=gnu++17",
]

def FlagsForFile( filename, **kwargs ):
	return { 'flags': flags, 'do_cache': True }
