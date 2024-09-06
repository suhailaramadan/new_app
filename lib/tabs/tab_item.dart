import 'package:flutter/material.dart';
import 'package:new_app/app_theme.dart';

class TabItem extends StatelessWidget {
  const TabItem({super.key, required this.source, required this.isSelected});
  final String source;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(width: 2, color: AppTheme.primary),
        borderRadius: BorderRadius.circular(25),
        color: isSelected == true ? AppTheme.primary : Colors.transparent,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        child: Text(
          source,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
              color: isSelected == true ? AppTheme.white : AppTheme.primary),
        ),
      ),
    );
  }
}
