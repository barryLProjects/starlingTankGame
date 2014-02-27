package object
{
	import starling.display.Quad;
	import starling.display.Sprite;
	import starling.events.Event;
	
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
			
		}
	}
}