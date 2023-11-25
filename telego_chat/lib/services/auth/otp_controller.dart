import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telego_chat/services/auth/auth_service.dart';

class OTPController{
  static OTPController get instance => OTPController();

  void verifyOTP(String otp) async {

    var isVerified = await AuthService.instance.verifyOTP(otp);
    isVerified ? print('OTP verified') : print('OTP not verified');
  }
}