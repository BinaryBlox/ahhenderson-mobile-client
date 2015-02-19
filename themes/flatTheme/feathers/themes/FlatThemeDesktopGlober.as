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
	

	/**
	 * Flat Theme 1.1.0 theme for mobile/desktop Feathers apps.
	 *
	 * <p>This version of the theme embeds its assets. To load assets at
	 * runtime, see second class instead.</p>
	 *
	 * @see http://wiki.starling-framework.org/feathers/theme-assets
	 */	 
	 
	public class FlatThemeDesktopGlober extends FlatThemeDesktop
	{
		
		[Embed(source="/../../assets/fonts/trueType/GloberSemiBoldFree.otf",fontFamily="GloberSemi",fontWeight="normal",mimeType="application/x-font",embedAsCFF="true")]
		protected static const FONT_EMBED_1:Class;
		 
		[Embed(source="/../../assets/fonts/trueType/GloberSemiBoldFree.otf",fontFamily="GloberSemi",fontWeight="bold",mimeType="application/x-font",embedAsCFF="true")]
		protected static const FONT_EMBED_2:Class;
		
		[Embed(source="/../../assets/fonts/trueType/GloberSemiBoldFree.otf",fontFamily="GloberSemi",fontWeight="normal",unicodeRange="U+0030-U+0039",mimeType="application/x-font",embedAsCFF="false")]
		protected static const FONT_EMBED_3_NUMBER:Class;
		
		
		
		public function FlatThemeDesktopGlober(scaleToDPI:Boolean = true):void
		{
			
			var properties:Object = {};
			
			properties.FONT_NAME_BOLD = "GloberSemi";
			properties.FONT_NAME_REGULAR = "GloberSemi";
			 
			properties.FONT_SIZE_SMALL = Math.round(22*0.7);
			properties.FONT_SIZE_NORMAL = Math.round(24*0.7);
			properties.FONT_SIZE_MEDIUM = Math.round(26*0.7);
			properties.FONT_SIZE_LARGE = Math.round(30*0.7);
			properties.FONT_SIZE_XLARGE = Math.round(30*0.7);
			
			// Font size for mobile tablets
			/*properties.FONT_SIZE_SMALL = Math.round(22*0.7);
			properties.FONT_SIZE_NORMAL = Math.round(30*0.7);
			properties.FONT_SIZE_MEDIUM = Math.round(35*0.7);
			properties.FONT_SIZE_LARGE = Math.round(45*0.7);
			properties.FONT_SIZE_XLARGE = Math.round(45*0.7);*/
			
			// custom padding for fonts
			properties.BUTTON_PADDING_TOP = 4;
			properties.BUTTON_PADDING_BOTTOM = 4;
			properties.BUTTON_PADDING_RIGHT = 12;
			properties.BUTTON_PADDING_LEFT = 12;
			properties.ITEM_PADDING_TOP = 8;
			properties.ITEM_PADDING_BOTTOM = 4;
			
			super(properties, scaleToDPI);
			
		}

	}
}
