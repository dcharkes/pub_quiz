# Pub Quiz

This repository contains a Pub Quiz application, built with Dart, Serverpod, Flutter, and Jaspr.

## Packages

This is a monorepo containing the following packages:

- `packages/pub_quiz_server`: The Serverpod server for the application. It handles the game logic, database, and communication with the clients.
- `packages/pub_quiz_player`: The Flutter application for the players. Players use this app to join a game and answer questions.
- `packages/pub_quiz_admin`: The web application for the quiz master, built with Jaspr. The admin can create and manage quizzes, and control the flow of the game.
- `packages/pub_quiz_tv`: The Flutter application for the TV/main screen. This app displays the questions, scores, and other game information to all participants.

## Workspace

This project uses a Dart pub workspace. To get all the dependencies for all the packages, run `dart pub get` in the root of the repository.
