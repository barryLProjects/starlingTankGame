package object
{
	import flash.geom.Point;
	
	import starling.display.Quad;
	import starling.display.Sprite;
	import starling.events.Event;
	
	public class Bullet extends Sprite
	{
		private const GRAVITY:Number=0.97;
		private var tempQuad:Quad;
		private var flyingAccX:Number=0;
		private var flyingAccY:Number=0;
		
		private var startPoint:Point;
		private var firingAngle:Number;
		private var strength:Number;
		
		private var vx:Number,vy:Number,vx_acc:Number=0,vy_acc:Number=0;
		
		public function Bullet(startPoint:Point,angle:Number=0,strength:Number=0)
		{
			super();
			this.startPoint=startPoint;
			this.firingAngle=angle;
			this.strength=strength;
			
			this.addEventListener(Event.ADDED_TO_STAGE,onAddStage);
		}
		private function onAddStage(e:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE,onAddStage);
			tempQuad=new Quad(10,10,0x00ff00);
			this.addChild(this.tempQuad);
			firingABullet();
		}
		private function firingABullet():void
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
			vx=this.strength*Math.cos(this.firingAngle)*10;
			vy=this.strength*Math.sin(this.firingAngle)*30;
			
			vy_acc+=GRAVITY;
			this.x+=vx+vx_acc;
			
			this.y+=vy+vy_acc;
			if(this.y>stage.stageHeight)
			{
				this.removeEventListener(Event.ENTER_FRAME,onBulletFlying);
				this.parent.removeChild(this);
				
			}
		}
	}
}