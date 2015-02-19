
package client.project.mvc.view.mediators.screens {

	import ahhenderson.core.mvc.interfaces.IFacadeMessage;
	import ahhenderson.core.mvc.interfaces.IMediatorActor;
	import ahhenderson.core.ui.enums.LayoutDirectionType;
	
	import avmplus.getQualifiedClassName;
	
	import client.project.mvc.model.ProjectModel;
	import client.project.mvc.view.screens.HelloWorldScreen;
	import feathers.extension.ahhenderson.data.service.mvc.actor.DataServiceMediator;
	
	import feathers.extension.ahhenderson.helpers.DialogHelper;
	
	import starling.events.Event;


	public class HelloWorldScreenMediator extends DataServiceMediator implements IMediatorActor {

		public static const NAME:String = getQualifiedClassName(HelloWorldScreenMediator);

		public function HelloWorldScreenMediator( component:HelloWorldScreen = null ) {

			super( NAME, component );
		}

		 
		private var _model:ProjectModel;
		 
		override public function handleFacadeMessage( message:IFacadeMessage ):void {
			switch ( message.messageId ) {
				
			}
			 
		}
 
		override public function beforeRemove():void {

			super.beforeRemove();

			removeHandlers();
		}
		 
		override public function onRegister():void {
  
			
			super.onRegister();
			 
			_model = this.fmgr.facade.getModel(ProjectModel.NAME) as ProjectModel;
			_model.someData = "Hello World some data from the Model";
			
			addHandlers();
			
			showControls();  
			
		}
		
		private var _isHeaderVisible:Boolean;
		
		private function showControls():void{
			
			view.btnToggleHeader.visible = true;
			view.btnToggleLeftMenu.visible = true;
			view.btnToggleLoading.visible = true;
			view.btnHelloWorld.visible = true;
		}
		
 
		private function addHandlers():void {

			 view.btnToggleHeader.addEventListener( Event.TRIGGERED, onButtonTriggered );
			 view.btnToggleLeftMenu.addEventListener( Event.TRIGGERED, onButtonTriggered );
			 view.btnToggleLoading.addEventListener( Event.TRIGGERED, onButtonTriggered );
			 view.btnHelloWorld.addEventListener( Event.TRIGGERED, onButtonTriggered );
		}
 
		private function onButtonTriggered( event:Event ):void {
 
			switch ( event.target ) {

				case view.btnHelloWorld: 
					DialogHelper.showAlert("Hello World", _model.someData); 
					break;

				case view.btnToggleHeader:
					 
					this.fmgr.navigation.toggleHeaderVisibility(_isHeaderVisible);
					
					_isHeaderVisible = (_isHeaderVisible) ? false : true; 
					 
					break;
				
				case view.btnToggleLeftMenu:
					this.fmgr.navigation.toggleDrawer(LayoutDirectionType.LEFT);
					
					break;
				
				case view.btnToggleLoading:
					DialogHelper.showLoadingDialog("Loading message in modal mode(Optional Icon)..", "Loading Title", 3);
					
					break;
 
			}
		}

		private function removeHandlers():void {

			view.btnHelloWorld.removeEventListener( Event.TRIGGERED, onButtonTriggered );
			view.btnToggleHeader.removeEventListener( Event.TRIGGERED, onButtonTriggered );
			view.btnToggleLeftMenu.removeEventListener( Event.TRIGGERED, onButtonTriggered );
			view.btnToggleLoading.removeEventListener( Event.TRIGGERED, onButtonTriggered );
		}

		private function get view():HelloWorldScreen {

			return component as HelloWorldScreen;
		}
	}
}
