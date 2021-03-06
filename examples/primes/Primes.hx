import net.rezmason.utils.workers.QuickBoss;
import net.rezmason.utils.workers.Golem;

typedef PIGBoss = QuickBoss<Int, Int>;

class Primes
{
    static var pig:PIGBoss = null;
    static var done:Bool = false;

    static function main():Void {
        pig = new PIGBoss(Golem.rise('primes.hxml'), onPrime, null);
        pig.start();
        pig.send(0);

        #if (neko || cpp) while (!done) {} #end
    }

    static function onPrime(i:Int):Void {
        trace(i);
        if (i > 100) {
            pig.die();
            done = true;
            trace("That'll do pig, that'll do");
        }
    }
}
