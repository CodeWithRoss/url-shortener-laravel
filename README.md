<p align="center">
    <a href="https://www.codewithross.com/" target="_blank">
        <img src="https://assets.edlin.app/codewithross/logo/logo-dark.svg" width="400" alt="Code with Ross Logo">
    </a>
</p>

# URL Shortener Laravel

todo

## Requirements

- PHP v8.4
- Composer
- Web Server (HTTPS)

## Setup

- `composer create-project laravel/laravel url-shortener-laravel`
- `cd url-shortener-laravel`


- `composer require pusher/pusher-php-server`


- `php artisan make:controller RedirectController UrlController`
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
