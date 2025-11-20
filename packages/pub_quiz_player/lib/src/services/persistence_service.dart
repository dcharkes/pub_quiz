import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PersistenceService extends ChangeNotifier {
  static const String _kGameIdKey = 'pub_quiz_game_id';
  static const String _kPlayerNameKey = 'pub_quiz_player_name';
  static const String _kPlayerIdKey = 'pub_quiz_player_id';

  final SharedPreferences _prefs;

  PersistenceService(this._prefs);

  static Future<PersistenceService> init() async {
    final prefs = await SharedPreferences.getInstance();
    return PersistenceService(prefs);
  }

  String? get savedGameId => _prefs.getString(_kGameIdKey);
  String? get savedPlayerName => _prefs.getString(_kPlayerNameKey);
  int? get savedPlayerId => _prefs.getInt(_kPlayerIdKey);

  Future<void> saveGameState(
    String gameId,
    String playerName,
    int playerId,
  ) async {
    await _prefs.setString(_kGameIdKey, gameId);
    await _prefs.setString(_kPlayerNameKey, playerName);
    await _prefs.setInt(_kPlayerIdKey, playerId);
    notifyListeners();
  }

  Future<void> clearGameState() async {
    await _prefs.remove(_kGameIdKey);
    await _prefs.remove(_kPlayerNameKey);
    await _prefs.remove(_kPlayerIdKey);
    notifyListeners();
  }
}
