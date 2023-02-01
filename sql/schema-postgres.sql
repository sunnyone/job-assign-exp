DROP TABLE if exists runner_support_job_type CASCADE;

CREATE TABLE runner_support_job_type (
  runner_id integer NOT NULL
  , job_type_id integer NOT NULL
  , CONSTRAINT runner_support_job_type_PKC PRIMARY KEY (runner_id,job_type_id)
) ;

DROP TABLE if exists job CASCADE;

CREATE TABLE job (
  id serial NOT NULL
  , name text NOT NULL
  , job_type_id integer NOT NULL
  , running_time tstzrange NOT NULL
  , CONSTRAINT job_PKC PRIMARY KEY (id)
) ;

DROP TABLE if exists job_type CASCADE;

CREATE TABLE job_type (
  id serial NOT NULL
  , name text NOT NULL
  , CONSTRAINT job_type_PKC PRIMARY KEY (id)
) ;

DROP TABLE if exists runner CASCADE;

CREATE TABLE runner (
  id serial NOT NULL
  , name text NOT NULL
  , priority integer NOT NULL
  , CONSTRAINT runner_PKC PRIMARY KEY (id)
) ;

ALTER TABLE runner_support_job_type
  ADD CONSTRAINT runner_support_job_type_FK1 FOREIGN KEY (runner_id) REFERENCES runner(id);

ALTER TABLE runner_support_job_type
  ADD CONSTRAINT runner_support_job_type_FK2 FOREIGN KEY (job_type_id) REFERENCES job_type(id);

ALTER TABLE job
  ADD CONSTRAINT job_FK1 FOREIGN KEY (job_type_id) REFERENCES job_type(id);
