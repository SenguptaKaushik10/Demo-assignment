import 'package:assignmentdemo/models/shapes.dart';

class Rectangle extends Shapes {
  double? length, breadth;
  Rectangle(this.length, this.breadth);

  @override
  double? area() => (length! * breadth!);

  @override
  double? perimeter() => (2 * (length! + breadth!));
}
