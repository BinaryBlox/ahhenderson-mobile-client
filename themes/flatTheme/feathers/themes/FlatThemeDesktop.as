/*
 Copyright (c) 2014 FlashDaily.net

 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
 OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
 HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
 WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
 OTHER DEALINGS IN THE SOFTWARE.
 */
package feathers.themes
{
	import com.kurst.cfwrk.system.constants.DeviceOrientation;
	
	import feathers.extension.ahhenderson.ahhenderson_extension_internal;
	import feathers.extension.ahhenderson.themes.CustomFlatTheme;

	/**
	 * Flat Theme 1.1.0 
	 *
	 * <p>This version of the theme embeds its assets. To load assets at
	 * runtime, see second class instead.</p>
	 *
	 * @see http://wiki.starling-framework.org/feathers/theme-assets
	 */	 
	 
	use namespace ahhenderson_extension_internal;
	
	public class FlatThemeDesktop extends CustomFlatTheme
	{
		  
		[Embed(source="/../../assets/textures/default-background-1.png")] 
		private static var BackgroundImage:Class;
		
		public function FlatThemeDesktop( properties:Object = null, 
									 scaleToDPI:Boolean = true)
		{
			   
			// Theme details
			properties.ATLAS_BASE_TEXTURES =  "FlatThemeBaseTextures"; 
			properties.ATLAS_CUSTOM_TEXTURES = "FlatThemeCustomTextures";
			 
			///***************************************
			// Theme Color
			//***************************************
			properties.PRIMARY_BACKGROUND_COLOR = 0xffffff;
			properties.LIGHT_TEXT_COLOR= 0xffffff;
			properties.DARK_TEXT_COLOR = 0xACB5B7;
			properties.SELECTED_TEXT_COLOR = 0xffffff;
			properties.DISABLED_TEXT_COLOR = 0xD0DDE0;//0xabb1b9;
			properties.DARK_DISABLED_TEXT_COLOR = 0xD0DDE0; 
			properties.LIST_BACKGROUND_COLOR = 0xF8FDFD; //0xffffff; //0xf4f4f4; 
			properties.TAB_DISABLED_BACKGROUND_COLOR = properties.PRIMARY_BACKGROUND_COLOR;
			properties.GROUPED_LIST_HEADER_BACKGROUND_COLOR = 0x2c3e50;
			properties.GROUPED_LIST_FOOTER_BACKGROUND_COLOR = 0x2c3e50;
			properties.MODAL_OVERLAY_COLOR = 0x000000; //0xffffff;
			properties.MODAL_OVERLAY_ALPHA = .7;		
			 
			 
			//***************************************
			// Theme Dimensions
			//*************************************** 
			
			// Gutters 
			properties.XSMALL_GUTTER_SIZE =  8;
			properties.SMALL_GUTTER_SIZE= 12;
			properties.GUTTER_SIZE=20;
			properties.LARGE_GUTTER_SIZE = 28;
			properties.SCROLLBAR_GUTTER_SIZE = 4;
			
			// Container/Control
			properties.HEADER_SIZE = 60;
			properties.GRID_SIZE = 88;
			properties.SMALL_CONTROL_SIZE = 20;
			properties.CONTROL_SIZE = 44;
			properties.TOGGLE_CONTROL_SIZE = 60
			properties.WIDE_CONTROL_SIZE = Math.round((properties.GRID_SIZE * 3) + (properties.GUTTER_SIZE*2));
			properties.POPUP_FILL_SIZE = 552;
			properties.CALLOUT_BACKGROUND_MIN_SIZE = 50;
			properties.ITEM_RENDERER_SIZE = 54; 
			 
			
			// Other
			properties.ADHOC_REDUCTION_SIZE = 0.7;
			properties.CONTROL_TOUCH_BOUNDRY_SCALE = 1.25; // excess padding on touch area around control (scale * control size)
			
			//***************************************
			// Theme asset & loading configuration
			//***************************************
			
			setContentScaleFactor = 1;
			setIsMultitouch = true;  
			setBackgroundImage = new BackgroundImage(); // Background image class
			setBaseAssetsPath = "assets";
			setScaledAssetsFolderPrefix = "x";
			setAudioAssetsFolder = "audio";
			setFontAssetsFolder = "fonts";
			setImageAssetsFolder = "textures"; 
			setDeviceOrientation = DeviceOrientation.LANDSCAPE;
			 
			// Don't forget to call super
			super(properties, scaleToDPI);
			
		}
		 
	}
}
