import 'dart:io';

import 'record.dart';

void main() {
  List<TradeRec> trades = [];

  // import the Sample.csv file
  final dataLines = File('Sample.csv').readAsLinesSync();

  // Remove the first row of label
  dataLines.removeAt(0);

  // Perform data extraction on the file
  trades.addAll(DataExtraction(dataLines));

  // Run through List<TradeRec> and access the PrintRec() of TradeRec class
  for (TradeRec trade in trades) {
    trade.PrintRec();
  }
}

List<TradeRec> DataExtraction(var dataLines) {
  List<TradeRec> tradesTaken = [];

  for (var line in dataLines) {
    // Variable to break the date into a list with 3 values for Year, Month and Day
    List<String> dateList;

    // Delimiter
    final values = line.split(';');

    // split the date and store it into the list
    dateList = values[2].split('-');

    // Remove the $ sign and trim the white space
    values[5] = values[5].replaceAll(RegExp(r'\$'), ' ');
    values[5] = values[5].replaceAll(RegExp(r','), '.');
    values[5] = values[5].trim();

    // Replace empty notes with No Entry Recorded
    if (values[6] == '') {
      values[6] = 'No Entry Recorded';
    }

    // Create a new TradeRec and add it to a List
    tradesTaken.add(new TradeRec(
        tradeNo: int.parse(values[0]),
        pairName: values[1],
        entryDate: DateTime(int.parse(dateList[0]), int.parse(dateList[1]),
            int.parse(dateList[2])),
        direction: values[3],
        reason: values[4],
        tradeOutcome: double.parse(values[5]),
        notes: values[6]));
  }

  return tradesTaken;
}
