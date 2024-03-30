-- Task: Create a stored procedure named 'ComputeAverageScoreForUser' that computes and stores the average score for a student.
-- 
-- Requirements:
-- Procedure ComputeAverageScoreForUser is taking 1 input:
-- user_id, a users.id value (you can assume user_id is linked to an existing users)
-- 
DELIMITER $$

CREATE PROCEDURE ComputeAverageScoreForUser (user_id INT)
BEGIN
    UPDATE users 
    SET average_score = (
        SELECT AVG(score)
        FROM corrections
        WHERE user_id = users.id
    )
    WHERE id = user_id;
END $$

DELIMITER ;
