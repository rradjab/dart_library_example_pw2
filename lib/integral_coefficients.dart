import 'package:dart_library_example_pw2/input_operations.dart';
import 'package:dart_library_example_pw2/math_calculations.dart';

class RiemannIntegral {
  double eps = 1E-5;
  num x1 = 0;
  num x2 = 0;
  Set<num> breakPoints = {};
  String main() {
    print('Welcome to integral calculator\n x2\n  ∫f(x)dx\n x1');
    x1 = getNum('x1 value');
    x2 = getNum('x2 value');
    breakPoints.addAll({
      x1,
      ...List<num>.generate(getInt('breakpoints count'), (index) {
        return getNum('breakpoint value index of ${index + 1}');
      }),
      x2
    });
    if (wrongSequence()) {
      return 'points are wrong';
    }
    //func = getStr('function');
    return 'Result is: ${startCalculating()}';
  }

  num startCalculating() {
    num n = 0;
    breakPoints.reduce((prev, next) {
      //'(2x^3 + 7)dx';
      print('$prev $next');
      n += (2 * prev.pow(4)) / 4 + 7 * prev + (2 * next.pow(4)) / 4 + 7 * next;
      return next;
    });
    return n;
  }

  num calc(num n1, num n2, String o) {
    return switch (o) {
      == '+' => n1 + n2,
      == '-' => n1 - n2,
      == '*' => n1 * n2,
      == '/' => n1 / n2,
      == '>' => n1.pow(n2), //> as ^
      == '<' => n1.radix(n2), //< as √
      _ => 0
    };
  }

  bool wrongSequence() {
    bool b = false;
    breakPoints.reduce((prev, next) {
      if (prev >= next) {
        b = true;
      }
      return prev;
    });

    return b;
  }
}
