-- Create stored procedure ComputeAverageWeightedScoreForUsers
DELIMITER $$

CREATE PROCEDURE ComputeAverageWeightedScoreForUsers()
BEGIN
    -- Declare variables
    DECLARE user_id_val INT;
    DECLARE project_id_val INT;
    DECLARE user_score FLOAT;
    DECLARE total_weighted_score FLOAT;
    DECLARE total_weight FLOAT;
    DECLARE average_score FLOAT;

    -- Declare cursor for iterating over users
    DECLARE user_cursor CURSOR FOR
        SELECT id FROM users;
    
    -- Declare continue handler to exit loop
    DECLARE CONTINUE HANDLER FOR NOT FOUND
        LEAVE user_loop;
    
    -- Create temporary table to store weighted scores
    CREATE TEMPORARY TABLE IF NOT EXISTS temp_weighted_scores (
        user_id INT,
        weighted_score FLOAT
    );

    -- Open cursor
    OPEN user_cursor;

    -- Start loop
    user_loop: LOOP
        -- Fetch user_id
        FETCH user_cursor INTO user_id_val;
        
        -- Exit loop if no more rows
        IF user_id_val IS NULL THEN
            CLOSE user_cursor;
            LEAVE user_loop;
        END IF;

        -- Reset total weighted score and total weight
        SET total_weighted_score = 0;
        SET total_weight = 0;

        -- Declare cursor for iterating over projects
        DECLARE project_cursor CURSOR FOR
            SELECT project_id, score, weight FROM corrections 
            JOIN projects ON corrections.project_id = projects.id
            WHERE user_id = user_id_val;

        -- Declare continue handler to exit loop
        DECLARE CONTINUE HANDLER FOR NOT FOUND
            LEAVE project_loop;

        -- Open cursor
        OPEN project_cursor;

        -- Start loop
        project_loop: LOOP
            -- Fetch project_id, score, and weight
            FETCH project_cursor INTO project_id_val, user_score, total_weight;
            
            -- Exit loop if no more rows
            IF project_id_val IS NULL THEN
                CLOSE project_cursor;
                LEAVE project_loop;
            END IF;

            -- Calculate weighted score
            SET total_weighted_score = total_weighted_score + (user_score * total_weight);
        END LOOP project_loop;

        -- Close project cursor
        CLOSE project_cursor;

        -- Calculate average score
        IF total_weight > 0 THEN
            SET average_score = total_weighted_score / total_weight;
        ELSE
            SET average_score = 0;
        END IF;

        -- Insert average score into temporary table
        INSERT INTO temp_weighted_scores (user_id, weighted_score) VALUES (user_id_val, average_score);
    END LOOP user_loop;

    -- Update users table with computed average scores
    UPDATE users
    JOIN temp_weighted_scores ON users.id = temp_weighted_scores.user_id
    SET users.average_score = temp_weighted_scores.weighted_score;

    -- Drop temporary table
    DROP TEMPORARY TABLE IF EXISTS temp_weighted_scores;
END $$

DELIMITER ;
