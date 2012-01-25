/** @author: Simon Bailey <simon@newtriks.com> */
package com.newtriks.examples.exchange.signals
{
import org.osflash.signals.Signal;
import org.swiftsuspenders.Injector;

public class TrackRequestSignal extends Signal
{
    public function TrackRequestSignal()
    {
        super(TrackResponseSignal);
    }

    public function createResponse():TrackResponseSignal
    {
        return new TrackResponseSignal();
    }
}
}