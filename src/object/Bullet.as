package object
{
	import starling.display.Sprite;
	import starling.events.Event;
	
	public class Bullet extends Sprite
	{
		private const GRAVITY:Number=9.7;
		
		public function Bullet()
		{
			super();
			this.addEventListener(Event.ADDED_TO_STAGE,onAddStage);
		}
		private function onAddStage(e:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE,onAddStage);
			
		}
	}
}