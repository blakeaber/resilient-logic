TRUNCATE programs RESTART IDENTITY;
INSERT INTO programs (program, image_url) VALUES 
    ('Knee', 'https://cdn1.vectorstock.com/i/1000x1000/67/40/knee-pain-thin-line-icon-body-and-sick-leg-ache-vector-25616740.jpg'), 
    ('Hip / Lower Back', 'https://cdn1.vectorstock.com/i/1000x1000/68/90/spine-pain-line-icon-body-and-painful-back-ache-vector-25616890.jpg'), 
    ('Shoulder / Upper Back / Neck', 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSkoB2z-cYAToKvlQRkhPz4rOOO2HpI78t_7qSHf-KS5Wj8_fS8&usqp=CAU');

UPDATE programs SET description='Overall program to address stiffness and immobility.' WHERE program_id=1;
UPDATE programs SET description='Overall program to address stiffness and immobility.' WHERE program_id=2;
UPDATE programs SET description='Overall program to address stiffness and immobility.' WHERE program_id=3;

TRUNCATE exercises RESTART IDENTITY;
INSERT INTO exercises (exercise, video_url, image_url) VALUES 
    ('Couch Stretch From Bench', 'https://vimeo.com/396716727/3a77099c9c', 'https://img.icons8.com/carbon-copy/2x/exercise.png'), 
    ('Couch Stretch From Wall', 'https://vimeo.com/396716828/e25a030140', 'https://img.icons8.com/carbon-copy/2x/exercise.png'),
    ('Alternating Hamstring Bridge', 'https://vimeo.com/396717021/b934096993', 'https://img.icons8.com/carbon-copy/2x/exercise.png'),
    ('Hamstring Bridge With Reach', 'https://vimeo.com/396717021/b934096993', 'https://img.icons8.com/carbon-copy/2x/exercise.png'),
    ('Dynamic Adduction', 'https://vimeo.com/397994291/00d4e9ced2', 'https://img.icons8.com/carbon-copy/2x/exercise.png'),
    ('Hip Shifting With Internal Rotation', 'https://vimeo.com/397994483/a0d6f8f330', 'https://img.icons8.com/carbon-copy/2x/exercise.png'),
    ('Inch Worm', 'https://vimeo.com/399023224/8987beeaf4', 'https://img.icons8.com/carbon-copy/2x/exercise.png'),
    ('Rockback On Elbows', 'https://vimeo.com/397994077/cbb6530d01', 'https://img.icons8.com/carbon-copy/2x/exercise.png'),
    ('Bear Hold', 'https://vimeo.com/401474438/10ea2af790', 'https://img.icons8.com/carbon-copy/2x/exercise.png'),
    ('Trunk Lift With Screwdriver', 'https://vimeo.com/401478869/079662e753', 'https://img.icons8.com/carbon-copy/2x/exercise.png'),
    ('Half Kneeling Windmill', 'https://vimeo.com/399031091/67a4af42ab', 'https://img.icons8.com/carbon-copy/2x/exercise.png');

UPDATE exercises SET description='This description will introduce the user to the exercise with 1) the goal, and 2) what to expect';

UPDATE exercises SET seconds=120, per_side=true WHERE exercise_id=1;
UPDATE exercises SET seconds=120, per_side=true WHERE exercise_id=2;
UPDATE exercises SET sets=2, repetitions=10, per_side=true WHERE exercise_id=3;
UPDATE exercises SET sets=2, fatigue_level=5 WHERE exercise_id=4;
UPDATE exercises SET sets=2, repetitions=20, per_side=true WHERE exercise_id=5;
UPDATE exercises SET sets=2, repetitions=20, per_side=true WHERE exercise_id=6;
UPDATE exercises SET sets=2, repetitions=40, per_side=true WHERE exercise_id=7;
UPDATE exercises SET sets=2, repetitions=4 WHERE exercise_id=8;
UPDATE exercises SET sets=2, fatigue_level=5 WHERE exercise_id=9;
UPDATE exercises SET sets=2, repetitions=10, per_side=true WHERE exercise_id=10;
UPDATE exercises SET sets=2, repetitions=10, per_side=true WHERE exercise_id=11;

TRUNCATE instructions RESTART IDENTITY;
INSERT INTO instructions (instruction) VALUES 
    ('Rear knee as close to foot support as possible'),
    ('Remain upright in the torso without sticking the chest out or pulling the shoulders back'),
    ('Front heel should remain on the ground/don''t come up on toe'),
    ('Place something bt heel and buttock of rear leg as shown in video'),
    ('Can hold something for support to get more upright if needed'),
    ('Hips and knees at 90 degree angle'),
    ('Lower back stays flat and in contact with the floor throughout the exercise'),
    ('Tailbone raises slightly off the ground throughout the exercise'),
    ('Should feel the back of the thigh (hamstring working)'),
    ('Hips and knees at 90 degree angle to start the exercise'),
    ('Lift hips up and down for repetitions until moderately fatigued'),
    ('Should feel back of thighs (hamstrings) working, not lower back muscles'),
    ('Feet remain in contact with wall with hips and knees at 90 degrees'),
    ('Light contact with feet, not pressing hard into wall but feet remain in contact throughout'),
    ('Torso is straight, not arched back or slouched forward/head, shoulder, hip effectively in line'),
    ('If biased, slightly slouched/rounded is better than being arched or extended through spine'),
    ('Head supported by bottom arm'),
    ('Top knee moved back via shifting of hip without spine torso moving too'),
    ('Once top knee is shifted back it remains back (behind the bottom knee) for the duration of the exercise'),
    ('Feet remain in contact with wall but don’t press hard into wall'),
    ('Don’t let heels lose contact with wall'),
    ('Lower back remains flat and tailbone slightly up throughout the exercise'),
    ('Knees should only move up and down, not side to side or forward and back'),
    ('Palms flat'),
    ('Shoulders remain over hands/arms perpendicular to floor'),
    ('Head/neck remain relaxed/don''t shrug or tense the shoulders'),
    ('Elevate hands as needed to keep knees locked and heels flat'),
    ('Butt as close to heels as possible'),
    ('If pain in the knee, place pillows between heel and butt until pain dissipates'),
    ('Shoulders remain down and relaxed (don’t shrug upwards)'),
    ('Head remains down and relaxed'),
    ('Breathe deeply and slowly in through the nose and out through the mouth. Each breath cycle should take about 10s'),
    ('Push elbows and forearms into the floor throughout the breath cycle'),
    ('Arms straight and perpendicular to floor throughout exercise'),
    ('Thighs perpendicular to floor'),
    ('Don’t let lower or upper back sag'),
    ('Don’t shrug shoulders upwards/tense head and neck'),
    ('Do this without any weight unlike what is demonstrated in the video'),
    ('Don’t let top arm get pulled backwards, it should be vertical'),
    ('Keep knees bent and together, the higher up the better'),
    ('Don’t just rotate the wrist but the entire arm'),
    ('Rotating the arm in each direction counts as one repetition'),
    ('Keep front foot flat throughout'),
    ('Palm to floor or elbow to floor depending on flexibility'),
    ('Can use place something on the floor to raise the ground if unable to get palm to floor');

TRUNCATE prompts RESTART IDENTITY;
INSERT INTO prompts (prompt, condition, instruction_id) VALUES
    ('slouch more', 'chest sticks out too much or back arches', NULL),
    ('don''t stick your chest out', 'chest sticks out too much or back arches', NULL),
    ('be tall/long but don''t lean back', 'chest sticks out too much or back arches', NULL),
    ('keep you heel down', 'front heel raises', NULL),
    ('keep your entire foot on the wall without pressing hard', 'heels come off wall', NULL),
    ('straighten your torso and head while slightly slouching at the lower back', 'user deviates from range', NULL),
    ('keep your head straight and support it with your bottom arm', 'head raises to much or slumps over too much', NULL),
    ('return to the start position and don''t shift your knee so far backwards that you have to move through your lower back', 'lower back moves too much', NULL),
    ('don''t let the top knee go forward, keep it shifted back the entire time when squeezing downward', 'knee goes forward when squeezing downward prompt', NULL),   
    ('keep you palms touching the ground', 'somebody supports him/herself on fingertips', NULL),
    ('bring your shoulders over your hands', 'shoulders get to far behind hands (like downward dog in yoga)', NULL),
    ('keep your shoulders down and away from your ears and look slightly down', 'shoulders raise up towards ears or person looks up too much', NULL),
    ('return to the start position and walk your heels up with your knees totally straight. elevate your hands off the ground if it''s too difficult to keep your knees straight.', 'knees bend beyond a couple of degrees', NULL);

UPDATE prompts SET instruction_id=2 WHERE prompt_id=1;
UPDATE prompts SET instruction_id=2 WHERE prompt_id=2;
UPDATE prompts SET instruction_id=2 WHERE prompt_id=3;
UPDATE prompts SET instruction_id=3 WHERE prompt_id=4;
UPDATE prompts SET instruction_id=13 WHERE prompt_id=5;
UPDATE prompts SET instruction_id=15 WHERE prompt_id=6;
UPDATE prompts SET instruction_id=17 WHERE prompt_id=7;
UPDATE prompts SET instruction_id=18 WHERE prompt_id=8;
UPDATE prompts SET instruction_id=19 WHERE prompt_id=9;
UPDATE prompts SET instruction_id=24 WHERE prompt_id=10;
UPDATE prompts SET instruction_id=25 WHERE prompt_id=11;
UPDATE prompts SET instruction_id=26 WHERE prompt_id=12;
UPDATE prompts SET instruction_id=27 WHERE prompt_id=13;

TRUNCATE program_content RESTART IDENTITY;
INSERT INTO program_content (program_id, exercise_id, instruction_id) VALUES
    (1, 1, 1),
    (1, 1, 2),
    (1, 1, 3),
    (1, 1, 4),
    (1, 1, 5),
    (1, 2, 1),
    (1, 2, 2),
    (1, 2, 3),
    (1, 2, 5),
    (1, 3, 6),
    (1, 3, 7),
    (1, 3, 8),
    (1, 3, 9),
    (1, 4, 10),
    (1, 4, 11),
    (1, 4, 12),
    (2, 1, 1),
    (2, 1, 2),
    (2, 1, 3),
    (2, 1, 4),
    (2, 1, 5),
    (2, 2, 1),
    (2, 2, 2),
    (2, 2, 3),
    (2, 2, 5),
    (2, 5, 13),
    (2, 5, 14),
    (2, 5, 15),
    (2, 5, 16),
    (2, 5, 17),
    (2, 5, 18),
    (2, 5, 19),
    (2, 6, 20),
    (2, 6, 21),
    (2, 6, 22),
    (2, 6, 23),
    (2, 7, 24),
    (2, 7, 25),
    (2, 7, 26),
    (2, 7, 27),
    (3, 8, 28),
    (3, 8, 29),
    (3, 8, 30),
    (3, 8, 31),
    (3, 8, 32),
    (3, 8, 33),
    (3, 9, 34),
    (3, 9, 35),
    (3, 9, 36),
    (3, 9, 37),
    (3, 10, 38),
    (3, 10, 39),
    (3, 10, 40),
    (3, 10, 41),
    (3, 10, 42),
    (3, 11, 43),
    (3, 11, 44),
    (3, 11, 45);

UPDATE program_content SET exercise_group=1, difficulty_level=0 WHERE program_id=1 AND exercise_id=1;
UPDATE program_content SET exercise_group=1, difficulty_level=1 WHERE program_id=1 AND exercise_id=2;
UPDATE program_content SET exercise_group=2, difficulty_level=0 WHERE program_id=1 AND exercise_id=3;
UPDATE program_content SET exercise_group=2, difficulty_level=1 WHERE program_id=1 AND exercise_id=4;

UPDATE program_content SET exercise_group=1, difficulty_level=0 WHERE program_id=2 AND exercise_id=1;
UPDATE program_content SET exercise_group=1, difficulty_level=1 WHERE program_id=2 AND exercise_id=2;
UPDATE program_content SET exercise_group=2, difficulty_level=0 WHERE program_id=2 AND exercise_id=5;
UPDATE program_content SET exercise_group=2, difficulty_level=1 WHERE program_id=2 AND exercise_id=6;
UPDATE program_content SET exercise_group=3, difficulty_level=0 WHERE program_id=2 AND exercise_id=7;

UPDATE program_content SET exercise_group=1, difficulty_level=0 WHERE program_id=3 AND exercise_id=8;
UPDATE program_content SET exercise_group=1, difficulty_level=1 WHERE program_id=3 AND exercise_id=9;
UPDATE program_content SET exercise_group=2, difficulty_level=0 WHERE program_id=3 AND exercise_id=10;
UPDATE program_content SET exercise_group=3, difficulty_level=0 WHERE program_id=3 AND exercise_id=11;
