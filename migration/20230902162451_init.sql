-- +goose Up
-- +goose StatementBegin
DROP TABLE if exists runner_support_job_type CASCADE;

CREATE TABLE runner_support_job_type (
  runner_id integer NOT NULL
  , job_type_id integer NOT NULL
  , CONSTRAINT runner_support_job_type_PKC PRIMARY KEY (runner_id,job_type_id)
) ;
-- +goose StatementEnd

-- +goose Down
-- +goose StatementBegin
SELECT 'down SQL query';
-- +goose StatementEnd
