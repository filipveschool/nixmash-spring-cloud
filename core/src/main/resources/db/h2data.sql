/*
Navicat MariaDB Data Transfer

Source Server         : mariadb
Source Server Version : 100017
Source Host           : localhost:3306
Source Database       : dev_hibernate

Target Server Type    : MariaDB
Target Server Version : 100017
File Encoding         : 65001

Date: 2015-04-21 17:49:43
*/


/* ------------------------------------------------------------ */
-- Users
/* ------------------------------------------------------------ */

INSERT INTO users (user_id, email, username, password, first_name, last_name, enabled, account_expired, account_locked, credentials_expired, has_avatar, user_key, provider_id)
VALUES
  (1, 'admin@email.com', 'admin', '$2a$10$B9wQFSrr3bfQeUGqxtTDuut1.4YFcA/WFthZaGe1wtb1wgVW./Oiq', 'Admin', 'Jones',
      TRUE, FALSE, FALSE, FALSE, FALSE, '4L4Hr3skHYYMbjkQ', 'SITE');
INSERT INTO users (user_id, email, username, password, first_name, last_name, enabled, account_expired, account_locked, credentials_expired, has_avatar, user_key, provider_id)
VALUES
  (2, 'user@aol.com', 'user', '$2a$10$F2a2W8RtbD99xXd9xtwjbuI4zjSYe04kS.s0FyvQcAIDJfh/6jjLW', 'User', 'Charlie', TRUE,
      FALSE, FALSE, FALSE, FALSE, 'v7jXapyD6fbRyZvi', 'SITE');
INSERT INTO users (user_id, email, username, password, first_name, last_name, enabled, account_expired, account_locked, credentials_expired, has_avatar, user_key, provider_id)
VALUES (3, 'keith@aol.com', 'keith', '$2a$10$F2a2W8RtbD99xXd9xtwjbuI4zjSYe04kS.s0FyvQcAIDJfh/6jjLW', 'Keith', 'Obannon',
           TRUE, FALSE, FALSE, FALSE, FALSE, 'HuoPByrU0hC87gz8', 'SITE');
INSERT INTO users (user_id, email, username, password, first_name, last_name, enabled, account_expired, account_locked, credentials_expired, has_avatar, user_key, provider_id)
VALUES
  (4, 'erwin@aol.com', 'erwin', '$2a$10$F2a2W8RtbD99xXd9xtwjbuI4zjSYe04kS.s0FyvQcAIDJfh/6jjLW', 'Erwin', 'Lapote', TRUE,
      FALSE, FALSE, FALSE, FALSE, 'kSpaxKbYIL0a5Mma', 'SITE');
INSERT INTO users (user_id, email, username, password, first_name, last_name, enabled, account_expired, account_locked, credentials_expired, has_avatar, user_key, provider_id)
VALUES
  (5, 'jeremy@aol.com', 'jeremy', '$2a$10$F2a2W8RtbD99xXd9xtwjbuI4zjSYe04kS.s0FyvQcAIDJfh/6jjLW', 'Jeremy', 'Sloan',
      TRUE, FALSE, FALSE, FALSE, FALSE, 'xt4e25EoFgjx5CP2', 'SITE');
INSERT INTO users (user_id, email, username, password, first_name, last_name, enabled, account_expired, account_locked, credentials_expired, has_avatar, user_key, provider_id)
VALUES
  (6, 'scott@aol.com', 'scott', '$2a$10$F2a2W8RtbD99xXd9xtwjbuI4zjSYe04kS.s0FyvQcAIDJfh/6jjLW', 'Scott', 'Shoenberger',
      TRUE, FALSE, FALSE, FALSE, FALSE, 'Fx05XbWjPFECJZQP', 'SITE');
INSERT INTO users (user_id, email, username, password, first_name, last_name, enabled, account_expired, account_locked, credentials_expired, has_avatar, user_key, provider_id)
VALUES
  (7, 'tommy@aol.com', 'tommy', '$2a$10$F2a2W8RtbD99xXd9xtwjbuI4zjSYe04kS.s0FyvQcAIDJfh/6jjLW', 'Tommy', 'Twotone',
      FALSE, FALSE, FALSE, FALSE, FALSE, 'VYlGwj3HOi665LIa', 'SITE');

-- INSERT INTO user_data (user_id, lastlogin_datetime, created_datetime) VALUES
--   (1, current_timestamp(), current_timestamp());
-- INSERT INTO user_data (user_id, lastlogin_datetime, created_datetime, login_attempts, invited_by_id) VALUES
--   (7, current_timestamp(), current_timestamp(), 2, 0);
--

INSERT INTO user_data (user_id, lastlogin_datetime, created_datetime, login_attempts, invited_by_id) SELECT
                                                                        user_id,
                                                                       current_timestamp,
                                                                        current_timestamp, 0, 0
                                                                      FROM users;

UPDATE user_data
SET login_attempts = 2
WHERE user_id = 7;

/* ------------------------------------------------------------ */
-- Authorities
/* ------------------------------------------------------------ */

INSERT INTO authorities (authority_id, authority, is_locked) VALUES (1, 'ROLE_ADMIN', TRUE);
INSERT INTO authorities (authority_id, authority, is_locked) VALUES (2, 'ROLE_USER', TRUE);
INSERT INTO authorities (authority_id, authority, is_locked) VALUES (3, 'ROLE_POSTS', TRUE);

/* ------------------------------------------------------------ */
-- User_Authorities
/* ------------------------------------------------------------ */

INSERT INTO user_authorities (user_id, authority_id) VALUES (1, 2);
INSERT INTO user_authorities (user_id, authority_id) VALUES (1, 1);
INSERT INTO user_authorities (user_id, authority_id) VALUES (1, 3);
INSERT INTO user_authorities (user_id, authority_id) VALUES (2, 2);
INSERT INTO user_authorities (user_id, authority_id) VALUES (3, 2);
INSERT INTO user_authorities (user_id, authority_id) VALUES (3, 3);
INSERT INTO user_authorities (user_id, authority_id) VALUES (4, 2);
INSERT INTO user_authorities (user_id, authority_id) VALUES (5, 2);
INSERT INTO user_authorities (user_id, authority_id) VALUES (6, 2);
INSERT INTO user_authorities (user_id, authority_id) VALUES (7, 2);


INSERT INTO contacts (contact_id, first_name, last_name, birth_date, email, created_by_user, creation_time, modified_by_user, modification_time, version)
VALUES (1, 'Summer', 'Glass', '1968-08-05', 'vitae@egestasadui.net', 'admin', '2015-09-10 19:18:38.335', 'admin',
        '2015-09-10 19:18:38.335', 0),
  (2, 'Mikayla', 'Church', '1975-04-03', 'lobortis.Class@aliquam.org', 'admin', '2015-09-10 19:18:38.335', 'admin',
   '2015-09-10 19:18:38.335', 0),
  (3, 'Shaine', 'Brooks', '1971-08-24', 'vel.pede@metusVivamuseuismod.edu', 'admin', '2015-09-10 19:18:38.335', 'admin',
   '2015-09-10 19:18:38.335', 0),
  (4, 'Robin', 'Sullivan', '1961-09-09', 'purus.gravida@necleo.edu', 'admin', '2015-09-10 19:18:38.335', 'admin',
   '2015-09-10 19:18:38.335', 0),
  (5, 'Xantha', 'Kim', '1960-08-25', 'risus.Duis.a@velnisl.ca', 'admin', '2015-09-10 19:18:38.335', 'admin',
   '2015-09-10 19:18:38.335', 0),
  (6, 'Barry', 'Kirk', '1982-03-27', 'blandit.at@Maurisblanditenim.com', 'admin', '2015-09-10 19:18:38.335', 'admin',
   '2015-09-10 19:18:38.335', 0),
  (7, 'Tad', 'Robellaboy', '1972-08-08', 'In.lorem.Donec@Vivamusnisi.org', 'admin', '2015-09-10 19:18:38.335', 'admin',
   '2015-09-10 19:18:38.335', 0),
  (8, 'Finn', 'Robertorobo', '1974-05-27', 'aliquet@ornare.net', 'admin', '2015-09-10 19:18:38.335', 'admin',
   '2015-09-10 19:18:38.335', 0),
  (9, 'Ali', 'Calhoun', '1976-11-30', 'fermentum@nulla.co.uk', 'admin', '2015-09-10 19:18:38.335', 'admin',
   '2015-09-10 19:18:38.335', 0),
  (10, 'Alexandra', 'Hendricks', '1973-07-05', 'at.auctor@pellentesquemassalobortis.edu', 'admin',
   '2015-09-10 19:18:38.335', 'admin', '2015-09-10 19:18:38.335', 0);

INSERT INTO site_options (option_id, option_name, option_value) VALUES ('1', 'siteName', 'My Site');
INSERT INTO site_options (option_id, option_name, option_value) VALUES ('2', 'siteDescription', 'My Site Description');
INSERT INTO site_options (option_id, option_name, option_value) VALUES ('3', 'addGoogleAnalytics', 'false');
INSERT INTO site_options (option_id, option_name, option_value)
VALUES ('4', 'googleAnalyticsTrackingId', 'UA-XXXXXX-7');
INSERT INTO site_options (option_id, option_name, option_value) VALUES ('5', 'integerProperty', '1');
INSERT INTO site_options (option_id, option_name, option_value) VALUES ('6', 'userRegistration', 'ADMINISTRATIVE_APPROVAL');

/* ------------------------------------------------------------ */
-- Posts
/* ------------------------------------------------------------ */

-- INSERT INTO posts (post_id, user_id, post_title, post_name, post_link, post_date, post_modified, post_type, display_type, is_published, post_content, post_source, post_image, click_count, likes_count, value_rating, version) VALUES (1, 1, 'Post One Title', 'post-one-title', 'http://nixmash.com/something', '2016-05-31 13:27:47', '2016-05-31 13:28:01', 'LINK', 'LINK', 1, 'Post One Content', 'nixmash.com', null, 0, 0, 0, 0);
-- INSERT INTO posts (post_id, user_id, post_title, post_name, post_link, post_date, post_modified, post_type, display_type, is_published, post_content, post_source, post_image, click_count, likes_count, value_rating, version) VALUES (2, 1, 'Post Two Title', 'post-two-title', 'http://stackoverflow.com/something', '2016-05-31 14:30:45', '2016-05-31 14:30:47', 'LINK', 'LINK', 1, 'Post Two Content', 'stackoverflow.com', null, 0, 0, 0, 0);

-- INSERT INTO posts (post_id, user_id, post_title, post_name, post_link, post_date, post_modified, post_type, display_type, is_published, post_content, post_source, post_image, click_count, likes_count, value_rating, version)
-- VALUES (-1, 3, 'Not Yet Selected', 'not-yet-selected', NULL, '2016-03-28 17:40:18', '2016-03-28 17:40:18', 'POST',
--             'SINGLEPHOTO_POST', 0, 'This is a placemarker post', 'NA', NULL, 0, 0, 0, 0);
INSERT INTO posts (post_id, user_id, post_title, post_name, post_link, post_date, post_modified, post_type, display_type, is_published, post_content, post_source, post_image, click_count, likes_count, value_rating, version)
VALUES (1, 3, 'JavaScript · Bootstrap', 'javascript-bootstrap', 'http://getbootstrap.com/javascript/#carousel',
           '2016-06-06 15:30:34', '2016-06-06 15:30:34', 'LINK', 'LINK', 1,
           'Bootstrap, a sleek, intuitive, and powerful mobile first front-end framework...', 'getbootstrap.com', NULL,
        0, 2, 0, 0);
INSERT INTO posts (post_id, user_id, post_title, post_name, post_link, post_date, post_modified, post_type, display_type, is_published, post_content, post_source, post_image, click_count, likes_count, value_rating, version)
VALUES (2, 3, 'A Java collection of value pairs? (tuples?)', 'a-java-collection-of-value-pairs-tuples',
           'http://stackoverflow.com/questions/521171/a-java-collection-of-value-pairs-tuples', '2016-06-05 15:31:01',
           '2016-06-05 15:31:01', 'LINK', 'LINK_SUMMARY', 1, 'I like how Java has a Map...', 'stackoverflow.com',
        '/images/posts/stackoverflow.png', 0, 2, 0, 0);
INSERT INTO posts (post_id, user_id, post_title, post_name, post_link, post_date, post_modified, post_type, display_type, is_published, post_content, post_source, post_image, click_count, likes_count, value_rating, version)
VALUES (3, 3, 'Jsoup Parsing and Traversing Document and URL - JAVATIPS.INFO',
           'jsoup-parsing-and-traversing-document-and-url-javatips-info',
           'http://javatips.info/jsoup-parsing-and-traversing-document-and-url.html', '2016-06-04 15:31:38',
           '2016-06-04 15:31:38', 'LINK', 'LINK', 1, 'Prerequisites Development environment...', 'javatips.info', NULL,
        0, 1, 0, 0);
INSERT INTO posts (post_id, user_id, post_title, post_name, post_link, post_date, post_modified, post_type, display_type, is_published, post_content, post_source, post_image, click_count, likes_count, value_rating, version)
VALUES (4, 3, 'Content Negotiation using Spring MVC', 'content-negotiation-using-spring-mvc',
           'https://spring.io/blog/2013/05/`/content-negotiation-using-spring-mvc', '2016-06-03 15:32:28',
           '2016-06-03 15:32:28', 'LINK', 'LINK_SUMMARY', 1,
           '<p>There are two ways to generate output using Spring MVC...</p>', 'spring.io', '/images/posts/spring.png',
        0, 0, 0, 0);
INSERT INTO posts (post_id, user_id, post_title, post_name, post_link, post_date, post_modified, post_type, display_type, is_published, post_content, post_source, post_image, click_count, likes_count, value_rating, version)
VALUES (5, 3, 'Variations on JSON Key-Value Pairs in Spring MVC', 'variations-on-json-key-value-pairs-in-spring-mvc',
           'http://nixmash.com/java/variations-on-json-key-value-pairs-in-spring-mvc/', '2016-06-02 15:34:09',
           '2016-06-02 15:34:09', 'LINK', 'LINK_SUMMARY', 1,
           'The topic of this post is pretty lightweight. A bit of a lark, really...', 'nixmash.com',
        'http://nixmash.com/x/blog/2016/jsonpair0528c.png', 0, 0, 0, 0);
INSERT INTO posts (post_id, user_id, post_title, post_name, post_link, post_date, post_modified, post_type, display_type, is_published, post_content, post_source, post_image, click_count, likes_count, value_rating, version)
VALUES
  (6, 3, 'Freestanding Note Post', 'freestanding-note-post', NULL, '2016-06-01 17:40:18', '2016-06-01 17:40:18', 'POST',
      'POST', 1, 'The freestanding Note is a marvelous thing', 'NA', NULL, 0, 0, 0, 0);
INSERT INTO posts (post_id, user_id, post_title, post_name, post_link, post_date, post_modified, post_type, display_type, is_published, post_content, post_source, post_image, click_count, likes_count, value_rating, version)
VALUES (7, 3, '100 Ways To Title Something', '100-ways-to-title-something', NULL, '2016-05-30 17:40:18',
           '2016-05-30 17:40:18', 'POST', 'POST', 1, 'This post title begins with 100', 'NA', NULL, 0, 0, 0, 0);
INSERT INTO posts (post_id, user_id, post_title, post_name, post_link, post_date, post_modified, post_type, display_type, is_published, post_content, post_source, post_image, click_count, likes_count, value_rating, version)
VALUES (8, 3, '200 Ways To Title Something', '200-ways-to-title-something', NULL, '2016-05-29 17:40:18',
           '2016-05-29 17:40:18', 'POST', 'POST', 1, 'This post title begins with 200', 'NA', NULL, 0, 0, 0, 0);
INSERT INTO posts (post_id, user_id, post_title, post_name, post_link, post_date, post_modified, post_type, display_type, is_published, post_content, post_source, post_image, click_count, likes_count, value_rating, version)
VALUES (9, 3, '1000 Ways To Title Something', '1000-ways-to-title-something', NULL, '2016-05-28 17:40:18',
           '2016-05-28 17:40:18', 'POST', 'POST', 1, 'This post title begins with 1000', 'NA', NULL, 0, 0, 0, 0);
INSERT INTO posts (post_id, user_id, post_title, post_name, post_link, post_date, post_modified, post_type, display_type, is_published, post_content, post_source, post_image, click_count, likes_count, value_rating, version)
VALUES (10, 3, 'Solr Rama', 'solr-rama', NULL, '2016-04-20 17:40:18',
            '2016-04-20 17:40:18', 'POST', 'POST', 1,
            '<p><strong>This is a post</strong> for <em>Solr Testing</em></p>', 'NA', NULL, 0, 0, 0, 0);
INSERT INTO posts (post_id, user_id, post_title, post_name, post_link, post_date, post_modified, post_type, display_type, is_published, post_content, post_source, post_image, click_count, likes_count, value_rating, version)
VALUES (11, 3, 'SinglePhoto Post', 'singlephoto-post', NULL, '2016-04-19 17:40:18',
            '2016-04-19 17:40:18', 'POST', 'SINGLEPHOTO_POST', 1,
            '<p><strong>This is a singlephoto post</strong> for <em>RSS Testing</em></p>', 'NA', NULL, 0, 0, 0, 0);
INSERT INTO posts (post_id, user_id, post_title, post_name, post_link, post_date, post_modified, post_type, display_type, is_published, post_content, post_source, post_image, click_count, likes_count, value_rating, version)
VALUES (12, 3, 'MultiPhoto Post', 'multiphoto-post', NULL, '2016-04-18 17:40:18',
            '2016-04-18 17:40:18', 'POST', 'MULTIPHOTO_POST', 1,
            '<p><strong>This is a multiphoto post</strong> for <em>RSS Testing</em></p>', 'NA', NULL, 0, 0, 0, 0);


INSERT INTO tags (tag_id, tag_value) VALUES (1, 'h2tagone');
INSERT INTO tags (tag_id, tag_value) VALUES (2, 'h2tagtwo');
INSERT INTO tags (tag_id, tag_value) VALUES (3, 'h2tagthree');
INSERT INTO tags (tag_id, tag_value) VALUES (4, 'h2tagfour');
INSERT INTO tags (tag_id, tag_value) VALUES (5, 'h2 Tag With Spaces');
INSERT INTO tags (tag_id, tag_value) VALUES (6, 'h2tagsix');

INSERT INTO categories (category_id, category_value, is_active, is_default) VALUES (1, 'Uncategorized', 1, 0);
INSERT INTO categories (category_id, category_value, is_active, is_default) VALUES (2, 'Java', 1, 1);
INSERT INTO categories (category_id, category_value, is_active, is_default) VALUES (3, 'Solr', 1, 0);
INSERT INTO categories (category_id, category_value, is_active, is_default) VALUES (4, 'PHP', 0, 0);
INSERT INTO categories (category_id, category_value, is_active, is_default) VALUES (5, 'Wannabe', 1, 0);
INSERT INTO categories (category_id, category_value, is_active, is_default) VALUES (6, 'Shorttimer', 1, 0);

INSERT INTO post_category_ids (post_category_id, post_id, category_id) VALUES (1, 1, 1);
INSERT INTO post_category_ids (post_category_id, post_id, category_id) VALUES (2, 2, 1);
INSERT INTO post_category_ids (post_category_id, post_id, category_id) VALUES (3, 3, 2);
INSERT INTO post_category_ids (post_category_id, post_id, category_id) VALUES (4, 4, 2);
INSERT INTO post_category_ids (post_category_id, post_id, category_id) VALUES (5, 5, 2);
INSERT INTO post_category_ids (post_category_id, post_id, category_id) VALUES (6, 6, 2);
INSERT INTO post_category_ids (post_category_id, post_id, category_id) VALUES (7, 7, 2);
INSERT INTO post_category_ids (post_category_id, post_id, category_id) VALUES (8, 8, 6);
INSERT INTO post_category_ids (post_category_id, post_id, category_id) VALUES (9, 9, 3);
INSERT INTO post_category_ids (post_category_id, post_id, category_id) VALUES (10, 10, 2);
INSERT INTO post_category_ids (post_category_id, post_id, category_id) VALUES (11, 11, 2);
INSERT INTO post_category_ids (post_category_id, post_id, category_id) VALUES (12, 12, 2);

INSERT INTO post_tag_ids (post_tag_id, post_id, tag_id) VALUES (1, 1, 1);
INSERT INTO post_tag_ids (post_tag_id, post_id, tag_id) VALUES (2, 1, 2);
INSERT INTO post_tag_ids (post_tag_id, post_id, tag_id) VALUES (3, 1, 3);
INSERT INTO post_tag_ids (post_tag_id, post_id, tag_id) VALUES (4, 2, 4);
INSERT INTO post_tag_ids (post_tag_id, post_id, tag_id) VALUES (5, 2, 1);
INSERT INTO post_tag_ids (post_tag_id, post_id, tag_id) VALUES (6, 3, 1);
INSERT INTO post_tag_ids (post_tag_id, post_id, tag_id) VALUES (7, 4, 1);
INSERT INTO post_tag_ids (post_tag_id, post_id, tag_id) VALUES (8, 5, 1);
INSERT INTO post_tag_ids (post_tag_id, post_id, tag_id) VALUES (9, 5, 5);
INSERT INTO post_tag_ids (post_tag_id, post_id, tag_id) VALUES (10, 6, 2);
INSERT INTO post_tag_ids (post_tag_id, post_id, tag_id) VALUES (11, 10, 1);
INSERT INTO post_tag_ids (post_tag_id, post_id, tag_id) VALUES (12, 10, 2);
INSERT INTO post_tag_ids (post_tag_id, post_id, tag_id) VALUES (13, 10, 3);
INSERT INTO post_tag_ids (post_tag_id, post_id, tag_id) VALUES (14, 11, 3);
INSERT INTO post_tag_ids (post_tag_id, post_id, tag_id) VALUES (15, 12, 3);

INSERT INTO user_likes (like_id, user_id, item_id, content_type_id) VALUES (1, 3, 1, 1);
INSERT INTO user_likes (like_id, user_id, item_id, content_type_id) VALUES (2, 3, 2, 1);
INSERT INTO user_likes (like_id, user_id, item_id, content_type_id) VALUES (3, 3, 3, 1);
INSERT INTO user_likes (like_id, user_id, item_id, content_type_id) VALUES (4, 3, 10, 1);
INSERT INTO user_likes (like_id, user_id, item_id, content_type_id) VALUES (5, 2, 1, 1);
INSERT INTO user_likes (like_id, user_id, item_id, content_type_id) VALUES (6, 2, 2, 1);

INSERT INTO post_images (image_id, post_id, image_name, thumbnail_filename, filename, content_type, size, thumbnail_size, datetime_created)
VALUES
  (1, 1, 'WP_000993.jpg', 'f6dea6b8-87bf-42eb-a4b6-4e4c751f0d70-thumbnail.png',
   'f6dea6b8-87bf-42eb-a4b6-4e4c751f0d70.jpg',
   'image/jpeg', 1065071, 53726, '2016-08-03 13:49:09');
INSERT INTO post_images (image_id, post_id, image_name, thumbnail_filename, filename, content_type, size, thumbnail_size, datetime_created)
VALUES
  (2, 1, 'WP_000624.jpg', '49e5d232-56a9-4bf9-a9df-916508a4f540-thumbnail.png',
   '49e5d232-56a9-4bf9-a9df-916508a4f540.jpg',
   'image/jpeg', 580112, 40909, '2016-08-03 13:49:09');
INSERT INTO post_images (image_id, post_id, image_name, thumbnail_filename, filename, content_type, size, thumbnail_size, datetime_created)
VALUES
  (3, 2, 'WP_000931.jpg', '000e045d-781b-4979-9a00-37692f8d33cf-thumbnail.png',
   '000e045d-781b-4979-9a00-37692f8d33cf.jpg',
   'image/jpeg', 908532, 51092, '2016-08-03 14:58:45');
INSERT INTO post_images (image_id, post_id, image_name, thumbnail_filename, filename, content_type, size, thumbnail_size, datetime_created) VALUES (4, 12, 'cats0306b.png', '48e0c504-859a-461d-a400-b7f137149e0c-thumbnail.png', '48e0c504-859a-461d-a400-b7f137149e0c.png', 'image/png', 83704, 12534, '2017-03-08 14:15:51');
INSERT INTO post_images (image_id, post_id, image_name, thumbnail_filename, filename, content_type, size, thumbnail_size, datetime_created) VALUES (5, 12, 'cats0306a.png', 'a51d98b9-db84-43ed-b41d-1e3a2a3c561f-thumbnail.png', 'a51d98b9-db84-43ed-b41d-1e3a2a3c561f.png', 'image/png', 70978, 9372, '2017-03-08 14:15:51');
INSERT INTO post_images (image_id, post_id, image_name, thumbnail_filename, filename, content_type, size, thumbnail_size, datetime_created) VALUES (6, 11, 'shrimp.jpg', '42ac213f-e813-43d6-884e-c083f62b4f59-thumbnail.png', '42ac213f-e813-43d6-884e-c083f62b4f59.jpg', 'image/jpeg', 252122, 38418, '2017-03-08 15:06:07');

INSERT INTO github_stats (forks, stars, subscribers, followers, stat_date) VALUES (20, 100, 25, 18, '2016-12-01');
INSERT INTO github_stats (forks, stars, subscribers, followers, stat_date) VALUES (21, 102, 27, 18, '2016-12-02');
INSERT INTO github_stats (forks, stars, subscribers, followers, stat_date) VALUES (22, 105, 31, 19, '2016-12-03');

insert into post_meta select post_id, 'SUMMARY', '@awesomeblogger', '/x/pics/twitter120x120.jpg', 'na'
                      from posts;

update post_meta set twitter_card = 'SUMMARY_LARGE_IMAGE' where post_id = 10;

update post_meta set twitter_card = 'NONE' where post_id = 9;

INSERT INTO site_images
(site_image_id, image_filename, image_description, image_author, source_url, common_license, banner_image, is_active)
VALUES
  (1, 'churchstreet', 'Church Street', 'BostonTx', 'https://flic.kr/p/RW27MT', 1, 1, 1);
