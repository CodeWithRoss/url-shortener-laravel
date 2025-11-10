<?php

namespace App\Http\Controllers;

use App\Models\Url;
use Illuminate\Http\RedirectResponse;

class RedirectController
{
    /**
     * @param string $code
     *
     * @return RedirectResponse
     */
    public function __invoke(string $code): RedirectResponse
    {
        $url = Url::where('code', $code)->first();

        if (!$url) {
            abort(404);
        }

        $url->increment('visits');

        return redirect()->away($url->original);
    }
}
