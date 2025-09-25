import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:step_tracker/step_tracker.dart';

class OrderTrackingPage extends StatelessWidget {
  final Map<String, String?> order;

  const OrderTrackingPage({super.key, required this.order});

  int getCurrentStep(String? status) {
    switch (status?.toLowerCase()) {
      case "pending":
        return 1; // Order Placed
      case "ongoing":
        return 2; // Order Accepted
      case "delivered":
        return 3; // Order Delivered
      default:
        return 0;
    }
  }

  TrackerState getStepState(int stepIndex, int currentStep) {
    if (stepIndex < currentStep) return TrackerState.complete;
    if (stepIndex == currentStep) return TrackerState.none;
    return TrackerState.disabled;
  }

  @override
  Widget build(BuildContext context) {
    final currentStep = getCurrentStep(order['status']);

    final steps = [
      Steps(
        title: 'Order Placed',
        state: getStepState(0, currentStep),
        description: order['processingDate'] ?? '',
      ),
      Steps(
        title: 'Order Accepted',
        state: getStepState(1, currentStep),
        description: order['acceptedDate'] ?? '',
      ),
      Steps(
        title: 'Order Packed',
        state: getStepState(2, currentStep),
        description: order['packedDate'] ?? '',
      ),
      Steps(
        title: 'Order Completed',
        state: getStepState(3, currentStep),
        description: order['completedDate'] ?? '',
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Order Tracking',
          style: GoogleFonts.workSans(
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Hero(
                    tag: order["orderId"]!,
                    child:
                        (order['image'] != null && order['image']!.isNotEmpty)
                        ? Image.asset(
                            order['image']!,
                            width: 56,
                            height: 56,
                            fit: BoxFit.cover,
                          )
                        : Container(
                            width: 56,
                            height: 56,
                            color: Colors.grey[200],
                            child: const Icon(Icons.image, size: 36),
                          ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Order Name: ${order['name'] ?? 'Unnamed product'}',
                        style: GoogleFonts.workSans(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'Order ID: ${order['orderId'] ?? '-'}',
                        style: GoogleFonts.workSans(color: Colors.grey[700]),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),

            Row(
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: const Color.fromRGBO(240, 242, 245, 1),
                  ),
                  child: Image.asset("assets/img/doller.png"),
                ),
                const SizedBox(width: 12),
                Text(
                  'Total Price: \$${order['totalPrice'] ?? ''}',
                  style: GoogleFonts.workSans(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            Text(
              'Tracking Status',
              style: GoogleFonts.workSans(
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 12),

            StepTracker(
              steps: steps,
              stepTrackerType: StepTrackerType.dotVertical,
              dotSize: 15,
              circleIconSize: 24,
              pipeSize: 80,
              selectedColor: Colors.lightGreen,
              unSelectedColor: Color.fromRGBO(219, 227, 229, 1),
              showIcon: true,
            ),
          ],
        ),
      ),
    );
  }
}
