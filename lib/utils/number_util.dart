import 'package:intl/intl.dart';

String currencyFormat(int price) {
  var numberFormat = NumberFormat.currency(locale: 'ko_KR', symbol: '');
  return numberFormat.format(price);
}
