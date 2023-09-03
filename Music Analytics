/* In this SQL File, I am querying a database 
to quantify statistics about the music industry. 
*/

-- Selecting all the data in order to verify my table
SELECT *
FROM PortfolioProject..['spotify-data-2023$']

-- Selecting data to identify the top artists by streams
SELECT [artist(s)_name], SUM(streams) artist_streams
FROM PortfolioProject..['spotify-data-2023$']
GROUP BY [artist(s)_name]
ORDER BY artist_streams DESC

-- Creating a CTE of the top songs on Apple Music by ranking on the charts in the year 2023
WITH Apple_Top_Songs (Song, Ranking, Released_Year) AS 
(
	SELECT [track_name] Song, in_apple_charts Ranking, released_year Released_Year
	FROM PortfolioProject..['spotify-data-2023$']
)

SELECT DISTINCT Song, Ranking
FROM Apple_Top_Songs
WHERE Released_Year = 2023
ORDER BY Ranking

-- Creating a CTE of the top songs on Spotify Music by ranking on the charts in the year 2023
WITH Spotify_Top_Songs (Song, Ranking, Released_Year) AS 
(
	SELECT [track_name] Song, in_spotify_charts Ranking, released_year Released_Year
	FROM PortfolioProject..['spotify-data-2023$']
)

SELECT DISTINCT Song, Ranking
FROM Spotify_Top_Songs
WHERE Released_Year = 2023
ORDER BY Ranking

-- Counting the amount of songs that were released in each year 
-- to undertand the changing dynamics of the music industry
SELECT released_year, COUNT(*) soung_count
FROM PortfolioProject..['spotify-data-2023$']
GROUP BY released_year
ORDER BY released_year 

-- Comparing whether or not valence has an affect on the amount of streams 
SELECT [artist(s)_name], SUM(streams) total_streams, ROUND(AVG([valence_%]), 0) avg_valence
FROM PortfolioProject..['spotify-data-2023$']
GROUP BY [artist(s)_name]
ORDER BY total_streams DESC

-- Checking the optimal month for the release of a song based on the amount of streams
SELECT released_month, ROUND(AVG(streams), 0) avg_streams
FROM PortfolioProject..['spotify-data-2023$']
GROUP BY released_month
ORDER BY avg_streams DESC

-- Checking if BPM have an affect on a song's popularity
SELECT bpm, AVG(streams) avg_streams
FROM PortfolioProject..['spotify-data-2023$']
GROUP BY bpm
ORDER BY avg_streams DESC





