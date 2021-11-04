#include "bn_core.h"
#include "bn_display.h"
#include "bn_math.h"
#include "bn_keypad.h"

#include "bn_sprite_builder.h"
#include "bn_sprite_ptr.h"
#include "bn_sprite_text_generator.h"
#include "bn_sprite_actions.h"

#include "bn_sprite_items_pod_sam.h"
#include "bn_sprite_items_pod_jos.h"

#include "common_variable_8x8_sprite_font.h"

namespace cc
{
    constexpr bn::fixed y_axis_padding = 8;
    constexpr bn::fixed text_position_bottom_center =
        (bn::display::height() / 2) - y_axis_padding;

    void title_screen()
    {
        bn::fixed movement_bounds = 32;
        bn::sprite_ptr pod_jos =
            bn::sprite_items::pod_jos.create_sprite(0, -movement_bounds);
        bn::sprite_move_loop_action pod_jos_movement(
            pod_jos,
            120,
            movement_bounds,
            movement_bounds
        );

        bn::sprite_text_generator
            text_generator(common::variable_8x8_sprite_font);
        text_generator.set_center_alignment();
        bn::vector<bn::sprite_ptr, 32> text_sprites;

        text_generator.generate(
            0,
            text_position_bottom_center,
            "PRESS START",
            text_sprites
        );

        while(! bn::keypad::start_pressed())
        {
            pod_jos_movement.update();
            bn::core::update();
        }
    }
}
