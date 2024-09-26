extends AudioStreamPlayer

const MENU_MUSIC = preload("res://Music/Kevin MacLeod - Itty Bitty 8 Bit.mp3")
const LEVEL_MUSIC = preload("res://Music/Eric Skiff - Underclocked (underunderclocked mix).mp3")

func _play_music(music: AudioStream, volume = 0.0):
	if stream == music:
		return
	stream = music
	volume_db = volume
	play()

func playMenuMusic():
	_play_music(MENU_MUSIC)

func playLevelMusic():
	_play_music(LEVEL_MUSIC)
