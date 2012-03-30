package {
	import flash.display.Sprite;
	import flash.events.TimerEvent;
	import flash.utils.Timer;

	/**
	 * @author Digi3Studio - Colin Leung
	 */
	public class MainTimer extends Sprite {
		private var timer:Timer;
		public function MainTimer() {
			timer = new Timer(100,1);
			timer.addEventListener(TimerEvent.TIMER, test, false, 0, true);
			timer.start();
		}
		
		public function test(e:TimerEvent):void{
			trace('test');
		}
	}
}
