import 'package:hive/hive.dart';
import 'package:logging/logging.dart';
import 'package:opennutritracker/core/data/dbo/user_custom_attributes_dbo.dart';

class UserCustomAttributesDataSource {
  static const _userKey = "UserCustomAttributesKeyKey";
  final log = Logger('UserCustomAttributesDataSource');
  final Box<UserCustomAttributesDBO> _userBox;

  UserCustomAttributesDataSource(this._userBox);

  Future<void> saveUserCustomAttributesData(
      UserCustomAttributesDBO userDBO) async {
    log.fine('Updating user custom data in db');
    _userBox.put(_userKey, userDBO);
  }

  Future<bool> hasUserCustomAttributes() async =>
      _userBox.containsKey(_userKey);

  Future<UserCustomAttributesDBO> getUserCustomAttributes() async {
    return _userBox.get(_userKey) ?? UserCustomAttributesDBO(
      customProteins: null,
      customFat: null,
      customCarbs: null,
      customCalories: null
    );
  }
}