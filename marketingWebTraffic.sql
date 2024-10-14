/* This SQL file contains queries to analyze a company's website traffic 
and quantify key marketing metrics, helping to understand user behavior 
and identify opportunities for improving engagement and conversion rates.
*/

/* Renaming columns to have consistent naming conventions */
ALTER TABLE webTraffic
RENAME COLUMN `Page Views` to pageViews;

ALTER TABLE webTraffic
RENAME COLUMN `Session Duration` to sessionDuration;

ALTER TABLE webTraffic
RENAME COLUMN `Bounce Rate` to bounceRate;

ALTER TABLE webTraffic
RENAME COLUMN `Traffic Source` to trafficSource;

ALTER TABLE webTraffic
RENAME COLUMN `Time on Page` to timeOnPage;

ALTER TABLE webTraffic
RENAME COLUMN `Previous Visits` to previousVisits;

ALTER TABLE webTraffic
RENAME COLUMN `Conversion Rate` to conversionRate;

/* Identifying which traffic source has the average highest conversion rate */
SELECT trafficSource, ROUND(AVG(conversionRate), 4) AS averageConversionRate
FROM webtraffic
GROUP BY trafficSource
ORDER BY 2 DESC;

/* Identifying which group spends more time on the site */
SELECT 
AVG(sessionDuration) AS averageSessionDuration,
CASE 
	WHEN previousVisits = 0 THEN 'New Visitor'
    WHEN previousVisits >= 1 THEN 'Returning Visitor'
    END AS newOrReturningVisitor
FROM webTraffic
GROUP BY 2;

/* Creating CTE in order to find the amount of returning vs new visitors for retention rates */
WITH visitorType AS (
SELECT 
CASE 
	WHEN previousVisits = 0 THEN 'New Visitor'
    WHEN previousVisits >= 1 THEN 'Returning Visitor'
    END AS newOrReturningVisitor
FROM webTraffic
)
SELECT newOrReturningVisitor,
		COUNT(IF(newOrReturningVisitor = 'New Visitor', 1, 0)) AS countOfVisitorType
FROM visitorType
GROUP BY newOrReturningVisitor;

/* Identifying how many pages users visit and how much average time they spend*/
SELECT pageViews, AVG(sessionDuration)
FROM webtraffic
GROUP BY pageViews
ORDER BY 2 DESC;