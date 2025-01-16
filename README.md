# Laravel Project

This repository contains a Laravel-based web application. Follow the steps below to set up and run the project on your local environment.

## Prerequisites

Before starting, ensure you have the following installed:

-   [PHP](https://www.php.net/) (>=8.0)
-   [Composer](https://getcomposer.org/)
-   [Node.js](https://nodejs.org/) and [npm](https://www.npmjs.com/)
-   A database (MySQL)

## Installation

1. **Clone the repository**:

    ```bash
    git clone https://github.com/tienaq123/ecommerce-laravel.git
    cd ecommerce-laravel
    ```

2. **Install PHP dependencies**:

    ```bash
    composer install
    ```

3. **Install JavaScript dependencies**:

    ```bash
    npm install
    ```

4. **Set up the database**:

    - Import the provided database dump into your local database.

    * Path: ecommerce-laravel\database\SQL\ecommerce-laravel-sql.sql

    - Update the `.env` file with your database credentials:
        ```
        DB_DATABASE=ecommerce-laravel-sql
        DB_USERNAME=root
        DB_PASSWORD=
        ```

5. **Generate the application key**:

    ```bash
    php artisan key:generate
    ```

6. **Create a symbolic link for storage**:
    ```bash
    php artisan storage:link
    ```

## Running the Application

Start the development server:

```bash
php artisan serve
```

Visit the application at [http://localhost:8000](http://localhost:8000).

## Additional Notes

-   Ensure proper file permissions for the `storage` and `bootstrap/cache` directories.
-   Run `npm run dev` or `npm run build` to compile frontend assets.

## License

This project is open-source and available under the [MIT License](LICENSE).
