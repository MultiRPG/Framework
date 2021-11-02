# MTA Framework 💡
🍎 This is a framework for [Multi Theft Auto: San Andreas](https://mtasa.com/) and is designed for easy interacting with MTA element-based functions.

🎉The reason I released this framework is because I would like to save hours of working on scripting.
Finally, I am glad to provide the `MTA Framework`, and everyone is welcome to adjust the code and help make it better by editting the code, adding functions or events.

# Usage 🖌️
- FONTS
    - Fonts can be called anywhhere on client side, by default they are not allocated in memory until they are called with a function - if the type and size is correct the font is returned and allocates to memory, when the font is returned from memory - they are not created again.
    -  Fonts can be delocated from memory by calling `FONTS.deleteAllFonts()`
    - Fonts can be easily added in `fonts.lua` file by scheme:.
        ```lua
        local fontTypes = {
            [ name ] = path, -- font type accesed by FONTS[ size ].TYPE_HERE
            ["regular"] = "assets/fonts/Roboto-Regular.ttf", -- FONTS[ size ].regular
            ["bold"] = "assets/fonts/Roboto-Bold.ttf", -- FONTS[ 10 ].bold
            ["light"] = "assets/fonts/Roboto-Light.ttf", -- FONTS[ 12 ].light
        }
        ```
- Events (eg. `onClientVehicleEnter`)
    - Events can be added easily in `events.lua` file by scheme:
        ```lua
        Events = {
            {
                name = "onClientVehicleEnter", -- Name of event (required)
                attachedTo = root, -- Element to event is attached (optional, default: resourceRoot)
                exec = function(player, seat) -- Event executor (required)
                end,
            }
        }
        ```

- Remote Events
    - Remote events can be added easily using under scheme as follow, triggered via `triggerEvent`, `triggerClientEvent` and many more MTA functions...
    - Events can be added easily in `events.lua` file by scheme:
        ```lua
        RemoteEvents = {
            {
                name = "client.example:context", -- Name of remote event (required)
                allowedRemote = false, -- Does remote execution is allowed by trigger[...]Event (optional, default: true)
                attachedTo = root, -- Element to event is attached (optional, default: resourceRoot)
                exec = function(arg1, arg2, ...) -- Event executor (required)
                end,
            }
        }
        ```

- Cache
    - Cached data can be stored in `CacheData` table which is accessible from whole code (Data stored client-side cannot be accessed from server-side and vice versa).

- DX Library
    - Functions to draw rounded reactangles:
      - `dxDrawRoundedRectangle(x, y, rx, ry, color, radius)`
      - `dxDrawRoundedLeftRectangle(x, y, rx, ry, color, radius)`
      - `dxDrawRoundedTopRectangle(x, y, rx, ry, color, radius)`
      - `dxDrawRoundedBottomRectangle(x, y, rx, ry, color, radius)`

- Utils
    - Useful functions:
      - `isMouseIn( x, y, width, height )`
      - `isEventHandlerAdded( sEventName, pElementAttachedTo, func )`
      - `formatNumber(number, [ sep = ',' ])`

- GUI:
    - `gui.lua` contains values `sx` - screen width, `sy` - screen height, `sxh` - half of screen width, `syh` - half of height width, `zoom` - zoom for scaling purposes (player resolution divided by fullhd resolution). These values can be used anywhere on client side code.

# Branching 🔗
- Branch `main` contains all of above features.
- Branch `dx` contains only dx library features.
- Branch `fonts` containts fonts features.
- Branch `events` contains events and remote event features.
- Branch `utils` contains utils features.
- Branch `fonts+events` contains fonts, events and remote event features.
- Branch `dx+utils` contains dx library and utils features.
- Branch `dx+fonts` contains dx library and fonts features.
- Branch `dx+utils+fonts` contains dx library, utils and fonts features.

# Contribution ❤️

The most powerful feature of open source projects is developers community❤️. Everyone is welcome and will be written
below 🔥.

# Thanks for your support.❤️