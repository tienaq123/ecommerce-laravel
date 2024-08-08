<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Services\VNPayService;
use App\Models\Order;

class PaymentController extends Controller
{
    protected $vnpayService;

    public function __construct(VNPayService $vnpayService)
    {
        $this->vnpayService = $vnpayService;
    }

    public function createPayment(Request $request, $orderId)
    {
        $order = Order::findOrFail($orderId);

        // Kiểm tra loại cổng thanh toán
        $paymentMethod = $request->input('payment_method');
        if ($paymentMethod == 'vnpay') {
            $paymentUrl = $this->vnpayService->createPaymentUrl($order);
        } else {
            return response()->json(['message' => 'Payment method not supported'], 400);
        }

        return response()->json(['url' => $paymentUrl]);
    }

    public function handleReturn(Request $request)
    {
        $paymentMethod = $request->input('vnp_TmnCode'); // Assuming the return URL contains a parameter to identify the payment method

        if ($paymentMethod == env('VNPAY_TMN_CODE')) {
            $result = $this->vnpayService->handleReturn($request);
        } else {
            return response()->json(['message' => 'Payment method not supported'], 400);
        }

        if ($result) {
            // Cập nhật trạng thái đơn hàng
            // ...
            return response()->json(['message' => 'Payment success']);
        } else {
            return response()->json(['message' => 'Payment failed'], 400);
        }
    }
}
