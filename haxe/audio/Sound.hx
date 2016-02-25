package audio;

import _internal.sfml.audio.Sound in SFMLSound;
import _internal.sfml.audio.SoundBuffer.SoundBufferPtr;
import system.Time;

class Sound extends SoundSource {
    
    /**
    * Set the source buffer containing the audio data to play.
    * 
    * It is important to note that the sound buffer is not copied, thus the `SoundBuffer`
    * instance must remain alive as long as it is attached to the sound.
    */
    public var buffer(get, set):SoundBuffer;
    
    /**
    * Set whether or not the sound should loop after reaching the end.
    *
    * If set, the sound will restart from beginning after reaching the end and so on, 
    * until it is stopped or setLoop(false) is called. The default looping state for sound is false.
    */
    public var loop(get, set):Bool;
    
    /**
    * Change the current playing position of the sound.
    * 
    * The playing position can be changed when the sound is either paused or playing. Changing the playing 
    * position when the sound is stopped has no effect, since playing the sound will reset its position.
    */
    public var playingOffset(get, set):Time;
    
    /**
    * Get the current status of the sound (stopped, paused, playing).
    */
    public var status(get, null):Int;
    
    /**
    * Regular sound that can be played in the audio environment.
    *
    * Sound is the class to use to play sounds.
    *
    * It provides:
    * 
    *   1. Control (play, pause, stop)
    *   2. Ability to modify output parameters in real-time (pitch, volume, ...)
    *   3. 3D spatial features (position, attenuation, ...).
    *
    * Sound is perfect for playing short sounds that can fit in memory and require no 
    * latency, like foot steps or gun shots. For longer sounds, like background musics or 
    * long speeches, rather see Music (which is based on streaming).
    *
    * In order to work, a sound must be given a buffer of audio data to play. Audio data (samples) 
    * is stored in SoundBuffer, and attached to a sound with the setBuffer() function. The buffer 
    * object attached to a sound must remain alive as long as the sound uses it. Note that multiple 
    * sounds can use the same sound buffer at the same time.
    */
    public function new()
    {
        super();
        
        _ref = cast SFMLSound.createInstance();
    }
    
    /**
    * Start or resume playing the sound.
    * 
    * This function starts the stream if it was stopped, resumes it if it was paused, and restarts 
    * it from beginning if it was it already playing. This function uses its own thread so that it 
    * doesn't block the rest of the program while the sound is played.
    */
    public function play():Void
    {
        castRef().play();
    }
    
    /**
    * Pause the sound.
    * 
    * This function pauses the sound if it was playing, otherwise (sound already paused or stopped) it 
    * has no effect.
    */
    public function pause():Void
    {
        castRef().pause();
    }
    
    /**
    * Stop playing the sound
    * 
    * This function stops the sound if it was playing or paused, and does nothing if it was already 
    * stopped. It also resets the playing position (unlike pause()).
    */
    public function stop():Void
    {
        castRef().stop();
    }
    
    /**
    * Reset the internal buffer of the sound.
    * 
    * This function is for internal use only, you don't have to use it. It is called by the SoundBuffer 
    * that this sound uses, when it is destroyed in order to prevent the sound from using a dead buffer.
    */
    public function resetBuffer():Void
    {
        castRef().resetBuffer();
    }
    
    @:access(SoundBuffer)
    private function set_buffer(buffer:SoundBuffer):Void
    {
        castRef().setBuffer(buffer._constRef);
    }
    
    private function set_loop(loop:Bool):Void
    {
        castRef().setLoop(loop);
    }
    
    @:access(system.Time)
    private function set_playingOffset(time:Time):Void
    {
        castRef().setPlayingOffset(time._ref);
    }
    
    @:access(SoundBuffer)
    private function get_buffer():SoundBuffer
    {
        var sb = new SoundBuffer();
        var sbptr:SoundBufferPtr = SFMLSound.getBuffer();
        sb._ref = cast sbptr;
        return sbptr;
    }
    
    private function get_loop():Bool
    {
        return castRef().getLoop();
    }
    
    private function get_playingOffset():Time
    {
        var time = new Time();
        time._ref = cast castRef().getPlayingOffset();
        return time;
    }
    
    private function get_status():Int
    {
        return castRef().getStatus();
    }
    
    private override function castRef():Sound return cast _ref;
}