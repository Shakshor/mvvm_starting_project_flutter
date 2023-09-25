import 'package:flutter/material.dart';
import 'package:mvvm_starting_project/res/colors.dart';


class RoundButton extends StatelessWidget {

  final String title;
  final bool loading;
  final VoidCallback onPress;
  final double height;

  const RoundButton({super.key,
    required this.title,
    this.loading = false,
    required this.height,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(

      onTap: onPress,

      child: Container(

        height: height,
        width: 300,

        decoration: BoxDecoration(
          color: AppColors.buttonColor,
          borderRadius: BorderRadius.circular(10),
        ),

        child: Center(
          child: loading ?
          const CircularProgressIndicator(
            color: Colors.white,
          ) : Text(
            title,
            style: const TextStyle(
                  fontSize: 18,
                  color: AppColors.whiteColor
            ),
          ),
        ),

      ),
    );
  }
}

