import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:opennutritracker/generated/l10n.dart';

class EditNutritionTextField extends StatefulWidget {
  final String title;
  final TextEditingController controller;
  final double? value;
  final double fallbackValue;
  final String unit;

  const EditNutritionTextField(
      {super.key,
      required this.title,
      required this.controller,
      required this.value,
      required this.fallbackValue,
      required this.unit});

  @override
  State<StatefulWidget> createState() => _EditNutritionTextFieldState();
}

class _EditNutritionTextFieldState extends State<EditNutritionTextField> {
  void _onValueChange() {
    setState(() {});
  }

  @override
  void initState() {
    widget.controller.text =
        (widget.value ?? widget.fallbackValue).toInt().toString();
    widget.controller.addListener(_onValueChange);
    super.initState();
  }

  @override
  void dispose() {
    widget.controller.removeListener(_onValueChange);
    super.dispose();
  }

  bool equalsFallbackState() {
    try {
      return int.parse(widget.controller.text) == widget.fallbackValue.toInt();
    } catch (e) {
      return false;
    }
  }

  bool equalsValueState() {
    try {
      return int.parse(widget.controller.text) == widget.value?.toInt();
    } catch (e) {
      return false;
    }
  }

  void onPressAddButton() {
    try {
      var number = int.parse(widget.controller.text);
      widget.controller.text = (number + 10).toString();
    } catch (e) {
      widget.controller.text = "0";
    }
  }

  void onPressRemoveButton() {
    try {
      var number = int.parse(widget.controller.text);
      widget.controller.text = (number - 10).toString();
    } catch (e) {
      widget.controller.text = "0";
    }
  }

  void onPressResetToFallbackButton() {
    widget.controller.text = widget.fallbackValue.toInt().toString();
  }

  void onPressResetToValueButton() {
    widget.controller.text = widget.value?.toInt().toString() ?? "0";
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 14.0, bottom: 14.0),
              child: Text(widget.title,
                  style: Theme.of(context).textTheme.bodyLarge),
            ),
            IconButton(
                iconSize: 18,
                onPressed:
                    equalsFallbackState() ? null : onPressResetToFallbackButton,
                icon: const Icon(Icons.settings_backup_restore)),
          ],
        ),
        TextFormField(
          controller: widget.controller,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            suffixText: widget.unit,
            prefixIcon: IconButton(
              icon: Icon(Icons.remove),
              onPressed: onPressRemoveButton,
            ),
            suffixIcon:
                IconButton(icon: Icon(Icons.add), onPressed: onPressAddButton),
          ),
        )
      ],
    );
  }
}
