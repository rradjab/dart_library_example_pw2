import 'package:dart_library_example_pw2/collection_operations.dart';
import 'package:dart_library_example_pw2/math_calculations.dart' as math_calc;
import 'package:dart_library_example_pw2/math_calculations.dart';
import 'package:dart_library_example_pw2/users_operations.dart';

void main(List<String> arguments) {
  //так как в практической работе было написано реализовать методы а не
  //отдельные функции, все функции были реалзиованы внутри класса, таким
  //образом становясь методами
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
  print(12.nthDegree(2));
  print(655.rootOfNthDegree(3));
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
}
