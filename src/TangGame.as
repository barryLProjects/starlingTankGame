package
{
	import starling.display.Sprite;
	import starling.events.Event;
	
	public class TangGame extends Sprite
	{
		public function TangGame()
		{
			super();
			this.addEventListener(Event.ADDED_TO_STAGE,onAddToStage);
			
		}
		private function onAddToStage(e:Event):void
		{
			
		}
	}
}