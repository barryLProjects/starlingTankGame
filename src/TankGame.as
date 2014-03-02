package
{
	import flash.events.TimerEvent;
	import flash.geom.Point;
	import flash.utils.Timer;
	
	import object.Bullet;
	import object.EnemyUnit;
	import object.Tank;
	
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	
	public class TankGame extends Sprite
	{
		private var myTank:Tank;
		private var canonAngle:Number;
		private var allEnemies:Array;
		private var enemyComingTimer:Timer;
		
		public function TankGame()
		{
			super();
			this.addEventListener(Event.ADDED_TO_STAGE,onAddToStage);
			
		}
		private function onAddToStage(e:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE,onAddToStage);
			startEnemyAttacking();
			myTank=new Tank();
			this.myTank.x=100;
			this.myTank.y=this.stage.stageHeight-30;
			this.addChild(this.myTank);
			this.stage.addEventListener(TouchEvent.TOUCH,aimingTarget);
			
		}
		private function startEnemyAttacking():void
		{
			enemyComingTimer=new Timer(3000);
			enemyComingTimer.addEventListener(TimerEvent.TIMER,generatEnemy);
			enemyComingTimer.start();
			allEnemies=[];
		}
		private function generatEnemy(e:TimerEvent):void
		{			
			var anEnemy:EnemyUnit=new EnemyUnit();
			anEnemy.x=stage.stageWidth;
			anEnemy.y = stage.stageHeight-40;
			this.addChild(anEnemy);
			allEnemies.push(anEnemy);
		}
		private function aimingTarget(e:TouchEvent):void
		{			
			var touches:Vector.<Touch>=e.getTouches(stage);
			
			if(touches.length==1)
			{
				
				var theTouch:Touch = touches[0];
				if(theTouch.phase==TouchPhase.HOVER)
				{
					canonAngle = Math.atan2(theTouch.globalY-this.myTank.y,theTouch.globalX-this.myTank.x);
					this.myTank.rotation=canonAngle;
				}
				if(theTouch.phase==TouchPhase.ENDED)
				{					trace(">>>>",theTouch.phase);
					this.addChild(new Bullet(new Point(this.myTank.x,this.myTank.y),this.canonAngle,1));
				}
			}
		}
	}
}