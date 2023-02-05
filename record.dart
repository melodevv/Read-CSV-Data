class TradeRec {
  int _tradeNo = 0;
  String _pairName = '';
  DateTime _entryDate = DateTime.now();
  String _direction = '';
  String _reason = '';
  double _tradeOutcome = 0.0;
  String _notes = '';

  TradeRec(
      {required int tradeNo,
      required String pairName,
      required DateTime entryDate,
      required String direction,
      required String reason,
      required double tradeOutcome,
      required String notes})
      : this._tradeNo = tradeNo,
        this._pairName = pairName,
        this._entryDate = entryDate,
        this._direction = direction,
        this._reason = reason,
        this._tradeOutcome = tradeOutcome,
        this._notes = notes;

  void PrintRec() {
    print('''
Trade No: $_tradeNo
===================
Pair: \t$_pairName
Date Entered: ${_entryDate.year}-${_entryDate.month}-${_entryDate.day}
Direction: $_direction
Reson: \t$_reason
Profit/Lost: \$$_tradeOutcome
Notes: \t$_notes
===================
''');
  }
}
