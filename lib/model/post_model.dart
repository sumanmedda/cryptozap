class PostModel {
  String? symbol;
  String? priceChange;
  String? priceChangePercent;
  String? weightedAvgPrice;
  String? prevClosePrice;
  String? lastPrice;
  String? lastQty;
  String? bidPrice;
  String? bidQty;
  String? askPrice;
  String? askQty;
  String? openPrice;
  String? highPrice;
  String? lowPrice;
  String? volume;
  String? quoteVolume;
  int? openTime;
  int? closeTime;
  int? firstId;
  int? lastId;
  int? count;

  PostModel(
      {this.symbol,
      this.priceChange,
      this.priceChangePercent,
      this.weightedAvgPrice,
      this.prevClosePrice,
      this.lastPrice,
      this.lastQty,
      this.bidPrice,
      this.bidQty,
      this.askPrice,
      this.askQty,
      this.openPrice,
      this.highPrice,
      this.lowPrice,
      this.volume,
      this.quoteVolume,
      this.openTime,
      this.closeTime,
      this.firstId,
      this.lastId,
      this.count});

  PostModel.fromJson(Map<String, dynamic> json) {
    symbol = json['symbol'];
    priceChange = json['priceChange'];
    priceChangePercent = json['priceChangePercent'];
    weightedAvgPrice = json['weightedAvgPrice'];
    prevClosePrice = json['prevClosePrice'];
    lastPrice = json['lastPrice'];
    lastQty = json['lastQty'];
    bidPrice = json['bidPrice'];
    bidQty = json['bidQty'];
    askPrice = json['askPrice'];
    askQty = json['askQty'];
    openPrice = json['openPrice'];
    highPrice = json['highPrice'];
    lowPrice = json['lowPrice'];
    volume = json['volume'];
    quoteVolume = json['quoteVolume'];
    openTime = json['openTime'];
    closeTime = json['closeTime'];
    firstId = json['firstId'];
    lastId = json['lastId'];
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['symbol'] = symbol;
    data['priceChange'] = priceChange;
    data['priceChangePercent'] = priceChangePercent;
    data['weightedAvgPrice'] = weightedAvgPrice;
    data['prevClosePrice'] = prevClosePrice;
    data['lastPrice'] = lastPrice;
    data['lastQty'] = lastQty;
    data['bidPrice'] = bidPrice;
    data['bidQty'] = bidQty;
    data['askPrice'] = askPrice;
    data['askQty'] = askQty;
    data['openPrice'] = openPrice;
    data['highPrice'] = highPrice;
    data['lowPrice'] = lowPrice;
    data['volume'] = volume;
    data['quoteVolume'] = quoteVolume;
    data['openTime'] = openTime;
    data['closeTime'] = closeTime;
    data['firstId'] = firstId;
    data['lastId'] = lastId;
    data['count'] = count;
    return data;
  }
}
