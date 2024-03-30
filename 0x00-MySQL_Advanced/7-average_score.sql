-- Task: Create a stored procedure named 'ComputeAverageScoreForUser' that computes and stores the average score for a student.
-- 
-- Requirements:
-- Procedure ComputeAverageScoreForUser is taking 1 input:
-- user_id, a users.id value (you can assume user_id is linked to an existing users)
-- 
DELIMITER $$

CREATE PROCEDURE ComputeAverageScoreForUser(
    IN p_user_id INT
)
BEGIN
    DECLARE total_score DECIMAL(10,2);
    DECLARE total_projects INT;
    
    -- Calculate total score for the user
    SELECT SUM(score) INTO total_score
    FROM corrections
    WHERE user_id = p_user_id;
    
    -- Calculate total projects for the user
    SELECT COUNT(*) INTO total_projects
    FROM corrections
    WHERE user_id = p_user_id;
    
    -- Update average score for the user
    IF total_projects > 0 THEN
        UPDATE users
        SET average_score = total_score / total_projects
        WHERE id = p_user_id;
    END IF;
END $$

DELIMITER ;
