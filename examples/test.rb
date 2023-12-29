require_relative 'util/setup_dll'

if __FILE__ == $PROGRAM_NAME
  screen_width = 500
  screen_height = 290
  position = Vector2.create

  InitWindow(screen_width, screen_height, "Ruby raylib-tileson bindings")
  SetTargetFPS(60)

  map = LoadTiled("map/sampleMap.tmj")

  until WindowShouldClose()
    BeginDrawing()
      ClearBackground(RAYWHITE)
      DrawTiled(map, position.x, position.y, WHITE)
    EndDrawing()
  end

  UnloadMap(map)

  CloseWindow()
end
