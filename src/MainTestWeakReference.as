package {
	import flash.events.KeyboardEvent;
	import flash.utils.Dictionary;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	/**
	 * @author colin
	 */
	public class MainTestWeakReference extends Sprite{
		private var dict:Dictionary;

		public function MainTestWeakReference(){
			dict = new Dictionary(true);
			this.stage.addEventListener(MouseEvent.CLICK, click);
			this.stage.addEventListener(KeyboardEvent.KEY_DOWN, enum);
		}

		private function click(e:MouseEvent):void{
			var a:Sprite = new Sprite();

			dict[a] = new Object();
			a = null; // clear original reference to the Sprite.
		}

		private function enum(e:KeyboardEvent):void{
			switch(e.charCode){
				case(32):
					trace('enum');
					for(var key:* in dict){
						trace(key);
					}
					
					for each(var item:* in dict){
						trace(item);
					}
					break;
				default:
					trace('clear');
					dict = new Dictionary(true);
			}
		}
	}
}
