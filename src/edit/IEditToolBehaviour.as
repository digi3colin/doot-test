package edit {
	/**
	 * @author Digi3Studio - Colin Leung
	 */
	public interface IEditToolBehaviour {
		function reset():void;
		function click():void;
		function move(x:Number,y:Number,ox:Number,oy:Number):void;
	}
}
