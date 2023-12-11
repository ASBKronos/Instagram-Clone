# Instagram-Clone
SQL based project on cloning basic functionalities of Instagram using MySQL

This SQL code is used to create the database schema for a simplified Instagram clone, referred to as "Instagram".
Breaking down the code:




Database Creation:

DROP DATABASE IF EXISTS ig_clone;: If a database named "ig_clone" exists, it is dropped to ensure a clean slate.

CREATE DATABASE ig_clone;: Creates a new database named "ig_clone."

USE ig_clone;: Specifies that subsequent SQL statements will be executed in the "ig_clone" database.




Table Creation:

users table: Stores user information with columns for user ID (id), username (username), and creation timestamp (created_at).

photos table: Represents uploaded photos with columns for photo ID (id), image URL (image_url), user ID of the uploader (user_id), and creation timestamp (created_at).

comments table: Holds comments on photos with columns for comment ID (id), comment text (comment_text), photo ID (photo_id), user ID of the commenter (user_id), and creation timestamp (created_at).

likes table: Represents likes on photos with columns for user ID (user_id), photo ID (photo_id), and creation timestamp (created_at). The composite primary key ensures a user can like a photo only once.

follows table: Manages user following relationships with columns for follower ID (follower_id), followee ID (followee_id), and creation timestamp (created_at). The composite primary key ensures a user can follow another user only once.

tags table: Represents tags that can be associated with photos. It includes columns for tag ID (id), tag name (tag_name), and creation timestamp (created_at).

photo_tags table: Establishes a many-to-many relationship between photos and tags. It includes columns for photo ID (photo_id) and tag ID (tag_id), forming a composite primary key.

This schema captures key components of a basic social media platform, allowing users to register, upload photos, comment on photos, like photos, follow other users, and apply tags to photos.
