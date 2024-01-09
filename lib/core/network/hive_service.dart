import 'package:bookaway/config/constants/hive_table_constants.dart';
import 'package:bookaway/features/auth/data/model/auth_hive_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

final hiveServiceProvider = Provider<HiveService>(
  (ref) => HiveService(),
);

class HiveService {
  Future<void> init() async {
    var directory = await getApplicationDocumentsDirectory();
    Hive.init(directory.path);

    // Register Adapters
    Hive.registerAdapter(AuthHiveModelAdapter());
  }

  // ======================== Auth Queries ========================

  Future<void> registerUser(AuthHiveModel auth) async {
    var box = await Hive.openBox<AuthHiveModel>(HiveTableConstant.userBox);
    await box.put(auth.userId, auth);

    Future<List<AuthHiveModel>> getAllUsers() async {
      var box = await Hive.openBox<AuthHiveModel>(HiveTableConstant.userBox);
      var auths = box.values.toList();
      return auths;
    }

    Future<void> deleteUser(String userId) async {
      var box = await Hive.openBox<AuthHiveModel>(HiveTableConstant.userBox);
      await box.delete(userId);
    }

    // Delete hive
    Future<void> deleteHive() async {
      await Hive.deleteBoxFromDisk(HiveTableConstant.userBox);
    }
  }
}
