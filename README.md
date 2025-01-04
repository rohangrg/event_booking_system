# Event Booking System

## Overview

This is a simple event booking system built using Ruby on Rails. The system allows users to:

- Create and manage events.
- Book tickets for events.
- View events and the tickets they have booked.
- Register and log in using Devise for user authentication.

### Key Features:
- User Registration & Authentication (Devise)
- Event Creation and Management
- Ticket Booking with Concurrency Handling
- minimal design using Bootstrap

## Requirements

- Ruby version: ruby-3.3.0 (or compatible version)
- Rails version: 7.1.5.1 or higher
- PostgreSQL

## Installation

### 1. Clone the repository

```bash
git clone https://github.com/yourusername/event_booking_system.git
cd event_booking_system
```

### 2. Run the following commands

```bash
bundle install
rails db:migrate
rails dev:cache
rails s
```

### 3. Follow the steps
```bash
Visit localhost - > http://localhost:3000
create account
