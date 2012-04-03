package edit {
	import doot.model.UserInput;

	import com.fastframework.core.FASTEventDispatcher;
	import com.fastframework.core.IFASTEventDispatcher;
	import com.fastframework.view.ButtonClip;
	import com.fastframework.view.events.ButtonClipEvent;

	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;


	/**
	 * @author Digi3Studio - Colin Leung
	 */
	public class EditButton extends FASTEventDispatcher implements IFASTEventDispatcher{
		private var input:UserInput=UserInput.instance();
		
		private var base : ButtonClip;
		private var ox:Number;
		private var oy:Number;
		private var imp:IEditToolBehaviour;
		private var mc:Sprite;

		public function EditButton(mc:Sprite, imp:IEditToolBehaviour){
			this.mc = mc;
			this.imp = imp;
			base = new ButtonClip(mc);
			base.when(ButtonClipEvent.MOUSE_DOWN, onStartDrag);
		}

		public function pos(x:Number,y:Number):void{
			mc.x = x>>0;
			mc.y = y>>0;
		}

		private function onStartDrag(e:ButtonClipEvent):void{
			trace('edit btn onStartDrag');
			ox = e.mouseX;
			oy = e.mouseY;

			input.when(MouseEvent.MOUSE_MOVE, onDragging);
			input.when(MouseEvent.MOUSE_UP, onStopDrag);

			dispatchEvent(new Event(MouseEvent.MOUSE_DOWN));
		}

		private function onStopDrag(e:MouseEvent):void{
			imp.click();
			input.removeEventListener(MouseEvent.MOUSE_MOVE, onDragging);
			input.removeEventListener(MouseEvent.MOUSE_UP, onStopDrag);

			dispatchEvent(new Event(MouseEvent.MOUSE_UP));
			dispatchEvent(new Event(MouseEvent.CLICK));
		}

		private function onDragging(e:MouseEvent):void{
			imp.move(
				input.mousePt.x - ox,
				input.mousePt.y - oy
				);

			ox = input.mousePt.x;
			oy = input.mousePt.y;
		}

		public function show():void{
			mc.visible = true;
		}
		public function hide():void{
			mc.visible = false;
		}
	}
}
