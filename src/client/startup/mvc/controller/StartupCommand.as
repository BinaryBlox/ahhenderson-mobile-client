package client.startup.mvc.controller
{
	import ahhenderson.core.mvc.interfaces.IFacadeMessage;
	import ahhenderson.core.mvc.patterns.facade.GlobalFacade;
	
	import avmplus.getQualifiedClassName;
	
	import client.project.mvc.model.ProjectModel;
	import feathers.extension.ahhenderson.data.service.helpers.DataServiceFacadeHelper;
	import feathers.extension.ahhenderson.data.service.managers.DataServiceManager;
	import feathers.extension.ahhenderson.data.service.mvc.actor.DataServiceCommand;
	
	public class StartupCommand extends DataServiceCommand
	{
		
		public static const NAME:String =  getQualifiedClassName(StartupCommand);
		
		private var _facade:GlobalFacade = GlobalFacade.instance;
		
		public function StartupCommand(name:String=null)
		{
			if(!name)
				name = NAME;
			
			super(name);
		}
		
		override public function executeCommand(message:IFacadeMessage):void{
			
			// Register commands
			registerCommands();
			
			// Register models
			registerModels();
			 
			// Initialize ServiceAPI manager
			DataServiceManager.instance.initialize(); 
		}
		
		protected function registerCommands():void{
			
			 // Register commands 
		}
		
		protected function registerModels():void{
			
			DataServiceFacadeHelper.registerModel(new ProjectModel(), null);
		}
		  
		override public function onRegister():void{
			
			super.onRegister();
			
			try {
				 
				
			} catch ( error:Error ) {
				throw( error );
			}
		}
		 
	}
}