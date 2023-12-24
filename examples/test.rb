require_relative 'util/setup_dll'
require_relative 'util/resource_path'

if __FILE__ == $PROGRAM_NAME
  screen_width = 800
  screen_height = 450
  position = Vector2.create

  InitWindow(screen_width, screen_height, "Yet Another Ruby-raylib bindings")
  SetTargetFPS(60)

  map = LoadTiled("#{RAYLIB_TILESON_RESOURCE_PATH}resources/desert.json")

  until WindowShouldClose()
    BeginDrawing()
      ClearBackground(RAYWHITE)
      DrawTiled(map, position.x, position.y, WHITE)
    EndDrawing()
  end

  UnloadMap(map)

  CloseWindow()
end
