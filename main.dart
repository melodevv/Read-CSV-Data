import 'dart:io';

import 'record.dart';

void main() {
  final dataLines = File('Sample.csv').readAsLinesSync();
  dataLines.removeAt(0);
  List<TradeRec> trades = [];
  // RunThroughFile();
  trades.addAll(Testing(dataLines));

  for (TradeRec trade in trades) {
    trade.PrintRec();
  }
}

List<TradeRec> Testing(var dataLines) {
  List<TradeRec> tradesTaken = [];

  for (var line in dataLines) {
    List<String> dateList;
    final values = line.split(';');

    //
    // Values[2] - entryDate
    // Break the date into year, month and day
    //
    dateList = values[2].split('-');
    //
    // Values[5] - tradeOutcome
    // Remove the $ sign and convert the string to double
    //
    values[5] = values[5].replaceAll(RegExp(r'\$'), ' ');
    values[5] = values[5].replaceAll(RegExp(r','), '.');
    values[5] = values[5].trim();

    //
    // Values[7] - notes
    // Replace empty notes entries with No Entry Recorded
    //
    if (values[6] == ' ') {
      values[6] = 'No Entry Recorded';
    }

    //
    // Add TradeRecord to list
    //
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

void RunThroughFile() {
  // Import file
  final lines = File('Sample.csv').readAsLinesSync();

  // Remove the labels
  lines.removeAt(0);

  for (var line in lines) {
    // The the delimiter
    final values = line.split(';');
    final dateList; // break the date into year, month

    dateList = values[2].split('-');

    // Print Data
    print(dateList);
  }
}
