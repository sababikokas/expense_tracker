import 'package:expense_tracker/common_functions/app_fonts.dart';
import 'package:expense_tracker/common_functions/app_textstyle.dart';
import 'package:expense_tracker/common_functions/home_template.dart';
import 'package:expense_tracker/common_functions/title_componenet.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/notification_service/notification_services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ReminderScreen extends StatefulWidget {
  const ReminderScreen({super.key});

  @override
  State<ReminderScreen> createState() => _ReminderScreenState();
}

class _ReminderScreenState extends State<ReminderScreen> {
  TimeOfDay selectedTime = const TimeOfDay(hour: 9, minute: 0);

  String _formattedTime(BuildContext context) {
    return selectedTime.format(context);
  }

  void _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  void _scheduleDailyReminder() async {
    try {
      await NotificationService().scheduleDailyNotification(
        id: 1,
        title: 'Daily Expense Reminder',
        body: 'Don’t forget to record your expenses today!',
        timeOfDay: selectedTime,
      );
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Reminder scheduled successfully!')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to schedule reminder: $e')),
      );
    }
  }

  void _scheduleTestNotification() async {
    try {
      DateTime now = DateTime.now();
      DateTime scheduleTime = now.add(const Duration(seconds: 12));

      await NotificationService().scheduleNotification(
        id: 2,
        title: 'Test Reminder',
        body: 'This is your test notification!',
        scheduledDateTime: scheduleTime,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Test notification scheduled for 12 sec from now!')),
      );
    } catch (e) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to schedule test notification: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return HomeTemplate(
        showIcon: false,
        automaticallyImplyLeading: true,
        title: AppLocalizations.of(context)!.reminder,
        selectedIndex: 0,
        children: [
          const SizedBox(
            height: 20,
          ),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              _selectTime(context);
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TitleCompomnent(
                      title: AppLocalizations.of(context)!.selectTime,
                      style: AppTextStyles.black14,
                    ),
                    Text(_formattedTime(context)),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          TitleCompomnent(
            title:
                '${AppLocalizations.of(context)!.reminderDesc} ${_formattedTime(context)}',
            style: AppTextStyles.black14,
          ),
          const SizedBox(height: 40),
          SizedBox(
            width: double.maxFinite,
            child: ElevatedButton(
              style: AppFont.elevatedButtonStyle(),
              onPressed: _scheduleDailyReminder,
              child: TitleCompomnent(
                  title: AppLocalizations.of(context)!.setDailyReminder,
                  style: AppTextStyles.white16TextMedium),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.maxFinite,
            child: ElevatedButton(
              style: AppFont.elevatedButtonStyle(),
              onPressed: _scheduleTestNotification,
              child: TitleCompomnent(
                title: AppLocalizations.of(context)!.scheduleTestNotification,
                style: AppTextStyles.white16TextMedium,
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          TitleCompomnent(
              title:
                  "NOTE: Notification is working on simulator,but i am having some issue in testing it on physical device, its not working properly on physical device,when i debug due to some permission issue occuring,",
              style: AppTextStyles.black14),
        ]);
  }
}
