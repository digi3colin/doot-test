package {
	import flash.display.Sprite;
	/**
	 * @author Digi3Studio - Colin Leung
	 */
	public class MainBlank extends Sprite{
		private var sp:Sprite;
		private var sp2:Sprite;
		public function MainBlank(){
			sp = new Sprite();
			sp.graphics.beginFill(0, 1);

			sp2 = new Sprite();
			sp2.graphics.beginFill(0, 1);
		}
	}
}
