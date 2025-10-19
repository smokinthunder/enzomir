import 'package:enzomir/shared/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:enzomir/core/theme/theme.dart';

class NewEventPage extends StatelessWidget {
  NewEventPage({super.key});
  final TextEditingController eventNameController = TextEditingController();
  final TextEditingController eventTypeController = TextEditingController(
    text: 'wedding',
  );
  final TextEditingController dateController = TextEditingController(
    text: 'April 28, 2025',
  );
  final TextEditingController timeController = TextEditingController(
    text: '04:00 - 10:00PM',
  );
  final TextEditingController locationController = TextEditingController(
    text: 'Kochi, Kerala',
  );
  final TextEditingController aboutController = TextEditingController(
    text:
        'A wedding is a ceremony where two people publicly declare their commitment to marry each other.',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: CustomAppBar(title: "Create Your Event"),leadingWidth: double.infinity,),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildCoverPhotoUploader(context),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 80),
                  child: Divider(
                    height: 36,
                    color: context.colors.outline,
                    thickness: 2,
                  ),
                ),
                Text(
                  'Event Details',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 20),
                _buildInputField(
                  context,
                  label: 'Event Name',
                  controller: eventNameController,
                  hintText: 'Enter the name of your event',
                  isRequired: true,
                ),
                _buildDropdownField(
                  context,
                  label: 'Event Type',
                  controller: eventTypeController,
                  items: ['Wedding', 'Birthday', 'Meeting', 'Other'],
                  isRequired: true,
                ),
                Row(
                  children: [
                    Expanded(
                      child: _buildInputField(
                        context,
                        label: 'Date',
                        controller: dateController,
                        hintText: 'Select date',
                        isRequired: true,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: _buildInputField(
                        context,
                        label: 'Time',
                        controller: timeController,
                        hintText: 'Select time',
                        isRequired: true,
                      ),
                    ),
                  ],
                ),
                _buildInputField(
                  context,
                  label: 'Location',
                  controller: locationController,
                  hintText: 'Enter location',
                  isRequired: true,
                ),
                _buildTextAreaField(
                  context,
                  label: 'About',
                  controller: aboutController,
                  hintText: 'Tell us more about your event...',
                ),
                const SizedBox(height: 32),
                Center(child: _buildSubmitButton(context)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCoverPhotoUploader(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50),
      height: 180,
      width: double.infinity,
      decoration: BoxDecoration(
        color: context.colors.outline,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.add, size: 40, color: context.colors.surface),
          const SizedBox(height: 8),
          Text('Add Cover Photo', style: Theme.of(context).textTheme.labelMedium),
        ],
      ),
    );
  }

  Widget _buildInputField(
    BuildContext context, {
    required String label,
    required TextEditingController controller,
    required String hintText,
    bool isRequired = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildFieldLabel(context, label, isRequired),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: context.colors.outline, width: 2),
            borderRadius: BorderRadius.circular(100),
          ),
          child: TextField(
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 16),
            controller: controller,
            decoration: InputDecoration(
              hintText: hintText,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              border: InputBorder.none,
              hintStyle: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildDropdownField(
    BuildContext context, {
    required String label,
    required TextEditingController controller,
    required List<String> items,
    bool isRequired = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildFieldLabel(context, label, isRequired),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: context.colors.outline, width: 2),
            borderRadius: BorderRadius.circular(100),
          ),
          child: TextField(
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 16),
            controller: controller,
            readOnly: true,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              border: InputBorder.none,
              suffixIcon: Icon(Icons.arrow_drop_down, color: context.colors.onSurface),
            ),
            onTap: () {
              // TODO: Implement dropdown functionality
            },
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildTextAreaField(
    BuildContext context, {
    required String label,
    required TextEditingController controller,
    required String hintText,
    bool isRequired = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildFieldLabel(context, label, isRequired),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: context.colors.outline, width: 2),
            borderRadius: BorderRadius.circular(16),
          ),
          child: TextField(
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 16),
            controller: controller,
            maxLines: 4,
            decoration: InputDecoration(
              hintText: hintText,
              contentPadding: const EdgeInsets.all(16),
              border: InputBorder.none,
              hintStyle: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildFieldLabel(BuildContext context, String label, bool isRequired) {
    return Text.rich(
      TextSpan(
        text: label,
        style: Theme.of(context).textTheme.labelLarge?.copyWith(
          fontWeight: FontWeight.w600,
          color: context.colors.onSurface,
        ),
        children: isRequired
            ? [
                TextSpan(
                  text: ' *',
                  style: TextStyle(color: context.colors.error),
                ),
              ]
            : null,
      ),
    );
  }

  Widget _buildSubmitButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          // TODO: Implement form submission
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: context.colors.primary,
          foregroundColor: context.colors.onPrimary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        child: Text(
          'Create Event',
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: context.colors.onPrimary,
          ),
        ),
      ),
    );
  }
}