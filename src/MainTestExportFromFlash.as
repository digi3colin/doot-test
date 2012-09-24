package {
	import asset.EditTool;

	import flash.display.Sprite;
	/**
	 * @author Digi3Studio - Colin Leung
	 */
	public class MainTestExportFromFlash extends Sprite{
		public function MainTestExportFromFlash(){
			this.addChild(new asset.EditTool().btn_move);
		}
	}
}
