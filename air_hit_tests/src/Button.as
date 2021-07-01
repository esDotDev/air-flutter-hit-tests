package 
{
	import flash.display.SimpleButton;
	import flash.display.Sprite;
	import flash.display.Shape;
	
	public class Button extends Sprite 
	{
		
		public function Button(size:Number) 
		{
			super();
			var btn:SimpleButton = new SimpleButton();

			// Position each btn in negative space relative to it's parent, just to show it doesn't matter.
			btn.x = -size;
			btn.y = -size;

			btn.upState = btn.hitTestState = makeBtnBg(size, .1);
			btn.downState = btn.overState = makeBtnBg(size, .6);
			
			addChild(btn); 
		}
		
		function makeBtnBg(size:Number, alpha:Number):Shape {
			var s:Shape = new Shape(); 
			s.graphics.beginFill(0xFF0000, alpha); 
			s.graphics.drawCircle(size/2, size/2, size/2);
			s.graphics.endFill();
			s.cacheAsBitmap = true;
			return s;
		}
	}

}