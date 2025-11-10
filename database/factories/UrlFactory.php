<?php

namespace Database\Factories;

use App\Models\Url;
use Illuminate\Database\Eloquent\Factories\Factory;

class UrlFactory extends Factory
{
    protected $model = Url::class;

    public function definition(): array
    {
        $urls = [
            'https://www.codewithross.com/learn',
            'https://www.codewithross.com/blog',
        ];

        return [
            'original' => $urls[array_rand($urls)],
            'code'     => $this->faker->unique()->bothify('??###??'),
            'visits'   => 0,
        ];
    }
}
