import 'package:test/test.dart';
import 'package:assignmentdemo/models/square.dart';
import 'package:assignmentdemo/models/triangle.dart';
import 'package:assignmentdemo/models/circle.dart';
import 'package:assignmentdemo/models/rectangle.dart';
import 'package:assignmentdemo/utils/validation_utils.dart';
import 'package:assignmentdemo/exceptions/sides_of_triangle_invalid_exception.dart';

void main() {
  group("Square", () {
    test('Area of Square', () {
      Square square = Square(5);
      expect(square.area(), equals(25));
    });
    test('Perimeter of Square', () {
      Square square = Square(10);
      expect(square.perimeter(), equals(40));
    });
  });
  group("Triangle", () {
    Triangle triangle = Triangle(3, 5, 4, 4);
    test('Area of Triangle', () {
      expect(triangle.area(), 7.5);
    });
    test('Perimeter of Triangle', () {
      expect(triangle.perimeter(), 11.0);
    });
    test('Invalid sides of Triangle', () {
      expect(() => ValidationUtils.checkIfSidesOfTriangleAreInvalid(3, 2, 7),
          throwsA(isA<SidesOfTriangleInvalidException>()));
    });
  });
  group("Circle", () {
    Circle circle = Circle(10);
    test('Area of Circle', () {
      expect(circle.area(), equals(314.1592653589793));
    });
    test('Circumference of Circle', () {
      expect(circle.perimeter(), equals(62.83185307179586));
    });
  });
  group("Rectangle", () {
    Rectangle rectangle = Rectangle(10, 3.5);
    test("Area of Rectangle", () {
      expect(rectangle.area(), 35);
    });
    test('Perimeter of Rectangle', () {
      expect(rectangle.perimeter(), 27);
    });
  });
}
