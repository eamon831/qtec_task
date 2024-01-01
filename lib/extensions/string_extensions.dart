extension StringE on String {
  String get capitalize {
    if (isEmpty) {
      return '';
    }
    return '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
  }

  svgIcon()=> 'assets/icons/$this.svg';


}