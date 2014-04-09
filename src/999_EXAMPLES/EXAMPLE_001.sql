/**
http://anastasiosyal.com/POST/2009/01/11/18.ASPX?#stringmetricsinsql

*/
IF  EXISTS (SELECT * FROM sys.objects 
WHERE object_id = OBJECT_ID('CompareStringMetrics') 
AND type in ('FN', 'IF', 'TF', 'FS', 'FT'))
DROP FUNCTION CompareStringMetrics
GO

CREATE FUNCTION DBO.CompareStringMetrics(@firstword [nvarchar](255), @secondword [nvarchar](255)) RETURNS TABLE AS RETURN (     
SELECT SIMILARITY_001.Jaro(@firstword, @secondword) as Score, 'Jaro' as Metric
    UNION SELECT SIMILARITY_001.JaroWinkler(@firstword, @secondword), 'JaroWinkler'     
	UNION SELECT SIMILARITY_001.BlockDistance(@firstword, @secondword), 'BlockDistance'     
	UNION SELECT SIMILARITY_001.ChapmanLengthDeviation(@firstword, @secondword), 'ChapmanLengthDeviation'     
	UNION SELECT SIMILARITY_001.ChapmanMeanLength(@firstword, @secondword), 'ChapmanMeanLength'     
	UNION SELECT SIMILARITY_001.CosineSimilarity(@firstword, @secondword), 'CosineSimilarity'     
	UNION SELECT SIMILARITY_001.DiceSimilarity(@firstword, @secondword), 'DiceSimilarity'     
	UNION SELECT SIMILARITY_001.EuclideanDistance(@firstword, @secondword), 'EuclideanDistance'     
	UNION SELECT SIMILARITY_001.JaccardSimilarity(@firstword, @secondword), 'JaccardSimilarity' 
    UNION SELECT SIMILARITY_001.Levenshtein(@firstword, @secondword), 'Levenshtein'     
	UNION SELECT SIMILARITY_001.MatchingCoefficient(@firstword, @secondword), 'MatchingCoefficient'     
	UNION SELECT SIMILARITY_001.MongeElkan(@firstword, @secondword), 'MongeElkan'     
	UNION SELECT SIMILARITY_001.NeedlemanWunch(@firstword, @secondword), 'NeedlemanWunch'     
	UNION SELECT SIMILARITY_001.OverlapCoefficient(@firstword, @secondword), 'OverlapCoefficient'     
	UNION SELECT SIMILARITY_001.QGramsDistance(@firstword, @secondword), 'QGramsDistance'     
	UNION SELECT SIMILARITY_001.SmithWaterman(@firstword, @secondword), 'SmithWaterman'     
	UNION SELECT SIMILARITY_001.SmithWatermanGotoh(@firstword, @secondword), 'SmithWatermanGotoh'     
	UNION SELECT SIMILARITY_001.SmithWatermanGotohWindowedAffine(@firstword, @secondword), 'SmithWatermanGotohWindowedAffine' )
GO

Select * from CompareStringMetrics('Loyds', 'LLoyds') where score > 0.6
Select * from CompareStringMetrics('bristol', 'brighton') where score < 0.5



SELECT SIMILARITY_001.Levenshtein('Enda Ridge', 'John Thomlinson')
SELECT SIMILARITY_001.LevenshteinUnnormalised('Enda', 'Edna')
SELECT SIMILARITY_001.NeedlemanWunch('William', 'Devin')
SELECT SIMILARITY_001.NeedlemanWunchUnnormalised('William', 'Devin')

