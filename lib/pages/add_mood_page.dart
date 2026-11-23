import 'package:material_ui/material_ui.dart';
import '../models/mood.dart';
import '../theme/app_colors.dart';
import '../widgets/date_field.dart';
import '../widgets/field_label.dart';
import '../widgets/mood_picker.dart';
import '../widgets/primary_button.dart';

final _noteBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(14),
  borderSide: const BorderSide(color: AppColors.border),
);

class AddMoodPage extends StatefulWidget {
  final MoodEntry? initial;

  const AddMoodPage({super.key, this.initial});

  @override
  State<AddMoodPage> createState() => _AddMoodPageState();
}

class _AddMoodPageState extends State<AddMoodPage> {
  late DateTime _date;
  late MoodType _mood;
  late final TextEditingController _note;

  bool get _isEdit => widget.initial != null;

  @override
  void initState() {
    super.initState();
    final e = widget.initial;
    _date = e?.createdAt ?? DateTime.now();
    _mood = e?.type ?? MoodType.senang;
    _note = TextEditingController(text: e?.note ?? '');
  }

  @override
  void dispose() {
    _note.dispose();
    super.dispose();
  }

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    );
    if (picked != null) setState(() => _date = picked);
  }

  void _save() {
    final t = widget.initial?.createdAt ?? DateTime.now();
    final entry = MoodEntry(
      _mood,
      DateTime(_date.year, _date.month, _date.day, t.hour, t.minute),
      _note.text.trim(),
    );
    Navigator.pop(context, entry);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.background,
        surfaceTintColor: Colors.transparent,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new,
              size: 18, color: AppColors.textDark),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          _isEdit ? 'Edit Mood' : 'Tambah Mood',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: AppColors.textDark,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.fromLTRB(20, 8, 20, 16),
                children: [
                  const FieldLabel('Tanggal'),
                  const SizedBox(height: 8),
                  DateField(date: _date, onTap: _pickDate),
                  const SizedBox(height: 20),
                  const FieldLabel('Bagaimana perasaanmu?'),
                  const SizedBox(height: 10),
                  MoodPicker(
                    selected: _mood,
                    onChanged: (m) => setState(() => _mood = m),
                  ),
                  const SizedBox(height: 20),
                  const FieldLabel('Catatan (opsional)'),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _note,
                    minLines: 4,
                    maxLines: 6,
                    style: const TextStyle(
                        fontSize: 13.5, color: AppColors.textDark),
                    decoration: InputDecoration(
                      hintText: 'Ceritakan apa yang kamu rasakan...',
                      hintStyle: const TextStyle(color: AppColors.textGrey),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: const EdgeInsets.all(16),
                      border: _noteBorder,
                      enabledBorder: _noteBorder,
                      focusedBorder: _noteBorder.copyWith(
                        borderSide: const BorderSide(color: AppColors.primary),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
              child: PrimaryButton(label: 'Simpan Mood', onPressed: _save),
            ),
          ],
        ),
      ),
    );
  }
}