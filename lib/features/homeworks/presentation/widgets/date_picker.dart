import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:nadros/features/homeworks/presentation/controllers/homeworks_controller.dart';

class DatePicker extends StatefulWidget {
  final TextEditingController controller;

  const DatePicker({super.key, required this.controller});

  @override
  State<DatePicker> createState() => _DateFieldExampleState();
}

class _DateFieldExampleState extends State<DatePicker> {
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      helpText: 'اختر التاريخ',
    );

    if (picked != null) {
      String formattedDate = DateFormat('yyyy-MM-dd').format(picked);
      widget.controller.text = formattedDate;
      Get.find<HomeworksController>().getHomeworks(formattedDate);
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      readOnly: true,
      onTap: () => _selectDate(context),
      textAlign: TextAlign.center,
      decoration: const InputDecoration(
        hintText: 'اختر التاريخ',
        fillColor: Colors.transparent,
        border: InputBorder.none,
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      ),
    );
  }
}
