<?php

namespace Tests\Feature;

use App\Models\Url;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Tests\TestCase;

class UrlShortenerTest extends TestCase
{
    use RefreshDatabase;

    /**
     * @return void
     */
    public function test_can_shorten_url(): void
    {
        $res = $this->postJson('/api/shorten', ['url' => 'https://example.com/page']);
        $res->assertCreated()
            ->assertJsonStructure(['code', 'short_url', 'original']);
    }

    /**
     * @return void
     */
    public function test_code_conflict(): void
    {
        Url::factory()->create(['code' => 'abc1234', 'original' => 'https://a.com']);
        $res = $this->postJson('/api/shorten', ['url' => 'https://b.com', 'code' => 'abc1234']);
        $res->assertStatus(422);
    }

    /**
     * @return void
     */
    public function test_redirects(): void
    {
        $url = Url::create(['original' => 'https://example.com', 'code' => 'go123']);
        $res = $this->get('/' . $url->code);
        $res->assertRedirect('https://example.com');
    }
}
