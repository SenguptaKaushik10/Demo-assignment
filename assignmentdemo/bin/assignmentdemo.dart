import "dart:io";
import 'package:assignmentdemo/utils/validation_utils.dart';
import 'package:assignmentdemo/exceptions/sides_of_triangle_invalid_exception.dart';
import 'package:assignmentdemo/exceptions/negative_value_or_zero_encountered_exception.dart';
import 'package:assignmentdemo/models/square.dart';
import 'package:assignmentdemo/models/triangle.dart';
import 'package:assignmentdemo/models/circle.dart';
import 'package:assignmentdemo/models/rectangle.dart';
import 'package:assignmentdemo/strings/strings_for_exceptions.dart';
import 'package:assignmentdemo/strings/strings_for_menu.dart';
import 'package:assignmentdemo/strings/strings_for_io.dart';

void main() {
  bool firstTimeRun = true;
  InputLoop:
  do {
    firstTimeRun
        ? print(StringsForMenu.MENU_HEADER_FOR_FIRST_RUN)
        : print(StringsForMenu.MENU_HEADER_FOR_OTHERS);

    print(StringsForMenu.MENU_OPTION_1);
    print(StringsForMenu.MENU_OPTION_2);
    print(StringsForMenu.MENU_OPTION_3);
    print(StringsForMenu.MENU_OPTION_4);
    print(StringsForMenu.MENU_OPTION_5);
    int optionSelected = int.parse(stdin.readLineSync()!);
    switch (optionSelected) {
      case 1:
        double? side;
        print(StringsForIO.INPUT_SIDE_OF_SQUARE);
        try {
          side = double.parse(stdin.readLineSync()!);
          ValidationUtils.checkIfNegativeOrZero(side);
        } on NegativeValueOrZeroEncounteredException {
          print(StringsForExceptions
              .SQUARE_SIDE_NEGATIVE_OR_ZERO_EXCEPTION_STRING);
          break;
        } on FormatException {
          print(StringsForExceptions.INVALID_STRING_EXCEPTION);
          break;
        }
        print("${StringsForIO.OUTPUT_SIDE_OF_SQUARE} $side");
        Square square = Square(side);
        print("${StringsForIO.OUTPUT_AREA_OF_SHAPES} ${square.area()}");
        print(
            "${StringsForIO.OUTPUT_PERIMETER_OF_SHAPES} ${square.perimeter()}");
        break;
      case 2:
        double? base, altitude, side1, side2;
        print(StringsForIO.INPUT_BASE_OF_TRIANGLE);
        try {
          base = double.parse(stdin.readLineSync()!);
          ValidationUtils.checkIfNegativeOrZero(base);
        } on NegativeValueOrZeroEncounteredException {
          print(StringsForExceptions
              .TRIANGLE_BASE_NEGATIVE_OR_ZERO_EXCEPTION_STRING);
          break;
        } on FormatException {
          print(StringsForExceptions.INVALID_STRING_EXCEPTION);
          break;
        }
        print(StringsForIO.INPUT_ALTITUDE_OF_TRIANGLE);
        try {
          altitude = double.parse(stdin.readLineSync()!);
          ValidationUtils.checkIfNegativeOrZero(altitude);
        } on NegativeValueOrZeroEncounteredException {
          print(StringsForExceptions
              .TRIANGLE_ALTITUDE_NEGATIVE_OR_ZERO_EXCEPTION_STRING);
          break;
        } on FormatException {
          print(StringsForExceptions.INVALID_STRING_EXCEPTION);
          break;
        }
        print(StringsForIO.INPUT_SIDES_OF_TRIANGLE);
        try {
          side1 = double.parse(stdin.readLineSync()!);
          ValidationUtils.checkIfNegativeOrZero(side1);
        } on NegativeValueOrZeroEncounteredException {
          print(StringsForExceptions
              .TRIANGLE_SIDE_NEGATIVE_OR_ZERO_EXCEPTION_STRING);
          break;
        } on FormatException {
          print(StringsForExceptions.INVALID_STRING_EXCEPTION);
          break;
        }
        try {
          side2 = double.parse(stdin.readLineSync()!);
          ValidationUtils.checkIfNegativeOrZero(side2);
          //ValidationUtils.checkIfSidesOfTriangleAreInvalid(base, side1, side2);
        } on NegativeValueOrZeroEncounteredException {
          print(StringsForExceptions
              .TRIANGLE_SIDE_NEGATIVE_OR_ZERO_EXCEPTION_STRING);
          break;
        } on FormatException {
          print(StringsForExceptions.INVALID_STRING_EXCEPTION);
          break;
        } /*on SidesOfTriangleInvalidException {
          //print(StringsForExceptions.SIDES_OF_TRIANGLE_INVALID_EXCEPTION);
          break;
        }*/
        try {
          ValidationUtils.checkIfSidesOfTriangleAreInvalid(base, side1, side2);
        } on SidesOfTriangleInvalidException {
          print(StringsForExceptions.SIDES_OF_TRIANGLE_INVALID_EXCEPTION);
          break;
        } catch (e) {
          print(e);
          break;
        }
        print("${StringsForIO.OUTPUT_BASE_OF_TRIANGLE} $base");
        print("${StringsForIO.OUTPUT_ALTITUDE_OF_TRIANGLE} $altitude");
        print("${StringsForIO.OUTPUT_SIDES_OF_TRIANGLE} $side1 and $side2");
        Triangle triangle = Triangle(base, altitude, side1, side2);
        print("${StringsForIO.OUTPUT_AREA_OF_SHAPES} ${triangle.area()}");
        print(
            "${StringsForIO.OUTPUT_PERIMETER_OF_SHAPES} ${triangle.perimeter()}");
        break;
      case 3:
        double? radius;
        print(StringsForIO.INPUT_RADIUS_OF_CIRCLE);
        try {
          radius = double.parse(stdin.readLineSync()!);
          ValidationUtils.checkIfNegativeOrZero(radius);
        } on NegativeValueOrZeroEncounteredException {
          print(StringsForExceptions
              .CIRCLE_RADIUS_NEGATIVE_OR_ZERO_EXCEPTION_STRING);
          break;
        } on FormatException {
          print(StringsForExceptions.INVALID_STRING_EXCEPTION);
          break;
        }
        print("${StringsForIO.OUTPUT_RADIUS_OF_CIRCLE} $radius");
        Circle circle = Circle(radius);
        print("${StringsForIO.OUTPUT_AREA_OF_SHAPES} ${circle.area()}");
        print(
            "${StringsForIO.OUTPUT_PERIMETER_OF_SHAPES} ${circle.perimeter()}");
        break;
      case 4:
        double? length, breadth;
        print(StringsForIO.INPUT_LENGTH_OF_RECTANGLE);
        try {
          length = double.parse(stdin.readLineSync()!);
          ValidationUtils.checkIfNegativeOrZero(length);
        } on NegativeValueOrZeroEncounteredException {
          print(StringsForExceptions
              .RECTANGLE_LENGTH_NEGATIVE_OR_ZERO_EXCEPTION_STRING);
          break;
        } on FormatException {
          print(StringsForExceptions.INVALID_STRING_EXCEPTION);
          break;
        }
        print(StringsForIO.INPUT_BREADTH_OF_RECTANGLE);
        try {
          breadth = double.parse(stdin.readLineSync()!);
          ValidationUtils.checkIfNegativeOrZero(breadth);
        } on NegativeValueOrZeroEncounteredException {
          print(StringsForExceptions
              .RECTANGLE_BREADTH_NEGATIVE_OR_ZERO_EXCEPTION);
          break;
        } on FormatException {
          print(StringsForExceptions.INVALID_STRING_EXCEPTION);
          break;
        }
        print("${StringsForIO.OUTPUT_LENGTH_OF_RECTANGLE} $length");
        print("${StringsForIO.OUTPUT_BREADTH_OF_RECTANGLE} $breadth");
        Rectangle rectangle = Rectangle(length, breadth);
        print("${StringsForIO.OUTPUT_AREA_OF_SHAPES} ${rectangle.area()}");
        print(
            "${StringsForIO.OUTPUT_PERIMETER_OF_SHAPES} ${rectangle.perimeter()}");
        break;
      case 5:
        print(StringsForMenu.PROGRAM_EXIT_STRING);
        break InputLoop;
      default:
        print(StringsForMenu.MENU_INVALID_OPTION);
        break;
    }
    firstTimeRun = false;
  } while (true);
}
