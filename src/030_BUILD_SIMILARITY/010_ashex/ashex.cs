/*
Convert a command line input into a hex represesntation compatible
with sql server
*/
using System;
using System.IO;

namespace AsHex
{
 class Program
 {
  static void Main(string[] args)
  {
   Stream si = Console.OpenStandardInput();
   int theByte = si.ReadByte();
   
   /*This is the SQL Server compatibility bit*/
   Console.Write("0x");
   
   while (theByte != -1)
   {
    Console.Write("{0:X2}", theByte);
    theByte = si.ReadByte();
   }
   si.Close();
  }
 }
}