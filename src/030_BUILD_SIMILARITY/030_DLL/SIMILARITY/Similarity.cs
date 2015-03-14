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

		
        [Microsoft.SqlServer.Server.SqlFunction(IsDeterministic = true, IsPrecise = true)]
        public static SqlDouble CosineSimilarity(SqlString firstWord, SqlString secondWord)
        {
            if (firstWord.IsNull || secondWord.IsNull)
                return 0;

            return new SqlDouble(_CosineSimilarity.GetSimilarity(firstWord.Value, secondWord.Value));
        }
		

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


        [Microsoft.SqlServer.Server.SqlFunction(IsDeterministic = true, IsPrecise = true)]
        public static SqlDouble JaroWinkler(SqlString firstWord, SqlString secondWord)
        {
            if (firstWord.IsNull || secondWord.IsNull)
                return 0;

            return new SqlDouble(_JaroWinkler.GetSimilarity(firstWord.Value, secondWord.Value));
        }
		
		
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

