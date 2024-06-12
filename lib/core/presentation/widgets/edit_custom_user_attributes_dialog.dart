import 'package:flutter/material.dart';
import 'package:horizontal_picker/horizontal_picker.dart';
import 'package:opennutritracker/core/presentation/widgets/edit_nutrition_text_field.dart';
import 'package:opennutritracker/generated/l10n.dart';

class EditCustomUserAttributesDialog extends StatefulWidget {
  final double originalCalorieGoal;
  final double originalCarbsGoal;
  final double originalFatGoal;
  final double originalProteinGoal;

  const EditCustomUserAttributesDialog(
      {super.key,
      required this.originalCalorieGoal,
      required this.originalCarbsGoal,
      required this.originalFatGoal,
      required this.originalProteinGoal});

  @override
  State<StatefulWidget> createState() => _EditCustomUserAttributesDialogState();
}

class _EditCustomUserAttributesDialogState
    extends State<EditCustomUserAttributesDialog> {
  @override
  Widget build(BuildContext context) {
    // TODO: Do translations
    return AlertDialog(
      title: Text("Angaben bearbeiten"),
      content: SingleChildScrollView(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          EditNutritionTextField(title: S
              .of(context)
              .onboardingYourGoalLabel, value: widget.originalCalorieGoal),
          EditNutritionTextField(title: S
              .of(context)
              .carbsLabel, value: widget.originalCarbsGoal),
          EditNutritionTextField(title: S
              .of(context)
              .fatLabel, value: widget.originalFatGoal),
          EditNutritionTextField(title: S
              .of(context)
              .proteinLabel, value: widget.originalProteinGoal),
        ]),
      ),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.of(context).pop(true);
            },
            child: Text(S.of(context).dialogOKLabel)),
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(S.of(context).dialogCancelLabel))
      ],
    );
  }
}
