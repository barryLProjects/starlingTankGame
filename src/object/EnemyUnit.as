package object
{
	import starling.display.Quad;
	import starling.display.Sprite;
	import starling.events.Event;
	
	public class EnemyUnit extends Sprite
	{
		private var enemyQuad:Quad;
		private var speed:Number=5;
		
		public function EnemyUnit()
		{
			super();
			this.addEventListener(Event.ADDED_TO_STAGE,onAddStage);
		}
		private function onAddStage(e:Event):void
		{
			init();
			
			
		}
		private function init():void
		{
			enemyQuad=new Quad(80,30,0x00ffff);
			this.addChild(enemyQuad);
			this.addEventListener(Event.ENTER_FRAME,enemyTicker);
			
		}
		private function enemyTicker(e:Event):void
		{
			this.x-=speed;
		}
	}
}