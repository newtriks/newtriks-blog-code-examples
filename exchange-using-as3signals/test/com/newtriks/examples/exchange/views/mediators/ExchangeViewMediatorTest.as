/**
 * User: newtriks
 * Date: 12/01/2012
 */
package com.newtriks.examples.exchange.views.mediators
{
import asunit.asserts.fail;
import asunit.framework.IAsync;

import com.newtriks.examples.exchange.signals.TrackRequestSignal;
import com.newtriks.examples.exchange.signals.TrackResponseSignal;
import com.newtriks.examples.exchange.views.components.ExchangeView;

import flash.display.Sprite;
import flash.events.Event;
import flash.events.IEventDispatcher;

import mockolate.nice;
import mockolate.prepare;
import mockolate.received;
import mockolate.stub;

import org.hamcrest.assertThat;

public class ExchangeViewMediatorTest
{
    [Inject]
    public var async:IAsync;
    [Inject]
    public var context:Sprite;

    public var instance:ExchangeViewMediator;

    [Before]
    public function prepareMockolates():void
    {
        var mockolateMaker:IEventDispatcher=prepare(TrackRequestSignal);
        async.proceedOnEvent(mockolateMaker, Event.COMPLETE, 3000);
    }

    [Before]
    public function setUp():void
    {
        instance=new ExchangeViewMediator();
        instance.view=new ExchangeView();
        instance.setViewComponent(instance.view);
        instance.trackRequestSignal=nice(TrackRequestSignal);
        instance.onRegister();
    }

    [After]
    public function tearDown():void
    {
        instance=null;
    }

    [Test]
    public function should_dispatch_TrackRequestSignal_on_trigger():void
    {
        stub(instance.trackRequestSignal).method("createResponse").returns(new TrackResponseSignal());
        instance.submitTrackRequest();
        assertThat(instance.trackRequestSignal, received().method('dispatch'));
    }
}
}
