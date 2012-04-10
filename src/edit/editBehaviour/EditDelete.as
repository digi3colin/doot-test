package edit.editBehaviour {
	import doot.sprite.SpriteSelected;

	import edit.IEditToolBehaviour;

	import flash.display.Sprite;

	/**
	 * @author Digi3Studio - Colin Leung
	 */
	public class EditDelete implements IEditToolBehaviour {
		public function click() : void {
			var mc:Sprite = SpriteSelected.instance().selectedSprite();
			mc.parent.removeChild(mc);
			SpriteSelected.instance().deselect();
		}

		public function move(x : Number, y : Number, ox : Number, oy : Number) : void {
		}

		public function reset() : void {
		}
	}
}
