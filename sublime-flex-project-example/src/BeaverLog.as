package {
import com.newtriks.logging.core.BeaverTrunk;

import mx.core.FlexGlobals;

public class BeaverLog {

    private static var trunk:BeaverTrunk = new BeaverTrunk("_123456", FlexGlobals.topLevelApplication);

    public static function send(message:String, sender:Object, level:int = 4):void {
        trunk.saveNewLog(message, sender, level);
    }
}
}