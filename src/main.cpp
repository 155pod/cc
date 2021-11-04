#include "bn_core.h"

#include "cc_title_screen.h"

int main()
{
    bn::core::init();

    while(true)
    {
        cc::title_screen();

        bn::core::update();
    }
}
