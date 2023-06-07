import 'package:dart_library_example_pw2/input_operations.dart';
import 'package:dart_library_example_pw2/integral_coefficients.dart' as vector;
import 'package:dart_library_example_pw2/matrix_coefficient.dart' as matrix;
import 'package:dart_library_example_pw2/math_calculations.dart' as math;
import 'package:dart_library_example_pw2/collection_operations.dart';
import 'package:dart_library_example_pw2/math_calculations.dart';
import 'package:dart_library_example_pw2/users_operations.dart';
import 'package:dart_library_example_pw2/vector_classes.dart';

void main(List<String> arguments) {
  print('1:');
  var maths = math.DelimetersCalculator(99, 77);
  print('Greatest Common Divisor: ${maths.getGCD()}');
  print('Least Common Multiple: ${maths.getLCM()}');

  print('\n2:');
  print('Decimal to Binary: 19.271 = ${math.decToBin(19.271)}');
  print('Binary to Decimal: 1101.101100001 = ${math.binToDec(1101.101100001)}');

  print('\n3:');
  String enteredByUser = 'aaa 123 12.3 aaa-9 /09 %3';
  //enteredByUser = getStr('whatewer you want (words, numbers etc.)');
  var lists = CollectionOperations(enteredByUser);
  print('Extracted collection of nums: ${lists.extractNumbers()}');

  print('\n4:');
  Iterable<String> words = ['Pen', 'One', 'TWo', 'Pen', 'oNe', 'Zero', 'Two'];
  print('Map with repeating count: ${lists.elementCount(words)}');

  print('\n5:');
  print('Set with number words: ${lists.extractUnicalInts(words)}');

  print('\n6:');
  var point = Point(0, 1, 2);
  print(point.distanceTo(Point(1, 2, 0)));

  print('\n7:');
  print('12 power 2: ${12.pow(2)}');
  print('665 radix 3: ${655.radix(3)}');

  print('\n8:');
  List<String> usersMails = [
    'aaa@gmail.com',
    'aaa@mail.ru',
    'ccc@yandex.com',
    'ddd@yahoo.com',
    'eee@hotmail.com'
  ];
  var users = UserManager();
  users.addUser(AdminUser('admin@box.ru'));
  for (var mails in usersMails) {
    users.addUser(GeneralUser(mails));
  }
  print(users.usersMailList());

  print('\n9:');
  print(vector.RiemannIntegral().main());

  print('\n10:');
  print(matrix.GaussMethod().main());
}
