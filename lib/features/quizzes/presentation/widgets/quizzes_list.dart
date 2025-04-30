import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nadros/core/utils/colors.dart';
import 'package:nadros/core/widgets/rounded_container.dart';

class QuizzesList extends StatefulWidget {
  const QuizzesList({super.key});

  @override
  State<QuizzesList> createState() => _QuizzesListState();
}

class _QuizzesListState extends State<QuizzesList> {
  int? selectedChipIndex;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.w,
      runSpacing: 8.h,
      children: List.generate(13, (index) {
        final isSelected = selectedChipIndex == index;
        return GestureDetector(
          onTap: (){
            setState(() {
              selectedChipIndex = index;
            });
          },
          child: TRoundedContainer(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            backgroundColor: isSelected
                ? const Color(0xFF19A7CE).withOpacity(0.1)
                : const Color(0xFFF4F4F4),
            borderColor: isSelected ? const Color(0xFF19A7CE) : Colors.transparent,
            showBorder: true,
            borderWidth: 1,
            radius: 100,
            child: Text(
                'تحليل',
              style: TextStyle(
                color: isSelected ? const Color(0xFF19A7CE) : TColors.secondary,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        );
      }),
    );
  }
}
