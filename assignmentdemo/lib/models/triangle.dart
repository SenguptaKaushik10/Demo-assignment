import 'package:assignmentdemo/models/shapes.dart';

class Triangle extends Shapes {
  double? base, altitude, side1, side2;
  Triangle(this.base, this.altitude, this.side1, this.side2);

  @override
  double? area() => (0.5 * base! * altitude!);

  @override
  double? perimeter() => (base! + side1! + side2!);
}
