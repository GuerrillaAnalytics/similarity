/**
* THIS CODE FILE HAS BEEN DERIVED FROM THE ORIGINAL CODE FILE PROVIDED AT:
* http://anastasiosyal.com/POST/2009/01/11/18.ASPX?#stringmetricsinsql
*
* Copyright (c) 2009, Anastasios Yalanopoulos
* All rights reserved.
*
* Redistribution and use in source and binary forms, with or without
* modification, are permitted provided that the following conditions are met:
*     * Redistributions of source code must retain the above copyright
*       notice, this list of conditions and the following disclaimer.
*     * Redistributions in binary form must reproduce the above copyright
*       notice, this list of conditions and the following disclaimer in the
*       documentation and/or other materials provided with the distribution.
*     * Neither the name of the <organization> nor the
*       names of its contributors may be used to endorse or promote products
*       derived from this software without specific prior written permission.
*
* THIS SOFTWARE IS PROVIDED BY Anastasios Yalanopoulos ''AS IS'' AND ANY
* EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
* WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
* DISCLAIMED. IN NO EVENT SHALL <copyright holder> BE LIABLE FOR ANY
* DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
* (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
* LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
* ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
* (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
* SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

*/


/*
ENSURE RUNNING ASSEMBLIES IS ENABLED ON THE DATABASE
*/
EXEC sp_configure'clr enabled', 1
RECONFIGURE


/**
CREATE THE SCHEMA IF IT DOES NOT ALREADY EXIST
*/
DECLARE @sql NVARCHAR(MAX)
SET @sql = 'create schema SIMILARITY_1_1_0'
IF NOT EXISTS (SELECT NAME FROM Sys.Schemas WHERE NAME = 'SIMILARITY_1_1_0')
BEGIN
EXEC sp_executesql @sql 
END 


/**************************************************************************************8
DROP ALL FUNCTIONS IF THEY ALREADY EXIST
*/
IF  EXISTS (SELECT * FROM sys.objects 
WHERE object_id = OBJECT_ID('SIMILARITY_1_1_0.BlockDistance') 
AND type in ('FN', 'IF', 'TF', 'FS', 'FT'))
DROP FUNCTION SIMILARITY_1_1_0.BlockDistance
GO


IF  EXISTS (SELECT * FROM sys.objects 
WHERE object_id = OBJECT_ID('SIMILARITY_1_1_0.ChapmanLengthDeviation') 
AND type in ('FN', 'IF', 'TF', 'FS', 'FT'))
DROP FUNCTION SIMILARITY_1_1_0.ChapmanLengthDeviation
GO

IF  EXISTS (SELECT * FROM sys.objects 
WHERE object_id = OBJECT_ID('SIMILARITY_1_1_0.ChapmanMeanLength') 
AND type in ('FN', 'IF', 'TF', 'FS', 'FT'))
DROP FUNCTION SIMILARITY_1_1_0.ChapmanMeanLength
GO

IF  EXISTS (SELECT * FROM sys.objects 
WHERE object_id = OBJECT_ID('SIMILARITY_1_1_0.CosineSimilarity') 
AND type in ('FN', 'IF', 'TF', 'FS', 'FT'))
DROP FUNCTION SIMILARITY_1_1_0.CosineSimilarity
GO

IF  EXISTS (SELECT * FROM sys.objects 
WHERE object_id = OBJECT_ID('SIMILARITY_1_1_0.DiceSimilarity') 
AND type in ('FN', 'IF', 'TF', 'FS', 'FT'))
DROP FUNCTION SIMILARITY_1_1_0.DiceSimilarity
GO

IF  EXISTS (SELECT * FROM sys.objects 
WHERE object_id = OBJECT_ID('SIMILARITY_1_1_0.EuclideanDistance') 
AND type in ('FN', 'IF', 'TF', 'FS', 'FT'))
DROP FUNCTION SIMILARITY_1_1_0.EuclideanDistance
GO

IF  EXISTS (SELECT * FROM sys.objects 
WHERE object_id = OBJECT_ID('SIMILARITY_1_1_0.JaccardSimilarity') 
AND type in ('FN', 'IF', 'TF', 'FS', 'FT'))
DROP FUNCTION SIMILARITY_1_1_0.JaccardSimilarity
GO

IF  EXISTS (SELECT * FROM sys.objects 
WHERE object_id = OBJECT_ID('SIMILARITY_1_1_0.Jaro') 
AND type in ('FN', 'IF', 'TF', 'FS', 'FT'))
DROP FUNCTION SIMILARITY_1_1_0.Jaro
GO

IF  EXISTS (SELECT * FROM sys.objects 
WHERE object_id = OBJECT_ID('SIMILARITY_1_1_0.JaroWinkler') 
AND type in ('FN', 'IF', 'TF', 'FS', 'FT'))
DROP FUNCTION SIMILARITY_1_1_0.JaroWinkler
GO


IF  EXISTS (SELECT * FROM sys.objects 
WHERE object_id = OBJECT_ID('SIMILARITY_1_1_0.Levenshtein') 
AND type in ('FN', 'IF', 'TF', 'FS', 'FT'))
DROP FUNCTION SIMILARITY_1_1_0.Levenshtein
GO

IF  EXISTS (SELECT * FROM sys.objects 
WHERE object_id = OBJECT_ID('SIMILARITY_1_1_0.LevenshteinUnnormalised') 
AND type in ('FN', 'IF', 'TF', 'FS', 'FT'))
DROP FUNCTION SIMILARITY_1_1_0.LevenshteinUnnormalised
GO

IF  EXISTS (SELECT * FROM sys.objects 
WHERE object_id = OBJECT_ID('SIMILARITY_1_1_0.MatchingCoefficient') 
AND type in ('FN', 'IF', 'TF', 'FS', 'FT'))
DROP FUNCTION SIMILARITY_1_1_0.MatchingCoefficient
GO

IF  EXISTS (SELECT * FROM sys.objects 
WHERE object_id = OBJECT_ID('SIMILARITY_1_1_0.MongeElkan') 
AND type in ('FN', 'IF', 'TF', 'FS', 'FT'))
DROP FUNCTION SIMILARITY_1_1_0.MongeElkan
GO


IF  EXISTS (SELECT * FROM sys.objects 
WHERE object_id = OBJECT_ID('SIMILARITY_1_1_0.NeedlemanWunch') 
AND type in ('FN', 'IF', 'TF', 'FS', 'FT'))
DROP FUNCTION SIMILARITY_1_1_0.NeedlemanWunch
GO

IF  EXISTS (SELECT * FROM sys.objects 
WHERE object_id = OBJECT_ID('SIMILARITY_1_1_0.NeedlemanWunchUnnormalised') 
AND type in ('FN', 'IF', 'TF', 'FS', 'FT'))
DROP FUNCTION SIMILARITY_1_1_0.NeedlemanWunchUnnormalised
GO

IF  EXISTS (SELECT * FROM sys.objects 
WHERE object_id = OBJECT_ID('SIMILARITY_1_1_0.OverlapCoefficient') 
AND type in ('FN', 'IF', 'TF', 'FS', 'FT'))
DROP FUNCTION SIMILARITY_1_1_0.OverlapCoefficient
GO

IF  EXISTS (SELECT * FROM sys.objects 
WHERE object_id = OBJECT_ID('SIMILARITY_1_1_0.QGramsDistance') 
AND type in ('FN', 'IF', 'TF', 'FS', 'FT'))
DROP FUNCTION SIMILARITY_1_1_0.QGramsDistance
GO

IF  EXISTS (SELECT * FROM sys.objects 
WHERE object_id = OBJECT_ID('SIMILARITY_1_1_0.SmithWaterman') 
AND type in ('FN', 'IF', 'TF', 'FS', 'FT'))
DROP FUNCTION SIMILARITY_1_1_0.SmithWaterman
GO


IF  EXISTS (SELECT * FROM sys.objects 
WHERE object_id = OBJECT_ID('SIMILARITY_1_1_0.SmithWatermanGotoh') 
AND type in ('FN', 'IF', 'TF', 'FS', 'FT'))
DROP FUNCTION SIMILARITY_1_1_0.SmithWatermanGotoh
GO

IF  EXISTS (SELECT * FROM sys.objects 
WHERE object_id = OBJECT_ID('SIMILARITY_1_1_0.SmithWatermanGotohWindowedAffine') 
AND type in ('FN', 'IF', 'TF', 'FS', 'FT'))
DROP FUNCTION SIMILARITY_1_1_0.SmithWatermanGotohWindowedAffine
GO

/**
DROP ASSEMBLIES IN REVERSE ORDER OF DEPENDENCIES
*/
IF  EXISTS (SELECT * FROM sys.assemblies asms WHERE asms.name = 'SIMILARITY_1_1_0' and is_user_defined = 1)
DROP ASSEMBLY SIMILARITY_1_1_0
go

IF  EXISTS (SELECT * FROM sys.assemblies asms WHERE asms.name = 'SimMetrics_1.5' and is_user_defined = 1)
DROP ASSEMBLY [SimMetrics_1.5]
GO