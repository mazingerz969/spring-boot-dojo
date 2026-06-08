-- Datos demo para ranking y dashboard (Spring Boot Dojo)
-- Password de todos los usuarios demo: demo1234
-- BCrypt hash generado con cost 10

BEGIN;

DELETE FROM belt_progress WHERE user_id IN (
  'sensei_akira', 'dev_maria', 'spring_ninja', 'java_samurai', 'bean_master',
  'boot_pupil', 'jpa_wizard', 'kata_rookie', 'api_guru', 'dojo_newbie'
);

DELETE FROM user_progress WHERE user_id IN (
  'sensei_akira', 'dev_maria', 'spring_ninja', 'java_samurai', 'bean_master',
  'boot_pupil', 'jpa_wizard', 'kata_rookie', 'api_guru', 'dojo_newbie'
);

DELETE FROM users WHERE username IN (
  'sensei_akira', 'dev_maria', 'spring_ninja', 'java_samurai', 'bean_master',
  'boot_pupil', 'jpa_wizard', 'kata_rookie', 'api_guru', 'dojo_newbie'
);

INSERT INTO users (username, email, password, role) VALUES
  ('sensei_akira', 'akira@dojo.demo',   '$2b$10$0HK5dVZVVUNQVan9xHK1jOArV6BxNUqBudmqle/dVSctL/0lKcm/K', 'USER'),
  ('dev_maria',    'maria@dojo.demo',   '$2b$10$0HK5dVZVVUNQVan9xHK1jOArV6BxNUqBudmqle/dVSctL/0lKcm/K', 'USER'),
  ('spring_ninja', 'ninja@dojo.demo',   '$2b$10$0HK5dVZVVUNQVan9xHK1jOArV6BxNUqBudmqle/dVSctL/0lKcm/K', 'USER'),
  ('java_samurai', 'samurai@dojo.demo', '$2b$10$0HK5dVZVVUNQVan9xHK1jOArV6BxNUqBudmqle/dVSctL/0lKcm/K', 'USER'),
  ('bean_master',  'bean@dojo.demo',    '$2b$10$0HK5dVZVVUNQVan9xHK1jOArV6BxNUqBudmqle/dVSctL/0lKcm/K', 'USER'),
  ('boot_pupil',   'pupil@dojo.demo',   '$2b$10$0HK5dVZVVUNQVan9xHK1jOArV6BxNUqBudmqle/dVSctL/0lKcm/K', 'USER'),
  ('jpa_wizard',   'wizard@dojo.demo',  '$2b$10$0HK5dVZVVUNQVan9xHK1jOArV6BxNUqBudmqle/dVSctL/0lKcm/K', 'USER'),
  ('kata_rookie',  'rookie@dojo.demo',  '$2b$10$0HK5dVZVVUNQVan9xHK1jOArV6BxNUqBudmqle/dVSctL/0lKcm/K', 'USER'),
  ('api_guru',     'guru@dojo.demo',    '$2b$10$0HK5dVZVVUNQVan9xHK1jOArV6BxNUqBudmqle/dVSctL/0lKcm/K', 'USER'),
  ('dojo_newbie',  'newbie@dojo.demo',  '$2b$10$0HK5dVZVVUNQVan9xHK1jOArV6BxNUqBudmqle/dVSctL/0lKcm/K', 'USER');

INSERT INTO user_progress (user_id, total_correct, total_attempted, current_streak, best_streak, last_study_date) VALUES
  ('sensei_akira', 178, 200, 12, 21, CURRENT_DATE),
  ('dev_maria',    165, 185,  9, 18, CURRENT_DATE),
  ('spring_ninja', 148, 170,  7, 15, CURRENT_DATE),
  ('java_samurai', 132, 155,  5, 11, CURRENT_DATE - 1),
  ('bean_master',  115, 130, 10, 10, CURRENT_DATE),
  ('boot_pupil',    98, 120,  4,  8, CURRENT_DATE),
  ('jpa_wizard',    89, 110,  3,  9, CURRENT_DATE - 2),
  ('kata_rookie',   76,  95,  2,  6, CURRENT_DATE),
  ('api_guru',      64,  85,  1,  5, CURRENT_DATE - 1),
  ('dojo_newbie',   52,  75,  1,  3, CURRENT_DATE);

INSERT INTO belt_progress (user_id, belt_level, correct_count, attempt_count, mastered) VALUES
  ('sensei_akira', 'BLANCO',   14, 15, true),
  ('sensei_akira', 'AMARILLO', 16, 18, true),
  ('sensei_akira', 'NARANJA',  15, 17, true),
  ('sensei_akira', 'VERDE',    14, 16, true),
  ('sensei_akira', 'MARRON',   13, 15, true),
  ('sensei_akira', 'NEGRO',    12, 14, true),
  ('dev_maria',    'BLANCO',   13, 14, true),
  ('dev_maria',    'AMARILLO', 14, 16, true),
  ('dev_maria',    'NARANJA',  13, 15, true),
  ('dev_maria',    'VERDE',    12, 14, true),
  ('dev_maria',    'MARRON',   11, 13, true),
  ('spring_ninja', 'BLANCO',   12, 13, true),
  ('spring_ninja', 'AMARILLO', 13, 15, true),
  ('spring_ninja', 'NARANJA',  12, 14, true),
  ('spring_ninja', 'VERDE',    11, 13, true),
  ('java_samurai', 'BLANCO',   11, 12, true),
  ('java_samurai', 'AMARILLO', 12, 14, true),
  ('java_samurai', 'NARANJA',  10, 12, true),
  ('bean_master',  'BLANCO',   10, 11, true),
  ('bean_master',  'AMARILLO', 11, 13, true),
  ('bean_master',  'NARANJA',   8, 10, true),
  ('boot_pupil',   'BLANCO',   10, 12, true),
  ('boot_pupil',   'AMARILLO',  9, 11, true),
  ('jpa_wizard',   'BLANCO',    9, 10, true),
  ('jpa_wizard',   'AMARILLO',  8, 10, true),
  ('kata_rookie',  'BLANCO',    9, 11, true),
  ('api_guru',     'BLANCO',    8, 10, true);

COMMIT;
