package
{
	import flash.desktop.NativeApplication;
	import flash.events.Event;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.ui.Multitouch;
	import flash.ui.MultitouchInputMode;
	
	/**
	 * ...
	 * @author esdotdev
	 */
	public class Main extends Sprite 
	{
		
		public function Main() 
		{
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			
			stage.addEventListener(Event.DEACTIVATE, deactivate);
			
			// touch or gesture?
			Multitouch.inputMode = MultitouchInputMode.GESTURE;
			var count:Number = 0;
			var size:Number = 20;
			var cols:Number = stage.stageWidth / size;
			var rows:Number = stage.stageHeight/ size;
			trace(stage.stageWidth);
			for (var x:Number = 0; x < cols; x++){
				for (var y:Number = 0; y < rows; y++){
					trace("add child: " + (count++));
					var b:Button = new Button(size);
					b.x = x * size + size;// offset the btn by an extra `size` value because it is internally offset negatively
					b.y = y * size + size;
					addChild(b);
				}	
			}			
		}
		
		private function deactivate(e:Event):void 
		{
			// make sure the app behaves well (or exits) when in background
			//NativeApplication.nativeApplication.exit();
		}
		
	}
	
}