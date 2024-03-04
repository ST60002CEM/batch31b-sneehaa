import 'package:bookaway/core/app.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await HiveService().init();
  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}
