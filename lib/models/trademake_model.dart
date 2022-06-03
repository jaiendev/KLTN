class TrademarkModel {
  final String title;
  bool isCheck;

  TrademarkModel({
    required this.title,
    this.isCheck = false,
  });
}

final List<TrademarkModel> listTrademake = [
  TrademarkModel(title: 'Screen Dell'),
  TrademarkModel(title: 'Screen Asus'),
  TrademarkModel(title: 'Screen HP'),
  TrademarkModel(title: 'Screen Acer'),
  TrademarkModel(title: 'Screen MSi'),
];
