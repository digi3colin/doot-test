package edit.editBehaviour {
	import doot.sprite.SpriteSelected;

	import edit.IEditToolBehaviour;

	/**
	 * @author Digi3Studio - Colin Leung
	 */
	public class EditMove implements IEditToolBehaviour {
		public function click() : void {
		}

		public function move(x : Number, y : Number) : void {
			SpriteSelected.instance().selectedSprite().translate(x,y);
		}
	}
}
