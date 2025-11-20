BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "game" (
    "id" bigserial PRIMARY KEY,
    "quizId" bigint NOT NULL,
    "currentQuestion" bigint NOT NULL,
    "questionStart" timestamp without time zone NOT NULL,
    "deadline" timestamp without time zone NOT NULL
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "player" (
    "id" bigserial PRIMARY KEY,
    "gameId" bigint NOT NULL,
    "name" text NOT NULL,
    "score" bigint NOT NULL
);

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "game"
    ADD CONSTRAINT "game_fk_0"
    FOREIGN KEY("quizId")
    REFERENCES "quiz"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "player"
    ADD CONSTRAINT "player_fk_0"
    FOREIGN KEY("gameId")
    REFERENCES "game"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR pub_quiz
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('pub_quiz', '20251119141814241', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20251119141814241', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();


COMMIT;
