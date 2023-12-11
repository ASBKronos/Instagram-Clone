-- 1. Find the 5 oldest users who have been with Instagram since the beginning

SELECT * FROM users
ORDER BY created_at
LIMIT 5;

-- 2. What day of the week do most users register on. We need to figure out when 
-- to run an ad-campaign. 

SELECT COUNT(*), DAYNAME(created_at) FROM users 
GROUP BY DAYNAME(created_at) 
ORDER BY COUNT(*) DESC LIMIT 3;

-- 3. We want to target our inactive users with an e-mail campaign
-- Find the users who have never posted a photo.

SELECT users.username, photos.id FROM users
LEFT JOIN photos ON photos.user_id = users.id
WHERE photos.user_id IS NULL;
 
-- 4. We are running a contest to see who got the most likes on a photo.
-- What is the single most liked photo.  

SELECT photos.id,
photos.image_url,
COUNT(*) AS Number_of_Likes,
users.username
FROM photos
JOIN likes ON likes.photo_id = photos.id
JOIN users ON users.id = photos.user_id 
GROUP BY photos.id
ORDER BY Number_of_Likes DESC LIMIT 1;

-- 5. Our investors want to know how many times does the average user post. 
-- To calculate average number of photos per user. 

SELECT
(SELECT COUNT(*) FROM photos) / (SELECT COUNT(*) FROM users) AS Avg_User_Activity;

-- 6. A brand wants to know which hashtags to use in a post. 
-- What are the top 5 most commonly used hashtags

SELECT count(*) AS most_used_tag,
tag_id,
tag_name 
FROM photo_tags
JOIN tags ON tags.id = photo_tags.tag_id
GROUP BY tag_id
ORDER BY most_used_tag DESC LIMIT 5;

-- 6. We have a small problem of bots on our site. Bots are users who have not posted anything 
-- but have liked every single photo. Find those users

SELECT COUNT(*) AS number_of_likes, users.username FROM users
JOIN likes ON likes.user_id = users.id
GROUP BY likes.user_id
HAVING number_of_likes = (SELECT COUNT(*) FROM photos)
 
