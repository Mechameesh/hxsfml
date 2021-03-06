package sfml.system;

@:include("SFML/System.hpp")
@:structAccess
@:native("const sf::Vector2&")
extern class Vector2<T> {
    //Members
    @:native("x")       public var x:T;
    @:native("y")       public var y:T;
}

@:include("SFML/System.hpp")
@:structAccess
@:native("const sf::Vector2i&")
extern class Vector2i extends Vector2<Int> {
    //Constructors
    @:native("sf::Vector2i")         @:overload(function(x:Int, y:Int):Vector2i {})
    @:native("sf::Vector2i")         public static function create():Vector2i;
}

@:include("SFML/System.hpp")
@:structAccess
@:native("const sf::Vector2f&")
extern class Vector2f extends Vector2<Float> {
    //Constructors
    @:native("sf::Vector2f")         @:overload(function(x:Float, y:Float):Vector2f {})
    @:native("sf::Vector2f")         public static function create():Vector2f;
}

@:include("SFML/System.hpp")
@:structAccess
@:native("const sf::Vector2u&")
extern class Vector2u extends Vector2<UInt> {
    //Constructors
    @:native("sf::Vector2u")         @:overload(function(x:UInt, y:UInt):Vector2u {})
    @:native("sf::Vector2u")         public static function create():Vector2u;
}

@:include("SFML/System.hpp")
@:structAccess
@:native("sf::Vector2u")
extern class Vector2uRaw extends Vector2u {
}

@:include("SFML/System.hpp")
@:structAccess
@:native("sf::Vector2f")
extern class Vector2fRaw extends Vector2f {
}

@:include("SFML/System.hpp")
@:structAccess
@:native("sf::Vector2i")
extern class Vector2iRaw extends Vector2i {
}