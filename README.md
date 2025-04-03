# BeachFireGuy - Beach Rental Service Platform

![BeachFireGuy Logo](https://via.placeholder.com/150x50?text=BeachFireGuy+Logo) *(add your actual logo path here)*

## Overview

BeachFireGuy is a rental service platform that allows users to book beach fire setups and rent equipment based on their chosen date. The application provides a seamless booking experience with integrated calendar management for administrators.

## Key Features

### For Users
- 📅 Date-based equipment rental booking system
- 🔍 Browse available rental equipment
- 💳 Secure payment processing
- 📧 Booking confirmation notifications

### For Administrators
- 🗓 Google Calendar integration for reservation tracking
- 📊 Comprehensive admin dashboard
- 📦 Inventory management system
- 👥 User activity monitoring

## Technology Stack

### Backend
- **Ruby** 3.0.0
- **Rails** 7.0.4
- **PostgreSQL** (Database)

### Frontend
- **Bootstrap 5** (UI Framework)
- **Hotwire** (Modern frontend approach)

### Infrastructure
- **Docker** (Containerization)
- **AWS S3** (File storage)

### Integrations
- Google Calendar API
- Stripe Payment Processing

## Screenshots

*(Add actual screenshot paths here)*
![Booking Page](screenshots/booking.png) 
![Admin Dashboard](screenshots/admin.png)

## Installation

### Prerequisites
- Ruby 3.0.0
- PostgreSQL
- Node.js
- Yarn

### Setup Instructions

```bash
# Clone the repository
git clone https://github.com/yourusername/BeachFireGuy.git
cd BeachFireGuy

# Install dependencies
bundle install
yarn install

rails assets:precompile

# Set up database
rails db:create db:migrate db:seed

# Configure environment variables
cp .env.example .env
# Edit .env with your actual credentials

# Start the server
rails server