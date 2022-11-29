import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class PhoneNumberPicker extends StatelessWidget {
  final Function phoneNumber;
  const PhoneNumberPicker({super.key, required this.phoneNumber});
  @override
  Widget build(BuildContext context) {
    String? userPhone;
    return IntlPhoneField(
      keyboardType: TextInputType.phone,
      initialCountryCode: 'EG',
      onChanged: (value) => userPhone = value.completeNumber,
      onSubmitted: (_) => phoneNumber(userPhone!.trim()),
    );
  }
}
