import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PersistenceService extends ChangeNotifier {
  static const String _kGameIdKey = 'pub_quiz_game_id';
  static const String _kPlayerNameKey = 'pub_quiz_player_name';

  final SharedPreferences _prefs;

  PersistenceService(this._prefs);

  static Future<PersistenceService> init() async {
    final prefs = await SharedPreferences.getInstance();
    return PersistenceService(prefs);
  }

  String? get savedGameId => _prefs.getString(_kGameIdKey);
  String? get savedPlayerName => _prefs.getString(_kPlayerNameKey);

  Future<void> saveGameState(String gameId, String playerName) async {
    await _prefs.setString(_kGameIdKey, gameId);
    await _prefs.setString(_kPlayerNameKey, playerName);
    notifyListeners();
  }

  Future<void> clearGameState() async {
    await _prefs.remove(_kGameIdKey);
    await _prefs.remove(_kPlayerNameKey);
    notifyListeners();
  }
}
