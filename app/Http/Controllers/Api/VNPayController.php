<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Services\VNPayService;
use App\Models\Order;

class VNPayController extends Controller
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

        return response()->json(['url' => $vnpUrl]);
    }

    public function handleReturn(Request $request)
    {
        $result = $this->vnpayService->handleReturn($request);

        if ($result['status']) {
            // Cập nhật trạng thái đơn hàng
            $order = Order::find($result['order_id']);
            $order->status_id = 2; // Đã thanh toán
            $order->save();

            return response()->json(['message' => 'Payment success', 'order' => $order]);
        } else {
            return response()->json(['message' => 'Payment failed'], 400);
        }
    }
}
