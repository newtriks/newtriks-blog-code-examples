package
{
import asunit.core.TextCore;

import flash.display.MovieClip;

public class ASUnit4Runner extends MovieClip
{
    protected var core:TextCore;

    public function ASUnit4Runner()
    {
        core=new TextCore();
        core.start(AllTests, null, this);
    }
}
}

