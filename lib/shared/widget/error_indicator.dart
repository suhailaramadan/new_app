import 'package:flutter/material.dart';
import 'package:new_app/shared/app_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ErrorIndicator extends StatelessWidget {
  const ErrorIndicator({super.key, required this.onPressed, this.sourceId,this.errorMessage});
  final Function(String) onPressed;
  final String? sourceId;
  final String? errorMessage;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          AppLocalizations.of(context)!.error,
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(color: AppTheme.red),
        ),
        SizedBox(
          height: 5,
        ),
        ElevatedButton(
            onPressed: () {
              onPressed(sourceId!);
            },
            child: Text(
              AppLocalizations.of(context)!.tryagain,
              style: Theme.of(context)
                  .textTheme
                  .titleSmall
                  ?.copyWith(color: AppTheme.red),
            )),
      ],
    ));
  }
}
