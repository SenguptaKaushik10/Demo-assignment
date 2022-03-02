import 'package:assignmentdemo/models/shapes.dart';

class Square extends Shapes {
  double? side;
  Square(this.side);

  @override
  double? area() => (side! * side!);

  @override
  double? perimeter() => (4 * side!);
}
