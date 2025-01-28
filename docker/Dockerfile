FROM ruby:3.4.1

# Create a non-root user
RUN addgroup --gid 1000 appgroup && \
    adduser --uid 1000 --gid 1000 --disabled-password --gecos "" appuser

# Set the user to the non-root user
USER appuser

# Create a directory for the script
WORKDIR /app

# Copy the script into the container
COPY docker/scripts/setup.rb /app/setup.rb

# Define build argument
ARG COMMIT_SHA

# Set environment variable
ENV COMMIT_SHA=${COMMIT_SHA}

# Set the entrypoint to run the script
ENTRYPOINT ["ruby", "/app/setup.rb"]