import 'dart:io';

int getInt(String msg, [bool lessThanZero = false]) {
  stdout.write('Init $msg');
  return int.tryParse(stdin.readLineSync().toString()) ?? 0;
}

num getNum(String msg) {
  stdout.write('Init $msg');
  return num.tryParse(stdin.readLineSync().toString()) ?? 0;
}

String getStr(String msg) {
  stdout.write('Init $msg');
  return stdin.readLineSync().toString();
}
