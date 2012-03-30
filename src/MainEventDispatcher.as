package {
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;
	import flash.utils.getTimer;

	/**
	 * @author colin
	 */
	public class MainEventDispatcher extends Sprite {
		private var ed:AEventDispatcher;
		private var ed2:AEventDispatcher;
		private var op:TextField;
		private var n:int=0;
		public function MainEventDispatcher() {
//			this.graphics.beginFill(0x333333,1);
//			this.graphics.drawRect(0, 0, 300, 300);
			this.addChild(op = new TextField());

			ed = new AEventDispatcher();
			ed.once(Event.CHANGE, testOnce);

			ed2 = new AEventDispatcher();

			var st:int = getTimer();
			var evt:Event = new Event(Event.CHANGE);
			for(var i:int=0;i<100;i++){
				ed.dispatchEvent(evt);
			}
			op.text += String(getTimer()-st)+'ms:'+n;

			this.addEventListener(Event.ENTER_FRAME, loop);
		}

		private function loop(e:Event):void{
			ed2.removeEventListener(Event.CHANGE, testOnce);
			ed2.when(Event.CHANGE, testOnce);
		}

		private function testOnce(e:Event):void{
			op.appendText(n.toString());
			n++;
			ed.once(Event.CHANGE, testOnce);
		}
	}
}
import com.fastframework.core.FASTEventDispatcher;
class AEventDispatcher extends FASTEventDispatcher{
	public function listen(type:String,listener:Function):void{
		this.addEventListener(type, listener);
//		this.addEventListener(type, listener,false,0,true);
	}
}