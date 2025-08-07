import 'package:enzomir/core/theme/colors.dart';
import 'package:enzomir/core/theme/text_styles.dart';
import 'package:enzomir/presentation/pages/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

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
                  child: const Divider(
                    height: 36,
                    color: AppColors.pureGrey,
                    thickness: 2,
                  ),
                ),
                const Text(
                  'Event Details',
                  style: AppTextStyles.exploreHeading,
                ),
                const SizedBox(height: 20),
                _buildInputField(
                  label: 'Event Name',
                  controller: eventNameController,
                  hintText: 'Event Name',
                  isRequired: true,
                ),
                _buildDropdownField(
                  label: 'Event Type',
                  controller: eventTypeController,
                  isRequired: true,
                ),
                _buildDateField(
                  label: 'Select Date',
                  controller: dateController,
                  isRequired: true,
                ),
                _buildTimeField(
                  label: 'Select Time',
                  controller: timeController,
                  isRequired: true,
                ),
                _buildInputField(
                  label: 'Add Location',
                  controller: locationController,
                  hintText: 'Location',
                  isRequired: true,
                ),
                _buildTextAreaField(
                  label: 'About Event',
                  controller: aboutController,
                  hintText: 'Describe your event',
                  isRequired: true,
                ),
                const SizedBox(height: 20),
                _buildMapView(context),
                const SizedBox(height: 20),
                _buildCreateEventButton(context),
                const SizedBox(height: 20),
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
        color: AppColors.pureGrey,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.add, size: 40, color: AppColors.pureWhite),
          SizedBox(height: 8),
          Text('Add Cover Photo', style: AppTextStyles.formLabelText),
        ],
      ),
    );
  }

  Widget _buildInputField({
    required String label,
    required TextEditingController controller,
    required String hintText,
    bool isRequired = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildFieldLabel(label, isRequired),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.greyText, width: 2),
            borderRadius: BorderRadius.circular(100),
          ),
          child: TextField(
            style: AppTextStyles.inputTextStyle.copyWith(fontSize: 16),
            controller: controller,
            decoration: InputDecoration(
              hintText: hintText,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              border: InputBorder.none,
              hintStyle: AppTextStyles.hintTextSearch,
            ),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildDropdownField({
    required String label,
    required TextEditingController controller,
    bool isRequired = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildFieldLabel(label, isRequired),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.greyText, width: 2),
            borderRadius: BorderRadius.circular(100),
          ),
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    controller.text,
                    style: AppTextStyles.inputTextStyle.copyWith(
                      fontSize: 16,
                      height: 3,
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(right: 16),
                child: Icon(Icons.arrow_drop_down, color: Colors.grey),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildDateField({
    required String label,
    required TextEditingController controller,
    bool isRequired = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildFieldLabel(label, isRequired),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.greyText, width: 2),
            borderRadius: BorderRadius.circular(100),
          ),
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    controller.text,
                    style: AppTextStyles.inputTextStyle.copyWith(fontSize: 16),
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.calendar_today, size: 20),
                onPressed: () {
                  // Date picker logic will be handled via Bloc
                },
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildTimeField({
    required String label,
    required TextEditingController controller,
    bool isRequired = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildFieldLabel(label, isRequired),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.greyText, width: 2),
            borderRadius: BorderRadius.circular(100),
          ),
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    controller.text,
                    style: AppTextStyles.inputTextStyle.copyWith(fontSize: 16),
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.access_time, size: 20),
                onPressed: () {
                  // Time picker logic will be handled via Bloc
                },
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildTextAreaField({
    required String label,
    required TextEditingController controller,
    required String hintText,
    bool isRequired = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildFieldLabel(label, isRequired),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.greyText, width: 2),
            borderRadius: BorderRadius.circular(16),
          ),
          child: TextField(
            style: AppTextStyles.inputTextStyle.copyWith(fontSize: 16),
            controller: controller,
            decoration: InputDecoration(
              hintText: hintText,
              contentPadding: const EdgeInsets.all(16),
              border: InputBorder.none,
              hintStyle: AppTextStyles.hintTextSearch,
              
            ),
            maxLines: 5,
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildFieldLabel(String label, bool isRequired) {
    return Row(
      children: [
        Text(label, style: AppTextStyles.formLabelText),
        if (isRequired)
          Text(
            '*',
            style: AppTextStyles.formLabelText.copyWith(
              color: Color(0xFFB84747),
            ),
          ),
      ],
    );
  }

  Widget _buildMapView(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        children: [
          Center(
            child: Container(
              width: 20,
              height: 20,
              decoration: const BoxDecoration(
                color: Colors.indigo,
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(top: 40, right: 60, child: _buildMapMarker(Colors.orange)),
          Positioned(left: 60, top: 80, child: _buildMapMarker(Colors.amber)),
        ],
      ),
    );
  }

  Widget _buildMapMarker(Color color) {
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 2),
      ),
      child: const Icon(Icons.person, color: Colors.white, size: 18),
    );
  }

  Widget _buildCreateEventButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          // Create event logic will be handled via Bloc
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        child: const Text(
          'Create Event',
          style: AppTextStyles.recomendedCard,
        ),
      ),
    );
  }
}
