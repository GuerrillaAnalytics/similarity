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

using System;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlTypes;
using SimMetricsMetricUtilities;

    public class Similarity
    {

        private static readonly Levenstein _Levenstein;
        private static readonly NeedlemanWunch _NeedlemanWunch;
        private static readonly SmithWaterman _SmithWaterman;
        private static readonly SmithWatermanGotoh _SmithWatermanGotoh;
        private static readonly SmithWatermanGotohWindowedAffine _SmithWatermanGotohWindowedAffine;
        private static readonly Jaro _Jaro;
        private static readonly JaroWinkler _JaroWinkler;
        private static readonly ChapmanLengthDeviation _ChapmanLengthDeviation;
        private static readonly ChapmanMeanLength _ChapmanMeanLength;
        private static readonly QGramsDistance _QGramsDistance;
        private static readonly BlockDistance _BlockDistance;
        private static readonly CosineSimilarity _CosineSimilarity;
        private static readonly DiceSimilarity _DiceSimilarity;
        private static readonly EuclideanDistance _EuclideanDistance;
        private static readonly JaccardSimilarity _JaccardSimilarity;
        private static readonly MatchingCoefficient _MatchingCoefficient;
        private static readonly MongeElkan _MongeElkan;
        private static readonly OverlapCoefficient _OverlapCoefficient;

        static Similarity()
        {
            _Levenstein = new Levenstein();
            _NeedlemanWunch = new NeedlemanWunch();
            _SmithWaterman = new SmithWaterman();
            _SmithWatermanGotoh = new SmithWatermanGotoh();
            _SmithWatermanGotohWindowedAffine = new SmithWatermanGotohWindowedAffine();
            _Jaro = new Jaro();
            _JaroWinkler = new JaroWinkler();
            _ChapmanLengthDeviation = new ChapmanLengthDeviation();
            _ChapmanMeanLength = new ChapmanMeanLength();
            _QGramsDistance = new QGramsDistance();
            _BlockDistance = new BlockDistance();
            _CosineSimilarity = new CosineSimilarity();
            _DiceSimilarity = new DiceSimilarity();
            _EuclideanDistance = new EuclideanDistance();
            _JaccardSimilarity = new JaccardSimilarity();
            _MatchingCoefficient = new MatchingCoefficient();
            _MongeElkan = new MongeElkan();
            _OverlapCoefficient = new OverlapCoefficient();
        }


        [Microsoft.SqlServer.Server.SqlFunction(IsDeterministic = true, IsPrecise = true)]
        public static SqlDouble BlockDistance(SqlString firstWord, SqlString secondWord)
        {
            if (firstWord.IsNull || secondWord.IsNull)
                return 0;

            return new SqlDouble(_BlockDistance.GetSimilarity(firstWord.Value, secondWord.Value));
        }


        [Microsoft.SqlServer.Server.SqlFunction(IsDeterministic = true, IsPrecise = true)]
        public static SqlDouble ChapmanLengthDeviation(SqlString firstWord, SqlString secondWord)
        {
            if (firstWord.IsNull || secondWord.IsNull)
                return 0;

            return new SqlDouble(_ChapmanLengthDeviation.GetSimilarity(firstWord.Value, secondWord.Value));
        }

        [Microsoft.SqlServer.Server.SqlFunction(IsDeterministic = true, IsPrecise = true)]
        public static SqlDouble ChapmanMeanLength(SqlString firstWord, SqlString secondWord)
        {
            if (firstWord.IsNull || secondWord.IsNull)
                return 0;

            return new SqlDouble(_ChapmanMeanLength.GetSimilarity(firstWord.Value, secondWord.Value));
        }

		/**
		<summary>
		Cosine similarity is a measure of similarity between two vectors of an inner product 
		space that measures the cosine of the angle between them. The cosine of 0° is 1, and 
		it is less than 1 for any other angle. It is thus a judgement of orientation and not magnitude: 
		two vectors with the same orientation have a Cosine similarity of 1, two vectors at 90° have a similarity of 0, 
		and two vectors diametrically opposed have a similarity of -1, independent of their magnitude
		SEE http://en.wikipedia.org/wiki/Cosine_similarity
		</summary>
		*/		
        [Microsoft.SqlServer.Server.SqlFunction(IsDeterministic = true, IsPrecise = true)]
        public static SqlDouble CosineSimilarity(SqlString firstWord, SqlString secondWord)
        {
            if (firstWord.IsNull || secondWord.IsNull)
                return 0;

            return new SqlDouble(_CosineSimilarity.GetSimilarity(firstWord.Value, secondWord.Value));
        }
	
		/**
		<summary>
		SEE http://en.wikipedia.org/wiki/S%C3%B8rensen%E2%80%93Dice_coefficient	
		</summary>
		*/
       [Microsoft.SqlServer.Server.SqlFunction(IsDeterministic = true, IsPrecise = true)]
        public static SqlDouble DiceSimilarity(SqlString firstWord, SqlString secondWord)
        {
            if (firstWord.IsNull || secondWord.IsNull)
                return 0;

            return new SqlDouble(_DiceSimilarity.GetSimilarity(firstWord.Value, secondWord.Value));
        }
		
        [Microsoft.SqlServer.Server.SqlFunction(IsDeterministic = true, IsPrecise = true)]
        public static SqlDouble EuclideanDistance(SqlString firstWord, SqlString secondWord)
        {
            if (firstWord.IsNull || secondWord.IsNull)
                return 0;

            return new SqlDouble(_EuclideanDistance.GetSimilarity(firstWord.Value, secondWord.Value));
        }

		/**
		<summary>
		The Jaccard coefficient measures similarity between finite sample sets, 
		and is defined as the size of the intersection divided by the size of the union of the sample sets
		SEE http://en.wikipedia.org/wiki/Jaccard_index
		</summary>
		*/
        [Microsoft.SqlServer.Server.SqlFunction(IsDeterministic = true, IsPrecise = true)]
        public static SqlDouble JaccardSimilarity(SqlString firstWord, SqlString secondWord)
        {
            if (firstWord.IsNull || secondWord.IsNull)
                return 0;

            return new SqlDouble(_JaccardSimilarity.GetSimilarity(firstWord.Value, secondWord.Value));
        }


        [Microsoft.SqlServer.Server.SqlFunction(IsDeterministic = true, IsPrecise = true)]
        public static SqlDouble Jaro(SqlString firstWord, SqlString secondWord)
        {
            if (firstWord.IsNull || secondWord.IsNull)
                return 0;

            return new SqlDouble(_Jaro.GetSimilarity(firstWord.Value, secondWord.Value));
        }

		/**
		<summary>
		In computer science and statistics, the Jaro–Winkler distance (Winkler, 1990) is a measure of similarity between two strings. 
		It is a variant of the Jaro distance metric (Jaro, 1989, 1995), a type of string edit distance, 
		and was developed in the area of record linkage (duplicate detection) (Winkler, 1990). 
		The higher the Jaro–Winkler distance for two strings is, the more similar the strings are. 
		The Jaro–Winkler distance metric is designed and best suited for short strings such as person names. 
		The score is normalized such that 0 equates to no similarity and 1 is an exact match.		
		SEE http://en.wikipedia.org/wiki/Jaro%E2%80%93Winkler_distance
		</summary>
		*/
        [Microsoft.SqlServer.Server.SqlFunction(IsDeterministic = true, IsPrecise = true)]
        public static SqlDouble JaroWinkler(SqlString firstWord, SqlString secondWord)
        {
            if (firstWord.IsNull || secondWord.IsNull)
                return 0;

            return new SqlDouble(_JaroWinkler.GetSimilarity(firstWord.Value, secondWord.Value));
        }
		

		

        [Microsoft.SqlServer.Server.SqlFunction(IsDeterministic = true, IsPrecise = true)]
        public static SqlDouble MatchingCoefficient(SqlString firstWord, SqlString secondWord)
        {
            if (firstWord.IsNull || secondWord.IsNull)
                return 0;

            return new SqlDouble(_MatchingCoefficient.GetSimilarity(firstWord.Value, secondWord.Value));
        }


        [Microsoft.SqlServer.Server.SqlFunction(IsDeterministic = true, IsPrecise = true)]
        public static SqlDouble MongeElkan(SqlString firstWord, SqlString secondWord)
        {
            if (firstWord.IsNull || secondWord.IsNull)
                return 0;

            return new SqlDouble(_MongeElkan.GetSimilarity(firstWord.Value, secondWord.Value));
        }



		/**
		<summary>
		The overlap coefficient (or, Szymkiewicz-Simpson coefficient) is a similarity measure related to 
		the Jaccard index that measures the overlap between two sets, 
		and is defined as the size of the intersection divided by the smaller of the size of the two sets
		SEE http://en.wikipedia.org/wiki/Overlap_coefficient
		</summary>
		*/
        [Microsoft.SqlServer.Server.SqlFunction(IsDeterministic = true, IsPrecise = true)]
        public static SqlDouble OverlapCoefficient(SqlString firstWord, SqlString secondWord)
        {
            if (firstWord.IsNull || secondWord.IsNull)
                return 0;

            return new SqlDouble(_OverlapCoefficient.GetSimilarity(firstWord.Value, secondWord.Value));
        }
		
		
        [Microsoft.SqlServer.Server.SqlFunction(IsDeterministic = true, IsPrecise = true)]
        public static SqlDouble QGramsDistance(SqlString firstWord, SqlString secondWord)
        {
            if (firstWord.IsNull || secondWord.IsNull)
                return 0;

            return new SqlDouble(_QGramsDistance.GetSimilarity(firstWord.Value, secondWord.Value));
        }
	

		/**
		EDIT DISTANCES
		*/
		
		/**
		<summary>
		The Levenshtein distance is a string metric for measuring the difference between two sequences. 
		Informally, the Levenshtein distance between two words is the minimum number of single-character edits 
		(i.e. insertions, deletions or substitutions) required to change one word into the other		
		SEE http://en.wikipedia.org/wiki/Levenshtein_distance
		</summary>
		*/		
        [Microsoft.SqlServer.Server.SqlFunction(IsDeterministic = true, IsPrecise = true)]
        public static SqlDouble Levenshtein(SqlString firstWord, SqlString secondWord)
        {
            if (firstWord.IsNull || secondWord.IsNull)
                return 0;

            return new SqlDouble(_Levenstein.GetSimilarity(firstWord.Value, secondWord.Value));
        }
		
		/// Levenshtein distance unnormalised
        [Microsoft.SqlServer.Server.SqlFunction(IsDeterministic = true, IsPrecise = true)]
        public static SqlDouble LevenshteinUnnormalised(SqlString firstWord, SqlString secondWord)
        {
            if (firstWord.IsNull || secondWord.IsNull)
                return 0;

            return new SqlDouble(_Levenstein.GetUnnormalisedSimilarity(firstWord.Value, secondWord.Value));
        }		
		/**
		<summary>
		NeedlemanWunch Algorithm
		SEE http://en.wikipedia.org/wiki/Needleman%E2%80%93Wunsch_algorithm
		</summary>
		*/
        [Microsoft.SqlServer.Server.SqlFunction(IsDeterministic = true, IsPrecise = true)]
        public static SqlDouble NeedlemanWunch(SqlString firstWord, SqlString secondWord)
        {
            if (firstWord.IsNull || secondWord.IsNull)
                return 0;

            return new SqlDouble(_NeedlemanWunch.GetSimilarity(firstWord.Value, secondWord.Value));
        }

        [Microsoft.SqlServer.Server.SqlFunction(IsDeterministic = true, IsPrecise = true)]
        public static SqlDouble NeedlemanWunchUnnormalised(SqlString firstWord, SqlString secondWord)
        {
            if (firstWord.IsNull || secondWord.IsNull)
                return 0;

            return new SqlDouble(_NeedlemanWunch.GetUnnormalisedSimilarity(firstWord.Value, secondWord.Value));
        }		
		
		
		/**
		<summary>
		The Smith–Waterman algorithm performs local sequence alignment; that is, for determining similar 
		regions between two strings. Instead of looking at the total sequence, the Smith–Waterman algorithm 
		compares segments of all possible lengths and optimizes the similarity measure.
		SEE http://en.wikipedia.org/wiki/Smith%E2%80%93Waterman_algorithm
		</summary>
		*/		
        [Microsoft.SqlServer.Server.SqlFunction(IsDeterministic = true, IsPrecise = true)]
        public static SqlDouble SmithWaterman(SqlString firstWord, SqlString secondWord)
        {
            if (firstWord.IsNull || secondWord.IsNull)
                return 0;

            return new SqlDouble(_SmithWaterman.GetSimilarity(firstWord.Value, secondWord.Value));
        }


        [Microsoft.SqlServer.Server.SqlFunction(IsDeterministic = true, IsPrecise = true)]
        public static SqlDouble SmithWatermanGotoh(SqlString firstWord, SqlString secondWord)
        {
            if (firstWord.IsNull || secondWord.IsNull)
                return 0;

            return new SqlDouble(_SmithWatermanGotoh.GetSimilarity(firstWord.Value, secondWord.Value));
        }


        [Microsoft.SqlServer.Server.SqlFunction(IsDeterministic = true, IsPrecise = true)]
        public static SqlDouble SmithWatermanGotohWindowedAffine(SqlString firstWord, SqlString secondWord)
        {
            if (firstWord.IsNull || secondWord.IsNull)
                return 0;

            return new SqlDouble(_SmithWatermanGotohWindowedAffine.GetSimilarity(firstWord.Value, secondWord.Value));
        }


    }

