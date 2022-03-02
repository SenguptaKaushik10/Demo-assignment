import 'package:assignmentdemo/exceptions/negative_value_or_zero_encountered_exception.dart';
import 'package:assignmentdemo/exceptions/sides_of_triangle_invalid_exception.dart';

class ValidationUtils {
  static void checkIfNegativeOrZero(double side) {
    if (side <= 0) {
      throw NegativeValueOrZeroEncounteredException();
    }
  }

  static void checkIfSidesOfTriangleAreInvalid(
      double base, double side1, double side2) {
    if ((base + side1) < side2 ||
        (base + side2) < side1 ||
        (side1 + side2) < base) {
      throw SidesOfTriangleInvalidException();
    }
  }
}
