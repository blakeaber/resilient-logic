-- A program is defined as a sequence of exercises targeting a particular MSK condition.
DROP TABLE IF EXISTS programs;
CREATE TABLE programs (
	program_id SERIAL,
	program VARCHAR(250),
	description VARCHAR(1000),
	image_url VARCHAR(1000)
);

-- Each exercise is defined by a set of instructions, a duration and a difficulty level.
-- The duration of an exercise is defined by the total repetitions, time, or level of exertion required.
DROP TABLE IF EXISTS exercises;
CREATE TABLE exercises (
	exercise_id SERIAL,
	exercise VARCHAR(250),
	description VARCHAR(1000),
	image_url VARCHAR(1000),
	video_url VARCHAR(1000),
	sets INT,
	repetitions INT,
	seconds INT,
	fatigue_level INT,
	per_side BOOLEAN
);

-- Each instruction may (or may not) be associated with a set of prompts to improve movement quality.
DROP TABLE IF EXISTS instructions;
CREATE TABLE instructions (
	instruction_id SERIAL,
	instruction VARCHAR(5000)
);

DROP TABLE IF EXISTS prompts;
CREATE TABLE prompts (
	prompt_id SERIAL,
	prompt VARCHAR(1000),
	condition VARCHAR(1000),
	instruction_id INT
);


DROP TABLE IF EXISTS program_content;
CREATE TABLE program_content (
	program_content_id SERIAL,
	program_id INT,
	exercise_id INT,
	instruction_id INT,
	exercise_group INT,
	difficulty_level DECIMAL
);