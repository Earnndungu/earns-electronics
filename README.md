# Earns Electronics & Mobile Store

A PHP + MySQL e-commerce website for selling mobile phones, electronics, and phone accessories. The project is designed for local development with **XAMPP** and can be committed directly to GitHub.

## Features

### Customer / Public Store
- Responsive product catalogue
- Product search and category filtering
- Product images
- Shopping cart
- Customer registration and login
- Checkout
- Delivery or store pickup
- Automatic order totals and delivery fees
- Order records stored in MySQL

### Admin
- Secure admin login
- Dashboard with product, order, and sales statistics
- Add products
- Edit products
- Delete products
- Upload product photos using a file picker
- Set product description, price, stock and category
- Update order status

### Database
- MySQL database schema included in `database.sql`
- Products and categories
- Customers and administrators
- Orders and order items
- Delivery zones
- Pickup locations
- Payment method records

## Project Structure

```text
earns-electronics/
├── admin/
│   ├── delete_product.php
│   ├── index.php
│   ├── login.php
│   ├── logout.php
│   ├── order.php
│   └── product.php
├── api/
│   ├── checkout.php
│   ├── orders.php
│   └── products.php
├── assets/
│   ├── css/
│   │   └── store.css
│   ├── js/
│   │   └── store.js
│   └── uploads/
│       └── .gitkeep
├── customer/
│   ├── account.php
│   ├── login.php
│   ├── logout.php
│   └── register.php
├── config.php
├── database.sql
├── index.php
├── tools_create_admin.php
├── .env.example
├── .gitignore
└── README.md
```

## Requirements

- Windows, Linux or macOS
- PHP 8.0+
- MySQL 5.7+ or MariaDB
- Apache
- XAMPP recommended for local development

## Run with XAMPP

1. Install XAMPP.
2. Start **Apache** and **MySQL**.
3. Copy this project folder into:

```text
C:\xampp\htdocs\earns-electronics
```

4. Open **phpMyAdmin**.
5. Create/import the database using:

```text
database.sql
```

6. Check `config.php` and make sure the database settings match your local MySQL setup.
7. Create an administrator account from a terminal opened in the project directory:

```bash
php tools_create_admin.php admin YourStrongPassword
```

8. Open the store:

```text
http://localhost/earns-electronics/
```

9. Open the administrator area:

```text
http://localhost/earns-electronics/admin/login.php
```

## GitHub Setup

Create a repository named:

```text
earns-electronics
```

Then from the project directory run:

```bash
git init
git add .
git commit -m "Initial Earns Electronics e-commerce project"
git branch -M main
git remote add origin YOUR_GITHUB_REPOSITORY_URL
git push -u origin main
```

The `.gitignore` prevents local environment files, uploaded images, logs, and other development files from being committed accidentally.

## Important Security Notes

**Do not commit passwords, M-Pesa production credentials, API secrets, database passwords, or private keys to GitHub.**

Use `.env.example` as a template for local configuration. Before deploying publicly, move secrets to protected environment variables or your hosting provider's secret-management system.

The included `config.php` is suitable as a simple XAMPP development configuration. It should be hardened before production deployment.

## M-Pesa Integration

The order system includes the payment method structure needed for M-Pesa, but a real Safaricom Daraja integration requires:

- Daraja consumer key
- Daraja consumer secret
- Shortcode
- Passkey
- Public HTTPS callback URL
- Production credentials after testing

Do not publish real Daraja credentials in this repository.

## Before Going Live

Add or verify:

- HTTPS
- Secure session cookies
- Strong admin passwords
- Server-side upload validation
- File-size and MIME-type restrictions
- Rate limiting
- Database backups
- Error logging without exposing sensitive information
- Email/SMS order notifications
- Real M-Pesa payment processing
- Shipping/delivery integration
- Production database credentials
- Regular security updates

## Development

This repository is intended as a practical starting point for **Earns Electronics & Mobile Store**. Test all checkout, stock, authentication, file-upload and payment flows in a safe development environment before accepting real customer payments.

## License

This project can be adapted for the Earns Electronics & Mobile Store. Add a formal open-source license only if you intend to make the source available under those terms.
