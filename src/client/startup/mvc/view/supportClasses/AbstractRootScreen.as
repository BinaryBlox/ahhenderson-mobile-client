package client.startup.mvc.view.supportClasses

{

	import flash.net.registerClassAlias;
	
	import mx.collections.ArrayCollection;
	import mx.collections.ArrayList;
	import mx.messaging.config.ConfigMap;
	import mx.messaging.messages.AcknowledgeMessage;
	import mx.messaging.messages.AcknowledgeMessageExt;
	import mx.messaging.messages.CommandMessage;
	import mx.messaging.messages.CommandMessageExt;
	import mx.messaging.messages.ErrorMessage;
	import mx.messaging.messages.RemotingMessage;
	import mx.utils.ObjectProxy;
	import mx.utils.RpcClassAliasInitializer;
	
	import ahhenderson.core.managers.FacadeServiceManager;
	import ahhenderson.core.mvc.patterns.facade.FacadeMessageFilter;
	
	import client.constants.Client_NotificationConstants;
	import feathers.extension.ahhenderson.data.service.helpers.DS_FacadeHelper;
	import client.startup.mvc.controller.StartupCommand;
	
	import feathers.extension.ahhenderson.controls.core.FeathersRootScreen;
 

	public class AbstractRootScreen extends FeathersRootScreen {
		public function AbstractRootScreen() {

			super(); 

		} 
 
		override protected function registerClassAliases():void {

			 
			// Flex
			registerClassAlias( "flex.messaging.messages.RemotingMessage", RemotingMessage );
			registerClassAlias( "flex.messaging.messages.RemotingMessage", RemotingMessage );
			registerClassAlias( "flex.messaging.messages.CommandMessage", CommandMessage );
			registerClassAlias( "flex.messaging.messages.AcknowledgeMessage", AcknowledgeMessage );
			registerClassAlias( "flex.messaging.messages.ErrorMessage", ErrorMessage );
			registerClassAlias( "DSC", CommandMessageExt );
			registerClassAlias( "DSK", AcknowledgeMessageExt );
			registerClassAlias( "flex.messaging.io.ArrayList", ArrayList );
			registerClassAlias( "flex.messaging.config.ConfigMap", ConfigMap );
			registerClassAlias( "flex.messaging.io.ArrayCollection", ArrayCollection );
			registerClassAlias( "flex.messaging.io.ObjectProxy", ObjectProxy );
			
			// Pub/Sub RPC
			registerClassAlias( "flex.messaging.io.ArrayList", ArrayList );
			registerClassAlias( "flex.messaging.config.ConfigMap", ConfigMap );
			registerClassAlias( "flex.messaging.io.ArrayCollection", ArrayCollection );
			registerClassAlias( "flex.messaging.io.ObjectProxy", ObjectProxy );
			RpcClassAliasInitializer.registerClassAliases();
			
			 
			
			// Scope instance
			FacadeServiceManager;
			
		}
 
		override protected function registerStartupCommand():void{
			
			
			// Register using API helper since mediator is of type API_Mediator 
			DS_FacadeHelper.registerCommand(new StartupCommand(Client_NotificationConstants.N_CMD_STARTUP));
		}
		
		override protected function registerRootMediator():void {
			
			this.registerMediator(new AbstractRootScreenMediator(null, this), 
				new FacadeMessageFilter([Client_NotificationConstants.NGRP_CLIENT_GLOBAL]));
		}
 
	}
}
