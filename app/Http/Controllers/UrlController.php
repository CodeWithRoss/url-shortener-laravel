<?php

namespace App\Http\Controllers;

use App\Models\Url;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Str;

class UrlController extends Controller
{
    /**
     * @param Request $request
     *
     * @return JsonResponse
     */
    public function __invoke(Request $request): JsonResponse
    {
        $data = $request->validate([
            'url'  => ['required', 'url', 'max:2048'],
            'code' => ['nullable', 'alpha_num', 'min:3', 'max:16'],
        ]);

        $code = $data['code'] ?? $this->generateUniqueCode();

//        if (Url::where('code', $code)->exists()) {
//            throw ValidationException::withMessages([
//                'custom_code' => ['This code is already taken.'],
//            ]);
//        }

        $url = Url::create([
            'original' => $data['url'],
            'code'     => $code,
        ]);

        return response()->json([
            'code'      => $url->code,
            'short_url' => url('/' . $url->code),
            'original'  => $url->original,
        ], 201);
    }

    /**
     * @param int $length
     *
     * @return string
     */
    protected function generateUniqueCode(int $length = 7): string
    {
        do {
            $code = Str::random($length);
        } while (Url::where('code', $code)->exists());

        return $code;
    }
}
