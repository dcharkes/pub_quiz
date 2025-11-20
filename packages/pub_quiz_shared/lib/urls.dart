const _serverUrlFromEnv = String.fromEnvironment(
  'SERVERPOD_API_SERVER_PUBLIC_HOST',
);
final serverUrl = _serverUrlFromEnv.isEmpty
    ? 'http://localhost:8088/'
    : 'https://$_serverUrlFromEnv/';
