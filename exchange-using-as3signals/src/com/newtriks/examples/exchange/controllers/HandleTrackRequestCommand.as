/** @author: Simon Bailey <simon@newtriks.com> */
package com.newtriks.examples.exchange.controllers
{
import com.newtriks.examples.exchange.signals.TrackResponseSignal;

import org.robotlegs.mvcs.SignalCommand;

public class HandleTrackRequestCommand extends SignalCommand
{
    [Inject]
    public var trackResponseSignal:TrackResponseSignal;

    override public function execute():void
    {
        trackResponseSignal.dispatch(randomTrack);
    }

    protected function get randomTrack():String
    {
        const TRACKS:Array=["Go Cut Creator Go",
                            "Teepee On A Highway Blues",
                            "Pants On Fire",
                            "Out Of Range"];
        return TRACKS[int(Math.random() * TRACKS.length)];
    }
}
}