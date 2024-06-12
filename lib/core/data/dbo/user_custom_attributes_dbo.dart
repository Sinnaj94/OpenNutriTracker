import 'package:hive/hive.dart';

part 'user_custom_attributes_dbo.g.dart';


@HiveType(typeId: 16)
class UserCustomAttributesDBO extends HiveObject {
  @HiveField(0)
  double? customCalories;
  @HiveField(1)
  double? customCarbs;
  @HiveField(2)
  double? customFat;
  @HiveField(3)
  double? customProteins;

  UserCustomAttributesDBO(
      {this.customCalories,
      this.customCarbs,
      this.customFat,
      this.customProteins
      });
}