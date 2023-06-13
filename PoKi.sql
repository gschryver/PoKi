-- 1. grades stored in the database
/* 1st-5th grade */
--SELECT * FROM grade;

-- 2. emotions associated with a poem stored in the database
/* anger, fear, sadness, joy */
--SELECT * FROM emotion;

-- 3. how many poems are in the database
/* 32842 */
--SELECT COUNT(*) FROM poem;

-- 4. sort authors alphabetically by name. what are the names of the top 76 authors
/* .lilly to abdul */
--SELECT TOP 76 Author.Name from Author ORDER BY Name ASC 

-- 5. using the above query, add the grade level of each author
/* .lilly (2nd grade) to abdul (5th grade) */
--SELECT TOP 76 Author.Name, Grade.Name 
--FROM Grade 
--INNER JOIN Author ON Author.GradeId = Grade.Id 
--ORDER BY Author.Name ASC

-- 6. add gender now
/* .lilly (NA) to abdul (Male) */
--SELECT TOP 76 Author.Name, Gender.Name AS GenderName, Grade.Name AS GradeName
--FROM Author
--INNER JOIN Grade ON Author.GradeId = Grade.Id
--INNER JOIN Gender ON Author.GenderId = Gender.Id
--ORDER BY Author.Name ASC

-- 7. total number of words in all poems in the database
/* 374584 */
--SELECT SUM(WordCount) FROM Poem

-- 8. which poem has the fewest characters
/* jose - 10 chars */
--SELECT TOP 1 Poem.Title, SUM(Poem.CharCount) as Total_Char_Count
--FROM Poem
--GROUP BY Poem.Title
--ORDER BY Total_Char_Count ASC;

-- 9. how many authors are in the third grade
/* 2344 */
--SELECT COUNT(*) FROM Author WHERE GradeId = 3

-- 10. how many total authors are in the first through third grades
/* 4404 */
--SELECT COUNT(*) FROM Author WHERE GradeId BETWEEN 1 AND 3

-- 11. total number of poems written by fourth graders
/* 10806 */
--SELECT COUNT(*) FROM Poem
--INNER JOIN Author ON Poem.AuthorId = Author.Id
--INNER JOIN Grade ON Author.GradeId = Grade.Id
--WHERE Grade.Name = '4th Grade'

-- 12. how many poems are there per grade
/* 1st - 886, 2nd - 3160, 3rd - 6636, 4th - 10806, 5th - 11354 */
--SELECT Grade.Name, COUNT(*) AS PoemCount
--FROM Poem
--INNER JOIN Author ON Poem.AuthorId = Author.Id
--INNER JOIN Grade ON Author.GradeId = Grade.Id
--GROUP BY Grade.Name
--ORDER BY PoemCount ASC

-- 13. how many authors are in each grade? 
/* 1st - 623, 2nd - 1437, 3rd - 2344, 4th - 3288, 5th - 3464 */
--SELECT Grade.Name, COUNT(*) AS AuthorCount
--FROM Author
--INNER JOIN Grade ON Author.GradeId = Grade.Id
--GROUP BY Grade.Name

-- 14. what is the title of the poem that has the most words?
/* My Dog - 2854 */
--SELECT TOP 1 Poem.Title, SUM(Poem.WordCount) as Total_Word_Count
--FROM Poem
--GROUP BY Poem.Title
--ORDER BY Total_Word_Count DESC;

-- 15. which authors have the most poems? 
/* emily, jessica, sarah, ashley, michael, alex, taylor, ryan, matthew, samantha */
--SELECT TOP 10 Author.Name, COUNT(*) AS PoemCount
--FROM Poem
--INNER JOIN Author ON Poem.AuthorId = Author.Id
--GROUP BY Author.Name
--ORDER BY PoemCount DESC

-- 16. how many poems have an emotion of sadness?
/* 14570 */
--SELECT COUNT(*) FROM Poem
--INNER JOIN PoemEmotion ON Poem.Id = PoemEmotion.PoemId
--INNER JOIN Emotion ON PoemEmotion.EmotionId = Emotion.Id
--WHERE Emotion.Name = 'Sadness'

-- 17. how many poems are not associated with any emotion?
/* 3368 */
--SELECT COUNT(*) FROM Poem
--LEFT JOIN PoemEmotion ON Poem.Id = PoemEmotion.PoemId
--WHERE PoemEmotion.PoemId IS NULL

-- 18. which emotion is associated with the least amount of poems
/* anger - 11105 */
--SELECT TOP 1 Emotion.Name, COUNT(*) AS PoemCount
--FROM Poem
--INNER JOIN PoemEmotion ON Poem.Id = PoemEmotion.PoemId
--INNER JOIN Emotion ON PoemEmotion.EmotionId = Emotion.Id
--GROUP BY Emotion.Name
--ORDER BY PoemCount ASC

-- 19. which grade has the largest number of poems with an emotion of joy
/* 5th grade - 8928 */
--SELECT TOP 5 Grade.Name, COUNT(*) AS PoemCount
--FROM Poem
--INNER JOIN Author ON Poem.AuthorId = Author.Id
--INNER JOIN Grade ON Author.GradeId = Grade.Id
--INNER JOIN PoemEmotion ON Poem.Id = PoemEmotion.PoemId
--INNER JOIN Emotion ON PoemEmotion.EmotionId = Emotion.Id
--WHERE Emotion.Name = 'Joy'
--GROUP BY Grade.Name
--ORDER BY PoemCount DESC

-- 20. which gender has the least number of poems with an emotion of fear 
/* ambiguous */
--SELECT TOP 5 Gender.Name, COUNT(*) AS PoemCount
--FROM Poem
--INNER JOIN Author ON Poem.AuthorId = Author.Id
--INNER JOIN Gender ON Author.GenderId = Gender.Id
--INNER JOIN PoemEmotion ON Poem.Id = PoemEmotion.PoemId
--INNER JOIN Emotion ON PoemEmotion.EmotionId = Emotion.Id
--WHERE Emotion.Name = 'Fear'
--GROUP BY Gender.Name
--ORDER BY PoemCount ASC


