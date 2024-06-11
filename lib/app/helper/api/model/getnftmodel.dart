class Welcome {
  String cursor;
  int page;
  int pageSize;
  List<Result> result;

  Welcome({
    required this.cursor,
    required this.page,
    required this.pageSize,
    required this.result,
  });

  factory Welcome.fromJson(Map<String, dynamic> json) {
    return Welcome(
      cursor: json['cursor'],
      page: json['page'],
      pageSize: json['page_size'],
      result: List<Result>.from(json['result'].map((x) => Result.fromJson(x))),
    );
  }
}

class Result {
  String tokenAddress;
  String tokenId;
  String amount;
  String tokenHash;
  dynamic blockNumberMinted;
  String contractType;
  String name;
  String symbol;
  String tokenUri;
  String metadata;
  String minterAddress;


  Result({
    required this.tokenAddress,
    required this.tokenId,
    required this.amount,
    required this.tokenHash,
    required this.blockNumberMinted,
    required this.contractType,
    required this.name,
    required this.symbol,
    required this.tokenUri,
    required this.metadata,
    required this.minterAddress,
  });

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      tokenAddress: json['token_address'],
      tokenId: json['token_id'],
      amount: json['amount'],
      tokenHash: json['token_hash'],
      blockNumberMinted: json['block_number_minted'],
      contractType: json['contract_type'],
      name: json['name'],
      symbol: json['symbol'],
      tokenUri: json['token_uri'],
      metadata: json['metadata'],
      minterAddress: json['minter_address'],

    );
  }
}
