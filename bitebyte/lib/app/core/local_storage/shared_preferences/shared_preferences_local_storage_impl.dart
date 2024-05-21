import 'package:bitebyte/app/core/local_storage/local_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesLocalStorageImpl implements LocalStorage {
  Future<SharedPreferences> get _instace => SharedPreferences.getInstance();

  @override
  Future<void> clear() async {
    final sharedPreferences = await _instace;
    sharedPreferences.clear();
  }

  @override
  Future<bool> containsKey(String key) async {
    final sharedPreferences = await _instace;
    return sharedPreferences.containsKey(key);
  }

  @override
  Future<V?> read<V>(String key) async {
    final sharedPreferences = await _instace;
    return sharedPreferences.get(key) as V?;
  }

  @override
  Future<void> remove(String key) async {
    final sharedPreferences = await _instace;
    sharedPreferences.remove(key);
  }

  @override
  Future<void> write<V>(String key, V value) async {
    final sharedPreferences = await _instace;

    switch (V) {
      // ignore: pattern_never_matches_value_type
      case String _:
        sharedPreferences.setString(key, value as String);
        break;
      // ignore: pattern_never_matches_value_type
      case int _:
        sharedPreferences.setInt(key, value as int);
        break;
      // ignore: pattern_never_matches_value_type
      case double _:
        sharedPreferences.setDouble(key, value as double);
        break;
      // ignore: pattern_never_matches_value_type
      case bool _:
        sharedPreferences.setBool(key, value as bool);
        break;
      case List _:
        sharedPreferences.setStringList(key, value as List<String>);
        break;
      default:
        throw Exception('Type not supported');
    }
  }
}
