package {
	import asset.EditTool;

	import doot.sprite.SpriteSelectable;
	import doot.sprite.SpriteSelected;

	import edit.EditButton;
	import edit.editBehaviour.EditMove;
	import edit.editBehaviour.EditRotate;
	import edit.editBehaviour.EditScale;

	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.geom.Point;
	import flash.utils.Timer;

	/**
	 * @author Digi3Studio - Colin Leung
	 */
	public class EditToolController{
		private var delayShowAll:Number = 500;
		private var timerShowAll:Timer;
		
		private var model:SpriteSelected;
		private var targetSprite:SpriteSelectable;
		private var view:EditTool;

		private var btnRotate:EditButton;
		private var btnMove:EditButton;
		private var btnScale:EditButton;
		public function EditToolController(model:SpriteSelected,view:EditTool) {
			this.view = view;
			this.model = model;

			btnRotate 	= new EditButton(view.btn_rotate,new EditRotate());

			btnMove 	= new EditButton(view.btn_move ,new EditMove());
			btnMove.when(MouseEvent.MOUSE_DOWN, watchTargetSprite);
			btnMove.when(MouseEvent.MOUSE_UP, stopWatchTargetSprite);

			btnScale 	= new EditButton(view.btn_scale,new EditScale());

			model.when(SpriteSelected.SELECT, spriteSelected);
			model.when(SpriteSelected.DESELECT, onDeselect);

			timerShowAll = new Timer(delayShowAll,1);
			timerShowAll.addEventListener(TimerEvent.TIMER, showAllTool, false, 0, true);

			hide();
		}

		private function watchTargetSprite(...e):void{
			targetSprite.addEventListener(SpriteSelectable.EVENT_CHANGE, updateButtonsPosition);
		}

		private function stopWatchTargetSprite(...e):void{
			if(targetSprite==null)return;
			targetSprite.removeEventListener(SpriteSelectable.EVENT_CHANGE, updateButtonsPosition);
		}

		private function onDeselect(...e):void{
			stopWatchTargetSprite();
			targetSprite = null;
			hide();
		}

		private function spriteSelected(...e) : void {
			stopWatchTargetSprite();
			targetSprite = model.selectedSprite();

			hide();
			showMoveTool();
			updateButtonsPosition();

			timerShowAll.start();
		}

		private function hide(...e):void{
			timerShowAll.reset();
			this.view.btn_move.visible = false;
			this.view.btn_rotate.visible = false;
			this.view.btn_scale.visible = false;
		}

		private function showMoveTool(...e):void{
			this.view.btn_move.visible = true;
		}
		
		private function showAllTool(...e):void{
			this.view.btn_move.visible = true;
			this.view.btn_rotate.visible = true;
			this.view.btn_scale.visible = true;
		}

		private function updateButtonsPosition(...e):void{
//			var pos:Point = SpriteSelectable.selected.getCornerTopRight();
			var center:Point = targetSprite.getGlobalCenter();

			btnMove.pos(center.x,center.y);
			btnRotate.pos(center.x-20,center.y);
			btnScale.pos(center.x+20,center.y);
		}
	}
}
