/** @author: Simon Bailey <simon@newtriks.com> */
package com.newtriks.examples.exchange.views.mediators
{
import com.newtriks.examples.exchange.signals.TrackRequestSignal;
import com.newtriks.examples.exchange.signals.TrackResponseSignal;
import com.newtriks.examples.exchange.views.components.ExchangeView;

import org.robotlegs.mvcs.Mediator;

public class ExchangeViewMediator extends Mediator
{
    [Inject]
    public var view:ExchangeView;
    [Inject]
    public var trackRequestSignal:TrackRequestSignal;

    override public function onRegister():void
    {
        view.submitTrackRequestSignal.add(submitTrackRequest);
    }

    /**
     * Signal handlers
     */
    public function submitTrackRequest():void
    {
        var response:TrackResponseSignal=trackRequestSignal.createResponse();
        response.addOnce(trackResponse);
        trackRequestSignal.dispatch(response);
    }

    public function trackResponse(track:String):void
    {
        view.trackRequest_txt.text=track;
    }
}
}