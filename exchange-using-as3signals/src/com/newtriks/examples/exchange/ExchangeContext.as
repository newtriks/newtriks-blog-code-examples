/** @author: Simon Bailey <simon@newtriks.com> */
package com.newtriks.examples.exchange
{
import com.newtriks.examples.exchange.controllers.HandleTrackRequestCommand;
import com.newtriks.examples.exchange.signals.TrackRequestSignal;
import com.newtriks.examples.exchange.views.components.ExchangeView;
import com.newtriks.examples.exchange.views.mediators.ExchangeViewMediator;

import flash.display.DisplayObjectContainer;

import org.robotlegs.mvcs.Context;
import org.robotlegs.mvcs.SignalContext;

public class ExchangeContext extends SignalContext
{
    override public function startup():void
    {
        signalCommandMap.mapSignalClass(TrackRequestSignal, HandleTrackRequestCommand);
        mediatorMap.mapView(ExchangeView, ExchangeViewMediator);
    }
}
}