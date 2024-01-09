
import 'package:bookaway/core/app.dart';
import 'package:bookaway/core/network/hive_service.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

  await HiveService().init();
  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}
