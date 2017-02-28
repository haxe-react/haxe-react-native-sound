package react.native.sound;

@:jsRequire('react-native-sound', 'default.STREAM_TYPE')
@:enum extern abstract StreamType(String) {
	var STREAM_ALARM;
	var STREAM_DTMF;
	var STREAM_MUSIC;
	var STREAM_NOTIFICATION;
	var STREAM_RING;
	var STREAM_SYSTEM;
	var STREAM_VOICE_CALL;
	var USE_DEFAULT_STREAM_TYPE;
}
