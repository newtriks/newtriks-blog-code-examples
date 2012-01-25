/**
 * User: newtriks
 * Date: 12/01/2012
 */
package com.newtriks.examples.exchange.controllers
{
import asunit.asserts.fail;
import asunit.framework.IAsync;

import com.newtriks.examples.exchange.signals.TrackResponseSignal;

import flash.events.Event;
import flash.events.IEventDispatcher;

import mockolate.nice;
import mockolate.prepare;
import mockolate.received;

import org.hamcrest.assertThat;

use namespace fail;

public class HandleTrackRequestCommandTest
{
    [Inject]
    public var async:IAsync;

    public var instance:HandleTrackRequestCommand;

    [Before]
    public function prepareMockolates():void
    {
        var mockolateMaker:IEventDispatcher=prepare(TrackResponseSignal);
        async.proceedOnEvent(mockolateMaker, Event.COMPLETE, 100);
    }

    [Before]
    public function setUp():void
    {
        instance=new HandleTrackRequestCommand();
        instance.trackResponseSignal=nice(TrackResponseSignal);
    }

    [After]
    public function tearDown():void
    {
        instance=null;
    }

    [Test]
    public function should_dispatch_TrackResponseSignal_on_execute():void
    {
        instance.execute();
        assertThat(instance.trackResponseSignal, received().method('dispatch'));
    }
}
}
