/*
This is the c configuration file for the keymap

Copyright 2022 @Yowkees
Copyright 2022 MURAOKA Taro (aka KoRoN, @kaoriya)

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 2 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

#pragma once

#ifdef RGBLIGHT_ENABLE
#    define RGBLIGHT_EFFECT_BREATHING
#    define RGBLIGHT_EFFECT_RAINBOW_MOOD
#    define RGBLIGHT_EFFECT_RAINBOW_SWIRL
// NOTE: Reduce usage of Pro Micro Capacity.
// #    define RGBLIGHT_EFFECT_SNAKE
// #    define RGBLIGHT_EFFECT_KNIGHT
// #    define RGBLIGHT_EFFECT_CHRISTMAS
// #    define RGBLIGHT_EFFECT_STATIC_GRADIENT
// #    define RGBLIGHT_EFFECT_RGB_TEST
// #    define RGBLIGHT_EFFECT_ALTERNATING
// #    define RGBLIGHT_EFFECT_TWINKLE
#endif

#define TAP_CODE_DELAY 5

// ref. https://mazcon.hatenablog.com/entry/2023/11/10/080000
#define TAPPING_TERM 180 // msec
#define DYNAMIC_KEYMAP_LAYER_COUNT 7 // number of layers
#define KEYBALL_CPI_DEFAULT 1100 // mouse speed (default: 500)
#define KEYBALL_SCROLL_DIV_DEFAULT 5 // scroll speed (default: 4)
#define POINTING_DEVICE_AUTO_MOUSE_ENABLE // enable auto mouse
#define AUTO_MOUSE_DEFAULT_LAYER 6 // switch mouse layer number
#define AUTO_MOUSE_TIME 500 // time to return to original layer after mouse stops (ms)
