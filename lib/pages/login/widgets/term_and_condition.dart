import 'package:flutter/material.dart';

class TermAndCondition extends StatelessWidget {
  const TermAndCondition({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Bằng cách tiếp tục, tôi đồng ý với ',
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      color: const Color(0xFF757575),
                    ),
              ),
              GestureDetector(
                onTap: () {},
                child: Text(
                  'Điều khoản & Điều kiện,',
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: const Color(0xFF757575),
                      ),
                ),
              )
            ],
          ),
          Text(
            'Chính sách Bảo mật',
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  color: const Color(0xFF757575),
                ),
          )
        ],
      ),
    );
  }
}
