# Odin Book – Social Media App
OdinBook is a full-stack social media application inspired by Twitter, built as part of **[The Odin Project – Odin Book](https://www.theodinproject.com/lessons/ruby-on-rails-odin-book)** curriculum.

This project was intentionally designed to demonstrate my **knowledge gained so far with Ruby on Rails development**. It showcases modern Rails conventions, Hotwire-driven interactivity, authentication best practices, testing discipline, and production-ready deployment patterns.

Please check out my deployed App [HERE](https://www.example.com). Allow a few seconds for the app to load on render.
Guests can log in with their own e-mail, GitHub Oauth, or with any of the pre-made accounts using the following user logins, with a password of: ```password```  
luke@rebels.com  
leia@rebels.com  
han@rebels.com  
chewbacca@rebels.com  

If using your e-mail to create an account, please check for a welcome e-mail, which could be in your junk folder!

---

## Project Intent

The primary goal of this application is to demonstrate:

* Understanding of modern Rails (Rails 8)
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
* GitHub **OAuth** login integration
* Secure session handling
* **Welcome emails** for new users (Mailgun in production)

### Posts

* Users can create posts
* Posts paginate at **10 per page**
* Infinite scroll via **Pagy lazy loading**
* Turbo-powered post creation without full page reload

### Likes

* Like/unlike posts dynamically
* **Turbo streams** update like counts in real-time

### Comments

* Users can comment on posts
* Comments load and submit via **Turbo** for SPA-style experience

### Friend Connections

* Users can send and accept friend requests
* **Turbo**-powered updates for adding/removing friends
* **Stimulus**-enhanced user search for discovering other users

### Profile Images

* Users upload avatars via **Active Storage**

### UI/UX

* Responsive navigation bars (mobile & tablet friendly)
* **Dark/Light** mode toggle
* Clean, modern **Tailwind** design

---

## Architectural Highlights

### RESTful Design

All core resources follow Rails conventions:

* Users
* Posts
* Comments
* Likes
* Friendships

### Hotwire Interactivity

This app uses:

* **Turbo Frames & Streams** for dynamic UI updates
* **Stimulus controllers** for focused JS behavior

This keeps the frontend lightweight while maintaining a modern, interactive feel.

### Database Design

Odinbook uses a PostgreSQL relational DB, using the following schema:
##### Users
* Managed via Devise (email/password + OAuth support via provider and uid)
* Optional profile fields (name, bio)
* Avatar support via Active Storage
##### Posts
* belongs_to :user
* Indexed on user_id
##### Comments
* belongs_to :user
* belongs_to :post
* Indexed on both post_id and user_id
##### Likes
* Join-style table connecting users and posts
* Indexed on user_id and post_id
##### Connections (Friendships)
* follower_id and followee_id model directional connections
* accepted boolean supports pending vs. confirmed friendships
##### Active Storage
* Uses Rails’ built-in blob + attachment tables
* Supports user avatar uploads with variant tracking
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
git clone https://github.com/megpeer/odinbook
cd odinbook

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