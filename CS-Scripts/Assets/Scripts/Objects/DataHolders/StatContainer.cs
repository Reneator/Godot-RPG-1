using Objects.Characters;

namespace DefaultNamespace
{
    public class StatContainer
    {
        private Character _character;

        public StatContainer(Character character)
        {
            this._character = character;
        }

//        public float GetBaseHitChance()
//        {
//        }
//
//        public float GetBaseDodgeChance()
//        {
//        }
//
//        public float GetBaseDefense()
//        {
//        }
//
//        public float GetBaseArmor()
//        {
//        }
//
//        public float GetBaseDamage()
//        {
//        }
//
//        public float GetBaseResistance(ResistanceType resistanceType)
//        {
//        }
    }

    public enum ResistanceType
    {
        Fire,
        Ice,
        Earth,
        Lightning
    }
}