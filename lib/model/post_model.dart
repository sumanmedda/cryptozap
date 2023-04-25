class PostModel {
  String? id;
  String? name;
  int? yearEstablished;
  String? country;
  String? description;
  String? url;
  String? image;
  bool? hasTradingIncentive;
  int? trustScore;
  int? trustScoreRank;
  double? tradeVolume24hBtc;
  double? tradeVolume24hBtcNormalized;

  PostModel(
      {this.id,
      this.name,
      this.yearEstablished,
      this.country,
      this.description,
      this.url,
      this.image,
      this.hasTradingIncentive,
      this.trustScore,
      this.trustScoreRank,
      this.tradeVolume24hBtc,
      this.tradeVolume24hBtcNormalized});

  PostModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    yearEstablished = json['year_established'];
    country = json['country'];
    description = json['description'];
    url = json['url'];
    image = json['image'];
    hasTradingIncentive = json['has_trading_incentive'];
    trustScore = json['trust_score'];
    trustScoreRank = json['trust_score_rank'];
    tradeVolume24hBtc = json['trade_volume_24h_btc'];
    tradeVolume24hBtcNormalized = json['trade_volume_24h_btc_normalized'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['year_established'] = yearEstablished;
    data['country'] = country;
    data['description'] = description;
    data['url'] = url;
    data['image'] = image;
    data['has_trading_incentive'] = hasTradingIncentive;
    data['trust_score'] = trustScore;
    data['trust_score_rank'] = trustScoreRank;
    data['trade_volume_24h_btc'] = tradeVolume24hBtc;
    data['trade_volume_24h_btc_normalized'] = tradeVolume24hBtcNormalized;
    return data;
  }
}
