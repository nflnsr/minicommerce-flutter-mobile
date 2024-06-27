String formatCurrency(String currency) {
  // Menghapus simbol "Rp." dan semua titik
  String formatted = currency.replaceAll('Rp. ', '').replaceAll('.', '');
  return formatted;
}
