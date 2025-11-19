/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../player_endpoint.dart' as _i2;
import '../quiz_endpoint.dart' as _i3;
import 'package:pub_quiz_server/src/generated/quiz.dart' as _i4;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'player': _i2.PlayerEndpoint()
        ..initialize(
          server,
          'player',
          null,
        ),
      'quiz': _i3.QuizEndpoint()
        ..initialize(
          server,
          'quiz',
          null,
        ),
    };
    connectors['player'] = _i1.EndpointConnector(
      name: 'player',
      endpoint: endpoints['player']!,
      methodConnectors: {
        'joinGame': _i1.MethodConnector(
          name: 'joinGame',
          params: {
            'gameId': _i1.ParameterDescription(
              name: 'gameId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'name': _i1.ParameterDescription(
              name: 'name',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['player'] as _i2.PlayerEndpoint).joinGame(
            session,
            params['gameId'],
            params['name'],
          ),
        ),
        'recordAnswer': _i1.MethodConnector(
          name: 'recordAnswer',
          params: {
            'playerId': _i1.ParameterDescription(
              name: 'playerId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'questionIndex': _i1.ParameterDescription(
              name: 'questionIndex',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'answerIndex': _i1.ParameterDescription(
              name: 'answerIndex',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'answerTime': _i1.ParameterDescription(
              name: 'answerTime',
              type: _i1.getType<DateTime>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['player'] as _i2.PlayerEndpoint).recordAnswer(
            session,
            params['playerId'],
            params['questionIndex'],
            params['answerIndex'],
            params['answerTime'],
          ),
        ),
        'getResults': _i1.MethodConnector(
          name: 'getResults',
          params: {
            'gameId': _i1.ParameterDescription(
              name: 'gameId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['player'] as _i2.PlayerEndpoint).getResults(
            session,
            params['gameId'],
          ),
        ),
        'getQuestions': _i1.MethodStreamConnector(
          name: 'getQuestions',
          params: {
            'gameId': _i1.ParameterDescription(
              name: 'gameId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          streamParams: {},
          returnType: _i1.MethodStreamReturnType.streamType,
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
            Map<String, Stream> streamParams,
          ) =>
              (endpoints['player'] as _i2.PlayerEndpoint).getQuestions(
            session,
            params['gameId'],
          ),
        ),
      },
    );
    connectors['quiz'] = _i1.EndpointConnector(
      name: 'quiz',
      endpoint: endpoints['quiz']!,
      methodConnectors: {
        'createQuiz': _i1.MethodConnector(
          name: 'createQuiz',
          params: {
            'quiz': _i1.ParameterDescription(
              name: 'quiz',
              type: _i1.getType<_i4.Quiz>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['quiz'] as _i3.QuizEndpoint).createQuiz(
            session,
            params['quiz'],
          ),
        ),
        'readQuiz': _i1.MethodConnector(
          name: 'readQuiz',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['quiz'] as _i3.QuizEndpoint).readQuiz(
            session,
            params['id'],
          ),
        ),
        'readQuizzes': _i1.MethodConnector(
          name: 'readQuizzes',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['quiz'] as _i3.QuizEndpoint).readQuizzes(session),
        ),
        'updateQuiz': _i1.MethodConnector(
          name: 'updateQuiz',
          params: {
            'quiz': _i1.ParameterDescription(
              name: 'quiz',
              type: _i1.getType<_i4.Quiz>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['quiz'] as _i3.QuizEndpoint).updateQuiz(
            session,
            params['quiz'],
          ),
        ),
        'deleteQuiz': _i1.MethodConnector(
          name: 'deleteQuiz',
          params: {
            'quiz': _i1.ParameterDescription(
              name: 'quiz',
              type: _i1.getType<_i4.Quiz>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['quiz'] as _i3.QuizEndpoint).deleteQuiz(
            session,
            params['quiz'],
          ),
        ),
      },
    );
  }
}
