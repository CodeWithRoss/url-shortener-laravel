<?php

namespace App\Http\Controllers;

use App\Models\Url;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use Illuminate\Validation\ValidationException;

class UrlController extends Controller
{
    /**
     * @param Request $request
     *
     * @return JsonResponse
     * @throws ValidationException
     */
    public function __invoke(Request $request): JsonResponse
    {
        $data = $request->validate([
            'url'  => ['required', 'url', 'max:2048'],
            'code' => ['nullable', 'alpha_num', 'min:3', 'max:16'],
        ]);

        $code = $data['code'] ?? Str::random(7);

        if (Url::where('code', $code)->exists()) {
            return response()->json([
                'message' => 'This code is already taken.',
            ], 422);
        }

        $url = Url::create([
            'original' => $data['url'],
            'code'     => $code,
        ]);

        return response()->json([
            'code'      => $url->code,
            'short_url' => url('/' . $url->code),
            'original'  => $url->original,
        ], 201, [], JSON_PRETTY_PRINT);
    }
}
