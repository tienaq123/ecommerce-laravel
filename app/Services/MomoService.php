<?php

namespace App\Services;

use Illuminate\Http\Request;

class MomoService
{
    public function createPaymentUrl($order)
    {
        $endpoint = env('MOMO_ENDPOINT');
        $partnerCode = env('MOMO_PARTNER_CODE');
        $accessKey = env('MOMO_ACCESS_KEY');
        $secretKey = env('MOMO_SECRET_KEY');
        $orderInfo = 'Thanh toan don hang ' . $order->id;
        $amount = $order->total_amount;
        $orderId = $order->id;
        $returnUrl = env('MOMO_RETURN_URL');
        $notifyUrl = env('MOMO_NOTIFY_URL');
        $extraData = '';

        $requestId = time() . "";
        $requestType = "captureMoMoWallet";

        $rawHash = "accessKey=" . $accessKey . "&amount=" . $amount . "&extraData=" . $extraData . "&orderId=" . $orderId . "&orderInfo=" . $orderInfo . "&partnerCode=" . $partnerCode . "&redirectUrl=" . $returnUrl . "&requestId=" . $requestId . "&requestType=" . $requestType;
        $signature = hash_hmac("sha256", $rawHash, $secretKey);

        $data = array(
            'partnerCode' => $partnerCode,
            'accessKey' => $accessKey,
            'requestId' => $requestId,
            'amount' => $amount,
            'orderId' => $orderId,
            'orderInfo' => $orderInfo,
            'redirectUrl' => $returnUrl,
            'ipnUrl' => $notifyUrl,
            'extraData' => $extraData,
            'requestType' => $requestType,
            'signature' => $signature
        );

        $result = $this->execPostRequest($endpoint, json_encode($data));
        $jsonResult = json_decode($result, true);

        return $jsonResult['payUrl'];
    }

    private function execPostRequest($url, $data)
    {
        $ch = curl_init($url);
        curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "POST");
        curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt(
            $ch,
            CURLOPT_HTTPHEADER,
            array(
                'Content-Type: application/json',
                'Content-Length: ' . strlen($data)
            )
        );
        $result = curl_exec($ch);
        curl_close($ch);
        return $result;
    }

    public function handleReturn(Request $request)
    {
        // Xử lý phản hồi từ Momo
    }
}
