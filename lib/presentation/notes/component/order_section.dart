import 'package:flutter/material.dart';
import 'package:notes_app/domain/util/note_order.dart';
import 'package:notes_app/domain/util/order_type.dart';

class OrderSection extends StatelessWidget {
  final NoteOrder noteOrder;
  final Function(NoteOrder noteOrder) onOrderChanged;

  const OrderSection({
    required this.noteOrder,
    required this.onOrderChanged,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Radio<NoteOrder>(
              value: NoteOrder.title(noteOrder.orderType),
              groupValue: noteOrder,
              onChanged: (NoteOrder? value) {
                onOrderChanged(NoteOrder.title(noteOrder.orderType));
              },
              activeColor: Colors.white,
            ),
            const Text(
              "Title",
              style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w400),
            ),
            Radio<NoteOrder>(
              value: NoteOrder.date(noteOrder.orderType),
              groupValue: noteOrder,
              onChanged: (NoteOrder? value) {
                onOrderChanged(NoteOrder.date(noteOrder.orderType));
              },
              activeColor: Colors.white,
            ),
            const Text(
              "Date",
              style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w400),
            ),
            Radio<NoteOrder>(
              value: NoteOrder.color(noteOrder.orderType),
              groupValue: noteOrder,
              onChanged: (NoteOrder? value) {
                onOrderChanged(NoteOrder.color(noteOrder.orderType));
              },
              activeColor: Colors.white,
            ),
            const Text(
              "Color",
              style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w400),
            ),
          ],
        ),
        Row(
          children: [
            Radio<OrderType>(
              value: OrderType.ascending(),
              groupValue: noteOrder.orderType,
              onChanged: (OrderType? val) {
                onOrderChanged(
                  noteOrder.copyWith(
                    orderType: OrderType.ascending(),
                  ),
                );
              },
              activeColor: Colors.white,
            ),
            const Text(
              "오름차순",
              style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w400),
            ),
            Radio<OrderType>(
              value: const OrderType.descending(),
              groupValue: noteOrder.orderType,
              onChanged: (OrderType? value) {
                onOrderChanged(
                  noteOrder.copyWith(
                    orderType: const OrderType.descending(),
                  ),
                );
              },
              activeColor: Colors.white,
            ),
            const Text(
              "내림차순",
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.white,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        )
      ],
    );
  }
}
