package client.startup.mvc.view.mediators
{
	import ahhenderson.core.mvc.interfaces.IFacadeMessage;
	
	import avmplus.getQualifiedClassName;
	
	import client.startup.mvc.view.screens.MobileRoot;
	import client.startup.mvc.view.supportClasses.AbstractRootMediator;
	
	public class MobileRootMediator extends AbstractRootMediator
	{
		public static const NAME:String = getQualifiedClassName( MobileRootMediator );
		
		public function MobileRootMediator(component:MobileRoot=null)
		{
			super(NAME, component);
		}
		 
		override public function handleFacadeMessage(message:IFacadeMessage):void{
			
			switch(message.messageId){
				
				default:
					break;
			}
		}
		
		override public function onRegister():void {
			
			try {
				super.onRegister();
				
				startup();
				
				// Show screen after data comes back
				
			} catch ( error:Error ) {
				throw( error );
			}
		}
		
		
		private function get view():MobileRoot {
			
			return component as MobileRoot;
		}
	}
}