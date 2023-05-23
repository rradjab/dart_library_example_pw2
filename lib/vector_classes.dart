import 'package:dart_library_example_pw2/math_calculations.dart';

class Point {
  num _x;
  num _y;
  num _z;

  num get getX => _x;
  num get getY => _y;
  num get getZ => _z;
  set setX(num val) => _x = val;
  set setY(num val) => _y = val;
  set setZ(num val) => _z = val;

  Point(this._x, this._y, this._z);

  factory Point.zero() {
    return Point(0, 0, 0);
  }

  factory Point.unitVector(num x, num y, num z) {
    num a = (x.pow(2) + y.pow(2) + z.pow(2)).radix(2);
    return Point(x / a, y / a, z / a);
  }

  num distanceTo(Point p) {
    num x = _x - p._x;
    num y = _y - p._y;
    num z = _z - p._z;
    return (x.pow(2) + y.pow(2) + z.pow(2)).radix(2);
  }

  num getArea(Point p1, Point p2, Point p3) {
    num a = p1.distanceTo(p2);
    num b = p2.distanceTo(p3);
    num c = p3.distanceTo(p1);
    num p = ((a + b + c) / 2);
    return (p * (p - a) * (p - b) * (p - c)).pow(2);
  }
}
