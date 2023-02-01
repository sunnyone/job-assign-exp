INSERT INTO job_type (name) VALUES ('linux');
INSERT INTO job_type (name) VALUES ('mac');

INSERT INTO runner (name, priority) VALUES ('linux1', 100);
INSERT INTO runner (name, priority) VALUES ('linux2', 120);
INSERT INTO runner (name, priority) VALUES ('mac1', 100);

INSERT INTO runner_support_job_type (job_type_id, runner_id)
  SELECT (SELECT id FROM job_type WHERE name = 'linux'), (SELECT id FROM runner WHERE name = 'linux1');
INSERT INTO runner_support_job_type (job_type_id, runner_id)
  SELECT (SELECT id FROM job_type WHERE name = 'linux'), (SELECT id FROM runner WHERE name = 'linux2');
INSERT INTO runner_support_job_type (job_type_id, runner_id)
  SELECT (SELECT id FROM job_type WHERE name = 'mac'), (SELECT id FROM runner WHERE name = 'mac1');

INSERT INTO job (name, running_time, job_type_id)
  SELECT 'linux-job1', '[2023-01-01 00:00:00+0000, 2023-01-01 01:00:00+0000)'::tstzrange, (SELECT id FROM job_type WHERE name = 'linux');
INSERT INTO job (name, running_time, job_type_id)
  SELECT 'linux-job2', '[2023-01-01 00:30:00+0000, 2023-01-01 01:30:00+0000)'::tstzrange, (SELECT id FROM job_type WHERE name = 'linux');
INSERT INTO job (name, running_time, job_type_id)
  SELECT 'linux-job3', '[2023-01-01 01:00:00+0000, 2023-01-01 02:00:00+0000)'::tstzrange, (SELECT id FROM job_type WHERE name = 'linux');
INSERT INTO job (name, running_time, job_type_id)
  SELECT 'linux-job4', '[2023-01-01 02:00:00+0000, 2023-01-01 03:00:00+0000)'::tstzrange, (SELECT id FROM job_type WHERE name = 'linux');

INSERT INTO job (name, running_time, job_type_id)
  SELECT 'mac-job1', '[2023-01-01 01:00:00+0000, 2023-01-01 02:00:00+0000)'::tstzrange, (SELECT id FROM job_type WHERE name = 'mac');
INSERT INTO job (name, running_time, job_type_id)
  SELECT 'mac-job2', '[2023-01-01 01:30:00+0000, 2023-01-01 02:30:00+0000)'::tstzrange, (SELECT id FROM job_type WHERE name = 'mac');
