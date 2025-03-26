FROM ruby:3.4.1

# Create a non-root user
RUN addgroup --gid 1000 appgroup && \
    adduser --uid 1000 --gid 1000 --disabled-password --gecos "" appuser

# Set the working directory
WORKDIR /app

# Copy the Gemfile and Gemfile.lock into the image
COPY docker/scripts/Gemfile docker/scripts/Gemfile.lock ./

# Change the ownership of the files to the non-root user
RUN chown -R appuser:appgroup /app

# Set the user to the non-root user
USER appuser

# Install dependencies
RUN bundle install

# Copy the rest of your application code
COPY docker/scripts/setup.rb /app/setup.rb

# Set the entrypoint to run the script
ENTRYPOINT ["ruby", "/app/setup.rb"]