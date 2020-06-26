--Write a query that will find all user info related to users with a role of BASIC_USER--

-- Solution a --
SELECT * FROM app_user INNER JOIN user_role ON app_user.role_id = user_role.role_id 
WHERE name ='BASIC_USER';


-- Write a statement that will insert a new user into the APP_USER table with a role of PREMIUM_USER --

-- Solution b --
-- Note: Premium_user id =4 --

INSERT INTO app_user (username, password , first_name, last_name , role_id )
VALUES  ('michelXCVI', 'revpass', 'Michel', 'Charles', 4)



-- Write a query that will find all user and study set info related to the user with an id of 4--

-- solution c --

SELECT * FROM app_user INNER JOIN study_set ON user_id = study_set.owner_id 
WHERE user_id = 4;


-- Write a query that will obtain the owner’s username and role name, as well as the category name, questions, and answers of flashcard contained within the study set with an id of 1.--

-- Solution d --
SELECT app_user.username, user_role.name, category.name, flashcard.question, flashcard.answer 
FROM study_set_card
LEFT JOIN flashcard ON study_set_card.flashcard_id = flashcard.flashcard_id
LEFT JOIN category ON flashcard.category_id = category.category_id
LEFT JOIN study_set ON study_set_card.study_set_id = study_set.study_set_id
LEFT JOIN app_user ON app_user.user_id = study_set.owner_id
LEFT JOIN user_role ON user_role.role_id = app_user.role_id
WHERE study_set.study_set_id = 1;

