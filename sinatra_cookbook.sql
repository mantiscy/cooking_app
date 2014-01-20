create table categories (
  id serial4 primary key,
  name varchar(1000) not null
);

create table ingredients (
  id serial4 primary key,
  name varchar(1000) not null
);

create table recipes (
  id serial4 primary key,
  name varchar(1000) not null,
  description text,
  instructions text,
  published_on date,
  category_id integer,
  image varchar(1000),
  serving_size varchar(200)
);

