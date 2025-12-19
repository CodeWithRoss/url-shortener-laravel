<p align="center">
    <a href="https://www.codewithross.com/" target="_blank">
        <img src="https://assets.edlin.app/codewithross/logo/logo-dark.svg" width="400" alt="Code with Ross Logo">
    </a>
</p>

# URL Shortener Laravel

I built a URL Shortener using Laravel and it's API. In 3 minutes.

Simply send a POST request either via Curl or using something like Postman to create the URL.

Then when you enter the URL in the browser, it'll automatically redirect to the longer URL and track the hits in a database.

## Requirements

- PHP v8.4
- Composer
- Web Server (HTTPS)

## Setup

- `composer create-project laravel/laravel url-shortener-laravel`
- `cd url-shortener-laravel`


- `php artisan make:controller RedirectController`
- `php artisan make:controller UrlController`
- `php artisan make:model Url`
- `php artisan make:migration create_urls_table`

## Code

- `database/migrations/*_create_urls_table.php`
- `app/Models/Url.php`


- `app/Http/Controllers/UrlController.php`
- `app/Http/Controllers/RedirectController.php`


- `routes/web.php`
- `routes/api.php`
- `bootstrap/app.php`

## Migration

- `php artisan make:migration create_urls_table`

## Postman



## Deploy

SFTP to your favourite hosting provider, make sure it's HTTPS.
