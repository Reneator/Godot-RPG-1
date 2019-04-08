extends Node

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var _current_level;
var _currentExp;
var _currentExpStep;
var _expRemain;
var _overallExp;
var _maxLevel;
var _levelSteppings = [10,100,400,500,600];

# Called when the node enters the scene tree for the first time.
func _ready():
	get_parent().add_to_group("hasLevel")
	pass # Replace with function body.

func init(level, currentExp, levelSteppings):
	_current_level = level;
	_currentExp = currentExp;
	_levelSteppings = levelSteppings;
	_currentExpStep = levelSteppings[_current_level - 1];
	_maxLevel = levelSteppings.Length - 1;
	_overallExp = GetOverallExpForLevel(_current_level);
	SetExpRemain();
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func GetOverallExpForLevel(level):
	var experience = 0;
	var count = 0;
	for levelStepping in _levelSteppings:
		count+= 1
		if(count == level):
			return experience
#		(var i = 1; i < level; i++)
		experience += levelStepping
	return experience
	
	
func gainExp(experience):
	print(_levelSteppings);
	var expLeft = experience
	while (expLeft > 0):
		if (_currentExp + expLeft >= _currentExpStep):
			print("The Hero leveled up to level  " + (_current_level + 1) + " by gaining " + expLeft +
                                " Exp currentExp needed for lvlup: " + _currentExpStep +
                                " currentExP before exp gained: " + _currentExp);
			var expGain  = (_currentExpStep - _currentExp);
			expLeft = expLeft - expGain;
			print("There is " + expLeft + " Experience left to distribute!");
			_currentExp = 0;
			_overallExp += expGain;
			IncreaseLevel();
		else:
			_currentExp += expLeft;
			_overallExp += expLeft;
			print("The hero gained " + expLeft + " experience! New CurrentExp: " + _currentExp);
			expLeft = 0;
	SetExpRemain();

		
func SetExpRemain():
	_expRemain = _currentExpStep - _currentExp;

func IncreaseLevel():
	if (_current_level <= _maxLevel):
		_current_level+= 1
		_currentExp = 0;
		_overallExp += _currentExpStep;
		SetNewCurrentExpStep();

func SetNewCurrentExpStep():
	 _currentExpStep = _levelSteppings[_current_level - 1];