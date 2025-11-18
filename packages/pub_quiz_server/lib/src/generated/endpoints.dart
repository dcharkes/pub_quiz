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
import '../greeting_endpoint.dart' as _i2;
import '../quiz_endpoint.dart' as _i3;
import 'package:pub_quiz_server/src/generated/quiz.dart' as _i4;
import 'package:pub_quiz_server/src/generated/question.dart' as _i5;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'greeting': _i2.GreetingEndpoint()
        ..initialize(
          server,
          'greeting',
          null,
        ),
      'quiz': _i3.QuizEndpoint()
        ..initialize(
          server,
          'quiz',
          null,
        ),
    };
    connectors['greeting'] = _i1.EndpointConnector(
      name: 'greeting',
      endpoint: endpoints['greeting']!,
      methodConnectors: {
        'hello': _i1.MethodConnector(
          name: 'hello',
          params: {
            'name': _i1.ParameterDescription(
              name: 'name',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['greeting'] as _i2.GreetingEndpoint).hello(
            session,
            params['name'],
          ),
        )
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
        'createQuestion': _i1.MethodConnector(
          name: 'createQuestion',
          params: {
            'question': _i1.ParameterDescription(
              name: 'question',
              type: _i1.getType<_i5.Question>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['quiz'] as _i3.QuizEndpoint).createQuestion(
            session,
            params['question'],
          ),
        ),
        'loadQuiz': _i1.MethodConnector(
          name: 'loadQuiz',
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
              (endpoints['quiz'] as _i3.QuizEndpoint).loadQuiz(
            session,
            params['id'],
          ),
        ),
      },
    );
  }
}
