/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'dart:async' as _i2;
import 'package:pub_quiz_client/src/protocol/quiz.dart' as _i3;
import 'package:pub_quiz_client/src/protocol/question.dart' as _i4;
import 'protocol.dart' as _i5;

/// {@category Endpoint}
class EndpointQuiz extends _i1.EndpointRef {
  EndpointQuiz(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'quiz';

  _i2.Future<_i3.Quiz> createQuiz(_i3.Quiz quiz) =>
      caller.callServerEndpoint<_i3.Quiz>(
        'quiz',
        'createQuiz',
        {'quiz': quiz},
      );

  _i2.Future<_i4.Question> createQuestion(_i4.Question question) =>
      caller.callServerEndpoint<_i4.Question>(
        'quiz',
        'createQuestion',
        {'question': question},
      );

  _i2.Future<_i3.Quiz?> loadQuiz(int id) =>
      caller.callServerEndpoint<_i3.Quiz?>(
        'quiz',
        'loadQuiz',
        {'id': id},
      );
}

class Client extends _i1.ServerpodClientShared {
  Client(
    String host, {
    dynamic securityContext,
    _i1.AuthenticationKeyManager? authenticationKeyManager,
    Duration? streamingConnectionTimeout,
    Duration? connectionTimeout,
    Function(
      _i1.MethodCallContext,
      Object,
      StackTrace,
    )? onFailedCall,
    Function(_i1.MethodCallContext)? onSucceededCall,
    bool? disconnectStreamsOnLostInternetConnection,
  }) : super(
          host,
          _i5.Protocol(),
          securityContext: securityContext,
          authenticationKeyManager: authenticationKeyManager,
          streamingConnectionTimeout: streamingConnectionTimeout,
          connectionTimeout: connectionTimeout,
          onFailedCall: onFailedCall,
          onSucceededCall: onSucceededCall,
          disconnectStreamsOnLostInternetConnection:
              disconnectStreamsOnLostInternetConnection,
        ) {
    quiz = EndpointQuiz(this);
  }

  late final EndpointQuiz quiz;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {'quiz': quiz};

  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup => {};
}
