import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/success_dialog.dart';

class VerifyCodeScreen extends StatefulWidget {
  @override
  State<VerifyCodeScreen> createState() => _VerifyCodeScreenState();
}

class _VerifyCodeScreenState extends State<VerifyCodeScreen> {
  final List<TextEditingController> _controllers =
  List.generate(4, (index) => TextEditingController());
  int _secondsRemaining = 60;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startCountdown();
  }

  void _startCountdown() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsRemaining > 0) {
        setState(() => _secondsRemaining--);
      } else {
        timer.cancel();
      }
    });
  }

  void _submitCode() {
    String code = _controllers.map((c) => c.text).join();
    if (code.length == 4) {
      Get.dialog(
        SuccessDialog(
          onContinue: () {
            Get.back(); // Close dialog
            Get.offAllNamed('/signin'); // Navigate
          },
        ),
      );
    } else {
      Get.snackbar("Invalid Code", "Please enter all 4 digits.");
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controllers.forEach((c) => c.dispose());
    super.dispose();
  }

  Widget _pinField(int index) {
    return Container(
      width: 56,
      height: 56,
      margin: const EdgeInsets.symmetric(horizontal: 6),
      child: TextField(
        controller: _controllers[index],
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        maxLength: 1,
        onChanged: (val) {
          if (val.isNotEmpty && index < 3) {
            FocusScope.of(context).nextFocus();
          } else if (val.isEmpty && index > 0) {
            FocusScope.of(context).previousFocus();
          }
        },
        decoration: InputDecoration(
          counterText: "",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              IconButton(
                icon: Icon(Icons.arrow_back_ios),
                onPressed: () => Get.back(),
              ),
              const SizedBox(height: 12),
              Center(
                child: Column(
                  children: [
                    Text("Verify Code",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    Text(
                      "Please enter the code we just sent to\nemail pristia@gmail.com",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),

              // Code fields
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(4, (i) => _pinField(i)),
              ),

              const SizedBox(height: 16),
              Center(
                child: Text(
                  "Resend code in 00:${_secondsRemaining.toString().padLeft(2, '0')}",
                  style: TextStyle(color: Colors.grey),
                ),
              ),

              const Spacer(),

              Center(
                child: ElevatedButton(
                  onPressed: _submitCode,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 120, vertical: 16),
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text("Continue", style: TextStyle(fontSize: 16)),
                ),
              ),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
