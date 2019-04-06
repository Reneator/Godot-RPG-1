using DefaultNamespace;
using Objects.Item;
using UnityEngine;

namespace Objects.Characters
{
    public class Character :  MonoBehaviour
    {
        private StatContainer statContainer;

        private Attributes _attributes;
        private Equipment _equipment;
        private Inventory _inventory;
        private Perks _perks;
        private Buffs _buffs;
        private Masteries _masteries;
        private LootTable _lootTable;
        
        

        public void OnBeingAttacked()
        {
        }

        public void OnHit()
        {
            
        }

        public void OnDamage()
        {
        }

       public void Damage()
        {
            
        }
    }
}