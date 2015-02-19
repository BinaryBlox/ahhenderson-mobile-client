package client.constants
{
	import feathers.extension.ahhenderson.managers.FeathersApplicationManager;

	public class Client_ThemeConstants
	{
		public function Client_ThemeConstants()
		{
		}
		
		private static var _fmgr:FeathersApplicationManager;
		
		public static var CONTROL_GUTTER:Number = 10 * fmgr.theme.scaledResolution;
		
		public static var PANEL_GUTTER:Number = 20 * fmgr.theme.scaledResolution;
		
		private static function get fmgr():FeathersApplicationManager
		{
			if(!_fmgr)
				_fmgr = FeathersApplicationManager.instance;
			
			return _fmgr;
		}

	}
}