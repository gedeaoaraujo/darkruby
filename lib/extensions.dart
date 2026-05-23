import 'package:intl/intl.dart';

extension BoolExtensions on bool {
  bool not() => !this;
}

extension StrExtensions on String {
  String toPtBrDateTime() {
    final fmt = DateFormat('dd/MM/yyyy kk:mm');
    final date = DateTime.parse(this);
    return fmt.format(date);
  }
}