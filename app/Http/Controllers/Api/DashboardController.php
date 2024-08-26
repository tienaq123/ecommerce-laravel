<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Category;
use App\Models\Order;
use App\Models\Product;
use Illuminate\Http\Request;

class DashboardController extends Controller
{
    public function index()
    {
        return response()->json([
            'status' => true,
            'data' => [
                'product' => $this->getProductStockLevels(),
                'order' => $this->orderStatistics()
            ],
        ]);
    }

    public function getProductStockLevels() // sản phẩm tồn kho
    {
        $productStock = Product::with('productVariants')->get()->sum('quantity');
        $inventoryTotalValue = Product::with('productVariants')->get()->sum(function ($product) {

            return $product->productVariants->sum('price');
        });
        $countSoldProducts = Order::where('status_id', 4)->with('items')->get()->sum(function ($order) {
            return $order->items->sum('quantity');
        });
        $value = [
            'productStock' => $productStock, // số lượng sản phẩm còn trong kho
            'inventoryTotalValue' => $inventoryTotalValue, // tổng tiền của sản phẩm còn trong kho
            'countSoldProducts' => $countSoldProducts // số lượng sản phẩm đã bán
        ];
        return $value;
    }

    protected function orderStatistics()
    {
        $value = [
            'countOrder' => count(Order::all()), // số lượng đơn hàng
            'sumOrder' => Order::where('status_id', 4)->get()->sum('total_amount'), // tổng doanh thu
            'countCompletedOrders' => count(Order::where('status_id', '=', 4)->get()), // đơn đã hoàn thành
            'countCancelledOrders' => count(Order::where('status_id', '=', 5)->get()) // đơn đã hủy
        ];
        return $value;
    }
    protected function getProductByCategoryId($id)
    {
        $category = Category::find($id);
        $products = count($category->products);
        return $products;
    }
}
