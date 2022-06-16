extension StringExtention on String {
  static const _vietnamese = 'aAeEoOuUiIdDyY';

  static final _vietnameseRegex = <RegExp>[
    RegExp(r'à|á|ạ|ả|ã|â|ầ|ấ|ậ|ẩ|ẫ|ă|ằ|ắ|ặ|ẳ|ẵ'),
    RegExp(r'À|Á|Ạ|Ả|Ã|Â|Ầ|Ấ|Ậ|Ẩ|Ẫ|Ă|Ằ|Ắ|Ặ|Ẳ|Ẵ'),
    RegExp(r'è|é|ẹ|ẻ|ẽ|ê|ề|ế|ệ|ể|ễ'),
    RegExp(r'È|É|Ẹ|Ẻ|Ẽ|Ê|Ề|Ế|Ệ|Ể|Ễ'),
    RegExp(r'ò|ó|ọ|ỏ|õ|ô|ồ|ố|ộ|ổ|ỗ|ơ|ờ|ớ|ợ|ở|ỡ'),
    RegExp(r'Ò|Ó|Ọ|Ỏ|Õ|Ô|Ồ|Ố|Ộ|Ổ|Ỗ|Ơ|Ờ|Ớ|Ợ|Ở|Ỡ'),
    RegExp(r'ù|ú|ụ|ủ|ũ|ư|ừ|ứ|ự|ử|ữ'),
    RegExp(r'Ù|Ú|Ụ|Ủ|Ũ|Ư|Ừ|Ứ|Ự|Ử|Ữ'),
    RegExp(r'ì|í|ị|ỉ|ĩ'),
    RegExp(r'Ì|Í|Ị|Ỉ|Ĩ'),
    RegExp(r'đ'),
    RegExp(r'Đ'),
    RegExp(r'ỳ|ý|ỵ|ỷ|ỹ'),
    RegExp(r'Ỳ|Ý|Ỵ|Ỷ|Ỹ')
  ];

  formatMoney({String splitBy = '.'}) {
    String result = '';
    int count = 0;
    for (int i = this.length - 1; i >= 0; i--) {
      if (count == 3) {
        count = 1;
        result += splitBy;
      } else {
        count++;
      }
      result += this[i];
    }
    String formatMoney = '';
    for (int i = result.length - 1; i >= 0; i--) {
      formatMoney += result[i];
    }
    return formatMoney;
  }

  String formatName({int limit = 18}) {
    if (this.length <= limit) {
      return this;
    }
    List<String> thiss = this.split(' ');
    switch (thiss.length) {
      case 1:
        if (this.length > limit) {
          return this.substring(0, limit - 3);
        }
        return this;
      case 2:
        if (this.length > limit) {
          return this.substring(0, limit - 3);
        }
        return this;
      case 3:
        if (this.length > limit) {
          thiss.removeAt(1);
          return thiss.join(' ').formatName(limit: limit);
        } else {
          return this;
        }
      case 4:
        if (this.length > limit) {
          thiss.removeAt(1);
          thiss.removeAt(1);
          return thiss.join(' ').formatName(limit: limit);
        } else {
          return this;
        }
      default:
        if (this.length > limit) {
          thiss.removeAt(thiss.length - 2);
          return thiss.join(' ').formatName(limit: limit);
        } else {
          return this;
        }
    }
  }

  String formatVietnamese() {
    var result = this;
    for (var i = 0; i < _vietnamese.length; ++i) {
      result = result.replaceAll(_vietnameseRegex[i], _vietnamese[i]);
    }
    return result;
  }

  String limitString({int limit = 18}) {
    if (this.length <= limit) {
      return this;
    }
    return this.substring(0, limit - 2) + '...';
  }
}
