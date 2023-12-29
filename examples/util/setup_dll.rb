def raylib_tileson_bindings_gem_available?
  Gem::Specification.find_by_name('raylib-bindings-tileson')
rescue Gem::LoadError
  false
rescue
  Gem.available?('raylib-bindings-tileson')
end

require 'raylib'
raylib_shared_lib_path = Gem::Specification.find_by_name('raylib-bindings').full_gem_path + '/lib/'
case RUBY_PLATFORM
when /mswin|msys|mingw|cygwin/
  Raylib.load_lib(raylib_shared_lib_path + 'libraylib.dll')
when /darwin/
  arch = RUBY_PLATFORM.split('-')[0]
  Raylib.load_lib(raylib_shared_lib_path + "libraylib.#{arch}.dylib")
when /linux/
  arch = RUBY_PLATFORM.split('-')[0]
  Raylib.load_lib(raylib_shared_lib_path + "libraylib.#{arch}.so")
else
  raise RuntimeError, "setup_dll.rb : Unknown OS: #{RUBY_PLATFORM}"
end

require 'tileson'
if raylib_tileson_bindings_gem_available?
  # puts("Loading from Gem system path.")
  tileson_shared_lib_path = Gem::Specification.find_by_name('raylib-bindings-tileson').full_gem_path + '/lib/'

  case RUBY_PLATFORM
  when /mswin|msys|mingw|cygwin/
    Raylib.load_tileson_lib(tileson_shared_lib_path + 'tileson.dll')
  when /darwin/
    arch = RUBY_PLATFORM.split('-')[0]
    Raylib.load_tileson_lib(tileson_shared_lib_path + "tileson.#{arch}.dylib")
  when /linux/
    arch = RUBY_PLATFORM.split('-')[0]
    Raylib.load_tileson_lib(tileson_shared_lib_path + "tileson.#{arch}.so")
  else
    raise RuntimeError, "setup_dll.rb : Unknown OS: #{RUBY_PLATFORM}"
  end
else
  # puts("Loaging from local path.")
  require '../lib/tileson'

  case RUBY_PLATFORM
  when /mswin|msys|mingw|cygwin/
    Raylib.load_tileson_lib(Dir.pwd + '/../lib/' + 'tileson.dll')
  when /darwin/
    arch = RUBY_PLATFORM.split('-')[0]
    Raylib.load_tileson_lib(Dir.pwd + '/../lib/' + "tileson.#{arch}.dylib")
  when /linux/
    arch = RUBY_PLATFORM.split('-')[0]
    Raylib.load_tileson_lib(Dir.pwd + '/../lib/' + "tileson.#{arch}.so")
  else
    raise RuntimeError, "setup_dll.rb : Unknown OS: #{RUBY_PLATFORM}"
  end
end

include Raylib

