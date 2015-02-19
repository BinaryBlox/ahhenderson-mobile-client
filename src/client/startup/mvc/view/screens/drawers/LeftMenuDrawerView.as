package client.startup.mvc.view.screens.drawers
{
	import ahhenderson.core.ui.enums.LayoutDirectionType;
	
	import feathers.controls.Check;
	import feathers.controls.Label;
	import feathers.controls.List;
	import feathers.controls.ScrollContainer;
	import feathers.controls.renderers.DefaultListItemRenderer;
	import feathers.controls.renderers.IListItemRenderer;
	import feathers.data.ListCollection;
	import feathers.extension.ahhenderson.managers.FeathersApplicationManager;
	import feathers.layout.AnchorLayoutData;
	import feathers.skins.IStyleProvider;
	
	import starling.events.Event;

	public class LeftMenuDrawerView extends ScrollContainer
	{
		public static var globalStyleProvider:IStyleProvider;

		public static const CHANGE_DOCK_MODE_TO_NONE:String = "changeDockModeToNone";
		public static const CHANGE_DOCK_MODE_TO_BOTH:String = "changeDockModeToBoth";

		public function LeftMenuDrawerView(title:String)
		{
			super();
			this._title = title;
			_fmgr = FeathersApplicationManager.instance;
		}

		private var _fmgr:FeathersApplicationManager;
		private var _title:String;
		private var _titleLabel:Label;
		private var _dockCheck:Check;
		private var _list:List;
		
		override protected function get defaultStyleProvider():IStyleProvider
		{
			return LeftMenuDrawerView.globalStyleProvider;
		}

		override protected function initialize():void
		{
			//never forget to call super.initialize()
			super.initialize();

			this._titleLabel = new Label();
			this._titleLabel.styleNameList.add(Label.ALTERNATE_NAME_HEADING);
			this._titleLabel.text = this._title;
			this.addChild(this._titleLabel);
			
			/*var items:Array = [
				{text: "Configuration", screenId : ScreenNameConstants.CONFIGURATION_VIEW},
				{text: "Analytics", screenId : ScreenNameConstants.HOME_VIEW} ];*/
			
			var items:Array = [
				{text: "Screen A", screenId : "screenA"},
				{text: "Screen B", screenId : "screenB"} ];
			  
			items.fixed = true;
			
			this._list = new List();
			this._list.dataProvider = new ListCollection(items);
			this._list.typicalItem = {text: "Item 1000"};
			this._list.isSelectable = true; //this.settings.isSelectable;
			this._list.allowMultipleSelection = false;//this.settings.allowMultipleSelection;
			this._list.hasElasticEdges = true; //this.settings.hasElasticEdges;
			//optimization to reduce draw calls.
			//only do this if the header or other content covers the edges of
			//the list. otherwise, the list items may be displayed outside of
			//the list's bounds.
			this._list.clipContent = false;
			this._list.autoHideBackground = true;
			this._list.itemRendererFactory = function():IListItemRenderer
			{
				var renderer:DefaultListItemRenderer = new DefaultListItemRenderer();
				
				//enable the quick hit area to optimize hit tests when an item
				//is only selectable and doesn't have interactive children.
				renderer.isQuickHitAreaEnabled = true;
				
				renderer.labelField = "text";
				return renderer;
			};
			this._list.addEventListener(Event.CHANGE, list_changeHandler);
			this._list.layoutData = new AnchorLayoutData(0, 0, 0, 0);
			
			this.addChild(this._list);

			/*this._dockCheck = new Check();
			this._dockCheck.isSelected = false;
			this._dockCheck.label = "Dock";
			this._dockCheck.addEventListener(Event.CHANGE, dockCheck_changeHandler);
			this.addChild(this._dockCheck);*/
		}

		/*private function listFactory():List{
			
			
			
		}*/
		private function list_changeHandler(event:Event):void
		{
			if(this._list.selectedIndex < 0)
				return;
			
			var selectedIndices:Vector.<int> = this._list.selectedIndices;
			//trace("List onChange:", selectedIndices.length > 0 ? selectedIndices : this._list.selectedIndex);
		
			// Do Navigation action 
			_fmgr.navigation.toggleDrawer(LayoutDirectionType.LEFT);
			 
			_fmgr.navigation.showScreen(this._list.selectedItem["screenId"]);
			
			this._list.selectedIndex=-1;
		}
		
		override public function dispose():void{
			
			super.dispose();
			
			_fmgr = null;
		}
		private function dockCheck_changeHandler(event:Event):void
		{
			if(this._dockCheck.isSelected)
			{
				this.dispatchEventWith(CHANGE_DOCK_MODE_TO_BOTH);
			}
			else
			{
				this.dispatchEventWith(CHANGE_DOCK_MODE_TO_NONE);
			}
		}

	}
}
