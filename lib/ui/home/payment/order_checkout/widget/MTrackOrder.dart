import 'package:flutter/material.dart';

class TrackOrderModal {
  String title;
  String subtitle;
  String time;
  String img;

  TrackOrderModal(
      {required this.title,
      required this.subtitle,
      required this.time,
      required this.img});
}

List<TrackOrderModal> trackOrderList = [
  TrackOrderModal(
      title: 'Order Placed',
      subtitle: 'We have received your order.',
      time: 'time',
      img: 'assets/icons/order.png'),
  TrackOrderModal(
      title: 'Order Confirmed',
      subtitle: 'Your order has been confirmed.',
      time: 'time',
      img: 'assets/icons/order_confirm.png'),
  TrackOrderModal(
      title: 'Order Processed',
      subtitle: 'We are preparing your order.',
      time: 'time',
      img: 'assets/icons/order_box.png'),
  TrackOrderModal(
      title: 'Ready to Pickup',
      subtitle: 'Your order is ready for Pickup',
      time: 'time',
      img: 'assets/icons/order_delivery.png'),
  TrackOrderModal(
      title: 'On delivery',
      subtitle: 'Your order is on delivery.',
      time: 'time',
      img: 'assets/icons/delivery.png'),
  TrackOrderModal(
      title: 'Successful order',
      subtitle: 'Order has been delivered successfully',
      time: 'time',
      img: 'assets/icons/order_arrived.png'),
];
