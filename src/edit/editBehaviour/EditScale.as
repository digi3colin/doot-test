package edit.editBehaviour {
	import doot.sprite.SpriteSelectable;
	import doot.sprite.SpriteSelected;

	import edit.IEditToolBehaviour;

	/**
	 * @author Digi3Studio - Colin Leung
	 */
	public class EditScale implements IEditToolBehaviour {
		private var os:Number;
		public function reset() : void {
			os = SpriteSelected.instance().selectedSprite().getScale();
		}

		public function click() : void {

		}

		public function move(x : Number, y : Number, ox : Number, oy : Number) : void {
			var d:Number = Math.sqrt((x-ox)*(x-ox)+(y-oy)*(y-oy));
			if(y>oy)d=-d;
			var mc:SpriteSelectable = SpriteSelected.instance().selectedSprite();
			mc.scale(os+(d*0.005));
		}
	}
}