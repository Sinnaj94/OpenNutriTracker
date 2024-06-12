import 'package:opennutritracker/core/data/data_source/user_data_source.dart';
import 'package:opennutritracker/core/data/dbo/user_dbo.dart';
import 'package:opennutritracker/core/domain/entity/user_entity.dart';
import 'package:opennutritracker/core/data/data_source/user_custom_attributes_data_source.dart';

class UserRepository {
  final UserDataSource _userDataSource;
  final UserCustomAttributesDataSource _attributesDataSource;

  UserRepository(this._userDataSource, this._attributesDataSource);

  Future<void> updateUserData(UserEntity userEntity) async {
    final userDBO = UserDBO.fromUserEntity(userEntity);
    _userDataSource.saveUserData(userDBO);
  }

  Future<bool> hasUserData() async => await _userDataSource.hasUserData();

  Future<UserEntity> getUserData() async {
    final userDBO = await _userDataSource.getUserData();
    return UserEntity.fromUserDBO(userDBO);
  }
}
