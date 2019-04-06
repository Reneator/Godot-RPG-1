using Objects.Characters;

namespace Controller
{
    public class CombatController
    {


        public static void CalculateHit(Character attacker, Character victim)
        {
            
            
            StatController.CalculateHitChance(attacker, victim);
            /*
             * Attacker.getHitchance()
             * victim.getDodge()
             *
             * if attacker hits victim
             *
             * calculate armor
             */
        }




    }
}