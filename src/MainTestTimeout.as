package {
	import flash.display.Sprite;
	import flash.utils.setTimeout;

	/**
	 * @author Digi3Studio - Colin Leung
	 */
	public class MainTestTimeout extends Sprite {
		public function MainTestTimeout() {
			setTimeout(test,100);
		}

		public function test():void{
			trace('test');
			trace('2');
		}
	}
}
