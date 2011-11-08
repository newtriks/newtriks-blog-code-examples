﻿/*Nutrix - RemoteAccess class- Class to connect to database using flash remoting ....	Author: NewtriksDate: 02 May 2007*/// Importsimport mx.events.EventDispatcher;import mx.remoting.debug.NetDebug;import mx.remoting.PendingCall;import mx.remoting.Service;import mx.rpc.RelayResponder;import mx.rpc.ResultEvent;import mx.rpc.FaultEvent;import mx.remoting.RecordSet;import mx.utils.Delegate;// Define classclass RemoteAccess extends MovieClip {		//Declare Variables		// Flash services gateway url	private static var GATEWAYURL:String = "http://localhost:8101/cfusion/flashservices/gateway";	// Path to cfc	private static var CFCURL:String = "flashmac_remoting.remoteMac_data";			private var inst:Service;	private var initialized:Boolean;	private var _remote_mc:MovieClip;	private var display_mc:MovieClip;		public var dispatchEvent:Function;	public var addEventListener:Function;	public var removeEventListener:Function;	// Constructor		public function RemoteAccess() 	{				// Call methods from MovieClip		super();				// Not yet set up visual interface		initialized = false;				// Initialize the eventDispatcher		EventDispatcher.initialize (this);				// Call the init() method		this.init();			}		// initializes the display	private function init():Void 	{				if( !initialized ) 		{			// Build visual interface						// Create an empty MovieClip object with the instance name '_remote_mc'			this._remote_mc = this.createEmptyMovieClip("_remote_mc", this.getNextHighestDepth());				// Attach an instance of 'display_mc'			display_mc = this._remote_mc.attachMovie			("display_mc", "display_mc", this._remote_mc.getNextHighestDepth());				// Position the display MovieClip in centre of stage			display_mc._x = (Stage.width/2)-91;			display_mc._y = (Stage.height/2)-91;			// Display content is loading in status text field			display_mc.status_txt.text = "Calling Service... ";						// All set up, set initialized to true			initialized = true;						// 			loadUserDetails();		}	}		private function getInstance():Service		{								// Initialize the NetDebug, comment out when not testing!			//NetDebug.initialize();									// Return reference to singleton instance			if ( inst == null )			{				// create a single instance of the singleton				inst = new Service ( GATEWAYURL, null, CFCURL, null, null);			}						return inst;		}		public function loadUserDetails():Void 	{				// Create new instance of the remoting service		var service = getInstance();				var pc:PendingCall = service.db_access();		pc.responder = new RelayResponder( this, "respond_Result", "respond_Fault" );			}	// handles the results from the request to getCustomers() method of the service	private function respond_Result( re:ResultEvent ):Void 	{				// Clear status text field		display_mc.status_txt.text = "";		// We now have a recordset of data from the database.		var rs:RecordSet = RecordSet(re.result);		var cnames = rs.getColumnNames();				// Dispatch event if anyone wants the data		dispatchEvent ({ type:"onResult", target:this, rs_data:rs });				for( var i=0; i<rs.items.length; i++) 		{			// Loop thru records and assign each one to a record variable			var record = rs.getItemAt(i); 						/* We only have one value and so we can display the single			 * values in text fields.  To display more values i.e. more			 * than one user, use one of the following components e.g.			 * DataGrid, ListBox, TextArea ...			 */						// Column 0 is id			// Column 1 is username			// Column 2 is password			display_mc.username_txt.text = record[cnames[1]];			display_mc.password_txt.text = record[cnames[2]];					}	}		// Display any faults with our data request db_access() in the status txt field	private function respond_Fault( fault:FaultEvent ):Void 	{				display_mc.status_txt.text = '';		display_mc.status_txt.text =  "Problem with call: " ;		display_mc.status_txt.text = "Error returned: " + fault.fault.faultstring;			}}