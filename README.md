# Campus Events

A responsive, multi-page static website showcasing campus events, travel packages, and destinations. Built as a DevOps fundamentals course assignment, featuring modern containerization with Docker and version control best practices.

## Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Tech Stack](#tech-stack)
- [Project Structure](#project-structure)
- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
  - [Development](#development)
  - [Production Build](#production-build)
- [Docker Setup](#docker-setup)
- [Pages](#pages)
- [Team](#team)
- [Contributing](#contributing)
- [License](#license)

## Overview

Campus Events is a fully responsive website designed to promote campus events, tour packages, and destinations. The project demonstrates practical application of DevOps concepts including containerization, version control, and CI/CD practices in a collaborative team environment.

## Features

- **📱 Responsive Design** - Mobile-first approach with CSS Grid and Flexbox
- **🎨 Multiple Pages** - Home, Destinations, Packages, Gallery, and Contact
- **🐳 Docker Support** - Multi-stage Docker build for optimized image size
- **⚡ Fast Loading** - Static site bundled with Parcel for performance
- **🎯 Event Categories** - Browse events by Music, Tech, Art, Sports, Education, and Food
- **📦 Travel Packages** - Curated tour packages with dates and descriptions
- **📸 Image Gallery** - Showcase of campus events with hover effects
- **📧 Contact Form** - Get in touch with the team
- **🌐 Navigation** - Seamless navigation across all pages

## Tech Stack

- **Frontend**: HTML5, CSS3
- **Bundler**: [Parcel v2.16.4](https://parceljs.org/)
- **Containerization**: Docker & Docker Compose
- **Web Server**: Nginx (Alpine Linux)
- **Runtime**: Node.js 20 LTS (Alpine Linux for builds)
- **Version Control**: Git & GitHub

## Project Structure

```
campus-events/
├── src/                          # Source HTML files
│   ├── index.html               # Home page with event categories
│   ├── destination.html         # University & team introduction
│   ├── packages.html            # Travel packages showcase
│   ├── gallery.html             # Event gallery
│   └── contact.html             # Contact form & social links
├── styles/
│   └── style.css                # Global styles for all pages
├── dist/                        # Built output (generated)
├── Dockerfile                   # Multi-stage Docker configuration
├── .dockerignore                # Docker ignore patterns
├── package.json                 # Project dependencies & scripts
├── package-lock.json            # Locked dependencies
└── README.md                    # This file
```

## Getting Started

### Prerequisites

- **Node.js** (v20 or higher recommended)
- **npm** (v9 or higher)
- **Docker** (optional, for containerized deployment)

### Installation

1. **Clone the repository:**

   ```bash
   git clone <repository-url>
   cd campus-events
   ```

2. **Install dependencies:**
   ```bash
   npm install
   ```

### Development

Start the Parcel development server with hot module replacement:

```bash
npm start
```

The site will be available at `http://localhost:1234` and will automatically reload when you make changes.

### Production Build

Build the site for production:

```bash
npm run build
```

or using Parcel directly:

```bash
npx parcel build src/*.html --dist-dir dist --public-url ./
```

The optimized static files will be generated in the `dist/` directory.

## Docker Setup

### Building the Docker Image

Build the Docker image locally:

```bash
docker build -t campus-events:latest .
```

### Running with Docker

Run the containerized application:

```bash
docker run -p 8000:80 campus-events:latest
```

Visit `http://localhost:8000` in your browser.

### Docker Compose (Optional)

Create a `docker-compose.yml` if you need multi-container orchestration:

```yaml
version: "3.8"
services:
  web:
    build: .
    ports:
      - "8000:80"
    container_name: campus-events
```

Then run:

```bash
docker-compose up --build
```

### Docker Configuration Details

The `Dockerfile` uses a **multi-stage build** approach:

1. **Stage 1 - Builder**: Node.js 20 Alpine
   - Installs dependencies
   - Runs Parcel build process
   - Creates optimized dist folder

2. **Stage 2 - Nginx**: Nginx Alpine
   - Serves static files from dist folder
   - Minimal image size (~21MB)
   - Efficient production container

## Pages

### 🏠 Home (index.html)

- **Purpose**: Landing page introducing the platform
- **Content**: Event categories (Music, Tech, Art, Sports, Education, Food)
- **Navigation**: Links to all other pages

### 🎓 Destinations (destination.html)

- **Purpose**: University introduction and team showcase
- **Content**:
  - University DevOps course information
  - Team member profiles with roles
  - Project background and context

### 📦 Packages (packages.html)

- **Purpose**: Travel packages and event offerings
- **Content**:
  - Featured tour packages (Murree, Lahore Heritage, etc.)
  - Package details with dates and descriptions
  - Booking buttons for each package

### 🖼️ Gallery (gallery.html)

- **Purpose**: Visual showcase of campus events
- **Content**:
  - Responsive image grid
  - Hover effects with overlay descriptions
  - Event photo collection

### 📧 Contact (contact.html)

- **Purpose**: Communication channel with visitors
- **Content**:
  - Contact form (name, email, message)
  - Social media links (Facebook, Instagram, Email)
  - Call-to-action for inquiries

## Team

| Role     | Name                                                      | Responsibilities                                   |
| -------- | --------------------------------------------------------- | -------------------------------------------------- |
| Lead     | Adnan Alam ([@A-D-H-I-56](https://github.com/A-D-H-I-56)) | Project initialization, Docker Hub consolidation   |
| Member 1 | Saleha Shahid                                             | Destination page & team intro, local Docker builds |
| Member 2 | Sana Nadeem                                               | Packages page & sample events                      |
| Member 3 | Owais Murtaza                                             | Gallery page & visual resources                    |
| Member 4 | Muhammad Aliyan                                           | Additional contributions                           |

## Contributing

This project is part of a DevOps course assignment. To contribute:

1. Create a feature branch: `git checkout -b feature/your-feature`
2. Commit your changes: `git commit -am 'Add new feature'`
3. Push to the branch: `git push origin feature/your-feature`
4. Submit a pull request to `develop` branch

### Development Workflow

- **Main Branch**: Production-ready code
- **Develop Branch**: Integration branch for features
- **Feature Branches**: Individual feature development (feature/\*)

## Deployment

### Local Deployment

```bash
npm run build
# Serve dist/ folder using your preferred web server
```

### Docker Hub Deployment

```bash
docker tag campus-events:latest <your-dockerhub-username>/campus-events:latest
docker push <your-dockerhub-username>/campus-events:latest
```

### Nginx Configuration

The Docker image uses Nginx with the following configuration:

- **Root Directory**: `/usr/share/nginx/html`
- **Port**: 80
- **Process**: Runs in foreground (`daemon off;`)

## Performance Features

- **Parcel Bundling**: Automatic code splitting and asset optimization
- **CSS Optimization**: Minification and vendor prefixing
- **Image Compression**: Handled by build pipeline
- **Alpine Linux Base**: Minimal Docker image size
- **Multi-stage Build**: Reduces final image footprint

## Browser Compatibility

- Chrome (latest)
- Firefox (latest)
- Safari (latest)
- Edge (latest)
- Mobile browsers (iOS Safari, Chrome Mobile)

## Troubleshooting

### Parcel Build Issues

```bash
# Clear cache and rebuild
rm -rf .parcel-cache dist/
npm run build
```

### Docker Build Problems

```bash
# Remove intermediate images and rebuild
docker system prune -a
docker build -t campus-events:latest .
```

### Port Already in Use

```bash
# Change port in development:
npm start -- --port 3000

# For Docker, use different port:
docker run -p 9000:80 campus-events:latest
```

## Environment Files

A `.gitignore` file is configured to exclude:

- `node_modules/` - Dependencies (installed via npm)
- `dist/` - Build output
- `.parcel-cache/` - Build cache
- `.DS_Store` - macOS system files

## License

ISC License - See LICENSE file for details

**Project Version**: 2.0 | **Last Updated**: April 2026

_Developed as part of the DevOps Fundamentals course_
