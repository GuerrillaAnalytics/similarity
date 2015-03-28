## Synopsis

This project is a C# wrapper and SQL Server installation scripts to make the SimMetrics string matching algorithms available in SQL Server. 
* SimMetrics was originally released at SourceForge http://sourceforge.net/projects/simmetrics/. This project uses version 1.5 of the library. Subsequent versions were migrated to Java.
* The C# wrapper was inspired by the blogpost at http://anastasiosyal.com/POST/2009/01/11/18.ASPX?

## Code Example

The library loads C# assemblies and associated SQL Server functions into a SQL Server database. You can find the functions under a schema with the name of the Similarity library version e.g. `Similarity_<Major version>_<minor version>`.

To use these examples in SQL code, simply call the function while specifying its full name. For example:
<code>
SELECT SIMILARITY_001_00.Levenshtein('THE QUICK BROWN FOX','THE QUICK FOX')
</code>

## Motivation

This project was motivated by the frequent need for fuzzy matching (approximate string matching) algorithms in data analytics work. These algorithms are missing from SQL Server and many projects do not have the time, licencing, or budget to install additional SQL Server packages such as [SSIS](http://en.wikipedia.org/wiki/SQL_Server_Integration_Services). 

## Installation

* Download the source code
* In the root folder of the project, you will find a `BUILD.BAT` file. 
* Edit `BUILD.BAT` as per the instructions within the file. 
* Execute `BUILD.BAT` to compile C# code into a DLL and create a HEX string from the DLL file
* Edit the SQL installation file `1000_DROP_AND_CREATE_ASSEMBLY.SQL` to include the HEX strings created by the Build file. Note the Hex string representation of the DLLs is required because a SQL Server database very often does not have permissions to access your local DLL file.

## API Reference

TODO

## Tests

TODO

## Contributors

Please feel free to get in touch or to contribute to this project. You can find more on the motivation and associated analytics work at www.guerrilla-analytics.net or in the book [Guerrilla Analytics - a practical approach to working with data](http://www.amazon.co.uk/gp/product/0128002182?ie=UTF8&camp=1634&creativeASIN=0128002182&linkCode=xm2&tag=guerrianalyt-21 "Guerrilla Analytics")

## License
* This project is released under the [GPLv3](http://www.gnu.org/copyleft/gpl.html).
* The SimMetrics library was released under [GPLv2](http://www.gnu.org/licenses/gpl-2.0.html) and can be downloaded from [here](http://sourceforge.net/projects/simmetrics/).
* This project was inspired by a blogpost by Anastasios Yalanopoulos at [http://anastasiosyal.com/](http://anastasiosyal.com/POST/2009/01/11/18.ASPX?). Please see licence terms in associated code files. 

