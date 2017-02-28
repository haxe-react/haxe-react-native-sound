package react.native.sound;

import react.native.sound.StreamType;

@:jsRequire('react-native-sound', 'default')
extern class Sound {
	public function new(filename:String, ?basePath:String, ?onError:OnError);
	function isLoaded():Bool; // Return true if the sound has been loaded.
	function play(?cb:OnEnd):Sound;
	function pause():Sound;
	function stop():Sound;
	function release():Sound;
	function getDuration():Int;
	function getNumberOfChannels():Int;
	function getVolume():Float; // 0.0 - 1.0
	function setVolume(vol:Float):Sound;
	function getPan():Float;
	function setPan(pan:Float):Sound; // -1.0 to 1.0
	function getNumberOfLoops():Int; 
	function setNumberOfLoops(times:Int):Sound; // loops > 0 can be used by ios only,
	function getCurrentTime(cb:Float->Bool->Void):Void; // (seconds, isPlaying)
	function setCurrentTime(time:Float):Sound;
	function prepare():Void;
	#if android
	function setAudioStreamType(type:StreamType):Sound;
	#end
	#if ios
	function setCategory(category:SoundCategory):Sound;
	#end
}

#if ios
@:enum abstract SoundCategory(String) {
	var Ambient = "Ambient";
	var SoloAmbient = "SoloAmbient";
	var Playback = "Playback";
	var Record = "Record";
	var PlayAndRecord = "PlayAndRecord";
	var AudioProcessing = "AudioProcessing";
	var MultiRoute = "MultiRoute";
}
#end

typedef SoundProps = {
	duration:Int,
	numberOfChannels:Int,
}
typedef SoundError = Dynamic;

typedef OnError = SoundError->SoundProps->Void;
typedef OnEnd = Dynamic->Void;