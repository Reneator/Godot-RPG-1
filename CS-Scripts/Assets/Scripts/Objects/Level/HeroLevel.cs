using UnityEngine;

namespace Objects.Level
{
    public class HeroLevel : MonoBehaviour
    {
        private int _level;
        private int _currentExp;
        private int _currentExpStep;
        private int _expRemain;
        private int _overallExp;
        private int _maxLevel;
        private int[] _levelSteppings;


        public HeroLevel(int level, int currentExp, int[] levelSteppings)
        {
            _level = level;
            _currentExp = currentExp;
            _levelSteppings = levelSteppings;
            _currentExpStep = levelSteppings[_level - 1];
            _maxLevel = levelSteppings.Length - 1;
            _overallExp = GetOverallExpForLevel(_level);

            SetExpRemain();
        }

        public void gainExp(int exp)
        {
            Debug.Log(_levelSteppings);
            var expLeft = exp;
            while (expLeft > 0)
            {
                if (_currentExp + expLeft >= _currentExpStep)
                {
                    Debug.Log("The Hero leveled up to level  " + (_level + 1) + " by gaining " + expLeft +
                                " Exp currentExp needed for lvlup: " + _currentExpStep +
                                " currentExP before exp gained: " + _currentExp);
                    var expGain  = (_currentExpStep - _currentExp);
                    expLeft = expLeft - expGain;
                    Debug.Log("There is " + expLeft + " Experience left to distribute!");
                    _currentExp = 0;
                    _overallExp += expGain;
                    IncreaseLevel();
                }
                else
                {
                    _currentExp += expLeft;
                    _overallExp += expLeft;
                    Debug.Log("The hero gained " + expLeft + " experience! New CurrentExp: " + _currentExp);

                    expLeft = 0;
                }
            }

            SetExpRemain();
        }

        public void SetExpRemain()
        {
            _expRemain = _currentExpStep - _currentExp;
        }

        public void IncreaseLevel() {
            // trigger level-event
            if (_level <= _maxLevel)
            {
                _level++;
                _currentExp = 0;
                _overallExp += _currentExpStep;
                SetNewCurrentExpStep();
            }
        }

        private void SetNewCurrentExpStep()
        {
            _currentExpStep = _levelSteppings[_level - 1];
        }

        public int GetOverallExpForLevel(int level)
        {
            var exp = 0;
            for (var i = 1; i < level; i++)
            {
                exp += _levelSteppings[i];
            }

            return exp;
        }
    }
    
    
}