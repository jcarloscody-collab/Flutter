import 'package:flutter/material.dart';

class ClinicasAppBar extends AppBar {
  ClinicasAppBar({super.key, super.actions})
      : super(
          backgroundColor: Colors.transparent,
          toolbarHeight: 72,
          flexibleSpace: Container(
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.5),
                  offset: const Offset(0, 1),
                  blurRadius: 4,
                )
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 64),
              child: Image.asset('assets/images/logo_horizontal.png'),
            ),
          ),
        );
}
