This project is a C# wrapper and set of SQL Server installation scripts to make the SimMetrics string matching algorithms available in [SQL Server](https://en.wikipedia.org/wiki/Microsoft_SQL_Server). 

* SimMetrics was originally released at [SourceForge](http://sourceforge.net/projects/simmetrics/). This project uses version 1.5 of that library. Subsequent versions were migrated to Java.
* The C# wrapper was inspired by this [blogpost](http://anastasiosyal.com/POST/2009/01/11/18.ASPX)

Descriptions of the supported string fuzzy match functions are provided on the [wiki home page](https://github.com/GuerrillaAnalytics/similarity/wiki).


## Motivation

This project was motivated by the frequent need for fuzzy matching (approximate string matching) algorithms in data analytics and data science work. These algorithms are missing from [SQL Server](https://en.wikipedia.org/wiki/Microsoft_SQL_Server). Many projects do not have the time, licencing, or budget to install additional SQL Server packages such as [SSIS](http://en.wikipedia.org/wiki/SQL_Server_Integration_Services). Furthermore, it is best to do as much data science work as possible through program code rather than manual graphical wizards as outlined in the [Guerrilla Analytics Principles](http://guerrilla-analytics.net/the-principles/). You can read more about Guerrilla Analytics in [the book](http://guerrilla-analytics.net/book/).


## Dependencies
The project has minimal dependencies. 

* C Sharp compiler (csc.exe) version 3.5 to rebuild the project's c sharp files. This may come with your [Microsoft SQL Server](https://en.wikipedia.org/wiki/Microsoft_SQL_Server) installation. 
* [Microsoft SQL Server](https://en.wikipedia.org/wiki/Microsoft_SQL_Server) to install the functions into
* [Apache Ant](https://ant.apache.org/) to build and install the library


## Installation, Configuration, Examples and how to contribute

Installation and configuration are controlled by an [Apache Ant](https://ant.apache.org/) build file. Configure your database settings and you should be good to go. 

Please see the GitHub [wiki page](https://github.com/GuerrillaAnalytics/similarity/wiki) for details.
 

## Simple Code Example

You can find the functions under a schema with the name of the Similarity library version e.g. `Similarity_<Major version>_<minor version>_<patch version>`.

To use these functions in SQL code, simply call the function while specifying its full name. For example:
<code>
SELECT SIMILARITY_1_1_0.Levenshtein('THE QUICK BROWN FOX','THE QUICK FOX')
</code>

For more detailed examples, please see the [Quick Guide](https://github.com/GuerrillaAnalytics/similarity/wiki/Quick-Guide) on the wiki.



## License
This overall project is released under the [GPLv3](http://www.gnu.org/copyleft/gpl.html).

* The SimMetrics library was released under [GPLv2](http://www.gnu.org/licenses/gpl-2.0.html) and can be downloaded from [here](http://sourceforge.net/projects/simmetrics/).
* This project was inspired by a blogpost by Anastasios Yalanopoulos at [http://anastasiosyal.com/](http://anastasiosyal.com/POST/2009/01/11/18.ASPX?). Please see that author's licence terms in associated code files. 

