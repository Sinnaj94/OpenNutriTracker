import 'package:opennutritracker/core/data/dbo/user_custom_attributes_dbo.dart';
import 'package:opennutritracker/core/data/dbo/user_dbo.dart';
import 'package:opennutritracker/core/domain/entity/user_gender_entity.dart';
import 'package:opennutritracker/core/domain/entity/user_pal_entity.dart';
import 'package:opennutritracker/core/domain/entity/user_weight_goal_entity.dart';

class UserCustomAttributesEntity {
  double? customCalories;
  double? customCarbs;
  double? customFat;
  double? customProteins;

  UserCustomAttributesEntity(
      {required this.customCalories,
      required this.customCarbs,
      required this.customFat,
      required this.customProteins});

  factory UserCustomAttributesEntity.fromUserDBO(
      UserCustomAttributesDBO userDBO) {
    return UserCustomAttributesEntity(
      customCalories: userDBO.customCalories,
      customCarbs: userDBO.customCarbs,
      customFat: userDBO.customFat,
      customProteins: userDBO.customProteins
    );
  }

}
