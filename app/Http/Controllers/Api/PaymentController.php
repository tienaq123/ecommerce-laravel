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
        $vnpUrl = $this->vnpayService->createPaymentUrl($order);

        return response()->json(['url' => $vnpUrl['data']]);
    }

    public function handleReturn(Request $request)
    {
        $result = $this->vnpayService->handleReturn($request);
        return $result;
        if ($result['status']) {
            return response()->json(['message' => 'Payment success', 'order_id' => $result['order_id']]);
        } else {
            return response()->json(['message' => 'Payment failed'], 400);
        }
    }
}
