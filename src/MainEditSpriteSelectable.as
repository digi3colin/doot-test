﻿package {
	import asset.EditTool;

	import doot.model.UserInput;
	import doot.sprite.SpriteSelectable;
	import doot.sprite.SpriteSelected;
	import doot.sprite.SpriteSelectedHighlight;

	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.Event;
	/**
	 * @author Digi3Studio - Colin Leung
	 */
	public class MainEditSpriteSelectable extends Sprite {

		private var spriteSelectHighlight:SpriteSelectedHighlight;

		private var mcUserSprites:Sprite;
		private var mcEditToolLayer:Sprite;

		private var controllerEditTool:ControllerEditTool;

		public function MainEditSpriteSelectable() {
			UserInput.instance().setRoot(this);
			//seperate the sprite selectable and edit tools in different layer.
			this.addChild(mcUserSprites = new Sprite());
			this.addChild(mcEditToolLayer = new Sprite());

			//inital sprite highlighter
			spriteSelectHighlight = new SpriteSelectedHighlight();

			createSpriteSelectables();

			//click on stage to deselect;
			UserInput.instance().when(UserInput.MOUSE_UP, deselect);
			//bring the selected sprite to front;
			SpriteSelected.instance().when(SpriteSelected.SELECT, bringToFront);

			var viewEditTool:EditTool = new EditTool();
			mcEditToolLayer.addChild(viewEditTool);
			controllerEditTool = new ControllerEditTool(SpriteSelected.instance(),viewEditTool);
		}

		private function deselect(e:Event):void{
			for each(var obj:DisplayObject in UserInput.instance().getObjectsUnderPoint()){
				if(obj is SpriteSelectable)return;
			};
			SpriteSelected.instance().deselect();
		}

		private function bringToFront(e:Event):void{
			var mc:Sprite = SpriteSelected.instance().selectedSprite();
			mc.parent.addChild(mc);
		}
		
		private function createSpriteSelectables():void{
			var mc:SpriteSelectable;
			for(var i:int=0;i<10;i++){
				mcUserSprites.addChild(mc = new SpriteSelectable(i*40,i*40));
				mc.graphics.beginFill(Math.random()*0xFFFFFF, 1);
				mc.graphics.drawRoundRect(-25, -25, 50, 50,5,5);
			}		
		}
	}
}