import 'package:intl/intl.dart';

class UtilServices {
  String priceToCurrency(double? price) {
    //R$ price
    NumberFormat numberFormat = NumberFormat.simpleCurrency(locale: 'pt_BR');
    return numberFormat.format(price);
  }
}
