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
import 'package:pub_quiz_client/src/protocol/game_event.dart' as _i3;
import 'package:pub_quiz_client/src/protocol/player.dart' as _i4;
import 'package:pub_quiz_client/src/protocol/game_result.dart' as _i5;
import 'package:pub_quiz_client/src/protocol/live_question.dart' as _i6;
import 'package:pub_quiz_client/src/protocol/quiz.dart' as _i7;
import 'protocol.dart' as _i8;

/// {@category Endpoint}
class EndpointGame extends _i1.EndpointRef {
  EndpointGame(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'game';

  _i2.Future<int> startGame(int quizId) => caller.callServerEndpoint<int>(
        'game',
        'startGame',
        {'quizId': quizId},
      );

  _i2.Stream<_i3.GameEvent> getGameEvents(int gameId) =>
      caller.callStreamingServerEndpoint<_i2.Stream<_i3.GameEvent>,
          _i3.GameEvent>(
        'game',
        'getGameEvents',
        {'gameId': gameId},
        {},
      );

  _i2.Stream<_i4.Player> getPlayers(int gameId) =>
      caller.callStreamingServerEndpoint<_i2.Stream<_i4.Player>, _i4.Player>(
        'game',
        'getPlayers',
        {'gameId': gameId},
        {},
      );

  _i2.Future<void> setQuestion(
    int gameId,
    int questionIndex,
    Duration duration,
  ) =>
      caller.callServerEndpoint<void>(
        'game',
        'setQuestion',
        {
          'gameId': gameId,
          'questionIndex': questionIndex,
          'duration': duration,
        },
      );

  _i2.Future<_i5.GameResult> finishGame(int gameId) =>
      caller.callServerEndpoint<_i5.GameResult>(
        'game',
        'finishGame',
        {'gameId': gameId},
      );
}

/// {@category Endpoint}
class EndpointPlayer extends _i1.EndpointRef {
  EndpointPlayer(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'player';

  _i2.Future<int> joinGame(
    int gameId,
    String name,
  ) =>
      caller.callServerEndpoint<int>(
        'player',
        'joinGame',
        {
          'gameId': gameId,
          'name': name,
        },
      );

  _i2.Future<int> recordAnswer(
    int playerId,
    int questionIndex,
    int answerIndex,
    DateTime answerTime,
  ) =>
      caller.callServerEndpoint<int>(
        'player',
        'recordAnswer',
        {
          'playerId': playerId,
          'questionIndex': questionIndex,
          'answerIndex': answerIndex,
          'answerTime': answerTime,
        },
      );

  _i2.Stream<_i6.LiveQuestion> getQuestions(int gameId) =>
      caller.callStreamingServerEndpoint<_i2.Stream<_i6.LiveQuestion>,
          _i6.LiveQuestion>(
        'player',
        'getQuestions',
        {'gameId': gameId},
        {},
      );

  _i2.Future<_i5.GameResult> getResults(int gameId) =>
      caller.callServerEndpoint<_i5.GameResult>(
        'player',
        'getResults',
        {'gameId': gameId},
      );
}

/// {@category Endpoint}
class EndpointQuiz extends _i1.EndpointRef {
  EndpointQuiz(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'quiz';

  _i2.Future<_i7.Quiz> createQuiz(_i7.Quiz quiz) =>
      caller.callServerEndpoint<_i7.Quiz>(
        'quiz',
        'createQuiz',
        {'quiz': quiz},
      );

  _i2.Future<_i7.Quiz?> readQuiz(int id) =>
      caller.callServerEndpoint<_i7.Quiz?>(
        'quiz',
        'readQuiz',
        {'id': id},
      );

  _i2.Future<List<_i7.Quiz>> readQuizzes() =>
      caller.callServerEndpoint<List<_i7.Quiz>>(
        'quiz',
        'readQuizzes',
        {},
      );

  _i2.Future<_i7.Quiz> updateQuiz(_i7.Quiz quiz) =>
      caller.callServerEndpoint<_i7.Quiz>(
        'quiz',
        'updateQuiz',
        {'quiz': quiz},
      );

  _i2.Future<void> deleteQuiz(_i7.Quiz quiz) => caller.callServerEndpoint<void>(
        'quiz',
        'deleteQuiz',
        {'quiz': quiz},
      );

  _i2.Future<_i7.Quiz> generateQuiz({
    required int numberOfQuestions,
    required String style,
    required String topic,
  }) =>
      caller.callServerEndpoint<_i7.Quiz>(
        'quiz',
        'generateQuiz',
        {
          'numberOfQuestions': numberOfQuestions,
          'style': style,
          'topic': topic,
        },
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
          _i8.Protocol(),
          securityContext: securityContext,
          authenticationKeyManager: authenticationKeyManager,
          streamingConnectionTimeout: streamingConnectionTimeout,
          connectionTimeout: connectionTimeout,
          onFailedCall: onFailedCall,
          onSucceededCall: onSucceededCall,
          disconnectStreamsOnLostInternetConnection:
              disconnectStreamsOnLostInternetConnection,
        ) {
    game = EndpointGame(this);
    player = EndpointPlayer(this);
    quiz = EndpointQuiz(this);
  }

  late final EndpointGame game;

  late final EndpointPlayer player;

  late final EndpointQuiz quiz;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
        'game': game,
        'player': player,
        'quiz': quiz,
      };

  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup => {};
}
