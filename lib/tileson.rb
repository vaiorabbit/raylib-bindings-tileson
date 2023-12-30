# raylib-tileson wrapper for Ruby
#
# * https://github.com/vaiorabbit/raylib-bindings-tileson
#
# Licensed under the BSD 2-Clause License.
# * https://github.com/vaiorabbit/raylib-bindings-tileson/blob/main/LICENSE.txt

require 'ffi'
require 'raylib'

module Raylib
  extend FFI::Library

  # Struct

  class Map < FFI::Struct
    layout(
      :width, :int,
      :height, :int,
      :tileWidth, :int,
      :tileHeight, :int,
      :data, :pointer,
    )
    def width = self[:width]
    def width=(v) self[:width] = v end
    def height = self[:height]
    def height=(v) self[:height] = v end
    def tileWidth = self[:tileWidth]
    def tileWidth=(v) self[:tileWidth] = v end
    def tileHeight = self[:tileHeight]
    def tileHeight=(v) self[:tileHeight] = v end
    def data = self[:data]
    def data=(v) self[:data] = v end
  end


  # Function

  def self.setup_tileson_symbols
    entries = [
      [:LoadTiledFromMemory, :LoadTiledFromMemory, [:pointer, :int, :pointer], Map.by_value],
      [:LoadTiled, :LoadTiled, [:pointer], Map.by_value],
      [:IsTiledReady, :IsTiledReady, [], :bool],
      [:DrawTiled, :DrawTiled, [Map.by_value, :int, :int, Color.by_value], :bool],
      [:UnloadMap, :UnloadMap, [Map.by_value], :void],
    ]
    entries.each do |entry|
      attach_function entry[0], entry[1], entry[2], entry[3]
    rescue FFI::NotFoundError => e
      warn "[Warning] Failed to import #{entry[0]} (#{e})."
    end
  end

  def self.load_tileson_lib(libpath)
    ffi_lib_flags :now, :global
    ffi_lib(libpath)
    setup_tileson_symbols
  rescue LoadError => e
    warn e
  end

end
