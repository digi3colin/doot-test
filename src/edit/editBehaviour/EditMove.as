﻿package edit.editBehaviour {
	import doot.sprite.SpriteSelected;
	import doot.utils.FASTMouse;

	import edit.IEditToolBehaviour;

	/**
	 * @author Digi3Studio - Colin Leung
	 */
	public class EditMove implements IEditToolBehaviour {
		private var lx:Number;
		private var ly:Number;

		public function reset():void{
			lx = FASTMouse.x;
			ly = FASTMouse.y;
		}

		public function click() : void {
		}

		public function move(x : Number, y : Number, ox : Number, oy : Number) : void {
			SpriteSelected.instance().selectedSprite().translate(x-lx,y-ly);
			lx = x;
			ly = y;
		}
	}
}
