package edit.editBehaviour {
	import doot.sprite.SpriteSelectable;
	import doot.sprite.SpriteSelected;

	import edit.IEditToolBehaviour;


	/**
	 * @author Digi3Studio - Colin Leung
	 */
	public class EditScale implements IEditToolBehaviour {

		public function click() : void {
		}

		public function move(x : Number, y : Number) : void {
			var mc:SpriteSelectable = SpriteSelected.instance().selectedSprite();
			mc.scale(
				mc.getScale()+
				(x*0.005)
			);
		}
	}
}