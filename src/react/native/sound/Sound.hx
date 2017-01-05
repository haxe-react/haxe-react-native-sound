package react.native.sound;

@:jsRequire('react-native-sound')
extern class Sound {
	public function new(filename:String, ?basePath:String, ?onError:OnError);
	function isLoaded():Bool; // Return true if the sound has been loaded.
	function play(?cb:OnEnd):Void;
	function pause():Void;
	function stop():Void;
	function release():Void;
	function getDuration():Int;
	function getNumberOfChannels():Int;
	function getVolume():Float; // 0.0 - 1.0
	function setVolume(vol:Float):Void;
	function getPan():Void;
	function setPan(pan:Float):Void; // -1.0 to 1.0
	function getNumberOfLoops():Void; 
	function setNumberOfLoops(times:Int):Void; // loops > 0 can be used by ios only,
	function getCurrentTime(cb:Float->Bool->Void):Void; // (seconds, isPlaying)
	function setCurrentTime(time:Float):Void;
	#if ios
	function setCategory(category:SoundCategory):Void;
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