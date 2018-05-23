
flags = [
	"-x", "c",
	"-std=gnu11",
]

def FlagsForFile( filename, **kwargs ):
	return { 'flags': flags, 'do_cache': True }
