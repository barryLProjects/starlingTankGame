package
{
	import object.Tank;
	
	import starling.display.Sprite;
	import starling.events.Event;
	
	public class TankGame extends Sprite
	{
		private var myTank:Tank;
		public function TankGame()
		{
			super();
			this.addEventListener(Event.ADDED_TO_STAGE,onAddToStage);
			
		}
		private function onAddToStage(e:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE,onAddToStage);
			myTank=new Tank();
			this.myTank.x=100;
			this.myTank.y=this.stage.stageHeight-60;
			this.addChild(this.myTank);
		}
	}
}