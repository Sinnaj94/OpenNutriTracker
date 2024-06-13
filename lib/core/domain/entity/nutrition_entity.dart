import 'package:collection/collection.dart';

class NutritionEntity<T extends num?> {
  T calories;
  T carbs;
  T fats;
  T proteins;

  NutritionEntity(
      {required this.calories,
      required this.carbs,
      required this.fats,
      required this.proteins});

  bool equalsUsingIntCast(NutritionEntity other) {
    var thisToInt = this.toInt().toList();
    var otherToInt = other.toInt().toList();
    return const ListEquality().equals(thisToInt, otherToInt);
  }

  List<T> toList() {
    return [calories, carbs, fats, proteins];
  }

  NutritionEntity<int?> toInt() {
    return NutritionEntity(
        calories: this.calories?.toInt(),
        carbs: this.carbs?.toInt(),
        fats: this.fats?.toInt(),
        proteins: this.proteins?.toInt());
  }
}
