import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:opennutritracker/generated/l10n.dart';

class EditNutritionTextField extends StatefulWidget {
  final String title;
  final double value;
  const EditNutritionTextField({super.key, required this.title, required this.value});

  @override
  State<StatefulWidget> createState() => _EditNutritionTextFieldState();
}

class _EditNutritionTextFieldState extends State<EditNutritionTextField> {
  late TextEditingController textEditingController;

  void _onValueChange() {
    setState(() {
    });
  }

  @override
  void initState() {
    textEditingController = TextEditingController();
    textEditingController.text = widget.value.toInt().toString();
    textEditingController.addListener(_onValueChange);
    super.initState();
  }

  @override
  void dispose() {
    textEditingController.removeListener(_onValueChange);
    super.dispose();
  }


  bool equalsOriginalState() {
    try {
       return int.parse(textEditingController.text) == widget.value.toInt();
    } catch(e) {
      return false;
    }
  }

  void onPressAddButton() {
    try {
      var number = int.parse(textEditingController.text);
      textEditingController.text = (number + 10).toString();
    } catch(e) {
      textEditingController.text = "0";
    }
  }

  void onPressRemoveButton() {
    try {
      var number = int.parse(textEditingController.text);
      textEditingController.text = (number - 10).toString();
    } catch(e) {
      textEditingController.text = "0";
    }

  }

  void onPressResetButton() {
    textEditingController.text = widget.value.toInt().toString();
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
                  style: Theme
                      .of(context)
                      .textTheme
                      .bodyLarge),
            ),
          IconButton(
                    iconSize: 18,
                    onPressed: equalsOriginalState() ? null: onPressResetButton,
                    icon: const Icon(Icons.rotate_left)),
          ],
        ),
        TextFormField(
          controller: textEditingController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            suffixText: "kcal",
            prefixIcon: IconButton(
              icon: Icon(Icons.remove),
              onPressed: onPressRemoveButton,
            ),
            suffixIcon: IconButton(
                icon: Icon(Icons.add),
                onPressed: onPressAddButton),
          ),
        )
      ],
    );
  }

}