# Odin Book – Social Media App (Rails 8)

A full-stack social media application inspired by Twitter, built as part of **[The Odin Project – Odin Book](https://www.theodinproject.com/lessons/ruby-on-rails-odin-book)** curriculum.

This project was intentionally designed to demonstrate my **job readiness for a Ruby on Rails position**. It showcases modern Rails conventions, Hotwire-driven interactivity, authentication best practices, testing discipline, and production-ready deployment patterns.

---

## Project Intent

The primary goal of this application is to demonstrate:

* Understanding of **modern Rails (Rails 8)**
* MVC architecture and RESTful design
* Hotwire (Turbo + Stimulus) interactivity
* Authentication and OAuth integration
* Database-backed relationships and associations
* Test coverage with RSpec
* Production email configuration
* Pagination & performance considerations
* Responsive and accessible UI design

---

## Tech Stack

### Backend

* **Ruby 3.3.5**
* **Rails 8.0.3**
* **PostgreSQL**
* **Active Storage** (user profile images)
* **Devise** (authentication)
* **GitHub OAuth** (third-party login)
* **Pagy** (pagination + infinite scroll)
* **Mailgun** (production email delivery)

### Frontend

* **Tailwind CSS**

  * Responsive small/medium screen navigation
  * Dark / Light mode toggle
* **Turbo (Hotwire)**

  * Single-page feel interactions
* **Stimulus**

  * Dynamic user search
  * Interactive UI behaviors

### Testing & Dev Tools

* **RSpec**

  * Model specs (ActiveRecord associations)
  * Basic system tests (authentication flows, page loading)
* **Guard**

  * Continuous test execution during development
* **Letter Opener**

  * Local email preview in development

---

## Core Features

### Authentication & Authorization

* User registration and login via **Devise**
* GitHub OAuth login integration
* Secure session handling
* Welcome emails for new users (Mailgun in production)

### Posts

* Users can create posts
* Posts paginate at **10 per page**
* Infinite scroll via **Pagy lazy loading**
* Turbo-powered post creation without full page reload

### Likes

* Like/unlike posts dynamically
* Turbo streams update like counts in real-time

### Comments

* Users can comment on posts
* Comments load and submit via Turbo for SPA-style experience

### Friend Connections

* Users can send and accept friend requests
* Turbo-powered updates for adding/removing friends
* Stimulus-enhanced user search for discovering other users

### Profile Images

* Users upload avatars via **Active Storage**

### UI/UX

* Responsive navigation bars (mobile & tablet friendly)
* Dark/Light mode toggle
* Clean, modern Tailwind design

---

## Architectural Highlights

### RESTful Design

All core resources follow Rails conventions:

* Users
* Posts
* Comments
* Likes
* Friendships

Associations are properly modeled and validated using ActiveRecord best practices.

### Hotwire-First Interactivity

Instead of relying on heavy JavaScript frameworks, this app uses:

* **Turbo Frames & Streams** for dynamic UI updates
* **Stimulus controllers** for focused JS behavior

This keeps the frontend lightweight while maintaining a modern, interactive feel.

### Database Design

* PostgreSQL relational schema
* Proper foreign keys and associations
* Optimized pagination with Pagy

---

## Testing Strategy

Testing reflects production-readiness and professional workflow expectations.

### RSpec

* Model specs validate associations and core logic
* System specs ensure:

  * Authentication flows work
  * Key pages load successfully

### Guard

* Runs RSpec automatically on file changes
* Encourages TDD-style rapid feedback loops

---

## Email Workflow

* **Development**: Letter Opener previews emails in-browser
* **Production**: Mailgun sends real transactional emails
* Welcome email automatically delivered to new users

---

## Installation

```bash
git clone <repo_url>
cd <repo_name>

bundle install
rails db:create
rails db:migrate
rails db:seed

bin/dev
```

Ensure you have:

* Ruby 3.3.5
* PostgreSQL installed and running
* Environment variables configured for:

  * GitHub OAuth
  * Mailgun (production)

---

## Performance Considerations

* Paginated posts (10 per page)
* Infinite scroll lazy loading
* Turbo-based partial updates
* Database-backed associations with proper indexing

---

## What This Project Demonstrates

* Ability to build a full CRUD Rails application
* Competence with modern Rails 8 ecosystem
* Experience integrating authentication + OAuth
* Familiarity with Hotwire and SPA-like UX patterns
* Solid testing foundation using RSpec
* Understanding of deployment-ready email systems
* Clean UI using Tailwind
* Practical database modeling with PostgreSQL

This project reflects how I would structure and implement features in a real production Rails environment.

---

## Acknowledgment

Built as part of **The Odin Project – Odin Book** curriculum, with additional enhancements to reflect production-grade Rails development practices.

---

If you're reviewing this project as part of a hiring process, I’d be happy to walk through architectural decisions, tradeoffs, and future scalability improvements.