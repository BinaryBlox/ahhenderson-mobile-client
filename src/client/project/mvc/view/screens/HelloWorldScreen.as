
package client.project.mvc.view.screens {

	import client.project.mvc.view.mediators.screens.HelloWorldScreenMediator;
	
	import feathers.controls.Button;
	import feathers.extension.ahhenderson.constants.FeathersExtLib_ThemeConstants;
	import feathers.extension.ahhenderson.controls.screens.LayoutGroupScreen;
	import feathers.extension.ahhenderson.enums.FeathersComponentPoolType;
	import feathers.extension.ahhenderson.helpers.AssetHelper;
	import feathers.extension.ahhenderson.themes.constants.FlatThemeCustomTextures;
	import feathers.layout.HorizontalLayout;
	import feathers.layout.VerticalLayout;
	
	import starling.events.Event;


	public class HelloWorldScreen extends LayoutGroupScreen {

		public function HelloWorldScreen() {
		}

		public var btnToggleHeader:Button;

		public var btnHelloWorld:Button;
		
		public var btnToggleLeftMenu:Button;
		
		public var btnToggleLoading:Button;

		override protected function onScreenTransitionComplete( event:Event ):void {

			super.onScreenTransitionComplete( event );

			this.registerMediator( new HelloWorldScreenMediator(), null );

		}

		override protected function draw():void {

			super.draw();

		 	// layout here
			 

		}
 
		
		override protected function initialize():void {

			super.initialize();

			// Hide header
			this.fmgr.navigation.updateHeaderTitle("Hello World Project");
			this.fmgr.navigation.toggleHeaderVisibility(true);
			
			this.layout = new VerticalLayout();
			(this.layout as VerticalLayout).horizontalAlign = HorizontalLayout.HORIZONTAL_ALIGN_CENTER;
			(this.layout as VerticalLayout).verticalAlign = HorizontalLayout.VERTICAL_ALIGN_MIDDLE;
			(this.layout as VerticalLayout).gap = FeathersExtLib_ThemeConstants.CONTROL_GUTTER;
			
			// Hello World
			btnHelloWorld = fmgr.pool.borrowObj( FeathersComponentPoolType.BUTTON );

			btnHelloWorld.visible = false;
			btnHelloWorld.styleNameList.add( Button.ALTERNATE_NAME_CALL_TO_ACTION_BUTTON ); 
			btnHelloWorld.label = "Hello World";

			addChild( btnHelloWorld );

			// Toggler Header
			btnToggleHeader = fmgr.pool.borrowObj( FeathersComponentPoolType.BUTTON ); 
			btnToggleHeader.visible = false;
			btnToggleHeader.label = "Toggle Header"; 
			btnToggleHeader.defaultIcon = AssetHelper.getImage(FlatThemeCustomTextures.ICONS_BUTTON_LAYOUTS); 

			addChild( btnToggleHeader );
			
			// Toggler Left menu
			btnToggleLeftMenu = fmgr.pool.borrowObj( FeathersComponentPoolType.BUTTON ); 
			btnToggleLeftMenu.styleNameList.add( Button.ALTERNATE_NAME_DANGER_BUTTON ); 
			btnToggleLeftMenu.visible = false;
			btnToggleLeftMenu.label = "Toggle Menu"; 
			btnToggleLeftMenu.defaultIcon = AssetHelper.getImage(FlatThemeCustomTextures.ICONS_BUTTON_DETAIL); 
			
			addChild( btnToggleLeftMenu );
			
			// Toggler Left menu
			btnToggleLoading = fmgr.pool.borrowObj( FeathersComponentPoolType.BUTTON ); 
			btnToggleLoading.styleNameList.add( Button.ALTERNATE_NAME_QUIET_BUTTON ); 
			btnToggleLoading.visible = false;
			btnToggleLoading.label = "Loading Dialog"; 
			btnToggleLoading.defaultIcon = AssetHelper.getImage(FlatThemeCustomTextures.ICONS_BUTTON_SYNC_1); 
			
			addChild( btnToggleLoading );
			
			 

		}
		 

	}
}
