package object
{
	import flash.geom.Point;
	
	import starling.display.Quad;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	
	public class Tank extends Sprite
	{
		private var tankBase:Quad;
		public function Tank()
		{
			super();
			this.addEventListener(Event.ADDED_TO_STAGE,onAddStage);
		}
		private function onAddStage(e:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE,onAddStage);
			tankBase=new Quad(60,20,0xff0000);
			this.addChild(this.tankBase);
			this.addEventListener(TouchEvent.TOUCH,firingBullet);
		}
		private function firingBullet(e:TouchEvent):void
		{
			
			var touches:Vector.<Touch>=e.getTouches(this);
			
			if(touches.length==1)
			{
				trace("firingBullet",touches.length);
				var theTouch:Touch = touches[0];
				if(theTouch.phase==TouchPhase.ENDED)
				{
					this.parent.addChild(new Bullet(new Point(this.x,this.y)));
				}
			}
			
		}
	}
}