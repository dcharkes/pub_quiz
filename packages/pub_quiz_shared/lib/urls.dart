const _serverUrlFromEnv = String.fromEnvironment(
  'SERVERPOD_API_SERVER_PUBLIC_HOST',
);
final serverUrl = _serverUrlFromEnv.isEmpty
    ? 'http://localhost:8088/'
    : 'https://$_serverUrlFromEnv/';

const _tvUrlFromEnv = String.fromEnvironment(
  'TV_URL',
);
final tvUrl = _tvUrlFromEnv.isEmpty
    ? 'http://localhost:8089/'
    : 'https://$_tvUrlFromEnv/';

const _playerUrlFromEnv = String.fromEnvironment(
  'PLAYER_URL',
);
final playerUrl = _playerUrlFromEnv.isEmpty
    ? 'http://localhost:8090/'
    : 'https://$_playerUrlFromEnv/';
