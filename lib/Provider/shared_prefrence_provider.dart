import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'shared_prefrence_provider.g.dart';

@Riverpod(keepAlive: true)
SharedPreferences sharedPreference(SharedPreferenceRef ref) =>
    throw UnimplementedError();
