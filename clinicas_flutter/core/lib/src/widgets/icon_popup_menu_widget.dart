import 'package:core/clinicas_core.dart';
import 'package:flutter/material.dart';

class IconPopupMenuWidget extends StatelessWidget {
  const IconPopupMenuWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 64),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: ClinicasTheme.orangeColor,
            width: 2,
          ),
        ),
        child: const Icon(
          Icons.more_horiz_rounded,
          color: ClinicasTheme.orangeColor,
        ),
      ),
    );
  }
}
