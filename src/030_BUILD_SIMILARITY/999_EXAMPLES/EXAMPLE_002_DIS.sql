

IF OBJECT_ID('tempdb..#DIS') IS NOT NULL
    DROP TABLE #DIS

create table #DIS
(
	names nvarchar(max)
)

insert into #DIS (NAMES)
VALUES 
( 'Ashworth, Spencer')
,( ' Chopra, Hitesh')
,( ' Cole, Jon')
,( ' Howe, William')
,( ' Kelly, Emma')
,( ' Lane, Nicholas')
,( ' Lubbe, Albertus')
,( ' Nairn, Lizzie')
,( ' Sinai Audhy, Shruti')
,( ' Adjei, Ignatius')
,( ' Akinola, Kolapo')
,( ' Aksu, Gokhan')
,( ' Aldington, Zoe')
,( ' Armstrong, Simon')
,( ' Ashworth, Spencer')
,( ' Bargiel Pestana, Joao')
,( ' Beeby, Duncan')
,( ' Berry, James')
,( ' Bhurton, Robin')
,( ' Bolton, Joe')
,( ' Bourtzani, Eirini-Ioann')
,( ' Burgess, James')
,( ' Bux, Suhal')
,( ' Cabey, Jerome')
,( ' Carpenter, Mark')
,( ' Chopra, Hitesh')
,( ' Cole, Jon (UK)')
,( ' Conheady, Holly')
,( ' Cox, Michael')
,( ' Dang, Sally')
,( ' Davies, Robin')
,( ' Dean, Robert')
,( ' Delves, Adam')
,( ' Dias, Griselda')
,( ' Dubey, Parikshit')
,( ' Dudley, Ed')
,( ' Evans, Guy')
,( ' Felicio Monteiro, Andre')
,( ' Gananathan, Janagan')
,( ' Goldfinch, Aaron')
,( ' Golding, Stephen')
,( ' Griffiths, Ed')
,( ' Hall, John')
,( ' Handscombe, Kevin')
,( ' Harris, Neil')
,( ' Harris, Richard')
,( ' Hau, Wai-Hung')
,( ' Hirani, Anum')
,( ' Ho, Crystal')
,( ' Holderness, Jonathan')
,( ' Holmes, Daniel')
,( ' Howe, William')
,( ' Hue, Thomas')
,( ' Hussain, Saghir')
,( ' Johnson, Alexander')
,( ' Kahate, Vishal')
,( ' Kallar, Jaskeerit')
,( ' Kandola, Jas')
,( ' Kaur, Chandan (UK)')
,( ' Kelly, Emma')
,( ' Khadam, Farhan')
,( ' Khurana, Manpreet')
,( ' King, Byron')
,( ' Kinlay, Marcus')
,( ' Kulkarni, Ameya')
,( ' Kumar, Gaurav (UK)')
,( ' Lane, Nicholas')
,( ' Le, Chloe')
,( ' Leach, Jim')
,( ' Leahy, Peter')
,( ' Livings, Simon')
,( ' Lubbe, Albertus')
,( ' Mannan, Maqsud')
,( ' Margetson, Damien')
,( ' Marques, Joao')
,( ' McGourty, Sean')
,( ' Monerawela, Yasantha')
,( ' Moors, Julie-Anne')
,( ' Morao, Javier')
,( ' Mushfique, Natasha')
,( ' Nairn, Lizzie')
,( ' Napier, Niall')
,( ' Powell, Anna')
,( ' Richardson, Gary')
,( ' Ridge, Enda')
,( ' Samuels, Michael')
,( ' Sinai Audhy, Shruti')
,( ' Skassis, Antonios')
,( ' Story, Oliver')
,( ' Stow, Bendell')
,( ' Subramanian, Hariharakumar')
,( ' Taylor, Ben')
,( ' Urbanowski, Adam')
,( ' Vedrine, Willy')
,( ' Vitiello, Petri')
,( ' Vyas, Vinay')
,( ' Wan, Jeffrey')
,( ' Whiteley, Gary')
,( ' Zhou, Ziren')
,( ' Ambler, Rob')
,( ' Benford, Clive')
,( ' Bhimavarapu, Ananth')
,( ' Boston, Oliver')
,( ' Bovey, Richard')
,( ' Brett, Martin')
,( ' Choy, Jonathan')
,( ' Clements, Thomas')
,( ' Devine, Rachel')
,( ' Duvivier, Laurent')
,( ' Ermak, Yusuf')
,( ' Evans, Sarah')
,( ' Everatt, Ruth')
,( ' Figueroa, Amalia')
,( ' Fong, Andy')
,( ' Geels, Mark')
,( ' Goddin, Rachel')
,( ' Grant, Ben')
,( ' Green, Jimmie')
,( ' Gutry, James')
,( ' Harding, Mark')
,( ' Harding, Maxwell')
,( ' Henley, Dan')
,( ' Hirsch, David')
,( ' Husbands, Thomas')
,( ' Ingram, Andrew')
,( ' James, Gerwyn')
,( ' Kennedy, Wayne')
,( ' Kertsos, Georgios')
,( ' Khan, Naziha')
,( ' Krepski, Paul')
,( ' Lee, David')
,( ' Li, Robert')
,( ' Livings, Simon')
,( ' Manning, Nicholas')
,( ' McCann, Ronan')
,( ' Mehta, Pritesh')
,( ' Minsky, Joel')
,( ' Moors, Julie-Anne')
,( ' Morland, Peter')
,( ' Nagpal, Uday')
,( ' Nguyen, Trang')
,( ' O''Mahony, Christopher')
,( ' Propert, James')
,( ' Royde, George')
,( ' Smith, Matthew')
,( ' Srinivasan, Rohit')
,( ' Trapp, Peter')
,( ' Watson, Deborah')
,( ' Weston, Adam (UK)')
,( ' Wilson, Amy')
,( ' Zhang, Liang')
,( ' Zhou, Ziren')
,( 'Thomlinson, John')


IF OBJECT_ID('tempdb..#RESULTS') IS NOT NULL
    DROP TABLE #RESULTS

SELECT 
*
,DENSE_RANK() OVER (PARTITION BY [YOUR NAME] ORDER BY JARO_WINKLER DESC)	AS JARO_WINKLER_RANKING_NEAREST
,DENSE_RANK() OVER (PARTITION BY [YOUR NAME] ORDER BY LEVENSHTEIN DESC)	AS LEVENSHTEIN_RANKING_NEAREST

,DENSE_RANK() OVER (PARTITION BY [YOUR NAME] ORDER BY JARO_WINKLER ASC)	AS JARO_WINKLER_RANKING_FURTHEST
,DENSE_RANK() OVER (PARTITION BY [YOUR NAME] ORDER BY LEVENSHTEIN ASC)	AS LEVENSHTEIN_RANKING_FURTHEST
	INTO	#RESULTS
FROM
(
	SELECT *
	,SIMILARITY_001.Levenshtein([YOUR NAME],[THEIR NAME])	AS LEVENSHTEIN
	,SIMILARITY_001.LevenshteinUnnormalised([YOUR NAME],[THEIR NAME])	AS LEVENSHTEIN_UNNORMALISED
	,SIMILARITY_001.JaroWinkler([YOUR NAME],[THEIR NAME])	AS JARO_WINKLER
	FROM
	(
		SELECT distinct LTRIM(RTRIM(A.NAMES))	AS [YOUR NAME] 
		,LTRIM(RTRIM(B.NAMES))		AS [THEIR NAME]
		FROM #DIS	A
		CROSS JOIN
		#DIS	B
		WHERE LTRIM(RTRIM(A.NAMES))<>LTRIM(RTRIM(B.NAMES))
	)_
)_

SELECT * FROM #RESULTS
where 
JARO_WINKLER_RANKING_NEAREST =1
OR LEVENSHTEIN_RANKING_NEAREST=1
OR JARO_WINKLER_RANKING_FURTHEST =1
OR LEVENSHTEIN_RANKING_FURTHEST=1


SELECT * FROM #RESULTS
WHERE [YOUR NAME] LIKE '%ENDA%'
AND
(LEVENSHTEIN_RANKING_NEAREST<=1
OR JARO_WINKLER_RANKING_NEAREST<=1
OR LEVENSHTEIN_RANKING_FURTHEST<=1
OR JARO_WINKLER_RANKING_FURTHEST<=1

)

SELECT * FROM #RESULTSs
WHERE LEVENSHTEIN_RANKING<=1
OR JARO_WINKLER_RANKING<=1
ORDER BY [YOUR NAME], LEVENSHTEIN_RANKING

