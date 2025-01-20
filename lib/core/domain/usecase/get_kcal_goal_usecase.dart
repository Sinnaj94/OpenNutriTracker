import 'package:collection/collection.dart';
import 'package:opennutritracker/core/data/repository/config_repository.dart';
import 'package:opennutritracker/core/data/repository/user_activity_repository.dart';
import 'package:opennutritracker/core/data/repository/user_repository.dart';
import 'package:opennutritracker/core/domain/entity/user_entity.dart';
import 'package:opennutritracker/core/utils/calc/calorie_goal_calc.dart';

class GetKcalGoalUsecase {
  final UserRepository userRepository;
  final ConfigRepository configRepository;
  final UserActivityRepository _userActivityRepository;

  GetKcalGoalUsecase(
      this.userRepository, this.configRepository, this._userActivityRepository);

  Future<double> getKcalGoal(
      {UserEntity? userEntity,
      double? totalKcalActivitiesParam,
      double? kcalUserAdjustment}) async {
    final user = userEntity ?? await userRepository.getUserData();
    final config = await configRepository.getConfig();
    final totalKcalActivities = totalKcalActivitiesParam ??
        (await _userActivityRepository.getAllUserActivityByDate(DateTime.now()))
            .map((activity) => activity.burnedKcal)
            .toList()
            .sum;
    return CalorieGoalCalc.getTotalKcalGoal(user, totalKcalActivities,
        kcalUserAdjustment: config.userKcalAdjustment);
  }
}
