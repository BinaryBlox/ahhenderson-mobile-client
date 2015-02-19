package client.project.mvc.model {

	import ahhenderson.core.mvc.interfaces.IFacadeMessage;
	import ahhenderson.core.mvc.interfaces.IModelActor;
	
	import avmplus.getQualifiedClassName;
	
	import feathers.extension.ahhenderson.data.service.mvc.actor.DataServiceModel;


	public class ProjectModel extends DataServiceModel implements IModelActor{

		public static const NAME:String = getQualifiedClassName( ProjectModel );

		public function ProjectModel( name:String = null ) {

			if ( !name )
				name = NAME;

			super( name );
		}

		public function get someData():String
		{
			return _someData;
		}

		public function set someData(value:String):void
		{
			_someData = value;
		}

		override public function handleFacadeMessage(message:IFacadeMessage):void{
			
			switch ( message.messageId ) {
				
				default:
					break;
				
			}
		}
		
		private var _someData:String;
		
		
		 
	}
}
