# New Sound For Japan

Source code for the newsoundforjapan.com website.

Japan's Artists, Venues and Events all in one place.

## 1.0 Feature Roadmap

### For Artists

- Connect to Google Calendar, and automatically sync your availability.
- Get paid before your gig, hazzle free.
- Direct access to the promoter. Managers not required. If something goes wrong, we're here to help.

### For Organizers and Promoters

- Book multiple artists at once

### For everyone

- Use email as main communication tool and handle payments through the website
- Don't speak Japanese? Don't speak English? Our human agents will translate all messages for you. For free.

## 2.0

- Tour planning features
- Ticket sales

## Get started

This is a simple Rails 5 application. To get started with development, first install rails and then follow these steps:

Clone the repository:

    git clone git@github.com:buhrmi/newsoundforjapan.git
    
Install the bundle and run the server:

    cd newsoundforjapan
    bundle install
    rails s
    
The server is now running at `localhost:3000`

## Environment configuration

Some parts of the application might not work unless the following environment variables are set:

    AWS_ACCESS_KEY, AWS_SECRET_KEY, CURL_TIMEOUT, DATABASE_URL, DOKKU_APP_RESTORE, DOKKU_NGINX_PORT, DOMAIN_NAME, DRAGONFLY_SECRET, FACEBOOK_APP_ID, FACEBOOK_APP_SECRET, SECRET_KEY_BASE, SENDGRID_PASSWORD, SENDGRID_USERNAME, SOUNDCLOUD_APP_ID, SOUNDCLOUD_APP_SECRET, STRIPE_PUBLIC_KEY, STRIPE_SECRET_KEY
