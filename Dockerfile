FROM ruby:3.4

# Set the working directory
WORKDIR /site

# Copy the site files
COPY blog /site

# Install site dependencies
RUN bundle install

# Build the site
RUN bundle exec jekyll build

# Copy the built site to a separate directory
RUN mkdir /output && cp -r _site/* /output/

# Expose Jekyll default port
EXPOSE 4000

# Serve the site
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0", "--watch", "--drafts"]
