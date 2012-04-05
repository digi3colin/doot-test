package edit.editBehaviour {
	import doot.sprite.SpriteSelectable;
	import doot.sprite.SpriteSelected;

	import edit.IEditToolBehaviour;

	/**
	 * @author Digi3Studio - Colin Leung
	 */
	public class EditRotate implements IEditToolBehaviour {
		private var or:Number;
		public function reset():void{
			or = SpriteSelected.instance().selectedSprite().getRotate();
		}

		public function click() : void {
		}

		public function move(x : Number, y : Number,ox:Number,oy:Number) : void {
			var d:Number = Math.sqrt((x-ox)*(x-ox)+(y-oy)*(y-oy));
			if(d<15)return;
			
			var mc:SpriteSelectable = SpriteSelected.instance().selectedSprite();
			var r:Number = -Math.atan2(x-ox, y-oy);
			mc.rotate(or+r);
/*			mc.rotate(
				mc.getRotate()+
				(x*Conversion.toRad*0.5)
			);*/
		}
	}
}