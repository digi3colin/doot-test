package {
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	/**
	 * @author colin
	 */
	public class MainTestEvent extends Sprite{
		public function MainTestEvent(){
			var ed:EventDispatcher = new EventDispatcher();
			ed.addEventListener(Event.CHANGE, onChange,false,0,true);
		}
		
		private function onChange(e:Event):void{
		
		}
	}
}
