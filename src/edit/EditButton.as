﻿package edit {
	import doot.model.UserInput;
	import doot.utils.FASTMouse;
	import doot.view.IButtonClip;
	import doot.view.events.ButtonClipEvent;

	import com.fastframework.core.FASTEventDispatcher;
	import com.fastframework.core.IFASTEventDispatcher;

	import flash.events.Event;
	import flash.events.MouseEvent;


	/**
	 * @author Digi3Studio - Colin Leung
	 */
	public class EditButton extends FASTEventDispatcher implements IFASTEventDispatcher{
		private var input:UserInput=UserInput.instance();

		private var base : IButtonClip;
		private var sx:Number;
		private var sy:Number;
		private var imp:IEditToolBehaviour;

		public function EditButton(btn:IButtonClip, imp:IEditToolBehaviour){
			this.imp = imp;
			base = btn.when(ButtonClipEvent.MOUSE_DOWN, onStartDrag);
		}

		private function onStartDrag(e:Event):void{
			imp.reset();
			sx = FASTMouse.x;
			sy = FASTMouse.y;

			input.addEventListener(MouseEvent.MOUSE_MOVE, onDragging);
			input.addEventListener(MouseEvent.MOUSE_UP, onStopDrag);

			dispatchEvent(new Event(MouseEvent.MOUSE_DOWN));
		}

		private function onStopDrag(e:Event):void{
			imp.click();
			input.removeEventListener(MouseEvent.MOUSE_MOVE, onDragging);
			input.removeEventListener(MouseEvent.MOUSE_UP, onStopDrag);

			dispatchEvent(new Event(MouseEvent.MOUSE_UP));
			dispatchEvent(new Event(MouseEvent.CLICK));
		}

		private function onDragging(e:MouseEvent):void{
			imp.move(FASTMouse.x, FASTMouse.y,sx,sy);
		}
	}
}