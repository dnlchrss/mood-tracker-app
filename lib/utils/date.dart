const _months = [
  'Januari',
  'Februari',
  'Maret',
  'April',
  'Mei',
  'Juni',
  'Juli',
  'Agustus',
  'September',
  'Oktober',
  'November',
  'Desember',
];

/// Tanggal tanpa jam, supaya mudah dibandingkan.
DateTime dateOnly(DateTime d) => DateTime(d.year, d.month, d.day);

bool isToday(DateTime d) => dateOnly(d) == dateOnly(DateTime.now());

/// "5 November 2026"
String formatDate(DateTime d) => '${d.day} ${_months[d.month - 1]} ${d.year}';

/// "Hari ini, 5 November 2026" atau "4 November 2026".
String formatDateLong(DateTime d) =>
    isToday(d) ? 'Hari ini, ${formatDate(d)}' : formatDate(d);

/// Judul grup di Home: "Hari Ini", "Kemarin", atau tanggal.
String sectionTitle(DateTime d) {
  final today = dateOnly(DateTime.now());
  final day = dateOnly(d);
  if (day == today) return 'Hari Ini';
  if (day == DateTime(today.year, today.month, today.day - 1)) return 'Kemarin';
  return formatDate(d);
}