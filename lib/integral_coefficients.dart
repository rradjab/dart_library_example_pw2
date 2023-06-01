import 'package:dart_library_example_pw2/input_operations.dart';

class RiemannIntegral {
  double eps = 1E-5;
  String inputFunction = '';
  num x1 = 0;
  num x2 = 0;
  Set<num> breakPoints = {};
  String main() {
    print('Welcome to integral calculator\n x2\n  ∫f(x)dx\n x1');
    x1 = getNum('x1 value: ');
    x2 = getNum('x2 value: ');
    breakPoints.addAll({
      x1,
      ...List<num>.generate(getInt('breakpoints count: '), (index) {
        return getNum('breakpoint value index of ${index + 1}: ');
      }),
      x2
    });
    if (wrongSequence()) {
      return 'points are wrong';
    }
    print('< radical(√),> power(^), write in () if there operation inside.');
    print('Write root degree behind of √. Example 3√(2*3+2) = 2');
    inputFunction = '3<(2*3+2)/(x + 2)>3';
    //inputFunction = getStr('function: ');
    return startCalculating().toString();
  }

  num startCalculating() {
    num n = 0;
    List<String> list = inputFunction.toLowerCase().split('');

    breakPoints.reduce((prev, next) {
      for (int i = 0; i < list.length; i++) {
        if (list[i] == '(') {
          for (int l = i; l < list.length; l++) {}
        }
      }
      return prev;
    });
    return n;
  }

  bool wrongSequence() {
    bool b = false;
    breakPoints.reduce((prev, next) {
      if (prev >= next) {
        b = true;
      }
      return prev;
    });

    if (!b) {
      b = false;
      breakPoints.reduce((prev, next) {
        if (prev <= next) {
          b = true;
        }
        return prev;
      });

      breakPoints = breakPoints.toList().reversed.toSet();
      return b;
    } else {
      return b;
    }
  }
}
