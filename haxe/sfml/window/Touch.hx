package sfml.window;

import sfml.system.Vector2.Vector2iRaw;
import sfml.window.Window.ConstWindow;

@:include("SFML/Window.hpp")
@:native("sf::Touch&")
extern class Touch {
    @:native("sf::Touch::isDown")       public function isDown(finger:UInt):Bool;
    @:native("sf::Touch::getPosition")  public function getDesktopPosition(finger:UInt):Vector2iRaw;
    @:native("sf::Touch::getPosition")  public function getLocalPosition(finger:UInt, relativeTo:ConstWindow):Vector2iRaw;
}