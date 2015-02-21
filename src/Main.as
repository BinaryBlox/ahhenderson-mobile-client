package
{
	import flash.display3D.Context3DProfile;
	
	import feathers.extension.ahhenderson.data.service.helpers.DS_Helper;
	import client.startup.mvc.view.screens.MobileRootScreen;
	
	import feathers.extension.ahhenderson.controls.core.FeathersApplication;
	import feathers.extension.ahhenderson.managers.dependency.themeManager.interfaces.IManagedTheme;
	import feathers.themes.MobileFlatTheme;
	
	
	[SWF(width="960",height="640",frameRate="60",backgroundColor="#4a4137")]
	public class Main extends FeathersApplication
	{
		public function Main()
		{
			
			// Enable/Disable MonsterDebugger
			super(true); 
			
		}
		
		override protected function rootScreen():Class{
			
			return MobileRootScreen; 
		}
		
		override protected function determineScreenResolution():void{
			
			// Leave empty for now
			//this.resolutionConfig.set(null, null, OSList.MAC); 
		}
		
		
		override protected function defaultTheme():IManagedTheme{
			
			return new MobileFlatTheme();  
		}  
		
		override protected function defaultConfiguration():void{
			
			// Note, many endpoints can be registered and accessed via id.
			DS_Helper.registerDefaultServiceConfiguration("Service-Stub-Id",
				"http://my-amf-service-stub");
			
			// Feathers/Starling specific
			_enableErrorChecking=false;
			_handleLostContext=true;
			_multitouchEnabled=true;
			_renderMode = "auto";
			_defaultProfile=Context3DProfile.BASELINE_EXTENDED;
			
			// Default splash images (Not using right now
			/*_splashImageNameDefault_Portrait_2x ="Default-Portrait@2x.png";
			_splashImageNameDefault_Landscape_2x ="Default-Landscape@2x.png";
			_splashImageNameDefault_Portrait ="Default-Portrait.png";
			_splashImageNameDefault_Landscape ="Default-Landscape.png";
			_splashImageNameDefault ="Default.png";
			_splashImageNameDefault_2x ="Default@2x.png";
			_splashImageNameDefault_568h_2x ="Default-568h@2x.png";*/
		}
		
	}
}