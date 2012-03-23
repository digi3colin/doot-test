package {
	import flash.display.DisplayObject;
	import doot.model.UserInput;
	import doot.sprite.SpriteSelectable;
	import doot.sprite.SpriteSelected;
	import doot.sprite.SpriteSelectedHighlight;

	import flash.display.Sprite;
	import flash.events.Event;
	/**
	 * @author Digi3Studio - Colin Leung
	 */
	public class MainSpriteSelectable extends Sprite{
		private var sprites:Array=[];
		private var spriteSelectHighlight:SpriteSelectedHighlight;

		public function MainSpriteSelectable(){
			UserInput.instance().setRoot(this);
			UserInput.instance().when(UserInput.MOUSE_UP, this , deselect);
			
			spriteSelectHighlight = new SpriteSelectedHighlight();

			var mc:SpriteSelectable;
			for(var i:int=0;i<10;i++){
				sprites.push(mc = new SpriteSelectable(i*40,i*40));
				this.addChild(mc);
				mc.graphics.beginFill(Math.random()*0xFFFFFF, 1);
				mc.graphics.drawCircle(0, 0, 30);
			}

			SpriteSelected.instance().when(SpriteSelected.SELECT, this, bringToFront);
		}

		private function deselect(e:Event):void{
			for each(var obj:DisplayObject in UserInput.instance().getObjectsUnderPoint()){
				if(obj is SpriteSelectable)return;
			};
			SpriteSelected.instance().deselect();
		}

		private function bringToFront(e:Event):void{
			SpriteSelected.instance().selectedSprite().parent.addChild(SpriteSelected.instance().selectedSprite());
		}
	}
}
