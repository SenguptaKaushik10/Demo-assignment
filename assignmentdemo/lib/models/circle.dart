import 'dart:math';
import 'package:assignmentdemo/models/shapes.dart';

class Circle extends Shapes {
  double? radius;
  Circle(this.radius);

  @override
  double? area() => (pi * pow(radius!, 2));

  @override
  double? perimeter() => (2 * pi * radius!);
}
