package
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	import starling.core.Starling;
	
	[SWF(FrameRate="60",backgroundColor="0x333333",width="960",height="640")]
	public class MobileTank_SinglePLayer extends Sprite
	{
		private var myStarling:Starling;
		
		public function MobileTank_SinglePLayer()
		{
			this.addEventListener(Event.ADDED_TO_STAGE,onAddToStage);
		}
		private function onAddToStage(e:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, onAddToStage);
			trace("starling started.....");
			myStarling = new Starling(TankGame, stage);
			myStarling.antiAliasing = 1;
			myStarling.showStats = true;
			myStarling.showStatsAt("left", "bottom");
			myStarling.start();
		}
	}
}