CREATE TABLE dbss_users (
  id SERIAL PRIMARY KEY,
  user_name TEXT NOT NULL,
  password TEXT NOT NULL,
  date_created TIMESTAMPTZ NOT NULL DEFAULT now(),
  date_modified TIMESTAMPTZ
);

