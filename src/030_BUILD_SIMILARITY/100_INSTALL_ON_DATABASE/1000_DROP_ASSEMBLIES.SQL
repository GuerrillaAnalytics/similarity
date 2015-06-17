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
SET @sql = 'create schema SIMILARITY_001_00'
IF NOT EXISTS (SELECT NAME FROM Sys.Schemas WHERE NAME = 'SIMILARITY_001_00')
BEGIN
EXEC sp_executesql @sql 
END 


/**************************************************************************************8
DROP ALL FUNCTIONS IF THEY ALREADY EXIST
*/
IF  EXISTS (SELECT * FROM sys.objects 
WHERE object_id = OBJECT_ID('SIMILARITY_001_00.BlockDistance') 
AND type in ('FN', 'IF', 'TF', 'FS', 'FT'))
DROP FUNCTION SIMILARITY_001_00.BlockDistance
GO


IF  EXISTS (SELECT * FROM sys.objects 
WHERE object_id = OBJECT_ID('SIMILARITY_001_00.ChapmanLengthDeviation') 
AND type in ('FN', 'IF', 'TF', 'FS', 'FT'))
DROP FUNCTION SIMILARITY_001_00.ChapmanLengthDeviation
GO

IF  EXISTS (SELECT * FROM sys.objects 
WHERE object_id = OBJECT_ID('SIMILARITY_001_00.ChapmanMeanLength') 
AND type in ('FN', 'IF', 'TF', 'FS', 'FT'))
DROP FUNCTION SIMILARITY_001_00.ChapmanMeanLength
GO

IF  EXISTS (SELECT * FROM sys.objects 
WHERE object_id = OBJECT_ID('SIMILARITY_001_00.CosineSimilarity') 
AND type in ('FN', 'IF', 'TF', 'FS', 'FT'))
DROP FUNCTION SIMILARITY_001_00.CosineSimilarity
GO

IF  EXISTS (SELECT * FROM sys.objects 
WHERE object_id = OBJECT_ID('SIMILARITY_001_00.DiceSimilarity') 
AND type in ('FN', 'IF', 'TF', 'FS', 'FT'))
DROP FUNCTION SIMILARITY_001_00.DiceSimilarity
GO

IF  EXISTS (SELECT * FROM sys.objects 
WHERE object_id = OBJECT_ID('SIMILARITY_001_00.EuclideanDistance') 
AND type in ('FN', 'IF', 'TF', 'FS', 'FT'))
DROP FUNCTION SIMILARITY_001_00.EuclideanDistance
GO

IF  EXISTS (SELECT * FROM sys.objects 
WHERE object_id = OBJECT_ID('SIMILARITY_001_00.JaccardSimilarity') 
AND type in ('FN', 'IF', 'TF', 'FS', 'FT'))
DROP FUNCTION SIMILARITY_001_00.JaccardSimilarity
GO

IF  EXISTS (SELECT * FROM sys.objects 
WHERE object_id = OBJECT_ID('SIMILARITY_001_00.Jaro') 
AND type in ('FN', 'IF', 'TF', 'FS', 'FT'))
DROP FUNCTION SIMILARITY_001_00.Jaro
GO

IF  EXISTS (SELECT * FROM sys.objects 
WHERE object_id = OBJECT_ID('SIMILARITY_001_00.JaroWinkler') 
AND type in ('FN', 'IF', 'TF', 'FS', 'FT'))
DROP FUNCTION SIMILARITY_001_00.JaroWinkler
GO


IF  EXISTS (SELECT * FROM sys.objects 
WHERE object_id = OBJECT_ID('SIMILARITY_001_00.Levenshtein') 
AND type in ('FN', 'IF', 'TF', 'FS', 'FT'))
DROP FUNCTION SIMILARITY_001_00.Levenshtein
GO

IF  EXISTS (SELECT * FROM sys.objects 
WHERE object_id = OBJECT_ID('SIMILARITY_001_00.LevenshteinUnnormalised') 
AND type in ('FN', 'IF', 'TF', 'FS', 'FT'))
DROP FUNCTION SIMILARITY_001_00.LevenshteinUnnormalised
GO

IF  EXISTS (SELECT * FROM sys.objects 
WHERE object_id = OBJECT_ID('SIMILARITY_001_00.MatchingCoefficient') 
AND type in ('FN', 'IF', 'TF', 'FS', 'FT'))
DROP FUNCTION SIMILARITY_001_00.MatchingCoefficient
GO

IF  EXISTS (SELECT * FROM sys.objects 
WHERE object_id = OBJECT_ID('SIMILARITY_001_00.MongeElkan') 
AND type in ('FN', 'IF', 'TF', 'FS', 'FT'))
DROP FUNCTION SIMILARITY_001_00.MongeElkan
GO


IF  EXISTS (SELECT * FROM sys.objects 
WHERE object_id = OBJECT_ID('SIMILARITY_001_00.NeedlemanWunch') 
AND type in ('FN', 'IF', 'TF', 'FS', 'FT'))
DROP FUNCTION SIMILARITY_001_00.NeedlemanWunch
GO

IF  EXISTS (SELECT * FROM sys.objects 
WHERE object_id = OBJECT_ID('SIMILARITY_001_00.NeedlemanWunchUnnormalised') 
AND type in ('FN', 'IF', 'TF', 'FS', 'FT'))
DROP FUNCTION SIMILARITY_001_00.NeedlemanWunchUnnormalised
GO

IF  EXISTS (SELECT * FROM sys.objects 
WHERE object_id = OBJECT_ID('SIMILARITY_001_00.OverlapCoefficient') 
AND type in ('FN', 'IF', 'TF', 'FS', 'FT'))
DROP FUNCTION SIMILARITY_001_00.OverlapCoefficient
GO

IF  EXISTS (SELECT * FROM sys.objects 
WHERE object_id = OBJECT_ID('SIMILARITY_001_00.QGramsDistance') 
AND type in ('FN', 'IF', 'TF', 'FS', 'FT'))
DROP FUNCTION SIMILARITY_001_00.QGramsDistance
GO

IF  EXISTS (SELECT * FROM sys.objects 
WHERE object_id = OBJECT_ID('SIMILARITY_001_00.SmithWaterman') 
AND type in ('FN', 'IF', 'TF', 'FS', 'FT'))
DROP FUNCTION SIMILARITY_001_00.SmithWaterman
GO


IF  EXISTS (SELECT * FROM sys.objects 
WHERE object_id = OBJECT_ID('SIMILARITY_001_00.SmithWatermanGotoh') 
AND type in ('FN', 'IF', 'TF', 'FS', 'FT'))
DROP FUNCTION SIMILARITY_001_00.SmithWatermanGotoh
GO

IF  EXISTS (SELECT * FROM sys.objects 
WHERE object_id = OBJECT_ID('SIMILARITY_001_00.SmithWatermanGotohWindowedAffine') 
AND type in ('FN', 'IF', 'TF', 'FS', 'FT'))
DROP FUNCTION SIMILARITY_001_00.SmithWatermanGotohWindowedAffine
GO

/**
DROP ASSEMBLIES IN REVERSE ORDER OF DEPENDENCIES
*/
IF  EXISTS (SELECT * FROM sys.assemblies asms WHERE asms.name = 'SIMILARITY_001_00' and is_user_defined = 1)
DROP ASSEMBLY SIMILARITY_001_00
go

IF  EXISTS (SELECT * FROM sys.assemblies asms WHERE asms.name = 'SimMetrics_1.5' and is_user_defined = 1)
DROP ASSEMBLY [SimMetrics_1.5]
GO