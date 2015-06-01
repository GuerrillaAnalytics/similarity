This project is a C# wrapper and set of SQL Server installation scripts to make the SimMetrics string matching algorithms available in [SQL Server](https://en.wikipedia.org/wiki/Microsoft_SQL_Server). 

* SimMetrics was originally released at [SourceForge](http://sourceforge.net/projects/simmetrics/). This project uses version 1.5 of the library. Subsequent versions were migrated to Java.
* The C# wrapper was inspired by this [blogpost](http://anastasiosyal.com/POST/2009/01/11/18.ASPX)

Descriptions of the supported string fuzzy match functions are provided on the [wiki home page](https://github.com/GuerrillaAnalytics/similarity/wiki).


## Motivation

This project was motivated by the frequent need for fuzzy matching (approximate string matching) algorithms in data analytics and data science work. These algorithms are missing from [SQL Server](https://en.wikipedia.org/wiki/Microsoft_SQL_Server) and many projects do not have the time, licencing, or budget to install additional SQL Server packages such as [SSIS](http://en.wikipedia.org/wiki/SQL_Server_Integration_Services). 

## Installation
Installation instructions are provided on the wiki at https://github.com/GuerrillaAnalytics/similarity/wiki/Installation.

## Code Example

The library loads C# assemblies and associated [SQL Server](https://en.wikipedia.org/wiki/Microsoft_SQL_Server) functions into a [SQL Server](https://en.wikipedia.org/wiki/Microsoft_SQL_Server) database. You can find the functions under a schema with the name of the Similarity library version e.g. `Similarity_<Major version>_<minor version>`.

To use these functions in SQL code, simply call the function while specifying its full name. For example:
<code>
SELECT SIMILARITY_001_00.Levenshtein('THE QUICK BROWN FOX','THE QUICK FOX')
</code>

For more detailed examples, please see the [Quick Guide](https://github.com/GuerrillaAnalytics/similarity/wiki/Quick-Guide) on the wiki.

## Contributors

Please feel free to get in touch or to contribute to this project. 

You can find more on the motivation and associated analytics work at http://guerrilla-analytics.net or in the book [Guerrilla Analytics - a practical approach to working with data](http://www.amazon.co.uk/gp/product/0128002182?ie=UTF8&camp=1634&creativeASIN=0128002182&linkCode=xm2&tag=guerrianalyt-21 "Guerrilla Analytics")


## License
This project is released under the [GPLv3](http://www.gnu.org/copyleft/gpl.html).

* The SimMetrics library was released under [GPLv2](http://www.gnu.org/licenses/gpl-2.0.html) and can be downloaded from [here](http://sourceforge.net/projects/simmetrics/).
* This project was inspired by a blogpost by Anastasios Yalanopoulos at [http://anastasiosyal.com/](http://anastasiosyal.com/POST/2009/01/11/18.ASPX?). Please see licence terms in associated code files. 

