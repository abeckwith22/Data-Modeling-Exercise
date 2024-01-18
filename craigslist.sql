-- [*] The region of the craigslist post (San Francisco, Atlanta, Seattle, etc)
-- [*] Users and preferred region
-- [*] Posts: contains title, text, the user who has posted, the location of the posting, the region of the posting.
-- [*] Categories that each post belongs to

DROP DATABASE IF EXISTS craigslist_db;

CREATE DATABASE craigslist_db;

\c craigslist_db

CREATE TABLE regions(
    region_id SERIAL PRIMARY KEY,
    region_name VARCHAR(255) NOT NULL
);
CREATE TABLE categories(
    category_id SERIAL PRIMARY KEY,
    category_name VARCHAR(255) NOT NULL
);
CREATE TABLE users( -- users and preferred region
    user_id SERIAL PRIMARY KEY,
    user_name VARCHAR(255) NOT NULL
    preferred_region INTEGER REFERENCES regions(region_id);
);
CREATE TABLE posts
(
    post_id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL, -- title
    post_description VARCHAR(255) NOT NULL, -- description
    usr_id INTEGER REFERENCES users(user_id), -- user who posted
    post_location VARCHAR(255) NOT NULL, -- location of posting
    reg_id INTEGER REFERENCES regions(region_id), -- the region of the craigslist post
    categ_id INTEGER REFERENCES categories(category_id) NOT NULL -- category of post
);
