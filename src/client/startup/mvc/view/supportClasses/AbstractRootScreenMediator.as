
package client.startup.mvc.view.supportClasses {

	import ahhenderson.core.mvc.interfaces.IFacadeMessage;
	import avmplus.getQualifiedClassName;
	import client.constants.Client_NotificationConstants;
	import feathers.extension.ahhenderson.data.service.mvc.actor.DataServiceMediator;


	public class AbstractRootScreenMediator extends DataServiceMediator {

		public static const NAME:String = getQualifiedClassName( AbstractRootScreenMediator );

		public function AbstractRootScreenMediator( name:String = null, component:* = null ) {

			if ( !name )
				name = NAME;

			super( name, component );
		}

		override public function handleFacadeMessage( message:IFacadeMessage ):void {

			switch ( message.messageId ) {

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

		protected function startup():void {

			// Call Startup command
			this.sendFacadeMessage( Client_NotificationConstants.N_CMD_STARTUP );

		}

		private function get view():AbstractRootScreen {

			return component as AbstractRootScreen;
		}
	}
}

