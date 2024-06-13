import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:horizontal_picker/horizontal_picker.dart';
import 'package:opennutritracker/core/domain/entity/nutrition_entity.dart';
import 'package:opennutritracker/core/domain/entity/nutrition_entity.dart';
import 'package:opennutritracker/core/domain/entity/user_custom_attributes_entity.dart';
import 'package:opennutritracker/core/presentation/widgets/edit_nutrition_text_field.dart';
import 'package:opennutritracker/core/utils/extensions.dart';
import 'package:opennutritracker/features/onboarding/presentation/widgets/highlight_button.dart';
import 'package:opennutritracker/generated/l10n.dart';

class EditNutritionAttributesDialog extends StatefulWidget {
  final NutritionEntity<double> fallbackValues;
  final NutritionEntity<double?> currentCustomValues;

  const EditNutritionAttributesDialog(
      {super.key,
      required this.fallbackValues,
      required this.currentCustomValues});

  @override
  State<StatefulWidget> createState() => _EditNutritionAttributesDialogState();
}

class _EditNutritionAttributesDialogState
    extends State<EditNutritionAttributesDialog> {
  late TextEditingController caloriesController;
  late TextEditingController carbsController;
  late TextEditingController fatController;
  late TextEditingController proteinController;
  late List<TextEditingController> allControllers;

  @override
  void initState() {
    caloriesController = TextEditingController();
    carbsController = TextEditingController();
    fatController = TextEditingController();
    proteinController = TextEditingController();
    initializeValues();
    allControllers = [
      caloriesController,
      carbsController,
      fatController,
      proteinController
    ];
    for (var element in allControllers) {
      element.addListener(_onValueChange);
    }
    super.initState();
  }

  void initializeValues() {
    caloriesController.text =
        (widget.currentCustomValues.calories ?? widget.fallbackValues.calories)
            .toInt()
            .toString();
    carbsController.text =
        (widget.currentCustomValues.carbs ?? widget.fallbackValues.carbs)
            .toInt()
            .toString();
    fatController.text =
        (widget.currentCustomValues.fats ?? widget.fallbackValues.fats)
            .toInt()
            .toString();
    proteinController.text =
        (widget.currentCustomValues.proteins ?? widget.fallbackValues.proteins)
            .toInt()
            .toString();
  }

  void initializeValuesToFallback() {
    caloriesController.text =
        widget.fallbackValues.calories
            .toInt()
            .toString();
    carbsController.text =
        widget.fallbackValues.carbs
            .toInt()
            .toString();
    fatController.text =
        widget.fallbackValues.fats
            .toInt()
            .toString();
    proteinController.text =
        widget.fallbackValues.proteins
            .toInt()
            .toString();
  }

  @override
  void dispose() {
    for (var element in allControllers) {
      element.removeListener(_onValueChange);
    }
    super.dispose();
  }

  bool equalsFallbackState() {
    return getCurrentValues().equalsUsingIntCast(widget.fallbackValues);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: Do translations
    return AlertDialog(
      title: Text("Angaben bearbeiten"),
      content: SingleChildScrollView(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          EditNutritionTextField(
              title: S.of(context).onboardingYourGoalLabel,
              controller: caloriesController,
              value: widget.currentCustomValues.calories,
              fallbackValue: widget.fallbackValues.calories,
              unit: S.of(context).kcalLabel),
          EditNutritionTextField(
              title: S.of(context).carbsLabel,
              controller: carbsController,
              value: widget.currentCustomValues.carbs,
              fallbackValue: widget.fallbackValues.carbs,
              unit: S.of(context).gramUnit),
          EditNutritionTextField(
              title: S.of(context).fatLabel,
              controller: fatController,
              value: widget.currentCustomValues.fats,
              fallbackValue: widget.fallbackValues.fats,
              unit: S.of(context).gramUnit),
          EditNutritionTextField(
              title: S.of(context).proteinLabel,
              controller: proteinController,
              value: widget.currentCustomValues.proteins,
              fallbackValue: widget.fallbackValues.proteins,
              unit: S.of(context).gramUnit),
          HighlightButton(
              buttonLabel: "Alles auf Originalzustand",
              onButtonPressed: initializeValuesToFallback,
              buttonActive: !equalsFallbackState())
        ]),
      ),
      actions: [
        TextButton(
            onPressed: onPressedFinish,
            child: Text(S.of(context).dialogOKLabel)),
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(S.of(context).dialogCancelLabel))
      ],
    );
  }

  void _onValueChange() {
    setState(() {});
  }

  NutritionEntity<double?> getCurrentValues() {
    // Set the values if they are different from original values
    var controllersValuesMapping = {
      caloriesController: widget.fallbackValues.calories,
      carbsController: widget.fallbackValues.carbs,
      fatController: widget.fallbackValues.fats,
      proteinController: widget.fallbackValues.proteins,
    };
    // Build values
    List<double?> values =
        List<double?>.filled(controllersValuesMapping.length, null);

    controllersValuesMapping.entries.forEachIndexed((index, element) {
      // Try to parse int from controller
      try {
        var parsedInt = int.parse(element.key.text);
        values[index] = parsedInt.toDouble();
      } catch (e) {
        // Skip as it cannot be parsed
      }
    });
    return NutritionEntity<double?>(
        calories: values[0],
        carbs: values[1],
        fats: values[2],
        proteins: values[3]);
  }

  onPressedFinish() {
    Navigator.of(context).pop(getCurrentValues());
  }
}
