import 'package:core/clinicas_core.dart';
import 'package:flutter/material.dart';

class DocumentBoxWidget extends StatelessWidget {
  const DocumentBoxWidget({
    super.key,
    this.onTap,
    required this.uploaded,
    required this.icon,
    required this.label,
    required this.totalFiles,
  });
  final String label;
  final int totalFiles;
  final bool uploaded;
  final Widget icon;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: uploaded ? ClinicasTheme.lightOrangeColor : Colors.white,
            border: Border.all(
              color: ClinicasTheme.orangeColor,
            ),
          ),
          child: Column(
            children: [
              Expanded(
                child: icon,
              ),
              Text(
                '$label${totalFiles > 0 ? ' ($totalFiles)' : ''}',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14,
                  color: ClinicasTheme.orangeColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.red,
                        side: const BorderSide(
                          color: Colors.red,
                        ),
                        fixedSize: Size.fromHeight(48),
                      ),
                      onPressed: () {},
                      child: Text('REMOVER TODAS'),
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ClinicasTheme.orangeColor,
                        fixedSize: Size.fromHeight(48),
                      ),
                      child: Text('FINALIZAR'),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
