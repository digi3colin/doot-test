package edit {
	import doot.model.UserInput;
	import doot.sprite.SpriteSelectable;
	import doot.sprite.SpriteSelected;

	import edit.editBehaviour.EditMove;
	import edit.editBehaviour.EditRotate;
	import edit.editBehaviour.EditScale;

	import com.fastframework.core.SingletonError;

	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.utils.clearTimeout;
	import flash.utils.setTimeout;

	/**
	 * @author Digi3Studio - Colin Leung
	 */
	public class EditToolBox{
		private static var ins : EditToolBox;
		public static function instance():EditToolBox {
			return ins || new EditToolBox();
		}
		
		public function EditToolBox(){
			if(ins!=null){throw new SingletonError(this);}
			ins = this;
		}

		private var btnRotate:EditButton;
		private var btnMove:EditButton;
		private var btnScale:EditButton;
		private var mcTrashBin:Sprite;
		private var currentFocusSprite:SpriteSelectable;
		private var mc:Sprite;

		public function setView(mc:Sprite):void{
			this.mc = mc;

			mcTrashBin = mc['mc_trash_bin'];

			btnRotate 	= new EditButton(mc['btn_rotate'],new EditRotate());
			btnRotate.when(MouseEvent.MOUSE_DOWN, onEditStart);
			btnRotate.when(MouseEvent.MOUSE_UP, onEditEnd);

			btnMove 	= new EditButton(mc['btn_move'] ,new EditMove());
			btnMove.when(MouseEvent.MOUSE_DOWN, onMoveStart);
			btnMove.when(MouseEvent.MOUSE_UP, onEditMoveEnd);

			btnScale 	= new EditButton(mc['btn_scale'],new EditScale());
			btnScale.when(MouseEvent.MOUSE_DOWN, onEditStart);
			btnScale.when(MouseEvent.MOUSE_UP, onEditEnd);
			SpriteSelected.instance().when(Event.SELECT, editSprite);
		}

		private function editSprite(...e) : void {
			//user doing something.. dont focus it.
			if(UserInput.instance().isMouseDown==true)return;
			//select nothing, hide tools;
			if(SpriteSelected.instance().selectedSprite()==null){
				hide();
				return;
			}
			//the sprite already focus.. do nothing.
			if(currentFocusSprite==SpriteSelected.instance().selectedSprite())return;

			currentFocusSprite = SpriteSelected.instance().selectedSprite();

			hide();
			show();
			updateButtonsPosition();
		}

		private function updateButtonsPosition():void{
//			var pos:Point = SpriteSelectable.selected.getCornerTopRight();
			var center:Point = SpriteSelected.instance().selectedSprite().getGlobalCenter();//UserInput.instance().mousePt;//SpriteSelectable.selected.getCenter();

			btnMove.pos(center.x,center.y);
			btnRotate.pos(center.x-20,center.y);
			btnScale.pos(center.x+20,center.y);
		}


		public function hide(...e):void{
			btnRotate.hide();
			btnMove.hide();
			btnScale.hide();
		}

		private var iid:int;
		public function show(...e):void{
			btnMove.show();
			clearTimeout(iid);
			iid = setTimeout(showSecondaryTool,500);
		}

		private function showSecondaryTool():void{
			btnRotate.show();
			btnScale.show();
		}

		private function hide_secondaryTool():void{
			btnRotate.hide();
			btnScale.hide();
		}

		private function onMoveStart(...e):void{
			clearTimeout(iid);
			hide_secondaryTool();
			UserInput.instance().when(MouseEvent.MOUSE_MOVE, onDragging);
		}
		
		private function onEditStart(...e):void{
			clearTimeout(iid);
			UserInput.instance().when(MouseEvent.MOUSE_MOVE, onDragging);
		}

		private function onEditEnd(...e):void{
			clearTimeout(iid);
			iid = setTimeout(showSecondaryTool,500);
			UserInput.instance().removeEventListener(MouseEvent.MOUSE_MOVE, onDragging);		
		}

		private function onDragging(...e):void{
			updateButtonsPosition();
		}
		
		private function onEditMoveEnd(...e):void{
			onEditEnd();

			var isDropOnBin:Boolean = mcTrashBin.hitTestPoint(
				UserInput.instance().mousePt.x, 
				UserInput.instance().mousePt.y, true
			);

			if(isDropOnBin==true){
				deleteSprite();
				hide();
			}
		}

		private function deleteSprite():void{
			clearTimeout(iid);
			SpriteSelected.instance().selectedSprite().remove();
		}
	}
}