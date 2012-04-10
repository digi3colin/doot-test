package {
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.EventDispatcher;

	/**
	 * @author Digi3Studio - Colin Leung
	 */
	public class MainTestEventDispatcher extends Sprite {
		private var ed:EventDispatcher;
		public function MainTestEventDispatcher() {
			ed = new EventDispatcher(this);
			ed.addEventListener(Event.SELECT, test);
			ed.addEventListener(Event.SELECT, test2);
			ed.dispatchEvent(new Event(Event.SELECT));
		}

		private function test(e:Event):void{
			//trace(0);
		}
		
		private function test2(e:Event):void{
			//trace(0);
		}
	}
}
