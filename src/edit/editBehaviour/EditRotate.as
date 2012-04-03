package edit.editBehaviour {
	import doot.sprite.SpriteSelectable;
	import doot.sprite.SpriteSelected;

	import edit.IEditToolBehaviour;

	import com.fastframework.core.utils.Conversion;

	/**
	 * @author Digi3Studio - Colin Leung
	 */
	public class EditRotate implements IEditToolBehaviour {

		public function click() : void {
		}

		public function move(x : Number, y : Number) : void {
			var mc:SpriteSelectable = SpriteSelected.instance().selectedSprite();
			
			mc.rotate(
				mc.getRotate()+
				(x*Conversion.toRad*0.5)
			);
		}
	}
}