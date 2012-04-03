package {
	import asset.EditTool;

	import doot.sprite.SpriteSelected;

	import edit.EditButton;
	import edit.editBehaviour.EditMove;
	import edit.editBehaviour.EditRotate;
	import edit.editBehaviour.EditScale;

	import flash.events.TimerEvent;
	import flash.geom.Point;
	import flash.utils.Timer;

	/**
	 * @author Digi3Studio - Colin Leung
	 */
	public class ControllerEditTool{
		private var delayShowAll:Number = 500;
		private var timerShowAll:Timer;
		
		private var model:SpriteSelected;
		private var view:EditTool;

		private var btnRotate:EditButton;
		private var btnMove:EditButton;
		private var btnScale:EditButton;
		public function ControllerEditTool(model:SpriteSelected,view:EditTool) {
			this.view = view;
			this.model = model;

			btnRotate 	= new EditButton(view.btn_rotate,new EditRotate());
//			btnRotate.when(MouseEvent.MOUSE_DOWN, onEditStart);
//			btnRotate.when(MouseEvent.MOUSE_UP, onEditEnd);

			btnMove 	= new EditButton(view.btn_move ,new EditMove());
//			btnMove.when(MouseEvent.MOUSE_DOWN, onMoveStart);
//			btnMove.when(MouseEvent.MOUSE_UP, onEditMoveEnd);

			btnScale 	= new EditButton(view.btn_scale,new EditScale());
//			btnScale.when(MouseEvent.MOUSE_DOWN, onEditStart);
//			btnScale.when(MouseEvent.MOUSE_UP, onEditEnd);

			model.when(SpriteSelected.SELECT, spriteSelected);
			model.when(SpriteSelected.DESELECT, hide);

			timerShowAll = new Timer(delayShowAll,1);
			timerShowAll.addEventListener(TimerEvent.TIMER, showAllTool, false, 0, true);

			hide();
		}

		private function spriteSelected(...e) : void {
			hide();

			showMoveTool();
			updateButtonsPosition();

			timerShowAll.reset();
			timerShowAll.start();
		}

		private function hide(...e):void{
			timerShowAll.stop();
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

		private function updateButtonsPosition():void{
//			var pos:Point = SpriteSelectable.selected.getCornerTopRight();
			var center:Point = model.selectedSprite().getGlobalCenter();

			btnMove.pos(center.x,center.y);
			btnRotate.pos(center.x-20,center.y);
			btnScale.pos(center.x+20,center.y);
		}
	}
}
