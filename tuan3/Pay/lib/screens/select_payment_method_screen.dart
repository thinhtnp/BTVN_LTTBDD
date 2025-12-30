import 'package:flutter/material.dart';
import '../payment/payment_method.dart';
import '../payment/paypal_payment.dart';
import '../payment/googlepay_payment.dart';
import '../payment/applepay_payment.dart';

class SelectPaymentMethodScreen extends StatefulWidget {
  const SelectPaymentMethodScreen({super.key});

  @override
  State<SelectPaymentMethodScreen> createState() =>
      _SelectPaymentMethodScreenState();
}

class _SelectPaymentMethodScreenState
    extends State<SelectPaymentMethodScreen> {

  // Chưa chọn thanh toán
  PaymentMethod? selectedMethod;

  // Danh sách các phương thức
  final List<PaymentMethod> paymentMethods = [
    PayPalPayment(),
    GooglePayPayment(),
    ApplePayPayment(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 30),

          Image.asset(
            selectedMethod?.imagePath ?? "assets/card.png",
            height: 100,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 30),

          ...paymentMethods.map((method) {
            final bool isSelected = selectedMethod == method;

            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedMethod = method;
                });
              },
              child: Container(
                margin:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                padding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: isSelected ? Colors.blue : Colors.transparent,
                    width: 2,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Radio<PaymentMethod>(
                      value: method,
                      groupValue: selectedMethod,
                      onChanged: (value) {
                        setState(() {
                          selectedMethod = value;
                        });
                      },
                    ),

                    // Tên phương thức
                    Expanded(
                      child: Text(
                        method.name,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: isSelected
                              ? FontWeight.bold
                              : FontWeight.normal,
                        ),
                      ),
                    ),

                    Image.asset(
                      method.imagePath,
                      height: 32,
                      fit: BoxFit.contain,
                    ),
                  ],
                ),
              ),
            );
          }).toList(),

          const Spacer(),

          // ===== NÚT CONTINUE =====
          // Chỉ hiển thị khi đã chọn phương thức
          if (selectedMethod != null)
            Padding(
              padding: const EdgeInsets.all(20),
              child: SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: () {
                    // Xử lý khi nhấn Continue
                  },
                  child: const Text("Continue"),

                ),
              ),
            ),
        ],
      ),
    );
  }
}
