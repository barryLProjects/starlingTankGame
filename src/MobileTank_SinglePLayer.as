package
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	import starling.core.Starling;
	
	[SWF(FrameRate="60",backgroundColor="0x333333")]
	public class MobileTank_SinglePLayer extends Sprite
	{
		public function MobileTank_SinglePLayer()
		{
			this.addEventListener(Event.ADDED_TO_STAGE,onAddToStage);
		}
		private function onAddToStage(e:Event):void
		{
			
		}
	}
}