package object
{
	import flash.geom.Point;
	
	import starling.display.Quad;
	import starling.display.Sprite;
	import starling.events.Event;
	
	public class Bullet extends Sprite
	{
		private const GRAVITY:Number=9.7;
		private var tempQuad:Quad;
		private var flyingAccX:Number=0;
		private var flyingAccY:Number=0;
		
		private var startPoint:Point;
		public function Bullet(startPoint:Point)
		{
			super();
			//this.startPoint=startPoint;
			this.addEventListener(Event.ADDED_TO_STAGE,onAddStage);
		}
		private function onAddStage(e:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE,onAddStage);
			tempQuad=new Quad(10,10,0x00ff00);
			this.addChild(this.tempQuad);
			firingABullet();
		}
		private function firingABullet(strength:Number=0,angle:Number=0):void
		{
			if(this.startPoint){
				this.x = this.startPoint.x;
				this.y=this.startPoint.y;
				
			}
			else{
				this.x = 100;
				this.y=100;
			}
			this.addEventListener(Event.ENTER_FRAME,onBulletFlying);
		}
		private function onBulletFlying(e:Event):void
		{
			flyingAccX+=0.5;
			flyingAccY+=0.15;
			this.x+=2*flyingAccX;
			this.y+=GRAVITY*.4*flyingAccY;
			if(this.y>stage.stageHeight-50)
			{
				this.removeEventListener(Event.ENTER_FRAME,onBulletFlying);
				this.parent.removeChild(this);
				
			}
		}
	}
}