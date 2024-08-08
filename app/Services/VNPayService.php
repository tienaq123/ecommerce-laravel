<?php

namespace App\Services;

use Illuminate\Http\Request;

class VNPayService
{
    public function createPaymentUrl($order)
{
    $vnp_TmnCode = env('VNPAY_TMN_CODE'); // Mã website của bạn tại VNPay
    $vnp_HashSecret = env('VNPAY_HASH_SECRET'); // Chuỗi bí mật của bạn tại VNPay
    $vnp_Url = env('VNPAY_URL'); // URL thanh toán của VNPay

    $vnp_Returnurl = env('VNPAY_RETURN_URL'); // URL trả về sau khi thanh toán
    $vnp_TxnRef = $order->id; // Mã hóa đơn
    $vnp_OrderInfo = 'Thanh toán đơn hàng ' . $order->id;
    $vnp_OrderType = 'billpayment';
    $vnp_Amount = $order->total_amount * 100; // Số tiền thanh toán, nhân với 100 để đổi từ đơn vị VND sang VNPay
    $vnp_Locale = 'vn';
    $vnp_BankCode = '';
    $vnp_IpAddr = request()->ip();

    $inputData = array(
        "vnp_Version" => "2.0.0",
        "vnp_TmnCode" => $vnp_TmnCode,
        "vnp_Amount" => $vnp_Amount,
        "vnp_Command" => "pay",
        "vnp_CreateDate" => date('YmdHis'),
        "vnp_CurrCode" => "VND",
        "vnp_IpAddr" => $vnp_IpAddr,
        "vnp_Locale" => $vnp_Locale,
        "vnp_OrderInfo" => $vnp_OrderInfo,
        "vnp_OrderType" => $vnp_OrderType,
        "vnp_ReturnUrl" => $vnp_Returnurl,
        "vnp_TxnRef" => $vnp_TxnRef,
    );

    ksort($inputData);
    $query = "";
    $i = 0;
    $hashdata = "";
    foreach ($inputData as $key => $value) {
        if ($i == 1) {
            $hashdata .= '&' . $key . "=" . $value;
        } else {
            $hashdata .= $key . "=" . $value;
            $i = 1;
        }
        $query .= urlencode($key) . "=" . urlencode($value) . '&';
    }

    $vnp_Url = $vnp_Url . "?" . $query;
    if (isset($vnp_HashSecret)) {
        $vnpSecureHash = hash('sha256', $vnp_HashSecret . $hashdata);
        $vnp_Url .= 'vnp_SecureHashType=SHA256&vnp_SecureHash=' . $vnpSecureHash;
    }

    return $vnp_Url;
}


    public function handleReturn($request)
    {
        $vnp_HashSecret = env('VNPAY_HASH_SECRET');
        $inputData = array();
        foreach ($request->all() as $key => $value) {
            if (substr($key, 0, 4) == "vnp_") {
                $inputData[$key] = $value;
            }
        }

        $vnp_SecureHash = $inputData['vnp_SecureHash'];
        unset($inputData['vnp_SecureHashType']);
        unset($inputData['vnp_SecureHash']);
        ksort($inputData);
        $hashData = "";
        foreach ($inputData as $key => $value) {
            $hashData .= urlencode($key) . '=' . urlencode($value) . '&';
        }
        $hashData = rtrim($hashData, '&');

        $secureHash = hash('sha256', $vnp_HashSecret . $hashData);
        if ($secureHash == $vnp_SecureHash) {
            if ($inputData['vnp_ResponseCode'] == '00') {
                return ['status' => true, 'order_id' => $inputData['vnp_TxnRef']];
            }
        }
        return ['status' => false];
    }
}
