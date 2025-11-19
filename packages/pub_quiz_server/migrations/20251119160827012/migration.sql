BEGIN;


--
-- MIGRATION VERSION FOR pub_quiz
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('pub_quiz', '20251119160827012', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20251119160827012', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();


COMMIT;
