/**
 * fn_increasePain_CMS.sqf
 * @Descr: Increase the pain level of a unit
 * @Author: Glowbal
 *
 * @Arguments: [unit OBJECT, amount NUMBER, sectionName NUMBER (Also supports string representation of bodyparts)]
 * @Return: nil
 * @PublicAPI: true
 */

private ["_unit","_amountOfDamage","_selectionName","_sourceOfDamage","_painStatus"];
_unit = _this select 0;
_amountOfDamage = _this select 1;
_selectionName = _this select 2;
_amountOfDamage = _amountOfDamage * 10;
if (!alive _unit || (_amountOfDamage <= 0)) exitwith{};
_painStatus = [_unit,"cse_pain",0] call cse_fnc_getVariable;

if (typeName _selectionName == "STRING") then {
	_selectionName = [_selectionName] call cse_fnc_getBodyPartNumber_CMS;
};

_painStatus = switch (_selectionName) do {
	case 0: {
		_painStatus + (_amountOfDamage*1.5);
	};
	case 1: {
		_painStatus + (_amountOfDamage*0.9);
	};
	case 2: {
		_painStatus + (_amountOfDamage*0.8);
	};
	case 3: {
		_painStatus + (_amountOfDamage*0.7);
	};
	default {_painStatus};
};

[_unit,"cse_pain",_painStatus] call cse_fnc_setVariable;
nil;