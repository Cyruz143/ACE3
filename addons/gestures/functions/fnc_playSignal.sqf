#include "script_component.hpp"
/*
 * Author: joko // Jonas, Emperias, Zigomarvin
 * Detect if the player and play the Gesture Animation
 *
 * Arguments:
 * Animation <STRING>
 *
 * Return Value:
 * <BOOL>
 *
 * Example:
 * "GeniusAnimation" call ace_handSignals_fnc_playSignal
 *
 * Public: No
 */

if (!GVAR(ReloadMutex)) exitWith {false};
private "_gesture";
_gesture = if (_this select [0,2] == "BI") then {
    _this select [2]
} else {
    if (((animationState ACE_player) select [0, 12]) in ["amovpercmstp", "amovpercmwlk", "amovpercmtac"] && weaponLowered ACE_player) then {
        format ["%1StandLowered", _this]
    } else {
        _this
    };
};
ACE_player playAction _gesture;
true
