import 'payment_method.dart';

class PayPalPayment extends PaymentMethod {
  @override
  String get name => "PayPal";

  @override
  String get imagePath => "assets/paypal.png";
}
