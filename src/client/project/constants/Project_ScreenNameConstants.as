package client.project.constants {

	import avmplus.getQualifiedClassName;


	public class Project_ScreenNameConstants {
 
		
		public static const HELLO_WORLD:String = generateUniqueConstant( "LANDING_PAGE" );

	 
		private static function generateUniqueConstant( value ):String {

			return value + "_" + getQualifiedClassName( Project_ScreenNameConstants );
		}
	}
}
