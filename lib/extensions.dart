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

  String get toHour {
    final dt = DateTime.parse(this);
    final fmt = DateFormat('kk:mm');
    return fmt.format(dt);
  }

  String get toDay {
    final dt = DateTime.parse(this);
    final fmt = DateFormat('dd, MMMM');
    return fmt.format(dt);
  }

  String get toYear {
    final dt = DateTime.parse(this);
    final fmt = DateFormat('yyyy, EEEE');
    return fmt.format(dt);
  }
}