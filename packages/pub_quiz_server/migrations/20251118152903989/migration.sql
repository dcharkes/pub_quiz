BEGIN;

--
-- ACTION DROP TABLE
--
DROP TABLE "answer" CASCADE;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "answer" (
    "id" bigserial PRIMARY KEY,
    "questionId" bigint NOT NULL,
    "text" text NOT NULL,
    "correct" boolean NOT NULL
);

--
-- ACTION DROP TABLE
--
DROP TABLE "question" CASCADE;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "question" (
    "id" bigserial PRIMARY KEY,
    "quizId" bigint NOT NULL,
    "question" text NOT NULL
);

--
-- ACTION ALTER TABLE
--
ALTER TABLE "quiz" DROP COLUMN "questions";
--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "answer"
    ADD CONSTRAINT "answer_fk_0"
    FOREIGN KEY("questionId")
    REFERENCES "question"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "question"
    ADD CONSTRAINT "question_fk_0"
    FOREIGN KEY("quizId")
    REFERENCES "quiz"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR pub_quiz
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('pub_quiz', '20251118152903989', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20251118152903989', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();


COMMIT;
