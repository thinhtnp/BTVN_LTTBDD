import 'payment_method.dart';

class ApplePayPayment extends PaymentMethod {
  @override
  String get name => "Apple Pay";

  @override
  String get imagePath => "assets/applepay.png";
}
