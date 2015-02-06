/*
 * Author: PabstMirror
 * Checks the conditions for being able to remove handcuffs
 *
 * Arguments:
 * 0: caller (player) <OBJECT>
 * 1: target <OBJECT>
 *
 * Return Value:
 * The return value <BOOL>
 *
 * Example:
 * -
 *
 * Public: No
 */
#include "script_component.hpp"

PARAMS_2(_unit,_target);

//Unit is handcuffed and not currently being escorted
_target getVariable [QGVAR(isHandcuffed), false] && 
{isNull (attachedTo _target)}