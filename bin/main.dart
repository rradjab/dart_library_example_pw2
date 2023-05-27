//import 'dart:io';
import 'package:dart_library_example_pw2/collection_operations.dart';
import 'package:dart_library_example_pw2/math_calculations.dart' as math_calc;
import 'package:dart_library_example_pw2/math_calculations.dart';
import 'package:dart_library_example_pw2/matrix_coefficient.dart';
import 'package:dart_library_example_pw2/users_operations.dart';
import 'package:dart_library_example_pw2/vector_classes.dart';

void main(List<String> arguments) {
  var maths = math_calc.DelimetersCalculator(99, 77);
  print('Greatest Common Divisor: ${maths.getGCD()}');
  print('Least Common Multiple: ${maths.getLCM()}');
  print('Decimal to Binary: ${math_calc.decToBin(19.271)}');
  print('Binary to Decimal: ${math_calc.binToDec(1101.10110000101)}');
  print('Type whatewer you want (words, numbers etc.)');
  String enteredByUser = 'aaa 123 12.3 aaa-9 /09 %3';
  //enteredByUser = stdin.readLineSync().toString();
  var lists = CollectionOperations(enteredByUser);
  print('Extracted collection of nums: ${lists.extractNumbers()}');
  Iterable<String> words = ['Pen', 'One', 'TWo', 'Pen', 'oNe', 'Pen', 'Two'];
  print('Map with repeating count: ${lists.elementCount(words)}');
  print('Set with number words: ${lists.extractUnicalInts(words)}');
  print(12.pow(2));
  print(655.radix(3));
  List<String> usersMails = [
    'aaa@gmail.com',
    'aaa@mail.ru',
    'ccc@yandex.com',
    'ddd@yahoo.com',
    'eee@hotmail.com'
  ];
  var users = UserManager();
  users.addUser(AdminUser('admin@google.ru'));
  for (var mails in usersMails) {
    users.addUser(GeneralUser(mails));
  }
  print(users.usersMailList());
  var point = Point(0, 1, 2);
  print(point.distanceTo(Point(1, 2, 0)));
  // print('97'.codeUnits);
  // print(utf8.decode([97]));
  var gm = GaussMethod();
  print(gm.main());
}
