#region Copyright
/*
 * The original .NET implementation of the SimMetrics library is taken from the Java
 * source and converted to NET using the Microsoft Java converter.
 * It is notclear who made the initial convertion to .NET.
 * 
 * This updated version has started with the 1.0 .NET release of SimMetrics and used
 * FxCop (http://www.gotdotnet.com/team/fxcop/) to highlight areas where changes needed 
 * to be made to the converted code.
 * 
 * this version with updates Copyright (c) 2006 Chris Parkinson.
 * 
 * For any queries on the .NET version please contact me through the 
 * sourceforge web address.
 * 
 * SimMetrics - SimMetrics is a java library of Similarity or Distance
 * Metrics, e.g. Levenshtein Distance, that provide float based similarity
 * measures between string Data. All metrics return consistant measures
 * rather than unbounded similarity scores.
 *
 * Copyright (C) 2005 Sam Chapman - Open Source Release v1.1
 *
 * Please Feel free to contact me about this library, I would appreciate
 * knowing quickly what you wish to use it for and any criticisms/comments
 * upon the SimMetric library.
 *
 * email:       s.chapman@dcs.shef.ac.uk
 * www:         http://www.dcs.shef.ac.uk/~sam/
 * www:         http://www.dcs.shef.ac.uk/~sam/stringmetrics.html
 *
 * address:     Sam Chapman,
 *              Department of Computer Science,
 *              University of Sheffield,
 *              Sheffield,
 *              S. Yorks,
 *              S1 4DP
 *              United Kingdom,
 *
 * This program is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License as published by the
 * Free Software Foundation; either version 2 of the License, or (at your
 * option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
 * or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
 * for more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with this program; if not, write to the Free Software Foundation, Inc.,
 * 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
 */
#endregion

namespace SimMetricsMetricUtilities {
    using System;
    using SimMetricsApi;
    using SimMetricsUtilities;

    /// <summary>
    /// levenstein implements the levenstein distance function.
    /// </summary>
    [Serializable]
    sealed public class Levenstein : AbstractStringMetric {
        const double defaultPerfectMatchScore = 1.0;
        const double defaultMismatchScore = 0.0;

        /// <summary>
        /// constructor to load dummy Java converter classes only
        /// </summary>
        public Levenstein() {
            dCostFunction = new SubCostRange0To1();
        }

        /// <summary>
        /// the private cost function used in the levenstein distance.
        /// </summary>
        AbstractSubstitutionCost dCostFunction;

        /// <summary>
        /// a constant for calculating the estimated timing cost.
        /// </summary>
        double estimatedTimingConstant = 0.00018F;

        /// <summary>
        /// gets the similarity of the two strings using levenstein distance.
        /// </summary>
        /// <param name="firstWord">first word</param>
        /// <param name="secondWord">second word</param>
        /// <returns>a value between 0-1 of the similarity</returns>
        public override double GetSimilarity(string firstWord, string secondWord) {
            if ((firstWord != null) && (secondWord != null)) {
                double levensteinDistance = GetUnnormalisedSimilarity(firstWord, secondWord);
                double maxLen = firstWord.Length;
                if (maxLen < secondWord.Length) {
                    maxLen = secondWord.Length;
                }
                if (maxLen == defaultMismatchScore) {
                    return defaultPerfectMatchScore;
                }
                else {
                    return defaultPerfectMatchScore - levensteinDistance / maxLen;
                }
            }
            return defaultMismatchScore;
        }

        /// <summary> gets a div class xhtml similarity explaining the operation of the metric.</summary>
        /// <param name="firstWord">string 1</param>
        /// <param name="secondWord">string 2</param>
        /// <returns> a div class html section detailing the metric operation.
        /// </returns>
        public override string GetSimilarityExplained(string firstWord, string secondWord) {
            throw new NotImplementedException();
        }

        /// <summary>
        /// gets the estimated time in milliseconds it takes to perform a similarity timing.
        /// </summary>
        /// <param name="firstWord"></param>                                                  
        /// <param name="secondWord"></param>
        /// <returns>the estimated time in milliseconds taken to perform the similarity measure</returns>
        public override double GetSimilarityTimingEstimated(string firstWord, string secondWord) {
            if ((firstWord != null) && (secondWord != null)) {
                double firstLength = firstWord.Length;
                double secondLength = secondWord.Length;
                return firstLength * secondLength * estimatedTimingConstant;
            }
            return defaultMismatchScore;
        }

        /// <summary> 
        /// gets the un-normalised similarity measure of the metric for the given strings.</summary>
        /// <param name="firstWord"></param>
        /// <param name="secondWord"></param>
        /// <returns> returns the score of the similarity measure (un-normalised)</returns>
        /// <remarks>
        /// <p/>
        /// Copy character from string1 over to string2 (cost 0)
        /// Delete a character in string1 (cost 1)
        /// Insert a character in string2 (cost 1)
        /// Substitute one character for another (cost 1)
        /// <p/>
        /// D(i-1,j-1) + d(si,tj) //subst/copy
        /// D(i,j) = min D(i-1,j)+1 //insert
        /// D(i,j-1)+1 //delete
        /// <p/>
        /// d(i,j) is a function whereby d(c,d)=0 if c=d, 1 else.
        /// </remarks>
        public override double GetUnnormalisedSimilarity(string firstWord, string secondWord) {
            if ((firstWord != null) && (secondWord != null)) {
                // Step 1
                int n = firstWord.Length;
                int m = secondWord.Length;
                if (n == 0) {
                    return m;
                }
                if (m == 0) {
                    return n;
                }

                double[][] d = new double[n + 1][];
                for (int i = 0; i < n + 1; i++) {
                    d[i] = new double[m + 1];
                }

                // Step 2
                for (int i = 0; i <= n; i++) {
                    d[i][0] = i;
                }
                for (int j = 0; j <= m; j++) {
                    d[0][j] = j;
                }

                // Step 3
                for (int i = 1; i <= n; i++) {
                    // Step 4
                    for (int j = 1; j <= m; j++) {
                        // Step 5
                        double cost = dCostFunction.GetCost(firstWord, i - 1, secondWord, j - 1);
                        // Step 6
                        d[i][j] = MathFunctions.MinOf3(d[i - 1][j] + 1.0, d[i][j - 1] + 1.0, d[i - 1][j - 1] + cost);
                    }
                }

                // Step 7
                return d[n][m];
            }
            return 0.0;
        }

        /// <summary>
        /// returns the long string identifier for the metric.
        /// </summary>
        public override string LongDescriptionString { get { return "Implements the basic Levenstein algorithm providing a similarity measure between two strings"; } }

        /// <summary>
        /// returns the string identifier for the metric.
        /// </summary>
        public override string ShortDescriptionString { get { return "Levenstein"; } }
    }
}